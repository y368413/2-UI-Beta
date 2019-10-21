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
					["spellID"] = 287377,
					["icon"] = 254108,
					["name"] = "Bastion of Might",
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
					["spellID"] = 288452,
					["icon"] = 236317,
					["name"] = "Striking the Anvil",
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
					["spellID"] = 288056,
					["icon"] = 132344,
					["name"] = "Unbridled Ferocity",
					["azeritePowerID"] = 119,
				}, -- [1]
				{
					["spellID"] = 273409,
					["icon"] = 236303,
					["name"] = "Gathering Storm",
					["azeritePowerID"] = 174,
				}, -- [2]
				{
					["spellID"] = 288080,
					["icon"] = 236276,
					["name"] = "Cold Steel, Hot Blood",
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
					["spellID"] = 286229,
					["icon"] = 135878,
					["name"] = "Light's Decree",
					["azeritePowerID"] = 396,
				}, -- [6]
				{
					["spellID"] = 286390,
					["icon"] = 236263,
					["name"] = "Empyrean Power",
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
					["spellID"] = 287268,
					["icon"] = 1360764,
					["name"] = "Glimmer of Light",
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
					["spellID"] = 277674,
					["icon"] = 135972,
					["name"] = "Radiant Incandescence",
					["azeritePowerID"] = 452,
				}, -- [9]
				{
					["spellID"] = 277675,
					["icon"] = 1603010,
					["name"] = "Judicious Defense",
					["azeritePowerID"] = 454,
				}, -- [10]
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
					["spellID"] = 287126,
					["icon"] = 135981,
					["name"] = "Righteous Conviction",
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
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
					["azeritePowerID"] = 365,
				}, -- [5]
				{
					["spellID"] = 277653,
					["icon"] = 2065565,
					["name"] = "Blur of Talons",
					["azeritePowerID"] = 371,
				}, -- [6]
				{
					["spellID"] = 278532,
					["icon"] = 132214,
					["name"] = "Wilderness Survival",
					["azeritePowerID"] = 372,
				}, -- [7]
				{
					["spellID"] = 288570,
					["icon"] = 132210,
					["name"] = "Primeval Intuition",
					["azeritePowerID"] = 373,
				}, -- [8]
			},
			[254] = {
				{
					["spellID"] = 264198,
					["icon"] = 461115,
					["name"] = "In The Rhythm",
					["azeritePowerID"] = 36,
				}, -- [1]
				{
					["spellID"] = 287707,
					["icon"] = 132212,
					["name"] = "Surging Shots",
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
					["spellID"] = 287093,
					["icon"] = 236186,
					["name"] = "Dire Consequences",
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
					["spellID"] = 288979,
					["icon"] = 132350,
					["name"] = "Keep Your Wits About You",
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
					["spellID"] = 286121,
					["icon"] = 237532,
					["name"] = "Replicating Shadows",
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
					["icon"] = 236279,
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
					["spellID"] = 273007,
					["icon"] = 132304,
					["name"] = "Double Dose",
					["azeritePowerID"] = 136,
				}, -- [1]
				{
					["spellID"] = 273488,
					["icon"] = 132287,
					["name"] = "Twist the Knife",
					["azeritePowerID"] = 181,
				}, -- [2]
				{
					["spellID"] = 286573,
					["icon"] = 458726,
					["name"] = "Nothing Personal",
					["azeritePowerID"] = 249,
				}, -- [3]
				{
					["spellID"] = 277679,
					["icon"] = 132302,
					["name"] = "Scent of Blood",
					["azeritePowerID"] = 406,
				}, -- [4]
				{
					["spellID"] = 287649,
					["icon"] = 236273,
					["name"] = "Echoing Blades",
					["azeritePowerID"] = 407,
				}, -- [5]
				{
					["spellID"] = 278666,
					["icon"] = 132297,
					["name"] = "Shrouded Suffocation",
					["azeritePowerID"] = 408,
				}, -- [6]
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
					["spellID"] = 287336,
					["icon"] = 135937,
					["name"] = "Promise of Deliverance",
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
					["spellID"] = 288340,
					["icon"] = 135978,
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
					["spellID"] = 287355,
					["icon"] = 135922,
					["name"] = "Sudden Revelation",
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
					["spellID"] = 288417,
					["icon"] = 348276,
					["name"] = "Magus of the Dead",
					["azeritePowerID"] = 109,
				}, -- [1]
				{
					["spellID"] = 273088,
					["icon"] = 136144,
					["name"] = "Bone Spike Graveyard",
					["azeritePowerID"] = 140,
				}, -- [2]
				{
					["spellID"] = 286832,
					["icon"] = 342913,
					["name"] = "Helchains",
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
					["spellID"] = 287283,
					["icon"] = 1580450,
					["name"] = "Frostwhelp's Indignation",
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
					["spellID"] = 289339,
					["icon"] = 135338,
					["name"] = "Bloody Runeblade",
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
					["spellID"] = 278719,
					["icon"] = 132314,
					["name"] = "Roiling Storm",
					["azeritePowerID"] = 420,
				}, -- [6]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [7]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [8]
				{
					["spellID"] = 287768,
					["icon"] = 136046,
					["name"] = "Thunderaan's Fury",
					["azeritePowerID"] = 530,
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
					["spellID"] = 287300,
					["icon"] = 237590,
					["name"] = "Turn of the Tide",
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
					["spellID"] = 278713,
					["icon"] = 252995,
					["name"] = "Surging Tides",
					["azeritePowerID"] = 422,
				}, -- [9]
				{
					["spellID"] = 278715,
					["icon"] = 237586,
					["name"] = "Spouting Spirits",
					["azeritePowerID"] = 423,
				}, -- [10]
				{
					["spellID"] = 277666,
					["icon"] = 451167,
					["name"] = "Ancestral Resonance",
					["azeritePowerID"] = 447,
				}, -- [11]
				{
					["spellID"] = 277671,
					["icon"] = 136048,
					["name"] = "Synapse Shock",
					["azeritePowerID"] = 448,
				}, -- [12]
				{
					["spellID"] = 277658,
					["icon"] = 136037,
					["name"] = "Overflowing Shores",
					["azeritePowerID"] = 449,
				}, -- [13]
				{
					["spellID"] = 279829,
					["icon"] = 451169,
					["name"] = "Igneous Potential",
					["azeritePowerID"] = 457,
				}, -- [14]
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
					["spellID"] = 286949,
					["icon"] = 136025,
					["name"] = "Tectonic Thunder",
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
					["spellID"] = 288164,
					["icon"] = 236209,
					["name"] = "Flash Freeze",
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
					["spellID"] = 288755,
					["icon"] = 460698,
					["name"] = "Wildfire",
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
					["spellID"] = 286027,
					["icon"] = 135732,
					["name"] = "Equipoise",
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
					["spellID"] = 287059,
					["icon"] = 237561,
					["name"] = "Baleful Invocation",
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
					["spellID"] = 287637,
					["icon"] = 134075,
					["name"] = "Chaos Shards",
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
					["icon"] = 537517,
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
					["spellID"] = 289364,
					["icon"] = 136230,
					["name"] = "Pandemic Invocation",
					["azeritePowerID"] = 442,
				}, -- [6]
			},
		}, -- [9]
		{
			[269] = {
				{
					["spellID"] = 287055,
					["icon"] = 606548,
					["name"] = "Fury of Xuen",
					["azeritePowerID"] = 117,
				}, -- [1]
				{
					["spellID"] = 273291,
					["icon"] = 642415,
					["name"] = "Sunrise Technique",
					["azeritePowerID"] = 184,
				}, -- [2]
				{
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
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
					["spellID"] = 286585,
					["icon"] = 607849,
					["name"] = "Dance of Chi-Ji",
					["azeritePowerID"] = 391,
				}, -- [6]
			},
			[270] = {
				{
					["spellID"] = 287829,
					["icon"] = 611418,
					["name"] = "Secret Infusion",
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
					["spellID"] = 288634,
					["icon"] = 1381297,
					["name"] = "Glory of the Dawn",
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
					["spellID"] = 285958,
					["icon"] = 1360979,
					["name"] = "Straight, No Chaser",
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
					["name"] = "Untamed Ferocity",
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
					["name"] = "Jungle Fury",
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
					["spellID"] = 289314,
					["icon"] = 571585,
					["name"] = "Burst of Savagery",
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
					["spellID"] = 287251,
					["icon"] = 236153,
					["name"] = "Early Harvest",
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
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278515,
					["icon"] = 136085,
					["name"] = "Rampant Growth",
					["azeritePowerID"] = 362,
				}, -- [7]
				{
					["spellID"] = 278513,
					["icon"] = 134157,
					["name"] = "Waking Dream",
					["azeritePowerID"] = 363,
				}, -- [8]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [9]
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
					["spellID"] = 287773,
					["icon"] = 135730,
					["name"] = "Arcanic Pulsar",
					["azeritePowerID"] = 200,
				}, -- [4]
				{
					["spellID"] = 276152,
					["icon"] = 135753,
					["name"] = "Dawning Sun",
					["azeritePowerID"] = 250,
				}, -- [5]
				{
					["spellID"] = 278505,
					["icon"] = 236216,
					["name"] = "High Noon",
					["azeritePowerID"] = 356,
				}, -- [6]
				{
					["spellID"] = 278507,
					["icon"] = 236168,
					["name"] = "Lunar Shrapnel",
					["azeritePowerID"] = 357,
				}, -- [7]
				{
					["spellID"] = 279642,
					["icon"] = 136048,
					["name"] = "Lively Spirit",
					["azeritePowerID"] = 364,
				}, -- [8]
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
					["spellID"] = 288754,
					["icon"] = 1305157,
					["name"] = "Chaotic Transformation",
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
					["spellID"] = 288878,
					["icon"] = 615099,
					["name"] = "Hour of Reaping",
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
			{
				["spellID"] = 288641,
				["icon"] = 132126,
				["name"] = "Intimidating Presence",
				["azeritePowerID"] = 554,
			}, -- [3]
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
			{
				["spellID"] = 287729,
				["icon"] = 135928,
				["name"] = "Empyreal Ward",
				["azeritePowerID"] = 538,
			}, -- [3]
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
			{
				["spellID"] = 287938,
				["icon"] = 1014024,
				["name"] = "Nature's Salve",
				["azeritePowerID"] = 543,
			}, -- [3]
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
			{
				["spellID"] = 288079,
				["icon"] = 132301,
				["name"] = "Lying In Wait",
				["azeritePowerID"] = 548,
			}, -- [3]
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
			{
				["spellID"] = 287717,
				["icon"] = 463835,
				["name"] = "Death Denied",
				["azeritePowerID"] = 537,
			}, -- [3]
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
			{
				["spellID"] = 288424,
				["icon"] = 237525,
				["name"] = "Cold Hearted",
				["azeritePowerID"] = 549,
			}, -- [3]
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
			{
				["spellID"] = 287774,
				["icon"] = 133439,
				["name"] = "Ancient Ankh Talisman",
				["azeritePowerID"] = 539,
			}, -- [3]
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
			{
				["spellID"] = 288121,
				["icon"] = 135754,
				["name"] = "Quick Thinking",
				["azeritePowerID"] = 546,
			}, -- [3]
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
			{
				["spellID"] = 287822,
				["icon"] = 136183,
				["name"] = "Terror of the Mind",
				["azeritePowerID"] = 531,
			}, -- [3]
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
			{
				["spellID"] = 289322,
				["icon"] = 574574,
				["name"] = "Exit Strategy",
				["azeritePowerID"] = 566,
			}, -- [3]
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
			{
				["spellID"] = 287803,
				["icon"] = 135879,
				["name"] = "Switch Hitter",
				["azeritePowerID"] = 540,
			}, -- [3]
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
			{
				["spellID"] = 288973,
				["icon"] = 1392554,
				["name"] = "Thrive in Chaos",
				["azeritePowerID"] = 564,
			}, -- [3]
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
		}
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
		{
			["spellID"] = 288802,
			["icon"] = 895888,
			["name"] = "Bonded Souls",
			["azeritePowerID"] = 560,
		}, -- [3]
		{
			["spellID"] = 288749,
			["icon"] = 2442247,
			["name"] = "Seductive Power",
			["azeritePowerID"] = 561,
		}, -- [4]
		{
			["spellID"] = 288953,
			["icon"] = 1778226,
			["name"] = "Treacherous Covenant",
			["azeritePowerID"] = 562,
		}, -- [5]
		{
			["spellID"] = 303008,
			["icon"] = 1698701,
			["name"] = "Undulating Tides",
			["azeritePowerID"] = 575,
		}, -- [6]
		{
			["spellID"] = 303007,
			["icon"] = 136159,
			["name"] = "Loyal to the End",
			["azeritePowerID"] = 576,
		}, -- [7]
		{
			["spellID"] = 303006,
			["icon"] = 1391778,
			["name"] = "Arcane Heart",
			["azeritePowerID"] = 577,
		}, -- [8]
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
		{
			["spellID"] = 287467,
			["icon"] = 135900,
			["name"] = "Shadow of Elune",
			["azeritePowerID"] = 521,
		}, -- [16]
		{
			["spellID"] = 287604,
			["icon"] = 874580,
			["name"] = "Ancients' Bulwark",
			["azeritePowerID"] = 522,
		}, -- [17]
		{
			["spellID"] = 287631,
			["icon"] = 463547,
			["name"] = "Apothecary's Concoctions",
			["azeritePowerID"] = 523,
		}, -- [18]
		{
			["spellID"] = 287662,
			["icon"] = 2357388,
			["name"] = "Endless Hunger",
			["azeritePowerID"] = 526,
		}, -- [19]
		{
			["spellID"] = 300168,
			["icon"] = 2115322,
			["name"] = "Person-Computer Interface",
			["azeritePowerID"] = 568,
		}, -- [20]
		{
			["spellID"] = 300170,
			["icon"] = 134377,
			["name"] = "Clockwork Heart",
			["azeritePowerID"] = 569,
		}, -- [21]
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
		{
			["spellID"] = 287818,
			["icon"] = 236310,
			["name"] = "Fight or Flight",
			["azeritePowerID"] = 541,
		}, -- [13]
	}
}
AzeritePowerWeights.sourceData = sourceData
-- 8.2 Azerite Essences
local essenceData = {
	["common"] = {
		{
			["essenceID"] = 4,
			["name"] = "Worldvein Resonance",
			["icon"] = 1830317,
		}, -- [1]
		{
			["essenceID"] = 12,
			["name"] = "The Crucible of Flame",
			["icon"] = 3015740,
		}, -- [2]
		{
			["essenceID"] = 15,
			["name"] = "Ripple in Space",
			["icon"] = 2967109,
		}, -- [3]
		{
			["essenceID"] = 22,
			["name"] = "Vision of Perfection",
			["icon"] = 3015743,
		}, -- [4]
		{
			["essenceID"] = 27,
			["name"] = "Memory of Lucid Dreams",
			["icon"] = 2967104,
		}, -- [5]
		{
			["essenceID"] = 32,
			["name"] = "Conflict and Strife",
			["icon"] = 3015742,
		}, -- [6]
	},
	["tank"] = {
		{
			["essenceID"] = 2,
			["name"] = "Azeroth's Undying Gift",
			["icon"] = 2967107,
		}, -- [1]
		{
			["essenceID"] = 3,
			["name"] = "Sphere of Suppression",
			["icon"] = 2065602,
		}, -- [2]
		{
			["essenceID"] = 7,
			["name"] = "Anima of Life and Death",
			["icon"] = 2967105,
		}, -- [3]
		{
			["essenceID"] = 13,
			["name"] = "Nullification Dynamo",
			["icon"] = 3015741,
		}, -- [4]
		{
			["essenceID"] = 25,
			["name"] = "Aegis of the Deep",
			["icon"] = 2967110,
		}, -- [5]
	},
	["healer"] = {
		{
			["essenceID"] = 17,
			["name"] = "The Ever-Rising Tide",
			["icon"] = 2967108,
		}, -- [1]
		{
			["essenceID"] = 18,
			["name"] = "Artifice of Time",
			["icon"] = 2967112,
		}, -- [2]
		{
			["essenceID"] = 19,
			["name"] = "The Well of Existence",
			["icon"] = 516796,
		}, -- [3]
		{
			["essenceID"] = 20,
			["name"] = "Life-Binder's Invocation",
			["icon"] = 2967106,
		}, -- [4]
		{
			["essenceID"] = 21,
			["name"] = "Vitality Conduit",
			["icon"] = 2967100,
		}, -- [5]
	},
	["damager"] = {
		{
			["essenceID"] = 5,
			["name"] = "Essence of the Focusing Iris",
			["icon"] = 2967111,
		}, -- [1]
		{
			["essenceID"] = 6,
			["name"] = "Purification Protocol",
			["icon"] = 2967103,
		}, -- [2]
		{
			["essenceID"] = 14,
			["name"] = "Condensed Life-Force",
			["icon"] = 2967113,
		}, -- [3]
		{
			["essenceID"] = 23,
			["name"] = "Blood of the Enemy",
			["icon"] = 2032580,
		}, -- [4]
		{
			["essenceID"] = 28,
			["name"] = "The Unbound Force",
			["icon"] = 2967102,
		}, -- [5]
	}
}
AzeritePowerWeights.essenceData = essenceData

-- Default Scales Data
--[[
local defaultName = U["DefaultScaleName_Default"]
local defensiveName = U["DefaultScaleName_Defensive"]
local offensiveName = U["DefaultScaleName_Offensive"]
local defaultNameTable = {
	--[defaultName] = true,
	[defensiveName] = true,
	[offensiveName] = true
}
]]
local defaultName = "Default"
local defensiveName = "Defensive"
local offensiveName = "Offensive"
local defaultNameTable = {
	[defaultName] = U["DefaultScaleName_Default"],
	[defensiveName] = U["DefaultScaleName_Defensive"],
	[offensiveName] = U["DefaultScaleName_Offensive"]
}
AzeritePowerWeights.defaultNameTable = defaultNameTable
local defaultScalesData = {}
AzeritePowerWeights.defaultScalesData = defaultScalesData

local function insertDefaultScalesData(scaleName, classIndex, specNum, powerScales, essenceScales, timestamp)
	defaultScalesData[#defaultScalesData + 1] = {
		scaleName,
		classIndex,
		specNum,
		powerScales,
		essenceScales,
		timestamp
	}
end

