local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}

-- ============================================================================
-- Settings Initialization
-- ============================================================================
function CollectorHelper:InitSettings()
    if not settings or settings == nil then
        settings = {
            hideMerchantOwned = true,
            showCostFrame = true,
            autoShowNews = true,
            version = "0"
        }
    end

    if not lfrCollected or lfrCollected == nil then
        lfrCollected = {}
    end

    if not recipeCollected or recipeCollected == nil then
        recipeCollected = {}
    end

    self:initializeSettings()
    self:initializeLfrCollected()
    self:initializeRecipesCollected()
end

-- ============================================================================
-- Settings Initialization Helper
-- ============================================================================
function CollectorHelper:initializeSettings()
    local s = settings

    -- Migrate or set any missing settings
    if s.hideMerchantOwned == nil then
        s.hideMerchantOwned = true
    end
    if s.showCostFrame == nil then
        s.showCostFrame = true
    end
    if s.autoShowNews == nil then
        s.autoShowNews = true
    end
    if s.version == nil then
        s.version = "0"
    end
end

-- ============================================================================
-- Collected Data Initialization Functions
-- ============================================================================

--- Initializes the structure for LFR (Looking For Raid) collected data.
function CollectorHelper:initializeLfrCollected()
    if not self.db.lfrData then
        self:Print("Warning: lfrData is not defined.")
        return
    end

    -- Initialize the collected data for LFR raids and wings
    for raidId, raidData in pairs(self.db.lfrData) do
        if not lfrCollected[raidId] then
            lfrCollected[raidId] = { wings = {} }
        end
        for wingId, _ in pairs(raidData.wings or {}) do
            if lfrCollected[raidId].wings[wingId] == nil then
                lfrCollected[raidId].wings[wingId] = false
            end
        end
    end
end

--- Initializes the structure for recipes collected data.
function CollectorHelper:initializeRecipesCollected()
    -- Delay execution slightly to ensure professions are available.
    C_Timer.After(0.25, function()
        local firstTime = false

        -- Retrieve profession indices. (If no professions exist, these may be nil.)
        local prof1index, prof2index, _, _, cooking = GetProfessions()

        local function getProfessionInfo(index)
            return index and GetProfessionInfo(index) or ""
        end

        local prof1 = getProfessionInfo(prof1index)
        local prof2 = getProfessionInfo(prof2index)
        local cookingProf = getProfessionInfo(cooking)

        -- Build the player's unique identifier.
        local playerName = UnitName("player")
        local realm = GetNormalizedRealmName()
        local player = playerName .. "-" .. realm
        self.player = player

        if not recipeCollected[player] then
            firstTime = true
            recipeCollected[player] = {}
        end

        --- Helper to ensure a profession has its recipe table.
        local function initializeProfessionRecipes(profession)
            if not recipeCollected[player][profession] then
                recipeCollected[player][profession] = {
                    collected = 0,
                    recipes = {},
                    lastSync = "never",
                    total = 0
                }
            end
        end

        -- Initialize data for each profession.
        initializeProfessionRecipes(prof1)
        initializeProfessionRecipes(prof2)
        initializeProfessionRecipes(cookingProf)

        -- If this is the first time, notify the user and open the Recipe UI.
        if firstTime then
            C_Timer.After(0.50, function()
                self:Print(
                    "This character doesn't have any recipe data. You may sync it now if you want. You can reopen the popup with /ch recipe command. It's important to reload after the first sync.")
                self:ShowRecipeUI(true)
            end)
        end
    end)
end
