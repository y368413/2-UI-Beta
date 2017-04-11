local _Marrowrend = 195182;
local _BoneShield = 195181;
local _BloodBoil = 50842;
local _BloodPlague = 195740;
local _DeathandDecay = 43265;
local _CrimsonScourge = 81136;
local _RapidDecomposition = 194662;
local _DeathStrike = 49998;
local _HeartStrike = 206930;
local _Ossuary = 219786;
local _Consumption = 205223;
local _DarkCommand = 56222;
local _DeathGrip = 49576;
local _AntiMagicShell = 48707;
local _DancingRuneWeapon = 49028;
local _MouthofHell = 192570;
local _VampiricBlood = 55233;
local _IceboundFortitude = 48792;
local _AntiMagicBarrier = 205727;
local _RedThirst = 205723;
local _WebofPain = 215288;
local _MasteryBloodShield = 77513;

-- Frost
local _IcyTalons = 194878;
local _RunicAttenuation = 207104;
local _Avalanche = 207142;
local _Obliteration = 207256;
local _FrostStrike = 49143;
local _FrostFever = 55095;
local _HowlingBlast = 49184;
local _Rime = 59057;
local _Obliterate = 49020;
local _KillingMachine = 51128;
local _RemorselessWinter = 196770;
local _FrozenPulse = 194909;
local _Frostscythe = 207230;
local _GlacialAdvance = 194913;
local _RunicEmpowerment = 81229;
local _PillarofFrost = 51271;
local _EmpowerRuneWeapon = 47568;
local _SindragosasFury = 190778;
local _MasteryFrozenHeart = 77514;
local _AntiMagicShell = 48707;
local _VolatileShielding = 207188;
local _BreathofSindragosa = 152279;
local _CrystallineSwords = 189186;

-- Talents
local _isDefile = false;
local _isRapidDecomposition = false;
local _isObliteration = false;
local _isBreathofSindragosa = false;

MaxDps.DeathKnight = {};

function MaxDps.DeathKnight.CheckTalents()
	MaxDps:CheckTalents();
	_isRapidDecomposition = MaxDps:HasTalent(_RapidDecomposition);
	_isObliteration = MaxDps:HasTalent(_Obliteration);
	_isBreathofSindragosa = MaxDps:HasTalent(_BreathofSindragosa);
	-- other checking functions
end

function MaxDps:EnableRotationModule(mode)
	mode = mode or 1;
	MaxDps.Description = 'Death Knight Module [Blood]';
	MaxDps.ModuleOnEnable = MaxDps.DeathKnight.CheckTalents;
	if mode == 1 then
		MaxDps.NextSpell = MaxDps.DeathKnight.Blood;
	end;
	if mode == 2 then
		MaxDps.NextSpell = MaxDps.DeathKnight.Frost;
	end;
	if mode == 3 then
		MaxDps.NextSpell = MaxDps.DeathKnight.Unholy;
	end;
end

function MaxDps.DeathKnight.Blood()
	local timeShift, currentSpell, gcd = MaxDps:EndCast();

	local runic = UnitPower('player', SPELL_POWER_RUNIC_POWER);
	local runicMax = UnitPowerMax('player', SPELL_POWER_RUNIC_POWER);
	local runes, runeCd = MaxDps.DeathKnight.Runes();

	local bb, bbCharges = MaxDps:SpellCharges(_BloodBoil, timeShift);
	local dad = MaxDps:SpellAvailable(_DeathandDecay, timeShift);
	local cons = MaxDps:SpellAvailable(_Consumption, timeShift);

	local bs, bsCharges = MaxDps:Aura(_BoneShield, timeShift + 4);

	local bp = MaxDps:TargetAura(_BloodPlague, timeShift);


	if not bs and runes >= 2 then
		return _Marrowrend;
	end

	if not bp and bbCharges > 0 then
		return _BloodBoil;
	end

	if MaxDps:Aura(_CrimsonScourge, timeShift) then
		return _DeathandDecay;
	end

	if runicMax - runic < 20 then
		return _DeathStrike;
	end

	if bsCharges <= 6 and runes >= 2 then
		return _Marrowrend;
	end

	if _isRapidDecomposition and dad and runes >= 3 then
		return _DeathandDecay;
	end

	if runes > 3 then
		return _HeartStrike;
	end

	if cons then
		return _Consumption;
	end

	return _BloodBoil;
end

function MaxDps.DeathKnight.Unholy()
	local timeShift, currentSpell, gcd = MaxDps:EndCast();

	return nil;
end

function MaxDps.DeathKnight.Frost()
	local timeShift, currentSpell, gcd = MaxDps:EndCast();

	local runic = UnitPower('player', SPELL_POWER_RUNIC_POWER);
	local runicMax = UnitPowerMax('player', SPELL_POWER_RUNIC_POWER);
	local runes, runeCd = MaxDps.DeathKnight.Runes();

	local it, itCharges = MaxDps:Aura(_IcyTalons, timeShift + 2);
	local oblit = MaxDps:Aura(_Obliteration, timeShift);
	local km = MaxDps:Aura(_KillingMachine, timeShift);

	MaxDps:GlowCooldown(_Obliteration, _isObliteration and MaxDps:SpellAvailable(_Obliteration, timeShift));
	MaxDps:GlowCooldown(_BreathofSindragosa, _isBreathofSindragosa and MaxDps:SpellAvailable(_BreathofSindragosa, timeShift));

	MaxDps:GlowCooldown(_SindragosasFury, MaxDps:SpellAvailable(_SindragosasFury, timeShift));
	MaxDps:GlowCooldown(_PillarofFrost, MaxDps:SpellAvailable(_PillarofFrost, timeShift));
	MaxDps:GlowCooldown(_EmpowerRuneWeapon, MaxDps:SpellAvailable(_EmpowerRuneWeapon, timeShift) and runes < 2);

	if itCharges < 3 and runic >= 25 then
		return _FrostStrike;
	end

	if not MaxDps:TargetAura(_FrostFever, timeShift + 2) and runes > 0 then
		return _HowlingBlast;
	end

	if runic > 75 then
		return _FrostStrike;
	end

	if MaxDps:Aura(_Rime, timeShift) and not oblit then
		return _HowlingBlast;
	end

--	if MaxDps:SpellAvailable(_Obliteration, timeShift) and runes >= 2 and runic >= 25 then
--		return _Obliteration;
--	end

	if oblit and runic >= 25 then
		return _FrostStrike;
	end

	if km and runes > 0 then
		return _Obliterate;
	end

	if MaxDps:SpellAvailable(_RemorselessWinter, timeShift) and runes > 0 then
		return _RemorselessWinter;
	end

	if runes > 1 then
		return _Obliterate;
	end

	if runic > 40 then
		return _FrostStrike;
	else
		return nil;
	end
end

function MaxDps.DeathKnight.Runes()
	local count = 0;
	local cd = 0;
	local time = GetTime();
	for i = 1, 10 do
		local start, duration, runeReady = GetRuneCooldown(i);
		if start and start > 0 then
			local rcd = duration + start - time;
			if cd == 0 or cd > rcd then
				cd = rcd;
			end
		end

		if runeReady then
			count = count + 1;
		end
	end

	return count, cd;
end
