local _,ZGV = ...

ZGV.DragonRacing = {}
local DR = ZGV.DragonRacing

DR.Achieves = {
	[1] = {
		zone="Waking Shores",
		{race="Ruby Lifeshrine Loop",map_raw="The Waking Shores 63.32,70.91"},
		{race="Wild Preserve Slalom",map_raw="The Waking Shores 47.01,85.58"},
		{race="Emberflow Flight",map_raw="The Waking Shores 41.97,67.30"},
		{race="Apex Canopy River Run",map_raw="The Waking Shores 23.26,84.30"},
		{race="Uktulut Coaster",map_raw="The Waking Shores 55.45,41.13"},
		{race="Wingrest Roundabout",map_raw="The Waking Shores 73.19,33.93"},
		{race="Flashfrost Flyover",map_raw="The Waking Shores 62.77,74.00"},
		{race="Wild Preserve Circuit",map_raw="The Waking Shores 42.59,94.45"},
	},
	[2] = {
		zone="Ohn'ahran Plains",
		{race="Sundapple Copse Circuit",map_raw="Ohn'ahran Plains 63.74,30.52"},
		{race="Fen Flythrough",map_raw="Ohn'ahran Plains 86.23,35.81"},
		{race="Ravine River Run",map_raw="Ohn'ahran Plains 80.89,72.20"},
		{race="Emerald Garden Ascent",map_raw="Ohn'ahran Plains 25.71,55.07"},
		{race="Maruukai Dash",map_raw="Ohn'ahran Plains 59.93,35.55"},
		{race="Mirror of the Sky Dash",map_raw="Ohn'ahran Plains 47.48,70.63"},
		{race="River Rapids Route",map_raw="Ohn'ahran Plains 43.74,66.78"},
	},
	[3] = {
		zone="The Azure Span",
		{race="The Azure Span Sprint",map_raw="The Azure Span 47.91,40.79"},
		{race="The Azure Span Slalom",map_raw="The Azure Span 20.95,22.63"},
		{race="The Vakthros Ascent",map_raw="The Azure Span 71.29,24.64"},
		{race="Iskaara Tour",map_raw="The Azure Span 16.58,49.37"},
		{race="Frostland Flyover",map_raw="The Azure Span 48.47,35.79"},
		{race="Archive Ambit",map_raw="The Azure Span 42.27,56.77"},
	},
	[4] = {
		zone="Thaldraszus",
		{race="The Flowing Forest Flight",map_raw="Thaldraszus 57.77,75.01"},
		{race="Tyrhold Trial",map_raw="Thaldraszus 57.24,66.90"},
		{race="Cliffside Circuit",map_raw="Thaldraszus 37.65,48.93"},
		{race="Academy Ascent",map_raw="Thaldraszus 60.29,41.59"},
		{race="Garden Gallivant",map_raw="Thaldraszus 39.50,76.19"},
		{race="Caverns Criss-Cross",map_raw="Thaldraszus 58.06,33.62"},
	},
	[5] = {
		zone="Forbidden Reach",
		{race="Stormsunder Crater Circuit",map_raw="##2151 76.14,65.61"},
		{race="Morqut Ascent",map_raw="##2151 31.32,65.71"},
		{race="Aerie Chasm Cruise",map_raw="##2151 63.10,51.90"},
		{race="Southern Reach Route",map_raw="##2151 63.61,84.05"},
		{race="Caldera Coaster",map_raw="##2151 41.37,14.55"},
		{race="Forbidden Reach Rush",map_raw="##2151 49.40,60.05"},
	},
	[6] = {
		zone="Zaralek Cavern",
		{race="Crystal Circuit",map_raw="##2133 38.76,60.63"},
		{race="Caldera Cruise",map_raw="##2133 39.03,50.01"},
		{race="Brimstone Scramble",map_raw="##2133 54.50,23.71"},
		{race="Shimmering Slalom",map_raw="##2133 58.71,45.03"},
		{race="Loamm Roamm",map_raw="##2133 58.16,57.58"},
		{race="Sulfur Sprint",map_raw="##2133 51.25,46.67"},
	},
	[7] = {
		zone="Kalimdor",
		{race="Felwood Flyover",map_raw="##77 58.04,11.4"},
		{race="Winter Wander",map_raw="##83 68.99,68.44"},
		{race="Nordrassil Spiral",map_raw="##198 56.60,27.67"},
		{race="Hyjal Hotfoot",map_raw="##198 22.49,52.9"},
		{race="Rocketway Ride",map_raw="##76 67.17,26.22"},
		{race="Ashenvale Ambit",map_raw="##63 36.38,28.71"},
		{race="Durotar Tour",map_raw="##1 56.92,62.91"},
		{race="Webwinder Weave",map_raw="##65 66.64,87.33"},
		{race="Desolace Drift",map_raw="##66 28.06,63.48"},
		{race="Great Divide Dive",map_raw="##199 41.50,12.93"},
		{race="Razorfen Roundabout",map_raw="##199 42.77,93.04"},
		{race="Thousand Needles Thread",map_raw="##64 10.84,19.88"},
		{race="Feralas Ruins Ramble",map_raw="##69 63.69,53.78"},
		{race="Ahn'Qiraj Circuit",map_raw="##81 38.5,82.74"},
		{race="Uldum Tour",map_raw="##249 54.77,41.09"},
		{race="Un'Goro Crater Circuit",map_raw="##78 53.31,93.12"},
	},
	[8] = {
		zone="Eastern Kingdoms",
		{race="Gilneas Gambit",map_raw="##217 58.64,11.69"},
		{race="Loch Modan Loop",map_raw="##48 46.82,13.93"},
		{race="Searing Slalom",map_raw="##32 73.31,42.96"},
		{race="Twilight Terror",map_raw="##241 34.78,77.86"},
		{race="Deadwind Derby",map_raw="##42 46.18,72.21"},
		{race="Elwynn Forest Flash",map_raw="##37 64.44,48.74"},
		{race="Gurubashi Gala",map_raw="##50 70.11,26.49"},
		{race="Ironforge Interceptor",map_raw="##27 74.12,34.00"},
		{race="Blasted Lands Bolt",map_raw="##17 62.64,26.15"},
		{race="Plaguelands Plunge",map_raw="##23 34.84,37.87"},
		{race="Booty Bay Blast",map_raw="##210 40.38,77.77"},
		{race="Fuselight Night Flight",map_raw="##15 67.12,36.80"},
		{race="Krazzworks Klash",map_raw="##241 72.94,27.94"},
		{race="Redridge Rally",map_raw="##49 40.78,25.02"},
	},
	[9] = {
		zone="Emerald Dream",
		{race="Ysera Invitational",map_raw="##2200 59.11,28.80"},
		{race="Smoldering Sprint",map_raw="##2200 37.18,44.08"},
		{race="Viridescent Venture",map_raw="##2200 35.15,55.22"},
		{race="Shoreline Switchback",map_raw="##2200 69.62,52.63"},
		{race="Canopy Concours",map_raw="##2200 62.79,88.11"},
		{race="Emerald Amble",map_raw="##2200 32.37,48.24"},
	}
}
local DRAchieves=DR.Achieves

