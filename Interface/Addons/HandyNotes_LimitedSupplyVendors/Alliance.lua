
if UnitFactionGroup("player") ~= "Alliance" then return end


local _, LimitedSupplyVendors = ...
local points = LimitedSupplyVendors.points
-- points[<mapfile>] = { [<coordinates>] = <quest ID> }

--inv_scroll_03 - basic
--inv_scroll_04 - gold
--inv_scroll_05 - blue
--inv_scroll_06 - green


-- Grey    cff9d9d9d
-- Red     cffDF0101 
-- Blue    cff0070dd
-- Green   cff1eff00
-- White   cffffffff
-- Orange  cffff8000
-- Purple  cffa335ee
-- Teal    cff00ccff
-- Tan     cffe5cc80


--Add new timewalking areas  ie, Arathi, Darkshore, Undercity  etc.

--Add cost of each item?   //.. GetCoinTextureString(ActualGold)

----------------------
-- Eastern Kingdoms --
----------------------
points[14] = { -- "Arathi"
	[40084800] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jannos Ironwill|r", --Vendor Name
		info = "|cffFFFFFFPlans: Solid Iron Maul|r", --tooltip display
		coords = 40084800, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40044808] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Hammon Karwn|r", --Vendor Name
		info = "|cffFFFFFFDesign: Ruby Crown of Restoration|r |cffFFFFFF\nPattern: Barbaric Leggings|r", --tooltip display
		coords = 40044808, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40064802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Drovnar Strongbrew|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Frost Protection Potion|r", --tooltip display
		coords = 40064802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[39064808] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Narj Deepslice|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Barbecued Buzzard Wing|r |cff0080FFAlly only|r", --tooltip display
		coords = 39064808, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[39024802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Androd Fadran|r", --Vendor Name
		info = "|cff1EFF0BPattern: Raptor Hide Belt|r |cff0080FFAlly only|r", --tooltip display
		coords = 39024802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}

