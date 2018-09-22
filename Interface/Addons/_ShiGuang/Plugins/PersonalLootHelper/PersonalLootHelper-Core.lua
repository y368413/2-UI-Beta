--## Author: Madone-Zul'Jin  ## Version: 2.17

-- Constants to control inspection process
local DELAY_BETWEEN_INSPECTIONS_LONG	= 12	-- in seconds
local DELAY_BETWEEN_INSPECTIONS_SHORT	= 0.2	-- in seconds
local MIN_DELAY_BETWEEN_CACHE_REFRESHES	= 10	-- in seconds
local MAX_INSPECT_LOOPS 				= 4    	-- maximum # of times to retry calling NotifyInspect on all members in the roster for whom we've cached fewer than the expected number of items

-- Colors for display in the looted items frame
local COLOR_PLAYER_LOOTED_ITEM		= _G.LIGHTYELLOW_FONT_COLOR_CODE
local COLOR_NON_PLAYER_LOOTED_ITEM	= _G.YELLOW_FONT_COLOR_CODE
local COLOR_HIGHER_ILVL 			= _G.GREEN_FONT_COLOR_CODE
local COLOR_LOWER_ILVL 				= _G.RED_FONT_COLOR_CODE
local COLOR_BOE						= _G.ORANGE_FONT_COLOR_CODE
local COLOR_BUTTON_TEXT				= _G.YELLOW_FONT_COLOR_CODE

-- Keys for the array returned by GetFullItemInfo()
local FII_ITEM						= 'ITEM'						-- item link
local FII_QUALITY					= 'QUALITY'						-- return value 3 of Blizzard API call GetItemInfo()
local FII_BASE_ILVL					= 'BASE_ILVL'					-- return value 4 of Blizzard API call GetItemInfo()
local FII_REQUIRED_LEVEL			= 'REQUIRED_LEVEL'				-- return value 5 of Blizzard API call GetItemInfo()
local FII_ITEM_EQUIP_LOC			= 'ITEM_EQUIP_LOC'				-- return value 9 of Blizzard API call GetItemInfo()
local FII_CLASS						= 'CLASS'						-- return value 12 of Blizzard API call GetItemInfo()
local FII_SUB_CLASS					= 'SUB_CLASS'					-- return value 13 of Blizzard API call GetItemInfo()
local FII_BIND_TYPE					= 'BIND_TYPE'					-- return value 14 of Blizzard API call GetItemInfo()
local FII_IS_EQUIPPABLE				= 'IS_EQUIPPABLE'				-- true if the item is equippable, false otherwise
local FII_REAL_ILVL					= 'REAL_ILVL'					-- real ilvl, derived from tooltip
local FII_CLASSES					= 'CLASSES'						-- uppercase string of classes that can use the item (ex: tier); nil if item is not class-restricted
local FII_TRADE_TIME_WARNING_SHOWN  = 'TRADE_TIME_WARNING_SHOWN'	-- true if the 'You may trade this item...' text is in the tooltip
local FII_HAS_SOCKET				= 'HAS_SOCKET'					-- true if the item has a socket
local FII_HAS_AVOIDANCE				= 'HAS_AVOIDANCE'				-- true if the item has avoidance
local FII_HAS_INDESTRUCTIBLE		= 'HAS_INDESTRUCTIBLE'			-- true if the item has indestructible
local FII_HAS_LEECH					= 'HAS_LEECH'					-- true if the item has leech
local FII_HAS_SPEED					= 'HAS_SPEED'					-- true if the item has speed
local FII_XMOGGABLE					= 'XMOGGABLE'					-- true if the player needs this item for xmog
local FII_IS_AZERITE_ITEM			= 'IS_AZERITE_ITEM'				-- true if the item is an Azerite item

-- Keys for the groupInfoCache
local CLASS_NAME					= 'CLASS_NAME'
local SPEC							= 'SPEC'
local LEVEL							= 'LEVEL'
local FORCE_REFRESH					= 'FORCE_REFRESH'

-- Keys for the lootedItems array
local LOOTER_NAME					= 'LOOTER_NAME'
local FULL_ITEM_INFO				= 'FULL_ITEM_INFO'
local STATUS						= 'STATUS'
local SELECTED_REQUESTOR_INDEX		= 'SELECTED_REQUESTOR_INDEX'
local DEFAULT_REQUESTOR_INDEX		= 'DEFAULT_REQUESTOR_INDEX'
local CONFIRMATION_MESSAGE			= 'CONFIRMATION_MESSAGE'
local REQUESTORS					= 'REQUESTORS'
local REQUESTOR_NAME				= 'REQUESTOR_NAME'
local REQUESTOR_ROLL				= 'REQUESTOR_ROLL'
local REQUESTOR_REQUEST_TYPE		= 'REQUESTOR_REQUEST_TYPE'
local REQUESTOR_SORT_ORDER			= 'REQUESTOR_SORT_ORDER'

-- Allowed values for lootedItems[STATUS]
local STATUS_DEFAULT				= 'STATUS_DEFAULT'
local STATUS_HIDDEN					= 'STATUS_HIDDEN'
local STATUS_OFFERED				= 'STATUS_OFFERED'
local STATUS_AVAILABLE				= 'STATUS_AVAILABLE'
local STATUS_KEPT					= 'STATUS_KEPT'
local STATUS_REQUESTED				= 'STATUS_REQUESTED'
local STATUS_REQUESTED_VIA_WHISPER	= 'STATUS_REQUESTED_VIA_WHISPER'

-- Allowed values for lootedItems[REQUESTORS][requestorIndex][REQUESTOR_REQUEST_TYPE]
local REQUEST_TYPE_MAIN_SPEC		= 'MAIN SPEC'
local REQUEST_TYPE_OFF_SPEC			= 'OFF SPEC'
local REQUEST_TYPE_XMOG				= 'XMOG'
local REQUEST_TYPE_SHARD			= 'SHARD'

-- Localization-independent class names
local DEATH_KNIGHT					= select(2, GetClassInfo(6))
local DEMON_HUNTER					= select(2, GetClassInfo(12))
local DRUID							= select(2, GetClassInfo(11))
local HUNTER						= select(2, GetClassInfo(3))
local MAGE							= select(2, GetClassInfo(8))
local MONK							= select(2, GetClassInfo(10))
local PALADIN						= select(2, GetClassInfo(2))
local PRIEST						= select(2, GetClassInfo(5))
local ROGUE							= select(2, GetClassInfo(4))
local SHAMAN						= select(2, GetClassInfo(7))
local WARLOCK						= select(2, GetClassInfo(9))
local WARRIOR						= select(2, GetClassInfo(1))

-- Specialization IDs from http://wow.gamepedia.com/API_GetInspectSpecialization
local SPEC_DK_BLOOD					= 250
local SPEC_DK_FROST					= 251
local SPEC_DK_UNHOLY				= 252
local SPEC_DH_HAVOC					= 577
local SPEC_DH_VENGEANCE				= 581
local SPEC_DRUID_BALANCE			= 102
local SPEC_DRUID_FERAL				= 103
local SPEC_DRUID_GUARDIAN			= 104
local SPEC_DRUID_RESTO				= 105
local SPEC_HUNTER_BM				= 253
local SPEC_HUNTER_MARKS				= 254
local SPEC_HUNTER_SURVIVAL			= 255
local SPEC_MAGE_ARCANE				= 62
local SPEC_MAGE_FIRE				= 63
local SPEC_MAGE_FROST				= 64
local SPEC_MONK_BM					= 268
local SPEC_MONK_MW					= 270
local SPEC_MONK_WW					= 269
local SPEC_PALADIN_HOLY				= 65
local SPEC_PALADIN_PROT				= 66
local SPEC_PALADIN_RET				= 70
local SPEC_PRIEST_DISC				= 256
local SPEC_PRIEST_HOLY				= 257
local SPEC_PRIEST_SHADOW			= 258
local SPEC_ROGUE_ASS				= 259
local SPEC_ROGUE_OUTLAW				= 260
local SPEC_ROGUE_SUB				= 261
local SPEC_SHAMAN_ELE				= 262
local SPEC_SHAMAN_ENH				= 263
local SPEC_SHAMAN_RESTO				= 264
local SPEC_WARLOCK_AFF				= 256
local SPEC_WARLOCK_DEMO				= 266
local SPEC_WARLOCK_DESTRO			= 267
local SPEC_WARRIOR_ARMS				= 71
local SPEC_WARRIOR_FURY				= 72
local SPEC_WARRIOR_PROT				= 73

local SPEC_BY_CLASS = {
	[DEATH_KNIGHT]					= { SPEC_DK_BLOOD, SPEC_DK_FROST, SPEC_DK_UNHOLY },
	[DEMON_HUNTER]					= { SPEC_DH_HAVOC, SPEC_DH_VENGEANCE },
	[DRUID]							= { SPEC_DRUID_BALANCE, SPEC_DRUID_FERAL, SPEC_DRUID_GUARDIAN, SPEC_DRUID_RESTO },
	[HUNTER]						= { SPEC_HUNTER_BM, SPEC_HUNTER_MARKS, SPEC_HUNTER_SURVIVAL },
	[MAGE]							= { SPEC_MAGE_ARCANE, SPEC_MAGE_FIRE, SPEC_MAGE_FROST },
	[MONK]							= { SPEC_MONK_BM, SPEC_MONK_MW, SPEC_MONK_WW },
	[PALADIN]						= { SPEC_PALADIN_HOLY, SPEC_PALADIN_PROT, SPEC_PALADIN_RET },
	[PRIEST]						= { SPEC_PRIEST_DISC, SPEC_PRIEST_HOLY, SPEC_PRIEST_SHADOW },
	[ROGUE]							= { SPEC_ROGUE_ASS, SPEC_ROGUE_OUTLAW, SPEC_ROGUE_SUB },
	[SHAMAN]						= { SPEC_SHAMAN_ELE, SPEC_SHAMAN_ENH, SPEC_SHAMAN_RESTO },
	[WARLOCK]						= { SPEC_WARLOCK_AFF, SPEC_WARLOCK_DEMO, SPEC_WARLOCK_DESTRO },
	[WARRIOR]						= { SPEC_WARRIOR_ARMS, SPEC_WARRIOR_FURY, SPEC_WARRIOR_PROT }
}

-- Mapping of specs to roles
local ROLE_BY_SPEC = {
	[SPEC_DK_BLOOD]					= PLH_ROLE_TANK,
	[SPEC_DK_FROST]					= PLH_ROLE_STRENGTH_DPS,
	[SPEC_DK_UNHOLY]				= PLH_ROLE_STRENGTH_DPS,
	[SPEC_DH_HAVOC]					= PLH_ROLE_AGILITY_DPS,
	[SPEC_DH_VENGEANCE]				= PLH_ROLE_TANK,
	[SPEC_DRUID_BALANCE]			= PLH_ROLE_INTELLECT_DPS,
	[SPEC_DRUID_FERAL]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_DRUID_GUARDIAN]			= PLH_ROLE_TANK,
	[SPEC_DRUID_RESTO]				= PLH_ROLE_HEALER,
	[SPEC_HUNTER_BM]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_HUNTER_MARKS]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_HUNTER_SURVIVAL]			= PLH_ROLE_AGILITY_DPS,
	[SPEC_MAGE_ARCANE]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_MAGE_FIRE]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_MAGE_FROST]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_MONK_BM]					= PLH_ROLE_TANK,
	[SPEC_MONK_MW]					= PLH_ROLE_HEALER,
	[SPEC_MONK_WW]					= PLH_ROLE_AGILITY_DPS,
	[SPEC_PALADIN_HOLY]				= PLH_ROLE_HEALER,
	[SPEC_PALADIN_PROT]				= PLH_ROLE_TANK,
	[SPEC_PALADIN_RET]				= PLH_ROLE_STRENGTH_DPS,
	[SPEC_PRIEST_DISC]				= PLH_ROLE_HEALER,
	[SPEC_PRIEST_HOLY]				= PLH_ROLE_HEALER,
	[SPEC_PRIEST_SHADOW]			= PLH_ROLE_INTELLECT_DPS,
	[SPEC_ROGUE_ASS]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_ROGUE_OUTLAW]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_ROGUE_SUB]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_SHAMAN_ELE]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_SHAMAN_ENH]				= PLH_ROLE_AGILITY_DPS,
	[SPEC_SHAMAN_RESTO]				= PLH_ROLE_HEALER,
	[SPEC_WARLOCK_AFF]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_WARLOCK_DEMO]				= PLH_ROLE_INTELLECT_DPS,
	[SPEC_WARLOCK_DESTRO]			= PLH_ROLE_INTELLECT_DPS,
	[SPEC_WARRIOR_ARMS]				= PLH_ROLE_STRENGTH_DPS,
	[SPEC_WARRIOR_FURY]				= PLH_ROLE_STRENGTH_DPS,
	[SPEC_WARRIOR_PROT]				= PLH_ROLE_TANK
}

