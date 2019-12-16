if select(2, UnitClass("player")) ~= "SHAMAN" then return end
local ConRO_Shaman, ids = ...;

--Generic
	ids.Racial = {
		Berserking = 26297,
		GiftoftheNaaru = 59548,
	}
	ids.AzTrait = {

	}
	ids.AzTraitBuff = {

	}
	ids.Shaman_AzTrait = {

	}
	ids.Shaman_AzTraitBuff = {

	}
	ids.AzEssence = {
		ConcentratedFlame = 295373,
		MemoryofLucidDream = 298357,
		TheUnboundForce = 298452,
		WorldveinResonance = 295186,	
	}
	
--Elemental
	ids.Ele_Ability = {
		AncestralSpirit = 2008,
		AstralRecall = 556,
		AstralShift = 108271,
		CapacitorTotem = 192058,
		ChainLightning = 188443,
		CleanseSpirit = 51886,
		EarthElemental = 198103,
		EarthShock = 8042,
		EarthbindTotem = 2484,
		Earthquake = 61882,
		FarSight = 6196,
		FireElemental = 198067,
		FlameShock = 188389,
		FrostShock = 196840,
		GhostWolf = 2645,
		HealingSurge = 8004,
		Heroism = 32182,
		Hex = 51514,
		HaxRaptor = 210873,
		LavaBurst = 51505,
		LightningBolt = 188196,
		Purge = 370,
		Thunderstorm = 51490,
		TremorTotem = 8143,
		WaterWalking = 546,
		WindShear = 57994,
	}
	ids.Ele_Passive = {
		ElementalFury = 60188,
		LavaSurge = 77756,
		MasteryElementalOverload = 168534,
		Reincarnation = 20608,
	}
	ids.Ele_Talent = {
		--15
		EarthRage = 170374,
		EchooftheElements = 108283,
		ElementalBlast = 117014,
		--30
		Aftershock = 273221,
		CalltheThunder = 260897,
		TotemMastery = 210643,
		--45
		SpiritWolf = 260878,
		EarthShield = 974,
		StaticCharge = 265046,
		--60
		MasteroftheElements = 16166,
		StormElemental = 192249,
		LiquidMagmaTotem = 192222,
		--75
		NaturesGuardian = 30884,
		AncestralGuidance = 108281,
		WindRushTotem = 192077,
		--90
		SurgeofPower = 262303,
		PrimalElementalist = 117013,
		Icefury = 210714,
		--100
		UnlimitedPower = 260895,
		Stormkeeper = 191634,
		Ascendance = 114050,
			LavaBeam = 114074,
	}
	ids.Ele_Form = {
		TailwindTotem = 210659,
		WindGust = 263806,
	}
	ids.Ele_Buff = {
		Ascendance = 114050,
		EarthShield = 974,
		Icefury = 210714,
		LavaSurge = 77762,
		MasteroftheElements = 260734,
		Stormkeeper = 191634,
		SurgeofPower = 285514,
	}
	ids.Ele_Debuff = {
		FlameShock = 188389,
	}
	ids.Ele_PetAbility = {

	}
		
