ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
all of the BFAParagon collectibles
]]

local super = Templates.ParagonModule
Modules.BFAParagon = super:new()
local this = Modules.BFAParagon

this.Name = "[BFA] Paragon"
this.MinimumLevel = 110

function this:GetCompleteParagonData()
	
	local BFAParagon =
	{
		[TTD2.Tools.Unit.PlayerFaction.Neutral] =
		{			
			["Tortollan Seekers"] =
			{
				FactionID	= 2163,
				EmissaryID	= 50604,
				BoxID		= 166245,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166704 },						--Bowl of Glowing Pufferfish
					{ Type = "Recipe",	ItemID = 166264, ProfessionID = 185 }	--Recipe: Sanguinated Feast
				}
			},
			["Champions of Azeroth"] =
			{
				FactionID	= 2164,
				EmissaryID	= 50562,
				BoxID		= 166298,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166877 }						--Azerite Firework Launcher
				}
			},
			["Rustbolt Resistance"] =
			{
				FactionID	= 2391,
				EmissaryID	= nil,
				EmissaryWQBundleIDs	= { 55901, 56131, 56139, 56141 },
				BoxID		= 170061,
				Rewards		=
				{
					{ Type = "Essence",	ItemID = 168861, EssenceID = 6, EssenceRank = 4 },		--Purification Protocol
					{ Type = "Essence",	ItemID = 168569, EssenceID = 13, EssenceRank = 4 },		--Nullification Dynamo
					{ Type = "Essence",	ItemID = 168935, EssenceID = 19, EssenceRank = 4 }		--The Well of Existence
				}
			}
		},
		[TTD2.Tools.Unit.PlayerFaction.Alliance] =
		{
			["7th Legion"] =
			{
				FactionID	= 2159,
				EmissaryID	= 50605,
				BoxID		= 166300,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166879 },						--Rallying War Banner
					{ Type = "Recipe",	ItemID = 166279, ProfessionID = 773 }	--Recipe: Contract: 7th Legion
				}
			},
			["Proudmoore Admiralty"] =
			{
				FactionID	= 2160,
				EmissaryID	= 50599,
				BoxID		= 166295,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166702 },						--Proudmoore Music Box
					{ Type = "Pet",		ItemID = 166714, SpeciesID = 2566 }		--Albatross Feather
				}
			},
			["Order of Embers"] =
			{
				FactionID	= 2161,
				EmissaryID	= 50600,
				BoxID		= 166297,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166808 },						--Bewitching Tea Set
					{ Type = "Pet",		ItemID = 166718, SpeciesID = 2568 }		--Cobalt Raven Hatchling
				}
			},
			["Storm's Wake"] =
			{
				FactionID	= 2162,
				EmissaryID	= 50601,
				BoxID		= 166294,
				Rewards		=
				{
					{ Type = "Recipe",	ItemID = 166665, ProfessionID = 773 },	--Technique: Glyph of Storm's Wake
					{ Type = "Pet",		ItemID = 166719, SpeciesID = 2569 }		--Cobalt Raven Hatchling
				}
			},			
			["Waveblade Ankoan"] =
			{
				FactionID	= 2400,
				EmissaryID	= 56119,
				BoxID		= 169939,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 170203 },										--Flopping Fish
					{ Type = "Toy",		ItemID = 170469 },										--Memento of the Deeps
					{ Type = "Recipe",	ItemID = 170169, ProfessionID = 773 },					--Technique: Glyph of the Cold Waves
					{ Type = "Essence",	ItemID = 168931, EssenceID = 17, EssenceRank = 4 },		--The Ever-Rising Tide
					{ Type = "Essence",	ItemID = 168840, EssenceID = 25, EssenceRank = 4 },		--Aegis of the Deep
					{ Type = "Essence",	ItemID = 168866, EssenceID = 28, EssenceRank = 4 }		--The Unbound Force
				}
			}
		},
		[TTD2.Tools.Unit.PlayerFaction.Horde] =
		{
			["Talanji's Expedition"] =
			{
				FactionID	= 2156,
				EmissaryID	= 50602,
				BoxID		= 166282,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166308 },						--For da Blood God!
					{ Type = "Pet",		ItemID = 166716, SpeciesID = 2567 }		--Pair of Tiny Bat Wings
				}
			},
			["The Honorbound"] =
			{
				FactionID	= 2157,
				EmissaryID	= 50606,
				BoxID		= 166299,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166879 },						--Rallying War Banner
					{ Type = "Recipe",	ItemID = 166311, ProfessionID = 773 }	--Recipe: Contract: The Honorbound
				}
			},
			["Voldunai"] =
			{
				FactionID	= 2158,
				EmissaryID	= 50603,
				BoxID		= 166290,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 165021 },						--Words of Akunda
					{ Type = "Toy",		ItemID = 166703 },						--Goldtusk Inn Breakfast Buffet
					{ Type = "Toy",		ItemID = 166880 }						--Meerah's Jukebox
				}
			},
			["Zandalari Empire"] =
			{
				FactionID	= 2103,
				EmissaryID	= 50598,
				BoxID		= 166292,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 166701 }						--Warbeast Kraal Dinner Bell
				}
			},			
			["The Unshackled"] =
			{
				FactionID	= 2373,
				EmissaryID	= 56120,
				BoxID		= 169940,
				Rewards		=
				{
					{ Type = "Toy",		ItemID = 170203 },										--Flopping Fish
					{ Type = "Toy",		ItemID = 170469 },										--Memento of the Deeps
					{ Type = "Recipe",	ItemID = 170169, ProfessionID = 773 },					--Technique: Glyph of the Cold Waves
					{ Type = "Essence",	ItemID = 168931, EssenceID = 17, EssenceRank = 4 },		--The Ever-Rising Tide
					{ Type = "Essence",	ItemID = 168840, EssenceID = 25, EssenceRank = 4 },		--Aegis of the Deep
					{ Type = "Essence",	ItemID = 168866, EssenceID = 28, EssenceRank = 4 }		--The Unbound Force
				}
			}
		}
	}
	
	return BFAParagon
end
