--## Author: Gerlock ## Version: 1.9.3 ## SavedVariables: HearthstoneToysDB ## IconTexture: Interface\Icons\INV_Misc_Rune_01
-- Declare the HearthstoneToys namespace
local HearthstoneToys = {}
-- Define constants
HearthstoneToys.CONST = {
    ADDON_NAME = "HearthstoneToys",
    ADDON_DISPLAY_NAME = "Hearthstone Toys",
    DB_NAME = "HearthstoneToysDB",
    ADDON_ICON_TEXTURE = "Interface\\Icons\\INV_Misc_Rune_01",
    TOY_FRAME_SHOW_SOUND_ID = 2022070,
    TOY_FRAME_HIDE_SOUND_ID = 2906065,
    ADDON_TEXT_COLOR = "|cFF00a7ff",
    DEBUG_TEXT_COLOR = "|cFFff0000",
    RESET_COLOR = "|r",
    mainFrame,
    toyButtons = {},
    availableToys = {},
    includeToys = {},
    presetNameInput,
    presetsDropdown,
    UpdateCooldown,
    optionsCategoryId,
    ADDON_VERSION = "1.9.3", -- Update this with each release
    ADDON_UPDATES = "Code reorganized and modularized. Added Notorious Thread's Hearthstone",
    WELCOME_MESSAGE = "Type '/hst' to open the options panel. Please leave bug reports or feature requests on the Curseforge page.",
}

-- List of toy item IDs
HearthstoneToys.toyList = {
    {id = 54452, type = "toy"}, -- Ethereal Portal
    {id = 64488, type = "toy"}, -- The Innkeeper's Daughter
    {id = 93672, type = "toy"}, -- Dark Portal
    {id = 110560, type = "toy"}, -- Garrison Hearthstone
    {id = 140192, type = "toy"}, -- Dalaran Hearthstone
    {id = 142542, type = "toy"}, -- Tome of Town Portal
    {id = 162973, type = "toy"}, -- Greatfather Winter's Hearthstone
    {id = 163045, type = "toy"}, -- Headless Horseman's Hearthstone
    {id = 163206, type = "toy"}, -- Weary Spirit Binding
    {id = 165669, type = "toy"}, -- Lunar Elder's Hearthstone
    {id = 165670, type = "toy"}, -- Peddlefeet's Lovely Hearthstone
    {id = 165802, type = "toy"}, -- Noble Gardener's Hearthstone
    {id = 166746, type = "toy"}, -- Fire Eater's Hearthstone
    {id = 166747, type = "toy"}, -- Brewfest Reveler's Hearthstone
    {id = 168907, type = "toy"}, -- Holographic Digitalization Hearthstone
    {id = 172179, type = "toy"}, -- Eternal Traveler's Hearthstone
    {id = 180290, type = "toy"}, -- Night Fae Hearthstone
    {id = 182773, type = "toy"}, -- Necrolord Hearthstone
    {id = 183716, type = "toy"}, -- Venthyr Sinstone
    {id = 184353, type = "toy"}, -- Kyrian Hearthstone
    {id = 188952, type = "toy"}, -- Dominated Hearthstone
    {id = 190196, type = "toy"}, -- Enlightened Hearthstone
    {id = 190237, type = "toy"}, -- Broker Translocation Matrix
    {id = 193588, type = "toy"}, -- Timewalker's Hearthstone
    {id = 200630, type = "toy"}, -- Ohnir Windsage's Hearthstone
    {id = 206195, type = "toy"}, -- Path of the Naaru
    {id = 208704, type = "toy"}, -- Deepdweller's Earthen Hearthstone
    {id = 209035, type = "toy"}, -- Hearthstone of the Flame
    {id = 210455, type = "toy"}, -- Draenic Hologem
    {id = 212337, type = "toy"}, -- Stone of the Hearth
    {id = 6948, type = "item"}, -- Default Hearthstone
    {id = 37118, type = "item"}, -- Scroll of Recall
    {id = 556, type = "spell"}, -- Astral Recall
    {id = 228940, type = "toy"}, -- Notorious Thread's Hearthstone
}

-- Flavor Messages
HearthstoneToys.FLAVOR_MESSAGES = {
    "A wise mage once said, 'The fireball spell is the best way to say hello!'",
    "Beware the Dark Iron Dwarves. Their brew is stronger than their armor!",
    "The real secret of the Shaman's power is the sound of the totem's beat!",
    "Rogues don’t need a reason to stab people, but it's usually money.",
    "Hunters always know where their prey is, especially when they're hungry.",
    "Priests heal, but they never forget the time you got them killed!",
    "Warriors love their battles, but they secretly crave a good meal.",
    "Paladins are always prepared. They carry extra blessings just in case!",
    "Mages like to keep their spells hot, and their puns even hotter!",
    "Druids are all about nature, but they don’t mind the occasional moonfire!",
    "Druids are one with nature, but they can’t resist a good bear hug!",
    "Mages freeze their enemies, but their jokes are the real cold snap!",
    "Paladins have a hammer for every occasion... and a Light to match!",
    "Warriors live by the sword... and die by the bigger sword.",
    "Priests smite their foes with holy wrath, but they're really just practicing for bingo night.",
    "Rogues vanish, but your wallet vanishes faster!",
    "Shamans summon storms, but they’re the real force of nature!",
    "Hunters’ pets are loyal, but don't ask them to fetch!",
    "Warlocks always have friends in low places... like the Twisting Nether.",
    "Warlocks don’t just summon demons; they have them on speed dial.",
    "When a Warlock says 'let's make a pact,' it's best to read the fine print.",
    "Monks may be zen, but they’ll still knock you out with a keg!",
    "Demon Hunters have vision like no other-just don't ask how they lost their depth perception.",
    "Demon Hunters don't just stare; they glare right through you!",
    "Demon Hunters leap before they look... and it usually works out!",
    "Death Knights don't need a heart to break yours!",
    "Gnomes may be small, but their egos are perfectly sized!",
    "Dwarves believe that anything can be fixed with a hammer... even bad jokes.",
    "Orcs don't need coffee—they wake up ready to smash something.",
    "Tauren always know where the grass is greener. It's their job to find it!",
    "Blood Elves have perfected the art of looking fabulous while judging your fashion sense.",
    "Trolls might seem laid-back, but they take their head-hunting very seriously.",
    "Humans are great diplomats, mostly because they’ve had so much practice apologizing.",
    "Undead don’t need beauty sleep, but it’s still polite not to mention it.",
    "Goblins believe that 'more explosions' is the solution to any problem.",
    "For Goblins, safety regulations are just suggestions—expensive ones!",
    "Even after thousands of years, Night Elves are still trying to figure out why their hair glows at night.",
}

-- Define a debug flag
HearthstoneToys.DEBUG = false  -- Set to true to enable debug prints

-- Saved variable to store settings
_G[HearthstoneToys.CONST.DB_NAME] = _G[HearthstoneToys.CONST.DB_NAME] or {}
_G[HearthstoneToys.CONST.DB_NAME].generalSettings = _G[HearthstoneToys.CONST.DB_NAME].generalSettings or {}
_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition or {}
_G[HearthstoneToys.CONST.DB_NAME].specificSettings = _G[HearthstoneToys.CONST.DB_NAME].specificSettings or {}
_G[HearthstoneToys.CONST.DB_NAME].toySettings = _G[HearthstoneToys.CONST.DB_NAME].toySettings or {}
_G[HearthstoneToys.CONST.DB_NAME].presets = _G[HearthstoneToys.CONST.DB_NAME].presets or {}

