local _, ns = ...
local points = ns.points
local textures = ns.textures
local scaling = ns.scaling

-- The EggID was used in my original AddOn to provide am item link in chat

points[70] = {	-- Dustwallow Marsh
	[46501715] = { "Dart's Nest", "Darting Hatchling", 48118 },
	[47981907] = { "Dart's Nest", "Darting Hatchling", 48118 },
	[48011426] = { "Dart's Nest", "Darting Hatchling", 48118 },
	[49171736] = { "Dart's Nest", "Darting Hatchling", 48118 },
}

points[10] = {	-- Northern Barrens
	[60951976] = { "Takk's Nest", "Leaping Hatchling", 48112 },
	[62762018] = { "Takk's Nest", "Leaping Hatchling", 48112 },
	[64172300] = { "Takk's Nest", "Leaping Hatchling", 48112 },
	[64942860] = { "Takk's Nest", "Leaping Hatchling", 48112 },
}

points[78] = {	-- Un'Goro Crater
	[62067336] = { "Ravasaur Matriarch's Nest", "Ravasaur Hatchling", 48122, "Under the foliage" },
	[62096523] = { "Ravasaur Matriarch's Nest", "Ravasaur Hatchling", 48122 },
	[62976308] = { "Ravasaur Matriarch's Nest", "Ravasaur Hatchling", 48122, "Under the foliage" },
	[68836679] = { "Ravasaur Matriarch's Nest", "Ravasaur Hatchling", 48122, "Under the foliage" },
	[68956106] = { "Ravasaur Matriarch's Nest", "Ravasaur Hatchling", 48122, "Under the foliage" },
}

-- A code hack will differentiate between the two. The first is for general use, the other only for inside the cave
points[56] = {	-- Wetlands
	[69373491] = { "Cave Entrance", "Raptor Ridge", 48124, "Razormaw Matriarch's Nest" },
	[70032915] = { "Razormaw Matriarch's Nest", "Razormaw Hatchling", 48124, "Veer to the right" },
}
	
-- Choice of texture
-- Note that these textures are all repurposed and as such have non-uniform sizing. I've copied my scaling factors from my old AddOn
-- in order to homogenise the sizes. I should also allow for non-uniform origin placement as well as adjust the x,y offsets
textures[1] = "Interface\\TargetingFrame\\UI-PhasingIcon"
textures[2] = "Interface\\Store\\Category-icon-pets"
textures[3] = "Interface\\Store\\Category-icon-featured"
textures[4] = "Interface\\PlayerFrame\\MonkDarkPower"
textures[5] = "Interface\\PlayerFrame\\MonkLightPower"
textures[6] = "Interface\\Common\\Friendship-ManaOrb"	
textures[7] = "Interface\\HelpFrame\\HelpIcon-CharacterStuck"	
textures[8] = "Interface\\PlayerFrame\\UI-PlayerFrame-DeathKnight-Frost"
textures[9] = "Interface\\TargetingFrame\\PetBadge-Magical"
textures[10] = "Interface\\Common\\Indicator-Red"
textures[11] = "Interface\\Common\\Indicator-Yellow"
textures[12] = "Interface\\Common\\Indicator-Green"
textures[13] = "Interface\\Vehicles\\UI-Vehicles-Raid-Icon"

scaling[1] = 0.95
scaling[2] = 1.2
scaling[3] = 1.2
scaling[4] = 0.85
scaling[5] = 0.85
scaling[6] = 0.95
scaling[7] = 0.93
scaling[8] = 0.62
scaling[9] = 0.73
scaling[10] = 0.83
scaling[11] = 0.83
scaling[12] = 0.83
scaling[13] = 0.67