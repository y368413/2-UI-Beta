if select(2, UnitClass("player")) ~= "PALADIN" then return end
local ConRO_Paladin, ids = ...;

--Generic
	ids.Racial = {
		ArcaneTorrent = 155145,
	}
	ids.Glyph = {
		Queen = 212641,	
	}	
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Paladin_AzTrait = {
		EmpyreanPower = 286390,
	}
	ids.Paladin_AzTraitBuff = {
		EmpyreanPower = 286393,	
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
	
--Holy
	ids.Holy_Ability = {
		Absolution = 212056,
		AuraMastery = 31821,
		AvengingWrath = 31884,
		BeaconofLight = 53563,
		BlessingofFreedom = 1044,
		BlessingofProtection = 1022,
		BlessingofSacrifice = 6940,
		Cleanse = 4987,
		Consecration = 26573,
		Contemplation = 121183,
		CrusaderStrike = 35395,
		DivineProtection = 498,
		DivineShield = 642,
		DivineSteed = 190784,
		FlashofLight = 19750,
		HammerofJustice = 853,
		HandofReckoning = 62124,
		HolyLight = 82326,
		HolyShock = 20473,
		Judgment = 275773,
		LayonHands = 633,
		LightofDawn = 85222,
		LightoftheMartyr = 183998,
		Redemption = 7328,
	}
	ids.Holy_Passive = {
		HeartoftheCrusader = 32223,
		InfusionofLight = 53576,
		MasteryLightbringer = 183997,
	}
	ids.Holy_Talent = {
		--15
		CrusadersMight = 196926,
		BestowFaith = 223306,
		LightsHammer = 114158,
		--30
		UnbreakableSpirit = 114154,
		Cavalier = 230332,
		RuleofLaw = 214202,
		--45
		FistofJustice = 198054,
		Repentance = 20066,
		BlindingLight = 115750,
		--60
		DevotionAura = 183425,
		AuraofSacrifice = 183416,
		AuraofMercy = 183415,
		--75
		JudgmentofLight = 183778,
		HolyPrism = 114165,
		HolyAvenger = 105809,
		--90
		SanctifiedWrath = 53376,
		AvengingCrusader = 216331,
		Awakening = 248033,
		--100
		DivinePurpose = 197646,
		BeaconofFaith = 156910,
		BeaconofVirtue = 200025,
	}
	ids.Holy_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}	   
	ids.Holy_Form = {
		BeaconofFaith = 156910,
		BeaconofLight = 53563, 
	}
	ids.Holy_Buff = {
			
	}
	ids.Holy_Debuff = {
		Forbearance = 25771,
	}
	ids.Holy_PetAbility = {
			
	}
		
--Protection
	ids.Prot_Ability = {
		ArdentDefender = 31850,
		AvengersShield = 31935,
		AvengingWrath = 31884,
		BlessingofFreedom = 1044,
		BlessingofProtection = 1022,
		BlessingofSacrifice = 6940,
		CleanseToxins = 213644,
		Consecration = 26573,
		Contemplation = 121183,
		DivineShield = 642,
		DivineSteed = 190784,
		FlashofLight = 19750,
		GuardianofAncientKings = 86659,
		HammerofJustice = 853,
		HammeroftheRighteous = 53595,
		HandofReckoning = 62124,
		Judgment = 275779,
		LayonHands = 633,
		LightoftheProtector = 184092,
		Rebuke = 96231,
		Redemption = 7328,
		ShieldoftheRighteous = 53600,
		GrandCrusader = 85043,
	}
	ids.Prot_Passive = {
		HeartoftheCrusader = 32223,
		MasteryDivineBulwark = 76671,
	}
	ids.Prot_Talent = {
		--15
		HolyShield = 152261,
		Redoubt = 280373,
		BlessedHammer = 204019,
		--30
		FirstAvenger = 203776,
		CrusadersJudgment = 204023,
		BastionofLight = 204035,
		--45
		FistofJustice = 198054,
		Repentance = 20066,
		BlindingLight = 115750,
		--60
		RetributionAura = 203797,
		Cavalier = 230332,
		BlessingofSpellwarding = 204018,
		--75
		UnbreakableSpirit = 114154,
		FinalStand = 204077,
		HandoftheProtector = 213652,
		--90
		JudgmentofLight = 183778,
		ConsecratedGround = 204054,
		AegisofLight = 204150,
		--100
		LastDefender = 203791,
		RighteousProtector = 204074,
		Seraphim = 152262,
	}
	ids.Prot_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}	
	ids.Prot_Form = {
		Consecration = 188370,
	}
	ids.Prot_Buff = {
		AvengersValor = 197561,
		AvengingWrath = 31884,
	}
	ids.Prot_Debuff = {
		BlessedHammer = 204301,
		Forbearance = 25771,
	}
	ids.Prot_PetAbility = {
		
	}

