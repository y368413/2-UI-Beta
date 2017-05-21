CanIMogIt = {}
-- Options for CanIMogIt
--
-- Thanks to Stanzilla and Semlar and their addon AdvancedInterfaceOptions, which I used as reference.

local _G = _G

local CREATE_DATABASE_TEXT = "|cff15abff重要|cffff9333提示:|cfff0e442请登录所有角色以生成插件的幻化外观数据库。"

StaticPopupDialogs["CANIMOGIT_NEW_DATABASE"] = {
  text = CREATE_DATABASE_TEXT,
  button1 = "Okay, I'll go log onto all of my toons!",
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
}

CanIMogIt_OptionsVersion = "1.5"

CanIMogItOptions_Defaults = {
    ["options"] = {
        ["version"] = CanIMogIt_OptionsVersion,
        ["debug"] = false,
        ["showEquippableOnly"] = true,
        ["showTransmoggableOnly"] = false,
        ["showUnknownOnly"] = false,
        ["showItemIconOverlay"] = true,
        ["showVerboseText"] = false,
    },
}


CanIMogItOptions_DisplayData = {
    ["debug"] = {
        ["displayName"] = "测试模式",
        ["description"] = "显示详细的装备提示",
    },
    ["showEquippableOnly"] = {
        ["displayName"] = "仅显示可装备项",
        ["description"] = "只对装备进行提示，过滤非装备物品的提示",
    },
    ["showTransmoggableOnly"] = {
        ["displayName"] = "仅显示可幻化项",
        ["description"] = "只对可加入幻化试衣间的物品进行提示",
    },
    ["showUnknownOnly"] = {
        ["displayName"] = "仅显示为装备项",
        ["description"] = "只对无法加入幻化试衣间的物品进行提示",
    },
    ["showItemIconOverlay"] = {
        ["displayName"] = "Show Bag Icons",
        ["description"] = "Shows the icon directly on the item in your bag."
    },
    ["showVerboseText"] = {
        ["displayName"] = "Verbose Text",
        ["description"] = "Shows a more detailed text for some of the tooltips."
    },
}


CanIMogIt.frame = CreateFrame("Frame", "CanIMogItOptionsFrame", UIParent);
CanIMogIt.frame.name = "|cff02F78E[幻化]|r幻化提示";
InterfaceOptions_AddCategory(CanIMogIt.frame);


local EVENTS = {
    "ADDON_LOADED",
    "TRANSMOG_COLLECTION_UPDATED",
    -- "PLAYER_LOGIN",
    -- "GET_ITEM_INFO_RECEIVED",
}

for i, event in pairs(EVENTS) do
    CanIMogIt.frame:RegisterEvent(event);
end


CanIMogIt.frame:SetScript("OnEvent", function(self, event, ...)
    -- Add functions you want to catch events here
    self:AddonLoaded(event, ...)
    self:TransmogCollectionUpdated(event, ...)
    -- self:GetItemInfoReceived(event, ...)
end)


local RESET_TIME = 5

local timer = 0
local function onUpdate(self, elapsed)
    timer = timer + elapsed
    -- Unregister if appearances are ready, or 30 seconds have passed.
    if timer >= RESET_TIME then
        CanIMogIt.cache = {}
        timer = 0
    end
end
CanIMogIt.frame:SetScript("OnUpdate", onUpdate)

function CanIMogIt.frame:AddonLoaded(event, addonName)
    if event == "ADDON_LOADED" and addonName == "TransMogMaster" then
        CanIMogIt.frame.Loaded()
    end
end


local function checkboxOnClick(self)
    local checked = self:GetChecked()
    PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
    self:SetValue(checked)
    -- Reset the cache when an option changes.
    CanIMogIt.cache = {}
end


local function newCheckbox(parent, variableName)
    -- Creates a new checkbox in the parent frame for the given variable name
    local displayData = CanIMogItOptions_DisplayData[variableName]
    local checkbox = CreateFrame("CheckButton", "CanIMogItCheckbox" .. variableName, 
            parent, "InterfaceOptionsCheckButtonTemplate")

    -- checkbox.value = CanIMogItOptions[variableName]

    checkbox.GetValue = function (self)
        return CanIMogItOptions[variableName]
    end
    checkbox.SetValue = function (self, value) CanIMogItOptions[variableName] = value end

    checkbox:SetScript("OnClick", checkboxOnClick)
    checkbox:SetChecked(checkbox:GetValue())

    checkbox.label = _G[checkbox:GetName() .. "Text"]
    checkbox.label:SetText(displayData["displayName"])

    checkbox.tooltipText = displayData["displayName"]
    checkbox.tooltipRequirement = displayData["description"]
    return checkbox
end


local function createOptionsMenu()
    -- define the checkboxes
    local debug = newCheckbox(CanIMogIt.frame, "debug")
    local showEquippableOnly = newCheckbox(CanIMogIt.frame, "showEquippableOnly")
    local showTransmoggableOnly = newCheckbox(CanIMogIt.frame, "showTransmoggableOnly")
    local showUnknownOnly = newCheckbox(CanIMogIt.frame, "showUnknownOnly")
    local showItemIconOverlay = newCheckbox(CanIMogIt.frame, "showItemIconOverlay")
    local showVerboseText = newCheckbox(CanIMogIt.frame, "showVerboseText")

    -- position the checkboxes
    debug:SetPoint("TOPLEFT", 16, -16)
    showEquippableOnly:SetPoint("TOPLEFT", debug, "BOTTOMLEFT")
    showTransmoggableOnly:SetPoint("TOPLEFT", showEquippableOnly, "BOTTOMLEFT")
    showUnknownOnly:SetPoint("TOPLEFT", showTransmoggableOnly, "BOTTOMLEFT")
    showItemIconOverlay:SetPoint("TOPLEFT", showUnknownOnly, "BOTTOMLEFT")
    showVerboseText:SetPoint("TOPLEFT", showItemIconOverlay, "BOTTOMLEFT")
end


