local _, ns = ...
local points = ns.points
local textures = ns.textures
local scaling = ns.scaling

points[ns.dalaran] = {	-- Quick and dirty implementation here. 
	[37962905] = {},
	[41145435] = {},
	[42924336] = {},
	[43991747] = {},
	[46625350] = {},
	[47582862] = {},
	[49107057] = {},
	[52056193] = {},
	[54224053] = {},
	[54925252] = {},
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
textures[14] = "Interface\\Common\\Indicator-Gray"

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
scaling[14] = 0.83