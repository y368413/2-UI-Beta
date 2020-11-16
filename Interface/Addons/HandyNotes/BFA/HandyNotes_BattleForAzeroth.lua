-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local _, ns = ...
local L = ns.locale

local Class = ns.Class
local Group = ns.Group
local Map = ns.Map

local Node = ns.node.Node
local Quest = ns.node.Quest
local Achievement = ns.reward.Achievement

-------------------------------------------------------------------------------

ns.expansion = 8

-------------------------------------------------------------------------------

ns.groups.ASSAULT_EVENT = Group('assault_events', 'peg_wy')
ns.groups.BOW_TO_YOUR_MASTERS = Group('bow_to_your_masters', 1850548, {defaults=ns.GROUP_HIDDEN, faction='Horde'})
ns.groups.BRUTOSAURS = Group('brutosaurs', 1881827, {defaults=ns.GROUP_HIDDEN})
ns.groups.CARVED_IN_STONE = Group('carved_in_stone', 134424, {defaults=ns.GROUP_HIDDEN})
ns.groups.CATS_NAZJ = Group('cats_nazj', 454045)
ns.groups.COFFERS = Group('coffers', 'star_chest_g')
ns.groups.DAILY_CHESTS = Group('daily_chests', 'chest_bl', {defaults=ns.GROUP_ALPHA75})
ns.groups.DRUST_FACTS = Group('drust_facts', 2101971, {defaults=ns.GROUP_HIDDEN})
ns.groups.DUNE_RIDER = Group('dune_rider', 134962, {defaults=ns.GROUP_HIDDEN})
ns.groups.EMBER_RELICS = Group('ember_relics', 514016, {defaults=ns.GROUP_HIDDEN, faction='Alliance'})
ns.groups.GET_HEKD = Group('get_hekd', 1604165, {defaults=ns.GROUP_HIDDEN})
ns.groups.HONEYBACKS = Group('honeybacks', 2066005, {defaults=ns.GROUP_HIDDEN, faction='Alliance'})
ns.groups.HOPPIN_SAD = Group('hoppin_sad', 804969, {defaults=ns.GROUP_HIDDEN})
ns.groups.LIFE_FINDS_A_WAY = Group('life_finds_a_way', 236192, {defaults=ns.GROUP_HIDDEN})
ns.groups.LOCKED_CHEST = Group('locked_chest', 'chest_gy', {defaults=ns.GROUP_ALPHA75})
ns.groups.MECH_CHEST = Group('mech_chest', 'chest_rd', {defaults=ns.GROUP_ALPHA75})
ns.groups.MISC_NAZJ = Group('misc_nazj', 528288)
ns.groups.MUSHROOM_HARVEST = Group('mushroom_harvest', 1869654, {defaults=ns.GROUP_HIDDEN})
ns.groups.PAKU_TOTEMS = Group('paku_totems', 'flight_point', {defaults=ns.GROUP_HIDDEN, faction='Horde'})
ns.groups.RECRIG = Group('recrig', 'peg_wb')
ns.groups.SAUSAGE_SAMPLER = Group('sausage_sampler', 133200, {defaults=ns.GROUP_HIDDEN, faction='Alliance'})
ns.groups.SCAVENGER_OF_THE_SANDS = Group('scavenger_of_the_sands', 135725, {defaults=ns.GROUP_HIDDEN})
ns.groups.SECRET_SUPPLY = Group('secret_supplies', 'star_chest_b', {defaults=ns.GROUP_HIDDEN75})
ns.groups.SHANTY_RAID = Group('shanty_raid', 1500866, {defaults=ns.GROUP_HIDDEN})
ns.groups.SLIMES_NAZJ = Group('slimes_nazj', 132107)
ns.groups.SQUIRRELS = Group('squirrels', 237182, {defaults=ns.GROUP_HIDDEN})
ns.groups.SUPPLY = Group('supplies', 'star_chest_g', {defaults=ns.GROUP_HIDDEN75})
ns.groups.TALES_OF_DE_LOA = Group('tales_of_de_loa', 1875083, {defaults=ns.GROUP_HIDDEN})
ns.groups.THREE_SHEETS = Group('three_sheets', 135999, {defaults=ns.GROUP_HIDDEN})
ns.groups.TIDESAGE_LEGENDS = Group('tidesage_legends', 1500881, {defaults=ns.GROUP_HIDDEN})
ns.groups.UPRIGHT_CITIZENS = Group('upright_citizens', 516667, {defaults=ns.GROUP_HIDDEN, faction='Alliance'})
ns.groups.VISIONS_BUFFS = Group('visions_buffs', 132183)
ns.groups.VISIONS_CHEST = Group('visions_chest', 'chest_gy')
ns.groups.VISIONS_CRYSTALS = Group('visions_crystals', 'crystal_o')
ns.groups.VISIONS_MAIL = Group('visions_mail', 'envelope')
ns.groups.VISIONS_MISC = Group('visions_misc', 2823166)

-------------------------------------------------------------------------------
---------------------------------- CALLBACKS ----------------------------------
-------------------------------------------------------------------------------

-- Listen for aura applied/removed events so we can refresh when the player
-- enters and exits the alternate future
ns.addon:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED', function ()
    local _,e,_,_,_,_,_,_,t,_,_,s  = CombatLogGetCurrentEventInfo()
    if (e == 'SPELL_AURA_APPLIED' or e == 'SPELL_AURA_REMOVED') and
        t == UnitName('player') and s == 296644 then
        C_Timer.After(1, function() ns.addon:Refresh() end)
    end
end)

ns.addon:RegisterEvent('QUEST_ACCEPTED', function (_, _, id)
    if id == 56540 then
        ns.Debug('Vale assaults unlock detected')
        C_Timer.After(1, function() ns.addon:Refresh() end)
    end
end)

ns.addon:RegisterEvent('QUEST_WATCH_UPDATE', function (_, index)
    local info = C_QuestLog.GetInfo(index)
    if info and info.questID == 56376 then
        ns.Debug('Uldum assaults unlock detected')
        C_Timer.After(1, function() ns.addon:Refresh() end)
    end
end)

ns.addon:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED', function (...)
    -- Watch for a spellcast event that signals a ravenous slime was fed
    -- https://www.wowhead.com/spell=293775/schleimphage-feeding-tracker
    local _, source, _, spellID = ...
    if source == 'player' and spellID == 293775 then
        C_Timer.After(1, function() ns.addon:Refresh() end)
    end
end)

-------------------------------------------------------------------------------
-------------------------------- TIMED EVENTS ---------------------------------
-------------------------------------------------------------------------------

local TimedEvent = Class('TimedEvent', Quest, {
    icon = "peg_wy",
    scale = 2,
    group = ns.groups.ASSAULT_EVENT,
    note = ''
})

function TimedEvent:PrerequisiteCompleted()
    -- Timed events that are not active today return nil here
    return C_TaskQuest.GetQuestTimeLeftMinutes(self.quest[1])
end

ns.node.TimedEvent = TimedEvent

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CRATES ------------------------------
-------------------------------------------------------------------------------

-- quest = 53640 (50 conquest looted for today)

ns.node.Supply = Class('Supply', Node, {
    icon = 'star_chest_g',
    scale = 1.5,
    label = L["supply_chest"],
    rlabel = ns.GetIconLink('war_mode_swords', 16),
    note=L["supply_chest_note"],
    requires = ns.requirement.WarMode,
    rewards={ Achievement({id=12572}) },
    group = ns.groups.SUPPLY
})

ns.node.SecretSupply = Class('SecretSupply', ns.node.Supply, {
    icon = 'star_chest_b',
    group = ns.groups.SECRET_SUPPLY,
    label = L["secret_supply_chest"],
    note = L["secret_supply_chest_note"]
})

ns.node.Coffer = Class('Coffer', Node, {
    icon = 'star_chest_g',
    scale = 1.5,
    group = ns.groups.COFFERS
})

-------------------------------------------------------------------------------
----------------------------- VISIONS ASSAULT MAP -----------------------------
-------------------------------------------------------------------------------

local VisionsMap = Class('VisionsMap', Map)

function VisionsMap:Prepare()
    Map.Prepare(self)
    self.assault = self.GetAssault()
    self.phased = self.assault ~= nil
end

function VisionsMap:IsNodeEnabled(node, coord, minimap)
    local assault = node.assault
    if assault then
        assault = type(assault) == 'number' and {assault} or assault
        for i=1, #assault + 1, 1 do
            if i > #assault then return false end
            if assault[i] == self.assault then break end
        end
    end

    return Map.IsNodeEnabled(self, node, coord, minimap)
end

ns.VisionsMap = VisionsMap

-------------------------------------------------------------------------------
-------------------------------- WARFRONT MAP ---------------------------------
-------------------------------------------------------------------------------

local WarfrontMap = Class('WarfrontMap', Map)

function WarfrontMap:IsNodeEnabled(node, coord, minimap)
    -- Disable nodes that are not available when the other faction controls
    if node.controllingFaction then
        local state = C_ContributionCollector.GetState(self.collector)
        local faction = (state == 1 or state == 2) and 'Alliance' or 'Horde'
        if faction ~= node.controllingFaction then return false end
    end
    return Map.IsNodeEnabled(self, node, coord, minimap)
end

ns.WarfrontMap = WarfrontMap

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Map = ns.WarfrontMap

local Rare = ns.Class('WFRare', ns.node.Rare, { questAny=true })

local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Toy = ns.reward.Toy

local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=14, collector=11, settings=true, phased=false })

function map:Prepare ()
    Map.Prepare(self)

    -- Zidormi activates this quest to show the old Arathi Highlands
    self.phased = not C_QuestLog.IsQuestFlaggedCompleted(52781)
end

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[65347116] = Rare({
    id=142709,
    quest={53083, 53504},
    rewards={
        Mount({item=163644, id=1180})
    }
}) -- Beastrider Kama

map.nodes[21752217] = Rare({
    id=142508,
    quest={53013, 53505},
    rewards={
        Pet({item=163650, id=2433})
    }
}) -- Branchlord Aldrus

map.nodes[50673675] = Rare({
    id=142688,
    quest={53084, 53507},
    controllingFaction='Alliance',
    rewards={
        Pet({item=163652, id=2434})
    }
}) -- Darbel Montrose

map.nodes[50756121] = Rare({
    id=142688,
    quest={53084, 53507},
    controllingFaction='Horde',
    rewards={
        Pet({item=163652, id=2434})
    },
}) -- Darbel Montrose

map.nodes[22305106] = Rare({
    id=142686,
    quest={53086, 53509},
    note=L["boulderfist_outpost"],
    rewards={
        Toy({item=163735})
    },
    pois={
        POI({28594559}) -- Cave entrance
    }
}) -- Foulbelly

map.nodes[59812809] = Rare({
    id=142433,
    quest={53019, 53510},
    rewards={
        Pet({item=163711, id=2440})
    }
}) -- Fozruk

map.nodes[79532945] = Rare({
    id=142662,
    quest={53060, 53511},
    note=L["in_cave"],
    rewards={
        Toy({item=163713})
    },
    pois={
        POI({78153687}) -- Cave entrance
    }
}) -- Geomancer Flintdagger

map.nodes[26723278] = Rare({
    id=142725,
    quest={53087, 53512},
    controllingFaction='Alliance',
    rewards={
        Toy({item=163736})
    }
}) -- Horrific Apparition

map.nodes[19406120] = Rare({
    id=142725,
    quest={53087, 53512},
    controllingFaction='Horde',
    rewards={
        Toy({item=163736})
    }
}) -- Horrific Apparition

map.nodes[49318426] = Rare({
    id=142112,
    quest={53058, 53513},
    note=L["in_cave"],
    rewards={
        Toy({item=163744})
    },
    pois={
        POI({48117953}) -- Cave entrance
    }
}) -- Kor'gresh Coldrage

map.nodes[25294856] = Rare({
    id=142684,
    quest={53089, 53514},
    note=L["boulderfist_outpost"],
    rewards={
        Toy({item=163750})
    },
    pois={
        POI({28594560}) -- Cave entrance
    }
}) -- Kovork

map.nodes[52197487] = Rare({
    id=142716,
    quest={53090, 53515},
    rewards={
        Pet({item=163689, id=2441})
    },
    pois={
        Path({52297686, 51807585, 52197487, 51957382, 52187259})
    }
}) -- Man-Hunter Rog

map.nodes[47657800] = Rare({
    id=141942,
    quest={53057, 53516},
    rewards={
        Toy({item=163775})
    }
}) -- Molok the Crusher

map.nodes[67486058] = Rare({
    id=142692,
    quest={53091, 53517},
    rewards={
        Mount({item=163706, id=1185})
    }
}) -- Nimar the Slayer

map.nodes[32923847] = Rare({
    id=142423,
    quest={53014, 53518},
    controllingFaction='Alliance',
    rewards={
        Mount({item=163646, id=1182})
    },
    pois={
        POI({33693676}) -- Cave entrance
    }
}) -- Overseer Krix

map.nodes[27255710] = Rare({
    id=142423,
    quest={53014, 53518},
    controllingFaction='Horde',
    rewards={
        Mount({item=163646, id=1182})
    },
    pois={
        POI({27485560}) -- Cave entrance
    }
}) -- Overseer Krix

map.nodes[35606435] = Rare({
    id=142435,
    quest={53020, 53519},
    rewards={
        Pet({item=163690, id=2438})
    }
}) -- Plaguefeather

map.nodes[18412794] = Rare({
    id=142436,
    quest={53016, 53522},
    controllingFaction='Alliance',
    rewards={
        Pet({item=163689, id=2437})
    },
}) -- Ragebeak

map.nodes[11905220] = Rare({
    id=142436,
    quest={53016, 53522},
    controllingFaction='Horde',
    rewards={
        Pet({item=163689, id=2437})
    }
}) -- Ragebeak

map.nodes[42905660] = Rare({
    id=142683,
    quest={53092, 53524},
    rewards={
        Toy({item=163741})
    }
}) -- Ruul Onestone

map.nodes[51213999] = Rare({
    id=142690,
    quest={53093, 53525},
    controllingFaction='Alliance',
    rewards={
        Toy({item=163738})
    },
}) -- Singer

map.nodes[50705748] = Rare({
    id=142690,
    quest={53093, 53525},
    controllingFaction='Horde',
    rewards={
        Toy({item=163738})
    },
}) -- Singer

map.nodes[57154575] = Rare({
    id=142437,
    quest={53022, 53526},
    rewards={
        Mount({item=163645, id=1183})
    }
}) -- Skullripper

map.nodes[56945330] = Rare({
    id=142438,
    quest={53024, 53528},
    rewards={
        Pet({item=163648, id=2432})
    }
}) -- Venomarus

map.nodes[13273534] = Rare({
    id=142440,
    quest={53015, 53529},
    rewards={
        Pet({item=163684, id=2436})
    }
}) -- Yogursa

map.nodes[62858120] = Rare({
    id=142682,
    quest={53094, 53530},
    note=L["in_cave"],
    rewards={
        Toy({item=163745})
    },
    pois={
        POI({63257752}) -- Cave entrance
    }
}) -- Zalas Witherbark

------------------------------ ALLIANCE / HORDE -------------------------------

map.nodes[48913996] = Rare({
    id=142739,
    quest=53088,
    faction='Horde',
    controllingFaction='Horde',
    rewards={
        Mount({item=163578, id=1173})
    }
}) -- Knight-Captain Aldrin

map.nodes[39093921] = Rare({
    id=137374,
    quest=53001,
    faction='Horde',
    controllingFaction='Horde',
    rewards={
        Toy({item=163829})
    }
}) -- The Lion's Roar

map.nodes[37093921] = Rare({
    id=138122,
    quest=53002,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Toy({item=163828})
    }
}) -- Doom's Howl

map.nodes[53565764] = Rare({
    id=142741,
    quest=53085,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Mount({item=163579, id=1174})
    }
}) -- Doomrider Helgrim

------------------------------- ECHO OF MYZRAEL -------------------------------

map.nodes[30604475] = Rare({
    id=141615,
    quest={53017, 53506},
    note=L["burning_goliath_note"],
    pois={
        POI({57473438}) -- Burning Guardian
    }
}) -- Burning Goliath

map.nodes[62513084] = Rare({
    id=141618,
    quest={53018, 53531},
    note=L["cresting_goliath_note"],
    pois={
        POI({57323531}) -- Cresting Guardian
    }
}) -- Cresting Goliath

map.nodes[29405834] = Rare({
    id=141620,
    quest={53021, 53523},
    note=L["rumbling_goliath_note"],
    pois={
        POI({56803412}) -- Rumbling Guardian
    }
}) -- Rumbling Goliath

map.nodes[46245222] = Rare({
    id=141616,
    quest={53023, 53527},
    note=L["thundering_goliath_note"],
    pois={
        POI({56703519}) -- Thundering Guardian
    }
}) -- Thundering Goliath

map.nodes[57073472] = Rare({
    id=141668,
    quest={53059, 53508},
    note=L["echo_of_myzrael_note"],
    rewards={
        Pet({item=163677, id=2435})
    }
}) -- Echo of Myzrael

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Map = ns.WarfrontMap

local Collectible = ns.node.Collectible
local Rare = ns.Class('WFRare', ns.node.Rare, { questAny=true })

local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Toy = ns.reward.Toy

local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=62, collector=118, settings=true, phased=false })

function map:Prepare ()
    Map.Prepare(self)

    -- Zidormi activates this quest to show the old Darkshore
    self.phased = not C_QuestLog.IsQuestFlaggedCompleted(54411)
end

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[56533078] = Rare({
    id=148787,
    quest={54695, 54696},
    rewards={
        Mount({item=166432, id=1200})
    }
}) -- Alash'anir

map.nodes[37688489] = Rare({
    id=147966,
    quest={54405, 54406}
}) -- Aman

map.nodes[57381568] = Rare({
    id=147744,
    quest={54285, 54286}
}) -- Amberclaw

map.nodes[58472424] = Rare({
    id=147708,
    quest={54278, 54279},
    rewards={
        Toy({item=166784})
    }
}) -- Athrikus Narassin

map.nodes[38037584] = Rare({
    id=148025,
    quest={54426, 54427},
    rewards={
        Toy({item=166787})
    }
}) -- Commander Ral'esh

map.nodes[39326213] = Rare({
    id=147260,
    quest={54232, 54233},
    rewards={
        Pet({item=166451, id=2546})
    }
}) -- Conflagros

map.nodes[43765348] = Rare({
    id=147241,
    quest={54229, 54230},
    rewards={
        Pet({item=166448, id=2545})
    }
}) -- Cyclarus

map.nodes[43531963] = Rare({
    id=149654,
    quest={54884, 54885}
}) -- Glimmerspine

map.nodes[48255561] = Rare({
    id=147261,
    quest={54234, 54235}
}) -- Granokk

map.nodes[40925645] = Rare({
    id=148031,
    quest={54428, 54429},
    rewards={
        Toy({item=166785})
    }
}) -- Gren Tornfur

map.nodes[52423217] = Rare({
    id=147240,
    quest={54227, 54228},
    rewards={
        Pet({item=166452, id=2547})
    }
}) -- Hydrath

map.nodes[43974849] = Rare({
    id=149657,
    quest={54887, 54888}
}) -- Madfeather

map.nodes[35898173] = Rare({
    id=147970,
    quest={54408, 54409}
}) -- Mrggr'marr

map.nodes[47274411] = Rare({
    id=149665,
    quest={54893, 54894}
}) -- Scalefiend

map.nodes[43502943] = Rare({
    id=147751,
    quest={54289, 54290}
}) -- Shattershard

map.nodes[40548527] = Rare({
    id=147897,
    quest={54320, 54321},
    rewards={
        Pet({item=166454, id=2549})
    }
}) -- Soggoth the SLitherer

map.nodes[45485896] = Rare({
    id=147332,
    quest={54247, 54248}
}) -- Stonebinder Ssra'vess

map.nodes[40618267] = Rare({
    id=147942,
    quest={54397, 54398},
    rewards={
        Pet({item=166455, id=2550})
    }
}) -- Twilight Prophet Graeme

------------------------------------ HORDE ------------------------------------

map.nodes[41607640] = Rare({
    id=148037,
    quest=54431,
    faction='Horde',
    rewards={
        Pet({item=166449, id=2544}),
        Mount({item=166803, id=1203})
    }
}) -- Athil Dewfire

map.nodes[49682495] = Rare({
    id=149651,
    quest=54890,
    faction='Horde',
    controllingFaction='Horde',
    rewards={
        Mount({item=166428, id=1199})
    }
}) -- Blackpaw

map.nodes[50703231] = Rare({
    id=149656,
    quest=54891,
    faction='Horde',
    controllingFaction='Horde',
    rewards={
        Pet({item=166528, id=2563})
    }
}) -- Grimhorn

map.nodes[45187494] = Rare({
    id=147758,
    quest=54291,
    faction='Horde',
    rewards={
        Pet({item=166453, id=2548})
    }
}) -- Onu

map.nodes[32768407] = Rare({
    id=148103,
    quest=54452,
    faction='Horde',
    rewards={
        Toy({item=166788})
    }
}) -- Sapper Odette

map.nodes[39763269] = Rare({
    id=149658,
    quest=54892,
    faction='Horde',
    rewards={
        Mount({item=166435, id=1205})
    }
}) -- Shadowclaw

map.nodes[62121651] = Rare({
    id=147435,
    quest=54252,
    faction='Horde',
    rewards={
        Toy({item=166790})
    }
}) -- Thelar Moonstrike

---------------------------------- ALLIANCE -----------------------------------

map.nodes[49502510] = Rare({
    id=149652,
    quest=54883,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Mount({item=166438, id=1199})
    }
}) -- Agathe Wyrmwood

map.nodes[41607674] = Rare({
    id=149141,
    quest=54768,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Toy({item=166788}),
        Pet({item=166449, id=2544})
    }
}) -- Burninator Mark V

map.nodes[46528585] = Rare({
    id=147845,
    quest=54309,
    faction='Alliance',
    rewards={
        Toy({item=166790})
    }
}) -- Commander Drald

map.nodes[50703230] = Rare({
    id=149661,
    quest=54886,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Mount({item=166437, id=1205})
    }
}) -- Croz Bloodrage

map.nodes[67241877] = Rare({
    id=147701,
    quest=54277,
    faction='Alliance',
    rewards={
        Mount({item=166434, id=1203})
    }
}) -- Moxo the Beheader

map.nodes[39663344] = Rare({
    id=149664,
    quest=54889,
    faction='Alliance',
    controllingFaction='Alliance',
    rewards={
        Pet({item=166528, id=2563})
    }
}) -- Orwell Stevenson

map.nodes[62390986] = Rare({
    id=147664,
    quest=54274,
    faction='Alliance',
    rewards={
        Pet({item=166453, id=2548})
    }
}) -- Zim'kaga

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- 50552275 54909

-------------------------------------------------------------------------------
------------------------------- FRIGHTENED KODO -------------------------------
-------------------------------------------------------------------------------

map.nodes[41316548] = Collectible({
    id=148790,
    icon=132245,
    note=L["frightened_kodo_note"],
    rewards={
        Mount({item=166433, id=1201}) -- Frightened Kodo
    },
    pois={
        POI({41316548, 44046756, 41275401, 38006600, 39205650, 44006500})
    }
}) -- Frightened Kodo



-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Pet = ns.reward.Pet
local Transmog = ns.reward.Transmog
local Toy = ns.reward.Toy

local Arrow = ns.poi.Arrow
local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=896, settings=true })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[41953647] = Rare({
    id=128181,
    quest=49137,
    label=GetAchievementCriteriaInfoByID(12941, 41714),
    note=L["in_small_cave"]..' '..L["ancient_sarco_note"],
    rewards={
        Achievement({id=12941, criteria=41714})
    }
}) -- Ancient Sarcophagus

map.nodes[29226901] = Rare({
    id=137824,
    quest=51470,
    rewards={
        Achievement({id=12941, criteria=41733}),
        Transmog({item=160469, slot=L["mail"]}) -- Arclight Jumpers
    }
}) -- Arclight

map.nodes[34886921] = Rare({
    id=137529,
    quest=51383,
    rewards={
        Achievement({id=12941, criteria=41732}),
        Transmog({item=160449, slot=L["warglaive"]}) -- Spectral Revenger
    }
}) -- Arvon the Betrayed

map.nodes[43768802] = Rare({
    id=137825,
    quest=51471,
    rewards={
        Achievement({id=12941, criteria=41736}),
        Transmog({item=154447, slot=L["plate"]}) -- Gryphon-Rider's Breastplate
    }
}) -- Avalanche

map.nodes[55472882] = Rare({
    id=130143,
    quest=49602,
    rewards={
        Achievement({id=12941, criteria=41726}),
        Transmog({item=160475, slot=L["plate"]}) -- Barksnapper Girdle
    },
    pois={
        Path({
            55472882, 56102946, 56762915, 57662950, 58572980, 58932879,
            59262784, 59182660, 58382635, 57652668, 56922702, 56352754,
            55752805, 55472882
        })
    }
}) -- Balethorn

map.nodes[59101676] = Rare({
    id=127333,
    quest=48842,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12941, criteria=41708}),
        Transmog({item=155425, slot=L["fist"]}) -- Barbthorn Queen's Stinger
    }
}) -- Barbthorn Queen

map.nodes[50543005] = Rare({
    id=129805,
    quest=49481,
    note=L["in_small_cave"]..' '..L["beshol_note"],
    rewards={
        Achievement({id=12941, criteria=41722}),
        Transmog({item=158363, slot=L["cloth"]}) -- Spiderhair Circlet
    }
}) -- Beshol

map.nodes[58463317] = Rare({
    id=124548,
    quest=47884,
    rewards={
        Achievement({id=12941, criteria=41706}),
        Transmog({item=160463, slot=L["leather"]}) -- Blue-Ribbon Belt
    }
}) -- Betsy

map.nodes[35053326] = Rare({
    id=132319,
    quest=50163,
    note=L["in_cave"],
    rewards={
        Achievement({id=12941, criteria=41727}),
        Transmog({item=155284, slot=L["1h_mace"]}) -- Bleak Hills Swatter
    },
    pois={
            POI({35943156}) -- Cave Entrance
    }
}) -- Bilefang Mother

map.nodes[66585068] = Rare({
    id=126621,
    quest=48978,
    rewards={
        Achievement({id=12941, criteria=41711}),
        Transmog({item=154376, slot=L["plate"]}) -- Bonecurse Guantlets
    }
}) -- Bonesquall

map.nodes[27635958] = Rare({
    id=139321,
    quest=51922,
    rewards={
        Achievement({id=12941, criteria=41750}),
        Transmog({item=154500, slot=L["staff"]}) -- Moonwood Bramblespire
    }
}) -- Braedan Whitewall

map.nodes[27561420] = Rare({
    id=135796,
    quest=50939,
    rewards={
        Achievement({id=12941, criteria=41730}),
        Transmog({item=160450, slot=L["gun"]}) -- Leadshot Heavy Rifle
    },
    pois={
        Path({28301415, 27561420, 26781427})
    }
}) -- Captain Leadfist

map.nodes[52074697] = Rare({
    id=129904,
    quest=49216,
    note=L["in_small_cave"]..' ' ..L["cottontail_matron_note"],
    rewards={
        Achievement({id=12941, criteria=41715})
    }
}) -- Cottontail Matron

map.nodes[18716138] = Rare({
    id=134706,
    quest=50669,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12941, criteria=42342}),
        Item({item=158555, note=L["trinket"]}) -- Doom Shroom
    }
}) -- Deathcap

map.nodes[63404009] = Rare({
    id=129995,
    quest=49530,
    rewards={
        Achievement({id=12941, criteria=41724}),
        Transmog({item=160447, slot=L["offhand"]}) -- Soul-Pillar Lantern
    }
}) -- Emily Mayville

map.nodes[30881839] = Rare({
    id=134213,
    quest=50546,
    rewards={
        Achievement({id=12941, criteria=41728}),
        Transmog({item=155055, slot=L["2h_axe"]}) -- Soul-Curse Executioner
    }
}) -- Executioner Blackwell

map.nodes[24462195] = Rare({
    id=138866,
    quest=51749,
    label=GetAchievementCriteriaInfoByID(12941, 41748),
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12941, criteria=41748}),
        Transmog({item=154217, slot=L["dagger"]}) -- Pearly-White Jackknife
    }
}) -- Fungi Trio

map.nodes[63036963] = Rare({
    id=127844,
    quest=48979,
    note=L["gluttonous_yeti_note"],
    rewards={
        Achievement({id=12941, criteria=41712}),
        Transmog({item=158683, slot=L["shield"]}) -- Giant Yeti's Bowl
    }
}) -- Gluttonous Yeti

map.nodes[57124431] = Rare({
    id=129835,
    quest=49480,
    rewards={
        Achievement({id=12941, criteria=41721}),
        Transmog({item=158710, slot=L["1h_mace"]}) -- Gorehorn's Rack
    }
}) -- Gorehorn

map.nodes[28002593] = Rare({
    id=138675,
    quest=51700,
    rewards={
        Achievement({id=12941, criteria=41742}),
        Transmog({item=154461, slot=L["leather"]}) -- Cursed Boarhide Helm
    }
}) -- Gorged Boar

map.nodes[50332063] = Rare({
    id=127129,
    quest=49388,
    rewards={
        Achievement({id=12941, criteria=41720}),
        Transmog({item=160457, slot=L["cloth"]}) -- Lava-Starched Britches
    }
}) -- Grozgore

map.nodes[24073029] = Rare({
    id=138618,
    quest=51698,
    rewards={
        Achievement({id=12941, criteria=41739}),
        Transmog({item=155362, slot=L["polearm"]}) -- Wickerbeast Mulcher
    }
}) -- Haywire Golem

map.nodes[22934948] = Rare({
    id=134754,
    quest=50688,
    rewards={
        Achievement({id=12941, criteria=41729}),
        Transmog({item=160462, slot=L["leather"]}) -- Hyo'gi Basket Binders
    }
}) -- Hyo'gi

map.nodes[59245526] = Rare({
    id=127877,
    quest=48981,
    rewards={
        Achievement({id=12941, criteria=41713}),
        Transmog({item=159518, slot=L["dagger"]}) -- Long Fang
    }
}) -- Longfang & Henry Breakwater

map.nodes[59934547] = Rare({
    id=130138,
    quest=49601,
    rewards={
        Achievement({id=12941, criteria=41725}),
        Transmog({item=160456, slot=L["cloth"]}) -- Blanched Ravenfeather Gloves
    }
}) -- Nevermore

map.nodes[66574273] = Rare({
    id=125453,
    quest=48178,
    rewards={
        Achievement({id=12941, criteria=41707}),
        Transmog({item=158583, slot=L["cloak"]}) -- Quillstitch Greatcloak
    }
}) -- Quillrat Matriarch

map.nodes[59617183] = Rare({
    id=128707,
    quest=49269,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12941, criteria=41717}),
        Transmog({item=158345, slot=L["mail"]}) -- Coldsnap Pauldrons
    }
}) -- Rimestone

map.nodes[67986688] = Rare({
    id=129031,
    quest=49341,
    label=GetAchievementCriteriaInfoByID(12941, 41719),
    note=L["seething_cache_note"],
    rewards={
        Achievement({id=12941, criteria=41719}),
        Item({item=158598, note=L["ring"]}) -- Band of Seething Manifest
    }
}) -- Seething Cache

map.nodes[32985711] = Rare({
    id=138863,
    quest=51748,
    rewards={
        Achievement({id=12941, criteria=41745}),
        Transmog({item=155299, slot=L["wand"]}) -- Sister Martha's Soulstealer
    }
}) -- Sister Martha

map.nodes[31934061] = Rare({
    id=129950,
    quest=49528,
    rewards={
        Achievement({id=12941, criteria=41723}),
        Transmog({item=161444, slot=L["cloth"]}) -- Frosted Talonfeather Mantle
    }
}) -- Talon

map.nodes[25101624] = Rare({
    id=139358,
    quest=51949,
    note=L["the_caterer_note"],
    rewards={
        Item({item=155560, note=L["ring"]}) -- Lazy-Baker's Ring
    }
}) -- The Caterer

map.nodes[72856047] = Rare({
    id=127651,
    quest=48928,
    note=L["vicemaul_note"],
    rewards={
        Achievement({id=12941, criteria=41709}),
        Transmog({item=160474, slot=L["plate"]}) -- Vicemaul Wristpinchers
    }
}) -- Vicemaul

map.nodes[64952147] = Rare({
    id=128973,
    quest=49311,
    rewards={
        Achievement({id=12941, criteria=41718}),
        Transmog({item=155543, slot=L["polearm"]}) -- Tuskarr Whaler's Harpoon
    }
}) -- Whargarble the Ill-Tempered

map.nodes[29506410] = Rare({
    id=139322,
    quest=51923,
    rewards={
        Achievement({id=12941, criteria=41751}),
        Transmog({item=154315, slot=L["fist"]}) -- Rusty Steelclaw
    }
}) -- Whitney "Steelclaw" Ramsay

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- 18245922 51912
-- 26673167 51907
-- 28255916 51913
-- 29872746 51907
-- 32001821 box despawned on approach
-- 34311949 51902
-- 58963042 51875
-- 64706195 51896
-- 69576674 51899
-- 72046008 51899

-------------------------------------------------------------------------------

map.nodes[55605181] = Treasure({
    quest=53472,
    note=L["wicker_pup_note"],
    rewards={
        Achievement({id=12995, criteria=41703}),
        Item({item=163790}), -- Spooky Incantation
        Pet({item=163497, id=2411}) -- Wicker Pup
    }
}) -- Bespelled Chest

map.nodes[25452417] = Treasure({
    quest=53474,
    note=L["in_small_cave"]..' '..L["wicker_pup_note"],
    rewards={
        Achievement({id=12995, criteria=41705}),
        Item({item=163796}), -- Wolf Pup Spine
        Pet({item=163497, id=2411}) -- Wicker Pup
    }
}) -- Enchanted Chest

map.nodes[67767367] = Treasure({
    quest=53473,
    note=L["wicker_pup_note"],
    rewards={
        Achievement({id=12995, criteria=41704}),
        Item({item=163791}), -- Miniature Stag Skull
        Pet({item=163497, id=2411}) -- Wicker Pup
    }
}) -- Ensorcelled Chest

map.nodes[18515133] = Treasure({
    quest=53471,
    note=L["wicker_pup_note"],
    rewards={
        Achievement({id=12995, criteria=41702}),
        Item({item=163789}), -- Bundle of Wicker Sticks
        Pet({item=163497, id=2411}) -- Wicker Pup
    }
}) -- Hexed Chest

map.nodes[25751995] = Treasure({
    quest=53357,
    requires=ns.requirement.Item(163710),
    note=L["merchants_chest_note"],
    rewards={
        Achievement({id=12995, criteria=41698}),
        Item({item=163036, note='x5'})
    }
}) -- Merchant's Chest

map.nodes[63306585] = Treasure({
    quest=53385,
    note=L["in_small_cave"]..' '..L["runebound_cache_note"],
    rewards={
        Achievement({id=12995, criteria=41699}),
        Item({item=163743}) -- Drust Soulcatcher
    }
}) -- Runebound Cache

map.nodes[44222770] = Treasure({
    quest=53386,
    note=L["runebound_chest_note"],
    rewards={
        Achievement({id=12995, criteria=41700}),
        Toy({item=163742}) -- Heartsbane Grimoire
    }
}) -- Runebound Chest

map.nodes[33687173] = Treasure({
    quest=53387,
    note=L["runebound_coffer_note"],
    rewards={
        Achievement({id=12995, criteria=41701}),
        Toy({item=163740}) -- Drust Ritual Knife
    }
}) -- Runebound Coffer

