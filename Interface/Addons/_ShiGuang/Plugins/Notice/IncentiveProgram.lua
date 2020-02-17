--## SavedVariables: IncentiveProgramDB
---------Incentive Program------Created by: Jacob Beu----Xubera @ US-Alleria------r17 | 9/8/2018------------
local IncentiveProgram = {}

--Core
IncentiveProgram.ADDON_DISPLAY_NAME = NOTICE_INCENTIVEPROGRAM_TITLE.." (|cFF69CCF0 r17 |r)"

IncentiveProgram.Flair = {
    [849] = "HM1 - ",
    [850] = "HM2 - ",
    [851] = "HM3 - ",
    [847] = "BRF1 - ",
    [846] = "BRF2 - ",
    [848] = "BRF3 - ",
    [823] = "BRF4 - ",
    [982] = "HC1 - ",
    [983] = "HC2 - ",
    [984] = "HC3 - ",
    [985] = "HC4 - ",
    [986] = "HC5 - ",
    [1287] = "EN1 - ",
    [1288] = "EN2 - ",
    [1289] = "EN3 - ",
	[1411] = "TV1 - ",
    [1290] = "NH1 - ",
    [1291] = "NH2 - ",
    [1292] = "NH3 - ",
    [1293] = "NH4 - ",
	[1494] = "TS1 - ",
	[1495] = "TS2 - ",
	[1496] = "TS3 - ",
	[1497] = "TS4 - ",
	[1610] = "ANT1 - ",
	[1611] = "ANT2 - ",
	[1612] = "ANT3 - ",
	[1613] = "ANT4 - ",
	[1731] = "ULD1 - ",
	[1732] = "ULD2 - ",
	[1733] = "ULD3 - ",
	[1945] = "DAR1 - ",
	[1946] = "DAR2 - ",
	[1947] = "DAR3 - ",
	[1948] = "DAR4 - ",
	[1949] = "DAR5 - ",
	[1950] = "DAR6 - ",
	[1951] = "COS1 - ", -- Crucible of Storms
	[2009] = "EP1 - ", -- The Grand Reception
	[2010] = "EP2 - ", -- Depths of the Devoted
	[2011] = "EP3 - ", -- The Circle of Stars
	[2036] = "NY1 - ", -- Vision of Destiny
	[2037] = "NY2 - ", -- Halls of Devotion
	[2038] = "NY3 - ", -- Gift of Flesh
	[2039] = "NY4 - ", -- The Waking Dream    
}

--Icon File Paths
IncentiveProgram.Icons = {
    ["INCENTIVE_NONE"] = "Interface\\ICONS\\Ability_Malkorok_BlightofYshaarj_Red",
    ["INCENTIVE_RARE"] = "Interface\\Icons\\INV_Misc_Coin_17",
    ["INCENTIVE_UNCOMMON"] = "Interface\\Icons\\INV_Misc_Coin_18",
    ["INCENTIVE_PLENTIFUL"] = "Interface\\Icons\\INV_Misc_Coin_19",
    ----------------------
    ["CONTEXT_MENU_DIVIDER"] = "Interface\\Common\\UI-TooltipDivider-Transparent",
    ["CONTEXT_MENU_RED_X"] = "Interface\\Common\\VOICECHAT-MUTED"
  }
  
--Settings
IncentiveProgram.Settings = {
    QA_TANK = "queueAsTank",
    QA_HEALER = "queueAsHealer",
    QA_DAMAGE = "queueAsDamage",
    IGNORE = "ignore",
    DUNGEON_NAME = "dungeonName",
    DUNGEON_TYPE = "dungeonType",
    HIDE_IN_PARTY = "hideInParty",
    HIDE_ALWAYS = "hideAlways", --still shows in databroker
	HIDE_EMPTY = "hideEmpty",
    ALERT = "alert",
    ALERT_TOAST = "toastAlert",
    COUNT_EVEN_IF_NOT_SELECTED = "countEvenIfNotSelected",
    COUNT_EVEN_IF_NOT_ROLE_ELIGIBLE = "countEvenIfNotRoleEligible",
	IGNORE_COMPLETED_LFR = "ignoreCompletedLFR",
    
    ROLE_TANK = "roleTank",
    ROLE_HEALER = "roleHealer",
    ROLE_DAMAGE = "roleDamage",
    
    FRAME_TOP = "frameTop",
    FRAME_LEFT = "frameLeft",
    TOAST_TOP = "toastTop",
    TOAST_LEFT = "toastLeft",
	
	ALERT_PING = "alertPing",
	ALERT_SOUND = "alertSound",
	ALERT_REPEATS = "alertRepeats",
	TOAST_PING = "toastPing",
	TOAST_SOUND = "toastSound",
	TOAST_REPEATS = "toastRepeats",
	CYCLE_COUNT = "cycleCount",
	CONTINUOUSLY_CYCLE = "continuouslyCycle",
	CHANNEL = "channel",
	CHANNEL_SFX = "SFX",
	CHANNEL_MUSIC = "MUSIC",
	CHANNEL_AMBIENT = "AMBIENT",
	CHANNEL_MASTER = "MASTER"
}

IncentiveProgram.TickRate  = 20
IncentiveProgram.SoundRate = 1
IncentiveProgram.CycleRate = 1.5

IncentiveProgram.ALERT = 1
IncentiveProgram.TOAST = 2

--Dungeon Constants
IncentiveProgram.DUNGEON_REMOVED = 1
IncentiveProgram.DUNGEON_ADDED = 2
IncentiveProgram.DUNGEON_DIFFERENCE = 3

IncentiveProgram.TOAST_TANK = "\124TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:0:19:22:41\124t Tank"
IncentiveProgram.TOAST_HEALER = "\124TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:20:39:1:20\124t Healer"
IncentiveProgram.TOAST_DAMAGE = "\124TInterface\\LFGFRAME\\UI-LFG-ICON-PORTRAITROLES:20:20:0:0:64:64:20:39:22:41\124t Damage"


--Context Menu
IncentiveProgram.ContextMenu = {
    TANK = 2,
    HEALER = 3,
    DAMAGE = 4,
    
    ROLES = "roles",
    IGNORE = "ignore",
    SETTINGS = "settings",
    
    QUEUE = "queue",
    JOIN = "join",
	
	INTERFACE_PANEL = "interfacePanel"
}

IncentiveProgram.ContextLabels = {
    ROLES = INCENTIVEPROGRAM_ROLES,
    TANK = "T",
    HEALER = "N",
    DAMAGE = "DPS",
    
    IGNORED = INCENTIVEPROGRAM_IGNORED,
    NO_IGNORED = INCENTIVEPROGRAM_NO_IGNORED,
    
    SETTINGS = INCENTIVEPROGRAM_SETTINGS,
    HIDE_IN_PARTY = INCENTIVEPROGRAM_HIDE_IN_PARTY,
    HIDE_ALWAYS = INCENTIVEPROGRAM_HIDE_ALWAYS,
	  HIDE_EMPTY = INCENTIVEPROGRAM_HIDE_EMPTY,
    ALERT = INCENTIVEPROGRAM_ALERT,
    ALERT_TOAST = INCENTIVEPROGRAM_ALERT_TOAST,
	  IGNORE_COMPLETED_LFR = INCENTIVEPROGRAM_IGNORE_COMPLETED_LFR,
	INTERFACE_PANEL = "Interface Panel",
    
    IGNORE = INCENTIVEPROGRAM_IGNORE,
    UNIGNORE = INCENTIVEPROGRAM_UNIGNORE,
    
    JOIN_QUEUE = INCENTIVEPROGRAM_JOIN_QUEUE,
	
	TOOLTIP_IGNORE_LFR = INCENTIVEPROGRAM_TOOLTIP_IGNORE_LFR,
	TOOLTIP_HIDE_ALWAYS = INCENTIVEPROGRAM_TOOLTIP_HIDE_ALWAYS,
	TOOLTIP_SOUND_ID_1 = INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_1,
	TOOLTIP_SOUND_ID_2 = INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_2,
	TOOLTIP_SOUND_REPEATS = INCENTIVEPROGRAM_TOOLTIP_SOUND_REPEATS,
	TOOLTIP_CYCLE_COUNT = INCENTIVEPROGRAM_TOOLTIP_CYCLE_COUNT,
	TOOLTIP_CONTINUOUSLY_CYCLE = INCENTIVEPROGRAM_TOOLTIP_CONTINUOUSLY_CYCLE,
	
	SOUNDS = INCENTIVEPROGRAM_SOUNDS,
	SOUND_ID = INCENTIVEPROGRAM_SOUND_ID,
	REPEATS = INCENTIVEPROGRAM_REPEATS,
	ALERT_PING = INCENTIVEPROGRAM_ALERT_PING,
	TOAST_PING = INCENTIVEPROGRAM_TOAST_PING,
	TEST = INCENTIVEPROGRAM_TEST,
	
	ANIM_CYCLES = INCENTIVEPROGRAM_ANIM_CYCLES,
	CONTINUOUSLY_CYCLE = INCENTIVEPROGRAM_CONTINUOUSLY_CYCLE,
	
	RESET_POSITION = "Reset Position"
}









