local _, ns = ...
local M, R, U, I = unpack(ns)
--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local AzeritePowerWeights = {}

-- Powers for every Class and Spec
local sourceData = {
	["center"] = {
		["spellID"] = 263978,
		["icon"] = 2065624,
		["name"] = "Azerite Empowered",
		["azeritePowerID"] = 13,
	},
	["class"] = {
		{
			[73] = {
				{
					["spellID"] = 272824,
					["icon"] = 136105,
					["name"] = "Deafening Crash",
					["azeritePowerID"] = 118,
				}, -- [1]
				{
					["spellID"] = 279172,
					["icon"] = 1377132,
					["name"] = "Bloodsport",
					["azeritePowerID"] = 177,
				}, -- [2]
				{
					["spellID"] = 275860,
					["icon"] = 134952,
					["name"] = "Reinforced Plating",
					["azeritePowerID"] = 237,
				}, -- [3]
				{
					["spellID"] = 278760,
					["icon"] = 132353,
					["name"] = "Callous Reprisal",
					["azeritePowerID"] = 440,
				}, -- [4]
				{
					["spellID"] = 278765,
					["icon"] = 942783,
					["name"] = "Iron Fortress",
					["azeritePowerID"] = 441,
				}, -- [5]
				{
					["spellID"] = 277636,
					["icon"] = 134951,
					["name"] = "Brace for Impact",
					["azeritePowerID"] = 450,
				}, -- [6]
			},
			[71] = {
				{
					["spellID"] = 272866,
					["icon"] = 132355,
					["name"] = "Executioner's Precision",
					["azeritePowerID"] = 121,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 275529,
					["icon"] = 236314,
					["name"] = "Test of Might",
					["azeritePowerID"] = 226,
				}, -- [3]
				{
					["spellID"] = 277639,
					["icon"] = 132223,
					["name"] = "Seismic Wave",
					["azeritePowerID"] = 433,
				}, -- [4]
				{
					["spellID"] = 278751,
					["icon"] = 132340,
					["name"] = "Crushing Assault",
					["azeritePowerID"] = 434,
				}, -- [5]
				{
					["spellID"] = 278752,
					["icon"] = 464973,
					["name"] = "Lord of War",
					["azeritePowerID"] = 435,
				}, -- [6]
			},
			[72] = {
				{
					["spellID"] = 272836,
					["icon"] = 136088,
					["name"] = "Trample the Weak",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 273420,
					["icon"] = 136012,
					["name"] = "Bloodcraze",
					["azeritePowerID"] = 176,
				}, -- [3]
				{
					["spellID"] = 275632,
					["icon"] = 132352,
					["name"] = "Pulverizing Blows",
					["azeritePowerID"] = 229,
				}, -- [4]
				{
					["spellID"] = 278757,
					["icon"] = 136110,
					["name"] = "Simmering Rage",
					["azeritePowerID"] = 437,
				}, -- [5]
				{
					["spellID"] = 278758,
					["icon"] = 132147,
					["name"] = "Reckless Flurry",
					["azeritePowerID"] = 438,
				}, -- [6]
				{
					["spellID"] = 277638,
					["icon"] = 458972,
					["name"] = "Infinite Fury",
					["azeritePowerID"] = 451,
				}, -- [7]
			},
		}, -- [1]
		{
			[70] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 278617,
					["icon"] = 135897,
					["name"] = "Relentless Inquisitor",
					["azeritePowerID"] = 154,
				}, -- [2]
				{
					["spellID"] = 273473,
					["icon"] = 1360757,
					["name"] = "Expurgation",
					["azeritePowerID"] = 187,
				}, -- [3]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [4]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [5]
				{
					["spellID"] = 278615,
					["icon"] = 135986,
					["name"] = "Zealotry",
					["azeritePowerID"] = 396,
				}, -- [6]
				{
					["spellID"] = 277678,
					["icon"] = 236250,
					["name"] = "Divine Right",
					["azeritePowerID"] = 453,
				}, -- [7]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [8]
			},
			[65] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [2]
				{
					["spellID"] = 273027,
					["icon"] = 1360762,
					["name"] = "Martyr's Breath",
					["azeritePowerID"] = 139,
				}, -- [3]
				{
					["spellID"] = 273513,
					["icon"] = 135907,
					["name"] = "Moment of Compassion",
					["azeritePowerID"] = 188,
				}, -- [4]
				{
					["spellID"] = 275463,
					["icon"] = 236254,
					["name"] = "Divine Revelations",
					["azeritePowerID"] = 233,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278594,
					["icon"] = 461859,
					["name"] = "Breaking Dawn",
					["azeritePowerID"] = 394,
				}, -- [8]
				{
					["spellID"] = 278615,
					["icon"] = 135986,
					["name"] = "Zealotry",
					["azeritePowerID"] = 396,
				}, -- [9]
				{
					["spellID"] = 277674,
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [10]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [11]
			},
			[66] = {
				{
					["spellID"] = 272898,
					["icon"] = 135875,
					["name"] = "Avenger's Might",
					["azeritePowerID"] = 125,
				}, -- [1]
				{
					["spellID"] = 272976,
					["icon"] = 135943,
					["name"] = "Bulwark of Light",
					["azeritePowerID"] = 133,
				}, -- [2]
				{
					["spellID"] = 278605,
					["icon"] = 135874,
					["name"] = "Soaring Shield",
					["azeritePowerID"] = 150,
				}, -- [3]
				{
					["spellID"] = 273553,
					["icon"] = 135919,
					["name"] = "Dauntless Divinity",
					["azeritePowerID"] = 189,
				}, -- [4]
				{
					["spellID"] = 275477,
					["icon"] = 236265,
					["name"] = "Inner Light",
					["azeritePowerID"] = 234,
				}, -- [5]
				{
					["spellID"] = 275496,
					["icon"] = 135959,
					["name"] = "Indomitable Justice",
					["azeritePowerID"] = 235,
				}, -- [6]
				{
					["spellID"] = 278593,
					["icon"] = 135917,
					["name"] = "Grace of the Justicar",
					["azeritePowerID"] = 393,
				}, -- [7]
				{
					["spellID"] = 278609,
					["icon"] = 133176,
					["name"] = "Inspiring Vanguard",
					["azeritePowerID"] = 395,
				}, -- [8]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [9]
			},
		}, -- [2]
		{
			[255] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 272742,
					["icon"] = 451164,
					["name"] = "Wildfire Cluster",
					["azeritePowerID"] = 110,
				}, -- [2]
				{
					["spellID"] = 273283,
					["icon"] = 1033905,
					["name"] = "Latent Poison",
					["azeritePowerID"] = 163,
				}, -- [3]
				{
					["spellID"] = 274590,
					["icon"] = 136067,
					["name"] = "Venomous Fangs",
					["azeritePowerID"] = 213,
				}, -- [4]
				{
					["spellID"] = 277653,
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [5]
				{
					["spellID"] = 278532,
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [6]
				{
					["spellID"] = 278533,
					["icon"] = 135134,
					["name"] = "Up Close And Personal",
					["azeritePowerID"] = 373,
				}, -- [7]
			},
			[254] = {
				{
					["spellID"] = 264198,
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["spellID"] = 273265,
					["icon"] = 132218,
					["name"] = "Arcane Flurry",
					["azeritePowerID"] = 162,
				}, -- [2]
				{
					["spellID"] = 274444,
					["icon"] = 132329,
					["name"] = "Unerring Vision",
					["azeritePowerID"] = 212,
				}, -- [3]
				{
					["spellID"] = 277651,
					["icon"] = 135130,
					["name"] = "Steady Aim",
					["azeritePowerID"] = 368,
				}, -- [4]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [5]
				{
					["spellID"] = 278531,
					["icon"] = 878211,
					["name"] = "Focused Fire",
					["azeritePowerID"] = 370,
				}, -- [6]
			},
			[253] = {
				{
					["spellID"] = 272717,
					["icon"] = 132176,
					["name"] = "Serrated Jaws",
					["azeritePowerID"] = 107,
				}, -- [1]
				{
					["spellID"] = 273262,
					["icon"] = 132127,
					["name"] = "Haze of Rage",
					["azeritePowerID"] = 161,
				}, -- [2]
				{
					["spellID"] = 274441,
					["icon"] = 132133,
					["name"] = "Dance of Death",
					["azeritePowerID"] = 211,
				}, -- [3]
				{
					["spellID"] = 278528,
					["icon"] = 132203,
					["name"] = "Pack Alpha",
					["azeritePowerID"] = 365,
				}, -- [4]
				{
					["spellID"] = 279806,
					["icon"] = 136074,
					["name"] = "Primal Instincts",
					["azeritePowerID"] = 366,
				}, -- [5]
				{
					["spellID"] = 278529,
					["icon"] = 2058007,
					["name"] = "Feeding Frenzy",
					["azeritePowerID"] = 367,
				}, -- [6]
				{
					["spellID"] = 278530,
					["icon"] = 132330,
					["name"] = "Rapid Reload",
					["azeritePowerID"] = 369,
				}, -- [7]
			},
		}, -- [3]
		{
			[260] = {
				{
					["spellID"] = 272935,
					["icon"] = 1373908,
					["name"] = "Deadshot",
					["azeritePowerID"] = 129,
				}, -- [1]
				{
					["spellID"] = 273452,
					["icon"] = 1373911,
					["name"] = "Storm of Steel",
					["azeritePowerID"] = 180,
				}, -- [2]
				{
					["spellID"] = 275846,
					["icon"] = 132336,
					["name"] = "Snake Eyes",
					["azeritePowerID"] = 239,
				}, -- [3]
				{
					["spellID"] = 278675,
					["icon"] = 1373910,
					["name"] = "Paradise Lost",
					["azeritePowerID"] = 410,
				}, -- [4]
				{
					["spellID"] = 278676,
					["icon"] = 135610,
					["name"] = "Ace Up Your Sleeve",
					["azeritePowerID"] = 411,
				}, -- [5]
				{
					["spellID"] = 277676,
					["icon"] = 136206,
					["name"] = "Brigand's Blitz",
					["azeritePowerID"] = 446,
				}, -- [6]
			},
			[261] = {
				{
					["spellID"] = 272911,
					["icon"] = 135431,
					["name"] = "Sharpened Blades",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["spellID"] = 273418,
					["icon"] = 1373907,
					["name"] = "Night's Vengeance",
					["azeritePowerID"] = 175,
				}, -- [2]
				{
					["spellID"] = 275896,
					["icon"] = 1373912,
					["name"] = "Blade In The Shadows",
					["azeritePowerID"] = 240,
				}, -- [3]
				{
					["spellID"] = 278681,
					["icon"] = 136181,
					["name"] = "The First Dance",
					["azeritePowerID"] = 413,
				}, -- [4]
				{
					["spellID"] = 278683,
					["icon"] = 252272,
					["name"] = "Inevitability",
					["azeritePowerID"] = 414,
				}, -- [5]
				{
					["spellID"] = 277673,
					["icon"] = 132090,
					["name"] = "Perforate",
					["azeritePowerID"] = 445,
				}, -- [6]
			},
			[259] = {
				{
					["spellID"] = 272911,
					["icon"] = 135431,
					["name"] = "Sharpened Blades",
					["azeritePowerID"] = 124,
				}, -- [1]
				{
					["spellID"] = 273007,
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [2]
				{
					["spellID"] = 273488,
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [3]
				{
					["spellID"] = 276072,
					["icon"] = 463899,
					["name"] = "Poisoned Wire",
					["azeritePowerID"] = 249,
				}, -- [4]
				{
					["spellID"] = 277679,
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [5]
				{
					["spellID"] = 278664,
					["icon"] = 236273,
					["name"] = "Fan of Blades",
					["azeritePowerID"] = 407,
				}, -- [6]
				{
					["spellID"] = 278666,
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [7]
			},
		}, -- [4]
		{
			[257] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272780,
					["icon"] = 135907,
					["name"] = "Permeating Glow",
					["azeritePowerID"] = 114,
				}, -- [2]
				{
					["spellID"] = 273313,
					["icon"] = 237541,
					["name"] = "Blessed Sanctuary",
					["azeritePowerID"] = 165,
				}, -- [3]
				{
					["spellID"] = 275602,
					["icon"] = 135943,
					["name"] = "Prayerful Litany",
					["azeritePowerID"] = 228,
				}, -- [4]
				{
					["spellID"] = 277681,
					["icon"] = 135913,
					["name"] = "Everlasting Light",
					["azeritePowerID"] = 400,
				}, -- [5]
				{
					["spellID"] = 278645,
					["icon"] = 135944,
					["name"] = "Word of Mending",
					["azeritePowerID"] = 401,
				}, -- [6]
				{
					["spellID"] = 278655,
					["icon"] = 135972,
					["name"] = "Sacred Flame",
					["azeritePowerID"] = 402,
				}, -- [7]
			},
			[258] = {
				{
					["spellID"] = 272788,
					["icon"] = 237565,
					["name"] = "Searing Dialogue",
					["azeritePowerID"] = 115,
				}, -- [1]
				{
					["spellID"] = 273319,
					["icon"] = 136224,
					["name"] = "Thought Harvester",
					["azeritePowerID"] = 166,
				}, -- [2]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [3]
				{
					["spellID"] = 275722,
					["icon"] = 237298,
					["name"] = "Whispers of the Damned",
					["azeritePowerID"] = 236,
				}, -- [4]
				{
					["spellID"] = 277682,
					["icon"] = 458229,
					["name"] = "Spiteful Apparitions",
					["azeritePowerID"] = 403,
				}, -- [5]
				{
					["spellID"] = 278659,
					["icon"] = 136163,
					["name"] = "Death Throes",
					["azeritePowerID"] = 404,
				}, -- [6]
				{
					["spellID"] = 278661,
					["icon"] = 1386549,
					["name"] = "Chorus of Insanity",
					["azeritePowerID"] = 405,
				}, -- [7]
			},
			[256] = {
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [1]
				{
					["spellID"] = 272775,
					["icon"] = 135936,
					["name"] = "Moment of Repose",
					["azeritePowerID"] = 113,
				}, -- [2]
				{
					["spellID"] = 273307,
					["icon"] = 237545,
					["name"] = "Weal and Woe",
					["azeritePowerID"] = 164,
				}, -- [3]
				{
					["spellID"] = 275541,
					["icon"] = 136202,
					["name"] = "Depth of the Shadows",
					["azeritePowerID"] = 227,
				}, -- [4]
				{
					["spellID"] = 277680,
					["icon"] = 135924,
					["name"] = "Gift of Forgiveness",
					["azeritePowerID"] = 397,
				}, -- [5]
				{
					["spellID"] = 278629,
					["icon"] = 237567,
					["name"] = "Contemptuous Homily",
					["azeritePowerID"] = 398,
				}, -- [6]
				{
					["spellID"] = 278643,
					["icon"] = 1386546,
					["name"] = "Enduring Luminescence",
					["azeritePowerID"] = 399,
				}, -- [7]
			},
		}, -- [5]
		{
			[252] = {
				{
					["spellID"] = 272738,
					["icon"] = 237519,
					["name"] = "Festering Doom",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 273095,
					["icon"] = 342913,
					["name"] = "Horrid Experimentation",
					["azeritePowerID"] = 142,
				}, -- [3]
				{
					["spellID"] = 274081,
					["icon"] = 1129420,
					["name"] = "Festermight",
					["azeritePowerID"] = 199,
				}, -- [4]
				{
					["spellID"] = 275929,
					["icon"] = 136145,
					["name"] = "Harrowing Decay",
					["azeritePowerID"] = 244,
				}, -- [5]
				{
					["spellID"] = 278482,
					["icon"] = 879926,
					["name"] = "Cankerous Wounds",
					["azeritePowerID"] = 350,
				}, -- [6]
				{
					["spellID"] = 278489,
					["icon"] = 136133,
					["name"] = "Last Surprise",
					["azeritePowerID"] = 351,
				}, -- [7]
			},
			[251] = {
				{
					["spellID"] = 272718,
					["icon"] = 135372,
					["name"] = "Icy Citadel",
					["azeritePowerID"] = 108,
				}, -- [1]
				{
					["spellID"] = 273093,
					["icon"] = 237520,
					["name"] = "Latent Chill",
					["azeritePowerID"] = 141,
				}, -- [2]
				{
					["spellID"] = 274070,
					["icon"] = 236227,
					["name"] = "Glacial Contagion",
					["azeritePowerID"] = 198,
				}, -- [3]
				{
					["spellID"] = 275917,
					["icon"] = 135833,
					["name"] = "Echoing Howl",
					["azeritePowerID"] = 242,
				}, -- [4]
				{
					["spellID"] = 278480,
					["icon"] = 135305,
					["name"] = "Killer Frost",
					["azeritePowerID"] = 346,
				}, -- [5]
				{
					["spellID"] = 278487,
					["icon"] = 538770,
					["name"] = "Frozen Tempest",
					["azeritePowerID"] = 347,
				}, -- [6]
			},
			[250] = {
				{
					["spellID"] = 272684,
					["icon"] = 132155,
					["name"] = "Deep Cuts",
					["azeritePowerID"] = 106,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 274057,
					["icon"] = 237517,
					["name"] = "Marrowblood",
					["azeritePowerID"] = 197,
				}, -- [3]
				{
					["spellID"] = 275924,
					["icon"] = 136168,
					["name"] = "Embrace of the Darkfallen",
					["azeritePowerID"] = 243,
				}, -- [4]
				{
					["spellID"] = 278479,
					["icon"] = 135277,
					["name"] = "Eternal Rune Weapon",
					["azeritePowerID"] = 348,
				}, -- [5]
				{
					["spellID"] = 278484,
					["icon"] = 1376745,
					["name"] = "Bones of the Damned",
					["azeritePowerID"] = 349,
				}, -- [6]
			},
		}, -- [6]
		{
			[263] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 272992,
					["icon"] = 236289,
					["name"] = "Primal Primer",
					["azeritePowerID"] = 137,
				}, -- [2]
				{
					["spellID"] = 273461,
					["icon"] = 136086,
					["name"] = "Strength of Earth",
					["azeritePowerID"] = 179,
				}, -- [3]
				{
					["spellID"] = 275388,
					["icon"] = 237443,
					["name"] = "Lightning Conduit",
					["azeritePowerID"] = 223,
				}, -- [4]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [5]
				{
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [6]
				{
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [7]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [8]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [9]
			},
			[264] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [3]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [4]
				{
					["spellID"] = 272989,
					["icon"] = 136042,
					["name"] = "Soothing Waters",
					["azeritePowerID"] = 138,
				}, -- [5]
				{
					["spellID"] = 273597,
					["icon"] = 538569,
					["name"] = "Ebb and Flow",
					["azeritePowerID"] = 191,
				}, -- [6]
				{
					["spellID"] = 275488,
					["icon"] = 135127,
					["name"] = "Swelling Stream",
					["azeritePowerID"] = 224,
				}, -- [7]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [8]
				{
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [9]
				{
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [10]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [11]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [12]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [13]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [14]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [15]
			},
			[262] = {
				{
					["spellID"] = 263786,
					["icon"] = 538565,
					["name"] = "Astral Shift",
					["azeritePowerID"] = 17,
				}, -- [1]
				{
					["spellID"] = 263792,
					["icon"] = 136015,
					["name"] = "Lightningburn",
					["azeritePowerID"] = 24,
				}, -- [2]
				{
					["spellID"] = 272978,
					["icon"] = 237582,
					["name"] = "Volcanic Lightning",
					["azeritePowerID"] = 135,
				}, -- [3]
				{
					["spellID"] = 273448,
					["icon"] = 136026,
					["name"] = "Lava Shock",
					["azeritePowerID"] = 178,
				}, -- [4]
				{
					["spellID"] = 275381,
					["icon"] = 135790,
					["name"] = "Echo of the Elementals",
					["azeritePowerID"] = 222,
				}, -- [5]
				{
					["spellID"] = 278697,
					["icon"] = 136028,
					["name"] = "Natural Harmony",
					["azeritePowerID"] = 416,
				}, -- [6]
				{
					["spellID"] = 278709,
					["icon"] = 136024,
					["name"] = "Rumbling Tremors",
					["azeritePowerID"] = 417,
				}, -- [7]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [8]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [9]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [10]
			},
		}, -- [7]
		{
			[64] = {
				{
					["spellID"] = 272968,
					["icon"] = 612394,
					["name"] = "Packed Ice",
					["azeritePowerID"] = 132,
				}, -- [1]
				{
					["spellID"] = 273346,
					["icon"] = 1506795,
					["name"] = "Winter's Reach",
					["azeritePowerID"] = 170,
				}, -- [2]
				{
					["spellID"] = 279854,
					["icon"] = 2126034,
					["name"] = "Glacial Assault",
					["azeritePowerID"] = 225,
				}, -- [3]
				{
					["spellID"] = 277663,
					["icon"] = 135846,
					["name"] = "Tunnel of Ice",
					["azeritePowerID"] = 379,
				}, -- [4]
				{
					["spellID"] = 278541,
					["icon"] = 135844,
					["name"] = "Whiteout",
					["azeritePowerID"] = 380,
				}, -- [5]
				{
					["spellID"] = 278542,
					["icon"] = 135838,
					["name"] = "Frigid Grasp",
					["azeritePowerID"] = 381,
				}, -- [6]
			},
			[63] = {
				{
					["spellID"] = 272932,
					["icon"] = 135810,
					["name"] = "Flames of Alacrity",
					["azeritePowerID"] = 128,
				}, -- [1]
				{
					["spellID"] = 273331,
					["icon"] = 135827,
					["name"] = "Preheat",
					["azeritePowerID"] = 168,
				}, -- [2]
				{
					["spellID"] = 274596,
					["icon"] = 135807,
					["name"] = "Blaster Master",
					["azeritePowerID"] = 215,
				}, -- [3]
				{
					["spellID"] = 277656,
					["icon"] = 135808,
					["name"] = "Trailing Embers",
					["azeritePowerID"] = 376,
				}, -- [4]
				{
					["spellID"] = 278538,
					["icon"] = 135812,
					["name"] = "Duplicative Incineration",
					["azeritePowerID"] = 377,
				}, -- [5]
				{
					["spellID"] = 278539,
					["icon"] = 236218,
					["name"] = "Firemind",
					["azeritePowerID"] = 378,
				}, -- [6]
			},
			[62] = {
				{
					["spellID"] = 270669,
					["icon"] = 136096,
					["name"] = "Arcane Pummeling",
					["azeritePowerID"] = 88,
				}, -- [1]
				{
					["spellID"] = 279867,
					["icon"] = 1041233,
					["name"] = "Anomalous Impact",
					["azeritePowerID"] = 127,
				}, -- [2]
				{
					["spellID"] = 273326,
					["icon"] = 136075,
					["name"] = "Brain Storm",
					["azeritePowerID"] = 167,
				}, -- [3]
				{
					["spellID"] = 274594,
					["icon"] = 236205,
					["name"] = "Arcane Pressure",
					["azeritePowerID"] = 214,
				}, -- [4]
				{
					["spellID"] = 278536,
					["icon"] = 135730,
					["name"] = "Galvanizing Spark",
					["azeritePowerID"] = 374,
				}, -- [5]
				{
					["spellID"] = 278537,
					["icon"] = 136116,
					["name"] = "Explosive Echo",
					["azeritePowerID"] = 375,
				}, -- [6]
			},
		}, -- [8]
		{
			[266] = {
				{
					["spellID"] = 272944,
					["icon"] = 136181,
					["name"] = "Shadow's Bite",
					["azeritePowerID"] = 130,
				}, -- [1]
				{
					["spellID"] = 273523,
					["icon"] = 236296,
					["name"] = "Umbral Blaze",
					["azeritePowerID"] = 190,
				}, -- [2]
				{
					["spellID"] = 275395,
					["icon"] = 2032610,
					["name"] = "Explosive Potential",
					["azeritePowerID"] = 231,
				}, -- [3]
				{
					["spellID"] = 278737,
					["icon"] = 535592,
					["name"] = "Demonic Meteor",
					["azeritePowerID"] = 428,
				}, -- [4]
				{
					["spellID"] = 278738,
					["icon"] = 134544,
					["name"] = "Forbidden Knowledge",
					["azeritePowerID"] = 429,
				}, -- [5]
				{
					["spellID"] = 276007,
					["icon"] = 460856,
					["name"] = "Excoriate",
					["azeritePowerID"] = 443,
				}, -- [6]
				{
					["spellID"] = 279878,
					["icon"] = 2065628,
					["name"] = "Supreme Commander",
					["azeritePowerID"] = 458,
				}, -- [7]
			},
			[267] = {
				{
					["spellID"] = 272955,
					["icon"] = 136186,
					["name"] = "Accelerant",
					["azeritePowerID"] = 131,
				}, -- [1]
				{
					["spellID"] = 275425,
					["icon"] = 135817,
					["name"] = "Flashpoint",
					["azeritePowerID"] = 232,
				}, -- [2]
				{
					["spellID"] = 278747,
					["icon"] = 1380866,
					["name"] = "Rolling Havoc",
					["azeritePowerID"] = 431,
				}, -- [3]
				{
					["spellID"] = 278748,
					["icon"] = 135789,
					["name"] = "Chaotic Inferno",
					["azeritePowerID"] = 432,
				}, -- [4]
				{
					["spellID"] = 277644,
					["icon"] = 236291,
					["name"] = "Crashing Chaos",
					["azeritePowerID"] = 444,
				}, -- [5]
				{
					["spellID"] = 279909,
					["icon"] = 135807,
					["name"] = "Bursting Flare",
					["azeritePowerID"] = 460,
				}, -- [6]
			},
			[265] = {
				{
					["spellID"] = 272891,
					["icon"] = 237564,
					["name"] = "Wracking Brilliance",
					["azeritePowerID"] = 123,
				}, -- [1]
				{
					["spellID"] = 273521,
					["icon"] = 136118,
					["name"] = "Inevitable Demise",
					["azeritePowerID"] = 183,
				}, -- [2]
				{
					["spellID"] = 275372,
					["icon"] = 136228,
					["name"] = "Cascading Calamity",
					["azeritePowerID"] = 230,
				}, -- [3]
				{
					["spellID"] = 278721,
					["icon"] = 136139,
					["name"] = "Sudden Onset",
					["azeritePowerID"] = 425,
				}, -- [4]
				{
					["spellID"] = 278727,
					["icon"] = 1416161,
					["name"] = "Dreadful Calling",
					["azeritePowerID"] = 426,
				}, -- [5]
				{
					["spellID"] = 275974,
					["icon"] = 136193,
					["name"] = "Deathbloom",
					["azeritePowerID"] = 442,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["spellID"] = 272804,
					["icon"] = 135906,
					["name"] = "Iron Fists",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["spellID"] = 277669,
					["icon"] = 574575,
					["name"] = "Swift Roundhouse",
					["azeritePowerID"] = 388,
				}, -- [3]
				{
					["spellID"] = 279918,
					["icon"] = 627606,
					["name"] = "Open Palm Strikes",
					["azeritePowerID"] = 389,
				}, -- [4]
				{
					["spellID"] = 278577,
					["icon"] = 606551,
					["name"] = "Pressure Point",
					["azeritePowerID"] = 390,
				}, -- [5]
				{
					["spellID"] = 278580,
					["icon"] = 606552,
					["name"] = "Meridian Strikes",
					["azeritePowerID"] = 391,
				}, -- [6]
			},
			[270] = {
				{
					["spellID"] = 269621,
					["icon"] = 1360980,
					["name"] = "Invigorating Brew",
					["azeritePowerID"] = 76,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [3]
				{
					["spellID"] = 273328,
					["icon"] = 775461,
					["name"] = "Overflowing Mists",
					["azeritePowerID"] = 185,
				}, -- [4]
				{
					["spellID"] = 275975,
					["icon"] = 627487,
					["name"] = "Misty Peaks",
					["azeritePowerID"] = 248,
				}, -- [5]
				{
					["spellID"] = 277667,
					["icon"] = 627485,
					["name"] = "Burst of Life",
					["azeritePowerID"] = 385,
				}, -- [6]
				{
					["spellID"] = 279875,
					["icon"] = 1360978,
					["name"] = "Font of Life",
					["azeritePowerID"] = 386,
				}, -- [7]
				{
					["spellID"] = 278576,
					["icon"] = 1020466,
					["name"] = "Uplifted Spirits",
					["azeritePowerID"] = 387,
				}, -- [8]
				{
					["spellID"] = 277669,
					["icon"] = 574575,
					["name"] = "Swift Roundhouse",
					["azeritePowerID"] = 388,
				}, -- [9]
			},
			[268] = {
				{
					["spellID"] = 272792,
					["icon"] = 615339,
					["name"] = "Boiling Brew",
					["azeritePowerID"] = 116,
				}, -- [1]
				{
					["spellID"] = 273464,
					["icon"] = 1500803,
					["name"] = "Staggering Strikes",
					["azeritePowerID"] = 186,
				}, -- [2]
				{
					["spellID"] = 275892,
					["icon"] = 133701,
					["name"] = "Fit to Burst",
					["azeritePowerID"] = 238,
				}, -- [3]
				{
					["spellID"] = 277665,
					["icon"] = 627486,
					["name"] = "Niuzao's Blessing",
					["azeritePowerID"] = 382,
				}, -- [4]
				{
					["spellID"] = 278569,
					["icon"] = 611419,
					["name"] = "Training of Niuzao",
					["azeritePowerID"] = 383,
				}, -- [5]
				{
					["spellID"] = 278571,
					["icon"] = 642416,
					["name"] = "Elusive Footwork",
					["azeritePowerID"] = 384,
				}, -- [6]
			},
		}, -- [10]
		{
			[103] = {
				{
					["spellID"] = 279524,
					["icon"] = 236149,
					["name"] = "Blood Mist",
					["azeritePowerID"] = 111,
				}, -- [1]
				{
					["spellID"] = 273338,
					["icon"] = 132122,
					["name"] = "Raking Ferocity",
					["azeritePowerID"] = 169,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 274424,
					["icon"] = 132242,
					["name"] = "Shredding Fury",
					["azeritePowerID"] = 209,
				}, -- [4]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [5]
				{
					["spellID"] = 276021,
					["icon"] = 132134,
					["name"] = "Iron Jaws",
					["azeritePowerID"] = 247,
				}, -- [6]
				{
					["spellID"] = 278509,
					["icon"] = 132152,
					["name"] = "Gushing Lacerations",
					["azeritePowerID"] = 358,
				}, -- [7]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [8]
			},
			[104] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 279552,
					["icon"] = 1378702,
					["name"] = "Layered Mane",
					["azeritePowerID"] = 112,
				}, -- [2]
				{
					["spellID"] = 273344,
					["icon"] = 236169,
					["name"] = "Masterful Instincts",
					["azeritePowerID"] = 171,
				}, -- [3]
				{
					["spellID"] = 275906,
					["icon"] = 451161,
					["name"] = "Twisted Claws",
					["azeritePowerID"] = 241,
				}, -- [4]
				{
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [5]
				{
					["spellID"] = 279527,
					["icon"] = 236305,
					["name"] = "Wild Fleshrending",
					["azeritePowerID"] = 359,
				}, -- [6]
				{
					["spellID"] = 278510,
					["icon"] = 132091,
					["name"] = "Gory Regeneration",
					["azeritePowerID"] = 360,
				}, -- [7]
				{
					["spellID"] = 278511,
					["icon"] = 132136,
					["name"] = "Guardian's Wrath",
					["azeritePowerID"] = 361,
				}, -- [8]
			},
			[102] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 272871,
					["icon"] = 136060,
					["name"] = "Streaking Stars",
					["azeritePowerID"] = 122,
				}, -- [2]
				{
					["spellID"] = 273367,
					["icon"] = 136096,
					["name"] = "Power of the Moon",
					["azeritePowerID"] = 173,
				}, -- [3]
				{
					["spellID"] = 274397,
					["icon"] = 535045,
					["name"] = "Sunblaze",
					["azeritePowerID"] = 200,
				}, -- [4]
				{
					["spellID"] = 276152,
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [5]
				{
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [6]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [7]
				{
					["spellID"] = 278507,
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [8]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [9]
			},
			[105] = {
				{
					["spellID"] = 269379,
					["icon"] = 136096,
					["name"] = "Long Night",
					["azeritePowerID"] = 51,
				}, -- [1]
				{
					["spellID"] = 267892,
					["icon"] = 513195,
					["name"] = "Synergistic Growth",
					["azeritePowerID"] = 102,
				}, -- [2]
				{
					["spellID"] = 272802,
					["icon"] = 134222,
					["name"] = "Fungal Essence",
					["azeritePowerID"] = 120,
				}, -- [3]
				{
					["spellID"] = 279778,
					["icon"] = 134914,
					["name"] = "Grove Tending",
					["azeritePowerID"] = 172,
				}, -- [4]
				{
					["spellID"] = 274432,
					["icon"] = 136081,
					["name"] = "Autumn Leaves",
					["azeritePowerID"] = 210,
				}, -- [5]
				{
					["spellID"] = 276155,
					["icon"] = 136097,
					["name"] = "Craggy Bark",
					["azeritePowerID"] = 251,
				}, -- [6]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [7]
				{
					["spellID"] = 278515,
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [8]
				{
					["spellID"] = 278513,
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [9]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [10]
			},
		}, -- [11]
		{
			[577] = {
				{
					["spellID"] = 279581,
					["icon"] = 1305149,
					["name"] = "Revolving Blades",
					["azeritePowerID"] = 126,
				}, -- [1]
				{
					["spellID"] = 273231,
					["icon"] = 1305156,
					["name"] = "Furious Gaze",
					["azeritePowerID"] = 159,
				}, -- [2]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [3]
				{
					["spellID"] = 275144,
					["icon"] = 1247261,
					["name"] = "Unbound Chaos",
					["azeritePowerID"] = 220,
				}, -- [4]
				{
					["spellID"] = 275934,
					["icon"] = 1097741,
					["name"] = "Seething Power",
					["azeritePowerID"] = 245,
				}, -- [5]
				{
					["spellID"] = 278493,
					["icon"] = 1305152,
					["name"] = "Thirsting Blades",
					["azeritePowerID"] = 352,
				}, -- [6]
				{
					["spellID"] = 278500,
					["icon"] = 463286,
					["name"] = "Eyes of Rage",
					["azeritePowerID"] = 353,
				}, -- [7]
			},
			[581] = {
				{
					["spellID"] = 272983,
					["icon"] = 1344647,
					["name"] = "Revel in Pain",
					["azeritePowerID"] = 134,
				}, -- [1]
				{
					["spellID"] = 273236,
					["icon"] = 1344649,
					["name"] = "Infernal Armor",
					["azeritePowerID"] = 160,
				}, -- [2]
				{
					["spellID"] = 275350,
					["icon"] = 1344645,
					["name"] = "Rigid Carapace",
					["azeritePowerID"] = 221,
				}, -- [3]
				{
					["spellID"] = 275968,
					["icon"] = 1344653,
					["name"] = "Gaping Maw",
					["azeritePowerID"] = 246,
				}, -- [4]
				{
					["spellID"] = 278502,
					["icon"] = 1344652,
					["name"] = "Cycle of Binding",
					["azeritePowerID"] = 354,
				}, -- [5]
				{
					["spellID"] = 278501,
					["icon"] = 1344648,
					["name"] = "Essence Sever",
					["azeritePowerID"] = 355,
				}, -- [6]
			},
		}, -- [12]
	},
	["defensive"] = {
		{
			{
				["spellID"] = 280023,
				["icon"] = 132351,
				["name"] = "Moment of Glory",
				["azeritePowerID"] = 476,
			}, -- [1]
			{
				["spellID"] = 280128,
				["icon"] = 132342,
				["name"] = "Bury the Hatchet",
				["azeritePowerID"] = 477,
			}, -- [2]
		}, -- [1]
		{
			{
				["spellID"] = 274388,
				["icon"] = 524354,
				["name"] = "Stalwart Protector",
				["azeritePowerID"] = 206,
			}, -- [1]
			{
				["spellID"] = 280017,
				["icon"] = 1360759,
				["name"] = "Gallant Steed",
				["azeritePowerID"] = 471,
			}, -- [2]
		}, -- [2]
		{
			{
				["spellID"] = 274355,
				["icon"] = 132199,
				["name"] = "Shellshock",
				["azeritePowerID"] = 203,
			}, -- [1]
			{
				["spellID"] = 280014,
				["icon"] = 132293,
				["name"] = "Duck and Cover",
				["azeritePowerID"] = 469,
			}, -- [2]
		}, -- [3]
		{
			{
				["spellID"] = 274692,
				["icon"] = 132307,
				["name"] = "Footpad",
				["azeritePowerID"] = 217,
			}, -- [1]
			{
				["spellID"] = 280020,
				["icon"] = 136177,
				["name"] = "Shrouded Mantle",
				["azeritePowerID"] = 473,
			}, -- [2]
		}, -- [4]
		{
			{
				["spellID"] = 274366,
				["icon"] = 135994,
				["name"] = "Sanctum",
				["azeritePowerID"] = 204,
			}, -- [1]
			{
				["spellID"] = 280018,
				["icon"] = 136066,
				["name"] = "Twist Magic",
				["azeritePowerID"] = 472,
			}, -- [2]
		}, -- [5]
		{
			{
				["spellID"] = 280010,
				["icon"] = 136120,
				["name"] = "Runic Barrier",
				["azeritePowerID"] = 201,
			}, -- [1]
			{
				["spellID"] = 280011,
				["icon"] = 237561,
				["name"] = "March of the Damned",
				["azeritePowerID"] = 465,
			}, -- [2]
		}, -- [6]
		{
			{
				["spellID"] = 274412,
				["icon"] = 538565,
				["name"] = "Serene Spirit",
				["azeritePowerID"] = 207,
			}, -- [1]
			{
				["spellID"] = 280021,
				["icon"] = 136095,
				["name"] = "Pack Spirit",
				["azeritePowerID"] = 474,
			}, -- [2]
		}, -- [7]
		{
			{
				["spellID"] = 274379,
				["icon"] = 135991,
				["name"] = "Eldritch Warding",
				["azeritePowerID"] = 205,
			}, -- [1]
			{
				["spellID"] = 280015,
				["icon"] = 135736,
				["name"] = "Cauterizing Blink",
				["azeritePowerID"] = 468,
			}, -- [2]
		}, -- [8]
		{
			{
				["spellID"] = 274418,
				["icon"] = 538745,
				["name"] = "Lifeblood",
				["azeritePowerID"] = 208,
			}, -- [1]
			{
				["spellID"] = 280022,
				["icon"] = 136169,
				["name"] = "Desperate Power",
				["azeritePowerID"] = 475,
			}, -- [2]
		}, -- [9]
		{
			{
				["spellID"] = 274762,
				["icon"] = 606546,
				["name"] = "Strength of Spirit",
				["azeritePowerID"] = 218,
			}, -- [1]
			{
				["spellID"] = 280016,
				["icon"] = 642414,
				["name"] = "Sweep the Leg",
				["azeritePowerID"] = 470,
			}, -- [2]
		}, -- [10]
		{
			{
				["spellID"] = 274813,
				["icon"] = 136080,
				["name"] = "Reawakening",
				["azeritePowerID"] = 219,
			}, -- [1]
			{
				["spellID"] = 280013,
				["icon"] = 136097,
				["name"] = "Ursoc's Endurance",
				["azeritePowerID"] = 467,
			}, -- [2]
		}, -- [11]
		{
			{
				["spellID"] = 274344,
				["icon"] = 1305158,
				["name"] = "Soulmonger",
				["azeritePowerID"] = 202,
			}, -- [1]
			{
				["spellID"] = 280012,
				["icon"] = 828455,
				["name"] = "Burning Soul",
				["azeritePowerID"] = 466,
			}, -- [2]
		}, -- [12]
		["common"] = {
			{
				["spellID"] = 268594,
				["icon"] = 538536,
				["name"] = "Longstrider",
				["azeritePowerID"] = 14,
			}, -- [1]
			{
				["spellID"] = 263962,
				["icon"] = 1769069,
				["name"] = "Resounding Protection",
				["azeritePowerID"] = 15,
			}, -- [2]
			{
				["spellID"] = 268599,
				["icon"] = 237395,
				["name"] = "Vampiric Speed",
				["azeritePowerID"] = 44,
			}, -- [3]
			{
				["spellID"] = 268437,
				["icon"] = 1387707,
				["name"] = "Impassive Visage",
				["azeritePowerID"] = 83,
			}, -- [4]
			{
				["spellID"] = 268595,
				["icon"] = 651746,
				["name"] = "Bulwark of the Masses",
				["azeritePowerID"] = 84,
			}, -- [5]
			{
				["spellID"] = 268596,
				["icon"] = 1686575,
				["name"] = "Gemhide",
				["azeritePowerID"] = 85,
			}, -- [6]
			{
				["spellID"] = 268435,
				["icon"] = 646669,
				["name"] = "Azerite Fortification",
				["azeritePowerID"] = 86,
			}, -- [7]
			{
				["spellID"] = 268600,
				["icon"] = 413591,
				["name"] = "Self Reliance",
				["azeritePowerID"] = 87,
			}, -- [8]
		},
	},
	["role"] = {
		["tank"] = {
			{
				["spellID"] = 267671,
				["icon"] = 1029596,
				["name"] = "Winds of War",
				["azeritePowerID"] = 43,
			}, -- [1]
			{
				["spellID"] = 267683,
				["icon"] = 1129419,
				["name"] = "Azerite Veins",
				["azeritePowerID"] = 89,
			}, -- [2]
			{
				["spellID"] = 271536,
				["icon"] = 134978,
				["name"] = "Crystalline Carapace",
				["azeritePowerID"] = 98,
			}, -- [3]
			{
				["spellID"] = 271540,
				["icon"] = 645224,
				["name"] = "Ablative Shielding",
				["azeritePowerID"] = 99,
			}, -- [4]
			{
				["spellID"] = 271546,
				["icon"] = 136031,
				["name"] = "Strength in Numbers",
				["azeritePowerID"] = 100,
			}, -- [5]
			{
				["spellID"] = 271557,
				["icon"] = 1323035,
				["name"] = "Shimmering Haven",
				["azeritePowerID"] = 101,
			}, -- [6]
		},
		["nonhealer"] = {
			{
				["spellID"] = 263984,
				["icon"] = 1029585,
				["name"] = "Elemental Whirl",
				["azeritePowerID"] = 21,
			}, -- [1]
			{
				["spellID"] = 266180,
				["icon"] = 252174,
				["name"] = "Overwhelming Power",
				["azeritePowerID"] = 30,
			}, -- [2]
			{
				["spellID"] = 266937,
				["icon"] = 132109,
				["name"] = "Gutripper",
				["azeritePowerID"] = 31,
			}, -- [3]
			{
				["spellID"] = 266936,
				["icon"] = 646670,
				["name"] = "Azerite Globules",
				["azeritePowerID"] = 462,
			}, -- [4]
		},
		["healer"] = {
			{
				["spellID"] = 267880,
				["icon"] = 463526,
				["name"] = "Woundbinder",
				["azeritePowerID"] = 19,
			}, -- [1]
			{
				["spellID"] = 267883,
				["icon"] = 413576,
				["name"] = "Savior",
				["azeritePowerID"] = 42,
			}, -- [2]
			{
				["spellID"] = 267882,
				["icon"] = 970412,
				["name"] = "Concentrated Mending",
				["azeritePowerID"] = 103,
			}, -- [3]
			{
				["spellID"] = 267884,
				["icon"] = 236832,
				["name"] = "Bracing Chill",
				["azeritePowerID"] = 104,
			}, -- [4]
			{
				["spellID"] = 267886,
				["icon"] = 133020,
				["name"] = "Ephemeral Recovery",
				["azeritePowerID"] = 105,
			}, -- [5]
			{
				["spellID"] = 267889,
				["icon"] = 135905,
				["name"] = "Blessed Portents",
				["azeritePowerID"] = 463,
			}, -- [6]
		},
		["common"] = {
			{
				["spellID"] = 264108,
				["icon"] = 538560,
				["name"] = "Blood Siphon",
				["azeritePowerID"] = 18,
			}, -- [1]
			{
				["spellID"] = 267665,
				["icon"] = 236166,
				["name"] = "Lifespeed",
				["azeritePowerID"] = 20,
			}, -- [2]
			{
				["spellID"] = 263987,
				["icon"] = 237589,
				["name"] = "Heed My Call",
				["azeritePowerID"] = 22,
			}, -- [3]
			{
				["spellID"] = 267879,
				["icon"] = 132565,
				["name"] = "On My Way",
				["azeritePowerID"] = 38,
			}, -- [4]
			{
				["spellID"] = 279899,
				["icon"] = 514016,
				["name"] = "Unstable Flames",
				["azeritePowerID"] = 459,
			}, -- [5]
			{
				["spellID"] = 279926,
				["icon"] = 2065623,
				["name"] = "Earthlink",
				["azeritePowerID"] = 461,
			}, -- [6]
		},
	},
	["raid"] = {
		{
			["spellID"] = 280555,
			["icon"] = 2000853,
			["name"] = "Archive of the Titans",
			["azeritePowerID"] = 483,
		}, -- [1]
		{
			["spellID"] = 280559,
			["icon"] = 136039,
			["name"] = "Laser Matrix",
			["azeritePowerID"] = 485,
		}, -- [2]
	},
	["zone"] = {
		{
			["spellID"] = 280710,
			["icon"] = 135885,
			["name"] = "Champion of Azeroth",
			["azeritePowerID"] = 82,
		}, -- [1]
		{
			["spellID"] = 273150,
			["icon"] = 135780,
			["name"] = "Ruinous Bolt",
			["azeritePowerID"] = 156,
		}, -- [2]
		{
			["spellID"] = 273790,
			["icon"] = 2011133,
			["name"] = "Rezan's Fury",
			["azeritePowerID"] = 157,
		}, -- [3]
		{
			["spellID"] = 273682,
			["icon"] = 132299,
			["name"] = "Meticulous Scheming",
			["azeritePowerID"] = 192,
		}, -- [4]
		{
			["spellID"] = 273823,
			["icon"] = 1778229,
			["name"] = "Blightborne Infusion",
			["azeritePowerID"] = 193,
		}, -- [5]
		{
			["spellID"] = 273834,
			["icon"] = 840409,
			["name"] = "Filthy Transfusion",
			["azeritePowerID"] = 194,
		}, -- [6]
		{
			["spellID"] = 273829,
			["icon"] = 463858,
			["name"] = "Secrets of the Deep",
			["azeritePowerID"] = 195,
		}, -- [7]
		{
			["spellID"] = 280429,
			["icon"] = 796638,
			["name"] = "Swirling Sands",
			["azeritePowerID"] = 196,
		}, -- [8]
		{
			["spellID"] = 280402,
			["icon"] = 1698701,
			["name"] = "Tidal Surge",
			["azeritePowerID"] = 478,
		}, -- [9]
		{
			["spellID"] = 280284,
			["icon"] = 135642,
			["name"] = "Dagger in the Back",
			["azeritePowerID"] = 479,
		}, -- [10]
		{
			["spellID"] = 280407,
			["icon"] = 463568,
			["name"] = "Blood Rite",
			["azeritePowerID"] = 480,
		}, -- [11]
		{
			["spellID"] = 280410,
			["icon"] = 132193,
			["name"] = "Incite the Pack",
			["azeritePowerID"] = 481,
		}, -- [12]
		{
			["spellID"] = 280380,
			["icon"] = 839983,
			["name"] = "Thunderous Blast",
			["azeritePowerID"] = 482,
		}, -- [13]
		{
			["spellID"] = 281514,
			["icon"] = 2032578,
			["name"] = "Unstable Catalyst",
			["azeritePowerID"] = 504,
		}, -- [14]
		{
			["spellID"] = 281841,
			["icon"] = 1029595,
			["name"] = "Tradewinds",
			["azeritePowerID"] = 505,
		}, -- [15]
	},
	["profession"] = {
		{
			["spellID"] = 280163,
			["icon"] = 463515,
			["name"] = "Barrage Of Many Bombs",
			["azeritePowerID"] = 498,
		}, -- [1]
		{
			["spellID"] = 280168,
			["icon"] = 134427,
			["name"] = "Ricocheting Inflatable Pyrosaw",
			["azeritePowerID"] = 499,
		}, -- [2]
		{
			["spellID"] = 280174,
			["icon"] = 1320373,
			["name"] = "Synaptic Spark Capacitor",
			["azeritePowerID"] = 500,
		}, -- [3]
		{
			["spellID"] = 280178,
			["icon"] = 133873,
			["name"] = "Relational Normalization Gizmo",
			["azeritePowerID"] = 501,
		}, -- [4]
		{
			["spellID"] = 280181,
			["icon"] = 1336885,
			["name"] = "Personal Absorb-o-Tron",
			["azeritePowerID"] = 502,
		}, -- [5]
		{
			["spellID"] = 280172,
			["icon"] = 514950,
			["name"] = "Auto-Self-Cauterizer",
			["azeritePowerID"] = 503,
		}, -- [6]
	},
	["pvp"] = {
		{
			["spellID"] = 280577,
			["icon"] = 1028980,
			["name"] = "Glory in Battle",
			["azeritePowerID"] = 486,
		}, -- [1]
		{
			["spellID"] = 280579,
			["icon"] = 1035504,
			["name"] = "Retaliatory Fury",
			["azeritePowerID"] = 487,
		}, -- [2]
		{
			["spellID"] = 280582,
			["icon"] = 236646,
			["name"] = "Battlefield Focus",
			["azeritePowerID"] = 488,
		}, -- [3]
		{
			["spellID"] = 280598,
			["icon"] = 236560,
			["name"] = "Sylvanas' Resolve",
			["azeritePowerID"] = 489,
		}, -- [4]
		{
			["spellID"] = 280580,
			["icon"] = 236324,
			["name"] = "Combined Might",
			["azeritePowerID"] = 490,
		}, -- [5]
		{
			["spellID"] = 280581,
			["icon"] = 136003,
			["name"] = "Collective Will",
			["azeritePowerID"] = 491,
		}, -- [6]
		{
			["spellID"] = 280623,
			["icon"] = 1028984,
			["name"] = "Liberator's Might",
			["azeritePowerID"] = 492,
		}, -- [7]
		{
			["spellID"] = 280624,
			["icon"] = 236478,
			["name"] = "Last Gift",
			["azeritePowerID"] = 493,
		}, -- [8]
		{
			["spellID"] = 280627,
			["icon"] = 132486,
			["name"] = "Battlefield Precision",
			["azeritePowerID"] = 494,
		}, -- [9]
		{
			["spellID"] = 280628,
			["icon"] = 1042294,
			["name"] = "Anduin's Dedication",
			["azeritePowerID"] = 495,
		}, -- [10]
		{
			["spellID"] = 280625,
			["icon"] = 2022762,
			["name"] = "Stronger Together",
			["azeritePowerID"] = 496,
		}, -- [11]
		{
			["spellID"] = 280626,
			["icon"] = 236344,
			["name"] = "Stand As One",
			["azeritePowerID"] = 497,
		}, -- [12]
	},
}
AzeritePowerWeights.sourceData = sourceData

-- Default Scales Data
local defaultName = U["DefaultScaleName_Default"]
local defensiveName = U["DefaultScaleName_Defensive"]
local offensiveName = U["DefaultScaleName_Offensive"]
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true

}
AzeritePowerWeights.defaultNameTable = defaultNameTable
local defaultScalesData = {}
AzeritePowerWeights.defaultScalesData = defaultScalesData

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales
	}
end

do
	-- Warrior
		-- Arms
		insertDefaultScalesData(defaultName, 1, 1, {
			[14] = 0.03, -- Longstrider
			[18] = 1.79, -- Blood Siphon
			[20] = 1.66, -- Lifespeed
			[21] = 1.96, -- Elemental Whirl
			[22] = 2.9, -- Heed My Call
			[30] = 2.6, -- Overwhelming Power
			[31] = 2.69, -- Gutripper
			[38] = 1.57, -- On My Way
			[82] = 6.38, -- Champion of Azeroth
			[87] = 0.05, -- Self Reliance
			[100] = 0.05, -- Strength in Numbers
			[101] = 0.07, -- Shimmering Haven
			[121] = 0.88, -- Executioner's Precision
			[156] = 3.76, -- Ruinous Bolt
			[157] = 6.66, -- Rezan's Fury
			[174] = 3.03, -- Gathering Storm
			[192] = 4.58, -- Meticulous Scheming
			[193] = 6.34, -- Blightborne Infusion
			[194] = 5.82, -- Filthy Transfusion
			[195] = 4.98, -- Secrets of the Deep
			[196] = 5.56, -- Swirling Sands
			[226] = 10, -- Test of Might
			[433] = 3.95, -- Seismic Wave
			[434] = 5.63, -- Crushing Assault
			[435] = 8.59, -- Lord of War
			[459] = 2.13, -- Unstable Flames
			[462] = 2, -- Azerite Globules
			[476] = 0.07, -- Moment of Glory
			[478] = 6.25, -- Tidal Surge
			[479] = 7.41, -- Dagger in the Back
			[480] = 3.72, -- Blood Rite
			[481] = 4.34, -- Incite the Pack
			[482] = 9.38, -- Thunderous Blast
			[483] = 4.83, -- Archive of the Titans
			[485] = 8.46, -- Laser Matrix
			[504] = 5.33, -- Unstable Catalyst
			[505] = 4.7, -- Tradewinds
		})

		-- Fury
		insertDefaultScalesData(defaultName, 1, 2, {
			[15] = 0.16, -- Resounding Protection
			[18] = 1.59, -- Blood Siphon
			[20] = 2.5, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[22] = 2.98, -- Heed My Call
			[30] = 3.94, -- Overwhelming Power
			[31] = 2.83, -- Gutripper
			[38] = 1.79, -- On My Way
			[44] = 0.07, -- Vampiric Speed
			[82] = 7.14, -- Champion of Azeroth
			[83] = 0.07, -- Impassive Visage
			[98] = 0.05, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[119] = 4.27, -- Trample the Weak
			[156] = 3.59, -- Ruinous Bolt
			[157] = 6.83, -- Rezan's Fury
			[176] = 3.92, -- Bloodcraze
			[192] = 6.2, -- Meticulous Scheming
			[193] = 6.11, -- Blightborne Infusion
			[194] = 6.59, -- Filthy Transfusion
			[195] = 3.98, -- Secrets of the Deep
			[196] = 5.27, -- Swirling Sands
			[229] = 4.81, -- Pulverizing Blows
			[437] = 7.11, -- Simmering Rage
			[438] = 9.35, -- Reckless Flurry
			[459] = 1.96, -- Unstable Flames
			[462] = 2.14, -- Azerite Globules
			[477] = 0.07, -- Bury the Hatchet
			[478] = 5.77, -- Tidal Surge
			[479] = 6.7, -- Dagger in the Back
			[480] = 4.81, -- Blood Rite
			[481] = 4.05, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.98, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 4.61, -- Unstable Catalyst
			[505] = 4.4, -- Tradewinds
		})

		-- Protection
		insertDefaultScalesData(offensiveName, 1, 3, {

		})
		insertDefaultScalesData(defensiveName, 1, 3, {

		})

	-- Paladin
		-- Holy
		insertDefaultScalesData(defaultName, 2, 1, {

		})

		-- Protection
		insertDefaultScalesData(offensiveName, 2, 2, {
			[18] = 1.05, -- Blood Siphon
			[20] = 1.05, -- Lifespeed
			[21] = 1.1, -- Elemental Whirl
			[22] = 3.14, -- Heed My Call
			[30] = 1.56, -- Overwhelming Power
			[31] = 2.97, -- Gutripper
			[38] = 1.02, -- On My Way
			[82] = 3.74, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[99] = 0.05, -- Ablative Shielding
			[100] = 0.03, -- Strength in Numbers
			[101] = 0.08, -- Shimmering Haven
			[103] = 0.03, -- Concentrated Mending
			[105] = 0.03, -- Ephemeral Recovery
			[125] = 2.84, -- Avenger's Might
			[133] = 0.08, -- Bulwark of Light
			[150] = 1.56, -- Soaring Shield
			[156] = 4.25, -- Ruinous Bolt
			[157] = 7.19, -- Rezan's Fury
			[189] = 0.03, -- Dauntless Divinity
			[192] = 2.55, -- Meticulous Scheming
			[193] = 3.62, -- Blightborne Infusion
			[194] = 6.34, -- Filthy Transfusion
			[195] = 3.28, -- Secrets of the Deep
			[196] = 3.16, -- Swirling Sands
			[234] = 1.36, -- Inner Light
			[235] = 5.56, -- Indomitable Justice
			[393] = 0.03, -- Grace of the Justicar
			[395] = 6.34, -- Inspiring Vanguard
			[454] = 0.05, -- Judicious Defense
			[459] = 1.12, -- Unstable Flames
			[462] = 2.12, -- Azerite Globules
			[463] = 0.03, -- Blessed Portents
			[471] = 0.03, -- Gallant Steed
			[478] = 7.09, -- Tidal Surge
			[479] = 5.73, -- Dagger in the Back
			[480] = 2, -- Blood Rite
			[481] = 2.38, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.16, -- Archive of the Titans
			[485] = 9.06, -- Laser Matrix
			[504] = 3.84, -- Unstable Catalyst
			[505] = 2.63, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 2, 2, {
			[15] = 10, -- Resounding Protection
			[18] = 0.86, -- Blood Siphon
			[21] = 0.01, -- Elemental Whirl
			[38] = 0.01, -- On My Way
			[82] = 0.02, -- Champion of Azeroth
			[125] = 0.02, -- Avenger's Might
			[150] = 0.02, -- Soaring Shield
			[193] = 0.01, -- Blightborne Infusion
			[196] = 0.01, -- Swirling Sands
			[234] = 0.01, -- Inner Light
			[481] = 0.03, -- Incite the Pack
			[505] = 0.03, -- Tradewinds
		})

		-- Retribution
		insertDefaultScalesData(defaultName, 2, 3, {
			[13] = 0.03, -- Azerite Empowered
			[18] = 1.74, -- Blood Siphon
			[20] = 2.3, -- Lifespeed
			[21] = 2.02, -- Elemental Whirl
			[22] = 3.05, -- Heed My Call
			[30] = 3.28, -- Overwhelming Power
			[31] = 2.82, -- Gutripper
			[38] = 1.9, -- On My Way
			[42] = 0.03, -- Savior
			[82] = 6.96, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[100] = 0.03, -- Strength in Numbers
			[103] = 0.03, -- Concentrated Mending
			[125] = 4.81, -- Avenger's Might
			[154] = 6.33, -- Relentless Inquisitor
			[156] = 3.92, -- Ruinous Bolt
			[157] = 6.98, -- Rezan's Fury
			[187] = 4.27, -- Expurgation
			[192] = 5.39, -- Meticulous Scheming
			[193] = 6.21, -- Blightborne Infusion
			[194] = 6.35, -- Filthy Transfusion
			[195] = 4.92, -- Secrets of the Deep
			[196] = 5.09, -- Swirling Sands
			[235] = 4.15, -- Indomitable Justice
			[396] = 3.8, -- Zealotry
			[459] = 2.14, -- Unstable Flames
			[462] = 2.04, -- Azerite Globules
			[478] = 6.8, -- Tidal Surge
			[479] = 8.15, -- Dagger in the Back
			[480] = 4.15, -- Blood Rite
			[481] = 4.48, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.92, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 5.32, -- Unstable Catalyst
			[505] = 4.64, -- Tradewinds
		})

	-- Hunter
		-- Beast Mastery
		insertDefaultScalesData(defaultName, 3, 1, {
			[18] = 1.98, -- Blood Siphon
			[20] = 2.03, -- Lifespeed
			[21] = 2.29, -- Elemental Whirl
			[22] = 3.08, -- Heed My Call
			[30] = 2.83, -- Overwhelming Power
			[31] = 2.9, -- Gutripper
			[38] = 1.95, -- On My Way
			[44] = 0.06, -- Vampiric Speed
			[82] = 7.26, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[107] = 5, -- Serrated Jaws
			[156] = 4.44, -- Ruinous Bolt
			[157] = 7.42, -- Rezan's Fury
			[161] = 6.83, -- Haze of Rage
			[193] = 7.16, -- Blightborne Infusion
			[194] = 6.57, -- Filthy Transfusion
			[195] = 6.21, -- Secrets of the Deep
			[196] = 5.67, -- Swirling Sands
			[211] = 3.29, -- Dance of Death
			[366] = 8.67, -- Primal Instincts
			[367] = 4.49, -- Feeding Frenzy
			[459] = 2.42, -- Unstable Flames
			[462] = 2.13, -- Azerite Globules
			[469] = 0.03, -- Duck and Cover
			[478] = 7.42, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 4.13, -- Blood Rite
			[481] = 5.03, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 6.03, -- Archive of the Titans
			[485] = 9.11, -- Laser Matrix
			[504] = 6.95, -- Unstable Catalyst
			[505] = 5.49, -- Tradewinds
		})

		-- Marksmanship
		insertDefaultScalesData(defaultName, 3, 2, {
			[13] = 0.1, -- Azerite Empowered
			[14] = 0.21, -- Longstrider
			[15] = 0.14, -- Resounding Protection
			[18] = 1.89, -- Blood Siphon
			[20] = 1.66, -- Lifespeed
			[21] = 1.92, -- Elemental Whirl
			[22] = 3.15, -- Heed My Call
			[30] = 2.94, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[36] = 2.03, -- In The Rhythm
			[38] = 1.92, -- On My Way
			[44] = 0.14, -- Vampiric Speed
			[82] = 5.88, -- Champion of Azeroth
			[85] = 0.03, -- Gemhide
			[86] = 0.05, -- Azerite Fortification
			[87] = 0.1, -- Self Reliance
			[156] = 4.32, -- Ruinous Bolt
			[157] = 7.21, -- Rezan's Fury
			[162] = 1.64, -- Arcane Flurry
			[192] = 4.78, -- Meticulous Scheming
			[193] = 4.69, -- Blightborne Infusion
			[194] = 6.3, -- Filthy Transfusion
			[195] = 5.44, -- Secrets of the Deep
			[196] = 4.25, -- Swirling Sands
			[203] = 0.03, -- Shellshock
			[212] = 2.94, -- Unerring Vision
			[368] = 8.68, -- Steady Aim
			[369] = 0.19, -- Rapid Reload
			[370] = 2.8, -- Focused Fire
			[459] = 1.45, -- Unstable Flames
			[462] = 2.08, -- Azerite Globules
			[469] = 0.1, -- Duck and Cover
			[478] = 7.09, -- Tidal Surge
			[479] = 8.23, -- Dagger in the Back
			[480] = 4.04, -- Blood Rite
			[481] = 4.18, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.04, -- Archive of the Titans
			[485] = 9.12, -- Laser Matrix
			[504] = 5.9, -- Unstable Catalyst
			[505] = 4.55, -- Tradewinds
		})

		-- Survival
		insertDefaultScalesData(defaultName, 3, 3, {
			[18] = 1.31, -- Blood Siphon
			[20] = 1.83, -- Lifespeed
			[21] = 1.65, -- Elemental Whirl
			[22] = 2.64, -- Heed My Call
			[30] = 2.68, -- Overwhelming Power
			[31] = 2.42, -- Gutripper
			[38] = 1.55, -- On My Way
			[82] = 5.55, -- Champion of Azeroth
			[107] = 3.85, -- Serrated Jaws
			[110] = 2.52, -- Wildfire Cluster
			[156] = 3.51, -- Ruinous Bolt
			[157] = 6.12, -- Rezan's Fury
			[163] = 7.79, -- Latent Poison
			[192] = 1.83, -- Meticulous Scheming
			[193] = 5.21, -- Blightborne Infusion
			[194] = 5.33, -- Filthy Transfusion
			[195] = 4.94, -- Secrets of the Deep
			[196] = 4.66, -- Swirling Sands
			[213] = 4, -- Venomous Fangs
			[371] = 6.8, -- Blur of Talons
			[372] = 10, -- Wilderness Survival
			[373] = 3.39, -- Up Close And Personal
			[459] = 1.71, -- Unstable Flames
			[462] = 1.79, -- Azerite Globules
			[478] = 5.97, -- Tidal Surge
			[479] = 6.98, -- Dagger in the Back
			[480] = 3.81, -- Blood Rite
			[481] = 3.13, -- Incite the Pack
			[482] = 8.58, -- Thunderous Blast
			[483] = 4.76, -- Archive of the Titans
			[485] = 7.71, -- Laser Matrix
			[504] = 5.55, -- Unstable Catalyst
			[505] = 3.37, -- Tradewinds
		})

	-- Rogue
		-- Assassination
		insertDefaultScalesData(defaultName, 4, 1, {
			[13] = 0.12, -- Azerite Empowered
			[14] = 0.14, -- Longstrider
			[15] = 0.16, -- Resounding Protection
			[18] = 2.03, -- Blood Siphon
			[20] = 1.92, -- Lifespeed
			[21] = 2.27, -- Elemental Whirl
			[22] = 3.22, -- Heed My Call
			[30] = 3.04, -- Overwhelming Power
			[31] = 2.93, -- Gutripper
			[38] = 1.78, -- On My Way
			[44] = 0.12, -- Vampiric Speed
			[82] = 6.84, -- Champion of Azeroth
			[83] = 0.12, -- Impassive Visage
			[84] = 0.09, -- Bulwark of the Masses
			[85] = 0.05, -- Gemhide
			[86] = 0.09, -- Azerite Fortification
			[87] = 0.03, -- Self Reliance
			[124] = 7.08, -- Sharpened Blades
			[136] = 8.12, -- Double Dose
			[156] = 4.21, -- Ruinous Bolt
			[157] = 7.22, -- Rezan's Fury
			[181] = 6.12, -- Twist the Knife
			[192] = 3.8, -- Meticulous Scheming
			[193] = 6.61, -- Blightborne Infusion
			[194] = 5.94, -- Filthy Transfusion
			[195] = 5.49, -- Secrets of the Deep
			[196] = 5.83, -- Swirling Sands
			[217] = 0.12, -- Footpad
			[249] = 3.08, -- Poisoned Wire
			[406] = 3.83, -- Scent of Blood
			[408] = 10, -- Shrouded Suffocation
			[459] = 2.16, -- Unstable Flames
			[462] = 2.12, -- Azerite Globules
			[473] = 0.03, -- Shrouded Mantle
			[478] = 6.93, -- Tidal Surge
			[479] = 8.23, -- Dagger in the Back
			[480] = 4.3, -- Blood Rite
			[481] = 4.95, -- Incite the Pack
			[482] = 9.78, -- Thunderous Blast
			[483] = 5.22, -- Archive of the Titans
			[485] = 9.11, -- Laser Matrix
			[504] = 6.12, -- Unstable Catalyst
			[505] = 5.38, -- Tradewinds
		})

		-- Outlaw
		insertDefaultScalesData(defaultName, 4, 2, {
			[18] = 1.13, -- Blood Siphon
			[20] = 1.11, -- Lifespeed
			[21] = 1.44, -- Elemental Whirl
			[22] = 2.97, -- Heed My Call
			[30] = 2.12, -- Overwhelming Power
			[31] = 2.72, -- Gutripper
			[38] = 1.25, -- On My Way
			[82] = 4.93, -- Champion of Azeroth
			[129] = 7.52, -- Deadshot
			[156] = 3.69, -- Ruinous Bolt
			[157] = 6.98, -- Rezan's Fury
			[180] = 5.94, -- Storm of Steel
			[192] = 3.03, -- Meticulous Scheming
			[193] = 5.35, -- Blightborne Infusion
			[194] = 6.26, -- Filthy Transfusion
			[195] = 4.75, -- Secrets of the Deep
			[196] = 4.87, -- Swirling Sands
			[239] = 4.77, -- Snake Eyes
			[410] = 3.78, -- Paradise Lost
			[411] = 0.47, -- Ace Up Your Sleeve
			[446] = 3.11, -- Brigand's Blitz
			[459] = 1.77, -- Unstable Flames
			[462] = 1.92, -- Azerite Globules
			[478] = 6.34, -- Tidal Surge
			[479] = 8.13, -- Dagger in the Back
			[480] = 2.52, -- Blood Rite
			[481] = 3.24, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.62, -- Archive of the Titans
			[485] = 9, -- Laser Matrix
			[504] = 5.2, -- Unstable Catalyst
			[505] = 3.59, -- Tradewinds
		})

		-- Subtley
		insertDefaultScalesData(defaultName, 4, 3, {
			[15] = 0.03, -- Resounding Protection
			[18] = 1.58, -- Blood Siphon
			[20] = 1.73, -- Lifespeed
			[21] = 1.83, -- Elemental Whirl
			[22] = 2.45, -- Heed My Call
			[30] = 2.39, -- Overwhelming Power
			[31] = 2.06, -- Gutripper
			[38] = 1.64, -- On My Way
			[82] = 6.02, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[124] = 3.78, -- Sharpened Blades
			[156] = 3.8, -- Ruinous Bolt
			[157] = 5.81, -- Rezan's Fury
			[175] = 3.88, -- Night's Vengeance
			[192] = 3.01, -- Meticulous Scheming
			[193] = 5.4, -- Blightborne Infusion
			[194] = 4.57, -- Filthy Transfusion
			[195] = 5.11, -- Secrets of the Deep
			[196] = 4.9, -- Swirling Sands
			[217] = 0.03, -- Footpad
			[240] = 10, -- Blade In The Shadows
			[413] = 3.84, -- The First Dance
			[414] = 8.26, -- Inevitability
			[445] = 2.99, -- Perforate
			[459] = 1.66, -- Unstable Flames
			[462] = 1.54, -- Azerite Globules
			[473] = 0.05, -- Shrouded Mantle
			[478] = 6.46, -- Tidal Surge
			[479] = 6.5, -- Dagger in the Back
			[480] = 3.76, -- Blood Rite
			[481] = 3.76, -- Incite the Pack
			[482] = 7.6, -- Thunderous Blast
			[483] = 4.88, -- Archive of the Titans
			[485] = 7.06, -- Laser Matrix
			[504] = 5.59, -- Unstable Catalyst
			[505] = 4.01, -- Tradewinds
		})

	-- Priest
		-- Discipline
		insertDefaultScalesData(defaultName, 5, 1, {

		})

		-- Holy
		insertDefaultScalesData(defaultName, 5, 2, {

		})

		-- Shadow
		insertDefaultScalesData(defaultName, 5, 3, {
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_DA.md
			[13] = 0.82,
			[18] = 0.86,
			[21] = 1.08,
			[22] = 1.49,
			[30] = 1.97,
			[31] = 1.37,
			[38] = 0.93,
			[82] = 3.53,
			[115] = -0.02,
			[156] = 2.01,
			[157] = 3.37,
			[166] = 1.18,
			[192] = 2.82,
			[193] = 3.76,
			[194] = 2.95,
			[195] = 2.57,
			[196] = 3.34,
			[236] = 3.12,
			[403] = 1.79,
			[404] = 2.46,
			[405] = 1.71,
			[459] = 1.33,
			[461] = 1.06,
			[462] = 1,
			[478] = 3.38,
			[479] = 3.89,
			[480] = 2.28,
			[481] = 2.18,
			[482] = 4.74,
			[483] = 2.34,
			[485] = 4.29,
			[486] = 2.1,
			[487] = 1.25,
			[488] = 3.43,
			[489] = 2.44,
			[490] = 0.6,
			[491] = 0.86,
			[498] = 2.15,
			[499] = 1.3,
			[500] = 2.5,
			[501] = 3.01,
			[504] = 2.85,
			[505] = 2.38,
		})

	-- Death Knight
		-- Blood
		insertDefaultScalesData(offensiveName, 6, 1, {
			[18] = 1.07, -- Blood Siphon
			[20] = 0.81, -- Lifespeed
			[21] = 1.07, -- Elemental Whirl
			[22] = 3.04, -- Heed My Call
			[30] = 1.42, -- Overwhelming Power
			[31] = 2.78, -- Gutripper
			[38] = 0.9, -- On My Way
			[82] = 3.52, -- Champion of Azeroth
			[85] = 0.03, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[106] = 1.8, -- Deep Cuts
			[140] = 0.38, -- Bone Spike Graveyard
			[156] = 3.78, -- Ruinous Bolt
			[157] = 6.88, -- Rezan's Fury
			[192] = 2.43, -- Meticulous Scheming
			[193] = 3.78, -- Blightborne Infusion
			[194] = 6.6, -- Filthy Transfusion
			[195] = 3, -- Secrets of the Deep
			[196] = 3.24, -- Swirling Sands
			[348] = 3.59, -- Eternal Rune Weapon
			[349] = 0.38, -- Bones of the Damned
			[459] = 1.21, -- Unstable Flames
			[462] = 1.99, -- Azerite Globules
			[478] = 6.27, -- Tidal Surge
			[479] = 5.51, -- Dagger in the Back
			[480] = 1.88, -- Blood Rite
			[481] = 2.41, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 2.93, -- Archive of the Titans
			[485] = 8.76, -- Laser Matrix
			[504] = 3.32, -- Unstable Catalyst
			[505] = 2.63, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 6, 1, {
			[13] = 0.03, -- Azerite Empowered
			[15] = 10, -- Resounding Protection
			[18] = 0.89, -- Blood Siphon
			[20] = 0.49, -- Lifespeed
			[21] = 0.14, -- Elemental Whirl
			[30] = 0.86, -- Overwhelming Power
			[82] = 0.54, -- Champion of Azeroth
			[86] = 0.01, -- Azerite Fortification
			[100] = 0.01, -- Strength in Numbers
			[140] = 1.22, -- Bone Spike Graveyard
			[157] = 0.02, -- Rezan's Fury
			[192] = 1.4, -- Meticulous Scheming
			[193] = 0.03, -- Blightborne Infusion
			[196] = 0.08, -- Swirling Sands
			[197] = 2.71, -- Marrowblood
			[348] = 0.25, -- Eternal Rune Weapon
			[349] = 0.3, -- Bones of the Damned
			[459] = 0.03, -- Unstable Flames
			[480] = 1.08, -- Blood Rite
			[481] = 0.03, -- Incite the Pack
			[483] = 0.05, -- Archive of the Titans
		})

		-- Frost
		insertDefaultScalesData(defaultName, 6, 2, {
			[15] = 0.17, -- Resounding Protection
			[18] = 2.48, -- Blood Siphon
			[20] = 2.34, -- Lifespeed
			[21] = 2.65, -- Elemental Whirl
			[22] = 3.21, -- Heed My Call
			[30] = 3.12, -- Overwhelming Power
			[31] = 2.81, -- Gutripper
			[38] = 2.2, -- On My Way
			[43] = 0.15, -- Winds of War
			[44] = 0.03, -- Vampiric Speed
			[82] = 8.43, -- Champion of Azeroth
			[83] = 0.09, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.12, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.15, -- Self Reliance
			[99] = 0.09, -- Ablative Shielding
			[100] = 0.12, -- Strength in Numbers
			[101] = 0.06, -- Shimmering Haven
			[108] = 6.55, -- Icy Citadel
			[141] = 4.86, -- Latent Chill
			[156] = 4.89, -- Ruinous Bolt
			[157] = 7.45, -- Rezan's Fury
			[192] = 3.74, -- Meticulous Scheming
			[193] = 7.84, -- Blightborne Infusion
			[194] = 6.38, -- Filthy Transfusion
			[195] = 6.97, -- Secrets of the Deep
			[196] = 7.11, -- Swirling Sands
			[198] = 9.19, -- Glacial Contagion
			[201] = 0.06, -- Runic Barrier
			[242] = 5.03, -- Echoing Howl
			[346] = 4.13, -- Killer Frost
			[347] = 2.98, -- Frozen Tempest
			[459] = 2.59, -- Unstable Flames
			[462] = 2.36, -- Azerite Globules
			[465] = 0.03, -- March of the Damned
			[478] = 9.64, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 4.67, -- Blood Rite
			[481] = 6.13, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 6.49, -- Archive of the Titans
			[485] = 9.39, -- Laser Matrix
			[504] = 7.87, -- Unstable Catalyst
			[505] = 6.33, -- Tradewinds
		})

		-- Unholy
		insertDefaultScalesData(defaultName, 6, 3, {
			[18] = 1.56, -- Blood Siphon
			[20] = 1.7, -- Lifespeed
			[21] = 2, -- Elemental Whirl
			[22] = 3.01, -- Heed My Call
			[30] = 2.91, -- Overwhelming Power
			[31] = 2.71, -- Gutripper
			[38] = 1.7, -- On My Way
			[82] = 5.99, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[86] = 0.05, -- Azerite Fortification
			[101] = 0.1, -- Shimmering Haven
			[109] = 2.1, -- Festering Doom
			[140] = 0.37, -- Bone Spike Graveyard
			[142] = 3.08, -- Horrid Experimentation
			[156] = 4.24, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[192] = 4.44, -- Meticulous Scheming
			[193] = 6.29, -- Blightborne Infusion
			[194] = 6.61, -- Filthy Transfusion
			[195] = 4.78, -- Secrets of the Deep
			[196] = 5.5, -- Swirling Sands
			[199] = 7.81, -- Festermight
			[244] = 5.08, -- Harrowing Decay
			[350] = 3.6, -- Cankerous Wounds
			[351] = 3.11, -- Last Surprise
			[459] = 1.98, -- Unstable Flames
			[462] = 1.95, -- Azerite Globules
			[478] = 7.05, -- Tidal Surge
			[479] = 7.96, -- Dagger in the Back
			[480] = 3.87, -- Blood Rite
			[481] = 3.8, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.56, -- Archive of the Titans
			[485] = 8.87, -- Laser Matrix
			[504] = 5.57, -- Unstable Catalyst
			[505] = 4.09, -- Tradewinds
		})

	-- Shaman
		-- Elemental
		insertDefaultScalesData(defaultName, 7, 1, {
			[18] = 1.45, -- Blood Siphon
			[19] = 0.03, -- Woundbinder
			[20] = 1.72, -- Lifespeed
			[21] = 1.91, -- Elemental Whirl
			[22] = 3.16, -- Heed My Call
			[30] = 2.52, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.89, -- On My Way
			[82] = 5.82, -- Champion of Azeroth
			[84] = 0.05, -- Bulwark of the Masses
			[86] = 0.03, -- Azerite Fortification
			[105] = 0.1, -- Ephemeral Recovery
			[135] = 0.03, -- Volcanic Lightning
			[156] = 4.16, -- Ruinous Bolt
			[157] = 6.97, -- Rezan's Fury
			[178] = 5.14, -- Lava Shock
			[192] = 3.7, -- Meticulous Scheming
			[193] = 6.7, -- Blightborne Infusion
			[194] = 6.56, -- Filthy Transfusion
			[195] = 5.36, -- Secrets of the Deep
			[196] = 5.9, -- Swirling Sands
			[222] = 6.92, -- Echo of the Elementals
			[416] = 3.77, -- Natural Harmony
			[417] = 4.36, -- Rumbling Tremors
			[447] = 5.07, -- Ancestral Resonance
			[448] = 4.65, -- Synapse Shock
			[457] = 10, -- Igneous Potential
			[459] = 2.35, -- Unstable Flames
			[462] = 2.11, -- Azerite Globules
			[474] = 0.1, -- Pack Spirit
			[478] = 6.7, -- Tidal Surge
			[479] = 8.24, -- Dagger in the Back
			[480] = 3.5, -- Blood Rite
			[481] = 3.5, -- Incite the Pack
			[482] = 9.93, -- Thunderous Blast
			[483] = 4.94, -- Archive of the Titans
			[485] = 8.83, -- Laser Matrix
			[504] = 6.09, -- Unstable Catalyst
			[505] = 3.67, -- Tradewinds
		})

		-- Enhancement
		insertDefaultScalesData(defaultName, 7, 2, {
			[13] = 0.12, -- Azerite Empowered
			[15] = 0.03, -- Resounding Protection
			[17] = 0.03, -- Astral Shift
			[18] = 1.7, -- Blood Siphon
			[20] = 1.84, -- Lifespeed
			[21] = 1.8, -- Elemental Whirl
			[22] = 3.03, -- Heed My Call
			[30] = 2.56, -- Overwhelming Power
			[31] = 2.89, -- Gutripper
			[38] = 1.89, -- On My Way
			[82] = 6.28, -- Champion of Azeroth
			[87] = 0.05, -- Self Reliance
			[137] = 4.89, -- Primal Primer
			[156] = 4.19, -- Ruinous Bolt
			[157] = 7.28, -- Rezan's Fury
			[179] = 4.59, -- Strength of Earth
			[192] = 4.45, -- Meticulous Scheming
			[193] = 6.03, -- Blightborne Infusion
			[194] = 6.24, -- Filthy Transfusion
			[195] = 5.21, -- Secrets of the Deep
			[196] = 5.28, -- Swirling Sands
			[223] = 2.87, -- Lightning Conduit
			[416] = 4.07, -- Natural Harmony
			[417] = 3, -- Rumbling Tremors
			[420] = 4.56, -- Roiling Storm
			[447] = 5.12, -- Ancestral Resonance
			[459] = 1.89, -- Unstable Flames
			[462] = 2.03, -- Azerite Globules
			[478] = 7.03, -- Tidal Surge
			[479] = 8.21, -- Dagger in the Back
			[480] = 3.68, -- Blood Rite
			[481] = 3.91, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.03, -- Archive of the Titans
			[485] = 8.96, -- Laser Matrix
			[504] = 6.1, -- Unstable Catalyst
			[505] = 4.4, -- Tradewinds
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 7, 3, {

		})

	-- Mage
		-- Arcane
		insertDefaultScalesData(defaultName, 8, 1, {
			[15] = 0.03, -- Resounding Protection
			[18] = 2.14, -- Blood Siphon
			[20] = 0.57, -- Lifespeed
			[21] = 1.73, -- Elemental Whirl
			[22] = 2.87, -- Heed My Call
			[30] = 1.37, -- Overwhelming Power
			[31] = 2.67, -- Gutripper
			[38] = 1.66, -- On My Way
			[44] = 0.05, -- Vampiric Speed
			[82] = 5.3, -- Champion of Azeroth
			[83] = 0.05, -- Impassive Visage
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.09, -- Gemhide
			[86] = 0.14, -- Azerite Fortification
			[88] = 2.7, -- Arcane Pummeling
			[127] = 1.78, -- Anomalous Impact
			[156] = 4.31, -- Ruinous Bolt
			[157] = 6.62, -- Rezan's Fury
			[167] = 3.5, -- Brain Storm
			[192] = 0.52, -- Meticulous Scheming
			[193] = 6.04, -- Blightborne Infusion
			[194] = 5.97, -- Filthy Transfusion
			[195] = 5.25, -- Secrets of the Deep
			[196] = 4.4, -- Swirling Sands
			[205] = 0.07, -- Eldritch Warding
			[214] = 3.57, -- Arcane Pressure
			[374] = 10, -- Galvanizing Spark
			[375] = 0.05, -- Explosive Echo
			[459] = 1.91, -- Unstable Flames
			[462] = 1.93, -- Azerite Globules
			[478] = 7.09, -- Tidal Surge
			[479] = 7.72, -- Dagger in the Back
			[480] = 2.43, -- Blood Rite
			[481] = 4.24, -- Incite the Pack
			[482] = 9.09, -- Thunderous Blast
			[483] = 4.94, -- Archive of the Titans
			[485] = 8.21, -- Laser Matrix
			[504] = 5.72, -- Unstable Catalyst
			[505] = 4.47, -- Tradewinds
		})

		-- Fire
		insertDefaultScalesData(defaultName, 8, 2, {
			[14] = 0.03, -- Longstrider
			[18] = 1.64, -- Blood Siphon
			[20] = 1.43, -- Lifespeed
			[21] = 1.6, -- Elemental Whirl
			[22] = 3.23, -- Heed My Call
			[30] = 2.05, -- Overwhelming Power
			[31] = 2.99, -- Gutripper
			[38] = 1.67, -- On My Way
			[82] = 5.04, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[85] = 0.05, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[128] = 4.85, -- Flames of Alacrity
			[156] = 4.75, -- Ruinous Bolt
			[157] = 7.23, -- Rezan's Fury
			[168] = 3.35, -- Preheat
			[192] = 2.56, -- Meticulous Scheming
			[193] = 4.85, -- Blightborne Infusion
			[194] = 6.29, -- Filthy Transfusion
			[195] = 4.7, -- Secrets of the Deep
			[196] = 4.25, -- Swirling Sands
			[205] = 0.05, -- Eldritch Warding
			[215] = 6.41, -- Blaster Master
			[376] = 3.5, -- Trailing Embers
			[377] = 9.64, -- Duplicative Incineration
			[378] = 3.98, -- Firemind
			[459] = 1.5, -- Unstable Flames
			[462] = 2.15, -- Azerite Globules
			[478] = 8.05, -- Tidal Surge
			[479] = 8.22, -- Dagger in the Back
			[480] = 2.97, -- Blood Rite
			[481] = 3.76, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.37, -- Archive of the Titans
			[485] = 9.35, -- Laser Matrix
			[504] = 5.52, -- Unstable Catalyst
			[505] = 4.17, -- Tradewinds
		})

		-- Frost
		insertDefaultScalesData(defaultName, 8, 3, {
			[13] = 0.05, -- Azerite Empowered
			[14] = 0.08, -- Longstrider
			[15] = 0.03, -- Resounding Protection
			[18] = 1.62, -- Blood Siphon
			[20] = 1.96, -- Lifespeed
			[21] = 2.32, -- Elemental Whirl
			[22] = 3.24, -- Heed My Call
			[30] = 2.86, -- Overwhelming Power
			[31] = 2.76, -- Gutripper
			[38] = 1.79, -- On My Way
			[44] = 0.1, -- Vampiric Speed
			[82] = 6.48, -- Champion of Azeroth
			[83] = 0.15, -- Impassive Visage
			[84] = 0.17, -- Bulwark of the Masses
			[85] = 0.1, -- Gemhide
			[86] = 0.03, -- Azerite Fortification
			[87] = 0.13, -- Self Reliance
			[132] = 2.66, -- Packed Ice
			[156] = 4.76, -- Ruinous Bolt
			[157] = 7.11, -- Rezan's Fury
			[170] = 4.55, -- Winter's Reach
			[192] = 3.85, -- Meticulous Scheming
			[193] = 6.67, -- Blightborne Infusion
			[194] = 6.48, -- Filthy Transfusion
			[195] = 5.49, -- Secrets of the Deep
			[196] = 5.8, -- Swirling Sands
			[205] = 0.15, -- Eldritch Warding
			[225] = 2.71, -- Glacial Assault
			[379] = 6.33, -- Tunnel of Ice
			[380] = 6.12, -- Whiteout
			[381] = 3.07, -- Frigid Grasp
			[459] = 2.42, -- Unstable Flames
			[462] = 2.18, -- Azerite Globules
			[478] = 7.54, -- Tidal Surge
			[479] = 8.22, -- Dagger in the Back
			[480] = 4.11, -- Blood Rite
			[481] = 4.01, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.44, -- Archive of the Titans
			[485] = 9.14, -- Laser Matrix
			[504] = 6.48, -- Unstable Catalyst
			[505] = 4.59, -- Tradewinds
		})

	-- Warlock
		-- Affliction
		insertDefaultScalesData(defaultName, 9, 1, {
			[18] = 1.99, -- Blood Siphon
			[20] = 1.95, -- Lifespeed
			[21] = 2.14, -- Elemental Whirl
			[22] = 2.99, -- Heed My Call
			[30] = 3.03, -- Overwhelming Power
			[31] = 2.82, -- Gutripper
			[38] = 1.88, -- On My Way
			[82] = 6.57, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[123] = 7.04, -- Wracking Brilliance
			[156] = 3.99, -- Ruinous Bolt
			[157] = 6.81, -- Rezan's Fury
			[183] = 5.02, -- Inevitable Demise
			[192] = 4.44, -- Meticulous Scheming
			[193] = 6.04, -- Blightborne Infusion
			[194] = 6.64, -- Filthy Transfusion
			[195] = 5.1, -- Secrets of the Deep
			[196] = 5.29, -- Swirling Sands
			[230] = 5.27, -- Cascading Calamity
			[425] = 1.77, -- Sudden Onset
			[426] = 1.82, -- Dreadful Calling
			[459] = 1.8, -- Unstable Flames
			[462] = 2.03, -- Azerite Globules
			[478] = 6.7, -- Tidal Surge
			[479] = 7.83, -- Dagger in the Back
			[480] = 4.03, -- Blood Rite
			[481] = 4.99, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.76, -- Archive of the Titans
			[485] = 8.7, -- Laser Matrix
			[504] = 5.76, -- Unstable Catalyst
			[505] = 5.27, -- Tradewinds
		})

		-- Demonology
		insertDefaultScalesData(defaultName, 9, 2, {
			[18] = 1.69, -- Blood Siphon
			[20] = 1.49, -- Lifespeed
			[21] = 1.91, -- Elemental Whirl
			[22] = 3.15, -- Heed My Call
			[30] = 2.52, -- Overwhelming Power
			[31] = 2.74, -- Gutripper
			[38] = 1.69, -- On My Way
			[82] = 6.19, -- Champion of Azeroth
			[86] = 0.03, -- Azerite Fortification
			[130] = 2.97, -- Shadow's Bite
			[156] = 4.4, -- Ruinous Bolt
			[157] = 7.29, -- Rezan's Fury
			[190] = 3.4, -- Umbral Blaze
			[192] = 3.05, -- Meticulous Scheming
			[193] = 5.86, -- Blightborne Infusion
			[194] = 6.41, -- Filthy Transfusion
			[195] = 5.41, -- Secrets of the Deep
			[196] = 4.23, -- Swirling Sands
			[428] = 3.92, -- Demonic Meteor
			[429] = 2.19, -- Forbidden Knowledge
			[458] = 7.44, -- Supreme Commander
			[459] = 2.02, -- Unstable Flames
			[462] = 2.02, -- Azerite Globules
			[478] = 7.04, -- Tidal Surge
			[479] = 8.37, -- Dagger in the Back
			[480] = 3.5, -- Blood Rite
			[481] = 4.2, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 5.18, -- Archive of the Titans
			[485] = 9.03, -- Laser Matrix
			[504] = 5.81, -- Unstable Catalyst
			[505] = 4.65, -- Tradewinds
		})

		-- Destruction
		insertDefaultScalesData(defaultName, 9, 3, {
			[14] = 0.08, -- Longstrider
			[18] = 1.87, -- Blood Siphon
			[20] = 2.43, -- Lifespeed
			[21] = 2.33, -- Elemental Whirl
			[22] = 3.07, -- Heed My Call
			[30] = 3.56, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.95, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[82] = 7.04, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[85] = 0.06, -- Gemhide
			[87] = 0.08, -- Self Reliance
			[131] = 0.03, -- Accelerant
			[156] = 4.33, -- Ruinous Bolt
			[157] = 7.04, -- Rezan's Fury
			[192] = 5.12, -- Meticulous Scheming
			[193] = 6.78, -- Blightborne Infusion
			[194] = 6.6, -- Filthy Transfusion
			[195] = 5.35, -- Secrets of the Deep
			[196] = 5.61, -- Swirling Sands
			[208] = 0.06, -- Lifeblood
			[232] = 4.56, -- Flashpoint
			[431] = 0.03, -- Rolling Havoc
			[432] = 6.19, -- Chaotic Inferno
			[444] = 9.24, -- Crashing Chaos
			[459] = 2.2, -- Unstable Flames
			[460] = 5.07, -- Bursting Flare
			[462] = 2.08, -- Azerite Globules
			[475] = 0.08, -- Desperate Power
			[478] = 7.22, -- Tidal Surge
			[479] = 8.09, -- Dagger in the Back
			[480] = 4.97, -- Blood Rite
			[481] = 4.51, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.92, -- Archive of the Titans
			[485] = 8.96, -- Laser Matrix
			[504] = 5.91, -- Unstable Catalyst
			[505] = 4.97, -- Tradewinds
		})

	-- Monk
		-- Brewmaster
		insertDefaultScalesData(offensiveName, 10, 1, {
			[13] = 0.06, -- Azerite Empowered
			[14] = 0.11, -- Longstrider
			[15] = 0.09, -- Resounding Protection
			[18] = 1.27, -- Blood Siphon
			[19] = 0.06, -- Woundbinder
			[20] = 1.02, -- Lifespeed
			[21] = 1.29, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.4, -- Overwhelming Power
			[31] = 3.01, -- Gutripper
			[38] = 1.29, -- On My Way
			[43] = 0.03, -- Winds of War
			[44] = 0.11, -- Vampiric Speed
			[82] = 4.03, -- Champion of Azeroth
			[83] = 0.11, -- Impassive Visage
			[84] = 0.11, -- Bulwark of the Masses
			[85] = 0.03, -- Gemhide
			[86] = 0.11, -- Azerite Fortification
			[87] = 0.11, -- Self Reliance
			[89] = 0.09, -- Azerite Veins
			[98] = 0.09, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[100] = 0.11, -- Strength in Numbers
			[101] = 0.14, -- Shimmering Haven
			[103] = 0.09, -- Concentrated Mending
			[104] = 0.06, -- Bracing Chill
			[105] = 0.09, -- Ephemeral Recovery
			[116] = 1.96, -- Boiling Brew
			[156] = 5.13, -- Ruinous Bolt
			[157] = 7.43, -- Rezan's Fury
			[186] = 0.11, -- Staggering Strikes
			[192] = 2.31, -- Meticulous Scheming
			[193] = 4.13, -- Blightborne Infusion
			[194] = 6.2, -- Filthy Transfusion
			[195] = 3.89, -- Secrets of the Deep
			[196] = 3.7, -- Swirling Sands
			[218] = 0.03, -- Strength of Spirit
			[238] = 0.09, -- Fit to Burst
			[382] = 0.09, -- Niuzao's Blessing
			[383] = 1.72, -- Training of Niuzao
			[384] = 4.24, -- Elusive Footwork
			[459] = 1.4, -- Unstable Flames
			[462] = 2.18, -- Azerite Globules
			[470] = 0.09, -- Sweep the Leg
			[478] = 8.53, -- Tidal Surge
			[479] = 5.93, -- Dagger in the Back
			[480] = 1.99, -- Blood Rite
			[481] = 2.98, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.73, -- Archive of the Titans
			[485] = 8.99, -- Laser Matrix
			[504] = 4.35, -- Unstable Catalyst
			[505] = 3.17, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 10, 1, {
			[13] = 0.02, -- Azerite Empowered
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 1.28, -- Blood Siphon
			[21] = 0.06, -- Elemental Whirl
			[22] = 0.02, -- Heed My Call
			[38] = 0.11, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.02, -- Vampiric Speed
			[82] = 0.15, -- Champion of Azeroth
			[84] = 0.03, -- Bulwark of the Masses
			[86] = 0.02, -- Azerite Fortification
			[87] = 0.01, -- Self Reliance
			[89] = 0.02, -- Azerite Veins
			[98] = 0.03, -- Crystalline Carapace
			[104] = 0.01, -- Bracing Chill
			[116] = 8.16, -- Boiling Brew
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.03, -- Rezan's Fury
			[186] = 0.77, -- Staggering Strikes
			[193] = 0.43, -- Blightborne Infusion
			[195] = 0.35, -- Secrets of the Deep
			[196] = 0.39, -- Swirling Sands
			[238] = 0.02, -- Fit to Burst
			[383] = 0.17, -- Training of Niuzao
			[384] = 0.03, -- Elusive Footwork
			[459] = 0.14, -- Unstable Flames
			[462] = 0.01, -- Azerite Globules
			[463] = 0.01, -- Blessed Portents
			[470] = 0.02, -- Sweep the Leg
			[481] = 0.3, -- Incite the Pack
			[482] = 0.03, -- Thunderous Blast
			[483] = 0.35, -- Archive of the Titans
			[504] = 0.38, -- Unstable Catalyst
			[505] = 0.3, -- Tradewinds
		})

		-- Mistweaver
		insertDefaultScalesData(defaultName, 10, 2, {

		})

		-- Windwalker
		insertDefaultScalesData(defaultName, 10, 3, {
			[13] = 0.08, -- Azerite Empowered
			[15] = 0.11, -- Resounding Protection
			[18] = 1.79, -- Blood Siphon
			[20] = 1.09, -- Lifespeed
			[21] = 2.05, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.64, -- Overwhelming Power
			[31] = 2.9, -- Gutripper
			[38] = 1.99, -- On My Way
			[42] = 0.06, -- Savior
			[43] = 0.03, -- Winds of War
			[82] = 5.87, -- Champion of Azeroth
			[83] = 0.03, -- Impassive Visage
			[84] = 0.06, -- Bulwark of the Masses
			[85] = 0.11, -- Gemhide
			[86] = 0.08, -- Azerite Fortification
			[87] = 0.08, -- Self Reliance
			[89] = 0.13, -- Azerite Veins
			[98] = 0.08, -- Crystalline Carapace
			[99] = 0.06, -- Ablative Shielding
			[100] = 0.13, -- Strength in Numbers
			[101] = 0.13, -- Shimmering Haven
			[103] = 0.18, -- Concentrated Mending
			[104] = 0.11, -- Bracing Chill
			[105] = 0.13, -- Ephemeral Recovery
			[117] = 0.03, -- Iron Fists
			[156] = 5.04, -- Ruinous Bolt
			[157] = 7.44, -- Rezan's Fury
			[184] = 6.35, -- Sunrise Technique
			[192] = 3.2, -- Meticulous Scheming
			[193] = 5.85, -- Blightborne Infusion
			[194] = 6.35, -- Filthy Transfusion
			[195] = 4.92, -- Secrets of the Deep
			[196] = 5.19, -- Swirling Sands
			[218] = 0.11, -- Strength of Spirit
			[388] = 3.48, -- Swift Roundhouse
			[389] = 4.01, -- Open Palm Strikes
			[390] = 5.8, -- Pressure Point
			[391] = 7.94, -- Meridian Strikes
			[459] = 1.99, -- Unstable Flames
			[462] = 2.2, -- Azerite Globules
			[463] = 0.18, -- Blessed Portents
			[470] = 0.21, -- Sweep the Leg
			[478] = 8.34, -- Tidal Surge
			[479] = 8.57, -- Dagger in the Back
			[480] = 2.85, -- Blood Rite
			[481] = 4.01, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.64, -- Archive of the Titans
			[485] = 9.3, -- Laser Matrix
			[504] = 5.75, -- Unstable Catalyst
			[505] = 4.39, -- Tradewinds
		})

	-- Druid
		-- Balance
		insertDefaultScalesData(defaultName, 11, 1, {
			[14] = 0.05, -- Longstrider
			[15] = 0.12, -- Resounding Protection
			[18] = 1.51, -- Blood Siphon
			[19] = 0.07, -- Woundbinder
			[20] = 1.7, -- Lifespeed
			[21] = 1.79, -- Elemental Whirl
			[22] = 3.12, -- Heed My Call
			[30] = 2.63, -- Overwhelming Power
			[31] = 2.87, -- Gutripper
			[38] = 1.66, -- On My Way
			[82] = 5.83, -- Champion of Azeroth
			[89] = 0.09, -- Azerite Veins
			[98] = 0.09, -- Crystalline Carapace
			[99] = 0.03, -- Ablative Shielding
			[104] = 0.07, -- Bracing Chill
			[122] = 9.19, -- Streaking Stars
			[156] = 3.89, -- Ruinous Bolt
			[157] = 7.02, -- Rezan's Fury
			[173] = 1.15, -- Power of the Moon
			[192] = 4.6, -- Meticulous Scheming
			[193] = 5.39, -- Blightborne Infusion
			[194] = 6.19, -- Filthy Transfusion
			[195] = 4.84, -- Secrets of the Deep
			[196] = 4.91, -- Swirling Sands
			[200] = 2.76, -- Sunblaze
			[219] = 0.07, -- Reawakening
			[250] = 3.89, -- Dawning Sun
			[356] = 1.15, -- High Noon
			[357] = 0.03, -- Lunar Shrapnel
			[364] = 5.44, -- Lively Spirit
			[459] = 1.73, -- Unstable Flames
			[462] = 2.1, -- Azerite Globules
			[463] = 0.03, -- Blessed Portents
			[478] = 6.38, -- Tidal Surge
			[479] = 8.06, -- Dagger in the Back
			[480] = 3.49, -- Blood Rite
			[481] = 3.63, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.68, -- Archive of the Titans
			[485] = 8.95, -- Laser Matrix
			[504] = 5.55, -- Unstable Catalyst
			[505] = 3.87, -- Tradewinds
		})

		-- Feral
		insertDefaultScalesData(defaultName, 11, 2, {
			[18] = 1.07, -- Blood Siphon
			[20] = 1.97, -- Lifespeed
			[21] = 1.84, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 3.33, -- Overwhelming Power
			[31] = 2.86, -- Gutripper
			[38] = 1.45, -- On My Way
			[82] = 5.93, -- Champion of Azeroth
			[111] = 3.65, -- Blood Mist
			[156] = 3.89, -- Ruinous Bolt
			[157] = 7.15, -- Rezan's Fury
			[169] = 7.51, -- Raking Ferocity
			[192] = 4.33, -- Meticulous Scheming
			[193] = 5.7, -- Blightborne Infusion
			[194] = 5.98, -- Filthy Transfusion
			[195] = 4.74, -- Secrets of the Deep
			[196] = 5.14, -- Swirling Sands
			[209] = 2.39, -- Shredding Fury
			[358] = 4.25, -- Gushing Lacerations
			[459] = 1.8, -- Unstable Flames
			[462] = 2.05, -- Azerite Globules
			[478] = 6.47, -- Tidal Surge
			[479] = 8.24, -- Dagger in the Back
			[480] = 4.4, -- Blood Rite
			[481] = 2.63, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 4.44, -- Archive of the Titans
			[485] = 9.17, -- Laser Matrix
			[504] = 5.23, -- Unstable Catalyst
			[505] = 2.88, -- Tradewinds
		})

		-- Guardian
		insertDefaultScalesData(offensiveName, 11, 3, {
			[18] = 1.13, -- Blood Siphon
			[20] = 1.13, -- Lifespeed
			[21] = 1.28, -- Elemental Whirl
			[22] = 3.2, -- Heed My Call
			[30] = 1.72, -- Overwhelming Power
			[31] = 2.92, -- Gutripper
			[38] = 1.13, -- On My Way
			[43] = 0.03, -- Winds of War
			[82] = 4.24, -- Champion of Azeroth
			[112] = 0.03, -- Layered Mane
			[156] = 4.24, -- Ruinous Bolt
			[157] = 7.23, -- Rezan's Fury
			[192] = 3.13, -- Meticulous Scheming
			[193] = 3.75, -- Blightborne Infusion
			[194] = 6.15, -- Filthy Transfusion
			[195] = 3.46, -- Secrets of the Deep
			[196] = 3.35, -- Swirling Sands
			[241] = 4.12, -- Twisted Claws
			[359] = 1.98, -- Wild Fleshrending
			[361] = 3.23, -- Guardian's Wrath
			[459] = 1.2, -- Unstable Flames
			[462] = 2.1, -- Azerite Globules
			[478] = 7.13, -- Tidal Surge
			[479] = 5.77, -- Dagger in the Back
			[480] = 2.38, -- Blood Rite
			[481] = 2.8, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.35, -- Archive of the Titans
			[485] = 9.13, -- Laser Matrix
			[504] = 3.91, -- Unstable Catalyst
			[505] = 3.09, -- Tradewinds
		})
		-- Guardian
		insertDefaultScalesData(defensiveName, 11, 3, {
			[18] = 10, -- Blood Siphon
		})

		-- Restoration
		insertDefaultScalesData(defaultName, 11, 4, {

		})

	-- Demon Hunter
		-- Havoc
		insertDefaultScalesData(defaultName, 12, 1, {
			[18] = 0.98, -- Blood Siphon
			[20] = 1.2, -- Lifespeed
			[21] = 1.42, -- Elemental Whirl
			[22] = 2.97, -- Heed My Call
			[30] = 1.89, -- Overwhelming Power
			[31] = 2.67, -- Gutripper
			[38] = 1.19, -- On My Way
			[43] = 0.08, -- Winds of War
			[82] = 4.17, -- Champion of Azeroth
			[83] = 0.04, -- Impassive Visage
			[84] = 0.08, -- Bulwark of the Masses
			[85] = 0.04, -- Gemhide
			[86] = 0.04, -- Azerite Fortification
			[87] = 0.06, -- Self Reliance
			[89] = 0.04, -- Azerite Veins
			[126] = 10, -- Revolving Blades
			[156] = 3.64, -- Ruinous Bolt
			[157] = 6.42, -- Rezan's Fury
			[159] = 2.28, -- Furious Gaze
			[160] = 0.16, -- Infernal Armor
			[192] = 3.09, -- Meticulous Scheming
			[193] = 4.59, -- Blightborne Infusion
			[194] = 5.86, -- Filthy Transfusion
			[195] = 4.29, -- Secrets of the Deep
			[196] = 4.1, -- Swirling Sands
			[202] = 0.06, -- Soulmonger
			[220] = 4.63, -- Unbound Chaos
			[245] = 4.01, -- Seething Power
			[352] = 6.55, -- Thirsting Blades
			[353] = 2.09, -- Eyes of Rage
			[459] = 1.52, -- Unstable Flames
			[462] = 1.96, -- Azerite Globules
			[478] = 6.14, -- Tidal Surge
			[479] = 7.39, -- Dagger in the Back
			[480] = 2.46, -- Blood Rite
			[481] = 2.44, -- Incite the Pack
			[482] = 9.16, -- Thunderous Blast
			[483] = 3.99, -- Archive of the Titans
			[485] = 8.21, -- Laser Matrix
			[504] = 4.8, -- Unstable Catalyst
			[505] = 2.46, -- Tradewinds
		})

		-- Vengeance
		insertDefaultScalesData(offensiveName, 12, 2, {
			[15] = 0.03, -- Resounding Protection
			[18] = 1.08, -- Blood Siphon
			[20] = 0.83, -- Lifespeed
			[21] = 1.17, -- Elemental Whirl
			[22] = 3.04, -- Heed My Call
			[30] = 1.46, -- Overwhelming Power
			[31] = 2.75, -- Gutripper
			[38] = 0.94, -- On My Way
			[44] = 0.03, -- Vampiric Speed
			[82] = 3.84, -- Champion of Azeroth
			[86] = 0.03, -- Azerite Fortification
			[99] = 0.03, -- Ablative Shielding
			[156] = 4.16, -- Ruinous Bolt
			[157] = 6.99, -- Rezan's Fury
			[192] = 2.59, -- Meticulous Scheming
			[193] = 4.18, -- Blightborne Infusion
			[194] = 6.5, -- Filthy Transfusion
			[195] = 3.44, -- Secrets of the Deep
			[196] = 3.78, -- Swirling Sands
			[459] = 1.32, -- Unstable Flames
			[462] = 2.04, -- Azerite Globules
			[478] = 6.92, -- Tidal Surge
			[479] = 5.59, -- Dagger in the Back
			[480] = 2.06, -- Blood Rite
			[481] = 2.71, -- Incite the Pack
			[482] = 10, -- Thunderous Blast
			[483] = 3.35, -- Archive of the Titans
			[485] = 8.58, -- Laser Matrix
			[504] = 3.89, -- Unstable Catalyst
			[505] = 2.97, -- Tradewinds
		})
		insertDefaultScalesData(defensiveName, 12, 2, {
			[14] = 0.01, -- Longstrider
			[15] = 10, -- Resounding Protection
			[18] = 1.53, -- Blood Siphon
			[20] = 0.55, -- Lifespeed
			[21] = 0.45, -- Elemental Whirl
			[30] = 0.78, -- Overwhelming Power
			[38] = 0.26, -- On My Way
			[43] = 0.02, -- Winds of War
			[44] = 0.01, -- Vampiric Speed
			[82] = 1.39, -- Champion of Azeroth
			[85] = 0.01, -- Gemhide
			[134] = 0.02, -- Revel in Pain
			[156] = 0.03, -- Ruinous Bolt
			[157] = 0.02, -- Rezan's Fury
			[160] = 0.02, -- Infernal Armor
			[192] = 1.62, -- Meticulous Scheming
			[193] = 1.03, -- Blightborne Infusion
			[195] = 0.94, -- Secrets of the Deep
			[196] = 0.93, -- Swirling Sands
			[202] = 0.01, -- Soulmonger
			[221] = 0.01, -- Rigid Carapace
			[355] = 0.03, -- Essence Sever
			[459] = 0.33, -- Unstable Flames
			[480] = 1.21, -- Blood Rite
			[481] = 0.77, -- Incite the Pack
			[482] = 0.02, -- Thunderous Blast
			[483] = 0.93, -- Archive of the Titans
			[504] = 1.09, -- Unstable Catalyst
			[505] = 0.82, -- Tradewinds
		})
end

local tankSpecs = {
	[1] = 3, -- Protection Warrior
	[2] = 2, -- Protection Paladin
	[6] = 1, -- Blood Death Knight
	[10] = 1, -- Brewmaster Monk
	[11] = 3, -- Guardian Druid
	[12] = 2 -- Vengeance Demon Hunter
}

-- Default ScaleSets for Class and Spec Combinations
local function GetDefaultScaleSet(classID, specNum)
	if (classID) and (specNum) then
		if tankSpecs[classID] == specNum then -- Tank Case
			return "D/"..classID.."/"..specNum.."/"..defensiveName
		else -- Generic Case
			return "D/"..classID.."/"..specNum.."/"..defaultName
		end
	end
end

AzeritePowerWeights.GetDefaultScaleSet = GetDefaultScaleSet

--#EOF


--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
local AceGUI = LibStub("AceGUI-3.0")

-- Scale Viewer/Editor Frame
local function CreateUI(...)
	-- Main Frame
	local frame = AceGUI:Create("Frame")
	frame:SetLayout("Fill")
	frame:SetTitle(format(U["ScaleWeightEditor_Title"], "AzeritePowerWeights"))
	frame:SetStatusText("")
	--frame:SetWidth(474)
	frame:SetWidth(540)
	frame:SetHeight(484)
	frame.frame:SetMinResize(474, 484)
	frame:Hide()

	-- Scales List
	local treeGroup = AceGUI:Create("TreeGroup")
	treeGroup:SetFullWidth(true)
	treeGroup:SetFullHeight(true)
	treeGroup:SetLayout("Fill")

	frame:AddChild(treeGroup)
	AzeritePowerWeights.treeGroup = treeGroup

	-- Content Area
	local scalesScroll = AceGUI:Create("ScrollFrame")
	scalesScroll:SetLayout("Flow")

	treeGroup:AddChild(scalesScroll)
	AzeritePowerWeights.scalesScroll = scalesScroll

	return frame
end

AzeritePowerWeights.CreateUI = CreateUI


-- PopUp Frame
local popupOpenAlready = false
local function CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	local function _closePopUp(widget)
		widget.frame:GetParent().obj:Hide()
	end

	if popupOpenAlready then -- Check if we have popup open already...
		--print(ADDON_NAME, "POPUP JAMMERED!")
		return
	end

	local height = 100
	local frame = AceGUI:Create("Window")
	frame:SetTitle(titleText)
	frame:SetWidth(350)
	frame:SetHeight(height)
	frame:EnableResize(false)
	frame:SetLayout("Flow")
	frame:SetCallback("OnClose", function(widget)
		--print("RELEASED!")
		AceGUI:Release(widget)
		popupOpenAlready = false
	end)

	local text = AceGUI:Create("Label")
	text:SetFullWidth(true)
	text:SetFontObject(GameFontHighlight)
	text:SetText(descriptionText)
	text:SetJustifyH("CENTER")
	frame:AddChild(text)

	local topLine = AceGUI:Create("Heading")
	topLine:SetFullWidth(true)
	frame:AddChild(topLine)

	local edit = AceGUI:Create("EditBox")
	edit:SetFullWidth(true)
	edit:DisableButton(true)
	edit:SetText("")
	edit:SetFocus()
	edit:SetCallback("OnEnterPressed", callbackFunction or _closePopUp)
	frame:AddChild(edit)

	local bottomLine = AceGUI:Create("Heading")
	bottomLine:SetFullWidth(true)
	frame:AddChild(bottomLine)


	if mode == "Import" then -- Import
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetUserData("importString", text)
			accept:SetUserData("importString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		edit:SetUserData("importString", editboxText)
		accept:SetUserData("importString", editboxText)

	elseif mode == "Create" then -- Create
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		local classTable, specTable, orderTable = {}, {}, {}
		local classIconsFile = "Interface\\Glues\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"
		--local classIconsFile = "Interface\\TargetingFrame\\UI-Classes-Circles"
		for i = 1, _G.MAX_CLASSES do
			local classDisplayName, classTag = GetClassInfo(i)
			local c = _G.RAID_CLASS_COLORS[classTag]
			local left, right, top, bottom = unpack(_G.CLASS_ICON_TCOORDS[classTag])
			local classIcon = ("|T%s:18:18:0:0:256:256:%d:%d:%d:%d|t"):format(classIconsFile, left*256, right*256, top*256, bottom*256)
			classTable[i] = ("  %s |c%s%s|r  "):format(classIcon, c.colorStr, classDisplayName)
		end

		local classDropdown = AceGUI:Create("Dropdown")
		classDropdown:SetRelativeWidth(.5)
		classDropdown:SetList(classTable)
		frame:AddChild(classDropdown, edit)

		local specDropdown = AceGUI:Create("Dropdown")
		specDropdown:SetRelativeWidth(.5)
		specDropdown:SetList(specTable)
		frame:AddChild(specDropdown, edit)

		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			classDropdown:SetUserData("nameString", text)
			specDropdown:SetUserData("nameString", text)
			edit:SetUserData("nameString", text)
			accept:SetUserData("nameString", text)
		end)
		classDropdown:SetCallback("OnValueChanged", function(widget, callback, key)
			wipe(specTable)
			wipe(orderTable)
			local value
			for i = 1, GetNumSpecializationsForClassID(key) do
				local specID, name, _, iconID = GetSpecializationInfoForClassID(key, i)
				specTable[specID] = ("  |T%d:18|t %s  "):format(iconID, name)
				orderTable[i] = specID
				if not value then
					value = specID
				end
			end
			specDropdown:SetList(specTable, orderTable)
			specDropdown:SetValue(value)

			classDropdown:SetUserData("classID", key)
			specDropdown:SetUserData("classID", key)
			edit:SetUserData("classID", key)
			accept:SetUserData("classID", key)

			classDropdown:SetUserData("specID", value)
			specDropdown:SetUserData("specID", value)
			edit:SetUserData("specID", value)
			accept:SetUserData("specID", value)
		end)
		specDropdown:SetCallback("OnValueChanged", function(widget, callback, key)
			classDropdown:SetUserData("specID", key)
			specDropdown:SetUserData("specID", key)
			edit:SetUserData("specID", key)
			accept:SetUserData("specID", key)
		end)
		-- Make sure we get return even if the text doesn't change
		classDropdown:SetUserData("nameString", editboxText)
		specDropdown:SetUserData("nameString", editboxText)
		edit:SetUserData("nameString", editboxText)
		accept:SetUserData("nameString", editboxText)
		--classDropdown:SetValue(1) -- Warrior
		--specDropdown:SetValue(71) -- Arms

	elseif mode == "Export" then -- Export
		local close = AceGUI:Create("Button")
		close:SetFullWidth(true)
		close:SetText(_G.CLOSE)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:HighlightText()
		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetText(editboxText)
			edit:HighlightText()
		end)

	elseif mode == "Rename" then -- Rename
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:HighlightText()
		edit:SetCallback("OnTextChanged", function(widget, callback, text)
			edit:SetUserData("renameString", text)
			accept:SetUserData("renameString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		edit:SetUserData("renameString", editboxText)
		accept:SetUserData("renameString", editboxText)

	elseif mode == "Delete" then -- Delete
		local accept = AceGUI:Create("Button")
		accept:SetRelativeWidth(.5)
		accept:SetText(_G.ACCEPT)
		accept:SetCallback("OnClick", callbackFunction or _closePopUp)
		frame:AddChild(accept)

		local close = AceGUI:Create("Button")
		close:SetRelativeWidth(.5)
		close:SetText(_G.CANCEL)
		close:SetCallback("OnClick", _closePopUp)
		frame:AddChild(close)

		edit:SetText(editboxText)
		edit:SetDisabled(true)

	end

	-- Resize frame to fit all elements
	local total, odd = 0, true
	for _, e in pairs(frame.children) do
		local h = e.frame.height or e.frame:GetHeight()
		local w = e.frame.width or e.frame:GetWidth()
		if w < 245 then -- FullWidth elements are 326 pixels wide, half width ~163 pixels
			if odd then -- Count only every other half width element to the total height
				total = total + h + 3
				odd = false
			else
				odd = true
			end
		else
			total = total + h + 3
		end
		--print(">>", h, w, odd, total)
	end

	while frame.content:GetHeight() < total do
		height = height + 1
		frame:SetHeight(height)
	end

	popupOpenAlready = true
end

AzeritePowerWeights.CreatePopUp = CreatePopUp

--#EOF


--[[----------------------------------------------------------------------------
	AzeritePowerWeights

	Helps you pick the best Azerite powers on your gear for your class and spec.

	(c) 2018 -
	Sanex @ EU-Arathor / ahak @ Curseforge
----------------------------------------------------------------------------]]--
-- Libs
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")
local AceGUI = LibStub("AceGUI-3.0")

-- Default DB settings
local dbVersion = 2
local dbDefaults = {
	customScales = {},
	char = {},
	dbVersion = dbVersion
}
local charDefaults = {
	debug = false,
	onlyOwnClassDefaults = true,
	importingCanUpdate = true,
	defensivePowers = true,
	rolePowers = true,
	rolePowersNoOffRolePowers = true,
	zonePowers = true,
	professionPowers = false,
	pvpPowers = false,
	addILvlToScore = true,
	scaleByAzeriteEmpowered = false,
	relativeScore = false,
	showOnlyUpgrades = false,
	specScales = {},
	tooltipScales = {}
}

-- Slots for Azerite Gear
local azeriteSlots = {
	[1] = true, -- Head
	[3] = true, -- Shoulder
	[5] = true -- Chest
}

-- Weight Editor
local importVersion = 1

-- Score Strings
local reallyBigNumber = 2^31 - 1 -- 2147483647, go over this and errors are thrown
local activeStrings = {} -- Pointers of score strings in use are save in this table
local scoreData = {} -- Current active scales are saved to this table

-- Pointers and Eventframe
local customScales, cfg
local db, lastOpenScale
local playerClassID, playerSpecID
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, event, ...)
end)
f:RegisterEvent("ADDON_LOADED")

-- Help functions
local function Debug(text, ...)
	if not cfg or not cfg.debug then return end

	if text then
		if text:match("%%[dfqsx%d%.]") then
			(DEBUG_CHAT_FRAME or ChatFrame3):AddMessage("|cffff9999AzeritePowerWeights:|r " .. format(text, ...))
		else
			(DEBUG_CHAT_FRAME or ChatFrame3):AddMessage("|cffff9999AzeritePowerWeights:|r " .. strjoin(" ", text, tostringall(...)))
		end
	end
end

local function Print(text, ...)
	if text then
		if text:match("%%[dfqs%d%.]") then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00AzeritePowerWeights:|r " .. format(text, ...))
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00AzeritePowerWeights:|r " .. strjoin(" ", text, tostringall(...)))
		end
	end
end

local function initDB(db, defaults) -- This function copies values from one table into another:
	if type(db) ~= "table" then db = {} end
	if type(defaults) ~= "table" then return db end
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			db[k] = initDB(db[k], v)
		elseif type(v) ~= type(db[k]) then
			db[k] = v
		end
	end
	return db
end

local AcquireString, ReleaseString
do
	local string_cache = {}

	function AcquireString(parent, text)
		local string

		if #string_cache > 0 then
			string = tremove(string_cache)
		else
			string = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		end

		string:Show()
		string:SetPoint("CENTER", parent)
		string:SetText(text)

		return string
	end

	function ReleaseString(string)
		string:SetText("")
		string:Hide()
		string:ClearAllPoints()

		string_cache[#string_cache + 1] = string
	end
end -- StringPool

-- Delay function
local lock
local function delayedUpdate()
	if not lock then
		lock = true
		C_Timer.After(0, f.UpdateValues) -- Wait until next frame
	end
end

-- Scale weight editor related functions
local function _customSort(a, b)
	if a.value and b.value then -- Sorting Tree
		if a.text ~= b.text then
			return a.text < b.text
		else
			return a.value < b.value
		end
	else -- Sorting Custom Scales save-table
		if a[1] ~= b[1] then
			return a[1] < b[1]
		elseif a[2] ~= b[2] then
			return a[2] < b[2]
		else
			return a[3] < a[3]
		end
	end
end

local pvpPairs = { -- Used for Exporting/Importing. These powers have same effects, but are different powers
	-- Horde
	[486] = 6,
	[487] = 6,
	[488] = 6,
	[489] = 6,
	[490] = 6,
	[491] = 6,

	-- Alliance
	[492] = -6,
	[493] = -6,
	[494] = -6,
	[495] = -6,
	[496] = -6,
	[497] = -6
}
local function insertCustomScalesData(scaleName, classIndex, specID, powerData) -- Inser into table
	local t = {}
	if powerData and powerData ~= "" then -- String to table
		for _, weight in pairs({ strsplit(",", powerData) }) do
			local azeritePowerID, value = strsplit("=", strtrim(weight))
			azeritePowerID = tonumber(azeritePowerID) or nil
			value = tonumber(value) or nil

			if azeritePowerID and value and value > 0 then
				value = value > reallyBigNumber and reallyBigNumber or value
				t[azeritePowerID] = value
				if pvpPairs[azeritePowerID] then -- Mirror PvP Powers for both factions
					t[azeritePowerID + pvpPairs[azeritePowerID]] = value
				end
			end
		end
	end

	local updated = false
	-- Check if we have scale with same name already and update it
	for key, dataSet in ipairs(customScales) do
		if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classIndex and dataSet[3] == specID then
			dataSet[4] = t
			updated = true
			break
		end
	end

	-- Create new scale if we didn't find existing set
	if not updated then
		customScales[#customScales + 1] = {
			scaleName,
			classIndex,
			specID,
			t
		}
	end

	sort(customScales, _customSort)

	return updated -- Return info if we created new or updated old
end

local function _buildTree(t)
	local t = {}

	t[1] = {
		value = 1,
		text = U["ScalesList_CustomGroupName"],
		disabled = true,
		children = {}
	}
	t[2] = {
		value = 2,
		text = U["ScalesList_DefaultGroupName"],
		disabled = true,
		children = {}
	}

	playerClassID = playerClassID or select(3, UnitClass("player"))

	for _, dataSet in ipairs(customScales) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, class = GetSpecializationInfoByID(dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		if (dataSet) then
			t[1].children[#t[1].children + 1] = {
				value = "C/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, dataSet[1]),
				icon = iconID
			}
		end
	end

	sort(t[1].children, _customSort)
	tinsert(t[1].children,	1, { -- Make sure Create New/Import is the first item on the list
		value = "AzeritePowerWeightsImport",
		text = U["ScalesList_CreateImportText"],
		icon = 134400
	})

	for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		local scaleName = AzeritePowerWeights.defaultNameTable[ dataSet[1] ] and classDisplayName .. " - " .. name .. " (" .. dataSet[1] .. ")" or classDisplayName .. " - " .. name
		if (dataSet) and ((cfg.onlyOwnClassDefaults and classID == playerClassID) or (not cfg.onlyOwnClassDefaults)) then
			t[2].children[#t[2].children + 1] = {
				value = "D/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, scaleName),
				icon = iconID
			}
		end
	end

	return t
end

local function _SelectGroup(widget, callback, group)
	local dataGroup, scaleKey = strsplit("\001", group)

	if dataGroup and not scaleKey then
		scaleKey = dataGroup
	end

	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)
	Debug(">>", dataGroup, ">", scaleKey, ">", groupSet, ">", classID, ">", specNum, ">", scaleName)

	if scaleKey == "AzeritePowerWeightsImport" then -- Create New / Import
		--Debug("!!! Import")
		AzeritePowerWeights:CreateImportGroup(AzeritePowerWeights.scalesScroll)
	else -- Scaleset
		classID = tonumber(classID)
		specNum = tonumber(specNum)
	
		if groupSet == "C" then -- Custom Scales
			--Debug("!!! Custom")

			for _, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					AzeritePowerWeights:CreateWeightEditorGroup(true, AzeritePowerWeights.scalesScroll, dataSet[1], dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum) -- specNum is actually specID here

					break
				end
			end

		elseif groupSet == "D" then -- Default Scales
			--Debug("!!! Default")

			for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
					local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])

					AzeritePowerWeights:CreateWeightEditorGroup(false, AzeritePowerWeights.scalesScroll, ("%s - %s (%s)"):format(classDisplayName, name, dataSet[1]), dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID)

					break
				end
			end

		else -- ???
			Debug("!!! Else")
		end
	end

	delayedUpdate()
end

local function _enableScale(powerWeights, scaleKey)
	--Debug("Enable Scale:", scaleKey)
	wipe(scoreData)
	for k, v in pairs(powerWeights) do
		scoreData[k] = v
	end

	local _, _, _, scaleName = strsplit("/", scaleKey)
	AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], scaleName))

	cfg.specScales[playerSpecID].scaleID = scaleKey
	cfg.specScales[playerSpecID].scaleName = scaleName
	AzeritePowerWeights.treeGroup:SelectByValue(cfg.specScales[playerSpecID].scaleID)
end

local function _checkForNameCollisions(nameString, previousName, classID, specID)
	local collision = true
	local testName = nameString
	local c = 1
	while collision == true do
		collision = false
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == testName and dataSet[2] == classID and dataSet[3] == specID then
				Debug("!!! Name collisions:", nameString, testName)
				collision = true
				testName = ("%s (%d)"):format(nameString, c)
				c = c + 1

				if previousName and testName == previousName then -- Earlier name had (x) in it and we hit the same number, don't increase it
					collision = false
				end

				break
			end
		end
	end

	return testName
end

local function _exportScale(powerWeights, scaleName, classID, specID) -- Create export string and show export popup
	local template = "( %s:%d:\"%s\":%d:%d:%s )"
	local t = {}
	local isHorde = UnitFactionGroup("player") == "Horde"
	for k, v in pairs(powerWeights) do
		if type(tonumber(v)) == "number" and tonumber(v) > 0 then
			if pvpPairs[tonumber(k)] then
				if isHorde and pvpPairs[tonumber(k)] > 0 then -- Horde player and Horde power
					t[#t + 1] = k.."="..v
				elseif not isHorde and pvpPairs[tonumber(k)] < 0 then -- Alliance player and Alliance power
					t[#t + 1] = k.."="..v
				end
			else
				t[#t + 1] = k.."="..v
			end
		end
	end
	sort(t)

	local exportString = format(template, "AzeritePowerWeights", importVersion, scaleName, classID, specID, #t > 0 and " "..strjoin(", ", unpack(t)) or "")
	--Debug("%d - %s", #t, s)

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Export", U["ExportPopup_Title"], format(U["ExportPopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE), exportString)
end

local function _importScale() -- Show import popup and parse input
	local template = "^%s*%(%s*AzeritePowerWeights%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*%)%s*$"
	local callbackFunction = function(widget, callback, ...)
		local importString = widget:GetUserData("importString") or ""
		--Debug(tostringall(strfind(importString, template)))

		local startPos, endPos, stringVersion, scaleName, classID, specID, powerWeights = strfind(importString, template)
		stringVersion = tonumber(stringVersion) or 0
		scaleName = scaleName or U["ScaleName_Unnamed"]
		powerWeights = powerWeights or ""
		classID = tonumber(classID) or nil
		specID = tonumber(specID) or nil

		if not cfg.importingCanUpdate then -- No updating for you, get collision free name
			scaleName = _checkForNameCollisions(scaleName, false, classID, specID)
		end

		if stringVersion < importVersion then -- String version is old
			Print(U["ImportPopup_Error_OldStringVersion"])
		elseif type(classID) ~= "number" or classID < 1 or type(specID) ~= "number" or specID < 1 then -- No class or no spec, this really shouldn't happen ever
			Print(U["ImportPopup_Error_MalformedString"])
		else -- Everything seems to be OK
			local result = insertCustomScalesData(scaleName, classID, specID, powerWeights)

			-- Rebuild Tree
			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)

			if result then -- Updated old scale
				Print(U["ImportPopup_UpdatedScale"], scaleName)
			else -- Created new
				Print(U["ImportPopup_CreatedNewScale"], scaleName)
			end
		end

		--Debug(">", stringVersion, classID, specID, scaleName, powerWeights)

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Import", U["ImportPopup_Title"], format(U["ImportPopup_Desc"], NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
end

local function _createScale() -- Show create popup and parse input
	local callbackFunction = function(widget, callback, ...)
		local classID = widget:GetUserData("classID")
		local specID = widget:GetUserData("specID")
		local nameString = widget:GetUserData("nameString")

		Debug(">", nameString, classID, specID)
		if not nameString or nameString == "" then
			nameString = U["ScaleName_Unnamed"]
		end
		if not classID then
			classID = 1 -- Warrior
			specID = 71 -- Arms
		end

		local scaleName = _checkForNameCollisions(nameString, false, classID, specID)
		Debug(">>", scaleName)
		if scaleName then
			local result = insertCustomScalesData(scaleName, classID, specID)

			-- Rebuild Tree
			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)


			if result then -- Updated old instead of creating new, which should never happen
				Print(U["CreatePopup_Error_UnknownError, scaleName"])
			else -- Expected result
				Print(U["CreatePopup_Error_CreatedNewScale, scaleName"])
			end
		end


		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Create", U["CreatePopup_Title"], format(U["CreatePopup_Desc"], NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
end

local function _renameScale(scaleName, classID, specID, isCurrentScales) -- Show rename popup and check for name collisions
	local callbackFunction = function(widget, callback, ...)
		local renameString = widget:GetUserData("renameString")

		if not renameString or renameString == "" then
			renameString = U["ScaleName_Unnamed"]
		end

		if renameString ~= scaleName then -- Check if name actually changed
			local finalName = _checkForNameCollisions(renameString, scaleName, classID, specID)

			local scaleWeights
			for key, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then
					Debug("> Renamed:", scaleName, "to", finalName)
					dataSet[1] = finalName
					scaleWeights = dataSet[4]

					break
				end
			end

			Print(U["RenamePopup_RenamedScale"], scaleName, finalName)

			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..finalName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)

			if isCurrentScales and scaleWeights then
				Debug("> New Key: C/%d/%d/%s", classID, specID, finalName)
				_enableScale(scaleWeights, "C/"..classID.."/"..specID.."/"..finalName)
			end

			-- Check if we have to rename scaleKeys for other tooltips
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					if charData.tooltipScales and #charData.tooltipScales > 0 then
						for i, tooltipData in ipairs(charData.tooltipScales) do
							if tooltipData.scaleName == scaleName and tooltipData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
								Debug("> Changing scaleKey for tooltipScales", i, charName, realmName)
								tooltipData.scaleID = "C/"..classID.."/"..specID.."/"..finalName
								tooltipData.scaleName = finalName
							end
						end
					end
				end
			end

			-- Check if we have to rename scaleKeys for other characters using same scale
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					for spec, specData in pairs(charData.specScales) do
						if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
							Debug("> Changing scaleKey for specScales", charName, realmName)
							specData.scaleID = "C/"..classID.."/"..specID.."/"..finalName
							specData.scaleName = finalName
						end
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Rename", U["RenamePopup_Title"], format(U["RenamePopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), scaleName, callbackFunction)
end