map.nodes[24264830] = Treasure({
    quest=53475,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12995, criteria=41752}),
        Item({item=163036, note='x5'})
    }
}) -- Stolen Thornspeaker Cache

map.nodes[33713008] = Treasure({
    quest=53356,
    rewards={
        Achievement({id=12995, criteria=41697})
    }
}) -- Web-Covered Chest

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55375,
    rewards={
        Achievement({id=13317, criteria=43931})
    }
}) -- quest = 54715 (looted ever) 55375 (looted today)

map.nodes[29674100] = SECRET_CHEST
-- map.nodes[30003300] = SECRET_CHEST
map.nodes[33704075] = SECRET_CHEST
map.nodes[33804930] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[30223362] = Supply({
    quest=55408,
    fgroup='supply_path_1'
})
map.nodes[31812232] = Supply({
    quest=55408,
    fgroup='supply_path_1',
    pois={Arrow({33750842, 27005679})}
})
map.nodes[33051346] = Supply({
    quest=55408,
    fgroup='supply_path_1'
})

map.nodes[53422897] = Supply({
    quest=55408,
    fgroup='supply_path_2'
})
map.nodes[58104270] = Supply({
    quest=55408,
    fgroup='supply_path_2',
    pois={Arrow({66006663, 50001873})}
})
map.nodes[62825711] = Supply({
    quest=55408,
    fgroup='supply_path_2'
})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[21406645] = PetBattle({
    id=139489,
    note=L["captain_hermes_note"],
    rewards={
        Achievement({id=12936, criteria=44208}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=1, oneline=true}), -- Beast
        Achievement({id=13271, criteria=1, oneline=true}), -- Critter
        Achievement({id=13272, criteria=1, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=1, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=1, oneline=true}), -- Flying
        Achievement({id=13275, criteria=1, oneline=true}), -- Magic
        Achievement({id=13277, criteria=1, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=1, oneline=true}), -- Undead
        Achievement({id=13280, criteria=1, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=1, oneline=true})  -- Humanoid
    }
}) -- Crab People (Captain Hermes)

map.nodes[38153860] = PetBattle({
    id=140813,
    note=L["fizzie_spark_note"],
    rewards={
        Achievement({id=12936, criteria=44213}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=4, oneline=true}), -- Beast
        Achievement({id=13271, criteria=4, oneline=true}), -- Critter
        Achievement({id=13272, criteria=4, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=4, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=4, oneline=true}), -- Flying
        Achievement({id=13275, criteria=4, oneline=true}), -- Magic
        Achievement({id=13277, criteria=4, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=4, oneline=true}), -- Undead
        Achievement({id=13280, criteria=4, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=4, oneline=true})  -- Humanoid
    }
}) -- Rogue Azerite (Fizzie Sparkwhistle)

map.nodes[61061771] = PetBattle({
    id=140880,
    note=L["michael_skarn_note"],
    rewards={
        Achievement({id=12936, criteria=44214}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=5, oneline=true}), -- Beast
        Achievement({id=13271, criteria=5, oneline=true}), -- Critter
        Achievement({id=13272, criteria=5, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=5, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=5, oneline=true}), -- Flying
        Achievement({id=13275, criteria=5, oneline=true}), -- Magic
        Achievement({id=13277, criteria=5, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=5, oneline=true}), -- Undead
        Achievement({id=13280, criteria=5, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=5, oneline=true})  -- Humanoid
    }
}) -- What's the Buzz? (Michael Skarn)

map.nodes[63605971] = PetBattle({
    id=140461,
    note=L["dilbert_mcclint_note"],
    rewards={
        Achievement({id=12936, criteria=44212}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=3, oneline=true}), -- Beast
        Achievement({id=13271, criteria=3, oneline=true}), -- Critter
        Achievement({id=13272, criteria=3, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=3, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=3, oneline=true}), -- Flying
        Achievement({id=13275, criteria=3, oneline=true}), -- Magic
        Achievement({id=13277, criteria=3, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=3, oneline=true}), -- Undead
        Achievement({id=13280, criteria=3, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=3, oneline=true})  -- Humanoid
    }
}) -- Night Horrors (Dilbert McClint)

-------------------------------------------------------------------------------
--------------------------- DRUST THE FACTS, MA'AM ----------------------------
-------------------------------------------------------------------------------

local Stele = Class('Stele', Collectible, {
    icon=2101971,
    group=ns.groups.DRUST_FACTS,
    sublabel=L["drust_facts_note"]
})

map.nodes[19065787] = Stele({
    rewards={
        Achievement({id=13064, criteria=41443})
    }
}) -- Drust Stele: The Cycle

map.nodes[27354833] = Stele({
    rewards={
        Achievement({id=13064, criteria=41438})
    }
}) -- Drust Stele: The Tree

map.nodes[27605760] = Stele({
    rewards={
        Achievement({id=13064, criteria=41441})
    }
}) -- Drust Stele: Sacrifice

map.nodes[36806450] = Stele({
    rewards={
        Achievement({id=13064, criteria=41436})
    }
}) -- Drust Stele: The Circle

map.nodes[44584566] = Stele({
    note=L["stele_forest_note"],
    rewards={
        Achievement({id=13064, criteria=41449})
    },
    pois={
        POI({46094528}) -- Ulfar's Den
    }
}) -- Drust Stele: Protectors of the Forest

map.nodes[46453723] = Stele({
    rewards={
        Achievement({id=13064, criteria=41445})
    }
}) -- Drust Stele: Conflict

map.nodes[50144232] = Stele({
    rewards={
        Achievement({id=13064, criteria=41442})
    }
}) -- Drust Stele: Constructs

map.nodes[50777371] = Stele({
    rewards={
        Achievement({id=13064, criteria=41437})
    }
}) -- Drust Stele: The Ritual

map.nodes[56558583] = Stele({
    rewards={
        Achievement({id=13064, criteria=41446})
    }
}) -- Drust Stele: The Flayed Man

map.nodes[59396668] = Stele({
    rewards={
        Achievement({id=13064, criteria=41439})
    }
}) -- Drust Stele: Breath Into Stone

-------------------------------------------------------------------------------
------------------------- EVERYTHING OLD IS NEW AGAIN -------------------------
-------------------------------------------------------------------------------

local Relic = Class('OrderRelic', Collectible, {
    icon=514016,
    group=ns.groups.EMBER_RELICS,
    pois={
        POI({44892743}) -- Gol Var entrance
    },
    IsCompleted = function (self)
        if ns.PlayerHasItem(self.item) then return true end
        return Collectible.IsCompleted(self)
    end
})

map.nodes[32585891] = Relic({
    item=163747,
    note=L["embers_knife_note"],
    rewards={
        Achievement({id=13082, criteria=41639})
    }
}) -- Order of Embers Knife

map.nodes[35525187] = Relic({
    item=163749,
    note=L["embers_crossbow_note"],
    rewards={
        Achievement({id=13082, criteria=41636})
    }
}) -- Order of Embers Crossbow

map.nodes[55432714] = Relic({
    item=163748,
    note=L["embers_hat_note"],
    rewards={
        Achievement({id=13082, criteria=41638})
    }
}) -- Order of Embers Hat

map.nodes[64876779] = Relic({
    item=163746,
    note=L["embers_flask_note"],
    rewards={
        Achievement({id=13082, criteria=41637})
    }
}) -- Order of Embers Flask

map.nodes[42432548] = Collectible({
    icon=514016,
    label=L["golvar_ruins"],
    note=L["embers_golvar_note"],
    group=ns.groups.EMBER_RELICS,
    rewards={
        Achievement({id=13082, criteria={
            41636, -- Old Crossbow
            41637, -- Old Flask
            41638, -- Old Hat
            41639, -- Old Knife
        }})
    },
    pois={
        POI({44892743}) -- Gol Var entrance
    }
})

-------------------------------------------------------------------------------
------------------------------- SAUSAGE SAMPLER -------------------------------
-------------------------------------------------------------------------------

map.nodes[55563479] = Collectible({
    id=128467,
    icon=133200,
    note=L["sausage_sampler_note"]..' '..L["elijah_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    rewards={
        Achievement({id=13087, criteria={
            41648, -- Goldshire Farms Smoked Sausage
            41651, -- Roland's Famous Frankfurter
            41652, -- Rosco Fryer's Mostly-Meat Brat
            41653, -- Timmy Gene Sunrise Pork
        }})
    }
}) -- Elijah Eggleton

map.nodes[37894905] = Collectible({
    id=137031,
    icon=133200,
    note=L["sausage_sampler_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    rewards={
        Achievement({id=13087, criteria={
            41651, -- Roland's Famous Frankfurter
        }})
    }
}) -- Jake Storm

map.nodes[26677253] = Collectible({
    id=136655,
    icon=133200,
    note=L["sausage_sampler_note"]..' '..L["alisha_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    rewards={
        Achievement({id=13087, criteria={
            41649, -- Fried Boar Sausage
            41652, -- Rosco Fryer's Mostly-Meat Brat
        }})
    }
}) -- Alisha Darkwater

local raal = Collectible({
    id=131863,
    icon=133200,
    note=L["sausage_sampler_note"]..'\n\n'..L["raal_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    rewards={
        Achievement({id=13087, criteria={
            41650, -- Heartsbane Hexwurst
        }}),
        Item({item=163833}) -- Recipe: Heartsbane Hexwurst
    }
}) -- Raal the Gluttonous

map.nodes[34581008] = raal
Map({id=1015}).nodes[67434813] = raal

-------------------------------------------------------------------------------
--------------------------- THREE SHEETS TO THE WIND --------------------------
-------------------------------------------------------------------------------

map.nodes[21146615] = Collectible({
    id=139638,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    rewards={
        Achievement({id=13061, criteria={
            41400, -- Blacktooth Bloodwine
            41408, -- Kul Tiran Tripel
            41413, -- Sausage Martini
            41414, -- Snowberry Berliner
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Barkeep Cotner

map.nodes[21474360] = Collectible({
    id=137040,
    icon=135999,
    note=L["three_sheets_note"]..'\n\n'..L["linda_deepwater_note"],
    group=ns.groups.THREE_SHEETS,
    rewards={
        Achievement({id=13061, criteria={
            41397, -- Admiralty-Issued Grog
            41399, -- Bitter Darkroot Vodka
            41400, -- Blacktooth Bloodwine
            41407, -- Hook Point Schnapps
            41408, -- Kul Tiran Tripel
            41409, -- Long Forgotten Rum
            41410, -- Mildenhall Mead
            41415, -- Thornspeaker Moonshine
            41417, -- Whitegrove Pale Ale
        }})
    },
    pois={
        POI({22884623}) -- Cesi Loosecannon
    }
}) -- Linda Deepwater

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[53202880] = ToAlltheSquirrels({
    id=129791,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50239})
    },
    pois={
        POI({51802640, 53803340})
    }
}) -- Drustbat

map.nodes[60802340] = ToAlltheSquirrels({
    id=128798,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50241})
    },
    pois={
        POI({60801600, 62602380, 59202340})
    }
}) -- Bramble Hare

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local _, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Node = ns.node.Node
local NPC = ns.node.NPC
local PetBattle = ns.node.PetBattle
local Quest = ns.node.Quest
local Rare = ns.node.Rare
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Toy = ns.reward.Toy
local Transmog = ns.reward.Transmog

local POI = ns.poi.POI

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1462, settings=true })

function map:Prepare ()
    Map.Prepare(self)
    self.future = AuraUtil.FindAuraByName(GetSpellInfo(296644), 'player')
end

function map:IsNodeEnabled(node, coord, minimap)
    -- check node's future availability (nil=no, 1=yes, 2=both)
    if self.future and not node.future then return false end
    if not self.future and node.future == 1 then return false end
    return Map.IsNodeEnabled(self, node, coord, minimap)
end

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[52894092] = Rare({
    id=151934,
    quest=55512,
    future=2,
    rewards={
        Achievement({id=13470, criteria=45124}),
        Mount({id=1229, item=168823}) -- Rusty Mechanocrawler
    }
}) -- Arachnoid Harvester

map.nodes[55622571] = Rare({
    id=151308,
    quest=55539,
    rewards={
        Achievement({id=13470, criteria=45131}),
        Item({item=169688, quest=56515}) -- Vinyl: Gnomeregan Forever
    }
}) -- Boggac Skullbash

map.nodes[51265010] = Rare({
    id=153200,
    quest=55857,
    requires='{npc:150306} (DR-JD41)',
    rewards={
        Achievement({id=13470, criteria=45152}),
        Item({item=167042, quest=55030}), -- Blueprint: Scrap Trap
        Item({item=169691, quest=56518}) -- Vinyl: Depths of Ulduar
    }
}) -- Boilburn

map.nodes[65842288] = Rare({
    id=152001,
    quest=55537,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13470, criteria=45130}),
        Item({item=167846, quest=55061}), -- Blueprint: Mechano-Treat
        Pet({id=2719, item=169392}) -- Bonebiter
    }
}) -- Bonepicker

map.nodes[66535891] = Rare({
    id=154739,
    quest=56368,
    requires='{npc:150306} (DR-CC73)',
    rewards={
        Achievement({id=13470, criteria=45411}),
        Item({item=169170, quest=55078}) -- Blueprint: Utility Mechanoclaw
    }
}) -- Caustic Mechaslime

map.nodes[82522072] = Rare({
    id=149847,
    quest=55812,
    note=L["crazed_trogg_note"],
    rewards={
        Achievement({id=13470, criteria=45137}),
        Item({item=169169, quest=55077}), -- Blueprint: Blue Spraybot
        Item({item=169168, quest=55076}), -- Blueprint: Green Spraybot
        Item({item=169167, quest=55075}), -- Blueprint: Orange Spraybot
        Item({item=167792, quest=55452}), -- Paint Vial: Fel Mint Green
        Item({item=167793, quest=55457}) -- Paint Vial: Overload Orange
    }
}) -- Crazed Trogg

map.nodes[35464229] = Rare({
    id=151569,
    quest=55514,
    note=L["deepwater_note"],
    requires=ns.requirement.Item(167649),
    rewards={
        Achievement({id=13470, criteria=45128}),
        Item({item=167836, quest=55057}), -- Blueprint: Canned Minnows
    }
}) --Deepwater Maw

map.nodes[63122559] = Rare({
    id=150342,
    quest=55814,
    requires='{npc:150306} (DR-TR35)',
    rewards={
        Achievement({id=13470, criteria=45138}),
        Item({item=167042, quest=55030}), -- Blueprint: Scrap Trap
        Item({item=169691, quest=56518}) -- Vinyl: Depths of Ulduar
    }
}) -- Earthbreaker Gulroc

map.nodes[55075684] = Rare({
    id=154153,
    quest=56207,
    rewards={
        Achievement({id=13470, criteria=45373}),
        Item({item=169174, quest=55082}), -- Blueprint: Rustbolt Pocket Turret
        Transmog({item=170466, slot=L["staff"]}), -- Junkyard Motivator
        Transmog({item=170467, slot=L["1h_sword"]}), -- Whirring Chainblade
        Transmog({item=170468, slot=L["gun"]}), -- Supervolt Zapper
        Transmog({item=170470, slot=L["shield"]}) -- Reinforced Grease Deflector
    }
}) -- Enforcer KX-T57

map.nodes[65515167] = Rare({
    id=151202,
    quest=55513,
    note=L["foul_manifest_note"],
    rewards={
        Achievement({id=13470, criteria=45127}),
        Item({item=167871, quest=55063}) -- Blueprint: G99.99 Landshark
    }
}) -- Foul Manifestation

map.nodes[44553964] = Rare({
    id=151884,
    quest=55367,
    note=L["furor_note"],
    rewards={
        Achievement({id=13470, criteria=45126}),
        Item({item=167793, quest=55457}), -- Paint Vial: Overload Orange
        Pet({id=2712, item=169379}) -- Snowsoft Nibbler
    }
}) -- Fungarian Furor

map.nodes[61395117] = Rare({
    id=153228,
    quest=55852,
    note=L["cogstar_note"],
    rewards={
        Achievement({id=13470, criteria=45155}),
        Item({item=167847, quest=55062}), -- Blueprint: Ultrasafe Transporter: Mechagon
        Transmog({item=170467, slot=L["1h_sword"]}) -- Whirring Chainblade
    }
}) -- Gear Checker Cogstar

map.nodes[59836701] = Rare({
    id=153205,
    quest=55855,
    requires='{npc:150306} (DR-JD99)',
    rewards={
        Achievement({id=13470, criteria=45146}),
        Item({item=169691, quest=56518}) -- Vinyl: Depths of Ulduar
    }
}) -- Gemicide

map.nodes[73135414] = Rare({
    id=154701,
    quest=56367,
    requires='{npc:150306} (DR-CC61)',
    rewards={
        Achievement({id=13470, criteria=45410}),
        Item({item=167846, quest=55061}) -- Blueprint: Mechano-Treat
    }
}) -- Gorged Gear-Cruncher

map.nodes[77124471] = Rare({
    id=151684,
    quest=55399,
    rewards={
        Achievement({id=13470, criteria=45121})
    }
}) -- Jawbreaker

map.nodes[44824637] = Rare({
    id=152007,
    quest=55369,
    note=L["killsaw_note"],
    rewards={
        Achievement({id=13470, criteria=45125}),
        Toy({item=167931}) -- Mechagonian Sawblades
    }
}) -- Killsaw

map.nodes[60654217] = Rare({
    id=151933,
    quest=55544,
    note=L["beastbot_note"],
    requires=ns.requirement.Item(168045),
    rewards={
        Achievement({id=13470, criteria=45136}),
        Achievement({id=13708, criteria={45772,45775,45776,45777,45778}}), -- Most Minis Wins
        Item({item=169848, weekly=57135}), -- Azeroth Mini Pack: Bondo's Yard
        Item({item=169173, quest=55081}), -- Blueprint: Anti-Gravity Pack
        Pet({id=2715, item=169382}) -- Lost Robogrip
    }
}) -- Malfunctioning Beastbot (55926 56506)

map.nodes[57165258] = Rare({
    id=151124,
    quest=55207,
    note=L["nullifier_note"],
    requires={
        ns.requirement.Item(168023),
        ns.requirement.Item(168435)
    },
    rewards={
        Achievement({id=13470, criteria=45117}),
        Item({item=168490, quest=55069}), -- Blueprint: Protocol Transference Device
        Item({item=169688, quest=56515}) -- Vinyl: Gnomeregan Forever
    }
}) -- Mechagonian Nullifier

map.nodes[88142077] = Rare({
    id=151672,
    quest=55386,
    future=2,
    rewards={
        Achievement({id=13470, criteria=45119}),
        Pet({id=2720, item=169393}) -- Arachnoid Skitterbot
    }
}) -- Mecharantula

map.nodes[61036101] = Rare({
    id=151627,
    quest=55859,
    rewards={
        Achievement({id=13470, criteria=45156}),
        Item({item=168248, quest=55068}), -- Blueprint: BAWLD-371
        Transmog({item=170467, slot=L["1h_sword"]}) -- Whirring Chainblade
    }
}) -- Mr. Fixthis

map.nodes[56243595] = Rare({
    id=153206,
    quest=55853,
    requires='{npc:150306} (DR-TR28)',
    rewards={
        Achievement({id=13470, criteria=45145}),
        Item({item=167846, quest=55061}), -- Blueprint: Mechano-Treat
        Item({item=169691, quest=56518}), -- Vinyl: Depths of Ulduar
        Transmog({item=170466, slot=L["staff"]}) -- Junkyard Motivator
    }
}) -- Ol' Big Tusk

map.nodes[57063944] = Rare({
    id=151296,
    quest=55515,
    note=L["avenger_note"],
    rewards={
        Achievement({id=13470, criteria=45129}),
        Item({item=168492, quest=55071}) -- Blueprint: Emergency Rocket Chicken
    }
}) -- OOX-Avenger/MG

map.nodes[56636287] = Rare({
    id=152764,
    quest=55856,
    note=L["leachbeast_note"],
    rewards={
        Achievement({id=13470, criteria=45157}),
        Item({item=167794, quest=55454}), -- Paint Vial: Lemonade Steel
    }
}) -- Oxidized Leachbeast

map.nodes[22466873] = Rare({
    id=151702,
    quest=55405,
    rewards={
        Achievement({id=13470, criteria=45122}),
        Transmog({item=170468, slot=L["gun"]}) -- Supervolt Zapper
    }
}) -- Paol Pondwader

map.nodes[40235317] = Rare({
    id=150575,
    quest=55368,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13470, criteria=45123}),
        Item({item=168001, quest=55517}) -- Paint Vial: Big-ol Bronze
    }
}) -- Rumblerocks

map.nodes[65637850] = Rare({
    id=152182,
    quest=55811,
    rewards={
        Achievement({id=13470, criteria=45135}),
        Item({item=169173, quest=55081}), -- Blueprint: Anti-Gravity Pack
        Mount({id=1248, item=168370}) -- Rusted Keys to the Junkheap Drifter
    }
}) -- Rustfeather

map.nodes[82287300] = Rare({
    id=155583,
    quest=56737,
    note=L["scrapclaw_note"],
    rewards={
        Achievement({id=13470, criteria=45691}),
        Transmog({item=170470, slot=L["shield"]}) -- Reinforced Grease Deflector
    }
}) -- Scrapclaw

map.nodes[19127975] = Rare({
    id=150937,
    quest=55545,
    rewards={
        Achievement({id=13470, criteria=45133}),
        Item({item=168063, quest=55065}) -- Blueprint: Rustbolt Kegerator
    }
}) -- Seaspit

map.nodes[81852708] = Rare({
    id=153000,
    quest=55810,
    note=L["sparkqueen_note"],
    rewards={
        Achievement({id=13470, criteria=45134})
    }
}) -- Sparkqueen P'Emp

map.nodes[26257806] = Rare({
    id=153226,
    quest=55854,
    rewards={
        Achievement({id=13470, criteria=45154}),
        Item({item=168062, quest=55064}), -- Blueprint: Rustbolt Gramophone
        Item({item=169690, quest=56517}), -- Vinyl: Battle of Gnomeregan
        Item({item=169689, quest=56516}), -- Vinyl: Mimiron's Brainstorm
        Item({item=169692, quest=56519}) -- Vinyl: Triumph of Gnomeregan
    }
}) -- Steel Singer Freza

map.nodes[80962019] = Rare({
    id=155060,
    quest=56419,
    label=GetAchievementCriteriaInfoByID(13470, 45433),
    note=L["doppel_note"],
    requires=ns.requirement.Item(169470),
    rewards={
        Achievement({id=13470, criteria=45433})
    }
}) -- The Doppel Gang

map.nodes[68434776] = Rare({
    id=152113,
    quest=55858,
    requires='{npc:150306} (DR-CC88)',
    rewards={
        Achievement({id=13470, criteria=45153}),
        Item({item=169691, quest=56518}), -- Vinyl: Depths of Ulduar
        Pet({id=2753, item=169886}) -- Spraybot 0D
    }
}) -- The Kleptoboss

map.nodes[57335827] = Rare({
    id=154225,
    quest=56182,
    future=2,
    note=L["rusty_note"],
    requires=ns.requirement.Item(169114),
    rewards={
        Achievement({id=13470, criteria=45374}),
        Toy({item=169347}), -- Judgment of Mechagon
        Transmog({item=170467, slot=L["1h_sword"]}) -- Whirring Chainblade
    }
}) -- The Rusty Prince

map.nodes[72344987] = Rare({
    id=151625,
    quest=55364,
    rewards={
        Achievement({id=13470, criteria=45118}),
        Item({item=167846, quest=55061}), -- Blueprint: Mechano-Treat
        Transmog({item=170467, slot=L["1h_sword"]}) -- Whirring Chainblade
    }
}) -- The Scrap King

map.nodes[57062218] = Rare({
    id=151940,
    quest=55538,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13470, criteria=45132})
    }
}) -- Uncle T'Rogg

map.nodes[53824933] = Rare({
    id=150394,
    quest=55546,
    future=2,
    note=L["vaultbot_note"],
    requires=ns.requirement.Item(167062),
    rewards={
        Achievement({id=13470, criteria=45158}),
        Item({item=167843, quest=55058}), -- Blueprint: Vaultbot Key
        Item({item=167796, quest=55455}), -- Paint Vial: Mechagon Gold
        Pet({id=2766, item=170072}) -- Armored Vaultbot
    },
    pois={
        POI({63263885}) -- Tesla Coil
    }
}) -- Armored Vaultbot

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[64706460] = PetBattle({id=154922, rewards={Achievement({id=13625, criteria=45459})}}) -- Gnomefeaster
map.nodes[60704650] = PetBattle({id=154923, rewards={Achievement({id=13625, criteria=45460})}}) -- Sputtertude
map.nodes[60605690] = PetBattle({id=154924, rewards={Achievement({id=13625, criteria=45461})}}) -- Goldenbot XD
map.nodes[59205090] = PetBattle({id=154925, rewards={Achievement({id=13625, criteria=45462})}}) -- Creakclank
map.nodes[65405770] = PetBattle({id=154926, rewards={Achievement({id=13625, criteria=45463})}}) -- CK-9 Micro-Oppression Unit
map.nodes[51104540] = PetBattle({id=154927, rewards={Achievement({id=13625, criteria=45464})}}) -- Unit 35
map.nodes[39504010] = PetBattle({id=154928, rewards={Achievement({id=13625, criteria=45465})}}) -- Unit 6
map.nodes[72107290] = PetBattle({id=154929, rewards={Achievement({id=13625, criteria=45466})}}) -- Unit 17

-------------------------------------------------------------------------------
-------------------------------- LOCKED CHESTS --------------------------------
-------------------------------------------------------------------------------

local Locked = Class('LockedChest', Node, {
    icon='chest_gy',
    scale = 1.3,
    group=ns.groups.LOCKED_CHEST
})

local iron = Locked({
    label=L["iron_chest"],
    note=L["iron_chest_note"],
    requires=ns.requirement.Item(169872),
    rewards={
        Item({item=170146, quest=56907}) -- Paint Bottle: Nukular Red
    }
})

local mech = Locked({
    label=L["msup_chest"],
    note=L["msup_chest_note"],
    requires=ns.requirement.Item(169873),
    rewards={
        Achievement({id=13708, criteria={45773,45781,45779,45780,45785}}), -- Most Minis Wins
        Item({item=169850, weekly=57133}) -- Azeroth Mini Pack: Mechagon
    }
})

local rusty = Locked({
    label=L["rust_chest"],
    note=L["rust_chest_note"],
    requires=ns.requirement.Item(169218)
})

map.nodes[23195699] = iron
map.nodes[13228581] = iron
map.nodes[19018086] = iron
map.nodes[30775964] = iron
map.nodes[20537120] = mech
map.nodes[18357618] = rusty
map.nodes[25267825] = rusty
map.nodes[23988441] = rusty

-------------------------------------------------------------------------------
------------------------------ MECHANIZED CHESTS ------------------------------
-------------------------------------------------------------------------------

local MechChest = Class('MechChest', Treasure)

MechChest.group = ns.groups.MECH_CHEST
MechChest.label = L["mech_chest"]
MechChest.rewards = {
    Achievement({id=13708, criteria={45773,45781,45779,45780,45785}}), -- Most Minis Wins
    Item({item=167790, quest=55451}), -- Paint Vial: Fireball Red
    Item({item=169850, weekly=57133}) -- Azeroth Mini Pack: Mechagon
}

local TREASURE1 = MechChest({quest=55547, icon='chest_yw'})
local TREASURE2 = MechChest({quest=55548, icon='chest_bl'})
local TREASURE3 = MechChest({quest=55549, icon='chest_nv'})
local TREASURE4 = MechChest({quest=55550, icon='chest_tl'})
local TREASURE5 = MechChest({quest=55551, icon='chest_bk', future=1})
local TREASURE6 = MechChest({quest=55552, icon='chest_pp'})
local TREASURE7 = MechChest({quest=55553, icon='chest_gn'})
local TREASURE8 = MechChest({quest=55554, icon='chest_pk'})
local TREASURE9 = MechChest({quest=55555, icon='chest_lm'})
local TREASURE10 = MechChest({quest=55556, icon='chest_rd'})

-- object 325659
map.nodes[43304977] = TREASURE1
map.nodes[49223021] = TREASURE1
map.nodes[52115326] = TREASURE1
map.nodes[53254190] = TREASURE1
map.nodes[56973861] = TREASURE1
-- object 325660
map.nodes[20617141] = TREASURE2
map.nodes[30785183] = TREASURE2
map.nodes[35683833] = TREASURE2
map.nodes[40155409] = TREASURE2
-- object 325661
map.nodes[59946357] = TREASURE3
map.nodes[65866460] = TREASURE3
map.nodes[67075645] = TREASURE3
map.nodes[73515334] = TREASURE3
map.nodes[80374838] = TREASURE3
-- object 325662
map.nodes[65555284] = TREASURE4
map.nodes[72594733] = TREASURE4
map.nodes[73014950] = TREASURE4
map.nodes[76215286] = TREASURE4
map.nodes[81196149] = TREASURE4
-- object 325663
map.nodes[56665739] = TREASURE5
map.nodes[58634160] = TREASURE5
map.nodes[61583230] = TREASURE5
map.nodes[64365961] = TREASURE5
map.nodes[70654796] = TREASURE5
-- object 325664
map.nodes[50662858] = TREASURE6
map.nodes[55612404] = TREASURE6
map.nodes[56782918] = TREASURE6
map.nodes[57142283] = TREASURE6
map.nodes[64092627] = TREASURE6
map.nodes[66432227] = TREASURE6
-- object 325665
map.nodes[67322289] = TREASURE7
map.nodes[80691868] = TREASURE7
map.nodes[85752824] = TREASURE7
map.nodes[86232042] = TREASURE7
map.nodes[88732015] = TREASURE7
-- object 325666
map.nodes[48367595] = TREASURE8
map.nodes[57258202] = TREASURE8
map.nodes[62297390] = TREASURE8
map.nodes[66767759] = TREASURE8
-- object 325667
map.nodes[63626715] = TREASURE9
map.nodes[72126545] = TREASURE9
map.nodes[76516601] = TREASURE9
map.nodes[81167231] = TREASURE9
map.nodes[85166335] = TREASURE9
-- object 325668
map.nodes[12088568] = TREASURE10
map.nodes[20537696] = TREASURE10
map.nodes[21788303] = TREASURE10
map.nodes[24796526] = TREASURE10

-------------------------------------------------------------------------------
-------------------------------- MISCELLANEOUS --------------------------------
-------------------------------------------------------------------------------

map.nodes[53486145] = Quest({
    quest=55743,
    questDeps=56117,
    daily=true,
    minimap=false,
    scale=1.8,
    rewards={
        Achievement({id=13708, criteria={45772,45775,45776,45777,45778}}), -- Most Minis Wins
        Item({item=169848, weekly=57134}), -- Azeroth Mini Pack: Bondo's Yard
    }
})

-------------------------------------------------------------------------------

map.nodes[69976201] = Class('RegRig', NPC, {
    id=150448,
    icon="peg_wb",
    scale=2,
    note=L["rec_rig_note"],
    group=ns.groups.RECRIG,
    rewards={
        Achievement({id=13708, criteria={45773,45781,45779,45780,45785}}), -- Most Minis Wins
        Item({item=169850, note=L["normal"], weekly=57132}), -- Azeroth Mini Pack: Mechagon
        Item({item=168495, note=L["hard"], quest=55074}), -- Blueprint: Rustbolt Requisitions
        Pet({id=2721, item=169396}), -- Echoing Oozeling
        Pet({id=2756, item=169879}) -- Irradiated Elementaling
    },
    getters = {
        rlabel = function (self)
            local G, GR, N, H = ns.status.Green, ns.status.Gray, L['normal'], L['hard']
            local normal = C_QuestLog.IsQuestFlaggedCompleted(55847) and G(N) or GR(N)
            local hard = C_QuestLog.IsQuestFlaggedCompleted(55848) and G(H) or GR(H)
            return normal..' '..hard
        end
    }
})() -- Reclamation Rig ???=56079

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local Node = ns.node.Node
local NPC = ns.node.NPC
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Quest = ns.reward.Quest
local Toy = ns.reward.Toy
local Transmog = ns.reward.Transmog

local Arrow = ns.poi.Arrow
local POI = ns.poi.POI

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1355, phased=false, settings=true })

function map:Prepare ()
    Map.Prepare(self)
    self.phased = self.intro:IsCompleted()
end

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = Class('Intro', ns.node.Intro)

Intro.note = L["naz_intro_note"]

function Intro.getters:label ()
    return GetAchievementCriteriaInfoByID(13709, 45756) -- Welcome to Nazjatar
end

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({quest=56156, faction='Alliance', rewards={
        -- The Wolf's Offensive => A Way Home
        Quest({id={56031,56043,55095,54969,56640,56641,56642,56643,56644,55175,54972}}),
        -- Essential Empowerment => Scouting the Palace
        Quest({id={55851,55533,55374,55400,55407,55425,55497,55618,57010,56162,56350}}),
        -- The Lost Shaman => A Tempered Blade
        Quest({id={55361,55362,55363,56156}})
    }})
else
    map.intro = Intro({quest=55500, faction='Horde', rewards={
        -- The Warchief's Order => A Way Home
        Quest({id={56030,56044,55054,54018,54021,54012,55092,56063,54015,56429,55094,55053}}),
        -- Essential Empowerment => Scouting the Palace
        Quest({id={55851,55533,55374,55400,55407,55425,55497,55618,57010,56161,55481}}),
        -- Settling In => Save A Friend
        Quest({id={55384,55385,55500}})
    }})
end

map.nodes[11952801] = map.intro

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[52394183] = Rare({
    id=152415,
    quest=56279,
    note=L["alga_note"],
    rewards={
        Achievement({id=13691, criteria=45519}), -- Kill
        Achievement({id=13692, criteria=46083}) -- Blind Eye (170189)
    }
}) -- Alga the Eyeless

map.nodes[65603880] = Rare({
    id=152416,
    quest=56280,
    note=L["allseer_note"],
    rewards={
        Achievement({id=13691, criteria=45520}) -- Kill
    },
    pois={
        POI({65603880, 66204060, 67803700, 69604060, 71003460})
    }
}) -- Allseer Oma'kill

map.nodes[58605329] = Rare({
    id=152566,
    quest=56281,
    note=L["anemonar_note"],
    rewards={
        Achievement({id=13691, criteria=45522}), -- Kill
        Achievement({id=13692, criteria={46088,46089}}), -- Ancient Reefwalker Bark, Reefwalker Bark
        Item({item=170184, weekly=57140}) -- Ancient Reefwalker Bark
    }
}) -- Anemonar

map.nodes[36931120] = Rare({
    id=150191, quest=55584,
    note=L["avarius_note"],
    requires=ns.requirement.Item(167012),
    rewards={
        Pet({id=2706, item=169373}) -- Brinestone Algan
    }
}) -- Avarius

map.nodes[73985395] = Rare({
    id=152361,
    quest=56282,
    note=L["banescale_note"],
    rewards={
        Achievement({id=13691, criteria=45524}), -- Kill
        Achievement({id=13692, criteria=46093}) -- Snapdragon Scent Gland
    }
}) -- Banescale the Packfather

map.nodes[37378256] = Rare({
    id=152712,
    quest=56269,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13691, criteria=45525}), -- Kill
        Pet({id=2682, item=169372}) -- Necrofin Tadpole
    }, pois={
        POI({39897717}) -- Cave entrance
    }
}) -- Blindlight

