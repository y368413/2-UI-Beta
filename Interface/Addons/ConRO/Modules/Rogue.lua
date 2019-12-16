if select(2, UnitClass("player")) ~= "ROGUE" then return end
local ConRO_Rogue, ids = ...;

--Generic
	ids.Racial = {
		ArcanePulse = 260364,
		ArcaneTorrent = 25046,
		Berserking = 26297,
		Shadowmeld = 58984,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Rogue_AzTrait = {
		AceUpYourSleeve = 278676,
		Deadshot = 272935,
		KeepYourWitsAboutYou = 288979,
		NightsVengeance = 273418,
		SnakeEyes = 275846,
		ShroudedSuffocation = 278666,
	}
	ids.Rogue_AzTraitBuff = {
		Deadshot = 272940,
		KeepYourWitsAboutYou = 288988,
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
	
--Assassination
	ids.Ass_Ability = {
		Blind = 2094,
		CheapShot = 1833,
		CloakofShadows = 31224,
		CrimsonVial = 185311,
		Detection = 56814,
		Distract = 1725,
		Envenom = 32645,
		Evasion = 5277,
		FanofKnives = 51723,
		Feint = 1966,
		Garrote = 703,
		Kick = 1766,
		KidneyShot = 408,
		Mutilate = 1329,
		PickLock = 1804,
		PickPocket = 921,
		PoisonedKnife = 185565,
		Poisons = nil,
			DeadlyPoison = 2823,
			WoundPoison = 8679,
			CripplingPoison = 3408,
		Rupture = 1943,
		Sap = 6770,
		Shadowstep = 36554,
		ShroudofConcealment = 114018,
		Sprint = 2983,
		Stealth = 1784,
		TricksoftheTrade = 57934,
		Vanish = 1856,
		Vendetta = 79140,
	}
	ids.Ass_Passive = {
		FleetFooted = 31209,
		MasteryPotentAssassin = 76803,
		SealFate = 14190,
		VenomousWounds = 79134,
	}
	ids.Ass_Talent = {
		--15
		MasterPoisoner = 196864,
		ElaboratePlanning = 193640,
		Blindside = 111240,
		--30
		Nightstalker = 14062,
		Subterfuge = 108208,
			SubStealth = 115191,
		MasterAssassin = 255989,
		--45
		Vigor = 14983,
		DeeperStratagem = 193531,
		MarkedforDeath = 137619,
		--60
		LeechingPoison = 280716,
		CheatDeath = 31230,
		Elusiveness = 79008,
		--75
		InternalBleeding = 154904,
		IronWire = 196861,
		PreyontheWeak = 131511,
		--90
		VenomRush = 152152,
		ToxicBlade = 245388,
		Exsanguinate = 200806,
		--100
		PoisonBomb = 255544,
		HiddenBlades = 270061,
		CrimsonTempest = 121411,
	}
	ids.Ass_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}
	ids.Ass_Form = {
		Stealth = 1784,
	}
	ids.Ass_Buff = {
		Blindside = 121153,
		CrimsonTempest = 121411,
		CripplingPoison = 3408,
		DeadlyPoison = 2823,
		ElaboratePlanning = 193641,
		Envenom = 32645,
		HiddenBlades = 270070,
		InternalBleeding = 154953,
		MasterAssassin = 256735,
		Subterfuge = 115192,
		Vanish = 11327,		
		WoundPoison = 8679,
	}
	ids.Ass_Debuff = {
		CrimsonTempest = 121411,
		DeadlyPoison = 2818,
		Garrote = 703,
		MarkedforDeath = 137619,
		Rupture = 1943,
		ToxicBlade = 245389,		
		Vendetta = 79140,
	}
	ids.Ass_PetAbility = {
			
	}
		
--Outlaw
	ids.Out_Ability = {
		AdrenalineRush = 13750,
		Ambush = 8676,
		BetweentheEyes = 199804,
		BladeFlurry = 13877,
		Blind = 2094,
		CheapShot = 1833,
		CloakofShadows = 31224,
		CrimsonVial = 185311,
		Detection = 56814,
		Dispatch = 2098,
		Distract = 1725,
		Feint = 1966,
		Gouge = 1776,
		GrapplingHook = 195457,
		Kick = 1766,
		PickLock = 1804,
		PickPocket = 921,
		PistolShot = 185763,
		Riposte = 199754,
		RolltheBones = 193316,
		Sap = 6770,
		ShroudofConcealment = 114018,
		SinisterStrike = 193315,
		Sprint = 2983,
		Stealth = 1784,
		TricksoftheTrade = 57934,
		Vanish = 1856,
	}
	ids.Out_Passive = {
		CombatPotency = 61329,
		FleetFooted = 31209,
		MasteryMainGauche = 76806,
		RestlessBlades = 79096,
		Ruthlessness = 14161,
	}
	ids.Out_Talent = {
		--15
		Weaponmaster = 200733,
		QuickDraw = 196938,
		GhostlyStrike = 196937,
		--30
		AcrobaticStrikes = 196924,
		RetractableHook = 256188,
		HitandRun = 196922,
		--45
		Vigor = 14983,
		DeeperStratagem = 193531,
		MarkedforDeath = 137619,
		--60
		IronStomach = 193546,
		CheatDeath = 31230,
		Elusiveness = 79008,
		--75
		DirtyTricks = 108216,
		BlindingPowder = 256165,
		PreyontheWeak = 131511,
		--90
		LoadedDice = 256170,
		Alacrity = 193539,
		SliceandDice = 5171,
		--100
		DancingSteel = 272026,
		BladeRush = 271877,
		KillingSpree = 51690,
	}
	ids.Out_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		Maneuverability = 197000,
		TakeYourCut = 198265,
		ControlisKing = 212217,
		DrinkUpMeHearties = 212210,
		CheapTricks = 212035,
		Dismantle = 207777,
		PlunderArmor = 198529,
		BoardingParty = 209752,
		ThickasThieves = 221622,
		TurntheTables = 198020,
		Shiv = 248744,
		HonorAmongThieves = 198032,
		SmokeBomb = 212182,
		DeathfromAbove = 269513,
	}
	ids.Out_Form = {
	
	}
	ids.Out_Buff = {
		AdrenalineRush = 13750,
		BladeFlurry = 13877,
		Broadside = 193356,
		BuriedTreasure = 199600,
		GrandMelee = 193358,
		Opportunity = 195627,
		RuthlessPrecision = 193357,
		SkullandCrossbones = 199603,
		SliceandDice = 5171,
		TrueBearing = 193359,
	}
	ids.Out_Debuff = {
		GhostlyStrike = 196937,
		MarkedforDeath = 137619,
	}
	ids.Out_PetAbility = {
		
	}

