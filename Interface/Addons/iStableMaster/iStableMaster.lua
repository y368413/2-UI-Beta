iStableMaster = LibStub("AceAddon-3.0"):NewAddon("iStableMaster", "AceConsole-3.0", "AceEvent-3.0");

GlobalActiveSlotLoopValue = 5;




if(iStableMasterDB == nil) then
iStableMasterDB ={};

iStableMasterDB["Constants"] = {};
iStableMasterDB["Dynamics"] = {};

iStableMasterDB["SpecializationAbilities"] = {};
iStableMasterDB["FamilyAbilities"] = {};
iStableMasterDB["ActiveFilters"] = {};
iStableMasterDB["ActiveSorts"] = {};
end
if(l_iStableMasterDB == nil) then
l_iStableMasterDB ={};

l_iStableMasterDB["Constants"] = {};
l_iStableMasterDB["Dynamics"] = {};

l_iStableMasterDB["SpecializationAbilities"] = {};
l_iStableMasterDB["FamilyAbilities"] = {};

l_iStableMasterDB["ActiveFilters"] = {};
l_iStableMasterDB["ActiveSortss"] = {};

end

if(l_iStableMasterDB["ActiveSorts"] == nil) then

l_iStableMasterDB["ActiveSorts"] = { Sort = {AnySort = false, 
											Name = 0, -- direction: -1 descending Z-A, 0 is off, 1 Ascending A-Z
											Specialization = {Cunning = 1, Tenacity = 2,Ferocity = 3, Direction = 0}, -- Spec Order 1-3, direction -1 descending, 0 off, 1 ascending : Default case => 1,2,3,1 => Cunning above Tenacity above Ferocity if diretion < 0 order, is flipped.
											Family = {["Aquiri"] = 1,["Basilisk"] = 2,["Bat"] = 3,["Bear"] = 4,["Beetle"] = 5,["Bird of Prey"] = 6,["Blood Beast"] = 7,["Boar"] = 8,["Camel"] = 9,["Carapid"] = 10,["Carrion Bird"] = 11,["Cat"] = 12,["Chimera"] = 13,["Clefthoof"] = 14,["Core Hound"] = 15, ["Courser"] = 16,["Crab"] = 17,["Crane"] = 18,["Crocolisk"] = 19,["Devilsaur"] = 20,["Direhorn"] = 21,["Dragonhaw"] = 22,
["Feathermane"] = 23,["Fox"] = 24,["Gorilla"] = 25,["Gruffhorn"] = 26,["Hound"] = 27,["Hydra"] = 28,["Hyena"] = 29,["Lizzard"] = 30,["Mammoth"] = 31,["Mechanical"] = 32,["Monkey"] = 33,["Moth"] = 34,["Oxen"] = 35,["Pterrordax"] = 36,["Raptor"] = 37,["Ravager"] = 38,["Ray"] = 39,["Riverbeast"] = 40,["Rodent"] = 41,["Scalehide"] = 42,["Scorpid"] = 43,["Serpent"] = 44,["Shale Beast"] = 45,["Spider"] = 46,["Spirit Beast"] = 47,
["Sporebat"] = 48,["Stag"] = 49,["Stone Hound"] = 50,["Tallstrider"] = 51,["Toad"] = 52,["Turtle"] = 53,["Warp Stalker"] = 54,["Wasp"] = 55, ["Water Strider"] = 56,["Wind Serpent"] = 57,["Wolf"] = 58,["Worm"] = 59, Direction = 0}, -- direction: -1 descending 58-1, 0 is off, 1 Ascending 1-58
											Expansion = {Classic = 1, TBC = 2, WOTLK = 3, CATA = 4, MOP = 5, WOD = 6, LEGION = 7, BFA = 8, SL = 9, Direction = 0}, -- Expansion Order 1-9, direction -1 descending, 0 off, 1 ascending : Default case => 1,2,(...),9, -1 => Latest Expansions Above Earliest Expansions if diretion > 0, order is flipped.
											Diets = 0, -- direction: -1 descending Many_Food_Types-Few_Food_Types, 0 is off, 1 Ascending Few_Food_Types-Many_Food_Types
											Favourites = 0, -- direction: -1 descending IsNotFavourite-IsFavourite, 0 is off, 1 Ascending IsFavourite-IsNotFavourite
											Exotic = 0, -- direction: -1 descending IsNotExotic-IsExotic, 0 is off, 1 Ascending IsExotic-IsNotExotic
											Renamed = 0, -- direction: -1 descending IsNotRenamed-IsRenamed, 0 is off, 1 Ascending IsRenamed-IsNotRenamed
											Rarity = 0, -- direction: -1 descending IsNotRare-IsRare, 0 is off, 1 Ascending IsRare-IsNotRare
											ActiveSlots = 0, -- direction: -1 descending IsNotActivePet-IsActivePet, 0 is off, 1 Ascending IsActivePet-IsNotActivePet
											AnimalCompanion = 0, -- direction: -1 descending IsNotAnimalCompanion-IsAnimalCompanion, 0 is off, 1 Ascending IsAnimalCompanion-IsNotAnimalCompanion
											},
									CurrentSort = {primary = 0, secondary = 0, tertiary = 0},
									ReverseLookUpIndex = {"Name","Specialization","Family","Expansion","Diets","Favourites","Exotic","Renamed","Rarity","ActiveSlots","AnimalCompanion"},
									}