----------------------------------------- menu---------------------------------------
--Local copy of the class
local menu

-- Right Click Menu Table
local tank, healer, damage = C_LFGList.GetAvailableRoles()
if ( tank ) then tank = "" else tank = "\124CFFC41F3B" end
if ( healer ) then healer = "" else healer = "\124CFFC41F3B" end
if ( damage ) then damage = "" else damage = "\124CFFC41F3B" end
local menuData = {
    [1] = {
        ["text"] = IncentiveProgram.ContextLabels["ROLES"],
        ["notCheckable"] = true,
        ["hasArrow"] = true,
        ["value"] = { --submenu
            [1] = {
                ["text"] = tank..IncentiveProgram.ContextLabels["TANK"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["ROLES"],
                ["arg2"] = IncentiveProgram.Settings["ROLE_TANK"],
                ["keepShownOnClick"] = true
            },
            [2] = {
                ["text"] = healer..IncentiveProgram.ContextLabels["HEALER"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["ROLES"],
                ["arg2"] = IncentiveProgram.Settings["ROLE_HEALER"],
                ["keepShownOnClick"] = true
            },
            [3] = {
                ["text"] = damage..IncentiveProgram.ContextLabels["DAMAGE"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["ROLES"],
                ["arg2"] = IncentiveProgram.Settings["ROLE_DAMAGE"],
                ["keepShownOnClick"] = true
            }
        }
    },
    
    [2] = {
        ["notCheckable"] = true,
        ["text"] = IncentiveProgram.ContextLabels["IGNORED"],
        ["hasArrow"] = true,
        ["value"] = IncentiveProgram.ContextMenu["IGNORE"]
    },
    
    [3] = {
        ["iconOnly"] = true,
        ["notCheckable"] = true,
        ["keepShownOnClick"] = true,
        ["disabled"] = true,
        ["icon"] = IncentiveProgram.Icons["CONTEXT_MENU_DIVIDER"],
        ["iconInfo"] = {
            ["tCoordLeft"] = 0,
            ["tCoordRight"] = 1,
            ["tFitDropDownSizeX"] = true,
            ["tCoordTop"] = 0,
            ["tCoordBottom"] = 1,
            ["tSizeX"] = 0,
            ["tSizeY"] = 8
        }
    },
    
    [4] = {
        ["text"] = IncentiveProgram.ContextLabels["SETTINGS"],
        ["notCheckable"] = true,
        ["hasArrow"] = true,
        ["value"] = {
            [1] = {
                ["text"] = IncentiveProgram.ContextLabels["HIDE_IN_PARTY"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["SETTINGS"],
                ["arg2"] = IncentiveProgram.Settings["HIDE_IN_PARTY"],
                ["keepShownOnClick"] = true
            },
            [2] = {
                ["text"] = IncentiveProgram.ContextLabels["HIDE_ALWAYS"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["SETTINGS"],
                ["arg2"] = IncentiveProgram.Settings["HIDE_ALWAYS"],
                ["keepShownOnClick"] = true,
				["tooltipTitle"] = IncentiveProgram.ADDON_DISPLAY_NAME,
				["tooltipText"] = IncentiveProgram.ContextLabels["TOOLTIP_HIDE_ALWAYS"],
				["tooltipOnButton"] = 1
            },
            [3] = {
                ["text"] = IncentiveProgram.ContextLabels["ALERT"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["SETTINGS"],
                ["arg2"] = IncentiveProgram.Settings["ALERT"],
                ["keepShownOnClick"] = true
            },
            [4] = {
                ["text"] = IncentiveProgram.ContextLabels["ALERT_TOAST"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["SETTINGS"],
                ["arg2"] = IncentiveProgram.Settings["ALERT_TOAST"],
                ["keepShownOnClick"] = true
            },
            [5] = {
                ["text"] = IncentiveProgram.ContextLabels["IGNORE_COMPLETED_LFR"],
                ["isNotRadio"] = true,
                ["arg1"] = IncentiveProgram.ContextMenu["SETTINGS"],
                ["arg2"] = IncentiveProgram.Settings["IGNORE_COMPLETED_LFR"],
                ["keepShownOnClick"] = true,
				["tooltipTitle"] = IncentiveProgram.ADDON_DISPLAY_NAME,
				["tooltipText"] = IncentiveProgram.ContextLabels["TOOLTIP_IGNORE_LFR"],
				["tooltipOnButton"] = 1
            },
			[6] = {
				text = IncentiveProgram.ContextLabels["INTERFACE_PANEL"],
				arg1 = IncentiveProgram.ContextMenu["INTERFACE_PANEL"],
				notCheckable = true,
				leftPadding = 16
			}
        }
    }
}

 
local function createTitleInfo(level)
    local info = UIDropDownMenu_CreateInfo()
    
    --Add title
    info.text = IncentiveProgram.ADDON_DISPLAY_NAME
    info.isTitle = true
    info.notCheckable = true
    
    UIDropDownMenu_AddButton(info, level)
end

local function createSettingsMenu(level, level2Table)
    if ( level == 1 ) then
        for i=1, #menuData do
            local info = UIDropDownMenu_CreateInfo();
            for key,value in pairs(menuData[i]) do
                info[key] = value
            end
            info.func = menu.MenuOnClick
            UIDropDownMenu_AddButton(info, level)
        end
    elseif ( level == 2 ) then
        for i=1, #level2Table do
            local info = UIDropDownMenu_CreateInfo();
            for key,value in pairs(level2Table[i]) do
                info[key] = value
            end
            if level2Table[i]["arg1"] == IncentiveProgram.ContextMenu["ROLES"] then
                info.checked = IncentiveProgram:GetSettings():GetUserSetting(level2Table[i]["arg2"])
            elseif level2Table[i]["arg1"] == IncentiveProgram.ContextMenu["SETTINGS"] then
                info.checked = IncentiveProgram:GetSettings():GetSetting(level2Table[i]["arg2"])
            end
            
            info.func = menu.MenuOnClick
            UIDropDownMenu_AddButton(info, level)
        end
    end
end

local function createSettingsIgnoreList(level)
    local count = 0
    for key, value in pairs (IncentiveProgram:GetSettings().db.dungeonSettings) do
        if ( IncentiveProgram:GetSettings():GetDungeonSetting(key, IncentiveProgram.Settings["IGNORE"]) ) then
            local info = UIDropDownMenu_CreateInfo()
            info.text = value[IncentiveProgram.Settings["DUNGEON_NAME"]]
            info.notCheckable = true
            info.func = menu.MenuOnClick
            info.arg1 = IncentiveProgram.ContextMenu["IGNORE"]
            info.arg2 = key
            
            info.icon = IncentiveProgram.Icons["CONTEXT_MENU_RED_X"]
            info.padding = 8
            
            UIDropDownMenu_AddButton(info, level)
            count = count + 1
            if ( count >= 10 ) then break end
        end
    end
    
    if ( count == 0 ) then
        local info = UIDropDownMenu_CreateInfo()
        info.text = IncentiveProgram.ContextLabels["NO_IGNORED"]
        info.notCheckable = true
        info.disabled = true
        
        UIDropDownMenu_AddButton(info, level)
    end
end

local function createDungeonEntry(dungeonID, name, level, isShortage, showAll)
    local info = UIDropDownMenu_CreateInfo()
    local isAvailble, isAvaibleToPlayer = IsLFGDungeonJoinable(dungeonID)

    if not ( isAvailble and isAvaibleToPlayer ) then
        info.disabled = true
    else
        info.hasArrow = true
    end

	local encounterDone, encounterTotal = GetLFGDungeonNumEncounters(dungeonID)
	local lfrCompleted = ( encounterDone == encounterTotal )
	if lfrCompleted and encounterDone > 0 then
		info.colorCode = "|cFF33FF44"
	end
    
    --Color red if ignored but showing all anyways
	local ignored = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["IGNORE"])
    if ( ignored and showAll ) then
        info.colorCode = "|cFFC41F3B"
    end
    
    --Queue Check
    if ( IncentiveProgram:GetDungeon():IsQueued(dungeonID) ) then
        info.colorCode = "|cFF69CCF0"
    end

    local flair = IncentiveProgram.Flair[dungeonID] or ""
    info.text = flair..name
    info.value = dungeonID
    info.notCheckable = true
    
    
    --Color gray if not in the shortage list but still showing all.
    if ( not isShortage and showAll ) then
        info.colorCode = "|cFF666666"
        UIDropDownMenu_AddButton(info, level)
	elseif ( ignored and showAll ) then
        UIDropDownMenu_AddButton(info, level)
    elseif ( isShortage and not ignored ) then
        UIDropDownMenu_AddButton(info, level)
    end  
end
  
local function createIgnoreButton(dungeonID, level)
    local info = UIDropDownMenu_CreateInfo()
    
    if ( IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["IGNORE"]) ) then
        info.text = IncentiveProgram.ContextLabels["UNIGNORE"]
    else
        info.text = IncentiveProgram.ContextLabels["IGNORE"]
    end
    
    info.arg1 = IncentiveProgram.ContextMenu["QUEUE"]
    info.arg2 = IncentiveProgram.Settings["IGNORE"]
    info.value = dungeonID
    info.func = menu.MenuOnClick
    info.notCheckable = true
    UIDropDownMenu_AddButton(info, level)
end

local function createRoleButtons(dungeonID, level, showAll)
    local tank, healer, damage = C_LFGList.GetAvailableRoles()
    local shortageTank, shortageHealer, shortageDamage = IncentiveProgram:GetDungeon():GetShortageRoles(dungeonID)
    
    --Tank
    if ( tank and ( shortageTank or showAll ) ) then
        local info = UIDropDownMenu_CreateInfo()
        info.text = IncentiveProgram.ContextLabels["TANK"]
        info.arg1 = IncentiveProgram.ContextMenu["QUEUE"]
        info.arg2 = IncentiveProgram.Settings["QA_TANK"]
        info.value = dungeonID
        info.checked = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_TANK"])
        info.isNotRadio = true
        info.func = menu.MenuOnClick
        info.keepShownOnClick = true
        
        if ( not shortageTank ) then
            info.colorCode = "|CFF666666"
        end
        
        UIDropDownMenu_AddButton(info, level)
    end
    
    --Healer
    if ( healer and ( shortageHealer or showAll ) ) then
        local info = UIDropDownMenu_CreateInfo()
        info.text = IncentiveProgram.ContextLabels["HEALER"]
        info.arg1 = IncentiveProgram.ContextMenu["QUEUE"]
        info.arg2 = IncentiveProgram.Settings["QA_HEALER"]
        info.value = dungeonID
        info.checked = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_HEALER"])
        info.isNotRadio = true
        info.func = menu.MenuOnClick
        info.keepShownOnClick = true
        
        if ( not shortageHealer ) then
            info.colorCode = "|CFF666666"
        end
        
        UIDropDownMenu_AddButton(info, level)
    end
    
    --Damage
    if ( damage and ( shortageDamage or showAll ) ) then
        local info = UIDropDownMenu_CreateInfo()
        info.text = IncentiveProgram.ContextLabels["DAMAGE"]
        info.arg1 = IncentiveProgram.ContextMenu["QUEUE"]
        info.arg2 = IncentiveProgram.Settings["QA_DAMAGE"]
        info.value = dungeonID
        info.checked = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_DAMAGE"])
        info.isNotRadio = true
        info.func = menu.MenuOnClick
        info.keepShownOnClick = true
        
        if ( not shortageDamage ) then
            info.colorCode = "|CFF666666"
        end
        
        UIDropDownMenu_AddButton(info, level)
    end
        
end

---------------------------------------
-- createJoinButton is a helper function that adds Join Queue button to the dungeon context menu
---------------------------------------   
local function createJoinButton(dungeonID, level)
    local info = UIDropDownMenu_CreateInfo()
    info.text = IncentiveProgram.ContextLabels["JOIN_QUEUE"]
    info.arg1 = IncentiveProgram.ContextMenu["QUEUE"]
    info.arg2 = IncentiveProgram.ContextMenu["JOIN"]
    info.value = dungeonID
    info.func = menu.MenuOnClick
    info.notCheckable = true
    
    --If Queued, disabled
    if ( IncentiveProgram:GetDungeon():IsQueued(dungeonID) ) then
        info.disabled = true
    end
   
    if ( not IncentiveProgram:GetDungeon():CanQueueForDungeon(dungeonID) ) then
        info.disabled = true
    end
    
    UIDropDownMenu_AddButton(info, level)
end

local IncentiveProgramMenu = {
    new = function(self, parent)
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
    
        local frame = CreateFrame("Frame", "IncentiveProgramFrameMenu", parent, "UIDropDownMenuTemplate", 1)
        obj.frame = frame
        return obj
    end,
  
    MenuOnLoad = function(menuFrame, level)
        if ( menu == menuFrame) then return end --Blizzard's Menu UI calls this function, shouldn't self call this.
        if ( menuFrame.button == "LeftButton" ) then
            if ( level == 1 ) then
                createTitleInfo(level)
                local showAll = IsShiftKeyDown()

                local dungeonIDs, dungeonNames, dungeonTypes = IncentiveProgram:GetDungeon():GetDungeonList()
                local shortage = IncentiveProgram:GetDungeon():GetShortage()
                
                for key, dungeonID in pairs(dungeonIDs) do
                    local name = dungeonNames[key]
                    if ( shortage[dungeonID] ) then
                        createDungeonEntry(dungeonID, name, level, true, showAll)
                    else
                        createDungeonEntry(dungeonID, name, level, false, showAll)
                    end
                end
            elseif ( level == 2 ) then
                local dungeonID = UIDROPDOWNMENU_MENU_VALUE
                local showAll = IsShiftKeyDown()
                
                createIgnoreButton(dungeonID, level)
                createRoleButtons(dungeonID, level, showAll)
                createJoinButton(dungeonID, level)
            end
        elseif (menuFrame.button == "RightButton" ) then
            if ( level == 1 ) then
                createTitleInfo(level)
                createSettingsMenu(level)
            elseif ( level == 2 ) then
                local level2Table = UIDROPDOWNMENU_MENU_VALUE
                if ( level2Table == IncentiveProgram.ContextMenu["IGNORE"] ) then
                    createSettingsIgnoreList(level)
                else
                    createSettingsMenu(level, level2Table)
                end
            end
        end
    end,
       
    MenuOnClick = function(menuButton, arg1, arg2)
        if ( arg1 == IncentiveProgram.ContextMenu["ROLES"] ) then
            if ( arg2 == IncentiveProgram.Settings["ROLE_TANK"] ) then
                IncentiveProgram:GetSettings():SetUserSetting(IncentiveProgram.Settings["ROLE_TANK"], menuButton.checked)
            elseif ( arg2 == IncentiveProgram.Settings["ROLE_HEALER"] ) then
                IncentiveProgram:GetSettings():SetUserSetting(IncentiveProgram.Settings["ROLE_HEALER"], menuButton.checked)
            elseif ( arg2 == IncentiveProgram.Settings["ROLE_DAMAGE"] ) then
                IncentiveProgram:GetSettings():SetUserSetting(IncentiveProgram.Settings["ROLE_DAMAGE"], menuButton.checked)
            end
            
            IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()) --Refresh Count
        elseif ( arg1 == IncentiveProgram.ContextMenu["IGNORE"] ) then
            IncentiveProgram:GetSettings():SetDungeonSetting(arg2, IncentiveProgram.Settings["IGNORE"], false)
            IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()) --Refresh Count
            
        elseif ( arg1 == IncentiveProgram.ContextMenu["SETTINGS"] ) then
            IncentiveProgram:GetSettings():SetSetting(arg2, menuButton.checked)
            IncentiveProgram:GetFrame():UpdatedSettings() --In case new settings now hide frame
            
        elseif ( arg1 == IncentiveProgram.ContextMenu["QUEUE"] ) then
            local dungeonID = UIDROPDOWNMENU_MENU_VALUE
            if ( arg2 == IncentiveProgram.Settings["IGNORE"] ) then
                local ignoreSetting = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, arg2)
                IncentiveProgram:GetSettings():SetDungeonSetting(dungeonID, arg2, not ignoreSetting)
            elseif ( ( arg2 == IncentiveProgram.Settings["QA_TANK"] ) or
                     ( arg2 == IncentiveProgram.Settings["QA_HEALER"] ) or 
                     ( arg2 == IncentiveProgram.Settings["QA_DAMAGE"] ) ) then
                IncentiveProgram:GetSettings():SetDungeonSetting(dungeonID, arg2, menuButton.checked)
            elseif ( arg2 == IncentiveProgram.ContextMenu["JOIN"] ) then
                menu:JoinDungeon(dungeonID, true)
            end
            
            IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()) --Refresh Count
        elseif ( arg1 == IncentiveProgram.ContextMenu["INTERFACE_PANEL"] ) then
			InterfaceOptionsFrame_OpenToCategory(IncentiveProgramInterfacePanel) 
		end
    end,
  
    JoinDungeon = function(self, dungeonID, fromDropDownMenu)
        local dungeonType = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["DUNGEON_TYPE"])
        local canQueue, tank, healer, damage = IncentiveProgram:GetDungeon():CanQueueForDungeon(dungeonID)
        local lfgLeader, lfgTank, lfgHealer, lfgDamage = GetLFGRoles()
        
        if ( ( dungeonType == LE_LFG_CATEGORY_RF ) and canQueue ) then
            SetLFGRoles(lfgLeader, tank, healer, damage)
            RaidFinderQueueFrame.raid = dungeonID
            RaidFinderQueueFrame_Join() --Blizzard function in RaidFinder.lua
            
            IncentiveProgram.SavedLFGRoles.isUpdated = true
            IncentiveProgram.SavedLFGRoles.Leader = lfgLeader
            IncentiveProgram.SavedLFGRoles.Tank = lfgTank
            IncentiveProgram.SavedLFGRoles.Healer = lfgHealer
            IncentiveProgram.SavedLFGRoles.Damage = lfgDamage
        elseif ( dungeonType == LE_LFG_CATEGORY_LFD ) and canQueue then
            SetLFGRoles(lfgLeader, tank, healer, damage)
            
            LFDQueueFrame.type = dungeonID
            LFDQueueFrame_Join() --Blizzard Function in LFGFrame.lua
            
            IncentiveProgram.SavedLFGRoles.isUpdated = true
            IncentiveProgram.SavedLFGRoles.Leader = lfgLeader
            IncentiveProgram.SavedLFGRoles.Tank = lfgTank
            IncentiveProgram.SavedLFGRoles.Healer = lfgHealer
            IncentiveProgram.SavedLFGRoles.Damage = lfgDamage
        end
        
        if ( fromDropDownMenu ) then
            ToggleDropDownMenu(1, nil, IncentiveProgram:GetFrame():GetUIMenuFrame(), IncentiveProgram:GetFrame():GetAnchorFrame() or IncentiveProgram:GetFrame():GetUIFrame(), 0, 0) --Close context menu and lock until LFGRoles reset
        end
    end
}

