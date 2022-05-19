local modName, core = ...
core.UI = {}

local Localization = core.Localization
local Config = core.Config
local Helper = core.Helper
local Cache = core.Cache
local Main = core.Main
local UI = core.UI

UI.isInitialized = false
UI.name = modName
UI.activeFilterId = 0

local NEW_TAB_COUNT = 10 --should be 4 (3 default tabs + addon)
--but assuming that we can have another addon with tabs initialized before this one
local ADDON_CONTAINER_WIDTH = 504
local ADDON_CONTAINER_HEIGHT = 440
local ADDON_SCROLL_BAR_WIDTH = 26
local ADDON_BUTTONS_PADDING = 8

local ADDON_TAB_INDEX  --set after init
local function setAddonTabIndex()
    local nextTabIndex = 0
    repeat
        nextTabIndex = nextTabIndex + 1
    until not _G["AchievementFrameTab" .. nextTabIndex]
    ADDON_TAB_INDEX = nextTabIndex
    return nextTabIndex
end

local function sortByCompletion(achievementIds)
    local complete, incomplete = {}, {}

    for i = 1, #achievementIds do
        local achievementId = achievementIds[i]
        local completed = select(4, GetAchievementInfo(achievementId))
        if (completed) then
            tinsert(complete, achievementId)
        else
            tinsert(incomplete, achievementId)
        end
    end

    return complete, incomplete
end

local function sortByGuild(achievementIds)
    local player, guild = {}, {}

    for i = 1, #achievementIds do
        local achievementId = achievementIds[i]
        local isGuild = select(12, GetAchievementInfo(achievementId))
        if (isGuild) then
            tinsert(guild, achievementId)
        else
            tinsert(player, achievementId)
        end
    end

    return player, guild
end

local function sortAchievements(achievementIds)
    local result = {}
    local insertToResult = function(id)
        tinsert(result, id)
    end
    local complete, incomplete = sortByCompletion(achievementIds)

    local completePlayer, completeGuild = sortByGuild(complete)
    local incompletePlayer, incompleteGuild = sortByGuild(incomplete)

    local currentFilter = AchievementFrameFilterDropDown.value
    if (currentFilter == 2) then
        --complete
        result = completePlayer
        Helper:ForEach(completeGuild, insertToResult)
    elseif (currentFilter == 3) then
        --incomplete
        result = incompletePlayer
        Helper:ForEach(incompleteGuild, insertToResult)
    else
        --all
        result = completePlayer
        Helper:ForEach(completeGuild, insertToResult)
        Helper:ForEach(incompletePlayer, insertToResult)
        Helper:ForEach(incompleteGuild, insertToResult)
    end

    return result
end

local function filterBySearchText(ids)
    local searchText = AchievementFrame.searchBox:GetText()
    if (Helper:IsNilOrEmpty(searchText)) then
        return ids
    end
    local filteredByText = {}
    local function filterByText(id)
        local rewardText = select(11, GetAchievementInfo(id))
        local hasSearchText = string.match(string.lower(rewardText), string.lower(searchText)) ~= nil
        if (hasSearchText) then
            table.insert(filteredByText, id)
        end
    end
    Helper:Filter(ids, filterByText)
    return filteredByText
end

local function updateCategoryButtonText(filterId, count)
    Helper:ForEach(
        UI.leftPanel.buttons,
        function(button)
            if (button.filterId == filterId) then
                local text = button.originalText
                if (count ~= "") then
                    local textWithCount = text .. " (" .. count .. ")"
                    button.label:SetText(textWithCount)
                end
            end
        end
    )
end