end
function InitSorts(forced)

if(iStableMasterDB["ActiveSorts"] == nil or forced == true) then
l_iStableMasterDB["ActiveSorts"] = { Sort = {AnySort = false, 
											Name = 0, -- direction: -1 descending Z-A, 0 is off, 1 Ascending A-Z
											Specialization = {Cunning = 1, Tenacity = 2,Ferocity = 3, Direction = 0}, -- Spec Order 1-3, direction -1 descending, 0 off, 1 ascending : Default case => 1,2,3,1 => Cunning above Tenacity above Ferocity if diretion < 0 order, is flipped.
											Family = {["Aquiri"] = 1,["Basilisk"] = 2,["Bat"] = 3,["Bear"] = 4,["Beetle"] = 5,["Bird of Prey"] = 6,["Blood Beast"] = 7,["Boar"] = 8,["Camel"] = 9,["Carapid"] = 10,["Carrion Bird"] = 11,["Cat"] = 12,["Chimera"] = 13,["Clefthoof"] = 14,["Core Hound"] = 15, ["Courser"] = 16,["Crab"] = 17,["Crane"] = 18,["Crocolisk"] = 19,["Devilsaur"] = 20,["Direhorn"] = 21,["Dragonhaw"] = 22,
["Feathermane"] = 23,["Fox"] = 24,["Gorilla"] = 25,["Gruffhorn"] = 26,["Hound"] = 27,["Hydra"] = 28,["Hyena"] = 29,["Lizzard"] = 30,["Mammoth"] = 31,["Mechanical"] = 32,["Monkey"] = 33,["Moth"] = 34,["Oxen"] = 35,["Pterrordax"] = 36,["Raptor"] = 37,["Ravager"] = 38,["Ray"] = 39,["Riverbeast"] = 40,["Rodent"] = 41,["Scalehide"] = 42,["Scorpid"] = 43,["Serpent"] = 44,["Shale Beast"] = 45,["Spider"] = 46,["Spirit Beast"] = 47,
["Sporebat"] = 48,["Stag"] = 49,["Stone Hound"] = 50,["Tallstrider"] = 51,["Toad"] = 52,["Turtle"] = 53,["Warp Stalker"] = 54,["Wasp"] = 55, ["Water Strider"] = 56,["Wind Serpent"] = 57,["Wolf"] = 58,["Worm"] = 59, Direction = 0}, -- direction: -1 descending 58-1, 0 is off, 1 Ascending 1-58
											Expansion = {Classic = 1, TBC = 2, WOTLK = 3, CATA = 4, MOP = 5, WOD = 6, LEGION = 7, BFA = 8, SL = 9, Direction = 0}, -- Expansion Order 1-9, direction -1 descending, 0 off, 1 ascending : Default case => 1,2,(...),9, -1 => Latest Expansions Above Earliest Expansions if diretion > 0, order is flipped.
											Diets = 0, -- direction: -1 descending Many_Food_Types-Few_Food_Types, 0 is off, 1 Ascending Few_Food_Types-Many_Food_Types
											Favourites = 0, -- direction: -1 descending IsNotFavourite-IsFavourite, 0 is off, 1 Ascending IsFavourite-IsNotFavourite
											Exotic = 0, -- direction: -1 descending IsNotExotic-IsExotic, 0 is off, 1 Ascending IsExotic-IsNotExotic
											Renamed = 0, -- direction: -1 descending IsNotRenamed-IsRenamed, 0 is off, 1 Ascending IsRenamed-IsNotRenamed
											Rarity = 0, -- direction: -1 descending IsNotRare-IsRare, 0 is off, 1 Ascending IsRare-IsNotRare
											ActiveSlots = 0, -- direction: -1 descending IsNotActivePet-IsActivePet, 0 is off, 1 Ascending IsActivePet-IsNotActivePet
											AnimalCompanion = 0, -- direction: -1 descending IsNotAnimalCompanion-IsAnimalCompanion, 0 is off, 1 Ascending IsAnimalCompanion-IsNotAnimalCompanion
											},
									CurrentSort = {primary = 0, secondary = 0, tertiary = 0},
									ReverseLookUpIndex = {"Name","Specialization","Family","Expansion","Diets","Favourites","Exotic","Renamed","Rarity","ActiveSlots","AnimalCompanion"},
									}

	iStableMasterDB["ActiveSorts"] = {};
	iStableMasterDB["ActiveSorts"] = l_iStableMasterDB["ActiveSorts"]; -- this set default filters if none are saved.
	end
end


function SetSortPriority(p1,p2,p3)

if p1 == nil then

elseif type(p1) == "number" then
iStableMasterDB["ActiveSorts"]["CurrentSort"].primary = p1;

else
iStableMasterDB["ActiveSorts"]["CurrentSort"].primary = 0;

end

if p2 == nil then
elseif type(p1) == "number" then
iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary = p2;
else
iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary = 0;
end

if p3 == nil then 
elseif type(p1) == "number" then
iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary = p3;
else
iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary = 0;

end

end



function GetSortPriority(index,index2,index3)
local tempOut = {};

if(iStableMasterDB["ActiveSorts"]["CurrentSort"].primary ~= 0) then