function IncentiveProgram:CreateMenu(parent)
    if ( not parent ) then return end
    if ( not menu ) then
        menu = IncentiveProgramMenu:new(parent)
    else
        menu.frame:SetParent(parent)
    end
    
    return menu
end

function IncentiveProgram:GetMenu()
    if ( not menu ) then return end
    
    return menu
end











----------------------------------- IncentiveProgramSettings -----------------------------------


--Local copy of the class
local IncentiveProgramSettings

local defaultSettings = {}
    defaultSettings[IncentiveProgram.Settings["QA_TANK"]] = true
    defaultSettings[IncentiveProgram.Settings["QA_HEALER"]] = true
    defaultSettings[IncentiveProgram.Settings["QA_DAMAGE"]] = true
    defaultSettings[IncentiveProgram.Settings["IGNORE"]] = false
    defaultSettings[IncentiveProgram.Settings["HIDE_IN_PARTY"]] = true
    defaultSettings[IncentiveProgram.Settings["HIDE_ALWAYS"]] = false
	  defaultSettings[IncentiveProgram.Settings["HIDE_EMPTY"]] = true
    defaultSettings[IncentiveProgram.Settings["ALERT"]] = true
    defaultSettings[IncentiveProgram.Settings["ALERT_TOAST"]] = false
    defaultSettings[IncentiveProgram.Settings["COUNT_EVEN_IF_NOT_SELECTED"]] = false
    defaultSettings[IncentiveProgram.Settings["COUNT_EVEN_IF_NOT_ROLE_ELIGIBLE"]] = false

    --default values for roles you want to play determined
    --by the roles you can play
    local tank, healer, damage = C_LFGList.GetAvailableRoles()
    defaultSettings[IncentiveProgram.Settings["ROLE_TANK"]] = tank
    defaultSettings[IncentiveProgram.Settings["ROLE_HEALER"]] = healer
    defaultSettings[IncentiveProgram.Settings["ROLE_DAMAGE"]] = damage
    
    defaultSettings[IncentiveProgram.Settings["FRAME_TOP"]] = -1
    defaultSettings[IncentiveProgram.Settings["TOAST_TOP"]] = -1

	defaultSettings[IncentiveProgram.Settings["IGNORE_COMPLETED_LFR"]] = true
	defaultSettings[IncentiveProgram.Settings["ALERT_PING"]] = false
	defaultSettings[IncentiveProgram.Settings["ALERT_SOUND"]] = false  --47615
	defaultSettings[IncentiveProgram.Settings["ALERT_REPEATS"]] = 2
	defaultSettings[IncentiveProgram.Settings["TOAST_PING"]] = false
	defaultSettings[IncentiveProgram.Settings["TOAST_SOUND"]] = false  --18019
	defaultSettings[IncentiveProgram.Settings["TOAST_REPEATS"]] = 1
	defaultSettings[IncentiveProgram.Settings["CYCLE_COUNT"]] = 2
	defaultSettings[IncentiveProgram.Settings["CONTINUOUSLY_CYCLE"]] = false
	defaultSettings[IncentiveProgram.Settings["CHANNEL"]] = "SFX"

