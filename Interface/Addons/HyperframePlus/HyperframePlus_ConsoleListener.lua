
-- Register Addon Table --
-------------------------- 
	local Addon = HyperframePlusAddon           -- Addon Table (Table)
    local AddonName = Addon.AddonName           -- Addon Name (String)
    local AddonFileName = Addon.AddonFileName   -- Addon File Name (String)



		local frame = CreateFrame("Frame", "HFP_ConsoleListenerFrame")

		frame:RegisterEvent("CONSOLE_MESSAGE")

		local searchStrings = {
			"Mem Budget:",
		}

		local function matchesSearchString(msg)
			for _, searchString in ipairs(searchStrings) do
				if string.find(msg, searchString) then
					return true
				end
			end
			return false
		end

		frame:SetScript("OnEvent", function(self, event, msg)
			if msg and matchesSearchString(msg) then
				print(msg)
			end
		end)