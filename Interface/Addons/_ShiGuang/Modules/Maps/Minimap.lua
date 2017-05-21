-------------------------------------Auther：Ndui siweia
local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Minimap")
local _G, Minimap = _G, Minimap

function module:ReskinRegions()
	-- QueueStatus Button
	QueueStatusMinimapButton:ClearAllPoints()
	QueueStatusMinimapButton:SetPoint("BOTTOMLEFT", -8, 3)
	QueueStatusMinimapButtonBorder:Hide()
	QueueStatusMinimapButtonIconTexture:SetTexture(nil)

	local queueIcon = Minimap:CreateTexture(nil, "ARTWORK")
	queueIcon:SetPoint("CENTER", QueueStatusMinimapButton)
	queueIcon:SetSize(46, 46)
	queueIcon:SetTexture(I.eyeTex)
	local anim = queueIcon:CreateAnimationGroup()
	anim:SetLooping("REPEAT")
	anim.rota = anim:CreateAnimation("Rotation")
	anim.rota:SetDuration(2)
	anim.rota:SetOrder(1)
	anim.rota:SetDegrees(360)
	hooksecurefunc("QueueStatusFrame_Update", function()
		queueIcon:SetShown(QueueStatusMinimapButton:IsShown())
	end)
	hooksecurefunc("EyeTemplate_StartAnimating", function() anim:Play() end)
	hooksecurefunc("EyeTemplate_StopAnimating", function() anim:Stop() end)

	-- Difficulty Flags
	local flags = {"MiniMapInstanceDifficulty", "GuildInstanceDifficulty", "MiniMapChallengeMode"}
	for k, v in pairs(flags) do
		local flag = _G[v]
		flag:ClearAllPoints()
		flag:SetPoint("TOPLEFT", 6, 6)
		flag:SetScale(.8)
	end
	--Tracking
	MiniMapTrackingBackground:SetAlpha(0)
	MiniMapTrackingButton:SetAlpha(0)
	MiniMapTracking:ClearAllPoints()
	MiniMapTracking:SetPoint("TOPRIGHT", Minimap, 6, 5)
	MiniMapTracking:SetScale(.85)
	-- Mail icon
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, 8,-8)
	MiniMapMailIcon:SetTexture(I.mailTex)
	--MiniMapMailIcon:SetSize(21, 21)
	--MiniMapMailIcon:SetVertexColor(1, 1, 0)
	MiniMapMailBorder:Hide()

	-- Invites Icon
	GameTimeCalendarInvitesTexture:ClearAllPoints()
	GameTimeCalendarInvitesTexture:SetParent("Minimap")
	GameTimeCalendarInvitesTexture:SetPoint("TOPRIGHT")
	local Invt = CreateFrame("Button", "NDuiInvt", UIParent)
	Invt:SetPoint("TOPRIGHT", Minimap, "BOTTOMLEFT", -20, -20)
	Invt:SetSize(300, 80)
	M.CreateBD(Invt)
	M.CreateTex(Invt)
	M.CreateFS(Invt, 16, I.InfoColor..GAMETIME_TOOLTIP_CALENDAR_INVITES)

	local f = MaoRUI:EventFrame({"CALENDAR_UPDATE_PENDING_INVITES", "PLAYER_ENTERING_WORLD"})
	f:SetScript("OnEvent", function()
		if MaoRUISettingDB["Map"]["Invite"] and CalendarGetNumPendingInvites() > 0 then
			Invt:Show()
		else
			Invt:Hide()
		end
	end)
	Invt:SetScript("OnClick", function(_, btn)
		Invt:UnregisterAllEvents()
		Invt:Hide()
		if btn == "LeftButton" then ToggleCalendar() end
	end)
end

