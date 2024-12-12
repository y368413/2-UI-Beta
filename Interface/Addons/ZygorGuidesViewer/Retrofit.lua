local name,ZGV = ...

ZGV.Retrofit = {}

ZGV.Retrofit.C_Spell = {}
ZGV.Retrofit.C_Spell.GetSpellInfo = C_Spell and C_Spell.GetSpellInfo  or function(spellID)
	local name, rank, iconID, castTime, minRange, maxRange, spellID, originalIconID = GetSpellInfo(spellID)
	return {
		name = name,
		nil, -- ranks are always nil
		iconID = iconID,
		castTime = castTime,
		minRange = minRange,
		maxRange = maxRange,
		spellID = spellID,
		originalIconID = originalIconID
	}
end

ZGV.Retrofit.C_Spell.GetSpellCooldown = C_Spell and C_Spell.GetSpellCooldown  or function(spellID)
	local startTime, duration, isEnabled, modRate = GetSpellCooldown(spellID)
	return {
		startTime = startTime,
		duration = duration,
		isEnabled = isEnabled,
		modRate = modRate
	}
end