---
--- @file
--- Localization file for Warlords of Draenor in enUS language.
---

local NAME, this = ...
local Text = this.Text

-- We add true as last parameter, since this is default language.
local t = this.AceLocale:NewLocale(NAME, 'enUS', true)

if not t then
  return
end

-- Warlords of Draenor
t['in_cave'] = 'In a cave.'
t['multiple_spawn_note'] = 'Can spawn in multiple locations.'
t['strange_spore_treasure'] = 'Strange Spore'
t['edge_of_reality'] = 'Edge of Reality'
t['edge_of_reality_note'] = 'This portal will take you to a scenario, where you can loot [item(121815)].'

-- Gorgrond
t['poundfist_note'] = 'Has really long respawn between 50 and 90 hours.'
t['trophy_of_glory_note'] = 'You must finish building up your Gorgrond Garrison Outpost to get quest items to drop.'
t['roardan_sky_terror_note'] = 'Flies around Tangleheart and Beastwatch and makes 3 stops on the way.'

t['odd_skull_treasure'] = 'Odd Skull'
t['pile_of_rubble_treasure'] = 'Pile of Rubble'
t['remains_of_balik_orecrusher_treasure'] = 'Remains of Balik Orecrusher'
t['explorer_canister_treasure'] = 'Explorer Canister'
t['discarded_pack_treasure'] = 'Discarded Pack'
t['iron_supply_chest_treasure'] = 'Iron Supply Chest'
t['horned_skull_treasure'] = 'Horned Skull'
t['evermorn_supply_cache_treasure'] = 'Evermorn Supply Cache'
t['harvestable_precious_crystal_treasure'] = 'Harvestable Precious Crystal'
t['femur_of_improbability_treasure'] = 'Femur of Improbability'
t['laughing_skull_cache_treasure'] = 'Laughing Skull Cache'
t['laughing_skull_note'] = 'Up in the tree.'
t['stashed_emergency_rucksack_treasure'] = 'Stashed Emergency Rucksack'
t['strange_looking_dagger_treasure'] = 'Strange Looking Dagger'
t['suntouched_spear_treasure'] = 'Suntouched Spear'
t['warm_goren_egg_treasure'] = 'Warm Goren Egg'
t['warm_goren_egg_note'] = '[item(118705)] incubates in 7 days into [item(118716)].'
t['weapons_cache_treasure'] = 'Weapons Cache'
t['remains_if_balldir_deeprock_treasure'] = 'Remains of Balldir Deeprock'
t['petrified_rylak_egg_treasure'] = 'Petrified Rylak Egg'
t['ockbars_pack_treasure'] = "Ockbar's Pack"
t['sashas_secret_stash_treasure'] = "Sasha's Secret Stash"
t['vindicators_hammer_treasure'] = "Vindicator's Hammer"
t['brokors_sack_treasure'] = "Brokor's Sack"
t['snipers_crossbow_trerasure'] = "Sniper's Crossbow"

t['ninja_pepe_title'] = 'Ninja Pepe'
t['ninja_pepe_note'] = 'Inside the hut sitting on a chair.'
t['attack_plans_title'] = 'Iron Horde Attack Orders'
t['multiple_spawn_plans'] = 'This book can spawn in multiple locations.'
t['attack_plans_tracks'] = 'On the broken train tracks.'
t['attack_plans_crane'] = 'On top of the crane.'
t['attack_plans_tower'] = 'On top of the tower.'

-- Spires of Arak
t['pirate_pepe_title'] = 'Pirate Pepe'
t['pirate_pepe_note'] = 'On a rock in the corner.'
t['gaze_note'] = 'You must click of Fel Grimoire in the middle of the hut to spawn him.'
t['sunderthorn_note'] = 'Kill several [npc(84905)] and [npc(84909)] until message ' .. Text:color('"Sunderthorn descends from the treetops to protect her hive!"', 'white') .. 'appears and she spawns.'
t['sangrikass_note'] = 'Use [npc(84821)] and kill 4 [npc(84820)] to spawn it.'

