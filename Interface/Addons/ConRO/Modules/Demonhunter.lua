if select(2, UnitClass("player")) ~= "DEMONHUNTER" then return end
local ConRO_DemonHunter, ids = ...;

--Generic
	ids.Racial = {
		ArcaneTorrent = 202719,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.DemonHunter_AzTrait = {

	}
	ids.DemonHunter_AzTraitBuff = {

	}
	ids.AzEssence = {
		ConcentratedFlame = 295373,
		MemoryofLucidDream = 298357,
		TheUnboundForce = 298452,
		WorldveinResonance = 295186,	
	}
	
--Havoc
	ids.Havoc_Ability = {
		Annihilation = 201427,
		BladeDance = 188499,
		Blur = 198589,
		ChaosNova = 179057,
		ChaosStrike = 162794,
		ConsumeMagic = 278326,
		Darkness = 196718,
		DeathSweep = 210152,
		DemonsBite = 162243,
		Disrupt = 183752,
		EyeBeam = 198013,
		FelRush = 195072,
		Glide = 131347,
		Imprison = 217832,
		Metamorphosis = 191427,
		SpectralSight = 188501,
		ThrowGlaive = 185123,
		Torment = 281854,
		VengefulRetreat = 198793,
	}
	ids.Havoc_Passive = {
		ChaosBrand = 255260,
		DemonicWards = 278386,
		DoubleJump = 196055,
		MasteryDemonicPresence = 185164,
		ShatteredSouls = 178940,
	}
	ids.Havoc_Talent = {
		--99
		BlindFury = 203550,
		DemonicAppetite = 206478,
		Felblade = 232893,
		--100
		InsatiableHunger = 258876,
		DemonBlades = 203555,
		ImmolationAura = 258920,
		--102
		TrailofRuin = 258881,
		FelMastery = 192939,
		FelBarrage = 258925,
		--104
		SoulRending = 204909,
		DesperateInstincts = 205411,
		Netherwalk = 196555,
		--106
		CycleofHatred = 258887,
		FirstBlood = 206416,
		DarkSlash = 258860,
		--108		
		UnleashedPower = 206477,
		MasteroftheGlaive = 203556,
		FelEruption = 211881,
		--110
		Demonic = 213410,
		Momentum = 206476,
		Nemesis = 206491,		
	}
	ids.Havoc_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		Solitude = 211509,
		ReverseMagic = 205604,
		EyeofLeotheras = 206649,
		ManaRift = 235903,
		DemonicOrigins = 235893,
		RainfromAbove = 206803,
		Detainment = 205596,
		ManaBreak = 203704,
		CoverofDarkness = 227635,
		Glimpse = 203468,
		UnendingHatred = 213480,
	}	
	ids.Havoc_Form = {
	
	}
	ids.Havoc_Buff = {
		ChaosBlades = 247938,
		Metamorphosis = 162264,
		Momentum = 208628,
	}
	ids.Havoc_Debuff = {
		Bloodlet = 207690,
		DarkSlash = 258860,
		Nemesis = 206491,
	}
	ids.Havoc_PetAbility = {

	}
		
--Vengeance
	ids.Ven_Ability = {
		ConsumeMagic = 278326,
		DemonSpikes = 203720,
		Disrupt = 183752,
		FieryBrand = 204021,
		Glide = 13147,
		ImmolationAura = 178740,
		Imprison = 217832,
		InfernalStrike = 189110,
		Metamorphosis = 187827,
		Shear = 203782,
		SigilofFlame = 204596,
		SigilofMisery = 207684,
		SigilofSilence = 202137,
		SoulCleave = 228477,
		SpectralSight = 188501,
		ThrowGlaive = 204157,
		Torment = 185245,
	}
	ids.Ven_Passive = {
		ChaosBrand = 281242,
		DemonicWards = 203513,
		DoubleJump = 196055,
		MasteryFelBlood = 203747,
		ShatteredSouls = 204254,
	}
	ids.Ven_Talent = {
		--99
		AbyssalStrike = 207550,
		AgonizingFlames = 207548,
		RazorSpikes = 209400,
		--100
		FeastofSouls = 207697,
		Fallout = 227174,
		BurningAlive = 207739,
		--102
		FlameCrash = 227322,
		CharredFlesh = 264002,
		Felblade = 232893,
		--104
		SoulRending = 217996,		
		FeedtheDemon = 218612,
		Fracture = 263642,
		--106
		ConcentratedSigils = 207666,
			SigilofFlame = 204513,
			SigilofMisery = 202140,
			SigilofSilence = 207682,
		QuickenedSigils = 209281,
		SigilofChains = 202138,
		--108
		Gluttony = 264004,
		SpiritBomb = 247454,
		FelDevastation = 212084,
		--110
		LastResort = 209258,
		VoidReaver = 268175,
		SoulBarrier = 263648,
	}
	ids.Ven_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		Solitude = 211509,
		CleansedbyFlame = 205625,
		EverlastingHunt = 205626,
		JaggedSpikes = 205627,
		IllidansGrasp = 205630,
		Tormentor = 207029,
		SigilMastery = 211489,
		DemonicTrample = 205629,
		ReverseMagic = 205604,
		Detainment = 205596,
		UnendingHatred = 213480,
	}		
	ids.Ven_Form = {
		SoulFragments = 203981,
	}
	ids.Ven_Buff = {
		DemonSpikes = 203819,
		ImmolationAura = 178740,
		Metamorphosis = 187827,
		SoulBarrier = 263648,
	}
	ids.Ven_Debuff = {
		FieryBrand = 207744,
		FieryDemise = 212818,
		Frailty = 247456,
		SigilofFlame = 204598,
	}
	ids.Ven_PetAbility = {

	}
	
	ConRO.DemonHunter = {};
