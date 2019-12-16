if select(2, UnitClass("player")) ~= "HUNTER" then return end
local ConRO_Hunter, ids = ...;

--Generic
	ids.Racial = {
		AncestralCall = 274738,
		ArcanePulse = 260364,
		ArcaneTorrent = 80483,
		Berserking = 26297,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Hunter_AzTrait = {
		FocusedFire = 278531,
		PrimalInstincts = 279806,
		SteadyAim = 277651,
		SurgingShots = 287707,
	}
	ids.Hunter_AzTraitBuff = {

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
	
--Beast Mastery
	ids.BM_Ability = {
		AspectoftheCheetah = 186257,
		AspectoftheTurtle = 186265,
		AspectoftheWild = 193530,
		BarbedShot = 217200,
		BestialWrath = 19574,
		CallPet = nil,
			CallPetOne = 883,
			CallPetTwo = 83242,
			CallPetThree = 83243,
			CallPetFour = 83244,
			CallPetFive = 83245,
		CobraShot = 193455,
		CommandPet = 272651,
			PrimalRage = 272678,
			SurvivaloftheFittest = 272679,
			MastersCall = 272682,
		ConcussiveShot = 5116,
		CounterShot = 147362,
		Disengage = 781,
		EagleEye = 6197,
		Exhilaration = 109304,
		FeignDeath = 5384,
		Flare = 1543,
		FreezingTrap = 187650,
		Intimidation = 19577,
		KillCommand = 34026,
		Misdirection = 34477,
		MultiShot = 2643,
		PetUtility = nil,
			BeastLore = 1462,
			DismissPet = 2641,
			FeedPet = 6991,
			RevivePet = 982,
			MendPet = 136,
			TameBeast = 1515,
		TarTrap = 187698,
	}
	ids.BM_Passive = {
		BeastCleave = 115939,
		ExoticBeasts = 53270,
		KindredSpirits = 56315,
		MasteryMasterofBeasts = 76657,
		WildCall = 185789,
	}
	ids.BM_Talent = {
		--15
		KillerInstinct = 273887,
		AnimalCompanion = 267116,
		DireBeast = 120679,
		--30
		ScentofBlood = 193532,
		OnewiththePack = 199528,
		ChimaeraShot = 53209,
		--45
		Trailblazer = 199921,
		NaturalMending = 270581,
		Camouflage = 199483,
		--60
		VenomousBite = 257891,
		ThrilloftheHunt = 257944,
		AMurderofCrows = 131894,
		--75
		BornToBeWild = 266921,
		Posthaste = 109215,
		BindingShot = 109248,
		--90
		Stomp = 199530,
		Barrage = 120360,
		Stampede = 201430,
		--100
		AspectoftheBeast = 191384,
		KillerCobra = 199532,
		SpittingCobra = 194407,
	}
	ids.BM_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}
	ids.BM_Form = {
	
	}
	ids.BM_Buff = {
		AspectoftheWild = 193530,
		BestialWrath = 19574,
		BeastCleave = 268877,
		Frenzy = 272790,
	}
	ids.BM_Debuff = {

	}
	ids.BM_PetAbility = {
		Bite = 17253,
		Claw = 16827,
		Smack = 49966,
		ChiJisTranquility = 264028,
		NaturesGrace = 264266,
		NetherShock = 264264,
		SerenityDust = 264055,
		SonicBlast = 264263,
		SporeCloud = 264056,

		SoothingWater = 264262,
		SpiritShock = 264265,		
	}
		
--Marksmanship
	ids.MM_Ability = {
		AimedShot = 19434,
		ArcaneShot = 185358,
		AspectoftheCheetah = 186257,
		AspectoftheTurtle = 186265,
		BurstingShot = 186387,
		CallPet = nil,
			CallPetOne = 883,
			CallPetTwo = 83242,
			CallPetThree = 83243,
			CallPetFour = 83244,
			CallPetFive = 83245,
		CommandPet = 272651,
			PrimalRage = 272678,
			SurvivaloftheFittest = 272679,
			MastersCall = 272682,
		ConcussiveShot = 5116,
		CounterShot = 147362,
		Disengage = 781,
		EagleEye = 6197,
		Exhilaration = 109304,
		FeignDeath = 5384,
		Flare = 1543,
		FreezingTrap = 187650,
		Misdirection = 34477,
		MultiShot = 257620,
		PetUtility = nil,
			BeastLore = 1462,
			DismissPet = 2641,
			FeedPet = 6991,
			RevivePet = 982,
			MendPet = 136,
			TameBeast = 1515,
		RapidFire = 257044,
		SteadyShot = 56641,
		SurvivaloftheFittestLW = 281195,
		TarTrap = 187698,
		Trueshot = 288613,
	}
	ids.MM_Passive = {
		LoneWolf = 155228,
		MasterySniperTraining = 193468,
		PreciseShots = 260240,
		TrickShots = 257621,
	}
	ids.MM_Talent = {
		--15
		MasterMarksman = 260309,
		SerpentSting = 271788,
		AMurderofCrows = 131894,
		--30
		CarefulAim = 260228,
		Volley = 260243,
		ExplosiveShot = 212431,
		--45
		Trailblazer = 199921,
		NaturalMending = 270581,
		Camouflage = 199483,		
		--60
		SteadyFocus = 193533,
		Streamline = 260367,
		HuntersMark = 257284,
		--75
		BornToBeWild = 266921,
		Posthaste = 109215,
		BindingShot = 109248,
		--90
		LethalShots = 260393,
		Barrage = 120360,
		DoubleTap = 260402,
		--100
		CallingtheShots = 260404,
		LockandLoad = 194595,
		PiercingShot = 198670,
	}
	ids.MM_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		DragonscaleArmor = 202589,
		SurvivalTactics = 202746,
		ViperSting = 202797,
		ScorpidSting = 202900,
		SpiderSting = 202914,
		ScatterShot = 213691,
		HiExplosiveTrap = 236776,
		TrueshotMastery = 203129,
		RangersFinesse = 248443,
		SniperShot = 203155,
		RoarofSacrifice = 53480,
		HuntingPack = 203235,
	}
	ids.MM_Form = {
		LoneWolf = 164273,
	}
	ids.MM_Buff = {
		PreciseShots = 260242,
		TrickShots = 257622,
		Trueshot = 193526,
		LockandLoad = 194594,
		SteadyFocus = 193534,
		LethalShots = 260395,
		DoubleTap = 260402,
	}
	ids.MM_Debuff = {
		SerpentSting = 271788,
		HuntersMark = 257284,
	}
	ids.MM_PetAbility = {
		ChiJisTranquility = 264028,
		NaturesGrace = 264266,
		NetherShock = 264264,
		SerenityDust = 264055,
		SonicBlast = 264263,
		SporeCloud = 264056,
	}