local PRIMARY_ATTRIBUTE_BY_SPEC = {
	[SPEC_DK_BLOOD]					= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_DK_FROST]					= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_DK_UNHOLY]				= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_DH_HAVOC]					= ITEM_MOD_AGILITY_SHORT,
	[SPEC_DH_VENGEANCE]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_DRUID_BALANCE]			= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_DRUID_FERAL]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_DRUID_GUARDIAN]			= ITEM_MOD_AGILITY_SHORT,
	[SPEC_DRUID_RESTO]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_HUNTER_BM]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_HUNTER_MARKS]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_HUNTER_SURVIVAL]			= ITEM_MOD_AGILITY_SHORT,
	[SPEC_MAGE_ARCANE]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_MAGE_FIRE]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_MAGE_FROST]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_MONK_BM]					= ITEM_MOD_AGILITY_SHORT,
	[SPEC_MONK_MW]					= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_MONK_WW]					= ITEM_MOD_AGILITY_SHORT,
	[SPEC_PALADIN_HOLY]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_PALADIN_PROT]				= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_PALADIN_RET]				= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_PRIEST_DISC]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_PRIEST_HOLY]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_PRIEST_SHADOW]			= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_ROGUE_ASS]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_ROGUE_OUTLAW]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_ROGUE_SUB]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_SHAMAN_ELE]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_SHAMAN_ENH]				= ITEM_MOD_AGILITY_SHORT,
	[SPEC_SHAMAN_RESTO]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_WARLOCK_AFF]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_WARLOCK_DEMO]				= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_WARLOCK_DESTRO]			= ITEM_MOD_INTELLECT_SHORT,
	[SPEC_WARRIOR_ARMS]				= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_WARRIOR_FURY]				= ITEM_MOD_STRENGTH_SHORT,
	[SPEC_WARRIOR_PROT]				= ITEM_MOD_STRENGTH_SHORT
}

-- LE_ITEM_ARMOR_GENERIC is for off hand frills in the following (they appear as LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC, LE_INVENTORY_TYPE_HOLDABLE_TYPE)
local EQUIPPABLE_ARMOR_BY_SPEC = {
	[SPEC_DK_BLOOD]					= { LE_ITEM_ARMOR_PLATE },
	[SPEC_DK_FROST]					= { LE_ITEM_ARMOR_PLATE },
	[SPEC_DK_UNHOLY]				= { LE_ITEM_ARMOR_PLATE },
	[SPEC_DH_HAVOC]					= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_DH_VENGEANCE]				= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_DRUID_BALANCE]			= { LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_GENERIC },
	[SPEC_DRUID_FERAL]				= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_DRUID_GUARDIAN]			= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_DRUID_RESTO]				= { LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_GENERIC },
	[SPEC_HUNTER_BM]				= { LE_ITEM_ARMOR_MAIL },
	[SPEC_HUNTER_MARKS]				= { LE_ITEM_ARMOR_MAIL },
	[SPEC_HUNTER_SURVIVAL]			= { LE_ITEM_ARMOR_MAIL },
	[SPEC_MAGE_ARCANE]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_MAGE_FIRE]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_MAGE_FROST]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_MONK_BM]					= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_MONK_MW]					= { LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_GENERIC },
	[SPEC_MONK_WW]					= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_PALADIN_HOLY]				= { LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_GENERIC, LE_ITEM_ARMOR_SHIELD },
	[SPEC_PALADIN_PROT]				= { LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD },
	[SPEC_PALADIN_RET]				= { LE_ITEM_ARMOR_PLATE },
	[SPEC_PRIEST_DISC]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_PRIEST_HOLY]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_PRIEST_SHADOW]			= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_ROGUE_ASS]				= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_ROGUE_OUTLAW]				= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_ROGUE_SUB]				= { LE_ITEM_ARMOR_LEATHER },
	[SPEC_SHAMAN_ELE]				= { LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_GENERIC, LE_ITEM_ARMOR_SHIELD },
	[SPEC_SHAMAN_ENH]				= { LE_ITEM_ARMOR_MAIL },
	[SPEC_SHAMAN_RESTO]				= { LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_GENERIC, LE_ITEM_ARMOR_SHIELD },
	[SPEC_WARLOCK_AFF]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_WARLOCK_DEMO]				= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_WARLOCK_DESTRO]			= { LE_ITEM_ARMOR_CLOTH, LE_ITEM_ARMOR_GENERIC },
	[SPEC_WARRIOR_ARMS]				= { LE_ITEM_ARMOR_PLATE },
	[SPEC_WARRIOR_FURY]				= { LE_ITEM_ARMOR_PLATE },
	[SPEC_WARRIOR_PROT]				= { LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD }
}

local EQUIPPABLE_WEAPON_BY_SPEC = {
	[SPEC_DK_BLOOD]					= { LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_DK_FROST]					= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H },
	[SPEC_DK_UNHOLY]				= { LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_DH_HAVOC]					= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_WARGLAIVE },
	[SPEC_DH_VENGEANCE]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_WARGLAIVE },
	[SPEC_DRUID_BALANCE]			= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED },
	[SPEC_DRUID_FERAL]				= { LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF },
	[SPEC_DRUID_GUARDIAN]			= { LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF },
	[SPEC_DRUID_RESTO]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED },
	[SPEC_HUNTER_BM]				= { LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_GUNS },
	[SPEC_HUNTER_MARKS]				= { LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_GUNS },
	[SPEC_HUNTER_SURVIVAL]			= { LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF },
	[SPEC_MAGE_ARCANE]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_MAGE_FIRE]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_MAGE_FROST]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_MONK_BM]					= { LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF },
	[SPEC_MONK_MW]					= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_UNARMED },
	[SPEC_MONK_WW]					= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_UNARMED },
	[SPEC_PALADIN_HOLY]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_PALADIN_PROT]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H },
	[SPEC_PALADIN_RET]				= { LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_PRIEST_DISC]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND },
	[SPEC_PRIEST_HOLY]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND },
	[SPEC_PRIEST_SHADOW]			= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND },
	[SPEC_ROGUE_ASS]				= { LE_ITEM_WEAPON_DAGGER },
	[SPEC_ROGUE_OUTLAW]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_UNARMED },
	[SPEC_ROGUE_SUB]				= { LE_ITEM_WEAPON_DAGGER },
	[SPEC_SHAMAN_ELE]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED },
	[SPEC_SHAMAN_ENH]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_UNARMED },
	[SPEC_SHAMAN_RESTO]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED },
	[SPEC_WARLOCK_AFF]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_WARLOCK_DEMO]				= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_WARLOCK_DESTRO]			= { LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_WAND },
	[SPEC_WARRIOR_ARMS]				= { LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_WARRIOR_FURY]				= { LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H },
	[SPEC_WARRIOR_PROT]				= { LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_SWORD1H }
}

local SPECS_EXPECTED_TO_HAVE_OFFHAND = {
	[SPEC_DK_FROST] 				= true,
	[SPEC_DH_VENGEANCE]				= true,
	[SPEC_DH_HAVOC] 				= true,
	[SPEC_MONK_WW] 					= true,
	[SPEC_PALADIN_PROT] 			= true,
	[SPEC_ROGUE_ASS] 				= true,
	[SPEC_ROGUE_OUTLAW] 			= true,
	[SPEC_ROGUE_SUB] 				= true,
	[SPEC_SHAMAN_ENH] 				= true,
	[SPEC_WARRIOR_PROT] 			= true
}

-- Event listener frames
local eventHandlerFrame
local enableOrDisableEventFrame

-- Variables to control addon's status
local isEnabled = false
local priorCacheRefreshTime = 0

-- Variables to control inspection process
local inspectLoop = 0
local inspectIndex = 0						-- index of the character we're currently inspecting
local maxInspectIndex = 0  					-- the index of the last character in GetRaidRosterInfo()
local notifyInspectName = nil 				-- valued if we sent a request to inspect someone, nil otherwise

-- Display widgets
local lootedItemsFrame
local scrollFrame
local scrollbar
local contentFrame							-- content frame for dislaying looted items

local radioButtons = {}						-- indexed by lootedItemID and requestorIndex
local labels = {}
local labelIndex = 0						-- index of the mos recently created label
local buttons = {}
local buttonIndex = 0						-- index of the most recently created button
local itemFrames = {}
local itemFrameIndex = 0					-- index of the most recently created item frame

local tooltipLong 							-- tooltip with the first 30 lines of the tooltip (for getting ilvl)
local plhUsers = {}							-- array of PLH users; keyed by name-realm of user, valued with version
local itemCache = {}						-- keeps track of items that we're waiting to be loaded into the cache so they can be processed
local playerItemCache = {}					-- contains FullItemInfos of the players' items
local groupInfoCache = {}  					-- array of items equipped by group members; keyed by name-realm of group member
local lootedItems = {}  					-- array of items looted by player; keyed by name-realm of looter

--[[ UTILITY FUNCTIONS ]]--

local function GetItemPrimaryAttribute(item)
	local stats = GetItemStats(item)
	if stats ~= nil then
		for stat, value in pairs(stats) do
			if _G[stat] == ITEM_MOD_STRENGTH_SHORT or _G[stat] == ITEM_MOD_INTELLECT_SHORT or _G[stat] == ITEM_MOD_AGILITY_SHORT then
				return _G[stat]
			end
		end
	end
	return nil
end

local function IsPlayer(characterName)
	return characterName == 'player'
		or characterName == PLH_GetFullName('player')
		or characterName == UnitName('player')
end

local function hasBonus(fullItemInfo)
	return fullItemInfo[FII_HAS_SOCKET]
		or fullItemInfo[FII_HAS_SPEED]
		or fullItemInfo[FII_HAS_LEECH]
		or fullItemInfo[FII_HAS_AVOIDANCE]
		or fullItemInfo[FII_HAS_INDESTRUCTIBLE]
end

local function GetILVLFromTooltip(tooltip)
	local ITEM_LEVEL_PATTERN				= _G.ITEM_LEVEL:gsub('%%d', '(%%d+)')  				-- Item Level (%d+)
	local ilvl = nil
	local text = tooltip.leftside[2]:GetText()
	if text ~= nil then
		ilvl = text:match(ITEM_LEVEL_PATTERN)
	end
	if ilvl == nil then  -- ilvl can be in the 2nd or 3rd line dependng on the tooltip; if we didn't find it in 2nd, try 3rd
		text = tooltip.leftside[3]:GetText()
		if text ~= nil then
			ilvl = text:match(ITEM_LEVEL_PATTERN)
		end
	end
	return ilvl
end

