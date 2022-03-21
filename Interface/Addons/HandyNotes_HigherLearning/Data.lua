local _, ns = ...
local points = ns.points
local textures = ns.textures
local scaling = ns.scaling
local language = ns.language

points[ns.dalaran] = {	-- Achievement ID, criteria ID, short title, tip
	[26505221] = { 4, 7239, "Divination", "divTip" },
	[30764591] = { 3, 7238, "Conjuration", "conjTip" },
	[43554671] = { 5, 7240, "Enchantment", "enchTip" },
	[46733904] = { 7, 7242, "Necromancy", "necroTip" },
	[46744012] = { 8, 7243, "Transmutation", "transTip" },
	[52325479] = { 2, 7237, "Abjuration", "abjTip" },
	[56684560] = { 1, 7236, "Introduction", "intTip" },
	[64435237] = { 6, 7241, "Illusion", "illTip" },
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