tempOut[1] = iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][iStableMasterDB["ActiveSorts"]["CurrentSort"].primary];

end

if(index2 == nil) then
return tempOut;
else
if(iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary ~= 0) then

tempOut[2] = iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary];

end

end

if(index3 == nil) then 
return tempOut;
else
if(iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary ~= 0) then

tempOut[3] = iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary];

end

end
if (iStableMasterDB["ActiveSorts"]["CurrentSort"].primary == 0) then
return false; -- This should never be reached!

end

return tempOut;
end

function SetSortDirection(sortby,direction)

if(sortby == "Specialization" or sortby == "Expansion" or sortby == "Family") then

iStableMasterDB["ActiveSorts"]["Sort"][sortby]["Direction"] = direction;

else
iStableMasterDB["ActiveSorts"]["Sort"][sortby] = direction;



end

end


function SetSpecializationSort(l_Cunning,l_Tenacity,l_Ferocity,l_Direction) 
local temp = {l_Cunning,l_Tenacity,l_Ferocity,l_Direction};

SetSortingValue("Specializations", temp);

end

function SetExpansionSort(l_Classic, l_TBC, l_WOTLK, l_CATA, l_MOP, l_WOD, l_LEGION, l_BFA, l_SL, l_Direction) 
local temp = {l_Classic, l_TBC, l_WOTLK, l_CATA, l_MOP, l_WOD, l_LEGION, l_BFA, l_SL, l_Direction};

SetSortingValue("Expansions", temp);

end


function SetSortingValue(type, value)

if type == "AnySort" then
iStableMasterDB["ActiveSorts"]["Sort"].AnySort = value;
elseif type == "Specializations" then
iStableMasterDB["ActiveSorts"]["Sort"].Specialization = value; -- value is a table here befitting its dimensions
elseif type == "Expansions" then
iStableMasterDB["ActiveSorts"]["Sort"].Expansions = value; -- value is a table here befitting its dimensions
elseif type == "Name" then
iStableMasterDB["ActiveSorts"]["Sort"].Name = value;
elseif type == "Family" then
iStableMasterDB["ActiveSorts"]["Sort"].Family = value;
elseif type == "Diets" then
iStableMasterDB["ActiveSorts"]["Sort"].Diets = value;
elseif type == "Favourites" then
iStableMasterDB["ActiveSorts"]["Sort"].Favourites = value;
elseif type == "Exotic" then
iStableMasterDB["ActiveSorts"]["Sort"].Exotic = value;
elseif type == "Renamed" then
iStableMasterDB["ActiveSorts"]["Sort"].Renamed = value;
elseif type == "Rarity" then
iStableMasterDB["ActiveSorts"]["Sort"].Rarity = value;
elseif type == "ActiveSlots" then
iStableMasterDB["ActiveSorts"]["Sort"].ActiveSlots = value;
elseif type == "AnimalCompanion" then
iStableMasterDB["ActiveSorts"]["Sort"].AnimalCompanion = value;
else


end

end

function GetSortingValue(type,tableIndex)
if type == "AnySort" then
return iStableMasterDB["ActiveSorts"]["Sort"].AnySort;
elseif type == "Specializations" then
return iStableMasterDB["ActiveSorts"]["Sort"].Specialization[tableIndex]; -- value is a table here befitting its dimensions, using 4 to get the value right
elseif type == "Expansions" then
return iStableMasterDB["ActiveSorts"]["Sort"].Expansions; -- value is a table here befitting its dimensions
elseif type == "Name" then
return iStableMasterDB["ActiveSorts"]["Sort"].Name;
elseif type == "Family" then
return iStableMasterDB["ActiveSorts"]["Sort"].Family[tableIndex];
elseif type == "Diets" then
return iStableMasterDB["ActiveSorts"]["Sort"].Diets;
elseif type == "Favourites" then
return iStableMasterDB["ActiveSorts"]["Sort"].Favourites;
elseif type == "Exotic" then
return iStableMasterDB["ActiveSorts"]["Sort"].Exotic;
elseif type == "Renamed" then
return iStableMasterDB["ActiveSorts"]["Sort"].Renamed;
elseif type == "Rarity" then
return iStableMasterDB["ActiveSorts"]["Sort"].Rarity;
elseif type == "ActiveSlots" then
return iStableMasterDB["ActiveSorts"]["Sort"].ActiveSlots;
elseif type == "AnimalCompanion" then
return iStableMasterDB["ActiveSorts"]["Sort"].AnimalCompanion;
else


end

end



