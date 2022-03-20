-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = {};
local loadFrame = CreateFrame("FRAME");

--Create a sub-namespace for the global function.
namespace.functions = functions;

--Slash command
SLASH_ACTFUNCTIONS1 = "/actfunctions"

SlashCmdList.ACTFUNCTIONS = function(msg)
	msg = string.lower(msg);
	local b, s;
	
	if msg == nil or msg == "" then 
		print("No command received.") 
		return 
	end;
	
	if string.find(msg or "", "disenchant")then
		b, s = functions.disenchantScan();
	elseif string.find(msg or "", "prospecting") then
		b, s  = functions.prospectScan();
	elseif string.find(msg or "", "milling") then
		b, s  = functions.millScan();
	elseif string.find(msg or "", "lockpicking") then
		b, s = functions.itemScan("Lockbox");
	elseif string.find(msg or "", "track") then
		local track = UnitCreatureType("target");
		if(UnitClass("player")=="Hunter") then
			functions.hunterTrack(track);
		end
		return;
	elseif string.find(msg or "", "mount") then
		functions.mountUp();
		return;
	elseif string.find(msg or "", "config") then
		functions.toggleActConfig();
		return;
	end
	
	if not (b == nil or b == "") then 
		print(GetContainerItemLink(b, s));
		EditMacro(msg,nil,nil,GetMacroBody(msg):gsub("(us[e]).*","%1 ".. b .. " " .. s));
	else 
		print("Error") 
		EditMacro(msg,nil,nil,GetMacroBody(msg):gsub("(us[e]).*","%1 "));
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

		if actMounts.defaultMountBool == nil then
			actMounts.defaultMountBool = true;
		end

		if actMounts.groundMountBool == nil then
			actMounts.groundMountBool = false;
		end

		if actMounts.altMountBool == nil then
			actMounts.altMountBool = true;
		end

		if actMounts.ctrlMountBool == nil then
			actMounts.ctrlMountBool = true;
		end

		if actMounts.shiftMountBool == nil then
			actMounts.shiftMountBool = true;
		end
		
		loadFrame:UnregisterEvent("ADDON_LOADED");
	end
end);
