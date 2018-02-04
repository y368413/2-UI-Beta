----------------------------------     ## SavedVariables: diminfo  -- dimInfo by Loshine, NDui MOD, MaoR UI DIY     ----------------------------------
local M, R, U, I = unpack(select(2, ...))
if (diminfo == nil) then diminfo = {}; end
-------------------------------------Setting
--Fonts and Colors
local Cfg_ColorClass = true
local Cfg_Fonts = {STANDARD_TEXT_FONT, 12, "outline"}  --"Fonts\\ARKai_T.ttf"
local Cfg_TimeFonts = {"Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 24, "outline"}
local Cfg_TTFonts = {STANDARD_TEXT_FONT, 16, "outline"}
--local Cfg_PosFonts = {STANDARD_TEXT_FONT, 14, "outline"}
--左上
local Cfg_Spec = true
local Cfg_SpecPoint = {"topleft", UIParent,"topleft",0, 0}  --{"bottomright", Minimap,"bottomright",-16, 3}
local Cfg_Time = true
local Cfg_TimePoint = {"topleft", UIParent, "topleft", 22, 2}
local Cfg_Guild = true
local Cfg_GuildPoint = {"topleft", UIParent, "topleft", 95, -3}
local Cfg_Friends = true
local Cfg_FriendsPoint = {"topleft", UIParent, "topleft", 135, -3}
local Cfg_Durability = true
local Cfg_DurabilityPoint = {"topleft", UIParent, "topleft", 185, -3}
local Cfg_System = true
local Cfg_SystemPoint = {"topleft", UIParent, "topleft", 225, -3}
local Cfg_Memory = true
local Cfg_MemoryPoint = {"topleft", UIParent, "topleft", 320, -3}
local Cfg_MaxAddOns = 21
local Cfg_Bags = true
local Cfg_BagsPoint = {"topleft", UIParent, "topleft", 375, -4}
--右上(小地图)
local Cfg_Coords = false
local Cfg_CoordsPoint = {"topright", Minimap,"topright", -12, -2}
local Cfg_Mail = false
local Cfg_MailPoint = {"topleft", Minimap, "bottomleft", 0, -5}
local Cfg_Gold = true
local Cfg_GoldPoint = {"bottomleft", Minimap, "bottomleft", 2, 2}
local Cfg_Positions = true
local Cfg_PositionsPoint = {"top", UIParent,"top", 0, -3}  -- {"topright", Minimap,"topleft",-18, -1}

-------------------------------------  Spec  ------------------------------------------------------------------------------------------
if Cfg_Spec == true then
	local SpecStatFrame = CreateFrame("Frame", "SpecStatFrame", UIParent)
	SpecStatFrame:EnableMouse(true)
	SpecStatFrame:SetFrameStrata("BACKGROUND")
	SpecStatFrame:SetFrameLevel(3)
	SpecStatFrame:SetHitRectInsets(0, 0, -10, 0)
	local Text = SpecStatFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_TTFonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_SpecPoint))
	SpecStatFrame:SetAllPoints(Text)

	local function addIcon(texture)
		texture = texture and "|T"..texture..":13:15:0:0:50:50:4:46:4:46|t" or ""
		return texture
	end

	local menuFrame = CreateFrame("Frame", "SpecSwitchMenu", SpecStatFrame, "L_UIDropDownMenuTemplate")
	local menuList = {
		{text = CHOOSE_SPECIALIZATION, isTitle = true, notCheckable = true},
		{text = SPECIALIZATION, hasArrow = true, notCheckable = true},
		{text = SELECT_LOOT_SPECIALIZATION, hasArrow = true, notCheckable = true},
	}
	SpecStatFrame:RegisterEvent("PLAYER_LOGIN")
	SpecStatFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	SpecStatFrame:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED")
	SpecStatFrame:SetScript("OnEvent", function()
		if GetSpecialization() then
			local _, name, _, icon = GetSpecializationInfo(GetSpecialization())
			if not name then return end
			local specID = GetLootSpecialization()
			if specID == 0 then
				icon = addIcon(icon)
			else
				icon = addIcon(select(4, GetSpecializationInfoByID(specID)))
			end
			Text:SetText(I.MyColor..icon) --..name
		else
			Text:SetText(SPECIALIZATION..": "..I.MyColor..NONE)
		end
	end)
	
	local function clickFunc(i, isLoot, isPet)
		if not i then return end
		if isLoot then SetLootSpecialization(i)
		else SetSpecialization(i, isPet)
		end
		DropDownList1:Hide()
	end
	
	SpecStatFrame:SetScript("OnMouseUp", function(self, btn)
		if not GetSpecialization() then return end
			menuList[2].menuList = {{}, {}, {}, {}}
			menuList[3].menuList = {{}, {}, {}, {}, {}}
			local specList, lootList = menuList[2].menuList, menuList[3].menuList

			local spec, specName = GetSpecializationInfo(GetSpecialization())
			local lootSpec = GetLootSpecialization()
			lootList[1] = {text = format(LOOT_SPECIALIZATION_DEFAULT, specName), func = function() clickFunc(0, true) end, checked = lootSpec == 0 and true or false}

			for i = 1, 4 do
				local id, name = GetSpecializationInfo(i)
				if id then
					specList[i].text = name
					if id == spec then
						specList[i].func = function() clickFunc() end
						specList[i].checked = true
					else
						specList[i].func = function() clickFunc(i) end
						specList[i].checked = false
					end
					lootList[i+1] = {text = name, func = function() clickFunc(id, true) end, checked = id == lootSpec and true or false}
				else
					specList[i] = nil
					lootList[i+1] = nil
				end
			end

			do
				if I.MyClass == "HUNTER" and IsPetActive() then
					menuList[4] = {text = PET..SPECIALIZATION, hasArrow = true, notCheckable = true}
					menuList[4].menuList = {{}, {}, {}}
					local petList = menuList[4].menuList
					local spec = GetSpecializationInfo(GetSpecialization(false, true), false, true)
					for i = 1, 3 do
						local id, name = GetSpecializationInfo(i, false, true)
						petList[i].text = name
						if id == spec then
							petList[i].func = function() clickFunc() end
							petList[i].checked = true
						else
							petList[i].func = function() clickFunc(i, false, true) end
							petList[i].checked = false
						end
					end					
				else
					menuList[4] = nil
				end
			end

			L_EasyMenu(menuList, menuFrame, self, -80, 100, "MENU", 1)

		GameTooltip:Hide()
	end)
