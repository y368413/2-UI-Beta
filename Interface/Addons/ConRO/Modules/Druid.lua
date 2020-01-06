if select(2, UnitClass("player")) ~= "DRUID" then return end
local ConRO_Druid, ids = ...;

--Generic
	ids.Racial = {
		Berserking = 26297,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Druid_AzTrait = {
		ArcanicPulsar = 287773,
		IronJaws = 276021,
		GuardiansWrath = 278511,
		StreakingStars = 272871,
		WildFleshrending = 279527,
	}
	ids.Druid_AzTraitBuff = {
		IronJaws = 276026,
		GuardiansWrath = 279541,
	}
	ids.Druid_AzTraitDebuff = {
		ConcentratedFlame = 295368,
	}	
	ids.AzEssence = {
		BloodoftheEnemy = 298273,
		ConcentratedFlame = 295373,
		GuardianofAzeroth = 299358,
		MemoryofLucidDream = 298357,
		TheUnboundForce = 298452,
		WorldveinResonance = 295186,	
	}
	ids.AzEssenceBuff = {
		MemoryofLucidDream = 298357,	
	}
	
--Balance
	ids.Bal_Ability = {
		Barkskin = 22812,
		BearForm = 5487,
		CatForm = 768,
		CelestialAlignment = 194223,
		Dash = 1850,
		Dreamwalk = 193753,
		EntanglingRoots = 339,
		Growl = 6795,
		Hibernate = 2637,
		Innervate = 29166,
		LunarStrike = 194153,
		Mangle = 33917,
		Moonfire = 8921,
		MoonkinForm = 24858,
		Prowl = 5215,
		Rebirth = 20484,
		Regrowth = 8936,
		RemoveCorruption = 2782,
		Revive = 50769,
		Shred = 5221,
		SolarBeam = 78675,
		SolarWrath = 190984,
		Soothe = 2908,
		Starfall = 191034,
		Starsurge = 78674,
		Sunfire = 93402,
		TravelForm = 783,
	}
	ids.Bal_Passive = {
		AquaticForm = 276012,
		AstralInfluence = 197524,
		Eclipse = 279619,
		Empowerments = 279708,
		FlightForm = 276029,
		MasteryStarlight = 77492,		
	}
	ids.Bal_Talent = {
		--15
		NaturesBalance = 202430,
		WarriorofElune = 202425,
		ForceofNature = 205636,
		--30
		TigerDash = 252216,
		Renewal = 108238,
		WildCharge = 102401,
			WildCharge_Bear = 16979,
			WildCharge_Cat = 49376,
			WildCharge_Moonkin = 102383,
		--45
		FeralAffinity = 202157,
			FerociousBite = 22568,
			Rake = 1822,
			Rip = 1079,
			Swipe = 213764,
		GuardianAffinity = 197491,
			FrenziedRegeneration = 22842,
			Ironfur = 192081,
			ThickHide = 16931,	
		RestorationAffinity = 197492,
			Rejuenation = 774,
			Swiftmend = 18562,
			WildGrowth = 48438,
			YserasGift = 145108,
		--60
		MightyBash = 5211,
		MassEntanglement = 102359,
		Typhoon = 132469,
		--75
		SouloftheForest = 114107,
		Starlord = 202345,
		IncarnationChosenofElune = 102560,
		--90
		StellarDrift = 202354,
		TwinMoons = 279620,
		StellarFlare = 202347,
		--100
		ShootingStars = 202342,
		FuryofElune = 202770,
		NewMoon = 274281,
			HalfMoon = 274282,
			FullMoon = 274283,
	}
	ids.Bal_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		CelestialGuardian = 233754,
		CrescentBurn = 200567,
		CelestialDownpour = 200726,
		MoonandStars = 233750,
		MoonkinAura = 209740,
		DyingStars = 232546,
		DeepRoots = 233755,
		FaerieSwarm = 209749,
		Cyclone = 209753,
		PricklingThorns = 200549,
		Thorns = 236696,
		IronfeatherArmor = 233752,
		ProtectoroftheGrove = 209730,
	}
	ids.Bal_Form = {
		MoonkinForm = 24858,
		WarriorofElune = 202425,
	}
	ids.Bal_Buff = {
		CelestialAlignment = 194223,
		IncarnationChosenofElune = 102560,
		LunarEmpowerment = 164547,
		OwlkinFrenzy = 157228,
		SolarEmpowerment = 164545,
		Starfall = 191034,
		Starlord = 279709,
		StellarDrift = 202461,
	}
	ids.Bal_Debuff = {
		Moonfire = 164812,
		Sunfire = 164815,
		StellarFlare = 202347,
	}
	ids.Bal_PetAbility = {

	}
		