local function GetFullItemInfo(item)
	local ITEM_CLASSES_ALLOWED_PATTERN		= _G.ITEM_CLASSES_ALLOWED:gsub('%%s', '(.+)')		-- Classes: (.+)
	local BIND_TRADE_TIME_REMAINING_PATTERN = _G.BIND_TRADE_TIME_REMAINING:gsub('%%s', '(.+)')  -- You may trade this item with players that were also eligible to loot this item for the next (.+).
	local TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN_PATTERN 				= _G.TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN:gsub('%%s', '(.+)')			-- You haven't collected this appearance
	local TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN_PATTERN 	= _G.TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN:gsub('%%s', '(.+)')	-- You've collected this appearance, but not from this item
	local TOOLTIP_AZERITE_UNLOCK_LEVELS_PATTERN							= _G.TOOLTIP_AZERITE_UNLOCK_LEVELS:gsub('%(0/%%d%)', '%%(0/%%d%%)')  		-- Azerite Powers (0/%d):
	local CURRENTLY_SELECTED_AZERITE_POWERS_PATTERN						= _G.CURRENTLY_SELECTED_AZERITE_POWERS:gsub('%(%%d/%%d%)', '%%(%%d/%%d%%)')	-- Active Azerite Powers (%d/%d):
	local fullItemInfo = {}

	if item ~= nil then
		fullItemInfo[FII_ITEM] = item
		
		-- determine the basic values from the Blizzard GetItemInfo() API call
		_, _, fullItemInfo[FII_QUALITY], fullItemInfo[FII_BASE_ILVL], fullItemInfo[FII_REQUIRED_LEVEL], _, _, _, fullItemInfo[FII_ITEM_EQUIP_LOC], _, _, fullItemInfo[FII_CLASS], fullItemInfo[FII_SUB_CLASS], fullItemInfo[FII_BIND_TYPE], _, _, _ = GetItemInfo(item)

		-- determine whether the item is equippable
		fullItemInfo[FII_IS_EQUIPPABLE] = IsEquippableItem(item)

		if fullItemInfo[FII_IS_EQUIPPABLE] then

			-- set up the tooltip to determine values that aren't returned via GetItemInfo()
			tooltipLong = tooltipLong or PLH_CreateEmptyTooltip(30)
			tooltipLong:ClearLines()
			tooltipLong:SetHyperlink(item)

			-- determine the real iLVL
			local realILVL = GetILVLFromTooltip(tooltipLong)
			if realILVL == nil then  -- if we still couldn't find it (shouldn't happen), just use the base ilvl we got from GetItemInfo()
				realILVL = fullItemInfo[FII_BASE_ILVL]
			end
			fullItemInfo[FII_REAL_ILVL] = tonumber(realILVL)

			local classes = nil
			local hasBindTradeTimeWarning = nil
			local hasSocket = false
			local hasAvoidance = false
			local hasIndestructible = false
			local hasLeech = false
			local hasSpeed = false
			local xmoggable = false
			local isAzeriteItem = false
			local text

			local index = 6 -- the elements we're looking for are all further down in the tooltip
			while tooltipLong.leftside[index] do
				text = tooltipLong.leftside[index]:GetText()
				if text ~= nil then
					hasBindTradeTimeWarning = hasBindTradeTimeWarning or text:match(BIND_TRADE_TIME_REMAINING_PATTERN)
					classes = classes or text:match(ITEM_CLASSES_ALLOWED_PATTERN)
					hasSocket = hasSocket or text:find(_G.EMPTY_SOCKET_PRISMATIC) == 1
					hasAvoidance = hasAvoidance or text:find(_G.STAT_AVOIDANCE) ~= nil
					hasIndestructible = hasIndestructible or text:find(_G.STAT_STURDINESS) == 1
					hasLeech = hasLeech or text:find(_G.STAT_LIFESTEAL) ~= nil
					hasSpeed = hasSpeed or text:find(_G.STAT_SPEED) ~= nil
					xmoggable = xmoggable or text:find(TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN_PATTERN) ~= nil or text:find(TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN_PATTERN) ~= nil
					isAzeriteItem = isAzeriteItem or text:match(TOOLTIP_AZERITE_UNLOCK_LEVELS_PATTERN) ~= nil or text:match(CURRENTLY_SELECTED_AZERITE_POWERS_PATTERN) ~= nil
				end
				index = index + 1
			end

			if classes ~= nil then
				classes = string.upper(classes)
				classes = string.gsub(classes, ' ', '')  -- remove space for DEMON HUNTER, DEATH KNIGHT
			end


			fullItemInfo[FII_CLASSES] = classes
			fullItemInfo[FII_TRADE_TIME_WARNING_SHOWN] = hasBindTradeTimeWarning
			fullItemInfo[FII_HAS_SOCKET] = hasSocket
			fullItemInfo[FII_HAS_AVOIDANCE] = hasAvoidance
			fullItemInfo[FII_HAS_INDESTRUCTIBLE] = hasIndestructible
			fullItemInfo[FII_HAS_LEECH] = hasLeech
			fullItemInfo[FII_HAS_SPEED] = hasSpeed
			fullItemInfo[FII_XMOGGABLE] = xmoggable
			fullItemInfo[FII_IS_AZERITE_ITEM] = isAzeriteItem
		end
	end

	return fullItemInfo
end

--[[ FUNCTIONS TO CHECK IF ITEM IS EQUIPPABLE ]]--

local function IsTrinketUsable(item, role)
	local itemLink = select(2, GetItemInfo(item))
	local itemID = string.match(itemLink, 'item:(%d+):')

	local trinketList = PLH_GetTrinketList(role)

	if itemID ~= nil and trinketList ~= nil then
		return trinketList[tonumber(itemID)]
	else
		return false
	end
end

-- Returns false if the character cannot use the item.
local function IsEquippableItemForCharacter(fullItemInfo, characterName)
	local characterClass
	local characterSpec
	local characterLevel

	if fullItemInfo ~= nil and characterName ~= nil and fullItemInfo[FII_IS_EQUIPPABLE] then
		if IsPlayer(characterName) then
			_, characterClass = UnitClass('player')
			characterSpec = GetSpecializationInfo(GetSpecialization())
			characterLevel = UnitLevel('player')
		elseif groupInfoCache[characterName] ~= nil then
			characterClass = groupInfoCache[characterName][CLASS_NAME]
			characterSpec = groupInfoCache[characterName][SPEC]
			characterLevel = groupInfoCache[characterName][LEVEL]
		else
			return true  -- should never reach here, but if we do it means we're not looking up the player or anyone in cache
		end

		if fullItemInfo[FII_REQUIRED_LEVEL] > characterLevel and not IsPlayer(characterName) then
			return false
		end
		
		if fullItemInfo[FII_CLASSES] ~= nil then	-- check whether to item is a class restricted item (ex: tier)
			if not string.find(characterClass, fullItemInfo[FII_CLASSES]) then
				return false
			end
		end
		
		if fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_CLOAK' or fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_FINGER' or fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_NECK' then
			return true
		end

		if fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_WEAPON' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_SHIELD' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_2HWEAPON' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_WEAPONMAINHAND' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_WEAPONOFFHAND' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_HOLDABLE' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_RANGED' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_THROWN' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_RANGEDRIGHT' or
			fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_TRINKET' then
			
			local itemPrimaryAttribute = GetItemPrimaryAttribute(fullItemInfo[FII_ITEM])
			if itemPrimaryAttribute ~= nil then
				local isValidPrimaryAttribute = false
				for _, spec in pairs(SPEC_BY_CLASS[characterClass]) do
					if characterSpec == spec or not PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY] then
						if PRIMARY_ATTRIBUTE_BY_SPEC[spec] == itemPrimaryAttribute then
							isValidPrimaryAttribute = true
							break;
						end
					end
				end
				if not isValidPrimaryAttribute then
					return false
				end
			end
		end

		if fullItemInfo[FII_ITEM_EQUIP_LOC] == 'INVTYPE_TRINKET' then
			for _, spec in pairs(SPEC_BY_CLASS[characterClass]) do
				if characterSpec == spec or not PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY] then
					if IsTrinketUsable(fullItemInfo[FII_ITEM], ROLE_BY_SPEC[spec]) then
						return true
					end
				end
			end
			return IsTrinketUsable(fullItemInfo[FII_ITEM], PLH_ROLE_UNKNOWN) == true
		else
			local subClasses		
			for _, spec in pairs(SPEC_BY_CLASS[characterClass]) do
				if characterSpec == spec or not PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY] then
					if fullItemInfo[FII_CLASS] == LE_ITEM_CLASS_ARMOR then
						subClasses = EQUIPPABLE_ARMOR_BY_SPEC[spec]
					else
						subClasses = EQUIPPABLE_WEAPON_BY_SPEC[spec]
					end
					for _, subClass in pairs(subClasses) do
						if subClass == fullItemInfo[FII_SUB_CLASS] then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

--[[ FUNCTIONS TO CHECK IF ITEM IS AN UPGRADE ]]--

-- returns two variables:  true if the item is an upgrade over equippedItem (based on ilvl), equipped ilvl
local function IsAnUpgrade(itemILVL, equippedILVL, threshold)
	if equippedILVL == nil then  -- this means we couldn't find an equippedItem
		return false, 0
	else
		if threshold == nil then
			threshold = 1
		end
		return itemILVL > equippedILVL + threshold, equippedILVL
	end
end

-- Returns an appropriate SlotID for the given itemEquipLoc, or nil if it's not an item
--    if itemEquipLoc is a finger slot or trinket slot, we'll just return the first item
--    if itemEquipLoc is a weapon that can be in either slot (INVTYPE_WEAPON), we'll return the main hand
local function GetSlotID(itemEquipLoc)
	if itemEquipLoc == 'INVTYPE_HEAD' then return INVSLOT_HEAD
	elseif itemEquipLoc == 'INVTYPE_NECK' then return INVSLOT_NECK
	elseif itemEquipLoc == 'INVTYPE_SHOULDER' then return INVSLOT_SHOULDER
	elseif itemEquipLoc == 'BODY' then return INVSLOT_BODY
	elseif itemEquipLoc == 'INVTYPE_CHEST' then return INVSLOT_CHEST
	elseif itemEquipLoc == 'INVTYPE_ROBE' then return INVSLOT_CHEST
	elseif itemEquipLoc == 'INVTYPE_WAIST' then return INVSLOT_WAIST
	elseif itemEquipLoc == 'INVTYPE_LEGS' then return INVSLOT_LEGS
	elseif itemEquipLoc == 'INVTYPE_FEET' then return INVSLOT_FEET
	elseif itemEquipLoc == 'INVTYPE_WRIST' then return INVSLOT_WRIST
	elseif itemEquipLoc == 'INVTYPE_HAND' then return INVSLOT_HAND
	elseif itemEquipLoc == 'INVTYPE_FINGER' then return INVSLOT_FINGER1
	elseif itemEquipLoc == 'INVTYPE_TRINKET' then return INVSLOT_TRINKET1
	elseif itemEquipLoc == 'INVTYPE_CLOAK' then return INVSLOT_BACK
	elseif itemEquipLoc == 'INVTYPE_WEAPON' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_SHIELD' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_2HWEAPON' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_WEAPONMAINHAND' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_WEAPONOFFHAND' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_HOLDABLE' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_RANGED' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_THROWN' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_RANGEDRIGHT' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_TABARD' then return INVSLOT_TABARD
	else return nil
	end
end

-- Returns the FULL_ITEM_INFO that character has equipped in slotID
local function GetEquippedItem(characterName, slotID)
	local item = nil
	if IsPlayer(characterName) then
		item = playerItemCache[slotID]
	else
		local characterDetails = groupInfoCache[characterName]
		if characterDetails ~= nil then
			item = GetFullItemInfo(characterDetails[slotID])
		end
	end
	return item
end

local function LoadPlayerItems()
	local item
	for slotID = 1, 17 do
		item = GetInventoryItemLink('player', slotID)
		if item ~= nil then
			playerItemCache[slotID] = GetFullItemInfo(item)
		else
			playerItemCache[slotID] = nil
		end
	end
end

-- returns two variables:  true if the item is an upgrade over equippedItem (based on ilvl), equipped ilvl
-- note: doesn't check if item is equippable, so make sure you do that check beforehand
-- both parameter:  if true, return true for rings/trinkets only if it's an upgrade for both slots
local function IsAnUpgradeForCharacter(fullItemInfo, characterName, threshold, both)
	local itemEquipLoc = fullItemInfo[FII_ITEM_EQUIP_LOC]
	local itemRealILVL = fullItemInfo[FII_REAL_ILVL]

	local equippedItem1 = nil
	local isAnUpgrade1 = false
	local equippedILVL1 = 0
	local equippedItem2 = nil
	local isAnUpgrade2 = false
	local equippedILVL2 = 0
	local slotID
	
	if itemEquipLoc ~= nil and itemEquipLoc ~= '' then
		if itemEquipLoc == 'INVTYPE_FINGER' then
			equippedItem1 = GetEquippedItem(characterName, INVSLOT_FINGER1)
			equippedItem2 = GetEquippedItem(characterName, INVSLOT_FINGER2)
		elseif itemEquipLoc == 'INVTYPE_TRINKET' then
			equippedItem1 = GetEquippedItem(characterName, INVSLOT_TRINKET1)
			equippedItem2 = GetEquippedItem(characterName, INVSLOT_TRINKET2)
		elseif itemEquipLoc == 'INVTYPE_WEAPON' then
			equippedItem1 = GetEquippedItem(characterName, INVSLOT_MAINHAND)
			equippedItem2 = GetEquippedItem(characterName, INVSLOT_OFFHAND)
			if equippedItem2 ~= nil and equippedItem2[FII_ITEM_EQUIP_LOC] == 'INVTYPE_SHIELD' then
				equippedItem2 = nil		-- ignore this slot if we have a shield equipped in offhand
			end
		else
			slotID = GetSlotID(itemEquipLoc)
			equippedItem1 = GetEquippedItem(characterName, slotID)
		end
		if equippedItem1 ~= nil then
			if equippedItem2 ~= nil then
				isAnUpgrade1, equippedILVL1 = IsAnUpgrade(itemRealILVL, equippedItem1[FII_REAL_ILVL], threshold)
				isAnUpgrade2, equippedILVL2 = IsAnUpgrade(itemRealILVL, equippedItem2[FII_REAL_ILVL], threshold)
				if both then
					isAnUpgrade1 = isAnUpgrade1 and isAnUpgrade2
				else
					isAnUpgrade1 = isAnUpgrade1 or isAnUpgrade2
				end
				equippedILVL1 = min(equippedILVL1, equippedILVL2)
			else
				isAnUpgrade1, equippedILVL1 = IsAnUpgrade(itemRealILVL, equippedItem1[FII_REAL_ILVL], threshold)
			end
		end
	end

	return isAnUpgrade1, equippedILVL1
end

