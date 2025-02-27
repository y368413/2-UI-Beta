-- ==================================================================================================================== --
--															--
--	File			Death.lua										--
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
Skada:AddLoadableModule("Deaths", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Deaths then return end


	local mod         = Skada:NewModule(L["Deaths"], "AceTimer-3.0")
	local deathlog    = Skada:NewModule(L["Death log"])

	local SORtime     = {}
	local death_spell = 41220


	local function log_deathlog(set, playerid, playername, srcname, spellid, spellname, amount, absorb, timestamp, logoverride, healthoverride)

		local player = Skada:get_player(set, playerid, playername)
		local log    = logoverride or player.deathlog


		if log then

			local pos	 = log.pos or 1
			local entry      = log[pos]

			if not entry then
				entry    = {}
				log[pos] = entry
			end

			entry.srcname	 = srcname
			entry.spellid    = spellid
			entry.spellname  = spellname
			entry.amount     = amount
			entry.absorb     = absorb
			entry.ts         = timestamp
			entry.hp         = healthoverride or UnitHealth(playername)

			pos = pos + 1


			if pos > 15 then pos = 1 end


			log.pos = pos
		end
	end




	local function log_death(set, playerid, playername, timestamp)

		local player = Skada:get_player(set, playerid, playername)


		if player then

			local spellid   = death_spell
			local spellname = string.format(L["%s dies"], player.name)
			local deathts   = timestamp

			log_deathlog(set, playerid, playername, nil, spellid, spellname, nil, nil, timestamp, nil, 0)

			local deathlog  = player.deathlog


			if deathlog then

				for i,entry in ipairs(deathlog) do

					entry.ts = entry.ts + i*0.00001 + (i < (deathlog.pos or 1) and 0.001 or 0)

					if entry.spellid == death_spell then deathts = entry.ts end
				end

				player.deathlog = {}

				local cplayer = Skada:get_player(Skada.current, playerid, playername)
				local maxhp   = (cplayer and cplayer.maxhp) or player.maxhp

				return deathts, deathlog, maxhp
			end
		end
	end




	local function save_death(set, playerid, playername, deathts, deathlog, maxhp)

		local player = Skada:get_player(set, playerid, playername)


		if player then

			player.deaths = player.deaths or {}

			table.insert(player.deaths, 1, {["ts"] = deathts, ["log"] = deathlog, ["maxhp"] = maxhp})

			set.deaths = set.deaths + 1
		end
	end




	local function log_resurrect(set, playerid, playername, srcname, spellid, spellname, timestamp)

		local player = Skada:get_player(set, playerid, playername)


		if player and player.deaths and player.deaths[1] then

			log_deathlog(set, playerid, playername, srcname, spellid, spellname, nil, nil, timestamp, player.deaths[1].log, 0)
		end
	end




	local function log_SORdeath(set, playerid, playername, timestamp)

		local player	 = Skada:get_player(set, playerid, playername)
		local spellid	 = death_spell

		-- =====================================
		-- | API   : C_Spell.GetSpellInfo      |
		-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
		-- =====================================
		local Redemption = C_Spell.GetSpellInfo(20711)
		local spellname  = string.format(L["%s dies"], Redemption.name)


		if player and player.deaths and player.deaths[1] then

			log_deathlog(set, playerid, playername, playername, spellid, spellname, nil, nil, timestamp, player.deaths[1].log, 0)
		end

		if player and player.deathlog then wipe(player.deathlog) end

	end




	local function UnitDied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local SORtime = SORtime[dstGUID] or 0


		if timestamp > SORtime + 1 and timestamp < SORtime + 20 then

			log_SORdeath(Skada.total,   dstGUID, dstName, timestamp)
		elseif not UnitIsFeignDeath(dstName) then

			local deathts, deathlog, maxhp = log_death(Skada.total, dstGUID, dstName, timestamp)


			if deathlog then

				save_death(Skada.total,   dstGUID, dstName, deathts, deathlog, maxhp)
				save_death(Skada.current, dstGUID, dstName, deathts, deathlog, maxhp)
			end
		end
	end




	local function AuraApplied(...)

		local spellId = select(9,...)


		if spellId == 27827 then

			local timestamp  = ...
			local dstGUID    = select(6,...)
			SORtime[dstGUID] = timestamp

			local args       = { select(2,...) }

			mod:ScheduleTimer(function()

				UnitDied((timestamp+0.01), unpack(args))

				end, 0.01)

		end
	end




	local function Missed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, misstype, _, samount


		if eventtype == "SWING_MISSED" then

			spellId = 88163
			misstype, _, samount = ...
		else

			spellId = ...
			misstype, _, samount = select(3,...)
		end


		if dstGUID and timestamp == SORtime[dstGUID] then

			Skada:Debug("SOR Miss killing blow: ",dstName, spellId, samount)
			log_deathlog(Skada.total, dstGUID, dstName, srcName, spellId, nil, samount and -samount, nil, timestamp, nil, 0)
		elseif misstype == "ABSORB" then

			log_deathlog(Skada.total, dstGUID, dstName, srcName, spellId, nil, nil, samount and -samount, timestamp)
		end
	end




	local function Resurrect(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool = ...

		log_resurrect(Skada.total, dstGUID, dstName, srcName, spellId, nil, timestamp)
	end




	local function SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, samount, soverkill, sschool, sresisted, sblocked, sabsorbed, scritical, sglancing, scrushing = ...

		log_deathlog(Skada.total, dstGUID, dstName, srcName, spellId, nil, samount and -samount, sabsorbed and -sabsorbed, timestamp)
	end




	local function SwingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local samount, soverkill, sschool, sresisted, sblocked, sabsorbed, scritical, sglancing, scrushing = ...
		local spellid = 88163

		log_deathlog(Skada.total, dstGUID, dstName, srcName, spellid, nil, samount and -samount, sabsorbed and -sabsorbed, timestamp)
	end




	local function EnvironmentalDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local environmentalType, samount, soverkill, sschool, sresisted, sblocked, sabsorbed, scritical, sglancing, scrushing = ...

		log_deathlog(Skada.total, dstGUID, dstName, srcName, nil, environmentalType, samount and -samount, sabsorbed and -sabsorbed, timestamp)
	end




	local function Instakill(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool = ...
		spellId				      = spellId or 80468

		log_deathlog(Skada.total, dstGUID, dstName, srcName, spellId, spellName, -1e9, nil, timestamp)
	end



	local function SpellHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, samount, soverhealing, absorbed, scritical = ...
		local srcName_modified

		samount                   = max(0, samount - soverhealing)
		srcGUID, srcName_modified = Skada:FixMyPets(srcGUID, srcName)

		log_deathlog(Skada.total, dstGUID, dstName, (srcName_modified or srcName), spellId, nil, samount, absorbed, timestamp)
	end




	local function cmp_order_dataset(a,b)

		return (a and a.id and a.order or 0) > (b and b.id and b.order or 0)
	end




	function mod:Update(win, set)

		local nr              = 1
		win.metadata.maxvalue = 0


		for i, player in ipairs(set.players) do

			if player.deaths and #player.deaths > 0 then

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				local labeldeath


				if set == Skada.total then

					d.order     = #player.deaths
					d.valuetext = Skada:FormatValueText(

						tostring(#player.deaths), self.metadata.columns.Deaths

									   )

					labeldeath  = player.deaths[1]
				else

					local deathts

					for j, death in ipairs(player.deaths) do

						deathts = math.min(deathts or death.ts, death.ts)
					end

					d.order     = deathts
					d.valuetext = Skada:FormatValueText(

						tostring(#player.deaths), self.metadata.columns.Deaths,
						date("%H:%M:%S", deathts), self.metadata.columns.Timestamp
									   )


					labeldeath = player.deaths[#player.deaths]
				end


				local spellname = nil
				local spellid   = nil


				if labeldeath and labeldeath.log and #labeldeath.log > 2 then

					local kbts = 0


					for j, v in ipairs(labeldeath.log) do

						if v.amount and v.amount < 0 and v.ts > kbts then

							spellid   = v.spellid
							spellname = v.spellname
							kbts      = v.ts
						end
					end
				end


				d.id    = player.id
				d.value = #player.deaths


				-- =====================================
				-- | API   : C_Spell.GetSpellInfo      |
				-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
				-- =====================================
				local SpellInfo = C_Spell.GetSpellInfo(spellid)


				if spellid then

					d.label = player.name .. ": " .. (spellname or SpellInfo.name)
				else

					d.label = player.name
				end


				d.class = player.class
				d.role  = player.role

				win.metadata.maxvalue = math.max(win.metadata.maxvalue, d.value)

				nr = nr + 1
			end
		end

		table.sort(win.dataset, cmp_order_dataset)
		local empty = wipe(table.remove(win.dataset,nr) or {})

		table.insert(win.dataset, 1, empty)
	end




	function deathlog:Enter(win, id, label)

		deathlog.playerid = id
		deathlog.title = label:gsub(": .*$","") .. L["'s Death"]
	end


	local green = {r = 0, g = 255, b = 0, a = 1}
	local red   = {r = 255, g = 0, b = 0, a = 1}


	local function cmp_ts(a,b)

		return a and b and a.ts > b.ts
	end




	function deathlog:Update(win, set)

		local player = Skada:get_player(set, self.playerid)


		if player and player.deaths then

			local nr     = 1
			local winmax = 1

			table.sort(player.deaths, cmp_ts)


			for i, death in ipairs(player.deaths) do

				local maxhp = death.maxhp or player.maxhp
				winmax      = math.max(winmax, maxhp)

				table.sort(death.log, cmp_ts)


				for j, log in ipairs(death.log) do

					local diff = tonumber(log.ts) - tonumber(death.ts)

					if diff > -60 then

						local d         = win.dataset[nr] or {}
						win.dataset[nr] = d
						d.id            = nr

						local spellid   = log.spellid or 88163


						-- =====================================
						-- | API   : C_Spell.GetSpellInfo      |
						-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
						-- =====================================
						local SpellInfo = C_Spell.GetSpellInfo(spellid)
						local spellname = log.spellname or SpellInfo.name

						local rspellname


						if spellid == death_spell then

							rspellname = spellname
						else

							-- =====================================
							-- | API   : C_Spell.GetSpellLink      |
							-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
							-- =====================================

							-- | Returns nil if spell is not found, therfore ...
							rspellname = C_Spell.GetSpellLink(spellid) or spellname or ""
						end


						local label


						if log.ts >= death.ts then

							label = date("%H:%M:%S", log.ts) .. ": "
						else

							label = ("%2.2f"):format(diff)   .. ": "
						end


						if log.srcname then

							label = label..log.srcname .. L["'s "]
						end


						d.label       = label..spellname
						d.reportlabel = label..rspellname
						d.ts          = log.ts
						d.value       = log.hp or 0


						-- =====================================
						-- | API   : C_Spell.GetSpellInfo      |
						-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
						-- =====================================
						local SpellInfo = C_Spell.GetSpellInfo(spellid)
						icon            = SpellInfo.iconID

						d.icon		= icon
						d.spellid	= spellid

						local amt	= ""
						local amount	= log.amount or 0
						local absorb	= log.absorb or 0


						if self.metadata.columns.Change then

							local change = Skada:FormatNumber(math.abs(amount))


							if amount > 0 then

								change = "+" .. change
							elseif amount < 0 then

								change = "-" .. change
							end

							amt = amt .. change

						end


						if absorb ~= 0 and self.metadata.columns.Absorb then

							amt = amt .. " (" .. Skada:FormatNumber(math.abs(absorb)) .. " " .. ABSORB..")"
						end


						if log.ts >= death.ts then

							d.valuetext = ""
						else

							d.valuetext = Skada:FormatValueText(

								amt, #amt > 0,
								Skada:FormatNumber(log.hp or 0), self.metadata.columns.Health,
								string.format("%02.1f%%", (log.hp or 1) / (maxhp or 1) * 100), self.metadata.columns.Percent

											   )

						end

						if amount == 0 and absorb == 0 then

							d.color = green
						elseif amount > 0 or absorb > 0 then

							d.color = green
						else

							d.color = red
						end

						nr = nr + 1
					end
				end
			end

			win.metadata.maxvalue = winmax
		end
	end




	function mod:OnEnable()

		mod.metadata      = {ordersort = true, click1 = deathlog, columns = {Deaths = true, Timestamp = true}, icon = "Interface\\Icons\\Ability_warlock_cremation"}
		deathlog.metadata = {ordersort = true, columns = {Change = true, Health = false, Percent = true, Absorb = true}}

		Skada:RegisterForCL(UnitDied           , 'UNIT_DIED'            , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(AuraApplied        , 'SPELL_AURA_APPLIED'   , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellDamage        , 'SPELL_DAMAGE'         , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellDamage        , 'SPELL_PERIODIC_DAMAGE', {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellDamage        , 'SPELL_BUILDING_DAMAGE', {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellDamage        , 'RANGE_DAMAGE'         , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SwingDamage        , 'SWING_DAMAGE'         , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(EnvironmentalDamage, 'ENVIRONMENTAL_DAMAGE' , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Instakill          , 'SPELL_INSTAKILL'      , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Instakill          , 'RANGE_INSTAKILL'      , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellHeal          , 'SPELL_HEAL'           , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(SpellHeal          , 'SPELL_PERIODIC_HEAL'  , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Resurrect          , 'SPELL_RESURRECT'      , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Missed             , 'SWING_MISSED'         , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Missed             , 'SPELL_MISSED'         , {dst_is_interesting_nopets = true})
		Skada:RegisterForCL(Missed             , 'RANGE_MISSED'         , {dst_is_interesting_nopets = true})

		Skada:AddMode(self)
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
	end




	function mod:SetComplete(set)
	end




	function mod:AddToTooltip(set, tooltip)

		GameTooltip:AddDoubleLine(L["Deaths"], set.deaths, 1,1,1)
	end




	function mod:GetSetSummary(set)

		return set.deaths
	end




	function mod:AddPlayerAttributes(player, set)

		if set == Skada.total and not player.deathlog then

			player.deathlog = {}
		end

		player.maxhp = math.max(UnitHealthMax(player.name) or 0, player.maxhp or 0)
	end




	function mod:AddSetAttributes(set)

		if not set.deaths then

			set.deaths = 0
		end
	end


end)
-- ==========================
-- | outer function : start |
-- ==========================
