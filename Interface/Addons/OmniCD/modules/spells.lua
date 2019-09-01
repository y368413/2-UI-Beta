local _, ns = ...

local spellList = {
    ["DEATHKNIGHT"] = { -- 250(Blood), 251(Frost), 252(Unholy)
        { spellID = 47528,  duration = 15,  type = "interrupt", default = true }, -- Mind Freeze
        { spellID = 47482,  duration = 30,  type = "interrupt", spec = { 252 }, default = true }, -- Leap & Shambling Rush (91807)
        { spellID = 47481,  duration = 90,  type = "cc", spec = { 252 } }, -- Gnaw (91800) & Monstrous Blow (91797)
        { spellID = 108194, duration = 45,  type = "cc", spec = true }, -- Asphyxiate
        { spellID = 221562, duration = 45,  type = "cc", spec = { 250 } }, -- Asphyxiate (B)
        { spellID = 47476,  duration = 60,  type = "cc", spec = true }, -- Strangulate
        { spellID = 207167, duration = 60,  type = "cc", spec = true }, -- Blinding Sleet
        { spellID = 49576,  duration = { default = 25, [250] = 15 }, type = "cc" }, -- Death Grip
        { spellID = 108199, duration = 120, type = "cc", spec = {250} }, -- Gorefiend's Grasp
        { spellID = 287250, duration = 45,  type = "cc", spec = true, parent = 196770 }, -- Dead of Winter (talentID)
        { spellID = 48707,  duration = 60,  type = "defensive", default = true }, -- Anti-Magic Shell
        { spellID = 51052,  duration = 120, type = "defensive", spec = true, default = true }, -- Anti-Magic Zone
        { spellID = 48792,  duration = 180, type = "defensive", default = true }, -- Icebound Fortitude
        { spellID = 49028,  duration = 120, type = "defensive", spec = { 250 } }, -- Dancing Rune Weapon
        { spellID = 274156, duration = 45,  type = "defensive", spec = true }, -- Consumption
        { spellID = 219809, duration = 60,  type = "defensive", spec = true }, -- Tombstone
        { spellID = 194844, duration = 60,  type = "defensive", spec = true }, -- Bonestorm
        { spellID = 55233,  duration = 90,  type = "defensive", spec = { 250 } }, -- Vampiric Blood
        { spellID = 287081, duration = 60,  type = "defensive", spec = true, default = true, parent = 48792 }, -- Lichborne
        { spellID = 48743,  duration = 120, type = "defensive", spec = true }, -- Death Pact
        { spellID = 114556, duration = 240, type = "defensive", spec = true }, -- Purgatory (dummy spell)
        { spellID = 51271,  duration = 45,  type = "offensive", spec = { 251 } }, -- Pillar of Frost
        { spellID = 279302, duration = 180, type = "offensive", spec = true }, -- Frostwyrm's Fury
        { spellID = 152279, duration = 120, type = "offensive", spec = true }, -- Breath of Sindragosa
        { spellID = 130736, duration = 45,  type = "offensive", spec = true }, -- Soul Reaper
        { spellID = 207289, duration = 75,  type = "offensive", spec = true }, -- Unholy Frenzy
        { spellID = 275699, duration = 90,  type = "offensive", spec = { 252 } }, -- Apocalypse
        { spellID = 47568,  duration = 120, type = "offensive", spec = { 251 } }, -- Empower Rune Weapon
        { spellID = 49206,  duration = 180, type = "offensive", spec = true }, -- Summon Gargolye
        { spellID = 63560,  duration = 60,  type = "offensive", spec = { 252 } }, -- Dark Transformation
        { spellID = 42650,  duration = 480, type = "offensive", spec = { 252 } }, -- Army of the Dead
        { spellID = 288853, duration = 90,  type = "offensive", spec = true, parent = 42650 }, -- Raise Abomination
        { spellID = 196770, duration = 20,  type = "others", spec = { 251 } }, -- Remorseless Winter
        { spellID = 48265,  duration = 45,  type = "others" }, -- Death's Advance
        { spellID = 212552, duration = 60,  type = "others", spec = true }, -- Wraith Walk
        { spellID = 77606,  duration = 20,  type = "others", spec = true }, -- Dark Simulacrum
    },
    ["DEMONHUNTER"] = { -- 577(Havoc), 581(Vengeance)
        { spellID = 183752, duration = 15,  type = "interrupt", default = true }, -- Disrupt
        { spellID = 217832, duration = 45,  type = "cc" }, -- Imprison
        { spellID = 221527, duration = 60,  type = "cc", spec = 205596, parent = 217832 }, -- Detainment
        { spellID = 179057, duration = 60,  type = "cc", spec = { 577 } }, -- Chaos Nova
        { spellID = 205630, duration = 60,  type = "cc", spec = true }, -- Illidan's Grasp
        { spellID = 211881, duration = 30,  type = "cc", spec = true }, -- Fel Eruption
        { spellID = 207684, duration = 90,  type = "cc", spec = { 581 } }, -- Sigil of Misery
        { spellID = 202137, duration = 60,  type = "cc", spec = { 581 } }, -- Sigil of Silence
        { spellID = 202138, duration = 90,  type = "cc", spec = true }, -- Sigil of Chains
        { spellID = 196555, duration = 120, type = "immunity", spec = true, default = true }, -- Netherwalk
        { spellID = 209258, duration = 480, type = "defensive", spec = true }, -- Last Resort (dummy spell)
        { spellID = 198589, duration = 60,  type = "defensive", spec = { 577 }, default = true }, -- Blur
        { spellID = 196718, duration = 180, type = "defensive", spec = { 577 } }, -- Darkness
        { spellID = 227635, duration = 180, type = "defensive", spec = true, parent = 196718, default = true }, -- Cover of Darkness (talentID)
        { spellID = 206803, duration = 60,  type = "defensive", spec = true }, -- Rain from Above
        { spellID = 204021, duration = 60,  type = "defensive", spec = { 581 } }, -- Fiery Brand
        { spellID = 187827, duration = 180, type = "defensive", spec = { 581 } }, -- Metamorphosis (V)
        { spellID = 200166, duration = 240, type = "offensive", spec = { 577 } }, -- Metamorphosis
        { spellID = 206491, duration = 120, type = "offensive", spec = true }, -- Nemesis
        { spellID = 258925, duration = 60,  type = "offensive", spec = true }, -- Fel Barrage
        { spellID = 203704, duration = 60,  type = "offensive", spec = true }, -- Mana Break
        { spellID = 206649, duration = 45,  type = "offensive", spec = true }, -- Eye of Leotheras
        { spellID = 205604, duration = 60,  type = "others", spec = true, default = true }, -- Reverse Magic
        { spellID = 205629, duration = 20,  type = "others", spec = true, charges = 2 }, -- Demonic Trample
    },
    ["DRUID"] = { -- 102(Bal), 103(Feral), 104(Guardian), 105(Resto)
        { spellID = 106839, duration = 15,  type = "interrupt", spec = { 103, 104 }, default = true }, -- Skull Bash
        { spellID = 78675,  duration = 60,  type = "interrupt", spec = { 102 }, default = true }, -- Solar Beam
        { spellID = 88423,  duration = 8,   type = "interrupt", spec = { 105 }, default = true }, -- Nature's Cure
        { spellID = 5211,   duration = 50,  type = "cc", spec = true }, -- Mighty Bash
        { spellID = 202246, duration = 25,  type = "cc", spec = true }, -- Overrun
        { spellID = 99,     duration = 30,  type = "cc", spec = { 104 } }, -- Incapacitating Roar
        { spellID = 102359, duration = 30,  type = "cc", spec = true }, -- Mass Entanglement
        { spellID = 132469, duration = 30,  type = "cc", spec = true }, -- Typhoon
        { spellID = 102793, duration = 60,  type = "cc", spec = { 105 } }, -- Ursol's Vortex
        { spellID = 102793, duration = 60,  type = "cc", spec = true }, -- Ursol's Vortex (G)
        { spellID = 22812,  duration = { default = 60, [104] = 90 }, type = "defensive", spec = { 102, 104, 105 }, default = true }, -- Barkskin
        { spellID = 102342, duration = 60,  type = "defensive", spec = { 105 }, default = true }, -- Ironbark
        { spellID = 61336,  duration = { default = 120, [104] = 240 }, type = "defensive", spec = { 103, 104 }, charges = 2, default = true }, -- Survival Instincts
        { spellID = 108238, duration = 90,  type = "defensive", spec = true, default = true }, -- Renewal
        { spellID = 209749, duration = 30,  type = "defensive", spec = true }, -- Faerie Swarm
        { spellID = 305497, duration = 45,  type = "defensive", spec = true }, -- Thorns
        { spellID = 201664, duration = 30,  type = "defensive", spec = true }, -- Demoralizing Roar
        { spellID = 22842,  duration = 34,  type = "defensive", spec = 197491 }, -- Frenzied Regeneration (R, B)
        { spellID = 22842,  duration = 34,  type = "defensive", spec = 217615 }, -- Frenzied Regeneration (F)
        { spellID = 22842,  duration = 34,  type = "defensive", spec = { 104 }, charges = 2 }, -- Frenzied Regeneration (G)
        { spellID = 740,    duration = 180, type = "offensive", spec = { 105 } }, -- Tranquility
        { spellID = 203651, duration = 45,  type = "offensive", spec = true }, -- Overgrowth
        { spellID = 106951, duration = 180, type = "offensive", spec = { 103 } }, -- Berserk
        { spellID = 194223, duration = 180, type = "offensive", spec = { 102 } }, -- Celestial Alignment
        { spellID = 102543, duration = 180, type = "offensive", spec = true, parent = 106951 }, -- Incarnation: King of the Jungle
        { spellID = 102560, duration = 180, type = "offensive", spec = true, parent = 194223 }, -- Incarnation: Chosen of Elune
        { spellID = 33891,  duration = 180, type = "offensive", spec = true, default = true }, -- Incarnation: Tree of Life
        { spellID = 102558, duration = 180, type = "offensive", spec = true }, -- Incarnation: Guardian of Ursoc
        { spellID = 5217,   duration = 30,  type = "offensive", spec = { 103 } }, -- Tiger's Fury
        { spellID = 202425, duration = 45,  type = "offensive", spec = true }, -- Warrior of Elune
        { spellID = 202770, duration = 60,  type = "offensive", spec = true }, -- Fury of Elune
        { spellID = 77761,  duration = { default = 120, [104] = 60 },  type = "others", spec = { 103, 104 } }, -- Stampeding Roar (merged into 1)
        { spellID = 1850,   duration = 120, type = "others" }, -- Dash
        { spellID = 252216, duration = 45,  type = "others", spec = true, parent = 1850 }, -- Tiger's Dash
        { spellID = 29166,  duration = 180, type = "others", spec = { 102, 105 } }, -- Innervate
        { spellID = 205636, duration = 60,  type = "others", spec = true }, -- Force of Nature
    },
    ["HUNTER"] = { -- 253(BM), 254(MM), 255(SV)
        { spellID = 147362, duration = 24,  type = "interrupt", spec = { 253, 254 }, default = true }, -- Countershot
        { spellID = 187707, duration = 15,  type = "interrupt", spec = { 255 }, default = true }, -- Muzzle
        { spellID = 187650, duration = 30,  type = "cc", default = true }, -- Freezing Trap
        { spellID = 19577,  duration = 60,  type = "cc", spec = { 253, 255 } }, -- Intimidation
        { spellID = 213691, duration = 30,  type = "cc", spec = true }, -- Scatter Shot
        { spellID = 186387, duration = 30,  type = "cc", spec = { 254 } }, -- Bursting Shot
        { spellID = 109248, duration = 45,  type = "cc", spec = true }, -- Binding Shot
        { spellID = 236776, duration = 40,  type = "cc", spec = true }, -- Hi-Explosive Trap
        { spellID = 202914, duration = 45,  type = "cc", spec = true }, -- Spider Sting
        { spellID = 186265, duration = 180, type = "immunity", default = true }, -- Aspect of the Turtle
        { spellID = 109304, duration = 120, type = "defensive", default = true }, -- Exhilaration
        { spellID = 212640, duration = 25,  type = "defensive", spec = true }, -- Mending Bandage
        { spellID = 53480,  duration = 60,  type = "defensive", spec = true }, -- Roar of Sacrifice
        { spellID = 288613, duration = 120, type = "offensive", spec = { 254 } }, -- Trueshot
        { spellID = 260402, duration = 60,  type = "offensive", spec = true }, -- Double Tap
        { spellID = 266779, duration = 120, type = "offensive", spec = { 255 } }, -- Coordinated Assault
        { spellID = 186289, duration = 90,  type = "offensive", spec = { 255 } }, -- Aspect of the Eagle
        { spellID = 193530, duration = 120, type = "offensive", spec = { 253 } }, -- Aspect of the Wild
        { spellID = 205691, duration = 120, type = "offensive", spec = true }, -- Dire Beast: Basilisk
        { spellID = 19574,  duration = 90,  type = "offensive", spec = { 253 } }, -- Bestial Wrath
        { spellID = 194407, duration = 90,  type = "offensive", spec = true }, -- Spitting Cobra
        { spellID = 131894, duration = 60,  type = "offensive", spec = true }, -- A Murder of Crows
        { spellID = 199483, duration = 60,  type = "others", spec = true }, -- Camouflage
        { spellID = 272651, duration = 45,  type = "others" }, -- Command Pet
        { spellID = 186257, duration = 180, type = "others" }, -- Aspect of the Cheetah
        { spellID = 248518, duration = 45,  type = "others", spec = true, parent = 34477 }, -- Interlope
    },
    ["MAGE"] = { -- 62(Arcane), 63(Fire), 64(Frost)
        { spellID = 2139,   duration = 24,  type = "interrupt", default = true }, -- Counterspell
        { spellID = 113724, duration = 45,  type = "cc", spec = true }, -- Ring of Frost
        { spellID = 31661,  duration = 20,  type = "cc", spec = { 63 } }, -- Dragon's Breath
        { spellID = 45438,  duration = 240, type = "immunity", default = true }, -- Ice Block
        { spellID = 235219, duration = 300, type = "defensive", spec = { 64 }, default = true }, -- Cold Snap
        { spellID = 198111, duration = 45,  type = "defensive", spec = true, default = true }, -- Temporal Shield
        { spellID = 110960, duration = 120, type = "defensive", spec = { 62 } }, -- Greater Invisibility
        { spellID = 198158, duration = 60,  type = "defensive", spec = true }, -- Mass Invisibility
        { spellID = 12042,  duration = 90,  type = "offensive", spec = { 62 } }, -- Arcane Power
        { spellID = 190319, duration = 120, type = "offensive", spec = { 63 } }, -- Combustion
        { spellID = 153561, duration = 45,  type = "offensive", spec = true }, -- Meteor
        { spellID = 12472,  duration = 180, type = "offensive", spec = { 64 } }, -- Icy Vein
        { spellID = 198144, duration = 60,  type = "offensive", spec = true, parent = 12472 }, -- Ice Form
        { spellID = 205021, duration = 75,  type = "offensive", spec = true }, -- Ray of Frost
        { spellID = 84714,  duration = 60,  type = "offensive", spec = { 64 } }, -- Frozen Orb
        { spellID = 257537, duration = 45,  type = "offensive", spec = true }, -- Ebonbolt
        { spellID = 153595, duration = 30,  type = "offensive", spec = true }, -- Comet Storm
        { spellID = 205025, duration = 60,  type = "offensive", spec = { 62 } }, -- Presence of Mind
        { spellID = 205032, duration = 40,  type = "offensive", spec = true }, -- Charged Up
        { spellID = 153626, duration = 20,  type = "offensive", spec = true }, -- Arcane Orb
        { spellID = 116011, duration = 40,  type = "offensive", spec = true, charges = 2 }, -- Rune of Power
        { spellID = 55342,  duration = 120, type = "offensive", spec = true }, -- Mirror Image
        { spellID = 80353,  duration = 300, type = "offensive", pve = true }, -- Time Warp
        { spellID = 108839, duration = 20,  type = "others", spec = true, charges = 3 }, -- Ice Floes
        { spellID = 198100, duration = 30,  type = "others", spec = true }, -- Kleptomania (talentID)
        { spellID = 33395,  duration = 25,  type = "others", spec = { 64 } }, -- Freeze (pet)
        { spellID = 205024, duration = 0,   type = "others", spec = 205024, parent = 33395, hide = true }, -- Lonely Winter (talentID)
        { spellID = 122,    duration = 30,  type = "others" }, -- Frost Nova
        { spellID = 1953,   duration = 15,  type = "others" }, -- Blink
        { spellID = 212653, duration = 20,  type = "others", spec = true, charges = 2, parent = 1953 }, -- Shimmer
    },
    ["MONK"] = { -- 268(BM), 269(WW), 270(MW)
        { spellID = 116705, duration = 15,  type = "interrupt", spec = { 268, 269 }, default = true }, -- Spear Hand strike
        { spellID = 115450, duration = 8,   type = "interrupt", spec = { 270 }, default = true }, -- Detox
        { spellID = 119381, duration = 60,  type = "cc" }, -- Leg sweep
        { spellID = 115078, duration = 45,  type = "cc" }, -- Paralysis
        { spellID = 198898, duration = 30,  type = "cc", spec = true }, -- Song of Chi-Ji
        { spellID = 116844, duration = 45,  type = "cc", spec = true }, -- Ring of Peace
        { spellID = 202370, duration = 30,  type = "cc", spec = true }, -- Mighty Ox Kick
        { spellID = 202335, duration = 45,  type = "cc", spec = true }, -- Double Barrel
        { spellID = 122470, duration = 90,  type = "immunity", spec = { 269 }, default = true }, -- Touch of Karma
        { spellID = 116849, duration = 120, type = "immunity", spec = { 270 }, default = true }, -- Life Cocoon
        { spellID = 115203, duration = 420, type = "defensive", spec = { 268 } }, -- Fortifying Brew (BM)
        { spellID = 243435, duration = 90,  type = "defensive", spec = { 270 } }, -- Fortifying Brew (MW)
        { spellID = 201318, duration = 90,  type = "defensive", spec = true }, -- Fortifying Brew (WW)
        { spellID = 115399, duration = 120, type = "defensive", spec = true }, -- Black Ox Brew
        { spellID = 233759, duration = 45,  type = "defensive", spec = true }, -- Grapple Weapon
        { spellID = 119996, duration = 45,  type = "defensive" }, -- Transcendence: Transfer
        { spellID = 122278, duration = 120, type = "defensive", spec = true }, -- Dampen Harm
        { spellID = 122783, duration = 90,  type = "defensive", spec = true, default = true }, -- Diffuse Magic
        { spellID = 115176, duration = 300, type = "defensive", spec = { 268 } }, -- Zen Meditation
        { spellID = 202162, duration = 45,  type = "defensive", spec = true }, -- Avert Harm
        { spellID = 132578, duration = 180, type = "defensive", spec = true }, -- Invoke Niuzao, the Black Ox
        { spellID = 216113, duration = 60,  type = "offensive", spec = true, default = true }, -- Way of the Crane
        { spellID = 115310, duration = 180, type = "offensive", spec = { 270 } }, -- Revival
        { spellID = 198664, duration = 180, type = "offensive", spec = true }, -- Invoke Chi-Ji, the Red Crane
        { spellID = 115080, duration = 120, type = "offensive", spec = { 269 } }, -- Touch of Death
        { spellID = 137639, duration = 90,  type = "offensive", spec = { 269 }, charges = 2 }, -- Storm, Earth, and Fire
        { spellID = 152173, duration = 90,  type = "offensive", spec = true, parent = 137639 }, -- Serenity
        { spellID = 209584, duration = 45,  type = "others", spec = true }, -- Zen Focus Tea
        { spellID = 116841, duration = 30,  type = "others", spec = true }, -- Tiger's Lust
        { spellID = 101545, duration = 25,  type = "others", spec = { 269 } }, -- Flying Serpent Kick
        { spellID = 109132, duration = 20,  type = "others", charges = 2 }, -- Roll
        { spellID = 115008, duration = 20,  type = "others", spec = true, charges = 2, parent = 109132 }, -- Chi Torpedo
    },
    ["PALADIN"] = { -- 65(Holy), 66(Prot), 70(Ret)
        { spellID = 96231,  duration = 15,  type = "interrupt", spec = { 66, 70 }, default = true }, -- Rebuke
        { spellID = 215652, duration = 45,  type = "interrupt", spec = true, default = true }, -- Shield of Virtue
        { spellID = 4987,   duration = 8,   type = "interrupt", spec = { 65 }, default = true }, -- Cleanse
        { spellID = 853,    duration = 60,  type = "cc" }, -- Hammer of Justice
        { spellID = 115750, duration = 90,  type = "cc", spec = true }, -- Blinding Light
        { spellID = 20066,  duration = 15,  type = "cc", spec = true }, -- Repentance
        { spellID = 642,    duration = 300, type = "immunity", default = true }, -- Divine Shield
        { spellID = 1022,   duration = 300, type = "defensive" }, -- Blessing of Protection
        { spellID = 204018, duration = 180, type = "defensive", spec = true, parent = 1022 }, -- Blessing of Spellwarding
        { spellID = 6940,   duration = 120, type = "defensive", spec = { 65, 66 } }, -- Blessing of Sacrifice
        { spellID = 199452, duration = 120, type = "immunity", spec = true, default = true, parent = 6940 }, -- Ultimate Sacrifice - no player buff (talentID)
        { spellID = 86659,  duration = 300, type = "defensive", spec = { 66 } }, -- Guardian of the Ancient Kings
        { spellID = 228049, duration = 180, type = "immunity", spec = true, parent = 86659 }, -- Guardian of the Forgotten Queen
        { spellID = 31821,  duration = 180, type = "defensive", spec = { 65 } }, -- Aura Mastery
        { spellID = 498,    duration = 60,  type = "defensive", spec = { 65 } }, -- Divine Protection
        { spellID = 184662, duration = 120, type = "defensive", spec = { 70 } }, -- Shield of Vengeance
        { spellID = 205191, duration = 60,  type = "defensive", spec = true }, -- Eye for an eye
        { spellID = 31850,  duration = 85,  type = "defensive", spec = { 66 } }, -- Ardent Defender
        { spellID = 204150, duration = 180, type = "defensive", spec = true }, -- Aegis of Light
        { spellID = 31884,  duration = 120, type = "offensive" }, -- Avenging Wrath
        { spellID = 216331, duration = 120, type = "offensive", spec = true, parent = 31884 }, -- Avenging Crusader
        { spellID = 231895, duration = 120, type = "offensive", spec = true, parent = 31884 }, -- Crusade
        { spellID = 105809, duration = 90,  type = "offensive", spec = true }, -- Holy Avenger
        { spellID = 255937, duration = 45,  type = "offensive", spec = true }, -- Wake of Ashes
        { spellID = 210256, duration = 45,  type = "others", spec = true, default = true }, -- Blessing of Sanctuary
        { spellID = 210294, duration = 25,  type = "others", spec = true }, -- Divine Favor
        { spellID = 1044,   duration = 25,  type = "others" }, -- Blessing of Freedom
        { spellID = 190784, duration = 45,  type = "others" }, -- Divine Steed
    },
    ["PRIEST"] = { -- 256(Disc), 257(Holy), 258(Shadow)
        { spellID = 527,    duration = 8,   type = "interrupt", spec = { 256, 257 }, default = true }, -- Purify
        { spellID = 88625,  duration = 60,  type = "cc", spec = { 257 } }, -- Holy Word: Chastise
        { spellID = 64044,  duration = 45,  type = "cc", spec = true }, -- Psychic Horror
        { spellID = 8122,   duration = 60,  type = "cc", default = true }, -- Psychic Scream
        { spellID = 205369, duration = 30,  type = "cc", spec = true, parent = 8122 }, -- Mind Bomb
        { spellID = 15487,  duration = 45,  type = "cc", spec = { 258 } }, -- Silence
        { spellID = 204263, duration = 45,  type = "cc", spec = true }, -- Shining Force
        { spellID = 197268, duration = 60,  type = "immunity", spec = true, default = true }, -- Ray of Hope
        { spellID = 213602, duration = 45,  type = "immunity", spec = true }, -- Greater Fade
        { spellID = 47585,  duration = 120, type = "defensive", spec = { 258 }, default = true }, -- Dispersion
        { spellID = 108968, duration = 300, type = "defensive", spec = true, default = true }, -- Void Shift
        { spellID = 15286,  duration = 120, type = "defensive", spec = { 258 } }, -- Vampiric Embrace
        { spellID = 33206,  duration = 180, type = "defensive", spec = { 256 }, default = true }, -- Pain Suppression
        { spellID = 62618,  duration = 180, type = "defensive", spec = { 256 } }, -- Power Word: Barrier
        { spellID = 271466, duration = 180, type = "defensive", spec = true, parent = 62618 }, -- Luminous Barrier
        { spellID = 197590, duration = 90,  type = "defensive", spec = true, parent = 62618, parent2 = 271466, default = true }, -- Dome of Light (talentID)
        { spellID = 47788,  duration = 180, type = "defensive", spec = { 257 }, default = true }, -- Guardian Spirit
        { spellID = 47536,  duration = 90,  type = "offensive", spec = { 256 } }, -- Rapture
        { spellID = 197862, duration = 60,  type = "offensive", spec = true }, -- Archangel
        { spellID = 197871, duration = 60,  type = "offensive", spec = true }, -- Dark Archangel
        { spellID = 215769, duration = 180, type = "offensive", spec = 215982 }, -- Spirit of the Redeemer
        { spellID = 265202, duration = 720, type = "offensive", spec = true }, -- Holy Word: Salvation
        { spellID = 64843,  duration = 180, type = "offensive", spec = { 257 } }, -- Divine Hymn
        { spellID = 200183, duration = 120, type = "offensive", spec = true }, -- Apotheosis
        { spellID = 19236,  duration = 90,  type = "offensive", spec = { 256, 257} }, -- Desperate Prayer
        { spellID = 193223, duration = 180, type = "offensive", spec = true }, -- Surrender to Madness
        { spellID = 280711, duration = 60,  type = "offensive", spec = true }, -- Dark Ascension
        { spellID = 211522, duration = 45,  type = "offensive", spec = true }, -- Psyfiend
        { spellID = 263165, duration = 45,  type = "offensive", spec = true }, -- Void Torrent
        { spellID = 73325,  duration = 90,  type = "others" }, -- Leap of Faith
        { spellID = 305498, duration = 12,  type = "others", spec = true }, -- Premonition
        { spellID = 213610, duration = 30,  type = "others", spec = true }, -- Holy Ward
        { spellID = 32375,  duration = 45,  type = "others" }, -- Mass Dispel
        { spellID = 289657, duration = 44,  type = "others", spec = true }, -- Holy Word: Concetration
    },
    ["ROGUE"] = { -- 259(Assa), 260(Combat), 261(Sub)
        { spellID = 1766,   duration = 15,  type = "interrupt", default = true }, -- Kick
        { spellID = 2094,   duration = 120, type = "cc" }, -- Blind
        { spellID = 212182, duration = 180, type = "cc", spec = true }, -- Smoke Bomb
        { spellID = 207736, duration = 120, type = "cc", spec = true }, -- Shadowy Duel
        { spellID = 408,    duration = 20,  type = "cc", spec = { 259, 261 } }, -- Kidney Shot
        { spellID = 199804, duration = 30,  type = "cc", spec = { 260 } }, -- Between the Eyes
        { spellID = 31224,  duration = 120, type = "defensive", default = true }, -- Cloak of Shadows
        { spellID = 5277,   duration = 120, type = "defensive", spec = { 259, 261 }, default = true }, -- Evasion
        { spellID = 199754, duration = 120, type = "defensive", spec = { 260 }, default = true }, -- Riposte
        { spellID = 1856,   duration = 120, type = "defensive" }, -- Vanish
        { spellID = 207777, duration = 45,  type = "defensive", spec = true }, -- Dismantle
        { spellID = 79140,  duration = 120, type = "offensive", spec = { 259 } }, -- Vendetta
        { spellID = 121471, duration = 180, type = "offensive", spec = { 261 } }, -- Shadow Blades
        { spellID = 185313, duration = 60,  type = "offensive", spec = { 261 }, charges = 2 }, -- Shadow Dance
        { spellID = 213981, duration = 60,  type = "offensive", spec = true }, -- Cold Blood
        { spellID = 13750,  duration = 180, type = "offensive", spec = { 260 } }, -- Adrenaline Rush
        { spellID = 200806, duration = 45,  type = "offensive", spec = true }, -- Exsanguinate
        { spellID = 51690,  duration = 120, type = "offensive", spec = true }, -- Killing Spree
        { spellID = 198529, duration = 120, type = "offensive", spec = true }, -- Plunder Armor
        { spellID = 137619, duration = { default = 30, [260] = 60 }, type = "offensive", spec = true }, -- Marked for Death
        { spellID = 221622, duration = 30,  type = "offensive", spec = true }, -- Thick as Thieves (talentID)
        { spellID = 114018, duration = 360, type = "others" }, -- Shroud of Consealment
        { spellID = 195457, duration = 60,  type = "others", spec = { 260 } }, -- Grappling Hook
        { spellID = 2983,   duration = 60,  type = "others" }, -- Sprint
        { spellID = 36554,  duration = 30,  type = "others", spec = { 259, 261 }, charges = { [261] = 2, default = 1 } }, -- Shadowstep
    },
    ["SHAMAN"] = { -- 262(Ele), 263(Enh), 264(Resto)
        { spellID = 77130,  duration = 8,   type = "interrupt", spec = { 264 }, default = true }, -- Purify Spirit
        { spellID = 57994,  duration = 12,  type = "interrupt", default = true }, -- Wind Shear
        { spellID = 51514,  duration = 30,  type = "cc" }, -- Hex
        { spellID = 192058, duration = 60,  type = "cc" }, -- Capacitor Totem
        { spellID = 197214, duration = 40,  type = "cc", spec = true }, -- Sundering
        { spellID = 305483, duration = 30,  type = "cc", spec = true }, -- Lightning Lasso
        { spellID = 51490,  duration = 45,  type = "cc", spec = { 262 } }, -- Thunderstorm
        { spellID = 108271, duration = 90,  type = "defensive", default = true }, -- Astral Shift
        { spellID = 210918, duration = 60,  type = "defensive", spec = true, default = true, parent = 108271 }, -- Ethereal Form
        { spellID = 98008,  duration = 180, type = "defensive", spec = { 264 }, default = true }, -- Spirit Link Totem
        { spellID = 198838, duration = 60,  type = "defensive", spec = true, default = true }, -- Earthen Wall Totem
        { spellID = 207399, duration = 300, type = "defensive", spec = true }, -- Ancestral Protection Totem
        { spellID = 108281, duration = 120, type = "defensive", spec = { 262 } }, -- Ancestral Guidance
        { spellID = 108280, duration = 180, type = "offensive", spec = { 264 } }, -- Healing tide
        { spellID = 114050, duration = 180, type = "offensive", spec = true }, -- Ascendance (Ele)
        { spellID = 114051, duration = 180, type = "offensive", spec = true }, -- Ascendance (Enh)
        { spellID = 114052, duration = 180, type = "offensive", spec = true }, -- Ascendance (Res)
        { spellID = 2825,   duration = 300, type = "offensive", pve = true }, -- Bloodlust
        { spellID = 204361, duration = 60,  type = "offensive", spec = 193876, parent = 2825 }, -- Blood Lust w/ Shamanism
        { spellID = 51533,  duration = 120, type = "offensive", spec = { 263 } }, -- Feral Spirit
        { spellID = 210714, duration = 30,  type = "offensive", spec = true }, -- Icefury
        { spellID = 191634, duration = 60,  type = "offensive", spec = true }, -- Stormkeeper
        { spellID = 204330, duration = 40,  type = "offensive", spec = true }, -- Skyfury Totem
        { spellID = 204336, duration = 30,  type = "others", spec = true, default = true }, -- Grounding Totem
        { spellID = 8143,   duration = 60,  type = "others" }, -- Tremor Totem
        { spellID = 2484,   duration = 30,  type = "others" }, -- Earthbind Totem
        { spellID = 51485,  duration = 30,  type = "others", spec = true }, -- Earthgrab Totem
        { spellID = 192077, duration = 120, type = "others", spec = true }, -- Wind Rush Totem
        { spellID = 204331, duration = 45,  type = "others", spec = true }, -- Counterstrike Totem
        { spellID = 198067, duration = 150, type = "others", spec = { 262 } }, -- Fire Elemental
        { spellID = 198103, duration = 300, type = "others" }, -- Earth Elemental
        { spellID = 79206,  duration = 120, type = "others", spec = { 264 } }, -- Spiritwalker's Grace
        { spellID = 58875,  duration = 60,  type = "others", spec = { 263 } }, -- Spirit Walk
        { spellID = 196884, duration = 30,  type = "others", spec = true }, -- Feral Lunge
    },
    ["WARLOCK"] = { -- 265(Aff), 266(Demo), 267(Dest)
        { spellID = 119898, duration = 24,  type = "interrupt", default = true }, -- Command Demon
        { spellID = 212619, duration = 24,  type = "interrupt", spec = true, default = true }, -- Call Felhunter
        { spellID = 111898, duration = 90,  type = "cc", spec = true }, -- Grimoire: Felguard
        { spellID = 30283,  duration = 60,  type = "cc" }, -- Shadowfury
        { spellID = 6789,   duration = 45,  type = "cc", spec = true }, -- Mortal Coil
        { spellID = 104773, duration = 180, type = "defensive", default = true, }, -- Unending Resolve
        { spellID = 108416, duration = 60,  type = "defensive", spec = true, }, -- Dark Pact
        { spellID = 48020,  duration = 30,  type = "defensive", spec = 268358, default = true }, -- Demonic Circle: Teleport
        { spellID = 1122,   duration = 180, type = "offensive", spec = { 267 } },    -- Summon Infernal
        { spellID = 113860, duration = 120, type = "offensive", spec = true }, -- Dark Soul: Misery
        { spellID = 113858, duration = 120, type = "offensive", spec = true }, -- Dark Soul: Instability
        { spellID = 265187, duration = 90,  type = "offensive", spec = { 266 } }, -- Summon Demonic Tyrant
        { spellID = 267217, duration = 180, type = "offensive", spec = true }, -- Nether Portal
        { spellID = 201996, duration = 90,  type = "offensive", spec = true }, -- Call Observer
        { spellID = 212459, duration = 90,  type = "offensive", spec = true }, -- Call Fel Lord
        { spellID = 264119, duration = 45,  type = "offensive", spec = true }, -- Summon Vilefiend
        { spellID = 205180, duration = 180, type = "offensive", spec = { 265 } }, -- Summon Darkglare
        { spellID = 267171, duration = 60,  type = "offensive", spec = true }, -- Demonic Strength
        { spellID = 212295, duration = 45,  type = "others", spec = true }, -- Nether Ward
        { spellID = 221703, duration = 60,  type = "others", spec = true }, -- Casting Circle
        { spellID = 199954, duration = 45,  type = "others", spec = true }, -- Curse of Fragility
        { spellID = 80240,  duration = 30,  type = "others", spec = { 267 } }, -- Havoc
        { spellID = 200546, duration = 45,  type = "others", spec = true, parent = 80240 }, -- Bane of Havoc
    },
    ["WARRIOR"] = { -- 71(Arms), 72(Fury), 73(Prot)
        { spellID = 6552,   duration = 15,  type = "interrupt", default = true }, -- Pummel
        { spellID = 107570, duration = 30,  type = "cc", spec = true }, -- Stormbolt
        { spellID = 46968,  duration = 40,  type = "cc", spec = { 73 } }, -- Shockwave
        { spellID = 5246,   duration = 90,  type = "cc", default = true }, -- Intimidating Shout
        { spellID = 118038, duration = 180, type = "defensive", spec = { 71 }, default = true }, -- Die by the Sword
        { spellID = 184364, duration = 120, type = "defensive", spec = { 72 }, default = true }, -- Enraged Regeneration
        { spellID = 97462,  duration = 180, type = "defensive" }, -- Rallying Cry
        { spellID = 871,    duration = 240, type = "defensive", spec = { 73 } }, -- Shield Wall
        { spellID = 12975,  duration = 120, type = "defensive", spec = { 73 } }, -- Last Stand
        { spellID = 1160,   duration = 45,  type = "defensive", spec = { 73 } }, -- Demoralizing Shout
        { spellID = 236077, duration = 45,  type = "defensive", spec = true }, -- Disarm
        { spellID = 107574, duration = 90,  type = "offensive", spec = { 73 } }, -- Avatar
        { spellID = 107574, duration = 90,  type = "offensive", spec = true }, -- Avatar
        { spellID = 1719,   duration = 90,  type = "offensive", spec = { 72 } }, -- Recklessness
        { spellID = 227847, duration = 90,  type = "offensive", spec = { 71 } }, -- Bladestorm
        { spellID = 46924,  duration = 60,  type = "offensive", spec = true }, -- Bladestorm (F)
        { spellID = 152277, duration = 60,  type = "offensive", spec = true, parent = 227847 }, -- Ravager
        { spellID = 228920, duration = 60,  type = "offensive", spec = true }, -- Ravager (P)
        { spellID = 118000, duration = 35,  type = "offensive", spec = true }, -- Dragon Roar
        { spellID = 167105, duration = 45,  type = "offensive", spec = { 71 } }, -- Colossus Smash
        { spellID = 262161, duration = 45,  type = "offensive", spec = true, parent = 167105 }, -- Warbreaker
        { spellID = 280772, duration = 30,  type = "offensive", spec = true }, -- Siegebreaker
        { spellID = 198817, duration = 25,  type = "offensive", spec = true }, -- Sharpen Blade
        { spellID = 236273, duration = 60,  type = "others", spec = true }, -- Duel
        { spellID = 236320, duration = 90,  type = "others", spec = true, default = true }, -- War Banner
        { spellID = 216890, duration = 25,  type = "others", spec = true }, -- Spell Reflection
        { spellID = 23920,  duration = 25,  type = "others", spec = { 73 } }, -- Spell Reflection (P)
        { spellID = 213915, duration = 30,  type = "others", spec = true, parent = 23920 }, -- Mass Spell Reflection
        { spellID = 6544,   duration = 45,  type = "others" }, -- Heroic Leap
        { spellID = 18499,  duration = 60,  type = "others" }, -- Berserker Rage
    },
    ["TRINKET"] = {
        { spellID = 208683, duration = 120, spec = true, default = true }, -- Gladiator's Medallion
        { spellID = 214027, duration = 60,  spec = true, default = true }, -- Adaptation
        { spellID = 196029, duration = 0,   spec = true, default = true }, -- Relentless
        { spellID = 195710, duration = 180, default = true }, -- Honorable Medallion
    },
    ["RACIAL"] = {
        { spellID = 59752,  duration = 180, race =  1 }, -- Every Man for Himself
        { spellID = 20572,  duration = 120, race =  2 }, -- Blood Fury
        { spellID = 20594,  duration = 120, race =  3 }, -- Stoneform
        { spellID = 58984,  duration = 120, race =  4 }, -- Shadowmeld
        { spellID = 7744,   duration = 120, race =  5 }, -- Will of the Forsaken
        { spellID = 20549,  duration = 90,  race =  6 }, -- War Stomp
        { spellID = 20589,  duration = 60,  race =  7 }, -- Escape Artist
        { spellID = 26297,  duration = 180, race =  8 }, -- Berserking
        { spellID = 69070,  duration = 90,  race =  9 }, -- Rocket Jump
        { spellID = 129597, duration = 120, race = 10 }, -- Arcane Torrent (Monk version)
        { spellID = 59542,  duration = 180, race = 11 }, -- Gift of the Naaru
        { spellID = 68992,  duration = 120, race = 22 }, -- Darkflight
        { spellID = 107079, duration = 120, race = 25 }, -- Quaking Palm
        { spellID = 260364, duration = 180, race = 27 }, -- Arcane Pulse
        { spellID = 255654, duration = 120, race = 28 }, -- Bull Rush
        { spellID = 256948, duration = 180, race = 29 }, -- Spatial Rift
        { spellID = 255647, duration = 150, race = 30 }, -- Light's Judgment
        { spellID = 291944, duration = 150, race = 31 }, -- Regeneratin'
        { spellID = 287712, duration = 150, race = 32 }, -- Haymaker
        { spellID = 265221, duration = 120, race = 34 }, -- Fireblood
        { spellID = 274738, duration = 120, race = 36 }, -- Ancestral Call
    },
    ["ALL"] = {
        { spellID = 305252, duration = 120, type = "offensive", item = 167383, item2 = 165806 }, -- Gladistor's Maledict (Notorious/Sinister)
        { spellID = 286342, duration = 120, type = "defensive", item = 167384, item2 = 165807 }, -- Gladistor's Safeguard (Notorious/Sinister)
        { spellID = 295271, duration = 120, type = "defensive", item = 167865 }, -- Umbral Shell (Void Stone)
    },
    ["ESSENCES"] = {
        { spellID = 295373, duration = 30,  type = "offensive", item = 295373 }, -- The Crucible of Flame
        { spellID = 295186, duration = 60,  type = "offensive", item = 295186 }, -- Worldvein Resonance
        { spellID = 302731, duration = 60,  type = "others", item = 302731 }, -- Ripple in Space
        { spellID = 298357, duration = 120, type = "offensive", item = 298357 }, -- Memory of Lucid Dreams
        { spellID = 293019, duration = 60,  type = "defensive", item = 293019 }, -- Azeroth's Undying Gift
        { spellID = 294926, duration = 150, type = "defensive", item = 294926 }, -- Anima of Life and Death
        { spellID = 298168, duration = 120, type = "defensive", item = 298168 }, -- Aegis of the Deep
        { spellID = 295746, duration = 180, type = "defensive", item = 295746 }, -- Nullification Dynamo
        { spellID = 293031, duration = 60,  type = "defensive", item = 293031 }, -- Sphere of Suppression
        { spellID = 296197, duration = 15,  type = "defensive", item = 296197 }, -- The Well of Existence
        { spellID = 296094, duration = 180, type = "defensive", item = 296094 }, -- Artifice of Time
        { spellID = 293032, duration = 120, type = "defensive", item = 293032 }, -- Life-Binder's Invocation
        { spellID = 296072, duration = 30,  type = "defensive", item = 296072 }, -- The Ever-Rising Tide
        { spellID = 296230, duration = 60,  type = "defensive", item = 296230 }, -- Vitality Conduit
        { spellID = 295258, duration = 90,  type = "offensive", item = 295258 }, -- Essence of the Focusing Iris
        { spellID = 295840, duration = 180, type = "offensive", item = 295840 }, -- Condensed Life-Force
        { spellID = 297108, duration = 120, type = "offensive", item = 297108 }, -- Blood of the Enemy
        { spellID = 295337, duration = 60,  type = "offensive", item = 295337 }, -- Purification Protocol
        { spellID = 298452, duration = 60,  type = "offensive", item = 298452 }, -- The Unbound Force
    }
}