--Enhancement
	ids.Enh_Ability = {
		AncestralSpirit = 2008,
		AstralRecall = 556,
		AstralShift = 108271,
		CapacitorTotem = 192058,
		CleanseSpirit = 51886,
		CrashLightning = 187874,
		EarthElemental = 198103,
		EarthbindTotem = 2484,
		FarSight = 6196,
		FeralSpirit = 51533,
		Flametongue = 193796,
		Frostbrand = 196834,
		GhostWolf = 2645,
		HealingSurge = 188070,
		Heroism = 32182,
		Hex = 51514,
		HaxRaptor = 210873,
		LavaLash = 60103,
		LightningBolt = 187837,
		Purge = 370,
		Rockbiter = 193786,
		SpiritWalk = 58875,
		Stormstrike = 17364,
		TremorTotem = 8143,
		WaterWalking = 546,
		WindShear = 57994,
	}
	ids.Enh_Passive = {
		MaelstromWeapon = 187880,
		MasteryEnhancedElements = 77223,
		Reincarnation = 20608,
		Stormbringer = 201845,
		Windfury = 33757,
	}
	ids.Enh_Talent = {
		--15
		Boulderfist = 246035,
		HotHand = 201900,
		LightningShield = 192106,
		--30
		Landslide = 197992,
		ForcefulWinds = 262647,
		TotemMastery = 262395,
		--45
		SpiritWolf = 260878,
		EarthShield = 974,
		StaticCharge = 265046,
		--60
		SearingAssault = 192087,
		Hailstorm = 210853,
		Overcharge = 210727,
		--75
		NaturesGuardian = 30884,
		FeralLunge = 196884,
		WindRushTotem = 192077,
		--90
		CrashingStorm = 192246,
		FuryofAir = 197211,
		Sundering = 197214,
		--100
		ElementalSpirits = 262624,
		EarthenSpike = 188089,
		Ascendance = 114051,
			Windstrike = 115356,
	}
	ids.Enh_Form = {
		FuryofAir = 197211,
		TailwindTotem = 262400,
	}
	ids.Enh_Buff = {
		Ascendance = 114051,
		CrashLightning = 187878,
		EarthShield = 974,
		Flametongue = 194084,
		Frostbrand = 196834,
		ForcefulWinds = 262652,
		GatheringStorms = 198300,
		Landslide = 202004,
		LightningShield = 192106,
		HotHand = 215785,
		Stormbringer = 201846,
	}
	ids.Enh_Debuff = {
		EarthenSpike = 188089,
		SearingAssault = 268429,
	}
	ids.Enh_PetAbility = {

	}

--Restoration
	ids.Resto_Ability = {
		AncestralSpirit = 2008,
		AncestralVision = 212048,
		AstralRecall = 556,
		AstralShift = 108271,
		CapacitorTotem = 192058,
		ChainHeal = 1064,
		ChainLightning = 421,
		EarthElemental = 198103,
		EarthbindTotem = 2484,
		FarSight = 6196,
		FlameShock = 188838,
		GhostWolf = 2645,
		HealingRain = 73920,
		HealingStreamTotem = 5394,
		HealingSurge = 8004,
		HealingTideTotem = 108280,
		HealingWave = 77472,
		Heroism = 32182,
		Hex = 51514,
		HaxRaptor = 210873,
		LavaBurst = 51505,
		LightningBolt = 403,
		Purge = 370,
		PurifySpirit = 77130,
		Riptide = 61295,
		SpiritLinkTotem = 98008,
		SpiritwalkersGrace = 79206,
		TremorTotem = 8143,
		WaterWalking = 546,
		WindShear = 57994,
	}
	ids.Resto_Passive = {
		LavaSurge = 77756,
		MasteryDeepHealing = 77226,
		Reincarnation = 20608,
		Resurgence = 16196,
		TidalWaves = 51564,
	}
	ids.Resto_Talent = {
		--15
		Torrent = 200072,
		Undulation = 200071,
		UnleashLife = 73685,
		--30
		EchooftheElements = 108283,
		Deluge = 200076,
		EarthShield = 974,
		--45
		SpiritWolf = 260878,
		EarthgrabTotem = 51485,
		StaticCharge = 265046,
		--60
		AncestralVigor = 207401,
		EarthenWallTotem = 198838,
		AncestralProtectionTotem = 207399,
		--75
		NaturesGuardian = 30884,
		GracefulSpirit = 192088,
		WindRushTotem = 192077,
		--90
		FlashFlood = 280614,
		Downpour = 207778,
		CloudburstTotem = 157153,
		--100
		HighTIde = 157154,
		Wellspring = 197995,
		Ascendance = 114052,
	}
	ids.Resto_Form = {
	
	}
	ids.Resto_Buff = {
		EarthShield = 974,
		LavaSurge = 77762,
 	}
	ids.Resto_Debuff = {
		FlameShock = 188838,
	}
	ids.Resto_PetAbility = {

	}
	
	ConRO.Shaman = {};