if(l_iStableMasterDB["ActiveFilters"] == nil) then 
l_iStableMasterDB["ActiveFilters"] = {Type = {AnyFilter = false,
											 API_Databased = {FilterName = {Families = {Aquiri = false,Basilisk = false,Bat = false, Bear = false, Beetle = false,["Bird of Prey"] = false,["Blood Beast"] = false, Boar = false, Camel = false, Carapid = false,
																							["Carrion Bird"] = false, Cat = false, Chimera = false, Clefthoof = false, ["Core Hound"] = false, Courser = false, Crab = false, Crane = false, Crocolisk = false, 
																							Devilsaur = false, Direhorn = false, Dragonhaw = false,	Feathermane = false, Fox = false, Gorilla = false, Gruffhorn = false, Hound = false, Hydra = false, Hyena = false,
																							Lizzard = false, Mammoth = false, Mechanical = false, Monkey = false, Moth = false, Oxen = false, Pterrordax = false, Raptor = false, Ravager = false, Ray = false,
																							Riverbeast = false, Rodent = false, Scalehide = false, Scorpid = false, Serpent = false, ["Shale Beast"] = false, Spider = false, ["Spirit Beast"] = false,
																							Sporebat = false, Stag = false, ["Stone Hound"] = false, Tallstrider = false, Toad = false, Turtle = false, ["Warp Stalker"] = false, Wasp = false, ["Water Strider"] = false,
																							["Wind Serpent"] = false, Wolf = false, Worm = false},
																			Specializations = {Cunning = false, Tenacity = false, Ferocity = false},
																			Diets = {Bread = false, Meat = false, ["Raw Meat"] = false, Fish = false, ["Raw Fish"] = false, Fungus = false, ["Mechanical Bits"] = false, Fruit = false, Cheese = false }}},
											 Custom = {FilterName = {Named = false, Favourite = false, Rarity = false, Exotic = false}}}};

-- Example:
-- l_iStableMasterDB["ActiveFilters"]["API_Databased"]["Families"]["Core Hound"] = true; Changes the filtervalue to true.

end

function InitFilters(forced)
if(iStableMasterDB["ActiveFilters"] == nil or forced) then
l_iStableMasterDB["ActiveFilters"] = {Type = {AnyFilter = false,
											 API_Databased = {FilterName = {Families = {Aquiri = false,Basilisk = false,Bat = false, Bear = false, Beetle = false,["Bird of Prey"] = false,["Blood Beast"] = false, Boar = false, Camel = false, Carapid = false,
																							["Carrion Bird"] = false, Cat = false, Chimera = false, Clefthoof = false, ["Core Hound"] = false, Courser = false, Crab = false, Crane = false, Crocolisk = false, 
																							Devilsaur = false, Direhorn = false, Dragonhaw = false,	Feathermane = false, Fox = false, Gorilla = false, Gruffhorn = false, Hound = false, Hydra = false, Hyena = false,
																							Lizzard = false, Mammoth = false, Mechanical = false, Monkey = false, Moth = false, Oxen = false, Pterrordax = false, Raptor = false, Ravager = false, Ray = false,
																							Riverbeast = false, Rodent = false, Scalehide = false, Scorpid = false, Serpent = false, ["Shale Beast"] = false, Spider = false, ["Spirit Beast"] = false,
																							Sporebat = false, Stag = false, ["Stone Hound"] = false, Tallstrider = false, Toad = false, Turtle = false, ["Warp Stalker"] = false, Wasp = false, ["Water Strider"] = false,
																							["Wind Serpent"] = false, Wolf = false, Worm = false},
																			Specializations = {Cunning = false, Tenacity = false, Ferocity = false},
																			Diets = {Bread = false, Meat = false, ["Raw Meat"] = false, Fish = false, ["Raw Fish"] = false, Fungus = false, ["Mechanical Bits"] = false, Fruit = false, Cheese = false }}},
											 Custom = {FilterName = {Named = false, Favourite = false, Rarity = false, Exotic = false}}}};

iStableMasterDB["ActiveFilters"] = {};
iStableMasterDB["ActiveFilters"] = l_iStableMasterDB["ActiveFilters"]; -- this set default filters if none are saved.

end

end


function SetFilterValue(type, value)

if type == "AnyFilter" then
iStableMasterDB["ActiveFilters"]["Type"].AnyFilter = value;
elseif type == "Cunning" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[type] = value;
elseif type == "Tenacity" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[type] = value;
elseif type == "Ferocity" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[type] = value;

-- foods

elseif type == "Bread" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;
elseif type == "Meat" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;

elseif type == "Raw Meat" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;

elseif type == "Fish" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;

elseif type == "Raw Fish" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;
elseif type == "Fungus" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;
elseif type == "Mechanical Bits" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;
elseif type == "Fruit" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;
elseif type == "Cheese" then
iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[type] = value;

-- CUSTOM
elseif type == "Named" then
iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[type] = value;
elseif type == "Favourite" then
iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[type] = value;
elseif type == "Rarity" then
iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[type] = value;
elseif type == "Exotic" then
iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[type] = value;




else


end

end

function GetFilterValue(input)

if input == "AnyFilter" then
return iStableMasterDB["ActiveFilters"]["Type"].AnyFilter;
elseif input == "Cunning" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[input];
elseif input == "Tenacity" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[input];
elseif input == "Ferocity" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Specializations[input];
elseif input == "Diets" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets;
-- foods

elseif input == "Bread" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];
elseif input == "Meat" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];

elseif input == "Raw Meat" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];

elseif input == "Fish" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];

elseif input == "Raw Fish" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];
elseif input == "Fungi" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];
elseif input == "Mechanical Bits" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];
elseif input == "Fruit" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];
elseif input == "Cheese" then
return iStableMasterDB["ActiveFilters"]["Type"].API_Databased.FilterName.Diets[input];