map.nodes[54664179] = Rare({
    id=149653,
    quest=55366,
    note=L["lasher_note"],
    requires=ns.requirement.Item(166888),
    rewards={
        Pet({id=2708, item=169375}) -- Coral Lashling
    }
}) -- Carnivorous Lasher

map.nodes[40790735] = Rare({
    id=152464,
    quest=56283,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13691, criteria=45527}), -- Kill
        Pet({id=2690, item=169356}) -- Caverndark Nightmare
    }, pois={
        POI({42261342}) -- Cave entrance
    }
}) -- Caverndark Terror

map.nodes[49208875] = Rare({
    id=152556,
    quest=56270,
    note=L["ucav_spawn"],
    rewards={
        Achievement({id=13691, criteria=45528}), -- Kill
        Achievement({id=13692, criteria=46101}), -- Eel Filet
    }, pois={
        POI({47588538}) -- Cave entrance
    }
}) -- Chasm-Haunter

map.nodes[57074363] = Rare({
    id=152291,
    quest=56272,
    note=L["cora_spawn"],
    rewards={
        Achievement({id=13691, criteria=45530}), -- Kill
        Achievement({id=13692, criteria=46096}) -- Fathom Ray Wing
    }
}) -- Deepglider

map.nodes[64543531] = Rare({
    id=152414,
    quest=56284,
    note=L["elderunu_note"],
    rewards={
        Achievement({id=13691, criteria=45531}) -- Kill
    }
}) -- Elder Unu

map.nodes[51757487] = Rare({
    id=152555,
    quest=56285,
    rewards={
        Achievement({id=13691, criteria=45532}), -- Kill
        Pet({id=2693, item=169359}) -- Spawn of Nalaada
    }
}) -- Elderspawn Nalaada

map.nodes[36044496] = Rare({
    id=152553,
    quest=56273,
    note=L["area_spawn"],
    rewards={
        Achievement({id=13691, criteria=45533}), -- Kill
        Achievement({id=13692, criteria=46092}) -- Razorshell
    }
}) -- Garnetscale

map.nodes[43355507] = Rare({
    id=152448,
    quest=56286,
    note=L["glimmershell_note"],
    rewards={
        Achievement({id=13691, criteria=45534}), -- Kill
        Achievement({id=13692, criteria=46099}), -- Giant Crab Leg
        Pet({id=2686, item=169352}) -- Pearlescent Glimmershell
    },
    pois={
        POI({
            39984945, 40354831, 42164806, 42634727, 43355507, 44385569,
            45335615, 45774702, 46035411, 46645255, 47235611, 49595150,
            55845610, 56165729, 57425751, 58614000, 59163967, 61724212,
        })
    }
}) -- Iridescent Glimmershell

map.nodes[50056991] = Rare({
    id=152567,
    quest=56287,
    note=L["kelpwillow_note"],
    requires=ns.requirement.Item(167893),
    rewards={
        Achievement({id=13691, criteria=45535}), -- Kill
        Achievement({id=13692, criteria={46088,46089}}), -- Ancient Reefwalker Bark, Reefwalker Bark
        Item({item=170184, weekly=57140}) -- Ancient Reefwalker Bark
    }
}) -- Kelpwillow

map.nodes[29412899] = Rare({
    id=152323,
    quest=55671,
    note=L["gakula_note"],
    rewards={
        Achievement({id=13691, criteria=45536}), -- Kill
        Pet({id=2681, item=169371}) -- Murgle
    }
}) -- King Gakula

map.nodes[48601760] = Rare({
    id=152465,
    quest=56275,
    minimap=false,
    note=L["needle_note"],
    rewards={
        Achievement({id=13691, criteria=45538}), -- Kill
        Achievement({id=13692, criteria=46099}), -- Giant Crab Leg
        Pet({id=2689, item=169355}) -- Chitterspine Needler
    },
    pois={
        POI({39602800, 46002560, 47003080, 48601760, 50401960, 56600860, 70602460})
    }
}) -- Needlespine

map.nodes[78132501] = Rare({
    id=152397,
    quest=56288,
    note=L["oronu_note"],
    rewards={
        Achievement({id=13691, criteria=45539}), -- Kill
        Achievement({id=13692, criteria={46088,46089}}), -- Ancient Reefwalker Bark, Reefwalker Bark
        Item({item=170184, weekly=57140}) -- Ancient Reefwalker Bark
    }
}) -- Oronu

map.nodes[42728740] = Rare({
    id=152681,
    quest=56289,
    rewards={
        Achievement({id=13691, criteria=45540}), -- Kill
        Pet({id=2701, item=169367}) -- Seafury
    }
}) -- Prince Typhonus

map.nodes[42997551] = Rare({
    id=152682,
    quest=56290,
    rewards={
        Achievement({id=13691, criteria=45541}), -- Kill
        Pet({id=2702, item=169368}) -- Stormwrath
    }
}) -- Prince Vortran

map.nodes[35554141] = Rare({
    id=152548,
    quest=56292,
    note=L["matriarch_note"],
    rewards={
        Achievement({id=13691, criteria=45545}), -- Kill
        Achievement({id=13692, criteria=46087}), -- Intact Naga Skeleton
        Pet({id=2704, item=169370}) -- Scalebrood Hydra
    }
}) -- Scale Matriarch Gratinax

map.nodes[27193708] = Rare({
    id=152545,
    quest=56293,
    note=L["matriarch_note"],
    rewards={
        Achievement({id=13691, criteria=45546}), -- Kill
        Achievement({id=13692, criteria=46087}), -- Intact Naga Skeleton
        Pet({id=2704, item=169370}) -- Scalebrood Hydra
    }
}) -- Scale Matriarch Vynara

map.nodes[28604664] = Rare({
    id=152542,
    quest=56294,
    note=L["matriarch_note"],
    rewards={
        Achievement({id=13691, criteria=45547}), -- Kill
        Achievement({id=13692, criteria=46087}), -- Intact Naga Skeleton
        Pet({id=2704, item=169370}) -- Scalebrood Hydra
    }
}) -- Scale Matriarch Zodia

map.nodes[62740809] = Rare({
    id=152552,
    quest=56295,
    note=L["cave_spawn"],
    rewards={
        Achievement({id=13691, criteria=45548}), -- Kill
        Toy({item=170187}) -- Shadescale
    }, pois={
        POI({63081189}) -- Cave entrance
    }
}) -- Shassera

map.nodes[39601700] = Rare({
    id=153658,
    quest=56296,
    note=L["area_spawn"],
    rewards={
        Achievement({id=13691, criteria=45549}), -- Kill
        Achievement({id=13692, criteria={46090,46091}}) -- Voltscale Shield, Tidal Guard
    }
}) -- Shiz'narasz the Consumer

map.nodes[71365456] = Rare({
    id=152359,
    quest=56297,
    rewards={
        Achievement({id=13691, criteria=45550}), -- Kill
        Achievement({id=13692, criteria=46093}) -- Snapdragon Scent Gland
    }
}) -- Siltstalker the Packmother

map.nodes[60204740] = Rare({
    id=152290,
    quest=56298,
    note=L["cora_spawn"],
    rewards={
        Achievement({id=13691, criteria=45551}), -- Kill
        Achievement({id=13692, criteria=46096}), -- Fathom Ray Wing
        Mount({id=1257, item=169163}) -- Silent Glider
    },
    pois={
        POI({53804220, 54605020, 57605180, 58204140, 60204740, 62605960, 64805180})
    }
}) -- Soundless

map.nodes[62462964] = Rare({
    id=153898,
    quest=56122,
    note=L["tidelord_note"],
    rewards={
        Achievement({id=13691, criteria=45553}) -- Kill
    }
}) -- Tidelord Aquatus

map.nodes[57962648] = Rare({
    id=153928,
    quest=56123,
    note=L["tidelord_note"],
    rewards={
        Achievement({id=13691, criteria=45554}) -- Kill
    }
}) -- Tidelord Dispersius

map.nodes[65872243] = Rare({
    id=154148,
    quest=56106,
    note=L["tidemistress_note"],
    rewards={
        Achievement({id=13691, criteria=45555}), -- Kill
        Toy({item=170196}) -- Shirakess Warning Sign
    }
}) -- Tidemistress Leth'sindra

map.nodes[66964817] = Rare({
    id=152360,
    quest=56278,
    note=L["area_spawn"],
    rewards={
        Achievement({id=13691, criteria=45556}), -- Kill
        Achievement({id=13692, criteria=46094}) -- Alpha Fin
    }
}) -- Toxigore the Alpha

map.nodes[31282935] = Rare({
    id=152568,
    quest=56299,
    note=L["urduu_note"],
    rewards={
        Achievement({id=13691, criteria=45557}), -- Kill
        Achievement({id=13692, criteria={46088,46089}}), -- Ancient Reefwalker Bark, Reefwalker Bark
        Item({item=170184, weekly=57140}) -- Ancient Reefwalker Bark
    }
}) -- Urduu

map.nodes[67243458] = Rare({
    id=151719,
    quest=56300,
    note=L["voice_deeps_notes"],
    requires=ns.requirement.Item(168161),
    rewards={
        Achievement({id=13691, criteria=45558}), -- Kill
        Achievement({id=13692, criteria=46086}) -- Abyss Pearl
    }
}) -- Voice in the Deeps

map.nodes[48002427] = Rare({
    id=150468,
    quest=55603,
    note=L["vorkoth_note"],
    requires=ns.requirement.Item(167059),
    rewards={
        Pet({id=2709, item=169376}) -- Skittering Eel
    }
}) -- Vor'koth

-------------------------------------------------------------------------------
---------------------------------- ZONE RARES ---------------------------------
-------------------------------------------------------------------------------

local start = 09452400
local function coord(x, y)
    return start + x*2500000 + y*400
end

map.nodes[coord(0,0)] = Rare({
    id=152794,
    quest=56268,
    minimap=false,
    note=L["zone_spawn"],
    rewards={
        Achievement({id=13691, criteria=45521}), -- Kill
        Pet({id=2697, item=169363}) -- Amethyst Softshell
    }
}) -- Amethyst Spireshell

map.nodes[coord(1,0)] = Rare({
    id=152756,
    quest=56271,
    minimap=false,
    note=L["zone_spawn"],
    rewards={
        Achievement({id=13691, criteria=45529}), -- Kill
        Pet({id=2695, item=169361}) -- Daggertooth Frenzy
    }
}) -- Daggertooth Terror

map.nodes[coord(2,0)] = Rare({
    id=144644,
    quest=56274,
    minimap=false,
    note=L["zone_spawn"],
    rewards={
        Achievement({id=13691, criteria=45537}), -- Kill
        Achievement({id=13692, criteria=46098}), -- Brightspine Shell
        Pet({id=2700, item=169366}) -- Wriggler
    }
}) -- Mirecrawler

map.nodes[coord(0,1)] = Rare({
    id=150583,
    quest=56291,
    minimap=false,
    note=L["zone_spawn"]..' '..L["rockweed_note"],
    rewards={
        Achievement({id=13691, criteria=45542}), -- Kill
        Pet({id=2707, item=169374}) -- Budding Algan
    }
}) -- Rockweed Shambler

map.nodes[coord(1,1)] = Rare({
    id=151870,
    quest=56276,
    minimap=false,
    note=L["sandcastle_note"],
    requires=ns.requirement.Item(167077),
    rewards={
        Achievement({id=13691, criteria=45543}), -- Kill
        Pet({id=2703, item=169369}) -- Sandkeep
    }
}) -- Sandcastle

map.nodes[coord(2,1)] = Rare({
    id=152795,
    quest=56277,
    minimap=false,
    note=L["east_spawn"],
    rewards={
        Achievement({id=13691, criteria=45544}), -- Kill
        Achievement({id=13692, criteria=46099}), -- Giant Crab Leg
        Pet({id=2684, item=169350}) -- Glittering Diamondshell
    }
}) -- Sandclaw Stoneshell

-------------------------------------------------------------------------------
-------------------------------- TROVE TRACKER --------------------------------
-------------------------------------------------------------------------------

local Arcane = Class('ArcaneChest', Treasure, {
    label=L["arcane_chest"],
    rewards={
        Achievement({id=13549, criteria=1})
    }
})

local Glowing = Class('GlowingChest', Treasure, {
    icon='chest_bl',
    label=L["glowing_chest"],
    rewards={
        Achievement({id=13549, criteria=2})
    }
})

-- Arcane Chests
map.nodes[34454040] = Arcane({quest=55954, note=L["arcane_chest_01"]})
map.nodes[49576450] = Arcane({quest=55949, note=L["arcane_chest_02"]})
map.nodes[85303860] = Arcane({quest=55938, note=L["arcane_chest_03"]})
map.nodes[37906050] = Arcane({quest=55957, note=L["arcane_chest_04"]})
map.nodes[79502720] = Arcane({quest=55942, note=L["arcane_chest_05"]})
map.nodes[44704890] = Arcane({quest=55947, note=L["arcane_chest_06"]})
map.nodes[34604360] = Arcane({quest=55952, note=L["arcane_chest_07"]})
map.nodes[26003240] = Arcane({quest=55953, note=L["arcane_chest_08"]})
map.nodes[50605000] = Arcane({quest=55955, note=L["arcane_chest_09"]})
map.nodes[64303330] = Arcane({quest=55943, note=L["arcane_chest_10"]})
map.nodes[52804980] = Arcane({quest=55945, note=L["arcane_chest_11"]})
map.nodes[48508740] = Arcane({quest=55951, note=L["arcane_chest_12"]})
map.nodes[43405820] = Arcane({quest=55948, note=L["arcane_chest_13"]})
map.nodes[73203580] = Arcane({quest=55941, note=L["arcane_chest_14"]})
map.nodes[80402980] = Arcane({quest=55939, note=L["arcane_chest_15"]})
map.nodes[58003500] = Arcane({quest=55946, note=L["arcane_chest_16"]})
map.nodes[74805320] = Arcane({quest=55940, note=L["arcane_chest_17"]})
map.nodes[39804920] = Arcane({quest=55956, note=L["arcane_chest_18"]})
map.nodes[38707440] = Arcane({quest=55950, note=L["arcane_chest_19"]})
map.nodes[56303380] = Arcane({quest=55944, note=L["arcane_chest_20"]})

-- Glowing Arcane Chests
map.nodes[37900640] = Glowing({quest=55959, note=L["glowing_chest_1"]})
map.nodes[43951693] = Glowing({quest=55963, note=L["glowing_chest_2"]})
map.nodes[24803520] = Glowing({quest=56912, note=L["glowing_chest_3"]})
map.nodes[55701450] = Glowing({quest=55961, note=L["glowing_chest_4"]})
map.nodes[61402290] = Glowing({quest=55958, note=L["glowing_chest_5"]})
map.nodes[64102860] = Glowing({quest=55962, note=L["glowing_chest_6"]})
map.nodes[37201920] = Glowing({quest=55960, note=L["glowing_chest_7"]})
map.nodes[80493194] = Glowing({quest=56547, note=L["glowing_chest_8"]})

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

local NazSupply = Class('NazSupply', Supply, {
    quest=56792,
    rewards={
        Achievement({id=13720, criteria={
            {id=45790, suffix=L["assassin_looted"]}
        }}),
        ns.reward.Spacer(),
        Achievement({id=12572})
    }
})

map.nodes[45237040] = NazSupply({ fgroup='supply_path_1', pois={Arrow({50502245, 44008159})} }) -- south of newhome
map.nodes[47285170] = NazSupply({ fgroup='supply_path_1' }) -- south basin
map.nodes[47864647] = NazSupply({ fgroup='supply_path_1' }) -- north basin
map.nodes[33493889] = NazSupply({ fgroup='supply_path_2', pois={Arrow({83003672, 25003926})} }) -- ashen strand (also 33283441?)
map.nodes[59663755] = NazSupply({ fgroup='supply_path_2' }) -- coral forest
map.nodes[76873699] = NazSupply({ fgroup='supply_path_2' }) -- zin-azshari

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[34702740] = PetBattle({
    id=154910,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45467})
    }
}) -- Prince Wiggletail

map.nodes[71905110] = PetBattle({
    id=154911,
    rewards={
        Achievement({id=13626, criteria=45468})
    }
}) -- Chomp

map.nodes[58304810] = PetBattle({
    id=154912,
    rewards={
        Achievement({id=13626, criteria=45469})
    }
}) -- Silence

map.nodes[42201400] = PetBattle({
    id=154913,
    rewards={
        Achievement({id=13626, criteria=45470})
    }
}) -- Shadowspike Lurker

map.nodes[50605030] = PetBattle({
    id=154914,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45471})
    }
}) -- Pearlhusk Crawler

map.nodes[51307500] = PetBattle({
    id=154915,
    rewards={
        Achievement({id=13626, criteria=45472})
    }
}) -- Elderspawn of Nalaada

map.nodes[29604970] = PetBattle({
    id=154916,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45473})
    }
}) -- Ravenous Scalespawn

map.nodes[56400810] = PetBattle({
    id=154917,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45474})
    }
}) -- Mindshackle

map.nodes[46602800] = PetBattle({
    id=154918,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45475})
    },
}) -- Kelpstone

map.nodes[37501670] = PetBattle({
    id=154919,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45476})
    }
}) -- Voltgorger

map.nodes[61472290] = PetBattle({
    id=154920,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45477})
    }
}) -- Frenzied Knifefang

map.nodes[28102670] = PetBattle({
    id=154921,
    note=L["in_cave"],
    rewards={
        Achievement({id=13626, criteria=45478})
    }
}) -- Giant Opaline Conch

-------------------------------------------------------------------------------
------------------------------------ SLIMES -----------------------------------
-------------------------------------------------------------------------------

local SLIME_PETS = {
    Pet({id=2762, item=167809}), -- Slimy Darkhunter
    Pet({id=2758, item=167808}), -- Slimy Eel
    Pet({id=2761, item=167807}), -- Slimy Fangtooth
    Pet({id=2763, item=167810}), -- Slimy Hermit Crab
    Pet({id=2760, item=167806}), -- Slimy Octopode
    Pet({id=2757, item=167805}), -- Slimy Otter
    Pet({id=2765, item=167804})  -- Slimy Sea Slug
}

local Slime = Class('RavenousSlime', NPC, {
    id=151782,
    icon=132107,
    group=ns.groups.SLIMES_NAZJ,
    questAny=true,
    note=L["ravenous_slime_note"],
    requires=ns.requirement.Item(167893),
    rewards=SLIME_PETS
})

local Cocoon = Class('SlimyCocoon', Node, {
    icon=132833,
    group=ns.groups.SLIMES_NAZJ,
    label=L["slimy_cocoon"],
    note=L["slimy_cocoon_note"],
    rewards=SLIME_PETS
})

-- first quest is daily, second quest means done and gone until weekly reset
map.nodes[32773951] = Slime({quest={55430,55473}})
map.nodes[45692409] = Slime({quest={55429,55472}})
map.nodes[54894868] = Slime({quest={55427,55470}})
map.nodes[71722569] = Slime({quest={55428,55471}})

-- once the second quest is true, the eggs should be displayed
map.nodes[32773952] = Cocoon({quest=55478, questDeps=55473})
map.nodes[45692410] = Cocoon({quest=55477, questDeps=55472})
map.nodes[54894869] = Cocoon({quest=55475, questDeps=55470})
map.nodes[71722570] = Cocoon({quest=55476, questDeps=55471})

-------------------------------------------------------------------------------
-------------------------------- CAT FIGURINES --------------------------------
-------------------------------------------------------------------------------

local Figurine = Class('CatFigurine', Collectible, {
    icon=454045,
    group=ns.groups.CATS_NAZJ,
    label=L["cat_figurine"],
    rewards={
        Achievement({id=13836, criteria={
            {id=1, qty=true, suffix=L["figurines_found"]}
        }})
    }
})

map.nodes[28752910] = Figurine({quest=56983, note=L["cat_figurine_01"]})
map.nodes[71342369] = Figurine({quest=56988, note=L["cat_figurine_02"]})
map.nodes[73582587] = Figurine({quest=56992, note=L["cat_figurine_03"]})
map.nodes[58212198] = Figurine({quest=56990, note=L["cat_figurine_04"]})
map.nodes[61092681] = Figurine({quest=56984, note=L["cat_figurine_05"]})
map.nodes[40168615] = Figurine({quest=56987, note=L["cat_figurine_06"]})
map.nodes[59093053] = Figurine({quest=56985, note=L["cat_figurine_07"]})
map.nodes[55362715] = Figurine({quest=56986, note=L["cat_figurine_08"]})
map.nodes[61641079] = Figurine({quest=56991, note=L["cat_figurine_09"]})
map.nodes[38004925] = Figurine({quest=56989, note=L["cat_figurine_10"]})

-------------------------------------------------------------------------------
-------------------------------- MISCELLANEOUS --------------------------------
-------------------------------------------------------------------------------

map.nodes[60683221] = Node({
    quest=55121,
    group=ns.groups.MISC_NAZJ,
    icon="portal_b",
    scale=1.5,
    label=L["mardivas_lab"],
    rewards={
        Achievement({id=13699, criteria={ -- Periodic Destruction
            {id=45678, note=' ('..L["no_reagent"]..')'}, -- Arcane Amalgamation
            {id=45679, note=' ('..L["swater"]..')'}, -- Watery Amalgamation
            {id=45680, note=' ('..L["sfire"]..')'}, -- Burning Amalgamation
            {id=45681, note=' ('..L["searth"]..')'}, -- Dusty Amalgamation
            {id=45682, note=' ('..L["swater"].." + "..L["gearth"]..')'}, -- Zomera
            {id=45683, note=' ('..L["swater"].." + "..L["gfire"]..')'}, -- Omus
            {id=45684, note=' ('..L["swater"].." + "..L["gwater"]..')'}, -- Osgen
            {id=45685, note=' ('..L["sfire"].." + "..L["gearth"]..')'}, -- Moghiea
            {id=45686, note=' ('..L["sfire"].." + "..L["gwater"]..')'}, -- Xue
            {id=45687, note=' ('..L["sfire"].." + "..L["gfire"]..')'}, -- Ungormath
            {id=45688, note=' ('..L["searth"].." + "..L["gwater"]..')'}, -- Spawn of Salgos
            {id=45689, note=' ('..L["searth"].." + "..L["gearth"]..')'}, -- Herald of Salgos
            {id=45690, note=' ('..L["searth"].." + "..L["gfire"]..')'} -- Salgos the Eternal
        }}),
        Item({item=170477, note=L["Arcane"]}), -- Mardivas's Universally Lauded Tote
        Transmog({item=170138, slot=L["offhand"], note=L["Watery"]}), -- Scroll of Violent Tides
        Transmog({item=170126, slot=L["bow"], note=L["Burning"]}), -- Igneous Longbow
        Transmog({item=170383, slot=L["shield"], note=L["Dusty"]}), -- Coralspine Bulwark
        Transmog({item=170137, slot=L["dagger"], note=L["Zomera"]}), -- Azerite-Infused Crystal Flayer
        Transmog({item=170132, slot=L["1h_sword"], note=L["Omus"]}), -- Slicer of Omus
        Transmog({item=170130, slot=L["warglaive"], note=L["Osgen"]}), -- Glaive of Swells
        Transmog({item=170128, slot=L["staff"], note=L["Moghiea"]}), -- Majestic Shirakess Greatstaff
        Transmog({item=170127, slot=L["polearm"], note=L["Xue"]}), -- Pyroclastic Halberd
        Transmog({item=170131, slot=L["wand"], note=L["Ungormath"]}), -- Tidal Wand of Malevolence
        Transmog({item=170124, slot=L["2h_sword"], note=L["Spawn"]}), -- Coral-Sharpened Greatsword
        Transmog({item=170125, slot=L["fist"], note=L["Herald"]}), -- Behemoth Claw of the Abyss
        Transmog({item=170129, slot=L["1h_mace"], note=L["Salgos"]}) -- Salgos' Volatile Basher
    }
})

map.nodes[45993245] = NPC({
    id=152593,
    icon=528288,
    group=ns.groups.MISC_NAZJ,
    note=L["tentacle_taco"]
})


-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Transmog = ns.reward.Transmog

local Arrow = ns.poi.Arrow
local POI = ns.poi.POI
local Path = ns.poi.Path

-------------------------------------------------------------------------------

local map = Map({ id=863, settings=true })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[67792946] = Rare({
    id=125250,
    quest=48063,
    rewards={
        Achievement({id=12942, criteria=41440}),
        Item({item=161113, note=L["trinket"]}) -- Incessently Ticking Clock
    }
}) -- Ancient Jawbreaker

map.nodes[54128110] = Rare({
    id=134298,
    quest=50569,
    rewards={
        Achievement({id=12942, criteria=41444})
    }
}) -- Azerite-Infused Elemental

map.nodes[33122699] = Rare({
    id=134293,
    quest=50563,
    rewards={
        Achievement({id=12942, criteria=41447}),
        Transmog({item=161100, slot=L["mail"]}) -- Fused-Slag Girdle
    }
}) -- Azerite-Infused Slag

map.nodes[42836053] = Rare({
    id=126142,
    quest=48439,
    rewards={
        Achievement({id=12942, criteria=41466}),
        Transmog({item=161093, slot=L["leather"]}) -- Clutch Mother Wristwraps
    }
}) -- Bajiatha

map.nodes[43199131] = Rare({
    id=126635,
    quest=48541,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12942, criteria=41448}),
        Transmog({item=161217, slot=L["mail"]}) -- Tainted Blood Vambraces
    }
}) -- Blood Priest Xak'lar

map.nodes[81833057] = Rare({
    id=125232,
    quest=48057,
    note=L["captain_mukala_note"],
    rewards={
        Achievement({id=12942, criteria=41454}),
        Item({item=161115, note=L["trinket"]}) -- Cursed Captain's Charm
    }
}) -- Captain Mu'kala

map.nodes[41315343] = Rare({
    id=126187,
    quest=48462,
    rewards={
        Achievement({id=12942, criteria=41453}),
        Transmog({item=161102, slot=L["mail"]}) -- Corpseblood Belt
    }
}) -- Corpse Bringer Yal'kar

map.nodes[81696105] = Rare({
    id=134294,
    quest=50565,
    note=L["enraged_water_note"],
    rewards={
        Achievement({id=12942, criteria=41464}),
        Transmog({item=161045, slot=L["cloth"]}) -- Scrollbound Hurricane Slippers
    }
}) -- Enraged Water Elemental

map.nodes[68595720] = Rare({
    id=121242,
    quest=50361,
    rewards={
        Achievement({id=12942, criteria=41456}),
        Item({item=160985, note=L["ring"]}) -- Glompmaw's Ring
    }
}) -- Glompmaw

map.nodes[32754304] = Rare({
    id=128426,
    quest=49231,
    rewards={
        Achievement({id=12942, criteria=41457}),
        Transmog({item=161041, slot=L["plate"]}) -- Gutrip's Tramplers
    }
}) -- Gutrip

map.nodes[33788600] = Rare({
    id=127001,
    quest=48638,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12942, criteria=41455}),
        Transmog({item=162614, slot=L["cloth"]}) -- Gwugnug's Cursed Wraps
    }
}) -- Gwugnug the Cursed

map.nodes[24407796] = Rare({
    id=124399,
    quest=47877,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12942, criteria=41459}),
        Transmog({item=161218, slot=L["leather"]}) -- Direhorn Studded Belt
    }
}) -- Infected Direhorn

map.nodes[45185189] = Rare({
    id=133373,
    quest=50307,
    rewards={
        Achievement({id=12942, criteria=41460}),
        Transmog({item=160969, slot=L["1h_sword"]}) -- Reanimated Necromancer's Blade
    }
}) -- Jax'teb the Reanimated

map.nodes[28103401] = Rare({
    id=133527,
    quest=50342,
    rewards={
        Achievement({id=12942, criteria=41461}),
        Transmog({item=160950, slot=L["2h_axe"]}) -- Nicked Nazmani Greataxe
    }
}) -- Juba the Scarred

map.nodes[52921315] = Rare({
    id=124397,
    quest=47843,
    rewards={
        Achievement({id=12942, criteria=41462}),
        Transmog({item=161018, slot=L["cloth"]}) -- Winged Terror Wristwraps
    }
}) -- Kal'draxa

map.nodes[53414283] = Rare({
    id=129005,
    quest=49317,
    rewards={
        Achievement({id=12942, criteria=41451}),
        Transmog({item=161221, slot=L["leather"]}) -- Jungle King Mudtossers
    }
}) -- King Kooba

map.nodes[75703593] = Rare({
    id=125214,
    quest=48052,
    rewards={
        Achievement({id=12942, criteria=41463}),
        Transmog({item=161110, slot=L["plate"]}) -- Crusty Chitin Armguards
    }
}) -- Krubbs

map.nodes[77754508] = Rare({
    id=133539,
    quest=50355,
    rewards={
        Achievement({id=12942, criteria=41478}),
        Transmog({item=161111, slot=L["plate"]}) -- Marshqueen's Crushers
    }
}) -- Lo'kuno

map.nodes[68102023] = Rare({
    id=134296,
    quest=50567,
    note=L["lucille_note"],
    rewards={
        Achievement({id=12942, criteria=41452}),
        Transmog({item=161046, slot=L["cloth"]}) -- Scrollbound Arachnid Gloves
    }
}) -- Lucille

map.nodes[53125429] = Rare({
    id=128930,
    label='{npc:128935} and {npc:128930}',
    quest=50040,
    rewards={
        Achievement({id=12942, criteria=41479}),
        Item({item=163703, note=L["trinket"]}) -- Crawg Gnawed Femur
    }
}) -- Mala'kili and Rohnkor

map.nodes[57726770] = Rare({
    id=128974,
    quest=49312,
    rewards={
        Achievement({id=12942, criteria=41458}),
        Transmog({item=160963, slot=L["polearm"]}) -- Blood Jungle Stinger
    }
}) -- Queen Tzxi'kik

map.nodes[59133878] = Rare({
    id=127820,
    quest=48972,
    rewards={
        Achievement({id=12942, criteria=41467}),
        Transmog({item=160951, slot=L["bow"]}) -- Evergreen Scout's Bow
    }
}) -- Scout Skrasniss

map.nodes[58070893] = Rare({
    id=127873,
    quest=48980,
    rewards={
        Achievement({id=12942, criteria=41468}),
        Transmog({item=161219, slot=L["leather"]}) -- Raptor Patriarch Gloves
    }
}) -- Scrounger Patriarch

map.nodes[29165577] = Rare({
    id=124475,
    quest=47878,
    note=L["shambling_ambusher_note"]
}) -- Shambling Ambusher

map.nodes[31443815] = Rare({
    id=126460,
    quest=48508,
    rewards={
        Achievement({id=12942, criteria=41469}),
        Transmog({item=162621, slot=L["plate"]}) -- Nazmani Golem's Greathelm
    }
}) -- Tainted Guardian

map.nodes[49423768] = Rare({
    id=126056,
    quest=48406,
    rewards={
        Achievement({id=12942, criteria=41470}),
        Transmog({item=162618, slot=L["mail"]}) -- Totem Matriarch's Headdress
    }
}) -- Totem Maker Jash'ga

map.nodes[38095768] = Rare({
    id=135565,
    quest=50888,
    rewards={
        Achievement({id=12942, criteria=41472})
    }
}) -- Urn of Agussu

map.nodes[44224873] = Rare({
    id=128965,
    quest=49305,
    rewards={
        Achievement({id=12942, criteria=41450}),
        Transmog({item=161094, slot=L["leather"]}) -- Voodoo-Bound Handwraps
    }
}) -- Uroku the Bound

map.nodes[29535070] = Rare({
    id=126926,
    quest=48626,
    rewards={
        Achievement({id=12942, criteria=41473}),
        Transmog({item=161028, slot=L["leather"]}) -- Noxious Crocolisk Trousers
    }
}) -- Venomjaw

map.nodes[48985082] = Rare({
    id=126907,
    quest=48623,
    rewards={
        Achievement({id=12942, criteria=41474}),
        Transmog({item=160961, slot=L["2h_mace"]}) -- Warmother's Mace
    }
}) -- Wardrummer Zurula

map.nodes[36555053] = Rare({
    id=133531,
    quest=50348,
    rewards={
        Achievement({id=12942, criteria=41475}),
        Transmog({item=162619, slot=L["mail"]}) -- Bone Collector's Chestcage
    }
}) -- Xu'ba

map.nodes[38782676] = Rare({
    id=129657,
    quest=49469,
    note=L["zaamar_note"],
    rewards={
        Achievement({id=12942, criteria=41476}),
        Transmog({item=161095, slot=L["leather"]}) -- Queensguard Specter Legwraps
    },
    pois={
        POI({38772885}) -- Entrance
    }
}) -- Za'amar the Queen's Blade

map.nodes[38737146] = Rare({
    id=133812,
    quest=50423,
    rewards={
        Achievement({id=12942, criteria=41477}),
        Transmog({item=161092, slot=L["leather"]}) -- Rivermarsh Quickclaw Buckle
    }
}) -- Zanxib

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- 30604919 50894
-- 37112743 49913
-- 42275915 49916
-- 48833623 49914
-- 79535700 50893

-------------------------------------------------------------------------------

map.nodes[35638560] = Treasure({
    quest=49885,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12771, criteria=40860})
    }
}) -- "Cleverly" Disguised Chest

map.nodes[43065078] = Treasure({
    quest=49979,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12771, criteria=40859})
    }
}) -- Cursed Nazmani Chest

map.nodes[62103487] = Treasure({
    quest=49891,
    note=L["in_water_cave"],
    rewards={
        Achievement({id=12771, criteria=40861})
    }
}) -- Lost Nazmani Treasure

map.nodes[77683613] = Treasure({
    quest=49867,
    rewards={
        Achievement({id=12771, criteria=40857})
    }
}) -- Lucky Horace's Lucky Chest

map.nodes[42772620] = Treasure({
    quest=49484,
    note=L["offering_to_bwonsamdi_note"],
    rewards={
        Achievement({id=12771, criteria=40862})
    }
}) -- Offering to Bwonsamdi

map.nodes[77884635] = Treasure({
    quest=50061,
    rewards={
        Achievement({id=12771, criteria=40858})
    }
}) -- Partially-Digested Treasure

map.nodes[66791735] = Treasure({
    quest=49483,
    rewards={
        Achievement({id=12771, criteria=40863})
    }
}) -- Shipwrecked Chest

map.nodes[76876214] = Treasure({
    quest=50045,
    rewards={
        Achievement({id=12771, criteria=40865})
    }
}) -- Swallowed Naga Chest

map.nodes[46228295] = Treasure({
    quest=49889,
    rewards={
        Achievement({id=12771, criteria=40864})
    }
}) -- Venomous Seal

map.nodes[35455498] = Treasure({
    quest=49313,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12771, criteria=40866})
    }
}) -- Wunja's Trove

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55387,
    rewards={
        Achievement({id=13317, criteria=43932})
    }
}) -- quest = 54717 (looted ever) 55387 (looted today)

map.nodes[60201010] = SECRET_CHEST
map.nodes[68691305] = SECRET_CHEST
map.nodes[78901850] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[50311187] = Supply({
    quest=55409,
    fgroup='supply_path_1'
})
map.nodes[50332663] = Supply({
    quest=55409,
    fgroup='supply_path_1'
})
map.nodes[50366990] = Supply({
    quest=55409,
    fgroup='supply_path_1',
    pois={Arrow({50378151, 50310587})}
})

map.nodes[54474113] = Supply({
    quest=55409,
    note=L["supply_chest_note"]..'\n\n'..L["supply_single_drop"],
    pois={Arrow({65002685, 40006081})}
}) -- 54144160 54214151 54584099

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[46657384] = PetBattle({
    id=141588,
    rewards={
        Achievement({id=12936, criteria=44222})
    }
}) -- Crawg in the Bog (Bloodtusk)

