-- ==================================================================================================================== --
--															--
--	File			Tweaks.lua										--
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
Skada:AddLoadableModule("Tweaks", "Various tweaks to get around deficiences and problems in the game's combat logs. Carries a small performance penalty.", function(Skada, L)


			if Skada.db.profile.modulesBlocked.Tweaks then return end


			-- ==================================================
			-- | Handling of CLEU (COMBAT_LOG_EVENT_UNFILTERED) |
			-- ==================================================
			local orig = Skada.cleuHandler


			local function cleuHandler(timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, spellId, ...)

				orig(timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, spellId, ...)
			end


end)
-- ========================
-- | outer function : end |
-- ========================