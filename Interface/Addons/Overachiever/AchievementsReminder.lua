function ralldatabase()


--locations
ralllocations={604,604,543,543,529,529,535,535,527,527,718,718,532,532,531,531,609,609,522,533,521,542,534,530,603,602,601,520,528,536,525,526,523,524,756,764,767,753,768,769,757,759,747,752,754,758,773,781,793,800,820,819,816,824,443,461,401,482,512,540,736,626,871,874,898,876,867,885,877,875,887,897,896,886,878,899,884,900,880,851,882,856,912,911,883,914,930,937,939,940,938,953,964,987,984,989,995,993,1008,969,994,988,1026,
1081,1087,1067,1046,1041,1042,1065,1079,1045,1066,1094,1088,1114,1115,9999999,1147}

ralllocationnamesdef={"Icecrown Citadel","Icecrown Citadel","Trial of the Crusader", "Trial of the Crusader", "Ulduar", "Ulduar", "Naxxramas","Naxxramas","The Eye of Eternity","The Eye of Eternity","Onyxia's Lair","Onyxia's Lair","Vault of Archavon","Vault of Archavon","The Obsidian Sanctum","The Obsidian Sanctum","The Ruby Sanctum","The Ruby Sanctum","Ahn'kahet: The Old Kingdom","Azjol-Nerub","The Culling of Stratholme","Trial of the Champion","Drak'Tharon Keep","Gundrak","Halls of Reflection","Pit of Saron","The Forge of Souls","The Nexus","The Oculus","The Violet Hold","Halls of Lightning","Halls of Stone","Utgarde Keep","Utgarde Pinnacle", "The Deadmines","Shadowfang Keep","Throne of the Tides","Blackrock Caverns","The Stonecore","The Vortex Pinnacle","Grim Batol","Halls of Origination","Lost City of the Tol'vir","Baradin Hold","Blackwing Descent","The Bastion of Twilight","Throne of the Four Winds","Zul'Aman","Zul'Gurub", "Firelands","End Time","Hour of Twilight","Well of Eternity","Dragon Soul","Warsong Gulch","Arathi Basin","Alterac Valley","Eye of the Storm","Strand of the Ancients","Isle of Conquest","The Battle for Gilneas","Twin Peaks","Scarlet Halls","Scarlet Monastery","Scholomance","Stormstout Brewery","Temple of the Jade Serpent","Mogu'shan Palace","Shado-Pan Monastery","Gate of the Setting Sun","Siege of Niuzao Temple","Heart of Fear","Mogu'shan Vaults","Terrace of Endless Spring","A Brewing Storm", "Arena of Annihilation","Brewmoon Festval","Crypt of Forgotten Kings","Greenstone Village","Theramore's Fall","Unga Ingoo","Temple of Kotmogu","A Little Patience","Lion's Landing","Zan'vess","Dagger in the Dark","Throne of Thunder","Dark Heart of Pandaria","Blood in the Snow","Battle on the High Seas","The Secrets of Ragefire","Siege of Orgrimmar","Bloodmaul Slag Mines","Iron Docks","Auchindoun","Skyreach","Upper Blackrock Spire","Grimrail Depot","The Everbloom","Shadowmoon Burial Grounds","Highmaul","Blackrock Foundry","Hellfire Citadel",
"Black Rook Hold","Court of Stars","Darkheart Thicket","Eye of Azshara","Halls of Valor","Maw of Souls","Neltharion's Lair","The Arcway","Vault of the Wardens","Violet Hold","The Emerald Nightmare","The Nighthold","Trial of Valor","Return to Karazhan","Cathedral of Eternal Night","Tomb of Sargeras"}

rallexpansions={"PVP","Wotlk","Cataclysm","Pandaria","WoD","Legion"}

rallcontent={2,2,2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2,2,2, 2,2,2,2,3,3,3,3,3,3, 3,3,3,3,3,3,3,3,3,3, 3,3,3,3,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6}

ralltip={"10","25","10","25","10","25","10","25","10","25","10","25","10","25","10","25","10","25","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5","5",ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifraid,ralldifraid,ralldifraid,ralldifraid,ralldifparty,ralldifparty,ralldifraid,ralldifparty,ralldifparty,ralldifparty,ralldifraid, ramainbattleground,ramainbattleground,ramainbattleground,ramainbattleground,ramainbattleground,ramainbattleground,ramainbattleground,ramainbattleground,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifraid,ralldifraid,ralldifraid,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ramainbattleground,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ralldifraid,ralldifscenario,ralldifscenario,ralldifscenario,ralldifscenario,ralldifraid,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifraid,ralldifraid,ralldifraid,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifparty,ralldifraid,ralldifraid,ralldifraid,ralldifparty,ralldifparty,ralldifraid}

rallachieve={
{4534,4535,4536,4537,4577,4538,4578,4582,4539,4579,4580,4601,4581,4531,4628,4528,4629,4529,4630,4527,4631,4530,4583,4532,4636},--icc10
{4610,4611,4612,4613,4615,4614,4616,4617,4618,4619,4620,4621,4622,4604,4632,4605,4633,4606,4634,4607,4635,4597,4584,4608,4637},--icc25
{3797,3936,3996,3798,3799,3800,3917,3918}, --toc10
{3813,3937,3997,3815,3816,3916,3812}, --toc25
{3097,2907,2905,2909,2911,2913,2914,2915,3056,2927,2925,2930,2923,2919,2934,2931,2933,2937,3058,2886,2947,2940,2941,2939,2945,2955,2959,2953,2951,3006,3076,2888,2969,2963,2961,2967,3182,2971,2973,2975,2977,3176,2979,2980,2985,2982,3177,3178,3179,2989,3138,3180,2890,2996,3181,3014,3009,3015,3008,3012,3157,3141,3158,3159,2892,2894,3003,3036},
{3098,2908,2906,2910,2912,2918,2916,2917,3057,2928,2926,2929,2924,2921,2936,2932,2935,2938,3059,2887,2948,2943,2944,2942,2946,2956,2960,2954,2952,3007,3077,2889,2970,2965,2962,2968,3184,2972,2974,2976,2978,3183,3118,2981,2984,2983,3185,3186,3187,3237,2995,3189,2891,2997,3188,3017,3011,3016,3010,3013,3161,3162,3163,3164,2893,2895,3002,3037},
{1858,1997,562,1996,2182,566,2176,568,1856,2178,2180,564,2146,572,2184,574,576,578},--naxx10
{1859,2140,563,2139,2183,567,2177,569,1857,2179,2181,565,2147,573,2185,575,577,579},--naxx25
{2148,622,1869,1874},--malygos10
{2149,623,1870,1875},--malygos25
{4402,4404,4403,4396},--onyxia10
{4405,4407,4406,4397},--onyxia25
{4016},--arka10
{4017},--arka25
{2047,1876,624,2049,2050,2051},--sart10
{2048,625,1877,2052,2053,2054},--sart25
{4817,4818},--halion10
{4815,4816},--halion25
{2038,2056,1862,492},--ankahet
{1296,1297,1860,491},--azjol
{1872,1817,500},--strat
{3802,3803,3804},--colis5
{2151,2057,2039,493},--draktaron
{2058,2040,1864,2152,495},--gundrak
{4526,4521},--reflect
{4524,4525,4520},--PitOfSaron
{4522,4523,4519},--ForgeOfSouls
{2150,2037,2036,490},--nexus
{2044,2045,2046,1871,1868,498},--oculus
{2153,2041,1816,494,1865},--VioletHold
{1834,2042,1867,497},--HallsOfLighting
{2154,1866,2155,496},--HallsOfStone
{1919,489},--utgard5
{2043,1873,2156,2157,499},--utgard5
{5366,5367,5368,5369,5370,5371,5083},--The Deadmines
{5503,5504,5505,5093},--Shadowfang Keep
{5285,5286,5061},--Throne of the Tides
{5281,5282,5283,5284,5060},--Blackrock Caverns
{5287,5063},--The Stonecore
{5289,5288,5064},--The Vortex Pinnacle
{5297,5298,5062},--Grim Batol
{5293,5294,5296,5295,5065},--Halls of Origination
{5291,5290,5292,5066},--Lost City of the Tol'vir
{5416,6045,6108},--Baradin Hold
{5306,5307,5310,5308,5309,4849,4842,5094,5107,5108,5109,5115,5116},--Blackwing Descent
{5300,4852,5311,5312,0,4850,5118,5117,5119,5120,5121},--The Bastion of Twilight
{5304,5305,4851,5122,5123},--Throne of the Four Winds
{5761,5750,5858,5760,5769},--Zul'Aman
{5743,5762,5765,5759,5744,5768},--Zul'Gurub
{5821,5810,5813,5829,5830,5799,5855,5807,5808,5809,5806,5805,5804,5803,5802},--Firelands
{6130,5995,6117},--End Time
{6132,6119},--Hour of Twilight
{6127,6070,6118},--Well of Eternity
{6174,6128,6129,6175,6084,6105,6133,6180,6106,6107,6177,6109,6110,6111,6112,6113,6114,6115,6116},--Dragon Soul
{199,872,204,1251,200,1259,1502,207,712,1252,201,168,167,166,1173}, --warsong
{583,584,165,155,154,73,710,159,158,1153,161,156,157,162,1170},--arathi
{221,582,219,218,1164,706,873,708,224,226,223,1166,222,1168},--alterac
{233,216,784,209,208,214,212,211,213,587,1258,783,1171},--Eye of the Storm
{2191,1766,2189,1763,2200,2190,1764,2193,2192,1765,1310,1309,1761,1308,2195},--Strand of the Ancients
{3848,3849,3853,3854,3852,4256,3847,3855,3845,3777,3776,4177,3850,4176,3957},--Isle of Conquest
{5256,5257,5247,5246,5245,5248,5252,5262,5253,5255,5254,5251,5249,5250,5258},--The Battle for Gilneas
{5227,5552,5228,5222,5220,5216,5214,5211,5230,5215,5209,5210,5208,5259},--Twin Peaks
{6684,6427,6760},--Scarlet Halls
{6946,6928,6929,6761},--Scarlet Monastery
{6531,6394,6396,6821,6762},--Scholomance
{6402,6420,6400,6089,6456},--Stormstout Brewery
{6460,6671,6475,6758},--Temple of the Jade Serpent
{6713,6478,6736,6756},--Mogu'shan Palace
{6477,6472,6471,6470},--Shado-Pan Monastery
{6476,6479,6945,6759},--Gate of the Setting Sun
{6688,6485,6822,6763},--Siege of Niuzao Temple
{6937,6936,6553,6683,6518,6922,6718,6845,6725,6726,6727,6728,6729,6730},--Heart of Fear 
{6823,6674,7056,6687,6686,6455,6458,6844,6719,6720,6721,6722,6723,6724},--Mogu'shan Vaults
{6717,6933,6824,6825,6689,6731,6732,6733,6734},--Terrace of Endless Spring
{7261,7258,7257,7252},--A Brewing Storm
{7273,7272,7271},--Arena of Annihilation
{6931,6930,6923},--Brewmoon Festval
{7275,7276,7522},--Crypt of Forgotten Kings
{7267,7266,7265},--Greenstone Village
{7529,7530,7524},--Theramore's Fall
{7231,7232,7248,7239,7249},--Unga Ingoo
{6947,6970,6980,6971,6950,6973,6972,6981,6740,6882},--Temple of Kotmogu
{7989,7990,7991,7992,7993,7988}, --A Little Patience
{8011,8012,8010},--Lion's Landing
{8017,8016},--Zan'vess
{7984,7986,8009},--Dagger in the Dark
{8094,8038,8073,8077,8082,8097,8098,8037,8081,8087,8086,8090,8069,8070,8071,8072,8056,8057,8058,8059,8060,8061,8062,8063,8064,8065,8066,8067,8068},--Throne of Thunder
{8319,8317,8318},--Dark Heart of Pandaria
{8329,8330,8316,8312},--Blood in the Snow
{8347,8315,8366},--Battle on the High Seas
{8295,8294,8327},--The Secrets of Ragefire
{8536,8528,8532,8521,8530,8520,8453,8448,8538,8529,8527,8543,8531,8537, 8458,8459,8461,8462, 8463,8465,8466,8467,8468,8469,8470,8471,8472,8478,8479,8480,8481,8680,8482},--Orgrimmar
{8993,9005,9008,9037,9046,9369},--Bloodmaul Slag Mines
{9081,9083,9082,9038,9047,9370},--Iron Docks
{9023,9551,9552,9039,9049,9371},--Auchindoun
{9033,9035,9034,9036,8843,8844,9372},--Skyreach
{9045,9058,9056,9057,9042,9055,9376},--Upper Blackrock Spire
{9024,9007,9043,9052,9373},--Grimrail Depot
{9493,9017,9223,9044,9053,9374},--The Everbloom
{9018,9025,9026,9041,9054,9375},--Shadowmoon Burial Grounds
{8948,8947,8975,8974,8958,8976,8977,8986,8987,8988},--Highmaul
{8978,8979,8930,8980,8929,8983,8981,8982,8984,8952,8989,8990,8991,8992},--Blackrock Foundry
{10026,10057,10013,9972,9979,9988,10086,9989,10012,10087,10030,10073,10023,10024,10025,10020,10019},--Hellfire Citadel
--Legion
{10709,10710,10711,10805,10804,10806},--"Black Rook Hold"
{10611,10610,10816},--"Court of Stars"
{10766,10769,10783,10784,10785},--"Darkheart Thicket"
{10456,10457,10458,10780,10781,10782},--"Eye of Azshara"
{10542,10544,10543,10786,10788,10789},--"Halls of Valor"
{10413,10411,10412,10807,10808,10809},--"Maw of Souls"
{10996,10875,10795,10796,10797},--"Neltharion's Lair"
{10773,10775,10776,10813},--"The Arcway"
{10707,10679,10680,10801,10802,10803},--"Vault of the Wardens"
{10554,10553,10798,10799,10800},--"Violet Hold"
{10555,10830,10771,10753,10663,10772,10755,10820,10818,10819,10821,10823,10822,10824,10825,10826,10827},--"The Emerald Nightmare"
{10678,10697,10742,10817,10754,10851,10704,10575,10699,10696,10829,10837,10838,10839,10840,10842,10843,10844,10846,10845,10847,10848,10849,10850},--"The Nighthold"
{11337,11387,11377,11394,11426},--"Trial of Valor"
{11433,11335,11338,11430,11432,11429}, --"Return to Karazhan"
{11768,11769,11703,11700,11701}, --"Cathedral of Eternal Night"
{11724,11696,11699,11773,11676,11674,11675,11683,11770,11787,11788,11789,11790}, --"Tomb of Sargeras"
}


if UnitFactionGroup("player")=="Alliance" then
--aliance
rallachieve[55]={199,872,204,203,200,1259,202,207,713,206,201,168,167,166,1172}
rallachieve[56]={583,584,165,155,154,73,711,159,158,1153,161,156,157,162,1169}
rallachieve[57]={221,582,219,218,225,707,220,709,1151,226,223,1166,222,1167}
--no difference for eye
rallachieve[59]={2191,1766,2189,1763,1757,2190,1764,2193,1762,1765,1310,1309,1761,1308,2194}
rallachieve[60]={3848,3849,3853,3854,3852,3856,3847,3855,3845,3777,3776,3851,3850,3846,3857}
--no difference for gilneas
rallachieve[62]={5226,5231,5229,5221,5219,5216,5213,5211,5230,5215,5209,5210,5208,5223}
rallachieve[80]={7526,7527,7523}
rallachieve[90]={8347,8314,8364}
rallachieve[92][32]=8679
ralllocations[80]=906
end


