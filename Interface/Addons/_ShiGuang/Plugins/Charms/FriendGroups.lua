--## Author: Mikeprod  ## Version: 8.2.5
local hooks = {}

local function Hook(source, target, secure)
	hooks[source] = _G[source]
	if secure then
		hooksecurefunc(source, target)
	else
		_G[source] = target
	end
end

local FRIENDS_GROUP_NAME_COLOR = NORMAL_FONT_COLOR

local INVITE_RESTRICTION_NO_GAME_ACCOUNTS = 0;
local INVITE_RESTRICTION_CLIENT = 1;
local INVITE_RESTRICTION_LEADER = 2;
local INVITE_RESTRICTION_FACTION = 3;
local INVITE_RESTRICTION_REALM = 4;
local INVITE_RESTRICTION_INFO = 5;
local INVITE_RESTRICTION_WOW_PROJECT_ID = 6;
local INVITE_RESTRICTION_WOW_PROJECT_MAINLINE = 7;
local INVITE_RESTRICTION_WOW_PROJECT_CLASSIC = 8;
local INVITE_RESTRICTION_NONE = 9;
local INVITE_RESTRICTION_MOBILE = 10;

local ONE_YEAR = 12 * 30 * 24 * 60 * 60
local FriendButtons = { count = 0 }
local GroupCount = 0
local GroupTotal = {}
local GroupOnline = {}
local GroupSorted = {}
local FriendRequestString = string.sub(FRIEND_REQUESTS,1,-5)
local FriendsScrollFrame
local FriendButtonTemplate

if FriendsListFrameScrollFrame then
	FriendsScrollFrame = FriendsListFrameScrollFrame
	FriendButtonTemplate = "FriendsListButtonTemplate"
else
	FriendsScrollFrame = FriendsFrameFriendsScrollFrame
	FriendButtonTemplate = "FriendsFrameButtonTemplate"
end

--[[local function ClassColourCode(class,table)
	local initialClass = class
	for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
		if class == v then
			class = k
			break
		end
	end
	if class == initialClass then
		for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
			if class == v then
				class = k
				break
			end
		end
	end
	if table then
		return RAID_CLASS_COLORS[class]
	else
		local colour = RAID_CLASS_COLORS[class]
		return string.format("|cFF%02x%02x%02x", colour.r*255, colour.g*255, colour.b*255)
	end
end]]
local ClassList = {}
for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	ClassList[v] = k
end
local ClassColors = {}
local colors = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
for class, value in pairs(colors) do
	ClassColors[class] = {}
	ClassColors[class].r = value.r
	ClassColors[class].g = value.g
	ClassColors[class].b = value.b
	ClassColors[class].colorStr = value.colorStr
end

local function ClassColourCode(class, showRGB)
	local color = ClassColors[ClassList[class] or class]
	if not color then color = ClassColors["PRIEST"] end

	if showRGB then
		return color.r, color.g, color.b
	else
		return "|c"..color.colorStr
	end
end

local function FriendGroups_GetTopButton(offset)
	local usedHeight = 0
	for i = 1, FriendButtons.count do
		local buttonHeight = FRIENDS_BUTTON_HEIGHTS[FriendButtons[i].buttonType]
		if ( usedHeight + buttonHeight >= offset ) then
			return i - 1, offset - usedHeight
		else
			usedHeight = usedHeight + buttonHeight
		end
	end
	return 0,0
end

local function GetOnlineInfoText(client, isMobile, rafLinkType, locationText)
	if not locationText or locationText == "" then
		return UNKNOWN
	end
	if isMobile then
		return LOCATION_MOBILE_APP
	end
	if (client == BNET_CLIENT_WOW) and (rafLinkType ~= Enum.RafLinkType.None) and not isMobile then
		if rafLinkType == Enum.RafLinkType.Recruit then
			return RAF_RECRUIT_FRIEND:format(locationText)
		else
			return RAF_RECRUITER_FRIEND:format(locationText)
		end
	end
	return locationText
end