----------------------------------------------------------------------------	右键菜单--------------------------------------------------------------------------
--动作条样式
local SetMrbarMenuFrame = CreateFrame("Frame", "ClickMenu", UIParent, "Lib_UIDropDownMenuTemplate")
local SetMrbarMicromenu = {  
	  { text = "       |cFFBF00FFMao|r|cFF00DDFFR|r|cffff8800 UI|r ", isTitle = true, notCheckable = true},
    { text = "|cffff8800 ----------------------|r", notCheckable = true },
    { text = "动作条样式", hasArrow = true, notCheckable = true,
        menuList={  
            { text = " --------- P V E ---------", isTitle = true, notCheckable = true },
            { text = "PVE1  |cff3399FF(12+6)|r   ", icon = 'Interface\\Icons\\Spell_Holy_SummonLightwell',
                func = function() sendCmd("/TTB pve1");  end, notCheckable = true, },
            { text = "PVE2 |cff3399FF(3+12+3)|r   ", icon = 'Interface\\Icons\\Spell_Holy_SummonLightwell',
                func = function() sendCmd("/TTB pve2");  end, notCheckable = true, },
            { text = "3行 |cff3399FF(12*3)|r   ", icon = 'Interface\\Icons\\Spell_Holy_SummonLightwell',
                func = function() sendCmd("/TTB pve3");  end, notCheckable = true, },
            { text = " --------- P V P ---------", isTitle = true, notCheckable = true   },
            { text = "PVP1 |cff3399FF(12*3)|r   ", icon = 'Interface\\Icons\\Spell_Holy_Crusade',
                func = function() sendCmd("/TTB pvp1");  end, notCheckable = true, },
            { text = "PVP2 |cff3399FF(1+1+16+1+1)*2|r   ", icon = 'Interface\\Icons\\Spell_Holy_Crusade',
                func = function() sendCmd("/TTB pvp2");  end, notCheckable = true, },
            { text = " --------- D I Y ---------", isTitle = true, notCheckable = true  },
            { text = "宽屏 |cff3399FF(8+R16)|r   ", icon = 'Interface\\ICONS\\INV_Crate_07',
                func = function() sendCmd("/TTB wide");  end, notCheckable = true, },
            { text = "三排 |cff3399FF(36+L12+R12)|r   ", icon = 'Interface\\ICONS\\INV_Crate_07',
                func = function() sendCmd("/TTB ta");  end, notCheckable = true, },
            { text = "整合 |cff3399FF(4+12+4)*3|r   ", icon = 'Interface\\ICONS\\INV_Crate_07',
                func = function() sendCmd("/TTB all");  end, notCheckable = true, },
            { text = "监控 |cff3399FF(1+1+19+1+1)*2|r   ", icon = 'Interface\\ICONS\\INV_Crate_07',
                func = function() sendCmd("/TTB jk");  end, notCheckable = true, },
            { text = " -------- M O D --------", isTitle = true, notCheckable = true  },
            { text = "火柴 |cff3399FF(1+1+18+1+1)*2|r   ", icon = 'Interface\\Addons\\_ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI',
                func = function() sendCmd("/TTB mr");  end, notCheckable = true, },
         } 
    },
    { text = "|cFF00DDFF ------- 移 动 -------|r", isTitle = true, notCheckable = true },
    { text = "任务按钮", icon = 'Interface\\MINIMAP\\TRACKING\\QuestBlob',  --Interface\\GossipFrame\\ActiveQuestIcon
        func = function() sendCmd("/eqb"); end, notCheckable = true, },
    { text = "技能监控", icon = 'Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Shield',
        func = function() sendCmd("/sraw test"); end, notCheckable = true, },
    { text = "控制提示", icon = 'Interface\\Calendar\\UI-Calendar-Button',
        func = function() sendCmd("/cci move"); end, notCheckable = true, },
    { text = "施法条", icon = 'Interface\\Icons\\Spell_Nature_Sentinal',
        func = function() sendCmd("/acb"); end, notCheckable = true, },
    { text = "聊天屏蔽", icon = 'Interface\\Calendar\\UI-Calendar-Button',
        func = function() sendCmd("/ecf"); end, notCheckable = true, },
    { text = "|cFF00DDFF ------- 开 关 -------|r", isTitle = true, notCheckable = true    },
    { text = "伤害显示", icon = 'Interface\\Icons\\INV_Misc_Bone_HumanSkull_02',
        func = function() sendCmd("/dex"); end, notCheckable = true,  },
	  { text = "技能冷却", icon = 'Interface\\Icons\\INV_Misc_Idol_05',
        func = function() sendCmd("/dcp"); end, notCheckable = true, },
    { text = "网格工具", icon = 'Interface\\MINIMAP\\TRACKING\\BattleMaster',
        func = function() sendCmd("/align"); end, notCheckable = true, },
    { text = "鼠标提示", icon = 'Interface\\Calendar\\UI-Calendar-Button', 
        func = function() sendCmd("/ztip"); end, notCheckable = true, },
    --{ text = "按键绑定", icon = 'Interface\\MacroFrame\\MacroFrame-Icon.blp',
        --func = function() sendCmd("/hb"); end, notCheckable = true, },
    { text = "求装助手", icon = 'Interface\\MacroFrame\\MacroFrame-Icon.blp',
        func = function() sendCmd("/gmlm show"); end, notCheckable = true, },
    { text = "提示框", icon = 'Interface\\Icons\\INV_Inscription_RunescrollOfFortitude_Red',
        func = function() sendCmd("/lstoasts"); end, notCheckable = true, },
    {text = "距离助手", hasArrow = true, notCheckable = true,
        menuList={  
            { text = "开", func = function() sendCmd("/hardyards sho") end, notCheckable = true, },
            { text = "关", func = function() sendCmd("/hardyards hid") end, notCheckable = true, }
        }
    },
    {text = "对比装备", hasArrow = true, notCheckable = true,
        menuList={  
            { text = "开", func = function() sendCmd("/run SetCVar('alwaysCompareItems', 1)") end, notCheckable = true, },
            { text = "关", func = function() sendCmd("/run SetCVar('alwaysCompareItems', 0)") end, notCheckable = true, }
        }
    },
    { text = "|cFF00DDFF ------- Style -------|r", isTitle = true, notCheckable = true },
    { text = "头像切换", icon = 'Interface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle',
        func = function() sendCmd("/loadmr"); end, notCheckable = true, },
    { text = "屏保(AFK)", icon = 'Interface\\Icons\\Spell_Holy_Crusade',
        func = function() sendCmd("/wallpaperkit"); end, notCheckable = true, },
    --{ text = "吃喝检查", icon = 'Interface\\MINIMAP\\TRACKING\\Reagents',
        --func = function() sendCmd("/hj"); end, notCheckable = true,   },
    { text = "|cFF00DDFF ------- 一键宏 -------|r", func = function() sendCmd("/MacroHelp"); end, notCheckable = true, },
    { text = "|cffff8800 ----------------------|r", isTitle = true, notCheckable = true  },
    { text = "  |cFFBF00FF常见问题|r", func = function() sendCmd("/MrHelp"); end, notCheckable = true, },
    { text = "             |cFFBF00FF更多设置|r", func = function() sendCmd("/mr"); end, notCheckable = true, },
    { text = "|cffff8800 ----------------------|r", isTitle = true, notCheckable = true  },
    { text = "ESC菜单", func = function() ToggleFrame(GameMenuFrame) end, notCheckable = true, },
    { text = "                       ", isTitle = true, notCheckable = true  },
    { text = LOGOUT, func = function() Logout() end, notCheckable = true, },
    --{ text = QUIT, func = function() ForceQuit() end, notCheckable = true, },
}
function module:OnLogin()
	-- Shape and Position
	function GetMinimapShape() return "SQUARE" end
	Minimap:ClearAllPoints()
	Minimap:SetPoint(unpack(R.Minimap.Pos))
	Minimap:SetFrameLevel(10)
	Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8X8")
	Minimap:SetSize(186, 186)
	Minimap:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
    edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 2, 
		insets = {left = 3, right = 3, top = 3, bottom = 3} 
					})
	Minimap:SetBackdropColor(0,0,0,1)
	Minimap:SetBackdropBorderColor(0,0,0,1)
	--MinimapCluster:SetScale(MaoRUISettingDB["Map"]["MinmapScale"])
	DropDownList1:SetClampedToScreen(true)

	-- ClockFrame
	if MaoRUISettingDB["Map"]["Clock"] then
		if not TimeManagerClockButton then LoadAddOn("Blizzard_TimeManager") end
		local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
		clockFrame:Hide()
		clockTime:SetFont(unpack(I.Font))
		clockTime:SetTextColor(1, 1, 1)
		TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -6)
	else
		if TimeManagerClockButton then TimeManagerClockButton:Hide() end
		GameTimeFrame:Hide()
	end

	-- Mousewheel Zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(_, zoom)
		if zoom > 0 then
			Minimap_ZoomIn()
		else
			Minimap_ZoomOut()
		end
	end)

	-- Click Func
	Minimap:SetScript("OnMouseUp", function(self, btn)
    if btn == "LeftButton" then 
     if IsAltKeyDown() then ToggleFrame(WorldMapFrame) --Alt+鼠标左键点击显示大地图
     elseif IsShiftKeyDown() then ToggleBattlefieldMinimap() --Shift+鼠标左键显示战场小地图
     elseif IsControlKeyDown() then ToggleFrame(ObjectiveTrackerFrame) --Ctrl+鼠标左键显示任务
     else Minimap_OnClick(self) --鼠标左键点击小地图显示Ping位置提示
     end
    elseif btn == "MiddleButton" then ToggleFrame(ObjectiveTrackerFrame)  --M:DropDown(MapMicromenu, MapMenuFrame, 0, 0) --鼠标中键显示系统菜单
    elseif btn == "RightButton" then  securecall(Lib_EasyMenu, SetMrbarMicromenu, SetMrbarMenuFrame, "cursor", 0, 0, "MENU", 2) --鼠标右键显示增强菜单
    --else ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self)
    end
	end)

	-- Hide Blizz
	local frames = {
		"GameTimeFrame",
		"MinimapBorderTop",
		"MinimapNorthTag",
		"MinimapBorder",
		"MinimapZoneTextButton",
		"MinimapZoomOut",
		"MinimapZoomIn",
		"MiniMapVoiceChatFrame",
		"MiniMapWorldMapButton",
		"MiniMapMailBorder",
		--"MiniMapTracking",
	}

	for _, v in pairs(frames) do
		_G[v]:Hide()
		_G[v].Show = M.Dummy
	end
	MinimapCluster:EnableMouse(false)
	Minimap:SetArchBlobRingScalar(0)
	Minimap:SetQuestBlobRingScalar(0)

	-- Add Elements
	self:ReskinRegions()
end

--谁在点小地图
local ping = CreateFrame('ScrollingMessageFrame', nil, Minimap)
ping:SetHeight(12)
ping:SetWidth(100)
ping:SetPoint('BOTTOM', Minimap, 0, 21)
ping:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
ping:SetJustifyH'CENTER'
ping:SetJustifyV'CENTER'
ping:SetMaxLines(1)
ping:SetFading(true)
ping:SetFadeDuration(3)
ping:SetTimeVisible(5)
ping:RegisterEvent'MINIMAP_PING'
ping:SetScript('OnEvent', function(self, event, u)
	local c = RAID_CLASS_COLORS[select(2,UnitClass(u))]
    if(UnitName(u) ~= UnitName("player")) then ping:AddMessage(UnitName(u), c.r, c.g, c.b) end
end)