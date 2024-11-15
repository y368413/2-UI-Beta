local SCOCL = {};
SoulbindCacheOpener = {};

SoulbindCacheOpener.buttons = {};

SoulbindCacheOpener.items = {

    -- update of an assortment of missing items
    {--[[ ["name"] = "glimmer-of-alchemy-knowledge",]] ["id"] = 228725,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-tailoring-knowledge",]] ["id"] = 228739,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-engineering-knowledge",]] ["id"] = 228731,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-leatherworking-knowledge",]] ["id"] = 228737,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-inscription-knowledge",]] ["id"] = 228733,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-enchanting-knowledge",]] ["id"] = 228729,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-jewelcrafting-knowledge",]] ["id"] = 228735,["minCount"] = 1},  
    {--[[ ["name"] = "glimmer-of-blacksmith-knowledge",]] ["id"] = 228727,["minCount"] = 1},  
    {--[[ ["name"] = "rattling-bag-o-gold",]] ["id"] = 225249,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-general-goods",]] ["id"] = 224100,["minCount"] = 1},
    {--[[ ["name"] = "wax-sealed-weathered-crests",]] ["id"] = 226148,["minCount"] = 1},
    {--[[ ["name"] = "bunch-of-brave-rocks",]] ["id"] = 226147,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-surplus-cloth",]] ["id"] = 227682,["minCount"] = 1},
    {--[[ ["name"] = "handful-of-humming-shinies",]] ["id"] = 226146,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-surplus-leather",]] ["id"] = 227681,["minCount"] = 1},
    {--[[ ["name"] = "awakened-mechanical-cache",]] ["id"] = 226273,["minCount"] = 1},
    {--[[ ["name"] = "wax-sealed-crests",]] ["id"] = 226152,["minCount"] = 1},
    {--[[ ["name"] = "wax-coated-coffer-unlocker",]] ["id"] = 226151,["minCount"] = 1},
    {--[[ ["name"] = "gem-studded-candelabra",]] ["id"] = 226150,["minCount"] = 1},
    {--[[ ["name"] = "pile-of-humming-shinies",]] ["id"] = 226149,["minCount"] = 1},
    {--[[ ["name"] = "algari-adventurers-cache",]] ["id"] = 229354,["minCount"] = 1},
    {--[[ ["name"] = "wax-sealed-crafty-crest",]] ["id"] = 226154,["minCount"] = 1},
    {--[[ ["name"] = "big-pile-of-humming-shinies",]] ["id"] = 226153,["minCount"] = 1},
    {--[[ ["name"] = "bizarrely-shaped-stomach",]] ["id"] = 218738,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-surplus-dust",]] ["id"] = 228337,["minCount"] = 1},
    {--[[ ["name"] = "seasoned-adventurers-cache",]] ["id"] = 228361,["minCount"] = 1},
    {--[[ ["name"] = "algari-amber-prism",]] ["id"] = 213780,["minCount"] = 1},
    {--[[ ["name"] = "algari-amber-prism",]] ["id"] = 213779,["minCount"] = 1},
    {--[[ ["name"] = "algari-emerald-prism",]] ["id"] = 213784,["minCount"] = 1},
    {--[[ ["name"] = "algari-emerald-prism",]] ["id"] = 213783,["minCount"] = 1},
    {--[[ ["name"] = "algari-emerald-prism",]] ["id"] = 213782,["minCount"] = 1},
    {--[[ ["name"] = "algari-amber-prism",]] ["id"] = 213781,["minCount"] = 1},
    {--[[ ["name"] = "algari-onyx-prism",]] ["id"] = 213788,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-ore",]] ["id"] = 224028,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-general-goods",]] ["id"] = 224156,["minCount"] = 1},
    {--[[ ["name"] = "algari-ruby-prism",]] ["id"] = 213787,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-herbs",]] ["id"] = 224027,["minCount"] = 1},
    {--[[ ["name"] = "algari-ruby-prism",]] ["id"] = 213786,["minCount"] = 1},
    {--[[ ["name"] = "algari-ruby-prism",]] ["id"] = 213785,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-enchanting-goods",]] ["id"] = 224032,["minCount"] = 1},
    {--[[ ["name"] = "algari-sapphire-prism",]] ["id"] = 213792,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-blacksmithing-goods",]] ["id"] = 224031,["minCount"] = 1},
    {--[[ ["name"] = "algari-sapphire-prism",]] ["id"] = 213791,["minCount"] = 1},
    {--[[ ["name"] = "algari-onyx-prism",]] ["id"] = 213790,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-alchemy-goods",]] ["id"] = 224030,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-skins",]] ["id"] = 224029,["minCount"] = 1},
    {--[[ ["name"] = "algari-onyx-prism",]] ["id"] = 213789,["minCount"] = 1},
    {--[[ ["name"] = "the-generals-war-chest",]] ["id"] = 225572,["minCount"] = 1},
    {--[[ ["name"] = "the-weavers-gratuity",]] ["id"] = 225571,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-jewelcrafting-goods",]] ["id"] = 224035,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-inscription-goods",]] ["id"] = 224034,["minCount"] = 1},
    {--[[ ["name"] = "algari-sapphire-prism",]] ["id"] = 213793,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-engineering-goods",]] ["id"] = 224033,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-optional-goods",]] ["id"] = 224040,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-tailoring-goods",]] ["id"] = 224039,["minCount"] = 1},
    {--[[ ["name"] = "the-viziers-capital",]] ["id"] = 225573,["minCount"] = 1},
    {--[[ ["name"] = "bottomless-bag-of-khaz-algar-leatherworking-goods",]] ["id"] = 224037,["minCount"] = 1},
    {--[[ ["name"] = "glorious-contenders-strongbox",]] ["id"] = 224556,["minCount"] = 1},
    {--[[ ["name"] = "field-medics-hazard-payout",]] ["id"] = 224557,["minCount"] = 1},
    {--[[ ["name"] = "algari-distinguishment",]] ["id"] = 225739,["minCount"] = 1},
    {--[[ ["name"] = "everyday-cache",]] ["id"] = 227792,["minCount"] = 1},
    {--[[ ["name"] = "radiant-cache",]] ["id"] = 226264,["minCount"] = 1},
    {--[[ ["name"] = "theater-troupes-trove",]] ["id"] = 226263,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-surplus-ore",]] ["id"] = 227676,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-surplus-herbs",]] ["id"] = 227675,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-jewelcrafting-surplus",]] ["id"] = 227680,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-inscription-surplus",]] ["id"] = 227679,["minCount"] = 1},
    {--[[ ["name"] = "pile-of-unidentified-meat",]] ["id"] = 228959,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-engineering-surplus",]] ["id"] = 227678,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-enchanting-surplus",]] ["id"] = 227677,["minCount"] = 1},
    {--[[ ["name"] = "pinnacle-cache",]] ["id"] = 224784,["minCount"] = 1},
    {--[[ ["name"] = "void-touched-valorstone",]] ["id"] = 225896,["minCount"] = 1},
    {--[[ ["name"] = "bismuth-lockbox",]] ["id"] = 220376,["minCount"] = 1},
    {--[[ ["name"] = "winter-veil-gift",]] ["id"] = 218311,["minCount"] = 1},
    {--[[ ["name"] = "gently-shaken-gift",]] ["id"] = 218309,["minCount"] = 1},
    {--[[ ["name"] = "crimson-valorstone",]] ["id"] = 221269,["minCount"] = 1},
    {--[[ ["name"] = "golden-valorstone",]] ["id"] = 226813,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nerubian-treasures",]] ["id"] = 226194,["minCount"] = 1},
    {--[[ ["name"] = "scorched-junk",]] ["id"] = 222977,["minCount"] = 1},
    {--[[ ["name"] = "radiant-fuel-cache",]] ["id"] = 224913,["minCount"] = 1},
    {--[[ ["name"] = "wax-sealed-pouch",]] ["id"] = 224650,["minCount"] = 1},
    {--[[ ["name"] = "very-large-valdrakken-accord-supply-pack",]] ["id"] = 215359,["minCount"] = 1},
    {--[[ ["name"] = "explorer's-warbound-battlegear-drop",]] ["id"] = 221503,["minCount"] = 1},
    {--[[ ["name"] = "chest-of-gold",]] ["id"] = 226814,["minCount"] = 1},
    {--[[ ["name"] = "radiant-fuel-cache",]] ["id"] = 224941,["minCount"] = 1},
    {--[[ ["name"] = "nal'ryssa's-spare-mining-supplies",]] ["id"] = 126947,["minCount"] = 1},
    {--[[ ["name"] = "tranquil-satchel-of-helpful-goods",]] ["id"] = 114662,["minCount"] = 1},
    {--[[ ["name"] = "alchemy-experiment",]] ["id"] = 118759,["minCount"] = 1},
    {--[[ ["name"] = "plain-hat-box",]] ["id"] = 153574,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 111598,["minCount"] = 1},
    {--[[ ["name"] = "tranquil-satchel-of-helpful-goods",]] ["id"] = 114669,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 111600,["minCount"] = 1},
    {--[[ ["name"] = "pack-of-fishing-supplies",]] ["id"] = 112623,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 172014,["minCount"] = 1},
    {--[[ ["name"] = "silver-strongbox",]] ["id"] = 111599,["minCount"] = 1},
    {--[[ ["name"] = "9.2-pet-battle-playtest-bag-of-goodies",]] ["id"] = 189428,["minCount"] = 1},
    {--[[ ["name"] = "decoded-true-believer-clippings",]] ["id"] = 20469,["minCount"] = 1},
    {--[[ ["name"] = "book-of-tickets",]] ["id"] = 175095,["minCount"] = 1},
    {--[[ ["name"] = "very-fat-sack-of-coins",]] ["id"] = 68598,["minCount"] = 1},
    {--[[ ["name"] = "brawler's-footlocker",]] ["id"] = 147446,["minCount"] = 1},
    {--[[ ["name"] = "unclaimed-black-market-container",]] ["id"] = 127995,["minCount"] = 1},
    {--[[ ["name"] = "unclaimed-black-market-container",]] ["id"] = 110592,["minCount"] = 1},
    {--[[ ["name"] = "forgotten-jewelry-box",]] ["id"] = 198657,["minCount"] = 1},
    {--[[ ["name"] = "ahn'qiraj-war-effort-supplies",]] ["id"] = 21510,["minCount"] = 1},
    {--[[ ["name"] = "ahn'qiraj-war-effort-supplies",]] ["id"] = 21511,["minCount"] = 1},
    {--[[ ["name"] = "ahn'qiraj-war-effort-supplies",]] ["id"] = 21512,["minCount"] = 1},
    {--[[ ["name"] = "glittering-pack",]] ["id"] = 142342,["minCount"] = 1},
    {--[[ ["name"] = "kronk's-grab-bag",]] ["id"] = 32777,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 156683,["minCount"] = 1},
    {--[[ ["name"] = "ahn'qiraj-war-effort-supplies",]] ["id"] = 21513,["minCount"] = 1},
    {--[[ ["name"] = "9.2-mount-crafting-bag-of-goodies",]] ["id"] = 189452,["minCount"] = 1},
    {--[[ ["name"] = "sunreaver-bounty",]] ["id"] = 94220,["minCount"] = 1},
    {--[[ ["name"] = "arcane-trove",]] ["id"] = 94219,["minCount"] = 1},
    {--[[ ["name"] = "otherworldly-satchel-of-helpful-goods",]] ["id"] = 156682,["minCount"] = 1},
    {--[[ ["name"] = "tome-of-the-tiger",]] ["id"] = 93198,["minCount"] = 1},
    {--[[ ["name"] = "sealed-crate",]] ["id"] = 67597,["minCount"] = 1},
    {--[[ ["name"] = "icy-satchel-of-helpful-goods",]] ["id"] = 156688,["minCount"] = 1},
    {--[[ ["name"] = "tome-of-the-serpent",]] ["id"] = 93200,["minCount"] = 1},
    {--[[ ["name"] = "tome-of-the-crane",]] ["id"] = 93199,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 139284,["minCount"] = 1},
    {--[[ ["name"] = "scorched-satchel-of-helpful-goods",]] ["id"] = 156689,["minCount"] = 1},
    {--[[ ["name"] = "colossal-bag-of-loot",]] ["id"] = 21528,["minCount"] = 1},
    {--[[ ["name"] = "rattling-iron-cage",]] ["id"] = 128025,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 116764,["minCount"] = 1},
    {--[[ ["name"] = "tranquil-satchel-of-helpful-goods",]] ["id"] = 156698,["minCount"] = 1},
    {--[[ ["name"] = "black-sack-of-gems",]] ["id"] = 34846,["minCount"] = 1},
    {--[[ ["name"] = "alchemist's-cache",]] ["id"] = 46110,["minCount"] = 1},
    {--[[ ["name"] = "bret's-satchel-of-helpful-goods",]] ["id"] = 156707,["minCount"] = 1},
    {--[[ ["name"] = "kirin-tor-chest",]] ["id"] = 141350,["minCount"] = 1},
    {--[[ ["name"] = "sealed-craftsman's-writ",]] ["id"] = 22568,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-betrayer",]] ["id"] = 90156,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-golden-king",]] ["id"] = 90155,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-elemental-triad",]] ["id"] = 90158,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-windfury",]] ["id"] = 90157,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-fishing-treasures",]] ["id"] = 34863,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-light",]] ["id"] = 90160,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-silent-assassin",]] ["id"] = 90159,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-regal-lord",]] ["id"] = 90162,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78898,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-holy-warrior",]] ["id"] = 90161,["minCount"] = 1},
    {--[[ ["name"] = "earthen-ring-supplies",]] ["id"] = 52274,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78897,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-cycle",]] ["id"] = 90164,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78900,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-howling-beast",]] ["id"] = 90163,["minCount"] = 1},
    {--[[ ["name"] = "barrel-of-fish",]] ["id"] = 33844,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78899,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78902,["minCount"] = 1},
    {--[[ ["name"] = "golden-chest-of-the-lich-lord",]] ["id"] = 90165,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78901,["minCount"] = 1},
    {--[[ ["name"] = "crafty's-sack",]] ["id"] = 34871,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78904,["minCount"] = 1},
    {--[[ ["name"] = "outcast's-cache",]] ["id"] = 31800,["minCount"] = 1},
    {--[[ ["name"] = "pouch-o'-tokens",]] ["id"] = 78903,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78906,["minCount"] = 1},
    {--[[ ["name"] = "recipe-list:-hardened-leystone",]] ["id"] = 123962,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78905,["minCount"] = 1},
    {--[[ ["name"] = "recipe-list:-leysmithing",]] ["id"] = 123961,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78908,["minCount"] = 1},
    {--[[ ["name"] = "pirate's-footlocker",]] ["id"] = 9276,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78907,["minCount"] = 1},
    {--[[ ["name"] = "recipe-list:-masterwork-demonsteel",]] ["id"] = 123963,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-fel-treasures",]] ["id"] = 147519,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-fel-treasures",]] ["id"] = 147520,["minCount"] = 1},
    {--[[ ["name"] = "sack-o'-tokens",]] ["id"] = 78909,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-fel-treasures",]] ["id"] = 147518,["minCount"] = 1},
    {--[[ ["name"] = "water-filled-gills",]] ["id"] = 70719,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-meat",]] ["id"] = 33857,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-fel-treasures",]] ["id"] = 147521,["minCount"] = 1},
    {--[[ ["name"] = "ogri'la-care-package",]] ["id"] = 32835,["minCount"] = 1},
    {--[[ ["name"] = "greater-bounty-spoils",]] ["id"] = 123975,["minCount"] = 1},
    {--[[ ["name"] = "rustbolt-supplies",]] ["id"] = 170061,["minCount"] = 1},
    {--[[ ["name"] = "sealed-crate",]] ["id"] = 78930,["minCount"] = 1},
    {--[[ ["name"] = "darkmoon-ticket-fanny-pack",]] ["id"] = 110678,["minCount"] = 1},
    {--[[ ["name"] = "vine-cracked-junkbox",]] ["id"] = 88165,["minCount"] = 1},
    {--[[ ["name"] = "bundle-of-archived-research",]] ["id"] = 187503,["minCount"] = 1},
    {--[[ ["name"] = "treasures-of-the-thunder-king",]] ["id"] = 95343,["minCount"] = 1},
    {--[[ ["name"] = "bulging-bag-of-charms",]] ["id"] = 103535,["minCount"] = 1},
    {--[[ ["name"] = "unsealed-chest",]] ["id"] = 51316,["minCount"] = 1},
    {--[[ ["name"] = "keystone-container",]] ["id"] = 139383,["minCount"] = 1},
    {--[[ ["name"] = "keystone-container",]] ["id"] = 139381,["minCount"] = 1},
    {--[[ ["name"] = "keystone-container",]] ["id"] = 139382,["minCount"] = 1},
    {--[[ ["name"] = "hive'ashi-dossier",]] ["id"] = 22648,["minCount"] = 1},
    {--[[ ["name"] = "earthen-ring-supplies",]] ["id"] = 52344,["minCount"] = 1},
    {--[[ ["name"] = "hive'regal-dossier",]] ["id"] = 22649,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-spoils",]] ["id"] = 20601,["minCount"] = 1},
    {--[[ ["name"] = "supplies-for-the-path",]] ["id"] = 184444,["minCount"] = 1},
    {--[[ ["name"] = "chest-of-spoils",]] ["id"] = 20602,["minCount"] = 1},
    {--[[ ["name"] = "hive'zora-dossier",]] ["id"] = 22650,["minCount"] = 1},
    {--[[ ["name"] = "elementium-lockbox",]] ["id"] = 68729,["minCount"] = 1},
    {--[[ ["name"] = "rustbolt-requisitions",]] ["id"] = 168057,["minCount"] = 1},
    {--[[ ["name"] = "sky-racer's-purse",]] ["id"] = 227450,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-spoils",]] ["id"] = 20603,["minCount"] = 1},
    {--[[ ["name"] = "ornate-pyx",]] ["id"] = 180355,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-arms",]] ["id"] = 118924,["minCount"] = 1},
    {--[[ ["name"] = "huge-pile-of-skins",]] ["id"] = 118926,["minCount"] = 1},
    {--[[ ["name"] = "ashen-sack-of-gems",]] ["id"] = 49294,["minCount"] = 1},
    {--[[ ["name"] = "plundered-booty",]] ["id"] = 118925,["minCount"] = 1},
    {--[[ ["name"] = "faintly-sparkling-cache",]] ["id"] = 118928,["minCount"] = 1},
    {--[[ ["name"] = "maximillian's-laundry",]] ["id"] = 118927,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-everbloom-herbs",]] ["id"] = 118930,["minCount"] = 1},
    {--[[ ["name"] = "canopic-jar",]] ["id"] = 64657,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-mined-ore",]] ["id"] = 118929,["minCount"] = 1},
    {--[[ ["name"] = "sparklematic-wrapped-box",]] ["id"] = 9363,["minCount"] = 1},
    {--[[ ["name"] = "leonid's-bag-of-supplies",]] ["id"] = 118931,["minCount"] = 1},
    {--[[ ["name"] = "time-twisted-anomaly",]] ["id"] = 124054,["minCount"] = 1},
    {--[[ ["name"] = "exquisitely-woven-rug",]] ["id"] = 180379,["minCount"] = 1},
    {--[[ ["name"] = "lace-draperies",]] ["id"] = 180380,["minCount"] = 1},
    {--[[ ["name"] = "forgemaster's-crate",]] ["id"] = 180378,["minCount"] = 1},
    {--[[ ["name"] = "goblin-engineer's-renewal-gift",]] ["id"] = 11422,["minCount"] = 1},
    {--[[ ["name"] = "gnome-engineer's-renewal-gift",]] ["id"] = 11423,["minCount"] = 1},
    {--[[ ["name"] = "bulging-package",]] ["id"] = 156836,["minCount"] = 1},
    {--[[ ["name"] = "message-in-a-bottle",]] ["id"] = 6307,["minCount"] = 1},
    {--[[ ["name"] = "herbalist's-pouch",]] ["id"] = 180386,["minCount"] = 1},
    {--[[ ["name"] = "bloated-thresher",]] ["id"] = 127141,["minCount"] = 1},
    {--[[ ["name"] = "silas'-secret-stash",]] ["id"] = 127148,["minCount"] = 1},
    {--[[ ["name"] = "ancient-war-remnants",]] ["id"] = 136362,["minCount"] = 1},
    {--[[ ["name"] = "bloated-trout",]] ["id"] = 8366,["minCount"] = 1},
    {--[[ ["name"] = "serpent's-cache",]] ["id"] = 93360,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-arms",]] ["id"] = 87218,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-mysteries",]] ["id"] = 87220,["minCount"] = 1},
    {--[[ ["name"] = "huge-bag-of-herbs",]] ["id"] = 87219,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-linens",]] ["id"] = 87222,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-jewels",]] ["id"] = 87221,["minCount"] = 1},
    {--[[ ["name"] = "true-steel-lockbox",]] ["id"] = 116920,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-wonders",]] ["id"] = 87224,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-skins",]] ["id"] = 87223,["minCount"] = 1},
    {--[[ ["name"] = "giant-sack",]] ["id"] = 69818,["minCount"] = 1},
    {--[[ ["name"] = "hive-queen's-honeycomb",]] ["id"] = 69817,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-food",]] ["id"] = 87225,["minCount"] = 1},
    {--[[ ["name"] = "stendel's-bane",]] ["id"] = 68795,["minCount"] = 1},
    {--[[ ["name"] = "master-chef's-groceries",]] ["id"] = 69822,["minCount"] = 1},
    {--[[ ["name"] = "ravencrest-cache",]] ["id"] = 136383,["minCount"] = 1},
    {--[[ ["name"] = "gub's-catch",]] ["id"] = 69823,["minCount"] = 1},
    {--[[ ["name"] = "professional-equipment",]] ["id"] = 194750,["minCount"] = 1},
    {--[[ ["name"] = "stolen-weapons",]] ["id"] = 108740,["minCount"] = 1},
    {--[[ ["name"] = "coldridge-mountaineer's-pouch",]] ["id"] = 57540,["minCount"] = 1},
    {--[[ ["name"] = "treasures-of-the-vale",]] ["id"] = 103624,["minCount"] = 1},
    {--[[ ["name"] = "barnacled-bag-of-goods",]] ["id"] = 170188,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-meat-delivery",]] ["id"] = 187596,["minCount"] = 1},
    {--[[ ["name"] = "intact-naga-skeleton",]] ["id"] = 170185,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-herb-delivery",]] ["id"] = 187599,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-freshly-picked-herbs",]] ["id"] = 68813,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-ore-delivery",]] ["id"] = 187600,["minCount"] = 1},
    {--[[ ["name"] = "dented-crate",]] ["id"] = 6351,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-fish-delivery",]] ["id"] = 187597,["minCount"] = 1},
    {--[[ ["name"] = "lucky-box-of-greatness",]] ["id"] = 103632,["minCount"] = 1},
    {--[[ ["name"] = "mardivas'-bag-of-containing",]] ["id"] = 170190,["minCount"] = 1},
    {--[[ ["name"] = "waterlogged-crate",]] ["id"] = 6352,["minCount"] = 1},
    {--[[ ["name"] = "khorium-lockbox",]] ["id"] = 31952,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-cloth-delivery",]] ["id"] = 187598,["minCount"] = 1},
    {--[[ ["name"] = "voidcaster's-supply-bag",]] ["id"] = 170195,["minCount"] = 1},
    {--[[ ["name"] = "small-chest",]] ["id"] = 6353,["minCount"] = 1},
    {--[[ ["name"] = "small-locked-chest",]] ["id"] = 6354,["minCount"] = 1},
    {--[[ ["name"] = "large-iskaaran-supply-pack",]] ["id"] = 198867,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-enchantment-delivery",]] ["id"] = 187604,["minCount"] = 1},
    {--[[ ["name"] = "sturdy-locked-chest",]] ["id"] = 6355,["minCount"] = 1},
    {--[[ ["name"] = "battered-chest",]] ["id"] = 6356,["minCount"] = 1},
    {--[[ ["name"] = "large-dragon-expedition-supply-pack",]] ["id"] = 198865,["minCount"] = 1},
    {--[[ ["name"] = "sealed-crate",]] ["id"] = 6357,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 128214,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 128213,["minCount"] = 1},
    {--[[ ["name"] = "highmaul-lockbox",]] ["id"] = 119000,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 128216,["minCount"] = 1},
    {--[[ ["name"] = "broken-isles-gem-delivery",]] ["id"] = 187605,["minCount"] = 1},
    {--[[ ["name"] = "a-sack-of-coins",]] ["id"] = 5335,["minCount"] = 1},
    {--[[ ["name"] = "a-bulging-coin-purse",]] ["id"] = 10456,["minCount"] = 1},
    {--[[ ["name"] = "large-valdrakken-accord-supply-pack",]] ["id"] = 198869,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 128215,["minCount"] = 1},
    {--[[ ["name"] = "red-blizzcon-bag",]] ["id"] = 49369,["minCount"] = 1},
    {--[[ ["name"] = "buccaneer's-uniform",]] ["id"] = 22746,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightmarish-treasures",]] ["id"] = 139484,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-sin-stones",]] ["id"] = 180442,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightmarish-treasures",]] ["id"] = 139487,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightmarish-treasures",]] ["id"] = 139488,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightmarish-treasures",]] ["id"] = 139486,["minCount"] = 1},
    {--[[ ["name"] = "encaged-airy-soul",]] ["id"] = 200932,["minCount"] = 1},
    {--[[ ["name"] = "encaged-fiery-soul",]] ["id"] = 200931,["minCount"] = 1},
    {--[[ ["name"] = "tightly-sealed-trunk",]] ["id"] = 20708,["minCount"] = 1},
    {--[[ ["name"] = "encaged-earthen-soul",]] ["id"] = 200936,["minCount"] = 1},
    {--[[ ["name"] = "encaged-frosty-soul",]] ["id"] = 200934,["minCount"] = 1},
    {--[[ ["name"] = "basic-seed-pack",]] ["id"] = 85224,["minCount"] = 1},
    {--[[ ["name"] = "enigma-seed-pack",]] ["id"] = 85223,["minCount"] = 1},
    {--[[ ["name"] = "basic-seed-pack",]] ["id"] = 85226,["minCount"] = 1},
    {--[[ ["name"] = "basic-seed-pack",]] ["id"] = 85225,["minCount"] = 1},
    {--[[ ["name"] = "special-seed-pack",]] ["id"] = 85227,["minCount"] = 1},
    {--[[ ["name"] = "serpent's-heart",]] ["id"] = 95469,["minCount"] = 1},
    {--[[ ["name"] = "coalesced-turmoil",]] ["id"] = 105714,["minCount"] = 1},
    {--[[ ["name"] = "twisted-treasures-of-the-vale",]] ["id"] = 105713,["minCount"] = 1},
    {--[[ ["name"] = "invader's-forgotten-treasure",]] ["id"] = 116980,["minCount"] = 1},
    {--[[ ["name"] = "soldier's-footlocker",]] ["id"] = 143607,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-battlefield-spoils",]] ["id"] = 143606,["minCount"] = 1},
    {--[[ ["name"] = "box-of-storied-treasures",]] ["id"] = 119036,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-coins",]] ["id"] = 69886,["minCount"] = 1},
    {--[[ ["name"] = "supply-of-storied-rarities",]] ["id"] = 119037,["minCount"] = 1},
    {--[[ ["name"] = "arcane-trove",]] ["id"] = 98560,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-mingled-treasures",]] ["id"] = 119040,["minCount"] = 1},
    {--[[ ["name"] = "sunreaver-bounty",]] ["id"] = 98562,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-valuable-treasures",]] ["id"] = 119042,["minCount"] = 1},
    {--[[ ["name"] = "artisan's-consortium-payout",]] ["id"] = 228612,["minCount"] = 1},
    {--[[ ["name"] = "strongbox-of-mysterious-treasures",]] ["id"] = 119041,["minCount"] = 1},
    {--[[ ["name"] = "artisan's-consortium-payout",]] ["id"] = 228611,["minCount"] = 1},
    {--[[ ["name"] = "artisan's-consortium-payout",]] ["id"] = 228610,["minCount"] = 1},
    {--[[ ["name"] = "trove-of-smoldering-treasures",]] ["id"] = 119043,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-chilled-goods",]] ["id"] = 54536,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-potions",]] ["id"] = 184589,["minCount"] = 1},
    {--[[ ["name"] = "tree-seed-pack",]] ["id"] = 85272,["minCount"] = 1},
    {--[[ ["name"] = "kor'kron-shaman's-treasure",]] ["id"] = 105751,["minCount"] = 1},
    {--[[ ["name"] = "secret-stash",]] ["id"] = 85271,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 114970,["minCount"] = 1},
    {--[[ ["name"] = "gro-pack",]] ["id"] = 85274,["minCount"] = 1},
    {--[[ ["name"] = "celebration-gift",]] ["id"] = 85276,["minCount"] = 1},
    {--[[ ["name"] = "chee-chee's-goodie-bag",]] ["id"] = 85275,["minCount"] = 1},
    {--[[ ["name"] = "slimy-bag",]] ["id"] = 20766,["minCount"] = 1},
    {--[[ ["name"] = "unclaimed-black-market-container",]] ["id"] = 97565,["minCount"] = 1},
    {--[[ ["name"] = "nicely-packed-lunch",]] ["id"] = 85277,["minCount"] = 1},
    {--[[ ["name"] = "scum-covered-bag",]] ["id"] = 20767,["minCount"] = 1},
    {--[[ ["name"] = "oozing-bag",]] ["id"] = 20768,["minCount"] = 1},
    {--[[ ["name"] = "gadgetzan-water-co.-care-package",]] ["id"] = 8484,["minCount"] = 1},
    {--[[ ["name"] = "nolkai's-box",]] ["id"] = 23846,["minCount"] = 1},
    {--[[ ["name"] = "salvaged-cache-of-goods",]] ["id"] = 171305,["minCount"] = 1},
    {--[[ ["name"] = "shattered-satchel-of-cooperation",]] ["id"] = 140591,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 118066,["minCount"] = 1},
    {--[[ ["name"] = "gleaming-ashmaul-strongbox",]] ["id"] = 118065,["minCount"] = 1},
    {--[[ ["name"] = "routed-invader's-crate-of-spoils",]] ["id"] = 122163,["minCount"] = 1},
    {--[[ ["name"] = "war-torn-satchel-of-cooperation",]] ["id"] = 160054,["minCount"] = 1},
    {--[[ ["name"] = "sixtrigger-resource-crate",]] ["id"] = 140601,["minCount"] = 1},
    {--[[ ["name"] = "vinecovered-infused-rubies",]] ["id"] = 182591,["minCount"] = 1},
    {--[[ ["name"] = "adventurer's-warbound-battlegear-drop",]] ["id"] = 221502,["minCount"] = 1},
    {--[[ ["name"] = "vinewormed-coin-pouch",]] ["id"] = 182590,["minCount"] = 1},
    {--[[ ["name"] = "void-shrouded-satchel",]] ["id"] = 128319,["minCount"] = 1},
    {--[[ ["name"] = "protectorate-treasure-cache",]] ["id"] = 32064,["minCount"] = 1},
    {--[[ ["name"] = "crystal-satchel-of-cooperation",]] ["id"] = 224573,["minCount"] = 1},
    {--[[ ["name"] = "carefully-wrapped-hat-box",]] ["id"] = 163139,["minCount"] = 1},
    {--[[ ["name"] = "box-of-rations",]] ["id"] = 9539,["minCount"] = 1},
    {--[[ ["name"] = "box-of-spells",]] ["id"] = 9540,["minCount"] = 1},
    {--[[ ["name"] = "followup-logistics-assignment",]] ["id"] = 20805,["minCount"] = 1},
    {--[[ ["name"] = "box-of-goodies",]] ["id"] = 9541,["minCount"] = 1},
    {--[[ ["name"] = "striped-hat-box",]] ["id"] = 163144,["minCount"] = 1},
    {--[[ ["name"] = "black-conrad's-treasure",]] ["id"] = 34119,["minCount"] = 1},
    {--[[ ["name"] = "spooky-hat-box",]] ["id"] = 163141,["minCount"] = 1},
    {--[[ ["name"] = "combat-assignment",]] ["id"] = 20808,["minCount"] = 1},
    {--[[ ["name"] = "ironbound-hat-box",]] ["id"] = 163142,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 128327,["minCount"] = 1},
    {--[[ ["name"] = "tactical-assignment",]] ["id"] = 20809,["minCount"] = 1},
    {--[[ ["name"] = "hoard-of-the-black-dragonflight",]] ["id"] = 10569,["minCount"] = 1},
    {--[[ ["name"] = "box-o'-booms",]] ["id"] = 224588,["minCount"] = 1},
    {--[[ ["name"] = "luxurious-hat-box",]] ["id"] = 163148,["minCount"] = 1},
    {--[[ ["name"] = "box-o'-booms",]] ["id"] = 224587,["minCount"] = 1},
    {--[[ ["name"] = "box-o'-booms",]] ["id"] = 224586,["minCount"] = 1},
    {--[[ ["name"] = "fancy-hat-box",]] ["id"] = 163146,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 118094,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-infinite-treasure",]] ["id"] = 211279,["minCount"] = 1},
    {--[[ ["name"] = "dented-ashmaul-strongbox",]] ["id"] = 118093,["minCount"] = 1},
    {--[[ ["name"] = "bloody-stack-of-invitations",]] ["id"] = 122191,["minCount"] = 1},
    {--[[ ["name"] = "smuggled-sack-of-gold",]] ["id"] = 120146,["minCount"] = 1},
    {--[[ ["name"] = "large-satchel-of-spoils",]] ["id"] = 43346,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-spoils",]] ["id"] = 43347,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 178513,["minCount"] = 1},
    {--[[ ["name"] = "ancient-mogu-treasure",]] ["id"] = 89428,["minCount"] = 1},
    {--[[ ["name"] = "small-brown-wrapped-package",]] ["id"] = 15699,["minCount"] = 1},
    {--[[ ["name"] = "bloody-gold-purse",]] ["id"] = 120147,["minCount"] = 1},
    {--[[ ["name"] = "ancient-mogu-treasure",]] ["id"] = 89427,["minCount"] = 1},
    {--[[ ["name"] = "dreamweaver-provisions",]] ["id"] = 137560,["minCount"] = 1},
    {--[[ ["name"] = "gleaming-ashmaul-strongbox",]] ["id"] = 120151,["minCount"] = 1},
    {--[[ ["name"] = "farondis-lockbox",]] ["id"] = 137563,["minCount"] = 1},
    {--[[ ["name"] = "nightfallen-hoard",]] ["id"] = 137564,["minCount"] = 1},
    {--[[ ["name"] = "notes-on-lightning-steel",]] ["id"] = 94553,["minCount"] = 1},
    {--[[ ["name"] = "highmountain-tribute",]] ["id"] = 137561,["minCount"] = 1},
    {--[[ ["name"] = "valarjar-cache",]] ["id"] = 137562,["minCount"] = 1},
    {--[[ ["name"] = "warden's-field-kit",]] ["id"] = 137565,["minCount"] = 1},
    {--[[ ["name"] = "plundered-treasure",]] ["id"] = 87391,["minCount"] = 1},
    {--[[ ["name"] = "fortuitous-coffer",]] ["id"] = 94566,["minCount"] = 1},
    {--[[ ["name"] = "tortollan-seekers-supplies",]] ["id"] = 166245,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 114028,["minCount"] = 1},
    {--[[ ["name"] = "brawler's-footlocker",]] ["id"] = 154991,["minCount"] = 1},
    {--[[ ["name"] = "building-contribution-reward-item-[nyi]",]] ["id"] = 146799,["minCount"] = 1},
    {--[[ ["name"] = "brawler's-footlocker",]] ["id"] = 154992,["minCount"] = 1},
    {--[[ ["name"] = "building-contribution-reward-item-[nyi]",]] ["id"] = 146800,["minCount"] = 1},
    {--[[ ["name"] = "bulging-sack-of-silver",]] ["id"] = 23921,["minCount"] = 1},
    {--[[ ["name"] = "shiny-pile-of-refuse",]] ["id"] = 95601,["minCount"] = 1},
    {--[[ ["name"] = "building-contribution-reward-item-[nyi]",]] ["id"] = 146801,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 120184,["minCount"] = 1},
    {--[[ ["name"] = "cypher-test-item",]] ["id"] = 188796,["minCount"] = 1},
    {--[[ ["name"] = "treasures-from-grim-batol",]] ["id"] = 66943,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-mogu-riches",]] ["id"] = 95618,["minCount"] = 1},
    {--[[ ["name"] = "dividends-of-the-everlasting-spring",]] ["id"] = 95617,["minCount"] = 1},
    {--[[ ["name"] = "artisan's-consortium-payout",]] ["id"] = 227713,["minCount"] = 1},
    {--[[ ["name"] = "amber-encased-treasure-pouch",]] ["id"] = 95619,["minCount"] = 1},
    {--[[ ["name"] = "iron-fleet-treasure-chest",]] ["id"] = 128391,["minCount"] = 1},
    {--[[ ["name"] = "lamplighter-supply-satchel",]] ["id"] = 228741,["minCount"] = 1},
    {--[[ ["name"] = "talanji's-expedition-supplies",]] ["id"] = 166282,["minCount"] = 1},
    {--[[ ["name"] = "iron-bound-junkbox",]] ["id"] = 106895,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 116111,["minCount"] = 1},
    {--[[ ["name"] = "rajani-supplies",]] ["id"] = 174483,["minCount"] = 1},
    {--[[ ["name"] = "zandalari-empire-supplies",]] ["id"] = 166292,["minCount"] = 1},
    {--[[ ["name"] = "uldum-accord-supplies",]] ["id"] = 174484,["minCount"] = 1},
    {--[[ ["name"] = "unclaimed-payment",]] ["id"] = 119188,["minCount"] = 1},
    {--[[ ["name"] = "voldunai-supplies",]] ["id"] = 166290,["minCount"] = 1},
    {--[[ ["name"] = "proudmoore-admiralty-supplies",]] ["id"] = 166295,["minCount"] = 1},
    {--[[ ["name"] = "storm's-wake-supplies",]] ["id"] = 166294,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119191,["minCount"] = 1},
    {--[[ ["name"] = "7th-legion-supplies",]] ["id"] = 166300,["minCount"] = 1},
    {--[[ ["name"] = "old-man-thistle's-treasure",]] ["id"] = 86428,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119196,["minCount"] = 1},
    {--[[ ["name"] = "order-of-embers-supplies",]] ["id"] = 166297,["minCount"] = 1},
    {--[[ ["name"] = "champions-of-azeroth-supplies",]] ["id"] = 166298,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119195,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119198,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119197,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119200,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119199,["minCount"] = 1},
    {--[[ ["name"] = "jewelcrafting-payment",]] ["id"] = 119201,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 147876,["minCount"] = 1},
    {--[[ ["name"] = "desiccated-orc's-coin-pouch",]] ["id"] = 116129,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-uldir-treasures",]] ["id"] = 164257,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-uldir-treasures",]] ["id"] = 164258,["minCount"] = 1},
    {--[[ ["name"] = "winner's-reward",]] ["id"] = 90537,["minCount"] = 1},
    {--[[ ["name"] = "sealed-crate",]] ["id"] = 88496,["minCount"] = 1},
    {--[[ ["name"] = "mysterious-shining-lockbox",]] ["id"] = 118193,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-discount-goods",]] ["id"] = 199108,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-the-ley-guardian",]] ["id"] = 52676,["minCount"] = 1},
    {--[[ ["name"] = "waxy-bundle-of-dust",]] ["id"] = 224724,["minCount"] = 1},
    {--[[ ["name"] = "waxy-bundle",]] ["id"] = 228220,["minCount"] = 1},
    {--[[ ["name"] = "waxy-bundle-of-leather",]] ["id"] = 224723,["minCount"] = 1},
    {--[[ ["name"] = "waxy-bundle-of-resonance-crystals",]] ["id"] = 224722,["minCount"] = 1},
    {--[[ ["name"] = "wax-sealed-box",]] ["id"] = 224721,["minCount"] = 1},
    {--[[ ["name"] = "bloated-giant-sunfish",]] ["id"] = 35286,["minCount"] = 1},
    {--[[ ["name"] = "waxy-box-of-rocks",]] ["id"] = 224726,["minCount"] = 1},
    {--[[ ["name"] = "waxy-bundle-of-herbs",]] ["id"] = 224725,["minCount"] = 1},
    {--[[ ["name"] = "artemede's-bounty",]] ["id"] = 184811,["minCount"] = 1},
    {--[[ ["name"] = "pet-care-package",]] ["id"] = 116202,["minCount"] = 1},
    {--[[ ["name"] = "apolon's-bounty",]] ["id"] = 184812,["minCount"] = 1},
    {--[[ ["name"] = "jingling-sack",]] ["id"] = 170473,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-draenei-archaeology-fragments",]] ["id"] = 87534,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-dwarven-archaeology-fragments",]] ["id"] = 87533,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-night-elf-archaeology-fragments",]] ["id"] = 87536,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-fossil-archaeology-fragments",]] ["id"] = 87535,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-orc-archaeology-fragments",]] ["id"] = 87538,["minCount"] = 1},
    {--[[ ["name"] = "battered-junkbox",]] ["id"] = 16882,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-nerubian-archaeology-fragments",]] ["id"] = 87537,["minCount"] = 1},
    {--[[ ["name"] = "worn-junkbox",]] ["id"] = 16883,["minCount"] = 1},
    {--[[ ["name"] = "bloated-smallfish",]] ["id"] = 6643,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-troll-archaeology-fragments",]] ["id"] = 87540,["minCount"] = 1},
    {--[[ ["name"] = "sturdy-junkbox",]] ["id"] = 16884,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-tol'vir-archaeology-fragments",]] ["id"] = 87539,["minCount"] = 1},
    {--[[ ["name"] = "bloated-mud-snapper",]] ["id"] = 6645,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-vrykul-archaeology-fragments",]] ["id"] = 87541,["minCount"] = 1},
    {--[[ ["name"] = "bloated-catfish",]] ["id"] = 6647,["minCount"] = 1},
    {--[[ ["name"] = "heavy-chest",]] ["id"] = 194037,["minCount"] = 1},
    {--[[ ["name"] = "bulging-sack-of-coins",]] ["id"] = 120312,["minCount"] = 1},
    {--[[ ["name"] = "ghost-iron-lockbox",]] ["id"] = 88567,["minCount"] = 1},
    {--[[ ["name"] = "seething-essence",]] ["id"] = 139771,["minCount"] = 1},
    {--[[ ["name"] = "songbell-seed-pack",]] ["id"] = 85498,["minCount"] = 1},
    {--[[ ["name"] = "chirping-package",]] ["id"] = 85497,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90622,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90621,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90624,["minCount"] = 1},
    {--[[ ["name"] = "invader's-abandoned-sack",]] ["id"] = 120320,["minCount"] = 1},
    {--[[ ["name"] = "emerald-encrusted-chest",]] ["id"] = 10752,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90623,["minCount"] = 1},
    {--[[ ["name"] = "invader's-damaged-cache",]] ["id"] = 120319,["minCount"] = 1},
    {--[[ ["name"] = "treasures-of-the-vale",]] ["id"] = 90625,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 128513,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90628,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90627,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90629,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90632,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-ore",]] ["id"] = 89608,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90631,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-leather",]] ["id"] = 89607,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90634,["minCount"] = 1},
    {--[[ ["name"] = "pandaria-herbs",]] ["id"] = 89610,["minCount"] = 1},
    {--[[ ["name"] = "plump-intestines",]] ["id"] = 72201,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90633,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-dust",]] ["id"] = 89609,["minCount"] = 1},
    {--[[ ["name"] = "hero's-purse",]] ["id"] = 90635,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-cosmic-mysteries",]] ["id"] = 120334,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-treasures",]] ["id"] = 89613,["minCount"] = 1},
    {--[[ ["name"] = "keystone-container",]] ["id"] = 151060,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-fishing-treasures",]] ["id"] = 35348,["minCount"] = 1},
    {--[[ ["name"] = "hakkari-urn",]] ["id"] = 10773,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-ticking-crate",]] ["id"] = 198168,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-ticking-crate",]] ["id"] = 198167,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-gold",]] ["id"] = 194072,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-ticking-crate",]] ["id"] = 198166,["minCount"] = 1},
    {--[[ ["name"] = "ornate-bronze-lockbox",]] ["id"] = 4632,["minCount"] = 1},
    {--[[ ["name"] = "heavy-bronze-lockbox",]] ["id"] = 4633,["minCount"] = 1},
    {--[[ ["name"] = "iron-lockbox",]] ["id"] = 4634,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-silent-crate",]] ["id"] = 198171,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-silent-crate",]] ["id"] = 198170,["minCount"] = 1},
    {--[[ ["name"] = "strong-iron-lockbox",]] ["id"] = 4636,["minCount"] = 1},
    {--[[ ["name"] = "suspiciously-silent-crate",]] ["id"] = 198169,["minCount"] = 1},
    {--[[ ["name"] = "steel-lockbox",]] ["id"] = 4637,["minCount"] = 1},
    {--[[ ["name"] = "reinforced-steel-lockbox",]] ["id"] = 4638,["minCount"] = 1},
    {--[[ ["name"] = "a-crazy-grab-bag",]] ["id"] = 15902,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 119330,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 120354,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 120353,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 120356,["minCount"] = 1},
    {--[[ ["name"] = "patroller's-pack",]] ["id"] = 43556,["minCount"] = 1},
    {--[[ ["name"] = "silver-strongbox",]] ["id"] = 120355,["minCount"] = 1},
    {--[[ ["name"] = "seafarer's-lost-coin-pouch",]] ["id"] = 168488,["minCount"] = 1},
    {--[[ ["name"] = "blue-sack-of-gems",]] ["id"] = 17962,["minCount"] = 1},
    {--[[ ["name"] = "green-sack-of-gems",]] ["id"] = 17963,["minCount"] = 1},
    {--[[ ["name"] = "gray-sack-of-gems",]] ["id"] = 17964,["minCount"] = 1},
    {--[[ ["name"] = "yellow-sack-of-gems",]] ["id"] = 17965,["minCount"] = 1},
    {--[[ ["name"] = "algari-tailor's-satchel",]] ["id"] = 228916,["minCount"] = 1},
    {--[[ ["name"] = "narain's-special-kit",]] ["id"] = 21042,["minCount"] = 1},
    {--[[ ["name"] = "heavy-crate",]] ["id"] = 13874,["minCount"] = 1},
    {--[[ ["name"] = "ironbound-locked-chest",]] ["id"] = 13875,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 185906,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-chitin",]] ["id"] = 228920,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-algari-herbs",]] ["id"] = 228919,["minCount"] = 1},
    {--[[ ["name"] = "reinforced-junkbox",]] ["id"] = 43575,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-leather",]] ["id"] = 228918,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-ore",]] ["id"] = 228917,["minCount"] = 1},
    {--[[ ["name"] = "bloated-redgill",]] ["id"] = 13881,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-forgotten-heirlooms",]] ["id"] = 174652,["minCount"] = 1},
    {--[[ ["name"] = "algari-engineer's-satchel",]] ["id"] = 228932,["minCount"] = 1},
    {--[[ ["name"] = "algari-enchanter's-satchel",]] ["id"] = 228931,["minCount"] = 1},
    {--[[ ["name"] = "bloated-salmon",]] ["id"] = 13891,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-helpful-things",]] ["id"] = 86595,["minCount"] = 1},
    {--[[ ["name"] = "heavy-sack-of-gold",]] ["id"] = 92744,["minCount"] = 1},
    {--[[ ["name"] = "algari-leatherworker's-satchel",]] ["id"] = 228933,["minCount"] = 1},
    {--[[ ["name"] = "felhound-tracker-kit",]] ["id"] = 10834,["minCount"] = 1},
    {--[[ ["name"] = "feeder's-hand",]] ["id"] = 186971,["minCount"] = 1},
    {--[[ ["name"] = "lard's-special-picnic-basket",]] ["id"] = 19035,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-barter-boulders",]] ["id"] = 225881,["minCount"] = 1},
    {--[[ ["name"] = "reinforced-locked-chest",]] ["id"] = 13918,["minCount"] = 1},
    {--[[ ["name"] = "purse-of-timeless-coins",]] ["id"] = 104034,["minCount"] = 1},
    {--[[ ["name"] = "a-small-container-of-gems",]] ["id"] = 6755,["minCount"] = 1},
    {--[[ ["name"] = "giant-purse-of-timeless-coins",]] ["id"] = 104035,["minCount"] = 1},
    {--[[ ["name"] = "froststeel-lockbox",]] ["id"] = 43622,["minCount"] = 1},
    {--[[ ["name"] = "titanium-lockbox",]] ["id"] = 43624,["minCount"] = 1},
    {--[[ ["name"] = "a-dingy-fanny-pack",]] ["id"] = 11883,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-frostfire-ridge",]] ["id"] = 122478,["minCount"] = 1},
    {--[[ ["name"] = "bulging-sack-of-gold",]] ["id"] = 62062,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-gorgrond",]] ["id"] = 122480,["minCount"] = 1},
    {--[[ ["name"] = "cenarion-circle-cache",]] ["id"] = 11887,["minCount"] = 1},
    {--[[ ["name"] = "goodies-from-nomi",]] ["id"] = 90735,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-shadowmoon-valley",]] ["id"] = 122479,["minCount"] = 1},
    {--[[ ["name"] = "bundle-of-nether-spikes",]] ["id"] = 30320,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-spires-of-arak",]] ["id"] = 122482,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-talador",]] ["id"] = 122481,["minCount"] = 1},
    {--[[ ["name"] = "blackrock-foundry-spoils",]] ["id"] = 122484,["minCount"] = 1},
    {--[[ ["name"] = "argunite-cluster",]] ["id"] = 153202,["minCount"] = 1},
    {--[[ ["name"] = "scouting-report:-nagrand",]] ["id"] = 122483,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92790,["minCount"] = 1},
    {--[[ ["name"] = "blackrock-foundry-spoils",]] ["id"] = 122486,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92789,["minCount"] = 1},
    {--[[ ["name"] = "blackrock-foundry-spoils",]] ["id"] = 122485,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92792,["minCount"] = 1},
    {--[[ ["name"] = "abandoned-adventurer's-satchel",]] ["id"] = 44663,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92791,["minCount"] = 1},
    {--[[ ["name"] = "watertight-trunk",]] ["id"] = 21113,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92794,["minCount"] = 1},
    {--[[ ["name"] = "ysida's-satchel",]] ["id"] = 22137,["minCount"] = 1},
    {--[[ ["name"] = "ride-ticket-book",]] ["id"] = 92793,["minCount"] = 1},
    {--[[ ["name"] = "mithril-lockbox",]] ["id"] = 5758,["minCount"] = 1},
    {--[[ ["name"] = "thorium-lockbox",]] ["id"] = 5759,["minCount"] = 1},
    {--[[ ["name"] = "eternium-lockbox",]] ["id"] = 5760,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-pandaren-archaeology-fragments",]] ["id"] = 117386,["minCount"] = 1},
    {--[[ ["name"] = "carriage-cargo",]] ["id"] = 180875,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-mantid-archaeology-fragments",]] ["id"] = 117388,["minCount"] = 1},
    {--[[ ["name"] = "followup-combat-assignment",]] ["id"] = 21131,["minCount"] = 1},
    {--[[ ["name"] = "gently-shaken-gift",]] ["id"] = 128652,["minCount"] = 1},
    {--[[ ["name"] = "crate-of-mogu-archaeology-fragments",]] ["id"] = 117387,["minCount"] = 1},
    {--[[ ["name"] = "logistics-assignment",]] ["id"] = 21132,["minCount"] = 1},
    {--[[ ["name"] = "followup-tactical-assignment",]] ["id"] = 21133,["minCount"] = 1},
    {--[[ ["name"] = "greater-cache-of-treasures",]] ["id"] = 92813,["minCount"] = 1},
    {--[[ ["name"] = "winter-veil-gift",]] ["id"] = 128653,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-earthen-treasures",]] ["id"] = 229006,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-earthen-treasures",]] ["id"] = 229005,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-herbs",]] ["id"] = 106130,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-mushan-ribs",]] ["id"] = 87702,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-raw-tiger-steaks",]] ["id"] = 87701,["minCount"] = 1},
    {--[[ ["name"] = "small-pouch-of-coins",]] ["id"] = 116376,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-raw-crab-meat",]] ["id"] = 87704,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-raw-turtle-meat",]] ["id"] = 87703,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-green-cabbages",]] ["id"] = 87706,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-wildfowl-breasts",]] ["id"] = 87705,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97948,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-mogu-pumpkins",]] ["id"] = 87708,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-juicycrunch-carrots",]] ["id"] = 87707,["minCount"] = 1},
    {--[[ ["name"] = "savage-gift",]] ["id"] = 128670,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97950,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-red-blossom-leeks",]] ["id"] = 87710,["minCount"] = 1},
    {--[[ ["name"] = "iron-bound-trunk",]] ["id"] = 21150,["minCount"] = 1},
    {--[[ ["name"] = "light's-fortune",]] ["id"] = 153248,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97949,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-scallions",]] ["id"] = 87709,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97952,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-witchberries",]] ["id"] = 87712,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97951,["minCount"] = 1},
    {--[[ ["name"] = "minor-bronze-cache",]] ["id"] = 223908,["minCount"] = 1},
    {--[[ ["name"] = "fat-sack-of-coins",]] ["id"] = 11937,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97954,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-striped-melons",]] ["id"] = 87714,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97953,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-jade-squash",]] ["id"] = 87713,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-gems",]] ["id"] = 11938,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97956,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-white-turnips",]] ["id"] = 87716,["minCount"] = 1},
    {--[[ ["name"] = "scarab-bag",]] ["id"] = 21156,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97955,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-pink-turnips",]] ["id"] = 87715,["minCount"] = 1},
    {--[[ ["name"] = "stormwind-guard-armor-package",]] ["id"] = 117414,["minCount"] = 1},
    {--[[ ["name"] = "greater-bronze-cache",]] ["id"] = 223911,["minCount"] = 1},
    {--[[ ["name"] = "surplus-supplies",]] ["id"] = 97957,["minCount"] = 1},
    {--[[ ["name"] = "bronze-cache",]] ["id"] = 223910,["minCount"] = 1},
    {--[[ ["name"] = "lesser-bronze-cache",]] ["id"] = 223909,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-giant-mantis-shrimp",]] ["id"] = 87722,["minCount"] = 1},
    {--[[ ["name"] = "rare-bag-of-loot",]] ["id"] = 133804,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-jade-lungfish",]] ["id"] = 87721,["minCount"] = 1},
    {--[[ ["name"] = "box-of-supplies",]] ["id"] = 6827,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-redbelly-mandarin",]] ["id"] = 87724,["minCount"] = 1},
    {--[[ ["name"] = "bloated-rockscale-cod",]] ["id"] = 21164,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-emperor-salmon",]] ["id"] = 87723,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-jewel-danio",]] ["id"] = 87726,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-krasarang-paddlefish",]] ["id"] = 87728,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 67248,["minCount"] = 1},
    {--[[ ["name"] = "offering-of-the-sha'tar",]] ["id"] = 31408,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-reef-octopus",]] ["id"] = 87727,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 67250,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-crocolisk-belly",]] ["id"] = 87730,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-golden-carp",]] ["id"] = 87729,["minCount"] = 1},
    {--[[ ["name"] = "small-sack-of-coins",]] ["id"] = 11966,["minCount"] = 1},
    {--[[ ["name"] = "misty-satchel-of-exotic-mysteries",]] ["id"] = 90818,["minCount"] = 1},
    {--[[ ["name"] = "engorged-stomach",]] ["id"] = 110278,["minCount"] = 1},
    {--[[ ["name"] = "alliance-strongbox",]] ["id"] = 140997,["minCount"] = 1},
    {--[[ ["name"] = "horde-strongbox",]] ["id"] = 140998,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-mogu-riches",]] ["id"] = 89804,["minCount"] = 1},
    {--[[ ["name"] = "dividends-of-the-everlasting-spring",]] ["id"] = 89808,["minCount"] = 1},
    {--[[ ["name"] = "amber-encased-treasure-pouch",]] ["id"] = 89807,["minCount"] = 1},
    {--[[ ["name"] = "oddly-shaped-stomach",]] ["id"] = 129746,["minCount"] = 1},
    {--[[ ["name"] = "bounty-of-a-sundered-land",]] ["id"] = 89810,["minCount"] = 1},
    {--[[ ["name"] = "northrend-mystery-gem-pouch",]] ["id"] = 46812,["minCount"] = 1},
    {--[[ ["name"] = "an-unforgettable-luncheon",]] ["id"] = 160485,["minCount"] = 1},
    {--[[ ["name"] = "mithril-bound-trunk",]] ["id"] = 21228,["minCount"] = 1},
    {--[[ ["name"] = "ascended-chest-of-arms",]] ["id"] = 184047,["minCount"] = 1},
    {--[[ ["name"] = "weapon-satchel-of-the-wild-hunt",]] ["id"] = 184048,["minCount"] = 1},
    {--[[ ["name"] = "martial-tithe-of-the-court-of-harvesters",]] ["id"] = 184045,["minCount"] = 1},
    {--[[ ["name"] = "undying-army-weapon-cache",]] ["id"] = 184046,["minCount"] = 1},
    {--[[ ["name"] = "savage-satchel-of-cooperation",]] ["id"] = 122607,["minCount"] = 1},
    {--[[ ["name"] = "stash-of-dusty-music-rolls",]] ["id"] = 122613,["minCount"] = 1},
    {--[[ ["name"] = "unclaimed-black-market-container",]] ["id"] = 102137,["minCount"] = 1},
    {--[[ ["name"] = "sealed-darkmoon-crate",]] ["id"] = 124670,["minCount"] = 1},
    {--[[ ["name"] = "amber-encased-treasure-pouch",]] ["id"] = 89856,["minCount"] = 1},
    {--[[ ["name"] = "the-general's-trove",]] ["id"] = 226045,["minCount"] = 1},
    {--[[ ["name"] = "thaurissan-family-jewels",]] ["id"] = 12033,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-mogu-riches",]] ["id"] = 89858,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-highmaul-treasures",]] ["id"] = 118530,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-highmaul-treasures",]] ["id"] = 118529,["minCount"] = 1},
    {--[[ ["name"] = "maokka's-box",]] ["id"] = 160514,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-highmaul-treasures",]] ["id"] = 118531,["minCount"] = 1},
    {--[[ ["name"] = "bound-traveler's-scroll",]] ["id"] = 107270,["minCount"] = 1},
    {--[[ ["name"] = "mantid-artifact-hunter's-kit",]] ["id"] = 104198,["minCount"] = 1},
    {--[[ ["name"] = "brazie's-black-book-of-secrets",]] ["id"] = 49926,["minCount"] = 1},
    {--[[ ["name"] = "frozen-envelope",]] ["id"] = 107271,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-delver's-spoils",]] ["id"] = 229130,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-delver's-spoils",]] ["id"] = 229129,["minCount"] = 1},
    {--[[ ["name"] = "build-a-computer-kit",]] ["id"] = 167696,["minCount"] = 1},
    {--[[ ["name"] = "fireproof-satchel",]] ["id"] = 24336,["minCount"] = 1},
    {--[[ ["name"] = "logistics-assignment",]] ["id"] = 21266,["minCount"] = 1},
    {--[[ ["name"] = "large-gardener's-satchel",]] ["id"] = 178967,["minCount"] = 1},
    {--[[ ["name"] = "weekly-gardener's-satchel",]] ["id"] = 178968,["minCount"] = 1},
    {--[[ ["name"] = "small-gardener's-satchel",]] ["id"] = 178965,["minCount"] = 1},
    {--[[ ["name"] = "gardener's-satchel",]] ["id"] = 178966,["minCount"] = 1},
    {--[[ ["name"] = "seafarer's-coin-pouch",]] ["id"] = 163611,["minCount"] = 1},
    {--[[ ["name"] = "wayfinder's-satchel",]] ["id"] = 163612,["minCount"] = 1},
    {--[[ ["name"] = "test-container",]] ["id"] = 178969,["minCount"] = 1},
    {--[[ ["name"] = "maruuk-centaur-supplies",]] ["id"] = 190233,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 51999,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-plunder",]] ["id"] = 163613,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52000,["minCount"] = 1},
    {--[[ ["name"] = "stack-of-vip-passes",]] ["id"] = 200477,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52001,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52002,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52003,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52004,["minCount"] = 1},
    {--[[ ["name"] = "savage-satchel-of-cooperation",]] ["id"] = 128803,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-helpful-goods",]] ["id"] = 52005,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-frosty-treasures",]] ["id"] = 52006,["minCount"] = 1},
    {--[[ ["name"] = "hatching-corpsefly-egg",]] ["id"] = 187182,["minCount"] = 1},
    {--[[ ["name"] = "mux's-quality-goods",]] ["id"] = 22320,["minCount"] = 1},
    {--[[ ["name"] = "the-vizier's-trove",]] ["id"] = 226100,["minCount"] = 1},
    {--[[ ["name"] = "huge-sack-of-coins",]] ["id"] = 98097,["minCount"] = 1},
    {--[[ ["name"] = "sack-of-ulduar-spoils",]] ["id"] = 45875,["minCount"] = 1},
    {--[[ ["name"] = "humongous-sack-of-coins",]] ["id"] = 98100,["minCount"] = 1},
    {--[[ ["name"] = "captain-gulnaku's-treasure",]] ["id"] = 163633,["minCount"] = 1},
    {--[[ ["name"] = "giant-sack-of-coins",]] ["id"] = 98099,["minCount"] = 1},
    {--[[ ["name"] = "overflowing-sack-of-coins",]] ["id"] = 98102,["minCount"] = 1},
    {--[[ ["name"] = "mr.-pinchy's-gift",]] ["id"] = 27446,["minCount"] = 1},
    {--[[ ["name"] = "the-weaver's-trove",]] ["id"] = 226103,["minCount"] = 1},
    {--[[ ["name"] = "large-sack-of-ulduar-spoils",]] ["id"] = 45878,["minCount"] = 1},
    {--[[ ["name"] = "enormous-sack-of-coins",]] ["id"] = 98101,["minCount"] = 1},
    {--[[ ["name"] = "gigantic-sack-of-coins",]] ["id"] = 98103,["minCount"] = 1},
    {--[[ ["name"] = "glowing-green-ash",]] ["id"] = 104258,["minCount"] = 1},
    {--[[ ["name"] = "smokywood-satchel",]] ["id"] = 21315,["minCount"] = 1},
    {--[[ ["name"] = "satchel-of-savage-mysteries",]] ["id"] = 104260,["minCount"] = 1},
    {--[[ ["name"] = "glowing-blue-ash",]] ["id"] = 104261,["minCount"] = 1},
    {--[[ ["name"] = "glinting-pile-of-stone",]] ["id"] = 104263,["minCount"] = 1},
    {--[[ ["name"] = "unmarked-bag-of-gems",]] ["id"] = 25419,["minCount"] = 1},
    {--[[ ["name"] = "pristine-stalker-hide",]] ["id"] = 104268,["minCount"] = 1},
    {--[[ ["name"] = "bulging-sack-of-gems",]] ["id"] = 25422,["minCount"] = 1},
    {--[[ ["name"] = "anniversary-gift",]] ["id"] = 162637,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-premium-gems",]] ["id"] = 25423,["minCount"] = 1},
    {--[[ ["name"] = "gem-stuffed-envelope",]] ["id"] = 25424,["minCount"] = 1},
    {--[[ ["name"] = "coalesced-turmoil",]] ["id"] = 104271,["minCount"] = 1},
    {--[[ ["name"] = "flame-scarred-cache-of-offerings",]] ["id"] = 104273,["minCount"] = 1},
    {--[[ ["name"] = "package-of-identified-plants",]] ["id"] = 24402,["minCount"] = 1},
    {--[[ ["name"] = "twisted-treasures-of-the-vale",]] ["id"] = 104275,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-shiny-things",]] ["id"] = 67414,["minCount"] = 1},
    {--[[ ["name"] = "greater-cache-of-treasures",]] ["id"] = 98133,["minCount"] = 1},
    {--[[ ["name"] = "soul-ash-cache",]] ["id"] = 187221,["minCount"] = 1},
    {--[[ ["name"] = "challenger's-strongbox",]] ["id"] = 127831,["minCount"] = 1},
    {--[[ ["name"] = "heavy-supply-crate",]] ["id"] = 27481,["minCount"] = 1},
    {--[[ ["name"] = "kum'isha's-junk",]] ["id"] = 12122,["minCount"] = 1},
    {--[[ ["name"] = "oozing-necroray-egg",]] ["id"] = 184158,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-dazar'alor-treasures",]] ["id"] = 165731,["minCount"] = 1},
    {--[[ ["name"] = "challenger's-spoils",]] ["id"] = 141155,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-dazar'alor-treasures",]] ["id"] = 165732,["minCount"] = 1},
    {--[[ ["name"] = "haunted-ravencrest-keepsake",]] ["id"] = 141156,["minCount"] = 1},
    {--[[ ["name"] = "partially-digested-meal",]] ["id"] = 104292,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-dazar'alor-treasures",]] ["id"] = 165729,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-dazar'alor-treasures",]] ["id"] = 165730,["minCount"] = 1},
    {--[[ ["name"] = "watertight-salvage-bag",]] ["id"] = 141159,["minCount"] = 1},
    {--[[ ["name"] = "ordon-ceremonial-robes",]] ["id"] = 104296,["minCount"] = 1},
    {--[[ ["name"] = "nightborne-rucksack",]] ["id"] = 141157,["minCount"] = 1},
    {--[[ ["name"] = "despoiled-keeper's-cache",]] ["id"] = 141158,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-confiscated-materials",]] ["id"] = 141163,["minCount"] = 1},
    {--[[ ["name"] = "violet-hold-contraband-locker",]] ["id"] = 141164,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-the-black-dragon",]] ["id"] = 141161,["minCount"] = 1},
    {--[[ ["name"] = "unmarked-suramar-vault-crate",]] ["id"] = 141162,["minCount"] = 1},
    {--[[ ["name"] = "iron-fleet-treasure-chest",]] ["id"] = 127854,["minCount"] = 1},
    {--[[ ["name"] = "nightborne-rucksack",]] ["id"] = 141167,["minCount"] = 1},
    {--[[ ["name"] = "iron-fleet-treasure-chest",]] ["id"] = 127853,["minCount"] = 1},
    {--[[ ["name"] = "despoiled-keeper's-cache",]] ["id"] = 141168,["minCount"] = 1},
    {--[[ ["name"] = "challenger's-spoils",]] ["id"] = 141165,["minCount"] = 1},
    {--[[ ["name"] = "iron-fleet-treasure-chest",]] ["id"] = 127855,["minCount"] = 1},
    {--[[ ["name"] = "large-iron-metamorphosis-geode",]] ["id"] = 32624,["minCount"] = 1},
    {--[[ ["name"] = "haunted-ravencrest-keepsake",]] ["id"] = 141166,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-the-black-dragon",]] ["id"] = 141171,["minCount"] = 1},
    {--[[ ["name"] = "life-pool-herb-pouch",]] ["id"] = 194419,["minCount"] = 1},
    {--[[ ["name"] = "small-iron-metamorphosis-geode",]] ["id"] = 32625,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightborne-treasures",]] ["id"] = 140148,["minCount"] = 1},
    {--[[ ["name"] = "unmarked-suramar-vault-crate",]] ["id"] = 141172,["minCount"] = 1},
    {--[[ ["name"] = "large-copper-metamorphosis-geode",]] ["id"] = 32626,["minCount"] = 1},
    {--[[ ["name"] = "small-copper-metamorphosis-geode",]] ["id"] = 32627,["minCount"] = 1},
    {--[[ ["name"] = "watertight-salvage-bag",]] ["id"] = 141169,["minCount"] = 1},
    {--[[ ["name"] = "large-silver-metamorphosis-geode",]] ["id"] = 32628,["minCount"] = 1},
    {--[[ ["name"] = "flame-scarred-junkbox",]] ["id"] = 63349,["minCount"] = 1},
    {--[[ ["name"] = "large-gold-metamorphosis-geode",]] ["id"] = 32629,["minCount"] = 1},
    {--[[ ["name"] = "challenger's-spoils",]] ["id"] = 141175,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightborne-treasures",]] ["id"] = 140152,["minCount"] = 1},
    {--[[ ["name"] = "small-gold-metamorphosis-geode",]] ["id"] = 32630,["minCount"] = 1},
    {--[[ ["name"] = "haunted-ravencrest-keepsake",]] ["id"] = 141176,["minCount"] = 1},
    {--[[ ["name"] = "small-silver-metamorphosis-geode",]] ["id"] = 32631,["minCount"] = 1},
    {--[[ ["name"] = "kyrian-keepsake",]] ["id"] = 180085,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-confiscated-materials",]] ["id"] = 141173,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightborne-treasures",]] ["id"] = 140150,["minCount"] = 1},
    {--[[ ["name"] = "violet-hold-contraband-locker",]] ["id"] = 141174,["minCount"] = 1},
    {--[[ ["name"] = "seaweed-encrusted-satchel",]] ["id"] = 141180,["minCount"] = 1},
    {--[[ ["name"] = "nightborne-rucksack",]] ["id"] = 141177,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nightborne-treasures",]] ["id"] = 140154,["minCount"] = 1},
    {--[[ ["name"] = "despoiled-keeper's-cache",]] ["id"] = 141178,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-confiscated-materials",]] ["id"] = 141183,["minCount"] = 1},
    {--[[ ["name"] = "violet-hold-contraband-locker",]] ["id"] = 141184,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-the-black-dragon",]] ["id"] = 141181,["minCount"] = 1},
    {--[[ ["name"] = "unmarked-suramar-vault-crate",]] ["id"] = 141182,["minCount"] = 1},
    {--[[ ["name"] = "strong-junkbox",]] ["id"] = 29569,["minCount"] = 1},
    {--[[ ["name"] = "pandaria-fireworks",]] ["id"] = 89991,["minCount"] = 1},
    {--[[ ["name"] = "followup-logistics-assignment",]] ["id"] = 21386,["minCount"] = 1},
    {--[[ ["name"] = "silk-kej-pouch",]] ["id"] = 226196,["minCount"] = 1},
    {--[[ ["name"] = "resonance-crystal-cluster",]] ["id"] = 226195,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-nerubian-treasures",]] ["id"] = 226193,["minCount"] = 1},
    {--[[ ["name"] = "silk-kej-purse",]] ["id"] = 226199,["minCount"] = 1},
    {--[[ ["name"] = "resonance-crystal-agglomeration",]] ["id"] = 226198,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-antoran-treasures",]] ["id"] = 153503,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-antoran-treasures",]] ["id"] = 153504,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-antoran-treasures",]] ["id"] = 153501,["minCount"] = 1},
    {--[[ ["name"] = "small-velvet-bag",]] ["id"] = 41888,["minCount"] = 1},
    {--[[ ["name"] = "cache-of-antoran-treasures",]] ["id"] = 153502,["minCount"] = 1},
    {--[[ ["name"] = "reborn-spirit-cache",]] ["id"] = 178078,["minCount"] = 1},
    {--[[ ["name"] = "tiny-titanium-lockbox",]] ["id"] = 45986,["minCount"] = 1},
    {--[[ ["name"] = "dragon-racing-purse---third-place",]] ["id"] = 200611,["minCount"] = 1},
    {--[[ ["name"] = "dragon-racing-purse---second-place",]] ["id"] = 200610,["minCount"] = 1},
    {--[[ ["name"] = "dragon-racing-purse---first-place",]] ["id"] = 200609,["minCount"] = 1},
    {--[[ ["name"] = "immaculate-nightshard-curio",]] ["id"] = 140200,["minCount"] = 1},
    {--[[ ["name"] = "strange-bloated-stomach",]] ["id"] = 67495,["minCount"] = 1},
    {--[[ ["name"] = "novice-actor's-chest",]] ["id"] = 217012,["minCount"] = 1},
    {--[[ ["name"] = "amateur-actor's-chest",]] ["id"] = 217011,["minCount"] = 1},
    {--[[ ["name"] = "silver-strongbox",]] ["id"] = 126902,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 126901,["minCount"] = 1},
    {--[[ ["name"] = "bag-of-fishing-treasures",]] ["id"] = 46007,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 126904,["minCount"] = 1},
    {--[[ ["name"] = "expert-actor's-chest",]] ["id"] = 217013,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 126903,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 126906,["minCount"] = 1},
    {--[[ ["name"] = "scavenged-cloth",]] ["id"] = 140220,["minCount"] = 1},
    {--[[ ["name"] = "spoils-of-theramore",]] ["id"] = 90041,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 126905,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 126908,["minCount"] = 1},
    {--[[ ["name"] = "silver-strongbox",]] ["id"] = 126907,["minCount"] = 1},
    {--[[ ["name"] = "butchered-meat",]] ["id"] = 140224,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 126909,["minCount"] = 1},
    {--[[ ["name"] = "found-sack-of-gems",]] ["id"] = 140221,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 126912,["minCount"] = 1},
    {--[[ ["name"] = "harvested-goods",]] ["id"] = 140222,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 126911,["minCount"] = 1},
    {--[[ ["name"] = "bloodhunter's-quarry",]] ["id"] = 140227,["minCount"] = 1},
    {--[[ ["name"] = "gold-strongbox",]] ["id"] = 126914,["minCount"] = 1},
    {--[[ ["name"] = "steel-strongbox",]] ["id"] = 126913,["minCount"] = 1},
    {--[[ ["name"] = "salvaged-armor",]] ["id"] = 140225,["minCount"] = 1},
    {--[[ ["name"] = "bronze-strongbox",]] ["id"] = 126916,["minCount"] = 1},
    {--[[ ["name"] = "mana-tinged-pack",]] ["id"] = 140226,["minCount"] = 1},
    {--[[ ["name"] = "silver-strongbox",]] ["id"] = 126915,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 126918,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 126917,["minCount"] = 1},
    {--[[ ["name"] = "champion's-strongbox",]] ["id"] = 126920,["minCount"] = 1},
    {--[[ ["name"] = "champion's-strongbox",]] ["id"] = 126919,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 126922,["minCount"] = 1},
    {--[[ ["name"] = "icy-satchel-of-helpful-goods",]] ["id"] = 114634,["minCount"] = 1},
    {--[[ ["name"] = "ashmaul-strongbox",]] ["id"] = 126921,["minCount"] = 1},
    {--[[ ["name"] = "champion's-strongbox",]] ["id"] = 126924,["minCount"] = 1},
    {--[[ ["name"] = "sprocket-container",]] ["id"] = 144330,["minCount"] = 1},
    {--[[ ["name"] = "champion's-strongbox",]] ["id"] = 126923,["minCount"] = 1},
    {--[[ ["name"] = "token-of-the-remembrancers",]] ["id"] = 226256,["minCount"] = 1},
    {--[[ ["name"] = "big-bag-of-zandalari-supplies",]] ["id"] = 94158,["minCount"] = 1},
    {--[[ ["name"] = "mage-hunter-personal-effects",]] ["id"] = 35792,["minCount"] = 1},
    {--[[ ["name"] = "zen'vorka's-cache",]] ["id"] = 71631,["minCount"] = 1},
    {--[[ ["name"] = "follower-retraining-scroll-case",]] ["id"] = 123858,["minCount"] = 1},
    {--[[ ["name"] = "ankoan-supplies",]] ["id"] = 169939,["minCount"] = 1},
    {--[[ ["name"] = "runic-pouch",]] ["id"] = 123857,["minCount"] = 1},
    {--[[ ["name"] = "unshackled-supplies",]] ["id"] = 169940,["minCount"] = 1},
    {--[[ ["name"] = "icy-satchel-of-helpful-goods",]] ["id"] = 114641,["minCount"] = 1},
    {--[[ ["name"] = "tiny-treasure-chest",]] ["id"] = 67539,["minCount"] = 1},
    {--[[ ["name"] = "sludge-covered-object",]] ["id"] = 32724,["minCount"] = 1},
    {--[[ ["name"] = "overflowing-council-of-dornogal-trove",]] ["id"] = 225239,["minCount"] = 1},
    {--[[ ["name"] = "scorched-satchel-of-helpful-goods",]] ["id"] = 114648,["minCount"] = 1},
    {--[[ ["name"] = "pile-of-pet-goodies",]] ["id"] = 144345,["minCount"] = 1},
    {--[[ ["name"] = "overflowing-severed-threads-trove",]] ["id"] = 225247,["minCount"] = 1},
    {--[[ ["name"] = "overflowing-hallowfall-trove",]] ["id"] = 225246,["minCount"] = 1},
    {--[[ ["name"] = "overflowing-trove-of-the-deeps",]] ["id"] = 225245,["minCount"] = 1},
    {--[[ ["name"] = "scorched-satchel-of-helpful-goods",]] ["id"] = 114655,["minCount"] = 1},

    -- Weekly Draconic-Treatise (Disabled). If you would like to add these to the addon even though you can only use it once per week, remove the "--" from in front of the lines (11-21), save the file and /reload the game.
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Mining",]] ["id"] = 194708,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Herbalism",]] ["id"] = 194704,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Skinning",]] ["id"] = 201023,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Alchemy",]] ["id"] = 194697,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Blacksmithing",]] ["id"] = 198454,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Enchanting",]] ["id"] = 194702,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Engineering",]] ["id"] = 198510,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Inscription",]] ["id"] = 194699,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Jewelcrafting",]] ["id"] = 194703,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Leatherworking",]] ["id"] = 194700,["minCount"] = 1},
    --{--[[ ["name"] = "SoulbindCacheOpener_Draconic-Treatise-on-Tailoring",]] ["id"] = 194698,["minCount"] = 1},
    
    -- Random missing items
    {--[[ ["name"] = "SoulbindCacheOpener_adventurers-footlocker",]] ["id"] = 208878,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_hearthstone-starter-pack",]] ["id"] = 212979,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-box-of-vials",]] ["id"] = 210991,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-starter-kit",]] ["id"] = 219219,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-starter-kit",]] ["id"] = 219218,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_the-big-dig-rig",]] ["id"] = 215160,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-amirdrassil-treasures",]] ["id"] = 209036,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-amirdrassil-treasures",]] ["id"] = 209037,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-centaur-tome",]] ["id"] = 213185,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ruby-flightstone",]] ["id"] = 217382,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blackened-flightstone",]] ["id"] = 217412,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blackened-flightstone",]] ["id"] = 217411,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-weaponry",]] ["id"] = 221509,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dryads-supply-pouch",]] ["id"] = 211303,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bag-of-many-wonders",]] ["id"] = 211373,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-stuffed-basket",]] ["id"] = 213428,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-starter-kit",]] ["id"] = 211388,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bloomed-wildling-cache",]] ["id"] = 211410,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bundle-of-love-tokens",]] ["id"] = 211430,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bundle-of-love-tokens",]] ["id"] = 211429,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_whelplings-bountiful-chest",]] ["id"] = 213541,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_pirates-booty",]] ["id"] = 217705,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-purse",]] ["id"] = 45724,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-parting-pack",]] ["id"] = 223953,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-gem-box",]] ["id"] = 224120,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_winter-veil-gift",]] ["id"] = 209871,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_adventurers-footlocker",]] ["id"] = 218130,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_basket-of-draconic-flowers",]] ["id"] = 224296,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_invaders-satchel-of-helpful-goods",]] ["id"] = 210063,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ironbound-satchel-of-helpful-goods",]] ["id"] = 210062,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_an-invitation",]] ["id"] = 212157,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_emerald-flightstone",]] ["id"] = 210180,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timewarped-pouch",]] ["id"] = 224547,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gigantic-dreamy-bounty",]] ["id"] = 210219,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_plump-dreamy-bounty",]] ["id"] = 210218,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-dreamy-bounty",]] ["id"] = 210217,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-emerald-bloom",]] ["id"] = 210224,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_wyrms-shadowflame-crest-fragment",]] ["id"] = 204077,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_large-emerald-bloom",]] ["id"] = 210226,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_medium-emerald-bloom",]] ["id"] = 210225,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-rumble-purse",]] ["id"] = 202183,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_arclight-rumble-foil-box",]] ["id"] = 204346,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_timerunners-intro-kit",]] ["id"] = 216638,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dream-racers-purse",]] ["id"] = 210549,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gently-shaken-gift",]] ["id"] = 210657,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ruby-flightstone",]] ["id"] = 210726,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-filled-basket",]] ["id"] = 216874,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_argunite-cluster",]] ["id"] = 208691,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_honorable-satchel-of-herbs",]] ["id"] = 210760,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_honorable-satchel-of-ore",]] ["id"] = 210759,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_honorable-satchel-of-fabrics",]] ["id"] = 210758,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_satchel-of-dreams",]] ["id"] = 210872,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stolen-hearthstone-card",]] ["id"] = 212924,["minCount"] = 1},

    --10.2.6 Awakened Caches
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Embers",]] ["id"] = 215363,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Awakened-Embers",]] ["id"] = 217110,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Storms",]] ["id"] = 215362,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Awakened-Storms",]] ["id"] = 217109,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Dreams",]] ["id"] = 215364,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Awakened-Dreams",]] ["id"] = 217111,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Awakened-TreasuresA",]] ["id"] = 217728,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Awakened-TreasuresB",]] ["id"] = 217729,["minCount"] = 1},
    
    --10.2.6 Flightstone Wings
    {--[[ ["name"] = "SoulbindCacheOpener_Awakening_Ruby_Wing",]] ["id"] = 217243,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Awakening_Stone_Wing",]] ["id"] = 217242,["minCount"] = 1},
    -- Crests
    {--[[ ["name"] = "SoulbindCacheOpener_Awakenened_Flightstone",]] ["id"] = 212458,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_lively-clutch-of-wyrms-awakened-crests",]] ["id"] = 211950,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_restless-satchel-of-drakes-awakened-crests",]] ["id"] = 212384,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_restless-satchel-of-aspects-awakened-crests",]] ["id"] = 212383,["minCount"] = 1},
    
    -- Azerothian Archives
    {--[[ ["name"] = "SoulbindCacheOpener_meticulous-archivists-appendix",]] ["id"] = 213429,["minCount"] = 1},
    
    -- Tomes (These are gained every 1000 points at the Big Dig Event)
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-djaradin-tome",]] ["id"] = 213175,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_preserved-isles-tome",]] ["id"] = 213176,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_immaculate-tome",]] ["id"] = 213177,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-centaur-tome",]] ["id"] = 205985,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-niffen-tome",]] ["id"] = 213186,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-dracthyr-tome",]] ["id"] = 213188,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_preserved-dragonkin-tome",]] ["id"] = 213189,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_preserved-djaradin-tome",]] ["id"] = 213190,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-drakonid-tome",]] ["id"] = 213187,["minCount"] = 1},
    
    -- Consumables
    -- These may be consumed to provide Mysterious Fragments (Currency for Transmog) or sold for gold
    {--[[ ["name"] = "SoulbindCacheOpener_pot-of-tattooing-ink",]] ["id"] = 212650,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-djaradin-bolt",]] ["id"] = 213025,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakonid-sign-placard",]] ["id"] = 212977,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakonid-blacksmith-hammer",]] ["id"] = 213022,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_corked-drakonid-vial",]] ["id"] = 213021,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-drakonid-shovel",]] ["id"] = 213020,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_carved-votive-stone",]] ["id"] = 213215,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_pot-of-pickled-ancheevies",]] ["id"] = 213208,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_oil-drenched-djaradin-torch",]] ["id"] = 213023,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_partial-centaur-hunting-map",]] ["id"] = 213382,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cracked-drakonid-staff",]] ["id"] = 213359,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_carved-cave-crystal",]] ["id"] = 213365,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tattered-wanted-poster",]] ["id"] = 212769,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragon-painters-palette",]] ["id"] = 212978,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crystal-scrying-bowl",]] ["id"] = 213357,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tarnished-horn-signet",]] ["id"] = 212762,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ruby-studded-locket",]] ["id"] = 213204,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_makeshift-beaded-bracelet",]] ["id"] = 213183,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakonid-duck-carving",]] ["id"] = 212976,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_satchel-of-buried-valuables",]] ["id"] = 213375,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bloody-djaradin-mug",]] ["id"] = 213024,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ornamented-centaur-axe",]] ["id"] = 205233,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_scratched-out-list-of-names",]] ["id"] = 213192,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rusted-locket",]] ["id"] = 212773,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crude-toy-ducky",]] ["id"] = 212687,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-centaur-diary",]] ["id"] = 213389,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_book-of-horoscopes",]] ["id"] = 213200,["minCount"] = 1},
    
    -- Doomshadow Drops
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-trusty-satchel",]] ["id"] = 212640,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-glovelettes",]] ["id"] = 212639,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-work-shirt",]] ["id"] = 212638,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-rugged-pants",]] ["id"] = 212641,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_clayscale-hornstrider",]] ["id"] = 212645,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-boots",]] ["id"] = 212642,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_excavators-pack-of-findings",]] ["id"] = 212793,["minCount"] = 1},
    
    --Patch 10.2.0
    {--[[ ["name"] = "SoulbindCacheOpener_sprouting-dreamtrove",]] ["id"] = 211411,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_budding-dreamtrove",]] ["id"] = 211413,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blossoming-dreamtrove",]] ["id"] = 211414,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-overblooming-treasures",]] ["id"] = 211389,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_harvested-dreamseed-cache",]] ["id"] = 211394,["minCount"] = 1},
    
    -- Test Equipment on PTR
    {--[[ ["name"] = "SoulbindCacheOpener_PTR-PlayTest-Equipment",]] ["id"] = 186520,["minCount"] = 1},
    --
    
    -- Rousing (Stack of 10) - Listed also in the updateButton function as items that need to be in a stack of 10
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-earth",]] ["id"] = 190315,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-fire",]] ["id"] = 190320,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-order",]] ["id"] = 190322,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-air",]] ["id"] = 190326,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-frost",]] ["id"] = 190328,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-decay",]] ["id"] = 190330,["minCount"] = 10},
    {--[[ ["name"] = "SoulbindCacheOpener_rousing-ire",]] ["id"] = 190451,["minCount"] = 10},
    -- 
    -- Different stack sizes
    {--[[ ["name"] = "SoulbindCacheOpener_splintered-spark-of-shadowflame",]] ["id"] = 204717,["minCount"] = 2},
    {--[[ ["name"] = "SoulbindCacheOpener_whelplings-shadowflame-crest-fragment",]] ["id"] = 204075,["minCount"] = 15},
    {--[[ ["name"] = "SoulbindCacheOpener_drakes-shadowflame-crest-fragment",]] ["id"] = 204076,["minCount"] = 15},
    {--[[ ["name"] = "SoulbindCacheOpener_aspects-shadowflame-crest-fragment",]] ["id"] = 204078,["minCount"] = 15},
    
    
    
    --Darkmoon Faire
    {--[[ ["name"] = "SoulbindCacheOpener_RideTicketBook",]] ["id"] = 92788,["minCount"] = 1},
    --Kyrian
        -- SoulBind
    {--[[ ["name"] = "SoulbindCacheOpener_CleansingRiteMaterials",]] ["id"] = 183701,["minCount"] = 1},
    
        -- Calling
    {--[[ ["name"] = "SoulbindCacheOpener_tributeoftheascended",]] ["id"] = 181372,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tributeoftheparagon",]] ["id"] = 181741,["minCount"] = 1},
    
        -- Paragon
    {--[[ ["name"] = "SoulbindCacheOpener_AscendedSupplies",]] ["id"] = 180647,["minCount"] = 1},
        
    -- Night Fae
        -- SoulBind
    {--[[ ["name"] = "SoulbindCacheOpener_NaturesSplendor",]] ["id"] = 183702,["minCount"] = 1},
    
        -- Calling
    {--[[ ["name"] = "SoulbindCacheOpener_bountyofthegrovewardens",]] ["id"] = 181475,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tributeofthewildhunt",]] ["id"] = 181476,["minCount"] = 1},
    
        -- Paragon
    {--[[ ["name"] = "SoulbindCacheOpener_WildHuntSupplies",]] ["id"] = 180649,["minCount"] = 1},
    
    -- Necrolord
        -- SoulBind
    {--[[ ["name"] = "SoulbindCacheOpener_BonesmithsSatchel",]] ["id"] = 183703,["minCount"] = 1},
    
        -- Calling
    {--[[ ["name"] = "SoulbindCacheOpener_tributeoftheambitious",]] ["id"] = 181732,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tributeofthedutybound",]] ["id"] = 181733,["minCount"] = 1},
    
        -- Paragon
    {--[[ ["name"] = "SoulbindCacheOpener_SuppliesoftheUndyingArmy",]] ["id"] = 180646,["minCount"] = 1},
    
        -- Abomination
    {--[[ ["name"] = "SoulbindCacheOpener_SalvagedSupplies",]] ["id"] = 184843,["minCount"] = 1},
    
    -- Venthyr
        -- SoulBind
    {--[[ ["name"] = "SoulbindCacheOpener_ExquisiteIngredients",]] ["id"] = 183699,["minCount"] = 1},
    
        -- Calling
    {--[[ ["name"] = "SoulbindCacheOpener_tributeofthecourt",]] ["id"] = 181556,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_favorofthecourt",]] ["id"] = 181557,["minCount"] = 1},
    
        -- Paragon
    {--[[ ["name"] = "SoulbindCacheOpener_CourtofHarvestersSupplies",]] ["id"] = 180648,["minCount"] = 1},
    
    -- Command Table
    {--[[ ["name"] = "SoulbindCacheOpener_AdventurersMiningCache",]] ["id"] = 184635,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-mining-cache",]] ["id"] = 184641,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-mining-cache",]] ["id"] = 184646,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AdventurersTailoringCache",]] ["id"] = 184630,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-tailoring-cache",]] ["id"] = 184639,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-tailoring-cache",]] ["id"] = 184644,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AdventurersEnchantingCache",]] ["id"] = 184631,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-enchanting-cache",]] ["id"] = 184643,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-enchanting-cache",]] ["id"] = 184648,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AdventurersHerbalismCache",]] ["id"] = 184634,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-herbalism-cache",]] ["id"] = 184647,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-herbalism-cache",]] ["id"] = 184642,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AdventurersSkinningCache",]] ["id"] = 184636,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-skinning-cache",]] ["id"] = 184640,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-skinning-cache",]] ["id"] = 184645,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ChampionsFishCache",]] ["id"] = 184632,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-fish-cache",]] ["id"] = 184638,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ChampionsMeatCache",]] ["id"] = 184633,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heros-meat-cache",]] ["id"] = 184637,["minCount"] = 1},
    
    -- Queen's Conservatory
    {--[[ ["name"] = "SoulbindCacheOpener_novicessatchel",]] ["id"] = 180974,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_noviceslargesatchel",]] ["id"] = 180981,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_novicesstuffedsatchel",]] ["id"] = 180985,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_novicesoverflowingsatchel",]] ["id"] = 180989,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_journeymanssatchel",]] ["id"] = 180975,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_journeymanslargesatchel",]] ["id"] = 180980,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_journeymansstuffedsatchel",]] ["id"] = 180984,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_journeymansoverflowingsatchel",]] ["id"] = 180988,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_artisanssatchel",]] ["id"] = 180976,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_artisanslargesatchel",]] ["id"] = 180979,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_artisansstuffedsatchel",]] ["id"] = 180983,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_spirittenderssatchel",]] ["id"] = 180977,["minCount"] = 1},
    
    -- The Maw
    {--[[ ["name"] = "SoulbindCacheOpener_FallenAdventurersCache",]] ["id"] = 184395,["minCount"] = 1},
    
    -- Torghast
    {--[[ ["name"] = "SoulbindCacheOpener_BloodedSatchel",]] ["id"] = 171209,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_SatchelofNaturesBounty",]] ["id"] = 171210,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_VenthyrsCoinPurse",]] ["id"] = 171211,["minCount"] = 1},
    
    -- Revendreth
    {--[[ ["name"] = "SoulbindCacheOpener_PouchofShinies",]] ["id"] = 178128,["minCount"] = 1},
    
    -- Blingtron
    {--[[ ["name"] = "SoulbindCacheOpener_blingtron-4000-gift-package",]] ["id"] = 86623,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blingtron-5000-gift-package",]] ["id"] = 113258,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blingtron-6000-gift-package",]] ["id"] = 132892,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blingtron-7000-gift-package",]] ["id"] = 168740,["minCount"] = 1},
    
    -- Timewalking Cata
    {--[[ ["name"] = "SoulbindCacheOpener_cacheofnathriantreasures",]] ["id"] = 184869,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cacheofnathriantreasures",]] ["id"] = 184868,["minCount"] = 1},
    
    -- LFG Call to Arms
    {--[[ ["name"] = "SoulbindCacheOpener_veiledsatchelofcooperation",]] ["id"] = 184522,["minCount"] = 1},
        
    -- Noblegarden
    {--[[ ["name"] = "SoulbindCacheOpener_brightlycoloredegg",]] ["id"] = 45072,["minCount"] = 1},
        
    -- Added by Z
    {--[[ ["name"] = "SoulbindCacheOpener_GreaterDarkmoonPetSupplies",]] ["id"] = 116062,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_TravelersPetSupplies",]] ["id"] = 122535,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BigBagofPetSupplies",]] ["id"] = 118697,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_DarkmoonPetSupplies",]] ["id"] = 91086,["minCount"] = 1},
    
    -- 9.0.1
    {--[[ ["name"] = "SoulbindCacheOpener_condensed-stygia",]] ["id"] = 178040,["minCount"] = 1},
    
    -- 9.1 Korthia
    {--[[ ["name"] = "SoulbindCacheOpener_tormentorscache",]] ["id"] = 185972,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AbandonedBrokerSatchel",]] ["id"] = 187354,["minCount"] = 1},
    
    -- Assault Rewards
    {--[[ ["name"] = "SoulbindCacheOpener_WarChestoftheUndyingArmy",]] ["id"] = 185992,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_WarChestoftheWildHunt",]] ["id"] = 185991,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_AscendedWarChest",]] ["id"] = 185993,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_HarvestersWarChest",]] ["id"] = 185990,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_DeathsAdvanceWarChest",]] ["id"] = 186196,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_DeathsAdvanceWarChest2",]] ["id"] = 187543,["minCount"] = 1},
    
    -- Added by modrogon
    {--[[ ["name"] = "SoulbindCacheOpener_FeatherStuffedHelm",]] ["id"] = 187440,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_DivinersRuneChit",]] ["id"] = 185963,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_TalonPiercedMawswornLockbox",]] ["id"] = 187278,["minCount"] = 1},
        
    --Korthia Cache
    {--[[ ["name"] = "SoulbindCacheOpener_KorthianMeatCache",]] ["id"] = 187577,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_KorthianSkinningCache",]] ["id"] = 187576,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_KorthianFishingCache",]] ["id"] = 187575,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_MysteriousGiftfromVenari",]] ["id"] = 187029,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_FeedersHandandKey",]] ["id"] = 186970,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_CacheofSanctumTreasures226",]] ["id"] = 186531,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_CacheofSanctumTreasures239",]] ["id"] = 186533,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_CacheofSanctumTreasures239",]] ["id"] = 187574,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BrokersEnchantingMoteofPotentiation",]] ["id"] = 187573,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BrokersHerbalismMoteofPotentiation",]] ["id"] = 187572,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BrokersTailoringMoteofPotentiation",]] ["id"] = 187569,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BrokersSkinningMoteofPotentiation",]] ["id"] = 187570,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_BrokersMiningMoteofPotentiation",]] ["id"] = 187571,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_LostMemento",]] ["id"] = 187346,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledBoot",]] ["id"] = 186680,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledCrate",]] ["id"] = 186707,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_SmallKorthianSupplyChest",]] ["id"] = 187551,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_DeathsAdvanceSupplies",]] ["id"] = 186650,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledHat",]] ["id"] = 186706,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledWashBucket",]] ["id"] = 186688,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledPaintBrushCup",]] ["id"] = 186708,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledChalice",]] ["id"] = 186705,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledSatchel",]] ["id"] = 186691,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledBarrel",]] ["id"] = 186690,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledHelmet",]] ["id"] = 186692,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_GoldFilledWheelbarrow",]] ["id"] = 186693,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_SuppliesoftheArchivistsCodex",]] ["id"] = 187028,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_StygicCluster",]] ["id"] = 187351,["minCount"] = 1},
    
    -- Brewfest
    {--[[ ["name"] = "SoulbindCacheOpener_KegShapedTreasureChest",]] ["id"] = 117393,["minCount"] = 1},
    
    --Hallows end
    {--[[ ["name"] = "SoulbindCacheOpener_LootStuffedPumpkin",]] ["id"] = 149574,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_LootFilledPumpkinRare",]] ["id"] = 54516,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_LootFilledPumpkinEpic",]] ["id"] = 117392,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_HandfulofTreats",]] ["id"] = 37586,["minCount"] = 1},
        
    -- Patch 9.2
    {--[[ ["name"] = "SoulbindCacheOpener_olea-cache",]] ["id"] = 187781,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-chest-of-riches",]] ["id"] = 191303,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_enlightened-broker-supplies",]] ["id"] = 187780,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ephemera-orb",]] ["id"] = 187787,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bottled-night-sky",]] ["id"] = 191302,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cosmic-flux-parcel",]] ["id"] = 191030,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-sepulcher-treasures252",]] ["id"] = 191040,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_pouch-of-protogenic-provisions",]] ["id"] = 190178,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-sepulcher-treasures2521",]] ["id"] = 190655,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_treatise-on-patterns-in-the-purpose",]] ["id"] = 191301,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-sepulcher-treasures265",]] ["id"] = 190656,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-sepulcher-treasures2651",]] ["id"] = 191041,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_firims-mysterious-cache",]] ["id"] = 190823,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tribute-of-the-enlightened-elders1",]] ["id"] = 191139,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tribute-of-the-enlightened-elders2",]] ["id"] = 190610,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bag-of-explored-souls",]] ["id"] = 191701,["minCount"] = 1},
    
    --Patch 9.25
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-fated-treasures278",]] ["id"] = 192437,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-fated-treasures291",]] ["id"] = 192438,["minCount"] = 1},
        
    -- 2022 Anniversary
    {--[[ ["name"] = "SoulbindCacheOpener_anniversary-gift2022",]] ["id"] = 187710,["minCount"] = 1},
        
    -- Pet Bags
    {--[[ ["name"] = "SoulbindCacheOpener_sack-of-pet-supplies",]] ["id"] = 89125,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_fabled-pandaren-pet-supplies",]] ["id"] = 94207,["minCount"] = 1},
        
    -- Legion Rep Chests
    {--[[ ["name"] = "SoulbindCacheOpener_dreamweaver-provisions",]] ["id"] = 157822,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_kirin-tor-chest",]] ["id"] = 157828,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_brittle-krokul-chest",]] ["id"] = 152922,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_wardens-field-kit",]] ["id"] = 157827,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_wardens-supply-kit",]] ["id"] = 152107,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing_dream_warden_trove",]] ["id"] = 210992,["minCount"] = 1},
        
    -- 9.0 command table
    {--[[ ["name"] = "SoulbindCacheOpener_bulging-collection-of-random-bits",]] ["id"] = 183883,["minCount"] = 1},
        
    -- MoP
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Vault-Treasures",]] ["id"] = 104272,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stormtouched-cache",]] ["id"] = 95602,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-sha-touched-gold",]] ["id"] = 90839,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_fel-touched-pet-supplies",]] ["id"] = 94159,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_marauders-gleaming-sack-of-gold",]] ["id"] = 90840,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_spoils-of-the-thunder-king",]] ["id"] = 97153,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-bag-of-goods",]] ["id"] = 87217,["minCount"] = 1},
        
    --Mechagon
    {--[[ ["name"] = "SoulbindCacheOpener_azeroth-mini-pack-mechagon",]] ["id"] = 169850,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_strange-recycling-requisition",]] ["id"] = 168266,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_recycling-requisition",]] ["id"] = 168264,["minCount"] = 1},
        
    --pet bags
    {--[[ ["name"] = "SoulbindCacheOpener_torn-sack-of-pet-supplies",]] ["id"] = 142447,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_grummlepouch",]] ["id"] = 184866,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_fel-touched-pet-supplies",]] ["id"] = 127751,["minCount"] = 1},
        
    -- BfA Paragon chests
    {--[[ ["name"] = "SoulbindCacheOpener_honorbound-supplies",]] ["id"] = 166299,["minCount"] = 1},
        
    -- vanilla
    {--[[ ["name"] = "SoulbindCacheOpener_small-barnacled-clam",]] ["id"] = 5523,["minCount"] = 1},
    
    -- Legion Rep Chests
    {--[[ ["name"] = "SoulbindCacheOpener_valarjar-cache",]] ["id"] = 157824,["minCount"] = 1},
        
    -- Pilgrim's Bounty
    {--[[ ["name"] = "SoulbindCacheOpener_pilgrims-bounty",]] ["id"] = 116404,["minCount"] = 1},
    
    -- Patch 10.0.2 Pre-Patch
    {--[[ ["name"] = "SoulbindCacheOpener_Immaculate-Sac-of-Swog-Treasures",]] ["id"] = 202102,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Weighted-Sac-of-Swog-Treasures",]] ["id"] = 199342,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Primal-Chaos-Cluster",]] ["id"] = 202122,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Curiously-Shaped-Stomach",]] ["id"] = 201462,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dragonbane-Keep-Strongbox",]] ["id"] = 202142,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Obsidian-Forgemaster's-Strongbox",]] ["id"] = 201755,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Jeweled-Dragon's-Heart",]] ["id"] = 202059,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Docile-Frosty-Soul",]] ["id"] = 201299,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Twilight-Strongbox",]] ["id"] = 201818,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Queen's-Gift",]] ["id"] = 202048,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Jeweled-Dragon's-Heart",]] ["id"] = 202053,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Victorious-Contender's-Strongbox",]] ["id"] = 201250,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Docile-Fiery-Soul",]] ["id"] = 201298,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Earthwarden's-Prize",]] ["id"] = 202051,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Keeper's-Glory",]] ["id"] = 202056,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Docile-Airy-Soul",]] ["id"] = 201296,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bag-of-Leather-Reagents",]] ["id"] = 201352,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dreamer's-Vision",]] ["id"] = 202049,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Queen's-Gift",]] ["id"] = 202054,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Earthwarden's-Prize",]] ["id"] = 202057,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Topped-Trunk-of-Disenchanted-Detritus",]] ["id"] = 202101,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bag-of-Cloth-Armor-Reagents",]] ["id"] = 201343,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Vault-Treasures",]] ["id"] = 202080,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Crowded-Crate-of-Mined-Materials",]] ["id"] = 202098,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Docile-Earthen-Soul",]] ["id"] = 201297,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bag-of-Mail-Armor-Reagents",]] ["id"] = 201353,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bag-of-Plate-Armor-Reagents",]] ["id"] = 201354,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bulging-Coin-Purse",]] ["id"] = 201756,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Twilight-Cache",]] ["id"] = 201817,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Timewatcher's-Patience",]] ["id"] = 202052,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dragon-Purse",]] ["id"] = 202171,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Pillaged-Contender's-Strongbox",]] ["id"] = 201251,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Draconic-Satchel-of-Cooperation",]] ["id"] = 201326,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Renewed-Dream",]] ["id"] = 201439,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Vakril's-Strongbox",]] ["id"] = 201728,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Plundered-Supplies",]] ["id"] = 201757,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Keeper's-Glory",]] ["id"] = 202050,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dreamer's-Vision",]] ["id"] = 202055,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Timewatcher's-Patience",]] ["id"] = 202058,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Bulging-Box-of-Skins-and-Scales",]] ["id"] = 202097,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Populous-Pack-of-Castoff-Cloth",]] ["id"] = 202100,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Immaculate-Sac-of-Swog-Treasures",]] ["id"] = 202103,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Weighted-Sac-of-Swog-Treasures",]] ["id"] = 202104,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Overflowing-Satchel-of-Coins",]] ["id"] = 202172,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Obsidian-Forgemaster's-Cache",]] ["id"] = 201754,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Cache-of-Vault-Treasures",]] ["id"] = 202079,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_earthbound-tome",]] ["id"] = 194741,["minCount"] = 1},
        
    -- Dragonflight Crafting
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge1",]] ["id"] = 201700,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge2",]] ["id"] = 201705,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge3",]] ["id"] = 201706,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge4",]] ["id"] = 201708,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge5",]] ["id"] = 201709,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge6",]] ["id"] = 201710,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge7",]] ["id"] = 201711,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge8",]] ["id"] = 201713,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge9",]] ["id"] = 201714,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge10",]] ["id"] = 201715,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge11",]] ["id"] = 201716,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge12",]] ["id"] = 201717,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Notebook-of-Crafting-Knowledge14",]] ["id"] = 201718,["minCount"] = 1},
        
    -- Fishing
    {--[[ ["name"] = "SoulbindCacheOpener_Draconic-Recipe-in-a-Bottle",]] ["id"] = 198438,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Aged-Recipe-in-a-Bottle",]] ["id"] = 198439,["minCount"] = 1},
    
    -- Mining Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Elementally-Charged-Stone",]] ["id"] = 202011,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Heated-Ore-Sample",]] ["id"] = 194039,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Unyielding-Stone-Chunk",]] ["id"] = 194062,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Iridescent-Ore-Fragments",]] ["id"] = 201300,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Iridescent-Ore",]] ["id"] = 201301,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Mining-Field-Notes",]] ["id"] = 199122,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Miner's-Notes",]] ["id"] = 200981,["minCount"] = 1},
    
    -- Herbalism Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Infused-Pollen",]] ["id"] = 202014,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dreambloom-Petal",]] ["id"] = 200677,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dreambloom",]] ["id"] = 200678,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Herbalism-Field-Notes",]] ["id"] = 199115,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Herbalist's-Notes",]] ["id"] = 200980,["minCount"] = 1},
    
    -- Skinning Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Curious-Hide-Scraps",]] ["id"] = 198837,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Saturated-Bone",]] ["id"] = 202016,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Large-Sample-of-Curious-Hide",]] ["id"] = 198841,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Skinning-Field-Notes",]] ["id"] = 199128,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Skinner's-Notes",]] ["id"] = 200982,["minCount"] = 1},
    
    -- Alchemy Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Alchemist's-Research",]] ["id"] = 200974,["minCount"] = 1},
    
    -- Blacksmithing Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Blacksmith's-Diagrams",]] ["id"] = 200972,["minCount"] = 1},
    
    -- Enchanting Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Enchanter's-Research",]] ["id"] = 200976,["minCount"] = 1},
    
    -- Engineering Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Engineer's-Scribblings",]] ["id"] = 200977,["minCount"] = 1},
    
    -- Inscription Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Scribe's-Runic-Drawings",]] ["id"] = 200973,["minCount"] = 1},
    
    -- Jewelcrafting Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Jeweler's-Illustrations",]] ["id"] = 200978,["minCount"] = 1},
    
    -- Leatherworking Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Leatherworker's-Diagrams",]] ["id"] = 200979,["minCount"] = 1},
    
    -- Tailoring Knowledge
    {--[[ ["name"] = "SoulbindCacheOpener_Dusty-Tailor's-Diagrams",]] ["id"] = 200975,["minCount"] = 1},
    
    -- Knowledge Treasures
    {--[[ ["name"] = "SoulbindCacheOpener_experimental-decay-sample",]] ["id"] = 198599,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_painters-pretty-jewel",]] ["id"] = 198656,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_decay-infused-tanning-oil",]] ["id"] = 198658,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_forgetful-apprentices-tome",]] ["id"] = 198659,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_fragmented-key",]] ["id"] = 198660,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_intriguing-bolt-of-blue-cloth",]] ["id"] = 198662,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_frostforged-potion",]] ["id"] = 198663,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crystalline-overgrowth",]] ["id"] = 198664,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_spare-djaradin-tools",]] ["id"] = 198667,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_how-to-train-your-whelpling",]] ["id"] = 198669,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_lofty-malygite",]] ["id"] = 198670,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_lava-infused-seed",]] ["id"] = 198675,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_decaying-brackenhide-blanket",]] ["id"] = 198680,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_alexstraszite-cluster",]] ["id"] = 198682,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_treated-hides",]] ["id"] = 198683,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_miniature-bronze-dragonflight-banner",]] ["id"] = 198684,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_well-insulated-mug",]] ["id"] = 198685,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_frosted-parchment",]] ["id"] = 198686,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_closely-guarded-shiny",]] ["id"] = 198687,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stormbound-horn",]] ["id"] = 198689,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_decayed-scales",]] ["id"] = 198690,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_noteworthy-scrap-of-carpet",]] ["id"] = 198692,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dusty-darkmoon-card",]] ["id"] = 198693,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_enriched-earthen-shard",]] ["id"] = 198694,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_wind-blessed-hide",]] ["id"] = 198696,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_contraband-concoction",]] ["id"] = 198697,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_mysterious-banner",]] ["id"] = 198699,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_itinerant-singed-fabric",]] ["id"] = 198702,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_sign-language-reference-sheet",]] ["id"] = 198703,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_pulsing-earth-rune",]] ["id"] = 198704,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_canteen-of-suspicious-water",]] ["id"] = 198710,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_poachers-pack",]] ["id"] = 198711,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_firewater-powder-sample",]] ["id"] = 198712,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_intact-coil-capacitor",]] ["id"] = 198789,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_flashfrozen-scroll",]] ["id"] = 198798,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_forgotten-arcane-tome",]] ["id"] = 198799,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_fractured-titanic-sphere",]] ["id"] = 198800,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_furry-gloop",]] ["id"] = 201003,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-spear-shards",]] ["id"] = 201004,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_curious-ingots",]] ["id"] = 201005,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_draconic-flux",]] ["id"] = 201006,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-monument",]] ["id"] = 201007,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_molten-ingot",]] ["id"] = 201008,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_falconer-gauntlet-drawings",]] ["id"] = 201009,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_qalashi-weapon-diagram",]] ["id"] = 201010,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_spelltouched-tongs",]] ["id"] = 201011,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_enchanted-debris",]] ["id"] = 201012,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_faintly-enchanted-remains",]] ["id"] = 201013,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_boomthyr-rocket",]] ["id"] = 201014,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_counterfeit-darkmoon-deck",]] ["id"] = 201015,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_harmonic-crystal-harmonizer",]] ["id"] = 201016,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_igneous-gem",]] ["id"] = 201017,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_well-danced-drum",]] ["id"] = 201018,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-dragonweave-bolt",]] ["id"] = 201019,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_silky-surprise",]] ["id"] = 201020,["minCount"] = 1},
    
    -- Consortium Quartermaster
    {--[[ ["name"] = "SoulbindCacheOpener_rare-blacksmiths-diagrams",]] ["id"] = 201268,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-scribes-runic-drawings",]] ["id"] = 201269,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-alchemists-research",]] ["id"] = 201270,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-tailors-diagrams",]] ["id"] = 201271,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-enchanters-research",]] ["id"] = 201272,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-engineers-scribblings",]] ["id"] = 201273,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-jewelers-illustrations",]] ["id"] = 201274,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-leatherworkers-diagrams",]] ["id"] = 201275,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-herbalists-notes",]] ["id"] = 201276,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-miners-notes",]] ["id"] = 201277,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rare-skinners-notes",]] ["id"] = 201278,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-blacksmiths-diagrams",]] ["id"] = 201279,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-scribes-runic-drawings",]] ["id"] = 201280,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-alchemists-research",]] ["id"] = 201281,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-tailors-diagrams",]] ["id"] = 201282,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-enchanters-research",]] ["id"] = 201283,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-engineers-scribblings",]] ["id"] = 201284,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-jewelers-illustrations",]] ["id"] = 201285,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-leatherworkers-diagrams",]] ["id"] = 201286,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-herbalists-notes",]] ["id"] = 201287,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-miners-notes",]] ["id"] = 201288,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-skinners-notes",]] ["id"] = 201289,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_life-pools-watering-can",]] ["id"] = 194418,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_i-o-u",]] ["id"] = 198790,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dull-spined-clam",]] ["id"] = 198395,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crowded-crate-of-mined-materials",]] ["id"] = 202098,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bulging-box-of-skins-and-scales",]] ["id"] = 202097,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stocked-sack-of-hale-herbs",]] ["id"] = 202099,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_populous-pack-of-castoff-cloth",]] ["id"] = 202100,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_topped-trunk-of-disenchanted-detritus",]] ["id"] = 202101,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_obsidian-cache",]] ["id"] = 200069,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_obsidian-strongbox",]] ["id"] = 200070,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_obsidian-forgemasters-cache",]] ["id"] = 201754,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_obsidian-forgemasters-strongbox",]] ["id"] = 201755,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_twilight-cache",]] ["id"] = 201817,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_twilight-strongbox",]] ["id"] = 201818,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-gold-and-black-armor",]] ["id"] = 197346,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-silver-and-blue-armor",]] ["id"] = 197347,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-silver-and-purple-armor",]] ["id"] = 197350,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-gold-and-red-armor",]] ["id"] = 197351,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-steel-and-yellow-armor",]] ["id"] = 197352,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-horned-back",]] ["id"] = 197354,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-thick-spined-jaw",]] ["id"] = 197355,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-armor",]] ["id"] = 197357,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-curved-spiked-brow",]] ["id"] = 197358,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spined-brow",]] ["id"] = 197360,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spiked-crest",]] ["id"] = 197361,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spined-crest",]] ["id"] = 197362,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-maned-crest",]] ["id"] = 197363,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-dual-horned-crest",]] ["id"] = 197366,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-gray-hair",]] ["id"] = 197367,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-blue-hair",]] ["id"] = 197368,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-red-hair",]] ["id"] = 197370,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-purple-hair",]] ["id"] = 197372,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-bovine-horns",]] ["id"] = 197377,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-impaler-horns",]] ["id"] = 197379,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-gradient-horns",]] ["id"] = 197381,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-white-horns",]] ["id"] = 197382,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-heavy-horns",]] ["id"] = 197383,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-horned-jaw",]] ["id"] = 197385,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spiked-jaw",]] ["id"] = 197386,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-green-scales",]] ["id"] = 197389,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-blue-scales",]] ["id"] = 197390,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-bronze-scales",]] ["id"] = 197391,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-black-scales",]] ["id"] = 197392,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-white-scales",]] ["id"] = 197393,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-predator-pattern",]] ["id"] = 197394,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-harrier-pattern",]] ["id"] = 197395,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-skyterror-pattern",]] ["id"] = 197396,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-heavy-scales",]] ["id"] = 197397,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-snub-snout",]] ["id"] = 197398,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-razor-snout",]] ["id"] = 197399,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-shark-snout",]] ["id"] = 197400,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-beaked-snout",]] ["id"] = 197401,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spiked-club-tail",]] ["id"] = 197402,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-club-tail",]] ["id"] = 197403,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spined-tail",]] ["id"] = 197406,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-spiked-throat",]] ["id"] = 197407,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-finned-throat",]] ["id"] = 197408,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_draconic-recipe-in-a-bottle",]] ["id"] = 198438,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-renewed-proto-drake-predator-pattern",]] ["id"] = 198899,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-renewed-proto-drake-steel-and-yellow-armor",]] ["id"] = 201738,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-renewed-proto-drake-bovine-horns",]] ["id"] = 201741,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-renewed-proto-drake-silver-and-blue-armor",]] ["id"] = 201742,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-embodiment-of-the-storm-eater",]] ["id"] = 201790,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_weighted-sac-of-swog-treasures",]] ["id"] = 199342,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_immaculate-sac-of-swog-treasures",]] ["id"] = 202102,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-red-scales",]] ["id"] = 192111,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake",]] ["id"] = 194034,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-black-and-red-armor",]] ["id"] = 197348,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-gold-and-white-armor",]] ["id"] = 197349,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-bronze-and-pink-armor",]] ["id"] = 197353,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-hairy-back",]] ["id"] = 197356,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-hairy-brow",]] ["id"] = 197359,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-short-spiked-crest",]] ["id"] = 197364,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-finned-crest",]] ["id"] = 197365,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-brown-hair",]] ["id"] = 197369,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-green-hair",]] ["id"] = 197371,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-helm",]] ["id"] = 197373,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-swept-horns",]] ["id"] = 197374,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-curled-horns",]] ["id"] = 197375,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-ears",]] ["id"] = 197376,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-subtle-horns",]] ["id"] = 197378,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-curved-horns",]] ["id"] = 197380,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-thick-spined-jaw",]] ["id"] = 197384,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-thin-spined-jaw",]] ["id"] = 197387,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-finned-jaw",]] ["id"] = 197388,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-finned-tail",]] ["id"] = 197404,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_renewed-proto-drake-maned-tail",]] ["id"] = 197405,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-renewed-proto-drake-spined-crest",]] ["id"] = 198901,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragon-racers-purse",]] ["id"] = 199192,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-armor",]] ["id"] = 196961,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-silver-and-purple-armor",]] ["id"] = 196962,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-silver-and-blue-armor",]] ["id"] = 196963,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-gold-and-black-armor",]] ["id"] = 196964,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-gold-and-orange-armor",]] ["id"] = 196966,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-steel-and-yellow-armor",]] ["id"] = 196968,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-finned-back",]] ["id"] = 196969,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-back",]] ["id"] = 196970,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-plated-brow",]] ["id"] = 196972,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-dual-horned-chin",]] ["id"] = 196973,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-head-mane",]] ["id"] = 196976,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-split-head-horns",]] ["id"] = 196977,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-triple-head-horns",]] ["id"] = 196980,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-conical-head",]] ["id"] = 196981,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-ears",]] ["id"] = 196982,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-horned-jaw",]] ["id"] = 196985,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-black-hair",]] ["id"] = 196986,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-blonde-hair",]] ["id"] = 196987,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-red-hair",]] ["id"] = 196988,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-white-hair",]] ["id"] = 196989,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-black-horns",]] ["id"] = 196991,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-heavy-horns",]] ["id"] = 196992,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-short-horns",]] ["id"] = 196994,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-branched-horns",]] ["id"] = 196996,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-split-horns",]] ["id"] = 196997,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-hook-horns",]] ["id"] = 196998,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-swept-horns",]] ["id"] = 196999,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-finned-cheek",]] ["id"] = 197001,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-cheek",]] ["id"] = 197003,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-legs",]] ["id"] = 197004,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-horned-nose",]] ["id"] = 197005,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-wide-stripes-pattern",]] ["id"] = 197007,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-scaled-pattern",]] ["id"] = 197009,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-red-scales",]] ["id"] = 197010,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-green-scales",]] ["id"] = 197011,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-blue-scales",]] ["id"] = 197012,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-black-scales",]] ["id"] = 197013,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-white-scales",]] ["id"] = 197014,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-dark-skin-variation",]] ["id"] = 197015,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-maned-tail",]] ["id"] = 197016,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-large-tail-spikes",]] ["id"] = 197017,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-blunt-spiked-tail",]] ["id"] = 197019,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-finned-neck",]] ["id"] = 197022,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-maned-neck",]] ["id"] = 197023,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-cliffside-wylderdrake-conical-head",]] ["id"] = 198891,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-cliffside-wylderdrake-red-hair",]] ["id"] = 198892,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-cliffside-wylderdrake-triple-head-horns",]] ["id"] = 198893,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-cliffside-wylderdrake-silver-and-blue-armor",]] ["id"] = 201734,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-cliffside-wylderdrake-steel-and-yellow-armor",]] ["id"] = 201736,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-bronze-and-teal-armor",]] ["id"] = 196965,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-gold-and-white-armor",]] ["id"] = 196967,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-brow",]] ["id"] = 196971,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-four-horned-chin",]] ["id"] = 196974,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-head-fin",]] ["id"] = 196975,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-small-head-spikes",]] ["id"] = 196978,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-curled-head-horns",]] ["id"] = 196979,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-maned-jaw",]] ["id"] = 196983,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-finned-jaw",]] ["id"] = 196984,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-helm",]] ["id"] = 196990,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-sleek-horns",]] ["id"] = 196993,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-horns",]] ["id"] = 196995,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-coiled-horns",]] ["id"] = 197000,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-flared-cheek",]] ["id"] = 197002,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-plated-nose",]] ["id"] = 197006,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-narrow-stripes-pattern",]] ["id"] = 197008,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-finned-tail",]] ["id"] = 197018,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spear-tail",]] ["id"] = 197020,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cliffside-wylderdrake-spiked-club-tail",]] ["id"] = 197021,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-manuscript-spined-head",]] ["id"] = 194838,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-gold-and-black-armor",]] ["id"] = 197090,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-silver-and-blue-armor",]] ["id"] = 197091,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-gold-and-red-armor",]] ["id"] = 197094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-steel-and-yellow-armor",]] ["id"] = 197096,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-back",]] ["id"] = 197097,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-finned-back",]] ["id"] = 197098,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-armor",]] ["id"] = 197099,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-crested-brow",]] ["id"] = 197100,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-bushy-brow",]] ["id"] = 197101,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-maned-chin",]] ["id"] = 197103,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-chin",]] ["id"] = 197105,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-triple-finned-head",]] ["id"] = 197107,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-head",]] ["id"] = 197108,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-maned-head",]] ["id"] = 197111,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-swept-spiked-head",]] ["id"] = 197113,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-multi-horned-head",]] ["id"] = 197114,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-thorned-jaw",]] ["id"] = 197115,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-ears",]] ["id"] = 197116,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-black-hair",]] ["id"] = 197117,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-brown-hair",]] ["id"] = 197118,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-helm",]] ["id"] = 197119,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-tan-horns",]] ["id"] = 197121,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-heavy-horns",]] ["id"] = 197122,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-thorn-horns",]] ["id"] = 197123,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-coiled-horns",]] ["id"] = 197125,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-grand-thorn-horns",]] ["id"] = 197127,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-curled-back-horns",]] ["id"] = 197128,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-stag-horns",]] ["id"] = 197130,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-hairy-cheek",]] ["id"] = 197131,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spiked-cheek",]] ["id"] = 197132,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-cheek",]] ["id"] = 197133,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-toothy-mouth",]] ["id"] = 197135,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-striped-pattern",]] ["id"] = 197138,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-black-scales",]] ["id"] = 197142,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-green-scales",]] ["id"] = 197143,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-red-scales",]] ["id"] = 197144,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-bronze-scales",]] ["id"] = 197145,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-white-scales",]] ["id"] = 197146,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-heavy-scales",]] ["id"] = 197147,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-club-tail",]] ["id"] = 197149,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spiked-club-tail",]] ["id"] = 197150,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-hooked-tail",]] ["id"] = 197152,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-neck",]] ["id"] = 197154,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-finned-neck",]] ["id"] = 197155,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-highland-drake-black-hair",]] ["id"] = 198894,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-highland-drake-silver-and-blue-armor",]] ["id"] = 201735,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-embodiment-of-the-crimson-gladiator",]] ["id"] = 201792,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-manuscript-spined-throat",]] ["id"] = 194836,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-manuscript-black-hair",]] ["id"] = 194837,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-silver-and-purple-armor",]] ["id"] = 197093,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-gold-and-white-armor",]] ["id"] = 197095,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-horned-chin",]] ["id"] = 197102,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-tapered-chin",]] ["id"] = 197104,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-finned-head",]] ["id"] = 197106,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spiked-head",]] ["id"] = 197109,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-plated-head",]] ["id"] = 197110,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-single-horned-head",]] ["id"] = 197112,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-ornate-helm",]] ["id"] = 197120,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-swept-horns",]] ["id"] = 197124,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-hooked-horns",]] ["id"] = 197126,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-sleek-horns",]] ["id"] = 197129,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spiked-legs",]] ["id"] = 197134,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-taperered-nose",]] ["id"] = 197136,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spined-nose",]] ["id"] = 197137,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-large-spotted-pattern",]] ["id"] = 197139,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-small-spotted-pattern",]] ["id"] = 197140,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-scaled-pattern",]] ["id"] = 197141,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-vertical-finned-tail",]] ["id"] = 197148,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-spiked-tail",]] ["id"] = 197151,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-bladed-tail",]] ["id"] = 197153,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_highland-drake-bronze-and-green-armor",]] ["id"] = 197156,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-highland-drake-spined-head",]] ["id"] = 198895,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-highland-drake-spined-neck",]] ["id"] = 198896,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-highland-drake-steel-and-yellow-armor",]] ["id"] = 201737,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_vakrils-strongbox",]] ["id"] = 201728,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_caravan-strongbox",]] ["id"] = 200094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonbane-keep-strongbox",]] ["id"] = 202142,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonbane-keep-strongbox",]] ["id"] = 200072,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-valdrakken-accord-supply-pack",]] ["id"] = 198868,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-dragon-expedition-supply-pack",]] ["id"] = 198863,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_grand-hunt-spoils",]] ["id"] = 200515,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_grand-hunt-spoils",]] ["id"] = 200513,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_grand-hunt-spoils",]] ["id"] = 200468,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-iskaaran-supply-pack",]] ["id"] = 198866,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_experimental-substance",]] ["id"] = 193891,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_reawakened-catalyst",]] ["id"] = 193897,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-yellow-horns",]] ["id"] = 197610,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_prismatic-focusing-shard",]] ["id"] = 193900,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_primal-dust",]] ["id"] = 193901,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tailoring-examples",]] ["id"] = 198609,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_enchanters-script",]] ["id"] = 198610,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ohnarhan-weave",]] ["id"] = 198977,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stupidly-effective-stitchery",]] ["id"] = 198978,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-treasures",]] ["id"] = 200073,["minCount"] = 1},
    
    -- Winter Veil
    {--[[ ["name"] = "SoulbindCacheOpener_stolen-gift",]] ["id"] = 149503,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_smokywood-pastures-special-present",]] ["id"] = 149504,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_smokywood-pastures-special-gift",]] ["id"] = 17726,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stolen-present",]] ["id"] = 116762,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_smokywood-pastures-extra-special-gift",]] ["id"] = 21216,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_smokywood-pastures-sampler",]] ["id"] = 17685,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stolen-present",]] ["id"] = 73792,["minCount"] = 1},
    -- Presents
    {--[[ ["name"] = "SoulbindCacheOpener_carefully-wrapped-present",]] ["id"] = 21191,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ticking-present",]] ["id"] = 21327,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_winter-veil-gift",]] ["id"] = 192094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_festive-gift",]] ["id"] = 21363,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gaily-wrapped-present",]] ["id"] = 21310,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gently-shaken-gift",]] ["id"] = 192093,["minCount"] = 1},
    --
    {--[[ ["name"] = "SoulbindCacheOpener_blacksmiths-writ",]] ["id"] = 198606,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_scribes-glyphs",]] ["id"] = 198607,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_alchemy-notes",]] ["id"] = 198608,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_engineering-details",]] ["id"] = 198611,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jewelers-cuts",]] ["id"] = 198612,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_leatherworking-designs",]] ["id"] = 198613,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_soggy-clump-of-darkmoon-cards",]] ["id"] = 198614,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-centaur-supply-satchel",]] ["id"] = 189765,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_large-maruuk-centaur-supply-satchel",]] ["id"] = 198864,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-maruuk-centaur-supply-satchel",]] ["id"] = 199474,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_primordial-aether",]] ["id"] = 198967,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_grand-hunt-spoils",]] ["id"] = 200516,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_primalist-charm",]] ["id"] = 198968,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_waterlogged-toolbox",]] ["id"] = 170502,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_blueprint-rustbolt-resistance-insignia",]] ["id"] = 168494,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_frigid-timewarped-prism",]] ["id"] = 129928,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_magically-bound-message",]] ["id"] = 198538,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-bronze-and-green-armor",]] ["id"] = 197577,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-white-and-pink-armor",]] ["id"] = 197582,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-exposed-finned-back",]] ["id"] = 197583,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-maned-back",]] ["id"] = 197585,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-small-ears",]] ["id"] = 197594,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-horned-jaw",]] ["id"] = 197596,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-helm",]] ["id"] = 197600,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-curved-horns",]] ["id"] = 197603,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-black-scales",]] ["id"] = 197611,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-heavy-scales",]] ["id"] = 197617,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-hooked-snout",]] ["id"] = 197619,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-exposed-finned-tail",]] ["id"] = 197621,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-finned-tail",]] ["id"] = 197622,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-spiked-tail",]] ["id"] = 197623,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-exposed-finned-neck",]] ["id"] = 197626,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-finned-neck",]] ["id"] = 197627,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-spiked-neck",]] ["id"] = 197629,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-shrieker-pattern",]] ["id"] = 197636,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-silver-and-blue-armor",]] ["id"] = 197578,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-steel-and-orange-armor",]] ["id"] = 197579,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-gold-and-red-armor",]] ["id"] = 197580,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-silver-and-purple-armor",]] ["id"] = 197581,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-finned-back",]] ["id"] = 197584,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-spiked-back",]] ["id"] = 197586,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-feathered-back",]] ["id"] = 197587,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-armor",]] ["id"] = 197588,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-large-head-fin",]] ["id"] = 197589,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-small-head-fin",]] ["id"] = 197590,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-hairy-head",]] ["id"] = 197591,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-spined-head",]] ["id"] = 197592,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-feathery-head",]] ["id"] = 197593,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-finned-ears",]] ["id"] = 197595,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-black-fur",]] ["id"] = 197597,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-gray-hair",]] ["id"] = 197598,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-red-hair",]] ["id"] = 197599,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-wavy-horns",]] ["id"] = 197601,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-cluster-horns",]] ["id"] = 197602,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-ox-horns",]] ["id"] = 197604,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-curled-horns",]] ["id"] = 197605,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-swept-horns",]] ["id"] = 197606,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-split-horns",]] ["id"] = 197607,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-gray-horns",]] ["id"] = 197608,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-white-horns",]] ["id"] = 197609,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-blue-scales",]] ["id"] = 197612,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-bronze-scales",]] ["id"] = 197613,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-red-scales",]] ["id"] = 197614,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-teal-scales",]] ["id"] = 197615,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-white-scales",]] ["id"] = 197616,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-long-snout",]] ["id"] = 197618,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-beaked-snout",]] ["id"] = 197620,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-club-tail",]] ["id"] = 197624,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-feathery-tail",]] ["id"] = 197625,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-plated-neck",]] ["id"] = 197628,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-feathered-neck",]] ["id"] = 197630,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-windswept-pattern",]] ["id"] = 197634,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_windborne-velocidrake-reaver-pattern",]] ["id"] = 197635,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-windborne-velocidrake-black-fur",]] ["id"] = 198902,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-windborne-velocidrake-spined-head",]] ["id"] = 198903,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-windborne-velocidrake-windswept-pattern",]] ["id"] = 198904,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-windborne-velocidrake-steel-and-yellow-armor",]] ["id"] = 201739,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_technique-windborne-velocidrake-silver-and-blue-armor",]] ["id"] = 201743,["minCount"] = 1},
    
    -- Added by Curseforge Comments 
    {--[[ ["name"] = "SoulbindCacheOpener_supply-laden-soup-pot",]] ["id"] = 200095,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_keepers-mark",]] ["id"] = 198969,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ohuna-companion-color-brown",]] ["id"] = 193205,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ohuna-companion-color-dark",]] ["id"] = 194088,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ohuna-companion-color-red",]] ["id"] = 194087,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ohuna-companion-color-sepia",]] ["id"] = 194095,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bakar-companion-color-black",]] ["id"] = 194094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bakar-companion-color-brown",]] ["id"] = 194093,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bakar-companion-color-golden-brown",]] ["id"] = 194091,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bakar-companion-color-orange",]] ["id"] = 194089,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bakar-companion-color-white",]] ["id"] = 194090,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-dragon-expedition-supply-pack",]] ["id"] = 199472,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-iskaaran-supply-pack",]] ["id"] = 199473,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-valdrakken-accord-supply-pack",]] ["id"] = 199475,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_umbral-bone-needle",]] ["id"] = 193898,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_primalweave-spindle",]] ["id"] = 193899,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_eroded-titan-gizmo",]] ["id"] = 193902,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_watcher-power-core",]] ["id"] = 193903,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_phoenix-feather-quill",]] ["id"] = 193904,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaaran-trading-ledger",]] ["id"] = 193905,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_chipped-tyrstone",]] ["id"] = 193907,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ancient-gem-fragments",]] ["id"] = 193909,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_molted-dragon-scales",]] ["id"] = 193910,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_exceedingly-soft-skin",]] ["id"] = 198976,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_preserved-animal-parts",]] ["id"] = 193913,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ossified-hide",]] ["id"] = 198975,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_infinitely-attachable-pair-o-docks",]] ["id"] = 198970,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_elegantly-engraved-embellishment",]] ["id"] = 198974,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_elementious-splinter",]] ["id"] = 198964,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_decaying-phlegm",]] ["id"] = 198963,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_glowing-primalist-cache",]] ["id"] = 202371,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tutaqans-commendation",]] ["id"] = 201783,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_merithras-blessing",]] ["id"] = 201779,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_thick-shelled-clam",]] ["id"] = 5524,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_darkwater-clam",]] ["id"] = 36781,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_big-mouth-clam",]] ["id"] = 7973,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_giant-darkwater-clam",]] ["id"] = 45909,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_abyssal-clam",]] ["id"] = 52340,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jaggal-clam",]] ["id"] = 24476,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_shadowflame-residue-sack",]] ["id"] = 205423,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_large-shadowflame-residue-sack",]] ["id"] = 205682,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_small-loammian-supply-pack",]] ["id"] = 205964,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_clinking-dirt-covered-pouch",]] ["id"] = 205247,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cavern-racers-purse",]] ["id"] = 205226,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heroic-dungeon-delvers-trophy-chest",]] ["id"] = 206135,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_clanging-dirt-covered-pouch",]] ["id"] = 205248,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_winding-slitherdrake-antler-horns",]] ["id"] = 203338,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_winding-slitherdrake-swept-horns",]] ["id"] = 203330,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakes-bountiful-chest",]] ["id"] = 204726,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakes-hefty-chest",]] ["id"] = 204725,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_drakes-small-chest",]] ["id"] = 204724,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_researchers-gift",]] ["id"] = 205370,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_exquisitely-embroidered-banner",]] ["id"] = 206030,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_scentsational-niffen-treasures",]] ["id"] = 205983,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_hidden-niffen-treasure",]] ["id"] = 205346,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gathered-niffen-resources",]] ["id"] = 205347,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_pungent-niffen-incense",]] ["id"] = 205249,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_honorary-explorers-compass",]] ["id"] = 205254,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_farmhands-abundant-harvest",]] ["id"] = 205253,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_champions-rock-bar",]] ["id"] = 205251,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_regurgitated-half-digested-fish",]] ["id"] = 205992,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_sign-of-respect",]] ["id"] = 205998,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_symbol-of-friendship",]] ["id"] = 205989,["minCount"] = 1},
    
    
    -- Patch 10.0.5, 10.0.7 and 10.1
    
    {--[[ ["name"] = "SoulbindCacheOpener_brimming-loamm-niffen-supply-satchel",]] ["id"] = 204712,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_whelplings-small-chest",]] ["id"] = 204721,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_whelplings-bountiful-chest",]] ["id"] = 204722,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_whelplings-hefty-chest",]] ["id"] = 204723,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_propagated-spore",]] ["id"] = 204911,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_buried-niffen-collection",]] ["id"] = 205288,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_indebted-researchers-gift",]] ["id"] = 205367,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_thankful-researchers-gift",]] ["id"] = 205368,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_appreciative-researchers-gift",]] ["id"] = 205369,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_appreciative-researchers-scrounged-goods",]] ["id"] = 205371,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_indebted-researchers-scrounged-goods",]] ["id"] = 205372,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_researchers-scrounged-goods",]] ["id"] = 205373,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_thankful-researchers-scrounged-goods",]] ["id"] = 205374,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_adventurers-footlocker",]] ["id"] = 205877,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_echoing-storm-flightstone",]] ["id"] = 205962,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_large-loammian-supply-pack",]] ["id"] = 205965,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-aberrus-treasures",]] ["id"] = 205966,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-aberrus-treasures",]] ["id"] = 205967,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_overflowing-loammian-supply-pack",]] ["id"] = 205968,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_azure-flightstone",]] ["id"] = 205970,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_chest-of-gold",]] ["id"] = 206028,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ruby-flightstone",]] ["id"] = 206037,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_enmity-bundle",]] ["id"] = 206039,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_heroic-dungeon-delvers-trophy-crest",]] ["id"] = 206136,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_malicias-hoard",]] ["id"] = 206271,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonscale-supply-box",]] ["id"] = 203210,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonscale-surplus-crate",]] ["id"] = 203217,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-supply-pouch",]] ["id"] = 203218,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-surplus-bag",]] ["id"] = 203220,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-supply-sack",]] ["id"] = 203221,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-surplus-bundle",]] ["id"] = 203222,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-supply-coffer",]] ["id"] = 203223,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-surplus-chest",]] ["id"] = 203224,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tattered-gift-package",]] ["id"] = 203699,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_tattered-gift-package",]] ["id"] = 203700,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_field-medics-hazard-payout",]] ["id"] = 203724,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_rustic-winterpelt-supplies",]] ["id"] = 203730,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_waterlogged-gurubashi-cache",]] ["id"] = 203742,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jostled-gurubashi-cache",]] ["id"] = 203743,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_big-bag-o-bijous",]] ["id"] = 203774,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_penny-pouch-o-paragons",]] ["id"] = 203912,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_gurubashi-tribute",]] ["id"] = 203959,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_ornate-bronze-lockbox",]] ["id"] = 204307,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_reach-racers-purse",]] ["id"] = 204359,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_brimming-dragonscale-expedition-supply-pack",]] ["id"] = 204378,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_brimming-iskaaran-supply-pack",]] ["id"] = 204379,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_brimming-maruuk-centaur-supply-satchel",]] ["id"] = 204380,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_brimming-valdrakken-accord-supply-pack",]] ["id"] = 204381,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_sack-of-oddities",]] ["id"] = 204383,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_sack-of-sack-of-oddities",]] ["id"] = 204403,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_snarfangs-stomach-sac",]] ["id"] = 204636,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_primalist-cache",]] ["id"] = 203476,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stormed-primalist-cache",]] ["id"] = 203681,["minCount"] = 1},
    
    -- Need to add an option to include these or not at users choice
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-centaur-insignia",]] ["id"] = 200454,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-centaur-insignia",]] ["id"] = 200288,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-centaur-insignia",]] ["id"] = 201923,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_maruuk-centaur-insignia",]] ["id"] = 202094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-tuskarr-insignia",]] ["id"] = 200453,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-tuskarr-insignia",]] ["id"] = 201922,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-tuskarr-insignia",]] ["id"] = 200287,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_iskaara-tuskarr-insignia",]] ["id"] = 202092,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-accord-insignia",]] ["id"] = 200455,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-accord-insignia",]] ["id"] = 200289,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_valdrakken-accord-insignia",]] ["id"] = 201924,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonscale-expedition-insignia",]] ["id"] = 200452,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonscale-expedition-insignia",]] ["id"] = 201921,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_dragonscale-expedition-insignia",]] ["id"] = 200285,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loamm-niffen-insignia",]] ["id"] = 205985,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loamm-niffen-insignia",]] ["id"] = 205342,["minCount"] = 1},
    
    --Patch 10.1.5
    
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-plate-gear-bag",]] ["id"] = 207050,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-plate-equipment-bag",]] ["id"] = 207051,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-plate-equipment-bag",]] ["id"] = 207052,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-plate-gear-bag",]] ["id"] = 207053,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-mail-equipment-bag",]] ["id"] = 207063,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-mail-gear-bag",]] ["id"] = 207064,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-mail-gear-bag",]] ["id"] = 207065,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-mail-equipment-bag",]] ["id"] = 207066,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-leather-gear-bag",]] ["id"] = 207067,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-leather-equipment-bag",]] ["id"] = 207068,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-leather-equipment-bag",]] ["id"] = 207069,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-leather-gear-bag",]] ["id"] = 207070,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-cloth-gear-bag",]] ["id"] = 207071,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-cloth-equipment-bag",]] ["id"] = 207072,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-cloth-equipment-bag",]] ["id"] = 207073,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-cloth-gear-bag",]] ["id"] = 207074,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-plate-armor-bag",]] ["id"] = 207075,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-plate-armor-bag",]] ["id"] = 207076,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-mail-armor-bag",]] ["id"] = 207077,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-mail-armor-bag",]] ["id"] = 207078,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-leather-armor-bag",]] ["id"] = 207079,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-leather-armor-bag",]] ["id"] = 207080,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-cloth-armor-bag",]] ["id"] = 207081,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-cloth-armor-bag",]] ["id"] = 207082,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_jingoists-mail-suit-bag",]] ["id"] = 207093,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_warmongers-leather-suit-bag",]] ["id"] = 207094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_paracausal-chest",]] ["id"] = 207096,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_box-of-tampered-reality",]] ["id"] = 207582,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_box-of-collapsed-reality",]] ["id"] = 207583,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_box-of-volatile-reality",]] ["id"] = 207584,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_looters-purse",]] ["id"] = 207594,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_greater-paracausal-chest",]] ["id"] = 208006,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_stuffed-deviate-scale-pouch",]] ["id"] = 208015,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_knot-thimblejacks-cache",]] ["id"] = 208028,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_contained-paracausality",]] ["id"] = 208090,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-timewarped-treasures",]] ["id"] = 208091,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-timewarped-treasures",]] ["id"] = 208094,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_cache-of-timewarped-treasures",]] ["id"] = 208095,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_anniversary-gift",]] ["id"] = 208211,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_bronze-archive-stone",]] ["id"] = 208390,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-filled-pumpkin",]] ["id"] = 209020,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-filled-pumpkin",]] ["id"] = 209024,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-filled-pumpkin",]] ["id"] = 209025,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_loot-stuffed-pumpkin",]] ["id"] = 209026,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_wyrms-bountiful-chest",]] ["id"] = 209831,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crate-of-dreambound-leather",]] ["id"] = 209832,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crate-of-dreambound-armor",]] ["id"] = 209833,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crate-of-dreambound-mail",]] ["id"] = 209834,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_crate-of-dreambound-plate",]] ["id"] = 209835,["minCount"] = 1},
    {--[[ ["name"] = "SoulbindCacheOpener_hidden-stash",]] ["id"] = 61387,["minCount"] = 1}
     
};