local IncentiveProgramSettings = {
    new = function(self)
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
		
        local db = ShiGuangDB  --IncentiveProgramDB or {} 
        db.IncentiveProgramSettings = db.IncentiveProgramSettings or {}
        db.dungeonSettings = db.dungeonSettings or {}
        db.userSettings = db.userSettings or {}
        
        obj.db = db
        
        return obj
    end,

    GetSetting = function(self, key)
        if not key then return end
        if not self.db then return end
        if not self.db.IncentiveProgramSettings then self.db.IncentiveProgramSettings = {} end
        
        if self.db.IncentiveProgramSettings[key] == nil then
            self.db.IncentiveProgramSettings[key] = defaultSettings[key] or false
        end
        
        return self.db.IncentiveProgramSettings[key]
    end,
   
    SetSetting = function(self, key, value)
        if value == nil then return end
        if not key then return end
        if not self.db then return end
        if not self.db.IncentiveProgramSettings then self.db.IncentiveProgramSettings = {} end
        
        self.db.IncentiveProgramSettings[key] = value
    end,

    GetDungeonSetting = function(self, id, key)
        if ( not id or not key ) then return end
        if not self.db then return end
        if not self.db.dungeonSettings then self.db.dungeonSettings = {} end
        if not self.db.dungeonSettings[id] then self.db.dungeonSettings[id] = {} end
        
        if self.db.dungeonSettings[id][key] == nil then
            self.db.dungeonSettings[id][key] = defaultSettings[key] or false
        end
        
        return self.db.dungeonSettings[id][key]        
    end,
 
    SetDungeonSetting = function(self, id, key, value)
        if value == nil then return end
        if ( not id or not key ) then return end
        if not self.db.dungeonSettings then self.db.dungeonSettings = {} end
        if not self.db.dungeonSettings[id] then self.db.dungeonSettings[id] = {} end
        
        self.db.dungeonSettings[id][key] = value
    end,

    GetUserSetting = function(self, key)
        if not key then return end
        if not self.db then return end
        if not self.db.userSettings then self.db.userSettings = {} end
     
		if not self.guid then self.guid = UnitGUID("player") end
		if not self.guid then return (defaultSettings[key] or false) end
	 
        if not self.db.userSettings[self.guid] then self.db.userSettings[self.guid] = {} end
        
        if self.db.userSettings[self.guid][key] == nil then
            self.db.userSettings[self.guid][key] = defaultSettings[key] or false
        end
        
        return self.db.userSettings[self.guid][key]
    end,

    SetUserSetting = function(self, key, value)
        if value == nil then return end
        if not key then return end
        if not self.db then return end
        if not self.db.userSettings then self.db.userSettings = {} end
		
		if not self.guid then self.guid = UnitGUID("player") end
		if self.guid then
			if not self.db.userSettings[self.guid] then self.db.userSettings[self.guid] = {} end
			
			self.db.userSettings[self.guid][key] = value
		end
    end
}