rallboss={
{{36612},{36855},{0},{37813},{36626},{36627},{36678},{37970,37972,37973},{37955},{36789},{36853},{36597},{36597},{36612,36855,37813},{36612,36855,37813},{36626,36627,36678},{36626,36627,36678},{37970,37972,37973,37955},{37970,37972,37973,37955},{36789,36853},{36789,36853},{36597},{36597},{36612,36855,37813,36626,36627,36678,37970,37972,37973,37955,36789,36853,36597},{36612,36855,37813,36626,36627,36678,37970,37972,37973,37955,36789,36853,36597}},--icc10
{{36612},{36855},{0},{37813},{36626},{36627},{36678},{37970,37972,37973},{37955},{36789},{36853},{36597},{36597},{36612,36855,37813},{36612,36855,37813},{36626,36627,36678},{36626,36627,36678},{37970,37972,37973,37955},{37970,37972,37973,37955},{36789,36853},{36789,36853},{36597},{36597},{36612,36855,37813,36626,36627,36678,37970,37972,37973,37955,36789,36853,36597},{36612,36855,37813,36626,36627,36678,37970,37972,37973,37955,36789,36853,36597}},--icc25
{{34796},{35144,34799},{34780},{34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453,34461,34460,34465,34466,34467,34468,34469,34471,34472,34473,34463,34470,34474,34475},{34496,34497},{34564},{34796,34780,34497,34496,34564},{34796,34780,34497,34496,34564}}, --toc10
{{34796},{35144,34799},{34780},{34496,34497},{34564},{34796,34780,34497,34496,34564},{34796,34780,34497,34496,34564}}, --toc25
{{0},{33113},{33113},{33113},{33113},{33113},{33113},{33113},{33113},{33118},{33118},{33118},{33186},{33186},{33293},{33293},{33293},{33293},{33293},{33113,33118,33186,33293},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32930},{32930},{32930},{32930},{33515},{33515},{32867,32927,32857,32930,33515},{32845},{32845},{32845},{32845},{32845},{32865},{32865},{32865},{32865},{32865},{32915,32913,32914},{0},{32906},{32906},{32906},{32906},{32906},{33350,33432},{33350,33432},{33350,33432},{32845,32865,32906,33350,33432},{33271},{33271},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33271,33134},{33113,33118,33186,33293,32867,32927,32857,32930,33515,32845,32865,32906,33350,33432,33271,33134},{32871},{32871}},
{{0},{33113},{33113},{33113},{33113},{33113},{33113},{33113},{33113},{33118},{33118},{33118},{33186},{33186},{33293},{33293},{33293},{33293},{33293},{33113,33118,33186,33293},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32867,32927,32857},{32930},{32930},{32930},{32930},{33515},{33515},{32867,32927,32857,32930,33515},{32845},{32845},{32845},{32845},{32845},{32865},{32865},{32865},{32865},{32865},{32915,32913,32914},{0},{32906},{32906},{32906},{32906},{32906},{33350,33432},{33350,33432},{33350,33432},{32845,32865,32906,33350,33432},{33271},{33271},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33134},{33271,33134},{33113,33118,33186,33293,32867,32927,32857,32930,33515,32845,32865,32906,33350,33432,33271,33134},{32871},{32871}},
{{15956,15953,15952},{15956},{15956,15953,15952},{15936},{16011},{15954,15936,16011},{16064,16065,30549,16063},{16061,16060,16064,16065,30549,16063},{16028},{15929,15930},{15929,15930},{16028,15931,15932,15929,15930},{15989},{15989},{16428,15990},{15990},{15956,15953,15952,15954,15936,16011,16061,16060,16064,16065,30549,16063,16028,15931,15932,15929,15930,15989,15990},{15956,15953,15952,15954,15936,16011,16061,16060,16064,16065,30549,16063,16028,15931,15932,15929,15930,15989,15990}},--naxx10
{{15956,15953,15952},{15956},{15956,15953,15952},{15936},{16011},{15954,15936,16011},{16064,16065,30549,16063},{16061,16060,16064,16065,30549,16063},{16028},{15929,15930},{15929,15930},{16028,15931,15932,15929,15930},{15989},{15989},{16428,15990},{15990},{15956,15953,15952,15954,15936,16011,16061,16060,16064,16065,30549,16063,16028,15931,15932,15929,15930,15989,15990},{15956,15953,15952,15954,15936,16011,16061,16060,16064,16065,30549,16063,16028,15931,15932,15929,15930,15989,15990}},--naxx25
{{28859},{28859},{28859},{28859}},--malygos10
{{28859},{28859},{28859},{28859}},--malygos25
{{10184},{10184},{10184},{10184}},--onyxia10
{{10184},{10184},{10184},{10184}},--onyxia25
{{31125,33993,35013}},--arka10
{{31125,33993,35013}},--arka25
{{28860},{28860},{28860},{28860},{28860},{28860}},--sart10
{{28860},{28860},{28860},{28860},{28860},{28860}},--sart25
{{39863},{39863}},--halion10
{{39863},{39863}},--halion25
{{29309},{29310},{29311},{29309,29310,29311,29308,30258}},--ankahet
{{28684,28730,28729,28731},{28921},{29120},{28684,28921,29120}},--azjol
{{0},{0},{26529,26530,26532,26533}},--strat
{{34928},{35119},{35451}},--colis5
{{26630},{26631},{27483},{26630,26631,27483,26632}},--draktaron
{{29304},{29305},{29306,29932},{29306},{29304,29305,29306,29932,29307}},--gundrak
{{37226},{37226,38112,38113}},--reflect
{{36494},{0},{36494,36476,36658}},--PitOfSaron
{{36497},{36502},{36497,36502}},--ForgeOfSouls
{{26731},{26763},{26723},{26731,26763,26723,26794}},--nexus
{{27656},{27656},{27656},{27656},{0},{27656,27654,27447,27655}},--oculus
{{29314},{29313},{0},{31134},{29314,29313,29266,29315,29312,29316}},--VioletHold
{{28586},{28587},{28923},{28586,28587,28923,28546}},--HallsOfLighting
{{28070},{27975},{27978},{28070,27975,27978,27977}},--HallsOfStone
{{23953},{23953,24201,24200,23954}},--utgard5
{{26668},{26693},{26693},{26861},{26668,26693,26861,26687}},--utgard5
{{47162},{47296,47297},{49208,43778},{47626},{4739},{49541},{49541}},--The Deadmines
{{46962},{4278},{46964},{46964}},--Shadowfang Keep
{{40586},{44648,40792},{40792,44566}},--Throne of the Tides
{{39665},{39679},{39698},{39705},{39705}},--Blackrock Caverns
{{42333},{42333}},--The Stonecore
{{0,51157},{43875},{43875}},--The Vortex Pinnacle
{{39625},{40484},{40484}},--Grim Batol
{{39425},{39443,39428},{39908,39788},{39378},{39378}},--Halls of Origination
{{43614},{43612,43934},{44819},{44819}},--Lost City of the Tol'vir
{{47120},{52363},{55869}},--Baradin Hold
{{41570},{42178,42166,42179,42180},{41378},{41442},{43296},{41376},{41570,42178,42166,42179,42180,41378,41442,43296,41376},{41570},{42178,42166,42179,42180},{41378},{41442},{43296},{41376}},--Blackwing Descent
{{44600},{45992,45993},{43735,43686,43687,43688,43689},{43324},{45213},{44600,45992,45993,43735,43686,43687,43688,43689,43324},{44600},{45992,45993},{43735,43686,43687,43688,43689},{43324},{45213}},--The Bastion of Twilight
{{45871,45870,45872},{46753},{45871,45870,45872,46753},{45871,45870,45872},{46753}},--Throne of the Four Winds
{{0,24396},{23577},{0},{23863},{23863}}, --Zul'Aman
{{52155},{52151},{52059},{52148},{0,52440,52422,52442,52392,52438,52405,52418,52414},{52148}}, --Zul'Gurub
{{52498},{52558,53087,52577},{52530},{53691},{53494},{0,53619},{52409},{52498},{52558},{52530},{53691},{53494},{52571},{52409},{52498,52558,52530,53691,53494,52571,52409}},--Firelands
{{54123},{0,54544},{54432}},--End Time
{{54938},{54938}},--Hour of Twilight
{{55085},{54969},{54969}},--Well of Eternity
{{55265},{55308},{55312},{55689},{55294},{56427,55870,55891},{53879},{53879},{55265,55308,55312,55689},{55294,56427,53879,53879},{53879},{55265},{55308},{55312},{55689},{55294},{56427},{53879},{53879}},--Dragon Soul
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}}, --Warsong Gulch
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--arathi
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--alterac
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--Eye of the Storm
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--Strand of the Ancients
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--Isle of Conquest
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--The Battle for Gilneas
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--Twin Peaks
{{59303,59309,58674,58876},{58632},{59150}},--Scarlet Halls
{{59789},{59223},{3977},{3977}},--Scarlet Monastery
{{10503},{59153},{59368},{1853,59100},{1853}},--Scholomance
{{0},{0},{0},{56637},{59479}},--Stormstout Brewery
{{56787},{56439},{56439},{56439}},--Temple of the Jade Serpent
{{0},{61243,61399},{61398},{61398}},--Mogu'shan Palace
{{0,65407,56395},{56719},{56884},{56884}},--Shado-Pan Monastery
{{0},{56906},{56877},{56877}},--Gate of the Setting Sun
{{61634},{61485},{62205},{62205}},--Siege of Niuzao Temple
{{63554},{62543},{62164},{65501},{62511},{62837},{63554,62543,62164},{65501,62511,62837},{63554},{62543},{62164},{65501},{62511},{62837}},--Heart of Fear
{{60051,60043,59915,60047},{60009},{60143},{60701,60708,60709,60710},{60410},{60399,60400},{60051,60043,59915,60047,60009,60143},{60701,60708,60709,60710,60399,60400},{60051,60043,59915,60047,60410},{60009},{60143},{60701,60708,60709,60710},{60410},{60399,60400}},--Mogu'shan Vaults
{{60583},{62442},{63099},{60999},{60583,62442,63099,60999},{60583},{62442},{63099},{60999}},--Terrace of Endless Spring
{{0},{0,64381,59779},{58739},{58739}},--A Brewing Storm
{{63313},{63316,64280,64281},{0}},--Arena of Annihilation
{{0},{0},{63528}},--Brewmoon Festval
{{0},{61709},{0}},--Crypt of Forgotten Kings
{{62682},{0},{0}},--Greenstone Village
{{58777},{58787},{0}},--Theramore's Fall
{{0},{0},{0},{62465},{62465}},--Unga Ingoo
{{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}},--Temple of Kotmogu
{{0},{0},{0},{0},{0},{0}}, --A Little Patience
{{0},{0},{0}},--Lion's Landing
{{67879,2343},{67879,2343}},--Zan'vess
{{67263},{67266},{67266}},--Dagger in the Dark
{{69465},{68476},{0,69134,69078,69131,69132},{67977},{70229},{69712},{68036},{69017},{69427},{68078},{0,68905,68904},{68397},{0,69465,68476,69134,69078,69131,69132},{0,67977,70229,69712},{0,68036,69017,69427},{0,68078,68905,68904,68397},{69465},{68476},{0,69134,69078,69131,69132},{67977},{70229},{69712},{68036},{69017},{69427},{68078},{0,68905,68904},{68397},{9999999}},--Throne of Thunder
{{0},{0},{0}},--Dark Heart of Pandaria
{{0},{70544},{0},{0}},--Blood in the Snow
{{0},{0},{0}},--Battle on the High Seas
{{0},{0},{0}},--The Secrets of Ragefire
{{71543},{0,71479, 71475, 71480},{72276},{71734},{72249},{71466},{0,71859, 71858},{71515},{71454},{71889},{71529},{71504},{0,71152, 71153, 71154, 71155, 71156, 71157, 71158, 71160, 71161},{71865},{71543,71479,72276,71734},{72249,71466,71859,71515},{72249,71466,71859, 71858,71515},{71504,71865},{0,71543,72436},{0,71479, 71475, 71480},{72276},{71734},{72249},{71466},{0,71859, 71858},{71515},{71454},{71889},{71529},{71504},{0,71152, 71153, 71154, 71155, 71156, 71157, 71158, 71160, 71161},{71865},{71865}},
{{74475},{74790},{74790},{74790},{74790},{74790}},--Bloodmaul Slag Mines
{{0,83775,83761,83578},{81305},{83612},{83612},{83612},{83612}},--Iron Docks
{{76177},{75927},{77734},{77734},{77734},{77734}},--Auchindoun
{{75964},{76143},{0},{76266},{76266},{76266},{76266}},--Skyreach
{{76413},{0},{76585},{77120},{77120},{77120},{77120}},--Upper Blackrock Spire
{{77803},{79545},{80005},{80005},{80005}},--Grimrail Depot
{{82682},{81522},{83846},{83846},{83846},{83846}},--The Everbloom
{{75509},{75452},{76407},{76407},{76407},{76407}},--Shadowmoon Burial Grounds
{{78714},{77404},{78491},{78948},{78237},{79015},{77428},{78714,77404,78491},{78948,78237,79015},{77428}},--Highmaul
{{76877},{77182},{76806},{76973,76974},{76814},{77692},{76865},{76906},{77557},{77325},{76877,77182,76806},{76973,76974,76814,77692},{76865,76906,77557},{77325}},--Blackrock Foundry
{{95068,93023},{90284},{90435},{90378},{90199},{90316},{90296},{90269},{89890},{93068},{91349},{91331},{95068,93023,90284,90435},{92146,90378,90199},{90316,90296,90269},{89890,93068,91349},{91331}},--Hellfire Citadel
--Legion
{{0},{98542},{98538},{0},{0},{0}},--"Black Rook Hold"
{{0},{104215},{0}},--"Court of Stars"
{{99200},{99192},{0},{0},{0}},--"Darkheart Thicket"
{{91784},{91789},{0},{0},{0},{0}},--"Eye of Azshara"
{{96028},{99891},{95676},{0},{0},{0}},--"Halls of Valor"
{{96756},{0},{96759},{0},{0},{0}},--"Maw of Souls"
{{0},{91005},{91007},{0},{0}},--"Neltharion's Lair"
{{98203},{98205},{98208},{0}},--"The Arcway"
{{0},{95886},{95888},{0},{0},{0}},--"Vault of the Wardens"
{{101995},{101976},{0},{0},{0}},--"Violet Hold"
{{102672},{105393},{106087},{100497},{39407},{106912,104636},{103769},{102672,105393,106087},{100497,39407,106912,104636},{103769},{102672},{105393},{106087},{100497},{39407},{106912,104636},{103769}},--"The Emerald Nightmare"
{{102263},{104415},{104288},{110908},{104528},{103758},{103685},{101002},{110965},{110533},{102263,104415,104288},{110908,104528,103758},{103685,101002,110965},{110533},{102263},{104415},{104288},{110908},{104528},{103758},{103685},{101002},{110965},{110533}},--"The Nighthold"
{{114263},{96759},{96759},{114263,114344,96759},{114263,114344,96759}},--"Trial of Valor"
{{0},{0},{114312},{0},{114350},{114790}}, --"Return to Karazhan"
{{117193},{117194},{120793},{120793},{120793}}, --"Cathedral of Eternal Night"
{{115844},{120996},{116407},{118523},{115767},{118460},{118289},{120436},{108573},{115844,120996,116407},{118523,115767,118460},{118289,120436},{108573}}, --"Tomb of Sargeras"
}

if UnitFactionGroup("player")=="Alliance" then
rallboss[80]={{64900},{64479},{0}}
end