--Survival
	ids.Surv_Ability = {
		AspectoftheCheetah = 186257,
		AspectoftheEagle = 186289,
		AspectoftheTurtle = 186265,
		CallPet = nil,
			CallPetOne = 883,
			CallPetTwo = 83242,
			CallPetThree = 83243,
			CallPetFour = 83244,
			CallPetFive = 83245,
		Carve = 187708,
		CommandPet = 272651,
			PrimalRage = 272678,
			SurvivaloftheFittest = 272679,
			MastersCall = 272682,
		CoordinatedAssault = 266779,
		Disengage = 781,
		EagleEye = 6197,
		Exhilaration = 109304,
		FeignDeath = 5384,
		Flare = 1543,
		FreezingTrap = 187650,
		Harpoon = 190925,
		Intimidation = 19577,
		KillCommand = 259489,
		Misdirection = 34477,
		Muzzle = 187707,
		PetUtility = nil,
			BeastLore = 1462,
			DismissPet = 2641,
			FeedPet = 6991,
			RevivePet = 982,
			MendPet = 136,
			TameBeast = 1515,
		RaptorStrike = 186270,
			RaptorStrikeRanged = 265189,
		SerpentSting = 259491,
		TarTrap = 187698,
		WildfireBomb = 259495,
		WingClip = 195645,
	}
	ids.Surv_Passive = {
		MasterySpiritBond = 263135,
	}
	ids.Surv_Talent = {
		--15
		VipersVenom = 268501,
		TermsofEngagement = 265895,
		AlphaPredator = 269737,
		--30
		GuerrillaTactics = 264332,
		HydrasBite = 260241,
		Butchery = 212436,
		--45
		Trailblazer = 199921,
		NaturalMending = 270581,
		Camouflage = 199483,
		--60
		Bloodseeker = 260248,
		SteelTrap = 162488,
		AMurderofCrows = 131894,
		--75
		BornToBeWild = 266921,
		Posthaste = 109215,
		BindingShot = 109248,
		--90
		TipoftheSpear = 260285,
		MongooseBite = 259387,
			MongooseBiteRanged = 265888,
		FlankingStrike = 269751,
		--100
		BirdsofPrey = 260331,
		WildfireInfusion = 271014,
			ShrapnelBomb = 270335,
			PheromoneBomb = 270323,
			VolatileBomb = 271045,
		Chakrams = 259391,
	}
	ids.Surv_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}
	ids.Surv_Form = {

	}
	ids.Surv_Buff = {
		CoordinatedAssault = 266779,
		AspectoftheEagle = 186289,
		VipersVenom = 268552,
		MongooseFury = 259388,
	}
	ids.Surv_Debuff = {
		SerpentSting = 259491,
		WildfireBomb = 269747,
			ShrapnelBomb = 270339,
			PheromoneBomb = 270332,
			VolatileBomb = 271049,
	}
	ids.Surv_PetAbility = {
		Bite = 17253,
		Claw = 16827,
		Smack = 49966,
		ToxicSting = 263858,
		ChiJisTranquility = 264028,
		NaturesGrace = 264266,
		NetherShock = 264264,
		SerenityDust = 264055,
		SonicBlast = 264263,
		SporeCloud = 264056,
	}
	
	
	ConRO.Hunter = {};
