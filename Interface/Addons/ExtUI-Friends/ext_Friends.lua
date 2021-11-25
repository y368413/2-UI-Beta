--========================================
-- 这里是对好友列表（好友滚动窗体）的扩展。
-- 添加了好友框体右侧的新框体。
--========================================
--========================================
-- 后续会添加右键的魔兽角色私聊。
-- 添加在右框体添加不同的配置。
-- 仅需在AnotherFriendsFrame_UpdateFriendButton和AnotherFriendsList_Update中做调整。
--========================================

-- 暴雪的好友按钮高度定义
local FRIENDS_BUTTON_HEIGHTS = FRIENDS_BUTTON_HEIGHTS
local AnotherFriendListEntries = {}

-- 这部分定义属于暴雪
-- 虽然仅使用INVITE_RESTRICTION_NONE，但为了可读性还是全部复制过来了。
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
local INVITE_RESTRICTION_REGION = 11;

-- 该函数属于暴雪
-- 用于显示战网名称下方信息的标志位
local function ShowRichPresenceOnly(client, wowProjectID, faction, realmID)
	if (client ~= BNET_CLIENT_WOW) or (wowProjectID ~= WOW_PROJECT_ID) then
		-- If they are not in wow or in a different version of wow, always show rich presence only
        -- 如果它们不在魔兽或在不同版本的魔兽，总是只显示rich presence
		return true;
	elseif (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC) and ((faction ~= playerFactionGroup) or (realmID ~= playerRealmID)) then
		-- If we are both in wow classic and our factions or realms don't match, show rich presence only
        -- 如果我们都在魔兽怀旧服，而阵营不同，只展示rich presence
		return true;
	else
		-- Otherwise show more detailed info about them
        -- 否则显示更多关于它们的细节
		return false;
	end;
end

-- 该函数属于暴雪
-- 获得在线信息文本
local function GetOnlineInfoText(client, isMobile, rafLinkType, locationText)
	if not locationText then
		return UNKNOWN;
	end
	if isMobile then
		return LOCATION_MOBILE_APP;
	end
	if (client == BNET_CLIENT_WOW) and (rafLinkType ~= Enum.RafLinkType.None) and not isMobile then
		if rafLinkType == Enum.RafLinkType.Recruit then
			return RAF_RECRUIT_FRIEND:format(locationText);
		else
			return RAF_RECRUITER_FRIEND:format(locationText);
		end
	end
	return locationText;
end

-- For a hybrid scroll frame with buttons of varying size,
-- set .dynamic on the scroll frame to be a function which will take the offset and return:
--		1. how many buttons the offset is completely past
--		2. how many pixels the offset is into the topmost button
-- So with buttons of size 20, .dynamic(0) should return 0,0 and .dynamic(34) should return 1,14
-- 对于具有不同大小按钮的混合滚动框，将滚动框上的.dynamic设置为一个函数，该函数将获取偏移量并返回：
-- 		1.偏移量完整地超过多少个按钮
-- 		2.最顶端按钮的偏移量是多少像素
-- 因此，对于大小为20的按钮，.dynamic(0)应返回0, 0，而.dynamic(34)应返回1, 14
local function AnotherFriendsList_GetScrollFrameTopButton(offset)
	local usedHeight = 0;
	for i = 1, #AnotherFriendListEntries do
		local buttonHeight = FRIENDS_BUTTON_HEIGHTS[AnotherFriendListEntries[i].buttonType];
		if ( usedHeight + buttonHeight >= offset ) then
			return i - 1, offset - usedHeight;
		else
			usedHeight = usedHeight + buttonHeight;
		end
	end
end