-- Default settings
local defaults = {
    generalSettings = {
        showWelcomeMessage = true,
        playSoundWhenFrameShown = true,
        lockPosition = false,
        version = HearthstoneToys.CONST.ADDON_VERSION,
    },
    mainFramePosition = {
        point = "CENTER",
        relativeTo = "UIParent",
        relativePoint = "CENTER",
        xOfs = 0,
        yOfs = 0,
    },
    specificSettings = {
        showChatMessage = true,
        showButtonOnMouseOver = false,
        toyFramePosition = "LEFT",
        buttonSize = 44,
    },
}

-- Initialize saved variables
function HearthstoneToys.InitializeAddon()
    -- Check the current value before initialization
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if not _G[HearthstoneToys.CONST.DB_NAME][key] then
                _G[HearthstoneToys.CONST.DB_NAME][key] = {}
            end
            for nestedKey, nestedValue in pairs(value) do
                if _G[HearthstoneToys.CONST.DB_NAME][key][nestedKey] == nil then
                    _G[HearthstoneToys.CONST.DB_NAME][key][nestedKey] = nestedValue
                end
            end
        else
            if _G[HearthstoneToys.CONST.DB_NAME][key] == nil then
                _G[HearthstoneToys.CONST.DB_NAME][key] = value
            end
        end
    end
    
    -- Set buttonSize to a local variable for easy access
    HearthstoneToys.buttonSize = _G[HearthstoneToys.CONST.DB_NAME].specificSettings.buttonSize
    
    -- Initialize toySettings
    for _, toyListEntry in ipairs(HearthstoneToys.toyList) do
        local itemID = toyListEntry.id
        if type(itemID) == "number" and _G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID] == nil then
            _G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID] = true
        end
    end

    -- Initialize components
    HearthstoneToys.UIFrames.Initialize()
    -- HearthstoneToys.Functions.Initialize()
    -- HearthstoneToys.EventHandlers.Initialize()
    HearthstoneToys.OptionsPanel.Initialize()

    C_Timer.After(0.2, function()
        -- Register Slash Command
        SLASH_HST1 = "/hst"
        SlashCmdList["HST"] = function(msg)
            if HearthstoneToys.OptionsPanel.optionsCategoryId then
                -- Open the options panel using the registered category ID
                Settings.OpenToCategory(HearthstoneToys.OptionsPanel.optionsCategoryId)
            else
                print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Options panel not registered yet.")
            end
        end
        HearthstoneToys.PrintWelcomeMessage()
    end)
end



-- UIFrames.lua
-- Access the HearthstoneToys namespace

-- Ensure the UIFrames module is part of the HearthstoneToys namespace
HearthstoneToys.UIFrames = {}

-- Local references
local addonName = HearthstoneToys.CONST.ADDON_DISPLAY_NAME
HearthstoneToys.mainFrame = nil
HearthstoneToys.toyFrame = nil
HearthstoneToys.listenerFrame = nil
HearthstoneToys.cooldownFrame = nil

-- Function to create the main UI frame
function HearthstoneToys.UIFrames.Initialize()
    -- Create a frame to hold the toy buttons
    HearthstoneToys.toyFrame = CreateFrame("Frame", HearthstoneToys.CONST.ADDON_NAME .. "ToyFrame", UIParent)
    HearthstoneToys.toyFrame:SetSize(#HearthstoneToys.toyList * (HearthstoneToys.buttonSize + 4), HearthstoneToys.buttonSize + 4)
    HearthstoneToys.toyFrame:SetFrameStrata("HIGH")
    HearthstoneToys.toyFrame:SetFrameLevel(100)
    HearthstoneToys.toyFrame:Hide()

    -- Function to Create the Main Button
    HearthstoneToys.mainFrame = CreateFrame("Button", HearthstoneToys.CONST.ADDON_NAME .. "mainFrame", UIParent, "SecureActionButtonTemplate")
    HearthstoneToys.mainFrame:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)
    HearthstoneToys.mainFrame:SetNormalTexture(HearthstoneToys.CONST.ADDON_ICON_TEXTURE)
    HearthstoneToys.mainFrame:RegisterForClicks("AnyUp")
    HearthstoneToys.mainFrame:SetMovable(true)
    HearthstoneToys.mainFrame:EnableMouse(true)
    HearthstoneToys.mainFrame:RegisterForDrag("LeftButton")
    HearthstoneToys.mainFrame:SetFrameStrata("MEDIUM")
    HearthstoneToys.mainFrame:SetFrameLevel(100)
    HearthstoneToys.mainFrame:SetPoint("CENTER", _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo or UIParent, _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point, _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs, _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs)
    HearthstoneToys.mainFrame:Hide()
    
    -- Create a transparent "listener" frame for mouseover detection
    HearthstoneToys.listenerFrame = CreateFrame("Frame", nil, UIParent)
    HearthstoneToys.listenerFrame:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)
    HearthstoneToys.listenerFrame:SetPoint("CENTER", HearthstoneToys.mainFrame) -- Place it exactly where the main frame is
    HearthstoneToys.listenerFrame:SetFrameStrata("MEDIUM")
    HearthstoneToys.listenerFrame:SetFrameLevel(99) -- Make sure it is below the mainFrame

    -- This frame is invisible but can capture mouse events
    HearthstoneToys.listenerFrame:EnableMouse(true)
    HearthstoneToys.listenerFrame:Hide() -- Initially hidden, only shown when mouseover is enabled

    -- Show the main button when the mouse enters the listener frame
    HearthstoneToys.listenerFrame:SetScript("OnEnter", function(self)
        if _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver then
            HearthstoneToys.mainFrame:Show() -- Show the main button
            HearthstoneToys.listenerFrame:Hide() -- Hide the listener frame
        end
    end)

    -- Mouse Over section for mainFrame tooltips and hiding on mouse leave
    HearthstoneToys.mainFrame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
        GameTooltip:SetText(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. HearthstoneToys.CONST.RESET_COLOR, 1, 1, 1, 1, true)
        GameTooltip:AddLine("Left-click: Show the toys", 1, 1, 1)
        GameTooltip:AddLine("Right-click: Open options panel", 1, 1, 1)
        GameTooltip:Show()
    end)

    HearthstoneToys.mainFrame:SetScript("OnLeave", function(self)
        GameTooltip:Hide()

        if _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver and not HearthstoneToys.toyFrame:IsShown() then
            HearthstoneToys.mainFrame:Hide() -- Hide the main button if toyFrame is not shown
            HearthstoneToys.listenerFrame:Show() -- Show the listener frame
        end
    end)

    -- Toggle toy frame visibility on main button click
    HearthstoneToys.mainFrame:SetScript("OnClick", function(self, button)
        HearthstoneToys.UpdateCooldown()
        if button == "LeftButton" then
            if HearthstoneToys.toyFrame:IsShown() then
                HearthstoneToys.toyFrame:Hide()
                if _G[HearthstoneToys.CONST.DB_NAME].generalSettings.playSoundWhenFrameShown then
                    PlaySoundFile(HearthstoneToys.CONST.TOY_FRAME_HIDE_SOUND_ID, "Effects")
                end
            else
                if _G[HearthstoneToys.CONST.DB_NAME].generalSettings.playSoundWhenFrameShown then
                    PlaySoundFile(HearthstoneToys.CONST.TOY_FRAME_SHOW_SOUND_ID, "Effects")
                end
                HearthstoneToys.toyFrame:Show()
            end
        elseif button == "RightButton" then
            -- Open the options panel when right-clicking
            if SettingsPanel:IsShown() then
                SettingsPanel:Hide()
            else
                Settings.OpenToCategory(HearthstoneToys.OptionsPanel.optionsCategoryId)
            end
        end
    end)

    -- Manage main button dragging and saving the position
    HearthstoneToys.mainFrame:SetScript("OnDragStart", function(self)
        if not _G[HearthstoneToys.CONST.DB_NAME].generalSettings.lockPosition then
            self:StartMoving()
        end
    end)

    HearthstoneToys.mainFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        HearthstoneToys.SaveMainFramePosition()
    end)

    -- Add Cooldown Frame to mainFrame
    HearthstoneToys.cooldownFrame = CreateFrame("Cooldown", HearthstoneToys.CONST.ADDON_NAME .. "CooldownFrame", HearthstoneToys.mainFrame, "CooldownFrameTemplate")
    HearthstoneToys.cooldownFrame:SetAllPoints()
