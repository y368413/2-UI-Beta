if select(2, UnitClass("player")) ~= "DEATHKNIGHT" then return end

local ConRO_DeathKnight, ids = ...;

--Generic
	ids.Racial = {
		ArcanePulse = 260364,
		ArcaneTorrent = 50613,
		Berserking = 26297,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.DeathKnight_AzTrait = {
		BonesoftheDamned = 278484,
	}
	ids.DeathKnight_AzTraitBuff = {

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
	
--Blood
	ids.Blood_Ability = {
		AntiMagicShell = 48707,
		Asphyxiate = 221562,
		BloodBoil = 50842,
		ControlUndead = 111673,
		DancingRuneWeapon = 49028,
		DarkCommand = 56222,
		DeathandDecay = 43265,
		DeathGate = 50977,
		DeathGrip = 49576,
		DeathStrike = 49998,
		DeathsAdvance = 48265,
		DeathsCaress = 195292,
		GorefiendsGrasp = 108199,
		HeartStrike = 206930,
		IceboundFortitude = 48792,
		Marrowrend = 195182,
		MindFreeze = 47528,
		PathofFrost = 3714,
		RaiseAlly = 61999,
		Runeforging = 53428,
		VampiricBlood = 55233,
	}
	ids.Blood_Passive = {
		CrimsonScourge = 81136,
		MasteryBloodShield = 77513,
		OnaPaleHorse = 51986,
		VeteranoftheThirdWar = 48263,
	}
	ids.Blood_Talent = {
		--56
		Heartbreaker = 221536,		
		Blooddrinker = 206931,		
		RuneStrike = 210764,
		--57		
		RapidDecomposition = 194662,
		Hemostasis = 273946,
		Consumption = 274156,
		--58		
		FoulBulwark = 206974,
		Ossuary = 219786,
		Tombstone = 219809,		
		--60
		WilloftheNecropolis = 206967,
		AntiMagicBarrier = 205727,
		RuneTap = 194679,
		--75
		GripoftheDead = 273952,
		TighteningGrasp = 206970,
		WraithWalk = 212552,
		--90
		Voracious = 273953,
		Bloodworms = 195679,
		MarkofBlood = 206940,		
		--100
		Purgatory = 114556,
		RedThirst = 205723,
		Bonestorm = 194844,
	}
	ids.Blood_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		UnholyCommand = 202727,
		WalkingDead = 202731,
		Strangulate = 47476,
		BloodforBlood = 233411,
		LastDance = 233412,
		DeathChain = 203173,
		MurderousIntent = 207018,
		AntiMagicZone = 51052,
		NecroticAura = 199642,
		DecomposingAura = 199720,
		DarkSimulacrum = 77606,
	}
	ids.Blood_Form = {
	
	}
	ids.Blood_Buff = {
		BloodforBlood = 233411,
		BloodShield = 77535,
		BoneShield = 195181,
		CrimsonScourge = 81141,
		DancingRuneWeapon = 81256,
		DeathandDecay = 188290,
		Hemostasis = 273947,
	}
	ids.Blood_Debuff = {
		BloodPlague = 55078,
	}
	ids.Blood_PetAbility = {
			
	}
		
--Frost
	ids.Frost_Ability = {
		AntiMagicShell = 48707,
		ChainsofIce = 45524,
		ControlUndead = 111673,
		DarkCommand = 56222,
		DeathGate = 50977,
		DeathGrip = 49576,
		DeathStrike = 49998,
		DeathsAdvance = 48265,
		EmpowerRuneWeapon = 47568,
		FrostStrike = 49143,
		HowlingBlast = 49184,
		IceboundFortitude = 48792,
		MindFreeze = 47528,
		Obliterate = 49020,
		PathofFrost = 3714,
		PillarofFrost = 51271,
		RaiseAlly = 61999,
		RemorselessWinter = 196770,
		Runeforging = 53428,
	}
	ids.Frost_Passive = {
		DarkSuccor = 178819,
		KillingMachine = 51128,
		MasteryFrozenHeart = 77514,
		OnaPaleHorse = 51986,
		Rime = 59057,
		RunicEmpowerment = 81229,
	}
	ids.Frost_Talent = {
		--56
		InexorableAssault = 253593,
		IcyTalons = 194878,		
		ColdHeart = 281208,
		--57
		RunicAttenuation = 207104,
		MurderousEfficiency = 207061,
		HornofWinter = 57330,
		--58		
		DeathsReach = 276079,
		Asphyxiate = 108194,
		BlindingSleet = 207167,		
		--60		
		Avalanche = 207142,
		FrozenPulse = 194909,
		Frostscythe = 207230,
		--75
		Permafrost = 207200,
		WraithWalk = 212552,
		DeathPact = 48743,
		--90
		GatheringStorm = 194912,
		GlacialAdvance = 194913,
		FrostwyrmsFury = 279302,
		--100
		Icecap = 207126,
		Obliteration = 281238,
		BreathofSindragosa = 152279,
	}
	ids.Frost_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		ChillStreak = 305392,
--		LifeandDeath = 288855,
--		DarkSimulacrum = 77606,		
--		AntiMagicZone = 51052,
--		NectroticStrike = 223829,
--		Reanimation = 210128,
--		CadaverousPallor = 201995,
--		NecroticAura = 199642,		
--		DecomposingAura = 199720,
--		NecromancersBargain = 288848,
--		RaiseAbomination = 288853,
--		Transfusion = 288977,
--		Lichborne = 287081,		
	}
	ids.Frost_Form = {
		BreathofSindragosa = 152279,
	}
	ids.Frost_Buff = {
		ColdHeart = 281209,
		DarkSuccor = 101568,
		IcyTalons = 194879,
		InexorableAssault = 253595,
		KillingMachine = 51124,
		PillarofFrost = 51271,
		RemorselessWinter = 196770,
		Rime = 59052,
		UnholyStrength = 53365,
	}
	ids.Frost_Debuff = {
		FrostFever = 55095,
		RazorIce = 51714,
	}
	ids.Frost_PetAbility = {
		
	}