ralltrack ={
{1,0,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0},--icc10
{1,0,0,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0},--icc25
{0,0,0,0,0,0,0,0}, --toc10
{0,0,0,0,0,0,0}, --toc25
{0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
{0,0,0,0,1,0,0,0,0,0,1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
{1,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0},--naxx10
{1,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0},--naxx25
{0,0,0,0},--malygos10
{0,0,0,0},--malygos25
{0,1,0,0},--onyxia10
{0,1,0,0},--onyxia25
{0},--arka10
{0},--arka25
{1,0,0,0,0,0},--sart10
{1,0,0,0,0,0},--sart25
{0,0},--halion10
{0,0},--halion25
{1,1,0,0},--ankahet
{0,1,0,0},--azjol
{0,0,0},--strat
{0,0,1},--colis5
{1,0,1,0},--draktaron
{1,1,0,1,0},--gundrak
{0,0},--reflect
{1,1,0},--PitOfSaron
{1,1,0},--ForgeOfSouls
{0,1,1,0},--nexus
{0,0,0,0,0,0},--oculus
{1,0,0,0,0},--VioletHold
{0,1,0,0},--HallsOfLighting
{1,0,1,0},--HallsOfStone
{0,0},--utgard5
{0,0,0,1,0},--utgard5
{1,0,1,0,1,1,0},--The Deadmines
{1,1,1,0},--Shadowfang Keep
{0,0,0},--Throne of the Tides
{1,1,1,1,0},--Blackrock Caverns
{0,0},--The Stonecore
{0,1,0},--The Vortex Pinnacle
{1,0,0},--Grim Batol
{1,0,1,1,0},--Halls of Origination
{0,0,1,0},--Lost City of the Tol'vir
{0,0,0},--Baradin Hold
{1,1,0,1,1,0,0,0,0,0,0,0,0},--Blackwing Descent
{0,0,0,1,0,0,0,0,0,0,0},--The Bastion of Twilight
{0,0,0,0,0},--Throne of the Four Winds
{0,1,0,0,0},--Zul'Aman
{1,1,1,0,0,0},--Gul'Gurub
{0,1,1,0,1,1,1,0,0,0,0,0,0,0,0},--Firelands
{1,0,0},--End Time
{1,0},--Hour of Twilight
{1,1,0},--Well of Eternity
{1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0},--Dragon Soul
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, --Warsong Gulch
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--arathi
{0,0,0,0,0,0,0,0,0,0,0,0,0,0},--alterac
{0,0,0,0,0,0,0,0,0,0,0,0,0},--Eye of the Storm
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Strand of the Ancients
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Isle of Conquest
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--The Battle for Gilneas
{0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Twin Peaks
{1,1,0},--Scarlet Halls
{1,0,1,0},--Scarlet Monastery
{0,1,1,0,0},--Scholomance
{0,0,0,1,0},--Stormstout Brewery
{1,0,0,0},--Temple of the Jade Serpent
{0,0,0,0},--Mogu'shan Palace
{0,0,1,0},--Shado-Pan Monastery
{0,0,1,0},--Gate of the Setting Sun
{1,1,0,0},--Siege of Niuzao Temple
{0,0,1,0,0,0,0,0,0,0,0,0,0,0},--Heart of Fear 
{0,0,0,0,0,1,0,0,0,0,0,0,0,0},--Mogu'shan Vaults
{0,1,0,1,0,0,0,0,0},--Terrace of Endless Spring
{1,1,0,0},--A Brewing Storm
{1,0,0},--Arena of Annihilation
{0,0,0},--Brewmoon Festval
{0,1,0},--Crypt of Forgotten Kings
{1,1,0},--Greenstone Village
{1,1,0},--Theramore's Fall
{1,0,0,0,0},--Unga Ingoo
{0,0,0,0,0,0,0,0,0,0},--Temple of Kotmogu
{0,0,0,0,0,0}, --A Little Patience
{0,0,0},--Lion's Landing
{1,0},--Zan'vess
{0,1,0},--Dagger in the Dark
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Throne of Thunder
{0,0,0},--Dark Heart of Pandaria
{0,0,0,0},--Blood in the Snow
{0,0,0},--Battle on the High Seas
{0,0,0},--The Secrets of Ragefire
{0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Orgrimmar
{1,0,1,0,0,0},--Bloodmaul Slag Mines
{0,0,1,0,0,0},--Iron Docks
{0,1,0,0,0,0},--Auchindoun
{1,0,0,1,0,0,0},--Skyreach
{1,0,0,1,0,0,0},--Upper Blackrock Spire
{0,0,0,0,0},--Grimrail Depot
{0,1,0,0,0,0},--The Everbloom
{0,1,0,0,0,0},--Shadowmoon Burial Grounds
{0,0,0,0,0,0,0,0,0,0},--Highmaul
{0,0,1,1,0,1,0,0,0,0,0,0,0,0},--Blackrock Foundry
{1,1,0,1,1,0,0,1,0,1,0,0,0,0,0,0,0},--Hellfire Citadel
--Legion
{0,1,0,0,0,0},--"Black Rook Hold"
{0,0,0},--"Court of Stars"
{1,1,0,0,0},--"Darkheart Thicket"
{1,1,1,0,0,0},--"Eye of Azshara"
{0,1,1,0,0,0},--"Halls of Valor"
{1,0,0,0,0,0},--"Maw of Souls"
{0,1,0,0,0},--"Neltharion's Lair"
{1,0,1,0},--"The Arcway"
{0,0,1,0,0,0},--"Vault of the Wardens"
{0,0,0,0,0},--"Violet Hold"
{0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0},--"The Emerald Nightmare"
{0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--"The Nighthold"
{0,0,0,0,0},--"Trial of Valor"
{0,0,0,0,0,0}, --"Return to Karazhan"
{0,0,0,0,0}, --"Cathedral of Eternal Night"
{0,0,1,1,0,0,0,0,1,0,0,0,0}, --"Tomb of Sargeras"
}--1 если трекерится


rallmeta   ={
{1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0},--icc10
{1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0},--icc25
{0,0,0,0,0,0,0,0}, --toc10
{0,0,0,0,0,0,0}, --toc25
{0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0},
{0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0},
{1,1,0,1,0,0,0,0,1,1,1,0,1,0,1,0,0,1},--naxx10
{1,1,0,1,0,0,0,0,1,1,1,0,1,0,1,0,0,1},--naxx25
{1,0,1,1},--malygos10
{1,0,1,1},--malygos25
{0,0,0,0},--onyxia10
{0,0,0,0},--onyxia25
{0},--arka10
{0},--arka25
{1,0,0,0,0,1},--sart10
{1,0,0,0,0,1},--sart25
{0,0},--halion10
{0,0},--halion25
{1,1,1,0},--ankahet
{1,1,1,0},--azjol
{1,1,0},--strat
{0,0,0},--colis5
{1,1,1,0},--draktaron
{1,1,1,1,0},--gundrak
{0,0},--reflect
{0,0,0},--PitOfSaron
{0,0,0},--ForgeOfSouls
{1,1,1,0},--nexus
{1,1,1,1,1,0},--oculus
{1,1,1,0,1},--VioletHold
{1,1,1,0},--HallsOfLighting
{1,1,1,0},--HallsOfStone
{1,0},--utgard5
{1,1,1,1,0},--utgard5
{1,1,1,1,1,1,0},--The Deadmines
{1,1,1,0},--Shadowfang Keep
{1,1,0},--Throne of the Tides
{1,1,1,1,0},--Blackrock Caverns
{1,0},--The Stonecore
{1,1,0},--The Vortex Pinnacle
{1,1,0},--Grim Batol
{1,1,1,1,0},--Halls of Origination
{1,1,1,0},--Lost City of the Tol'vir
{0,0,0},--Baradin Hold
{1,1,1,1,1,1,0,1,1,1,1,1,1},--Blackwing Descent
{1,1,1,1,0,0,1,1,1,1,0},--The Bastion of Twilight
{1,1,0,1,1},--Throne of the Four Winds
{0,0,0,0,0},--Zul'Aman
{0,0,0,0,0,0},--Zul'Gurub
{1,1,1,1,1,1,0,1,1,1,1,1,1,0,0},--Firelands
{0,0,0},--End Time
{0,0},--Hour of Twilight
{0,0,0},--Well of Eternity
{1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1},--Dragon Soul
{1,1,1,1,1,0,1,1,0,1,1,1,1,0,0}, --Warsong Gulch
{1,1,1,1,0,1,0,1,1,1,1,1,1,1,0},--arathi
{1,1,1,0,1,1,1,0,1,1,1,1,1,0},--alterac
{1,1,1,1,0,1,1,0,1,0,0,1,0},--Eye of the Storm
{1,1,1,1,1,1,1,1,1,1,1,1,1,0,0},--Strand of the Ancients
{1,1,1,1,1,1,1,1,0,1,0,1,1,0,0},--Isle of Conquest
{1,1,1,1,0,1,1,1,1,1,1,1,1,1,0},--The Battle for Gilneas
{1,1,1,1,1,1,1,1,1,1,1,1,0,0},--Twin Peaks
{1,1,0},--Scarlet Halls
{1,1,1,0},--Scarlet Monastery
{1,1,1,1,0},--Scholomance
{0,0,0,0,0},--Stormstout Brewery
{1,1,1,0},--Temple of the Jade Serpent
{1,1,1,0},--Mogu'shan Palace
{1,1,1,0},--Shado-Pan Monastery
{1,1,1,0},--Gate of the Setting Sun
{1,1,1,0},--Siege of Niuzao Temple
{1,1,1,1,1,1,0,0,1,1,1,1,1,1},--Heart of Fear 
{1,1,1,1,1,1,0,0,1,1,1,1,1,1},--Mogu'shan Vaults
{1,1,1,1,0,1,1,1,1},--Terrace of Endless Spring
{0,0,0,0},--A Brewing Storm
{0,0,0},--Arena of Annihilation
{0,0,0},--Brewmoon Festval
{0,0,0},--Crypt of Forgotten Kings
{0,0,0},--Greenstone Village
{0,0,0},--Theramore's Fall
{0,0,0,0,0},--Unga Ingoo
{1,1,1,1,1,1,1,0,0,0},--Temple of Kotmogu
{0,0,0,0,0,0}, --A Little Patience
{0,0,0},--Lion's Landing
{0,0},--Zan'vess
{0,0,0},--Dagger in the Dark
{1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0},--Throne of Thunder
{0,0,0},--Dark Heart of Pandaria
{0,0,0,0},--Blood in the Snow
{0,0,0},--Battle on the High Seas
{0,0,0},--The Secrets of Ragefire
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--Orgrimmar
{1,1,1,0,0,0},--Bloodmaul Slag Mines
{1,1,1,0,0,0},--Iron Docks
{1,1,1,0,0,0},--Auchindoun
{1,1,1,1,0,0,0},--Skyreach
{1,1,1,1,0,0,0},--Upper Blackrock Spire
{1,1,0,0,0},--Grimrail Depot
{1,1,1,0,0,0},--The Everbloom
{1,1,1,0,0,0},--Shadowmoon Burial Grounds
{1,1,1,1,1,1,1,0,0,0},--Highmaul
{1,1,1,1,1,1,1,1,1,1,0,0,0,0},--Blackrock Foundry
{1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0},--Hellfire Citadel
--Legion
{1,1,1,0,0,0},--"Black Rook Hold"
{1,1,0},--"Court of Stars"
{1,1,0,0,0},--"Darkheart Thicket"
{1,1,1,0,0,0},--"Eye of Azshara"
{1,1,1,0,0,0},--"Halls of Valor"
{1,1,1,0,0,0},--"Maw of Souls"
{1,1,0,0,0},--"Neltharion's Lair"
{1,1,1,0},--"The Arcway"
{1,1,1,0,0,0},--"Vault of the Wardens"
{1,1,0,0,0},--"Violet Hold"
{1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},--"The Emerald Nightmare"
{1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--"The Nighthold"
{1,1,1,1,0},--"Trial of Valor"
{1,1,1,1,1,0}, --"Return to Karazhan"
{1,1,1,0,0}, --"Cathedral of Eternal Night"
{1,1,1,1,1,1,1,1,1,0,0,0,0}, --"Tomb of Sargeras"
}--1 если на мету


rallfullver={
{0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1},--icc10
{0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1},--icc25
{0,0,0,0,0,0,1,1}, --toc10
{0,0,0,0,0,1,1}, --toc25
{0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,1,0,1},
{0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,1,0,1},
{0,0,1,0,0,1,0,1,0,0,0,1,0,1,0,1,1,0},--naxx10
{0,0,1,0,0,1,0,1,0,0,0,1,0,1,0,1,1,0},--naxx25
{0,1,0,0},--malygos10
{0,1,0,0},--malygos25
{0,0,0,1},--onyxia10
{0,0,0,1},--onyxia25
{0},--arka10
{0},--arka25
{0,1,0,1,1,0},--sart10
{0,1,0,1,1,0},--sart25
{1,1},--halion10
{1,1},--halion25
{0,0,0,1},--ankahet
{0,0,0,1},--azjol
{0,0,1},--strat
{0,0,0},--colis5
{0,0,0,1},--draktaron
{0,0,0,0,1},--gundrak
{0,1},--reflect
{0,0,1},--PitOfSaron
{0,0,1},--ForgeOfSouls
{0,0,0,1},--nexus
{0,0,0,0,0,1},--oculus
{0,0,0,1,0},--VioletHold
{0,0,0,1},--HallsOfLighting
{0,0,0,1},--HallsOfStone
{0,1},--utgard5
{0,0,0,0,1},--utgard5
{0,0,0,0,0,0,1},--The Deadmines
{0,0,0,1},--Shadowfang Keep
{0,0,1},--Throne of the Tides
{0,0,0,0,1},--Blackrock Caverns
{0,1},--The Stonecore
{0,0,1},--The Vortex Pinnacle
{0,0,1},--Grim Batol
{0,0,0,0,1},--Halls of Origination
{0,0,0,1},--Lost City of the Tol'vir
{1,1,1},--Baradin Hold
{0,0,0,0,0,0,1,1,1,1,1,1,1},--Blackwing Descent
{0,0,0,0,0,1,1,1,1,1,1},--The Bastion of Twilight
{0,0,1,1,1},--Throne of the Four Winds
{0,0,0,0,1},--Zul'Aman
{0,0,0,0,0,1},--Zul'Gurub
{0,0,0,0,0,0,0,1,1,1,1,1,1,1,1},--Firelands
{0,0,1},--End Time
{0,1},--Hour of Twilight
{0,0,1},--Well of Eternity
{0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1},--Dragon Soul
{0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},--Warsong Gulch
{0,0,0,0,1,0,0,0,0,0,0,0,0,0,1},--arathi
{0,0,0,1,0,0,0,0,0,0,0,0,0,1},--alterac
{0,0,0,0,1,0,0,0,0,0,0,0,1},--Eye of the Storm
{0,0,0,0,0,0,0,0,0,0,0,0,0,1,1},--Strand of the Ancients
{0,0,0,0,0,0,0,0,0,0,1,0,0,0,1},--Isle of Conquest
{0,0,0,0,1,0,0,0,0,0,0,0,0,0,1},--The Battle for Gilneas
{0,0,0,0,0,0,0,0,0,0,0,0,1,1},--Twin Peaks
{0,0,1},--Scarlet Halls
{0,0,0,1},--Scarlet Monastery
{0,0,0,0,1},--Scholomance
{0,0,0,0,1},--Stormstout Brewery
{0,0,0,1},--Temple of the Jade Serpent
{0,0,0,1},--Mogu'shan Palace
{0,0,0,1},--Shado-Pan Monastery
{0,0,0,1},--Gate of the Setting Sun
{0,0,0,1},--Siege of Niuzao Temple
{0,0,0,0,0,0,1,1,1,1,1,1,1,1},--Heart of Fear 
{0,0,0,0,0,0,1,1,1,1,1,1,1,1},--Mogu'shan Vaults
{0,0,0,0,1,1,1,1,1},--Terrace of Endless Spring
{0,0,0,1},--A Brewing Storm
{0,0,1},--Arena of Annihilation
{0,0,1},--Brewmoon Festval
{0,0,1},--Crypt of Forgotten Kings
{0,0,1},--Greenstone Village
{0,0,1},--Theramore's Fall
{0,0,0,0,1},--Unga Ingoo
{0,0,0,0,0,0,0,1,1,1},--Temple of Kotmogu
{0,0,0,0,0,1}, --A Little Patience
{0,0,1},--Lion's Landing
{0,1},--Zan'vess
{0,0,1},--Dagger in the Dark
{0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},--Throne of Thunder
{0,1,1},--Dark Heart of Pandaria
{0,0,1,1},--Blood in the Snow
{0,1,1},--Battle on the High Seas
{0,1,1},--The Secrets of Ragefire
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},--Orgrimmar
{0,0,0,1,1,1},--Bloodmaul Slag Mines
{0,0,0,1,1,1},--Iron Docks
{0,0,0,1,1,1},--Auchindoun
{0,0,0,0,1,1,1},--Skyreach
{0,0,0,0,1,1,1},--Upper Blackrock Spire
{0,0,1,1,1},--Grimrail Depot
{0,0,0,1,1,1},--The Everbloom
{0,0,0,1,1,1},--Shadowmoon Burial Grounds
{0,0,0,0,0,0,0,1,1,1},--Highmaul
{0,0,0,0,0,0,0,0,0,0,1,1,1,1},--Blackrock Foundry
{0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1},--Hellfire Citadel
--Legion
{0,0,0,1,1,1},--"Black Rook Hold"
{0,0,1},--"Court of Stars"
{0,0,1,1,1},--"Darkheart Thicket"
{0,0,0,1,1,1},--"Eye of Azshara"
{0,0,0,1,1,1},--"Halls of Valor"
{0,0,0,1,1,1},--"Maw of Souls"
{0,0,1,1,1},--"Neltharion's Lair"
{0,0,0,1},--"The Arcway"
{0,0,0,1,1,1},--"Vault of the Wardens"
{0,0,1,1,1},--"Violet Hold"
{0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1},--"The Emerald Nightmare"
{0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1},--"The Nighthold"
{0,0,0,1,1},--"Trial of Valor"
{0,0,0,0,0,1}, --"Return to Karazhan"
{0,0,0,1,1}, --"Cathedral of Eternal Night"
{0,0,0,0,0,0,0,0,0,1,1,1,1}, --"Tomb of Sargeras"
}--1 это только для фулл версии ачивка


end







achievereminderload=1
function out(text)
DEFAULT_CHAT_FRAME:AddMessage(text)
UIErrorsFrame:AddMessage(text, 1.0, 1.0, 0, 1, 10) 
end

function icllonload()

iclllocaleuim()

if GetLocale()=="zhTW" or GetLocale()=="zhCN" then iclllocaleui() end


ralldatabase()

  achievementsreminderver=7.301


	if ralloptions==nil then ralloptions={1,1,0,0,0,0,1,0,0,0,0,0} end
	if rallbosstooltip==nil then rallbosstooltip=true end
	if rallbosschaton==nil then rallbosschaton=true end
	if ralloptionsmanual==nil then ralloptionsmanual={1,0,0,0,0,0} end
	if ralloptionsmanual3==nil then ralloptionsmanual3={1,0} end
	if ralloptionTrackCharAchieves==nil then ralloptionTrackCharAchieves=false end
	rallnomorereport={{},{},{0},{0}}
	ralltooltipready={{0},{0},{{0}}}
	rallcolonka=0
	ralldelaycheckzone2=GetTime()+10

	RaidAchievement_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	RaidAchievement_reminder:RegisterEvent("ADDON_LOADED")

	SLASH_ACHIEVEREMEASYACH1 = "/AchievementsReminder"
	SLASH_ACHIEVEREMEASYACH2 = "/achrem"
	SLASH_ACHIEVEREMEASYACH3 = "/ар"
	SLASH_ACHIEVEREMEASYACH4 = "/ачиврем"
	SLASH_ACHIEVEREMEASYACH5 = "/ачр"
	SLASH_ACHIEVEREMEASYACH6 = "/achr"
	if GetLocale()~="frFR" then
    SLASH_ACHIEVEREMEASYACH7 = "/ar"
  else
    SLASH_ACHIEVEREMEASYACH7 = "/arem"
	end
	SlashCmdList["ACHIEVEREMEASYACH"] = ACHIEVEREMEASYACH_Command

rabigmenuchatlisten={"raid", "raid_warning", "officer", "party", "guild", "say", "yell", "sebe"}
bigmenuchatlistea = {
areachatlist1,
areachatlist2,
areachatlist3,
areachatlist4,
areachatlist5,
areachatlist6,
areachatlist7,
areachatlist8,
}

end


function ACHIEVEREMEASYACH_Command(msg)

icll_buttonnew2()

end


function icll_OnUpdate(icracurtime)


if ralldelaycheckzone2 and icracurtime>ralldelaycheckzone2 then
ralldelaycheckzone2=nil
ralldelaycheckzone=GetTime()+0.5 --ыытест не работал инфо после релога, так заработал
local a1, a2, a3, a4, a5 = GetInstanceInfo()
  if UnitInRaid("player") or a2=="pvp" or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or a3==2 or a3==23 or (a3==1 and a2=="scenario") then
  SetMapToCurrentZone()
  end
  local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
if select(3,GetInstanceInfo())==17 then
--no LFR
elseif (a2=="pvp" and raenablebg==1) or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then
  local found=0
  local curZoneID=GetCurrentMapAreaID()
  for kj=1,#ralllocations do
    if ralllocations[kj]==curZoneID then
      found=found+1
      rallcolonka=kj
    end
  end
  if found>1 then
    rallcolonka=0
	local curZoneID=GetCurrentMapAreaID()
    for bv=1,#ralllocations do
      if ralllocations[bv]==curZoneID then
        if ralltip[bv]=="10" or ralltip[bv]=="25" then
          if tonumber(ralltip[bv])==a5 then
            rallcolonka=bv
          end
        else
            rallcolonka=bv
        end
      end
    end
  end
else
  rallcolonka=0
end

end

if ralldelaycheckzone and icracurtime>ralldelaycheckzone then
  ralldelaycheckzone=nil
  local vbil=0
  local a1, a2, a3, a4, a5 = GetInstanceInfo()
  if UnitInRaid("player") or (a2=="pvp" and raenablebg==1) or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then
  SetMapToCurrentZone()
  end
  local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
if select(3,GetInstanceInfo())==17 then
--no LFR
elseif GetMapNameByID(GetCurrentMapAreaID()) and ralllocationnames and ralllocations and GetCurrentMapAreaID() then
local curZoneID=GetCurrentMapAreaID()
  for i=1,#ralllocations do
    if ralllocations[i]==curZoneID then
      ralllocationnames[i]=GetMapNameByID(GetCurrentMapAreaID())
      if a2~="pvp" then
        vbil=1
      end
    end
  end
end


	if ralloptions[7]==1 and vbil==1 then
		RaidAchievement_reminder:RegisterEvent("PLAYER_TARGET_CHANGED")
	else
		RaidAchievement_reminder:UnregisterEvent("PLAYER_TARGET_CHANGED")
	end

	if rallbosstooltip and ralloptions[7]==1 and vbil==1 then
		RaidAchievement_reminder:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	else
		RaidAchievement_reminder:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
	end


local _, a2, a3, _, a5 = GetInstanceInfo()
local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
if select(3,GetInstanceInfo())==17 then
--no LFR
else
	if ralloptions[1]==1 then
		if #rallnomorereport[1]==0 then
			if (a2=="pvp" and raenablebg==1) or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then
				icllcheckachieves(1)
				local a1, a2, a3, a4, a5 = GetInstanceInfo()
        if a2~="pvp" then --для пвп постоянно показываем зону, для сценариев также!
          if select(3,GetInstanceInfo())~=1 and a2~=nil then
			local curZoneID=GetCurrentMapAreaID()
            table.insert(rallnomorereport[1],curZoneID)
            table.insert(rallnomorereport[2],a5)
          end
				end
			end
		else
			local bil=0
			local curZoneID=GetCurrentMapAreaID()
			for i=1,#rallnomorereport[1] do
				if rallnomorereport[1][i]==curZoneID then
					if a5==rallnomorereport[2][i] then
						bil=1
						icllcheckachieves()
					end
				end
			end
			if bil==0 then
				icllcheckachieves(1)
				if (a2=="pvp" and raenablebg==1) or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then
          local a1, a2, a3, a4, a5 = GetInstanceInfo()
          if a2~="pvp" then --для пвп постоянно показываем зону, для сценариев также!
            if select(3,GetInstanceInfo())~=1 and a2~=nil then
				local curZoneID=GetCurrentMapAreaID()
              table.insert(rallnomorereport[1],curZoneID)
              table.insert(rallnomorereport[2],a5)
            end
					end
				else
					rallcolonka=0
				end
			end
		end


	else
		if psllinfframe then
			psllinfframe:Clear()
			psllinfframe:AddMessage(rallachiverepl6)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
				psllinfframe:SetHeight(40)
			end
		end
	rallcolonka=0
	end
end--lfr
end


end


function icllonevent(self,event,...)

local arg1, arg2, arg3,arg4,arg5,arg6 = ...



if event == "PLAYER_TARGET_CHANGED" then
rallbosscheck()
end

if event == "UPDATE_MOUSEOVER_UNIT" then
ralltooltipchangenow()
end


if event == "ZONE_CHANGED_NEW_AREA" then
ralldelaycheckzone=GetTime()+3
ralldelaycheckzone2=nil
end

if event == "ADDON_LOADED" then

	if arg1=="Overachiever" then
	
	zzralistach=icralistach
zzralistach2=icralistach2
zzralistach3=icralistach3
zzralistach3_Button1=icralistach3_Button1
zzralistach3_Button2=icralistach3_Button2
zzralistach3_ButtonP=icralistach3_ButtonP
zzralistach3_ButtonN=icralistach3_ButtonN
	
	
	if ralllocationnamesdef then

if ralllocationnames==nil then
ralllocationnames={}
for i=1,#ralllocationnamesdef do
	table.insert(ralllocationnames,ralllocationnamesdef[i])
end
end


if ralllocationnames then
for i=1,#ralllocationnamesdef do
	if ralllocationnames[i]==nil then
		ralllocationnames[i]=ralllocationnamesdef[i]
	end
end
end

ralllocationnamesdef=nil
	end


	if ralloptions[7]==1 then
		RaidAchievement_reminder:RegisterEvent("PLAYER_TARGET_CHANGED")
	else
		RaidAchievement_reminder:UnregisterEvent("PLAYER_TARGET_CHANGED")
	end

	if rallbosstooltip and ralloptions[7]==1 then
		RaidAchievement_reminder:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	else
		RaidAchievement_reminder:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
	end


	--перенос тактик
ralltacticsdef=
{{ralldefaulttactic40,ralldefaulttactic41,ralldefaulttactic42,0,ralldefaulttactic43,ralldefaulttactic44,ralldefaulttactic45,ralldefaulttactic46,ralldefaulttactic94,format(ralldefaulttactic47,3),ralldefaulttactic48,ralldefaulttactic49,ralldefaulttactic50,0,0,0,0,0,0,0,0,0,0,0,0},--icc10
{ralldefaulttactic40,ralldefaulttactic41,ralldefaulttactic42,0,ralldefaulttactic43,ralldefaulttactic44,ralldefaulttactic45,ralldefaulttactic46,ralldefaulttactic94,format(ralldefaulttactic47,8),ralldefaulttactic48,ralldefaulttactic49,ralldefaulttactic50,0,0,0,0,0,0,0,0,0,0,0,0},--icc25
{format(ralldefaulttactic33,2),0,0,0,0,ralldefaulttactic34,0,0}, --toc10
{format(ralldefaulttactic33,4),0,0,0,ralldefaulttactic34,0,0}, --toc25
{ralldefaulttactic51,0,0,ralldefaulttactic52,ralldefaulttactic53,0,0,0,0,ralldefaulttactic54,ralldefaulttactic55,0,ralldefaulttactic56,ralldefaulttactic57,ralldefaulttactic58,ralldefaulttactic59,ralldefaulttactic60,0,0,0,0,0,0,0,ralldefaulttactic61,ralldefaulttactic62,ralldefaulttactic63,format(ralldefaulttactic64,rallachievekologarnhp1),0,0,ralldefaulttactic65,0,ralldefaulttactic66,ralldefaulttactic67,ralldefaulttactic68,ralldefaulttactic69,ralldefaulttactic70,ralldefaulttactic71,ralldefaulttactic72,ralldefaulttactic73,0,0,0,0,0,ralldefaulttactic74,0,0,0,ralldefaulttactic75,ralldefaulttactic76,0,0,0,ralldefaulttactic77,0,ralldefaulttactic78,ralldefaulttactic79,ralldefaulttactic80,0,0,0,0,0,0,0,ralldefaulttactic81,0},
{ralldefaulttactic51,0,0,ralldefaulttactic52,ralldefaulttactic53,0,0,0,0,ralldefaulttactic54,ralldefaulttactic55,0,ralldefaulttactic56,ralldefaulttactic57,ralldefaulttactic58,ralldefaulttactic59,ralldefaulttactic60,0,0,0,0,0,0,0,ralldefaulttactic61,ralldefaulttactic62,ralldefaulttactic63,format(ralldefaulttactic64,rallachievekologarnhp2),0,0,ralldefaulttactic65,0,ralldefaulttactic66,ralldefaulttactic67,ralldefaulttactic68,ralldefaulttactic69,ralldefaulttactic70,ralldefaulttactic71,ralldefaulttactic72,ralldefaulttactic73,0,0,0,0,0,ralldefaulttactic74,0,0,0,ralldefaulttactic75,ralldefaulttactic76,0,0,0,ralldefaulttactic77,0,ralldefaulttactic78,ralldefaulttactic79,ralldefaulttactic80,0,0,0,0,0,0,0,ralldefaulttactic81,0},
{0,ralldefaulttactic37,0,0,0,0,0,0,0,ralldefaulttactic38,0,0,0,0,ralldefaulttactic39,0,0,0},--naxx10
{0,ralldefaulttactic37,0,0,0,0,0,0,0,ralldefaulttactic38,0,0,0,0,ralldefaulttactic39,0,0,0},--naxx25
{ralldefaulttactic36,0,0,0},--malygos10
{ralldefaulttactic36,0,0,0},--malygos25
{0,ralldefaulttactic31,ralldefaulttactic32,0},--onyxia10
{0,ralldefaulttactic31,ralldefaulttactic32,0},--onyxia25
{0},--arka10
{0},--arka25
{ralldefaulttactic35,0,0,0,0,0},--sart10
{ralldefaulttactic35,0,0,0,0,0},--sart25
{0,0},--halion10
{0,0},--halion25
{ralldefaulttactic28,0,0,0},--ankahet
{0,ralldefaulttactic5.."\n"..ralldefaulttacticmain3,0,0},--azjol
{ralldefaulttactic1,ralldefaulttactic13,0},--strat
{ralldefaulttactic18,ralldefaulttactic19,ralldefaulttactic20.."\n"..ralldefaulttacticmain2},--colis5
{ralldefaulttactic3,ralldefaulttactic2,ralldefaulttactic4.."\n"..ralldefaulttacticmain1,0},--draktaron
{ralldefaulttactic6,ralldefaulttactic7,ralldefaulttactic8,ralldefaulttactic9,0},--gundrak
{0,0},--reflect
{ralldefaulttactic11.."\n"..ralldefaulttacticmain2,ralldefaulttactic12.."\n"..ralldefaulttacticmain3,0},--PitOfSaron
{ralldefaulttactic14,ralldefaulttactic15,0},--ForgeOfSouls
{0,ralldefaulttactic16,ralldefaulttactic17,0},--nexus
{0,0,0,0,0,0},--oculus
{0,ralldefaulttactic25,ralldefaulttactic26,0,ralldefaulttactic27},--VioletHold
{ralldefaulttactic29,ralldefaulttactic30,0,0},--HallsOfLighting
{0,0,ralldefaulttactic10.."\n"..ralldefaulttacticmain1,0},--HallsOfStone
{ralldefaulttactic21,0},--utgard5
{ralldefaulttactic22,0,ralldefaulttactic23,ralldefaulttactic24,0},--utgard5
{ralldefaulttactic84,ralldefaulttactic82,ralldefaulttactic83,0,0,0,0},--The Deadmines
{ralldefaulttactic85,ralldefaulttactic86,0,0},--Shadowfang Keep
{ralldefaulttactic87,ralldefaulttactic88,0},--Throne of the Tides
{0,ralldefaulttactic89,0,0,0},--Blackrock Caverns
{0,0},--The Stonecore
{ralldefaulttactic92,ralldefaulttactic90,0},--The Vortex Pinnacle
{ralldefaulttactic91,0,0},--Grim Batol
{0,0,0,0,0},--Halls of Origination
{0,ralldefaulttactic93,0,0},--Lost City of the Tol'vir
{0},--Baradin Hold
{0,0,0,0,0,0,0,0,0,0,0,0,0},--Blackwing Descent
{0,0,0,0,0,0,0,0,0,0,0},--The Bastion of Twilight
{0,0,0,0,0},--Throne of the Four Winds
}



--версия игры
ralltacticsverdef={{406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406},--icc10
{406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406,406},--icc25
{406,403,403,403,403,406,406,406}, --toc10
{406,403,403,403,406,406,406}, --toc25
{403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403},
{403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403},
{403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403},--naxx10
{403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403,403},--naxx25
{403,403,403,403},--malygos10
{403,403,403,403},--malygos25
{403,403,403,403},--onyxia10
{403,403,403,403},--onyxia25
{403},--arka10
{403},--arka25
{403,403,403,403,403,403},--sart10
{403,403,403,403,403,403},--sart25
{403,403},--halion10
{403,403},--halion25
{403,403,403,403},--ankahet
{403,403,403,403},--azjol
{403,403,403},--strat
{403,403,403},--colis5
{403,403,403,403},--draktaron
{403,403,403,403,403},--gundrak
{403,403},--reflect
{403,403,403},--PitOfSaron
{403,403,403},--ForgeOfSouls
{403,403,403,403},--nexus
{403,403,403,403,403,403},--oculus
{403,403,403,403,403},--VioletHold
{403,403,403,403},--HallsOfLighting
{403,403,403,403},--HallsOfStone
{403,403},--utgard5
{403,403,403,403,403},--utgard5
{405,406,405,405,405,405,405},--The Deadmines
{404,404,404,404},--Shadowfang Keep
{404,404,404},--Throne of the Tides
{404,404,404,404,404},--Blackrock Caverns
{404,404},--The Stonecore
{405,405,404},--The Vortex Pinnacle
{404,404,404},--Grim Batol
{404,404,404,404,404},--Halls of Origination
{404,405,404,404},--Lost City of the Tol'vir
{404},--Baradin Hold
{404,404,404,404,404,404,404,404,404,404,404,404,404},--Blackwing Descent
{404,404,404,404,404,404,404,404,404,404,404},--The Bastion of Twilight
{404,404,404,404,404},--Throne of the Four Winds
}

ralltacticsdifdef={{0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0},--icc10
{0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0},--icc25
{0,0,0,0,0,1,0,0}, --toc10
{0,0,0,0,1,0,0}, --toc25
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--naxx10
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},--naxx25
{0,0,0,0},--malygos10
{0,0,0,0},--malygos25
{0,0,0,0},--onyxia10
{0,0,0,0},--onyxia25
{0},--arka10
{0},--arka25
{0,0,0,0,0,0},--sart10
{0,0,0,0,0,0},--sart25
{0,0},--halion10
{0,0},--halion25
{0,0,0,0},--ankahet
{0,0,0,0},--azjol
{1,0,0},--strat
{0,1,0},--colis5
{0,0,0,0},--draktaron
{0,0,1,0,0},--gundrak
{0,0},--reflect
{0,0,0},--PitOfSaron
{1,0,0},--ForgeOfSouls
{0,0,0,0},--nexus
{0,0,0,0,0,0},--oculus
{0,0,0,0,0},--VioletHold
{0,0,0,0},--HallsOfLighting
{0,0,1,0},--HallsOfStone
{0,0},--utgard5
{0,0,0,0,0},--utgard5
{0,0,1,0,0,0,0},--The Deadmines
{0,0,0,0},--Shadowfang Keep
{0,0,0},--Throne of the Tides
{0,0,0,0,0},--Blackrock Caverns
{0,0},--The Stonecore
{0,1,0},--The Vortex Pinnacle
{0,0,0},--Grim Batol
{0,0,0,0,0},--Halls of Origination
{0,1,0,0},--Lost City of the Tol'vir
{0},--Baradin Hold
{0,0,0,0,0,0,0,0,0,0,0,0,0},--Blackwing Descent
{0,0,0,0,0,0,0,0,0,0,0},--The Bastion of Twilight
{0,0,0,0,0},--Throne of the Four Winds
}

	if ralltactics==nil then ralltactics=ralltacticsdef end
	if ralltacticsver==nil then ralltacticsver=ralltacticsverdef end
	if ralltacticsdif==nil then ralltacticsdif=ralltacticsdifdef end

	for i=1,#rallachieve do
		if ralltactics[i]==nil then ralltactics[i]={} end
		if ralltacticsver[i]==nil then ralltacticsver[i]={} end
		if ralltacticsdif[i]==nil then ralltacticsdif[i]={} end
		for j=1,#rallachieve[i] do
			if ralltactics[i][j]==nil then
				if ralltacticsdef[i] and ralltacticsdef[i][j] then
					ralltactics[i][j]=ralltacticsdef[i][j]
				else
					ralltactics[i][j]=0
				end
			elseif ralltactics[i][j]==0 then
				if ralltacticsdef[i] and ralltacticsdef[i][j] then
					ralltactics[i][j]=ralltacticsdef[i][j]
				end
			end

			if ralltacticsdif[i][j]==nil then
				if ralltacticsdifdef[i] and ralltacticsdifdef[i][j] then
					ralltacticsdif[i][j]=ralltacticsdifdef[i][j]
				else
					ralltacticsdif[i][j]=0
				end
			elseif ralltacticsdif[i][j]==0 then
				if ralltacticsdifdef[i] and ralltacticsdifdef[i][j] then
					ralltacticsdif[i][j]=ralltacticsdifdef[i][j]
				end
			end

			if ralltacticsver[i][j]==nil then
				if ralltacticsverdef[i] and ralltacticsverdef[i][j] then
					ralltacticsver[i][j]=ralltacticsverdef[i][j]
				else
					ralltacticsver[i][j]=4.0
				end
			else
				if ralltacticsverdef[i] and ralltacticsverdef[i][j] then
					if ralltacticsverdef[i][j]>ralltacticsver[i][j] and ralltacticsdef[i][j]~=0 then
						ralltacticsver[i][j]=ralltacticsverdef[i][j]
						ralltactics[i][j]=ralltacticsdef[i][j]
					end
				end
			end

		end
	end

ralltacticsdifdef=nil
ralltacticsverdef=nil

	end
end




end --КОНЕЦ ОНЕВЕНТ



function icll_buttonnew2()
if IsAddOnLoaded("RaidAchievement") then
  PSFea_closeallpr()
  PSFeamain1:Show()
  PSFeamain2:Show()
else
  zzralistach:Hide()
  zzralistach2:Hide()
  zzralistach3:Hide()
  ARmain1:Show()
end


zzralistach:Show()
iclldrawtext()
icllcheckachieves()

end --конец бутон2

function PSFea_listachmanual()

if IsAddOnLoaded("RaidAchievement") then
  PSFea_closeallpr()
else
  zzralistach:Hide()
  zzralistach2:Hide()
  zzralistach3:Hide()
  ARmain1:Show()
end

zzralistach2:Show()
iclldrawtext2()

end --конец бутон3

function icll_button3()
if IsAddOnLoaded("RaidAchievement") then
  PSFea_closeallpr()

else
  zzralistach:Hide()
  zzralistach2:Hide()
  zzralistach3:Hide()
  ARmain1:Show()
end
zzralistach3:Show()

local aa2="TACTICS: This module is not updated since Cataclysm launched, not easy to maintain it."
if GetLocale() == "ruRU" then
aa2="ТАКТИКИ: Этот модуль не обновляется с выхода Катаклизма, занимает много времени на его поддержку."
end

out(aa2)


iclldrawtext3()

end

function icll_button33()
--если текущая зона инст - открывать тактики сразу


--local aa2="TACTICS: This module is not updated since Cataclysm lunched, not easy to maintain it."
--if GetLocale() == "ruRU" then
--aa2="ТАКТИКИ: Этот модуль не обновляется с выхода Катаклизма, занимает много времени на его поддержку."
--end


--out("|cff99ffffRaidAchievement|r - "..aa2)

local bil=0
SetMapToCurrentZone()
local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
if select(3,GetInstanceInfo())==17 then
--no LFR
else
local curZoneID=GetCurrentMapAreaID()
for i=1,#ralllocations do
	if ralllocations[i]==curZoneID then
		local a1, a2, a3, a4, a5 = GetInstanceInfo()
		if a2=="pvp" or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then
			if ralltip[i]=="10" or ralltip[i]=="25" then
				if tonumber(ralltip[i])==a5 then
					bil=i
				end
			else
				bil=i
			end
		end
	end
end
end
if bil==0 then
PSFea_listachmanual()
else
rallonlycurrzone=bil
icll_button3()
end

end


function iclldrawtext()
if iclldrawtime1==nil then
iclldrawtime1=1

local t = zzralistach:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), 12)
t:SetText(ralltitle2)
t:SetJustifyH("LEFT")
t:SetJustifyV("TOP")
t:SetPoint("TOPLEFT",20,-15)
t:SetWidth(700)
t:SetHeight(155)

--отправить инфо
rapsebf1 = CreateFrame("EditBox", "rallpseb1", zzralistach,"InputBoxTemplate")
rapsebf1:SetAutoFocus(false)
rapsebf1:SetHeight(20)
rapsebf1:SetWidth(120)
rapsebf1:SetPoint("TOPLEFT", 617, -324)
rapsebf1:Show()
rapsebf1:SetScript("OnTextChanged", function(self) if string.len(rapsebf1:GetText())>0 then rallradiobtn1:SetChecked(true) rallradiobtn2:SetChecked(false) else rallradiobtn1:SetChecked(false) rallradiobtn2:SetChecked(true) end end )
rapsebf1:SetScript("OnEnterPressed", function(self) rapsebf1:ClearFocus() end )
rapsebf1:SetScript("OnEditFocusLost", function(self) if string.len(rapsebf1:GetText())==0 then rallradiobtn1:SetChecked(false) rallradiobtn2:SetChecked(true) end end)

openmenull()

rallradiobtn1 = CreateFrame("CheckButton", nil, zzralistach, "SendMailRadioButtonTemplate")
rallradiobtn1:SetWidth("20")
rallradiobtn1:SetHeight("20")
rallradiobtn1:SetPoint("TOPLEFT", 593, -325)
rallradiobtn1:SetScript("OnClick", function(self) if string.len(rapsebf1:GetText())>0 then rallradiobtn2:SetChecked(false) rallradiobtn1:SetChecked(true) else rallradiobtn1:SetChecked(true) rallradiobtn2:SetChecked(false) rapsebf1:SetFocus(true) end end )

rallradiobtn2 = CreateFrame("CheckButton", nil, zzralistach, "SendMailRadioButtonTemplate")
rallradiobtn2:SetWidth("20")
rallradiobtn2:SetHeight("20")
rallradiobtn2:SetPoint("TOPLEFT", 593, -355)
rallradiobtn2:SetScript("OnClick", function(self) rallradiobtn1:SetChecked(false) rallradiobtn2:SetChecked(true) rapsebf1:SetText("") rapsebf1:ClearFocus() end )

local t2 = zzralistach:CreateFontString()
t2:SetFont(GameFontNormal:GetFont(), 14)
t2:SetText(rallwhisper)
t2:SetJustifyH("LEFT")
t2:SetJustifyV("TOP")
t2:SetPoint("TOPLEFT",640,-308)
t2:SetWidth(100)
t2:SetHeight(25)


psllinfscroll = CreateFrame("ScrollFrame", "psllinfscroll", zzralistach, "UIPanelScrollFrameTemplate")
psllinfscroll:SetPoint("TOPLEFT", zzralistach, "TOPLEFT", 20, -310)
psllinfscroll:SetHeight(180)
psllinfscroll:SetWidth(550)


--скролл фрейм с ачивками
psllinfframe = CreateFrame("ScrollingMessageFrame", "psllinfframe", psllinfscroll)

psllinfframe:SetPoint("TOPRIGHT", psllinfscroll, "TOPRIGHT", 0, 0)
psllinfframe:SetPoint("TOPLEFT", psllinfscroll, "TOPLEFT", 0, 0)
psllinfframe:SetPoint("BOTTOMRIGHT", psllinfscroll, "BOTTOMRIGHT", 0, 0)
psllinfframe:SetPoint("BOTTOMLEFT", psllinfscroll, "BOTTOMLEFT", 0, 0)
psllinfframe:SetFont(GameFontNormal:GetFont(), 12) --ыытест как появится ТОП пролистывание, сменить размер на 12
psllinfframe:SetMaxLines(100)
psllinfframe:SetHyperlinksEnabled(true)
psllinfframe:SetScript("OnHyperlinkClick", function(self,link,text,button) SetItemRef(link,text,button) end)
psllinfframe:SetHeight(155)
psllinfframe:SetWidth(540)
psllinfframe:Show()
psllinfframe:SetFading(false)
psllinfframe:SetJustifyH("LEFT")
psllinfframe:SetJustifyV("TOP")
--psllinfframe:SetInsertMode("TOP") --ыытест to check after 4.0.1




psllinfscroll:SetScrollChild(psllinfframe)
psllinfscroll:Show()


--tooltip change
rallbosstooltipcb = CreateFrame("CheckButton", nil, zzralistach, "UICheckButtonTemplate")
rallbosstooltipcb:SetWidth("20")
rallbosstooltipcb:SetHeight("20")
rallbosstooltipcb:SetPoint("TOPLEFT", 42, -214)
rallbosstooltipcb:SetScript("OnClick", function(self) icllgalkatt(1) end )

rallbosstooltipcb2 = CreateFrame("CheckButton", nil, zzralistach, "UICheckButtonTemplate")
rallbosstooltipcb2:SetWidth("20")
rallbosstooltipcb2:SetHeight("20")
rallbosstooltipcb2:SetPoint("TOPLEFT", 20, -214)
rallbosstooltipcb2:SetScript("OnClick", function(self) icllgalkatt(2) end )

if rallbosstooltip then
rallbosstooltipcb:SetChecked(true)
else
rallbosstooltipcb:SetChecked(false)
end

if rallbosschaton then
rallbosstooltipcb2:SetChecked(true)
else
rallbosstooltipcb2:SetChecked(false)
end


rallbosstooltiptxt = zzralistach:CreateFontString()
rallbosstooltiptxt:SetFont(GameFontNormal:GetFont(), 12)
local ttyt=""
if rallbosschaton then
ttyt="|cff00ff00"..rallchatshowboss.."|r"
else
ttyt="|cffff0000"..rallchatshowboss.."|r"
end

if rallbosstooltip then
ttyt=ttyt.." / |cff00ff00"..ralltooltiptxt.."|r"
else
ttyt=ttyt.." / |cffff0000"..ralltooltiptxt.."|r"
end

rallbosstooltiptxt:SetText(ttyt)
rallbosstooltiptxt:SetJustifyH("LEFT")
rallbosstooltiptxt:SetPoint("TOPLEFT",64, -211)
rallbosstooltiptxt:SetHeight(23)



psllcheckbuttontable={}
psllcheckbuttontable2={}
local txttable={ralltxt1,ralltxt2,ralltxt3,ralltxt4,ralltxt5,ralltxt6,ralltxt7,ralltxt8,ralltxt9,ralltxt10,ralltxt11,ralltxt12}
local o=0
for i=1,12 do
if i==7 then
o=15
end
if i==8 then
o=30
end
if i==1 or i==7 then
local c = CreateFrame("CheckButton", nil, zzralistach, "OptionsCheckButtonTemplate")
c:SetWidth("20")
c:SetHeight("20")
c:SetPoint("TOPLEFT", 20, -79-i*15-o)
c:SetScript("OnClick", function(self) icllgalka(i) end )
table.insert(psllcheckbuttontable, c)
else
local c = CreateFrame("CheckButton", nil, zzralistach, "SendMailRadioButtonTemplate")
c:SetWidth("16")
c:SetHeight("16")
c:SetPoint("TOPLEFT", 22, -81-i*15-o)
c:SetScript("OnClick", function(self) icllgalkaradio(i) end )
table.insert(psllcheckbuttontable, c)
end

--txt
local t = zzralistach:CreateFontString()
if i==1 or i==7 then
t:SetFont(GameFontNormal:GetFont(), 13)
else
t:SetFont(GameFontNormal:GetFont(), 11)
end
t:SetText(txttable[i])
t:SetJustifyH("LEFT")
t:SetPoint("TOPLEFT",42, -77-i*15-o)
t:SetHeight(23)
table.insert(psllcheckbuttontable2, t)


end

--only char achieves
ralloptionTrackCharAchievesCB = CreateFrame("CheckButton", nil, zzralistach, "OptionsCheckButtonTemplate")
ralloptionTrackCharAchievesCB:SetWidth("20")
ralloptionTrackCharAchievesCB:SetHeight("20")
ralloptionTrackCharAchievesCB:SetPoint("TOPLEFT", 350, -229)
ralloptionTrackCharAchievesCB:SetScript("OnClick", function(self) if ralloptionTrackCharAchieves then ralloptionTrackCharAchieves=false icllcheckachieves() else ralloptionTrackCharAchieves=true icllcheckachieves() end end )
local t2 = zzralistach:CreateFontString()
t2:SetFont(GameFontNormal:GetFont(), 11)
t2:SetText("NEW! "..ralltextoptionCharAch)
t2:SetJustifyH("LEFT")
t2:SetPoint("TOPLEFT",372, -227)
t2:SetHeight(23)

icllsetgalki()

end
end


function iclldrawtext2()
if iclldrawtime2==nil then
iclldrawtime2=1

local t = zzralistach2:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), 12)
t:SetText(ralltitle3)
t:SetJustifyH("LEFT")
t:SetJustifyV("TOP")
t:SetPoint("TOPLEFT",20,-15)
t:SetWidth(700)
t:SetHeight(155)

