--[[ quest_complete]]--
-- A notification trigger for quest objective commpletion

local frame = CreateFrame("Frame")
frame:RegisterEvent("QUEST_WATCH_UPDATE")
frame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
frame.queue = nil
frame:SetScript("OnEvent", function(self, event, unit)
	if event == "QUEST_WATCH_UPDATE" then
		frame.queue = unit
	elseif event == "UNIT_QUEST_LOG_CHANGED" and frame.queue and unit == "player" then
		local title, level, tag, header, collapsed, complete = GetQuestLogTitle(frame.queue)
		if complete then
			libnotify:ShowPopup(title, nil, nil, tag)  --title, level, nil, tag
			PlaySoundFile("Interface\\AddOns\\ShaguNotify\\textures\\complete.ogg", "Master")
		end
		frame.queue = nil
	end
end)