local function getFilteredAchievements()
    local filterId = UI.activeFilterId
    local result = {}
    if (filterId == 1) then
        result = Cache:GetRewards()
    elseif (filterId == 2) then
        result = Cache:GetMounts()
    elseif (filterId == 3) then
        result = Cache:GetPets()
    elseif (filterId == 4) then
        result = Cache:GetTitles()
    elseif (filterId == 5) then
        result = Cache:GetToys()
    elseif (filterId == 9) then
        result = Cache:GetOther()
    elseif (filterId == 10) then
        result = Cache:GetNonValid()
    end
    updateCategoryButtonText(filterId, #result)
    if (result) then
        local search = filterBySearchText(result)
        local sorted = sortAchievements(search)
        return sorted
    end
    return result
end

local function DefaultTabsText_SetToClosedState()
    for i = 1, NEW_TAB_COUNT do
        local tab = _G["AchievementFrameTab" .. i]
        if (not tab) then
            break
        end
        tab.text:SetPoint("CENTER", 0, -3)
    end
end

local function TabButtonText_SetToClosedState()
    UI.tabButton.text:SetPoint("CENTER", 0, -3)
end

local function TabButtonText_SetToOpenedState()
    UI.tabButton.text:SetPoint("CENTER", 0, -5)
end

local function AchievementFrameTabs_OnClick_hook()
    TabButtonText_SetToClosedState()
    Helper:Log("Default tab clicked")
end

local function hookDefaultTabsClicks()
    for i = 1, NEW_TAB_COUNT do
        tab = _G["AchievementFrameTab" .. i]
        if (tab and i ~= ADDON_TAB_INDEX) then
            tab:HookScript("OnClick", AchievementFrameTabs_OnClick_hook)
        end
    end
end

local function custom_AchievementButton_Expand(self, isGuild, height)
    if (not self.collapsed and self:GetHeight() == height) then
        return
    end

    self.collapsed = nil
    AchievementButton_UpdatePlusMinusTexture(self)
    if (isGuild) then
        if (self.completed) then
            self.tabard:Show()
            self.shield:SetFrameLevel(self.tabard:GetFrameLevel() + 1)
            SetLargeGuildTabardTextures("player", self.tabard.emblem, self.tabard.background, self.tabard.border)
        end
        self.guildCornerL:Show()
        self.guildCornerR:Show()
    end
    self:SetHeight(height)
    self.background:SetTexCoord(0, 1, max(0, 1 - (height / 256)), 1)
end

local function custom_AchievementButton_Saturate(self, isGuild)
    if (isGuild) then
        if (self.completed) then
        else
        end
        self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal")
        self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders")
        self.titleBar:SetTexCoord(0, 1, 0.83203125, 0.91015625)
        self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB())
        self.shield.points:SetVertexColor(0, 1, 0)
        self.saturatedStyle = "guild"
    else
        if (self.completed) then
        else
        end
        self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal")
        if (self.accountWide) then
            self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader")
            self.titleBar:SetTexCoord(0, 1, 0, 0.375)
            self:SetBackdropBorderColor(ACHIEVEMENT_BLUE_BORDER_COLOR:GetRGB())
            self.saturatedStyle = "account"
        else
            self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders")
            self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125)
            self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB())
            self.saturatedStyle = "normal"
        end
        self.shield.points:SetVertexColor(1, 1, 1)
    end
    self.glow:SetVertexColor(1.0, 1.0, 1.0)
    self.icon:Saturate()
    self.shield:Saturate()
    self.reward:SetVertexColor(1, .82, 0)
    self.label:SetVertexColor(1, 1, 1)
    self.description:SetTextColor(0, 0, 0, 1)
    self.description:SetShadowOffset(0, 0)
    AchievementButton_UpdatePlusMinusTexture(self)
end

local function custom_AchievementButton_Desaturate(self, isGuild)
    self.saturatedStyle = nil
    if (isGuild) then
        self.background:SetTexture("Interface\\AchievementFrame\\UI-GuildAchievement-Parchment-Horizontal-Desaturated")
        self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders")
        self.titleBar:SetTexCoord(0, 1, 0.74609375, 0.82421875)
    else
        self.background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated")
        if (self.accountWide) then
            self.titleBar:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader")
            self.titleBar:SetTexCoord(0, 1, 0.40625, 0.78125)
        else
            self.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders")
            self.titleBar:SetTexCoord(0, 1, 0.91796875, 0.99609375)
        end
    end
    self.glow:SetVertexColor(.22, .17, .13)
    self.icon:Desaturate()
    self.shield:Desaturate()
    self.shield.points:SetVertexColor(.65, .65, .65)
    self.reward:SetVertexColor(.8, .8, .8)
    self.label:SetVertexColor(.65, .65, .65)
    self.description:SetTextColor(1, 1, 1, 1)
    self.description:SetShadowOffset(1, -1)
    AchievementButton_UpdatePlusMinusTexture(self)
    self:SetBackdropBorderColor(.5, .5, .5)