--отправить инфо
rapsebf2 = CreateFrame("EditBox", "rallpseb2", zzralistach2,"InputBoxTemplate")
rapsebf2:SetAutoFocus(false)
rapsebf2:SetHeight(20)
rapsebf2:SetWidth(120)
rapsebf2:SetPoint("TOPLEFT", 617, -324)
rapsebf2:Show()
rapsebf2:SetScript("OnTextChanged", function(self) if string.len(rapsebf2:GetText())>0 then rallradiobtn11:SetChecked(true) rallradiobtn22:SetChecked(false) else rallradiobtn11:SetChecked(false) rallradiobtn22:SetChecked(true) end end )
rapsebf2:SetScript("OnEnterPressed", function(self) rapsebf2:ClearFocus() end )
rapsebf2:SetScript("OnEditFocusLost", function(self) if string.len(rapsebf2:GetText())==0 then rallradiobtn11:SetChecked(false) rallradiobtn22:SetChecked(true) end end)


rallradiobtn11 = CreateFrame("CheckButton", nil, zzralistach2, "SendMailRadioButtonTemplate")
rallradiobtn11:SetWidth("20")
rallradiobtn11:SetHeight("20")
rallradiobtn11:SetPoint("TOPLEFT", 593, -325)
rallradiobtn11:SetScript("OnClick", function(self) if string.len(rapsebf2:GetText())>0 then rallradiobtn22:SetChecked(false) rallradiobtn11:SetChecked(true) else rallradiobtn11:SetChecked(true) rallradiobtn22:SetChecked(false) rapsebf2:SetFocus(true) end end )