end
-------------------------------------  Time  ------------------------------------------------------------------------------------------
if Cfg_Time == true then
	local SpecTimeFrame = CreateFrame("Frame", "SpecTimeFrame", UIParent)
	SpecTimeFrame:EnableMouse(true)
	SpecTimeFrame:SetFrameStrata("BACKGROUND")
	SpecTimeFrame:SetFrameLevel(3)
	SpecTimeFrame:SetHitRectInsets(0, 0, -10, 0)
	local Text = SpecTimeFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_TimeFonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_TimePoint))
	SpecTimeFrame:SetAllPoints(Text)

	local int = 1
	local Hr24, Hr, Min
	local function Update(self, t)
		local pendingCalendarInvites = CalendarGetNumPendingInvites()
		int = int - t
		if int < 0 then
			if GetCVar("timeMgrUseLocalTime") == "1" then
				Hr24 = tonumber(date("%H"))
				Hr = tonumber(date("%I"))
				Min = date("%M")
				if GetCVar("timeMgrUseMilitaryTime") == "1" then
					if pendingCalendarInvites > 0 then
					Text:SetText("|cffFF0000"..Hr24..":"..Min)
				else
					Text:SetText(Hr24..":"..Min)
				end
			else
				if Hr24 >= 12 then
					if pendingCalendarInvites > 0 then
						Text:SetText(Cfg_ColorClass and "|cffFF0000"..Hr..":"..Min..I.MyColor..".|r" or "|cffFF0000"..Hr..":"..Min.."|cffffffff.|r")
					else
						Text:SetText(Cfg_ColorClass and Hr..":"..Min..I.MyColord..".|r" or Hr..":"..Min.."|cffffffff.|r")
					end
				else
					if pendingCalendarInvites > 0 then
						Text:SetText(Cfg_ColorClass and "|cffFF0000"..Hr..":"..Min..I.MyColor.."^|r" or "|cffFF0000"..Hr..":"..Min.."|cffffffff^|r")
					else
						Text:SetText(Cfg_ColorClass and Hr..":"..Min..I.MyColor.."^|r" or Hr..":"..Min.."|cffffffff^|r")
					end
				end
			end
		else
			local Hr, Min = GetGameTime()
			if Min < 10 then Min = "0"..Min end
			if GetCVar("timeMgrUseMilitaryTime") == "1" then
				if pendingCalendarInvites > 0 then			
					Text:SetText("|cffFF0000"..Hr..":"..Min.."|cffffffff|r")
				else
					Text:SetText(Hr..":"..Min.."|cffffffff|r")
				end
			else
				if Hr >= 12 then
					if Hr > 12 then Hr = Hr - 12 end
					if pendingCalendarInvites > 0 then
						Text:SetText(Cfg_ColorClass and "|cffFF0000"..Hr..":"..Min..I.MyColor..".|r" or "|cffFF0000"..Hr..":"..Min.."|cffffffff.|r")
					else
						Text:SetText(Cfg_ColorClass and Hr..":"..Min..I.MyColor..".|r" or Hr..":"..Min.."|cffffffff.|r")
					end
				else
					if Hr == 0 then Hr = 12 end
					if pendingCalendarInvites > 0 then
						Text:SetText(Cfg_ColorClass and "|cffFF0000"..Hr..":"..Min..I.MyColor.."^|r" or "|cffFF0000"..Hr..":"..Min.."|cffffffff^|r")
					else
						Text:SetText(Cfg_ColorClass and Hr..":"..Min..I.MyColor.."^|r" or Hr..":"..Min.."|cffffffff^|r")
					end
				end
			end
		end
		int = 1
		end
	end

	-- Data
	local months = {
		MONTH_JANUARY, MONTH_FEBRUARY, MONTH_MARCH,	MONTH_APRIL, MONTH_MAY, MONTH_JUNE,
		MONTH_JULY, MONTH_AUGUST, MONTH_SEPTEMBER, MONTH_OCTOBER, MONTH_NOVEMBER, MONTH_DECEMBER,
	}

	local bonus = {
		43892, 43893, 43894,	-- Order Resources
		43895, 43896, 43897,	-- Gold
		47851, 47864, 47865,	-- Honor Coins
		43510,					-- Orderhall
	}
	local bonusname = GetCurrencyInfo(1273)

	local keystone = GetItemInfo(138019)
	local questlist = {
		{name = keystone, id = 44554},
		{name = U["Blingtron"], id = 34774},
		{name = U["Mean One"], id = 6983},
		{name = "TBC"..U["Timewarped"], id = 40168},
		{name = "WLK"..U["Timewarped"], id = 40173},
		{name = "CTM"..U["Timewarped"], id = 40786},
		{name = "MOP"..U["Timewarped"], id = 45799},
	}

	local invas = {
		{quest = 38482, name = U["Platinum Invasion"]},
		{quest = 37640, name = U["Gold Invasion"]},
		{quest = 37639, name = U["Silver Invasion"]},
		{quest = 37638, name = U["Bronze Invasion"]},
	}

	local tanaan = {
		{name = U["Deathtalon"], id = 39287},
		{name = U["Terrorfist"], id = 39288},
		{name = U["Doomroller"], id = 39289},
		{name = U["Vengeance"], id = 39290},
	}

	-- Check Invasion Status
	local zonePOIIds = {5177, 5178, 5210, 5175}
	local zoneNames = {1024, 1017, 1018, 1015}
	local function OnInvasion()
		for i = 1, #zonePOIIds do
			local timeLeftMinutes = C_WorldMap.GetAreaPOITimeLeft(zonePOIIds[i])
			if timeLeftMinutes and timeLeftMinutes > 0 and timeLeftMinutes < 361 then
				return timeLeftMinutes, GetMapNameByID(zoneNames[i])
			end
		end
	end

	SpecTimeFrame:SetScript("OnEnter", function(self)
		RequestRaidInfo()

		GameTooltip:SetOwner(self, "ANCHOR_TOP", -20, 6)
		GameTooltip:ClearLines()
		local w, m, d, y = CalendarGetDate()
		GameTooltip:AddLine(format(FULLDATE, CALENDAR_WEEKDAY_NAMES[w], months[m], d, y), 0,.6,1)
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(TIMEMANAGER_TOOLTIP_LOCALTIME, GameTime_GetLocalTime(true), .6,.8,1 ,1,1,1)
		GameTooltip:AddDoubleLine(TIMEMANAGER_TOOLTIP_REALMTIME, GameTime_GetGameTime(true), .6,.8,1 ,1,1,1)

		local title
		local function AddTitle(text)
			if not title then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(text, .6,.8,1)
				title = true
			end
		end

		-- World bosses
		for i = 1, GetNumSavedWorldBosses() do
			local name, id, reset = GetSavedWorldBossInfo(i)
			if not (id == 11 or id == 12 or id == 13) then
				AddTitle(RAID_INFO_WORLD_BOSS)
				GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1,1,1, 1,1,1)
			end
		end

		-- Mythic Dungeons
		title = false
		for i = 1, GetNumSavedInstances() do
			local name, _, reset, diff, locked, extended = GetSavedInstanceInfo(i)
			if diff == 23 and (locked or extended) then
				AddTitle(DUNGEON_DIFFICULTY3..DUNGEONS)
				local r,g,b
				if extended then r,g,b = .3,1,.3 else r,g,b = 1,1,1 end
				GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1,1,1, r,g,b)
			end
		end

		-- Raids
		title = false
		for i = 1, GetNumSavedInstances() do
			local name, _, reset, _, locked, extended, _, isRaid, _, diffName = GetSavedInstanceInfo(i)
			if isRaid and (locked or extended) then
				AddTitle(RAID_INFO)
				local r,g,b
				if extended then r,g,b = .3,1,.3 else r,g,b = 1,1,1 end
				GameTooltip:AddDoubleLine(name.." - "..diffName, SecondsToTime(reset, true, nil, 3), 1,1,1, r,g,b)
			end
		end

		-- Quests
		title = false
		local count = 0
		for _, id in pairs(bonus) do
			if IsQuestFlaggedCompleted(id) then
				count = count + 1
			end
		end
		if count > 0 then
			AddTitle(QUESTS_LABEL)
			local r,g,b
			if count == 3 then r,g,b = 1,0,0 else r,g,b = 0,1,0 end
			GameTooltip:AddDoubleLine(bonusname, count.." / 3", 1,1,1, r,g,b)
		end

		for _, index in pairs(questlist) do
			if index.name and IsQuestFlaggedCompleted(index.id) then
				AddTitle(QUESTS_LABEL)
				GameTooltip:AddDoubleLine(index.name, QUEST_COMPLETE, 1,1,1, 1,0,0)
			end
		end

		for _, v in pairs(invas) do
			if v.quest and IsQuestFlaggedCompleted(v.quest) then
				AddTitle(QUESTS_LABEL)
				GameTooltip:AddDoubleLine(v.name, QUEST_COMPLETE, 1,1,1, 1,1,0)
				break
			end
		end

		-- Tanaan rares
		title = false
		for _, boss in pairs(tanaan) do
			if boss.name and IsQuestFlaggedCompleted(boss.id) then
				AddTitle(U["Tanaan"])
				GameTooltip:AddDoubleLine(boss.name, BOSS_DEAD, 1,1,1, 1,1,0)
			end
		end

		-- Legion Invasion
		title = false

		local nextTime
		if OnInvasion() then
			local timeLeft = OnInvasion()
			local elapsed = 360 - timeLeft
			local startTime = time() - elapsed*60
			nextTime = date("%m/%d %H:%M", startTime + 66600)
			diminfo.prevInvasion = startTime
		elseif diminfo.prevInvasion then
			local elapsed = time() - diminfo.prevInvasion
			while elapsed > 66600 do
				elapsed = elapsed - 66600
			end
			nextTime = date("%m/%d %H:%M", 66600 - elapsed + time())
		end

		if nextTime then
			AddTitle(U["Legion Invasion"])
			if OnInvasion() then
				local timeLeft, zoneName = OnInvasion()
				local r,g,b
				if timeLeft < 60 then r,g,b = 1,0,0 else r,g,b = 0,1,0 end
				GameTooltip:AddDoubleLine(zoneName, format("%.2d:%.2d", timeLeft/60, timeLeft%60), 1,1,1, r,g,b)
			end
			GameTooltip:AddDoubleLine(U["Next Invasion"], nextTime, 1,1,1, 1,1,1)
		end

		-- Help Info
		GameTooltip:AddDoubleLine(" ", "--------------", 1,1,1, .5,.5,.5)
		GameTooltip:AddDoubleLine(" ",U["Toggle Calendar"].."|cffFF0000--|r"..U["Toggle Clock"],1,1,1,.6,.8,1)
		GameTooltip:Show()
	end)

	SpecTimeFrame:SetScript("OnLeave", GameTooltip_Hide)
	SpecTimeFrame:SetScript("OnUpdate", Update)
	SpecTimeFrame:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton"  then				
			ToggleTimeManager()
		else
			ToggleCalendar()  --GameTimeFrame:Click()
		end
	end)
	Update(SpecTimeFrame, 10)
