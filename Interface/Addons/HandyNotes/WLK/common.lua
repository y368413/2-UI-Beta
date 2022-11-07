-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, WrathOfTheLichKing = ...
local L = WrathOfTheLichKing.locale

local Class = WrathOfTheLichKing.Class
local Group = WrathOfTheLichKing.Group

local Collectible = WrathOfTheLichKing.node.Collectible

-------------------------------------------------------------------------------

WrathOfTheLichKing.expansion = 3

local Squirrel = Class('Squirrel', Collectible, {
    group = WrathOfTheLichKing.groups.SQUIRRELS,
    icon = 237182,
    note = L['squirrels_note']
})
WrathOfTheLichKing.node.Squirrel = Squirrel

WrathOfTheLichKing.groups.SQUIRRELS = Group('squirrels', 237182, {defaults = WrathOfTheLichKing.GROUP_HIDDEN})
