local myname, ns = ...
local L = LibStub("AceLocale-3.0"):NewLocale(myname, "enUS", true)
if not L then return end

-- Settings ---------------------------------------------------------
L["Create waypoint"] = true
L["ADD to NPCScan"] = true
L["Information for NPCScan and not available."] = true
L["Hide node"] = true
L["Close"] = true
L["Icon settings"] = true
L["These settings control the look and feel of the icon."] = true
L["Icon Scale"] = true
L["The scale of the icons"] = true
L["Icon Alpha"] = true
L["The alpha transparency of the icons"] = true
L["World Map"] = true
L["Show icons on world map"] = true
L["Minimap"] = true
L["Show icons on the minimap"] = true
L["What to display"] = true
L["Use item icons"] = true
L["Show the icons for items, if known; otherwise, the achievement icon will be used"] = true
L["Use item tooltips"] = true
L["Show the full tooltips for items"] = true
L["Show found"] = true
L["Show waypoints for items you've already found?"] = true
L["Show NPCs"] = true
L["Show rare NPCs to be killed, generally for items or achievements"] = true
L["Show treasure"] = true
L["Show treasure that can be looted"] = true
L["Junk"] = true
L["Show items which don't count for any achievement"] = true
-------
L["Debug"] = true
L["Show quest ids"] = true
L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."] = true
L["Show NPCs ids"] = true
L["Show the internal id of the NPC associated with this node. Handy if you want to report a problem with it."] = true
L["Reset hidden nodes"] = true
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = true
-------
L["What to display achievement"] = true
L["Show Achievement"] = true
L["Show Achievement that can be looted"] = true
L["Use item icons achievement"] = true
L["Show Achievements completed"] = true
L["Select achievement"] = true
L["Show the icons Achievement"] = true

-- Others -----------------------------------------------------------
L["Entrance "] = true
L["Start "] = true
L["Require item : "] = true
L["You can buy them from : "] = true
L["in cave"] = true

-- Treasure ---------------------------------------------------------
L['Treasure Chest'] = true						-- ADD
L['Small Treasure Chest'] = true				-- ADD
-- HF xxxxx - Trésors de Zuldazar
L["On second floor"] = true						-- ADD
L["Bottom floor of ship"] = true				-- ADD
L["Top of ship"] = true							-- ADD
L["Event: kill Da White Shark first"] = true	-- ADD
L["In cave behind waterfall"] = true			-- ADD
L["Road behind waterfall"] = true				-- ADD
-- HF xxxxx - Trésors de Nazmir
L["In dead hippo's mouth"] = true				-- ADD
L["Climb the tree"] = true 						-- ADD
-- HF 12849 - Trésors de Vol’dun
L["Use mine cart"] = true						-- ADD
L["Climb the rock arch"] = true					-- ADD
L["Climb fallen tree"] = true					-- ADD
L["Under sand pile"] = true						-- ADD
L["Door on East side"] = true
L["Path from South side"] = true				-- ADD
L["Enter at top of temple"] = true				-- ADD
-- HF xxxxx - Trésors de Rade de Tiragarde
L["Ride the Guardian"] = true					-- ADD
L["In Boralus, on Stomsong Monastary"] = true	-- ADD
L["Teleport here from Stormsong, pick up the gem"] = true	-- ADD
L["Kill pirates in Freehold until the map drops"] = true	-- ADD
L["Entrance to the underwater cave"] = true		-- ADD
L["Read Damp Scrolls; in the underwater cave, from the monastary"] = true	-- ADD
L["Read Damp Scrolls; underground"] = true		-- ADD
L["Read Damp Scrolls; upstairs"] = true			-- ADD
L["Read Damp Scrolls"] = true					-- ADD
L["Ominous Altar; use it, get teleported, pick up the gem"] = true	-- ADD
-- HF xxxxx - Trésors de Drustvar
L["Left Down Up Right"] = true 					-- ADD
L["Right Up Left Down"] = true 					-- ADD
L["Click on Witch Torch"] = true 				-- ADD
L["Get keys from Gorging Raven"] = true 		-- ADD
L["Left Right Down Up"] = true 					-- ADD
-- HF xxxxx - Trésors de Vallée Chantorage
L["On roof"] = true								-- ADD
L["Top shelf inside shed"] = true				-- ADD
L["Climb ladder onto ship"] = true				-- ADD
L["Under ship"] = true							-- ADD
L["Under platform"] = true						-- ADD
L["Jump onto platform"] = true					-- ADD
L["Behind pillar"] = true						-- ADD

