local M, R, U, I = unpack(select(2, ...))
-- Drag AltPowerbar
do
	local bar = _G.PlayerPowerBarAlt
	local mover = CreateFrame("Frame", "NDuiAltBarMover", bar)
	mover:SetPoint("CENTER", UIParent, 0, -200)
	mover:SetSize(20, 20)
	M.CreateMF(bar, mover)
	hooksecurefunc(bar, "SetPoint", function(_, _, parent)
		if parent ~= mover then
			bar:ClearAllPoints()
			bar:SetPoint("CENTER", mover)
		end
	end)
	hooksecurefunc("UnitPowerBarAlt_SetUp", function(self)
		local statusFrame = self.statusFrame
		if statusFrame.enabled then
			statusFrame:Show()
			statusFrame.Hide = statusFrame.Show
		end
	end)
end

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

if GetLocale() == "zhCN" then
	StaticPopupDialogs["LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS"] = {
		text = "针对此项活动，你的队伍人数已满，将被移出列表。",
		button1 = OKAY,
		timeout = 0,
		whileDead = 1,
	}
end