--Retribution
	ids.Ret_Ability = {
		AvengingWrath = 31884,
		BladeofJustice = 184575,
		BlessingofFreedom = 1044,
		BlessingofProtection = 1022,
		CleanseToxins = 213644,
		Contemplation = 121183,
		CrusaderStrike = 35395,
		DivineShield = 642,
		DivineSteed = 190784,
		DivineStorm = 53385,
		FlashofLight = 19750,
		GreaterBlessingofKings = 203538,
		GreaterBlessingofWisdom = 203539,
		HammerofJustice = 853,
		HandofHindrance = 183218,
		HandofReckoning = 62124,
		Judgment = 20271,
		LayonHands = 633,
		Rebuke = 96231,
		Redemption = 7328,
		ShieldofVengeance = 184662,
		TemplarsVerdict = 85256,
	}
	ids.Ret_Passive = {
		ArtofWar = 267344,
		HeartoftheCrusader = 32223,
		MasteryHandofLight = 267316,
		Retribution = 183435,
	}
	ids.Ret_Talent = {
		--15
		Zeal = 269569,
		RighteousVerdict = 267610,
		ExecutionSentence = 267798,
		--30
		FiresofJustice = 203316,
		BladeofWrath = 231832,
		HammerofWrath = 24275,
		--45
		FistofJustice = 234299,
		Repentance = 20066,
		BlindingLight = 115750,
		--60
		DivineJudgment = 271580,
		Consecration = 205228,
		WakeofAshes = 255937,
		--75
		UnbreakableSpirit = 114154,
		Cavalier = 230332,
		EyeforanEye = 205191,
		--90
		SelflessHealer = 85804,
		JusticarsVengeance = 215661,
		WordofGlory = 210191,
		--100
		DivinePurpose = 223817,
		Crusade = 231895,
		Inquisition = 84963,
	}
	ids.Ret_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		Luminescence = 199428,
		UnboundFreedom = 305394,
		VengeanceAura = 210323,
		BlessingofSanctuary = 210256,
		UltimateRetribution = 287947,
		Lawbringer = 246806,
		DivinePunisher = 204914,
		HammerofReckoning = 247675,
		Jurisdiction = 204979,
		LawandOrder = 204934,
		CleansingLight = 236186,
	}	
	ids.Ret_Form = {
		GreaterBlessingofKings = 203538,
		GreaterBlessingofWisdom = 203539,
	}
	ids.Ret_Buff = {
		AvengingWrath = 31884,
		Crusade = 231895,
		RighteousVerdict = 267611,
		DivinePurpose = 223819,
		Inquisition = 84963,
	}
	ids.Ret_Debuff = {
		Judgment = 197277,
		Forbearance = 25771,
	}
	ids.Ret_PetAbility = {
		
	}
	
	ConRO.Paladin = {};