--Subtlety
	ids.Sub_Ability = {
		Backstab = 53,
		Blind = 2094,
		CheapShot = 1833,
		CloakofShadows = 31224,
		CrimsonVial = 185311,
		Detection = 56814,
		Distract = 1725,
		Evasion = 5277,
		Eviscerate = 196819,
		Feint = 1966,
		Kick = 1766,
		KidneyShot = 408,
		Nightblade = 195452,
		PickLock = 1804,
		PickPocket = 921,
		Sap = 6770,
		ShadowBlades = 121471,
		ShadowDance = 185313,
		Shadowstep = 36554,
		Shadowstrike = 185438,
		ShroudofConcealment = 114018,
		ShurikenStorm = 197835,
		ShurikenToss = 114014,
		Sprint = 2983,
		Stealth = 1784,
		SymbolsofDeath = 212283,
		TricksoftheTrade = 57934,
		Vanish = 1856,
	}
	ids.Sub_Passive = {
		DeepeningShadows = 185314,
		FleetFooted = 31209,
		MasteryExecutioner = 76808,
		RelentlessStrikes = 58423,
		ShadowTechniques = 196912,
		ShadowsGrasp = 277950,
		ShurikenCombo = 245639,
	}
	ids.Sub_Talent = {
		--15
		Weaponmaster = 193537,
		FindWeakness = 91023,
		Gloomblade = 200758,
		--30
		Nightstalker = 14062,
		Subterfuge = 108208,
			SubStealth = 115191,
		ShadowFocus = 108209,
		--45
		Vigor = 14983,
		DeeperStratagem = 193531,
		MarkedforDeath = 137619,
		--60
		SoothingDarkness = 200759,
		CheatDeath = 31230,
		Elusiveness = 79008,
		--75
		ShotintheDark = 257505,
		NightTerrors = 277953,
		PreyontheWeak = 131511,
		--90
		DarkShadow = 245687,
		Alacrity = 193539,
		EnvelopingShadows = 238104,
		--100
		MasterofShadows = 196976,
		SecretTechnique = 280719,
		ShurikenTornado = 277925,
	}
	ids.Sub_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--

	}
	ids.Sub_Form = {

	}
	ids.Sub_Buff = {
		ShadowBlades = 121471,
		ShadowDance = 185422,
		ShurikenCombo = 245640,
		SymbolsofDeath = 212283,
		Vanish = 11327,
	}
	ids.Sub_Debuff = {
		FindWeakness = 91021,
		MarkedforDeath = 137619,
		Nightblade = 195452,
	}
	ids.Sub_PetAbility = {
		
	}
	
	ConRO.Rogue = {};
ConRO.Rogue.CheckTalents = function()
end
local ConRO_Rogue, ids = ...;