local function _deleteScale(scaleName, classID, specID, isCurrentScales) -- Show delete popup and remove scale
	local callbackFunction = function(widget, callback, ...)
		local index
		-- Find where in the table scaleKey to be removed is
		for key, dataSet in ipairs(customScales) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then
				Debug("> Delete:", key, scaleName)
				index = key

				break
			end
		end

		-- Remove without breaking the indexing
		tremove(customScales, index)
		Print(U["DeletePopup_DeletedScale"], scaleName)

		AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
		AzeritePowerWeights.treeGroup:SelectByValue("AzeritePowerWeightsImport")
		AzeritePowerWeights.treeGroup:RefreshTree(true)

		-- If removed scaleKey was in use, revert back to default option
		if isCurrentScales then
			local specNum = GetSpecialization()
			playerClassID = playerClassID or select(3, UnitClass("player"))
			local scaleKey = AzeritePowerWeights.GetDefaultScaleSet(playerClassID, specNum)
			local _, _, _, defaultScaleName = strsplit("/", scaleKey)
			
			for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == defaultScaleName and dataSet[2] == playerClassID and dataSet[3] == specNum then
					Debug("Reverting to", scaleKey)
					_enableScale(dataSet[4], scaleKey)

					break
				end
			end

			Print(U["DeletePopup_DeletedDefaultScale"])
		end

		-- Check if this scale was in tooltips
		for realmName, realmData in pairs(db.char) do
			for charName, charData in pairs(realmData) do
				if charData.tooltipScales and #charData.tooltipScales > 0 then
					for i = #charData.tooltipScales, 1 , -1 do -- Go backwards to prevent holes and errors
						local tooltipData = charData.tooltipScales[i]
						if tooltipData.scaleName == scaleName and tooltipData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, remove scaleKey
							Debug("> Deleting scaleKey from tooltipScales", i, charName, realmName)
							tremove(charData.tooltipScales, i)
						end
					end
				end
			end
		end

		-- Check if someone used this scale and remove it so they can revert back to default on their next login
		for realmName, realmData in pairs(db.char) do
			for charName, charData in pairs(realmData) do
				for spec, specData in pairs(charData.specScales) do
					if spec == specID and specData.scaleName == scaleName and specData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, remove scaleKey
						Debug("> Deleting scaleKey from specScales", specID, charName, realmName)
						charData.specScales[spec] = nil
					end
				end
			end
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Delete", U["DeletePopup_Title"], format(U["DeletePopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), U["DeletePopup_Warning"], callbackFunction)
end

