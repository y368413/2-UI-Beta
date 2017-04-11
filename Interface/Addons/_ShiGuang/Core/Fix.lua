local M, R, U, I = unpack(select(2, ...))
-- Drag AltPowerbar
PlayerPowerBarAlt:SetMovable(true)
PlayerPowerBarAlt:SetClampedToScreen(true)
PlayerPowerBarAlt:SetScript("OnMouseDown", function(self)
	if IsShiftKeyDown() then self:StartMoving() end
end)
PlayerPowerBarAlt:SetScript("OnMouseUp", function(self)
	self:StopMovingOrSizing()
end)
function UnitPowerBarAlt_OnEnter(self)
	local statusFrame = self.statusFrame
	if statusFrame.enabled then
		statusFrame:Show()
		UnitPowerBarAltStatus_UpdateText(statusFrame)
	end
end
hooksecurefunc("UnitPowerBarAlt_SetUp", function(self)
	local statusFrame = self.statusFrame
	if statusFrame.enabled then
		statusFrame:Show()
		statusFrame.Hide = statusFrame.Show
	end
end)

-- Fix Drag Collections taint
MaoRUI:EventFrame("ADDON_LOADED"):SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_Collections" then
		CollectionsJournal:HookScript("OnShow", function()
			if not self.init then
				if InCombatLockdown() then
					self:RegisterEvent("PLAYER_REGEN_ENABLED")
				else
					M.CreateMF(CollectionsJournal)
					self:UnregisterAllEvents()
				end
				self.init = true
			end
		end)
		if name == "Blizzard_Collections" then
			for i = 1, 3 do
				local button = _G["PetJournalLoadoutPet"..i]
				if button and button.dragButton then
					button.dragButton:RegisterForClicks("LeftButtonUp")
				end
			end
			self:UnregisterAllEvents()
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		M.CreateMF(CollectionsJournal)
		self:UnregisterAllEvents()
	end
end)

-- Temporary PVP queue taint fix
InterfaceOptionsFrameCancel:SetScript("OnClick", function()
    InterfaceOptionsFrameOkay:Click()
end)