end

local function custom_AchievementButton_ToggleGuildTextures(button, isGuild)
    local textureOffset = isGuild and 0.5 or 0
    if (isGuild) then
        button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild")
        button.icon.frame:SetTexCoord(0.25976563, 0.40820313, 0.50000000, 0.64453125)
        button.icon.frame:SetPoint("CENTER", 0, 2)
        button.glow:SetTexCoord(0, 1, 0.26171875, 0.51171875)
        button.titleBar:SetAlpha(1)
    else
        button.icon.frame:SetTexture("Interface\\AchievementFrame\\UI-Achievement-IconFrame")
        button.icon.frame:SetTexCoord(0, 0.5625, 0, 0.5625)
        button.icon.frame:SetPoint("CENTER", -1, 2)
        button.glow:SetTexCoord(0, 1, 0.00390625, 0.25390625)
        local buttonTitleBarAlpha = button.completed and 1 or 0.5
        button.titleBar:SetAlpha(buttonTitleBarAlpha)
    end
    if (button.completed) then
        button.shield.icon:SetTexCoord(0, 0.5, textureOffset, textureOffset + 0.5)
    else
        button.shield.icon:SetTexCoord(0.5, 1, textureOffset, textureOffset + 0.5)
    end
end

local function custom_AchievementButton_DisplayAchievement(button, achievementIndex, achievmentId, selectionId)
    local id,
        name,
        points,
        completed,
        month,
        day,
        year,
        description,
        flags,
        icon,
        rewardText,
        isGuild,
        wasEarnedByMe,
        earnedBy = GetAchievementInfo(achievmentId)

    if (not id) then
        button:Hide()
        return
    else
        button:Show()
    end

    button.index = achievementIndex
    button.element = true

    if (button.id ~= id) then
        local saturatedStyle
        if (bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT) then
            button.accountWide = true
            saturatedStyle = "account"
        else
            button.accountWide = nil
            if (isGuild) then
                saturatedStyle = "guild"
            else
                saturatedStyle = "normal"
            end
        end
        button.id = id
        button.label:SetWidth(ACHIEVEMENTBUTTON_LABELWIDTH)
        button.label:SetText(name)

        if (GetPreviousAchievement(id)) then
            -- If this is a progressive achievement, show the total score.
            AchievementShield_SetPoints(
                AchievementButton_GetProgressivePoints(id),
                button.shield.points,
                AchievementPointsFont,
                AchievementPointsFontSmall
            )
        else
            AchievementShield_SetPoints(points, button.shield.points, AchievementPointsFont, AchievementPointsFontSmall)
        end

        if (points > 0) then
            button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]])
        else
            button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]])
        end

        if (isGuild) then
            button.shield.points:Show()
            button.shield.wasEarnedByMe = nil
            button.shield.earnedBy = nil
        else
            button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe)
            button.shield.earnedBy = earnedBy
        end

        button.shield.id = id
        button.description:SetText(description)
        button.hiddenDescription:SetText(description)
        local _, fontHeight = button.description:GetFont()
        button.numLines = ceil(button.hiddenDescription:GetHeight() / fontHeight)
        button.icon.texture:SetTexture(icon)
        if (completed or wasEarnedByMe) then
            button.completed = true
            button.dateCompleted:SetText(FormatShortDate(day, month, year))
            button.dateCompleted:Show()
            if (button.saturatedStyle ~= saturatedStyle) then
                button:Saturate(isGuild)
            end
        else
            button.completed = nil
            button.dateCompleted:Hide()
            button:Desaturate(isGuild)
        end
        --new function to switch between guild and default achievement textures
        custom_AchievementButton_ToggleGuildTextures(button, isGuild)

        if (rewardText == "") then
            button.reward:Hide()
            button.rewardBackground:Hide()
        else
            button.reward:SetText(rewardText)
            button.reward:Show()
            button.rewardBackground:Show()
            if (button.completed) then
                button.rewardBackground:SetVertexColor(1, 1, 1)
            else
                button.rewardBackground:SetVertexColor(0.35, 0.35, 0.35)
            end
        end
        if (IsTrackedAchievement(id)) then
            button.check:Show()
            button.label:SetWidth(button.label:GetStringWidth() + 4) -- This +4 here is to fudge around any string width issues that arize from resizing a string set to its string width. See bug 144418 for an example.
            button.tracked:SetChecked(true)
            button.tracked:Show()
        else
            button.check:Hide()
            button.tracked:SetChecked(false)
            button.tracked:Hide()
        end
        AchievementButton_UpdatePlusMinusTexture(button)
    end

    if (id == selectionId) then
        local achievements = UI.container

        achievements.selection = button.id
        achievements.selectionIndex = button.index

        button.selected = true
        button.highlight:Show()
        local height = AchievementButton_DisplayObjectives(button, button.id, button.completed, false)
        if (height == ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT) then
            button:Collapse()
        else
            button:Expand(isGuild, height)
        end
        if (not completed or (not wasEarnedByMe and not isGuild)) then
            button.tracked:Show()
        end
    elseif (button.selected) then
        button.selected = nil
        if (not button:IsMouseOver()) then
            button.highlight:Hide()
        end
        button:Collapse()
        button.description:Show()
        button.hiddenDescription:Hide()
    end