local DragonRaceAchieves_raw = {
	-- shores
	15696,15712,15724,15730,15736,15742,15705,15718, -- bronze normal
	15697,15713,15725,15731,15737,15743,15706,15719, -- silver normal
	15698,15714,15726,15732,15738,15744,15707,15720, -- gold normal

	15702,15715,15727,15733,15739,15745,15709,15721, -- bronze advanced
	15703,15716,15728,15734,15740,15746,15710,15722, -- silver advanced
	15704,15717,15729,15735,15741,15747,15711,15723, -- gold advanced

	17120,17123,17126,17129,17132,17135,17138,17141, -- reverse bronze
	17121,17124,17127,17130,17133,17136,17139,17142,
	17122,17125,17128,17131,17134,17137,17140,17143,

	17853,17906,17865,17871,17884,17891,17897,17859, -- challenge
	17854,17860,17866,17872,17885,17892,17898,17907,
	17855,17861,17867,17873,17886,17893,17899,17908,

	17856,17909,17868,17874,17887,17894,17900,17862, -- challenge reverse
	17857,17863,17869,17875,17888,17895,17901,17910,
	17858,17864,17870,17876,17889,17896,17902,17911,

	-- plains
	15757,15763,15769,15775,15782,15785,16302,
	15758,15764,15770,15776,15783,15786,16303,
	15759,15765,15771,15777,15784,15787,16304,

	15760,15766,15772,15778,00000,00000,16305,
	15761,15767,15773,15779,00000,00000,16306,
	15762,15768,15774,15780,00000,00000,16307,

	17144,17147,17150,17153,00000,00000,17156,
	17145,17148,17151,17154,00000,00000,17157,
	17146,17149,17152,17155,00000,00000,17158,

	17912,17922,17928,17935,17941,17947,17950,
	17913,17923,17929,17936,17942,17948,17951,
	17914,17924,17930,17937,17943,17949,17952,

	17919,17925,17931,17938,00000,00000,17944,
	17920,17926,17932,17939,00000,00000,17945,
	17921,17927,17933,17940,00000,00000,17946,

	-- azure
	15788,15799,15818,15835,15841,15847,
	15789,15800,15819,15836,15842,15848,
	15790,15801,15820,15837,15843,15849,

	15791,15802,15821,15838,15844,15850,
	15792,15803,15822,15839,15845,15851,
	15793,15804,15823,15840,15846,15852,

	17159,17162,17165,17168,17171,17174,
	17160,17163,17166,17169,17172,17175,
	17161,17164,17167,17170,17173,17176,

	17953,17959,17965,17971,17979,17985,
	17954,17960,17966,17972,17980,17986,
	17955,17961,17967,17973,17981,17987,

	17956,17962,17968,17974,17982,17988,
	17957,17963,17969,17975,17983,17989,
	17958,17964,17970,17976,17984,17990,

	-- thaldfszsws
	15827,15855,15891,15897,15903,15909, --normal
	15828,15856,15892,15898,15904,15910,
	15829,15857,15893,15899,15905,15911,

	15830,15858,15894,15900,15906,15912, --advanced
	15831,15859,15895,15901,15907,15913,
	15832,15860,15896,15902,15908,15914,

	17177,17180,17183,17186,17189,17192, --reverse
	17178,17181,17184,17187,17190,17193,
	17179,17182,17185,17188,17191,17194,

	17991,17997,18003,18009,18015,18021, --challenge
	17992,17998,18004,18010,18016,18022,
	17993,17999,18005,18011,18017,18023,

	17994,18000,18006,18012,18018,18024, --rev.challenge
	17995,18001,18007,18013,18019,18025,
	17996,18002,18008,18014,18020,18026,

	-- forbidden
	17214,17223,17243,17252,17261,17270,
	17215,17224,17244,17253,17262,17271,
	17216,17225,17245,17254,17263,17272,

	17217,17237,17246,17255,17264,17273,
	17218,17238,17247,17256,17265,17274,
	17219,17239,17248,17257,17266,17275,

	17220,17240,17249,17258,17267,17276,
	17221,17241,17250,17259,17268,17277,
	17222,17242,17251,17260,17269,17278,

	18028,18034,18040,18046,18052,18058,
	18029,18035,18041,18047,18053,18059,
	18030,18036,18042,18048,18054,18060,

	18031,18037,18043,18049,18055,18061,
	18032,18038,18044,18050,18056,18062,
	18033,18039,18045,18051,18057,18063,

	-- zaralek
	17429,17438,17447,17456,17465,17474,
	17430,17439,17448,17457,17466,17475,
	17431,17440,17449,17458,17467,17476,

	17432,17441,17450,17459,17468,17477,
	17433,17442,17451,17460,17469,17478,
	17434,17443,17452,17461,17470,17479,

	17435,17444,17453,17462,17471,17480,
	17436,17445,17454,17463,17472,17481,
	17437,17446,17455,17464,17473,17482,

	18064,18070,18076,18082,18088,18094,
	18065,18071,18077,18083,18089,18095,
	18066,18072,18078,18084,18090,18096,

	18067,18073,18079,18085,18091,18097,
	18068,18074,18080,18086,18092,18098,
	18069,18075,18081,18087,18093,18099,

	-- kalimdor
	17568,17577,17586,17595,17604,17613,17622,17631,17640,17649,17658,17667,17676,17685,17694,17703,
	17569,17578,17587,17596,17605,17614,17623,17632,17641,17650,17659,17668,17677,17686,17695,17704,
	17570,17579,17588,17597,17606,17615,17624,17633,17642,17651,17660,17669,17678,17687,17696,17705,

	17571,17580,17589,17598,17607,17616,17625,17634,17643,17652,17661,17670,17679,17688,17697,17706,
	17572,17581,17590,17599,17608,17617,17626,17635,17644,17653,17662,17671,17680,17689,17698,17707,
	17573,17582,17591,17600,17609,17618,17627,17636,17645,17654,17663,17672,17681,17690,17699,17708,

	17574,17583,17592,17601,17610,17619,17628,17637,17646,17655,17664,17673,17682,17691,17700,17709,
	17575,17584,17593,17602,17611,17620,17629,17638,17647,17656,17665,17674,17683,17692,17701,17710,
	17576,17585,17594,17603,17612,17621,17630,17639,17648,17657,17666,17675,17684,17693,17702,17711,

	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,

	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,

	--eastern
	18399,18408,18417,18426,18435,18444,18453,18462,18474,18483,18498,18510,18519,18528,
	18400,18409,18418,18427,18436,18445,18454,18463,18475,18484,18499,18511,18520,18529,
	18401,18410,18419,18428,18437,18446,18455,18464,18476,18485,18500,18512,18521,18530,

	18402,18411,18420,18429,18438,18447,18456,18465,18477,18486,18501,18513,18522,18531,
	18403,18412,18421,18430,18439,18448,18457,18466,18478,18487,18502,18514,18523,18532,
	18404,18413,18422,18431,18440,18449,18458,18467,18479,18488,18503,18515,18524,18533,

	18405,18414,18423,18432,18441,18450,18459,18468,18480,18489,18504,18516,18525,18534,
	18406,18415,18424,18433,18442,18451,18460,18469,18481,18490,18505,18517,18526,18535,
	18407,18416,18425,18434,18443,18452,18461,18470,18482,18491,18506,18518,18527,18536,

	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,

	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,
	00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,00000,

	--emerald
	18943,18978,18993,19032,19047,19062,
	18944,18979,18994,19033,19048,19063,
	18945,18980,18995,19034,19049,19064,

	18946,18981,18996,19035,19050,19065,
	18947,18982,18997,19036,19051,19066,
	18948,18983,18998,19037,19052,19067,

	18949,18984,18999,19038,19053,19068,
	18950,18985,19000,19039,19054,19069,
	18951,18986,19001,19040,19055,19070,

	18952,18987,19002,19041,19056,19071,
	18953,18988,19003,19042,19057,19072,
	18954,18989,19004,19043,19058,19073,

	18955,18990,19005,19044,19059,19074,
	18956,18991,19006,19045,19060,19075,
	18957,18992,19007,19046,19061,19076,
}
-- Based on achievements: 15915,15927,15916,15928,15917,15929,15918,15930,15919,15931,15920,15932,15921,15933,15922,15934,15923,15935,15924,15936,15925,15937,15926,15938
local diffs = {"normal","advanced","reverse","challenge","revchallenge"}
for i,zone in ipairs(DRAchieves) do
	for ri,race in ipairs(zone) do for di,diff in ipairs(diffs) do race[diff]={} end end
	for di,diff in ipairs(diffs) do
		for medal=1,3 do
			for ri,race in ipairs(zone) do
				race[diff][medal]=tremove(DragonRaceAchieves_raw,1)
			end
		end
	end
