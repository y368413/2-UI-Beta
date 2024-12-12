local _, ns = ...
local M, R, U, I = unpack(ns)

local function Highlight_OnEnter(self)
	self.hl:Show()
end

local function Highlight_OnLeave(self)
	self.hl:Hide()
end

local function HandleRoleAnchor(self, role)
	self[role.."Count"]:SetWidth(24)
	self[role.."Count"]:SetFontObject(Game13Font)
	self[role.."Count"]:SetPoint("RIGHT", self[role.."Icon"], "LEFT", 1, 0)
end

tinsert(R.defaultThemes, function()
	if not R.db["Skins"]["BlizzardSkins"] then return end

	local r, g, b = I.r, I.g, I.b

	local LFGListFrame = LFGListFrame
	LFGListFrame.NothingAvailable.Inset:Hide()

	-- [[ Category selection ]]

	local categorySelection = LFGListFrame.CategorySelection

	M.Reskin(categorySelection.FindGroupButton)
	M.Reskin(categorySelection.StartGroupButton)
	categorySelection.Inset:Hide()
	categorySelection.CategoryButtons[1]:SetNormalFontObject(GameFontNormal)

	hooksecurefunc("LFGListCategorySelection_AddButton", function(self, btnIndex)
		local bu = self.CategoryButtons[btnIndex]
		if bu and not bu.styled then
			bu.Cover:Hide()
			bu.Icon:SetTexCoord(.01, .99, .01, .99)
			M.CreateBDFrame(bu.Icon)

			bu.styled = true
		end
	end)

	hooksecurefunc("LFGListSearchEntry_Update", function(self)
		local cancelButton = self.CancelButton
		if not cancelButton.styled then
			M.Reskin(cancelButton)
			cancelButton.styled = true
		end
	end)

	hooksecurefunc("LFGListSearchEntry_UpdateExpiration", function(self)
		local expirationTime = self.ExpirationTime
		if not expirationTime.fontStyled then
			expirationTime:SetWidth(42)
			expirationTime.fontStyled = true
		end
	end)

	-- [[ Search panel ]]

	local searchPanel = LFGListFrame.SearchPanel

	M.Reskin(searchPanel.RefreshButton)
	M.Reskin(searchPanel.BackButton)
	M.Reskin(searchPanel.BackToGroupButton)
	M.Reskin(searchPanel.SignUpButton)
	M.ReskinInput(searchPanel.SearchBox)
	searchPanel.SearchBox:SetHeight(22)
	M.ReskinFilterButton(searchPanel.FilterButton)
	M.ReskinFilterReset(searchPanel.FilterButton.ResetButton)

	searchPanel:HookScript("OnShow", function(self)
		self.FilterButton:SetSize(90, 21) -- needs review, fix blizzard weired size
	end)

	searchPanel.RefreshButton:SetSize(24, 24)
	searchPanel.RefreshButton.Icon:SetPoint("CENTER")
	searchPanel.ResultsInset:Hide()
	M.StripTextures(searchPanel.AutoCompleteFrame)

	local numResults = 1
	hooksecurefunc("LFGListSearchPanel_UpdateAutoComplete", function(self)
		local AutoCompleteFrame = self.AutoCompleteFrame

		for i = numResults, #AutoCompleteFrame.Results do
			local result = AutoCompleteFrame.Results[i]

			if numResults == 1 then
				result:SetPoint("TOPLEFT", AutoCompleteFrame.LeftBorder, "TOPRIGHT", -8, 1)
				result:SetPoint("TOPRIGHT", AutoCompleteFrame.RightBorder, "TOPLEFT", 5, 1)
			else
				result:SetPoint("TOPLEFT", AutoCompleteFrame.Results[i-1], "BOTTOMLEFT", 0, 1)
				result:SetPoint("TOPRIGHT", AutoCompleteFrame.Results[i-1], "BOTTOMRIGHT", 0, 1)
			end

			result:SetNormalTexture(0)
			result:SetPushedTexture(0)
			result:SetHighlightTexture(0)

			local bg = M.CreateBDFrame(result, .5)
			local hl = result:CreateTexture(nil, "BACKGROUND")
			hl:SetInside(bg)
			hl:SetTexture(I.bdTex)
			hl:SetVertexColor(r, g, b, .25)
			hl:Hide()
			result.hl = hl

			result:HookScript("OnEnter", Highlight_OnEnter)
			result:HookScript("OnLeave", Highlight_OnLeave)

			numResults = numResults + 1
		end
	end)

	local function skinCreateButton(button)
		local child = button:GetChildren()
		if not child.styled and child:IsObjectType("Button") then
			M.Reskin(child)
			child.styled = true
		end
	end

	local delayStyled -- otherwise it taints while listing
	hooksecurefunc(searchPanel.ScrollBox, "Update", function(self)
		if not delayStyled then
			M.Reskin(self.StartGroupButton)
			M.ReskinTrimScroll(searchPanel.ScrollBar)
			delayStyled = true
		end
		self:ForEachFrame(skinCreateButton)
	end)

	-- [[ Application viewer ]]

	local applicationViewer = LFGListFrame.ApplicationViewer
	applicationViewer.InfoBackground:Hide()
	applicationViewer.Inset:Hide()

	local prevHeader
	for _, headerName in pairs({"NameColumnHeader", "RoleColumnHeader", "ItemLevelColumnHeader", "RatingColumnHeader"}) do
		local header = applicationViewer[headerName]

		M.StripTextures(header)
		M.SetFontSize(header.Label, 14)
		header.Label:SetShadowColor(0, 0, 0, 0)
		header:SetHighlightTexture(0)

		local bg = M.CreateBDFrame(header, .25)
		local hl = header:CreateTexture(nil, "BACKGROUND")
		hl:SetInside(bg)
		hl:SetTexture(I.bdTex)
		hl:SetVertexColor(r, g, b, .25)
		hl:Hide()
		header.hl = hl

		header:HookScript("OnEnter", Highlight_OnEnter)
		header:HookScript("OnLeave", Highlight_OnLeave)

		if prevHeader then
			header:SetPoint("LEFT", prevHeader, "RIGHT", R.mult, 0)
		end
		prevHeader = header
	end

	M.Reskin(applicationViewer.RefreshButton)
	M.Reskin(applicationViewer.RemoveEntryButton)
	M.Reskin(applicationViewer.EditButton)
	M.Reskin(applicationViewer.BrowseGroupsButton)
	M.ReskinCheck(applicationViewer.AutoAcceptButton)
	M.ReskinTrimScroll(applicationViewer.ScrollBar)

	applicationViewer.RefreshButton:SetSize(24, 24)
	applicationViewer.RefreshButton.Icon:SetPoint("CENTER")

	hooksecurefunc("LFGListApplicationViewer_UpdateApplicant", function(button)
		if not button.styled then
			M.Reskin(button.DeclineButton)
			M.Reskin(button.InviteButton)
			M.Reskin(button.InviteButtonSmall)

			button.styled = true
		end
	end)

	-- [[ Entry creation ]]

	local entryCreation = LFGListFrame.EntryCreation
	entryCreation.Inset:Hide()
	M.StripTextures(entryCreation.Description)
	M.Reskin(entryCreation.ListGroupButton)
	M.Reskin(entryCreation.CancelButton)
	M.ReskinInput(entryCreation.Description)
	M.ReskinInput(entryCreation.Name)
	M.ReskinInput(entryCreation.ItemLevel.EditBox)
	M.ReskinInput(entryCreation.VoiceChat.EditBox)
	M.ReskinDropDown(entryCreation.GroupDropdown)
	M.ReskinDropDown(entryCreation.ActivityDropdown)
	M.ReskinDropDown(entryCreation.PlayStyleDropdown)
	M.ReskinCheck(entryCreation.MythicPlusRating.CheckButton)
	M.ReskinInput(entryCreation.MythicPlusRating.EditBox)
	M.ReskinCheck(entryCreation.PVPRating.CheckButton)
	M.ReskinInput(entryCreation.PVPRating.EditBox)
	if entryCreation.PvpItemLevel then -- I do believe blizz will rename Pvp into PvP in future build
		M.ReskinCheck(entryCreation.PvpItemLevel.CheckButton)
		M.ReskinInput(entryCreation.PvpItemLevel.EditBox)
	end
	M.ReskinCheck(entryCreation.ItemLevel.CheckButton)
	M.ReskinCheck(entryCreation.VoiceChat.CheckButton)
	M.ReskinCheck(entryCreation.PrivateGroup.CheckButton)
	M.ReskinCheck(entryCreation.CrossFactionGroup.CheckButton)

	-- [[ Role count ]]

	hooksecurefunc("LFGListGroupDataDisplayRoleCount_Update", function(self)
		if not self.styled then
			M.ReskinSmallRole(self.TankIcon, "TANK")
			M.ReskinSmallRole(self.HealerIcon, "HEALER")
			M.ReskinSmallRole(self.DamagerIcon, "DPS")
			-- fix for PGFinder
			self.DamagerIcon:ClearAllPoints()
			self.DamagerIcon:SetPoint("RIGHT", -11, 0)

			self.HealerIcon:SetPoint("RIGHT", self.DamagerIcon, "LEFT", -22, 0)
			self.TankIcon:SetPoint("RIGHT", self.HealerIcon, "LEFT", -22, 0)

			HandleRoleAnchor(self, "Tank")
			HandleRoleAnchor(self, "Healer")
			HandleRoleAnchor(self, "Damager")

			self.styled = true
		end
	end)

	hooksecurefunc("LFGListGroupDataDisplayPlayerCount_Update", function(self)
		if not self.styled then
			self.Count:SetWidth(24)

			self.styled = true
		end
	end)

	-- Activity finder

	local activityFinder = entryCreation.ActivityFinder
	activityFinder.Background:SetTexture("")

	local finderDialog = activityFinder.Dialog
	M.StripTextures(finderDialog)
	M.SetBD(finderDialog)
	M.Reskin(finderDialog.SelectButton)
	M.Reskin(finderDialog.CancelButton)
	M.ReskinInput(finderDialog.EntryBox)
	M.ReskinTrimScroll(finderDialog.ScrollBar)

	-- [[ Application dialog ]]

	local LFGListApplicationDialog = LFGListApplicationDialog

	M.StripTextures(LFGListApplicationDialog)
	M.SetBD(LFGListApplicationDialog)
	M.StripTextures(LFGListApplicationDialog.Description)
	M.CreateBDFrame(LFGListApplicationDialog.Description, .25)
	M.Reskin(LFGListApplicationDialog.SignUpButton)
	M.Reskin(LFGListApplicationDialog.CancelButton)

	-- [[ Invite dialog ]]

	local LFGListInviteDialog = LFGListInviteDialog

	M.StripTextures(LFGListInviteDialog)
	M.SetBD(LFGListInviteDialog)
	M.Reskin(LFGListInviteDialog.AcceptButton)
	M.Reskin(LFGListInviteDialog.DeclineButton)
	M.Reskin(LFGListInviteDialog.AcknowledgeButton)
end)