end

local function fixButtonHighlightBug()
    local function hideHighlight(button)
        if (not button.selected and not button:IsMouseOver()) then
            button.highlight:Hide()
        end
    end
    Helper:ForEach(UI.container.scrollFrame.buttons, hideHighlight)
end

local function updateAchievements()
    local container = UI.container
    if (container:IsVisible() == false) then
        return
    end
    local achievementsIds = getFilteredAchievements()
    if (achievementsIds == nil) then
        achievementsIds = {}
    end

    local scrollFrame = UI.container.scrollFrame

    local offset = HybridScrollFrame_GetOffset(scrollFrame)
    local buttons = scrollFrame.buttons
    local achievementsCount = #achievementsIds
    local buttonsCount = #buttons

    local selection = container.selection
    if (selection) then
        AchievementButton_ResetObjectives()
    end

    local extraHeight = scrollFrame.largeButtonHeight or ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT

    local displayedHeight = 0
    for i = 1, buttonsCount do
        local button = buttons[i]
        button:Show()
        local achievementIndex = i + offset
        if (achievementIndex > achievementsCount) then
            button:Hide()
        else
            local id = achievementsIds[achievementIndex]
            custom_AchievementButton_DisplayAchievement(button, achievementIndex, id, container.selection)
            displayedHeight = displayedHeight + button:GetHeight()
        end
    end
    local totalHeight = achievementsCount * ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT
    totalHeight = totalHeight + (extraHeight - ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT)

    HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight)

    if (selection) then
        container.selection = selection
    else
        HybridScrollFrame_CollapseButton(scrollFrame)
    end
end

local function updateAchievementsAndResetScroll()
    local scrollBar = UI.container.scrollBar
    scrollBar:SetValue(0)
    updateAchievements()
end

local function hideSearchPreview()
    local container = UI.container
    if (container:IsVisible()) then
        AchievementFrame_HideSearchPreview()
    end
end

local function forceUpdateAchievements()
    local container = UI.container
    if (container:IsVisible() == false) then
        return
    end
    if (container.selection) then
        local nextID = GetNextAchievement(container.selection)
        local id, _, _, completed = GetAchievementInfo(container.selection)
        if (nextID and completed) then
            container.selection = nil
        end
    end
    AchievementFrameAchievementsObjectives:Hide()
    AchievementFrameAchievementsObjectives.id = nil

    Helper:ForEach(
        container.scrollFrame.buttons,
        function(button)
            button.id = nil
        end
    )

    updateAchievements()
end

local function custom_AchievementFrameAchievements_SelectButton(button)
    Helper:Log("Achievement with id - " .. button.id .. " selected")
    local achievements = UI.container

    achievements.selection = button.id
    achievements.selectionIndex = button.index

    button.selected = true
end

local function custom_AchievementFrameAchievements_ClearSelection()
    AchievementButton_ResetObjectives()
    for _, button in next, UI.container.scrollFrame.buttons do
        button:Collapse()
        if (not button:IsMouseOver()) then
            button.highlight:Hide()
        end
        button.selected = nil
        if (not button.tracked:GetChecked()) then
            button.tracked:Hide()
        end
        button.description:Show()
        button.hiddenDescription:Hide()
    end

    UI.container.selection = nil
