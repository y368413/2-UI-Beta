ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
]]

local super = Templates.WQRecipesModule
Modules.LegionWQRecipes = super:new()
local this = Modules.LegionWQRecipes

this.Name = "[Legion] WQ-Recipes"
this.MinimumLevel = 110

function this:GetCompleteWQRecipesData()
	
	local LegionWQRecipes =
	{
		[TTD2.Tools.Unit.PlayerFaction.Neutral] =
		{
			["Alchemy"] =
			{
				ProfessionID	= 171,
				Recipes			= 
				{
					{ ItemID = 142121, WQID = 43513, IsDrop = true },	--Recipe: Potion of Prolonged Power
					{ ItemID = 151658, WQID = 48318 },	--Recipe: Lightblood Elixir
					{ ItemID = 151704, WQID = 48323 }	--Recipe: Tears of the Naaru
				}
			},
			["Blacksmithing"] =
			{
				ProfessionID	= 164,
				Recipes			= 
				{
					{ ItemID = 123931, WQID = 41633 },	--Recipe: Leystone Greaves
					{ ItemID = 123936, WQID = 41634 },	--Recipe: Leystone Armguards
					{ ItemID = 137605, WQID = 41635 },	--Recipe: Leystone Boots
					{ ItemID = 123939, WQID = 41636 },	--Recipe: Leystone Breastplate
					{ ItemID = 123938, WQID = 41637 },	--Recipe: Leystone Pauldrons
					{ ItemID = 137606, WQID = 41638 }	--Recipe: Leystone Gauntlets
				}
			},
			["Enchanting"] =
			{
				ProfessionID	= 333,
				Recipes			=
				{
					{ ItemID = 128596, WQID = 41669 },	--Formula: Enchant Ring - Word of Critical Strike
					{ ItemID = 128605, WQID = 41670 },	--Formula: Enchant Cloak - Word of Agility
					{ ItemID = 128604, WQID = 41671 },	--Formula: Enchant Cloak - Word of Strength
					{ ItemID = 128597, WQID = 41672 },	--Formula: Enchant Ring - Word of Haste
					{ ItemID = 128598, WQID = 41673 },	--Formula: Enchant Ring - Word of Mastery
					{ ItemID = 128606, WQID = 41674 }	--Formula: Enchant Cloak - Word of Intellect
				}
			},			
			["Engineering"] =
			{
				ProfessionID	= 202,
				Recipes			=
				{
					{ ItemID = 137721, WQID = 41676 },	--Schematic: Pump-Action Bandage Gun
					{ ItemID = 137723, WQID = 41677 },	--Schematic: Auto-Hammer
					{ ItemID = 137722, WQID = 41678 },	--Schematic: Gunpack
					{ ItemID = 137719, WQID = 41679 },	--Schematic: Deployable Bullet Dispenser
					{ ItemID = 137724, WQID = 41680 }	--Schematic: Failure Detection Pylon
				}
			},
			["Inscription"] =
			{
				ProfessionID	= 773,
				Recipes			=
				{
					{ ItemID = 137772, WQID = 41663 },	--Vantus Rune Technique: Elerethe Renferal
					{ ItemID = 137770, WQID = 41664 },	--Vantus Rune Technique: Dragons of Nightmare
					{ ItemID = 137767, WQID = 41665 },	--Vantus Rune Technique: Ursoc
					{ ItemID = 137768, WQID = 41666 },	--Vantus Rune Technique: Nythendra
					{ ItemID = 137771, WQID = 41667 },	--Vantus Rune Technique: Xavius
					{ ItemID = 137769, WQID = 41668 }	--Vantus Rune Technique: Il'gynoth, The Heart of Corruption
				}
			},
			["Jewelcrafting"] =
			{
				ProfessionID	= 755,
				Recipes			=
				{
					{ ItemID = 137843, WQID = 41651 },	--Design: Azsunite Pendant
					{ ItemID = 137838, WQID = 41652 },	--Design: Deep Amber Loop
					{ ItemID = 137842, WQID = 41653 },	--Design: Skystone Pendant
					{ ItemID = 137865, WQID = 41654 },	--Design: Queen's Opal Loop
					{ ItemID = 137866, WQID = 41655 },	--Design: Queen's Opal Pendant
					{ ItemID = 137840, WQID = 41656 }	--Design: Azsunite Loop
				}
			},
			["Leatherworking"] =
			{
				ProfessionID	= 165,
				Recipes			=
				{
					{ ItemID = 137914, WQID = 41639 },	--Recipe: Battlebound Spaulders
					{ ItemID = 137878, WQID = 41640 },	--Recipe: Warhide Mask
					{ ItemID = 137908, WQID = 41641 },	--Recipe: Battlebound Armbands
					{ ItemID = 137880, WQID = 41642 },	--Recipe: Warhide Footpads
					{ ItemID = 137909, WQID = 41643 },	--Recipe: Battlebound Leggings
					{ ItemID = 137879, WQID = 41644 }	--Recipe: Warhide Gloves
				}
			},
			["Skinning"] =
			{
				ProfessionID	= 393,
				Recipes			=
				{
					{ ItemID = 139895, WQID = 42819, IsDrop = true }	--Skinning Technique: Legion Butchery
				}
			},
			["Tailoring"] =
			{
				ProfessionID	= 197,
				Recipes			=
				{
					{ ItemID = 137961, WQID = 41648 },	--Pattern: Silkweave Bracers
					{ ItemID = 137963, WQID = 41645 },	--Pattern: Silkweave Epaulets
					{ ItemID = 138012, WQID = 41646 },	--Pattern: Silkweave Gloves
					{ ItemID = 138013, WQID = 41650 },	--Pattern: Silkweave Hood
					{ ItemID = 137964, WQID = 41647 },	--Pattern: Silkweave Robe
					{ ItemID = 138014, WQID = 41649 }	--Pattern: Silkweave Slippers
				}
			}
		}
	}
	
	return LegionWQRecipes
end
