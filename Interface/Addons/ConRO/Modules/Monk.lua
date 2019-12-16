if select(2, UnitClass("player")) ~= "MONK" then return end
local ConRO_Monk, ids = ...;

--Generic
	ids.Racial = {
		ArcanePulse = 260364,
		ArcaneTorrent = 129597,
		Berserking = 26297,
		GiftoftheNaaru = 59548,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Monk_AzTrait = {
		DanceofChiJi = 286585,
		MistyPeaks = 275975,
	}
	ids.Monk_AzTraitBuff = {
		DanceofChiJi = 286587,
	}
	ids.AzEssence = {
		BloodoftheEnemy = 298273,
		ConcentratedFlame = 295373,
		FocusedAzeriteBeam =295258,
		GuardianofAzeroth = 299358,
		MemoryofLucidDream = 298357,
		TheUnboundForce = 298452,
		WorldveinResonance = 295186,	
	}
	ids.AzEssenceBuff = {
		MemoryofLucidDream = 298357,	
	}
	ids.AzEssenceDebuff = {	
		ConcentratedFlame = 295368,
	}
	
--Brewmaster
	ids.Bm_Ability = {
		BlackoutStrike = 205523,
		BreathofFire = 115181,
		CracklingJadeLightning = 117952,
		Detox = 218164,
		ExpelHarm = 115072,
		FortifyingBrew = 115203,
		IronskinBrew = 115308,
		KegSmash = 121253,
		LegSweep = 119681,
		Paralysis = 115078,
		Provoke = 115546,
		PurifyingBrew = 119582,
		Resuscitate = 115178,
		Roll = 109132,
		SpearHandStrike = 116705,
		TigerPalm = 100780,
		Transcendence = 101643,
			TranscendenceTransfer = 119996,
		Vivify = 116670,
		ZenMeditation = 115176,
		ZenPilgrimage = 126892,
	}
	ids.Bm_Passive = {
		BrewmastersBalance = 245013,
		CelestialFortune = 216519,
		GiftoftheOx = 124502,
		MasteryElusiveBrawler = 117906,
		MysticTouch = 8647,
		Stagger = 115069,
	}
	ids.Bm_Talent = {
		--15
		EyeoftheTiger = 196607,		
		ChiWave = 115098,		
		ChiBurst = 123986,		
		--30		
		Celerity = 115173,		
		ChiTorpedo = 115008,
		TigersLust = 116841,		
		--45		
		LightBrewing = 196721,
		Spitfire = 242580,
		BlackOxBrew = 115399,		
		--60
		TigerTailSweep = 264348,
		SummonBlackOxStatue = 115315,
		RingofPeace = 116844,
		--75
		BobandWeave = 280515,
		HealingElixir = 122281,
		DampenHarm = 122278,
		--90
		SpecialDelivery = 196730,
		RushingJadeWind = 116847,
		InvokeNiuzaotheBlackOx = 132578,
		--100
		HighTolerance = 196737,
		Guard = 115295,
		BlackoutCombo = 196736,
	}
	ids.Bm_Form = {
	
	}
	ids.Bm_Buff = {
		BlackoutCombo = 228563,
		ChiTorpedo = 119085,
		IronskinBrew = 215479,
		RushingJadeWind = 116847,
	}
	ids.Bm_Debuff = {
		KegSmash = 121253,
		LightStagger = 124275,
		MediumStagger = 124274,
		HighStagger = 124273,
	}
	ids.Bm_PetAbility = {

	}
		
--Mistweaver
	ids.Mw_Ability = {
		BlackoutKick = 100784,
		CracklingJadeLightning = 117952,
		Detox = 115450,
		EnvelopingMist = 124682,
		EssenceFont = 191837,
		FortifyingBrew = 243435,
		LegSweep = 119381,
		LifeCocoon = 116849,
		Paralysis = 115078,
		Provoke = 115546,
		Reawaken = 212051,
		RenewingMist = 115151,
		Resuscitate = 115178,
		Revival = 115310,
		RisingSunKick = 107428,
		Roll = 109132,
		SoothingMist = 115175,
		SpinningCraneKick = 101546,
		ThunderFocusTea = 116680,
		TigerPalm = 100780,
		Transcendence = 101643,
			TranscendenceTransfer = 119996,
		Vivify = 116670,
		ZenPilgrimage = 126892,		
	}
	ids.Mw_Passive = {
		MasteryGustofMists = 117907,
		MysticTouch = 8647,
		TeachingsoftheMonastery = 116645,
	}
	ids.Mw_Talent = {
		--15
		MistWrap = 197900,		
		ChiWave = 115098,		
		ChiBurst = 123986,		
		--30		
		Celerity = 115173,		
		ChiTorpedo = 115008,		
		TigersLust = 116841,		
		--45		
		Lifecycles = 197915,		
		SpiritoftheCrane = 210802,
		ManaTea = 197908,		
		--60		
		TigerTailSweep = 264348,
		SongofChiJi = 198898,		
		RingofPeace = 116844,		
		--75		
		HealingElixir = 122281,	
		DiffuseMagic = 122783,
		DampenHarm = 122278,
		--90
		SummonJadeSerpentStatue = 115313,
		RefreshingJadeWind = 193725,
		InvokeChiJitheRedCrane = 198664,	
		--100
		FocusedThunder = 197895,
		Upwelling = 274963,
		RisingMist = 274909,
	}
	ids.Mw_Form = {
	
	}
	ids.Mw_Buff = {
		ChiTorpedo = 119085,	
		RenewingMist = 119611,
		TeachingsoftheMonastery = 202090,
	}
	ids.Mw_Debuff = {

	}
	ids.Mw_PetAbility = {

	}

--Windwalker
	ids.Ww_Ability = {
		BlackoutKick = 100784,
		CracklingJadeLightning = 117952,
		Detox = 218164,
		Disable = 116095,
		FistsofFury = 113656,
		FlyingSerpentKick = 101545,
			FlyingSerpentKickStop = 115057,
		LegSweep = 119381,
		Paralysis = 115078,
		Provoke = 115546,
		Resuscitate = 115178,
		RisingSunKick = 107428,
		Roll = 109132,		
		SpearHandStrike = 116705,
		SpinningCraneKick = 101546,	
		StormEarthandFire = 137639,		
		TigerPalm = 100780,
		TouchofDeath = 115080,
		TouchofKarma = 122470,
		Transcendence = 101643,
			TranscendenceTransfer = 119996,
		Vivify = 116670,
		ZenPilgrimage = 126892,
	}
	ids.Ww_Passive = {
		Afterlife = 116092,
		MasteryComboStrikes = 115636,
		MysticTouch = 8647,
		Windwalking = 157411,
	}
	ids.Ww_Talent = {
		--15
		EyeoftheTiger = 196607,
		ChiWave = 115098,
		ChiBurst = 123986,
		--30
		Celerity = 115173,
		ChiTorpedo = 115008,
		TigersLust = 116841,
		--45
		Ascension = 115396,
		FistoftheWhiteTiger = 261947,
		EnergizingElixir = 115288,
		--60
		TigerTailSweep = 264348,
		GoodKarma = 280195,
		RingofPeace = 116844,
		--75
		InnerStrength = 261767,
		DiffuseMagic = 122783,
		DampenHarm = 122278,		
		--90
		HitCombo = 196740,
		RushingJadeWind = 261715,
		InvokeXuentheWhiteTiger = 123904,
		--100
		SpiritualFocus = 280197,
		WhirlingDragonPunch = 152175,
		Serenity = 152173,
	}
	ids.Ww_Form = {
		TheEmperorsCapacitor = 235054,
	}
	ids.Ww_Buff = {
		BlackoutKick = 116768,
		ChiTorpedo = 119085,		
		Serenity = 152173, --DoubleCheck
		StormEarthandFire = 137639,
	}
	ids.Ww_Debuff = {
		MarkoftheCrane = 228287,
	}
	ids.Ww_PetAbility = {
	
	}
	
	
	ConRO.Monk = {};
ConRO.Monk.CheckTalents = function()
end
local ConRO_Monk, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Monk.CheckTalents;
	if mode == 1 then
		self.Description = "Monk [Brewmaster - Tank]";
		self.NextSpell = ConRO.Monk.Brewmaster;
		self.ToggleHealer();
	end;
	if mode == 2 then
		self.Description = "Monk [Mistweaver - Healer]";
		self.NextSpell = ConRO.Monk.Mistweaver;
		self.ToggleHealer();
	end;
	if mode == 3 then
		self.Description = "Monk [Windwalker - Melee]";
		self.NextSpell = ConRO.Monk.Windwalker;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Monk.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Monk.BrewmasterDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Monk.MistweaverDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Monk.WindwalkerDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Monk.Brewmaster(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local energy					 						= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local proRDY											= ConRO:AbilityReady(ids.Bm_Ability.Provoke, timeShift);
	local bsRDY												= ConRO:AbilityReady(ids.Bm_Ability.BlackoutStrike, timeShift);
		local bcBUFF											= ConRO:Aura(ids.Bm_Buff.BlackoutCombo, timeShift);
	local bofRDY											= ConRO:AbilityReady(ids.Bm_Ability.BreathofFire, timeShift);
	local ksRDY												= ConRO:AbilityReady(ids.Bm_Ability.KegSmash, timeShift);
		local ksDEBUFF											= ConRO:TargetAura(ids.Bm_Debuff.KegSmash, timeShift);
	local tpRDY												= ConRO:AbilityReady(ids.Bm_Ability.TigerPalm, timeShift);
	local shsRDY 											= ConRO:AbilityReady(ids.Bm_Ability.SpearHandStrike, timeShift);
	local isbRDY											= ConRO:AbilityReady(ids.Bm_Ability.IronskinBrew, timeShift);
		local isbCharges, isbMaxCharges							= ConRO:SpellCharges(ids.Bm_Ability.IronskinBrew);	
		local isbBUFF, _, isbDur								= ConRO:Aura(ids.Bm_Buff.IronskinBrew, timeShift);
	local rollRDY											= ConRO:AbilityReady(ids.Bm_Ability.Roll, timeShift);		
		
	local cbRDY												= ConRO:AbilityReady(ids.Bm_Talent.ChiBurst, timeShift);
	local cwRDY												= ConRO:AbilityReady(ids.Bm_Talent.ChiWave, timeShift);
	local rjwRDY											= ConRO:AbilityReady(ids.Bm_Talent.RushingJadeWind, timeShift);
		local rjwBUFF											= ConRO:Aura(ids.Bm_Buff.RushingJadeWind, timeShift);	
	local ctRDY												= ConRO:AbilityReady(ids.Bm_Talent.ChiTorpedo, timeShift);
		local ctBUFF											= ConRO:Aura(ids.Bm_Buff.ChiTorpedo, timeShift);	
	local tlRDY												= ConRO:AbilityReady(ids.Bm_Talent.TigersLust, timeShift);
	
--Conditions
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Bm_Ability.SpearHandStrike);
	
--Indicators
	ConRO:AbilityInterrupt(ids.Bm_Ability.SpearHandStrike, shs and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Bm_Ability.Roll, rollRDY and not tChosen[ids.Bm_Talent.ChiTorpedo]);
	ConRO:AbilityMovement(ids.Bm_Talent.ChiTorpedo, ctRDY and not ctBUFF);
	ConRO:AbilityMovement(ids.Bm_Talent.TigersLust, tlRDY);
	
	ConRO:AbilityTaunt(ids.Bm_Ability.Provoke, proRDY and (not ConRO:InRaid() or (ConRO:InRaid() and ConRO:TarYou())));
	
--Rotations
	if bcBUFF and tChosen[ids.Bm_Talent.BlackoutCombo] and ConRO.lastSpellId == ids.Bm_Ability.BlackoutStrike then
		if tpRDY then
			return ids.Bm_Ability.TigerPalm;
		end
	end
	
	if isbRDY and not isbBUFF and isbDur <= 13 and isbCharges == isbMaxCharges then
		return ids.Bm_Ability.IronskinBrew;
	end
	
	if ksRDY then
		return ids.Bm_Ability.KegSmash;
	end

	if bofRDY and tarInMelee >= 2 then
		return ids.Bm_Ability.BreathofFire;
	end
	
	if bsRDY then
		return ids.Bm_Ability.BlackoutStrike;
	end

	if bofRDY then
		return ids.Bm_Ability.BreathofFire;
	end

	if rjwRDY and not rjwBUFF then
		return ids.Bm_Talent.RushingJadeWind;
	end

	if tpRDY and energy >= 65 and not tChosen[ids.Bm_Talent.BlackoutCombo] then
		return ids.Bm_Ability.TigerPalm;
	end 

	if cbRDY then
		return ids.Bm_Talent.ChiBurst;
	end		

	if cwRDY then
		return ids.Bm_Talent.ChiWave;
	end
return nil;
end

function ConRO.Monk.BrewmasterDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local energy					 						= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);