ConRO.Paladin.CheckTalents = function()
end
ConRO.Paladin.CheckPvPTalents = function()
end
local ConRO_Paladin, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Paladin.CheckTalents;
	self.ModuleOnEnable = ConRO.Paladin.CheckPvPTalents;	
	if mode == 1 then
		self.Description = "Paladin [Holy - Healer]";
		self.NextSpell = ConRO.Paladin.Holy;
		self.ToggleHealer();
	end;
	if mode == 2 then
		self.Description = "Paladin [Protection - Tank]";
		self.NextSpell = ConRO.Paladin.Protection;
		self.ToggleHealer();
	end;
	if mode == 3 then
		self.Description = "Paladin [Retribution - Melee]";
		self.NextSpell = ConRO.Paladin.Retribution;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Paladin.CheckTalents;
	self.ModuleOnEnable = ConRO.Paladin.CheckPvPTalents;	
	if mode == 1 then
		self.NextDef = ConRO.Paladin.HolyDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Paladin.ProtectionDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Paladin.RetributionDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Paladin.Holy(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local avenge 											= ConRO:AbilityReady(ids.Holy_Ability.AvengingWrath, timeShift);
	local auram 											= ConRO:AbilityReady(ids.Holy_Ability.AuraMastery, timeShift);
	local boLight 											= ConRO:AbilityReady(ids.Holy_Ability.BeaconofLight, timeShift);
	local judg	 											= ConRO:AbilityReady(ids.Holy_Ability.Judgment, timeShift);
	local shock 											= ConRO:AbilityReady(ids.Holy_Ability.HolyShock, timeShift);
	local cstrike				 							= ConRO:AbilityReady(ids.Holy_Ability.CrusaderStrike, timeShift);
		local csCharges											= ConRO:SpellCharges(ids.Holy_Ability.CrusaderStrike);

	local boFaith 											= ConRO:AbilityReady(ids.Holy_Talent.BeaconofFaith, timeShift);
	
--Conditions	
	local isEnemy 											= ConRO:TarHostile()
	local Close 											= CheckInteractDistance("target", 3);
	
--Indicators	
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Holy_Ability.AvengingWrath, avenge);
	ConRO:AbilityBurst(ids.Holy_Ability.AuraMastery, auram);

	ConRO:AbilityRaidBuffs(ids.Holy_Ability.BeaconofLight, boLight and not ConRO:OneBuff(ids.Holy_Form.BeaconofLight));
	ConRO:AbilityRaidBuffs(ids.Holy_Talent.BeaconofFaith, boFaith and not ConRO:OneBuff(ids.Holy_Form.BeaconofFaith));
	
--Rotations
	if isEnemy then
		if judg then
			return ids.Holy_Ability.Judgment;
		end
		
		if shock then
			return ids.Holy_Ability.HolyShock;
		end
		
		if cstrike and csCharges >= 1 then
			return ids.Holy_Ability.CrusaderStrike;
		end
	end	
	return nil;
end

function ConRO.Paladin.HolyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities		
	local loh 												= ConRO:AbilityReady(ids.Holy_Ability.LayonHands, timeShift);
	local dish 												= ConRO:AbilityReady(ids.Holy_Ability.DivineShield, timeShift);
	local bop 												= ConRO:AbilityReady(ids.Holy_Ability.BlessingofProtection, timeShift);
	
	local forb 												= ConRO:Aura(ids.Holy_Debuff.Forbearance, timeShift, 'HARMFUL');

--Conditions
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations
	if loh and not forb and playerPh <= 10 then
		return ids.Holy_Ability.LayonHands;
	end
	
	if dish and not forb then
		return ids.Holy_Ability.DivineShield;
	elseif bop and not forb then 
		return ids.Holy_Ability.BlessingofProtection;
	end
	
	return nil;
end

function ConRO.Paladin.Protection(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local hofreck 											= ConRO:AbilityReady(ids.Prot_Ability.HandofReckoning, timeShift);
	local rebuke 											= ConRO:AbilityReady(ids.Prot_Ability.Rebuke, timeShift);
	local judge 											= ConRO:AbilityReady(ids.Prot_Ability.Judgment, timeShift);
	local ashield											= ConRO:AbilityReady(ids.Prot_Ability.AvengersShield, timeShift);
	local avenge 											= ConRO:AbilityReady(ids.Prot_Ability.AvengingWrath, timeShift);
	local sotr								 				= ConRO:AbilityReady(ids.Prot_Ability.ShieldoftheRighteous, timeShift);
		local sotrCharges, sotrMaxCharges						= ConRO:SpellCharges(ids.Prot_Ability.ShieldoftheRighteous);
	local con 												= ConRO:AbilityReady(ids.Prot_Ability.Consecration, timeShift);
	local hotr 												= ConRO:AbilityReady(ids.Prot_Ability.HammeroftheRighteous, timeShift);
	
	local bh 												= ConRO:AbilityReady(ids.Prot_Talent.BlessedHammer, timeShift);
		local bhCharges, bhMaxCharges							= ConRO:SpellCharges(ids.Prot_Talent.BlessedHammer);			
	local sera 												= ConRO:AbilityReady(ids.Prot_Talent.Seraphim, timeShift);
	
	local conBuff 											= ConRO:Form(ids.Prot_Form.Consecration);
	
	local bhDebuff 											= ConRO:TargetAura(ids.Prot_Debuff.BlessedHammer, timeShift);

--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local inRange 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Prot_Ability.Rebuke), 'target');
	local Close 											= CheckInteractDistance("target", 3);
	