-- 滚动框体的更新
-- 此函数执行之前必须保证AnotherFriendsList_Update被执行一次，否则numFriendButtons会是一个nil值
local function AnotherFriendsFrame_UpdateFriends()
	local scrollFrame = AnotherFriendsListFrameScrollFrame;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;
	local numFriendButtons = scrollFrame.numFriendListEntries;
	local usedHeight = 0;
	scrollFrame.dividerPool:ReleaseAll(); -- 将来自池的所有小部件恢复到原始状态以供重复使用
	scrollFrame.invitePool:ReleaseAll(); -- 将来自池的所有小部件恢复到原始状态以供重复使用
	-- scrollFrame.PendingInvitesHeaderButton:Hide();
	for i = 1, numButtons do
		local button = buttons[i];
		local index = offset + i;
		if ( index <= numFriendButtons ) then
			button.index = index;
			local height = AnotherFriendsFrame_UpdateFriendButton(button);
			button:SetHeight(height);
			usedHeight = usedHeight + height;
		else
			button.index = nil;
			button:Hide();
		end
	end
	HybridScrollFrame_Update(scrollFrame, scrollFrame.totalFriendListEntriesHeight, usedHeight); -- 好友滚动条更新
end

-- 更新FRIENDS_BUTTON_HEIGHTS列表(table)，存放按钮和按钮类型、id之间的映射。
-- 更新滚动框体的总计高度和索引数量。
-- 最后会执行一次AnotherFriendsFrame_UpdateFriends()
local function AnotherFriendsList_Update(forceUpdate)

	-- 当forceUpdate为nil时，好友列表打开才会完整执行AnotherFriendsList_Update()。
	-- 当forceUpdate为true时，无论好友列表是否显示，都会完整执行AnotherFriendsList_Update()。
	if not FriendsListFrame:IsShown() and not forceUpdate then
		return
	end

	local numBNetTotal, numBNetOnline, numBNetFavorite, numBNetFavoriteOnline = BNGetNumFriends(); -- 战网好友数量、战网好友在线数量、战网亲密好友数量、战网亲密好友在线数量。
	local numBNetOffline = numBNetTotal - numBNetOnline; -- 战网离线好友数量
	local numBNetFavoriteOffline = numBNetFavorite - numBNetFavoriteOnline; -- 战网亲密且离线好友数量
	local numBNetUnFavoriteOnline = numBNetOnline - numBNetFavoriteOnline --战网非亲密且在线好友数量
	local numWoWTotal = C_FriendList.GetNumFriends(); -- wow好友数量
	local numWoWOnline = C_FriendList.GetNumOnlineFriends(); -- wow在线好友数量
	local numWoWOffline = numWoWTotal - numWoWOnline; -- wow离线好友数量

	local config = ExtUI_Friends_Config["setFriendsScrollFrame"] or 0

	local addButtonIndex = 0;
	local totalButtonHeight = 0;
	local function AddButtonInfo(buttonType, id)
		addButtonIndex = addButtonIndex + 1;
		if ( not AnotherFriendListEntries[addButtonIndex] ) then
			AnotherFriendListEntries[addButtonIndex] = {};
		end
		AnotherFriendListEntries[addButtonIndex].buttonType = buttonType;
		AnotherFriendListEntries[addButtonIndex].id = id;
		totalButtonHeight = totalButtonHeight + FRIENDS_BUTTON_HEIGHTS[buttonType];
	end

	if config == 2 then

		-- 在魔兽中的战网亲密好友
		local bnetFriendIndex = 0
		for i = 1, numBNetFavoriteOnline do
			local BNetAccountInfo = C_BattleNet.GetFriendAccountInfo(i)
			local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
			local clientProgram= gameAccountInfo.clientProgram -- 游戏客户端名称（在魔兽客户端中为WoW）
			if clientProgram == "WoW" then
				bnetFriendIndex = bnetFriendIndex + 1;
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, bnetFriendIndex);
			end
		end

		-- 在魔兽世界中的战网非亲密好友
		-- 因为是非亲密好友，需要做一个偏移量处理
		bnetFriendIndex = numBNetFavorite
		for i = numBNetFavorite, numBNetUnFavoriteOnline + numBNetFavorite do
			local BNetAccountInfo = C_BattleNet.GetFriendAccountInfo(i)
			local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
			local clientProgram= gameAccountInfo.clientProgram -- 游戏客户端名称（在魔兽客户端中为WoW）
			if clientProgram == "WoW" then
				bnetFriendIndex = bnetFriendIndex + 1;
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, bnetFriendIndex);
			end
		end


		-- 在线魔兽好友
		for i = 1, numWoWOnline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i);
		end
		-- 在线和离线好友之间的分隔线
		if ( (numBNetOnline > 0 or numWoWOnline > 0) and (numBNetOffline > 0 or numWoWOffline > 0) ) then
			AddButtonInfo(FRIENDS_BUTTON_TYPE_DIVIDER, nil);
		end
		-- 离线魔兽好友
		for i = 1, numWoWOffline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i + numWoWOnline);
		end
	elseif config == 4 then -- 仅魔兽好友
		-- 在线魔兽好友
		for i = 1, numWoWOnline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i);
		end
		-- 在线和离线好友之间的分隔线
		if ( (numBNetOnline > 0 or numWoWOnline > 0) and (numBNetOffline > 0 or numWoWOffline > 0) ) then
			AddButtonInfo(FRIENDS_BUTTON_TYPE_DIVIDER, nil);
		end
		-- 离线魔兽好友
		for i = 1, numWoWOffline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i + numWoWOnline);
		end
	elseif config == 3 then
		-- 在魔兽中的非亲密好友
		-- 在魔兽世界中的战网非亲密好友
		-- 因为是非亲密好友，需要做一个偏移量处理
		local bnetFriendIndex = numBNetFavorite
		for i = numBNetFavorite, numBNetUnFavoriteOnline + numBNetFavorite do
			local BNetAccountInfo = C_BattleNet.GetFriendAccountInfo(i)
			local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
			local clientProgram= gameAccountInfo.clientProgram -- 游戏客户端名称（在魔兽客户端中为WoW）
			if clientProgram == "WoW" then
				bnetFriendIndex = bnetFriendIndex + 1;
				AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, bnetFriendIndex);
			end
		end


		-- 在线魔兽好友
		for i = 1, numWoWOnline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i);
		end
		-- 在线和离线好友之间的分隔线
		if ( (numBNetOnline > 0 or numWoWOnline > 0) and (numBNetOffline > 0 or numWoWOffline > 0) ) then
			AddButtonInfo(FRIENDS_BUTTON_TYPE_DIVIDER, nil);
		end
		-- 离线魔兽好友
		for i = 1, numWoWOffline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i + numWoWOnline);
		end
	else

		-- 在魔兽中的好友
		-- 可以在这里调整偏移量。
		-- 用来让框体从你所需要的位置开始显示。
		local bnetFriendIndex = numBNetFavorite; -- 从非亲密好友开始显示

		-- 在线战网好友
		for i = 1, numBNetOnline - numBNetFavoriteOnline do
			bnetFriendIndex = bnetFriendIndex + 1;
			AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, bnetFriendIndex);
		end
		-- 在线魔兽好友
		for i = 1, numWoWOnline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i);
		end
		-- 在线和离线好友之间的分隔线
		if ( (numBNetOnline > 0 or numWoWOnline > 0) and (numBNetOffline > 0 or numWoWOffline > 0) ) then
			AddButtonInfo(FRIENDS_BUTTON_TYPE_DIVIDER, nil);
		end
		-- 离线战网好友
		for i = 1, numBNetOffline - numBNetFavoriteOffline do
			bnetFriendIndex = bnetFriendIndex + 1;
			AddButtonInfo(FRIENDS_BUTTON_TYPE_BNET, bnetFriendIndex);
		end
		-- 离线魔兽好友
		for i = 1, numWoWOffline do
			AddButtonInfo(FRIENDS_BUTTON_TYPE_WOW, i + numWoWOnline);
		end
	end


	local scrollFrame = AnotherFriendsListFrameScrollFrame;
	scrollFrame.totalFriendListEntriesHeight = totalButtonHeight; -- 获得总计高度（包含分隔线）
	scrollFrame.numFriendListEntries = addButtonIndex; -- 获得索引数量（包含分隔线）

	AnotherFriendsFrame_UpdateFriends()
