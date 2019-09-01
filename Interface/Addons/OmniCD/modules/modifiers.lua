local _, ns = ...
local OmniCD = ns.OmniCD
local module = OmniCD:NewModule("Modifier", "AceEvent-3.0")

ns.modifier = {
    [275699] = { talent = 288848, duration = 45 },
    [47568]  = { talent = 233394, duration = 60 },
    [49028]  = { talent = 233412, duration = 60 },
    [48707]  = { talent = 205727, duration = 45 },
    [108199] = { talent = 206970, duration = 90 },
    [200166] = { talent = 235893, duration = 120 },
    [179057] = { talent = 206477, duration = 40 },
    [207684] = { talent = 209281, duration = 72 },
    [202137] = { talent = 209281, duration = 48 },
    [204596] = { talent = 209281, duration = 24 },
    [102342] = { talent = 197061, duration = 45 },
    [22812]  = { talent = 203965, duration = 60 },
    [61336]  = { talent = 203965, duration = 160 },
    [186289] = { talent = 266921, duration = 72 },
    [186257] = { talent = 266921, duration = 144 },
    [186265] = { talent = 266921, duration = 144 },
    [288613] = { talent = 203129, duration = 100 },
    [110960] = { talent = 210476, duration = 75 },
    [109132] = { talent = 115173, duration = 15 },
    [119381] = { talent = 264348, duration = 50 },
    [116849] = { talent = 202424, duration = 75 },
    [119996] = { talent = 216255, duration = 25 },
    [115203] = { talent = 202107, duration = 210 },
    [115176] = { talent = 202200, duration = 75 },
    [642]    = { talent = 114154, duration = 210 },
    [498]    = { talent = 114154, duration = 42 },
    [633]    = { talent = 114154, duration = 420 },
    [204018] = { talent = 216853, duration = 120 },
    [1022]   = { talent = 216853, duration = 200 },
    [6940]   = { talent = 216853, duration = 80 },
    [47788]  = { talent = 196602, duration = 120 },
    [8122]   = { talent = 196704, duration = 30 },
    [15487]  = { talent = 263716, duration = 30 },
    [73325]  = { talent = 196611, duration = 45 },
    [15286]  = { talent = 199855, duration = 75 },
    [47585]  = { talent = 288733, duration = 90 },
    [195457] = { talent = 256188, duration = 30 },
    [1856]   = { talent = 212081, duration = 75 },
    [2094]   = { talent = 256165, duration = 90 },
    [51490]  = { talent = 204403, duration = 30 },
    [51533]  = { talent = 262624, duration = 90 },
    [51514]  = { talent = 204268, duration = 10 },
    [79206]  = { talent = 192088, duration = 60 },
    [30283]  = { talent = 264874, duration = 45 },
    [227847] = { talent = 236308, duration = 60 },
    [97462]  = { talent = 235941, duration = 60 },
    [1160]   = { talent = 199023, duration = 30 },
    [6544]   = { talent = 202163, duration = 30 },
    [18562]  = { talent = 200383, duration = 22 },
    [740]    = { talent = 197073, duration = 120 },
    [235450] = { talent = 235463, duration = 0 },
    [108853] = { talent = 205029, duration = 10 }
}

ns.modifierB = {
    [186257] = { talent = 203235, ratio = .5  },
    [207684] = { talent = 211489, ratio = .75 },
    [202137] = { talent = 211489, ratio = .75 },
    [202138] = { talent = 211489, ratio = .75 },
    [204596] = { talent = 211489, ratio = .75 }
}

ns.chargeModifier = {
    [49576]  = { talent = 202727, charges = 2 },
    [122]    = { talent = 205036, charges = 2 },
    [109132] = { talent = 115173, charges = 3 },
    [1044]   = { talent = 199454, charges = 2 },
    [1022]   = { talent = 199454, charges = 2 },
    [190784] = { talent = 230332, charges = 2 },
    [2050]   = { talent = 235587, charges = 2 },
    [527]    = { talent = 196162, charges = 2 },
    [185313] = { talent = 238104, charges = 3 },
    [18562]  = { talent = 200383, charges = 2 },
    [100]    = { talent = 103827, charges = 2 },
    [7384]   = { talent = 262150, charges = 2 },
    [275779] = { talent = 204023, charges = 2 },
    [259489] = { talent = 269737, charges = 2 },
    [259495] = { talent = 264332, charges = 2 },
    [51505]  = { talent = 108283, charges = 2 },
    [5394]   = { talent = 108283, charges = 2 },
    [61295]  = { talent = 108283, charges = 2 },
    [108853] = { talent = 205029, charges = 2 }
}