-- returns two variables:  first is true or false, second is array of people for whom the item may is an upgrade (by ilvl)
local function IsAnUpgradeForAnyCharacter(fullItemInfo)
	local isAnUpgrade, equippedILVL
	local isAnUpgradeForAnyCharacterNames = {}

	local index = 1
	local characterName
	while GetRaidRosterInfo(index) ~= nil do
		characterName = PLH_GetFullName(select(1, GetRaidRosterInfo(index)))
		if IsEquippableItemForCharacter(fullItemInfo, characterName) then
			isAnUpgrade, equippedILVL = IsAnUpgradeForCharacter(fullItemInfo, characterName, 0)
			if isAnUpgrade then
				isAnUpgradeForAnyCharacterNames[#isAnUpgradeForAnyCharacterNames + 1] = Ambiguate(characterName, 'short') .. ' (' .. equippedILVL .. ')'
			end
		end
		index = index + 1
	end
	return #isAnUpgradeForAnyCharacterNames > 0, isAnUpgradeForAnyCharacterNames
end

--[[ FUNCTIONS FOR PLHUSERS ]]

function PLH_GetNumberOfPLHUsers()
	local count = 0
	for _ in pairs(plhUsers) do
		count = count + 1
	end
	return count
end

local function IsPLHUser(characterName)
	if plhUsers[characterName] ~= nil then
		return true
	else
		return false
	end
end

--[[ FUNCTIONS FOR DISPLAYING THE LOOTED ITEMS WINDOW ]]--

local function IsEnchanting(profession)
	if profession ~= nil then
		return select(7, GetProfessionInfo(profession)) == 333
	else
		return false
	end
end

local function IsEnchanter()
	local profession1, profession2 = GetProfessions()
	return IsEnchanting(profession1) or IsEnchanting(profession2)
end

-- This is a bit of a hack.  The user could still mouseover widgets that weren't within the visible area of
-- lootedItemsFrame, so lets only show the buttons/tooltips if the widget is really visible
local function IsWidgetVisible(widget, tolerance)
	if widget == nil then
		return false
	else
		if tolerance == nil then
			tolerance = 0
		end
		local widgetTop = widget:GetTop()
		local lootedItemFramesBottom = lootedItemsFrame:GetBottom()
		local widgetBottom = widget:GetBottom()
		local lootedItemFramesTop = lootedItemsFrame:GetTop()
		if widgetTop ~= nil and lootedItemFramesBottom ~= nil and widgetBottom ~= nil and lootedItemFramesTop ~= nil then
			return widgetTop > lootedItemFramesBottom + tolerance and widgetBottom < lootedItemFramesTop + tolerance
		else
			return false
		end
	end
end

-- Hides buttons and itemFrames outside the visibile area of contentFrame so they don't steal focus when moused over
local function HideOffScreenWidgets()
	if contentFrame ~= nil then
		for i = 1, buttonIndex do
			if IsWidgetVisible(buttons[i], 0) then
				buttons[i]:Show()
			else
				buttons[i]:Hide()
			end
		end	

		for i = 1, itemFrameIndex do
			if IsWidgetVisible(itemFrames[i], 0) then
				itemFrames[i]:Show()
			else
				itemFrames[i]:Hide()
			end
		end	
		
		for lootedItemIndex, requestors in pairs(radioButtons) do
			for requestorIndex, radioButton in pairs(requestors) do
				if IsWidgetVisible(radioButton, 0) and lootedItems[lootedItemIndex][STATUS] == STATUS_REQUESTED then
					radioButton:Show()
				else
					radioButton:Hide()
				end
			end
		end
	end
end

local function ClearLootedItemsDisplay()
	local kids = { contentFrame:GetRegions() };
	for _, child in ipairs(kids) do
		child:Hide()
	end	

	local kids = { contentFrame:GetChildren() };
	for _, child in ipairs(kids) do
		child:Hide()
	end	
end

local function GetILVLDifferenceString(lootedItem, characterName)
	local text = ''
	local isAnUpgrade, equippedILVL = IsAnUpgradeForCharacter(lootedItem[FULL_ITEM_INFO], characterName, 0)
	if equippedILVL ~= 0 and lootedItem[FULL_ITEM_INFO][FII_REAL_ILVL] ~= 0 then
		local ilvlDifference = lootedItem[FULL_ITEM_INFO][FII_REAL_ILVL] - equippedILVL
		if ilvlDifference >= 0 then
			text = COLOR_HIGHER_ILVL .. " +" .. ilvlDifference .. _G.FONT_COLOR_CODE_CLOSE
		else
			text = COLOR_LOWER_ILVL .. " " .. ilvlDifference .. _G.FONT_COLOR_CODE_CLOSE
		end
	end
	return text
end

local function ShouldShowLootedItem(lootedItem)
	local lootedItemStatus = lootedItem[STATUS]
	local isPlayer = IsPlayer(lootedItem[LOOTER_NAME])

	return (lootedItemStatus == STATUS_OFFERED)
		or (lootedItemStatus == STATUS_DEFAULT and isPlayer)
		or (lootedItemStatus == STATUS_REQUESTED and isPlayer)
		or (lootedItemStatus == STATUS_KEPT and not isPlayer)
		or (lootedItemStatus == STATUS_AVAILABLE and not isPlayer)
		or (lootedItemStatus == STATUS_AVAILABLE and isPlayer and lootedItem[CONFIRMATION_MESSAGE] ~= nil)
		or (lootedItemStatus == STATUS_REQUESTED and not isPlayer and lootedItem[CONFIRMATION_MESSAGE] ~= nil)
end

local function ShouldShowLootedItemsDisplay()
	for lootedItemIndex = 1, #lootedItems do
		if ShouldShowLootedItem(lootedItems[lootedItemIndex]) then
			return true
		end
	end
end

-- returns true if requestType is higher priority than priorRequestType
local function IsRequestTypeHigherPriority(requestType, priorRequestType)
	return (requestType == REQUEST_TYPE_MAIN_SPEC and (priorRequestType == REQUEST_TYPE_OFF_SPEC or priorRequestType == REQUEST_TYPE_XMOG or priorRequestType == REQUEST_TYPE_SHARD))
		or (requestType == REQUEST_TYPE_OFF_SPEC and (priorRequestType == REQUEST_TYPE_XMOG or priorRequestType == REQUEST_TYPE_SHARD))
		or (requestType == REQUEST_TYPE_XMOG and (priorRequestType == REQUEST_TYPE_SHARD))
end		

-- MS > OS > XMOG > SHARD, then by roll
local function SetRequestorSortOrder(requestors)
	local priorRequestType
	local priorRoll
	
	local requestType
	local roll

	local requestor
	local nextRequestorIndex = 0
	local sortOrder = 1

	for i = 1, #requestors do
		requestor = requestors[i]
		requestor[REQUESTOR_SORT_ORDER] = ''
	end
	
	for i = 1, #requestors do
		for j = 1, #requestors do
			requestor = requestors[j]
		
			if requestor[REQUESTOR_SORT_ORDER] == '' then
				requestType = requestor[REQUESTOR_REQUEST_TYPE]
				roll = requestor[REQUESTOR_ROLL]
		
				if (nextRequestorIndex == 0)
					or (IsRequestTypeHigherPriority(requestType, priorRequestType))
					or (not IsRequestTypeHigherPriority(priorRequestType, requestType) and roll > priorRoll) then
					
					nextRequestorIndex = j
					priorRequestType = requestType
					priorRoll = roll
				end
			end
		end

		requestors[nextRequestorIndex][REQUESTOR_SORT_ORDER] = sortOrder
		sortOrder = sortOrder + 1
		nextRequestorIndex = 0
	end
end

-- Returns a frame to display around the itemLabel, allowing users to see tooltips by hovering their mouse over the itemLabel
-- Creates a new Frame or reuses one from the itemFrames array if one is available.
-- Create item frames this way vs. creating a new Frame for each to save on memory utilization
local function CreateItemFrame(itemLabel, item, anchor)
	itemFrameIndex = itemFrameIndex + 1
	
	if itemFrames[itemFrameIndex] == nil then
		itemFrames[itemFrameIndex] = CreateFrame('Frame', nil, contentFrame)
		itemFrames[itemFrameIndex]:SetScript('OnLeave', function(self)
			self:SetScript('OnEvent', nil)
			self:UnregisterAllEvents()
			GameTooltip:Hide()
		end)
	else
		itemFrames[itemFrameIndex]:ClearAllPoints()
		itemFrames[itemFrameIndex]:SetScript('OnEnter', nil)
		itemFrames[itemFrameIndex]:SetScript('OnEvent', nil)
		itemFrames[itemFrameIndex]:UnregisterAllEvents()
		itemFrames[itemFrameIndex]:Show()
	end
	
	itemFrames[itemFrameIndex]:SetSize(itemLabel:GetWidth(), itemLabel:GetHeight())
	itemFrames[itemFrameIndex]:SetPoint('TOPLEFT', anchor, 'TOPRIGHT')
	itemFrames[itemFrameIndex]:SetScript('OnEnter', function(self)
		if IsWidgetVisible(self, 11) then
			GameTooltip:SetOwner(self, 'ANCHOR_CURSOR')
			GameTooltip:SetHyperlink(item)
			GameTooltip:Show()

			self:SetScript('OnEvent', function(self, event, arg, ...)
				if self:IsShown() and event == 'MODIFIER_STATE_CHANGED' and (arg == 'LSHIFT' or arg == 'RSHIFT') then
					GameTooltip:SetOwner(self, 'ANCHOR_CURSOR')
					GameTooltip:SetHyperlink(item)
					GameTooltip:Show()
				end
			end)
			self:RegisterEvent('MODIFIER_STATE_CHANGED')
		end
	end)
end

-- Returns a label to display by either creating a new FontString or reusing one from the labels array if one is available.
-- Create labels this way vs. creating a new FontString for each to save on memory utilization
local function CreateLabel(text, color, anchor, relativePoint, xOffset, yOffset)
	labelIndex = labelIndex + 1

	if labels[labelIndex] == nil then
		labels[labelIndex] = contentFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
		labels[labelIndex]:SetJustifyH('LEFT')
	else
		labels[labelIndex]:ClearAllPoints()
		labels[labelIndex]:Show()
	end

	if color ~= nil then
		text = color .. text .. _G.FONT_COLOR_CODE_CLOSE
	end
		
	labels[labelIndex]:SetText(text)
	labels[labelIndex]:SetPoint('TOPLEFT', anchor, relativePoint, xOffset, yOffset)

	return labels[labelIndex]
end

-- Returns a button to display by either creating a new button or reusing one from the buttons array if one is available.
-- Extra parameters are passed to the OnClickFunction
-- Create buttons this way vs. creating a new frame for each to save on memory utilization
local function CreateButton(text, width, xOffset, yOffset, onClickFunction, ...)
	buttonIndex = buttonIndex + 1

	if buttons[buttonIndex] == nil then
		buttons[buttonIndex] = CreateFrame('Button', nil, contentFrame, 'UIPanelButtonTemplate')
		buttons[buttonIndex]:SetNormalFontObject('GameFontNormalSmall')
	else
		buttons[buttonIndex]:ClearAllPoints()
		buttons[buttonIndex]:SetScript('OnClick', nil)
		buttons[buttonIndex]:SetScript('OnEnter', nil)
		buttons[buttonIndex]:Show()
	end

	buttons[buttonIndex]:SetSize(width, 15)
	buttons[buttonIndex]:SetText(COLOR_BUTTON_TEXT .. text .. _G.FONT_COLOR_CODE_CLOSE)
	buttons[buttonIndex]:SetPoint('TOPLEFT', contentFrame, 'TOPLEFT', xOffset, yOffset)

	if onClickFunction ~= nil then
		local param1, param2 = ...
		buttons[buttonIndex]:SetScript('OnClick', function(self, event, ...)
			onClickFunction(param1, param2)
		end)
	end
	
	return buttons[buttonIndex]
end
	
-- updates the display of looted items
local function UpdateLootedItemsDisplay()
	local lootedItem
	local lootedItemStatus
	local requestor

	local verticalOffset = -5
	local VERTICAL_SPACING = -15
	local INDENT = 15
	
	local text
	local color
	
	labelIndex = 0
	buttonIndex = 0
	itemFrameIndex = 0

	ClearLootedItemsDisplay()

	if ShouldShowLootedItemsDisplay() then

		for lootedItemIndex = 1, #lootedItems do
			lootedItem = lootedItems[lootedItemIndex]
			if ShouldShowLootedItem(lootedItem) then
				lootedItemStatus = lootedItem[STATUS]

				--[[ ITEM ]] --

				-- Looter Label
				
				if IsPlayer(lootedItem[LOOTER_NAME]) then
					color = COLOR_PLAYER_LOOTED_ITEM
					if lootedItemStatus == STATUS_REQUESTED or lootedItemStatus == STATUS_OFFERED or lootedItem[CONFIRMATION_MESSAGE] ~= nil then
						text = "你愿意交易 " --.. lootedItem[FULL_ITEM_INFO][FII_ITEM]
					else
						text = "你可以交易 " --.. lootedItem[FULL_ITEM_INFO][FII_ITEM]
					end
				else
					color = COLOR_NON_PLAYER_LOOTED_ITEM
					if IsPLHUser(lootedItem[LOOTER_NAME]) then
						text = Ambiguate(lootedItem[LOOTER_NAME], 'all') .. " 愿意交易 " --.. lootedItem[FULL_ITEM_INFO][FII_ITEM]
					else
						text = Ambiguate(lootedItem[LOOTER_NAME], 'all') .. " 可以交易 " --.. lootedItem[FULL_ITEM_INFO][FII_ITEM]
					end
				end
				CreateLabel(text, color, contentFrame, 'TOPLEFT', 0, verticalOffset)
				
				-- BoE Label
				
				if lootedItem[FULL_ITEM_INFO][FII_BIND_TYPE] == LE_ITEM_BIND_ON_EQUIP then
					CreateLabel("BoE ", COLOR_BOE, labels[labelIndex], 'TOPRIGHT')
				end

				-- Item Label

				CreateLabel(lootedItem[FULL_ITEM_INFO][FII_ITEM], nil, labels[labelIndex], 'TOPRIGHT')
				CreateItemFrame(labels[labelIndex], lootedItems[lootedItemIndex][FULL_ITEM_INFO][FII_ITEM], labels[labelIndex - 1])
				
				-- Info Label - ilvl and tertiary stats

				text = ''
				if not IsPlayer(lootedItem[LOOTER_NAME]) then
					text = text .. GetILVLDifferenceString(lootedItem, PLH_GetFullName('player'))
				end
				if hasBonus(lootedItem[FULL_ITEM_INFO]) then
					text = text .. COLOR_HIGHER_ILVL
					if lootedItem[FULL_ITEM_INFO][FII_HAS_SOCKET] then
						text = text .. " 宝石"
					end
					if lootedItem[FULL_ITEM_INFO][FII_HAS_SPEED] then
						text = text .. ' ' .. _G.STAT_SPEED
					end
					if lootedItem[FULL_ITEM_INFO][FII_HAS_LEECH] then
						text = text .. ' ' .. _G.STAT_LIFESTEAL
					end
					if lootedItem[FULL_ITEM_INFO][FII_HAS_AVOIDANCE] then
						text = text .. ' ' .. _G.STAT_AVOIDANCE
					end
					if lootedItem[FULL_ITEM_INFO][FII_HAS_INDESTRUCTIBLE] then
						text = text .. ' ' .. _G.STAT_STURDINESS
					end
				end
				if not IsPlayer(lootedItem[LOOTER_NAME]) and lootedItem[FULL_ITEM_INFO][FII_XMOGGABLE] then
					text = text .. ' 幻化'
				end

				if text ~= '' then
					text = text .. _G.FONT_COLOR_CODE_CLOSE
					CreateLabel(text, nil, labels[labelIndex], 'TOPRIGHT')
				end
				
				verticalOffset = verticalOffset + VERTICAL_SPACING

				--[[ ITEM STATUS ]] --

				text = ''
				if lootedItemStatus == STATUS_KEPT  then
					text = "战利品不再可用——它被拾取者保存或交易"
				elseif lootedItemStatus == STATUS_OFFERED then
					if IsPlayer(lootedItem[LOOTER_NAME]) then
						local selectedIndex = lootedItem[SELECTED_REQUESTOR_INDEX]
						local offeredName = lootedItem[REQUESTORS][selectedIndex][REQUESTOR_NAME]
						text = "给 " .. Ambiguate(offeredName, 'all') .. "!  *** 开启交易来把战利品给出去 ***"
					elseif lootedItem[SELECTED_REQUESTOR_INDEX] == 1 then
						text = Ambiguate(lootedItem[LOOTER_NAME], 'all') .. " 把战利品给你!  *** 开启交易接受战利品 ***"
					else
						text = "战利品不再可用——它被拾取者保存或交易"
					end
				elseif lootedItem[CONFIRMATION_MESSAGE] ~= nil then
					text = lootedItem[CONFIRMATION_MESSAGE]
--				elseif lootedItemStatus == STATUS_REQUESTED then
--					text = "You requested this item"
--				elseif lootedItemStatus == STATUS_REQUESTED_VIA_WHISPER then
--					text = "You whispered " .. Ambiguate(lootedItem[LOOTER_NAME], 'all') .. " to request this item"
				end

				if text ~= '' then
					CreateLabel(text, color, contentFrame, 'TOPLEFT', INDENT, verticalOffset)
					verticalOffset = verticalOffset + VERTICAL_SPACING
					if lootedItem[CONFIRMATION_MESSAGE] ~= nil then
						verticalOffset = verticalOffset + (VERTICAL_SPACING / 2)  -- confirmation messages are 2 lines long, so add an extra line
					end
				end
				
				--[[ REQUESTORS ]]--

				if IsPlayer(lootedItem[LOOTER_NAME]) and lootedItemStatus == STATUS_REQUESTED then
					radioButtons[lootedItemIndex] = {}
					SetRequestorSortOrder(lootedItem[REQUESTORS])
					for sortOrder = 1, #lootedItem[REQUESTORS] do
						for requestorIndex = 1, #lootedItem[REQUESTORS] do
							requestor = lootedItem[REQUESTORS][requestorIndex]
							if requestor[REQUESTOR_SORT_ORDER] == sortOrder then
								text = Ambiguate(requestor[REQUESTOR_NAME], 'all') .. " R " .. requestor[REQUESTOR_ROLL] .. " → " .. requestor[REQUESTOR_REQUEST_TYPE]
								if requestor[REQUESTOR_REQUEST_TYPE] == REQUEST_TYPE_MAIN_SPEC or requestor[REQUESTOR_REQUEST_TYPE] == REQUEST_TYPE_OFF_SPEC then
									text = text .. GetILVLDifferenceString(lootedItem, requestor[REQUESTOR_NAME])
								end
								CreateLabel(text, COLOR_PLAYER_LOOTED_ITEM, contentFrame, 'TOPLEFT', INDENT + 15, verticalOffset)
								
								radioButtons[lootedItemIndex][requestorIndex] = CreateFrame('CheckButton', nil, contentFrame, 'UIRadioButtonTemplate', requestorIndex)
								radioButtons[lootedItemIndex][requestorIndex]:SetHeight(15)
								radioButtons[lootedItemIndex][requestorIndex]:SetWidth(15)
								radioButtons[lootedItemIndex][requestorIndex]:ClearAllPoints()
								radioButtons[lootedItemIndex][requestorIndex]:SetPoint('TOPLEFT', contentFrame, 'TOPLEFT', INDENT, verticalOffset)
								if sortOrder == 1 and lootedItem[SELECTED_REQUESTOR_INDEX] == '' then
									lootedItem[DEFAULT_REQUESTOR_INDEX] = requestorIndex
									radioButtons[lootedItemIndex][requestorIndex]:SetChecked(true)
								elseif lootedItem[SELECTED_REQUESTOR_INDEX] == requestorIndex then
									radioButtons[lootedItemIndex][requestorIndex]:SetChecked(true)
								end
								radioButtons[lootedItemIndex][requestorIndex]:SetScript('OnClick', function ( self )
									for radioIndex = 1, #radioButtons[lootedItemIndex] do
										if radioIndex == self:GetID() then
											radioButtons[lootedItemIndex][radioIndex]:SetChecked(true)
										else
											radioButtons[lootedItemIndex][radioIndex]:SetChecked(false)
										end
									end
									lootedItems[lootedItemIndex][SELECTED_REQUESTOR_INDEX] = requestorIndex
								end)

								verticalOffset = verticalOffset + VERTICAL_SPACING
							end
						end
					end
				end
				
				--[[ BUTTONS ]]--

				if IsPlayer(lootedItem[LOOTER_NAME]) then
					if lootedItem[CONFIRMATION_MESSAGE] ~= nil then
						CreateButton("OK", 50, INDENT, verticalOffset, PLH_DoClearConfirmationMessage, lootedItemIndex)
					elseif lootedItemStatus == STATUS_OFFERED then
						CreateButton("OK", 50, INDENT, verticalOffset, PLH_DoHideItem, lootedItemIndex)
					else
						CreateButton("保留", 50, INDENT, verticalOffset, PLH_DoKeepItem, lootedItemIndex)
					end

					if lootedItemStatus == STATUS_DEFAULT then
						CreateButton("给PLH用户", 160, INDENT + 65, verticalOffset, PLH_DoTradeItem, lootedItemIndex)
					elseif lootedItemStatus == STATUS_REQUESTED then
						CreateButton("给选定的人", 180, INDENT + 65, verticalOffset, PLH_DoOfferItem, lootedItemIndex)
					end
				else
					if lootedItem[CONFIRMATION_MESSAGE] ~= nil then
						CreateButton("OK", 50, INDENT, verticalOffset, PLH_DoClearConfirmationMessage, lootedItemIndex)
					elseif lootedItemStatus ~= STATUS_AVAILABLE then
						CreateButton("OK", 50, INDENT, verticalOffset, PLH_DoHideItem, lootedItemIndex)
					else
						CreateButton("放弃", 50, INDENT, verticalOffset, PLH_DoHideItem, lootedItemIndex)

						if IsPLHUser(lootedItem[LOOTER_NAME]) then
--							if IsAnUpgradeForCharacter(lootedItem[FULL_ITEM_INFO], PLH_GetFullName('player'), PLH_PREFS[PLH_PREFS_ILVL_THRESHOLD]) then
								CreateButton("主需", 50, INDENT + 65, verticalOffset, PLH_DoRequestItem, lootedItemIndex, REQUEST_TYPE_MAIN_SPEC)
								CreateButton("次需", 50, INDENT + 115, verticalOffset, PLH_DoRequestItem, lootedItemIndex, REQUEST_TYPE_OFF_SPEC)
--							end
							if lootedItem[FULL_ITEM_INFO][FII_XMOGGABLE] then
								CreateButton("幻化", 50, INDENT + 165, verticalOffset, PLH_DoRequestItem, lootedItemIndex, REQUEST_TYPE_XMOG)
							end
							--if IsEnchanter() then
							--	CreateButton("SHARD", 50, INDENT + 215, verticalOffset, PLH_DoRequestItem, lootedItemIndex, REQUEST_TYPE_SHARD)
							--end
						else
							local button = CreateButton("私聊", 80, INDENT + 65, verticalOffset)
							button:SetScript('OnClick', function(self)
								if PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE] == nil or PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE] == '' then
									PLH_SendUserMessage("你必须在PLH选项[/ plh]中配置个性化的悄悄话来私聊请求")
								else
									PLH_DoWhisper(lootedItemIndex)
								end
							end)
							button:SetScript('OnEnter', function(self)
								if IsWidgetVisible(self, 0) then
									if PLH_META[PLH_SHOW_WHISPER_WARNING] == nil or PLH_META[PLH_SHOW_WHISPER_WARNING] then
										local warning = "私聊信息是: \"" .. PLH_GetWhisperMessage(lootedItems[lootedItemIndex][FULL_ITEM_INFO][FII_ITEM]) .. "\"\n你可以通过键入 \"/plh\"修改"
										PLH_SendUserMessage(warning)
										PLH_META[PLH_SHOW_WHISPER_WARNING] = false
									end
								end
							end)
						end
					end				
				end		

				verticalOffset = verticalOffset + (VERTICAL_SPACING * 2)
			end
		end

		if math.abs(verticalOffset) > lootedItemsFrame:GetHeight() then
			scrollbar:Show()
		else
			scrollbar:Hide()
		end

		HideOffScreenWidgets()

		lootedItemsFrame:Show()
	else
		lootedItemsFrame:Hide()
	end