map.nodes[35935460] = PetBattle({
    id=141799,
    note=L["grady_prett_note"],
    rewards={
        Achievement({id=12936, criteria=44223}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=12, oneline=true}), -- Beast
        Achievement({id=13271, criteria=12, oneline=true}), -- Critter
        Achievement({id=13272, criteria=12, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=12, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=12, oneline=true}), -- Flying
        Achievement({id=13275, criteria=12, oneline=true}), -- Magic
        Achievement({id=13277, criteria=12, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=12, oneline=true}), -- Undead
        Achievement({id=13280, criteria=12, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=12, oneline=true})  -- Humanoid
    }
}) -- Pack Leader (Grady Prett)

map.nodes[43003880] = PetBattle({
    id=141814,
    note=L["korval_dark_note"],
    rewards={
        Achievement({id=12936, criteria=44224}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=13, oneline=true}), -- Beast
        Achievement({id=13271, criteria=13, oneline=true}), -- Critter
        Achievement({id=13272, criteria=13, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=13, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=13, oneline=true}), -- Flying
        Achievement({id=13275, criteria=13, oneline=true}), -- Magic
        Achievement({id=13277, criteria=13, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=13, oneline=true}), -- Undead
        Achievement({id=13280, criteria=13, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=13, oneline=true})  -- Humanoid
    }
}) -- Accidental Dread (Korval Darkbeard)

map.nodes[72864859] = PetBattle({
    id=141529,
    note=L["lozu_note"],
    rewards={
        Achievement({id=12936, criteria=44221}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=11, oneline=true}), -- Beast
        Achievement({id=13271, criteria=11, oneline=true}), -- Critter
        Achievement({id=13272, criteria=11, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=11, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=11, oneline=true}), -- Flying
        Achievement({id=13275, criteria=11, oneline=true}), -- Magic
        Achievement({id=13277, criteria=11, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=11, oneline=true}), -- Undead
        Achievement({id=13280, criteria=11, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=11, oneline=true})  -- Humanoid
    }
}) -- Marshdwellers (Lozu)

-------------------------------------------------------------------------------
------------------------------- A LOA OF A TALE -------------------------------
-------------------------------------------------------------------------------

map.nodes[39123865] = Collectible({
    quest=53534,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_bwonsamdi_note"],
    rewards={
        Achievement({id=13036, criteria=41565})
    }
}) -- Tales of de Loa: Bwonsamdi

map.nodes[39575467] = Collectible({
    quest=53537,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_hireek_note"],
    rewards={
        Achievement({id=13036, criteria=41568})
    }
}) -- Tales of de Loa: Hir'eek

map.nodes[58924865] = Collectible({
    quest=53540,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_kragwa_note"],
    rewards={
        Achievement({id=13036, criteria=41571})
    }
}) -- Tales of de Loa: Krag'wa

map.nodes[72850760] = Collectible({
    quest=53547,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note= L["tales_torga_note"],
    rewards={
        Achievement({id=13036, criteria=41579})
    }
}) -- Tales of de Loa: Torga

-------------------------------------------------------------------------------
----------------------------- BOW TO YOUR MASTERS -----------------------------
-------------------------------------------------------------------------------

map.nodes[39562460] = Collectible({
    id=122688,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41525})
    }
}) -- Bwonsamdi

map.nodes[75495684] = Collectible({
    id=120551,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41495})
    }
}) -- Krag'wa

-------------------------------------------------------------------------------
---------------------- CARVED IN STONE, WRITTEN IN BLOOD ----------------------
-------------------------------------------------------------------------------

local CarvedInStone = Class('CarvedInStone', Collectible, {
    icon=134424,
    group=ns.groups.CARVED_IN_STONE
})

map.nodes[56355736] = CarvedInStone({
    note=L["carved_in_stone_41860"],
    rewards={
        Achievement({id=13024, criteria=41860})
    }
})  -- Ancient Nazmani Tablet

map.nodes[43354811] = CarvedInStone({
    note=L["carved_in_stone_41861"],
    rewards={
        Achievement({id=13024, criteria=41861})
    }
})  -- Weathered Nazmani Tablet

map.nodes[51278510] = CarvedInStone({
    note=L["carved_in_stone_41862"],
    rewards={
        Achievement({id=13024, criteria=41862})
    }
})  -- Cracked Tablet

map.nodes[42555710] = CarvedInStone({
    note=L["carved_in_stone_42116"],
    rewards={
        Achievement({id=13024, criteria=42116})
    }
})  -- Fractured Tablet

-------------------------------------------------------------------------------
-------------------- EATING OUT OF THE PALM OF MY TINY HAND -------------------
-------------------------------------------------------------------------------

map.nodes[32403510] = Collectible({
    icon=1881827,
    group=ns.groups.BRUTOSAURS,
    note=L["goramor_note"],
    rewards={
        Achievement({id=13029, criteria=41575})
    },
    pois={
        POI({34605494}) -- Blind Wunja Cave
    }
}) -- Goramor

-------------------------------------------------------------------------------
--------------------------------- HOPPIN' SAD ---------------------------------
-------------------------------------------------------------------------------

local HoppinSad = Class('HoppinSad', Collectible, {
    id=143317,
    icon=804969,
    group=ns.groups.HOPPIN_SAD,
    rewards={
        Achievement({id=13028, criteria={id=1, qty=true}})
    }
})

map.nodes[69575866] = HoppinSad({quest=53417, note=L["in_water_cave"]})
map.nodes[65575093] = HoppinSad({quest=53418, note=L["in_water_cave"]})
map.nodes[56026506] = HoppinSad({quest=53419, note=L["hoppin_sad_53419"]})
map.nodes[52834285] = HoppinSad({quest=53420, note=L["hoppin_sad_53420"]})
map.nodes[34156191] = HoppinSad({quest=53421, note=L["in_small_cave"]})
map.nodes[44629278] = HoppinSad({quest=53422, note=L["in_waterfall_cave"], pois={POI({45379127})}})
map.nodes[28898316] = HoppinSad({quest=53423, note=L["in_small_cave"]})
map.nodes[24179172] = HoppinSad({quest=53424, note=L["hoppin_sad_53424"]})
map.nodes[21866934] = HoppinSad({quest=53425, note=L["hoppin_sad_53425"]})
map.nodes[25674057] = HoppinSad({quest=53426, note=L["hoppin_sad_53426"]})

-------------------------------------------------------------------------------
---------------------------------- GET HEK'D ----------------------------------
-------------------------------------------------------------------------------

map.nodes[68533283] = Collectible({
    quest=50440,
    icon=1604165,
    note=L["nazwathan_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40043})
    }
}) -- Naz'wathan Relic (157802)

map.nodes[34007510] = Collectible({
    quest=50437,
    icon=1604165,
    note=L["snapjaw_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40042})
    }
}) -- Snapjaw Tail (157801)

map.nodes[54007410] = Collectible({
    quest=50444,
    icon=1604165,
    note=L["loa_road_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40044})
    }
}) -- Taking the Loa Road

map.nodes[80904680] = Collectible({
    quest=50435,
    icon=1604165,
    note=L["vilescale_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40041})
    }
}) -- Vilescale Pearl (157797)

-------------------------------------------------------------------------------
------------------------- LIFE FINDS A WAY... TO DIE! -------------------------
-------------------------------------------------------------------------------

map.nodes[24507282] = Collectible({
    icon=236192,
    group=ns.groups.LIFE_FINDS_A_WAY,
    id=143898,
    rewards={
        Achievement({id=13048, criteria=41683})
    },
    pois={
        Path({23627079, 24507282, 25407490, 25977537, 26687500, 26577351, 25797109, 25347037, 24436965, 23706943, 23496991, 23627079})
    }
}) -- Makatau

-------------------------------------------------------------------------------
------------------------------ MUSHROOM HARVEST -------------------------------
-------------------------------------------------------------------------------

map.nodes[52367026] = Collectible({
    id=143316,
    icon=1869654,
    group=ns.groups.MUSHROOM_HARVEST,
    rewards={
        Achievement({id=13027, criteria=41390})
    }
}) -- Skullcap

map.nodes[73634868] = Collectible({
    id=143311,
    icon=1869654,
    note=L["in_small_cave"],
    group=ns.groups.MUSHROOM_HARVEST,
    rewards={
        Achievement({id=13027, criteria=41393})
    }
}) -- Toadcruel

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[40205880] = ToAlltheSquirrels({
    id=131017,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50244})
    },
    pois={
        POI({42607180, 37206480, 36605180})
    }
}) -- Bloodfever Tarantula

map.nodes[49906630] = ToAlltheSquirrels({
    id=130217,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50245})
    },
    pois={
        POI({47806760, 44006370, 44005450})
    }
}) -- Nazmani Weevil

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local NPC = ns.node.NPC
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Pet = ns.reward.Pet
local Spell = ns.reward.Spell
local Transmog = ns.reward.Transmog

local Arrow = ns.poi.Arrow
local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=942, settings=true })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[29466960] = Rare({
    id=137025,
    quest=51298,
    note=L["in_basement"],
    rewards={
        Achievement({id=12940, criteria=41760}),
        Transmog({item=160470, slot=L["mail"]}) -- Broodcrawler Wristguards
    }
}) -- Broodmother

map.nodes[47316566] = Rare({
    id=130897,
    quest=50170,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12940, criteria=41818}),
        Transmog({item=155287, slot=L["2h_mace"]}) -- Razorspine's Greatmace
    }
}) -- Captain Razorspine

map.nodes[67045019] = Rare({
    id=139968,
    quest=52121,
    rewards={
        Achievement({id=12940, criteria=41777}),
        Transmog({item=154183, slot=L["mail"]}), -- Boralus-Captain's Chain Boots
        Item({item=162028}) -- Technique: Glyph of the Tideskipper
    },
    pois={
        Path({68484774, 67045019, 66405078, 65965167})
    }
}) -- Corrupted Tideskipper

map.nodes[62923283] = Rare({
    id=140938,
    quest=52303,
    rewards={
        Achievement({id=12940, criteria=41776}),
        Transmog({item=154460, slot=L["mail"]}) -- Treasure-Seeker's Diving Helmet
    }
}) -- Croaker

map.nodes[51245553] = Rare({
    id=136183,
    quest=52466,
    rewards={
        Achievement({id=12940, criteria=41778}),
        Item({item=154857, note=L["ring"]}) -- Bonesplinter Band
    }
}) -- Crushtacean

map.nodes[67863982] = Rare({
    id=134897,
    quest=50731,
    rewards={
        Achievement({id=12940, criteria=43470}),
        Transmog({item=160476, slot=L["plate"]}) -- Fogtide Warboots
    }
}) -- Dagrus the Scorned

map.nodes[52725161] = Rare({
    id=139385,
    quest=50692,
    rewards={
        Achievement({id=12940, criteria=41775}),
        Transmog({item=160464, slot=L["leather"]}) -- Dire Hill Wolfsteppers
    },
    pois={
        Path({52725161, 53035099, 53055058, 53365060})
    }
}) -- Deepfang

map.nodes[53446443] = Rare({
    id=140925,
    quest=52323,
    note=L["in_basement"],
    faction='Horde',
    rewards={
        Achievement({id=12940, criteria=34}),
        Transmog({item=154453, slot=L["leather"]}) -- Doc's Air-Cushioned Boots
    }
}) -- Doc Marrtens

map.nodes[64426592] = Rare({
    id=131404,
    quest=49951,
    rewards={
        Achievement({id=12940, criteria=41765}),
        Transmog({item=160471, slot=L["mail"]}) -- Foreman's Stability Belt
    }
}) -- Foreman Scripps

map.nodes[71445435] = Rare({
    id=132007,
    quest=50075,
    rewards={
        Achievement({id=12940, criteria=41761}),
        Item({item=155568, note=L["trinket"]}) -- Galewind Chimes
    }
}) -- Galestorm

map.nodes[62067386] = Rare({
    id=141059,
    quest=52329,
    rewards={
        Achievement({id=12940, criteria=41774}),
        Transmog({item=155572, slot=L["cloak"]}) -- Yeti-Rager's Cloak
    }
}) -- Grimscowl the Harebrained

map.nodes[35207780] = Rare({
    id=141226,
    quest=52460,
    rewards={
        Achievement({id=12940, criteria=41815}),
        Transmog({item=154273, slot=L["plate"]}) -- Rockstopper Breastplate
    }
}) -- Haegol the Hammer

map.nodes[60651775] = Rare({
    id=154154,
    quest=57674, -- 57726
    rewards={
        Pet({id=2794, item=172493}), -- Snarling Butterfly Crate
        Spell({item=172405, spell=309328, class='SHAMAN'}) -- Tome of Hex: Living Honey
    },
    pois={
        Path({
            60651775, 61051679, 61571590, 61961535, 62471589, 62761672,
            61921703, 61381769, 60871816, 60651775, 60001753, 59321683,
            59201758, 59161817, 59641817, 60401874, 60941896, 61011843,
            60871816
        })
    }
}) -- Honey Smasher

map.nodes[63538357] = Rare({
    id=141039,
    quest=52327,
    rewards={
        Achievement({id=12940, criteria=41817}),
        Transmog({item=154464, slot=L["mail"]}) -- Frozen Heart Legguards
    }
}) -- Ice Sickle

map.nodes[53606420] = Rare({
    id=141043,
    quest=52324,
    note=L["in_basement"]..' '..L["jakala_note"],
    faction='Alliance',
    rewards={
        Achievement({id=12940, criteria=34}),
        Transmog({item=159179, slot=L["leather"]}) -- Headtaker's Helm
    }
}) -- Jakala the Cruel

map.nodes[31266167] = Rare({
    id=141029,
    quest=52318,
    rewards={
        Achievement({id=12940, criteria=41763}),
        Transmog({item=154475, slot=L["cloth"]}) -- Goathair Bindings
    }
}) -- Kickers

map.nodes[43454499] = Rare({
    id=138963,
    quest=51762,
    note=L["nestmother_acada_note"],
    rewards={
        Achievement({id=12940, criteria=41844}),
        Transmog({item=160458, slot=L["cloth"]}) -- Ancient Featherlight Slippers
    }
}) -- Nestmother Acada

map.nodes[42266324] = Rare({
    id=141239,
    quest=52461,
    rewards={
        Achievement({id=12940, criteria=41845}),
        Transmog({item=159169, slot=L["leather"]}) -- Bloody Bearhide Pants
    }
}) -- Osca the Bloodied

map.nodes[38815101] = Rare({
    id=139298,
    quest=51959,
    rewards={
        Achievement({id=12940, criteria=41772}),
        Transmog({item=163678, slot=L["polearm"]}) -- Pinku'shon's Impaler
    },
    pois={
        Path({38815101, 38485089, 38105120, 38095160})
    }
}) -- Pinku'shon

map.nodes[34656797] = Rare({
    id=141286,
    quest=52469,
    rewards={
        Achievement({id=12940, criteria=41769}),
        Item({item=163036, note="x10"}) -- Polished Pet Charm
    }
}) -- Poacher Zane

map.nodes[41577419] = Rare({
    id=134884,
    quest=50725,
    rewards={
        Achievement({id=12940, criteria=41758}),
        Transmog({item=160465, slot=L["leather"]}) -- Raging-Earth Wranglers
    }
}) -- Ragna

map.nodes[34013199] = Rare({
    id=139328,
    quest=51956,
    note=L["in_small_cave"]..' '..L["sabertron_note"],
    rewards={
        Achievement({id=12940, criteria=41756}),
        Achievement({id=13054, criteria={
            41420, -- red
            41421, -- yellow
            41422, -- orange
            41423, -- green
            41424  -- copper
        }}),
        Transmog({item=154664, slot=L["2h_sword"]}), -- Lionsight Omensword
        Item({item=168152}) -- Miniaturized Power Core
    }
}) -- Sabertron

map.nodes[73506064] = Rare({
    id=139988,
    quest=52125,
    rewards={
        Achievement({id=12940, criteria=41846}),
        Transmog({item=154389, slot=L["plate"]}) -- Abyssal-Serpent Pauldrons
    }
}) -- Sandfang

map.nodes[33613817] = Rare({
    id=138938,
    quest=51757,
    rewards={
        Achievement({id=12940, criteria=41755}),
        Transmog({item=160477, slot=L["plate"]}) -- Skoloth's Anchorplate Greaves
    },
    pois={
        Path({33153739, 33613817, 34053889})
    }
}) -- Seabreaker Skoloth

map.nodes[22577321] = Rare({
    id=140997,
    quest=50938,
    rewards={
        Achievement({id=12940, criteria=41754}),
        Transmog({item=163679, slot=L["cloth"]}) -- Severus' Bindings
    }
}) -- Severus the Outcast

map.nodes[61575705] = Rare({
    id=141143,
    quest=52441,
    rewards={
        Achievement({id=12940, criteria=41842}),
        Transmog({item=155164, slot=L["cloak"]}) -- Beryl-Tide Greatcloak
    }
}) -- Sister Absinthe

map.nodes[41832843] = Rare({
    id=139319,
    quest=51958,
    rewards={
        Achievement({id=12940, criteria=41759}),
        Item({item=158216, note=L["trinket"]}) -- Living Oil Canister
    }
}) -- Slickspill

map.nodes[70863222] = Rare({
    id=141175,
    quest=52448,
    rewards={
        Achievement({id=12940, criteria=41753}),
        Item({item=158218, note=L["trinket"]}) -- Dadalea's Wing
    }
}) -- Song Mistress Dadalea

map.nodes[57037585] = Rare({
    id=141088,
    quest=52433,
    rewards={
        Achievement({id=12940, criteria=41816}),
        Item({item=158224, note=L["trinket"]}) -- Vial of Storms
    }
}) -- Squall

map.nodes[53066908] = Rare({
    id=135947,
    quest=50024,
    note=L["in_cave"],
    rewards={
        Achievement({id=12940, criteria=41787}),
    },
    pois={
        POI({53837222}) -- Cave Entrance
    }
}) -- Strange Mushroom Ring

map.nodes[59974585] = Rare({
    id=139980,
    quest=52123,
    rewards={
        Achievement({id=12940, criteria=41847}),
        Transmog({item=154449, slot=L["leather"]}) -- Tidebound Chestguard
    }
}) -- Taja the Tidehowler

map.nodes[51787979] = Rare({
    id=136189,
    quest=50974,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12940, criteria=41757}),
        Transmog({item=150909, slot=L["plate"]}) -- Morel Coils
    }
}) -- The Lichen King

map.nodes[49616806] = Rare({
    id=135939,
    quest=50037,
    note=L["in_cave"],
    rewards={
        Achievement({id=12940, criteria=41782}),
        Transmog({item=158299, slot=L["1h_mace"]}) -- Ratha's Thornscepter
    },
    pois={
        POI({51086866, 51636771}) -- Cave Entrance
    }
}) -- Vinespeaker Ratha

Map({id=1183}).nodes[12002845] = Rare({
    id=130079,
    quest=50819,
    note=L["in_cave"],
    parent={id=map.id, pois={
        POI({43537598}) -- Cave Entrance
    }},
    rewards={
        Achievement({id=12940, criteria=41843}),
        Transmog({item=154431, slot=L["offhand"]}) -- Earthshaker's Flame
    }
}) -- Wagga Snarltusk

map.nodes[47206580] = Rare({
    id=129803,
    quest=52296,
    note=L["in_small_cave"]..' '..L["whiplash_note"],
    rewards={
        Achievement({id=12940, criteria=41841}),
    }
}) -- Whiplash

map.nodes[46774242] = Rare({
    id=142088,
    quest=52457,
    rewards={
        Achievement({id=12940, criteria=41762}),
        Item({item=158215, note=L["trinket"]}) -- Whirlwing's Plumage
    }
}) -- Whirlwing

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

map.nodes[44447353] = Treasure({
    quest=52429,
    note=L["in_cave"],
    rewards={
        Achievement({id=12853, criteria=41068}),
        Item({item=162000}) -- Pig Nose
    },
    pois={
        POI({44367536}) -- Cave Entrance
    }
}) -- Carved Wooden Chest

map.nodes[32156623] = Treasure({
    quest=53635,
    label=L["curious_grain_sack"]
}) -- Curious Grain Sack

map.nodes[32886964] = Treasure({
    quest=53652,
    label=L["curious_grain_sack"]
}) -- Curious Grain Sack

map.nodes[58216368] = Treasure({
    quest=52326,
    note=L["discarded_lunchbox_note"],
    rewards={
        Achievement({id=12853, criteria=41067}),
        Item({item=160485}) -- An Unforgettable Luncheon
    }
}) -- Discarded Lunchbox

map.nodes[46003069] = Treasure({
    quest=52980,
    rewards={
        Achievement({id=12853, criteria=41070})
    }
}) -- Forgotten Chest

map.nodes[48968407] = Treasure({
    quest=50526,
    rewards={
        Achievement({id=12853, criteria=41063})
    }
}) -- Frosty Treasure Chest

map.nodes[59913907] = Treasure({
    quest=50937,
    note=L["hidden_scholars_chest_note"],
    rewards={
        Achievement({id=12853, criteria=41065})
    }
}) -- Hidden Scholar's Chest

map.nodes[66557112] = Treasure({
    quest=50576,
    label=L["honey_vat"],
    reward={
        Transmog({item=154476, slot=L["plate"]}) -- Honey-Glazed Vambraces
    }
}) -- Honey Vat

map.nodes[42854723] = Treasure({
    quest=50089,
    note=L["in_cave"],
    rewards={
        Achievement({id=12853, criteria=41062})
    },
    pois={
        POI({43664836}) -- Cave Entrance
    }
}) -- Old Ironbound Chest

map.nodes[58608388] = Treasure({
    quest=49811,
    note=L["smugglers_stash_note"],
    rewards={
        Achievement({id=12853, criteria=41066})
    }
}) -- Smuggler's Stash

map.nodes[67224321] = Treasure({
    quest=50734,
    note=L["sunken_strongbox_note"],
    rewards={
        Achievement({id=12853, criteria=41064}),
        Item({item=163036, note="x5"}) -- Polished Pet Charm
    }
}) -- Sunken Strongbox

map.nodes[36692323] = Treasure({
    quest=52976,
    note=L["venture_co_supply_chest_note"],
    rewards={
        Achievement({id=12853, criteria=41069})
    }
}) -- Venture Co. Supply Chest

map.nodes[66921206] = Treasure({
    quest=51449,
    note=L["weathered_treasure_chest_note"],
    rewards={
        Achievement({id=12853, criteria=41061})
    },
    pois={
        POI({65421178, 68351078, 66831475}) -- Cave Entrances
    }
}) -- Weathered Treasure Chest

-------------------------------------------------------------------------------
------------------------------- SMALL TREASURES -------------------------------
-------------------------------------------------------------------------------

-- local SmallTreasure = Class('SmallTreasure', Treasure)

-- SmallTreasure.label = L["small_treasure_chest"]
-- SmallTreasure.icon = "chest_bn"

-- map.nodes[62056563] = SmallTreasure({quest=51184})
-- map.nodes[51796523] = SmallTreasure({quest=51184})
-- map.nodes[70265958] = SmallTreasure({quest=51927, note=L["small_treasure_51927"]})
-- map.nodes[75103513] = SmallTreasure({quest=51938})
-- map.nodes[73093558] = SmallTreasure({quest=51938})
-- map.nodes[64366899] = SmallTreasure({quest=51939})
-- map.nodes[64317023] = SmallTreasure({quest=51939})
-- map.nodes[69536809] = SmallTreasure({quest=51939})
-- map.nodes[48406562] = SmallTreasure({quest=51940, note=L["small_treasure_51940"]})
-- map.nodes[41956069] = SmallTreasure({quest=51941})
-- map.nodes[44107300] = SmallTreasure({quest=51942})
-- map.nodes[42876992] = SmallTreasure({quest=51942})
-- map.nodes[29776948] = SmallTreasure({quest=51943})
-- map.nodes[30914548] = SmallTreasure({quest=51944})
-- map.nodes[36272737] = SmallTreasure({quest=51945})
-- map.nodes[57645092] = SmallTreasure({quest=51946})
-- map.nodes[60865118] = SmallTreasure({quest=51946})
-- map.nodes[46915393] = SmallTreasure({quest=51949})

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55388,
    rewards={
        Achievement({id=13317, criteria=43933})
    }
}) -- quest = 54716 (looted ever) 55388 (looted today)

map.nodes[40206250] = SECRET_CHEST
map.nodes[43104690] = SECRET_CHEST
map.nodes[46635657] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[54406340] = Supply({
    quest=55410,
    fgroup='supply_path_1',
    pois={Arrow({58008350, 50003883})}
})
map.nodes[55707069] = Supply({
    quest=55410,
    fgroup='supply_path_1'
})
map.nodes[56767681] = Supply({
    quest=55410,
    fgroup='supply_path_1'
})

map.nodes[59197136] = Supply({
    quest=55410,
    fgroup='supply_path_2',
    pois={Arrow({75009005, 40004867})}
})
map.nodes[65287856] = Supply({
    quest=55410,
    fgroup='supply_path_2'
})
map.nodes[70808500] = Supply({
    quest=55410,
    fgroup='supply_path_2'
})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[42537678] = PetBattle({
    id=139987,
    rewards={
        Achievement({id=12936, criteria=44209})
    }
}) -- This Little Piggy Has Sharp Tusks (Bristlespine)

map.nodes[36533365] = PetBattle({
    id=140315,
    note=L["eddie_fixit_note"],
    rewards={
        Achievement({id=12936, criteria=44211}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=2, oneline=true}), -- Beast
        Achievement({id=13271, criteria=2, oneline=true}), -- Critter
        Achievement({id=13272, criteria=2, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=2, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=2, oneline=true}), -- Flying
        Achievement({id=13275, criteria=2, oneline=true}), -- Magic
        Achievement({id=13277, criteria=2, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=2, oneline=true}), -- Undead
        Achievement({id=13280, criteria=2, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=2, oneline=true})  -- Humanoid
    }
}) -- Automated Chaos (Eddie Fixit)

map.nodes[65035082] = PetBattle({
    id=141002,
    note=L["ellie_vern_note"],
    rewards={
        Achievement({id=12936, criteria=44215}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=6, oneline=true}), -- Beast
        Achievement({id=13271, criteria=6, oneline=true}), -- Critter
        Achievement({id=13272, criteria=6, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=6, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=6, oneline=true}), -- Flying
        Achievement({id=13275, criteria=6, oneline=true}), -- Magic
        Achievement({id=13277, criteria=6, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=6, oneline=true}), -- Undead
        Achievement({id=13280, criteria=6, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=6, oneline=true})  -- Humanoid
    }
}) -- Sea Creatures Are Weird (Ellie Vern)

map.nodes[77182915] = PetBattle({
    id=141046,
    note=L["leana_darkwind_note"],
    rewards={
        Achievement({id=12936, criteria=44216}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=7, oneline=true}), -- Beast
        Achievement({id=13271, criteria=7, oneline=true}), -- Critter
        Achievement({id=13272, criteria=7, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=7, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=7, oneline=true}), -- Flying
        Achievement({id=13275, criteria=7, oneline=true}), -- Magic
        Achievement({id=13277, criteria=7, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=7, oneline=true}), -- Undead
        Achievement({id=13280, criteria=7, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=7, oneline=true})  -- Humanoid
    }
}) -- Captured Evil (Leana Darkwind)

-------------------------------------------------------------------------------
-------------------------- HONEYBACK HARVESTER EVENTS -------------------------
-------------------------------------------------------------------------------

-- quest 56413 start
-- quest 56414, 57703 honeycomb loot

local honeyback = Class('Honeyback', NPC, {
    id=155193,
    icon=2066005,
    group=ns.groups.HONEYBACKS,
    note=L["honeyback_harvester_note"],
    getters={
        rlabel=function(self)
            local completed = C_QuestLog.IsQuestFlaggedCompleted(56414)
            local color = completed and ns.status.Green or ns.status.Gray
            return color(L['hourly'])
        end
    }
})()

map.nodes[25667224] = honeyback
map.nodes[33053243] = honeyback
map.nodes[40936214] = honeyback
map.nodes[43003300] = honeyback
map.nodes[47453212] = honeyback
map.nodes[57175125] = honeyback
map.nodes[61893195] = honeyback
map.nodes[63012131] = honeyback
map.nodes[66307000] = honeyback
map.nodes[69007000] = honeyback
map.nodes[72105230] = honeyback

-------------------------------------------------------------------------------
--------------------------- LEGENDS OF THE TIDESAGES --------------------------
-------------------------------------------------------------------------------

local AncientScroll = Class('AncientScroll', Collectible, {
    icon=1500881,
    label=L["ancient_tidesage_scroll"],
    note=L["ancient_tidesage_scroll_note"],
    group=ns.groups.TIDESAGE_LEGENDS
})

map.nodes[49518090] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41425})
    }
}) -- Part 1 (Near the waterfall)

map.nodes[59025954] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41426})
    }
}) -- Part 2 (On top of the hill)

map.nodes[31957291] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41427})
    }
}) -- Part 3 (Near the lake)

map.nodes[33813323] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41428})
    }
}) -- Part 4 (On top of the island)

map.nodes[56023853] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41429})
    }
}) -- Part 5 (Up the mountain right of Warfang Hold)

map.nodes[44183660] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41430})
    }
}) -- Part 6 (Up the mountain left of Warfang Hold)

map.nodes[62083022] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41431})
    }
}) -- Part 7

map.nodes[75073113] = AncientScroll({
    rewards={
        Achievement({id=13051, criteria=41432})
    }
}) -- Part 8 (Near the Shrine of the Storm entrance)

-------------------------------------------------------------------------------
--------------------------- THREE SHEETS TO THE WIND --------------------------
-------------------------------------------------------------------------------

map.nodes[41215020] = Collectible({
    id=141853,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    rewards={
        Achievement({id=13061, criteria={
            41401, -- Brennadam Apple Brandy
            41403, -- Dark and Stormy
        }})
    }
}) -- Rebecca Barnes

map.nodes[44455419] = Collectible({
    id=135600,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    rewards={
        Achievement({id=13061, criteria=41405}) -- Foaming Turtle Broth
    }
}) -- Emma Haribull

map.nodes[50883354] = Collectible({
    id=138905,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Horde',
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41401, -- Brennadam Apple Brandy
            41403, -- Dark and Stormy
            41410, -- Mildenhall Mead
        }})
    }
}) -- Rusty Blade Waitress

map.nodes[58637025] = Collectible({
    id=138221,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41401, -- Brennadam Apple Brandy
            41410, -- Mildenhall Mead
        }})
    }
}) -- "Nasty" Buck

map.nodes[49075722] = Collectible({
    icon=135999,
    faction='Alliance',
    note=L["three_sheets_note"]..'\n\n'..L["long_forgotten_rum_note"],
    group=ns.groups.THREE_SHEETS,
    rewards={
        Achievement({id=13061, criteria=41409}) -- Long Forgotten Rum
    }
}) -- Long Forgotten Rum


-------------------------------------------------------------------------------
------------------------------ LET'S BEE FRIENDS ------------------------------
-------------------------------------------------------------------------------

map.nodes[71106917] = Class('Bumbles', Collectible, {
    id=143658,
    icon=2027853,
    faction='Alliance',
    rewards={
        Achievement({id=13062, criteria={id=1, qty=true}}),
        Pet({item=163776, id=2442}) -- Large Honeycomb Cluster
    },
    getters={
        note=function(self)
            local function qstep(step, quest)
                if C_QuestLog.IsQuestFlaggedCompleted(quest) then
                    return ns.status.Green(step)
                else
                    return ns.status.Red(step)
                end
            end
            local function istep(step, item, quest)
                if ns.PlayerHasItem(item) or C_QuestLog.IsQuestFlaggedCompleted(quest) then
                    return ns.status.Green(step)
                else
                    return ns.status.Red(step)
                end
            end

            local note = L["lets_bee_friends_note"]
            note = note..'\n\n'..qstep(1, 50553)..' '..L["lets_bee_friends_step_1"]
            note = note..'\n\n'..istep(2, 163699, 53111)..' '..L["lets_bee_friends_step_2"]
            note = note..'\n\n'..qstep(3, 53111)..' '..L["lets_bee_friends_step_3"]
            note = note..'\n\n'..qstep(4, 53200)..' '..L["lets_bee_friends_step_4"]
            note = note..'\n\n'..qstep(5, 53347)..' '..L["lets_bee_friends_step_5"]
            return note
        end,
        rlabel=function(self)
            return ns.status.Gray(select(9, GetAchievementCriteriaInfo(13062, 1)))
        end
    }
})()

-------------------------------------------------------------------------------
------------------------------- THESE HILLS SING ------------------------------
-------------------------------------------------------------------------------

map.nodes[41256950] = Collectible({
    label="{achievement:13046}",
    note=L["these_hills_sing_note"],
    requires=ns.requirement.Item(160485), -- An Unforgettable Luncheon
    icon=2065627,
    rewards={
        Achievement({id=13046})
    }
}) -- These Hills Sing

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[72806720] = ToAlltheSquirrels({
    id=131376,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50236})
    },
    pois={
        POI({71206800, 74207260})
    }
}) -- Honey Bee

map.nodes[70906670] = ToAlltheSquirrels({
    id=143220,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50237})
    },
    pois={
        POI({66407020, 68406880, 72806860})
    }
}) -- Olivewing

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Transmog = ns.reward.Transmog
local Toy = ns.reward.Toy

local Arrow = ns.poi.Arrow
local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=895, settings=true })
local bor = Map({ id=1161 })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[74917894] = Rare({
    id=132182,
    quest=50156,
    rewards={
        Achievement({id=12939, criteria=41793})
    }
}) -- Auditor Dolp

map.nodes[76098287] = Rare({
    id=129181,
    quest=50233,
    rewards={
        Achievement({id=12939, criteria=41795}),
        Achievement({id=13057, criteria=41544}),
        Transmog({item=160451, slot=L["dagger"]}), -- Barman Skewer
        Item({item=163717}) -- Forbidden Sea Shanty of Josephus
    }
}) -- Barman Bill

map.nodes[34503035] = Rare({
    id=132068,
    quest=50094,
    rewards={
        Achievement({id=12939, criteria=41796}),
        Transmog({item=160467, slot=L["mail"]}) -- Hydra-Hunter Legguards
    }
}) -- Bashmu

map.nodes[56296997] = Rare({
    id=132086,
    quest=50096,
    rewards={
        Achievement({id=12939, criteria=41797}),
        Achievement({id=13057, criteria=41545}),
        Transmog({item=158650, slot=L["2h_sword"]}), -- Sea-Scourge Greatblade
        Item({item=163718}) -- Forbidden Sea Shanty of the Black Sphere
    }
}) -- Black-Eyed Bart

map.nodes[85267342] = Rare({
    id=139145,
    quest=51808,
    rewards={
        Achievement({id=12939, criteria=41798}),
        Transmog({item=154411, slot=L["gun"]}) -- Vlaros Corps Rifle
    }
}) -- Blackthorne

map.nodes[83544482] = Rare({
    id=130508,
    quest=49999,
    rewards={
        Achievement({id=12939, criteria=41800}),
        Transmog({item=160460, slot=L["leather"]}) -- Thick Sauroskin Gloves
    }
}) -- Broodmother Razora

map.nodes[38442070] = Rare({
    id=132088,
    quest=50097,
    note=L["in_cave"]..' '..L["wintersail_note"],
    rewards={
        Achievement({id=12939, criteria=41806}),
        Transmog({item=155422, slot=L["crossbow"]}) -- Pirate Chief's Speargun
    }
}) -- Captain Wintersail