ns.sharedTrinket = {
    [208683] = true,
    [214027] = true,
    [195710] = true
}

ns.sharedRacial = {
    [59752] = true,
    [20594] = true,
    [7744] = true,
    [265221] = true
}

ns.merged = {
    [196770] = { [287250] = 1  },
    [196718] = { [227635] = 1  },
    [189110] = { [205629] = 1  },
    [77764]  = { [77761]  = 1  },
    [106898] = { [77761]  = 1  },
    [198149] = { [84714]  = 1  },
    [30449]  = { [198100] = 1  },
    [199448] = { [199452] = 1  },
    [62618]  = { [197590] = 1  },
    [271466] = { [197590] = 1  },
    [57934]  = { [221622] = 1  },
    [211004] = { [51514]  = 1  },
    [210873] = { [51514]  = 1  },
    [211015] = { [51514]  = 1  },
    [211010] = { [51514]  = 1  },
    [277784] = { [51514]  = 1  },
    [269352] = { [51514]  = 1  },
    [277778] = { [51514]  = 1  },
    [32182]  = { [2825]   = 1  },
    [204362] = { [204361] = 1  },
    [25046]  = { [129597] = 1  },
    [28730]  = { [129597] = 1  },
    [50613]  = { [129597] = 1  },
    [69179]  = { [129597] = 1  },
    [80483]  = { [129597] = 1  },
    [155145] = { [129597] = 1  },
    [202719] = { [129597] = 1  },
    [19647]  = { [119898] = 24 },
    [119910] = { [119898] = 24 },
    [132409] = { [119898] = 24 },
    [212623] = { [119898] = 15 },
    [6358]   = { [119898] = 30 },
    [261589] = { [119898] = 30 },
    [89808]  = { [119898] = 15 },
    [119905] = { [119898] = 15 },
    [132411] = { [119898] = 15 },
    [89766]  = { [119898] = 30 },
    [119914] = { [119898] = 30 },
    [53271]  = { [272651] = 45 },
    [272682] = { [272651] = 45 },
    [272678] = { [272651] = 360},
    [264735] = { [272651] = 180},
    [281195] = { [272651] = 180},
    [272679] = { [272651] = 180}
}

for spellID, spell in pairs(ns.merged) do
    for id in pairs(spell) do
        if id == 272651 or id == 119898 then
            local _, icon = GetSpellTexture(spellID)
            spell.icon = icon
        end
    end
end

ns.reducer = {
    [47541]  = { target = {[275699]=1,[42650]=5,[63560]=1}, talent = 276837, default = 63560 },
    [207317] = { target = {[275699]=1,[42650]=5,[63560]=1}, talent = 276837, default = 63560 },
    [185358] = { target = 288613, talent = 260404, duration = 2.5 },
    [257620] = { target = 288613, talent = 260404, duration = 2.5 },
    [193455] = { target = 19574,  talent = 257891, duration = 1 },
    [217200] = { target = 19574, duration = 12 },
    [19434]  = { target = {[186265]=5,[109304]=5}, talent = 248443 },
    [133]    = { target = 190319, talent = 203283, duration = 5 },
    [275773] = { target = 853,    talent = 198054, duration = 10 },
    [275779] = { target = 853,    talent = 198054, duration = 6 },
    [53600]  = { target = {[31884]=3,[184092]=3}, talent = 204074 },
    [585]    = { target = 88625,  talent = 196985, duration = 5.32, base = 4 },
    [139]    = { target = 34861,  talent = 196985, duration = 2.66, base = 2 },
    [596]    = { target = 34861,  talent = 196985, duration = 8, base = 6 },
    [2060]   = { target = 2050,   talent = 196985, duration = 8, base = 6 },
    [2061]   = { target = 2050,   talent = 196985, duration = 8, base = 6 },
    [2050]   = { target = 265202, duration = 30 },
    [34861]  = { target = 265202, duration = 30 },
    [32546]  = { target = {[2050]=3,[34861]=3}, talent = 32546 },
}

