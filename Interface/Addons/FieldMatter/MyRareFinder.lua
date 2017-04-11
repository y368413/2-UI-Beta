local MyRareFinderVisible = true
local MyRareFinderSWLoad = false
local MyRareFinderGorLoad = false
local MyRareFinderSpireLoad = false
local MyRareFinderTaladorLoad = false
local MyRareFinderNagrandLoad = false
local MyRareFinderFrostfireLoad = false
local MyRareFinderTanaanLoad = false

local MyRareWaypoints = {}

function MyRareFinder_OnClick()
	EasyMenu(menuTbl, MyRareFinderMenu, "MyRareFinderVisible", 0, 0, nil, 10)
end

if not MyRareFinderMenu then
	CreateFrame("Frame", "MyRareFinderMenu", UIParent, "UIDropDownMenuTemplate")
end
menuTbl = {
	{
		text = MyRareLocMenuShowNormal,
		checked = function()
				return MyRareFinderNormalRares
			end,
		func = function()
				MyRareFinderNormalRares = not MyRareFinderNormalRares
				MyRareFinderEvent( nil, nil );
			end,
	},
	{
		text = MyRareLocMenuShowDaily,
		checked = function()
				return MyRareFinderDailyRares
			end,
		func = function()
				MyRareFinderDailyRares = not MyRareFinderDailyRares
				MyRareFinderEvent( nil, nil );
			end,
	},
	{
		text = MyRareLocMenuShowOT,
		checked = function()
				return MyRareFinderOneTimeRares
			end,
		func = function()
				MyRareFinderOneTimeRares = not MyRareFinderOneTimeRares
				MyRareFinderEvent( nil, nil );
			end,
	},
	{
		text = MyRareLocMenuShowOTKill,
		checked = function()
				return MyRareFinderKilledOTRares
			end,
		func = function()
				MyRareFinderKilledOTRares = not MyRareFinderKilledOTRares
				MyRareFinderEvent( nil, nil );
			end,
	},
	{
		text = MyRareLocMenuOn,
		checked = function()
				return MyRareFinderVisible
			end,
		func = function()
				MyRareFinderVisible = not MyRareFinderVisible
				MyRareFinderEvent( nil, nil );
			end,
	},
}

function MyRareFinderLoad( frame ) 
	--print("MyRareFinder loaded");
	frame:RegisterEvent("WORLD_MAP_UPDATE")
	if ( MyRareFinderNormalRares == nil ) then
		MyRareFinderNormalRares = true
	end
	if ( MyRareFinderDailyRares == nil ) then
		MyRareFinderDailyRares = true
	end
	if ( MyRareFinderOneTimeRares == nil ) then
		MyRareFinderOneTimeRares = true
	end
	if ( MyRareFinderKilledOTRares == nil ) then
		MyRareFinderKilledOTRares = true
	end
end

function MyRareFinderEvent( event, frame )
	local mapID, mapFloor = GetCurrentMapAreaID()
	MyRareFinderSMOverlay:Hide();
	MyRareFinderGorOverlay:Hide();
	MyRareFinderSpireOverlay:Hide();
	MyRareFinderTaladorOverlay:Hide();
	MyRareFinderNagrandOverlay:Hide();
	MyRareFinderFrostfireOverlay:Hide();
	MyRareFinderTanaanOverlay:Hide();
	if (MyRareFinderVisible == true) then
		if (GetCurrentMapDungeonLevel() == 0) then
			if ( mapID == 947 ) then
				MyRareFinderSMOverlay:Show();
				if ( MyRareFinderSWLoad == false ) then
					MyRareFinderShadowmoon( MyRareFinderSMOverlay );
					MyRareFinderSWLoad = true
				end
			elseif ( mapID == 948 ) then
				MyRareFinderSpireOverlay:Show();
				if ( MyRareFinderSpireLoad == false ) then
					MyRareFinderSpires( MyRareFinderSpireOverlay );
					MyRareFinderSpireLoad = true
				end
			elseif ( mapID == 949 ) then
				MyRareFinderGorOverlay:Show();
				if ( MyRareFinderGorLoad == false ) then
					MyRareFinderGorgrond( MyRareFinderGorOverlay );
					MyRareFinderGorLoad = true
				end
			elseif ( mapID == 946 ) then
				MyRareFinderTaladorOverlay:Show();
				if ( MyRareFinderTaladorLoad == false ) then
					MyRareFinderTalador( MyRareFinderTaladorOverlay );
					MyRareFinderTaladorLoad = true
				end
			elseif ( mapID == 950 ) then
				MyRareFinderNagrandOverlay:Show();
				if ( MyRareFinderNagrandLoad == false ) then
					MyRareFinderNagrand( MyRareFinderNagrandOverlay );
					MyRareFinderNagrandLoad = true
				end
			elseif ( mapID == 941 ) then
				MyRareFinderFrostfireOverlay:Show();
				if ( MyRareFinderFrostfireLoad == false ) then
					MyRareFinderFrostfire( MyRareFinderFrostfireOverlay );
					MyRareFinderFrostfireLoad = true
				end
			elseif ( mapID == 945 ) then
				MyRareFinderTanaanOverlay:Show();
				if ( MyRareFinderTanaanLoad == false ) then
					MyRareFinderTanaan( MyRareFinderTanaanOverlay );
					MyRareFinderTanaanLoad = true
				end
			end
		end
	end
end

