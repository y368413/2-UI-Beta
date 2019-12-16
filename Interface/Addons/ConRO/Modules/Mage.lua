if select(2, UnitClass("player")) ~= "MAGE" then return end
local ConRO_Mage, ids = ...;

--Generic
	ids.Racial = {
		ArcanePulse = 260364,
		ArcaneTorrent = 28730,
		Berserking = 26297,
		GiftoftheNaaru = 59548,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Mage_AzTrait = {
		BlasterMaster = 274596,
		Equipoise = 286027,
	}
	ids.Mage_AzTraitBuff = {
		WintersReach = 273346,
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
	
--Arcane
	ids.Arc_Ability = {
		ArcaneBarrage = 44425,
		ArcaneBlast = 30451,
		ArcaneExplosion = 1449,
		ArcaneIntellect = 1459,
		ArcaneMissiles = 5143,
		ArcanePower = 12042,
		Blink = 1953,
		ConjureRefreshment = 190336,
		Counterspell = 2139,
		Displacement = 195676,
		Evocation = 12051,
		FrostNova = 122,
		GreaterInvisibility = 110959,
		IceBlock = 45438,
		Polymorph = 118,
		PresenceofMind = 205025,
		PrismaticBarrier = 235450,
		RemoveCurse = 475,
		Slow = 31589,
		SlowFall = 130,
		Spellsteal = 30449,
		TimeWarp = 80353,
	}
	ids.Arc_Passive = {
		Clearcasting = 79684,
		MasterySavant = 190740,
	}
	ids.Arc_Talent = {
		--15
		Amplification = 236628,
		RuleofThrees = 264354,
		ArcaneFamiliar = 205022,
		--30
		ManaShield = 235463,
		Shimmer = 212653,
		Slipstream = 236457,
		--45
		IncantersFlow = 1463,
		MirrorImage = 55342,
		RuneofPower = 116011,
		--60
		Resonance = 205028,
		ChargedUp = 205032,
		Supernova = 157980,
		--75
		ChronoShift = 235711,
		IceWard = 205036,
		RingofFrost = 113724,
		--90
		Reverberate = 281482,
		TouchoftheMagi = 210725,
		NetherTempest = 114923,
		--100
		Overpowered = 155147,
		TimeAnomaly = 210805,
		ArcaneOrb = 153626,
	}
	ids.Arc_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		ArcaneEmpowerment = 276741,
		TormenttheWeak = 198151,
		MasterofEscape = 210476,
		RewindTime = 213220,
		MassInvisibility = 198158,
		NetherwindArmor = 198062,
		TemporalShield = 198111,
		DampenedMagic = 236788,
		Kleptomania = 198100,
		PrismaticCloak = 198064,
	}
	ids.Arc_Form = {
		PresenceofMind = 205025,
		IncantersFlow = 116267,
		RuneofPower = 116014,
	}
	ids.Arc_Buff = {
		ArcaneFamiliar = 210126,
		ArcaneIntellect = 1459,
		ArcanePower = 12042,
		Clearcasting = 263725,
		Evocation = 12051,
		PrismaticBarrier = 235450,
		RuleofThrees = 264774,
	}
	ids.Arc_Debuff = {
		NetherTempest = 114923,
		TouchoftheMagi = 210824,
	}
	ids.Arc_PetAbility = {
			
	}
		
--Fire
	ids.Fire_Ability = {
		ArcaneIntellect = 1459,
		BlazingBarrier = 235313,
		Blink = 1953,
		Combustion = 190319,
		ConjureRefreshment = 190336,
		Counterspell = 2139,
		DragonsBreath = 31661,
		FireBlast = 108853,
		Fireball = 133,
		Flamestrike = 2120,
		FrostNova = 122,
		IceBlock = 45438,
		Invisibility = 66,
		Polymorph = 118,
		Pyroblast = 11366,
		RemoveCurse = 475,
		Scorch = 2948,
		SlowFall = 130,
		Spellsteal = 30449,
		TimeWarp = 80353,
	}
	ids.Fire_Passive = {
		Cauterize = 86949,
		CriticalMass = 117216,
		EnhancedPyrotechnics = 157642,
		HotStreak = 195283,
		MasteryIgnite = 12846,
	}
	ids.Fire_Talent = {
		--15
		Firestarter = 205026,
		Pyromaniac = 205020,
		SearingTouch = 269644,
		--30
		BlazingSoul = 235365,
		Shimmer = 212653,
		BlastWave = 157981,
		--45
		IncantersFlow = 1463,
		MirrorImage = 55342,
		RuneofPower = 116011,
		--60
		FlameOn = 205029,
		AlexstraszasFury = 235870,
		PhoenixFlames = 257541,
		--75
		FreneticSpeed = 236058,
		IceWard = 205036,
		RingofFrost = 113724,
		--90
		FlamePatch = 205037,
		Conflagration = 205023,
		LivingBomb = 44457,
		--100
		Kindling = 155148,
		Pyroclasm = 269650,
		Meteor = 153561,
	}
	ids.Fire_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		NetherwindArmor = 198062,
		TemporalShield = 198111,
		Tinder = 203275,
		WorldinFlames = 203280,
		ControlledBurn = 280450,
		Firestarter = 203283,
		Flamecannon = 203284,
		GreaterPyroblast = 203286,
		PrismaticCloak = 198064,
		DampenedMagic = 236788,
		Kleptomania = 198100,
	}
	ids.Fire_Form = {
		RuneofPower = 116014,	
	}
	ids.Fire_Buff = {
		ArcaneIntellect = 1459,
		BlazingBarrier = 235313,
		Combustion = 190319,
		HeatingUp = 48107,
		HotStreak = 48108,
		IncantersFlow = 116267,
		LivingBomb = 217694,
		Pyroclasm = 269651, 
	}
	ids.Fire_Debuff = {
		Conflagration = 226757,
		Ignite = 12654,
	}
	ids.Fire_PetAbility = {
		
	}

