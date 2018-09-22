--## Version: v1.6.0  ## Author: Kaelten

local _G = getfenv(0)
local pairs, ipairs, type, select, table, tonumber, tostring = _G.pairs, _G.ipairs, _G.type, _G.select, _G.table, _G.tonumber, _G.tostring

local OneChoice = LibStub('AceAddon-3.0'):NewAddon('OneChoice', 'AceEvent-3.0', 'AceHook-3.0')

local CLOTH, LEATHER, MAIL, PLATE
local _, preferableSubclassByClass
local universalEquipSlots = {
    ["INVTYPE_CLOAK"] = 1,
    ["INVTYPE_FINGER"] = 1,
    ["INVTYPE_NECK"] = 1,
    ["INVTYPE_TRINKET"] = 1,
    ["INVTYPE_WEAPONOFFHAND"] = 1,
    ["INVTYPE_HOLDABLE"] = 1,
}

-- I assume that these are all valid values....
-- I went ahead and do a runtime conversion from the slotnames to the slotids
local invtypeToSlotname = {
    ["INVTYPE_2HWEAPON"] = "MainHandSlot",
    ["INVTYPE_AMMO"] = "AmmoSlot",
    ["INVTYPE_BAG"] = { "Bag0Slot", "Bag1Slot", "Bag2Slot", "Bag3Slot" },
    ["INVTYPE_BODY"] = "ShirtSlot",
    ["INVTYPE_CHEST"] = "ChestSlot",
    ["INVTYPE_CLOAK"] = "BackSlot",
    ["INVTYPE_FEET"] = "FeetSlot",
    ["INVTYPE_FINGER"] = { "Finger0Slot", "Finger1Slot" },
    ["INVTYPE_HAND"] = "HandsSlot",
    ["INVTYPE_HEAD"] = "HeadSlot",
    ["INVTYPE_HOLDABLE"] = "SecondaryHandSlot",
    ["INVTYPE_LEGS"] = "LegsSlot",
    ["INVTYPE_NECK"] = "NeckSlot",
    ["INVTYPE_QUIVER"] = { "Bag0Slot", "Bag1Slot", "Bag2Slot", "Bag3Slot" },
    ["INVTYPE_ROBE"] = "ChestSlot",
    ["INVTYPE_SHIELD"] = "SecondaryHandSlot",
    ["INVTYPE_SHOULDER"] = "ShoulderSlot",
    ["INVTYPE_TABARD"] = "TabardSlot",
    ["INVTYPE_TRINKET"] = { "Trinket0Slot", "Trinket1Slot" },
    ["INVTYPE_WAIST"] = "WaistSlot",
    ["INVTYPE_WEAPON"] = "MainHandSlot",
    ["INVTYPE_WEAPONMAINHAND"] = "MainHandSlot",
    ["INVTYPE_WEAPONMAINHAND_PET"] = "MainHandSlot",
    ["INVTYPE_WEAPONOFFHAND"] = "SecondaryHandSlot",
    ["INVTYPE_WRIST"] = "WristSlot",
}

local invtypeToSlotid = {}

function OneChoice:OnInitialize()
-- This lets me get around having to ship a localization
    CLOTH = self:GetSubclass("Cloth", 1433, 3642)
    LEATHER = self:GetSubclass("Leather", 1425, 2371)
    MAIL = self:GetSubclass("Mail", 2648, 2417)
    PLATE = self:GetSubclass("Plate", 8086, 8094)

    preferableSubclassByClass = {
        ["HUNTER"] = LEATHER,
        ["WARLOCK"] = CLOTH,
        ["PRIEST"] = CLOTH,
        ["PALADIN"] = MAIL,
        ["MAGE"] = CLOTH,
        ["ROGUE"] = LEATHER,
        ["DRUID"] = LEATHER,
        ["SHAMAN"] = LEATHER,
        ["WARRIOR"] = MAIL,
        ["DEATHKNIGHT"] = PLATE,
        ["MONK"] = LEATHER,
    }

    local invtype, slotname
    for invtype,slotname in pairs(invtypeToSlotname) do
        if type(slotname) == "table" then
            invtypeToSlotid[invtype] = {}
            for _,v in ipairs(slotname) do
                local id = GetInventorySlotInfo(v)
                table.insert(invtypeToSlotid[invtype], id)
            end
        else
            local id = GetInventorySlotInfo(slotname)
            invtypeToSlotid[invtype] = { id }
        end
    end

    self.mvDisplays = {}
    self.ilevelDisplays = {}
