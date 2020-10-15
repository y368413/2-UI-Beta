local myname, ns = ...

if not ns.textures      then ns.textures      = {}; end;
if not ns.textures.ship then ns.textures.ship = {}; end;
if not ns.textures.misc then ns.textures.misc = {}; end;

local     t = ns.textures;
local atlas = ns.utils.textures.atlas;

-- Image constants. To locate names for new images, see https://www.townlong-yak.com/framexml/live/Helix/AtlasInfo.lua or use the addon TextureAtlasViewer
t.spoilers      = atlas("ShipMissionIcon-Legendary-Map",                  2.50);
t.landmark      = atlas("Warfronts-FieldMapIcons-Neutral-Banner-Minimap", 1.50);
t.ship.LARGE    = atlas("Ships_DreadnaughtA-Map",                         4.00);
t.ship.MEDIUM   = atlas("Ships_Dreadnaught-Map",                          3.00);
t.ship.SMALL    = atlas("Ships_GalleonA-Map",                             2.75);
t.ship.WRECK    = atlas("MantidTowerDestroyed",                           2.00);
t.ship.SAILBOAT = atlas("Ships_TroopTransport-Map",                       2.00);
t.ship.BOAT     = atlas("FlightMasterFerry",                              1.60);
t.ship.LANDING  = atlas("ShipMissionIcon-SiegeA-Map",                     2.00);
t.allianceair   = atlas("Vehicle-Air-Alliance",                           2.00);
t.hordeair      = atlas("Vehicle-Air-Horde",                              2.00);
t.official      = atlas("ShipMissionIcon-Training-Map",                   1.85);
t.academy       = atlas("Profession",                                     1.65);
t.shop          = atlas("poi-town",                                       1.25);
t.alliance      = atlas("ShipMissionIcon-SiegeA-Map",                     2.00);
t.closed        = atlas("PlayerNeutral",                                  1.75);
t.default       = atlas("PlayerFriend",                                   1.75);
t.astronghold   = atlas("GarrBuilding_Barracks_2_A_Info",                 4.00);
t.hstronghold   = atlas("GarrBuilding_Barracks_3_H_Info",                 4.00);
t.ainn          = atlas("GarrBuilding_Inn_3_A_Info",                      3.10);
t.hinn          = atlas("GarrBuilding_Inn_2_H_Info",                      3.10);
t.roundtent     = atlas("GarrBuilding_MageTower_1_A_Info",                3.00);
t.tower         = atlas("GarrBuilding_MageTower_3_A_Info",                3.00);
t.hmagic        = atlas("GarrBuilding_Jewelcrafting_3_A_Info",            3.00);
t.horde         = atlas("ShipMissionIcon-SiegeH-Map",                     2.00);
t.camp          = atlas("GarrBuilding_Inn_1_A_Info",                      3.00);
t.skull         = atlas("nazjatar-nagaevent",                             2.50);
t.neutral       = atlas("ShipMissionIcon-Bonus-Map",                      3.00);
t.nstronghold   = atlas("GarrBuilding_Armory_1_A_Info",                   3.50);
t.boss          = atlas("BossBanner-SkullCircle",                         2.00);
t.leader        = atlas("StoryHeader-CheevoIcon",                         1.30);
t.docks         = atlas("ShipMissionIcon-Training-Map",                   2.00);
t.alcohol       = atlas("Innkeeper",                                      2.00);
t.food          = atlas("Food",                                           1.50);
t.event         = atlas("QuestPortraitIcon-SandboxQuest",                 2.00);

-- Map icon for campaigns for continent maps
t.campaign      = atlas("BattleMaster",                                   3.00);

t.arrow         = 
  { up          = "poi-door-up",
    down        = "poi-door-down",
    left        = "poi-door-left",
    right       = "poi-door-right",
    scale       = 1.30, };

-- --------------------------------------------------------------------------------------------------------
-- Add custom images
-- Saves .tga targa files to ART folder.
-- Add line like below. DO NOT ADD t. to the icon name!
-- --------------------------------------------------------------------------------------------------------

-- Events
tank = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\tank.tga", scale = 3.0,};
naval = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\naval.tga", scale = 3.0,};
battle = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\battle.tga", scale = 3.0,};
report = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\report.tga", scale = 3.0,};
horror = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\horror.tga", scale = 3.0,};
magical = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\magical.tga", scale = 3.0,};
medical = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\medical.tga", scale = 3.0,};
stealth = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\stealth.tga", scale = 3.0,};

-- City
supplies = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\supplies.tga", scale = 2.00};
repairs = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\repairs.tga", scale = 2.00};
mining = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\mining.tga", scale = 2.00};
medic = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\medic.tga", scale = 2.00};
inn = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\inn.tga", scale = 2.00};
alchemy = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\alchemy.tga", scale = 2.00};
engineering = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\engineering.tga", scale = 2.00};
barracks = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\barracks.tga", scale = 2.00};
magic = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\magic.tga", scale = 2.00};

-- Villain
skullblood = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\skull-blood.tga", scale = 3.0};
skullfrost = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\skull-frost.tga", scale = 3.0};
skullshadow = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\skull-shadow.tga", scale = 3.0};
skullvoid = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\skull-void.tga", scale = 3.0};
skullfel = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\skull-fel.tga", scale = 3.0};
ziggeraut = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\v-ziggeraut.tga", scale = 3.0};
abomination = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\boss-abomination.tga", scale = 3.0};
lich = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\boss-lich.tga", scale = 3.0};
necromancer = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\boss-necromancer.tga", scale = 3.0};
skeleton = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\boss-skeleton.tga", scale = 3.0};
knight = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\boss-knight.tga", scale = 3.0};
vault = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\dk.tga", scale = 3.0};
scarlet = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\v-scarlets.tga", scale = 3.0};

wclogo = { icon = "Interface\\AddOns\\HandyNotes_WarcraftConquest\\Art\\wcicon.tga", scale = 10.0};

-- Currently ICONs not used:
-- Innkeeper
-- t.landmark      = atlas("collections-icon-favorites",         2.20);
-- t.basement      = atlas("poi-door-down",                                  1.35);
-- t.hostile       = atlas("PlayerEnemy",                                    1.75);
-- t.bed           = atlas("Vehicle-SilvershardMines-MineCart",              1.70);
-- t.npc           = atlas("groupfinder-waitdot",                            1.10);
-- t.arrow         = 
--   { up          = "NPE_ArrowUpGlow", 
--     down        = "NPE_ArrowDownGlow", 
--     left        = "NPE_ArrowLeftGlow",
--     right       = "NPE_ArrowRightGlow",
--     scale       = 1.30, };