function AzeritePowerWeights:CreateImportGroup(container)
	container:ReleaseChildren()

	local version = AceGUI:Create("Label")
	version:SetText("V 8.0.19")
	version:SetJustifyH("RIGHT")
	version:SetFullWidth(true)
	container:AddChild(version)

	local title = AceGUI:Create("Heading")
	title:SetText(U["ScalesList_CreateImportText"])
	title:SetFullWidth(true)
	container:AddChild(title)

	local newButton = AceGUI:Create("Button")
	newButton:SetText(U["WeightEditor_CreateNewText"])
	newButton:SetFullWidth(true)
	newButton:SetCallback("OnClick", function()
		-- Call _createScale
		_createScale()
	end)
	container:AddChild(newButton)

	local importButton = AceGUI:Create("Button")
	importButton:SetText(U["WeightEditor_ImportText"])
	importButton:SetFullWidth(true)
	importButton:SetCallback("OnClick", function()
		-- Call _importScale
		_importScale()
	end)
	container:AddChild(importButton)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = "AzeritePowerWeightsImport"
end

function AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, titleText, powerWeights, scaleKey, isCurrentScales, classID, specID)
	container:ReleaseChildren()

	local title = AceGUI:Create("Heading")
	title:SetText(titleText)
	title:SetFullWidth(true)
	container:AddChild(title)

	local useButton = AceGUI:Create("Button")
	if isCurrentScales then
		useButton:SetText(GRAY_FONT_COLOR_CODE .. U["WeightEditor_EnableScaleText"] .. FONT_COLOR_CODE_CLOSE)
	else
		useButton:SetText(U["WeightEditor_EnableScaleText"])
	end
	useButton:SetRelativeWidth(.5)
	useButton:SetDisabled(isCurrentScales)
	useButton:SetCallback("OnClick", function()
		-- Call _enableScale
		_enableScale(powerWeights, scaleKey)
	end)
	container:AddChild(useButton)

	local exportButton = AceGUI:Create("Button")
	exportButton:SetText(U["WeightEditor_ExportText"])
	exportButton:SetRelativeWidth(.5)
	exportButton:SetCallback("OnClick", function()
		-- Call _exportScale
		_exportScale(powerWeights, titleText, classID, specID)
	end)
	container:AddChild(exportButton)

	if isCustomScale then
		local renameButton = AceGUI:Create("Button")
		renameButton:SetText(U["WeightEditor_RenameText"])
		renameButton:SetRelativeWidth(.5)
		renameButton:SetCallback("OnClick", function()
			-- Call _renameScale
			_renameScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(renameButton)

		local deleteButton = AceGUI:Create("Button")
		deleteButton:SetText(U["WeightEditor_DeleteText"])
		deleteButton:SetRelativeWidth(.5)
		deleteButton:SetCallback("OnClick", function()
			-- Call _deleteScale
			_deleteScale(titleText, classID, specID, isCurrentScales)
		end)
		container:AddChild(deleteButton)
	end

	-- Tooltip start
	local tooltipCheckbox = AceGUI:Create("CheckBox")
	tooltipCheckbox:SetLabel(U["WeightEditor_TooltipText"])
	tooltipCheckbox:SetFullWidth(true)
	tooltipCheckbox:SetValue(false)
	tooltipCheckbox:SetCallback("OnValueChanged", function(widget, callback, checked)
		if checked == true then
			local _, _, _, thisScaleName = strsplit("/", scaleKey)
			cfg.tooltipScales[#cfg.tooltipScales + 1] = {
				scaleID = scaleKey,
				scaleName = thisScaleName
			}
		else
			if #cfg.tooltipScales > 0 then
				for i = #cfg.tooltipScales, 1, -1 do -- Just to make sure if for any errorous reason, there are multiple copies of same scale, they all get removed.
					local v = cfg.tooltipScales[i]
					if v.scaleID == scaleKey then
						tremove(cfg.tooltipScales, i)
					end
				end
			end
		end
		widget:SetValue(checked)
	end)
	container:AddChild(tooltipCheckbox)

	for _, v in ipairs(cfg.tooltipScales) do
		if v.scaleID == scaleKey then
			tooltipCheckbox:SetValue(true)
		end
	end
	-- Tooltip end

	local spacer = AceGUI:Create("Label")
	spacer:SetText(" \n ")
	spacer:SetFullWidth(true)
	container:AddChild(spacer)

	local classTitle = AceGUI:Create("Heading")
	classTitle:SetText(U["PowersTitles_Class"])
	classTitle:SetFullWidth(true)
	container:AddChild(classTitle)

	local roleBits = 0x0
	local BIT_DAMAGER = 0x1
	local BIT_TANK = 0x2
	local BIT_HEALER = 0x4
	for i = 1, GetNumSpecializationsForClassID(classID) do
		local spec, _, _, _, role = GetSpecializationInfoForClassID(classID, i)
		if spec and ((cfg.rolePowersNoOffRolePowers and spec == specID) or (not cfg.rolePowersNoOffRolePowers)) then -- Check if only powers suitable for the spec
			if role == "DAMAGER" then
				roleBits = bit.bor(roleBits, BIT_DAMAGER)
			elseif role == "TANK" then
				roleBits = bit.bor(roleBits, BIT_TANK)
			elseif role == "HEALER" then
				roleBits = bit.bor(roleBits, BIT_HEALER)
			end
		end
	end

	local e = {}
	local c = 1

	local function _saveValue(widget, callback, text)
		local value = tonumber(text) or 0
		value = value > reallyBigNumber and reallyBigNumber or value
		local pointer = widget:GetUserData("dataPointer")
		local pairPointer = widget:GetUserData("pairPointer")
		-- Save to DB
		powerWeights[pointer] = value
		widget:SetText(text == "" and "" or (value and value or ""))
		AceGUI:ClearFocus()
		if pairPointer then
			powerWeights[pairPointer] = value
		end
		if isCurrentScales then
			-- Update visible numbers
			scoreData[pointer] = value
			delayedUpdate()
		end
	end

	-- Center Power
	local cname = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(AzeritePowerWeights.sourceData.center.azeritePowerID).spellID)
	e[c] = AceGUI:Create("EditBox")
	e[c]:SetLabel(format("  |T%d:18|t %s", AzeritePowerWeights.sourceData.center.icon, cname or AzeritePowerWeights.sourceData.center.name))
	e[c]:SetText(powerWeights[AzeritePowerWeights.sourceData.center.azeritePowerID] or "")
	e[c]:SetRelativeWidth(.5)
	if isCustomScale then
		e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.center.azeritePowerID)
		e[c]:SetCallback("OnEnterPressed", _saveValue)
	else
		e[c]:SetDisabled(true)
	end
	container:AddChild(e[c])
	c = c + 1

	-- Class Powers
	for i, powerData in ipairs(AzeritePowerWeights.sourceData.class[classID][specID]) do
		local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
		e[c] = AceGUI:Create("EditBox")
		e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
		e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
		e[c]:SetRelativeWidth(.5)
		if isCustomScale then
			e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.class[classID][specID][i].azeritePowerID)
			e[c]:SetCallback("OnEnterPressed", _saveValue)
		else
			e[c]:SetDisabled(true)
		end
		container:AddChild(e[c])
		c = c + 1
	end

	if cfg.defensivePowers then
		local defTitle = AceGUI:Create("Heading")
		defTitle:SetText(U["PowersTitles_Defensive"])
		defTitle:SetFullWidth(true)
		container:AddChild(defTitle)

		-- Defensive Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.defensive[classID]) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.defensive[classID][i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.defensive.common) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.defensive.common[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.rolePowers then
		local roleTitle = AceGUI:Create("Heading")
		roleTitle:SetText(U["PowersTitles_Role"])
		roleTitle:SetFullWidth(true)
		container:AddChild(roleTitle)

		-- Role Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.common) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:3:::64:16:16:64:0:16|t" -- Tank, DPS & Healer
			e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.common[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end

		-- Non-Healer Powers
		if bit.band(roleBits, bit.bor(BIT_DAMAGER, BIT_TANK)) ~= 0 then
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.nonhealer) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:2:::64:16:16:48:0:16|t" -- Tank & DPS
				e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.nonhealer[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Tank Powers
		if bit.band(roleBits, BIT_TANK) ~= 0 then
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.tank) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:32:48:0:16|t" -- Tank
				e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.tank[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Healer Powers
		if bit.band(roleBits, BIT_HEALER) ~= 0 then
			for i, powerData in ipairs(AzeritePowerWeights.sourceData.role.healer) do
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:48:64:0:16|t" -- Healer
				e[c]:SetLabel(format("  %s |T%d:18|t %s", roleIcon, powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.role.healer[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
	end

	if cfg.zonePowers then
		local zoneTitle = AceGUI:Create("Heading")
		zoneTitle:SetText(U["PowersTitles_Zone"])
		zoneTitle:SetFullWidth(true)
		container:AddChild(zoneTitle)

		-- Raid Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.raid) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t*%s*", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.raid[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
		-- Zone Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.zone) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.zone[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.professionPowers then
		local professionTitle = AceGUI:Create("Heading")
		professionTitle:SetText(U["PowersTitles_Profession"])
		professionTitle:SetFullWidth(true)
		container:AddChild(professionTitle)

		-- Profession Powers
		for i, powerData in ipairs(AzeritePowerWeights.sourceData.profession) do
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.profession[i].azeritePowerID)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	if cfg.pvpPowers then
		local pvpTitle = AceGUI:Create("Heading")
		pvpTitle:SetText(U["PowersTitles_PvP"])
		pvpTitle:SetFullWidth(true)
		container:AddChild(pvpTitle)

		-- PvP Powers
		local isHorde = UnitFactionGroup("player") == "Horde"
		local startPoint = isHorde and 1 or 7
		local endPoint = isHorde and 6 or 12
		for i = startPoint, endPoint do
			local powerData = AzeritePowerWeights.sourceData.pvp[i]
			local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
			e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
			e[c]:SetRelativeWidth(.5)
			if isCustomScale then
				e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.pvp[i].azeritePowerID)
				e[c]:SetUserData("pairPointer", AzeritePowerWeights.sourceData.pvp[i].pair)
				e[c]:SetCallback("OnEnterPressed", _saveValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end
	end

	Debug("C-Elements:", #e)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = scaleKey
end

local function _toggleEditorUI()
	if not AzeritePowerWeights.guiContainer then return end

	if _G.AzeriteEmpoweredItemUI:IsShown() then
		AzeritePowerWeights.guiContainer.frame:SetParent(_G.AzeriteEmpoweredItemUI)
	else
		AzeritePowerWeights.guiContainer.frame:SetParent(_G.UIParent)
	end

	if AzeritePowerWeights.guiContainer:IsShown() then
		AzeritePowerWeights.guiContainer:Hide()
	else
		AzeritePowerWeights.guiContainer:Show()
	end
end

-- Hook and Init functions
local function _isInteger(number)
	return number == floor(number)
end

local function _getDecimals(number)
	local num, decimals = strsplit(".", tostring(number))
	return decimals and strlen(decimals) or 0
end

local function _activeSpec() -- Get current active spec for scoreData population etc.
	local currentSpec = GetSpecialization()
	if currentSpec then
		local specID = GetSpecializationInfo(currentSpec)
		if specID then
			playerSpecID = specID
		end
	end
end

local function _populateWeights() -- Populate scoreData with active spec's scale
	if not playerSpecID then return end -- No playerSpecID yet, return
	local scaleKey = cfg.specScales[playerSpecID].scaleID
	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)
	if groupSet and classID and specNum and scaleName then
		classID = tonumber(classID)
		specNum = tonumber(specNum)
		for _, dataSet in ipairs(groupSet == "C" and customScales or AzeritePowerWeights.defaultScalesData) do
			if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
				wipe(scoreData)
				for k, v in pairs(dataSet[4]) do
					scoreData[k] = v
				end
				if AzeritePowerWeights.guiContainer then
					AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], scaleName))
				end

				Debug("Populated scoreData", groupSet, classID, specNum, scaleName)
				return
			end
		end
		Debug("Couldn't populate scoreData", 2, groupSet, classID, specNum, scaleName)
	else
		Debug("Couldn't populate scoreData", 1, groupSet, classID, specNum, scaleName)
	end