--Indicators
	ConRO:AbilityInterrupt(ids.Prot_Ability.AvengersShield, ashield and ConRO:Interrupt());
	ConRO:AbilityInterrupt(ids.Prot_Ability.Rebuke, rebuke and not ashield and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityTaunt(ids.Prot_Ability.HandofReckoning, hofreck);
	
	ConRO:AbilityBurst(ids.Prot_Ability.AvengingWrath, avenge);
	ConRO:AbilityBurst(ids.Prot_Talent.Seraphim, sera and sotrCharges >= 2);

--Rotations	
	if not inRange and judge then
		return ids.Prot_Ability.Judgment;
	end
	
	if con and not conBuff then
		return ids.Prot_Ability.Consecration;
	end

	if sotr and sotrCharges == sotrMaxCharges then
		return ids.Prot_Ability.ShieldoftheRighteous;
	end
	
	if judge then
		return ids.Prot_Ability.Judgment;
	end
	
	if ashield then
		return ids.Prot_Ability.AvengersShield;
	end
	
	if bh and (bhCharges == bhMaxCharges or not bhDebuff) then
		return ids.Prot_Talent.BlessedHammer;
	elseif not tChosen[ids.Prot_Talent.BlessedHammer] and hotr then
		return ids.Prot_Ability.HammeroftheRighteous;
	end
	return nil;
end

function ConRO.Paladin.ProtectionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local ad, adCD			 								= ConRO:AbilityReady(ids.Prot_Ability.ArdentDefender, timeShift);
	local goak 												= ConRO:AbilityReady(ids.Prot_Ability.GuardianofAncientKings, timeShift);
	local sotr, sotrCD										= ConRO:AbilityReady(ids.Prot_Ability.ShieldoftheRighteous, timeShift);
		local sotrCharges, sotrMaxCharges						= ConRO:SpellCharges(ids.Prot_Ability.ShieldoftheRighteous);
	local dish 												= ConRO:AbilityReady(ids.Prot_Ability.DivineShield, timeShift);
	local bop 												= ConRO:AbilityReady(ids.Prot_Ability.BlessingofProtection, timeShift);
	local lotp 												= ConRO:AbilityReady(ids.Prot_Ability.LightoftheProtector, timeShift);
	local loh 												= ConRO:AbilityReady(ids.Prot_Ability.LayonHands, timeShift);
	
	local hotp 												= ConRO:AbilityReady(ids.Prot_Talent.HandoftheProtector, timeShift);
	local bol 												= ConRO:AbilityReady(ids.Prot_Talent.BastionofLight, timeShift);
		
	local forb 												= ConRO:Aura(ids.Prot_Debuff.Forbearance, timeShift, 'HARMFUL');

	local goakID											= select(7, GetSpellInfo("Guardian of Ancient Kings"));
	
--Conditions	
	local inRange 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Prot_Ability.ShieldoftheRighteous), 'target');
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations
	if loh and not forb and playerPh <= 10 then
		return ids.Prot_Ability.LayonHands;
	end
		
	if hotp and playerPh <= 50 then
		return ids.Prot_Talent.HandoftheProtector;
	elseif not tChosen[ids.Prot_Talent.HandoftheProtector] and lotp and playerPh <= 50 then
		return ids.Prot_Ability.LightoftheProtector;
	end
	
	if bol and sotrCharges == 0 and sotrCD > 5 then
		return ids.Prot_Talent.BastionofLight;
	end
	
	if sotr and sotrCharges >= 2 then
		return ids.Prot_Ability.ShieldoftheRighteous;
	end

	if ad then
		return ids.Prot_Ability.ArdentDefender;
	end
			
	if goak then
		if goakID == ids.Glyph.Queen then
			return ids.Glyph.Queen;
		elseif goakID == ids.Prot_Ability.GuardianofAncientKings then
			return ids.Prot_Ability.GuardianofAncientKings;
		end
	end

	return nil;
end