ns.resetter = {
    [235219] = {
        [120] = true,
        [45438] = true,
        [122] = true,
        [11426] = true
    }
}

ns.noSync = {
    [49998]  = { target = 55233,  talent = 205723, duration = 4.5 },
    [61999]  = { target = 55233,  talent = 205723, duration = 3 },
    [186270] = { target = 109304, talent = 270581, duration = 1.5 },
    [259387] = { target = 109304, talent = 270581, duration = 1.5 },
    [187708] = { target = 109304, talent = 270581, duration = 1.75 },
    [212436] = { target = 109304, talent = 270581, duration = 1.5 },
    [195645] = { target = 109304, talent = 270581, duration = 1.5 },
    [259391] = { target = 109304, talent = 270581, duration = 1.5 },
    [34026]  = { target = 109304, talent = 270581, duration = 1 },
    [259491] = { target = 109304, talent = 270581, duration = 1 },
    [271788] = { target = 109304, talent = 270581, duration = 0.5 },
    [131894] = { target = 109304, talent = 270581, duration = { [255] = 1.5, default = 1 } },
    [203155] = { target = 109304, talent = 270581, duration = 2 },
    [185358] = { target = 109304, talent = 270581, duration = 0.75 },
    [19434]  = { target = 109304, talent = 270581, duration = 1.5 },
    [212431] = { target = 109304, talent = 270581, duration = 1 },
    [198670] = { target = 109304, talent = 270581, duration = 1.75 },
    [186387] = { target = 109304, talent = 270581, duration = 0.5 },
    [2643]   = { target = 109304, talent = 270581, duration = 1.33 },
    [257620] = { target = 109304, talent = 270581, duration = 0.75 },
    [120360] = { target = 109304, talent = 270581, duration = { [254] = 1.5, [253] = 2 } },
    [208652] = { target = 109304, talent = 270581, duration = 1 },
    [205691] = { target = 109304, talent = 270581, duration = 2 },
    [193455] = { target = 109304, talent = 270581, duration = 1.17 },
    [120679] = { target = 109304, talent = 270581, duration = 0.83 },
    [982]    = { target = 109304, talent = 270581, duration = { [253] = 1.17, default = 1.75 } },
    [100784] = { target = 137639, talent = 280197, duration = 0.5 },
    [107428] = { target = 137639, talent = 280197, duration = 1 },
    [101546] = { target = 137639, talent = 280197, duration = 1 },
    [113656] = { target = 137639, talent = 280197, duration = 1.5 },
    [116847] = { target = 137639, talent = 280197, duration = 0.5 },
    [85256]  = { target = 853,    talent = 234299, duration = 6 },
    [53385]  = { target = 853,    talent = 234299, duration = 6 },
    [210191] = { target = 853,    talent = 234299, duration = 6 },
    [215661] = { target = 853,    talent = 234299, duration = 10 },
    [84963]  = { target = 853,    talent = 234299, duration = 6 },
    [2098]   = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
    [193316] = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
    [5171]   = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
    [269513] = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
    [199804] = { target = {           [13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
    [196819] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
    [195452] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
    [280719] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
    [408]    = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
    [156527] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
    [12323]  = { target = 1719,   talent = 152278, duration = 0.5 },
    [184367] = { target = 1719,   talent = 152278, duration = 4.25 },
    [1715]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = .5 },
    [772]    = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1 },
    [12294]  = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1 },
    [163201] = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1 },
    [1680]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1 },
    [1464]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1 },
    [190456] = { target = {[107574]=1,[871]=1,[12975]=1,[1160]=1}, talent = 152278, duration = 1 },
    [2565]   = { target = {[107574]=1,[871]=1,[12975]=1,[1160]=1}, talent = 152278, duration = 1 },
    [202168] = { target = {[1719]=1,[262161]=1,[167105]=1,[50622]=1,[107574]=1,[871]=1,[12975]=1,[1160]=1},talent=152278,duration={[73]=1,default=.5} }
}

