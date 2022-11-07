-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = namespace.functions;
local variables = namespace.variables;


-----------------------
--FUNCTION DEFINITIONS-
-----------------------


--Function for finding a mount ID by a given name.
function functions.getMountID(name)
	for _, v in pairs(C_MountJournal.GetMountIDs()) do
		local creatureName, _, _, _, _, _, _, _, _, _, _, mountID = C_MountJournal.GetMountInfoByID(v);
		if	creatureName == name then
			return mountID;
		end
	end
end

--Function for checking if a mount ID is valid.
function functions.knownMount(mountID)
	if not mountID then
		return false;
	end

	local _, _, _, _, isUsable, _, _, _, _, _, isCollected = C_MountJournal.GetMountInfoByID(mountID);

	return isCollected and isUsable;
end

--Mount function
function functions.mountUp()
	if IsMounted() then
		Dismount();
	elseif
		IsControlKeyDown() and
		actMounts.ctrlMountBool and
		functions.knownMount(actMounts.ctrlMount)
	then
		C_MountJournal.SummonByID(actMounts.ctrlMount);

	elseif
		IsAltKeyDown() and
		actMounts.altMountBool and
		functions.knownMount(actMounts.altMount)
	then
		C_MountJournal.SummonByID(actMounts.altMount);

	elseif
		IsShiftKeyDown() and
		actMounts.shiftMountBool and
		functions.knownMount(actMounts.shiftMount)
	then
		C_MountJournal.SummonByID(actMounts.shiftMount);

	elseif
		variables.dragonFlyingZones[C_Map.GetBestMapForUnit("player")] and
		actMounts.dragonFlyingMountBool and
		functions.knownMount(actMounts.dragonFlyingMount)
	then
		C_MountJournal.SummonByID(actMounts.dragonFlyingMount);

	elseif
		not IsFlyableArea() and
		actMounts.groundMountBool and
		functions.knownMount(actMounts.groundMount)
	then
		C_MountJournal.SummonByID(actMounts.groundMount);

	elseif actMounts.defaultMountBool then
		C_MountJournal.SummonByID(actMounts.defaultMount);

    else
        print("No registered mounts are available.");
	end
end

--Function for finding items to disenchant, they have to be disenchantable and over ilvl 230.
function functions.disenchantScan()
	for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		for slot = 1, GetContainerNumSlots(bag) do
			local itemTable = {GetItemInfo(GetContainerItemLink(bag, slot) or 0)}

			if itemTable[4] then
				if
					itemTable[4] > actSettings.minIlvl and
					itemTable[3] >= actSettings.minQuality and
					itemTable[3] <= actSettings.maxQuality and
					(itemTable[6] == "Weapon" and actSettings.deWeapon) or (itemTable[6] =="Armor" and actSettings.deArmor)
				then
					return bag, slot;
				end
			end
		end
	end
end

--Function for finding ores in the bag and check if there's 5 or more of it.
function functions.prospectScan()
	for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local itemTable = {GetItemInfo(C_Container.GetContainerItemLink(bag, slot) or 0)}

			if itemTable[7] == "Metal & Stone" and select(2, C_Container.GetContainerItemInfo(bag,slot)) >= 5 then
				return bag, slot;
			end
		end
	end
end

--Function for finding ores in the bag and check if there's 5 or more of it.
function functions.millScan()
	for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local itemTable = {GetItemInfo(C_Container.GetContainerItemLink(bag, slot) or 0)}

			if itemTable[7] == "Herb" and select(2, C_Container.GetContainerItemInfo(bag, slot)) >= 5 then
				return bag, slot;
			end
		end
	end
end

--Itemscanner function to check if there is an item in the bags that contains given string.
function functions.itemScan(name)
	for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
		for slot = 1, C_Container.GetContainerNumSlots(bag) do
			local itemName = C_Container.GetContainerItemLink(bag, slot);

			if itemName and string.find(itemName, name) then
				return bag, slot;
			end
		end
	end
end

--Hunter tracking function.
function functions.hunterTrack(track)
	if track ~= nil then
		local id = variables.trackingArray[track];

		if id ~= nil then
			local trackingInfo = {C_Minimap.GetTrackingInfo(id)};

			C_Minimap.SetTracking(id, not trackingInfo[3]);
		end
	else
		table.foreach(
			variables.trackingArray,
			function(key, value)
				C_Minimap.SetTracking(value, false);
			end
		);
	end
end
