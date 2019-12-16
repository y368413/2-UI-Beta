if select(2, UnitClass("player")) ~= "PRIEST" then return end
local ConRO_Priest, ids = ...;

--Generic
	ids.Racial = {
		ArcaneTorrent = 232633,
		ArcanePulse = 260364,
	}
	ids.Glyph = {
		Lightspawn = 254224,	
		Sha = 132603,
		Voidling = 254232,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Priest_AzTrait = {
		DeathThroes = 278659,
		ThoughtHarvester = 288340,
	}
	ids.Priest_AzTraitBuff = {
		ThoughtHarvester = 288343,
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

--Discipline
	ids.Disc_Ability = {
		DesperatePrayer = 19236,
		DispelMagic = 528,
		Fade = 586,
		HolyNova = 132157,
		LeapofFaith = 73325,
		Levitate = 1706,
		MassDispel = 32375,
		MassResurrection = 212036,
		MindControl = 605,
		MindVision = 2096,
		PainSuppression = 33206,
		Penance = 47540,
		Plea = 200829,
		PowerWordBarrier = 62618,
		PowerWordFortitude = 21562,
		PowerWordRadiance = 194509,
		PowerWordShield = 17,
		PsychicScream = 8122,
		Purify = 527,
		Rapture = 47536,
		Resurrection = 2006,
		ShackleUndead = 9484,
		ShadowMend = 186263,
		ShadowWordPain = 589,
		Shadowfiend = 34433,
		Smite = 585,
	}
	ids.Disc_Passive = {
		Atonement = 81749,
		FocusedWill = 45243,
		MasteryGrace = 271534,
		PoweroftheDarkSide = 198068,
	}
	ids.Disc_Talent = {
		--15
		Castigation = 193134,		
		TwistofFate = 265259,
		Schism = 214621,
		--30
		BodyandSoul = 64129,		
		Masochism = 193063,		
		AngelicFeather = 121536,
		--45
		ShieldDiscipline = 197045,		
		Mindbender = 123040,		
		PowerWordSolace = 129250,
		--60
		PsychicVoice = 196704,
		DominantMind = 205367,
		ShiningForce = 204263,
		--75
		SinsoftheMany = 280391,
		Contrition = 197419,
		ShadowCovenant = 204065,
		--90
		PurgetheWicked = 204197,
		DivineStar = 110744,
		Halo = 120517,
		--100
		Lenience = 238063,
		LuminousBarrier = 271466,
		Evangelism = 246287,
	}
	ids.Disc_Form = {
	
	}
	ids.Disc_Buff = {
		Atonement = 194384,
		PowerWordFortitude = 21562,
		PoweroftheDarkSide = 198069,
	}
	ids.Disc_Debuff = {
		PurgetheWicked = 204213,
		ShadowWordPain = 589,
		WeakenedSoul = 6788,		
	}
	ids.Disc_PetAbility = {
			
	}
		
--Holy
	ids.Holy_Ability = {
		DesperatePrayer = 19236,
		DispelMagic = 528,
		DivineHymn = 64843,
		Fade = 586,
		FlashHeal = 2061,
		GuardianSpirit = 47788,
		Heal = 2060,
		HolyFire = 14914,
		HolyNova = 132157,
		HolyWordChastise = 88625,
		HolyWordSanctify = 34861,
		HolyWordSerenity = 2050,
		LeapofFaith = 73325,
		Levitate = 1706,
		MassDispel = 32375,
		MassResurrection = 212036,
		MindControl = 605,
		MindVision = 2096,
		PowerWordFortitude = 21562,
		PrayerofHealing = 596,
		PrayerofMending = 33076,
		PsychicScream = 8122,
		Purify = 527,
		Renew = 139,
		Resurrection = 2006,
		ShackleUndead = 9484,
		Smite = 585,
		SymbolofHope = 64901,
	}
	ids.Holy_Passive = {
		FocusedWill = 45243,
		MasteryEchoofLight = 77485,
		SpiritofRedemption = 20711,
	}
	ids.Holy_Talent = {
		--15
		Enlightenment = 193155,		
		TrailofLight = 200128,		
		EnduringRenewal = 200153,
		--30
		AngelsMercy = 238100,
		Perseverance = 235189,	
		AngelicFeather = 121536,
		--45
		CosmicRipple = 238136,
		GuardianAngel = 200209,
		Afterlife = 196707,
		--60
		PsychicVoice = 196704,
		Censure = 200199,
		ShiningForce = 204263,
		--75
		SurgeofLight = 109186,
		BindingHeal = 32546,
		CircleofHealing = 204883,
		--90
		Benediction = 193157,
		DivineStar = 110744,
		Halo = 120517,
		--100
		LightoftheNaaru = 196985,
		Apotheosis = 200183,
		HolyWordSalvation = 265202,
	}
	ids.Holy_Form = {
	
	}
	ids.Holy_Buff = {
		PowerWordFortitude = 21562,
	}
	ids.Holy_Debuff = {

	}
	ids.Holy_PetAbility = {
		
	}

--Shadow
	ids.Shad_Ability = {
		DispelMagic = 528,
		Dispersion = 47585,
		Fade = 586,
		LeapofFaith = 73325,
		Levitate = 1706,
		MassDispel = 32375,
		MindBlast = 8092,
		MindControl = 605,
		MindFlay = 15407,
		MindSear = 48045,
		MindVision = 2096,
		PowerWordFortitude = 21562,
		PowerWordShield = 17,
		PsychicScream = 8122,
		PurifyDisease = 213634,
		Resurrection = 2006,
		ShackleUndead = 9484,
		ShadowMend = 186263,
		ShadowWordPain = 589,
		Shadowfiend = 34433,
		Shadowform = 232698,
		Silence = 15487,
		VampiricEmbrace = 15286,
		VampiricTouch = 34914,
		VoidBolt = 205448,
		VoidEruption = 228260,
	}
	ids.Shad_Passive = {
		Hallucinations = 280752,
		MasteryMadness = 77486,
		ShadowyApparitions = 78203,
		VoidBolt = 228266,
		VoidForm = 228264,
	}
	ids.Shad_Talent = {
		--15
		FortressoftheMind = 193195,
		ShadowyInsight = 162452,
		ShadowWordVoid = 205351,
		--30
		BodyandSoul = 64129,
		Sanlayn = 199855,
		Intangibility = 288733,
		--45
		TwistofFate = 109142,
		Misery = 238558,
		DarkVoid = 263346,
		--60
		LastWord = 263716,
		MindBomb = 205369,
		PsychicHorror = 64044,
		--75
		AuspiciousSpirits = 155271,
		ShadowWordDeath = 32379,
		ShadowCrash = 205385,
		--90
		LingeringInsanity = 199849,
		Mindbender = 200174,
		VoidTorrent = 263165,
		--100
		LegacyoftheVoid = 193225,
		DarkAscension = 280711,
		SurrendertoMadness = 193223,
	}
	ids.Shad_Form = {
		Shadowform = 232698,
		Voidform = 194249,
		SurrendertoMadness = 193223,
	}
	ids.Shad_Buff = {
		PowerWordFortitude = 21562,
		PowerWordShield = 17,
		ShadowyInsight = 162452,
		VampiricEmbrace = 15286,
	}
	ids.Shad_Debuff = {
		ShadowWordPain = 589,
		VampiricTouch = 34914,
		WeakenedSoul = 6788,
	}
	ids.Shad_PetAbility = {
		
	}
	
	ConRO.Priest = {};
ConRO.Priest.CheckTalents = function()
end
local ConRO_Priest, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Priest.CheckTalents;
	if mode == 1 then
		self.Description = "Priest [Discipline - Healer]";
		self.NextSpell = ConRO.Priest.Discipline;
		self.ToggleHealer();
	end;
	if mode == 2 then
		self.Description = "Priest [Holy - Healer]";
		self.NextSpell = ConRO.Priest.Holy;
		self.ToggleHealer();
	end;
	if mode == 3 then
		self.Description = "Priest [Shadow - Caster]";
		self.NextSpell = ConRO.Priest.Shadow;
		self.ToggleDamage();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Priest.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Priest.DisciplineDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Priest.HolyDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Priest.ShadowDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Priest.Discipline(_, timeShift, currentSpell, gcd, tChosen)
--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities	
	local dispel 											= ConRO:AbilityReady(ids.Disc_Ability.DispelMagic, timeShift);
	local penance 											= ConRO:AbilityReady(ids.Disc_Ability.Penance, timeShift);
	local swp 												= ConRO:AbilityReady(ids.Disc_Ability.ShadowWordPain, timeShift);
		local swpDebuff 										= ConRO:TargetAura(ids.Disc_Debuff.ShadowWordPain, timeShift + 3);
		local potdsBuff	 										= ConRO:Aura(ids.Disc_Buff.PoweroftheDarkSide, timeShift);		
	local smi 												= ConRO:AbilityReady(ids.Disc_Ability.Smite, timeShift);
	local shadowF											= ConRO:AbilityReady(ids.Disc_Ability.Shadowfiend, timeShift);
	local ps 												= ConRO:AbilityReady(ids.Disc_Ability.PainSuppression, timeShift);
	local pwshield											= ConRO:AbilityReady(ids.Disc_Ability.PowerWordShield, timeShift);
		local wsDebuff 											= ConRO:UnitAura(ids.Disc_Debuff.WeakenedSoul, timeShift, 'player', 'HARMFUL');	
	local pwb 												= ConRO:AbilityReady(ids.Disc_Ability.PowerWordBarrier, timeShift);
	local pwradiance										= ConRO:AbilityReady(ids.Disc_Ability.PowerWordRadiance, timeShift);
		local pwrCharges 										= ConRO:SpellCharges(ids.Disc_Ability.PowerWordRadiance);
		local aBuff		 										= ConRO:Aura(ids.Disc_Buff.Atonement, timeShift);
	local pwf 												= ConRO:AbilityReady(ids.Disc_Ability.PowerWordFortitude, timeShift);
	local afeather											= ConRO:AbilityReady(ids.Disc_Talent.AngelicFeather, timeShift);
		
	local ptw 												= ConRO:AbilityReady(ids.Disc_Talent.PurgetheWicked, timeShift);
		local ptwDebuff											= ConRO:TargetAura(ids.Disc_Debuff.PurgetheWicked, timeShift + 3);
	local mbender 											= ConRO:AbilityReady(ids.Disc_Talent.Mindbender, timeShift);
	local sch 												= ConRO:AbilityReady(ids.Disc_Talent.Schism, timeShift);
	local evan 												= ConRO:AbilityReady(ids.Disc_Talent.Evangelism, timeShift);	
	local pwsolace											= ConRO:AbilityReady(ids.Disc_Talent.PowerWordSolace, timeShift);
	local dstar 											= ConRO:AbilityReady(ids.Disc_Talent.DivineStar, timeShift);

	local sfiendID											= select(7, GetSpellInfo("Shadowfiend"));
	
--Conditions	
	local isEnemy 											= ConRO:TarHostile();
	local moving 											= ConRO:PlayerSpeed();
	local Close 											= CheckInteractDistance("target", 3);
	
--Indicators
	ConRO:AbilityPurge(ids.Disc_Ability.DispelMagic, dispel and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Disc_Talent.AngelicFeather, afeather);
	
	ConRO:AbilityBurst(ids.Disc_Talent.Mindbender, mbender and isEnemy);
	ConRO:AbilityBurst(ids.Glyph.Sha, sfiendID == ids.Glyph.Sha and shadowF and isEnemy and not tChosen[ids.Disc_Talent.Mindbender]);
	ConRO:AbilityBurst(ids.Glyph.Voidling, sfiendID == ids.Glyph.Voidling and shadowF and isEnemy and not tChosen[ids.Disc_Talent.Mindbender]);
	ConRO:AbilityBurst(ids.Glyph.Lightspawn, sfiendID == ids.Glyph.Lightspawn and shadowF and isEnemy and not tChosen[ids.Disc_Talent.Mindbender]);
	ConRO:AbilityBurst(ids.Disc_Ability.Shadowfiend, sfiendID == ids.Shad_Ability.Shadowfiend and shadowF and isEnemy and not tChosen[ids.Disc_Talent.Mindbender]);
	
	ConRO:AbilityBurst(ids.Disc_Talent.Evangelism, evan and aBuff and pwrCharges <= 1);
	
	ConRO:AbilityRaidBuffs(ids.Disc_Ability.PowerWordFortitude, pwf and not ConRO:RaidBuff(ids.Disc_Buff.PowerWordFortitude));
	ConRO:AbilityRaidBuffs(ids.Disc_Ability.PowerWordShield, pwshield and not ConRO:OneBuff(ids.Disc_Buff.Atonement));
	
--Warnings	
	
--Rotations	
	if isEnemy then
		if ptw and not ptwDebuff then
			return ids.Disc_Talent.PurgetheWicked;
		elseif not tChosen[ids.Disc_Talent.PurgetheWicked] and swp and not swpDebuff then
			return ids.Disc_Ability.ShadowWordPain;
		end
		
		if sch and currentSpell ~= ids.Disc_Talent.Schism then
			return ids.Disc_Talent.Schism;
		end
		
		if pwsolace then
			return ids.Disc_Talent.PowerWordSolace;
		end
		
		if penance and (moving or potdsBuff) and currentSpell ~= ids.Disc_Ability.Penance then
			return ids.Disc_Ability.Penance;
		end
		
		if dstar then
			return ids.Disc_Talent.DivineStar;
		end
	
		if smi then
			return ids.Disc_Ability.Smite;
		end
	end
	
return nil;
end

function ConRO.Priest.DisciplineDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities	
	local pains 											= ConRO:AbilityReady(ids.Disc_Ability.PainSuppression, timeShift);
	local dprayer											= ConRO:AbilityReady(ids.Disc_Ability.DesperatePrayer, timeShift);
	
--Conditions	
	local isEnemy 											= ConRO:TarHostile();
	local playerPh 											= ConRO:PercentHealth('player');
	local targetPh 											= ConRO:PercentHealth('target');
	
--Rotations		
	if pains and not isEnemy and targetPh <= 25 then
		return ids.Disc_Ability.PainSuppression;
	end
	
	if dprayer and playerPh <= 50 then
		return ids.Holy_Ability.DesperatePrayer;
	end
	
	return nil;
end

function ConRO.Priest.Holy(_, timeShift, currentSpell, gcd, tChosen)
--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities	
	local dispel 											= ConRO:AbilityReady(ids.Holy_Ability.DispelMagic, timeShift);
	local smi												= ConRO:AbilityReady(ids.Holy_Ability.Smite, timeShift);
	local hf												= ConRO:AbilityReady(ids.Holy_Ability.HolyFire, timeShift);
	local hwc 												= ConRO:AbilityReady(ids.Holy_Ability.HolyWordChastise, timeShift);
	local divineh 											= ConRO:AbilityReady(ids.Holy_Ability.DivineHymn, timeShift);
	local pwf 												= ConRO:AbilityReady(ids.Holy_Ability.PowerWordFortitude, timeShift);
	local afeather											= ConRO:AbilityReady(ids.Holy_Talent.AngelicFeather, timeShift);
	
	local apoth 											= ConRO:AbilityReady(ids.Holy_Talent.Apotheosis, timeShift);

--Conditions	
	local isEnemy 											= ConRO:TarHostile()
	local Close 											= CheckInteractDistance("target", 3);
	
--Indicators	
	ConRO:AbilityPurge(ids.Holy_Ability.DispelMagic, dispel and ConRO:Purgable())
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Holy_Talent.AngelicFeather, afeather);
	
	ConRO:AbilityRaidBuffs(ids.Holy_Ability.PowerWordFortitude, pwf and not ConRO:RaidBuff(ids.Holy_Buff.PowerWordFortitude));
	
	ConRO:AbilityBurst(ids.Holy_Ability.DivineHymn, divineh)
	ConRO:AbilityBurst(ids.Holy_Talent.Apotheosis, apoth)	

--Warnings	
	
--Rotations	
	if isEnemy then
		if hf then
			return ids.Holy_Ability.HolyFire;
		end
		
		if hwc then
			return ids.Holy_Ability.HolyWordChastise;
		end
		
		if smi then
			return ids.Holy_Ability.Smite;
		end
	end	
	
return nil;
end

function ConRO.Priest.HolyDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities		
	local gspirit											= ConRO:AbilityReady(ids.Holy_Ability.GuardianSpirit, timeShift);
	local dprayer											= ConRO:AbilityReady(ids.Holy_Ability.DesperatePrayer, timeShift);
	
--Conditions	
	local playerPh 											= ConRO:PercentHealth('player');
	local targetPh 											= ConRO:PercentHealth('target');
	
--Rotations
	if gspirit and targetPh <= 25 then
		return ids.Holy_Ability.GuardianSpirit;
	end
	
	if dprayer and playerPh <= 50 then
		return ids.Holy_Ability.DesperatePrayer;
	end
	
return nil;
end

function ConRO.Priest.Shadow(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local insa 												= UnitPower('player', Enum.PowerType.Insanity);

--Racials
	local arctorrent										= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities
	local dispRDY											= ConRO:AbilityReady(ids.Shad_Ability.Dispersion, timeShift);
	local silence 											= ConRO:AbilityReady(ids.Shad_Ability.Silence, timeShift);
	local dispel 											= ConRO:AbilityReady(ids.Shad_Ability.DispelMagic, timeShift);
	local ve 												= ConRO:AbilityReady(ids.Shad_Ability.VoidEruption, timeShift);
		local vbCD												= ConRO:Cooldown(ids.Shad_Ability.VoidBolt, timeShift);
	local shadowF 											= ConRO:AbilityReady(ids.Shad_Ability.Shadowfiend, timeShift + 1);
	local mb 												= ConRO:AbilityReady(ids.Shad_Ability.MindBlast, timeShift + 0.5);
	local vtouch											= ConRO:AbilityReady(ids.Shad_Ability.VampiricTouch, timeShift);
		local vtDebuff, _, vtDur 								= ConRO:TargetAura(ids.Shad_Debuff.VampiricTouch, timeShift + 4);
	local swpain 											= ConRO:AbilityReady(ids.Shad_Ability.ShadowWordPain, timeShift);
		local swp, _, swpDur 									= ConRO:TargetAura(ids.Shad_Debuff.ShadowWordPain, timeShift + 3);
	local mf												= ConRO:AbilityReady(ids.Shad_Ability.MindFlay, timeShift);
	local msear												= ConRO:AbilityReady(ids.Shad_Ability.MindSear, timeShift);
		local thBuff											= ConRO:Aura(ids.Priest_AzTraitBuff.ThoughtHarvester, timeShift);
	local pwf 												= ConRO:AbilityReady(ids.Shad_Ability.PowerWordFortitude, timeShift);
	local pws 												= ConRO:AbilityReady(ids.Shad_Ability.PowerWordShield, timeShift);
		local wsDebuff 											= ConRO:UnitAura(ids.Shad_Debuff.WeakenedSoul, timeShift, 'player', 'HARMFUL');
		
	local mBender 											= ConRO:AbilityReady(ids.Shad_Talent.Mindbender, timeShift);		
	local swd												= ConRO:AbilityReady(ids.Shad_Talent.ShadowWordDeath, timeShift + 0.5);
		local swdCharges, swdMax 								= ConRO:SpellCharges(ids.Shad_Talent.ShadowWordDeath);
	local stm 												= ConRO:AbilityReady(ids.Shad_Talent.SurrendertoMadness, timeShift);
	local swv												= ConRO:AbilityReady(ids.Shad_Talent.ShadowWordVoid, timeShift);
		local swvCharges 										= ConRO:SpellCharges(ids.Shad_Talent.ShadowWordVoid);
	local scrash 											= ConRO:AbilityReady(ids.Shad_Talent.ShadowCrash, timeShift);
		local si 												= ConRO:Aura(ids.Shad_Buff.ShadowyInsight, timeShift);
	local voidT												= ConRO:AbilityReady(ids.Shad_Talent.VoidTorrent, timeShift);
	local dvoid												= ConRO:AbilityReady(ids.Shad_Talent.DarkVoid, timeShift);
	local dascension, daCD									= ConRO:AbilityReady(ids.Shad_Talent.DarkAscension, timeShift);
		
	local sf 												= ConRO:Form(ids.Shad_Form.Shadowform);
	local vf, vCharges 										= ConRO:Form(ids.Shad_Form.Voidform);
	local stmbuff 											= ConRO:Form(ids.Shad_Form.SurrendertoMadness);

	local azChosen_ThoughtHarvester							= ConRO:AzPowerChosen(ids.Priest_AzTrait.ThoughtHarvester);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	local azEssence_FocusedAzeriteBeam						= ConRO:AbilityReady(ids.AzEssence.FocusedAzeriteBeam, timeShift);	
	local azEssence_MemoryofLucidDream						= ConRO:AbilityReady(ids.AzEssence.MemoryofLucidDream, timeShift);
	
--Conditions
	local targetPh 											= ConRO:PercentHealth('target');
	local canDeath 											= targetPh < 20;
	local canVoidExplode									= insa >= 90;
	local incombat 											= UnitAffectingCombat('player');
	local Close 											= CheckInteractDistance("target", 3);
	local moving 											= ConRO:PlayerSpeed();
	local sfiendID											= select(7, GetSpellInfo("Shadowfiend"));

	if currentSpell == ids.Shad_Talent.ShadowWordVoid then
		swvCharges = swvCharges - 1;
	end
--Indicators	
	ConRO:AbilityInterrupt(ids.Shad_Ability.Silence, silence and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Shad_Ability.DispelMagic, dispel and ConRO:Purgable());
	ConRO:AbilityPurge(ids.Racial.ArcaneTorrent, arctorrent and Close and ConRO:Purgable());
	ConRO:AbilityMovement(ids.Shad_Ability.PowerWordShield, pws and not wsDebuff and tChosen[ids.Shad_Talent.BodyandSoul]);
	
	ConRO:AbilityRaidBuffs(ids.Shad_Ability.PowerWordFortitude, pwf and not ConRO:RaidBuff(ids.Shad_Buff.PowerWordFortitude));
	
	ConRO:AbilityBurst(ids.Shad_Talent.SurrendertoMadness, stm and vf);
	ConRO:AbilityBurst(ids.Shad_Ability.VoidEruption, ve and not vf and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Shad_Talent.DarkAscension, dascension and ((not vf and not canVoidExplode) or (vf and insa <= 10)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.AzEssence.MemoryofLucidDream, azEssence_MemoryofLucidDream and vf and vCharges >= 20 and insa <= 50 and ConRO_BurstButton:IsVisible());
	
	ConRO:AbilityBurst(ids.Glyph.Sha, sfiendID == ids.Glyph.Sha and shadowF and not tChosen[ids.Shad_Talent.Mindbender] and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Glyph.Voidling, sfiendID == ids.Glyph.Voidling and shadowF and not tChosen[ids.Shad_Talent.Mindbender] and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Glyph.Lightspawn, sfiendID == ids.Glyph.Lightspawn and shadowF and not tChosen[ids.Shad_Talent.Mindbender] and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Shad_Ability.Shadowfiend, sfiendID == ids.Shad_Ability.Shadowfiend and shadowF and not tChosen[ids.Shad_Talent.Mindbender] and ConRO_BurstButton:IsVisible());

	ConRO:AbilityBurst(ids.AzEssence.FocusedAzeriteBeam, azEssence_FocusedAzeriteBeam and not vf and CheckInteractDistance("target", 1) and ConRO_SingleButton:IsVisible());
	
--Warnings	
	
--Rotations	
	if not sf and not vf then
		return ids.Shad_Ability.Shadowform;
	end
	
	if not incombat then		
		if tChosen[ids.Shad_Talent.ShadowWordVoid] then
			if swv and currentSpell ~= ids.Shad_Talent.ShadowWordVoid then
				return ids.Shad_Talent.ShadowWordVoid;
			end
		else
			if mb and currentSpell ~= ids.Shad_Ability.MindBlast then
				return ids.Shad_Ability.MindBlast;
			end
		end
	end

	if dascension and ((not vf and not canVoidExplode) or (vf and insa <= 10)) and ConRO_FullButton:IsVisible() then
		return ids.Shad_Talent.DarkAscension;
	end
	
	if azEssence_MemoryofLucidDream and vf and vCharges >= 20 and insa <= 60 and ConRO_FullButton:IsVisible() then
		return ids.AzEssence.MemoryofLucidDream;
	end
	
	if ConRO_AoEButton:IsVisible() then
		if select(8, UnitChannelInfo("player")) == ids.Shad_Ability.MindSear and azChosen_ThoughtHarvester then -- Do not break cast
			return ids.Shad_Ability.MindSear;
		end	
	
		if msear and thBuff and azChosen_ThoughtHarvester then
			return ids.Shad_Ability.MindSear;
		end 
		
		if (ve or vbCD <= .5) and vf then
			return ids.Shad_Ability.VoidBolt;
		end

		if tChosen[ids.Shad_Talent.Mindbender] then
			if mBender then
				return ids.Shad_Talent.Mindbender;
			end
		else
			if shadowF and ConRO_FullButton:IsVisible() then
				if sfiendID == ids.Glyph.Sha then
					return ids.Glyph.Sha;				
				elseif sfiendID == ids.Glyph.Voidling then
					return ids.Glyph.Voidling;		
				elseif sfiendID == ids.Glyph.Lightspawn then
					return ids.Glyph.Lightspawn;					
				else
					return ids.Shad_Ability.Shadowfiend;
				end
			end
		end		
		
		if ve and not vf and ConRO_FullButton:IsVisible() then
			return ids.Shad_Ability.VoidEruption;
		end
		
		if vtouch and (not vtDebuff or (tChosen[ids.Shad_Talent.Misery] and not swp)) and currentSpell ~= ids.Shad_Ability.VampiricTouch then
			return ids.Shad_Ability.VampiricTouch;
		end

		if dvoid and not vf and currentSpell ~= ids.Shad_Talent.DarkVoid then
			return ids.Shad_Talent.DarkVoid;
		end
		
		if swpain and ((not swp and not tChosen[ids.Shad_Talent.Misery]) or (moving and swpDur <= 5)) then
			return ids.Shad_Ability.ShadowWordPain;
		end
		
		if azEssence_FocusedAzeriteBeam and CheckInteractDistance("target", 1) then
			return ids.AzEssence.FocusedAzeriteBeam;
		end

		if scrash then
			return ids.Shad_Talent.ShadowCrash;
		end
		
		if msear then
			return ids.Shad_Ability.MindSear;
		end	
	else
		if ve and not vf and (ConRO_FullButton:IsVisible() or (ConRO_BurstButton:IsVisible() and currentSpell == ids.Shad_Ability.VoidEruption)) then
			return ids.Shad_Ability.VoidEruption;
		end
		
		if swd and canDeath and not vf then
			return ids.Shad_Talent.ShadowWordDeath;
		end
		
		if swd and canDeath and swdCharges >= 2 and vf then
			return ids.Shad_Talent.ShadowWordDeath;
		end		
		
		if (ve or vbCD <= .5) and vf then
			return ids.Shad_Ability.VoidBolt;
		end
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end

		if select(8, UnitChannelInfo("player")) == ids.Shad_Ability.MindSear and azChosen_ThoughtHarvester then -- Do not break cast
			return ids.Shad_Ability.MindSear;
		end
		
		if tChosen[ids.Shad_Talent.Mindbender] then
			if mBender then
				return ids.Shad_Talent.Mindbender;
			end
		else
			if shadowF and ConRO_FullButton:IsVisible() then
				if sfiendID == ids.Glyph.Sha then
					return ids.Glyph.Sha;				
				elseif sfiendID == ids.Glyph.Voidling then
					return ids.Glyph.Voidling;		
				elseif sfiendID == ids.Glyph.Lightspawn then
					return ids.Glyph.Lightspawn;					
				else
					return ids.Shad_Ability.Shadowfiend;
				end
			end
		end
		
		if msear and thBuff and azChosen_ThoughtHarvester then
			return ids.Shad_Ability.MindSear;
		end 
		
		if vtouch and (not vtDebuff or (tChosen[ids.Shad_Talent.Misery] and not swp)) and currentSpell ~= ids.Shad_Ability.VampiricTouch then
			return ids.Shad_Ability.VampiricTouch;
		end

		if dvoid and not vf and currentSpell ~= ids.Shad_Talent.DarkVoid then
			return ids.Shad_Talent.DarkVoid;
		end
		
		if swpain and ((not swp and not tChosen[ids.Shad_Talent.Misery]) or (moving and swpDur <= 5)) then
			return ids.Shad_Ability.ShadowWordPain;
		end
		
		if tChosen[ids.Shad_Talent.ShadowWordVoid] then
			if swv and swvCharges >= 1 then
				return ids.Shad_Talent.ShadowWordVoid;
			end
		else
			if mb and currentSpell ~= ids.Shad_Ability.MindBlast then
				return ids.Shad_Ability.MindBlast;
			end
		end
	
		if scrash then
			return ids.Shad_Talent.ShadowCrash;
		end

		if voidT and vf then
			return ids.Shad_Talent.VoidTorrent;
		end
		
		if swd and canDeath then
			return ids.Shad_Talent.ShadowWordDeath;
		end
		
		if mf then
			return ids.Shad_Ability.MindFlay;
		end
	end
return nil;
end

function ConRO.Priest.ShadowDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local insa 												= UnitPower('player', Enum.PowerType.Insanity);

--Abilities
	local disp 												= ConRO:AbilityReady(ids.Shad_Ability.Dispersion, timeShift);
	local pws 												= ConRO:AbilityReady(ids.Shad_Ability.PowerWordShield, timeShift);
		local wsDebuff 											= ConRO:UnitAura(ids.Shad_Debuff.WeakenedSoul, timeShift, 'player', 'HARMFUL');
		local pwsBuff 											= ConRO:Aura(ids.Shad_Buff.PowerWordShield, timeShift);		
	local vampE 											= ConRO:AbilityReady(ids.Shad_Ability.VampiricEmbrace, timeShift);
	
--Conditions

--Indicators	

--Warnings	
	
--Rotations
	local playerPh = ConRO:PercentHealth('player');
	
	if vampE and playerPh <= 50 then
		return ids.Shad_Ability.VampiricEmbrace;
	end
	
	if disp and playerPh <= 25 then
		return ids.Shad_Ability.Dispersion;
	end
	
	if pws and not wsDebuff and not pwsBuff then
		return ids.Shad_Ability.PowerWordShield;
	end	
return nil;
end