SoulbindCacheOpener.groups = {
 ["rousing"] = { 190315, 190320, 190322, 190326, 190328, 190330, 190451 } ,
 ["insignia"] = { 200454,200288, 201923, 202094, 200453, 201922, 200287, 202092, 200455, 200289, 201924, 200452, 201921, 200285, 205985, 205342 },
}

SoulbindCacheOpener.group_ids_ordered = { "rousing", "insignia" }

-- UI strings, translation ready
SCOCL["rousing"] = "Rousing Elements";
SCOCL["insignia"] = "Dragonflight Reputation Insignias";


local debug = false;
local maxButtons = 20;


function SoulbindCacheOpener:updateButtons()
	if debug == true then print("Testing", "4 - updateButtons Called") end
	self.previous = 0;
	for i = 1, maxButtons do
		if debug == true then print("Testing", "4 - Hiding button " .. i) end
		SoulbindCacheOpener.buttons[i]:Hide();
		SoulbindCacheOpener.buttons[i]:SetText("");
	end
	for i = 1, #self.items do
		if debug == true then print("Testing", "5 - self.items loop") end
		self:updateButton(self.items[i], SoulbindCacheOpener.buttons[self.previous + 1]);
	end
end

function SoulbindCacheOpener:updateButton(currItem, btn)
	local id = currItem.id;
	local count = GetItemCount(id);
	local btn_number = self.previous + 1;

	if (count >= currItem.minCount and not SoulbindCacheOpenerDB.ignored_items[id] and not SoulbindCacheOpener.group_ignored_items[id] and self.previous < maxButtons) then
		btn:ClearAllPoints();
		if SoulbindCacheOpenerDB.alignment == "LEFT" then
			if self.previous == 0 then
				btn:SetPoint("LEFT", self.frame, "LEFT", 0, 0);
			else
				btn:SetPoint("LEFT", self.buttons[self.previous], "RIGHT", 2, 0);
			end
		else
			if self.previous == 0 then
				btn:SetPoint("RIGHT", self.frame, "RIGHT", 0, 0);
			else
				btn:SetPoint("RIGHT", self.buttons[self.previous], "LEFT", -2, 0);
			end
		end
		self.previous = btn_number;
		btn.countString:SetText(format("%d",count));
		-- update button icon and macro
		btn.texture:SetDesaturated(false);
		btn:SetAttribute("macrotext", format("/use item:%d",id));
		btn.icon:SetTexture(GetItemIcon(id));
		btn.texture = btn.icon;
		btn.texture:SetAllPoints(btn);
		btn.id = id;
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "ButtonShow") end end
		btn:Show();
	end