--Unholy
	ids.Unholy_Ability = {
		AntiMagicShell = 48707,
		Apocalypse = 275699,
		ArmyoftheDead = 42650,
		ChainsofIce = 45524,
		ControlUndead = 111673,
		DarkCommand = 56222,
		DarkTransformation = 63560,
		DeathandDecay = 43265,
		DeathCoil = 47541,
		DeathGate = 50977,
		DeathGrip = 49576,
		DeathStrike = 49998,
		DeathsAdvance = 48265,
		FesteringStrike = 85948,
		IceboundFortitude = 48792,
		MindFreeze = 47528,
		Outbreak = 77575,
		PathofFrost = 3714,
		RaiseAlly = 61999,
		RaiseDead = 46584,
		Runeforging = 53428,
		ScourgeStrike = 55090,
	}
	ids.Unholy_Passive = {
		DarkSuccor = 178819,
		MasteryDreadblade = 77515,
		OnaPaleHorse = 51986,
		RunicCorruption = 51462,
		SuddenDoom = 49530,
	}
	ids.Unholy_Talent = {
		--56
		InfectedClaws = 207272,		
		AllWillServe = 194916,		
		ClawingShadows = 207311,		
		--57		
		BurstingSores = 207264,		
		EbonFever = 207269,	
		UnholyBlight = 115989,
		--58		
		GripoftheDead = 273952,
		DeathsReach = 276079,
		Asphyxiate = 108194,		
		--60		
		PestilentPustules = 194917,		
		HarbingerofDoom = 276023,
		SoulReaper = 130736,		
		--75		
		SpellEater = 207321,
		WraithWalk = 212552,
		DeathPact = 48743,
		--90		
		Pestilence = 277234,
		Defile = 152280,
		Epidemic = 207317,
		--100
		ArmyoftheDamned = 276837,
		UnholyFrenzy = 207289,
		SummonGargoyle = 49206,
	}
	ids.Unholy_PvPTalent = {
		--Honorable Medallion
		Adaptation = 214027,
		Relentless = 196029,
		GladiatorsMedallion = 208683,
		--
		LifeandDeath = 288855,
		DarkSimulacrum = 77606,		
		AntiMagicZone = 51052,
		NectroticStrike = 223829,
		Reanimation = 210128,
		CadaverousPallor = 201995,
		NecroticAura = 199642,		
		DecomposingAura = 199720,
		NecromancersBargain = 288848,
		RaiseAbomination = 288853,
		Transfusion = 288977,
		Lichborne = 287081,
	}	
	ids.Unholy_Form = {
		
	}
	ids.Unholy_Buff = {
		DarkSuccor = 101568,
		DeathandDecay = 188290,
		SuddenDoom = 81340,
		SoulReaper = 215711,
		Transfusion = 288977,		
	}
	ids.Unholy_Debuff = {
		FesteringWound = 194310,
		NectroticStrike = 223929,		
		ScourgeofWorlds = 191748,
		SoulReaper = 130736,
		VirulentPlague = 191587,
	}
	ids.Unholy_PetAbility = {
		
	}
	
	
	ConRO.DeathKnight = {};
