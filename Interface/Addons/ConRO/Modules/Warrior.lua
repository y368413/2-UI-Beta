if select(2, UnitClass("player")) ~= "WARRIOR" then return end
local ConRO_Warrior, ids = ...;

--Generic
	ids.Racial = {
		ArcaneTorrent = 69179,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Warrior_AzTrait = {
		ColdSteelHotBlood = 288080,
		TestofMight = 275529,
	}
	ids.Warrior_AzTraitBuff = {
		CrushingAssault = 278826,
		TestofMight = 275532,
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
	
--Arms
	ids.Arms_Ability = {
		BattleShout = 6673,
		BerserkerRage = 18499,
		Bladestorm = 227847,
		Charge = 100,
		ColossusSmash = 167105,
		DiebytheSword = 118038,
		Execute = 163201,
		Hamstring = 1715,
		HeroicLeap = 6544,
		HeroicThrow = 57755,
		IntimidatingShout = 5246,
		MortalStrike = 12294,
		Overpower = 7384,
		Pummel = 6552,
		RallyingCry = 97462,
		Slam = 1464,
		SweepingStrikes = 260708,
		Taunt = 355,
		VictoryRush = 34428,
		Whirlwind = 1680,
	}
	ids.Arms_Passive = {
		MasteryDeepWounds = 262111,
		SeasonedSoldier = 279423,
		Tactician = 184783,
	}
	ids.Arms_Talent = {
		--15
		WarMachine = 262231,
		SuddenDeath = 29725,
		Skullsplitter = 260643,
		--30
		DoubleTime = 103827,
		ImpendingVictory = 202168,
		StormBolt = 107570,
		--45
		Massacre = 281001,
			MassacreExecute = 281000,
		FervorofBattle = 202316,
		Rend = 772,
		--60
		SecondWind = 29838,
		BoundingStride = 202163,
		DefensiveStance = 197690,
			BattleStance = 212520,
		--75
		CollateralDamage = 268243,
		Warbreaker = 262161,
		Cleave = 845,
		--90
		InForTheKill = 248621,
		Avatar = 107574,
		DeadlyCalm = 262228,
		--100
		AngerManagement = 152278,
		Dreadnaught = 262150,
		Ravager = 152277,
	}
	ids.Arms_Form = {
		DefensiveStance = 197690,
	}
	ids.Arms_Buff = {
		Avatar = 107574,
		BattleShout = 6673,
		DeadlyCalm = 262228,
		InForTheKill = 248622,
		Overpower = 7384,
		SuddenDeath = 52437,
		SweepingStrikes = 260708,
		Victorious = 32216,
	}
	ids.Arms_Debuff = {
		ColossusSmash = 208086,
		DeepWounds = 262115,
		MortalWounds = 115804,
		Rend = 772,
	}
	ids.Arms_PetAbility = {

	}
		
--Fury
	ids.Fury_Ability = {
		BattleShout = 6673,
		BerserkerRage = 18499,
		Bloodthirst = 23881,
		Charge = 100,
		EnragedRegeneration = 184364,
		Execute = 5308,
		HeroicLeap = 6544,
		HeroicThrow = 57755,
		IntimidatingShout = 5246,
		PiercingHowl = 12323,
		Pummel = 6552,
		RagingBlow = 85288,
		RallyingCry = 97462,
		Rampage = 184367,
		Recklessness = 1719,
		Taunt = 355,
		VictoryRush = 34428,
		Whirlwind = 190411,
	}
	ids.Fury_Passive = {
		Enrage = 184361,
		MasteryUnshackledFury = 76856,
		TitansGrip = 46917,
	}
	ids.Fury_Talent = {
		--15
		WarMachine = 262231,
		EndlessRage = 202296,
		FreshMeat = 215568,
		--30
		DoubleTime = 103827,
		ImpendingVictory = 202168,
		StormBolt = 107570,
		--45
		InnerRage = 215573,
		SuddenDeath = 280721,
		FuriousSlash = 100130,
		--60
		FuriousCharge = 202224,
		BoundingStride = 202163,
		Warpaint = 208154,
		--75
		Carnage = 202922,
		Massacre = 206315,
			MassacreExecute = 280735,
		FrothingBerserker = 215571,
		--90
		MeatCleaver = 280392,
		DragonRoar = 118000,
		Bladestorm = 46924,
		--100
		RecklessAbandon = 202751,
		AngerManagement = 152278,
		Siegebreaker = 280772,
	}
	ids.Fury_Form = {
	
	}
	ids.Fury_Buff = {
		BattleShout = 6673,
		Enrage = 184362,
		FuriousSlash = 202539,
		Whirlwind = 85739,
		SuddenDeath = 280776,
		Recklessness = 1719,
		Victorious = 32216,
	}
	ids.Fury_Debuff = {
		Siegebreaker = 280773,
	}
	ids.Fury_PetAbility = {

	}

--Protection
	ids.Prot_Ability = {
		Avatar = 107574,
		BattleShout = 6673,
		BerserkerRage = 18499,
		DemoralizingShout = 1160,
		Devastate = 20243,
		HeroicLeap = 6544,
		HeroicThrow = 57755,
		IgnorePain = 190456,
		Intercept = 198304,
		IntimidatingShout = 5246,
		LastStand = 12975,
		Pummel = 6552,
		RallyingCry = 97462,
		Revenge = 6572,
		ShieldBlock = 2565,
		ShieldSlam = 23922,
		ShieldWall = 871,
		Shockwave = 46968,
		SpellReflection = 23920,
		Taunt = 355,
		ThunderClap = 6343,
		VictoryRush = 34428,
	}
	ids.Prot_Passive = {
		DeepWounds = 115768,
		MasteryCriticalBlock = 76857,
		Vanguard = 71,
	}
	ids.Prot_Talent = {
		--15
		IntotheFray = 202603,
		Punish = 275334,
		ImpendingVictory = 202168,
		--30
		CracklingThunder = 203201,
		BoundingStrike = 202163,
		Safeguard = 223657,
		--45
		BestServedCold = 202560,
		UnstoppableForce = 275336,
		DragonRoar = 118000,
		--60
		Indomitable = 202095,
		NeverSurrender = 202561,
		Bolster = 280001,
		--75
		Menace = 275338,
		RumblingEarth = 275339,
		StormBolt = 107570,
		--90
		BoomingVoice = 202743,
		Vengeance = 202572,
		Devastator = 236279,
		--100
		AngerManagement = 152278,
		HeavyRepercussions = 203177,
		Ravager = 228920,
	}
	ids.Prot_Form = {
	
	}
	ids.Prot_Buff = {
		Avatar = 107574,
		BattleShout = 6673,
		IgnorePain = 190456,
		Revenge = 5302,
		ShieldBlock = 132404,
		VengeanceIgnorePain = 202574,
		VengeanceRevenge = 202573,		
		Victorious = 32216,
 	}
	ids.Prot_Debuff = {
		DeepWounds = 115767,
		DemoralizingShout = 1160,
		
	}
	ids.Prot_PetAbility = {

	}
	
	ConRO.Warrior = {};
ConRO.Warrior.CheckTalents = function() end

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Warrior.CheckTalents;
	if mode == 1 then
		self.Description = 'Warrior [Arms - Melee]';
		self.NextSpell = ConRO.Warrior.Arms;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = 'Warrior [Fury - Melee]';
		self.NextSpell = ConRO.Warrior.Fury;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = 'Warrior [Protection - Tank]';
		self.NextSpell = ConRO.Warrior.Protection;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;	
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Warrior.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Warrior.ArmsDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Warrior.FuryDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Warrior.ProtectionDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Warrior.Arms(_, timeShift, currentSpell, gcd, tChosen)
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities	
	local pummel											= ConRO:AbilityReady(ids.Arms_Ability.Pummel, timeShift);
	local bshout											= ConRO:AbilityReady(ids.Arms_Ability.BattleShout, timeShift);
	local hthrow											= ConRO:AbilityReady(ids.Arms_Ability.HeroicThrow, timeShift);	
	local csmash, csCD										= ConRO:AbilityReady(ids.Arms_Ability.ColossusSmash, timeShift);
		local csDebuff											= ConRO:TargetAura(ids.Arms_Debuff.ColossusSmash, timeShift);
	local mstrike											= ConRO:AbilityReady(ids.Arms_Ability.MortalStrike, timeShift);
		local dwDebuff											= ConRO:TargetAura(ids.Arms_Debuff.DeepWounds, timeShift + 1.5);
	local charge 											= ConRO:AbilityReady(ids.Arms_Ability.Charge, timeShift);
		local inChRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Arms_Ability.Charge), 'target');
	local slam 												= ConRO:AbilityReady(ids.Arms_Ability.Slam, timeShift);
		local caAzBuff											= ConRO:Aura(ids.Warrior_AzTraitBuff.CrushingAssault, timeShift);	
	local ww 												= ConRO:AbilityReady(ids.Arms_Ability.Whirlwind, timeShift);
	local bstorm 											= ConRO:AbilityReady(ids.Arms_Ability.Bladestorm, timeShift);
	local exe												= ConRO:AbilityReady(ids.Arms_Ability.Execute, timeShift);
		local mexeCD 											= ConRO:Cooldown(ids.Arms_Talent.MassacreExecute, timeShift);
		local sdBuff											= ConRO:Aura(ids.Arms_Buff.SuddenDeath, timeShift);
	local opower											= ConRO:AbilityReady(ids.Arms_Ability.Overpower, timeShift);
		local opCharges											= ConRO:SpellCharges(ids.Arms_Ability.Overpower);
		local opBuff, opBCount									= ConRO:Aura(ids.Arms_Buff.Overpower, timeShift);
	local sstrikes											= ConRO:AbilityReady(ids.Arms_Ability.SweepingStrikes, timeShift);
		local ssBuff											= ConRO:Aura(ids.Arms_Buff.SweepingStrikes, timeShift);
		
	local ssplit											= ConRO:AbilityReady(ids.Arms_Talent.Skullsplitter, timeShift);
	local sbolt												= ConRO:AbilityReady(ids.Arms_Talent.StormBolt, timeShift);
	local wbreaker, wbCD									= ConRO:AbilityReady(ids.Arms_Talent.Warbreaker, timeShift);
	local cleave 											= ConRO:AbilityReady(ids.Arms_Talent.Cleave, timeShift);
	local avatar 											= ConRO:AbilityReady(ids.Arms_Talent.Avatar, timeShift);
	local dcalm 											= ConRO:AbilityReady(ids.Arms_Talent.DeadlyCalm, timeShift);
	local rend 												= ConRO:AbilityReady(ids.Arms_Talent.Rend, timeShift);
		local rDebuff											= ConRO:TargetAura(ids.Arms_Debuff.Rend, timeShift + 4);
	local ravager											= ConRO:AbilityReady(ids.Arms_Talent.Ravager, timeShift);

	local azChosen_TestofMight								= ConRO:AzPowerChosen(ids.Warrior_AzTrait.TestofMight);
		local tomAzBuff											= ConRO:Aura(ids.Warrior_AzTraitBuff.TestofMight, timeShift);

	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);	
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
		local moldAzEssBuff										= ConRO:Aura(ids.AzEssenceBuff.MemoryofLucidDream, timeShift);
		
