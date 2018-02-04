local _, addonTable = ...

-- Mine
local C, D = {}, {}
addonTable.C, addonTable.D = C, D

D.profile = {
	max_active_toasts = 12,
	scale = 1,
	strata = "DIALOG",
	fadeout_delay = 2.6,
	growth_direction = "DOWN",
	skin = "Default",
	sfx = {
		enabled = true,
	},
	colors = {
		name = true,
		border = true,
		icon_border = true,
	},
	point = {
		p = "TOP",
		rP = "TOP",
		x = 0,
		y = -21,
	},
	types = {},
}