ConRO.DeathKnight.CheckTalents = function()
end
local ConRO_DeathKnight, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.DeathKnight.CheckTalents;
	if mode == 1 then
		self.Description = 'DeathKnight [Blood - Tank]';
		self.NextSpell = ConRO.DeathKnight.Blood;
		self.ToggleHealer();
	end;
	if mode == 2 then
		self.Description = 'DeathKnight [Frost - Melee]';
		self.NextSpell = ConRO.DeathKnight.Frost;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = 'DeathKnight	[Unholy - Melee]';
		self.NextSpell = ConRO.DeathKnight.Unholy;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;	
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.DeathKnight.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.DeathKnight.BloodDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.DeathKnight.FrostDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.DeathKnight.UnholyDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.DeathKnight.Blood(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local runes 											= dkrunes();
	local runicpower 										= UnitPower('player', Enum.PowerType.RunicPower);
	local runicpowerMax										= UnitPowerMax('player', Enum.PowerType.RunicPower);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities
	local dcommand											= ConRO:AbilityReady(ids.Blood_Ability.DarkCommand, timeShift);
	local dstrike 											= ConRO:AbilityReady(ids.Blood_Ability.DeathStrike, timeShift);
		local blsBuff											= ConRO:Aura(ids.Blood_Buff.BloodShield, timeShift + 2);
	local mfreeze 											= ConRO:AbilityReady(ids.Blood_Ability.MindFreeze, timeShift);
	local mr 												= ConRO:AbilityReady(ids.Blood_Ability.Marrowrend, timeShift);
		local bsBuff, bsCharges 								= ConRO:Aura(ids.Blood_Buff.BoneShield, timeShift + 3);
	local hs 												= ConRO:AbilityReady(ids.Blood_Ability.HeartStrike, timeShift);
	local dc 												= ConRO:AbilityReady(ids.Blood_Ability.DeathsCaress, timeShift);
	local bb												= ConRO:AbilityReady(ids.Blood_Ability.BloodBoil, timeShift);
		local bbCharges											= ConRO:SpellCharges(ids.Blood_Ability.BloodBoil);
		local bp 												= ConRO:TargetAura(ids.Blood_Debuff.BloodPlague, timeShift);
		local hemoBuff, hemoStacks 								= ConRO:Aura(ids.Blood_Buff.Hemostasis, timeShift);		
	local DnD 												= ConRO:AbilityReady(ids.Blood_Ability.DeathandDecay, timeShift);

	local bdrink											= ConRO:AbilityReady(ids.Blood_Talent.Blooddrinker, timeShift);
	local bstorm 											= ConRO:AbilityReady(ids.Blood_Talent.Bonestorm, timeShift);
	local rstrike 											= ConRO:AbilityReady(ids.Blood_Talent.RuneStrike, timeShift);	
		local rsCharges											= ConRO:SpellCharges(ids.Blood_Talent.RuneStrike);
		
	local csBuff 											= ConRO:Aura(ids.Blood_Buff.CrimsonScourge, timeShift);
	local drwBuff 											= ConRO:Aura(ids.Blood_Buff.DancingRuneWeapon, timeShift);	

	local bforb 											= ConRO:AbilityReady(ids.Blood_PvPTalent.BloodforBlood, timeShift);
		local bfbBuff			 								= ConRO:Aura(ids.Blood_Buff.BloodforBlood, timeShift);	
		
--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	local inMelee											= ConRO:IsSpellInRange(GetSpellInfo(ids.Blood_Ability.Marrowrend), 'target');
	local ispvp												= UnitIsPVP('player');
	local tarInMelee										= ConRO:Targets(ids.Blood_Ability.Marrowrend);
	
	local bsThreshold = 7;
		if ConRO:AzPowerChosen(ids.DeathKnight_AzTrait.BonesoftheDamned) then
			bsThreshold = 6;
		elseif drwBuff then
			bsThreshold = 4;
		end

		
--Indicators
	ConRO:AbilityInterrupt(ids.Blood_Ability.MindFreeze, mfreeze and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityTaunt(ids.Blood_Ability.DarkCommand, dcommand and (not ConRO:InRaid() or (ConRO:InRaid() and ConRO:TarYou())));
	
--Rotations	
	if bdrink and not inMelee then
		return ids.Blood_Talent.Blooddrinker;
	end
	
	if not bsBuff and mr then
		return ids.Blood_Ability.Marrowrend;
	end
	
	if bstorm and runicpower >= 100 and ConRO_AoEButton:IsVisible() then
		return ids.Blood_Talent.Bonestorm;
	end
	
	if dstrike and (not blsBuff or runicpower >= (runicpowerMax - 20) or hemoStacks == 5) then
		return ids.Blood_Ability.DeathStrike;
	end
	
	if bdrink and not drwBuff then
		return ids.Blood_Talent.Blooddrinker;
	end
	
	if bb and Close and (not bp or bbCharges == 2) then
		return ids.Blood_Ability.BloodBoil;
	elseif not bp and dc then
		return ids.Blood_Ability.DeathsCaress;
	end
	
	if DnD and csBuff and (ConRO_AoEButton:IsVisible() or tChosen[ids.Blood_Talent.RapidDecomposition]) then
		return ids.Blood_Ability.DeathandDecay;
	end
	
	if mr and bsCharges <= bsThreshold then
		return ids.Blood_Ability.Marrowrend;
	end
	
	if rstrike and rsCharges == 2 and runes <= 3 then
		return ids.Blood_Talent.RuneStrike;
	end
	
	if DnD and runes >= 3 and (tarInMelee >= 3 or ConRO_AoEButton:IsVisible()) then
		return ids.Blood_Ability.DeathandDecay;
	end
	
	if bforb and runes >= 3 and bsCharges >= 5 and not bfbBuff and playerPh >= 65 then
		return ids.Blood_PvPTalent.BloodforBlood;
	end
	
	if hs and runes >= 3 and bsCharges >= 5 then
		return ids.Blood_Ability.HeartStrike;
	end

	if bb and drwBuff then
		return ids.Blood_Ability.BloodBoil;
	end
	
	if DnD and csBuff then
		return ids.Blood_Ability.DeathandDecay;
	end
	
	if cons then
		return ids.Blood_Talent.Consumption;
	end
	
	if bb then
		return ids.Blood_Ability.BloodBoil;
	end

	if rstrike then
		return ids.Blood_Talent.RuneStrike;
	end
	
	return nil;
end

function ConRO.DeathKnight.BloodDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources

--Abilities
	local dstrike 											= ConRO:AbilityReady(ids.Blood_Ability.DeathStrike, timeShift);
	local ibf 												= ConRO:AbilityReady(ids.Blood_Ability.IceboundFortitude, timeShift);
	local vb 												= ConRO:AbilityReady(ids.Blood_Ability.VampiricBlood, timeShift);
	local drw 												= ConRO:AbilityReady(ids.Blood_Ability.DancingRuneWeapon, timeShift);
	
	local bdrink 											= ConRO:AbilityReady(ids.Blood_Talent.Blooddrinker, timeShift);

--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if vb and playerPh <= 50 then
		return ids.Blood_Ability.VampiricBlood;
	end
	
	if bdrink and playerPh <= 75 then
		return ids.Blood_Talent.Blooddrinker;
	end
	
	if dstrike and playerPh <= 30 then
		return ids.Blood_Ability.DeathStrike;
	end
	
	if drw then
		return ids.Blood_Ability.DancingRuneWeapon;
	end
	
	if ibf then
		return ids.Blood_Ability.IceboundFortitude;
	end
	
	return nil;
end

function ConRO.DeathKnight.Frost(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources
	local runicpower 										= UnitPower('player', Enum.PowerType.RunicPower);
	local rpMax 											= UnitPowerMax('player', Enum.PowerType.RunicPower);
	local runes 											= dkrunes();

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local dstrike 											= ConRO:AbilityReady(ids.Frost_Ability.DeathStrike, timeShift);
		local dsBuff 											= ConRO:Aura(ids.Frost_Buff.DarkSuccor, timeShift);
	local mfreeze 											= ConRO:AbilityReady(ids.Frost_Ability.MindFreeze, timeShift);
	local coice												= ConRO:AbilityReady(ids.Frost_Ability.ChainsofIce, timeShift);
		local chBuff, chCount									= ConRO:Form(ids.Frost_Buff.ColdHeart);	
	local hblast 											= ConRO:AbilityReady(ids.Frost_Ability.HowlingBlast, timeShift);
		local ffDebuff											= ConRO:TargetAura(ids.Frost_Debuff.FrostFever, timeShift);	
		local rimeBuff											= ConRO:Aura(ids.Frost_Buff.Rime, timeShift);
	local oblite 											= ConRO:AbilityReady(ids.Frost_Ability.Obliterate, timeShift);
		local kmBuff											= ConRO:Aura(ids.Frost_Buff.KillingMachine, timeShift);
	local fs 												= ConRO:AbilityReady(ids.Frost_Ability.FrostStrike, timeShift);
		local itBuff											= ConRO:Aura(ids.Frost_Buff.IcyTalons, timeShift + 1.5);
	local pillar, pCD										= ConRO:AbilityReady(ids.Frost_Ability.PillarofFrost, timeShift);
		local pfBuff, _, pfBDUR									= ConRO:Aura(ids.Frost_Buff.PillarofFrost, timeShift);
	local remorse, rwCD										= ConRO:AbilityReady(ids.Frost_Ability.RemorselessWinter, timeShift);	
	local emp 												= ConRO:AbilityReady(ids.Frost_Ability.EmpowerRuneWeapon, timeShift);

	local ga 												= ConRO:AbilityReady(ids.Frost_Talent.GlacialAdvance, timeShift);
	local bofs, bofsCD										= ConRO:AbilityReady(ids.Frost_Talent.BreathofSindragosa, timeShift);
		local bofsBuff											= ConRO:Form(ids.Frost_Form.BreathofSindragosa);
	local fscythe 											= ConRO:AbilityReady(ids.Frost_Talent.Frostscythe, timeShift);
	local how 												= ConRO:AbilityReady(ids.Frost_Talent.HornofWinter, timeShift);
	local ffury												= ConRO:AbilityReady(ids.Frost_Talent.FrostwyrmsFury, timeShift);
	
	local usBuff 											= ConRO:Aura(ids.Frost_Buff.UnholyStrength, timeShift);
	local riDebuff, riCount 								= ConRO:TargetAura(ids.Frost_Debuff.RazorIce, timeShift);

	local cstreak 											= ConRO:AbilityReady(ids.Frost_PvPTalent.ChillStreak, timeShift);
	
	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
		local azEDebuff_ConcentratedFlame						= ConRO:TargetAura(ids.AzEssenceDebuff.ConcentratedFlame, timeShift);	
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
	
--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	local playerPh 											= ConRO:PercentHealth('player');
	local tarInMelee										= ConRO:Targets(ids.Frost_Ability.DeathStrike);
	
--Indicators	
	ConRO:AbilityInterrupt(ids.Frost_Ability.MindFreeze, mfreeze and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Frost_Talent.FrostwyrmsFury, ffury);
	ConRO:AbilityBurst(ids.Frost_Talent.BreathofSindragosa, bofs and runes >= 3 and runicpower >= 60 and pillar and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Frost_Ability.EmpowerRuneWeapon, emp and runes >= 3 and runicpower >= 60 and pillar and ConRO_BurstButton:IsVisible());
	
	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 2) or ConRO_SingleButton:IsVisible()));
	