end

function DR:GetRaceZone(zone)
	return DRAchieves[zone].zone
end
function DR:GetRaceName(zone,race)
	return DRAchieves[zone][race].race
end
function DR:GetRaceLocation(zone,race)
	return DRAchieves[zone][race].map_raw
end
function DR:GetRaceMedal(zone,race,diff)
	local medal_achieves = DRAchieves[zone][race][diff]
	for medal=3,1,-1 do if select(4,GetAchievementInfo(medal_achieves[medal])) then return medal end end
	return 0
end


--local MedalTextures = { { COPPER_AMOUNT_TEXTURE, SILVER_AMOUNT_TEXTURE, GOLD_AMOUNT_TEXTURE	},{} }
--for i=1,3 do  MedalTextures[1][i]=MedalTextures[1][i]:gsub("%%d","")  MedalTextures[2][i]=MedalTextures[1][i]:gsub("|t",":44:44:0:44:0:44:70:70:70|t")  end
local MedalTextures = { { "|A:challenges-medal-small-bronze:0:0:0:0|a", "|A:challenges-medal-small-silver:0:0:0:0|a", "|A:challenges-medal-small-gold:0:0:0:0|a" },{} }
for i=1,3 do  MedalTextures[1][i]=MedalTextures[1][i]:gsub("%%d","")  MedalTextures[2][i]=MedalTextures[1][i]:gsub("|a",":90:110:110|a")  end