function ConRO:EnableRotationModule(mode)
    mode = mode or 1;
    self.ModuleOnEnable = ConRO.Rogue.CheckTalents;
	self.ModuleOnEnable = ConRO.Rogue.CheckPvPTalents;
    if mode == 1 then
	    self.Description = 'Rogue [Assassination]';
        self.NextSpell = ConRO.Rogue.Assassination;
		self.ToggleDamage();
    end;
    if mode == 2 then
	    self.Description = 'Rogue [Outlaw]';
        self.NextSpell = ConRO.Rogue.Outlaw;
		self.ToggleDamage();
    end;
    if mode == 3 then
	    self.Description = 'Rogue [Sublety]';
        self.NextSpell = ConRO.Rogue.Subtlety;
		self.ToggleDamage();
    end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Rogue.CheckTalents;
	self.ModuleOnEnable = ConRO.Rogue.CheckPvPTalents;
	if mode == 1 then
		self.NextDef = ConRO.Rogue.AssassinationDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Rogue.OutlawDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Rogue.SubletyDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Rogue.Assassination(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);
	local energyPercent 									= math.max(0, energy) / math.max(1, energyMax) * 100;	
    local combo 											= UnitPower('player', Enum.PowerType.ComboPoints);
	local comboMax 											= UnitPowerMax('player', Enum.PowerType.ComboPoints);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local kick 												= ConRO:AbilityReady(ids.Ass_Ability.Kick, timeShift);
	local sprint 											= ConRO:AbilityReady(ids.Ass_Ability.Sprint, timeShift);	
	local sstep												= ConRO:AbilityReady(ids.Ass_Ability.Shadowstep, timeShift);
	local pknife											= ConRO:AbilityReady(ids.Ass_Ability.PoisonedKnife, timeShift);	
	local stealth 											= ConRO:AbilityReady(ids.Ass_Ability.Stealth, timeShift);
		local _, substealth										= ConRO:AbilityReady(ids.Ass_Talent.SubStealth, timeShift);
		local subBuff											= ConRO:Aura(ids.Ass_Buff.Subterfuge, timeShift);	
		local maBuff											= ConRO:Aura(ids.Ass_Buff.MasterAssassin, timeShift);			
	local garrote 											= ConRO:AbilityReady(ids.Ass_Ability.Garrote, timeShift);
		local gDebuff, _, gDur									= ConRO:TargetAura(ids.Ass_Debuff.Garrote, timeShift);
	local vanish 											= ConRO:AbilityReady(ids.Ass_Ability.Vanish, timeShift);
		local vaBuff											= ConRO:Aura(ids.Ass_Buff.Vanish, timeShift);
	local vendetta 											= ConRO:AbilityReady(ids.Ass_Ability.Vendetta, timeShift);
		local vDebuff											= ConRO:TargetAura(ids.Ass_Debuff.Vendetta, timeShift);
	local fok 												= ConRO:AbilityReady(ids.Ass_Ability.FanofKnives, timeShift);
	local muti 												= ConRO:AbilityReady(ids.Ass_Ability.Mutilate, timeShift);
	local envenom											= ConRO:AbilityReady(ids.Ass_Ability.Envenom, timeShift);
		local eBuff											= ConRO:Aura(ids.Ass_Buff.Envenom, timeShift);
	local rupture											= ConRO:AbilityReady(ids.Ass_Ability.Rupture, timeShift);		
		local rDebuff, _, rDur									= ConRO:TargetAura(ids.Ass_Debuff.Rupture, timeShift);

	local bside												= ConRO:AbilityReady(ids.Ass_Talent.Blindside, timeShift);	
		local bsBuff											= ConRO:Aura(ids.Ass_Buff.Blindside, timeShift);
	local tblade 											= ConRO:AbilityReady(ids.Ass_Talent.ToxicBlade, timeShift);
		local tbDebuff											= ConRO:TargetAura(ids.Ass_Debuff.ToxicBlade, timeShift);	
	local exsang, exCD, exMaxCD								= ConRO:AbilityReady(ids.Ass_Talent.Exsanguinate, timeShift);
	local ctempest											= ConRO:AbilityReady(ids.Ass_Talent.CrimsonTempest, timeShift);
		local ctDebuff											= ConRO:TargetAura(ids.Ass_Debuff.CrimsonTempest, timeShift + 2);	
	local mdeath 											= ConRO:AbilityReady(ids.Ass_Talent.MarkedforDeath, timeShift);
		local modDebuff											= ConRO:TargetAura(ids.Ass_Debuff.MarkedforDeath, timeShift);
	
	local dpoison 											= ConRO:Aura(ids.Ass_Buff.DeadlyPoison, timeShift);
		local dpDebuff											= ConRO:TargetAura(ids.Ass_Debuff.DeadlyPoison, timeShift);	
	local wpoison 											= ConRO:Aura(ids.Ass_Buff.WoundPoison, timeShift);
	local cpoison 											= ConRO:Aura(ids.Ass_Buff.CripplingPoison, timeShift);
	local epBuff	 										= ConRO:Aura(ids.Ass_Buff.ElaboratePlanning, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);
	
--Conditions	
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Ass_Ability.Kick), 'target');
	local inMovementRange									= ConRO:IsSpellInRange(GetSpellInfo(ids.Ass_Ability.Shadowstep), 'target');
	local incombat 											= UnitAffectingCombat('player');
	local stealthed											= IsStealthed();
	local targetPh 											= ConRO:PercentHealth('target');	
	local toClose 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Ass_Ability.Kick);
	
	local castStealth = ids.Ass_Ability.Stealth
	if tChosen[ids.Ass_Talent.Subterfuge] then
		stealth = substealth;
		castStealth = ids.Ass_Talent.SubStealth;
	end
	
	local lethalp = false;
		if dpoison then
			lethalp = true;
		elseif wpoison then
			lethalp = true;
		end

--Indicators		
	ConRO:AbilityInterrupt(ids.Ass_Ability.Kick, kick and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and toClose and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Ass_Ability.Shadowstep, sstep and inMovementRange and not inMelee);	
	ConRO:AbilityMovement(ids.Ass_Ability.Sprint, sprint and not inMelee);	
	
	ConRO:AbilityBurst(ids.Ass_Ability.Vendetta, vendetta and rDebuff and gDebuff and energy <= (energyMax - 30) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ass_Ability.Vanish, vanish and incombat and not ConRO:TarYou() and ((combo >= comboMax and not rDebuff and tChosen[ids.Ass_Talent.Subterfuge]) or (tChosen[ids.Ass_Talent.Subterfuge] and not gDebuff)) and ConRO_BurstButton:IsVisible());

	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 2) or ConRO_SingleButton:IsVisible()));