--Conditions	
	local targetPh 											= ConRO:PercentHealth('target');
	local canExe											= targetPh <= 25;
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Arms_Ability.Pummel);
	
	local castExecute = ids.Arms_Ability.Execute;
		if tChosen[ids.Arms_Talent.Massacre] then
			canExe = targetPh <= 35;
			exe = exe and mexeCD <= 0;
			castExecute = ids.Arms_Talent.MassacreExecute;
		end
	
--Indicators		
	ConRO:AbilityInterrupt(ids.Arms_Ability.Pummel, pummel and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityRaidBuffs(ids.Arms_Ability.BattleShout, bshout and not ConRO:RaidBuff(ids.Arms_Ability.BattleShout));
	ConRO:AbilityMovement(ids.Arms_Ability.Charge, charge and inChRange);
	
	ConRO:AbilityBurst(ids.Arms_Talent.Avatar, avatar and (csCD < 10 or (tChosen[ids.Arms_Talent.Warbreaker] and wbCD < 10)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Arms_Ability.Bladestorm, bstorm and not ssBuff and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Arms_Talent.Ravager, ravager and ConRO_BurstButton:IsVisible());
	
--Warnings	
	
--Rotations	
	if azEssence_ConcentratedFlame and not csDebuff and not tomAzBuff then
		return ids.AzEssence.ConcentratedFlame;
	end

	if azEssence_BloodoftheEnemy and ((csmash and not azChosen_TestofMight) or tomAzBuff) then
		return ids.AzEssence.BloodoftheEnemy;
	end
	
	if ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) and canExe then
		if ssplit and rage < 70 then
			return ids.Arms_Talent.Skullsplitter;
		end

		if azEssence_GuardianofAzeroth and ((csmash and not tChosen[ids.Arms_Talent.Warbreaker]) or (wbreaker and tChosen[ids.Arms_Talent.Warbreaker])) then
			return ids.AzEssence.GuardianofAzeroth;
		end

		if azEssence_MemoryofLucidDream and ((csmash and not tChosen[ids.Arms_Talent.Warbreaker]) or (wbreaker and tChosen[ids.Arms_Talent.Warbreaker])) then
			return ids.AzEssence.MemoryofLucidDream;
		end
		
		if tChosen[ids.Arms_Talent.Warbreaker] then
			if wbreaker then
				return ids.Arms_Talent.Warbreaker;
			end
		else	
			if csmash then
				return ids.Arms_Ability.ColossusSmash;
			end
		end	

		if rage < 30 then
			if tChosen[ids.Arms_Talent.Ravager] then
				if ravager and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
					return ids.Arms_Talent.Ravager;
				end
			else
				if bstorm and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
					return ids.Arms_Ability.Bladestorm;
				end
			end	
		end
		
		if slam and caAzBuff then
			return ids.Arms_Ability.Slam;
		end		

		if mstrike and opBCount == 2 and tChosen[ids.Arms_Talent.Dreadnaught] then
			return ids.Arms_Ability.MortalStrike;
		end

		if opower and not moldAzEssBuff then
			return ids.Arms_Ability.Overpower;
		end
		
		if exe and (rage >= 40 or csDebuff or sdBuff) then
			return castExecute;
		end
	else
		if azEssence_GuardianofAzeroth and ((csmash and not tChosen[ids.Arms_Talent.Warbreaker]) or (wbreaker and tChosen[ids.Arms_Talent.Warbreaker])) and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and ssBuff)) then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if sstrikes and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and (ConRO_BurstButton:IsVisible() or ((not bstorm or tChosen[ids.Arms_Talent.Ravager]) and ConRO_FullButton:IsVisible())) then
			return ids.Arms_Ability.SweepingStrikes;
		end	
	
		if rend and not rDebuff and not csDebuff and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and ssBuff)) then
			return ids.Arms_Talent.Rend;
		end

		if ssplit and rage < 60 then
			return ids.Arms_Talent.Skullsplitter;
		end
		
		if avatar and (csCD < 10 or (tChosen[ids.Arms_Talent.Warbreaker] and wbCD < 10)) and ConRO_FullButton:IsVisible() then
			return ids.Arms_Talent.Avatar;
		end

		if azEssence_MemoryofLucidDream and ((csmash and not tChosen[ids.Arms_Talent.Warbreaker]) or (wbreaker and tChosen[ids.Arms_Talent.Warbreaker])) and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and ssBuff)) then
			return ids.AzEssence.MemoryofLucidDream;
		end
		
		if tChosen[ids.Arms_Talent.Warbreaker] then
			if wbreaker then
				return ids.Arms_Talent.Warbreaker;
			end
		else	
			if csmash and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and ssBuff)) then
				return ids.Arms_Ability.ColossusSmash;
			end
		end

		if ((ConRO_AutoButton:IsVisible() and tarInMelee >= 4) or ConRO_AoEButton:IsVisible()) then
			if tChosen[ids.Arms_Talent.Ravager] then
				if ravager and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
					return ids.Arms_Talent.Ravager;
				end
			else
				if bstorm and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
					return ids.Arms_Ability.Bladestorm;
				end
			end
		end

		if cleave and not dwDebuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 4) or ConRO_AoEButton:IsVisible()) then
			return ids.Arms_Talent.Cleave;
		end
		
		if dcalm then
			return ids.Arms_Talent.DeadlyCalm;
		end		

		if exe and sdBuff and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2 and tarInMelee <= 4) or ConRO_AoEButton:IsVisible()) and ssBuff)) then
			return castExecute;
		end
		
		if opower and opBCount ~= 2 and not (csDebuff and moldAzEssBuff) then
			return ids.Arms_Ability.Overpower;
		end		

		if mstrike and (((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) or (((ConRO_AutoButton:IsVisible() and tarInMelee >= 2 and tarInMelee <= 4) or ConRO_AoEButton:IsVisible()) and ssBuff) or opBCount == 2 or (csDebuff and moldAzEssBuff)) then
			return ids.Arms_Ability.MortalStrike;
		end
		
		if tChosen[ids.Arms_Talent.Ravager] then
			if ravager and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
				return ids.Arms_Talent.Ravager;
			end
		else
			if bstorm and (csDebuff or (not csDebuff and azChosen_TestofMight)) and ConRO_FullButton:IsVisible() then
				return ids.Arms_Ability.Bladestorm;
			end
		end
		
		if tChosen[ids.Arms_Talent.FervorofBattle] or (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible() then
			if ww and (rage >= 60 or (csDebuff and moldAzEssBuff)) then
				return ids.Arms_Ability.Whirlwind;
			end
		else
			if slam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) and rage >= 50 then
				return ids.Arms_Ability.Slam;
			end
		end
	end
return nil;
end

function ConRO.Warrior.ArmsDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities	
	local rcry												= ConRO:AbilityReady(ids.Arms_Ability.RallyingCry, timeShift);
	local dbts 												= ConRO:AbilityReady(ids.Arms_Ability.DiebytheSword, timeShift);
	local vrush 											= ConRO:AbilityReady(ids.Arms_Ability.VictoryRush, timeShift);
		local vBuff												= ConRO:Aura(ids.Arms_Buff.Victorious, timeShift);
	
	local dstance											= ConRO:AbilityReady(ids.Arms_Talent.DefensiveStance, timeShift);
		local defform											= ConRO:Form(ids.Arms_Form.DefensiveStance);
	local ivic	 											= ConRO:AbilityReady(ids.Arms_Talent.ImpendingVictory, timeShift);
	
--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if tChosen[ids.Arms_Talent.ImpendingVictory] then
		if ivic and playerPh <= 80 then	
			return ids.Arms_Talent.ImpendingVictory;
		end
	else
		if vrush and vBuff and playerPh < 100 then	
			return ids.Arms_Ability.VictoryRush;
		end
	end
	
	if dbts then
		return ids.Arms_Ability.DiebytheSword;
	end
	
	if rcry then
		return ids.Arms_Ability.RallyingCry;
	end
	
	if dstance and not defform then
		return ids.Arms_Talent.DefensiveStance;
	end	
return nil;
end

function ConRO.Warrior.Fury(_, timeShift, currentSpell, gcd, tChosen)
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities	
	local bt 												= ConRO:AbilityReady(ids.Fury_Ability.Bloodthirst, timeShift + 0.5);
		local eBuff 											= ConRO:Aura(ids.Fury_Buff.Enrage, timeShift);
	local rb 												= ConRO:AbilityReady(ids.Fury_Ability.RagingBlow, timeShift + 0.5);
		local rbCharges											= ConRO:SpellCharges(ids.Fury_Ability.RagingBlow);		
	local charge 											= ConRO:AbilityReady(ids.Fury_Ability.Charge, timeShift);
		local inChRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Fury_Ability.Charge), 'target');
	local pummel 											= ConRO:AbilityReady(ids.Fury_Ability.Pummel, timeShift);
	local ramp 												= ConRO:AbilityReady(ids.Fury_Ability.Rampage, timeShift);
	local exe 												= ConRO:AbilityReady(ids.Fury_Ability.Execute, timeShift);
		local mexeCD 											= ConRO:Cooldown(ids.Fury_Talent.MassacreExecute, timeShift);
		local sdBuff 											= ConRO:Aura(ids.Fury_Buff.SuddenDeath, timeShift);	
	local ww 												= ConRO:AbilityReady(ids.Fury_Ability.Whirlwind, timeShift);
		local wwBuff, wwBCount									= ConRO:Aura(ids.Fury_Buff.Whirlwind, timeShift + 2);
	local bshout											= ConRO:AbilityReady(ids.Fury_Ability.BattleShout, timeShift);	
	local reck, reckCD										= ConRO:AbilityReady(ids.Fury_Ability.Recklessness, timeShift);
		local reckBuff 											= ConRO:Aura(ids.Fury_Buff.Recklessness, timeShift);
		
	local fs 												= ConRO:AbilityReady(ids.Fury_Talent.FuriousSlash, timeShift);
		local fsBuff, fsBCount 									= ConRO:Aura(ids.Fury_Buff.FuriousSlash, timeShift + 2);	
	local dr 												= ConRO:AbilityReady(ids.Fury_Talent.DragonRoar, timeShift);
	local bstorm 											= ConRO:AbilityReady(ids.Fury_Talent.Bladestorm, timeShift);
	local sbreaker											= ConRO:AbilityReady(ids.Fury_Talent.Siegebreaker, timeShift);
		local sbDebuff											= ConRO:TargetAura(ids.Fury_Debuff.Siegebreaker, timeShift);
		
	local azChosen_CSteelHBlood, azCount_CSteelHBlood		= ConRO:AzPowerChosen(ids.Warrior_AzTrait.ColdSteelHotBlood);

	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);	
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
		local moldAzEssBuff										= ConRO:Aura(ids.AzEssenceBuff.MemoryofLucidDream, timeShift);
	