end
-------------------------------------  Guild  ------------------------------------------------------------------------------------------
if Cfg_Guild == true then
	-- localized references for global functions (about 50% faster)
	local format		= string.format
	local gsub			= string.gsub
	local sort			= table.sort
	local ceil			= math.ceil

	local activezone, inactivezone = {r=0.3, g=1.0, b=0.3}, {r=0.65, g=0.65, b=0.65}
	local guildMotDString = "%s |cffaaaaaa- |cffffffff%s"
	local levelNameString = "|cff%02x%02x%02x%d|r |cff%02x%02x%02x%s|r %s"
	local levelNameStatusString = "|cff%02x%02x%02x%d|r %s %s %s"
	local nameRankString = "%s |cff999999-|cffffffff %s"
	local friendOnline, friendOffline = gsub(ERR_FRIEND_ONLINE_SS,"\124Hplayer:%%s\124h%[%%s%]\124h",""), gsub(ERR_FRIEND_OFFLINE_S,"%%s","")
	local guildTable, guildMotD = {}, ""

	local StatGuildFrame = CreateFrame("Frame", "StatGuildFrame", UIParent)
	StatGuildFrame:EnableMouse(true)
	StatGuildFrame:SetFrameStrata("BACKGROUND")
	StatGuildFrame:SetFrameLevel(3)
	StatGuildFrame:SetHitRectInsets(0, 0, 0, -10)

	local Text  = StatGuildFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_GuildPoint))
	StatGuildFrame:SetAllPoints(Text)

	local function SortGuildTable(shift)
		sort(guildTable, function(a, b)
			if a and b then
				if shift then
					return a[10] < b[10]
				else
					return a[diminfo.Sortingby] < b[diminfo.Sortingby]
				end
			end
		end)
	end

	local function BuildGuildTable()
		wipe(guildTable)
		local count = 0
		local _, _, online = GetNumGuildMembers()
		for i = 1, online do
			local name, rank, rankIndex, level, _, zone, note, officernote, connected, status, class, _, _, mobile = GetGuildRosterInfo(i)
			if (UnitInParty(name) or UnitInRaid(name)) and name ~= UnitName("player") then
				flag = "|cffaaaaaa*|r"
			elseif name == UnitName("player") then
				flag = "|cff00ff00*|r"
			else
				flag = ""
			end

			if mobile then
				zone = REMOTE_CHAT
				if status == 1 then
					status = "|TInterface\\ChatFrame\\UI-ChatIcon-ArmoryChat-AwayMobile:14:14:-2:-2:16:16:0:16:0:16|t"
				elseif status == 2 then
					status = "|TInterface\\ChatFrame\\UI-ChatIcon-ArmoryChat-BusyMobile:14:14:-2:-2:16:16:0:16:0:16|t"
				else
					status = ChatFrame_GetMobileEmbeddedTexture(73/255, 177/255, 73/255)
				end
			else
				if status == 1 then
					status = "|T"..FRIENDS_TEXTURE_AFK..":14:14:-2:-2:16:16:0:16:0:16|t"
				elseif status == 2 then
					status = "|T"..FRIENDS_TEXTURE_DND..":14:14:-2:-2:16:16:0:16:0:16|t"
				else
					status = " "
				end
			end
			if not zone then zone = U["Unknown"] end
			if connected or mobile then 
				count = count + 1
				guildTable[count] = { name, rank, level, zone, note, officernote, connected, status, class, rankIndex, flag }
			end
		end
		SortGuildTable(IsShiftKeyDown())
	end

	local function UpdateGuildMessage()
		guildMotD = GetGuildRosterMOTD()
	end

	local function Update(self, event, ...)	
		if (diminfo.Sortingby == nil) then diminfo.Sortingby = 9 end
		if (diminfo.Sortingbystring == nil) then diminfo.Sortingbystring = CLASS end
		if IsInGuild() then
			-- special handler to request guild roster updates when guild members come online or go
			-- offline, since this does not automatically trigger the GuildRoster update from the server
			if event == "CHAT_MSG_SYSTEM" then
				local message = select(1, ...)
				if string.find(message, friendOnline) or string.find(message, friendOffline) then GuildRoster() end
			end
			-- our guild message of the day changed
			if event == "GUILD_MOTD" then UpdateGuildMessage() return end
			-- when we enter the world and guildframe is not available then
			-- load guild frame, update guild message
			if event == "PLAYER_ENTERING_WORLD" then
				if not GuildFrame and IsInGuild() then LoadAddOn("Blizzard_GuildUI") UpdateGuildMessage() end
			end
			-- an event occured that could change the guild roster, so request update, and wait for guild roster update to occur
			if event ~= "GUILD_ROSTER_UPDATE" and event ~= "PLAYER_GUILD_UPDATE" then GuildRoster() return end

			local _, _, online = GetNumGuildMembers()
			Text:SetText(format(Cfg_ColorClass and "%d"..I.MyColor.."%s" or "%d%s", online,">.<"))
		else
			Text:SetText(Cfg_ColorClass and I.MyColor.."Orz" or "Orz")
		end
	end
		
	local menuFrame = CreateFrame("Frame", "GuildRightClickMenu", UIParent, "L_UIDropDownMenuTemplate")
	local menuList = {
		{ text = OPTIONS_MENU, isTitle = true, notCheckable=true},
		{ text = INVITE, hasArrow = true, notCheckable=true},
		{ text = CHAT_MSG_WHISPER_INFORM, hasArrow = true, notCheckable=true},
		{ text = U["Sorting"], hasArrow = true, notCheckable=true}
	}

	local function inviteClick(self, arg1, arg2)
		menuFrame:Hide()
		InviteUnit(arg1)
	end

	local function whisperClick(self,arg1,arg2)
		menuFrame:Hide()
		SetItemRef( "player:"..arg1, ("|Hplayer:%1$s|h[%1$s]|h"):format(arg1), "LeftButton" )
	end

	local function sortingClick(self,arg1,arg2)
		menuFrame:Hide()
		diminfo.Sortingby = arg1
		diminfo.Sortingbystring = arg2
	end
	

	StatGuildFrame:SetScript("OnMouseUp", function(self, btn)
		if btn == "LeftButton" then ToggleGuildFrame() end
		if btn ~= "RightButton" or not IsInGuild() then return end
		if InCombatLockdown() then return end
		GameTooltip:Hide()

		local classc, levelc, grouped, info, members
		local menuCountWhispers = 0
		local menuCountInvites = 0

		menuList[2].menuList = {}
		menuList[3].menuList = {}
		menuList[4].menuList = {}

		if #guildTable > 50 then
			members = 50
		else
			members = #guildTable
		end
		for i = 1, members do	-- maximum 50 members
			info = guildTable[i]
			if info[7] and info[1] ~= GetUnitName("player") then
				local classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[9]], GetQuestDifficultyColor(info[3])
				if UnitInParty(info[1]) or UnitInRaid(info[1]) then
					grouped = "|cffaaaaaa*|r"
				else
					menuCountInvites = menuCountInvites + 1
					grouped = ""
					menuList[2].menuList[menuCountInvites] = {text = format(levelNameString, levelc.r*255,levelc.g*255,levelc.b*255, info[3], classc.r*255,classc.g*255,classc.b*255, info[1], ""), arg1 = info[1],notCheckable=true, func = inviteClick}
				end
				menuCountWhispers = menuCountWhispers + 1
				menuList[3].menuList[menuCountWhispers] = {text = format(levelNameString, levelc.r*255,levelc.g*255,levelc.b*255, info[3], classc.r*255,classc.g*255,classc.b*255, info[1], grouped), arg1 = info[1],notCheckable=true, func = whisperClick}
			end
		end

		sortbyt = {NAME, RANK, LEVEL, ZONE, CLASS}
		sortbyw = {1, 10, 3, 4, 9}
		for i = 1, #sortbyt do
			menuList[4].menuList[i] = {text = sortbyt[i], arg1 = sortbyw[i], arg2 = sortbyt[i], func = sortingClick}
			if menuList[4].menuList[i].arg1 == diminfo.Sortingby then
				menuList[4].menuList[i].checked = true
			else
				menuList[4].menuList[i].checked = false
			end
		end
		L_EasyMenu(menuList, menuFrame, self, 0, 0, "MENU", 2)
	end)

	StatGuildFrame:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -20)	
		GameTooltip:ClearLines()
		if not IsInGuild() then
			GameTooltip:AddLine(I.MyColor..UnitName("player"))
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(U["NotInGuild"], 1,1,1)
			GameTooltip:AddDoubleLine(" ", "--------------", 1,1,1, .5,.5,.5)
			GameTooltip:AddDoubleLine(" ", U["LookForGuild"], 1,1,1, .6,.8,1)
			GameTooltip:Show()
			return
		end
		local total, _, online = GetNumGuildMembers()
		GuildRoster()
		BuildGuildTable()

		local guildName, guildRank = GetGuildInfo("player")
		GameTooltip:AddLine(guildName, 0,.6,1)
		GameTooltip:AddDoubleLine(format("%s: %d/%d", GUILD_ONLINE_LABEL, online, total), format(GUILDINFOTAB_APPLICANTS, GetNumGuildApplicants()), .6,.8,1, .6,.8,1)
		GameTooltip:AddDoubleLine(RANK..": ", guildRank, .6,.8,1)
		GameTooltip:AddLine(" ")

		local _, _, standingID, barMin, barMax, barValue = GetGuildFactionInfo()
				
local function ShortValue(v)
	if v >= 1e6 then
		return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif v >= 1e4 or v <= -1e4 then
		return ("%.1f万"):format(v / 1e4):gsub("%.?0+([km])$", "%1")
	else
		return v
	end
end

		if standingID ~= 8 then
			local standingText = GetText("FACTION_STANDING_LABEL"..standingID)
			barMax = barMax - barMin
			barValue = barValue - barMin
			GameTooltip:AddDoubleLine(GUILD_REPUTATION..":", format("%s %s/%s (%s%%)", standingText, ShortValue(barValue), ShortValue(barMax), ceil((barValue / barMax) * 100)), .6,.8,1, 1,1,1)
		end
		local guildMotD = GetGuildRosterMOTD()
		if guildMotD ~= "" then GameTooltip:AddLine(format(guildMotDString, GUILD_MOTD, guildMotD), .6,.8,1,1) end
		GameTooltip:AddLine(" ")

		local zonec, classc, levelc, info
		local shown = 0
		for i = 1, #guildTable do
			-- if more then 30 guild members are online, we don't Show any more, but inform user there are more
			if 30 - shown <= 1 then
				if online - 30 > 1 then
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine(format(U["Hide Members"], online - 30), .6,.8,1)
				end
				break
			end

			info = guildTable[i]
			if GetRealZoneText() == info[4] then zonec = activezone else zonec = inactivezone end
			classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[9]], GetQuestDifficultyColor(info[3])

			if IsShiftKeyDown() then
				GameTooltip:AddDoubleLine(format(nameRankString, info[1], info[2]), info[4], classc.r, classc.g, classc.b, zonec.r, zonec.g, zonec.b)
				if info[5] ~= "" then GameTooltip:AddLine(format("|cff999999%s:|r %s", LABEL_NOTE, info[5]), .6,.8,1,1) end
				if info[6] ~= "" then GameTooltip:AddLine(format("|cff999999%s:|r %s", GUILD_RANK1_DESC, info[6]), .3,1,.3,1) end
			else
				local name = Ambiguate(info[1], "guild")
				GameTooltip:AddDoubleLine(format(levelNameStatusString, levelc.r*255, levelc.g*255, levelc.b*255, info[3], name, info[11], info[8]), info[4], classc.r,classc.g,classc.b, zonec.r,zonec.g,zonec.b)
			end
			shown = shown + 1
		end
		--GameTooltip:AddDoubleLine(" ",U["Show Menus"],1,1,1,.6,.8,1)
		GameTooltip:AddDoubleLine(" ","--------------",1,1,1,0.5,0.5,0.5)
		GameTooltip:AddDoubleLine(" ",U["Sorting by:"].." |cff55ff55"..diminfo.Sortingbystring,1,1,1,.6,.8,1)
		GameTooltip:Show()
	end)

	StatGuildFrame:SetScript("OnLeave", GameTooltip_Hide)
	StatGuildFrame:RegisterEvent("GUILD_ROSTER_SHOW")
	StatGuildFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	StatGuildFrame:RegisterEvent("GUILD_ROSTER_UPDATE")
	StatGuildFrame:RegisterEvent("PLAYER_GUILD_UPDATE")
	StatGuildFrame:RegisterEvent("GUILD_MOTD")
	StatGuildFrame:RegisterEvent("CHAT_MSG_SYSTEM")
	StatGuildFrame:SetScript("OnEvent", Update)