--Warnings	
		if not lethalp and (incombat or stealthed) then
			UIErrorsFrame:AddMessage("Put lethal poison on your weapon!!!", 1.0, 0.0, 0.0, 53, 5);
		end
		
--Rotations	
	if not incombat then	
		if stealth and not stealthed and not vaBuff then
			return castStealth;
		end

		if mdeath and combo < 5 then
			return ids.Ass_Talent.MarkedforDeath;
		end
		
		if rupture and not rDebuff and combo == comboMax then
			return ids.Ass_Ability.Rupture;
		elseif garrote and not gDebuff then
			return ids.Ass_Ability.Garrote;
		end		
	else
		if pknife and energyPercent >= 90 and tarInMelee == 0 then
			return ids.Ass_Ability.PoisonedKnife;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if mdeath and combo == 0 and not subBuff and not maBuff then
			return ids.Ass_Talent.MarkedforDeath;
		end
		
		if vendetta and rDebuff and gDebuff and not stealthed and not subBuff and not maBuff and ConRO_FullButton:IsVisible() then
			return ids.Ass_Ability.Vendetta;
		end

		if tblade and rDebuff and gDebuff and not stealthed and not subBuff and not maBuff then
			return ids.Ass_Talent.ToxicBlade;
		end
		
		if exsang and not stealthed and not subBuff and not maBuff then
			if tChosen[ids.Ass_Talent.DeeperStratagem] then
				if rDur >= 29 and gDur >= 6 then
					return ids.Ass_Talent.Exsanguinate;
				end					
			else
				if rDur >= 25 and gDur >= 6 then
					return ids.Ass_Talent.Exsanguinate;
				end
			end
		end
		
		if vanish and not stealthed and not subBuff and not maBuff and not ConRO:TarYou() and ConRO_FullButton:IsVisible() then
			if tChosen[ids.Ass_Talent.Subterfuge] then			
				if tChosen[ids.Ass_Talent.Exsanguinate] then
					if (exsang and combo == comboMax) or not gDebuff then
						return ids.Ass_Ability.Vanish;
					end
				else
					if not gDebuff or (gDebuff and gDur <= 6) then
						return ids.Ass_Ability.Vanish;
					end
				end
			elseif tChosen[ids.Ass_Talent.Nightstalker] then
				if tChosen[ids.Ass_Talent.Exsanguinate] then
					if not rDebuff and exsang and combo == comboMax then
						return ids.Ass_Ability.Vanish;
					end
				else
					if (not rDebuff or (rDebuff and rDur <= 7)) and combo == comboMax then
						return ids.Ass_Ability.Vanish;
					end
				end	
			else
				if rDebuff and gDebuff then
					return ids.Ass_Ability.Vanish;
				end
			end
		end

		if rupture and ((exsang and gDur >= 8 and combo == comboMax) or (combo >= 3 and (subBuff or maBuff) and not rDebuff)) then
			return ids.Ass_Ability.Rupture;
		end
		
		if tChosen[ids.Ass_Talent.Exsanguinate] then
			if tChosen[ids.Ass_Talent.Subterfuge] then
				if garrote and (not gDebuff	or (gDebuff and (exsang or exCD <= exMaxCD - 10) and gDur <= 18 and subBuff)) then
					return ids.Ass_Ability.Garrote;
				end
			else
				if garrote and (not gDebuff	or (gDebuff and (exsang or exCD <= exMaxCD - 10) and gDur <= 3)) then
					return ids.Ass_Ability.Garrote;
				end
			end
		else
			if tChosen[ids.Ass_Talent.Subterfuge] then		
				if garrote and (not gDebuff or (gDebuff and gDur <= 18 and subBuff)) then
					return ids.Ass_Ability.Garrote;
				end				
			else
				if garrote and (not gDebuff or (gDebuff and gDur <= 3)) then
					return ids.Ass_Ability.Garrote;
				end
			end
		end
		
		if ctempest and not ctDebuff and combo >= (comboMax - 1) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Ass_Talent.CrimsonTempest;
		end

		if tChosen[ids.Ass_Talent.Nightstalker] then
			if rupture and combo >= (comboMax - 1) and not rDebuff then	
				return ids.Ass_Ability.Rupture;
			end				
		else
			if tChosen[ids.Ass_Talent.Exsanguinate] then
				if rupture and combo >= (comboMax - 1) and (not rDebuff or (rDebuff and (exsang or exCD <= exMaxCD - 17) and rDur <= 7)) then	
					return ids.Ass_Ability.Rupture;
				end	
			else
				if rupture and combo >= (comboMax - 1) and (not rDebuff or (rDebuff and rDur <= 7)) then	
					return ids.Ass_Ability.Rupture;
				end		
			end
		end
	
		if envenom and not eBuff and combo >= (comboMax - 1) then
			if ((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) then
				if (vDebuff or tbDebuff) or energyPercent >= 80 then
					return ids.Ass_Ability.Envenom;
				end
			else
				return ids.Ass_Ability.Envenom;
			end
		end

		if fok and combo <= (comboMax - 1) then
			if ((ConRO_AutoButton:IsVisible() and tarInMelee >= 4) or ConRO_AoEButton:IsVisible()) then
				return ids.Ass_Ability.FanofKnives;
			elseif dpoison and not dpDebuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
				return ids.Ass_Ability.FanofKnives;
			end
		end
		
		if bside and (bsBuff or (targetPh <= 35 and not tChosen[ids.Ass_Talent.VenomRush])) then
			return ids.Ass_Talent.Blindside;
		end

		if muti and combo <= (comboMax - 1) and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 3) or ConRO_SingleButton:IsVisible()) then
			return ids.Ass_Ability.Mutilate;
		end
	end