end

function SoulbindCacheOpener:createButton(btn,id)
	if debug == true then print("Testing", "7 - createButton Called") end
	btn:Hide();
	btn.id = id;
	btn:SetWidth(38);
	btn:SetHeight(38);
	btn:SetClampedToScreen(true);
	--Right click to drag
	btn:EnableMouse(true);
	btn:RegisterForDrag("RightButton");
	btn:SetMovable(true);
	btn:SetScript("OnDragStart", function(self) self:GetParent():StartMoving(); end);
	btn:SetScript("OnDragStop", function(self) 
			self:GetParent():StopMovingOrSizing();
			self:GetParent():SetUserPlaced(false);
			local point, relativeTo, relativePoint, xOfs, yOfs = self:GetParent():GetPoint();
			SoulbindCacheOpenerDB.position = {point, nil, relativePoint, xOfs, yOfs};
			end);
	--Setup macro
	btn:SetAttribute("type", "macro");
	btn:SetAttribute("macrotext", format("/use item:%d",id));
	btn.countString = btn:CreateFontString(btn:GetName().."Count", "OVERLAY", "NumberFontNormal");
	btn.countString:SetPoint("BOTTOMRIGHT", btn, -0, 2);
	btn.countString:SetJustifyH("RIGHT");
	btn.icon = btn:CreateTexture(nil,"BACKGROUND");
	btn.icon:SetTexture(GetItemIcon(id));
	btn.texture = btn.icon;
	btn.texture:SetAllPoints(btn);
	btn:RegisterForClicks("LeftButtonUp", "LeftButtonDown");
	
	--Tooltip
	btn:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:SetItemByID(format("%d",btn.id));
		GameTooltip:SetClampedToScreen(true);
		GameTooltip:Show();
	  end);
	btn:SetScript("OnLeave",GameTooltip_Hide);
 end