end

-- modified from Recount
local function SaveMainWindowPosition()
	local xOfs, yOfs = lootedItemsFrame:GetCenter()
	local s = lootedItemsFrame:GetEffectiveScale()
	local uis = UIParent:GetScale()
	xOfs = xOfs * s - GetScreenWidth() * uis / 2
	yOfs = yOfs * s - GetScreenHeight() * uis / 2

	PLH_META[PLH_LOOTED_ITEMS_FRAME_X] = xOfs / uis
	PLH_META[PLH_LOOTED_ITEMS_FRAME_Y] = yOfs / uis
	PLH_META[PLH_LOOTED_ITEMS_FRAME_WIDTH] = lootedItemsFrame:GetWidth()
	PLH_META[PLH_LOOTED_ITEMS_FRAME_HEIGHT] = lootedItemsFrame:GetHeight()
end

-- modified from Recount
local function RestoreMainWindowPosition()
	local x = PLH_META[PLH_LOOTED_ITEMS_FRAME_X]
	local y = PLH_META[PLH_LOOTED_ITEMS_FRAME_Y]
	local width = PLH_META[PLH_LOOTED_ITEMS_FRAME_WIDTH]
	local height = PLH_META[PLH_LOOTED_ITEMS_FRAME_HEIGHT]

	local s = lootedItemsFrame:GetEffectiveScale()
	local uis = UIParent:GetScale()
	lootedItemsFrame:SetPoint("CENTER", UIParent, "CENTER", x * uis / s, y * uis / s)
	lootedItemsFrame:SetWidth(width)
	lootedItemsFrame:SetHeight(height)
end

