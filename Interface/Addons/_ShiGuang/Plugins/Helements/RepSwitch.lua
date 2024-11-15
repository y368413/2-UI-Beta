--## Author: Ne0nguy  ## Version: 11.0.2.28
RepSwitch = {};
RepSwitch.lastupdate = 0;
RepSwitch.lastamount = 0;
local _,_,_,tocversion = GetBuildInfo();

function RepSwitch.OnEvent(_, event, arg1)
	if(event == "COMBAT_TEXT_UPDATE" and arg1 == "FACTION") then
		local faction, amount = GetCurrentCombatTextEventInfo()
		--print(faction);
		--print(amount);
		if (faction ~= "Guild") then
			if (amount > RepSwitch.lastamount) or (time() > RepSwitch.lastupdate) then
				C_Reputation.ExpandAllFactionHeaders();
				for i=1,C_Reputation.GetNumFactions() do
					local repData = C_Reputation.GetFactionDataByIndex(i);
					if repData and faction == repData.name then
						--print(repData.name);
						--print(i);
						C_Reputation.SetWatchedFactionByIndex(i);
					end
				end
			end
			RepSwitch.lastamount = amount;
			RepSwitch.lastupdate = time();
		end
	end
end

RepSwitch.frame = CreateFrame("Frame", nil, UIParent);
RepSwitch.frame:RegisterEvent("COMBAT_TEXT_UPDATE");
RepSwitch.frame:SetScript("OnEvent", RepSwitch.OnEvent);