function IncentiveProgram:GetSettings()
    if not IncentiveProgramSettings then
        IncentiveProgramSettings = IncentiveProgramSettings:new()
		IncentiveProgram.CreateInterfacePanel() --Settings are now loaded, load up the Interface Panel
    end
    
    return IncentiveProgramSettings
end








----------------------------------- frame -----------------------------------
--Local copy of the class
local frame

local IncentiveProgramFrame = {
    new = function(self)
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
        return obj
    end,

    CreateFrame = function(self)
        local ipFrame = CreateFrame("Button", "IncentiveProgramFrame", UIParent)
        ipFrame:SetWidth(21)  --32
        ipFrame:SetHeight(21) --32
        local top = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["FRAME_TOP"])
        local left = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["FRAME_LEFT"])
        
        if ( top == -1 ) then --frame has not been set yet
            ipFrame:SetPoint("topleft", Minimap, "topleft", 0, 0)
        else
            ipFrame:SetPoint("BOTTOMLEFT", left, top - ipFrame:GetHeight())
        end
        
        ipFrame:EnableMouse(true)
        ipFrame:SetMovable(true)
        ipFrame:SetClampedToScreen(true)
        ipFrame:RegisterForDrag("LeftButton")
        ipFrame:RegisterForClicks("AnyUp")
        ipFrame:SetScript("OnDragStart", function(s) s:StartMoving() end)
        ipFrame:SetScript("OnDragStop", function(s)
            s:StopMovingOrSizing()
            IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["FRAME_TOP"], s:GetTop())
            IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["FRAME_LEFT"], s:GetLeft())
        end)
        ipFrame:SetScript("OnClick", function(s, button, down)
            self:OnClick(button, down)
        end)
        
        --Set Texture
        ipFrame.tex = ipFrame:CreateTexture(nil, "BACKGROUND")
        ipFrame.tex:SetAllPoints(ipFrame)
        ipFrame.tex:SetTexture(IncentiveProgram.Icons["INCENTIVE_NONE"]);
        
        --Set Text on the button, Gradiants make text easier to see
        ipFrame.leftGradiant = ipFrame:CreateTexture(nil, "BORDER")
        ipFrame.leftGradiant:SetWidth(16)
        ipFrame.leftGradiant:SetHeight(14)
        ipFrame.leftGradiant:SetPoint("LEFT", 0, -5)
        ipFrame.leftGradiant:SetColorTexture(1,0,0,1)
        ipFrame.leftGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 0.2, 0, 0, 0, 1)
        
        ipFrame.rightGradiant = ipFrame:CreateTexture(nil, "BORDER")
        ipFrame.rightGradiant:SetWidth(16)
        ipFrame.rightGradiant:SetHeight(14)
        ipFrame.rightGradiant:SetPoint("RIGHT", 0, -5)
        ipFrame.rightGradiant:SetColorTexture(1,0,0,1)
        ipFrame.rightGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 1, 0, 0, 0, 0.2)
        
        ipFrame.text = ipFrame:CreateFontString(nil, "ARTWORK", "GameFontWhite")
        ipFrame.text:SetJustifyH("CENTER")
        ipFrame.text:SetText("0")
        ipFrame.text:SetWidth(36)
        ipFrame.text:SetHeight(16)
        ipFrame.text:SetPoint("CENTER", 0, -5)
        ipFrame.text:SetNonSpaceWrap(false)
        
        ipFrame.menu = IncentiveProgram:CreateMenu(ipFrame)
        UIDropDownMenu_Initialize(ipFrame.menu.frame, ipFrame.menu.MenuOnLoad, "MENU")
        
        self.ipFrame = ipFrame
    end,

    OnClick = function(self, button, down, anchorFrame)
        self.ipFrame.menu.frame.button = button
        anchorFrame = anchorFrame or self.ipFrame
        self.ipFrame.anchorFrame = anchorFrame
        
        if ( button == "LeftButton" ) then
            self:GetUIMenuFrame().point = "BOTTOMLEFT"
            self:GetUIMenuFrame().relativeTo = anchorFrame
            self:GetUIMenuFrame().relativePoint = "TOPRIGHT"
            ToggleDropDownMenu(1, nil, self:GetUIMenuFrame(), anchorFrame, 0, 0)
        elseif ( button == "RightButton" ) then
            self:GetUIMenuFrame().point = "BOTTOMLEFT"
            self:GetUIMenuFrame().relativeTo = anchorFrame
            self:GetUIMenuFrame().relativePoint = "TOPRIGHT"
            ToggleDropDownMenu(1, nil, self:GetUIMenuFrame(), anchorFrame, 0, 0)
        end
    end,

    HideTextures = function(self)
        self.ipFrame.tex:SetTexture(IncentiveProgram.Icons["INCENTIVE_NONE"])
        self.ipFrame.leftGradiant:Hide()
        self.ipFrame.rightGradiant:Hide()
        self.ipFrame.text:Hide()
		self:UpdatedSettings() --Hide when count 0
    end,

    ShowTextures = function(self, count, texture)
        if texture then
            self.ipFrame.tex:SetTexture(texture)
        else
            self.ipFrame.tex:SetTexture(IncentiveProgram.Icons["INCENTIVE_RARE"])
        end
        
        self.ipFrame.leftGradiant:Show()
        self.ipFrame.rightGradiant:Show()
        self.ipFrame.text:Show()
        self.ipFrame.text:SetText(count or 0)   
		self:UpdatedSettings() --Hide when count 0
    end,

    ShowFrame = function(self)
        self.ipFrame:Show()
    end,

    HideFrame = function(self)
        self.ipFrame:Hide()
    end,

    UpdatedSettings = function(self)
        local hideAlways = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["HIDE_ALWAYS"])
        local hideInParty = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["HIDE_IN_PARTY"])
		local hideEmpty = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["HIDE_EMPTY"])
		
		if ( hideAlways ) then
			self:HideFrame()
		elseif ( hideInParty and IsInGroup() ) then
			self:HideFrame()
		elseif ( hideEmpty and IncentiveProgram:GetDungeon():GetCount() == 0 ) then
			self:HideFrame()
		else
			self:ShowFrame()
		end
		
    end,
    

    GetUIFrame = function(self)
        return self.ipFrame
    end,

    GetAnchorFrame = function(self)
        return self.ipFrame.anchorFrame
    end,

    GetUIMenuFrame = function(self)
        return self.ipFrame.menu.frame
    end,
	ResetFramePosition = function(self)
		self.ipFrame:ClearAllPoints()
		self.ipFrame:SetPoint("topleft", Minimap, "topleft", 0, 0)
        IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["FRAME_TOP"], self.ipFrame:GetTop())
        IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["FRAME_LEFT"], self.ipFrame:GetLeft())
	end
}

function IncentiveProgram:GetFrame()
    if not frame then
        frame = IncentiveProgramFrame:new()
        frame:CreateFrame()
    end
    
    return frame
end











----------------------------------- toast -----------------------------------
-- Local copy of the class
local toast

-- Stores Toasts
local IPToasts = {}