function SoulbindCacheOpener:reset()
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "8 - Reset Called") end end
	SoulbindCacheOpenerDB = { ["enable"] = true,["alignment"] = "LEFT", ["ignored_items"] = {}, ["ignored_groups"] = {} };
	self.frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	self:OnEvent("UPDATE");
end

function SoulbindCacheOpener:resetPosition() 
	self.frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	self:OnEvent("UPDATE");
end

function resetAll() 
	SoulbindCacheOpenerDB = {["enable"] = true,["alignment"] = "LEFT", ["ignored_items"] = {}, ["ignored_groups"] = {} };
	self:OnEvent("UPDATE");
end

function SoulbindCacheOpener:AddButton()
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "2 - Add Button Called") end end
	self.frame:Show();
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "3 - Frame Shown") end end
	SoulbindCacheOpener:updateButtons();
end

function SoulbindCacheOpener:updateIgnoreItems() 
	SoulbindCacheOpener.group_ignored_items = {};
	for gn, bl in pairs(SoulbindCacheOpenerDB.ignored_groups) do
		if bl then
			SoulbindCacheOpener:updateIgnoreItemsForOneGroup(gn);
		end
	end
end

function SoulbindCacheOpener:updateIgnoreItemsForOneGroup(group_name) 
	local groupIds = SoulbindCacheOpener.groups[group_name];
	if (groupIds ~= nil) then 
		for i, id in ipairs(groupIds) do
			SoulbindCacheOpener.group_ignored_items[id] = true;
		end
	end