rallradiobtn22 = CreateFrame("CheckButton", nil, zzralistach2, "SendMailRadioButtonTemplate")
rallradiobtn22:SetWidth("20")
rallradiobtn22:SetHeight("20")
rallradiobtn22:SetPoint("TOPLEFT", 593, -355)
rallradiobtn22:SetScript("OnClick", function(self) rallradiobtn11:SetChecked(false) rallradiobtn22:SetChecked(true) rapsebf2:SetText("") rapsebf2:ClearFocus() end )

local ttm={{640,50,250,450},{-308,-200,-200,-200},{rallwhisper,rallmanualtxt1,rallmanualtxt2,rallmanualtxt3}}
for tter=1,4 do
local t2 = zzralistach2:CreateFontString()
t2:SetFont(GameFontNormal:GetFont(), 14)
t2:SetText(ttm[3][tter])
t2:SetJustifyH("LEFT")
t2:SetJustifyV("TOP")
t2:SetPoint("TOPLEFT",ttm[1][tter],ttm[2][tter])
t2:SetWidth(100)
t2:SetHeight(25)
end


psllinfscroll2 = CreateFrame("ScrollFrame", "psllinfscroll2", zzralistach2, "UIPanelScrollFrameTemplate")
psllinfscroll2:SetPoint("TOPLEFT", zzralistach2, "TOPLEFT", 20, -260)
psllinfscroll2:SetHeight(230)
psllinfscroll2:SetWidth(550)


--скролл фрейм с ачивками
psllinfframe2 = CreateFrame("ScrollingMessageFrame", "psllinfframe2", psllinfscroll2)

psllinfframe2:SetPoint("TOPRIGHT", psllinfscroll2, "TOPRIGHT", 0, 0)
psllinfframe2:SetPoint("TOPLEFT", psllinfscroll2, "TOPLEFT", 0, 0)
psllinfframe2:SetPoint("BOTTOMRIGHT", psllinfscroll2, "BOTTOMRIGHT", 0, 0)
psllinfframe2:SetPoint("BOTTOMLEFT", psllinfscroll2, "BOTTOMLEFT", 0, 0)
psllinfframe2:SetFont(GameFontNormal:GetFont(), 12) --ыытест как появится ТОП пролистывание, сменить размер на 12
psllinfframe2:SetMaxLines(100)
psllinfframe2:SetHyperlinksEnabled(true)
psllinfframe2:SetScript("OnHyperlinkClick", function(self,link,text,button) SetItemRef(link,text,button) end)
psllinfframe2:SetHeight(55)
psllinfframe2:SetWidth(540)
psllinfframe2:Show()
psllinfframe2:SetFading(false)
psllinfframe2:SetJustifyH("LEFT")
psllinfframe2:SetJustifyV("TOP")
--psllinfframe2:SetInsertMode("TOP") --ыытест to check after 4.0.1




psllinfscroll2:SetScrollChild(psllinfframe2)
psllinfscroll2:Show()



psllcheckbuttontablem1={}
--psllcheckbuttontablem2={}
local txttable={ralltxt2,ralltxt3,ralltxt4,ralltxt5,ralltxt6,ralltxt13}
for i=1,6 do
local c = CreateFrame("CheckButton", nil, zzralistach2, "SendMailRadioButtonTemplate")
c:SetWidth("16")
c:SetHeight("16")
c:SetPoint("TOPLEFT", 22, -81-i*15)
c:SetScript("OnClick", function(self) icllgalkaradiom2(i) end )
table.insert(psllcheckbuttontablem1, c)


--txt
local t = zzralistach2:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), 11)
t:SetText(txttable[i])
t:SetJustifyH("LEFT")
t:SetPoint("TOPLEFT",42, -77-i*15)
t:SetHeight(23)



end

rallmanualch1=#rallexpansions
rallmanualch2=1
rallmanualch3=1

openmenull2()
openmenullch1()
openmenullch2()
openmenullch3()

icllsetgalkim2()

end
end
















function iclldrawtext3()
if iclldrawtime3==nil then
iclldrawtime3=1

local t = zzralistach3:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), 12)
t:SetText(ralltitle33)
t:SetJustifyH("LEFT")
t:SetJustifyV("TOP")
t:SetPoint("TOPLEFT",20,-15)
t:SetWidth(700)
t:SetHeight(175)

--отправить инфо
rapsebf3 = CreateFrame("EditBox", "rallpsebf3", zzralistach3,"InputBoxTemplate")
rapsebf3:SetAutoFocus(false)
rapsebf3:SetHeight(20)
rapsebf3:SetWidth(120)
rapsebf3:SetPoint("TOPLEFT", 617, -324)
rapsebf3:Show()
rapsebf3:SetScript("OnTextChanged", function(self) if string.len(rapsebf3:GetText())>0 then rallradiobtn31:SetChecked(true) rallradiobtn32:SetChecked(false) else rallradiobtn31:SetChecked(false) rallradiobtn32:SetChecked(true) end end )
rapsebf3:SetScript("OnEnterPressed", function(self) rapsebf3:ClearFocus() end )
rapsebf3:SetScript("OnEditFocusLost", function(self) if string.len(rapsebf3:GetText())==0 then rallradiobtn31:SetChecked(false) rallradiobtn32:SetChecked(true) end end)


rallradiobtn31 = CreateFrame("CheckButton", nil, zzralistach3, "SendMailRadioButtonTemplate")
rallradiobtn31:SetWidth("20")
rallradiobtn31:SetHeight("20")
rallradiobtn31:SetPoint("TOPLEFT", 593, -325)
rallradiobtn31:SetScript("OnClick", function(self) if string.len(rapsebf3:GetText())>0 then rallradiobtn32:SetChecked(false) rallradiobtn31:SetChecked(true) else rallradiobtn31:SetChecked(true) rallradiobtn32:SetChecked(false) rapsebf3:SetFocus(true) end end )