end
-------------------------------------  Friends  ------------------------------------------------------------------------------------------
if Cfg_Friends == true then
	-- create a popup
	StaticPopupDialogs.SET_BN_BROADCAST = {
		text = BN_BROADCAST_TOOLTIP,
		button1 = ACCEPT,
		button2 = CANCEL,
		hasEditBox = 1,
		editBoxWidth = 350,
		maxLetters = 127,
		OnAccept = function(self) BNSetCustomMessage(self.editBox:GetText()) end,
		OnShow = function(self) self.editBox:SetText(select(3, BNGetInfo()) ) self.editBox:SetFocus() end,
		OnHide = ChatEdit_FocusActiveWindow,
		EditBoxOnEnterPressed = function(self) BNSetCustomMessage(self:GetText()) self:GetParent():Hide() end,
		EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
		timeout = 0,
		exclusive = 1,
		whileDead = 1,
		hideOnEscape = 1
	}

	local format = string.format
	local sort = table.sort

	local StatFriendsFrame = CreateFrame("Frame", "StatFriendsFrame", UIParent)
	StatFriendsFrame:EnableMouse(true)
	StatFriendsFrame:SetFrameStrata("BACKGROUND")
	StatFriendsFrame:SetFrameLevel(3)
	StatFriendsFrame:SetHitRectInsets(0, 0, 0, -10)
	local Text = StatFriendsFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_FriendsPoint))
	StatFriendsFrame:SetAllPoints(Text)

	local function checkStatus()
		local status = {}
		if IsChatDND() then
			status = {false, true, false}
		elseif IsChatAFK() then
			status = {false, false, true}
		else
			status = {true, false, false}
		end
		return status
	end
	local menuFrame = CreateFrame("Frame", "FriendRightClickMenu", UIParent, "L_UIDropDownMenuTemplate")
	local menuList = {
		{text = OPTIONS_MENU, isTitle = true, notCheckable = true},
		{text = INVITE, hasArrow = true, notCheckable = true},
		{text = CHAT_MSG_WHISPER_INFORM, hasArrow = true, notCheckable = true},
		{text = PLAYER_STATUS, hasArrow = true, notCheckable = true,
			menuList = {
				{ text = "|cff2BC226"..AVAILABLE.."|r", checked = function() return checkStatus()[1] end, func = function() if IsChatAFK() then SendChatMessage("", "AFK") elseif IsChatDND() then SendChatMessage("", "DND") end end},
				{ text = "|cffE7E716"..DND.."|r", checked = function() return checkStatus()[2] end, func = function() if not IsChatDND() then SendChatMessage("", "DND") end end},
				{ text = "|cffFF0000"..AFK.."|r", checked = function() return checkStatus()[3] end, func = function() if not IsChatAFK() then SendChatMessage("", "AFK") end end},
			},
		},
		{text = U["BN Info"], notCheckable = true, func = function() StaticPopup_Show("SET_BN_BROADCAST") end},
	}

	local function inviteClick(self, arg1, arg2)
		InviteToGroup(arg1)
		DropDownList1:Hide()
	end

	local function whisperClick(self, arg1, arg2)
		SetItemRef("player:"..arg1, ("|Hplayer:%1$s|h[%1$s]|h"):format(arg1), "LeftButton")
		DropDownList1:Hide()
	end
	
	local function BNwhisperClick(self, arg1, arg2)
		SetItemRef("BNplayer:"..arg1..":"..arg2, ("|Hplayer:%1$s|h[%1$s]|h"):format(arg1), "LeftButton")
		DropDownList1:Hide()
	end

	local function HexColor(c)
		return (c.r and format("|cff%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255))
	end

	local worldOfWarcraftString = U["WoW"]
	local battleNetString = U["BN"]
	local activezone, inactivezone = {r=.3, g=1, b=.3}, {r=.65, g=.65, b=.65}
	local friendTable, BNTable = {}, {}
	local friendOnline, friendOffline = gsub(ERR_FRIEND_ONLINE_SS,"\124Hplayer:%%s\124h%[%%s%]\124h",""), gsub(ERR_FRIEND_OFFLINE_S,"%%s","")
	local dataValid = false

	local function BuildFriendTable(total)
		wipe(friendTable)
		for i = 1, total do
			local name, level, class, area, connected, status, note = GetFriendInfo(i)
			if connected then
				if status == CHAT_FLAG_AFK then
					status = "|T"..FRIENDS_TEXTURE_AFK..":14:14:-2:-2:16:16:0:16:0:16|t"
				elseif status == CHAT_FLAG_DND then
					status = "|T"..FRIENDS_TEXTURE_DND..":14:14:-2:-2:16:16:0:16:0:16|t"
				else
					status = ""
				end
				for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do if class == v then class = k end end
				friendTable[i] = { name, level, class, area, connected, status, note }
			end
		end
		sort(friendTable, function(a, b)
			if a[1] and b[1] then
				return a[1] < b[1]
			end
		end)
	end

	local function BuildBNTable(total)
		wipe(BNTable)
		for i = 1, total do
			local bnID, presenceName, battleTag, isBattleTagPresence, charName, gameID, client, isOnline, _, isAFK, isDND = BNGetFriendInfo(i)
			if isOnline then
				local _, _, _, realmName, _, faction, race, class, _, zoneName, level, gameText, _, _, _, _, _, isGameAFK, isGameBusy = BNGetGameAccountInfo(gameID)
				charName = BNet_GetValidatedCharacterName(charName, battleTag, client)
				for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
					if class == v then
						class = k
					end
				end
				local status, account, infoText
				if isAFK or isGameAFK then
					status = " |T"..FRIENDS_TEXTURE_AFK..":14:14:-2:-2:16:16:0:16:0:16|t"
				elseif isDND or isGameBusy then
					status = " |T"..FRIENDS_TEXTURE_DND..":14:14:-2:-2:16:16:0:16:0:16|t"
				else
					status = ""
				end
				if client == BNET_CLIENT_WOW then
					if ( not zoneName or zoneName == "" ) then
						infoText = UNKNOWN
					else
						infoText = zoneName
					end
				else
					infoText = gameText
				end
				BNTable[i] = { bnID, presenceName, battleTag, isBattleTagPresence, charName, gameID, client, isOnline, status, realmName, class, infoText }
			end
		end
		sort(BNTable, function(a, b)
			if a[7] and b[7] then
				return a[7] > b[7]
			end
		end)
	end

	local function Update(self, event, arg1)
		if event == "CHAT_MSG_SYSTEM" then
			if not (string.find(arg1, friendOnline) or string.find(arg1, friendOffline)) then return end
		elseif event == "MODIFIER_STATE_CHANGED" and arg1 == "LSHIFT" then
			self:GetScript("OnEnter")(self)
		end

		local _, onlineFriends = GetNumFriends()
		local _, numBNetOnline = BNGetNumFriends()
		--Text:SetText(format("%s: "..I.MyColor.."%d", FRIENDS, onlineFriends + numBNetOnline))
		Text:SetText(format(Cfg_ColorClass and "%d"..I.MyColor.."%s" or "%d%s",onlineFriends + numBNetOnline,"^-^"))
		dataValid = false
	end

	StatFriendsFrame:SetScript("OnMouseUp", function(self, btn)
		GameTooltip:Hide()
		if btn == "LeftButton" then ToggleFriendsFrame() end
		if btn ~= "RightButton" then return end

		local menuCountWhispers = 0
		local menuCountInvites = 0
		local classc, levelc, info
		menuList[2].menuList = {}
		menuList[3].menuList = {}

		if #friendTable > 0 then
			for i = 1, #friendTable do
				info = friendTable[i]
				if (info[5]) then
					menuCountInvites = menuCountInvites + 1
					menuCountWhispers = menuCountWhispers + 1
					classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[3]], GetQuestDifficultyColor(info[2])
					if classc == nil then classc = levelc end
					local nametext = HexColor(levelc)..info[2].." "..HexColor(classc)..info[1]
					menuList[2].menuList[menuCountInvites] = {text = nametext, arg1 = info[1], notCheckable = true, func = inviteClick}
					menuList[3].menuList[menuCountWhispers] = {text = nametext, arg1 = info[1], notCheckable = true, func = whisperClick}
				end
			end
		end

		if #BNTable > 0 then
			for i = 1, #BNTable do
				info = BNTable[i]
				if (info[8]) then
					menuCountWhispers = menuCountWhispers + 1
					menuList[3].menuList[menuCountWhispers] = {text = "|cff70C0F5"..info[2], arg1 = info[2], arg2 = info[1], notCheckable = true, func = BNwhisperClick}
					if info[7] == BNET_CLIENT_WOW and CanCooperateWithGameAccount(info[6]) then
						menuCountInvites = menuCountInvites + 1
						menuList[2].menuList[menuCountInvites] = {text = "|cff70C0F5"..info[2], arg1 = info[5].."-"..info[10], notCheckable = true, func = inviteClick}
					end
				end
			end
		end

		L_EasyMenu(menuList, menuFrame, self, 0, -10, "MENU", 2)
	end)

	StatFriendsFrame:SetScript("OnEnter", function(self)
		local numberOfFriends, onlineFriends = GetNumFriends()
		local totalBNet, numBNetOnline = BNGetNumFriends()
		local totalonline = onlineFriends + numBNetOnline
		if not dataValid then
			-- only retrieve information for all on-line members when we actually view the tooltip
			if numberOfFriends > 0 then BuildFriendTable(numberOfFriends) end
			if totalBNet > 0 then BuildBNTable(totalBNet) end
			dataValid = true
		end

		local totalfriends = numberOfFriends + totalBNet
		local zonec, classc, levelc, realmc, info

		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetPoint("TOPLEFT", UIParent, 15, -30)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(FRIENDS_LIST, format("%s: %s/%s", GUILD_ONLINE_LABEL, totalonline, totalfriends), 0,.6,1, 0,.6,1)
		if totalonline == 0 then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(U["No Online"], 1,1,1)
		end
		if onlineFriends > 0 then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(worldOfWarcraftString, 0,.6,1)
			for i = 1, #friendTable do
				info = friendTable[i]
				if info[5] then
					if GetRealZoneText() == info[4] then zonec = activezone else zonec = inactivezone end
					classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[3]], GetQuestDifficultyColor(info[2])
					if classc == nil then classc = levelc end
					GameTooltip:AddDoubleLine(format(HexColor(levelc)..info[2].."|r "..info[1].." "..info[6]), info[4], classc.r, classc.g, classc.b, zonec.r, zonec.g, zonec.b)
				end
			end
		end

		if numBNetOnline > 0 then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(battleNetString, 0,.6,1)
			for i = 1, #BNTable do
				info = BNTable[i]
				if info[8] then
					local nametext = FRIENDS_OTHER_NAME_COLOR_CODE.." ("..info[5]..")"
					if info[4] then account = info[3] else account = info[2] end
					if info[7] == BNET_CLIENT_WOW then
						if CanCooperateWithGameAccount(info[6]) then
							classc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[info[11]]
							if not classc then classc = GetQuestDifficultyColor(1) end
							nametext = HexColor(classc).." "..info[5]
						end
						if GetRealZoneText() == info[12] then zonec = activezone else zonec = inactivezone end
						if GetRealmName() == info[10] then realmc = activezone else realmc = inactivezone end
					else
						zonec = inactivezone
						realmc = inactivezone
					end

					local cicon = BNet_GetClientEmbeddedTexture(info[7], 14, 14, 0, -1)
					GameTooltip:AddDoubleLine(cicon..nametext..info[9], account, 1,1,1, .6,.8,1)
					if IsShiftKeyDown() then
						GameTooltip:AddDoubleLine(info[12], info[10], zonec.r, zonec.g, zonec.b, realmc.r, realmc.g, realmc.b)
					end
				end
			end
		end
		GameTooltip:AddDoubleLine(" ","--------------",1,1,1,0.5,0.5,0.5)
		GameTooltip:AddDoubleLine(" ",U["Show Menus"],1,1,1,.6,.8,1)
		GameTooltip:Show()	
		self:RegisterEvent("MODIFIER_STATE_CHANGED")
	end)

	StatFriendsFrame:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		self:UnregisterEvent("MODIFIER_STATE_CHANGED")
	end)

	StatFriendsFrame:RegisterEvent("BN_FRIEND_ACCOUNT_ONLINE")
	StatFriendsFrame:RegisterEvent("BN_FRIEND_ACCOUNT_OFFLINE")
	StatFriendsFrame:RegisterEvent("BN_FRIEND_INFO_CHANGED")
	StatFriendsFrame:RegisterEvent("BN_FRIEND_TOON_ONLINE")
	StatFriendsFrame:RegisterEvent("BN_FRIEND_TOON_OFFLINE")
	StatFriendsFrame:RegisterEvent("BN_TOON_NAME_UPDATED")
	StatFriendsFrame:RegisterEvent("FRIENDLIST_UPDATE")
	StatFriendsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	StatFriendsFrame:RegisterEvent("CHAT_MSG_SYSTEM")
	StatFriendsFrame:SetScript("OnEvent", Update)