--Conditions	
	local targetPh 											= ConRO:PercentHealth('target');
	local canExe											= targetPh <= 25;
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Fury_Ability.Pummel);
	local incombat 											= UnitAffectingCombat('player');
	
	local castExecute = ids.Fury_Ability.Execute;
		if tChosen[ids.Fury_Talent.Massacre] then
			canExe = targetPh <= 35;
			exe = exe and mexeCD <= 0;
			castExecute = ids.Fury_Talent.MassacreExecute;
		end

--Indicators	
	ConRO:AbilityInterrupt(ids.Fury_Ability.Pummel, pummel and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityRaidBuffs(ids.Fury_Ability.BattleShout, bshout and not ConRO:RaidBuff(ids.Fury_Ability.BattleShout));
	ConRO:AbilityMovement(ids.Fury_Ability.Charge, charge and inChRange);
	
	ConRO:AbilityBurst(ids.Fury_Ability.Recklessness, reck and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Fury_Talent.Bladestorm, bstorm and ConRO_BurstButton:IsVisible());
	
--Warnings	


--Rotations	
	if azEssence_BloodoftheEnemy and reckBuff then
		return ids.AzEssence.BloodoftheEnemy;
	end
	
	if azEssence_GuardianofAzeroth and (not incombat or reck) then
		return ids.AzEssence.GuardianofAzeroth;
	end
	
	if azEssence_MemoryofLucidDream and (not tChosen[ids.Fury_Talent.AngerManagement] or (tChosen[ids.Fury_Talent.AngerManagement] and reck)) then
		return ids.AzEssence.MemoryofLucidDream;
	end

	if azEssence_ConcentratedFlame and not (reckBuff or sbDebuff) then
		return ids.AzEssence.ConcentratedFlame;
	end
	
	if ww and not wwBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Fury_Ability.Whirlwind;
	end	

	if fs and (not fsBuff or fsBCount < 3) and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) then
		return ids.Fury_Talent.FuriousSlash;
	end
	
	if reck and ConRO_FullButton:IsVisible() then
		return ids.Fury_Ability.Recklessness;
	end	
	
	if sbreaker and reckCD >= 20 then
		return ids.Fury_Talent.Siegebreaker;
	end		
	
	if ramp and (not eBuff or reckBuff or rage == rageMax) then
		return ids.Fury_Ability.Rampage;
	end	

	if dr and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Fury_Talent.DragonRoar;
	end
		
	if bstorm and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and ConRO_FullButton:IsVisible() then
		return ids.Fury_Talent.Bladestorm;
	end
	
	if exe and eBuff and (sdBuff or canExe) then
		return castExecute;
	end
	
	if rb and rbCharges >= 2 and eBuff and azCount_CSteelHBlood < 2 then
		return ids.Fury_Ability.RagingBlow;
	end	

	if bt then
		return ids.Fury_Ability.Bloodthirst;
	end		
	
	if dr and eBuff then
		return ids.Fury_Talent.DragonRoar;
	end
		
	if bstorm and eBuff and ConRO_FullButton:IsVisible() then
		return ids.Fury_Talent.Bladestorm;
	end	
	
	if rb then
		return ids.Fury_Ability.RagingBlow;
	end	
	
	if fs and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) then
		return ids.Fury_Talent.FuriousSlash;
	end
		
	if ww and (not tChosen[ids.Fury_Talent.FuriousSlash] or ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible())) then
		return ids.Fury_Ability.Whirlwind;
	end