local function CreateLootedItemsDisplay()
	--parent frame 
	lootedItemsFrame = CreateFrame('Frame', 'PLH_LootedItemsFrame', UIParent, 'InsetFrameTemplate3') 
	lootedItemsFrame:SetMovable(true)
	lootedItemsFrame:EnableMouse(true)
	lootedItemsFrame:EnableMouseWheel(true)
	lootedItemsFrame:RegisterForDrag('LeftButton')
	lootedItemsFrame:SetScript('OnDragStart', lootedItemsFrame.StartMoving)
	lootedItemsFrame:SetScript('OnDragStop', function(self)
		lootedItemsFrame:StopMovingOrSizing()
		SaveMainWindowPosition()
	end)
	lootedItemsFrame:SetResizable(true)
	lootedItemsFrame:SetMinResize(100, 50)
	lootedItemsFrame:SetMaxResize(600, 300)

	if lootedItemsFrame:GetHeight() == nil or lootedItemsFrame:GetHeight() == 0 then  	-- first try repositioning/resizing from layout-local.txt
		if PLH_META[PLH_LOOTED_ITEMS_FRAME_X] ~= nil then								-- if we didn't have anything there (ex: after addon was disabled and renabled), try saved variables
			RestoreMainWindowPosition()
			lootedItemsFrame:SetUserPlaced(true)
		else																			-- if we still couldn't find saved info, just use defaults
			lootedItemsFrame:SetSize(400, 140) 
			lootedItemsFrame:SetPoint('CENTER', UIParent, 'CENTER') 
		end
	end
	
	lootedItemsFrame:SetScript('OnMouseWheel', function(self, delta)
		local cur_val = scrollbar:GetValue()
		local min_val, max_val = scrollbar:GetMinMaxValues()

		if delta < 0 and cur_val < max_val then
			cur_val = math.min(max_val, cur_val + 10)
			scrollbar:SetValue(cur_val)
		elseif delta > 0 and cur_val > min_val then
			cur_val = math.max(min_val, cur_val - 10)
			scrollbar:SetValue(cur_val)
		end
	end)

	lootedItemsFrame:SetScript('OnSizeChanged', function(self, width, height)
		HideOffScreenWidgets()
	end)
	
	--scrollFrame 
	scrollFrame = CreateFrame('ScrollFrame', nil, lootedItemsFrame) 
	scrollFrame:SetPoint('TOPLEFT', 10, -5) 
	scrollFrame:SetPoint('BOTTOMRIGHT', -10, 5)
	scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
		HideOffScreenWidgets()
	end)
	scrollFrame:SetScript("OnShow", function(self)
		HideOffScreenWidgets()
	end)
	lootedItemsFrame.scrollframe = scrollFrame 

	--scrollbar 
	scrollbar = CreateFrame('Slider', nil, scrollFrame, 'UIPanelScrollBarTemplate')
	scrollbar:SetPoint('TOPLEFT', lootedItemsFrame, 'TOPRIGHT', -19, -38) 
	scrollbar:SetPoint('BOTTOMLEFT', lootedItemsFrame, 'BOTTOMRIGHT', -19, 34)
	scrollbar:SetMinMaxValues(1, 300) 
	scrollbar:SetValueStep(1) 
	scrollbar.scrollStep = 10 
	scrollbar:SetValue(0) 
	scrollbar:SetWidth(16) 
	scrollbar:SetScript('OnValueChanged', function (self, value) 
		self:GetParent():SetVerticalScroll(value) 
	end) 
	lootedItemsFrame.scrollbar = scrollbar 
	scrollbar:Hide()

	--content frame 
	contentFrame = CreateFrame('Frame', nil, scrollFrame) 
	contentFrame:SetSize(lootedItemsFrame:GetWidth(), lootedItemsFrame:GetHeight()) 
	scrollFrame.content = contentFrame
	scrollFrame:SetScrollChild(contentFrame)

	-- Close button
	local closeButton = CreateFrame('Button', nil, lootedItemsFrame, 'UIPanelCloseButton')
	closeButton:SetPoint('TOPRIGHT', 2, 0)
	closeButton:SetHeight(25)
	closeButton:SetWidth(25)
	closeButton:SetScript('OnClick', function(self)
		scrollbar:SetValue(0)
		HideParentPanel(self)
	end)
	lootedItemsFrame.closeButton = closeButton
	
	-- Resize button
	local resizeButton = CreateFrame('Button', nil, lootedItemsFrame)
	resizeButton:SetSize(16, 16)
	resizeButton:SetPoint('BOTTOMRIGHT')
	resizeButton:SetNormalTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up')
	resizeButton:SetHighlightTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight')
	resizeButton:SetPushedTexture('Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down')
	resizeButton:SetScript('OnMouseDown', function(self, button)
		lootedItemsFrame:StartSizing('BOTTOMRIGHT')
		lootedItemsFrame:SetUserPlaced(true)
	end)
	resizeButton:SetScript('OnMouseUp', function(self, button)
		lootedItemsFrame:StopMovingOrSizing()
		SaveMainWindowPosition()
	end)

	lootedItemsFrame:Hide()
end

--[[ FUNCTIONS FOR SEARCHING AND MODIFYING LOOTEDITEMS ARRAY ]]

-- Returns the item ID of the lootedItem
local function GetLootedItemID(lootedItem)
	local lootedItemID = -1
	local lootedItemLink = lootedItem[FULL_ITEM_INFO][FII_ITEM]
	if lootedItemLink ~= nil then
		lootedItemID = string.match(lootedItemLink, 'item:(%d+):')
	end
	return lootedItemID
end

-- Returns index of the lootedItem within lootedItems array for the given name and itemID
local function FindLootedItemIndex(name, itemID)
	local lootedItem
	local lootedItemID

	itemID = '' .. itemID  -- convert to a String
	
	for i = 1, #lootedItems do
		lootedItem = lootedItems[i]
		lootedItemID = GetLootedItemID(lootedItem)
		if lootedItem[STATUS] ~= STATUS_HIDDEN and lootedItem[LOOTER_NAME] == name and lootedItemID == itemID then
			return i
		end
	end
	
	return nil
end

local function GetLootedItem(looterName, lootedItemID)
	local lootedItemIndex = FindLootedItemIndex(looterName, lootedItemID)
	if lootedItemIndex ~= nil then
		local lootedItem = lootedItems[lootedItemIndex]
		if lootedItem[STATUS] ~= STATUS_HIDDEN then
			return lootedItem
		end
	end
	return nil
end

-- Adds the item to the lootedItems array; returns the index of the newly added item
local function AddLootedItem(fullItemInfo, characterName, status)
	local lootedItemIndex = #lootedItems + 1

	lootedItems[lootedItemIndex] = {}
	lootedItems[lootedItemIndex][LOOTER_NAME] = characterName
	lootedItems[lootedItemIndex][FULL_ITEM_INFO] = fullItemInfo
	lootedItems[lootedItemIndex][SELECTED_REQUESTOR_INDEX] = ''
	lootedItems[lootedItemIndex][DEFAULT_REQUESTOR_INDEX] = ''
	lootedItems[lootedItemIndex][REQUESTORS] = {}
	
	if status == nil then
		if IsPlayer(characterName) or IsPLHUser(characterName) then
			lootedItems[lootedItemIndex][STATUS] = STATUS_DEFAULT
		else
			lootedItems[lootedItemIndex][STATUS] = STATUS_AVAILABLE
		end

		if IsPlayer(characterName) then
			PlaySound(600)  -- 'GLUECREATECHARACTERBUTTON'
		else
			PlaySound(888)  -- 'LEVELUP'
		end
	else
		lootedItems[lootedItemIndex][STATUS] = status
	end
	
	return lootedItemIndex
end

local function ShouldAnnounceTrades()
	return PLH_PREFS[PLH_PREFS_ANNOUNCE_TRADES] and InGuildParty() and UnitIsGroupLeader('player')
end

local function shouldAddLootedItem(fullItemInfo)
	return IsEquippableItemForCharacter(fullItemInfo, PLH_GetFullName('player')) and
		((PLH_PREFS[PLH_PREFS_INCLUDE_XMOG] and fullItemInfo[FII_XMOGGABLE]) or IsAnUpgradeForCharacter(fullItemInfo, PLH_GetFullName('player'), PLH_PREFS[PLH_PREFS_ILVL_THRESHOLD]))
end

--[[ FUNCTIONS FOR SENDING ADDON MESSAGES TO OTHER PLAYERS ]]

local function CreateAddonTextString(process, lootedItem, options)
	local lootedItemID = GetLootedItemID(lootedItem)
	local looterName = lootedItem[LOOTER_NAME]
	
	local addonTextString = 
		process ..
		'~' ..
		lootedItemID ..
		'~' ..
		looterName
		
	if options ~= nil then
		addonTextString = addonTextString .. '~' .. options
	end
	
	return addonTextString
end

local function PLH_SendAddonMessage(addonTextString, characterName)
	if IsInGroup() then
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance() then
			C_ChatInfo.SendAddonMessage('PLH', addonTextString, 'INSTANCE_CHAT')
		elseif IsInRaid() then
			C_ChatInfo.SendAddonMessage('PLH', addonTextString, 'RAID')  -- TODO per DBM sendSync() comments this may be going away in 8.x?  Test in beta
		else
			C_ChatInfo.SendAddonMessage('PLH', addonTextString, 'PARTY')
		end
	else
		C_ChatInfo.SendAddonMessage('PLH', addonTextString, 'WHISPER', PLH_GetFullName('player'))  -- for testing purpose
	end
end

--[[ FUNCTIONS FIRED WHEN MESSAGE IS RECEIVED FROM OTHER PLAYERS ]]

function PLH_ProcessKeepItemMessage(looterName, lootedItemID)
	if not IsPlayer(looterName) then
		local lootedItem = GetLootedItem(looterName, lootedItemID)
		if lootedItem ~= nil then
			lootedItem[CONFIRMATION_MESSAGE] = nil
			if lootedItem[STATUS] == STATUS_REQUESTED or lootedItem[STATUS] == STATUS_AVAILABLE then
				lootedItem[STATUS] = STATUS_KEPT
				UpdateLootedItemsDisplay()
			else
				lootedItem[STATUS] = STATUS_HIDDEN
			end
		end
	end
end

-- Event handler for GET_ITEM_INFO_RECEIVED event
local function GetItemInfoReceivedEvent(self, event, ...)
	for item, looterName in pairs(itemCache) do
		if GetItemInfo(item) then
			itemCache[item] = nil
			PLH_ProcessTradeItemMessage(looterName, item)
		end
	end
end

function PLH_ProcessTradeItemMessage(looterName, item)
	if not IsPlayer(looterName) then
		if GetItemInfo(item) == nil then
			-- we need to wait for the item to be loaded into the cache
			itemCache[item] = looterName
		else
			local fullItemInfo = GetFullItemInfo(item)
			if shouldAddLootedItem(fullItemInfo) then
				local lootedItemIndex = AddLootedItem(fullItemInfo, looterName)
				lootedItems[lootedItemIndex][STATUS] = STATUS_AVAILABLE
				UpdateLootedItemsDisplay()
			elseif ShouldAnnounceTrades() then
				AddLootedItem(fullItemInfo, looterName, STATUS_HIDDEN)
			end
		end
	end
end

function PLH_ProcessOfferItemMessage(looterName, lootedItemID, requestorName)
	local lootedItem = GetLootedItem(looterName, lootedItemID)

	if not IsPlayer(looterName) then
		if lootedItem ~= nil then
			lootedItem[CONFIRMATION_MESSAGE] = nil
			if IsPlayer(requestorName) then
				lootedItem[SELECTED_REQUESTOR_INDEX] = 1
				PLH_STATS[PLH_ITEMS_RECEIVED] = PLH_STATS[PLH_ITEMS_RECEIVED] + 1
			end
			if lootedItem[STATUS] == STATUS_REQUESTED or lootedItem[STATUS] == STATUS_AVAILABLE then
				lootedItem[STATUS] = STATUS_OFFERED
				UpdateLootedItemsDisplay()
			else
				lootedItem[STATUS] = STATUS_HIDDEN
			end
		end
	end
	
	if lootedItem ~= nil and ShouldAnnounceTrades() then
		PLH_SendBroadcast(looterName .. ' offered ' .. lootedItem[FULL_ITEM_INFO][FII_ITEM] .. ' to ' .. requestorName, false)
	end
	
end

local function FindRequestorIndex(lootedItem, requestorName)
	local requestors = lootedItem[REQUESTORS]
	local requestor
	
	for i = 1, #requestors do
		requestor = requestors[i]
		if requestor[REQUESTOR_NAME] == requestorName then
			return i
		end
	end
	
	return nil
end