function MyRareFinderShadowmoon( frame )
	-- Amaukwa 77140 37.2, 36.4 (IsQuestFlaggedCompleted(33061))
	MyRareFinderDraw(frame,1,33061,372,364,77140);
	-- Ba'ruun 82326 52.8, 16.8 (IsQuestFlaggedCompleted(35731))
	MyRareFinderDraw(frame,1,35731,528,168,82326);
	-- Bahameye 81406 29.6, 6.2 (IsQuestFlaggedCompleted(35281))
	MyRareFinderDraw(frame,1,35281,296,62,81406);
	-- Dark Emanation 77085 48.6, 43,6 (IsQuestFlaggedCompleted(33064))
	MyRareFinderDraw(frame,1,33064,486,436,77085,"In a cave");
	-- Darkmaster Go'vid 82268 41.0, 83.0 (IsQuestFlaggedCompleted(35448))
	MyRareFinderDraw(frame,1,35448,410,830,82268);
	-- Darktalon 82411 49.6, 42.0 (IsQuestFlaggedCompleted(35555))
	MyRareFinderDraw(frame,1,35555,496,420,82411);
	-- Enavra 82676 67.8, 63.8 (IsQuestFlaggedCompleted(35688))
	MyRareFinderDraw(frame,1,35688,678,638,82676,"Click corpse to summon");
	-- Faebright 82207 61.6, 61.8 (IsQuestFlaggedCompleted(35725))
	MyRareFinderDraw(frame,1,35725,616,618,82207);
	-- Gorum 76380 29.6, 33.8 (IsQuestFlaggedCompleted(33664))
	MyRareFinderDraw(frame,1,33664,296,338,76380);
	-- Hypnocroak 79524 37.4, 48.8 (IsQuestFlaggedCompleted(35558))
	MyRareFinderDraw(frame,1,35558,374,488,79524,"In cave behind waterfall, jumping required");
	-- Insha'tar 83553 57.4, 48.4 (IsQuestFlaggedCompleted(35909))
	MyRareFinderDraw(frame,1,35909,574,484,83553);
	-- Killmaw 74206 40.8, 44.4 (IsQuestFlaggedCompleted(33043))
	MyRareFinderDraw(frame,1,33043,408,444,74206);
	-- Ku'targ the Voidseer 72362 32.2, 35.0 (IsQuestFlaggedCompleted(33039))
	MyRareFinderDraw(frame,1,33039,322,350,72362);
	-- Leaf-Reader Kurri 72537 37.6, 14.6 (IsQuestFlaggedCompleted(33055))
	MyRareFinderDraw(frame,1,33055,376,146,72537);
	-- Mad "King" Sporeon 77310 44.8, 20.8 (IsQuestFlaggedCompleted(35906))
	MyRareFinderDraw(frame,1,35906,448,208,77310);
	-- Morva Soultwister 82362 38.6, 70.2 (IsQuestFlaggedCompleted(35523))
	MyRareFinderDraw(frame,1,35523,386,702,82362);
	-- Mother Om'ra 75071 44.0, 57.6 (IsQuestFlaggedCompleted(33642))
	MyRareFinderDraw(frame,1,33642,440,576,75071,"Kill Darkcaster around her to activate");
	-- Rai'vosh 82374 48.6, 22.6 (IsQuestFlaggedCompleted(35553))
	MyRareFinderDraw(frame,1,35553,486,226,82374);
	-- Rockhoof 72606 53.0, 50.6 (IsQuestFlaggedCompleted(34068))
	MyRareFinderDraw(frame,1,34068,530,506,72606);
	-- Shinri 82415 61.0, 55.2 (IsQuestFlaggedCompleted(35732))
	MyRareFinderDraw(frame,1,35732,610,552,82415,"Runs around the plain, really fast");
	-- Sneevel 86689 27.6, 43.6 (IsQuestFlaggedCompleted(36880))
	MyRareFinderDraw(frame,1,36880,276,436,86689);
	-- Veloss 75482 21.6, 21.0 (IsQuestFlaggedCompleted(33640))
	MyRareFinderDraw(frame,1,33640,216,210,75482);
	-- Venomshade 75492 54.6, 70.6 (IsQuestFlaggedCompleted(33643))
	MyRareFinderDraw(frame,1,33643,546,706,75492);
	-- Voidseer Kalurg 83385 32.6, 41.4 (IsQuestFlaggedCompleted(35847))
	MyRareFinderDraw(frame,1,35847,326,414,83385,"Kill Channelers at pillars to activate");
	-- Yggdrel 75435 48.8, 66.4 (IsQuestFlaggedCompleted(33389))
	MyRareFinderDraw(frame,1,33389,488,664,75435,"Elite, can be dangerous solo");
	-- Windfang Matriarch		75434
	MyRareFinderDraw(frame,1,33038,428,410,75434,"Only spawns at end of Artificer Romuul event");
	-- 81639		Brambleking Fili
	MyRareFinderDraw(frame,1,33383,438,774,81639);
	-- Socrethar's Rise
	-- Demidos		84911
	MyRareFinderDraw(frame,4,37351,460,716,84911,"Daily Rare: Assault on Socrethar's Rise");
	-- 85121		Lady Temptessa
	MyRareFinderDraw(frame,4,37355,480,776,85121,"Daily Rare: Assault on Socrethar's Rise");
	-- 84925		Quartermaster Hershak
	MyRareFinderDraw(frame,4,37352,502,724,84925,"Daily Rare: Assault on Socrethar's Rise");
	-- 85029		Shadowspeaker Niir
	MyRareFinderDraw(frame,4,37354,482,810,85029,"Daily Rare: Assault on Socrethar's Rise");
	-- 86213		Aqualir
	MyRareFinderDraw(frame,4,37356,508,788,86213,"Daily Rare: Assault on Socrethar's Rise");
	-- 85001		Master Sergeant Milgra
	MyRareFinderDraw(frame,4,37353,518,792,85001,"Daily Rare: Assault on Socrethar's Rise");
	-- Darktide Roost
	-- 85837		Slivermaw
	MyRareFinderDraw(frame,4,37411,614,888,85837,"Daily Rare: Assault on Darktide Roost");
	-- 85555		Nagidna
	MyRareFinderDraw(frame,4,37409,584,868,85555,"Daily Rare: Assault on Darktide Roost");
	-- 85568		Avalanche
	MyRareFinderDraw(frame,4,37410,672,848,85568,"Daily Rare: Assault on Darktide Roost");
end