end

function HearthstoneToys.PetBattleVisibility()
    if C_PetBattles.IsInBattle() then
        HearthstoneToys.mainFrame:Hide()
    else
        HearthstoneToys.mainFrame:Show()
    end
end

-- Function to show/hide based on mouseover setting
function HearthstoneToys.UpdateVisibility()
    if _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver then
        HearthstoneToys.mainFrame:Hide() -- Hide the main frame if mouseover is enabled
        HearthstoneToys.listenerFrame:Show() -- Show the listener frame
    else
        HearthstoneToys.mainFrame:Show() -- Show the main frame if mouseover is disabled
        HearthstoneToys.listenerFrame:Hide() -- Hide the listener frame
    end
end

-- Function to update toy button positions
function HearthstoneToys.UpdateToyButtonPositions()
    local toyFramePosition = _G[HearthstoneToys.CONST.DB_NAME].specificSettings.toyFramePosition or "LEFT"
    local buttonSize = _G[HearthstoneToys.CONST.DB_NAME].specificSettings.buttonSize
    local spacing = 3
    local offsetX, offsetY = 0, 0
    
    -- Calculate offsets based on position
    if toyFramePosition == "LEFT" then
        HearthstoneToys.toyFrame:SetPoint("RIGHT", HearthstoneToys.mainFrame, "LEFT", -(buttonSize / 2 + spacing), 0)
        offsetX = buttonSize
    elseif toyFramePosition == "RIGHT" then
        HearthstoneToys.toyFrame:SetPoint("LEFT", HearthstoneToys.mainFrame, "RIGHT", buttonSize / 2 + spacing, 0)
        offsetX = buttonSize
    elseif toyFramePosition == "ABOVE" then
        HearthstoneToys.toyFrame:SetPoint("BOTTOM", HearthstoneToys.mainFrame, "TOP", 0, buttonSize / 2 + spacing)
        offsetY = buttonSize
    elseif toyFramePosition == "BELOW" then
        HearthstoneToys.toyFrame:SetPoint("TOP", HearthstoneToys.mainFrame, "BOTTOM", 0, -(buttonSize / 2 + spacing))
        offsetY = buttonSize
    end

    -- Adjust toyButtons positions based on their index and selected position
    for index, button in ipairs(HearthstoneToys.CONST.toyButtons) do
        local buttonOffsetX, buttonOffsetY = 0, 0

        if toyFramePosition == "LEFT" or toyFramePosition == "RIGHT" then
            buttonOffsetX = (index - 1) * (buttonSize + spacing) + offsetX + 3
            if toyFramePosition == "LEFT" then
                buttonOffsetX = -buttonOffsetX  -- Reverse direction for LEFT position
            end
        elseif toyFramePosition == "ABOVE" or toyFramePosition == "BELOW" then
            buttonOffsetY = (index - 1) * (buttonSize + spacing) + offsetY + 3
            if toyFramePosition == "BELOW" then
                buttonOffsetY = -buttonOffsetY  -- Reverse direction for BELOW position
            end
        end

        button:ClearAllPoints()
        button:SetPoint("CENTER", HearthstoneToys.mainFrame, "CENTER", buttonOffsetX, buttonOffsetY)
    end
end

-------------------------------------
-- Function to Set the Button Texture
-------------------------------------
local function SetButtonTexture(toyActionButton, itemID, texture, retries)
    if retries == 0 then
        -- If no retries left, set the default question mark texture
        toyActionButton:SetNormalTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        return
    end

    if texture and texture ~= "" then
        -- If texture is available, set it directly
        toyActionButton:SetNormalTexture(texture)
    else
        -- Retry loading the texture after a short delay
        C_Timer.After(0.7, function()
            local _, _, retryTexture
            if C_ToyBox.GetToyInfo then
                -- Try fetching toy info
                _, _, retryTexture = C_ToyBox.GetToyInfo(itemID)
            elseif C_Spell.GetSpellTexture then
                -- Try fetching spell texture
                retryTexture = C_Spell.GetSpellTexture(itemID)
            elseif GetItemInfo then
                -- Try fetching item info
                _, _, retryTexture = GetItemInfo(itemID)
            else
                -- No available methods to fetch texture
                retryTexture = nil
            end

            -- Retry setting the button texture with decremented retries
            SetButtonTexture(toyActionButton, itemID, retryTexture, retries - 1)
        end)
    end
end

---------------------------------
-- Function to Create Toy Buttons
---------------------------------
function HearthstoneToys.CreateButton(itemID, parent, index)
    local toyActionButton = CreateFrame("Button", HearthstoneToys.CONST.ADDON_NAME .. "Button" .. index, parent, "SecureActionButtonTemplate")
    toyActionButton:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)

    local isToy = PlayerHasToy(itemID)
    local isSpell = IsSpellKnown(itemID)
    local texture
    local tooltipFunc

    -- Preload texture and setup tooltip function
    if isToy then
        local _, toyName, toyTexture = C_ToyBox.GetToyInfo(itemID)
        texture = toyTexture
        tooltipFunc = function(self)
            if GetItemInfo(itemID) then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetToyByItemID(itemID)
                GameTooltip:Show()
            else
                self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
            end
        end
        toyActionButton:SetAttribute("type", "toy")
        toyActionButton:SetAttribute("toy", itemID)
    elseif isSpell then
        local spellName = C_Spell.GetSpellName(itemID)
        texture = C_Spell.GetSpellTexture(itemID)
        tooltipFunc = function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetSpellByID(itemID)
            GameTooltip:Show()
        end
        toyActionButton:SetAttribute("type", "spell")
        toyActionButton:SetAttribute("spell", itemID)
    else
        local itemName, _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemID)
        texture = itemTexture
        tooltipFunc = function(self)
            if GetItemInfo(itemID) then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetItemByID(itemID)
                GameTooltip:Show()
            else
                self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
            end
        end
        toyActionButton:SetAttribute("type", "item")
        toyActionButton:SetAttribute("item", "item:" .. itemID)
    end

    -- Use the SetButtonTexture function with retry logic
    SetButtonTexture(toyActionButton, itemID, texture, 7)

    -- Tooltip handling with caching check
    toyActionButton:SetScript("OnEnter", function(self)
        tooltipFunc(self)
    end)

    toyActionButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    -- Handle delayed tooltip update when item info is received
    toyActionButton:SetScript("OnEvent", function(self, event, receivedItemID)
        if event == "GET_ITEM_INFO_RECEIVED" and receivedItemID == itemID then
            self:UnregisterEvent("GET_ITEM_INFO_RECEIVED")
            if self:IsMouseOver() then
                tooltipFunc(self)
            end
        end
    end)

    toyActionButton:SetScript("PostClick", function(self)
        if HearthstoneToys.toyFrame then
            HearthstoneToys.toyFrame:Hide() -- Hide the toy frame
        end
        -- Ensure the mainFrame hides after a toy is selected
        if _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver then
            HearthstoneToys.mainFrame:Hide()
            HearthstoneToys.listenerFrame:Show() -- Show listener frame again
        end
        if _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showChatMessage then
            HearthstoneToys.FlavorMessage()
        end
    end)

    toyActionButton:RegisterForClicks("AnyDown", "AnyUp")
    toyActionButton:SetFrameStrata("HIGH")
    toyActionButton:SetFrameLevel(101)

    return toyActionButton