--Rotations
	if hblast and not incombat then
		return ids.Frost_Ability.HowlingBlast;
	end	

	if coice and chCount >= 10 and pfBuff and pfBDUR <= 2.5 and tChosen[ids.Frost_Talent.ColdHeart] then
		return ids.Frost_Ability.ChainsofIce;
	end
	
	if azEssence_BloodoftheEnemy and pfBDUR <= 8 then
		return ids.AzEssence.BloodoftheEnemy;
	end
	
	if cstreak and pfBDUR <= 11 then
		return ids.Frost_PvPTalent.ChillStreak;
	end
	
	if azEssence_MemoryofLucidDream and not emp and runicpower <= 30  then
		return ids.AzEssence.MemoryofLucidDream;
	end	
	
	if tChosen[ids.Frost_Talent.BreathofSindragosa] and bofsBuff then
		if pillar then
			return ids.Frost_Ability.PillarofFrost;
		end
		
		if oblite and runicpower <= 30 then
			return ids.Frost_Ability.Obliterate;
		end
		
		if remorse and tChosen[ids.Frost_Talent.GatheringStorm] then
			return ids.Frost_Ability.RemorselessWinter;
		end
		
		if hblast and (not ffDebuff or rimeBuff) then
			return ids.Frost_Ability.HowlingBlast;
		end
		
		if oblite and (runes <= 5 or runicpower <= 45) then
			return ids.Frost_Ability.Obliterate;
		end
		
		if remorse then
			return ids.Frost_Ability.RemorselessWinter;
		end
		
		if tChosen[ids.Frost_Talent.Frostscythe] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if fscythe and runicpower <= 73 then
				return ids.Frost_Talent.Frostscythe;
			end		
		else
			if oblite and runicpower <= 73 then
				return ids.Frost_Ability.Obliterate;
			end
		end
		
		if how and runes <= 4 and runicpower <= rpMax - 25 then
			return ids.Frost_Talent.HornofWinter;
		end
		
		return nil;	
		
	elseif tChosen[ids.Frost_Talent.BreathofSindragosa] and (bofs or bofsCD <= 10) and ConRO_FullButton:IsVisible() then
		if emp and runes >= 3 and runicpower >= 60 and pillar then
			return ids.Frost_Ability.EmpowerRuneWeapon;
		end
		
		if bofs and runes >= 3 and runicpower >= 60 and pillar then
			return ids.Frost_Talent.BreathofSindragosa;
		end
		
		if hblast and rimeBuff then
			return ids.Frost_Ability.HowlingBlast;
		end	
	
		if tChosen[ids.Frost_Talent.Frostscythe] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if fscythe and (runes >= 4 or runicpower <= 59) then
				return ids.Frost_Talent.Frostscythe;
			end
		else
			if oblite and (runes >= 5 or runicpower <= 59) then
				return ids.Frost_Ability.Obliterate;
			end
		end
		
	elseif tChosen[ids.Frost_Talent.Obliteration] and pfBuff then
		if tChosen[ids.Frost_Talent.Frostscythe] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if fscythe and kmBuff then
				return ids.Frost_Talent.Frostscythe;
			end
		else
			if oblite and kmBuff then
				return ids.Frost_Ability.Obliterate;
			end	
		end
		
		if hblast and rimeBuff and not kmBuff then
			return ids.Frost_Ability.HowlingBlast;
		end

		if ga and not kmBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Talent.GlacialAdvance;
		end	
		
		if fs and (not kmBuff or runicpower >= 73) then
			return ids.Frost_Ability.FrostStrike;
		end
		
		if how and runes <= 3 then
			return ids.Frost_Talent.HornofWinter;
		end
		
		if tChosen[ids.Frost_Talent.Frostscythe] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if fscythe then
				return ids.Frost_Talent.Frostscythe;
			end
		else
			if oblite then
				return ids.Frost_Ability.Obliterate;
			end
		end

		return nil;
	else
		if azEssence_ConcentratedFlame and not azEDebuff_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end

		if azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end

		if azEssence_GuardianofAzeroth then
			return ids.AzEssence.GuardianofAzeroth;
		end
		
		if emp and pillar and not tChosen[ids.Frost_Talent.BreathofSindragosa] and ConRO_FullButton:IsVisible() then
			return ids.Frost_Ability.EmpowerRuneWeapon;
		end
		
		if remorse and tChosen[ids.Frost_Talent.GatheringStorm] and (pillar or pCD >= 20) then
			return ids.Frost_Ability.RemorselessWinter;
		end
		
		if pillar and (not tChosen[ids.Frost_Talent.BreathofSindragosa] or (tChosen[ids.Frost_Talent.BreathofSindragosa] and bofsCD >= 40)) then
			return ids.Frost_Ability.PillarofFrost;
		end
		
		if tChosen[ids.Frost_Talent.GlacialAdvance] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			if ga and tChosen[ids.Frost_Talent.IcyTalons] and not itBuff then
				return ids.Frost_Talent.GlacialAdvance;
			end
		else
			if fs and tChosen[ids.Frost_Talent.IcyTalons] and not itBuff then
				return ids.Frost_Ability.FrostStrike;
			end
		end
		
		if ga and runicpower >= 73 and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Talent.GlacialAdvance;
		end
		
		if fs and tChosen[ids.Frost_Talent.GatheringStorm] and rwCD <= 3 and not remorse then
			return ids.Frost_Ability.FrostStrike;
		end
	
		if hblast and (not ffDebuff or rimeBuff) then
			return ids.Frost_Ability.HowlingBlast;
		end
		
		if oblite and runes >= 3 and tChosen[ids.Frost_Talent.FrozenPulse] then
			return ids.Frost_Ability.Obliterate;
		end

		if fscythe and kmBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Talent.Frostscythe;
		end
		
		if fs and runicpower >= 73 then
			return ids.Frost_Ability.FrostStrike;
		end

		if tChosen[ids.Frost_Talent.Frostscythe] then
			if fscythe and kmBuff then
				return ids.Frost_Talent.Frostscythe;
			end
		else
			if oblite and kmBuff and runes >= 4 and (not tChosen[ids.Frost_Talent.BreathofSindragosa] or (tChosen[ids.Frost_Talent.BreathofSindragosa] and bofsCD >= 9)) then
				return ids.Frost_Ability.Obliterate;
			end
		end
		
		if remorse and not tChosen[ids.Frost_Talent.GatheringStorm] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Ability.RemorselessWinter;
		end	
		
		if fscythe and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Talent.Frostscythe;
		end
		
		if oblite then
			return ids.Frost_Ability.Obliterate;
		end
		
		if ga and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
			return ids.Frost_Talent.GlacialAdvance;
		end	

		if how and runes <= 4 and runicpower <= rpMax - 25 and not tChosen[ids.Frost_Talent.Obliteration] and (not tChosen[ids.Frost_Talent.BreathofSindragosa] or (tChosen[ids.Frost_Talent.BreathofSindragosa] and bofsCD >= 40)) then
			return ids.Frost_Talent.HornofWinter;
		end
		
		if dstrike and dsBuff and playerPh <= 85 then
			return ids.Frost_Ability.DeathStrike;
		end		

		if fs and not tChosen[ids.Frost_Talent.IcyTalons] then
			return ids.Frost_Ability.FrostStrike;
		end
		
		return nil;
	end