--Feral
	ids.Feral_Ability = {
		BearForm = 5487,
		Berserk = 106951,
		CatForm = 768,
		Dash = 1850,
		Dreamwalk = 193753,
		EntanglingRoots = 339,
		FerociousBite = 22568,
		Growl = 6795,
		Hibernate = 2637,
		Maim = 22570,
		Mangle = 33917,
		Moonfire = 8921,
		Prowl = 5215,
		Rake = 1822,
		Rebirth = 20484,
		Regrowth = 8936,
		RemoveCorruption = 2782,
		Revive = 50769,
		Rip = 1079,
		Shred = 5221,
		SkullBash = 106839,
		Soothe = 2908,
		StampedingRoar = 77764,
		SurvivalInstincts = 61336,
		Swipe = 213764,		
		Swipe_Cat = 106785,
		Swipe_Bear = 213771,
		Thrash = 106832,
		Thrash_Cat = 106830,
		Thrash_Bear = 77758,
		TigersFury = 5217,
		TravelForm = 783,
	}
	ids.Feral_Passive = {
		AquaticForm = 276012,
		FelineSwiftness = 131768,
		FeralInstinct = 16949,
		FlightForm = 276029,
		InfectedWounds = 48484,
		MasteryRazorClaws = 77493,
		OmenofClarity = 16864,
		PredatorySwiftness = 16974,
		PrimalFury = 159286,
	}
	ids.Feral_Talent = {
		--15
		Predator = 202021,
		Sabertooth = 202031,
		LunarInspiration = 155580,
			Moonfire_Cat = 155625,
		--30
		TigerDash = 252216,
		Renewal = 108238,
		WildCharge = 102401,
			WildCharge_Bear = 16979,
			WildCharge_Cat = 49376,
			WildCharge_Moonkin = 102383,
		--45
		BalanceAffinity = 197488,
			AstralInfluence = 197524,
			LunarStrike = 197628,
			Starsurge = 197626,
			SolarWrath = 197629,
			Sunfire = 197630,
		GuardianAffinity = 217615,
			FrenziedRegeneration = 22842,
			Ironfur = 192081,
			ThickHide = 16931,	
		RestorationAffinity = 197492,
			Rejuenation = 774,
			Swiftmend = 18562,
			WildGrowth = 48438,
			YserasGift = 145108,		
		--60
		MightyBash = 5211,
		MassEntanglement = 102359,
		Typhoon = 132469,
		--75
		SouloftheForest = 158476,
		SavageRoar = 52610,
		IncarnationKingoftheJungle = 102543,
		--90
		ScentofBlood = 285564,
		BrutalSlash = 202028,
		PrimalWrath = 285381,
		--100
		MomentofClarity = 236068,
		Bloodtalons = 155672,
		FeralFrenzy = 274837,
	}
	ids.Feral_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		Thorns = 236696,
		EarthenGrasp = 236023,
		FreedomoftheHerd = 213200,
		MalornesSwiftness = 236012,
		KingoftheJungle = 203052,
		EnragedMaim = 236026,
		FerociousWound = 236020,
		FreshWound = 203224,
		RipandTear = 203242,
		SavageMomentum = 205673,
		ProtectoroftheGrove = 209730,
		ToothandClaw = 236019,
			EnragedMaul = 236716,		
	}
	ids.Feral_Form = {
		BearForm = 5487,
		CatForm = 768,
		Prowl = 5215,
	}
	ids.Feral_Buff = {
		ApexPredator = 252752,
		Berserk = 106951,
		Bloodtalons = 145152,
		Clearcasting = 135700,
		IncarnationKingoftheJungle = 102543,
		TigersFury = 5217,
		PredatorySwiftness = 69369,
		Regrowth = 8936,
		SavageRoar = 52610,
		ToothandClaw = 236440,
	}
	ids.Feral_Debuff = {
		Moonfire = 155625,
		Rake = 155722,
			RakeStun = 163505,
		Rip = 1079,
		Thrash_Cat = 106830,
		Thrash_Bear = 192090,
	}
	ids.Feral_PetAbility = {

	}

--Guardian
	ids.Guard_Ability = {
		Barkskin = 22812,
		BearForm = 5487,
		CatForm = 768,
		Dash = 1850,
		Dreamwalk = 193753,
		EntanglingRoots = 339,
		FrenziedRegeneration = 22842,
		Growl = 6795,
		IncapacitatingRoar = 99,
		Ironfur = 192081,
		Mangle = 33917,
		Maul = 6807,
		Moonfire = 8921,
		Prowl = 5215,
		Rebirth = 20484,
		Regrowth = 8936,
		RemoveCorruption = 2782,
		Revive = 50769,
		Shred = 5221,
		SkullBash = 106839,
		Soothe = 2908,
		StampedingRoar = 77761,
		SurvivalInstincts = 61336,
		Swipe = 213764,
		Swipe_Bear = 213771,
		Thrash = 106832,
		Thrash_Bear = 77758,
		TravelForm = 783,
	}
	ids.Guard_Passive = {
		AquaticForm = 276012,
		FlightForm = 276029,
		Gore = 210706,
		LightningReflexes = 231065,
		MasteryNaturesGuardian = 155783,
		ThickHide = 16931,
	}
	ids.Guard_Talent = {
		--15
		Brambles = 203953,
		BloodFrenzy = 203962,
		BristlingFur = 155835,
		--30
		TigerDash = 252216,
		UrsolsVortex = 102793,
		WildCharge = 102401,
			WildCharge_Bear = 16979,
			WildCharge_Cat = 49376,
			WildCharge_Moonkin = 102383,
		--45
		BalanceAffinity = 197488,
			AstralInfluence = 197524,
			LunarStrike = 197628,
			Starsurge = 197626,
			SolarWrath = 197629,
			Sunfire = 197630,
		FeralAffinity = 197490,
			FerociousBite = 22568,
			Rake = 1822,
			Rip = 1079,
			Swipe = 213764,
		RestorationAffinity = 197492,
			Rejuenation = 774,
			Swiftmend = 18562,
			WildGrowth = 48438,
			YserasGift = 145108,
		--60
		MightyBash = 5211,
		MassEntanglement = 102359,
		Typhoon = 132469,
		--75
		SouloftheForest = 158477,
		GalacticGuardian = 203964,
		IncarnationGuardianofUrsoc = 102558,
		--90
		Earthwarden = 203974,
		SurvivaloftheFittest = 203965,
		GuardianofElune = 155578,
		--100
		RendandTear = 204053,
		LunarBeam = 204066,
		Pulverize = 80313,
	}
	ids.Guard_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		MasterShapeshifter = 236144,
		Toughness = 201259,
		DenMother = 236180,
		DemoralizingRoar = 201664,
		ClanDefender = 213951,
		RagingFrenzy = 236153,
		SharpenedClaws = 202110,
		ChargingBash = 228431,
		EntanglingClaws = 202226,
		Overrun = 202246,
		ProtectorofthePack = 202043,
		AlphaChallenge = 207017,
		MalornesSwiftness = 236147,
		RoaringSpeed = 236148,
	}
	ids.Guard_Form = {
		BearForm = 5487,
	}
	ids.Guard_Buff = {
		Ironfur = 192081,
		IncarnationGuardianofUrsoc = 102558,
		Pulverize = 158792,
		GalacticGuardian = 213708,
	}
	ids.Guard_Debuff = {
		Thrash = 192090,
		Moonfire = 164812,
	}
	ids.Guard_PetAbility = {
	
	}
	
