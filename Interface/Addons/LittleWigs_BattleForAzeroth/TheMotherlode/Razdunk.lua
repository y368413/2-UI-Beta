local isElevenDotOne = select(4, GetBuildInfo()) >= 110100 -- XXX remove when 11.1 is live
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Mogul Razdunk", 1594, 2116)
if not mod then return end
mod:RegisterEnableMob(129232, 132713) -- the vehicle, the actual boss
mod:SetEncounterID(2108)
mod:SetRespawnTime(36.4)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Locals
--

local gatlingGunCount = 1 -- XXX remove in 11.1
local homingMissileCount = 1 -- XXX remove in 11.1

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
		-- Stage One: Big Guns
		260280, -- Gatling Gun
		{260813, "SAY", "ME_ONLY_EMPHASIZE"}, -- Homing Missile
		276229, -- Micro Missiles (Mythic)
		-- Stage Two: Drill!
		271456, -- Drill Smash
	}, {
		[260280] = -18916, -- Stage One: Big Guns
		[271456] = -17498, -- Stage Two: Drill!
	}
end

function mod:OnBossEnable()
	-- Stage One: Big Guns
	self:Log("SPELL_CAST_START", "GatlingGun", 260280)
	if isElevenDotOne then
		self:Log("SPELL_CAST_START", "HomingMissile", 260813)
		self:Log("SPELL_AURA_APPLIED", "HomingMissileApplied", 260811)
	else -- XXX remove in 11.1
		self:Log("SPELL_CAST_START", "HomingMissile", 260811)
		self:Log("SPELL_AURA_APPLIED", "HomingMissileApplied", 260829)
	end
	self:Log("SPELL_CAST_START", "MicroMissiles", 276229)
	self:Log("SPELL_CAST_SUCCESS", "ConfigurationDrill", 260189)

	-- Stage Two: Drill!
	self:Log("SPELL_CAST_START", "DrillSmash", 271456)
	self:Log("SPELL_CAST_SUCCESS", "ConfigurationCombat", 260190)
	self:Death("MogulRazdunkVehicleDeath", 129232)
end

function mod:OnEngage()
	gatlingGunCount = 1
	homingMissileCount = 1
	self:SetStage(1)
	self:CDBar(260813, 5.0) -- Homing Missile
	if isElevenDotOne then
		self:CDBar(260280, 20.0) -- Gatling Gun
	else -- XXX remove in 11.1
		self:CDBar(260280, 15.0) -- Gatling Gun
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Stage One: Big Guns

function mod:GatlingGun(args)
	self:Message(args.spellId, "yellow")
	if isElevenDotOne then
		self:CDBar(args.spellId, 30.0)
	else -- XXX remove in 11.1
		gatlingGunCount = gatlingGunCount + 1
		if gatlingGunCount % 2 == 0 then
			self:CDBar(args.spellId, 20.0)
		else
			self:CDBar(args.spellId, 25.0)
		end
	end
	self:PlaySound(args.spellId, "alert")
end

function mod:HomingMissile(args) -- XXX can use args.spellId in 11.1
	if isElevenDotOne then
		self:CDBar(260813, 30.0)
	else -- XXX remove in 11.1
		self:Message(260813, "red", CL.incoming:format(args.spellName))
		homingMissileCount = homingMissileCount + 1
		if homingMissileCount % 2 == 0 then
			self:CDBar(260813, 21.0)
		else
			self:CDBar(260813, 24.0)
		end
	end
end

function mod:HomingMissileApplied(args)
	self:TargetMessage(260813, "orange", args.destName)
	if self:Me(args.destGUID) then
		self:Say(260813, nil, nil, "Homing Missile")
		self:PlaySound(260813, "warning", nil, args.destName)
	else
		self:PlaySound(260813, "alarm", nil, args.destName)
	end
end

do
	local prev = 0
	function mod:MicroMissiles(args)
		local t = args.time
		if t - prev > 2 then
			prev = t
			self:Message(args.spellId, "red")
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

function mod:ConfigurationDrill(args)
	homingMissileCount = 1
	gatlingGunCount = 1
	self:StopBar(260813) -- Homing Missile
	self:StopBar(260280) -- Gatling Gun
	self:SetStage(2)
	self:Message("stages", "cyan", args.spellName, args.spellId)
	self:PlaySound("stages", "info")
end

-- Stage Two: Drill!

do
	local function printTarget(self, name, guid)
		self:TargetMessage(271456, "orange", name)
		self:PlaySound(271456, "alert", nil, name)
	end

	function mod:DrillSmash(args)
		self:GetUnitTarget(printTarget, 0.4, args.sourceGUID)
		self:CDBar(args.spellId, 10.9)
	end
end

function mod:ConfigurationCombat(args)
	if self:IsEngaged() then -- cast on respawn
		self:StopBar(271456) -- Drill Smash
		self:SetStage(1)
		self:Message("stages", "cyan", args.spellName, args.spellId)
		self:CDBar(260813, 7.1) -- Homing Missile
		self:CDBar(260280, 17.1) -- Gatling Gun
		self:PlaySound("stages", "info")
	end
end

function mod:MogulRazdunkVehicleDeath()
	self:StopBar(260813) -- Homing Missile
	self:StopBar(260280) -- Gatling Gun
end
