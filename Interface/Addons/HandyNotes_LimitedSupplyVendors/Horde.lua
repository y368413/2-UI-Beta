


if UnitFactionGroup("player") ~= "Horde" then return end


local _, LimitedSupplyVendors = ...
local points = LimitedSupplyVendors.points
-- points[<mapfile>] = { [<coordinates>] = <NPC ID> }

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
	[70003504] = {
		npcid = 2819, --NPC ID
		name = "|cffEEC410Tunkk|r", --Vendor Name
		info = "|cff1EFF0BPattern: Raptor Hide Harness|r |cffDF0101Horde only|r", --tooltip display
		coords = 70003504, --Cordinates to vendor
		items = {13287}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {2500}, --Cost of each item?
		},

	[69023306] = {
		npcid = 2821, --NPC ID
		name = "|cffEEC410Keena|r", --Vendor Name
		info = "|cffFFFFFFDesign: Ruby Crown of Restoration|r |cffFFFFFF\nPattern: Barbaric Leggings|r", --tooltip display
		coords = 69023306, --Cordinates to vendor
		items = {21942, 5973}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {6000, 650}, --Cost of each item?
		},

	[68003706] = {
		npcid = 6574, --NPC ID
		name = "|cffEEC410Jun'ha|r", --Vendor Name
		info = "|cffFFFFFFPattern: Azure Silk Cloak|r |cffDF0101Horde only|r", --tooltip display
		coords = 68003706, --Cordinates to vendor
		items = {7089}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {1500}, --Cost of each item?
		},	
}

points[15] = { -- "Badlands"
	[65003808] = {
		npcid = 48060, --NPC ID
		name = "|cffEEC410'Chef' Overheat|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Undermine Clam Chowder|r", --tooltip display
		coords = 65003808, --Cordinates to vendor
		items = {16767}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {3000}, --Cost of each item?
		},

	[91003804] = {
		npcid = 49918, --NPC ID
		name = "|cffEEC410Buckslappy|r", --Vendor Name
		info = "|cffFFFFFFSchematic: EZ-Thro Dynamite II|r |cffFFFFFF\nSchematic: Blue Firework|r |cffFFFFFF\nSchematic: Green Firework|r |cffFFFFFF\nSchematic: Red Firework|r", --tooltip display
		coords = 91003804, --Cordinates to vendor
		items = {18650, 18649, 18648, 18647}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {5000, 1800, 1800, 1800}, --Cost of each item?
		},


}