ConRO.Hunter.CheckTalents = function()
end
local ConRO_Hunter, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Hunter.CheckTalents;
	self.ModuleOnEnable = ConRO.Hunter.CheckPvPTalents;
	if mode == 1 then
		self.Description = 'Hunter [Beast Mastery - Ranged]';
		self.NextSpell = ConRO.Hunter.BeastMastery;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = 'Hunter [Marksmanship - Ranged]';
		self.NextSpell = ConRO.Hunter.Marksmanship;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = 'Hunter [Survival - Melee]';
		self.NextSpell = ConRO.Hunter.Survival;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Hunter.CheckTalents;
	self.ModuleOnEnable = ConRO.Hunter.CheckPvPTalents;
	if mode == 1 then
		self.NextDef = ConRO.Hunter.BeastMasteryDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Hunter.MarksmanshipDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Hunter.SurvivalDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Hunter.BeastMastery(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local focus 											= UnitPower('player', Enum.PowerType.Focus);
	local focusMax 											= UnitPowerMax('player', Enum.PowerType.Focus);
	local raidHaste, raidSated 								= ConRO:Heroism();

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local kc, kcCD	 										= ConRO:AbilityReady(ids.BM_Ability.KillCommand, timeShift);
	local bw, bwCD											= ConRO:AbilityReady(ids.BM_Ability.BestialWrath, timeShift);
		local bwBuff 											= ConRO:Aura(ids.BM_Buff.BestialWrath, timeShift);
	local aotw, aotwCD										= ConRO:AbilityReady(ids.BM_Ability.AspectoftheWild, timeShift);
		local aotwBuff 											= ConRO:Aura(ids.BM_Buff.AspectoftheWild, timeShift);
	local cshot 											= ConRO:AbilityReady(ids.BM_Ability.CounterShot, timeShift);
	local multi 											= ConRO:AbilityReady(ids.BM_Ability.MultiShot, timeShift);
		local bcBuff, _, bcBuffDur 								= ConRO:Aura(ids.BM_Buff.BeastCleave, timeShift + 1);
	local cobra 											= ConRO:AbilityReady(ids.BM_Ability.CobraShot, timeShift);
	local bshot, bsCD										= ConRO:AbilityReady(ids.BM_Ability.BarbedShot, timeShift);
		local bsCharges, bsMaxCharges, bsCCD, bsMCCD			= ConRO:SpellCharges(ids.BM_Ability.BarbedShot);
		local frenzyBuff, frenzyCount, frenzyDUR				= ConRO:UnitAura(ids.BM_Buff.Frenzy, timeShift, 'pet');
	local prage 											= ConRO:AbilityReady(ids.BM_Ability.CommandPet, timeShift);	
	
	local db, dbCD	 										= ConRO:AbilityReady(ids.BM_Talent.DireBeast, timeShift);		
	local stamp 											= ConRO:AbilityReady(ids.BM_Talent.Stampede, timeShift);	
	local amoc 												= ConRO:AbilityReady(ids.BM_Talent.AMurderofCrows, timeShift);	
	local chimaera 											= ConRO:AbilityReady(ids.BM_Talent.ChimaeraShot, timeShift);
	local barrage 											= ConRO:AbilityReady(ids.BM_Talent.Barrage, timeShift);
	local scobra 											= ConRO:AbilityReady(ids.BM_Talent.SpittingCobra, timeShift);

	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);	
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);	
	
	local expetpurge1										= ConRO:AbilityReady(ids.BM_PetAbility.SoothingWater, timeShift, 'pet');
	local expetpurge2										= ConRO:AbilityReady(ids.BM_PetAbility.SpiritShock, timeShift, 'pet');	
	local petpurge1											= ConRO:AbilityReady(ids.BM_PetAbility.ChiJisTranquility, timeShift, 'pet');
	local petpurge2											= ConRO:AbilityReady(ids.BM_PetAbility.NaturesGrace, timeShift, 'pet');
	local petpurge3											= ConRO:AbilityReady(ids.BM_PetAbility.NetherShock, timeShift, 'pet');
	local petpurge4											= ConRO:AbilityReady(ids.BM_PetAbility.SerenityDust, timeShift, 'pet');
	local petpurge5											= ConRO:AbilityReady(ids.BM_PetAbility.SonicBlast, timeShift, 'pet');
	local petpurge6											= ConRO:AbilityReady(ids.BM_PetAbility.SporeCloud, timeShift, 'pet');
	
--Conditions	
	local targetPh 											= ConRO:PercentHealth('target');
	local summoned 											= ConRO:CallPet();
	local assist 											= ConRO:PetAssist();
	local Close 											= CheckInteractDistance("target", 3);
	local incombat 											= UnitAffectingCombat('player');
	
--Indicators
	ConRO:AbilityInterrupt(ids.BM_Ability.CounterShot, cshot and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.SoothingWater, expetpurge1 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.SpiritShock, expetpurge2 and ConRO:Purgable());	
	ConRO:AbilityPurge(ids.BM_PetAbility.ChiJisTranquility, petpurge1 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.NaturesGrace, petpurge2 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.NetherShock, petpurge3 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.SerenityDust, petpurge4 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.SonicBlast, petpurge5 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.BM_PetAbility.SporeCloud, petpurge6 and ConRO:Purgable());
				
	
	ConRO:AbilityBurst(ids.BM_Talent.Stampede, stamp and ((bwBuff and aotwBuff) or (aotwBuff and not incombat)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.BM_Ability.AspectoftheWild, aotw and (not ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) or (ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) and bsCharges < bsMaxCharges)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.BM_Ability.BestialWrath, bw and (aotwBuff or aotwCD > 20) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and bcBuff and CheckInteractDistance("target", 1) and ConRO_SingleButton:IsVisible());	
	
--Warnings
	if not summoned then
		UIErrorsFrame:AddMessage("Call your pet!!!", 1.0, 0.0, 0.0, 10);
	end
	