-- Talador
t['knight_pepe_title'] = 'Knight Pepe'
t['knight_pepe_note'] = 'In a tent near some NPCs.'
t['wandering_vindicator_note'] = 'After defeating him, you need to loot his sword from the stone.'
t['legion_vanguard_note'] = '[npc(88494)] is summoned from portal. Kill [npc(83023)] around portal and any other, that comes out to summon him.'
t['taladorantula_note'] = 'Squish eggs sacks and kill [npc(75258)] around to summon [npc(77634)]. Takes around 3 to 5 minutes of squishing.'
t['shirzir_note'] = 'In underground tomb.'
t['kharazos_galzomar_sikthiss_note'] = '[npc(78710)], [npc(78713)] and [npc(78715)] share the same drop, spawn and path.'
t['orumo_the_observer_note'] = [[
[npc(87668)] requires 5 people standing on runes before him to be able to kill him.

Alternatively, Warlocks can use [spell(48020)] and Monks [spell(119996)] to teleport on runes, which decreases number of required people to 3.

Another option is to use 5 of your own characters, move them one by one to runes and logout them there.

Last option is to use only one character. Go to rune, lit it up, teleport out and repeat for each rune. Best way is to set up [item(6948)] somewhere close.

You can combine any of methods above to summon [npc(87668)].
]]

-- Nagrand
t['viking_pepe_title'] = 'Viking Pepe'
t['viking_pepe_note'] = 'On a box.'

-- Tannan Jungle
t['deathtalon_note'] = Text:color('*Shadow Lord Iskar yells: Behind the veil, all you find is death!*', 'red')
t['doomroller_note'] = Text:color("*Siegemaster Mar'tak yells: Hah-ha! Trample their corpses!*", 'red')
t['terrorfist_note'] = Text:color('*Frogan yells: A massive gronnling is heading for Rangari Refuge! We are going to require some assistance!*', 'red')
t['vengeance_note'] = Text:color('*Tyrant Velhari yells: Insects deserve to be crushed!*', 'red')
t['iron_armada_note'] = 'This toy is also buyable on AH and is required for [achievement(10353)].'
t['commander_kraggoth_note'] = 'At the top of the north-east tower.'
t['grannok_note'] = 'At the top of the south-east tower.'
t['szirek_the_twisted_note'] = 'Capture the East Strongpoint to summon this rare.'
t['the_iron_houndmaster_note'] = 'Capture the West Strongpoint to summon this rare.'
t['belgork_thromma_note'] = 'This cave has 2 entrances.'
t['driss_vile_note'] = 'On top of the tower.'
t['overlord_magruth_note'] = 'Kill orcs around camp to spawn it.'
t['mistress_thavra_note'] = 'In a cave on upper floor.'
t['dorg_the_bloody_note'] = 'Kill [npc(89706)] and other enemies at spawn location.'
t['grand_warlock_netherkurse_note'] = 'Kill enemies around spawn point.'
t['ceraxas_note'] = 'Spawns [npc(90426)] with quest [quest(38428)] for pet after killing it.'
t['commander_orgmok_note'] = 'Rides around on [npc(89676)].'
t['rendrak_note'] = 'Collect 10 [item(124045)] from [npc(89788)] around bog. Combine them to summon rare.'
t['akrrilo_note'] = 'Buy [item(124093)] from [npc(92805)] and use it at Blackfang Challenge Arena.'
t['rendarr_note'] = 'Buy [item(124094)] from [npc(92805)] and use it at Blackfang Challenge Arena.'
t['eyepiercer_note'] = 'Buy [item(124095)] from [npc(92805)] and use it at Blackfang Challenge Arena.'
t['the_night_haunter_note'] = [[
Collect 10 stacks of [spell(183612)] debuff.

You can get debuff by using [npc(92651)] or by finding [npc(92645)] (100% chance).
]]
t['xemirkol_note'] = [[
Buy [item(128502)] or [item(128503)] from [npc(95424)] and use it at spawn point to get teleported to [npc(96235)].

Crystals teleport you to random rare in vicinity, so best chance is to kill [npc(92887)] and use [item(128502)].

[npc(96235)] has long respawn timer (around a day) and best way to get it is after realm restart or by using server jump.
]]