-- CUSTOM
elseif input == "Named" then
return iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[input];
elseif input == "Favourite" then
return iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[input];
elseif input == "Rarity" then
return iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[input];
elseif input == "Exotic" then
return iStableMasterDB["ActiveFilters"]["Type"].Custom.FilterName[input];


else

return false;

end


end






if(iStableMasterDB["ActiveFilters"] == nil) then
iStableMasterDB["ActiveFilters"] = {};
iStableMasterDB["ActiveFilters"] = l_iStableMasterDB["ActiveFilters"]; -- this set default filters if none are saved.

end



if(iStableMasterDB["SpecializationAbilities"] == nil) then
iStableMasterDB["SpecializationAbilities"] = {};
end

if(iStableMasterDB["FamilyAbilities"] == nil) then
iStableMasterDB["FamilyAbilities"] = {};
end

if(l_iStableMasterDB["SpecializationAbilities"] == nil) then
l_iStableMasterDB["SpecializationAbilities"] = {};
end

if(l_iStableMasterDB["FamilyAbilities"] == nil) then
l_iStableMasterDB["FamilyAbilities"] = {};
end



if(iStableMasterDB["Constants"]["ColourScheme"] == nil)then
iStableMasterDB["Constants"]["ColourScheme"] = {};
end
if(l_iStableMasterDB["Constants"]["ColourScheme"] == nil)then
l_iStableMasterDB["Constants"]["ColourScheme"] = {};

end

l_iStableMasterDB["Constants"]["C_STABLES_COLLECTION"] = {Title = "Stables", Tab = "Stable Master"} --Contents = _G["StablesCollection"]};
iStableMasterDB["Constants"]["C_STABLES_COLLECTION"] = l_iStableMasterDB["Constants"]["C_STABLES_COLLECTION"];
l_iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]  = {};
iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"] = l_iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"];





if(iStableMasterOptionsDB == nil) then
iStableMasterOptionsDB = {};
end
if(l_iStableMasterOptionsDB == nil) then
l_iStableMasterOptionsDB = {};
end


l_iStableMasterDB["SpecializationAbilities"] = {
    Tenacity = {264662, 264735},
    Cunning =  {264656, 53271 },
    Ferocity = {264663, 264667},
};


iStableMasterDB["SpecializationAbilities"] = l_iStableMasterDB["SpecializationAbilities"];


l_DB_families = {"Aquiri","Basilisk","Bat","Bear","Beetle","Bird of Prey","Blood Beast","Boar","Camel","Carapid","Carrion Bird","Cat","Chimera","Clefthoof","Core Hound", "Courser","Crab","Crane","Crocolisk","Devilsaur","Direhorn","Dragonhaw",
"Feathermane","Fox","Gorilla","Gruffhorn","Hound","Hydra","Hyena","Lizzard","Mammoth","Mechanical","Monkey","Moth","Oxen","Pterrordax","Raptor","Ravager","Ray","Riverbeast","Rodent","Scalehide","Scorpid","Serpent","Shale Beast","Spider","Spirit Beast",
"Sporebat","Stag","Stone Hound","Tallstrider","Toad","Turtle","Warp Stalker","Wasp", "Water Strider","Wind Serpent","Wolf","Worm"};

l_iStableMasterDB["FamilyAbilities"] = {
Aqiri        = {160065, 280151},
Basilisk     = {263841},
Bat          = {344348},
Bear         = {263934,94019},
Beetle       = {90339},
["Bird of Prey"] = {263852, 94022},
["Blood�Beast"]  = {288962},
Boar         = {263869,},
Camel        = {341115,},
Carapid      = {279410,279254,},
["Carrion Bird"] = {24423},
Cat          = {263892,24450},
Chimaera     = {54644,92380},
Clefthoof    = {160057,280069},
["Core�Hound"]   = {263867,159788},
Courser      = {341117},
Crab         = {50245},
Crane        = {344350,94022},
Crocolisk    = {50433},
Devilsaur    = {54680,159953},
Direhorn     = {263861},
Dragonhawk   = {263887},
Feathermane  = {263916,160007},
Fox          = {160011,90347},
Gorilla      = {263939},
Gruffhorn    = {263921},
Hound        = {17253,263423},
Hydra        = {263863},
Hyena        = {263853},
Lizard       = {279362},
Mammoth      = {49966,341118},
Mechanical   = {263868},
Monkey       = {160044},
Moth         = {344353},
Oxen         = {264023},
Pterrordax   = {279399,160007},
Raptor       = {263854},
Ravager      = {263857},
Ray          = {344349},
Riverbeast   = {160018},
Rodent       = {263856,94019},
Scalehide    = {263865},
Scorpid      = {160060},
Serpent      = {263904},
["Shale Beast"]  = {160063,279259},
Spider       = {160067},
["Spirit Beast"] = {344351,90361,90328},
Sporebat	 = {344347},
Stag = {344352},
["Stone Hound"]  = {17253,160049,267922},
Tallstrider  = {50285},
Toad         = {279336},
Turtle       = {26064},
["Warp�Stalker"] = {35346},
Wasp         = {263858},
["Water�Strider"] = {344346,126311},
["Wind Serpent"] = {264360},
Wolf         = {263840},
Worm         = {263446,93433}

 };
iStableMasterDB["FamilyAbilities"] = l_iStableMasterDB["FamilyAbilities"];