return nil;
end

function ConRO.Rogue.AssassinationDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local eva 												= ConRO:AbilityReady(ids.Ass_Ability.Evasion, timeShift);
	local crim 												= ConRO:AbilityReady(ids.Ass_Ability.CrimsonVial, timeShift);

--Conditions	
	local ph 												= ConRO:PercentHealth('player');
	local stealthed											= IsStealthed();

--Rotations	
	if crim and ph <= 70 then
		return ids.Ass_Ability.CrimsonVial;
	end
	
	if not stealthed then
		if eva then
			return ids.Ass_Ability.Evasion;
		end
	end
	return nil;
end

function ConRO.Rogue.Outlaw(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local energyMax 										= UnitPowerMax('player', Enum.PowerType.Energy);
    local combo 											= UnitPower('player', Enum.PowerType.ComboPoints);
	local comboMax 											= UnitPowerMax('player', Enum.PowerType.ComboPoints);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities	
	local kick 												= ConRO:AbilityReady(ids.Out_Ability.Kick, timeShift);
	local stealth 											= ConRO:AbilityReady(ids.Out_Ability.Stealth, timeShift);
	local sprint 											= ConRO:AbilityReady(ids.Out_Ability.Sprint, timeShift);
	local adren 											= ConRO:AbilityReady(ids.Out_Ability.AdrenalineRush, timeShift);
		local arBuff 											= ConRO:Aura(ids.Out_Buff.AdrenalineRush, timeShift);
	local ps 												= ConRO:AbilityReady(ids.Out_Ability.PistolShot, timeShift);
		local opBuff											= ConRO:Aura(ids.Out_Buff.Opportunity, timeShift);
	local rtb 												= ConRO:AbilityReady(ids.Out_Ability.RolltheBones, timeShift);
	local amb 												= ConRO:AbilityReady(ids.Out_Ability.Ambush, timeShift);
	local sstrike											= ConRO:AbilityReady(ids.Out_Ability.SinisterStrike, timeShift);
	local dispatch											= ConRO:AbilityReady(ids.Out_Ability.Dispatch, timeShift);
	local ghook												= ConRO:AbilityReady(ids.Out_Ability.GrapplingHook, timeShift);
	local bflurry											= ConRO:AbilityReady(ids.Out_Ability.BladeFlurry, timeShift);
		local bfBuff											= ConRO:Aura(ids.Out_Buff.BladeFlurry, timeShift);	
		local bfCharges											= ConRO:SpellCharges(ids.Out_Ability.BladeFlurry);
	local bteyes											= ConRO:AbilityReady(ids.Out_Ability.BetweentheEyes, timeShift);
	local vanish											= ConRO:AbilityReady(ids.Out_Ability.Vanish, timeShift);
	
	local gstrike 											= ConRO:AbilityReady(ids.Out_Talent.GhostlyStrike, timeShift + 3);
		local gsDebuff											= ConRO:TargetAura(ids.Out_Debuff.GhostlyStrike, timeShift);
	local mdeath 											= ConRO:AbilityReady(ids.Out_Talent.MarkedforDeath, timeShift);
	local brush, brCD										= ConRO:AbilityReady(ids.Out_Talent.BladeRush, timeShift);
	local kspree, ksCD 										= ConRO:AbilityReady(ids.Out_Talent.KillingSpree, timeShift);
	local sndice 											= ConRO:AbilityReady(ids.Out_Talent.SliceandDice, timeShift);
		local sndBuff 											= ConRO:Aura(ids.Out_Buff.SliceandDice, timeShift + 7);

	local azChosen_AceUpYourSleeve							= ConRO:AzPowerChosen(ids.Rogue_AzTrait.AceUpYourSleeve);		
	local azChosen_Deadshot									= ConRO:AzPowerChosen(ids.Rogue_AzTrait.Deadshot);
		local azBuff_Deadshot									= ConRO:Form(ids.Rogue_AzTraitBuff.Deadshot);	
	local azChosen_SnakeEyes, azCount_SnakeEyes				= ConRO:AzPowerChosen(ids.Rogue_AzTrait.SnakeEyes);
	local azChosen_KeepYourWitsAboutYou						= ConRO:AzPowerChosen(ids.Rogue_AzTrait.KeepYourWitsAboutYou);
		local azBuff_KeepYourWitsAboutYou, kywayCount			= ConRO:Aura(ids.Rogue_AzTraitBuff.KeepYourWitsAboutYou, timeShift);	
	
    local rtbBuff = {
        tb 													= ConRO:Aura(ids.Out_Buff.TrueBearing, timeShift + 3),
        rp 													= ConRO:Aura(ids.Out_Buff.RuthlessPrecision, timeShift + 3),
        sc 													= ConRO:Aura(ids.Out_Buff.SkullandCrossbones, timeShift + 3),
        gm 													= ConRO:Aura(ids.Out_Buff.GrandMelee, timeShift + 3),
        bs 													= ConRO:Aura(ids.Out_Buff.Broadside, timeShift + 3),
        bt 													= ConRO:Aura(ids.Out_Buff.BuriedTreasure, timeShift + 3),
    }

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
		local azCharges_ConcentratedFlame, azMaxCharges_ConcentratedFlame = ConRO:SpellCharges(ids.AzEssence.ConcentratedFlame);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);	
	
