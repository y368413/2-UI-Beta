ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
Legion Paragon stuff
]]

local super = Templates.ParagonModule
Modules.LegionParagon = super:new()
local this = Modules.LegionParagon

this.Name = "[Legion] Paragon"
this.MinimumLevel = 100

function this:GetCompleteParagonData()
	
	local LegionParagon =
	{
		[TTD2.Tools.Unit.PlayerFaction.Neutral] =
		{
			["Court of Farondis"] =
			{
				FactionID = 1900,
				EmissaryID = 42420,
				BoxID = 146897,
				Rewards =
				{
					{ Type = "Mount", ItemID = 147806, MountID = 943 }
				}
			},
			["Dreamweavers"] =
			{
				FactionID = 1883,
				EmissaryID = 42170,
				BoxID = 146898,
				Rewards =
				{
					{ Type = "Mount", ItemID = 147804, MountID = 942 }
				}
			},
			["Highmountain Tribe"] =
			{
				FactionID = 1828,
				EmissaryID = 42233,
				BoxID = 146899,
				Rewards =
				{
					{ Type = "Mount", ItemID = 147807, MountID = 941 }
				}
			},
			["Valarjar"] =
			{
				FactionID = 1948,
				EmissaryID = 42234,
				BoxID = 146901,
				Rewards =
				{
					{ Type = "Mount", ItemID = 147805, MountID = 944 }
				}
			},
			["The Nightfallen"] =
			{
				FactionID = 1859,
				EmissaryID = 42421,
				BoxID = 146900,
				Rewards =
				{
					{ Type = "Mount", ItemID = 143764, MountID = 905 }
				}
			},
			["The Wardens"] =
			{
				FactionID = 1894,
				EmissaryID = 42422,
				BoxID = 146902,
				Rewards =
				{
					{ Type = "Toy", ItemID = 147843 }
				}
			},
			["Armies of Legionfall"] =
			{
				FactionID = 2045,
				EmissaryID = 48641,
				BoxID = 147361,
				Rewards =
				{
					{ Type = "Pet", ItemID = 147841, SpeciesID = 2050 }
				}
			},
			["Army of the Light"] =
			{
				FactionID = 2165,
				EmissaryID = 48639,
				BoxID = 152923,
				Rewards =
				{
					{ Type = "Mount", ItemID = 153042, MountID = 983 },
					{ Type = "Mount", ItemID = 153043, MountID = 984 },
					{ Type = "Mount", ItemID = 153044, MountID = 985 },
					{ Type = "Toy", ItemID = 153182 }
				}
			}
		}
	}
	
	return LegionParagon
end