function ConRO.Paladin.Retribution(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local hpower 											= UnitPower ('player', Enum.PowerType.HolyPower);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local cstrike											= ConRO:AbilityReady(ids.Ret_Ability.CrusaderStrike, timeShift);
		local csCharges											= ConRO:SpellCharges(ids.Ret_Ability.CrusaderStrike);
	local temp 												= ConRO:AbilityReady(ids.Ret_Ability.TemplarsVerdict, timeShift);
	local dstorm 											= ConRO:AbilityReady(ids.Ret_Ability.DivineStorm, timeShift);
	local blade 											= ConRO:AbilityReady(ids.Ret_Ability.BladeofJustice, timeShift);
	local judge 											= ConRO:AbilityReady(ids.Ret_Ability.Judgment, timeShift);
		local jDebuff 											= ConRO:TargetAura(ids.Ret_Debuff.Judgment, timeShift);
	local awrath, awCD										= ConRO:AbilityReady(ids.Ret_Ability.AvengingWrath, timeShift);
		local awBuff											= ConRO:Aura(ids.Ret_Buff.AvengingWrath, timeShift);
	local rebuke 											= ConRO:AbilityReady(ids.Ret_Ability.Rebuke, timeShift);
	local gbokings 											= ConRO:AbilityReady(ids.Ret_Ability.GreaterBlessingofKings, timeShift);
	local gbowisdom											= ConRO:AbilityReady(ids.Ret_Ability.GreaterBlessingofWisdom, timeShift);
		
	local washes											= ConRO:AbilityReady(ids.Ret_Talent.WakeofAshes, timeShift);
	local cru, cruCD										= ConRO:AbilityReady(ids.Ret_Talent.Crusade, timeShift);
		local cBuff, cCount										= ConRO:Aura(ids.Ret_Buff.Crusade, timeShift);
	local jveng												= ConRO:AbilityReady(ids.Ret_Talent.JusticarsVengeance, timeShift);
	local esent												= ConRO:AbilityReady(ids.Ret_Talent.ExecutionSentence, timeShift);
	local hofw 												= ConRO:AbilityReady(ids.Ret_Talent.HammerofWrath, timeShift);
	local con												= ConRO:AbilityReady(ids.Ret_Talent.Consecration, timeShift);
	local inq												= ConRO:AbilityReady(ids.Ret_Talent.Inquisition, timeShift);
		local inqBuff											= ConRO:Aura(ids.Ret_Buff.Inquisition, timeShift + 5);

	local hofReckRDY										= ConRO:AbilityReady(ids.Ret_PvPTalent.HammerofReckoning, timeShift);
		
	local dpBuff 											= ConRO:Aura(ids.Ret_Buff.DivinePurpose, timeShift);
	local fofjBuff											= ConRO:Aura(ids.Ret_Buff.TheFiresofJustice, timeShift);

	local epAzBuff											= ConRO:Aura(ids.Paladin_AzTraitBuff.EmpyreanPower, timeShift);

	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
	
--Conditions
	local targetPh 											= ConRO:PercentHealth('target');
	local Close 											= CheckInteractDistance("target", 3);
	local canExe 											= targetPh < 20;
	local tarInMelee										= ConRO:Targets(ids.Ret_Ability.Rebuke);	
	
	if fofjBuff then
		hpower = hpower + 1;
	end
	
	if dpBuff then
		hpower = 5;
	end	
	
--Indicators		
	ConRO:AbilityInterrupt(ids.Ret_Ability.Rebuke, rebuke and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Ret_Talent.Crusade, cru and not cBuff and hpower >= 3 and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ret_Ability.AvengingWrath, awrath and not awBuff and (not tChosen[ids.Ret_Talent.Inquisition] or (inqBuff and tChosen[ids.Ret_Talent.Inquisition])) and ConRO_BurstButton:IsVisible());

	ConRO:AbilityRaidBuffs(ids.Ret_Ability.GreaterBlessingofKings, gbokings and not ConRO:OneBuff(ids.Ret_Form.GreaterBlessingofKings));
	ConRO:AbilityRaidBuffs(ids.Ret_Ability.GreaterBlessingofWisdom, gbowisdom and not ConRO:OneBuff(ids.Ret_Form.GreaterBlessingofWisdom));
	
--Rotations	
	if inq and hpower >= 3 and not inqBuff then
		return ids.Ret_Talent.Inquisition;
	end

	if azEssence_GuardianofAzeroth and (((awrath or awCD >= 10) and not tChosen[ids.Ret_Talent.Crusade]) or (((cBuff and cCount >= 10) or cruCD >= 10) and tChosen[ids.Ret_Talent.Crusade])) then
		return ids.AzEssence.GuardianofAzeroth;
	end
	
	if hofReckRDY and not (cBuff or awBuff) then
		return ids.Ret_PvPTalent.HammerofReckoning;
	end
	
	if cru and not cBuff and hpower >= 3 and ConRO_FullButton:IsVisible() then
		return ids.Ret_Talent.Crusade;
	end

	if awrath and not awBuff and (inqBuff or not tChosen[ids.Ret_Talent.Inquisition]) and not tChosen[ids.Ret_Talent.Crusade] and ConRO_FullButton:IsVisible() then
		return ids.Ret_Ability.AvengingWrath;
	end

	if azEssence_MemoryofLucidDream and hpower <= 3 and (awBuff or (cBuff and cCount >= 10)) then
		return ids.AzEssence.MemoryofLucidDream;
	end

	if azEssence_BloodoftheEnemy and (awBuff or (cBuff and cCount >= 10)) then
		return ids.AzEssence.BloodoftheEnemy;
	end
	
	if esent and hpower >= 3 then
		return ids.Ret_Talent.ExecutionSentence;
	end

	if dstorm and epAzBuff and not jDebuff then
		return ids.Ret_Ability.DivineStorm;
	end
	
	if (ConRO_AutoButton:IsVisible() and ((tarInMelee >= 2 and not tChosen[ids.Ret_Talent.RighteousVerdict]) or tarInMelee >= 3)) or ConRO_AoEButton:IsVisible() then
		if dstorm and hpower >= 5 then
			return ids.Ret_Ability.DivineStorm;
		end
	else
		if temp and hpower >= 5 then
			return ids.Ret_Ability.TemplarsVerdict;
		end
	end	
	
	if washes and hpower == 0 and ((tChosen[ids.Ret_Talent.Crusade] and (cBuff or cruCD >= 45)) or (not tChosen[ids.Ret_Talent.Crusade] and (awBuff or awCD >= 45))) then
		return ids.Ret_Talent.WakeofAshes;
	end	
	
	if blade and hpower <= 3 then
		return ids.Ret_Ability.BladeofJustice;
	end	
	
	if washes and hpower == 1 and ((tChosen[ids.Ret_Talent.Crusade] and (cBuff or cruCD >= 45)) or (not tChosen[ids.Ret_Talent.Crusade] and (awBuff or awCD >= 45))) then
		return ids.Ret_Talent.WakeofAshes;
	end	

	if judge and hpower <= 4 then
		return ids.Ret_Ability.Judgment;
	end
	
	if hofw and hpower <= 4 and (canExe or cBuff or awBuff) then
		return ids.Ret_Talent.HammerofWrath;
	end
	
	if con and hpower <= 4 then
		return ids.Ret_Talent.Consecration;
	end
		
	if cstrike and hpower <= 4 then
		return ids.Ret_Ability.CrusaderStrike;
	end

	if (ConRO_AutoButton:IsVisible() and ((tarInMelee >= 2 and not tChosen[ids.Ret_Talent.RighteousVerdict]) or tarInMelee >= 3)) or ConRO_AoEButton:IsVisible() then
		if dstorm and hpower >= 3 then
			return ids.Ret_Ability.DivineStorm;
		end
	else
		if temp and hpower >= 3 then
			return ids.Ret_Ability.TemplarsVerdict;
		end
	end
	
	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end	
	
	if arctorrent and hpower <= 4 then
		return ids.Racial.ArcaneTorrent;
	end	
end

function ConRO.Paladin.RetributionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local hpower 											= UnitPower ('player', Enum.PowerType.HolyPower);

--Abilities
	local sov 												= ConRO:AbilityReady(ids.Ret_Ability.ShieldofVengeance, timeShift);
	local dish 												= ConRO:AbilityReady(ids.Ret_Ability.DivineShield, timeShift);
	local bop 												= ConRO:AbilityReady(ids.Ret_Ability.BlessingofProtection, timeShift);
	local loh 												= ConRO:AbilityReady(ids.Ret_Ability.LayonHands, timeShift);
		local forb 												= ConRO:Aura(ids.Ret_Debuff.Forbearance, timeShift, 'HARMFUL')	
		
	local efoe 												= ConRO:AbilityReady(ids.Ret_Talent.EyeforanEye, timeShift);
	local jveng												= ConRO:AbilityReady(ids.Ret_Talent.JusticarsVengeance, timeShift);
	
--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if loh and not forb and playerPh <= 10 then
		return ids.Ret_Ability.LayonHands;
	end
	
	if jveng and hpower >= 5 and playerPh <= 50 then
		return ids.Ret_Talent.JusticarsVengeance;
	end
	
	if sov then
		return ids.Ret_Ability.ShieldofVengeance;
	end
	
	if efoe then
		return ids.Ret_Talent.EyeforanEye;
	end	
	
	if dish and not forb then
		return ids.Ret_Ability.DivineShield;
	end
	
	if bop and not forb then 
		return ids.Ret_Ability.BlessingofProtection;
	end
	
	return nil;
end