function CanIMogIt.frame.Loaded()
    -- Set the Options from defaults.
    if (not CanIMogItOptions) then
        CanIMogItOptions = CanIMogItOptions_Defaults.options
        print("CanIMogIt插件配置未找到，加载默认配置！")
    end
    -- if (not CanIMogItDatabase) then
    --     CanIMogItDatabase = {}
    --     StaticPopup_Show("CANIMOGIT_NEW_DATABASE")
    -- end
    CanIMogItDatabase = nil
    -- Set missing options from the defaults if the version is out of date.
    if (CanIMogItOptions["version"] < CanIMogIt_OptionsVersion) then
        CanIMogItOptions_temp = CanIMogItOptions_Defaults.options;
        for k,v in pairs(CanIMogItOptions) do
            if (CanIMogItOptions_Defaults.options[k]) then
                CanIMogItOptions_temp[k] = v;
            end
        end
        CanIMogItOptions_temp["version"] = CanIMogIt_OptionsVersion;
        CanIMogItOptions = CanIMogItOptions_temp;
    end
    createOptionsMenu()
end

-- This file is loaded from "CanIMogIt.toc"

--CanIMogIt = {}

CanIMogIt.DressUpModel = CreateFrame('DressUpModel')

-----------------------------
-- Maps                    --
-----------------------------

---- Transmog Categories
-- 1 Head
-- 2 Shoulder
-- 3 Back
-- 4 Chest
-- 5 Shirt
-- 6 Tabard
-- 7 Wrist
-- 8 Hands
-- 9 Waist
-- 10 Legs
-- 11 Feet
-- 12 Wand
-- 13 One-Handed Axes
-- 14 One-Handed Swords
-- 15 One-Handed Maces
-- 16 Daggers
-- 17 Fist Weapons
-- 18 Shields
-- 19 Held In Off-hand
-- 20 Two-Handed Axes
-- 21 Two-Handed Swords
-- 22 Two-Handed Maces
-- 23 Staves
-- 24 Polearms
-- 25 Bows
-- 26 Guns
-- 27 Crossbows
-- 28 Warglaives


local HEAD = "INVTYPE_HEAD"
local SHOULDER = "INVTYPE_SHOULDER"
local BODY = "INVTYPE_BODY"
local CHEST = "INVTYPE_CHEST"
local ROBE = "INVTYPE_ROBE"
local WAIST = "INVTYPE_WAIST"
local LEGS = "INVTYPE_LEGS"
local FEET = "INVTYPE_FEET"
local WRIST = "INVTYPE_WRIST"
local HAND = "INVTYPE_HAND"
local CLOAK = "INVTYPE_CLOAK"
local WEAPON = "INVTYPE_WEAPON"
local SHIELD = "INVTYPE_SHIELD"
local WEAPON_2HAND = "INVTYPE_2HWEAPON"
local WEAPON_MAIN_HAND = "INVTYPE_WEAPONMAINHAND"
local RANGED = "INVTYPE_RANGED"
local RANGED_RIGHT = "INVTYPE_RANGEDRIGHT"
local WEAPON_OFF_HAND = "INVTYPE_WEAPONOFFHAND"
local HOLDABLE = "INVTYPE_HOLDABLE"
local TABARD = "INVTYPE_TABARD"
local BAG = "INVTYPE_BAG"


local inventorySlotsMap = {
    [HEAD] = {1},
    [SHOULDER] = {3},
    [BODY] = {4},
    [CHEST] = {5},
    [ROBE] = {5},
    [WAIST] = {6},
    [LEGS] = {7},
    [FEET] = {8},
    [WRIST] = {9},
    [HAND] = {10},
    [CLOAK] = {15},
    [WEAPON] = {16, 17},
    [SHIELD] = {17},
    [WEAPON_2HAND] = {16, 17},
    [WEAPON_MAIN_HAND] = {16},
    [RANGED] = {16},
    [RANGED_RIGHT] = {16},
    [WEAPON_OFF_HAND] = {17},
    [HOLDABLE] = {17},
    [TABARD] = false,
}


local MISC = 0
local CLOTH = 1
local LEATHER = 2
local MAIL = 3
local PLATE = 4
local COSMETIC = 5

local classArmorTypeMap = {
    ["DEATHKNIGHT"] = PLATE,
    ["DEMONHUNTER"] = LEATHER,
    ["DRUID"] = LEATHER,
    ["HUNTER"] = MAIL,
    ["MAGE"] = CLOTH,
    ["MONK"] = LEATHER,
    ["PALADIN"] = PLATE,
    ["PRIEST"] = CLOTH,
    ["ROGUE"] = LEATHER,
    ["SHAMAN"] = MAIL,
    ["WARLOCK"] = CLOTH,
    ["WARRIOR"] = PLATE,
}


local armorTypeSlots = {
    [HEAD] = true,
    [SHOULDER] = true,
    [CHEST] = true,
    [ROBE] = true,
    [WRIST] = true,
    [HAND] = true,
    [WAIST] = true,
    [LEGS] = true,
    [FEET] = true,
}


local miscArmorExceptions = {
    [HOLDABLE] = true,
    [BODY] = true,
    [TABARD] = true,
}


-----------------------------
-- Tooltip text constants --
-----------------------------

local BLUE =   "|cff15abff"
local BLUE_GREEN = "|cff009e73"
local PINK = "|cffcc79a7"
local ORANGE = "|cffe69f00"
local RED_ORANGE = "|cffff9333"
local YELLOW = "|cfff0e442"
local GRAY =   "|cff888888"

local BLIZZARD_RED = "|cffff1919"

local KNOWN =                                      "已解锁"
local KNOWN_FROM_ANOTHER_ITEM =                     "已解锁同模型装备"
local KNOWN_BY_ANOTHER_CHARACTER =                  "已被其他类型角色解锁"
local KNOWN_BUT_TOO_LOW_LEVEL =                     "已解锁但不满足幻化要求"
local KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL =   "已解锁同模型装备但不满足幻化要求"
local KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER =       "已被其他类型角色和装备解锁"
local UNKNOWN =                                     "未解锁"
local UNKNOWABLE_BY_CHARACTER =                     "其他类型角色可以解锁"
local UNKNOWABLE_SOULBOUND =           "当前角色不能解锁"
local CAN_BE_LEARNED_BY =                           "可以解锁通过：" -- list of classes
local NOT_TRANSMOGABLE =                            "无法解锁"
local CANNOT_DETERMINE =                            "无法确实其他角色状态"