--Rotations
	if not incombat then
		if aotw and (bw or bwCD > 20) and ConRO_FullButton:IsVisible() then
			if not ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) then
				return ids.BM_Ability.AspectoftheWild;
			elseif ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) and bsCharges <= bsMaxCharges - 1 and bsCCD >= 2 then
				return ids.BM_Ability.AspectoftheWild;
			end
		end

		if stamp and ConRO_FullButton:IsVisible() then
			return ids.BM_Talent.Stampede;
		end
		
		if bw and not bwBuff and (ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) or (aotwBuff or aotwCD > 20)) and ConRO_FullButton:IsVisible() then
			return ids.BM_Ability.BestialWrath;
		end;
		
		if bshot and (not frenzyBuff or (frenzyBuff and frenzyDUR < 1.5)) then
			return ids.BM_Ability.BarbedShot;
		end

		if chimaera and ConRO_AoEButton:IsVisible() then
			return ids.BM_Talent.ChimaeraShot;
		end
	
		if kc then
			return ids.BM_Ability.KillCommand;
		end
	end	

	if azEssence_GuardianofAzeroth and bwBuff and aotwBuff then
		return ids.AzEssence.GuardianofAzeroth;
	end
	
	if aotw and bwBuff and ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) and bsCharges <= bsMaxCharges - 1 and bsCCD >= 2 and ConRO_FullButton:IsVisible() then
		return ids.BM_Ability.AspectoftheWild;
	end	
		
	if bshot and (bsCharges == 2 or (bsCharges == 1 and bsCCD <= 1.5) or (frenzyBuff and frenzyDUR < 1.5 and frenzyDUR > .5)) then
		return ids.BM_Ability.BarbedShot;
	end

	if multi and not bcBuff and ConRO_AoEButton:IsVisible() then
		return ids.BM_Ability.MultiShot;
	end
	
	if azEssence_FocusedAzeriteBeam and bcBuff and CheckInteractDistance("target", 1) and ConRO_AoEButton:IsVisible() then
		return ids.AzEssence.FocusedAzeriteBeam;
	end	
	
	if scobra then
		return ids.BM_Talent.SpittingCobra;
	end
	
	if azEssence_BloodoftheEnemy and bwBuff and CheckInteractDistance("target", 2) then
		return ids.AzEssence.BloodoftheEnemy;
	end

	if stamp and bwBuff and aotwBuff and ConRO_FullButton:IsVisible() then
		return ids.BM_Talent.Stampede;
	end
	
	if barrage and ConRO_AoEButton:IsVisible() then
		return ids.BM_Talent.Barrage;
	end

	if chimaera and ConRO_AoEButton:IsVisible() then
		return ids.BM_Talent.ChimaeraShot;
	end
	
	if kc then
		return ids.BM_Ability.KillCommand;
	end
	
	if chimaera then
		return ids.BM_Talent.ChimaeraShot;
	end		
	
	if azEssence_ConcentratedFlame and not bwBuff then
		return ids.AzEssence.ConcentratedFlame;
	end

	if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) and ConRO_SingleButton:IsVisible() then
		return ids.AzEssence.FocusedAzeriteBeam;
	end	

	if amoc then
		return ids.BM_Talent.AMurderofCrows;
	end

	if db and ConRO_AoEButton:IsVisible() then
		return ids.BM_Talent.DireBeast;
	end	

	if aotw and (bw or bwCD > 20) and ConRO_FullButton:IsVisible() then
		if not ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) then
			return ids.BM_Ability.AspectoftheWild;
		elseif ConRO:AzPowerChosen(ids.Hunter_AzTrait.PrimalInstincts) and bsCharges <= bsMaxCharges - 1 and bsCCD >= 2 then
			return ids.BM_Ability.AspectoftheWild;
		end
	end
	
	if bw and not bwBuff and (aotwBuff or aotwCD > 20) and ConRO_FullButton:IsVisible() then
		return ids.BM_Ability.BestialWrath;
	end;
	
	if db then
		return ids.BM_Talent.DireBeast;
	end	

	if bshot and bsCharges == 1 and bsCCD <= 1.5 then
		return ids.BM_Ability.BarbedShot;
	end

	if barrage then
		return ids.BM_Talent.Barrage;
	end
	
	if cobra and (kcCD >= 2.5 or focus >= focusMax - 15) and ConRO_SingleButton:IsVisible() then
		return ids.BM_Ability.CobraShot;
	end
return nil;
end

