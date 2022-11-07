-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, MistsOfPandaria = ...
local L = MistsOfPandaria.locale

local Group = MistsOfPandaria.Group

local Class = MistsOfPandaria.Class
local Collectible = MistsOfPandaria.node.Collectible

-------------------------------------------------------------------------------

MistsOfPandaria.expansion = 5

local Squirrel = Class('Squirrel', Collectible, {
    group = MistsOfPandaria.groups.SQUIRRELS,
    icon = 237182,
    note = L['squirrels_note']
})
MistsOfPandaria.groups.SQUIRRELS = Group('squirrels', 237182, {defaults = MistsOfPandaria.GROUP_HIDDEN})
MistsOfPandaria.node.Squirrel = Squirrel

local Lorewalker = Class('Lorewalker', Collectible,
    {icon = 645218, group = MistsOfPandaria.groups.LOREWALKER})
MistsOfPandaria.groups.LOREWALKER = Group('lorewalker', 645218)
MistsOfPandaria.node.Lorewalker = Lorewalker

MistsOfPandaria.groups.KROSHIK = Group('kroshik', 458255)