end

function ConRO.DeathKnight.FrostDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources

--Abilities	
	local dstrike 											= ConRO:AbilityReady(ids.Frost_Ability.DeathStrike, timeShift);
	local ibf 												= ConRO:AbilityReady(ids.Frost_Ability.IceboundFortitude, timeShift);
	
	local dpact 											= ConRO:AbilityReady(ids.Frost_Talent.DeathPact, timeShift);	
	
	local dsBuff 											= ConRO:Aura(ids.Frost_Buff.DarkSuccor, timeShift);

--Conditions
	local playerPh 											= ConRO:PercentHealth('player');
	
--Rotations	
	if dstrike and dsBuff then
		return ids.Frost_Ability.DeathStrike;
	end

	if dpact and playerPh <= 50 then
		return ids.Frost_Talent.DeathPact;
	end
	
	if dstrike and playerPh <= 30 then
		return ids.Frost_Ability.DeathStrike;
	end
	
	if ibf then
		return ids.Frost_Ability.IceboundFortitude;
	end
	
	return nil;
end

function ConRO.DeathKnight.Unholy(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources	
	local runicpower 										= UnitPower('player', Enum.PowerType.RunicPower);
	local rpmax 											= UnitPowerMax('player', Enum.PowerType.RunicPower);
	local runes 											= dkrunes();

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	
--Abilities	
	local dstrike 											= ConRO:AbilityReady(ids.Unholy_Ability.DeathStrike, timeShift);
		local dsBuff 											= ConRO:Aura(ids.Unholy_Buff.DarkSuccor, timeShift);
	local apoc												= ConRO:AbilityReady(ids.Unholy_Ability.Apocalypse, timeShift);
	local DnD 												= ConRO:AbilityReady(ids.Unholy_Ability.DeathandDecay, timeShift);
		local dndBuff											= ConRO:Aura(ids.Unholy_Buff.DeathandDecay, timeShift);	
	local obreak 											= ConRO:AbilityReady(ids.Unholy_Ability.Outbreak, timeShift);
		local vpDebuff 											= ConRO:TargetAura(ids.Unholy_Debuff.VirulentPlague, timeShift + 4);
	local dstrike 											= ConRO:AbilityReady(ids.Unholy_Ability.DeathStrike, timeShift);
	local mfreeze 											= ConRO:AbilityReady(ids.Unholy_Ability.MindFreeze, timeShift);
	local darktrans 										= ConRO:AbilityReady(ids.Unholy_Ability.DarkTransformation, timeShift);
	local fstrike 											= ConRO:AbilityReady(ids.Unholy_Ability.FesteringStrike, timeShift);
		local fwDebuff, fwCount 								= ConRO:TargetAura(ids.Unholy_Debuff.FesteringWound, timeShift);
	local sstrike 											= ConRO:AbilityReady(ids.Unholy_Ability.ScourgeStrike, timeShift);
	local dcoil 											= ConRO:AbilityReady(ids.Unholy_Ability.DeathCoil, timeShift);
		local sdBuff 											= ConRO:Aura(ids.Unholy_Buff.SuddenDoom, timeShift);
	local aotd 												= ConRO:AbilityReady(ids.Unholy_Ability.ArmyoftheDead, timeShift);
	local rdead 											= ConRO:AbilityReady(ids.Unholy_Ability.RaiseDead, timeShift);
	
	local cshadows 											= ConRO:AbilityReady(ids.Unholy_Talent.ClawingShadows, timeShift);
	local epi	 											= ConRO:AbilityReady(ids.Unholy_Talent.Epidemic, timeShift);	
	local sreaper 											= ConRO:AbilityReady(ids.Unholy_Talent.SoulReaper, timeShift);
	local defile											= ConRO:AbilityReady(ids.Unholy_Talent.Defile, timeShift);
	local sgarg, sgCD										= ConRO:AbilityReady(ids.Unholy_Talent.SummonGargoyle, timeShift);
	local ufrenzy 											= ConRO:AbilityReady(ids.Unholy_Talent.UnholyFrenzy, timeShift);	

	local rabom 											= ConRO:AbilityReady(ids.Unholy_PvPTalent.RaiseAbomination, timeShift);
	local nstrike 											= ConRO:AbilityReady(ids.Unholy_PvPTalent.NectroticStrike, timeShift);
		local nsDebuff, _, nsDBDur								= ConRO:TargetAura(ids.Unholy_Debuff.NectroticStrike, timeShift);	
	local trans 											= ConRO:AbilityReady(ids.Unholy_PvPTalent.Transfusion, timeShift);
		local transBuff 										= ConRO:Aura(ids.Unholy_Buff.Transfusion, timeShift);
		
	local azEssence_BloodoftheEnemy							= ConRO:AbilityReady(ids.AzEssence.BloodoftheEnemy, timeShift);
	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
		local azEDebuff_ConcentratedFlame						= ConRO:TargetAura(ids.AzEssenceDebuff.ConcentratedFlame, timeShift);	
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);
	local azEssence_GuardianofAzeroth						= ConRO:AbilityReady(ids.AzEssence.GuardianofAzeroth, timeShift);
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);