--Abilities
	local pbRDY												= ConRO:AbilityReady(ids.Bm_Ability.PurifyingBrew, timeShift);
	local isbRDY											= ConRO:AbilityReady(ids.Bm_Ability.IronskinBrew, timeShift);
		local isbBUFF, _, isbDur								= ConRO:Aura(ids.Bm_Buff.IronskinBrew, timeShift);			
		local brewCharges, brewMaxCharges						= ConRO:SpellCharges(ids.Bm_Ability.IronskinBrew);	
		local hsDEBUFF											= ConRO:Aura(ids.Bm_Debuff.HighStagger, timeShift, 'HARMFUL');		
	local zmRDY												= ConRO:AbilityReady(ids.Bm_Ability.ZenMeditation, timeShift);		
	local fbRDY												= ConRO:AbilityReady(ids.Bm_Ability.FortifyingBrew, timeShift);
	local ehRDY												= ConRO:AbilityReady(ids.Bm_Ability.ExpelHarm, timeShift);	

	local heRDY												= ConRO:AbilityReady(ids.Bm_Talent.HealingElixir, timeShift);	
	local dhRDY												= ConRO:AbilityReady(ids.Bm_Talent.DampenHarm, timeShift);	
	local gRDY												= ConRO:AbilityReady(ids.Bm_Talent.Guard, timeShift);
	