map.nodes[72498104] = Rare({
    id=139152,
    quest=51809,
    rewards={
        Achievement({id=12939, criteria=41812}),
        Transmog({item=155271, slot=L["1h_axe"]}) -- Monkey's Paw Chopper
    }
}) -- Carla Smirk

map.nodes[90507736] = Rare({
    id=132211,
    quest=50155,
    rewards={
        Achievement({id=12939, criteria=41813}),
        Transmog({item=154467, slot=L["leather"]}) -- Parrot-Trainer Mantle
    }
}) -- Fowlmouth

map.nodes[60102220] = Rare({
    id=132127,
    quest=50137,
    rewards={
        Achievement({id=12939, criteria=41814}),
        Transmog({item=160454, slot=L["cloth"]}) -- Foxhollow Falconer's Bracers
    }
}) -- Foxhollow Skyterror

map.nodes[61705154] = Rare({
    id=130350,
    quest=49963, -- 49983 (ride)
    note=L["hay_covered_chest_note"],
    rewards={
        Achievement({id=12852, criteria=41012}),
        Transmog({item=155571, slot=L["cloak"]}) -- Garyl's Riding Blanket
    },
    pois={
        Path({
            61705154, 62145219, 62805261, 63395202, 64025146, 64755138,
            65465164, 66235200, 67005203, 67365163
        }) -- Path to the treasure
    }
}) -- Guardian of the Spring

map.nodes[57845590] = Rare({
    id=139233,
    quest=53373,
    rewards={
        Achievement({id=12939, criteria=41819}),
        Transmog({item=158338, slot=L["cloth"]}) -- Swift-Travel Gloves
    }
}) -- Gulliver

map.nodes[64301936] = Rare({
    id=137183,
    quest=51321,
    note=L["honey_slitherer_note"],
    rewards={
        Achievement({id=12939, criteria=41823}),
        Transmog({item=160472, slot=L["plate"]}) -- Honey-Glazed Gauntlets
    }
}) -- Honey-Coated Slitherer

map.nodes[47832223] = Rare({
    id=131520,
    quest=49984,
    rewards={
        Achievement({id=12939, criteria=41820}),
        Transmog({item=158597, slot=L["shield"]}) -- Silvershell Defender
    }
}) -- Kulett the Ornery

map.nodes[67951999] = Rare({
    id=134106,
    quest=50525,
    rewards={
        Achievement({id=12939, criteria=41821}),
        Transmog({item=155524, slot=L["1h_axe"]}) -- Cursetouched Lumberjack's Axe
    }
}) -- Lumbergrasp Sentinel

map.nodes[58164931] = Rare({
    id=139290,
    quest=51880,
    rewards={
        Achievement({id=12939, criteria=41822}),
        Transmog({item=154458, slot=L["plate"]}) -- Shellbreaker Warhelm
    }
}) -- Maison the Portable

map.nodes[43031675] = Rare({
    id=131252,
    quest=49921,
    note=L["in_waterfall_cave"],
    rewards={
        Achievement({id=12939, criteria=41824}),
        Transmog({item=160461, slot=L["leather"]}) -- Thick Sauroskin Pants
    }
}) -- Merianae

map.nodes[64316330] = Rare({
    id=139205,
    quest=51833,
    rewards={
        Achievement({id=12939, criteria=41825}),
        Transmog({item=161599, slot=L["fist"]}) -- Mechano-Cat Claw
    }
}) -- P4-N73R4

map.nodes[38891530] = Rare({
    id=131262,
    quest=49923,
    note=L["in_cave"],
    rewards={
        Achievement({id=12939, criteria=41826}),
        Item({item=160263, note=L["trinket"]}) -- Snowpelt Mangler
    },
    pois={
        POI({39851491}) -- Cave entrance
    }
}) -- Pack Leader Asenya

map.nodes[64765863] = Rare({
    id=132179,
    quest=50148,
    rewards={
        Achievement({id=12939, criteria=41827}),
        Item({item=161446, note=L["ring"]}) -- Blistering Seawater Seal
    }
}) -- Raging Swell

map.nodes[68306356] = Rare({
    id=139278,
    quest=51872,
    rewards={
        Achievement({id=12939, criteria=41828}),
        Transmog({item=154478, slot=L["leather"]}) -- Ranja-Hide Bracers
    }
}) -- Ranja

map.nodes[58651480] = Rare({
    id=127290,
    quest=48806,
    rewards={
        Achievement({id=12939, criteria=41829}),
        Transmog({item=154416, slot=L["2h_mace"]}) -- Trogg Saurolisk-Breaker
    }
}) -- Saurolisk Tamer Mugg

bor.nodes[80594456] = Rare({
    id=139287,
    quest=51877,
    parent=map.id,
    rewards={
        Achievement({id=12939, criteria=41830}),
        Transmog({item=155273, slot=L["1h_axe"]}) -- Sharktooth Hatchet
    },
    pois={
        Path({
            76143832, 78343810, 79844112, 80594456, 80394854, 78485012,
            76764657, 76024247, 76143832
        })
    }
}) -- Sawtooth

map.nodes[55123241] = Rare({
    id=139285,
    quest=51876,
    rewards={
        Achievement({id=12939, criteria=41831}),
        Transmog({item=155278, slot=L["dagger"]}) -- Shiverscale Spellknife
    }
}) -- Shiverscale the Toxic

map.nodes[80918284] = Rare({
    id=132280,
    quest=50160,
    rewards={
        Achievement({id=12939, criteria=41832}),
        Transmog({item=160455, slot=L["cloth"]}) -- Parrot-Trainer Sash
    }
}) -- Squacks

map.nodes[48883702] = Rare({
    id=139135,
    quest=51807,
    rewards={
        Achievement({id=12939, criteria=41833}),
        Transmog({item=155551, slot=L["wand"]}) -- Squirgle's Deepstone Wand
    }
}) -- Squirgle of the Depths

map.nodes[66611382] = Rare({
    id=139280,
    quest=51873,
    rewards={
        Achievement({id=12939, criteria=41834}),
        Transmog({item=154474, slot=L["leather"]}) -- Sythian Swiftbelt
    }
}) -- Sythian the Swift

map.nodes[60521753] = Rare({
    id=133356,
    quest=50301,
    note=L["tempestria_note"],
    rewards={
        Achievement({id=12939, criteria=41835}),
        Transmog({item=160466, slot=L["mail"]}) -- Saurolisk Broodmother Boots
    }
}) -- Tempestria

map.nodes[55315156] = Rare({
    id=139289,
    quest=51879,
    rewards={
        Achievement({id=12939, criteria=41836}),
        Transmog({item=154448, slot=L["mail"]}) -- Medusa-Drifter's Chainmail
    }
}) -- Tentulos the Drifter

map.nodes[63655035] = Rare({
    id=131389,
    quest=49942,
    rewards={
        Achievement({id=12939, criteria=41837}),
        Item({item=158556, note=L["trinket"]}) -- Siren's Tongue
    }
}) -- Teres

map.nodes[70405573] = Rare({
    id=139235,
    quest=51835,
    rewards={
        Achievement({id=12939, criteria=41838}),
        Transmog({item=159349, slot=L["mail"]}) -- Dragon Turtle Handlers
    }
}) -- Tort Jaw

map.nodes[46842064] = Rare({
    id=132076,
    quest=50095,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12939, criteria=41839}),
        Item({item=160452, note=L["bag"]}) -- Goat's Tote
    }
}) -- Totes

map.nodes[70331248] = Rare({
    id=131984,
    quest=50073,
    note=L["twin_hearted_note"],
    rewards={
        Achievement({id=12939, criteria=41840}),
        Transmog({item=160473, slot=L["plate"]}) -- Wickerthorn Stompers
    }
}) -- Twin-hearted Construct

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- 36983061 48598 Small Treasure Chest
-- 66941635 48619 Small Treasure Chest
-- 66698023 50952 Small Treasure Chest
-- 67346402 48609 Small Treasure Chest
-- 73328244 48596 Small Treasure Chest
-- 76106733 48608 Small Treasure Chest
-- 76368091 48595 Small Treasure Chest
-- 83643572 53631 Dusty Marine Supplies (Scrimshaw Cache on minimap)

-------------------------------------------------------------------------------

map.nodes[72495814] = Treasure({
    quest=50442,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12852, criteria=41013}),
        Item({item=155381, note=L["ring"]}) -- Cutwater-Captain's Sapphire Ring
    }
}) -- Cutwater Treasure Chest

map.nodes[61786275] = Treasure({
    quest=52867,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12852, criteria=41015})
    }
}) -- Forgotten Smuggler's Stash

map.nodes[67365163] = Treasure({
    quest=49963,
    note=L["hay_covered_chest_note"],
    rewards={
        Achievement({id=12852, criteria=41012}),
        Transmog({item=155571, slot=L["cloak"]}) -- Garyl's Riding Blanket
    },
    pois={
        Path({
            61705154, 62145219, 62805261, 63395202, 64025146, 64755138,
            65465164, 66235200, 67005203, 67365163
        }) -- Path to the treasure
    }
}) -- Hay Covered Chest

map.nodes[56033319] = Treasure({
    quest=52866,
    rewards={
        Achievement({id=12852, criteria=41014})
    }
}) -- Precarious Noble Cache

bor.nodes[63270617] = Treasure({
    quest=52870,
    note=L["in_small_cave"],
    parent=map.id,
    rewards={
        Achievement({id=12852, criteria=41016})
    }
}) -- Scrimshaw Cache

-------------------------------- TREASURE MAPS --------------------------------

map.nodes[29222534] = Treasure({
    quest=52833,
    note=L["pirate_treasure_note"],
    rewards={
        Achievement({id=12852, criteria=41019}),
        Item({item=162580, quest=52854})
    }
}) -- Fading Treasure Map

map.nodes[48983759] = Treasure({
    quest=52845,
    note=L["pirate_treasure_note"],
    rewards={
        Achievement({id=12852, criteria=41021}),
        Item({item=162584, quest=52860})
    }
}) -- Singed Treasure Map

map.nodes[54994608] = Treasure({
    quest=52807,
    note=L["pirate_treasure_note"],
    rewards={
        Achievement({id=12852, criteria=41018}),
        Item({item=162571, quest=52853})
    }
}) -- Soggy Treasure Map

map.nodes[90507551] = Treasure({
    quest=52836,
    note=L["pirate_treasure_note"],
    rewards={
        Achievement({id=12852, criteria=41020}),
        Item({item=162581, quest=52859})
    }
}) -- Yellowed Treasure Map

---------------------------- SECRET OF THE DEPTHS -----------------------------

local Scroll = Class('Scroll', Treasure, {
    icon='scroll',
    label=L["damp_scroll"],
    rewards={
        Achievement({id=12852, criteria=41017}),
        Toy({item=161342}) -- Gem of Acquiescence
    }
})

bor.nodes[55989130] = Scroll({
    quest=52134,
    note=L["in_water_cave"]..' '..L["damp_scroll_note_1"],
    pois={
        POI({61258420}) -- Cave entrance
    }
}) -- A Damp Scroll

bor.nodes[61177788] = Scroll({quest=52135, note=L["damp_scroll_note_2"]}) -- A Damp Scroll
bor.nodes[63078186] = Scroll({quest=52136, note=L["damp_scroll_note_3"]}) -- A Damp Scroll
bor.nodes[70328576] = Scroll({quest=52137, note=L["damp_scroll_note_4"]}) -- A Damp Scroll
bor.nodes[67147982] = Scroll({quest=52138, note=L["damp_scroll_note_5"]}) -- A Damp Scroll

bor.nodes[55699108] = Treasure({
    quest=52195,
    questDeps={52134, 52135, 52136, 52137, 52138},
    label=L["ominous_altar"],
    note=L["in_water_cave"]..' '..L["ominous_altar_note"],
    rewards=Scroll.rewards,
    pois={
        POI({61258420}) -- Cave entrance
    }
}) -- Ominous Altar

map.nodes[73103950] = Treasure({
    quest=52195,
    note=L["secret_of_the_depths_note"],
    rewards=Scroll.rewards
}) -- Secret of the Depths

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55347,
    rewards={
        Achievement({id=13317, criteria=43934})
    }
}) -- quest = 54714 (looted ever) 55347 (looted today)

map.nodes[74784443] = SECRET_CHEST
map.nodes[79303730] = SECRET_CHEST
map.nodes[82903650] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[40442072] = Supply({
    quest=55411,
    fgroup='supply_path_1',
    pois={Arrow({30002033, 70002183})}
})
map.nodes[43802080] = Supply({
    quest=55411,
    fgroup='supply_path_1'
})
map.nodes[49482106] = Supply({
    quest=55411,
    fgroup='supply_path_1'
})

map.nodes[76667659] = Supply({
    quest=55411,
    fgroup='supply_path_2',
    pois={Arrow({78809426, 73004645})}
})
map.nodes[77538379] = Supply({
    quest=55411,
    fgroup='supply_path_2'
})
map.nodes[78278989] = Supply({
    quest=55411,
    fgroup='supply_path_2'
})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[88628019] = PetBattle({
    id=141215,
    rewards={
        Achievement({id=12936, criteria=44218})
    }
}) -- Unbreakable (Chitara)

map.nodes[59583330] = PetBattle({
    id=141292,
    note=L["delia_hanako_note"],
    rewards={
        Achievement({id=12936, criteria=44219}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=9, oneline=true}), -- Beast
        Achievement({id=13271, criteria=9, oneline=true}), -- Critter
        Achievement({id=13272, criteria=9, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=9, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=9, oneline=true}), -- Flying
        Achievement({id=13275, criteria=9, oneline=true}), -- Magic
        Achievement({id=13277, criteria=9, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=9, oneline=true}), -- Undead
        Achievement({id=13280, criteria=9, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=9, oneline=true})  -- Humanoid
    }
}) -- That's a Big Carcass (Delia Hanako)

map.nodes[67711285] = PetBattle({
    id=141479,
    note=L["burly_note"],
    rewards={
        Achievement({id=12936, criteria=44220}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=10, oneline=true}), -- Beast
        Achievement({id=13271, criteria=10, oneline=true}), -- Critter
        Achievement({id=13272, criteria=10, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=10, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=10, oneline=true}), -- Flying
        Achievement({id=13275, criteria=10, oneline=true}), -- Magic
        Achievement({id=13277, criteria=10, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=10, oneline=true}), -- Undead
        Achievement({id=13280, criteria=10, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=10, oneline=true})  -- Humanoid
    }
}) -- Strange Looking Dogs (Burly)

map.nodes[86213862] = PetBattle({
    id=141077,
    note=L["kwint_note"],
    rewards={
        Achievement({id=12936, criteria=44217}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=8, oneline=true}), -- Beast
        Achievement({id=13271, criteria=8, oneline=true}), -- Critter
        Achievement({id=13272, criteria=8, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=8, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=8, oneline=true}), -- Flying
        Achievement({id=13275, criteria=8, oneline=true}), -- Magic
        Achievement({id=13277, criteria=8, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=8, oneline=true}), -- Undead
        Achievement({id=13280, criteria=8, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=8, oneline=true})  -- Humanoid
    }
}) -- Not So Bad Down Here (Kwint)

-------------------------------------------------------------------------------
------------------------------- SAUSAGE SAMPLER -------------------------------
-------------------------------------------------------------------------------

bor.nodes[70622130] = Collectible({
    id=142167,
    icon=133200,
    note=L["sausage_sampler_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    parent=map.id,
    rewards={
        Achievement({id=13087, criteria={
            41648, -- Goldshire Farms Smoked Sausage
            41651, -- Roland's Famous Frankfurter
            41652, -- Rosco Fryer's Mostly-Meat Brat
            41653, -- Timmy Gene Sunrise Pork
        }})
    }
}) -- Charisse Payton

bor.nodes[72606841] = Collectible({
    id=135525,
    icon=133200,
    note=L["sausage_sampler_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    parent=map.id,
    rewards={
        Achievement({id=13087, criteria={
            41652, -- Rosco Fryer's Mostly-Meat Brat
            41653, -- Timmy Gene Sunrise Pork
        }})
    }
}) -- Jaela Billman

bor.nodes[47454604] = Collectible({
    id=137407,
    icon=133200,
    note=L["sausage_sampler_note"],
    group=ns.groups.SAUSAGE_SAMPLER,
    parent=map.id,
    rewards={
        Achievement({id=13087, criteria={
            41648, -- Goldshire Farms Smoked Sausage
            41651, -- Roland's Famous Frankfurter
            41652, -- Rosco Fryer's Mostly-Meat Brat
            41653, -- Timmy Gene Sunrise Pork
        }})
    }
}) -- Edward Stephens

-------------------------------------------------------------------------------
--------------------------------- SHANTY RAID ---------------------------------
-------------------------------------------------------------------------------

bor.nodes[72426942] = Collectible({
    icon=1500866,
    note=L["shanty_lively_note"],
    group=ns.groups.SHANTY_RAID,
    parent=map.id,
    rewards={
        Achievement({id=13057, criteria=41541}),
        Item({item=163714})
    }
}) -- Shanty of the Lively Men

bor.nodes[53141767] = Collectible({
    icon=1500866,
    note=L["shanty_inebriation_note"],
    group=ns.groups.SHANTY_RAID,
    parent=map.id,
    rewards={
        Achievement({id=13057, criteria=41543}),
        Item({item=163716})
    }
}) -- Shanty of Inebriation

map.nodes[43482559] = Collectible({
    icon=1500866,
    note=L["shanty_fruit_note"],
    group=ns.groups.SHANTY_RAID,
    rewards={
        Achievement({id=13057, criteria=41542}),
        Item({item=163715})
    }
}) -- Shanty of Fruit Counting

map.nodes[73218414] = Collectible({
    icon=1500866,
    note=L["shanty_horse_note"],
    group=ns.groups.SHANTY_RAID,
    rewards={
        Achievement({id=13057, criteria=41546}),
        Item({item=163719})
    }
}) -- Shanty of the Horse

-------------------------------------------------------------------------------
--------------------------- THREE SHEETS TO THE WIND --------------------------
-------------------------------------------------------------------------------

bor.nodes[47744734] = Collectible({
    id=137411,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41400, -- Blacktooth Bloodwine
            41403, -- Dark and Stormy
            41406, -- Hook Point Porter
            41415, -- Thornspeaker Moonshine
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Joseph Stephens

bor.nodes[58177024] = Collectible({
    id=143487,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41398, -- Arathor Single Cask
            41402  -- Corlain Estate 12 Year
        }})
    }
}) -- Nicolas Moal

bor.nodes[69262986] = Collectible({
    id=142189,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41397, -- Admiralty-Issued Grog
            41406, -- Hook Point Porter
            41411, -- Patina Pale Ale
            41414, -- Snowberry Berliner
            41416, -- Tradewinds Kolsch
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Ruddy the Rat

bor.nodes[75331442] = Collectible({
    id=123639,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41399, -- Bitter Darkroot Vodka
            41400, -- Blacktooth Bloodwine
            41401, -- Brennadam Apple Brandy
            41407, -- Hook Point Schnapps
            41410, -- Mildenhall Mead
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Harold Atkey

bor.nodes[74241776] = Collectible({
    id=142188,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41399, -- Bitter Darkroot Vodka
            41400, -- Blacktooth Bloodwine
            41401, -- Brennadam Apple Brandy
            41407, -- Hook Point Schnapps
            41415, -- Thornspeaker Moonshine
        }})
    }
}) -- Allison Weber

bor.nodes[71186089] = Collectible({
    id=149397,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41396, -- "Aurora Borealis"
            41399, -- Bitter Darkroot Vodka
            41400, -- Blacktooth Bloodwine
            41401, -- Brennadam Apple Brandy
            41407, -- Hook Point Schnapps
            41415, -- Thornspeaker Moonshine
        }})
    }
}) -- Kul Tiran Attendant

bor.nodes[54994361] = Collectible({
    id=134729,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41397, -- Admiralty-Issued Grog
            41406, -- Hook Point Porter
            41411, -- Patina Pale Ale
            41414, -- Snowberry Berliner
            41416, -- Tradewinds Kolsch
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Crimper Mirjam

bor.nodes[75451861] = Collectible({
    id=143246,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41397, -- Admiralty-Issued Grog
            41400, -- Blacktooth Bloodwine
        }})
    }
}) -- Garrett Elmendorf

bor.nodes[74121265] = Collectible({
    id=135153,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41399, -- Bitter Darkroot Vodka
            41404, -- Drop Anchor Dunkel
            41406, -- Hook Point Porter
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Wesley Rockhold

bor.nodes[66516137] = Collectible({
    id=144115,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41399, -- Bitter Darkroot Vodka
            41404, -- Drop Anchor Dunkel
            41406, -- Hook Point Porter
            41417, -- Whitegrove Pale Ale
        }})
    }
}) -- Diana Seafinch

bor.nodes[72141491] = Collectible({
    id=143244,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41404, -- Drop Anchor Dunkel
            41406, -- Hook Point Porter
            41407, -- Hook Point Schnapps
            41408, -- Kul Tiran Tripel
            41412, -- Pontoon Pilsner
            41416, -- Tradewinds Kolsch
        }})
    },
    pois={
        Path({
            73881267, 73411449, 74791580, 75411818, 74051785, 72651602,
            71101619, 72141491, 73411449
        })
    }
}) -- Victor Esquivias

bor.nodes[53987523] = Collectible({
    id=139113,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41404, -- Drop Anchor Dunkel
            41407, -- Hook Point Schnapps
            41408, -- Kul Tiran Tripel
        }})
    }
}) -- Bored Barkeep

bor.nodes[65463929] = Collectible({
    id=135216,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria=41404}) -- Drop Anchor Dunkel
    }
}) -- Ron Mahogany <The Anchor Man>

-------------------------------------------------------------------------------

map.nodes[49792529] = Collectible({
    id=126601,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Alliance',
    rewards={
        Achievement({id=13061, criteria={
            41404, -- Drop Anchor Dunkel
            41406, -- Hook Point Porter
            41407, -- Hook Point Schnapps
            41408, -- Kul Tiran Tripel
            41412, -- Pontoon Pilsner
            41416, -- Tradewinds Kolsch
        }})
    }
}) -- Sarella Griffin

map.nodes[77198426] = Collectible({
    id=129044,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    rewards={
        Achievement({id=13061, criteria={
            41397, -- Admiralty-Issued Grog
            41400, -- Blacktooth Bloodwine
        }})
    }
}) -- Martha Mae

-------------------------------------------------------------------------------
------------------------------ UPRIGHT CITIZENS -------------------------------
-------------------------------------------------------------------------------

local Citizen = Class('UprightCitizen', Collectible, {
    icon=516667,
    group=ns.groups.UPRIGHT_CITIZENS,
    note=L["upright_citizens_node"]
})

bor.nodes[66806410] = Citizen({
    id=145107,
    rewards={
        Achievement({id=13285, criteria=43720}),
        Toy({item=166247}) -- Citizens Brigade Whistle
    }
}) -- Leeroy Jenkins

bor.nodes[72306160] = Citizen({
    id=146295,
    rewards={
        Achievement({id=13285, criteria=43719}),
        Toy({item=166247}) -- Citizens Brigade Whistle
    }
}) -- Flynn Fairwind

bor.nodes[72706920] = Citizen({
    id=145101,
    rewards={
        Achievement({id=13285, criteria=43718}),
        Toy({item=166247}) -- Citizens Brigade Whistle
    }
}) -- Russel the Bard

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[84807780] = ToAlltheSquirrels({
    id=126546,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50238})
    },
    pois={
        POI({86408120})
    }
}) -- Fluttering Softwing

map.nodes[88207280] = ToAlltheSquirrels({
    id=126519,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50240})
    },
    pois={
        POI({88207800, 78008060})
    }
}) -- Tiragarde Gull

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.VisionsMap
local Clone = ns.Clone

local Coffer = ns.node.Coffer
local Collectible = ns.node.Node
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local TimedEvent = ns.node.TimedEvent
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Quest = ns.reward.Quest
local Toy = ns.reward.Toy

local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local AQR, EMP, AMA = 0, 1, 2 -- assaults

local function GetAssault()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(1527)
    if textures and textures[1].fileDataIDs[1] == 3165083 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Uldum assault: AQR') end
        return AQR -- left
    elseif textures and textures[1].fileDataIDs[1] == 3165092 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Uldum assault: EMP') end
        return EMP -- middle
    elseif textures and textures[1].fileDataIDs[1] == 3165098 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Uldum assault: AMA') end
        return AMA -- right
    end
end

-------------------------------------------------------------------------------

local map = Map({id=1527, phased=false, settings=true, GetAssault=GetAssault})

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = Class('Intro', ns.node.Intro)

Intro.note = L["uldum_intro_note"]

function Intro:IsCompleted()
    return map.assault ~= nil
end

function Intro.getters:label()
    return select(2, GetAchievementInfo(14153)) -- Uldum Under Assault
end

-- Network Diagnostics => Surfacing Threats
local Q = Quest({id={58506, 56374, 56209, 56375, 56472, 56376}})

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({rewards={
        Quest({id={58496, 58498, 58502}}), Q
    }})
else
    map.intro = Intro({rewards={
        Quest({id={58582, 58583}}), Q
    }})
end

map.nodes[46004300] = map.intro

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[64572623] = Rare({
    id=157170,
    quest=57281,
    assault=AMA,
    note=L["chamber_of_the_stars"]
}) -- Acolyte Taspu

map.nodes[66817436] = Rare({
    id=158557,
    quest=57669,
    assault=EMP
}) -- Actiss the Deceiver

map.nodes[73805180] = Rare({
    id=151883,
    quest=55468,
    assault=AMA
}) -- Anaua

map.nodes[32426443] = Rare({
    id=155703,
    quest=56834
}) -- Anq'uri the Titanic

map.nodes[38732500] = Rare({
    id=154578,
    quest=58612,
    assault=AQR,
    note=L["aqir_flayer"],
    pois={
        POI({ -- Aqir Hive Worker
            41202497, 40472249, 39882209, 38942459, 37102236, 36502179, 37782046,
            36761891, 37591749, 36041891, 35691808, 33551946, 32251624, 35031801,
            35292068, 33461670, 35102299, 37981821, 40952468
        }),
        POI({ -- Aqir Reaper
            41863885, 41264078, 41494146, 41104233, 40464372, 40624452, 40834550,
            39984480, 39814467, 39254356, 37994321, 37584213, 39764251, 39333892,
            29816310, 32056727, 32426645, 33646358, 37094853
        })
    }
}) -- Aqir Flayer

map.nodes[30595944] = Rare({
    id=154576,
    quest=58614,
    assault=AQR,
    note=L["aqir_titanus"],
    pois={
        POI({30266161, 30076533, 31496674, 33356610, 32486946, 34856598}),
        Path({37295892, 36485588, 37285284}),
        Path({38134884, 36535023, 34765141, 32935159}),
        Path({33325836, 33865418}),
        Path({26795106, 27055372, 27025596}),
        Path({28526114, 28975921, 28805676, 28945481}),
        Path({43194180, 42864292, 41284445, 40884731}),
        Path({40864255, 41714037}),
        Path({38314290, 40354482}),
        Path({32994510, 35434436, 36284239}),
        Path({41243247, 40503334, 39233745})
    }
}) -- Aqir Titanus

map.nodes[38214521] = Rare({
    id=162172,
    quest=58694,
    assault=AQR,
    note=L["aqir_warcaster"],
    pois={
        POI({
            29666397, 30346691, 30396549, 30946805, 31296612, 31316747, 31546811,
            31586663, 31906347, 32256093, 32796516, 32856283, 33046590, 33246733,
            33656812, 33666517, 33976361, 34446875, 34466522, 36844697, 38284543,
            39303882, 39314582, 39754049, 39873790, 39944596, 40033882, 40144315,
            40214146, 40233654, 40264433, 40544320, 40883978, 40894302, 40924132,
            41463988, 41993776, 42913735
        }) -- Aqir Voidcaster
    }
}) -- Aqir Warcaster

map.nodes[44854235] = Rare({
    id=162370,
    quest=58718,
    assault={AQR,AMA}
}) -- Armagedillo

map.nodes[65035129] = Rare({
    id=152757,
    quest=55710,
    assault=AMA,
    note=L["atekhramun"]
}) -- Atekhramun

map.nodes[45605777] = Rare({
    id=162171,
    quest=58699,
    assault=AQR,
    note=L["chamber_of_the_sun"]..' '..L["dunewalker"]
}) -- Captain Dunewalker

map.nodes[75425216] = Rare({
    id=157167,
    quest=57280,
    assault={AQR,AMA}
}) -- Champion Sen-mat

map.nodes[30854971] = Rare({
    id=162147,
    quest=58696,
    assault=AQR,
    rewards={
        Mount({id=1319, item=174769}) -- Malevolent Drone
    }
}) -- Corpse Eater

map.nodes[49363822] = Rare({
    id=158594,
    quest=57672,
    assault=EMP
}) -- Doomsayer Vathiris

map.nodes[48657067] = Rare({
    id=158491,
    quest=57662,
    assault=EMP,
    pois={
        Path({53287082, 54066945, 53446815, 49866959, 48097382, 46537211, 46257561, 44217851})
    }
}) -- Falconer Amenophis

map.nodes[75056816] = Rare({
    id=157120,
    quest=57258,
    assault={AQR, AMA}
}) -- Fangtaker Orsa

map.nodes[55475169] = Rare({
    id=158633,
    quest=57680,
    assault=EMP,
    note=L["gaze_of_nzoth"]..' '..L["right_eye"],
    rewards={
        Item({item=175142}), -- All-Seeing Right Eye
        Toy({item=175140}) -- All-Seeing Eye
    }
}) -- Gaze of N'Zoth

map.nodes[54694317] = Rare({
    id=158597,
    quest=57675,
    assault=EMP
}) -- High Executor Yothrim

map.nodes[47507718] = Rare({
    id=158528,
    quest=57664,
    assault=EMP
}) -- High Guard Reshef

map.nodes[42485873] = Rare({
    id=162163,
    quest=58701,
    assault=AQR,
    pois={
        Path({42485873, 44396076, 46215988, 46785800, 46465623, 44545616, 43055653, 42485873})
    }
}) -- High Priest Ytaessis

map.nodes[80504715] = Rare({
    id=151995,
    quest=55502,
    assault=AMA,
    pois={
        Path({80504715, 79804519, 77204597})
    }
}) -- Hik-Ten the Taskmaster

map.nodes[60033950] = Rare({
    id=160623,
    quest=58206,
    assault=EMP,
    note=L["hmiasma"]
}) -- Hungering Miasma

map.nodes[19755847] = Rare({
    id=155531,
    quest=56823,
    assault=AQR,
    note=L["wastewander"],
    pois={
        POI({
            17896249, 18026020, 18406490, 18966279, 19176080, 19626403, 19696174,
            19976498, 20036084, 20336267, 20686052, 20796452, 21365790, 22056027,
            22086169, 22135658, 22156465, 22656370, 22905737, 22976012, 23205863,
            23246283, 23706188, 24146211, 24316070, 24366309, 24495822, 24616524,
            24806225, 25306412
        }) -- Wastewander Host
    }
}) -- Infested Wastewander Captain

map.nodes[73908353] = Rare({
    id=157134,
    quest=57259,
    rewards={
        Mount({id=1314, item=174641}) -- Drake of the Four Winds
    }
}) -- Ishak of the Four Winds

map.nodes[77005000] = Rare({
    id=152431,
    quest=55629,
    assault=AMA,
    note=L["kanebti"],
    requires=ns.requirement.Item(168160)
}) -- Kaneb-ti

map.nodes[71237375] = Rare({
    id=156655,
    quest=57433,
    assault=EMP
}) -- Korzaran the Slaughterer

map.nodes[34681890] = Rare({
    id=154604,
    quest=56340,
    assault=AQR,
    note=L["chamber_of_the_moon"],
    rewards={
        Pet({id=2847, item=174475}) -- Rotbreath
    }
}) -- Lord Aj'qirai

map.nodes[30476602] = Rare({
    id=156078,
    quest=56952,
    assault=AQR,
    pois={
        POI({30476602, 32876907, 33696573})
    }
}) -- Magus Rehleth

map.nodes[66842035] = Rare({
    id=157157,
    quest=57277,
    assault=AMA
}) -- Muminah the Incandescent

map.nodes[62012454] = Rare({
    id=152677,
    quest=55684,
    assault=AMA
}) -- Nebet the Ascended

map.nodes[35071729] = Rare({
    id=162196,
    quest=58681
}) -- Obsidian Annihilator

map.nodes[37505978] = Rare({
    id=162142,
    quest=58693,
    assault=AQR
}) -- Qho

map.nodes[58175712] = Rare({
    id=156299,
    quest=57430,
    assault={AQR, EMP},
    pois={
        Path({51055121, 52684913, 54554907, 56165227, 56795451, 58095721, 58536856})
    }
}) -- R'khuzj the Unfathomable

map.nodes[28651339] = Rare({
    id=162173,
    quest=58864,
    assault=AQR,
    pois={
        Path({
            38031012, 36071044, 34261112, 31611053, 29200919, 27930731, 26460550,
            24980615, 24810886, 26881180, 28651339, 28381641, 29341853, 29392137,
            29472409, 29822663, 30342939, 30333188, 30103380
        })
    }
}) -- R'krox the Runt

map.nodes[68593204] = Rare({
    id=157146,
    quest=57273,
    assault=AMA,
    rewards={
        Mount({id=1317, item=174753}) -- Waste Marauder
    }
}) -- Rotfeaster

map.nodes[69714215] = Rare({
    id=152040,
    quest=55518,
    assault=AMA
}) -- Scoutmaster Moswen

map.nodes[73536459] = Rare({
    id=151948,
    quest=55496,
    assault=AMA
}) -- Senbu the Pridefather

map.nodes[57003794] = Rare({
    id=161033,
    quest=58333,
    assault=EMP,
    pois={
        POI({57003794, 52174326})
    }
})-- Shadowmaw

map.nodes[58558282] = Rare({
    id=156654,
    quest=57432,
    assault=EMP
}) -- Shol'thoss the Doomspeaker

map.nodes[61297484] = Rare({
    id=160532,
    quest=58169,
    assault={AQR, EMP}
}) -- Shoth the Darkened

map.nodes[21236105] = Rare({
    id=162140,
    quest=58697,
    assault=AQR,
    rewards={
        Pet({id=2848, item=174476}) -- Aqir Tunneler
    },
    pois={
        Path({22486168, 21316279, 19896347, 19356128, 20345804, 21435846, 24325860, 24866015, 24406194, 22486168})
    }
}) -- Skikx'traz

map.nodes[66676804] = Rare({
    id=162372,
    quest=58715,
    assault={AQR, AMA},
    pois={
        POI({58606160, 58038282, 66676804, 70997407})
    }
}) -- Spirit of Cyrus the Black

map.nodes[49944011] = Rare({
    id=162352,
    quest=58716,
    assault={AQR, AMA},
    note=L["in_water_cave"],
    pois={
        POI({52154012}) -- Cave entrance
    }
}) -- Spirit of Dark Ritualist Zakahn

map.nodes[78986389] = Rare({
    id=151878,
    quest=58613,
    assault=AMA
}) -- Sun King Nahkotep

map.nodes[84785704] = Rare({
    id=151897,
    quest=55479,
    assault=AMA
}) -- Sun Priestess Nubitt

map.nodes[73347447] = Rare({
    id=151609,
    quest=55353,
    assault=AMA
}) -- Sun Prophet Epaphos

map.nodes[65903522] = Rare({
    id=152657,
    quest=55682,
    assault=AMA,
    pois={
        Path({68043800, 64873862, 64503660, 65903522, 67003162, 67743515, 68043800})
    }
}) -- Tat the Bonechewer