local function GetFriendInfoById(id)
	local accountName, characterName, class, level, isFavoriteFriend, isOnline, bnetAccountId, client, canCoop, wowProjectID, lastOnline,	isAFK, isGameAFK, isDND, isGameBusy, mobile, zoneName
	if C_BattleNet and C_BattleNet.GetFriendAccountInfo then
		local accountInfo = C_BattleNet.GetFriendAccountInfo(id)
		if accountInfo then
			accountName = accountInfo.accountName
			isFavoriteFriend = accountInfo.isFavorite
			bnetAccountId = accountInfo.bnetAccountID
			canCoop = CanCooperateWithGameAccount(accountInfo)
			isAFK = accountInfo.isAFK
			isGameAFK = accountInfo.isGameAFK
			isDND = accountInfo.isDND
			isGameBusy = accountInfo.isGameBusy
			mobile = accountInfo.isWowMobile
			zoneName = accountInfo.areaName
			lastOnline = accountInfo.lastOnlineTime

			local gameAccountInfo = accountInfo.gameAccountInfo

			if gameAccountInfo then
				isOnline = gameAccountInfo.isOnline
				characterName = gameAccountInfo.characterName
				class = gameAccountInfo.className
				level = gameAccountInfo.characterLevel
				client = gameAccountInfo.clientProgram
				wowProjectID = gameAccountInfo.wowProjectID
			end
		end
	else
		bnetIDAccount, accountName, _, _, characterName, bnetIDGameAccount, client, 
		isOnline, lastOnline, isAFK, isDND, _, _, _, _, wowProjectID, _, _, 
		isFavorite, mobile = BNGetFriendInfo(id)
	end

	return accountName, characterName, class, level, isFavoriteFriend, isOnline, bnetAccountId, client, canCoop, wowProjectID, lastOnline, isAFK, isGameAFK, isDND, isGameBusy, mobile, zoneName
end

local function FriendGroups_GetBNetButtonNameText(accountName, characterName, class, level)
	local nameText

	-- set up player name and character name
	if accountName then
		nameText = accountName
	else
		nameText = UNKNOWN
	end

	-- append character name
	if characterName then
		local characterNameSuffix
		if not level then
			characterNameSuffix = ""
		else
			characterNameSuffix= level.." "
		end

		local coopLabel = ""
		if not canCoop then
			coopLabel = CANNOT_COOPERATE_LABEL
		end
		if client == BNET_CLIENT_WOW then
			local nameColor = ClassColourCode(class) or FRIENDS_WOW_NAME_COLOR
			nameText = nameText.." "..nameColor.."("..characterNameSuffix..coopLabel..characterName..")"..FONT_COLOR_CODE_CLOSE
		else
			if ENABLE_COLORBLIND_MODE == "1" then
				characterName = characterName..coopLabel
			end
			local characterNameAndLevel = characterNameSuffix..characterName
			nameText = nameText.." "..FRIENDS_OTHER_NAME_COLOR_CODE.."("..characterNameAndLevel..")"..FONT_COLOR_CODE_CLOSE
		end
	end

	return nameText
end