points[15] = { -- "Badlands"
	[65003808] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410'Chef' Overheat|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Undermine Clam Chowder|r", --tooltip display
		coords = 65003808, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[91003804] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Buckslappy|r", --Vendor Name
		info = "|cffFFFFFFSchematic: EZ-Thro Dynamite II|r |cffFFFFFF\nSchematic: Blue Firework|r |cffFFFFFF\nSchematic: Green Firework|r |cffFFFFFF\nSchematic: Red Firework|r", --tooltip display
		coords = 91003804, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[17] = { -- "BlastedLands"
	[62041600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nina Lightbrew|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Demonslaying|r", --tooltip display
		coords = 62041600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[27] = { -- "DunMorogh"
	[17087406] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410High Admiral 'Shelly' Jorrik|r", --Vendor Name
		info = "|cffFFFFFFPlans: Solid Iron Maul|r", --tooltip display
		coords = 17087406, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

}

points[47] = { -- "Duskwood"
	[81081908] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kzixx|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Holy Protection Potion|r |cffFFFFFF\nSchematic: Goblin Jumper Cables|r", --tooltip display
		coords = 81081908, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[75084504] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Danielle Zipstitch & Sheri Zipstich|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bright Yellow Shirt|r |cff0080FFAlly only|r |cffFFFFFF\nPattern: Greater Adept's Robe|r |cffFFFFFF\nPattern: Dark Silk Shirt|r", --tooltip display
		coords = 75084504, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

}

points[23] = { -- "EasternPlaguelands"
	[74025100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jase Farlane|r", --Vendor Name
		info = "|cffFFFFFFDesign: Ring of Bitter Shadows|r", --tooltip display
		coords = 74025100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

}

points[37] = { -- "Elwynn"
	[42006700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Tharynn Bouden|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Vest|r", --tooltip display
		coords = 42006700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[83026606] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Drake Lindgren|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Robe|r", --tooltip display
		coords = 83026606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[25] = { -- "HillsbradFoothills"
	[71024502] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zan Shivsproket|r All the way up", --Vendor Name
		info = "|cffFFFFFFSchematic: Gnomish Cloaking Device", --tooltip display
		coords = 71024502, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[44002108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Bro'kin|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Frost Oil|r", --tooltip display
		coords = 44002108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56004604] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zixil !WANDERING!|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Boots - Minor Agility|r |cffFFFFFF\nPattern: Earthen Leather Shoulders|r |cffFFFFFF\nPattern: Red Woolen Bag|r |cffFFFFFF/nSchematic: Goblin Jumper Cables|r", --tooltip display
		coords = 56004604, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}


points[26] = { -- "Hinterlands"
	[34063804] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gigget Zipcoil|r", --Vendor Name
		info = "|cffFFFFFFPattern: Ironfeather Shoulders|r", --tooltip display
		coords = 34063804, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[34023708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Ruppo Zipcoil|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Mithril Mechanical Dragonling|r", --tooltip display
		coords = 34023708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[13064408] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Harggan|r", --Vendor Name
		info = "|cffFFFFFFPlans: Mithril Scale Bracers|r", --tooltip display
		coords = 13064408, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[13044302] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nioma|r", --Vendor Name
		info = "|cff1EFF0BPattern: Nightscape Shoulders|r", --tooltip display
		coords = 13044302, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[87] = { -- "Ironforge"
	[40023304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Bombus Finespindle|r", --Vendor Name
		info = "|cffFFFFFFPattern: Heavy Leather Ball|r |cffFFFFFF\nFormula: Enchant 2H Weapon - Lesser Intellect|r", --tooltip display
		coords = 40023304, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[47060706] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Transy Puddlefizz|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Slitherskin Mackerel|r |cffFFFFFF\nRecipe: Longjaw Mud Snapper|r |cffFFFFFF\nRecipe: Rockscale Cod|r |cffFFFFFF\nRecipe: Mithril Head Trout|r", --tooltip display
		coords = 47060706, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[46062806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Burbik Gearspanner|r", --Vendor Name
		info = "|cffFFFFFFDesign: Opal Necklace of Impact|r |cffFFFFFF\nDesign: The Jade Eye|r", --tooltip display
		coords = 46062806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[68024400] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gearcutter Cogspinner|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Blue Firework|r |cffFFFFFF\nSchematic: Gnomish Universal Remote|r |cff0080FFAlly only|r", --tooltip display
		coords = 68024400, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66065406] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Soolie Berryfizz|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Free Action Potion|r |cffFFFFFF\nRecipe: Elixir of Superior Defense|r", --tooltip display
		coords = 66065406, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[44022906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Outfitter Eric|r Upstairs and Good-looking!", --Vendor Name
		info = "|cffFFFFFFPattern: Lavender Mageweave Shirt|r |cffFFFFFF\nPattern: Pink Mageweave Shirt|r |cffFFFFFF\nPattern: Tuxedo Shirt|r |cffFFFFFF\nPattern: Tuxedo Pants|r |cffFFFFFF\nPattern: Tuxedo Jacket|r", --tooltip display
		coords = 44022906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[48] = { -- "LochModan"
	[35064900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Drac Roughcut|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Smoked Bear Meat|r", --tooltip display
		coords = 35064900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[36004600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Rann Flamespinner|r", --Vendor Name
		info = "|cffFFFFFFPattern: Greater Adept's Robe|r |cffFFFFFF\nPattern: Red Woolen Bag|r", --tooltip display
		coords = 36004600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40043904] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Khara Deepwater|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Loch Frenzy Delight|r |cff0080FFAlly only|r", --tooltip display
		coords = 40043904, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[82066302] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Xandar Goodbeard|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Rage Potion|r |cffFFFFFF\nRecipe: Holy Protection Potion|r", --tooltip display
		coords = 82066302, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[49] = { -- "Redridge Mountains"
	[78066306] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Clyde Ranthal|r", --Vendor Name
		info = "|cffFFFFFFPattern: Black Whelp Cloak|r |cff0080FFAlly only|r", --tooltip display
		coords = 78066306, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[28024304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Amy Davenport|r", --Vendor Name
		info = "|cffFFFFFFPattern: Black Whelp Tunic|r |cff0080FFAlly only|r |cffFFFFFF\nPattern: Red Woolen Bag|r", --tooltip display
		coords = 28024304, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[32] = { -- "SearingGorge"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[84] = { -- "StormwindCity"
	[64067106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Edna Mullby|r", --Vendor Name
		info = "|cffFFFFFFDesign: Heavy Golden Necklace of Battle|r", --tooltip display
		coords = 64067106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42067608] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Darian Singh|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Blue Firework|r", --tooltip display
		coords = 42067608, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55068506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Maria Lumere|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Elixir of Shadow Power|r", --tooltip display
		coords = 55068506, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53007402] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jessara Cordell|r", --Vendor Name
		info = "|cffFFFFFFFormula: Minor Wizard Oil|r |cffFFFFFF\nFormula: Minor Mana Oil|r |cffFFFFFF\nFormula: Lesser Wizard Oil|r |cffFFFFFF\nPattern: Enchanted Mageweave Pouch|r", --tooltip display
		coords = 53007402, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53028106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Alexandra Bolero|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Overalls|r |cffFFFFFF\nPattern: White Wedding Dress|r", --tooltip display
		coords = 53028106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[76065306] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kendor Kabonka|r Upstairs", --Vendor Name
		info = "|cffFFFFFFRecipe: Goretusk Liver Pie|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Crocolisk Steak|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Murloc Fin Soup|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Redridge Goulash|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Crocolisk Gumbo|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Curiously Tasty Omelet|r |cffFFFFFF\nRecipe: Blood Sausage|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Beer Basted Boar Ribs|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Gooey Spider Cake|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Succulent Pork Ribs|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Seasoned Wolf Kabob|r |cff0080FFAlly only|r", --tooltip display
		coords = 76065306, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[77065302] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Erika Tate|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Smoked Sagefish|r |cffFFFFFF\nRecipe: Sagefish Delight|r", --tooltip display
		coords = 77065302, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55006906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Catherine Leland|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Brilliant Smallfish|r |cffFFFFFF\nRecipe: Rainbow Fin Albacore|r |cffFFFFFF\nRecipe: Bristle Whisker Catfish|r", --tooltip display
		coords = 55006906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[63023706] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kaita Deepforge|r", --Vendor Name
		info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
		coords = 63023706, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[50] = { -- "NorthernStranglethorn"
	[43062300] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jaquilina Dramet|r", --Vendor Name
		info = "|cffFFFFFFPlans: Massive Iron Axe|r", --tooltip display
		coords = 43062300, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[67066100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gnaz Blunderflame & Knaz Blunderflame|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Mechanical Dragonling|r |cffFFFFFF\nSchematic: Deadly Scope|r", --tooltip display
		coords = 67066100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[47041002] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Corporal Bluth|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Roast Raptor|r |cffFFFFFF\nRecipe: Jungle Stew|r", --tooltip display
		coords = 47041002, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[224] = { -- "StranglethornVale"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[51] = { -- "SwampOfSorrows"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[210] = { -- "TheCapeOfStranglethorn"
	[42087400] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Blixrez Goodstitch|r", --Vendor Name
		info = "|cff1EFF0BPattern: Thick Murloc Armor|r |cff1EFF0B\nPattern: Murloc Scale Bracers|r", --tooltip display
		coords = 42087400, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42086904] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zarena Cromwind|r", --Vendor Name
		info = "|cffFFFFFFPlans: Moonsteel Broadsword|r", --tooltip display
		coords = 42086904, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42066902] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Narkk|r", --Vendor Name
		info = "|cffFFFFFFPattern: Black Swashbuckler's Shirt|r", --tooltip display
		coords = 42066902, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42086900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kelsey Yance|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Giant Clam Scorcho|r |cffFFFFFF\nRecipe: Cooked Glossy Mightfish|r |cffFFFFFF\nRecipe: Filet of Redgill|r |cffFFFFFF\nRecipe: Hot Smoked Bass|r", --tooltip display
		coords = 42086900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43067300] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Xizk Goodstitch|r", --Vendor Name
		info = "|cffFFFFFFPattern: Enchanter's Cowl|r |cffFFFFFF\nPattern: Crimson Silk Cloak|r", --tooltip display
		coords = 43067300, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40088202] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Cowardly Crosby|r Inside House on Top Floor", --Vendor Name
		info = "|cffFFFFFFPattern: Admiral's Hat|r", --tooltip display
		coords = 40088202, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43027106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Rikqiz|r House on Main Floor", --Vendor Name
		info = "|cffFFFFFFPattern: Gem-Studded Leather Belt|r |cffFFFFFF\nPattern: Shadowskin Gloves|r", --tooltip display
		coords = 43027106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43007208] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Crazk Sparks|r House on Main Floor Entrance on Back", --Vendor Name
		info = "|cffFFFFFFSchematic: Green Firework|r", --tooltip display
		coords = 43007208, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[41067400] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jutak|r Outside on Main Floor", --Vendor Name
		info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
		coords = 41067400, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42067408] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Glyx Brewright|r House on Top Floor", --Vendor Name
		info = "|cffFFFFFFRecipe: Frost Protection Potion|r |cffFFFFFF\nRecipe: Nature Protection Potion|r", --tooltip display
		coords = 42067408, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42067208] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mrs. Gant|r Lowest Floor of the House", --Vendor Name
		info = "|cffFFFFFFRecipe: Undermine Clam Chowder|r", --tooltip display
		coords = 42067208, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[22] = { -- "WesternPlaguelands"
	[68007706] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Magnus Frostwake|r", --Vendor Name
		info = "|cff0A70D0Plans: Storm Gauntlets|r", --tooltip display
		coords = 68007706, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43008402] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Leonard Porter|r", --Vendor Name
		info = "|cffFFFFFFPattern: Wicked Leather Gauntlets|r |cffFFFFFF\nPattern: Stormshroud Pants|r", --tooltip display
		coords = 43008402, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[52] = { -- Westfall
	[36029000] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kriggon Talsone|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Clam Chowder|r |cff0080FFAlly only|r |cffFFFFFF\nRecipe: Spiced Chili Crab|r", --tooltip display
		coords = 36029000, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[57065308] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gina MacGregor|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Overalls|r |cffFFFFFF\nPattern: Murloc Scale Breastplate|r |cffFFFFFF\nPattern: Murloc Scale Belt|r |cffFFFFFF\nPattern: Red Linen Bag|r", --tooltip display
		coords = 57065308, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[56] = { -- "Wetlands"
	[10005900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jennabink Powerseam|r", --Vendor Name
		info = "|cffFFFFFFPattern: Greater Adept's Robe|r |cffFFFFFF\nPattern: Red Woolen Bag|r", --tooltip display
		coords = 10005900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[25062508] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Wenna Silkbeard|r In an underground House", --Vendor Name
		info = "|cffFFFFFFPattern: Red Whelp Gloves|r |cff0080FFAlly only|r |cffFFFFFF\nPattern: Green Leather Armor|r |cffFFFFFF\nPattern: Azure Silk Gloves|r", --tooltip display
		coords = 25062508, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[26082600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Fradd Swiftgear|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Minor Recombobulator|r", --tooltip display
		coords = 26082600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}


--------------
-- Kalimdor --
--------------

points[10] = { --"Northern Barrens"
	[68046902] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gagsprocket|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Green Firework|r |cffFFFFFF\nSchematic: Minor Recombobulator|r", --tooltip display
		coords = 68046902, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[67007304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Ranik|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Rage Potion|r |cffFFFFFF\nDesign: Wicked Moonstone Ring|r |cffFFFFFF\nPattern: Blue Linen Robe|r |cffFFFFFF\nPattern: Greater Adept's Robe|r", --tooltip display
		coords = 67007304, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}



points[63] = { -- "Ashenvale"
	[18026000] = {
		npcid = 34601, --NPC ID
		name = "|cffEEC410Harlown Darkweave|r 'Quest to Unlock @ 17.8, 49.4'", --Vendor Name
		info = "|cff1EFF0BPattern: Herbalist's Gloves|r |cff0080FFAlly only|r", --tooltip display
		coords = 18026000, --Cordinates to vendor
		items = {7361}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?		
		},

	[35005200] = {
		npcid = 3954, --NPC ID
		name = "|cffEEC410Dalria|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Bracer - Lesser Strength|r |cffFFFFFF\nDesign: Wicked Moonstone Ring|r |cff1EFF0B\nFormula: Enchant Cloak - Minor Agility|r", --tooltip display
		coords = 35005200, --Cordinates to vendor
		items = {11101, 20855, 11039}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?		
		},

	[34084908] = {
		npcid = 3958, --NPC ID
		name = "|cffEEC410Lardan|r", --Vendor Name
		info = "|cffFFFFFFPattern: Barbaric Leggings|r", --tooltip display
		coords = 34084908, --Cordinates to vendor
		items = {5973}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?		
		},

	[17084904] = {
		npcid = 24739, --NPC ID
		name = "|cffEEC410Benjari Edune|r Prequest for Harlown", --Vendor Name
		info = "|cffFFFFFFQuestname = Three Friends of the Forest|r", --tooltip display
		coords = 17084904, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?		
		},


}

points[97] = { -- "AzuremystIsle"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}


points[106] = { -- "BloodmystIsle"
	[53045606] = {
		npcid =  0000, --NPC ID
		name = "|cffEEC410Fazu|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Crunchy Spider Suprise|r", --tooltip display
		coords = 53045606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?		
		},
}

points[62] = { -- "Darkshore"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[89] = { -- "Darnassus"
	[60003702] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Saenorion UPSTAIRS & Elynna DOWNSTAIRS|r", --Vendor Name
		info = "|cffFFFFFFPattern: Barbaric Bracers|r |cff1EFF0B\nPattern: Green Whelp Bracers|r |cffFFFFFF\nPattern: Blue Linen Robe|r |cffFFFFFF\nPattern: Greater Adept's Robe|r |cffFFFFFF\nPattern: Orange Martial Shirt|r", --tooltip display
		coords = 60003702, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[54063906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Ulthir|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Free Action Potion|r |cffFFFFFF\nRecipe: Great Rage Potion|r", --tooltip display
		coords = 54063906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[58023500] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mythrin'dir|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Bracer - Dodge|r |cffFFFFFF\nDesign: Amulet of the Moon|r", --tooltip display
		coords = 58023500, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56065206] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Layna Karner|r", --Vendor Name
		info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
		coords = 56065206, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
		
}

points[66] = { -- "Desolace"
	[66020606] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Janet Hommers|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Heavy Kodo Stew|r", --tooltip display
		coords = 66020606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}

points[70] = { -- "Dustwallow"
	[66035104] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Helenia Olden|r", --Vendor Name
		info = "|cffFFFFFFDesign: Truesilver Crab|r |cffFFFFFF\nRecipe: Mystery Stew|r |cff0080FFAlly only|r |cffFFFFFF\nDesign: Black Pearl Panther|r |cffFFFFFF\nRecipe: Dragonbreath Chili|r |cff1EFF0B\nPattern: Murloc Scale Bracers|r", --tooltip display
		coords = 66035104, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}

points[77] = { -- "Felwood"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[69] = { -- "Feralas"
	[45044102] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Pratt McGrubben|r", --Vendor Name
		info = "|cff1EFF0BPattern: Green Whelp Bracers|r |cffFFFFFF\nPattern: Living Shoulders|r |cffFFFFFF\nPattern: Turtle Scale Gloves|r", --tooltip display
		coords = 45044102, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[46024106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Vivianna|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Hot Wolf Ribs|r |cffFFFFFF\nRecipe: Baked Salmon|r |cffFFFFFF\nRecipe: Lobster Stew|r", --tooltip display
		coords = 46024106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[46064300] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Logannas|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Nature Protection Potion|r |cffFFFFFF\nRecipe: Ghost Dye|r", --tooltip display
		coords = 46064300, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[80] = { -- "Moonglade"
		[48064002] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Lorelae Wintersong|r", --Vendor Name
		info = "|cffFFFFFFFormula: Enchant Cloak - Superior Defense|r |cffFFFFFF\nPattern: Felcloth Pants|r", --tooltip display
		coords = 48064002, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}


points[81] = { -- "Silithus"
	[55043606] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Calandrath|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Greater Nature Protection Potion|r", --tooltip display
		coords = 55043606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[81021806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zannok Hidepiercer|r", --Vendor Name
		info = "|cffFFFFFFPattern: Heavy Scorpid Bracers|r |cffFFFFFF\nPattern: Heavy Scorpid Helm|r", --tooltip display
		coords = 81021806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53083404] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mishta|r", --Vendor Name
		info = "|cffFFFFFFDesign: Emerald Crown of Destruction|r", --tooltip display
		coords = 53083404, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55063700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kania|r", --Vendor Name
		info = "|cffFFFFFFFormula: Lesser Mana Oil|r |cffFFFFFF\nFormula: Wizard Oil|r |cffFFFFFF\nPattern: Enchanted Runecloth Bag|r", --tooltip display
		coords = 55063700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	
}

points[199] = { -- "SouthernBarrens"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[65] = { -- "StonetalonMountains"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[71] = { -- "Tanaris"
	[50062806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Haughty Modiste & Vizzklick & Blizrik Buckshot|r", --Vendor Name
		info = "|cffFFFFFFPattern: Haliscan Pantaloons|r |cffFFFFFF\nPattern: Dress Shoes|r |cffFFFFFF\nPattern: Haliscan Jacket|r |cffFFFFFF\nPattern: Crimson Silk Robe|r |cffFFFFFF\nPattern: Soul Pouch|r |cffFFFFFF\nSchematic: EZ-Thro Dynamite II|r", --tooltip display
		coords = 50062806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[52062900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Dirge Quikcleave|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Tender Wolf Steak|r", --tooltip display
		coords = 52062900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[51023002] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Krinkle Goodsteel|r", --Vendor Name
		info = "|cffFFFFFFPlans: Golden Scale Coif|r", --tooltip display
		coords = 51023002, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[50082800] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Alchemist Pestlezugg|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Nature Protection Potion|r |cffFFFFFF\nRecipe: Philosopher's Stone|r |cffFFFFFF\nRecipe: Transmute Iron to Gold|r |cffFFFFFF\nRecipe: Transmute Mithril to Truesilver|r |cffFFFFFF\nRecipe: Transmute Arcanite|r", --tooltip display
		coords = 50082800, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[103] = { -- "TheExodar"
	[53009000] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Feera|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Adamantite Rifle|r |cffFFFFFF\nSchematic: White Smoke Flare|r |cffFFFFFF\nSchematic: Fel Iron Toolbox|r", --tooltip display
		coords = 53009000, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[27086108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Altaa|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Camouflage|r |cff1EFF0B\nRecipe: Transmute Primal Might|r", --tooltip display
		coords = 27086108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[61008900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Arras|r", --Vendor Name
		info = "|cffFFFFFFPlans: Adamantite Dagger|r |cffFFFFFF\nPlans: Adamantite Maul|r |cffFFFFFF\nPlans: Adamantite Cleaver|r |cffFFFFFF\nPlans: Adamantite Rapier|r", --tooltip display
		coords = 61008900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[39083908] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Egomis|r", --Vendor Name
		info = "|cffFFFFFFFormula: Superior Mana Oil|r |cffFFFFFF\nFormula: Large Prismatic Shard|r |cffFFFFFF\nFormula: Superior Wizard Oil|r", --tooltip display
		coords = 39083908, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66067400] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Haferet|r", --Vendor Name
		info = "|cffFFFFFFPattern: Comfortable Insoles|r", --tooltip display
		coords = 66067400, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[64066806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Neii|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bolt of Soulcloth|r", --tooltip display
		coords = 64066806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[45002506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Arred|r", --Vendor Name
		info = "|cffFFFFFFDesign: Opal Necklace of Impact|r |cffFFFFFF\nDesign: The Jade Eye|r |cffFFFFFF\nDesign: Heavy Golden Necklace of Battle|r |cffFFFFFF\nDesign: Amulet of the Moon|r", --tooltip display
		coords = 45002506, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[57] = { -- "Teldrassil"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[78] = { -- "UngoroCrater"
	[54086206] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nergal|r", --Vendor Name
		info = "|cff0A70D0Pattern: Devilsaur Leggings|r |cffFFFFFF\nPattern: Devilsaur Gauntlets|r", --tooltip display
		coords = 54086206, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43044106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Dramm Riverhorn|r", --Vendor Name
		info = "|cffFFFFFFPlans: Runic Plate Boots|r |cffFFFFFF\nPlans: Runic Plate Helm|r |cffFFFFFF\nPlans: Runic Plate Shoulders|r |cffFFFFFF\nPlans: Runic Plate Leggings|r", --tooltip display
		coords = 43044106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

}

points[83] = { -- "Winterspring"
	[59025008] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Xizzer Fizzbolt|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Delicate Arcanite Converter|r |cffFFFFFF\nSchematic: Masterwork Target Dummy|r |cffFFFFFF\nSchematic: Powerful Seaforium Charge|r |cffFFFFFF\nSchematic: Gyrofreeze Ice Reflector|r", --tooltip display
		coords = 59025008, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[59085106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Himmik|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Monster Omelet|r", --tooltip display
		coords = 59085106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[59064902] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Qia|r", --Vendor Name
		info = "|cffFFFFFFFormula: Enchant Chest - Major Health|r |cffFFFFFF\nDesign: Necklace of the Diamond Tower|r |cffFFFFFF\nPattern: Frostsaber Boots|r |cffFFFFFF\nPattern: Mooncloth|r |cffFFFFFF\nPattern: Runecloth Bag|r", --tooltip display
		coords = 59064902, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[58006308] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Daleohm|r", --Vendor Name
		info = "|cff0A70D0Plans:Frostguard|r", --tooltip display
		coords = 58006308, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[85] = { -- "Orgrimmar"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}



-------------
-- Outland --
-------------
points[105] = { -- "BladesEdgeMountains"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[100] = { -- "Hellfire"
	[54026306] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Sid Limbardi|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Ravager Dog|r", --tooltip display
		coords = 54026306, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53086508] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Alchemist Gribble|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Camouflage|r", --tooltip display
		coords = 53086508, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55066506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Lebowski|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Ultra-Spectropic Detection Goggles|r |cffFFFFFF\nSchematic: Cogspinner Goggles|r", --tooltip display
		coords = 55066506, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53086504] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jezebel Bican|r", --Vendor Name
		info = "|cffFFFFFFTechnique Glyph of Counterspell|r", --tooltip display
		coords = 53086504, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[107] = { -- "Nagrand"
	[53027108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Borto|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bolt of Soulcloth|r |cffFFFFFF\nPattern: Soulcloth Gloves|r", --tooltip display
		coords = 53027108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56027302] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Uriku|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Grilled Mudfish|r |cffFFFFFF\nRecipe: Poached Bluefish|r |cffFFFFFF\nRecipe: Roasted Clefthoof|r |cffFFFFFF\nRecipe: Talbuk Steak|r", --tooltip display
		coords = 56027302, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[109] = { -- "Netherstorm"
	[44003606] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Dealer Jadyan|r", --Vendor Name
		info = "|cff0A70D0Formula: Enchant Weapon - Executioner|r", --tooltip display
		coords = 44003606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

}

points[104] = { -- "ShadowmoonValley"
	[55085802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Arrond !SCRYERS ONLY!|r", --Vendor Name
		info = "|cffFFFFFFPattern: Imbued Netherweave Robe|r |cffFFFFFF\nPattern: Imbued Netherweave Tunic|r", --tooltip display
		coords = 55085802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[36085404] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Daggle Ironshaper|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Adamantite Scope|r", --tooltip display
		coords = 36085404, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[36085500] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mari Stonehand|r", --Vendor Name
		info = "|cffFFFFFFPlans: Lesser Ward of Shielding|r", --tooltip display
		coords = 36085500, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[111] = { -- "ShattrathCity"
	[72063106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Wind Trader Lathrai|r", --Vendor Name
		info = "|cffFFFFFFSchematic: White Smoke Flare|r |cffFFFFFF\nSchematic: Fel Iron Toolbox|r", --tooltip display
		coords = 72063106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[45082008] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Skerah|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Transmute Primal Might|r", --tooltip display
		coords = 45082008, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66026808] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Eiin|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bolt of Imbued Netherweave|r |cffFFFFFF\nPattern: Imbued Netherweave Bag|r |cffFFFFFF\nPattern: Netherweave Robe|r |cffFFFFFF\nPattern: Netherweave Tunic|r", --tooltip display
		coords = 66026808, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[64086906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Viggz Shinesparked|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Adamantite Rifle|r", --tooltip display
		coords = 64086906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[64007108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Aaron Hollman|r", --Vendor Name
		info = "|cffFFFFFFPlans: Adamantite Maul|r |cffFFFFFF\nPlans: Adamantite Cleaver|r |cffFFFFFF\nPlans: Adamantite Dagger|r |cffFFFFFF\nPlans: Adamantite Rapier|r", --tooltip display
		coords = 64007108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[63067000] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Madame Ruby|r", --Vendor Name
		info = "|cffFFFFFFFormula: Superior Mana Oil|r |cffFFFFFF\nFormula: Enchant Shield - Major Stamina|r |cffFFFFFF\nFormula: Large Prismatic Shard|r |cffFFFFFF\nFormula: Superior Wizard Oil|r", --tooltip display
		coords = 63067000, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66066804] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nasmara Moonsong|r", --Vendor Name
		info = "|cffFFFFFFPattern: Primal Mooncloth|r", --tooltip display
		coords = 66066804, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66066802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Andrion Darkspinner|r", --Vendor Name
		info = "|cffFFFFFFPattern: Shadowcloth|r", --tooltip display
		coords = 66066802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66066806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gidge Spellweaver|r", --Vendor Name
		info = "|cffFFFFFFPattern: Spellcloth|r", --tooltip display
		coords = 66066806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[108] = { -- "TerokkarForest"
	[55085300] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Supply Officer Mills|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Blackened Basilisk|r |cffFFFFFF\nRecipe: Warp Burger|r", --tooltip display
		coords = 55085300, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[57065304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Leeli Longhaggle|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Sneaking Potion|r |cffFFFFFF\nRecipe: Major Dreamless Sleep Potion|r", --tooltip display
		coords = 57065304, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56065302] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Innkeeper Biribi|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Golden Fish Sticks|r |cffFFFFFF\nRecipe: Spicy Crawdad|r", --tooltip display
		coords = 56065302, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[102] = { -- "Zangarmarsh"
	[17085102] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mycah !COST 1 SHROOM!|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Clam Bar|r", --tooltip display
		coords = 17085102, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[78006600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Juno Dufrain|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Blackened Sporefish|r", --tooltip display
		coords = 78006600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[67084800] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Haalrun|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Major Frost Power|r |cffFFFFFF\nRecipe: Super Mana Potion|r |cffFFFFFF\nRecipe: Elixir of Major Defense|r", --tooltip display
		coords = 67084800, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[68065002] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Loolruna|r", --Vendor Name
		info = "|cffFFFFFFPlans: Adamantite Plate Bracers|r |cffFFFFFF\nPlans: Adamantite Plate Gloves|r |cffFFFFFF\nPlans: Adamantite Breastplate|r", --tooltip display
		coords = 68065002, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40062802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Muheru the Weaver|r", --Vendor Name
		info = "|cffFFFFFFPattern: Imbued Netherweave Pants|r |cffFFFFFF\nPattern: Imbued Netherweave Boots|r", --tooltip display
		coords = 40062802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42022708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Doba|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Blackened Trout|r |cffFFFFFF\nRecipe: Feltail Delight|r", --tooltip display
		coords = 42022708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}


---------------
-- Northrend --
---------------
points[114] = { -- "BoreanTundra"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[127] = { -- "CrystalsongForest"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[125] = { -- "Dalaran"
	[39002600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Bryan Landers|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Titanium Toolbox|r", --tooltip display
		coords = 39002600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[42043706] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Larana Drome|r", --Vendor Name
		info = "|cffFFFFFFTechnique Glyph of Everlasting Affliction|r |cffFFFFFF\nTechnique Glyph of Counterspell|r", --tooltip display
		coords = 42043706, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
		
	[65643807] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kaye Toogie|r", --Vendor Name
		info = "|cff1eff00Schematic: Arcanite Dragonling|r |cffFFFFFF\nSchematic: Mithril Mechanical Dragonling|r |cffFFFFFF\nSchematic: Mechanical Dragonling|r", --tooltip display
		coords = 65643807, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[126] = { -- "DalaranUnderbelly"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[115] = { -- "Dragonblight"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[116] = { -- "GrizzlyHills"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[117] = { -- "HowlingFjord"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[118] = { -- "Icecrown"
	[72022008] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Fizzix Blastbolt !ONLY IF DALA SOLD OUT!|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Titanium Toolbox|r", --tooltip display
		coords = 72022008, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[119] = { -- "SholazarBasin"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[120] = { -- "TheStormPeaks"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[121] = { -- "ZulDrak"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}


---------------
-- Cataclysm --
---------------
points[207] = { -- "Deepholm"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[198] = { -- "Hyjal"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[241] = { -- "TwilightHighlands"
	[78067602] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Casandra Downs|r", --Vendor Name
		info = "|cffFFFFFFTechnique Glyph of Colossus Smash|r", --tooltip display
		coords = 78067602, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[249] = { -- "Uldum"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[203] = { -- "Vashjir"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[204] = { -- "VashjirDepths"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[201] = { -- "VashjirKelpForest"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[205] = { -- "VashjirRuins"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}


--------------
-- Pandaria --
--------------
points[422] = { -- "DreadWastes"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[418] = { -- "Krasarang"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[379] = { -- "KunLaiSummit"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[393] = { -- "ShrineofSevenStars"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[433] = { -- "TheHiddenPass"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[371] = { -- "TheJadeForest"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[388] = { -- "TownlongWastes"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[390] = { -- "ValeofEternalBlossoms"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[376] = { -- "ValleyoftheFourWinds"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}


-------------
-- Draenor --
-------------
points[582] = { -- "garrisonsmvalliance_tier3"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}

points[539] = { -- "ShadowmoonValleyDR"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}


------------------
-- Broken Isles --
------------------
points[627] = { -- "Dalaran70"
	--[00000000] = {
	--	npcid = 0000, --NPC ID
	--	name = "Place Holder", --Vendor Name
	--	info = "Place Holder", --tooltip display
	--	coords = 00000000, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
}
