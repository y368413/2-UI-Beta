local _, ns = ...
local points = ns.points
local textures = ns.textures
local scaling = ns.scaling

-- The EggID was used in my original AddOn to provide am item link in chat

points[ns.dalaran] = { -- Dalaran
	[58853897] = { title="Breanni", petName="Obsidian Hatchling", speciesID=236, petTexture=132253 },
}

points[ns.dustwallowMarsh] = { -- Dustwallow Marsh
	[46511716] = { title="Dart's Nest", petName="Darting Hatchling", speciesID=232, petTexture=132193 },
	[47981907] = { title="Dart's Nest", petName="Darting Hatchling", speciesID=232, petTexture=132193 },
	[48011426] = { title="Dart's Nest", petName="Darting Hatchling", speciesID=232, petTexture=132193 },
	[49171736] = { title="Dart's Nest", petName="Darting Hatchling", speciesID=232, petTexture=132193 },
}

points[ns.barrens] = { -- Barrens (WotLK Classic or Northern Barrens (Retail) or Hybrid (Classic Cata Prelaunch)
	[58450828] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="W" }, 
	[59470851] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="W" },
	[60281011] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="W" },
	[60711330] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="W" },
	[60951976] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="R" },
	[62762018] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="R" },
	[64172300] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="R" },
	[64942860] = { title="Takk's Nest", petName="Leaping Hatchling", speciesID=235, petTexture=132253, version="R" },

	[38966932] = { title="Deviate Guardians & Ravagers", petName="Deviate Hatchling", speciesID=233, petTexture=132193, version="R",
					tip="Wailing Caverns dungeon.\n1 in 3500 chance" },
	[46003645] = { title="Deviate Guardians & Ravagers", petName="Deviate Hatchling", speciesID=233, petTexture=132193, version="W",
					tip="Wailing Caverns dungeon.\n1 in 3500 chance" },
}

points[ns.unGoroCrater] = {	-- Un'Goro Crater
	[62067336] = { title="Ravasaur Matriarch's Nest", petName="Ravasaur Hatchling", speciesID=237, petTexture=132253, tip="Under the foliage" }, -- Classic matches
	[62096523] = { title="Ravasaur Matriarch's Nest", petName="Ravasaur Hatchling", speciesID=237, petTexture=132253 },
	[62976308] = { title="Ravasaur Matriarch's Nest", petName="Ravasaur Hatchling", speciesID=237, petTexture=132253, tip="Under the foliage" }, -- Classic matches
	[68836679] = { title="Ravasaur Matriarch's Nest", petName="Ravasaur Hatchling", speciesID=237, petTexture=132253, tip="Under the foliage" },
	[68956106] = { title="Ravasaur Matriarch's Nest", petName="Ravasaur Hatchling", speciesID=237, petTexture=132253, tip="Under the foliage" }, -- Classic matches
}

points[ 11 ] = { -- Wailing Caverns
	[53607050] = { title="Deviate Guardians & Ravagers", petName="Deviate Hatchling", speciesID=233, petTexture=132193, version="R",
					tip="Wailing Caverns dungeon.\n1 in 500 chance" },
}
points[ 279 ] = { -- Wailing Caverns
	[37704020] = { title="Deviate Guardians & Ravagers", petName="Deviate Hatchling", speciesID=233, petTexture=132193, version="R",
					tip="1 in 500 chance to drop from a\nDeviate Guardian or Ravager" },
}

-- A code hack will differentiate between the two. The first is for general use, the others are for inside the cave
points[ns.wetlands] = {	-- Wetlands
	[69373491] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="E", tip="Cave entrance, Raptor Ridge" },
	[70032916] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="R", tip="Veer to the right" },
	[70082914] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="W", tip="Veer to the right" },
	[71103096] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="W", tip="Between two rocks" },
	[67633063] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="W" },
	[69073142] = { title="Razormaw Matriarch's Nest", petName="Razormaw Hatchling", speciesID=238, petTexture=132193, version="W" }, -- Best estimate
}

local gundrak = "1 in 1000 chance to drop\nfrom a Gundrak Raptor"

points[ 121 ] = { -- Zul'drak
	[71502250] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
	[75003850] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
	[78501350] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
	[79004000] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
	[81503150] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
	[87002850] = { title="Gundrak Raptors", petName="Gundrak Hatchling", speciesID=234, petTexture=132253, tip=gundrak },
}

-- Choice of texture
-- Note that these textures are all repurposed and as such have non-uniform sizing. I've copied my scaling factors from my old AddOn
-- in order to homogenise the sizes. I should also allow for non-uniform origin placement as well as adjust the x,y offsets
textures[1] = "Interface\\PlayerFrame\\MonkLightPower"
textures[2] = "Interface\\PlayerFrame\\MonkDarkPower"
textures[3] = "Interface\\Common\\Indicator-Red"
textures[4] = "Interface\\Common\\Indicator-Yellow"
textures[5] = "Interface\\Common\\Indicator-Green"
textures[6] = "Interface\\Common\\Indicator-Gray"
textures[7] = "Interface\\Common\\Friendship-ManaOrb"	
textures[8] = "Interface\\TargetingFrame\\UI-PhasingIcon"
textures[9] = "Interface\\Store\\Category-icon-pets"
textures[10] = "Interface\\Store\\Category-icon-featured"

scaling[1] = 0.55
scaling[2] = 0.55
scaling[3] = 0.55
scaling[4] = 0.55
scaling[5] = 0.55
scaling[6] = 0.55
scaling[7] = 0.65
scaling[8] = 0.62
scaling[9] = 0.75
scaling[10] = 0.75