end

function OneChoice:OnEnable()
    self:SecureHook("QuestInfo_Display")
    self:SecureHook("QuestInfo_GetRewardButton")

    self:RegisterEvent("PLAYER_LEVEL_UP")
    self:PLAYER_LEVEL_UP(nil, UnitLevel("player"))
end

function OneChoice:GetSubclass(default, ...)
    for n=1,3 do
        for i=1,select('#', ...) do
            local subclass = select(7, GetItemInfo(select(i, ...)))
            if subclass then
                return subclass
            end
        end
    end

    return default
end

function OneChoice:PLAYER_LEVEL_UP(event, level)
    if tonumber(level) > 39 then
        preferableSubclassByClass["HUNTER"] = MAIL
        preferableSubclassByClass["PALADIN"] = PLATE
        preferableSubclassByClass["SHAMAN"] = MAIL
        preferableSubclassByClass["WARRIOR"] = PLATE
    end

    local _, class = UnitClass("player")
    self.preferableSubclass = preferableSubclassByClass[class]
end

function OneChoice:HideDisplays(rewardsFrame)
    local rewardButtons = rewardsFrame.RewardButtons;
    for _, button in ipairs(rewardButtons) do
        self:GetiLevelDisplay(button)
        self:GetMVDisplay(button)
    end
end

function OneChoice:QuestInfo_GetRewardButton(rewardsFrame, index)
    local button = rewardsFrame.RewardButtons[index]

    if rewardsFrame:GetName():find("^Map") then
        button._isMapButton = true
    end

    local name = button.Name
    name:ClearAllPoints()

    if button._isMapButton then
        name:SetPoint("TOPLEFT", button.NameFrame, "TOPLEFT", 4, 9)
    else
        name:SetPoint("TOPLEFT", button.NameFrame, "TOPLEFT", 15, -8)
    end
end

function OneChoice:GetiLevelDisplay(button)
    if not button.iLevelDisplay then
        local display = button:CreateFontString(nil, "OVERLAY", "AchievementPointsFontSmall")

        if button._isMapButton then
            display:SetPoint("BOTTOMRIGHT", button.NameFrame, "BOTTOMRIGHT", -2, 2)
            display:SetFont(STANDARD_TEXT_FONT, 9)
        else
            display:SetPoint("BOTTOMRIGHT", button.NameFrame, "BOTTOMRIGHT", -15, 13)
            display:SetFont(STANDARD_TEXT_FONT, 11)
        end

        display:SetJustifyV("RIGHT")
        display:SetJustifyH("BOTTOM")

        button.iLevelDisplay = display
    end

    button.iLevelDisplay:SetText("")
    return button.iLevelDisplay
end

function OneChoice:GetMVDisplay(button)
    if not button.mvDisplay then
        local display = button:CreateFontString(nil, "OVERLAY", "AchievementPointsFontSmall")

        if button._isMapButton then
            display:SetPoint("BOTTOMLEFT", button.NameFrame, "BOTTOMLEFT", 4, 2)
            display:SetFont(STANDARD_TEXT_FONT, 9)
        else
            display:SetPoint("BOTTOMLEFT", button.NameFrame, "BOTTOMLEFT", 15, 13)
            display:SetFont(STANDARD_TEXT_FONT, 11)
        end

        display:SetJustifyV("LEFT")
        display:SetJustifyH("BOTTOM")

        display:SetText("★")
        display:SetTextColor(1, 1, .26, 1)

        button.mvDisplay = display
    end

    button.mvDisplay:Hide()
    return button.mvDisplay