ConRO.DemonHunter.CheckTalents = function()
end
local ConRO_DemonHunter, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.DemonHunter.CheckTalents;
	if mode == 1 then
		self.Description = "Demon Hunter [Havoc - Melee]";
		self.NextSpell = ConRO.DemonHunter.Havoc;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = "Demon Hunter [Vengeance - Tank]";
		self.NextSpell = ConRO.DemonHunter.Vengeance;
		self.ToggleHealer();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.DemonHunter.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.DemonHunter.HavocDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.DemonHunter.VengeanceDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.DemonHunter.Havoc(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local fury 												= UnitPower('player', Enum.PowerType.Fury);
	local furyMax 											= UnitPowerMax('player', Enum.PowerType.Fury);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities
	local disrupt											= ConRO:AbilityReady(ids.Havoc_Ability.Disrupt, timeShift);
	local cmagic											= ConRO:AbilityReady(ids.Havoc_Ability.ConsumeMagic, timeShift);
	local eye 												= ConRO:AbilityReady(ids.Havoc_Ability.EyeBeam, timeShift);
	local fr, frCD											= ConRO:AbilityReady(ids.Havoc_Ability.FelRush, timeShift);
		local frCharges, _, frCCD								= ConRO:SpellCharges(ids.Havoc_Ability.FelRush);								
		local momentum 											= ConRO:Aura(ids.Havoc_Buff.Momentum, timeShift);
	local vr 												= ConRO:AbilityReady(ids.Havoc_Ability.VengefulRetreat, timeShift);
	local tg	  											= ConRO:AbilityReady(ids.Havoc_Ability.ThrowGlaive, timeShift);
		local tgCharges											= ConRO:SpellCharges(ids.Havoc_Ability.ThrowGlaive);
		local inTGRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Havoc_Ability.ThrowGlaive), 'target');
		local bl 												= ConRO:TargetAura(ids.Havoc_Debuff.Bloodlet, timeShift + 2);
	local meta, metaCD										= ConRO:AbilityReady(ids.Havoc_Ability.Metamorphosis, timeShift);
		local metaBuff, _, metaDur								= ConRO:Aura(ids.Havoc_Buff.Metamorphosis, timeShift);
	local bdance 											= ConRO:AbilityReady(ids.Havoc_Ability.BladeDance, timeShift);
	local cstrike 											= ConRO:AbilityReady(ids.Havoc_Ability.ChaosStrike, timeShift);
	local dbite 											= ConRO:AbilityReady(ids.Havoc_Ability.DemonsBite, timeShift);
		
	local neme 												= ConRO:AbilityReady(ids.Havoc_Talent.Nemesis, timeShift);
		local nemeDebuff 										= ConRO:TargetAura(ids.Havoc_Debuff.Nemesis, timeShift);
	local fBarrage 											= ConRO:AbilityReady(ids.Havoc_Talent.FelBarrage, timeShift);
	local fe 												= ConRO:AbilityReady(ids.Havoc_Talent.FelEruption, timeShift);
	local fblade 											= ConRO:AbilityReady(ids.Havoc_Talent.Felblade, timeShift);
		local inFBRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Havoc_Talent.Felblade), 'target');	
	local dslash											= ConRO:AbilityReady(ids.Havoc_Talent.DarkSlash, timeShift);
		local dsDebuff 											= ConRO:TargetAura(ids.Havoc_Debuff.DarkSlash, timeShift);	
	local iaura												= ConRO:AbilityReady(ids.Havoc_Talent.ImmolationAura, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	
--Conditions
	local incombat 											= UnitAffectingCombat('player');	
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Havoc_Ability.ChaosStrike), 'target');
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Havoc_Ability.ChaosStrike);
	