end
-------------------------------------  Durability  ------------------------------------------------------------------------------------------
if Cfg_Durability == true then
	local StatDurabilityFrame = CreateFrame("Frame", "StatDurabilityFrame", UIParent)
	StatDurabilityFrame:EnableMouse(true)
	StatDurabilityFrame:SetFrameStrata("BACKGROUND")
	StatDurabilityFrame:SetFrameLevel(3)
	StatDurabilityFrame:SetHitRectInsets(0, 0, -10, 0)
	local Text = StatDurabilityFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_DurabilityPoint))
	StatDurabilityFrame:SetAllPoints(Text)

	local localSlots = {
		[1] = {1, HEADSLOT, 1000},
		[2] = {3, SHOULDERSLOT, 1000},
		[3] = {5, CHESTSLOT, 1000},
		[4] = {6, WAISTSLOT, 1000},
		[5] = {9, WRISTSLOT, 1000},
		[6] = {10, HANDSSLOT, 1000},
		[7] = {7, LEGSSLOT, 1000},
		[8] = {8, FEETSLOT, 1000},
		[9] = {16, MAINHANDSLOT, 1000},
		[10] = {17, SECONDARYHANDSLOT, 1000}		
	}
--[11] = {18, RANGEDSLOT , 1000}
	local inform = CreateFrame("Frame", nil, nil, "MicroButtonAlertTemplate")
	inform:SetPoint("BOTTOM", Text, "TOP", 0, 23)
	inform.Text:SetText(U["Low Durability"])
	inform:Hide()
	local Total = 0
	local function OnEvent(self)
		if not diminfo.RepairType then diminfo.RepairType = 1 end
		for i = 1, 10 do
			if GetInventoryItemLink("player", localSlots[i][1]) ~= nil then
				local current, max = GetInventoryItemDurability(localSlots[i][1])
				if current then 
					localSlots[i][3] = current/max
					Total = Total + 1
				end
			else
				localSlots[i][3] = 1000
			end
		end
		table.sort(localSlots, function(a, b) return a[3] < b[3] end)

		for i = 1, 10 do
			if localSlots[i][3] < .25 then
				inform:Show()
				break
			end
		end
		
		local init_gradient = function(perc)
	    perc = perc > 1 and 1 or perc < 0 and 0 or perc -- Stay between 0-1
	    local seg, relperc = math.modf(perc*2)
	    local r1,g1,b1,r2,g2,b2 = select(seg*3+1,1,0,0,1,1,0,0,1,0,0,0,0) -- R -> Y -> G
	    local r,g,b = r1+(r2-r1)*relperc,g1+(g2-g1)*relperc,b1+(b2-b1)*relperc
	    return format("|cff%02x%02x%02x",r*255,g*255,b*255),r,g,b
    end

		if Total > 0 then
			Text:SetText(format(gsub("[color]%d|r%%","%[color%]",(init_gradient(floor(localSlots[1][3]*100)/100))), floor(localSlots[1][3]*100)))
		else
			Text:SetText(I.MyColor.."0.0|r")
		end
		Total = 0
	end

	StatDurabilityFrame:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
	StatDurabilityFrame:RegisterEvent("MERCHANT_SHOW")
	StatDurabilityFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	StatDurabilityFrame:SetScript("OnEvent", OnEvent)
	StatDurabilityFrame:SetScript("OnMouseUp", function(self, button)
		if button == "RightButton" then
			diminfo.RepairType = diminfo.RepairType + 1
			if diminfo.RepairType == 3 then diminfo.RepairType = 0 end
			self:GetScript("OnEnter")(self)
		else
			ToggleCharacter("PaperDollFrame")
		end
	end)

	local repairlist = {
		[0] = "|cffff5555"..VIDEO_OPTIONS_DISABLED,
		[1] = "|cff55ff55"..VIDEO_OPTIONS_ENABLED,
		[2] = "|cffffff55"..U["NFG"]
	}
	StatDurabilityFrame:SetScript("OnEnter", function(self)
		local total, equipped = GetAverageItemLevel()
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(DURABILITY, format("%s: %d/%d", STAT_AVERAGE_ITEM_LEVEL, equipped, total), 0,.6,1, 0,.6,1)
		GameTooltip:AddLine(" ")

		for i = 1, 10 do
			if localSlots[i][3] ~= 1000 then
				local green = localSlots[i][3]*2
				local red = 1 - green
				local slotIcon = "|T"..GetInventoryItemTexture("player", localSlots[i][1])..":13:15:0:0:50:50:4:46:4:46|t " or ""
				GameTooltip:AddDoubleLine(slotIcon..localSlots[i][2]..":", floor(localSlots[i][3]*100).."%", 1,1,1, red+1,green,0)
			end
		end

		GameTooltip:AddDoubleLine(" ", "--------------", 1,1,1, .5,.5,.5)
		GameTooltip:AddDoubleLine(" ", U["AutoRepair"]..": "..repairlist[diminfo.RepairType], 1,1,1, .6,.8,1)
		GameTooltip:Show()
	end)
	StatDurabilityFrame:SetScript("OnLeave", GameTooltip_Hide)

	-- Auto repair
	local g = CreateFrame("Frame")
	g:RegisterEvent("MERCHANT_SHOW")
	g:SetScript("OnEvent", function()    
		if (diminfo.RepairType ~= 0 and CanMerchantRepair()) then
			local cost = GetRepairAllCost()
			if cost > 0 then
				local money = GetMoney()
				if IsInGuild() and diminfo.RepairType == 1 then
					local guildMoney = GetGuildBankWithdrawMoney()
					if guildMoney > GetGuildBankMoney() then
						guildMoney = GetGuildBankMoney()
					end
					if guildMoney >= cost and CanGuildBankRepair() then
					   RepairAllItems(1)
					   print(format("|cff99CCFF"..U["Repair cost covered by G-Bank"]..":|r".."|cffFFFFFF%s|r", GetMoneyString(cost)))
					   return
					elseif guildMoney == 0 and IsGuildLeader() then
					   RepairAllItems(1)
					   print(format("|cff99CCFF"..U["Repair cost covered by G-Bank"]..":|r".."|cffFFFFFF%s|r", GetMoneyString(cost)))
					   return
					end
				end
				if money > cost then
					RepairAllItems()
					print(format("|cff99CCFF"..U["Repair cost"]..": |r|cffFFFFFF%s|r", GetMoneyString(cost)))
				else
					print("|cff99CCFF"..U["Go farm newbie"].."|r")
				end
			end
		end
	end)
