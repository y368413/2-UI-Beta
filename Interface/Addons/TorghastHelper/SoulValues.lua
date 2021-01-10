local name, addon = ...;



addon.descriptions = {
	["Broker's Purse"] = {["id"] = 305308, ["description"] = "Acquire 400 Phantasma."},
	["Mawrat Harness"] = {["id"] = 304918, ["description"] = "Obtain a Mawrat Harness, an item that allows you to transform into a Maw Rat while in Torghast."},
	["Pocketed Soulcage"] = {["id"] = 305269, ["description"] = "Opening the cage will reward 10-20 Soul Remnants."},
	["Shackle Keys"] = {["id"] = 297413, ["description"] = "Shackle effects no longer damage or snare you."},
	["Maw Seeker Harness"] = {["id"] = 304918, ["description"] = "Obtain a Maw Seeker Harness, an item that allows you to transform into a Maw Seeker while in Torghast."},
	["Warden's Authority"] = {["id"] = 305266, ["description"] = "Automatically open all Soul Cages within 30 yards."},
	["Marrow Scooper"] = {["id"] = 305287, ["description"] = "Skeletons in the Jailer's Tower drop 10 times as much Phantasma."},
	["Skeletal Ward"] = {["id"] = 305288, ["description"] = "A skeleton will serve as your ward, assisting you in combat."},
	["Flamestarved Cinders"] = {["id"] = 305277, ["description"] = "Absorbs all nearby heat, reducing Fire damage taken by 65%."},
	["Dark Armaments"] = {["id"] = 305274, ["description"] = "Killing a creature grants 5% Haste for 10 sec. This effect can stack 10 times."},
	["Deadsoul Hound Harness"] = {["id"] = 304917, ["description"] = "Obtain a Deadsoul Hound Harness, an item that allows you to transform into a Deadsoul Hound while in Torghast."},
	["Purifier's Flame"] = {["id"] = 295754, ["description"] = "Deadsoul Death Pools no longer damage you, and instead you absorb them, healing yourself for (50% of Spell power) every 1 sec."},
	["Glasswing Charm"] = {["id"] = 305282, ["description"] = "Become a cloud of insects when out of combat, increasing movement speed by 80%."},
	["Prisoner's Concord"] = {["id"] = 305293, ["description"] = "Freeing a Soul Remnant from Torghast grants you 100% Critical Strike for 10 sec."},
	
	["Pulsing Rot-hive"] = {["id"] = 338616, ["description"] = "Your attacks have a chance to attach decayfly larvae in the target, inflicting (40% of Spell power) Nature damage every 1 sec for 6 sec. When this effect expires, the larvae hatch from within the target to fight for you."},
	["Swarm Form"] = {["id"] = 338631, ["description"] = "Your body becomes more like a swarm of insects, increasing enemy chance to miss you by 10%."},
	["Obleron Endurance"] = {["id"] = 293025, ["description"] = "Increase maximum health by 15%."},
	["Obleron Endurance x3"] = {["id"] = 293027, ["description"] = "Increase maximum health by 45%."},
	["Obleron Winds"] = {["id"] = 294592, ["description"] = "Increase haste by 3%."},
	["Obleron Winds x3"] = {["id"] = 294594, ["description"] = "Increase haste by 9%."},
	["Obleron Talisman x3"] = {["id"] = 294601, ["description"] = "Increase mastery by 9%."},
	["Obleron Spikes x3"] = {["id"] = 294588, ["description"] = "Increase critical strike chance by 9%."},
	["Spectral Oats"] = {["id"] = 315319, ["description"] = "Heal 2% of your max health every 1 sec while running."},
	["Spectral Bridle"] = {["id"] = 315314, ["description"] = "Obtain a Spectral Bridle, an item that allows you to transform into a rideable Spectral Horse while in the Jailer's Tower."},
	["Resonating Effigy"] = {["id"] = 339026, ["description"] = "You take 30% less Magic damage and suffer 15% more Physical damage."},
	["Ephemeral Effigy"] = {["id"] = 339024, ["description"] = "You take 30% less Physical damage and suffer 15% more Magic damage."},
	["Tremorbeast Tusk"] = {["id"] = 297576, ["description"] = "When an enemy damages you, they suffer (60% of Spell power) Nature damage. If they deal at least 5% of your health in damage, they are knocked back.The knockback may only occur every 10 sec per target."},
	["Tremorbeast Heart"] = {["id"] = 296140, ["description"] = "Primary stat increased by 15%, and regenerate (100% of Spell power) health every 5 sec."},
	["Soulward Clasp"] = {["id"] = 338922, ["description"] = "Your attacks have a chance to create a zone of soul empowerment nearby. Any player may collect this to gain 25% damage and healing done and 25% movement speed for 10 sec."},
	["V'lara's Cape of Subterfuge"] = {["id"] = 338948, ["description"] = "Your attacks have a chance to cause you to fade away, reducing your threat for 6 sec. While you are under this effect, your critical strike chance is increased by 25%."},
	["Dark Fortress"] = {["id"] = 337878, ["description"] = "While in combat, every 10 sec gain 5% reduced damage taken for 12 sec. This effect stacks up to 5 times."},
	["Fallen Armaments"] = {["id"] = 337881, ["description"] = "While in combat, every 10 sec gain 5% Haste for 12 sec. This effect stacks up to 5 times."},
	["Fractured Phantasma Lure"] = {["id"] = 337750, ["description"] = "Increases Phantasma earned by 100%, but also decreases damage done by 10%."},
	["Reinforced Lure Casing"] = {["id"] = 337765, ["description"] = "Removes the damage done penalty from any Fractured Phantasma Lures carried."},
	["Icy Heartcrust"] = {["id"] = 315300, ["description"] = "Absorb 60% of damage dealt to you when your health is below 15%."},
	["Frostbite Wand"] = {["id"] = 315288, ["description"] = "Damaging an enemy will also apply Frostbite, dealing damage equal to 50% of their current hit points. After 4 sec, the enemy will start regenerating all of the lost health over a period of 10 sec.\nCreatures can only be Frostbitten once."},
	["Erratic Howler"] = {["id"] = 337613, ["description"] = "While in combat, release an uncontrolled howl at random intervals. This howl inflicts (50% of Spell power) Shadow damage to enemies within 20 yds and interrupts spells."},
	["Unstable Form"] = {["id"] = 337620, ["description"] = "While in combat, become incorporeal at random intervals, reducing damage taken by 99% for 3 sec."},
	["Vial of Lost Potential"] = {["id"] = 305273, ["description"] = "Clear all permanent debuffs left by the Eternal Subjugator."},
	["Subjugator's Manacles"] = {["id"] = 297721, ["description"] = "When you attack a new creature, they suffer (210% of Spell power) Shadow damage and are silenced for 4 sec."},
	["Shimmering Wingcape"] = {["id"] = 338029, ["description"] = "Reduces the range at which enemies can detect you by 5 yds."},
	["Irritating Moth Dust"] = {["id"] = 338023, ["description"] = "Your attacks have a chance to create a cloud of irritant near your target for 12 sec. Enemies caught within have their damage done reduced by 40%."},
	["Coffer of Spectral Whispers"] = {["id"] = 338446, ["description"] = "You become immune to Silence and Interrupt effects."},
	["Elongated Skeletal Arms"] = {["id"] = 338449, ["description"] = "Increases the range of your Auto Attack by 10 yds."},
	["Vitality Guillotine"] = {["id"] = 300730, ["description"] = "The first time you damage an Elite enemy, deal additional damage equal to half their maximum health. After this occurs 3 times this effect is lost, and you gain 30% maximum health."},
	["Blade of the Lifetaker"] = {["id"] = 300771, ["description"] = "Your attacks have a high chance to steal health from the enemy equal to 10% of your maximum health."},
	["Pouch of Phantasma"] = {["id"] = 295072, ["description"] = "Acquire 75 Phantasma."},
	["Lumbering Form"] = {["id"] = 337938, ["description"] = "While in combat, your size is increased by 100% and you automatically knock back ALL players and enemies that come within 2 yds of yourself."},
	["Potent Acid Gland"] = {["id"] = 337928, ["description"] = "Your attacks have a chance to launch a glob of acid, inflicting (250% of Spell power) Nature damage and allowing you to ignore 100% of the target's armor for 8 sec."},
	--[""] = {["id"] = , ["description"] = ""},
	--swap: \[(".+")\] = {\["id"\] = (\d+) TO \[\2\] = {\["id"\] = (\1)
}


addon.values = {
	[151353] = {["name"] = "Mawrat", ["effect"] = addon.descriptions["Mawrat Harness"]},
	[154030] = {["name"] = "Oddly Large Mawrat", ["effect"] = addon.descriptions["Mawrat Harness"]},
	[152594] = {["name"] = "Broker Ve'ken", ["effect"] = addon.descriptions["Broker's Purse"]},
	[170257] = {["name"] = "Broker Ve'nott", ["effect"] = addon.descriptions["Broker's Purse"]},
	
	[152708] = {["name"] = "Mawsworn Seeker", ["effect"] = addon.descriptions["Maw Seeker Harness"]},
	[153878] = {["name"] = "Mawsworn Archer", ["effect"] = addon.descriptions["Pocketed Soulcage"]},
	[150959] = {["name"] = "Mawsworn Interceptor", ["effect"] = addon.descriptions["Pocketed Soulcage"]},
	[150958] = {["name"] = "Mawsworn Guard", ["effect"] = addon.descriptions["Warden's Authority"]},
	[153874] = {["name"] = "Mawsworn Sentry", ["effect"] = addon.descriptions["Warden's Authority"]},
	[157572] = {["name"] = "Mawsworn Firecaller", ["effect"] = addon.descriptions["Flamestarved Cinders"]},
	[157571] = {["name"] = "Mawsworn Flametender", ["effect"] = addon.descriptions["Flamestarved Cinders"]},	
	[155790] = {["name"] = "Mawsworn Acolyte", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[155830] = {["name"] = "Mawsworn Disciple", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[157810] = {["name"] = "Mawsworn Endbringer", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[155949] = {["name"] = "Mawsworn Soulbinder", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[155831] = {["name"] = "Mawsworn Soulbinder", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[157809] = {["name"] = "Mawsworn Darkcaster", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[155812] = {["name"] = "Mawsworn Ritualist", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[157819] = {["name"] = "Mawsworn Shadestalker", ["effect"] = addon.descriptions["Warden's Authority"]},
	[171173] = {["name"] = "Mawsworn Shadestalker", ["effect"] = addon.descriptions["Warden's Authority"]},
	[155798] = {["name"] = "Mawsworn Shackler", ["effect"] = addon.descriptions["Shackle Keys"]},
	[150965] = {["name"] = "Mawsworn Shackler", ["effect"] = addon.descriptions["Shackle Keys"]},
	[171172] = {["name"] = "Mawsworn Shackler", ["effect"] = addon.descriptions["Shackle Keys"]},
	--[162661] = {["name"] = "Mawsworn Ward", ["effect"] = addon.descriptions["Shackle Keys"]},
	
	[155824] = {["name"] = "Lumbering Creation", ["effect"] = addon.descriptions["Marrow Scooper"]},
	[155793] = {["name"] = "Skeletal Remains", ["effect"] = addon.descriptions["Skeletal Ward"]},	
	[157584] = {["name"] = "Flameforge Master", ["effect"] = addon.descriptions["Flamestarved Cinders"]},
	[157583] = {["name"] = "Forge Keeper", ["effect"] = addon.descriptions["Flamestarved Cinders"]},
	[157634] = {["name"] = "Flameforge Enforcer", ["effect"] = addon.descriptions["Warden's Authority"]},
	
	[156212] = {["name"] = "Coldheart Agent", ["effect"] = addon.descriptions["Dark Armaments"]},
	[165594] = {["name"] = "Coldheart Ambusher", ["effect"] = addon.descriptions["Dark Armaments"]},
	[156157] = {["name"] = "Coldheart Ascendant", ["effect"] = addon.descriptions["Dark Armaments"]},
	[156226] = {["name"] = "Coldheart Binder", ["effect"] = addon.descriptions["Dark Armaments"]},
	[156213] = {["name"] = "Coldheart Guardian", ["effect"] = addon.descriptions["Dark Armaments"]},
	[156159] = {["name"] = "Coldheart Javelineer", ["effect"] = addon.descriptions["Dark Armaments"]},
	[156219] = {["name"] = "Coldheart Scout", ["effect"] = addon.descriptions["Dark Armaments"]},
	
	[151816] = {["name"] = "Deadsoul Scavenger", ["effect"] = addon.descriptions["Deadsoul Hound Harness"]},
	[152644] = {["name"] = "Deadsoul Drifter", ["effect"] = addon.descriptions["Purifier's Flame"]},
	[151815] = {["name"] = "Deadsoul Echo", ["effect"] = addon.descriptions["Purifier's Flame"]},
	[151816] = {["name"] = "Deadsoul Scavenger", ["effect"] = addon.descriptions["Purifier's Flame"]},
	[151814] = {["name"] = "Deadsoul Shade", ["effect"] = addon.descriptions["Purifier's Flame"]},
    [153879] = {["name"] = "Deadsoul Shadow", ["effect"] = addon.descriptions["Purifier's Flame"]},
    [153885] = {["name"] = "Deadsoul Shambler", ["effect"] = addon.descriptions["Purifier's Flame"]},
    [153882] = {["name"] = "Deadsoul Spirit", ["effect"] = addon.descriptions["Purifier's Flame"]},
    [153552] = {["name"] = "Weeping Wraith", ["effect"] = addon.descriptions["Purifier's Flame"]},
	
	[154128] = {["name"] = "Blazing Elemental", ["effect"] = addon.descriptions["Flamestarved Cinders"]},
	[154129] = {["name"] = "Burning Emberguard", ["effect"] = addon.descriptions["Flamestarved Cinders"]},
	
	
	[155225] = {["name"] = "Faeleaf Grovesinger", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155221] = {["name"] = "Faeleaf Tender", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155216] = {["name"] = "Faeleaf Warden", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155226] = {["name"] = "Verdant Keeper", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155215] = {["name"] = "Faeleaf Lasher", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155211] = {["name"] = "Gormling Pest", ["effect"] = addon.descriptions["Glasswing Charm"]},
	[155219] = {["name"] = "Gormling Spitter", ["effect"] = addon.descriptions["Glasswing Charm"]},
	
	[154011] = {["name"] = "Armed Prisoner", ["effect"] = addon.descriptions["Prisoner's Concord"]},
	[154015] = {["name"] = "Escaped Ritualist", ["effect"] = addon.descriptions["Prisoner's Concord"]},
	[154014] = {["name"] = "Imprisoned Cabalist", ["effect"] = addon.descriptions["Prisoner's Concord"]},
	[154020] = {["name"] = "Prisonbreak Cursewalker", ["effect"] = addon.descriptions["Prisoner's Concord"]},
	[154018] = {["name"] = "Prisonbreak Mauler", ["effect"] = addon.descriptions["Prisoner's Concord"]},
	[154016] = {["name"] = "Prisonbreak Soulmender", ["effect"] = addon.descriptions["Prisoner's Concord"]},	
	[164897] = {["name"] = "Fog Dweller", ["effect"] = addon.descriptions["Pouch of Phantasma"]},	
	--[165060] = {["name"] = "Animimic", ["effect"] = addon.descriptions["Prisoner's Concord"]},	
	
}


addon.rares = {
	[173134] = {
		["name"] = "Darksworn Goliath", 
		["buffs"] = {"Fallen Armaments", "Dark Fortress"}
	},
	[173114] = {
		["name"] = "Invasive Decayfly", 
		["buffs"] = {"Pulsing Rot-hive", "Swarm Form"}
	},
	[156134] = {
		["name"] = "Ghastly Charger", 
		["buffs"] = {"Spectral Oats", "Spectral Bridle"}
	},
	[170385] = {
		["name"] = "Writhing Misery", 
		["buffs"] = {"Resonating Effigy", "Ephemeral Effigy"}
	},
	[152508] = {
		["name"] = "Dusky Tremorbeast", 
		["buffs"] = {"Tremorbeast Tusk", "Tremorbeast Heart"}
	},
	[173191] = {
		["name"] = "Soulstalker V'lara", 
		["buffs"] = {"Soulward Clasp", "V'lara's Cape of Subterfuge"}
	},
	[156158] = {
		["name"] = "Adjutant Felipos", 
		["buffs"] = {"Dark Fortress", "Fallen Armaments"}
	},
	[170414] = {
		["name"] = "Howling Spectre", 
		["buffs"] = {"Erratic Howler", "Unstable Form"}
	},
	[170417] = {
		["name"] = "Animated Stygia", 
		["buffs"] = {"Fractured Phantasma Lure", "Reinforced Lure Casing"}
	},
	[156142] = {
		["name"] = "Seeker of Souls", 
		["buffs"] = {"Frostbite Wand", "Icy Heartcrust"}
	},
	[152517] = {
		["name"] = "Deadsoul Lifetaker", 
		["buffs"] = {"Vitality Guillotine", "Blade of the Lifetaker"}
	},
	[152612] = {
		["name"] = "Subjugator Klontzas", 
		["buffs"] = {"Vial of Lost Potential", "Subjugator's Manacles"}
	},
	[155483] = {
		["name"] = "Faeleaf Shimmerwing", 
		["buffs"] = {"Shimmering Wingcape", "Irritating Moth Dust"}
	},
	[173051] = {
		["name"] = "Suppressor Xelsor", 
		["buffs"] = {"Elongated Skeletal Arms", "Coffer of Spectral Whispers"}
	},
	[156237] = {
		["name"] = "Imperator Dara", 
		["buffs"] = {"Fallen Armaments", "Dark Fortress"}
	},
	[169823] = {
		["name"] = "Gorm Behemoth", 
		["buffs"] = {"Lumbering Form", "Potent Acid Gland"}
	},
}

--	[156219] = {
--		["name"] = "Testvalue", 
--		["buffs"] = {"Soulward Clasp", "V'lara's Cape of Subterfuge", "Obleron Winds x3"}
--	},
-- [""] = {["name"] = , ["effect"] = addon.descriptions[""]},
-- [""] = {["name"] = , ["description"] = ""},