rallradiobtn32 = CreateFrame("CheckButton", nil, zzralistach3, "SendMailRadioButtonTemplate")
rallradiobtn32:SetWidth("20")
rallradiobtn32:SetHeight("20")
rallradiobtn32:SetPoint("TOPLEFT", 593, -355)
rallradiobtn32:SetScript("OnClick", function(self) rallradiobtn31:SetChecked(false) rallradiobtn32:SetChecked(true) rapsebf3:SetText("") rapsebf3:ClearFocus() end )

local ttm={{640,450},{-308,-115},{rallwhisper,ralltactictext1}}
for tter=1,2 do
local t2 = zzralistach3:CreateFontString()
t2:SetFont(GameFontNormal:GetFont(), 14)
t2:SetText(ttm[3][tter])
t2:SetJustifyH("LEFT")
t2:SetJustifyV("TOP")
t2:SetPoint("TOPLEFT",ttm[1][tter],ttm[2][tter])
t2:SetWidth(300)
t2:SetHeight(25)
end

--вывод в едит бокс
rallinfscroll = CreateFrame("ScrollFrame", "rallinfscroll", zzralistach3, "UIPanelScrollFrameTemplate")
rallinfscroll:SetPoint("TOPLEFT", zzralistach3, "TOPLEFT", 20, -202)
rallinfscroll:SetHeight(285)
rallinfscroll:SetWidth(500)

rallinfframe = CreateFrame("EditBox", "rallinfframe", rallinfscroll)
rallinfframe:SetPoint("TOPRIGHT", rallinfscroll, "TOPRIGHT", 0, 0)
rallinfframe:SetPoint("TOPLEFT", rallinfscroll, "TOPLEFT", 0, 0)
rallinfframe:SetPoint("BOTTOMRIGHT", rallinfscroll, "BOTTOMRIGHT", 0, 0)
rallinfframe:SetPoint("BOTTOMLEFT", rallinfscroll, "BOTTOMLEFT", 0, 0)
rallinfframe:SetScript("onescapepressed", function(self) rallinfframe:ClearFocus() end)
rallinfframe:SetScript("OnEditFocusGained", function(self) if rallinfframe:GetText()==ralluilooktactic3 then rallinfframe:SetText("") end end)
rallinfframe:SetScript("OnEditFocusLost", function(self)
rallinfframe:SetFont(GameFontNormal:GetFont(), 12)


if zzralistach3_Button1:IsShown() then

if string.len(rallinfframe:GetText())<6 then
rallinfframe:SetText(ralluilooktactic3)
else
local length=string.len(rallinfframe:GetText())
local mtxt=rallinfframe:GetText()

if string.find(mtxt, "%\n") or string.find(mtxt, " ") then
while (string.find(mtxt, "%\n") or string.find(mtxt, " ")) do
	local first=0
	local first2=2
	if string.find(mtxt, "%\n") then
		first=string.find(mtxt, "%\n")
	end
	if first==0 or (string.find(mtxt, " ") and string.find(mtxt, " ")<first) then
		first=string.find(mtxt, " ")
		first2=1
	end
	mtxt=string.sub(mtxt,first+1)
	length=length-first2
end
end

if length<6 then
rallinfframe:SetText(ralluilooktactic3)
end
end

else
rallinfframe:SetText("")
end

end)





rallinfframe:SetFont(GameFontNormal:GetFont(), 12)
rallinfframe:SetMultiLine(true)
rallinfframe:SetAutoFocus(false)
rallinfframe:SetHeight(470)
rallinfframe:SetWidth(490)
rallinfframe:Show()

rallinfscroll:SetScrollChild(rallinfframe)
rallinfscroll:Show()


rallzoneandachname = CreateFrame("ScrollingMessageFrame", "psllinfframetac", zzralistach3)

rallzoneandachname:SetPoint("TOPLEFT",255,-144)
rallzoneandachname:SetFont(GameFontNormal:GetFont(), 12)
rallzoneandachname:SetMaxLines(1)
rallzoneandachname:SetHyperlinksEnabled(true)
rallzoneandachname:SetScript("OnHyperlinkClick", function(self,link,text,button) SetItemRef(link,text,button) end)
rallzoneandachname:SetHeight(35)
rallzoneandachname:SetWidth(460)
rallzoneandachname:Show()
rallzoneandachname:SetFading(false)
rallzoneandachname:SetJustifyH("LEFT")
rallzoneandachname:SetJustifyV("TOP")



psllcheckbuttontablem31={}
local txttable={ralltxt2,ralltxt3}
for i=1,2 do
local c = CreateFrame("CheckButton", nil, zzralistach3, "SendMailRadioButtonTemplate")
c:SetWidth("16")
c:SetHeight("16")
c:SetPoint("TOPLEFT", 22, -105-i*15)
c:SetScript("OnClick", function(self) icllgalkaradiom3(i) end )
table.insert(psllcheckbuttontablem31, c)


--txt
local t = zzralistach3:CreateFontString()
t:SetFont(GameFontNormal:GetFont(), 11)
t:SetText(txttable[i])
t:SetJustifyH("LEFT")
t:SetPoint("TOPLEFT",42, -101-i*15)
t:SetHeight(23)



end

--rallmanualch31=1
--rallmanualch32=1
--rallmanualch33=1
rallmanualch34=1

openmenull3()


icllsetgalkim3()

end

openmenullch34()
end



function icllsetgalki()
if ralloptions[2]+ralloptions[3]+ralloptions[4]+ralloptions[5]+ralloptions[6]~=1 then
ralloptions[2]=1
for i=3,6 do
ralloptions[i]=0
end
end
if ralloptions[8]+ralloptions[9]+ralloptions[10]+ralloptions[11]+ralloptions[12]~=1 then
ralloptions[8]=1
for i=9,12 do
ralloptions[i]=0
end
end
for i=1,12 do
	if ralloptions[i]==nil then ralloptions[i]=0 end
	if ralloptions[i]==1 then
		psllcheckbuttontable[i]:SetChecked(true)
	else
		psllcheckbuttontable[i]:SetChecked(false)
	end
	if i==1 then
		if ralloptions[i]==1 then
			psllcheckbuttontable2[i]:SetText("|cff00ff00"..ralltxton.."|r "..ralltxt1)
		else
			psllcheckbuttontable2[i]:SetText("|cffff0000"..ralltxtoff.."|r "..ralltxt1)
		end
	end
	if i==7 then
		if ralloptions[i]==1 then
			psllcheckbuttontable2[i]:SetText("|cff00ff00"..ralltxton.."|r "..ralltxt7)
		else
			psllcheckbuttontable2[i]:SetText("|cffff0000"..ralltxtoff.."|r "..ralltxt7)
		end
	end
end
if ralloptionTrackCharAchieves then
	ralloptionTrackCharAchievesCB:SetChecked(true)
else
	ralloptionTrackCharAchievesCB:SetChecked(false)
end
end

function icllsetgalkim2()
if ralloptionsmanual[1]+ralloptionsmanual[2]+ralloptionsmanual[3]+ralloptionsmanual[4]+ralloptionsmanual[5]+ralloptionsmanual[6]~=1 then
ralloptionsmanual[1]=1
for i=2,6 do
ralloptionsmanual[i]=0
end
end

for i=1,6 do
	if ralloptionsmanual[i]==nil then ralloptionsmanual[i]=0 end
	if ralloptionsmanual[i]==1 then
		psllcheckbuttontablem1[i]:SetChecked(true)
	else
		psllcheckbuttontablem1[i]:SetChecked(false)
	end
end
end

function icllsetgalkim3()

for i=1,2 do
	if ralloptionsmanual3[i]==nil then ralloptionsmanual3[i]=0 end
	if ralloptionsmanual3[i]==1 then
		psllcheckbuttontablem31[i]:SetChecked(true)
	else
		psllcheckbuttontablem31[i]:SetChecked(false)
	end
end
end

function icllgalka(i)
if ralloptions[i]==1 then ralloptions[i]=0 else ralloptions[i]=1 end
	if i==1 then
		if ralloptions[i]==1 then
			psllcheckbuttontable2[i]:SetText("|cff00ff00"..ralltxton.."|r "..ralltxt1)
		else
			psllcheckbuttontable2[i]:SetText("|cffff0000"..ralltxtoff.."|r "..ralltxt1)
		end
	icllcheckachieves()
	end
	if i==7 then
		if ralloptions[i]==1 then
			RaidAchievement_reminder:RegisterEvent("PLAYER_TARGET_CHANGED")
			if rallbosstooltip then
				RaidAchievement_reminder:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
			end
			psllcheckbuttontable2[i]:SetText("|cff00ff00"..ralltxton.."|r "..ralltxt7)
		else
			psllcheckbuttontable2[i]:SetText("|cffff0000"..ralltxtoff.."|r "..ralltxt7)
			RaidAchievement_reminder:UnregisterEvent("PLAYER_TARGET_CHANGED")
			RaidAchievement_reminder:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
		end
	end
end

function icllgalkatt(i)
if i==1 then
if rallbosstooltip then
	rallbosstooltip=false
	RaidAchievement_reminder:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
else
	rallbosstooltip=true
	if ralloptions[7]==1 then
		RaidAchievement_reminder:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	end
end
end

if i==2 then
if rallbosschaton then
	rallbosschaton=false
else
	rallbosschaton=true
end
end

local ttyt=""
if rallbosschaton then
ttyt="|cff00ff00"..rallchatshowboss.."|r"
else
ttyt="|cffff0000"..rallchatshowboss.."|r"
end

if rallbosstooltip then
ttyt=ttyt.." / |cff00ff00"..ralltooltiptxt.."|r"
else
ttyt=ttyt.." / |cffff0000"..ralltooltiptxt.."|r"
end
rallbosstooltiptxt:SetText(ttyt)
end


function icllgalkaradio(i)
if i>1 and i<7 then
for p=2,6 do
	if p==i then
		ralloptions[p]=1
	else
		ralloptions[p]=0
	end
end
icllcheckachieves()
end

if i>7 and i<13 then
for p=8,12 do
	if p==i then
		ralloptions[p]=1
	else
		ralloptions[p]=0
	end
end
table.wipe(rallnomorereport[3])
table.wipe(rallnomorereport[4])
rallnomorereport[3]={0}
rallnomorereport[4]={0}
table.wipe(ralltooltipready[1])
table.wipe(ralltooltipready[2])
table.wipe(ralltooltipready[3])
ralltooltipready={{0},{0},{{0}}}
rallbosscheck(1)
end

icllsetgalki()
end

function icllgalkaradiom2(i)
for p=1,6 do
	if p==i then
		ralloptionsmanual[p]=1
	else
		ralloptionsmanual[p]=0
	end
end

icllsetgalkim2()
icllcheckachievesm2()
end

function icllgalkaradiom3(i)
for p=1,2 do
	if p==i then
		ralloptionsmanual3[p]=1
	else
		ralloptionsmanual3[p]=0
	end
end

icllsetgalkim3()
openmenullch34()
end


function icllcheckachieves(reportself,channel,nickforwhisp)
if ralloptions[1]==1 then


local a1, a2, a3, a4, a5 = GetInstanceInfo()
SetMapToCurrentZone()
if a2=="pvp" or a2=="raid" or a2=="scenario" or a3==14 or a3==15 or a3==16 or (a2=="party" and (a3==2 or a3==23)) or select(3,GetInstanceInfo())==2 or (select(3,GetInstanceInfo())==1 and a2=="scenario") then


--проверка по имени локации, если имя встречается дважды - проверяется цифра на сколько чел расчитано и с той колонкой работаем

local found=0
local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
if select(3,GetInstanceInfo())==17 then
--no LFR
else
local curZoneID=GetCurrentMapAreaID()
for kj=1,#ralllocations do
	if ralllocations[kj]==curZoneID then
		found=found+1
		rallcolonka=kj
	end
end
end--lfr


if found==0 then
	if psllinfframe then
		psllinfframe:Clear()
		psllinfframe:AddMessage(rallzonenotfound)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
				psllinfframe:SetHeight(40)
			end
	end
else
local curZoneID=GetCurrentMapAreaID()
if found>1 then
	rallcolonka=0
	for bv=1,#ralllocations do
		if ralllocations[bv]==curZoneID then
			if ralltip[bv]=="10" or ralltip[bv]=="25" then
			if tonumber(ralltip[bv])==a5 then
				rallcolonka=bv
			end
			else
					rallcolonka=bv
			end
		end
	end
end

if rallcolonka>0 then

--тут уже идут проверки на настройки и вывод инфо
local texttableout={}
local texttableout2={}
local reportqu=0