function ConRO.Hunter.BeastMasteryDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities
	local exhil												= ConRO:AbilityReady(ids.BM_Ability.Exhilaration, timeShift);
	local aott 												= ConRO:AbilityReady(ids.BM_Ability.AspectoftheTurtle, timeShift);
	local mendpet											= ConRO:AbilityReady(ids.BM_Ability.MendPet, timeShift);	
	local feedpet											= ConRO:AbilityReady(ids.BM_Ability.FeedPet, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	local petPh												= ConRO:PercentHealth('pet');
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if feedpet and not incombat and summoned and petPh <= 60 then
		return ids.BM_Ability.FeedPet;
	end	
	
	if exhil and (playerPh <= 50 or petPh <= 20) then
		return ids.BM_Ability.Exhilaration;
	end
	
	if mendpet and summoned and petPh <= 60 then
		return ids.BM_Ability.MendPet;
	end	
	
	if aott then
		return ids.BM_Ability.AspectoftheTurtle;
	end
	
	return nil;
end

function ConRO.Hunter.Marksmanship(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local focus 											= UnitPower('player', Enum.PowerType.Focus)
	local focusMax 											= UnitPowerMax('player', Enum.PowerType.Focus);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local cshot 											= ConRO:AbilityReady(ids.MM_Ability.CounterShot, timeShift);
	local tshot 											= ConRO:AbilityReady(ids.MM_Ability.Trueshot, timeShift);
	local as 												= ConRO:AbilityReady(ids.MM_Ability.ArcaneShot, timeShift);
	local mshot												= ConRO:AbilityReady(ids.MM_Ability.MultiShot, timeShift);
		local tsBuff											= ConRO:Aura(ids.MM_Buff.TrickShots, timeShift);
	local aimshot									 		= ConRO:AbilityReady(ids.MM_Ability.AimedShot, timeShift);
		local asCharges, _, asCCD, asMCCD						= ConRO:SpellCharges(ids.MM_Ability.AimedShot);		
		local psBuff											= ConRO:Aura(ids.MM_Buff.PreciseShots, timeShift);
	local rfire												= ConRO:AbilityReady(ids.MM_Ability.RapidFire, timeShift);
	local ss 												= ConRO:AbilityReady(ids.MM_Ability.SteadyShot, timeShift);
		local lsBuff											= ConRO:Aura(ids.MM_Buff.LethalShots, timeShift);

	local amoc 												= ConRO:AbilityReady(ids.MM_Talent.AMurderofCrows, timeShift);
	local pshot 											= ConRO:AbilityReady(ids.MM_Talent.PiercingShot, timeShift);
	local expshot 											= ConRO:AbilityReady(ids.MM_Talent.ExplosiveShot, timeShift);
	local barrage 											= ConRO:AbilityReady(ids.MM_Talent.Barrage, timeShift);
	local ssting											= ConRO:AbilityReady(ids.MM_Talent.SerpentSting, timeShift);
		local sfDebuff, sfCD									= ConRO:TargetAura(ids.MM_Debuff.SerpentSting, timeShift + 2);
	local hm												= ConRO:AbilityReady(ids.MM_Talent.HuntersMark, timeShift);		
		local hmDebuff 											= ConRO:PersistentDebuff(ids.MM_Debuff.HuntersMark);
	local dtap												= ConRO:AbilityReady(ids.MM_Talent.DoubleTap, timeShift);
		local dtBuff											= ConRO:Aura(ids.MM_Buff.DoubleTap, timeShift);

	local snipershot										= ConRO:AbilityReady(ids.MM_PvPTalent.SniperShot, timeShift);
		
	local lol, lolCharges 									= ConRO:Aura(ids.MM_Buff.LockandLoad, timeShift);
	local ts, _, tsCD 										= ConRO:Aura(ids.MM_Buff.Trueshot, timeShift);
	local sf 												= ConRO:Aura(ids.MM_Buff.SteadyFocus, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);	
	
	local petpurge1											= ConRO:AbilityReady(ids.MM_PetAbility.ChiJisTranquility, timeShift, 'pet');
	local petpurge2											= ConRO:AbilityReady(ids.MM_PetAbility.NaturesGrace, timeShift, 'pet');
	local petpurge3											= ConRO:AbilityReady(ids.MM_PetAbility.NetherShock, timeShift, 'pet');
	local petpurge4											= ConRO:AbilityReady(ids.MM_PetAbility.SerenityDust, timeShift, 'pet');
	local petpurge5											= ConRO:AbilityReady(ids.MM_PetAbility.SonicBlast, timeShift, 'pet');
	local petpurge6											= ConRO:AbilityReady(ids.MM_PetAbility.SporeCloud, timeShift, 'pet');
	
--Conditions	
	local targetPh 											= ConRO:PercentHealth('target');
	local summoned 											= ConRO:CallPet();
	local assist 											= ConRO:PetAssist();
	local incombat 											= UnitAffectingCombat('player');
	local ispvp												= UnitIsPVP('player');
	local Close 											= CheckInteractDistance("target", 3);
	
	local _, _, _, aimedShotTimemil = GetSpellInfo(ids.MM_Ability.AimedShot);
	local aimedShotTime = aimedShotTimemil*.001;
	local aimedShotError = 0.3;

	if currentSpell == ids.MM_Ability.AimedShot then
		focus = focus - 30;
	end
	
	local rfFocusCutOff = 70
	
	if tChosen[ids.MM_Talent.Streamline] then
		rfFocusCutOff = 64;
	end
	
	if lol then
		aimedShotTime = gcd;
	end

--Indicators	
	ConRO:AbilityInterrupt(ids.MM_Ability.CounterShot, cshot and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.ChiJisTranquility, petpurge1 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.NaturesGrace, petpurge2 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.NetherShock, petpurge3 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.SerenityDust, petpurge4 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.SonicBlast, petpurge5 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.MM_PetAbility.SporeCloud, petpurge6 and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.MM_Ability.Trueshot, tshot and asCharges == 0 and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.MM_Talent.DoubleTap, dtap and ConRO_BurstButton:IsVisible());
	
--Warnings

--Rotations
	if not incombat then
		if dtap and ConRO_FullButton:IsVisible() then
			return ids.MM_Talent.DoubleTap;
		end
		
		if hm and not hmDebuff then
			return ids.MM_Talent.HuntersMark;
		end
		
		if aimshot and currentSpell ~= ids.MM_Ability.AimedShot then
			return ids.MM_Ability.AimedShot;
		end
	end
	
	if hm and not hmDebuff then
		return ids.MM_Talent.HuntersMark;
	end
	
	if tshot and focus >= focusMax - 25 and asCharges >= 1 and ConRO_FullButton:IsVisible() then
		return ids.MM_Ability.Trueshot;
	end

	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
	
	if ConRO_AoEButton:IsVisible() then
		if dtap and rfire and ConRO_FullButton:IsVisible() then
			return ids.MM_Talent.DoubleTap;
		end
		
		if barrage then
			return ids.MM_Talent.Barrage;
		end	
	
		if mshot and not tsBuff then
			return ids.MM_Ability.MultiShot;
		end	

		if expshot then
			return ids.MM_Talent.ExplosiveShot;
		end	
	
		if amoc then
			return ids.MM_Talent.AMurderofCrows;
		end
		
		if rfire and dtBuff and tsBuff then
			return ids.MM_Ability.RapidFire;
		end		
		
		if aimshot and tsBuff and asCharges >= 1 and currentSpell ~= ids.MM_Ability.AimedShot and tChosen[ids.MM_Talent.CarefulAim] and (targetPh > 80 or targetPh <= 20) then
			return ids.MM_Ability.AimedShot;
		end
		
		if rfire and tsBuff and (ConRO:AzPowerChosen(ids.Hunter_AzTrait.FocusedFire) or ConRO:AzPowerChosen(ids.Hunter_AzTrait.SurgingShots)) then
			return ids.MM_Ability.RapidFire;
		end	

		if aimshot and tsBuff and asCharges >= 1 and currentSpell ~= ids.MM_Ability.AimedShot then
			return ids.MM_Ability.AimedShot;
		end
		
		if rfire and tsBuff then
			return ids.MM_Ability.RapidFire;
		end
	else
		if (ConRO:AzPowerChosen(ids.Hunter_AzTrait.FocusedFire) or ConRO:AzPowerChosen(ids.Hunter_AzTrait.SurgingShots)) then
			if dtap and rfire and focus <= 50 and ConRO_FullButton:IsVisible() then
				return ids.MM_Talent.DoubleTap;
			end
			
			if rfire and dtBuff then
				return ids.MM_Ability.RapidFire;
			end
		end
		
		if dtap and aimshot and ConRO_FullButton:IsVisible() then
			return ids.MM_Talent.DoubleTap;
		end
		
		if aimshot and (asCharges == 2 or (asCharges == 1 and asCCD <= aimedShotTime + .5) or (lol and not psBuff) or dtBuff) and currentSpell ~= ids.MM_Ability.AimedShot then
				return ids.MM_Ability.AimedShot;
		end
		
		if rfire and focus <= 70 then
			return ids.MM_Ability.RapidFire;
		end
		
		if as and (psBuff or currentSpell == ids.MM_Ability.AimedShot) then
			return ids.MM_Ability.ArcaneShot;
		end
		
		if amoc then
			return ids.MM_Talent.AMurderofCrows;
		end		
		
		if expshot then
			return ids.MM_Talent.ExplosiveShot;
		end
		
		if ssting and not ssDebuff then
			return ids.MM_Talent.SerpentSting;
		end
		
		if aimshot and currentSpell ~= ids.MM_Ability.AimedShot then
			return ids.MM_Ability.AimedShot;
		end
		
		if barrage then
			return ids.MM_Talent.Barrage;
		end
	end
	
	if pshot then
		return ids.MM_Talent.PiercingShot;
	end
	
	if as and focus >= focusMax - 10 and ConRO_SingleButton:IsVisible() then
		return ids.MM_Ability.ArcaneShot;
	end	

	if ss then
		return ids.MM_Ability.SteadyShot;
	end	
		
	return nil;
end

function ConRO.Hunter.MarksmanshipDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local exhil 											= ConRO:AbilityReady(ids.MM_Ability.Exhilaration, timeShift);
	local aott 												= ConRO:AbilityReady(ids.MM_Ability.AspectoftheTurtle, timeShift);
	local sotf												= ConRO:AbilityReady(ids.MM_Ability.SurvivaloftheFittestLW, timeShift);
		local lw												= ConRO:Form(ids.MM_Form.LoneWolf);
	local mendpet											= ConRO:AbilityReady(ids.MM_Ability.MendPet, timeShift);	
	local feedpet											= ConRO:AbilityReady(ids.MM_Ability.FeedPet, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	local petPh												= ConRO:PercentHealth('pet');
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if feedpet and summoned and not incombat and petPh <= 60 then
		return ids.MM_Ability.FeedPet;
	end	
	
	if exhil and (playerPh <= 50 or petPh <= 20) then
		return ids.MM_Ability.Exhilaration;
	end
	
	if mendpet and summoned and petPh <= 60 then
		return ids.MM_Ability.MendPet;
	end	
	
	if aott then
		return ids.MM_Ability.AspectoftheTurtle;
	end
	
	if sotf and lw and incombat then
		return ids.MM_Ability.SurvivaloftheFittestLW;
	end
	
	return nil;
end

function ConRO.Hunter.Survival(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local focus 											= UnitPower('player', Enum.PowerType.Focus);
	local focusMax											= UnitPowerMax('player', Enum.PowerType.Focus);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local muz 												= ConRO:AbilityReady(ids.Surv_Ability.Muzzle, timeShift);
	local aote 												= ConRO:AbilityReady(ids.Surv_Ability.AspectoftheEagle, timeShift);
		local aoteBuff											= ConRO:Aura(ids.Surv_Buff.AspectoftheEagle, timeShift);
	local harpoon 											= ConRO:AbilityReady(ids.Surv_Ability.Harpoon, timeShift);
		local inHarRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Surv_Ability.Harpoon), 'target');
	local carve 											= ConRO:AbilityReady(ids.Surv_Ability.Carve, timeShift);
	local kc 												= ConRO:AbilityReady(ids.Surv_Ability.KillCommand, timeShift);
		local kcCharges, _, kcCCD								= ConRO:SpellCharges(ids.Surv_Ability.KillCommand);		
	local rstrike 											= ConRO:AbilityReady(ids.Surv_Ability.RaptorStrike, timeShift);
		local vvBuff 											= ConRO:Aura(ids.Surv_Buff.VipersVenom, timeShift);
	local ssting											= ConRO:AbilityReady(ids.Surv_Ability.SerpentSting, timeShift);
		local ssDebuff 											= ConRO:TargetAura(ids.Surv_Debuff.SerpentSting, timeShift + 3);
	local wfbomb											= ConRO:AbilityReady(ids.Surv_Ability.WildfireBomb, timeShift);
		local wfbCharges, _, wfbCCD								= ConRO:SpellCharges(ids.Surv_Ability.WildfireBomb);		
		local wfbDebuff 										= ConRO:TargetAura(ids.Surv_Debuff.WildfireBomb, timeShift + 1);
	local sbomb												= ConRO:AbilityReady(ids.Surv_Talent.ShrapnelBomb, timeShift);		
		local sbDebuff											= ConRO:TargetAura(ids.Surv_Debuff.ShrapnelBomb, timeShift + 1);
	local vbomb 											= nil;	
		local vbDebuff											= ConRO:TargetAura(ids.Surv_Debuff.VolatileBomb, timeShift + 1);
	local pbomb												= ConRO:AbilityReady(ids.Surv_Talent.PheromoneBomb, timeShift);		
		local pbDebuff											= ConRO:TargetAura(ids.Surv_Debuff.PheromoneBomb, timeShift + 1);
	local cassault											= ConRO:AbilityReady(ids.Surv_Ability.CoordinatedAssault, timeShift);
		local caBuff 											= ConRO:Aura(ids.Surv_Buff.CoordinatedAssault, timeShift);	
	local prage 											= ConRO:AbilityReady(ids.BM_Ability.CommandPet, timeShift);	
	
	local mb												= ConRO:AbilityReady(ids.Surv_Talent.MongooseBite, timeShift);
		local mfBuff, mfCount, mfDur							= ConRO:Aura(ids.Surv_Buff.MongooseFury, timeShift);	
	local fs 												= ConRO:AbilityReady(ids.Surv_Talent.FlankingStrike, timeShift);	
	local butch 											= ConRO:AbilityReady(ids.Surv_Talent.Butchery, timeShift);	
	local amoc 												= ConRO:AbilityReady(ids.Surv_Talent.AMurderofCrows, timeShift);
	local strap												= ConRO:AbilityReady(ids.Surv_Talent.SteelTrap, timeShift);
	local chakrams											= ConRO:AbilityReady(ids.Surv_Talent.Chakrams, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	
	local petpurge1											= ConRO:AbilityReady(ids.Surv_PetAbility.ChiJisTranquility, timeShift, 'pet');
	local petpurge2											= ConRO:AbilityReady(ids.Surv_PetAbility.NaturesGrace, timeShift, 'pet');
	local petpurge3											= ConRO:AbilityReady(ids.Surv_PetAbility.NetherShock, timeShift, 'pet');
	local petpurge4											= ConRO:AbilityReady(ids.Surv_PetAbility.SerenityDust, timeShift, 'pet');
	local petpurge5											= ConRO:AbilityReady(ids.Surv_PetAbility.SonicBlast, timeShift, 'pet');
	local petpurge6											= ConRO:AbilityReady(ids.Surv_PetAbility.SporeCloud, timeShift, 'pet');
	
--Conditions	
	local inMelee											= ConRO:IsSpellInRange(GetSpellInfo(ids.Surv_Ability.WingClip), 'target');	
	local tarInMelee										= ConRO:Targets(ids.Surv_Ability.WingClip);
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	local assist 											= ConRO:PetAssist();
	local Close 											= CheckInteractDistance("target", 3);
	
	local wildfireBomb = ids.Surv_Ability.WildfireBomb;
	
	if ConRO:FindSpell(ids.Surv_Talent.ShrapnelBomb) then
		wildfireBomb = ids.Surv_Talent.ShrapnelBomb;
	elseif ConRO:FindSpell(ids.Surv_Talent.PheromoneBomb) then
		wildfireBomb = ids.Surv_Talent.PheromoneBomb;
	elseif ConRO:FindSpell(ids.Surv_Talent.VolatileBomb) then
		wildfireBomb = ids.Surv_Talent.VolatileBomb;
	end
	
	local raptorStrike = ids.Surv_Ability.RaptorStrike;
	local mongooseBite = ids.Surv_Talent.MongooseBite;
	
	if aoteBuff then
		raptorStrike = ids.Surv_Ability.RaptorStrikeRanged;
		mongooseBite = ids.Surv_Talent.MongooseBiteRanged;
	end

	
--Indicators	
	ConRO:AbilityInterrupt(ids.Surv_Ability.Muzzle, muz and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.ChiJisTranquility, petpurge1 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.NaturesGrace, petpurge2 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.NetherShock, petpurge3 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.SerenityDust, petpurge4 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.SonicBlast, petpurge5 and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Surv_PetAbility.SporeCloud, petpurge6 and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Surv_Ability.Harpoon, harpoon and inHarRange and not inMelee);
	
	ConRO:AbilityBurst(ids.Surv_Ability.CoordinatedAssault, cassault and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Surv_Ability.AspectoftheEagle, aote and incombat and not inMelee);
	
--Warnings	
	if not summoned then
		UIErrorsFrame:AddMessage("Call your pet!!!", 1.0, 0.0, 0.0, 53, 5);
	end

--Rotations
	if cassault and ConRO_FullButton:IsVisible() then
		return ids.Surv_Ability.CoordinatedAssault;
	end
	
	if ssting and not ssDebuff and not incombat then
		return ids.Surv_Ability.SerpentSting;
	end

	if mb and mfDur >= .5 and mfCount >= 4 then
		return mongooseBite;
	end

	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
	
	if tChosen[ids.Surv_Talent.MongooseBite] and tChosen[ids.Surv_Talent.AlphaPredator] then	
		if kc and (kcCharges == 2 or (kcCharges == 1 and kcCCD <= 1)) and focus <= 75 then
			return ids.Surv_Ability.KillCommand;
		end	
	else
		if kc and focus <= 85 then
			return ids.Surv_Ability.KillCommand;
		end
	end	

	if tChosen[ids.Surv_Talent.MongooseBite] then
		if wfbomb and (wfbCharges == 2 or (wfbCharges == 1 and wfbCCD <= 1)) then
			return wildfireBomb;
		end	
	else
		if wfbomb and not wfbDebuff then
			return wildfireBomb;
		end
	end

	if ssting and vvBuff then
		return ids.Surv_Ability.SerpentSting;
	end
	
	if chakrams then
		return ids.Surv_Talent.Chakrams;
	end
	
	if strap then
		return ids.Surv_Talent.SteelTrap;
	end
	
	if amoc then
		return ids.Surv_Talent.AMurderofCrows;
	end
	
	if (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible() then
		if tChosen[ids.Surv_Talent.Butchery] then
			if butch then
				return ids.Surv_Talent.Butchery;
			end
		else
			if carve then
				return ids.Surv_Ability.Carve;
			end
		end
	end	

	if tChosen[ids.Surv_Talent.BirdsofPrey] then
		if ssting and not ssDebuff and not caBuff then
			return ids.Surv_Ability.SerpentSting;
		end
	else
		if ssting and not ssDebuff then
			return ids.Surv_Ability.SerpentSting;
		end
	end
	
	if harpoon and tChosen[ids.Surv_Talent.TermsofEngagement] then
		return ids.Surv_Ability.Harpoon;
	end

	if fs and focus <= 40 then
		return ids.Surv_Talent.FlankingStrike;
	end
	
	if tChosen[ids.Surv_Talent.MongooseBite] then
		if mb and ((not mfBuff and focus >= 60) or (mfDur >= .5 and mfCount >= 1)) then
			return mongooseBite;
		end
	else
		if rstrike and focus > 40 then
			return raptorStrike;
		end
	end

	if tChosen[ids.Surv_Talent.MongooseBite] then
		if wfbomb and not wfbDebuff then
			return wildfireBomb;
		end
	end
	
	if tChosen[ids.Surv_Talent.MongooseBite] and tChosen[ids.Surv_Talent.AlphaPredator] then	
		if kc and kcCharges == 1 and focus <= 85 then
			return ids.Surv_Ability.KillCommand;
		end	
	end
		
	return nil;
end

function ConRO.Hunter.SurvivalDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities
	local exhil 											= ConRO:AbilityReady(ids.Surv_Ability.Exhilaration, timeShift);
	local aott 												= ConRO:AbilityReady(ids.Surv_Ability.AspectoftheTurtle, timeShift);
	local mendpet											= ConRO:AbilityReady(ids.Surv_Ability.MendPet, timeShift);	
	local feedpet											= ConRO:AbilityReady(ids.Surv_Ability.FeedPet, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	local petPh												= ConRO:PercentHealth('pet');
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	
--Rotations	
	if feedpet and summoned and not incombat and petPh <= 60 then
		return ids.Surv_Ability.FeedPet;
	end	
	
	if exhil and (playerPh <= 50 or petPh <= 20) then
		return ids.Surv_Ability.Exhilaration;
	end
	
	if mendpet and summoned and petPh <= 60 then
		return ids.Surv_Ability.MendPet;
	end	
	
	if aott then
		return ids.Surv_Ability.AspectoftheTurtle;
	end
	
	return nil;
end