return nil;
end

function ConRO.Warrior.FuryDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities	
	local rcry 												= ConRO:AbilityReady(ids.Fury_Ability.RallyingCry, timeShift);
	local eregen											= ConRO:AbilityReady(ids.Fury_Ability.EnragedRegeneration, timeShift);
	local vrush 											= ConRO:AbilityReady(ids.Fury_Ability.VictoryRush, timeShift);
		local vBuff												= ConRO:Aura(ids.Fury_Buff.Victorious, timeShift);

	local ivic	 											= ConRO:AbilityReady(ids.Fury_Talent.ImpendingVictory, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	
--Rotations	
	if tChosen[ids.Fury_Talent.ImpendingVictory] then
		if ivic and playerPh <= 80 then	
			return ids.Fury_Talent.ImpendingVictory;
		end
	else
		if vrush and vBuff and playerPh < 100 then	
			return ids.Fury_Ability.VictoryRush;
		end
	end
	
	if eregen then
		return ids.Fury_Ability.EnragedRegeneration;
	end
		
	if rcry then
		return ids.Fury_Ability.RallyingCry;
	end
	
	return nil;
end

function ConRO.Warrior.Protection(_, timeShift, currentSpell, gcd, tChosen)
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local taunt 											= ConRO:AbilityReady(ids.Prot_Ability.Taunt, timeShift);
	local revenge 											= ConRO:AbilityReady(ids.Prot_Ability.Revenge, timeShift);
		local rBuff 											= ConRO:Aura(ids.Prot_Buff.Revenge, timeShift);
		local venBuff 											= ConRO:Aura(ids.Prot_Buff.VengeanceRevenge, timeShift);		
	local sslam, ssCD										= ConRO:AbilityReady(ids.Prot_Ability.ShieldSlam, timeShift);
	local tclap												= ConRO:AbilityReady(ids.Prot_Ability.ThunderClap, timeShift);
	local pummel 											= ConRO:AbilityReady(ids.Prot_Ability.Pummel, timeShift);
	local intercept 										= ConRO:AbilityReady(ids.Prot_Ability.Intercept, timeShift);
		local inIntRange 										= ConRO:IsSpellInRange(GetSpellInfo(ids.Prot_Ability.Intercept), 'target');	
	local devas 											= ConRO:AbilityReady(ids.Prot_Ability.Devastate, timeShift);
	local bshout 											= ConRO:AbilityReady(ids.Prot_Ability.BattleShout, timeShift);	
	local avatar 											= ConRO:AbilityReady(ids.Prot_Ability.Avatar, timeShift);
		local avBuff 											= ConRO:Aura(ids.Prot_Buff.Avatar, timeShift);
	local sw 												= ConRO:AbilityReady(ids.Prot_Ability.Shockwave, timeShift);
	local demoshout											= ConRO:AbilityReady(ids.Prot_Ability.DemoralizingShout, timeShift);
	local sblock 											= ConRO:AbilityReady(ids.Prot_Ability.ShieldBlock, timeShift);
		local sbCharges											= ConRO:SpellCharges(ids.Prot_Ability.ShieldBlock);
		local sbBuff 											= ConRO:Aura(ids.Prot_Buff.ShieldBlock, timeShift);
		
	local ravager 											= ConRO:AbilityReady(ids.Prot_Talent.Ravager, timeShift);
	local sb 												= ConRO:AbilityReady(ids.Prot_Talent.StormBolt, timeShift);

--Conditions	
	local ph 												= ConRO:PercentHealth('target');
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= ConRO:Targets(ids.Prot_Ability.Pummel);
	
--Indicators		
	ConRO:AbilityInterrupt(ids.Prot_Ability.Pummel, pummel and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityRaidBuffs(ids.Prot_Ability.BattleShout, bshout and not ConRO:RaidBuff(ids.Prot_Ability.BattleShout));
	ConRO:AbilityTaunt(ids.Prot_Ability.Taunt, taunt and (not ConRO:InRaid() or (ConRO:InRaid() and ConRO:TarYou())));
	ConRO:AbilityMovement(ids.Prot_Ability.Intercept, intercept and inIntRange);
	
	ConRO:AbilityBurst(ids.Prot_Talent.Ravager, ravager);
	ConRO:AbilityBurst(ids.Prot_Ability.Avatar, avatar and ConRO_BurstButton:IsVisible());

--Warnings	

--Rotations	
	if avatar and ConRO_FullButton:IsVisible() then
		return ids.Prot_Ability.Avatar;
	end

	if tclap and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Prot_Ability.ThunderClap;
	end
	
	if demoshout and tChosen[ids.Prot_Talent.BoomingVoice] then
		return ids.Prot_Ability.DemoralizingShout;
	end

	if revenge and (rBuff or rage >= 60 or (venBuff and rage >= 50)) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Prot_Ability.Revenge;
	end
	
	if sblock and (sslam or ssCD < 2) and not sbBuff and sbCharges >= 2 then
		return ids.Prot_Ability.ShieldBlock;
	end
	
	if sslam then
		return ids.Prot_Ability.ShieldSlam;
	end	
	
	if tclap and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) then
		return ids.Prot_Ability.ThunderClap;
	end		
	
	if revenge and rBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 1) or ConRO_SingleButton:IsVisible()) then
		return ids.Prot_Ability.Revenge;
	end		
	
	if devas and not tChosen[ids.Prot_Talent.Devastator] then
		return ids.Prot_Ability.Devastate;
	end
	return nil;