local IncentiveProgramToast = {
    new = function(self)
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
        return obj
    end,
    
    CreateFrame = function(self)
        local toastFrame = CreateFrame("Frame", "IncentiveProgramToastFrame", UIParent)
        toastFrame:Hide()
        
        toastFrame:SetFrameStrata("LOW")
        toastFrame:SetWidth(250)
        toastFrame:SetHeight(50)
        toastFrame:SetMovable(true)
        toastFrame:SetClampedToScreen(true)
        
        toastFrame:SetPoint("TOPLEFT",3,-21)
        
        --Backdrop
        toastFrame:SetBackdrop( {
            bgFile = "Interface\\FriendsFrame\\UI-Toast-Background",
            edgeFile = "Interface\\FriendsFrame\\UI-Toast-Border",
            tile = true, tileSize = 12, edgeSize = 12,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        
        toastFrame.waitAndAnimOut = toastFrame:CreateAnimationGroup("IncentiveProgramToastFrameWaitAndAnimOut")
        local waaoAlpha = toastFrame.waitAndAnimOut:CreateAnimation("Alpha")
        waaoAlpha:SetParent(toastFrame.waitAndAnimOut)
        waaoAlpha:SetOrder(1)
        waaoAlpha:SetFromAlpha(1)
        waaoAlpha:SetToAlpha(0)
        waaoAlpha:SetDuration(1.5)
        waaoAlpha:SetStartDelay(4.05)
        waaoAlpha:SetScript("OnFinished", function() toastFrame:Hide() end)
        toastFrame.waitAndAnimOut.animOut = waaoAlpha
        
        --BORDER Layer
        local iconTexture = toastFrame:CreateTexture("IncentiveProgramToastFrameIconTexture", "BORDER")
        iconTexture:SetWidth(40)
        iconTexture:SetHeight(40)
        iconTexture:SetPoint("LEFT",4,0)
        iconTexture:SetTexture(348520) --satchel texture ID
        toastFrame.iconTexture = iconTexture
        
        local topLine = toastFrame:CreateFontString("IncentiveProgramToastFrameTopLine", "BORDER", "FriendsFont_Normal")
        topLine:SetJustifyH("LEFT")
        topLine:SetJustifyV("MIDDLE")
        topLine:SetWidth(0)
        topLine:SetHeight(10)
        topLine:SetPoint("TOPLEFT", 49, -7)
        topLine:SetPoint("RIGHT", -20, 0)
        topLine:SetTextColor(0.510, 0.773, 1)
        topLine:SetText(NOTICE_INCENTIVEPROGRAM_TITLE)
        toastFrame.topLine = topLine
        
        local middleLine = toastFrame:CreateFontString("IncentiveProgramToastFrameMiddleLine", "BORDER", "FriendsFont_Normal")
        middleLine:SetJustifyH("LEFT")
        middleLine:SetJustifyV("MIDDLE")
        middleLine:SetWidth(0)
        middleLine:SetHeight(10)
        middleLine:SetPoint("TOPLEFT", topLine, "BOTTOMLEFT", 0, -4)
        middleLine:SetTextColor(0.486, 0.518, 0.541)
        middleLine:SetText("Random Dungeon Heroic")
        toastFrame.middleLine = middleLine
        
        local bottomLine = toastFrame:CreateFontString("IncentiveProgramToastFrameBottomLine", "BORDER", "FriendsFont_Normal")
        bottomLine:SetJustifyH("LEFT")
        bottomLine:SetJustifyV("MIDDLE")
        bottomLine:SetWidth(0)
        bottomLine:SetHeight(10)
        bottomLine:SetPoint("TOPLEFT", middleLine, "BOTTOMLEFT", 0, -4)
        bottomLine:SetTextColor(0.486, 0.518, 0.541)
        bottomLine:SetText("{T} Tank | {H} Healer")
        toastFrame.bottomLine = bottomLine
        
        local clickFrame = CreateFrame("Button", "IncentiveProgramToastFrameClickFrame", toastFrame)
        clickFrame:SetAllPoints(toastFrame)
        clickFrame:SetScript("OnEnter", function(...)
            toastFrame.waitAndAnimOut:Stop()
        end)
        clickFrame:SetScript("OnLeave", function(...)
            toastFrame.waitAndAnimOut.animOut:SetStartDelay(1)
            toastFrame.waitAndAnimOut:Play()
        end)

        clickFrame:EnableMouse(true)
        clickFrame:SetMovable(true)
        clickFrame:RegisterForDrag("LeftButton")
        clickFrame:RegisterForClicks("AnyUp")
        clickFrame:SetScript("OnDragStart", function(s) s:GetParent():StartMoving() end)
        clickFrame:SetScript("OnDragStop", function(s)
            s:GetParent():StopMovingOrSizing()
            IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["TOAST_TOP"], s:GetParent():GetTop())
            IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["TOAST_LEFT"], s:GetParent():GetLeft())
        end)
        
        toastFrame.clickFrame = clickFrame
        
        local glowFrame = CreateFrame("Frame", "IncentiveProgramToastFrameGlowFrame", toastFrame)
        glowFrame:SetAllPoints(toastFrame)
        glowFrame.glow = glowFrame:CreateTexture("IncentiveProgramToastFrameGlowFrameGlow", "OVERLAY")
        glowFrame.glow:SetWidth(252)
        glowFrame.glow:SetHeight(56)
        glowFrame.glow:SetAlpha(1)
        glowFrame.glow:SetTexture("Interface\\FriendsFrame\\UI-Toast-Flair")
        glowFrame.glow:SetBlendMode("ADD")
        glowFrame.glow:Hide()
        glowFrame.glow:SetPoint("TOPLEFT", -1, 3)
        glowFrame.glow:SetPoint("BOTTOMRIGHT", 1, -3)
        
        glowFrame.animIn = glowFrame:CreateAnimationGroup("IncentiveProgramToastFrameGlowFrameAnimIn")
        
        local alpha1 = glowFrame.animIn:CreateAnimation("Alpha")
        alpha1:SetParent(glowFrame.animIn)
        alpha1:SetOrder(1)
        alpha1:SetFromAlpha(0)
        alpha1:SetToAlpha(1)
        alpha1:SetDuration(0.2)
        local alpha2 = glowFrame.animIn:CreateAnimation("Alpha")
        alpha2:SetParent(glowFrame.animIn)
        alpha2:SetOrder(2)
        alpha2:SetFromAlpha(1)
        alpha2:SetToAlpha(0)
        alpha2:SetDuration(0.5)
        
        glowFrame.animIn:SetScript("OnPlay",function(...) 
            glowFrame.glow:Show()
        end)
        glowFrame.animIn:SetScript("OnFinished",function(...) 
            glowFrame.glow:Hide()
        end)
        toastFrame.glowFrame = glowFrame
        
        local closeButton = CreateFrame("Button", "IncentiveProgramToastFrameCloseButton", toastFrame)
        closeButton:SetWidth(18)
        closeButton:SetHeight(18)
        closeButton:SetPoint("TOPRIGHT", -4, -3)
        closeButton:SetNormalTexture("Interface\\FriendsFrame\\UI-Toast-CloseButton-Up")
        closeButton:SetPushedTexture("Interface\\FriendsFrame\\UI-Toast-CloseButton-Down")
        closeButton:SetHighlightTexture("Interface\\FriendsFrame\\UI-Toast-CloseButton-Highlight")
        --closeButton:GetHighlightTexture():SetBlendMode("ADD")
        closeButton:SetScript("OnClick", function() 
            for i = #IPToasts, 1, -1 do tremove(IPToasts,i) end
            toastFrame:Hide()
        end)
        toastFrame.closeButton = closeButton
        
        local frameLevel = clickFrame:GetFrameLevel()
        closeButton:SetFrameLevel(frameLevel + 1)
        glowFrame:SetFrameLevel(frameLevel + 2)
        
        toastFrame:SetScript("OnHide", function()
            if #IPToasts > 0 then
                self:ShowToast()
            end
        end)
        
        self.toastFrame = toastFrame
    end,
      
    ShowToast = function(self)
        local toastFrame = self.toastFrame
        local line1, line2, texture = IPToasts[1].line1, IPToasts[1].line2, IPToasts[1].texture
        local arg1, arg2, func = IPToasts[1].arg1, IPToasts[1].arg2, IPToasts[1].func
        tremove(IPToasts,1)
        
        toastFrame.middleLine:SetText(line1)
        toastFrame.bottomLine:SetText(line2)
        if ( texture and type(texture) == "number" and texture ~= 348520 ) then
            toastFrame.iconTexture:SetTexture(texture)
			toastFrame.iconTexture:SetTexCoord(0.1, 0.6, 0, 1)
        elseif ( texture ) then
            toastFrame.iconTexture:SetTexture(texture)
			toastFrame.iconTexture:SetTexCoord(0, 1, 0, 1)
		else
            toastFrame.iconTexture:SetTexture(348520) --satchel texture ID
			toastFrame.iconTexture:SetTexCoord(0, 1, 0, 1)
        end
        
        if arg1 then
            toastFrame.clickFrame.arg1 = arg1
        else
            toastFrame.clickFrame.arg1 = nil
        end
        
        if arg2 then
            toastFrame.clickFrame.arg2 = arg2
        else
            toastFrame.clickFrame.arg2 = nil
        end
        
        if func then
            toastFrame.clickFrame.func = func
            toastFrame.clickFrame:SetScript("OnClick", function(s, ...)
                s.func(IncentiveProgram:GetMenu(), s.arg1, s.arg2)
                toastFrame:Hide()
            end)
        else
            toastFrame.clickFrame:SetScript("OnClick", function() end)
        end
        
        self:UpdateAnchor()
        toastFrame:Show();
        --PlaySoundKitID(18019) --BNet toast frame ping --Done in core.lua now.
		--IncentiveProgram:SetSound(IncentiveProgram.TOAST) --decided against playing sound on each toast refresh
        toastFrame.glowFrame.animIn:Play()
        toastFrame.waitAndAnimOut:Stop()
        if toastFrame:IsMouseOver() then
            toastFrame.waitAndAnimOut.animOut:SetStartDelay(1);
        else
            toastFrame.waitAndAnimOut.animOut:SetStartDelay(4.5)
            toastFrame.waitAndAnimOut:Play()
        end
    end,

    AddToast = function(self, line1, line2, texture, arg1, arg2, func)
        local toast = {}
        toast.line1 = line1 or ""
        toast.line2 = line2 or ""
        toast.texture = texture or 348520
        toast.arg1 = arg1
        toast.arg2 = arg2
        toast.func = func
        tinsert(IPToasts, toast)
        
        if not self.toastFrame:IsShown() then
            self:ShowToast()
        end
    end,
 	
    UpdateAnchor = function(self)
        local toastFrame = self.toastFrame
        toastFrame:ClearAllPoints()
        
        local top = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["TOAST_TOP"])
        local left = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["TOAST_LEFT"])
        if ( top == -1 ) then
            toastFrame:SetPoint("TOPLEFT",3,-21)
        else
            toastFrame:SetPoint("BOTTOMLEFT", left, top - toastFrame:GetHeight())
        end
    end
}
 