end

-- 按钮的更新，并返回按钮高度，用于重新调整滚动框体
-- 无法local 因为颜色需要后钩处理
function AnotherFriendsFrame_UpdateFriendButton(button)
	local index = button.index; -- 当前按钮的索引 这里指的是第几个按钮
	button.buttonType = AnotherFriendListEntries[index].buttonType; -- 当前按钮的类型
	button.id = AnotherFriendListEntries[index].id; -- 当前按钮的id
	local height = FRIENDS_BUTTON_HEIGHTS[button.buttonType]; -- 返回当前按钮的高度
	local nameText, nameColor, infoText, isFavoriteFriend, statusTexture; -- 名字，颜色，额外信息，是否亲密，纹理状态
	local hasTravelPassButton = false; -- 邀请加入队伍
	
	if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then -- 魔兽好友
		local info = C_FriendList.GetFriendInfoByIndex(button.id);
		if info.connected then
			button.background:SetColorTexture(FRIENDS_WOW_BACKGROUND_COLOR.r, FRIENDS_WOW_BACKGROUND_COLOR.g, FRIENDS_WOW_BACKGROUND_COLOR.b, FRIENDS_WOW_BACKGROUND_COLOR.a);
			if info.afk then
				button.status:SetTexture(FRIENDS_TEXTURE_AFK);
			elseif info.dnd then
				button.status:SetTexture(FRIENDS_TEXTURE_DND);
			else
				button.status:SetTexture(FRIENDS_TEXTURE_ONLINE);
			end
			nameText = info.name..", "..format(FRIENDS_LEVEL_TEMPLATE, info.level, info.className);
			nameColor = FRIENDS_WOW_NAME_COLOR;
			infoText = GetOnlineInfoText(BNET_CLIENT_WOW, info.mobile, info.rafLinkType, info.area);
		else
			button.background:SetColorTexture(FRIENDS_OFFLINE_BACKGROUND_COLOR.r, FRIENDS_OFFLINE_BACKGROUND_COLOR.g, FRIENDS_OFFLINE_BACKGROUND_COLOR.b, FRIENDS_OFFLINE_BACKGROUND_COLOR.a);
			button.status:SetTexture(FRIENDS_TEXTURE_OFFLINE);
			nameText = info.name;
			nameColor = FRIENDS_GRAY_COLOR;
			infoText = FRIENDS_LIST_OFFLINE;
		end
		button.gameIcon:Hide();
		button.summonButton:ClearAllPoints();
		button.summonButton:SetPoint("TOPRIGHT", button, "TOPRIGHT", 1, -1);
		FriendsFrame_SummonButton_Update(button.summonButton);
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then -- 战网好友
		local accountInfo = C_BattleNet.GetFriendAccountInfo(AnotherFriendListEntries[index].id); -- 获取战网账号信息 这里需要注意。跟战网的索引有个偏移量
		if accountInfo then
			nameText, nameColor, statusTexture = FriendsFrame_GetBNetAccountNameAndStatus(accountInfo); -- 账号的角色信息，名称，颜色，状态材质
			isFavoriteFriend = accountInfo.isFavorite;
			button.status:SetTexture(statusTexture);
			if accountInfo.gameAccountInfo.isOnline then
				button.background:SetColorTexture(FRIENDS_BNET_BACKGROUND_COLOR.r, FRIENDS_BNET_BACKGROUND_COLOR.g, FRIENDS_BNET_BACKGROUND_COLOR.b, FRIENDS_BNET_BACKGROUND_COLOR.a);

				-- 显示按钮下方的信息，如正在使用战网应用程序
				if ShowRichPresenceOnly(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.wowProjectID, accountInfo.gameAccountInfo.factionName, accountInfo.gameAccountInfo.realmID) then
					infoText = GetOnlineInfoText(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.isWowMobile, accountInfo.rafLinkType, accountInfo.gameAccountInfo.richPresence);
				else
					infoText = GetOnlineInfoText(accountInfo.gameAccountInfo.clientProgram, accountInfo.gameAccountInfo.isWowMobile, accountInfo.rafLinkType, accountInfo.gameAccountInfo.areaName);
				end

				-- 设置按钮的游戏图标材质
				button.gameIcon:SetTexture(BNet_GetClientTexture(accountInfo.gameAccountInfo.clientProgram));
				local fadeIcon = (accountInfo.gameAccountInfo.clientProgram == BNET_CLIENT_WOW) and (accountInfo.gameAccountInfo.wowProjectID ~= WOW_PROJECT_ID);
				if fadeIcon then
					button.gameIcon:SetAlpha(0.6);
				else
					button.gameIcon:SetAlpha(1);
				end

				-- Note - this logic should match the logic in FriendsFrame_ShouldShowSummonButton
				-- 注意 - 此逻辑应与FriendsFrame_ShouldShowSummonButton中的逻辑相匹配
				local shouldShowSummonButton = FriendsFrame_ShouldShowSummonButton(button.summonButton);
				button.gameIcon:SetShown(not shouldShowSummonButton);

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
			button.summonButton:ClearAllPoints();
			button.summonButton:SetPoint("CENTER", button.gameIcon, "CENTER", 1, 0);
			FriendsFrame_SummonButton_Update(button.summonButton);
		end
	elseif button.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER then -- 分隔线
		local scrollFrame = AnotherFriendsListFrameScrollFrame;
		local divider = scrollFrame.dividerPool:Acquire();
		divider:SetParent(scrollFrame.ScrollChild);
		divider:SetAllPoints(button);
		divider:Show();
		nameText = nil;
	end


	if hasTravelPassButton then
		button.travelPassButton:Show();
	else
		button.travelPassButton:Hide();
	end

	-- selection
	-- 按钮是否被选中
	if  (FriendsFrame.selectedFriendType == AnotherFriendListEntries[index].buttonType) and (FriendsFrame.selectedFriend == AnotherFriendListEntries[index].id) then
		button:LockHighlight();
	else
		button:UnlockHighlight();
	end

	-- finish setting up button if it's not a header
	-- 如果不是标题或分隔线，则完成按钮的设置。
	if nameText then
		button.name:SetText(nameText);
		button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b);
		button.info:SetText(infoText);
		button:Show();
		if isFavoriteFriend then
			button.Favorite:Show();
			button.Favorite:ClearAllPoints()
			button.Favorite:SetPoint("TOPLEFT", button.name, "TOPLEFT", button.name:GetStringWidth(), 0);
		else
			button.Favorite:Hide();
		end
	else
		button:Hide();
	end

	-- update the tooltip if hovering over a button
	-- 如果将鼠标悬停在按钮上，则更新鼠标提示
	if (FriendsTooltip.button == button) or (GetMouseFocus() == button) then
		button:OnEnter();
	end

	return height