CanIMogIt.KNOWN =                                       BLUE .. KNOWN
CanIMogIt.KNOWN_FROM_ANOTHER_ITEM =                     BLUE .. KNOWN_FROM_ANOTHER_ITEM
CanIMogIt.KNOWN_BY_ANOTHER_CHARACTER =                  BLUE .. KNOWN_BY_ANOTHER_CHARACTER
CanIMogIt.KNOWN_BUT_TOO_LOW_LEVEL =                     BLUE .. KNOWN_BUT_TOO_LOW_LEVEL
CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL =   BLUE .. KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL
-- CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER =    BLUE .. KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER
CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER =       YELLOW .. CANNOT_DETERMINE
CanIMogIt.UNKNOWN =                                     RED_ORANGE .. UNKNOWN
CanIMogIt.UNKNOWABLE_BY_CHARACTER =                     YELLOW .. UNKNOWABLE_BY_CHARACTER
CanIMogIt.UNKNOWABLE_SOULBOUND =           BLUE_GREEN .. UNKNOWABLE_SOULBOUND
CanIMogIt.NOT_TRANSMOGABLE =                            GRAY .. NOT_TRANSMOGABLE


CanIMogIt.tooltipTexts = {
    [KNOWN] = CanIMogIt.KNOWN,
    [KNOWN_FROM_ANOTHER_ITEM] = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM,
    [KNOWN_BY_ANOTHER_CHARACTER] = CanIMogIt.KNOWN_BY_ANOTHER_CHARACTER,
    [KNOWN_BUT_TOO_LOW_LEVEL] = CanIMogIt.KNOWN_BUT_TOO_LOW_LEVEL,
    [KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL] = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL,
    [KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER] = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER,
    [UNKNOWN] = CanIMogIt.UNKNOWN,
    [UNKNOWABLE_BY_CHARACTER] = CanIMogIt.UNKNOWABLE_BY_CHARACTER,
    [UNKNOWABLE_SOULBOUND] = CanIMogIt.UNKNOWABLE_SOULBOUND,
    [CAN_BE_LEARNED_BY] = CanIMogIt.CAN_BE_LEARNED_BY,
    [NOT_TRANSMOGABLE] = CanIMogIt.NOT_TRANSMOGABLE,
    [CANNOT_DETERMINE] = CanIMogIt.CANNOT_DETERMINE,
}




local simpleTextMap = {
    [CanIMogIt.KNOWN_BY_ANOTHER_CHARACTER] = CanIMogIt.KNOWN,
    [CanIMogIt.KNOWN_BUT_TOO_LOW_LEVEL] = CanIMogIt.KNOWN,
    [CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL] = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM,
    -- [CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER] = CanIMogIt.KNOWN,
}


-- Texts that we want to display on the left instead of right because of length.
local LEFT_TEXT_THRESHOLD = 200

local leftTexts = {}
for text, full_text in pairs(CanIMogIt.tooltipTexts) do
    if string.len(text) > LEFT_TEXT_THRESHOLD then
        leftTexts[full_text] = true
    end
end


local knownTexts = {
    [CanIMogIt.KNOWN] = true,
    [CanIMogIt.KNOWN_FROM_ANOTHER_ITEM] = true,
    [CanIMogIt.KNOWN_BY_ANOTHER_CHARACTER] = true,
    [CanIMogIt.KNOWN_BUT_TOO_LOW_LEVEL] = true,
    [CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL] = true,
    --[CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER] = true,
}


local unknownTexts = {
    [CanIMogIt.UNKNOWN] = true,
    [CanIMogIt.UNKNOWABLE_BY_CHARACTER] = true,
}


-----------------------------
-- Exceptions              --
-----------------------------


local exceptionItems = {
    [HEAD] = {
        [134110] = CanIMogIt.KNOWN, -- Hidden Helm
    },
    [SHOULDER] = {
        [119556] = CanIMogIt.NOT_TRANSMOGABLE, -- Trailseeker Spaulders
        [119588] = CanIMogIt.NOT_TRANSMOGABLE, -- Mistdancer Pauldrons
        [134112] = CanIMogIt.KNOWN, -- Hidden Shoulders
    },
    [BODY] = {},
    [CHEST] = {},
    [ROBE] = {},
    [WAIST] = {},
    [LEGS] = {},
    [FEET] = {},
    [WRIST] = {},
    [HAND] = {
        [119585] = CanIMogIt.NOT_TRANSMOGABLE, -- Mistdancer Handguards
    },
    [CLOAK] = {},
    [WEAPON] = {},
    [SHIELD] = {},
    [WEAPON_2HAND] = {},
    [WEAPON_MAIN_HAND] = {},
    [RANGED] = {},
    [RANGED_RIGHT] = {},
    [WEAPON_OFF_HAND] = {},
    [HOLDABLE] = {},
    [TABARD] = {},
}


-----------------------------
-- Adding to tooltip       --
-----------------------------

local function addDoubleLine(tooltip, left_text, right_text)
    tooltip:AddDoubleLine(left_text, right_text)
    tooltip:Show()
end


local function addLine(tooltip, text)
    tooltip:AddLine(text, nil, nil, nil, true)
    tooltip:Show()
end


-----------------------------
-- Debug functions         --
-----------------------------