do
		insertDefaultScalesData(defaultName, 12, 1, { -- Havoc Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3101 - 4329 (avg 3318), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[569] = 5.34, -- Clockwork Heart
			[220] = 4.68, -- Chaotic Transformation
			[479] = 6.36, -- Dagger in the Back
			[492] = 4.41, -- Liberator's Might
			[466] = 0.15, -- Burning Soul
			[497] = 1.33, -- Stand As One
			[459] = 2.45, -- Unstable Flames
			[157] = 6.37, -- Rezan's Fury
			[500] = 3.03, -- Synaptic Spark Capacitor
			[196] = 6.71, -- Swirling Sands
			[192] = 3.15, -- Meticulous Scheming
			[480] = 4.24, -- Blood Rite
			[38] = 1.94, -- On My Way
			[352] = 7.65, -- Thirsting Blades
			[31] = 2.99, -- Gutripper
			[126] = 5.9, -- Revolving Blades
			[482] = 4.96, -- Thunderous Blast
			[501] = 5.34, -- Relational Normalization Gizmo
			[483] = 5.2, -- Archive of the Titans
			[485] = 5.17, -- Laser Matrix
			[526] = 8.13, -- Endless Hunger
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[576] = 2.57, -- Loyal to the End
			[493] = 1.84, -- Last Gift
			[541] = 1.56, -- Fight or Flight
			[99] = 0.24, -- Ablative Shielding
			[462] = 1.56, -- Azerite Globules
			[521] = 4.09, -- Shadow of Elune
			[22] = 2.49, -- Heed My Call
			[159] = 9.9, -- Furious Gaze
			[481] = 3.54, -- Incite the Pack
			[505] = 4.11, -- Tradewinds
			[522] = 7.63, -- Ancients' Bulwark
			[194] = 5.26, -- Filthy Transfusion
			[18] = 1.41, -- Blood Siphon
			[498] = 4, -- Barrage Of Many Bombs
			[523] = 5.2, -- Apothecary's Concoctions
			[82] = 6.59, -- Champion of Azeroth
			[105] = 0.06, -- Ephemeral Recovery
			[83] = 0.13, -- Impassive Visage
			[20] = 1.34, -- Lifespeed
			[562] = 7.29, -- Treacherous Covenant
			[496] = 1.39, -- Stronger Together
			[14] = 0.01, -- Longstrider
			[245] = 5.39, -- Seething Power
			[494] = 6.44, -- Battlefield Precision
			[577] = 2.78, -- Arcane Heart
			[463] = 0.04, -- Blessed Portents
			[495] = 4.87, -- Anduin's Dedication
			[461] = 1.49, -- Earthlink
			[561] = 4.19, -- Seductive Power
			[195] = 4.62, -- Secrets of the Deep
			[156] = 3.47, -- Ruinous Bolt
			[353] = 6.99, -- Eyes of Rage
			[575] = 10, -- Undulating Tides
			[478] = 6.03, -- Tidal Surge
			[30] = 4.15, -- Overwhelming Power
			[560] = 2.2, -- Bonded Souls
			[21] = 1.97, -- Elemental Whirl
			[193] = 7.83, -- Blightborne Infusion
			[504] = 5.38, -- Unstable Catalyst
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3185 - 4282 (avg 3378), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 8.39, 3.73 }, -- The Crucible of Flame
			[15] = { 3.85, 0 }, -- Ripple in Space
			[6] = { 6.2, 3.16 }, -- Purification Protocol
			[22] = { 6.81, 1.38 }, -- Vision of Perfection
			[23] = { 6.5, 1.78 }, -- Blood of the Enemy
			[5] = { 8.6, 3.68 }, -- Essence of the Focusing Iris
			[14] = { 10, 3.54 }, -- Condensed Life-Force
			[28] = { 3.29, 1.9 }, -- The Unbound Force
			[4] = { 0.45, 1.15 }, -- Worldvein Resonance
			[27] = { 3.34, 2.12 }, -- Memory of Lucid Dreams
			[32] = { 0, 2.61 }, -- Conflict and Strife
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 12, 2, { -- Vengeance Demon Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1206 - 2189 (avg 1403), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[202] = 0.02, -- Soulmonger
			[492] = 2.8, -- Liberator's Might
			[98] = 0.02, -- Crystalline Carapace
			[18] = 1.19, -- Blood Siphon
			[505] = 3.3, -- Tradewinds
			[21] = 1.4, -- Elemental Whirl
			[499] = 2.43, -- Ricocheting Inflatable Pyrosaw
			[194] = 5.74, -- Filthy Transfusion
			[459] = 1.85, -- Unstable Flames
			[500] = 3.52, -- Synaptic Spark Capacitor
			[20] = 1.12, -- Lifespeed
			[84] = 0.07, -- Bulwark of the Masses
			[101] = 0.01, -- Shimmering Haven
			[157] = 6.26, -- Rezan's Fury
			[221] = 0.01, -- Rigid Carapace
			[31] = 3.11, -- Gutripper
			[99] = 0.03, -- Ablative Shielding
			[483] = 4.09, -- Archive of the Titans
			[541] = 1.4, -- Fight or Flight
			[523] = 5.18, -- Apothecary's Concoctions
			[193] = 5.11, -- Blightborne Infusion
			[42] = 0.11, -- Savior
			[196] = 4.61, -- Swirling Sands
			[480] = 2.54, -- Blood Rite
			[14] = 0.06, -- Longstrider
			[494] = 6.38, -- Battlefield Precision
			[482] = 5.5, -- Thunderous Blast
			[498] = 3.93, -- Barrage Of Many Bombs
			[504] = 4.06, -- Unstable Catalyst
			[461] = 1.28, -- Earthlink
			[246] = 0.16, -- Hour of Reaping
			[564] = 0.07, -- Thrive in Chaos
			[561] = 3.04, -- Seductive Power
			[105] = 0.03, -- Ephemeral Recovery
			[87] = 0.02, -- Self Reliance
			[462] = 1.8, -- Azerite Globules
			[479] = 4.67, -- Dagger in the Back
			[502] = 0.04, -- Personal Absorb-o-Tron
			[354] = 0.09, -- Cycle of Binding
			[577] = 0.6, -- Arcane Heart
			[38] = 1.29, -- On My Way
			[495] = 3.49, -- Anduin's Dedication
			[83] = 0.12, -- Impassive Visage
			[30] = 2.5, -- Overwhelming Power
			[493] = 1.83, -- Last Gift
			[481] = 3.06, -- Incite the Pack
			[192] = 3.48, -- Meticulous Scheming
			[575] = 10, -- Undulating Tides
			[13] = 0.06, -- Azerite Empowered
			[466] = 0.01, -- Burning Soul
			[497] = 0.88, -- Stand As One
			[485] = 5.5, -- Laser Matrix
			[85] = 0.1, -- Gemhide
			[195] = 3.69, -- Secrets of the Deep
			[526] = 4.48, -- Endless Hunger
			[44] = 0.25, -- Vampiric Speed
			[568] = 0.1, -- Person-Computer Interface
			[569] = 3.86, -- Clockwork Heart
			[22] = 2.91, -- Heed My Call
			[562] = 5.65, -- Treacherous Covenant
			[478] = 6.28, -- Tidal Surge
			[134] = 0.07, -- Revel in Pain
			[496] = 0.84, -- Stronger Together
			[522] = 4.29, -- Ancients' Bulwark
			[501] = 3.75, -- Relational Normalization Gizmo
			[156] = 3.88, -- Ruinous Bolt
			[576] = 2.13, -- Loyal to the End
			[19] = 0.13, -- Woundbinder
			[82] = 4.23, -- Champion of Azeroth
			[521] = 2.59, -- Shadow of Elune
			[104] = 0.06, -- Bracing Chill
			[560] = 1.16, -- Bonded Souls
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1200 - 1563 (avg 1340), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 1.07, 0.95 }, -- Memory of Lucid Dreams
			[32] = { 1.08, 1.02 }, -- Conflict and Strife
			[7] = { 2.6, 0.01 }, -- Anima of Life and Death
			[13] = { 0, 0.03 }, -- Nullification Dynamo
			[2] = { 0.03, 0.01 }, -- Azeroth's Undying Gift
			[25] = { 0.57, 0.59 }, -- Aegis of the Deep
			[15] = { 3.91, 0 }, -- Ripple in Space
			[22] = { 0.81, 0.07 }, -- Vision of Perfection
			[12] = { 10, 3.43 }, -- The Crucible of Flame
			[3] = { 2.35, 2.35 }, -- Sphere of Suppression
			[4] = { 1.17, 0.88 }, -- Worldvein Resonance
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 6, 1, { -- Blood Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2133 - 2936 (avg 2302), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[500] = 3.59, -- Synaptic Spark Capacitor
			[87] = 0.26, -- Self Reliance
			[562] = 5.16, -- Treacherous Covenant
			[503] = 0.24, -- Auto-Self-Cauterizer
			[480] = 3.28, -- Blood Rite
			[561] = 3.21, -- Seductive Power
			[30] = 3.47, -- Overwhelming Power
			[482] = 5.41, -- Thunderous Blast
			[494] = 6.56, -- Battlefield Precision
			[195] = 3.36, -- Secrets of the Deep
			[44] = 0.11, -- Vampiric Speed
			[481] = 2.97, -- Incite the Pack
			[478] = 6.07, -- Tidal Surge
			[463] = 0.07, -- Blessed Portents
			[20] = 1.38, -- Lifespeed
			[541] = 1.34, -- Fight or Flight
			[526] = 4.94, -- Endless Hunger
			[13] = 0.24, -- Azerite Empowered
			[576] = 2.22, -- Loyal to the End
			[83] = 0.25, -- Impassive Visage
			[568] = 0.17, -- Person-Computer Interface
			[502] = 0.15, -- Personal Absorb-o-Tron
			[504] = 3.63, -- Unstable Catalyst
			[521] = 3.24, -- Shadow of Elune
			[192] = 4.18, -- Meticulous Scheming
			[38] = 1.73, -- On My Way
			[18] = 1.2, -- Blood Siphon
			[101] = 0.14, -- Shimmering Haven
			[104] = 0.19, -- Bracing Chill
			[21] = 1.9, -- Elemental Whirl
			[569] = 4.29, -- Clockwork Heart
			[103] = 0.16, -- Concentrated Mending
			[479] = 4.91, -- Dagger in the Back
			[196] = 5.06, -- Swirling Sands
			[549] = 0.2, -- Cold Hearted
			[14] = 0.13, -- Longstrider
			[459] = 2.09, -- Unstable Flames
			[492] = 3.68, -- Liberator's Might
			[194] = 5.64, -- Filthy Transfusion
			[575] = 10, -- Undulating Tides
			[84] = 0.14, -- Bulwark of the Masses
			[193] = 5.74, -- Blightborne Infusion
			[577] = 0.72, -- Arcane Heart
			[483] = 3.88, -- Archive of the Titans
			[89] = 0.29, -- Azerite Veins
			[523] = 5.18, -- Apothecary's Concoctions
			[560] = 1.93, -- Bonded Souls
			[42] = 0.29, -- Savior
			[105] = 0.08, -- Ephemeral Recovery
			[465] = 0.03, -- March of the Damned
			[461] = 1.19, -- Earthlink
			[15] = 0.04, -- Resounding Protection
			[497] = 1, -- Stand As One
			[462] = 2.01, -- Azerite Globules
			[106] = 2.12, -- Deep Cuts
			[85] = 0.36, -- Gemhide
			[140] = 0.85, -- Bone Spike Graveyard
			[496] = 1.14, -- Stronger Together
			[348] = 3.26, -- Eternal Rune Weapon
			[157] = 6.35, -- Rezan's Fury
			[100] = 0.19, -- Strength in Numbers
			[495] = 3.25, -- Anduin's Dedication
			[485] = 5.77, -- Laser Matrix
			[499] = 2.71, -- Ricocheting Inflatable Pyrosaw
			[501] = 4.12, -- Relational Normalization Gizmo
			[349] = 0.5, -- Bones of the Damned
			[201] = 0.19, -- Runic Barrier
			[522] = 4.89, -- Ancients' Bulwark
			[82] = 4.4, -- Champion of Azeroth
			[99] = 0.19, -- Ablative Shielding
			[493] = 1.86, -- Last Gift
			[505] = 2.99, -- Tradewinds
			[43] = 0.19, -- Winds of War
			[31] = 3.18, -- Gutripper
			[243] = 3.71, -- Bloody Runeblade
			[498] = 4.18, -- Barrage Of Many Bombs
			[19] = 0.38, -- Woundbinder
			[156] = 3.62, -- Ruinous Bolt
			[22] = 2.85, -- Heed My Call
			[98] = 0.22, -- Crystalline Carapace
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2037 - 2387 (avg 2232), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 10, 3.72 }, -- The Crucible of Flame
			[25] = { 0.73, 0.71 }, -- Aegis of the Deep
			[2] = { 0.08, 0.18 }, -- Azeroth's Undying Gift
			[4] = { 1.29, 0.88 }, -- Worldvein Resonance
			[15] = { 3.8, 0.18 }, -- Ripple in Space
			[3] = { 3.32, 3.32 }, -- Sphere of Suppression
			[7] = { 2.17, 0.07 }, -- Anima of Life and Death
			[13] = { 0.09, 0.11 }, -- Nullification Dynamo
			[22] = { 0.09, 0.12 }, -- Vision of Perfection
			[27] = { 0.09, 1.43 }, -- Memory of Lucid Dreams
			[32] = { 1.43, 1.28 }, -- Conflict and Strife
		}, 1568019600)

		insertDefaultScalesData(defaultName, 6, 2, { -- Frost Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3905 - 5548 (avg 4282), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[101] = 0.51, -- Shimmering Haven
			[98] = 0.18, -- Crystalline Carapace
			[494] = 6.22, -- Battlefield Precision
			[31] = 3.15, -- Gutripper
			[522] = 9.63, -- Ancients' Bulwark
			[459] = 3.25, -- Unstable Flames
			[157] = 6.36, -- Rezan's Fury
			[549] = 0.33, -- Cold Hearted
			[478] = 5.85, -- Tidal Surge
			[498] = 3.9, -- Barrage Of Many Bombs
			[346] = 4.51, -- Killer Frost
			[21] = 3.13, -- Elemental Whirl
			[44] = 0.67, -- Vampiric Speed
			[503] = 0.24, -- Auto-Self-Cauterizer
			[198] = 4.33, -- Frostwhelp's Indignation
			[480] = 4.97, -- Blood Rite
			[560] = 2.34, -- Bonded Souls
			[22] = 2.62, -- Heed My Call
			[577] = 3.29, -- Arcane Heart
			[495] = 6.02, -- Anduin's Dedication
			[84] = 0.08, -- Bulwark of the Masses
			[195] = 6.12, -- Secrets of the Deep
			[575] = 9.61, -- Undulating Tides
			[568] = 0.18, -- Person-Computer Interface
			[500] = 3.36, -- Synaptic Spark Capacitor
			[492] = 4.72, -- Liberator's Might
			[108] = 6.42, -- Icy Citadel
			[42] = 0.24, -- Savior
			[103] = 0.1, -- Concentrated Mending
			[85] = 0.2, -- Gemhide
			[461] = 2.15, -- Earthlink
			[141] = 5.64, -- Latent Chill
			[479] = 6.47, -- Dagger in the Back
			[499] = 2.44, -- Ricocheting Inflatable Pyrosaw
			[493] = 3.9, -- Last Gift
			[30] = 4.56, -- Overwhelming Power
			[463] = 0.14, -- Blessed Portents
			[89] = 0.29, -- Azerite Veins
			[502] = 0.33, -- Personal Absorb-o-Tron
			[20] = 2.45, -- Lifespeed
			[192] = 4.92, -- Meticulous Scheming
			[504] = 6.39, -- Unstable Catalyst
			[38] = 2.72, -- On My Way
			[82] = 8.37, -- Champion of Azeroth
			[541] = 2.26, -- Fight or Flight
			[19] = 0.05, -- Woundbinder
			[521] = 5.15, -- Shadow of Elune
			[562] = 9.02, -- Treacherous Covenant
			[156] = 4.01, -- Ruinous Bolt
			[496] = 1.85, -- Stronger Together
			[505] = 7, -- Tradewinds
			[483] = 6.28, -- Archive of the Titans
			[501] = 6.49, -- Relational Normalization Gizmo
			[83] = 0.25, -- Impassive Visage
			[15] = 0.13, -- Resounding Protection
			[201] = 0.15, -- Runic Barrier
			[14] = 0.49, -- Longstrider
			[18] = 2.72, -- Blood Siphon
			[347] = 6.21, -- Frozen Tempest
			[462] = 1.85, -- Azerite Globules
			[523] = 4.74, -- Apothecary's Concoctions
			[497] = 1.78, -- Stand As One
			[194] = 4.74, -- Filthy Transfusion
			[569] = 5.58, -- Clockwork Heart
			[482] = 5.23, -- Thunderous Blast
			[526] = 10, -- Endless Hunger
			[43] = 0.12, -- Winds of War
			[105] = 0.19, -- Ephemeral Recovery
			[485] = 5.1, -- Laser Matrix
			[465] = 0.17, -- March of the Damned
			[193] = 8.71, -- Blightborne Infusion
			[13] = 0.06, -- Azerite Empowered
			[576] = 4.78, -- Loyal to the End
			[561] = 4.99, -- Seductive Power
			[104] = 0.04, -- Bracing Chill
			[196] = 7.94, -- Swirling Sands
			[100] = 0.24, -- Strength in Numbers
			[481] = 6.64, -- Incite the Pack
			[242] = 4.77, -- Echoing Howl
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3722 - 4530 (avg 4112), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 10, 6.04 }, -- Memory of Lucid Dreams
			[5] = { 9.2, 3.61 }, -- Essence of the Focusing Iris
			[6] = { 6.4, 2.64 }, -- Purification Protocol
			[23] = { 9.4, 1.65 }, -- Blood of the Enemy
			[28] = { 4.01, 1.92 }, -- The Unbound Force
			[4] = { 1.97, 1.55 }, -- Worldvein Resonance
			[32] = { 6.64, 2.81 }, -- Conflict and Strife
			[15] = { 4.47, 0.03 }, -- Ripple in Space
			[12] = { 7.89, 3.37 }, -- The Crucible of Flame
			[14] = { 8.52, 3.23 }, -- Condensed Life-Force
			[22] = { 4.42, 0 }, -- Vision of Perfection
		}, 1568019600)

		insertDefaultScalesData(defaultName, 6, 3, { -- Unholy Death Knight
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2426 - 3293 (avg 2705), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 5.14, -- Anduin's Dedication
			[14] = 0.07, -- Longstrider
			[485] = 5.72, -- Laser Matrix
			[20] = 2.05, -- Lifespeed
			[192] = 5.31, -- Meticulous Scheming
			[142] = 5.79, -- Helchains
			[482] = 5.2, -- Thunderous Blast
			[498] = 4.14, -- Barrage Of Many Bombs
			[351] = 2.88, -- Last Surprise
			[478] = 6.07, -- Tidal Surge
			[459] = 2.87, -- Unstable Flames
			[21] = 2.69, -- Elemental Whirl
			[561] = 4.58, -- Seductive Power
			[504] = 6.06, -- Unstable Catalyst
			[523] = 5.29, -- Apothecary's Concoctions
			[30] = 4.85, -- Overwhelming Power
			[522] = 9.09, -- Ancients' Bulwark
			[156] = 3.56, -- Ruinous Bolt
			[462] = 1.84, -- Azerite Globules
			[562] = 8.39, -- Treacherous Covenant
			[196] = 7.87, -- Swirling Sands
			[569] = 5.48, -- Clockwork Heart
			[505] = 5.33, -- Tradewinds
			[521] = 4.64, -- Shadow of Elune
			[483] = 5.59, -- Archive of the Titans
			[157] = 6.49, -- Rezan's Fury
			[497] = 0.93, -- Stand As One
			[494] = 6.14, -- Battlefield Precision
			[244] = 5.84, -- Harrowing Decay
			[576] = 3.46, -- Loyal to the End
			[496] = 1.69, -- Stronger Together
			[109] = 7.52, -- Magus of the Dead
			[43] = 0.02, -- Winds of War
			[480] = 4.66, -- Blood Rite
			[568] = 0.06, -- Person-Computer Interface
			[526] = 9.26, -- Endless Hunger
			[18] = 2.03, -- Blood Siphon
			[501] = 6.03, -- Relational Normalization Gizmo
			[193] = 8.44, -- Blightborne Infusion
			[194] = 5.36, -- Filthy Transfusion
			[82] = 7.45, -- Champion of Azeroth
			[481] = 5.17, -- Incite the Pack
			[575] = 10, -- Undulating Tides
			[105] = 0.15, -- Ephemeral Recovery
			[22] = 2.75, -- Heed My Call
			[38] = 2.53, -- On My Way
			[499] = 2.52, -- Ricocheting Inflatable Pyrosaw
			[492] = 4.93, -- Liberator's Might
			[31] = 3.11, -- Gutripper
			[500] = 3.12, -- Synaptic Spark Capacitor
			[541] = 1.68, -- Fight or Flight
			[461] = 2.01, -- Earthlink
			[195] = 5.1, -- Secrets of the Deep
			[199] = 9.16, -- Festermight
			[350] = 3.95, -- Cankerous Wounds
			[560] = 2.41, -- Bonded Souls
			[577] = 1.71, -- Arcane Heart
			[86] = 0.12, -- Azerite Fortification
			[99] = 0.13, -- Ablative Shielding
			[83] = 0.07, -- Impassive Visage
			[465] = 0.01, -- March of the Damned
			[493] = 2.99, -- Last Gift
			[479] = 6.56, -- Dagger in the Back
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2429 - 3103 (avg 2695), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 8.83, 3.41 }, -- Condensed Life-Force
			[15] = { 4.06, 0 }, -- Ripple in Space
			[23] = { 6.82, 1.01 }, -- Blood of the Enemy
			[28] = { 3.69, 1.71 }, -- The Unbound Force
			[12] = { 8.29, 3.01 }, -- The Crucible of Flame
			[5] = { 10, 3.21 }, -- Essence of the Focusing Iris
			[4] = { 1.75, 1.01 }, -- Worldvein Resonance
			[22] = { 5.39, 2.12 }, -- Vision of Perfection
			[27] = { 4.63, 3 }, -- Memory of Lucid Dreams
			[32] = { 1.97, 2.31 }, -- Conflict and Strife
			[6] = { 5.55, 2.62 }, -- Purification Protocol
		}, 1568019600)

		insertDefaultScalesData(defaultName, 11, 1, { -- Balance Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2795 - 3720 (avg 3018), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 0.08, -- Azerite Veins
			[562] = 5.35, -- Treacherous Covenant
			[193] = 5.86, -- Blightborne Infusion
			[521] = 3.44, -- Shadow of Elune
			[19] = 0.1, -- Woundbinder
			[523] = 3.19, -- Apothecary's Concoctions
			[86] = 0.12, -- Azerite Fortification
			[173] = 2.31, -- Power of the Moon
			[82] = 5.29, -- Champion of Azeroth
			[20] = 1.67, -- Lifespeed
			[122] = 3.9, -- Streaking Stars
			[526] = 5.43, -- Endless Hunger
			[478] = 3.65, -- Tidal Surge
			[577] = 2.14, -- Arcane Heart
			[103] = 0.02, -- Concentrated Mending
			[463] = 0.03, -- Blessed Portents
			[505] = 4.5, -- Tradewinds
			[492] = 3.56, -- Liberator's Might
			[43] = 0.04, -- Winds of War
			[42] = 0.15, -- Savior
			[503] = 0.08, -- Auto-Self-Cauterizer
			[497] = 1.13, -- Stand As One
			[482] = 3.67, -- Thunderous Blast
			[104] = 0.22, -- Bracing Chill
			[192] = 4.55, -- Meticulous Scheming
			[461] = 1.38, -- Earthlink
			[498] = 2.59, -- Barrage Of Many Bombs
			[13] = 0.04, -- Azerite Empowered
			[38] = 1.79, -- On My Way
			[196] = 5.43, -- Swirling Sands
			[541] = 1.49, -- Fight or Flight
			[502] = 0.26, -- Personal Absorb-o-Tron
			[87] = 0.16, -- Self Reliance
			[522] = 5.59, -- Ancients' Bulwark
			[22] = 1.92, -- Heed My Call
			[84] = 0.12, -- Bulwark of the Masses
			[356] = 1.79, -- High Noon
			[31] = 1.91, -- Gutripper
			[30] = 3.29, -- Overwhelming Power
			[194] = 3.57, -- Filthy Transfusion
			[156] = 2.27, -- Ruinous Bolt
			[18] = 1.84, -- Blood Siphon
			[499] = 1.69, -- Ricocheting Inflatable Pyrosaw
			[576] = 3.11, -- Loyal to the End
			[501] = 4.21, -- Relational Normalization Gizmo
			[561] = 3.07, -- Seductive Power
			[504] = 4.09, -- Unstable Catalyst
			[493] = 2.53, -- Last Gift
			[98] = 0.23, -- Crystalline Carapace
			[495] = 3.57, -- Anduin's Dedication
			[195] = 3.43, -- Secrets of the Deep
			[101] = 0.09, -- Shimmering Haven
			[15] = 0.13, -- Resounding Protection
			[481] = 4.23, -- Incite the Pack
			[480] = 3.52, -- Blood Rite
			[560] = 1.85, -- Bonded Souls
			[99] = 0.14, -- Ablative Shielding
			[569] = 4.63, -- Clockwork Heart
			[540] = 0.32, -- Switch Hitter
			[100] = 0.03, -- Strength in Numbers
			[21] = 2, -- Elemental Whirl
			[157] = 4, -- Rezan's Fury
			[85] = 0.07, -- Gemhide
			[494] = 3.89, -- Battlefield Precision
			[483] = 3.77, -- Archive of the Titans
			[250] = 3.9, -- Dawning Sun
			[462] = 1.24, -- Azerite Globules
			[467] = 0.15, -- Ursoc's Endurance
			[219] = 0.16, -- Reawakening
			[364] = 2.84, -- Lively Spirit
			[496] = 1.44, -- Stronger Together
			[479] = 4.08, -- Dagger in the Back
			[105] = 0.08, -- Ephemeral Recovery
			[200] = 10, -- Arcanic Pulsar
			[500] = 2.08, -- Synaptic Spark Capacitor
			[485] = 3.48, -- Laser Matrix
			[459] = 2.23, -- Unstable Flames
			[357] = 0.11, -- Lunar Shrapnel
			[575] = 6.33, -- Undulating Tides
			[14] = 0.17, -- Longstrider
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2463 - 3338 (avg 2927), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 10, 2.18 }, -- Conflict and Strife
			[5] = { 7.17, 3.48 }, -- Essence of the Focusing Iris
			[6] = { 4.27, 2.39 }, -- Purification Protocol
			[28] = { 2.99, 2.05 }, -- The Unbound Force
			[14] = { 7.81, 2.95 }, -- Condensed Life-Force
			[23] = { 5.04, 1.18 }, -- Blood of the Enemy
			[4] = { 0.29, 1.16 }, -- Worldvein Resonance
			[15] = { 2.38, 0.04 }, -- Ripple in Space
			[27] = { 4.53, 2.61 }, -- Memory of Lucid Dreams
			[22] = { 4.53, 1.13 }, -- Vision of Perfection
			[12] = { 5.02, 2.89 }, -- The Crucible of Flame
		}, 1568019600)

		insertDefaultScalesData(defaultName, 11, 2, { -- Feral Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4350 - 5237 (avg 4769), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[82] = 7.03, -- Champion of Azeroth
			[157] = 5.31, -- Rezan's Fury
			[569] = 6.31, -- Clockwork Heart
			[196] = 7.53, -- Swirling Sands
			[500] = 2.59, -- Synaptic Spark Capacitor
			[492] = 4.35, -- Liberator's Might
			[504] = 4.43, -- Unstable Catalyst
			[195] = 4.15, -- Secrets of the Deep
			[526] = 7.6, -- Endless Hunger
			[493] = 2.91, -- Last Gift
			[111] = 4.62, -- Blood Mist
			[485] = 4.52, -- Laser Matrix
			[209] = 10, -- Jungle Fury
			[18] = 1.94, -- Blood Siphon
			[483] = 4.85, -- Archive of the Titans
			[541] = 1.48, -- Fight or Flight
			[561] = 3.72, -- Seductive Power
			[480] = 3.44, -- Blood Rite
			[31] = 2.33, -- Gutripper
			[577] = 2.03, -- Arcane Heart
			[193] = 8.46, -- Blightborne Infusion
			[478] = 5.24, -- Tidal Surge
			[479] = 5.49, -- Dagger in the Back
			[247] = 1.07, -- Iron Jaws
			[498] = 3.18, -- Barrage Of Many Bombs
			[499] = 1.62, -- Ricocheting Inflatable Pyrosaw
			[523] = 4.14, -- Apothecary's Concoctions
			[21] = 2.29, -- Elemental Whirl
			[481] = 5.13, -- Incite the Pack
			[20] = 1.67, -- Lifespeed
			[501] = 4.49, -- Relational Normalization Gizmo
			[575] = 8.35, -- Undulating Tides
			[505] = 5.52, -- Tradewinds
			[494] = 5.3, -- Battlefield Precision
			[30] = 3.15, -- Overwhelming Power
			[576] = 3.6, -- Loyal to the End
			[521] = 3.51, -- Shadow of Elune
			[495] = 4.12, -- Anduin's Dedication
			[359] = 5.99, -- Wild Fleshrending
			[522] = 7.5, -- Ancients' Bulwark
			[482] = 4.3, -- Thunderous Blast
			[497] = 0.85, -- Stand As One
			[459] = 2.84, -- Unstable Flames
			[194] = 4.01, -- Filthy Transfusion
			[169] = 2.53, -- Untamed Ferocity
			[562] = 6.32, -- Treacherous Covenant
			[358] = 4.91, -- Gushing Lacerations
			[192] = 4.42, -- Meticulous Scheming
			[560] = 1.43, -- Bonded Souls
			[38] = 1.99, -- On My Way
			[462] = 1.37, -- Azerite Globules
			[461] = 1.3, -- Earthlink
			[22] = 2.05, -- Heed My Call
			[496] = 1.4, -- Stronger Together
			[156] = 2.94, -- Ruinous Bolt
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4158 - 4985 (avg 4656), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 1.83, 0.28 }, -- Vision of Perfection
			[14] = { 6.15, 2.19 }, -- Condensed Life-Force
			[23] = { 4.52, 0.5 }, -- Blood of the Enemy
			[27] = { 2.54, 2.09 }, -- Memory of Lucid Dreams
			[15] = { 2.54, 0 }, -- Ripple in Space
			[5] = { 5.79, 2.18 }, -- Essence of the Focusing Iris
			[28] = { 2.33, 1.19 }, -- The Unbound Force
			[4] = { 0.73, 0.88 }, -- Worldvein Resonance
			[12] = { 5.9, 2.35 }, -- The Crucible of Flame
			[32] = { 10, 1.68 }, -- Conflict and Strife
			[6] = { 4.23, 1.75 }, -- Purification Protocol
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 11, 3, { -- Guardian Druid
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1001 - 1637 (avg 1185), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[541] = 1.27, -- Fight or Flight
			[522] = 4.96, -- Ancients' Bulwark
			[241] = 4.51, -- Twisted Claws
			[156] = 3.67, -- Ruinous Bolt
			[15] = 0.03, -- Resounding Protection
			[562] = 5.81, -- Treacherous Covenant
			[492] = 3.01, -- Liberator's Might
			[22] = 2.66, -- Heed My Call
			[89] = 0.05, -- Azerite Veins
			[192] = 4.43, -- Meticulous Scheming
			[21] = 1.76, -- Elemental Whirl
			[496] = 0.88, -- Stronger Together
			[499] = 2.32, -- Ricocheting Inflatable Pyrosaw
			[459] = 1.67, -- Unstable Flames
			[194] = 5.19, -- Filthy Transfusion
			[251] = 4.36, -- Burst of Savagery
			[44] = 0.06, -- Vampiric Speed
			[575] = 10, -- Undulating Tides
			[361] = 3.92, -- Guardian's Wrath
			[479] = 4.44, -- Dagger in the Back
			[521] = 3.47, -- Shadow of Elune
			[195] = 3.74, -- Secrets of the Deep
			[157] = 6.2, -- Rezan's Fury
			[497] = 0.8, -- Stand As One
			[504] = 4.33, -- Unstable Catalyst
			[30] = 2.89, -- Overwhelming Power
			[576] = 2.4, -- Loyal to the End
			[461] = 1.26, -- Earthlink
			[577] = 1.02, -- Arcane Heart
			[498] = 3.82, -- Barrage Of Many Bombs
			[495] = 3.69, -- Anduin's Dedication
			[193] = 4.95, -- Blightborne Infusion
			[494] = 6.25, -- Battlefield Precision
			[478] = 6.11, -- Tidal Surge
			[493] = 1.84, -- Last Gift
			[569] = 4.05, -- Clockwork Heart
			[523] = 4.93, -- Apothecary's Concoctions
			[82] = 4.88, -- Champion of Azeroth
			[483] = 4.25, -- Archive of the Titans
			[84] = 0.01, -- Bulwark of the Masses
			[482] = 5.21, -- Thunderous Blast
			[196] = 4.25, -- Swirling Sands
			[561] = 3.27, -- Seductive Power
			[500] = 3.25, -- Synaptic Spark Capacitor
			[485] = 5.43, -- Laser Matrix
			[31] = 2.83, -- Gutripper
			[501] = 4.3, -- Relational Normalization Gizmo
			[481] = 3.3, -- Incite the Pack
			[526] = 5.22, -- Endless Hunger
			[480] = 3.46, -- Blood Rite
			[18] = 1.13, -- Blood Siphon
			[38] = 1.38, -- On My Way
			[560] = 1.47, -- Bonded Souls
			[359] = 1.6, -- Wild Fleshrending
			[462] = 1.82, -- Azerite Globules
			[505] = 3.64, -- Tradewinds
			[20] = 1.51, -- Lifespeed
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1032 - 1305 (avg 1126), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 10, 3.87 }, -- The Crucible of Flame
			[3] = { 3.49, 3.46 }, -- Sphere of Suppression
			[4] = { 0.97, 1.04 }, -- Worldvein Resonance
			[22] = { 1.51, 0 }, -- Vision of Perfection
			[27] = { 1.38, 0.66 }, -- Memory of Lucid Dreams
			[25] = { 0.73, 0.72 }, -- Aegis of the Deep
			[15] = { 3.98, 0.01 }, -- Ripple in Space
			[32] = { 6.58, 1.49 }, -- Conflict and Strife
			[7] = { 2.15, 0 }, -- Anima of Life and Death
		}, 1568019600)

		insertDefaultScalesData(defaultName, 3, 1, { -- Beast Mastery Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2805 - 3502 (avg 3084), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[366] = 10, -- Primal Instincts
			[480] = 4.69, -- Blood Rite
			[13] = 0.04, -- Azerite Empowered
			[193] = 7.23, -- Blightborne Infusion
			[30] = 3.84, -- Overwhelming Power
			[195] = 4.97, -- Secrets of the Deep
			[562] = 7.3, -- Treacherous Covenant
			[568] = 0.19, -- Person-Computer Interface
			[522] = 7.46, -- Ancients' Bulwark
			[38] = 2.1, -- On My Way
			[365] = 5.13, -- Dire Consequences
			[492] = 4.47, -- Liberator's Might
			[505] = 5.46, -- Tradewinds
			[504] = 5.34, -- Unstable Catalyst
			[501] = 5.66, -- Relational Normalization Gizmo
			[481] = 4.85, -- Incite the Pack
			[192] = 6.02, -- Meticulous Scheming
			[194] = 4.01, -- Filthy Transfusion
			[494] = 5.36, -- Battlefield Precision
			[561] = 3.71, -- Seductive Power
			[576] = 3.44, -- Loyal to the End
			[157] = 5.36, -- Rezan's Fury
			[86] = 0.05, -- Azerite Fortification
			[575] = 8.37, -- Undulating Tides
			[20] = 2.05, -- Lifespeed
			[495] = 4.66, -- Anduin's Dedication
			[496] = 1.5, -- Stronger Together
			[526] = 7.41, -- Endless Hunger
			[161] = 6.09, -- Haze of Rage
			[493] = 2.87, -- Last Gift
			[479] = 5.7, -- Dagger in the Back
			[461] = 1.71, -- Earthlink
			[560] = 1.97, -- Bonded Souls
			[31] = 2.59, -- Gutripper
			[211] = 9.44, -- Dance of Death
			[483] = 5.35, -- Archive of the Titans
			[541] = 1.73, -- Fight or Flight
			[462] = 1.38, -- Azerite Globules
			[156] = 3.41, -- Ruinous Bolt
			[569] = 5.76, -- Clockwork Heart
			[203] = 0.07, -- Shellshock
			[84] = 0.13, -- Bulwark of the Masses
			[498] = 3.2, -- Barrage Of Many Bombs
			[107] = 3.63, -- Serrated Jaws
			[478] = 5.69, -- Tidal Surge
			[22] = 2.28, -- Heed My Call
			[367] = 6, -- Feeding Frenzy
			[459] = 2.44, -- Unstable Flames
			[101] = 0.19, -- Shimmering Haven
			[499] = 2.14, -- Ricocheting Inflatable Pyrosaw
			[521] = 4.36, -- Shadow of Elune
			[18] = 2.02, -- Blood Siphon
			[482] = 4.41, -- Thunderous Blast
			[21] = 2.31, -- Elemental Whirl
			[196] = 6.33, -- Swirling Sands
			[577] = 0.77, -- Arcane Heart
			[100] = 0.25, -- Strength in Numbers
			[82] = 6.98, -- Champion of Azeroth
			[500] = 3.14, -- Synaptic Spark Capacitor
			[497] = 1.34, -- Stand As One
			[523] = 4.58, -- Apothecary's Concoctions
			[485] = 4.7, -- Laser Matrix
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2659 - 3250 (avg 2994), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[15] = { 3.78, 0.03 }, -- Ripple in Space
			[23] = { 4.91, 0.65 }, -- Blood of the Enemy
			[6] = { 5.8, 2.16 }, -- Purification Protocol
			[32] = { 2.06, 1.94 }, -- Conflict and Strife
			[5] = { 10, 2.94 }, -- Essence of the Focusing Iris
			[14] = { 7.16, 2.56 }, -- Condensed Life-Force
			[4] = { 1.48, 0.98 }, -- Worldvein Resonance
			[22] = { 0.68, 0 }, -- Vision of Perfection
			[27] = { 0.61, 0.82 }, -- Memory of Lucid Dreams
			[28] = { 3.76, 1.55 }, -- The Unbound Force
			[12] = { 8.17, 2.85 }, -- The Crucible of Flame
		}, 1568019600)

		insertDefaultScalesData(defaultName, 3, 2, { -- Marksmanship Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2981 - 3831 (avg 3228), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[459] = 2.5, -- Unstable Flames
			[157] = 5.44, -- Rezan's Fury
			[196] = 5.99, -- Swirling Sands
			[478] = 5.56, -- Tidal Surge
			[370] = 8.73, -- Focused Fire
			[15] = 0.13, -- Resounding Protection
			[13] = 0.19, -- Azerite Empowered
			[560] = 2.35, -- Bonded Souls
			[100] = 0.13, -- Strength in Numbers
			[479] = 5.85, -- Dagger in the Back
			[485] = 4.77, -- Laser Matrix
			[156] = 3.26, -- Ruinous Bolt
			[480] = 4.87, -- Blood Rite
			[522] = 6.84, -- Ancients' Bulwark
			[504] = 4.61, -- Unstable Catalyst
			[368] = 3.06, -- Steady Aim
			[503] = 0.01, -- Auto-Self-Cauterizer
			[82] = 6.38, -- Champion of Azeroth
			[203] = 0.33, -- Shellshock
			[14] = 0.25, -- Longstrider
			[44] = 0.04, -- Vampiric Speed
			[162] = 6.23, -- Surging Shots
			[500] = 3, -- Synaptic Spark Capacitor
			[36] = 10, -- In The Rhythm
			[30] = 4.29, -- Overwhelming Power
			[481] = 4.9, -- Incite the Pack
			[105] = 0.23, -- Ephemeral Recovery
			[482] = 4.3, -- Thunderous Blast
			[561] = 3.39, -- Seductive Power
			[99] = 0.18, -- Ablative Shielding
			[85] = 0.14, -- Gemhide
			[98] = 0.27, -- Crystalline Carapace
			[42] = 0.07, -- Savior
			[18] = 2.14, -- Blood Siphon
			[499] = 2.05, -- Ricocheting Inflatable Pyrosaw
			[87] = 0.03, -- Self Reliance
			[195] = 4.32, -- Secrets of the Deep
			[541] = 1.68, -- Fight or Flight
			[19] = 0.29, -- Woundbinder
			[212] = 7.56, -- Unerring Vision
			[369] = 0.18, -- Rapid Reload
			[103] = 0.15, -- Concentrated Mending
			[43] = 0.35, -- Winds of War
			[38] = 2.1, -- On My Way
			[86] = 0.25, -- Azerite Fortification
			[568] = 0.06, -- Person-Computer Interface
			[505] = 5.05, -- Tradewinds
			[192] = 5.72, -- Meticulous Scheming
			[104] = 0.19, -- Bracing Chill
			[193] = 6.91, -- Blightborne Infusion
			[496] = 1.33, -- Stronger Together
			[569] = 5.04, -- Clockwork Heart
			[501] = 5.57, -- Relational Normalization Gizmo
			[543] = 0.16, -- Nature's Salve
			[502] = 0.17, -- Personal Absorb-o-Tron
			[20] = 2.44, -- Lifespeed
			[494] = 5.13, -- Battlefield Precision
			[194] = 4.27, -- Filthy Transfusion
			[577] = 2.26, -- Arcane Heart
			[21] = 2.34, -- Elemental Whirl
			[562] = 6.57, -- Treacherous Covenant
			[462] = 1.5, -- Azerite Globules
			[521] = 4.77, -- Shadow of Elune
			[22] = 2.28, -- Heed My Call
			[575] = 8.12, -- Undulating Tides
			[495] = 4.19, -- Anduin's Dedication
			[83] = 0.31, -- Impassive Visage
			[523] = 4.33, -- Apothecary's Concoctions
			[101] = 0.15, -- Shimmering Haven
			[493] = 2.8, -- Last Gift
			[576] = 3.74, -- Loyal to the End
			[497] = 1.15, -- Stand As One
			[498] = 3.4, -- Barrage Of Many Bombs
			[31] = 2.68, -- Gutripper
			[461] = 1.52, -- Earthlink
			[492] = 4.45, -- Liberator's Might
			[89] = 0.07, -- Azerite Veins
			[526] = 6.71, -- Endless Hunger
			[84] = 0.23, -- Bulwark of the Masses
			[483] = 4.5, -- Archive of the Titans
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2954 - 3421 (avg 3243), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 5.25, 1.17 }, -- Blood of the Enemy
			[22] = { 5.83, 2.71 }, -- Vision of Perfection
			[32] = { 2.86, 2.67 }, -- Conflict and Strife
			[5] = { 10, 4.8 }, -- Essence of the Focusing Iris
			[4] = { 0.87, 1.47 }, -- Worldvein Resonance
			[12] = { 7.74, 4.04 }, -- The Crucible of Flame
			[15] = { 3.2, 0.22 }, -- Ripple in Space
			[28] = { 2.7, 1.99 }, -- The Unbound Force
			[6] = { 5.61, 3.11 }, -- Purification Protocol
			[14] = { 8.53, 3.7 }, -- Condensed Life-Force
			[27] = { 2.01, 1.13 }, -- Memory of Lucid Dreams
		}, 1568019600)

		insertDefaultScalesData(defaultName, 3, 3, { -- Survival Hunter
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2590 - 3318 (avg 2819), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 2.5, -- On My Way
			[496] = 1.73, -- Stronger Together
			[478] = 6.07, -- Tidal Surge
			[19] = 0.02, -- Woundbinder
			[522] = 8.39, -- Ancients' Bulwark
			[365] = 5.63, -- Dire Consequences
			[561] = 4.51, -- Seductive Power
			[577] = 2.36, -- Arcane Heart
			[195] = 5.38, -- Secrets of the Deep
			[459] = 2.97, -- Unstable Flames
			[101] = 0.15, -- Shimmering Haven
			[192] = 6.54, -- Meticulous Scheming
			[560] = 2.86, -- Bonded Souls
			[502] = 0.23, -- Personal Absorb-o-Tron
			[575] = 10, -- Undulating Tides
			[576] = 3.64, -- Loyal to the End
			[104] = 0.15, -- Bracing Chill
			[494] = 6.43, -- Battlefield Precision
			[20] = 3.02, -- Lifespeed
			[82] = 7.78, -- Champion of Azeroth
			[500] = 3.34, -- Synaptic Spark Capacitor
			[501] = 7.03, -- Relational Normalization Gizmo
			[481] = 4.9, -- Incite the Pack
			[13] = 0.18, -- Azerite Empowered
			[492] = 5.22, -- Liberator's Might
			[196] = 7.2, -- Swirling Sands
			[569] = 6.36, -- Clockwork Heart
			[469] = 0.05, -- Duck and Cover
			[371] = 8.91, -- Blur of Talons
			[14] = 0.12, -- Longstrider
			[497] = 1.23, -- Stand As One
			[163] = 7.22, -- Latent Poison
			[193] = 8.05, -- Blightborne Infusion
			[498] = 4.07, -- Barrage Of Many Bombs
			[31] = 3.19, -- Gutripper
			[503] = 0.26, -- Auto-Self-Cauterizer
			[505] = 5.39, -- Tradewinds
			[105] = 0.06, -- Ephemeral Recovery
			[543] = 0.13, -- Nature's Salve
			[462] = 1.95, -- Azerite Globules
			[482] = 5.24, -- Thunderous Blast
			[44] = 0.09, -- Vampiric Speed
			[463] = 0.34, -- Blessed Portents
			[485] = 5.48, -- Laser Matrix
			[373] = 8.1, -- Primeval Intuition
			[100] = 0.19, -- Strength in Numbers
			[87] = 0.46, -- Self Reliance
			[157] = 6.29, -- Rezan's Fury
			[110] = 2.6, -- Wildfire Cluster
			[85] = 0.01, -- Gemhide
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[504] = 5.85, -- Unstable Catalyst
			[107] = 3.73, -- Serrated Jaws
			[156] = 3.83, -- Ruinous Bolt
			[495] = 5.01, -- Anduin's Dedication
			[521] = 5.8, -- Shadow of Elune
			[83] = 0.24, -- Impassive Visage
			[562] = 8.07, -- Treacherous Covenant
			[203] = 0.24, -- Shellshock
			[372] = 9.75, -- Wilderness Survival
			[523] = 5.29, -- Apothecary's Concoctions
			[194] = 5.27, -- Filthy Transfusion
			[89] = 0.09, -- Azerite Veins
			[30] = 5.56, -- Overwhelming Power
			[568] = 0.22, -- Person-Computer Interface
			[22] = 2.76, -- Heed My Call
			[18] = 1.91, -- Blood Siphon
			[483] = 6, -- Archive of the Titans
			[526] = 7.98, -- Endless Hunger
			[479] = 6.81, -- Dagger in the Back
			[21] = 2.83, -- Elemental Whirl
			[213] = 5.22, -- Venomous Fangs
			[461] = 1.74, -- Earthlink
			[84] = 0.12, -- Bulwark of the Masses
			[43] = 0.04, -- Winds of War
			[480] = 5.89, -- Blood Rite
			[493] = 3.12, -- Last Gift
			[541] = 1.95, -- Fight or Flight
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2430 - 3082 (avg 2708), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 7.26, 2.32 }, -- Memory of Lucid Dreams
			[32] = { 2.42, 2.5 }, -- Conflict and Strife
			[14] = { 8.45, 3.33 }, -- Condensed Life-Force
			[15] = { 3.88, 0.17 }, -- Ripple in Space
			[23] = { 5.58, 1.12 }, -- Blood of the Enemy
			[28] = { 3.59, 1.68 }, -- The Unbound Force
			[22] = { 3.6, 0.26 }, -- Vision of Perfection
			[12] = { 8.29, 3.32 }, -- The Crucible of Flame
			[6] = { 5.56, 2.8 }, -- Purification Protocol
			[5] = { 10, 4.51 }, -- Essence of the Focusing Iris
			[4] = { 0.86, 1.29 }, -- Worldvein Resonance
		}, 1568019600)

		insertDefaultScalesData(defaultName, 8, 1, { -- Arcane Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5794 - 7112 (avg 6236), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[495] = 4.65, -- Anduin's Dedication
			[192] = 2.17, -- Meticulous Scheming
			[526] = 7.27, -- Endless Hunger
			[157] = 5.1, -- Rezan's Fury
			[127] = 10, -- Equipoise
			[30] = 2.68, -- Overwhelming Power
			[22] = 1.84, -- Heed My Call
			[562] = 7.3, -- Treacherous Covenant
			[483] = 4.74, -- Archive of the Titans
			[493] = 2.74, -- Last Gift
			[501] = 4.46, -- Relational Normalization Gizmo
			[156] = 2.82, -- Ruinous Bolt
			[505] = 4.75, -- Tradewinds
			[521] = 2.84, -- Shadow of Elune
			[541] = 1.61, -- Fight or Flight
			[88] = 5.39, -- Arcane Pummeling
			[193] = 6.88, -- Blightborne Infusion
			[496] = 1.35, -- Stronger Together
			[500] = 2.71, -- Synaptic Spark Capacitor
			[569] = 3.53, -- Clockwork Heart
			[195] = 4.42, -- Secrets of the Deep
			[561] = 3.65, -- Seductive Power
			[461] = 1.33, -- Earthlink
			[38] = 2.01, -- On My Way
			[481] = 4.27, -- Incite the Pack
			[167] = 2.75, -- Brain Storm
			[504] = 5.19, -- Unstable Catalyst
			[482] = 3.84, -- Thunderous Blast
			[18] = 1.75, -- Blood Siphon
			[462] = 1.34, -- Azerite Globules
			[374] = 6.13, -- Galvanizing Spark
			[478] = 4.92, -- Tidal Surge
			[214] = 2.55, -- Arcane Pressure
			[479] = 5.16, -- Dagger in the Back
			[459] = 2.43, -- Unstable Flames
			[575] = 8.08, -- Undulating Tides
			[492] = 4.21, -- Liberator's Might
			[499] = 1.86, -- Ricocheting Inflatable Pyrosaw
			[523] = 3.99, -- Apothecary's Concoctions
			[196] = 5.71, -- Swirling Sands
			[576] = 3.58, -- Loyal to the End
			[497] = 0.81, -- Stand As One
			[560] = 1.34, -- Bonded Souls
			[20] = 1.3, -- Lifespeed
			[31] = 2.03, -- Gutripper
			[194] = 4.24, -- Filthy Transfusion
			[21] = 2.07, -- Elemental Whirl
			[577] = 1.97, -- Arcane Heart
			[494] = 4.08, -- Battlefield Precision
			[480] = 2.96, -- Blood Rite
			[82] = 5.85, -- Champion of Azeroth
			[485] = 4.64, -- Laser Matrix
			[498] = 3.16, -- Barrage Of Many Bombs
			[522] = 7.52, -- Ancients' Bulwark
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5852 - 7888 (avg 6494), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 3.32, 0.13 }, -- Blood of the Enemy
			[14] = { 10, 3.27 }, -- Condensed Life-Force
			[27] = { 5.13, 3.37 }, -- Memory of Lucid Dreams
			[6] = { 4.17, 2.85 }, -- Purification Protocol
			[22] = { 0.94, 0 }, -- Vision of Perfection
			[32] = { 2.58, 2.63 }, -- Conflict and Strife
			[4] = { 1.42, 1.59 }, -- Worldvein Resonance
			[5] = { 9.95, 3.41 }, -- Essence of the Focusing Iris
			[28] = { 0.51, 1.26 }, -- The Unbound Force
			[12] = { 8.01, 3.84 }, -- The Crucible of Flame
			[15] = { 2.46, 0 }, -- Ripple in Space
		}, 1568019600)

		insertDefaultScalesData(defaultName, 8, 2, { -- Fire Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 7033 - 8257 (avg 7584), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[498] = 4.19, -- Barrage Of Many Bombs
			[196] = 7.09, -- Swirling Sands
			[523] = 5.06, -- Apothecary's Concoctions
			[461] = 1.85, -- Earthlink
			[463] = 0.1, -- Blessed Portents
			[98] = 0.04, -- Crystalline Carapace
			[541] = 1.82, -- Fight or Flight
			[38] = 2.34, -- On My Way
			[504] = 5.16, -- Unstable Catalyst
			[103] = 0.18, -- Concentrated Mending
			[462] = 1.95, -- Azerite Globules
			[522] = 7.55, -- Ancients' Bulwark
			[31] = 2.86, -- Gutripper
			[42] = 0.02, -- Savior
			[193] = 7.84, -- Blightborne Infusion
			[378] = 5.91, -- Firemind
			[575] = 10, -- Undulating Tides
			[89] = 0.21, -- Azerite Veins
			[157] = 6.27, -- Rezan's Fury
			[492] = 4.33, -- Liberator's Might
			[468] = 0.12, -- Cauterizing Blink
			[215] = 8.06, -- Blaster Master
			[479] = 6.12, -- Dagger in the Back
			[502] = 0.24, -- Personal Absorb-o-Tron
			[577] = 3.22, -- Arcane Heart
			[493] = 2.66, -- Last Gift
			[20] = 2.03, -- Lifespeed
			[500] = 3.16, -- Synaptic Spark Capacitor
			[205] = 0.09, -- Eldritch Warding
			[376] = 4.02, -- Trailing Embers
			[18] = 2.15, -- Blood Siphon
			[568] = 0.02, -- Person-Computer Interface
			[505] = 4.95, -- Tradewinds
			[496] = 1.54, -- Stronger Together
			[86] = 0.11, -- Azerite Fortification
			[82] = 7.02, -- Champion of Azeroth
			[156] = 3.37, -- Ruinous Bolt
			[495] = 4.48, -- Anduin's Dedication
			[30] = 4.02, -- Overwhelming Power
			[499] = 2.18, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.17, -- Elemental Whirl
			[497] = 1.65, -- Stand As One
			[481] = 4.7, -- Incite the Pack
			[105] = 0.06, -- Ephemeral Recovery
			[22] = 2.77, -- Heed My Call
			[501] = 5.16, -- Relational Normalization Gizmo
			[168] = 9.28, -- Wildfire
			[99] = 0.22, -- Ablative Shielding
			[459] = 2.5, -- Unstable Flames
			[561] = 4, -- Seductive Power
			[503] = 0.08, -- Auto-Self-Cauterizer
			[526] = 7.36, -- Endless Hunger
			[44] = 0.1, -- Vampiric Speed
			[562] = 7.16, -- Treacherous Covenant
			[480] = 4.66, -- Blood Rite
			[87] = 0.12, -- Self Reliance
			[194] = 4.53, -- Filthy Transfusion
			[494] = 5.67, -- Battlefield Precision
			[483] = 4.79, -- Archive of the Titans
			[85] = 0.21, -- Gemhide
			[19] = 0.18, -- Woundbinder
			[192] = 4.2, -- Meticulous Scheming
			[482] = 4.95, -- Thunderous Blast
			[478] = 6.18, -- Tidal Surge
			[83] = 0.11, -- Impassive Visage
			[100] = 0.29, -- Strength in Numbers
			[521] = 4.27, -- Shadow of Elune
			[128] = 3.39, -- Flames of Alacrity
			[485] = 5.52, -- Laser Matrix
			[195] = 4.25, -- Secrets of the Deep
			[560] = 1.99, -- Bonded Souls
			[576] = 3.43, -- Loyal to the End
			[377] = 5.39, -- Duplicative Incineration
			[43] = 0.1, -- Winds of War
			[569] = 7.49, -- Clockwork Heart
			[546] = 0.14, -- Quick Thinking
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 6837 - 7922 (avg 7375), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 5.42, 1.79 }, -- Essence of the Focusing Iris
			[28] = { 1.69, 0.94 }, -- The Unbound Force
			[12] = { 4.11, 2.05 }, -- The Crucible of Flame
			[32] = { 1.14, 1.21 }, -- Conflict and Strife
			[23] = { 1.69, 0.85 }, -- Blood of the Enemy
			[27] = { 10, 4.77 }, -- Memory of Lucid Dreams
			[14] = { 5.54, 1.84 }, -- Condensed Life-Force
			[4] = { 0.68, 0.73 }, -- Worldvein Resonance
			[15] = { 2.32, 0.02 }, -- Ripple in Space
			[6] = { 3.35, 1.56 }, -- Purification Protocol
		}, 1568019600)

		insertDefaultScalesData(defaultName, 8, 3, { -- Frost Mage
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4062 - 4798 (avg 4297), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[577] = 1.21, -- Arcane Heart
			[98] = 0.17, -- Crystalline Carapace
			[193] = 5.36, -- Blightborne Infusion
			[562] = 6, -- Treacherous Covenant
			[99] = 0.1, -- Ablative Shielding
			[505] = 3.99, -- Tradewinds
			[504] = 4.55, -- Unstable Catalyst
			[30] = 3.27, -- Overwhelming Power
			[42] = 0.06, -- Savior
			[498] = 2.45, -- Barrage Of Many Bombs
			[225] = 3.91, -- Glacial Assault
			[157] = 4.16, -- Rezan's Fury
			[170] = 10, -- Flash Freeze
			[521] = 3.48, -- Shadow of Elune
			[479] = 4.36, -- Dagger in the Back
			[31] = 1.79, -- Gutripper
			[21] = 1.98, -- Elemental Whirl
			[494] = 3.93, -- Battlefield Precision
			[462] = 1.21, -- Azerite Globules
			[495] = 3.87, -- Anduin's Dedication
			[482] = 3.44, -- Thunderous Blast
			[132] = 3.56, -- Packed Ice
			[194] = 3.83, -- Filthy Transfusion
			[20] = 1.65, -- Lifespeed
			[481] = 3.66, -- Incite the Pack
			[501] = 4.64, -- Relational Normalization Gizmo
			[82] = 5.47, -- Champion of Azeroth
			[478] = 4.11, -- Tidal Surge
			[461] = 1.29, -- Earthlink
			[561] = 3.23, -- Seductive Power
			[381] = 3.79, -- Frigid Grasp
			[560] = 1.69, -- Bonded Souls
			[576] = 2.45, -- Loyal to the End
			[205] = 0.16, -- Eldritch Warding
			[541] = 1.34, -- Fight or Flight
			[546] = 0.04, -- Quick Thinking
			[379] = 4.06, -- Tunnel of Ice
			[195] = 3.96, -- Secrets of the Deep
			[18] = 1.43, -- Blood Siphon
			[523] = 3.4, -- Apothecary's Concoctions
			[499] = 1.47, -- Ricocheting Inflatable Pyrosaw
			[38] = 1.69, -- On My Way
			[380] = 3.91, -- Whiteout
			[493] = 2.08, -- Last Gift
			[496] = 1.12, -- Stronger Together
			[468] = 0.02, -- Cauterizing Blink
			[44] = 0.07, -- Vampiric Speed
			[483] = 4.36, -- Archive of the Titans
			[105] = 0.12, -- Ephemeral Recovery
			[22] = 1.47, -- Heed My Call
			[503] = 0.07, -- Auto-Self-Cauterizer
			[85] = 0.06, -- Gemhide
			[526] = 6.07, -- Endless Hunger
			[485] = 3.5, -- Laser Matrix
			[15] = 0.24, -- Resounding Protection
			[156] = 2.49, -- Ruinous Bolt
			[100] = 0.18, -- Strength in Numbers
			[14] = 0.04, -- Longstrider
			[569] = 4.89, -- Clockwork Heart
			[192] = 3.38, -- Meticulous Scheming
			[500] = 2.23, -- Synaptic Spark Capacitor
			[575] = 6.44, -- Undulating Tides
			[492] = 3.88, -- Liberator's Might
			[522] = 6.06, -- Ancients' Bulwark
			[86] = 0.05, -- Azerite Fortification
			[83] = 0.02, -- Impassive Visage
			[480] = 3.58, -- Blood Rite
			[87] = 0.08, -- Self Reliance
			[497] = 1.21, -- Stand As One
			[196] = 5.63, -- Swirling Sands
			[459] = 2.53, -- Unstable Flames
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3877 - 4549 (avg 4231), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 3.13, 3.07 }, -- Conflict and Strife
			[5] = { 8.01, 4.25 }, -- Essence of the Focusing Iris
			[6] = { 5.18, 3.09 }, -- Purification Protocol
			[15] = { 3.58, 0 }, -- Ripple in Space
			[23] = { 4.68, 1.21 }, -- Blood of the Enemy
			[4] = { 0, 1.49 }, -- Worldvein Resonance
			[22] = { 4.09, 0.94 }, -- Vision of Perfection
			[27] = { 5.73, 3.77 }, -- Memory of Lucid Dreams
			[14] = { 10, 3.51 }, -- Condensed Life-Force
			[12] = { 6.28, 3.84 }, -- The Crucible of Flame
			[28] = { 3.05, 2.18 }, -- The Unbound Force
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 10, 1, { -- Brewmaster Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1569 - 2596 (avg 1734), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[20] = 1.1, -- Lifespeed
			[238] = 0.14, -- Fit to Burst
			[496] = 0.68, -- Stronger Together
			[30] = 1.9, -- Overwhelming Power
			[479] = 4.52, -- Dagger in the Back
			[13] = 0.16, -- Azerite Empowered
			[505] = 2.79, -- Tradewinds
			[192] = 2.35, -- Meticulous Scheming
			[194] = 5.19, -- Filthy Transfusion
			[492] = 2.34, -- Liberator's Might
			[499] = 2.57, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.49, -- Synaptic Spark Capacitor
			[14] = 0.24, -- Longstrider
			[483] = 3.19, -- Archive of the Titans
			[541] = 1.11, -- Fight or Flight
			[156] = 3.89, -- Ruinous Bolt
			[19] = 0.22, -- Woundbinder
			[494] = 6.45, -- Battlefield Precision
			[504] = 3.07, -- Unstable Catalyst
			[576] = 1.94, -- Loyal to the End
			[561] = 2.37, -- Seductive Power
			[480] = 2.04, -- Blood Rite
			[86] = 0.08, -- Azerite Fortification
			[21] = 1.27, -- Elemental Whirl
			[116] = 1.78, -- Boiling Brew
			[384] = 3.1, -- Elusive Footwork
			[459] = 1.43, -- Unstable Flames
			[43] = 0.09, -- Winds of War
			[87] = 0.09, -- Self Reliance
			[193] = 3.91, -- Blightborne Infusion
			[461] = 1.03, -- Earthlink
			[463] = 0.24, -- Blessed Portents
			[560] = 1.07, -- Bonded Souls
			[22] = 3, -- Heed My Call
			[568] = 0.03, -- Person-Computer Interface
			[498] = 4.1, -- Barrage Of Many Bombs
			[383] = 4.28, -- Training of Niuzao
			[566] = 0.17, -- Exit Strategy
			[100] = 0.01, -- Strength in Numbers
			[31] = 3.09, -- Gutripper
			[104] = 0.08, -- Bracing Chill
			[523] = 5.09, -- Apothecary's Concoctions
			[103] = 0.09, -- Concentrated Mending
			[196] = 3.5, -- Swirling Sands
			[481] = 2.64, -- Incite the Pack
			[495] = 2.56, -- Anduin's Dedication
			[195] = 2.81, -- Secrets of the Deep
			[482] = 5.27, -- Thunderous Blast
			[575] = 10, -- Undulating Tides
			[577] = 0.72, -- Arcane Heart
			[521] = 1.92, -- Shadow of Elune
			[89] = 0.14, -- Azerite Veins
			[101] = 0.17, -- Shimmering Haven
			[462] = 2.01, -- Azerite Globules
			[382] = 0.19, -- Straight, No Chaser
			[18] = 1.18, -- Blood Siphon
			[526] = 4, -- Endless Hunger
			[157] = 6.37, -- Rezan's Fury
			[83] = 0.05, -- Impassive Visage
			[497] = 0.82, -- Stand As One
			[85] = 0.08, -- Gemhide
			[502] = 0.02, -- Personal Absorb-o-Tron
			[42] = 0.01, -- Savior
			[470] = 0.17, -- Sweep the Leg
			[478] = 6.22, -- Tidal Surge
			[562] = 4.14, -- Treacherous Covenant
			[98] = 0.06, -- Crystalline Carapace
			[503] = 0.18, -- Auto-Self-Cauterizer
			[522] = 4.03, -- Ancients' Bulwark
			[82] = 3.61, -- Champion of Azeroth
			[501] = 2.8, -- Relational Normalization Gizmo
			[569] = 2.87, -- Clockwork Heart
			[38] = 1.14, -- On My Way
			[485] = 5.51, -- Laser Matrix
			[493] = 1.6, -- Last Gift
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1491 - 1806 (avg 1669), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[3] = { 1.81, 1.89 }, -- Sphere of Suppression
			[2] = { 0.09, 0.07 }, -- Azeroth's Undying Gift
			[4] = { 1.03, 0.69 }, -- Worldvein Resonance
			[12] = { 10, 3.6 }, -- The Crucible of Flame
			[25] = { 0.58, 0.55 }, -- Aegis of the Deep
			[15] = { 3.86, 0.02 }, -- Ripple in Space
			[22] = { 0.03, 0.08 }, -- Vision of Perfection
			[32] = { 1.11, 0.99 }, -- Conflict and Strife
			[13] = { 0, 0.1 }, -- Nullification Dynamo
			[27] = { 0, 0.09 }, -- Memory of Lucid Dreams
			[7] = { 1.89, 0.14 }, -- Anima of Life and Death
		}, 1568019600)

		insertDefaultScalesData(defaultName, 10, 3, { -- Windwalker Monk
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3502 - 4220 (avg 3692), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[156] = 3.61, -- Ruinous Bolt
			[485] = 5.14, -- Laser Matrix
			[19] = 0.02, -- Woundbinder
			[480] = 3.64, -- Blood Rite
			[82] = 6.19, -- Champion of Azeroth
			[569] = 5.21, -- Clockwork Heart
			[391] = 6.01, -- Dance of Chi-Ji
			[526] = 7.32, -- Endless Hunger
			[470] = 0.02, -- Sweep the Leg
			[481] = 3.97, -- Incite the Pack
			[390] = 6.4, -- Pressure Point
			[42] = 0.02, -- Savior
			[501] = 4.85, -- Relational Normalization Gizmo
			[576] = 3.11, -- Loyal to the End
			[496] = 1.22, -- Stronger Together
			[117] = 10, -- Fury of Xuen
			[20] = 1.73, -- Lifespeed
			[479] = 6.31, -- Dagger in the Back
			[22] = 2.56, -- Heed My Call
			[192] = 4.28, -- Meticulous Scheming
			[84] = 0.06, -- Bulwark of the Masses
			[493] = 2.71, -- Last Gift
			[575] = 9.33, -- Undulating Tides
			[461] = 1.27, -- Earthlink
			[196] = 6.04, -- Swirling Sands
			[38] = 2.26, -- On My Way
			[193] = 6.97, -- Blightborne Infusion
			[184] = 5.37, -- Sunrise Technique
			[478] = 6.37, -- Tidal Surge
			[498] = 3.59, -- Barrage Of Many Bombs
			[504] = 5.03, -- Unstable Catalyst
			[505] = 4.58, -- Tradewinds
			[523] = 5.12, -- Apothecary's Concoctions
			[577] = 1.42, -- Arcane Heart
			[459] = 2.46, -- Unstable Flames
			[566] = 0.02, -- Exit Strategy
			[561] = 3.54, -- Seductive Power
			[521] = 3.85, -- Shadow of Elune
			[560] = 1.39, -- Bonded Souls
			[462] = 1.45, -- Azerite Globules
			[30] = 3.06, -- Overwhelming Power
			[157] = 6.1, -- Rezan's Fury
			[562] = 7.08, -- Treacherous Covenant
			[388] = 6.36, -- Glory of the Dawn
			[18] = 1.69, -- Blood Siphon
			[522] = 7.62, -- Ancients' Bulwark
			[483] = 4.57, -- Archive of the Titans
			[31] = 2.57, -- Gutripper
			[500] = 3.31, -- Synaptic Spark Capacitor
			[98] = 0.09, -- Crystalline Carapace
			[495] = 4.12, -- Anduin's Dedication
			[492] = 3.6, -- Liberator's Might
			[497] = 1.21, -- Stand As One
			[494] = 5.71, -- Battlefield Precision
			[389] = 7.39, -- Open Palm Strikes
			[482] = 4.77, -- Thunderous Blast
			[194] = 4.73, -- Filthy Transfusion
			[15] = 0.04, -- Resounding Protection
			[195] = 4.43, -- Secrets of the Deep
			[541] = 1.52, -- Fight or Flight
			[499] = 2.57, -- Ricocheting Inflatable Pyrosaw
			[21] = 2.21, -- Elemental Whirl
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2956 - 3908 (avg 3611), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 5.96, 2.04 }, -- The Crucible of Flame
			[15] = { 2.68, 0.02 }, -- Ripple in Space
			[5] = { 5.66, 1.64 }, -- Essence of the Focusing Iris
			[32] = { 10, 1.16 }, -- Conflict and Strife
			[6] = { 4.02, 1.73 }, -- Purification Protocol
			[23] = { 3.35, 0.32 }, -- Blood of the Enemy
			[28] = { 2.05, 0.87 }, -- The Unbound Force
			[4] = { 1.01, 0.59 }, -- Worldvein Resonance
			[22] = { 0.68, 0.66 }, -- Vision of Perfection
			[14] = { 5.48, 1.84 }, -- Condensed Life-Force
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 2, 2, { -- Protection Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5002 - 5799 (avg 5349), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[569] = 4.35, -- Clockwork Heart
			[85] = 0.15, -- Gemhide
			[496] = 1.16, -- Stronger Together
			[125] = 3.03, -- Avenger's Might
			[560] = 1.77, -- Bonded Souls
			[462] = 1.88, -- Azerite Globules
			[44] = 0.1, -- Vampiric Speed
			[31] = 2.84, -- Gutripper
			[235] = 3.04, -- Indomitable Justice
			[505] = 3.1, -- Tradewinds
			[30] = 3.13, -- Overwhelming Power
			[492] = 3.76, -- Liberator's Might
			[194] = 4.88, -- Filthy Transfusion
			[234] = 1.45, -- Inner Light
			[504] = 3.98, -- Unstable Catalyst
			[20] = 1.75, -- Lifespeed
			[481] = 3.02, -- Incite the Pack
			[500] = 3.44, -- Synaptic Spark Capacitor
			[480] = 3.59, -- Blood Rite
			[471] = 0.01, -- Gallant Steed
			[193] = 6.18, -- Blightborne Infusion
			[561] = 3.02, -- Seductive Power
			[499] = 2.38, -- Ricocheting Inflatable Pyrosaw
			[89] = 0.12, -- Azerite Veins
			[22] = 2.88, -- Heed My Call
			[195] = 3.64, -- Secrets of the Deep
			[99] = 0.29, -- Ablative Shielding
			[538] = 0.06, -- Empyreal Ward
			[189] = 0.02, -- Righteous Conviction
			[156] = 3.43, -- Ruinous Bolt
			[38] = 1.84, -- On My Way
			[576] = 2.32, -- Loyal to the End
			[503] = 0.02, -- Auto-Self-Cauterizer
			[206] = 0.01, -- Stalwart Protector
			[495] = 3.46, -- Anduin's Dedication
			[42] = 0.09, -- Savior
			[18] = 1.22, -- Blood Siphon
			[395] = 8.74, -- Inspiring Vanguard
			[497] = 0.79, -- Stand As One
			[493] = 1.84, -- Last Gift
			[577] = 1.67, -- Arcane Heart
			[21] = 1.8, -- Elemental Whirl
			[196] = 5.51, -- Swirling Sands
			[526] = 6.03, -- Endless Hunger
			[133] = 0.09, -- Bulwark of Light
			[157] = 6.16, -- Rezan's Fury
			[483] = 3.84, -- Archive of the Titans
			[522] = 5.77, -- Ancients' Bulwark
			[82] = 5.16, -- Champion of Azeroth
			[523] = 5.19, -- Apothecary's Concoctions
			[459] = 2.16, -- Unstable Flames
			[498] = 4.08, -- Barrage Of Many Bombs
			[478] = 6.23, -- Tidal Surge
			[103] = 0.12, -- Concentrated Mending
			[521] = 3.58, -- Shadow of Elune
			[461] = 1.28, -- Earthlink
			[485] = 5.55, -- Laser Matrix
			[479] = 4.33, -- Dagger in the Back
			[501] = 4.46, -- Relational Normalization Gizmo
			[494] = 6.24, -- Battlefield Precision
			[192] = 4.66, -- Meticulous Scheming
			[482] = 4.98, -- Thunderous Blast
			[562] = 5.43, -- Treacherous Covenant
			[150] = 1.4, -- Soaring Shield
			[541] = 1.21, -- Fight or Flight
			[575] = 10, -- Undulating Tides
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4513 - 6082 (avg 5314), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 1.91, 1.99 }, -- Conflict and Strife
			[3] = { 4.15, 3.91 }, -- Sphere of Suppression
			[7] = { 2.16, 0 }, -- Anima of Life and Death
			[2] = { 0.02, 0 }, -- Azeroth's Undying Gift
			[4] = { 1.09, 1.1 }, -- Worldvein Resonance
			[15] = { 2.82, 0.14 }, -- Ripple in Space
			[22] = { 3.06, 1.09 }, -- Vision of Perfection
			[27] = { 0.84, 0.43 }, -- Memory of Lucid Dreams
			[25] = { 0.93, 1.03 }, -- Aegis of the Deep
			[12] = { 10, 3.65 }, -- The Crucible of Flame
		}, 1568019600)

		insertDefaultScalesData(defaultName, 2, 3, { -- Retribution Paladin
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3877 - 4654 (avg 4175), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[568] = 0.05, -- Person-Computer Interface
			[561] = 2.88, -- Seductive Power
			[538] = 0.03, -- Empyreal Ward
			[105] = 0.04, -- Ephemeral Recovery
			[453] = 5.21, -- Empyrean Power
			[396] = 10, -- Light's Decree
			[103] = 0.06, -- Concentrated Mending
			[492] = 3.29, -- Liberator's Might
			[84] = 0.15, -- Bulwark of the Masses
			[44] = 0.07, -- Vampiric Speed
			[22] = 1.99, -- Heed My Call
			[481] = 3.26, -- Incite the Pack
			[498] = 2.65, -- Barrage Of Many Bombs
			[156] = 2.63, -- Ruinous Bolt
			[541] = 1.04, -- Fight or Flight
			[30] = 3.14, -- Overwhelming Power
			[505] = 3.54, -- Tradewinds
			[501] = 4.18, -- Relational Normalization Gizmo
			[459] = 1.7, -- Unstable Flames
			[479] = 4.54, -- Dagger in the Back
			[157] = 4.25, -- Rezan's Fury
			[496] = 1.13, -- Stronger Together
			[19] = 0.12, -- Woundbinder
			[495] = 3.27, -- Anduin's Dedication
			[500] = 2.35, -- Synaptic Spark Capacitor
			[576] = 2.57, -- Loyal to the End
			[154] = 5.42, -- Relentless Inquisitor
			[196] = 4.16, -- Swirling Sands
			[480] = 3.41, -- Blood Rite
			[560] = 1.88, -- Bonded Souls
			[462] = 1.2, -- Azerite Globules
			[192] = 4.16, -- Meticulous Scheming
			[14] = 0.01, -- Longstrider
			[82] = 5.32, -- Champion of Azeroth
			[206] = 0.09, -- Stalwart Protector
			[99] = 0.4, -- Ablative Shielding
			[31] = 2.06, -- Gutripper
			[478] = 4.09, -- Tidal Surge
			[195] = 3.18, -- Secrets of the Deep
			[42] = 0.11, -- Savior
			[522] = 5.34, -- Ancients' Bulwark
			[562] = 5.04, -- Treacherous Covenant
			[497] = 0.85, -- Stand As One
			[18] = 1.45, -- Blood Siphon
			[187] = 5.49, -- Expurgation
			[393] = 0.08, -- Grace of the Justicar
			[494] = 4.15, -- Battlefield Precision
			[577] = 1.75, -- Arcane Heart
			[521] = 3.46, -- Shadow of Elune
			[235] = 3.53, -- Indomitable Justice
			[20] = 1.85, -- Lifespeed
			[125] = 4.22, -- Avenger's Might
			[38] = 1.67, -- On My Way
			[454] = 0.02, -- Judicious Defense
			[461] = 1.12, -- Earthlink
			[493] = 1.83, -- Last Gift
			[499] = 1.78, -- Ricocheting Inflatable Pyrosaw
			[482] = 3.43, -- Thunderous Blast
			[15] = 0.21, -- Resounding Protection
			[194] = 3.46, -- Filthy Transfusion
			[193] = 5.05, -- Blightborne Infusion
			[504] = 3.5, -- Unstable Catalyst
			[43] = 0.12, -- Winds of War
			[483] = 3.47, -- Archive of the Titans
			[21] = 1.87, -- Elemental Whirl
			[503] = 0.03, -- Auto-Self-Cauterizer
			[85] = 0.13, -- Gemhide
			[526] = 5.48, -- Endless Hunger
			[98] = 0.06, -- Crystalline Carapace
			[485] = 3.83, -- Laser Matrix
			[523] = 3.44, -- Apothecary's Concoctions
			[575] = 6.62, -- Undulating Tides
			[569] = 3.71, -- Clockwork Heart
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3739 - 4566 (avg 4127), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 1.45, 1.16 }, -- Worldvein Resonance
			[6] = { 6.03, 2.68 }, -- Purification Protocol
			[22] = { 9.49, 3.36 }, -- Vision of Perfection
			[32] = { 2.43, 2.42 }, -- Conflict and Strife
			[14] = { 8.74, 3.2 }, -- Condensed Life-Force
			[27] = { 4.92, 3.39 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.75 }, -- Essence of the Focusing Iris
			[23] = { 4.09, 0.6 }, -- Blood of the Enemy
			[28] = { 3.08, 1.38 }, -- The Unbound Force
			[12] = { 8.37, 3.36 }, -- The Crucible of Flame
			[15] = { 0, 0.08 }, -- Ripple in Space
		}, 1568019600)

		insertDefaultScalesData(defaultName, 4, 1, { -- Assassination Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3129 - 4138 (avg 3446), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[192] = 4.94, -- Meticulous Scheming
			[497] = 1.35, -- Stand As One
			[22] = 2.78, -- Heed My Call
			[31] = 3.2, -- Gutripper
			[499] = 2.66, -- Ricocheting Inflatable Pyrosaw
			[217] = 0.22, -- Footpad
			[498] = 3.98, -- Barrage Of Many Bombs
			[42] = 0.28, -- Savior
			[193] = 9.33, -- Blightborne Infusion
			[577] = 3.35, -- Arcane Heart
			[83] = 0.26, -- Impassive Visage
			[249] = 10, -- Nothing Personal
			[156] = 3.54, -- Ruinous Bolt
			[103] = 0.14, -- Concentrated Mending
			[99] = 0.23, -- Ablative Shielding
			[196] = 8.64, -- Swirling Sands
			[157] = 6.2, -- Rezan's Fury
			[495] = 5.48, -- Anduin's Dedication
			[181] = 7.02, -- Twist the Knife
			[505] = 5.88, -- Tradewinds
			[85] = 0.33, -- Gemhide
			[478] = 6.17, -- Tidal Surge
			[569] = 6.25, -- Clockwork Heart
			[496] = 1.83, -- Stronger Together
			[479] = 6.35, -- Dagger in the Back
			[492] = 5.62, -- Liberator's Might
			[406] = 3.88, -- Scent of Blood
			[561] = 4.58, -- Seductive Power
			[575] = 9.7, -- Undulating Tides
			[560] = 2.64, -- Bonded Souls
			[30] = 4.91, -- Overwhelming Power
			[483] = 5.95, -- Archive of the Titans
			[89] = 0.24, -- Azerite Veins
			[461] = 2.16, -- Earthlink
			[44] = 0.37, -- Vampiric Speed
			[15] = 0.31, -- Resounding Protection
			[568] = 0.03, -- Person-Computer Interface
			[482] = 5.34, -- Thunderous Blast
			[523] = 5.06, -- Apothecary's Concoctions
			[43] = 0.22, -- Winds of War
			[548] = 0.21, -- Lying In Wait
			[105] = 0.11, -- Ephemeral Recovery
			[87] = 0.47, -- Self Reliance
			[522] = 8.37, -- Ancients' Bulwark
			[463] = 0.18, -- Blessed Portents
			[195] = 5.26, -- Secrets of the Deep
			[19] = 0.2, -- Woundbinder
			[38] = 2.53, -- On My Way
			[501] = 6.54, -- Relational Normalization Gizmo
			[502] = 0.1, -- Personal Absorb-o-Tron
			[481] = 5.4, -- Incite the Pack
			[13] = 0.15, -- Azerite Empowered
			[86] = 0.11, -- Azerite Fortification
			[503] = 0.23, -- Auto-Self-Cauterizer
			[136] = 8.74, -- Double Dose
			[20] = 2.72, -- Lifespeed
			[562] = 8.2, -- Treacherous Covenant
			[14] = 0.32, -- Longstrider
			[541] = 2.19, -- Fight or Flight
			[18] = 2.36, -- Blood Siphon
			[526] = 8.38, -- Endless Hunger
			[485] = 5.42, -- Laser Matrix
			[521] = 5.27, -- Shadow of Elune
			[100] = 0.4, -- Strength in Numbers
			[500] = 3.65, -- Synaptic Spark Capacitor
			[407] = 0.29, -- Echoing Blades
			[194] = 5.12, -- Filthy Transfusion
			[462] = 1.9, -- Azerite Globules
			[504] = 6.58, -- Unstable Catalyst
			[480] = 5.53, -- Blood Rite
			[576] = 4.22, -- Loyal to the End
			[82] = 7.81, -- Champion of Azeroth
			[459] = 3.17, -- Unstable Flames
			[494] = 6.43, -- Battlefield Precision
			[21] = 2.82, -- Elemental Whirl
			[493] = 3.45, -- Last Gift
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2149 - 3878 (avg 3306), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[5] = { 7.85, 2.94 }, -- Essence of the Focusing Iris
			[15] = { 3.59, 0 }, -- Ripple in Space
			[6] = { 4.74, 1.98 }, -- Purification Protocol
			[28] = { 3.6, 1.63 }, -- The Unbound Force
			[4] = { 1.66, 0.98 }, -- Worldvein Resonance
			[12] = { 6.63, 2.42 }, -- The Crucible of Flame
			[32] = { 1.96, 1.85 }, -- Conflict and Strife
			[27] = { 10, 3.82 }, -- Memory of Lucid Dreams
			[14] = { 6.52, 2.26 }, -- Condensed Life-Force
			[23] = { 6.4, 1.33 }, -- Blood of the Enemy
		}, 1568019600)

		insertDefaultScalesData(defaultName, 4, 2, { -- Outlaw Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 9180 - 12329 (avg 10019), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[239] = 3.83, -- Snake Eyes
			[101] = 0.02, -- Shimmering Haven
			[503] = 0.03, -- Auto-Self-Cauterizer
			[98] = 0.03, -- Crystalline Carapace
			[86] = 0.12, -- Azerite Fortification
			[499] = 2.25, -- Ricocheting Inflatable Pyrosaw
			[15] = 0.11, -- Resounding Protection
			[526] = 7.07, -- Endless Hunger
			[473] = 0.03, -- Shrouded Mantle
			[521] = 4.49, -- Shadow of Elune
			[459] = 2.03, -- Unstable Flames
			[495] = 4.33, -- Anduin's Dedication
			[523] = 5.31, -- Apothecary's Concoctions
			[180] = 4.04, -- Keep Your Wits About You
			[481] = 3.3, -- Incite the Pack
			[192] = 5.39, -- Meticulous Scheming
			[568] = 0.16, -- Person-Computer Interface
			[42] = 0.07, -- Savior
			[576] = 2.26, -- Loyal to the End
			[522] = 7.35, -- Ancients' Bulwark
			[21] = 1.93, -- Elemental Whirl
			[496] = 1.27, -- Stronger Together
			[485] = 5.81, -- Laser Matrix
			[541] = 1.58, -- Fight or Flight
			[577] = 1.93, -- Arcane Heart
			[30] = 4.29, -- Overwhelming Power
			[483] = 4.73, -- Archive of the Titans
			[193] = 6.13, -- Blightborne Infusion
			[20] = 2.08, -- Lifespeed
			[461] = 1.62, -- Earthlink
			[196] = 5.53, -- Swirling Sands
			[411] = 8.13, -- Ace Up Your Sleeve
			[478] = 5.9, -- Tidal Surge
			[480] = 4.59, -- Blood Rite
			[561] = 3.73, -- Seductive Power
			[562] = 6.52, -- Treacherous Covenant
			[560] = 2.33, -- Bonded Souls
			[569] = 5.01, -- Clockwork Heart
			[575] = 10, -- Undulating Tides
			[493] = 1.76, -- Last Gift
			[129] = 6.72, -- Deadshot
			[462] = 1.84, -- Azerite Globules
			[500] = 3.25, -- Synaptic Spark Capacitor
			[498] = 4.02, -- Barrage Of Many Bombs
			[494] = 6.33, -- Battlefield Precision
			[446] = 7.25, -- Brigand's Blitz
			[492] = 4.09, -- Liberator's Might
			[38] = 1.98, -- On My Way
			[18] = 1.24, -- Blood Siphon
			[19] = 0.04, -- Woundbinder
			[31] = 2.9, -- Gutripper
			[410] = 3.58, -- Paradise Lost
			[89] = 0.01, -- Azerite Veins
			[82] = 6.17, -- Champion of Azeroth
			[501] = 5.29, -- Relational Normalization Gizmo
			[103] = 0.02, -- Concentrated Mending
			[482] = 5.15, -- Thunderous Blast
			[157] = 6.36, -- Rezan's Fury
			[479] = 6.84, -- Dagger in the Back
			[105] = 0.07, -- Ephemeral Recovery
			[504] = 4.77, -- Unstable Catalyst
			[22] = 2.74, -- Heed My Call
			[505] = 3.64, -- Tradewinds
			[497] = 0.86, -- Stand As One
			[195] = 4.16, -- Secrets of the Deep
			[194] = 4.69, -- Filthy Transfusion
			[156] = 3.75, -- Ruinous Bolt
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 8548 - 10441 (avg 9640), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 5.68, 2.5 }, -- Vision of Perfection
			[5] = { 9.53, 3.72 }, -- Essence of the Focusing Iris
			[14] = { 9.48, 3.33 }, -- Condensed Life-Force
			[12] = { 10, 3.59 }, -- The Crucible of Flame
			[23] = { 3.32, 0.95 }, -- Blood of the Enemy
			[28] = { 3.44, 1.05 }, -- The Unbound Force
			[4] = { 1.45, 1.2 }, -- Worldvein Resonance
			[27] = { 8.16, 6.14 }, -- Memory of Lucid Dreams
			[32] = { 2.37, 2.3 }, -- Conflict and Strife
			[15] = { 4.21, 0.06 }, -- Ripple in Space
			[6] = { 6.87, 2.82 }, -- Purification Protocol
		}, 1568019600)

		insertDefaultScalesData(defaultName, 4, 3, { -- Subtlety Rogue
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5025 - 6280 (avg 5633), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[561] = 1.98, -- Seductive Power
			[499] = 1.17, -- Ricocheting Inflatable Pyrosaw
			[523] = 2.63, -- Apothecary's Concoctions
			[503] = 0.02, -- Auto-Self-Cauterizer
			[22] = 1.29, -- Heed My Call
			[480] = 2.73, -- Blood Rite
			[445] = 1.69, -- Perforate
			[82] = 3.48, -- Champion of Azeroth
			[100] = 0.05, -- Strength in Numbers
			[196] = 3.82, -- Swirling Sands
			[83] = 0.15, -- Impassive Visage
			[193] = 3.95, -- Blightborne Infusion
			[497] = 0.65, -- Stand As One
			[478] = 3.22, -- Tidal Surge
			[526] = 3.8, -- Endless Hunger
			[505] = 2.18, -- Tradewinds
			[21] = 1.25, -- Elemental Whirl
			[576] = 1.5, -- Loyal to the End
			[498] = 1.98, -- Barrage Of Many Bombs
			[482] = 2.78, -- Thunderous Blast
			[522] = 3.95, -- Ancients' Bulwark
			[492] = 2.48, -- Liberator's Might
			[87] = 0.02, -- Self Reliance
			[20] = 1.19, -- Lifespeed
			[504] = 2.75, -- Unstable Catalyst
			[500] = 2.04, -- Synaptic Spark Capacitor
			[413] = 10, -- The First Dance
			[192] = 2.49, -- Meticulous Scheming
			[495] = 2.48, -- Anduin's Dedication
			[479] = 3.38, -- Dagger in the Back
			[44] = 0.13, -- Vampiric Speed
			[175] = 3.93, -- Night's Vengeance
			[194] = 2.58, -- Filthy Transfusion
			[195] = 2.55, -- Secrets of the Deep
			[485] = 2.79, -- Laser Matrix
			[240] = 3.78, -- Blade In The Shadows
			[124] = 1.53, -- Replicating Shadows
			[104] = 0.07, -- Bracing Chill
			[31] = 1.58, -- Gutripper
			[483] = 2.97, -- Archive of the Titans
			[84] = 0.05, -- Bulwark of the Masses
			[14] = 0.04, -- Longstrider
			[38] = 1.08, -- On My Way
			[414] = 3.91, -- Inevitability
			[568] = 0.04, -- Person-Computer Interface
			[548] = 0.1, -- Lying In Wait
			[42] = 0.15, -- Savior
			[30] = 2.31, -- Overwhelming Power
			[462] = 0.86, -- Azerite Globules
			[157] = 3.21, -- Rezan's Fury
			[560] = 1.24, -- Bonded Souls
			[481] = 1.99, -- Incite the Pack
			[575] = 4.73, -- Undulating Tides
			[562] = 3.86, -- Treacherous Covenant
			[101] = 0.07, -- Shimmering Haven
			[86] = 0.01, -- Azerite Fortification
			[105] = 0.01, -- Ephemeral Recovery
			[496] = 0.91, -- Stronger Together
			[493] = 1.18, -- Last Gift
			[501] = 3.08, -- Relational Normalization Gizmo
			[459] = 1.48, -- Unstable Flames
			[521] = 2.67, -- Shadow of Elune
			[15] = 0.08, -- Resounding Protection
			[577] = 0.86, -- Arcane Heart
			[494] = 3.11, -- Battlefield Precision
			[541] = 0.88, -- Fight or Flight
			[89] = 0.05, -- Azerite Veins
			[569] = 3.72, -- Clockwork Heart
			[156] = 2.06, -- Ruinous Bolt
			[18] = 0.87, -- Blood Siphon
			[461] = 1.09, -- Earthlink
			[19] = 0.04, -- Woundbinder
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4532 - 5803 (avg 5400), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[12] = { 7.38, 2.91 }, -- The Crucible of Flame
			[6] = { 5.28, 2.01 }, -- Purification Protocol
			[4] = { 1.52, 1.05 }, -- Worldvein Resonance
			[22] = { 3.56, 0.96 }, -- Vision of Perfection
			[32] = { 1.88, 1.93 }, -- Conflict and Strife
			[23] = { 4.65, 0.55 }, -- Blood of the Enemy
			[15] = { 3.45, 0 }, -- Ripple in Space
			[5] = { 8.52, 3.46 }, -- Essence of the Focusing Iris
			[14] = { 6.24, 2.38 }, -- Condensed Life-Force
			[28] = { 3.3, 1.43 }, -- The Unbound Force
			[27] = { 10, 6.43 }, -- Memory of Lucid Dreams
		}, 1568019600)

		insertDefaultScalesData(defaultName, 7, 1, { -- Elemental Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3400 - 4484 (avg 3669), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[539] = 0.19, -- Ancient Ankh Talisman
			[499] = 1.53, -- Ricocheting Inflatable Pyrosaw
			[495] = 3.61, -- Anduin's Dedication
			[194] = 3.52, -- Filthy Transfusion
			[492] = 3.87, -- Liberator's Might
			[562] = 5.74, -- Treacherous Covenant
			[38] = 1.65, -- On My Way
			[195] = 3.73, -- Secrets of the Deep
			[501] = 4.14, -- Relational Normalization Gizmo
			[576] = 1.62, -- Loyal to the End
			[104] = 0.07, -- Bracing Chill
			[14] = 0.04, -- Longstrider
			[101] = 0.06, -- Shimmering Haven
			[42] = 0.11, -- Savior
			[83] = 0.14, -- Impassive Visage
			[493] = 1.34, -- Last Gift
			[498] = 2.79, -- Barrage Of Many Bombs
			[485] = 3.74, -- Laser Matrix
			[99] = 0.13, -- Ablative Shielding
			[416] = 6.24, -- Natural Harmony
			[575] = 6.57, -- Undulating Tides
			[478] = 4.17, -- Tidal Surge
			[462] = 1.27, -- Azerite Globules
			[31] = 1.98, -- Gutripper
			[156] = 2.48, -- Ruinous Bolt
			[22] = 2.04, -- Heed My Call
			[105] = 0.04, -- Ephemeral Recovery
			[457] = 10, -- Igneous Potential
			[157] = 4.35, -- Rezan's Fury
			[196] = 5.62, -- Swirling Sands
			[496] = 1.09, -- Stronger Together
			[461] = 1.39, -- Earthlink
			[480] = 3.14, -- Blood Rite
			[577] = 1.83, -- Arcane Heart
			[561] = 3.01, -- Seductive Power
			[30] = 2.95, -- Overwhelming Power
			[100] = 0.04, -- Strength in Numbers
			[20] = 1.74, -- Lifespeed
			[192] = 3.75, -- Meticulous Scheming
			[568] = 0.05, -- Person-Computer Interface
			[504] = 4.34, -- Unstable Catalyst
			[523] = 3.53, -- Apothecary's Concoctions
			[500] = 2.32, -- Synaptic Spark Capacitor
			[560] = 1.77, -- Bonded Souls
			[569] = 3.98, -- Clockwork Heart
			[522] = 5.33, -- Ancients' Bulwark
			[417] = 0.07, -- Tectonic Thunder
			[483] = 4.35, -- Archive of the Titans
			[521] = 3.29, -- Shadow of Elune
			[85] = 0.04, -- Gemhide
			[222] = 2.65, -- Echo of the Elementals
			[207] = 0.03, -- Serene Spirit
			[497] = 1.01, -- Stand As One
			[505] = 2.41, -- Tradewinds
			[178] = 3.74, -- Lava Shock
			[98] = 0.17, -- Crystalline Carapace
			[482] = 3.53, -- Thunderous Blast
			[82] = 5.12, -- Champion of Azeroth
			[193] = 6.4, -- Blightborne Infusion
			[459] = 2.15, -- Unstable Flames
			[21] = 1.71, -- Elemental Whirl
			[541] = 1.43, -- Fight or Flight
			[503] = 0.23, -- Auto-Self-Cauterizer
			[103] = 0.01, -- Concentrated Mending
			[479] = 4.4, -- Dagger in the Back
			[481] = 2.07, -- Incite the Pack
			[13] = 0.06, -- Azerite Empowered
			[526] = 5.31, -- Endless Hunger
			[18] = 0.68, -- Blood Siphon
			[447] = 3.61, -- Ancestral Resonance
			[86] = 0.07, -- Azerite Fortification
			[494] = 3.98, -- Battlefield Precision
			[448] = 3.26, -- Synapse Shock
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3177 - 3865 (avg 3577), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 1.38, 1.08 }, -- Memory of Lucid Dreams
			[5] = { 7.15, 3.09 }, -- Essence of the Focusing Iris
			[32] = { 10, 2 }, -- Conflict and Strife
			[4] = { 0.37, 1.19 }, -- Worldvein Resonance
			[15] = { 2.95, 0 }, -- Ripple in Space
			[22] = { 2.37, 0.06 }, -- Vision of Perfection
			[12] = { 5.69, 2.88 }, -- The Crucible of Flame
			[14] = { 6.73, 2.66 }, -- Condensed Life-Force
			[23] = { 5.21, 0.82 }, -- Blood of the Enemy
			[6] = { 4.19, 2.2 }, -- Purification Protocol
			[28] = { 2.55, 2.34 }, -- The Unbound Force
		}, 1568019600)

		insertDefaultScalesData(defaultName, 7, 2, { -- Enhancement Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 6953 - 9100 (avg 8424), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[179] = 3.43, -- Strength of Earth
			[447] = 5.34, -- Ancestral Resonance
			[103] = 0.04, -- Concentrated Mending
			[496] = 1.06, -- Stronger Together
			[530] = 5.35, -- Thunderaan's Fury
			[482] = 3.18, -- Thunderous Blast
			[193] = 5.11, -- Blightborne Infusion
			[459] = 1.67, -- Unstable Flames
			[498] = 2.71, -- Barrage Of Many Bombs
			[31] = 1.93, -- Gutripper
			[18] = 1.32, -- Blood Siphon
			[499] = 1.39, -- Ricocheting Inflatable Pyrosaw
			[523] = 3.27, -- Apothecary's Concoctions
			[500] = 2.05, -- Synaptic Spark Capacitor
			[83] = 0.13, -- Impassive Visage
			[478] = 3.79, -- Tidal Surge
			[485] = 3.45, -- Laser Matrix
			[575] = 6.33, -- Undulating Tides
			[494] = 3.64, -- Battlefield Precision
			[483] = 3.43, -- Archive of the Titans
			[481] = 3.17, -- Incite the Pack
			[195] = 3.4, -- Secrets of the Deep
			[495] = 3.04, -- Anduin's Dedication
			[42] = 0.06, -- Savior
			[87] = 0.13, -- Self Reliance
			[461] = 1.18, -- Earthlink
			[539] = 0.03, -- Ancient Ankh Talisman
			[569] = 3.78, -- Clockwork Heart
			[82] = 4.7, -- Champion of Azeroth
			[21] = 1.51, -- Elemental Whirl
			[104] = 0.01, -- Bracing Chill
			[576] = 2.26, -- Loyal to the End
			[493] = 1.86, -- Last Gift
			[497] = 0.98, -- Stand As One
			[526] = 4.95, -- Endless Hunger
			[561] = 2.65, -- Seductive Power
			[504] = 3.51, -- Unstable Catalyst
			[192] = 3.85, -- Meticulous Scheming
			[568] = 0.01, -- Person-Computer Interface
			[19] = 0.03, -- Woundbinder
			[521] = 3.18, -- Shadow of Elune
			[156] = 2.24, -- Ruinous Bolt
			[505] = 3.49, -- Tradewinds
			[84] = 0.07, -- Bulwark of the Masses
			[30] = 2.9, -- Overwhelming Power
			[577] = 1.63, -- Arcane Heart
			[20] = 1.42, -- Lifespeed
			[38] = 1.35, -- On My Way
			[492] = 3.14, -- Liberator's Might
			[541] = 1.16, -- Fight or Flight
			[562] = 4.91, -- Treacherous Covenant
			[420] = 10, -- Roiling Storm
			[416] = 6.71, -- Natural Harmony
			[137] = 2.62, -- Primal Primer
			[479] = 3.93, -- Dagger in the Back
			[223] = 2.06, -- Lightning Conduit
			[560] = 1.53, -- Bonded Souls
			[157] = 4, -- Rezan's Fury
			[480] = 3.19, -- Blood Rite
			[196] = 4.41, -- Swirling Sands
			[522] = 5.14, -- Ancients' Bulwark
			[462] = 1.19, -- Azerite Globules
			[99] = 0.01, -- Ablative Shielding
			[22] = 1.66, -- Heed My Call
			[448] = 0.09, -- Synapse Shock
			[501] = 3.76, -- Relational Normalization Gizmo
			[194] = 3.32, -- Filthy Transfusion
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 6447 - 8749 (avg 8110), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[23] = { 8.08, 2.65 }, -- Blood of the Enemy
			[15] = { 3.88, 0.1 }, -- Ripple in Space
			[27] = { 2.36, 1.45 }, -- Memory of Lucid Dreams
			[5] = { 10, 4.13 }, -- Essence of the Focusing Iris
			[4] = { 1.94, 1.26 }, -- Worldvein Resonance
			[14] = { 9.18, 3.33 }, -- Condensed Life-Force
			[32] = { 6.91, 2.62 }, -- Conflict and Strife
			[6] = { 6.3, 3.11 }, -- Purification Protocol
			[12] = { 8.91, 3.68 }, -- The Crucible of Flame
			[28] = { 4.04, 2.22 }, -- The Unbound Force
			[22] = { 1.71, 0.17 }, -- Vision of Perfection
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 7, 3, { -- Restoration Shaman
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2246 - 2858 (avg 2427), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[577] = 1.05, -- Arcane Heart
			[192] = 1.38, -- Meticulous Scheming
			[522] = 3.82, -- Ancients' Bulwark
			[575] = 6.11, -- Undulating Tides
			[15] = 0.07, -- Resounding Protection
			[207] = 0.01, -- Serene Spirit
			[105] = 0.03, -- Ephemeral Recovery
			[87] = 0.09, -- Self Reliance
			[492] = 2.18, -- Liberator's Might
			[191] = 0.01, -- Turn of the Tide
			[13] = 0.04, -- Azerite Empowered
			[193] = 3.33, -- Blightborne Infusion
			[483] = 2.98, -- Archive of the Titans
			[20] = 1.09, -- Lifespeed
			[482] = 3.13, -- Thunderous Blast
			[497] = 0.71, -- Stand As One
			[194] = 3.37, -- Filthy Transfusion
			[98] = 0.12, -- Crystalline Carapace
			[501] = 3.13, -- Relational Normalization Gizmo
			[500] = 2.22, -- Synaptic Spark Capacitor
			[103] = 0.08, -- Concentrated Mending
			[14] = 0.08, -- Longstrider
			[499] = 1.53, -- Ricocheting Inflatable Pyrosaw
			[82] = 2.74, -- Champion of Azeroth
			[504] = 2.91, -- Unstable Catalyst
			[479] = 4.08, -- Dagger in the Back
			[498] = 2.42, -- Barrage Of Many Bombs
			[462] = 1.32, -- Azerite Globules
			[480] = 2.56, -- Blood Rite
			[83] = 0.03, -- Impassive Visage
			[104] = 0.1, -- Bracing Chill
			[43] = 0.02, -- Winds of War
			[448] = 2.52, -- Synapse Shock
			[485] = 3.31, -- Laser Matrix
			[569] = 2.19, -- Clockwork Heart
			[196] = 2.97, -- Swirling Sands
			[576] = 0.02, -- Loyal to the End
			[478] = 3.85, -- Tidal Surge
			[38] = 1.11, -- On My Way
			[541] = 0.92, -- Fight or Flight
			[42] = 0.03, -- Savior
			[461] = 0.87, -- Earthlink
			[562] = 3.92, -- Treacherous Covenant
			[416] = 3.29, -- Natural Harmony
			[85] = 0.01, -- Gemhide
			[496] = 0.68, -- Stronger Together
			[494] = 3.69, -- Battlefield Precision
			[22] = 1.5, -- Heed My Call
			[30] = 2.21, -- Overwhelming Power
			[21] = 0.94, -- Elemental Whirl
			[495] = 2.32, -- Anduin's Dedication
			[138] = 0.04, -- Soothing Waters
			[195] = 2.37, -- Secrets of the Deep
			[102] = 0.08, -- Synergistic Growth
			[447] = 0.99, -- Ancestral Resonance
			[156] = 2.4, -- Ruinous Bolt
			[561] = 2.14, -- Seductive Power
			[523] = 3.24, -- Apothecary's Concoctions
			[457] = 10, -- Igneous Potential
			[526] = 3.83, -- Endless Hunger
			[31] = 1.81, -- Gutripper
			[560] = 1.04, -- Bonded Souls
			[521] = 2.49, -- Shadow of Elune
			[568] = 0.09, -- Person-Computer Interface
			[157] = 3.97, -- Rezan's Fury
			[459] = 1.33, -- Unstable Flames
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2161 - 2548 (avg 2392), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 3.9, 3.87 }, -- Condensed Life-Force
			[28] = { 1.64, 1.76 }, -- The Unbound Force
			[4] = { 0, 1.31 }, -- Worldvein Resonance
			[32] = { 2.26, 2.43 }, -- Conflict and Strife
			[15] = { 3.57, 0 }, -- Ripple in Space
			[6] = { 3.47, 3.42 }, -- Purification Protocol
			[5] = { 3.61, 3.75 }, -- Essence of the Focusing Iris
			[12] = { 10, 5.29 }, -- The Crucible of Flame
			[27] = { 0.08, 0 }, -- Memory of Lucid Dreams
			[23] = { 0.81, 0.69 }, -- Blood of the Enemy
		}, 1568019600)

		insertDefaultScalesData(defaultName, 9, 1, { -- Affliction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3931 - 5207 (avg 4497), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[483] = 4.6, -- Archive of the Titans
			[123] = 6.13, -- Wracking Brilliance
			[194] = 5.45, -- Filthy Transfusion
			[442] = 5.69, -- Pandemic Invocation
			[498] = 3.87, -- Barrage Of Many Bombs
			[522] = 7.21, -- Ancients' Bulwark
			[497] = 1.24, -- Stand As One
			[461] = 1.41, -- Earthlink
			[496] = 1.36, -- Stronger Together
			[523] = 5.01, -- Apothecary's Concoctions
			[459] = 2.23, -- Unstable Flames
			[156] = 3.71, -- Ruinous Bolt
			[462] = 1.82, -- Azerite Globules
			[195] = 4.34, -- Secrets of the Deep
			[575] = 10, -- Undulating Tides
			[480] = 4.58, -- Blood Rite
			[425] = 5.02, -- Sudden Onset
			[531] = 0.12, -- Terror of the Mind
			[505] = 5.58, -- Tradewinds
			[562] = 7.04, -- Treacherous Covenant
			[493] = 3.03, -- Last Gift
			[38] = 1.83, -- On My Way
			[521] = 4.65, -- Shadow of Elune
			[13] = 0.1, -- Azerite Empowered
			[18] = 2.14, -- Blood Siphon
			[20] = 2.58, -- Lifespeed
			[426] = 6.69, -- Dreadful Calling
			[183] = 7.31, -- Inevitable Demise
			[499] = 2.4, -- Ricocheting Inflatable Pyrosaw
			[576] = 3.96, -- Loyal to the End
			[230] = 7.26, -- Cascading Calamity
			[501] = 5.85, -- Relational Normalization Gizmo
			[30] = 4.69, -- Overwhelming Power
			[526] = 7.16, -- Endless Hunger
			[577] = 1.75, -- Arcane Heart
			[193] = 7.47, -- Blightborne Infusion
			[504] = 4.88, -- Unstable Catalyst
			[494] = 6.65, -- Battlefield Precision
			[541] = 1.35, -- Fight or Flight
			[196] = 6.52, -- Swirling Sands
			[478] = 6.11, -- Tidal Surge
			[492] = 4.62, -- Liberator's Might
			[21] = 2.5, -- Elemental Whirl
			[495] = 4.27, -- Anduin's Dedication
			[569] = 4.72, -- Clockwork Heart
			[479] = 6.59, -- Dagger in the Back
			[31] = 3.01, -- Gutripper
			[82] = 7, -- Champion of Azeroth
			[157] = 6.34, -- Rezan's Fury
			[560] = 2.5, -- Bonded Souls
			[485] = 5.58, -- Laser Matrix
			[19] = 0.03, -- Woundbinder
			[22] = 2.65, -- Heed My Call
			[482] = 5.35, -- Thunderous Blast
			[561] = 3.61, -- Seductive Power
			[481] = 5.3, -- Incite the Pack
			[500] = 3.15, -- Synaptic Spark Capacitor
			[192] = 5.62, -- Meticulous Scheming
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2733 - 5501 (avg 4437), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[14] = { 7.5, 2.81 }, -- Condensed Life-Force
			[12] = { 7.68, 2.85 }, -- The Crucible of Flame
			[5] = { 10, 3.29 }, -- Essence of the Focusing Iris
			[23] = { 5.79, 0.96 }, -- Blood of the Enemy
			[28] = { 3.8, 1.73 }, -- The Unbound Force
			[4] = { 0.67, 0.81 }, -- Worldvein Resonance
			[22] = { 0.56, 2.49 }, -- Vision of Perfection
			[27] = { 3.02, 1.24 }, -- Memory of Lucid Dreams
			[6] = { 5.73, 2.42 }, -- Purification Protocol
			[15] = { 3.33, 0 }, -- Ripple in Space
			[32] = { 1.84, 1.76 }, -- Conflict and Strife
		}, 1568019600)

		insertDefaultScalesData(defaultName, 9, 2, { -- Demonology Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2939 - 4512 (avg 3406), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[500] = 2.74, -- Synaptic Spark Capacitor
			[31] = 2.2, -- Gutripper
			[526] = 6.65, -- Endless Hunger
			[504] = 4.57, -- Unstable Catalyst
			[104] = 0.07, -- Bracing Chill
			[14] = 0.09, -- Longstrider
			[495] = 4.03, -- Anduin's Dedication
			[196] = 5.09, -- Swirling Sands
			[493] = 2.63, -- Last Gift
			[531] = 0.14, -- Terror of the Mind
			[130] = 2.67, -- Shadow's Bite
			[157] = 4.74, -- Rezan's Fury
			[463] = 0.08, -- Blessed Portents
			[18] = 1.79, -- Blood Siphon
			[496] = 1.37, -- Stronger Together
			[485] = 3.85, -- Laser Matrix
			[103] = 0.1, -- Concentrated Mending
			[22] = 1.91, -- Heed My Call
			[429] = 10, -- Baleful Invocation
			[568] = 0.18, -- Person-Computer Interface
			[503] = 0.05, -- Auto-Self-Cauterizer
			[481] = 4.27, -- Incite the Pack
			[523] = 3.85, -- Apothecary's Concoctions
			[105] = 0.07, -- Ephemeral Recovery
			[193] = 6.3, -- Blightborne Infusion
			[498] = 2.98, -- Barrage Of Many Bombs
			[492] = 4.55, -- Liberator's Might
			[569] = 5.59, -- Clockwork Heart
			[501] = 5.48, -- Relational Normalization Gizmo
			[21] = 2.37, -- Elemental Whirl
			[577] = 0.48, -- Arcane Heart
			[575] = 7.26, -- Undulating Tides
			[194] = 4.1, -- Filthy Transfusion
			[521] = 4.98, -- Shadow of Elune
			[89] = 0.23, -- Azerite Veins
			[497] = 1.04, -- Stand As One
			[560] = 2.1, -- Bonded Souls
			[428] = 4.38, -- Demonic Meteor
			[541] = 1.3, -- Fight or Flight
			[480] = 4.71, -- Blood Rite
			[505] = 4.7, -- Tradewinds
			[38] = 1.67, -- On My Way
			[494] = 3.28, -- Battlefield Precision
			[462] = 1.25, -- Azerite Globules
			[499] = 1.86, -- Ricocheting Inflatable Pyrosaw
			[561] = 3.32, -- Seductive Power
			[44] = 0.06, -- Vampiric Speed
			[82] = 5.67, -- Champion of Azeroth
			[576] = 3.04, -- Loyal to the End
			[20] = 1.42, -- Lifespeed
			[101] = 0.01, -- Shimmering Haven
			[99] = 0.05, -- Ablative Shielding
			[195] = 4.26, -- Secrets of the Deep
			[479] = 4.89, -- Dagger in the Back
			[482] = 3.79, -- Thunderous Blast
			[562] = 6.22, -- Treacherous Covenant
			[190] = 3.82, -- Umbral Blaze
			[156] = 2.94, -- Ruinous Bolt
			[478] = 4.89, -- Tidal Surge
			[458] = 3.54, -- Supreme Commander
			[502] = 0.15, -- Personal Absorb-o-Tron
			[192] = 5.05, -- Meticulous Scheming
			[100] = 0.02, -- Strength in Numbers
			[461] = 1.31, -- Earthlink
			[522] = 6.33, -- Ancients' Bulwark
			[30] = 4.18, -- Overwhelming Power
			[459] = 2.49, -- Unstable Flames
			[83] = 0.12, -- Impassive Visage
			[15] = 0.08, -- Resounding Protection
			[483] = 4.43, -- Archive of the Titans
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 2927 - 4522 (avg 3446), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 6.12, 2.07 }, -- Vision of Perfection
			[14] = { 8.99, 3.38 }, -- Condensed Life-Force
			[23] = { 6.43, 0.63 }, -- Blood of the Enemy
			[28] = { 3.45, 1.54 }, -- The Unbound Force
			[6] = { 5.37, 2.8 }, -- Purification Protocol
			[4] = { 1.72, 1.58 }, -- Worldvein Resonance
			[12] = { 7.12, 3.76 }, -- The Crucible of Flame
			[15] = { 3.8, 0.1 }, -- Ripple in Space
			[27] = { 4.91, 3.21 }, -- Memory of Lucid Dreams
			[5] = { 10, 3.78 }, -- Essence of the Focusing Iris
			[32] = { 2.94, 2.92 }, -- Conflict and Strife
		}, 1568019600)

		insertDefaultScalesData(defaultName, 9, 3, { -- Destruction Warlock
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5473 - 6611 (avg 5861), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[30] = 5.37, -- Overwhelming Power
			[575] = 10, -- Undulating Tides
			[208] = 0.17, -- Lifeblood
			[157] = 6.35, -- Rezan's Fury
			[89] = 0.4, -- Azerite Veins
			[98] = 0.16, -- Crystalline Carapace
			[526] = 8.4, -- Endless Hunger
			[561] = 4.66, -- Seductive Power
			[18] = 2.87, -- Blood Siphon
			[461] = 1.67, -- Earthlink
			[480] = 5.55, -- Blood Rite
			[568] = 0.32, -- Person-Computer Interface
			[31] = 3.1, -- Gutripper
			[569] = 4.78, -- Clockwork Heart
			[577] = 2.63, -- Arcane Heart
			[541] = 2.05, -- Fight or Flight
			[44] = 0.31, -- Vampiric Speed
			[576] = 4.29, -- Loyal to the End
			[562] = 7.79, -- Treacherous Covenant
			[501] = 6.97, -- Relational Normalization Gizmo
			[43] = 0.33, -- Winds of War
			[498] = 4.08, -- Barrage Of Many Bombs
			[482] = 5.29, -- Thunderous Blast
			[492] = 5.2, -- Liberator's Might
			[499] = 2.54, -- Ricocheting Inflatable Pyrosaw
			[500] = 3.38, -- Synaptic Spark Capacitor
			[19] = 0.32, -- Woundbinder
			[99] = 0.14, -- Ablative Shielding
			[475] = 0.27, -- Desperate Power
			[101] = 0.18, -- Shimmering Haven
			[431] = 0.31, -- Rolling Havoc
			[459] = 3.47, -- Unstable Flames
			[85] = 0.22, -- Gemhide
			[521] = 5.98, -- Shadow of Elune
			[193] = 8.95, -- Blightborne Infusion
			[503] = 0.05, -- Auto-Self-Cauterizer
			[87] = 0.22, -- Self Reliance
			[194] = 5.52, -- Filthy Transfusion
			[131] = 6.87, -- Chaos Shards
			[105] = 0.37, -- Ephemeral Recovery
			[156] = 3.72, -- Ruinous Bolt
			[493] = 3.43, -- Last Gift
			[192] = 6.27, -- Meticulous Scheming
			[22] = 2.86, -- Heed My Call
			[495] = 5.13, -- Anduin's Dedication
			[483] = 5.75, -- Archive of the Titans
			[463] = 0.16, -- Blessed Portents
			[432] = 6.82, -- Chaotic Inferno
			[505] = 6.23, -- Tradewinds
			[86] = 0.19, -- Azerite Fortification
			[496] = 1.85, -- Stronger Together
			[523] = 5.36, -- Apothecary's Concoctions
			[21] = 2.96, -- Elemental Whirl
			[84] = 0.23, -- Bulwark of the Masses
			[103] = 0.2, -- Concentrated Mending
			[494] = 5.63, -- Battlefield Precision
			[502] = 0.22, -- Personal Absorb-o-Tron
			[485] = 5.69, -- Laser Matrix
			[478] = 6.13, -- Tidal Surge
			[15] = 0.36, -- Resounding Protection
			[104] = 0.32, -- Bracing Chill
			[522] = 8.41, -- Ancients' Bulwark
			[444] = 5.99, -- Crashing Chaos
			[497] = 1.32, -- Stand As One
			[481] = 5.6, -- Incite the Pack
			[196] = 8.04, -- Swirling Sands
			[460] = 6.51, -- Bursting Flare
			[560] = 2.58, -- Bonded Souls
			[531] = 0.2, -- Terror of the Mind
			[83] = 0.29, -- Impassive Visage
			[479] = 6.78, -- Dagger in the Back
			[462] = 2.03, -- Azerite Globules
			[38] = 2.49, -- On My Way
			[195] = 5.29, -- Secrets of the Deep
			[82] = 7.65, -- Champion of Azeroth
			[100] = 0.47, -- Strength in Numbers
			[232] = 6.89, -- Flashpoint
			[504] = 5.65, -- Unstable Catalyst
			[14] = 0.21, -- Longstrider
			[20] = 2.53, -- Lifespeed
			[13] = 0.17, -- Azerite Empowered
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3662 - 7554 (avg 5734), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.15, 2.23 }, -- Conflict and Strife
			[4] = { 0.45, 1.36 }, -- Worldvein Resonance
			[6] = { 4.41, 2.42 }, -- Purification Protocol
			[28] = { 2.09, 1.46 }, -- The Unbound Force
			[22] = { 9.99, 3.95 }, -- Vision of Perfection
			[15] = { 2.75, 0.07 }, -- Ripple in Space
			[27] = { 10, 2.63 }, -- Memory of Lucid Dreams
			[5] = { 7.79, 3.53 }, -- Essence of the Focusing Iris
			[14] = { 6.73, 2.64 }, -- Condensed Life-Force
			[12] = { 5.55, 2.77 }, -- The Crucible of Flame
			[23] = { 3.33, 0.7 }, -- Blood of the Enemy
		}, 1568019600)

		insertDefaultScalesData(defaultName, 1, 1, { -- Arms Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3314 - 4199 (avg 3561), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 6.16, -- Relational Normalization Gizmo
			[479] = 6, -- Dagger in the Back
			[433] = 4.14, -- Seismic Wave
			[504] = 5.18, -- Unstable Catalyst
			[193] = 9.48, -- Blightborne Infusion
			[194] = 4.75, -- Filthy Transfusion
			[101] = 0.27, -- Shimmering Haven
			[89] = 0.3, -- Azerite Veins
			[476] = 0.29, -- Moment of Glory
			[84] = 0.22, -- Bulwark of the Masses
			[85] = 0.45, -- Gemhide
			[195] = 4.95, -- Secrets of the Deep
			[505] = 5.8, -- Tradewinds
			[196] = 8.43, -- Swirling Sands
			[459] = 3.41, -- Unstable Flames
			[157] = 5.69, -- Rezan's Fury
			[481] = 5.52, -- Incite the Pack
			[434] = 8.64, -- Crushing Assault
			[435] = 4.44, -- Lord of War
			[521] = 4.74, -- Shadow of Elune
			[14] = 0.62, -- Longstrider
			[526] = 8.5, -- Endless Hunger
			[156] = 2.85, -- Ruinous Bolt
			[15] = 0.12, -- Resounding Protection
			[44] = 0.05, -- Vampiric Speed
			[13] = 0.33, -- Azerite Empowered
			[522] = 8.28, -- Ancients' Bulwark
			[482] = 4.93, -- Thunderous Blast
			[192] = 6.05, -- Meticulous Scheming
			[576] = 4.4, -- Loyal to the End
			[498] = 3.78, -- Barrage Of Many Bombs
			[541] = 2.16, -- Fight or Flight
			[554] = 0.33, -- Intimidating Presence
			[480] = 5.13, -- Blood Rite
			[500] = 2.98, -- Synaptic Spark Capacitor
			[22] = 2.74, -- Heed My Call
			[561] = 4.35, -- Seductive Power
			[121] = 5.94, -- Striking the Anvil
			[83] = 0.36, -- Impassive Visage
			[20] = 2.63, -- Lifespeed
			[562] = 7.21, -- Treacherous Covenant
			[30] = 5.14, -- Overwhelming Power
			[495] = 4.83, -- Anduin's Dedication
			[42] = 0.15, -- Savior
			[99] = 0.23, -- Ablative Shielding
			[461] = 1.98, -- Earthlink
			[43] = 0.22, -- Winds of War
			[21] = 3, -- Elemental Whirl
			[523] = 4.48, -- Apothecary's Concoctions
			[493] = 3.42, -- Last Gift
			[31] = 3.05, -- Gutripper
			[494] = 5.71, -- Battlefield Precision
			[82] = 8.36, -- Champion of Azeroth
			[463] = 0.13, -- Blessed Portents
			[496] = 1.78, -- Stronger Together
			[104] = 0.46, -- Bracing Chill
			[105] = 0.02, -- Ephemeral Recovery
			[492] = 5.29, -- Liberator's Might
			[462] = 1.85, -- Azerite Globules
			[478] = 5.53, -- Tidal Surge
			[103] = 0.39, -- Concentrated Mending
			[503] = 0.47, -- Auto-Self-Cauterizer
			[568] = 0.29, -- Person-Computer Interface
			[575] = 8.98, -- Undulating Tides
			[100] = 0.46, -- Strength in Numbers
			[502] = 0.43, -- Personal Absorb-o-Tron
			[226] = 10, -- Test of Might
			[19] = 0.18, -- Woundbinder
			[569] = 6.63, -- Clockwork Heart
			[86] = 0.12, -- Azerite Fortification
			[485] = 5.2, -- Laser Matrix
			[577] = 2.87, -- Arcane Heart
			[499] = 2.35, -- Ricocheting Inflatable Pyrosaw
			[38] = 2.48, -- On My Way
			[560] = 2.47, -- Bonded Souls
			[87] = 0.09, -- Self Reliance
			[477] = 0.52, -- Bury the Hatchet
			[98] = 0.37, -- Crystalline Carapace
			[497] = 1.25, -- Stand As One
			[18] = 2.59, -- Blood Siphon
			[174] = 5.13, -- Gathering Storm
			[483] = 5.59, -- Archive of the Titans
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3267 - 3938 (avg 3570), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[28] = { 4.69, 2.61 }, -- The Unbound Force
			[5] = { 10, 4.28 }, -- Essence of the Focusing Iris
			[23] = { 6.03, 1.15 }, -- Blood of the Enemy
			[15] = { 4.54, 0.16 }, -- Ripple in Space
			[27] = { 7.76, 4.85 }, -- Memory of Lucid Dreams
			[32] = { 2.93, 2.87 }, -- Conflict and Strife
			[6] = { 6.18, 2.89 }, -- Purification Protocol
			[14] = { 8.69, 3.29 }, -- Condensed Life-Force
			[4] = { 1.72, 1.53 }, -- Worldvein Resonance
			[22] = { 0.26, 0.28 }, -- Vision of Perfection
			[12] = { 8.93, 3.37 }, -- The Crucible of Flame
		}, 1568019600)

		insertDefaultScalesData(defaultName, 1, 2, { -- Fury Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4641 - 5463 (avg 4947), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[501] = 5.33, -- Relational Normalization Gizmo
			[498] = 3.82, -- Barrage Of Many Bombs
			[31] = 2.75, -- Gutripper
			[459] = 2.7, -- Unstable Flames
			[494] = 6.25, -- Battlefield Precision
			[481] = 4.48, -- Incite the Pack
			[560] = 3.43, -- Bonded Souls
			[504] = 3.86, -- Unstable Catalyst
			[568] = 0.05, -- Person-Computer Interface
			[492] = 4.87, -- Liberator's Might
			[30] = 6.15, -- Overwhelming Power
			[193] = 7.27, -- Blightborne Infusion
			[479] = 5, -- Dagger in the Back
			[229] = 4.57, -- Pulverizing Blows
			[499] = 2.46, -- Ricocheting Inflatable Pyrosaw
			[483] = 3.95, -- Archive of the Titans
			[82] = 8.84, -- Champion of Azeroth
			[495] = 3.39, -- Anduin's Dedication
			[176] = 8.57, -- Cold Steel, Hot Blood
			[575] = 10, -- Undulating Tides
			[478] = 5.09, -- Tidal Surge
			[496] = 1.59, -- Stronger Together
			[451] = 4.27, -- Infinite Fury
			[192] = 6.49, -- Meticulous Scheming
			[497] = 0.88, -- Stand As One
			[505] = 4.92, -- Tradewinds
			[21] = 2.49, -- Elemental Whirl
			[526] = 7.6, -- Endless Hunger
			[523] = 3.56, -- Apothecary's Concoctions
			[195] = 3.23, -- Secrets of the Deep
			[482] = 5.29, -- Thunderous Blast
			[196] = 6.52, -- Swirling Sands
			[157] = 5.93, -- Rezan's Fury
			[503] = 0.01, -- Auto-Self-Cauterizer
			[480] = 5, -- Blood Rite
			[194] = 4.68, -- Filthy Transfusion
			[18] = 1.69, -- Blood Siphon
			[461] = 1.05, -- Earthlink
			[569] = 6.62, -- Clockwork Heart
			[541] = 1.26, -- Fight or Flight
			[437] = 6.19, -- Simmering Rage
			[462] = 1.69, -- Azerite Globules
			[576] = 3.66, -- Loyal to the End
			[562] = 5.55, -- Treacherous Covenant
			[119] = 7.4, -- Unbridled Ferocity
			[561] = 3.32, -- Seductive Power
			[438] = 6.19, -- Reckless Flurry
			[156] = 2.9, -- Ruinous Bolt
			[22] = 2.53, -- Heed My Call
			[521] = 4.95, -- Shadow of Elune
			[500] = 2.45, -- Synaptic Spark Capacitor
			[38] = 2.01, -- On My Way
			[20] = 3.44, -- Lifespeed
			[522] = 7.67, -- Ancients' Bulwark
			[485] = 5.66, -- Laser Matrix
			[493] = 2.79, -- Last Gift
			[577] = 2.27, -- Arcane Heart
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4544 - 5348 (avg 4892), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[4] = { 0, 0.87 }, -- Worldvein Resonance
			[27] = { 8.52, 2.86 }, -- Memory of Lucid Dreams
			[5] = { 10, 5.31 }, -- Essence of the Focusing Iris
			[23] = { 4.43, 1.83 }, -- Blood of the Enemy
			[28] = { 2.89, 1.67 }, -- The Unbound Force
			[32] = { 2.47, 2.51 }, -- Conflict and Strife
			[12] = { 6.89, 3.92 }, -- The Crucible of Flame
			[14] = { 9.8, 3.78 }, -- Condensed Life-Force
			[6] = { 5.7, 3.14 }, -- Purification Protocol
			[15] = { 2.19, 0 }, -- Ripple in Space
			[22] = { 2.4, 0.43 }, -- Vision of Perfection
		}, 1568019600)

		insertDefaultScalesData(offensiveName, 1, 3, { -- Protection Warrior
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 3905 - 5154 (avg 4317), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[101] = 0.08, -- Shimmering Haven
			[450] = 4.26, -- Brace for Impact
			[479] = 4.05, -- Dagger in the Back
			[194] = 5.32, -- Filthy Transfusion
			[498] = 4.01, -- Barrage Of Many Bombs
			[237] = 4.9, -- Bastion of Might
			[30] = 3.41, -- Overwhelming Power
			[195] = 3.52, -- Secrets of the Deep
			[562] = 5.63, -- Treacherous Covenant
			[575] = 10, -- Undulating Tides
			[13] = 0.09, -- Azerite Empowered
			[476] = 0.08, -- Moment of Glory
			[19] = 0.04, -- Woundbinder
			[440] = 1.24, -- Callous Reprisal
			[495] = 3.52, -- Anduin's Dedication
			[193] = 6.74, -- Blightborne Infusion
			[522] = 6.1, -- Ancients' Bulwark
			[526] = 5.98, -- Endless Hunger
			[569] = 4.96, -- Clockwork Heart
			[42] = 0.25, -- Savior
			[499] = 2.42, -- Ricocheting Inflatable Pyrosaw
			[31] = 3.05, -- Gutripper
			[561] = 3.23, -- Seductive Power
			[523] = 4.62, -- Apothecary's Concoctions
			[505] = 3.56, -- Tradewinds
			[482] = 5.14, -- Thunderous Blast
			[462] = 1.74, -- Azerite Globules
			[478] = 5.65, -- Tidal Surge
			[82] = 5.59, -- Champion of Azeroth
			[20] = 1.4, -- Lifespeed
			[157] = 6.17, -- Rezan's Fury
			[576] = 2.45, -- Loyal to the End
			[103] = 0.08, -- Concentrated Mending
			[480] = 3.41, -- Blood Rite
			[494] = 5.94, -- Battlefield Precision
			[483] = 3.83, -- Archive of the Titans
			[504] = 4.14, -- Unstable Catalyst
			[21] = 1.78, -- Elemental Whirl
			[492] = 3.67, -- Liberator's Might
			[459] = 2.25, -- Unstable Flames
			[441] = 2.28, -- Iron Fortress
			[196] = 6.16, -- Swirling Sands
			[22] = 2.86, -- Heed My Call
			[118] = 1.88, -- Deafening Crash
			[577] = 1.45, -- Arcane Heart
			[156] = 3.36, -- Ruinous Bolt
			[521] = 3.23, -- Shadow of Elune
			[496] = 1.22, -- Stronger Together
			[192] = 4.37, -- Meticulous Scheming
			[560] = 1.79, -- Bonded Souls
			[18] = 1.17, -- Blood Siphon
			[493] = 2.08, -- Last Gift
			[541] = 1.16, -- Fight or Flight
			[38] = 1.53, -- On My Way
			[497] = 1.07, -- Stand As One
			[485] = 5.73, -- Laser Matrix
			[501] = 4.46, -- Relational Normalization Gizmo
			[461] = 1.18, -- Earthlink
			[481] = 3.5, -- Incite the Pack
			[500] = 2.96, -- Synaptic Spark Capacitor
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4025 - 4504 (avg 4273), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Damage per Second,  Scaling: Linear 0 - 10, Precision: 2
			[32] = { 2.23, 2.29 }, -- Conflict and Strife
			[27] = { 1, 0.51 }, -- Memory of Lucid Dreams
			[7] = { 2.81, 0 }, -- Anima of Life and Death
			[25] = { 0.87, 0.95 }, -- Aegis of the Deep
			[4] = { 1.04, 0.99 }, -- Worldvein Resonance
			[3] = { 4.26, 4.34 }, -- Sphere of Suppression
			[12] = { 10, 4.15 }, -- The Crucible of Flame
			[15] = { 4, 0 }, -- Ripple in Space
			[22] = { 5.24, 3.06 }, -- Vision of Perfection
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 12, 2, { -- Vengeance Demon Hunter (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1173 - 1443 (avg 1329), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[89] = 0.78, -- Azerite Veins
			[568] = 1.91, -- Person-Computer Interface
			[202] = 5.17, -- Soulmonger
			[355] = 0.66, -- Essence Sever
			[499] = 0.97, -- Ricocheting Inflatable Pyrosaw
			[85] = 2.68, -- Gemhide
			[192] = 3.34, -- Meticulous Scheming
			[19] = 4.87, -- Woundbinder
			[105] = 2.58, -- Ephemeral Recovery
			[481] = 2.38, -- Incite the Pack
			[194] = 1.54, -- Filthy Transfusion
			[15] = 3.41, -- Resounding Protection
			[494] = 10, -- Battlefield Precision
			[569] = 0.31, -- Clockwork Heart
			[21] = 1.93, -- Elemental Whirl
			[195] = 0.91, -- Secrets of the Deep
			[503] = 1.89, -- Auto-Self-Cauterizer
			[134] = 6.8, -- Revel in Pain
			[521] = 1.09, -- Shadow of Elune
			[44] = 0.4, -- Vampiric Speed
			[483] = 0.71, -- Archive of the Titans
			[459] = 0.6, -- Unstable Flames
			[522] = 1.96, -- Ancients' Bulwark
			[492] = 2.3, -- Liberator's Might
			[496] = 2.09, -- Stronger Together
			[103] = 2.01, -- Concentrated Mending
			[575] = 0.13, -- Undulating Tides
			[480] = 1.27, -- Blood Rite
			[30] = 0.3, -- Overwhelming Power
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1260 - 1455 (avg 1341), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[22] = { 0, 5.19 }, -- Vision of Perfection
			[32] = { 10, 0 }, -- Conflict and Strife
			[15] = { 6.52, 0 }, -- Ripple in Space
			[7] = { 0, 2.65 }, -- Anima of Life and Death
			[13] = { 4.27, 0 }, -- Nullification Dynamo
			[27] = { 8.2, 0 }, -- Memory of Lucid Dreams
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 11, 3, { -- Guardian Druid (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 973 - 1226 (avg 1116), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[360] = 5.12, -- Gory Regeneration
			[18] = 3.08, -- Blood Siphon
			[43] = 1.44, -- Winds of War
			[459] = 5.59, -- Unstable Flames
			[493] = 10, -- Last Gift
			[492] = 4.01, -- Liberator's Might
			[569] = 9.58, -- Clockwork Heart
			[483] = 5.69, -- Archive of the Titans
			[478] = 3.6, -- Tidal Surge
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1032 - 1339 (avg 1136), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[25] = { 10, 0 }, -- Aegis of the Deep
			[27] = { 6.51, 0 }, -- Memory of Lucid Dreams
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 10, 1, { -- Brewmaster Monk (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1497 - 1721 (avg 1614), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[38] = 0.07, -- On My Way
			[44] = 1.21, -- Vampiric Speed
			[568] = 5.63, -- Person-Computer Interface
			[503] = 10, -- Auto-Self-Cauterizer
			[82] = 3.51, -- Champion of Azeroth
			[505] = 6.97, -- Tradewinds
			[502] = 2.48, -- Personal Absorb-o-Tron
			[31] = 5.81, -- Gutripper
			[22] = 6.83, -- Heed My Call
			[99] = 2.83, -- Ablative Shielding
			[523] = 1.13, -- Apothecary's Concoctions
			[463] = 6.55, -- Blessed Portents
			[481] = 5.3, -- Incite the Pack
			[470] = 3.5, -- Sweep the Leg
			[480] = 7.77, -- Blood Rite
			[575] = 4.93, -- Undulating Tides
			[383] = 3.2, -- Training of Niuzao
			[89] = 4.79, -- Azerite Veins
			[196] = 4.6, -- Swirling Sands
			[496] = 1.6, -- Stronger Together
			[156] = 0.42, -- Ruinous Bolt
			[382] = 2.36, -- Straight, No Chaser
			[105] = 3.94, -- Ephemeral Recovery
			[459] = 2.72, -- Unstable Flames
			[14] = 4.17, -- Longstrider
			[218] = 0.85, -- Strength of Spirit
			[577] = 4.21, -- Arcane Heart
			[87] = 9.11, -- Self Reliance
			[15] = 3.97, -- Resounding Protection
			[30] = 0.47, -- Overwhelming Power
			[462] = 3.94, -- Azerite Globules
			[104] = 7.46, -- Bracing Chill
			[561] = 4.02, -- Seductive Power
			[18] = 0.81, -- Blood Siphon
			[103] = 1.74, -- Concentrated Mending
			[499] = 0.52, -- Ricocheting Inflatable Pyrosaw
			[157] = 8.1, -- Rezan's Fury
			[501] = 1.52, -- Relational Normalization Gizmo
			[86] = 8.4, -- Azerite Fortification
			[19] = 4.19, -- Woundbinder
			[116] = 4.56, -- Boiling Brew
			[494] = 4.16, -- Battlefield Precision
			[478] = 2.18, -- Tidal Surge
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 1545 - 1753 (avg 1656), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 0, 1.84 }, -- Memory of Lucid Dreams
			[7] = { 3.83, 2.48 }, -- Anima of Life and Death
			[12] = { 10, 0 }, -- The Crucible of Flame
			[3] = { 1.85, 2.52 }, -- Sphere of Suppression
			[4] = { 0, 0.35 }, -- Worldvein Resonance
			[22] = { 0, 1.67 }, -- Vision of Perfection
			[32] = { 0, 6.73 }, -- Conflict and Strife
			[13] = { 0, 4.13 }, -- Nullification Dynamo
			[2] = { 1.21, 1.03 }, -- Azeroth's Undying Gift
			[15] = { 0, 2.86 }, -- Ripple in Space
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 2, 2, { -- Protection Paladin (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5060 - 5612 (avg 5367), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[493] = 1.69, -- Last Gift
			[31] = 5.47, -- Gutripper
			[500] = 8.01, -- Synaptic Spark Capacitor
			[84] = 0.38, -- Bulwark of the Masses
			[494] = 3.69, -- Battlefield Precision
			[30] = 4.03, -- Overwhelming Power
			[541] = 0.03, -- Fight or Flight
			[568] = 3.71, -- Person-Computer Interface
			[83] = 4.82, -- Impassive Visage
			[104] = 3.62, -- Bracing Chill
			[523] = 2.98, -- Apothecary's Concoctions
			[103] = 3.92, -- Concentrated Mending
			[459] = 0.41, -- Unstable Flames
			[86] = 7.61, -- Azerite Fortification
			[501] = 9.68, -- Relational Normalization Gizmo
			[82] = 2.3, -- Champion of Azeroth
			[98] = 0.98, -- Crystalline Carapace
			[44] = 7.41, -- Vampiric Speed
			[561] = 0.18, -- Seductive Power
			[478] = 1.65, -- Tidal Surge
			[19] = 3.33, -- Woundbinder
			[461] = 10, -- Earthlink
			[462] = 1.8, -- Azerite Globules
			[206] = 0.08, -- Stalwart Protector
			[495] = 6.65, -- Anduin's Dedication
			[485] = 0.89, -- Laser Matrix
			[15] = 2.13, -- Resounding Protection
			[22] = 4.1, -- Heed My Call
			[577] = 2.62, -- Arcane Heart
			[43] = 9.84, -- Winds of War
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 5114 - 5610 (avg 5344), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[13] = { 10, 0 }, -- Nullification Dynamo
			[2] = { 0.71, 3.38 }, -- Azeroth's Undying Gift
			[4] = { 0, 1.08 }, -- Worldvein Resonance
			[32] = { 5.19, 0 }, -- Conflict and Strife
			[15] = { 0, 2.43 }, -- Ripple in Space
			[7] = { 2.68, 0 }, -- Anima of Life and Death
			[3] = { 0.62, 0 }, -- Sphere of Suppression
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 1, 3, { -- Protection Warrior (TMI)
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4186 - 4736 (avg 4447), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[493] = 8.26, -- Last Gift
			[192] = 3.42, -- Meticulous Scheming
			[85] = 0.39, -- Gemhide
			[479] = 3.68, -- Dagger in the Back
			[196] = 1.54, -- Swirling Sands
			[98] = 2.24, -- Crystalline Carapace
			[30] = 10, -- Overwhelming Power
			[195] = 0.14, -- Secrets of the Deep
		}, { -- Azerite Essences
			-- SimulationCraft 820-02 for World of Warcraft 8.2.0 Live (wow build 31429)
			-- Iterations: 4289 - 4625 (avg 4462), Target Error: 0.1, Fight Length: 240 - 360, Fight Style: Patchwerk
			-- Updated: 09.09.2019, Metric: Theck-Meloree-Index,  Scaling: Linear 0 - 10, Precision: 2
			[27] = { 0, 1.24 }, -- Memory of Lucid Dreams
			[25] = { 0, 10 }, -- Aegis of the Deep
			[12] = { 0, 6.07 }, -- The Crucible of Flame
			[22] = { 0, 2.89 }, -- Vision of Perfection
			[7] = { 0, 2.42 }, -- Anima of Life and Death
		}, 1568019600)

		insertDefaultScalesData(defaultName, 5, 3, { -- Shadow Priest
			-- Shadow Priest by WarcraftPriests (https://warcraftpriests.com/)
			-- https://github.com/WarcraftPriests/bfa-shadow-priest/blob/master/azerite-traits/AzeritePowerWeights_AS.md
			-- First Imported: 03.09.2018, Updated: 09.09.2019
			[405] = 5.94,
			[575] = 5.25,
			[193] = 4.33,
			[236] = 4.31,
			[82] = 3.95,
			[522] = 3.94,
			[526] = 3.92,
			[196] = 3.9,
			[562] = 3.56,
			[479] = 3.4,
			[488] = 3.34,
			[192] = 3.27,
			[157] = 3.18,
			[501] = 3.13,
			[569] = 3.13,
			[403] = 2.9,
			[30] = 2.85,
			[505] = 2.74,
			[482] = 2.74,
			[523] = 2.7,
			[194] = 2.67,
			[504] = 2.67,
			[486] = 2.6,
			[478] = 2.58,
			[521] = 2.56,
			[480] = 2.56,
			[481] = 2.53,
			[404] = 2.48,
			[195] = 2.38,
			[489] = 2.31,
			[561] = 2.3,
			[498] = 2.12,
			[577] = 1.86,
			[31] = 1.6,
			[560] = 1.59,
			[156] = 1.54,
			[459] = 1.52,
			[22] = 1.48,
			[487] = 1.45,
			[21] = 1.36,
			[500] = 1.35,
			[499] = 1.28,
			[38] = 1.12,
			[491] = 1.03,
			[166] = 1.02,
			[18] = 1,
			[462] = 0.97,
			[541] = 0.9,
			[490] = 0.86,
			[461] = 0.8,
			[13] = 0.31,
		}, {
		}, 1568019600)

		insertDefaultScalesData(defensiveName, 6, 1, { -- Blood Death Knight
			-- Blood Death Knight by Acherus
			-- https://github.com/ahakola/AzeritePowerWeights/pull/3
			-- First Imported: 07.09.2019, Updated: 07.09.2019
			[560] = 2.25,
			[243] = 2.5,
			[481] = 5.85,
			[196] = 3.81,
			[193] = 4.12,
			[461] = 0.72,
			[496] = 1.05,
			[43] = 0.11,
			[83] = 10,
			[349] = 1,
			[197] = 0.3,
			[495] = 1.99,
			[82] = 6.03,
			[15] = 10,
			[348] = 2,
			[18] = 5.65,
			[526] = 3.6,
			[577] = 0.92,
			[561] = 4.22,
			[30] = 3.86,
			[192] = 5.2,
			[505] = 6.41,
			[501] = 4.85,
			[493] = 3.5,
			[521] = 4.16,
			[497] = 0.9,
			[459] = 1.6,
			[195] = 2.38,
			[201] = 0.04,
			[106] = 3.85,
			[492] = 3.38,
			[21] = 1.77,
			[480] = 3.98,
			[140] = 2.69,
			[485] = 0.06,
			[44] = 3,
			[498] = 0.08,
			[19] = 0.06,
			[504] = 2.8,
			[20] = 2.2,
			[541] = 0.91,
			[562] = 3.78,
			[479] = 0.01,
			[569] = 4.52,
			[522] = 3.34,
			[38] = 0.81,
			[22] = 0.05,
			[576] = 4.35,
			[483] = 3.04,
			[104] = 0.13,
		}, {
			[32] = { 0.71, 3.7 },
			[3] = { 1.2, 0.5 },
			[7] = { 0.7, 0.3 },
			[4] = { 0.69, 0.48 },
			[25] = { 0.36, 2.5 },
			[12] = { 3, 1.7 },
			[2] = { 1.2, 0.03 },
			[22] = { 0.4, 0 },
			[15] = { 0.56, 0 },
			[27] = { 1.5, 0.7 },
		}, 1568019600)


		insertDefaultScalesData(defaultName, 2, 1, { -- Holy Paladin

		}, {})

		insertDefaultScalesData(defaultName, 5, 1, { -- Discipline Priest

		}, {})

		insertDefaultScalesData(defaultName, 5, 2, { -- Holy Priest

		}, {})

		insertDefaultScalesData(defaultName, 7, 3, { -- Restoration Shaman

		}, {})

		insertDefaultScalesData(defaultName, 10, 2, { -- Mistweaver Monk

		}, {})

		insertDefaultScalesData(defaultName, 11, 4, { -- Restoration Druid

		}, {})

		insertDefaultScalesData(offensiveName, 5, 1, { -- Discipline Priest

		}, {})

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
		--print("AzeritePowerWeights", "POPUP JAMMERED!")
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

	--frame.frame:SetToplevel()
	frame.frame:Raise()

	local text = AceGUI:Create("Label")
	text:SetFullWidth(true)
	text:SetFontObject(GameFontHighlight)
	text:SetText(descriptionText)
	text:SetJustifyH("CENTER")
	frame:AddChild(text)

	local topLine = AceGUI:Create("Heading")
	topLine:SetFullWidth(true)
	frame:AddChild(topLine)

	local edit, multiEdit
	if mode == "MassImport" then
		multiEdit = AceGUI:Create("MultiLineEditBox")
		multiEdit:SetFullWidth(true)
		multiEdit:DisableButton(true)
		multiEdit:SetText("")
		multiEdit:SetLabel("")
		multiEdit:SetNumLines(4)
		multiEdit:SetFocus()
		multiEdit:SetCallback("OnEnterPressed", callbackFunction or _closePopUp)
		frame:AddChild(multiEdit)
	else
		edit = AceGUI:Create("EditBox")
		edit:SetFullWidth(true)
		edit:DisableButton(true)
		edit:SetText("")
		edit:SetFocus()
		edit:SetCallback("OnEnterPressed", callbackFunction or _closePopUp)
		frame:AddChild(edit)
	end

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

	elseif mode == "MassImport" then -- Mass Import
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

		multiEdit:SetCallback("OnTextChanged", function(widget, callback, text)
			multiEdit:SetUserData("importString", text)
			accept:SetUserData("importString", text)
		end)
		-- Make sure we get return even if the text doesn't change
		multiEdit:SetUserData("importString", editboxText)
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
	onlyOwnClassCustoms = false,
	importingCanUpdate = true,
	defensivePowers = true,
	rolePowers = true,
	rolePowersNoOffRolePowers = true,
	zonePowers = true,
	professionPowers = false,
	pvpPowers = false,
	addILvlToScore = true,
	scaleByAzeriteEmpowered = false,
	addPrimaryStatToScore = false,
	relativeScore = false,
	showOnlyUpgrades = false,
	showTooltipLegend = false,
	outlineScores = true,
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
local importVersion = 2

-- Score Strings
local reallyBigNumber = 2^31 - 1 -- 2147483647, go over this and errors are thrown
local activeStrings = {} -- Pointers of score strings in use are save in this table
local scoreData = {} -- Current active scales are saved to this table
-- 8.2 Azerite Essences
local essenceScoreData = {}

-- Pointers and Eventframe
local customScales, cfg
local db, lastOpenScale
local playerClassID, playerSpecID
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, event, ...)
end)
f:RegisterEvent("ADDON_LOADED")


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

local traitStack, essenceStack = {}, {}
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
				local scoreCount = 0
				for k, v in pairs(dataSet[4]) do
					scoreData[k] = v
					scoreCount = scoreCount + 1
				end
				traitStack.loading = scoreCount
				-- 8.2 Azerite Essences
				wipe(essenceScoreData)
				local essenceCount = 0
				for k, v in pairs(dataSet[5]) do
					essenceScoreData[k] = v
					essenceCount = essenceCount + 1
				end
				essenceStack.loading = essenceCount
				if AzeritePowerWeights.guiContainer then
					--AzeritePowerWeights.guiContainer:SetStatusText(format(L.WeightEditor_CurrentScale, scaleName))
					AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName))
				end
				return
			end
		end
	else
		return
	end
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

		local fontName, fontHeight, fontFlags = string:GetFont()
		if cfg.outlineScores then
			string:SetFont(fontName, fontHeight, "OUTLINE")
		else
			string:SetFont(fontName, fontHeight, "")
		end

		string:Show()
		string:SetPoint("CENTER", parent)
		string:SetText(text)
		f:SetFrameStrata("HIGH") -- parent:GetFrameStrata() returns MEDIUM after a while for some reason?

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
local function insertCustomScalesData(scaleName, classIndex, specID, powerData, essenceData, scaleMode) -- Insert into table
	local t, e = {}, {}
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

	-- 8.2 Azerite Essences
	if essenceData and essenceData ~= "" then -- String to table
		for _, weight in pairs({ strsplit(",", essenceData) }) do
			local essenceID, valuePair = strsplit("=", strtrim(weight))
			if essenceID and valuePair then
				local majorValue, minorValue = strsplit("/", strtrim(valuePair))
				essenceID = tonumber(essenceID) or nil
				majorValue = tonumber(majorValue) or nil
				minorValue = tonumber(minorValue) or nil

				if essenceID and (majorValue or minorValue) and (majorValue > 0 or minorValue > 0) then
					majorValue = majorValue and (majorValue > reallyBigNumber and reallyBigNumber or majorValue) or 0
					minorValue = minorValue and (minorValue > reallyBigNumber and reallyBigNumber or minorValue) or 0
					e[essenceID] = { majorValue, minorValue }
				end
			end
		end
	end

	local updated = false
	-- Check if we have scale with same name already and update it
	for key, dataSet in ipairs(customScales) do
		if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classIndex and dataSet[3] == specID then
			dataSet[4] = t
			-- 8.2 Azerite Essences
			--dataSet[5] = time() -- Timestamp
			--dataSet[6] = 2 -- Set scaleMode to 2 (Only Imports should update scales)
			dataSet[5] = e
			dataSet[6] = time() -- Timestamp
			dataSet[7] = 2 -- Set scaleMode to 2 (Only Imports should update scales)
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
			t,
			e,
			time(), -- Timestamp
			scaleMode -- Set scaleMode either 1 (Created) or 2 (Imported)
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

		--if (dataSet) then
		if (dataSet) and ((cfg.onlyOwnClassCustoms and classID == playerClassID) or (not cfg.onlyOwnClassCustoms)) then -- Hide custom scales of other classes if enabled
			t[1].children[#t[1].children + 1] = {
				value = "C/"..dataSet[2].."/"..dataSet[3].."/"..dataSet[1],
				text = ("|c%s%s|r"):format(c.colorStr, dataSet[1]),
				icon = iconID
			}
		end
	end

	sort(t[1].children, _customSort)
	tinsert(t[1].children, 1, { -- Make sure Create New/Import is the first item on the list
		value = "AzeritePowerWeightsImport",
		text = U["ScalesList_CreateImportText"],
		icon = 134400
	})

	for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
		local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
		local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])
		local c = _G.RAID_CLASS_COLORS[classTag]

		--local scaleName = AzeritePowerWeights.defaultNameTable[ dataSet[1] ] and classDisplayName .. " - " .. name .. " (" .. dataSet[1] .. ")" or classDisplayName .. " - " .. name
		local scaleName = (AzeritePowerWeights.defaultNameTable[ dataSet[1] ] and AzeritePowerWeights.defaultNameTable[ dataSet[1] ] ~= U["DefaultScaleName_Default"]) and classDisplayName .. " - " .. name .. " (" .. AzeritePowerWeights.defaultNameTable[ dataSet[1] ] .. ")" or classDisplayName .. " - " .. name
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

	local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey, 4) -- Fixes the non-selectable scales if the scalename includes a slash-sign ('/') [Issue #46, https://www.curseforge.com/wow/addons/azeritepowerweights/issues/46]
	--local groupSet, classID, specNum, scaleName = strsplit("/", scaleKey)

	if scaleKey == "AzeritePowerWeightsImport" then -- Create New / Import
		AzeritePowerWeights:CreateImportGroup(AzeritePowerWeights.scalesScroll)
	else -- Scaleset
		classID = tonumber(classID)
		specNum = tonumber(specNum)
	
		if groupSet == "C" then -- Custom Scales

			for _, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					--AzeritePowerWeights:CreateWeightEditorGroup(true, AzeritePowerWeights.scalesScroll, dataSet[1], dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum) -- specNum is actually specID here
					AzeritePowerWeights:CreateWeightEditorGroup(true, AzeritePowerWeights.scalesScroll, dataSet, scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specNum, nil) -- specNum is actually specID here, nil is mode

					break
				end
			end

		elseif groupSet == "D" then -- Default Scales

			for _, dataSet in ipairs(AzeritePowerWeights.defaultScalesData) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specNum then
					local classDisplayName, classTag, classID = GetClassInfo(dataSet[2])
					local specID, name, description, iconID, role, isRecommended, isAllowed = GetSpecializationInfoForClassID(classID, dataSet[3])

					--AzeritePowerWeights:CreateWeightEditorGroup(false, AzeritePowerWeights.scalesScroll, ("%s - %s (%s)"):format(classDisplayName, name, dataSet[1]), dataSet[4], scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID)
					AzeritePowerWeights:CreateWeightEditorGroup(false, AzeritePowerWeights.scalesScroll, dataSet, scaleKey, cfg.specScales[playerSpecID].scaleID == scaleKey, classID, specID, nil) -- nil is mode

					break
				end
			end

		else -- ???
		end
	end

	delayedUpdate()
end

local function _enableScale(powerWeights, essenceWeights, scaleKey)
	wipe(scoreData)
	local scoreCount = 0
	for k, v in pairs(powerWeights) do
		scoreData[k] = v
		scoreCount = scoreCount + 1
	end
	traitStack.loading = scoreCount
	-- 8.2 Azerite Essences
	wipe(essenceScoreData)
	local essenceCount = 0
	for k, v in pairs(essenceWeights) do
		essenceScoreData[k] = v
		essenceCount = essenceCount + 1
	end
	essenceStack.loading = essenceCount

	local groupSet, _, _, scaleName = strsplit("/", scaleKey)
	--AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], scaleName))
	AzeritePowerWeights.guiContainer:SetStatusText(format(U["WeightEditor_CurrentScale"], groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or scaleName) or scaleName))

	cfg.specScales[playerSpecID].scaleID = scaleKey
	cfg.specScales[playerSpecID].scaleName = scaleName
	--cfg.specScales[playerSpecID].scaleName = groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or scaleName) or scaleName
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