function PLH_ProcessRequestItemMessage(looterName, lootedItemID, requestorName, requestType)
	if IsPlayer(looterName) then
		local lootedItem = GetLootedItem(looterName, lootedItemID)
		if lootedItem ~= nil then
			if lootedItem[STATUS] == STATUS_AVAILABLE or lootedItem[STATUS] == STATUS_REQUESTED then
				local requestorIndex = FindRequestorIndex(lootedItem, requestorName)
				if requestorIndex == nil then
					lootedItem[STATUS] = STATUS_REQUESTED
					lootedItem[CONFIRMATION_MESSAGE] = nil
					
					requestorIndex = #lootedItem[REQUESTORS] + 1
					lootedItem[REQUESTORS][requestorIndex] = {}
					requestor = lootedItem[REQUESTORS][requestorIndex]
					requestor[REQUESTOR_NAME] = requestorName
					requestor[REQUESTOR_ROLL] = math.random(1, 100)
					requestor[REQUESTOR_REQUEST_TYPE] = requestType
					requestor[REQUESTOR_SORT_ORDER] = ''
					
					UpdateLootedItemsDisplay()
				else return
				end
			end
		end
	end
end

local function PLH_ProcessVersionMessage(plhUser, version)
	if plhUsers[plhUser] == nil or plhUsers[plhUser] ~= version then
		plhUsers[plhUser] = version
		if ShouldShowLootedItemsDisplay() then
			UpdateLootedItemsDisplay()
		end
	end
end

local function PLH_ProcessIdentifyUsersMessage()
	PLH_SendAddonMessage('VERSION~ ~' .. PLH_GetFullName('player') .. '~' .. '2.11')
end	

-- Event handler for CHAT_MSG_ADDON event
local function AddonMessageReceivedEvent(self, event, ...)
	local prefix, message, _, sender = ...
	
	if prefix == 'PLH' then
		sender = PLH_GetFullName(sender)
		local process, lootedItemID, looterName, optional = message:match('(.+)~(.+)~(.+)~(.+)')
		if optional == nil then
			process, lootedItemID, looterName = message:match('(.+)~(.+)~(.+)')
		end
		looterName = PLH_GetFullName(looterName)
		
		if process == "KEEP" then
			PLH_ProcessKeepItemMessage(sender, lootedItemID)
		elseif process == "TRADE" then
			PLH_ProcessTradeItemMessage(sender, optional)
		elseif process == "OFFER" then
			PLH_ProcessOfferItemMessage(sender, lootedItemID, optional)
		elseif process == "REQUEST" then
			PLH_ProcessRequestItemMessage(looterName, lootedItemID, sender, optional)
		elseif process == 'VERSION' then
			PLH_ProcessVersionMessage(sender, optional)
		elseif process == 'IDENTIFY_USERS' then
			PLH_ProcessIdentifyUsersMessage()
		end
	end
end	

--[[ FUNCTIONS FIRED WHEN USER CLICKS BUTTON ON THE SCREEN ]]

-- called when the player clicks 'ok' for an item
function PLH_DoHideItem(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]
	lootedItem[STATUS] = STATUS_HIDDEN
	UpdateLootedItemsDisplay()
end

-- called when the player clicks 'keep' for an item
function PLH_DoKeepItem(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]

	if lootedItem[STATUS] ~= STATUS_DEFAULT then
		local addonTextString = CreateAddonTextString("KEEP", lootedItem)
		PLH_SendAddonMessage(addonTextString)
	end

	lootedItem[STATUS] = STATUS_HIDDEN
	UpdateLootedItemsDisplay()
end

function PLH_DoClearConfirmationMessage(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]
	lootedItem[CONFIRMATION_MESSAGE] = nil
	UpdateLootedItemsDisplay()
end

-- called when the player clicks 'offer to group' to put an item up for trade
function PLH_DoTradeItem(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]
	lootedItem[STATUS] = STATUS_AVAILABLE
	if not PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION] then
		lootedItem[CONFIRMATION_MESSAGE] = "Thank you! Other PLH users are being told this item is\navailable. If anyone requests the item, PLH will notify you."
	end
	UpdateLootedItemsDisplay()
	PLH_STATS[PLH_ITEMS_OFFERED] = PLH_STATS[PLH_ITEMS_OFFERED] + 1

	local addonTextString = CreateAddonTextString("TRADE", lootedItem, lootedItem[FULL_ITEM_INFO][FII_ITEM])
	PLH_SendAddonMessage(addonTextString)
end

-- called when the player clicks 'offer' to give an item to a specific player
function PLH_DoOfferItem(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]
	if lootedItem[SELECTED_REQUESTOR_INDEX] == '' then
		lootedItem[SELECTED_REQUESTOR_INDEX] = lootedItem[DEFAULT_REQUESTOR_INDEX]
	end
	local requestorIndex = lootedItem[SELECTED_REQUESTOR_INDEX]
	local requestor = lootedItem[REQUESTORS][requestorIndex]
	lootedItem[STATUS] = STATUS_OFFERED
	UpdateLootedItemsDisplay()
	PLH_STATS[PLH_ITEMS_GIVEN_AWAY] = PLH_STATS[PLH_ITEMS_GIVEN_AWAY] + 1

	local addonTextString = CreateAddonTextString("OFFER", lootedItem, requestor[REQUESTOR_NAME])
	PLH_SendAddonMessage(addonTextString)
end

-- called when the player clicks to request an item that has been looted by another player
function PLH_DoRequestItem(lootedItemIndex, requestType)
	local lootedItem = lootedItems[lootedItemIndex]
	lootedItem[STATUS] = STATUS_REQUESTED
	if not PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION] then
		lootedItem[CONFIRMATION_MESSAGE] = "Your request is being sent to " .. Ambiguate(lootedItem[LOOTER_NAME], 'all') .. ".\nPLH will notify you when they make their decision."
	end
	UpdateLootedItemsDisplay()
	PLH_STATS[PLH_ITEMS_REQUESTED] = PLH_STATS[PLH_ITEMS_REQUESTED] + 1

	local addonTextString = CreateAddonTextString("REQUEST", lootedItem, requestType)
	PLH_SendAddonMessage(addonTextString, lootedItem[LOOTER_NAME])
end

function PLH_DoWhisper(lootedItemIndex)
	local lootedItem = lootedItems[lootedItemIndex]
	lootedItem[STATUS] = STATUS_REQUESTED_VIA_WHISPER
	UpdateLootedItemsDisplay()

	SendChatMessage(PLH_GetWhisperMessage(lootedItem[FULL_ITEM_INFO][FII_ITEM]), 'WHISPER', nil, Ambiguate(lootedItem[LOOTER_NAME], 'mail'))
end

local function ShouldBeEvaluated(fullItemInfo)
	return fullItemInfo[FII_IS_EQUIPPABLE]
		and (fullItemInfo[FII_QUALITY] == LE_ITEM_QUALITY_RARE or fullItemInfo[FII_QUALITY] == LE_ITEM_QUALITY_EPIC)
		and (fullItemInfo[FII_BIND_TYPE] == LE_ITEM_BIND_ON_ACQUIRE or (fullItemInfo[FII_BIND_TYPE] == LE_ITEM_BIND_ON_EQUIP and not PLH_PREFS[PLH_PREFS_NEVER_OFFER_BOE]))
		--and (not fullItemInfo[FII_IS_AZERITE_ITEM])
end		

-- creates a copy of the table
local function ShallowCopy(t)
	local t2 = {}
	for k, v in pairs(t) do
		t2[k] = v
	end
	return t2
end