if ralloptions[2]==1 then
	for i=1,#rallachieve[rallcolonka] do
	if rallachieve[rallcolonka][i]>0 and GetAchievementLink(rallachieve[rallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[rallcolonka][i]==0 then
			if #texttableout==0 then
				local cur_zone=GetMapNameByID(GetCurrentMapAreaID())
				if cur_zone==nil then
					cur_zone="Unknown zone"
				end
				table.insert(texttableout,rallachiverepl1.." '"..cur_zone.."':")
				table.insert(texttableout2,rallachiverepl1.." '"..cur_zone.."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[rallcolonka][i]))

			--критерия
			if GetAchievementNumCriteria(rallachieve[rallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			reportqu=reportqu+1
			if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallglory..")|r"
			end
			if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnoaddontrack..")|r"
			end
			if rallboss[rallcolonka][i][1]==0 and ralltip[rallcolonka]~=ramainbattleground and rallcontent[rallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
			if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..ralltactictext3..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe then
	psllinfframe:Clear()
	psllinfframe:AddMessage(rallachiverepl2)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
	psllinfframe:SetHeight(40)
			end
end
end



elseif ralloptions[3]==1 then



	for i=1,#rallachieve[rallcolonka] do
	if GetAchievementLink(rallachieve[rallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])

		if rallfullver[rallcolonka][i]==0 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl4.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
				table.insert(texttableout2,rallachiverepl4.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[rallcolonka][i]))
			

			reportqu=reportqu+1
			if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel1..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallachdonel1..")|r"
			else
			
          --критерия
          if GetAchievementNumCriteria(rallachieve[rallcolonka][i])>1 then
          local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],1)
          local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],2)
          if b1 and b4 and b5 and c1==nil then
            texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
            texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
          end
          end

					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel2..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallachdonel2..")|r"
			end
			if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallglory..")|r"
			end
			if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnoaddontrack..")|r"
			end
			if rallboss[rallcolonka][i][1]==0 and ralltip[rallcolonka]~=ramainbattleground and rallcontent[rallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
			if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..ralltactictext3..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe then
	psllinfframe:Clear()
	psllinfframe:AddMessage(rallachiverepl5)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
	psllinfframe:SetHeight(40)
			end
end
end



elseif ralloptions[4]==1 then
	for i=1,#rallachieve[rallcolonka] do
	if GetAchievementLink(rallachieve[rallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[rallcolonka][i]==0 and rallmeta[rallcolonka][i]==1 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl8.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
				table.insert(texttableout2,rallachiverepl8.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[rallcolonka][i]))
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[rallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			reportqu=reportqu+1
			if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnoaddontrack..")|r"
			end
			if rallboss[rallcolonka][i][1]==0 and ralltip[rallcolonka]~=ramainbattleground and rallcontent[rallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
			if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..ralltactictext3..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe then
	psllinfframe:Clear()
	psllinfframe:AddMessage(rallachiverepl9)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
	psllinfframe:SetHeight(40)
			end
end
end




elseif ralloptions[5]==1 then



	for i=1,#rallachieve[rallcolonka] do
	if GetAchievementLink(rallachieve[rallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
		if rallfullver[rallcolonka][i]==0 and rallmeta[rallcolonka][i]==1 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl10.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
				table.insert(texttableout2,rallachiverepl10.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[rallcolonka][i]))
			

			reportqu=reportqu+1
			if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel1..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallachdonel1..")|r"
			else
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[rallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel2..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallachdonel2..")|r"
			end

			if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnoaddontrack..")|r"
			end
			if rallboss[rallcolonka][i][1]==0 and ralltip[rallcolonka]~=ramainbattleground and rallcontent[rallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
			if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..ralltactictext3..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe then
	psllinfframe:Clear()
	psllinfframe:AddMessage(rallachiverepl11)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
	psllinfframe:SetHeight(40)
			end
end
end



elseif ralloptions[6]==1 then
	for i=1,#rallachieve[rallcolonka] do
	if GetAchievementLink(rallachieve[rallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl12.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
				table.insert(texttableout2,rallachiverepl12.." '"..GetMapNameByID(GetCurrentMapAreaID()).."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[rallcolonka][i]))
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[rallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[rallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			reportqu=reportqu+1
			if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallglory..")|r"
			end
			if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnoaddontrack..")|r"
			end
			if rallboss[rallcolonka][i][1]==0 and ralltip[rallcolonka]~=ramainbattleground and rallcontent[rallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
			if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..ralltactictext3..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe then
	psllinfframe:Clear()
	psllinfframe:AddMessage(rallachiverepl2)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
	psllinfframe:SetHeight(40)
			end
end
end






end





--вывод репорта
if #texttableout>0 then
if psllinfframe then
	psllinfframe:Clear()
	for i=1,#texttableout2 do
		psllinfframe:AddMessage(texttableout2[i])
	end
	if psllinfframe:GetHeight()>(#texttableout*12.4+10) and psllinfframe:GetHeight()<(#texttableout*12.4+30) then
	else
		psllinfframe:SetHeight(#texttableout*12.4+20) --ыытест
	end
end

--текст
if channel and channel~="sebe" then
rallreportinchat(texttableout,channel,nickforwhisp)
elseif reportself or channel=="sebe" then
	if (reportself and reportqu<12) or channel=="sebe" then
    for i=1,#texttableout do
        print(texttableout2[i])
    end
	else
		print(format(rallachiverepl7,reportqu))
	end
end








end


end

end


else
	if psllinfframe then
		psllinfframe:Clear()
		psllinfframe:AddMessage(rallachiverepl3)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
		psllinfframe:SetHeight(40)
			end
	end
end

else
	if psllinfframe then
		psllinfframe:Clear()
		psllinfframe:AddMessage(rallachiverepl6)
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
		psllinfframe:SetHeight(40)
			end
	end
rallcolonka=0
end
end


function rallreportinchat(texttableout,chat,whisp)

if chat and (chat=="party" or chat=="raid" or chat=="raid_warning") and (select(3,GetInstanceInfo())==17 or IsLFGModeActive(LE_LFG_CATEGORY_LFD)) then
chat="Instance_CHAT"
end

for i=1,#texttableout do
if string.len(texttableout[i])>1 then

if chat=="sebe" then
DEFAULT_CHAT_FRAME:AddMessage(texttableout[i])
elseif chat=="whisper" then

local bna=GetAutoCompletePresenceID(whisp)

if bna then
BNSendWhisper(bna, texttableout[i])
else
SendChatMessage(texttableout[i], "WHISPER", nil, whisp)
end


else
local bililine=0
for i,cc in ipairs(rabigmenuchatlisten) do 
if cc == chat then bililine=1
end end
if chat=="Instance_CHAT" then
bililine=1
end

	if bililine==1 then

		SendChatMessage(texttableout[i], chat)
	else


local nrchatmy=GetChannelName(chat)
		if nrchatmy==0 then
	JoinPermanentChannel(chat)
	ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, chat)
	nrchatmy=GetChannelName(chat)
		end
if nrchatmy>0 then
SendChatMessage(texttableout[i], "CHANNEL",nil,nrchatmy)
end

	end
end


end
end
end


function openmenull()
if not DropDownMenureportll then
CreateFrame("Frame", "DropDownMenureportll", zzralistach, "UIDropDownMenuTemplate")
end
DropDownMenureportll:ClearAllPoints()
DropDownMenureportll:SetPoint("TOPLEFT", 595, -351)
DropDownMenureportll:Show()
local items = bigmenuchatlistea
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenureportll, self:GetID())

arbigmenuchatea(self:GetID())
wherereportll=wherereporttempbigma
end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end

if wherereportll==nil then wherereportll="raid" end

arbigmenuchatea2(wherereportll)

if bigma2num==0 then
bigma2num=1
wherereportll="raid"
end

UIDropDownMenu_Initialize(DropDownMenureportll, initialize)
UIDropDownMenu_SetWidth(DropDownMenureportll, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenureportll, 125)
UIDropDownMenu_SetSelectedID(DropDownMenureportll,bigma2num)
UIDropDownMenu_JustifyText(DropDownMenureportll, "LEFT")
end

function openmenull2()
if not DropDownMenureportll2 then
CreateFrame("Frame", "DropDownMenureportll2", zzralistach2, "UIDropDownMenuTemplate")
end
DropDownMenureportll2:ClearAllPoints()
DropDownMenureportll2:SetPoint("TOPLEFT", 595, -351)
DropDownMenureportll2:Show()
local items = bigmenuchatlistea
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenureportll2, self:GetID())

arbigmenuchatea(self:GetID())
wherereportll3=wherereporttempbigma
end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end

if wherereportll3==nil then wherereportll3="raid" end

arbigmenuchatea2(wherereportll3)

if bigma2num==0 then
bigma2num=1
wherereportll3="raid"
end

UIDropDownMenu_Initialize(DropDownMenureportll2, initialize)
UIDropDownMenu_SetWidth(DropDownMenureportll2, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenureportll2, 125)
UIDropDownMenu_SetSelectedID(DropDownMenureportll2,bigma2num)
UIDropDownMenu_JustifyText(DropDownMenureportll2, "LEFT")
end

function openmenull3()
if not DropDownMenureportll3 then
CreateFrame("Frame", "DropDownMenureportll3", zzralistach3, "UIDropDownMenuTemplate")
end
DropDownMenureportll3:ClearAllPoints()
DropDownMenureportll3:SetPoint("TOPLEFT", 595, -351)
DropDownMenureportll3:Show()
local items = bigmenuchatlistea
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenureportll3, self:GetID())

arbigmenuchatea(self:GetID())
wherereportll33=wherereporttempbigma
end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end

if wherereportll33==nil then wherereportll33="raid" end

arbigmenuchatea2(wherereportll33)

if bigma2num==0 then
bigma2num=1
wherereportll33="raid"
end

UIDropDownMenu_Initialize(DropDownMenureportll3, initialize)
UIDropDownMenu_SetWidth(DropDownMenureportll3, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenureportll3, 125)
UIDropDownMenu_SetSelectedID(DropDownMenureportll3,bigma2num)
UIDropDownMenu_JustifyText(DropDownMenureportll3, "LEFT")
end

function rallwhispbutfun()
if string.len(rapsebf1:GetText())>0 then
icllcheckachieves(nil,"whisper",rapsebf1:GetText())
else
icllcheckachieves(nil,wherereportll)
end
end

function rallwhispbutfun2()
if string.len(rapsebf2:GetText())>0 then
icllcheckachievesm2("whisper",rapsebf2:GetText())
else
icllcheckachievesm2(wherereportll3)
end
end


function rallbosscheck(showme)
if rallcolonka>0 and ralloptions[7]==1 then
if UnitGUID("target") then
local guui=UnitGUID("target")
if guui then
local a1=3 --tonumber(string.sub(guui,5,5)) deleted guid changed in wow
if a1==3 or a1==5 then
local a2=arGetUnitID(guui)

local bil=0
for i=1,#rallboss[rallcolonka] do
	for j=1,#rallboss[rallcolonka][i] do
		if rallboss[rallcolonka][i][j]==a2 then
			bil=1
		end
	end
end
if bil==1 then
local _, _, _, _, ai5 = GetInstanceInfo()
for k=1,#rallnomorereport[3] do
	if rallnomorereport[3][k]==a2 and ai5==rallnomorereport[4][k] and showme==nil then
		bil=0
	end
end
if bil==1 then

local tocpvp={34461,34460,34465,34466,34467,34468,34469,34471,34472,34473,34463,34470,34474,34475}
if UnitFactionGroup("player")=="Alliance" then
tocpvp={34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453}
end

--ыытест босс двойной
local bossdabl={{37970,37972,37973},{34496,34497},{32857,32927,32867},{16064,16065,30549,16063},{15929,15930},{32915,32913,32914},{31125,33993,35013},tocpvp,{47296,47297},{33350,33432},{28684,28730,28729,28731},{42178,42166,42179,42180},{45992,45993},{43735,43686,43687,43688,43689},{45871,45870,45872},{52577,53087,52558}}

local fff=0

for g=1,#bossdabl do
	for t=1,#bossdabl[g] do
		if bossdabl[g][t]==a2 then
			fff=g
		end
	end
end

if fff>0 then
	for d=1,#bossdabl[fff] do
		table.insert(rallnomorereport[3],bossdabl[fff][d])
		table.insert(rallnomorereport[4],ai5)
	end
else
table.insert(rallnomorereport[3],a2)
table.insert(rallnomorereport[4],ai5)
end


rallreportbossachfound(a2,UnitName("target"),showme)
else
local vbil=0
for fd=1,#ralltooltipready[1] do
	if ralltooltipready[1][fd]==a2 then
		vbil=1
	end
end
if vbil==0 then
rallreportbossachfound(a2,UnitName("target"),showme,1)
end



end
end
end
end
end
end
end


function rallreportbossachfound(id,nick,showme,onlytooltip)

local texttableout={}
local achlist={}

if ralloptions[8]==1 then
	for i=1,#rallboss[rallcolonka] do
		for j=1,#rallboss[rallcolonka][i] do
			if rallboss[rallcolonka][i][j]==id then
				local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
				if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[rallcolonka][i]==0 then
					if #texttableout==0 then
						table.insert(texttableout,rallachiverepl13.." '"..nick.."':")
					end
					table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
          if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
            texttableout[#texttableout]=texttableout[#texttableout].." |cff00ff00("..rallglory..")|r"
          end
					if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallnoaddontrack..")|r"
					end
					if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
						texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..ralltactictext3..")|r"
					end
					table.insert(achlist,rallachieve[rallcolonka][i])
				end
			end
		end
	end


elseif ralloptions[9]==1 then
	for i=1,#rallboss[rallcolonka] do
		for j=1,#rallboss[rallcolonka][i] do
			if rallboss[rallcolonka][i][j]==id then
				local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
				if rallfullver[rallcolonka][i]==0 then
					if #texttableout==0 then
						table.insert(texttableout,rallachiverepl14.." '"..nick.."':")
					end
					table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
					if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
							texttableout[#texttableout]=texttableout[#texttableout].." |cff00ff00("..rallachdonel1..")|r"
					else
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallachdonel2..")|r"
					end
          if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
            texttableout[#texttableout]=texttableout[#texttableout].." |cff00ff00("..rallglory..")|r"
          end
					if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallnoaddontrack..")|r"
					end
					if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
						texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..ralltactictext3..")|r"
					end
					table.insert(achlist,rallachieve[rallcolonka][i])
				end
			end
		end
	end

elseif ralloptions[10]==1 then
	for i=1,#rallboss[rallcolonka] do
		for j=1,#rallboss[rallcolonka][i] do
			if rallboss[rallcolonka][i][j]==id then
				local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
				if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[rallcolonka][i]==0 and rallmeta[rallcolonka][i]==1 then
					if #texttableout==0 then
						table.insert(texttableout,rallachiverepl16.." '"..nick.."':")
					end
					table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
					if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallnoaddontrack..")|r"
					end
					if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
						texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..ralltactictext3..")|r"
					end
					table.insert(achlist,rallachieve[rallcolonka][i])
				end
			end
		end
	end


elseif ralloptions[11]==1 then
	for i=1,#rallboss[rallcolonka] do
		for j=1,#rallboss[rallcolonka][i] do
			if rallboss[rallcolonka][i][j]==id then
				local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
				if rallfullver[rallcolonka][i]==0 and rallmeta[rallcolonka][i]==1 then
					if #texttableout==0 then
						table.insert(texttableout,rallachiverepl17.." '"..nick.."':")
					end
					table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
					if completed then
							texttableout[#texttableout]=texttableout[#texttableout].." |cff00ff00("..rallachdonel1..")|r"
					else
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallachdonel2..")|r"
					end
					if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallnoaddontrack..")|r"
					end
					if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
						texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..ralltactictext3..")|r"
					end
					table.insert(achlist,rallachieve[rallcolonka][i])
				end
			end
		end
	end

elseif ralloptions[12]==1 then
	for i=1,#rallboss[rallcolonka] do
		for j=1,#rallboss[rallcolonka][i] do
			if rallboss[rallcolonka][i][j]==id then
				local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[rallcolonka][i])
				if completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false) then
					if #texttableout==0 then
						table.insert(texttableout,rallachiverepl18.." '"..nick.."':")
					end
					table.insert(texttableout,GetAchievementLink(rallachieve[rallcolonka][i]))
          if rallmeta[rallcolonka][i]==1 and ralltip[rallcolonka]~=ramainbattleground then
            texttableout[#texttableout]=texttableout[#texttableout].." |cff00ff00("..rallglory..")|r"
          end
					if ralltrack[rallcolonka][i]==0 and ralltip[rallcolonka]~=ramainbattleground then
							texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..rallnoaddontrack..")|r"
					end
					if ralltip[rallcolonka]~=ramainbattleground and ralltactics[rallcolonka][i]~=0 and ralltacticsdif[rallcolonka][i]==1 then
						texttableout[#texttableout]=texttableout[#texttableout].." |cffff0000("..ralltactictext3..")|r"
					end
					table.insert(achlist,rallachieve[rallcolonka][i])
				end
			end
		end
	end

end

--вывод
if onlytooltip==nil then
if #texttableout>0 then
	if rallbosschaton then
	for i=1,#texttableout do
		print(texttableout[i])
	end
	end
elseif showme and rallbosschaton then
print (rallachiverepl15)
end
end

--сохранение ачивок
if #achlist>0 then

table.insert(ralltooltipready[1],id)
local _, _, _, _, ai5 = GetInstanceInfo()
table.insert(ralltooltipready[2],ai5)
table.insert(ralltooltipready[3],achlist)


if rallbosstooltip then
ralltooltipchangenow()
end
end


end









function icllcheckachievesm2(channel,nickforwhisp)

local locrallcolonka=0

local insid=0
for ty=1,#ralllocationnames do
	if ralllocationnames[ty]==ralltableofinstancebyname[rallmanualch3] then
		insid=ralllocations[ty]
	end
end



local found=0
for kj=1,#ralllocations do
	if ralllocations[kj]==insid then
		found=found+1
		locrallcolonka=kj
	end
end
if found==0 then
	if psllinfframe then
		psllinfframe:Clear()
		psllinfframe:AddMessage("error")
			if psllinfframe:GetHeight()>39 and psllinfframe:GetHeight()<41 then
			else
		psllinfframe:SetHeight(40)
			end
	end
else

if found>1 then
	locrallcolonka=0
	for bv=1,#ralllocations do
		if ralllocations[bv]==insid then
			if ralltip[bv]=="10" or ralltip[bv]=="25" then
			if ralltip[bv]==ralltableofinstancebyq[rallmanualch2] then
				locrallcolonka=bv
			end
			else
					locrallcolonka=bv
			end
		end
	end
end

if locrallcolonka>0 then

--тут уже идут проверки на настройки и вывод инфо
local texttableout={}
local texttableout2={}


--проверка что ачивка существует
if rallachieve[locrallcolonka][1] and GetAchievementLink(rallachieve[locrallcolonka][1]) then

if ralloptionsmanual[1]==1 then
	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[locrallcolonka][i]==0 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl1.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl1.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl2)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end



elseif ralloptionsmanual[2]==1 then


	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])

		if rallfullver[locrallcolonka][i]==0 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl4.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl4.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))
			
			if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel1..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallachdonel1..")|r"
			else
			
          --критерия
          if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
          local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
          local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
          if b1 and b4 and b5 and c1==nil then
            texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
            texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
          end
          end
      
      
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel2..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallachdonel2..")|r"
			end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl5)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end



elseif ralloptionsmanual[3]==1 then
	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[locrallcolonka][i]==0 and rallmeta[locrallcolonka][i]==1 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl8.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl8.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))


			--критерия
			if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl9)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end




elseif ralloptionsmanual[4]==1 then



	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])
		if rallfullver[locrallcolonka][i]==0 and rallmeta[locrallcolonka][i]==1 then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl10.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl10.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))


			if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel1..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallachdonel1..")|r"
			else
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel2..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallachdonel2..")|r"
			end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl11)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end



elseif ralloptionsmanual[5]==1 then
	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])
		if completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false) then
			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl12.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl12.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
		end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl2)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end