end
-------------------------------------  System  ------------------------------------------------------------------------------------------
if Cfg_System == true then
	local StatSystemFrame = CreateFrame("Frame", "StatSystemFrame", UIParent)
	StatSystemFrame:EnableMouse(true)
	StatSystemFrame:SetFrameStrata("BACKGROUND")
	StatSystemFrame:SetFrameLevel(3)
	StatSystemFrame:SetHitRectInsets(0, 0, 0, -10)
	local Text = StatSystemFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_SystemPoint))
	StatSystemFrame:SetAllPoints(Text)

	local function colorlatency(latency)
		if latency < 300 then
			return "|cff0CD809"..latency
		elseif (latency >= 300 and latency < 500) then
			return "|cffE8DA0F"..latency
		else
			return "|cffD80909"..latency
		end
	end
	local int = 1
	local function Update(self, t)
		int = int - t
		local fpscolor

		if int < 0 then
			local _, _, latencyHome, latencyWorld = GetNetStats()
			lat = math.max(latencyHome, latencyWorld)
			if floor(GetFramerate()) >= 30 then
				fpscolor = "|cff0CD809"
			elseif (floor(GetFramerate()) > 15 and floor(GetFramerate()) < 30) then
				fpscolor = "|cffE8DA0F"
			else
				fpscolor = "|cffD80909"
			end
			Text:SetText(fpscolor..floor(GetFramerate()).."|r".."Fps "..colorlatency(lat).."|r".."Ms")
			int = .8
		end
	end

	local UsageTable
	local function RefreshUsage()
		UsageTable = {}
		UpdateAddOnCPUUsage()
		local total, count = .001, 0
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				count = count + 1
				local usage = GetAddOnCPUUsage(i)
				UsageTable[count] = {select(2, GetAddOnInfo(i)), usage}
				total = total + usage
			end
		end

		table.sort(UsageTable, function(a, b)
			if a and b then
				return a[2] > b[2]
			end
		end)
		return total
	end

	StaticPopupDialogs["CPUUSAGE"] = {
		text = U["Toggle CPU Usage"],
		button1 = APPLY,
		button2 = CLASS_TRIAL_THANKS_DIALOG_CLOSE_BUTTON,
		OnAccept = function()
			ReloadUI()
		end,
		whileDead = 1,
	}

	StatSystemFrame:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -20)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(U["System"], 0,.6,1)
		GameTooltip:AddLine(" ")

		if GetCVar("scriptProfile") == "1" then
			local totalUsage = RefreshUsage()
			local maxAddOns = math.min(Cfg_MaxAddOns, #UsageTable)
			if IsShiftKeyDown() then
				maxAddOns = #UsageTable
			end

			for i = 1, maxAddOns do
				local percent = UsageTable[i][2]/totalUsage * 100
				local color = percent <= 1 and {0, 1} -- 0 - 1
				or percent <= 5 and {.75, 1} -- 1 - 5
				or percent <= 10 and {1, 1} -- 5 - 10
				or percent <= 25 and {1, .75} -- 10 - 25
				or percent <= 50 and {1, .5} -- 25 - 50
				or {1, .1} -- 50 +
				GameTooltip:AddDoubleLine(UsageTable[i][1], format("%.2f%s", percent, " %"), 1, 1, 1, color[1], color[2], 0)
			end

			local hiddenUsage = 0
			if not IsShiftKeyDown() then
				for i = (Cfg_MaxAddOns + 1), #UsageTable do
					hiddenUsage = hiddenUsage + UsageTable[i][2]
				end
				if #UsageTable > Cfg_MaxAddOns then
					local numHidden = #UsageTable - Cfg_MaxAddOns
					GameTooltip:AddDoubleLine(format("%d %s (%s)", numHidden, U["Hidden"], U["Shift"]), format("%.2f%s", hiddenUsage/totalUsage*100, " %"), .6,.8,1, .6,.8,1)
				end
			end
			GameTooltip:AddLine(" ")
		end

		local _, _, latencyHome, latencyWorld = GetNetStats()
		GameTooltip:AddDoubleLine(U["Latency"]..":",format("%s%s(%s)/%s%s(%s)",colorlatency(latencyHome).."|r","Ms",U["Home"],colorlatency(latencyWorld).."|r","Ms",CHANNEL_CATEGORY_WORLD),.6, .8, 1, 1, 1, 1)
		GameTooltip:Show()
	end)

	local status = GetCVar("scriptProfile")
	StatSystemFrame:SetScript("OnLeave", GameTooltip_Hide)
	StatSystemFrame:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" then
			if GetCVar("scriptProfile") == "0" then
				SetCVar("scriptProfile", 1)
			else
				SetCVar("scriptProfile", 0)
			end

			if GetCVar("scriptProfile") == status then
				StaticPopup_Hide("CPUUSAGE")
			else
				StaticPopup_Show("CPUUSAGE")
			end
			self:GetScript("OnEnter")(self)
		end
	end)
	StatSystemFrame:SetScript("OnUpdate", Update) 
end
-------------------------------------  Memory  ------------------------------------------------------------------------------------------
if Cfg_Memory == true then
	local StatMemoryFrame = CreateFrame("Frame", "StatMemoryFrame", UIParent)
	StatMemoryFrame:SetFrameStrata("BACKGROUND")
	StatMemoryFrame:SetFrameLevel(3)
	StatMemoryFrame:EnableMouse(true)
	StatMemoryFrame:SetHitRectInsets(0, 0, 0, -10)
	local Text = StatMemoryFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_MemoryPoint))
	StatMemoryFrame:SetAllPoints(Text)

	local function formatMem(memory)
		local mult = 10^1
		if memory > 999 then
			local mem = floor((memory/1024) * mult + .5) / mult
			if mem % 1 == 0 then
				return mem..".0 mb"
			else
				return mem.." mb"
			end
		else
			local mem = floor(memory * mult + .5) / mult
			if mem % 1 == 0 then
				return mem..".0 kb"
			else
				return mem.." kb"
			end
		end
	end

	local memoryTable
	local function RefreshMemory()
		memoryTable = {}
		UpdateAddOnMemoryUsage()
		local total, count = 0, 0
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				local usage = GetAddOnMemoryUsage(i)
				count = count + 1
				memoryTable[count] = {select(2, GetAddOnInfo(i)), usage}
				total = total + usage
			end
		end

		table.sort(memoryTable, function(a, b)
			if a and b then
				return a[2] > b[2]
			end
		end)
		return total
	end
	
	local function RefreshText()
		UpdateAddOnMemoryUsage()
		local total = 0
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				local usage = GetAddOnMemoryUsage(i)
				total = total + usage
			end
		end
		return total
	end

	local function formatTotal(number)
		if number >= 1024 then
			return format("%.1f"..I.MyColor.."mb|r", number / 1024)
		else
			return format("%.1f"..I.MyColor.."kb|r", number)
		end
	end

	local int, Total = 5
	local function Update(self, t)
		int = int - t
		if int < 0 then
			Total = RefreshText()
			int = 5
		end
		Text:SetText(formatTotal(Total))
	end

	if not diminfo.AutoCollect then diminfo.AutoCollect = true end

	StatMemoryFrame:SetScript("OnMouseUp", function(self, btn)
		if btn == "LeftButton" then
			local before = gcinfo()
			collectgarbage("collect")
			print(format("|cff66C6FF%s:|r %s", U["Garbage collected"], formatMem(before - gcinfo())))
			RefreshMemory()
		elseif btn == "RightButton" then
			diminfo.AutoCollect = not diminfo.AutoCollect
		end
		self:GetScript("OnEnter")(self)
	end)

	StatMemoryFrame:SetScript("OnEnter", function(self)
		local totalMemory = RefreshMemory()
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -20)
		GameTooltip:ClearLines()
		GameTooltip:AddDoubleLine(format("%s:", ADDONS), formatMem(totalMemory), 0,.6,1, .6,.8,1)
		GameTooltip:AddLine(" ")

		local maxAddOns = math.min(Cfg_MaxAddOns, #memoryTable)
		if IsShiftKeyDown() then
			maxAddOns = #memoryTable
		end

		for i = 1, maxAddOns do
			local usage = memoryTable[i][2]
			local color = usage <= 204.8 and {0,1} -- 0 - 200
			or usage <= 1024 and {.75,1} -- 200 - 1024
			or usage <= 2560 and {1,1} -- 1024 - 2.5mb
			or usage <= 5120 and {1,.75} -- 2.5mb - 5mb
			or usage <= 10240 and {1,.5} -- 10mb
			or {1,.1} -- 10mb +
			GameTooltip:AddDoubleLine(memoryTable[i][1], formatMem(usage), 1, 1, 1, color[1], color[2], 0)
		end

		local hiddenMemory = 0
		if not IsShiftKeyDown() then
			for i = (Cfg_MaxAddOns + 1), #memoryTable do
				hiddenMemory = hiddenMemory + memoryTable[i][2]
			end
			if #memoryTable > Cfg_MaxAddOns then
				local numHidden = #memoryTable - Cfg_MaxAddOns
				GameTooltip:AddDoubleLine(format("%d %s (%s)", numHidden, U["Hidden"], U["Shift"]), formatMem(hiddenMemory), .6,.8,1, .6,.8,1)
			end
		end
		GameTooltip:AddLine(" ")
		GameTooltip:AddDoubleLine(U["Default UI Memory Usage:"], formatMem(gcinfo() - totalMemory), .6,.8,1, 1,1,1)
		GameTooltip:AddDoubleLine(U["Total Memory Usage:"], formatMem(collectgarbage("count")), .6,.8,1, 1,1,1)
		GameTooltip:AddDoubleLine(" ", "--------------", 1,1,1, .5,.5,.5)
		GameTooltip:AddDoubleLine(" ",U["AutoCollect"]..": "..(diminfo.AutoCollect and "|cff55ff55"..VIDEO_OPTIONS_ENABLED or "|cffff5555"..strupper(OFF)),1,1,1,.6,.8,1)
		GameTooltip:Show()
	end)

	StatMemoryFrame:SetScript("OnLeave", GameTooltip_Hide)
	StatMemoryFrame:SetScript("OnUpdate", Update)
	Update(StatMemoryFrame, 20)
	
	--自动回收内存
	local eventcount = 0
	local a = CreateFrame("Frame")
	a:RegisterAllEvents()
	a:SetScript("OnEvent", function(self, event)
		if diminfo.AutoCollect == true then
			eventcount = eventcount + 1
			if InCombatLockdown() then return end
			if eventcount > 6000 or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_REGEN_ENABLED" then
				collectgarbage("collect")
				eventcount = 0
			end
		end
	end)