--Conditions	
	local incombat 											= UnitAffectingCombat('player');
	local summoned 											= ConRO:CallPet();
	local assist 											= ConRO:PetAssist();
	local isGhoul											= IsSpellKnown(47468, true);
	local Close 											= CheckInteractDistance("target", 3);
	local ispvp												= UnitIsPVP('player');
	local tarInMelee										= ConRO:Targets(ids.Unholy_Ability.DeathStrike);
	
	local aotdUSE = ids.Unholy_Ability.ArmyoftheDead;
	
	if ispvp then
		if pvpChosen[ids.Unholy_PvPTalent.RaiseAbomination] then
			aotd = rabom;
			aotdUSE = ids.Unholy_PvPTalent.RaiseAbomination;
		end	
	end
	
--Indicators	
	ConRO:AbilityInterrupt(ids.Unholy_Ability.MindFreeze, mfreeze and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	
	ConRO:AbilityBurst(aotdUSE, incombat and aotd);
	ConRO:AbilityBurst(ids.Unholy_Ability.DarkTransformation, incombat and darktrans and isGhoul and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Unholy_Ability.Apocalypse, incombat and apoc and fwCount >= 4 and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Unholy_Talent.UnholyFrenzy, incombat and ufrenzy and fwCount <= 3 and runes >= 2 and ConRO_BurstButton:IsVisible());

	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee <= 2) or ConRO_SingleButton:IsVisible()));	
	ConRO:AbilityBurst(ids.AzEssence.GuardianofAzeroth, incombat and azEssence_GuardianofAzeroth and ConRO_BurstButton:IsVisible());
	
