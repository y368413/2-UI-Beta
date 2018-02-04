-- Spells
local _TemplarsVerdict = 85256;
local _Judgment = 20271;
local _CrusaderStrike = 35395;
local _BladeofJustice = 184575;
local _AshestoAshes = 179546;
local _WakeofAshes = 205273;
local _Crusade = 224668;
local _AvengingWrath = 31884;
local _DivineStorm = 53385;
local _Heroism = 32182;
local _Bloodlust = 2825;
local _TimeWarp = 80353;
local _ShieldofVengeance = 184662;
local _MasteryDivineJudgment = 76672;
local _JusticarsVengeance = 215661;
local _DivinePurpose = 223817;
local _GreaterBlessingofMight = 203528;
local _HolyWrath = 210220;
local _Zeal = 217020;
local _BlindingLight = 115750;
local _FinalVerdict = 198038;
local _ExecutionSentence = 213757;
local _EyeforanEye = 205191;
local _Consecration = 26573;
local _DivineHammer = 198034;

MaxDps.Paladin = {};

function MaxDps.Paladin.CheckTalents()
end

function MaxDps:EnableRotationModule(mode)
	mode = mode or 1;
	MaxDps.Description = 'Paladin Module [Retribution]';
	MaxDps.ModuleOnEnable = MaxDps.Paladin.CheckTalents;
	if mode == 1 then
		MaxDps.NextSpell = MaxDps.Paladin.Holy;
	end;
	if mode == 2 then
		MaxDps.NextSpell = MaxDps.Paladin.Protection;
	end;
	if mode == 3 then
		MaxDps.NextSpell = MaxDps.Paladin.Retribution;
	end;
end

function MaxDps.Paladin.Holy(_, timeShift, currentSpell, gcd, talents)
	return nil;
end

function MaxDps.Paladin.Protection(_, timeShift, currentSpell, gcd, talents)
	return nil;
end

function MaxDps.Paladin.Retribution(_, timeShift, currentSpell, gcd, talents)
	local crusStrike = _CrusaderStrike;
	if talents[_Zeal] then
		crusStrike = _Zeal;
	end

	local bladeOfJustice = _BladeofJustice;
	if talents[_DivineHammer] then
		bladeOfJustice = _DivineHammer;
	end

	local holyPower = UnitPower('player', SPELL_POWER_HOLY_POWER);
	local jAura, jAuraCD = MaxDps:TargetAura(_Judgment, timeShift + 0.5);
	local dp = MaxDps:Aura(_DivinePurpose, timeShift);
	local j, jCD = MaxDps:SpellAvailable(_Judgment, timeShift);
	local _, crusadeCD = MaxDps:SpellAvailable(_Crusade, timeShift);
	local crus, crusCD = MaxDps:SpellAvailable(crusStrike, timeShift);
	local boj, bojCD = MaxDps:SpellAvailable(bladeOfJustice, timeShift);

	MaxDps:GlowCooldown(_AvengingWrath, MaxDps:SpellAvailable(_AvengingWrath, timeShift));
	MaxDps:GlowCooldown(_ShieldofVengeance, MaxDps:SpellAvailable(_ShieldofVengeance, timeShift));

	if talents[_BlindingLight] then
		MaxDps:GlowCooldown(_BlindingLight, MaxDps:SpellAvailable(_BlindingLight, timeShift));
	end

	if talents[_EyeforanEye] then
		MaxDps:GlowCooldown(_EyeforanEye, MaxDps:SpellAvailable(_EyeforanEye, timeShift));
	end

	if talents[_Crusade] then
		MaxDps:GlowCooldown(_Crusade, MaxDps:SpellAvailable(_Crusade, timeShift));
	end

	if talents[_ExecutionSentence]
		and MaxDps:SpellAvailable(_ExecutionSentence, timeShift)
		and holyPower >= 3
		and (
			(jCD < gcd * 4.5) or (jAuraCD > gcd * 4.67)
		) and (
			not talents[_Crusade] or (crusadeCD > gcd * 2)
		)
	then
		return _ExecutionSentence;
	end

	if jAura and (holyPower > 2 or dp) then
		return _TemplarsVerdict;
	end

	if MaxDps:SpellAvailable(_WakeofAshes, timeShift) and holyPower <= 1 then
		return _WakeofAshes;
	end

	if crus and holyPower < 5 then
		return crusStrike;
	end

	if boj and holyPower <= 3 then
		return bladeOfJustice;
	end

	if j and holyPower >= 3 then
		return _Judgment;
	end

	if talents[_Consecration] and MaxDps:SpellAvailable(_Consecration, timeShift) then
		return _Consecration;
	end

	if holyPower >= 3 and jCD < bojCD and jCD < crusCD then
		return _Judgment;
	end

	if bojCD < crusCD then
		return bladeOfJustice;
	else
		return crusStrike;
	end
end