local function FriendGroups_UpdateFriendButton(button)
	--local function CampIcon(CampGroup)                   ---DIY by y368413
		--if ( CampGroup == "Alliance" ) then return "Interface\\TargetingFrame\\UI-PVP-ALLIANCE"
		--elseif ( CampGroup == "Horde" ) then return "Interface\\TargetingFrame\\UI-PVP-HORDE"
		--else return ""
		--end
	--end
	local index = button.index
	button.buttonType = FriendButtons[index].buttonType
	button.id = FriendButtons[index].id
	local height = FRIENDS_BUTTON_HEIGHTS[button.buttonType]
	local nameText, nameColor, infoText, isFavoriteFriend, statusTexture
	local hasTravelPassButton = false
	if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
		local info = C_FriendList.GetFriendInfoByIndex(FriendButtons[index].id)
		if info.connected then
			button.background:SetColorTexture(FRIENDS_WOW_BACKGROUND_COLOR.r, FRIENDS_WOW_BACKGROUND_COLOR.g, FRIENDS_WOW_BACKGROUND_COLOR.b, FRIENDS_WOW_BACKGROUND_COLOR.a)
			if info.afk then
				button.status:SetTexture(FRIENDS_TEXTURE_AFK)
			elseif info.dnd then
				button.status:SetTexture(FRIENDS_TEXTURE_DND)
			else
				button.status:SetTexture(FRIENDS_TEXTURE_ONLINE)
			end
			nameColor = ClassColourCode(info.className,true)  --nameColor = FRIENDS_WOW_NAME_COLOR
			nameText = info.name..", "..format(FRIENDS_LEVEL_TEMPLATE, info.level, info.className)
			infoText = GetOnlineInfoText(BNET_CLIENT_WOW, info.mobile, info.rafLinkType, info.area)
		else
			button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a)
			button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE)
			nameText = info.name
			nameColor = FRIENDS_GRAY_COLOR
			infoText = FRIENDS_LIST_OFFLINE
		end
		button.gameIcon:Hide()
		button.summonButton:ClearAllPoints()
		button.summonButton:SetPoint("TOPRIGHT", button, "TOPRIGHT", 1, -1)
		FriendsFrame_SummonButton_Update(button.summonButton)
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then
		local accountInfo = C_BattleNet.GetFriendAccountInfo(FriendListEntries[index].id);
		if accountInfo then
			nameText, nameColor, statusTexture = FriendsFrame_GetBNetAccountNameAndStatus(accountInfo);
			isFavoriteFriend = accountInfo.isFavorite;

			button.status:SetTexture(statusTexture);

			if accountInfo.gameAccountInfo.isOnline then
				button.background:SetColorTexture(FRIENDS_BNET_BACKGROUND_COLOR.r, FRIENDS_BNET_BACKGROUND_COLOR.g, FRIENDS_BNET_BACKGROUND_COLOR.b, FRIENDS_BNET_BACKGROUND_COLOR.a);

				if ShowRichPresenceOnly(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.wowProjectID, accountInfo.gameAccountInfo.factionName, accountInfo.gameAccountInfo.realmID) then
					infoText = GetOnlineInfoText(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.isWowMobile, accountInfo.rafLinkType, accountInfo.gameAccountInfo.richPresence);
				else
					infoText = GetOnlineInfoText(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.isWowMobile, accountInfo.rafLinkType, accountInfo.gameAccountInfo.areaName);
				end

				button.gameIcon:SetTexture(BNet_GetClientTexture(accountInfo.gameAccountInfo.clientProgram));

				local fadeIcon = (accountInfo.gameAccountInfo.clientProgram == BNET_CLIENT_WOW) and (accountInfo.gameAccountInfo.wowProjectID ~= WOW_PROJECT_ID);
				if fadeIcon then
					button.gameIcon:SetAlpha(0.6);
				else
					button.gameIcon:SetAlpha(1);
				end

				--Note - this logic should match the logic in FriendsFrame_ShouldShowSummonButton

			local shouldShowSummonButton = FriendsFrame_ShouldShowSummonButton(button.summonButton)
			button.gameIcon:SetShown(not shouldShowSummonButton)

				-- travel pass
				hasTravelPassButton = true;
				local restriction = FriendsFrame_GetInviteRestriction(button.id);
				if restriction == INVITE_RESTRICTION_NONE then
					button.travelPassButton:Enable();
				else
					button.travelPassButton:Disable();
				end
			else
				button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a);
				button.gameIcon:Hide();
				infoText = FriendsFrame_GetLastOnlineText(accountInfo);
			end
		end
		button.summonButton:ClearAllPoints()
		button.summonButton:SetPoint("CENTER", button.gameIcon, "CENTER", 1, 0)
		FriendsFrame_SummonButton_Update(button.summonButton)
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER ) then
		local title
		local group = FriendButtons[index].text
		if group == "" or not group then
			title = "[ 2 UI ]"
		else
			title = group
		end
		local counts = "[" .. GroupOnline[group] .. "/" .. GroupTotal[group] .. "]"

		if button["text"] then
			button.text:SetText(title)
			button.text:Show()
			nameText = counts
		else
			nameText = title.."          "..counts
		end
		nameColor = FRIENDS_GROUP_NAME_COLOR
		button.name:SetJustifyH("RIGHT")

		if ShiGuangDB["FriendGroupsCollapsed"][group] then
			button.status:SetTexture("Interface\\Buttons\\UI-PlusButton-UP")
		else
			button.status:SetTexture("Interface\\Buttons\\UI-MinusButton-UP")
		end
		infoText = group
		button.info:Hide()
		button.gameIcon:Hide()
		button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a)
		button.background:SetAlpha(0.5)
		local scrollFrame = FriendsScrollFrame
		local divider = scrollFrame.dividerPool:Acquire()
		divider:SetParent(scrollFrame.ScrollChild)
		divider:SetAllPoints(button)
		divider:Show()
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_INVITE_HEADER ) then
		local header = FriendsScrollFrame.PendingInvitesHeaderButton
		header:SetPoint("TOPLEFT", button, 1, 0)
		header:Show()
		header:SetFormattedText(FRIEND_REQUESTS, BNGetNumFriendInvites())
		local collapsed = GetCVarBool("friendInvitesCollapsed")
		if ( collapsed ) then
			header.DownArrow:Hide()
			header.RightArrow:Show()
		else
			header.DownArrow:Show()
			header.RightArrow:Hide()
		end
		nameText = nil
	elseif ( button.buttonType == FRIENDS_BUTTON_TYPE_INVITE ) then
		local scrollFrame = FriendsScrollFrame
		local invite = scrollFrame.invitePool:Acquire()
		invite:SetParent(scrollFrame.ScrollChild)
		invite:SetAllPoints(button)
		invite:Show()
		local inviteID, accountName = BNGetFriendInviteInfo(button.id)
		invite.Name:SetText(accountName)
		invite.inviteID = inviteID
		invite.inviteIndex = button.id
		nameText = nil
	end
	-- travel pass?
	if ( hasTravelPassButton ) then
		button.travelPassButton:Show()
	else
		button.travelPassButton:Hide()
	end
	-- selection
	if ( FriendsFrame.selectedFriendType == FriendButtons[index].buttonType and FriendsFrame.selectedFriend == FriendButtons[index].id ) then
		button:LockHighlight()
	else
		button:UnlockHighlight()
	end
	-- finish setting up button if it's not a header
	if ( nameText ) then
		if button.buttonType ~= FRIENDS_BUTTON_TYPE_DIVIDER then
		if button["text"] then
			button.text:Hide()
		end
			button.name:SetJustifyH("LEFT")
			button.background:SetAlpha(1)
			button.info:Show()
		end
		button.name:SetText(nameText)
		button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
		button.info:SetText(infoText)
		button:Show()
		if isFavoriteFriend and button.Favorite then
			button.Favorite:Show()
			button.Favorite:ClearAllPoints()
			button.Favorite:SetPoint("TOPLEFT", button.name, "TOPLEFT", button.name:GetStringWidth(), 0)
		elseif button.Favorite then
			button.Favorite:Hide()
		end
	else
		button:Hide()
	end
	-- update the tooltip if hovering over a button
	if (FriendsTooltip.button == button) or (GetMouseFocus() == button) then
		button:OnEnter()
	end
	return height