local function printDebug(tooltip, itemLink, bag, slot)
    -- Add debug statements to the tooltip, to make it easier to understand
    -- what may be going wrong.

    addDoubleLine(tooltip, "Addon Version:", GetAddOnMetadata("CanIMogIt", "Version"))
    local playerClass = select(2, UnitClass("player"))
    local playerLevel = UnitLevel("player")
    local playerSpec = GetSpecialization()
    local playerSpecName = playerSpec and select(2, GetSpecializationInfo(playerSpec)) or "None"
    addDoubleLine(tooltip, "Player Class:", playerClass)
    addDoubleLine(tooltip, "Player Spec:", playerSpecName)
    addDoubleLine(tooltip, "Player Level:", playerLevel)

    addLine(tooltip, '--------')

    local itemID = CanIMogIt:GetItemID(itemLink)
    addDoubleLine(tooltip, "Item ID:", tostring(itemID))
    local _, _, quality, _, _, itemClass, itemSubClass, _, equipSlot = GetItemInfo(itemID)
    addDoubleLine(tooltip, "Item quality:", tostring(quality))
    addDoubleLine(tooltip, "Item class:", tostring(itemClass))
    addDoubleLine(tooltip, "Item subClass:", tostring(itemSubClass))
    addDoubleLine(tooltip, "Item equipSlot:", tostring(equipSlot))

    local sourceID = CanIMogIt:GetSourceID(itemLink)
    if sourceID ~= nil then
        addDoubleLine(tooltip, "Item sourceID:", tostring(sourceID))
    else
        addDoubleLine(tooltip, "Item sourceID:", 'nil')
    end
    local appearanceID = CanIMogIt:GetAppearanceID(itemLink)
    addDoubleLine(tooltip, "Item appearanceID:", tostring(appearanceID))

    addLine(tooltip, '--------')

    local playerHasTransmog = C_TransmogCollection.PlayerHasTransmog(itemID)
    if playerHasTransmog ~= nil then
        addDoubleLine(tooltip, "PlayerHasTransmog:", tostring(playerHasTransmog))
    end
    if sourceID then
        local playerHasTransmogItem = C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance(sourceID)
        if playerHasTransmogItem ~= nil then
            addDoubleLine(tooltip, "PlayerHasTransmogItemModifiedAppearance:", tostring(playerHasTransmogItem))
        end
    end

    addDoubleLine(tooltip, "IsTransmogable:", tostring(CanIMogIt:IsTransmogable(itemLink)))
    local playerKnowsTransmogFromItem = CanIMogIt:PlayerKnowsTransmogFromItem(itemLink)
    if playerKnowsTransmogFromItem ~= nil then
        addDoubleLine(tooltip, "PlayerKnowsTransmogFromItem:", tostring(playerKnowsTransmogFromItem))
    end
    local playerKnowsTrasmog = CanIMogIt:PlayerKnowsTransmog(itemLink)
    if playerKnowsTrasmog ~= nil then
        addDoubleLine(tooltip, "PlayerKnowsTransmog:", tostring(playerKnowsTrasmog))
    end
    local characterCanLearnTransmog = CanIMogIt:CharacterCanLearnTransmog(itemLink)
    if characterCanLearnTransmog ~= nil then
        addDoubleLine(tooltip, "CharacterCanLearnTransmog:", tostring(characterCanLearnTransmog))
    end

    addLine(tooltip, '--------')

    addDoubleLine(tooltip, "IsItemSoulbound:", tostring(CanIMogIt:IsItemSoulbound(itemLink, bag, slot)))
    addDoubleLine(tooltip, "CharacterCanEquipItem:", tostring(CanIMogIt:CharacterCanEquipItem(itemLink)))
    addDoubleLine(tooltip, "IsValidAppearanceForCharacter:", tostring(CanIMogIt:IsValidAppearanceForCharacter(itemLink)))
    addDoubleLine(tooltip, "CharacterIsTooLowLevelForItem:", tostring(CanIMogIt:CharacterIsTooLowLevelForItem(itemLink)))

    addLine(tooltip, '--------')

    -- addDoubleLine(tooltip, "Database GetItem:", tostring(CanIMogIt.Database:GetItem(itemLink)))
    -- addDoubleLine(tooltip, "Database GetAppearanceTable:", tostring(CanIMogIt.Database:GetAppearanceTable(itemLink)))

end


-----------------------------
-- CanIMogIt variables        --
-----------------------------


CanIMogIt.tooltip = nil;
CanIMogIt.cache = {}


function CanIMogIt.frame:TransmogCollectionUpdated(event, ...)
    if event == "TRANSMOG_COLLECTION_UPDATED" then
        CanIMogIt.cache = {}
    end
end


-----------------------------
-- CanIMogIt Core methods  --
-----------------------------


function CanIMogIt:GetValueInTableFromText(tbl, text)
    -- Returns the value from tbl when the key contains text.
    for key, value in pairs(tbl) do
        if text:find(key) then return value end
    end
end


function CanIMogIt:GetAppearances()
    -- Gets a table of all the appearances known to a character.
    C_TransmogCollection.ClearSearch()
    local appearances = {}
    for categoryID=1,28 do
        categoryAppearances = C_TransmogCollection.GetCategoryAppearances(categoryID)
        for i, categoryAppearance in pairs(categoryAppearances) do
            if categoryAppearance.isCollected then
                appearances[categoryAppearance.visualID] = categoryAppearance
            end
        end
    end
    return appearances
end


function CanIMogIt:GetPlayerArmorTypeName()
    local playerArmorTypeID = classArmorTypeMap[select(2, UnitClass("player"))]
    return select(1, GetItemSubClassInfo(4, playerArmorTypeID))
end


function CanIMogIt:GetItemID(itemLink)
    return tonumber(itemLink:match("item:(%d+)"))
end


function CanIMogIt:GetItemLink(itemID)
    return select(2, CanIMogIt:GetItemInfo(itemID))
end


function CanIMogIt:GetItemQuality(itemID)
    return select(3, GetItemInfo(itemID))
end


function CanIMogIt:GetItemMinLevel(itemLink)
    return select(5, GetItemInfo(itemLink))
end


function CanIMogIt:GetItemClassName(itemLink)
    return select(6, GetItemInfo(itemLink))
end


function CanIMogIt:GetItemSubClassName(itemLink)
    return select(7, GetItemInfo(itemLink))
end


function CanIMogIt:GetItemSlotName(itemLink)
    return select(4, GetItemInfoInstant(itemLink))
end


function CanIMogIt:IsItemArmor(itemLink)
    local itemClass = CanIMogIt:GetItemClassName(itemLink)
    if itemClass == nil then return end
    return GetItemClassInfo(4) == itemClass
end


function CanIMogIt:IsArmorSubClass(subClass, itemLink)
    local itemSubClass = CanIMogIt:GetItemSubClassName(itemLink)
    if itemSubClass == nil then return end
    return select(1, GetItemSubClassInfo(4, subClass)) == itemSubClass