--Indicators
	ConRO:AbilityInterrupt(ids.Havoc_Ability.Disrupt, disrupt and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Havoc_Ability.ConsumeMagic, cmagic and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Havoc_Ability.FelRush, not inMelee and fr);
	ConRO:AbilityMovement(ids.Havoc_Talent.Felblade, not inMelee and inFBRange and fblade);
	
	ConRO:AbilityBurst(ids.Havoc_Ability.Metamorphosis, meta and not metaBuff and not eye and fury >= 100 and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Havoc_Talent.Nemesis, neme and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Havoc_Ability.VengefulRetreat, vr and tChosen[ids.Havoc_Talent.Momentum] and inMelee and frCharges >= 1);
	
--Rotations	

	if select(8, UnitChannelInfo("player")) == ids.Havoc_Talent.FelBarrage then --Do not break cast
		return ids.Havoc_Talent.FelBarrage;
	end
	
	if select(8, UnitChannelInfo("player")) == ids.Havoc_Ability.EyeBeam then -- Do not break cast
		return ids.Havoc_Ability.EyeBeam;
	end
	
	if not incombat and ConRO_FullButton:IsVisible() then
		if iaura then
			return ids.Havoc_Talent.ImmolationAura;
		end	

		if meta and not metaBuff then
			return ids.Havoc_Ability.Metamorphosis;
		end
	end

	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
	
	if cstrike and dsDebuff then
		if metaBuff then
			return ids.Havoc_Ability.Annihilation;
		else
			return ids.Havoc_Ability.ChaosStrike;
		end
	end

	if neme and inMelee and ConRO_FullButton:IsVisible() then
		return ids.Havoc_Talent.Nemesis;
	end
	
	if meta and not metaBuff and not eye and fury >= 100 and ConRO_FullButton:IsVisible() then
		return ids.Havoc_Ability.Metamorphosis;
	end
	
	if fr and tChosen[ids.Havoc_Talent.Momentum] and ((frCharges >= 2 or (frCharges >= 1 and frCCD < 2)) and not momentum) then
		return ids.Havoc_Ability.FelRush;
	end

	if dslash and fury >= 80 then
		return ids.Havoc_Talent.DarkSlash;
	end
	
	if fBarrage and ((metaBuff and tChosen[ids.Havoc_Talent.Demonic]) or (momentum and tChosen[ids.Havoc_Talent.Momentum]) or tChosen[ids.Havoc_Talent.Nemesis]) then
		return ids.Havoc_Talent.FelBarrage;
	end
	
	if iaura and not tChosen[ids.Havoc_Talent.Demonic] then
		return ids.Havoc_Talent.ImmolationAura;
	end	
	
	if eye and currentSpell ~= ids.Havoc_Ability.EyeBeam and (momentum or not tChosen[ids.Havoc_Talent.Momentum]) then
		return ids.Havoc_Ability.EyeBeam;
	end	
	
	if tChosen[ids.Havoc_Talent.FirstBlood] or (tChosen[ids.Havoc_Talent.TrailofRuin] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible())) or ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
		if bdance and tarInMelee >= 1 then
			if metaBuff then
				return ids.Havoc_Ability.DeathSweep;
			else
				return ids.Havoc_Ability.BladeDance;
			end
		end
	end	
	
	if iaura and tChosen[ids.Havoc_Talent.Demonic] then
		return ids.Havoc_Talent.ImmolationAura;
	end
	
	if fblade and (fury < 40 or (tChosen[ids.Havoc_Talent.Demonic] and not metaBuff and fury <= furyMax - 40)) then
		return ids.Havoc_Talent.Felblade;
	end	
	
	if eye and currentSpell ~= ids.Havoc_Ability.EyeBeam and ((fury >= 45 and not tChosen[ids.Havoc_Talent.BlindFury] and not tChosen[ids.Havoc_Talent.DarkSlash]) or (tChosen[ids.Havoc_Talent.BlindFury] and tChosen[ids.Havoc_Talent.Demonic] and fury <= furyMax - 50)) then
		return ids.Havoc_Ability.EyeBeam;
	end
	
	if cstrike and (fury >= furyMax - 30 or tChosen[ids.Havoc_Talent.DemonBlades] or (metaBuff and metaDur <= 5) or metaCD > 6) and (not tChosen[ids.Havoc_Talent.FirstBlood] or (tChosen[ids.Havoc_Talent.FirstBlood] and fury >= 55)) then
		if metaBuff then
			return ids.Havoc_Ability.Annihilation;
		else
			return ids.Havoc_Ability.ChaosStrike;
		end
	end

	if eye and currentSpell ~= ids.Havoc_Ability.EyeBeam and tChosen[ids.Havoc_Talent.BlindFury] and not tChosen[ids.Havoc_Talent.Demonic] then
		return ids.Havoc_Ability.EyeBeam;
	end
	
	if fr and tChosen[ids.Havoc_Talent.DemonBlades] and not tChosen[ids.Havoc_Talent.Momentum] and frCharges >= 2 then
		return ids.Havoc_Ability.FelRush;
	end
	
	if tChosen[ids.Havoc_Talent.DemonBlades] then
		if tg then
			return ids.Havoc_Ability.ThrowGlaive;
		end
	else
		if dbite then
			return ids.Havoc_Ability.DemonsBite;
		end
	end