--Conditions
	local playerPh 											= ConRO:PercentHealth('player');	

--Indicators
	
--Rotations
	if pbRDY and hsDEBUFF and brewCharges >= 1 then
		return ids.Bm_Ability.PurifyingBrew;
	end
	
	if isbRDY and (not isbBUFF or brewCharges == brewMaxCharges) and isbDur <= 13 then
		return ids.Bm_Ability.IronskinBrew;
	end

	if heRDY and playerPh <= 80 then
		return ids.Bm_Talent.HealingElixir;
	end	
	
	if ehRDY and playerPh <= 50 then
		return ids.Bm_Ability.ExpelHarm;
	end	
	
	if gRDY then
		return ids.Bm_Talent.Guard;
	end	

	if dhRDY then
		return ids.Bm_Talent.DampenHarm;
	end
	
	if fbRDY then
		return ids.Bm_Ability.FortifyingBrew;
	end	
	
return nil;
end

function ConRO.Monk.Mistweaver(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local mana					 							= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	
--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities
	local tp 												= ConRO:AbilityReady(ids.Mw_Ability.TigerPalm, timeShift);
		local totmBuff, totmCount								= ConRO:Aura(ids.Mw_Buff.TeachingsoftheMonastery, timeShift);
	local rsk, rskCD, rskMCD								= ConRO:AbilityReady(ids.Mw_Ability.RisingSunKick, timeShift);
	local bok 												= ConRO:AbilityReady(ids.Mw_Ability.BlackoutKick, timeShift);
	local rollRDY											= ConRO:AbilityReady(ids.Mw_Ability.Roll, timeShift);
	local rmRDY												= ConRO:AbilityReady(ids.Mw_Ability.RenewingMist, timeShift);
	
	local ctRDY												= ConRO:AbilityReady(ids.Mw_Talent.ChiTorpedo, timeShift);
		local ctBUFF											= ConRO:Aura(ids.Mw_Buff.ChiTorpedo, timeShift);	
	local tlRDY												= ConRO:AbilityReady(ids.Mw_Talent.TigersLust, timeShift);
	local sjssRDY												= ConRO:AbilityReady(ids.Mw_Talent.SummonJadeSerpentStatue, timeShift);
	
	local azChosen_MistyPeaks								= ConRO:AzPowerChosen(ids.Monk_AzTrait.MistyPeaks);
	
--Conditions	
	local isEnemy 											= ConRO:TarHostile();
	local Close 											= CheckInteractDistance("target", 3);
	
	local mStatue = 'Jade Serpent Statue';
	local sjssActive = false;
	if tChosen[ids.Mw_Talent.SummonJadeSerpentStatue] then
		for slot = 1, 2 do
			local found, name, _, _, texture = GetTotemInfo(slot)
			if found and name == mStatue then
				sjssActive = true;
			end
		end
	end
	
--Indicators
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Mw_Ability.Roll, rollRDY and not tChosen[ids.Mw_Talent.ChiTorpedo]);
	ConRO:AbilityMovement(ids.Mw_Talent.ChiTorpedo, ctRDY and not ctBUFF);
	ConRO:AbilityMovement(ids.Mw_Talent.TigersLust, tlRDY);

	ConRO:AbilityRaidBuffs(ids.Mw_Talent.SummonJadeSerpentStatue, sjssRDY and not sjssActive);
	ConRO:AbilityRaidBuffs(ids.Mw_Ability.RenewingMist, rmRDY and azChosen_MistyPeaks and not ConRO:OneBuff(ids.Mw_Buff.RenewingMist));
	
