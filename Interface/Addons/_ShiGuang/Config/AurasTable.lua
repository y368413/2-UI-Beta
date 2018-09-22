local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("AurasTable")

local groups = {
	-- groups name = direction, interval, mode, iconsize, position, barwidth
	["Drog"] = {"RIGHT", 1, "ICON", 26, R.Auras.DrogPos},
	["ClassBar"] = {"RIGHT", 5, "ICON", 36, R.Auras.ClassBarPos},
	["Absorb"] = {"DOWN", 3, "TEXT", 21, R.Auras.AbsorbPos},
	["Shield"] = {"DOWN", 3, "TEXT", 21, R.Auras.ShieldPos},	
	["Player Aura"] = {"UP", 2, "BAR2", 21, R.Auras.PlayerAuraPos, 60},
	["Special Aura"] = {"UP", 2, "BAR2", 28, R.Auras.SpecialPos, 80},
	["Enchant Aura"] = {"UP", 1, "ICON", 43, R.Auras.EnchantPos},	
	["Target Aura"] = {"UP", 2, "BAR", 28, R.Auras.TargetAuraPos, 80},
	["Focus Aura"] = {"UP", 2, "BAR", 21, R.Auras.FocusPos, 60},
	["Warning"] = {"UP", 1, "ICON", 43, R.Auras.WarningPos},	
	["Raid Buff"] = {"LEFT", 5, "ICON", 46, R.Auras.RaidBuffPos},
	["Raid Debuff"] = {"RIGHT", 5, "ICON", 46, R.Auras.RaidDebuffPos},
	["Spell Cooldown"] = {"LEFT", 5, "ICON", 36, R.Auras.CDPos},
	["InternalCD"] = {"DOWN", 5, "BAR", 18, R.Auras.InternalPos, 120},
}

-- AuraWatch
local AuraWatchList = {}
function module:AddNewAuraWatch(class, list)
	if class ~= "ALL" and class ~= I.MyClass then return end
	if not AuraWatchList[class] then AuraWatchList[class] = {} end

	for name, v in pairs(list) do
		local direction, interval, mode, size, pos, width = unpack(groups[name])
		tinsert(AuraWatchList[class], {
			Name = name,
			Direction = direction,
			Interval = interval,
			Mode = mode,
			IconSize = size,
			Pos = pos,
			BarWidth = width,
			List = v
		})
	end
end

-- RaidFrame spells
local RaidBuffs = {}
function module:AddClassSpells(list)
	for class, value in pairs(list) do
		if class == "ALL" or class == I.MyClass then
			RaidBuffs[class] = value
		end
	end
end

-- RaidFrame debuffs
local RaidDebuffs = {}
function module:RegisterDebuff(_, instID, _, spellID, level)
	local instName = EJ_GetInstanceInfo(instID)
	if not instName then print("Invalid instance ID: "..instID) return end

	if not RaidDebuffs[instName] then RaidDebuffs[instName] = {} end
	if level then
		if level > 6 then level = 6 end
	else
		level = 2
	end

	RaidDebuffs[instName][spellID] = level
end

function module:OnLogin()
	if not MaoRUIDB["RaidDebuffs"] then MaoRUIDB["RaidDebuffs"] = {} end
	local newTable = {}
	for _, value in pairs(MaoRUIDB["RaidDebuffs"]) do
		if value then
			local instName, spellID, priority = unpack(value)
			if not newTable[instName] then newTable[instName] = {} end
			newTable[instName][spellID] = priority
		end
	end
	M.CopyTable(newTable, RaidDebuffs)

	R.AuraWatchList = AuraWatchList
	R.RaidBuffs = RaidBuffs
	R.RaidDebuffs = RaidDebuffs
end