l_iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"] = {
	0883,
	83242,
	83243,
	83244,
	83245,
};

iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"] = l_iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"];

--iStableMasterDB["Constants"]["ColourScheme"]["Default"] = {

--	LightGreen = "8FB261FF",
--	Green = "4A5C33FF",
--	DarkGreen = "344943FF",
--	Blue = "2A3F66FF",
--	BlackTintedBlue = "0C1019FF",
--};

l_iStableMasterDB["Constants"]["ColourScheme"]["Default"] = {

	LightGreen = "8FB261FF",
	Green = "4A5C33FF",
	DarkGreen = "344943FF",
	Blue = "2A3F66FF",
	BlackTintedBlue = "0C1019FF",
};

iStableMasterDB["Constants"] = l_iStableMasterDB["Constants"];
iStableMasterDB["Constants"]["ColourScheme"] = l_iStableMasterDB["Constants"]["ColourScheme"];
iStableMasterDB["Constants"]["ColourScheme"]["Default"] = l_iStableMasterDB["Constants"]["ColourScheme"]["Default"];





function GetDBColour(table,key)

	return hex2rgb(iStableMasterDB["Constants"]["ColourScheme"][table][key]);

end


function hex2rgb(hex)
    hex = hex:gsub("#","")
	if(string.len(hex) == 6) then
    return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255;
	else
	return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255, tonumber("0x"..hex:sub(7,8))/255;
	end
end


function InitPetInfoToWTF()

	--if (iStableMasterStableDB["Petslots"] == nil) then
	--iStableMasterStableDB["Petslots"] = {};
	--end
	if(iStableMasterOptionsDB["ScrollList"] == nil) then

	iStableMasterOptionsDB["ScrollList"] = {};
	iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] = false;
	iStableMasterOptionsDB["ScrollList"]["HideEmptyStableSlots"] = false;
	end
	local currentSpec = GetSpecialization();
	--local currentSpecName = select(2, GetSpecializationInfo(currentSpec));
	--local id, currentSpecName, description, icon, background, role = GetSpecializationInfo(currentSpec, false, false);
	--print(currentSpec);
	currentSpecName = {
	"Beast Mastery",
	"Marksmanship",
	"Survival",
	
	};

	
	
	GlobalSpecialization = currentSpecName[currentSpec];
	
	



			--iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 5;
			--print(iStableMasterDB["Dynamics"]["Specialization"]);
		if(GlobalSpecialization == "Beast Mastery") then 
			GlobalActiveSlotLoopValue = 6;
			
		else
			GlobalActiveSlotLoopValue = 5;
			
		end
			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = GlobalActiveSlotLoopValue;
	

--	if(iStableMasterDB["Dynamics"]["Specialization"] == nil) then
--	--iStableMasterDB["Dynamics"]["Specialization"] = "Beast_Mastery";


--	--local mystring = currentSpecName[currentSpec];
--	iStableMasterDB["Dynamics"]["Specialization"] = GetSpecialization();
--	end


--	if(iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] == nil) then 
--			--iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 5;
--			--print(iStableMasterDB["Dynamics"]["Specialization"]);
--		if(GetSpecialization() == 1) then 
--			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 6;
--		else
--			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 5;
--		end
	
--	else
	
--		if(GetSpecialization() == 1) then 
--			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 6;
--		else
--			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = 5;
--		end
--	end

	if (iStableMasterStableDB["PetInfo"] == nil) then
	
	iStableMasterStableDB["PetInfo"] = {};
	
	end
	iStableMasterDB["FamilyAbilities"] = l_iStableMasterDB["FamilyAbilities"];