--Restoration
	ids.Resto_Ability = {
		Barkskin = 22812,
		BearForm = 5487,
		CatForm = 768,
		Dash = 1850,
		Dreamwalk = 193753,
		Efflorescence = 145205,
		EntanglingRoots = 339,
		Growl = 6795,
		Hibernate = 2637,
		Innervate = 29166,
		Ironbark = 102342,
		Lifebloom = 33763,
		Mangle = 33917,
		Moonfire = 8921,
		NaturesCure = 88423,
		Prowl = 5215,
		Rebirth = 20484,
		Regrowth = 8936,
		Rejuvenation = 774,
		Revitalize = 212040,
		Revive = 50769,
		Shred = 5221,
		SolarWrath = 5176,
		Soothe = 2908,
		Sunfire = 93402,
		Swiftmend = 18562,
		Tranquility = 740,
		TravelForm = 783,
		UrsolsVortex = 102793,
		WildGrowth = 48438,
	}
	ids.Resto_Passive = {
		AquaticForm = 276012,
		FlightForm = 276029,
		MasteryHarmony = 77495,
		OmenofClarity = 113043,
		YserasGift = 145108,
	}
	ids.Resto_Talent = {
		--15
		Abundance = 207383,
		Prosperity = 200383,
		CenarionWard = 102351,
		--30
		TigerDash = 252216,
		Renewal = 108238,
		WildCharge = 102401,
			WildChargeBear = 16979,
			WildChargeCat = 49376,
			WildChargeMoonkin = 102383,
		--45
		BalanceAffinity = 197488,
			AstralInfluence = 197524,
			LunarStrike = 197628,
			Starsurge = 197626,
			SolarWrath = 197629,
			Sunfire = 197630,
		FeralAffinity = 197490,
			FerociousBite = 22568,
			Rake = 1822,
			Rip = 1079,
			Swipe = 213764,
		GuardianAffinity = 217615,
			FrenziedRegeneration = 22842,
			Ironfur = 192081,
			ThickHide = 16931,	
		--60
		MightyBash = 5211,
		MassEntanglement = 102359,
		Typhoon = 132469,
		--75
		SouloftheForest = 158478,
		Cultivation = 200390,
		IncarnationTreeofLife = 33891,
		--90
		InnerPeace = 197073,
		Stonebark = 197061,
		SpringBlossoms = 207385,
		--100
		Photosynthesis = 274902,
		Germination = 155675,
		Flourish = 197721,
	}
	ids.Resto_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		
	}
	ids.Resto_Form = {

	}
	ids.Resto_Buff = {
		Lifebloom =	33763,
		Regrowth = 8936,
	}
	ids.Resto_Debuff = {

	}
	ids.Resto_PetAbility = {
	
	}
	
	ConRO.Druid = {};
ConRO.Druid.CheckTalents = function()
end
local ConRO_Druid, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Druid.CheckTalents;
	if mode == 1 then
		self.Description = "Druid [Balance - Caster]";
		self.NextSpell = ConRO.Druid.Balance;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = "Druid [Feral - Melee]";
		self.NextSpell = ConRO.Druid.Feral;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = "Druid [Guardian - Tank]";
		self.NextSpell = ConRO.Druid.Guardian;
		self.ToggleHealer();
	end;
	if mode == 4 then
		self.Description = "Druid [Restoration - Healer]";
		self.NextSpell = ConRO.Druid.Restoration;
		self.ToggleHealer();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Druid.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Druid.BalanceDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Druid.FeralDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Druid.GuardianDef;
	end;
	if mode == 4 then
		self.NextDef = ConRO.Druid.RestorationDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Druid.Balance(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local plvl 												= UnitLevel("player");
	local lunar 											= UnitPower('player', Enum.PowerType.LunarPower);

--Abilities
	local tracial											= ConRO:AbilityReady(ids.Racial.Berserking, timeShift);

	local soothe											= ConRO:AbilityReady(ids.Bal_Ability.Soothe, timeShift); 
	local calign											= ConRO:AbilityReady(ids.Bal_Ability.CelestialAlignment, timeShift);
		local calignBUFF										= ConRO:Aura(ids.Bal_Buff.CelestialAlignment, timeShift);
	local sbeam 											= ConRO:AbilityReady(ids.Bal_Ability.SolarBeam, timeShift);
	local mfire 											= ConRO:AbilityReady(ids.Bal_Ability.Moonfire, timeShift);
		local mfDebuff											= ConRO:TargetAura(ids.Bal_Debuff.Moonfire, timeShift + 5);
		local mfDebuffMoving									= ConRO:TargetAura(ids.Bal_Debuff.Moonfire, timeShift + 10);
	local sfire 											= ConRO:AbilityReady(ids.Bal_Ability.Sunfire, timeShift);
		local sfDebuff											= ConRO:TargetAura(ids.Bal_Debuff.Sunfire, timeShift + 3);
		local sfDebuffMoving									= ConRO:TargetAura(ids.Bal_Debuff.Sunfire, timeShift + 8);
	local swrath											= ConRO:AbilityReady(ids.Bal_Ability.SolarWrath, timeShift);
	local lstrike											= ConRO:AbilityReady(ids.Bal_Ability.LunarStrike, timeShift);
	local ssurge											= ConRO:AbilityReady(ids.Bal_Ability.Starsurge, timeShift);
	local sfall 											= ConRO:AbilityReady(ids.Bal_Ability.Starfall, timeShift);
	local mkForm											= ConRO:AbilityReady(ids.Bal_Ability.MoonkinForm, timeShift);
	
	local sflare											= ConRO:AbilityReady(ids.Bal_Talent.StellarFlare, timeShift);	
		local stDebuff 											= ConRO:TargetAura(ids.Bal_Debuff.StellarFlare, timeShift + 7);	
	local woe 												= ConRO:AbilityReady(ids.Bal_Talent.WarriorofElune, timeShift);	
	local foe 												= ConRO:AbilityReady(ids.Bal_Talent.FuryofElune, timeShift);
	local fon 												= ConRO:AbilityReady(ids.Bal_Talent.ForceofNature, timeShift);
	local icoe 												= ConRO:AbilityReady(ids.Bal_Talent.IncarnationChosenofElune, timeShift);
		local icoeBUFF											= ConRO:Aura(ids.Bal_Buff.IncarnationChosenofElune, timeShift);
	local newmoon	  										= ConRO:AbilityReady(ids.Bal_Talent.NewMoon, timeShift);
		local newCharges										= ConRO:SpellCharges(ids.Bal_Talent.NewMoon);
		
	local boe 												= ConRO:Form(ids.Bal_Form.BlessingofElune);
	local mf 												= ConRO:Form(ids.Bal_Form.MoonkinForm);
	local woeBuff 											= ConRO:Form(ids.Bal_Form.WarriorofElune);
	
	local seBuff, solarCharges 								= ConRO:Aura(ids.Bal_Buff.SolarEmpowerment, timeShift);
	local leBuff, lunarCharges 								= ConRO:Aura(ids.Bal_Buff.LunarEmpowerment, timeShift);
	local sfBuff 											= ConRO:Aura(ids.Bal_Buff.Starfall, timeShift);
	local ofBuff 											= ConRO:Aura(ids.Bal_Buff.OwlkinFrenzy, timeShift);
	local slBuff, slCharges									= ConRO:Aura(ids.Bal_Buff.Starlord, timeShift);
	

	local fmoon 											= ConRO:TargetAura(ids.Bal_Debuff.Moonfire, timeShift + 18);
	local fsun 												= ConRO:TargetAura(ids.Bal_Debuff.Sunfire, timeShift + 15);
	local fstellar 											= ConRO:TargetAura(ids.Bal_Debuff.StellarFlare, timeShift + 18);

	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);	
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
		local moldAzEssBuff										= ConRO:Aura(ids.AzEssenceBuff.MemoryofLucidDream, timeShift);
		