end
-------------------------------------  Bags  ------------------------------------------------------------------------------------------
if Cfg_Bags == true then
    local StatBagsFrame = CreateFrame("Frame", "StatBagsFrame", UIParent)
    StatBagsFrame:EnableMouse(true)
    StatBagsFrame:SetHitRectInsets(0, 0, 0, -10)

    local Text  = StatBagsFrame:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(Cfg_Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(Cfg_BagsPoint))

	local function OnEvent(self, event, ...)
		local free, total, used = 0, 0, 0
		for i = 0, NUM_BAG_SLOTS do
			free, total = free + GetContainerNumFreeSlots(i), total + GetContainerNumSlots(i)
		end
		used = total - free
		--Text:SetText(Cfg_ColorClass and U["Bags"]..":"..I.MyColor..free or  U["Bags"]..":"..free)
		Text:SetText(Cfg_ColorClass and I.MyColor..free or free)
		self:SetAllPoints(Text)
		StatBagsFrame:SetScript("OnEnter", function()

			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6);
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(U["Bags"],0,.6,1)
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine(U["Total"]..":",total,.6,.8,1, 1, 1, 1)
			GameTooltip:AddDoubleLine(U["Used"]..":",used,.6,.8,1, 1, 1, 1)
			--GameTooltip:AddDoubleLine(" ","--------------",1,1,1,0.5,0.5,0.5)
			GameTooltip:Show()
		end)
		StatBagsFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end
          
    StatBagsFrame:RegisterEvent("PLAYER_LOGIN")
    StatBagsFrame:RegisterEvent("BAG_UPDATE")
    StatBagsFrame:SetScript("OnEvent", OnEvent)
	StatBagsFrame:SetScript("OnMouseDown", function(self,button)
			ToggleAllBags()
	end)
end

-------------------------------------  Coords  ------------------------------------------------------------------------------------------
if Cfg_Coords == true then
    local StatCoordsFrame = CreateFrame("Frame", "StatCoordsFrame", UIParent)
    StatCoordsFrame:EnableMouse(true)
    StatCoordsFrame:SetHitRectInsets(0, 0, 0, -10)

    local Text  = StatCoordsFrame:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(Cfg_Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(Cfg_CoordsPoint))
	StatCoordsFrame:SetAllPoints(Text)
	
	local coordX, coordY = 0, 0
	--local function formatCoords() return format("%.1f,%.1f", coordX*100, coordY*100) end
	local function formatCoords() return format("%d,%d", coordX*100, coordY*100) end
	
	StatCoordsFrame:SetScript("OnUpdate", function()
		coordX, coordY = GetPlayerMapPosition("player")
		Text:SetText(formatCoords())
	end)
	StatCoordsFrame:SetScript("OnMousedown", function(_,btn)
		if btn == "LeftButton" then
			ToggleFrame(WorldMapFrame)
		elseif btn == "MiddleButton" and GetCurrentMapAreaID() >= 1190 and GetCurrentMapAreaID() <= 1201 then
		  PVEFrame_ShowFrame("GroupFinderFrame", LFGListPVEStub)
		  LFGListCategorySelection_SelectCategory(LFGListFrame.CategorySelection, 6, 0)
		  LFGListCategorySelection_StartFindGroup(LFGListFrame.CategorySelection, zone)
		else
			ChatFrame_OpenChat(format("%s: %s",U["My Coordinate"],formatCoords()), chatFrame)
		end
	end)
end
-------------------------------------  Mail  ------------------------------------------------------------------------------------------
if Cfg_Mail == true then
    local StatMailFrame = CreateFrame("Frame", "StatMailFrame", UIParent)
    StatMailFrame:EnableMouse(false)
    StatMailFrame:SetHitRectInsets(0, 0, 0, -10)

    local Text  = StatMailFrame:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(Cfg_Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(Cfg_MailPoint))
	StatMailFrame:SetAllPoints(Text)

	StatMailFrame:SetScript("OnUpdate", function()
		Text:SetText(Cfg_ColorClass and (HasNewMail() and "|cff00FF00"..U["New"]..U["Mail"].."|r" or U["No Mail"].."|r") or HasNewMail() and "|cff00FF00"..U["New"]..U["Mail"].."|r" or U["No Mail"])
	end)
