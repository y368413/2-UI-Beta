ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
The purpose of this module is to give you a comprehensive list of all available transmog items from the Arathi WF
]]

local super = Templates.WarfrontXMog
Modules.XMogArathi = super:new()
local this = Modules.XMogArathi

this.Name = "[XMog][Warfront] Arathi"

function this:GetAllSourceItemIDs()	
	--this table contains all items from the arathi WF as sourceIDs + classes eligible to loot them
	--Note:	This is NOT identical to classes actually able to USE them (e.g. int weapons for warriors/rogues)
	--		Ability to use can be determined using API calls, loot eligibility cannot
	local ArathiSources =
	{
		[TTD2.Tools.Unit.PlayerFaction.Alliance] =
		{
			["Armor"] =
			{
				--cloth
				{
					--head
					ID = 163339,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder
					ID = 163337,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest
					ID = 163248,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--legs
					ID = 163264,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--hands
					ID = 163341,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--wrist
					ID = 163275,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--waist
					ID = 163342,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--feet
					ID = 163253,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--back
					ID = 163246,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				
				
				
				--leather
				{
					--head
					ID = 163380,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder
					ID = 163377,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest
					ID = 163251,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--legs
					ID = 163266,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--hands
					ID = 163256,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--wrist
					ID = 163278,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--waist
					ID = 163384,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--feet
					ID = 163383,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--back
					ID = 163347,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				
				
				--mail
				{
					--head
					ID = 163394,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder
					ID = 163389,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest
					ID = 163398,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--legs
					ID = 163265,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--hands
					ID = 163397,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--wrist
					ID = 163277,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--waist
					ID = 163401,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--feet
					ID = 163400,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--back
					ID = 163351,
					Classes = { "HUNTER", "SHAMAN" }
				},
				
				
				
				--plate
				{
					--head
					ID = 163410,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder
					ID = 163405,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest
					ID = 163418,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--legs
					ID = 163409,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--hands
					ID = 163414,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--wrist
					ID = 163403,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--waist
					ID = 163422,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--feet
					ID = 163421,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--back
					ID = 163355,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				}
			},
			["Weapons"] =
			{
				{
					--bow
					ID = 163881,
					Classes = { "HUNTER" }
				},
				{
					--agi dagger
					ID = 163882,
					Classes = { "ROGUE" }
				},
				{
					--agi 1h mace
					ID = 163883,
					Classes = { "ROGUE", "SHAMAN", "MONK" }
				},
				{
					--str 2h mace
					ID = 163884,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--agi pole
					ID = 163885,
					Classes = { "HUNTER", "MONK", "DRUID" }
				},
				{
					--staff
					ID = 163886,
					Classes = { "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--str 1h sword
					ID = 163887,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--wand
					ID = 163888,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--gun
					ID = 163889,
					Classes = { "HUNTER" }
				},
				{
					--str 2h sword
					ID = 163890,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shield 1
					ID = 163891,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},
				{
					--int OH
					ID = 163892,
					Classes = { "PALADIN", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--agi 1h glaive
					ID = 163893,
					Classes = { "DEMONHUNTER" }
				},
				{
					--int 1h mace
					ID = 163894,
					Classes = { "PALADIN", "PRIEST", "SHAMAN", "MONK", "DRUID" }
				},
				{
					--shield 2
					ID = 163895,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},				
				{
					--agi 1h axe
					ID = 166336,
					Classes = { "ROGUE", "SHAMAN", "MONK", "DEMONHUNTER" }
				}
			}
		},
		[TTD2.Tools.Unit.PlayerFaction.Horde] = 
		{
			["Armor"] =
			{
				--cloth
				{
					--head
					ID = 163426,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder
					ID = 163424,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest
					ID = 163280,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--legs
					ID = 163296,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--hands
					ID = 163428,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--wrist
					ID = 163306,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--waist
					ID = 163430,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--feet
					ID = 163285,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--back
					ID = 163357,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				
				
				
				--leather
				{
					--head
					ID = 163435,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder
					ID = 163432,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest
					ID = 163283,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--legs
					ID = 163298,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--hands
					ID = 163437,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--wrist
					ID = 163309,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--waist
					ID = 163439,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--feet
					ID = 163438,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--back
					ID = 163360,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				
				
				--mail
				{
					--head
					ID = 163446,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder
					ID = 163441,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest
					ID = 163282,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--legs
					ID = 163445,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--hands
					ID = 163448,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--wrist
					ID = 163308,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--waist
					ID = 163451,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--feet
					ID = 163449,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--back
					ID = 163366,
					Classes = { "HUNTER", "SHAMAN" }
				},
				
				
				
				--plate
				{
					--head
					ID = 163456,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder
					ID = 163453,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest
					ID = 163459,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--legs
					ID = 163455,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--hands
					ID = 163458,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--wrist
					ID = 163307,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--waist
					ID = 163461,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--feet
					ID = 163460,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--back
					ID = 163368,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				}
			},
			["Weapons"] =
			{
				{
					--agi 1h axe
					ID = 163866,
					Classes = { "ROGUE", "SHAMAN", "MONK", "DEMONHUNTER" }
				},
				{
					--bow
					ID = 163867,
					Classes = { "HUNTER" }
				},
				{
					--agi dagger
					ID = 163868,
					Classes = { "ROGUE" }
				},
				{
					--int 1h mace
					ID = 163869,
					Classes = { "PALADIN", "PRIEST", "SHAMAN", "MONK", "DRUID" }
				},
				{
					--str 2h mace
					ID = 163870,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--agi pole
					ID = 163871,
					Classes = { "HUNTER", "MONK", "DRUID" }
				},
				{
					--staff
					ID = 163872,
					Classes = { "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--wand
					ID = 163873,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--str 2h axe
					ID = 163874,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shield 1
					ID = 163875,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},
				{
					--int OH
					ID = 163876,
					Classes = { "PALADIN", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--agi 1h glaive
					ID = 163877,
					Classes = { "DEMONHUNTER" }
				},
				{
					--shield 2
					ID = 163878,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},
				{
					--gun
					ID = 163879,
					Classes = { "HUNTER" }
				},
				{
					--str 1h sword
					ID = 163880,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--agi 1h mace
					ID = 166337,
					Classes = { "ROGUE", "SHAMAN", "MONK" }
				}
			}
		}
	}
	
	return ArathiSources
end

function this:GetUsedTypeTiers()

	local UsedTypeTiers =
	{
		["Armor"]	= { "WarfrontReward", "QuestReward" },
		["Weapons"]	= { "WarfrontReward" }
	}
	
	return UsedTypeTiers
end

function this:GetContributionIDs()
	
	local ContributionIDs =
	{
		[TTD2.Tools.Unit.PlayerFaction.Alliance]	= 116,
		[TTD2.Tools.Unit.PlayerFaction.Horde]		= 11
	}
	return ContributionIDs
end

function this:GetQuestIDs()
	
	local QuestIDs =
	{
		[TTD2.Tools.Unit.PlayerFaction.Alliance]	= 53414,
		[TTD2.Tools.Unit.PlayerFaction.Horde]		= 53416
	}
	return QuestIDs
end
