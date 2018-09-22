local _, ns = ...

--优先级别设置最小为1,数字越大优先级越高.
--first = 主要图标里显示 
--second = 次要图标里显示
--如果first与second列表里有重复spellid,将只会在主要图标显示.

--ascending  添加需要正数显示而并非传统的倒数显示aura剩余时间.比如龙母的毁坏debuff.同时你还要在debuffs或者instances里添加相应的spellid.只适用于debuff.true= 启用,false=禁用

--debuffs 要监视的debuff,任何地图.

--buffs 要监视的buff,任何地图.

--instances 副本地图里的debuff,可以使用地图的副本ID获得.

ns.auras_ascending = {
	[89435]= true,
	[89421]= true,
}

ns.auras_buffs = {
	first = {
	},
	second = {	
		----------------------恶魔猎手---------------
		[187827] = 3,	--恶魔变形
		[218256] = 1,	--强化结界
		[227225] = 2,	--灵魂壁垒
		--------------------------战士---------------
		[871] = 2,	--盾墙
		[12975] = 2,	--破釜沉舟
		[97463] = 2,	--命令怒吼
		[125565] = 2,	--挫志怒吼
		[132404] = 1,	--盾牌格挡
		[118038] = 2,	--剑在人在
		[97463] = 3,	--集结呐喊
		--------------------------骑士---------------		
		[53600] = 2,	--盾击
		[498] = 2,	--圣佑术
		[642] = 2,	--圣盾术
		[1022] = 2,	--保护之手
		[6940] = 2,	--牺牲之手
		[86659] = 2,	--远古列王守卫
		[31821] = 2,	--虔诚光环
		[31850] = 2,	--炽热防御者	
		[114039] = 2,	--纯净之手
		[152262] = 2,	--炽天使
		-----------------------死亡骑士---------------
		[48707] = 2,	--反魔法护罩
		[145629] = 2,	--反魔法领域
		[49222] = 1,	--白骨之盾
		[48792] = 2,	--冰封之韧
		[171049] = 2,	--符文分流
		[55233] = 2,	--吸血鬼之血
		[81256] = 2,	--符文刃舞
		------------------------德鲁伊---------------
		[22812] = 1,	--树皮术
		[61336] = 2,	--生存本能
		[132402] = 1,	--野蛮防御
		[102342] = 2,	--铁木树皮
		[192083] = 1,	--乌索尔的印记
		[200851] = 1,	--沉睡者之怒
		------------------------牧师--------------------
		[33206] = 2, 	--痛苦压制
		[47788] = 2, 	--守护之魂
		[62618] = 2, 	--真言术:障
		[17]   = 2,	-- 真言术:盾
		------------------------武僧--------------------
		[116849] = 2, 	--作茧缚命
		[115176] = 2, 	--禅悟冥想
		[122278] = 1,	--躯不坏
		[122783] = 2, 	--散魔功
		[115308] = 1, 	--飘渺酒
		[115295] = 2, 	--金钟罩
		[115203] = 2, 	--壮胆酒
		------------------------法师--------------------
		[45438] = 3, 	--冰箱
		[110960] = 3,  --强隐
		[157913] = 3,  --隐没
                ------------------------DH--------------------
		[196555] = 3, 	--冰箱
		[212800] = 3,  --强隐
		[188499] = 3,  --隐没
                ------------------------SS--------------------
		[104773] = 3, 	--冰箱
                ------------------------LR--------------------
		[186265] = 3, 	--威慑
		------------------------SM--------------------
		[30823] = 3, 	--萨满之怒
		[108271] = 3,  --星界转移
        ------------------------DZ-------------------
		[76577] = 3, 	--烟雾弹
		[1966] = 3,  --佯攻
		[31224] = 3, 	--斗篷
		------------------------raid-------------------
		[106213] = 71, 	--奈萨里奥的血液 DS7#
		[115856] = 71,    --废灵壁垒 MV2#     
	},	
}

ns.auras_debuffs = {
	first = {
		[39171] =  9, -- Mortal Strike
		[76622] =  9, -- Sunder Armor
		[145263] =  9, --
		[61385] =  9, --定身 
		[209858] =  9, --死疽

		--Sha of Anger 怒之煞
		[119626] = 11, --Aggressive Behavior
		[119488] = 12, --Unleashed Wrath
		[119610] = 13, --Bitter Thoughts
		[119601] = 14, --Bitter Thoughts

		--Nalak, The Storm Lord 暴风领主纳拉克
		[136339] = 12,
		[136340] = 13,

		--Oondasta 乌达斯塔
		[137504] = 12, --Crush
		
		--Ordos, Fire-God of the Yaungol 野牛人火神斡耳朵斯
		[144689] = 12, --Burning Soul
		
		--Chi-Ji, The Red Crane 朱鹤赤精
		
		--Yu'lon, The Jade Serpent 青龙玉珑
		[144630] = 12, --Jadeflame Buffet
		
		--Niuzao, The Black Ox 玄牛砮皂
		[144607] = 12, --Oxen Fortitude
		
		--Xuen, The White Tiger 白虎雪怒
		[144638] = 12, --Spectral Swipe

		--Drov the Ruiner 毁灭者多弗
                [175915] = 12,

		--Tarlna the Ageless 永恒的塔尔纳
		[175973] = 12, 
		[176001] = 13, 
                [176037] = 14,

		--Rukhmar 鲁克玛
		[167615] = 12, 

		--"破碎群岛"
		-- Broken Isles
		-- Ana-Mouz
		[219045] = 4,
		[218823] = 5,

		-- Calamir
		[218888] = 5,
		[217925] = 5,
		[217966] = 5,
		[217877] = 6,
		[218012] = 6,
		[217907] = 5,

		-- Drugon the Frostblood
		[219602] = 5,
		[219812] = 5,
		[219610] = 4,

		-- Flotsam
		[223373] = 5,
		[223355] = 5,

		-- Humongris
		[216430] = 5,
		[216476] = 5,
		[227177] = 6,
		[216817] = 7,

		-- Levantus
		[170196] = 5,
		[217362] = 5,
		[217235] = 6,
		[217352] = 4,
		[217206] = 3,
		[222706] = 4,

		-- Na'zak the Fiend
		[219349] = 5,
		[219861] = 5,

		-- Nithogg
		[212867] = 5,
		[212852] = 5,
		[212948] = 5,

		-- Shar'thos
		[215876] = 5,
		[216044] = 5,
		[215821] = 6,

		-- The Soultakers
		[213625] = 6,
		[213590] = 4,

		-- Reaver Jdorn
		[213665] = 5,

		-- Withered J'im
	},
	second = {	
	},	
}

