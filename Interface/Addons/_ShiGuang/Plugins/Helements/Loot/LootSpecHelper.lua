-- before releasing new version, find "RELEASE"
-- for updating, find "UPDATE step"
LootSpecHelperEventFrame = CreateFrame("frame", "LootSpecHelper Frame");
myPrefix = "LootSpecHelper121";
SLASH_LOOTSPECHELPER1 = "/lsh"
SLASH_LOOTSPECHELPER2 = "/lootspechelper"
MyAddOn_Comms = {};

tinsert(UISpecialFrames, LootSpecHelperEventFrame:GetName())

-- index is 2 if journal->raids->current have wb and 1 if there are no wbs,
lsh_raidIndex = 2;

loot = {};
lootNames = {};

raidDifficulties = {
    "Lfr",
    "Normal",
    "Heroic",
    "Mythic",
    "All"
};
local encounterIDs = {};

difficulty = nil;
difficultyIndex = nil;
boss = nil;
bossIndex = nil;
selectedItem = nil;
raid = nil;
raidIndex = nil;
raidIndexSelector = nil;
dungeon = nil;
dungeonIndex = nil;
dungeonLevel = nil;
dungeonLevelIndex = nil;

addFrameGlobal = nil;
globalTab = nil;

globalSpecLootsFrame = nil;
mostRecentBoss = nil;
disabled = false;

lsh_journal_opened = false;

notLoadedItems = {};

encounterLoadedStatus = {}

bossesOnly = {}

-- UPDATE: step 6: update key levels if they change
-- keyLevels = {
--     "2",
--     "3",
--     "4",
--     "5",
--     "6",
--     "7",
--     "8",
--     "9",
--     "10",
--     "11",
--     "12",
--     "13",
--     "14",
--     "15",
--     "16",
--     "17",
--     "18",
--     "19",
--     "20+",
--     "6/6 Hero (483)",
--     "4/4 Myth (489)"
-- }

-- again fated is fucked
keyLevels = {
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "6/6 Hero (522)",
    "4/4 Myth (528)"
}

runningTargetedKey = false;

local lsh_most_recent_raid_id = nil;

function SlashCmdList.LOOTSPECHELPER(msg, editbox)
    if strtrim(msg) == "enable" then
        disabled = false;
        mostRecentBoss = nil;
        print("LootSpecHelper enabled")
    elseif strtrim(msg) == "disable" then
        disabled = true;
        print("LootSpecHelper disabled")
    elseif strtrim(msg) == "reset" then
        disabled = false;
        mostRecentBoss = nil;
        print("LootSpecHelper reset")
    else
        LootSpecHelperEventFrame:CreateLootSpecHelperWindow();
    end
end

local function tprint (tbl, indent)
    if not indent then indent = 0 end
    local toprnt = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2
    for k, v in pairs(tbl) do
        toprnt = toprnt .. string.rep(" ", indent)
      if (type(k) == "number") then
        toprnt = toprnt .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
        toprnt = toprnt  .. k ..  "= "
      end
      if (type(v) == "number") then
        toprnt = toprnt .. v .. ",\r\n"
      elseif (type(v) == "string") then
        toprnt = toprnt .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
        toprnt = toprnt .. tprint(v, indent + 2) .. ",\r\n"
      else
        toprnt = toprnt .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    toprnt = toprnt .. string.rep(" ", indent-2) .. "}"
    return toprnt
end

function LootSpecHelperEventFrame:CustomGetInstanceInfo()
    local latestTierIndex = EJ_GetNumTiers()
    EJ_SelectTier(latestTierIndex)

    local raids = {}
    local dungeons = {}

    local index = lsh_raidIndex
    while true do
        local instanceID, name, _, _, _, _, _, isRaid = EJ_GetInstanceByIndex(index, true)
        if not instanceID then break end
        local bosses = {}
        EJ_SelectInstance(instanceID)
        local bossIndexLoop = 1
        while true do
            local bossName, _, encounterID = EJ_GetEncounterInfoByIndex(bossIndexLoop)
            if not bossName then break end
            encounterLoadedStatus[bossName] = false
            table.insert(bosses, {name = bossName, id = encounterID})
            bossIndexLoop = bossIndexLoop + 1
        end
        table.insert(raids, {instanceName = name, instanceID = instanceID, bosses = bosses})
        index = index + 1
    end

    index = 1
    while true do
        local instanceID, name = EJ_GetInstanceByIndex(index, false)
        if not instanceID then break end
        table.insert(dungeons, {instanceName = name, instanceID = instanceID})
        index = index + 1
    end
    return raids, dungeons
end

function determineDungeonDropsForLootSpecs(current_lsh_instanceName)
    local latestTierIndex = EJ_GetNumTiers()

    local function lsh_On()
        EncounterJournal:RegisterEvent("EJ_LOOT_DATA_RECIEVED");
        EncounterJournal:RegisterEvent("EJ_DIFFICULTY_UPDATE");
        EncounterJournal:RegisterEvent("UNIT_PORTRAIT_UPDATE");
        EncounterJournal:RegisterEvent("PORTRAITS_UPDATED");
        EncounterJournal:RegisterEvent("SEARCH_DB_LOADED");
        EncounterJournal:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
    end
    local function lsh_Off()
        EncounterJournal:UnregisterEvent("EJ_LOOT_DATA_RECIEVED");
        EncounterJournal:UnregisterEvent("EJ_DIFFICULTY_UPDATE");
        EncounterJournal:UnregisterEvent("UNIT_PORTRAIT_UPDATE");
        EncounterJournal:UnregisterEvent("PORTRAITS_UPDATED");
        EncounterJournal:UnregisterEvent("SEARCH_DB_LOADED");
        EncounterJournal:UnregisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
    end

    local targetedInstanceId = nil;
    index = 1
    if EncounterJournal ~= nil then
        lsh_Off()
    end
    EJ_SelectTier(latestTierIndex)

    -- targetedInstanceId = this index
    while true do
        local lsh_instanceID, lsh_dungeon_instance_name = EJ_GetInstanceByIndex(index, false)
        if not instanceID then break end
        if lsh_dungeon_instance_name == current_lsh_instanceName then
            targetedInstanceId = lsh_instanceID;
            break;
        end
        index = index + 1
    end
    if targetedInstanceId ~= nil then
    
        --check if I am targeting the item with the passed ID
        local function targetingItem(passedItemName)
            for k, v in pairs(targetedItemsDungeon) do
                if v["name"] == passedItemName then
                    local item = Item:CreateFromItemID(v["itemId"])
                    return v["itemId"]
                end
            end
            return nil;
        end

        EJ_SelectInstance(targetedInstanceId)
        local lsh_class_id = select(3,UnitClass('player'))
        local lsh_numSpecializations = GetNumSpecializationsForClassID(lsh_class_id)
        local specTables = {};

        -- get the targeted items for each spec
        for lsh_specFilter = 1, lsh_numSpecializations, 1 do
            local lsh_currentTable = {};
            lsh_spec_id, lsh_name = GetSpecializationInfo(lsh_specFilter)
            EJ_SetLootFilter(lsh_class_id, lsh_spec_id)
            C_EncounterJournal.ResetSlotFilter()
            EJ_SetDifficulty(8) -- 8 is the difficulty for m+

            index = 1
            while true do
                local itemId = C_EncounterJournal.GetLootInfoByIndex(index);
                if not itemId then break end
                -- handle the item
                if targetingItem(itemId["name"]) then
                    table.insert(lsh_currentTable, itemId["name"])
                end
                index = index + 1
            end
            table.insert(specTables, lsh_specFilter, lsh_currentTable)
        end

        local sharedLoot = {};
        -- determine whats shared
        for k,v in pairs(specTables[1]) do
            isSharedLoot = true;
            for lsh_specFilter = 2, lsh_numSpecializations, 1 do
                local lsh_currentTable = specTables[lsh_specFilter];
                local alsoHas = false;
                for _,value in pairs(lsh_currentTable) do
                    if value == v then
                        alsoHas = true;
                        break;
                    end
                end
                if alsoHas == false then
                    isSharedLoot = false;
                end
            end
            if isSharedLoot then
                table.insert( sharedLoot,v )
                for lsh_specFilter = 2, lsh_numSpecializations, 1 do
                    local removalCounter = 1
                    for _,value in pairs(specTables[lsh_specFilter]) do
                        if value == v then
                            break;
                        end
                        removalCounter = removalCounter + 1
                    end
                    table.remove( specTables[lsh_specFilter], removalCounter )
                end
            end
        end
        
        --remove shared from all the other tables
        for k,v in pairs(sharedLoot) do
            local removalCounter = 1
            for _,value in pairs(specTables[1]) do
                if value == v then
                    break;
                end
                removalCounter = removalCounter + 1
            end
            table.remove( specTables[1], removalCounter )
        end
        C_Timer.After(0.1, function()
            if(firstLoading) then
                firstLoading = false
                determineDungeonDropsForLootSpecs(current_lsh_instanceName)
            else
                displaySpecLoot(specTables, sharedLoot, "dungeon")
            end
        end)
    end
    if EncounterJournal ~= nil then
        lsh_On()
    end
end

function LootSpecHelperEventFrame:onLoad()
	AceGUI = LibStub("AceGUI-3.0");
	LootSpecHelperEventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	LootSpecHelperEventFrame:SetScript("OnEvent", LootSpecHelperEventFrame.OnEvent);
	LootSpecHelperEventFrame:RegisterEvent("ENCOUNTER_END")
	LootSpecHelperEventFrame:SetScript("OnEvent", LootSpecHelperEventFrame.OnEvent);
	LootSpecHelperEventFrame:RegisterEvent("EJ_LOOT_DATA_RECIEVED")
	LootSpecHelperEventFrame:SetScript("OnEvent", LootSpecHelperEventFrame.OnEvent);
end