end


-- Functions.lua
-- Access the HearthstoneToys namespace

-- Ensure the UIFrames module is part of the HearthstoneToys namespace
HearthstoneToys.Functions = {}

-- Function for Debug Print
function HearthstoneToys.DebugPrint(message)
    if HearthstoneToys.DEBUG then
        print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. HearthstoneToys.CONST.DEBUG_TEXT_COLOR .. "[DEBUG] " .. HearthstoneToys.CONST.RESET_COLOR .. message)
    end
end

-- Function to find Available Toys by filtering toyList
function HearthstoneToys.InitializeAvailableToys()
    HearthstoneToys.CONST.availableToys = {}  -- Clear the availableToys table
    
    for _, entry in ipairs(HearthstoneToys.toyList) do
        local itemID = entry.id
        local itemType = entry.type
        
        if itemType == "toy" then
            if PlayerHasToy(itemID) then
                table.insert(HearthstoneToys.CONST.availableToys, {id = itemID, type = itemType})
            end
        elseif itemType == "item" then
            if GetItemCount(itemID) > 0 then
                table.insert(HearthstoneToys.CONST.availableToys, {id = itemID, type = itemType})
            end
        elseif itemType == "spell" then
            if IsSpellKnown(itemID) then
                table.insert(HearthstoneToys.CONST.availableToys, {id = itemID, type = itemType})
            end
        end
    end
end

-- Function to find Included Toys by filtering availableToys based on checkboxes in options panel
function HearthstoneToys.InitializeIncludedToys()
    HearthstoneToys.CONST.includeToys = {}  -- Clear the includeToys table

    -- Add toys, items, and spells from the saved settings to the includeToys table
    for itemID, isIncluded in pairs(_G[HearthstoneToys.CONST.DB_NAME].toySettings) do
        if isIncluded then
            local isToy = false
            local isSpell = false
            local isItem = false

            -- Check each type and their respective functions
            for _, entry in ipairs(HearthstoneToys.toyList) do
                if entry.id == itemID then
                    if entry.type == "toy" then
                        isToy = PlayerHasToy(itemID)
                    elseif entry.type == "spell" then
                        isSpell = IsSpellKnown(itemID)
                    elseif entry.type == "item" then
                        isItem = GetItemInfo(itemID) ~= nil
                    end
                    break
                end
            end

            if isToy or isSpell or isItem then  -- Include if it's a toy, a spell, or a valid item
                table.insert(HearthstoneToys.CONST.includeToys, itemID)
            end
        end
    end
end

-- Function to save position
function HearthstoneToys.SaveMainFramePosition()
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition or {}
    local point, relativeTo, relativePoint, xOfs, yOfs = HearthstoneToys.mainFrame:GetPoint()
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point = point
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo = relativeTo and relativeTo:GetName() or "UIParent"
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativePoint = relativePoint
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs = xOfs
    _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs = yOfs

    HearthstoneToys.DebugPrint("Main frame position saved: Point: " .. tostring(point) ..
        ", Relative To: " .. tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo) ..
        ", Relative Point: " .. tostring(relativePoint) ..
        ", X Offset: " .. tostring(xOfs) ..
        ", Y Offset: " .. tostring(yOfs))

    if HearthstoneToys.xPositionInput and HearthstoneToys.yPositionInput then
        HearthstoneToys.xPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs or 0))
        HearthstoneToys.yPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs or 0))
    end
end

-- Function to load position
function HearthstoneToys.LoadMainFramePosition()
    if _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition then
        HearthstoneToys.mainFrame:ClearAllPoints()
        HearthstoneToys.mainFrame:SetPoint(
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point or "CENTER", 
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo or UIParent, 
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativePoint or "CENTER", 
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs or 0, 
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs or 0
        )
    else
        HearthstoneToys.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    end

    if HearthstoneToys.xPositionInput and HearthstoneToys.yPositionInput then
        HearthstoneToys.xPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs or 0))
        HearthstoneToys.yPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs or 0))
    end
end

-- Function to clear all the toy buttons
function HearthstoneToys.ClearToyButtons()
    for _, toyActionButton in ipairs(HearthstoneToys.CONST.toyButtons) do
        toyActionButton:Hide()
        toyActionButton:SetParent(nil)
    end
    wipe(HearthstoneToys.CONST.toyButtons) -- Clear the toy buttons table
end

-- Create toy buttons for included toys and items
function HearthstoneToys.CreateToyButtons()
    HearthstoneToys.ClearToyButtons()

    local index = 1

    for _, itemID in ipairs(HearthstoneToys.CONST.includeToys) do
        local isToy = PlayerHasToy(itemID)
        local isSpell = IsSpellKnown(itemID)
        
        if isToy or isSpell then
            local toyActionButton = HearthstoneToys.CreateButton(itemID, HearthstoneToys.toyFrame, index)
            table.insert(HearthstoneToys.CONST.toyButtons, toyActionButton)
            index = index + 1
        else
            -- Handle non-toy items (e.g., items in the player's bags)
            local itemCount = GetItemCount(itemID)
            if itemCount > 0 then
                local toyActionButton = HearthstoneToys.CreateButton(itemID, HearthstoneToys.toyFrame, index)
                table.insert(HearthstoneToys.CONST.toyButtons, toyActionButton)
                index = index + 1
            end
        end
    end
    HearthstoneToys.UpdateToyButtonPositions() -- Update button positions after creating them
end

-- Function to toggle toy inclusion in the options panel
function HearthstoneToys.ToggleToyInclusion(itemID, isIncluded)
    if type(itemID) == "number" then
        _G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID] = isIncluded
        HearthstoneToys.InitializeIncludedToys()
        HearthstoneToys.ClearToyButtons()
        HearthstoneToys.CreateToyButtons()
    else
        -- Handle or log invalid itemID
    end
end