ns.sync = {
    [55233]  = { duration = 0.1, talent = 205723 },
    [109304] = { duration = { default = .05, [253] = .033 }, talent = 270581 },
    [137639] = { duration = 0.5, talent = 280197 },
    [853]    = { duration = { [70] = 2 }, talent = 198054 },
    [199804] = { duration = 1 },
    [13750]  = { duration = 1 },
    [195457] = { duration = 1 },
    [51690]  = { duration = 1 },
    [137619] = { duration = { [260] = 1 } },
    [2983]   = { duration = { [260] = 1 } },
    [1856]   = { duration = { [260] = 1 } },
    [185313] = { duration = 2.5, talent = 238104, base = 1.5 },
    [1719]   = { duration = .05, talent = 152278 },
    [167105] = { duration = .05, talent = 152278 },
    [262161] = { duration = .05, talent = 152278 },
    [227847] = { duration = .05, talent = 152278 },
    [107574] = { duration = { [73] = 0.1 }, talent = 152278 },
    [871]    = { duration = 0.1, talent = 152278 },
    [12975]  = { duration = 0.1, talent = 152278 },
    [1160]   = { duration = 0.1, talent = 152278 }
}

ns.azeriteModifier = {
    [48792]  = { azeriteID = 288424, duration = 15},
    [48265]  = { azeriteID = 280011, duration = 5 },
    [109304] = { azeriteID = 287938, duration = 15},
    [116849] = { azeriteID = 277667, duration = 20},
    [190784] = { azeriteID = 280017, duration = 5 },
    [-1]     = { azeriteID = 273338, duration = 0 },
    [-2]     = { azeriteID = 278541, duration = 0 },
    [12051]  = { azeriteID = 273330, charges = 2 }
}

for _, spell in pairs(ns.azeriteModifier) do
    local name = GetSpellInfo(spell.azeriteID)
    spell.name = name
end

local modifierIDs = {}
for _, v in ipairs({ns.sharedTrinket, ns.sharedRacial, ns.merged, ns.reducer, ns.resetter, ns.noSync}) do
    for spellID in pairs(v) do
        modifierIDs[spellID] = true
    end
end