end

local function FriendGroups_UpdateFriends()
	local scrollFrame = FriendsScrollFrame
	local offset = HybridScrollFrame_GetOffset(scrollFrame)
	local buttons = scrollFrame.buttons
	local numButtons = #buttons
	local numFriendButtons = FriendButtons.count

	local usedHeight = 0

	scrollFrame.dividerPool:ReleaseAll()
	scrollFrame.invitePool:ReleaseAll()
	scrollFrame.PendingInvitesHeaderButton:Hide()
	for i = 1, numButtons do
		local button = buttons[i]
		local index = offset + i
		if ( index <= numFriendButtons ) then
			button.index = index
			local height = FriendGroups_UpdateFriendButton(button)
			button:SetHeight(height)
			usedHeight = usedHeight + height
		else
			button.index = nil
			button:Hide()
		end
	end
	HybridScrollFrame_Update(scrollFrame, scrollFrame.totalFriendListEntriesHeight, usedHeight)

	if hooks["FriendsFrame_UpdateFriends"] then
		hooks["FriendsFrame_UpdateFriends"]()
	end

	-- Delete unused groups in the collapsed part
	for key,_ in pairs(ShiGuangDB["FriendGroupsCollapsed"]) do
		if not GroupTotal[key] then
			ShiGuangDB["FriendGroupsCollapsed"][key] = nil
		end
	end
end

local function FillGroups(groups, note, ...)
	wipe(groups)
	local n = select('#', ...)
	for i = 1, n do
		local v = select(i, ...)
		v = strtrim(v)
		groups[v] = true
	end
	if n == 0 then
		groups[""] = true
	end
	return note
end

local function NoteAndGroups(note, groups)
	if not note then
		return FillGroups(groups, "")
	end
	if groups then
		return FillGroups(groups, strsplit("#", note))
	end
	return strsplit("#", note)
end

local function CreateNote(note, groups)
	local value = ""
	if note then
		value = note
	end
	for group in pairs(groups) do
		value = value .. "#" .. group
	end
	return value
end