-- Function to print message if HearthstoneToys has been updated
function HearthstoneToys.AddonUpdatedMessage()
    if _G[HearthstoneToys.CONST.DB_NAME].generalSettings.version ~= HearthstoneToys.CONST.ADDON_VERSION then
        print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Addon has been updated to version " .. HearthstoneToys.CONST.ADDON_VERSION .. ". Updates include: " .. HearthstoneToys.CONST.ADDON_UPDATES)
        _G[HearthstoneToys.CONST.DB_NAME].generalSettings.version = HearthstoneToys.CONST.ADDON_VERSION  -- Update stored version to current version
    end
end

-- Function to display a flavor message
function HearthstoneToys.FlavorMessage()
    local messageCount = #HearthstoneToys.FLAVOR_MESSAGES
    if messageCount > 0 then
        local randomIndex = math.random(1, messageCount)
        local selectedMessage = HearthstoneToys.FLAVOR_MESSAGES[randomIndex]
        print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. selectedMessage .. HearthstoneToys.CONST.RESET_COLOR)
    else
        print("No flavor messages available.")
    end
end

-- Function to update the cooldown frame
function HearthstoneToys.UpdateCooldown()
    if HearthstoneToys.cooldownFrame then -- Ensure the cooldownFrame exists
        local start, duration, enable = GetItemCooldown(6948) -- Hearthstone item ID
        if enable and duration > 0 then
            HearthstoneToys.cooldownFrame:SetCooldown(start, duration)
        else
            HearthstoneToys.cooldownFrame:Clear()
        end
    else
        print(HearthstoneToys.CONST.DEBUG_TEXT_COLOR .. "Cooldown frame not initialized yet!" .. HearthstoneToys.CONST.RESET_COLOR)
    end
end

function HearthstoneToys.PrintWelcomeMessage()
    -- Print Welcome Message
    if _G[HearthstoneToys.CONST.DB_NAME].generalSettings.showWelcomeMessage then
        print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. HearthstoneToys.CONST.WELCOME_MESSAGE)
    end
end


-- OptionsPanel.lua
-- Access the HearthstoneToys namespace
-- Ensure the UIFrames module is part of the HearthstoneToys namespace
HearthstoneToys.OptionsPanel = {}

-- Local reference
HearthstoneToys.OptionsPanel.optionsCategoryId = nil -- Initialize as nil
HearthstoneToys.xPositionInput = nil
HearthstoneToys.yPositionInput = nil
    