end

function f:HookAzeriteUI() -- Set Parents and Anchors
	if not playerSpecID then return end -- No playerSpecID yet, return
	Debug("HOOK UI")
	self:InitUI()

	AzeritePowerWeights.frame:SetParent(_G.AzeriteEmpoweredItemUI)
	AzeritePowerWeights.frame:Show()
	--[[
	-- Tooltip
	AzeritePowerWeights.frame:SetAllPoints(AzeritePowerWeights.string)
	]]

	--if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
		--AzeritePowerWeights.string:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, 50)
	--else -- ElvUI etc. who hides Portrait
		AzeritePowerWeights.string:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, 10)
	--end

	AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame) -- Fix enableButton hiding behind AzeriteEmpoweredItemUI elements with ElvUI if the AzeriteUI skinning is disabled.
	AzeritePowerWeights.enableButton.frame:Show()

	_G.AzeriteEmpoweredItemUI:HookScript("OnHide", function() -- Hide strings on frame hide
		Debug("== HIDING ==", #activeStrings)
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if AzeritePowerWeights.guiContainer then
			AzeritePowerWeights.guiContainer:Hide()
		end
		Debug("== HIDDEN ==", #activeStrings)
	end)
end

--[[
-- Tooltip
local baseScore = ""
]]
local initDone
function f:InitUI() -- Build UI and set up some initial data
	if initDone then return end
	initDone = true

	Debug("INIT UI")

	local frame = CreateFrame("Frame")
	--[[
	-- Tooltip
	frame:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
		GameTooltip:SetText(format("%s\n%s", HIGHLIGHT_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))
	end)
	frame:SetScript("OnLeave", GameTooltip_Hide)
	]]
	frame:Hide()

	local string = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	string:SetJustifyH("LEFT")
	string:SetJustifyV("TOP")
	string:SetText("")

	AzeritePowerWeights.frame = frame
	AzeritePowerWeights.string = string

	-- Enable Button
	local enableButton = AceGUI:Create("Button")
	enableButton:SetPoint("BOTTOMRIGHT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", -8, 8)
	enableButton:SetText(U["Weights"])
	enableButton:SetAutoWidth(true)
	enableButton:SetCallback("OnClick", _toggleEditorUI)
	AzeritePowerWeights.enableButton = enableButton

	-- Editor GUI
	AzeritePowerWeights.guiContainer = AzeritePowerWeights.CreateUI()
	AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
	AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)

	-- TreeGroup Hacks for QoL
	AzeritePowerWeights.treeGroup:SetCallback("OnGroupSelected", _SelectGroup)
	AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
	local statusTable = {}
	for i = 1, #AzeritePowerWeights.treeGroup.tree do
		statusTable[#statusTable + 1] = true
	end
	AzeritePowerWeights.treeGroup:SetStatusTable({
		groups = statusTable,
		treesizable = false,
		selected = ("%d\001%s"):format(1, "AzeritePowerWeightsImport")
	}) -- Expand groups

	-- Content Area
	AzeritePowerWeights:CreateImportGroup(AzeritePowerWeights.scalesScroll)

	-- Check if we have spec
	if not (playerSpecID and cfg and cfg.specScales[playerSpecID] and cfg.specScales[playerSpecID].scaleID) then
		Debug("No playerSpecID detected", playerSpecID, cfg.specScales[playerSpecID] and cfg.specScales[playerSpecID].scaleID or "!No specScales", GetRealmName(), UnitName("player"), GetSpecializationInfo(GetSpecialization()))
		_activeSpec()
	end
	-- Populate scoreData
	_populateWeights()
end

function f:UpdateValues() -- Update scores
	lock = nil
	if not _G.AzeriteEmpoweredItemUI or not _G.AzeriteEmpoweredItemUI:IsShown() then return end
	Debug("UPDATE VALUES")

	local currentScore, currentPotential, maxScore, currentLevel, maxLevel = 0, 0, 0, 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	-- Update score strings and calculate current score
	while #activeStrings > 0 do
		local s = tremove(activeStrings)
		ReleaseString(s)
	end

	local container = _G.AzeriteEmpoweredItemUI.ClipFrame.PowerContainerFrame
	local children = { container:GetChildren() }
	for _, frame in ipairs(children) do
		if frame and frame:IsShown() then
			--Debug(">" frame.azeritePowerID, frame.spellID, frame.unlockLevel)
			--Debug(">>", frame.isSelected)

			local score = 0
			local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(frame.azeritePowerID)
			if powerInfo then
				score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
			end

			if frame.isSelected == true then
				currentScore = currentScore + score
			end

			if not C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(frame.azeritePowerID, playerSpecID) then -- Recolor unusable powers
				score = RED_FONT_COLOR_CODE .. score .. FONT_COLOR_CODE_CLOSE
			end
			local s = AcquireString(frame, score)
			activeStrings[#activeStrings + 1] = s
		end
	end

	-- Calculate maxScore for the item
	local allTierInfo = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetAllTierInfo()
	if not allTierInfo then
		local itemID = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetItemID()
		if not itemID then return end
		allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemID)
	end

	--[[
		Dump: value=C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(158041)
		[1]={
			[1]={
				azeritePowerIDs={
					[1]=195,
					[2]=186,
					[3]=385,
					[4]=184
				},
				unlockLevel=10
			},
			[2]={
				azeritePowerIDs={
					[1]=218,
					[2]=83
				},
				unlockLevel=15
			},
			[3]={
				azeritePowerIDs={
					[1]=13
				},
				unlockLevel=20
			}
		}
	]]

	for tierIndex, tierInfo in ipairs(allTierInfo) do
		local maximum, tierMaximum = 0, 0
		for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
			local score = 0
			local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
			if powerInfo then
				score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
			end

			if maximum < score then
				maximum = score
			end
			if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
				tierMaximum = score
			end
		end

		--Debug(tierIndex, maximum)
		maxScore = maxScore + maximum
		currentPotential = currentPotential + tierMaximum
		if maxLevel < tierInfo.unlockLevel then
			maxLevel = tierInfo.unlockLevel
		end
	end

	local effectiveILvl = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetCurrentItemLevel()
	if cfg.addILvlToScore and effectiveILvl then
		if cfg.scaleByAzeriteEmpowered then
			local azeriteEmpoweredWeight = scoreData and scoreData[13] or 0
			effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
		end

		currentScore = currentScore + effectiveILvl
		currentPotential = currentPotential + effectiveILvl
		maxScore = maxScore + effectiveILvl
	end

	-- Integer or Float?
	local cS, cP, mS
	if _isInteger(currentScore) and _isInteger(currentPotential) and _isInteger(maxScore) then
		cS, cP, mS = currentScore, currentPotential, maxScore
	else
		local decimals = max(_getDecimals(currentScore), _getDecimals(currentPotential), _getDecimals(maxScore))
		cS = (currentScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentScore)
		cP = (currentPotential == 0 and "%d" or ("%%.%df"):format(decimals)):format(currentPotential)
		mS = (maxScore == 0 and "%d" or ("%%.%df"):format(decimals)):format(maxScore)
	end

	local baseScore = format(U["PowersScoreString"], cS, cP, mS, currentLevel, maxLevel)

	AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))

	--Debug("Score:", currentScore, maxScore, currentLevel, #activeStrings, itemID)
end

-- Item Tooltip & Hook - Hacked together and probably could be done better
local azeriteEmpoweredItemLocation = ItemLocation:CreateEmpty()
local itemEquipLocToSlot = {
	["INVTYPE_HEAD"] = 1,
	["INVTYPE_SHOULDER"] = 3,
	["INVTYPE_CHEST"] = 5,
	["INVTYPE_ROBE"] = 5
}

local function _getGearScore(dataPointer, itemEquipLoc)
	local currentLevel, maxLevel = 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	local itemLink = GetInventoryItemLink("player", itemEquipLoc)
	
	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local equipLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLoc)
		local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)

		local currentScore, currentPotential, maxScore = 0, 0, 0
		for tierIndex, tierInfo in ipairs(allTierInfo) do
			local maximum, tierMaximum = 0, 0
			for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
				if powerInfo then
					score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

					if equipLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(equipLocation, powerInfo.azeritePowerID) then
						currentScore = currentScore + score
					end
				end
				
				if maximum < score then
					maximum = score
				end
				if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
					tierMaximum = score
				end
			end

			maxScore = maxScore + maximum
			currentPotential = currentPotential + tierMaximum
			if maxLevel < tierInfo.unlockLevel then
				maxLevel = tierInfo.unlockLevel
			end
		end

		return currentScore, currentPotential, maxScore
	end

	return 0, 0, 0