end

local function custom_AchievementButton_OnClick(self)
    local scrollFrame = UI.container.scrollFrame
    if (IsModifiedClick()) then
        local handled = nil
        if (IsModifiedClick("CHATLINK")) then
            local achievementLink = GetAchievementLink(self.id)
            if (achievementLink) then
                handled = ChatEdit_InsertLink(achievementLink)
                if (not handled and SocialPostFrame and Social_IsShown()) then
                    Social_InsertLink(achievementLink)
                    handled = true
                end
            end
        end
        if (not handled and IsModifiedClick("QUESTWATCHTOGGLE")) then
            AchievementButton_ToggleTracking(self.id)
            forceUpdateAchievements()
            Helper:Log("Toggle tracking for achievement with id - " .. self.id)
        end
        return
    end

    if (self.selected) then
        if (not self:IsMouseOver()) then
            self.highlight:Hide()
        end
        custom_AchievementFrameAchievements_ClearSelection()
        HybridScrollFrame_CollapseButton(scrollFrame)
        updateAchievements()
        return
    end
    custom_AchievementFrameAchievements_ClearSelection()
    custom_AchievementFrameAchievements_SelectButton(self)
    custom_AchievementButton_DisplayAchievement(self, self.index, self.id, UI.container.selection)
    HybridScrollFrame_ExpandButton(
        scrollFrame,
        ((self.index - 1) * ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT),
        self:GetHeight()
    )
    updateAchievements()
end

local function custom_AchievementButtonShield_OnClick(self)
    local parent = self:GetParent()
    custom_AchievementButton_OnClick(parent)
end

local function TabButton_OnClick(self, button)
    PanelTemplates_Tab_OnClick(self, AchievementFrame)
    AchievementFrame_ShowSubFrame(self.container, self.leftPanel)
    AchievementFrameCategoriesContainer:Hide()
    AchievementFrameFilterDropDown:Show()
    AchievementFrameHeaderLeftDDLInset:Show()
    AchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1)
    AchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark")
    DefaultTabsText_SetToClosedState()
    TabButtonText_SetToOpenedState()
    forceUpdateAchievements()
    Helper:Log("Addon tab clicked")
end

local function LeftPanelButton_OnClick(self)
    Helper:Log(self.label:GetText() .. " clicked")
    UI.activeFilterId = self.filterId
    local scrollBar = UI.container.scrollBar
    scrollBar:SetValue(0)
    UI.container.selection = nil
    forceUpdateAchievements()
    Helper:ForEach(
        UI.leftPanel.buttons,
        function(button)
            button:UnlockHighlight()
        end
    )
    self:LockHighlight()
end

local function LeftPanel_OnShow(self)
    AchievementFrameCategoriesContainer:Hide()
    AchievementFrameCategoriesContainerScrollBar:Hide()
end

local function LeftPanel_OnHide(self)
    AchievementFrameCategoriesContainer:Show()
end

local function custom_AchievementButton_OnLoad(button)
    button:SetScript("OnClick", custom_AchievementButton_OnClick)
    button.shield:SetScript("OnClick", custom_AchievementButtonShield_OnClick)
    button.tracked:HookScript("OnClick", forceUpdateAchievements)
    button.Saturate = custom_AchievementButton_Saturate
    button.Desaturate = custom_AchievementButton_Desaturate
    button.Expand = custom_AchievementButton_Expand
    button:Hide()
end

local function Container_CreateButtons(container)
    local scrollFrame = container.scrollFrame
    local scrollBar = container.scrollBar
    _G[UI.name .. "ContainerScrollBarBG"]:Show()
    HybridScrollFrame_CreateButtons(scrollFrame, "AchievementTemplate", 0, -2)
    Helper:ForEach(scrollFrame.buttons, custom_AchievementButton_OnLoad)
    scrollBar:Hide()
    container.selection = nil
end

local function ScrollBar_OnValueChanged(self, value, ...)
    updateAchievements()
    fixButtonHighlightBug()
end