ZGV.GOALTYPES['dragonrace'] = {
	parse = function(self,params)
		self.zone,self.race,self.diff,self.medal = strsplit(",",params)
		--if self.diff=="normal" then self.diff=1 end
		--if self.diff=="advanced" then self.diff=2 end
		if self.medal=="bronze" then self.medal=1 end
		if self.medal=="silver" then self.medal=2 end
		if self.medal=="gold" then self.medal=3 end
		self.zone=tonumber(self.zone)  assert(DRAchieves[self.zone],"there is no zone "..self.zone)
		self.race=tonumber(self.race)  assert(DRAchieves[self.zone][self.race],"there is no race "..self.race.." in zone "..self.zone)
		self.medal=tonumber(self.medal)
		self.racedata=DRAchieves[self.zone][self.race]
		if not self.zone then return false,"no zone?" end
		if not self.medal then
			self.force_nocomplete=true
		else
			self.achieve_id = self.racedata[self.diff][self.medal]
		end
		ZGV.GOALTYPES['goto'].parse(self,self.racedata.map_raw,{})
	end,
	gettext = function(self)
		if self.medal then
			return "Earn a "..({"Bronze","Silver","Gold"})[self.medal].." score in "..({"Normal","Advanced"})[self.diff].." "..DRAchieves[self.zone][self.race].race.." in "..DRAchieves[self.zone].zone
		end
		-- otherwise show a scoreboard of the race
		--local s=zone.zone..", "..race.name..":\n"
		local s=self.racedata.race..":\n"

		local diffs=diffs
		if self.diff then diffs={self.diff} end
		for di,diff in ipairs(diffs) do repeat
			if self.racedata[diff][1]==0 then break end -- no advanced for Dash races
			s=s..({normal="Normal",advanced="Advanced",reverse="Reverse",challenge="Challenge",revchallenge="Reverse Challenge"})[diff]..": "
			self.racedata.desc = self.racedata.desc or {}
			local topmedal=DR:GetRaceMedal(self.zone,self.race,diff)
			s=s..(topmedal>0 and MedalTextures[1][topmedal] or MedalTextures[2][2]).."  "
		until true end
		return s
	end,
	iscomplete = function(self)
		return select(4,GetAchievementInfo(self.achieve_id)),true
	end,
	onclick = function(self)
		ZGV.Pointer:SetWaypoint(self.map,self.x,self.y,{
			title=self.racedata.race,
			type="manual",
			onminimap="always",
			overworld=true,
			showonedge=true,
			findpath=true,
		})
	end
}



--[[
GUIDE:

step
dragonrace 1,1
dragonrace 1,2
dragonrace 1,3
dragonrace 1,4
dragonrace 1,5
dragonrace 1,6
dragonrace 1,7
dragonrace 1,8
step
dragonrace 2,1
dragonrace 2,2
dragonrace 2,3
dragonrace 2,4
dragonrace 2,5
dragonrace 2,6
dragonrace 2,7
step
dragonrace 3,1
dragonrace 3,2
dragonrace 3,3
dragonrace 3,4
dragonrace 3,5
dragonrace 3,6
step
dragonrace 4,1
dragonrace 4,2
dragonrace 4,3
dragonrace 4,4
dragonrace 4,5
dragonrace 4,6

step
dragonrace 1,1,normal,1
dragonrace 1,1,normal,3
dragonrace 1,1,advanced,gold
dragonrace 3,1,advanced,gold
--]]