local function _exportScale(powerWeights, essenceWeights, scaleName, classID, specID) -- Create export string and show export popup
	local template = "( %s:%d:\"%s\":%d:%d:%s:%s )"
	local t, e = {}, {}
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
	for k, v in pairs(essenceWeights) do
		e[#e + 1] = k.."="..(v[1] or 0).."/"..(v[2] or 0)
	end

	local exportString = format(template, "AzeritePowerWeights", importVersion, scaleName, classID, specID, #t > 0 and " "..strjoin(", ", unpack(t)) or "", #e > 0 and " "..strjoin(", ", unpack(e)) or "")

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	AzeritePowerWeights.CreatePopUp("Export", U["ExportPopup_Title"], format(U["ExportPopup_Desc"], NORMAL_FONT_COLOR_CODE .. scaleName .. FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE), exportString)
end

local importStack = {}
local function _importScale(importMode) -- Show import popup and parse input
	local template = "^%s*%(%s*AzeritePowerWeights%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*:%s*(.+)%s*%)%s*$"
	wipe(importStack)

	local callbackFunction = function(widget, callback, ...)
		local function _saveString(importString, version)
			importStack[#importStack + 1] = ("Version: %s"):format(tostring(version))
			importStack[#importStack + 1] = importString

			if version and version == 1 then
				template = "^%s*%(%s*" .. "AzeritePowerWeights" .. "%s*:%s*(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(%d+)%s*:%s*(%d+)%s*:%s*(.+)%s*%)%s*$"
			end
			local startPos, endPos, stringVersion, scaleName, classID, specID, powerWeights, essenceWeights = strfind(importString, template)

			importStack[#importStack + 1] = ("startPos: %s, endPos: %s, stringVersion: %s, scaleName: %s, classID: %s, specID: %s"):format(tostring(startPos), tostring(endPos), tostring(stringVersion), tostring(scaleName), tostring(classID), tostring(specID))
			importStack[#importStack + 1] = ("powerWeights: %s"):format(tostring(powerWeights))
			importStack[#importStack + 1] = ("essenceWeights: %s"):format(tostring(essenceWeights))

			stringVersion = tonumber(stringVersion) or 0
			scaleName = scaleName or U["ScaleName_Unnamed"]
			powerWeights = powerWeights or ""
			essenceWeights = essenceWeights or ""
			classID = tonumber(classID) or nil
			specID = tonumber(specID) or nil

			if stringVersion == 0 then -- Try to find string version if we didn't find it previously
				startPos, endPos, stringVersion = strfind(importString, "^%s*%(%s*" .. "AzeritePowerWeights" .. "%s*:%s*(%d+)%s*:.*%)%s*$")
				stringVersion = tonumber(stringVersion) or 0

				importStack[#importStack + 1] = ("Fixed stringVersion: %s"):format(tostring(stringVersion))
			end

			if (not cfg.importingCanUpdate) or (version and version > 0) then -- No updating for you, get collision free name
				scaleName = _checkForNameCollisions(scaleName, false, classID, specID)
			end

			if (version and stringVersion < version) or (not version and stringVersion < importVersion) then -- String version is old and not supported
				importStack[#importStack + 1] = ("String version is old: %s / %s / %s"):format(tostring(stringVersion), tostring(importVersion), tostring(version))
				if not version then
					importStack[#importStack + 1] = "-> First retry...\n"
					Print("ERROR: Old or malformed \"Import string\"")
					_saveString(importString, (importVersion - 1))
				elseif version > 1 then
					importStack[#importStack + 1] = "-> Still retrying...\n"
					_saveString(importString, (version - 1))
				else
					importStack[#importStack + 1] = "-> Too old or malformed, can't figure this out...\n> END"
					Print(U["ImportPopup_Error_OldStringVersion"])
				end
			elseif type(classID) ~= "number" or classID < 1 or type(specID) ~= "number" or specID < 1 then -- No class or no spec, this really shouldn't happen ever
				importStack[#importStack + 1] = ("Problem with classID %s or specID %s, bailing out...\n> END"):format(tostring(classID), tostring(specID))
				Print(U["ImportPopup_Error_MalformedString"])
			else -- Everything seems to be OK
				importStack[#importStack + 1] = "Everything seems to be OK"
				local result = insertCustomScalesData(scaleName, classID, specID, powerWeights, essenceWeights, 2) -- Set scaleMode 2 for Imported

				-- Rebuild Tree
				AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
				AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..scaleName)
				AzeritePowerWeights.treeGroup:RefreshTree(true)

				if result then -- Updated old scale
					importStack[#importStack + 1] = "- Updated old scale.\n> END"
					Print(U["ImportPopup_UpdatedScale"], scaleName)
					-- Update the scores just incase if it is the scale actively in use
					_populateWeights()
					delayedUpdate()
				else -- Created new
					importStack[#importStack + 1] = "- Created new scale\n> END"
					Print(U["ImportPopup_CreatedNewScale"], scaleName)
				end
			end
		end

		local input = widget:GetUserData("importString") or ""

		if importMode then
			local t = { strsplit("\r\n", input) }
			if #t > 0 then
				for k, v in pairs(t) do
					if v then -- Let's make sure there is something
						_saveString(v)
					end
				end
			else
				Print(U["ImportPopup_Error_MalformedString"])
			end

		else
			_saveString(input)
		end

		widget.frame:GetParent().obj:Hide()
	end

	--CreatePopUp(mode, titleText, descriptionText, editboxText, callbackFunction)
	if importMode then -- Mass Import
		importStack[#importStack + 1] = "=== MassImport"
		AzeritePowerWeights.CreatePopUp("MassImport", U["ImportPopup_Title"], format(U["ImportPopup_Desc"], NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
	else -- Import
		importStack[#importStack + 1] = "=== Import"
	AzeritePowerWeights.CreatePopUp("Import", U["ImportPopup_Title"], format(U["ImportPopup_Desc"], NORMAL_FONT_COLOR_CODE, FONT_COLOR_CODE_CLOSE, NORMAL_FONT_COLOR_CODE .. _G.ACCEPT .. FONT_COLOR_CODE_CLOSE), "", callbackFunction)
	end
end

local function _createScale() -- Show create popup and parse input
	local callbackFunction = function(widget, callback, ...)
		local classID = widget:GetUserData("classID")
		local specID = widget:GetUserData("specID")
		local nameString = widget:GetUserData("nameString")

		if not nameString or nameString == "" then
			nameString = U["ScaleName_Unnamed"]
		end
		if not classID then
			classID = 1 -- Warrior
			specID = 71 -- Arms
		end

		local scaleName = _checkForNameCollisions(nameString, false, classID, specID)

		if scaleName then
			local result = insertCustomScalesData(scaleName, classID, specID, nil, nil, 1) -- Set scaleMode 1 for Created

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

			local scaleWeights, essenceWeights
			for key, dataSet in ipairs(customScales) do
				if (dataSet) and dataSet[1] == scaleName and dataSet[2] == classID and dataSet[3] == specID then

					dataSet[1] = finalName
					scaleWeights = dataSet[4]
					-- 8.2 Azerite Essences
					essenceWeights = dataSet[5]

					break
				end
			end

			Print(U["RenamePopup_RenamedScale"], scaleName, finalName)

			AzeritePowerWeights.treeGroup.tree = _buildTree(AzeritePowerWeights.treeGroup.tree)
			AzeritePowerWeights.treeGroup:SelectByValue("C/"..classID.."/"..specID.."/"..finalName)
			AzeritePowerWeights.treeGroup:RefreshTree(true)

			if isCurrentScales and scaleWeights then
				_enableScale(scaleWeights, essenceWeights, "C/"..classID.."/"..specID.."/"..finalName)
			end

			-- Check if we have to rename scaleKeys for other tooltips
			for realmName, realmData in pairs(db.char) do
				for charName, charData in pairs(realmData) do
					if charData.tooltipScales and #charData.tooltipScales > 0 then
						for i, tooltipData in ipairs(charData.tooltipScales) do
							if tooltipData.scaleName == scaleName and tooltipData.scaleID == "C/"..classID.."/"..specID.."/"..scaleName then -- Found character with same scale, update scaleKey
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
					_enableScale(dataSet[4], dataSet[5], scaleKey)

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
	version:SetText(" 8.2.12")
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

	local massImportButton = AceGUI:Create("Button")
	massImportButton:SetText("Mass Import")
	massImportButton:SetFullWidth(true)
	massImportButton:SetCallback("OnClick", function()
		-- Call _importScale
		_importScale(true)
	end)
	container:AddChild(massImportButton)

	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = "AzeritePowerWeightsImport"
end

--function AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, titleText, powerWeights, scaleKey, isCurrentScales, classID, specID)
function AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, dataSet, scaleKey, isCurrentScales, classID, specID, mode)
	local classDisplayName = GetClassInfo(dataSet[2])
	local _, specName = GetSpecializationInfoForClassID(classID, dataSet[3])
	local titleText = isCustomScale and dataSet[1] or ("%s - %s (%s)"):format(classDisplayName, specName, dataSet[1])
	local powerWeights = dataSet[4]
	-- 8.2 Azerite Essences
	local essenceWeights = dataSet[5]
	local currentMode = mode or ((_G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown()) and 1 or 0)

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
		_enableScale(powerWeights, essenceWeights, scaleKey)
	end)
	container:AddChild(useButton)

	local exportButton = AceGUI:Create("Button")
	exportButton:SetText(U["WeightEditor_ExportText"])
	exportButton:SetRelativeWidth(.5)
	exportButton:SetCallback("OnClick", function()
		-- Call _exportScale
		_exportScale(powerWeights, essenceWeights, titleText, classID, specID)
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
	--tooltipCheckbox:SetFullWidth(true)
	tooltipCheckbox:SetRelativeWidth(.5)
	tooltipCheckbox:SetValue(false)
	tooltipCheckbox:SetCallback("OnValueChanged", function(widget, callback, checked)
		if checked == true then
			local groupSet, _, _, thisScaleName = strsplit("/", scaleKey)
			cfg.tooltipScales[#cfg.tooltipScales + 1] = {
				scaleID = scaleKey,
				--scaleName = thisScaleName
				scaleName = groupSet == "D" and (AzeritePowerWeights.defaultNameTable[thisScaleName] or thisScaleName) or thisScaleName
			}
		else
			if #cfg.tooltipScales > 0 then
				for i = #cfg.tooltipScales, 1, -1 do -- Just to make sure if for any erroneous reason, there are multiple copies of same scale, they all get removed.
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
			break -- No need to iterate more
		end
	end
	-- Tooltip end

	local modeButton = AceGUI:Create("Button")
	modeButton:SetText(currentMode == 1 and "Change to Traits" or "Change to Essences")
	modeButton:SetRelativeWidth(.5)
	modeButton:SetCallback("OnClick", function()
		-- Change Mode
		AzeritePowerWeights:CreateWeightEditorGroup(isCustomScale, container, dataSet, scaleKey, isCurrentScales, classID, specID, currentMode == 1 and 0 or 1)
	end)
	container:AddChild(modeButton)

	-- Timestamp start
	local timestampText = AceGUI:Create("Label")
	container:AddChild(timestampText)

	local function _updateTimestamp()
		-- dataSet[5] == timestamp
		-- dataSet[6] = scaleMode: 0 = Default/Updated, 1 = Created, 2 = Imported
		-- 8.2 Azerite Essences
		-- timestamp 5->6, scaleMode 6->7
		if dataSet[7] == 1 then
			timestampText:SetText(format("Created %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		elseif dataSet[7] == 2 then
			timestampText:SetText(format("Imported %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		else -- dataSet[6] 0, Default or Updated
			--timestampText:SetText(format(L.WeightEditor_TimestampText_Created, date("%Y.%m.%d %H:%M", (dataSet[5] or 0)))) -- Debug
			timestampText:SetText(format("Updated %s", date("%Y.%m.%d", (dataSet[6] or 0))))
		end
	end

	_updateTimestamp()
	-- Timestamp end

	local spacer = AceGUI:Create("Label")
	spacer:SetText(" \n ")
	spacer:SetFullWidth(true)
	container:AddChild(spacer)

	local isHorde = UnitFactionGroup("player") == "Horde"
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

		-- Update scaleMode and timestamp
		-- 8.2 Azerite Essences
		--dataSet[5] = time()
		--dataSet[6] = 0
		dataSet[6] = time()
		dataSet[7] = 0
		_updateTimestamp()
	end

	local function _saveEssenceValue(widget, callback, text)
		local value = tonumber(text) or 0
		value = value > reallyBigNumber and reallyBigNumber or value
		local pointer = widget:GetUserData("essencePointer")
		local major = widget:GetUserData("essenceMajor")
		-- Save to DB
		essenceWeights[pointer] = essenceWeights[pointer] or {}
		if major then
			essenceWeights[pointer][1] = value
		else
			essenceWeights[pointer][2] = value
		end
		widget:SetText(text == "" and "" or (value and value or ""))
		AceGUI:ClearFocus()

		if isCurrentScales then
			-- Update visible numbers
			essenceScoreData[pointer] = essenceScoreData[pointer] or {}
			if major then
				essenceScoreData[pointer][1] = value
			else
				essenceScoreData[pointer][2] = value
			end
			delayedUpdate()
		end

		-- Update scaleMode and timestamp
		dataSet[6] = time()
		dataSet[7] = 0
		_updateTimestamp()
	end

	if currentMode == 0 then -- _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() or both UIs hidden
		-- Class Powers title
		local classTitle = AceGUI:Create("Heading")
		classTitle:SetText(U["PowersTitles_Class"])
		classTitle:SetFullWidth(true)
		container:AddChild(classTitle)

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
			-- 8.0:
			local startPoint = 1
			local endPoint = 15
			for i = startPoint, endPoint do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
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
			-- Different Zone traits for Alliance and Horde in 8.1
			local tidesStart = isHorde and 18 or 16
			local tidesEnd = isHorde and 19 or 17
			for i = tidesStart, tidesEnd do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
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
			-- 8.2 ->
			for i = 20, #AzeritePowerWeights.sourceData.zone do
				local powerData = AzeritePowerWeights.sourceData.zone[i]
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
			-- 8.0:
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
			-- 8.1:
			for i = 13, #AzeritePowerWeights.sourceData.pvp do
				local powerData = AzeritePowerWeights.sourceData.pvp[i]
				local name = GetSpellInfo(C_AzeriteEmpoweredItem.GetPowerInfo(powerData.azeritePowerID).spellID)
				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  |T%d:18|t %s", powerData.icon, name or powerData.name))
				e[c]:SetText(powerWeights[powerData.azeritePowerID] or "")
				e[c]:SetRelativeWidth(.5)
				if isCustomScale then
					e[c]:SetUserData("dataPointer", AzeritePowerWeights.sourceData.pvp[i].azeritePowerID)
					e[c]:SetCallback("OnEnterPressed", _saveValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		traitStack.editor = #e or 0
	elseif currentMode == 1 then -- _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown()
		local topLine = AceGUI:Create("Heading")
		topLine:SetFullWidth(true)
		container:AddChild(topLine)

		for i, essenceData in ipairs(AzeritePowerWeights.essenceData.common) do
			local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0:3:::64:16:16:64:0:16|t" -- Tank, DPS & Healer
			local essenceTitle = AceGUI:Create("Heading")
			essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
			essenceTitle:SetRelativeWidth(.5)
			container:AddChild(essenceTitle)

			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
			e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
			e[c]:SetRelativeWidth(.25)
			if isCustomScale then
				e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.common[i].essenceID)
				e[c]:SetUserData("essenceMajor", true)
				e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1

			e[c] = AceGUI:Create("EditBox")
			e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
			e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
			e[c]:SetRelativeWidth(.25)
			if isCustomScale then
				e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.common[i].essenceID)
				e[c]:SetUserData("essenceMajor", false)
				e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
			else
				e[c]:SetDisabled(true)
			end
			container:AddChild(e[c])
			c = c + 1
		end

		-- Tank Powers
		if bit.band(roleBits, BIT_TANK) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.tank) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:32:48:0:16|t" -- Tank
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.tank[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.tank[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- Healer Powers
		if bit.band(roleBits, BIT_HEALER) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.healer) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:48:64:0:16|t" -- Healer
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.healer[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.healer[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		-- DPS Powers
		if bit.band(roleBits, BIT_DAMAGER) ~= 0 then
			for i, essenceData in ipairs(AzeritePowerWeights.essenceData.damager) do
				local roleIcon = "|TInterface\\LFGFrame\\LFGRole:0::::64:16:16:32:0:16|t" -- Damager
				local essenceTitle = AceGUI:Create("Heading")
				essenceTitle:SetText(format("|T%d:18|t %s", essenceData.icon, essenceData.name))
				essenceTitle:SetRelativeWidth(.5)
				container:AddChild(essenceTitle)

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Major"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][1] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.damager[i].essenceID)
					e[c]:SetUserData("essenceMajor", true)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1

				e[c] = AceGUI:Create("EditBox")
				e[c]:SetLabel(format("  %s %s", roleIcon, "Minor"))
				e[c]:SetText(essenceWeights[essenceData.essenceID] and essenceWeights[essenceData.essenceID][2] or "")
				e[c]:SetRelativeWidth(.25)
				if isCustomScale then
					e[c]:SetUserData("essencePointer", AzeritePowerWeights.essenceData.damager[i].essenceID)
					e[c]:SetUserData("essenceMajor", false)
					e[c]:SetCallback("OnEnterPressed", _saveEssenceValue)
				else
					e[c]:SetDisabled(true)
				end
				container:AddChild(e[c])
				c = c + 1
			end
		end
		essenceStack.editor = #e or 0
	end
	
	local line = AceGUI:Create("Heading")
	line:SetFullWidth(true)
	container:AddChild(line)

	lastOpenScale = scaleKey
end

local function _toggleEditorUI()
	if not AzeritePowerWeights.guiContainer then return end

	AzeritePowerWeights.guiContainer:ClearAllPoints()
	if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
		AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
		AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)
	elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then
		AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEssenceUI, "TOPRIGHT", 10, 0)
		AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEssenceUI, "BOTTOMRIGHT", 10, 0)
	else
		AzeritePowerWeights.guiContainer:SetPoint("CENTER", _G.UIParent)
	end

	if AzeritePowerWeights.guiContainer:IsShown() then
		AzeritePowerWeights.guiContainer:Hide()
	else
		AzeritePowerWeights.guiContainer:Show()
	end
end

-- Hook and Init functions
local function _setupStringAndEnableButton() -- Move string and enableButton between AzeriteEmpoweredItemUI and AzeriteEssenceUI
	C_Timer.After(0, function() -- Fire on next frame instead of current frame
		if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
			AzeritePowerWeights.frame:SetParent(_G.AzeriteEmpoweredItemUI)

			if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -50)
			else -- ElvUI etc. who hides Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -10)
			end

			AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
			AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame) -- Fix enableButton hiding behind AzeriteEmpoweredItemUI elements with ElvUI if the AzeriteUI skinning is disabled.
		elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then
			AzeritePowerWeights.frame:SetParent(_G.AzeriteEssenceUI)

			if ElvUI and ElvUI[3] and ElvUI[3].skins and ElvUI[3].skins.blizzard and ElvUI[3].skins.blizzard.AzeriteEssence then -- ElvUI etc. who hides Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEssenceUI.LeftInset, 10, -10)
			else -- Default UI etc. who show Portrait
				AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEssenceUI.LeftInset, 10, -50)
			end

			AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEssenceUI, "BOTTOMLEFT", 10, 10)
			AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEssenceUI.LeftInset)
		else
			AzeritePowerWeights.frame:Hide()
			AzeritePowerWeights.enableButton.frame:Hide()

			return
		end
		AzeritePowerWeights.frame:Show()
		AzeritePowerWeights.enableButton.frame:Show()
	end)
end

function f:HookAzeriteUI() -- Set Parents and Anchors
	if not playerSpecID then return end -- No playerSpecID yet, return
	self:InitUI()

	--[[
	if _G.AzeriteEmpoweredItemUIPortrait:IsShown() then -- Default UI etc. who show Portrait
		AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -50)
	else -- ElvUI etc. who hides Portrait
		AzeritePowerWeights.string:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame, 10, -10)
	end
	AzeritePowerWeights.frame:Show()

	AzeritePowerWeights.enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
	AzeritePowerWeights.enableButton.frame:SetParent(_G.AzeriteEmpoweredItemUI.ClipFrame.BackgroundFrame) -- Fix enableButton hiding behind AzeriteEmpoweredItemUI elements with ElvUI if the AzeriteUI skinning is disabled.
	AzeritePowerWeights.enableButton.frame:Show()
	]]
	_setupStringAndEnableButton()

	_G.AzeriteEmpoweredItemUI:HookScript("OnHide", function() -- Hide strings on frame hide
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if AzeritePowerWeights.guiContainer then
			AzeritePowerWeights.scalesScroll:ReleaseChildren()
			lastOpenScale = nil
			f:RefreshConfig()

			AzeritePowerWeights.guiContainer:Hide()
		end
	end)
end

function f:HookAzeriteEssenceUI() -- Set Parents and Anchors for the 8.2 AzeriteEssenceUI
	if not playerSpecID then return end -- No playerSpecID yet, return
	self:InitUI()

	_setupStringAndEnableButton()

	_G.AzeriteEssenceUI:HookScript("OnHide", function() -- Hide strings on frame hide
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		if AzeritePowerWeights.guiContainer then
			AzeritePowerWeights.scalesScroll:ReleaseChildren()
			lastOpenScale = nil
			f:RefreshConfig()

			AzeritePowerWeights.guiContainer:Hide()
		end
	end)
end

local initDone
function f:InitUI() -- Build UI and set up some initial data
	if initDone then return end
	initDone = true


	local frame = CreateFrame("Frame")
	frame:Hide()
	AzeritePowerWeights.frame = frame

	local string = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	string:SetJustifyH("LEFT")
	string:SetJustifyV("TOP")
	string:SetText("")
	AzeritePowerWeights.string = string

	-- Enable Button
	local enableButton = AceGUI:Create("Button")
	--enableButton:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMLEFT", 10, 10)
	enableButton:SetText(U["Weights"])
	enableButton:SetAutoWidth(true)
	enableButton:SetCallback("OnClick", _toggleEditorUI)
	AzeritePowerWeights.enableButton = enableButton

	-- Editor GUI
	AzeritePowerWeights.guiContainer = AzeritePowerWeights.CreateUI()
	--AzeritePowerWeights.guiContainer:SetPoint("TOPLEFT", _G.AzeriteEmpoweredItemUI, "TOPRIGHT", 10, 0)
	--AzeritePowerWeights.guiContainer:SetPoint("BOTTOMLEFT", _G.AzeriteEmpoweredItemUI, "BOTTOMRIGHT", 10, 0)

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
		_activeSpec()
	end
	-- Populate scoreData
	_populateWeights()
end

function f:UpdateValues() -- Update scores
	lock = nil
	if not (_G.AzeriteEmpoweredItemUI or _G.AzeriteEssenceUI) then return end

	if _G.AzeriteEmpoweredItemUI and _G.AzeriteEmpoweredItemUI:IsShown() then
		local currentScore, currentPotential, maxScore, currentLevel, maxLevel, midTrait = 0, 0, 0, 0, 0, 0
		local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
		if azeriteItemLocation then
			currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
		end

		-- Update score strings and calculate current score
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		traitStack.scoreData = traitStack.scoreData or {}
		wipe(traitStack.scoreData)

		local container = _G.AzeriteEmpoweredItemUI.ClipFrame.PowerContainerFrame
		local children = { container:GetChildren() }
		local frameTmp = "> Frames:"
		for _, frame in ipairs(children) do
			if frame and frame:IsShown() then

				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(frame.azeritePowerID)
				if powerInfo then
					score = scoreData[powerInfo.azeritePowerID] or scoreData[powerInfo.spellID] or 0
				end

				if frame.isSelected == true then
					currentScore = currentScore + score

					if powerInfo.azeritePowerID == 13 then -- Middle
						midTrait = midTrait + 1
					end
				end

				if currentLevel < frame.unlockLevel then
					score = GRAY_FONT_COLOR_CODE .. score .. FONT_COLOR_CODE_CLOSE
				end

				if not C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(frame.azeritePowerID, playerSpecID) then -- Recolor unusable powers
					score = RED_FONT_COLOR_CODE .. score .. FONT_COLOR_CODE_CLOSE
				end
				frameTmp = frameTmp .. " " .. (frame.azeritePowerID or "?") .. ":" .. (scoreData[powerInfo.azeritePowerID] or "!") .. ":" .. (scoreData[frame.azeritePowerID] or "!")
				local s = AcquireString(frame, score)
				activeStrings[#activeStrings + 1] = s

				if powerInfo then
					traitStack.scoreData[#traitStack.scoreData + 1] = ("%s = %s"):format(tostring(powerInfo.azeritePowerID), tostring(score))
				end
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
			local scoreTmp = "> Tier " .. tierIndex .. ":"
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
				scoreTmp = scoreTmp .. " " .. (azeritePowerID or "?") .. ":" .. (scoreData[powerInfo.azeritePowerID] or "!") .. ":" .. (scoreData[azeritePowerID] or "!")
			end

			maxScore = maxScore + maximum
			currentPotential = currentPotential + tierMaximum
			if maxLevel < tierInfo.unlockLevel then
				maxLevel = tierInfo.unlockLevel
			end
		end

		if currentLevel >= maxLevel then
			midTrait = midTrait + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait == 1 then
			end
		else
		end

		local effectiveILvl = _G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetCurrentItemLevel()
		if cfg.addILvlToScore and effectiveILvl then
			local middleTraitValue = midTrait == 1 and 5 or 0
			if cfg.scaleByAzeriteEmpowered then
				local azeriteEmpoweredWeight = scoreData and scoreData[13] or 0
				effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
				middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
			end

			currentScore = currentScore + effectiveILvl + middleTraitValue
			currentPotential = currentPotential + effectiveILvl + middleTraitValue
			maxScore = maxScore + effectiveILvl + (midTrait == 2 and 0 or middleTraitValue)
		end

		local stats = GetItemStats(_G.AzeriteEmpoweredItemUI.azeriteItemDataSource:GetItem():GetItemLink())
		if cfg.addPrimaryStatToScore and stats then
			local statScore = stats["ITEM_MOD_AGILITY_SHORT"] or stats["ITEM_MOD_INTELLECT_SHORT"] or stats["ITEM_MOD_STRENGTH_SHORT"] or 0

			currentScore = currentScore + statScore
			currentPotential = currentPotential + statScore
			maxScore = maxScore + statScore
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

	local groupSet, _, _, scaleName = strsplit("/", cfg.specScales[playerSpecID].scaleID)
	--AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. (cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))
	AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. ((groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName) or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))

		traitStack.scoreData.current = cS
		traitStack.scoreData.potential = cP
		traitStack.scoreData.maximum = mS

	elseif _G.AzeriteEssenceUI and _G.AzeriteEssenceUI:IsShown() then -- 8.2 Azerite Essences
		local currentScore, currentPotential, maxScore = 0, 0, 0

		-- Update score strings and calculate current score
		while #activeStrings > 0 do
			local s = tremove(activeStrings)
			ReleaseString(s)
		end

		essenceStack.scoreData = essenceStack.scoreData or {}
		wipe(essenceStack.scoreData)

		--[[
			AzeriteEssenceInfo
			Key			Type
			-------------------
			ID			number
			name		string
			rank		number
			unlocked	bool
			valid		bool
			icon		number
		]]--

		-- Draw scores on the Essences inside the scroll-frame
		local container = _G.AzeriteEssenceUI.EssenceList.ScrollChild
		local children = { container:GetChildren() }
		for _, frame in ipairs(children) do
			if frame and frame:IsShown() then -- There are 13 buttons, but you can fit only 12 on the screen at any given time or you end up with numbers hovering under or over the frame

				if frame.essenceID then
					local majorScore, minorScore = 0, 0

					local essenceInfo = C_AzeriteEssence.GetEssenceInfo(frame.essenceID)
					if essenceInfo then
						if essenceScoreData[essenceInfo.ID] then
							majorScore = essenceScoreData[essenceInfo.ID][1] or 0
							minorScore = essenceScoreData[essenceInfo.ID][2] or 0
						end
					end

					if not frame.majorString then
						--frame.majorString = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
						frame.majorString = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
						frame.majorString:SetPoint("TOPRIGHT", -2, -5)
					end
					frame.majorString:SetText(majorScore)

					if not frame.minorString then
						--frame.minorString = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
						frame.minorString = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
						frame.minorString:SetPoint("BOTTOMRIGHT", -2, 5)
					end
					frame.minorString:SetText(minorScore)

					if essenceInfo and not essenceInfo.valid then
						frame.majorString:SetText(RED_FONT_COLOR_CODE .. frame.majorString:GetText() .. FONT_COLOR_CODE_CLOSE)
						frame.minorString:SetText(RED_FONT_COLOR_CODE .. frame.minorString:GetText() .. FONT_COLOR_CODE_CLOSE)
					elseif essenceInfo and not essenceInfo.unlocked then
						frame.majorString:SetText(GRAY_FONT_COLOR_CODE .. frame.majorString:GetText() .. FONT_COLOR_CODE_CLOSE)
						frame.minorString:SetText(GRAY_FONT_COLOR_CODE .. frame.minorString:GetText() .. FONT_COLOR_CODE_CLOSE)
					end
				end

			end
		end

		--[[
			Major Slot
			---------------------
			milestoneID		115
			requiredLevel	0
			slot			0
			swirlScale		1

			canUnlock		false
			isDraggable		true
			isMajorSlot		true
			unlocked		true

			Minor Slot 1
			---------------------
			milestoneID		116
			requiredLevel	55
			slot			1
			swirlScale		1

			canUnlock		false
			isDraggable		false
			isMajorSlot		false
			unlocked		false

			Minor Slot 2
			---------------------
			milestoneID		117
			requiredLevel	65
			slot			2
			swirlScale		1

			canUnlock		false
			isDraggable		false
			isMajorSlot		false
			unlocked		false
		]]--
		local essences = C_AzeriteEssence.GetEssences()
		local tempMaxMajors, tempMaxMinors = {}, {}
		local tempPotMajors, tempPotMinors = {}, {}
		for i = 1, #essences do
			--[[
				[8]={
					valid=true,
					name="Nullification Dynamo",
					ID=13,
					icon=3015741,
					unlocked=false,
					rank=0
				},
			]]--
			local essence = essences[i]
			if essenceScoreData[essence.ID] then
				if essence.valid then
					tempMaxMajors[essence.ID] = essenceScoreData[essence.ID][1] or 0
					tempMaxMinors[essence.ID] = essenceScoreData[essence.ID][1] or 0

					if essence.unlocked then
						tempPotMajors[essence.ID] = essenceScoreData[essence.ID][1] or 0
						tempPotMinors[essence.ID] = essenceScoreData[essence.ID][1] or 0
					end
				end

				local majorS = essenceScoreData[essence.ID][1] or 0
				local minorS = essenceScoreData[essence.ID][2] or 0
				if not essence.unlocked then
					majorS = GRAY_FONT_COLOR_CODE .. majorS .. FONT_COLOR_CODE_CLOSE
					minorS = GRAY_FONT_COLOR_CODE .. minorS .. FONT_COLOR_CODE_CLOSE
				end

				essenceStack.scoreData[#essenceStack.scoreData + 1] = ("%s = %s/%s"):format(tostring(essence.ID), tostring(majorS), tostring(minorS))
			end
		end

		local milestones = C_AzeriteEssence.GetMilestones()
		local slots = 0
		for i = #milestones, 1, -1 do
			if milestones[i].ID == 117 and milestones[i].unlocked == true then -- Major + 2 Minor
				slots = 3
				break
			elseif milestones[i].ID == 116 and milestones[i].unlocked == true then -- Major + Minor
				slots = 2
				break
			elseif milestones[i].ID == 115 and milestones[i].unlocked == true then -- Major
				slots = 1
				break
			end
		end

		-- Find Maximum score
		local tempMax, tempMaxID = 0, 0
		local tempMiniMax = {}
		for essenceID, majorScore in pairs(tempMaxMajors) do -- Find maximum Major/Minor-score -combination
			local score = majorScore + tempMaxMinors[essenceID]
			if tempMax < score then
				tempMax = score
				tempMaxID = essenceID
			end
		end
		maxScore = maxScore + tempMax
		tempMaxMinors[tempMaxID] = nil -- Remove the top Major score's minor score
		-- Find top 2 maximum Minor scores from the rest by putting them into table and sorting them and picking first 2
		for _, minorScore in pairs(tempMaxMinors) do
			tempMiniMax[#tempMiniMax + 1] = minorScore
		end
		sort(tempMiniMax)
		local firstMax = tremove(tempMiniMax) or 0
		local secondMax = tremove(tempMiniMax) or 0
		maxScore = maxScore + firstMax + secondMax
		-- Find Potential score
		local tempPot, tempPotID = 0, 0
		local tempMiniPot = {}
		for essenceID, majorScore in pairs(tempPotMajors) do -- Find maximum Major/Minor-score -combination
			local score = majorScore + tempPotMinors[essenceID]
			if tempPot < score then
				tempPot = score
				tempPotID = essenceID
			end
		end
		currentPotential = currentPotential + tempPot
		tempPotMinors[tempPotID] = nil -- Remove the top Major score's minor score
		-- Find top 2 maximum Minor scores from the rest by putting them into table and sorting them and picking first 2
		for _, minorScore in pairs(tempPotMinors) do
			tempMiniPot[#tempMiniPot + 1] = minorScore
		end
		sort(tempMiniPot)
		local firstPot = tremove(tempMiniPot) or 0
		local secondPot = tremove(tempMiniPot) or 0

		if slots == 1 then
			--currentPotential = currentPotential -- Previously set Major slot's score
		elseif slots == 2 then
			currentPotential = currentPotential + firstPot
		elseif slots == 3 then
			currentPotential = currentPotential + firstPot + secondPot
		else -- Slots == 0
			currentPotential = 0
		end

		--[[
			maxScore: 10.5 10.5 7 3.5 25
			maxScore: 17.5 4 3
			currentPotential: 9 9 5 4 27
			currentPotential: 9 2 1 1
			currentScore: 7 7
		]]--

		-- Draw scores for the Essences in the main view of the UI
		local frameTmp = "> Frames:"
		essenceStack.scoreData[#essenceStack.scoreData + 1] = "---"
		for _, slotFrame in ipairs(_G.AzeriteEssenceUI.Slots) do
			local score = 0

			local essenceID = C_AzeriteEssence.GetMilestoneEssence(slotFrame.milestoneID)
			if essenceID then
				if essenceScoreData[essenceID] then
					if slotFrame.isMajorSlot then -- Major Slot
						score = (essenceScoreData[essenceID][1] or 0) + (essenceScoreData[essenceID][2] or 0)
					else -- Minor Slot
						score = essenceScoreData[essenceID][2] or 0
					end
				end

				currentScore = currentScore + score

				essenceStack.scoreData[#essenceStack.scoreData + 1] = ("%s = %s/%s"):format(tostring(essenceID), tostring(score), tostring(slotFrame.isMajorSlot))
			end

			frameTmp = frameTmp .. " " .. (slotFrame.milestoneID or "?") .. " " .. (slotFrame.requiredLevel or "?") .. " " .. (slotFrame.slot or "?") .. " " .. (slotFrame.swirlScale or "?") .. " " .. tostring(slotFrame.canUnlock) .. " " .. tostring(slotFrame.isDraggable) .. " " .. tostring(slotFrame.isMajorSlot) .. " " .. tostring(slotFrame.unlocked)

			if slotFrame.unlocked then
				local s = AcquireString(slotFrame, score)
				activeStrings[#activeStrings + 1] = s
			end
		end

		--AzeritePowerWeights.string:SetText("Cool")
		local currentLevel = _G.AzeriteEssenceUI.powerLevel or 0
		local maxLevel = milestones[#milestones].requiredLevel or 0

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
		local groupSet, _, _, scaleName = strsplit("/", cfg.specScales[playerSpecID].scaleID)

		AzeritePowerWeights.string:SetText(format("%s\n%s", NORMAL_FONT_COLOR_CODE .. ((groupSet == "D" and (AzeritePowerWeights.defaultNameTable[scaleName] or cfg.specScales[playerSpecID].scaleName) or cfg.specScales[playerSpecID].scaleName) or U["ScaleName_Unknown"]) .. FONT_COLOR_CODE_CLOSE, baseScore))

		essenceStack.scoreData.current = cS
		essenceStack.scoreData.potential = cP
		essenceStack.scoreData.maximum = mS
		essenceStack.scoreData.slots = slots
	end
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

		local currentScore, currentPotential, maxScore, midTrait = 0, 0, 0, 0
		for tierIndex, tierInfo in ipairs(allTierInfo) do
			local maximum, tierMaximum = 0, 0
			for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
				local score = 0
				local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
				if powerInfo then
					score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

					if equipLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(equipLocation, powerInfo.azeritePowerID) then
						currentScore = currentScore + score

						if powerInfo.azeritePowerID == 13 then -- Middle
							midTrait = midTrait + 1
						end
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

		if currentLevel >= maxLevel then
			midTrait = midTrait + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait == 1 then
			end
		else
		end

		return currentScore, currentPotential, maxScore, itemLink, midTrait
	end

	return 0, 0, 0, itemLink, 0
end

local tooltipTable = {}
local function _updateTooltip(tooltip, itemLink)
	local currentLevel, maxLevel = 0, 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
	end

	--if not tooltipTable.itemLink or tooltipTable.itemLink ~= itemLink then
		wipe(tooltipTable)
		tooltipTable.itemLink = itemLink
		tooltipTable.currentLevel = currentLevel
		tooltipTable.scores = {}
	--end
	local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)

	local currentScore, currentPotential, maxScore, scaleInfo, midTrait = {}, {}, {}, {}, {}
	for i, tooltipScale in ipairs(cfg.tooltipScales) do
		currentScore[i] = 0
		currentPotential[i] = 0
		maxScore[i] = 0
		scaleInfo[i] = {}
		midTrait[i] = 0

		tooltipTable[i] = tooltipTable[i] or {}
		tooltipTable[i].tooltipScale = tooltipScale.scaleID
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

				tooltipTable[i][tierIndex] = tooltipTable[i][tierIndex] or {}
				tooltipTable[i][tierIndex].unlockLevel = tooltipTable[i][tierIndex].unlockLevel or tierInfo.unlockLevel

				local maximum, tierMaximum = 0, 0
				for _, azeritePowerID in ipairs(tierInfo.azeritePowerIDs) do
					local score = 0
					local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(azeritePowerID)
					if powerInfo then
						score = dataPointer[powerInfo.azeritePowerID] or dataPointer[powerInfo.spellID] or 0

						tooltipTable[i][tierIndex][powerInfo.azeritePowerID] = score
						if azeriteEmpoweredItemLocation:HasAnyLocation() and C_AzeriteEmpoweredItem.IsPowerSelected(azeriteEmpoweredItemLocation, powerInfo.azeritePowerID) then
							currentScore[i] = currentScore[i] + score

							tooltipTable[i][tierIndex][powerInfo.azeritePowerID] = ">" .. score .. "<"
							if powerInfo.azeritePowerID == 13 then -- Middle
								midTrait[i] = midTrait[i] + 1
							end
						else
						end
					end
					
					if maximum < score then
						maximum = score
					end
					if tierInfo.unlockLevel <= currentLevel and tierMaximum < score then
						tierMaximum = score
					end
				end
				maxScore[i] = maxScore[i] + maximum
				currentPotential[i] = currentPotential[i] + tierMaximum
				if maxLevel < tierInfo.unlockLevel then
					maxLevel = tierInfo.unlockLevel
				end
			end
		end

		if currentLevel >= maxLevel then
			midTrait[i] = midTrait[i] + 1 -- 0 = Middle is locked, 1 = Middle is open, 2 = Middle is open and selected
			if midTrait[i] == 1 then
			end
		else
		end
		tooltipTable.scores[i] = tooltipTable.scores[i] or {}
		tooltipTable.scores[i].traitScore = currentScore[i]
		tooltipTable.scores[i].traitPotential = currentPotential[i]
		tooltipTable.scores[i].traitMax = maxScore[i]

		local _, _, _, _, _, _, _, _, itemEquipLoc = GetItemInfo(itemLink)
		local effectiveILvl = GetDetailedItemLevelInfo(itemLink)
		if cfg.addILvlToScore and effectiveILvl then
			local middleTraitValue = midTrait[i] == 1 and 5 or 0
			if cfg.scaleByAzeriteEmpowered then
				local azeriteEmpoweredWeight = dataPointer and dataPointer[13] or 0
				effectiveILvl = effectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
				middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
			end

			currentScore[i] = currentScore[i] + effectiveILvl + middleTraitValue
			currentPotential[i] = currentPotential[i] + effectiveILvl + middleTraitValue
			maxScore[i] = maxScore[i] + effectiveILvl + (midTrait[i] == 2 and 0 or middleTraitValue)
			tooltipTable.scores[i].midTrait = midTrait[i]
			tooltipTable.scores[i].middleTraitValue = middleTraitValue
			tooltipTable.scores[i].ilvlScore = currentScore[i]
			tooltipTable.scores[i].ilvlPotential = currentPotential[i]
			tooltipTable.scores[i].ilvlMax = maxScore[i]
		end

		tooltipTable.scores.effectiveILvl = effectiveILvl
		local stats = GetItemStats(itemLink)
		if cfg.addPrimaryStatToScore and stats then
			local statScore = stats["ITEM_MOD_AGILITY_SHORT"] or stats["ITEM_MOD_INTELLECT_SHORT"] or stats["ITEM_MOD_STRENGTH_SHORT"] or 0

			currentScore[i] = currentScore[i] + statScore
			currentPotential[i] = currentPotential[i] + statScore
			maxScore[i] = maxScore[i] + statScore
			tooltipTable.scores[i].statAmount = statScore
			tooltipTable.scores[i].statScore = currentScore[i]
			tooltipTable.scores[i].statPotential = currentPotential[i]
			tooltipTable.scores[i].statMax = maxScore[i]
		end

		if cfg.relativeScore and dataPointer then
			local equippedScore, equippedPotential, equippedMax, equippedItemLink, equippedMidTrait = _getGearScore(dataPointer, itemEquipLocToSlot[itemEquipLoc])

			local equippedEffectiveILvl = GetDetailedItemLevelInfo(equippedItemLink)
			tooltipTable.equippedItemLink = equippedItemLink
			tooltipTable.equippedEffectiveILvl = equippedEffectiveILvl
			tooltipTable.scores[i].relTraitScore = equippedScore
			tooltipTable.scores[i].relTraitPotential = equippedPotential
			tooltipTable.scores[i].relTraitMax = equippedMax
			if cfg.addILvlToScore and equippedEffectiveILvl then
				local middleTraitValue = equippedMidTrait == 1 and 5 or 0
				if cfg.scaleByAzeriteEmpowered then
					local azeriteEmpoweredWeight = dataPointer and dataPointer[13] or 0
					equippedEffectiveILvl = equippedEffectiveILvl / 5 * azeriteEmpoweredWeight -- Azerite Empowered is +5ilvl
					middleTraitValue = middleTraitValue / 5 * azeriteEmpoweredWeight
				end

				equippedScore = equippedScore + equippedEffectiveILvl + middleTraitValue
				equippedPotential = equippedPotential + equippedEffectiveILvl + middleTraitValue
				equippedMax = equippedMax + equippedEffectiveILvl + (equippedMidTrait == 2 and 0 or middleTraitValue)
				tooltipTable.scores[i].relMidTrait = equippedMidTrait
				tooltipTable.scores[i].relMiddleTraitValue = middleTraitValue
				tooltipTable.scores[i].relIlvlScore = equippedScore
				tooltipTable.scores[i].relIlvlPotential = equippedPotential
				tooltipTable.scores[i].relIlvlMax = equippedMax
			end

			local equippedStats = GetItemStats(equippedItemLink)
			if cfg.addPrimaryStatToScore and equippedStats then
				local statScore = equippedStats["ITEM_MOD_AGILITY_SHORT"] or equippedStats["ITEM_MOD_INTELLECT_SHORT"] or equippedStats["ITEM_MOD_STRENGTH_SHORT"] or 0
				equippedScore = equippedScore + statScore
				equippedPotential = equippedPotential + statScore
				equippedMax = equippedMax + statScore
				tooltipTable.scores[i].relStatAmount = statScore
				tooltipTable.scores[i].relStatScore = equippedScore
				tooltipTable.scores[i].relStatPotential = equippedPotential
				tooltipTable.scores[i].relStatMax = equippedMax
			end

			currentScore[i] = equippedScore == 0 and 0 or floor((currentScore[i] / equippedScore - 1) * 100 + .5)
			currentPotential[i] = equippedPotential == 0 and 0 or floor((currentPotential[i] / equippedPotential - 1) * 100 + .5)
			maxScore[i] = equippedMax == 0 and 0 or floor((maxScore[i] / equippedMax - 1) * 100 + .5)
		end
	end

	--tooltip:AddLine(" \n".."AzeritePowerWeights")
	local tooltipLine = ""  --" \n" .. "AzeritePowerWeights" .. "\n"
	--if cfg.showTooltipLegend then
		--tooltipLine = tooltipLine .. HIGHLIGHT_FONT_COLOR_CODE .. U["ItemToolTip_Legend"] .. FONT_COLOR_CODE_CLOSE .. "\n"
	--end
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
	if not cfg or not cfg.tooltipScales then return end
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
	if not cfg or not cfg.tooltipScales then return end
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
	if not cfg or not cfg.tooltipScales then return end
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
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local itemName, itemLink = self:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		--azeriteEmpoweredItemLocation = ItemLocation:CreateFromBagAndSlot(bag, slot) -- WTH have I been thinking or have I just been copy&pasting?

		_updateTooltip(self, itemLink)
	end
end)

-- Comparison tooltip for Vendor items (https://www.townlong-yak.com/framexml/27602/GameTooltip.lua#490)
hooksecurefunc(GameTooltip.shoppingTooltips[1], "SetCompareItem", function(self, ...) -- ... = ShoppingTooltip2, GameTooltip
	if not cfg or not cfg.tooltipScales then return end
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
-- WorldmapTooltip is being deprecated in 8.1.5. GameTooltip should be used instead. (https://www.wowinterface.com/forums/showthread.php?t=56964)
--[[
hooksecurefunc(WorldMapCompareTooltip1, "SetCompareItem", function(self, ...) -- ... = WorldMapCompareTooltip2, WorldMapTooltipTooltip
	if not cfg or not cfg.tooltipScales then return end
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
]]

-- World Quest rewards (https://www.townlong-yak.com/framexml/27547/GameTooltip.lua#925)
hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward", function(self, questLogIndex, questID)
	if not cfg or not cfg.tooltipScales then return end
	if #cfg.tooltipScales == 0 then return end -- Not tracking any scales for tooltip
	--if azeriteEmpoweredItemLocation:HasAnyLocation() then return end

	local iName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo(questLogIndex, questID)
	--[[if not itemID or type(itemID) ~= "number" then return end
	local itemName, itemLink = GetItemInfo(itemID)
	if not itemName then return end]]

	-- Fix for GetItemInfo(itemID) returning the base item instead of the properly upgraded item for better geared characters.
	-- This also fixes the missing rings (3 rings vs 5 rings) from calculations for those items.
	if not (iName and itemTexture) then return end
	local itemName, itemLink = self.Tooltip:GetItem()
	if not itemName then return end

	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
		--[[local item = Item:CreateFromItemLink(itemLink) -- Try to cache the item for real itemlevel
		item:ContinueOnItemLoad(function()
			_updateTooltip(self.Tooltip, itemLink)
		end)]]
		_updateTooltip(self.Tooltip, itemLink)
	end
end)

GameTooltip:HookScript("OnHide", function()
	azeriteEmpoweredItemLocation:Clear()
end)

-- Quest rewards (https://www.townlong-yak.com/framexml/27602/QuestInfo.lua#964)
hooksecurefunc(GameTooltip, "SetQuestItem", function(self, ...) -- ... = type, ID
	if not cfg or not cfg.tooltipScales then return end
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

		if db.dbVersion == 2 then -- Add Azerite Essences to the Custom-scales
			for _, scale in pairs(db.customScales) do
				if type(scale[5]) ~= "table" then -- Old scale, update it with inserting Essence-table and bumping everything else down a notch
					tinsert(scale, 5, {})
				end
			end
			db.dbVersion = 3
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
			if
				not cfg.specScales[specID]
			or
				-- Localized Default-scalenames were causing issues, trying to revert those to normal state
				(cfg.specScales[specID].scaleName == U["DefaultScaleName_Default"] or
				cfg.specScales[specID].scaleName == U["DefaultScaleName_Defensive"] or
				cfg.specScales[specID].scaleName == U["DefaultScaleName_Offensive"])
			or
				-- More checks for the above
				(select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Default"] or
				select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Defensive"] or
				select(3, strmatch(cfg.specScales[specID].scaleID, "D/(%d+)/(%d+)/(.+)")) == U["DefaultScaleName_Offensive"])
			then

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
			_G.AzeriteEmpoweredItemUI:HookScript("OnShow", function()
				_setupStringAndEnableButton()
				delayedUpdate()
			end)
		end)
		self:HookAzeriteUI()

	elseif addon == "Blizzard_AzeriteEssenceUI" then
		-- Hook 'em & Cook 'em
		hooksecurefunc(_G.AzeriteEssenceUI, "RefreshMilestones", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "Update", delayedUpdate)
		hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "Refresh", delayedUpdate)
		--hooksecurefunc(_G.AzeriteEssenceUI.EssenceList, "CalculateScrollOffset", delayedUpdate)

		C_Timer.After(0, function() -- Fire on next frame instead of current frame
			delayedUpdate()
			_G.AzeriteEssenceUI:HookScript("OnShow", function()
				_setupStringAndEnableButton()
				delayedUpdate()
			end)
		end)
		self:HookAzeriteEssenceUI()
	end
end

function f:PLAYER_LOGIN(event)
	_activeSpec()

	if _G.AzeriteEmpoweredItemUI then
		self:HookAzeriteUI()
	end
end

function f:AZERITE_ITEM_POWER_LEVEL_CHANGED(event)
	delayedUpdate()
end

function f:AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED(event)
	delayedUpdate()
end

function f:PLAYER_EQUIPMENT_CHANGED(event, equipmentSlot, hasCurrent)
	if not azeriteSlots[equipmentSlot] then return end
	delayedUpdate()
end

function f:PLAYER_SPECIALIZATION_CHANGED(event, ...)
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
	["ticket"] = function()
		local text = ("%s %s/%d/%s (%s)\nSettings: "):format("AzeritePowerWeights", "8.2.12", C_CVar.GetCVar("scriptErrors"), cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"], cfg.specScales[playerSpecID].scaleID)
		local first = true
		local skip = {
			["onlyOwnClassDefaults"] = false,
			["onlyOwnClassCustoms"] = false,
			["importingCanUpdate"] = true,
			["defensivePowers"] = false,
			["rolePowers"] = false,
			["rolePowersNoOffRolePowers"] = false,
			["zonePowers"] = false,
			["professionPowers"] = false,
			["pvpPowers"] = false,
			["addILvlToScore"] = true,
			["scaleByAzeriteEmpowered"] = true,
			["addPrimaryStatToScore"] = true,
			["relativeScore"] = true,
			["showOnlyUpgrades"] = true,
			["showTooltipLegend"] = true,
			["outlineScores"] = true,
			["specScales"] = true,
			["tooltipScales"] = true
		}
		for key, _ in pairs(charDefaults) do
			if not skip[key] then
				if first then
					first = false
					text = text .. ("%s: %s"):format(key, tostring(cfg[key]))
				else
					text = text .. (", %s: %s"):format(key, tostring(cfg[key]))
				end
			end
		end
		if AzeritePowerWeights.frame then
			text = text .. ("\nFrame: %s, %s, %s/%s, %s/%s"):format(tostring(AzeritePowerWeights.frame:GetParent():GetName()), tostring(AzeritePowerWeights.frame:IsShown()), tostring(AzeritePowerWeights.frame:GetFrameStrata()), tostring(AzeritePowerWeights.frame:GetParent():GetFrameStrata()), tostring(AzeritePowerWeights.frame:GetFrameLevel()), tostring(AzeritePowerWeights.frame:GetParent():GetFrameLevel()))
			text = text .. ("\nString: %s, %s"):format(tostring(AzeritePowerWeights.string:GetParent():GetParent():GetName()), tostring(AzeritePowerWeights.string:IsShown()))
			text = text .. ("\nButton: %s, %s, %s/%s, %s/%s"):format(tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetParent():GetName() or AzeritePowerWeights.enableButton.frame:GetParent():GetParent():GetParent():GetName()), tostring(AzeritePowerWeights.enableButton.frame:IsShown()), tostring(AzeritePowerWeights.enableButton.frame:GetFrameStrata()), tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetFrameStrata()), tostring(AzeritePowerWeights.enableButton.frame:GetFrameLevel()), tostring(AzeritePowerWeights.enableButton.frame:GetParent():GetFrameLevel()))
		end
		text = text .. ("\nTrait Scores:\nLoaded: %s, Editor: %s"):format(tostring(traitStack.loading), tostring(traitStack.editor))
		if traitStack.scoreData then
			first = true
			text = text .. ("\nC/P/M: %s / %s / %s"):format(tostring(traitStack.scoreData.current), tostring(traitStack.scoreData.potential), tostring(traitStack.scoreData.maximum))
			for _, v in ipairs(traitStack.scoreData) do
				if string.find(v, RED_FONT_COLOR_CODE) then
					v = v .. "R"
				elseif string.find(v, GRAY_FONT_COLOR_CODE) then
					v = v .. "G"
				end
				if first then
					first = false
					text = text .. ("\nNumbers: %s"):format(tostring(v))
				else
					text = text .. (", %s"):format(tostring(v))
				end
			end
		end
		text = text .. ("\nEssence Scores:\nLoaded: %s, Editor: %s"):format(tostring(essenceStack.loading), tostring(essenceStack.editor))
		if essenceStack.scoreData then
			first = true
			text = text .. ("\nC/P/M/Slots: %s / %s / %s / %s"):format(tostring(essenceStack.scoreData.current), tostring(essenceStack.scoreData.potential), tostring(essenceStack.scoreData.maximum), tostring(essenceStack.scoreData.slots))
			for _, v in ipairs(essenceStack.scoreData) do
				if string.find(v, RED_FONT_COLOR_CODE) then
					v = v .. "R"
				elseif string.find(v, GRAY_FONT_COLOR_CODE) then
					v = v .. "G"
				end
				if first then
					first = false
					text = text .. ("\nNumbers: %s"):format(tostring(v))
				else
					text = text .. (", %s"):format(tostring(v))
				end
			end
		end

	end,
	["tt"] = function(...) -- Get tooltip stuff
		local text = string.format("> START\n- - - - - - - - - -\nVer. %s\nClass/Spec: %s / %s\nScale: %s (%s)\n- - - - - - - - - -\n", "8.2.12", playerClassID, playerSpecID, cfg.specScales[playerSpecID].scaleName or U["ScaleName_Unknown"], cfg.specScales[playerSpecID].scaleID)

		text = text .. string.format("Score settings:\naddILvlToScore: %s\nscaleByAzeriteEmpowered: %s\naddPrimaryStatToScore: %s\nrelativeScore: %s\nshowOnlyUpgrades: %s\nshowTooltipLegend: %s\n- - - - - - - - - -\n", tostring(cfg.addILvlToScore), tostring(cfg.scaleByAzeriteEmpowered), tostring(cfg.addPrimaryStatToScore), tostring(cfg.relativeScore), tostring(cfg.showOnlyUpgrades), tostring(cfg.showTooltipLegend))

		if tooltipTable.itemLink then
			local _, id = strsplit(":", tooltipTable.itemLink)
			local itemID = tonumber(id) or -1

			text = text .. string.format("HoA level: %s\n\nTooltip:\nItem: %s (%s)\nItemlink: %s\nEffective ilvl: %d\nTraits and scores:\n", tooltipTable.currentLevel or "", tooltipTable.itemLink or "", itemID, string.gsub(tooltipTable.itemLink or "", "\124", "\124\124"), tooltipTable.scores and tooltipTable.scores.effectiveILvl or -1)

			for i, v in ipairs(tooltipTable) do
				text = text .. string.format("> Scale %d: %s\n", i, v.tooltipScale)

				for tierIndex, w in ipairs(v) do
					text = text .. string.format("   T%d (%d):\n     ", tierIndex, w.unlockLevel or -1)

					for azeritePowerID, score in pairs(w) do
						if type(azeritePowerID) == "number" then -- skip "unlockLevel"
							text = text .. string.format(" %d = %s ", azeritePowerID, tostring(score or -1))
						end
					end

					text = text .. "\n"
				end

				if tooltipTable.scores then
					text = text .. string.format("\nTrait Score: %s / %s / %s\n\n" , tostring(tooltipTable.scores[i].traitScore or ""), tostring(tooltipTable.scores[i].traitPotential or ""), tostring(tooltipTable.scores[i].traitMax or ""))

					if cfg.addILvlToScore then
						text = text .. string.format("Ilvl Score: %s / %s / %s\nMiddle Trait: %s (%d)\n\n" , tostring(tooltipTable.scores[i].ilvlScore or ""), tostring(tooltipTable.scores[i].ilvlPotential or ""), tostring(tooltipTable.scores[i].ilvlMax or ""), tostring(tooltipTable.scores[i].middleTraitValue or ""), tooltipTable.scores[i].midTrait or -1)
					end

					if cfg.addPrimaryStatToScore then
						text = text .. string.format("Stat Score: %s / %s / %s\nStat value: %d\n\n" , tostring(tooltipTable.scores[i].statScore or ""), tostring(tooltipTable.scores[i].statPotential or ""), tostring(tooltipTable.scores[i].statMax or ""), tooltipTable.scores[i].statAmount or -1)
					end
				end
			end
			text = text .. "- - - - - - - - - -\n"
		end

		if tooltipTable.equippedItemLink then
			if tooltipTable.itemLink and tooltipTable.itemLink ~= tooltipTable.equippedItemLink then
				local _, eid = strsplit(":", tooltipTable.equippedItemLink)
				local eItemID = tonumber(eid) or -1

				text = text .. string.format("Equipped for relative scores:\nItem: %s (%s)\nItemlink: %s\nEffective ilvl: %d\nTraits and scores:\n", tooltipTable.equippedItemLink or "", eItemID, string.gsub(tooltipTable.equippedItemLink or "", "\124", "\124\124"), tooltipTable.equippedEffectiveILvl or -1)

				for i, v in ipairs(tooltipTable) do
					text = text .. string.format("> Scale %d: %s\n", i, v.tooltipScale)

					if tooltipTable.scores then
						text = text .. string.format("Trait Score: %s / %s / %s\n\n" , tostring(tooltipTable.scores[i].relTraitScore or ""), tostring(tooltipTable.scores[i].relTraitPotential or ""), tostring(tooltipTable.scores[i].relTraitMax or ""))

						if cfg.addILvlToScore then
							text = text .. string.format("Ilvl Score: %s / %s / %s\nMiddle Trait: %s (%d)\n\n" , tostring(tooltipTable.scores[i].relIlvlScore or ""), tostring(tooltipTable.scores[i].relIlvlPotential or ""), tostring(tooltipTable.scores[i].relIlvlMax or ""), tostring(tooltipTable.scores[i].relMiddleTraitValue or ""), tooltipTable.scores[i].relMidTrait or -1)
						end

						if cfg.addPrimaryStatToScore then
							text = text .. string.format("Stat Score: %s / %s / %s\nStat value: %d\n\n" , tostring(tooltipTable.scores[i].relStatScore or ""), tostring(tooltipTable.scores[i].relStatPotential or ""), tostring(tooltipTable.scores[i].relStatMax or ""), tooltipTable.scores[i].relStatAmount or -1)
						end
					end
				end
			elseif not tooltipTable.itemLink then
				text = text .. "Equipped for relative scores:\nItem: Not found!\n"
			else
				text = text .. "Equipped for relative scores:\nItem: Same as in tooltip!\n"
			end

			text = text .. "- - - - - - - - - -\n"
		end

		text = text .. "> END"

	end,
	["is"] = function()
		local text = string.join("\n", ("> START\nVer. %s"):format("8.2.12"), unpack(importStack))
	end,
	["bang"] = function(...)
		local number = tonumber(...)
		Print("Bang:", number)
	end,
	["data"] = function()
		Print("Data check start")
		local numSpecs = {
			[1] = 3+1, -- Warrior (+1 for TMI)
			[2] = 3+1-1, -- Paladin (+1 for TMI, -1 for Holy)
			[3] = 3, -- Hunter
			[4] = 3, -- Rogue
			[5] = 3+1-2-1, -- Priest (+1 for Disc Off, -2 for Disc and Disc Off, -1 for Holy)
			[6] = 3+1, -- Death Knight (+1 for TMI)
			[7] = 3+1-1, -- Shaman (+1 for Resto Off, -1 for Resto)
			[8] = 3, -- Mage
			[9] = 3, -- Warlock
			[10] = 3+1-1, -- Monk (+1 for TMI, -1 for MW)
			[11] = 4+1-1, -- Druid (+1 for TMI, -1 for Resto)
			[12] = 2+1, -- Demon Hunter (+1 for TMI)
		}
		local emptySpecs = 7
		for _, v in ipairs(AzeritePowerWeights.defaultScalesData) do
			if next(v[4]) or next(v[5]) then -- Check for not empty scales
				numSpecs[v[2]] = numSpecs[v[2]] - 1
			else
				emptySpecs = emptySpecs - 1
			end
		end
		for k, v in ipairs(numSpecs) do
			if v ~= 0 then
				Print("!!!", k, v)
			end
		end
		if emptySpecs ~= 0 then
			Print("Empty specs:", emptySpecs)
		end
		Print("Data check end")
	end,
	["test"] = function(...) -- To test new features
		Print("TEST")
	end,
}

local shouldKnowAboutConfig
SlashCmdList["AZERITEPOWERWEIGHTS"] = function(text)
	local command, params = strsplit(" ", text, 2)

	if SlashHandlers[command] then
		SlashHandlers[command](params)
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
				end
			end
		else
			_toggleEditorUI()
		end
	end
end

--#EOF