return nil;
end

function ConRO.DemonHunter.HavocDef(_, timeShift, currentSpell, gcd, tChosen)

	local blur												= ConRO:AbilityReady(ids.Havoc_Ability.Blur, timeShift);
	
	local nwalk												= ConRO:AbilityReady(ids.Havoc_Talent.Netherwalk, timeShift);
	
	local playerPh 											= ConRO:PercentHealth('player');
	
	if nwalk and playerPh <= 25 then
		return ids.Havoc_Talent.Netherwalk;
	end
	
	if blur and playerPh <= 35 then
		return ids.Havoc_Ability.Blur;
	end
	
	return nil;
end

function ConRO.DemonHunter.Vengeance(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local pain 												= UnitPower('player', Enum.PowerType.Pain);
	local painMax 											= UnitPowerMax('player', Enum.PowerType.Pain);
	local _, souls											= ConRO:Form(ids.Ven_Form.SoulFragments);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local disrupt											= ConRO:AbilityReady(ids.Ven_Ability.Disrupt, timeShift);
	local cmagic											= ConRO:AbilityReady(ids.Ven_Ability.ConsumeMagic, timeShift);
	local torment											= ConRO:AbilityReady(ids.Ven_Ability.Torment, timeShift);
	local iaura												= ConRO:AbilityReady(ids.Ven_Ability.ImmolationAura, timeShift);
	local istrike											= ConRO:AbilityReady(ids.Ven_Ability.InfernalStrike, timeShift);
		local isCharges											= ConRO:SpellCharges(ids.Ven_Ability.InfernalStrike);
	local meta												= ConRO:AbilityReady(ids.Ven_Ability.Metamorphosis, timeShift);
		local metaBuff											= ConRO:Aura(ids.Ven_Buff.Metamorphosis, timeShift);
	local shear												= ConRO:AbilityReady(ids.Ven_Ability.Shear, timeShift);
	local soFlame											= ConRO:AbilityReady(ids.Ven_Ability.SigilofFlame, timeShift);
	local soFlameCS											= ConRO:AbilityReady(ids.Ven_Talent.SigilofFlame, timeShift);
		local sofDebuff											= ConRO:TargetAura(ids.Ven_Debuff.SigilofFlame, timeShift);
	local sCleave											= ConRO:AbilityReady(ids.Ven_Ability.SoulCleave, timeShift);	
	local tGlaive											= ConRO:AbilityReady(ids.Ven_Ability.ThrowGlaive, timeShift);
		local inTGRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Ven_Ability.ThrowGlaive), 'target');	

	local felblade											= ConRO:AbilityReady(ids.Ven_Talent.Felblade, timeShift);
		local inFBRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Ven_Talent.Felblade), 'target');	
	local fracture											= ConRO:AbilityReady(ids.Ven_Talent.Fracture, timeShift);
	local sBomb												= ConRO:AbilityReady(ids.Ven_Talent.SpiritBomb, timeShift);
		local frailDebuff										= ConRO:TargetAura(ids.Ven_Debuff.Frailty, timeShift + 3);
		