ns.auras_instances_debuffs = {
	first = {
		[262] = {--"黑色沼泽"
			[31464] =  4,
			[31422] =  4,
			[35054] =  3,
			[38534] =  3,
			[12542] =  4,
			[39049] =  4,
			[36276] =  3,
			[34366] =  3,
			[31467] =  3,
			[9080] =  3,
		},
		[745] = {--"卡拉赞"
			[37066] =  4,
			[29522] =  4,
			[29511] =  4,
			[30115] =  4,
			[30753] =  4,
			[30843] =  4,
		},
		[748] = {--"毒蛇神殿"
			[39042] =  4,
			[39044] =  4, 
			[38235] =  4, 
			[38246] =  4, 
			[37850] =  4, 
			[38023] =  4, 
			[38024] =  4, 
			[38025] =  4, 
			[37676] =  4, 
			[37641] =  4, 
			[37749] =  4, 
			[38280] =  4,
		},
		[750] = {--"海加尔山之战"
			[31249] =  4,
			[31306] =  4, 
			[31347] =  4, 
			[31341] =  4, 
			[31344] =  4, 
			[31944] =  4, 
			[31972] =  4,
		},
		[751] = {--"黑暗神庙"
			[34654] =  4,
			[39674] =  4, 
			[41150] =  4, 
			[41168] =  4, 
			[39837] =  4, 
			[40239] =  4, 
			[40251] =  4, 
			[40604] =  4, 
			[40481] =  4, 
			[40508] =  4, 
			[42005] =  4, 
			[41303] =  4, 
			[41410] =  4, 
			[41376] =  4, 
			[40860] =  4, 
			[41001] =  4, 
			[41485] =  4, 
			[41472] =  4, 
			[41914] =  4, 
			[41917] =  4, 
			[40585] =  4, 
			[40932] =  4,
		},
		[752] = {--"太阳井"
			[46561] =  4,
			[46562] =  4, 
			[46266] =  4, 
			[46557] =  4, 
			[46560] =  4, 
			[46543] =  4, 
			[46427] =  4, 
			[45032] =  4, 
			[45034] =  4, 
			[45018] =  4, 
			[46384] =  4, 
			[45150] =  4, 
			[45855] =  4, 
			[45662] =  4, 
			[45402] =  4, 
			[45717] =  4, 
			[45256] =  4, 
			[45333] =  4, 
			[46771] =  4, 
			[45270] =  4, 
			[45347] =  4, 
			[45348] =  4, 
			[45996] =  4, 
			[45442] =  4, 
			[45641] =  4, 
			[45885] =  4, 
			[45737] =  4, 
			[45740] =  4, 
			[45741] =  4, 
		},
		[756] = {--"永恒之眼"
			--Malygos
			[56272] =  4, -- Arcane Breath
			[57407] =  4, -- Surge of Power
		},
		[759] = {--奥杜尔
			--Trash
			[62310] =  4, --Impale  
			[63612] =  4, --Lightning Brand  
			[63615] =  4, --Ravage Armor  
			[62283] =  4, --Iron Roots  
			[63169] =  4, --Petrify Joints  
			--Razorscale
			[64771] =  4,--Fuse Armor  
			--Ignis the Furnace Master
			[62548] =  4, --Scorch  
			[62680] =  4, --Flame Jet  
			[62717] =  4, --Slag Pot  
			--XT-002
			[63024] =  4, --Gravity Bomb  
			[63018] =  4, --Light Bomb  
			--The Assembly of Iron
			[61888] =  4, --Overwhelming Power  
			[62269] =  4, --Rune of Death  
			[61903] =  4, --Fusion Punch  
			[61912] =  4, --Static Disruption 
			--Kologarn
			[64290] =  4, --Stone Grip  
			[63355] =  4, --Crunch Armor  
			[62055] =  4, --Brittle Skin  
			--]Hodir
			[62469] =  4, --Freeze  
			[61969] =  4, --Flash Freeze  
			[62188] =  4, --Biting Cold  
			--Thorim
			[62042] =  4, --Stormhammer  
			[62130] =  4, --Unbalancing Strike  
			[62526] =  4, --Rune Detonation  
			[62470] =  4, --Deafening Thunder  
			[62331] =  4, --Impale  
			--Freya
			[62532] =  4, --Conservator's Grip  
			[62589] =  4, --Nature's Fury  
			[62861] =  4, --Iron Roots  
			--Mimiron
			[63666] =  4,--Napalm Shell  
			[62997] =  4,--Plasma Blast  
			[64668] =  4,--Magnetic Field  
			--General Vezax
			[63276] =  4,--Mark of the Faceless  
			[63322] =  4,--Saronite Vapors  
			--Yogg-Saron
			[63147] =  4,--Sara's Anger 
			[63134] =  4,--Sara's Blessing 
			[63138] =  4,--Sara's Fervor 
			[63830] =  4,--Malady of the Mind  
			[63802] =  4,--Brain Link 
			[63042] =  4,--Dominate Mind  
			[64152] =  4,--Draining Poison  
			[64153] =  4,--Black Plague  
			[64125] =  4,--Squeeze  
			[64156] =  4,--Apathy  
			[64157] =  4,--Curse of Doom  
			--Algalon
			[64412] =  4,--Phase Punch		
		},
		[755] = {--"黑曜石圣殿"
			--Trash
			[39647] =  4, -- Curse of Mending
			[58936] =  4, -- Rain of Fire
			--Sartharion
			[60708] =  4, -- Fade Armor
			[57491] =  4, -- Flame Tsunami
		},
		[753] = {--"阿尔卡冯的宝库"
			--Koralon the Flame Watcher
			[66684] =  4, -- Flaming Cinder
			--Toravon the Ice Watcher
			[72004] =  4, -- Frostbite
		},
		[754] = { --Naxxramas
			--Trash
			[55314] =  4,--Strangulate
			--Anub'Rekhan
			[28786] =  4,--Locust Swarm 
			--Grand Widow Faerlina--
			[28796] =  4,--Poison Bolt Volley
			[28794] =  4,--Rain of Fire
			--Maexxna
			[28622] =  4,--Web Wrap
			[54121] =  4,--Necrotic Poison
			--Noth the Plaguebringer
			[29213] =  4,--Curse of the Plaguebringer
			[29214] =  4,--Wrath of the Plaguebringer 
			[29212] =  4,--Cripple 
			--Heigan the Unclean
			[29998] =  4,--Decrepit Fever 
			[29310] =  4,--Spell Disruption 
			--Grobbulus
			[28169] =  4,--Mutating Injection 
			--Gluth
			[54378] =  4,--Mortal Wound 
			[29306] =  4,--Infected Wound 
			--Thaddius
			[28084] =  4,--Negative Charge 
			[28059] =  4,--Positive Charge 
			--Instructor Razuvious
			[55550] =  4,--Jagged Knife 
			--Sapphiron
			[28522] =  4,--Icebolt 
			[28542] =  4,--Life Drain
			--Kel'Thuzad
			[28410] =  4,--Chains of Kel'Thuzad
			[27819] =  4,--Detonate Mana
			[27808] =  4,--Frost Blast 		
			},
		[757] = {--"十字军的试炼"
			--Gormok the Impaler
			[66331] =  5, -- Impale
			[67475] =  5, -- Fire Bomb
			[66406] =  5, -- Snowbolled!
			--Acidmaw --Dreadscale
			[67618] =  5, -- Paralytic Toxin
			[66869] =  5, -- Burning Bile
			--Icehowl
			[67654] =  5, -- Ferocious Butt
			[66689] =  5, -- Arctic Breathe
			[66683] =  5, -- Massive Crash
			--Lord Jaraxxus
			[66532] =  5, -- Fel Fireball
			[66237] =  9, -- 血肉成灰
			[66242] =  7, -- Burning Inferno
			[66197] =  5, -- Legion Flame
			[66283] =  9, -- Spinning Pain Spike
			[66209] =  5, -- Touch of Jaraxxus(hard)
			[66211] =  5, -- Curse of the Nether(hard)
			[67906] =  5, -- Mistress's Kiss 10H
			--Faction Champions
			[65812] =  9, -- Unstable Affliction
			[65960] =  5, -- Blind
			[65801] =  5, -- Polymorph
			[65543] =  5, -- Psychic Scream
			[66054] =  5, -- Hex
			[65809] =  5, -- Fear
			--The Twin Val'kyr
			[67176] =  5, -- Dark Essence
			[67222] =  5, -- Light Essence
			[67283] =  7, -- Dark Touch
			[67298] =  7, -- Ligth Touch
			[67309] =  5, -- Twin Spike
			--Anub'arak
			[67574] =  9, -- Pursued by Anub'arak
			[66013] =  7, -- Penetrating Cold
			[67847] =  5, -- Expose Weakness
			[66012] =  5, -- Freezing Slash
			[67863] =  5, -- Acid-Drenched Mandibles(25H)
		},
		[758] = {--"冰冠堡垒"
			--The Lower Spire
			[70980] =  7, -- Web Wrap
			[69483] =  6, -- Dark Reckoning
			[69969] =  5, -- Curse of Doom
			--The Plagueworks
			[71089] =  5, -- Bubbling Pus
			[71127] =  7, -- Mortal Wound
			[71163] =  6, -- Devour Humanoid
			[71103] =  6, -- Combobulating Spray
			[71157] =  5, -- Infested Wound
			--The Crimson Hall
			[70645] =  9, -- Chains of Shadow
			[70671] =  5, -- Leeching Rot
			[70432] =  6, -- Blood Sap
			[70435] =  7, -- Rend Flesh
			--Frostwing Hall
			[71257] =  6, -- Barbaric Strike
			[71252] =  5, -- Volley
			[71327] =  6, -- Web
			[36922] =  5, -- Bellowing Roar
			--Lord Marrowgar
			[70823] =  5, -- Coldflame
			[69065] =  8, -- Impaled
			[70835] =  5, -- Bone Storm
			--Lady Deathwhisper
			[72109] =  5, -- Death and Decay
			[71289] =  9, -- Dominate Mind
			[71204] =  4, -- Touch of Insignificance
			[67934] =  5, -- Frost Fever
			[71237] =  5, -- Curse of Torpor
			[72491] =  5, -- Necrotic Strike
			--Gunship Battle
			[69651] =  5, -- Wounding Strike
			--Deathbringer Saurfang
			[72293] =  6, -- Mark of the Fallen Champion
			[72442] =  8, -- Boiling Blood
			[72449] =  5, -- Rune of Blood
			[72769] =  5, -- Scent of Blood (heroic)
			--Rotface
			[71224] =  5, -- Mutated Infection
			[71215] =  5, -- Ooze Flood
			[69774] =  5, -- Sticky Ooze
			--Festergut
			[69279] =  5, -- Gas Spore
			[71218] =  5, -- Vile Gas
			[72219] =  5, -- Gastric Bloat
			--Proffessor
			[70341] =  5, -- Slime Puddle
			[72549] =  5, -- Malleable Goo
			[71278] =  5, -- Choking Gas Bomb
			[70215] =  5, -- Gaseous Bloat
			[70447] =  5, -- Volatile Ooze Adhesive
			[72454] =  5, -- Mutated Plague
			[70405] =  5, -- Mutated Transformation
			[72856] =  6, -- Unbound Plague
			[70953] =  4, -- Plague Sickness
			--Blood Princes
			[72796] =  7, -- Glittering Sparks
			[71822] =  5, -- Shadow Resonance
			--Blood-Queen Lana'thel
			[70867] =  8, -- 鲜血女王的精华
			[70838] =  5, -- Blood Mirror
			[72265] =  6, -- Delirious Slash
			[71473] =  5, -- Essence of the Blood Queen
			[71474] =  6, -- Frenzied Bloodthirst
			[73070] =  5, -- Incite Terror
			[71340] =  7, -- Pact of the Darkfallen
			[71265] =  6, -- Swarming Shadows
			[70923] =  9, -- Uncontrollable Frenzy
			--Valithria Dreamwalker
			[70873] =  1, -- Emerald Vigor
			[71746] =  5, -- Column of Frost
			[71741] =  4, -- Mana Void
			[71738] =  7, -- Corrosion
			[71733] =  6, -- Acid Burst
			[71283] =  6, -- Gut Spray
			[71941] =  1, -- Twisted Nightmares
			--Sindragosa
			[69762] =  5, -- Unchained Magic
			[70106] =  6, -- Chlled to the Bone
			[69766] =  6, -- Instability
			[70126] =  9, -- Frost Beacon
			[70157] =  8, -- Ice Tomb
			[70127] =  7, -- Mystic Buffet
			--The Lich King
			[70337] =  8, -- Necrotic plague
			[72149] =  5, -- Shockwave
			[70541] =  7, -- Infest
			[69242] =  5, -- Soul Shriek
			[69409] =  9, -- Soul Reaper
			[72762] =  5, -- Defile
			[68980] =  8, --Harvest Soul
		},
		[761] = {--“晶红龙殿”
			--Baltharus the Warborn
			[74502] =  4, -- Enervating Brand
			--General Zarithrian
			[74367] =  4, -- Cleave Armor
			--Saviana Ragefire
			[74452] =  4, -- Conflagration
			--Halion
			[74562] =  7, -- Fiery Combustion
			[74567] =  5, -- Combustion
			[74792] =  6, -- Soul Consumption
			[74795] =  4, -- Consumption
		},		
		[68] = {--旋云之巅
			[87923] =  7, 
			[87930] =  8, 
			[88075] =  7, 
			[86292] =  7, 
			[88171] =  8, 
			[88182] =  7, 
			[88314] =  7, 
			[76622] =  8, 
			[87771] =  7, 
			[87618] =  8, 
		},
		[69] = {--托维尔失落之城
			[82764] =  7, 
			[89212] =  8, 
			[73976] =  7, 
			[82794] =  7, 
			[83776] =  8, 
			[81690] =  7, 
			[81677] =  7, 
			[81673] =  8, 
			[82760] =  7, 
			[81947] =  8, 
			[91871] =  8, 
		},
		[63] = {--"死亡矿井"
			[91016] =  7, -- 劈头斧
			[88352] =  8, -- 放置炸弹
			[91830] =  7, -- 注视
		},
		[71] = {--"格瑞姆巴托"
			[76720] =  7, 
			[76335] =  8, 
			[74837] =  7, 		
			[76507] =  7, 
			[74634] =  8, 
			[74846] =  7, 
			[76679] =  7, 
			[76715] =  8, 
			[76703] =  7,
			[74909] =  8, 
			[90764] =  7,
			[76394] =  7,	
			[76792] =  7, 
			[82850] =  8, 
			[75317] =  7,
			[76797] =  8, 
			[75861] =  7,
			[75792] =  7,
			[75755] =  6,
			[75694] =  6,
		},
		[65] = {--"潮汐王座"
			[76807] =  7, 
			[76721] =  8, 
			[76820] =  7, 		
			[84507] =  7, 
			[90479] =  8, 
			[80564] =  7, 
			[76026] =  7, 
			[76094] =  8,
		},
		[184] = {--"时光之末"
			[102066] =  7, 
			[109952] =  8, 
			[101411] =  7, 		
			[101412] =  7, 
			[103171] =  8, 
			[102149] =  7, 
			[102183] =  7, 
			[102381] =  8,
		},		
		[77] = {--"祖阿曼(5人)"
			[43150] =  8, -- 利爪之怒
			[43648] =  8, -- 电能风暴
			[43501] =  8, -- 灵魂虹吸
			[43093] =  10, -- 重伤投掷
			[43095] =  10, -- 麻痹蔓延
			[42402] =  10, -- 澎湃
		},
		[76] = {--"祖尔格拉布(5人)"
			[96477] =  10, -- 剧毒连接
			[96466] =  8, -- 赫希斯之耳语
			[96776] =  12, -- 血祭
			[96423] =  10, -- 痛苦鞭笞
			[96342] =  10, -- 扑杀
		},
		[78] = { -- 火源
			--Trash 
			--Flamewaker Forward Guard 
			[76622] =  4, -- Sunder Armor 
			[99610] =  5, -- Shockwave 
			--Flamewaker Pathfinder 
			[99695] =  4, -- Flaming Spear 
			[99800] =  4, -- Ensnare 
			--Flamewaker Cauterizer 
			[99625] =  4, -- Conflagration (Magic/dispellable) 
			--Fire Scorpion 
			[99993] =  4, -- Fiery Blood 
			--Molten Lord 
			[100767] =  4, -- Melt Armor 
			--Ancient Core Hound 
			[99692] =  4, -- Terrifying Roar (Magic/dispellable) 
			[99693] =  4, -- Dinner Time 
			--Magma 
			[97151] =  4, -- Magma 

			--Beth'tilac 
			[99506] =  5, -- The Widow's Kiss 
			--Cinderweb Drone 
			[49026] =  6, -- Fixate 
			--Cinderweb Spinner 
			[97202] =  5, -- Fiery Web Spin 
			--Cinderweb Spiderling 
			[97079] =  4, -- Seeping Venom 
			--Cinderweb Broodling 

			[100048] =  4, --Fiery Web 

			--Lord Rhyolith 
			[98492] =  5, --Eruption 

			--Alysrazor 
			[101729] =  5, -- Blazing Claw 
			[100094] =  4, -- Fieroblast 
			[99389] =  5, -- Imprinted 
			[99308] =  4, -- Gushing Wound 
			[100640] =  6, -- Harsh Winds 
			[100555] =  6, -- Smouldering Roots 
			--Do we want to show these? 
			[99461] =  4, -- Blazing Power 
			--[98734] =  4, -- Molten Feather 
			--[98619] =  4, -- Wings of Flame 
			--[100029] =  4, -- Alysra's Razor 

			--Shannox 
			[99936] =  5, -- Jagged Tear 
			[99837] =  7, -- Crystal Prison Trap Effect 
			[101208] =  4, -- Immolation Trap 
			[99840] =  4, -- Magma Rupture 
			-- Riplimp 
			[99937] =  5, -- Jagged Tear 
			-- Rageface 
			[99947] =  6, -- Face Rage 
			[100415] =  5, -- Rage  

			--守门人贝尔洛克 
			[99252] =  4, -- Blaze of Glory 
			[99256] =  15, -- 饱受磨难 
			[99403] =  6, -- Tormented 
			[99262] =  4, -- 活力火花
			[99263] =  4, -- 生命之焰
			[99516] =  7, -- Countdown 
			[99353] =  7, -- Decimating Strike 
			[100908] =  6, -- Fiery Torment 

			--Majordomo Staghelm 
			[98535] =  5, -- Leaping Flames 
			[98443] =  6, -- Fiery Cyclone 
			[98450] =  5, -- Searing Seeds 
			--Burning Orbs 
			[100210] =  6, -- Burning Orb 
			[96993] =  5, -- Stay Withdrawn? 

			--Ragnaros 
			[99399] =  5, -- Burning Wound 
			[100293] =  5, -- Lava Wave 
			[100238] =  4, -- Magma Trap Vulnerability 
			[98313] =  4, -- Magma Blast 
			--Lava Scion 
			[100460] =  7, -- Blazing Heat 
			--Dreadflame? 
			--Son of Flame 
			--Lava 
			[98981] =  5, -- Lava Bolt 
			--Molten Elemental 
			--Living Meteor 
			[100249] =  5, -- Combustion 
			--Molten Wyrms 
			[99613] =  6, -- Molten Blast   

		},

		[75] = { --[[ 巴拉丁 ]]--	
			-- Demon Containment Unit
			[89354] =  10,
			-- Argaloth
			[88942] =  8, -- Meteor Slash
			[88954] =  12, -- Consuming Darkness
			-- Occu'thar
			[96913] =  10, -- 灼热暗影
			[96884] =  7, 	-- 集火
			-- Eye of Occu'thar
			[105069] =  11, -- 沸腾之怨
			[104936] =  12, -- 刺穿
		},
		
		[73] = { --[[ 黑翼]]--
			--熔喉
			[78941] =  6, -- 寄生感染
			[89773] =  7, -- 裂伤

			--全能金刚
			[79888] =  6, -- 闪电导体
			[79505] =  8, -- 火焰喷射器
			[80161] =  7, -- 化学云雾
			[79501] =  8, -- 获取目标
			[80011] =  7, -- 浸透毒液
			[80094] =  7, -- 锁定
			[92023] =  9, -- 暗影包围
			[92048] =  9, -- 暗影灌注
			[92053] =  9, -- 暗影导体
			--[91858] =  6, -- 超载的能量发生器
			
			--马洛拉克 教授龙
			[92973] =  8, -- 消蚀烈焰
			[92978] =  8, -- 快速冻结
			[92976] =  7, -- 酷寒
			[91829] =  7, -- 注视
			[92787] =  9, -- 黑暗吞噬

			--音波龙
			[78092] =  7, -- 追踪
			[78897] =  8, -- 声音太大了
			[78023] =  7, -- 咆哮烈焰

			--奇美隆
			[89084] =  8, -- 生命值过低
			[82881] =  7, -- 突破
			[82890] =  9, -- 至死方休
			[82935] =  10, -- 腐蚀烂泥

			--奈法利安
			[94128] =  7, -- 扫尾
			[94075] =  8, -- 熔岩
			[81118] =  8, -- 熔岩
			[79339] =  9, -- 爆裂灰烬
			[79318] =  9, -- 统御
			[77827] =  6, -- 龙尾扫击
		},

		[72] = { --[[ 暮光]]--
			--破龙
			[39171] =  7, -- 致伤打击
			[86169] =  8, -- 狂怒咆哮

			--双龙
			[86788] =  8, -- 眩晕
			[86622] =  7, -- 嗜体魔法
			[86202] =  7, -- 暮光位移

			--议会
			[82665] =  7, -- 寒冰之心
			[82660] =  7, -- 燃烧之血
			[82762] =  7, -- 浸水
			[83099] =  9, -- 闪电魔棒
			[82285] =  8, -- 元素禁止
			[92488] =  8, -- 重力碾压

			--古加尔
			[86028] =  6, -- 古加尔的冲击波
			[93189] =  7, -- 堕落之血
			[93133] =  7, -- 衰弱光线
			[81836] =  8, -- 腐蚀:加速
			[81831] =  8, -- 腐蚀:疫病
			[82125] =  8, -- 腐蚀:畸变
			[82170] =  8, -- 腐蚀:绝对

			--龙母
			[89435] =  15, -- 毁坏
		},

		[74] = { --[[ 四风 ]]--
			--风之议会
			[85576] =  9, -- 枯萎之风
			[85573] =  9, -- 呼啸狂风
			[93057] =  7, -- 刺骨旋风
			[86481] =  8, -- 飓风
			[93123] =  7, -- 风寒
			[93121] =  8, -- 剧毒孢子

			--奥拉基尔
			--[93281] =  7, -- 酸雨
			[87873] =  7, -- 静电震击
			[88427] =  7, -- 通电
			[93294] =  8, -- 闪电魔棒
			[93284] =  9, -- 狂风
		},
		
	   [187] = {-- 巨龙之魂
		--Morchok
			[103687] =  11, --Crush Armor
			[103821] =  12, --Earthen Vortex
			[103785] =  13, --Black Blood of the Earth
			[103534] =  14, --Danger (Red)
			[103536] =  15, --Warning (Yellow)
			-- Don't need to show Safe people
			[103541] =  16, --Safe (Blue)

			--督军
			[104378] =  21, --Black Blood of Go'rath
			[103434] =  22, --干扰之影

			--Yor'sahj the Unsleeping
			[104849] =  31, --虚空箭
			[105171] =  32, --深度腐蚀

			--Hagara the Stormbinder
			[105316] =  41, --Ice Lance
			[105465] =  42, --Lightning Storm
			[105369] =  43, --Lightning Conduit
			[105289] =  44, --Shattered Ice (dispellable)
			[105285] =  45, --Target (next Ice Lance)
			[104451] =  46, --Ice Tomb
			[110317] =  49, --水壕
			[109325] =  48, --霜冻				

			--Ultraxion
			[105925] =  55, --黯淡之光
			[106108] =  52, --Heroic Will
			[105984] =  53, --Timeloop
			[105927] =  54, --Faded Into Twilight

			--Warmaster Blackhorn		        
			[107558] =  62, --溃变 
			[108046] =  63, --震荡波
			[110214] =  64, --吞噬遮幕
			[107567] =  65, --残忍打击
			[108043] =  66, --破甲

			--Spine of Deathwing
			[105563] =  71, --Grasping Tendrils
			[105479] =  72, --灼热血浆
			[105490] =  73, --灼热之握
			[106200] =  74, --血之腐蚀:大地
			[106199] =  75, --血之腐蚀:死亡

			--Madness of Deathwing
			[105445] =  81, --炽热
			[105841] =  82, --突变撕咬
			[106385] =  83, --重碾
			[106730] =  84, --破伤风
			[106444] =  85, --刺穿
			[106794] =  86, --碎屑
			[108649] =  87, --腐蚀寄生虫
		},	
		[303] = { --Gate of the Setting Sun 残阳关
			[107268] = 7,
			[106933] = 7,
			[115458] = 7,
			-- Raigonn 莱公
			[111644] = 7, -- Screeching Swarm 111640 111643
			[111723] = 7, --凝视
		},

		[321] = { --Mogu'shan Palace 魔古山神殿 
			
			-- Trial of the King 国王的试炼
			[119946] = 7, -- Ravage
			[120167] = 7, --焚烧
			[120195] = 7, --陨石术
			[120160] = 7, --陨石术
			-- Xin the Weaponmaster <King of the Clans> 武器大师席恩
			[119684] = 7, --Ground Slam
		},
      
		[311] = { --Scarlet Halls 血色大厅

			-- Houndmaster Braun <PH Dressing>
			[114056] = 7, -- Bloody Mess
        
			-- Flameweaver Koegler
			[113653] = 7, -- Greater Dragon's Breath
			[11366] = 6,-- Pyroblast      
		},
      
		[316] = { --Scarlet Monastery 血色修道院 

			-- Thalnos the Soulrender
			[115144] = 7, -- Mind Rot
			[115297] = 6, -- Evict Soul
		},
      
		[246] = { --Scholomance 通灵学院 

			-- Instructor Chillheart
			[111631] = 7, -- Wrack Soul
			
			-- Lilian Voss
			[111585] = 7, -- Dark Blaze
			[115350] = 7,--凝视
			
			-- Darkmaster Gandling
			[108686] = 7, -- Immolate
		},
            
		[312] = { --Shado-Pan Monastery 影踪禅院 
			[107140] = 7, --磁能障壁
			-- Sha of Violence
			[106872] = 7, -- Disorienting Smash
			
			-- Taran Zhu <Lord of the Shado-Pan>
			[112932] = 7, -- Ring of Malice
		},
      
		[324] = { --Siege of Niuzao Temple 围攻砮皂寺

			-- Wing Leader Ner'onok 
			[121447] = 7, -- Quick-Dry Resin
		},
      
		[313] = { --Temple of the Jade Serpent 青龙寺
			
			[114826] = 7, --
			-- Wise Mari <Waterspeaker>
			[106653] = 7, -- Sha Residue
         
			-- Lorewalker Stonestep <The Keeper of Scrolls>
			[106653] = 7, -- Agony
         
			-- Liu Flameheart <Priestess of the Jade Serpent>
			[106823] = 7, -- Serpent Strike
         
			-- Sha of Doubt
			[106113] = 7, --Touch of Nothingness
		},
      
		[317] = { --Mogu'shan Vaults 魔古山宝库
         
			--Trash
			[118562] = 9, -- Petrified
			[118552] = 9,  
			[116596] = 10, -- Smoke Bomb
			[125091] = 9,
			[125092] = 9,
			[116970] = 9,

			-- The Stone Guard
			[130395] = 11, -- Jasper Chains: Stacks
			[130404] = 12, -- Jasper Chains
			[130774] = 13, -- Amethyst Pool
			[116038] = 14, -- Jasper Petrification: stacks
			[115861] = 15, -- Cobalt Petrification: stacks
			[116060] = 16, -- Amethyst Petrification: stacks
			[116281] = 17, -- Cobalt Mine Blast, Magic root
			[125206] = 18, -- Rend Flesh: Tank only
			[116008] = 19, -- Jade Petrification: stacks

			--Feng the Accursed
			[116040] = 22, -- Epicenter, roomwide aoe.
			[116784] = 24, -- Wildfire Spark, Debuff that explodes leaving fire on the ground after 5 sec.
			[116374] = 29, -- Lightning Charge, Stun debuff.
			[116417] = 27, -- Arcane Resonance, aoe-people-around-you-debuff.
			[116942] = 23, -- Flaming Spear, fire damage dot.
			[131788] = 21, -- Lightning Lash: Tank Only: Stacks
			[131790] = 25, -- Arcane Shock: Stack : Tank Only
			[102464] = 26, -- Arcane Shock: AOE
			[116364] = 28, -- Arcane Velocity
			[131792] = 30, -- Shadowburn: Tank only: Stacks: HEROIC ONLY

			-- Gara'jal the Spiritbinder
			[122151] = 44,   -- Voodoo Doll, shared damage with the tank.
			[117723] = 43,   -- Frail Soul: HEROIC ONLY --虛弱靈魂
			[116161] = 41,   -- Crossed Over, people in the spirit world.
			[122181] = 42,	 -- 通往灵魂世界的通道

			-- The Spirit Kings
			[117708] = 51, -- Meddening Shout, The mind control debuff.
			[118303] = 52, -- Fixate, the once targeted by the shadows.
			[118048] = 53, -- Pillaged, the healing/Armor/damage debuff.
			[118135] = 54, -- Pinned Down, Najentus spine 2.0
			[118047] = 55, -- Pillage: Target
			[118163] = 56, -- Robbed Blind

			--Elegon
			[117878] = 61, -- Overcharged, the stacking increased damage taken debuff.   
			[117945] = 63, -- Arcing Energy
			[117949] = 62, -- Closed Circuit, Magic Healing debuff.

			--Will of the Emperor
			[116969] = 76, -- Stomp, Stun from the bosses.
			[116835] = 77, -- Devestating Arc, Armor debuff from the boss.
			[116969] = 75, -- Focused Energy.
			[116778] = 72, -- Focused Defense, Fixate from the Emperors Courage.
			[117485] = 73, -- Impending Thrust, Stacking slow from the Emperors Courage.
			[116525] = 71, -- Focused Assault, Fixate from the Emperors Rage
			[116550] = 74, -- Energizing Smash, Knockdown from the Emperors Strength
		},
      
		[330] = { --Heart of Fear 恐惧之心 
			[123417] = 9,
			[123434] = 9,
			[123436] = 8, 
			[123497] = 8,
			[123420] = 8,
			[126901] = 8,
			[125081] = 8,
			[125758] = 8,
			[125907] = 8,
			[126912] = 7,
         
			-- Imperial Vizier Zor'lok
			[122760] = 11, -- Exhale, The person targeted for Exhale. 
			[123812] = 12, -- Pheromones of Zeal, the gas in the middle of the room.
			[122706] = 14, -- Noise Cancelling, The "safe zone" from the roomwide aoe.
			[122740] = 13, -- Convert, The mindcontrol Debuff.

			-- Blade Lord Ta'yak
			[123180] = 21, -- Wind Step, Bleeding Debuff from stealth.
			[123474] = 23, -- Overwhelming Assault, stacking tank swap debuff. 
			[122949] = 22, -- Unseen Strike
			[124783] = 24, -- Storm Unleashed
			[123600] = 25, -- Storm Unleashed?

			-- Garalon
			[122774] = 31, -- Crush, stun from the crush ability.
			[123120] = 34, --- Pheromone Trail
			[122835] = 32, -- Pheromones, The buff indicating who is carrying the pheramone.
			[123081] = 33, -- Punchency, The stacking debuff causing the raid damage.

			--Wind Lord Mel'jarak
			[122055] = 42, -- Residue, The debuff after breaking a prsion preventing further breaking.
			[121881] = 41, -- Amber Prison, not sure what the differance is but both were used.
			[122064] = 43, -- Corrosive Resin, the dot you clear by moving/jumping.
			[121885] = 44, -- 监牢

			-- Amber-Shaper Un'sok 
			[122064] = 54, -- Corrosive Resin
			[122784] = 53, -- Reshape Life, Both were used.
			[122504] = 55, -- Burning Amber.
			[121949] = 52, -- Parasitic Growth, the dot that scales with healing taken.
			[122370] = 51, -- 生命重塑
		
			--Grand Empress Shek'zeer
			[125283] = 60, 
			[124097] = 61, --Sticky Resin.
			[125390] = 62, --Fixate.
			[123707] = 63, --Eyes of the Empress.
			[123788] = 64, --Cry of Terror.
			[125824] = 65, --Trapped!.
			[124777] = 66, --Poison Bomb.
			[124821] = 67, --Poison-Drenched Armor.
			[124827] = 68, --Poison Fumes.
			[124849] = 69, --Consuming Terror.
			[124863] = 70, --Visions of Demise.
			[124862] = 71, --Visions of Demise: Target.
			[123845] = 72, --Heart of Fear: Chosen.
			[123846] = 73, --Heart of Fear: Lure.
			[123184] = 74,		
		},
      
		[320] = { --Terrace of Endless Spring 永春台
			
			--Trash
			[125760] = 10,
			[125758] = 10,

			--Protectors Of the Endless
			[117519] = 11, -- Touch of Sha, Dot that lasts untill Kaolan is defeated.
			[111850] = 12, -- Lightning Prison: Targeted
			[117986] = 15, -- Defiled Ground: Stacks
			[118191] = 14, -- Corrupted Essence
			[117436] = 13, -- Lightning Prison, Magic stun.

			--Tsulong
			[122768] = 21, -- Dread Shadows, Stacking raid damage debuff (ragnaros superheated style) 
			[122789] = 24, -- Sunbeam, standing in the sunbeam, used to clear dread shadows.
			[122858] = 28, -- Bathed in Light, 500% increased healing done debuff.
			[122752] = 23, -- Shadow Breath, increased shadow breath damage debuff.
			[123011] = 26, -- Terrorize: 10%, Magical dot dealing % health.
			[123036] = 27, -- Fright, 2 second fear.
			[122777] = 22, -- Nightmares, 3 second fear.
			[123012] = 25, -- Terrorize: 5% 
			
			--Lei Shi
			[123121] = 31, -- Spray, Stacking frost damage taken debuff.
			[123705] = 32, -- Scary Fog
			
			--Sha of Fear
			[129147] = 42, -- Ominous Cackle, Debuff that sends players to the outer platforms.
			[119086] = 49, -- Penetrating Bolt, Increased Shadow damage debuff.
			[119775] = 50, -- Reaching Attack, Increased Shadow damage debuff.
			[120669] = 44, -- Naked and Afraid.
			[119983] = 43, -- Dread Spray, is also used.
			[119414] = 41, -- Breath of Fear, Fear+Massiv damage.
			[75683] = 45, -- Waterspout
			[120629] = 46, -- Huddle in Terror
			[120394] = 47, --Eternal Darkness
			[129189] = 48, --Sha Globe
			[125786] = 41, --Breath of Fear
		},

		[362] = { --5.2雷霆王座

			[138196] = 5,
			[138687] = 5,
			[139550] = 5,
			[139317] = 5,
			[140618] = 5,
			[140686] = 5,
			[140682] = 5,
			[140629] = 5,
			[122962] = 5,
			[139310] = 5,
			[140620] = 5,
			[140616] = 5,
			[140400] = 5,
			[139470] = 5,
			[139314] = 5,

			--Jin'rokh the Breaker
			[138006] = 5, --Electrified Waters
			[137399] = 7, --Focused Lightning fixate
			[138732] = 6, --Ionization
			[138349] = 4, --Static Wound (tank only)
			[137371] = 4, --Thundering Throw (tank only)

			--Horridon
			[136769] = 6, --Charge
			[136767] = 6, --Triple Puncture (tanks only)
			[136708] = 3, --Stone Gaze
			[136723] = 5, --Sand Trap
			[136587] = 5, --Venom Bolt Volley (dispellable)
			[136710] = 5, --Deadly Plague (disease)
			[136670] = 4, --Mortal Strike
			[136573] = 6, --Frozen Bolt (Debuff used by frozen orb)
			[136512] = 5, --Hex of Confusion
			[136719] = 6, --Blazing Sunlight
			[136654] = 4, --Rending Charge
			[140946] = 7, --Dire Fixation (Heroic Only)

			--Council of Elders
			[136922] = 6, --Frostbite
			[137084] = 3, --Body Heat
			[137641] = 6, --Soul Fragment (Heroic only)
			[136878] = 5, --Ensnared
			[136857] = 6, --Entrapped (Dispell)
			[137650] = 5, --Shadowed Soul
			[137359] = 6, --Shadowed Loa Spirit fixate target
			[137972] = 6, --Twisted Fate (Heroic only)
			[136860] = 5, --Quicksand

			--Tortos
			[134030] = 6, --Kick Shell
			[134920] = 6, --Quake Stomp
			[136751] = 6, --Sonic Screech
			[136753] = 4, --Slashing Talons (tank only)
			[137633] = 5, --Crystal Shell (heroic only)

			--Megaera
			[139822] = 6, --Cinder (Dispell)
			[134396] = 6, --Consuming Flames (Dispell)
			[137731] = 5, --Ignite Flesh
			[136892] = 6, --Frozen Solid
			[139909] = 5, --Icy Ground
			[137746] = 6, --Consuming Magic
			[139843] = 4, --Artic Freeze
			[139840] = 4, --Rot Armor
			[140179] = 6, --Suppression (stun)

			--Ji-Kun
			[138309] = 4, --Slimed
			[138319] = 5, --Feed Pool
			[140571] = 3, --Feed Pool
			[134372] = 3, --Screech

			--Durumu the Forgotten
			[133768] = 3, --Arterial Cut (tank only)
			[133767] = 3, --Serious Wound (Tank only)
			[136932] = 7, --Force of Will
			[134122] = 6, --Blue Beam
			[134123] = 6, --Red Beam
			[134124] = 6, --Yellow Beam
			[133795] = 4, --Life Drain
			[133597] = 6, --Dark Parasite
			[133732] = 5, --Infrared Light (the stacking red debuff)
			[133677] = 5, --Blue Rays (the stacking blue debuff)
			[133738] = 5, --Bright Light (the stacking yellow debuff)
			[133737] = 6, --Bright Light (The one that says you are actually in a beam)
			[133675] = 6, --Blue Rays (The one that says you are actually in a beam)
			[134626] = 6, --Lingering Gaze

			--Primordius
			[140546] = 6, --Fully Mutated
			[136180] = 3, --Keen Eyesight (Helpful)
			[136181] = 4, --Impared Eyesight (Harmful)
			[136182] = 3, --Improved Synapses (Helpful)
			[136183] = 4, --Dulled Synapses (Harmful)
			[136184] = 3, --Thick Bones (Helpful)
			[136185] = 4, --Fragile Bones (Harmful)
			[136186] = 3, --Clear Mind (Helpful)
			[136187] = 4, --Clouded Mind (Harmful)
			[136050] = 2, --Malformed Blood(Tank Only)

			--Dark Animus
			[138569] = 3, --Explosive Slam (tank only)
			[138659] = 6, --Touch of the Animus
			[138609] = 6, --Matter Swap
			[138691] = 4, --Anima Font
			[136962] = 5, --Anima Ring
			[138480] = 6, --Crimson Wake Fixate

			--Iron Qon
			[134647] = 6, --Scorched
			[136193] = 3, --Arcing Lightning
			[135147] = 3, --Dead Zone
			[134691] = 3, --Impale (tank only)
			[135145] = 7, --Freeze
			[136520] = 6, --Frozen Blood
			[137669] = 7, --Storm Cloud
			[137668] = 6, --Burning Cinders
			[137654] = 6, --Rushing Winds 
			[136577] = 5, --Wind Storm
			[136192] = 5, --Lightning Storm

			--Twin Consorts
			[137440] = 6, --Icy Shadows (tank only)
			[137417] = 6, --Flames of Passion
			[138306] = 5, --Serpent's Vitality
			[137408] = 3, --Fan of Flames (tank only)
			[137360] = 6, --Corrupted Healing (tanks and healers only?)
			[137375] = 4, --Beast of Nightmares
			[136722] = 6, --Slumber Spores

			--Lei Shen
			[135695] = 6, --Static Shock
			[136295] = 6, --Overcharged
			[135000] = 4, --Decapitate (Tank only)
			[394514] = 5, --Fusion Slash
			[136543] = 6, --Ball Lightning
			[134821] = 6, --Discharged Energy
			[136326] = 6, --Overcharge
			[137176] = 6, --Overloaded Circuits
			[136853] = 6, --Lightning Bolt
			[135153] = 6, --Crashing Thunder
			[136914] = 4, --Electrical Shock
			[135001] = 4, --Maim

			--Ra-Den (Heroic only)
			[138308] = 4,
			[138372] = 5,

		},
		[369] = { --围攻奥格瑞玛

			 --Trash
			 [149207] = 1, --腐蚀之触 
			 [145553] = 1, --贿赂 
			 [147554] = 1, --亚煞极之血 

			 --伊墨苏斯 
			 [143297] = 5, --煞能喷溅 
			 [143459] = 4, --煞能残渣 
			 [143524] = 4, --净化残渣 
			 [143286] = 4, --渗透煞能 
			 [143413] = 3, --漩涡 
			 [143411] = 3, --增速 
			 [143436] = 2, --腐蚀冲击 (坦克) 
			 [143579] = 3, --煞能腐蚀 (仅英雄模式) 

			 --堕落的守护者 
			 [143239] = 4, --致命剧毒 
			 [143198] = 6, --锁喉 
			 [143301] = 2, --凿击 
			 [143010] = 3, --蚀骨回旋踢 
			 [143434] = 6, --暗言术：蛊 (驱散) 
			 [143840] = 6, --苦痛印记 
			 [143959] = 4, --亵渎大地 
			 [143423] = 6, --煞能灼烧 
			 [143292] = 5, --锁定 
			 [147383] = 4, --衰竭 (Heroic Only) 

			 --诺鲁什 
			 [146124] = 2, --自惑 (坦克) 
			 [146324] = 4, --妒忌 
			 [144850] = 5, --信赖的试炼 
			 [145861] = 6, --自恋 (驱散) 
			 [144851] = 2, --自信的试炼 (坦克) 
			 [146703] = 3, --无底深渊 
			 [144514] = 6, --纠缠腐蚀 
			 [144849] = 4, --冷静的试炼 

			 --傲之煞 
			 [144358] = 2, --受损自尊 (坦克) 
			 [144843] = 3, --压制 
			 [146594] = 4, --泰坦之赐 
			 [144351] = 6, --傲慢标记 
			 [144364] = 4, --泰坦之力 
			 [146822] = 6, --投影 
			 [146817] = 5, --傲气光环 
			 [144774] = 2, --伸展打击 (坦克) 
			 [144636] = 5, --腐化囚笼 
			 [144574] = 6, --腐化囚笼，随机 
			 [145215] = 4, --放逐 (仅英雄模式) 
			 [147207] = 4, --动摇的决心 (仅英雄模式) 

			 --迦拉卡斯 
			 [146765] = 5, --烈焰之箭 
			 [147705] = 5, --毒性云雾 
			 [147029] = 2, -- 
			 [146902] = 2, --剧毒利刃 

			 --钢铁战蝎 
			 [144467] = 2, --燃烧护甲 
			 [144459] = 5, --激光灼烧 
			 [144498] = 5, --切割激光 
			 [144918] = 5, --切割激光 
			 [146325] = 6, --切割激光瞄准(重点监控) 

			 --库卡隆黑暗萨满 
			 [144089] = 6, --T剧毒之雾 
			 [144215] = 2, --冰霜风暴打击(坦克) 
			 [143990] = 2, --污水喷涌(坦克) 
			 [144304] = 2, --撕裂 
			 [144330] = 6, --钢铁囚笼(仅英雄模式) 

			 --纳兹戈林将军 
			 [143638] = 6, --碎骨重锤 
			 [143480] = 5, --刺客印记 
			 [143431] = 6, --魔法打击(驱散) 
			 [143494] = 2, --碎甲重击(坦克) 
			 [143882] = 5, --猎人印记 

			 --马尔考罗克 
			 [142863] = 5, --虚弱的上古屏障 
			 [142864] = 5, --上古屏障 
			 [142865] = 5, --强大的上古屏障 
			 [142990] = 2, --致命打击(坦克) 
			 [142913] = 6, --散逸能量 (驱散) 
			 [143919] = 5, --受难 (仅英雄模式) 

			 --潘达利亚战利品 
			 [144853] = 3, --血肉撕咬 
			 [145987] = 5, --设置炸弹 
			 [145218] = 4, --硬化血肉 
			 [145230] = 1, --禁忌魔法 
			 [146217] = 4, --投掷酒桶 
			 [146235] = 4, --火焰之息 
			 [145523] = 4, --活化打击 
			 [142983] = 6, --折磨 (the new Wrack) 
			 [145715] = 3, --疾风炸弹 
			 [145747] = 5, --浓缩信息素 
			 [146289] = 4, --严重瘫痪 

			 --嗜血的索克 
			 [143766] = 2, --恐慌(坦克) 
			 [143773] = 2, --冰冻吐息(坦克) 
			 [143452] = 1, --鲜血淋漓 
			 [146589] = 5, --万能钥匙(坦克) 
			 [143445] = 6, --锁定 
			 [143791] = 5, --腐蚀之血 
			 [143777] = 3, --冻结(坦克) 
			 [143780] = 4, --酸性吐息 
			 [143800] = 5, --冰冻之血 
			 [143428] = 4, --龙尾扫击 

			 --攻城匠师黑索 
			 [144236] = 4, --图像识别 
			 [143385] = 2, --电荷冲击(坦克) 
			 [143856] = 6, --过热 

			 --卡拉克西英杰 
			 [143701] = 5, --晕头转向 (stun) 
			 [143702] = 5, --晕头转向 
			 [143572] = 6, --紫色催化热罐燃料 
			 [142808] = 6, --炎界 
			 [142931] = 2, --血脉暴露 
			 [143735] = 6, --腐蚀琥珀 
			 [146452] = 5, --共鸣琥珀 
			 [142929] = 2, --脆弱打击 
			 [142797] = 5, --剧毒蒸汽 
			 [143939] = 5, --凿击 
			 [143275] = 2, --挥砍 
			 [143768] = 2, --音波发射 
			 [143279] = 2, --基因变异 
			 [143339] = 6, --注射 
			 [142803] = 6, --橙色催化爆炸之环 
			 [142649] = 4, --吞噬 
			 [146556] = 6, --穿刺 
			 [142671] = 6, --催眠术 
			 [143979] = 2, --恶意突袭 
			 [142547] = 6, --毒素：橙色 
			 [142549] = 6, --毒素：绿色 
			 [142550] = 6, --毒素：白色 
			 [142948] = 4, --瞄准 
			 [148589] = 4, --变异缺陷 
			 [143570] = 6, --热罐燃料准备(3S) 
			 [142945] = 5, --绿色催化诡异之雾 
			 [143358] = 4, --饥饿 
			 [142315] = 5, --酸性血液 

			 --加尔鲁什·地狱咆哮 
			 [144582] = 4, --断筋 
			 [145183] = 2, --绝望之握(坦克) 
			 [144762] = 4, --亵渎 
			 [145071] = 5, --亚煞极之触 
			 [148718] = 4, --火坑 
			 [148983] = 4, --勇气永春台 
			 [147235] = 6, --恶毒冲击 
			 [148994] = 4, --信念青龙寺 
			 [149004] = 4, --希望朱鹤寺 
			 [147324] = 5, --毁灭之惧 
			 [145171] = 5, --强化亚煞极之触(H) 
			 [145175] = 5, --强化亚煞极之触(N) 
			 [145195] = 6, --强化绝望之握 
			 [147665] = 5, --P4钢铁之星锁定 
			 [144817] = 4, --H强化亵渎 
			 [145065] = 5, --H亚煞极之触 
						
		},
		[559] = {--"黑石塔上层" Upper Blackrock Spire 
			 [161288] = 4,
			 [155031] = 4,
			 [153897] = 4,
			 [153981] = 4,
			 [167259] = 5,
			 [154827] = 5,
			 [155504] = 4,
			 [155037] = 4,
			 [155057] = 4,
			 [155065] = 4,
			 [163057] = 4,
			 [165944] = 4,
		},
		[537] = {--"影月墓地" Shadowmoon Burial Grounds 
			 [152979] = 4,
			 [153524] = 4,
			 [158061] = 4,
			 [153692] = 4,
			 [154442] = 4,
		},
		[556] = {--"永茂林地" The Everbloom 
			 [164294] = 4,
			 [168187] = 4,
			 [169376] = 5,
			 [169179] = 4,
		},
		[536] = {--"恐轨车站" Grimrail Depot 
			 [161089] = 4,
			 [160681] = 4,
			 [162058] = 4,
			 [162066] = 4,
			 [176147] = 4,
			 [176033] = 4,			 
		},
		[476] = {--"通天峰" Skyreach 
			 [154149] = 4,
			 [153794] = 4,
			 [153795] = 4,
			 [154043] = 4,
			 [153757] = 4,
			 [152982] = 4,
		},
		[547] = {--"奥金顿" Auchindoun 
			 [153006] = 4,
			 [153477] = 4,
			 [154018] = 4,
			 [153396] = 5,
			 [156921] = 5,
			 [156842] = 4,
			 [156964] = 4,
		},
		[558] = {--"钢铁码头" Iron Docks 
			 [163390] = 4,
			 [162418] = 5,
			 [173307] = 5,
			 [172771] = 4,
			 [164837] = 5,
			 [164504] = 5,
			 [173105] = 4,
			 [173113] = 5,
			 [173149] = 5,
			 [163740] = 4,
			 [163276] = 5,
			 [173324] = 5,
		},
		[385] = {--"血槌炉渣矿井" Bloodmaul Slag Mines 
			 [149997] = 4,
			 [149975] = 5,
			 [150032] = 5,
			 [149941] = 4,
			 [150023] = 4,
			 [150745] = 4,
			 [152089] = 4,
			 [151415] = 4,
			 [151638] = 4,
			 [152235] = 4,
			 [151685] = 4,
			 [151446] = 5,
			 [151697] = 4,
			 [150807] = 4,
			 [151720] = 4,
			 [153227] = 4,
			 [164616] = 4,
			 [163802] = 5,
			 [153679] = 4,
		},
		[477] = {--"悬槌堡"
			-- Trash
			 [175601] = 5, -- Trash TAINTED CLAWS
			 [175599] = 4, -- Trash DEVOUR
			 [172069] = 5, -- Trash RADIATING POISON
			 [172066] = 4, -- Trash RADIATING POISON
		 	 [166779] = 5, -- Trash STAGGERING BLOW
			 [56037] = 4, -- Trash RUNE OF DESTRUCTION
			 [175654] = 5, -- Trash RUNE OF DISINTEGRATION
			 [166185] = 5, -- Trash RENDING SLASH
			 [166175] = 5, -- Trash EARTHDEVASTATING SLAM
			 [174404] = 5, -- Trash FROZEN CORE
			 [173763] = 5, -- Trash WILD FLAMES
			 [174500] = 5, -- Trash RENDING THROW
			 [174939] = 4, -- Trash Time Stop
			 [172115] = 4, -- Trash Earthen Thrust
			 [166200] = 4, -- Trash ARCANEVOLATILITY
			 [174473] = 5, -- Trash Corrupted Blood
			-- Kargath Bladefist
			 [159113] = 5,
			 [159178] = 6,
			 [159213] = 7, --MONSTERS BRAWL
			 [158986] = 4, --BERSERKER RUSH
			 [159410] = 5, --MAULING BREW
			 [160521] = 6, --VILE BREATH
			 [159386] = 5, --IRON BOMB
			 [159188] = 5, --GRAPPLE
			 [162497] = 4, --ON THE HUNT
			 [159202] = 5, --FLAME JET
			-- The Butcher
			 [156152] = 5,
			 [156143] = 4,
			 [156151] = 6,	
			 [163046] = 4,		 
			-- Tectus
			 [162346] = 5, --CRYSTALLINE BARRAGE
			 [162892] = 5, --PETRIFICATION
			 [162475] = 5, --Tectonic Upheaval
			-- Brackenspore
			 [163242] = 5, --INFESTING SPORES
			 [163590] = 5, --CREEPING MOSS
			 [163241] = 5, --ROT
			 [159220] = 6, --NECROTIC BREATH
			 [160179] = 6, --MIND FUNGUS
			 [159972] = 6, --FLESHEATER
			-- Twin Ogron
			 [158026] = 6, --ENFEEBLING ROAR
			 [158241] = 5, --BLAZE
			 [155569] = 5, --INJURED
			 [167200] = 5, --ARCANE WOUND
			 [159709] = 6, --WEAKENED DEFENSES 159709 167179
			 [163374] = 4, --ARCANE VOLATILITY
			 [158200] = 4, --QUAKE
			-- Ko'ragh
			 [161242] = 4, --CAUSTIC ENERGY
			 [161358] = 4, --SUPPRESSION FIELD
			 [162184] = 6, --EXPEL MAGIC SHADOW
			 [162186] = 6, --EXPEL MAGIC ARCANE
			 [161411] = 6, --EXPEL MAGIC FROST
			 [163472] = 4, --DOMINATING POWER
			 [162185] = 7, --EXPEL MAGIC FEL
			-- Imperator Mar'gok
			 [156238] = 4, --BRANDED  156238 163990 163989 163988
			 [156467] = 5, --DESTRUCTIVE RESONANCE  156467 164075 164076 164077
			 [158605] = 4, --MARK OF CHAOS  158605 164176 164178 164191
			 [164004] = 4, --BRANDED DISPLACEMENT
			 [164075] = 4, --DESTRUCTIVE RESONANCE DISPLACEMENT
			 [164176] = 4, --MARK OF CHAOS DISPLACEMENT
			 [164005] = 4, --BRANDED FORTIFICATION
			 [164076] = 4, --DESTRUCTIVE RESONANCE FORTIFICATION
			 [164178] = 4, --MARK OF CHAOS FORTIFICATION
			 [164006] = 4, --BRANDED REPLICATION
			 [164077] = 4, --DESTRUCTIVE RESONANCE REPLICATION
			 [164191] = 4, --MARK OF CHAOS REPLICATION
			 [157349] = 5, --FORCE NOVA  157349 164232 164235 164240
			 [157763] = 4, --FIXATE
			 [158553] = 6, --CRUSH ARMOR
			 [165102] = 7, --Infinite Darkness
			 [157801] = 7, --Slow
		},		
		[457] = {--"黑石铸造厂"
			-- Blackrock Foundry
			-- Trash
			 [175752] = 5,
			 [175765] = 6,
			 [175624] = 7,
			 [175643] = 6,
			 [175603] = 6,
			 [175668] = 5,
			 [175987] = 5,
			 [159686] = 6,
			 [159632] = 7,
			 [159520] = 4,
			 [159939] = 5,
			 [160260] = 6,
			 [160109] = 4,
			 [162516] = 6,
			 [162508] = 4,
			 [162748] = 4,
			 [162757] = 4,
			 [162663] = 6,
			 [162672] = 6,
			 [188189] = 8,
			 [163126] = 8,
			 [177855] = 6,
			 [177891] = 4,
			 [174773] = 8,
			 [156345] = 8,
			 [171537] = 6,
			 [175577] = 6,
			 [175583] = 7,
			 [174704] = 4,
   			 [163714] = 4,
			-- Oregorger
			 [156324] = 4,
			 [173471] = 5,
			 [156297] = 6,
			 [156374] = 2,
			 [155900] = 2,
			 [156203] = 5,
			-- Hans'gar and Franzok 
			 [157853] = 2,
			 [156938] = 6,
			 [157139] = 6,
			 [161570] = 5,
			 [155818] = 5,
			-- Beastlord Darmac 
			 [155365] = 5,
			 [155399] = 4,
			 [154960] = 6,
			 [155061] = 4,
			 [154989] = 5,
			 [154981] = 6,
			 [155030] = 4,
			 [155236] = 4,
			 [155499] = 5,
			 [155657] = 6,
			 [159044] = 2,
			 [162276] = 1,
			-- Gruul
			 [155326] = 5,
			 [155080] = 3,
			 [162322] = 2,
			 [155078] = 4,
			 [173192] = 6,
			 [155323] = 5,
			 [155330] = 5,
			 [155506] = 5,
			 [165298] = 4,
			-- Flamebender Ka'graz 
			 [155277] = 5,
			 [163284] = 4,
			 [154932] = 6,
			 [155314] = 3,
			 [154952] = 5,
			 [155074] = 3,
			 [155049] = 4,
			-- Operator Thogar
			 [155921] = 3,
			 [165195] = 6,
			 [164380] = 5,
			 [155701] = 2,
			 [156310] = 4,
			 [159481] = 6,
			-- The Blast Furnace
			 [155240] = 3,
			 [155242] = 4,
			 [155225] = 5,
			 [155192] = 5,
			 [156934] = 6,
			 [158246] = 1,
			 [176121] = 4,
			 [155196] = 4,
			 [155743] = 6,
			 [175104] = 6,
			-- Kromog
			 [157060] = 4,
			 [157059] = 2,
			 [156766] = 4,
			 [161839] = 3,
			 [156844] = 6,
			-- The Iron Maidens
			 [164271] = 6,
			 [156631] = 4,
			 [158315] = 5,
			 [170395] = 2,
			 [159724] = 6,
			 [170405] = 2,
			 [158010] = 5,
			 [158692] = 1,
			 [158702] = 5,
			 [158686] = 3,
			 [158683] = 6,
			 [156214] = 5,
			 [158601] = 3,
			 [160436] = 1,
			-- Blackhand
			 [156096] = 6,
			 [156743] = 4,
			 [156047] = 2,
			 [156401] = 4,
			 [156404] = 3,
			 [158054] = 5,
			 [157354] = 2,
			 [156888] = 1,
			 [157000] = 5,
			 [156999] = 5,
			 [156653] = 6,
			 [162490] = 5,
			 [156604] = 3,
			 [156772] = 3,
			 [162498] = 6,
		},
		[669] = {--"地狱火堡垒"
			-- Hellfire Citadel
			-- Trash
			 [185806] = 5,
			 [187459] = 4,
			 [190735] = 6,
			 [188087] = 6,
			 [188216] = 5,
			 [188148] = 1,
			 [188189] = 4,
			 [187122] = 5,
			 [188482] = 3,
			 [188484] = 1,
			 [188541] = 1,
			 [188541] = 6,
			 [187099] = 5,
			 [187110] = 6,
			 [188474] = 6,
			 [188282] = 1,
			 [188287] = 2,
			 [188283] = 2,
			 [188104] = 6,
			 [188476] = 4,
			 [188448] = 2,
			 [188510] = 5,
			 [182644] = 6,
			 [184587] = 5,
			 [184300] = 2,
			 [184102] = 2,
			 [186046] = 5,
			 [186197] = 5,
			 [186384] = 2,
			 [184388] = 2,
			 [190043] = 2,
			 [190044] = 6,
			 [190012] = 1,
			 [189556] = 4,
			 [189551] = 5,
			 [189554] = 6,
			 [189539] = 1,
			 [189596] = 3,
			 [189564] = 5,
			 [189560] = 2,
			 [189533] = 4,
			 [189532] = 5,
			 [189531] = 2,
			 [184734] = 5,
			 [181962] = 1,
			 [184725] = 4,
			 [184730] = 3,
			 [184721] = 1,
			 [184621] = 1,
			 [189470] = 3,
			 [189488] = 1,
			 [189504] = 1,
			 [189512] = 4,
			 [189538] = 1,
			 [189550] = 5,
			 [189544] = 1,

			-- Hellfire Assault
			 [184369] = 6,
			 [184243] = 4,
			 [184238] = 1,
			 [180022] = 2,
			 [185157] = 6,
			 [180079] = 6,

			-- Iron Reaver
			 [182280] = 6,
			 [185242] = 5,
			 [182003] = 1,
			 [182074] = 3,
			 [182001] = 4,
			 [185978] = 2,

			-- Kormrok
			 [181306] = 6,
			 [181321] = 1,
			 [188081] = 2,
			 [181345] = 5,
			 [186559] = 6,
			 [185519] = 2,
			 [181082] = 6,
			 [180270] = 2,
			 [186560] = 6,
			 [185521] = 2,

			-- Hellfire High Council
			 [184450] = 5,
			 [184652] = 6,
			 [184847] = 4,
			 [184358] = 5,
			 [184357] = 1,
			 [184355] = 4,

			-- Kilrogg Deadeye
			 [188929] = 6,
			 [188852] = 5,
			 [182159] = 2,
			 [180200] = 4,
			 [181488] = 3,
			 [185563] = 1,
			 [180718] = 1,
			 [187089] = 1,
			 [189612] = 3,
			 [180575] = 5,
			 [180033] = 3,
			 [184067] = 5,

			-- Gorefiend
			 [179864] = 5,
			 [181295] = 3,
			 [179867] = 2,
			 [179978] = 6,
			 [179995] = 5,
			 [179909] = 6,
			 [182601] = 5,
			 [185189] = 5,
			 [180148] = 6,
			 [180093] = 1,
			 [186770] = 5,

			-- Shadow-Lord Iskar
			 [179202] = 5,
			 [185239] = 6,
			 [181957] = 5,
			 [182325] = 2,
			 [182200] = 3,
			 [185747] = 3,
			 [182600] = 2,
			 [179219] = 4,
			 [181753] = 7,
			 [187990] = 4,
			 [187344] = 1,
			 [185510] = 2,

			-- Socrethar the Eternal
			 [182038] = 3,
			 [189627] = 5,
			 [189540] = 2,
			 [182218] = 5,
			 [180415] = 1,
			 [182769] = 6,
			 [182900] = 4,
			 [184124] = 3,
			 [184239] = 4,
			 [190922] = 2,

			-- Fel Lord Zakuun
			 [181508] = 6,
			 [179428] = 5,
			 [182008] = 2,
			 [189260] = 3,
			 [179407] = 1,
			 [189030] = 6,
			 [181653] = 5,
			 [188998] = 2,

			-- Xhul'horac
			 [186134] = 2,
			 [186135] = 2,
			 [186407] = 7,
			 [186333] = 7,
			 [185656] = 1,
			 [186500] = 6,
			 [186448] = 4,
			 [188208] = 3,
			 [186547] = 5,
			 [186785] = 4,
			 [186073] = 3,
			 [186063] = 3,

			-- Tyrant Velhari
			 [180166] = 5,
			 [180128] = 6,
			 [180526] = 6,
			 [180000] = 4,
			 [181683] = 1,
			 [179987] = 1,
			 [179993] = 1,
			 [180604] = 3,

			-- Mannoroth
			 [181099] = 6,
			 [181275] = 3,
			 [181119] = 4,
			 [182171] = 2,
			 [181359] = 5,
			 [184252] = 3,
			 [181597] = 4,
			 [181841] = 6,
			 [182113] = 1,
			 [182088] = 6,
			 [182006] = 4,
			 [182031] = 3,
			 [186362] = 6,
			 [190482] = 2,

			-- Archimonde
			 [183634] = 6,
			 [183828] = 4,
			 [183963] = 1,
			 [182879] = 6,
			 [182878] = 2,
			 [183864] = 3,
			 [184964] = 6,
			 [186123] = 5,
			 [185014] = 5,
			 [186961] = 6,
			 [189891] = 3,
			 [187047] = 2,
			 [190341] = 2,
			 [187255] = 3,
			 [189895] = 5,
			 [190400] = 3,
			 [187050] = 6,
			 [190706] = 2,
		},
		[721] = {--"英灵殿"
			-- Halls of Valor
			 [199050] = 4,
			 [198944] = 4,
			 [215429] = 4,
			 [197556] = 4,
			 [196497] = 4,
			 [199818] = 4,
			 [193686] = 4,
			 [196838] = 6,
			 [193092] = 4,
			 [199652] = 4,
			 [192048] = 4,
			 [199674] = 4,
		},
		[727] = {--"噬魂之喉"
			-- Maw of Souls
			 [198944] = 4,
			 [199185] = 4,
			 [194674] = 4,
			 [195279] = 4,
			 [198944] = 4,
			 [115804] = 4,
			 [194049] = 4,
			 [194327] = 4,
			 [195293] = 4,
			 [185539] = 4,
			 [197262] = 6,
			 [198405] = 5,
			 [194102] = 4,
			 [200208] = 4,
			 [201566] = 3,
			 [215484] = 3,
		},
		[777] = {--"紫罗兰堡"
			-- Violet Hold
			 [205513] = 4,
			 [202779] = 4,
			 [202217] = 4,
			 [202300] = 4,
			 [224453] = 4,
			 [202306] = 4,
			 [205096] = 4,
			 [204895] = 4,
			 [201380] = 4,
			 [224602] = 4,
			 [204962] = 4,
			 [210879] = 4,
			 [201159] = 4,
			 [204608] = 4,
			 [202480] = 5,
			 [201491] = 4,
			 [202266] = 4,
		},
		[716] = {--"艾萨拉之眼"
			-- Eye of Azshara
			 [195105] = 4,
			 [195094] = 4,
			 [193636] = 4,
			 [196111] = 4,
			 [195561] = 5,--盲目啄击
			 [191855] = 4,
			 [195473] = 4,
			 [196064] = 4,
			 [195944] = 4,
			 [196515] = 4,
			 [197144] = 4,
			 [195473] = 4,
			 [200037] = 4,
			 [197105] = 4,
			 [192053] = 4,
			 [196058] = 4,
			 [191977] = 4,
			 [192131] = 4,
			 [193018] = 4,
			 [200100] = 4,
			 [200626] = 4,
			 [193597] = 4,
			 [193698] = 4,
			 [192706] = 4,

			 [215721] = 4,
			 [215712] = 4,
			 [196060] = 4,
		},
		[740] = {--"黑鸦堡垒"
			-- Black Rook Hold
			 [200084] = 4,
			 [194966] = 4,
			 [225909] = 4,
			 [200261] = 4,
			 [221132] = 4,
			 [197429] = 4,
			 [198245] = 4,
			 [198635] = 4,
			 [214002] = 4,
			 [197546] = 4,
			 [221680] = 4,
			 [224188] = 4,
			 [221838] = 4,
			 [198446] = 4,
			 [199097] = 6,
			 [201733] = 5,
			 [198446] = 3,
		},
		[800] = {--"群星庭院"
			-- Court of Stars
			 [211464] = 4,
			 [269024] = 4,
			 [211473] = 4,
			 [211391] = 4,

			 [209027] = 4,
			 [207981] = 4,
			 [208165] = 4,
			 [216006] = 4,
			 [214690] = 4,
			 [214692] = 4,
		},
		[767] = {--"耐萨里奥的巢穴"
			-- Neltharion's Lair
			 [202231] = 4,
			 [200154] = 4,

			 [193941] = 4,
			 [215898] = 4,
			 [226296] = 4,
			 [199705] = 4,
			 [192800] = 3,
			 [188494] = 3,

			 [199108] = 4,
			 [217851] = 4,
		},
		[726] = {--"魔法回廊"
			-- The Arcway
			 [226296] = 4,
			 [210645] = 4,
			 [211000] = 4,
			 [211007] = 4,
			 [211064] = 3,
			 [194006] = 3,
			 [193938] = 4,
			 [202156] = 4,
			 [211745] = 3,
			 [211543] = 4,
			 [210750] = 3,
			 [226269] = 3,
		},
		[762] = {--"黑心林地"
			-- Darkheart Thicket
			 [198477] = 4,
			 [200642] = 4,
			 [250980] = 4,
			 [198408] = 4,
			 [198904] = 4,
			 [204667] = 4,
			 [191326] = 4,
			 [200289] = 4,
			 [200243] = 4,
			 [220855] = 4,
			 [204968] = 4,
			 [200631] = 4,
			 [200684] = 4,
			 [200182] = 3,
			 [196376] = 4,
			 [201365] = 4,
			 [225568] = 4,
			 [200580] = 4,
			 [204246] = 4,
			 [201365] = 4,
			 [225484] = 5,
			 [200620] = 5,
			 [204611] = 5,
			 [200329] = 3,
			 [200238] = 3,			 
		},
		[707] = {--"守望者地窟"
			-- Vault of the Wardens
			 [194588] = 4,
			 [193607] = 4,
			 [191743] = 4,
			 [210202] = 4,
			 [206603] = 4,
			 [196242] = 4,
			 [202608] = 4,
			 [193969] = 4,
			 [193956] = 7,
			 [193997] = 7,
			 [202615] = 7,
			 [202658] = 5,
		},
		[1115] = {--"重返卡拉赞"
			-- Return to Karazhan
			 [227405] = 4,
			 [227480] = 4,
			 [227568] = 4,
			 [227325] = 4,
			 [227780] = 4,
			 [228200] = 4,
			 [228013] = 4,
			 [228215] = 4,
			 [227985] = 7,
			 [232135] = 4,
			 [227800] = 4,
			 [227508] = 7,
			 [227848] = 5,
			 [227823] = 6,
			 [227404] = 6,
			 [227493] = 4,
			 [227742] = 7,
			 [227909] = 4,
			 [227832] = 5,
			 [227545] = 6,
			 [227473] = 4,
			 [227465] = 6,
			 [227644] = 4,
			 [228958] = 4,
			 [227592] = 4,
			 [228261] = 5,
			 [227806] = 6,
			 [227502] = 4,
			 [227524] = 5,
			 [229159] = 4,
			 [229083] = 4,
			 [229161] = 5,
			 [230002] = 5,

			 [228796] = 8,
			 [229307] = 4,
			 [228829] = 5,
			 [228833] = 6,
			 [228834] = 3,
			 [228835] = 7,
		},
		[768] = {--"翡翠梦魇"
			-- The Emerald Nightmare
			 [225263] = 5,
			 [222771] = 5,
			 [223912] = 5,
			 [225073] = 5,
			 [223572] = 5,
			 [223946] = 5,
			 [223914] = 4,
			 [223596] = 4,

			-- Nythendra
			 [204504] = 2,
			 [204463] = 4,
			 [203045] = 5,
			 [203096] = 6,
			 [204463] = 6,
			 [203646] = 5,
			 [202978] = 3,
			 [205043] = 4,

			-- Il'gynoth, Heart of Corruption
			 [212886] = 4,
			 [215845] = 2,
			 [210099] = 7,
			 [209469] = 8,
			 [209471] = 2,
			 [210984] = 4,
			 [208697] = 3,
			 [208929] = 5,
			 [215128] = 5,

			-- Elerethe Renferal
			 [215307] = 6,
			 [215460] = 5,
			 [213124] = 4,
			 [210850] = 3,
			 [215582] = 3,
			 [218519] = 1,
			 [210228] = 2,

			-- Ursoc
			 [197943] = 5,
			 [204859] = 3,
			 [198006] = 7,
			 [198108] = 1,
			 [197980] = 2,
			 [205611] = 4,

			-- Dragons of Nightmare
			 [203110] = 3,
			 [207681] = 4,
			 [204731] = 1,
			 [203770] = 6,
			 [203787] = 7,
			 [203086] = 2,
			 [204044] = 4,
			 [203121] = 2,
			 [203124] = 2,
			 [203125] = 2,
			 [203102] = 2,
			 [205341] = 6,
			 [204078] = 2,
			 [214543] = 1,

			-- Cenarius
			 [212681] = 3,
			 [210279] = 1,
			 [210315] = 8,
			 [213162] = 5,
			 [226821] = 4,
			 [211507] = 6,
			 [211471] = 5,
			 [216516] = 2,
			 [211989] = 5,
			 [211990] = 2,
			 [214529] = 5,

			-- Xavius
			 [206005] = 1,
			 [206109] = 2,
			 [208431] = 3,
			 [207409] = 6,
			 [206651] = 8,
			 [211802] = 7,
			 [205771] = 7,
			 [209158] = 8,
			 [205612] = 2,
			 [210451] = 6,
			 [208385] = 4,
			 [211634] = 4,
		},
		[1088] = {--"暗夜要塞"
			-- The Nighthold

			-- Skorpyron
			 [204766] = 5,
			 [214657] = 7,
			 [204744] = 4,
			 [211659] = 6,
			 [204471] = 5,

			-- Chronomatic Anomaly
			 [206607] = 7,
			 [219966] = 4,
			 [219965] = 4,
			 [219964] = 4,
			 [212099] = 6,
			 [206617] = 7,
			 [205707] = 5,		 

			-- Trilliax
			 [206641] = 4,
			 [214573] = 4,
			 [206488] = 3,
			 [206798] = 3,
			 [211615] = 8,
			 [214583] = 7,
			 [208915] = 6,
			 [207631] = 5,
			 [206645] = 5,
			 
			-- Spellblade Aluriel
			 [212492] = 7,
			 [212587] = 6,
			 [212647] = 4,
			 [212736] = 3,
			 [213085] = 3,
			 [213621] = 7,
			 [213166] = 8,
			 [213504] = 3,
			 [213278] = 3,
			 [213083] = 4,

			-- Tichondrius
			 [206480] = 6,
			 [206311] = 3,
			 [212794] = 8, 
			 [208230] = 7,
			 [215988] = 4,
			 [216024] = 7,
			 [216027] = 3,
			 [216685] = 5,
			 [216040] = 7,

			-- Krosus
			 [206677] = 5,
			 [205344] = 6,

			-- High Botanist Tel'arn
			 [218503] = 7,
			 [218342] = 6,
			 [219235] = 4,
			 [218304] = 5,
			 [218780] = 3,
			 [218809] = 5,	 

			-- Star Augur Etraeus
			 [206464] = 6,
			 [214335] = 6,
			 [206936] = 4,
			 [206585] = 7,
			 [206603] = 5,
			 [206589] = 6,
			 [206388] = 5,
			 [206398] = 4,
			 [205649] = 6,
			 [206965] = 6,
			 [207143] = 5,
			 [207831] = 8,
			 [205445] = 8,
			 [205429] = 8,
			 [216345] = 8,
			 [216344] = 8,
			 [217046] = 7,

			-- Grand Magistrix Elisande
			 [209433] = 4,
			 [208659] = 4,
			 [211261] = 5, --透心折磨
			 [209598] = 7, --聚合爆破
			 [209244] = 6,
			 [209615] = 5,
			 [209973] = 5,
			 [211887] = 4,
			 [208944] = 6,			 

			-- Gul'dan
			 [210339] = 4,
			 [212568] = 3,
			 [206896] = 5,
			 [209011] = 6,
			 [206384] = 6,
			 [209454] = 7,
			 [221728] = 7,
			 [209191] = 3,
			 [221781] = 3,
			 [206985] = 4,
			 [206515] = 3,
			 [208802] = 5,
			 [208536] = 3,
			 [221891] = 4,
			 [221606] = 7,
			 [221603] = 7, 
		},
		[861] = {--"勇气试练"
			-- Trial of Valor
			
			--Trash
			 [228883] = 3,
			 [228884] = 3,
			 [228305] = 5,
			 [228875] = 4,
			 [232450] = 5, 
            
            		-- Guarm
			 [228228] = 4, 
			 [228248] = 5, 
			 [228253] = 6, 
			 [227539] = 3, 
			 [227566] = 3, 
			 [227570] = 3,
			 [228744] = 7, 
			 [228818] = 7, 
			 [228810] = 7,
            
            		-- Helya
			 [229119] = 3,
			 [227998] = 3,
			 [228058] = 4, 
			 [228054] = 5, 
			 [193367] = 6, 
			 [227982] = 7, 
			 [232488] = 7,
			 [228519] = 8, 
			 [202476] = 9, 
			 [232450] = 10, 
            
           		-- Odyn
			 [228932] = 7,
			 [227491] = 3, --烙印红
			 [227490] = 3, --烙印紫
			 [227500] = 3, --烙印绿
			 [227498] = 3, --烙印黄
			 [227499] = 3, --烙印蓝
			 [229580] = 3, --p1p2烙印红
			 [229579] = 3, --p1p2烙印紫
			 [229583] = 3, --p1p2烙印绿
			 [229581] = 3, --p1p2烙印黄
			 [229582] = 3, --p1p2烙印蓝
			 [231342] = 3, --p3烙印红
			 [231311] = 3, --p3烙印紫
			 [231346] = 3, --p3烙印绿
			 [231344] = 3, --p3烙印黄
			 [231345] = 3, --p3烙印蓝
			 [227807] = 5,
			 [227475] = 6,
			 [228029] = 7, 
			 [227781] = 8,
			 [228007] = 7,
		},
		[786] = {--"暗夜要塞"
			-- The Nighthold
             
			--Trash
			 [225105] = 1, --
			 [221344] = 1, --
			 [224994] = 2, --
			 [231174] = 1, --
			 [221344] = 1, --
			 [224982] = 3, --
			 [230993] = 3, --
			-- Skorpyron
			 [204766] = 5,
			 [214657] = 5,
			 [214662] = 5,
			 [211659] = 5,
			 [214718] = 4,
			 [204471] = 5,

			-- Chronomatic Anomaly
			 [206615] = 6,
			 [206607] = 5,
			 [206609] = 5,
			 [212099] = 5,

			-- Trilliax
			 [206641] = 4,
			 [206482] = 5,
			 [206788] = 5,

			-- Spellblade Aluriel
			 [213166] = 5,
			 [212492] = 5,
			 [212587] = 5,
			 [213083] = 5,

			-- Tichondrius
			 [206466] = 6,
			 [206480] = 5,
			 [213238] = 5,
			 [212795] = 5,
			 [208230] = 5,
			 [216024] = 5,
			 [216040] = 5,

			-- Krosus
			 [205344] = 4,
			 [206677] = 4,
			 [208203] = 5,

			-- High Botanist Tel'arn
			 [218342] = 5,
			 [218502] = 5,
			 [219049] = 5,
			 [218809] = 6,
			 [218424] = 5,

			-- Star Augur Etraeus
			 [214167] = 5,
			 [205984] = 5,
			 [214335] = 5,
			 [206585] = 5,
			 [206936] = 5,
			 [206388] = 5,
			 [205649] = 5,
			 [206965] = 5,
			 [206398] = 6,
			 [207143] = 5,

			-- Grand Magistrix Elisande
             [211885] = 5,
			 [209973] = 5,			
			 [209615] = 5,
			 [209244] = 5,
			 [209433] = 5,
			 [211261] = 5, --透心折磨
			 [209598] = 5, --聚合爆破

			-- Gul'dan
             [221326] = 6,		    
			 [206506] = 6,
			 [206458] = 6,
			 [206847] = 6,
			 [221603] = 6,
			 [221728] = 6,
			 [209518] = 5,
			 [209011] = 5,
			 [206366] = 5,
			 [212728] = 5,
			 [209454] = 5,
			 [229915] = 5,
			 [212568] = 5,
			 [206883] = 5,
			 [206222] = 5,
			 [206221] = 5,
			 [208672] = 5,
			 [208903] = 5,
			 [208802] = 5,
	    },
		[875] = {--"萨格拉斯之墓"
			-- Tomb of Sargeras

			-- 格罗斯
			 [234264] = 5,  --熔化护甲
			 [231363] = 7,  --燃烧护甲
			 [233272] = 4,  --碎裂星辰
			 [230348] = 6,  --邪能之池
			
			-- 恶魔审判庭
			 [236283] = 1,
			 [248741] = 6,
			 [233983] = 7,
			 [233430] = 7,
			 [233901] = 4,
			 [233431] = 8,
			 [248713] = 3,		 

			-- 哈亚坦
			 [234016] = 6,  --强制突袭/小怪盯人
			 [241573] = 4,
			 [231998] = 5,
			 [231770] = 3,
			 [231729] = 6,
			 [231768] = 5,
			 [241600] = 7,
			 [207631] = 5,
			 [206645] = 5,
			 
			-- 主母萨丝琳
			 [230362] = 7,
			 [230384] = 6,
			 [230201] = 5,
			 [232732] = 3,
			 [230276] = 3,
			 [230959] = 5,
			 [230139] = 8,
			 [232754] = 3,
			 [232913] = 4,
			 
			-- 月之姐妹
			 [233263] = 5,
			 [236596] = 6,
			 [236712] = 8, 
			 [239264] = 7,
			 [236519] = 4,
			 [236550] = 7,
			 [237561] = 6,
			 [236305] = 8,
			 [216040] = 7,

			-- 绝望的聚合体
			 [236361] = 6,
			 [236340] = 6,
			 [236241] = 5,
			 [236459] = 7,  --灵魂束缚
			 [235907] = 5,
			 [238018] = 7,
			 [236135] = 8,
			 [242796] = 7,

			-- 戒卫侍女
			 [235213] = 4,
			 [235240] = 4,
			 [243276] = 7,
			 [239408] = 5,
			 [238028] = 5,
			 [248812] = 2,
             [248801] = 3,
             [241729] = 3,			 

			-- 堕落的化身
			 [234059] = 6,
			 [239212] = 6,
			 [236494] = 5,
			 [239739] = 7,
			 [242017] = 4,
			 [240249] = 4,
			 [240746] = 5,
			 [206398] = 4,
			 [240728] = 5,
			 
			-- 基尔加丹
			 [234310] = 4,
			 [245509] = 4,
			 [240916] = 5,
             [241822] = 6,
             [241712] = 3,
             [236710] = 5,
             [236378] = 9,
             [239216] = 6,
             [240908] = 7,
             [240262] = 4,	
             [243624] = 8,		 
		},
		[946] = {--"安托鲁斯·燃烧王座"
			-- Antorus, the Burning Throne

			-- 加洛斯
			 [246220] = 5,  --邪能轰炸
			 [244590] = 7,  --炽熔邪能
			 [247159] = 4,  --引力毁灭
			 [246919] = 6,  --错乱屠戮
			 [246920] = 6,  --错乱屠戮
			
			-- 双狗
			 [248818] = 7,
			 [248815] = 6,
			 [244679] = 8,
			 [254429] = 7, 

			-- 议会
			 [253037] = 6,  --
			 [253290] = 7,
			 [244172] = 8,
			 [244388] = 9,
			 [253306] = 9,
			 [244737] = 8,
			 [244748] = 8,
			 			 
			-- 传送门
			 [246208] = 7,
			 [244949] = 6,
			 [246316] = 5,
			 [244849] = 4,
			 [244613] = 4,
						 
			-- 艾欧娜
			 [248795] = 5,
			 [249016] = 6,
			 [249017] = 8, 
			 [249014] = 7,
			 [250693] = 4,
			 [250691] = 7,
			 [250140] = 6,
			 [250693] = 8,
			
			-- 猎魂者
			 [247367] = 6,
			 [255029] = 7,
			 [247565] = 5,
			 [250224] = 7,  --
			 [247687] = 5,
			 [247716] = 7,
			 [247641] = 8,
			 [254183] = 7,
			 [250006] = 7,
			
			-- 金加洛斯
			 [246840] = 4,
			 [246698] = 6,
			 [258070] = 7,
			 [246637] = 5,
			
			-- 瓦里玛萨斯
			 [243961] = 6,
			 [244094] = 8,
			 [244042] = 7,
			 [244005] = 7,
			 [248732] = 6,
						 
			-- 破坏魔
			 [245586] = 5,
			 [256356] = 5,
			 [253020] = 5,
             [241822] = 6,
             [253520] = 3,
             [253697] = 5,
             [245671] = 9,
             [245921] = 6,
             [250097] = 7,
             [246763] = 4,	
             [250757] = 8,	

            -- 阿格拉玛
			 [244291] = 5,
			 [245990] = 5,
			 [245994] = 5,
             [245916] = 6,
             [246014] = 3,
             [244912] = 5,
             [244736] = 9,
             [247079] = 6,
             [254452] = 7,
            
            -- 阿古斯
			 [248499] = 5,
			 [248167] = 5,
			 [248396] = 7,
             [258646] = 6,
             [258647] = 5,
             [253903] = 5,
             [253901] = 5,
             [255199] = 6,
             [257930] = 6,
			 [255200] = 7,
             [250669] = 4,	
             [251570] = 4,	
             [251815] = 7,
             [257869] = 6,
			 [257966] = 8,	
             [258838] = 7,
			 [257911] = 7,
			 [258834] = 7,
		},
		[1031] = {--"奥迪尔"
			-- Uldir
             
            -- 老一
			 [271222] = 7, 
			 [270296] = 6, 
			 [278889] = 5, 
			 [278888] = 4, 
			 [271225] = 7, 
			 [271224] = 6, 
			 [275189] = 5, 
			 [275205] = 5, 
            -- 老二
			 [267787] = 5, 
			 [268198] = 7, 
            -- 老三
			 [262313] = 5, 
			 [262314] = 5, 
            -- 老四
			 [265662] = 5, 
			 [265264] = 5, 
			 [265646] = 5, 
			 [265360] = 5, 
			 [270620] = 5, 
			 [270589] = 5, 
            -- 老五
			 [265129] = 5, 
			 [265127] = 5, 
			 [265206] = 5, 
			 [266948] = 5, 
			 [265212] = 5, 
			 [265174] = 5, 
			 [267160] = 5, 
			 [267161] = 5, 
			 [274990] = 5, 
			 [265178] = 5, 
            -- 老六			 
			 [274195] = 5, 
			 [273365] = 5, 
			 [274271] = 5, 
			 [274358] = 5, 
			 [272018] = 5, 
			 [273434] = 5, 
			 [276020] = 5, 
			 [269936] = 5, 
			 [278890] = 5, 
            -- 老七
			 [272336] = 5, 
			 [272536] = 5, 
			 [273282] = 5, 
			 [272146] = 5, 
			 [272407] = 5, 
			 [274019] = 5, 
            -- 老八
			 [270287] = 5, 
			 [272506] = 5, 
			 [263372] = 5, 
			 [263436] = 5, 
			 [276834] = 5, 
			 [263321] = 5, 
			 [263372] = 5, 
			 [263334] = 5, 
			 [267700] = 5, 
			 [267409] = 5, 
			 [267659] = 5, 
			 [263227] = 5, 
			 [263235] = 7, 	 
		},
	},
	second = {
		[65] = {--"潮汐王座"
			[83608] =  1, --厄祖玛特的枯萎
		},
		[68] = {--"旋云之巅"
			[88286] =  1, --逆风
			[88282] =  1, --顺风
		},			
		[187] = {-- "Dragon Soul"
			-- Hagara the Stormbinder
			[110317] = 1, --水壕
		},
		[537] = {--"影月墓地" 
			--Shadowmoon Burial Grounds 
			[162652] = 1, --纯净之月
		},
		[721] ={-- "英灵殿"
			-- Halls of Valor
			[203963] =  1, --风暴之眼
			[193743] =  1, --阿格拉玛之盾 
        	},
		[726] = {--"魔法回廊"
			-- The Arcway
			[195362] = 1, --暗夜井能量
		},
		[861] = {--"勇气试练"
			-- Trial of Valor
			[229584] = 1, --受到保护
		},
		[786] = {--"暗夜要塞"
			-- The Nighthold
			[204284] = 1, --水晶碎片
			-- Trilliax
			[206838] = 1, --多汁盛宴
			-- Tichondrius
			[206466] = 1, --夜之精华
			-- Grand Magistrix Elisande
			[209166] = 1, --时间加速
			[209165] = 1, --减缓时间
		},
	},	
}