end

-- 滚动框体的初始化
local function ini_FriendFrame()

	-- 在好友框体中创建另一个滚动框体
	local AnotherFrameScrollFrame = CreateFrame("ScrollFrame","AnotherFriendsListFrameScrollFrame",FriendsListFrame,"FriendsFrameScrollFrame")
	AnotherFrameScrollFrame:ClearAllPoints()
	AnotherFrameScrollFrame:SetPoint("LEFT", FriendsListFrameScrollFrame,"RIGHT", 50,0)
	AnotherFrameScrollFrame.update = AnotherFriendsFrame_UpdateFriends; -- 滚动框体的自更新
	AnotherFrameScrollFrame.dynamic = AnotherFriendsList_GetScrollFrameTopButton; -- 
	-- scrollFrame.PendingInvitesHeaderButton:SetParent(scrollFrame.ScrollChild); -- 可能是获得好友邀请的按钮，我这次没有继承这个组件
	AnotherFrameScrollFrame.dividerPool = CreateFramePool("FRAME", AnotherFrameScrollFrame, "FriendsFrameFriendDividerTemplate");
	AnotherFrameScrollFrame.invitePool = CreateFramePool("FRAME", AnotherFrameScrollFrame, "FriendsFrameFriendInviteTemplate");
	HybridScrollFrame_CreateButtons(AnotherFrameScrollFrame, "FriendsListButtonTemplate");

