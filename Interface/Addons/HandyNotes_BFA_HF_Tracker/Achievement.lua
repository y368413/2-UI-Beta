local myname, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(myname, true)

------ Icons DB -------
local planche = "Interface\\Addons\\"..myname.."\\Icons\\Planche"
local conte = "Interface\\Addons\\"..myname.."\\Icons\\Conte"
local krag = "Interface\\Addons\\"..myname.."\\Icons\\Krag"
local trashpile = "Interface\\Addons\\"..myname.."\\Icons\\Trashpile"
-- MiniMap-DeadArrow = fléche rouge
-- MiniMap-VignetteArrow = fléche grise
-- MiniMap-QuestArrow = fléche jaune
-- None = loupe
-----------------------

local merge = ns.merge

local function nameAchievement(id, i)
    local _, name, _, _, _, _, _, description = GetAchievementInfo(id)
	if i == 1 then
		return name
	elseif i == 2 then
		return description
	end
end
local function nameCriteria(id, criteria)
    local criteria = GetAchievementCriteriaInfoByID(id, criteria)
	return criteria
end

local path = function(achievement, criteria, questid, label, atlas, note, scale)
    label = label or L["Entrance "]
    atlas = atlas or "map-icon-SuramarDoor.tga"
    return {
		achievement = achievement,
        criteria = criteria,
        quest = questid,
        label = label,
        atlas = atlas,
        path = true,
		hf = true,
        scale = scale,
        note = note,
    }
end
ns.path = path

ns.map_spellids = {
    -- [862] = 0, -- Zuldazar
    -- [863] = 0, -- Nazmir
    -- [864] = 0, -- Vol'dun
    -- [895] = 0, -- Tiragarde Sound
    -- [896] = 0, -- Drustvar
    -- [942] = 0, -- Stormsong Valley
}

--[[ structure:
    [uiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            currency=[id], -- currencyid
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
            hide_before=[id], -- hide if quest not completed
			faction=[string], -- Alliance / Horde
        },
    },
]]--