function IncentiveProgram:GetToast()
    if not toast then
        toast = IncentiveProgramToast:new()
        toast:CreateFrame()
    end
    
    return toast
end















----------------------------------- dungeon -----------------------------------
--Local copy of the class
local dungeon
 
local function getDungeonInfo()
    local dungeonIDs, dungeonNames, dungeonTypes = {}, {}, {}
    
    for i=1, GetNumRFDungeons() do
        local id, name = GetRFDungeonInfo(i)
        IncentiveProgram:GetSettings():SetDungeonSetting(id, IncentiveProgram.Settings["DUNGEON_NAME"], name)
        IncentiveProgram:GetSettings():SetDungeonSetting(id, IncentiveProgram.Settings["DUNGEON_TYPE"], LE_LFG_CATEGORY_RF)
        if IsLFGDungeonJoinable(id) then
            tinsert(dungeonIDs, id)
            tinsert(dungeonNames, name)
            tinsert(dungeonTypes, LE_LFG_CATEGORY_RF)
        end
    end
    
    for i=1, GetNumRandomDungeons() do
        local id, name = GetLFGRandomDungeonInfo(i)
        IncentiveProgram:GetSettings():SetDungeonSetting(id, IncentiveProgram.Settings["DUNGEON_NAME"], name)
        IncentiveProgram:GetSettings():SetDungeonSetting(id, IncentiveProgram.Settings["DUNGEON_TYPE"], LE_LFG_CATEGORY_LFD)
        if IsLFGDungeonJoinable(id) then
            tinsert(dungeonIDs, id)
            tinsert(dungeonNames, name)
            tinsert(dungeonTypes, LE_LFG_CATEGORY_LFD)
        end
    end
    
    return dungeonIDs, dungeonNames, dungeonTypes
end

local function canQueueForRoles(tank, healer, damage)
	local roleTank = IncentiveProgram:GetSettings():GetUserSetting(IncentiveProgram.Settings["ROLE_TANK"])
	local roleHealer = IncentiveProgram:GetSettings():GetUserSetting(IncentiveProgram.Settings["ROLE_HEALER"])
	local roleDamage = IncentiveProgram:GetSettings():GetUserSetting(IncentiveProgram.Settings["ROLE_DAMAGE"])
	
	tank = tank and roleTank
	healer = healer and roleHealer
	damage = damage and roleDamage

    return tank, healer, damage
end

local function getAlertText(tempKey)
    local returnString
    
    if ( string.find(tempKey, "T") ) then
        returnString = IncentiveProgram.TOAST_TANK
    end
    
    if ( string.find(tempKey, "H") ) then
        if ( returnString ) then
            returnString = returnString.." | "..IncentiveProgram.TOAST_HEALER
        else
            returnString = IncentiveProgram.TOAST_HEALER
        end
    end
    
    if ( string.find(tempKey, "D") ) then
        if ( returnString ) then
            returnString = returnString.." | "..IncentiveProgram.TOAST_DAMAGE
        else
            returnString = IncentiveProgram.TOAST_DAMAGE
        end
    end
    
    return returnString
end

local function sendAlert(dungeonID, tempKey)
	local flair = IncentiveProgram.Flair[dungeonID] or ""
	local name = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["DUNGEON_NAME"]) or ""
	local line1 = flair..name
	
	local line2 = getAlertText(tempKey) or ""

	local texture = select(11, GetLFGDungeonInfo(dungeonID))
	if ( texture and texture ~= "" and type(texture) ~= "number" ) then
		texture = "Interface\\LFGFrame\\UI-LFG-BACKGROUND-"..texture
	else
		texture = texture or 348520
	end
	
	local ignoreCompletedLFRs = IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["IGNORE_COMPLETED_LFR"])
	local ignoreDungeon = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["IGNORE"])
	
	if ( ignoreCompletedLFRs ) then
		local encounterDone, encounterTotal = GetLFGDungeonNumEncounters(dungeonID)

		if ( encounterDone == 0 ) then --Not an LFR, so alert.
			IncentiveProgram:SetAlert(line1, line2, texture, dungeonID)
		elseif ( encounterDone ~= encounterTotal ) then --all of the LFRs have not been completed.
			IncentiveProgram:SetAlert(line1, line2, texture, dungeonID)
		end
	elseif (not ignoreDungeon ) then
		IncentiveProgram:SetAlert(line1, line2, texture, dungeonID)
	end
end

local IncentiveProgramDungeon = {
    new = function(self)
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
        
        self.dungeonIDShortage = {}
        self.dungeonIDShortageTemp = {}
        self.dungeonIDs, self.dungeonNames, self.dungeonTypes = getDungeonInfo()
        
        return obj
    end,

    GetShortage = function(self)
        wipe(self.dungeonIDShortageTemp)
        
        local shortageType = 0
        
        for i=1, #self.dungeonIDs do
            for j=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
                local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(self.dungeonIDs[i], j)
                forTank, forHealer, forDamage = canQueueForRoles(forTank, forHealer, forDamage)
                eligible = eligible and (forTank or forHealer or forDamage)
                if ( eligible and ( itemCount ~= 0 or money ~= 0 or xp ~= 0 ) ) then
                    shortageType = j
                    if forTank then forTank = "T" else forTank = "t" end
                    if forHealer then forHealer = "H" else forHealer = "h" end
                    if forDamage then forDamage = "D" else forDamage = "d" end
                    self.dungeonIDShortageTemp[self.dungeonIDs[i]] = j..forTank..forHealer..forDamage..itemCount..money..xp
                end
            end
        end
        
        local hasRemoved, hasAdded, hasDifference
        
        for key, value in pairs(self.dungeonIDShortage) do
            if ( not self.dungeonIDShortageTemp[key] ) then
                --Removed from the shortage list
                hasRemoved = true
            end
        end
        
        for key, value in pairs(self.dungeonIDShortageTemp) do
            if ( not self.dungeonIDShortage[key] ) then
                --Added to shortage list
                hasAdded = true
                sendAlert(key, value)
            elseif ( value ~= self.dungeonIDShortage[key]) then
                --Difference in the roles eligble for shortage bonus
                hasDifference = true
                sendAlert(key, value)
            end
        end
        
        wipe(self.dungeonIDShortage)
        for key, value in pairs(self.dungeonIDShortageTemp) do
            self.dungeonIDShortage[key] = value
        end
        
        return self.dungeonIDShortage, hasRemoved, hasAdded, hasDifference
    end,

    GetShortageCount = function(self)
        local tShortage = self:GetShortage()
        local count = 0
        for key, value in pairs(tShortage) do
            
            if ( self:IsQueued(key) ) then
            
            elseif ( IncentiveProgram:GetSettings():GetDungeonSetting(key, IncentiveProgram.Settings["IGNORE"]) ) then
            
            elseif ( not self:CanQueueForDungeon(key) ) then
            
			elseif ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["IGNORE_COMPLETED_LFR"]) ) then
				local encounterDone, encounterTotal = GetLFGDungeonNumEncounters(key)

				if ( encounterDone == 0 ) then --Not an LFR, so alert.
					count = count + 1
				elseif ( encounterDone ~= encounterTotal ) then --all of the LFRs have not been completed.
					count = count + 1
				end
            else
                count = count + 1
            end
        end
        
        return count
    end,
	 
    GetCount = function(self)
        local tShortage = self:GetShortage()
        local count = 0
        for key, value in pairs(tShortage) do
            count = count + 1
        end
        
        return count
    end,

    GetDungeonList = function(self)
        return self.dungeonIDs, self.dungeonNames, self.dungeonTypes
    end,

    GetShortageRoles = function(self, dungeonID)
        local tank, healer, damage = false, false, false
        
        for i=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
            local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(dungeonID, i)
            if ( eligible and ( itemCount ~= 0 or money ~= 0 or xp ~= 0 ) ) then
                tank = tank or forTank
                healer = healer or forHealer
                damage = damage or forDamage
            end
        end
        
        return canQueueForRoles(tank, healer, damage)
    end,

    CanQueueForDungeon = function(self, dungeonID)
        local shortageTank, shortageHealer, shortageDamage = self:GetShortageRoles(dungeonID)
      
        local queueAsTank =  IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_TANK"])
        local queueAsHealer = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_HEALER"])
        local queueAsDamage = IncentiveProgram:GetSettings():GetDungeonSetting(dungeonID, IncentiveProgram.Settings["QA_DAMAGE"])

        if ( ( shortageTank and queueAsTank ) or ( shortageHealer and queueAsHealer ) or ( shortageDamage and queueAsDamage ) ) then
            return true, ( shortageTank and queueAsTank ), ( shortageHealer and queueAsHealer ), ( shortageDamage and queueAsDamage )
        else
            return false, false, false, false
        end
    end,
    
    IsQueued = function(self, dungeonID)
        for i=1, NUM_LE_LFG_CATEGORYS do
            for key, value in pairs(GetLFGQueuedList(i)) do
                if key == dungeonID then
                    return true
                end
            end
        end 
        return false
    end
}