--Conditions
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Out_Ability.Dispatch), 'target');	
	local incombat 											= UnitAffectingCombat('player');
	local stealthed											= IsStealthed();
	local toClose 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Out_Ability.Kick);
	
	local rtbCount = 0;
		for k, v in pairs(rtbBuff) do
			if v then
				rtbCount = rtbCount + 1;
			end
		end

    local shouldRoll = true;
		if ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if rtbBuff.sc then
				rtbCount = rtbCount - 1;
			end
			if (rtbCount >= 2 or rtbBuff.rp or rtbBuff.gm or rtbBuff.bs) then
				shouldRoll = false;
			end			
		elseif azChosen_SnakeEyes and azCount_SnakeEyes >= 2 then
			if rtbCount >= 2 then
				shouldRoll = false;
			end
		elseif (azChosen_AceUpYourSleeve or azChosen_Deadshot) then
			if (rtbCount >= 2 or rtbBuff.rp) then
				shouldRoll = false;
			end
		else
			if (rtbCount >= 2 or rtbBuff.rp or rtbBuff.gm) then
				shouldRoll = false;
			end
		end
	
	local broadsideReward = 0
	local oppReward = 0	
		if rtbBuff.bs then
			broadsideReward = broadsideReward + 1;
		end
		if tChosen[ids.Out_Talent.QuickDraw] and opBuff then
			oppReward = oppReward + 1;
		end
		
--Indicators	
	ConRO:AbilityInterrupt(ids.Out_Ability.Kick, kick and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and toClose and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Out_Ability.GrapplingHook, ghook and not inMelee);	
	ConRO:AbilityMovement(ids.Out_Ability.Sprint, sprint and not inMelee);		
	
    ConRO:AbilityBurst(ids.Out_Ability.AdrenalineRush, adren and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Out_Ability.Vanish, vanish and incombat and not ConRO:TarYou());
	ConRO:AbilityBurst(ids.Out_Talent.KillingSpree, kspree and not arBuff and ConRO_BurstButton:IsVisible());	

	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 2) or ConRO_SingleButton:IsVisible()));
	
--Rotations
	if stealth and not stealthed then
		return ids.Out_Ability.Stealth;
	end
		
	if not incombat or stealthed then
		if mdeath and combo < 5 then
			return ids.Out_Talent.MarkedforDeath;
		end
		
		if tChosen[ids.Out_Talent.SliceandDice] then
			if sndice and not sndBuff and combo >= (comboMax - 1) then
				return ids.Out_Talent.SliceandDice;
			end
		else
			if rtb and shouldRoll and combo >= (comboMax - 1) then
				return ids.Out_Ability.RolltheBones;
			end
		end
		
		if amb and combo <= comboMax - 1 then
			return ids.Out_Ability.Ambush;
		end
		
		if dispatch and combo == comboMax then
			return ids.Out_Ability.Dispatch;
		end
	else
		if azEssence_ConcentratedFlame and not bfBuff and azCharges_ConcentratedFlame == azMaxCharges_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end

		if azEssence_GuardianofAzeroth then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if adren and ConRO_FullButton:IsVisible() then
			return ids.Out_Ability.AdrenalineRush;
		end	

		if azEssence_FocusedAzeriteBeam and not bfBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end
		
		if bflurry and not shouldRoll and not bfBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if tChosen[ids.Out_Talent.KillingSpree] then
				if kspree or bfCharges >= 2 or ksCD >= 25 then
					return ids.Out_Ability.BladeFlurry;				
				end
			elseif tChosen[ids.Out_Talent.BladeRush] then
				if brush or bfCharges >= 2 or brCD <= 8 then
					return ids.Out_Ability.BladeFlurry;				
				end
			else
				return ids.Out_Ability.BladeFlurry;
			end
		end

		if gstrike and not gsDebuff and combo <= (comboMax - 1 - broadsideReward) and (((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) or (bfBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()))) then
			return ids.Out_Talent.GhostlyStrike;
		end
		
		if kspree and not arBuff and energy <= energyMax - 35 and ConRO_FullButton:IsVisible() and (((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) or (bfBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()))) then
			return ids.Out_Talent.KillingSpree;
		end		
		
		if brush and (((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) or (bfBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()))) then
			return ids.Out_Talent.BladeRush;
		end	
		
		if mdeath and combo <= 1 then
			return ids.Out_Talent.MarkedforDeath;
		end
			
		if bteyes and combo >= (comboMax - broadsideReward - oppReward) and (rtbBuff.rp or azChosen_AceUpYourSleeve or azChosen_Deadshot) and not azBuff_Deadshot then
			return ids.Out_Ability.BetweentheEyes;
		end
		
		if tChosen[ids.Out_Talent.SliceandDice] then
			if sndice and not sndBuff and combo >= (comboMax - broadsideReward - oppReward) then
				return ids.Out_Talent.SliceandDice;
			end
		else
			if rtb and shouldRoll and combo >= (comboMax - broadsideReward - oppReward) then
				return ids.Out_Ability.RolltheBones;
			end
		end

		if dispatch and combo >= (comboMax - broadsideReward - oppReward) then
			return ids.Out_Ability.Dispatch;
		end
		
		if ps and opBuff and combo <= (comboMax - 1 - broadsideReward - oppReward) and (not azChosen_KeepYourWitsAboutYou or (azChosen_KeepYourWitsAboutYou and (kywayCount <= 9 or azBuff_Deadshot))) then
			return ids.Out_Ability.PistolShot;
		end

		if sstrike and combo <= (comboMax - 1 - broadsideReward) then
			return ids.Out_Ability.SinisterStrike;
		end
		
		if azEssence_ConcentratedFlame and azCharges_ConcentratedFlame >= 1 then
			return ids.AzEssence.ConcentratedFlame;
		end		
	end
