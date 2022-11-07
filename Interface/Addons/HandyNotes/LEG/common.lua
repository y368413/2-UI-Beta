-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, Legion = ...
local Group = Legion.Group

-------------------------------------------------------------------------------

Legion.expansion = 7

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

Legion.groups.LEGION_WAR_SUPPLIES = Group('legion_war_supplies', 'chest_bk',
    {defaults = Legion.GROUP_HIDDEN75})
Legion.groups.EREDAR_WAR_SUPPLIES = Group('eredar_war_supplies', 'chest_bk',
    {defaults = Legion.GROUP_HIDDEN75})
Legion.groups.ANCIENT_EREDAR_CACHE = Group('ancient_eredar_cache', 'chest_bk',
    {defaults = Legion.GROUP_HIDDEN75})
Legion.groups.VOID_SEEPED_CACHE = Group('void_seeped_cache', 'chest_bk',
    {defaults = Legion.GROUP_HIDDEN75})
Legion.groups.BRINGING_HOME_THE_BEACON = Group('bringing_home_the_beacon', 133267,
    {defaults = Legion.GROUP_HIDDEN})
Legion.groups.HIGHER_DIMENSIONAL_LEARNING = Group('higher_dimensional_learning',
    134915, {defaults = Legion.GROUP_HIDDEN})