-- Rares ------------------------------------------------------------
L["Shares spawn timer with Azuresail the Ancient and Kil'Tawan"] = true
L["Shares spawn timer with Thunderfoot and Kil'Tawan"] = true
L["South of Savagelands"] = true
L["Can be found near the road in the grass"] = true
L["South of the Nesingwary's Trek windrider"] = true
L["Fighting Ten'gor at crossroad"] = true
L["On the road from Zeb'ahari to Tal'gurub"] = true
L["Flying close to the road from Vol'dun to Zuldazar"] = true
L["Ride to Roan Berthold in Southwind Station, follow the road"] = true
L["Inside skeleton under the sand"] = true
L["Hillside above the cave"] = true
L["Pick one to fight; Dagger from Longfang, mail gloves from Henry"] = true
-- HF 13027 - Récolte de champignons
L["On the beach, between trees"] = true
L["South of Heart of Darkness. Entrance is from the north side of Xal'vor ruins"] = true
L["In cave, entrance at 73.2 49.7"] = true
L["Shrouded Shore, on the hill"] = true
---------------------------------------------------------------------

-- HF 13018 - Chevaucheur des dunes
L["Along the pyramid edge"] = true
L["On top of the slither snake"] = true

-- HF 13024 - Gravé dans la pierre en lettres de sang
L["Inside a building ruins near the mountain"] = true
L["Next to broken pillar as you enter the ruins"] = true
L["Island between Nazmir and Zuldazar zones"] = true
L["Near Kel'vax Deathwalker rare"] = true

-- HF 13028 - Triste sot
L["Lost Spawn of Krag'wa 1"] = true
L["Lost Spawn of Krag'wa 2"] = true
L["Lost Spawn of Krag'wa 3"] = true
L["Lost Spawn of Krag'wa 4"] = true
L["Lost Spawn of Krag'wa 5"] = true
L["Lost Spawn of Krag'wa 6"] = true
L["Lost Spawn of Krag'wa 7"] = true
L["Lost Spawn of Krag'wa 8"] = true
L["Lost Spawn of Krag'wa 9"] = true
L["Lost Spawn of Krag'wa 10"] = true
L["In an underwater cave"] = true
L["Between the huge roots"] = true
L["Sits in a ruin"] = true
L["In cave"] = true
L["Sits up between trees"] = true
L["Sits near the bridge behind the big tree"] = true
L["Sits behind a curtain of scrub"] = true

-- HF 13036 - Nul n’est censé les ignorer
L["In the pond"] = true
L["Next to the withered tree"] = true
L["Scroll next to the altar, behind the mobs"] = true
L["Behind the NPC in the Corner"] = true
L["Next to the river"] = true
L["Between the roots"] = true
L["At the destroyed pillar"] = true
L["Above, at the pond on the big stone"] = true
L["In the eye of the skeleton, outside"] = true
L["On the wall, behind the torch"] = true
L["Above, to the right of the small staircase"] = true
L["At the destroyed pillar on the left"] = true
L["Scroll on the altar"] = true
L["At the destroyed wall"] = true
L["Under water, at the bottom, at the destroyed pillar"] = true

-- HF 13046 - Les collines de l'appétit
L["Buy %s from %s "] = true
L["to Brennadam"] = true
L["Use Cooking for %s"] = true
L["The recipe %s and loot on %s to Waycrest Manor"] = true

-- HF 13051 - Légendes des Eaugures
L["Near the waterfall"] = true
L["On top of the hill"] = true
L["Near the lake"] = true
L["On top of the island"] = true
L["Up the mountain right of Warfang Hold"] = true
L["Up the mountain left of Warfang Hold"] = true
L["Near the Shrine of the Storm entrance"] = true

-- HF 13057 - Les chants de la mer
L["On the fireplace mantel"] = true
L["Behind the Jay the Tavern Bard"] = true

-- HF 13064 - Drust sera la chute
L["At the bottom of the upper waterfall"] = true
L["Under the leaning tree"] = true
L["Under water"] = true
L["At the destroyed wall"] = true
L["Under water at the foot of the small waterfall"] = true
L["Behind the scrub"] = true
L["On the mountain, a bit difficult to find the way up (see path)"] = true
L["Path to The Flayed Man: Start"] = true
L["Path to The Flayed Man: Step 1"] = true
L["Path to The Flayed Man: Step 2"] = true
L["Path to The Flayed Man: Step 3"] = true
L["Path to The Flayed Man: Step 4"] = true
L["Path to The Flayed Man: End, jump down carefully"] = true
L["In a cave, at the very back of the wall"] = true
L["Path to Protectors of the Forest: cave entrance"] = true

-- HF 13082 - Du neuf avec du vieux
L["Near the cliff under the trees west of Arom's Stand flight master."] = true
L["Between the rocks mid level of the waterfall"] = true
L["On the mountain north of Fallhaven in the pile of bones."] = true
L["In the tree trunk from the south side"] = true