end


function CanIMogIt:IsArmorSubClassIdentical(itemLinkA, itemLinkB)
    local subClassA = CanIMogIt:GetItemSubClassName(itemLinkA)
    local subClassB = CanIMogIt:GetItemSubClassName(itemLinkB)
    if subClassA == nil or subClassB == nil then return end
    return subClassA == subClassB
end


function CanIMogIt:IsArmorCosmetic(itemLink)
    return CanIMogIt:IsArmorSubClass(COSMETIC, itemLink)
end


function CanIMogIt:IsArmorAppropriateForPlayer(itemLink)
    local playerArmorTypeID = CanIMogIt:GetPlayerArmorTypeName()
    local slotName = CanIMogIt:GetItemSlotName(itemLink)
    if slotName == nil then return end
    local isArmorCosmetic = CanIMogIt:IsArmorCosmetic(itemLink)
    if isArmorCosmetic == nil then return end
    if armorTypeSlots[slotName] and isArmorCosmetic == false then 
        return playerArmorTypeID == CanIMogIt:GetItemSubClassName(itemLink)
    else
        return true
    end
end


function CanIMogIt:CharacterCanEquipItem(itemLink)
    if CanIMogIt:IsItemArmor(itemLink) and CanIMogIt:IsArmorCosmetic(itemLink) then
        return true
    end
    local itemID = CanIMogIt:GetItemID(itemLink)
    for i=1,28 do
        if C_TransmogCollection.IsCategoryValidForItem(i, itemID) then
            return true
        end
    end
    return false
end


function CanIMogIt:IsValidAppearanceForCharacter(itemLink)
    if CanIMogIt:CharacterCanEquipItem(itemLink) then
        if CanIMogIt:IsItemArmor(itemLink) then
            return CanIMogIt:IsArmorAppropriateForPlayer(itemLink)
        else
            return true
        end
    else
        return false
    end
end


function CanIMogIt:CharacterIsTooLowLevelForItem(itemLink)
    local minLevel = CanIMogIt:GetItemMinLevel(itemLink)
    if minLevel == nil then return end
    return UnitLevel("player") < minLevel
end


function CanIMogIt:IsItemSoulbound(itemLink, bag, slot)
    if not bag and slot then return false end
	return CanIMogItTooltipScanner:IsItemSoulbound(bag, slot)
end


function CanIMogIt:GetExceptionText(itemLink)
    -- Returns the exception text for this item, if it has one.
    local itemID = CanIMogIt:GetItemID(itemLink)
    local slotName = CanIMogIt:GetItemSlotName(itemLink)
    if slotName == nil then return end
    local slotExceptions = exceptionItems[slotName]
    if slotExceptions then
        return slotExceptions[itemID]
    end
end


function CanIMogIt:IsEquippable(itemLink)
    -- Returns whether the item is equippable or not (exluding bags)
    local slotName = CanIMogIt:GetItemSlotName(itemLink)
    if slotName == nil then return end
    return slotName ~= "" and slotName ~= BAG
end


function CanIMogIt:GetSourceID(itemLink)
    -- Gets the sourceID for the item.
    local itemID, _, _, slotName = GetItemInfoInstant(itemLink)
    local slots = inventorySlotsMap[slotName]

    if slots == nil or slots == false or IsDressableItem(itemLink) == false then return end
    CanIMogIt.DressUpModel:SetUnit('player')
    CanIMogIt.DressUpModel:Undress()
    for i, slot in pairs(slots) do
        CanIMogIt.DressUpModel:TryOn(itemLink, slot)
        local sourceID = CanIMogIt.DressUpModel:GetSlotTransmogSources(slot)
        if sourceID ~= 0 then
            return sourceID
        end
    end
end