end

function OneChoice:QuestInfo_Display(template, parentFrame, acceptButton, material, mapView)
    local rewardsFrame = QuestInfoFrame.rewardsFrame

    self:HideDisplays(rewardsFrame)

    local numberOfChoices, choice

    if QuestInfoFrame.questLog then
        numberOfChoices = GetNumQuestLogChoices()
    else
        numberOfChoices = GetNumQuestChoices()
    end

    if numberOfChoices < 2 then
        return
    end

    local mostValuableChoice, highestValue = 0, 0

    for choice = 1, numberOfChoices do
        local link, numItems, isUsable
        if QuestInfoFrame.questLog then
            link = GetQuestLogItemLink("choice", choice)
            _, _, numItems, _, isUsable = GetQuestLogChoiceInfo(choice)
        else
            link = GetQuestItemLink("choice", choice)
            _, _, numItems, _, isUsable = GetQuestItemInfo("choice", choice)
        end

        if link then
            local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo(link)

            if vendorPrice * numItems > highestValue then
                mostValuableChoice = choice
                highestValue = vendorPrice * numItems
            end

            local rewardButton = QuestInfo_GetRewardButton(rewardsFrame, choice)
            local iLevelDisplay = self:GetiLevelDisplay(rewardButton)

            local isUsableShield = equipSlot == "INVTYPE_SHIELD" and isUsable

            if not universalEquipSlots[equipSlot] and class == "Armor" and subclass ~= self.preferableSubclass and not isUsableShield then
                SetItemButtonTextureVertexColor(rewardButton, 0.9, 0, 0)
                SetItemButtonNameFrameVertexColor(rewardButton, 0.9, 0, 0)
            elseif isUsable and self:EquippedIsHeirloom(equipSlot) then
                iLevelDisplay:SetText("Heirloom")
                iLevelDisplay:SetTextColor(0.9, 0.8, 0.5, 1)
            elseif isUsable then
                local differences = {}
                local upgrade = false
                for _, equippedILevel in ipairs(self:EquippedILevels(equipSlot)) do
                    local diff = iLevel - equippedILevel

                    if diff > 0 then
                        upgrade = true
                        table.insert(differences, "+" .. diff)
                    elseif diff < 0 then
                        table.insert(differences, tostring(diff))
                    else
                        table.insert(differences, "--")
                    end
                end

                if #differences > 0 then
                    iLevelDisplay:SetText(table.concat(differences, "/") .. (#differences == 1 and " "))  --" iLevels" or " iLv"

                    if upgrade then
                        iLevelDisplay:SetTextColor(0, 1, 0, 1)
                    else
                        iLevelDisplay:SetTextColor(.8, .8, .8, 1)
                    end
                end
            end
        end
    end

    if mostValuableChoice ~= 0 then
        local rewardButton = QuestInfo_GetRewardButton(rewardsFrame, mostValuableChoice)
        self:GetMVDisplay(rewardButton):Show()
        QuestInfoItem_OnClick(rewardButton)
    end
end

function OneChoice:EquippedIsHeirloom(invtype)
    for _,id in ipairs(invtypeToSlotid[invtype] or {}) do
        local itemid = GetInventoryItemID("player", id)
        if itemid then
            local quality = select(3, GetItemInfo(itemid))
            if quality == 7 then
                return true
            end
        end
    end
end

function OneChoice:EquippedILevels(invtype)
    local results = {}

    for _,id in ipairs(invtypeToSlotid[invtype] or {}) do
        local itemid = GetInventoryItemID("player", id)
        if itemid then
            local equippedILevel = select(4, GetItemInfo(itemid))
            table.insert(results, equippedILevel)
        else
            table.insert(results, 0)
        end
    end

    return results
end
