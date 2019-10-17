--[[
## Version: 2.7
## Author: Cloudyfa
]]


--- Initialization ---
local numTabs = 0
local searchTxt = ''
local filterMats, filterSkill
local CloudyTradeSkillSize = 32
local CloudyTradeSkillDrag = false
local CloudyTradeSkillTooltip = false

--- Create Frame ---
local CloudyTradeSkill = CreateFrame('Frame', 'CloudyTradeSkill')
CloudyTradeSkill:RegisterEvent('PLAYER_LOGIN')
CloudyTradeSkill:RegisterEvent('TRADE_SKILL_LIST_UPDATE')
CloudyTradeSkill:RegisterEvent('TRADE_SKILL_DATA_SOURCE_CHANGED')
LoadAddOn("Blizzard_TradeSkillUI")
--- Local Functions ---
	--- Save Filters ---
	local function saveFilters()
		filterMats = C_TradeSkillUI.GetOnlyShowMakeableRecipes()
		filterSkill = C_TradeSkillUI.GetOnlyShowSkillUpRecipes()
	end

	--- Restore Filters ---
	local function restoreFilters()
		C_TradeSkillUI.SetOnlyShowMakeableRecipes(filterMats)
		C_TradeSkillUI.SetOnlyShowSkillUpRecipes(filterSkill)
	end

	--- Check Current Tab ---
	local function isCurrentTab(self)
		if self.id and IsCurrentSpell(self.id) then
			if TradeSkillFrame:IsShown() and (self.isSub == 0) then
				ShiGuangPerDB["CloudyTradeSkillPanel"] = self.id
				restoreFilters()
			end
			self:SetChecked(true)
			self:RegisterForClicks(nil)
		else
			self:SetChecked(false)
			self:RegisterForClicks('AnyDown')
		end
	end

	--- Add Tab Button ---
	local function addTab(id, index, isSub)
		local name, icon, tabType
		if (id == 134020) then
			name, icon = select(2, C_ToyBox.GetToyInfo(id))
			tabType = 'toy'
		else
			name, _, icon = GetSpellInfo(id)
			if (id == 126462) then
				tabType = 'item'
			else
				tabType = 'spell'
			end
		end
		if (not name) or (not icon) then return end

		local tab = _G['CTradeSkillTab' .. index] or CreateFrame('CheckButton', 'CTradeSkillTab' .. index, TradeSkillFrame, 'SpellBookSkillLineTabTemplate, SecureActionButtonTemplate')
		tab:SetScript('OnEvent', isCurrentTab)
		tab:RegisterEvent('TRADE_SKILL_SHOW')
		tab:RegisterEvent('CURRENT_SPELL_CAST_CHANGED')

		tab.id = id
		tab.isSub = isSub
		tab.tooltip = name
		tab:SetNormalTexture(icon)
		tab:SetAttribute('type', tabType)
		tab:SetAttribute(tabType, id)

		isCurrentTab(tab)
		tab:Show()
	end

	--- Remove Tab Buttons ---
	local function removeTabs()
		for i = 1, numTabs do
			local tab = _G['CTradeSkillTab' .. i]
			if tab and tab:IsShown() then
				tab:UnregisterEvent('TRADE_SKILL_SHOW')
				tab:UnregisterEvent('CURRENT_SPELL_CAST_CHANGED')
				tab:Hide()
			end
		end
	end

	--- Sort Tabs ---
	local function sortTabs()
		local index = 1
		for i = 1, numTabs do
			local tab = _G['CTradeSkillTab' .. i]
			if tab then
				if ShiGuangPerDB["CloudyTradeSkillTabs"][tab.id] == true then
					tab:SetPoint('TOPLEFT', TradeSkillFrame, 'TOPRIGHT', 0, (-44 * index) + (-40 * tab.isSub))
					tab:Show()
					index = index + 1
				else
					tab:Hide()
				end
			end
		end
	end

	--- Check Profession Useable ---
	local function isUseable(id)
		return IsUsableSpell(GetSpellInfo(id))
	end

	--- Update Profession Tabs ---
	local function updateTabs(init)
		if init and ShiGuangPerDB["CloudyTradeSkillPanel"] then return end
		local mainTabs, subTabs = {}, {}

		local _, class = UnitClass('player')
		if class == 'DEATHKNIGHT' and isUseable(53428) then
			tinsert(mainTabs, 53428) --RuneForging
		elseif class == 'ROGUE' and isUseable(1804) then
			tinsert(subTabs, 1804) --PickLock
		end

		if PlayerHasToy(134020) and C_ToyBox.IsToyUsable(134020) then
			tinsert(subTabs, 134020) --ChefHat
		end
		if GetItemCount(87216) ~= 0 then
			tinsert(subTabs, 126462) --ThermalAnvil
		end

		local prof1, prof2, arch, fishing, cooking, firstaid = GetProfessions()
		local profs = {prof1, prof2, cooking, firstaid}
		for _, prof in pairs(profs) do
			local num, offset, _, _, _, spec = select(5, GetProfessionInfo(prof))
			if (spec and spec ~= 0) then num = 1 end
			for i = 1, num do
				if not IsPassiveSpell(offset + i, BOOKTYPE_PROFESSION) then
					local _, id = GetSpellBookItemInfo(offset + i, BOOKTYPE_PROFESSION)
					if (i == 1) then
						tinsert(mainTabs, id)
						if init and not ShiGuangPerDB["CloudyTradeSkillPanel"] then
							ShiGuangPerDB["CloudyTradeSkillPanel"] = id
							return
						end
					else
						tinsert(subTabs, id)
					end
				end
			end
		end

		local sameTabs = true
		for i = 1, #mainTabs + #subTabs do
			local id = mainTabs[i] or subTabs[i - #mainTabs]
			if ShiGuangPerDB["CloudyTradeSkillTabs"][id] == nil then
				ShiGuangPerDB["CloudyTradeSkillTabs"][id] = true
				sameTabs = false
			end
		end

		if not sameTabs or (numTabs ~= #mainTabs + #subTabs) then
			removeTabs()
			numTabs = #mainTabs + #subTabs

			for i = 1, numTabs do
				local id = mainTabs[i] or subTabs[i - #mainTabs]
				addTab(id, i, mainTabs[i] and 0 or 1)
			end
			sortTabs()
		end
	end

	--- Update Frame Size ---
	local function updateSize(forced)
		TradeSkillFrame:SetHeight(CloudyTradeSkillSize * 16 + 96) --496
		TradeSkillFrame.RecipeInset:SetHeight(CloudyTradeSkillSize * 16 + 10) --410
		TradeSkillFrame.DetailsInset:SetHeight(CloudyTradeSkillSize * 16 - 10) --390
		TradeSkillFrame.DetailsFrame:SetHeight(CloudyTradeSkillSize * 16 - 15) --385
		TradeSkillFrame.DetailsFrame.Background:SetHeight(CloudyTradeSkillSize * 16 - 17) --383
		if TradeSkillFrame.RecipeList.FilterBar:IsVisible() then
			TradeSkillFrame.RecipeList:SetHeight(CloudyTradeSkillSize * 16 - 11) --389
		else
			TradeSkillFrame.RecipeList:SetHeight(CloudyTradeSkillSize * 16 + 5) --405
		end
		if forced then
			if #TradeSkillFrame.RecipeList.buttons < floor(CloudyTradeSkillSize, 0.5) + 2 then
				local range = TradeSkillFrame.RecipeList.scrollBar:GetValue()
				HybridScrollFrame_CreateButtons(TradeSkillFrame.RecipeList, 'TradeSkillRowButtonTemplate', 0, 0)
				TradeSkillFrame.RecipeList.scrollBar:SetValue(range)
			end
			TradeSkillFrame.RecipeList:Refresh()
		end
	end

--- Other Adjustment ---
TradeSkillFrame.RankFrame:SetWidth(500)
TradeSkillFrame.SearchBox:SetWidth(310)

--- Refresh RecipeList ---
hooksecurefunc(TradeSkillFrame.RecipeList, 'UpdateFilterBar', function(self)
	if self.FilterBar:IsVisible() then
		self:SetHeight(CloudyTradeSkillSize * 16 - 11) --389
	else
		self:SetHeight(CloudyTradeSkillSize * 16 + 5) --405
	end
end)


--- Refresh RecipeButton ---
TradeSkillFrame.RecipeList:HookScript('OnUpdate', function(self, ...)
	for i = 1, #self.buttons do
		local button = self.buttons[i]
		--- Button Draggable ---
		if not button.CTSDrag then
			button:RegisterForDrag('LeftButton')
			button:SetScript('OnDragStart', function(self)
				if CloudyTradeSkillDrag then
					if not InCombatLockdown() then
						if self.tradeSkillInfo and not self.isHeader then
							PickupSpell(self.tradeSkillInfo.recipeID)
						end
					end
				end
			end)
			button.CTSDrag = true
		end
		--- Button Tooltip ---
		if not button.CTSTip then
			button:HookScript('OnEnter', function(self)
				if CloudyTradeSkillTooltip then
					if self.tradeSkillInfo and not self.isHeader then
						local link = C_TradeSkillUI.GetRecipeLink(self.tradeSkillInfo.recipeID)
						if link then
							GameTooltip:SetOwner(self, 'ANCHOR_LEFT')
							GameTooltip:SetHyperlink(link)
						end
					end
				end
			end)
			button:HookScript('OnLeave', function()
				if CloudyTradeSkillTooltip then
					GameTooltip:Hide()
				end
			end)
			button.CTSTip = true
		end
		--- Required Level ---
			if not button.CTSLevel then
				button.CTSLevel = button:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
				button.CTSLevel:SetPoint('RIGHT', button.Text, 'LEFT', 1, 0)
			end
			if button.tradeSkillInfo and not button.isHeader then
				local recipe = button.tradeSkillInfo.recipeID
				local item = C_TradeSkillUI.GetRecipeItemLink(recipe)
				if item then
					local quality, _, level = select(3, GetItemInfo(item))
					if quality and level and level > 1 then
						button.CTSLevel:SetText(level)
						button.CTSLevel:SetTextColor(GetItemQualityColor(quality))
					else
						button.CTSLevel:SetText('')
					end
				end
			else
				button.CTSLevel:SetText('')
			end
	end
end)


--- Collapse Recipes ---
hooksecurefunc(TradeSkillFrame.RecipeList, 'OnHeaderButtonClicked', function(self, _, info, button)
	if (button ~= 'RightButton') then return end
	local collapsed = self:IsCategoryCollapsed(info.categoryID)
	local subCat = C_TradeSkillUI.GetSubCategories(info.categoryID)
	if subCat then
		collapsed = not self:IsCategoryCollapsed(subCat)
	end
	local allCategories = {C_TradeSkillUI.GetCategories()}
	for _, catId in pairs(allCategories) do
		local subCategories = {C_TradeSkillUI.GetSubCategories(catId)}
		if #subCategories == 0 then
			self.collapsedCategories[catId] = collapsed
		else
			self.collapsedCategories[catId] = false
			for _, subId in pairs(subCategories) do
				self.collapsedCategories[subId] = collapsed
			end
		end
	end
	self:Refresh()
end)


--- Fix SearchBox ---
hooksecurefunc('ChatEdit_InsertLink', function(link)
	if link and TradeSkillFrame:IsShown() then
		local activeWindow = ChatEdit_GetActiveWindow()
		if activeWindow then return end
		if strfind(link, 'item:', 1, true) or strfind(link, 'enchant:', 1, true) then
			local text = strmatch(link, '|h%[(.+)%]|h|r')
			if text then
				text = strmatch(text, ':%s(.+)') or text
				TradeSkillFrame.SearchBox:SetText(text)
			end
		end
	end
end)


--- Fix StackSplit ---
hooksecurefunc('ContainerFrameItemButton_OnModifiedClick', function(self, button)
	if TradeSkillFrame:IsShown() then
		if (button == 'LeftButton') then
			StackSplitFrame:Hide()
		end
	end
end)


--- Druid Unshapeshift ---
local function injectDruidButtons()
	local _, class = UnitClass('player')
	if (class ~= 'DRUID') then return end
	local function injectMacro(button, text)
		local macro = CreateFrame('Button', nil, button:GetParent(), 'MagicButtonTemplate, SecureActionButtonTemplate')
		macro:SetAttribute('type', 'macro')
		macro:SetAttribute('macrotext', SLASH_CANCELFORM1)
		macro:SetPoint(button:GetPoint())
		macro:SetFrameStrata('HIGH')
		macro:SetText(text)
		macro:HookScript('OnClick', button:GetScript('OnClick'))
		button:HookScript('OnDisable', function()
			button:SetAlpha(1)
			macro:SetAlpha(0)
			macro:RegisterForClicks(nil)
		end)
		button:HookScript('OnEnable', function()
			button:SetAlpha(0)
			macro:SetAlpha(1)
			macro:RegisterForClicks('LeftButtonDown')
		end)
	end
	injectMacro(TradeSkillFrame.DetailsFrame.CreateButton, CREATE_PROFESSION)
	injectMacro(TradeSkillFrame.DetailsFrame.CreateAllButton, CREATE_ALL)
end


--- Enchanting Vellum ---
local function injectVellumButton()
	local vellum = CreateFrame('Button', nil, TradeSkillFrame, 'MagicButtonTemplate')
	vellum:SetSize(90, 22)
	vellum:SetPoint('RIGHT', TradeSkillFrame.DetailsFrame.CreateButton, 'LEFT')
	vellum:SetScript('OnClick', function()
		C_TradeSkillUI.CraftRecipe(TradeSkillFrame.DetailsFrame.selectedRecipeID)
		UseItemByName(38682)
	end)
	hooksecurefunc(TradeSkillFrame.DetailsFrame, 'RefreshButtons', function(self)
		if (select(6, C_TradeSkillUI.GetTradeSkillLine()) ~= 333) or C_TradeSkillUI.IsTradeSkillLinked() or not self.createVerbOverride then
			vellum:Hide()
		else
			local recipeInfo = self.selectedRecipeID and C_TradeSkillUI.GetRecipeInfo(self.selectedRecipeID)
			if recipeInfo then
				local numScrolls = min(recipeInfo.numAvailable, GetItemCount(38682))
				if numScrolls > 0 then
					vellum:SetText(CREATE_PROFESSION .. ' [' .. numScrolls .. ']')
					vellum:Enable()
				else
					vellum:SetText(CREATE_PROFESSION)
					vellum:Disable()
				end
				vellum:Show()
			else
				vellum:Hide()
			end
		end
	end)
end

--- Handle Events ---
CloudyTradeSkill:SetScript('OnEvent', function(self, event, ...)
	if (event == 'PLAYER_LOGIN') then
		if not ShiGuangPerDB["CloudyTradeSkillTabs"] then ShiGuangPerDB["CloudyTradeSkillTabs"] = {} end
		updateSize(true)
		updateTabs(true)
		injectDruidButtons()
		injectVellumButton()
	elseif (event == 'TRADE_SKILL_LIST_UPDATE') then
		saveFilters()
		searchTxt = TradeSkillFrame.SearchBox:GetText()
	elseif (event == 'TRADE_SKILL_DATA_SOURCE_CHANGED') then
		if not InCombatLockdown() then updateTabs() end
		TradeSkillFrame.SearchBox:SetText(searchTxt)
	end
end)