map.nodes[49328235] = Rare({
    id=158636,
    quest=57688,
    assault=EMP,
    note=L["platform"],
    rewards={
        Toy({item=169303}) -- Hell-Bent Bracers
    }
}) -- The Grand Executor

map.nodes[84324729] = Rare({
    id=157188,
    quest=57285,
    assault=AMA,
    note=L["tomb_widow"]
}) -- The Tomb Widow

map.nodes[60014937] = Rare({
    id=158595,
    quest=57673,
    assault=EMP
}) -- Thoughtstealer Vos

map.nodes[67486382] = Rare({
    id=152788,
    quest=55716,
    assault=AMA,
    note=L["uatka"],
    requires=ns.requirement.Item(171208),
    rewards={
        Item({item=174875}) -- Obelisk of the Sun
    }
}) -- Uat-ka the Sun's Wrath

map.nodes[33592569] = Rare({
    id=162170,
    quest=58702,
    assault=AQR
}) -- Warcaster Xeshro

map.nodes[79505217] = Rare({
    id=151852,
    quest=55461,
    assault=AMA,
    pois={
        Path({77755217, 81265217})
    }
}) -- Watcher Rehu

map.nodes[80165708] = Rare({
    id=157164,
    quest=57279,
    assault=AMA
}) -- Zealot Tekem

map.nodes[39694159] = Rare({
    id=162141,
    quest=58695,
    assault=AQR
}) -- Zuythiz

-------------------------------------------------------------------------------
------------------------------- NEFERSET RARES --------------------------------
-------------------------------------------------------------------------------

local start = 45009400
local function coord(x, y)
    return start + x*2500000 + y*400
end

local NefRare = Class('NefersetRare', Rare, {
    assault=EMP,
    note=L["neferset_rare"],
    pois={POI({50007868, 50568833, 55207930})}
})

function NefRare:PrerequisiteCompleted()
    -- Show only if a Summoning Ritual event is active or completed
    for i, quest in ipairs({57359, 57620, 57621}) do
        if C_TaskQuest.GetQuestTimeLeftMinutes(quest) or C_QuestLog.IsQuestFlaggedCompleted(quest) then
            return true
        end
    end
    return false
end

map.nodes[coord(0, 0)] = NefRare({id=157472, quest=57437}) -- Aphrom the Guise of Madness
map.nodes[coord(1, 0)] = NefRare({id=157470, quest=57436}) -- R'aas the Anima Devourer
map.nodes[coord(2, 0)] = NefRare({id=157390, quest=57434}) -- R'oyolok the Reality Eater
map.nodes[coord(3, 0)] = NefRare({id=157476, quest=57439}) -- Shugshul the Flesh Gorger
map.nodes[coord(4, 0)] = NefRare({id=157473, quest=57438, rewards={Toy({item=174874})}}) -- Yiphrim the Will Ravager
map.nodes[coord(5, 0)] = NefRare({id=157469, quest=57435}) -- Zoth'rum the Intellect Pillager

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

local AQRChest = Class('AQRChest', Treasure, {
    assault=AQR,
    group=ns.groups.DAILY_CHESTS,
    label=L["infested_cache"]
})

local AQRTR1 = AQRChest({quest=58138, icon='chest_rd', fgroup='aqrchest1'})
local AQRTR2 = AQRChest({quest=58139, icon='chest_yw'})
local AQRTR3 = AQRChest({quest=58140, icon='chest_bl'})
local AQRTR4 = AQRChest({quest=58141, icon='chest_pp'})
local AQRTR5 = AQRChest({quest=58142, icon='chest_gn', fgroup='aqrchest5'})

-- quest=58138
map.nodes[43925868] = Clone(AQRTR1, {note=L["chamber_of_the_sun"]})
map.nodes[44855696] = AQRTR1
map.nodes[45845698] = Clone(AQRTR1, {note=L["chamber_of_the_sun"]})
map.nodes[46176156] = AQRTR1
map.nodes[46525801] = AQRTR1
map.nodes[50555882] = AQRTR1
map.nodes[51736032] = AQRTR1
-- quest=58139
map.nodes[27476410] = AQRTR2
map.nodes[30526540] = AQRTR2
map.nodes[31166796] = AQRTR2
map.nodes[32764770] = AQRTR2
map.nodes[32976010] = AQRTR2
map.nodes[33366210] = AQRTR2
map.nodes[33476998] = AQRTR2
-- quest=58140
map.nodes[18356130] = AQRTR3
map.nodes[19836512] = AQRTR3
map.nodes[20585920] = AQRTR3
map.nodes[21706436] = AQRTR3
map.nodes[23406539] = AQRTR3
map.nodes[23055936] = AQRTR3
map.nodes[24525507] = AQRTR3
map.nodes[24606387] = AQRTR3
map.nodes[26066468] = AQRTR3
-- quest=58141
map.nodes[36032024] = AQRTR4
map.nodes[37484577] = AQRTR4
map.nodes[38774014] = AQRTR4
map.nodes[39692354] = AQRTR4
map.nodes[39754504] = AQRTR4
map.nodes[40244251] = AQRTR4
map.nodes[40454422] = AQRTR4
map.nodes[40823893] = AQRTR4
map.nodes[41604250] = AQRTR4
-- quest=58142
map.nodes[28030834] = AQRTR5
map.nodes[30671611] = AQRTR5
map.nodes[30903046] = AQRTR5
map.nodes[31303070] = AQRTR5
map.nodes[31521515] = AQRTR5
map.nodes[33571901] = AQRTR5
map.nodes[33953036] = AQRTR5
map.nodes[35101878] = AQRTR5
map.nodes[35413157] = AQRTR5
map.nodes[36871616] = AQRTR5
map.nodes[41592264] = Clone(AQRTR5, {note=L["chamber_of_the_moon"]})
map.nodes[45561320] = AQRTR5

map.nodes[36252324] = Coffer({
    quest=58137,
    assault=AQR,
    label=L["infested_strongbox"],
    note=L["chamber_of_the_moon"],
    requires=ns.requirement.Item(174761)
})

-------------------------------------------------------------------------------

local EMPChest = Class('EMPChest', Treasure, {
    assault=EMP,
    group=ns.groups.DAILY_CHESTS,
    label=L["black_empire_cache"]
})

local EMPTR1 = EMPChest({quest=57623, icon='chest_pk', note=L["single_chest"]})
local EMPTR2 = EMPChest({quest=57624, icon='chest_pp', note=L["single_chest"]})
local EMPTR3 = EMPChest({quest=57625, icon='chest_gn', note=L["in_water"]..' '..L["single_chest"]})
local EMPTR4 = EMPChest({quest=57626, icon='chest_yw'})
local EMPTR5 = EMPChest({quest=57627, icon='chest_bl'})
local EMPTR6 = EMPChest({quest=57635, icon='chest_rd'})

-- quest=57623
map.nodes[58361535] = EMPTR1
-- quest=57624
map.nodes[50793143] = EMPTR2
-- quest=57625
map.nodes[52705006] = EMPTR3
-- quest=57626
map.nodes[57808250] = EMPTR4
map.nodes[57817487] = EMPTR4
map.nodes[58247282] = EMPTR4
map.nodes[59226749] = EMPTR4
map.nodes[59416224] = EMPTR4
map.nodes[60576213] = EMPTR4
map.nodes[61778172] = EMPTR4
map.nodes[62588188] = EMPTR4
map.nodes[62977610] = EMPTR4
map.nodes[62996440] = EMPTR4
map.nodes[64436501] = EMPTR4
map.nodes[66756810] = EMPTR4
map.nodes[67547066] = EMPTR4
map.nodes[70217325] = EMPTR4
-- quest=57627
map.nodes[59816610] = EMPTR5
map.nodes[59867422] = EMPTR5
map.nodes[60246529] = EMPTR5
map.nodes[60757493] = EMPTR5
map.nodes[60967000] = EMPTR5
map.nodes[61206544] = EMPTR5
map.nodes[61817595] = EMPTR5
map.nodes[62157346] = EMPTR5
map.nodes[62737184] = EMPTR5
map.nodes[62807565] = EMPTR5
map.nodes[63867065] = EMPTR5
map.nodes[64607503] = EMPTR5
map.nodes[65357117] = EMPTR5
map.nodes[67167394] = EMPTR5
-- quest=57635
map.nodes[45697961] = EMPTR6
map.nodes[47507687] = EMPTR6
map.nodes[49037684] = EMPTR6
map.nodes[49398584] = EMPTR6
map.nodes[49807210] = EMPTR6
map.nodes[50207510] = EMPTR6
map.nodes[51157388] = EMPTR6
map.nodes[51207970] = EMPTR6
map.nodes[51707135] = EMPTR6
map.nodes[51777298] = EMPTR6
map.nodes[51897858] = EMPTR6
map.nodes[52197757] = EMPTR6
map.nodes[55397860] = EMPTR6
map.nodes[55658346] = EMPTR6

local EMPCOFF = Coffer({
    quest=57628,
    assault=EMP,
    label=L["black_empire_coffer"],
    requires=ns.requirement.Item(174768)
})

map.nodes[71657334] = EMPCOFF

-------------------------------------------------------------------------------

local AMAChest = Class('AMAChest', Treasure, {
    assault=AMA,
    group=ns.groups.DAILY_CHESTS,
    label=L["amathet_cache"]
})

local AMATR1 = AMAChest({quest=55689, icon='chest_rd'})
local AMATR2 = AMAChest({quest=55690, icon='chest_pp'})
local AMATR3 = AMAChest({quest=55691, icon='chest_bl'})
local AMATR4 = AMAChest({quest=55698, icon='chest_yw'})
local AMATR5 = AMAChest({quest=55699, icon='chest_gn'})
local AMATR6 = AMAChest({quest=55700, icon='chest_pk', fgroup='amachest6'})

-- quest=55689
map.nodes[78265073] = AMATR1
map.nodes[80575110] = AMATR1
map.nodes[80785611] = AMATR1
map.nodes[81585359] = AMATR1
map.nodes[84534540] = AMATR1
map.nodes[84836185] = AMATR1
map.nodes[84995395] = AMATR1
map.nodes[85005097] = AMATR1
map.nodes[85275138] = AMATR1
map.nodes[85285297] = AMATR1
-- quest=55690
map.nodes[70325819] = AMATR2
map.nodes[71226851] = AMATR2
map.nodes[71305922] = AMATR2
map.nodes[72216422] = AMATR2
map.nodes[73117297] = AMATR2
map.nodes[73707393] = AMATR2
map.nodes[73987095] = AMATR2
map.nodes[74206460] = AMATR2
map.nodes[78286207] = AMATR2
map.nodes[79166486] = AMATR2
-- quest=55691
map.nodes[71504750] = AMATR3
map.nodes[72474857] = AMATR3
map.nodes[73035386] = AMATR3
map.nodes[73045143] = AMATR3
map.nodes[74195187] = AMATR3
map.nodes[75335579] = AMATR3
map.nodes[75575372] = AMATR3
map.nodes[76364879] = AMATR3
map.nodes[78125302] = AMATR3
-- quest=55698
map.nodes[71884388] = AMATR4
map.nodes[72764468] = AMATR4
map.nodes[72944350] = AMATR4
map.nodes[73714646] = AMATR4
map.nodes[74364390] = AMATR4
map.nodes[75134608] = AMATR4
map.nodes[76344679] = AMATR4
map.nodes[77274934] = AMATR4
map.nodes[77544828] = AMATR4
map.nodes[79314578] = AMATR4
-- quest=55699 (no blizzard minimap icon for this one?)
map.nodes[63084970] = AMATR5
map.nodes[64094488] = AMATR5
map.nodes[65403796] = AMATR5
map.nodes[66394350] = AMATR5
map.nodes[66624829] = AMATR5
map.nodes[67004050] = AMATR5
map.nodes[67884158] = AMATR5
map.nodes[69744236] = AMATR5
map.nodes[69874163] = AMATR5
-- quest=55700
map.nodes[60932455] = AMATR6
map.nodes[61343060] = AMATR6
map.nodes[62722355] = AMATR6
map.nodes[63122508] = Clone(AMATR6, {note=L["chamber_of_the_stars"]})
map.nodes[63532160] = AMATR6
map.nodes[65543142] = AMATR6
map.nodes[65882147] = Clone(AMATR6, {note=L["chamber_of_the_stars"]})
map.nodes[67172800] = Clone(AMATR6, {note=L["chamber_of_the_stars"]})
map.nodes[68222051] = AMATR6
map.nodes[68933234] = AMATR6

local AMACOFF = Coffer({
    quest=55692,
    assault=AMA,
    fgroup='amacoffer',
    label=L["amathet_reliquary"],
    requires=ns.requirement.Item(174765)
})

map.nodes[64463415] = Clone(AMACOFF, {note=L["chamber_of_the_stars"]})
map.nodes[66882414] = AMACOFF
map.nodes[67464294] = AMACOFF
map.nodes[73337356] = AMACOFF
map.nodes[73685054] = AMACOFF
map.nodes[75914194] = AMACOFF
map.nodes[83116028] = AMACOFF

-------------------------------------------------------------------------------
-------------------------------- ASSAULT EVENTS -------------------------------
-------------------------------------------------------------------------------

map.nodes[34392928] = TimedEvent({quest=58679, assault=AQR, note=L["dormant_destroyer"]}) -- Dormant Destroyer
map.nodes[20765913] = TimedEvent({quest=58676, assault=AQR, note=L["dormant_destroyer"]}) -- Dormant Destroyer
map.nodes[31365562] = TimedEvent({quest=58667, assault=AQR, note=L["obsidian_extract"]}) -- Obsidian Extraction
map.nodes[36542060] = TimedEvent({quest=59003, assault=AQR, note=L["chamber_of_the_moon"]..' '..L["combust_cocoon"]}) -- Combustible Cocoons
map.nodes[37054778] = TimedEvent({quest=58961, assault=AQR, note=L["ambush_settlers"]}) -- Ambushed Settlers
map.nodes[27765714] = TimedEvent({quest=58974, assault=AQR, note=L["ambush_settlers"]}) -- Ambushed Settlers
map.nodes[22496418] = TimedEvent({quest=58952, assault=AQR, note=L["purging_flames"]}) -- Purging Flames
map.nodes[28336559] = TimedEvent({quest=58990, assault=AQR, note=L["titanus_egg"]}) -- Titanus Egg
map.nodes[46845804] = TimedEvent({quest=58981, assault=AQR, note=L["chamber_of_the_sun"]..' '..L["hardened_hive"]}) -- Hardened Hive
map.nodes[37136702] = TimedEvent({quest=58662, assault=AQR, note=L["burrowing_terrors"]}) -- Burrowing Terrors
map.nodes[45134306] = TimedEvent({quest=58661, assault=AQR, note=L["burrowing_terrors"]}) -- Burrowing Terrors
map.nodes[31614380] = TimedEvent({quest=58660, assault=AQR, note=L["burrowing_terrors"]}) -- Burrowing Terrors

-------------------------------------------------------------------------------

local MAWREWARD = {Achievement({id=14161, criteria=1})}