end
-------------------------------------  Gold  ------------------------------------------------------------------------------------------
if Cfg_Gold == true then
	local StatGoldFrame = CreateFrame("Frame", nil, UIParent)
	StatGoldFrame:EnableMouse(true)
	--StatGoldFrame:SetFrameStrata("BACKGROUND")
	StatGoldFrame:SetFrameLevel(3)
	StatGoldFrame:SetHitRectInsets(0, 0, -10, 0)
	local Text = StatGoldFrame:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(Cfg_Fonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(Cfg_GoldPoint))
	StatGoldFrame:SetAllPoints(Text)

	local Profit, Spent, OldMoney = 0, 0, 0
	local myName, myRealm = UnitName("player"), GetRealmName()

	local function formatTextMoney(money)
		return format("%.0f", money * 0.0001, GOLD_AMOUNT_SYMBOL)
		--return format("%.0f|cffffd700%s|r", money * 0.0001, GOLD_AMOUNT_SYMBOL)
	end

	local function GetClassIcon(class)
		local c1, c2, c3, c4 = unpack(CLASS_ICON_TCOORDS[class])
		c1, c2, c3, c4 = (c1+.03)*50, (c2-.03)*50, (c3+.03)*50, (c4-.03)*50
		local classStr = "|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:13:15:0:-1:50:50:"..c1..":"..c2..":"..c3..":"..c4.."|t "
		return classStr or ""
	end

	local function OnEvent(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		if (diminfo.AutoSell == nil) then diminfo.AutoSell = true end
		oldMoney = GetMoney()
		self:UnregisterEvent(event)
		end

		local NewMoney	= GetMoney()
		local Change = NewMoney-OldMoney -- Positive if we gain money
		if OldMoney > NewMoney then		-- Lost Money
			Spent = Spent - Change
		else							-- Gained Moeny
			Profit = Profit + Change
		end
		Text:SetText(formatTextMoney(NewMoney))

		if not diminfo.totalGold then diminfo.totalGold = {} end
		if not diminfo.totalGold[myRealm] then diminfo.totalGold[myRealm] = {} end
		diminfo.totalGold[myRealm][myName] = {GetMoney(), I.MyClass}

		OldMoney = NewMoney
	end

StaticPopupDialogs["RESETGOLD"] = {
	text = U["Are you sure to reset the gold count?"],
	button1 = YES,
	button2 = NO,
	OnAccept = function()
		diminfo.totalGold = {}
		diminfo.totalGold[myRealm] = {}
		diminfo.totalGold[myRealm][myName] = {GetMoney(), I.MyClass}
	end,
	whileDead = 1,
}

	StatGoldFrame:RegisterEvent("PLAYER_MONEY")
	StatGoldFrame:RegisterEvent("SEND_MAIL_MONEY_CHANGED")
	StatGoldFrame:RegisterEvent("SEND_MAIL_COD_CHANGED")
	StatGoldFrame:RegisterEvent("PLAYER_TRADE_MONEY")
	StatGoldFrame:RegisterEvent("TRADE_MONEY_CHANGED")
	StatGoldFrame:RegisterEvent("PLAYER_LOGIN")
	StatGoldFrame:SetScript("OnEvent", OnEvent)
	StatGoldFrame:SetScript("OnMouseUp", function(self, button)
		if IsControlKeyDown() then
			diminfo.AutoSell = not diminfo.AutoSell
			self:GetScript("OnEnter")(self)
		elseif button == "RightButton" then
			StaticPopup_Show("RESETGOLD")
		else
			ToggleCharacter("TokenFrame")
		end
	end)

	local function GetGoldString(number)
		local money = format("%d", number/1e4)
		return GetMoneyString(money*1e4)
	end

	StatGoldFrame:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6)
		GameTooltip:ClearLines()
		GameTooltip:AddLine(CURRENCY, 0,.6,1)
		GameTooltip:AddLine(" ")

		GameTooltip:AddLine(U["Session"]..": ", .6,.8,1)
		GameTooltip:AddDoubleLine(U["Earned:"], GetMoneyString(Profit), 1,1,1, 1,1,1)
		GameTooltip:AddDoubleLine(U["Spent:"], GetMoneyString(Spent), 1,1,1, 1,1,1)
		if Profit < Spent then
			GameTooltip:AddDoubleLine(U["Deficit:"], GetMoneyString(Spent-Profit), 1,0,0, 1,1,1)
		elseif Profit > Spent then
			GameTooltip:AddDoubleLine(U["Profit:"], GetMoneyString(Profit-Spent), 0,1,0, 1,1,1)
		end
		GameTooltip:AddLine(" ")

		local totalGold = 0
		GameTooltip:AddLine(U["Character"]..": ", .6,.8,1)
		local thisRealmList = diminfo.totalGold[myRealm]
		for k, v in pairs(thisRealmList) do
			local gold, class = unpack(v)
			GameTooltip:AddDoubleLine(GetClassIcon(class)..k, GetGoldString(gold), 1,1,1, 1,1,1)
			totalGold = totalGold + gold
		end
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(U["Server"]..": ", .6,.8,1)
		GameTooltip:AddDoubleLine(TOTAL..": ", GetGoldString(totalGold), 1,1,1, 1,1,1)

		for i = 1, GetNumWatchedTokens() do
			local name, count, icon, currencyID = GetBackpackCurrencyInfo(i)
			if name and i == 1 then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(CURRENCY,.6,.8,1)
			end
			if name and count then
				local _, _, _, _, _, total = GetCurrencyInfo(currencyID)
				local iconTexture = " |T"..icon..":13:15:0:0:50:50:4:46:4:46|t"
				if total > 0 then
					GameTooltip:AddDoubleLine(name, count.."/"..total..iconTexture, 1,1,1, 1,1,1)
				else
					GameTooltip:AddDoubleLine(name, count..iconTexture, 1,1,1, 1,1,1)
				end
			end
		end
			--GameTooltip:AddDoubleLine(" ",U["Reset Gold"],1,1,1,.6,.8,1)
			GameTooltip:AddDoubleLine(" ","--------------",1,1,1,0.5,0.5,0.5)
			GameTooltip:AddDoubleLine(" ",U["AutoSell Junk"]..": "..(diminfo.AutoSell and "|cff55ff55"..VIDEO_OPTIONS_ENABLED or "|cffff5555"..strupper(OFF)),1,1,1,.6,.8,1)
			GameTooltip:Show()
		end)
	StatGoldFrame:SetScript("OnLeave", GameTooltip_Hide)

	-- autosell junk function
	local f = CreateFrame("Frame")
	local sellJunkTicker

	local function StopSelling()
		if sellJunkTicker then
			sellJunkTicker:Cancel()
			sellJunkTicker = nil
		end
		f:UnregisterEvent("UI_ERROR_MESSAGE")
	end

	local function StartSelling()
		local c = 0
		local saved
		for b = 0, 4 do
			for s = 1, GetContainerNumSlots(b) do
				local l = GetContainerItemLink(b, s)
				if l then
					local price = select(11, GetItemInfo(l))
					local _, count, _, quality = GetContainerItemInfo(b, s)
					if quality == 0 and price > 0 then
						c = c + price*count
						if MerchantFrame:IsShown() then
							UseContainerItem(b, s)
						else
							StopSelling()
							return
						end
					end
				end
			end
		end

		local firstRun = sellJunkTicker and sellJunkTicker._remainingIterations == 200
		if firstRun and c > 0 then
			print(format("|cff99CCFF"..U["Your vendor trash has been sold and you earned"]..":|r|cffFFFFFF%s|r", GetMoneyString(c)))
		elseif c == 0 then
			StopSelling()
		end
	end

	f:RegisterEvent("MERCHANT_SHOW")
	f:RegisterEvent("MERCHANT_CLOSED")
	f:SetScript("OnEvent", function(self, event, _, arg1)
		if not diminfo.AutoSell then return end
		if event == "MERCHANT_SHOW" then
			if IsShiftKeyDown() then return end
			sellJunkTicker = C_Timer.NewTicker(.2, StartSelling, 200)
			f:RegisterEvent("UI_ERROR_MESSAGE")
		elseif event == "UI_ERROR_MESSAGE" and arg1 == ERR_VENDOR_DOESNT_BUY then
			StopSelling()
		elseif event == "MERCHANT_CLOSED" then
			StopSelling()
		end
	end)
end
-------------------------------------  Positions  ------------------------------------------------------------------------------------------
if Cfg_Positions == true then
	local StatPositionsFrame = CreateFrame("Frame", "StatPositionsFrame", UIParent)
	StatPositionsFrame:SetFrameStrata("BACKGROUND")
	StatPositionsFrame:SetFrameLevel(3)
	StatPositionsFrame:EnableMouse(true)
	StatPositionsFrame:SetHitRectInsets(0, 0, 0, -10)
    local Text = StatPositionsFrame:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(Cfg_TTFonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(Cfg_PositionsPoint))
	StatPositionsFrame:SetAllPoints(Text)

	local colorT = {
		sanctuary = {SANCTUARY_TERRITORY, {.41, .8, .94}};
		arena = {FREE_FOR_ALL_TERRITORY, {1, .1, .1}};
		friendly = {FACTION_CONTROLLED_TERRITORY, {.1, 1, .1}};
		hostile = {FACTION_CONTROLLED_TERRITORY, {1, .1, .1}};
		contested = {CONTESTED_TERRITORY, {1, .7, 0}};
		combat = {COMBAT_ZONE, {1, .1, .1}};
		neutral = {format(FACTION_CONTROLLED_TERRITORY,FACTION_STANDING_LABEL4), {1, .93, .76}}
	}

	--local coordX, coordY = 0, 0
	--local function formatCoords() return format("%.1f,%.1f", coordX*100, coordY*100) end

	local function OnEvent()
		subzone, realzone, zone, pvp = GetSubZoneText(), GetRealZoneText(), GetZoneText(), {GetZonePVPInfo()}
		if not pvp[1] then pvp[1] = "neutral" end
		local r,g,b = unpack(colorT[pvp[1]][2])
		--Text:SetText((subzone ~= "") and subzone or zone)
		if subzone ~= '' and subzone ~= realzone then
			Text:SetFormattedText('%s - %s', realzone, subzone)
			Text:SetTextColor(r,g,b)
			return
		else
			Text:SetText(realzone)
			Text:SetTextColor(r,g,b)
		end
	end

	StatPositionsFrame:RegisterEvent("ZONE_CHANGED")
	StatPositionsFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
	StatPositionsFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	StatPositionsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	StatPositionsFrame:SetScript("OnEvent", OnEvent)

	--[[StatPositionsFrame:SetScript("OnEnter",function(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -20)
		GameTooltip:ClearLines()]]

  --[[if GetPlayerMapPosition("player") then
		self.Timer = 0
		self:SetScript("OnUpdate", function(self, elapsed)
			self.Timer = self.Timer + elapsed
			if self.Timer > .1 then
				self.Timer = 0
				coordX, coordY = GetPlayerMapPosition("player")
				self:GetScript("OnEnter")(self)
			end
		end)
	end]]
		--GameTooltip:AddLine(format("%s |cffffffff(%s)", zone, formatCoords()), 0,.6,1, 1,1,1)
		--if pvp[1] and not IsInInstance() then
			--local r,g,b = unpack(colorT[pvp[1]][2])
			--if subzone and subzone ~= zone then 
				--GameTooltip:AddLine(subzone,r,g,b)
			--end				
			--GameTooltip:AddLine(format(colorT[pvp[1]][1],pvp[3] or "") .. "/" .. U["Send My Pos"],r,g,b)
		--end
		--GameTooltip:Show()
	--end)
	--[[StatPositionsFrame:SetScript("OnLeave", function()
		StatPositionsFrame:SetScript("OnUpdate", nil)
		GameTooltip:Hide()
	end)]]
	--[[StatPositionsFrame:SetScript("OnMouseUp", function(_, btn)
		if btn == "LeftButton" then
			ToggleFrame(WorldMapFrame)
		else
			ChatFrame_OpenChat(format("%s: %s (%s)", U["My Position"], zone, formatCoords()), chatFrame)
		end
	end)]]
end
-------------------------------------  end  ------------------------------------------------------------------------------------------