end

local function _updateTooltip(tooltip, itemLink)
	local currentLevel, maxLevel = 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)

	local currentScore, currentPotential, maxScore, scaleInfo = {}, {}, {}, {}
	for i, tooltipScale in ipairs(cfg.tooltipScales) do
		currentScore[i] = 0
		currentPotential[i] = 0
		maxScore[i] = 0
		scaleInfo[i] = {}

		local dataPointer
		local groupSet, classID, specNum, scaleName = strsplit("/", tooltipScale.scaleID)
		if groupSet and classID and specNum and scaleName then
			classID = tonumber(classID)
			specNum = tonumber(specNum)
			for _, dataSet in ipairs(groupSet == "C" and customScales or AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					dataPointer = dataSet[4]

					scaleInfo[i].class = classID
					if groupSet == "C" then
						local _, specName, _, iconID = GetSpecializationInfoByID(specNum)
						scaleInfo[i].icon = iconID
					else
						local _, specName, _, iconID = GetSpecializationInfoForClassID(classID, specNum)
						scaleInfo[i].icon = iconID
					end

					break
				end
			end
		end

		if dataPointer then
			for tierIndex, tierInfo in ipairs(allTierInfo) do
				local maximum, tierMaximum = 0, 0
				for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
					local score = 0
					local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
					if powerInfo then
						score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

						if azeriteEmpoweredItemLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(azeriteEmpoweredItemLocation, powerInfo.azeritePowerID) then
							currentScore[i] = currentScore[i] + score
							--Debug("+++", powerInfo.azeritePowerID, GetSpellInfo(powerInfo.spellID), score)
						else
							--Debug("---", powerInfo.azeritePowerID, GetSpellInfo(powerInfo.spellID), score)
						end
					end
					
					if maximum < score then
						maximum = score
					end
					if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
						tierMaximum = score
					end
				end

				--Debug(tierIndex, maximum)
				maxScore[i] = maxScore[i] + maximum
				currentPotential[i] = currentPotential[i] + tierMaximum
				if maxLevel < tierInfo.unlockLevel then
					maxLevel = tierInfo.unlockLevel
				end
			end
		end

		local effectiveILvl = GetDetailedItemLevelInfo(itemLink)
		if cfg.addILvlToScore and effectiveILvl then
			if cfg.scaleByAzeriteEmpowered then
				local azeriteEmpoweredWeight = dataPointer and dataPointer[13] or 0
				effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
			end

			currentScore[i] = currentScore[i] + effectiveILvl
			currentPotential[i] = currentPotential[i] + effectiveILvl
			maxScore[i] = maxScore[i] + effectiveILvl
		end

		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		if cfg.relativeScore and dataPointer then
			local equippedScore, equippedPotential, equippedMax = _getGearScore(dataPointer, itemEquipLocToSlot[itemEquipLoc])

			if cfg.addILvlToScore and effectiveILvl then
				equippedScore = equippedScore + effectiveILvl
				equippedPotential = equippedPotential + effectiveILvl
				equippedMax = equippedMax + effectiveILvl
			end

			currentScore[i] = equippedScore == 0 and 0 or floor((currentScore[i] / equippedScore - 1) * 100 + .5)
			currentPotential[i] = equippedPotential == 0 and 0 or floor((currentPotential[i] / equippedPotential - 1) * 100 + .5)
			maxScore[i] = equippedMax == 0 and 0 or floor((maxScore[i] / equippedMax - 1) * 100 + .5)
		end
	end

	--tooltip:AddLine(" \n"..ADDON_NAME)
	local tooltipLine = ""
	local showTooltipLine = false

	for i = 1, #maxScore do
		if scaleInfo[i].class then
			local _, classTag = GetClassInfo(scaleInfo[i].class)
			local c = _G.RAID_CLASS_COLORS[classTag]

			local string = "|T%d:0|t |c%s%s|r: "
			if cfg.relativeScore then -- Relative score
				string = string .. ("%s%%d%s%s"):format(currentScore[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
				string = string .. " / "
				string = string .. ("%s%%d%s%s"):format(currentPotential[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
				string = string .. " / "
				string = string .. ("%s%%d%s%s"):format(maxScore[i] < 0 and RED_FONT_COLOR_CODE or GREEN_FONT_COLOR_CODE .. "+", "%%", FONT_COLOR_CODE_CLOSE)
			elseif _isInteger(currentScore[i]) and _isInteger(currentPotential[i]) and _isInteger(maxScore[i]) then -- All integers
				string = string .. "%d / %d / %d"
			else -- There are some floats
				local decimals = max(_getDecimals(currentScore[i]), _getDecimals(currentPotential[i]), _getDecimals(maxScore[i]))
				--Debug("Decimals:", decimals)
				--string = string .. ("%%.%df / %%.%df / %%.%df"):format(decimals, decimals, decimals)
				string = string .. (currentScore[i] == 0 and "%d" or ("%%.%df"):format(decimals))
				string = string .. " / "
				string = string .. (currentPotential[i] == 0 and "%d" or ("%%.%df"):format(decimals))
				string = string .. " / "
				string = string .. (maxScore[i] == 0 and "%d" or ("%%.%df"):format(decimals))
			end

			if not cfg.showOnlyUpgrades or cfg.showOnlyUpgrades and (currentScore[i] > 0 or currentPotential[i] > 0 or maxScore[i] > 0) then
				--tooltip:AddLine(format(string, scaleInfo[i].icon, c.colorStr, cfg.tooltipScales[i].scaleName, currentScore[i], currentPotential[i], maxScore[i]),  1, 1, 1)
				tooltipLine = tooltipLine .. format(string, scaleInfo[i].icon, c.colorStr, cfg.tooltipScales[i].scaleName, currentScore[i], currentPotential[i], maxScore[i]) .. "\n"
				showTooltipLine = true
			end
		end
	end

	--tooltip:AddLine(format(U["ItemToolTip_AzeriteLevel"], currentLevel, maxLevel))
	tooltipLine = tooltipLine .. format(U["ItemToolTip_AzeriteLevel"], currentLevel, maxLevel)
	if showTooltipLine then
		tooltip:AddLine(tooltipLine)
	end
	tooltip:Show() -- Make updates visible
end

-- Item from bags
hooksecurefunc(GameTooltip, "SetBagItem", function(self, ...) -- This can be called 4-5 times per second
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local bag, slot = ...
	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot)

		_updateTooltip(self, itemLink)
	end
end)

-- Equipped item
hooksecurefunc(GameTooltip, "SetInventoryItem", function(self, ...) -- This can be called 4-5 times per second
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local unit, equipLoc = ... -- player 1 nil true
	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(equipLoc)

		_updateTooltip(self, itemLink)
	end
end)

-- Any other item, EJ etc.
hooksecurefunc(GameTooltip, "SetHyperlink", function(self, ...)
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		_updateTooltip(self, itemLink)
	end
end)

-- Vendor item (https://wow.gamepedia.com/Widget_API)
hooksecurefunc(GameTooltip, "SetMerchantItem", function(self, ...) -- ... = merchantSlot
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot)

		_updateTooltip(self, itemLink)
	end
end)

-- Comparison tooltip for Vendor items (https://www.townlong-yak.com/framexml/27602/GameTooltip.lua#490)
hooksecurefunc(GameTooltip.shoppingTooltips[1], "SetCompareItem", function(self, ...) -- ... = ShoppingTooltip2, GameTooltip
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLocToSlot[itemEquipLoc])

		_updateTooltip(self, itemLink)
	end
end)

-- Comparison tooltip for WQ items (https://github.com/phanx-wow/PhanxBorder/blob/master/Blizzard.lua#L205)
hooksecurefunc(WorldMapCompareTooltip1, "SetCompareItem", function(self, ...) -- ... = WorldMapCompareTooltip2, WorldMapTooltipTooltip
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		azeriteEmpoweredItemLocation = ItemLocation:CreateFromEquipmentSlot(itemEquipLocToSlot[itemEquipLoc])

		_updateTooltip(self, itemLink)
	end
end)

-- World Quest rewards (https://www.townlong-yak.com/framexml/27547/GameTooltip.lua#925)
hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward", function(self, questLogIndex, questID)
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local iName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo(questLogIndex, questID)
	if not itemID or type(itemID) ~= "number" then return end
	local itemName, itemLink = GetItemInfo(itemID)
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		_updateTooltip(self.Tooltip, itemLink)
	end
end)

GameTooltip:HookScript("OnHide", function()
	azeriteEmpoweredItemLocation:Clear()
end)

-- Quest rewards (https://www.townlong-yak.com/framexml/27602/QuestInfo.lua#964)
hooksecurefunc(GameTooltip, "SetQuestItem", function(self, ...) -- ... = type, ID
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		_updateTooltip(self, itemLink)
	end
end)


-- Event functions
function f:ADDON_LOADED(event, addon)
	if addon == "_ShiGuang" then
		AzeritePowerWeightsDB = initDB(AzeritePowerWeightsDB, dbDefaults)
		db = AzeritePowerWeightsDB

		local playerName = UnitName("player")
		local playerRealm = GetRealmName()

		if db.dbVersion == 1 then -- Changing default-setting for all users because the old system wasn't clear enough for some users.
			for rName, rData in pairs(db.char) do
				for pName, pData in pairs(rData) do
					db.char[rName][pName].rolePowersNoOffRolePowers = false
				end
			end
			db.dbVersion = 2
		end

		db.char[playerRealm] = db.char[playerRealm] or {}
		db.char[playerRealm][playerName] = initDB(db.char[playerRealm][playerName], charDefaults)

		customScales = db.customScales
		cfg = db.char[playerRealm][playerName]

		self:RegisterEvent("PLAYER_LOGIN")
		self:RegisterEvent("AZERITE_ITEM_POWER_LEVEL_CHANGED")
		self:RegisterEvent("AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED")
		self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
		self:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")

		playerClassID = select(3, UnitClass("player"))
		for i = 1, GetNumSpecializationsForClassID(playerClassID) do
			local specID = GetSpecializationInfoForClassID(playerClassID, i)
			if not cfg.specScales[specID] then
				local scaleKey = AzeritePowerWeights.GetDefaultScaleSet(playerClassID, i)
				local _, _, _, defaultScaleName = strsplit("/", scaleKey)

				cfg.specScales[specID] = {
					scaleID = scaleKey,
					scaleName = defaultScaleName
				}
			end
		end

		--self:CreateOptions()

	elseif addon == "Blizzard_AzeriteUI" then
		-- Hook 'em & Cook 'em
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "UpdateTiers", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEmpoweredItemUI, "Refresh", delayedUpdate)
		hooksecurefunc(_G.AzeriteEmpoweredItemUI, "OnItemSet", delayedUpdate)
		C_Timer.After(0, function() -- Fire on next frame instead of current frame
			delayedUpdate()
			_G.AzeriteEmpoweredItemUI:HookScript("OnShow", delayedUpdate)
		end)
		self:HookAzeriteUI()
	end
end

function f:PLAYER_LOGIN(event)
	_activeSpec()

	if _G.AzeriteEmpoweredItemUI then
		self:HookAzeriteUI()
	end
end

function f:AZERITE_ITEM_POWER_LEVEL_CHANGED(event)
	Debug(event)

	delayedUpdate()
end

function f:AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED(event)
	Debug(event)

	delayedUpdate()
end

function f:PLAYER_EQUIPMENT_CHANGED(event, equipmentSlot, hasCurrent)
	if not azeriteSlots[equipmentSlot] then return end
	Debug(event, equipmentSlot, hasCurrent)

	delayedUpdate()
end

function f:PLAYER_SPECIALIZATION_CHANGED(event, ...)
	--Debug(event, tostringall(...)) -- ... = unit == player always

	_activeSpec()

	if _G.AzeriteEmpoweredItemUI then
		_populateWeights()
	end

	delayedUpdate()
end

-- Config
function f:RefreshConfig()
	delayedUpdate()
	if AzeritePowerWeights.treeGroup and AzeritePowerWeights.treeGroup.tree then
		AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
		AzeritePowerWeights.treeGroup:RefreshTree(true)

		local lastExists;
		for _, v in ipairs(AzeritePowerWeights.treeGroup.tree) do
			if v.value == lastOpenScale then
				lastExists = true
			end
		end

		AzeritePowerWeights.treeGroup:SelectByValue(lastExists and lastOpenScale or "AzeritePowerWeightsImport")
	end
end

-- Slash
SLASH_AZERITEPOWERWEIGHTS1 = "/azerite"
if U["Slash_Command"] and U["Slash_Command"] ~= "/azerite" then
	SLASH_AZERITEPOWERWEIGHTS2 = U["Slash_Command"]
end

local SlashHandlers = {
	["debug"] = function() -- Debug stuff
		cfg.debug = not cfg.debug
		Print("Debug:", cfg.debug)
	end,
	["reset"] = function()
		wipe(AzeritePowerWeightsDB)

		f:ADDON_LOADED("ADDON_LOADED", "AzeritePowerWeights")
		if AzeritePowerWeights.treeGroup and AzeritePowerWeights.treeGroup.tree then
			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("AzeritePowerWeightsImport")
			AzeritePowerWeights.treeGroup:RefreshTree(true)
		end
		--ReloadUI()
	end,
	["scale"] = function()
		Print(">", cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"])
	end,
	["bang"] = function(...)
		local number = tonumber(...)
		Print("Bang:", number)
	end,
}

local shouldKnowAboutConfig
local _scanPowers -- Debug
SlashCmdList["AZERITEPOWERWEIGHTS"] = function(text)
	local command, params = strsplit(" ", text, 2)

	if SlashHandlers[command] then
		SlashHandlers[command](params)
	else
		if _scanPowers then
			_scanPowers()
		else
			if not shouldKnowAboutConfig then
				Print(U["Slash_RemindConfig"], "AzeritePowerWeights")
				shouldKnowAboutConfig = true
			end
			if not AzeritePowerWeights.guiContainer then
				if not _G.AzeriteEmpoweredItemUI then
					local loaded, reason = LoadAddOn("Blizzard_AzeriteUI")
					if loaded then
						_toggleEditorUI()
					else
						Print(U["Slash_Error_Unkown"])
						Debug(reason)
					end
				end
			else
				_toggleEditorUI()
			end
		end
	end
end

--#EOF