--Frost
	ids.Frost_Ability = {
		ArcaneIntellect = 1459,
		Blink = 1953,
		Blizzard = 190356,
		ColdSnap = 235219,
		ConeofCold = 120,
		ConjureRefreshment = 190336,
		Counterspell = 2139,
		Flurry = 44614,
		FrostNova = 122,
		Frostbolt = 116,
		FrozenOrb = 84714,
		IceBarrier = 11426,
		IceBlock = 45438,
		IceLance = 30455,
		IcyVeins = 12472,
		Invisibility = 66,
		Polymorph = 118,
		RemoveCurse = 475,
		SlowFall = 130,
		Spellsteal = 30449,
		SummonWaterElemental = 31687,
		TimeWarp = 80353,		
	}
	ids.Frost_Passive = {
		BrainFreeze = 190447,
		FingersofFrost = 112965,
		MasteryIcicles = 76613,
		Shatter = 12982,
	}
	ids.Frost_Talent = {
		--15
		BoneChilling = 205027,
		LonelyWinter = 205024,
		IceNova = 157997,
		--30
		GlacialInsulation = 2352974,
		Shimmer = 212653,
		IceFloes = 108839,
		--45
		IncantersFlow = 1463,
		MirrorImage = 55342,
		RuneofPower = 116011,
		--60
		FrozenTouch = 205030,
		ChainReaction = 278309,
		Ebonbolt = 257537,
		--75
		FrigidWinds = 235224,
		IceWard = 205036,
		RingofFrost = 113724,
		--90
		FreezingRain = 270233,
		SplittingIce = 56377,
		CometStorm = 153595,
		--100
		ThermalVoid = 155149,
		RayofFrost = 205021,
		GlacialSpike = 199786,
	}
	ids.Frost_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		DampenedMagic = 236788,
		Kleptomania = 198100,
		ChilledtotheBone = 198126,
		Frostbite = 198120,
		DeepShatter = 198123,
		ConcentratedCoolness = 198148,
			FrozenOrb = 198149,
		BurstofCold = 206431,
		IceForm = 198144,
		NetherwindArmor = 198062,
		TemporalShield = 198111,
		PrismaticCloak = 198064,
	}
	ids.Frost_Form = {
		RuneofPower = 116014,
	}
	ids.Frost_Buff = {
		ArcaneIntellect = 1459,
		BrainFreeze = 190446,
		FingersofFrost = 44544,
		FreezingRain = 270232,
		GlacialSpike = 199844,
		IceBarrier = 11426,
		Icicles = 205473,
		IcyVeins = 12472,
	}
	ids.Frost_Debuff = {
		WintersChill = 228358,
	}
	ids.Frost_PetAbility = {
		
	}
	
	ConRO.Mage = {};