local specialBuffs = {
    [125174] = {0, 10},     -- Touch of Karma
    [209426] = {0, 7},      -- Cover of Darkness
    [11327]  = {0, 3},      -- Vanish
}
ns.specialBuffs = specialBuffs

do
    local iconFix = {
        [200166] = 1247262  -- Metamorphosis
    }

    local buffFix = {
        [287250] = 196770,  -- Dead of Winter
        [49028]  = 81256,   -- Dancing Rune Weapon
        [198589] = 212800,  -- Blur
        [227635] = 209426,  -- Cover of Darkness
        [200166] = 162264,  -- Metamorphosis
        [33891]  = 117679,  -- Incarnation: Tree of Life
        [122470] = 125174,  -- Touch of Karma
        [228049] = 228050,  -- Guardian of the Forgotten Queen
        [1856]   = 11327,   -- Vanish
        [185313] = 185422,  -- Shadow Dance
        [265187] = 265273,  -- Summon Demonic Tyrant (buff - Demonic Power)
        [267217] = 267218,  -- Nether Portal
        [97462]  = 97463    -- Rallying Cry
    }

    for k, v in pairs(spellList) do
        local n = #v
        for i = n, 1, -1 do
            local spell = v[i]
            local id = spell.spellID
            if not C_Spell.DoesSpellExist(id) then
                tremove(v, i)
                --print("Invalid ID: |cffffd700"..id)
            else
                local _, icon = GetSpellTexture(id)
                spell.icon = iconFix[id] or icon

                spell.class = k

                local buff = buffFix[id]
                if buff then
                    spell.buff = buff
                end
            end
        end
    end
end

ns.spellList = spellList