map.nodes[46793424] = TimedEvent({quest=58256, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw
map.nodes[55382132] = TimedEvent({quest=58257, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw
map.nodes[60154555] = TimedEvent({quest=58216, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw
map.nodes[62407931] = TimedEvent({quest=58258, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw

map.nodes[48518489] = TimedEvent({quest=57522, assault=EMP, note=L["call_of_void"]}) -- Call of the Void
map.nodes[53677575] = TimedEvent({quest=57585, assault=EMP, note=L["call_of_void"]}) -- Call of the Void
map.nodes[65907284] = TimedEvent({quest=57541, assault=EMP, note=L["call_of_void"]}) -- Call of the Void
map.nodes[52015072] = TimedEvent({quest=57543, assault=EMP, note=L["executor_nzoth"]}) -- Executor of N'Zoth
map.nodes[57044951] = TimedEvent({quest=57592, assault=EMP, note=L["executor_nzoth"]}) -- Executor of N'Zoth
map.nodes[59014663] = TimedEvent({quest=57580, assault=EMP, note=L["executor_nzoth"]}) -- Executor of N'Zoth
map.nodes[60203789] = TimedEvent({quest=57449, assault=EMP, note=L["executor_nzoth"]}) -- Executor of N'Zoth
map.nodes[66476806] = TimedEvent({quest=57582, assault=EMP, note=L["executor_nzoth"]}) -- Executor of N'Zoth
map.nodes[49443920] = TimedEvent({quest=58276, assault=EMP, note=L["in_flames"]}) -- Mar'at In Flames
map.nodes[50578232] = TimedEvent({quest=58275, assault=EMP, note=L["monstrous_summon"]}) -- Monstrous Summoning
map.nodes[59767241] = TimedEvent({quest=57429, assault=EMP, note=L["pyre_amalgamated"], rewards={
    Pet({id=2851, item=174478}) -- Wicked Lurker
}}) -- Pyre of the Amalgamated One (also 58330?)
map.nodes[49997867] = TimedEvent({quest=57620, assault=EMP, note=L["summoning_ritual"]}) -- Summoning Ritual
map.nodes[50568833] = TimedEvent({quest=57359, assault=EMP, note=L["summoning_ritual"]}) -- Summoning Ritual
map.nodes[55227932] = TimedEvent({quest=57621, assault=EMP, note=L["summoning_ritual"]}) -- Summoning Ritual
map.nodes[62037070] = TimedEvent({quest=58271, assault=EMP, note=L["voidflame_ritual"]}) -- Voidflame Ritual

map.nodes[46243068] = TimedEvent({quest=57586, assault=EMP, pois={
    Path({44272884, 44772860, 45202953, 46012982, 46243068, 47193047, 47773145, 47803309, 47203350})
}}) -- Spirit Drinker
map.nodes[47174044] = TimedEvent({quest=57456, assault=EMP, pois={
    Path({47944278, 47084245, 47254116, 47053964, 46583882, 46943783})
}}) -- Spirit Drinker
map.nodes[52733202] = TimedEvent({quest=57587, assault=EMP, pois={
    Path({53993205, 52733202, 51713098, 50903050, 50412889, 49212843, 48162695, 47002657})
}}) -- Spirit Drinker
map.nodes[58347785] = TimedEvent({quest=57590, assault=EMP, pois={
    Path({58908017, 58347785, 58907588, 58187367, 58687192, 58896905, 58886621})
}}) -- Spirit Drinker
map.nodes[59022780] = TimedEvent({quest=57588, assault=EMP, pois={
    Path({58102290, 58422547, 59022780, 59602914, 60063133, 60753296, 60453467})
}}) -- Spirit Drinker
map.nodes[60005506] = TimedEvent({quest=57591, assault=EMP, pois={
    Path({60315245, 59785364, 60005506, 60385696, 60495866})
}}) -- Spirit Drinker
map.nodes[64066598] = TimedEvent({quest=57589, assault=EMP, pois={
    Path({63356496, 64066598, 65306702, 65436896, 66697001, 67986971, 68547031, 68677190, 69447238, 69867349})
}}) -- Spirit Drinker

-------------------------------------------------------------------------------

map.nodes[84205548] = TimedEvent({quest=55670, assault=AMA, note=L["raiding_fleet"]}) -- Amathet Raiding Fleet
map.nodes[76094793] = TimedEvent({quest=57243, assault=AMA, note=L["slave_camp"]}) -- Amathet Slave Camp
map.nodes[62062069] = TimedEvent({quest=55356, assault=AMA, note=L["beacon_of_sun_king"]}) -- Beacon of the Sun King
map.nodes[71594586] = TimedEvent({quest=55358, assault=AMA, note=L["beacon_of_sun_king"]}) -- Beacon of the Sun King
map.nodes[83496186] = TimedEvent({quest=55357, assault=AMA, note=L["beacon_of_sun_king"]}) -- Beacon of the Sun King
map.nodes[64502932] = TimedEvent({quest=57215, assault=AMA, note=L["engine_of_ascen"]}) -- Engine of Ascension
map.nodes[64442267] = TimedEvent({quest=55355, assault=AMA, note=L["lightblade_training"]}) -- Lightblade Training Grounds
map.nodes[64483034] = TimedEvent({quest=55359, assault=AMA, note=L["chamber_of_the_stars"]..' '..L["ritual_ascension"]}) -- Ritual of Ascension
map.nodes[66515030] = TimedEvent({quest=57235, assault=AMA, note=L["solar_collector"]}) -- Solar Collector
map.nodes[80256607] = TimedEvent({quest=57234, assault=AMA, note=L["solar_collector"]}) -- Solar Collector
map.nodes[69905991] = TimedEvent({quest=55360, assault=AMA, note=L["unsealed_tomb"]}) -- The Unsealed Tomb
map.nodes[61414704] = TimedEvent({quest=55354, assault=AMA, note=L["virnall_front"]}) -- The Vir'nall Front
map.nodes[65513779] = TimedEvent({quest=57219, assault=AMA, note=L["unearthed_keeper"]}) -- Unearthed Keeper
map.nodes[71366849] = TimedEvent({quest=57217, assault=AMA, note=L["unearthed_keeper"]}) -- Unearthed Keeper
map.nodes[78225754] = TimedEvent({quest=57223, assault=AMA, note=L["unearthed_keeper"]}) -- Unearthed Keeper
map.nodes[82534796] = TimedEvent({quest=57218, assault=AMA, note=L["unearthed_keeper"]}) -- Unearthed Keeper

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[35453159] = PetBattle({id=162465}) -- Aqir Sandcrawler
map.nodes[57604356] = PetBattle({id=162466}) -- Blotto
map.nodes[62043188] = PetBattle({id=162458}) -- Retinus the Seeker
map.nodes[61745440] = PetBattle({id=162461}) -- Whispers

-------------------------------------------------------------------------------
------------------------------- SPRINGFUR ALPACA ------------------------------
-------------------------------------------------------------------------------

local function GetAlpacaStatus ()
    local count = select(4, GetQuestObjectiveInfo(58881, 0, false))
    if count ~= nil then return ns.status.Gray(tostring(count)..'/7') end
end

local alpaca = Class('Alpaca', Collectible, {
    id=162765,
    icon=2916287,
    quest=58879,
    note=L["friendly_alpaca"],
    pois={POI({
        15006200, 24000900, 27004800, 30002900, 39000800, 41007000, 47004800,
        52001900, 55006900, 62705340, 63011446, 70003900, 76636813
    })},
    rewards={Mount({id=1329, item=174859})}, -- Springfur Alpaca
    getters={rlabel=GetAlpacaStatus}
})()

local gersahl = Class('Gersahl', Collectible, {
    icon=134190,
    label=L["gersahl"],
    note=L["gersahl_note"],
    pois={POI({
        43802760, 46922961, 49453556, 50504167, 50583294, 53133577, 55484468,
        56114967, 56202550, 56265101, 56691882, 56901740, 57112548, 57235056,
        57281602, 57458491, 57474682, 57741910, 58005169, 58131768, 58202808,
        58967759, 59027433, 59098568, 59266302, 59557986, 59567664, 59628482,
        59805460, 60018165, 60447755, 60627655, 61371430, 64717249, 65167045,
        65427433, 66047881, 66137572, 66217063, 66257753, 66557212, 67377771,
        68097535, 68117202, 68517407, 68947308, 69237501, 71087875, 71657803
    })},
    rewards={Item({item=174858})}, -- Gersahl Greens
    getters={rlabel=GetAlpacaStatus},
    IsCompleted = function (self) return alpaca:IsCollected() end
})()

map.nodes[47004800] = alpaca
map.nodes[58005169] = gersahl


-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local _, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.VisionsMap
local Clone = ns.Clone

local Coffer = ns.node.Coffer
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local TimedEvent = ns.node.TimedEvent
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Quest = ns.reward.Quest
local Toy = ns.reward.Toy

local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local MAN, MOG, EMP = 0, 1, 2 -- assaults

local function GetAssault()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(1530)
    if textures and textures[1].fileDataIDs[1] == 3155826 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Vale assault: MAN') end
        return MAN -- left
    elseif textures and textures[1].fileDataIDs[1] == 3155832 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Vale assault: MOG') end
        return MOG -- middle
    elseif textures and textures[1].fileDataIDs[1] == 3155841 then
        if ns:GetOpt('show_debug_map') then ns.Debug('Vale assault: EMP') end
        return EMP -- right
    end
end

-------------------------------------------------------------------------------

local map = Map({id=1530, phased=false, settings=true, GetAssault=GetAssault})
local pools = Map({id=1579, GetAssault=GetAssault})

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = Class('Intro', ns.node.Intro)

Intro.note = L["vale_intro_note"]

function Intro:IsCompleted()
    return map.assault ~= nil
end

function Intro.getters:label()
    return select(2, GetAchievementInfo(14154)) -- Defend the Vale
end

-- Network Diagnostics => Surfacing Threats
local Q1 = Quest({id={58506, 56374, 56209, 56375, 56472, 56376}})
-- Forging Onward => Magni's Findings
local Q2 = Quest({id={56377, 56536, 56537, 56538, 56539, 56771, 56540}})

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({rewards={
        Quest({id={58496, 58498, 58502}}), Q1, Q2
    }})
else
    map.intro = Intro({rewards={
        Quest({id={58582, 58583}}), Q1, Q2
    }})
end

map.nodes[26005200] = map.intro

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[20007460] = Rare({
    id=160825,
    quest=58300,
    assault=MAN
}) -- Amber-Shaper Esh'ri

map.nodes[34156805] = Rare({
    id=157466,
    quest=57363,
    assault=MOG,
    rewards={
        Mount({id=1328, item=174840}) -- Xinlao
    }
}) -- Anh-De the Loyal

map.nodes[57084098] = Rare({
    id=154447,
    quest=56237,
    assault=EMP
}) -- Brother Meller

map.nodes[06487204] = Rare({
    id=160878,
    quest=58307,
    assault=MAN
}) -- Buh'gzaki the Blasphemous

map.nodes[06406433] = Rare({
    id=160893,
    quest=58308,
    assault=MAN,
    pois={
        Path({06476733, 06416420, 04016423, 04025675, 03985061, 06484877, 06484597})
    }
}) -- Captain Vor'lek

map.nodes[81226450] = Rare({
    id=154467,
    quest=56255,
    assault=EMP
}) -- Chief Mek-mek

map.nodes[18806841] = Rare({
    id=157183,
    quest=58296,
    assault=MOG,
    pois={
        POI({16806672, 18316516, 19026494, 20166403, 20816263, 20866845, 21016961, 19927330, 18607211})
    }
}) -- Coagulated Anima

map.nodes[66556794] = Rare({
    id=154559,
    quest=56323,
    assault=EMP,
    note=L["big_blossom_mine"]
}) -- Deeplord Zrihj

map.nodes[26506657] = Rare({
    id=160872,
    quest=58304,
    assault=MAN
}) -- Destroyer Krox'tazar

map.nodes[41505721] = Rare({
    id=157287,
    quest=57349,
    assault=MOG,
    pois={
        Path({41745982, 40446144, 38995953, 39805740, 41505721, 45405297})
    }
}) -- Dokani Obliterator

map.nodes[13004085] = Rare({
    id=160874,
    quest=58305,
    assault=MAN
}) -- Drone Keeper Ak'thet

map.nodes[10004085] = Rare({
    id=160876,
    quest=58306,
    assault=MAN
}) -- Enraged Amber Elemental

map.nodes[45244524] = Rare({
    id=157267,
    quest=57343,
    assault=EMP,
    pois={
        Path({44174609, 45244524, 45324176, 44783891})
    }
}) -- Escaped Mutation

map.nodes[29513800] = Rare({
    id=157153,
    quest=57344,
    assault=MOG,
    rewards={
        Mount({id=1297, item=173887}) -- Clutch of Ha-Li
    },
    pois={
        Path({37323630, 33973378, 29053930, 31524387, 37313632, 37323630})
    }
}) -- Ha-Li

map.nodes[28895272] = Rare({
    id=160810,
    quest=58299,
    assault=MAN
}) -- Harbinger Il'koxik

map.nodes[12835129] = Rare({
    id=160868,
    quest=58303,
    assault=MAN
}) -- Harrier Nir'verash

map.nodes[28214047] = Rare({
    id=157171,
    quest=57347,
    assault=MOG
}) -- Heixi the Stonelord

map.nodes[19736082] = Rare({
    id=160826,
    quest=58301,
    assault=MAN
}) -- Hive-Guard Naz'ruzek

map.nodes[12183091] = Rare({
    id=157160,
    quest=57345,
    assault=MOG,
    rewards={
        Mount({id=1327, item=174841}) -- Ren's Stalwart Hound
    },
    pois={
        Path({13132578, 11833049, 08953570})
    }
}) -- Houndlord Ren

map.nodes[19976576] = Rare({
    id=160930,
    quest=58312,
    assault=MAN
}) -- Infused Amber Ooze

map.nodes[17201162] = Rare({
    id=160968,
    quest=58295,
    assault=MOG,
    note=L["guolai_left"]
}) -- Jade Colossus

map.nodes[26691061] = Rare({
    id=157290,
    quest=57350,
    assault=MOG,
    note=L["in_small_cave"]
}) -- Jade Watcher

map.nodes[17850918] = Rare({
    id=160920,
    quest=58310,
    assault=MAN
}) -- Kal'tik the Blight

map.nodes[45985858] = Rare({
    id=157266,
    quest=57341,
    assault=EMP,
    pois={
        Path({45985858, 48645963, 50576511, 48936926, 45877046, 43096817, 42486336, 45985858})
    }
}) -- Kilxl the Gaping Maw

map.nodes[25673816] = Rare({
    id=160867,
    quest=58302,
    assault=MAN
}) -- Kzit'kovok

map.nodes[14813374] = Rare({
    id=160922,
    quest=58311,
    assault=MAN
}) -- Needler Zhesalla

map.nodes[90314599] = Rare({
    id=154106,
    quest=56094,
    assault=EMP
}) -- Quid

map.nodes[21901232] = Rare({
    id=157162,
    quest=57346,
    assault=MOG,
    note=L["guolai_center"],
    rewards={
        Item({item=174230}), -- Pristine Cloud Serpent Scale
        Mount({id=1313, item=174649}) -- Rajani Warserpent
    }
}) -- Rei Lun

map.nodes[64175175] = Rare({
    id=154490,
    quest=56302,
    assault=EMP
}) -- Rijz'x the Devourer

map.nodes[46425710] = Rare({
    id=156083,
    quest=56954,
    assault=MOG,
    rewards={
        Item({item=174071}) -- Sanguifang's Pulsating Canine
    }
}) -- Sanguifang

map.nodes[25074411] = Rare({
    id=160906,
    quest=58309,
    assault=MAN
}) -- Skiver

map.nodes[17873752] = Rare({
    id=157291,
    quest=57351,
    assault=MOG
}) -- Spymaster Hul'ach

map.nodes[26057505] = Rare({
    id=157279,
    quest=57348,
    assault=MOG,
    pois={
        Path({23467717, 25247587, 26837367, 27117143})
    }
}) -- Stormhowl

map.nodes[29132207] = Rare({
    id=156424,
    quest=58507,
    assault=MOG,
    rewards={
        Toy({item=174873}) -- Trans-mogu-rifier
    }
}) -- Tashara

map.nodes[47496373] = Rare({
    id=154600,
    quest=56332,
    assault=MOG
}) -- Teng the Awakened

map.nodes[52024173] = Rare({
    id=157176,
    quest=57342,
    assault=EMP,
    note=L["platform"],
    rewards={
        Pet({id=2845, item=174473}) -- K'uddly
    }
}) -- The Forgotten

map.nodes[09586736] = Rare({
    id=157468,
    quest=57364,
    note=L["tisiphon"]
}) -- Tisiphon

map.nodes[86664165] = Rare({
    id=154394,
    quest=56213,
    assault=EMP
}) -- Veskan the Fallen

map.nodes[66732812] = Rare({
    id=154332,
    quest=56183,
    assault=EMP,
    note=L["pools_of_power"]
}) -- Voidtender Malketh

map.nodes[52956225] = Rare({
    id=154495,
    quest=56303,
    assault=EMP,
    note=L["left_eye"],
    rewards={
        Item({item=175141}), -- All-Seeing Left Eye
        Toy({item=175140}), -- All-Seeing Eye
        Pet({id=2846, item=174474}) -- Corrupted Tentacle
    }
}) -- Will of N'Zoth

map.nodes[53794889] = Rare({
    id=157443,
    quest=57358,
    assault=MOG
}) -- Xiln the Mountain

map.nodes[70954053] = Rare({
    id=154087,
    quest=56084,
    assault=EMP
}) -- Zror'um the Infinite

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

local MANChest = Class('MANChest', Treasure, {
    assault=MAN,
    group=ns.groups.DAILY_CHESTS,
    label=L["ambered_cache"]
})

local MANTR1 = MANChest({quest=58224, icon='chest_rd'})
local MANTR2 = MANChest({quest=58225, icon='chest_bl', fgroup='manchest2'})
local MANTR3 = MANChest({quest=58226, icon='chest_yw'})
local MANTR4 = MANChest({quest=58227, icon='chest_pp'})
local MANTR5 = MANChest({quest=58228, icon='chest_gn'})

-- quest=58224
map.nodes[04066172] = MANTR1
map.nodes[05165140] = MANTR1
map.nodes[07223945] = MANTR1
map.nodes[10662334] = MANTR1
map.nodes[11552553] = MANTR1
map.nodes[15797164] = MANTR1
map.nodes[15887672] = MANTR1
-- quest=58225
map.nodes[16021946] = MANTR2
map.nodes[17432634] = MANTR2
map.nodes[19001350] = Clone(MANTR2, {note=L["guolai"]})
map.nodes[21051415] = MANTR2
map.nodes[26301110] = MANTR2
-- quest=58226
map.nodes[07693682] = MANTR3
map.nodes[09302831] = MANTR3
map.nodes[10174243] = MANTR3
map.nodes[12085118] = MANTR3
map.nodes[15083162] = MANTR3
map.nodes[15324320] = MANTR3
map.nodes[16343312] = MANTR3
map.nodes[17714771] = MANTR3
map.nodes[18253632] = MANTR3
-- quest=58227
map.nodes[18063844] = MANTR4
map.nodes[22903439] = MANTR4
map.nodes[24153524] = MANTR4
map.nodes[24994118] = MANTR4
map.nodes[25843841] = MANTR4
map.nodes[26524136] = MANTR4
map.nodes[26704680] = MANTR4
map.nodes[29944580] = MANTR4
map.nodes[30074194] = MANTR4
map.nodes[31724184] = MANTR4
-- quest=58228
map.nodes[07356617] = MANTR5
map.nodes[10746891] = MANTR5
map.nodes[15406394] = MANTR5
map.nodes[16096581] = MANTR5
map.nodes[19897504] = MANTR5
map.nodes[19975976] = MANTR5
map.nodes[21506269] = MANTR5
map.nodes[21636992] = MANTR5

map.nodes[21586246] = Coffer({
    quest=58770,
    assault=MAN,
    label=L["ambered_coffer"],
    requires=ns.requirement.Item(174766)
})

-------------------------------------------------------------------------------

local MOGChest = Class('MOGChest', Treasure, {
    assault=MOG,
    group=ns.groups.DAILY_CHESTS,
    label=L["mogu_plunder"]
})

local MOGTR1 = MOGChest({quest=57206, icon='chest_rd', note=L["guolai"]})
local MOGTR2 = MOGChest({quest=57208, icon='chest_bl'})
local MOGTR3 = MOGChest({quest=57209, icon='chest_yw'})
local MOGTR4 = MOGChest({quest=57211, icon='chest_pp'})
local MOGTR5 = MOGChest({quest=57212, icon='chest_pk'})
local MOGTR6 = MOGChest({quest=57213, icon='chest_gn'})

-- quest=57206
map.nodes[13500720] = MOGTR1
map.nodes[17741256] = MOGTR1
map.nodes[20221140] = MOGTR1
map.nodes[20441477] = MOGTR1
map.nodes[22971552] = MOGTR1
map.nodes[23850753] = MOGTR1
map.nodes[26001261] = MOGTR1
map.nodes[26130403] = MOGTR1
map.nodes[27061822] = MOGTR1
-- quest=57208
map.nodes[18292766] = MOGTR2
map.nodes[20462833] = MOGTR2
map.nodes[21982793] = MOGTR2
map.nodes[24773504] = MOGTR2
map.nodes[25114049] = MOGTR2
map.nodes[26801860] = MOGTR2
map.nodes[30283762] = MOGTR2
map.nodes[30983065] = MOGTR2
map.nodes[33503481] = MOGTR2
-- quest=57209
map.nodes[19281942] = MOGTR3
map.nodes[20311853] = MOGTR3
map.nodes[21271385] = MOGTR3
map.nodes[27981820] = MOGTR3
map.nodes[31241393] = MOGTR3
map.nodes[32721893] = MOGTR3
-- quest=57211
map.nodes[15496436] = MOGTR4
map.nodes[16704468] = MOGTR4
map.nodes[17356860] = MOGTR4
map.nodes[18787398] = MOGTR4
map.nodes[21356297] = MOGTR4
map.nodes[29774890] = MOGTR4
-- quest=57212
map.nodes[42436854] = MOGTR5
map.nodes[44186853] = MOGTR5
map.nodes[47937093] = MOGTR5
map.nodes[48466580] = MOGTR5
map.nodes[51146319] = MOGTR5
map.nodes[52276731] = MOGTR5
-- quest=57213
map.nodes[32097104] = MOGTR6
map.nodes[33346985] = MOGTR6
map.nodes[33876683] = MOGTR6
map.nodes[37666584] = MOGTR6
map.nodes[38417028] = MOGTR6

local MOGCOFF = Coffer({
    quest=57214,
    assault=MOG,
    fgroup='mogcoffer',
    label=L["mogu_strongbox"],
    requires=ns.requirement.Item(174767)
})

map.nodes[10782831] = MOGCOFF
map.nodes[20006321] = MOGCOFF
map.nodes[24430269] = Clone(MOGCOFF, {note=L["guolai_center"]})
map.nodes[43134209] = MOGCOFF
map.nodes[50182143] = MOGCOFF

-------------------------------------------------------------------------------

local EMPChest = Class('EMPChest', Treasure, {
    assault=EMP,
    group=ns.groups.DAILY_CHESTS,
    label=L["black_empire_cache"]
})

local EMPTR1 = EMPChest({quest=57197, icon='chest_rd'})
local EMPTR2 = EMPChest({quest=57199, icon='chest_yw', note=L["pools_of_power"], fgroup='empchest2', parent=map.id})
local EMPTR3 = EMPChest({quest=57200, icon='chest_gn'})
local EMPTR4 = EMPChest({quest=57201, icon='chest_bl'})
local EMPTR5 = EMPChest({quest=57202, icon='chest_pp', note=L["big_blossom_mine"]})
local EMPTR6 = EMPChest({quest=57203, icon='chest_pk'})

-- quest=57197
map.nodes[42024621] = EMPTR1
map.nodes[42314323] = EMPTR1
map.nodes[42814020] = EMPTR1
map.nodes[44274195] = EMPTR1
map.nodes[44483693] = EMPTR1
map.nodes[46314037] = EMPTR1
map.nodes[50673444] = EMPTR1
map.nodes[52673967] = EMPTR1
map.nodes[53884179] = EMPTR1
-- quest=57199
pools.nodes[09235255] = EMPTR2
pools.nodes[09554460] = EMPTR2
pools.nodes[15235182] = EMPTR2
pools.nodes[23234539] = EMPTR2
pools.nodes[32504372] = EMPTR2
pools.nodes[38294622] = EMPTR2
pools.nodes[45715972] = EMPTR2
pools.nodes[46313359] = EMPTR2
pools.nodes[54384017] = EMPTR2
-- quest=57200
map.nodes[57334165] = EMPTR3
map.nodes[59186181] = EMPTR3
map.nodes[59605624] = EMPTR3
map.nodes[61674641] = EMPTR3
map.nodes[62035159] = EMPTR3
map.nodes[62585721] = EMPTR3
map.nodes[65206504] = EMPTR3
map.nodes[65855969] = EMPTR3
map.nodes[67565584] = EMPTR3
-- quest=57201
map.nodes[70215370] = EMPTR4
map.nodes[76594867] = EMPTR4
map.nodes[77076363] = EMPTR4
map.nodes[77413129] = EMPTR4
map.nodes[78305251] = EMPTR4
map.nodes[78435833] = EMPTR4
map.nodes[79034330] = EMPTR4
map.nodes[80733960] = EMPTR4
map.nodes[81363381] = EMPTR4
map.nodes[87813771] = EMPTR4
-- quest=57202
map.nodes[60806337] = EMPTR5
map.nodes[63107059] = EMPTR5
map.nodes[64297053] = EMPTR5
map.nodes[68306247] = EMPTR5
map.nodes[68705880] = EMPTR5
map.nodes[70686357] = EMPTR5
map.nodes[71516854] = EMPTR5
-- quest=57203
map.nodes[42456853] = EMPTR6
map.nodes[44196852] = EMPTR6
map.nodes[47947095] = EMPTR6
map.nodes[48476579] = EMPTR6
map.nodes[51136323] = EMPTR6
map.nodes[52266732] = EMPTR6

local EMPCOFF = Coffer({
    quest=57628,
    assault=EMP,
    fgroup='empcoffer',
    label=L["black_empire_coffer"],
    requires=ns.requirement.Item(174768)
})

map.nodes[53116634] = EMPCOFF
map.nodes[54804100] = Clone(EMPCOFF, {note=L["platform"]})
map.nodes[62975086] = EMPCOFF
pools.nodes[42104690] = Clone(EMPCOFF, {note=L["pools_of_power"], parent=map.id})
map.nodes[69516094] = EMPCOFF
map.nodes[76626437] = EMPCOFF

-------------------------------------------------------------------------------
-------------------------------- ASSAULT EVENTS -------------------------------
-------------------------------------------------------------------------------

map.nodes[29266081] = TimedEvent({quest=57445, assault=MAN, note=L["noodle_cart"]}) -- Chin's Noodle Cart
map.nodes[08852675] = TimedEvent({quest=57521, assault=MAN, note=L["empowered_wagon"]}) -- Empowered War Wagon
map.nodes[11006443] = TimedEvent({quest=57085, assault=MAN, note=L["empowered_wagon"]}) -- Empowered War Wagon
map.nodes[18556572] = TimedEvent({quest=57540, assault=MAN, note=L["kunchong_incubator"]}) -- Kunchong Incubator
map.nodes[06484227] = TimedEvent({quest=57558, assault=MAN, note=L["mantid_hatch"]}) -- Mantid Hatchery
map.nodes[06487067] = TimedEvent({quest=57089, assault=MAN, note=L["mantid_hatch"]}) -- Mantid Hatchery
map.nodes[19287227] = TimedEvent({quest=57384, assault=MAN, note=L["mending_monstro"]}) -- Mending Monstrosity
map.nodes[26644650] = TimedEvent({quest=57404, assault=MAN, note=L["ravager_hive"]}) -- Ravager Hive
map.nodes[16964567] = TimedEvent({quest=57484, assault=MAN, note=L["ritual_wakening"]}) -- Ritual of Wakening
map.nodes[14073421] = TimedEvent({quest=57453, assault=MAN, note=L["swarm_caller"]}) -- Swarm Caller
map.nodes[25663647] = TimedEvent({quest=57517, assault=MAN, note=L["swarm_caller"]}) -- Swarm Caller
map.nodes[27011715] = TimedEvent({quest=57519, assault=MAN, note=L["swarm_caller"]}) -- Swarm Caller
map.nodes[31146095] = TimedEvent({quest=57542, assault=MAN, note=L["swarm_caller"]}) -- Swarm Caller
map.nodes[11384092] = TimedEvent({quest=57476, assault=MAN, note=L["feeding_grounds"]}) -- Vil'thik Feeding Grounds
map.nodes[11034854] = TimedEvent({quest=57508, assault=MAN, note=L["war_banner"]}) -- Zara'thik War Banner

-------------------------------------------------------------------------------

map.nodes[31332897] = TimedEvent({quest=57087, assault=MOG, note=L["colored_flames"]}) -- Baruk Obliterator
map.nodes[19167199] = TimedEvent({quest=57272, assault=MOG, note=L["colored_flames"]}) -- Bloodbound Effigy
map.nodes[25791737] = TimedEvent({quest=57339, assault=MOG, note=L["guolai_right"]..' '..L["construction_ritual"]}) -- Construction Ritual
map.nodes[14582315] = TimedEvent({quest=57158, assault=MOG, note=L["electric_empower"]}) -- Electric Empowerment
map.nodes[22423650] = TimedEvent({quest=58367, assault=MOG, note=L["empowered_demo"]}) -- Empowered Demolisher
map.nodes[26661700] = TimedEvent({quest=58370, assault=MOG, note=L["empowered_demo"]}) -- Empowered Demolisher
map.nodes[20421247] = TimedEvent({quest=57171, assault=MOG, note=L["goldbough_guardian"]}) -- Goldbough Guardian
map.nodes[33477097] = TimedEvent({quest=58334, assault=MOG, note=L["in_flames"]}) -- Mistfall In Flames
map.nodes[50236341] = TimedEvent({quest=57299, assault=MOG, note=L["mystery_sacro"]}) -- Mysterious Sarcophagus
map.nodes[24824769] = TimedEvent({quest=57323, assault=MOG, note=L["serpent_binding"]}) -- Serpent Binding
map.nodes[17054571] = TimedEvent({quest=57256, assault=MOG, note=L["stormchosen_arena"]}) -- Stormchosen Arena
map.nodes[19870750] = TimedEvent({quest=57049, assault=MOG, note=L["guolai_left"]..' '..L["vault_of_souls"]}) -- Vault of Souls
map.nodes[21411413] = TimedEvent({quest=57023, assault=MOG, note=L["guolai_center"]..' '..L["weighted_artifact"]}) -- Weighted Mogu Artifact
map.nodes[47662165] = TimedEvent({quest=57101, assault=MOG, note=L["colored_flames"]}) -- Zan-Tien Serpent Cage

-------------------------------------------------------------------------------

local MAWREWARD = {Achievement({id=14161, criteria=1})}

map.nodes[41354535] = TimedEvent({quest=58439, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw
map.nodes[46365714] = TimedEvent({quest=58438, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw
map.nodes[81314952] = TimedEvent({quest=58442, assault=EMP, note=L["consuming_maw"], rewards=MAWREWARD}) -- Consuming Maw

map.nodes[42316703] = TimedEvent({quest=56090, assault=EMP, note=L["protect_stout"]}) -- Protecting the Stout
map.nodes[43624146] = TimedEvent({quest=57146, assault=EMP, note=L["corruption_tear"]}) -- Corruption Tear
map.nodes[49356668] = TimedEvent({quest=56074, assault=EMP, note=L["void_conduit"]}) -- Void Conduit
map.nodes[56685933] = TimedEvent({quest=56178, assault=EMP, note=L["void_conduit"]}) -- Void Conduit
map.nodes[60614333] = TimedEvent({quest=56163, assault=EMP, note=L["bound_guardian"]}) -- Bound Guardian
map.nodes[60416780] = TimedEvent({quest=56099, assault=EMP, note=L["big_blossom_mine"]..' '..L["font_corruption"]}) -- Font of Corruption
map.nodes[69502214] = TimedEvent({quest=57375, assault=EMP, note=L["pulse_mound"]}) -- Pulsating Mound
map.nodes[74164004] = TimedEvent({quest=56076, assault=EMP, note=L["abyssal_ritual"]}) -- Abyssal Ritual
map.nodes[76365163] = TimedEvent({quest=57379, assault=EMP, note=L["infested_statue"]}) -- Infested Jade Statue
map.nodes[79233315] = TimedEvent({quest=56177, assault=EMP, note=L["void_conduit"]}) -- Void Conduit
map.nodes[79525433] = TimedEvent({quest=56180, assault=EMP, note=L["bound_guardian"]}) -- Bound Guardian

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[28553494] = PetBattle({id=162470}) -- Baruk Stone Defender
map.nodes[56172822] = PetBattle({id=162468}) -- K'tiny the Mad
map.nodes[57465427] = PetBattle({id=162469}) -- Tormentius
map.nodes[07333190] = PetBattle({id=162471}) -- Vil'thik Hatchling


-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Clone = ns.Clone

local Map = ns.Map

local Collectible = ns.node.Collectible
local Node = ns.node.Node
local NPC = ns.node.NPC
local Rare = ns.node.Rare

local Mount = ns.reward.Mount
local Toy = ns.reward.Toy

local Path = ns.poi.Path

-------------------------------------------------------------------------------

local Buff = Class('Buff', Node, { group=ns.groups.VISIONS_BUFFS })

local Crystal = Class('Crystal', Node, {
    icon='crystal_o',
    scale=1.5,
    group=ns.groups.VISIONS_CRYSTALS,
    label=L["odd_crystal"]
})

local MAIL = Node({
    icon='envelope',
    scale=1.2,
    group=ns.groups.VISIONS_MAIL,
    label=L["mailbox"],
    note=L["mail_muncher"],
    rewards={
        Mount({id=1315, item=174653}) -- Mail Muncher
    }
})

local Chest = Class('VisionsChest', Node, {
    icon='chest_gy',
    scale=1.3,
    group=ns.groups.VISIONS_CHEST,
    label=L["black_empire_cache"]
})

local CHEST1 = Chest({fgroup='c1', sublabel=string.format(L["clear_sight"], 1)})
local CHEST2 = Chest({fgroup='c2', sublabel=string.format(L["clear_sight"], 2)})
local CHEST3 = Chest({fgroup='c3', sublabel=string.format(L["clear_sight"], 3)})

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local orgrimmar = Map({ id=1469, settings=true })
local stormwind = Map({ id=1470, settings=true })

-------------------------------------------------------------------------------
---------------------------------- ORGRIMMAR ----------------------------------
-------------------------------------------------------------------------------

-- Valley of Strength
orgrimmar.nodes[46927409] = CHEST1
orgrimmar.nodes[48036506] = CHEST1
orgrimmar.nodes[48197761] = CHEST1
orgrimmar.nodes[49537689] = CHEST1
orgrimmar.nodes[50067075] = CHEST1
orgrimmar.nodes[52967707] = CHEST1

-- Valley of Spirits
orgrimmar.nodes[32046909] = CHEST2
orgrimmar.nodes[34746325] = CHEST2
orgrimmar.nodes[34937546] = CHEST2
orgrimmar.nodes[35556927] = CHEST2
orgrimmar.nodes[35767889] = CHEST2
orgrimmar.nodes[37528493] = CHEST2
orgrimmar.nodes[39388038] = CHEST2

-- The Drag
orgrimmar.nodes[56915817] = Clone(CHEST2, {note=L["inside_building"]})
orgrimmar.nodes[57116273] = CHEST2
orgrimmar.nodes[57415604] = CHEST2
orgrimmar.nodes[57554961] = CHEST2
orgrimmar.nodes[60175638] = CHEST2
orgrimmar.nodes[60745806] = Clone(CHEST2, {note=L["inside_building"]})
orgrimmar.nodes[60985254] = CHEST2

-- Valley of Wisdom
orgrimmar.nodes[39474727] = CHEST3
orgrimmar.nodes[41224994] = CHEST3
orgrimmar.nodes[42064971] = CHEST3
orgrimmar.nodes[45195352] = CHEST3
orgrimmar.nodes[46895101] = CHEST3
orgrimmar.nodes[48474897] = CHEST3
orgrimmar.nodes[48874617] = CHEST3

-- Valley of Honor
orgrimmar.nodes[66283141] = CHEST3
orgrimmar.nodes[66763903] = CHEST3
orgrimmar.nodes[69164858] = CHEST3
orgrimmar.nodes[69384572] = CHEST3

-------------------------------------------------------------------------------

-- Valley of Strength
orgrimmar.nodes[48708380] = Crystal({note=L["c_behind_bank_counter"]})
orgrimmar.nodes[49406870] = Crystal({note=L["c_hidden_boxes"]})
orgrimmar.nodes[53508200] = Crystal({note=L["c_inside_hut"]})

-- Valley of Spirits
orgrimmar.nodes[33406570] = Crystal({note=L["c_center_building"]})
orgrimmar.nodes[35406940] = Crystal({note=L["c_top_building"]})
orgrimmar.nodes[37908450] = Crystal({note=L["c_behind_pillar"]})
orgrimmar.nodes[38508070] = Crystal({note=L["c_behind_boss"]})

-- The Drag
orgrimmar.nodes[57605860] = Crystal({note=L["c_inside_orphanage"]})
orgrimmar.nodes[57706510] = Crystal({note=L["c_inside_transmog"]})
orgrimmar.nodes[57904860] = Crystal({note=L["c_behind_boss"]})
orgrimmar.nodes[60405510] = Crystal({note=L["c_inside_leatherwork"]})

-- Valley of Wisdom
orgrimmar.nodes[38904990] = Crystal({note=L["c_inside_big_tent"]})
orgrimmar.nodes[41704480] = Crystal({note=L["c_inside_hut"]})
orgrimmar.nodes[48404410] = Crystal({note=L["c_on_small_hill"]})
orgrimmar.nodes[51004520] = Crystal({note=L["c_by_pillar_boxes"]})

-- Valley of Honor
orgrimmar.nodes[63903040] = Crystal({note=L["c_behind_rexxar"]})
orgrimmar.nodes[65805060] = Crystal({note=L["c_inside_cacti"]})
orgrimmar.nodes[67003740] = Crystal({note=L["c_inside_auction"]})
orgrimmar.nodes[68204290] = Crystal({note=L["c_underneath_bridge"]})

-------------------------------------------------------------------------------

orgrimmar.nodes[39304900] = MAIL
orgrimmar.nodes[39708030] = MAIL
orgrimmar.nodes[52707580] = MAIL
orgrimmar.nodes[60105130] = MAIL
orgrimmar.nodes[67673924] = MAIL

-------------------------------------------------------------------------------

orgrimmar.nodes[32106430] = Buff({
    icon=461119,
    label='{spell:313670}',
    note=L["spirit_of_wind_note"]..'\n\n'..L["buffs_change"]
}) -- Spirit of the Wind (Bwemba)

orgrimmar.nodes[44667697] = Buff({
    icon=133044,
    label='{spell:313770}',
    note=L["smiths_strength_note"]..'\n\n'..L["buffs_change"]
}) -- Smith's Strength (Naros)

orgrimmar.nodes[54277833] = Buff({
    icon=134991,
    label='{spell:313749}',
    note=L["heroes_bulwark_note"]..'\n\n'..L["buffs_change"]
}) -- Heroes' Bulwark (Gamon)

orgrimmar.nodes[57676513] = Buff({
    icon=1717106,
    label='{spell:313961}',
    note=L["ethereal_essence_note"]..'\n\n'..L["buffs_change"]
}) -- Ethereal Essence (Warpweaver Dushar)

-------------------------------------------------------------------------------

orgrimmar.nodes[54027044] = NPC({
    id=162358,
    icon=2823166,
    group=ns.groups.VISIONS_MISC,
    note=L["ethereal_note"]
}) -- Zarhaal

orgrimmar.nodes[46828078] = Node({
    icon=967522,
    group=ns.groups.VISIONS_MISC,
    label=L["colored_potion"],
    note=string.format(L["colored_potion_note"], '{npc:162324}')
})

orgrimmar.nodes[39906120] = Collectible({
    id=163441,
    icon=1001616,
    group=ns.groups.VISIONS_MISC,
    note=L["shave_kit_note"],
    rewards={
        Toy({item=174920}) -- Coifcurl's Close Shave Kit
    }
})

-------------------------------------------------------------------------------
---------------------------------- STORMWIND ----------------------------------
-------------------------------------------------------------------------------

-- Cathedral Square
stormwind.nodes[51955788] = CHEST1
stormwind.nodes[55085027] = CHEST1
stormwind.nodes[55845275] = CHEST1
stormwind.nodes[57034974] = CHEST1

-- Trade District
stormwind.nodes[61027547] = CHEST2
stormwind.nodes[61886605] = CHEST2
stormwind.nodes[63687447] = CHEST2
stormwind.nodes[66617039] = CHEST2

-- Dwarven District
stormwind.nodes[60573394] = CHEST2
stormwind.nodes[62522946] = CHEST2
stormwind.nodes[63424206] = CHEST2
stormwind.nodes[66223412] = CHEST2
stormwind.nodes[66694422] = CHEST2

-- Mage Quarter
stormwind.nodes[43018320] = CHEST3
stormwind.nodes[44658694] = CHEST3
stormwind.nodes[47478888] = CHEST3
stormwind.nodes[50169002] = CHEST3
stormwind.nodes[54048542] = CHEST3

-- Old Town
stormwind.nodes[72056202] = CHEST3
stormwind.nodes[73565625] = CHEST3
stormwind.nodes[75286476] = CHEST3
stormwind.nodes[76475374] = Clone(CHEST3, {note=L["inside_building"]})

-------------------------------------------------------------------------------

-- Cathedral Square
stormwind.nodes[53005190] = Crystal({note=L["c_left_cathedral"]})
stormwind.nodes[54605940] = Crystal({note=L["c_behind_boxes"]})
stormwind.nodes[58405510] = Crystal({note=L["c_on_small_hill"]})

-- Trade District
stormwind.nodes[60406880] = Crystal({note=L["c_alley_corner"]})
stormwind.nodes[62007690] = Crystal({note=L["c_behind_mailbox"]})
stormwind.nodes[66107570] = Crystal({note=L["c_behind_cart"]})
stormwind.nodes[69007310] = Crystal({note=L["c_left_inquisitor"]})

-- Dwarven District
stormwind.nodes[62703700] = Crystal({note=L["c_forge_corner"]})
stormwind.nodes[63404170] = Crystal()
stormwind.nodes[64603090] = Crystal({note=L["c_behind_boxes"]})
stormwind.nodes[67304470] = Crystal({note=L["c_forge_corner"]})

-- Mage Quarter
stormwind.nodes[44208790] = Crystal({note=L["c_walkway_corner"]})
stormwind.nodes[47408160] = Crystal({note=L["c_behind_house_counter"]})
stormwind.nodes[47708940] = Crystal({note=L["c_walkway_platform"]})
stormwind.nodes[52408340] = Crystal({note=L["c_behind_house_counter"]})

-- Old Town
stormwind.nodes[74605920] = Crystal({note=L["c_behind_boxes"]})
stormwind.nodes[75605340] = Crystal({note=L["c_bar_upper"]})
stormwind.nodes[75606460] = Crystal({note=L["c_behind_mailbox"]})
stormwind.nodes[76506850] = Crystal({note=L["c_behind_stables"]})

-------------------------------------------------------------------------------

stormwind.nodes[49688700] = MAIL
stormwind.nodes[54635751] = MAIL
stormwind.nodes[61687604] = MAIL
stormwind.nodes[62073082] = MAIL
stormwind.nodes[75716456] = MAIL

-------------------------------------------------------------------------------

stormwind.nodes[58404919] = Buff({
    icon=132183,
    label='{spell:312355}',
    note=L["bear_spirit_note"]..'\n\n'..L["buffs_change"]
}) -- Bear Spirit (Angry Bear Rug Spirit)

stormwind.nodes[53545906] = Buff({
    icon=1621334,
    label='{spell:314203}',
    note=L["requited_bulwark_note"]..'\n\n'..L["buffs_change"]
}) -- Requited Bulwark (Agustus Moulaine)

stormwind.nodes[59553713] = Buff({
    icon=133035,
    label='{spell:314165}',
    note=L["empowered_note"]..'\n\n'..L["buffs_change"]
}) -- Empowered (Experimental Buff Mine)

stormwind.nodes[63107740] = Buff({
    icon=133784,
    label='{spell:314087}',
    note=L["enriched_note"]..'\n\n'..L["buffs_change"]
}) -- Enriched (Neglected Guild Bank)

-------------------------------------------------------------------------------

stormwind.nodes[57204620] = NPC({
    id=162358,
    icon=2823166,
    group=ns.groups.VISIONS_MISC,
    note=L["ethereal_note"]
}) -- Zarhaal

stormwind.nodes[51765852] = Node({
    icon=967522,
    group=ns.groups.VISIONS_MISC,
    label=L["colored_potion"],
    note=string.format(L["colored_potion_note"], '{npc:162231}')
})

stormwind.nodes[58905290] = Collectible({
    icon=237272,
    group=ns.groups.VISIONS_MISC,
    label='{item:174921}',
    note=L["void_skull_note"],
    rewards={
        Toy({item=174921}) -- Void-Touched Skull
    }
})

stormwind.nodes[59106390] = Rare({
    id=158284,
    group=ns.groups.VISIONS_MISC,
    note=L["craggle"],
    pois={
        Path({
            58707630, 57507290, 56406950, 56706670, 59106390, 62306130,
            64706190, 67006490, 68406710
        })
    },
    rewards={
        Toy({item=174926}) -- Overly Sensitive Void Spectacles
    }
}) -- Craggle Wobbletop


-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Transmog = ns.reward.Transmog

local Arrow = ns.poi.Arrow
local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=864, settings=true })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[50328163] = Rare({
    id=135852,
    quest=51058,
    rewards={
        Achievement({id=12943, criteria=41606}),
        Transmog({item=161021, slot=L["cloth"]}) -- Soaring Slateclaw Gloves
    }
}) -- Ak'tar

map.nodes[54701513] = Rare({
    id=130439,
    quest=47532,
    rewards={
        Achievement({id=12943, criteria=41607}),
        Transmog({item=161106, slot=L["mail"]}) -- Rabid Packleader Bracers
    }
}) -- Ashmane

map.nodes[49028903] = Rare({
    id=128553,
    quest=49252,
    note=L["in_cave"],
    rewards={
        Achievement({id=12943, criteria=41608})
    },
    pois={
        POI({47888819}) -- Cave entrance
    }
}) -- Azer'tor

map.nodes[31008109] = Rare({
    id=128497,
    quest=49251,
    rewards={
        Achievement({id=12943, criteria=41609}),
        Transmog({item=162622, slot=L["plate"]}) -- Groggy Brawler's Chestplate
    }
}) -- Bajiani the Slick

map.nodes[48855005] = Rare({
    id=129476,
    quest=47562,
    rewards={
        Achievement({id=12943, criteria=41610}),
        Transmog({item=161037, slot=L["plate"]}) -- Sand Scoured Girdle
    }
}) -- Bloated Krolusk

map.nodes[56065359] = Rare({
    id=136393,
    quest=51079,
    note=L["bloodwing_bonepicker_note"],
    rewards={
        Achievement({id=12943, criteria=41611}),
        Transmog({item=161019, slot=L["cloth"]}) -- Dread Vulture Waistcord
    }
}) -- Bloodwing Bonepicker

map.nodes[41412410] = Rare({
    id=136346,
    quest=51073,
    rewards={
        Achievement({id=12943, criteria=41612}),
        Transmog({item=160990, slot=L["cloth"]}) -- Marrow's Sash
    }
}) -- Captain Stef "Marrow" Quin

map.nodes[42519208] = Rare({
    id=124722,
    quest=50905,
    rewards={
        Achievement({id=12943, criteria=41613}),
        Transmog({item=162615, slot=L["leather"]}) -- Commodore Calhoun's Tricorne
    }
}) -- Commodore Calhoun

map.nodes[61983783] = Rare({
    id=136335,
    quest=51077,
    rewards={
        Achievement({id=12943, criteria=41614}),
        Transmog({item=161036, slot=L["plate"]}) -- Sand-Smoothed Wristguards
    }
}) -- Enraged Krolusk

map.nodes[64014750] = Rare({
    id=128674,
    quest=49270,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12943, criteria=41615}),
        Transmog({item=161105, slot=L["mail"]}) -- Gluttonous Carnivore Treads
    }
}) -- Gut-Gut the Glutton

map.nodes[53605373] = Rare({
    id=130443,
    quest=47533,
    note=L["in_cave"],
    rewards={
        Achievement({id=12943, criteria=41616}),
        Transmog({item=161027, slot=L["leather"]}) -- Venomous Hivemother Cord
    },
    pois={
        POI({53865150}) -- Cave entrance
    }
}) -- Hivemother Kraxi

map.nodes[37408479] = Rare({
    id=129283,
    quest=49392,
    rewards={
        Achievement({id=12943, criteria=41617}),
        Transmog({item=161107, slot=L["plate"]}) -- Brineshell Footguards
    }
}) -- Jumbo Sandsnapper

map.nodes[60561801] = Rare({
    id=136341,
    quest=51074,
    rewards={
        Achievement({id=12943, criteria=41618}),
        Transmog({item=161026, slot=L["leather"]}) -- Spiderbite Wristwraps
    }
}) -- Jungleweb Hunter

map.nodes[35065184] = Rare({
    id=128686,
    quest=50528,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12943, criteria=41619}),
        Transmog({item=161038, slot=L["plate"]}) -- Sand Trapper's Legguards
    }
}) -- Kamid the Trapper

map.nodes[38284140] = Rare({
    id=137681,
    quest=51424,
    note=L["in_cave"],
    rewards={
        Achievement({id=12943, criteria=41620}),
        Transmog({item=161108, slot=L["plate"]}) -- Kingshell Legplates
    },
    pois={
        POI({37324051}) -- Cave entrance
    }
}) -- King Clickyclack

map.nodes[43768623] = Rare({
    id=128951,
    quest=50898,
    note=L["nezara_note"],
    rewards={
        Achievement({id=12943, criteria=41621}),
        Transmog({item=161024, slot=L["cloth"]}) -- Wrathful Sister's Cincture
    }
}) -- Nez'ara

map.nodes[48987216] = Rare({
    id=136340,
    quest=51126,
    rewards={
        Achievement({id=12943, criteria=41622}),
        Transmog({item=160956, slot=L["fist"]}) -- Hazaak's Windshorn Claws
    }
}) -- Relic Hunter Hazaak

map.nodes[44538023] = Rare({
    id=127776,
    quest=48960,
    rewards={
        Achievement({id=12943, criteria=41623}),
        Transmog({item=161039, slot=L["plate"]}) -- Sandclaw Handguards
    }
}) -- Scaleclaw Broodmother

map.nodes[32706507] = Rare({
    id=136336,
    quest=51076,
    rewards={
        Achievement({id=12943, criteria=41624}),
        Transmog({item=161030, slot=L["leather"]}) -- Vicious Scorpidsting Sandals
    }
}) -- Scorpox

map.nodes[24566845] = Rare({
    id=136338,
    quest=51075,
    rewards={
        Achievement({id=12943, criteria=41625}),
        Transmog({item=161099, slot=L["mail"]}) -- Wind-Scoured Greaves
    }
}) -- Sirokar

map.nodes[46972518] = Rare({
    id=134571,
    quest=50637,
    note=L["in_cave"],
    rewards={
        Achievement({id=12943, criteria=41626}),
        Transmog({item=160968, slot=L["staff"]}) -- Skycaller Spellstaff
    },
    pois={
        POI({46312713}) -- Cave entrance
    }
}) -- Skycaller Teskris

map.nodes[51293645] = Rare({
    id=134745,
    quest=50686,
    rewards={
        Achievement({id=12943, criteria=41627}),
        Transmog({item=160980, slot=L["warglaive"]}) -- Skycarver Warglaive
    }
}) -- Skycarver Krakit

map.nodes[66892446] = Rare({
    id=136304,
    quest=51063,
    rewards={
        Achievement({id=12943, criteria=41628}),
        Transmog({item=161025, slot=L["cloth"]}) -- Wailing Sister's Gloves
    }
}) -- Songstress Nahjeen

map.nodes[57317329] = Rare({
    id=130401,
    quest=49674,
    note=L["vathikur_note"],
    rewards={
        Achievement({id=12943, criteria=41629}),
        Transmog({item=161097, slot=L["leather"]}) -- Rattling Earth Armwraps
    }
}) -- Vathikur

map.nodes[37064605] = Rare({
    id=129180,
    quest=49373,
    rewards={
        Achievement({id=12943, criteria=41630}),
        Transmog({item=161032, slot=L["mail"]}) -- Spire-Charged Links
    }
}) -- Warbringer Hozzik

map.nodes[30205256] = Rare({
    id=134638,
    quest=50662,
    rewards={
        Achievement({id=12943, criteria=41631}),
        Transmog({item=161031, slot=L["mail"]}) -- Zothix's Conductive Vambraces
    }
}) -- Warlord Zothix

map.nodes[50713086] = Rare({
    id=134625,
    quest=50658,
    rewards={
        Achievement({id=12943, criteria=41632}),
        Transmog({item=161103, slot=L["mail"]}) -- Barbarous Captive's Wargreaves
    }
}) -- Warmother Captive

map.nodes[43905405] = Rare({
    id=129411,
    quest=48319,
    note=L["in_cave"]..' '..L["zunashi_note"],
    rewards={
        Achievement({id=12943, criteria=41633}),
        Item({item=161119, note=L["trinket"]}) -- Ravasaur Skull Bijou
    },
    pois={
        POI({43975252}) -- Entrance
    }
}) -- Zunashi the Exile

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- 47527542 50925
-- 48338890 50920
-- 49778730 51673
-- 52613184 50917

-------------------------------------------------------------------------------

map.nodes[46598801] = Treasure({
    quest=50237,
    note=L["ashvane_spoils_note"],
    rewards={
        Achievement({id=12849, criteria=40966})
    }
}) -- Ashvane Spoils

map.nodes[40578574] = Treasure({
    quest=52994,
    rewards={
        Achievement({id=12849, criteria=41003})
    }
}) -- Deadwood Chest

map.nodes[57746464] = Treasure({
    quest=51136,
    note=L["excavators_greed_note"],
    rewards={
        Achievement({id=12849, criteria=40971})
    }
}) -- Excavator's Greed

map.nodes[48186469] = Treasure({
    quest=51093,
    note=L["grayals_offering_note"],
    rewards={
        Achievement({id=12849, criteria=40967})
    },
    pois={
        POI({49076468}) -- Entrance
    }
}) -- Grayal's Last Offering

map.nodes[49787940] = Treasure({
    quest=51132,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12849, criteria=40968})
    }
}) -- Lost Explorer's Bounty

map.nodes[57061121] = Treasure({
    quest=52992,
    note=L["kimbul_offerings_note"],
    rewards={
        Achievement({id=12849, criteria=41002})
    }
}) -- Lost Offerings of Kimbul

map.nodes[47195846] = Treasure({
    quest=51133,
    rewards={
        Achievement({id=12849, criteria=40969})
    }
}) -- Sandfury Reserve

map.nodes[26484535] = Treasure({
    quest=53004,
    note=L["sandsunken_note"],
    rewards={
        Achievement({id=12849, criteria=41004})
    }
}) -- Sandsunken Treasure

map.nodes[44502613] = Treasure({
    quest=51135,
    rewards={
        Achievement({id=12849, criteria=40970})
    }
}) -- Stranded Cache

map.nodes[29388742] = Treasure({
    quest=51137,
    rewards={
        Achievement({id=12849, criteria=40972})
    }
}) -- Zem'lan's Buried Treasure

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55389,
    rewards={
        Achievement({id=13317, criteria=43935})
    }
}) -- quest = 54718 (looted ever) 55389 (looted today)

