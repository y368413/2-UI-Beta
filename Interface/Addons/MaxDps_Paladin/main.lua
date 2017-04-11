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

-- Talents
local _isFinalVerdict = false;
local _isSeraphim = false;
local _isSanctifiedWrath = false;
local _isExecutionSentence = false;
local _isLightsHammer = false;
local _isHolyPrism = false;
local _isZeal = false;
local _isSacredShield = false;
local _isBlindingLight = false;
local _isEyeforanEye = false;
local _isConsecration = false;
local _isCrusade = false;
local _isDivineHammer = false;

MaxDps.Paladin = {};

function MaxDps.Paladin.CheckTalents()
	MaxDps:CheckTalents();
	_isFinalVerdict = MaxDps:HasTalent(_FinalVerdict);
	_isExecutionSentence = MaxDps:HasTalent(_ExecutionSentence);
	_isZeal = MaxDps:HasTalent(_Zeal);
	_isCrusade = MaxDps:HasTalent(_Crusade);
	_isBlindingLight = MaxDps:HasTalent(_BlindingLight);
	_isEyeforanEye = MaxDps:HasTalent(_EyeforanEye);
	_isConsecration = MaxDps:HasTalent(_Consecration);
	_isDivineHammer = MaxDps:HasTalent(_DivineHammer);
	-- other checking functions
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

function MaxDps.Paladin.Holy()
	local timeShift, currentSpell = MaxDps:EndCast();

	return nil;
end

function MaxDps.Paladin.Protection()
	local timeShift, currentSpell = MaxDps:EndCast();

	return nil;
end

function MaxDps.Paladin.Retribution()
	local timeShift, currentSpell, gcd = MaxDps:EndCast();

	local crusStrike = _CrusaderStrike;
	if _isZeal then
		crusStrike = _Zeal;
	end

	local bladeOfJustice = _BladeofJustice;
	if _isDivineHammer then
		bladeOfJustice = _DivineHammer;
	end

	local holyPower = UnitPower('player', SPELL_POWER_HOLY_POWER);
	local jAura, jAuraCD = MaxDps:TargetAura(_Judgment, timeShift + 0.5);
	local dp = MaxDps:Aura(_DivinePurpose, timeShift);
	local j, jCD = MaxDps:SpellAvailable(_Judgment, timeShift);
	local _, crusadeCD = MaxDps:SpellAvailable(_Crusade, timeShift);
	local crus, crusCD = MaxDps:SpellAvailable(crusStrike, timeShift);
	local boj, bojCD = MaxDps:SpellAvailable(bladeOfJustice, timeShift);

	local targetPh = MaxDps:TargetPercentHealth();

	MaxDps:GlowCooldown(_AvengingWrath, MaxDps:SpellAvailable(_AvengingWrath, timeShift));
	MaxDps:GlowCooldown(_ShieldofVengeance, MaxDps:SpellAvailable(_ShieldofVengeance, timeShift));
	MaxDps:GlowCooldown(_BlindingLight, _isBlindingLight and MaxDps:SpellAvailable(_BlindingLight, timeShift));
	MaxDps:GlowCooldown(_EyeforanEye, _isEyeforanEye and MaxDps:SpellAvailable(_EyeforanEye, timeShift));
	MaxDps:GlowCooldown(_Crusade, _isCrusade and MaxDps:SpellAvailable(_Crusade, timeShift));

	if _isExecutionSentence and MaxDps:SpellAvailable(_ExecutionSentence, timeShift) and holyPower >= 3 and (
		(jCD < gcd * 4.5) or (jAuraCD > gcd * 4.67)) and
		(not _isCrusade or (crusadeCD > gcd * 2)
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

	if _isConsecration and MaxDps:SpellAvailable(_Consecration, timeShift) then
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
