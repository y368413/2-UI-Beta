-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, WarlordsOfDraenor = ...
local Group = WarlordsOfDraenor.Group
local L = WarlordsOfDraenor.locale
local Class = WarlordsOfDraenor.Class

local Collectible = WarlordsOfDraenor.node.Collectible

-------------------------------------------------------------------------------

WarlordsOfDraenor.expansion = 6

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

WarlordsOfDraenor.groups.ANCIENT_NO_MORE = Group('ancient_no_more', 874578,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.ARCHAEOLOGY_TREASURE = Group('archaeology_treasure', 'chest_bn',
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.ATTACK_PLANS = Group('attack_plans', 'chest_pp',
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN75})
WarlordsOfDraenor.groups.BREAKER_OF_CHAINS = Group('breaker_of_chains', 1035046,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.BROKE_BACK_PRECIPICE = Group('broke_back_precipice', 1016245,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.BURIED_TREASURES = Group('buried_treasures', 134436,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.CUT_OFF_THE_HEAD = Group('cut_off_the_head', 311945,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.DELECTABLE_OGRE_DELICACIES = Group('delectable_ogre_delicacies',
    236571, {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.FIGHT_THE_POWER = Group('fight_the_power', 1042626,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.FINDING_YOUR_WAYSTONES = Group('finding_your_waystones', 528693,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.KING_OF_THE_MONSTERS = Group('king_of_the_monsters', 236192,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.MAKING_THE_CUT = Group('making_the_cut', 458732,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.OFFERING = Group('offering', 'chest_gn', {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.PEPE = Group('pepe', 1044996, {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.PROVE_YOUR_STRENGTH = Group('prove_your_strength', 975743,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.SHRINES_OF_TEROKK = Group('shrines_of_terokk', 'chest_pk',
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.SONG_OF_SILENCE = Group('song_of_silence', 136005,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.STEAMWHEEDLE = Group('steamwheedle', 463874,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.THE_STABLE_MASTER = Group('the_stable_master', 975744,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.WINGMEN = Group('wingmen', 132917, {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.WOULD_YOU_LIKE_A_PAMPLET = Group('would_you_like_a_pamplet', 441147,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.WRITING_IN_THE_SNOW = Group('writing_in_the_snow', 133680,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.YOU_HAVE_BEEN_RYLAKINATED = Group('you_have_been_rylakinated', 894222,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.SQUIRRELS = Group('squirrels', 237182, {defaults = WarlordsOfDraenor.GROUP_HIDDEN})
WarlordsOfDraenor.groups.GARRFOLLOWER = Group('GarrFollower', 1033590,
    {defaults = WarlordsOfDraenor.GROUP_HIDDEN})

-------------------------------------------------------------------------------
---------------------------- Squirrel Achievement -----------------------------
-------------------------------------------------------------------------------

WarlordsOfDraenor.node.Squirrel = Class('Squirrel', Collectible, {
    group = WarlordsOfDraenor.groups.SQUIRRELS,
    icon = 237182,
    note = L['squirrels_note']
})