local function createTabButton()
    setAddonTabIndex()
    local lastTabIndex = ADDON_TAB_INDEX - 1

    --tab button
    local tabButton =
        CreateFrame(
        "Button",
        "AchievementFrameTab" .. ADDON_TAB_INDEX,
        AchievementFrame,
        "AchievementFrameTabButtonTemplate"
    )
    local tabText = Config.useAddonNameAsTabName and UI.name or Localization.ADDON_TAB_TEXT
    tabButton:SetText(tabText)
    tabButton:SetPoint("LEFT", "AchievementFrameTab" .. lastTabIndex, "RIGHT", -5, 0)
    tabButton:SetID(ADDON_TAB_INDEX)

    tabButton:SetScript("OnClick", TabButton_OnClick)

    PanelTemplates_SetNumTabs(AchievementFrame, ADDON_TAB_INDEX)

    return tabButton
end

local function createLeftPanelButton(text, filterId, filterKey, parent, anchor)
    local button =
        CreateFrame("Button", UI.name .. "CategoriesContainerButton" .. filterId, parent, "AchievementCategoryTemplate")
    button:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, 0)
    button:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 0, 0)
    button.originalText = text
    button:SetScript("OnClick", LeftPanelButton_OnClick)
    button.filterId = filterId
    button.filterKey = filterKey
    button.label:SetText(text)

    local cacheParams = Cache:GetCacheParameters()
    local count = cacheParams[filterKey].filteredCount
    if (count ~= "") then
        local textWithCount = text .. " (" .. count .. ")"
        button.label:SetText(textWithCount)
    end

    table.insert(parent.buttons, button)

    return button
end

local function fillLeftPanelWithButtons(leftPanel)
    local buttons = {
        {text = Localization.LEFT_PANEL_REWARD_BUTTON_TEXT, filterId = 1, filterKey = Config.DB_KEYS.REWARDS},
        {text = Localization.LEFT_PANEL_MOUNT_BUTTON_TEXT, filterId = 2, filterKey = Config.DB_KEYS.MOUNTS},
        {text = Localization.LEFT_PANEL_PET_BUTTON_TEXT, filterId = 3, filterKey = Config.DB_KEYS.PETS},
        {text = Localization.LEFT_PANEL_TITLE_BUTTON_TEXT, filterId = 4, filterKey = Config.DB_KEYS.TITLES},
        {text = Localization.LEFT_PANEL_TOY_BUTTON_TEXT, filterId = 5, filterKey = Config.DB_KEYS.TOYS},
        {text = Localization.LEFT_PANEL_OTHER_BUTTON_TEXT, filterId = 9, filterKey = Config.DB_KEYS.OTHER},
        {text = Localization.LEFT_PANEL_NONVALID_BUTTON_TEXT, filterId = 10, filterKey = Config.DB_KEYS.NONVALID}
    }

    leftPanel.buttons = {}
    local prevButton = nil
    for i = 1, #buttons do
        local button = buttons[i]
        if (not prevButton) then
            prevButton = createLeftPanelButton(button.text, button.filterId, button.filterKey, leftPanel, leftPanel)
            prevButton:SetPoint("TOPLEFT", leftPanel, "TOPLEFT", -4, 0)
            prevButton:SetPoint("TOPRIGHT", leftPanel, "TOPRIGHT", 4, 0)
        else
            prevButton = createLeftPanelButton(button.text, button.filterId, button.filterKey, leftPanel, prevButton)
        end
    end
end

local function createLeftPanel()
    -- left panel
    local leftPanelName = UI.name .. "CategoriesContainer"
    local leftPanel = CreateFrame("Frame", leftPanelName, AchievementFrameCategories)
    leftPanel:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPLEFT", 9, -5)
    leftPanel:SetPoint("TOPRIGHT", AchievementFrameCategories, "TOPRIGHT", -9, -5)
    leftPanel:SetPoint("BOTTOM", AchievementFrameCategories, "BOTTOM", 0, 8)

    leftPanel:SetScript("OnShow", LeftPanel_OnShow)
    leftPanel:SetScript("OnHide", LeftPanel_OnHide)

    fillLeftPanelWithButtons(leftPanel)

    leftPanel:Hide()

    tinsert(ACHIEVEMENTFRAME_SUBFRAMES, leftPanelName)

    return leftPanel