end



Lasttime = 0 -- 上一次单机点击的时间
LastButtonID = 0 -- 上次单击点击的按钮ID
-- 双击好友按钮的脚本处理程序
function Double_Click_Button(button, btn)
	if btn == "LeftButton" then
		local curtime = GetTime();
		local curbuttonId = button.id == LastButtonID
		local double = (curtime - Lasttime) < 0.25 -- 双击时间小于0.25秒
		if double and curbuttonId then

			if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then -- 魔兽好友
				local info = C_FriendList.GetFriendInfoByIndex(button.id);
				if info.connected then
					ChatFrame_SendTell(info.name)
				end
			elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET then -- 战网好友
				local BNetAccountInfo = C_BattleNet.GetFriendAccountInfo(button.id); -- 获取战网账号信息 这里需要注意。跟战网的索引有个偏移量
				local accountName = BNetAccountInfo.accountName-- 战网名
				local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
				local characterName = gameAccountInfo.characterName -- 游戏角色名
				local realmName = gameAccountInfo.realmName -- 服务器名（如果在其它客户端，如怀旧服则为nil）
				local factionName = gameAccountInfo.factionName -- 阵营（联盟或部落，"Alliance"或"Horde"）
				local player_faction = UnitFactionGroup("PLAYER") -- 自己的角色所在的阵营(联盟或部落，"Alliance"或"Horde")
				local isSameFaction = player_faction == factionName -- 是否与你的当前角色是相同阵营

				-- 在魔兽中的战网好友、同客户端、同阵营
				if characterName and realmName and isSameFaction then
					local fullname = characterName.."-"..realmName; -- 完整的角色名（角色名-服务器名）
					ChatFrame_SendTell(fullname)
				else
					ChatFrame_SendBNetTell(accountName)
				end
			end
		else
			Lasttime = curtime;
			LastButtonID = button.id
		end
	end
end

-- 为滚动框体的按钮设置新的脚本
local function ini_ButtonScript()

	-- 重写AnotherFriendsListFrameScrollFrame的OnClick脚本，让其不触发污染。
	local scrollFrame = AnotherFriendsListFrameScrollFrame;
	local buttons = scrollFrame.buttons;
	for i = 1, #buttons do
		local button = buttons[i];
		button:SetScript("OnClick", Double_Click_Button)
	end

	scrollFrame = FriendsListFrameScrollFrame;
	buttons = scrollFrame.buttons;
	for i = 1, #buttons do
		local button = buttons[i];
		button:HookScript("OnClick", Double_Click_Button)
	end
end

local function Event_Handler(self, event)
	if event == "PLAYER_LOGIN" then
		AnotherFriendsList_Update(true)
	end
end


local Listener = CreateFrame("Frame")
Listener:RegisterEvent("PLAYER_LOGIN")
Listener:SetScript("OnEvent", Event_Handler)

ini_FriendFrame()
ini_ButtonScript()
hooksecurefunc("FriendsList_Update", AnotherFriendsList_Update)
