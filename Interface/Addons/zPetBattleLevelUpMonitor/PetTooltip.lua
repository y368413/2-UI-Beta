local Cache = LibStub("LibItemCache-2.0",true)
local hasCache = not (not (Cache and Cache.IterateOwners))
local LAST_BANK_SLOT = NUM_BAG_SLOTS + NUM_BANKBAGSLOTS
local FIRST_BANK_SLOT = NUM_BAG_SLOTS + 1
local BSYC = LibStub("AceAddon-3.0"):GetAddon("BagSync", true)
local PET_LINK = '|c%s|Hbattlepet:%sx0|h[%s]|h|r'

local PetCount = {}
local function GetItemCount(owner, type, bag, sid)
    local info = Cache:GetBagInfo(owner, bag)

    for slot = 1, (info.count or 0) do
        local item = Cache:GetItemInfo(owner, bag, slot)
        if item and item.link then
            local itemID = tonumber(item.link:match("item:(%d+)"))

            if itemID == nil then
                local petKey = "ALL"
                local _, speciesID, level, breedQuality, maxHealth, power, speed, battlePetID = strsplit(":", item.link)
                if tonumber(speciesID) == sid then
                    if BPBID_Internal and breedQuality then
                        local breedNum =
                            BPBID_Internal.CalculateBreedID(
                            tonumber(speciesID),
                            tonumber(breedQuality) + 1,
                            tonumber(level),
                            tonumber(maxHealth),
                            tonumber(power),
                            tonumber(speed),
                            false,
                            false
                        )
                        local breed = BPBID_Internal.RetrieveBreedName(breedNum)
                        if breed and breed ~= "NEW" then
                            petKey = breed
                        end
                    end
                    if not PetCount[sid][type][petKey] then
                        PetCount[sid][type][petKey] = 1
                    else
                        PetCount[sid][type][petKey] = PetCount[sid][type][petKey] + 1
                    end
                end
            end
        end
    end
end

local function AddOwners(tooltip, speciesID)
    for owner in Cache:IterateOwners() do
        PetCount[speciesID] = {{}, {}}
        for i = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
            GetItemCount(owner, 1, i, speciesID)
        end
        for i = FIRST_BANK_SLOT, LAST_BANK_SLOT do
            GetItemCount(owner, 2, i, speciesID)
        end
        local cnt = {}
        for k, v in pairs(PetCount[speciesID][1]) do
            if not cnt[k] then
                cnt[k] = {v, 0}
            else
                cnt[k][1] = v
            end
        end
        for k, v in pairs(PetCount[speciesID][2]) do
            if not cnt[k] then
                cnt[k] = {0, v}
            else
                cnt[k][2] = v
            end
        end
        for k, v in pairs(cnt) do
            local countText = ""
            if v[1] > 0 then
                countText = countText .. " 背包:" .. v[1]
            end
            if v[2] > 0 then
                countText = countText .. " 银行:" .. v[2]
            end
            tooltip:AddDoubleLine(GREEN_FONT_COLOR_CODE .. k .. " " .. owner .. FONT_COLOR_CODE_CLOSE, GREEN_FONT_COLOR_CODE..countText..FONT_COLOR_CODE_CLOSE)
        end
    end
end

local function BattlePetCntInfo(speciesID)
    local strinfo = C_PetJournal.GetOwnedBattlePetString(speciesID)
    if not strinfo or strinfo:find("0/") then
        return "|cffff0000" .. NOT_COLLECTED .. "!|r"
    end
    return strinfo
end

local C_BATTLE_PET_TOOLTIP
local C_BattlePetTooltip
hooksecurefunc(
    "BattlePetTooltipTemplate_SetBattlePet",
    function(BattlePetTooltip, BATTLE_PET_TOOLTIP)
        C_BattlePetTooltip = BattlePetTooltip
        C_BATTLE_PET_TOOLTIP = BATTLE_PET_TOOLTIP
    end
)

hooksecurefunc(
    "BattlePetToolTip_Show",
    function(speciesID, level, breedQuality, maxHealth, power, speed, customName)
        if C_BattlePetTooltip then
            local name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique =
                C_PetJournal.GetPetInfoBySpeciesID(speciesID)

            C_BattlePetTooltip.Name:SetText(name .. "(" .. speciesID .. ")")

            GameTooltip:SetOwner(C_BattlePetTooltip)
            GameTooltip:SetText(sourceText, nil, 1, 1, 1)
            if (not tradable) then
                GameTooltip:AddLine(BATTLE_PET_NOT_TRADABLE, 1, 0.1, 0.1, true)
            end
            if (unique) then
                GameTooltip:AddLine(ITEM_UNIQUE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true)
            end


            if BSYC then
                local partial = speciesID..":"..level..":"..breedQuality..":"..maxHealth..":"..power..":"..speed..":0000000000000000"
                local color = select(4, GetItemQualityColor(breedQuality))
                local breedName;
                if BPBID_Internal and breedQuality then
                    local breedNum =
                        BPBID_Internal.CalculateBreedID(
                        tonumber(speciesID),
                        tonumber(breedQuality) + 1,
                        tonumber(level),
                        tonumber(maxHealth),
                        tonumber(power),
                        tonumber(speed),
                        false,
                        false
                    )
                    local breed = BPBID_Internal.RetrieveBreedName(breedNum)
                    if breed and breed ~= "NEW" then
                        breedName = breed
                    end
                end
                BSYC:AddItemToTooltip(GameTooltip, PET_LINK:format(color, partial, name) , breedName) 
            else
                if hasCache then
                    AddOwners(GameTooltip, speciesID)
                end
            end

            local height =0
            if BPBID_BreedTooltip then
                height = height + BPBID_BreedTooltip:GetHeight()
            end
   
            local width = GameTooltip:GetWidth()
 
            GameTooltip:SetAnchorType("ANCHOR_BOTTOMLEFT", width, 0 - height)
            
            GameTooltip:Show()
        end
    end
)
hooksecurefunc(
    "FloatingBattlePet_Show",
    function(speciesID, level, breedQuality, maxHealth, power, speed, customName, bPetID)
        if C_BattlePetTooltip then
            local name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique =
                C_PetJournal.GetPetInfoBySpeciesID(speciesID)

            C_BattlePetTooltip.Name:SetText(name .. "(" .. speciesID .. ")")

            ItemRefTooltip:SetOwner(FloatingBattlePetTooltip, "ANCHOR_TOPRIGHT")
            ItemRefTooltip:AddDoubleLine(sourceText, nil, 1, 1, 1)
            if (not tradable) then
                ItemRefTooltip:AddLine(BATTLE_PET_NOT_TRADABLE, 1, 0.1, 0.1, true)
            end
            if (unique) then
                ItemRefTooltip:AddLine(ITEM_UNIQUE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true)
            end
            ItemRefTooltip:Show()
        end
    end
)

hooksecurefunc(
    FloatingBattlePetTooltip,
    "Hide",
    function(...)
        ItemRefTooltip:Hide()
    end
)
--hooksecurefunc(FloatingBattlePetTooltip, "Hide", FloatingBattlePetTooltipHide)

--C_PetBattles.ForfeitGame();
--pet.dragButton:SetScript("OnEnter",ShowMyToolTip)
--pet.dragButton:SetScript("OnEnter",CloseMyToolTip)