local function IncrementGroup(group, online)
	if not GroupTotal[group] then
		GroupCount = GroupCount + 1
		GroupTotal[group] = 0
		GroupOnline[group] = 0
	end
	GroupTotal[group] = GroupTotal[group] + 1
	if online then
		GroupOnline[group] = GroupOnline[group] + 1
	end
end

local function FriendGroups_Update(forceUpdate)
	local numBNetTotal, numBNetOnline, numBNetFavorite, numBNetFavoriteOnline = BNGetNumFriends()
	local numBNetOffline = numBNetTotal - numBNetOnline
	local numBNetFavoriteOffline = numBNetFavorite - numBNetFavoriteOnline
	local numWoWTotal = C_FriendList.GetNumFriends()
	local numWoWOnline = C_FriendList.GetNumOnlineFriends()
	local numWoWOffline = numWoWTotal - numWoWOnline

	QuickJoinToastButton:UpdateDisplayedFriendCount()
	if ( not FriendsListFrame:IsShown() and not forceUpdate) then
		return
	end

	wipe(FriendButtons)
	wipe(GroupTotal)
	wipe(GroupOnline)
	wipe(GroupSorted)
	GroupCount = 0

	local BnetFriendGroups = {}
	local WowFriendGroups = {}
	local FriendReqGroup = {}

	local buttonCount = 0

	FriendButtons.count = 0
	local addButtonIndex = 0
	local totalButtonHeight = 0
	local function AddButtonInfo(buttonType, id)
		addButtonIndex = addButtonIndex + 1
		if ( not FriendButtons[addButtonIndex] ) then
			FriendButtons[addButtonIndex] = { }
		end
		FriendButtons[addButtonIndex].buttonType = buttonType
		FriendButtons[addButtonIndex].id = id
		FriendButtons.count = FriendButtons.count + 1
		totalButtonHeight = totalButtonHeight + FRIENDS_BUTTON_HEIGHTS[buttonType]
	end

	-- invites
	local numInvites = BNGetNumFriendInvites()
	if ( numInvites > 0 ) then
		for i = 1, numInvites do
			if not FriendReqGroup[i] then
				FriendReqGroup[i] = {}
			end
			IncrementGroup(FriendRequestString,true)
			NoteAndGroups(nil, FriendReqGroup[i])
			if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_INVITE, i)
			end
		end
		
	end

	-- favorite friends online
	for i = 1, numBNetFavoriteOnline do
		if not BnetFriendGroups[i] then
			BnetFriendGroups[i] = {}
		end
		local noteText = select(13,BNGetFriendInfo(i))
		NoteAndGroups(noteText, BnetFriendGroups[i])
		for group in pairs(BnetFriendGroups[i]) do
			IncrementGroup(group, true)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, i)
			end
		end
	end
	--favorite friends offline
	for i = 1, numBNetFavoriteOffline do
		local j = i + numBNetFavoriteOnline
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- online Battlenet friends
	for i = 1, numBNetOnline - numBNetFavoriteOnline do
		local j = i + numBNetFavorite
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group, true)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- online WoW friends
	for i = 1, numWoWOnline do
		if not WowFriendGroups[i] then
			WowFriendGroups[i] = {}
		end
		local note = C_FriendList.GetFriendInfoByIndex(i) and C_FriendList.GetFriendInfoByIndex(i).notes
		NoteAndGroups(note, WowFriendGroups[i])
		for group in pairs(WowFriendGroups[i]) do
			IncrementGroup(group, true)
			if not ShiGuangDB["FriendGroupsCollapsed"][group] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i)
			end
		end
	end
	-- offline Battlenet friends
	for i = 1, numBNetOffline - numBNetFavoriteOffline do
		local j = i + numBNetFavorite + numBNetOnline - numBNetFavoriteOnline
		if not BnetFriendGroups[j] then
			BnetFriendGroups[j] = {}
		end
		local noteText = select(13,BNGetFriendInfo(j))
		NoteAndGroups(noteText, BnetFriendGroups[j])
		for group in pairs(BnetFriendGroups[j]) do
			IncrementGroup(group)
			 if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, j)
			end
		end
	end
	-- offline WoW friends
	for i = 1, numWoWOffline do
		local j = i + numWoWOnline
		if not WowFriendGroups[j] then
			WowFriendGroups[j] = {}
		end
		local note = C_FriendList.GetFriendInfoByIndex(j) and C_FriendList.GetFriendInfoByIndex(j).notes
		NoteAndGroups(note, WowFriendGroups[j])
		for group in pairs(WowFriendGroups[j]) do
			IncrementGroup(group)
			if not ShiGuangDB["FriendGroupsCollapsed"][group] and not ShiGuangDB["FriendGroupsHideOffline"] then
				buttonCount = buttonCount + 1
				AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, j)
			end
		end
	end

	buttonCount = buttonCount + GroupCount
	-- 1.5 is a magic number which prevents the list scroll to be too long
	totalScrollHeight = totalButtonHeight + GroupCount * FRIENDS_BUTTON_HEIGHTS[FRIENDS_BUTTON_TYPE_DIVIDER]

	FriendsScrollFrame.totalFriendListEntriesHeight = totalScrollHeight
	FriendsScrollFrame.numFriendListEntries = addButtonIndex

	if buttonCount > #FriendButtons then
		for i = #FriendButtons + 1, buttonCount do
			FriendButtons[i] = {}
		end
	end

	for group in pairs(GroupTotal) do
		table.insert(GroupSorted, group)
	end
	table.sort(GroupSorted)

	if GroupSorted[1] == "" then
		table.remove(GroupSorted, 1)
		table.insert(GroupSorted, "")
	end

	for key,val in pairs(GroupSorted) do
		if val == FriendRequestString then
			table.remove(GroupSorted,key)
			table.insert(GroupSorted,1,FriendRequestString)
		end
	end

	local index = 0
	for _,group in ipairs(GroupSorted) do
		index = index + 1
		FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_DIVIDER
		FriendButtons[index].text = group
		if not ShiGuangDB["FriendGroupsCollapsed"][group] then
			for i = 1, #FriendReqGroup do
				if group == FriendRequestString then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_INVITE
					FriendButtons[index].id = i
				end
			end
			for i = 1, numBNetFavoriteOnline do
				if BnetFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
					FriendButtons[index].id = i
				end
			end
			for i = numBNetFavorite + 1, numBNetOnline + numBNetFavoriteOffline do
				if BnetFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
					FriendButtons[index].id = i
				end
			end
			for i = 1, numWoWOnline do
				if WowFriendGroups[i][group] then
					index = index + 1
					FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
					FriendButtons[index].id = i
				end
			end
			if not ShiGuangDB["FriendGroupsHideOffline"] then
				for i = numBNetFavoriteOnline + 1, numBNetFavorite do
					if BnetFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
						FriendButtons[index].id = i
					end
				end
				for i = numBNetOnline + numBNetFavoriteOffline + 1, numBNetTotal do
					if BnetFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_BNET
						FriendButtons[index].id = i
					end
				end
				for i = numWoWOnline + 1, numWoWTotal do
					if WowFriendGroups[i][group] then
						index = index + 1
						FriendButtons[index].buttonType = FRIENDS_BUTTON_TYPE_WOW
						FriendButtons[index].id = i
					end
				end
			end
		end
	end
	FriendButtons.count = index

	-- selection
	local selectedFriend = 0
	-- check that we have at least 1 friend
	if numBNetTotal + numWoWTotal > 0 then
		-- get friend
		if FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_WOW then
			selectedFriend = C_FriendList.GetSelectedFriend()
		elseif FriendsFrame.selectedFriendType == FRIENDS_BUTTON_TYPE_BNET then
			selectedFriend = BNGetSelectedFriend()
		end
		-- set to first in list if no friend
		if not selectedFriend or selectedFriend == 0 then
			FriendsFrame_SelectFriend(FriendButtons[1].buttonType, 1)
			selectedFriend = 1
		end
		-- check if friend is online
		FriendsFrameSendMessageButton:SetEnabled(FriendsList_CanWhisperFriend(FriendsFrame.selectedFriendType, selectedFriend))
	else
		FriendsFrameSendMessageButton:Disable()
	end
	FriendsFrame.selectedFriend = selectedFriend
	FriendGroups_UpdateFriends()

	-- RID warning, upon getting the first RID invite
	local showRIDWarning = false
	local numInvites = BNGetNumFriendInvites()
	if ( numInvites > 0 and not GetCVarBool("pendingInviteInfoShown") ) then
		local _, _, _, _, _, _, isRIDEnabled = BNGetInfo()
		if ( isRIDEnabled ) then
			for i = 1, numInvites do
				local inviteID, accountName, isBattleTag = BNGetFriendInviteInfo(i)
				if ( not isBattleTag ) then
					-- found one
					showRIDWarning = true
					break
				end
			end
		end
	end
	if showRIDWarning then
		FriendsListFrame.RIDWarning:Show()
		FriendsScrollFrame.scrollBar:Disable()
		FriendsScrollFrame.scrollUp:Disable()
		FriendsScrollFrame.scrollDown:Disable()
	else
		FriendsListFrame.RIDWarning:Hide()
	end
