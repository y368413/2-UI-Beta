-- ==================================================================================================================== --
--															--
--	File			Debuffs.lua										--
--															--
--															--
--	Author			Zarnivoop	| Basis, thx |			| Version	   :	 10.0.2 |	--
--										| Curse-Project-ID :	 694380 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--				Baltha		| Revision |			| Version	   :	 11.1.0 |	--
--										| Curse-Project-ID :	1188318 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--	Path | Revision |	"..\World of Warcraft\_retail_\Interface\AddOns\Skada\Misc\Changelog\ChangeLog.txt"	--
--															--
-- ==================================================================================================================== --


local _, Skada = ...


-- ==========================
-- | outer function : start |
-- ==========================
Skada:AddLoadableModule("Debuffs", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Debuffs then return end


	local debuffoverview = Skada:NewModule(L["Debuffs"])
	local buffoverview   = Skada:NewModule(L["Buffs"])
	local buffplayers    = Skada:NewModule("Buff players")
	local debuffplayers  = Skada:NewModule("Debuff players")
	local mod            = Skada:NewModule(L["Debuff uptimes"])
	local auramod        = Skada:NewModule(L["Debuff spell list"])
	local buffs          = Skada:NewModule(L["Buff uptimes"])
	local buffspells     = Skada:NewModule(L["Buff spell list"])

	local pairs, ipairs  = pairs, ipairs
	local time, strsplit = time, strsplit
	local debug          = function() end


	local function PlayerActiveTime(set, player)

        	local maxtime = 0

	       	if player.time > 0 then	maxtime = player.time end
        	if (not set.endtime or set.stopped) and player.first then maxtime = maxtime + time() - player.first end

	       	return maxtime
	end




	local function log_auraapply(set, aura)

		if set and aura.playername then

			local player = Skada:get_player(set, aura.playerid, (strsplit("-", aura.playername)))


			if player then

				local au = player.auras[aura.spellname]


		                if not au then

					au       = {["id"] = aura.spellid, ["name"] = aura.spellname, ["active"] = 1, ["uptime"] = 0, ["auratype"] = aura.auratype, ["started"] = time(), school = aura.spellschool }
					au.count = 1

					au.last_apply_time = time()
					player.auras[aura.spellname] = au
				else

					au.active          = au.active + 1
					au.count           = (au.count or 0) + 1
					au.started         = au.started or time()
					au.last_apply_time = time()


					if au.spellschool == nil then au.school = aura.spellschool end

				end


				if au.started < player.first then au.started = player.first end
			end
		end
	end




	local function log_auraremove(set, aura)

		if set and aura.playername then

			local player = Skada:get_player(set, aura.playerid, (strsplit("-", aura.playername)))


			if player then

				if player.auras[aura.spellname] then

					local a = player.auras[aura.spellname]


					if a.active > 0 then

						a.active = 0

						if a.active == 0 and a.started then

                	 				if player.first then

		        	                        	a.started = a.started < player.first and player.first or a.started
								a.uptime = a.uptime + math.floor((time() - a.started) + 0.5)
		                        	    	end

							a.started = nil
						end
					end

 					a.started = nil
				end
			end
		end
	end


	local aura = {}


	local function AuraApplied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, auraType = ...

		aura.playerid    = srcGUID
		aura.playername  = srcName
		aura.spellid     = spellId
		aura.spellname   = spellName
		aura.auratype    = auraType
		aura.spellschool = spellSchool

		Skada:FixPets(aura)

		log_auraapply(Skada.current, aura)
		log_auraapply(Skada.total, aura)
	end




	local function AuraRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, auraType = ...

		aura.playerid    = srcGUID
		aura.playername  = srcName
		aura.spellid     = spellId
		aura.spellname   = spellName
		aura.auratype    = auraType
		aura.spellschool = spellSchool

		Skada:FixPets(aura)

		log_auraremove(Skada.current, aura)
		log_auraremove(Skada.total, aura)
	end




	local function NullAura(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		if srcName == nil and #srcGUID == 0 and dstName and #dstGUID > 0 then

			srcName  = dstName
			srcGUID  = dstGUID
			srcFlags = dstFlags


			if eventtype == 'SPELL_AURA_APPLIED' then

				AuraApplied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
			else

				AuraRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
			end
		end
	end




	local function len(t)

		local l = 0


		for i,j in pairs(t) do l = l + 1 end

		return l
	end




	local function spellupdate(auratype, win, set)

		local nr     = 1
		local max    = 0
		local spells = {}


		for i, player in ipairs(set.players) do

			local auracount  = 0
			local aurauptime = 0


			for spellname, spell in pairs(player.auras) do

				if spell.auratype == auratype then

					local spellnr	= spells[spell.id]
					local was_new	= false


					if not spellnr then

						was_new          = true
						spells[spell.id] = nr
						nr               = nr + 1
						spellnr          = spells[spell.id]
					end


					local d		     = win.dataset[spellnr] or {}
					win.dataset[spellnr] = d

					d.id		= spell.id


					if was_new then

						d.value = 1
					else

						d.value = (d.value or 0) + 1
					end


					d.valuetext	= ("%i"):format(d.value)
					d.label		= spellname
					d.spellid	= spell.id

					-- =====================================
					-- | API   : C_Spell.GetSpellInfo      |
					-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
					-- =====================================
					local spellInfo = C_Spell.GetSpellInfo(spell.id)

					-- | Returns nil if spell is not found
					if spellInfo then

						icon		= spellInfo.iconID
						d.icon		= icon

						if spell.school then d.spellschool = spell.school end
						if d.value > max then max	   = d.value	  end
					end
				end
			end
		end

		win.metadata.maxvalue = max
	end


	local auraspellid = nil


	local function spellplayersupdate(auratype, win, set)

		local nr  = 1
		local max = 0


		for i, player in ipairs(set.players) do

			for spellname, spell in pairs(player.auras) do

				if spell.auratype == auratype and spell.id == auraspellid then

					local aurauptime = spell.uptime


					if spell.active > 0 and spell.started then aurauptime = aurauptime + math.floor((time() - spell.started) + 0.5)	end


					local maxtime	= PlayerActiveTime(set, player)
					local d		= win.dataset[nr] or {}

					win.dataset[nr] = d

					d.id		= player.id
					d.value		= aurauptime
					d.valuetext	= ("%02.1f%%"):format(aurauptime / maxtime * 100)

					d.label		= player.name
					d.class		= player.class
					d.role		= player.role


					if aurauptime > max then max = aurauptime end


					nr = nr + 1
				end
			end
		end

		win.metadata.maxvalue = max
	end




	local function updatefunc(auratype, win, set)

		local nr  = 1
		local max = 0


		for i, player in ipairs(set.players) do

			local auracount  = 0
			local aurauptime = 0


			for spellname, spell in pairs(player.auras) do

				if spell.auratype == auratype then auracount = auracount + 1 end
			end


			if auracount > 0 then

				local d		= win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id		= player.id
				d.value		= auracount
				d.valuetext	= ("%u"):format(auracount)
				d.label		= player.name
				d.class		= player.class
				d.role		= player.role

				nr = nr + 1
			end
		end

		win.metadata.maxvalue = max
	end




	local function detailupdatefunc(auratype, win, set, playerid)

		local nr     = 1
		local max    = 0
		local player = Skada:find_player(set, playerid)

		if player then

			local maxtime = PlayerActiveTime(set, player)


			if maxtime and maxtime > 0 then

				win.metadata.maxvalue = maxtime


				for spellname, spell in pairs(player.auras) do

					if spell.auratype == auratype then

						local uptime = spell.uptime

						if spell.active > 0 and spell.started then uptime = uptime + math.floor((time() - spell.started) + 0.5) end

						local d         = win.dataset[nr] or {}
						win.dataset[nr] = d

						d.id		= spell.name
						d.value		= uptime
						d.label		= spell.name

						-- =====================================
						-- | API   : C_Spell.GetSpellInfo      |
						-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
						-- =====================================
						local spellInfo = C_Spell.GetSpellInfo(spell.id)

						-- | Returns nil if spell is not found
						if spellInfo then

							icon	    = spellInfo.iconID
							d.icon	    = icon
							d.spellid   = spell.id
				                        d.valuetext = ("%02.1f%%(%d)"):format(uptime / maxtime * 100, spell.count or 0)

							nr = nr + 1
						end
					end
				end
			end
		end
	end




	function mod:Update(win, set)

		updatefunc("DEBUFF", win, set)
	end




	function auramod:Enter(win, id, label)

		auramod.playerid = id
		auramod.title    = label .. L["'s Debuffs"]
	end




	function auramod:Update(win, set)

		detailupdatefunc("DEBUFF", win, set, self.playerid)
	end




	function buffs:Update(win, set)

		updatefunc("BUFF", win, set)
	end




	function buffspells:Enter(win, id, label)

		buffspells.playerid = id
		buffspells.title    = label .. L["'s Buffs"]
	end




	function buffspells:Update(win, set)

		detailupdatefunc("BUFF", win, set, self.playerid)
	end




	function buffspells:Update(win, set)

		detailupdatefunc("BUFF", win, set, self.playerid)
	end




	function buffoverview:Update(win, set)

		spellupdate("BUFF", win, set)
	end




	function debuffoverview:Update(win, set)

		spellupdate("DEBUFF", win, set)
	end




	function debuffplayers:Update(win, set)

		spellplayersupdate("DEBUFF", win, set)
	end




	function buffplayers:Update(win, set)

		spellplayersupdate("BUFF", win, set)
	end




	function debuffplayers:Enter(win, id, label)

		auraspellid = id
		debuffplayers.title = label
	end




	function buffplayers:Enter(win, id, label)

		auraspellid = id
		buffplayers.title = label
	end




	function mod:OnEnable()

		mod.metadata = {showspots = 1, click1 = auramod, click2 = buffspells, icon = "Interface\\Icons\\Ability_creature_disease_02"}
		auramod.metadata          = {}

		buffs.metadata            = {showspots = 1, click1 = buffspells, click2 = auramod, icon = "Interface\\Icons\\Spell_misc_drink"}
		buffspells.metadata       = {}
		buffoverview.metadata     = {click1 = buffplayers, icon = "Interface\\Icons\\Spell_misc_drink"}

		debuffoverview.metadata   = {click1 = debuffplayers, icon = "Interface\\Icons\\Ability_creature_disease_02"}
		debuffplayers.metadata    = {showspots = 1}
		buffplayers.metadata      = {showspots = 1}

		Skada:RegisterForCL(AuraApplied, 'SPELL_AURA_APPLIED', {src_is_interesting = true})
		Skada:RegisterForCL(AuraRemoved, 'SPELL_AURA_REMOVED', {src_is_interesting = true})

		Skada:RegisterForCL(NullAura, 'SPELL_AURA_APPLIED', {dst_is_interesting_nopets = true, src_is_not_interesting = true})
		Skada:RegisterForCL(NullAura, 'SPELL_AURA_REMOVED', {dst_is_interesting_nopets = true, src_is_not_interesting = true})

		Skada:AddMode(self)
		Skada:AddMode(buffs)
		Skada:AddMode(buffoverview)
		Skada:AddMode(debuffoverview)
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
		Skada:RemoveMode(buffs)
	end



local UnitAura, UnitGUID = UnitAura, UnitGUID
local raidunits  = {} for i=1, 40 do raidunits[i] = "raid" .. i end
local partyunits = {"player", "party1", "party2", "party3", "party4" }


function mod:SetInit(set)

       	debug("init", set.name)
       	local units = IsInRaid() and raidunits or partyunits

        for i, unit in ipairs(units) do

		local guid = UnitGUID(unit)

		if not guid then break end

			local fullname, realm = UnitName(unit)

			if realm and realm ~= "" then fullname = fullname .. "-" .. realm end

			for j = 1, Skada.total and 2 or 1 do

				local set = (j == 1 and set or Skada.total)
				set.aura_time_start = time()

				local player = Skada:get_player(set, guid, fullname, true)

				if player then

				for i=1, 40 do

					local name, icon, _, _, duration, expires, _, isStealable,
					      nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, _, 
					      nameplateShowAll, timeMod, value1, value2, value3 = UnitAura(unit, i)

					if not name then break end

					local apply_time = math.floor(((expires or 0) - GetTime() - (duration or 0)) + time() + 0.5)
					local au         = player.auras[name]

					if not au then

			                        au = {["id"] = spellID, ["name"] = name, ["active"] = 1, ["uptime"] = 0, ["auratype"] = "BUFF", ["started"] = time(), school = nil }
			                        au.count = 1

			                        if expires and expires > 0 then au.last_apply_time = apply_time  end

			                        player.auras[name] = au
					else

                        			au.active  = 1
			                        au.started = time()

			                        if expires and expires > 0 and au.last_apply_time and au.last_apply_time + 4 < apply_time then au.count = (au.count or 0) + 1 end

			                        au.last_apply_time = apply_time
					end
				end
			end
		end
	end
end




function mod:SetComplete(set)

        for j = 1, Skada.total and 2 or 1 do

      		local set	    = (j==1 and set or Skada.total)
	        debug("Complete", set.name)
	        set.aura_time_start = nil

			for i, player in ipairs(set.players) do
				
				for spellname, spell in pairs(player.auras) do
				
					if spell.started and player.first and player.last then
					
						if spell.started < player.first then spell.started = player.first end
							
						spell.uptime = spell.uptime + math.floor((player.last - spell.started) + 0.5)
						
					end
					
					spell.active  = 0
					spell.started = nil
				end
			end
	end
end




	function mod:AddToTooltip(set, tooltip)
	end




	function mod:AddPlayerAttributes(player)

		if not player.auras then player.auras = {} end
	end




	function mod:AddSetAttributes(set)

		set.auras = {}


		for i, player in ipairs(set.players) do

			if player.auras ~= nil then

				for spellname, spell in pairs(player.auras) do

					if spell.active > 0 then

						spell.active  = 0
						spell.started = nil
					end
				end
			end
		end
	end


end)
-- ========================
-- | outer function : end |
-- ========================
