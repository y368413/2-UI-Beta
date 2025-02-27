-- ==================================================================================================================== --
--															--
--	File			Overhealing.lua										--
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
Skada:AddLoadableModule("Overhealing", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Overhealing then return end


	local mod          = Skada:NewModule(L["Overhealing"])
	local spellsmod    = Skada:NewModule(L["Overhealing spells"])

	mod.metadata       = {showspots = true, click1 = spellsmod, columns = {Overheal = true, Percent = true}, icon = "Interface\\Icons\\Ability_paladin_infusionoflight"}
	spellsmod.metadata = {columns = {Healing = true, Percent = true}}


	function mod:OnEnable()

		Skada:AddMode(self, L["Healing"])
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
	end




	function mod:AddPlayerAttributes(player)

		if not player.overhealing then player.overhealing = 0 end
	end




	function mod:AddSetAttributes(set)

		if not set.overhealing then set.overhealing = 0	end
	end




	function mod:GetSetSummary(set)

		return Skada:FormatNumber(set.overhealing)
	end




	function mod:Update(win, set)

		local nr  = 1
		local max = 0

		for i, player in ipairs(set.players) do

			if player.overhealing > 0 then

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id		= player.id
				d.label		= player.name
				d.value		= player.overhealing

				d.valuetext	= Skada:FormatValueText(

										Skada:FormatNumber(player.overhealing), self.metadata.columns.Overheal,
										string.format("%02.1f%%", player.overhealing / math.max(1, player.healing) * 100), self.metadata.columns.Percent

								       )

				d.class = player.class
				d.role  = player.role

				if player.overhealing > max then max = player.overhealing end

				nr = nr + 1
				end
		end

		win.metadata.maxvalue = max
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

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id		= spell.id
				d.label		= spell.name
				d.value		= spell.overhealing

				d.valuetext	= Skada:FormatValueText(

										Skada:FormatNumber(spell.overhealing), self.metadata.columns.Healing,
										string.format("%02.1f%%", spell.overhealing / player.overhealing * 100), self.metadata.columns.Percent

								       )

				-- =====================================
				-- | API   : C_Spell.GetSpellInfo      |
				-- | valid : + 11.0.0 / 4.4.1 / 1.15.4 |
				-- =====================================
				local spellInfo = C_Spell.GetSpellInfo(spell.id)

				-- | Returns nil if spell is not found
				if spellInfo then

					icon            = spellInfo.iconID
					d.icon          = icon
					d.spellid       = spellInfo.spellID

					if spell.overhealing > max then	max = spell.overhealing	end

					nr = nr + 1
				end
			end
		end

		win.metadata.hasicon  = true
		win.metadata.maxvalue = max
	end
end)
-- ========================
-- | outer function : end |
-- ========================