--Warnings
	if not summoned and rdead then
		UIErrorsFrame:AddMessage("Call your pet!!!", 1.0, 0.0, 0.0, 53, 5);
		return ids.Unholy_Ability.RaiseDead;
	end

	if not assist and summoned then
		UIErrorsFrame:AddMessage("Pet is NOT attacking!!!", 1.0, 0.0, 0.0, 53, 5);
	end

--Rotations
	if sgarg and runicpower >= 100 and sdBuff then
		return ids.Unholy_Talent.SummonGargoyle;
	end

	if tChosen[ids.Unholy_Talent.Epidemic] and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then	
		if epi and ((not apoc and tChosen[ids.Unholy_Talent.ArmyoftheDamned]) or (sgCD >= 150 and tChosen[ids.Unholy_Talent.SummonGargoyle])) then
			return ids.Unholy_Talent.Epidemic;
		end
	else
		if dcoil and ((not apoc and tChosen[ids.Unholy_Talent.ArmyoftheDamned]) or (sgCD >= 150 and tChosen[ids.Unholy_Talent.SummonGargoyle])) then
			return ids.Unholy_Ability.DeathCoil;
		end
	end
	
	if azEssence_ConcentratedFlame and not azEDebuff_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end	

	if obreak and not vpDebuff then
		return ids.Unholy_Ability.Outbreak;
	end	
	
	if sreaper and runes <= 1 then
		return ids.Unholy_Talent.SoulReaper;
	end
	
	if ufrenzy and fwCount <= 3 and runes >= 2 and ConRO_FullButton:IsVisible() then
		return ids.Unholy_Talent.UnholyFrenzy;
	end	
	
	if darktrans and isGhoul and ConRO_FullButton:IsVisible() then
		return ids.Unholy_Ability.DarkTransformation;
	end	

	if apoc and fwCount >= 4 and ConRO_FullButton:IsVisible() then
		return ids.Unholy_Ability.Apocalypse;
	end
	
	if azEssence_GuardianofAzeroth and ConRO_FullButton:IsVisible() then
		return ids.AzEssence.GuardianofAzeroth;
	end	
	
	if azEssence_BloodoftheEnemy and ((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) then
		return ids.AzEssence.BloodoftheEnemy;
	end	

	if epi and runicpower >= 80 and not (tChosen[ids.Unholy_Talent.SummonGargoyle] and (sgarg or sgCD <= 10)) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Unholy_Talent.Epidemic;
	end
	
	if dcoil and (runicpower >= 80 or sdBuff) and not (tChosen[ids.Unholy_Talent.SummonGargoyle] and (sgarg or sgCD <= 10)) and ((ConRO_AutoButton:IsVisible() and tarInMelee == 1) or ConRO_SingleButton:IsVisible()) then
		return ids.Unholy_Ability.DeathCoil;
	end
	
	if tChosen[ids.Unholy_Talent.Defile] then
		if defile then
			return ids.Unholy_Talent.Defile;
		end
	else
		if DnD and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible() or tChosen[ids.Unholy_Talent.Pestilence]) then
			return ids.Unholy_Ability.DeathandDecay;
		end
	end

	if azEssence_BloodoftheEnemy and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.AzEssence.BloodoftheEnemy;
	end		
	
	if ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) and dndBuff then 
		if cshadows and tChosen[ids.Unholy_Talent.ClawingShadows] and fwCount >= 1 then
			return ids.Unholy_Talent.ClawingShadows;
		elseif sstrike and not tChosen[ids.Unholy_Talent.ClawingShadows] and fwCount >= 1 then
			return ids.Unholy_Ability.ScourgeStrike;
		end
	end
	
	if epi and not (tChosen[ids.Unholy_Talent.SummonGargoyle] and (sgarg or sgCD <= 10)) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Unholy_Talent.Epidemic;
	end
	
	if dcoil and (runicpower >= 80 or sdBuff) and not (tChosen[ids.Unholy_Talent.SummonGargoyle] and (sgarg or sgCD <= 10)) and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Unholy_Ability.DeathCoil;
	end	
	
	if fstrike and runes >= 2 and fwCount <= 3 then
		return ids.Unholy_Ability.FesteringStrike;
	end
	
	if nstrike and pvpChosen[ids.Unholy_PvPTalent.NectroticStrike] and fwCount >= 1 and (not nsDebuff or (nsDebuff and nsDBDur <= 4)) then
		return ids.Unholy_PvPTalent.NectroticStrike;
	end	
	
	if cshadows and tChosen[ids.Unholy_Talent.ClawingShadows] and fwCount >= 1 then
		return ids.Unholy_Talent.ClawingShadows;
	elseif sstrike and not tChosen[ids.Unholy_Talent.ClawingShadows] and fwCount >= 1 then
		return ids.Unholy_Ability.ScourgeStrike;
	end
	
	if trans and runicpower <= 50 then
		return ids.Unholy_PvPTalent.Transfusion;
	end

	if dstrike and dsBuff or transBuff then
		return ids.Unholy_Ability.DeathStrike;
	end

	if azEssence_FocusedAzeriteBeam and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
		return ids.AzEssence.FocusedAzeriteBeam;
	end

	if dcoil and not (tChosen[ids.Unholy_Talent.SummonGargoyle] and (sgarg or sgCD <= 10)) then
		return ids.Unholy_Ability.DeathCoil;
	end
		
	return nil;