elseif ralloptionsmanual[6]==1 then



	for i=1,#rallachieve[locrallcolonka] do
	if GetAchievementLink(rallachieve[locrallcolonka][i]) then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[locrallcolonka][i])

			if #texttableout==0 then
				table.insert(texttableout,rallachiverepl19.." '"..ralltableofinstancebyname[rallmanualch3].."':")
				table.insert(texttableout2,rallachiverepl19.." '"..ralltableofinstancebyname[rallmanualch3].."':")
			end
			table.insert(texttableout,GetAchievementLink(rallachieve[locrallcolonka][i]))
			table.insert(texttableout2,GetAchievementLink(rallachieve[locrallcolonka][i]))

			if (completed and ralloptionTrackCharAchieves==false) or (completed and ralloptionTrackCharAchieves and wasEarnedByMe) then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel1..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cff00ff00("..rallachdonel1..")|r"
			else
			
			--критерия
			if GetAchievementNumCriteria(rallachieve[locrallcolonka][i])>1 then
			local b1,_,_,b4,b5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],1)
			local c1,_,_,c4,c5=GetAchievementCriteriaInfo(rallachieve[locrallcolonka][i],2)
			if b1 and b4 and b5 and c1==nil then
        texttableout[#texttableout]=texttableout[#texttableout].." ("..b4.." / "..b5..")"
        texttableout2[#texttableout2]=texttableout2[#texttableout2].." ("..b4.." / "..b5..")"
      end
      end

					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallachdonel2..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallachdonel2..")|r"
			end

			if rallboss[locrallcolonka][i][1]==0 and ralltip[locrallcolonka]~=ramainbattleground and rallcontent[locrallcolonka]~=6 then
					texttableout[#texttableout]=texttableout[#texttableout].." ("..rallnotfromboss..")"
					texttableout2[#texttableout2]=texttableout2[#texttableout2].." |cffff0000("..rallnotfromboss..")|r"
			end
	end
	end

if #texttableout==0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	psllinfframe2:AddMessage(rallachiverepl5)
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end
end


end


else
	psllinfframe2:Clear()
	psllinfframe2:AddMessage("Error. Achievements were not found in Game Client.")
			if psllinfframe2:GetHeight()>39 and psllinfframe2:GetHeight()<41 then
			else
	psllinfframe2:SetHeight(40)
			end
end


--вывод репорта
if #texttableout>0 then
if psllinfframe2 then
	psllinfframe2:Clear()
	for i=1,#texttableout2 do
		psllinfframe2:AddMessage(texttableout2[i])
	end
	if psllinfframe2:GetHeight()>(#texttableout*12.4+10) and psllinfframe2:GetHeight()<(#texttableout*12.4+30) then
	else
		psllinfframe2:SetHeight(#texttableout*12.4+20) --ыытест
	end
end

--текст
if channel and channel~="sebe" then
rallreportinchat(texttableout,channel,nickforwhisp)
elseif channel=="sebe" then
	for i=1,#texttableout do
			print(texttableout2[i])
	end
end





end


end

end



end


--3 дропдаун меню

function openmenullch1()
if not DropDownMenullch1 then
CreateFrame("Frame", "DropDownMenullch1", zzralistach2, "UIDropDownMenuTemplate")
end
DropDownMenullch1:ClearAllPoints()
DropDownMenullch1:SetPoint("TOPLEFT", 20, -218)
DropDownMenullch1:Show()
local items = rallexpansions
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenullch1, self:GetID())

rallmanualch1=self:GetID()
rallmanualch2=1
openmenullch2()
rallmanualch3=1
openmenullch3()

end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end


UIDropDownMenu_Initialize(DropDownMenullch1, initialize)
UIDropDownMenu_SetWidth(DropDownMenullch1, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenullch1, 125)
UIDropDownMenu_SetSelectedID(DropDownMenullch1,rallmanualch1)
UIDropDownMenu_JustifyText(DropDownMenullch1, "LEFT")
end


function openmenullch2()
if not DropDownMenullch2 then
CreateFrame("Frame", "DropDownMenullch2", zzralistach2, "UIDropDownMenuTemplate")
end
DropDownMenullch2:ClearAllPoints()
DropDownMenullch2:SetPoint("TOPLEFT", 220, -218)
DropDownMenullch2:Show()


ralltableofinstancebyq={}
table.wipe(ralltableofinstancebyq)

  for i=1,#rallcontent do
    if rallcontent[i]==rallmanualch1 then
      local bil=0
      for a,cc in ipairs(ralltableofinstancebyq) do
        if cc==ralltip[i] then
          bil=1
        end
      end
      if bil==0 then
        table.insert(ralltableofinstancebyq,ralltip[i])
      end
    end
  end
table.sort(ralltableofinstancebyq)
if ralltableofinstancebyq[1] and ralltableofinstancebyq[1]=="10" and ralltableofinstancebyq[2] and ralltableofinstancebyq[2]=="25" and ralltableofinstancebyq[3] and ralltableofinstancebyq[3]=="5" then
	table.wipe(ralltableofinstancebyq)
	ralltableofinstancebyq={"5","10","25"}
end

local items = ralltableofinstancebyq
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenullch2, self:GetID())

rallmanualch2=self:GetID()
rallmanualch3=1
openmenullch3()

end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end


UIDropDownMenu_Initialize(DropDownMenullch2, initialize)
UIDropDownMenu_SetWidth(DropDownMenullch2, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenullch2, 125)
UIDropDownMenu_SetSelectedID(DropDownMenullch2,rallmanualch2)
UIDropDownMenu_JustifyText(DropDownMenullch2, "LEFT")
end


function openmenullch3()
if not DropDownMenullch3 then
CreateFrame("Frame", "DropDownMenullch3", zzralistach2, "UIDropDownMenuTemplate")
end
DropDownMenullch3:ClearAllPoints()
DropDownMenullch3:SetPoint("TOPLEFT", 420, -218)
DropDownMenullch3:Show()


ralltableofinstancebyname={}
table.wipe(ralltableofinstancebyname)

for i=1,#rallcontent do
  if rallcontent[i]==rallmanualch1 then
    local bil=0

    for a,cc in ipairs(ralltableofinstancebyname) do
      if cc==ralllocationnames[i] then
        bil=1
      end
    end

    if ralltip[i]~=ralltableofinstancebyq[rallmanualch2] then
      bil=1
    end
    if bil==0 then
      table.insert(ralltableofinstancebyname,ralllocationnames[i])
    end
  end
end
table.sort(ralltableofinstancebyname)


local items = ralltableofinstancebyname
local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenullch3, self:GetID())

rallmanualch3=self:GetID()



icllcheckachievesm2()
end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end
icllcheckachievesm2()

UIDropDownMenu_Initialize(DropDownMenullch3, initialize)
UIDropDownMenu_SetWidth(DropDownMenullch3, 110)
UIDropDownMenu_SetButtonWidth(DropDownMenullch3, 125)
UIDropDownMenu_SetSelectedID(DropDownMenullch3,rallmanualch3)
UIDropDownMenu_JustifyText(DropDownMenullch3, "LEFT")
end


function ralltooltipchangenow()
if UnitAffectingCombat("player")==false then
local GTT = _G["GameTooltip"]
local a = select(2, GTT:GetUnit())
if a and (a=="mouseover" or a=="target") then

if UnitGUID(a) then
	local guui=UnitGUID(a)
	if guui then
		local a1=3 --tonumber(string.sub(guui,5,5))
		if a1==3 or a1==5 then
			local id=arGetUnitID(guui)
			local bil=0
			local _, _, _, _, ai5 = GetInstanceInfo()
			local i=1
			while i<=#ralltooltipready[1] do
				if ralltooltipready[1][i]==id and ralltooltipready[2][i]==ai5 then
					bil=i
					i=1000
				end
				i=i+1
			end

			if bil>0 then
				if #ralltooltipready[3][bil]>6 then
					GTT:AddLine(format(ralltooltiptxt2,#ralltooltipready[3][bil])..".") GTT:AddLine(ralltooltiptxt3) GTT:Show()
				else
					GTT:AddLine(ralltooltiptxt21..":")
					for gg=1,#ralltooltipready[3][bil] do
						local name = GetAchievementInfo(ralltooltipready[3][bil][gg])
						name=GetAchievementLink(ralltooltipready[3][bil][gg])
						GTT:AddLine(name)
					end
					GTT:Show()
				end
			end
		end
	end
end



end
end
end


function openmenullch34(bbb)
if not DropDownMenullch34 then
CreateFrame("Frame", "DropDownMenullch34", zzralistach3, "UIDropDownMenuTemplate")
end
DropDownMenullch34:ClearAllPoints()
DropDownMenullch34:SetPoint("TOPLEFT", 425, -130)
DropDownMenullch34:Show()

local listach={}
ralllistachid={}
table.wipe(ralllistachid)
ralltacticachopen=0
rallinfframe:ClearFocus()


if rallonlycurrzone then
ralltacticachopen=rallonlycurrzone
else
	for x=1,#ralllocationnames do
		if ralllocationnames[x]==ralltableofinstancebyname[rallmanualch3] and ralltip[x]==ralltableofinstancebyq[rallmanualch2] then
			ralltacticachopen=x
		end
	end
end

local istacticexist=0
local ourbosstargets={}
local tbil=0

if UnitGUID("target") then
	local iiid=arGetUnitID(UnitGUID("target"))
	if iiid~=0 then
		table.insert(ourbosstargets,iiid)
	end
end
for d=1,4 do
	if UnitGUID("party"..d.."-target") then
		local iiid=arGetUnitID(UnitGUID("party"..d.."-target"))
		if iiid~=0 then
			table.insert(ourbosstargets,iiid)
		end
	end
end


for bb=1,#rallachieve[ralltacticachopen] do
	if GetAchievementLink(rallachieve[ralltacticachopen][1]) then
	if ralloptionsmanual3[1]==1 then
		local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(rallachieve[ralltacticachopen][bb])
		if (completed==false or (completed and ralloptionTrackCharAchieves and wasEarnedByMe==false)) and rallfullver[ralltacticachopen][bb]==0 then
			local name=GetAchievementLink(rallachieve[ralltacticachopen][bb])
			if ralltactics[ralltacticachopen][bb] and ralltactics[ralltacticachopen][bb]~=0 and ralltacticsdif[ralltacticachopen][bb] and ralltacticsdif[ralltacticachopen][bb]==1 then
				name=name.." - "..ralltactictext2
				if istacticexist==0 then
					istacticexist=#listach+1
				end
			end
			if #ourbosstargets>0 then
				for sx=1,#rallboss[ralltacticachopen][bb] do
					for az=1,#ourbosstargets do
						if ourbosstargets[az]==rallboss[ralltacticachopen][bb][sx] then
							if tbil==0 then
								tbil=#listach+1
							end
						end
					end
				end
			end

			table.insert(listach,name)
			table.insert(ralllistachid,rallachieve[ralltacticachopen][bb])
		end
	elseif ralloptionsmanual3[2]==1 then
		if rallfullver[ralltacticachopen][bb]==0 then
			local name=GetAchievementLink(rallachieve[ralltacticachopen][bb])
			if ralltactics[ralltacticachopen][bb] and ralltactics[ralltacticachopen][bb]~=0 and ralltacticsdif[ralltacticachopen][bb] and ralltacticsdif[ralltacticachopen][bb]==1 then
				name=name.." - "..ralltactictext2
				if istacticexist==0 then
					istacticexist=#listach+1
				end
			end
			if #ourbosstargets>0 then
				for sx=1,#rallboss[ralltacticachopen][bb] do
					for az=1,#ourbosstargets do
						if ourbosstargets[az]==rallboss[ralltacticachopen][bb][sx] then
							if tbil==0 then
								tbil=#listach+1
							end
						end
					end
				end
			end
			table.insert(listach,name)
			table.insert(ralllistachid,rallachieve[ralltacticachopen][bb])
		end
	end
	end
end

		if bbb==nil then
if ralldontupdatemenu then
ralldontupdatemenu=nil
else
rallmanualch34=1
if tbil>0 then
	rallmanualch34=tbil
elseif istacticexist>0 then
	rallmanualch34=istacticexist
end

end
		elseif rallmanualch34 then
			if bbb==1 then
				if #listach>rallmanualch34 then
					rallmanualch34=rallmanualch34+1
				end
			elseif bbb==0 then
				if rallmanualch34>1 then
					rallmanualch34=rallmanualch34-1
				end
			end
		end

ralltacticrealid=1
for nm=1,#rallachieve[ralltacticachopen] do
	if rallachieve[ralltacticachopen][nm]==ralllistachid[rallmanualch34] then
		ralltacticrealid=nm
	end
end

zzralistach3_Button1:Show()
zzralistach3_Button2:Show()

if rallmanualch34>1 then
zzralistach3_ButtonP:Enable()
else
zzralistach3_ButtonP:Disable()
end
if #listach>rallmanualch34 then
zzralistach3_ButtonN:Enable()
else
zzralistach3_ButtonN:Disable()
end

rallinfframe:SetText("")
rallzoneandachname:Clear()
local aname="|cff00ff00"..ralllocationnames[ralltacticachopen].."|r"
if #listach==0 and ralloptionsmanual3[1]==1 then
listach={rallnotfoundachiv1}
rallzoneandachname:AddMessage(aname.." - "..rallnotfoundachiv1)
zzralistach3_Button1:Hide()
zzralistach3_Button2:Hide()
elseif #listach==0 and ralloptionsmanual3[2]==1 then
listach={rallnotfoundachiv2}
rallzoneandachname:AddMessage(aname.." - "..rallnotfoundachiv2)
zzralistach3_Button1:Hide()
zzralistach3_Button2:Hide()
else
rallzoneandachname:AddMessage(aname.." - "..GetAchievementLink(ralllistachid[rallmanualch34]))


--вывод тактики
if ralltactics[ralltacticachopen][ralltacticrealid]==0 then
	rallinfframe:SetText(ralluilooktactic3)
else
	rallinfframe:SetText(ralltactics[ralltacticachopen][ralltacticrealid])
end



end


local items = listach





local function OnClick(self)
rallinfframe:ClearFocus()

UIDropDownMenu_SetSelectedID(DropDownMenullch34, self:GetID())


if rallmanualch34~=self:GetID() then

rallmanualch34=self:GetID()
ralldontupdatemenu=1
openmenullch34()
end


end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end


UIDropDownMenu_Initialize(DropDownMenullch34, initialize)
UIDropDownMenu_SetWidth(DropDownMenullch34, 170)
UIDropDownMenu_SetButtonWidth(DropDownMenullch34, 185)
UIDropDownMenu_SetSelectedID(DropDownMenullch34,rallmanualch34)
UIDropDownMenu_JustifyText(DropDownMenullch34, "LEFT")
end


function rallsavetact()
rallinfframe:ClearFocus()

if string.len(rallinfframe:GetText())>5 then
	if rallinfframe:GetText()==ralluilooktactic3 then
		ralltactics[ralltacticachopen][ralltacticrealid]=0
	else
		ralltactics[ralltacticachopen][ralltacticrealid]=rallinfframe:GetText()
	end
else
ralltactics[ralltacticachopen][ralltacticrealid]=0
rallinfframe:SetText(ralluilooktactic3)
end
out("|cff00ff00"..ralluilooktactic4.."|r")
end


function rallsavetact2()
rallinfframe:ClearFocus()
if ralltacticsdef[ralltacticachopen] and ralltacticsdef[ralltacticachopen][ralltacticrealid] then
ralltactics[ralltacticachopen][ralltacticrealid]=ralltacticsdef[ralltacticachopen][ralltacticrealid]
if ralltactics[ralltacticachopen][ralltacticrealid]==0 then
	rallinfframe:SetText(ralluilooktactic3)
else
	rallinfframe:SetText(ralltactics[ralltacticachopen][ralltacticrealid])
end
else
ralltactics[ralltacticachopen][ralltacticrealid]=0
rallinfframe:SetText(ralluilooktactic3)
end
end



function rallwhispbutfun3()
rallinfframe:ClearFocus()

if rallinfframe:GetText()==ralluilooktactic3 or rallinfframe:GetText()=="" then
else
--тут вывод
local tabletext={"",}





local mtxt=rallinfframe:GetText()


if string.find(mtxt, "\n") or string.find(mtxt, " ") then
while (string.find(mtxt, "\n") or string.find(mtxt, " ")) do
	local first=0
	local first2=2
	if string.find(mtxt, "\n") then
		first=string.find(mtxt, "\n")
	end
	if first==0 or (string.find(mtxt, " ") and string.find(mtxt, " ")<first) then
		first=string.find(mtxt, " ")
		first2=1
	end

	if first2==2 then
		if string.len(tabletext[#tabletext])>220 then
			table.insert(tabletext,string.sub(mtxt,0,first-1))
		else
			tabletext[#tabletext]=tabletext[#tabletext]..string.sub(mtxt,0,first-1)
		end
		table.insert(tabletext,"")
	end

	if first2==1 then
		if string.len(tabletext[#tabletext])>220 then
			table.insert(tabletext,string.sub(mtxt,0,first-1).." ")
		else
			tabletext[#tabletext]=tabletext[#tabletext]..string.sub(mtxt,0,first-1).." "
		end
	end

	mtxt=string.sub(mtxt,first+1)
end

if string.len(mtxt)>0 then
	if string.len(tabletext[#tabletext])>220 then
		table.insert(tabletext,mtxt)
	else
		tabletext[#tabletext]=tabletext[#tabletext]..mtxt
	end
end

else
	if string.len(tabletext[#tabletext])>220 then
		table.insert(tabletext,mtxt)
	else
		tabletext[#tabletext]=tabletext[#tabletext]..mtxt
	end
end

if #tabletext>1 or string.len(tabletext[1])>2 then
local a1=GetAchievementLink(ralllistachid[rallmanualch34])
table.insert(tabletext,1,ralluilooktactic5..": "..ralllocationnames[ralltacticachopen].." - "..a1)
end

if string.len(rapsebf3:GetText())>0 then
rallreportinchat(tabletext,"whisper",rapsebf3:GetText())
else
rallreportinchat(tabletext,wherereportll33)
end



end

end


function ralltest()
--ыытест на норм базу данных
print ("запущен тест")
local b=#ralllocations
if b==#ralltip and b==#rallachieve and b==#rallboss and b==#ralltrack and b==#rallmeta and b==#rallfullver then
for i=1,#rallachieve do
	local a=#rallachieve[i]
	if a==#rallboss[i] and a==#ralltrack[i] and a==#rallmeta[i] and a==#rallfullver[i] then
	else
		print (i.. " что-то не так")
	end
end
else
print ("табл кривые")
print (b)
print (#ralltip)
print (#rallachieve)
print (#rallboss)
print (#ralltrack)
print (#rallmeta)
print (#rallfullver)
end
end

function ralltest2()
--GetAchievementLink
for i=1,#rallachieve do
	for j=1,#rallachieve[i] do
		if GetAchievementLink(rallachieve[i][j]) then
		else
			print (ralllocationnames[i])
			print (rallachieve[i][j])
			print (j)
		end
	end
end


end



function arbigmenuchatea(bigma)
if bigma<9 then
	wherereporttempbigma=rabigmenuchatlisten[bigma]
	else wherereporttempbigma=psfchatadd[bigma-8]
end
end

function arbigmenuchatea2(bigma2)
bigma2num=0
if (bigma2=="raid") then bigma2num=1
elseif (bigma2=="raid_warning") then bigma2num=2
elseif (bigma2=="officer") then bigma2num=3
elseif (bigma2=="party") then bigma2num=4
elseif (bigma2=="guild") then bigma2num=5
elseif (bigma2=="say") then bigma2num=6
elseif (bigma2=="yell") then bigma2num=7
elseif (bigma2=="sebe") then bigma2num=8
else
	if psfchatadd==nil or #psfchatadd==0 then
	bigma2num=0
	else
		for i=1,#psfchatadd do
			if string.lower(psfchatadd[i])==string.lower(bigma2) then
			bigma2num=i+8
			end
		end

	end
end

end


function arGetUnitID(guid)
if guid==nil or guid==false then
	return -1
end

if (guid.find(guid,"Creature") or guid.find(guid,"Pet-") or guid.find(guid,"GameObject") or guid.find(guid,"Vehicle")) then
	--Creature-0-3061-1136-29274-71979-00003EDC2C
	local t1,_,_,_,_,id,g = guid:match("([^,]+)-([^,]+)-([^,]+)-([^,]+)-([^,]+)-([^,]+)-([^,]+)")
	if id and tonumber(id) ~= nil then
		return tonumber(id)
	else
		return -1
	end
else
	return -1
end
end