function LootSpecHelperEventFrame:OnEvent(event, text, ... )
	if(event == "PLAYER_ENTERING_WORLD") then
        C_AddOns.LoadAddOn("Blizzard_EncounterJournal")
        C_Timer.After(0.2, function()
            resetLSH()
        end)
    elseif(event == "ADDON_LOADED" ) then
        if(text == "LootSpecHelper") then
            LootSpecHelperEventFrame:LoadSavedVariables();
        end
        if(text == "Blizzard_EncounterJournal") then
            lsh_journal_opened = true;
        end
    elseif(event == "PLAYER_TARGET_CHANGED") then
        checkTarget()
    elseif(event == "ENCOUNTER_END") then
        encounterName, encounterID, difficultyID, groupSize, success = ...;
        -- for RELEASE comment print
        --print("the encounter that just ended has the name  of " .. encounterName)
        if encounterName == mostRecentBoss then
            mostRecentBoss = nil;
        end
    elseif(event == "CHALLENGE_MODE_COMPLETED") then
        local currentInstanceName = GetInstanceInfo()
        if runningTargetedKey == true then
            determineDungeonDropsForLootSpecs(currentInstanceName);
            runningTargetedKey = false;
        end

    elseif(event == "EJ_LOOT_DATA_RECIEVED") then
        checkLoadedItem(text)
    end 
end --function

LootSpecHelperEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
LootSpecHelperEventFrame:RegisterEvent("ADDON_LOADED")
LootSpecHelperEventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
LootSpecHelperEventFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
LootSpecHelperEventFrame:SetScript("OnEvent", LootSpecHelperEventFrame.OnEvent);

function LootSpecHelperEventFrame:LoadSavedVariables()
	if targetedItemsRaid == nil then
        targetedItemsRaid = {};
    end
	if targetedItemsDungeon == nil then
        targetedItemsDungeon = {};
    end
end

function checkLoadedItem(loadedItemId)
    local function buildLink(id, name)
        local specIndex = GetSpecialization();
        local specId = GetSpecializationInfo(specIndex)

        local levelsBonusId = nil;
        local level = dungeonLevel;

        if level == "2" then
            levelsBonusId = 1624
        elseif level == "3" or level == "4" then
            levelsBonusId = 1627
        elseif level == "5" or level == "6" then
            levelsBonusId = 1630
        elseif level == "7" or level == "8" then
            levelsBonusId = 1633
        elseif level == "9" or level == "10" then
            levelsBonusId = 1637
        elseif level == "11" or level == "12" then
            levelsBonusId = 1640
        elseif level == "13" or level == "14" then
            levelsBonusId = 1643
        elseif level == "15" or level == "16" then
            levelsBonusId = 1646
        elseif level == "17" or level == "18" then
            levelsBonusId = 1650
        elseif level == "19" or level == "20+" then
            levelsBonusId = 1653
        else
            print("level was different. " )
            print(dungeonLevel)
        end

        local itemId = id .. ":"
        local enchantID = ":"
        local gemID1 = ":"
        local gemID2 = ":"
        local gemID3 = ":"
        local gemID4 = ":"
        local suffixID = ":"
        local uniqueID = ":"
        local linkLevel = "50:"
        local specializationID = specId .. ":"
        local modifiersMask = ":"
        local itemContext = "22:"
        local numBonusIDs;
        if levelsBonusId ~= nil then
            numBonusIDs = "1:" .. levelsBonusId
        end
        local numModifiers = ":"
        local relic1NumBonusIDs= ":"
        local relic2NumBonusIDs = ":"
        local relic3NumBonusIDs = ":"
        local crafterGUID = ":"
        local extraEnchantID = ":"
        local itemLink2 = "|cffa335ee|Hitem:"..itemId..enchantID..gemID1..gemID2..gemID3..gemID4..suffixID..uniqueID..linkLevel..specializationID..modifiersMask..itemContext..numBonusIDs..numModifiers..relic1NumBonusIDs..relic2NumBonusIDs..relic3NumBonusIDs..crafterGUID..extraEnchantID
        itemLink2 = itemLink2.."|h[" .. name .. "]|h|r"
        return itemLink2
    end    

    
    local lsh_removeCounter = 1;
    for _,v in pairs(notLoadedItems) do
        if v == loadedItemId then
            itemName = GetItemInfo(loadedItemId) 
            local newLink = buildLink( loadedItemId, itemName)
            local indexCounter = 1
            local newRow = nil;
            for _,value in pairs(loot) do
                if value["itemID"] == loadedItemId then
                    newRow = value;
                    break
                end
                indexCounter = indexCounter + 1;
            end
            newRow["link"] = newLink
            newRow["name"] = itemName
            loot[indexCounter] = newRow
        end
        lsh_removeCounter = lsh_removeCounter + 1;
    end
end

function resetLSH()
    disabled = false;
    mostRecentBoss = nil;
    firstLoading = true
    lsh_journal_opened = false;
    LootSpecHelperEventFrame:onLoad();
    inInstance, instanceType = IsInInstance()
    if (inInstance) and (instanceType == "party") then
        local inTargetedInstance = false;
        lsh_instanceName, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceID, instanceGroupSize, LfgDungeonID = GetInstanceInfo()
        for _,v in pairs(targetedItemsDungeon) do
            if v["dungeon"] == lsh_instanceName then
                inTargetedInstance = true;
                runningTargetedKey = true;
                break;
            end
        end
        if inTargetedInstance == true then
            determineDungeonDropsForLootSpecs(lsh_instanceName);
        else
            runningTargetedKey = false;
        end
    end
end