--Rotations
	if isEnemy then
		if rsk then
			return ids.Mw_Ability.RisingSunKick;
		end
		if bok and not rsk and rskCD > rskMCD - 6 then
			return ids.Mw_Ability.BlackoutKick;
		end		
		
		if tp and (not totmBuff or totmCount < 3) then
			return ids.Mw_Ability.TigerPalm;
		end
	end
return nil;
end

function ConRO.Monk.MistweaverDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local mana					 							= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);

--Abilities	
	local fbRDY												= ConRO:AbilityReady(ids.Mw_Ability.FortifyingBrew, timeShift);

	local heRDY												= ConRO:AbilityReady(ids.Mw_Talent.HealingElixir, timeShift);	
	local dhRDY												= ConRO:AbilityReady(ids.Mw_Talent.DampenHarm, timeShift);	
	
--Conditions
	local playerPh 											= ConRO:PercentHealth('player');	

--Rotations
	if heRDY and playerPh <= 80 then
		return ids.Mw_Talent.HealingElixir;
	end	

	if fbRDY then
		return ids.Mw_Ability.FortifyingBrew;
	end
	
	if dhRDY then
		return ids.Mw_Talent.DampenHarm;
	end	
	
return nil;
end

function ConRO.Monk.Windwalker(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local energy					 						= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);
	local chi 												= UnitPower('player', Enum.PowerType.Chi);
	local chiMax 											= UnitPowerMax('player', Enum.PowerType.Chi);	
	