merge(ns.points[862], { -- Zuldazar
	-- HF 12482 - Maléficié, mal au fessier
	[71704128] = {quest=50308, hf=true, atlasHf=trashpile, item=156963, achievement=12482, criteria=40037, requireItem={"bag", 156963}, note=nameAchievement(12482, 2),},	-- Œuf de ravasaure doré
	[66211662] = {quest=50332, hf=true, atlasHf=trashpile, achievement=12482, criteria=40038, note=nameAchievement(12482, 2),},	-- Le chasseur balèze
	[61964689] = {quest=50381, hf=true, atlasHf=trashpile, achievement=12482, criteria=40039, note=nameAchievement(12482, 2),},	-- Le chapeau ou la vie !
	[62632058] = {quest=50331, hf=true, atlasHf=trashpile, item=157794, achievement=12482, criteria=40040, requireItem={"bag", 157794}, note=nameAchievement(12482, 2),},	-- Écaille de vipère à plumes
	-- HF 13029 - Pas les doigts !
	[71252950] = {quest=nil, hf=true, atlas="Banker", npc=124034, npcLine=3, item=163564, achievement=13029, criteria=41580, note=nameAchievement(13029, 2), buy={item=163564, npc=124034,},},
	[64003900] = {quest=nil, hf=true, atlas="Food", npc=130922, npcLine=3, item=163564, achievement=13029, criteria=41580, note=nameAchievement(13029, 2), buy={item=163564, npc=124034, bag="link",}, requireItem={"bag", 163564},},
	-- HF 13036 - Nul n’est censé les ignorer
	[51692825] = {quest=nil, hf=true, atlasHf=conte, achievement=13036, criteria=41566, note= L["Next to the river"],},
	[75506760] = {quest=53536, hf=true, atlasHf=conte, achievement=13036, criteria=41567, note= L["Between the roots"],},
    [48545460] = {quest=nil, hf=true, atlasHf=conte, achievement=13036, criteria=41569, note= L["At the destroyed pillar"]},
    [49004129] = {quest=53541, hf=true, atlasHf=conte, achievement=13036, criteria=41572, note= L["Above, at the pond on the big stone"],},
    [48203980] = path(13036, 41572, 53541, L["Entrance "]..nameCriteria(13036, 41572), _, _, 1.2),
    [43757672] = {quest=53542, hf=true, atlasHf=conte, achievement=13036, criteria=41573, note= L["In the eye of the skeleton, outside"],},
    [47842884] = {quest=nil, hf=true, atlasHf=conte, achievement=13036, criteria=41576, note= L["On the wall, behind the torch"],},        
    [67281762] = {quest=53546, hf=true, atlasHf=conte, achievement=13036, criteria=41577, note= L["Above, to the right of the small staircase"],},
	[59053220] = {quest=53548, hf=true, atlasHf=conte, achievement=13036, criteria=41581, note= L["Behind the NPC in the Corner"],},
})
merge(ns.points[863], { -- Nazmir
	-- HF 12482 - Maléficié, mal au fessier
	[80904680] = {quest=50435, hf=true, atlasHf=trashpile, item=157797, achievement=12482, criteria=40041, requireItem={"bag", 157797}, note=nameAchievement(12482, 2),},	-- Perle vilécaille
	[34007510] = {quest=50437, hf=true, atlasHf=trashpile, item=157801, achievement=12482, criteria=40042, requireItem={"bag", 157801}, note=nameAchievement(12482, 2),},	-- Queue de gueule d’acier
	[68533283] = {quest=50440, hf=true, atlasHf=trashpile, item=157802, achievement=12482, criteria=40043, requireItem={"bag", 157802}, note=nameAchievement(12482, 2),},	-- Relique nazwathani
	[54007410] = {quest=50444, hf=true, atlasHf=trashpile, achievement=12482, criteria=40044, note=nameAchievement(12482, 2),},	-- Sur Loa route
	-- HF 13024 - Gravé dans la pierre en lettres de sang
	[56355736] = {hf=true, atlas="Reagents", achievement=13024, criteria=41860, note= L["Inside a building ruins near the mountain"],},
    [43354811] = {hf=true, atlas="Reagents", achievement=13024, criteria=41861, note= L["Next to broken pillar as you enter the ruins"],},
    [51278510] = {hf=true, atlas="Reagents", achievement=13024, criteria=41862, note= L["Island between Nazmir and Zuldazar zones"],},
    [42555710] = {hf=true, atlas="Reagents", achievement=13024, criteria=42116, note= L["Near Kel'vax Deathwalker rare"],},
	-- HF 13028 - Triste sot
	[69605860] = {label= L["Lost Spawn of Krag'wa 1"], quest=53417, hf=true, atlasHf=krag, achievement=13028, note= L["In an underwater cave"],},
	[65505090] = {label= L["Lost Spawn of Krag'wa 2"], quest=53418, hf=true, atlasHf=krag, achievement=13028, note= L["In an underwater cave"],},	--ok
	[56106490] = {label= L["Lost Spawn of Krag'wa 3"], quest=53419, hf=true, atlasHf=krag, achievement=13028, note= L["Between the huge roots"],},
	[52804290] = {label= L["Lost Spawn of Krag'wa 4"], quest=53420, hf=true, atlasHf=krag, achievement=13028, note= L["Sits in a ruin"],},			--ok
	[34106180] = {label= L["Lost Spawn of Krag'wa 5"], quest=53421, hf=true, atlasHf=krag, achievement=13028, note= L["In cave"],},
	[44609280] = {label= L["Lost Spawn of Krag'wa 6"], quest=53422, hf=true, atlasHf=krag, achievement=13028, note= L["In cave"],},
	[28908320] = {label= L["Lost Spawn of Krag'wa 7"], quest=53423, hf=true, atlasHf=krag, achievement=13028, note= L["In cave"],},
	[24209160] = {label= L["Lost Spawn of Krag'wa 8"], quest=53424, hf=true, atlasHf=krag, achievement=13028, note= L["Sits up between trees"],},
    [21706930] = {label= L["Lost Spawn of Krag'wa 9"], quest=53425, hf=true, atlasHf=krag, achievement=13028, note= L["Sits near the bridge behind the big tree"],},
	[25604060] = {label= L["Lost Spawn of Krag'wa 10"], quest=53426, hf=true, atlasHf=krag, achievement=13028, note= L["Sits behind a curtain of scrub"],},
	-- HF 13029 - Pas les doigts !
	[35405530] = {quest=nil, hf=true, atlas="Banker", npc=126833, npcLine=3, item=163563, achievement=13029, criteria=41575, note=nameAchievement(13029, 2), buy={item=163563, npc=126833, to=L["in cave"],},},
	[32003500] = {quest=nil, hf=true, atlas="Food", npc=143644, item=163563, achievement=13029, criteria=41575, note=nameAchievement(13029, 2), buy={item=163563, npc=126833, bag="link", to=L["in cave"],}, requireItem={"bag", 163563},},
	-- HF 13036 - Nul n’est censé les ignorer
	[39123865] = {quest=53534, hf=true, atlasHf=conte, achievement=13036, criteria=41565, note= L["At the destroyed pillar on the left"],},
    [39575467] = {quest=53537, hf=true, atlasHf=conte, achievement=13036, criteria=41568, note= L["Scroll on the altar"],},
    [58924865] = {quest=53540, hf=true, atlasHf=conte, achievement=13036, criteria=41571, note= L["At the destroyed wall"],},
    [72850760] = {quest=53547, hf=true, atlasHf=conte, achievement=13036, criteria=41579, note= L["Under water, at the bottom, at the destroyed pillar"],},
})
merge(ns.points[864], { -- Vol'dun
	-- HF 12482 - Maléficié, mal au fessier
	[47004655] = {quest=50883, hf=true, atlasHf=trashpile, item=158910, achievement=12482, criteria=40045, requireItem={"bag", 158910}, note=nameAchievement(12482, 2),},	-- Antenne ranishu chargée
	[56241526] = {quest=50890, hf=true, atlasHf=trashpile, item=158915, achievement=12482, criteria=40046, requireItem={"bag", 158915}, note=nameAchievement(12482, 2),},	-- Sabot strié poli
	[49358440] = {quest=50892, hf=true, atlasHf=trashpile, item=158916, achievement=12482, criteria=40047, requireItem={"bag", 158916}, note=nameAchievement(12482, 2),},	-- Mâchoire de rocherouge solide
	[42187208] = {quest=50901, hf=true, atlasHf=trashpile, achievement=12482, criteria=40048, note=nameAchievement(12482, 2),},	-- La surprise sauride
	-- HF 13016 - Pilleur des sables
	[56297011] = {quest=53132, hf=true, item=163321, achievement=13016, criteria=41342,},	-- Lame rouillée de Jason
	[36217838] = {quest=53133, hf=true, item=163322, achievement=13016, criteria=41343,},	-- Bouteille vide de Ian
	[53568981] = {quest=53134, hf=true, item=163323, achievement=13016, criteria=41344,},	-- Assiette ébréchée de Julie
	[37803046] = {quest=53135, hf=true, item=163324, achievement=13016, criteria=41345,},	-- Boussole cassée de Brian
	[26795291] = {quest=53136, hf=true, item=163325, achievement=13016, criteria=41346,},	-- Journal relié d’Ofer
	[29465938] = {quest=53137, hf=true, item=163326, achievement=13016, criteria=41347,},	-- Caillou préféré de Skye
	[52431439] = {quest=53138, hf=true, item=163327, achievement=13016, criteria=41348,},	-- Botte gauche de Julien
	[43217700] = {quest=53139, hf=true, item=163328, achievement=13016, criteria=41349,},	-- Flacon de Navarro
	[47067577] = {quest=53140, hf=true, item=163329, achievement=13016, criteria=41350,},	-- Gourde de Zach
	[45883073] = {quest=53141, hf=true, item=163372, achievement=13016, criteria=41351,},	-- Sac à dos de Damarcus
	[66413595] = {quest=53142, hf=true, item=163373, achievement=13016, criteria=41352,},	-- Flûte de Rachel
	[64873610] = path(13016, 41352, 53142, L["Entrance "]..nameCriteria(13016, 41352), _, _, 1.2),
	[47933673] = {quest=53143, hf=true, item=163374, achievement=13016, criteria=41353,},	-- Croc en collier de Josh
	[45229114] = {quest=53144, hf=true, item=163375, achievement=13016, criteria=41354,},	-- Portrait du commandant Martens
	[62862267] = {quest=53145, hf=true, item=163376, achievement=13016, criteria=41355,},	-- Clé ornée de Kurt
	-- HF 13018 - Chevaucheur des dunes
	[47906249] = {hf=true, atlasHf=planche, label=nameAchievement(13018, 1), achievement=13018, criteria=41360,},
	[32126908] = {hf=true, atlasHf=planche, label=nameAchievement(13018, 1), achievement=13018, criteria=41361,},
	[54902136] = {hf=true, atlasHf=planche, label=nameAchievement(13018, 1), achievement=13018, criteria=41362, note=L["On top of the slither snake"],},
	[54703160] = path(13018, 41362, _, L["Start "]..nameAchievement(13018, 1), _, _, 1.2),
	[38037097] = {hf=true, atlasHf=planche, label=nameAchievement(13018, 1), achievement=13018, criteria=41363,},
	[45786358] = {hf=true, atlasHf=planche, label=nameAchievement(13018, 1), achievement=13018, criteria=41564, note=L["Along the pyramid edge"],},
	-- HF 13029 - Pas les doigts !
	[40405540] = {quest=nil, hf=true, atlas="Banker", npc=133833, npcLine=3, item=163567, achievement=13029, criteria=41578, note=nameAchievement(13029, 2), buy={item=163567, npc=133833,},},
	[62000900] = {quest=nil, hf=true, atlas="Food", npc=143332, item=163567, achievement=13029, criteria=41578, note=nameAchievement(13029, 2), buy={item=163567, npc=133833, bag="link"}, requireItem={"bag", 163567},},
	-- HF 13036 - Nul n’est censé les ignorer
	[42206206] = {quest=53532, hf=true, atlasHf=conte, achievement=13036, criteria=41564, note=L["In the pond"],},
	[27706205] = {quest=53539, hf=true, atlasHf=conte, achievement=13036, criteria=41570, note=L["Next to the withered tree"],},
	[49592446] = {quest=53543, hf=true, atlasHf=conte, achievement=13036, criteria=41574, note=L["Scroll next to the altar, behind the mobs"],},
})
merge(ns.points[895], { -- Tiragarde Sound
	-- HF 13057 - Les chants de la mer
	[74873655] = {quest=53408, hf=true, atlas="Profession", achievement=13057, criteria=41541, note=L["On the fireplace mantel"].."\n"..nameAchievement(13057, 2),},
	[43502560] = {quest=53410, hf=true, atlas="Profession", achievement=13057, criteria=41542, note=nameAchievement(13057, 2),},
	[70202403] = {quest=53407, hf=true, atlas="Profession", achievement=13057, criteria=41543, note=L["Behind the Jay the Tavern Bard"].."\n"..nameAchievement(13057, 2),},
	[76218305] = {quest=nil, hf=true, atlas="Profession", achievement=13057, criteria=41544, note=nameAchievement(13057, 2),},
	[56676994] = {quest=nil, hf=true, atlas="Profession", npc=132086, npcLine=3, achievement=13057, criteria=41545, note=nameAchievement(13057, 2),},
	[73198415] = {quest=53411, hf=true, atlas="Profession", achievement=13057, criteria=41546, note=nameAchievement(13057, 2),},	-- La fugue du cheval
	-- HF 13061 - Du vent dans les voiles
	[77208425] = {hf=true, atlas="Food", npc=129044, item=163103, achievement=13061, criteria=41397, note=nameAchievement(13061, 2), buy={npc=129044, item=163103, bag="link",},},
	[49802515] = {hf=true, atlas="Food", npc=126601, achievement=13061, criteria={41404, 41406, 41407, 41408, 41412, 41416,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=126601,}, faction="Alliance",},
	[71413679] = {hf=true, atlas="Food", npc=143487, achievement=13061, criteria={41398, 41402,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=143487,},},
	[75552325] = {hf=true, atlas="Food", npc=123639, achievement=13061, criteria={41396, 41401,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=123639,}, faction="Alliance",},
	[74102700] = {hf=true, atlas="Food", npc=142189, achievement=13061, criteria={41397, 41406, 41411, 41414, 41416, 41417,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=142189,}, faction="Alliance",},
})
merge(ns.points[896], { -- Drustvar
	-- HF 13061 - Du vent dans les voiles
	[21006600] = {hf=true, atlas="Food", npc=139638, achievement=13061, criteria={41400, 41408, 41413, 41414, 41417,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=139638,},},
	[21504360] = {hf=true, atlas="Food", npc=137040, achievement=13061, criteria={41397, 41399, 41400, 41407, 41408, 41410, 41415, 41417,}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=139638,},},
	-- HF 13064 - Drust sera la chute
	[36806452] = {hf=true, atlas="Reagents", achievement=13064, criteria=41436, note=L["At the bottom of the upper waterfall"],},
    [50777371] = {hf=true, atlas="Reagents", achievement=13064, criteria=41437, note=L["Under the leaning tree"],},
	[27354833] = {hf=true, atlas="Reagents", achievement=13064, criteria=41438, note=L["Under water"],},
	[59396668] = {hf=true, atlas="Reagents", achievement=13064, criteria=41439, note=L["At the destroyed wall"],},
    [27605760] = {hf=true, atlas="Reagents", achievement=13064, criteria=41441, note=L["Under water at the foot of the small waterfall"],},
    [50144232] = {hf=true, atlas="Reagents", achievement=13064, criteria=41442, note=L["At the destroyed wall"],},
	[19065787] = {hf=true, atlas="Reagents", achievement=13064, criteria=41443, note=L["Behind the scrub"],},
    [46453723] = {hf=true, atlas="Reagents", achievement=13064, criteria=41445, note=L["At the destroyed wall"],},
	[56558583] = {hf=true, atlas="Reagents", achievement=13064, criteria=41446, note=L["On the mountain, a bit difficult to find the way up (see path)"],},
    [62707005] = path(13064, 41446, _, L["Path to The Flayed Man: Start"], "MiniMap-VignetteArrow", _, 1.2),
    [59207210] = path(13064, 41446, _, L["Path to The Flayed Man: Step 1"], "MiniMap-QuestArrow", _, 1.2),
    [58507420] = path(13064, 41446, _, L["Path to The Flayed Man: Step 2"], "MiniMap-QuestArrow", _, 1.2),
    [60307950] = path(13064, 41446, _, L["Path to The Flayed Man: Step 3"], "MiniMap-QuestArrow", _, 1.2),
    [57708100] = path(13064, 41446, _, L["Path to The Flayed Man: Step 4"], "MiniMap-DeadArrow", _, 1.2),
    [56608480] = path(13064, 41446, _, L["Path to The Flayed Man: End, jump down carefully"], "MiniMap-DeadArrow", _, 1.2),
    [44584566] = {hf=true, atlas="Reagents", achievement=13064, criteria=41449, note=L["In a cave, at the very back of the wall"],},
    [46304510] = path(13064, 41449, _, L["Path to Protectors of the Forest: cave entrance"]),
	-- HF 13082 - Du neuf avec du vieux
	[35525187] = {hf=true, item=163749, achievement=13082, criteria=41636, note=L["Near the cliff under the trees west of Arom's Stand flight master."],},
	[64876779] = {hf=true, item=163746, achievement=13082, criteria=41637, note=L["Between the rocks mid level of the waterfall"],},
	[55432714] = {hf=true, item=163748, achievement=13082, criteria=41638, note=L["On the mountain north of Fallhaven in the pile of bones."],},
	[32585891] = {hf=true, item=163747, achievement=13082, criteria=41639, note=L["In the tree trunk from the south side"],},
	[44892743] = {quest=53430, hf=true, label=nameAchievement(13082, 1), achievement=13082, requireItem={"bag", 163746, 163747, 163748, 163749}, note=nameAchievement(13082, 2),},
	[44902743] = {quest=53431, hf=true, label=nameAchievement(13082, 1), achievement=13082, hide_before={53430}, requireItem={"bag", 163746, 163747, 163748}, note=nameAchievement(13082, 2),},
	[44892742] = {quest=53432, hf=true, label=nameAchievement(13082, 1), achievement=13082, hide_before={53430, 53431}, requireItem={"bag", 163747, 163748}, note=nameAchievement(13082, 2),},
	[44882743] = {quest=53433, hf=true, label=nameAchievement(13082, 1), achievement=13082, hide_before={53430, 53431, 53432}, requireItem={"bag", 163748}, note=nameAchievement(13082, 2),},
	-- HF 13087 - Six cent six saucisses
	[55573482] = {hf=true, atlas="Banker", npc=128467, achievement=13087, criteria={41648, 41651, 41652, 41653}, note=nameAchievement(13087, 2), buy=13087,}, -- Saucisse fumée fermière de Comté-de-l’Or + 3
	[26687251] = {hf=true, atlas="Innkeeper", npc=136655, achievement=13087, criteria=41649, note=nameAchievement(13087, 2), buy=130872,}, -- Saucisse de sanglier grillée
	[33001370] = {hf=true, atlas="Banker", label=nameAchievement(13087, 1), achievement=13087, criteria=41650, note=nameAchievement(13087, 2), buy=130873,}, -- Sorcisson malecarde
	-- HF 13094 - La chasse au gibier maudit
	[53872072] = {hf=true, atlas="None", npc=143929, achievement=13094, note=nameAchievement(13094, 2), NPCScan="/npcscan add 143929",}, -- Chèvre
	[32216170] = {hf=true, atlas="None", npc=142278, achievement=13094, note=nameAchievement(13094, 2), NPCScan="/npcscan add 142278",}, -- Griffépines
	[21902260] = {hf=true, atlas="None", npc=143953, achievement=13094, note=nameAchievement(13094, 2), NPCScan="/npcscan add 143953",}, -- Otaries
	[74346589] = {hf=true, atlas="None", npc=143928, achievement=13094, note=nameAchievement(13094, 2), NPCScan="/npcscan add 143928",}, -- Crabes
	[22366947] = {hf=true, atlas="None", npc=143951, achievement=13094, note=nameAchievement(13094, 2), NPCScan="/npcscan add 143951",}, -- Requins
})
merge(ns.points[942], { -- Stormsong Valley
	-- HF 13046 - Les collines de l'appétit
	[58587031] = {hf=true, atlas="Innkeeper", npc=138221, achievement=13046, buy={item=160485, npc=138221, to=L["to Brennadam"],}, requireItem={"bag", 160485},},
	[41256955] = {hf=true, atlas="Food", label=nameAchievement(13046, 1), achievement=13046, note=nameAchievement(13046, 2), buy={item=160485, npc=138221, to=L["to Brennadam"],}, requireItem={"bag", 160485},},
	-- HF 13051 - Légendes des Eaugures
	[49508090] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41425, note=L["Near the waterfall"],},
	[59025954] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41426, note=L["On top of the hill"],},
	[31957291] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41427, note=L["Near the lake"],},
	[33803323] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41428, note=L["On top of the island"],},
	[56003853] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41429, note=L["Up the mountain right of Warfang Hold"],},
	[44183660] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41430, note=L["Up the mountain left of Warfang Hold"],},
	[62083022] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41431,},
	[75073113] = {hf=true, atlas="poi-workorders", achievement=13051, criteria=41432, note=L["Near the Shrine of the Storm entrance"],},
	-- HF 13061 - Du vent dans les voiles
	[44455420] = {hf=true, atlas="Food", npc=135600, achievement=13061, criteria=41405, note=nameAchievement(13061, 2), buy={item=158927, npc=135600, bag="link",},},
	[49075722] = {hf=true, atlas="Food", achievement=13061, criteria=41409, note=nameAchievement(13061, 2),},
})
merge(ns.points[1161], { -- Boralus
	-- HF 13057 - Les chants de la mer
	[72456933] = {quest=53408, hf=true, atlas="Profession", achievement=13057, criteria=41541, note=L["On the fireplace mantel"].."\n"..nameAchievement(13057, 2),},
	[53141760] = {quest=53407, hf=true, atlas="Profession", achievement=13057, criteria=41543, note=L["Behind the Jay the Tavern Bard"].."\n"..nameAchievement(13057, 2),},
	-- HF 13061 - Du vent dans les voiles
	[47604735] = {hf=true, atlas="Food", npc=137411, achievement=13061, criteria={41396, 41400, 41403, 41406, 41415, 41417}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=137411,},},
	[58157030] = {hf=true, atlas="Food", npc=143487, achievement=13061, criteria={41398, 41402}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=143487,},},
	[75301440] = {hf=true, atlas="Food", npc=123639, achievement=13061, criteria={41396, 41399, 41400, 41401, 41407, 41410, 41417}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=123639,}, faction="Alliance",},
	[69252983] = {hf=true, atlas="Food", npc=142189, achievement=13061, criteria={41397, 41406, 41411, 41414, 41416, 41417}, note=nameAchievement(13061, 2), note2={text=L["You can buy them from : "], npc=142189,}, faction="Alliance",},
}) 
merge(ns.points[1165], { -- Dazar'alor
	-- HF 13036 - Nul n’est censé les ignorer
	[53250930] = {quest=53548, hf=true, atlasHf=conte, achievement=13036, criteria=41581, note= L["Behind the NPC in the Corner"],},
})