-- returns the names from the given array, with 'and others' if array size > limit
local function GetNames(namelist, limit)
	local names = ''
	if namelist ~= nil then
		if limit == nil then  -- no limit; show all names
			limit = #namelist
		end
		if namelist[1] ~= nil then
			-- sort the array by ilvl first
			local sortedNamelist = namelist
			if #namelist > 1 then
				local copiedNamelist = ShallowCopy(namelist)  -- we will destroy elements in the list while sorting, so copy it
				sortedNamelist = {}
				local lowestILVL
				local lowestIndex
				local ilvl
				local i = 1
				local size = #copiedNamelist
				while i <= size do
					lowestILVL = 1000000
					lowestIndex = 1  -- we could be sorting a list without ilvls, in which case just keep the same order
					for j = 1, #copiedNamelist do
						if copiedNamelist[j] ~= nil then
							ilvl = string.match(copiedNamelist[j], '(%d+)')
							if ilvl ~= nil then
								ilvl = tonumber(ilvl)
								if ilvl < lowestILVL then
									lowestILVL = ilvl
									lowestIndex = j
								end
							end
						end
					end
					table.insert(sortedNamelist, table.remove(copiedNamelist, lowestIndex))
					i = i + 1
				end
			end
		
			names = sortedNamelist[1]
			local maxnames = min(#sortedNamelist, limit)
			for i = 2, maxnames do
				if #sortedNamelist == 2 then
					names = names .. ' '
				else
					names = names .. ', '
				end
				if i == #sortedNamelist then -- last person
					names = names .. '& '
				end
				names = names .. sortedNamelist[i]
			end
			if #sortedNamelist > limit then
				names = names .. ' & ...'
			end
		end
	end
	return names
end

-- Checks whether or not the loot items should be added to the lootedItems array; adds item if it meets the criteria
local function PerformNotify(fullItemInfo, looterName)
	if ShouldBeEvaluated(fullItemInfo) then
		if IsPlayer(looterName) then
--			local isTradeable = fullItemInfo[FII_TRADE_TIME_WARNING_SHOWN] or not IsAnUpgradeForCharacter(fullItemInfo, looterName)
			local isTradeable = not IsAnUpgradeForCharacter(fullItemInfo, looterName, 0, true)
			if isTradeable then

				local isAnUpgradeForAnyCharacter, isAnUpgradeForAnyCharacterNames = IsAnUpgradeForAnyCharacter(fullItemInfo)

				if PLH_GetNumberOfPLHUsers() > 1 then
					if not PLH_PREFS[PLH_PREFS_ONLY_OFFER_IF_UPGRADE] or isAnUpgradeForAnyCharacter then
						AddLootedItem(fullItemInfo, looterName)
						UpdateLootedItemsDisplay()
					end
				end
				if PLH_PREFS[PLH_PREFS_SHOW_TRADEABLE_ALERT] then
					if isAnUpgradeForAnyCharacter then
						local names = GetNames(isAnUpgradeForAnyCharacterNames, 5)
						PLH_SendAlert('^-^ ' .. fullItemInfo[FII_ITEM] .. ' → ' .. names)
						PlaySound(600)  -- 'GLUECREATECHARACTERBUTTON'
					end
				end			
			end
		elseif not IsPLHUser(looterName) and fullItemInfo[FII_BIND_TYPE] ~= LE_ITEM_BIND_ON_EQUIP and not IsAnUpgradeForCharacter(fullItemInfo, looterName, 0, true) then
			if shouldAddLootedItem(fullItemInfo) then
				AddLootedItem(fullItemInfo, looterName)
				UpdateLootedItemsDisplay()
			elseif ShouldAnnounceTrades() then
				AddLootedItem(fullItemInfo, looterName, STATUS_HIDDEN)
			end
		end
	end
end

-- Event handler for CHAT_MSG_LOOT event
local function LootReceivedEvent(self, event, ...)
	local LOOT_ITEM_SELF_PATTERN 			= _G.LOOT_ITEM_SELF:gsub('%%s', '(.+)')				-- You receive loot: (.+)
	local LOOT_ITEM_PATTERN					= _G.LOOT_ITEM:gsub('%%s', '(.+)')					-- (.+) receives loot: (.+)
	
	local message, _, _, _, looter = ...
	local lootedItem = message:match(LOOT_ITEM_SELF_PATTERN)
	if lootedItem == nil then
		_, lootedItem = message:match(LOOT_ITEM_PATTERN)
	end

	if lootedItem then
		local fullItemInfo = GetFullItemInfo(lootedItem)
		PerformNotify(fullItemInfo, PLH_GetFullName(looter))
	end
end	

--[[ FUNCTIONS FOR POPULATING GROUPINFOCACHE ]]

local function GetExpectedItemCount(spec)
	if SPECS_EXPECTED_TO_HAVE_OFFHAND[spec] then
		return 16
	else
		return 15
	end
end

-- only returns count of equippable items from cache; excludes other cached info such as ClassName/Spec/Level
local function GetItemCountFromCache(name)
	local itemCount = 0
	if name ~= nil and groupInfoCache[name] ~= nil then
		for slotID, item in pairs(groupInfoCache[name]) do
			itemCount = itemCount + 1
		end
		itemCount = itemCount - 4 -- subtract 4 since everyone has CLASS_NAME, SPEC, LEVEL, and FORCE_REFRESH elements
	end
	return itemCount
end

-- The following uses GetInventoryItemLink() to look up unit's equipped items.
-- That method can only be called within the scope of an INSPECT_READY event.
local function UpdateGroupInfoCache(unit)
	local name = PLH_GetFullName(unit)

	if name ~= nil then
		local characterDetails
		if groupInfoCache[name] == nil then
			characterDetails = {}
			local _, class = UnitClass(unit)
			characterDetails[CLASS_NAME] = class
			local spec = GetInspectSpecialization(unit)
			characterDetails[SPEC] = spec
			local level = UnitLevel(unit)
			characterDetails[LEVEL] = level
			characterDetails[FORCE_REFRESH] = false
		else
			characterDetails = groupInfoCache[name]
		end
		
		local updatedItemCount = 0
		local item
		for invslot = _G.INVSLOT_FIRST_EQUIPPED, _G.INVSLOT_LAST_EQUIPPED do
			if invslot ~= _G.INVSLOT_BODY and invslot ~= INVSLOT_TABARD then -- ignore shirt and tabard slots
				if unit ~= nil then
					item = GetInventoryItemLink(UnitName(unit), invslot)
					if item ~= nil and GetItemInfo(item) ~= nil then
						if characterDetails[invslot] == nil or characterDetails[invslot] ~= item then
							updatedItemCount = updatedItemCount + 1
	--						characterDetails[invslot] = GetFullItemInfo(item)
							characterDetails[invslot] = item
						end
					end
				end
			end
		end

		if updatedItemCount > 0 or groupInfoCache[name] == nil then
			groupInfoCache[name] = characterDetails
		end
		
		if groupInfoCache[name][FORCE_REFRESH] == true then
			groupInfoCache[name][FORCE_REFRESH] = false
		end
	end
end

-- returns true if the characterName is in the raid/party
local function IsCharacterInGroup(characterName)
	local index = 1
	local name = select(1, GetRaidRosterInfo(index))
	while name ~= nil do
		if name == characterName or PLH_GetFullName(name) == characterName then
			return true
		end
		index = index + 1
		name = select(1, GetRaidRosterInfo(index))
	end
	return false
end

local function InspectReadyEvent(self, event, ...)
	local guid = select(1, ...)
	local name = select(6, GetPlayerInfoByGUID(guid))
	if notifyInspectName ~= nil and (notifyInspectName == name or notifyInspectName == PLH_GetFullName(name)) then
		UpdateGroupInfoCache(name)
		if not InspectFrame or not InspectFrame:IsShown() then
			ClearInspectPlayer()
		end
		notifyInspectName = nil
		
		if PLH_PreemptWait(PLH_WAIT_FOR_INSPECT) then
			PLH_wait(PLH_WAIT_FOR_INSPECT, DELAY_BETWEEN_INSPECTIONS_SHORT, PLH_InspectNextGroupMember)
		end
	end
end

-- Attempt to queue a group member for inspection.  Returns true if we were able to queue an inspection, false otherwise
local function InspectGroupMember(characterName)
	if characterName ~= nil and not IsPlayer(characterName) then   -- no need to inspect ourselves
		if CanInspect(characterName) and (not InspectFrame or not InspectFrame:IsShown()) then
			notifyInspectName = characterName
			NotifyInspect(characterName)
			PLH_wait(PLH_WAIT_FOR_INSPECT, DELAY_BETWEEN_INSPECTIONS_LONG, PLH_InspectNextGroupMember)
			return true
		else
		end
	end
	return false
end

function PLH_InspectNextGroupMember()
	local characterName
	local queuedAnInspection = false
	local spec

	notifyInspectName = nil

	while inspectIndex <= maxInspectIndex  and not queuedAnInspection do
		characterName = select(1, GetRaidRosterInfo(inspectIndex))
		if characterName ~= nil then	-- safeguard; character may have left the roster between the time we started the call and now
			local fullname = PLH_GetFullName(characterName)	-- characterName may or may not have realm.  we want to preserve it the way it is for the call to InspectGroupMember,
															--    but need the name-realm version of the name to look up the element in the cache
			if fullname ~= nil then
				if groupInfoCache[fullname] ~= nil then
					spec = groupInfoCache[fullname][SPEC]
				end

				if GetItemCountFromCache(fullname) < GetExpectedItemCount(spec) or groupInfoCache[fullname][FORCE_REFRESH] then  -- if we've already cached 15 or more items, don't bother refreshing
					queuedAnInspection = InspectGroupMember(characterName)
				end
			end
		end
		inspectIndex = inspectIndex + 1
	end
	
	if inspectIndex > maxInspectIndex then				-- that means we just completed our current loop
		inspectLoop = inspectLoop + 1
		if inspectLoop <= MAX_INSPECT_LOOPS then		-- let's start the next loop
			inspectIndex = 1
			if not queuedAnInspection then				-- if we just queued someone for inspection, we don't need to do anything else to start the new loop since InspectGroupMember will call PLH_InspectNextGroupMember()
				PLH_InspectNextGroupMember()
			end
		--elseif not queuedAnInspection then				-- we've finished all loops
			--PLH_PrintCache()
		end
	end
	
end

local function PopulateGroupInfoCache()
	local now = time()
	
	if now - priorCacheRefreshTime > MIN_DELAY_BETWEEN_CACHE_REFRESHES then
		priorCacheRefreshTime = now
	
		-- remove characters from the cache if they're no long in the raid/party
		for name, details in pairs(groupInfoCache) do
			if not IsCharacterInGroup(name) then
				groupInfoCache[name] = nil
			end
		end

		if IsInGroup() then
			if inspectLoop == 0 or (inspectIndex > maxInspectIndex and inspectLoop > MAX_INSPECT_LOOPS) then
				inspectLoop = 1
				inspectIndex = 1
				maxInspectIndex = GetNumGroupMembers()
				PLH_InspectNextGroupMember()
			end
		end
	end
end

-- Event handler for PLAYER_SPECIALIZATION_CHANGED and UNIT_INVENTORY_CHANGED events
local function GroupMemberInfoChangedEvent(self, event, ...)
	local unit = ...
	local name = PLH_GetFullName(unit)
	if name ~= nil then
		if groupInfoCache[name] ~= nil then
			groupInfoCache[name][FORCE_REFRESH] = true
			PopulateGroupInfoCache()
		elseif IsPlayer(name) then
			LoadPlayerItems()
		end
	end
end

-- Event handler for PLAYER_REGEN_DISABLED event - triggered when the player enters combat, which is a good time
--    to refresh the cache since the people who will be eligible for loot should be close enough to be inspected
local function CombatStatusChangedEvent(self, event, ...)
	PopulateGroupInfoCache()
end

local function Enable()
	isEnabled = true
	priorCacheRefreshTime = 0
	groupInfoCache = {}
	eventHandlerFrame:RegisterEvent('CHAT_MSG_LOOT')
--	eventHandlerFrame:RegisterEvent('SHOW_LOOT_TOAST')
	eventHandlerFrame:RegisterEvent('CHAT_MSG_ADDON')
	eventHandlerFrame:RegisterEvent('INSPECT_READY')
	eventHandlerFrame:RegisterEvent('PLAYER_REGEN_DISABLED')   -- player entered combat
	eventHandlerFrame:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
	eventHandlerFrame:RegisterEvent('UNIT_INVENTORY_CHANGED')
	eventHandlerFrame:RegisterEvent('GET_ITEM_INFO_RECEIVED')

	LoadPlayerItems()
	
	PLH_SendAddonMessage('IDENTIFY_USERS~ ~' .. PLH_GetFullName('player'))
end

local function Disable()
	isEnabled = false
	priorCacheRefreshTime = 0
	groupInfoCache = {}
	eventHandlerFrame:UnregisterAllEvents()
end


local function EnableOrDisable()
	local inInstance, instanceType = IsInInstance()
	local isPersonalLoot = (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or (IsInGroup() and GetLootMethod() == 'personalloot'))
		and (instanceType == "party" or instanceType == "raid")
	local shouldBeEnabled = isPersonalLoot

	if not isEnabled and shouldBeEnabled then	
		Enable()
	elseif isEnabled and shouldBeEnabled then	
		PLH_ProcessIdentifyUsersMessage()
	elseif isEnabled and not shouldBeEnabled then
		Disable()
	end
	
	if isEnabled then 
		PopulateGroupInfoCache()
	end
end

-- Event handler for GROUP_ROSTER_UPDATE, ZONE_CHANGED_NEW_AREA, and PLAYER_ENTERING_WORLD events
local function EnableOrDisableEvent(self, event, ...)
	PLH_wait(PLH_WAIT_FOR_ENABLE_OR_DISABLE, 2, EnableOrDisable)
end

-- Event handler for ADDON_LOADED event
local function AddonLoadedEvent(self, event, ...)
		eventHandlerFrame:UnregisterEvent('ADDON_LOADED')

		if PLH_STATS == nil then
			PLH_STATS = {}
		end
		if PLH_META == nil then
			PLH_META = {}
		end
		if PLH_PREFS == nil then
			PLH_PREFS = {}
		end

		for key, value in pairs(PLH_DEFAULT_PREFS) do
			if PLH_PREFS[key] == nil or PLH_PREFS[key] == '' then
				PLH_PREFS[key] = value
			end
		end

		if PLH_STATS[PLH_ITEMS_REQUESTED] == nil then
			PLH_STATS[PLH_ITEMS_REQUESTED] = 0
		end
		if PLH_STATS[PLH_ITEMS_RECEIVED] == nil then
			PLH_STATS[PLH_ITEMS_RECEIVED] = 0
		end
		if PLH_STATS[PLH_ITEMS_OFFERED] == nil then
			PLH_STATS[PLH_ITEMS_OFFERED] = 0
		end
		if PLH_STATS[PLH_ITEMS_GIVEN_AWAY] == nil then
			PLH_STATS[PLH_ITEMS_GIVEN_AWAY] = 0
		end
		
		if enableOrDisableEventFrame == nil then
			enableOrDisableEventFrame = CreateFrame('Frame')
			enableOrDisableEventFrame:SetScript('OnEvent', EnableOrDisableEvent)
			enableOrDisableEventFrame:RegisterEvent('GROUP_ROSTER_UPDATE')
			enableOrDisableEventFrame:RegisterEvent('ZONE_CHANGED_NEW_AREA')
			enableOrDisableEventFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
		end
		
		C_ChatInfo.RegisterAddonMessagePrefix('PLH')

		CreateLootedItemsDisplay()
		PLH_CreateOptionsPanel()		
end

local function ProcessEvent(self, event, ...)
	if event == 'ADDON_LOADED' then
		AddonLoadedEvent(self, event, ...)
--	elseif event == 'CHAT_MSG_LOOT' or event == 'SHOW_LOOT_TOAST' then
	elseif event == 'CHAT_MSG_LOOT' then
		LootReceivedEvent(self, event, ...)
	elseif event == 'CHAT_MSG_ADDON' then
		AddonMessageReceivedEvent(self, event, ...)
	elseif event == 'INSPECT_READY' then
		InspectReadyEvent(self, event, ...)
	elseif event == 'PLAYER_REGEN_DISABLED' then
		CombatStatusChangedEvent(self, event, ...)
	elseif event == 'PLAYER_SPECIALIZATION_CHANGED' or event == 'UNIT_INVENTORY_CHANGED' then
		GroupMemberInfoChangedEvent(self, event, ...)
	elseif event == 'GET_ITEM_INFO_RECEIVED' then
		GetItemInfoReceivedEvent(self, event, ...)
	end
end

function SlashCmdList.PLHCommand(msg)
	if msg == nil or msg == '' or string.upper(msg) == 'CONFIG' then
		InterfaceOptionsFrame_OpenToCategory(PLH_LONG_ADDON_NAME)
		--InterfaceOptionsFrame_OpenToCategory(PLH_LONG_ADDON_NAME)  -- hack; called twice to get around Blizz bug of it not opening to correct page right away
	elseif string.upper(msg) == 'SHOW' then
		lootedItemsFrame:Show()
	elseif string.upper(msg) == 'HIDE' then
		lootedItemsFrame:Hide()
	elseif string.sub(string.upper(msg), 1, 5) == 'TRADE' or string.sub(string.upper(msg), 1, 5) == 'OFFER' then
		local itemInfo = nil
		local itemLink = string.match(string.sub(msg, 6), ' (.+)')
		if itemLink ~= nil then
			itemInfo = GetItemInfo(itemLink)  -- check to see if it's a properly formatted item link
		end
		if itemInfo ~= nil then
			local lootedItemIndex = AddLootedItem(GetFullItemInfo(itemLink), PLH_GetFullName('player'))
			PLH_DoTradeItem(lootedItemIndex)
			if PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION] then  -- show confirmation as chat since they won't see it in window
				PLH_SendUserMessage("Thank you! Other PLH users have been notified that " .. itemLink .. " is available.")
			end
		else
			PLH_SendUserMessage("Usage:  /plh trade [item]")
		end
	else
		PLH_SendUserMessage("Unknown parameter. Options are:\n" ..
			"/plh  :  open interface options\n" ..
			"/plh show  :  show loot window\n" ..
			"/plh hide  :  hide loot window\n" ..
			"/plh offer [item]  :  offer [item] to other PLH users in the group"
		)
	end
end

eventHandlerFrame = CreateFrame('Frame')
eventHandlerFrame:SetScript('OnEvent', ProcessEvent)
eventHandlerFrame:RegisterEvent('ADDON_LOADED')