t['discarded_helm_treasure'] = 'Discarded Helm'
t['weathered_axe_treasure'] = 'Weathered Axe'
t['axe_of_the_weeping_wolf_treasure'] = 'Axe of the Weeping Wolf'
t['sacrificial_blade_treasure'] = 'Sacrificial Blade'
t['crystallized_essence_of_the_elements_treasure'] = 'Crystallized Essence of the Elements'
t['snake_charmers_flute_treasure'] = "Snake Charmer's Flute"
t['lodged_hunting_spear_treasure'] = 'Lodged Hunting Spear'
t['looted_mystical_staff_treasure'] = 'Looted Mystical Staff'
t['the_blade_of_kranak_treasure'] = "The Blade of Kra'nak"
t['forgotten_champions_blade_treasure'] = "Forgotten Champion's Blade"
t['rune_etched_femur_treasure'] = 'Rune Etched Femur'
t['book_of_zyzzix_treasure'] = 'Book of Zyzzix'
t['the_commanders_shield_treasure'] = "The Commander's Shield'"
t['scouts_belongings_treasure'] = "Scout's Belongings"
t['polished_crystal_treasure'] = 'Polished Crystal'
t['strange_sapphire_treasure'] = 'Strange Sapphire'
t['censer_of_torment_treasure'] = 'Censer of Torment'
t['overgrown_relic_treasure'] = 'Overgrown Relic'
t['jewel_of_hellfire_treasure'] = 'Jewel of Hellfire'
t['skull_of_the_mad_chief_treasure'] = 'Skull of the Mad Chief'
t['jeweled_arakkoa_effigy_treasure'] = 'Jeweled Arakkoa Effigy'
t['tome_of_secrets_treasure'] = 'Tome of Secrets'
t['the_perfect_blossom_treasure'] = 'The Perfect Blossom'
t['brazier_of_awakening_treasure'] = 'Brazier of Awakening'
t['dazzling_rod_treasure'] = 'Dazzling Rod'
t['crystallized_fel_spike_treasure'] = 'Crystallized Fel Spike'
t['fel_drenched_satchel_treasure'] = 'Fel-Drenched Satchel'
t['the_eye_of_grannok_treasure'] = 'The Eye of Grannok'
t['borrowed_enchanted_spyglass_treasure'] = "'Borrowed' Enchanted Spyglass"
t['bleeding_hollow_mushroom_stash_treasure'] = 'Bleeding Hollow Mushroom Stash'
t['mysterious_corrupted_obelist_treasure'] = 'Mysterious Corrupted Obelisk'
t['spoils_of_war_treasure'] = 'Spoils of War'
t['stolen_captains_chest_treasure'] = "Stolen Captain's Chest"
t['bleeding_hollow_warchest_treasure'] = 'Bleeding Hollow Warchest'
t['looted_bleeding_hollow_treasure_treasure'] = 'Looted Bleeding Hollow Treasure'
t['partially_mined_apexis_crystal_treasure'] = 'Partially Mined Apexis Crystal'
t['pale_removal_equipment_treasure'] = 'Pale Removal Equipment'
t['stashed_iron_sea_booty_treasure'] = 'Stashed Iron Sea Booty'
t['ironbeards_treasure_treasure'] = "Ironbeard's Treasure"
t['forgotten_sack_treasure'] = 'Forgotten Sack'
t['blackfang_island_cache_treasure'] = 'Blackfang Island Cache'
t['fel_tainted_apexis_formation_treasure'] = 'Fel-Tainted Apexis Formation'
t['jewel_of_the_fallen_star_treasure'] = 'Jewel of the Fallen Star'
t['forgotten_shard_of_the_cipher_treasure'] = 'Forgotten Shard of the Cipher'
t['strange_fruit_treasure'] = 'Strange Fruit'
t['stashed_bleeding_hollow_loot_treasure'] = 'Stashed Bleeding Hollow Loot'
t['forgotten_iron_horde_supplies_treasure'] = 'Forgotten Iron Horde Supplies'
t['bejeweled_egg_treasure'] = 'Bejeweled Egg'
t['dead_mans_chest_treasure'] = "Dead Man's Chest"
t['the_commanders_shield_note'] = 'Inside building.'
t['the_eye_of_grannok_note'] = 'On the second floor of tower near the stairs.'
t['tower_chest_note'] = 'At the top of a tower.'
t['spoils_of_war_note'] = 'Inside the hut.'
t['strange_fruit_note'] = '[item(127396)] incubates in 14 days into [item(127394)].'