end

function SoulbindCacheOpener:OnEvent(event, ...)
	if event == "ADDON_LOADED" then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "0 - Addon Loaded") end end
		self.frame:UnregisterEvent("ADDON_LOADED");
		SoulbindCacheOpenerDB = SoulbindCacheOpenerDB or {};
		--If DB is empty
		if next (SoulbindCacheOpenerDB) == nil then
			SoulbindCacheOpener:reset();
		end
		if SoulbindCacheOpenerDB.ignored_items == nil then
			SoulbindCacheOpenerDB.ignored_items = {};
		end
		SoulbindCacheOpener.updateIgnoreItems();
		SoulbindCacheOpener.initializeOptions();
	end

	if event == "PLAYER_LOGIN" then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "9 - Player Login Event") end end
		self.frame:UnregisterEvent("PLAYER_LOGIN");
	end 
	--Check for combat
	if UnitAffectingCombat("player") then
		if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "10 - Player is in Combat") end end
		return
	end
	if debug == true then if DLAPI then DLAPI.DebugLog("Testing", "1 - Event Called") end end
	SoulbindCacheOpener:AddButton();
end

------------------------------------------------
-- Slash Commands
------------------------------------------------
local function slashHandler(msg)
	msg = msg:lower() or "";
	local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
	if (cmd == "hide") then
		SoulbindCacheOpenerDB.ignored_items[tonumber(args)] = true;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		print ("|cffffa500Soulbind Cache Opener|r: ignoring itemid", args);


	elseif (cmd == "show") then
		SoulbindCacheOpenerDB.ignored_items[tonumber(args)] = false;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		print ("|cffffa500Soulbind Cache Opener|r: showing itemid", args);

	elseif (cmd == "hidegroup") then
		-- TODO: refactor that out, since it is also used in SoulbindCacheOpener:initializeOptions() 
		SoulbindCacheOpenerDB.ignored_groups[args] = true;
		SoulbindCacheOpener:updateIgnoreItems() ;
		SoulbindCacheOpener:updateButtons();
		SoulbindCacheOpener:updateOptionCheckbox(args, true);
		print ("|cffffa500Soulbind Cache Opener|r: hiding group", args);

	elseif (cmd == "showgroup") then
		-- TODO: refactor that out, since it is also used in SoulbindCacheOpener:initializeOptions() 
		SoulbindCacheOpenerDB.ignored_groups[args] = false;
		SoulbindCacheOpener:updateIgnoreItems();
		SoulbindCacheOpener:updateButtons();
		SoulbindCacheOpener:updateOptionCheckbox(args, false);
		print ("|cffffa500Soulbind Cache Opener|r: showing group", args);

	elseif (msg == "reset") then
		print("|cffffa500Soulbind Cache Opener|r: Resetting settings.");
		SoulbindCacheOpener:reset();
	else
		local groups_id_list_string = ""
		for i, name in ipairs(SoulbindCacheOpener.group_ids_ordered) do
			groups_id_list_string = groups_id_list_string .. " " .. name;
		end
		print("|cffffa500Soulbind Cache Opener|r: Commands for |cffffa500/SoulbindCacheOpener|r :");
		print("  |cffffa500 hide <itemid>|r - Ignore an item");
		print("  |cffffa500 show <itemid>|r - Show an item");
		print("  |cffffa500 hidegroup <group>|r - Ignore multiple items");
		print("  |cffffa500 showgroup <group>|r - Show multiple items");
		print("  |cffffa500      available item groups|r: " .. groups_id_list_string);
		print("  |cffffa500 reset|r - Reset all settings");
	end