-- Function to create Options Panel
function HearthstoneToys.OptionsPanel.CreateOptionsPanel()
    local optionsPanel = CreateFrame("Frame", HearthstoneToys.CONST.ADDON_NAME .. "OptionsPanel", InterfaceOptionsFramePanelContainer)
    optionsPanel.name = addonName

    -- Create a scrollable content area
    local scrollFrame = CreateFrame("ScrollFrame", HearthstoneToys.CONST.ADDON_NAME .. "ScrollFrame", optionsPanel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", optionsPanel, "TOPLEFT", 0, -16)
    scrollFrame:SetPoint("BOTTOMRIGHT", optionsPanel, "BOTTOMRIGHT", -30, 10)

    -- Create a frame to hold the actual content
    local content = CreateFrame("Frame", HearthstoneToys.CONST.ADDON_NAME .. "ScrollFrameContent", scrollFrame)
    content:SetSize(600, 800) -- Adjust size as needed
    scrollFrame:SetScrollChild(content)

    -- Create a title for the options panel
    local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. " Options")

    -- Section 1: General Settings
    local generalSettingsHeader = content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    generalSettingsHeader:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)
    generalSettingsHeader:SetText("General Settings")

    -- Add checkbox for the welcome message
    local showWelcomeMessageCheckbox = CreateFrame("CheckButton", HearthstoneToys.CONST.ADDON_NAME .. "ShowWelcomeMessageCheckbox", content, "ChatConfigCheckButtonTemplate")
    showWelcomeMessageCheckbox:SetPoint("TOPLEFT", generalSettingsHeader, "BOTTOMLEFT", 20, -8)
    showWelcomeMessageCheckbox:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].generalSettings.showWelcomeMessage)
    showWelcomeMessageCheckbox:SetScript("OnClick", function(self)
        _G[HearthstoneToys.CONST.DB_NAME].generalSettings.showWelcomeMessage = self:GetChecked()
    end)
    local showWelcomeMessageLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    showWelcomeMessageLabel:SetPoint("LEFT", showWelcomeMessageCheckbox, "RIGHT", 5, 0)
    showWelcomeMessageLabel:SetText("Show Welcome Message")

    -- Checkbox to show/hide chat messages
    local showChatMessageCheckbox = CreateFrame("CheckButton", nil, content, "ChatConfigCheckButtonTemplate")
    showChatMessageCheckbox:SetPoint("TOPLEFT", showWelcomeMessageCheckbox, "BOTTOMLEFT", 0, -8)
    showChatMessageCheckbox:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].specificSettings.showChatMessage)
    showChatMessageCheckbox:SetScript("OnClick", function(self)
        _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showChatMessage = self:GetChecked()
    end)
    local showChatMessageLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    showChatMessageLabel:SetPoint("LEFT", showChatMessageCheckbox, "RIGHT", 5, 0)
    showChatMessageLabel:SetText("Show Chat Message when using a toy")

    -- Checkbox to toggle sound
    local playSoundWhenFrameShownCheckbox = CreateFrame("CheckButton", nil, content, "ChatConfigCheckButtonTemplate")
    playSoundWhenFrameShownCheckbox:SetPoint("TOPLEFT", showChatMessageCheckbox, "BOTTOMLEFT", 0, -8)
    playSoundWhenFrameShownCheckbox:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].generalSettings.playSoundWhenFrameShown)
    playSoundWhenFrameShownCheckbox:SetScript("OnClick", function(self)
        _G[HearthstoneToys.CONST.DB_NAME].generalSettings.playSoundWhenFrameShown = self:GetChecked()
    end)
    local playSoundWhenFrameShownLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    playSoundWhenFrameShownLabel:SetPoint("LEFT", playSoundWhenFrameShownCheckbox, "RIGHT", 5, 0)
    playSoundWhenFrameShownLabel:SetText("Play sound when show/hide toy frame")

    -- Checkbox to toggle showhide on mouseover
    local showButtonOnMouseOverCheckbox = CreateFrame("CheckButton", nil, content, "ChatConfigCheckButtonTemplate")
    showButtonOnMouseOverCheckbox:SetPoint("TOPLEFT", playSoundWhenFrameShownCheckbox, "BOTTOMLEFT", 0, -8)
    showButtonOnMouseOverCheckbox:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver)
    showButtonOnMouseOverCheckbox:SetScript("OnClick", function(self)
        _G[HearthstoneToys.CONST.DB_NAME].specificSettings.showButtonOnMouseOver = self:GetChecked()
        HearthstoneToys.UpdateVisibility() -- Call the global function to update visibility
    end)
    local showButtonOnMouseOverLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    showButtonOnMouseOverLabel:SetPoint("LEFT", showButtonOnMouseOverCheckbox, "RIGHT", 5, 0)
    showButtonOnMouseOverLabel:SetText("Hide button until mouseover")

    -- Create the "Position Settings" label
    local mainFramePositionLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    mainFramePositionLabel:SetPoint("TOPLEFT", generalSettingsHeader, "BOTTOMLEFT", 0, -150)
    mainFramePositionLabel:SetText("Position Settings")

    -- Checkbox to lock/unlock frame position
    local lockPositionCheckbox = CreateFrame("CheckButton", nil, content, "ChatConfigCheckButtonTemplate")
    lockPositionCheckbox:SetPoint("TOPLEFT", mainFramePositionLabel, "BOTTOMLEFT", 20, -8)
    lockPositionCheckbox:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].generalSettings.lockPosition)
    lockPositionCheckbox:SetScript("OnClick", function(self)
        local isLocked = self:GetChecked()
        _G[HearthstoneToys.CONST.DB_NAME].generalSettings.lockPosition = isLocked
        if isLocked then
            HearthstoneToys.mainFrame:RegisterForDrag()  -- Unregister drag
        else
            HearthstoneToys.mainFrame:RegisterForDrag("LeftButton")  -- Register drag
        end
    end)
    local lockPositionLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    lockPositionLabel:SetPoint("LEFT", lockPositionCheckbox, "RIGHT", 5, 0)
    lockPositionLabel:SetText("Lock Dragging")

    -- Button to move the mainFrame to the center of the screen
    local centerButton = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    centerButton:SetSize(200, 25)
    centerButton:SetText("Move to center of the screen")
    centerButton:SetPoint("TOPLEFT", mainFramePositionLabel, "BOTTOMLEFT", 240, -8)
    centerButton:SetScript("OnClick", function()
        -- Move the mainFrame to the center of the screen
        HearthstoneToys.mainFrame:ClearAllPoints()
        HearthstoneToys.mainFrame:SetPoint("CENTER", UIParent, "CENTER")
        
        -- Update the saved position in the database
        _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point = "CENTER"
        _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo = nil
        _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs = 0
        _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs = 0
    end)

    -- Create the "Fine tune button position" label
    local fineTuneLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fineTuneLabel:SetPoint("TOPLEFT", lockPositionLabel, "BOTTOMLEFT", 0, -20)
    fineTuneLabel:SetText("Fine tune button position")

    -- Create a text field for the X position
    HearthstoneToys.xPositionInput = CreateFrame("EditBox", nil, content, "InputBoxTemplate")
    HearthstoneToys.xPositionInput:SetSize(100, 15)
    HearthstoneToys.xPositionInput:SetPoint("TOPLEFT", fineTuneLabel, "BOTTOMLEFT", 75, -10)
    HearthstoneToys.xPositionInput:SetAutoFocus(false)
    HearthstoneToys.xPositionInput:SetMaxLetters(6)
    HearthstoneToys.xPositionInput:SetJustifyH("CENTER")
    HearthstoneToys.xPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs or 0))
    HearthstoneToys.xPositionInput:SetCursorPosition(0)  -- Set cursor to the start of the text

    -- Create a label for the X position input
    local xPositionLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    xPositionLabel:SetPoint("RIGHT", HearthstoneToys.xPositionInput, "LEFT", -10, 0)
    xPositionLabel:SetText("X Position:")

    -- Create a text field for the Y position
    HearthstoneToys.yPositionInput = CreateFrame("EditBox", nil, content, "InputBoxTemplate")
    HearthstoneToys.yPositionInput:SetSize(100, 15)
    HearthstoneToys.yPositionInput:SetPoint("TOPLEFT", HearthstoneToys.xPositionInput, "BOTTOMLEFT", 0, -10)
    HearthstoneToys.yPositionInput:SetAutoFocus(false)
    HearthstoneToys.yPositionInput:SetMaxLetters(6)
    HearthstoneToys.yPositionInput:SetJustifyH("CENTER")
    HearthstoneToys.yPositionInput:SetText(tostring(_G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs or 0))
    HearthstoneToys.yPositionInput:SetCursorPosition(0)  -- Set cursor to the start of the text
    
    -- Create a label for the Y position input
    local yPositionLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    yPositionLabel:SetPoint("RIGHT", HearthstoneToys.yPositionInput, "LEFT", -10, 0)
    yPositionLabel:SetText("Y Position:")

    -- Set scripts to update the button position when the text fields are changed
    HearthstoneToys.xPositionInput:SetScript("OnEnterPressed", function()
        local x = tonumber(HearthstoneToys.xPositionInput:GetText())
        local y = tonumber(HearthstoneToys.yPositionInput:GetText())
        if x and y then
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs = x
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs = y
            HearthstoneToys.LoadMainFramePosition()  -- Call the function to update the frame's position
        end
    end)
    
    HearthstoneToys.yPositionInput:SetScript("OnEnterPressed", function()
        local x = tonumber(HearthstoneToys.xPositionInput:GetText())
        local y = tonumber(HearthstoneToys.yPositionInput:GetText())
        if x and y then
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs = x
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs = y
            HearthstoneToys.LoadMainFramePosition()  -- Call the function to update the frame's position
        end
    end)

    ---------------------------------------
    -- Function to Load the Position Preset
    ---------------------------------------
    local function LoadPreset(presetName)
        if _G[HearthstoneToys.CONST.DB_NAME].presets and _G[HearthstoneToys.CONST.DB_NAME].presets[presetName] then
            local preset = _G[HearthstoneToys.CONST.DB_NAME].presets[presetName]
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point = preset.point
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo = preset.relativeTo
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativePoint = preset.relativePoint
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs = preset.xOfs
            _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs = preset.yOfs
            HearthstoneToys.LoadMainFramePosition()
            presetNameInput:SetText("")
            UIDropDownMenu_SetText(presetsDropdown, "Select Preset")
            UIDropDownMenu_Initialize(presetsDropdown, InitializePresetsDropdown)
            print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Preset: '" .. presetName .. "' loaded.")
        else
            print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Preset: '" .. presetName .. "' not found.")
        end
    end

    ---------------------------------------
    -- Function to Save the Position Preset
    ---------------------------------------
    local function SavePreset(presetName)
        if not _G[HearthstoneToys.CONST.DB_NAME].presets then
            _G[HearthstoneToys.CONST.DB_NAME].presets = {}
        end

        _G[HearthstoneToys.CONST.DB_NAME].presets[presetName] = {
            point = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.point,
            relativeTo = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativeTo,
            relativePoint = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.relativePoint,
            xOfs = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.xOfs,
            yOfs = _G[HearthstoneToys.CONST.DB_NAME].mainFramePosition.yOfs,
        }
        presetNameInput:SetText("")
        UIDropDownMenu_SetText(presetsDropdown, "Select Preset")
        UIDropDownMenu_Initialize(presetsDropdown, InitializePresetsDropdown)
        print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: "  .. HearthstoneToys.CONST.RESET_COLOR .. "Preset: '" .. presetName .. "' saved.")
    end

    ---------------------------------------
    -- Function to Delete the Position Preset
    ---------------------------------------
    local function DeletePreset(presetName)
        if _G[HearthstoneToys.CONST.DB_NAME].presets and _G[HearthstoneToys.CONST.DB_NAME].presets[presetName] then
            _G[HearthstoneToys.CONST.DB_NAME].presets[presetName] = nil
            print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Preset: '" .. presetName .. "' deleted.")
            -- Clear the EditBox and update the dropdown menu
            presetNameInput:SetText("")
            UIDropDownMenu_SetText(presetsDropdown, "Select Preset")
            UIDropDownMenu_Initialize(presetsDropdown, InitializePresetsDropdown)
        else
            print(HearthstoneToys.CONST.ADDON_TEXT_COLOR .. "[" .. HearthstoneToys.CONST.ADDON_DISPLAY_NAME .. "]: " .. HearthstoneToys.CONST.RESET_COLOR .. "Preset: '" .. presetName .. "' not found.")
        end
    end

    -- Adjust preset save and load UI elements
    local presetLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    presetLabel:SetPoint("TOPLEFT", fineTuneLabel, "BOTTOMLEFT", 250, 12)
    presetLabel:SetText("Position Presets")

    presetNameInput = CreateFrame("EditBox", HearthstoneToys.CONST.ADDON_NAME .. "PresetNameInput", content, "InputBoxTemplate")
    presetNameInput:SetPoint("TOPLEFT", presetLabel, "BOTTOMLEFT", 0, -10)
    presetNameInput:SetSize(170, 20)
    presetNameInput:SetAutoFocus(false)
    presetNameInput:SetMaxLetters(20)
    presetNameInput:SetText("Preset Name")
    presetNameInput:SetJustifyH("CENTER")

    local savePresetButton = CreateFrame("Button", HearthstoneToys.CONST.ADDON_NAME .. "SavePresetButton", content, "UIPanelButtonTemplate")
    savePresetButton:SetPoint("LEFT", presetNameInput, "RIGHT", 10, 0)
    savePresetButton:SetSize(100, 20)
    savePresetButton:SetText("Save Preset")
    savePresetButton:SetScript("OnClick", function()
        local presetName = presetNameInput:GetText()
        if presetName ~= "" then
            SavePreset(presetName)
        end
    end)

    local loadPresetButton = CreateFrame("Button", HearthstoneToys.CONST.ADDON_NAME .. "LoadPresetButton", content, "UIPanelButtonTemplate")
    loadPresetButton:SetPoint("TOPLEFT", savePresetButton, "BOTTOMLEFT", 0, -10)
    loadPresetButton:SetSize(100, 20)
    loadPresetButton:SetText("Load Preset")
    loadPresetButton:SetScript("OnClick", function()
        local presetName = presetNameInput:GetText()
        if presetName ~= "" then
            LoadPreset(presetName)
        end
    end)

    -- Create a delete preset button
    local deletePresetButton = CreateFrame("Button", HearthstoneToys.CONST.ADDON_NAME .. "DeletePresetButton", content, "UIPanelButtonTemplate")
    deletePresetButton:SetPoint("TOPLEFT", loadPresetButton, "BOTTOMLEFT", 0, -10)
    deletePresetButton:SetSize(100, 20)
    deletePresetButton:SetText("Delete Preset")
    deletePresetButton:SetScript("OnClick", function()
        local presetName = presetNameInput:GetText()
        if presetName ~= "" then
            DeletePreset(presetName)
        end
    end)
    
    -- Create dropdown menu for presets
    presetsDropdown = CreateFrame("Frame", HearthstoneToys.CONST.ADDON_NAME .. "PresetDropdown", content, "UIDropDownMenuTemplate")
    presetsDropdown:SetPoint("TOPLEFT", presetNameInput, "BOTTOMLEFT", -16, -10)
    UIDropDownMenu_SetWidth(presetsDropdown, 150)
    UIDropDownMenu_SetText(presetsDropdown, "Select Preset")
    
    local function InitializePresetsDropdown(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for presetName in pairs(_G[HearthstoneToys.CONST.DB_NAME].presets or {}) do
            info.text = presetName
            info.func = function()
                UIDropDownMenu_SetText(presetsDropdown, presetName)
                presetNameInput:SetText(presetName)
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end

    UIDropDownMenu_Initialize(presetsDropdown, InitializePresetsDropdown)

    -- Center the text in the dropdown menu
    local text = _G[presetsDropdown:GetName().."Text"]
    text:ClearAllPoints()
    text:SetPoint("CENTER", presetsDropdown, "CENTER", 0, 0)
    text:SetJustifyH("CENTER")

    -- Create a label for the position dropdown
    local toyButtonPositionLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    toyButtonPositionLabel:SetPoint("TOPLEFT", mainFramePositionLabel, "BOTTOMLEFT", 0, -155)
    toyButtonPositionLabel:SetText("Toy Button Position relative to Main Button")
    
    -- Dropdown for positioning
    local positionDropdown = CreateFrame("Frame", HearthstoneToys.CONST.ADDON_NAME .. "PositionDropdown", content, "UIDropDownMenuTemplate")
    positionDropdown:SetPoint("TOPLEFT", toyButtonPositionLabel, "BOTTOMLEFT", 20, -10)

    local positions = {"LEFT", "RIGHT", "ABOVE", "BELOW"}

    local function PositionDropdown_OnClick(self)
        UIDropDownMenu_SetSelectedID(positionDropdown, self:GetID())
        _G[HearthstoneToys.CONST.DB_NAME].specificSettings.toyFramePosition = positions[self:GetID()]
        HearthstoneToys.UpdateToyButtonPositions() -- Call UpdateToyButtonPositions when position is changed
    end
    
    local function InitializePositionDropdown(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for index, toyFramePosition in ipairs(positions) do
            info = UIDropDownMenu_CreateInfo()
            info.text = toyFramePosition:sub(1, 1) .. toyFramePosition:sub(2):lower()
            info.value = toyFramePosition
            info.func = PositionDropdown_OnClick
            UIDropDownMenu_AddButton(info, level)
        end
    end

    UIDropDownMenu_Initialize(positionDropdown, InitializePositionDropdown)
    UIDropDownMenu_SetWidth(positionDropdown, 100)
    UIDropDownMenu_SetButtonWidth(positionDropdown, 124)

    -- Find the index of the current position in positions table
    local selectedPositionIndex
    for i, pos in ipairs(positions) do
        if pos == _G[HearthstoneToys.CONST.DB_NAME].specificSettings.toyFramePosition then
            selectedPositionIndex = i
            break
        end
    end
    UIDropDownMenu_SetSelectedID(positionDropdown, selectedPositionIndex or 1)
    UIDropDownMenu_JustifyText(positionDropdown, "LEFT")

    -- Ensure the settings are loaded first
    local buttonSize = HearthstoneToys.buttonSize or 44  -- Using HearthstoneToys.buttonSize, which was set in InitializeAddon

    -- Create a label for the size slider
    local sizeSliderLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    sizeSliderLabel:SetPoint("TOPLEFT", toyButtonPositionLabel, "BOTTOMLEFT", 0, -70)
    sizeSliderLabel:SetText("Size Settings")

    -- Create a slider for adjusting button sizes
    local sizeSlider = CreateFrame("Slider", HearthstoneToys.CONST.ADDON_NAME .. "SizeSlider", content, "OptionsSliderTemplate")
    sizeSlider:SetPoint("TOPLEFT", sizeSliderLabel, "BOTTOMLEFT", 35, -10)
    sizeSlider:SetMinMaxValues(20, 100)
    sizeSlider:SetValueStep(1)
    sizeSlider:SetValue(buttonSize)  -- Set the slider to the saved size
    sizeSlider:SetWidth(150)
    sizeSlider:SetObeyStepOnDrag(true)

    _G[sizeSlider:GetName() .. "Low"]:SetText("20")
    _G[sizeSlider:GetName() .. "High"]:SetText("100")

    -- Create an input box to display and input the size value
    local sizeInput = CreateFrame("EditBox", HearthstoneToys.CONST.ADDON_NAME .. "SizeInput", content, "InputBoxTemplate")
    sizeInput:SetPoint("LEFT", sizeSlider, "RIGHT", 20, 0)
    sizeInput:SetSize(50, 30)
    sizeInput:SetJustifyH("CENTER")  -- Center the text in the input box
    sizeInput:SetAutoFocus(false)
    sizeInput:ClearFocus()
    sizeInput:SetText(math.floor(buttonSize))  -- Set initial input text to the current size
    sizeInput:SetCursorPosition(0)

    -- Function to update button sizes
    local function UpdateButtonSizes(value)
        HearthstoneToys.buttonSize = value  -- Ensure HearthstoneToys.buttonSize is updated
        _G[HearthstoneToys.CONST.DB_NAME].specificSettings.buttonSize = HearthstoneToys.buttonSize

        -- Apply the new size to your buttons
        HearthstoneToys.mainFrame:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)
        for _, button in ipairs(HearthstoneToys.CONST.toyButtons) do
            button:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)
        end

        -- Update toy button positions if necessary
        HearthstoneToys.UpdateToyButtonPositions()
    end

    -- Update button sizes when the slider value changes
    sizeSlider:SetScript("OnValueChanged", function(self, value)
        local newSize = math.floor(value)
        sizeInput:SetText(newSize)  -- Update the input field
        UpdateButtonSizes(newSize)  -- Apply the size change in real-time
    end)

    -- Update slider and button sizes when the input field value changes
    sizeInput:SetScript("OnEnterPressed", function(self)
        local inputValue = tonumber(self:GetText())
        if inputValue and inputValue >= 20 and inputValue <= 100 then
            sizeSlider:SetValue(inputValue)  -- This will also trigger the slider's OnValueChanged
        else
            self:SetText(math.floor(sizeSlider:GetValue()))  -- Revert to the current size if the input is invalid
        end
        sizeInput:ClearFocus()  -- Clear focus after entering a value
    end)


    -- Create a label for the toy checkboxes
    local toyListLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    toyListLabel:SetPoint("TOPLEFT", sizeSliderLabel, "BOTTOMLEFT", 0, -75)
    toyListLabel:SetText("Included Toys")
    
    -- Table to store created checkboxes
    local checkBoxes = {}
    
    -- Function to create checkboxes
    local function CreateCheckbox(parent, itemID, itemType, index)
        local checkButton = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
        checkButton:SetPoint("TOPLEFT", toyListLabel, "BOTTOMLEFT", 10, -(index * 30 + 15)) -- Adjust starting point and spacing here
        checkButton.Text:SetText("Loading...")

        local function UpdateItemName(attempts)
            local itemName
            if itemType == "toy" and PlayerHasToy(itemID) then
                itemName = select(2, C_ToyBox.GetToyInfo(itemID))
            elseif itemType == "item" and GetItemInfo(itemID) then
                itemName = GetItemInfo(itemID)
            elseif itemType == "spell" and C_Spell.GetSpellName(itemID) then
                itemName = C_Spell.GetSpellName(itemID)
            end

            if itemName and itemName ~= "" then
                checkButton.Text:SetText(itemName)
            else
                if attempts > 0 then
                    C_Timer.After(0.5, function()
                        UpdateItemName(attempts - 1)
                    end)
                else
                    checkButton.Text:SetText("Unknown Item")
                end
            end
            checkButton.Text:ClearAllPoints()
            checkButton.Text:SetPoint("LEFT", checkButton, "RIGHT", 5, 0)
        end

        UpdateItemName(5) -- Attempt 5 times with a 0.5-second delay between each

        if _G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID] == nil then
            _G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID] = true
        end

        checkButton:SetChecked(_G[HearthstoneToys.CONST.DB_NAME].toySettings[itemID])

        checkButton:SetScript("OnClick", function(self)
            HearthstoneToys.ToggleToyInclusion(itemID, self:GetChecked())
        end)

        return checkButton
    end
    
    -- Function to create toy checkboxes
    local function CreateToyCheckboxes()
        -- Clear existing checkboxes
        for _, checkBox in ipairs(checkBoxes) do
            checkBox:Hide()
        end
        checkBoxes = {}

        local index = 0

        for _, entry in ipairs(HearthstoneToys.CONST.availableToys) do
            local checkButton = CreateCheckbox(content, entry.id, entry.type, index)
            table.insert(checkBoxes, checkButton)
            index = index + 1
        end

        content:SetHeight(index * 30 + 400) -- Adjust height as needed to fit all elements
    end
    CreateToyCheckboxes()

    optionsPanel:SetScript("OnShow", function()
        CreateToyCheckboxes()
    end)

    local category, layout = Settings.RegisterCanvasLayoutCategory(optionsPanel, optionsPanel.name)
    HearthstoneToys.OptionsPanel.optionsCategoryId = category:GetID()  -- Ensure this assignment is correct
    Settings.RegisterAddOnCategory(category)
