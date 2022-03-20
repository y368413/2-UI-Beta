-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = namespace.functions;
local loadFrame = CreateFrame("FRAME");
local trackArr = {Beast=0,Demon=0,Dragonkin=0,Elemental=0,Giant=0,Humanoid=0,Mechanical=0,Undead=0}


-----------------------
--FUNCTION DEFINITIONS-
-----------------------


--Function for finding items to disenchant, they have to be disenchantable and over ilvl 230.
function functions.disenchantScan()
	for b=0,3 do 
		for s=1,GetContainerNumSlots(b)do 
			local j,l,q,i,_,c=GetItemInfo(GetContainerItemLink(b,s)or 0)
			if i then 
				if i>actSettings.minIlvl and q>=actSettings.minQuality and q<=actSettings.maxQuality then 
					if (c=="Weapon" and actSettings.deWeapon) or (c=="Armor" and actSettings.deArmor) then 
						return b, s;
					end
				end 
			end 
		end 
	end 
end

--Function for finding ores in the bag and check if there's 5 or more of it.
function functions.prospectScan() 
	for b=0,4 do 
		for s=1,GetContainerNumSlots(b) do 
			local t={GetItemInfo(GetContainerItemLink(b,s) or 0)}
			if t[7]=="Metal & Stone" and select(2,GetContainerItemInfo(b,s))>=5 then 
				return b, s;
			end 
		end 
	end 
end

--Function for finding ores in the bag and check if there's 5 or more of it.
function functions.millScan() 
	for b=0,4 do 
		for s=1,GetContainerNumSlots(b) do 
			local t={GetItemInfo(GetContainerItemLink(b,s) or 0)}
			if t[7]=="Herb" and select(2,GetContainerItemInfo(b,s))>=5 then 
				return b, s;
			end 
		end 
	end 
end

--Itemscanner function to check if there is an item in the bags that contains given string.
function functions.itemScan(name)
	for b=0,4,1 do 
		for s=1, GetContainerNumSlots(b), 1 do 
			local n=GetContainerItemLink(b,s);
			if n and string.find(n,name) then
				return b, s;
			end 
		end
	end
end

--Hunter tracking function.
function functions.hunterTrack(track)
	if(track ~= nil) then
		local id = trackArr[track]
		
		if(id ~= nil) then 
			local name,_,active = GetTrackingInfo(id);
			
			SetTracking(id, not active);
		end
	else
		table.foreach(
			trackArr, 
			function(k,v) 
				SetTracking(v, false) 
			end
		);
	end
end

--Arr value filling.
local function fillArr()
	local count = GetNumTrackingTypes();
	for i=1,count do 
		local name, texture, active, category = GetTrackingInfo(i);
		local s1,s2,s3 = strsplit(" ", name, 3);
		
		if category ~= "spell" or s1~="Track" then return end;
		
		if(s2 ~= nil) then
			if(string.match(s2,"s",-1)) then
				s2=s2:sub(1, -2);
			end
			
			table.foreach(
				trackArr,
				function(k,v)
					if(k == s2 and v ~= i) then
						trackArr[k] = i;
					end
				end
			);
		end
	end
end

--Mount function
function functions.mountUp()
	if(IsMounted()) then
		Dismount();
	elseif(IsControlKeyDown() and actMounts.ctrlMountBool) then
		C_MountJournal.SummonByID(actMounts.ctrlMount);
	elseif (IsAltKeyDown() and actMounts.altMountBool) then
		C_MountJournal.SummonByID(actMounts.altMount);
	elseif (IsShiftKeyDown() and actMounts.shiftMountBool) then 
		C_MountJournal.SummonByID(actMounts.shiftMount);
	elseif (not IsFlyableArea() and actMounts.groundMountBool) then
		C_MountJournal.SummonByID(actMounts.groundMount);
	elseif (actMounts.defaultMountBool) then
		C_MountJournal.SummonByID(actMounts.defaultMount);
	end
end


-----------------------
-----EVENT HANDLING----
-----------------------


loadFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
loadFrame:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then	
		fillArr();
		loadFrame:UnregisterEvent("PLAYER_ENTERING_WORLD");
	end
end);