function LootSpecHelperEventFrame:CreateLootSpecHelperWindow()
    local raids, dungeons = self:CustomGetInstanceInfo()

    local function setLoot(key, type, dungeonName, keyLevel, instanceIndex)
        loot = {};
        lootNames = {};
        local class_id = select(3,UnitClass('player'))
        EJ_SetLootFilter(class_id)

        local function lsh_On()
            EncounterJournal:RegisterEvent("EJ_LOOT_DATA_RECIEVED");
            EncounterJournal:RegisterEvent("EJ_DIFFICULTY_UPDATE");
            EncounterJournal:RegisterEvent("UNIT_PORTRAIT_UPDATE");
            EncounterJournal:RegisterEvent("PORTRAITS_UPDATED");
            EncounterJournal:RegisterEvent("SEARCH_DB_LOADED");
            EncounterJournal:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
        end
        local function lsh_Off()
            EncounterJournal:UnregisterEvent("EJ_LOOT_DATA_RECIEVED");
            EncounterJournal:UnregisterEvent("EJ_DIFFICULTY_UPDATE");
            EncounterJournal:UnregisterEvent("UNIT_PORTRAIT_UPDATE");
            EncounterJournal:UnregisterEvent("PORTRAITS_UPDATED");
            EncounterJournal:UnregisterEvent("SEARCH_DB_LOADED");
            EncounterJournal:UnregisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
        end

        if lsh_journal_opened == true then
            lsh_Off()
        end

        if type == "raid" then
            local addingDifficulty = 0;
            local itemContextChange;
            if difficulty == "Lfr" then
                addingDifficulty = 17;
                itemContextChange = Enum.ItemCreationContext.RaidFinderExtended
            elseif difficulty == "Normal" then
                addingDifficulty = 14;
                itemContextChange = Enum.ItemCreationContext.RaidNormalExtended
            elseif difficulty == "Heroic" then
                addingDifficulty = 15;
                itemContextChange = Enum.ItemCreationContext.RaidHeroicExtended
            elseif difficulty == "Mythic" then
                addingDifficulty = 16;
                itemContextChange = Enum.ItemCreationContext.RaidMythicExtended
            elseif difficulty == "All" then
                addingDifficulty = 16;
                itemContextChange = Enum.ItemCreationContext.RaidMythicExtended
            end

            FATED = false;
            EJ_SelectTier(EJ_GetNumTiers())

            local i = 1
            while true do
                local instanceID, name, _, _, _, _, _, _, _, _, mapID = EJ_GetInstanceByIndex(i, true)
                if not mapID then break end
                local fated = C_ModifiedInstance.GetModifiedInstanceInfoFromMapID(mapID)
                if fated then
                    FATED = true
                    break
                end
                i = i+1
            end

            if not FATED then
                EJ_SelectInstance(EJ_GetInstanceByIndex(2, true))
            else
                EJ_SelectInstance(EJ_GetInstanceByIndex(instanceIndex, true))
                local ID, NAME = EJ_GetInstanceByIndex(instanceIndex, true)
            end
            EJ_SelectEncounter(encounterIDs[key])
            EJ_SetDifficulty(addingDifficulty)
            index = 1
            while true do
                local itemId = C_EncounterJournal.GetLootInfoByIndex(index);
                if not itemId then break end
                local name = itemId["name"]
                local itemID = itemId["itemID"]
                local slot = itemId["slot"]
                local encounterID = itemId["encounterID"]
                local icon = itemId["icon"]
                local itemLink = itemId["link"]
                --update the ItemContext in itemLink to be from Fated to increase the item level
                if FATED and itemLink then
                    local parts = strsplittable(':', itemLink)
                    parts[13] = itemContextChange
                    local newItemLink = table.concat(parts, ":")
                    itemLink = newItemLink
                end
                local encounterName = EJ_GetEncounterInfo(encounterID)
                table.insert(loot, {itemID = itemID,  encounterId = encounterID, name = name, icon = icon, slot = slot, bossName = encounterName, link = itemLink});
                table.insert(lootNames, name);
                index = index + 1
            end
        elseif type == "dungeon" then
            local latestTierIndex = EJ_GetNumTiers()
            EJ_SelectTier(latestTierIndex)

            EJ_SelectInstance(encounterIDs[key])
            EJ_SetDifficulty(8)
            for i = 1, EJ_GetNumLoot(), 1 do
                local itemId = C_EncounterJournal.GetLootInfoByIndex(i)
                if not itemId then break end
                local name = itemId["name"]
                local itemID = itemId["itemID"]
                local slot = itemId["slot"]
                local encounterID = itemId["encounterID"]
                local icon = itemId["icon"]
                if name ~= nil then
                    table.insert(loot, {itemID = itemID,  encounterId = encounterID, name = name, icon = icon, slot = slot, dungeon = dungeonName, level = keyLevel+1});
                    table.insert(lootNames, name);
                else
                    table.insert(loot, {itemID = itemID,  encounterId = encounterID, name = name, icon = icon, slot = slot, dungeon = dungeonName, level = keyLevel+1});
                    table.insert(lootNames, name);
                    table.insert( notLoadedItems, itemID )
                end
            end
        end
        if lsh_journal_opened == true then
            lsh_On()
        end
    end

    local function NewItemPopupRaid(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent)
        local function addToTargeted()
            -- check if the item is already in the targeted list with the passed difficulty
            local function checkContains(checkDifficulty)
                for _,checkingV in pairs(targetedItemsRaid) do
                    if (selectedItem["itemID"] == checkingV["itemId"]) and (checkDifficulty == checkingV["difficulty"]) then
                        return true
                    end
                end
                return false
            end

            if difficulty == "All" then
                -- if the lfr item isnt already targeted, add it
                if checkContains("Lfr") == false then
                    local class_id = select(3,UnitClass('player'))
                    local properLink = selectedItem["link"]
                    EJ_SetLootFilter(class_id)
                    EJ_SelectEncounter(selectedItem["encounterId"])
                    EJ_SetDifficulty(17)
                    index = 1
                    table.insert(targetedItemsRaid, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], difficulty = "Lfr", boss = selectedItem["bossName"], encounterId = selectedItem["encounterId"], link = properLink})
                end

                -- if the normal item isnt already targeted, add it
                if checkContains("Normal") == false then
                    local class_id = select(3,UnitClass('player'))
                    local properLink = selectedItem["link"]
                    EJ_SetLootFilter(class_id)
                    EJ_SelectEncounter(selectedItem["encounterId"])
                    EJ_SetDifficulty(14)
                    index = 1
                    table.insert(targetedItemsRaid, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], difficulty = "Normal", boss = selectedItem["bossName"], encounterId = selectedItem["encounterId"], link = properLink})
                end

                -- if the heroic item isnt already targeted, add it
                if checkContains("Heroic") == false then
                    local class_id = select(3,UnitClass('player'))
                    local properLink = selectedItem["link"]
                    EJ_SetLootFilter(class_id)
                    EJ_SelectEncounter(selectedItem["encounterId"])
                    EJ_SetDifficulty(15)
                    index = 1
                    table.insert(targetedItemsRaid, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], difficulty = "Heroic", boss = selectedItem["bossName"], encounterId = selectedItem["encounterId"], link = properLink})
                end

                -- if the mythic item isnt already targeted, add it
                if checkContains("Mythic") == false then
                    local class_id = select(3,UnitClass('player'))
                    local properLink = selectedItem["link"]
                    EJ_SetLootFilter(class_id)
                    EJ_SelectEncounter(selectedItem["encounterId"])
                    EJ_SetDifficulty(16)
                    index = 1
                    table.insert(targetedItemsRaid, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], difficulty = "Mythic", boss = selectedItem["bossName"], encounterId = selectedItem["encounterId"], link = properLink})
                end

                return
            end

            local difficultyMap = {
                ["Lfr"] = {"Normal", "Heroic", "Mythic"},
                ["Normal"] = {"Heroic", "Mythic"},
                ["Heroic"] = {"Mythic"},
                ["Mythic"] = {}
            }

            local difficulties = difficultyMap[difficulty]
            table.insert(difficulties, 1, difficulty) -- Add the selected difficulty to the front of the list

            -- add all the difficulties including and above the selected one
            for _, diff in ipairs(difficulties) do
                if checkContains(diff) == false then
                    local class_id = select(3,UnitClass('player'))
                    local properLink = selectedItem["link"]
                    EJ_SetLootFilter(class_id)
                    EJ_SelectEncounter(selectedItem["encounterId"])
                    local difficultyId = diff == "Lfr" and 17 or (diff == "Normal" and 14 or (diff == "Heroic" and 15 or 16))

                    EJ_SetDifficulty(difficultyId)
                    index = 1

                    table.insert(targetedItemsRaid, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], difficulty = diff, boss = selectedItem["bossName"], encounterId = selectedItem["encounterId"], link = properLink})
                end
            end
        end

        raidSaved = false;

        addFrameGlobal = AceGUI:Create("Frame")
        if lsh_currentPoint ~= nil then
            addFrameGlobal:SetPoint(lsh_currentPoint, lsh_returnedX, lsh_returnedY)
        end
        addFrameGlobal:SetWidth(250)
	    addFrameGlobal:SetTitle("Add Raid Item")

        FATED = false;
        EJ_SelectTier(EJ_GetNumTiers())
        local i = 1
        while true do
            local instanceID, name, _, _, _, _, _, _, _, _, mapID = EJ_GetInstanceByIndex(i, true)
            if not mapID then break end
            local fated = C_ModifiedInstance.GetModifiedInstanceInfoFromMapID(mapID)
            if fated then
                FATED = true
                break
            end
            i = i+1
        end

        local raidName = nil

        local bossDropdown = AceGUI:Create("Dropdown");

        if FATED then
            local raidDropdown = AceGUI:Create("Dropdown")
        -- -- UPDATE: step 7: update these raid names for fated
        -- -- if FATED is true, make a dropdown for the current expansions raids
            local raidNames = {
                "Vault of the Incarnates",
                "Aberrus, the Shadowed Crucible",
                "Amirdrassil, the Dream's Hope"
            }
            raidDropdown:SetList(raidNames)
            raidDropdown:SetText("Raid")
            -- --on change set raid to the selected raid
            raidDropdown:SetCallback("OnValueChanged", function(widget, event, key)
                raidIndex = key+1
                raidName = raidNames[key]
                raidIndexSelector = key;
                
                bossesOnly = {}
                encounterIDs = {}

                --get info for each boss
                for k,v in pairs(raids) do
                    if (type(v) == "table") then
                        if raidName == nil or v["instanceName"] == raidName then
                            for key, value in pairs(v) do
                                if (type(value) == "table") then
                                    for newkey, newvalue in pairs(value) do
                                        if (type(newvalue) == "table") then
                                            table.insert(bossesOnly, newvalue["name"])
                                            table.insert(encounterIDs, newvalue["id"])
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                bossDropdown:SetList(bossesOnly)
                bossDropdown:SetValue(nil)
                bossDropdown:SetText("Boss")
            end)

            if(raidIndexSelector ~= nil) then
                raidDropdown:SetValue(raidIndexSelector)
            end
            addFrameGlobal:AddChild(raidDropdown)
        else
            bossesOnly = {};
            --get info for each boss
            for k,v in pairs(raids) do
                if (type(v) == "table") then
                    for key, value in pairs(v) do
                        if (type(value) == "table") then
                            for newkey, newvalue in pairs(value) do
                                if (type(newvalue) == "table") then
                                    table.insert(bossesOnly, newvalue["name"])
                                    table.insert(encounterIDs, newvalue["id"])
                                end
                            end
                        end
                    end
                end
            end
            bossDropdown:SetList(bossesOnly)
        end

        local difficultyDropdown = AceGUI:Create("Dropdown")
        difficultyDropdown:SetList(raidDifficulties)
        difficultyDropdown:SetText("Difficulty")
        difficultyDropdown:SetCallback("OnValueChanged", function(widget, event, key)
            difficulty = raidDifficulties[key];
            difficultyIndex = key;
        end)
        if difficultyIndex ~= nil then
            difficultyDropdown:SetValue(difficultyIndex)
        end
        addFrameGlobal:AddChild(difficultyDropdown);

        bossDropdown:SetList(bossesOnly);
        bossDropdown:SetText("Boss");
        bossDropdown:SetCallback("OnValueChanged", function(widget, event, key)
            boss = bossesOnly[key];
            bossIndex = key;
            setLoot(key, "raid", nil, nil, raidIndex);
            if encounterLoadedStatus[boss] == false then
                encounterLoadedStatus[boss] = true
                C_Timer.After(0.1, function()
                    setLoot(key, "raid", nil, nil, raidIndex);
                end)
            end
            C_Timer.After(0.2, function()
                local lsh_currentPoint, lsh_returnedTableThing, lsh_currentPointRepeat, lsh_returnedX, lsh_returnedY = addFrameGlobal:GetPoint()
                addFrameGlobal:ReleaseChildren();
                addFrameGlobal:Release();
                NewItemPopupRaid(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent)
            end)
        end)
        if bossIndex ~= nil then
            bossDropdown:SetValue(bossIndex)
        end

        addFrameGlobal:AddChild(bossDropdown);

        local lootDropdown = AceGUI:Create("Dropdown")
        lootDropdown:SetList(lootNames)
        lootDropdown:SetText("Loot Item")
        lootDropdown:SetCallback("OnValueChanged", function(lootWidget, lootEvent, lootKey)
            selectedItem = loot[lootKey]
        end)
        addFrameGlobal:AddChild(lootDropdown);

        local saveButton = AceGUI:Create("Button");
        saveButton:SetText("Save");
        saveButton:SetCallback("OnClick", function(widget)
            if (difficulty ~= nil) and (boss ~= nil) and (selectedItem ~= nil) then
                addToTargeted();
                AceGUI:Release(addFrameGlobal)
                addFrameGlobal = nil;
                difficulty = nil;
                difficultyIndex = nil;
                boss = nil;
                bossIndex = nil;
                raidIndexSelector = nil;
                selectedItem = nil;
                raidSaved = true;
                loot = {};
                lootNames = {};
                globalTab:SelectTab("tab1")
                if parent ~= nil then
                    parent:DoLayout()
                end
            else
                --TODO: space this out more vertically, and center it horizontally
                local errorFrame = AceGUI:Create("Window")
                errorFrame:SetWidth(200)
                errorFrame:SetHeight(200)
                errorFrame:SetTitle("Error")
                errorFrame:SetLayout("Flow")

                local errorMessage = AceGUI:Create("InteractiveLabel");
                errorMessage:SetText("You must include a difficulty, boss and loot item");
                errorMessage:SetFullWidth(true)
                errorFrame:AddChild(errorMessage);

                local okButton = AceGUI:Create("Button");
                okButton:SetText("OK");
                okButton:SetWidth(175)
                okButton:SetCallback("OnClick", function()
                    local lsh_currentPoint, lsh_returnedTableThing, lsh_currentPointRepeat, lsh_returnedX, lsh_returnedY = addFrameGlobal:GetPoint()
                    addFrameGlobal:ReleaseChildren();
                    addFrameGlobal:Release();
                    NewItemPopupRaid(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent)
                end);
                errorFrame:AddChild(okButton);
                addFrameGlobal:AddChild(errorFrame)
            end
        end)
        saveButton:SetWidth(200);
        addFrameGlobal:AddChild(saveButton);
        addFrameGlobal:SetCallback("OnClose", function(widget)
            widget:ReleaseChildren();
            AceGUI:Release(widget);
            if raidSaved == true then
                difficulty = nil;
                difficultyIndex = nil;
                boss = nil;
                bossIndex = nil;
                raidIndexSelector = nil;
            end
            selectedItem = nil;
            addFrameGlobal = nil;
        end)
    end -- new item popup raid

    local function NewItemPopupDungeon(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent)
        local function addToTargeted()
            -- loop through and make sure it isnt already there
            for k,v in pairs(targetedItemsDungeon) do
                if (selectedItem["itemID"] == v["itemId"]) then
                    return
                end
            end

            table.insert(targetedItemsDungeon, {itemId = selectedItem["itemID"], name = selectedItem["name"], icon = selectedItem["icon"], dungeon = selectedItem["dungeon"], level = selectedItem["level"]})
        end

        encounterIDs = {};
        dungeonSaved = false;

        addFrameGlobal = AceGUI:Create("Frame")
        if lsh_currentPoint ~= nil then
            addFrameGlobal:SetPoint(lsh_currentPoint, lsh_returnedX, lsh_returnedY)
        end
        addFrameGlobal:SetWidth(250)
	    addFrameGlobal:SetTitle("Add Dungeon Item")

        local dungeonsOnly = {};
        --get raid bosses info
        for k,v in pairs(dungeons) do
            if (type(v) == "table") then
                table.insert(dungeonsOnly, v["instanceName"])
                table.insert(encounterIDs, v["instanceID"])
            end
        end

        local keyLevelDropdown = AceGUI:Create("Dropdown");
        keyLevelDropdown:SetList(keyLevels);
        keyLevelDropdown:SetText("Key Level");
        if dungeonLevelIndex ~= nil then
            keyLevelDropdown:SetValue(dungeonLevelIndex)
        end
        keyLevelDropdown:SetCallback("OnValueChanged", function(widget, event, key)
            dungeonLevel = keyLevels[key];
            dungeonLevelIndex = key;
            if dungeonIndex ~= nil then
                setLoot(dungeonIndex, "dungeon", dungeon, dungeonLevelIndex);
                C_Timer.After(0.4, function()
                    local lsh_currentPoint, lsh_returnedTableThing, lsh_currentPointRepeat, lsh_returnedX, lsh_returnedY = addFrameGlobal:GetPoint()
                    addFrameGlobal:ReleaseChildren();
                    addFrameGlobal:Release();
                    NewItemPopupDungeon(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent);
                end)
            end
        end)
        addFrameGlobal:AddChild(keyLevelDropdown);

        local dungeonDropdown = AceGUI:Create("Dropdown");
        dungeonDropdown:SetList(dungeonsOnly);
        dungeonDropdown:SetText("Dungeon");
        if dungeonIndex ~= nil then
            dungeonDropdown:SetValue(dungeonIndex)
        end
        dungeonDropdown:SetCallback("OnValueChanged", function(widget, event, key)
            dungeon = dungeonsOnly[key];
            dungeonIndex = key;
            setLoot(key, "dungeon", dungeon, dungeonLevelIndex);
            if encounterLoadedStatus[dungeon] == false then
                encounterLoadedStatus[dungeon] = true
                C_Timer.After(0.1, function()
                    setLoot(key, "dungeon", dungeon, dungeonLevelIndex);
                end)
            end
            C_Timer.After(0.2, function()
                local lsh_currentPoint, lsh_returnedTableThing, lsh_currentPointRepeat, lsh_returnedX, lsh_returnedY = addFrameGlobal:GetPoint()
                addFrameGlobal:ReleaseChildren();
                addFrameGlobal:Release();
                NewItemPopupDungeon(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent);
            end)
        end)
        addFrameGlobal:AddChild(dungeonDropdown);

        local lootDropdown = AceGUI:Create("Dropdown")
        lootDropdown:SetList(lootNames)
        lootDropdown:SetText("Loot Item")
        lootDropdown:SetCallback("OnValueChanged", function(lootWidget, lootEvent, lootKey)
            selectedItem = loot[lootKey]
        end)
        addFrameGlobal:AddChild(lootDropdown);

        local saveButton = AceGUI:Create("Button");
        saveButton:SetText("Save");
        saveButton:SetCallback("OnClick", function(widget)
            if (dungeon ~= nil) and (selectedItem ~= nil) then
                addToTargeted();
                AceGUI:Release(addFrameGlobal)
                addFrameGlobal = nil;
                dungeon = nil;
                dungeonIndex = nil;
                dungeonLevel = nil;
                dungeonLevelIndex = nil;
                selectedItem = nil;
                dungeonSaved = true;
                globalTab:SelectTab("tab2")
                if parent ~= nil then
                    parent:DoLayout()
                end
            else
                --TODO: space this out more vertically, and center it horizontally
                local errorFrame = AceGUI:Create("Window")
                errorFrame:SetWidth(200)
                errorFrame:SetHeight(200)
                errorFrame:SetTitle("Error")

                local errorMessage = AceGUI:Create("InteractiveLabel");
                errorMessage:SetText("You must include a dungeon and loot item");
                errorFrame:AddChild(errorMessage);

                local okButton = AceGUI:Create("Button");
                okButton:SetText("OK");
                okButton:SetWidth(175)
                okButton:SetCallback("OnClick", function()
                    local lsh_currentPoint, lsh_returnedTableThing, lsh_currentPointRepeat, lsh_returnedX, lsh_returnedY = addFrameGlobal:GetPoint()
                    addFrameGlobal:ReleaseChildren();
                    addFrameGlobal:Release();
                    NewItemPopupDungeon(lsh_currentPoint, lsh_returnedX, lsh_returnedY, parent)
                end);
                errorFrame:AddChild(okButton);
                addFrameGlobal:AddChild(errorFrame)
            end
        end)
        saveButton:SetWidth(200);
        addFrameGlobal:AddChild(saveButton);
        addFrameGlobal:SetCallback("OnClose", function(widget)
            widget:ReleaseChildren();
            AceGUI:Release(widget);
            if dungeonSaved == true then
                dungeon = nil;
                dungeonIndex = nil;
                dungeonLevel = nil;
                dungeonLevelIndex = nil;
            end
            selectedItem = nil;
            addFrameGlobal = nil;
        end)
    end -- new item popup dungeon

	local function DrawRaid(container)
        local function removeTargetedItem(itemId, difficulty)
            for k,v in pairs(targetedItemsRaid) do
                if (v["itemId"] == itemId) and (v["difficulty"] == difficulty) then
                    table.remove( targetedItemsRaid, k)
                end
            end
        end

        raidTabContainer = AceGUI:Create("SimpleGroup");
        raidTabContainer:SetFullWidth(true);
        raidTabContainer:SetFullHeight(true);
        raidTabContainer:SetLayout("Fill");
        container:AddChild(raidTabContainer);

        raidScroll = AceGUI:Create("ScrollFrame");
        raidScroll:SetLayout("Flow");
        raidTabContainer:AddChild(raidScroll);

        -- Create a full-width container
        local container = AceGUI:Create("SimpleGroup")
        container:SetFullWidth(true)
        container:SetLayout("Flow")
        raidScroll:AddChild(container)

        -- Create a spacer
        local spacer1 = AceGUI:Create("Label")
        spacer1:SetText(" ")
        spacer1:SetWidth(10) --hardcoded to properly center when the window first opens
        container:AddChild(spacer1)

        -- Create the button
        local button = AceGUI:Create("Button")
        button:SetText("Add item")
        button:SetWidth(325)
        button:SetCallback("OnClick", function() NewItemPopupRaid(nil, nil, nil, raidScroll) end)
        container:AddChild(button)

        -- Create another spacer
        local spacer2 = AceGUI:Create("Label")
        spacer2:SetText(" ")
        container:AddChild(spacer2)

        -- Set up an OnUpdate script on the container's frame
        container.frame:SetScript("OnUpdate", function()
            -- Calculate the width of the spacers
            local spacerWidth = (container.frame:GetWidth() - button.frame:GetWidth() - 20) / 2  -- Subtract a fixed value

            -- Set the width of the spacers
            spacer1:SetWidth(spacerWidth)
            spacer2:SetWidth(spacerWidth)
        end)

        targetedItemContainer = AceGUI:Create("SimpleGroup");
        targetedItemContainer:SetLayout("List");
        targetedItemContainer:SetFullWidth(true);
        raidScroll:AddChild(targetedItemContainer);

        -- Create a table to group items by boss and name
        local groupedItems = {}
        for k,v in pairs(targetedItemsRaid) do
            if not groupedItems[v["boss"]] then
                groupedItems[v["boss"]] = {}
            end
            if not groupedItems[v["boss"]][v["name"]] then
                groupedItems[v["boss"]][v["name"]] = {v}
            else
                table.insert(groupedItems[v["boss"]][v["name"]], v)
            end
        end

        -- Now create containers for each boss
        for boss, items in pairs(groupedItems) do
            -- Create a container for the boss
            local bossContainer = AceGUI:Create("InlineGroup")
            bossContainer:SetLayout("Flow")
            bossContainer:SetFullWidth(true)
            targetedItemContainer:AddChild(bossContainer)

            -- Create a label for the boss and add it to the container
            local bossLabel = AceGUI:Create("InteractiveLabel")
            bossLabel:SetText(boss)
            bossLabel:SetColor(1, 0, 0) -- Set the color to red. Values are RGB.
            bossLabel:SetFontObject(GameFontNormalLarge)
            bossLabel:SetFullWidth(true)
            bossContainer:AddChild(bossLabel)

            -- Add items to the boss container
            for itemName, itemGroup in pairs(items) do
                -- Create a card container for the item
                local cardContainer = AceGUI:Create("InlineGroup")
                cardContainer:SetLayout("Flow")
                cardContainer:SetWidth(150)
                bossContainer:AddChild(cardContainer)

                -- Create a label for the item
                local targetItem = AceGUI:Create("InteractiveLabel")
                local difficulties = {}

                for _, item in ipairs(itemGroup) do
                    table.insert(difficulties, item["difficulty"])
                end

                local difficultiesStr = table.concat(difficulties, "\n")

                -- Count the number of lines in difficultiesStr
                local _, numLines = difficultiesStr:gsub("\n", "\n")
                -- If there are less than 5 lines, add the necessary number of newline characters
                if numLines < 5 then
                    difficultiesStr = difficultiesStr .. string.rep("\n", 5 - numLines)
                end

                -- Create a hidden font string
                local fontString = targetItem.frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")

                function truncateString(str, maxWidth)
                    -- Set the text of the font string to your string
                    fontString:SetText(str)

                    while fontString:GetStringWidth() > maxWidth do
                        -- Remove the last character from str
                        str = str:sub(1, -2)

                        -- Update the text of the font string
                        fontString:SetText(str)
                    end

                    -- Add "..." at the end of str
                    str = str .. "..."

                    return str
                end

                local truncatedItemName = truncateString(itemName, 150)
                targetItem:SetText(truncatedItemName .. "\n" .. difficultiesStr)
                targetItem:SetImage(GetItemIcon(itemGroup[1]["itemId"]))
                targetItem:SetImageSize(50,50)
                targetItem:SetCallback("OnEnter", function(widget)
                    GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                    if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                        GameTooltip_ShowCompareItem(GameTooltip)
                    end
                    GameTooltip:SetHyperlink(itemGroup[1]["link"])
                end)
                targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                cardContainer:AddChild(targetItem)

                local difficultyMap = {
                    ["All"] = {"Mythic", "Heroic", "Normal", "Lfr"},
                    ["Mythic"] = {"Heroic", "Normal", "Lfr"},
                    ["Heroic"] = {"Normal", "Lfr"},
                    ["Normal"] = {"Lfr"},
                    ["Lfr"] = {}
                }

                -- Create a delete button for the item
                local deleteButton = AceGUI:Create("Button")
                deleteButton:SetHeight(20)
                deleteButton:SetWidth(100)
                deleteButton:SetText("DELETE")
                deleteButton:SetCallback("OnClick", function()
                    -- Create a new frame for the popup
                    local popupFrame = AceGUI:Create("Frame")
                    popupFrame:SetTitle("Delete Items")
                    popupFrame:SetLayout("Flow")
                    popupFrame:SetWidth(300)
                    popupFrame:SetHeight(200)

                    -- Create a label for the dropdown
                    local label = AceGUI:Create("Label")
                    label:SetText("Select the highest difficulty to delete. All lower difficulties will also be deleted.")
                    popupFrame:AddChild(label)

                    -- Create the dropdown
                    local difficultyDropdown = AceGUI:Create("Dropdown")
                    difficultyDropdown:SetList(raidDifficulties)
                    difficultyDropdown:SetText("Difficulty")
                    difficultyDropdown:SetCallback("OnValueChanged", function(widget, event, key)
                        -- Get the selected difficulty
                        local selectedDifficulty = raidDifficulties[key]
                    
                        -- Delete the items of the selected difficulty and all lower difficulties
                        for _, item in ipairs(itemGroup) do
                            if item["difficulty"] == selectedDifficulty or (difficultyMap[selectedDifficulty] and tContains(difficultyMap[selectedDifficulty], item["difficulty"])) then
                                removeTargetedItem(item["itemId"], item["difficulty"])
                            end
                        end
                        popupFrame:Hide()
                        globalTab:SelectTab("tab1")

                        -- Manually trigger the OnUpdate script
                        container.frame:GetScript("OnUpdate")()
                        raidScroll:DoLayout()
                    end)
                    if difficultyIndex ~= nil then
                        difficultyDropdown:SetValue(difficultyIndex)
                    end
                    popupFrame:AddChild(difficultyDropdown)
                end)
                cardContainer:AddChild(deleteButton)
            end
        end
        C_Timer.After(0.1, function()
            raidScroll:DoLayout()
        end)
    end -- draw raid

	local function DrawDungeon(container)
        local function removeTargetedItem(itemId)
            for k,v in pairs(targetedItemsDungeon) do
                if (v["itemId"] == itemId) then
                    table.remove(targetedItemsDungeon, k)
                end
            end
        end

        --UPDATE: step 3: update these ilvls/ranks for the new dungeon levels.
            -- local keyLevelInformation = {
            --     [2] = {ilvl = 441, upgradeLevel = 1, upgradeMax = 8},
            --     [3] = {ilvl = 444, upgradeLevel = 2, upgradeMax = 8},
            --     [4] = {ilvl = 444, upgradeLevel = 2, upgradeMax = 8},
            --     [5] = {ilvl = 447, upgradeLevel = 3, upgradeMax = 8},
            --     [6] = {ilvl = 447, upgradeLevel = 3, upgradeMax = 8},
            --     [7] = {ilvl = 450, upgradeLevel = 4, upgradeMax = 8},
            --     [8] = {ilvl = 450, upgradeLevel = 4, upgradeMax = 8},
            --     [9] = {ilvl = 454, upgradeLevel = 1, upgradeMax = 8},
            --     [10] = {ilvl = 454, upgradeLevel = 1, upgradeMax = 8},
            --     [11] = {ilvl = 457, upgradeLevel = 2, upgradeMax = 8},
            --     [12] = {ilvl = 457, upgradeLevel = 2, upgradeMax = 8},
            --     [13] = {ilvl = 460, upgradeLevel = 3, upgradeMax = 8},
            --     [14] = {ilvl = 460, upgradeLevel = 3, upgradeMax = 8},
            --     [15] = {ilvl = 463, upgradeLevel = 4, upgradeMax = 8},
            --     [16] = {ilvl = 463, upgradeLevel = 4, upgradeMax = 8},
            --     [17] = {ilvl = 467, upgradeLevel = 1, upgradeMax = 6},
            --     [18] = {ilvl = 467, upgradeLevel = 1, upgradeMax = 6},
            --     [19] = {ilvl = 470, upgradeLevel = 2, upgradeMax = 6},
            --     [20] = {ilvl = 470, upgradeLevel = 2, upgradeMax = 6},
            --     [21] = {ilvl = 483, upgradeLevel = 6, upgradeMax = 6}, -- max rank from +20 loot
            --     [22] = {ilvl = 489, upgradeLevel = 4, upgradeMax = 4} -- max rank for max vault loot
            -- }
        -- using this for fated since levels are fucked
        local keyLevelInformation = {
            [2] = {ilvl = 496, upgradeLevel = 2, upgradeMax = 8},
            [3] = {ilvl = 499, upgradeLevel = 3, upgradeMax = 8},
            [4] = {ilvl = 499, upgradeLevel = 3, upgradeMax = 8},
            [5] = {ilvl = 502, upgradeLevel = 4, upgradeMax = 8},
            [6] = {ilvl = 502, upgradeLevel = 4, upgradeMax = 8},
            [7] = {ilvl = 506, upgradeLevel = 1, upgradeMax = 6},
            [8] = {ilvl = 506, upgradeLevel = 1, upgradeMax = 6},
            [9] = {ilvl = 509, upgradeLevel = 2, upgradeMax = 6},
            [10] = {ilvl = 509, upgradeLevel = 2, upgradeMax = 6},
            [11] = {ilvl = 522, upgradeLevel = 6, upgradeMax = 6}, -- max rank from +10 loot
            [12] = {ilvl = 528, upgradeLevel = 4, upgradeMax = 4} -- max rank for max vault loot
        }

        local function GenerateTooltip(itemID, keyLevel)
            local upgradeLevel = keyLevelInformation[keyLevel]["upgradeLevel"];
            local upgradeMax = keyLevelInformation[keyLevel]["upgradeMax"];
            local itemLevel = keyLevelInformation[keyLevel]["ilvl"];
            local tooltipData = C_TooltipInfo.GetItemKey(itemID, itemLevel, 0)

            if keyLevel == 21 then
                keyLevel = 20
            elseif keyLevel == 22 then
                keyLevel = "Vault"
            end
        
            tooltipData.lines[1].leftColor = ITEM_QUALITY_COLORS[Enum.ItemQuality.Epic].color
            table.insert(tooltipData.lines, 2, {
            type = 0,
            leftText = PLAYER_DIFFICULTY_MYTHIC_PLUS .. " " .. keyLevel,
            leftColor = GREEN_FONT_COLOR,
            })
            table.insert(tooltipData.lines, 4, {
            type = 0,
            leftText = ITEM_UPGRADE_TOOLTIP_FORMAT:format(upgradeLevel, upgradeMax),
            leftColor = NORMAL_FONT_COLOR,
            })
            for index, line in ipairs(tooltipData.lines) do
            if line.leftText == AUCTION_HOUSE_BUCKET_VARIATION_EQUIPMENT_TOOLTIP then
                table.remove(tooltipData.lines, index)
                table.remove(tooltipData.lines, index - 1)
                break
            end
            end
            local info = {
            tooltipData = tooltipData,
            }
            GameTooltip:ProcessInfo(info)
            GameTooltip:Show()
        end

        dungeonTabContainer = AceGUI:Create("SimpleGroup");
        dungeonTabContainer:SetFullWidth(true);
        dungeonTabContainer:SetFullHeight(true);
        dungeonTabContainer:SetLayout("Fill");
        container:AddChild(dungeonTabContainer);

        dungeonScroll = AceGUI:Create("ScrollFrame");
        dungeonScroll:SetLayout("Flow");
        dungeonTabContainer:AddChild(dungeonScroll);

        -- Create a full-width container
        local container = AceGUI:Create("SimpleGroup")
        container:SetFullWidth(true)
        container:SetLayout("Flow")
        dungeonScroll:AddChild(container)

        -- Create a spacer
        local spacer1 = AceGUI:Create("Label")
        spacer1:SetText(" ")
        spacer1:SetWidth(10) --hardcoded to properly center when the window first opens
        container:AddChild(spacer1)

        -- Create the button
        local button = AceGUI:Create("Button")
        button:SetText("Add item")
        button:SetWidth(325)
        button:SetCallback("OnClick", function() NewItemPopupDungeon(nil, nil, nil, dungeonScroll) end)
        container:AddChild(button)

        -- Create another spacer
        local spacer2 = AceGUI:Create("Label")
        spacer2:SetText(" ")
        container:AddChild(spacer2)

        -- Set up an OnUpdate script on the container's frame
        container.frame:SetScript("OnUpdate", function()
            -- Calculate the width of the spacers
            local spacerWidth = (container.frame:GetWidth() - button.frame:GetWidth()) / 2

            -- Set the width of the spacers
            spacer1:SetWidth(spacerWidth)
            spacer2:SetWidth(spacerWidth)
        end)
        
        targetedItemContainer = AceGUI:Create("SimpleGroup");
        targetedItemContainer:SetLayout("List");
        targetedItemContainer:SetFullWidth(true);
        dungeonScroll:AddChild(targetedItemContainer);

        -- Create a table to group items by dungeon and name
        local groupedItems = {}
        for k,v in pairs(targetedItemsDungeon) do
            if not groupedItems[v["dungeon"]] then
                groupedItems[v["dungeon"]] = {}
            end
            if not groupedItems[v["dungeon"]][v["name"]] then
                groupedItems[v["dungeon"]][v["name"]] = {v}
            else
                table.insert(groupedItems[v["dungeon"]][v["name"]], v)
            end
        end

        -- Now create containers for each dungeon
        for dungeon, items in pairs(groupedItems) do
            -- Create a container for the dungeon
            local dungeonContainer = AceGUI:Create("InlineGroup")
            dungeonContainer:SetLayout("Flow")
            dungeonContainer:SetFullWidth(true)
            targetedItemContainer:AddChild(dungeonContainer)

            -- Create a label for the dungeon and add it to the container
            local dungeonLabel = AceGUI:Create("InteractiveLabel")
            dungeonLabel:SetText(dungeon)
            dungeonLabel:SetColor(1, 0, 0) -- Set the color to red. Values are RGB.
            dungeonLabel:SetFontObject(GameFontNormalLarge)
            dungeonLabel:SetFullWidth(true)
            dungeonContainer:AddChild(dungeonLabel)

            -- Add items to the dungeon container
            for itemName, itemGroup in pairs(items) do
                -- Create a card container for the item
                local cardContainer = AceGUI:Create("InlineGroup")
                cardContainer:SetLayout("Flow")
                cardContainer:SetWidth(150)
                dungeonContainer:AddChild(cardContainer)

                -- Create a label for the item
                local targetItem = AceGUI:Create("InteractiveLabel")

                -- Create a hidden font string
                local fontString = targetItem.frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")

                function truncateString(str, maxWidth)
                    -- Set the text of the font string to your string
                    fontString:SetText(str)
                
                    -- Check if the string is longer than maxWidth
                    if fontString:GetStringWidth() > maxWidth then
                        while fontString:GetStringWidth() > maxWidth do
                            -- Remove the last character from str
                            str = str:sub(1, -2)
                
                            -- Update the text of the font string
                            fontString:SetText(str)
                        end
                
                        -- Add "..." at the end of str
                        str = str .. "..."
                    end
                
                    return str
                end

                local truncatedItemName = truncateString(itemName, 150)
                targetItem:SetText(truncatedItemName)
                targetItem:SetImage(GetItemIcon(itemGroup[1]["itemId"]))
                targetItem:SetImageSize(50,50)
                targetItem:SetCallback("OnEnter", function(widget)
                    GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                    if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                        GameTooltip_ShowCompareItem(GameTooltip)
                    end
                    local item = Item:CreateFromItemID(itemGroup[1]["itemId"])
                    item:ContinueOnItemLoad(function()
                        GenerateTooltip(itemGroup[1]["itemId"], itemGroup[1]["level"])
                    end)
                end)
                targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                cardContainer:AddChild(targetItem)

                -- Create a delete button for the item
                local deleteButton = AceGUI:Create("Button")
                deleteButton:SetHeight(20)
                deleteButton:SetWidth(100)
                deleteButton:SetText("DELETE")
                deleteButton:SetCallback("OnClick", function()
                    -- Delete the item
                    removeTargetedItem(itemGroup[1]["itemId"])

                    globalTab:SelectTab("tab2")
                    -- Manually trigger the OnUpdate script
                    container.frame:GetScript("OnUpdate")()
                    dungeonScroll:DoLayout()
                end)
                cardContainer:AddChild(deleteButton)
            end
        end
        C_Timer.After(0.1, function()
            dungeonScroll:DoLayout()
        end)
    end -- draw dungeon

    -- Callback function for OnGroupSelected
	local function SelectGroup(container, event, group)
        container:ReleaseChildren();
        if group == "tab1" then
           DrawRaid(container)
        elseif group == "tab2" then
           DrawDungeon(container)
        end
     end

    -- Create the frame container
    local frame = AceGUI:Create("Frame", "LootSpecHelper Main Frame")

    -- Add the frame as a global variable under the name `MyGlobalFrameName`
    _G["LootSpecHelperGlobalFrameName"] = frame.frame
    -- Register the global variable `MyGlobalFrameName` as a "special frame"
    -- so that it is closed when the escape key is pressed.
    tinsert(UISpecialFrames, "LootSpecHelperGlobalFrameName")

    frame:SetWidth(425)
    frame:SetHeight(500)
    frame:SetTitle("LootSpecHelper")
    frame:SetStatusText("Created by Van on Stormrage.")
    frame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
        if addFrameGlobal ~= nil then
            addFrameGlobal:ReleaseChildren()
            addFrameGlobal:Release()
            addFrameGlobal = nil;
        end

        difficulty = nil;
        difficultyIndex = nil;
        boss = nil;
        bossIndex = nil;
        selectedItem = nil;
        raidIndexSelector = nil;

        dungeon = nil;
        dungeonIndex = nil;
        dungeonLevel = nil;
        dungeonLevelIndex = nil;
    end)

    -- Fill Layout - the TabGroup widget will fill the whole frame
    frame:SetLayout("Flow")

    -- create and add the button with the text "Reset Popups", add the tooltip "Resets and reactivates LootSpecHelper pop-ups.\nUse /lsh reset in chat for the same action.", then add it to frame
    local resetButton = AceGUI:Create("Button")
    resetButton:SetText("Reset Popups")
    resetButton:SetFullWidth(true)
    resetButton:SetCallback("OnClick", function(widget)
        print("LootSpecHelper popups reset.")
        frame:Fire("OnClose")
        resetLSH()
    end)
    resetButton:SetUserData("tooltip", "Resets and reactivates LootSpecHelper pop-ups.\nUse /lsh reset in chat for the same action.")
    resetButton:SetCallback("OnEnter", function(widget)
        local tooltip = widget:GetUserData("tooltip")
        GameTooltip:SetOwner(widget.frame, "ANCHOR_CURSOR")
        GameTooltip:SetText(tooltip)
        GameTooltip:Show()
    end)
    resetButton:SetCallback("OnLeave", function(widget)
        GameTooltip:Hide()
    end)
    frame:AddChild(resetButton)

    -- Create and add the disabled checkbox 
    local checkbox = AceGUI:Create("CheckBox")
    checkbox:SetLabel("Disable LootSpecHelper")
    checkbox:SetHeight(25)
    checkbox:SetFullWidth(true)
    checkbox:SetValue(disabled)
    -- Set a callback for the checkbox
    checkbox:SetCallback("OnValueChanged", function(widget, event)
        -- Update your variable with the current value of the checkbox
        disabled = widget:GetValue()
    end)
    -- Set the tooltip text
    checkbox:SetUserData("tooltip", "Disables LootSpecHelper loot reminder popups.\nUse /lsh enable or /lsh disable in chat to toggle.")

    -- Set a callback for when the mouse enters the checkbox
    checkbox:SetCallback("OnEnter", function(widget)
        -- Get the tooltip text
        local tooltip = widget:GetUserData("tooltip")
        -- Show the tooltip
        GameTooltip:SetOwner(widget.frame, "ANCHOR_CURSOR")
        GameTooltip:SetText(tooltip)
        GameTooltip:Show()
    end)

    -- Set a callback for when the mouse leaves the checkbox
    checkbox:SetCallback("OnLeave", function(widget)
        -- Hide the tooltip
        GameTooltip:Hide()
    end)

    frame:AddChild(checkbox) -- Add checkbox to its container

    -- Create the TabGroup
    globalTab =  AceGUI:Create("TabGroup");
    globalTab:SetTitle("Instance Type");
    globalTab:SetFullHeight(true)
    globalTab:SetFullWidth(true)
    globalTab:SetLayout("Flow");
    globalTab:SetTabs( { {text="Raid", value="tab1"}, {text="M+", value="tab2"} } )
    -- Register callback
    globalTab:SetCallback("OnGroupSelected", SelectGroup)
    -- Set initial Tab (this will fire the OnGroupSelected callback)
    globalTab:SelectTab("tab1")

    -- add the tab container to the frame
    frame:AddChild(globalTab)