ConRO.Mage.CheckTalents = function()
end
ConRO.Mage.CheckPvPTalents = function()
end
local ConRO_Mage, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Mage.CheckTalents;
	self.ModuleOnEnable = ConRO.Mage.CheckPvPTalents;
	if mode == 1 then
		self.Description = "Mage [Arcane - Caster]";
		self.NextSpell = ConRO.Mage.Arcane;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = "Mage [Fire - Caster]";
		self.NextSpell = ConRO.Mage.Fire;
		self.ToggleDamage();
		self.BlockBurst();
	end;
	if mode == 3 then
		self.Description = "Mage [Frost - Caster]";
		self.NextSpell = ConRO.Mage.Frost;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Mage.CheckTalents;
	self.ModuleOnEnable = ConRO.Mage.CheckPvPTalents;
	if mode == 1 then
		self.NextDef = ConRO.Mage.ArcaneDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Mage.FireDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Mage.FrostDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Mage.Arcane(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local mana												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
	local manapercent 										= math.max(0, mana) / math.max(1, manaMax) * 100;
	local arcCharges 										= UnitPower('player', Enum.PowerType.ArcaneCharges);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilties	
	local counter 											= ConRO:AbilityReady(ids.Arc_Ability.Counterspell, timeShift);
	local ssteal 											= ConRO:AbilityReady(ids.Arc_Ability.Spellsteal, timeShift);
	local aexp												= ConRO:AbilityReady(ids.Arc_Ability.ArcaneExplosion, timeShift);
	local amissiles 										= ConRO:AbilityReady(ids.Arc_Ability.ArcaneMissiles, timeShift);
		local ccBuff 											= ConRO:Aura(ids.Arc_Buff.Clearcasting, timeShift);	
	local apower, apCD 										= ConRO:AbilityReady(ids.Arc_Ability.ArcanePower, timeShift);
		local apBuff 											= ConRO:Aura(ids.Arc_Buff.ArcanePower, timeShift);
	local abarrage 											= ConRO:AbilityReady(ids.Arc_Ability.ArcaneBarrage, timeShift);
	local pom 												= ConRO:AbilityReady(ids.Arc_Ability.PresenceofMind, timeShift);
		local pomBuff 											= ConRO:Form(ids.Arc_Form.PresenceofMind, timeShift);
	local evo, evoCD										= ConRO:AbilityReady(ids.Arc_Ability.Evocation, timeShift);
		local evoBuff 											= ConRO:Aura(ids.Arc_Buff.Evocation, timeShift);	
	local ablast	 										= ConRO:AbilityReady(ids.Arc_Ability.ArcaneBlast, timeShift);
		local totmDebuff 										= ConRO:TargetAura(ids.Arc_Debuff.TouchoftheMagi, timeShift);
		local rotBuff 											= ConRO:Aura(ids.Arc_Buff.RuleofThrees, timeShift);
	local aint												= ConRO:AbilityReady(ids.Arc_Ability.ArcaneIntellect, timeShift);
	
	local rpower				  							= ConRO:AbilityReady(ids.Arc_Talent.RuneofPower, timeShift);
		local runeCharges										= ConRO:SpellCharges(ids.Arc_Talent.RuneofPower);
		local rpBuff 											= ConRO:Form(ids.Arc_Form.RuneofPower, timeShift);
	local mimage 											= ConRO:AbilityReady(ids.Arc_Talent.MirrorImage, timeShift);
	local afam												= ConRO:AbilityReady(ids.Arc_Talent.ArcaneFamiliar, timeShift);
		local afBuff 											= ConRO:Aura(ids.Arc_Buff.ArcaneFamiliar, timeShift);
	local aorb 												= ConRO:AbilityReady(ids.Arc_Talent.ArcaneOrb, timeShift);
	local ntemp 											= ConRO:AbilityReady(ids.Arc_Talent.NetherTempest, timeShift);
		local ntDebuff 											= ConRO:TargetAura(ids.Arc_Debuff.NetherTempest, timeShift + 3);
	local chup 												= ConRO:AbilityReady(ids.Arc_Talent.ChargedUp, timeShift);
	local snova 											= ConRO:AbilityReady(ids.Arc_Talent.Supernova, timeShift);

	local azChosen_Equipoise								= ConRO:AzPowerChosen(ids.Mage_AzTrait.Equipoise);
	
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);		
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);

--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	
	if currentSpell == ids.Arc_Ability.ArcaneBlast then
		arcCharges = arcCharges + 1;
	end
	
	manaThreshold = 60;
	if azChosen_Equipoise then
		manaThreshold = 80;	
	end