points[17] = { -- "BlastedLands"
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


points[27] = { -- "DunMorogh"
	[17087406] = {
		npcid = 26081, --NPC ID
		name = "|cffEEC410High Admiral 'Shelly' Jorrik|r", --Vendor Name
		info = "|cffFFFFFFPlans: Solid Iron Maul|r", --tooltip display
		coords = 17087406, --Cordinates to vendor
		items = {10858}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {3000}, --Cost of each item?
		},

}


points[47] = { -- "Duskwood"
	[81081908] = {
		npcid = 3134, --NPC ID
		name = "|cffEEC410Kzixx|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Holy Protection Potion|r |cffFFFFFF\nSchematic: Goblin Jumper Cables|r", --tooltip display
		coords = 81081908, --Cordinates to vendor
		items = {6053, 7561}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {800, 2000}, --Cost of each item?
		},

}


points[23] = { -- "EasternPlaguelands"
	[74025100] = {
		npcid = 12941, --NPC ID
		name = "|cffEEC410Jase Farlane|r", --Vendor Name
		info = "|cffFFFFFFDesign: Ring of Bitter Shadows|r", --tooltip display
		coords = 74025100, --Cordinates to vendor
		items = {21954}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {10000}, --Cost of each item?
		},

}

points[94] = { -- "EversongWoods"
	[49004700] = {
		npcid = 16262, --NPC ID
		name = "|cffEEC410Landraelanis|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Lynx Steak|r |cffDF0101Horde only|r", --tooltip display
		coords = 49004700, --Cordinates to vendor
		items = {27585}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {40}, --Cost of each item?
		},


}

points[95] = { -- "Ghostlands"
	[47022806] = {
		npcid = 16224, --NPC ID
		name = "|cffEEC410Rathis Tomber|r", --Vendor Name
		info = "|cffFFFFFFPattern: Red Linen Bag|r", --tooltip display
		coords = 47022806, --Cordinates to vendor
		items = {5771}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {2000}, --Cost of each item?
		},

	[48043100] = {
		npcid = 16253, --NPC ID
		name = "|cffEEC410Master Chef Mouldier|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Bat Bites|r |cffDF0101Horde only|r |cffFFFFFF\nRecipe: Crunchy Spider Surprise|r", --tooltip display
		coords = 48043100, --Cordinates to vendor
		items = {27687, 22647}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {400, 400}, --Cost of each item?
		},


}

points[25] = { -- "HillsbradFoothills"
	[71024502] = {
		npcid = 6777, --NPC ID
		name = "|cffEEC410Zan Shivsproket|r All the way up", --Vendor Name
		info = "|cffFFFFFFSchematic: Gnomish Cloaking Device", --tooltip display
		coords = 71024502, --Cordinates to vendor
		items = {7742}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {2400}, --Cost of each item?
		},

	[57044706] = {
		npcid = 2393, --NPC ID
		name = "|cffEEC410Christoph Jeffcoat|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Shadow Protection Potion|r |cffDF0101Horde only|r |cff1EFF0B\nPattern: Thick Murloc Armor|r", --tooltip display
		coords = 57044706, --Cordinates to vendor
		items = {6054, 5788}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {900, 650}, --Cost of each item?
		},

	[58004708] = {
		npcid = 2394, --NPC ID
		name = "|cffEEC410Mallen Swain|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Overalls|r |cffFFFFFF\nPattern: Dark Silk Shirt|r", --tooltip display
		coords = 58004708, --Cordinates to vendor
		items = {6274, 6401}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {400, 1100}, --Cost of each item?
		},

	[44002108] = {
		npcid = 2480, --NPC ID
		name = "|cffEEC410Bro'kin|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Frost Oil|r", --tooltip display
		coords = 44002108, --Cordinates to vendor
		items = {14634}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {2500}, --Cost of each item?
		},

	[76065806] = {
		npcid = 2698, --NPC ID
		name = "|cffEEC410George Candarte|r", --Vendor Name
		info = "|cffFFFFFFPattern: Green Leather Armor|r", --tooltip display
		coords = 76065806, --Cordinates to vendor
		items = {7613}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {2000}, --Cost of each item?
		},

	[56004604] = {
		npcid = 3537, --NPC ID
		name = "|cffEEC410Zixil !WANDERING!|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Boots - Minor Agility|r |cffFFFFFF\nPattern: Earthen Leather Shoulders|r |cffFFFFFF\nPattern: Red Woolen Bag|r |cffFFFFFF/nSchematic: Goblin Jumper Cables|r", --tooltip display
		coords = 56004604, --Cordinates to vendor
		items = {6377, 7362, 5772, 7561}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {1000, 2000, 500, 2000}, --Cost of each item?
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

points[110] = { -- "SilvermoonCity"
	[90087306] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gelanthis|r", --Vendor Name
		info = "|cffFFFFFFDesign: Opal Necklace of Impact|r |cffFFFFFF\nDesign: The Jade Eye|r |cffFFFFFF\nDesign: Heavy Golden Necklace of Battle|r |cffFFFFFF\nDesign: Amulet of the Moon|r", --tooltip display
		coords = 90087306, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[69042408] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Lyna|r", --Vendor Name
		info = "|cffFFFFFFFormula: Superior Mana Oil|r |cffFFFFFF\nFormula: Large Prismatic Shard|r |cffFFFFFF\nFormula: Superior Wizard Oil|r", --tooltip display
		coords = 69042408, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56005108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Deynna|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bolt of Soulcloth|r", --tooltip display
		coords = 56005108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[66041908] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Melaris|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Camouflage|r |cff1EFF0B\nRecipe: Transmute Primal Might|r", --tooltip display
		coords = 66041908, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[84067906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zaralda|r", --Vendor Name
		info = "|cffFFFFFFPattern: Comfortable Insoles|r", --tooltip display
		coords = 84067906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[75084006] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Yatheon|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Adamantite Rifle|r |cffFFFFFF\nSchematic: White Smoke Flare|r |cffFFFFFF\nSchematic: Fel Iron Toolbox|r", --tooltip display
		coords = 75084006, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[80063700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Eriden|r", --Vendor Name
		info = "|cffFFFFFFPlans: Adamantite Maul|r |cffFFFFFF\nPlans: Adamantite Cleaver|r |cffFFFFFF\nPlans: Adamantite Dagger|r |cffFFFFFF\nPlans: Adamantite Rapier|r", --tooltip display
		coords = 80063700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[43024006] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Andrew Hilbert|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Robe|r |cffFFFFFF\nRecipe: Smoked Bear Meat|r |cffFFFFFF\nPattern: Murloc Scale Breastplate|r |cffFFFFFF\nPattern: Murloc Scale Belt|r |cffFFFFFF\nPattern: Red Linen Bag|r", --tooltip display
		coords = 43024006, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[46084006] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Lilly|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Chest - Lesser Mana|r |cffDF0101Horde only|r", --tooltip display
		coords = 46084006, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53088202] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Leo Sarn|r", --Vendor Name
		info = "|cffFFFFFFFormula: Enchant 2H Weapon - Lesser Intellect|r", --tooltip display
		coords = 53088202, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[21] = { -- "Silverpine"
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

points[50] = { -- "NorthernStranglethorn"
	[38064900] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Vharr|r", --Vendor Name
		info = "|cffFFFFFFPlans: Massive Iron Axe|r", --tooltip display
		coords = 38064900, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[39025100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nerrist|r", --Vendor Name
		info = "|cffFFFFFFDesign: Truesilver Crab|r |cffFFFFFF\nRecipe: Curiously Tasty Omelet|r |cffFFFFFF\nRecipe: Jungle Stew|r", --tooltip display
		coords = 39025100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[37064902] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Uthok|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Spiced Chili Crab|r", --tooltip display
		coords = 37064902, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

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
	[47025202] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gharash|r", --Vendor Name
		info = "|cffFFFFFFPlans: Mithril Scale Bracers|r", --tooltip display
		coords = 47025202, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[47025702] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Rartar|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Demonslaying|r", --tooltip display
		coords = 47025702, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[46065700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Banalash|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Bracer - Dodge|r |cffFFFFFF\nDesign: Black Pearl Panther|r", --tooltip display
		coords = 46065700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


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

points[18] = { -- "Tirisfal"
	[83026904] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Werg Thickblade|r", --Vendor Name
		info = "|cffFFFFFFPattern: Wicked Leather Gauntlets|r |cffFFFFFF\nPattern: Stormshroud Pants|r", --tooltip display
		coords = 83026904, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[61005100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Abigail Shiel|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Crispy Bat Wing|r |cffDF0101Horde only|r", --tooltip display
		coords = 61005100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[52065506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Constance Brisboise|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Vest|r", --tooltip display
		coords = 52065506, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[90] = { -- "Undercity"
	[64083802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Daniel Barlett|r", --Vendor Name
		info = "|cffFFFFFFDesign: Amulet of the Moon|r", --tooltip display
		coords = 64083802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[70082906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Millie Gregorian|r", --Vendor Name
		info = "|cffFFFFFFPattern: Greater Adept's Robe|r |cffFFFFFF\nPattern: Red Woolen Bag|r |cffFFFFFF\nPattern: Tuxedo Shirt|r |cffFFFFFF\nPattern: Tuxedo Pants|r |cffFFFFFF\nPattern: Tuxedo Jacket|r", --tooltip display
		coords = 70082906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[70065906] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Joseph Moore|r", --Vendor Name
		info = "|cffFFFFFFPattern: Barbaric Bracers|r |cff1EFF0B\nPattern: Green Whelp Bracers|r", --tooltip display
		coords = 70065906, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[52067500] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Algernon|r", --Vendor Name
		info = "|cff1EFF0BRecipe: Elixir of Shadow Power|r", --tooltip display
		coords = 52067500, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[64084908] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Felicia Doan|r", --Vendor Name
		info = "|cffFFFFFFDesign: The Jade Eye|r", --tooltip display
		coords = 64084908, --Cordinates to vendor
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


}


--------------
-- Kalimdor --
--------------


points[10] = { -- "Northern Barrens"
	[49005802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Tari'qa|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Strider Stew|r |cffDF0101Horde only|r |cffFFFFFF\nRecipe: Crispy Lizard Tail|r |cffDF0101Horde only|r", --tooltip display
		coords = 49005802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[50006100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Wrahk|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Vest|r |cffFFFFFF\nPattern: Blue Linen Robe|r |cffFFFFFF\nPattern: Red Woolen Bag|r", --tooltip display
		coords = 50006100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[50065708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zargh|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Hot Lion Chops|r |cffDF0101Horde only|r", --tooltip display
		coords = 50065708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[48065804] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Hula'mahi|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Holy Protection Potion|r", --tooltip display
		coords = 48065804, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

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

points[76] = { -- "Aszhara"
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


points[66] = { -- "Desolace"
	[55085606] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Muuran|r", --Vendor Name
		info = "|cffFFFFFFPlans: Solid Iron Maul|r", --tooltip display
		coords = 55085606, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[51005304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kireena|r", --Vendor Name
		info = "|cffFFFFFFPattern: Azure Silk Gloves|r |cffFFFFFF\nRecipe: Heavy Kodo Stew|r", --tooltip display
		coords = 51005304, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},	
}

points[1] = { -- "Durotar"
	[57047700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zansoa|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Slitherskin Mackerel|r", --tooltip display
		coords = 57047700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[50084208] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Grimtak|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Scorpid Surprise|r |cffDF0101Horde only|r", --tooltip display
		coords = 50084208, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[70] = { -- "Dustwallow"
	[36063100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Ogg'marr|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Heavy Crocolisk Stew|r |cffDF0101Horde only|r |cffFFFFFF\nRecipe: Carrion Surprise|r |cffDF0101Horde only|r |cffFFFFFF\nRecipe: Roast Raptor|r |cffFFFFFF\nRecipe: Dragonbreath Chili|r", --tooltip display
		coords = 36063100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[35023008] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Ghok'kah|r", --Vendor Name
		info = "|cffFFFFFFPattern: Icy Cloak|r |cffDF0101Horde only|r", --tooltip display
		coords = 35023008, --Cordinates to vendor
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
	[52084700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jangdor Swiftstrider|r", --Vendor Name
		info = "|cff1EFF0BPattern: Green Whelp Bracers|r |cff1EFF0B\nPattern: Nightscape Shoulders|r |cffFFFFFF\nPattern: Living Shoulders|r |cffFFFFFF\nPattern: Turtle Scale Gloves|r", --tooltip display
		coords = 52084700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[74064208] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Sheendra Tallgrass|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Hot Wolf Ribs|r |cffFFFFFF\nRecipe: Baked Salmon|r |cffFFFFFF\nRecipe: Lobster Stew|r |cffFFFFFF\nRecipe: Mightfish Steak|r", --tooltip display
		coords = 74064208, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[76004304] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Bronk|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Nature Protection Potion|r |cffFFFFFF\nRecipe: Ghost Dye|r", --tooltip display
		coords = 76004304, --Cordinates to vendor
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


points[7] = { -- "Mulgore"
	[46045708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Wunna Darkmane|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Roasted Kodo Meat|r |cffDF0101Horde only|r", --tooltip display
		coords = 46045708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}

points[85] = { -- "Orgrimmar"
	[66064106] = {
		npcid = 3333, --NPC ID
		name = "|cffEEC410Shankys|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Rainbow Fin Albacore|r |cffFFFFFF\nRecipe: Rockscale Cod|r |cffFFFFFF\nRecipe: Mithril Head Trout|r", --tooltip display
		coords = 66064106, --Cordinates to vendor
		items = {6368, 6369, 17062}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {400, 2200, 2200}, --Cost of each item?
		},

	[47005506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Hagrus|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Rage Potion|r |cffFFFFFF\nRecipe: Great Rage Potion|r", --tooltip display
		coords = 47005506, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[53024808] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kithas|r", --Vendor Name
		info = "|cffFFFFFFFormula: Minor Wizard Oil|r |cff1EFF0B\nFormula: Enchant Chest - Lesser Mana|r |cffDF0101Horde only|r |cffFFFFFF\nFormula: Enchant 2H Weapon - Lesser Intellect|r |cffFFFFFF\nFormula: Minor Mana Oil|r |cffFFFFFF\nFormula: Lesser Wizard Oil|r |cffFFFFFF\nPattern: Enchanted Mageweave Pouch|r", --tooltip display
		coords = 53024808, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55064604] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kor'geld|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Free Action Potion|r |cffFFFFFF\nRecipe: Elixir of Superior Defense|r", --tooltip display
		coords = 55064604, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[75083502] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Sumi|r", --Vendor Name
		info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
		coords = 75083502, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[60065806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Borya|r", --Vendor Name
		info = "|cffFFFFFFPattern: Blue Linen Vest|r |cffFFFFFF\nPattern: Blue Overalls|r |cffFFFFFF\nPattern: Red Woolen Bag|r |cffFFFFFF\nPattern: Lavender Mageweave Shirt|r |cffFFFFFF\nPattern: Pink Mageweave Shirt|r", --tooltip display
		coords = 60065806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[60065404] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Tamar|r", --Vendor Name
		info = "|cffFFFFFFPattern: Heavy Leather Ball|r", --tooltip display
		coords = 60065404, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[48044708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Felika !WANDERING!|r", --Vendor Name
		info = "|cffFFFFFFDesign: Heavy Golden Necklace of Battle|r", --tooltip display
		coords = 48044708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56005600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Sovik|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Red Firework|r", --tooltip display
		coords = 56005600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


	--NPCS below removed with addition of Horde Embassy
	--[36068608] = {
	--	npcid = 0000, --NPC ID
	--	name = "|cffEEC410Vizna Bangwrench|r", --Vendor Name
	--	info = "|cffFFFFFFSchematic: Red Firework|r", --tooltip display
	--	coords = 36068608, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},

	--[36028302] = {
	--	npcid = 0000, --NPC ID
	--	name = "|cffEEC410Zido Helmbreaker|r", --Vendor Name
	--	info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
	--	coords = 36028302, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},

	--[39008506] = {
	--	npcid = 0000, --NPC ID
	--	name = "|cffEEC410Karizi Prokpatty|r", --Vendor Name
	--	info = "|cffFFFFFFRecipe: Smoked Sagefish|r |cffFFFFFF\nRecipe: Sagefish Delight|r", --tooltip display
	--	coords = 39008506, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},

	--[41007908] = {
	--	npcid = 0000, --NPC ID
	--	name = "|cffEEC410Lizna Goldweaver|r", --Vendor Name
	--	info = "|cffFFFFFFPattern: Blue Linen Vest|r |cffFFFFFF\nPattern: Blue Overalls|r |cffFFFFFF\nPattern: Red Woolen Bag|r |cffFFFFFF\nPattern: Lavender Mageweave Shirt|r |cffFFFFFF\nPattern: Pink Mageweave Shirt|r", --tooltip display
	--	coords = 41007908, --Cordinates to vendor
	--	items = {00000}, --Items the vendor sells
	--	icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
	--	cost = {999999999}, --Cost of each item?
	--	},
	
	[36748436] = {
		npcid = 133127, --NPC ID
		name = "|cffEEC410Thaluriel|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Steam Tonk Controller|r |cffFFFFFF\nSchematic: Red Firework|r", --tooltip display
		coords = 36748436, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
	

	[45007706] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Punra|r", --Vendor Name
		info = "|cffFFFFFFPlans: Hardened Iron Shortsword|r", --tooltip display
		coords = 45007706, --Cordinates to vendor
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
	[50046306] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Jeeda|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Fire Protection Potion|r |cffDF0101Horde only|r", --tooltip display
		coords = 50046306, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[48066106] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kulwia|r", --Vendor Name
		info = "|cff1EFF0BFormula: Enchant Bracer - Lesser Strength|r |cff1EFF0B\nFormula: Enchant Cloak - Minor Agility|r", --tooltip display
		coords = 48066106, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


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

points[88] = { -- "ThunderBluff"
	[43084406] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mahu|r", --Vendor Name
		info = "|cffFFFFFFPattern: Red Woolen Bag|r |cffFFFFFF\nPattern: Orange Martial Shirt|r |cffFFFFFF\nPattern: White Wedding Dress|r |cffFFFFFF\nPattern: Red Linen Bag|r", --tooltip display
		coords = 43084406, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[45003806] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nata Dawnstrider|r", --Vendor Name
		info = "|cffFFFFFFFormula: Enchant 2H Weapon - Lesser Intellect|r |cff1EFF0B\nFormula: Enchant Boots - Minor Agility|r", --tooltip display
		coords = 45003806, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[51065208] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Naal Mistrunner|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Longjaw Mud Snapper|r", --tooltip display
		coords = 51065208, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[56004700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Sewa Mistrunner|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Brilliant Smallfish|r |cffFFFFFF\nRecipe: Bristle Whisker Catfish|r", --tooltip display
		coords = 56004700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[36085904] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Palehoof's Big Bag of Parts|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Red Firework|r", --tooltip display
		coords = 36085904, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[40066206] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Shadi Mistrunner|r", --Vendor Name
		info = "|cffFFFFFFDesign: Opal Necklace of Impact|r", --tooltip display
		coords = 40066206, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


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


-------------
-- Outland --
-------------
points[105] = { -- "BladesEdgeMountains"
	[51005708] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Daga Ramba|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Super Mana Potion|r |cffFFFFFF\nRecipe: Elixir of Major Defense|r |cffFFFFFF\nRecipe: Major Dreamless Sleep Potion|r", --tooltip display
		coords = 51005708, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}

points[100] = { -- "Hellfire"
	[53023802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Rohok|r", --Vendor Name
		info = "|cffFFFFFFPlans: Lesser Ward of Shielding|r", --tooltip display
		coords = 53023802, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[54064100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Cookie One-Eye|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Ravager Dog|r", --tooltip display
		coords = 54064100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[52023604] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Apothecary Antonivich|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Elixir of Camouflage|r", --tooltip display
		coords = 52023604, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[61008104] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mixie Farshot|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Cogspinner Goggles|r |cffFFFFFF\nSchematic: Adamantite Scope|r", --tooltip display
		coords = 61008104, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[52043600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Kul Inkspiller|r", --Vendor Name
		info = "|cffFFFFFFTechnique Glyph of Counterspell|r", --tooltip display
		coords = 52043600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[107] = { -- "Nagrand"
	[55023700] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Mathar G'ochar !WANDERING!|r", --Vendor Name
		info = "|cffFFFFFFPattern: Bolt of Soulcloth|r |cffFFFFFF\nPattern: Soulcloth Gloves|r", --tooltip display
		coords = 55023700, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[58003506] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Nula the Butcher|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Grilled Mudfish|r |cffFFFFFF\nRecipe: Poached Bluefish|r |cffFFFFFF\nRecipe: Roasted Clefthoof|r |cffFFFFFF\nRecipe: Talbuk Steak|r", --tooltip display
		coords = 58003506, --Cordinates to vendor
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
	[29023100] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Krek Cragcrush|r", --Vendor Name
		info = "|cffFFFFFFPlans: Adamantite Plate Bracers|r |cffFFFFFF\nPlans: Adamantite Plate Gloves|r |cffFFFFFF\nPlans: Adamantite Breastplate|r", --tooltip display
		coords = 29023100, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[55085802] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Arrond !SCRYERS ONLY!|r", --Vendor Name
		info = "|cffFFFFFFPattern: Imbued Netherweave Robe|r |cffFFFFFF\nPattern: Imbued Netherweave Tunic|r", --tooltip display
		coords = 55085802, --Cordinates to vendor
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
	[48084500] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Innkeeper Grilka|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Blackened Basilisk|r |cffFFFFFF\nRecipe: Warp Burger|r", --tooltip display
		coords = 48084500, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[48084600] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Rungor|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Golden Fish Sticks|r |cffFFFFFF\nRecipe: Spicy Crawdad|r", --tooltip display
		coords = 48084600, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},


}

points[102] = { -- "Zangarmarsh"
	[85025406] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Zurai|r", --Vendor Name
		info = "|cffFFFFFFPattern: Imbued Netherweave Pants|r |cffFFFFFF\nPattern: Imbued Netherweave Boots|r |cffFFFFFF\nRecipe: Feltail Delight|r", --tooltip display
		coords = 85025406, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[31064902] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Gambarinka|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Blackened Trout|r", --tooltip display
		coords = 31064902, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

	[32045108] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Seer Janidi|r", --Vendor Name
		info = "|cffFFFFFFRecipe: Sneaking Potion|r |cffFFFFFF\nRecipe: Elixir of Major Frost Power|r", --tooltip display
		coords = 32045108, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},

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

	[32044800] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Captured Gnome !HOW COULD YOU?!|r", --Vendor Name
		info = "|cffFFFFFFSchematic: Ultra-Spectropic Detection Goggles|r |cffFFFFFF\nSchematic: White Smoke Flare|r", --tooltip display
		coords = 32044800, --Cordinates to vendor
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
	[876064904] = {
		npcid = 0000, --NPC ID
		name = "|cffEEC410Una Kobuna|r", --Vendor Name
		info = "|cffFFFFFFTechnique Glyph of Colossus Smash|r", --tooltip display
		coords = 876064904, --Cordinates to vendor
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

points[391] = { -- "ShrineofTwoMoons"
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

points[392] = { -- "ShrineofTwoMoons"
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

--Test
points[563] = { -- "Siege of Orgrimmar - Korkron Barracks"
	[48702812] = {
		npcid = 73715, --NPC ID
		name = "Rivett Clutchpop", --Vendor Name
		info = "|cffFFFFFFSchematic: Adamantite Rifle|r |cffFFFFFF\nSchematic: Ultra-Spectropic Detection Goggles|r |cffFFFFFF\nSchematic: Cogspinner Goggles|r |cffFFFFFF\nSchematic: Adamantite Scope|r |cffFFFFFF\nSchematic: Fel Iron Toolbox|r", --tooltip display
		coords = 48702812, --Cordinates to vendor
		items = {00000}, --Items the vendor sells
		icon = "interface\\icons\\Inv_scroll_03", --Icon displayed on map
		cost = {999999999}, --Cost of each item?
		},
}




-------------
-- Draenor --
-------------
points[590] = { -- "garrisonffhorde_tier3"
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

points[525] = { -- "FrostfireRidge"
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
