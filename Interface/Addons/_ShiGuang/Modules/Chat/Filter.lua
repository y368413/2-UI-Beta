local M, R, U, I = unpack(select(2, ...))

--[[
	修改自NoGoldSeller，强迫症患者只能接受这个低占用的。
]]
local FilterList = {}
local function genFilterList()
	local keywords = {string.split(" ", MaoRUISettingDB["Chat"]["FilterList"] or "")}
	for _, value in pairs(keywords) do
		if value ~= "" then
			if not FilterList[value] then
				FilterList[value] = true
			end
		end
	end
end
M.genFilterList = genFilterList

local function genChatFilter(self, event, msg, author, _, _, _, flag)
	--if not MaoRUISettingDB["Chat"]["EnableFilter"] then return end

	local name = Ambiguate(author, "none")
	if UnitIsUnit(name, "player") then
		return
	elseif M.UnitInGuild(author) or UnitInRaid(author) or UnitInParty(author) then
		return
	elseif event == "CHAT_MSG_WHISPER" and flag == "GM" then
		return
	else
		for i = 1, GetNumFriends() do
			if author == GetFriendInfo(i) then
				return
			end
		end
		for i = 1, BNGetNumFriends() do
			local _, _, battleTag, _, charName, _, client = BNGetFriendInfo(i)
			if author == BNet_GetValidatedCharacterName(charName, battleTag, client) then
				return
			end
		end
	end

	for _, symbol in ipairs(I.Symbols) do
		msg = gsub(msg, symbol, "")
	end

	local match = 0
	for keyword, _ in pairs(FilterList) do
		local _, count = gsub(msg, keyword, "")
		if count > 0 then
			match = match + 1
		end
	end

	if match >= MaoRUISettingDB["Chat"]["Matches"] then
		return true
	end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", genChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", genChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", genChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", genChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_ADDON", genChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", genChatFilter)
-- Savedvariables Accountwide
local f = MaoRUI:EventFrame({"PLAYER_LOGIN", "PLAYER_LOGOUT"})
f:SetScript("OnEvent", function(self, event)
	if not MaoRUIDB["ChatFilter"] then MaoRUIDB["ChatFilter"] = "" end
	if not MaoRUIDB["Timestamp"] then MaoRUIDB["Timestamp"] = false end

	if event == "PLAYER_LOGIN" then
		MaoRUISettingDB["Chat"]["FilterList"] = MaoRUIDB["ChatFilter"]
		MaoRUISettingDB["Chat"]["Timestamp"] = MaoRUIDB["Timestamp"]
	elseif event == "PLAYER_LOGOUT" then
		MaoRUIDB["ChatFilter"] = MaoRUISettingDB["Chat"]["FilterList"]
		MaoRUIDB["Timestamp"] = MaoRUISettingDB["Chat"]["Timestamp"]
	end

	-- Timestamp
	local greyStamp = I.GreyColor.."[%H:%M:%S]|r "
	if MaoRUISettingDB["Chat"]["Timestamp"] then
		SetCVar("showTimestamps", greyStamp)
	else
		if GetCVar("showTimestamps") == greyStamp then
			SetCVar("showTimestamps", "none")
		end
	end
end)