end

local function FriendGroups_OnClick(self, button)
	if self["text"] and not self.text:IsShown() then
		hooks["FriendsFrameFriendButton_OnClick"](self, button)
		return
	end

	if self.buttonType ~= FRIENDS_BUTTON_TYPE_DIVIDER then
		if FriendsListButtonMixin then
			FriendsListButtonMixin.OnClick(self, button)
			return
		end
	end

	local group = self.info:GetText() or ""
	if button == "RightButton" then
        ShiGuangDB["FriendGroupsHideOffline"] = not ShiGuangDB["FriendGroupsHideOffline"]
        FriendGroups_Update()
	else
		ShiGuangDB["FriendGroupsCollapsed"][group] = not ShiGuangDB["FriendGroupsCollapsed"][group]
		FriendGroups_Update()
	end
end

local function FriendGroups_OnEnter(self)
	if ( self.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER ) then
		if FriendsTooltip:IsShown() then
			FriendsTooltip:Hide()
		end
		return
	end
end
local function HookButtons()
	local scrollFrame = FriendsScrollFrame
	local buttons = scrollFrame.buttons
	local numButtons = #buttons
	for i = 1, numButtons do
		if not FriendsFrameFriendButton_OnClick then
			buttons[i]:SetScript("OnClick", FriendGroups_OnClick)
		end
		if not FriendsFrameTooltip_Show then
			buttons[i]:HookScript("OnEnter", FriendGroups_OnEnter)
		end
	end
