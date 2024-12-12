local name,ZGV = ...

ZGV.TalentAdvisor.SuggestedSpec = {
	DEATHKNIGHT = 3,
	DEMONHUNTER = 1,
	DRUID = 2,
	EVOKER = 1,
	HUNTER = 1,
	MAGE = 3,
	MONK = 3,
	PALADIN = 3,
	PRIEST = 3,
	ROGUE = 2,
	SHAMAN = 2,
	WARLOCK = 2,
	WARRIOR = 1,
}

-- talent that have the same spellID need to be mapped to entryID the hard way
ZGV.TalentAdvisor.SpecialMapping = {
	["PALADIN"] = {
		[1] = {
			["Avenging Wrath"] = 102593,
			["Avenging Wrath: Might"] = 102569,
		},
		[2] = {
			["Avenging Wrath: Might"] = 102448,
			["Avenging Wrath"] = 102593,
			["Sanctified Wrath"] = 102611,
		},
		[3] = {
			["Avenging Wrath"] = 102593,
			["Avenging Wrath: Might"] = 102519,
		},
	},
	["DRUID"] = {
		[1] = {
		},
		[2] = {
		},
		[3] = {
			["Berserk: Persistence"] = 103211,
			["Berserk: Ravage"] = 103216,
			["Berserk: Unchecked Aggression"] = 103224,
		},
	},
}