--Indicators	
	ConRO:AbilityInterrupt(ids.Arc_Ability.Counterspell, counter and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Arc_Ability.Spellsteal, ssteal and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityRaidBuffs(ids.Arc_Ability.ArcaneIntellect, aint and not ConRO:RaidBuff(ids.Arc_Ability.ArcaneIntellect));
	
	ConRO:AbilityBurst(ids.Arc_Talent.MirrorImage, mimage and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Arc_Ability.ArcanePower, apower and (evo or evoCD < 15) and ConRO_BurstButton:IsVisible());
	
--Warnings	
	
--Rotations
	if apBuff or (not apower and (evo or evoCD < 15)) then
		if azEssence_ConcentratedFlame and not apBuff then
			return ids.AzEssence.ConcentratedFlame;
		end	
		
		if azEssence_MemoryofLucidDream and not apBuff then
			return ids.AzEssence.MemoryofLucidDream;
		end			
	
		if chup and arcCharges <= 2 then
			return ids.Arc_Talent.ChargedUp;
		end

		if aorb and arcCharges < 4 then
			return ids.Arc_Talent.ArcaneOrb;
		end

		if ntemp and arcCharges >= 4 and not ntDebuff and not apBuff and not rpBuff then
			return ids.Arc_Talent.NetherTempest;
		end	

		if mimage then
			return ids.Arc_Talent.MirrorImage;
		end

		if rpower then
			return ids.Arc_Talent.RuneofPower;
		end
		
		if pom and not pomBuff then
			return ids.Arc_Ability.PresenceofMind;
		end		
	
		if abarrage and arcCharges >= 4 and ConRO_AoEButton:IsVisible() then
			return ids.Arc_Ability.ArcaneBarrage;
		end
		
		if aexp and ConRO_AoEButton:IsVisible() then
			return ids.Arc_Ability.ArcaneExplosion;
		end

		if amissiles and ccBuff and manapercent < 95 then
			return ids.Arc_Ability.ArcaneMissiles;
		end		
	
		if ablast then
			return ids.Arc_Ability.ArcaneBlast;
		end

		if evo then
			return ids.Arc_Ability.Evocation;
		end
		
	elseif apower and (evo or evoCD < 15) and ConRO_FullButton:IsVisible() then 
		if chup and arcCharges <= 2 then
			return ids.Arc_Talent.ChargedUp;
		end

		if aorb and arcCharges < 4 then
			return ids.Arc_Talent.ArcaneOrb;
		end

		if ntemp and arcCharges >= 4 and not ntDebuff and not apBuff and not rpBuff then
			return ids.Arc_Talent.NetherTempest;
		end	
		
		if azEssence_GuardianofAzeroth then
			return ids.AzEssence.GuardianofAzeroth;
		end			

		if mimage then
			return ids.Arc_Talent.MirrorImage;
		end

		if rpower then
			return ids.Arc_Talent.RuneofPower;
		end

		if apower then
			return ids.Arc_Ability.ArcanePower;
		end		
	else
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end	
	
		if chup and arcCharges == 0 then
			return ids.Arc_Talent.ChargedUp;
		end
		
		if ntemp and arcCharges >= 4 and not ntDebuff then
			return ids.Arc_Talent.NetherTempest;
		end	

		if aorb and arcCharges < 4 then
			return ids.Arc_Talent.ArcaneOrb;
		end
		
		if ablast and rotBuff then
			return ids.Arc_Ability.ArcaneBlast;
		end
		
		if aexp and ccBuff and ConRO_AoEButton:IsVisible() then
			return ids.Arc_Ability.ArcaneExplosion;
		end
		
		if amissiles and ccBuff and manapercent < 95 then
			return ids.Arc_Ability.ArcaneMissiles;
		end
		
		if abarrage and arcCharges >= 4 and (manapercent < manaThreshold or ConRO_AoEButton:IsVisible()) then
			return ids.Arc_Ability.ArcaneBarrage;
		end
		
		if aexp and ConRO_AoEButton:IsVisible() then
			return ids.Arc_Ability.ArcaneExplosion;
		end
		
		if snova then
			return ids.Arc_Talent.Supernova;
		end		

		if ablast then
			return ids.Arc_Ability.ArcaneBlast;
		end
	end
return nil;		
end

function ConRO.Mage.ArcaneDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilties
	local pbarrier 											= ConRO:AbilityReady(ids.Arc_Ability.PrismaticBarrier, timeShift);
		local pbBuff 											= ConRO:Aura(ids.Arc_Buff.PrismaticBarrier, timeShift);
	local iblock 											= ConRO:AbilityReady(ids.Arc_Ability.IceBlock, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if pbarrier and not pbBuff then
		return ids.Arc_Ability.PrismaticBarrier;
	end
	
	if iblock and playerPh <= 25 then
		return ids.Arc_Ability.IceBlock;
	end
	
	return nil;
end

function ConRO.Mage.Fire(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local counter 											= ConRO:AbilityReady(ids.Fire_Ability.Counterspell, timeShift);
	local ssteal 											= ConRO:AbilityReady(ids.Fire_Ability.Spellsteal, timeShift);
	local fball 											= ConRO:AbilityReady(ids.Fire_Ability.Fireball, timeShift);
		local hupBuff											= ConRO:Aura(ids.Fire_Buff.HeatingUp, timeShift);
		local hsBuff 											= ConRO:Aura(ids.Fire_Buff.HotStreak, timeShift);
		local pyroBuff, pBCount									= ConRO:Aura(ids.Fire_Buff.Pyroclasm, timeShift);
	local pblast, _, pbMCD, pbCAST							= ConRO:AbilityReady(ids.Fire_Ability.Pyroblast, timeShift);		
	local fblast											= ConRO:AbilityReady(ids.Fire_Ability.FireBlast, timeShift);
		local blastCharges 										= ConRO:SpellCharges(ids.Fire_Ability.FireBlast);
	local scorch 											= ConRO:AbilityReady(ids.Fire_Ability.Scorch, timeShift);
	local dbreath 											= ConRO:AbilityReady(ids.Fire_Ability.DragonsBreath, timeShift);
	local fstrike 											= ConRO:AbilityReady(ids.Fire_Ability.Flamestrike, timeShift);
	local combust, cbCD										= ConRO:AbilityReady(ids.Fire_Ability.Combustion, timeShift);
		local comBuff, _, comDUR								= ConRO:Aura(ids.Fire_Buff.Combustion, timeShift);
	local aint												= ConRO:AbilityReady(ids.Fire_Ability.ArcaneIntellect, timeShift);
		
	local meteor 											= ConRO:AbilityReady(ids.Fire_Talent.Meteor, timeShift);
	local mimage 											= ConRO:AbilityReady(ids.Fire_Talent.MirrorImage, timeShift);
	local rpower											= ConRO:AbilityReady(ids.Fire_Talent.RuneofPower, timeShift);
		local runeCharges, _, rpCCD								= ConRO:SpellCharges(ids.Fire_Talent.RuneofPower);
		local rpBuff 											= ConRO:Form(ids.Fire_Form.RuneofPower);
	local lbomb 											= ConRO:AbilityReady(ids.Fire_Talent.LivingBomb, timeShift);
	local pflames											= ConRO:AbilityReady(ids.Fire_Talent.PhoenixFlames, timeShift);
		local flamesCharges, _, pfCCD							= ConRO:SpellCharges(ids.Fire_Talent.PhoenixFlames);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);		
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
		local azBuff_MemoryofLucidDream							= ConRO:Aura(ids.AzEssenceBuff.MemoryofLucidDream, timeShift);
		
	local bracers_HyperthreadWristwraps						= ConRO:ItemReady(168989, timeShift);
		local use_HyperthreadWristwraps							= 168989;
		
--Conditions	
	local incombat 											= UnitAffectingCombat('player');
	local moving 											= ConRO:PlayerSpeed();
	local targetPh 											= ConRO:PercentHealth('target');
	local Close 											= CheckInteractDistance("target", 3);
	
	local scorchball = false;
	
	if moving then
		scorchball = ids.Fire_Ability.Scorch;
	else
		scorchball = ids.Fire_Ability.Fireball;
	end
	
	if currentSpell == ids.Fire_Ability.Pyroblast then
		pBCount = pBCount - 1;
	end

--Indicators	
	ConRO:AbilityInterrupt(ids.Fire_Ability.Counterspell, counter and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Fire_Ability.Spellsteal, ssteal and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityRaidBuffs(ids.Fire_Ability.ArcaneIntellect, aint and not ConRO:RaidBuff(ids.Fire_Ability.ArcaneIntellect));
	
	ConRO:AbilityBurst(ids.Fire_Talent.MirrorImage, mimage);
	
--Warnings	
	
--Rotations	
	if bracers_HyperthreadWristwraps and azBuff_MemoryofLucidDream and blastCharges <= 0 and ConRO.lastSpellId == ids.Fire_Ability.FireBlast then
		return use_HyperthreadWristwraps;
	end
		
	if pblast and not incombat and currentSpell ~= ids.Fire_Ability.Pyroblast then
		return ids.Fire_Ability.Pyroblast;
	elseif tChosen[ids.Fire_Talent.Firestarter] and targetPh >= 90 then
		if pblast and pyroBuff and pBCount >= 1 then
			return ids.Fire_Ability.Pyroblast;
		end
		
		if hsBuff then
			if scorch and moving or (tChosen[ids.Fire_Talent.SearingTouch] and targetPh <= 30) and currentSpell ~= ids.Fire_Ability.Scorch and currentSpell ~= ids.Fire_Ability.Fireball then
				return ids.Fire_Ability.Scorch;
			elseif fball and currentSpell ~= ids.Fire_Ability.Fireball and currentSpell ~= ids.Fire_Ability.Scorch then
				return ids.Fire_Ability.Fireball;
			end		
		end
	
		if pblast and hsBuff then
			return ids.Fire_Ability.Pyroblast;
		end
		
		if scorch and moving then
			return ids.Fire_Ability.Scorch;
		end
		
		if fball then
			return ids.Fire_Ability.Fireball;
		end
	elseif comBuff then
		if pblast and hsBuff or (hupBuff and currentSpell == ids.Fire_Ability.Scorch) then
			return ids.Fire_Ability.Pyroblast;
		end

		if pblast and pyroBuff and pBCount >= 1 and (not combust or (comBuff and comDUR < pbCAST + 0.5)) then
			return ids.Fire_Ability.Pyroblast;
		end
		
		if fblast and (hupBuff or ConRO.lastSpellId == ids.Fire_Ability.Pyroblast) then
			return ids.Fire_Ability.FireBlast;
		end		
	
		if scorch then
			return ids.Fire_Ability.Scorch;
		end	
	else
		if fblast and combust and (hupBuff or (currentSpell == ids.Fire_Talent.RuneofPower and ConRO:AzPowerChosen(ids.Mage_AzTrait.BlasterMaster))) then
			return ids.Fire_Ability.FireBlast;
		end
	
		if azEssence_MemoryofLucidDream and combust and hsBuff then
			return ids.AzEssence.MemoryofLucidDream;
		end	

		if azEssence_GuardianofAzeroth and combust and hsBuff then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if rpower and (runeCharges >= 2 or (runeCharges ==1 and rpCCD <= 2) or pyroBuff or meteor) and (cbCD > 40 or (combust and (hsBuff or ConRO:AzPowerChosen(ids.Mage_AzTrait.BlasterMaster))) or not incombat) and currentSpell ~= ids.Fire_Talent.RuneofPower then
			return ids.Fire_Talent.RuneofPower;
		end
		
		if meteor and (not tChosen[ids.Fire_Talent.RuneofPower] or (tChosen[ids.Fire_Talent.RuneofPower] and (rpBuff or currentSpell == ids.Fire_Talent.RuneofPower)) or cbCD > 30) and (ConRO:AzPowerChosen(ids.Mage_AzTrait.BlasterMaster) or not combust) then
			return ids.Fire_Talent.Meteor;
		end	
		
		if combust and (hsBuff or (hupBuff and ConRO:AzPowerChosen(ids.Mage_AzTrait.BlasterMaster)) or currentSpell == ids.Fire_Ability.Fireball) then
			return ids.Fire_Ability.Combustion;
		end
		
		if hsBuff then
			if scorch and moving or (tChosen[ids.Fire_Talent.SearingTouch] and targetPh <= 30) and currentSpell ~= ids.Fire_Ability.Scorch and currentSpell ~= ids.Fire_Ability.Fireball then
				return ids.Fire_Ability.Scorch;
			elseif fball and currentSpell ~= ids.Fire_Ability.Fireball and currentSpell ~= ids.Fire_Ability.Scorch then
				return ids.Fire_Ability.Fireball;
			end		
		end

		if pblast and pyroBuff and pBCount >= 1 and (not combust or (comBuff and comDUR < pbCAST + 0.5)) then
			return ids.Fire_Ability.Pyroblast;
		end
		
		if pflames and (flamesCharges >= 3 or (flamesCharges ==2 and pfCCD <= 2)) then
			return ids.Fire_Talent.PhoenixFlames;
		end
		
		if fstrike and hsBuff and ConRO_AoEButton:IsVisible() then
			return ids.Fire_Ability.Flamestrike;
		end
		
		if pblast and hsBuff then
			return ids.Fire_Ability.Pyroblast;
		end
		
		if lbomb and ConRO_AoEButton:IsVisible() then
			return ids.Fire_Talent.LivingBomb;
		end

		if dbreath and ConRO_AoEButton:IsVisible() then
			return ids.Fire_Ability.DragonsBreath;
		end
		
		if fblast and hupBuff then
			return ids.Fire_Ability.FireBlast;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end		
	
		if scorch and moving or (tChosen[ids.Fire_Talent.SearingTouch] and targetPh <= 30) then
			return ids.Fire_Ability.Scorch;
		end
		
		if fball then
			return ids.Fire_Ability.Fireball;
		end
	end
end

function ConRO.Mage.FireDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local blazeb 											= ConRO:AbilityReady(ids.Fire_Ability.BlazingBarrier, timeShift);
	local iblock 											= ConRO:AbilityReady(ids.Fire_Ability.IceBlock, timeShift);
	
	local bbBuff 											= ConRO:Aura(ids.Fire_Buff.BlazingBarrier, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if blazeb and not bbBuff then
		return ids.Fire_Ability.BlazingBarrier;
	end
	
	if iblock and playerPh <= 25 then
		return ids.Fire_Ability.IceBlock;
	end
	
	return nil;
end

function ConRO.Mage.Frost(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local plvl 												= UnitLevel("player");
	local mana 												= UnitPower('player', Enum.PowerType.Mana);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local cspell 											= ConRO:AbilityReady(ids.Frost_Ability.Counterspell, timeShift);
	local ssteal 											= ConRO:AbilityReady(ids.Frost_Ability.Spellsteal, timeShift);
	local iveins, ivCD										= ConRO:AbilityReady(ids.Frost_Ability.IcyVeins, timeShift);
		local ivBuff 											= ConRO:Aura(ids.Frost_Buff.IcyVeins, timeShift);
	local forb 												= ConRO:AbilityReady(ids.Frost_Ability.FrozenOrb, timeShift);
	local flurry 											= ConRO:AbilityReady(ids.Frost_Ability.Flurry, timeShift);
		local bfBuff 											= ConRO:Aura(ids.Frost_Buff.BrainFreeze, timeShift);	
		local wcDebuff 											= ConRO:TargetAura(ids.Frost_Debuff.WintersChill, timeShift);
	local fbolt 											= ConRO:AbilityReady(ids.Frost_Ability.Frostbolt, timeShift);
	local sumwele 											= ConRO:AbilityReady(ids.Frost_Ability.SummonWaterElemental, timeShift);
	local ilance											= ConRO:AbilityReady(ids.Frost_Ability.IceLance, timeShift);
		local _, icicleCount									= ConRO:Aura(ids.Frost_Buff.Icicles, timeShift);
		local fofBuff, fofCount 								= ConRO:Aura(ids.Frost_Buff.FingersofFrost, timeShift);
	local blizzard											= ConRO:AbilityReady(ids.Frost_Ability.Blizzard, timeShift);
		local frBuff											= ConRO:Aura(ids.Frost_Buff.FreezingRain, timeShift);
	local cofc												= ConRO:AbilityReady(ids.Frost_Ability.ConeofCold, timeShift);
	local aint												= ConRO:AbilityReady(ids.Frost_Ability.ArcaneIntellect, timeShift);
	
	local ebolt 											= ConRO:AbilityReady(ids.Frost_Talent.Ebonbolt, timeShift);
	local mimage 											= ConRO:AbilityReady(ids.Frost_Talent.MirrorImage, timeShift);
	local rpower				 							= ConRO:AbilityReady(ids.Frost_Talent.RuneofPower, timeShift);
		local runeCharges										= ConRO:SpellCharges(ids.Frost_Talent.RuneofPower);
		local rpBuff 											= ConRO:Form(ids.Frost_Form.RuneofPower, timeShift);
	local rfrost 											= ConRO:AbilityReady(ids.Frost_Talent.RayofFrost, timeShift);
	local gspike 											= ConRO:AbilityReady(ids.Frost_Talent.GlacialSpike, timeShift);
		local gspikeBuff										= ConRO:Aura(ids.Frost_Buff.GlacialSpike, timeShift);
	local inova 											= ConRO:AbilityReady(ids.Frost_Talent.IceNova, timeShift);
	local ifloes											= ConRO:AbilityReady(ids.Frost_Talent.IceFloes, timeShift);
	local cstorm 											= ConRO:AbilityReady(ids.Frost_Talent.CometStorm, timeShift);

	local iceform 											= ConRO:AbilityReady(ids.Frost_PvPTalent.IceForm, timeShift);

	local wrAzBuff											= ConRO:Aura(ids.Mage_AzTraitBuff.WintersReach, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);		
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
	
--Conditions	
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	local assist		 									= ConRO:PetAssist();
	local ispvp												= UnitIsPVP('player');
	local Close 											= CheckInteractDistance("target", 3);
	
	if currentSpell == ids.Frost_Ability.Frostbolt then
		icicleCount = icicleCount + 1;
	elseif currentSpell == ids.Frost_Talent.GlacialSpike then
		icicleCount = 0;
	end

	local ivUSE = ids.Frost_Ability.IcyVeins;
	local foUSE = ids.Frost_Ability.FrozenOrb;
	
	if ispvp then
		if pvpChosen[ids.Frost_PvPTalent.IceForm] then
			iveins = iceform;
			ivUSE = ids.Frost_PvPTalent.IceForm;
		end
		if pvpChosen[ids.Frost_PvPTalent.ConcentratedCoolness] then
			foUSE = ids.Frost_PvPTalent.FrozenOrb;
		end		
	end
	
--Indicators	
	ConRO:AbilityInterrupt(ids.Frost_Ability.Counterspell, cspell and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Frost_Ability.Spellsteal, ssteal and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityRaidBuffs(ids.Frost_Ability.ArcaneIntellect, aint and not ConRO:RaidBuff(ids.Frost_Ability.ArcaneIntellect));
	
	ConRO:AbilityBurst(ids.Frost_Talent.MirrorImage, mimage and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Frost_Ability.IcyVeins, incombat and iveins and ConRO_BurstButton:IsVisible());

--Warnings	
	if not tChosen[ids.Frost_Talent.LonelyWinter] and not summoned and sumwele then
		UIErrorsFrame:AddMessage("Call your Water Elemental!!!", 1.0, 0.0, 0.0, 53, 5);
	end
	
	if not assist and summoned then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end

--Rotations	
	if not incombat then
		if azEssence_GuardianofAzeroth and (iveins or ivCD <= 10) then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if rpower then
			return ids.Frost_Talent.RuneofPower;
		end
			
		if mimage and ConRO_FullButton:IsVisible() then
			return ids.Frost_Talent.MirrorImage;
		end
	
		if iveins and ConRO_FullButton:IsVisible() then
			return ivUSE;
		end	
		
		if fbolt and currentSpell ~= ids.Frost_Ability.Frostbolt then
			return ids.Frost_Ability.Frostbolt;
		end
	end
	
	if ilance and wcDebuff and ConRO.lastSpellId ~= ids.Frost_Ability.IceLance then
		return ids.Frost_Ability.IceLance;
	end
	
	if azEssence_MemoryofLucidDream and ivBuff and icicleCount <= 2 then
		return ids.AzEssence.MemoryofLucidDream;
	end
	
	if azEssence_GuardianofAzeroth and (iveins or ivCD <= 10) then
		return ids.AzEssence.GuardianofAzeroth;
	end		
	
	if tChosen[ids.Frost_Talent.GlacialSpike] then
		if rpower and ((icicleCount >= 5 and (bfBuff or ebolt)) or ConRO.lastSpellId == ids.Frost_Ability.FrozenOrb) then
			return ids.Frost_Talent.RuneofPower;
		end
	else	
		if rpower and (rfrost or ebolt or cstorm or ConRO.lastSpellId == ids.Frost_Ability.FrozenOrb) then
			return ids.Frost_Talent.RuneofPower;
		end
	end

	if iveins and ConRO_FullButton:IsVisible() then
		return ivUSE;
	end	
	
	if mimage and ConRO_FullButton:IsVisible() then
		return ids.Frost_Talent.MirrorImage;
	end
	
	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
	
	if flurry and ((plvl <= 99 and currentSpell ~= ids.Frost_Ability.Flurry) or (bfBuff and ((currentSpell == ids.Frost_Ability.Frostbolt and not tChosen[ids.Frost_Talent.GlacialSpike]) or currentSpell == ids.Frost_Talent.GlacialSpike or (currentSpell == ids.Frost_Talent.Ebonbolt and (not tChosen[ids.Frost_Talent.GlacialSpike] or (tChosen[ids.Frost_Talent.GlacialSpike] and icicleCount <= 3)))))) then
		return ids.Frost_Ability.Flurry;
	end

	if forb and ConRO_AoEButton:IsVisible() then
		return foUSE;
	end
	
	if blizzard and frBuff and ConRO_AoEButton:IsVisible() and currentSpell ~= ids.Frost_Ability.Blizzard then
		return ids.Frost_Ability.Blizzard;
	end		
	
	if ilance and fofBuff then
		return ids.Frost_Ability.IceLance;
	end		
	
	if rfrost then
		return ids.Frost_Talent.RayofFrost;
	end		
	
	if ebolt and currentSpell ~= ids.Frost_Talent.Ebonbolt then
		return ids.Frost_Talent.Ebonbolt;
	end

	if forb then
		return foUSE;
	end
	
	if cstorm then
		return ids.Frost_Talent.CometStorm;
	end
	
	if inova then
		return ids.Frost_Talent.IceNova;
	end

	if gspike and gspikeBuff and bfBuff and currentSpell ~= ids.Frost_Talent.GlacialSpike then
		return ids.Frost_Talent.GlacialSpike;
	end		
	
	if blizzard and ConRO_AoEButton:IsVisible() and currentSpell ~= ids.Frost_Ability.Blizzard then
		return ids.Frost_Ability.Blizzard;
	end

	if fbolt then
		return ids.Frost_Ability.Frostbolt;
	end	

end

function ConRO.Mage.FrostDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local iceb 												= ConRO:AbilityReady(ids.Frost_Ability.IceBarrier, timeShift);
	local iblock 											= ConRO:AbilityReady(ids.Frost_Ability.IceBlock, timeShift);
	local csnap 											= ConRO:AbilityReady(ids.Frost_Ability.ColdSnap, timeShift);
	
	local ibBuff 											= ConRO:Aura(ids.Frost_Buff.IceBarrier, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if iceb and not ibBuff then
		return ids.Frost_Ability.IceBarrier;
	end
	
	if iblock and playerPh <= 25 then
		return ids.Frost_Ability.IceBlock;
	end
	
	if csnap and not iblock then
		return ids.Frost_Ability.ColdSnap;
	end
	
	return nil;
end