for i=1,205,1 do
		--local button = _G["PetStableStabledPet"..i];
		
		


		if(i < 6) then
		local petSlot = PetStable_GetPetSlot(i, true);
		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
		--if(iStableMasterStableDB["Petslots"]["Slot"..i] == nil) then
		--iStableMasterStableDB["Petslots"]["Slot"..i] = petSlot;
		--end
		local l_abilities = {talent, family, bonus}
		l_abilities["talent"] = iStableMasterDB["SpecializationAbilities"][l_talent];
		l_abilities["family"] = iStableMasterDB["FamilyAbilities"][l_family];
		l_abilities["bonus"] = {"N/A"}; --iStableMasterStableDB["SpecializationAbilities"][l_talent]; 

		if(nil ~= l_icon) then else l_icon = "N/A" end
		if(nil ~= l_name) then else l_name = "N/A" end
		if(nil ~= l_level) then else l_level = "N/A" end
		if(nil ~= l_family) then else l_family = "N/A" end
		if(nil ~= l_talent) then else l_talent = "N/A" end
		if(nil ~= l_abilities["talent"]) then else l_abilities["talent"] = {"N/A"}; end
		if(nil ~= l_abilities["family"]) then else l_abilities["family"] = {"N/A"}; end		
		if(nil ~= l_abilities["bonus"]) then else l_abilities["bonus"] = {"N/A"}; end
		
		
		if(ScrollFrameArrElem ~= nil) then 
				--- this may be an issue in the future

			--l_favourite = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"];
			--l_inStables = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"];
			
		end
		

		if(iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot] == nil) then
		local l_favourite = false;
		local l_inStables = false;
		if(nil ~= l_favourite) then else l_favourite = false end
		if(nil ~= l_inStables) then else l_inStables = false end

		iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot] = {icon = l_icon, name = l_name, level = l_level, family = l_family, talent = l_talent, favourite = l_favourite, inStables = l_inStables, Slot = i,abilities = l_abilities};
		end
		else

		local petSlot = (i - 5);
		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);

		local l_abilities = {talent, family, bonus}
		l_abilities["talent"] = iStableMasterDB["SpecializationAbilities"][l_talent];
		l_abilities["family"] = iStableMasterDB["FamilyAbilities"][l_family];
		l_abilities["bonus"] = {"N/A"}; --iStableMasterDB["SpecializationAbilities"][l_talent]; 
		--if(iStableMasterStableDB["Petslots"]["Slot"..i] == nil) then
		--iStableMasterStableDB["Petslots"]["Slot"..i] = petSlot;
		--end
			if(nil ~= l_icon) then else l_icon = "N/A" end
			if(nil ~= l_name) then else l_name = "N/A" end
			if(nil ~= l_level) then else l_level = "N/A" end
			if(nil ~= l_family) then else l_family = "N/A" end
			if(nil ~= l_talent) then else l_talent = "N/A" end
			if(nil ~= l_abilities["talent"]) then else l_abilities["talent"] = {"N/A"}; end
			if(nil ~= l_abilities["family"]) then else l_abilities["family"] = {"N/A"}; end		
			if(nil ~= l_abilities["bonus"]) then else l_abilities["bonus"] = {"N/A"}; end
			
			
			if(ScrollFrameArrElem ~= nil) then 

			--l_favourite = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"];
			--l_inStables = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"];
			
			end
			



		if(iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot] == nil) then
		local l_favourite = false;
		local l_inStables = true;
		if(nil ~= l_favourite) then else l_favourite = false end
		if(nil ~= l_inStables) then else l_inStables = true end
		iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot] = {icon = l_icon, name = l_name, level = l_level, family = l_family, talent = l_talent, favourite = l_favourite, inStables = l_inStables, Slot = i, abilities = l_abilities};
		end
		
		end

end
end



function SavePetInfoToWTF()


for i=1,205,1 do
		--local button = _G["PetStableStabledPet"..i];
		
		


		if(i < 6) then
		local petSlot = PetStable_GetPetSlot(i, true);
		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
		local l_abilities = {talent, family, bonus}
		l_abilities["talent"] = iStableMasterDB["SpecializationAbilities"][l_talent];
		l_abilities["family"] = iStableMasterDB["FamilyAbilities"][l_family];
		l_abilities["bonus"] = {"N/A"}; --iStableMasterDB["SpecializationAbilities"][l_talent]; 

		--iStableMasterStableDB["Petslots"]["Slot"..i] = petSlot;
		if(nil ~= l_icon) then else l_icon = "N/A" end
		if(nil ~= l_name) then else l_name = "N/A" end
		if(nil ~= l_level) then else l_level = "N/A" end
		if(nil ~= l_family) then else l_family = "N/A" end
		if(nil ~= l_talent) then else l_talent = "N/A" end
		if(nil ~= l_abilities["talent"]) then else l_abilities["talent"] = {"N/A"}; end
		if(nil ~= l_abilities["family"]) then else l_abilities["family"] = {"N/A"}; end		
		if(nil ~= l_abilities["bonus"]) then else l_abilities["bonus"] = {"N/A"}; end

		local l_favourite
		local l_inStables;
		
		if(ScrollFrameArrElem ~= nil) then 
				if(ScrollFrameArrElem["ScrollElementChild"..i] ~= nil) then
					if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] ~= nil) then
						if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] ~= nil) then
							l_favourite = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"];
							l_inStables = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"];
						end
					end
				end
			end
		if(nil ~= l_favourite) then else l_favourite = false end
		if(nil ~= l_inStables) then else l_inStables = false end


		iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot] = {icon = l_icon, name = l_name, level = l_level, family = l_family, talent = l_talent, favourite = l_favourite, inStables = l_inStables, Slot = i,  abilities = l_abilities};
		else

		local petSlot = (i - 5);
		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
		local l_abilities = {talent, family, bonus}
		l_abilities["talent"] = iStableMasterDB["SpecializationAbilities"][l_talent];
		l_abilities["family"] = iStableMasterDB["FamilyAbilities"][l_family];
		l_abilities["bonus"] = {"N/A"}; --iStableMasterDB["SpecializationAbilities"][l_talent]; 

		--iStableMasterStableDB["Petslots"]["Slot"..i] = petSlot;
			if(nil ~= l_icon) then else l_icon = "N/A" end
			if(nil ~= l_name) then else l_name = "N/A" end
			if(nil ~= l_level) then else l_level = "N/A" end
			if(nil ~= l_family) then else l_family = "N/A" end
			if(nil ~= l_talent) then else l_talent = "N/A" end
			if(nil ~= l_abilities["talent"]) then else l_abilities["talent"] = {"N/A"}; end
			if(nil ~= l_abilities["family"]) then else l_abilities["family"] = {"N/A"}; end		
			if(nil ~= l_abilities["bonus"]) then else l_abilities["bonus"] = {"N/A"}; end			

			local l_favourite = false;
			local l_inStables = true;
			if(ScrollFrameArrElem ~= nil) then 
				if(ScrollFrameArrElem["ScrollElementChild"..i] ~= nil) then
					if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] ~= nil) then
						if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] ~= nil) then
							iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["favourite"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"];
							l_inStables = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] or false;
						end
					end
				end
			end
			if(nil ~= l_favourite) then else l_favourite = false end
			if(nil ~= l_inStables) then else l_inStables = true end
			l_favourite = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["favourite"]; -- somehow this is what prevents overwriting the favourite status with false.
		iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot] = {icon = l_icon, name = l_name, level = l_level, family = l_family, talent = l_talent, favourite = l_favourite, inStables = l_inStables, Slot = i,  abilities = l_abilities};
		end