function IncentiveProgram:GetDungeon()
    if not dungeon then
        dungeon = IncentiveProgramDungeon:new()
    end
    
    return dungeon
end










local eventFrame = CreateFrame("Frame", "IncentiveProgramEventFrame", UIParent)
eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:SetScript("OnEvent", function(self, ...) self:OnEvent(...) end)
eventFrame:SetScript("OnUpdate", function(self, ...) self:OnUpdate(...) end)

--------------------------------------------- Variables-----------------------------------------
IncentiveProgram.SavedLFGRoles = {
    isUpdated = false,
    Leader = false,
    Tank = false,
    Healer = false,
    Damage = false
}
--------------------------------------------- Slash Command -----------------------------------------
SLASH_INCENTIVEPROGRAM1 = "/ip"
function SlashCmdList.INCENTIVEPROGRAM(msg, editbox)
    --IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["HIDE_IN_PARTY"], false)
    --IncentiveProgram:GetSettings():SetSetting(IncentiveProgram.Settings["HIDE_ALWAYS"], false)
    --IncentiveProgram:GetFrame():ShowFrame()
	InterfaceOptionsFrame_OpenToCategory(IncentiveProgramInterfacePanel) 
end
function eventFrame:OnEvent(event, ...)
    if ( event == "VARIABLES_LOADED" ) then
        IncentiveProgram:SetCount(0)
        IncentiveProgram:GetFrame():UpdatedSettings()
        
        self:RegisterEvent("GROUP_ROSTER_UPDATE")
        self:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
        self:RegisterEvent("LFG_ROLE_UPDATE")
    elseif ( event == "GROUP_ROSTER_UPDATE" or event == "LFG_UPDATE" ) then --Party Update
        if IsInGroup() then
            if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["HIDE_IN_PARTY"]) ) then
                IncentiveProgram:GetFrame():HideFrame()
            end
            
            IncentiveProgram:SetCount(0)
        else
            IncentiveProgram:GetFrame():UpdatedSettings()
            RequestLFDPlayerLockInfo()
        end
    elseif ( event == "LFG_UPDATE_RANDOM_INFO" ) then --Received new LFD Info
		local count = IncentiveProgram:GetDungeon():GetShortageCount()
        IncentiveProgram:SetCount(count)
		if ( count == 0 ) then
			eventFrame.continousEnabled = false
		else
			if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["CONTINUOUSLY_CYCLE"]) ) then
				eventFrame.continousEnabled = true
			else
				eventFrame.continousEnabled = false
			end
		end
    end
    
    if ( IncentiveProgram.SavedLFGRoles.isUpdated ) then
	    IncentiveProgram.SavedLFGRoles.isUpdated = false
        SetLFGRoles(IncentiveProgram.SavedLFGRoles.Leader, IncentiveProgram.SavedLFGRoles.Tank, IncentiveProgram.SavedLFGRoles.Healer, IncentiveProgram.SavedLFGRoles.Damage)
    end
end

function eventFrame:OnUpdate(e)
    self.elapsed = self.elapsed or (IncentiveProgram.TickRate - 5)
    self.elapsed = self.elapsed + e
	
	self.soundElapsed = self.soundElapsed or 0
	self.soundElapsed = self.soundElapsed + e
	self.soundCountAlert = self.soundCountAlert or 0
	self.soundCountToast = self.soundCountToast or 0
	
	self.cycleElapsed = self.cycleElapsed or 0
	self.cycleElapsed = self.cycleElapsed + e
    self.cycleCount = self.cycleCount or 0

	if ( self.elapsed >= IncentiveProgram.TickRate ) then
		self.elapsed = 0
		if ( not IsInGroup() ) then --can't get incentives in a group anyways.  Seems to still trigger
									--when in LFR dungeons anyways, so ignore it now.
			RequestLFDPlayerLockInfo()
		end
	end
	
	if ( self.soundElapsed >= IncentiveProgram.SoundRate ) then
		self.soundElapsed = 0
		if ( self.soundCountAlert > 0 ) then
			local successful = PlaySound(IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["ALERT_SOUND"]), IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["CHANNEL"]))
			if successful then self.soundCountAlert = self.soundCountAlert - 1 end
		end
		
		if ( self.soundCountToast > 0 ) then
			local successful = PlaySound(IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["TOAST_SOUND"]), IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["CHANNEL"]))
			if successful then self.soundCountToast = self.soundCountToast - 1 end
		end
	end
	
	if ( self.cycleElapsed >= IncentiveProgram.CycleRate ) then
		self.cycleElapsed = 0
		
		if ( self.cycleCount == 0 and self.continousEnabled ) then
			self.cycleCount = 3
		end
		if ( self.cycleCount > 0 ) then
			if ( ( self.cycleCount % 3 ) == 0 ) then
				IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()
					,IncentiveProgram.Icons["INCENTIVE_PLENTIFUL"])
			elseif ( ( self.cycleCount % 3 ) == 1 ) then
				IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()
					,IncentiveProgram.Icons["INCENTIVE_UNCOMMON"])
			else
				IncentiveProgram:SetCount(IncentiveProgram:GetDungeon():GetShortageCount()
					,IncentiveProgram.Icons["INCENTIVE_RARE"])
			end
			self.cycleCount = self.cycleCount - 1
		end
	end
end

function IncentiveProgram:SetCount(count, texture)
	if ( not count ) then count = 0 end
    if ( not texture ) then
        texture = IncentiveProgram.Icons["INCENTIVE_RARE"]
    end

    if ( count > 0 ) then
        IncentiveProgram:GetFrame():ShowTextures(count, texture)
    else
        IncentiveProgram:GetFrame():HideTextures()
    end       
end

function IncentiveProgram:SetAlert(line1, line2, texture, arg1, arg2)
    if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["ALERT"]) ) then
        eventFrame.cycleCount = 3 * IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["CYCLE_COUNT"])
		IncentiveProgram:SetSound(IncentiveProgram.ALERT)
    end
    
    if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["ALERT_TOAST"]) ) then
        IncentiveProgram:GetToast():AddToast(line1, line2, texture, arg1, arg2, IncentiveProgram:GetMenu().JoinDungeon)
		IncentiveProgram:SetSound(IncentiveProgram.TOAST)
    end
end

function IncentiveProgram:SetSound(alertType)
	if ( alertType == IncentiveProgram.ALERT ) then
		if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["ALERT_PING"]) ) then
			eventFrame.soundCountAlert = tonumber(IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["ALERT_REPEATS"])) or 0
		end
	elseif ( alertType == IncentiveProgram.TOAST ) then
		if ( IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["TOAST_PING"]) ) then
			eventFrame.soundCountToast = tonumber(IncentiveProgram:GetSettings():GetSetting(IncentiveProgram.Settings["TOAST_REPEATS"])) or 0
		end
	end
end
