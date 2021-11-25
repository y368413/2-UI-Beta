--========================================
-- hooksecurefunc三个函数会导致插件污染
--========================================
--========================================
-- 后续添加将好友名称替换成备注的功能。
--========================================

local function right_click_update(self)
    if ExtUI_Friends_Config["rightClickWhisperRole"] then
        if UnitPopupMenus["BN_FRIEND"][10] ~= "WHISPER_ROLE" then
			tinsert(UnitPopupMenus["BN_FRIEND"], 10,"WHISPER_ROLE")
			UnitPopupButtons["WHISPER_ROLE"]={ text = "私聊角色" } -- 不计算分隔线
		end
	else
		if UnitPopupMenus["BN_FRIEND"][10] == "WHISPER_ROLE" then
			tremove(UnitPopupMenus["BN_FRIEND"], 10) -- 这个会不断的移除第10个位置的值
			UnitPopupButtons["WHISPER_ROLE"]=nil -- 不计算分隔线
		end
	end
end

local function ini_Updatefunc()
    SetFrameCheckButton1.funUpdate = right_click_update
end


ini_Updatefunc()
FriendsFrame:HookScript("OnShow", function ()
    SetFrameCheckButton1:funUpdate()
end)

-- /script print(issecurevariable(UnitPopupMenus["BN_FRIEND"], 10))
-- /script print(issecurevariable("UnitPopupButtons"))
-- /script print(issecurevariable("FriendsFrame", numTabs))
-- /script print(issecurevariable(_G["DropDownList" .. i .. "Button" .. j], "value"))

--------------------------------------------------------------------------------
-- hooksecurefunc("FriendsFrame_ShowBNDropdown", function ()
-- 	print(FriendsDropDown.initialize)
-- 	print(FriendsDropDown.friendsDropDownName)
-- 	print("战网")
-- end)

-- hooksecurefunc("FriendsFrame_ShowDropdown", function ()
-- 	print("魔兽")
-- end)

-- UnitPopupMenus["BN_FRIEND"] -- 17个
-- UnitPopupMenus["BN_FRIEND"]["WHISPER"] -- 索引是第10个
-- UnitPopupShown = { {}, {}, {}, }; -- 分为三个层级，分别是层级1、2、3
-- UnitPopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] -- UIDROPDOWNMENU_MENU_LEVEL为层级，index为显示情况，index的数量与上面的索引保持一致，如17
-- UnitPopupButtons["WHISPER"] -- 	["WHISPER"]	= { text = WHISPER, },


-- 首先需要确定那些是需要显示或隐藏的按钮，需要的只是修改具体的真假值。
-- 这部分甚至可以不要，因为只要在UnitPopupMenus中添加了，就会默认全部为true。
-- 这里会触发污染。可能是由于修改了UnitPopupShown导致的。
--[[
hooksecurefunc("UnitPopup_HideButtons", function ()

	if not ExtUI_Friends_Config["rightClickWhisperRole"] then
		return
	end

	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
	local shown = true;

	-- 战网在线
	if UIDROPDOWNMENU_MENU_VALUE == "BN_FRIEND" or dropdownFrame.which == "BN_FRIEND"  then
		local bnetIDAccount = dropdownFrame.bnetIDAccount -- 战网ID
		local BNetAccountInfo = C_BattleNet.GetAccountInfoByID(bnetIDAccount) -- 战网信息（table）
		local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
		local name = dropdownFrame.name; -- 战网名
		local isOnline = gameAccountInfo.isOnline
		local clientProgram= gameAccountInfo.clientProgram -- 游戏客户端名称（在魔兽客户端中为WoW）
		local wowProjectID=gameAccountInfo.wowProjectID

		if clientProgram ~= "WoW" then
			shown = false
		end
	end

	UnitPopupShown[1][10] = shown and 1 or 0
end)
--]]

-- 按钮功能应用
hooksecurefunc("UnitPopup_OnClick", function (self)

	if  (not ExtUI_Friends_Config) or (not ExtUI_Friends_Config["rightClickWhisperRole"]) then
		return
	end

	local button = self.value;
	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;

	-- 前提是战网在线好友
	if ( button == "WHISPER_ROLE" ) then
		local bnetIDAccount = dropdownFrame.bnetIDAccount -- 战网ID
		local BNetAccountInfo = C_BattleNet.GetAccountInfoByID(bnetIDAccount) -- 战网信息（table）
		local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）

		local accountName = BNetAccountInfo.BNetAccountInfo-- 战网名
		local characterName = gameAccountInfo.characterName -- 游戏角色名
		local realmName = gameAccountInfo.realmName -- 服务器名（如果在其它客户端，如怀旧服则为nil）
		local clientProgram= gameAccountInfo.clientProgram -- 游戏客户端名称（在魔兽客户端中为WoW）
		local factionName = gameAccountInfo.factionName -- 阵营（联盟或部落，"Alliance"或"Horde"）
		local player_faction = UnitFactionGroup("PLAYER") -- 自己的角色所在的阵营(联盟或部落，"Alliance"或"Horde")
		local isSameFaction = player_faction == factionName -- 是否与你的当前角色是相同阵营
		-- 在魔兽中的战网好友、同客户端、同阵营
		if characterName and realmName and isSameFaction then
			local fullname = characterName.."-"..realmName; -- 完整的角色名（角色名-服务器名）
			ChatFrame_SendTell(fullname, dropdownFrame.chatFrame)
		end
	end

end)

-- 按钮事实更新
-- 大概率这个也会导致污染
hooksecurefunc("UnitPopup_OnUpdate", function ()

	if  (not ExtUI_Friends_Config) or (not ExtUI_Friends_Config["rightClickWhisperRole"]) then
		return
	end

	if ( not DropDownList1:IsShown() ) then
		return;
	end
	if ( not UnitPopup_HasVisibleMenu() ) then
		return;
	end

	local tempCount, count
	for level, dropdownFrame in pairs(OPEN_DROPDOWNMENUS) do
		if ( dropdownFrame ) then
			count = 0;
			for index, value in ipairs(UnitPopupMenus[dropdownFrame.which]) do
				if ( UnitPopupShown[level][index] == 1 ) then
					count = count + 1;
					local diff = (level > 1) and 0 or 1;
					if ( UnitPopupButtons[value].isSubsectionTitle ) then
						--If the button is a title then it has a separator above it that is not in UnitPopupButtons.
						--So 1 extra is added to each count because UnitPopupButtons does not count the separators and
						--the DropDown does.
						tempCount = count + diff;
						count = count + 1;
					else
						tempCount = count + diff;
					end

					if value == "WHISPER_ROLE" then
						local currentDropDown = UIDROPDOWNMENU_OPEN_MENU;
						local bnetIDAccount = currentDropDown.bnetIDAccount -- 战网ID
						local BNetAccountInfo = C_BattleNet.GetAccountInfoByID(bnetIDAccount) -- 战网信息（table）
						local gameAccountInfo = BNetAccountInfo.gameAccountInfo -- 游戏信息（table）
						local wowProjectID=gameAccountInfo.wowProjectID

						-- WOW_PROJECT_MAINLINE 正式服
						-- WOW_PROJECT_CLASSIC 怀旧服
						-- INVITE_RESTRICTION_WOW_PROJECT_CLASSIC 燃烧远征
						if wowProjectID ~= WOW_PROJECT_MAINLINE then
							_G["DropDownList"..level.."Button"..tempCount]:Disable();
						else
							_G["DropDownList"..level.."Button"..tempCount]:Enable();
						end
					end

				end
			end
		end
	end
end)