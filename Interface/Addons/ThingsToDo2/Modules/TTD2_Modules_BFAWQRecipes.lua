ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
]]

local super = Templates.WQRecipesModule
Modules.BFAWQRecipes = super:new()
local this = Modules.BFAWQRecipes

this.Name = "[BFA] WQ-Recipes"
this.MinimumLevel = 120

function this:GetCompleteWQRecipesData()
	
	local BFAWQRecipes =
	{
		[TTD2.Tools.Unit.PlayerFaction.Neutral] =
		{
			["Cooking"] =
			{
				ProfessionID	= 185,
				Recipes			=
				{
					{ ItemID = 162285, WQID = 52344 },	--Recipe: Kul Tiramisu
					{ ItemID = 162290, WQID = 52345 },	--Recipe: Ravenberry Tarts
					{ ItemID = 162295, WQID = 52346 },	--Recipe: Sailor's Pie
					{ ItemID = 162286, WQID = 52347 },	--Recipe: Honey-Glazed Haunches
					{ ItemID = 162296, WQID = 52348 },	--Recipe: Mon'Dazi
					{ ItemID = 162294, WQID = 52349 },	--Recipe: Loa Loaf
					{ ItemID = 162291, WQID = 52350 },	--Recipe: Swamp Fish 'n Chips
					{ ItemID = 162297, WQID = 52351 }	--Recipe: Spiced Snapper
				}
			},
			["Inscription"] =
			{
				ProfessionID	= 773,
				Recipes			=
				{
					{ ItemID = 162321, WQID = 52393 },	--Recipe: Contract: Tortollan Seekers
					{ ItemID = 162321, WQID = 52394 }	--Recipe: Contract: Champions of Azeroth
				}
			}
		},
		[TTD2.Tools.Unit.PlayerFaction.Alliance] =
		{
			["Cooking"] =
			{
				ProfessionID	= 185,
				Recipes			=
				{
					{ ItemID = 168330, WQID = 56793 },	--Recipe: Mech-Dowel's "Big Mech"
					{ ItemID = 168331, WQID = 56794 },	--Recipe: Baked Port Tato
					{ ItemID = 168332, WQID = 56795 },	--Recipe: Abyssal-Fried Rissole
					{ ItemID = 168333, WQID = 56797 },	--Recipe: Bil'Tong
					{ ItemID = 168334, WQID = 56796 }	--Recipe: Fragrant Kakavia
				}
			},
			["Alchemy"] =
			{
				ProfessionID	= 171,
				Recipes			= 
				{
					{ ItemID = 162257, WQID = 52331 },	--Recipe: Demitri's Draught of Deception
					{ ItemID = 162258, WQID = 52332 },	--Recipe: Lightfoot Potion
					{ ItemID = 162259, WQID = 52333 },	--Recipe: Sea Mist Potion
					{ ItemID = 162260, WQID = 52334 },	--Recipe: Potion of Concealment
					{ ItemID = 169500, WQID = 56570 },	--Recipe: Greater Flask of the Currents
					{ ItemID = 169501, WQID = 56767 },	--Recipe: Greater Flask of Endless Fathoms
					{ ItemID = 169502, WQID = 56769 },	--Recipe: Greater Flask of the Vast Horizon
					{ ItemID = 169503, WQID = 56768 }	--Recipe: Greater Flask of the Undertow
				}
			},
			["Enchanting"] =
			{
				ProfessionID	= 333,
				Recipes			=
				{
					{ ItemID = 162299, WQID = 52353 },	--Formula: Enchant Ring - Seal of Haste
					{ ItemID = 162300, WQID = 52354 },	--Formula: Enchant Ring - Seal of Mastery
					{ ItemID = 162315, WQID = 52355 },	--Formula: Enchant Weapon - Coastal Surge
					{ ItemID = 162319, WQID = 52356 },	--Formula: Enchant Weapon - Torrent of Elements
					{ ItemID = 162314, WQID = 52357 },	--Formula: Enchant Weapon - Quick Navigation
					{ ItemID = 169534, WQID = 56824 },	--Formula: Machinist's Brilliance
					{ ItemID = 169535, WQID = 56826 },	--Formula: Force Multiplier
					{ ItemID = 169536, WQID = 56825 },	--Formula: Oceanic Restoration
					{ ItemID = 170213, WQID = 56827 }	--Formula: Naga Hide
				}
			},			
			["Engineering"] =
			{
				ProfessionID	= 202,
				Recipes			=
				{
					{ ItemID = 162321, WQID = 52363 },	--Schematic: Incendiary Ammunition
					{ ItemID = 162332, WQID = 52364 },	--Schematic: Thermo-Accelerated Plague Spreader
					{ ItemID = 162331, WQID = 52365 },	--Schematic: F.R.I.E.D.
					{ ItemID = 162339, WQID = 52366 },	--Schematic: XA-1000 Surface Skimmer
					{ ItemID = 162340, WQID = 52367 },	--Schematic: Electroshock Mount Motivator
					{ ItemID = 162343, WQID = 52368 }	--Schematic: Crow's Nest Scope
				}
			},			
			["Inscription"] =
			{
				ProfessionID	= 773,
				Recipes			=
				{
					{ ItemID = 162360, WQID = 52389 },	--Recipe: Contract: Proudmoore Admiralty
					{ ItemID = 162362, WQID = 52390 },	--Recipe: Contract: Order of Embers
					{ ItemID = 162364, WQID = 52391 }	--Recipe: Contract: Storm's Wake
				}
			},			
			["Tailoring"] =
			{
				ProfessionID	= 197,
				Recipes			=
				{
					{ ItemID = 162443, WQID = 52422 },	--Pattern: Battle Flag: Spirit of Freedom
					{ ItemID = 162444, WQID = 52423 },	--Pattern: Battle Flag: Phalanx Defense
					{ ItemID = 162445, WQID = 52424 }	--Pattern: Battle Flag: Rallying Swiftness
				}
			}
		},
		[TTD2.Tools.Unit.PlayerFaction.Horde] =
		{
			["Cooking"] =
			{
				ProfessionID	= 185,
				Recipes			=
				{
					{ ItemID = 168330, WQID = 56802 },	--Recipe: Mech-Dowel's "Big Mech"
					{ ItemID = 168331, WQID = 56801 },	--Recipe: Baked Port Tato
					{ ItemID = 168332, WQID = 56800 },	--Recipe: Abyssal-Fried Rissole
					{ ItemID = 168333, WQID = 56798 },	--Recipe: Bil'Tong
					{ ItemID = 168334, WQID = 56799 }	--Recipe: Fragrant Kakavia
				}
			},
			["Alchemy"] =
			{
				ProfessionID	= 171,
				Recipes			= 
				{
					{ ItemID = 162257, WQID = 52335 },	--Recipe: Demitri's Draught of Deception
					{ ItemID = 162258, WQID = 52336 },	--Recipe: Lightfoot Potion
					{ ItemID = 162259, WQID = 52337 },	--Recipe: Sea Mist Potion
					{ ItemID = 162260, WQID = 52338 },	--Recipe: Potion of Concealment
					{ ItemID = 169500, WQID = 56770 },	--Recipe: Greater Flask of the Currents
					{ ItemID = 169501, WQID = 56772 },	--Recipe: Greater Flask of Endless Fathoms
					{ ItemID = 169502, WQID = 56773 },	--Recipe: Greater Flask of the Vast Horizon
					{ ItemID = 169503, WQID = 56774 }	--Recipe: Greater Flask of the Undertow
				}
			},
			["Enchanting"] =
			{
				ProfessionID	= 333,
				Recipes			=
				{
					{ ItemID = 162299, WQID = 52358 },	--Formula: Enchant Ring - Seal of Haste
					{ ItemID = 162300, WQID = 52359 },	--Formula: Enchant Ring - Seal of Mastery
					{ ItemID = 162315, WQID = 52360 },	--Formula: Enchant Weapon - Coastal Surge
					{ ItemID = 162319, WQID = 52361 },	--Formula: Enchant Weapon - Torrent of Elements
					{ ItemID = 162314, WQID = 52362 },	--Formula: Enchant Weapon - Quick Navigation
					{ ItemID = 169534, WQID = 56821 },	--Formula: Machinist's Brilliance
					{ ItemID = 169535, WQID = 56820 },	--Formula: Force Multiplier
					{ ItemID = 169536, WQID = 56819 },	--Formula: Oceanic Restoration
					{ ItemID = 170213, WQID = 56818 }	--Formula: Naga Hide
				}
			},			
			["Engineering"] =
			{
				ProfessionID	= 202,
				Recipes			=
				{
					{ ItemID = 162321, WQID = 52369 },	--Schematic: Incendiary Ammunition
					{ ItemID = 162332, WQID = 52370 },	--Schematic: Thermo-Accelerated Plague Spreader
					{ ItemID = 162331, WQID = 52371 },	--Schematic: F.R.I.E.D.
					{ ItemID = 162339, WQID = 52372 },	--Schematic: XA-1000 Surface Skimmer
					{ ItemID = 162340, WQID = 52373 },	--Schematic: Electroshock Mount Motivator
					{ ItemID = 162343, WQID = 52374 }	--Schematic: Crow's Nest Scope
				}
			},			
			["Inscription"] =
			{
				ProfessionID	= 773,
				Recipes			=
				{
					{ ItemID = 162321, WQID = 52393 },	--Recipe: Contract: Tortollan Seekers
					{ ItemID = 162321, WQID = 52394 },	--Recipe: Contract: Champions of Azeroth
					{ ItemID = 162366, WQID = 52395 },	--Recipe: Contract: Zandalari Empire
					{ ItemID = 162368, WQID = 52396 },	--Recipe: Contract: Talanji's Expedition
					{ ItemID = 162370, WQID = 52397 }	--Recipe: Contract: Voldunai
				}
			},			
			["Tailoring"] =
			{
				ProfessionID	= 197,
				Recipes			=
				{
					{ ItemID = 162443, WQID = 52425 },	--Pattern: Battle Flag: Spirit of Freedom
					{ ItemID = 162444, WQID = 52426 },	--Pattern: Battle Flag: Phalanx Defense
					{ ItemID = 162445, WQID = 52427 }	--Pattern: Battle Flag: Rallying Swiftness
				}
			}
		}
	}
	
	return BFAWQRecipes
end