end

local function createContainer()
    --achivements container
    local container = CreateFrame("Frame", UI.name, AchievementFrame)
    container:SetWidth(ADDON_CONTAINER_WIDTH)
    container:SetHeight(ADDON_CONTAINER_HEIGHT)
    container:SetPoint("TOPLEFT", AchievementFrame, "TOPLEFT", 218, -19)
    container:SetPoint("BOTTOMLEFT", AchievementFrame, "BOTTOMLEFT", 218, 20)

    --bg
    local containerBG = container:CreateTexture("$parentBackground", "BACKGROUND")
    containerBG:SetPoint("TOPLEFT", container, "TOPLEFT", 3, -3)
    containerBG:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -3, 3)
    containerBG:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementBackground")
    containerBG:SetTexCoord(0, 1, 0, 0.5)

    --border
    local containerBorder = CreateFrame("Frame", nil, container, "BackdropTemplate")
    containerBorder:SetAllPoints(container)
    containerBorder:SetBackdrop(
        {
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = {left = 5, right = 5, top = 5, bottom = 5}
        }
    )
    containerBorder:SetBackdropBorderColor(
        ACHIEVEMENT_GOLD_BORDER_COLOR.r,
        ACHIEVEMENT_GOLD_BORDER_COLOR.g,
        ACHIEVEMENT_GOLD_BORDER_COLOR.b
    )
    containerBorder:SetFrameLevel(containerBorder:GetFrameLevel() + 1)

    --scroll
    local scrollFrame = CreateFrame("ScrollFrame", "$parentContainer", container, "HybridScrollFrameTemplate")
    scrollFrame:SetWidth(ADDON_CONTAINER_WIDTH)
    scrollFrame:SetHeight(ADDON_CONTAINER_HEIGHT)
    scrollFrame:SetPoint("TOPLEFT", container, "TOPLEFT", 4, -3)
    scrollFrame:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", 0, 5)

    container.scrollFrame = scrollFrame

    --scrollBar
    local scrollBar = CreateFrame("Slider", "$parentScrollBar", scrollFrame, "HybridScrollBarTemplate")
    scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 1, -16)
    scrollBar:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 1, 12)

    scrollBar.Show = function(self)
        container:SetWidth(ADDON_CONTAINER_WIDTH)
        for _, button in next, container.scrollFrame.buttons do
            button:SetWidth(container:GetWidth() - ADDON_BUTTONS_PADDING)
        end
        getmetatable(self).__index.Show(self)
    end

    scrollBar.Hide = function(self)
        container:SetWidth(ADDON_CONTAINER_WIDTH + ADDON_SCROLL_BAR_WIDTH)
        for _, button in next, container.scrollFrame.buttons do
            button:SetWidth(container:GetWidth() - ADDON_BUTTONS_PADDING)
        end
        getmetatable(self).__index.Hide(self)
    end

    container.scrollBar = scrollBar

    Container_CreateButtons(container)

    container:Hide()

    tinsert(ACHIEVEMENTFRAME_SUBFRAMES, UI.name)

    return container
end

local function createUI()
    local tabButton = createTabButton()
    local leftPanel = createLeftPanel()
    local container = createContainer()

    tabButton.leftPanel = leftPanel
    tabButton.container = container

    UI.tabButton = tabButton
    UI.leftPanel = leftPanel
    UI.container = container

    UI.isInitialized = true
end

local function setCustomHandlers()
    hooksecurefunc("AchievementFrame_UpdateTabs", TabButtonText_SetToClosedState)
    hooksecurefunc("AchievementObjectiveTracker_UntrackAchievement", forceUpdateAchievements)
    hooksecurefunc("AchievementFrameFilterDropDownButton_OnClick", updateAchievementsAndResetScroll)
    hooksecurefunc("AchievementFrame_ShowSearchPreviewResults", hideSearchPreview)
    AchievementFrame.searchBox:HookScript("OnTextChanged", updateAchievementsAndResetScroll)
    UI.container.scrollBar:HookScript("OnValueChanged", ScrollBar_OnValueChanged)

    hookDefaultTabsClicks()
end

function UI:Init()
    if UI.isInitialized then
        return
    end

    createUI()

    setCustomHandlers()
end