end--CreateLootSpecHelperWindow

function displaySpecLoot(specTables, sharedTable, passedInstanceType)
    local specLootsFrame = AceGUI:Create("Frame", "LootSpecHelperDisplayTargets")

    -- Add the frame as a global variable under the name `MyGlobalFrameName`
    _G["LootSpecHelperTargetDisplayGlobalFrameName"] = specLootsFrame.frame
    -- Register the global variable `MyGlobalFrameName` as a "special frame"
    -- so that it is closed when the escape key is pressed.
    tinsert(UISpecialFrames, "LootSpecHelperTargetDisplayGlobalFrameName")

    globalSpecLootsFrame = specLootsFrame;
    specLootsFrame:SetWidth(500)
	specLootsFrame:SetTitle("LootSpecHelper")
	specLootsFrame:SetStatusText("Created by Van on Stormrage.")
	specLootsFrame:SetCallback("OnClose", function(widget)
        widget:ReleaseChildren()
		AceGUI:Release(widget)
        if globalSpecLootsFrame ~= nil then
            globalSpecLootsFrame = nil;
        end
	end)
    specLootsFrame:SetLayout("Flow")

    local testContainer = AceGUI:Create("SimpleGroup")
    testContainer:SetLayout("Fill")
    testContainer:SetFullHeight(true)
    testContainer:SetFullWidth(true)
    specLootsFrame:AddChild(testContainer);


    local scrollContainer = AceGUI:Create("ScrollFrame");
    scrollContainer:SetLayout("List");
    scrollContainer:SetFullHeight(true)
    testContainer:AddChild(scrollContainer);

    if passedInstanceType == "raid" then
        local disableButton = AceGUI:Create("Button")
        disableButton:SetText("Disable for instance");
        disableButton:SetCallback("OnClick", function(widget)
            disabled = true;
            specLootsFrame:Release()
        end)
        disableButton:SetWidth(200);
        scrollContainer:AddChild(disableButton);
    end  
    
    --UPDATE: step 4: update these ilvls/ranks for the new dungeon levels (same as step 3's)
    -- local keyLevelInformation = {
    --     [2] = {ilvl = 441, upgradeLevel = 1, upgradeMax = 8},
    --     [3] = {ilvl = 444, upgradeLevel = 2, upgradeMax = 8},
    --     [4] = {ilvl = 444, upgradeLevel = 2, upgradeMax = 8},
    --     [5] = {ilvl = 447, upgradeLevel = 3, upgradeMax = 8},
    --     [6] = {ilvl = 447, upgradeLevel = 3, upgradeMax = 8},
    --     [7] = {ilvl = 450, upgradeLevel = 4, upgradeMax = 8},
    --     [8] = {ilvl = 450, upgradeLevel = 4, upgradeMax = 8},
    --     [9] = {ilvl = 454, upgradeLevel = 1, upgradeMax = 8},
    --     [10] = {ilvl = 454, upgradeLevel = 1, upgradeMax = 8},
    --     [11] = {ilvl = 457, upgradeLevel = 2, upgradeMax = 8},
    --     [12] = {ilvl = 457, upgradeLevel = 2, upgradeMax = 8},
    --     [13] = {ilvl = 460, upgradeLevel = 3, upgradeMax = 8},
    --     [14] = {ilvl = 460, upgradeLevel = 3, upgradeMax = 8},
    --     [15] = {ilvl = 463, upgradeLevel = 4, upgradeMax = 8},
    --     [16] = {ilvl = 463, upgradeLevel = 4, upgradeMax = 8},
    --     [17] = {ilvl = 467, upgradeLevel = 1, upgradeMax = 6},
    --     [18] = {ilvl = 467, upgradeLevel = 1, upgradeMax = 6},
    --     [19] = {ilvl = 470, upgradeLevel = 2, upgradeMax = 6},
    --     [20] = {ilvl = 470, upgradeLevel = 2, upgradeMax = 6},
    --     [21] = {ilvl = 483, upgradeLevel = 6, upgradeMax = 6}, -- max rank from +20 loot
    --     [22] = {ilvl = 489, upgradeLevel = 4, upgradeMax = 4} -- max rank for max vault loot
    -- }
        -- using this for fated since levels are fucked
        local keyLevelInformation = {
            [2] = {ilvl = 496, upgradeLevel = 2, upgradeMax = 8},
            [3] = {ilvl = 499, upgradeLevel = 3, upgradeMax = 8},
            [4] = {ilvl = 499, upgradeLevel = 3, upgradeMax = 8},
            [5] = {ilvl = 502, upgradeLevel = 4, upgradeMax = 8},
            [6] = {ilvl = 502, upgradeLevel = 4, upgradeMax = 8},
            [7] = {ilvl = 506, upgradeLevel = 1, upgradeMax = 6},
            [8] = {ilvl = 506, upgradeLevel = 1, upgradeMax = 6},
            [9] = {ilvl = 509, upgradeLevel = 2, upgradeMax = 6},
            [10] = {ilvl = 509, upgradeLevel = 2, upgradeMax = 6},
            [11] = {ilvl = 522, upgradeLevel = 6, upgradeMax = 6}, -- max rank from +10 loot
            [12] = {ilvl = 528, upgradeLevel = 4, upgradeMax = 4} -- max rank for max vault loot
        }

    local function GenerateTooltip(itemID, keyLevel)
        local upgradeLevel = keyLevelInformation[keyLevel]["upgradeLevel"];
        local upgradeMax = keyLevelInformation[keyLevel]["upgradeMax"];
        local itemLevel = keyLevelInformation[keyLevel]["ilvl"];
        local tooltipData = C_TooltipInfo.GetItemKey(itemID, itemLevel, 0)

        if keyLevel == 21 then
            keyLevel = 20
        elseif keyLevel == 22 then
            keyLevel = "Vault"
        end
    
        tooltipData.lines[1].leftColor = ITEM_QUALITY_COLORS[Enum.ItemQuality.Epic].color
        table.insert(tooltipData.lines, 2, {
          type = 0,
          leftText = PLAYER_DIFFICULTY_MYTHIC_PLUS .. " " .. keyLevel,
          leftColor = GREEN_FONT_COLOR,
        })
        table.insert(tooltipData.lines, 4, {
          type = 0,
          leftText = ITEM_UPGRADE_TOOLTIP_FORMAT:format(upgradeLevel, upgradeMax),
          leftColor = NORMAL_FONT_COLOR,
        })
        for index, line in ipairs(tooltipData.lines) do
          if line.leftText == AUCTION_HOUSE_BUCKET_VARIATION_EQUIPMENT_TOOLTIP then
            table.remove(tooltipData.lines, index)
            table.remove(tooltipData.lines, index - 1)
            break
          end
        end
        local info = {
          tooltipData = tooltipData,
        }
        GameTooltip:ProcessInfo(info)
        GameTooltip:Show()
    end

    lsh_thisDifficult = GetDifficultyInfo(GetRaidDifficultyID())

    local lsh_spec_counter = 1;
    -- for each individual specs table of loot
    for _,v in pairs(specTables) do
        local lsh_lootItemCounter = 0;
        for _,_ in pairs(v) do
            lsh_lootItemCounter = lsh_lootItemCounter + 1;
        end
        local lsh_spec_id, lsh_spec_name = GetSpecializationInfo(lsh_spec_counter)
        lsh_spec_counter = lsh_spec_counter + 1;
        if lsh_lootItemCounter ~= 0 then
            local individualSpecContainer = AceGUI:Create("InlineGroup");
            individualSpecContainer:SetFullWidth(true);
            individualSpecContainer:SetFullHeight(true);
            individualSpecContainer:SetLayout("Flow");
            individualSpecContainer:SetTitle(lsh_spec_name);
            scrollContainer:AddChild(individualSpecContainer);

            --for each item in the specs table
            for key, value in pairs(v) do
                if passedInstanceType == "raid" then
                    for targetKey, targetValue in pairs(targetedItemsRaid) do
                        if lsh_thisDifficult == "Looking For Raid" then
                            lsh_thisDifficult = "Lfr"
                        end
                        if (targetValue["itemId"] == value) and (targetValue["difficulty"] == lsh_thisDifficult) then
                            local targetItem = AceGUI:Create("InteractiveLabel");
                            targetItem:SetText(targetValue["name"] .. " - " .. lsh_thisDifficult);
                            targetItem:SetImage(GetItemIcon(targetValue["itemId"]));
                            targetItem:SetImageSize(50,50);
                            targetItem:SetCallback("OnEnter", function(widget) 
                                GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                                if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                                    GameTooltip_ShowCompareItem(GameTooltip)
                                end
                                GameTooltip:SetHyperlink(targetValue["link"])
                            end)
                            targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                            individualSpecContainer:AddChild(targetItem);
                            break
                        else
                        end
                    end
                elseif passedInstanceType == "dungeon" then
                    -- match with targeted item
                    for targetKey, targetValue in pairs(targetedItemsDungeon) do
                        -- if targetValue is the same item
                        if targetValue["name"] == value then
                            local targetItem = AceGUI:Create("InteractiveLabel");
                            targetItem:SetText(targetValue["name"]);
                            targetItem:SetImage(GetItemIcon(targetValue["itemId"]));
                            targetItem:SetImageSize(50,50);
                            targetItem:SetCallback("OnEnter", function(widget)
                                GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                                if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                                    GameTooltip_ShowCompareItem(GameTooltip)
                                end
                                local item = Item:CreateFromItemID(targetValue["itemId"])
                                item:ContinueOnItemLoad(function()
                                    GenerateTooltip(targetValue["itemId"], targetValue["level"])
                                end)
                            end)
                            targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                            individualSpecContainer:AddChild(targetItem);
                            break
                        end
                    end
                end
            end

            local swapSpecButton = AceGUI:Create("Button");
            swapSpecButton:SetText("Set Loot Spec to " .. lsh_spec_name);
            swapSpecButton:SetCallback("OnClick", function(widget)
                SetLootSpecialization(lsh_spec_id)
                specLootsFrame:Release()
            end)
            swapSpecButton:SetFullWidth(true);
            scrollContainer:AddChild(swapSpecButton);
        end
    end

    local lsh_lootItemCounter = 0;
    for _,_ in pairs(sharedTable) do
        lsh_lootItemCounter = lsh_lootItemCounter + 1;
    end
    if lsh_lootItemCounter ~= 0 then
        local sharedSpecContainer = AceGUI:Create("InlineGroup");
        sharedSpecContainer:SetFullWidth(true);
        sharedSpecContainer:SetFullHeight(true);
        sharedSpecContainer:SetLayout("Flow");
        sharedSpecContainer:SetTitle("Shared Spec Loot");
        scrollContainer:AddChild(sharedSpecContainer);

        -- for each item that is in the shared table
        for key, value in pairs(sharedTable) do
            if passedInstanceType == "raid" then
                for targetKey, targetValue in pairs(targetedItemsRaid) do
                    if (targetValue["itemId"] == value) and (targetValue["difficulty"] == lsh_thisDifficult) then
                        local targetItem = AceGUI:Create("InteractiveLabel");
                        lsh_thisDifficult = GetDifficultyInfo(GetRaidDifficultyID())
                        if lsh_thisDifficult == "Looking For Raid" then
                            lsh_thisDifficult = "Lfr"
                        end
                        targetItem:SetText(targetValue["name"] .. " - " .. lsh_thisDifficult); -- this adds currently difficulty, but ilvl in tooltip is lowest
                        targetItem:SetImage(GetItemIcon(targetValue["itemId"]));
                        targetItem:SetImageSize(50,50);
                        targetItem:SetCallback("OnEnter", function(widget)
                            GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                            if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                                GameTooltip_ShowCompareItem(GameTooltip)
                            end
                            GameTooltip:SetHyperlink(targetValue["link"])
                            end)
                        targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                        sharedSpecContainer:AddChild(targetItem);
                        break
                    end
                end
            elseif passedInstanceType == "dungeon" then
                -- match with targeted item
                for targetKey, targetValue in pairs(targetedItemsDungeon) do
                    -- if targetValue is the same item
                    if (targetValue["name"] == value) then
                        local targetItem = AceGUI:Create("InteractiveLabel");
                        targetItem:SetText(targetValue["name"]);
                        targetItem:SetImage(GetItemIcon(targetValue["itemId"]));
                        targetItem:SetImageSize(50,50);
                        targetItem:SetCallback("OnEnter", function(widget) 
                            GameTooltip:SetOwner(LootSpecHelperEventFrame, "ANCHOR_CURSOR")
                            if ( (IsModifiedClick("COMPAREITEMS") or GetCVarBool("alwaysCompareItems")) ) then
                                GameTooltip_ShowCompareItem(GameTooltip)
                            end
                            local item = Item:CreateFromItemID(targetValue["itemId"])
                            item:ContinueOnItemLoad(function()
                                GenerateTooltip(targetValue["itemId"], targetValue["level"])
                            end)
                        end)
                        targetItem:SetCallback("OnLeave", function(widget) GameTooltip:FadeOut() end)
                        sharedSpecContainer:AddChild(targetItem);
                        break
                    end
                end
            end
        end

        local swapSpecButton = AceGUI:Create("Button");
        local lsh_current_spec = GetSpecialization()
        local lsh_spec_id, lsh_spec_name = GetSpecializationInfo(lsh_current_spec)
        swapSpecButton:SetText("Set Loot Spec to current spec: " .. lsh_spec_name);
        swapSpecButton:SetCallback("OnClick", function(widget)
            SetLootSpecialization(lsh_spec_id)
            specLootsFrame:Release()
        end)
        swapSpecButton:SetFullWidth(true);
        scrollContainer:AddChild(swapSpecButton);
    end
end

function determineDropsForLootSpecs(passedEncounterId)
    local function targetingItem(passedItemId)
        for k, v in pairs(targetedItemsRaid) do
            local currentDiff = GetDifficultyInfo(GetRaidDifficultyID())
            if currentDiff == "Looking For Raid" then
                currentDiff = "Lfr"
            end
            if (v["itemId"] == passedItemId) and (v["difficulty"] == currentDiff) then
                return v["name"]
            end
        end
        return nil;
    end
    
    local function lsh_On()
        EncounterJournal:RegisterEvent("EJ_LOOT_DATA_RECIEVED");
        EncounterJournal:RegisterEvent("EJ_DIFFICULTY_UPDATE");
        EncounterJournal:RegisterEvent("UNIT_PORTRAIT_UPDATE");
        EncounterJournal:RegisterEvent("PORTRAITS_UPDATED");
        EncounterJournal:RegisterEvent("SEARCH_DB_LOADED");
        EncounterJournal:RegisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
    end
    local function lsh_Off()
        EncounterJournal:UnregisterEvent("EJ_LOOT_DATA_RECIEVED");
        EncounterJournal:UnregisterEvent("EJ_DIFFICULTY_UPDATE");
        EncounterJournal:UnregisterEvent("UNIT_PORTRAIT_UPDATE");
        EncounterJournal:UnregisterEvent("PORTRAITS_UPDATED");
        EncounterJournal:UnregisterEvent("SEARCH_DB_LOADED");
        EncounterJournal:UnregisterEvent("UI_MODEL_SCENE_INFO_UPDATED");
    end

    local index = 1
    if lsh_most_recent_raid_id == nil then
        -- while true do
        --     tempInstanceId, tempName = EJ_GetInstanceByIndex(index, true)
        --     if not tempInstanceId then
        --         break
        --     end
        --     lsh_this_instanceId = tempInstanceId;
        --     lsh_most_recent_raid_id = tempInstanceId;
        --     index = index + 1
        -- end
        name, description, journalEncounterID, rootSectionID, link, journalInstanceID = EJ_GetEncounterInfo(passedEncounterId)
        lsh_this_instanceId = journalInstanceID;
        lsh_most_recent_raid_id = tempInstanceId;
    else
        lsh_this_instanceId = lsh_most_recent_raid_id
    end
    local lsh_class_id = select(3,UnitClass('player'))
    local lsh_numSpecializations = GetNumSpecializationsForClassID(lsh_class_id)
    local specTables = {};
    local latestTierIndex = EJ_GetNumTiers()
    if EncounterJournal ~= nil then
        lsh_Off()
    end
    EJ_SelectTier(latestTierIndex)
    EJ_SelectInstance(lsh_this_instanceId)
    for lsh_specFilter = 1, lsh_numSpecializations, 1 do
        local lsh_currentTable = {};
        lsh_spec_id, lsh_name = GetSpecializationInfo(lsh_specFilter)
        EJ_SetLootFilter(lsh_class_id, lsh_spec_id)
        EJ_SelectEncounter(passedEncounterId)
        EJ_SetDifficulty(GetRaidDifficultyID())
        C_EncounterJournal.ResetSlotFilter()
        index = 1
        while true do
            local itemId = C_EncounterJournal.GetLootInfoByIndex(index);
            if not itemId then break end
            if targetingItem(itemId["itemID"]) then
                table.insert(lsh_currentTable, itemId["itemID"])
            end
            index = index + 1
        end
        table.insert(specTables, lsh_specFilter, lsh_currentTable)
    end

    local sharedLoot = {};
    for k,v in pairs(specTables[1]) do
        isSharedLoot = true;
        for lsh_specFilter = 2, lsh_numSpecializations, 1 do
            local lsh_currentTable = specTables[lsh_specFilter];
            local alsoHas = false;
            for _,value in pairs(lsh_currentTable) do
                if value == v then
                    alsoHas = true;
                end
            end
            if alsoHas == false then
                isSharedLoot = false;
            end
        end
        if isSharedLoot then
            table.insert( sharedLoot,v )
            for lsh_specFilter = 2, lsh_numSpecializations, 1 do
                local removalCounter = 1
                for _,value in pairs(specTables[lsh_specFilter]) do
                    if value == v then
                        break;
                    end
                    removalCounter = removalCounter + 1
                end
                table.remove( specTables[lsh_specFilter], removalCounter )
            end
        end
    end
    for k,v in pairs(sharedLoot) do
        local removalCounter = 1
        for _,value in pairs(specTables[1]) do
            if value == v then
                break;
            end
            removalCounter = removalCounter + 1
        end
        table.remove( specTables[1], removalCounter )
    end

    C_Timer.After(0.2, function()
        if EncounterJournal ~= nil then
            lsh_On()
        end
        C_Timer.After(0.2, function()
            displaySpecLoot(specTables, sharedLoot, "raid")
        end)
    end)
end --determine drops function


function checkTarget()
    if disabled == true then
        return
    end

    local targetsName = UnitName("target")
    -- for RELEASE comment out the next 3 lines
    -- if targetsName == "Van" then
    --     targetsName = "Gnarlroot"
    -- end
    
    -- for UPDATE: step 1, change these to new council/multiboss fights
    
    --amirdrassil
    if targetsName == "Pip" or targetsName == "Aerwynn" or targetsName == "Urctos" then
        targetsName = "Council of Dreams"
    elseif targetsName == "Scorchtail" then
        targetsName = "Volcoross"
    -- aberrus
    elseif targetsName == "Essence of Shadow" or targetsName == "Eternal Blaze" then
        targetsName = "Shadowflame Amalgamation"
    elseif targetsName == "Rionthus" or targetsName == "Neldris" or targetsName == "Thadrion" then
        targetsName = "The Forgotten Experiments"
    -- vault
    elseif targetsName == "Kadros Icewrath" or targetsName == "Dathea Stormlash" or targetsName == "Opalfang" or targetsName == "Embar Firepath" then
        targetsName = "The Primal Council"
    end

    if mostRecentBoss == targetsName then
        return
    end

    if globalSpecLootsFrame ~= nil then
        globalSpecLootsFrame:Release()
    end
    currentRaidifficulty = GetDifficultyInfo(GetRaidDifficultyID())
    if currentRaidifficulty == "Looking For Raid" then
        currentRaidifficulty = "Lfr"
    end

    local needFromBoss = false;
    local targetEncounterId = nil;

    for k,v in pairs(targetedItemsRaid) do
        -- compareName is the name given from the loot table API
        local compareName = v["boss"]
        
        --/run local data=C_TooltipInfo.GetHyperlink(format("unit:Creature-0-0-0-0-%d-0", 187767));print(data and data.lines[1].leftText or "not cached yet")
        -- for UPDATE: step 2, change these
        -- conditional from the LSH menu when adding an item
        -- new name from above line using npc ID instead of 123456 from wowhead
        if (compareName == "Nymue, Weaver of the Cycle") then
            compareName = "Nymue";
        elseif (compareName == "Tindral Sageswift, Seer of the Flame") then
            compareName = "Tindral Sageswift";
        elseif (compareName == "Fyrakk the Blazing") then
            compareName = "Fyrakk";
        elseif (compareName == "The Vigilant Steward, Zskarn") then
            compareName = "Zskarn";
        elseif (compareName == "Assault of the Zaqali") then
            compareName = "Warlord Kagni";
        elseif (compareName == "Kazzara, the Hellforged") then
            compareName = "Kazzara, the Hellforged";
        elseif (compareName == "The Amalgamation Chamber") then
            compareName = "Shadowflame Amalgamation";
        elseif (compareName == "The Forgotten Experiments") then
            compareName = "Thadrion";
        elseif (compareName == "Rashok, the Elder") then
            compareName = "Rashok";
        elseif (compareName == "Echo of Neltharion") then
            compareName = "Neltharion";
        end
        if (v["difficulty"] == currentRaidifficulty) then
            if (compareName == targetsName) then
                needFromBoss = true;
                targetEncounterId = v["encounterId"];
                break;
            else
            end
        else
        end
    end
    if needFromBoss then
        mostRecentBoss = targetsName;
        determineDropsForLootSpecs(targetEncounterId)
    else
    end
end