do
    local essIDs = {
        [2]  = {293019,294668, 298080,298082, 298081,298083, 298081,298083},
        [3]  = {293031,294910, 300009,300012, 300010,300013, 300010,300013},
        [4]  = {295186,295078, 298628,298627, 299334,299333, 299334,299333},
        [5]  = {295258,295246, 299336,299335, 299338,299337, 299338,299337},
        [6]  = {295337,295293, 299345,299343, 299347,299346, 299347,299346},
        [7]  = {294926,294964, 300002,300004, 300003,300005, 300003,300005},
        [12] = {295373,295365, 299349,299348, 299353,299350, 299353,299350},
        [13] = {295746,295750, 300015,300018, 300016,300020, 300016,300020},
        [14] = {295840,295834, 299355,299354, 299358,299357, 299358,299357},
        [15] = {302731,302916, 302982,302984, 302983,302985, 302983,302985},
        [17] = {296072,296050, 299875,299878, 299876,299879, 299876,299879},
        [18] = {296094,296081, 299882,299885, 299883,299887, 299883,299887},
        [19] = {296197,296136, 299932,299935, 299933,299936, 299933,299936},
        [20] = {293032,296207, 299943,299939, 299944,299940, 299944,299940},
        [21] = {296230,303448, 299958,303474, 299959,303476, 299959,303476},
        [22] = {296325,296320, 299368,299367, 299370,299369, 299370,299369},
        [23] = {297108,297147, 298273,298274, 298277,298275, 298277,298275},
        [25] = {298168,298193, 299273,299274, 299275,299277, 299275,299277},
        [27] = {298357,298268, 299372,299371, 299374,299373, 299374,299373},
        [28] = {298452,298407, 299376,299375, 299378,299377, 299378,299377},
        [32] = {303823,304081, 304088,304089, 304121,304123, 304121,304123}
    }

    local essRanked = {}
    for k, v in pairs(essIDs) do
        if k ~= 22 or k ~= 32 then
            for i = 1, 2 do
                local rank = v[(i-1)*2+3]
                essRanked[rank] = v[1]
            end
        end
    end
    ns.essRanked = essRanked

    local essInfo = {}
    for k, v in pairs(essIDs) do
        local essLink = C_AzeriteEssence.GetEssenceHyperlink(k, 1)
        if essLink and essLink ~= "" then
            essLink = essLink:match("%[(.-)%]"):gsub("%-","%%-")

            local currData = { name = essLink }
            for i = 1, 4 do
                for j = 0, 1 do
                    local spellID = v[(i-1)*2+1+j]
                    currData[j == 0 and i or -i] = spellID
                end
            end
            essInfo[#essInfo+1] = currData
        end
    end
    ns.essInfo = essInfo
end

ns.essCDFix = {
    [293019] = 15,
    [293031] = 15,
    [294926] = 30,
    [295746] = 42,
    [296230] = 15,
    [297108] = 30,
    [298168] = 30,
    [298452] = 15
}

ns.essConflict = {
    [303823] = true,
    [304088] = true,
    [304121] = true
}

ns.essTalentsBySpec = {
    [62]  = 198111,
    [63]  = 198111,
    [64]  = 198111,
    [65]  = 210294,
    [66]  = nil,
    [70]  = nil,
    [71]  = 198817,
    [72]  = nil,
    [73]  = nil,
    [102] = 305497,
    [103] = 305497,
    [104] = nil,
    [105] = 203651,
    [250] = 202727,
    [251] = 305392,
    [252] = nil,
    [253] = 236776,
    [254] = 236776,
    [255] = 236776,
    [256] = 305498,
    [257] = 213610,
    [258] = 108968,
    [259] = nil,
    [260] = nil,
    [261] = nil,
    [262] = 305483,
    [263] = nil,
    [264] = nil,
    [265] = nil,
    [266] = 212295,
    [267] = nil,
    [268] = nil,
    [269] = 287771,
    [270] = 216113,
    [577] = 235893,
    [581] = nil
}

ns.essStrive = {
    [296320] = true,
    [299367] = true,
    [299369] = true
}

ns.essModifiers = {
    [275699] = true,
    [47568]  = true,
    [55233]  = true,
    [200166] = true,
    [187827] = true,
    [193530] = true,
    [266779] = true,
    [288613] = true,
    [194223] = true,
    [102560] = true,
    [106951] = true,
    [102543] = true,
    [61336]  = true,
    [740]    = true,
    [12042]  = true,
    [190319] = true,
    [12472]  = true,
    [115203] = true,
    [115310] = true,
    [137639] = true,
    [152173] = true,
    [31884]  = true,
    [216331] = true,
    [231895] = true,
    [64843]  = true,
    [34433]  = true,
    [123040] = true,
    [13750]  = true,
    [121471] = true,
    [79140]  = true,
    [51533]  = true,
    [198067] = true,
    [108280] = true,
    [192249] = true,
    [205180] = true,
    [265187] = true,
    [1122]   = true,
    [107574] = true,
    [227847] = true,
    [152277] = true,
    [1719]   = true,
}

ns.essModifierSpecs = {
    [61336]  = 104,
    [107574] = 73
}

local auraRemoved = {
    [202425] = 45,
    [199483] = 60,
    [248518] = 45,
    [205025] = 60,
    [210294] = 25,
    [215652] = 45,
    [213981] = 60,
    [210918] = 45,
    [256948] = 180,
    [198817] = 25
}
ns.auraRemoved = auraRemoved

local auraApplied = {
    [283167] = 214027,
    [209261] = 209258,
    [123981] = 114556,
    [286342] = 286342,
}
ns.auraApplied = auraApplied

local totem = {
    [118905] = {
        target = 192058,
        talent = 265046,
        duration = 5,
        max = 4
    }
}

local damage = {
    [190357] = {
        target = 84714,
        duration = 0.5
    },
    [46968]  = {
        target = 46968,
        talent = 275339,
        duration = 15,
        min = 3
    }
}

local critDamage = {
    [49143]  = {
        target = 51271,
        talent = 207126,
        duration = 2
    },
    [49020]  = {
        target = 51271,
        talent = 207126,
        duration = 2
    },
    [133]    = {
        target = 190319,
        talent = 155148,
        duration = 1
    },
    [11366]  = {
        target = 190319,
        talent = 155148,
        duration = 1
    },
    [108853] = {
        target = 190319,
        talent = 155148,
        duration = 1
    },
    [257541] = {
        target = 190319,
        talent = 155148,
        duration = 1
    }
}

local energize = {
    [193840] = {
        target = 200166,
        talent = 258887,
        duration = 3
    }
}

local interrupt = {
    [93985]  = {
        target = {
            [5217] = 1,
            [77761] = 1,
            [61336] = 1,
        },
        talent = 205673,
        duration = 10
    }
}

local azeriteReducer = {

    [5221]   = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [106830] = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [106785] = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [274837] = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [1822]   = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [202028] = { target = { [106951]=0.3,[102543]=0.2 }, azeriteID = 273338 },
    [30455]  = { target = { [84714]=0.5 }, azeriteID = 278541 }
}

local groupInfo = ns.groupInfo
local partyBars = ns.partyBars

local Party = OmniCD:GetModule("Party")
local totemGUID = {}
ns.totemGUID = totemGUID

function module:OnInitialize()
    self:SetEnabledState(false)
end

function module:OnEnable()
    self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

do
    local APOTHEOSIS = 200183
    local TRUE_BREARING = 193359

    local registeredEvents = setmetatable({}, {__index=function(t, k)
        t[k] = {}
        return t[k]
    end})

    local function StartCooldownByAuraRemoved(sourceGUID, spellID)
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == spellID then
                Party:StartCooldown(icon, auraRemoved[spellID])
                groupInfo[icon.guid][icon.spellID] = false
                icon.icon:SetVertexColor(1, 1, 1)
                return
            end
        end
    end
    for k in pairs(auraRemoved) do
        registeredEvents.SPELL_AURA_REMOVED[k] = StartCooldownByAuraRemoved

    end

    registeredEvents.SPELL_AURA_REMOVED[TRUE_BREARING] = function(sourceGUID)
        groupInfo[sourceGUID].trueBearing = false
    end

    registeredEvents.SPELL_AURA_REMOVED[APOTHEOSIS] = function(sourceGUID)
        groupInfo[sourceGUID].apotheosis = false
    end

    local function CheckSpellByAuraApplied(sourceGUID, spellID)
        local index = groupInfo[sourceGUID].index
        Party:CheckSpell(auraApplied[spellID], index)
    end
    for k in pairs(auraApplied) do
        registeredEvents.SPELL_AURA_APPLIED[k] = CheckSpellByAuraApplied
    end

    registeredEvents.SPELL_AURA_APPLIED[118905] = function(sourceGUID, spellID)
        sourceGUID = totemGUID[sourceGUID]
        local spell = totem[spellID]
        if spell.talent and not Party:IsTalent(spell.talent, sourceGUID) then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == spell.target then
                if icon.active then
                    if spell.max then
                        if groupInfo[sourceGUID].active[icon.spellID].init_Time - groupInfo[sourceGUID].active[icon.spellID].startTime >= spell.duration * spell.max then return end
                    end
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - spell.duration)
                end
                return
            end
        end
    end

    registeredEvents.SPELL_AURA_APPLIED[TRUE_BREARING] = function(sourceGUID)
        groupInfo[sourceGUID].trueBearing = 1
    end

    registeredEvents.SPELL_AURA_APPLIED[APOTHEOSIS] = function(sourceGUID)
        groupInfo[sourceGUID].apotheosis = true
    end

    registeredEvents.SPELL_SUMMON[192058] = function(sourceGUID, _, destGUID)
        totemGUID[destGUID] = sourceGUID
    end

    local function CooldownReductionByDamage(sourceGUID, spellID)
        local spell = damage[spellID]
        if spell.talent and not Party:IsTalent(spell.talent, sourceGUID) then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == spell.target then
                if icon.active then
                    if spell.min then
                        groupInfo[sourceGUID].active[icon.spellID].count = groupInfo[sourceGUID].active[icon.spellID].count + 1
                        if groupInfo[sourceGUID].active[icon.spellID].count ~= spell.min then return end
                    end
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - spell.duration)
                end
                return
            end
        end
    end
    for k in pairs(damage) do
        registeredEvents.SPELL_DAMAGE[k] = CooldownReductionByDamage
    end

    local function CooldownReductionByCrit(sourceGUID, spellID, _, critical)
        if not critical then return end
        local spell = critDamage[spellID]
        if spell.talent and not Party:IsTalent(spell.talent, sourceGUID) then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == spell.target then
                if icon.active then
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - spell.duration)
                end
                return
            end
        end
    end
    for k in pairs(critDamage) do
        registeredEvents.SPELL_DAMAGE[k] = CooldownReductionByCrit
    end

    registeredEvents.SPELL_ENERGIZE[193840] = function(sourceGUID, spellID)
        local spell = energize[spellID]
        if spell.talent and not Party:IsTalent(spell.talent, sourceGUID) then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == spell.target then
                if icon.active then
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - spell.duration)
                end
                return
            end
        end
    end

    registeredEvents.SPELL_INTERRUPT[93985] = function(sourceGUID, spellID)
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.active then
                local reducedTime = Party:FindReducedTime(icon, interrupt[spellID])
                if reducedTime then
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - reducedTime)
                end
            end
        end
    end

    registeredEvents.SPELL_AURA_APPLIED[47788] = function(sourceGUID)
        groupInfo[sourceGUID].saved = nil
    end

    registeredEvents.SPELL_AURA_REMOVED[47788] = function(sourceGUID)
        if not groupInfo[sourceGUID].talentIDs or not groupInfo[sourceGUID].talentIDs[200209] or groupInfo[sourceGUID].saved then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == 47788 then
                if icon.active then
                    Party:StartCooldown(icon, 60)
                end
                return
            end
        end
    end

    registeredEvents.SPELL_HEAL[48153] = function(sourceGUID)
        groupInfo[sourceGUID].saved = true
    end

    registeredEvents.SPELL_DAMAGE[283810] = function(sourceGUID)
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            if icon.spellID == 1719 then
                if icon.active then
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - 0.1)
                end
                return
            end
        end
    end

    local function CooldownReductionByAzerite(sourceGUID, spellID)
        local spell = azeriteReducer[spellID]
        if not groupInfo[sourceGUID].slotIDs or not groupInfo[sourceGUID].slotIDs[spell.azeriteID] then return end
        local index = groupInfo[sourceGUID].index
        for i = 1, partyBars[index].usedIcons do
            local icon = partyBars[index].icons[i]
            local reducedTime = spell.target[icon.spellID]
            if reducedTime then
                if icon.active then
                    Party:UpdateCooldown(icon, groupInfo[sourceGUID].active[icon.spellID].startTime - reducedTime)
                end
                return
            end
        end
    end
    for k in pairs(azeriteReducer) do
        registeredEvents.SPELL_CAST_SUCCESS[k] = CooldownReductionByAzerite
    end

    setmetatable(registeredEvents, nil)

    local COMBATLOG_OBJECT_AFFILIATION_PARTY = COMBATLOG_OBJECT_AFFILIATION_PARTY
    local COMBATLOG_OBJECT_AFFILIATION_RAID = COMBATLOG_OBJECT_AFFILIATION_RAID
    local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE
    local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
    local band = bit.band
    local group = bit.bor(COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_RAID)

    function module:COMBAT_LOG_EVENT_UNFILTERED()
        local _, event, _, sourceGUID, Na, sourceFlags, _, destGUID, Dna,_,_, spellID, _,_,_,_,_,_,_,_, critical = CombatLogGetCurrentEventInfo()

        if band(sourceFlags, group) > 0 or (not Party.playerDisabled and band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0) then
            local func = registeredEvents[event] and registeredEvents[event][spellID]
            if func and (groupInfo[sourceGUID] or totemGUID[sourceGUID]) then
                func(sourceGUID, spellID, destGUID, critical)
            end

            if OmniCD.db.profile.Party.glowBuffs and event == "SPELL_AURA_REMOVED" then
                if groupInfo[destGUID] and groupInfo[destGUID].glow and groupInfo[destGUID].glow[spellID] then
                    if destGUID == sourceGUID then
                        Party:RemoveHighlight(destGUID, spellID)
                    end
                end
            end
        end
    end
end

do
    local validUnits = {
        party1 = 1,
        party2 = 2,
        party3 = 3,
        party4 = 4,
        player = 5,
        partypet1 = 1,
        partypet2 = 2,
        partypet3 = 3,
        partypet4 = 4,
        pet = 5
    }

    local validRaidUnits = {}
    for i = 1, 40 do
        validRaidUnits["raid"..i] = i
        validRaidUnits["raidpet"..i] = i
    end

    function module:UNIT_SPELLCAST_SUCCEEDED(_, unit, _, spellID)
        local index = not Party.isInRaid and validUnits[unit] or (Party.isInRaid and validRaidUnits[unit])
        if not index or (Party.playerDisabled and index == groupInfo[ns.playerGUID].index) then return end

        if Party.enabledIDs[spellID] or modifierIDs[spellID] then
            Party:CheckSpell(spellID, index)
        end
    end
end
