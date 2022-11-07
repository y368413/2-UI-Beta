-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, Dragonflight = ...
local L = Dragonflight.locale

local Class = Dragonflight.Class
local Group = Dragonflight.Group

local Collectible = Dragonflight.node.Collectible
local Node = Dragonflight.node.Node

local Achievement = Dragonflight.reward.Achievement
local Currency = Dragonflight.reward.Currency
local Item = Dragonflight.reward.Item
local Transmog = Dragonflight.reward.Transmog

-------------------------------------------------------------------------------

Dragonflight.expansion = 10

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

Dragonflight.groups.DRAGON_GLYPH = Group('dragon_glyph', 4728198)
Dragonflight.groups.DISTURBED_DIRT = Group('disturbed_dirt', 1060570,
    {defaults = Dragonflight.GROUP_HIDDEN})
Dragonflight.groups.SCOUT_PACK =
    Group('scout_pack', 4562583, {defaults = Dragonflight.GROUP_HIDDEN})
Dragonflight.groups.FLAG = Group('flag', 1723999, {defaults = Dragonflight.GROUP_HIDDEN})
Dragonflight.groups.KITE = Group('kite', 133837, {defaults = Dragonflight.GROUP_HIDDEN})

-------------------------------------------------------------------------------
-------------------------------- DRAGON GLYPHS --------------------------------
-------------------------------------------------------------------------------

local Dragonglyph = Class('Dragonglyph', Collectible, {
    icon = 4728198,
    label = L['dragon_glyph'],
    group = Dragonflight.groups.DRAGON_GLYPH
})

Dragonflight.node.Dragonglyph = Dragonglyph

-------------------------------------------------------------------------------
------------------ DRAGONSCALE EXPEDITION: THE HIGHEST PEAKS ------------------
-------------------------------------------------------------------------------

local Flag = Class('Flag', Collectible, {
    icon = 1723999,
    label = L['dragonscale_expedition_flag'], -- Dragonscale Expedition Flag
    rlabel = Dragonflight.status.LightBlue('+300 ' .. select(1, GetFactionInfoByID(2507))), -- Dragonscale Expedition
    group = Dragonflight.groups.FLAG,
    requires = Dragonflight.requirement.GarrisonTalent(2164), -- Cartographer Flag
    rewards = {
        Achievement({
            id = 15890,
            criteria = {id = 1, qty = true, suffix = L['flags_placed']}
        })
    }
})

Dragonflight.node.Flag = Flag

-------------------------------------------------------------------------------
------------------------------- DISTURBED DIRT --------------------------------
-------------------------------------------------------------------------------

local Disturbeddirt = Class('Disturbed_dirt', Node, {
    icon = 1060570,
    label = L['disturbed_dirt'],
    group = Dragonflight.groups.DISTURBED_DIRT,
    requires = {
        Dragonflight.requirement.Quest(70813), -- Digging Up Treasure
        Dragonflight.requirement.Item(191294) -- Small Expedition Shovel
    },
    rewards = {
        Transmog({item = 201386, slot = L['cosmetic']}), -- Drakonid Defender's Pike
        Item({item = 190453}), -- Spark of Ingenuity
        Item({item = 190454}), -- Primal Chaos
        Item({item = 192055}), -- Dragon Isles Artifact
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

Dragonflight.node.Disturbeddirt = Disturbeddirt

-------------------------------------------------------------------------------
-------------------------- EXPEDITION SCOUT'S PACKS ---------------------------
-------------------------------------------------------------------------------

local Scoutpack = Class('Scoutpack', Node, {
    icon = 4562583,
    label = L['scout_pack'],
    group = Dragonflight.groups.SCOUT_PACK,
    requires = Dragonflight.requirement.Quest(70822), -- Lost Expedition Scouts
    rewards = {
        Transmog({item = 201387, slot = L['cosmetic']}), -- Dragon Knight's Halberd
        Transmog({item = 201390, slot = L['cosmetic']}), -- Dracthyr's Devastating Waraxe
        Transmog({item = 201392, slot = L['cosmetic']}), -- Dragon Noble's Cutlass
        Transmog({item = 201395, slot = L['cosmetic']}), -- Dragon Wingcrest Scimitar
        Transmog({item = 201396, slot = L['cosmetic']}), -- Dracthyr Claw Extensions
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Item({item = 190454}), -- Primal Chaos
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 192055}), -- Dragon Isles Artifact
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

Dragonflight.node.Scoutpack = Scoutpack
