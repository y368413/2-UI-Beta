-- ==================================================================================================================== --
--															--
--	File			Healing.lua										--
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
Skada:AddLoadableModule("Healing", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Healing then return end


	local mod          = Skada:NewModule(L["Healing"])
	local spellsmod    = Skada:NewModule(L["Healing spell list"])
	local healedmod    = Skada:NewModule(L["Healed players"])
	local healingtaken = Skada:NewModule(L["Healing taken"])


	local function log_heal(set, heal, is_absorb)

		local player = Skada:get_player(set, heal.playerid, heal.playername)

		if player and heal and heal.spellname then

			local amount                       = math.max(0, heal.amount - heal.overhealing)
			amount                             = amount + heal.absorbed

			player.healing                     = player.healing + amount
			player.overhealing                 = player.overhealing + heal.overhealing
			player.healingabsorbed             = player.healingabsorbed + heal.absorbed


			if is_absorb then player.shielding = player.shielding + amount end


			set.healing                        = set.healing + amount
			set.overhealing                    = set.overhealing + heal.overhealing
			set.healingabsorbed                = set.healingabsorbed + heal.absorbed


			if is_absorb then set.shielding    = set.shielding + amount end


			do

				if heal.dstName and heal.dstGUID then


					local healed = player.healed[heal.dstGUID]


					if not healed then

						local _, className          = UnitClass(heal.dstName)
						local playerRole            = UnitGroupRolesAssigned(heal.dstName)
						healed                      = {name = heal.dstName, class = className, role = playerRole, amount = 0, shielding = 0}
						player.healed[heal.dstGUID] = healed
					end


					healed.amount = healed.amount + amount


					if is_absorb then healed.shielding = healed.shielding + amount end
				end
			end


			do

				local spell = player.healingspells[heal.spellname]

				if not spell then

					spell = {id = heal.spellid, name = heal.spellname, hits = 0, healing = 0, overhealing = 0, absorbed = 0, shielding = 0, critical = 0, min = nil, max = 0}
					player.healingspells[heal.spellname] = spell
				end

				spell.healing           = spell.healing + amount


				if heal.critical then spell.critical = spell.critical + 1 end


				spell.overhealing       = spell.overhealing + heal.overhealing
				spell.absorbed          = spell.absorbed    + heal.absorbed


				if is_absorb then spell.shielding = spell.shielding + amount end


				spell.hits              = (spell.hits or 0) + 1

				if not spell.min or amount < spell.min then spell.min = amount end
				if not spell.max or amount > spell.max then spell.max = amount end
			end
		end
	end


	local heal = {}


	local function SpellHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, samount, soverhealing, absorbed, scritical = ...


		if bit.band(srcFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) ~= 0 and bit.band(srcFlags, dstFlags, COMBATLOG_OBJECT_REACTION_MASK) ~= 0 then

			heal.dstName     = dstName
			heal.dstGUID     = dstGUID
			heal.playerid    = srcGUID
			heal.playername  = srcName
			heal.spellid     = spellId
			heal.spellname   = spellName
			heal.amount      = samount
			heal.overhealing = soverhealing
			heal.critical    = scritical
			heal.absorbed    = absorbed

			Skada:FixPets(heal)

			log_heal(Skada.current, heal)
			log_heal(Skada.total, heal)
		end
	end




	local function log_absorb(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, samount = ...


		if bit.band(srcFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) ~= 0 and bit.band(srcFlags, dstFlags, COMBATLOG_OBJECT_REACTION_MASK) ~= 0 then

			if spellId == 20711 or spellId == 115069 then return end

			heal.dstName     = dstName
			heal.dstGUID     = dstGUID
			heal.playerid    = srcGUID
			heal.playername  = srcName
			heal.spellid     = spellId
			heal.spellname   = spellName
			heal.amount      = samount
			heal.overhealing = 0
			heal.critical    = false
			heal.absorbed    = 0

			Skada:FixPets(heal)

			log_heal(Skada.current, heal, true)
			log_heal(Skada.total, heal, true)
		end
	end




	local function SpellAbsorbed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local chk = ...


		if type(chk) == "number" then

			local _, _, _, aGUID, aName, aFlags, _, aSpellId, aSpellName, aSpellSchool, aAmount = ...
			if aAmount then	log_absorb(timestamp, eventtype, aGUID, aName, aFlags, dstGUID, dstName, dstFlags, aSpellId, aSpellName, aSpellSchool, aAmount)	end
		else

			local aGUID, aName, aFlags, _, aSpellId, aSpellName, aSpellSchool, aAmount = ...
			if aAmount then	log_absorb(timestamp, eventtype, aGUID, aName, aFlags, dstGUID, dstName, dstFlags, aSpellId, aSpellName, aSpellSchool, aAmount)	end
		end
	end


	local shields = {}


	local function AuraApplied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, auraType, amount = ...


		if amount ~= nil and dstName and srcName then

			local valid = (bit.band(srcFlags, dstFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) ~= 0)

			valid = valid and (bit.band(srcFlags, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) == 0)
			valid = valid and (bit.band(dstFlags, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) == 0)
			valid = valid and (bit.band(srcFlags, dstFlags, COMBATLOG_OBJECT_REACTION_MASK) ~= 0)


			if valid then

				if shields[dstName]	     == nil then shields[dstName]	   = {} end
				if shields[dstName][spellId] == nil then shields[dstName][spellId] = {} end

				shields[dstName][spellId][srcName] = amount
			end
		end
	end



	local function AuraRefresh(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, auraType, amount = ...

		if amount ~= nil then

			if shields[dstName] and shields[dstName][spellId] and shields[dstName][spellId][srcName] then

				local prev = shields[dstName][spellId][srcName]

				heal.dstName                       = dstName
				heal.dstGUID                       = dstGUID
				heal.playerid                      = srcGUID
				heal.playername                    = srcName
				heal.spellid                       = spellId
				heal.spellname                     = spellName
				heal.amount                        = 0
				heal.overhealing                   = prev
				heal.critical                      = nil
				heal.absorbed                      = 0

				Skada:FixPets(heal)

				log_heal(Skada.current, heal, true)
				log_heal(Skada.total, heal, true)

				shields[dstName][spellId][srcName] = amount
			end
		end
	end




	local function AuraRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)

		local spellId, spellName, spellSchool, auraType, amount = ...

		if amount ~= nil then

			if shields[dstName] and shields[dstName][spellId] and shields[dstName][spellId][srcName] then

				local prev = shields[dstName][spellId][srcName]


				if prev then

					heal.dstName               = dstName
					heal.dstGUID               = dstGUID
					heal.playerid              = srcGUID
					heal.playername            = srcName
					heal.spellid               = spellId
					heal.spellname             = spellName
					heal.amount                = 0
					heal.overhealing           = amount
					heal.critical              = nil
					heal.absorbed              = 0

					Skada:FixPets(heal)

					log_heal(Skada.current, heal, true)
					log_heal(Skada.total, heal, true)
				end

				shields[dstName][spellId][srcName] = nil
			end
		end
	end




	local function getHPS(set, player)

		local totaltime = Skada:PlayerActiveTime(set, player)
		return player.healing / math.max(1,totaltime)
	end




	local function getHPSByValue(set, player, healing)

		local totaltime = Skada:PlayerActiveTime(set, player)
		return healing / math.max(1,totaltime)
	end




	local function getRaidHPS(set)

		if set.time > 0 then

			return set.healing / math.max(1, set.time)
		else

			local endtime = set.endtime or time()
			return set.healing / math.max(1, endtime - set.starttime)
		end
	end


	local httable = {}


	function healingtaken:Update(win, set)

		local nr  = 1
		local max = 0

		wipe(httable)


		for i, player in ipairs(set.players) do

			for dstGUID, heal in pairs(player.healed) do

				httable[dstGUID] = (httable[dstGUID] or 0) + heal.amount
			end
		end


		for i, player in ipairs(set.players) do

			local totalhealing = httable[player.id] or 0


			if totalhealing > 0 then

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id            = player.id
				d.label         = player.name
				d.value         = totalhealing

				d.valuetext     = Skada:FormatValueText(

										Skada:FormatNumber(totalhealing), self.metadata.columns.Healing,
										Skada:FormatNumber(getHPSByValue(set, player, totalhealing)), self.metadata.columns.HPS,
										string.format("%02.1f%%", totalhealing / set.healing * 100), self.metadata.columns.Percent

								       )

				d.class         = player.class
				d.role          = player.role

				if totalhealing > max then max = totalhealing end

				nr = nr + 1
			end
		end

		win.metadata.maxvalue = max
	end




	function mod:Update(win, set)

		local nr  = 1
		local max = 0


		for i, player in ipairs(set.players) do

			if player.healing > 0 then

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id            = player.id
				d.label         = player.name
				d.value         = player.healing

				d.valuetext     = Skada:FormatValueText(

										Skada:FormatNumber(player.healing), self.metadata.columns.Healing,
										Skada:FormatNumber(getHPS(set, player)), self.metadata.columns.HPS,
										string.format("%02.1f%%", player.healing / set.healing * 100), self.metadata.columns.Percent

								       )

				d.class         = player.class
				d.role          = player.role

				if player.healing > max then max = player.healing end

				nr = nr + 1
			end
		end

		win.metadata.maxvalue = max
	end




	local function spell_tooltip(win, id, label, tooltip)

		local player = Skada:find_player(win:get_selected_set(), spellsmod.playerid)

		if player then

			local spell = player. healingspells[label]


			if spell then

				tooltip:AddLine(player.name .. " - " .. label)


				if spell.max and spell.min then

					tooltip:AddDoubleLine(L["Minimum hit:"], Skada:FormatNumber(spell.min), 255,255,255,255,255,255)
					tooltip:AddDoubleLine(L["Maximum hit:"], Skada:FormatNumber(spell.max), 255,255,255,255,255,255)
				end


				tooltip:AddDoubleLine(L["Average hit:"], Skada:FormatNumber(spell.healing / spell.hits), 255,255,255,255,255,255)


				if spell.hits then

					tooltip:AddDoubleLine(L["Critical"]    .. ":", ("%02.1f%%"):format(spell.critical / spell.hits * 100), 255,255,255,255,255,255)
				end


				if spell.hits then

					tooltip:AddDoubleLine(L["Overhealing"] .. ":", ("%02.1f%%"):format(spell.overhealing / (spell.overhealing + spell.healing) * 100), 255,255,255,255,255,255)
				end


				if spell.hits and spell.absorbed then

					tooltip:AddDoubleLine(L["Absorbed"]    .. ":", ("%02.1f%%"):format(spell.absorbed / (spell.overhealing + spell.healing) * 100), 255,255,255,255,255,255)
				end
			end
		end
	end




	function spellsmod:Enter(win, id, label)

		spellsmod.playerid = id
		spellsmod.title    = label .. L["'s Healing"]
	end




	function spellsmod:Update(win, set)

		local player = Skada:find_player(set, self.playerid)
		local nr     = 1
		local max    = 0

		if player then

			for spellname, spell in pairs(player.healingspells) do

				local d          = win.dataset[nr] or {}
				win.dataset[nr]  = d

				d.id             = spell.name
				d.label          = spell.name
				d.value          = spell.healing

				d.valuetext      = Skada:FormatValueText(

										Skada:FormatNumber(spell.healing), self.metadata.columns.Healing,
										string.format("%02.1f%%", spell.healing / player.healing * 100), self.metadata.columns.Percent

									)

				-- =====================================
				-- | API   : C_Spell.GetSpellInfo      |
				-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
				-- =====================================
				local spellInfo  = C_Spell.GetSpellInfo(spell.id)

				-- | Returns nil if spell is not found
				if spellInfo then

					icon             = spellInfo.iconID

					d.icon           = icon
					d.spellid        = spell.id


					if spell.healing > max then max = spell.healing	end

					nr = nr + 1
				end
			end
		end

		win.metadata.hasicon  = true
		win.metadata.maxvalue = max
	end




	function healedmod:Enter(win, id, label)

		healedmod.playerid = id
		healedmod.title    = L["Healed by"] .. " " .. label
	end




	function healedmod:Update(win, set)

		local player = Skada:find_player(set, healedmod.playerid)
		local nr     = 1
		local max    = 0

		if player then

			for dstGUID, heal in pairs(player.healed) do

				if heal.amount > 0 then

					local d         = win.dataset[nr] or {}
					win.dataset[nr] = d

					d.id            = dstGUID
					d.label         = heal.name or dstGUID
					d.value         = heal.amount
					d.class         = heal.class
					d.role          = player.role

					d.valuetext     = Skada:FormatValueText(

											Skada:FormatNumber(heal.amount), self.metadata.columns.Healing,
											string.format("%02.1f%%", heal.amount / player.healing * 100), self.metadata.columns.Percent

									       )

					if heal.amount > max then max = heal.amount end


					nr = nr + 1
				end
			end
		end

		win.metadata.hasicon  = true
		win.metadata.maxvalue = max
	end




	function mod:OnEnable()

		mod.metadata          = {showspots = true, click1 = spellsmod, click2 = healedmod, columns = {Healing = true, HPS = true, Percent = true}, icon = "Interface\\Icons\\Ability_priest_flashoflight"}
		spellsmod.metadata    = {tooltip = spell_tooltip, columns = {Healing = true, Percent = true}}
		healedmod.metadata    = {showspots = true, columns = {Healing = true, Percent = true}}
		healingtaken.metadata = {showspots = true, columns = {Healing = true, HPS = true, Percent = true}, icon = "Interface\\Icons\\Ability_priest_cascade"}

		Skada:RegisterForCL(SpellHeal    , 'SPELL_HEAL'         , {src_is_interesting = true})
		Skada:RegisterForCL(SpellAbsorbed, 'SPELL_ABSORBED'     , {dst_is_interesting = true})
		Skada:RegisterForCL(SpellHeal    , 'SPELL_PERIODIC_HEAL', {src_is_interesting = true})

		Skada:RegisterForCL(AuraApplied  , 'SPELL_AURA_APPLIED' , {src_is_interesting_nopets = true})
		Skada:RegisterForCL(AuraRefresh  , 'SPELL_AURA_REFRESH' , {src_is_interesting_nopets = true})
		Skada:RegisterForCL(AuraRemoved  , 'SPELL_AURA_REMOVED' , {src_is_interesting_nopets = true})

		Skada:AddMode(self, L["Healing"])
		Skada:AddMode(healingtaken, L["Healing"])

		Skada:AddFeed(L["Healing: Personal HPS"],

			      function()

				      if Skada.current then

					      local player = Skada:find_player(Skada.current, UnitGUID("player"))

					      if player then return Skada:FormatNumber(getHPS(Skada.current, player)) .. " " .. L["HPS"] end
				      end

			      end

			    )


		Skada:AddFeed(L["Healing: Raid HPS"],

			      function()

				      if Skada.current then return Skada:FormatNumber(getRaidHPS(Skada.current)) .. " " .. L["RHPS"] end
				
			      end

			    )	
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
		Skada:RemoveMode(healingtaken)
	end




	function mod:AddToTooltip(set, tooltip)

		local endtime   = set.endtime


		if not endtime then endtime = time() end


		local raidhps   = set.healing / (endtime - set.starttime + 1)

		GameTooltip:AddDoubleLine(L["HPS"], ("%02.1f"):format(raidhps), 1,1,1)
	end




	function mod:GetSetSummary(set)

		return Skada:FormatValueText(

						     Skada:FormatNumber(set.healing)    , self.metadata.columns.Healing,
						     Skada:FormatNumber(getRaidHPS(set)), self.metadata.columns.HPS

					    )

	end




	function mod:AddPlayerAttributes(player)

		player.healed          = player.healed or {}
		player.healing         = player.healing or 0
		player.shielding       = player.shielding or 0
		player.healingspells   = player.healingspells or {}
		player.overhealing     = player.overhealing or 0
		player.healingabsorbed = player.healingabsorbed or 0


		for _, heal in pairs(player.healingspells) do

			heal.absorbed  = heal.absorbed or 0
			heal.shielding = heal.shielding or 0
		end


		for _, healed in pairs(player.healed) do

			healed.shielding = healed.shielding or 0
		end
	end




	function mod:AddSetAttributes(set)

		set.healing         = set.healing or 0
		set.shielding       = set.shielding or 0
		set.overhealing     = set.overhealing or 0
		set.healingabsorbed = set.healingabsorbed or 0
	end


end)
-- ========================
-- | outer function : end |
-- ========================