local _, ns = ...
local M, R, U, I = unpack(ns)
local kAutoOpen = CreateFrame('Frame')

kAutoOpen:SetScript('OnEvent', function(self, event, ...) 
if not R.db["Misc"]["kAutoOpen"] then self:UnregisterAllEvents() return end
 self[event](...)
end)
local atBank, atMail, atMerchant, isLooting

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	KEY
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

	--	Some items I didn't find, I copied them from the below alternative/companion addons, Thanks to the author(s).
	--	SS:			Open Sesame 				--	Alternative Addon, going work on all versions of WoW, both classics and retail. 
	--	BG:			Openable Be Gone			--	Alternative Addon, has in game GUI for selecting items you want to open or not.
	--	OW:			Openables					--	Weakaura, Doesn't work for me, was a decent idea when the New Openables addon was dead.
	--	OC:			New Openables Continued		--	Companion Addon, Opens items Openables cannot or fails to, like clams, toys, pets, etc.
												--	Highly Recommend using this with any AutoOpening addon.
	--	00:			Year last seen (event section mostly)
	--	NO:			Just wont open or kills the addon :P
	--	LP:			Needs Lock Picking to Open
	--	PF:			Needs a Profession to Open
	--	FF:			Can be changed to True, it contains the Find Fish book, If I don't need it, I mail it for alts
	
	--	NOTE:		Ignore "My OneDrive Sync:", just added it, so whenever I add something, I can run it and update OneDrive right away... If I remember :P
	--	OneDrive:	https://1drv.ms/f/s!AiSfe94wb0vWjQarA4JNTkq0uMfl
	
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	XX	WORLD OF WARCRAFT:	EXCEPTION CACHES
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	
local autoOpenItemsPortalRoom = {
		--	Anniversary Event		Level 80 caches causing chat spams on low levels, Remove -- in event section if you don't have lower levels.
			[233014] = true,	--	24	Bronze Celebration Cache of Treasures		Cancelled out due to Level 80 Item and Lower Levels Spams Chat
			[232471] = true,	--	24	Cache of Dark Iron Treasures				Cancelled out due to Level 80 Item and Lower Levels Spams Chat
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	11	WORLD OF WARCRAFT:	THE WAR WITHIN	-	WORLD SOUL SAGA I
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	
local autoOpenItems = {

			[228741] = true,	--		Lamplighter Supply Satchel
			[228220] = true,	--		Waxy Bundle
			[227792] = true,	--		Everyday Cache
			[227450] = true,	--		Sky Racer's Purse
			[226273] = true,	--		Awakened Mechanical Cache
			[226264] = true,	--		Radiant Cache
			[226256] = true,	--		Token of the Remembrancers
			[226193] = true,	--		Cache of Nerubian Treasures
			[226148] = true,	--		Wax-sealed Weathered Crests
			[226146] = true,	--		Handful of Humming Shinies
		--	[225249] = true,	--	NO	Rattling Bag o'Gold										Doesn't Open
			[224784] = true,	--		Pinnacle Cache
			[224556] = true,	--		Glorious Contender's Strongbox
			[223953] = true,	--		Timerunner's Parting Pack
		--	[221375] = true,	--	OC	Pack of Runed Harbinger Crests
		--	[221373] = true,	--	OC	Satchel of Carved Harbinger Crests						Item Not Bag
			[221269] = true,	--		Crimson Valorstone
		--	[221268] = true,	--	OC	Pouch of Weathered Harbinger Crests
		--	[220776] = true,	--	OC	Glorious Cluster of Gilded Harbinger Crests
		--	[220773] = true,	--	OC	Celebratory Pack of Runed Harbinger Crests
		--	[220767] = true,	--	OC	Triumphant Satchel of Carved Harbinger Crests

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	XX	WORLD OF WARCRAFT:	EVENTS RETAIL
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

	--	Darkmoon Faire			Monthly 
			[ 78910] = true, 	--		Sack o' Tokens
			[ 78909] = true, 	--		Sack o' Tokens
			[ 78908] = true, 	--		Sack o' Tokens
			[ 78907] = true, 	--		Sack o' Tokens
			[ 78906] = true, 	--		Sack o' Tokens
			[ 78905] = true, 	--		Sack o' Tokens
			[ 78904] = true, 	--		Pouch o' Tokens
			[ 78903] = true, 	--		Pouch o' Tokens
			[ 78902] = true, 	--		Pouch o' Tokens
			[ 78901] = true, 	--		Pouch o' Tokens
			[ 78900] = true, 	--		Pouch o' Tokens
			[ 78899] = true, 	--		Pouch o' Tokens
			[ 78898] = true, 	--		Sack o' Tokens
			[ 78897] = true, 	--		Pouch o' Tokens
	
	--	Trial of Style			Random Event
			[147576] = true,	--	BG	Trial of Style Consolation Prize
			[147575] = true,	--	BG	Trial of Style Reward: Third Place
			[147574] = true,	--	BG	Trial of Style Reward: Second Place
			[147573] = true,	--	BG	Trial of Style Reward: First Place

	--	Love is in the Air		Valentines Event									Older Items in Events Classic
		--	Quests & Dailies
			[147907] = true,	--	23	Heart-Shaped Carton		
			[ 21746] = true,	--		Lucky Red Envelope

	--	Noblegarden				Easter Event										Older Items in Events Classic
		--	Quests & Dailies
			[216874] = true,	--	24	Loot-Filled Basket							10 Levels Below Max	60-70
			[213428] = true,	--	24	Loot-Stuffed Basket							Below Above Range	01-59

	--	Brewfest				Brewfest Event										Older Items in Events Classic
			[117393] = true,	--	23	Keg-Shaped Treasure Chest
			[149752] = true,	--	BG	Keg-Shaped Treasure Box
			[ 54535] = true,	--		Keg-Shaped Treasure Chest

	--	Hallows End				Halloween Event										Older Items in Events Classic
		--	Quests & Dailies
			[209024] = true,	--	24	Loot-Filled Pumpkin
			[149574] = true,	--	BG	Loot-Stuffed Pumpkin

	--	Anniversary				WoW Anniversary Event								
			[232877] = true,	--	24	Timely Goodie Bag							
			[229359] = true,	--	24	Chromie's Goodie Bag
			[229355] = true,	--	24	Chromie's Premium Goodie Bag
			[226102] = true,	--	24	Chromie's Tour Goodie Bag
			[208211] = true,	--	23	Anniversary Gift  							19th Anniversary
			[187710] = true,	--	22	Anniversary Gift  							18th Anniversary
			[185906] = true,	--	21	Anniversary Gift  							17th Anniversary
			[178513] = true,	--	20	Anniversary Gift  							16th Anniversary
			[172014] = true,	--	19	Anniversary Gift  							15th Anniversary
			[162637] = true,	--	18	Anniversary Gift  							14th Anniversary
			[147876] = true,	--	17	Anniversary Gift  							13th Anniversary
			[139284] = true,	--	16	Anniversary Gift  							12th Anniversary
			[128513] = true,	--	15	Anniversary Gift  							11th Anniversary
		--	Added to Portal Room section below due to chat window spam on lower level characters, remove -- if you dont mind the spam or dont have lower toons.
		--	[233014] = true,	--	24	Bronze Celebration Cache of Treasures		Cancelled out due to Level 80 Item and Lower Levels Spams Chat
		--	[232471] = true,	--	24	Cache of Dark Iron Treasures				Cancelled out due to Level 80 Item and Lower Levels Spams Chat
	
	--	Winter Veil				Crhistmas Event										Older Items in Events Classic
		--	Quests & Dailies
			[149504] = true,	--	BG	Smokywood Pastures Special Present
			[149503] = true,	--	BG	Stolen Gift
			[116762] = true,  	--		Stolen Present			
			[117395] = true, 	--		Stolen Present			
			[ 93626] = true,  	--		Stolen Present			
			[ 73792] = true,  	--		Stolen Present			
			[ 17727] = true, 	--	23	Smokywood Pastures Gift Pack
			[ 17726] = true, 	--	23	Smokywood Pastures Special Gift
		--	Tree Gifts
			[210657] = true,	--	23	Gently Shaken Gift							Toy - Winter Veil Socks
			[209871] = true,	--	23	Winter Veil Gift							Toy - Junior Timekeeper's Racing Belt
			[192094] = true,	--	22	Winter Veil Gift							Toy - Falling Star Catcher
			[192093] = true,	--	22	Gently Shaken Gift							Toy - Falling Star Flinger
			[187561] = true,	--	21	Winter Veil Gift							Toy - Customizer Appearances
			[187520] = true,	--	21	Gently Shaken Gift							Toy - Rockin' Rollin' Racter Customizer 19.9.3
			[178529] = true,	--	20	Gently Shaken Gift							Toy - Wreath-A-Rang
			[178528] = true,	--	20	Winter Veil Gift							Pet - Jingles [Baby Raptor]
			[172225] = true,	--	19	Gently Shaken Gift							Toy - Wild Holly
			[172224] = true,	--	19	Winter Veil Gift							Toy - Crashin' Thrashin' Battleship/Juggernaught Toy
			[162974] = true,	--	18	Gently Shaken Gift							Toy - Greatfateher Winter's Hearthstone
			[162644] = true,	--	18	Winter Veil Gift							Toy - Toy Armor Set
			[151350] = true,	--	17	Winter Veil Gift							Toy - Toy Weapon Set
			[151345] = true,	--	17	Gently Shaken Gift							Toy - Hearthstation
			[139343] = true,	--	16	Gently Shaken Gift							Toy - Disposable Winter Veil Suits
			[139341] = true,	--	16	Winter Veil Gift							Toy - Endothermic Blaster
			[128653] = true,	--	15	Winter Veil Gift							Toy - Crashin' Thrashin' Flamer Controller
			[128652] = true,	--	15	Gently Shaken Gift							Toy - Red Wooden Shield
			[116761] = true,	--	14	Winter Veil Gift							Toy - Crashin' Thrashin' Shredder Controller
			[104319] = true,	--	13	Winter Veil Gift							Toy - Crashin' Thrashin' Flyer Controller
			[ 90892] = true,	--	12	Winter Veil Gift							Toy - Special Edition Foot Ball & The Pigskin
			[ 70938] = true,	--	11	Winter Veil Gift							Mog - Gaudy Winter Veil Sweater
			[ 67443] = true,	--	10	Winter Veil Gift							Toy - MiniZep Controller
		
	--	Remixes					One Time Event?
			[223911] = true,	--		Greater Bronze Cache
			[223910] = true,	--		Bronze Cache
			[223909] = true,	--		Lesser Bronze Cache
			[223908] = true,	--		Minor Bronze Cache
			[221509] = true,	--		Timerunner's Weaponry
			[211279] = true,	--		Cache of Infinite Treasure

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	10	WORLD OF WARCRAFT:	DRAGONFLIGHT
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[218130] = true,	--		Adventurer's Footlocker
			[217111] = true,	--		Cache of Awakened Dreams
			[217110] = true,	--		Cache of Awakened Embers
			[217109] = true,	--		Cache of Awakened Storms
			[215364] = true,	--		Cache of Dreams
			[215363] = true,	--		Cache of Embers
			[215362] = true,	--		Cache of Storms
			[213429] = true,	--		Meticulous Archivist's Appendix
			[213190] = true,	--		Preserved Djaradin Tome
			[213189] = true,	--		Preserved Dragonkin Tome
			[213188] = true,	--		Dusty Dracthyr Tome
			[213187] = true,	--		Dusty Drakonid Tome
			[213186] = true,	--		Dusty Niffen Tome
			[213185] = true,	--		Dusty Centaur Tome
			[213177] = true,	--		Immaculate Tome
			[213176] = true,	--		Preserved Isles Tome
			[213175] = true,	--		Dusty Djaradin Tome
			[211414] = true,	--		Blossoming Dreamtrove
			[211413] = true,	--		Budding Dreamtrove
			[211411] = true,	--		Sprouting Dreamtrove
			[211410] = true,	--		Bloomed Wilding Cache
			[211394] = true,	--		Harvested Dreamseed Cache
			[211389] = true,	--		Cache of Overblooming Treasures
			[211373] = true,	--		Bag of Many Wonders
			[211303] = true,	--		Dryad's Supply Pouch
			[210872] = true,	--		Satchel of Dreams
			[210549] = true,	--		Dream Racer's Purse
			[210063] = true,	--		Invader's Satchel of Helpful Goods
			[208090] = true,	--		Contained Paracausality
			[208054] = true,	--		Mystery Box
			[207584] = true,	--		Box of Volatile Reality
			[207583] = true,	--		Box of Collapsed Reality
			[207582] = true,	--		Box of Tampered Reality
			[206135] = true,	--	OW	Heroic Dungeon Delver's Trophy Chest
			[205983] = true,	--	OW	Scentsational Niffen Treasures
			[205966] = true,	--		Cache of Aberrus Treasures
			[205964] = true,	--	OW	Small Loammian Supply Pack
		--	[205423] = false,	--		Large Shadowflame Residue Sack
		--	[205423] = false,	--		Shadowflame Residue Sack
			[205373] = true,	--	OW	Researcher's Scrounged Goods
			[205371] = true,	--	OW	Appreciative Researcher's Scrounged Goods
			[205370] = true,	--	OW	Researcher'S Gift
			[205369] = true,	--		Appreciative Researcher's Gift
			[205367] = true,	--		Indebted Researcher's Gift
			[205347] = true,	--		Gathered Niffen Resources
			[205346] = true,	--	OW	Hidden Niffen Treasure
			[205288] = true,	--		Buried Niffen Collection
			[205248] = true,	--	OW	
			[205247] = true,	--		Clinking Dirt-Covered Pouch
			[205226] = true,	--	OW	Cavern Racer's Purse
			[204724] = true,	--	OW	Drake's Small Chest
		--	[204712] = true,	--		Brimming Loamm Niffen Supply Satchel			Warbound (Barter Boulder)
			[204381] = true,	--	OW	Brimming Valdrakken Accord Supply Pack
			[204359] = true,	--		Reach Raver's Purse
			[203681] = true,	--	BG	Stormed Primalist Cache
			[203476] = true,	--	BG	Primalist Cache
			[203450] = true,	--	BG	Bottomless Bag of Skins
			[203449] = true,	--	BG	Bottomless Bag of Herbs
			[203448] = true,	--	BG	Bottomless Bag of Ore
			[203447] = true,	--	BG	Bottomless Bag of Optional Goods
			[203444] = true,	--	BG	Bottomless Bag of General Goods
			[203441] = true,	--	BG	Bottomless Bag of Tailoring Goods
			[203440] = true,	--	BG	Bottomless Bag of Leatherworking Goods
			[203439] = true,	--	BG	Bottomless Bag of Jewelcrafting Goods
			[203438] = true,	--	BG	Bottomless Bag of Inscription Goods
			[203437] = true,	--	BG	Bottomless Bag of Engineering Goods
			[203436] = true,	--	BG	Bottomless Bag of Enchanting Goods
			[203435] = true,	--	BG	Bottomless Bag of Alchemy Goods
			[203434] = true,	--	BG	Bottomless Bag of Blacksmithing Goods
			[202371] = true,	--	BG	Glowing Primalist Cache
			[202172] = true,	--	BG	Overflowing Satchel of Coins
			[202171] = true,	--	BG	Dragon Purse
			[202142] = true,	--	OW	Dragonbane Keep Strongbox
			[202122] = true,	--	BG	Primal Chaos Cluster
			[202104] = true,	--	BG	Weighted Sac of Swog Treasures
			[202103] = true,	--	BG	Immaculate Sac of Swog Treasures
			[202102] = true,	--	BG	Immaculate Sac of Swog Treasures
			[202101] = true,	--	BG	Topped Trunk of Disenchanted Detritus
			[202100] = true,	--	BG	Populous Pack of Castoff Cloth
			[202099] = true,	--	BG	Stocked Sack of Hale Herbs
			[202098] = true,	--	BG	Crowded Crate of Mined Materials
			[202097] = true,	--	OW	Bulging Box of Skins and Scales
			[202083] = true,	--	BG	Tyler's Test Box
			[202080] = true,	--	BG	Cache of Vault Treasures
			[202079] = true,	--	BG	Cache of Vault Treasures
		--	[202059] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent
			[202058] = true,	--	BG	Timewatcher's Patience
			[202057] = true,	--	BG	Earthwarden's Prize
			[202056] = true,	--	BG	Keeper's Glory
			[202055] = true,	--	BG	Dreamer's Vision
			[202054] = true,	--	BG	Queen's Gift
		--	[202053] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent
			[202052] = true,	--	OW	Timewatcher's Patience
			[202051] = true,	--	BG	Earthwarden's Prize
			[202050] = true,	--	BG	Keeper's Glory
			[202049] = true,	--	BG	Dreamer's Vision
			[202048] = true,	--	BG	Queen's Gift
			[201818] = true,	--	BG	Twilight Strongbox
			[201817] = true,	--	OW	Twilight Cache
			[201757] = true,	--	BG	Plundered Supplies
			[201756] = true,	--	BG	Bulging Coin Purse
			[201755] = true,	--	BG	Obsidian Forgemaster's Strongbox
			[201754] = true,	--	OW	Obsidian Forgemaster's Cache
			[201728] = true,	--	OW	Vakril's Strongbox
			[201462] = true,	--	BG	Curiously-Shaped Stomach
			[201439] = true,	--	BG	Renewed Dream
			[201354] = true,	--	BG	Bag of Plate Armor Reagents
			[201353] = true,	--		Bag of Mail Armor Reagents
			[201352] = true,	--	OW	Bag of Leather Reagents
			[201343] = true,	--	BG	Bag of Cloth Armor Reagents
			[201326] = true,	--	BG	Draconic Satchel of Cooperation
			[201299] = true,	--	BG	Docile Frosty Soul
			[201298] = true,	--	BG	Docile Fiery Soul
			[201297] = true,	--	BG	Docile Earthen Soul
			[201296] = true,	--	BG	Docile Airy Soul
			[201252] = true,	--	BG	10.0 Bronze PvP Chest (DNT)
			[201251] = true,	--	BG	Pillaged Contender's Strongbox
			[201250] = true,	--	BG	Victorious Contender's Strongbox
			[200936] = true,	--	BG	Encaged Earthen Soul
			[200934] = true,	--	BG	Encaged Frosty Soul
			[200932] = true,	--	BG	Encaged Airy Soul
			[200931] = true,	--	BG	Encaged Fiery Soul
			[200611] = true,	--	BG	Dragon Racing Purse - Third Place
			[200610] = true,	--	BG	Dragon Racing Purse - Second Place
			[200609] = true,	--	BG	Dragon Racing Purse - First Place
			[200516] = true,	--	BG	Grand Hunt Spoils
			[200515] = true, 	--	OW	Grand Hunt Spoils
			[200513] = true, 	--	OW	Grand Hunt Spoils
			[200477] = true,	--	BG	Stack of VIP Passes
			[200468] = true, 	--	OW	Grand Hunt Spoils
			[200300] = true,	--	BG	Sack of Looted Treasures
			[200156] = true,	--	BG	Amethyzarite Geode
			[200095] = true,	--	OW	Supply-Laden Soup Pot
			[200094] = true,	--	BG	Caravan Strongbox
			[200073] = true,	--	OW	Valdrakken Treasures
			[200072] = true,	--	OW	Dragonbane Keep Strongbox
			[200070] = true,	--	OW	Obsidian Strongbox
			[200069] = true,	--	OW	Obsidian Cache
			[199475] = true,	--	BG	Overflowing Valdrakken Accord Supply Pack
			[199474] = true,	--	BG	Overflowing Maruuk Centaur Supply Satchel
			[199473] = true,	--	BG	Overflowing Iskaaran Supply Pack
			[199472] = true,	--	BG	Overflowing Dragon Expedition Supply Pack
			[199342] = true,	--	BG	Weighted Sac of Swog Treasures
			[199341] = true,	--	BG	Regurgitated Sac of Swog Treasures
			[199192] = true,	--	OW	Dragon Racer's Purse
			[199108] = true,	--	BG	Bag of Discount Goods
			[198869] = true,	--	BG	Large Valdrakken Accord Supply Pack
			[198868] = true,	--	OW	Small Valdrakken Accord Supply Pack
			[198867] = true,	--	BG	Large Iskaaran Supply Pack
			[198866] = true,	--	BG	Small Iskaaran Supply Pack
			[198865] = true,	--	BG	Large Dragon Expedition Supply Pack
			[198864] = true,	--	BG	Large Maruuk Centaur Supply Satchel
			[198863] = true,	--	BG	Small Dragon Expedition Supply Pack
		--	[198657] = false,	--	LP	Forgotten Jewelry Box
			[198439] = true,	--	BG	Aged Recipe in a Bottle
			[198438] = true,	--	BG	Draconic Recipe in a Bottle
		--	[198395] = false,	--	NO	Dull Spined Clam
			[198172] = true,	--	BG	Bundle of Fireworks
			[198171] = true,	--	BG	Suspiciously Silent Crate Gold
			[198170] = true,	--	BG	Suspiciously Silent Crate Silver
			[198169] = true,	--	BG	Suspiciously Silent Crate Bronze
			[198168] = true,	--	BG	Suspiciously Ticking Crate Gold
			[198167] = true,	--	BG	Suspiciously Ticking Crate Silver
			[198166] = true,	--	BG	Suspiciously Ticking Crate Bronze
			[194750] = true,	--	BG	Professional Equipment
			[194419] = true,	--	BG	Life Pool Herb Pouch
			[194072] = true,	--		Sack of Gold
		--	[194037] = false,	--	NO	Heavy Chest (Requires Looted Key)
			[193376] = true,	--	BG	Adenedal's Tidy Purse
		--	[192893] = true,	--	BG	Jeweled Dragon's Heart						Crafting Reagent
			[192892] = true,	--	OW	Timewatcher's Patience
			[192891] = true,	--	BG	Earthwarden's Prize Bronze
			[192890] = true,	--	BG	Keeper's Glory Bronze
			[192889] = true,	--	BG	Dreamer's Vision Bronze
			[192888] = true,	--	BG	Queen's Gift Bronze
			[189765] = true,	--		Maruuk Centaur Supply Satchel

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	09	WORLD OF WARCRAFT:	SHADOWLANDS
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[192438] = true,	--	BG	Cache of Fated Treasures
			[192437] = true,	--		Cache of Fated Treasures
			[191701] = true,	--	OW	Bag of Explored Souls
			[191303] = true,	--	OW	Overflowing Chest of Riches
			[191302] = true,	--	BG	Bottled Night Sky
			[191301] = true,	--	BG	Treatise on Patterns in the Purpose
		--	[191296] = false,	--	LP	Enchanted Lockbox
			[191203] = true,	--	BG	Dragonscale Expedition Supplies
			[191139] = true,	--		Tribute of the Enlightened Elders
			[191041] = true,	--	BG	Cache of Sepulcher Treasures
			[191040] = true,	--	OW	Cache of Sepulcher Treasures (252+)
			[191030] = true,	--	BG	Cosmic Flux Parcel
		--	[190954] = false,	--	LP	Serevite Lockbox
			[190823] = true,	--	BG	Firim's Mysterious Cache
			[190656] = true,	--	OW	Cache of Sepulcher Treasures (hc))
			[190655] = true,	--	OW	Cache of Sepulcher Treasures
			[190610] = true,	--	OW	Tribute of the Enlightened Elders
			[190382] = true,	--	BG	Warped Pocket Dimension
		--	[190339] = false,	--	OW	Enlightened Offering						Rep Token not a Cache - Use New Openables Addon
			[190178] = true,	--	OW	Pouch of Protogenic Provisions
			[189428] = true,	--	BG	9.2 Pet Battle Playtest Bag of Goodies
			[188796] = true,	--	BG	Cypher Test Item
		--	[188787] = false,	--	LP	Locked Broker Luggage
			[187817] = true,	--	BG	Korthite Crystal Geode
			[187787] = true,	--	OW	Ephemera Orb
			[187781] = true,	--	OW	Olea Cache
			[187780] = true,	--	BG	Enlightened Broker Supplies
			[187659] = true,	--	BG	Adventurer's Footlocker
			[187605] = true,	--	BG	Broken Isles Gem Delivery
			[187604] = true,	--	BG	Broken Isles Enchantment Delivery
			[187601] = true,	--	BG	Broken Isles Leather Delivery
			[187600] = true,	--	BG	Broken Isles Ore Delivery
			[187599] = true,	--	BG	Broken Isles Herb Delivery
			[187598] = true,	--	BG	Broken Isles Cloth Delivery
			[187597] = true,	--	BG	Broken Isles Fish Delivery
			[187596] = true,	--	BG	Broken Isles Meat Delivery
			[187575] = true,	--	OW	Korthian Fishing Cache
			[187573] = true,	--	OW	Brokers Enchanting Mote of Potentation
			[187571] = true,	--	OW	Brokers Mining Mote of Potentation
			[187570] = true,	--	OW	Brokers Skinning Mote of Potentation
			[187569] = true,	--	OW	Brokers Tailoring Mote of Potentation
			[187577] = true,	--	OW	Korthian Meat Cache
			[187576] = true,	--	OW	Korthian Skinning Cache
			[187574] = true,	--	OW	Brokers Overflowing Bucket
			[187572] = true,	--	OW	Brokers Herbalism Mote of Potentation
			[187551] = true,	--	OW	Small Korthian Supply Chest
			[187543] = true,	--		Death's Advance War Chest
			[187503] = true,	--	BG	Bundle of Archived Research
			[187502] = true,	--	BG	Byron Test Relic Fragments Box (Immediate)
			[187494] = true,	--	BG	Byron Test Relic Fragments Box
			[187440] = true,	--	OW	Feather-Stuffed Helm
			[187354] = true,	--	OW	Abandoned Broker Satchel
		--	[187351] = true,	--	OW	Stygic Cluster								Bind on Account
			[187346] = true,	--	BG	Lost Memento
			[187278] = true,	--	OW	Talon-Pierced Mawsworn Lockbox
			[187254] = true,	--	BG	Arrangement of Anima
			[187222] = true,	--	BG	Stygic Singularity
			[187221] = true,	--	BG	Soul Ash Cache
			[187182] = true,	--	BG	Hatching Corpsefly Egg
			[187029] = true,	--	OW	Mysterious Gift from Ve'nari
			[187028] = true,	--	OW	Supplies of the Archivists' Codex
			[186971] = true,	--	BG	Feeder's Hand
			[186970] = true,	--	OW	Feeder's Hand and Key
			[186708] = true,	--	OW	Gold Filled Paint Brush Cup
			[186707] = true,	--	OW	Gold Filled Crate
			[186706] = true,	--	OW	Gold Filled Hat
			[186705] = true,	--	OW	Gold Filled Chalice
			[186694] = true,	--	BG	Shaded Bag of Ore
			[186693] = true,	--	OW	Gold Filled Wheelbarrow
			[186692] = true,	--	BG	Gold Filled Helmet
			[186691] = true,	--	OW	Gold Filled Satchel
			[186690] = true,	--	BG	Gold Filled Barrel
			[186688] = true,	--	OW	Gold Filled Wash Bucket
			[186680] = true,	--	OW	Gold Filled Boot
			[186650] = true,	--	OW	Death's Advance Supplies
			[186533] = true,	--	OW	Cache of SAnctum Treasues (hc)
			[186531] = true,	--		Cache of Sanctum Treasures
			[186196] = true,	--		Death's Advance War Chest
		--	[186161] = false,	--	LP	Stygian Lockbox
		--	[186160] = false,	--	LP	Locked Artifact Case
			[185993] = true,	--		Ascended War Chest
			[185992] = true,	--	OW	War Chest of the Undying Army
			[185991] = true,	--	OW	War Chest of the Wild Hunt
			[185990] = true,	--		Harvester's War Chest
			[185972] = true,	--	OW	Tormentor's Cache
		--	[185940] = true,	--		Pristine Survival Kit					Not Instant Open		Level 60 Character Boost
			[185834] = true,	--	BG	Orboreal Distinguishment
			[185833] = true,	--	BG	Shipment of Lightless Silk
			[185832] = true,	--	OW	Shipment of Elethium Ore
			[185765] = true,	--	BG	Shipment of Heavy Callous Hide
			[184869] = true,	--	OW	Cache of Nathrian Treasures
			[184868] = true,	--	OW	Cache of Nathrian Treasures (hc)
		--	[184866] = false,	--	NO	Grummlepouch
			[184843] = true,	--	OW	Salvaged Supplies
			[184812] = true,	--	BG	Apolon's Bounty
			[184811] = true,	--	BG	Artemede's Bounty
			[184810] = true,	--	BG	Plundered Supplies
			[184648] = true,	--	OW	Hero's Enchanting Cache
			[184647] = true,	--	OW	Hero's Herbalism Cache
			[184646] = true,	--	OW	Hero's Mining Cache
			[184645] = true,	--	OW	Hero's Skinning Cache
			[184644] = true,	--	OW	Hero's Tailoring Cache
			[184643] = true,	--	OW	Champion's Enchanting Cache
			[184642] = true,	--	OW	Champion's Herbalism Cache
			[184641] = true,	--	OW	Champion's Mining Cache	
			[184640] = true,	--	OW	Champion's Skinning Cache
			[184639] = true,	--	OW	Champion's Tailoring Cache
			[184638] = true,	--	OW	Hero's Fish Cache
			[184637] = true,	--	OW	Hero's Meat Cache
			[184636] = true,	--	OW	Adventurer's Skinning Cache
			[184635] = true,	--		Adventurer's Mining Cache
			[184634] = true,	--	OW	Adventurer's Herbalism Cache
			[184633] = true,	--	OW	Champion's Meat Cache
			[184632] = true,	--	OW	Champion's Fish Cache
			[184631] = true,	--	OW	Adventurer's Enchanting Cache
			[184630] = true,	--	OW	Adventurer's Tailoring Cache
			[184627] = true,	--	BG	Sacrificial Red Envelope
			[184589] = true,	--	BG	Bag of Potions
			[184584] = true,	--	BG	Byron Test Callings Box
			[184522] = true,	--		Veiled Satchel of Cooperation
			[184444] = true,	--	BG	Supplies for the Path
			[184395] = true,	--		Fallen Adventurer's Cache
			[184158] = true,	--	BG	Oozing Necroray Egg
			[184103] = true,	--	BG	Cracked Blight-Touched Egg
			[184048] = true,	--	OW	Weapon Satchel of the Wild Hunt
			[184047] = true,	--	OW	Ascended Chest of Arms
			[184046] = true,	--	OW	Undying Army Weapon Cache
			[184045] = true,	--	OW	Martial Tithe of the Court of Harvesters
			[183886] = true,	--	BG	Sika's Rare Ore Pouch
			[183885] = true,	--	BG	Sika's Spare Ore Pouch
			[183884] = true,	--	BG	Pocketful of Assorted Nuggets
			[183883] = true,	--	BG	Bulging Collection of Random Bits
			[183882] = true,	--	BG	Collection of Random Bits
			[183835] = true,	--	BG	Crate of Zandalari Archaeology Fragments
			[183834] = true,	--	BG	Crate of Drust Archaeology Fragments
			[183822] = true,	--		Icecrown Survival Kit
			[183703] = true,	--	OW	Bonesmith's Satchel
			[183702] = true,	--	OW	Nature's Splendor
			[183701] = true,	--		Cleansing Rite Materials
			[183699] = true,	--	OW	Exquisite Ingredients
			[183429] = true,	--	BG	Stitched Satchel of Venthyr Goods
			[183428] = true,	--	BG	Stitched Satchel of Aspirant Goods
			[183426] = true,	--	BG	Stitched Satchel of Fae Goods
			[183424] = true,	--	BG	Stitched Satchel of Maldraxxi Goods
			[182591] = true,	--	BG	Vinecovered Infused Rubies
			[182590] = true,	--	BG	Vinewormed Coin Pouch
			[182114] = true,	--	BG	Assorted Parts and 'Things'
			[181780] = true,	--	BG	An Undelivered Tradesman's Shipment
			[181779] = true,	--	BG	A "Wrapped" Weapon
			[181778] = true,	--	BG	Sack of Shinies
			[181767] = true,	--	BG	Small Coin Purse
			[181741] = true,	--		Tribute of the Paragon
			[181739] = true,	--	BG	Bag of Soul Ash
			[181733] = true,	--		Tribute of the Duty-Bound
			[181732] = true,	--		Tribute of the Ambitious
			[181557] = true,	--		Favor of the Court
			[181556] = true,	--		Tribute of the Court
			[181476] = true,	--		Tribute of the Wild Hunt
			[181475] = true,	--		Bounty of the Grove Warden
			[181372] = true,	--		Tribute of the Ascended
			[180989] = true,	--	BG	Novice's Overflowing Satchel
			[180988] = true,	--	BG	Journeyman's Overflowing Satchel
			[180985] = true,	--	BG	Novice's Stuffed Satchel
			[180984] = true,	--	BG	Journeyman's Stuffed Satchel
			[180983] = true,	--	BG	Artisan's Stuffed Satchel
			[180981] = true,	--	BG	Novice's Large Satchel
			[180980] = true,	--	OW	Journeyman's Large Satchel
			[180979] = true,	--	BG	Artisan's Large Satchel
			[180977] = true,	--	BG	Spirit-Tender's Satchel
			[180976] = true,	--	OW	Artisan's Satchel
			[180975] = true,	--	BG	Journeyman's Satchel
			[180974] = true,	--	OW	Novice's Satchel
			[180875] = true,	--	BG	Carriage Cargo
			[180649] = true,	--	OW	Wild Hunt Supplies
			[180648] = true,	--	OW	Court of Harvesters Supplies
			[180647] = true,	--	OW	Ascended Supplies
			[180646] = true,	--	OW	Supplies of the Undying Army
		--	[180592] = false,	--	OW	Trapped Stonefiend							Not A Cache, its a Pet - Use New Openables Addon
		--	[180533] = false,	--	LP	Solenium Lockbox
		--	[180532] = false,	--	LP	Oxxein Lockbox
		--	[180522] = false,	--	LP	Phaedrum Lockbox
			[180442] = true,	--	BG	Bag of Sin Stones
			[180386] = true,	--	BG	Herbalist's Pouch
		--	[180380] = false,	--	BG	Lace Draperies								Requires Shadowlands Tailoring 100 - Use New Openables Addon
		--	[180379] = false,	--	BG	Exquisitely Woven Rug						Requires Shadowlands Tailoring  75 - Use New Openables Addon
			[180378] = true,	--	BG	Forgemaster's Crate
			[180355] = true,	--	OW	Ornate Pyx
			[180128] = true,	--	BG	Harvester's Elite Bounty Purse
			[180085] = true,	--		Kyrian Keepsake
			[179380] = true,	--	BG	Redelev Purse
		--	[179311] = false,	--	LP	Oxxein Lockbox
			[178969] = true,	--	BG	Test Container
			[178968] = true,	--	BG	Weekly Gardener's Satchel
			[178967] = true,	--	BG	Large Gardener's Satchel
			[178966] = true,	--	BG	Gardener's Satchel
			[178965] = true,	--	BG	Small Gardener's Satchel
			[178529] = true,	--		Pouch of Shinies
			[178528] = true,	--		Pouch of Shinies
			[178128] = true,	--		Pouch of Shinies
			[178078] = true,	--	BG	Reborn Spirit Cache
			[178040] = true,	--	OW	Condensed Stygia
			[175135] = true,	--	BG	Atticus's Spare Supplies
			[175095] = true,	--	BG	Book of Tickets

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	08	WORLD OF WARCRAFT:	BATTLE FOR AZEROTH
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[174961] = true,	--		Uldum Assault Cache
			[174960] = true,	--		Uldum Assault Cache
			[174959] = true,	--		Pandaria Assault Cache
			[174958] = true,	--		Pandaria Assault Cache
			[174652] = true,	--	BG	Satchel of Forgotten Heirlooms
			[174642] = true,	--	BG	Corrupted Ny'alotha Raid Item
			[174638] = true,	--	BG	Relinquished Azerite Chestpiece
			[174637] = true,	--	BG	Relinquished Azerite Chestpiece
			[174636] = true,	--	BG	Relinquished Azerite Chestpiece
			[174635] = true,	--	BG	Relinquished Azerite Helm
			[174634] = true,	--	BG	Relinquished Azerite Helm
			[174633] = true,	--	BG	Relinquished Azerite Helm
			[174632] = true,	--	BG	Relinquished Azerite Spaulders
			[174631] = true,	--	BG	Relinquished Azerite Spaulders
			[174630] = true,	--	BG	Relinquished Azerite Spaulders
			[174529] = true,	--	BG	Crate of Coalescing Visions
			[174484] = true,	--	BG	Uldum Accord Supplies
			[174483] = true,	--	BG	Rajani Supplies
			[174358] = true,	--	BG	Unopened Blackrock Supply Crate
			[174195] = true,	--	BG	Bag of Gems
			[174194] = true,	--	BG	Bag of Enchanting
			[174184] = true,	--	BG	Bag of Cloth
			[174183] = true,	--	BG	Bag of Leather
			[174182] = true,	--	BG	Bag of Ore
			[174181] = true,	--	BG	Bag of Herbs
			[174039] = true,	--	BG	Crate of Cursed Mementos
			[173997] = true,	--	BG	Whispering Reef Salvage
			[173996] = true,	--	BG	Verdant Wilds Salvage
			[173995] = true,	--	BG	Venture Co. 'Salvage'
			[173994] = true,	--	BG	Un'gol Ruins Salvage
			[173993] = true,	--	BG	Snowblossom Salvage
			[173992] = true,	--	BG	Skittering Hollow Salvage
			[173991] = true,	--	BG	Rotting Mire Salvage
			[173990] = true,	--	BG	Molten Cay Salvage
			[173989] = true,	--	BG	Jorundall Salvage
			[173988] = true,	--	BG	Havenswood Salvage
			[173987] = true,	--	BG	Elemental Salvage
			[173983] = true,	--	BG	Vulpera Satchel of Salvage
			[173950] = true,	--	BG	Crestfall Salvage
			[173949] = true,	--	BG	Dread Chain Salvage
			[173734] = true,	--	BG	Mysterious Crate
		--	[173425] = false,	--	BG	Black Empire Mail Bracers
		--	[173425] = false,	--	BG	Black Empire Leather Bracers
		--	[173425] = false,	--	BG	Black Empire Cloth Bracers
		--	[173425] = false,	--	BG	Black Empire Plate Bracers
		--	[173425] = false,	--	BG	Black Empire Cloth Belt
		--	[173425] = false,	--	BG	Black Empire Cloth Spaulders
		--	[173425] = false,	--	BG	Black Empire Cloth Leggings
		--	[173425] = false,	--	BG	Black Empire Cloth Helm
		--	[173425] = false,	--	BG	Black Empire Cloth Gloves
		--	[173425] = false,	--	BG	Black Empire Cloth Boots
		--	[173425] = false,	--	BG	Black Empire Cloth Robes
		--	[173425] = false,	--	BG	Black Empire Leather Belt
		--	[173425] = false,	--	BG	Black Empire Leather Spaulders
		--	[173425] = false,	--	BG	Black Empire Leather Leggings
		--	[173425] = false,	--	BG	Black Empire Leather Helm
		--	[173425] = false,	--	BG	Black Empire Leather Gloves
		--	[173425] = false,	--	BG	Black Empire Leather Boots
		--	[173425] = false,	--	BG	Black Empire Leather Chestpiece
		--	[173425] = false,	--	BG	Black Empire Mail Belt
		--	[173425] = false,	--	BG	Black Empire Mail Spaulders
		--	[173425] = false,	--	BG	Black Empire Mail Leggings
		--	[173425] = false,	--	BG	Black Empire Mail Helm
		--	[173425] = false,	--	BG	Black Empire Mail Gloves
		--	[173425] = false,	--	BG	Black Empire Mail Boots
		--	[173425] = false,	--	BG	Black Empire Mail Chestpiece
		--	[173425] = false,	--	BG	Black Empire Plate Belt
		--	[173425] = false,	--	BG	Black Empire Plate Spaulders
		--	[173425] = false,	--	BG	Black Empire Plate Leggings
		--	[173425] = false,	--	BG	Black Empire Plate Helm
		--	[173425] = false,	--	BG	Black Empire Plate Gloves
		--	[173425] = false,	--	BG	Black Empire Plate Boots
		--	[173425] = false,	--	BG	Black Empire Plate Chestpiece
			[173372] = true,	--		Cache of the Black Empire
			[172021] = true,	--	BG	Marks of Sanctification Purse
			[171305] = true,	--		Sack of Plunder
			[171211] = true,	--		Venthyr's Coin Purse
			[171210] = true,	--	OW	Satchel of Nature's Bounty
			[171209] = true,	--	OW	Blooded Satchel
			[171988] = true,	--	BG	Adventurer's Footlocker
			[170539] = true,	--	BG	Plundered Supplies
		--	[170502] = false,	--	NO	Waterlogged Toolbox
			[170489] = true,	--	BG	Mardivas's Handmade Handbag
			[170473] = true,	--		Jingling Sack
			[170195] = true,	--		Voidcaster's Supply Bag
			[170190] = true,	--	BG	Mardivas' Bag of Containing
			[170188] = true,	--		Barnacled Bag of Goods
			[170185] = true,	--		Intact Naga Skeleton
			[170074] = true,	--	BG	Dented Ashmaul Strongbox Horde
			[170073] = true,	--	BG	Dented Ashmaul Strongbox Alliance
			[170065] = true,	--	BG	Re-Procedurally Generated Punchcard
			[170061] = true,	--		Rustbolt Supplies
			[169940] = true,	--	BG	Unshackled Supplies
			[169939] = true,	--	BG	Ankoan Supplies
			[169922] = true,	--	BG	Vim's Gift of Appreciation
			[169921] = true,	--	BG	Spine Guarded Supplies
			[169920] = true,	--	BG	Neri's Spare Supplies
			[169919] = true,	--	BG	Unshackled Commendation Crate
			[169917] = true,	--	BG	Mysterious Azshari Chest
			[169916] = true,	--	BG	Brew-Soaked Supplies
			[169915] = true,	--	BG	Poen's Stashed Supplies
			[169914] = true,	--	BG	Neri's Smart Supplies
			[169911] = true,	--	BG	Liberated Naga Cache
			[169910] = true,	--	BG	Vim's Scavenged Supplies
			[169909] = true,	--	BG	Poen's Neat Things
			[169908] = true,	--	BG	Cleverly Concealed Supplies
			[169905] = true,	--	BG	Faintly Glowing Supplies
			[169904] = true,	--	BG	Ankoan Commendation Crate
			[169903] = true,	--		Nazjatar Survival Pack
			[169850] = true,	--		Azeroth Mini Pack: Mechagon
			[169848] = true,	--		Azeroth Mini Pack: Bondo's Yard
			[169838] = true,	--		Azeroth Mini Pack: Starter Pack
			[169666] = true,	--		Stratholme Supply Crate
			[169485] = true,	--	BG	Benthic Gauntlets
			[169484] = true,	--	BG	Benthic Spaulders
			[169483] = true,	--	BG	Benthic Treads
			[169482] = true,	--	BG	Benthic Leggings
			[169481] = true,	--	BG	Benthic Cloak
			[169480] = true,	--	BG	Benthic Chestguard
			[169479] = true,	--	BG	Benthic Helm
			[169478] = true,	--	BG	Benthic Bracers
			[169477] = true,	--	BG	Benthic Girdle
		--	[169475] = false,	--	LP	Barnacled Lockbox
			[169471] = true,	--		Cogrenzy's Construction Toolkit
			[169430] = true,	--	BG	Unclaimed Black Market Container
			[169343] = true,	--	BG	Relinquished Azerite Chestpiece
			[169342] = true,	--	BG	Relinquished Azerite Chestpiece
			[169341] = true,	--	BG	Relinquished Azerite Chestpiece
			[169340] = true,	--	BG	Relinquished Azerite Helm
			[169339] = true,	--	BG	Relinquished Azerite Helm
			[169338] = true,	--	BG	Relinquished Azerite Helm
			[169337] = true,	--	BG	Relinquished Azerite Spaulders
			[169336] = true,	--	BG	Relinquished Azerite Spaulders
			[169335] = true,	--	BG	Relinquished Azerite Spaulders
			[169137] = true,	--	BG	Extraordinary Adventurer Augmentation
			[169133] = true,	--	BG	Crystallized Jelly
			[169113] = true,	--	BG	Advanced Adventurer Augmentation
			[168833] = true,	--	BG	Experimental Adventurer Augmentation
			[168740] = true,	--		Blingtron 7000
			[168488] = true,	--	BG	Seafarer's Lost Coin Pouch
			[168395] = true,	--		Irradiated Box of Assorted Parts
			[168394] = true,	--		Box of Assorted Parts
			[168266] = true,	--	BG	Strange Recycling Requisition
			[168264] = true,	--		Recycling Requisition
			[168263] = true,	--	BG	Mundane Recycling Requisition
			[168204] = true,	--		Small Metal Box
			[168162] = true,	--	BG	Chronal Cache of Cloth
		--	[168124] = true,	--	BG	Cache of War Resources						Character War Resources Transfer
			[168057] = true,	--	BG	Rustbolt Requisitions
			[167696] = true,	--	BG	Build-a-Computer Kit
			[166741] = true,	--	BG	Nomi's Grocery Tote
			[166537] = true,	--	BG	Relinquished Azerite Chestpiece
			[166536] = true,	--	BG	Relinquished Azerite Chestpiece
			[166535] = true,	--	BG	Relinquished Azerite Chestpiece
			[166534] = true,	--	BG	Relinquished Azerite Helm
			[166533] = true,	--	BG	Relinquished Azerite Helm
			[166532] = true,	--	BG	Relinquished Azerite Helm
			[166531] = true,	--	BG	Relinquished Azerite Spaulders
			[166530] = true,	--	BG	Relinquished Azerite Spaulders
			[166529] = true,	--	BG	Relinquished Azerite Spaulders
			[166515] = true,	--	BG	Relinquished Azerite Chestpiece
			[166514] = true,	--	BG	Relinquished Azerite Chestpiece
			[166513] = true,	--	BG	Relinquished Azerite Chestpiece
			[166512] = true,	--	BG	Relinquished Azerite Helm
			[166511] = true,	--	BG	Relinquished Azerite Helm
			[166510] = true,	--	BG	Relinquished Azerite Helm
			[166509] = true,	--	BG	Relinquished Azerite Spaulders
			[166508] = true,	--	BG	Relinquished Azerite Spaulders
			[166505] = true,	--	BG	Relinquished Azerite Spaulders
			[166300] = true,	--		7th Legion Supplies
			[166299] = true,	--		Honorbound Supplies
			[166298] = true,	--		Champions of Azeroth Supplies
			[166297] = true,	--		Order of Embers Supplie
			[166295] = true,	--		Proudmoore Admiralty Supplies
			[166294] = true,	--		Storm's Wake Supplies
			[166292] = true,	--		Zandalari Empire Supplies
			[166290] = true,	--		Voldunai Supplies
			[166282] = true,	--		Talanji's Expedition Supplies
			[166245] = true,	--		Tortollan Seekers Supplies

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	07	WORLD OF WARCRAFT:	LEGION
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[165851] = true,	--	BG	Bag of Anchors
			[165839] = true,	--	BG	Unopened Gnomeregan Supply Box
			[165732] = true,	--	BG	Cache of Dazar'alor Treasures
			[165731] = true,	--	BG	Cache of Dazar'alor Treasures
			[165730] = true,	--	BG	Cache of Dazar'alor Treasures
			[165729] = true,	--	BG	Cache of Dazar'alor Treasures
			[165718] = true,	--	BG	Steel Strongbox
			[165717] = true,	--	BG	Steel Strongbox
			[165716] = true,	--	BG	Bronze Strongbox
			[165715] = true,	--	BG	Silver Strongbox
			[165714] = true,	--	BG	Gold Strongbox
			[165713] = true,	--	BG	Bronze Strongbox
			[165712] = true,	--	BG	Silver Strongbox
			[165711] = true,	--		Gold Strongbox
			[164940] = true,	--	BG	Mysterious Satchel
			[164939] = true,	--	BG	Overstuffed Silkweave Purse
			[164938] = true,	--	BG	G.G. Gearbox
			[164931] = true,	--	BG	Rumbler's Purse
			[164627] = true,	--	BG	Crate of Highmountain Tauren Archaeology Fragments
			[164626] = true,	--	BG	Crate of Highborne Archaeology Fragments
			[164625] = true,	--	BG	Crate of Demon Archaeology Fragments
			[164264] = true,	--	BG	Steel Strongbox
			[164263] = true,	--	BG	Steel Strongbox
			[164262] = true,	--	BG	Steel Strongbox
			[164261] = true,	--	BG	Steel Strongbox
			[164260] = true,	--	BG	Cache of Uldir Treasures
			[164259] = true,	--	BG	Cache of Uldir Treasures
			[164258] = true,	--	BG	Cache of Uldir Treasures
			[164257] = true,	--	BG	Cache of Uldir Treasures
			[164254] = true,	--	BG	Steel Strongbox
			[164253] = true,	--	BG	Steel Strongbox
			[164252] = true,	--	BG	Champion's Strongbox
			[164251] = true,	--	BG	Champion's Strongbox
			[163826] = true,	--	BG	Raider's Supply Cache
			[163825] = true,	--	BG	Plundered Supplies
			[163734] = true,	--	BG	Bulging Coin Purse
			[163633] = true,	--		Captain Gulnaku's Treasure
			[163613] = true,	--		Sack of Plunder
			[163612] = true,	--		Wayfinder's Satchel
			[163611] = true,	--		Seafarer's Coin Pouch
			[163148] = true,	--	BG	Luxurious Hat Box
			[163146] = true,	--	BG	Fancy Hat Box
			[163144] = true,	--	BG	Striped Hat Box
			[163142] = true,	--	BG	Ironbound Hat Box
			[163141] = true,	--	BG	Spooky Hat Box
			[163139] = true,	--	BG	Carefully Wrapped Hat Box
			[163059] = true,	--	BG	Spoils of Jani
			[161878] = true,	--		Tiny Coin Purse
			[161084] = true,	--	BG	Recovered Stormsong Produce
			[161083] = true,	--		Satchel of Plundered Jewels
			[160831] = true,	--	BG	Cracking Cobra Egg
			[160578] = true,	--		Anglin' Art's Bag o' Fish
			[160514] = true,	--	BG	Maokka's Box
			[160485] = true,	--	BG	An Unforgettable Luncheon
			[160439] = true,	--	BG	Adventurer's Footlocker
			[160324] = true,	--	BG	Grumbling Sac
			[160322] = true,	--	BG	Pile of Ore
			[160268] = true,	--	BG	Bag of Armor (DNT)
			[160054] = true,	--	BG	War-Torn Satchel of Cooperation
			[159783] = true,	--		Kane's Coin Purse
		--	[157825] = false,	--	LP	Faronis Lockbox
		--	[157822] = false,	--	LP	Dreamweaver Lockbox
			[156836] = true,	--	BG	Bulging Package
			[156707] = true,	--	BG	Bret's Satchel of Helpful Goods
			[156698] = true,	--	BG	Tranquil Satchel of Helpful Goods
			[156689] = true,	--	BG	Scorched Satchel of Helpful Goods
			[156688] = true,	--	BG	Icy Satchel of Helpful Goods
			[156683] = true,	--	BG	Satchel of Helpful Goods
			[156682] = true,	--	BG	Otherworldly Satchel of Helpful Goods
			[154992] = true,	--	BG	Brawler's Footlocker
			[154991] = true,	--	BG	Brawler's Footlocker
			[153574] = true,	--	BG	Plain Hat Box
			[153504] = true,	--	BG	Cache of Antoran Treasures
			[153503] = true,	--	BG	Cache of Antoran Treasures
			[153502] = true,	--	BG	Cache of Antoran Treasures
			[153501] = true,	--	BG	Cache of Antoran Treasures
			[153248] = true,	--		Light's Fortune
			[153202] = true,	--		Argunite Cluster
			[153191] = true,	--	BG	Cracked Fel-Spotted Egg
			[153132] = true,	--	BG	Coffer of Argus Equipment
			[153122] = true,	--	BG	Wyrmtongue Cache of Magic
			[153121] = true,	--	BG	Wyrmtongue Cache of Skins
			[153120] = true,	--	BG	Wyrmtongue Cache of Minerals
			[153119] = true,	--	BG	Wyrmtongue Cache of Finery
			[153118] = true,	--	BG	Wyrmtongue Cache of Shiny Things
			[153117] = true,	--	BG	Wyrmtongue Cache of Supplies
			[153116] = true,	--	BG	Wyrmtongue Cache of Herbs
			[152868] = true,	--		Anglin' Art's Mudfish Bait
			[152582] = true,	--	BG	Stack of Skins
			[152581] = true,	--	BG	Bag of Jewels
			[152580] = true,	--	BG	Pile of Cloth
			[152578] = true,	--	BG	Sack of Herbs
		--	[152108] = false,	--	NO	Legionfall Chest
			[151638] = true,	--	BG	Leprous Sack of Pet Supplies
			[151558] = true,	--	BG	Champion's Strongbox
			[151557] = true,	--	BG	Champion's Strongbox
			[151554] = true,	--	BG	Time-Lost Keepsake Box
			[151553] = true,	--	BG	Time-Lost Keepsake Box
			[151552] = true,	--	BG	Time-Lost Keepsake Box
			[151551] = true,	--	BG	Time-Lost Keepsake Box
			[151550] = true,	--	BG	Time-Lost Keepsake Box
			[151482] = true,	--	BG	Time-Lost Wallet
			[151264] = true,	--	BG	Clunky Brawler's Purse
			[151238] = true,	--	BG	Dark Brawler's Purse
			[151235] = true,	--	BG	Filthy Brawler's Purse
			[151233] = true,	--	BG	Blingin' Brawler's Bag
			[151232] = true,	--	BG	Brawler's Package
			[151231] = true,	--	BG	Brawler's Egg
			[151230] = true,	--	BG	Croc-Skin Brawler's Purse
			[151229] = true,	--	BG	Brawler's Music Box
			[151225] = true,	--	BG	Wet Brawler's Purse
			[151224] = true,	--	BG	Bitten Brawler's Purse
			[151223] = true,	--	BG	Booming Brawler's Purse
			[151222] = true,	--	BG	Leather Brawler's Purse
			[151221] = true,	--	BG	Gooey Brawler's Purse
			[151060] = true,	--	BG	Keystone Container
			[150924] = true,	--	BG	Greater Tribute of the Broken Isles
			[149753] = true,	--	BG	Knapsack of Chilled Goods
			[147905] = true,	--	BG	Chest of Champion Equipment
			[147521] = true,	--	BG	Cache of Fel Treasures
			[147520] = true,	--	BG	Cache of Fel Treasures
			[147519] = true,	--	BG	Cache of Fel Treasures
			[147518] = true,	--	BG	Cache of Fel Treasures
			[147432] = true,	--	BG	Champion Equipment
			[146948] = true,	--	BG	Tribute of the Broken Isles
			[146801] = true,	--	BG	BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[146800] = true,	--	BG	BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[146799] = true,	--	BG	BUILDING CONTRIBUTION REWARD ITEM [NYI]
			[147446] = true,	--	BG	Brawler's Footlocker
			[146317] = true,	--		Mr. Smite's Supplies
			[144379] = true,	--	BG	Murderous Brawler's Purse
			[144378] = true,	--	BG	Gorestained Brawler's Purse
			[144377] = true,	--	BG	Beginning Brawler's Purse
			[144376] = true,	--	BG	Agile Brawler's Purse
			[144375] = true,	--	BG	Feathered Brawler's Purse
			[144374] = true,	--	BG	Groovy Brawler's Purse
			[144373] = true,	--	BG	Claw-Marked Brawler's Purse
			[144345] = true,	--	BG	Pile of Pet Goodies
			[144330] = true,	--	BG	Sprocket Container
			[144291] = true,	--	BG	Tadpole Gift
			[143948] = true,	--	BG	Chilled Satchel of Vegetables
		--	[143753] = false,	--	NO	Damp Pet Supplies
			[143607] = true,	--	BG	Soldier's Footlocker
			[143606] = true,	--	BG	Satchel of Battlefield Spoils
			[142381] = true,	--	BG	Oath of Fealty
			[142350] = true,	--	BG	Challenger's Purse
			[142342] = true,	--	BG	Glittering Pack
			[142115] = true,	--	BG	Crate of Ogre Archaeology Fragments
			[142114] = true,	--	BG	Crate of Draenor Clans Archaeology Fragments
			[142113] = true,	--	BG	Crate of Arakkoa Archaeology Fragments
			[142023] = true,	--	BG	Adventurer's Footlocker
			[141995] = true,	--	BG	Unclaimed Black Market Container
			[141350] = true,	--	BG	Kirin Tor Chest
			[141344] = true,	--	BG	Tribute of the Broken Isles
			[141184] = true,	--	BG	Violet Hold Contraband Locker
			[141183] = true,	--	BG	Bag of Confiscated Materials
			[141182] = true,	--	BG	Unmarked Suramar Vault Crate
			[141181] = true,	--	BG	Cache of the Black Dragon
			[141180] = true,	--	BG	Seaweed-Encrusted Satchel
			[141179] = true,	--	BG	Watertight Salvage Bag
			[141178] = true,	--	BG	Despoiled Keeper's Cache
			[141177] = true,	--	BG	Nightborne Rucksack
			[141176] = true,	--	BG	Haunted Ravencrest Keepsake
			[141175] = true,	--	BG	Challenger's Spoils
			[141174] = true,	--	BG	Violet Hold Contraband Locker
			[141173] = true,	--	BG	Bag of Confiscated Materials
			[141172] = true,	--	BG	Unmarked Suramar Vault Crate
			[141171] = true,	--	BG	Cache of the Black Dragon
			[141170] = true,	--	BG	Seaweed-Encrusted Satchel
			[141169] = true,	--	BG	Watertight Salvage Bag
			[141168] = true,	--	BG	Despoiled Keeper's Cache
			[141167] = true,	--	BG	Nightborne Rucksack
			[141166] = true,	--	BG	Haunted Ravencrest Keepsake
			[141165] = true,	--	BG	Challenger's Spoils
			[141164] = true,	--	BG	Violet Hold Contraband Locker
			[141163] = true,	--	BG	Bag of Confiscated Materials
			[141162] = true,	--	BG	Unmarked Suramar Vault Crate
			[141161] = true,	--	BG	Cache of the Black Dragon
			[141160] = true,	--	BG	Seaweed-Encrusted Satchel
			[141159] = true,	--	BG	Watertight Salvage Bag
			[141158] = true,	--	BG	Despoiled Keeper's Cache
			[141157] = true,	--	BG	Nightborne Rucksack
			[141156] = true,	--	BG	Haunted Ravencrest Keepsake
			[141155] = true,	--	BG	Challenger's Spoils
			[141069] = true,	--	BG	Skyhold Chest of Riches
			[140998] = true,	--	BG	Horde Strongbox
			[140997] = true,	--	BG	Alliance Strongbox
			[140601] = true,	--	BG	Sixtrigger Resource Crate
			[140591] = true,	--	BG	Shattered Satchel of Cooperation
			[140227] = true,	--		Mr. Smite's Supplies
			[140226] = true,	--		Mana-Tinged Pack
			[140225] = true,	--		Salvaged Armor
			[140224] = true,	--		Mr. Smite's Supplies
			[140222] = true,	--		Harvested Goods
			[140221] = true,	--		Found Sack of Gems
			[140220] = true,	--		Scavenged Cloth
			[140200] = true,	--	BG	Immaculate Nightshard Curio
			[140154] = true,	--	BG	Cache of Nightborne Treasures
			[140152] = true,	--	BG	Cache of Nightborne Treasures
			[140150] = true,	--	BG	Cache of Nightborne Treasures
			[140148] = true,	--	BG	Cache of Nightborne Treasures
			[139879] = true,	--	BG	Crate of Champion Equipment
			[139777] = true,	--	BG	Strange Crate
			[139771] = true,	--	BG	Seething Essence
			[139487] = true,	--	BG	Cache of Nightmarish Treasures
			[139486] = true,	--	BG	Cache of Nightmarish Treasures
			[139488] = true,	--	BG	Cache of Nightmarish Treasures
			[139484] = true,	--	BG	Cache of Nightmarish Treasures
			[139467] = true,	--	BG	Satchel of Spoils
			[139416] = true,	--	BG	Bloated Sewersucker
			[139383] = true,	--	BG	Keystone Container
			[139382] = true,	--	BG	Keystone Container
			[139381] = true,	--	BG	Keystone Container
			[139137] = true,	--	BG	Hag's Belongings
			[139049] = true,	--		Large Legion Chest
			[139048] = true,	--		Small Legion Chest
			[138476] = true,	--	BG	Bronze Strongbox
			[138475] = true,	--	BG	Silver Strongbox
			[138474] = true,	--	BG	Champion's Strongbox
			[138473] = true,	--	BG	Steel Strongbox
			[138472] = true,	--	BG	Steel Strongbox
			[138471] = true,	--	BG	Bronze Strongbox
			[138470] = true,	--	BG	Silver Strongbox
			[138469] = true,	--	BG	Champion's Strongbox
			[138098] = true,	--	BG	Iron-Bound Crate of Battlefield Goods
			[137608] = true,	--	BG	Growling Sac
			[137600] = true,	--	BG	Pile of Pants
			[137594] = true,	--	BG	Pile of Gems
			[137593] = true,	--	BG	Pile of Herbs
			[137592] = true,	--	BG	Pile of Ore
			[137591] = true,	--	BG	Pile of Skins
			[137590] = true,	--	BG	Pile of Silk
			[137565] = true,	--	BG	Warden's Field Kit
			[137564] = true,	--	BG	Nightfallen Hoard
			[137563] = true,	--	BG	Farondis Lockbox
			[137562] = true,	--	BG	Valarjar Cache
			[137561] = true,	--	BG	Highmountain Tribute
			[137560] = true,	--	BG	Dreamweaver Provisions
			[137414] = true,	--	BG	Pet Tournament Purse

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	06	WORLD OF WARCRAFT:	WARLORDS OF DRAENOR
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[136926] = false,	--	OW	Nightmare Pod
			[136383] = true,	--	BG	Ravencrest Cache
			[136362] = true,	--	BG	Ancient War Remnants
			[136359] = true,	--	BG	Shaman's Pouch
			[135546] = true,	--	BG	Fel-Touched Crate of Battlefield Goods
			[135545] = true,	--	BG	Savage Crate of Battlefield Goods
			[135544] = true,	--	BG	Tranquil Crate of Helpful Goods - Reuse Me
			[135543] = true,	--	BG	Rival's Crate of Battlefield Goods
			[135542] = true,	--	BG	Icy Crate of Battlefield Goods
			[135541] = true,	--	BG	Crusader's Crate of Battlefield Goods
			[135540] = true,	--	BG	Crate of Battlefield Goods
			[135539] = true,	--		Crate of Battlefield Goods
			[133804] = true,	--	BG	Rare Bag of Loot
			[133803] = true,	--	BG	Common Bag of Loot
			[133721] = true,	--	BG	Message in a Beer Bottle
			[133549] = true,	--		Muck-Covered Shoes
			[132892] = true,	--		Blingtron 6000
			[130186] = true,	--	BG	Intern Items - BJI
			[129746] = true,	--	BG	Oddly-Shaped Stomach
			[128803] = true,	--	BG	Savage Satchel of Cooperation
			[128670] = true,	--	BG	Savage Gift
			[128391] = true,	--	BG	Iron Fleet Treasure Chest
			[128327] = true,	--	BG	Small Pouch of Coins
			[128319] = true,	--	BG	Void-Shrouded Satchel
			[128216] = true,	--	BG	Dented Ashmaul Strongbox
			[128215] = true,	--	BG	Dented Ashmaul Strongbox
			[128214] = true,	--	BG	Dented Ashmaul Strongbox
			[128213] = true,	--	BG	Dented Ashmaul Strongbox
			[128025] = true,	--	BG	Rattling Iron Cage
			[127995] = true,	--	BG	Unclaimed Black Market Container
			[127855] = true,	--	BG	Iron Fleet Treasure Chest
			[127854] = true,	--	BG	Iron Fleet Treasure Chest
			[127853] = true,	--		Iron Fleet Treasure Chest
			[127831] = true,	--	BG	Challenger's Strongbox
			[127395] = true,	--		Ripened Strange Fruit
			[127148] = true,	--	BG	Silas' Secret Stash
			[127141] = true,	--	BG	Bloated Thresher
			[126947] = true,	--	BG	Nal'ryssa's Spare Mining Supplies
			[126924] = true,	--	BG	Champion's Strongbox
			[126923] = true,	--	BG	Champion's Strongbox
			[126922] = true,	--	BG	Ashmaul Strongbox
			[126921] = true,	--	BG	Ashmaul Strongbox
			[126920] = true,	--	BG	Champion's Strongbox
			[126919] = true,	--	BG	Champion's Strongbox
			[126918] = true,	--	BG	Ashmaul Strongbox
			[126917] = true,	--	BG	Ashmaul Strongbox
			[126916] = true,	--	BG	Bronze Strongbox
			[126915] = true,	--	BG	Silver Strongbox
			[126914] = true,	--	BG	Gold Strongbox
			[126913] = true,	--	BG	Steel Strongbox
			[126912] = true,	--	BG	Steel Strongbox
			[126911] = true,	--	BG	Bronze Strongbox
			[126910] = true,	--	BG	Silver Strongbox
			[126909] = true,	--	BG	Gold Strongbox
			[126908] = true,	--	BG	Bronze Strongbox
			[126907] = true,	--	BG	Silver Strongbox
			[126906] = true,	--	BG	Gold Strongbox
			[126905] = true,	--	BG	Steel Strongbox
			[126904] = true,	--	BG	Steel Strongbox
			[126903] = true,	--	BG	Bronze Strongbox
			[126902] = true,	--	BG	Silver Strongbox
			[126901] = true,	--	BG	Gold Strongbox
			[124670] = true,	--	BG	Sealed Darkmoon Crate
			[124054] = true,	--	BG	Time-Twisted Anomaly
			[123975] = true,	--		Greater Bounty Spoils
			[123963] = true,	--	BG	Recipe List: Masterwork Demonsteel
			[123962] = true,	--	BG	Recipe List: Hardened Leystone
			[123961] = true,	--	BG	Recipe List: Leysmithing
			[123858] = true,	--		Follower Retraining Scroll Case
			[123857] = true,	--		Runic Pouch
			[122718] = true,	--		Clinking Present
			[122613] = true,	--		Stash of Dusty Music Rolls
			[122607] = true,	--		Savage Satchel of Cooperation
			[122486] = true,	--		Blackrock Foundry Spoils
			[122485] = true,	--		Blackrock Foundry Spoils
			[122484] = true,	--		Blackrock Foundry Spoils
			[122483] = true,	--		Scouting Report: Nagrand
			[122482] = true,	--		Scouting Report: Spires of Arak
			[122481] = true,	--		Scouting Report: Talador
			[122480] = true,	--		Scouting Report: Gorgrond
			[122479] = true,	--		Scouting Report: Shadowmoon Valley
			[122478] = true,	--		Scouting Report: Frostfire Ridge
			[122242] = true,	--		Relic Acquisition Compensatory Package
			[122191] = true,	--		Bloody Stack of Invitations
			[122163] = true,	--		Routed Invader's Crate of Spoils
		--	[121331] = false,	--	LP	Leystone Lockbox
			[120356] = true,	--		Bronze Strongbox
			[120355] = true,	--		Silver Strongbox
			[120354] = true,	--		Gold Strongbox
			[120353] = true,	--		Steel Strongbox
			[120334] = true,	--		Satchel of Cosmic Mysteries
			[120325] = true,	--		Overflowing Stacked Card Deck
			[120324] = true,	--		Bursting Stacked Card Deck
			[120323] = true,	--		Bulging Stacked Card Deck
			[120322] = true,	--		Klinking Stacked Card Deck
			[120320] = true,	--		Invader's Abandoned Sack
			[120319] = true,	--		Invader's Damaged Cache
			[120312] = true,	--		Bulging Sack of Coins
			[120184] = true,	--		Ashmaul Strongbox
			[120170] = true,	--		Partially-Digested Bag
			[120151] = true,	--		Gleaming Ashmaul Strongbox
			[120147] = true,	--		Bloody Gold Purse
			[120146] = true,	--		Smuggled Sack of Gold
			[120142] = true,	--		Coliseum Champion's Spoils
			[119330] = true,	--		Steel Strongbox
			[119201] = true,	--		Jewelcrafting Payment
			[119200] = true,	--		Jewelcrafting Payment
			[119199] = true,	--		Jewelcrafting Payment
			[119198] = true,	--		Jewelcrafting Payment
			[119197] = true,	--		Jewelcrafting Payment
			[119196] = true,	--		Jewelcrafting Payment
			[119195] = true,	--		Jewelcrafting Payment
			[119191] = true,	--		Jewelcrafting Payment
			[119190] = true,	--		Unclaimed Payment
			[119189] = true,	--		Unclaimed Payment
			[119188] = true,	--		Unclaimed Payment
			[119043] = true,	--		Trove of Smoldering Treasures
			[119042] = true,	--		Crate of Valuable Treasures
			[119041] = true,	--		Strongbox of Mysterious Treasures
			[119040] = true,	--		Cache of Mingled Treasures
			[119037] = true,	--		Supply of Storied Rarities
			[119036] = true,	--		Box of Storied Treasures
			[119032] = true,	--		Challenger's Strongbox
		--	[119000] = false,	--	LP	Highmaul Lockbox
			[118931] = true,	--		Leonid's Bag of Supplies
			[118930] = true,	--		Bag of Everbloom Herbs
			[118929] = true,	--		Sack of Mined Ore
			[118928] = true,	--		Faintly-Sparkling Cache
			[118927] = true,	--		Maximillian's Laundry
			[118926] = true,	--		Huge Pile of Skins
			[118925] = true,	--		Plundered Booty
			[118924] = true,	--		Cache of Arms
			[118759] = true,	--		Alchemy Experiment
			[118706] = true,	--		Cracked Goren Egg
		--	[118697] = false,	--	NO	Big Bag of Pet Supplies
			[118531] = true,	--		Cache of Highmaul Treasures
			[118530] = true,	--		Cache of Highmaul Treasures
			[118529] = true,	--		Cache of Highmaul Treasures
		--	[118193] = false,	--	LP	Mysterious Shining Lockbox
			[118094] = true,	--		Dented Ashmaul Strongbox
			[118093] = true,	--		Dented Ashmaul Strongbox
			[118066] = true,	--		Ashmaul Strongbox
			[118065] = true,	--		Gleaming Ashmaul Strongbox
			[117414] = true,	--		Stormwind Guard Armor Package
			[117394] = true,	--		Satchel of Chilled Goods
			[117392] = true,	--		Loot-Filled Pumpkin
			[117388] = true,	--		Crate of Mantid Archaeology Fragments
			[117387] = true,	--		Crate of Mogu Archaeology Fragments
			[117386] = true,	--		Crate of Pandaren Archaeology Fragments
			[116980] = true,	--		Invader's Forgotten Treasure
		--	[116920] = false,	--	LP	True Steel Lockbox
			[116764] = true,	--		Small Pouch of Coins
			[116404] = true,	--		Pilgrim's Bounty
			[116376] = true,	--		Small Pouch of Coins
			[116202] = true,	--		Pet Care Package
			[116129] = true,	--		Dessicated Orc's Coin Pouch
			[116111] = true,	--		Small Pouch of Coins
			[116062] = true,	--		Greater Darkmoon Pet Supplies
			[114970] = true,	--		Small Pouch of Coins
			[114669] = true,	--		Tranquil Satchel of Helpful Goods
			[114662] = true,	--		Tranquil Satchel of Helpful Goods
			[114655] = true,	--		Scorched Satchel of Helpful Goods
			[114648] = true,	--		Scorched Satchel of Helpful Goods
			[114641] = true,	--		Icy Satchel of Helpful Goods
			[114634] = true,	--		Icy Satchel of Helpful Goods
			[114028] = true,	--		Small Pouch of Coins
			[113258] = true,	--		Blingtron 5000 Gift Package
			[112623] = true,	--		Pack of Fishing Supplies
			[112108] = true,	--		Cracked Egg
			[111600] = true,	--		Bronze Strongbox
			[111599] = true,	--		Silver Strongbox
			[111598] = true,	--		Gold Strongbox
			[110678] = true,	--		Darkmoon Ticket Fanny Pack
			[110592] = true,	--		Unclaimed Black Market Container
			[110278] = true,	--		Engorged Stomach
			[108740] = true,	--		Stolen Weapons
			[108738] = true,	--		Giant Draenor Clam
			[107271] = true,	--		Frozen Envelope
			[107270] = true,	--		Bound Traveler's Scroll
			[107077] = true,	--		Bag of Transformers
		--	[106895] = false,	--	LP	Iron-Bound Junkbox

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	05	WORLD OF WARCRAFT:	MISTS OF PANDARIA
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[106130] = true,	--		Big Bag of Herbs
			[105751] = true,	--		Kor'kron Shaman's Treasure
			[105714] = true,	--		Coalesced Turmoil
			[105713] = true,	--		Twisted Treasures of the Vale
			[104296] = true,	--		Ordon Ceremonial Robes
			[104292] = true,	--		Partially-Digested Meal
			[104275] = true,	--		Twisted Treasures of the Vale
			[104273] = true,	--		Flame-Scarred Cache of Offerings
			[104272] = true,	--		Celestial Treasure Box
			[104271] = true,	--		Coalesced Turmoil
			[104268] = true,	--		Pristine Stalker Hide
			[104263] = true,	--		Glinting Pile of Stone
			[104261] = true,	--		Glowing Blue Ash
			[104260] = true,	--		Satchel of Savage Mysteries
			[104258] = true,	--		Glowing Green Ash
			[104198] = true,	--		Mantid Artifact Hunter's Kit
			[104114] = true,	--		Curious Ticking Parcel
			[104112] = true,	--		Curious Ticking Parcel
			[104035] = true,	--		Giant Purse of Timeless Coins
			[104034] = true,	--		Purse of Timeless Coins
			[103632] = true,	--		Lucky Box of Greatness
			[103624] = true,	--		Treasures of the Vale
			[103535] = true,	--	BG	Bulging Bag of Charms (China)
			[102137] = true,	--		Unclaimed Black Market Container
			[ 98562] = true,	--		Sunreaver Bounty
			[ 98560] = true,	--		Arcane Trove
			[ 98133] = true,	--		Greater Cache of Treasures
			[ 98103] = true,	--		Gigantic Sack of Coins
			[ 98102] = true,	--		Overflowing Sack of Coins
			[ 98101] = true,	--		Enormous Sack of Coins
			[ 98100] = true,	--		Humongous Sack of Coins
			[ 98099] = true,	--		Giant Sack of Coins
			[ 98098] = true,	--		Bulging Sack of Coins
			[ 98097] = true,	--		Huge Sack of Coins
			[ 98096] = true,	--		Large Sack of Coins
			[ 98095] = true,	--	BG	Brawler's Pet Supplies
			[ 97957] = true,	--		Surplus Supplies
			[ 97956] = true,	--		Surplus Supplies
			[ 97955] = true,	--		Surplus Supplies
			[ 97954] = true,	--		Surplus Supplies
			[ 97953] = true,	--		Surplus Supplies
			[ 97952] = true,	--		Surplus Supplies
			[ 97951] = true,	--		Surplus Supplies
			[ 97950] = true,	--		Surplus Supplies
			[ 97949] = true,	--		Surplus Supplies
			[ 97948] = true,	--		Surplus Supplies
			[ 97565] = true,	--		Unclaimed Black Market Container
			[ 97153] = true,	--		Spoils of the Thunder King
			[ 95619] = true,	--		Amber Encased Treasure Pouch
			[ 95618] = true,	--		Cache of Mogu Riches
			[ 95617] = true,	--		Dividends of the Everlasting Spring
			[ 95602] = true,	--		Stormtouched Cache
			[ 95601] = true,	--		Shiny Pile of Refuse
			[ 95469] = true,	--		Serpent's Heart
			[ 95343] = true,	--		Treasures of the Thunder King
			[ 94566] = true,	--		Fortuitous Coffer
			[ 94553] = true,	--		Notes on Lightning Steel
			[ 94296] = true,	--		Cracked Primal Egg
			[ 94220] = true,	--		Sunreaver Bounty
			[ 94219] = true,	--		Arcane Trove
			[ 94207] = true,	--	BG	Fabled Pandaren Pet Supplies
			[ 94159] = true,	--		Small Bag of Zandalari Supplies
			[ 94158] = true,	--		Big Bag of Zandalari Supplies
			[ 93724] = true,	--		Darkmoon Game Prize
			[ 93360] = true,	--		Serpent's Cache
			[ 93200] = true,	--		Tome of the Serpent
			[ 93199] = true,	--		Tome of the Crane
			[ 93198] = true,	--		Tome of the Tiger
			[ 93149] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 93148] = true,	--		Pet Supplies
			[ 93147] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 93146] = true,	--	BG	Pandaren Spirit Pet Supplies
			[ 92960] = true,	--		Silkworm Cocoon
			[ 92813] = true,	--		Greater Cache of Treasures
			[ 92794] = true,	--		Ride Ticket Book
			[ 92793] = true,	--		Ride Ticket Book
			[ 92792] = true,	--		Ride Ticket Book
			[ 92791] = true,	--		Ride Ticket Book
			[ 92790] = true,	--		Ride Ticket Book
			[ 92789] = true,	--		Ride Ticket Book
			[ 92788] = true,	--		Ride Ticket Book
			[ 92744] = true,	--		Heavy Sack of Gold
			[ 92718] = true,	--		Brawler's Purse
			[ 91086] = true,	--		Darkmoon Pet Supplies
			[ 90840] = true,	--		Marauder's Gleaming Sack of Gold
			[ 90839] = true,	--		Cache of Sha-Touched Gold
			[ 90818] = true,	--		Misty Satchel of Exotic Mysteries
			[ 90735] = true,	--		Goodies from Nomi
			[ 90635] = true,	--		Hero's Purse
			[ 90634] = true,	--		Hero's Purse
			[ 90633] = true,	--		Hero's Purse
			[ 90632] = true,	--		Hero's Purse
			[ 90631] = true,	--		Hero's Purse
			[ 90630] = true,	--		Hero's Purse
			[ 90629] = true,	--		Hero's Purse
			[ 90628] = true,	--		Hero's Purse
			[ 90627] = true,	--		Hero's Purse
			[ 90626] = true,	--		Hero's Purse
			[ 90625] = true,	--		Treasures of the Vale
			[ 90624] = true,	--		Hero's Purse
			[ 90623] = true,	--		Hero's Purse
			[ 90622] = true,	--		Hero's Purse
			[ 90621] = true,	--		Hero's Purse
			[ 90537] = true,	--		Winner's Reward
			[ 90406] = true,	--		Facets of Research
			[ 90401] = true,	--		Facets of Research
			[ 90400] = true,	--		Facets of Research
			[ 90399] = true,	--		Facets of Research
			[ 90398] = true,	--		Facets of Research
			[ 90397] = true,	--		Facets of Research
			[ 90395] = true,	--		Facets of Research
			[ 90165] = true,	--		Golden Chest of the Lich Lord
			[ 90164] = true,	--		Golden Chest of the Cycle
			[ 90163] = true,	--		Golden Chest of the Howling Beast
			[ 90162] = true,	--		Golden Chest of the Regal Lord
			[ 90161] = true,	--		Golden Chest of the Holy Warrior
			[ 90160] = true,	--		Golden Chest of the Light
			[ 90159] = true,	--		Golden Chest of the Silent Assassin
			[ 90158] = true,	--		Golden Chest of the Elemental Triad
			[ 90157] = true,	--		Golden Chest of Windfury
			[ 90156] = true,	--		Golden Chest of the Betrayer
			[ 90155] = true,	--		Golden Chest of the Golden King
			[ 90041] = true,	--		Spoils of Theramore
			[ 89991] = true,	--		Pandaria Fireworks
			[ 89858] = true,	--		Cache of Mogu Riches
			[ 89857] = true,	--		Dividends of the Everlasting Spring
			[ 89856] = true,	--		Amber Encased Treasure Pouch
			[ 89810] = true,	--		Bounty of a Sundered Land
			[ 89808] = true,	--		Dividends of the Everlasting Spring
			[ 89807] = true,	--		Amber Encased Treasure Pouch
			[ 89804] = true,	--		Cache of Mogu Riches
			[ 89613] = true,	--		Cache of Treasures
			[ 89610] = true,	--		Pandaria Herbs
			[ 89609] = true,	--		Crate of Dust
			[ 89608] = true,	--		Crate of Ore
			[ 89607] = true,	--		Crate of Leather
			[ 89428] = true,	--		Ancient Mogu Treasure
			[ 89427] = true,	--		Ancient Mogu Treasure
			[ 89125] = true,	--		Sack of Pet Supplies
		--	[ 88567] = false,	--	LP	Ghost Iron Lockbox
			[ 88496] = true,	--		Sealed Crate
		--	[ 88165] = false,	--	LP	Vine-Cracked Junkbox
			[ 87730] = true,	--		Sack of Crocolisk Belly
			[ 87729] = true,	--		Sack of Golden Carp
			[ 87728] = true,	--		Sack of Krasarang Paddlefish
			[ 87727] = true,	--		Sack of Reef Octopus
			[ 87726] = true,	--		Sack of Jewel Danio
			[ 87725] = true,	--		Sack of Tiger Gourami
			[ 87724] = true,	--		Sack of Redbelly Mandarin
			[ 87723] = true,	--		Sack of Emperor Salmon
			[ 87722] = true,	--		Sack of Giant Mantis Shrimp
			[ 87721] = true,	--		Sack of Jade Lungfish
			[ 87716] = true,	--		Sack of White Turnips
			[ 87715] = true,	--		Sack of Pink Turnips
			[ 87714] = true,	--		Sack of Striped Melons
			[ 87713] = true,	--		Sack of Jade Squash
			[ 87712] = true,	--		Sack of Witchberries
			[ 87710] = true,	--		Sack of Red Blossom Leeks
			[ 87709] = true,	--		Sack of Scallions
			[ 87708] = true,	--		Sack of Mogu Pumpkins
			[ 87707] = true,	--		Sack of Juicycrunch Carrots
			[ 87706] = true,	--		Sack of Green Cabbages
			[ 87705] = true,	--		Sack of Wildfowl Breasts
			[ 87704] = true,	--		Sack of Raw Crab Meat
			[ 87703] = true,	--		Sack of Raw Turtle Meat
			[ 87702] = true,	--		Sack of Mushan Ribs
			[ 87701] = true,	--		Sack of Raw Tiger Steaks
			[ 87541] = true,	--		Crate of Vrykul Archaeology Fragments
			[ 87540] = true,	--		Crate of Troll Archaeology Fragments
			[ 87539] = true,	--		Crate of Tol'vir Archaeology Fragments
			[ 87538] = true,	--		Crate of Orc Archaeology Fragments
			[ 87537] = true,	--		Crate of Nerubian Archaeology Fragments
			[ 87536] = true,	--		Crate of Night Elf Archaeology Fragments
			[ 87535] = true,	--		Crate of Fossil Archaeology Fragments
			[ 87534] = true,	--		Crate of Draenei Archaeology Fragments
			[ 87533] = true,	--		Crate of Dwarven Archaeology Fragments
			[ 87391] = true,	--		Plundered Treasure
			[ 87225] = true,	--		Big Bag of Food
			[ 87224] = true,	--		Big Bag of Wonders
			[ 87223] = true,	--		Big Bag of Skins
			[ 87222] = true,	--		Big Bag of Linens
			[ 87221] = true,	--		Big Bag of Jewels
			[ 87220] = true,	--		Big Bag of Mysteries
			[ 87219] = true,	--		Huge Bag of Herbs
			[ 87218] = true,	--		Big Bag of Arms
			[ 87217] = true,	--		Small Bag of Goods
			[ 86623] = true,	--		Blingtron 004000 Gift Package
			[ 86595] = true,	--		Bag of Helpful Things
			[ 86428] = true,	--		Old Man Thistle's Treasure
			[ 85498] = true,	--		Songbell Seed Pack
			[ 85497] = true,	--		Chirping Package
			[ 85277] = true,	--		Nicely Packed Lunch
			[ 85276] = true,	--		Celebration Gift
			[ 85275] = true,	--		Chee Chee's Goodie Bag
			[ 85274] = true,	--		Gro-Pack
			[ 85272] = true,	--		Tree Seed Pack
			[ 85271] = true,	--		Secret Stash
			[ 85227] = true,	--		Special Seed Pack
			[ 85226] = true,	--		Basic Seed Pack
			[ 85225] = true,	--		Basic Seed Pack
			[ 85224] = true,	--		Basic Seed Pack
			[ 85223] = true,	--		Enigma Seed Pack
			[ 78930] = true,	--		Sealed Crate
			[ 77956] = true,	--		Spectral Mount Crate
			[ 77501] = true,	--		Blue Blizzcon Bag
			[ 72201] = true,	--		Plump Intestines

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	04	WORLD OF WARCRAFT:	CATACLYSM
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[ 71631] = true,	--		Zen'Vorka's Cache
			[ 70931] = true,	--		Scrooge's Payoff
			[ 70719] = true,	--		Water-Filled Gills
			[ 69999] = true,	--		Moat Monster Feeding Kit
			[ 69903] = true,	--		Satchel of Exotic Mysteries
			[ 69886] = true,	--		Bag of Coins
			[ 69823] = true,	--		Gub's Catch
			[ 69822] = true,	--		Master Chef's Groceries
			[ 69818] = true,	--		Giant Sack
			[ 69817] = true,	--		Hive Queen's Honeycomb
			[ 68813] = true,	--		Satchel of Freshly-Picked Herbs
			[ 68795] = true,	--		Stendel's Bane
		--	[ 68729] = false,	--	LP	Elementium Lockbox
			[ 68689] = true,	--		Imported Supplies
			[ 68598] = true,	--		Very Fat Sack of Coins
			[ 68384] = true,	--		Moonkin Egg
			[ 67597] = true,	--		Sealed Crate
			[ 67539] = true,	--		Tiny Treasure Chest
			[ 67495] = true,	--		Strange Bloated Stomach
			[ 67414] = true,	--		Bag of Shiny Things
			[ 67250] = true,	--		Satchel of Helpful Goods
			[ 67248] = true,	--		Satchel of Helpful Goods
			[ 66943] = true,	--		Treasures from Grim Batol
			[ 65513] = true,	--		Crate of Tasty Meat
			[ 64657] = true,	--		Canopic Jar
			[ 64491] = true,	--		Royal Reward
		--	[ 63349] = false,	--	LP	Flame-Scarred Junkbox
			[ 62062] = true,	--		Bulging Sack of Gold
			[ 61387] = true,	--		Hidden Stash
			[ 60681] = true,	--		Cannary's Cache
			[ 57540] = true,	--		Coldridge Mountaineer's Pouch
			[ 54536] = true,	--		Satchel of Chilled Goods

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	XX	WORLD OF WARCRAFT:	EVENTS CLASSIC
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

	--	Love is in the Air		Valentines Event
		--	Quests & Dailies
			[ 54537] = true,	--	23	Heart-Shaped Box
			[ 50161] = true,	--		Dinner Suit Box
			[ 50160] = true,	--		Lovely Dress Box

	--	Noblegarden				Easter Event
		--	Quests & Dailies
			[ 45072] = true,	--	23	Brightly Colored Egg		

	--	Winter Veil				Crhistmas Event
		--	Quests & Dailies
			[ 21315] = true, 	--		Smokywood Satchel
			[ 21216] = true, 	--		Smokywood Pastures Extra-Special Gift
			[ 17727] = true, 	--		Smokywood Pastures Gift Pack
			[ 17726] = true, 	--		Smokywood Pastures Special Gift
			[ 17685] = true, 	--	22	Smokywood Pastures Sampler
		--	Tree Gifts
			[ 46740] = true,	--	SS	Winter Veil Gift
			[ 43504] = true,	--	SS	Winter Veil Gift
			[ 34426] = true,	--	SS	Winter Veil Gift
			[ 21363] = true,	--	22	Festive Gift
			[ 21327] = true,	--	22	Ticking Present
			[ 21310] = true,	--	22	Gaily Wrapped Present
			[ 21271] = true,	--	SS	Gently Shaken Gift
			[ 21270] = true,	--	SS	Gently Shaken Gift
			[ 21191] = true,	--	22	Carefully Wrapped Present
		
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	03	WORLD OF WARCRAFT:	WRATH OF THE LICH KING
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[202269] = true,	--	SS	Bounty Satchel
			[200240] = true,	--	SS	Northrend Adventuring Supplies
			[200239] = true,	--	SS	Northrend Adventuring Supplies
			[200238] = true,	--	SS	Northrend Adventuring Supplies
			[199210] = true,	--	SS	Northrend Adventuring Supplies
			[ 54516] = true,	--		Loot-Filled Pumpkin
			[ 54467] = true,	--	SS	Tabard Lost & Found
			[ 52676] = true,	--		Cache of the Ley-Guardian
			[ 52344] = true,	--		Earthen Ring Supplies
			[ 52304] = true,	--		Fire Prism
			[ 52274] = true,	--		Earthen Ring Supplies
			[ 52006] = true,	--		Sack of Frosty Treasures
			[ 52005] = true,	--		Satchel of Helpful Goods
			[ 52004] = true,	--		Satchel of Helpful Goods
			[ 52003] = true,	--		Satchel of Helpful Goods
			[ 52002] = true,	--		Satchel of Helpful Goods
			[ 52001] = true,	--		Satchel of Helpful Goods
			[ 52000] = true,	--		Satchel of Helpful Goods
			[ 51999] = true,	--		Satchel of Helpful Goods
			[ 51316] = true,	--		Unsealed Chest
			[ 50409] = true,	--		Spark's Fossil Finding Kit
			[ 50301] = true,	--		Landro's Pet Box
			[ 50238] = true,	--		Cracked Un'Goro Coconut
			[ 49926] = true,	--		Brazie's Black Book of Secrets
			[ 49909] = true,	--		Box of Chocolates
			[ 49631] = true,	--		Standard Apothecary Serving Kit
			[ 49369] = true,	--		Red Blizzcon Bag
			[ 49294] = true,	--		Ashen Sack of Gems
			[ 46812] = true,	--		Northrend Mystery Gem Pouch
			[ 46810] = true,	--		Bountiful Cookbook
			[ 46809] = true,	--		Bountiful Cookbook
		--	[ 46110] = false,	--	PF	Alchemist's Cache -- Alchemist only
			[ 46007] = true,	--		Bag of Fishing Treasures
		--	[ 45986] = false,	--	LP	Tiny Titanium Lockbox
		--	[ 45878] = true,	--	SS	Large Sack of Ulduar Spoils (Drops from Raid Boss)
		--	[ 45875] = true,	--	SS	Sack of Ulduar Spoils (Drops from Raid Boss)
			[ 45724] = true,	--		Champion's Purse
			[ 45328] = true,	--		Bloated Slippery Eel
			[ 44951] = true,	--		Box of Bombs
			[ 44943] = true,	--		Icy Prism
			[ 44751] = true,	--		Hyldnir Spoils
			[ 44718] = true,	--		Ripe Disgusting Jar
		--	[ 44700] = true,	--	NO	Brooding Darkwater Clam
			[ 44663] = true,	--		Abandoned Adventurer's Satchel
			[ 44475] = true,	--		Reinforced Crate
			[ 44163] = true,	--		Shadowy Tarot
			[ 44161] = true,	--		Arcane Tarot
			[ 44142] = true,	--		Strange Tarot
			[ 44113] = true,	--		Small Spice Bag
		--	[ 43624] = false,	--	LP	Titanium Lockbox
		--	[ 43622] = false,	--	LP	Froststeel Lockbox
		--	[ 43575] = false,	--	LP	Reinforced Junkbox
			[ 43556] = true,	--		Patroller's Pack
			[ 43347] = true,	--		Satchel of Spoils
		--	[ 43346] = true,	--	SS	Large Satchel of Spoils (Drops from Raid Boss)
			[ 41888] = true,	--		Small Velvet Bag
			[ 41426] = true,	--		Magically Wrapped Gift
			[ 40308] = true,	--	SS	Bonework Soul Jar
			[ 39904] = true,	--	SS	Argent Crusade Gratuity
			[ 39903] = true,	--	SS	Argent Crusade Gratuity
			[ 39883] = true,	--		Cracked Egg
			[ 39418] = true,	--		Ornately Jeweled Box
			[ 38539] = true,	--	SS	Sack of Gold
			[ 37605] = true,	--	SS	Pouch of Pennies
			[ 37586] = true,	--		Handful of Treats
			[ 37168] = true,	--		Mysterious Tarot
			[ 36781] = true,	--	NO	Darkwater Clam
			[ 35945] = true,	--		Brilliant Glass
			[ 35792] = true,	--		Mage Hunter Personal Effects
			[ 35745] = true,	--	SS	Box of Treasure
			[ 35512] = true,	--		Pocket Full of Snow
			[ 35348] = true,	--		Bag of Fishing Treasures
			[ 35313] = true,	--		Bloated Barbed Gill Trout
			[ 35286] = true,	--		Bloated Giant Sunfish
			[ 35232] = true,	--		Shattered Sun Supplies
			[ 34871] = true,	--		Crafty's Sack

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	02	WORLD OF WARCRAFT:	BURNING CRUSADE
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[191061] = true,	--	SS	Brilliant Glass
		--	[191060] = true,	--	SS	Black Sack of Gems (Drops from Raid Boss)
			[187799] = true,	--	SS	Enlistment Bonus
			[187714] = true,	--	SS	Enlistment Bonus
			[ 34863] = true,	--		Bag of Fishing Treasures
		--	[ 34846] = true,	--	SS	Black Sack of Gems (Drops from Raid Boss)
			[ 34595] = true,	--		Aldor Supplies Package
			[ 34594] = true,	--		Scryer Supplies Package
			[ 34593] = true,	--		Scryer Supplies Package
			[ 34592] = true,	--		Aldor Supplies Package
			[ 34587] = true,	--		Aldor Supplies Package
			[ 34585] = true,	--		Scryer Supplies Package
			[ 34584] = true,	--		Scryer Supplies Package
			[ 34583] = true,	--		Aldor Supplies Package
			[ 34548] = true,	--	SS	Cache of the Shattered Sun
			[ 34503] = true,	--	SS	Box of Adamantite Shells
			[ 34119] = true,	--		Black Conrad's Treasure
			[ 34077] = true,	--		Crudely Wrapped Gift
			[ 33928] = true,	--		Hollowed Bone Decanter
			[ 33926] = true,	--		Sealed Scroll Case
			[ 33857] = true,	--		Crate of Meat
			[ 33844] = true,	--		Barrel of Fish
			[ 33045] = true,	--		Renn's Supplies
			[ 32835] = true,	--		Ogri'la Care Package
			[ 32777] = true,	--		Kronk's Grab Bag
			[ 32724] = true,	--		Sludge-Covered Object
			[ 32631] = true,	--		Small Silver Metamorphosis Geode
			[ 32630] = true,	--		Small Gold Metamorphosis Geode
			[ 32629] = true,	--		Large Gold Metamorphosis Geode
			[ 32628] = true,	--		Large Silver Metamorphosis Geode
			[ 32627] = true,	--		Small Copper Metamorphosis Geode
			[ 32626] = true,	--		Large Copper Metamorphosis Geode
			[ 32625] = true,	--		Small Iron Metamorphosis Geode
			[ 32624] = true,	--		Large Iron Metamorphosis Geode 
			[ 32561] = true,	--	SS	Tier 5 Arrow Box
			[ 32462] = true,	--		Morthis' Materials
			[ 32064] = true,	--		Protectorate Treasure Cache
			[ 31955] = true,	--		Arelion's Knapsack
		--	[ 31952] = false,	--	LP	Khorium Lockbox
			[ 31800] = true,	--		Outcast's Cache
			[ 31522] = true,	--		Primal Mooncloth Supplies
			[ 31408] = true,	--		Offering of the Sha'tar
			[ 30650] = true,	--		Dertrok's Wand Case
			[ 30320] = true,	--		Bundle of Nether Spikes
			[ 30260] = true,	--		Voren'thal's Package
		--	[ 29569] = false,	--	LP	Strong Junkbox
			[ 28499] = true,	--	SS	Arakkoa Hunter's Supplies
			[ 28135] = true,	--	SS	Bomb Crate
		--	[ 27513] = false,	--	NO	Curious Crate
			[ 27511] = true,	--		Inscribed Scrollcase
			[ 27481] = false,	--		Heavy Supply Crate
			[ 27446] = true,	--		Mr. Pinchy's Gift
			[ 25424] = true,	--		Gem-Stuffed Envelope
			[ 25423] = true,	--		Bag of Premium Gems
			[ 25422] = true,	--		Bulging Sack of Gems
			[ 25419] = true,	--		Unmarked Bag of Gems
		--	[ 24476] = false,	--	NO	Jaggal Clam
			[ 24402] = true,	--		Package of Identified Plants
			[ 24336] = true,	--		Fireproof Satchel
			[ 23921] = true,	--		Bulging Sack of Silver
			[ 23895] = true,	--	SS	Netted Goods
			[ 23846] = true,	--		Nolkai's Box

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --
--	01	WORLD OF WARCRAFT
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

			[ 23224] = true,	--	SS	Summer Gift Package
			[ 23022] = true,	--		Curmudgeon's Payoff
			[ 22746] = true,	--		Buccaneer's Uniform
			[ 22650] = true,	--		Hive'Zora Dossier
			[ 22649] = true,	--		Hive'Regal Dossier
			[ 22648] = true,	--		Hive'Ashi Dossier
			[ 22568] = true,	--		Sealed Craftsman's Writ
			[ 22320] = true,	--		Mux's Quality Goods
			[ 22178] = true,	--		Pledge of Friendship: Stormwind
			[ 22172] = true,	--		Gift of Friendship: Undercity
			[ 22171] = true,	--		Gift of Friendship: Thunder Bluff
			[ 22170] = true,	--		Gift of Friendship: Stormwind
			[ 22169] = true,	--		Gift of Friendship: Orgrimmar
			[ 22168] = true,	--		Gift of Friendship: Ironforge
			[ 22167] = true,	--		Gift of Friendship: Darnassus
			[ 22166] = true,	--		Gift of Adoration: Undercity
			[ 22165] = true,	--		Gift of Adoration: Thunder Bluff
			[ 22164] = true,	--		Gift of Adoration: Orgrimmar
			[ 22163] = true,	--		Pledge of Friendship: Undercity
			[ 22162] = true,	--		Pledge of Friendship: Thunder Bluff
			[ 22161] = true,	--		Pledge of Friendship: Orgrimmar
			[ 22160] = true,	--		Pledge of Friendship: Ironforge
			[ 22159] = true,	--		Pledge of Friendship: Darnassus
			[ 22158] = true,	--		Pledge of Adoration: Thunder Bluff
			[ 22157] = true,	--		Pledge of Adoration: Undercity
			[ 22156] = true,	--		Pledge of Adoration: Orgrimmar
			[ 22155] = true,	--		Pledge of Adoration: Darnassus
			[ 22154] = true,	--		Pledge of Adoration: Ironforge
			[ 22152] = true,	--	SS	Anthion's Pouch
			[ 22137] = true,	--		Ysida's Satchel
			[ 21981] = true,	--		Gift of Adoration: Stormwind
			[ 21980] = true,	--		Gift of Adoration: Ironforge
			[ 21979] = true,	--		Gift of Adoration: Darnassus
			[ 21975] = true,	--		Pledge of Adoration: Stormwind
			[ 21812] = true,	--		Box of Chocolates
		--	[ 21743] = false,	--	PF	Large Cluster Rocket Recipes
		--	[ 21742] = false,	--	PF	Large Rocket Recipes
		--	[ 21741] = false,	--	PF	Cluster Rocket Recipes
		--	[ 21740] = false,	--	PF	Small Rocket Recipes
			[ 21640] = true,	--		Lunar Festival Fireworks Pack
			[ 21528] = true,	--		Colossal Bag of Loot
			[ 21513] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21512] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21511] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21510] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21509] = true,	--		Ahn'Qiraj War Effort Supplies
			[ 21386] = true,	--		Followup Logistics Assignment
			[ 21266] = true,	--		Logistics Assignment
			[ 21243] = true,	--	SS	Bloated Mightfish
			[ 21228] = false,	--	FF	Mithril Bound Trunk						-- Find Fish Book (For Alts)
			[ 21164] = true,	--		Bloated Rockscale Cod
			[ 21163] = true,	--	SS	Bloated Firefin
			[ 21162] = true,	--	SS	Bloated Oily Blackmouth
			[ 21156] = true,	--		Scarab Bag
			[ 21150] = false,	--	FF	Iron Bound Trunk						-- Find Fish Book (For Alts)
			[ 21133] = true,	--		Followup Tactical Assignment
			[ 21132] = true,	--		Logistics Assignment
			[ 21131] = true,	--		Followup Combat Assignment
			[ 21113] = false,	--	FF	Watertight Trunk						-- Find Fish Book (For Alts)
			[ 21042] = true,	--		Narain's Special Kit
			[ 20809] = true,	--		Tactical Assignment
			[ 20808] = true,	--		Combat Assignment
			[ 20805] = true,	--		Followup Logistics Assignment
			[ 20768] = true,	--		Oozing Bag
			[ 20767] = true,	--		Scum Covered Bag
			[ 20766] = true,	--		Slimy Bag
			[ 20708] = false,	--	FF	Tightly Sealed Trunk					-- Find Fish Book (For Alts)
			[ 20603] = true,	--		Bag of Spoils
			[ 20602] = true,	--		Chest of Spoils
			[ 20601] = true,	--		Sack of Spoils
			[ 20469] = true,	--		Decoded True Believer Clippings
			[ 20393] = true,	--	SS	Treat Bag
			[ 20367] = true,	--	SS	Hunting Gear
			[ 20236] = true,	--		Arathor Standard Care Package
			[ 20233] = true,	--		Arathor Basic Care Package
			[ 20231] = true,	--		Arathor Advanced Care Package
			[ 20230] = true,	--		Defiler's Standard Care Package
			[ 20229] = true,	--		Defiler's Basic Care Package
			[ 20228] = true,	--		Defiler's Advanced Care Package
		--	[ 19425] = false,	--	LP	Mysterious Lockbox
			[ 19422] = true,	--		Darkmoon Faire Fortune
			[ 19298] = true,	--		Minor Darkmoon Prize
			[ 19297] = true,	--		Lesser Darkmoon Prize
			[ 19296] = true,	--		Greater Darkmoon Prize
			[ 19155] = true,	--		Outrider Standard Care Package
			[ 19154] = true,	--		Outrider Basic Care Package
			[ 19153] = true,	--		Outrider Advanced Care Package
			[ 19152] = true,	--		Sentinel Advanced Care Package
			[ 19151] = true,	--		Sentinel Standard Care Package
			[ 19150] = true,	--		Sentinel Basic Care Package
			[ 19035] = true,	--		Lard's Special Picnic Basket
			[ 18804] = true,	--		Lord Grayson's Satchel
			[ 18636] = true,	--	SS	Ruined Jumper Cables XL
			[ 17969] = true,	--		Red Sack of Gems
			[ 17965] = true,	--		Yellow Sack of Gems
			[ 17964] = true,	--		Gray Sack of Gems
			[ 17963] = true,	--		Green Sack of Gems
			[ 17962] = true,	--		Blue Sack of Gems
		--	[ 16885] = false,	--	LP	Heavy Junkbox
		--	[ 16884] = false,	--	LP	Sturdy Junkbox
		--	[ 16883] = false,	--	LP	Worn Junkbox
		--	[ 16882] = false,	--	LP	Battered Junkbox
			[ 16783] = true,	--	SS	Bundle of Reports
			[ 15902] = true,	--		A Crazy Grab Bag
			[ 15876] = true,	--		Nathanos' Chest
		--	[ 15874] = false,	--	NO	Soft-shelled Clam
			[ 15699] = true,	--		Small Brown-Wrapped Package
			[ 15103] = true,	--		Corrupt Tested Sample
			[ 15102] = true,	--		Un'Goro Tested Sample
		--	[ 13918] = false,	--	LP	Reinforced Locked Chest
			[ 13891] = true,	--		Bloated Salmon
			[ 13881] = true,	--		Bloated Redgill
		--	[ 13875] = false,	--	LP	Ironbound Locked Chest
			[ 13874] = true,	--		Heavy Crate
			[ 13247] = true,	--	SS	Quartermaster Zigris' Footlocker	Not [22233]
			[ 12849] = true,	--		Demon Kissed Sack
			[ 12339] = true,	--		Vaelan's Gift
			[ 12122] = true,	--		Kum'isha's Junk
		--	[ 12033] = false,	--	LP	Thaurissan Family Jewels
			[ 11966] = true,	--		Small Sack of Coins
			[ 11955] = true,	--		Bag of Empty Ooze Containers
			[ 11938] = true,	--		Sack of Gems
			[ 11937] = true,	--		Fat Sack of Coins
			[ 11912] = true,	--		Package of Empty Ooze Containers
			[ 11887] = true,	--		Cenarion Circle Cache
			[ 11883] = true,	--		A Dingy Fanny Pack
			[ 11617] = true,	--		Eridan's Supplies
			[ 11568] = true,	--		Torwa's Pouch
			[ 11423] = true,	--		Gnome Engineer's Renewal Gift
			[ 11422] = true,	--		Goblin Engineer's Renewal Gift
			[ 11107] = true,	--		A Small Pack
			[ 11024] = true,	--		Evergreen Herb Casing
			[ 10834] = true,	--		Felhound Tracker Kit
			[ 10773] = true,	--		Hakkari Urn
			[ 10752] = true,	--		Emerald Encrusted Chest
			[ 10695] = true,	--		Box of Empty Vials
			[ 10595] = true,	--	SS	Kum'isha's Junk
			[ 10569] = true,	--		Hoard of the Black Dragonflight
			[ 10479] = true,	--		Kovic's Trading Satchel
			[ 10456] = true,	--		A Bulging Coin Purse
			[  9541] = true,	--		Box of Goodies
			[  9540] = true,	--		Box of Spells
			[  9539] = true,	--		Box of Rations
			[  9537] = true,	--	SS	Neatly Wrapped Box
			[  9532] = true,	--	SS	Internal Warrior Equipment Kit L30
			[  9529] = true,	--	SS	Internal Warrior Equipment Kit L25
			[  9363] = true,	--		Sparklematic-Wrapped Box
			[  9276] = true,	--		Pirate's Footlocker
			[  9265] = true,	--		Cuergo's Hidden Treasure
			[  8647] = true,	--		Egg Crate
			[  8507] = true,	--	SS	Heavy Mithril Lotterybox
			[  8506] = true,	--	SS	Mithril Lotterybox
			[  8505] = true,	--	SS	Heavy Iron Lotterybox
			[  8504] = true,	--	SS	Iron Lotterybox
			[  8503] = true,	--	SS	Heavy Bronze Lotterybox
			[  8502] = true,	--	SS	Bronze Lotterybox
			[  8484] = true,	--		Gadgetzan Water Co. Care Package
			[  8366] = true,	--		Bloated Trout
			[  8049] = true,	--		Gnarlpine Necklace
		--	[  7973] = false,	--	NO	Big-Mouth Clams
		--	[  7870] = false,	--	LP	Thaumaturgy Vessel Lockbox
		--	[  7209] = false,	--	LP	Tazan's Satchel
			[  7190] = true,	--		Scorched Rocket Boots
			[  6827] = true,	--		Box of Supplies
			[  6755] = true,	--		A Small Container of Gems
			[  6715] = true,	--		Ruined Jumper Cables
			[  6647] = true,	--		Bloated Catfish
			[  6646] = true,	--	SS	Bloated Albacore
			[  6645] = true,	--		Bloated Mud Snapper
			[  6644] = true,	--	SS	Bloated Mackerel
			[  6643] = true,	--		Bloated Smallfish
			[  6357] = true,	--		Sealed Crate
			[  6356] = true,	--		Battered Chest
		--	[  6355] = false,	--	LP	Sturdy Locked Chest
		--	[  6354] = false,	--	LP	Small Locked Chest 
			[  6353] = true,	--		Small Chest
			[  6352] = true,	--		Waterlogged Crate
			[  6351] = true,	--		Dented Crate
			[  6307] = true,	--		Message in a Bottle
			[  5858] = true,	--	SS	Goblin Prize Box
			[  5857] = true,	--	SS	Gnome Prize Box
		--	[  5760] = false,	--	LP	Eternium Lockbox
		--	[  5759] = false,	--	LP	Thorium Lockbox
		--	[  5758] = false,	--	LP	Mithril Lockbox
			[  5738] = true,	--		Covert Ops Pack
		--	[  5524] = false,	--	NO	Thick-shelled Clam
		--	[  5523] = false,	--	NO	Small Barnacled Clam
			[  5335] = true,	--		A Sack of Coins
		--	[  4638] = false,	--	LP	Reinforced Steel Lockbox
		--	[  4637] = false,	--	LP	Steel Lockbox
		--	[  4636] = false,	--	LP	Strong Iron Lockbox
		--	[  4634] = false,	--	LP	Iron Lockbox
		--	[  4633] = false,	--	LP	Heavy Bronze Lockbox
		--	[  4632] = false,	--	LP	Ornate Bronze Lockbox

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- OneDrive Sync: file:///C:\WoW\_retail_\WTF\UI\WoWUpdate.bat -- --





		

}