--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities
	local cjLightning 										= ConRO:AbilityReady(ids.Ww_Ability.CracklingJadeLightning, timeShift);
		local tecBuff, tecStacks								= ConRO:Form(ids.Ww_Form.TheEmperorsCapacitor);
	local shs 												= ConRO:AbilityReady(ids.Ww_Ability.SpearHandStrike, timeShift);
	local fof, fofCD 										= ConRO:AbilityReady(ids.Ww_Ability.FistsofFury, timeShift);
	local tp 												= ConRO:AbilityReady(ids.Ww_Ability.TigerPalm, timeShift);
	local rsk, rskCD										= ConRO:AbilityReady(ids.Ww_Ability.RisingSunKick, timeShift);
	local bok 												= ConRO:AbilityReady(ids.Ww_Ability.BlackoutKick, timeShift);
	local tod 												= ConRO:AbilityReady(ids.Ww_Ability.TouchofDeath, timeShift);
		local todDebuff											= ConRO:TargetAura(ids.Ww_Debuff.TouchofDeath, timeShift);
	local sef												= ConRO:AbilityReady(ids.Ww_Ability.StormEarthandFire, timeShift);
		local sefBuff											= ConRO:Aura(ids.Ww_Buff.StormEarthandFire, timeShift);
		local sefCharges, sefMaxCharges							= ConRO:SpellCharges(ids.Ww_Ability.StormEarthandFire);	
	local sck 												= ConRO:AbilityReady(ids.Ww_Ability.SpinningCraneKick, timeShift);
		local motcDebuff										= ConRO:TargetAura(ids.Ww_Debuff.MarkoftheCrane, timeShift);
	local rollRDY											= ConRO:AbilityReady(ids.Ww_Ability.Roll, timeShift);
	local fskRDY											= ConRO:AbilityReady(ids.Ww_Ability.FlyingSerpentKick, timeShift);
	
	local ctRDY												= ConRO:AbilityReady(ids.Ww_Talent.ChiTorpedo, timeShift);
		local ctBUFF											= ConRO:Aura(ids.Ww_Buff.ChiTorpedo, timeShift);	
	local tlRDY												= ConRO:AbilityReady(ids.Ww_Talent.TigersLust, timeShift);	
	local ee 												= ConRO:AbilityReady(ids.Ww_Talent.EnergizingElixir, timeShift);	
	local wdp, wdpCD 										= ConRO:AbilityReady(ids.Ww_Talent.WhirlingDragonPunch, timeShift);
	local cwave 											= ConRO:AbilityReady(ids.Ww_Talent.ChiWave, timeShift);
	local sere 												= ConRO:AbilityReady(ids.Ww_Talent.Serenity, timeShift);
	local rjw 												= ConRO:AbilityReady(ids.Ww_Talent.RushingJadeWind, timeShift);
	local cburst 											= ConRO:AbilityReady(ids.Ww_Talent.ChiBurst, timeShift);
	local fotwtRDY 											= ConRO:AbilityReady(ids.Ww_Talent.FistoftheWhiteTiger, timeShift);
	local invokeRDY 										= ConRO:AbilityReady(ids.Ww_Talent.InvokeXuentheWhiteTiger, timeShift);

	local azChosen_DanceofChiJi								= ConRO:AzPowerChosen(ids.Monk_AzTrait.DanceofChiJi);
		local dofcjAzBuff 										= ConRO:Aura(ids.Monk_AzTraitBuff.DanceofChiJi, timeShift);
	
	local serBuff, _, serDur								= ConRO:Aura(ids.Ww_Buff.Serenity, timeShift);
	local bkBuff 											= ConRO:Aura(ids.Ww_Buff.BlackoutKick, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	
--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Ww_Ability.Disable);
	
