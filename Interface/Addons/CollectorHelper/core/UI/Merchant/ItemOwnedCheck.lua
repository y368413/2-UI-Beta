local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

-- Check if the given item is owned by the player based on its type (toy, mount, pet, heirloom, etc.)
function CollectorHelper:checkShopID(source)
    -- Return 0 for false, 1 for true, 2 for ignore
    if source == nil or source.itemId == nil then
        return 0
    end

    -- Check if the item is a toy and if the player already has it
    local isToy = CollectorHelper:isToyItem(source.itemId)
    if isToy then
        return PlayerHasToy(source.itemId) and 1 or 0
    end

    -- Check if the item is a mount and if the player already knows it
    local isMount = CollectorHelper:IsMountItem(source.itemId)
    if isMount then
        local mountID = C_MountJournal.GetMountFromItem(source.itemId)
        local playerKnowsMount = select(11, C_MountJournal.GetMountInfoByID(mountID))
        return playerKnowsMount and 1 or 0
    end

    -- Check if the item is a pet and if the player already has it
    local isPet = CollectorHelper:IsPetItem(source.itemId)
    if isPet then
        local petName = C_PetJournal.GetPetInfoByItemID(source.itemId)
        if petName ~= nil then
            local _, petGUID = C_PetJournal.FindPetIDByName(petName)
            return petGUID ~= nil and 1 or 0
        end
    end

    local isRecipe = source.itemType == "Recipe"
    if isRecipe then
        --CollectorHelper:ShowRecipeUI()
        if CollectorHelper:playerHasItemInBag(source.itemId) == true then
            return 11
        end
        local recipeId = CollectorHelper:searchRecipe(source.itemId)
        if recipeId ~= nil then
            local player = self.player
            if player and recipeCollected[player] then
                local professionData = recipeCollected[player][self.pNameToCheck]
                if professionData ~= nil then
                    local pd = professionData["recipes"][recipeId]
                    return pd ~= nil and pd and 1 or 0
                end
                return 0
            end
        end
    end

    -- Check if the item is part of a transmog set or an heirloom and if the player owns it
    local itemSetId = C_Item.GetItemLearnTransmogSet(source.itemId)
    local isItemHeirloom = C_Heirloom.IsItemHeirloom(source.itemId)
    if itemSetId ~= nil then
        return CollectorHelper:setOwned(itemSetId) and 1 or 0
    elseif isItemHeirloom then
        return C_Heirloom.PlayerHasHeirloom(source.itemId) and 1 or 0
    else
        -- Check if the item is part of the player's transmog collection
        local itemAppearanceID, _ = C_TransmogCollection.GetItemInfo(source.itemId)
        if itemAppearanceID == nil then
            local sourceID = CollectorHelper:GetSourceID(source.link)
            if sourceID ~= nil then
                return C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance(sourceID) and 1 or 0
            else
                return 2 -- ignore item
            end
        else
            local r = C_TransmogCollection.PlayerHasTransmog(source.itemId) and 1 or 0
            if r == 0 and source.bindType == 2 then
                if CollectorHelper:playerHasItemInBag(source.itemId) == true then
                    return 10
                end
            end
            -- check for cosmetic
            -- it equips the cosmetic but not learn
            --if source.itemSubType == "Cosmetic" and CollectorHelper:playerHasItemInBag(source.itemId) == true then
            --    return 12
            --end
            return r
        end
    end
end

function CollectorHelper:searchRecipe(id)
    local prof1index, prof2index, _, _, cooking = GetProfessions()
    local prof1 = ""
    if prof1index ~= nil then
        prof1 = GetProfessionInfo(prof1index)
    end
    local prof2 = ""
    if prof2index ~= nil then
        prof2 = GetProfessionInfo(prof2index)
    end
    local cookingProf = ""
    if cooking ~= nil then
        cookingProf = GetProfessionInfo(cooking)
    end
    local p1 = self.db.recipes[prof1] or {}
    local p2 = self.db.recipes[prof2] or {}
    local p3 = self.db.recipes[cookingProf] or {}

    local recipeItemId = tonumber(id)
    -- Check if the ID exists in p1, p2, or p3 and return the corresponding value
    if p1[recipeItemId] then
        self.pNameToCheck = prof1
        return p1[recipeItemId]
    elseif p2[recipeItemId] then
        self.pNameToCheck = prof2
        return p2[recipeItemId]
    elseif p3[recipeItemId] then
        self.pNameToCheck = cookingProf
        return p3[recipeItemId]
    else
        self.pNameToCheck = ""
        return nil
    end
end

-- Check if the item is in the player's bags
function CollectorHelper:playerHasItemInBag(itemCheckId)
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local item = C_Container.GetContainerItemInfo(bag, slot)
            if item ~= nil and item.itemID == itemCheckId then
                return true
            end
        end
    end
    return false
end

-- Check if the item is a toy
function CollectorHelper:isToyItem(itemId)
    return C_ToyBox.GetToyInfo(itemId) ~= nil
end

-- Check if the item is a mount
function CollectorHelper:IsMountItem(itemId)
    return C_MountJournal.GetMountFromItem(itemId) ~= nil
end

-- Check if the item is a pet
function CollectorHelper:IsPetItem(itemId)
    return C_PetJournal.GetPetInfoByItemID(itemId) ~= nil
end

-- Check if all items in the transmog set are owned by the player
function CollectorHelper:setOwned(itemSet)
    local ids = C_TransmogSets.GetAllSourceIDs(itemSet)
    for _, sourceID in ipairs(ids) do
        local info = C_TransmogCollection.GetSourceInfo(sourceID)
        if not info.isCollected then return false end
    end
    return true
end
