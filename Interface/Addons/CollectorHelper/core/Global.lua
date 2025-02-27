local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

-- =========================================================================
-- Global Data Storage
-- =========================================================================
CollectorHelper.ITEM_SLOT_ENUM = {
    INVTYPE_HEAD = { 1 },
    INVTYPE_SHOULDER = { 3 },
    INVTYPE_BODY = { 4 },
    INVTYPE_CHEST = { 5 },
    INVTYPE_WAIST = { 6 },
    INVTYPE_LEGS = { 7 },
    INVTYPE_FEET = { 8 },
    INVTYPE_WRIST = { 9 },
    INVTYPE_HAND = { 10 },
    INVTYPE_WEAPON = { 16, 17 }, -- [Dual Wield]
    INVTYPE_SHIELD = { 17 },
    INVTYPE_RANGED = { 16 },
    INVTYPE_CLOAK = { 15 },
    INVTYPE_2HWEAPON = { 16 },
    INVTYPE_TABARD = { 19 },
    INVTYPE_ROBE = { 5 },
    INVTYPE_WEAPONMAINHAND = { 16 },
    INVTYPE_WEAPONOFFHAND = { 16 },
    INVTYPE_HOLDABLE = { 17 },
    INVTYPE_THROWN = { 16 },
    INVTYPE_RANGEDRIGHT = { 16 }
}

CollectorHelper.COLORS = {
    green = "PURE_GREEN_COLOR",
    red = "RED_FONT_COLOR",
    yellow = "YELLOW_FONT_COLOR",
    white = "WHITE_FONT_COLOR"
}
