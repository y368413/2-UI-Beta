local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")
local TT = M:GetModule("Tooltip")

function S:PGFSkin()
	if not R.db["Skins"]["BlizzardSkins"] then return end
	if not R.db["Skins"]["PGFSkin"] then return end
	if not IsAddOnLoaded("PremadeGroupsFilter") then return end

	local PGFDialog = _G.PremadeGroupsFilterDialog

	local tipStyled
	hooksecurefunc(PremadeGroupsFilter.Debug, "PopupMenu_Initialize", function()
		if tipStyled then return end
		for i = 1, PGFDialog:GetNumChildren() do
			local child = select(i, PGFDialog:GetChildren())
			if child and child.Shadow then
				TT.ReskinTooltip(child)
				tipStyled = true
				break
			end
		end
	end)

	hooksecurefunc(PGFDialog, "SetPoint", function(self, _, parent)
		if parent ~= LFGListFrame then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", LFGListFrame, "TOPRIGHT", 5, 0)
		end
	end)

	local pairs = pairs
	local styled
	hooksecurefunc(PGFDialog, "Show", function(self)
		if styled then return end

		M.StripTextures(self)
		M.SetBD(self):SetAllPoints()
		M.ReskinClose(self.CloseButton)
		M.Reskin(self.ResetButton)
		M.Reskin(self.RefreshButton)
		M.ReskinDropDown(self.Difficulty.DropDown)
		M.ReskinInput(self.Expression)
		M.ReskinInput(self.Sorting.SortingExpression)
		if self.MoveableToggle then
			M.ReskinArrow(self.MoveableToggle, "left")
			self.MoveableToggle:SetPoint("TOPLEFT", 5, -5)
		end
		local button = self.MaxMinButtonFrame
		if button.MinimizeButton then
			M.ReskinArrow(button.MinimizeButton, "down")
			button.MinimizeButton:ClearAllPoints()
			button.MinimizeButton:SetPoint("RIGHT", self.CloseButton, "LEFT", -3, 0)
			M.ReskinArrow(button.MaximizeButton, "up")
			button.MaximizeButton:ClearAllPoints()
			button.MaximizeButton:SetPoint("RIGHT", self.CloseButton, "LEFT", -3, 0)
		end

		local names = {"Difficulty", "Defeated", "Members", "Tanks", "Heals", "Dps", "MPRating", "PVPRating"}
		for _, name in pairs(names) do
			local frame = self[name]
			if frame then
				local check = frame.Act
				if check then
					check:SetSize(26, 26)
					check:SetPoint("TOPLEFT", 5, -3)
					M.ReskinCheck(check)
				end
				local input = frame.Min
				if input then
					M.ReskinInput(input)
					M.ReskinInput(frame.Max)
				end
			else
				print(name)
			end
		end

		styled = true
	end)

	hooksecurefunc(PGFDialog, "SetSize", function(self, width, height)
		if height == 427 then
			self:SetSize(width, 428)
		end
	end)

	M.ReskinCheck(UsePFGButton)
	UsePFGButton.text:SetWidth(35)
end