end

SlashCmdList.SoulbindCacheOpener = function(msg) slashHandler(msg) end;
SLASH_SoulbindCacheOpener1 = "/SoulbindCacheOpener";
SLASH_SoulbindCacheOpener2 = "/SCO";

--Helper functions
local function cout(msg, premsg)
	premsg = premsg or "[".."Soulbind Cache Opener".."]"
	print("|cFFE8A317"..premsg.."|r "..msg);
end

local function coutBool(msg,bool)
	if bool then
		print(msg..": true");
	else
		print(msg..": false");
	end
end

--Main Frame
SoulbindCacheOpener.frame = CreateFrame("Frame", "SoulbindCacheOpener_Frame", UIParent);
SoulbindCacheOpener.frame:Hide();
SoulbindCacheOpener.frame:SetWidth(120);
SoulbindCacheOpener.frame:SetHeight(38);
SoulbindCacheOpener.frame:SetClampedToScreen(true);
SoulbindCacheOpener.frame:SetFrameStrata("BACKGROUND");
SoulbindCacheOpener.frame:SetMovable(true);
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_ENTERING_WORLD");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_REGEN_ENABLED");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_LOGIN");
SoulbindCacheOpener.frame:RegisterEvent("ADDON_LOADED")
SoulbindCacheOpener.frame:RegisterEvent("BAG_UPDATE");

 ---Create button row
 for i = 1, maxButtons do
	SoulbindCacheOpener.buttons[i] = CreateFrame("Button", "scocbutton" .. i, SoulbindCacheOpener.frame, "SecureActionButtonTemplate");
	SoulbindCacheOpener:createButton(SoulbindCacheOpener.buttons[i], 86220);
