if select(2, UnitClass("player")) ~= "WARLOCK" then return end
local ConRO_Warlock, ids = ...;

--Generic
	ids.Racial = {
		ArcaneTorrent = 28730,
		Berserking = 26297,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Warlock_AzTrait = {
		BalefulInvocation = 287059,
		ExplosivePotential = 275395,
		InevitableDemise = 273521,
	}
	ids.Warlock_AzTraitBuff = {
		ExplosivePotential = 275398,
		ForbiddenKnowledge = 278738,
		InevitableDemise = 273525,
		ShadowsBite = 272944,
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
	
--Affliction
	ids.Aff_Ability = {
		Agony = 980,
		Banish = 710,
		CommandDemon = 119898,
			CauterizeMaster = 119905, --Imp
			Suffering = 119907, --Voidwalker
			Whiplash = 119909, --Succubus
			SpellLock = 119910, --Felhunter
			ShadowLock = 171140, --Doomguard
			MeteorStrike = 171152, --Infernal
		Corruption = 172,
		CreateHealthstone = 6201,
		CreateSoulwell = 29893,
		DemonicGateway = 111771,
		DrainLife = 234153,
		EnslaveDemon = 1098,
		EyeofKilrogg = 126,
		Fear = 5782,
		HealthFunnel = 755,
		RitualofSummoning = 698,
		SeedofCorruption = 27243,
		Shadowbolt = 232670,
		Shadowfury = 30283,
		Soulstone = 20707,
		SummonDarkglare = 205180,
		SummonDemon = 10,
			SummonImp = 688,
			SummonVoidwalker = 697,
			SummonFelhunter = 691,
			SummonSuccubus = 712,
		UnendingBreath = 5697,
		UnendingResolve = 104773,
		UnstableAffliction = 30108,
	}
	ids.Aff_Passive = {
		MasteryPotentAfflictions = 77215,
		SoulLeech = 108370,
		SoulShards = 246985,
	}
	ids.Aff_Talent = {
		--15
		Nightfall = 108558,
		DrainSoul = 198590,
		Deathbolt = 264106,
		--30
		WritheinAgony = 196102,
		AbsoluteCorruption = 196103,
		SiphonLife = 63106,
		--45
		DemonSkin = 219272,
		BurningRush = 111400,
		DarkPact = 108416,
		--60
		SowtheSeeds = 196226,
		PhantomSingularity = 205179,
		VileTaint = 278350,
		--75
		Darkfury = 264874,
		MortalCoil = 6789,
		DemonicCircle = 268358,
			DemonicCircleSummon = 48018,
			DemonicCircleTeleport = 48020,
		--90
		ShadowEmbrace = 32388,
		Haunt = 48181,
		GrimoireofSacrifice = 108503,
		--100
		SoulConduit = 215941,
		CreepingDeath = 264000,
		DarkSoulMisery = 113860,
	}
	ids.Aff_Form = {
	
	}
	ids.Aff_Buff = {
		BurningRush = 111400,
		DarkPact = 108416,
		GrimoireofSacrifice = 196099,
	}
	ids.Aff_Debuff = {
		Agony = 980,
		Corruption = 146739,
		DrainSoul = 198590,
		Haunt = 48181,
		PhantomSingularity = 205179,
		SeedofCorruption = 27243,		
		SiphonLife = 63106,
		ShadowEmbrace = 32390,
		UnstableAffliction1 = 233490,
		UnstableAffliction2 = 233496,
		UnstableAffliction3 = 233497,
		UnstableAffliction4 = 233498,
		UnstableAffliction5 = 233499,
	}
	ids.Aff_PetAbility = {
		CauterizeMaster = 119899, --Imp
		Suffering = 17735, --Voidwalker
		Whiplash = 6360, --Succubus
		SpellLock = 19647, --Felhunter
		DevourMagic = 19505, --Felhunter
		OpticalBlast = 115781, --Observer
		MeteorStrike = 171017, --Infernal	
		ThreateningPresence = 112042, -- Voidwalker
	}
		
--Demonology
	ids.Demo_Ability = {
		Banish = 710,
		CallDreadstalkers = 104316,
		CommandDemon = 119898,
			CauterizeMaster = 119905, --Imp
			Suffering = 119907, --Voidwalker
			Whiplash = 119909, --Succubus
			SpellLock = 119910, --Felhunter
			AxeToss = 119914, -- Felguard
			ShadowLock = 171140, --Doomguard
			MeteorStrike = 171152, --Infernal
		CreateHealthstone = 6201,
		CreateSoulwell = 29893,
		Demonbolt = 264178,
		DemonicGateway = 111771,
		DrainLife = 234153,
		EnslaveDemon = 1098,
		EyeofKilrogg = 126,
		Fear = 5782,
		HandofGuldan = 105174,
		HealthFunnel = 755,
		Implosion = 196277,
		RitualofSummoning = 698,
		ShadowBolt = 686,
		Shadowfury = 30283,
		Soulstone = 20707,
		SummonDemon = nil,
			SummonImp = 688,
			SummonVoidwalker = 697,
			SummonFelhunter = 691,
			SummonSuccubus = 712,
			SummonFelguard = 30146,
		SummonDemonicTyrant = 265187,
		UnendingBreath = 5697,
		UnendingResolve = 104773,
	}
	ids.Demo_Passive = {
		DemonicCore = 267102,
		MasteryMasterDemonologist = 77219,
		SoulLeech = 108370,
		SoulLink = 108415,
		SoulShards = 246985,
	}
	ids.Demo_Talent = {
		--15
		Dreadlash = 264078,
		DemonicStrength = 267171,
		BilescourgeBombers = 267211,
		--30
		DemonicCalling = 205145,
		PowerSiphon = 264130,
		Doom = 265412,
		--45
		DemonSkin = 219272,
		BurningRush = 111400,
		DarkPact = 108416,
		--60
		FromtheShadows = 267170,
		SoulStrike = 264057,
		SummonVilefiend = 264119,
		--75
		Darkfury = 264874,		
		MortalCoil = 6789,		
		DemonicCircle = 48018,
			DemonicCircleSummon = 48018,
			DemonicCircleTeleport = 48020,
		--90
		SoulConduit = 215941,
		InnerDemons = 267216,
		GrimoireFelguard = 111898,
		--100
		SacrificedSouls = 267214,
		DemonicConsumption = 267215,
		NetherPortal = 267217,
	}
	ids.Demo_Form = {
	
	}
	ids.Demo_Buff = {
		BurningRush = 111400,
		DarkPact = 108416,
		DemonicCalling = 205146,
		DemonicCore = 264173,
		NetherPortal = 267218,
	}
	ids.Demo_Debuff = {
		Doom = 265412,
	}
	ids.Demo_PetAbility = {
		CauterizeMaster = 119899, --Imp
		Suffering = 17735, --Voidwalker
		Whiplash = 6360, --Succubus
		SpellLock = 19647, --Felhunter
		DevourMagic = 19505, --Felhunter
		OpticalBlast = 115781, --Observer
		MeteorStrike = 171017, --Infernal	
		Felstorm = 89751, -- Felguard
		AxeToss = 89766,
	}
	
--Destruction
	ids.Dest_Ability = {
		Banish = 710,
		ChaosBolt = 116858,
		CommandDemon = 119898,
			CauterizeMaster = 119905, --Imp
			Suffering = 119907, --Voidwalker
			Whiplash = 119909, --Succubus
			SpellLock = 119910, --Felhunter
			ShadowLock = 171140, --Doomguard
			MeteorStrike = 171152, --Infernal
		Conflagrate = 17962,
		CreateHealthstone = 6201,
		CreateSoulwell = 29893,
		DemonicGateway = 111771,
		DrainLife = 234153,
		EnslaveDemon = 1098,
		EyeofKilrogg = 126,
		Fear = 5782,
		Havoc = 80240,
		HealthFunnel = 755,
		Immolate = 348,
		Incinerate = 29722,
		RainofFire = 5740,
		RitualofSummoning = 698,
		Shadowfury = 30283,
		Soulstone = 20707,
		SummonDemon = nil,
			SummonImp = 688,
			SummonVoidwalker = 697,
			SummonFelhunter = 691,
			SummonSuccubus = 712,
		SummonInfernal = 1122,
		UnendingBreath = 5697,
		UnendingResolve = 104773,
	}
	ids.Dest_Passive = {
		Backdraft = 196406,
		MasteryChaoticEnergies = 77220,
		SoulLeech = 108370,
		SoulShards = 246985,
	}
	ids.Dest_Talent = {
		--15
		Flashover = 267115,
		Eradication = 196412,
		SoulFire = 6353,
		--30
		ReverseEntropy = 205148,
		InternalCombustion = 266134,
		Shadowburn = 17877,
		--45
		DemonSkin = 219272,
		BurningRush = 111400,
		DarkPact = 108416,
		--60
		Inferno = 270545,
		FireandBrimstone = 196408,		
		Cataclysm = 152108,
		--75
		Darkfury = 264874,
		MortalCoil = 6789,
		DemonicCircle = 268358,
			DemonicCircleSummon = 48018,
			DemonicCircleTeleport = 48020,
		--90
		RoaringBlaze = 205184,
		GrimoireofSupremacy = 266086,
		GrimoireofSacrifice = 108503,
		--100
		SoulConduit = 215941,
		ChannelDemonfire = 196447,
		DarkSoulInstability = 113858,
	}
	ids.Dest_Form = {
	
	}
	ids.Dest_Buff = {
		BackDraft = 117828,
		BurningRush = 111400,
		DarkPact = 108416,
		GrimoireofSacrifice = 196099,
		DarkSoulInstability = 113858,
 	}
	ids.Dest_Debuff = {
		Immolate = 157736,
		Eradication = 196414,
		Havoc = 80240,
	}
	ids.Dest_PetAbility = {
		CauterizeMaster = 119899, --Imp
		Suffering = 17735, --Voidwalker
		Whiplash = 6360, --Succubus
		SpellLock = 19647, --Felhunter
		DevourMagic = 19505, --Felhunter
		OpticalBlast = 115781, --Observer
		MeteorStrike = 171017, --Infernal	
		ThreateningPresence = 112042, -- Voidwalker
	}
	
	ConRO.Warlock = {};
ConRO.Warlock.CheckTalents = function()
end
local ConRO_Warlock, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Warlock.CheckTalents;
	if mode == 1 then
		self.Description = 'Warlock [Affliction - Caster]';
		self.NextSpell = ConRO.Warlock.Affliction;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = 'Warlock [Demonology - Caster]';
		self.NextSpell = ConRO.Warlock.Demonology;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = 'Warlock [Destruction - Caster]';
		self.NextSpell = ConRO.Warlock.Destruction;
		self.ToggleDamage();
		self.BlockAoE();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED');
	self.lastSpellId = 0;	
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Warlock.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Warlock.AfflictionDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Warlock.DemonologyDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Warlock.DestructionDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Warlock.Affliction(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local plvl 												= UnitLevel("player");
	local shards 											= UnitPower('player', Enum.PowerType.SoulShards);
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities
	local dlife												= ConRO:AbilityReady(ids.Aff_Ability.DrainLife, timeShift);	
	local sumfelh											= ConRO:AbilityReady(ids.Aff_Ability.SummonFelhunter, timeShift);
	local corrupt											= ConRO:AbilityReady(ids.Aff_Ability.Corruption, timeShift);
		local cDebuff, _, cDur									= ConRO:TargetAura(ids.Aff_Debuff.Corruption, timeShift);
		local pcDebuff 											= ConRO:PersistentDebuff(ids.Aff_Debuff.Corruption);
	local agony												= ConRO:AbilityReady(ids.Aff_Ability.Agony, timeShift);
		local aDebuff, _, aDur 									= ConRO:TargetAura(ids.Aff_Debuff.Agony, timeShift);
	local unstable											= ConRO:AbilityReady(ids.Aff_Ability.UnstableAffliction, timeShift);
		local ua1, _, ua1Dur									= ConRO:TargetAura(ids.Aff_Debuff.UnstableAffliction1, timeShift);
		local ua2, _, ua2Dur 									= ConRO:TargetAura(ids.Aff_Debuff.UnstableAffliction2, timeShift);
		local ua3, _, ua3Dur 									= ConRO:TargetAura(ids.Aff_Debuff.UnstableAffliction3, timeShift);
		local ua4, _, ua4Dur 									= ConRO:TargetAura(ids.Aff_Debuff.UnstableAffliction4, timeShift);
		local ua5, _, ua5Dur 									= ConRO:TargetAura(ids.Aff_Debuff.UnstableAffliction5, timeShift);
	local sbolt												= ConRO:AbilityReady(ids.Aff_Ability.Shadowbolt, timeShift);	
	local sumdarkglare, sumdgCD								= ConRO:AbilityReady(ids.Aff_Ability.SummonDarkglare, timeShift);
	local soc												= ConRO:AbilityReady(ids.Aff_Ability.SeedofCorruption, timeShift);
		local socDebuff											= ConRO:TargetAura(ids.Aff_Debuff.SeedofCorruption, timeShift);

	local dsoul												= ConRO:AbilityReady(ids.Aff_Talent.DrainSoul, timeShift);
		local dsDebuff 											= ConRO:TargetAura(ids.Aff_Debuff.DrainSoul, timeShift);	
	local dbolt												= ConRO:AbilityReady(ids.Aff_Talent.Deathbolt, timeShift);
	local haunt												= ConRO:AbilityReady(ids.Aff_Talent.Haunt, timeShift);
	local slife												= ConRO:AbilityReady(ids.Aff_Talent.SiphonLife, timeShift);
		local sDebuff, _, sDur									= ConRO:TargetAura(ids.Aff_Debuff.SiphonLife, timeShift);
	local phantoms 											= ConRO:AbilityReady(ids.Aff_Talent.PhantomSingularity, timeShift);
	local sacrifice 										= ConRO:AbilityReady(ids.Aff_Talent.GrimoireofSacrifice, timeShift);
		local sacBuff											= ConRO:Aura(ids.Aff_Buff.GrimoireofSacrifice, timeShift);
	local vtaint											= ConRO:AbilityReady(ids.Aff_Talent.VileTaint, timeShift);
	local dsmisery											= ConRO:AbilityReady(ids.Aff_Talent.DarkSoulMisery, timeShift);
	local sembrace	 										= ConRO:AbilityReady(ids.Aff_Talent.ShadowEmbrace, timeShift);
		local seDebuff, seCount									= ConRO:TargetAura(ids.Aff_Debuff.ShadowEmbrace, timeShift + 4);
	
	local splock											= ConRO:AbilityReady(ids.Aff_PetAbility.SpellLock, timeShift);
	local dmagic											= ConRO:AbilityReady(ids.Aff_PetAbility.DevourMagic, timeShift);
	local oBlastRDY											= ConRO:AbilityReady(ids.Aff_PetAbility.OpticalBlast, timeShift);

	local idAzBuff, idAzBCount, idAzBDur					= ConRO:Aura(ids.Warlock_AzTraitBuff.InevitableDemise, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);		
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	
--Conditions		
	local summoned 											= ConRO:CallPet();
	local HasVoid											= IsSpellKnown(ids.Aff_PetAbility.ThreateningPresence, true);
	local assist 											= ConRO:PetAssist();
	local moving 											= ConRO:PlayerSpeed();
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	
	local uaCount = 0;
		if ua1 then
			uaCount = uaCount + 1;
		end
		if ua2 then
			uaCount = uaCount + 1;
		end
		if ua3 then
			uaCount = uaCount + 1;
		end
		if ua4 then
			uaCount = uaCount + 1;
		end	
		if ua5 then
			uaCount = uaCount + 1;
		end
	
	if currentSpell == ids.Aff_Ability.UnstableAffliction then
		shards = shards - 1;
		uaCount = uaCount + 1;
	end

	if tChosen[ids.Aff_Talent.AbsoluteCorruption] then
		cDebuff = pcDebuff;
	end

--Indicators
	ConRO:AbilityBurst(ids.Aff_Ability.SummonDarkglare, sumdarkglare and aDebuff and cDebuff and uaCount >= 1 and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Aff_Talent.DarkSoulMisery, dsmisery and ConRO_BurstButton:IsVisible());	
	
	ConRO:AbilityInterrupt(ids.Aff_PetAbility.SpellLock, splock and ConRO:Interrupt());
	ConRO:AbilityInterrupt(ids.Aff_PetAbility.OpticalBlast, oBlastRDY and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Aff_PetAbility.DevourMagic, dmagic and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
--Warnings
	if plvl >= 5 and not summoned and not tChosen[ids.Aff_Talent.GrimoireofSacrifice] then
		UIErrorsFrame:AddMessage("Summon your demon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if not assist and summoned then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if sacrifice and not sacBuff and not HasVoid then
		if not summoned then
			UIErrorsFrame:AddMessage("Call your pet to sacrifice!!!", 1.0, 0.0, 0.0, 53, 5);
		end
		return ids.Aff_Talent.GrimoireofSacrifice;
	end

--Rotations	
	if dlife and idAzBCount == 50 and idAzBDur <= 5 and not incombat then
		return ids.Aff_Ability.DrainLife;
	end
		
	if ConRO_AoEButton:IsVisible() then

		if not aDebuff and agony then
			return ids.Aff_Ability.Agony;
		end
		
		if soc and not (cDebuff or socDebuff) and currentSpell ~= ids.Aff_Ability.SeedofCorruption then
			return ids.Aff_Ability.SeedofCorruption;
		end
		
		if soc and not socDebuff and shards == 5 and currentSpell ~= ids.Aff_Ability.SeedofCorruption then
			return ids.Aff_Ability.SeedofCorruption;
		end

		if dlife and idAzBCount == 50 then
			return ids.Aff_Ability.DrainLife;
		end
		
		if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end		
		
		if vtaint and currentSpell ~= ids.Aff_Talent.VileTaint then
			return ids.Aff_Talent.VileTaint;
		end
		
		if phantoms then
			return ids.Aff_Talent.PhantomSingularity;
		end	
		
		if unstable and uaCount < 1 and currentSpell ~= ids.Aff_Ability.UnstableAffliction then
			return ids.Aff_Ability.UnstableAffliction;
		end
		
		if uaCount >= 1 then
			if dsoul and tChosen[ids.Aff_Talent.DrainSoul] then
				return ids.Aff_Talent.DrainSoul;
			elseif sbolt and not tChosen[ids.Aff_Talent.DrainSoul] then
				return ids.Aff_Ability.Shadowbolt;
			end
		end
	else
		if not incombat then		
			if haunt and currentSpell ~= ids.Aff_Talent.Haunt then
				return ids.Aff_Talent.Haunt;
			end
			
			if sbolt and currentSpell ~= ids.Aff_Ability.Shadowbolt and currentSpell ~= ids.Aff_Talent.Haunt and not tChosen[ids.Aff_Talent.DrainSoul] then
				return ids.Aff_Ability.Shadowbolt;
			end
		end

		if azEssence_GuardianofAzeroth and aDebuff and cDebuff and uaCount >= 4 and sumdarkglare then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if sumdarkglare and aDebuff and cDebuff and uaCount >= 4 and ConRO_FullButton:IsVisible() then
			return ids.Aff_Ability.SummonDarkglare;
		end
		
		if agony and (not aDebuff or aDur <= 2) then
			return ids.Aff_Ability.Agony;
		elseif corrupt and not cDebuff then
			return ids.Aff_Ability.Corruption;
		elseif slife and not sDebuff  then
			return ids.Aff_Talent.SiphonLife;
		end
		
		if tChosen[ids.Aff_Talent.ShadowEmbrace] and seCount < 3 then
			if dsoul and tChosen[ids.Aff_Talent.DrainSoul] then
				return ids.Aff_Talent.DrainSoul;
			elseif sbolt and not tChosen[ids.Aff_Talent.DrainSoul] and (seCount <= 1 or (seCount >= 2 and (currentSpell ~= ids.Aff_Ability.Shadowbolt or ConRO.lastSpellId ~= ids.Aff_Ability.Shadowbolt))) then
				return ids.Aff_Ability.Shadowbolt;
			end
		end

		if haunt and currentSpell ~= ids.Aff_Talent.Haunt then
			return ids.Aff_Talent.Haunt;
		end
		
		if dlife and idAzBCount == 50 then
			return ids.Aff_Ability.DrainLife;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end

		if dsmisery and ConRO_FullButton:IsVisible() then
			return ids.Aff_Talent.DarkSoulMisery;
		end
		
		if vtaint and currentSpell ~= ids.Aff_Talent.VileTaint then
			return ids.Aff_Talent.VileTaint;
		end
		
		if phantoms then
			return ids.Aff_Talent.PhantomSingularity;
		end
		
		if unstable and (shards >= 5 or (shards >= 1 and uaCount <= 4 and sumdarkglare and ConRO_FullButton:IsVisible())) then
			return ids.Aff_Ability.UnstableAffliction;
		end		

		if azEssence_GuardianofAzeroth and aDebuff and cDebuff and uaCount >= 1 and sumdarkglare then
			return ids.AzEssence.GuardianofAzeroth;
		end		
		
		if sumdarkglare and aDebuff and cDebuff and uaCount >= 1 and ConRO_FullButton:IsVisible() then
			return ids.Aff_Ability.SummonDarkglare;
		end
		
		if dbolt and aDebuff and cDebuff and uaCount >= 1 and (sumdgCD > 25 or ConRO_BurstButton:IsVisible()) then
			return ids.Aff_Talent.Deathbolt;
		end

		if unstable and (uaCount < 1 or (uaCount == 1 and ((ua1 and ua1Dur <= 2.5) or (ua2 and ua2Dur <= 2.5) or (ua3 and ua3Dur <= 2.5) or (ua4 and ua4Dur <= 2.5) or (ua5 and ua5Dur <= 2.5)))) and currentSpell ~= ids.Aff_Ability.UnstableAffliction then
			return ids.Aff_Ability.UnstableAffliction;
		end
		
		if agony and aDur <= 5 then
			return ids.Aff_Ability.Agony;
		elseif corrupt and not tChosen[ids.Aff_Talent.AbsoluteCorruption] and cDur <= 4 then
			return ids.Aff_Ability.Corruption;
		elseif slife and sDur <= 4.5  then
			return ids.Aff_Talent.SiphonLife;
		end
		
		if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end		
		
		if dsoul and tChosen[ids.Aff_Talent.DrainSoul] then
			return ids.Aff_Talent.DrainSoul;
		elseif sbolt and not tChosen[ids.Aff_Talent.DrainSoul] then
			return ids.Aff_Ability.Shadowbolt;
		end
	end	
return nil;
end

function ConRO.Warlock.AfflictionDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities
	local unend 											= ConRO:AbilityReady(ids.Aff_Ability.UnendingResolve, timeShift);
	local hfunnel 											= ConRO:AbilityReady(ids.Aff_Ability.HealthFunnel, timeShift);

	local dpact												= ConRO:AbilityReady(ids.Aff_Talent.DarkPact, timeShift);

--Conditions	
	local petPh												= ConRO:PercentHealth('pet');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if hfunnel and summoned and petPh <= 50 then
		return ids.Aff_Ability.HealthFunnel;
	end

	if dpact then
		return ids.Aff_Talent.DarkPact;
	end
	
	if unend then
		return ids.Aff_Ability.UnendingResolve;
	end

return nil;
end

function ConRO.Warlock.Demonology(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local shards 											= UnitPower('player', Enum.PowerType.SoulShards);
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local sumfelg 											= ConRO:AbilityReady(ids.Demo_Ability.SummonFelguard, timeShift);
		local axetoss											= ConRO:AbilityReady(ids.Demo_PetAbility.AxeToss, timeShift, true);
	local hog 												= ConRO:AbilityReady(ids.Demo_Ability.HandofGuldan, timeShift);
	local cdstalk, cdCD 									= ConRO:AbilityReady(ids.Demo_Ability.CallDreadstalkers, timeShift);
	local dbolt, _, _, dbCast								= ConRO:AbilityReady(ids.Demo_Ability.Demonbolt, timeShift);
		local dcBuff, dcCount, dcDur							= ConRO:Aura(ids.Demo_Buff.DemonicCore, timeShift);
	local sbolt 											= ConRO:AbilityReady(ids.Demo_Ability.ShadowBolt, timeShift);
		local dcallBuff 											= ConRO:Aura(ids.Demo_Buff.DemonicCalling, timeShift);
	local sdtyrant, sdtCD									= ConRO:AbilityReady(ids.Demo_Ability.SummonDemonicTyrant, timeShift);
	local implosion											= ConRO:AbilityReady(ids.Demo_Ability.Implosion, timeShift);
	
	local dstrength											= ConRO:AbilityReady(ids.Demo_Talent.DemonicStrength, timeShift);
	local sstrike											= ConRO:AbilityReady(ids.Demo_Talent.SoulStrike, timeShift);
	local svilefiend, svCD									= ConRO:AbilityReady(ids.Demo_Talent.SummonVilefiend, timeShift);
	local gfelg 											= ConRO:AbilityReady(ids.Demo_Talent.GrimoireFelguard, timeShift);
	local doom 												= ConRO:AbilityReady(ids.Demo_Talent.Doom, timeShift);
		local dDebuff 											= ConRO:TargetAura(ids.Demo_Debuff.Doom, timeShift + 4);
	local nportal, npCD										= ConRO:AbilityReady(ids.Demo_Talent.NetherPortal, timeShift);
		local npBuff 											= ConRO:Aura(ids.Demo_Buff.NetherPortal, timeShift);	
	local psiphon											= ConRO:AbilityReady(ids.Demo_Talent.PowerSiphon, timeShift);
	local bsbombers											= ConRO:AbilityReady(ids.Demo_Talent.BilescourgeBombers, timeShift);

	local splock 											= ConRO:AbilityReady(ids.Demo_PetAbility.SpellLock, timeShift);
	local dmagic											= ConRO:AbilityReady(ids.Demo_PetAbility.DevourMagic, timeShift);
	local felstorm, fsCD									= ConRO:AbilityReady(ids.Demo_PetAbility.Felstorm, timeShift);
	local oBlastRDY											= ConRO:AbilityReady(ids.Demo_PetAbility.OpticalBlast, timeShift);
	
		local fkAzBuff, _, fkAzBDur								= ConRO:Aura(ids.Warlock_AzTraitBuff.ForbiddenKnowledge, timeShift);
		local sbAzBuff, _, sbAzBDur								= ConRO:Aura(ids.Warlock_AzTraitBuff.ShadowsBite, timeShift);
	local azChosen_ExplosivePotential						= ConRO:AzPowerChosen(ids.Warlock_AzTrait.ExplosivePotential);
		local epAzBuff, _, epAzBDur								= ConRO:Aura(ids.Warlock_AzTraitBuff.ExplosivePotential, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);		
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	
--Conditions
	local summoned	 										= ConRO:CallPet();
	local assist											= ConRO:PetAssist();
	local moving 											= ConRO:PlayerSpeed();
	local incombat 											= UnitAffectingCombat('player');
	local plvl 												= UnitLevel("player");
	local Close 											= CheckInteractDistance("target", 3);
	
	if currentSpell == ids.Demo_Ability.HandofGuldan then
		shards = shards - 3;
	elseif currentSpell == ids.Demo_Talent.NetherPortal then
		shards = shards - 1;
	elseif currentSpell == ids.Demo_Ability.CallDreadstalkers then
		shards = shards - 2;
	elseif currentSpell == ids.Demo_Talent.SummonVilefiend then
		shards = shards - 1;
	elseif currentSpell == ids.Demo_Ability.Demonbolt then
		shards = shards + 2;		
	elseif currentSpell == ids.Demo_Ability.ShadowBolt then
		shards = shards + 1;
	end
	
--Indicators
	ConRO:AbilityBurst(ids.Demo_Ability.SummonDemonicTyrant, sdtyrant and currentSpell ~= ids.Demo_Ability.SummonDemonicTyrant and cdCD >= 10 and (not tChosen[ids.Demo_Talent.SummonVilefiend] or svCD >= 30) and (ConRO.lastSpellId == ids.Demo_Ability.HandofGuldan or currentSpell == ids.Demo_Ability.HandofGuldan) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Demo_Talent.NetherPortal, nportal and sdtyrant and cdstalk and (svilefiend or not tChosen[ids.Demo_Talent.SummonVilefiend]) and shards >= 1 and currentSpell ~= ids.Demo_Talent.NetherPortal and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Demo_Talent.Doom, doom and not dDebuff);
	
	ConRO:AbilityInterrupt(ids.Demo_PetAbility.SpellLock, splock and ConRO:Interrupt());
	ConRO:AbilityInterrupt(ids.Demo_PetAbility.OpticalBlast, oBlastRDY and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Demo_PetAbility.DevourMagic, dmagic and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
--Warnings
	if not summoned then
		UIErrorsFrame:AddMessage("Summon your Felguard!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if not assist and summoned then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end

--Rotations
	if not incombat then
		if dbolt and currentSpell ~= ids.Demo_Ability.Demonbolt then
			return ids.Demo_Ability.Demonbolt;
		end
			
		if dstrength and fsCD <= 26 then
			return ids.Demo_Talent.DemonicStrength;
		end
		
		if bsbombers then
			return ids.Demo_Talent.BilescourgeBombers;
		end
	end

	if moving then
		if dbolt and moving and dcCount >= 1 then
			return ids.Demo_Ability.Demonbolt;
		end
	end
	
	if dbolt and dcDur <= 2 and dcCount >= 1 then
		return ids.Demo_Ability.Demonbolt;
	end
	
	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
		
	
	if nportal and (sdtyrant or sdtCD <= 9) and currentSpell ~= ids.Demo_Talent.NetherPortal and ConRO_FullButton:IsVisible() then
		if nportal and (sdtyrant or sdtCD <= 9) and cdstalk and (svilefiend or not tChosen[ids.Demo_Talent.SummonVilefiend]) and shards >= 5 and currentSpell ~= ids.Demo_Talent.NetherPortal then
			return ids.Demo_Talent.NetherPortal;
		end
		
		if dbolt and (dcCount >= 1 or (fkAzBuff and fkAzBDur > dbCast) or (sbAzBuff and sbAzBDur > dbCast)) and shards <= 3 then
			return ids.Demo_Ability.Demonbolt;
		end
		
		if sbolt and currentSpell ~= ids.Demo_Ability.ShadowBolt then
			return ids.Demo_Ability.ShadowBolt;
		end
	elseif npBuff or currentSpell == ids.Demo_Talent.NetherPortal then
		if sdtyrant and (ConRO.lastSpellId == ids.Demo_Ability.HandofGuldan or currentSpell == ids.Demo_Ability.HandofGuldan) then
			return ids.Demo_Ability.SummonDemonicTyrant;
		end
		
		if azEssence_GuardianofAzeroth and (sdtyrant or sdtCD <= 9) then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if bsbombers and shards >= 2 then
			return ids.Demo_Talent.BilescourgeBombers;
		end

		if gfelg and shards >= 1 then
			return ids.Demo_Talent.GrimoireFelguard;
		end

		if svilefiend and shards >= 1 and (sdtyrant or sdtCD >= 40) and currentSpell ~= ids.Demo_Talent.SummonVilefiend then
			return ids.Demo_Talent.SummonVilefiend;
		end
		
		if cdstalk and (shards >= 2 or (shards >= 1 and dcallBuff)) and currentSpell ~= ids.Demo_Ability.CallDreadstalkers then
			return ids.Demo_Ability.CallDreadstalkers;
		end
		
		if hog and shards >= 1 and cdCD > 0 and currentSpell ~= ids.Demo_Ability.HandofGuldan then
			return ids.Demo_Ability.HandofGuldan;
		end
		
		if dbolt and (dcCount >= 1 or (fkAzBuff and fkAzBDur > dbCast) or (sbAzBuff and sbAzBDur > dbCast)) then
			return ids.Demo_Ability.Demonbolt;
		end
	
		if sbolt and shards <= 4 and currentSpell ~= ids.Demo_Ability.ShadowBolt then
			return ids.Demo_Ability.ShadowBolt;
		end
	else
		if azChosen_ExplosivePotential and (not epAzBuff or (epAzBuff and epAzBDur <= 1.5)) and ConRO:ImpsOut() >= 3 then
			return ids.Demo_Ability.Implosion;
		end
		
		if sdtyrant and currentSpell ~= ids.Demo_Ability.SummonDemonicTyrant and cdCD >= 10 and (not tChosen[ids.Demo_Talent.SummonVilefiend] or svCD >= 30) and (ConRO.lastSpellId == ids.Demo_Ability.HandofGuldan or currentSpell == ids.Demo_Ability.HandofGuldan) and ConRO_FullButton:IsVisible() then
			return ids.Demo_Ability.SummonDemonicTyrant;
		end
		
		if azEssence_GuardianofAzeroth and (sdtyrant or sdtCD <= 9) then
			return ids.AzEssence.GuardianofAzeroth;
		end		

		if gfelg and shards >= 1 then
			return ids.Demo_Talent.GrimoireFelguard;
		end

		if dstrength and fsCD <= 26 then
			return ids.Demo_Talent.DemonicStrength;
		end

		if bsbombers and shards >= 2 then
			return ids.Demo_Talent.BilescourgeBombers;
		end
		
		if implosion and ConRO:ImpsOut() >= 6 and ConRO_AoEButton:IsVisible() then
			return ids.Demo_Ability.Implosion;
		end
		
		if svilefiend and shards >= 1 and ((sdtyrant and cdstalk) or sdtCD >= 40) and currentSpell ~= ids.Demo_Talent.SummonVilefiend and (not tChosen[ids.Demo_Talent.NetherPortal] or (tChosen[ids.Demo_Talent.NetherPortal] and (npCD > 40 or ConRO_BurstButton:IsVisible()))) then
			return ids.Demo_Talent.SummonVilefiend;
		end
		
		if cdstalk and (shards >= 2 or (shards >= 1 and dcallBuff)) and (sdtyrant or sdtCD >= 10) and currentSpell ~= ids.Demo_Ability.CallDreadstalkers and (not tChosen[ids.Demo_Talent.NetherPortal] or (tChosen[ids.Demo_Talent.NetherPortal] and (npCD > 15 or ConRO_BurstButton:IsVisible()))) then
			return ids.Demo_Ability.CallDreadstalkers;
		end

		if sstrike and shards <= 4 then
			return ids.Demo_Talent.SoulStrike;
		end
		
		if hog and shards >= 4 and currentSpell ~= ids.Demo_Ability.HandofGuldan then
			return ids.Demo_Ability.HandofGuldan;
		end
		
		if dbolt and (dcCount >= 2 or (fkAzBuff and fkAzBDur > dbCast) or (sbAzBuff and sbAzBDur > dbCast)) and shards <= 3 then
			return ids.Demo_Ability.Demonbolt;
		end
		
		if psiphon and dcCount <= 1 and ConRO:ImpsOut() >= 2 then
			return ids.Demo_Talent.PowerSiphon;
		end
		
		if hog and shards >= 3 and currentSpell ~= ids.Demo_Ability.HandofGuldan then
			return ids.Demo_Ability.HandofGuldan;
		end	
		
		if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end		
		
		if sbolt and shards <= 4 and currentSpell ~= ids.Demo_Ability.ShadowBolt then
			return ids.Demo_Ability.ShadowBolt;
		end
	end
return nil;
end

function ConRO.Warlock.DemonologyDef(_, timeShift, currentSpell, gcd, tChosen)
	local unend 											= ConRO:AbilityReady(ids.Demo_Ability.UnendingResolve, timeShift);
	local hfunnel 											= ConRO:AbilityReady(ids.Demo_Ability.HealthFunnel, timeShift);

--Conditions	
	local petPh												= ConRO:PercentHealth('pet');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if hfunnel and summoned and petPh <= 50 then
		return ids.Demo_Ability.HealthFunnel;
	end
	
	if unend then
		return ids.Demo_Ability.UnendingResolve;
	end

return nil;
end

function ConRO.Warlock.Destruction(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local shards											= UnitPower('player', Enum.PowerType.SoulShards, 'true') / 10;
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manaPercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local immolate 											= ConRO:AbilityReady(ids.Dest_Ability.Immolate, timeShift);
		local immo 												= ConRO:TargetAura(ids.Dest_Debuff.Immolate, timeShift + 3);
	local cbolt 											= ConRO:AbilityReady(ids.Dest_Ability.ChaosBolt, timeShift);
		local eraDebuff											=ConRO:TargetAura(ids.Dest_Debuff.Eradication, timeShift);
	local imp 												= ConRO:AbilityReady(ids.Dest_Ability.SummonImp, timeShift);
	local conf				 								= ConRO:AbilityReady(ids.Dest_Ability.Conflagrate, timeShift);
		local confCharges										= ConRO:SpellCharges(ids.Dest_Ability.Conflagrate);
		local bdBuff, bdCount									= ConRO:Aura(ids.Dest_Buff.BackDraft, timeShift);
	local inci 												= ConRO:AbilityReady(ids.Dest_Ability.Incinerate, timeShift);
	local sInfernal, sInfCD									= ConRO:AbilityReady(ids.Dest_Ability.SummonInfernal, timeShift);
	local havoc, havCD										= ConRO:AbilityReady(ids.Dest_Ability.Havoc, timeShift);
		local havDebuff											=ConRO:TargetAura(ids.Dest_Debuff.Havoc, timeShift);
	local rofFire											= ConRO:AbilityReady(ids.Dest_Ability.RainofFire, timeShift);		
		
	local cdemonfire				 						= ConRO:AbilityReady(ids.Dest_Talent.ChannelDemonfire, timeShift);
	local sburn 											= ConRO:AbilityReady(ids.Dest_Talent.Shadowburn, timeShift);
	local sacrifice 										= ConRO:AbilityReady(ids.Dest_Talent.GrimoireofSacrifice, timeShift);
		local sacBuff 											= ConRO:Aura(ids.Dest_Buff.GrimoireofSacrifice, timeShift);
	local cata												= ConRO:AbilityReady(ids.Dest_Talent.Cataclysm, timeShift);
	local dsinstability, dsiCD								= ConRO:AbilityReady(ids.Dest_Talent.DarkSoulInstability, timeShift);
		local dsiBuff											= ConRO:Aura(ids.Dest_Buff.DarkSoulInstability, timeShift);
	local sFire 											= ConRO:AbilityReady(ids.Dest_Talent.SoulFire, timeShift);
		
	local splock 											= ConRO:AbilityReady(ids.Dest_PetAbility.SpellLock, timeShift);
	local dmagic											= ConRO:AbilityReady(ids.Dest_PetAbility.DevourMagic, timeShift);
	local oBlastRDY											= ConRO:AbilityReady(ids.Dest_PetAbility.OpticalBlast, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	
--Conditions
	local summoned 											= ConRO:CallPet();
	local HasVoid											= IsSpellKnown(ids.Dest_PetAbility.ThreateningPresence, true);
	local assist 											= ConRO:PetAssist();
	local moving 											= ConRO:PlayerSpeed();
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	local targets											= ConRO:Targets(ids.Dest_Ability.Incinerate);
	
	if currentSpell == ids.Dest_Ability.ChaosBolt then
		shards = shards - 2;
	elseif currentSpell == ids.Dest_Ability.Incinerate then
		shards = shards + 0.2;
	elseif currentSpell == ids.Dest_Talent.SoulFire then
		shards = shards + 0.4;
	end

--Indicators
	ConRO:AbilityInterrupt(ids.Dest_PetAbility.SpellLock, splock and ConRO:Interrupt());
	ConRO:AbilityInterrupt(ids.Dest_PetAbility.OpticalBlast, oBlastRDY and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Dest_PetAbility.DevourMagic, dmagic and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());

	ConRO:AbilityBurst(ids.Dest_Ability.RainofFire, rofFire and shards >= 3 and targets >= 3);	
	ConRO:AbilityBurst(ids.Dest_Ability.Havoc, havoc and not havDebuff and shards >= 2 and targets >= 2);
	ConRO:AbilityBurst(ids.Dest_Ability.SummonInfernal, sInfernal and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Dest_Talent.DarkSoulInstability, dsinstability and immo and shards >= 4 and ConRO_BurstButton:IsVisible());
	
--Warnings
	if not summoned and not tChosen[ids.Dest_Talent.GrimoireofSacrifice] then
		UIErrorsFrame:AddMessage("Summon your demon!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if not assist and summoned then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if havDebuff then
		UIErrorsFrame:AddMessage("Attack Non-Havoced target!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if sacrifice and not sacBuff and not HasVoid then
		if not summoned then
			UIErrorsFrame:AddMessage("Call your pet to sacrifice!!!", 1.0, 0.0, 0.0, 53, 5);
		end
		return ids.Dest_Talent.GrimoireofSacrifice;
	end

--Rotations
	if not incombat then
		if inci and currentSpell ~= ids.Dest_Ability.Incinerate then
			return ids.Dest_Ability.Incinerate;
		end

		if cata and not immo and currentSpell ~= ids.Dest_Talent.Cataclysm and currentSpell ~= ids.Dest_Ability.Immolate then
			return ids.Dest_Talent.Cataclysm;
		end

		if immolate and not immo and currentSpell ~= ids.Dest_Talent.Cataclysm and currentSpell ~= ids.Dest_Ability.Immolate then
			return ids.Dest_Ability.Immolate;
		end
	else
		if cata and not immo and currentSpell ~= ids.Dest_Talent.Cataclysm and currentSpell ~= ids.Dest_Ability.Immolate then
			return ids.Dest_Talent.Cataclysm;
		end

		if immolate and not immo and currentSpell ~= ids.Dest_Talent.Cataclysm and currentSpell ~= ids.Dest_Ability.Immolate then
			return ids.Dest_Ability.Immolate;
		end
		
		if conf and confCharges == 2 and shards <= 4 then
			return ids.Dest_Ability.Conflagrate;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if azEssence_GuardianofAzeroth then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if sInfernal and ConRO_FullButton:IsVisible() then
			return ids.Dest_Ability.SummonInfernal;
		end

		if dsinstability and (shards >= 4 or sInfCD <= 170) and ConRO_FullButton:IsVisible() then
			return ids.Dest_Talent.DarkSoulInstability;
		end
		
		if cbolt and (shards == 5 or dsiBuff or havCD > 20) then
			return ids.Dest_Ability.ChaosBolt;
		end

		if conf and shards <= 4 and bdCount <= 2 then
			return ids.Dest_Ability.Conflagrate;
		end
		
		if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end		

		if cdemonfire then
			return ids.Dest_Talent.ChannelDemonfire;
		end

		if sFire then
			return ids.Dest_Talent.SoulFire;
		end
		
		if cbolt and shards >= 2 and ((bdBuff and not tChosen[ids.Dest_Talent.Eradication]) or (tChosen[ids.Dest_Talent.Eradication] and not eraDebuff)) then
			return ids.Dest_Ability.ChaosBolt;
		end
		
		if sburn then
			return ids.Dest_Talent.Shadowburn;
		end
		
		if inci then
			return ids.Dest_Ability.Incinerate;
		end
	end
return nil;
end

function ConRO.Warlock.DestructionDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities
	local unend 											= ConRO:AbilityReady(ids.Dest_Ability.UnendingResolve, timeShift);
	local hfunnel 											= ConRO:AbilityReady(ids.Dest_Ability.HealthFunnel, timeShift);

--Conditions	
	local petPh												= ConRO:PercentHealth('pet');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if hfunnel and summoned and petPh <= 50 then
		return ids.Dest_Ability.HealthFunnel;
	end
	
	if unend then
		return ids.Dest_Ability.UnendingResolve;
	end

return nil;
end

ConRO.DemonCount = {};
ConRO.ImpCount = {};
ConRO.BasicDemons = { --[demon] = duration (0 to blacklist)
							[688] = 0,     --Imp
							[697] = 0,     --Voidwalker
							[691] = 0,     --Felhunter
							[712] = 0,     --Succubus
							[30146] = 0,   --Felguard
							[112866] = 0,  --Fel Imp
							[112867] = 0,  --Voidlord
							[112869] = 0,  --Observer
							[112868] = 0,  --Shivarra
							[112870] = 0,  --Wrathguard
							[240263] = 0,  --Fel Succubus
							[240266] = 0,  --Shadow Succubus
							[104317] = 0,  --Wild Imps, counted by other means
							[111898] = 15, --Grimoire: Felguard
							[193331] = 12, --Dreadstalker 1
							[193332] = 12, --Dreadstalker 2
							[265187] = 15, --Demonic Tyrant
							[264119] = 15  --Vilefiend
						};
						
function ConRO:COMBAT_LOG_EVENT_UNFILTERED()
	local _, subevent, _, sourceGUID, _, _, _, destGUID, destName, _, _, spellID = CombatLogGetCurrentEventInfo();
	local myGUID = UnitGUID("player");

	local ImpMaxCasts = 5;
	local ImpMaxTime = 20; --seconds
	local randomDemonsDuration = 15; --seconds
	local TyrantDuration = 15; --seconds
	local TyrantStart = 0;
	local TyrantActive = false;

		
		--Imps are summoned
		if subevent == "SPELL_SUMMON" and sourceGUID == myGUID and (spellID == 104317 or spellID == 279910) then 

			local tyrantExtra = TyrantActive and TyrantDuration - (GetTime() - TyrantStart) or 0
			
			ConRO.ImpCount[destGUID] = {ImpMaxCasts, GetTime() + ImpMaxTime + tyrantExtra - 0.1}
			C_Timer.After(ImpMaxTime + tyrantExtra, function()
					
					for k in pairs(ConRO.ImpCount) do
						if GetTime() > ConRO.ImpCount[k][2] then
							ConRO.ImpCount[k] = nil
						end
					end
			end)
			
			--Other demons are summoned
		elseif subevent == "SPELL_SUMMON" and sourceGUID == myGUID and not (spellID == 104317 or spellID == 279910) then
			
			if ConRO.BasicDemons[spellID] and ConRO.BasicDemons[spellID] > 0 then
				ConRO.DemonCount[destGUID] = GetTime() + ConRO.BasicDemons[spellID] - 0.1
				
				C_Timer.After(ConRO.BasicDemons[spellID], function()
						for k, v in pairs(ConRO.DemonCount) do
							if GetTime() > v then
								ConRO.DemonCount[k] = nil
							end
						end
				end)
				
			elseif not ConRO.BasicDemons[spellID] then
				ConRO.DemonCount[destGUID] = GetTime() + randomDemonsDuration - 0.1
				
				C_Timer.After(randomDemonsDuration, function()
						for k, v in pairs(ConRO.DemonCount) do
							if GetTime() > v then
								ConRO.DemonCount[k] = nil
							end
						end
				end)
			end
		end
		
		--Imps succesfully consume energy
		if subevent == "SPELL_CAST_SUCCESS" and ConRO.ImpCount[sourceGUID] and not TyrantActive then
			if ConRO.ImpCount[sourceGUID][1] == 1 then
				ConRO.ImpCount[sourceGUID] = nil
			else
				ConRO.ImpCount[sourceGUID][1] = ConRO.ImpCount[sourceGUID][1] - 1
			end
		end
		
		--Summon Demonic Tyrant
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 265187 then
			local remains
			
			TyrantActive = true
			TyrantStart = GetTime()
			
			if IsPlayerSpell(267215) then
				table.wipe(ConRO.ImpCount)
			end
			
			C_Timer.After(TyrantDuration, function()
					TyrantActive = false
					
					for k in pairs(ConRO.ImpCount) do
						if GetTime() > ConRO.ImpCount[k][2] then
							ConRO.ImpCount[k] = nil
						end
					end 
					
					for k, v in pairs(ConRO.DemonCount) do
						if GetTime() > v then
							ConRO.DemonCount[k] = nil
						end
					end
			end)
			
			for k in pairs(ConRO.ImpCount) do
				remains = ConRO.ImpCount[k][2] - GetTime()
				ConRO.ImpCount[k][2] = ConRO.ImpCount[k][2] + TyrantDuration - 0.1
				
				C_Timer.After(TyrantDuration + remains, function()
						for k in pairs(ConRO.ImpCount) do
							if GetTime() > ConRO.ImpCount[k][2] then
								ConRO.ImpCount[k] = nil
							end
						end      
				end)
			end
			
			for k in pairs(ConRO.DemonCount) do
				remains = ConRO.DemonCount[k] - GetTime()
				ConRO.DemonCount[k] = ConRO.DemonCount[k] + TyrantDuration - 0.1
				
				C_Timer.After(TyrantDuration + remains, function()
						for k, v in pairs(ConRO.DemonCount) do
							if GetTime() > v then
								ConRO.DemonCount[k] = nil
							end
						end
				end)
			end
		end
		
		--Implosion
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 196277 then
			table.wipe(ConRO.ImpCount)
		end
		
		--Power Siphon
		if subevent == "SPELL_CAST_SUCCESS" and sourceGUID == myGUID and spellID == 264130 then
			local oldest, oldestTime = "", 2*GetTime()
			
			for i = 1, 2 do
				for name, imp in pairs(ConRO.ImpCount) do
					oldestTime = math.min(imp[2], oldestTime)
					
					if imp[2] == oldestTime then
						oldest = name
					end
				end
				
				oldestTime = oldestTime*2
				
				ConRO.ImpCount[oldest] = nil
			end
		end
		
		--Death
		if subevent == "UNIT_DIED" or subevent == "SPELL_INSTAKILL" or subevent == "UNIT_DESTROYED" then
			if ConRO.ImpCount[destGUID] then
				ConRO.ImpCount[destGUID] = nil
				
			elseif ConRO.DemonCount[destGUID] then      
				ConRO.DemonCount[destGUID] = nil
				
			elseif destGUID == myGUID then
				table.wipe(ConRO.ImpCount)
				table.wipe(ConRO.DemonCount)
			end
		end		
	return true;
end

function ConRO:ImpsOut()
  local count = 0
	for k in pairs(ConRO.ImpCount) do 
		if k then
			count = count + 1;
		end
	end
--	print("Imp Count: " .. count);
	return count;
end

function ConRO:DemonsOut()
  local count = ConRO:ImpsOut();
	if IsPetActive() then
		count = count + 1;
	end
	for k in pairs(ConRO.DemonCount) do 
		if k then
			count = count + 1;
		end
	end
--	print("Demon Count: " .. count);
	return count;
end