ConRO.Shaman.CheckTalents = function()
end
local ConRO_Shaman, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Shaman.CheckTalents;
	if mode == 1 then
		self.Description = 'Shaman Module [Elemental - Caster]';
		self.NextSpell = ConRO.Shaman.Elemental;
		self.ToggleDamage();
	end;
	if mode == 2 then
		self.Description = 'Shaman Module [Enhancement - Melee]';
		self.NextSpell = ConRO.Shaman.Enhancement;
		self.ToggleDamage();
	end;
	if mode == 3 then
		self.Description = 'Shaman Module [Restoration - Healer]';
		self.NextSpell = ConRO.Shaman.Restoration;
		self.ToggleHealer();
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 1;
	self.ModuleOnEnable = ConRO.Shaman.CheckTalents;
	if mode == 1 then
		self.NextDef = ConRO.Shaman.ElementalDef;
	end;
	if mode == 2 then
		self.NextDef = ConRO.Shaman.EnhancementDef;
	end;
	if mode == 3 then
		self.NextDef = ConRO.Shaman.RestorationDef;
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Shaman.Elemental(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local mael 												= UnitPower('player', Enum.PowerType.Maelstorm);
	local maelMax 											= UnitPowerMax('player', Enum.PowerType.Maelstorm);

--Abilities	
	local purge 											= ConRO:AbilityReady(ids.Ele_Ability.Purge, timeShift);
	local lbolt												= ConRO:AbilityReady(ids.Ele_Ability.LightningBolt, timeShift);
	local clight											= ConRO:AbilityReady(ids.Ele_Ability.ChainLightning, timeShift);
	local wshear 											= ConRO:AbilityReady(ids.Ele_Ability.WindShear, timeShift);
	local felem, feCD, feMCD								= ConRO:AbilityReady(ids.Ele_Ability.FireElemental, timeShift);
	local eelem, eeCD, eeMCD								= ConRO:AbilityReady(ids.Ele_Ability.EarthElemental, timeShift);
	local lburst											= ConRO:AbilityReady(ids.Ele_Ability.LavaBurst, timeShift);
		local lavaCharges										= ConRO:SpellCharges(ids.Ele_Ability.LavaBurst);
		local lsurgeBuff 										= ConRO:Aura(ids.Ele_Buff.LavaSurge, timeShift);
		local moteBuff 											= ConRO:Aura(ids.Ele_Buff.MasteroftheElements, timeShift);
	local equake											= ConRO:AbilityReady(ids.Ele_Ability.Earthquake, timeShift);
	local eshock 											= ConRO:AbilityReady(ids.Ele_Ability.EarthShock, timeShift);
		local sopBuff											= ConRO:Aura(ids.Ele_Buff.SurgeofPower, timeShift);
	local fshock											= ConRO:AbilityReady(ids.Ele_Ability.FlameShock, timeShift);
		local fsDebuff 											= ConRO:TargetAura(ids.Ele_Debuff.FlameShock, timeShift + 6);
	local frshock											= ConRO:AbilityReady(ids.Ele_Ability.FrostShock, timeShift);
	
	local ifury 											= ConRO:AbilityReady(ids.Ele_Talent.Icefury, timeShift);
		local ifBuff 											= ConRO:Aura(ids.Ele_Buff.Icefury, timeShift);	
	local ascen, ascenCD 									= ConRO:AbilityReady(ids.Ele_Talent.Ascendance, timeShift);
		local ascenBuff 										= ConRO:Aura(ids.Ele_Buff.Ascendance, timeShift);
		local lbeam 											= ConRO:AbilityReady(ids.Ele_Talent.LavaBeam, timeShift);
	local elemblast 										= ConRO:AbilityReady(ids.Ele_Talent.ElementalBlast, timeShift);
	local lmtotem 											= ConRO:AbilityReady(ids.Ele_Talent.LiquidMagmaTotem, timeShift);
	local totemmast 										= ConRO:AbilityReady(ids.Ele_Talent.TotemMastery, timeShift);
		local tmBuff 											= ConRO:Form(ids.Ele_Form.TailwindTotem);
	local skeeper 											= ConRO:AbilityReady(ids.Ele_Talent.Stormkeeper, timeShift);
		local skBuff 											= ConRO:Aura(ids.Ele_Buff.Stormkeeper, timeShift);
	local selem, seCD, seMCD								= ConRO:AbilityReady(ids.Ele_Talent.StormElemental, timeShift);
		local wgBuff, wgBCount									= ConRO:Form(ids.Ele_Form.WindGust);
	local eshield											= ConRO:AbilityReady(ids.Ele_Talent.EarthShield, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	
--Conditions
	local incombat 											= UnitAffectingCombat('player');
	local moving 											= ConRO:PlayerSpeed();
	local elemOut											= IsPetActive();
	
	local elemName = UnitName("pet");
	local selemOut = false;
		if elemOut and (elemName == "Greater Storm Elemental" or elemName == "Primal Storm Elemental") then
			selemOut = true;
		end
	
	if currentSpell == ids.Ele_Ability.LavaBurst then
		mael = mael + 10;
		if lavaCharges > 0 then
			lavaCharges = lavaCharges - 1;
		end
	elseif currentSpell == ids.Ele_Ability.LightningBolt then
		mael = mael + 8;
	elseif currentSpell == ids.Ele_Talent.Icefury then
		mael = mael + 15;
	end

	if tChosen[ids.Ele_Talent.EchooftheElements] and lburst then
		lavaCharges = 1;
	end

--Indicators	
	ConRO:AbilityInterrupt(ids.Ele_Ability.WindShear, wshear and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Ele_Ability.Purge, purge and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Ele_Ability.FireElemental, felem and ConRO_SingleButton:IsVisible() and (not tChosen[ids.Ele_Talent.PrimalElementalist] or (tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ele_Talent.StormElemental, selem and (not tChosen[ids.Ele_Talent.PrimalElementalist] or (tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut)) and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Ele_Ability.EarthElemental, eelem and not (selem or felem) and (not tChosen[ids.Ele_Talent.PrimalElementalist] or (tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut)));
	ConRO:AbilityBurst(ids.Ele_Talent.Ascendance, ascen and ConRO_SingleButton:IsVisible() and ConRO_BurstButton:IsVisible());

	ConRO:AbilityRaidBuffs(ids.Ele_Talent.EarthShield, eshield and not ConRO:OneBuff(ids.Ele_Buff.EarthShield));
	ConRO:AbilityRaidBuffs(ids.Ele_Talent.TotemMastery, totemmast and not tmBuff);
	
--Rotations	
	if not incombat then
		if skeeper and currentSpell ~= ids.Ele_Talent.Stormkeeper then
			return ids.Ele_Talent.Stormkeeper;
		end	
		
		if ConRO_FullButton:IsVisible() and (not tChosen[ids.Ele_Talent.PrimalElementalist] or (tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut)) then
			if tChosen[ids.Ele_Talent.StormElemental] then
				if selem then
					return ids.Ele_Talent.StormElemental;
				end
			else
				if felem then
					return ids.Ele_Ability.FireElemental;
				end
			end
		end
		
		if fshock and not fsDebuff and (currentSpell == ids.Ele_Talent.ElementalBlast or currentSpell == ids.Ele_Ability.LavaBurst or currentSpell == ids.Ele_Ability.LightningBolt) then
			return ids.Ele_Ability.FlameShock;
		end	

		if elemblast then
			return ids.Ele_Talent.ElementalBlast;
		end
		
		if lburst then
			return ids.Ele_Ability.LavaBurst;
		end
		
		if lbolt then
			return ids.Ele_Ability.LightningBolt;
		end
	
	elseif ascenBuff then
		if eshock and mael > 90 then
			return ids.Ele_Ability.EarthShock;
		end
		
		if elemblast and currentSpell ~= ids.Ele_Talent.ElementalBlast then
			return ids.Ele_Talent.ElementalBlast;
		end
		
		if lburst then
			return ids.Ele_Ability.LavaBurst;
		end
			
	elseif moving then
		if fshock and not fsDebuff then
			return ids.Ele_Ability.FlameShock;
		end	
	
		if lburst and lsurgeBuff then
			return ids.Ele_Ability.LavaBurst;
		end		
	
		if skBuff then
			if ConRO_AoEButton:IsVisible() then
				if clight then
					return ids.Ele_Ability.ChainLightning;
				end
			else
				if lbolt then
					return ids.Ele_Ability.LightningBolt;
				end	
			end
		end
		
		if frshock then
			return ids.Ele_Ability.FrostShock;
		end
	
	elseif ConRO_AoEButton:IsVisible() then
		if totemmast and not tmBuff then
			return ids.Ele_Talent.TotemMastery;
		end	

		if skeeper and currentSpell ~= ids.Ele_Talent.Stormkeeper then
			return ids.Ele_Talent.Stormkeeper;
		end	
		
		if lmtotem then
			return ids.Ele_Talent.LiquidMagmaTotem;
		end
		
		if fshock and not fsDebuff then
			return ids.Ele_Ability.FlameShock;
		end	

		if equake and mael >= 60 then
			return ids.Ele_Ability.Earthquake;
		end	

		if elemblast and currentSpell ~= ids.Ele_Talent.ElementalBlast then
			return ids.Ele_Talent.ElementalBlast;
		end
		
		if selem and tChosen[ids.Ele_Talent.StormElemental] and tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut and ConRO_FullButton:IsVisible() then
			return ids.Ele_Talent.StormElemental;
		end
		
		if clight then
			return ids.Ele_Ability.ChainLightning;
		end
		
	else
		if totemmast and not tmBuff then
			return ids.Ele_Talent.TotemMastery;
		end		
	
		if fshock and not fsDebuff and not sopBuff and wgBCount <= 13 then
			return ids.Ele_Ability.FlameShock;
		end
	
		if ConRO_FullButton:IsVisible() and (not tChosen[ids.Ele_Talent.PrimalElementalist] or (tChosen[ids.Ele_Talent.PrimalElementalist] and not elemOut)) then
			if tChosen[ids.Ele_Talent.StormElemental] then
				if selem then
					return ids.Ele_Talent.StormElemental;
				end
			else
				if felem then
					return ids.Ele_Ability.FireElemental;
				end
			end
		end

		if eshock and mael > 60 and moteBuff then
			return ids.Ele_Ability.EarthShock;
		end
			
		if elemblast and not moteBuff and not selemOut and currentSpell ~= ids.Ele_Talent.ElementalBlast then
			return ids.Ele_Talent.ElementalBlast;
		end	
		
		if azEssence_ConcentratedFlame then
			return ids.AzEssence.ConcentratedFlame;
		end
		
		if lmtotem then
			return ids.Ele_Talent.LiquidMagmaTotem;
		end
		
		if skeeper and (not tChosen[ids.Ele_Talent.SurgeofPower] or (tChosen[ids.Ele_Talent.SurgeofPower] and sopBuff )) and currentSpell ~= ids.Ele_Talent.Stormkeeper then
			return ids.Ele_Talent.Stormkeeper;
		end
		
		if lbolt and sopBuff or (skBuff and (not tChosen[ids.Ele_Talent.SurgeofPower] and moteBuff)) then
			return ids.Ele_Ability.LightningBolt;
		end		
		
		if eshock and mael >= 90 then
			return ids.Ele_Ability.EarthShock;
		end
				
		if lbolt and selemOut or wgBuff or (seCD > seMCD - 10) then
			return ids.Ele_Ability.LightningBolt;
		end

		if frshock and ifBuff and moteBuff then
			return ids.Ele_Ability.FrostShock;
		end
		
		if lburst and lavaCharges >= 1 then
			return ids.Ele_Ability.LavaBurst;
		end
		
		if ascen and ConRO_SingleButton:IsVisible() and ConRO_FullButton:IsVisible() then
			return ids.Ele_Talent.Ascendance;
		end

		if eshock and mael >= 60 then
			return ids.Ele_Ability.EarthShock;
		end
		
		if frshock and ifBuff then
			return ids.Ele_Ability.FrostShock;
		end
		
		if ifury then
			return ids.Ele_Talent.Icefury;
		end
	
		if lbolt then
			return ids.Ele_Ability.LightningBolt;
		end
	end
end

function ConRO.Shaman.ElementalDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities
	local astral											 = ConRO:AbilityReady(ids.Ele_Ability.AstralShift, timeShift);

--Rotations	
	if astral then
		return ids.Ele_Ability.AstralShift;
	end
return nil;
end

function ConRO.Shaman.Enhancement(_, timeShift, currentSpell, gcd, tChosen)
--Resources
	local mael 												= UnitPower('player', Enum.PowerType.Maelstorm);
	local maelMax 											= UnitPowerMax('player', Enum.PowerType.Maelstorm);
	
--Abilities
	local purge 											= ConRO:AbilityReady(ids.Enh_Ability.Purge, timeShift);
	local ss 												= ConRO:AbilityReady(ids.Enh_Ability.Stormstrike, timeShift);
		local sbBuff 											= ConRO:Aura(ids.Enh_Buff.Stormbringer, timeShift);
	local fs, fsCD 											= ConRO:AbilityReady(ids.Enh_Ability.FeralSpirit, timeShift);
	local cl 												= ConRO:AbilityReady(ids.Enh_Ability.CrashLightning, timeShift);
		local clBuff 											= ConRO:Aura(ids.Enh_Buff.CrashLightning, timeShift);
	local ft 												= ConRO:AbilityReady(ids.Enh_Ability.Flametongue, timeShift);
		local ftBuff, _, ftBDUR									= ConRO:Aura(ids.Enh_Buff.Flametongue, timeShift);
		local hhBuff 											= ConRO:Aura(ids.Enh_Buff.Hothand, timeShift);
		local saBuff											= ConRO:TargetAura(ids.Enh_Debuff.SearingAssault, timeShift);
	local wshear 											= ConRO:AbilityReady(ids.Enh_Ability.WindShear, timeShift);
	local fb 												= ConRO:AbilityReady(ids.Enh_Ability.Frostbrand, timeShift);
		local fbBuff, _, fbBDUR									= ConRO:Aura(ids.Enh_Buff.Frostbrand, timeShift);
	local lb 												= ConRO:AbilityReady(ids.Enh_Ability.LightningBolt, timeShift);
	local ll 												= ConRO:AbilityReady(ids.Enh_Ability.LavaLash, timeShift);
	local rb 												= ConRO:AbilityReady(ids.Enh_Ability.Rockbiter, timeShift);
		local rbCharges, _, rbCCD								= ConRO:SpellCharges(ids.Enh_Ability.Rockbiter, timeShift);		
		local lsBuff 											= ConRO:Aura(ids.Enh_Buff.Landslide, timeShift);

	local ascen 											= ConRO:AbilityReady(ids.Enh_Talent.Ascendance, timeShift);
		local asBuff											= ConRO:Aura(ids.Enh_Buff.Ascendance, timeShift);
		local wstrike 											= ConRO:AbilityReady(ids.Enh_Talent.Windstrike, timeShift);
	local foa 												= ConRO:AbilityReady(ids.Enh_Talent.FuryofAir, timeShift);
		local foaBuff 											= ConRO:Form(ids.Enh_Form.FuryofAir);
	local espike 											= ConRO:AbilityReady(ids.Enh_Talent.EarthenSpike, timeShift);
	local totemmast 										= ConRO:AbilityReady(ids.Enh_Talent.TotemMastery, timeShift);
		local tmBuff 											= ConRO:Form(ids.Enh_Form.TailwindTotem);
	local sunder 											= ConRO:AbilityReady(ids.Enh_Talent.Sundering, timeShift);	
	local eshield											= ConRO:AbilityReady(ids.Enh_Talent.EarthShield, timeShift);
	local lshield											= ConRO:AbilityReady(ids.Enh_Talent.LightningShield, timeShift);
		local lsBuff											= ConRO:Aura(ids.Enh_Buff.LightningShield, timeShift);

	local azEssence_ConcentratedFlame						= ConRO:AbilityReady(ids.AzEssence.ConcentratedFlame, timeShift);
	
--Conditions	
	local inMelee 											= ConRO:IsSpellInRange(GetSpellInfo(ids.Enh_Ability.LavaLash), 'target')
	local tarInMelee										= ConRO:Targets(ids.Enh_Ability.LavaLash);
	
--Indicators	
	ConRO:AbilityInterrupt(ids.Enh_Ability.WindShear, wshear and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Enh_Ability.Purge, purge and ConRO:Purgable());
	
	ConRO:AbilityBurst(ids.Enh_Talent.Ascendance, ascen and not ss and ConRO_BurstButton:IsVisible());
	ConRO:AbilityBurst(ids.Enh_Ability.FeralSpirit, fs and ftBuff and ConRO_BurstButton:IsVisible());

	ConRO:AbilityRaidBuffs(ids.Enh_Talent.EarthShield, eshield and not ConRO:OneBuff(ids.Enh_Buff.EarthShield));
	ConRO:AbilityRaidBuffs(ids.Enh_Talent.LightningShield, lshield and not lsBuff);
	ConRO:AbilityRaidBuffs(ids.Enh_Talent.TotemMastery, totemmast and not tmBuff);
	
--Rotations
	if foa and not foaBuff and mael >= 20 then
		return ids.Enh_Talent.FuryofAir;
	end

	if totemmast and not tmBuff then
		return ids.Enh_Talent.TotemMastery;
	end

	if cl and not clBuff and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Enh_Ability.CrashLightning;
	end

	if azEssence_ConcentratedFlame then
		return ids.AzEssence.ConcentratedFlame;
	end
		
	if ss and asBuff then
		return ids.Enh_Talent.Windstrike;
	end

	if ft and not ftBuff then
		return ids.Enh_Ability.Flametongue;
	end
	
	if fs and ConRO_FullButton:IsVisible() then
		return ids.Enh_Ability.FeralSpirit;
	end

	if espike then
		return ids.Enh_Talent.EarthenSpike;
	end

	if fb and tChosen[ids.Enh_Talent.Hailstorm] and not fbBuff then
		return ids.Enh_Ability.Frostbrand;
	end	

	if ascen and not ss and ConRO_FullButton:IsVisible() then
		return ids.Enh_Talent.Ascendance;
	end
	
	if ss and sbBuff and not asBuff	then
		return ids.Enh_Ability.Stormstrike;
	end

	if ll and hhBuff then
		return ids.Enh_Ability.LavaLash;
	end

	if ss and not asBuff then
		return ids.Enh_Ability.Stormstrike;
	end

	if cl and ((ConRO_AutoButton:IsVisible() and tarInMelee >= 3) or ConRO_AoEButton:IsVisible()) then
		return ids.Enh_Ability.CrashLightning;
	end
	
	if lb and ((mael >= 40 and not tChosen[ids.Enh_Talent.FuryofAir]) or (mael >= 50 and tChosen[ids.Enh_Talent.FuryofAir])) and tChosen[ids.Enh_Talent.Overcharge] then
		return ids.Enh_Ability.LightningBolt;
	end

	if ft and tChosen[ids.Enh_Talent.SearingAssault] and not saDebuff then
		return ids.Enh_Ability.Flametongue;
	end

	if sunder then
		return ids.Enh_Talent.Sundering;
	end	
	
	if rb and mael <= 70 and (rbCharges >= 2 or (rbCharges >= 1 and rbCCD < 2)) then
		return ids.Enh_Ability.Rockbiter;
	end

	if ft and ftBDUR < 4.5 then
		return ids.Enh_Ability.Flametongue;
	end
	
	if fb and tChosen[ids.Enh_Talent.Hailstorm] and fbBDUR < 4.5 then
		return ids.Enh_Ability.Frostbrand;
	end	
	
	if cl and (tChosen[ids.Enh_Talent.CrashingStorm] or (ConRO_AutoButton:IsVisible() and tarInMelee >= 2) or ConRO_AoEButton:IsVisible()) then
		return ids.Enh_Ability.CrashLightning;
	end	
	
	if ll and ((mael >= 40 and not tChosen[ids.Enh_Talent.FuryofAir]) or (mael >= 50 and tChosen[ids.Enh_Talent.FuryofAir])) then
		return ids.Enh_Ability.LavaLash;
	end	
	
	if rb then
		return ids.Enh_Ability.Rockbiter;
	end	
	
	if ft then
		return ids.Enh_Ability.Flametongue;
	end
	
	return nil;
end

function ConRO.Shaman.EnhancementDef(_, timeShift, currentSpell, gcd, tChosen)
--Resources	
	local mael 												= UnitPower('player', Enum.PowerType.Maelstorm);

--Abilities	
	local astral 											= ConRO:AbilityReady(ids.Enh_Ability.AstralShift, timeShift);
	local hsurge											= ConRO:AbilityReady(ids.Enh_Ability.HealingSurge, timeShift);
	
--Conditions	
	local ph = ConRO:PercentHealth('player');

--Rotations
	if hsurge and mael >= 20 and ph <= 80 then
		return ids.Enh_Ability.HealingSurge;
	end
		
	if astral then
		return ids.Enh_Ability.AstralShift;
	end
return nil;
end

function ConRO.Shaman.Restoration(_, timeShift, currentSpell, gcd, tChosen)
--Abilities
	local purge 											= ConRO:AbilityReady(ids.Resto_Ability.Purge, timeShift);	
	local wshear 											= ConRO:AbilityReady(ids.Resto_Ability.WindShear, timeShift);
	local lbolt												= ConRO:AbilityReady(ids.Resto_Ability.LightningBolt, timeShift);
	local clight											= ConRO:AbilityReady(ids.Resto_Ability.ChainLightning, timeShift);
	local wshear 											= ConRO:AbilityReady(ids.Resto_Ability.WindShear, timeShift);
	local eelem, eeCD, eeMCD								= ConRO:AbilityReady(ids.Resto_Ability.EarthElemental, timeShift);
	local lburst											= ConRO:AbilityReady(ids.Resto_Ability.LavaBurst, timeShift);
		local lavaCharges										= ConRO:SpellCharges(ids.Resto_Ability.LavaBurst);
		local lsurgeBuff 										= ConRO:Aura(ids.Resto_Buff.LavaSurge, timeShift);
	local fshock											= ConRO:AbilityReady(ids.Resto_Ability.FlameShock, timeShift);
		local fsDebuff 											= ConRO:TargetAura(ids.Resto_Debuff.FlameShock, timeShift + 6);
	local hsTotem											= ConRO:AbilityReady(ids.Resto_Ability.HealingStreamTotem, timeShift);
		
	local eshield											= ConRO:AbilityReady(ids.Resto_Talent.EarthShield, timeShift);
	local cbTotem											= ConRO:AbilityReady(ids.Resto_Talent.CloudburstTotem, timeShift);
	
--Conditions	
	local isEnemy 											= ConRO:TarHostile();

	if currentSpell == ids.Ele_Ability.LavaBurst then
		lavaCharges = lavaCharges - 1;
	end
		
--Indicators
	ConRO:AbilityInterrupt(ids.Resto_Ability.WindShear, wshear and ConRO:Interrupt());
	ConRO:AbilityPurge(ids.Resto_Ability.Purge, purge and ConRO:Purgable());

	ConRO:AbilityRaidBuffs(ids.Resto_Talent.EarthShield, eshield and not ConRO:OneBuff(ids.Resto_Buff.EarthShield));
	ConRO:AbilityRaidBuffs(ids.Resto_Ability.HealingStreamTotem, hsTotem and not tChosen[ids.Resto_Talent.CloudburstTotem]);
	ConRO:AbilityRaidBuffs(ids.Resto_Talent.CloudburstTotem, cbTotem and tChosen[ids.Resto_Talent.CloudburstTotem]);
	
	ConRO:AbilityBurst(ids.Ele_Ability.EarthElemental, eelem and isEnemy);

--Rotations
	if isEnemy then
		if fshock and not fsDebuff then
			return ids.Resto_Ability.FlameShock;
		end	
		
		if lburst and lavaCharges >= 1 then
			return ids.Resto_Ability.LavaBurst;
		end
		
		if lbolt then
			return ids.Resto_Ability.LightningBolt;
		end
	end
return nil;
end

function ConRO.Shaman.RestorationDef(_, timeShift, currentSpell, gcd, tChosen)
--Abilities	
	local astral 											= ConRO:AbilityReady(ids.Resto_Ability.AstralShift, timeShift);

--Rotations	
	if astral then
		return ids.Resto_Ability.AstralShift;
	end

	return nil;
end