end
end




--hooksecurefunc("PetStable_OnEvent", function(...) SavePetInfoToWTF() end);
function PostCollectionsLoad() 
HookTab();
InitFilters();
InitSorts();
--StablesCollection_OnLoad(StablesCollection);
if(CollectionsJournal.selectedTab == iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["TabId"]) then StablesToggleButtonTextUpdate() end

hooksecurefunc("CollectionsJournal_UpdateSelectedTab", function()
			if(StablesCollection:IsShown()) then
				StablesCollection_Hide();
			end 
			
end );
end
if( iStableMasterStableDB == nil) then
iStableMasterStableDB = {};	
--iStableMasterStableDB["Petslots"] = {};
iStableMasterStableDB["PetInfo"] = {};
InitPetInfoToWTF();
else
InitPetInfoToWTF();
-- local iStableMasterStableDB = iStableMasterStableDB;
end

function iStableMaster:OnInitialize()
		-- Called when the addon is loaded

		-- Print a message to the chat frame
		self:Print("Version Number: Alpha V0.33, Please report bugs via https://www.curseforge.com/wow/addons/istablemaster/issues Any new feature requests should be requested in the same place as bug reports. You can see known issues here: https://www.curseforge.com/wow/addons/istablemaster/files ");
		


		
		

		
		

end

function iStableMaster:OnEnable()
		-- Called when the addon is enabled

		-- Print a message to the chat frame
		--self:Print("OnEnable Event Fired: Hello, again ;)");

		--self:Print(tonumber(GetCVar("petJournalTab")));
		if (not IsAddOnLoaded("Blizzard_Collections")) then



				LoadAddOn("Blizzard_Collections");


		end

		hooksecurefunc(_G["CollectionsJournal"],"Show", function()  PostCollectionsLoad()  end);
		hooksecurefunc(_G["PetStableFrame"],"Show", function()
		CollectionsJournal:SetAttribute("UIPanelLayout-pushable", 0)
		CollectionsJournal:SetAttribute("UIPanelLayout-allowOtherPanels", 1)
		PetStableFrame:SetAttribute("UIPanelLayout-pushable", 1)
		--PetStableFrame:SetAttribute("UIPanelLayout-pushable", 0)
		PetStableFrame:SetAttribute("UIPanelLayout-allowOtherPanels", 1)
		ShowUIPanel(CollectionsJournal)
		StablesCollectionsJournal_SetTab(CollectionsJournal,iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["TabId"]);
		PanelTemplates_SetTab(CollectionsJournal,iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["TabId"]);
		
		
		end);
		
		
end

function iStableMaster:OnDisable()
		-- Called when the addon is disabled




end










--StablesCollection:HookScript("OnEvent", function(self,event,...) if(event == "ADDON_LOADED") then SavePetInfoToWTF() end end);




function LoadPetInfoFromWTF(table,tableString)
		

	if (table == nil) then
	
	table = {};
	
	end

	



for i=1,205,1 do
		
		if(i < 6) then
		local petSlot = PetStable_GetPetSlot(i, true);

			if iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["icon"] ~= nil then
			table[tablestring..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["icon"];
			table[tablestring..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["name"];
			table[tablestring..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["level"];
			table[tablestring..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["family"];
			table[tablestring..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["talent"];
			table[tablestring..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["favourite"];
			table[tablestring..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["inStables"];
			table[tablestring..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["Slot"];
			table[tablestring..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["abilities"];
			--else
			--	local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);		
			--table[tablestring..i]["PetInfo"]["icon"] = l_icon;
			--table[tablestring..i]["PetInfo"]["name"] = l_name;
			--table[tablestring..i]["PetInfo"]["level"] = l_level;
			--table[tablestring..i]["PetInfo"]["family"] = l_family;
			--table[tablestring..i]["PetInfo"]["talent"] = l_talent;
			--table[tablestring..i]["PetInfo"]["favourite"] = false;
			--table[tablestring..i]["PetInfo"]["inStables"] = false;
			--table[tablestring..i]["PetInfo"]["Slot"] = i;
			--table[tablestring..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["abilities"];

			end
		
		else
		local petSlot = (i - 5);
		if iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["icon"] ~= nil then
			table[tablestring..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["icon"];
			table[tablestring..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["name"];
			table[tablestring..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["level"];
			table[tablestring..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["family"];
			table[tablestring..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["talent"];
			table[tablestring..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["favourite"];
			table[tablestring..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["inStables"];
			table[tablestring..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["Slot"];
			table[tablestring..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["abilities"];
			end
		end
end
end


