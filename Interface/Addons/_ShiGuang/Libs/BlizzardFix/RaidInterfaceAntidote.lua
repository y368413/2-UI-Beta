-- Raid Interface Antidote
hooksecurefunc("CompactUnitFrame_UpdateAll", function(frame)
	if frame:GetName() and frame:GetName():find("^NamePlate%d") then
		return -- Fix to avoid affecting nameplates (courtesy of Emrus)
	end
	if UnitExists(frame.unit) then
		frame:SetScript("OnEnter", UnitFrame_OnEnter)
	else
		frame:SetScript("OnEnter", nil)
		frame.healthBar:SetValue(0)
		frame.powerBar:SetValue(0)
		frame.name:SetText("???")
		frame.selectionHighlight:Hide()
		frame.aggroHighlight:Hide()
		frame.statusText:Hide()
		frame.myHealPrediction:Hide()
		frame.otherHealPrediction:Hide()
		frame.totalAbsorb:Hide()
		frame.totalAbsorbOverlay:Hide()
		frame.overAbsorbGlow:Hide()
		frame.myHealAbsorb:Hide()
		frame.myHealAbsorbLeftShadow:Hide()
		frame.myHealAbsorbRightShadow:Hide()
		frame.overHealAbsorbGlow:Hide()
		frame.roleIcon:Hide()
		frame.readyCheckIcon:Hide()
		frame.centerStatusIcon:Hide()
		CompactUnitFrame_HideAllBuffs(frame)
		CompactUnitFrame_HideAllDebuffs(frame)
		CompactUnitFrame_HideAllDispelDebuffs(frame)
	end
end)
do
	local DEFERRED = {} -- The set of deferred function calls
	-- Create a restrictive proxy for CompactRaidFrameContainer_TryUpdate function
	local old_CompactRaidFrameContainer_TryUpdate = CompactRaidFrameContainer_TryUpdate
	CompactRaidFrameContainer_TryUpdate = function(self)
		if InCombatLockdown() then
			DEFERRED[self:GetName()] = "CompactRaidFrameContainer_TryUpdate" -- Block the update and save it for later
		else
			old_CompactRaidFrameContainer_TryUpdate(self)
		end
	end
	-- Create a restrictive proxy for CompactRaidGroup_UpdateUnits function
	local old_CompactRaidGroup_UpdateUnits = CompactRaidGroup_UpdateUnits
	CompactRaidGroup_UpdateUnits = function(self)
		if InCombatLockdown() then
			DEFERRED[self:GetName()] = "CompactRaidGroup_UpdateUnits" -- Block the update and save it for later
		else
			old_CompactRaidGroup_UpdateUnits(self)
		end
	end
	-- Create a deferred failsafe for CompactUnitFrame_UpdateAll function (we want to protect UpdateInVehicle and UpdateVisible)
	hooksecurefunc("CompactUnitFrame_UpdateAll", function(frame)
		if InCombatLockdown() then
			DEFERRED[frame:GetName()] = "CompactUnitFrame_UpdateAll" -- Save the call for later
		end
	end)
	-- Create the frame that will watch for combat leave event
	local trigger = CreateFrame("Frame")
	trigger:RegisterEvent("PLAYER_REGEN_ENABLED")
	trigger:SetScript("OnEvent", function()
		for k, v in pairs(DEFERRED) do
			DEFERRED[k] = nil
			_G[v](_G[k])
		end
	end)
end