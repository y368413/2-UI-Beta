-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = namespace.functions;
local variables = namespace.variables;


variables.dragonFlyingZones =
{
    [2112] = true, --Valdrakken
    [2023] = true, --Ohn'ahran Plains
    [2025] = true, --Thaldraszus
    [2022] = true, --The Waking Shores
    [2024] = true, --The Azure Span
};

variables.itemQuality = {
	{
		name = "|cFF00FF00Uncommon|r",
		number = 2
	},
	{
		name = "|cFF0000FFRare|r",
		number = 3
	},
	{
		name = "|cFFA335EEEpic|r",
		number = 4
	}
};

variables.trackingArray = {
	Beast = 0,
	Demon = 0,
	Dragonkin = 0,
	Elemental = 0,
	Giant = 0,
	Humanoid = 0,
	Mechanical = 0,
	Undead = 0
}
