---
--- @file
--- Localization file for Warlords of Draenor in enUS language.
---

local NAME, this = ...

-- We add true as last parameter, since this is default language.
local t = this.AceLocale:NewLocale(NAME, 'enUS', true)

if not t then
  return
end

-- Gorgrond
t['attack_plans_title'] = 'Iron Horde Attack Orders'
t['ninja_pepe_title'] = 'Ninja Pepe'
t['ninja_pepe_note'] = 'Inside the hut sitting on a chair.'
t['multiple_spawn_plans'] = 'This book can spawn in multiple locations.'
t['attack_plans_tracks'] = 'On the broken train tracks.'
t['attack_plans_crane'] = 'On top of the crane.'
t['attack_plans_tower'] = 'On top of the tower.'
t['pile_of_rubble_treasure'] = 'Pile of Rubble'

-- Spires of Arak
t['pirate_pepe_title'] = 'Pirate Pepe'
t['pirate_pepe_note'] = 'On a rock in the corner.'

-- Talador
t['knight_pepe_title'] = 'Knight Pepe'
t['knight_pepe_note'] = 'In a tent near some NPCs.'

-- Nagrand
t['viking_pepe_title'] = 'Viking Pepe'
t['viking_pepe_note'] = 'On a box.'
