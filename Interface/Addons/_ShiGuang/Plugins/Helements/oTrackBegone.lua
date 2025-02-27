--## Version: v4 ## Author: Coremar
-- Global Chat Message Function
function OtbMsg(msg) DEFAULT_CHAT_FRAME:AddMessage(tostring(msg):gsub("|1","|cffffff80"):gsub("|2","|cffffffff"),0.5,0.75,1.0); end
local OTBdisable = ObjectiveTrackerFrame:GetScript("OnShow");
local debugCounter = 0;
local modName = "Objective Tracker Begone"

-- Main Functions --
--------------------
-------------------------------------------------------------------------
-- Auto Hide
local function OnObjectiveTrackerShow(self)
	if (stopHiding == true) then
		ObjectiveTrackerFrame:Show();
		ObjectiveTrackerFrame:SetScript("OnShow", OTBdisable);
		print("|cffb4ff00OTB:|r Showing Objective tracker!");
		return;
	end;
	debugCounter = debugCounter+1;
	if showDebug then
	print("|cffb4ff00OTB_Debug:|r Objective Tracker tried to show up! Hiding it now!");
    print("|cffb4ff00OTB_Debug:|r It already happened", debugCounter, "times!");
	end
	ObjectiveTrackerFrame:Hide();
end;

-- Hook
local function HookTracker()
	stopHiding=false;
    ObjectiveTrackerFrame:Hide();
    ObjectiveTrackerFrame:HookScript("OnShow", OnObjectiveTrackerShow)
end
-- Start
HookTracker()
-------------------------------------------------------------------------

local function OnOffSwitch()
	if stopHiding == false then
		stopHiding = true;
		ObjectiveTrackerFrame:Show();
	else if stopHiding == true then
		print("|cffb4ff00OTB:|r Hiding Objective tracker!");
		stopHiding = false;
		HookTracker();
	end
	end
end

-- slash commands --
--------------------
local DefaultConfig = {
	stopHiding = false,		-- when true it will show the objective tracker
	showDebug = false,      -- when true it will show the chat messages
};
local cfg = DefaultConfig;

local slashCommands = {
		--  Toggle on/off
	" |2/otb switch|r = Toggles the objective tracker on or off",
	switch = function(cmd)
		OnOffSwitch();
	end,
	    --  Count
	" |2/otb count|r = Prints the current count of Objective Tracker showing up attempts",
	count = function(cmd)
    print("|cffb4ff00OTB:|r Objective Tracker tried to show up", debugCounter, "times!")
	end,
		--  Debug
	" |2/otb debug|r = Toggles the debug chat messages and counter",
	debug = function(cmd)
	showDebug = not showDebug
	end,
		-- Show
	" |2/otb show|r = Enables the objective tracker(legacy)",
	show = function(cmd)
		stopHiding = true;
		ObjectiveTrackerFrame:Show();
	end,
		--  Hide
	" |2/otb hide|r = Disables the objective tracker(legacy)",
	hide = function(cmd)
		print("|cffb4ff00OTB:|r Hiding Objective tracker!");
		stopHiding = false;
		HookTracker();
	end,
};
local function HandleSlashCommand(cmd,commandTable)
	-- Extract Parameters
	local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
	param1 = (param1 and param1:lower() or cmd:lower());
	-- Check Param Function
	if (commandTable[param1]) then
		commandTable[param1](param2)
	-- Invalid or No Command
	else
		OtbMsg("Objective Tracker Begone!");
		OtbMsg("The following |2commands|r are valid for this addon:");
		for index, help in ipairs(commandTable) do
			OtbMsg(help);
		end
	end
end

_G["SLASH_"..modName.."1"] = "/otb";
_G["SLASH_"..modName.."2"] = "/OTB";
SlashCmdList[modName] = function(cmd) HandleSlashCommand(cmd,slashCommands) end