end

function HearthstoneToys.OptionsPanel.Initialize()
    HearthstoneToys.OptionsPanel.CreateOptionsPanel()
end

-- EventHandlers.lua
-- Access the HearthstoneToys namespace
local addonName, HearthstoneToys = ...

-- Ensure the UIFrames module is part of the HearthstoneToys namespace
HearthstoneToys.EventHandlers = {}

----------------------------
-- Function for Player Login
----------------------------
local function PlayerLogin()
    C_Timer.After(1, function()
        -- HearthstoneToys.InitializeAddon()
        HearthstoneToys.LoadMainFramePosition()
        HearthstoneToys.AddonUpdatedMessage()
        -- Set initial visibility based on the mouseover setting with a small delay
        C_Timer.After(0.1, HearthstoneToys.UpdateVisibility)
    end)
    C_Timer.After(2, function()  -- delay
        HearthstoneToys.InitializeAvailableToys()
        HearthstoneToys.InitializeIncludedToys()
        HearthstoneToys.CreateToyButtons()
        HearthstoneToys.UpdateToyButtonPositions()
        HearthstoneToys.UpdateCooldown()
        HearthstoneToys.mainFrame:SetSize(HearthstoneToys.buttonSize, HearthstoneToys.buttonSize)
    end)
end

-- Register events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PET_BATTLE_OPENING_START")
eventFrame:RegisterEvent("PET_BATTLE_CLOSE")
eventFrame:RegisterEvent("UNIT_ENTERED_VEHICLE")
eventFrame:RegisterEvent("UNIT_EXITED_VEHICLE")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == HearthstoneToys.CONST.ADDON_NAME then
       -- Your HearthstoneToys is loaded, initialize saved variables here
        HearthstoneToys.InitializeAddon()
        eventFrame:UnregisterEvent("ADDON_LOADED") -- Unregister to prevent redundant calls
    elseif event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            PlayerLogin()
        end)
    elseif event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(1, function()
            HearthstoneToys.UpdateCooldown()
        end)
    elseif event == "SPELL_UPDATE_COOLDOWN" then
        HearthstoneToys.UpdateCooldown()
    elseif event == "PET_BATTLE_OPENING_START" or event == "PET_BATTLE_CLOSE" then
        HearthstoneToys.PetBattleVisibility()
    elseif event == "UNIT_ENTERED_VEHICLE" then
        HearthstoneToys.mainFrame:Hide()
    elseif event == "UNIT_EXITED_VEHICLE" then
        HearthstoneToys.mainFrame:Show()
    end
end)