function CanIMogIt:GetAppearanceID(itemLink)
    -- Gets the appearanceID of the given item.
    local sourceID = CanIMogIt:GetSourceID(itemLink)
    if sourceID ~= nil then
        local appearanceID = select(2, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
        return appearanceID
    end
end


function CanIMogIt:PlayerKnowsTransmog(itemLink)
    -- Returns whether this item's appearance is already known by the player.
    local appearanceID = CanIMogIt:GetAppearanceID(itemLink)
    -- if appearanceID then self.Database:AddAppearanceSources(appearanceID) end
    -- appearanceTable = self.Database:GetAppearanceTable(itemLink)
    -- if appearanceTable == nil then return false end
    -- if CanIMogIt:IsItemArmor(itemLink) then
    --     for knownItemLink, bool in pairs(appearanceTable) do
    --         -- if itemLink armor type is the same as one of the knownItemLink armor types
    --         if CanIMogIt:IsArmorSubClassIdentical(itemLink, knownItemLink) then
    --             return true
    --         end
    --     end
    -- else
    --     -- Is not armor, don't worry about same appearance for different types
    --     return true
    -- end
    -- return false

    if appearanceID == nil then return false end
    local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
    if sources then
        for i, source in pairs(sources) do
            if source.isCollected then
                return true
            end
        end
    end
    return false
end


function CanIMogIt:PlayerKnowsTransmogFromItem(itemLink)
    -- Returns whether the transmog is known from this item specifically.
    -- local itemID = CanIMogIt:GetItemID(itemLink)
    -- local hasTransmog = C_TransmogCollection.PlayerHasTransmog(itemID)
    -- if hasTransmog == false then
    --     for i=1,12 do
    --         hasTransmog = C_TransmogCollection.PlayerHasTransmog(itemID, i)
    --         if hasTransmog then
    --             return true
    --         end
    --     end
    -- end
    -- CanIMogIt.Database:UpdateItem(itemLink, hasTransmog)

    local hasTransmog;
    local slotName = CanIMogIt:GetItemSlotName(itemLink)
    if slotName == TABARD then
        local itemID = CanIMogIt:GetItemID(itemLink)
        return C_TransmogCollection.PlayerHasTransmog(itemID)
    end
    local sourceID = CanIMogIt:GetSourceID(itemLink)
    if sourceID == nil then return end
    hasTransmog = C_TransmogCollection.PlayerHasTransmogItemModifiedAppearance(sourceID)
    return hasTransmog
end


function CanIMogIt:CharacterCanLearnTransmog(itemLink)
    -- Returns whether the player can learn the item or not.
    local slotName = CanIMogIt:GetItemSlotName(itemLink)
    if slotName == TABARD then return true end
    local sourceID = CanIMogIt:GetSourceID(itemLink)
    if sourceID == nil then return end
    if select(2, C_TransmogCollection.PlayerCanCollectSource(sourceID)) then
        return true
    end
    return false
end


function CanIMogIt:GetReason(itemLink)
    local reason = CanIMogItTooltipScanner:GetRedText(itemLink)
    if reason == "" then
        reason = CanIMogIt:GetItemSubClassName(itemLink)
    end
    return reason
end


function CanIMogIt:IsTransmogable(itemLink)
    -- Returns whether the item is transmoggable or not.

    -- White items are not transmoggable.
    local quality = CanIMogIt:GetItemQuality(itemLink)
    if quality == nil then return end
    if quality <= 1 then
        return false
    end

    local is_misc_subclass = CanIMogIt:IsArmorSubClass(MISC, itemLink)
    if is_misc_subclass and miscArmorExceptions[CanIMogIt:GetItemSlotName(itemLink)] == nil then
        return false
    end
    
    local itemID, _, _, slotName = GetItemInfoInstant(itemLink)

    -- See if the game considers it transmoggable
    local transmoggable = select(3, C_Transmog.GetItemInfo(itemID))
    if transmoggable == false then
        return false
    end

    -- See if the item is in a valid transmoggable slot
    if inventorySlotsMap[slotName] == nil then
        return false
    end
    return true
end


function CanIMogIt:TextIsKnown(text)
    -- Returns whether the text is considered to be a KNOWN value or not.
    return knownTexts[text] or false
end


function CanIMogIt:TextIsUnknown(text)
    -- Returns whether the text is considered to be an UNKNOWN value or not.
    return CanIMogIt:GetValueInTableFromText(unknownTexts, text) or false
end


function CanIMogIt:PreLogicOptionsContinue(itemLink)
    -- Apply the options. Returns false if it should stop the logic.
    if CanIMogItOptions["showEquippableOnly"] and 
            not CanIMogIt:IsEquippable(itemLink) then
        -- Don't bother if it's not equipable.
        return false
    end

    return true
end


function CanIMogIt:PostLogicOptionsText(text)
    -- Apply the options to the text. Returns the relevant text.
    
    if CanIMogItOptions["showUnknownOnly"] and not CanIMogIt:TextIsUnknown(text) then
        -- We don't want to show the tooltip if it's already known.
        return
    end

    if CanIMogItOptions["showTransmoggableOnly"] and text:find(CanIMogIt.NOT_TRANSMOGABLE) then
        -- If we don't want to show the tooltip if it's not transmoggable
        return
    end

    if not CanIMogItOptions["showVerboseText"] then
        text = simpleTextMap[text] or text
    end

    return text
end


function CanIMogIt:GetTooltipText(itemLink, bag, slot)
    --[[
        Gets the text to display on the tooltip from the itemLink.

        If bag and slot are given, this will use the itemLink from 
        bag and slot instead.
    ]]
    if bag and slot then
        itemLink = GetContainerItemLink(bag, slot)
    end
    if not itemLink then return end
    local text = ""

    -- Must have GetItemInfo available for item.
    local itemInfo = GetItemInfo(itemLink)
    if itemInfo == nil then return end

    if not CanIMogIt:PreLogicOptionsContinue(itemLink) then return end

    -- Return cached items
    cachedText = CanIMogIt.cache[itemLink]
    if cachedText ~= nil then
        if cachedText == false then
            return nil
        end
        return cachedText
    end

    local exception_text = CanIMogIt:GetExceptionText(itemLink)
    if exception_text then
        return exception_text
    end

    local isTransmogable = CanIMogIt:IsTransmogable(itemLink)
    -- if isTransmogable == nil then return end

    local playerKnowsTransmogFromItem, isValidAppearanceForCharacter, characterIsTooLowLevel,
        playerKnowsTransmog, characterCanLearnTransmog, isItemSoulbound;

    if isTransmogable then

        playerKnowsTransmogFromItem = CanIMogIt:PlayerKnowsTransmogFromItem(itemLink)
        if playerKnowsTransmogFromItem == nil then return end

        isValidAppearanceForCharacter = CanIMogIt:IsValidAppearanceForCharacter(itemLink)
        if isValidAppearanceForCharacter == nil then return end

        characterIsTooLowLevel = CanIMogIt:CharacterIsTooLowLevelForItem(itemLink)
        if characterIsTooLowLevel == nil then return end

        playerKnowsTransmog = CanIMogIt:PlayerKnowsTransmog(itemLink)
        if playerKnowsTransmog == nil then return end

        if playerKnowsTransmogFromItem then
            if isValidAppearanceForCharacter then
                if characterIsTooLowLevel then
                    text = CanIMogIt.KNOWN_BUT_TOO_LOW_LEVEL
                else
                    text = CanIMogIt.KNOWN
                end
            else
                text = CanIMogIt.KNOWN_BY_ANOTHER_CHARACTER
            end
        elseif playerKnowsTransmog then
            if isValidAppearanceForCharacter then
                if characterIsTooLowLevel then
                    text = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_BUT_TOO_LOW_LEVEL
                else
                    text = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM
                end
            else
                text = CanIMogIt.KNOWN_FROM_ANOTHER_ITEM_AND_CHARACTER
            end
        else
            characterCanLearnTransmog = CanIMogIt:CharacterCanLearnTransmog(itemLink)
            if characterCanLearnTransmog == nil then return end

            if characterCanLearnTransmog then
                -- Set text to UNKNOWN
                text = CanIMogIt.UNKNOWN
            else
                isItemSoulbound = CanIMogIt:IsItemSoulbound(itemLink, bag, slot)
                if isItemSoulbound == nil then return end

                if isItemSoulbound then
                    text = CanIMogIt.UNKNOWABLE_SOULBOUND
                            .. BLIZZARD_RED .. CanIMogIt:GetReason(itemLink)
                else
                    text = CanIMogIt.UNKNOWABLE_BY_CHARACTER
                            .. BLIZZARD_RED .. CanIMogIt:GetReason(itemLink)
                end
            end
        end
    else
        --Set text to NOT_TRANSMOGABLE
        text = CanIMogIt.NOT_TRANSMOGABLE
    end

    text = CanIMogIt:PostLogicOptionsText(text)

    -- Update cached items
    if text == nil then
        CanIMogIt.cache[itemLink] = false
    else
        CanIMogIt.cache[itemLink] = text
    end

    return text
end

-----------------------------
-- Tooltip hooks           --
-----------------------------


local function addToTooltip(tooltip, itemLink)
    -- Does the calculations for determining what text to
    -- display on the tooltip.
    local itemInfo = GetItemInfo(itemLink)
    if itemInfo == nil then
        return
    end

    local bag, slot;
    if tooltip:GetOwner() and tooltip:GetOwner():GetName() 
            and tooltip:GetOwner():GetName():find("ContainerFrame") then
        -- Get the bag and slot, if it's in the inventory.
        bag, slot = tooltip:GetOwner():GetParent():GetID(), tooltip:GetOwner():GetID()
    end

    -- local ok;
    if CanIMogItOptions["debug"] then
        -- ok = pcall(printDebug, CanIMogIt.tooltip, itemLink)
        -- if not ok then return end
        printDebug(CanIMogIt.tooltip, itemLink, bag, slot)
    end

    local text;
    -- ok, text = pcall(CanIMogIt.GetTooltipText, CanIMogIt, itemLink)
    -- if not ok then return end
    text = CanIMogIt.GetTooltipText(CanIMogIt, itemLink, bag, slot)
    if text then
        if leftTexts[text] then
            addLine(tooltip, text)
        else
            addDoubleLine(tooltip, " ", text)
        end
    end
end


function CanIMogIt_AttachItemTooltip(self)
    -- Hook for normal tooltips.
    CanIMogIt.tooltip = self
    local link = select(2, self:GetItem())
    if link then
        addToTooltip(CanIMogIt.tooltip, link)
    end
end


GameTooltip:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", CanIMogIt_AttachItemTooltip)


function CanIMogIt_OnSetHyperlink(self, link)
    -- Hook for Hyperlinked tooltips.
    CanIMogIt.tooltip = self
    local type, id = string.match(link, "^(%a+):(%d+)")
    if not type or not id then return end
    if type == "item" then
        addToTooltip(CanIMogIt.tooltip, link)
    end
end


hooksecurefunc(GameTooltip, "SetHyperlink", CanIMogIt_OnSetHyperlink)


local Database = {}
CanIMogIt.Database = Database

CanIMogIt.sourceIDQueue = {}
local getItemInfoReceivedCount = 0


local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end


function Database:AddItem(itemLink, appearanceID)
    --[[ 
        Adds the given itemLink to the database. Returns whether it was added or not.
        Will use the given appearanceID if passed, instead of recalculating.
    ]]
    appearanceID = appearanceID or CanIMogIt:GetAppearanceID(itemLink)
    if not appearanceID then return false end
    local appearanceTable = CanIMogItDatabase[appearanceID]
    if not appearanceTable then
        appearanceTable = self:AddAppearance(appearanceID)
    end
    if not appearanceTable[itemLink] then
        appearanceTable[itemLink] = true
        return true
    end
    return false
end


function Database:AddAppearance(appearanceID)
    --[[
        Adds the appearanceID to the database if it's not there already. 
        Returns the appearanceTable if it was created, false otherwise.
    ]] 
    if not appearanceID then return false end
    if not CanIMogItDatabase[appearanceID] then
        local appearanceTable = {}
        CanIMogItDatabase[appearanceID] = appearanceTable
        return appearanceTable
    end
    return false
end


function Database:RemoveItem(itemLink)
    -- Removes the item from the database.
    local appearanceID = CanIMogIt:GetAppearanceID(itemLink)
    if not appearanceID then return false end
    local appearanceTable = CanIMogItDatabase[appearanceID]
    if appearanceTable and appearanceTable[itemLink] then
        appearanceTable[itemLink] = nil
        return true
    end
    return false
end


function Database:RemoveAppearance(appearanceID)
    --[[
        Removes the appearanceID from the database. Returns whether
        it was removed or not.
    ]]
    if CanIMogItDatabase[appearanceID] then
        CanIMogItDatabase[appearanceID] = nil
        return true
    end
    return false
end


function Database:GetAppearanceTable(itemLink)
    -- Returns the appearance table for the item in the database.
    local appearanceID = CanIMogIt:GetAppearanceID(itemLink)
    return CanIMogItDatabase[appearanceID]
end


function Database:GetItem(itemLink)
    -- Returns whether the item is in the database.
    local appearanceTable = Database:GetAppearanceTable(itemLink)
    if appearanceTable then
        return appearanceTable[itemLink] or false
    end
    return false
end


function Database:UpdateAppearances()
    --[[
        Updates the database with the current appearances,
        adding or removing as needed.
    ]]
    local appearances = CanIMogIt:GetAppearances()
    for appearanceID, appearance in pairs(appearances) do
        if appearance.isCollected then
            self:AddAppearance(appearanceID)
            self:AddAppearanceSources(appearanceID)
        else
            self:RemoveAppearance(appearanceID)
        end
    end
end


function Database:AddItemBySourceID(sourceID, appearanceID)
    local itemLink = select(6, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
    if string.find(itemLink, '|h%[%]|h') then -- still cooking
        -- Call GetItemInfo here so that we can capture the event when it's done cooking.
        GetItemInfo(itemLink)
        CanIMogIt.sourceIDQueue[sourceID] = appearanceID
        return
    end
    self:AddItem(itemLink, appearanceID)
end


function Database:AddAppearanceSources(appearanceID)
    -- Adds the sources (the items) of the appearance to the database.
    local sources = C_TransmogCollection.GetAppearanceSources(appearanceID)
    if not sources then return end
    for i, source in pairs(sources) do
        if source.isCollected then
            self:AddItemBySourceID(source.sourceID, appearanceID)
        end
    end
end


function Database:UpdateFromKnownSources(knownSources, appearanceID)
    -- Updates the items given from knownSources.
    for sourceID, source in pairs(knownSources) do
        self:AddItemBySourceID(sourceID, appearanceID)
    end
end


function Database:UpdateItem(itemLink, hasTransmogFromItem)
    -- Updates the status of the item in the database.
    if hasTransmogFromItem then
        self:AddItem(itemLink)
    else
        self:RemoveItem(itemLink)
        --[[ Need to update appearances in case the last item was 
            removed from an appearanceTable]]
        local appearanceID = CanIMogIt:GetAppearanceID(itemLink)
        if CanIMogItDatabase[appearanceID] and next(CanIMogItDatabase[appearanceID]) == nil then
            -- if it's the last item in the appearanceTable, then remove the table.
            CanIMogItDatabase[appearanceID] = nil
        end
    end
end


function Database:GetItemInfoReceived()
    if next(CanIMogIt.sourceIDQueue) == nil then return end
    -- Update the database with any items that were still cooking.
    getItemInfoReceivedCount = getItemInfoReceivedCount + 1
    if getItemInfoReceivedCount >= 300 or tablelength(CanIMogIt.sourceIDQueue) <= 300 then
        getItemInfoReceivedCount = 0
        local done = {}
        for sourceID, appearanceID in pairs(CanIMogIt.sourceIDQueue) do
            local itemLink = select(6, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
            if not string.find(itemLink, '|h%[%]|h') then
                -- Done cooking!
                Database:AddItem(itemLink, appearanceID)
                done[sourceID] = true
            end
        end
        for sourceID, bool in pairs(done) do
            CanIMogIt.sourceIDQueue[sourceID] = nil
        end
    end
end


-- function CanIMogIt.frame:PlayerLogin(event, ...)
--     if event == "PLAYER_LOGIN" then
--         -- add all known appearanceID's to the database
--         Database:UpdateAppearances()
--     end
-- end


-- function CanIMogIt.frame:TransmogCollectionUpdated(event, ...)
--     if event == "TRANSMOG_COLLECTION_UPDATED" then
--         -- add the equipment slot that was changed to the database
--         Database:UpdateAppearances()
--     end
-- end


-- function CanIMogIt.frame:GetItemInfoReceived(event, ...)
--     if event ~= "GET_ITEM_INFO_RECEIVED" then return end
--     Database:GetItemInfoReceived()
-- end

-- Tooltip setup
CanIMogItTooltipScanner = CreateFrame( "GameTooltip", "CanIMogItTooltipScanner");
CanIMogItTooltipScanner:SetOwner( WorldFrame, "ANCHOR_NONE" );
CanIMogItTooltipScanner:AddFontStrings(
    CanIMogItTooltipScanner:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
    CanIMogItTooltipScanner:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );


local function GetRedText(text)
    if text and text:GetText() then
        local r,g,b = text:GetTextColor()
        -- Color values from RED_FONT_COLOR (see FrameXML/FontStyles.xml)
        if math.floor(r*256) == 255 and math.floor(g*256) == 32 and math.floor(b*256) == 32 then
            return text:GetText()
        end
    end
end


local function IsItemSoulbound(text)
    if not text then return end
    if text:GetText() == ITEM_SOULBOUND then
        return true
    end
    return false
end


function CanIMogItTooltipScanner:ScanTooltipBreak(func, itemLink, bag, slot)
    -- Scans the tooltip, breaking when an item is found.
    if bag and slot then
        self:SetBagItem(bag, slot)
    else
        self:SetHyperlink(itemLink)
    end
    local result;
    local tooltipName = self:GetName()
    for i = 1, self:NumLines() do
        result = func(_G[tooltipName..'TextLeft'..i]) or func(_G[tooltipName..'TextRight'..i])
        if result then break end
    end
    self:ClearLines()
    return result
end


function CanIMogItTooltipScanner:ScanTooltip(func, itemLink, bag, slot)
    -- Scans the tooltip, returning a table of all of the results.
    if bag and slot then
        self:SetBagItem(bag, slot)
    else
        self:SetHyperlink(itemLink)
    end
    local tooltipName = self:GetName()
    local results = {}
    for i = 1, self:NumLines() do
        results[tooltipName..'TextLeft'..i] = func(_G[tooltipName..'TextLeft'..i])
        results[tooltipName..'TextRight'..i] = func(_G[tooltipName..'TextRight'..i])
    end
    self:ClearLines()
    return results
end



function CanIMogItTooltipScanner:GetRedText(itemLink)
    -- Returns all of the red text as space seperated string.
    local results = self:ScanTooltip(GetRedText, itemLink)
    local red_texts = {}
    for key, value in pairs(results) do
        if value then
            table.insert(red_texts, value)
        end
    end
    return table.concat(red_texts, " ")
end


function CanIMogItTooltipScanner:IsItemSoulbound(bag, slot)
    -- Returns whether the item is soulbound or not.
    if bag and slot then
        return self:ScanTooltipBreak(IsItemSoulbound, nil, bag, slot)
    else
        return false
    end
end


local function ContainerFrame_OnUpdate(self, elapsed)
    -- Sets the icon overlay for the current bag and slot.
    if not CanIMogItOptions["showItemIconOverlay"] then
        if self.CanIMogItIcon:GetText() then
            self.CanIMogItIcon:SetText()
        end
        return
    end
    local bag, slot = self:GetParent():GetID(), self:GetID()
    local text = CanIMogIt:GetTooltipText(nil, bag, slot)
    if not text then self.CanIMogItIcon:SetText(); return end
end

-- Create the FontString and set the OnUpdate script for each bag item.
for i=1,NUM_CONTAINER_FRAMES do
    for j=1,MAX_CONTAINER_ITEMS do
        local frame = _G["ContainerFrame"..i.."Item"..j]
        if frame then
            frame.CanIMogItIcon = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
            frame.CanIMogItIcon:SetPoint("TOPLEFT", 2, -2)
            frame:SetScript("OnUpdate", ContainerFrame_OnUpdate)
        end
    end
end