end

local function InviteOrGroup(clickedgroup, invite)
	local groups = {}
	for i = 1, BNGetNumFriends() do
		local presenceID, _, _, _, _, toonID, _, _, _, _, _, _, noteText = BNGetFriendInfo(i)
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and toonID then
				BNInviteFriend(toonID)
			elseif not invite then
				groups[clickedgroup] = nil
				note = CreateNote(note, groups)
				BNSetFriendNote(presenceID, note)
			end
		end
	end
	for i = 1, C_FriendList.GetNumFriends() do
		local friend_info = C_FriendList.GetFriendInfoByIndex(i)
		local name = friend_info.name
		local connected = friend_info.connected
		local noteText = friend_info.notes
		local note = NoteAndGroups(noteText, groups)
		if groups[clickedgroup] then
			if invite and connected then
				InviteUnit(name)
			elseif not invite then
				groups[clickedgroup] = nil
				note = CreateNote(note, groups)
				SetFriendNotes(i, note)
			end
		end
	end
end
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    --if not MaoRUISettingDB["Misc"]["FriendGroups"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_LOGIN" then
		Hook("FriendsList_Update", FriendGroups_Update, true)
		--if other addons have hooked this, we should too
		if not issecurevariable("FriendsFrame_UpdateFriends") then
			Hook("FriendsFrame_UpdateFriends", FriendGroups_UpdateFriends)
		end
		if FriendsFrameFriendButton_OnClick then
			Hook("FriendsFrameFriendButton_OnClick", FriendGroups_OnClick)
		end
		if FriendsFrameTooltip_Show then
			Hook("FriendsFrameTooltip_Show", FriendGroups_OnEnter, true)-- Fixes tooltip showing on groups
		end
		FriendsScrollFrame.dynamic = FriendGroups_GetTopButton
		FriendsScrollFrame.update = FriendGroups_UpdateFriends

		--add some more buttons
		FriendsScrollFrame.buttons[1]:SetHeight(FRIENDS_FRAME_FRIENDS_FRIENDS_HEIGHT)
		HybridScrollFrame_CreateButtons(FriendsScrollFrame, FriendButtonTemplate)

		
		HookButtons()

        if ShiGuangDB["FriendGroupsCollapsed"] == nil then ShiGuangDB["FriendGroupsCollapsed"] = {} end
        if ShiGuangDB["FriendGroupsHideOffline"] == nil then ShiGuangDB["FriendGroupsHideOffline"] = true end
        --if ShiGuangDB["FriendGroupsColourClasses"] == nil then ShiGuangDB["FriendGroupsColourClasses"] = true end
    end
end)