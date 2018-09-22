local _, ns = ...
local M, R, U, I = unpack(ns)

-- Drag AltPowerbar
do
	local mover = CreateFrame("Frame", "NDuiAltBarMover", PlayerPowerBarAlt)
	mover:SetPoint("CENTER", UIParent, 0, -200)
	mover:SetSize(20, 20)
	M.CreateMF(PlayerPowerBarAlt, mover)
	hooksecurefunc(PlayerPowerBarAlt, "SetPoint", function(_, _, parent)
		if parent ~= mover then
			PlayerPowerBarAlt:ClearAllPoints()
			PlayerPowerBarAlt:SetPoint("CENTER", mover)
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

do
	local done
	local function setupMisc(event, addon)
		if event == "ADDON_LOADED" and addon == "Blizzard_Collections" then
			CollectionsJournal:HookScript("OnShow", function()
				if not done then
					if InCombatLockdown() then
						M:RegisterEvent("PLAYER_REGEN_ENABLED", setupMisc)
					else
						M.CreateMF(CollectionsJournal)
					end
					done = true
				end
			end)
			M:UnregisterEvent(event, setupMisc)
		elseif event == "PLAYER_REGEN_ENABLED" then
			M.CreateMF(CollectionsJournal)
			M:UnregisterEvent(event, setupMisc)
		end
	end

	M:RegisterEvent("ADDON_LOADED", setupMisc)
end

-- Temporary taint fix
do
	InterfaceOptionsFrameCancel:SetScript("OnClick", function()
		InterfaceOptionsFrameOkay:Click()
	end)

	-- https://www.townlong-yak.com/bugs/Kjq4hm-DisplayModeCommunitiesTaint
	if (UIDROPDOWNMENU_OPEN_PATCH_VERSION or 0) < 1 then
		UIDROPDOWNMENU_OPEN_PATCH_VERSION = 1
		hooksecurefunc("UIDropDownMenu_InitializeHelper", function(frame)
			if UIDROPDOWNMENU_OPEN_PATCH_VERSION ~= 1 then return end

			if UIDROPDOWNMENU_OPEN_MENU and UIDROPDOWNMENU_OPEN_MENU ~= frame and not issecurevariable(UIDROPDOWNMENU_OPEN_MENU, "displayMode") then
				UIDROPDOWNMENU_OPEN_MENU = nil
				local t, f, prefix, i = _G, issecurevariable, " \0", 1
				repeat
					i, t[prefix .. i] = i+1
				until f("UIDROPDOWNMENU_OPEN_MENU")
			end
		end)
	end

	-- https://www.townlong-yak.com/bugs/afKy4k-HonorFrameLoadTaint
	if (UIDROPDOWNMENU_VALUE_PATCH_VERSION or 0) < 2 then
		UIDROPDOWNMENU_VALUE_PATCH_VERSION = 2
		hooksecurefunc("UIDropDownMenu_InitializeHelper", function()
			if UIDROPDOWNMENU_VALUE_PATCH_VERSION ~= 2 then return end

			for i = 1, UIDROPDOWNMENU_MAXLEVELS do
				for j = 1, UIDROPDOWNMENU_MAXBUTTONS do
					local b = _G["DropDownList"..i.."Button"..j]
					if not (issecurevariable(b, "value") or b:IsShown()) then
						b.value = nil
						repeat
							j, b["fx" .. j] = j+1
						until issecurevariable(b, "value")
					end
				end
			end
		end)
	end
end