return nil;
end

function ConRO.Rogue.OutlawDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local rip 												= ConRO:AbilityReady(ids.Out_Ability.Riposte, timeShift);
	local crim 												= ConRO:AbilityReady(ids.Out_Ability.CrimsonVial, timeShift);
	
--Conditions	
	local ph 												= ConRO:PercentHealth('player');
	local stealthed											= IsStealthed();

--Rotations	
	if crim and ph <= 70 then
		return ids.Out_Ability.CrimsonVial;
	end
	
	if not stealthed then
		if rip then
			return ids.Out_Ability.Riposte;
		end
	end
return nil;
end

function ConRO.Rogue.Subtlety(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local energy 											= UnitPower('player', Enum.PowerType.Energy);
	local energyMax											= UnitPowerMax('player', Enum.PowerType.Energy);
    local combo 											= UnitPower('player', Enum.PowerType.ComboPoints);
	local comboMax 											= UnitPowerMax('player', Enum.PowerType.ComboPoints);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	local shadowmeld										= ConRO:AbilityReady(ids.Racial.Shadowmeld, timeShift);
		local smBuff 											= ConRO:Aura(ids.Racial.Shadowmeld, timeShift);		
--Abilities	
	local kick 												= ConRO:AbilityReady(ids.Sub_Ability.Kick, timeShift);
	local sprint 											= ConRO:AbilityReady(ids.Sub_Ability.Sprint, timeShift);	
	local sod 												= ConRO:AbilityReady(ids.Sub_Ability.SymbolsofDeath, timeShift);
		local sodBuff 											= ConRO:Aura(ids.Sub_Buff.SymbolsofDeath, timeShift);
	local nb 												= ConRO:AbilityReady(ids.Sub_Ability.Nightblade, timeShift);
		local nbDebuff 											= ConRO:TargetAura(ids.Sub_Debuff.Nightblade, timeShift + 3);
	local stealth 											= ConRO:AbilityReady(ids.Sub_Ability.Stealth, timeShift);
		local _, substealth 									= ConRO:AbilityReady(ids.Sub_Talent.SubStealth, timeShift);
	local sstrike 											= ConRO:AbilityReady(ids.Sub_Ability.Shadowstrike, timeShift);
		local fwDebuff 											= ConRO:TargetAura(ids.Sub_Debuff.FindWeakness, timeShift);	
	local sd, sdCD											= ConRO:AbilityReady(ids.Sub_Ability.ShadowDance, timeShift);
		local sdCharges, sdMaxCharges, sdCCD					= ConRO:SpellCharges(ids.Sub_Ability.ShadowDance);
		local sdBuff 											= ConRO:Aura(ids.Sub_Buff.ShadowDance, timeShift);
	local evis 												= ConRO:AbilityReady(ids.Sub_Ability.Eviscerate, timeShift);
	local bstab 											= ConRO:AbilityReady(ids.Sub_Ability.Backstab, timeShift);
	local sblades 											= ConRO:AbilityReady(ids.Sub_Ability.ShadowBlades, timeShift);
		local sbBuff 											= ConRO:Aura(ids.Sub_Buff.ShadowBlades, timeShift);
	local sstorm 											= ConRO:AbilityReady(ids.Sub_Ability.ShurikenStorm, timeShift);
	local sstep												= ConRO:AbilityReady(ids.Sub_Ability.Shadowstep, timeShift);
	local vanish											= ConRO:AbilityReady(ids.Sub_Ability.Vanish, timeShift);
		local vanBuff 											= ConRO:Aura(ids.Sub_Buff.Vanish, timeShift);
	
	local gblade											= ConRO:AbilityReady(ids.Sub_Talent.Gloomblade, timeShift);
	local mdeath											= ConRO:AbilityReady(ids.Sub_Talent.MarkedforDeath, timeShift);
		local mDebuff 											= ConRO:TargetAura(ids.Sub_Debuff.MarkedforDeath, timeShift);	
	local stech												= ConRO:AbilityReady(ids.Sub_Talent.SecretTechnique, timeShift);
	local stornado											= ConRO:AbilityReady(ids.Sub_Talent.ShurikenTornado, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);
	
--Conditions
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Sub_Ability.Nightblade), 'target');	
	local inMovementRange									= ConRO:IsSpellInRange(GetSpellInfo(ids.Sub_Ability.Shadowstep), 'target');	
	local incombat 											= UnitAffectingCombat('player');
	local stealthed											= IsStealthed();
	local toClose 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Out_Ability.Kick);
	
	local castStealth = ids.Sub_Ability.Stealth
	if tChosen[ids.Sub_Talent.Subterfuge] then
		stealth = substealth;
		castStealth = ids.Sub_Talent.SubStealth;
	end
	
	local combatStealth = stealthed or sdBuff or vanBuff or smBuff;
	
	local comboReward = 0;
		if sbBuff then
			comboReward = 1;
		end
		
	local castBstab = ids.Sub_Ability.Backstab;
		if tChosen[ids.Sub_Talent.Gloomblade] then
			bstab = gblade;
			castBstab = ids.Sub_Talent.Gloomblade;
		end		
	local castSstrike = ids.Sub_Ability.Shadowstrike;
		if (ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible() then
			sstrike = sstorm;
			castSstrike = ids.Sub_Ability.ShurikenStorm;
		end

		if (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible() then
			bstab = sstorm;			
			castBstab = ids.Sub_Ability.ShurikenStorm;
		end
		
--Indicators		
	ConRO:AbilityInterrupt(ids.Sub_Ability.Kick, kick and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and toClose and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Sub_Ability.Shadowstep, sstep and inMovementRange and not inMelee);	
	ConRO:AbilityMovement(ids.Sub_Ability.Sprint, sprint and not inMelee);		
	
	ConRO:AbilityBurst(ids.Sub_Ability.ShadowBlades, sblades and nbDebuff and not sbBuff and ConRO_BurstButton:IsVisible())
	ConRO:AbilityBurst(ids.Sub_Ability.Vanish, vanish and not ConRO:TarYou() and not combatStealth and energy >= 45 and combo <= 3 and ConRO_BurstButton:IsVisible())

	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 2) or ConRO_SingleButton:IsVisible()));
	