map.nodes[33704550] = SECRET_CHEST
map.nodes[37035019] = SECRET_CHEST
map.nodes[38605710] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[53238427] = Supply({
    quest=55412,
    fgroup='supply_path_1',
    pois={Arrow({53109000, 54102800})}
})
map.nodes[53406720] = Supply({
    quest=55412,
    fgroup='supply_path_1'
})
map.nodes[53804660] = Supply({
    quest=55412,
    fgroup='supply_path_1'
})

map.nodes[56604460] = Supply({
    quest=55412,
    fgroup='supply_path_2',
    pois={Arrow({72001884, 45006400})}
})
map.nodes[62903400] = Supply({
    quest=55412,
    fgroup='supply_path_2'
})
map.nodes[67602620] = Supply({
    quest=55412,
    fgroup='supply_path_2'
})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[30526194] = PetBattle({
    id=141969,
    rewards={
        Achievement({id=12936, criteria=44226})
    }
}) -- What Do You Mean, Mind Controlling Plants? (Spineleaf)

map.nodes[26585492] = PetBattle({
    id=141945,
    note=L["sizzik_note"],
    rewards={
        Achievement({id=12936, criteria=44228}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=15, oneline=true}), -- Beast
        Achievement({id=13271, criteria=15, oneline=true}), -- Critter
        Achievement({id=13272, criteria=15, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=15, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=15, oneline=true}), -- Flying
        Achievement({id=13275, criteria=15, oneline=true}), -- Magic
        Achievement({id=13277, criteria=15, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=15, oneline=true}), -- Undead
        Achievement({id=13280, criteria=15, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=15, oneline=true})  -- Humanoid
    }
}) -- Snakes on a Terrace (Sizzik)

map.nodes[45134642] = PetBattle({
    id=142054,
    note=L["kusa_note"],
    rewards={
        Achievement({id=12936, criteria=44227}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=16, oneline=true}), -- Beast
        Achievement({id=13271, criteria=16, oneline=true}), -- Critter
        Achievement({id=13272, criteria=16, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=16, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=16, oneline=true}), -- Flying
        Achievement({id=13275, criteria=16, oneline=true}), -- Magic
        Achievement({id=13277, criteria=16, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=16, oneline=true}), -- Undead
        Achievement({id=13280, criteria=16, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=16, oneline=true})  -- Humanoid
    }
}) -- Desert Survivors (Kusa)

map.nodes[57134896] = PetBattle({
    id=141879,
    note=L["keeyo_note"],
    rewards={
        Achievement({id=12936, criteria=44225}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=14, oneline=true}), -- Beast
        Achievement({id=13271, criteria=14, oneline=true}), -- Critter
        Achievement({id=13272, criteria=14, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=14, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=14, oneline=true}), -- Flying
        Achievement({id=13275, criteria=14, oneline=true}), -- Magic
        Achievement({id=13277, criteria=14, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=14, oneline=true}), -- Undead
        Achievement({id=13280, criteria=14, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=14, oneline=true})  -- Humanoid
    }
}) -- Keeyo's Champions of Vol'dun (Keeyo)

-------------------------------------------------------------------------------
------------------------------- A LOA OF A TALE -------------------------------
-------------------------------------------------------------------------------

map.nodes[42206206] = Collectible({
    quest=53532,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_akunda_note"],
    rewards={
        Achievement({id=13036, criteria=41564})
    }
}) -- Tales of de Loa: Akunda

map.nodes[27706205] = Collectible({
    quest=53539,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_kimbul_note"],
    rewards={
        Achievement({id=13036, criteria=41570})
    }
}) -- Tales of de Loa: Kimbul

map.nodes[49592446] = Collectible({
    quest=53543,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_sethraliss_note"],
    rewards={
        Achievement({id=13036, criteria=41574})
    }
}) -- Tales of de Loa: Sethraliss

-------------------------------------------------------------------------------
----------------------------- BOW TO YOUR MASTERS -----------------------------
-------------------------------------------------------------------------------

map.nodes[53189164] = Collectible({
    id=128152,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41497})
    }
}) -- Akunda

map.nodes[56571023] = Collectible({
    id=123052,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41499})
    }
}) -- Kimbul

map.nodes[27185257] = Collectible({
    id=135210,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41503})
    }
}) -- Sethraliss

-------------------------------------------------------------------------------
--------------------------------- DUNE RIDER ----------------------------------
-------------------------------------------------------------------------------

local DuneRider = Class('DuneRider', Collectible, {
    id=123535,
    icon=134962,
    group=ns.groups.DUNE_RIDER,
    rewards={
        Achievement({id=13018, criteria={
            {id=1, qty=true, suffix=L["planks_ridden"]}
        }})
    },
    IsCompleted = function (self)
        if self:IsCollected() then return true end
        return select(3, GetAchievementCriteriaInfoByID(13018, self.criteria))
    end
})

map.nodes[32146908] = DuneRider({criteria=41361, note=L["plank_1"]}) -- Cracked Coast
map.nodes[38037098] = DuneRider({criteria=41363, note=L["plank_2"]}) -- Zemlan
map.nodes[45746360] = DuneRider({criteria=41560, note=L["plank_3"], pois={
    Path({47916247, 47616221, 47106220, 46886272, 45936272, 46086301, 45746360})
}}) -- Drop Off
map.nodes[47916247] = DuneRider({criteria=41360, note=L["plank_4"]}) -- Atul'Aman
map.nodes[54902140] = DuneRider({criteria=41362, note=L["plank_5"], pois={
    Path({
        53493195, 54143208, 54853156, 55023033, 55422922, 56152855,
        56972813, 57562721, 57572598, 57332477, 57362349, 57232223,
        56572163, 55732185, 54902140
    }),
    POI({53493195})
}}) -- Skycaller's Spire

-------------------------------------------------------------------------------
-------------------- EATING OUT OF THE PALM OF MY TINY HAND -------------------
-------------------------------------------------------------------------------

map.nodes[61900950] = Collectible({
    icon=1881827,
    group=ns.groups.BRUTOSAURS,
    note=L["stompy_note"],
    rewards={
        Achievement({id=13029, criteria=41578})
    },
    pois={
        POI({40405540}) -- Rikati
    }
}) -- Ol' Stompy

-------------------------------------------------------------------------------
---------------------------------- GET HEK'D ----------------------------------
-------------------------------------------------------------------------------

map.nodes[46984655] = Collectible({
    quest=50883,
    icon=1604165,
    note=L["charged_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40045})
    }
}) -- Charged Ranishu Antennae (158910)

map.nodes[56271527] = Collectible({
    quest=50890,
    icon=1604165,
    note=L["ringhorn_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40046})
    }
}) -- Polished Ringhorn Hoof (158915)

map.nodes[42187208] = Collectible({
    quest=50901,
    icon=1604165,
    note=L["saurid_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40048})
    }
}) -- Saurid Surprise

map.nodes[49368440] = Collectible({
    quest=50892,
    icon=1604165,
    note=L["redrock_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40047})
    }
}) -- Sturdy Redrock Jaw (158916)

-------------------------------------------------------------------------------
------------------------------ MUSHROOM HARVEST -------------------------------
-------------------------------------------------------------------------------

map.nodes[61001820] = Collectible({
    id=143313,
    icon=1869654,
    group=ns.groups.MUSHROOM_HARVEST,
    rewards={
        Achievement({id=13027, criteria=41392})
    }
}) -- Portakillo

-------------------------------------------------------------------------------
--------------------------- SCAVENGER OF THE SANDS ----------------------------
-------------------------------------------------------------------------------

local ScavengerOfTheSands = Class('ScavengerOfTheSands', Collectible, {
    icon=135725,
    group=ns.groups.SCAVENGER_OF_THE_SANDS,
})

map.nodes[37803046] = ScavengerOfTheSands({
    quest=53135,
    rewards={
        Achievement({id=13016, criteria=41345})
    }
}) -- Brian's Broken Compass (163324)

map.nodes[45883073] = ScavengerOfTheSands({
    quest=53141,
    rewards={
        Achievement({id=13016, criteria=41351})
    }
}) -- Damarcus' Backpack (163372)

map.nodes[36217838] = ScavengerOfTheSands({
    quest=53133,
    rewards={
        Achievement({id=13016, criteria=41343})
    }
}) -- Ian's Empty Bottle (163322)

map.nodes[56297011] = ScavengerOfTheSands({
    quest=53132,
    rewards={
        Achievement({id=13016, criteria=41342})
    }
}) -- Jason's Rusty Blade (163321)

map.nodes[47933673] = ScavengerOfTheSands({
    quest=53143,
    note=L["in_cave"],
    rewards={
        Achievement({id=13016, criteria=41353})
    },
    pois={
        POI({47923545}) -- Entrance
    }
}) -- Josh's Fang Necklace (163374)

map.nodes[53568981] = ScavengerOfTheSands({
    quest=53134,
    rewards={
        Achievement({id=13016, criteria=41344})
    }
}) -- Julie's Cracked Dish (163323)

map.nodes[52431439] = ScavengerOfTheSands({
    quest=53138,
    rewards={
        Achievement({id=13016, criteria=41348})
    }
}) -- Julien's Left Boot (163327)

map.nodes[62862267] = ScavengerOfTheSands({
    quest=53145,
    rewards={
        Achievement({id=13016, criteria=41355})
    }
}) -- Kurt's Ornate Key (163376)

map.nodes[43217700] = ScavengerOfTheSands({
    quest=53139,
    rewards={
        Achievement({id=13016, criteria=41349})
    }
}) -- Navarro's Flask (163328)

map.nodes[26795291] = ScavengerOfTheSands({
    quest=53136,
    rewards={
        Achievement({id=13016, criteria=41346})
    }
}) -- Ofer's Bound Journal (163325)

map.nodes[45229114] = ScavengerOfTheSands({
    quest=53144,
    rewards={
        Achievement({id=13016, criteria=41354})
    }
}) -- Portrait of Commander Martens (163375)

map.nodes[66413595] = ScavengerOfTheSands({
    quest=53142,
    note=L["in_cave"],
    rewards={
        Achievement({id=13016, criteria=41352})
    },
    pois={
        POI({64873610}) -- Entrance
    }
}) -- Rachel's Flute (163373)

map.nodes[29465938] = ScavengerOfTheSands({
    quest=53137,
    rewards={
        Achievement({id=13016, criteria=41347})
    }
}) -- Skye's Pet Rock (163326)

map.nodes[47067577] = ScavengerOfTheSands({
    quest=53140,
    rewards={
        Achievement({id=13016, criteria=41350})
    }
}) -- Zach's Canteen (163329)

-------------------------------------------------------------------------------
------------------------------ ELUSIVE QUICKHOOF ------------------------------
-------------------------------------------------------------------------------

map.nodes[43006900] = Collectible({
    id=162681,
    icon=2916283,
    note=L["elusive_alpaca"],
    rewards={
        Mount({id=1324, item=174860}) -- Elusive Quickhoof
    },
    pois={
        POI({
            26405250, 29006600, 31106730, 42006000, 43006900, 51108590,
            52508900, 54008200, 54605320, 55007300
        })
    }
})

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[52758373] = ToAlltheSquirrels({
    id=134700,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50247})
    },
    pois={
        POI({52108640, 50008680})
    }
}) -- Vale Flutterby

-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map

local Collectible = ns.node.Collectible
local NPC = ns.node.NPC
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Transmog = ns.reward.Transmog

local Arrow = ns.poi.Arrow
local Line = ns.poi.Line
local Path = ns.poi.Path
local POI = ns.poi.POI

-------------------------------------------------------------------------------

local map = Map({ id=862, settings=true })
local daz = Map({ id=1165, settings=true })

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[80972163] = Rare({
    id=129961,
    quest=50280,
    rewards={
        Achievement({id=12944, criteria=41850}),
        Transmog({item=161042, slot=L["plate"]}) -- Gotaka's Wallopers
    }
}) -- Atal'zul Gotaka

map.nodes[49855744] = Rare({
    id=129343,
    quest=49410,
    note=L["in_cave"],
    rewards={
        Achievement({id=12944, criteria=41871}),
        Transmog({item=161034, slot=L["mail"]}) -- Thunderhowl Gauntlets
    },
    pois={
        POI({49555904}) -- Cave entrance
    }
}) -- Avatar of Xolotal

map.nodes[59821830] = Rare({
    id=128699,
    quest=49267,
    rewards={
        Achievement({id=12944, criteria=41872}),
        Transmog({item=161104, slot=L["mail"]}) -- Blood Feast Gauntlets
    }
}) -- Bloodbulge

map.nodes[66743228] = Rare({
    id=131718,
    quest=50034,
    rewards={
        Achievement({id=12944, criteria=41867}),
        Transmog({item=161020, slot=L["cloth"]}) -- Sky-Hunter Breeches
    }
}) -- Bramblewing

map.nodes[74203930] = Rare({
    id=133190,
    quest=50269,
    rewards={
        Achievement({id=12944, criteria=41864}),
        Transmog({item=160952, slot=L["dagger"]}) -- Daggerjaw's Incisor
    }
}) -- Daggerjaw

map.nodes[44157652] = Rare({
    id=136428,
    quest=51083,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12944, criteria=41852}),
        Transmog({item=160979, slot=L["offhand"]}) -- Ancient Chronicler's Focus
    }
}) -- Dark Chronicler

map.nodes[65411022] = Rare({
    id=134760,
    quest=50693,
    rewards={
        Achievement({id=12944, criteria=41855}),
        Transmog({item=160958, slot=L["1h_mace"]}) -- Darkspeaker Scepter
    }
}) -- Darkspeaker Jo'la

map.nodes[64253271] = Rare({
    id=129954,
    quest=50439,
    rewards={
        Achievement({id=12944, criteria=41851}),
        Transmog({item=161043, slot=L["plate"]}) -- Relentless Hydra Legguards
    }
}) -- Gahz'ralka

map.nodes[74112850] = Rare({
    id=124185,
    quest=47792,
    rewards={
        Achievement({id=12944, criteria=41876}),
        Transmog({item=161035, slot=L["mail"]}) -- Thundercrash Footguards
    }
}) -- Golrakahn

map.nodes[79973597] = Rare({
    id=133155,
    quest=50260,
    rewards={
        Achievement({id=12944, criteria=41865}),
        Transmog({item=161048, slot=L["cloth"]}) -- Brutish Tidecaller Armwraps
    }
}) -- G'Naat

map.nodes[42003620] = Rare({
    id=134738,
    quest=50677,
    rewards={
        Achievement({id=12944, criteria=41856}),
        Transmog({item=160978, slot=L["shield"]}) -- Golden Tomb Defender
    }
}) -- Hakbi the Risen

map.nodes[68664874] = Rare({
    id=126637,
    quest=48543,
    note=L["in_cave"],
    rewards={
        Achievement({id=12944, criteria=41874}),
        Transmog({item=160984, slot=L["cloak"]}) -- Sauroscale Cloak of Adaptation
    },
    pois={
        POI({68824710}) -- Cave entrance
    }
}) -- Kandak

map.nodes[75613582] = Rare({
    id=132244,
    quest=50159,
    rewards={
        Achievement({id=12944, criteria=41866}),
        Transmog({item=161112, slot=L["plate"]}) -- Hillshaker Armplates
    }
}) -- Kiboku

daz.nodes[54988253] = Rare({
    id=120899,
    quest=48333,
    parent=map.id,
    rewards={
        Achievement({id=12944, criteria=41875}),
        Transmog({item=160947, slot=L["1h_axe"]}) -- Amani Berserker's Chopper
    }
}) -- Kul'krazahn

map.nodes[58677417] = Rare({
    id=131233,
    quest=49911,
    rewards={
        Achievement({id=12944, criteria=41870}),
        Transmog({item=161033, slot=L["mail"]}) -- Jolting Leap Legguards
    }
}) -- Lei-zhi

map.nodes[60626627] = Rare({
    id=134782,
    quest=50281,
    note=L["murderbeak_note"],
    rewards={
        Achievement({id=12944, criteria=41863}),
        Transmog({item=161022, slot=L["cloth"]}) -- Gusting Axebeak Anklewraps
    }
}) -- Murderbeak

map.nodes[69563691] = Rare({
    id=149147,
    quest=54770,
    rewards={
        Pet({item=166345, id=2538}) -- Dasher
    },
    pois={
        Path({69503569, 69563691, 69603800})
    }
}) -- N'chala the Egg Thief

daz.nodes[36004620] = Rare({
    id=136413,
    quest=51080,
    note=L["in_small_cave"],
    parent=map.id,
    rewards={
        Achievement({id=12944, criteria=41853}),
        Transmog({item=161047, slot=L["cloth"]}) -- Shadow Wind Leggings
    }
}) -- Syrawon the Dominus

map.nodes[77711029] = Rare({
    id=131687,
    quest=50013,
    rewards={
        Achievement({id=12944, criteria=41868}),
        Transmog({item=161109, slot=L["plate"]}) -- Coastal Hardshell Girdle
    }
}) -- Tambano

map.nodes[46616533] = Rare({
    id=127939,
    quest=49004,
    rewards={
        Achievement({id=12944, criteria=41873}),
        Transmog({item=161029, slot=L["leather"]}) -- Ageless Toxin Grips
    }
}) -- Torraske the Eternal

map.nodes[71423239] = Rare({
    id=122004,
    quest=47567,
    note=L["in_cave"],
    rewards={
        Achievement({id=12944, criteria=41877}),
        Transmog({item=161091, slot=L["leather"]}) -- Swift-Talon Striders
    }
}) -- Umbra'jin

daz.nodes[61705120] = Rare({
    id=134048,
    quest=50508,
    note=L["vukuba_note"],
    parent=map.id,
    rewards={
        Achievement({id=12944, criteria=41858}),
        Transmog({item=162613, slot=L["cloth"]}) -- Mantle of Brood Mimicry
    }
}) -- Vukuba

map.nodes[43952544] = Rare({
    id=133842,
    quest=50438,
    rewards={
        Achievement({id=12944, criteria=41859}),
        Transmog({item=161040, slot=L["plate"]}) -- Arid Dune Stompers
    }
}) -- Warcrawler Karkithiss

map.nodes[48005424] = Rare({
    id=131476,
    quest=49972,
    rewards={
        Achievement({id=12944, criteria=41869}),
        Item({item=161125, note=L["trinket"]}) -- Kaja-fied Banana
    }
}) -- Zayoos

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- Daily treasures? Junk?
-- 52564719  862 50722 Treasure Chest
-- 67943651  862 50716 Treasure Chest
-- 42031415 1165 49142 Treasure Chest

-------------------------------------------------------------------------------

daz.nodes[39001580] = Treasure({
    label='{item:161443}',
    quest=52269,
    note=L["tiny_voodoo_mask_note"],
    parent=map.id,
    rewards={
        Item({item=161443, quest=52269})
    }
}) -- A Tiny Voodoo Mask

daz.nodes[44472690] = Treasure({
    quest=51338,
    note=L["cache_of_secrets_note"],
    parent=map.id,
    rewards={
        Achievement({id=12851, criteria=40996})
    }
}) -- Cache of Secrets

daz.nodes[59308866] = Treasure({
    quest=50947,
    note=L["da_white_shark_note"],
    parent=map.id,
    rewards={
        Achievement({id=12851, criteria=40994})
    }
}) -- Da White Shark's Bounty

map.nodes[38793444] = Treasure({
    quest=50707,
    note=L["dazars_forgotten_chest_note"],
    rewards={
        Achievement({id=12851, criteria=40993})
    },
    pois={
        Path({41953562, 41583471, 41063381, 40623270, 39913279, 39453364, 38793444})
    }
}) -- Dazar's Forgotten Chest

map.nodes[51442661] = Treasure({
    quest=50582,
    note=L["gift_of_the_brokenhearted_note"],
    rewards={
        Achievement({id=12851, criteria=40991})
    }
}) -- Gift of the Brokenhearted

daz.nodes[38280714] = Treasure({
    quest=48938,
    note=L["offerings_of_the_chosen_note"],
    parent=map.id,
    rewards={
        Achievement({id=12851, criteria=40988})
    }
}) -- Offerings of the Chosen

daz.nodes[34905440] = Treasure({
    quest=51624,
    note=L["riches_of_tornowa_note"],
    parent=map.id,
    rewards={
        Achievement({id=12851, criteria=40997})
    }
}) -- Riches of Tor'nowa

Map({id=1177}).nodes[23132391] = Treasure({
    quest=49936,
    note=L["spoils_of_pandaria_note"],
    parent=map.id,
    rewards={
        Achievement({id=12851, criteria=40990})
    }
}) -- Spoils of Pandaria

map.nodes[71821677] = Treasure({
    quest=50949,
    note=L["in_small_cave"],
    rewards={
        Achievement({id=12851, criteria=40995})
    }
}) -- The Exile's Lament

map.nodes[49506526] = Treasure({
    quest=49257,
    note=L["warlords_cache_note"],
    rewards={
        Achievement({id=12851, criteria=40992})
    }
}) -- Warlord's Cache

map.nodes[64712167] = Treasure({
    quest=50259,
    rewards={
        Achievement({id=12851, criteria=40989})
    }
}) -- Witch Doctor's Hoard

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = ns.node.SecretSupply({
    quest=55391,
    rewards={
        Achievement({id=13317, criteria=43936})
    }
}) -- quest = 54720 (looted ever) 55391 (looted today)

map.nodes[70653750] = SECRET_CHEST
map.nodes[79605150] = SECRET_CHEST
map.nodes[81345536] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[48206620] = Supply({
    quest=55413,
    fgroup='supply_path_1',
    pois={Arrow({80002179, 40007765})}
})
daz.nodes[51606880] = Supply({
    quest=55413,
    fgroup='supply_path_1',
    parent=map.id
})
map.nodes[71403380] = Supply({
    quest=55413,
    fgroup='supply_path_1'
})

daz.nodes[35041851] = Supply({
    quest=55413,
    fgroup='supply_path_2',
    parent=map.id
})
map.nodes[67203620] = Supply({
    quest=55413,
    fgroup='supply_path_2',
    pois={Arrow({45003475, 85003736})}
})
map.nodes[76383689] = Supply({
    quest=55413,
    fgroup='supply_path_2'
})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[68003400] = PetBattle({
    id=142151,
    rewards={
        Achievement({id=12936, criteria=44231})
    }
}) -- You've Never Seen Jammer Upset (Jammer)

map.nodes[48403500] = PetBattle({
    id=142114,
    note=L["talia_spark_note"],
    rewards={
        Achievement({id=12936, criteria=44230}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=18, oneline=true}), -- Beast
        Achievement({id=13271, criteria=18, oneline=true}), -- Critter
        Achievement({id=13272, criteria=18, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=18, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=18, oneline=true}), -- Flying
        Achievement({id=13275, criteria=18, oneline=true}), -- Magic
        Achievement({id=13277, criteria=18, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=18, oneline=true}), -- Undead
        Achievement({id=13280, criteria=18, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=18, oneline=true})  -- Humanoid
    }
}) -- Add More to the Collection (Talia Sparkbrow)

map.nodes[50562391] = PetBattle({
    id=142234,
    note=L["zujai_note"],
    rewards={
        Achievement({id=12936, criteria=44232}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=19, oneline=true}), -- Beast
        Achievement({id=13271, criteria=19, oneline=true}), -- Critter
        Achievement({id=13272, criteria=19, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=19, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=19, oneline=true}), -- Flying
        Achievement({id=13275, criteria=19, oneline=true}), -- Magic
        Achievement({id=13277, criteria=19, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=19, oneline=true}), -- Undead
        Achievement({id=13280, criteria=19, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=19, oneline=true})  -- Humanoid
    }
}) -- Small Beginnings (Zujai)

map.nodes[70552959] = PetBattle({
    id=142096,
    note=L["karaga_note"],
    rewards={
        Achievement({id=12936, criteria=44229}),
        ns.reward.Spacer(),
        Achievement({id=13270, criteria=17, oneline=true}), -- Beast
        Achievement({id=13271, criteria=17, oneline=true}), -- Critter
        Achievement({id=13272, criteria=17, oneline=true}), -- Dragon
        Achievement({id=13273, criteria=17, oneline=true}), -- Elemental
        Achievement({id=13274, criteria=17, oneline=true}), -- Flying
        Achievement({id=13275, criteria=17, oneline=true}), -- Magic
        Achievement({id=13277, criteria=17, oneline=true}), -- Mechanical
        Achievement({id=13278, criteria=17, oneline=true}), -- Undead
        Achievement({id=13280, criteria=17, oneline=true}), -- Aquatic
        Achievement({id=13281, criteria=17, oneline=true})  -- Humanoid
    }
}) -- Critters are Friends, Not Food (Karaga)

-------------------------------------------------------------------------------
--------------------------------- PAKU TOTEMS ---------------------------------
-------------------------------------------------------------------------------

local Totem = Class('Totem', NPC, {
    id=131154,
    icon='flight_point',
    scale=2,
    group=ns.groups.PAKU_TOTEMS,
    note=L["totem_of_paku_note"]
})

daz.nodes[40668427] = Totem({pois={Line({40668427, 46908558})}})
daz.nodes[40801107] = Totem({pois={Line({40801107, 42832293})}})
daz.nodes[41193782] = Totem({pois={Line({46888548, 41193782})}})
daz.nodes[41253911] = Totem({pois={Line({41253911, 49883972})}})
daz.nodes[42832293] = Totem({pois={Line({42832293, 40801107})}})
daz.nodes[44680588] = Totem({pois={Line({44680588, 52881242})}})
daz.nodes[46591999] = Totem({pois={Line({46591999, 50263259})}})
daz.nodes[46888548] = Totem({pois={Line({46888548, 41193782})}})
daz.nodes[49543283] = Totem({pois={Line({49543283, 49913955})}})
daz.nodes[51364094] = Totem({pois={Line({51364094, 49984342})}})
daz.nodes[52881242] = Totem({pois={Line({52881242, 44680588})}})
daz.nodes[52931129] = Totem({pois={Line({52931129, 59111062})}})
daz.nodes[53221892] = Totem({pois={Line({53221892, 52761184})}})
daz.nodes[58313263] = Totem({pois={Line({58313263, 75683985})}})
daz.nodes[59111062] = Totem({pois={Line({52931129, 59111062})}})
daz.nodes[72081446] = Totem({pois={Line({72081446, 59232283})}})

-------------------------------------------------------------------------------
------------------------------- A LOA OF A TALE -------------------------------
-------------------------------------------------------------------------------

map.nodes[51692825] = Collectible({
    quest=53535,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_gonk_note"],
    rewards={
        Achievement({id=13036, criteria=41566})
    }
}) -- Tales of de Loa: Gonk

map.nodes[75506760] = Collectible({
    quest=53536,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_gral_note"],
    rewards={
        Achievement({id=13036, criteria=41567})
    }
}) -- Tales of de Loa: Gral

map.nodes[48545460] = Collectible({
    quest=53538,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_jani_note"],
    rewards={
        Achievement({id=13036, criteria=41569})
    }
}) -- Tales of de Loa: Jani

map.nodes[49004129] = Collectible({
    quest=53541,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_paku_note"],
    rewards={
        Achievement({id=13036, criteria=41572})
    }
}) -- Tales of de Loa: Paku

map.nodes[43737673] = Collectible({
    quest=53542,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_rezan_note"],
    rewards={
        Achievement({id=13036, criteria=41573})
    }
}) -- Tales of de Loa: Rezan

map.nodes[47842884] = Collectible({
    quest=53544,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_shadra_note"],
    rewards={
        Achievement({id=13036, criteria=41576})
    }
}) -- Tales of de Loa: Shadra

map.nodes[67281762] = Collectible({
    quest=53546,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_torcali_note"],
    rewards={
        Achievement({id=13036, criteria=41577})
    }
}) -- Tales of de Loa: Torcali

daz.nodes[53230929] = Collectible({
    quest=53548,
    icon=1875083,
    group=ns.groups.TALES_OF_DE_LOA,
    note=L["tales_zandalar_note"],
    parent=map.id,
    rewards={
        Achievement({id=13036, criteria=41581})
    }
}) -- Tales of de Loa: Zandalar

-------------------------------------------------------------------------------
----------------------------- BOW TO YOUR MASTERS -----------------------------
-------------------------------------------------------------------------------

map.nodes[49274433] = Collectible({
    id=129740,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41498})
    }
}) -- Gonk

daz.nodes[35350767] = Collectible({
    id=126334,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    note=L["jani_note"],
    parent=map.id,
    rewards={
        Achievement({id=13020, criteria=41500})
    }
}) -- Jani

map.nodes[71544942] = Collectible({
    id=127377,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    rewards={
        Achievement({id=13020, criteria=41501})
    }
}) -- Pa'ku

Map({id=935}).nodes[37185259] = Collectible({
    id=124948,
    icon=1850548,
    sublabel=L["bow_to_your_masters_note"],
    group=ns.groups.BOW_TO_YOUR_MASTERS,
    note=L["rezan_note"],
    parent=map.id,
    rewards={
        Achievement({id=13020, criteria=41502})
    }
}) -- Rezan

-------------------------------------------------------------------------------
-------------------- EATING OUT OF THE PALM OF MY TINY HAND -------------------
-------------------------------------------------------------------------------

map.nodes[64203930] = Collectible({
    icon=1881827,
    group=ns.groups.BRUTOSAURS,
    note=L["makafon_note"],
    rewards={
        Achievement({id=13029, criteria=41580})
    },
    pois={
        POI({71202950}) -- Golkada
    }
}) -- Irritable Maka'fon

-------------------------------------------------------------------------------
---------------------------------- GET HEK'D ----------------------------------
-------------------------------------------------------------------------------

map.nodes[66211662] = Collectible({
    quest=50332,
    icon=1604165,
    note=L["hunter_junk_note"] ,
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40038})
    }
}) -- Big Hunter Mon

map.nodes[62632058] = Collectible({
    quest=50331,
    icon=1604165,
    note=L["feathered_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40040})
    }
}) -- Feathered Serpent Scale (157794)

map.nodes[71704128] = Collectible({
    quest=50308,
    icon=1604165,
    note=L["golden_junk_note"],
    group=ns.groups.GET_HEKD,
    rewards={
        Achievement({id=12482, criteria=40037})
    }
}) -- Golden Ravasaur Egg (156963)

daz.nodes[61825347] = Collectible({
    quest=50381,
    icon=1604165,
    note=L["great_hat_junk_note"],
    group=ns.groups.GET_HEKD,
    parent=map.id,
    rewards={
        Achievement({id=12482, criteria=40039})
    }
}) -- The Great Hat Robbery

-------------------------------------------------------------------------------
------------------------- LIFE FINDS A WAY... TO DIE! -------------------------
-------------------------------------------------------------------------------

local LifeFindsAWay = Class('LifeFindsAWay', Collectible, {
    icon=236192,
    group=ns.groups.LIFE_FINDS_A_WAY
})

map.nodes[67012670] = LifeFindsAWay({
    id=135510,
    note=L["azuresail_note"],
    rewards={
        Achievement({id=13048, criteria=41676})
    },
    pois={
        POI({67802900, 69103085})
    }
}) -- Azuresail the Ancient

map.nodes[70552262] = LifeFindsAWay({
    id=123502,
    rewards={
        Achievement({id=13048, criteria=41677})
    },
    pois={
        Path({69512264, 68002268, 67922214, 68052173, 68422217, 69512264, 70552262, 71142249, 71422207, 71622141, 71712025})
    }
}) -- King K'tal

map.nodes[61582548] = LifeFindsAWay({
    id=130741,
    rewards={
        Achievement({id=13048, criteria=41673})
    }
}) -- Nol'ixwan

map.nodes[71104026] = LifeFindsAWay({
    id=139365,
    rewards={
        Achievement({id=13048, criteria=41672})
    }
}) -- Queenfeather

map.nodes[52424774] = LifeFindsAWay({
    id=129323,
    rewards={
        Achievement({id=13048, criteria=41674})
    }
}) -- Sabertusk Empress

map.nodes[66102246] = LifeFindsAWay({
    id=143910,
    rewards={
        Achievement({id=13048, criteria=41684})
    }
}) -- Sludgecrusher

map.nodes[67802900] = LifeFindsAWay({
    id=135512,
    note=L["thunderfoot_note"],
    rewards={
        Achievement({id=13048, criteria=41675})
    },
    pois={
        POI({67012670, 69103085})
    }
}) -- Thunderfoot

-------------------------------------------------------------------------------
------------------------------ MUSHROOM HARVEST -------------------------------
-------------------------------------------------------------------------------

map.nodes[45497920] = Collectible({
    id=143314,
    icon=1869654,
    group=ns.groups.MUSHROOM_HARVEST,
    rewards={
        Achievement({id=13027, criteria=41391})
    }
}) -- Bane of the Woods

-------------------------------------------------------------------------------
--------------------------- THREE SHEETS TO THE WIND --------------------------
-------------------------------------------------------------------------------

daz.nodes[35411665] = Collectible({
    id=131781,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Horde',
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria={
            41404, -- Drop Anchor Dunkel
            41412, -- Pontoon Pilsner
        }})
    }
}) -- Zuaba Sonja

daz.nodes[47049155] = Collectible({
    id=129376,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    parent=map.id,
    rewards={
        Achievement({id=13061, criteria=41403}) -- Dark and Stormy
    }
}) -- Lenne

Map({id=1164}).nodes[26525057] = Collectible({
    id=131511,
    icon=135999,
    note=L["three_sheets_note"],
    group=ns.groups.THREE_SHEETS,
    faction='Horde',
    parent={daz.id, map.id},
    rewards={
        Achievement({id=13061, criteria=41400}) -- Blacktooth Bloodwine
    }
}) -- Lily Whistlebrew

-------------------------------------------------------------------------------
----------------------------------- MOUNTS ------------------------------------
-------------------------------------------------------------------------------

map.nodes[68174172] = Collectible({
    id=122939,
    icon=2429953,
    quest={
        47261, 48581, 47310, 47260, 52855, 52857, 55254, 55252, 55253,
        55258, 55462, 55503, 55504, 55506, 55505, 55507, 55247, 55795,
        55796, 55797, 55798
    },
    questCount=true,
    faction='Horde',
    note=L["torcali_note"],
    rewards={
        Mount({item=168408, id=1249})
    }
}) -- Child of Torcali

map.nodes[70605100] = Collectible({
    id=141025,
    icon=1624590,
    quest={
        50393, 50394, 50402, 52305, 50395, 50401, 50412, 52447, 50396,
        50886, 50887, 50900, 52748, 50397, 50940, 50942, 50943, 50944
    },
    questCount=true,
    faction='Horde',
    note=L["kuafon_note"],
    rewards={
        Mount({item=159146, id=1043})
    },
    pois ={
        POI({54333384, 67803420}) -- farm spots
    }
}) -- Kua'fon

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------
local ToAlltheSquirrels = Class('ToAlltheSquirrels', Collectible, {
    icon=237182,
    group=ns.groups.SQUIRRELS
})

map.nodes[62721652] = ToAlltheSquirrels({
    id=130445,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50242})
    },
    pois={
        POI({59802560, 54802000})
    }
}) -- Jungle Gulper

map.nodes[67114189] = ToAlltheSquirrels({
    id=130716,
    note=L["squirrels_note"],
    rewards={
        Achievement({id=14730, criteria=50243})
    },
    pois={
        POI({68804030, 68104340})
    }
}) -- Crested Gekkota

daz.nodes[42603540] = ToAlltheSquirrels({
    id=130441,
    note=L["squirrels_note"],
    parent=map.id,
    rewards={
        Achievement({id=14730, criteria=50246})
    },
    pois={
        POI({47808680, 45801480, 45605880})
    }
}) -- Temple Beetle