--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local moving 											= ConRO:PlayerSpeed();
	
	if currentSpell == ids.Bal_Talent.FullMoon then
		lunar = lunar + 40;
	elseif currentSpell == ids.Bal_Talent.NewMoon then
		lunar = lunar + 10;
	elseif currentSpell == ids.Bal_Talent.HalfMoon then
		lunar = lunar + 20;
	elseif currentSpell == ids.Bal_Ability.SolarWrath then
		lunar = lunar + 8;
	elseif currentSpell == ids.Bal_Ability.LunarStrike then
		lunar = lunar + 12;
	end
	
	if currentSpell == ids.Bal_Ability.SolarWrath then
		solarCharges = solarCharges - 1;
	elseif currentSpell == ids.Bal_Ability.LunarStrike then
		lunarCharges = lunarCharges - 1;
	end

	local newMoonPhase = ids.Bal_Talent.FullMoon;
	
	if ConRO:FindSpell(ids.Bal_Talent.NewMoon) then
		newMoonPhase = ids.Bal_Talent.NewMoon;
	elseif ConRO:FindSpell(ids.Bal_Talent.HalfMoon) then
		newMoonPhase = ids.Bal_Talent.HalfMoon;
	end

--Indicators
	ConRO:AbilityInterrupt(ids.Bal_Ability.SolarBeam, sbeam and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Bal_Ability.Soothe, soothe and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Bal_Talent.IncarnationChosenofElune, icoe and mfDebuff and sfDebuff and (not tChosen[ids.Bal_Talent.StellarFlare] or (tChosen[ids.Bal_Talent.StellarFlare] and sfDebuff)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Bal_Ability.CelestialAlignment, calign and mfDebuff and sfDebuff and (not tChosen[ids.Bal_Talent.StellarFlare] or (tChosen[ids.Bal_Talent.StellarFlare] and sfDebuff)) and ConRO_BurstButton:IsVisible() and not tChosen[ids.Bal_Talent.IncarnationChosenofElune]);
	
--Rotations	
	if mkForm and not mf then
		return ids.Bal_Ability.MoonkinForm;
	end

	if not incombat then
		if swrath and ConRO_SingleButton:IsVisible() then
			return ids.Bal_Ability.SolarWrath;
		elseif lstrike and ConRO_AoEButton:IsVisible() then
			return ids.Bal_Ability.LunarStrike;
		end
	elseif moving then
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if mfire and not mfDebuffMoving then
			return ids.Bal_Ability.Moonfire;
		elseif sfire and not sfDebuffMoving	then
			return ids.Bal_Ability.Sunfire;
		end
		if sfall and lunar >= 50 and not sfBuff and ConRO_AoEButton:IsVisible() and not ConRO:AzPowerChosen(ids.Druid_AzTrait.ArcanicPulsar) then
			return ids.Bal_Ability.Starfall;
		end	
		if ssurge and lunar >= 40 and (solarCharges < 3 and lunarCharges < 3) then
			return ids.Bal_Ability.Starsurge;
		end
		if lstrike and woeBuff then
			return ids.Bal_Ability.LunarStrike;
		end
	else
		if ssurge and lunar >= 40 and tChosen[ids.Bal_Talent.Starlord] and slBuff and slCharges < 3 then
			return ids.Bal_Ability.Starsurge;
		end
		
		if mfire and not mfDebuff then
			return ids.Bal_Ability.Moonfire;
		elseif sflare and not stDebuff and currentSpell ~= ids.Bal_Talent.StellarFlare then
			return ids.Bal_Talent.StellarFlare;
		elseif sfire and not sfDebuff then
			return ids.Bal_Ability.Sunfire;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if calign and not calignBUFF and ConRO_FullButton:IsVisible() and not tChosen[ids.Bal_Talent.IncarnationChosenofElune] then
			return ids.Bal_Ability.CelestialAlignment;
		end
		
		if icoe and not icoeBUFF and ConRO_FullButton:IsVisible() then
			return ids.Bal_Talent.IncarnationChosenofElune;
		end
		
		if foe then
			return ids.Bal_Talent.FuryofElune;
		end
		
		if woe and not woeBuff then
			return ids.Bal_Talent.WarriorofElune;
		end
		
		if fon then
			return ids.Bal_Talent.ForceofNature;
		end

		if ssurge and lunar >= 80 and (solarCharges < 3 and lunarCharges < 3) and (not tChosen[ids.Bal_Talent.Starlord] or (tChosen[ids.Bal_Talent.Starlord] and not slBuff)) and (ConRO_SingleButton:IsVisible() or ConRO:AzPowerChosen(ids.Druid_AzTrait.ArcanicPulsar)) then
			if not (ConRO:AzPowerChosen(ids.Druid_AzTrait.StreakingStars) and (calignBUFF or icoeBUFF) and (currentSpell == ids.Bal_Ability.Starsurge or ConRO.lastSpellId == ids.Bal_Ability.Starsurge)) then
				return ids.Bal_Ability.Starsurge;
			end
		end
		
		if sfall and lunar >= 50 and not sfBuff and ConRO_AoEButton:IsVisible() and not ConRO:AzPowerChosen(ids.Druid_AzTrait.ArcanicPulsar) then
			if not (ConRO:AzPowerChosen(ids.Druid_AzTrait.StreakingStars) and (calignBUFF or icoeBUFF) and (currentSpell == ids.Bal_Ability.Starfall or ConRO.lastSpellId == ids.Bal_Ability.Starfall)) then
				return ids.Bal_Ability.Starfall;
			end
		end		

		if lstrike and ((leBuff and plvl <= 69) or (lunarCharges >= 1 and solarCharges < 3)) then
			if not (ConRO:AzPowerChosen(ids.Druid_AzTrait.StreakingStars) and (calignBUFF or icoeBUFF) and (currentSpell == ids.Bal_Ability.LunarStrike or ConRO.lastSpellId == ids.Bal_Ability.LunarStrike)) then
				return ids.Bal_Ability.LunarStrike;
			end
		end

		if swrath and solarCharges >= 1 then
			if not (ConRO:AzPowerChosen(ids.Druid_AzTrait.StreakingStars) and (calignBUFF or icoeBUFF) and (currentSpell == ids.Bal_Ability.SolarWrath or ConRO.lastSpellId == ids.Bal_Ability.SolarWrath)) then
				return ids.Bal_Ability.SolarWrath;
			end
		end
		
		if newmoon and newCharges > 1 then
			return newMoonPhase;
		elseif newmoon and newCharges == 1 and (currentSpell ~= ids.Bal_Talent.NewMoon and currentSpell ~= ids.Bal_Talent.HalfMoon and currentSpell ~= ids.Bal_Talent.FullMoon) then
			return newMoonPhase;
		end
		
		
		if ConRO:AzPowerChosen(ids.Druid_AzTrait.StreakingStars) and (calignBUFF or icoeBUFF) then
			if ConRO_SingleButton:IsVisible() then
				if swrath and (currentSpell ~= ids.Bal_Ability.SolarWrath or ConRO.lastSpellId ~= ids.Bal_Ability.SolarWrath) then
					return ids.Bal_Ability.SolarWrath;
				elseif lstrike and (currentSpell ~= ids.Bal_Ability.LunarStrike or ConRO.lastSpellId ~= ids.Bal_Ability.LunarStrike) then
					return ids.Bal_Ability.LunarStrike;
				end
			elseif ConRO_AoEButton:IsVisible() then
				if lstrike and (currentSpell ~= ids.Bal_Ability.LunarStrike or ConRO.lastSpellId ~= ids.Bal_Ability.LunarStrike) then
					return ids.Bal_Ability.LunarStrike;
				elseif swrath and (currentSpell ~= ids.Bal_Ability.SolarWrath or ConRO.lastSpellId ~= ids.Bal_Ability.SolarWrath) then
					return ids.Bal_Ability.SolarWrath;
				end
			end
		else
			if swrath and ConRO_SingleButton:IsVisible() then
				return ids.Bal_Ability.SolarWrath;
			elseif lstrike and ConRO_AoEButton:IsVisible() then
				return ids.Bal_Ability.LunarStrike;
			end
		end
	end
end

function ConRO.Druid.BalanceDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local bark 												= ConRO:AbilityReady(ids.Bal_Ability.Barkskin, timeShift);
	
	local renewal 											= ConRO:AbilityReady(ids.Bal_Talent.Renewal, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if renewal and playerPh <= 60 then
		return ids.Bal_Talent.Renewal;
	end
	
	if bark then
		return ids.Bal_Ability.Barkskin;
	end
	
	return nil;
end

function ConRO.Druid.Feral(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local combo 											= UnitPower('player', Enum.PowerType.ComboPoints);
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);

--Abilities	
	local soothe											= ConRO:AbilityReady(ids.Feral_Ability.Soothe, timeShift); 
	local prowl 											= ConRO:AbilityReady(ids.Feral_Ability.Prowl, timeShift);
		local pr 												= ConRO:Form(ids.Feral_Form.Prowl);
	local shred												= ConRO:AbilityReady(ids.Feral_Ability.Shred, timeShift);		
	local tfury 											= ConRO:AbilityReady(ids.Feral_Ability.TigersFury, timeShift + 0.5);
		local tfBuff											= ConRO:Aura(ids.Feral_Buff.TigersFury, timeShift);
	local berserk											= ConRO:AbilityReady(ids.Feral_Ability.Berserk, timeShift);
		local berBuff											= ConRO:Aura(ids.Feral_Buff.Berserk, timeShift);
	local sbash 											= ConRO:AbilityReady(ids.Feral_Ability.SkullBash, timeShift);
	local catform 											= ConRO:AbilityReady(ids.Feral_Ability.CatForm, timeShift);
		local bf												= ConRO:Form(ids.Feral_Form.BearForm);
		local cf												= ConRO:Form(ids.Feral_Form.CatForm);
	local regrow 											= ConRO:AbilityReady(ids.Feral_Ability.Regrowth, timeShift);
		local psBuff											= ConRO:Aura(ids.Feral_Buff.PredatorySwiftness, timeShift);
		local btBuff											= ConRO:Aura(ids.Feral_Buff.Bloodtalons, timeShift);
		local ccBuff 											= ConRO:Aura(ids.Feral_Buff.Clearcasting, timeShift);
	local rake												= ConRO:AbilityReady(ids.Feral_Ability.Rake, timeShift);
		local rakeDebuff 										= ConRO:TargetAura(ids.Feral_Debuff.Rake, timeShift + 4);
		local rakeStun 											= ConRO:TargetAura(ids.Feral_Debuff.RakeStun, timeShift);
	local rip												= ConRO:AbilityReady(ids.Feral_Ability.Rip, timeShift);
		local apBuff											= ConRO:Aura(ids.Feral_Buff.ApexPredator, timeShift);
		local ripDebuff, _, ripDur 								= ConRO:TargetAura(ids.Feral_Debuff.Rip, timeShift);
	local mfire												= ConRO:AbilityReady(ids.Feral_Ability.Moonfire, timeShift);
		local mfDebuff											= ConRO:TargetAura(ids.Feral_Debuff.Moonfire, timeShift + 4);
	local thrash											= ConRO:AbilityReady(ids.Feral_Ability.Thrash, timeShift);
		local thrDebuff 										= ConRO:TargetAura(ids.Feral_Debuff.Thrash_Cat, timeShift + 2);
		local thrBCD 											= ConRO:Cooldown(ids.Feral_Ability.Thrash_Bear, timeShift);
		local thrBDebuff, thrBCount 							= ConRO:TargetAura(ids.Feral_Debuff.Thrash_Bear, timeShift);
	local fbite												= ConRO:AbilityReady(ids.Feral_Ability.FerociousBite, timeShift);
	local swipe												= ConRO:AbilityReady(ids.Feral_Ability.Swipe, timeShift);
	local swipeB											= ConRO:AbilityReady(ids.Feral_Ability.Swipe_Bear, timeShift);
	local mang												= ConRO:AbilityReady(ids.Feral_Ability.Mangle, timeShift);	
	local maim												= ConRO:AbilityReady(ids.Feral_Ability.Maim, timeShift);
	
	local kotj												= ConRO:AbilityReady(ids.Feral_Talent.IncarnationKingoftheJungle, timeShift);
		local kotjBuff 											= ConRO:Aura(ids.Feral_Buff.IncarnationKingoftheJungle, timeShift);
	local bslash											= ConRO:AbilityReady(ids.Feral_Talent.BrutalSlash, timeShift);
		local bsCharges, bsMaxCharges, bsCCD					= ConRO:SpellCharges(ids.Feral_Talent.BrutalSlash);
	local ffrenzy			 								= ConRO:AbilityReady(ids.Feral_Talent.FeralFrenzy, timeShift);
	local sroar				 								= ConRO:AbilityReady(ids.Feral_Talent.SavageRoar, timeShift);
		local srBuff, _, srDur									= ConRO:Aura(ids.Feral_Buff.SavageRoar, timeShift);
	local wcharge 											= ConRO:AbilityReady(ids.Feral_Talent.WildCharge, timeShift);
	local pwrath 											= ConRO:AbilityReady(ids.Feral_Talent.PrimalWrath, timeShift);	

	local emaul												= ConRO:AbilityReady(ids.Feral_PvPTalent.EnragedMaul, timeShift);
		local pvp_tnc											= ConRO:Form(ids.Feral_Buff.ToothandClaw, timeShift);	

	local azChosen_IronJaws, azCount_IronJaws				= ConRO:AzPowerChosen(ids.Druid_AzTrait.IronJaws);
		local ijAzBuff											= ConRO:Aura(ids.Druid_AzTraitBuff.IronJaws, timeShift);
	
	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);	
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
		local cfAzDebuff										= ConRO:TargetAura(ids.Druid_AzTraitDebuff.ConcentratedFlame, timeShift)
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
		local moldAzEssBuff										= ConRO:Aura(ids.AzEssenceBuff.MemoryofLucidDream, timeShift);
			
--Conditions
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Feral_Ability.Rake), 'target');	
	local incombat 											= UnitAffectingCombat('player');
	local targetPh 											= ConRO:PercentHealth('target');
	local tarInMelee										= ConRO:Targets(ids.Feral_Ability.Rake);
	
