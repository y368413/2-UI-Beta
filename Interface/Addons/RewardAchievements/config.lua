local modName, core = ...
core.Config = {}

local Config = core.Config

Config.colors = {
    PRINT_COLOR_ADDON_NAME_RGB = "FF0000",
    PRINT_COLOR_TEXT_RGB = "FFFF00",
    PRINT_COLOR_ADDON_COMMAND_RGB = "00CC66"
}

Config.DB_KEYS = {
    ALL = "ALL",
    NONVALID = "NONVALID",
    VALID = "VALID",
    REWARDS = "REWARDS",
    MOUNTS = "MOUNTS",
    PETS = "PETS",
    TITLES = "TITLES",
    TOYS = "TOYS",
    OTHER = "OTHER"
}

Config.CACHE_VERSION = '1.0.3'

Config.minAchievementId = 0
Config.maxAchievementId = 15612

Config.log = false
Config.useAddonNameAsTabName = false