end

function ConRO.Warrior.ProtectionDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);

--Abilities	
	local swall 											= ConRO:AbilityReady(ids.Prot_Ability.ShieldWall, timeShift);
	local sblock											= ConRO:AbilityReady(ids.Prot_Ability.ShieldBlock, timeShift);
		local sbCharges											= ConRO:SpellCharges(ids.Prot_Ability.ShieldBlock);
		local sbBuff 											= ConRO:Aura(ids.Prot_Buff.ShieldBlock, timeShift);
	local lstand 											= ConRO:AbilityReady(ids.Prot_Ability.LastStand, timeShift);
	local dshout											= ConRO:AbilityReady(ids.Prot_Ability.DemoralizingShout, timeShift);
	local vrush 											= ConRO:AbilityReady(ids.Prot_Ability.VictoryRush, timeShift);
		local vBuff 											= ConRO:Aura(ids.Prot_Buff.Victorious, timeShift);
	local ipain 											= ConRO:AbilityReady(ids.Prot_Ability.IgnorePain, timeShift);
		local ipBuff 											= ConRO:Aura(ids.Prot_Buff.IgnorePain, timeShift);
		local venBuff 											= ConRO:Aura(ids.Prot_Buff.VengeanceIgnorePain, timeShift);	
	local sReflection										= ConRO:AbilityReady(ids.Prot_Ability.SpellReflection, timeShift);
		
	local ivic 												= ConRO:AbilityReady(ids.Prot_Talent.ImpendingVictory, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	
--Rotations	
	if tChosen[ids.Prot_Talent.ImpendingVictory] then
		if ivic and playerPh <= 80 then	
			return ids.Prot_Talent.ImpendingVictory;
		end
	else
		if vrush and vBuff and playerPh < 100 then	
			return ids.Prot_Ability.VictoryRush;
		end
	end
	
	if sReflection and (ConRO:BossCast() or ConRO:Interrupt()) then
		return ids.Prot_Ability.SpellReflection;
	end
	
	if lstand and playerPh <= 40 then
		return ids.Prot_Ability.LastStand;
	end
	
	if ipain and not ipBuff and playerPh <= 90 and (rage >= 70 or (venBuff and rage >= 57)) then
		return ids.Prot_Ability.IgnorePain;
	end
	
	if sblock and sbCharges >= 1 and ConRO:TarYou() then
		return ids.Prot_Ability.ShieldBlock;
	end
	
	if demo then
		return ids.Prot_Ability.DemoralizingShout;
	end
	
	if swall then
		return ids.Prot_Ability.ShieldWall;
	end
	
	return nil;
end