--Indicators		
	ConRO:AbilityInterrupt(ids.Feral_Ability.SkullBash, sbash and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Feral_Ability.Soothe, soothe and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Feral_Ability.Berserk, berserk and ConRO_BurstButton:IsVisible() and not tChosen[ids.Feral_Talent.IncarnationKingoftheJungle]);
	ConRO:AbilityBurst(ids.Feral_Talent.IncarnationKingoftheJungle, kotj and ConRO_BurstButton:IsVisible());

--Rotations	
	if bf then
		if not inMelee and wcharge then
			return ids.Feral_Talent.WildCharge_Bear;
		end

		if thrash and thrBCD <= 0 and thrBCount < 3 then
			return ids.Feral_Ability.Thrash_Bear;
		end

		if mang then
			return ids.Feral_Ability.Mangle;
		end
		
		if thrash and thrBCD <= 0 then
			return ids.Feral_Ability.Thrash_Bear;
		end
		
		if emaul and pvp_tnc then
			return ids.Feral_Ability.EnragedMaul;
		end	
		
		if swipe then
			return ids.Feral_Ability.Swipe_Bear;
		end
	
		return;
	end
	
	if not incombat then 
		if regrow and not pr and tChosen[ids.Feral_Talent.Bloodtalons] and not btBuff and currentSpell ~= ids.Feral_Ability.Regrowth then
			return ids.Feral_Ability.Regrowth;
		end	
	
		if catform and not cf then
			return ids.Feral_Ability.CatForm;
		end
		
		if prowl and not pr then
			return ids.Feral_Ability.Prowl;
		end

		if wcharge and not inMelee then
			return ids.Feral_Talent.WildCharge_Cat;
		end
		
		if rake and not rakeDebuff then
			return ids.Feral_Ability.Rake;
		end		
	
	elseif (ConRO_AutoButton:IsVisible() and tarInMelee >= 4) or ConRO_AoEButton:IsVisible() then
		if catform and not cf then
			return ids.Feral_Ability.CatForm;
		end

		if regrow and psBuff and not btBuff and combo >= 4 and tChosen[ids.Feral_Talent.Bloodtalons] then
			return ids.Feral_Ability.Regrowth;
		end

		if tfury and not tfBuff and energy <= energyMax - 50 then
			return ids.Feral_Ability.TigersFury;
		end

		if ffrenzy and combo <= 0 then
			return ids.Feral_Talent.FeralFrenzy;
		end
		
		if berserk and ConRO_FullButton:IsVisible() and not tChosen[ids.Feral_Talent.IncarnationKingoftheJungle] then
			return ids.Feral_Ability.Berserk;
		end

		if kotj and ConRO_FullButton:IsVisible() then
			return ids.Feral_Talent.IncarnationKingoftheJungle;
		end
		
		if bslash and (bsCharges == bsMaxCharges or (bsCharges == bsMaxCharges - 1 and bsCCD <= 1.5)) then
			return ids.Feral_Talent.BrutalSlash;
		end
		
		if pwrath and combo == 5 then
			return ids.Feral_Talent.PrimalWrath;
		end

		if thrash and not thrDebuff then
			return ids.Feral_Ability.Thrash_Cat;
		end
		
		if rake and not rakeDebuff then
			return ids.Feral_Ability.Rake;
		end
		
		if sroar and (not srBuff or srDur <= 10) and combo == 5 then
			return ids.Feral_Talent.SavageRoar;
		end
		
		if rip and not ripDebuff and combo == 5 then
			return ids.Feral_Ability.Rip;
		end
		
		if fbite and combo >= 5 and ripDebuff then
			return ids.Feral_Ability.FerociousBite;
		end
			
		if bslash and thrDebuff and bsCharges >= 1 and combo <= 4 then
			return ids.Feral_Talent.BrutalSlash;
		end

		if swipe and rakeDebuff and not tChosen[ids.Feral_Talent.BrutalSlash] and combo <= 4 then
			return ids.Feral_Ability.Swipe_Cat;
		end
	else
		if catform and not cf then
			return ids.Feral_Ability.CatForm;
		end

		if azEssence_ConcentratedFlame and tfBuff and not cfAzDebuff then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if regrow and psBuff and combo >= 4 and not btBuff and tChosen[ids.Feral_Talent.Bloodtalons] then
			return ids.Feral_Ability.Regrowth;
		end

		if tfury and not tfBuff and energy <= energyMax - 70 then
			return ids.Feral_Ability.TigersFury;
		end

		if ffrenzy and combo <= 0 then
			return ids.Feral_Talent.FeralFrenzy;
		end
		
		if berserk and ConRO_FullButton:IsVisible() and not tChosen[ids.Feral_Talent.IncarnationKingoftheJungle] then
			return ids.Feral_Ability.Berserk;
		end

		if kotj and ConRO_FullButton:IsVisible() then
			return ids.Feral_Talent.IncarnationKingoftheJungle;
		end
		
		if pwrath and combo == 5 and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
			return ids.Feral_Talent.PrimalWrath;
		end		
		
		if bslash and (bsCharges == bsMaxCharges or (bsCharges == bsMaxCharges - 1 and bsCCD <= 1.5)) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Feral_Talent.BrutalSlash;
		end	
		
		if rip and not ripDebuff and combo >= 5 then
			return ids.Feral_Ability.Rip;
		end
			
		if tChosen[ids.Feral_Talent.Sabertooth] then
			if fbite and ripDur <= 9 and combo >= 5 then
				return ids.Feral_Ability.FerociousBite;
			end
		else
			if rip and ripDur <= 7 and combo >= 5 then
				return ids.Feral_Ability.Rip;
			end
		end
		
		if rake and not rakeDebuff then
			return ids.Feral_Ability.Rake;
		end	
		
		if sroar and (not srBuff or srDur <= 9) and combo >= 5 then
			return ids.Feral_Talent.SavageRoar;
		end
		
		if maim and combo >= 5 and azChosen_IronJaws and azCount_IronJaws >= 2 and ijAzBuff then
			return ids.Feral_Ability.Maim;
		end
		
		if fbite and apBuff then
			return ids.Feral_Ability.FerociousBite;
		end
		
		if fbite and combo >= 5 and ripDur >= 10 and (not tChosen[ids.Feral_Talent.SavageRoar] or (tChosen[ids.Feral_Talent.SavageRoar] and srDur >= 10)) then
			return ids.Feral_Ability.FerociousBite;
		end

		if mfire and not mfDebuff and tChosen[ids.Feral_Talent.LunarInspiration] then
			return ids.Feral_Talent.Moonfire_Cat;
		end
		
		if thrash and not thrDebuff and (ConRO:AzPowerChosen(ids.Druid_AzTrait.WildFleshrending) or (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Feral_Ability.Thrash_Cat;
		end
		
		if swipe and rakeDebuff and not tChosen[ids.Feral_Talent.BrutalSlash] and combo <= 4 and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
			return ids.Feral_Ability.Swipe_Cat;
		end
		
		if bslash and combo <= 4 and ((ConRO_AutoButton:IsVisible() and not ccBuff) or ConRO_AoEButton:IsVisible()) then
			return ids.Feral_Talent.BrutalSlash;
		end
		
		if shred and combo <= 4 then
			return ids.Feral_Ability.Shred;
		end
	end
return nil;
end

function ConRO.Druid.FeralDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities
	local surv 												= ConRO:AbilityReady(ids.Feral_Ability.SurvivalInstincts, timeShift);
	
	local renewal 											= ConRO:AbilityReady(ids.Feral_Talent.Renewal, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if renewal and playerPh <= 60 then
		return ids.Feral_Talent.Renewal;
	end
	
	if surv then
		return ids.Feral_Ability.SurvivalInstincts;
	end
	
	return nil;
end

function ConRO.Druid.Guardian(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Abilities	
	local soothe											= ConRO:AbilityReady(ids.Guard_Ability.Soothe, timeShift); 
	local bearform 											= ConRO:AbilityReady(ids.Guard_Ability.BearForm, timeShift);
		local bf 												= ConRO:Form(ids.Guard_Form.BearForm);
	local growl 											= ConRO:AbilityReady(ids.Guard_Ability.Growl, timeShift);
	local mfire 											= ConRO:AbilityReady(ids.Guard_Ability.Moonfire, timeShift);
		local ggBuff 											= ConRO:Aura(ids.Guard_Buff.GalacticGuardian, timeShift);
		local mfDebuff 											= ConRO:TargetAura(ids.Guard_Debuff.Moonfire, timeShift);
	local mang 												= ConRO:AbilityReady(ids.Guard_Ability.Mangle, timeShift);
	local thr 												= ConRO:AbilityReady(ids.Guard_Ability.Thrash, timeShift);
		local thrCD 											= ConRO:Cooldown(ids.Guard_Ability.Thrash_Bear, timeShift);
		local thrDebuff, thrCount 								= ConRO:TargetAura(ids.Guard_Debuff.Thrash, timeShift);
	local swipe 											= ConRO:AbilityReady(ids.Guard_Ability.Swipe, timeShift);
	local sbash 											= ConRO:AbilityReady(ids.Guard_Ability.SkullBash, timeShift);
	local maul												= ConRO:AbilityReady(ids.Guard_Ability.Maul, timeShift);
	
	local wildG 											= ConRO:AbilityReady(ids.Guard_Talent.WildCharge, timeShift);
	local pulv 												= ConRO:AbilityReady(ids.Guard_Talent.Pulverize, timeShift);
		local pulvBuff 											= ConRO:Aura(ids.Guard_Buff.PulverizeBuff, timeShift + 3);
	local gou	 											= ConRO:AbilityReady(ids.Guard_Talent.IncarnationGuardianofUrsoc, timeShift);
		local gouBuff 											= ConRO:Aura(ids.Guard_Buff.IncarnationGuardianofUrsoc, timeShift);
	
		local gwAzTBuff, gwAzTBCount							= ConRO:Aura(ids.Druid_AzTraitBuff.GuardiansWrath, timeShift);
	
--Conditions	
	local inRange 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Guard_Talent.WildCharge_Bear), 'target');
	local incombat 											= UnitAffectingCombat('player');
	local tarInMelee										= ConRO:Targets(ids.Guard_Ability.Mangle);
	
--Indicators	
	ConRO:AbilityInterrupt(ids.Guard_Ability.SkullBash, sbash and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Guard_Ability.Soothe, soothe and ConRO:Purgable());
	
	ConRO:AbilityTaunt(ids.Guard_Ability.Growl, growl);

	ConRO:AbilityBurst(ids.Guard_Talent.IncarnationGuardianofUrsoc, gou and incombat and ConRO:TarYou());
--Rotations	
	if bearform and not bf then
		return ids.Guard_Ability.BearForm;
	end
	
	if inRange and wildG then
		return ids.Guard_Talent.WildCharge_Bear;
	end
	
	if tarInMelee >= 3 then
		if mang and gouBuff and tarInMelee <= 4 then
			return ids.Guard_Ability.Mangle;
		end
		
		if thr and thrCD <= 0 then
			return ids.Guard_Ability.Thrash_Bear;
		end	

		if mfire and not mfDebuff and not tChosen[ids.Feral_Talent.GalacticGuardian] and not gouBuff and tarInMelee <= 4 then
			return ids.Guard_Ability.Moonfire;
		end		

		if swipe then
			return ids.Guard_Ability.Swipe_Bear;
		end		
	else
		if mfire and not mfDebuff then
			return ids.Guard_Ability.Moonfire;
		end

		if thr and thrCD <= 0 and thrCount < 3 then
			return ids.Guard_Ability.Thrash_Bear;
		end

		if pulv and not pulvBuff and thrCount >= 3 then
			return ids.Guard_Talent.Pulverize;
		end
		
		if thr and thrCD <= 0 and tarInMelee >= 2 then
			return ids.Guard_Ability.Thrash_Bear;
		end	
		
		if mang then
			return ids.Guard_Ability.Mangle;
		end
		
		if mfire and ggBuff then
			return ids.Guard_Ability.Moonfire;
		end
		
		if thr and thrCD <= 0 then
			return ids.Guard_Ability.Thrash_Bear;
		end	
		
		if maul and not ConRO:TarYou() and (rage >= 90 or (ConRO:AzPowerChosen(ids.Druid_AzTrait.GuardiansWrath) and gwAzTBCount < 3)) then
			return ids.Guard_Ability.Maul;
		end	
		
		if swipe then
			return ids.Guard_Ability.Swipe_Bear;
		end
	end
	return nil;
end

function ConRO.Druid.GuardianDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);	

--Abilities	
	local surv 												= ConRO:AbilityReady(ids.Guard_Ability.SurvivalInstincts, timeShift);
	local bark 												= ConRO:AbilityReady(ids.Guard_Ability.Barkskin, timeShift);
	local iron 												= ConRO:AbilityReady(ids.Guard_Ability.Ironfur, timeShift);
	local fregen 											= ConRO:AbilityReady(ids.Guard_Ability.FrenziedRegeneration, timeShift);
	
	local lunarb 											= ConRO:AbilityReady(ids.Guard_Talent.LunarBeam, timeShift);
	
	local ironBuff, ifBCount								= ConRO:Aura(ids.Guard_Buff.Ironfur, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if lunarb and playerPh <= 50 then
		return ids.Guard_Talent.LunarBeam;
	end
	
	if fregen and playerPh <= 60 then
		return ids.Guard_Ability.FrenziedRegeneration;
	end
	
	if iron and ConRO:TarYou() and ifBCount < 4 then
		return ids.Guard_Ability.Ironfur;
	end
	
	if bark then
		return ids.Guard_Ability.Barkskin;
	end
	
	if surv then
		return ids.Guard_Ability.SurvivalInstincts;
	end	
	
	return nil;
end

function ConRO.Druid.Restoration(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities
	local soothe											= ConRO:AbilityReady(ids.Resto_Ability.Soothe, timeShift); 
	local tranq 											= ConRO:AbilityReady(ids.Resto_Ability.Tranquility, timeShift);
	local lbloom 											= ConRO:AbilityReady(ids.Resto_Ability.Lifebloom, timeShift);
	local regrow 											= ConRO:AbilityReady(ids.Resto_Ability.Regrowth, timeShift);
	
--Indicators	
	ConRO:AbilityPurge(ids.Resto_Ability.Soothe, soothe and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Resto_Ability.Tranquility, tranq);

	ConRO:AbilityRaidBuffs(ids.Resto_Ability.Lifebloom, lbloom and not ConRO:OneBuff(ids.Resto_Buff.Lifebloom));
	
	return nil;
end

function ConRO.Druid.RestorationDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities
	local bark 												= ConRO:AbilityReady(ids.Resto_Ability.Barkskin, timeShift);
	
	local renewal 											= ConRO:AbilityReady(ids.Resto_Talent.Renewal, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if renewal and playerPh <= 60 then
		return _Renewal;
	end
	
	if bark then
		return ids.Resto_Ability.Barkskin;
	end
		
	return nil;
end
