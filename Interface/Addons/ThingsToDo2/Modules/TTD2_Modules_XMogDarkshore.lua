ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
The purpose of this module is to give you a comprehensive list of all available transmog items from the Darkshore WF
]]

local super = Templates.WarfrontXMog
Modules.XMogDarkshore = super:new()
local this = Modules.XMogDarkshore

this.Name = "[XMog][Warfront] Darkshore"

function this.GetAllSourceItemIDs()
	--this table contains all items from the darkshore WF as sourceIDs + classes eligible to loot them
	--Note:	This is NOT identical to classes actually able to USE them (e.g. int weapons for warriors/rogues)
	--		Ability to use can be determined using API calls, loot eligibility cannot
	local DarkshoreSources =
	{
		[TTD2.Tools.Unit.PlayerFaction.Alliance] =
		{
			["Armor"] =
			{
				--cloth
				{
					--head
					ID = 165435,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--head2
					ID = 166572,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder
					ID = 165437,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder2
					ID = 166558,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest
					ID = 165460,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest2
					ID = 166577,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--legs
					ID = 165436,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--hands
					ID = 165434,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--wrist
					ID = 165439,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--waist
					ID = 165438,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--feet
					ID = 165433,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--back
					ID = 166758,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				
				
				
				--leather
				{
					--head
					ID = 165443,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--head2
					ID = 166571,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder
					ID = 165445,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder2
					ID = 166557,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest
					ID = 165440,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest2
					ID = 166580,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--legs
					ID = 165444,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--hands
					ID = 165442,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--wrist
					ID = 165447,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--waist
					ID = 165446,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--feet
					ID = 165441,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--back
					ID = 166759,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				
				
				--mail
				{
					--head
					ID = 165451,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--head2
					ID = 166566,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder
					ID = 165453,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder2
					ID = 166556,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest
					ID = 165448,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest2
					ID = 166579,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--legs
					ID = 165452,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--hands
					ID = 165450,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--wrist
					ID = 165455,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--waist
					ID = 165454,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--feet
					ID = 165449,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--back
					ID = 166760,
					Classes = { "HUNTER", "SHAMAN" }
				},
				
				
				
				--plate
				{
					--head
					ID = 165459,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--head2
					ID = 166565,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder
					ID = 165462,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder2
					ID = 166555,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest
					ID = 165456,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest2
					ID = 166578,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--legs
					ID = 165461,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--hands
					ID = 165458,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--wrist
					ID = 165464,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--waist
					ID = 165463,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--feet
					ID = 165457,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--back
					ID = 166761,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				}
			},
			["Weapons"] =
			{
				{
					--bow
					ID = 165623,
					Classes = { "HUNTER" }
				},
				{
					--agi dagger
					ID = 165624,
					Classes = { "ROGUE" }
				},
				{
					--agi 1h mace
					ID = 165625,
					Classes = { "ROGUE", "SHAMAN", "MONK" }
				},
				{
					--agi pole
					ID = 165627,
					Classes = { "HUNTER", "MONK", "DRUID" }
				},
				{
					--staff
					ID = 165628,
					Classes = { "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--1h int schwert
					ID = 165629,
					Classes = { "PALADIN", "MAGE", "WARLOCK", "MONK" }
				},
				{
					--str 2h sword
					ID = 165632,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--agi 1h glaive
					ID = 165635,
					Classes = { "DEMONHUNTER" }
				},
				{
					--str 1h mace
					ID = 165636,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shield
					ID = 165637,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},
				{
					--int 1h axe
					ID = 166483,
					Classes = { "PALADIN", "SHAMAN", "MONK" }
				},
				{
					--str 1h sword
					ID = 166898,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
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
					ID = 165467,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--head2
					ID = 166564,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder
					ID = 165469,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--shoulder2
					ID = 166554,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest
					ID = 165492,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--chest2
					ID = 166573,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--legs
					ID = 165468,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--hands
					ID = 165466,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--wrist
					ID = 165471,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--waist
					ID = 165470,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--feet
					ID = 165465,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				{
					--back
					ID = 166762,
					Classes = { "PRIEST", "MAGE", "WARLOCK" }
				},
				
				
				
				--leather
				{
					--head
					ID = 165475,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--head2
					ID = 166563,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder
					ID = 165477,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--shoulder2
					ID = 166553,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest
					ID = 165472,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--chest2
					ID = 166576,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--legs
					ID = 165476,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--hands
					ID = 165474,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--wrist
					ID = 165479,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--waist
					ID = 165478,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--feet
					ID = 165473,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				{
					--back
					ID = 166763,
					Classes = { "ROGUE", "MONK", "DRUID", "DEMONHUNTER" }
				},
				
				
				--mail
				{
					--head
					ID = 165483,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--head2
					ID = 166562,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder
					ID = 165485,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--shoulder2
					ID = 166552,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest
					ID = 165480,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--chest2
					ID = 166575,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--legs
					ID = 165484,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--hands
					ID = 165482,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--wrist
					ID = 165487,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--waist
					ID = 165486,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--feet
					ID = 165481,
					Classes = { "HUNTER", "SHAMAN" }
				},
				{
					--back
					ID = 166764,
					Classes = { "HUNTER", "SHAMAN" }
				},
				
				
				
				--plate
				{
					--head
					ID = 165491,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--head2
					ID = 166561,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder
					ID = 165494,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--shoulder2
					ID = 166551,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest
					ID = 165488,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--chest2
					ID = 166574,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--legs
					ID = 165493,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--hands
					ID = 165490,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--wrist
					ID = 165496,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--waist
					ID = 165495,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--feet
					ID = 165489,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},
				{
					--back
					ID = 166765,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				}
			},
			["Weapons"] =
			{
				{
					--int 1h axe
					ID = 165608,
					Classes = { "PALADIN", "SHAMAN", "MONK" }
				},
				{
					--agi dagger
					ID = 165610,
					Classes = { "ROGUE" }
				},
				{
					--agi 1h mace
					ID = 165611,
					Classes = { "ROGUE", "SHAMAN", "MONK" }
				},
				{
					--agi pole
					ID = 165613,
					Classes = { "HUNTER", "MONK", "DRUID" }
				},
				{
					--staff
					ID = 165614,
					Classes = { "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "MONK", "DRUID" }
				},
				{
					--agi 1h glaive
					ID = 165619,
					Classes = { "DEMONHUNTER" }
				},
				{
					--shield
					ID = 165620,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				},
				{
					--gun
					ID = 165621,
					Classes = { "HUNTER" }
				},
				{
					--str 1h sword
					ID = 165622,
					Classes = { "PALADIN", "WARRIOR", "DEATHKNIGHT" }
				},
				{
					--str 2h sword
					ID = 166482,
					Classes = { "WARRIOR", "PALADIN", "DEATHKNIGHT" }
				},				
				{
					--int 1h sword
					ID = 166802,
					Classes = { "PALADIN", "MAGE", "WARLOCK", "MONK" }
				},
				{
					--str 1h mace
					ID = 166897,
					Classes = { "PALADIN", "WARRIOR", "SHAMAN" }
				}
			}
		}
	}
	
	return DarkshoreSources
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
		[TTD2.Tools.Unit.PlayerFaction.Alliance]	= 117,
		[TTD2.Tools.Unit.PlayerFaction.Horde]		= 118
	}
	return ContributionIDs
end

function this:GetQuestIDs()
	
	local QuestIDs =
	{
		[TTD2.Tools.Unit.PlayerFaction.Alliance]	= 53992,
		[TTD2.Tools.Unit.PlayerFaction.Horde]		= 53955
	}
	return QuestIDs
end