local autoOpenItemsSalvage = {
			[118473] = true,	--		Small Sack of Salvaged Goods
			[114116] = true,	--		Bag of Salvaged Goods
			[114119] = true,	--		Crate of Salvage
			[114120] = true,	--		Big Crate of Salvage
}


function kAutoOpen:Register(event, func)
	self:RegisterEvent(event)
	self[event] = function(...)
		func(...)
	end
end

kAutoOpen:Register('BANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen:Register('BANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen:Register('GUILDBANKFRAME_OPENED', function()
	atBank = true
end)

kAutoOpen:Register('GUILDBANKFRAME_CLOSED', function()
	atBank = false
end)

kAutoOpen:Register('MAIL_SHOW', function()
	atMail = true
end)

kAutoOpen:Register('MAIL_CLOSED', function()
	atMail = false
end)

kAutoOpen:Register('MERCHANT_SHOW', function()
	atMerchant = true
end)

kAutoOpen:Register('MERCHANT_CLOSED', function()
	atMerchant = false
end)

kAutoOpen:Register('BAG_UPDATE_DELAYED', function(bag)
	if(atBank or atMail or atMerchant) then return end
	
	for bag = 0, 4 do
		for slot = 0, C_Container.GetContainerNumSlots(bag) do
			local id = C_Container.GetContainerItemID(bag, slot)
			if id and autoOpenItems[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700[Auto Open]|cFF9D9D9Ding " .. C_Container.GetContainerItemLink(bag, slot))
						--	|cFFFFD700	Gold2		!AutoOpen
						--  |cFF9D9D9D	Grey		ing

						--  |cFF9D9D9D	Grey		
						--  |cFF4FE34F	Green		
						--  |cFFFFFFFF	White		
						--  |cFF4FAFE3	Blue		
						--  |cFFE34F4F	Red			
						--  |cFFFFD100	Gold		
						--	|cFFFFD700	Gold2		
						--  |cFFE3E34F	Yellow		
						--  |cFF1E1E1E	DarkGrey	
				C_Container.UseContainerItem(bag, slot)
				return
			end
			
			-- Attempt to open only in Alliance Portal Room
			if GetMinimapZoneText() == "Wizard's Sanctum" and id and autoOpenItemsPortalRoom[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700[Auto Open]|cFF9D9D9D in Portal Room " .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end

			-- Attempt to open only in Horde Portal Room
			if GetMinimapZoneText() == "Pathfinder's Den" and id and autoOpenItemsPortalRoom[id] then
				DEFAULT_CHAT_FRAME:AddMessage("|cFFFFD700[Auto Open]|cFF9D9D9D in Portal Room" .. C_Container.GetContainerItemLink(bag, slot))
				C_Container.UseContainerItem(bag, slot)
				return
			end

			-- Salvage
			--if GetMinimapZoneText() == "Salvage Yard" and id and autoOpenItemsSalvage[id] then
			--	DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Auto Salvage : " .. GetContainerItemLink(bag, slot))
			--	UseContainerItem(bag, slot)
			--	return
			--end

		end
	end
end)