function MyRareFinderGorgrond( frame )
	-- Sunclaw			86137
	MyRareFinderDraw(frame,1,36656,446,922,86137,"Click climbing rope to reach");
	-- Riptar			85970
	MyRareFinderDraw(frame,1,36600,376,814,85970);
	-- Mother Araneae		76473
	MyRareFinderDraw(frame,1,34726,534,782,76473,"In a cave");
	-- Stompalupagus		86520
	MyRareFinderDraw(frame,1,36837,542,724,86520);
	-- Hive Queen Skrikka		83522	
	MyRareFinderDraw(frame,1,35908,522,702,83522);
	-- Fossilwood the Petrified	85250
	MyRareFinderDraw(frame,1,36387,574,686,85250);
	-- Stomper Kreego		79629
	MyRareFinderDraw(frame,1,35910,382,662,79629);
	-- Sylldross			86410
	MyRareFinderDraw(frame,1,36794,640,618,86410);
	-- Sulfurious			80725
	MyRareFinderDraw(frame,1,36394,402,596,80725);
	-- Mandrakor			84406
	MyRareFinderDraw(frame,1,36178,506,532,84406,"In a cave, not visible in minimap outside");
	-- Glut				80868
	MyRareFinderDraw(frame,1,36204,462,508,80868,"In a cave, not visible in minimap outside");
	-- Gelgor of the Blue Flame	81038
	MyRareFinderDraw(frame,1,36391,418,454,81038);
	-- Char the Burning		82311
	MyRareFinderDraw(frame,1,35503,534,446,82311,"Flies around area, elite, drops a quest");
	-- Bashiok			82085
	MyRareFinderDraw(frame,1,35335,400,790,82085,"It's Bashioook!");
	-- Rolkor			85264
	MyRareFinderDraw(frame,1,36393,478,414,85264);
	-- 80785	Fungal Praetorian
	MyRareFinderDraw(frame,1,35813,580,636,80785,"Elite, drops a quest");
	-- 84431	Greldrok the Cunning
	MyRareFinderDraw(frame,1,36186,468,432,84431,"In a cave, not visible from outside");
	-- 80371	Typhon
	MyRareFinderDraw(frame,3,37405,760,420,80371,"Elite");
	
	-- The Pit, Fight the Power rares
	-- 86562 Maniacal Madgard
	MyRareFinderDraw(frame,4,37363,490,338,86562,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86571 Durp the Hated
	MyRareFinderDraw(frame,4,37366,500,238,86571,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86577 Horgg
	MyRareFinderDraw(frame,4,37365,470,238,86577,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86582 Morgo Kain
	MyRareFinderDraw(frame,4,37364,470,258,86582,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86566 Defector Dazgo
	MyRareFinderDraw(frame,4,37362,482,210,86566,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86574 Inventor Blammo
	MyRareFinderDraw(frame,4,37367,476,306,86574,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	-- 86579 Blademaster Ro'gor
	MyRareFinderDraw(frame,4,37368,460,336,86579,"Daily Rare: Assault on the Pit, Achievement: Fight the Power");
	
	-- Ancient no More rares
	-- 88582 Swift Onyx Flayer
	MyRareFinderDraw(frame,4,37374,708,340,88582,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 86257 Protectors of the Grove (Basten)
	MyRareFinderDraw(frame,4,37369,692,446,86257,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 86268 Alkali
	MyRareFinderDraw(frame,4,37371,586,412,86268,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 88580 Firestarter Grash
	MyRareFinderDraw(frame,4,37373,728,358,88580,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 88672 Hunter Bal'ra
	MyRareFinderDraw(frame,4,37377,550,466,88672,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 88586 Mogamago
	MyRareFinderDraw(frame,4,37376,618,393,88586,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 86266 Venolasix
	MyRareFinderDraw(frame,4,37372,638,316,86266,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 82058 Depthroot
	MyRareFinderDraw(frame,4,37370,576,358,82058,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
	-- 88583 Grove Warden Yal
	MyRareFinderDraw(frame,4,37375,596,430,88583,"Daily Rare: Assault on the Everbloom Wilds, Achievement: Ancient no More");
end

function MyRareFinderSpires( frame )
	-- Jiasska the Sporegorger	84955
	MyRareFinderDraw(frame,1,36306,566,946,84955);
	-- Mutafen			84417
	MyRareFinderDraw(frame,1,36396,532,890,84417);
	-- Betsi Boombasket		84887
	MyRareFinderDraw(frame,1,36291,582,846,84887);
	-- Tesska the Broken		84775
	MyRareFinderDraw(frame,1,36254,574,740,84775);
	-- Blightglow			84856
	MyRareFinderDraw(frame,1,36283,640,648,84856);
	-- Talonbreaker			84836
	MyRareFinderDraw(frame,1,36278,546,632,84836);
	-- Swarmleaf			85520
	MyRareFinderDraw(frame,1,36472,528,548,85520);
	-- Sangrikass			84833 //Adds dort töten zum Beschwören
	MyRareFinderDraw(frame,1,36276,690,488,84833,"Kill mobs to summon");
	-- Nas Dunberlin		82247
	MyRareFinderDraw(frame,1,36129,364,524,82247);
	-- Sunderthorn			84912 //Adds dort töten zum Beschwören
	MyRareFinderDraw(frame,1,36298,586,452,84912,"Kill mobs to summon");
	-- Kalos the Bloodbathed	84810
	MyRareFinderDraw(frame,1,36268,626,374,84810);
	-- Poisonmaster Bortusk		84838
	MyRareFinderDraw(frame,1,36279,594,374,84838);
	-- Shadowbark			79938
	MyRareFinderDraw(frame,1,36478,520,354,79938);
	-- Gaze				86978
	MyRareFinderDraw(frame,1,36943,252,242,86978,"Click book in hut to summon");
	-- Stonespite			84805
	MyRareFinderDraw(frame,1,36265,334,220,84805);
	-- Rotcap			85504
	MyRareFinderDraw(frame,1,36470,384,278,85504);
	-- Durkath Steelmaw		84807
	MyRareFinderDraw(frame,1,36267,464,286,84807);
	-- Blade-Dancer Aeryx		80614
	MyRareFinderDraw(frame,1,35599,468,230,80614);
	-- Hermit Palefur		86724
	MyRareFinderDraw(frame,1,36887,592,150,86724);
	-- Oskiira the Vengeful		84872
	MyRareFinderDraw(frame,1,36288,660,550,84872);
	-- Gobblefin 			84951
	MyRareFinderDraw(frame,1,36305,330,590,84951); 
	-- Festerbloom			84890
	MyRareFinderDraw(frame,1,36297,548,396,84890);
	-- 80372	Echidna
	MyRareFinderDraw(frame,3,37406,690,540,80372,"Elite");
	-- 83990	Solar Magnifier
	MyRareFinderDraw(frame,4,37394,518,72,83990,"Daily Rare: Assault on Skettis");
	-- Varasha			82050
	MyRareFinderDraw(frame,1,0,296,420,82050);
end

function MyRareFinderTalador( frame )
	-- Lo'marg Jawcrusher		77784
	MyRareFinderDraw(frame,1,34208,490,920,77784);
	-- Talonpriest Zorkra		79485
	MyRareFinderDraw(frame,1,34668,539,910,79485);
	-- Klikixx			78872
	MyRareFinderDraw(frame,1,34498,668,854,78872);
	-- Gennadian			80471
	MyRareFinderDraw(frame,1,34929,674,806,80471);
	-- Felbark			80204
	MyRareFinderDraw(frame,1,35018,508,838,80204);
	-- Cro Fleshrender		77620
	MyRareFinderDraw(frame,1,34165,376,704,77620);
	-- Kharazos the Triumphant		78710	//einer von drei Randomspawns
	-- Galzomar				78713	//einer von drei Randomspawns
	-- Sikthiss, Maiden of Slaughter	78715	//einer von drei Randomspawns
	MyRareFinderDraw(frame,1,35219,566,636,78710,"One of three: Kharazos, Galzomar, Sikthiss, loot once"); 
	-- Glimmerwing			77719
	MyRareFinderDraw(frame,1,34189,318,638,77719,"Flies around in the area");
	-- Ra'kahn			77741
	MyRareFinderDraw(frame,1,34196,595,596,77741);
	-- Echo of Murmur		77795
	MyRareFinderDraw(frame,1,34221,342,570,77795);
	-- Frenzied Golem		77614
	MyRareFinderDraw(frame,1,34145,460,550,77614);
	-- Shirzir			79543
	MyRareFinderDraw(frame,1,34671,418,594,79543,"Underground in tomb");
	-- Hammertooth			77715
	MyRareFinderDraw(frame,1,34185,620,460,77715);
	-- Yazheera the Incinerator	77529
	MyRareFinderDraw(frame,1,34135,538,258,77529);
	-- No'losh			79334
	MyRareFinderDraw(frame,1,34859,864,304,79334);
	-- Dr. Gloom			77561
	MyRareFinderDraw(frame,1,34142,682,158,77561);
	-- Steeltusk			86549
	MyRareFinderDraw(frame,1,36858,677,355,86549);
	-- Wandering Vindicator		77776 	//dropt keine Resourcen
	MyRareFinderDraw(frame,1,34205,696,334,77776,"No garrison resources");
	-- Taladorantula 		77634 //viele kleine Spinnen töten
	MyRareFinderDraw(frame,1,34171,590,880,77634,"Kill small spiders to summon");
	-- Hen-Mother Hami		77626
	MyRareFinderDraw(frame,1,34167,780,504,77626,"Patrols around area with some adds");
	-- Grrbrrgle			85572
	MyRareFinderDraw(frame,1,36919,222,740,85572,"Click on jumping crate");
	-- Underseer Bloodmane		80524
	MyRareFinderDraw(frame,1,34945,638,207,80524,"In a building, drops no garrison resources");

	-- Shattrath: 
	-- Orumo the Observer		87668 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37344,314,475,87668,"Daily Rare: Assault on Shattrath"); 
	-- Lady Demlash			82942 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37346,338,378,82942,"Daily Rare: Assault on Shattrath");
	-- Kurlosh Doomfang		82988 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37348,372,376,82988,"Daily Rare: Assault on Shattrath");
	-- Vigilant Paarthos		88436 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37350,368,410,88436,"Daily Rare: Assault on Shattrath");
	-- Lord Korinak			82920 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37345,305,264,82920,"Daily Rare: Assault on Shattrath");
	-- Matron of Sin		82998 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37349,390,496,82998,"Daily Rare: Assault on Shattrath");
	-- Shadowflame Terrorwalker	82930 //Achievement "Heralds of the Legion" und Teil von Daily "Assault on the Heart of Shattrath"
	MyRareFinderDraw(frame,4,37347,410,420,82930,"Daily Rare: Assault on Shattrath");

	-- Bombardier Gu'gok		87597 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37339,440,380,87597);
	-- Haakun the All-Consuming	83008 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37312,480,250,83008);
	-- Avatar of Socrethar		88043 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37338,466,352,88043);
	-- Legion Vanguard		88494 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37342,378,214,88494);
	-- Gug'tol			83019 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37340,476,390,83019);
	-- Felfire Consort		82992 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37341,502,352,82992);
	-- Strategist Ankor		88071 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37337,460,274,88071);
	-- Xothear, the Destroyer	82922 //Achievement "Cut off the Head"
	MyRareFinderDraw(frame,3,37343,380,146,82922);

end

function MyRareFinderNagrand( frame )
	-- Ru'klaa			83526
	MyRareFinderDraw(frame,1,35900,580,840,83526);
	-- Captain Ironbeard		79725
	MyRareFinderDraw(frame,1,34727,346,770,79725);
	-- Netherspawn			83401
	MyRareFinderDraw(frame,1,35865,476,708,83401);
	-- Grizzlemaw			82912
	MyRareFinderDraw(frame,1,35784,897,728,82912);
	-- Outrider Duretha		83680
	MyRareFinderDraw(frame,1,35943,618,690,83680);
	-- Soulfang			80057
	MyRareFinderDraw(frame,1,36128,750,640,80057,"In cave on northwest side");
	-- Malroc Stonesunder		83643
	MyRareFinderDraw(frame,1,35932,812,600,83643);
	-- Scout Pokhar			83634
	MyRareFinderDraw(frame,1,35931,548,612,83634);
	-- Redclaw the Feral		82755
	MyRareFinderDraw(frame,1,35712,736,578,82755);
	-- Hyperious			78161 //Kohlepfannen ausloesen zum Beschwören
	MyRareFinderDraw(frame,1,34862,867,555,78161,"Light 3 braziers to summon");
	-- Gnarlhoof the Rabid		82778
	MyRareFinderDraw(frame,1,35717,666,566,82778);
	-- Greatfeather			82758
	MyRareFinderDraw(frame,1,35714,668,512,82758);
	-- Ophiis			83409
	MyRareFinderDraw(frame,1,35875,400,496,83409,"Swims along the river");
	-- Flinthide			83483
	MyRareFinderDraw(frame,1,35893,696,420,83483);
	-- Explorer Nozzand 		82486
	MyRareFinderDraw(frame,1,35623,890,412,82486,"In cave behind waterfall, jumping required");
	-- Tura'aka			83591
	MyRareFinderDraw(frame,1,35920,650,390,83591);
	-- Hunter Blacktooth		83603
	MyRareFinderDraw(frame,1,35923,806,304,83603);
	-- Windcaller Korast		83428
	MyRareFinderDraw(frame,1,35877,706,294,83428,"On a plateau, only reachable from Elemental Plateau");
	-- Mr. Pinchy Sr.		84435
	MyRareFinderDraw(frame,1,36229,458,152,84435);
	-- Fangler 			82975
	MyRareFinderDraw(frame,1,35836,748,118,82975,"Click on fishing pole to summon");
	-- Warmaster Blugthol 		79024
	MyRareFinderDraw(frame,1,34645,826,762,79024);
	-- Sean Whitesea		83542
	MyRareFinderDraw(frame,1,35912,610,472,83542,"Click chest behind a rock and he will attack you");
	-- Gar'lua			82764
	MyRareFinderDraw(frame,1,35715,522,558,82764);
	-- Ancient Blademaster		86603
	MyRareFinderDraw(frame,1,35778,844,528,86603,"Click Sword on grave on the plateau");
	-- Berserk T-300 Series Mark II	82826
	MyRareFinderDraw(frame,1,35735,770,640,82826,"In a cave, opened with a switch, not visible on minimap");
	-- Graveltooth			84263
	MyRareFinderDraw(frame,1,36159,850,364,84263,"Spawns at end of event, kill lots of goren to summon");
	-- Gorepetal			83509
	MyRareFinderDraw(frame,1,35898,932,282,83509,"In a cave, click pristine lily to summon");
	-- Gaz'orda			80122
	MyRareFinderDraw(frame,1,34725,422,786,80122,"In a cave");
	-- Pit Beast			88208
	MyRareFinderDraw(frame,1,37637,582,180,88208);
	-- Krud the Eviscerator		88210
	MyRareFinderDraw(frame,4,37398,582,120,88210,"Daily Rare: Assault on the Gorian Proving Grounds");
	-- Karosh Blackwind		86959
	MyRareFinderDraw(frame,3,37399,458,344,86959,"Achievement: Song of Silence");
	-- 87239	Krahl Deadeye
	MyRareFinderDraw(frame,4,37473,438,344,87239,"Daily Rare: Assault on Mok'gol Watchpost, Achievement: Song of Silence");
	-- 87234	Brutag Grimblade
	MyRareFinderDraw(frame,3,37400,430,364,87234,"Achievement: Song of Silence");
	-- 87344	Gortag Steelgrip
	MyRareFinderDraw(frame,4,37472,450,364,87344,"Daily Rare: Assault on Mok'gol Watchpost, Achievement: Song of Silence");
	-- Durg Spinecrusher		87788
	MyRareFinderDraw(frame,3,37395,360,236,87788,"Achievement: Broke Back Precipice");
	-- Pit Slayer			87846
	MyRareFinderDraw(frame,4,37397,380,196,87846,"Daily Rare: Assault on the Broken Precipice, Achievement: Broke Back Precipice");
	-- Bonebreaker		87837
	MyRareFinderDraw(frame,4,37395,400,160,87837,"Daily Rare: Assault on the Broken Precipice, Achievement: Broke Back Precipice");
	-- 80370		Lernaea
	MyRareFinderDraw(frame,3,37408,520,900,80370,"Elite");
	-- Rep Rares
	-- Bergruu			86732
	MyRareFinderDraw(frame,3,86732,626,168,86732,"Walks around on a path, elite");
	-- 86774	Aogexon
	MyRareFinderDraw(frame,3,86774,510,160,86774,"Elite");
	-- 87660	Dekorhan
	MyRareFinderDraw(frame,3,87660,640,300,87660,"Elite");
	-- 86729	Direhoof
	MyRareFinderDraw(frame,3,86729,606,382,86729,"Elite");
	-- 86771	Gagrog the Brutal
	MyRareFinderDraw(frame,3,86771,482,222,86771,"Elite");
	-- 87667	Mu'gra
	MyRareFinderDraw(frame,3,87667,340,510,87667,"Elite");
	-- 86750	Thek'talon
	MyRareFinderDraw(frame,3,86750,620,220,86750,"Elite, flies around in a circle on the plain");
	-- 86835	Xelganak
	MyRareFinderDraw(frame,3,86835,410,440,86835,"Elite");
	-- 88951	Vileclaw
	MyRareFinderDraw(frame,3,88951,370,380,88951,"Elite");
end

function MyRareFinderFrostfire( frame )
	-- Cyclonic Fury		78621
	MyRareFinderDraw(frame,1,34477,674,782,78621);
	-- Chillfang			80242
	MyRareFinderDraw(frame,1,34843,412,682,80242);
	-- Pale Fishmonger		78606
	MyRareFinderDraw(frame,1,34470,282,662,78606);
	-- Grutush the Pillager		80312
	MyRareFinderDraw(frame,1,34865,386,630,80312);
	-- Gruuk			80190
	MyRareFinderDraw(frame,1,34825,518,648,80190);
	-- Scout Goreseeker		77526
	MyRareFinderDraw(frame,1,34132,764,634,77526);
	-- Coldstomp the Griever	77513
	MyRareFinderDraw(frame,1,34129,254,550,77513);
	-- Breathless			78867
	MyRareFinderDraw(frame,1,34497,274,500,78867);
	-- Cindermaw			72294
	MyRareFinderDraw(frame,1,33014,404,470,72294);
	-- Broodmother Reeg'ak		74613
	MyRareFinderDraw(frame,1,33843,664,314,74613);
	-- Primalist Mur'og		76918
	MyRareFinderDraw(frame,1,33938,368,340,76918);
	-- The Beater			77527
	MyRareFinderDraw(frame,1,34133,268,316,77527,"In a cave");
	-- Yaga the Scarred		79145
	MyRareFinderDraw(frame,1,34559,404,278,79145);
	-- Jehil the Climber		79678
	MyRareFinderDraw(frame,1,34708,616,264,79678,"Climb the bones to reach him");
	-- Canyon Icemother		71721
	MyRareFinderDraw(frame,1,32941,340,232,71721);
	-- Giant-Slayer Kul		71665
	MyRareFinderDraw(frame,1,32918,546,222,71665);
	-- Huntmaster Kuang		78151
	MyRareFinderDraw(frame,1,34130,586,342,78151,"Spawns after killing a rare clefthoof");
	-- Coldtusk			76914
	MyRareFinderDraw(frame,1,34131,546,694,76914);
	-- Firefury Giant		74971
	MyRareFinderDraw(frame,1,33504,714,468,74971,"Follow the lava up, spawned by Firefury Stone");
	-- Gurun			80235
	MyRareFinderDraw(frame,1,34839,470,552,80235,"In a cave");

	-- Assault on the Iron Siegeworks
	-- 84384		Taskmaster Kullah
	MyRareFinderDraw(frame,4,84384,844,488,84384,"Daily Rare: Assault on the Iron Siegeworks");
	-- 87600		Jaluk the Pacifist
	MyRareFinderDraw(frame,4,37556,850,522,87600,"Daily Rare: Assault on the Iron Siegeworks");
	-- 84378		Ak'ox the Slaughterer
	MyRareFinderDraw(frame,4,37525,886,574,84378,"Daily Rare: Assault on the Iron Siegeworks");
	-- 84392		Ragore Driftstalker
	MyRareFinderDraw(frame,4,37401,866,488,84392,"Daily Rare: Assault on the Iron Siegeworks");
	-- 84376		Earthshaker Holar
	MyRareFinderDraw(frame,4,37403,866,518,84376,"Daily Rare: Assault on the Iron Siegeworks");
	-- 87622		Ogom the Mangler
	MyRareFinderDraw(frame,4,37402,836,472,87622,"Daily Rare: Assault on the Iron Siegeworks");
	-- 84374		Kaga the Ironbender
	MyRareFinderDraw(frame,4,37404,870,464,84374,"Daily Rare: Assault on the Iron Siegeworks");
	
	-- Assault on Magnarok
	-- 87351		Mother of Goren
	MyRareFinderDraw(frame,4,37381,700,270,87351,"Daily Rare: Assault on Magnarok");
	-- 78265		The Bone Crawler
	MyRareFinderDraw(frame,4,37361,722,330,78265,"Daily Rare: Assault on Magnarok");
	-- 87348		Hoarfrost
	MyRareFinderDraw(frame,4,37382,688,194,87348,"Daily Rare: Assault on Magnarok");
	-- 87349		Gomtar the Agile
	MyRareFinderDraw(frame,4,87349,722,300,87349,"Daily Rare: Assault on Magnarok");
	-- 87352		Gibblette the Cowardly
	MyRareFinderDraw(frame,4,87380,722,360,87352,"Daily Rare: Assault on Magnarok");
	-- 72364		Gorg'ak the Lava Guzzler
	MyRareFinderDraw(frame,4,37562,700,360,72364,"Daily Rare: Assault on Magnarok");
	-- 87356		Vrok the Ancient
	MyRareFinderDraw(frame,4,37379,706,390,87356,"Daily Rare: Assault on Magnarok");
	-- 87357		Valkor
	MyRareFinderDraw(frame,4,37378,724,242,87357,"Daily Rare: Assault on Magnarok");
	
	-- Assault on Stonefury Cliffs
	-- 82618		Tor'goroth
	MyRareFinderDraw(frame,4,37384,436,94,82618,"Daily Rare: Assault on Stonefury Cliffs");
	-- 82620		Son of Goramal
	MyRareFinderDraw(frame,4,37383,382,160,82620,"Daily Rare: Assault on Stonefury Cliffs");
	-- 82617		Slogtusk the Corpse-Eater
	MyRareFinderDraw(frame,4,37385,450,150,82617,"Daily Rare: Assault on Stonefury Cliffs");
	-- 82616		Jabberjaw
	MyRareFinderDraw(frame,4,37386,482,234,82616,"Daily Rare: Assault on Stonefury Cliffs");
	-- 82614		Moltnoma
	MyRareFinderDraw(frame,4,37387,430,210,82614,"Daily Rare: Assault on Stonefury Cliffs");
end

function MyRareFinderTanaan( frame )
	-- Keravnos		80398
	MyRareFinderDraw(frame,1,37407,400,820,80398);
	-- Commander Org'mok	89675
	MyRareFinderDraw(frame,1,38749,504,452,89675);
	-- Sergeant Mor'grak	90024
	MyRareFinderDraw(frame,1,37953,424,370,90024);
	-- Harbormaster Korak	90094
	MyRareFinderDraw(frame,1,39046,396,328,90094);
	-- Zoug the Heavy	90122
	MyRareFinderDraw(frame,1,39045,370,330,90122);
	-- Imp-Master Valessa	90429
	MyRareFinderDraw(frame,1,38026,318,724,90429);
	-- Ceraxas		90434
	MyRareFinderDraw(frame,1,38031,314,680,90434);
	-- Jax'zor		90437
	MyRareFinderDraw(frame,1,38030,266,750,90437);
	-- Lady Oran		90438
	MyRareFinderDraw(frame,1,38029,256,766,90438);
	-- Mistress Thavra	90442
	MyRareFinderDraw(frame,1,38032,258,792,90442);
	-- Cindral the Wildfire	90519
	MyRareFinderDraw(frame,1,37990,446,378,90519);
	-- High Priest Ikzan	90777
	MyRareFinderDraw(frame,1,38028,226,396,90777);
	-- Rasthe		90782
	MyRareFinderDraw(frame,1,38034,178,418,90782);
	-- Bilkor the Thrower 	90884
	MyRareFinderDraw(frame,1,38262,236,520,90884);
	-- Rogond the Tracker 	90885
	MyRareFinderDraw(frame,1,38263,204,498,90885);
	-- Dorg the Bloody 	90887
	MyRareFinderDraw(frame,1,38265,235,468,90887);
	-- Drivnul		90888
	MyRareFinderDraw(frame,1,38264,256,462,90888);
	-- Bloodhunter Zulk 	90936
	MyRareFinderDraw(frame,1,38266,212,522,90936);
	-- Putre'thar		91009
	MyRareFinderDraw(frame,1,38457,568,228,91009);
	-- Zeter'el		91087
	MyRareFinderDraw(frame,1,38207,484,286,91087);
	-- Bramblefell		91093
	MyRareFinderDraw(frame,1,38209,407,698,91093);
	-- Felspark		91098
	MyRareFinderDraw(frame,1,38211,528,256,91098);
	-- Remnant of the Blood Moon	91227
	MyRareFinderDraw(frame,1,39159,222,508,91227);
	-- Commander Krag'goth	91232
	MyRareFinderDraw(frame,1,38746,152,545,91232);
	-- Tho'gar Gorefist	91243
	MyRareFinderDraw(frame,1,38747,134,586,91243);
	-- Podlord Wakkawam	91374
	MyRareFinderDraw(frame,1,38282,168,496,91374);
	-- Grand Warlock Nethekurse	91695
	MyRareFinderDraw(frame,1,38400,475,423,91695);
	-- Executor Riloth	91727
	MyRareFinderDraw(frame,1,38411,495,365,91727);
	-- Argosh the Destroyer	91871
	MyRareFinderDraw(frame,1,38430,526,406,91871);
	-- Relgor		92197
	MyRareFinderDraw(frame,1,38496,263,549,92197);
	-- Painmistress Selora	92274
	MyRareFinderDraw(frame,1,38557,538,206,92274);
	-- Xanzith the Everlasting	92408
	MyRareFinderDraw(frame,1,38579,600,212,92408);
	-- Overlord Ma'gruth	92411
	MyRareFinderDraw(frame,1,38580,530,200,92411);
	-- Broodlord Ixkor	92429
	MyRareFinderDraw(frame,1,38589,578,673,92429);
	-- Varyx the Damned	92451
	MyRareFinderDraw(frame,1,37937,276,326,92451);
	-- The Blackfang 	92465
	MyRareFinderDraw(frame,1,38597,488,732,92465);
	-- Soulslicer		92495
	MyRareFinderDraw(frame,1,38600,622,730,92495);
	-- Gloomtalon		92508
	MyRareFinderDraw(frame,1,38604,632,800,92508);
	-- Krell the Serene 	92517
	MyRareFinderDraw(frame,1,38605,520,838,92517);
	-- Belgork		92552
	MyRareFinderDraw(frame,1,38609,349,471,92552);
	-- Thromma the Gutslicer	92574
	MyRareFinderDraw(frame,1,38620,340,444,92574);
	-- Sylissa		92606
	MyRareFinderDraw(frame,1,38628,405,792,92606);
	-- The Night Haunter	92636
	MyRareFinderDraw(frame,1,38632,408,734,92636);
	-- Felsmith Damorka	92647
	MyRareFinderDraw(frame,1,38634,458,470,92647);
	-- Bleeding Hollow Horror	92657
	MyRareFinderDraw(frame,1,38696,500,740,92657);
	-- The Goreclaw		92694
	MyRareFinderDraw(frame,1,38654,349,725,92694);
	-- Steelsnout		92887
	MyRareFinderDraw(frame,1,38700,654,366,92887);
	-- Gorabosh		92941
	MyRareFinderDraw(frame,1,38709,330,358,92941);
	-- The Iron Houndmaster	92977
	MyRareFinderDraw(frame,1,38751,130,570,92977);
	-- Szirek the Twisted	93001
	MyRareFinderDraw(frame,1,38752,161,574,93001);
	-- Magwia		93002
	MyRareFinderDraw(frame,1,38726,524,625,93002);
	-- Driss Vile		93028
	MyRareFinderDraw(frame,1,38736,198,536,93028);
	-- Grannok		93057
	MyRareFinderDraw(frame,1,38750,159,597,93057);
	-- Captain Ironbeard 	93076
	MyRareFinderDraw(frame,1,38756,356,799,93076);
	-- Glub'glok		93125
	MyRareFinderDraw(frame,1,38764,345,783,93125);
	-- Felbore		93168
	MyRareFinderDraw(frame,1,38775,287,510,93168);
	-- Shadowthrash		93236
	MyRareFinderDraw(frame,1,38812,497,612,93236);
	-- Captain Grok'mar	93264
	MyRareFinderDraw(frame,1,38820,480,572,93264);
	-- Kris'kar the Unredeemed	93279
	MyRareFinderDraw(frame,1,38825,396,684,93279);
	-- Terrorfist		95044
	MyRareFinderDraw(frame,1,39288,154,636,95044);
	-- Deathtalon		95053
	MyRareFinderDraw(frame,1,39287,232,404,95053);
	-- Vengeance		95054
	MyRareFinderDraw(frame,1,39290,324,740,95054);
	-- Doomroller		95056
	MyRareFinderDraw(frame,1,39289,470,526,95056);
end

function MyRareFinderDraw( frame, type, n, x, y, npcid, npcnote )
	local f = CreateFrame("Button",nil,frame,nil,n)
	f:SetWidth(16)
	f:SetHeight(16)
	f.raretype = type
	if ( IsQuestFlaggedCompleted(n) == true ) and (type == 1) then
		f.raretype = 2
	end
	-- types: 1 = Onetime Rare, 2 = Killed onetime Rare, 3 = Normal Rare, 4 = Daily Rare
	if ( f.raretype == 1 ) then
		if ( MyRareFinderOneTimeRares == true ) then
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIcon.tga")
		else
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
			f:SetWidth(0)
			f:SetHeight(0)
		end
	elseif ( f.raretype == 2 ) then
		if ( MyRareFinderKilledOTRares == true ) then
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconDead.tga")
		else
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
			f:SetWidth(0)
			f:SetHeight(0)
		end
	elseif ( f.raretype == 3 ) then
		if ( MyRareFinderNormalRares == true ) then
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconRed.tga")
		else
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
			f:SetWidth(0)
			f:SetHeight(0)
		end
	elseif ( f.raretype == 4 ) then
		if ( MyRareFinderDailyRares == true ) then
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconBlue.tga")
		else
			f:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
			f:SetWidth(0)
			f:SetHeight(0)
		end
	end
	f.rareid = npcid
	if ( MyRareData[npcid] == nil ) then
		print("Debug: "..npcid);
	end
	f.rarepx = x
	f.rarepy = y
	f:EnableMouse(true)
	f:SetScript("OnShow", function(self)
			-- MyRareFinderNormalRares
			-- MyRareFinderOneTimeRares
			-- MyRareFinderKilledOTRares
			if ( IsQuestFlaggedCompleted(self:GetID()) == true ) and ( self.raretype == 1) then
				self.raretype = 2
			end
			if ( self.raretype == 1 ) then
				if ( MyRareFinderOneTimeRares == true ) then
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIcon.tga")
					self:SetWidth(16)
					self:SetHeight(16)
				else
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
					self:SetWidth(0)
					self:SetHeight(0)
				end
			elseif ( self.raretype == 2 ) then
				if ( MyRareFinderKilledOTRares == true ) then
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconDead.tga")
					self:SetWidth(16)
					self:SetHeight(16)
				else
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
					self:SetWidth(0)
					self:SetHeight(0)
				end
			elseif ( self.raretype == 3 ) then
				if ( MyRareFinderNormalRares == true ) then
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconRed.tga")
					self:SetWidth(16)
					self:SetHeight(16)
				else
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
					self:SetWidth(0)
					self:SetHeight(0)
				end
			elseif ( self.raretype == 4 ) then
				if ( MyRareFinderDailyRares == true ) then
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconBlue.tga")
					self:SetWidth(16)
					self:SetHeight(16)
				else
					self:SetNormalTexture("Interface\\AddOns\\FieldMatter\\textures\\RareIconNone.tga")
					self:SetWidth(0)
					self:SetHeight(0)
				end
			end
		end)
	f:SetScript("OnEnter", function(self) 
			-- types: 1 = Onetime Rare, 2 = Killed onetime Rare, 3 = Normal Rare, 4 = Daily Rare
			-- MyRareFinderNormalRares
			-- MyRareFinderOneTimeRares
			-- MyRareFinderKilledOTRares
			if (( self.raretype == 1 ) and ( MyRareFinderOneTimeRares == true )) or 
				(( self.raretype == 2 ) and ( MyRareFinderKilledOTRares == true )) or
					(( self.raretype == 3 ) and ( MyRareFinderNormalRares == true )) or
						(( self.raretype == 4 ) and ( MyRareFinderDailyRares == true )) then
							-- patrol path feature maybe?
							WorldMapTooltip:SetOwner(WorldMapFrame,"ANCHOR_CURSOR");
							WorldMapTooltip:AddLine(MyRareData[self.rareid]);
							if (self:GetID() == 0) then
								WorldMapTooltip:AddLine("Unknown Flag",1,0,0);
							elseif ( self.raretype == 2 ) then
								WorldMapTooltip:AddLine(MyRareLocKilled,1,0,0);
							elseif ( self.raretype == 1 ) then
								WorldMapTooltip:AddLine(MyRareLocAlive,0,1,0);
							elseif ( self.raretype == 3 ) then
								WorldMapTooltip:AddLine(MyRareLocRare,0,1,0);
							elseif ( self.raretype == 4 ) then
								WorldMapTooltip:AddLine(MyRareLocDaily,0,1,1);
							end
							WorldMapTooltip:AddLine(MyRareDataNote[self.rareid],1,1,1);
							WorldMapTooltip:AddLine("NPC ID " .. self.rareid,0,1,1);
							WorldMapTooltip:Show();
			end
		end)
	f:SetScript("OnLeave", function(self) 
			WorldMapTooltip:Hide();
		end)
	f:SetScript("OnClick", function(self) 
			if ( TomTom ~= nil ) then
				if ( MyRareWaypoints[self.rareid] ~= nil ) then
					TomTom:RemoveWaypoint(MyRareWaypoints[self.rareid])
					MyRareWaypoints[self.rareid] = nil
				else
					local m, f = GetCurrentMapAreaID()
					m = tonumber(m)
					f = tonumber(f)
					x = tonumber(self.rarepx/1000)
					y = tonumber(self.rarepy/1000)
					title = MyRareData[self.rareid]
					MyRareWaypoints[self.rareid] = TomTom:AddMFWaypoint(m, f, x, y, {title = title})
				end
			end
		end)
	f:SetPoint("TOPLEFT",WorldMapButton,"TOPLEFT",(x-8)*WorldMapButton:GetWidth()/1000,(y-8)*WorldMapButton:GetHeight()/-1000)
	f:Show()
end

function MyRareFinder_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT")
	GameTooltip:ClearLines()
	GameTooltip:AddLine("");
	GameTooltip:AddLine("",0,1,0);
	GameTooltip:Show();
end
