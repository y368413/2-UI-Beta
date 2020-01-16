local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local TT = M:GetModule("Tooltip")

function S:PGFSkin()
	if not MaoRUISettingDB["Skins"]["BlizzardSkins"] then return end
	if not MaoRUISettingDB["Skins"]["PGFSkin"] then return end
	if not IsAddOnLoaded("PremadeGroupsFilter") then return end

	local tipStyled
	hooksecurefunc(PremadeGroupsFilter.Debug, "PopupMenu_Initialize", function()
		if tipStyled then return end
		for i = 1, 15 do
			local child = select(i, PremadeGroupsFilterDialog:GetChildren())
			if child and child.Shadow then
				TT.ReskinTooltip(child)
				tipStyled = true
				break
			end
		end
	end)

	hooksecurefunc(PremadeGroupsFilterDialog, "SetPoint", function(self, _, parent)
		if parent ~= LFGListFrame then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", LFGListFrame, "TOPRIGHT", 5, R.mult)
		end
	end)

	local pairs = pairs
	local styled
	hooksecurefunc(PremadeGroupsFilterDialog, "Show", function(self)
		if styled then return end

		M.StripTextures(self)
		M.CreateBD(self)
		M.CreateSD(self)
		M.ReskinClose(self.CloseButton)
		M.Reskin(self.ResetButton)
		M.Reskin(self.RefreshButton)
		M.ReskinDropDown(self.Difficulty.DropDown)
		M.StripTextures(self.Advanced)
		M.ReskinInput(self.Expression)

		local names = {"Difficulty", "Ilvl", "Noilvl", "Defeated", "Members", "Tanks", "Heals", "Dps"}
		for _, name in pairs(names) do
			local check = self[name].Act
			if check then
				check:SetSize(26, 26)
				check:SetPoint("TOPLEFT", 5, -3)
				M.ReskinCheck(check)
			end
			local input = self[name].Min
			if input then
				M.ReskinInput(input)
				M.ReskinInput(self[name].Max)
			end
		end

		styled = true
	end)

	M.ReskinCheck(UsePFGButton)
	UsePFGButton.text:SetWidth(35)
end