end

function ConRO.DeathKnight.UnholyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Resources

--Abilities	
	local dstrike 											= ConRO:AbilityReady(ids.Unholy_Ability.DeathStrike, timeShift);
		local dsBuff 											= ConRO:Aura(ids.Unholy_Buff.DarkSuccor, timeShift);
	local ibf 												= ConRO:AbilityReady(ids.Unholy_Ability.IceboundFortitude, timeShift);
	
	local dpact 											= ConRO:AbilityReady(ids.Unholy_Talent.DeathPact, timeShift);	
	


--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');

--Rotations	
	if dstrike and dsBuff then
		return ids.Unholy_Ability.DeathStrike;
	end

	if dpact and playerPh <= 50 then
		return ids.Unholy_Talent.DeathPact;
	end
	
	if dstrike and playerPh <= 30 then
		return ids.Unholy_Ability.DeathStrike;
	end
	
	if ibf then
		return ids.Unholy_Ability.IceboundFortitude;
	end
		
	return nil;
end

function dkrunes()
	local runes = {
		rune1 = select(3, GetRuneCooldown(1));
		rune2 = select(3, GetRuneCooldown(2));
		rune3 = select(3, GetRuneCooldown(3));
		rune4 = select(3, GetRuneCooldown(4));
		rune5 = select(3, GetRuneCooldown(5));
		rune6 = select(3, GetRuneCooldown(6));
	}
	
	local totalrunes = 0;
		for k, v in pairs(runes) do
			if v then
				totalrunes = totalrunes + 1;
			end
		end
	return totalrunes;
end