--Conditions
	local isEnemy 											= ConRO:TarHostile();
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Ven_Ability.SoulCleave), 'target');
	local playerPh 											= ConRO:PercentHealth('player');
	local Close 											= CheckInteractDistance("target", 3);
		
	local sofUSE = ids.Ven_Ability.SigilofFlame;
	if tChosen[ids.Ven_Talent.ConcentratedSigils] then
		soFlame = soFlameCS;
		sofUSE = ids.Ven_Talent.SigilofFlame;
	end

--Indicators
	ConRO:AbilityInterrupt(ids.Ven_Ability.Disrupt, disrupt and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Ven_Ability.ConsumeMagic, cmagic and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Ven_Ability.InfernalStrike, not inMelee and istrike);

	ConRO:AbilityTaunt(ids.Ven_Ability.Torment, torment);
	
--Rotations
	if not inMelee and inTGRange and tGlaive then
		return ids.Ven_Ability.ThrowGlaive;
	elseif not inMelee and inFBRange and felblade then
		return ids.Ven_Talent.Felblade;
	end

	if sBomb and souls >= 5 and (not frailDebuff or playerPh <= 60) then
		return ids.Ven_Talent.SpiritBomb;
	end

	if fracture and souls <= 4 then
		return ids.Ven_Talent.Fracture;
	end
	
	if iaura and souls <= 4 then
		return ids.Ven_Ability.ImmolationAura;
	end

	if sCleave and (frailDebuff or not tChosen[ids.Ven_Talent.SpiritBomb]) and (playerPh <= 80 or pain >= painMax - 10) then
		return ids.Ven_Ability.SoulCleave;
	end
	
	if soFlame then
		return sofUSE;
	end

	if istrike and tChosen[ids.Ven_Talent.FlameCrash] and not sofDebuff and ConRO.lastSpellId ~= ids.Ven_Ability.InfernalStrike and ConRO.lastSpellId ~= sofUSE then
		return ids.Ven_Ability.InfernalStrike;
	end
	
	if felblade then
		return ids.Ven_Talent.Felblade;
	end
	
	if shear and not tChosen[ids.Ven_Talent.Fracture] and (pain <= painMax - 10 or souls <= 4) then
		return ids.Ven_Ability.Shear;
	end
	
	if tGlaive then
		return ids.Ven_Ability.ThrowGlaive;
	end
return nil;
end

function ConRO.DemonHunter.VengeanceDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local pain 												= UnitPower('player', Enum.PowerType.Pain);
	local painMax 											= UnitPowerMax('player', Enum.PowerType.Pain);
	local _, souls											= ConRO:Form(ids.Ven_Form.SoulFragments);

--Abilities
	local dSpikes	 										= ConRO:AbilityReady(ids.Ven_Ability.DemonSpikes, timeShift);
		local dsCharges, dsMaxCharges							= ConRO:SpellCharges(ids.Ven_Ability.DemonSpikes);
		local dsBuff											= ConRO:Aura(ids.Ven_Buff.DemonSpikes, timeShift);
	local fBrand											= ConRO:AbilityReady(ids.Ven_Ability.FieryBrand, timeShift);
		local fbDebuff											= ConRO:TargetAura(ids.Ven_Debuff.FieryBrand, timeShift);
	local meta												= ConRO:AbilityReady(ids.Ven_Ability.Metamorphosis, timeShift);
		local metaBuff											= ConRO:Aura(ids.Ven_Buff.Metamorphosis, timeShift);
	
	local sBarrier											= ConRO:AbilityReady(ids.Ven_Talent.SoulBarrier, timeShift);
		local sbBuff											= ConRO:Aura(ids.Ven_Buff.SoulBarrier, timeShift);	
		
--Conditions
	local playerPh 											= ConRO:PercentHealth('player');
	
--Rotations
	if dSpikes and dsCharges == dsMaxCharges then
		return ids.Ven_Ability.DemonSpikes;
	end

	if sBarrier and souls >= 5 and not fbDebuff then
		return ids.Ven_Talent.SoulBarrier;
	end
	
	if fBrand and not sbBuff then
		return ids.Ven_Ability.FieryBrand;
	end
	
	if dSpikes and not (metaBuff or fbDebuff) then
		return ids.Ven_Ability.DemonSpikes;
	end

	if meta and not metaBuff then
		return ids.Ven_Ability.Metamorphosis;
	end
		
	return nil;
end