--Rotations
	if not incombat then
		if stealth and not stealthed then
			return castStealth;
		end

		if mdeath and combo <= 1 then
			return ids.Sub_Talent.MarkedforDeath;
		end
		
		if sblades and ConRO_FullButton:IsVisible() then
			return ids.Sub_Ability.ShadowBlades;
		end
		
		if sstrike and combatStealth and combo <= comboMax - 1 then
			return castSstrike;
		end	
	else
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
	
		if sd and not combatStealth and (sdCharges == sdMaxCharges or (sdCharges >= sdMaxCharges - 1 and sdCCD >= 45 and combo >= 4)) then
			return ids.Sub_Ability.ShadowDance;
		end
		
		if sod and sd and energy <= energyMax - 40 and combo <= 1 then
			return ids.Sub_Ability.SymbolsofDeath;
		end
		
		if mdeath and combo <= 1 then
			return ids.Sub_Talent.MarkedforDeath;
		end

		if sblades and ConRO_FullButton:IsVisible() then
			return ids.Sub_Ability.ShadowBlades;
		end
		
		if stornado and combo == 0 and sodBuff and sdBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
			return ids.Sub_Talent.ShurikenTornado;
		end
		
		if vanish and not ConRO:TarYou() and not combatStealth and not fwDebuff and combo <= comboMax - 2 - comboReward and ConRO_FullButton:IsVisible() then
			return ids.Sub_Ability.Vanish;
		end

		if shadowmeld and not ConRO:TarYou() and not combatStealth and not fwDebuff and combo <= comboMax - 2 - comboReward and ConRO_FullButton:IsVisible() then
			return ids.Racial.Shadowmeld;
		end
		
		if sd and not combatStealth and sodBuff then
			return ids.Sub_Ability.ShadowDance;
		end		
	
		if tChosen[ids.Sub_Talent.DarkShadow] and sdBuff then
			if (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible() then
				if stech and combo >= comboMax - 1 then
					return ids.Sub_Talent.SecretTechnique;
				end
			end
		else
			if (ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible() then
				if stech and combo >= comboMax - 1 then
					return ids.Sub_Talent.SecretTechnique;
				end
			end
		end
		
		if tChosen[ids.Sub_Talent.DarkShadow] then
			if nb and not nbDebuff and combo >= comboMax - 1 and not sdBuff then
				return ids.Sub_Ability.Nightblade;
			end	
		else
			if nb and not nbDebuff and combo >= comboMax - 1 then
				return ids.Sub_Ability.Nightblade;
			end			
		end
		
		if stech and (sodBuff or (sdBuff and tChosen[ids.Sub_Talent.DarkShadow])) and combo >= comboMax - 1 then
			return ids.Sub_Talent.SecretTechnique;
		end		
		
		if evis and combo >= comboMax - 1 then
			return ids.Sub_Ability.Eviscerate;
		end
		
		if sstrike and combatStealth and combo <= comboMax - 2 - comboReward then
			return castSstrike;
		end		
		
		if bstab and combo <= comboMax - 1 - comboReward then
			return castBstab;
		end
	end
    return nil;
end

function ConRO.Rogue.SubletyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Abilities	
	local eva 												= ConRO:AbilityReady(ids.Sub_Ability.Evasion, timeShift);
	local crim 												= ConRO:AbilityReady(ids.Sub_Ability.CrimsonVial, timeShift);

--Conditions	
	local ph 												= ConRO:PercentHealth('player');
	local stealthed												= IsStealthed();

--Rotations	
	if crim and ph <= 70 then
		return ids.Sub_Ability.CrimsonVial;
	end
		
	if not stealthed then	
		if eva then
			return ids.Sub_Ability.Evasion;
		end
	end
	return nil;
end