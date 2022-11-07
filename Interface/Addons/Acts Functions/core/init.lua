-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = {};
local variables = {};
local loadFrame = CreateFrame("FRAME");

--Create a sub-namespace for the global function.
namespace.functions = functions;
namespace.variables = variables;

--Slash command
SLASH_ACTFUNCTIONS1 = "/actfunctions"
SLASH_ACTFUNCTIONS2 = "/act"

SlashCmdList.ACTFUNCTIONS = function(msg)
	msg = string.lower(msg);
	local bag, slot;
	
	if msg == nil or msg == "" then 
		print("No command received.") 
		return
	end;
	
	if string.find(msg or "", "disenchant")then
		bag, slot = functions.disenchantScan();
	elseif string.find(msg or "", "prospecting") then
		bag, slot  = functions.prospectScan();
	elseif string.find(msg or "", "milling") then
		bag, slot  = functions.millScan();
	elseif string.find(msg or "", "lockpicking") then
		bag, slot = functions.itemScan("Lockbox");
	elseif string.find(msg or "", "track") then
		local track = UnitCreatureType("target");

		if UnitClass("player") == "Hunter"  then
			functions.hunterTrack(track);
		end

		return;
	elseif string.find(msg or "", "mount") then
		functions.mountUp();

		return;
	elseif string.find(msg or "", "config") then
		functions.toggleActConfig();

		return;
	elseif string.find(msg or "", "print") then
        for key, value in pairs(actSettings) do
			print(key);
			print(value);
		end

		print("");

		return;
	end

	if not (bag == nil or bag == "") then 
		print(GetContainerItemLink(bag, slot));
		EditMacro(msg, nil, nil, GetMacroBody(msg):gsub("(us[e]).*","%1 ".. bag .. " " .. slot));
	else
		print("Error");
		EditMacro(msg, nil, nil, GetMacroBody(msg):gsub("(us[e]).*","%1 "));
	end
end


-----------------------
-----EVENT HANDLING----
-----------------------


loadFrame:RegisterEvent("ADDON_LOADED");
loadFrame:SetScript("OnEvent", function(self, event, ...)
	local arg1,arg2,arg3,arg4 = ...;
    if event == "ADDON_LOADED" and arg1 == "Acts Functions" then

        ------------
        --Settings--
        ------------

		if actSettings == nil then
			actSettings = {};
		end

		if actSettings.minIlvl == nil then
			actSettings.minIlvl = 210;
		end

		if actSettings.deArmor == nil then
			actSettings.deArmor = true;
		end

		if actSettings.deWeapon == nil then
			actSettings.deWeapon = true;
		end

		if actSettings.minQuality == nil then
			actSettings.minQuality = 2;
		end

		if actSettings.maxQuality == nil then
			actSettings.maxQuality = 2;
		end


        ------------
        ---Mounts---
        ------------

		if actMounts == nil then
			actMounts = {};
		end

		if actMounts.dragonFlyingMount == nil then
			actMounts.dragonFlyingMount = 1589; --Renewed Proto-Drake
		end

		if actMounts.defaultMount == nil then
			actMounts.defaultMount = 1222; --Vulpine Familiar
		end

		if actMounts.groundMount == nil then
			actMounts.groundMount = 1222; --Vulpine Familiar
		end

		if actMounts.altMount == nil then
			actMounts.altMount = 1039; --Brutosaur
		end

		if actMounts.ctrlMount == nil then
			actMounts.ctrlMount = 460; --Yak
		end

		if actMounts.shiftMount == nil then
			actMounts.shiftMount = 407; --Sandstone Drake
		end

		if actMounts.dragonFlyingMountBool == nil then
			actMounts.dragonFlyingMountBool = true;
		end

		if actMounts.defaultMountBool == nil then
			actMounts.defaultMountBool = true;
		end

		if actMounts.groundMountBool == nil then
			actMounts.groundMountBool = false;
		end

		if actMounts.altMountBool == nil then
			actMounts.altMountBool = false;
		end

		if actMounts.ctrlMountBool == nil then
			actMounts.ctrlMountBool = false;
		end

		if actMounts.shiftMountBool == nil then
			actMounts.shiftMountBool = false;
		end

		loadFrame:UnregisterEvent("ADDON_LOADED");
	end
end);