end


SoulbindCacheOpener.frame:SetScript("OnEvent", function(self,event,...) SoulbindCacheOpener:OnEvent(event,...) end);
SoulbindCacheOpener.frame:SetScript("OnShow", function(self,event,...) 
	--Restore position
	self:ClearAllPoints();
	if SoulbindCacheOpenerDB and SoulbindCacheOpenerDB.position then
		self:SetPoint(SoulbindCacheOpenerDB.position[1],UIParent,SoulbindCacheOpenerDB.position[3],SoulbindCacheOpenerDB.position[4],SoulbindCacheOpenerDB.position[5]);
	else
		self:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	end		
	
 end);

SoulbindCacheOpener.option_buttons = {};

function SoulbindCacheOpener:initializeOptions() 
    local panel = CreateFrame("Frame");
    panel.name = SCOCL["addon_name"];
    local category = Settings.RegisterCanvasLayoutCategory(panel, SCOCL["addon_name"]);
    Settings.RegisterAddOnCategory(category);

    local title = panel:CreateFontString("ARTWORK", nil, "GameFontNormalHuge");
    title:SetPoint("TOP");
    title:SetText(SCOCL["addon_name"]);
    title:SetTextColor(0.118,0.741,0.447);

    local headhidden = panel:CreateFontString("ARTWORK", nil, "GameFontNormalLarge");
    headhidden:SetText(SCOCL["hidden_groups"]);
    headhidden:SetPoint("TOPLEFT", 20, -50 );

    for i, name in ipairs(SoulbindCacheOpener.group_ids_ordered) do
        local cb = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate");
        cb:SetPoint("TOPLEFT", 20, -50 + (-20*i));
        cb.Text:SetText("   " .. SCOCL[name]);
        cb.group_id = name;
        local isChecked = false;
        if( SoulbindCacheOpenerDB.ignored_groups[name] ~= nil) then
            isChecked = SoulbindCacheOpenerDB.ignored_groups[name];
        end
        cb:SetChecked(isChecked);
        cb:HookScript("OnClick", function(_, btn, down)
        -- TODO: refactor that out, since it is also used in SoulbindCacheOpener:slashHandler() 
            SoulbindCacheOpenerDB.ignored_groups[name] = cb:GetChecked();
            SoulbindCacheOpener:updateIgnoreItems();
            SoulbindCacheOpener:updateButtons();
        end)
        SoulbindCacheOpener.option_buttons[name] = cb; 
    end

    local text = panel:CreateFontString("ARTWORK", nil, "GameFontWhiteSmall");
    text:SetText(SCOCL["option_description"]);
    text:SetPoint("BOTTOMLEFT", 20, 20);
end

function SoulbindCacheOpener:updateOptionCheckbox(group_id, state) 
    if (SoulbindCacheOpener.option_buttons[group_id] ~= nil) then
        SoulbindCacheOpener.option_buttons[group_id]:SetChecked(state);
    end
end 

-- UI strings, translation ready
SCOCL["hidden_groups"] = "Hide items"
SCOCL["addon_name"] = "Soulbind Cache Opener - Continued"
SCOCL["option_description"] = "Further settings can be done with the chat command /sco . For resetting the addon type /sco reset in the chat window."