--Indicators
	ConRO:AbilityInterrupt(ids.Ww_Ability.SpearHandStrike, shs and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Ww_Ability.Roll, rollRDY and not tChosen[ids.Ww_Talent.ChiTorpedo]);
	ConRO:AbilityMovement(ids.Ww_Talent.ChiTorpedo, ctRDY and not ctBUFF);
	ConRO:AbilityMovement(ids.Ww_Talent.TigersLust, tlRDY);
	ConRO:AbilityMovement(ids.Ww_Ability.FlyingSerpentKick, fskRDY);
	
	ConRO:AbilityBurst(ids.Ww_Ability.TouchofDeath, tod and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ww_Talent.InvokeXuentheWhiteTiger, invokeRDY and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ww_Ability.StormEarthandFire, sef and not sefBuff and not tChosen[ids.Ww_Talent.Serenity] and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ww_Talent.Serenity, sere and fofCD == 0 and ConRO_BurstButton:IsVisible());

--Rotations
	if ee and energy <= 20 and chi <= 3 then
		return ids.Ww_Talent.EnergizingElixir;
	end
	
	if serBuff then
		if rsk and ConRO.lastSpellId ~= ids.Ww_Ability.RisingSunKick then
			return ids.Ww_Ability.RisingSunKick;
		end
		
		if fof and serDur >= 9 and currentSpell ~= ids.Ww_Ability.FistsofFury then
			return ids.Ww_Ability.FistsofFury;
		end
		
		if bok and ConRO.lastSpellId ~= ids.Ww_Ability.BlackoutKick then
			return ids.Ww_Ability.BlackoutKick;
		end	

		if fof and currentSpell ~= ids.Ww_Ability.FistsofFury then
			return ids.Ww_Ability.FistsofFury;
		end
		
		if tChosen[ids.Ww_Talent.FistoftheWhiteTiger] then
			if fotwtRDY then
				return ids.Ww_Talent.FistoftheWhiteTiger;
			end
		else
			if sck then
				return ids.Ww_Ability.SpinningCraneKick;
			end		
		end
	else
		if incombat and sef and not sefBuff and not tChosen[ids.Ww_Talent.Serenity] and ConRO_FullButton:IsVisible() then
			return ids.Ww_Ability.StormEarthandFire;
		end
		
		if incombat and sere and fofCD == 0 and ConRO_FullButton:IsVisible() then
			return ids.Ww_Talent.Serenity;
		end

		if incombat and invokeRDY and ConRO_FullButton:IsVisible() then
			return ids.Ww_Talent.InvokeXuentheWhiteTiger;
		end
		
		if incombat and tod and ConRO_FullButton:IsVisible() then
			return ids.Ww_Ability.TouchofDeath;
		end
		
		if (ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible() then
			if wdp and fofCD > 0 and rskCD > 0 then
				return ids.Ww_Talent.WhirlingDragonPunch;
			end

			if fof and currentSpell ~= ids.Ww_Ability.FistsofFury then
				return ids.Ww_Ability.FistsofFury;
			end

			if rjw then
				return ids.Ww_Ability.RushingJadeWind;
			end

			if azEssence_ConcentratedFlame then
				return ids.AzEssence.ConcentratedFlame;
			end
		
			if rsk and tChosen[ids.Ww_Talent.WhirlingDragonPunch] and not wdp and wdpCD < 3 then
				return ids.Ww_Ability.RisingSunKick;
			end	

			if cburst and chi < 5 and currentSpell ~= ids.Ww_Talent.ChiBurst then
				return ids.Ww_Talent.ChiBurst;
			end	
			
			if sck and not fof and motcDebuff then
				return ids.Ww_Ability.SpinningCraneKick;
			end			

			if fotwtRDY then
				return ids.Ww_Talent.FistoftheWhiteTiger;
			end
			
			if rsk then
				return ids.Ww_Ability.RisingSunKick;
			end	

			if bok and not motcDebuff and ConRO.lastSpellId ~= ids.Ww_Ability.BlackoutKick then
				return ids.Ww_Ability.BlackoutKick;
			end
		
			if cwave then
				return ids.Ww_Talent.ChiWave;
			end

			if tp and (chi == 0 or ConRO.lastSpellId ~= ids.Ww_Ability.TigerPalm) then
				return ids.Ww_Ability.TigerPalm;
			end
		else	
			if azEssence_ConcentratedFlame then
				return ids.AzEssence.ConcentratedFlame;
			end
			
			if fotwtRDY and chi < 3 and energy >= energyMax - 15 then
				return ids.Ww_Talent.FistoftheWhiteTiger;
			end
			
			if tp and chi < 4 and energy >= energyMax - 15 and ConRO.lastSpellId ~= ids.Ww_Ability.TigerPalm then
				return ids.Ww_Ability.TigerPalm;
			end			
			
			if wdp and fofCD > 0 and rskCD > 0 then
				return ids.Ww_Talent.WhirlingDragonPunch;
			end
		
			if rsk then
				return ids.Ww_Ability.RisingSunKick;
			end	
			
			if fof and currentSpell ~= ids.Ww_Ability.FistsofFury then
				return ids.Ww_Ability.FistsofFury;
			end	
			
			if cburst and chi <= 4 and currentSpell ~= ids.Ww_Talent.ChiBurst then
				return ids.Ww_Talent.ChiBurst;
			end
			
			if fotwtRDY and chi < 3 then
				return ids.Ww_Talent.FistoftheWhiteTiger;
			end
			
			if sck and dofcjAzBuff then
				return ids.Ww_Ability.SpinningCraneKick;
			end	
			
			if bok and ConRO.lastSpellId ~= ids.Ww_Ability.BlackoutKick then
				return ids.Ww_Ability.BlackoutKick;
			end	
			
			if cwave then
				return ids.Ww_Talent.ChiWave;
			end
			
			if tp and ConRO.lastSpellId ~= ids.Ww_Ability.TigerPalm then
				return ids.Ww_Ability.TigerPalm;
			end
		end
	end
return nil;
end

function ConRO.Monk.WindwalkerDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local chi 												= UnitPower('player', Enum.PowerType.Chi);
--Abilities
	local tok 												= ConRO:AbilityReady(ids.Ww_Ability.TouchofKarma, timeShift);

	local dhRDY												= ConRO:AbilityReady(ids.Ww_Talent.DampenHarm, timeShift);	
		
--Rotations	
	if tok then
		return ids.Ww_Ability.TouchofKarma;
	end

	if dhRDY then
		return ids.Ww_Talent.DampenHarm;
	end	
	
return nil;
end
