-- ==================================================================================================================== --
--															--
--	File			Interrupts.lua										--
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
Skada:AddLoadableModule("Interrupts", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Interrupts then return end


	local mod    = Skada:NewModule(L["Interrupts"])
	mod.metadata = {icon = "Interface\\Icons\\Ability_rogue_kidneyshot"}


	function mod:OnEnable()

		Skada:AddMode(self)
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
	end




	function mod:AddToTooltip(set, tooltip)

		GameTooltip:AddDoubleLine(L["Interrupts"], set.interrupts, 1,1,1)
	end




	function mod:GetSetSummary(set)

		return set.interrupts
	end




	function mod:AddPlayerAttributes(player)

		if not player.interrupts then player.interrupts = 0 end
	end




	function mod:AddSetAttributes(set)
		if not set.interrupts then set.interrupts = 0 end
	end




	function mod:Update(win, set)

		local max = 0
		local nr  = 1

		for i, player in ipairs(set.players) do

			if player.interrupts > 0 then

				local d         = win.dataset[nr] or {}
				win.dataset[nr] = d

				d.value		= player.interrupts
				d.label		= player.name
				d.valuetext	= tostring(player.interrupts)

				d.id		= player.id
				d.class		= player.class
				d.role		= player.role

				if player.interrupts > max then	max = player.interrupts	end

				nr = nr + 1
			end
		end

		win.metadata.maxvalue = max
	end


end)
-- ========================
-- | outer function : end |
-- ========================
