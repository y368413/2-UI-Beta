---------Incentive Program-----Created by: Jacob Beu-----Xubera @ US-Alleria-----r3 | 07/31/2016-----------------

local IncentiveProgram = {}
local IncentiveProgramFrame = CreateFrame("Button", "IncentiveProgramFrame", UIParent)
IncentiveProgramFrame:RegisterEvent("ADDON_LOADED")
IncentiveProgramFrame:SetScript("OnEvent", function(self) self:SetupFrame() end)

--predefine local functions
local getDungeonSetting, setDungeonSetting, setSetting, getSetting

---------------------------------------
-- Constants
---------------------------------------
local TANK,HEALER,DAMAGE = 1,2,3

--Icon File Paths
local IncentiveProgramIcons = {
    ["INCENTIVE_NONE"] = "",--Interface\\ICONS\\Ability_Malkorok_BlightofYshaarj_Red
    ["INCENTIVE_RARE"] = "Interface\\Icons\\INV_Misc_Coin_17",
    ["INCENTIVE_UNCOMMON"] = "Interface\\Icons\\INV_Misc_Coin_18",
    ["INCENTIVE_PLENTIFUL"] = "Interface\\Icons\\INV_Misc_Coin_19",
    ----------------------
    ["CONTEXT_MENU_DIVIDER"] = "Interface\\Common\\UI-TooltipDivider-Transparent",
    ["CONTEXT_MENU_RED_X"] = "Interface\\Common\\VOICECHAT-MUTED"
  }
  
local IncentiveProgramFlair = {
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
    [1293] = "NH4 - "
}
  
-- Frame constants
local TICK_RATE = 20;
local ALERT_RATE = 1.5;
local QUEUE_RATE = 2;
local NUM_OF_ALERT_CYCLES = 6
local NUM_OF_ALERT_IMAGES = 3
  
--Context Menu Finals
local CONTEXT_TANK = 2
local CONTEXT_HEALER = 3
local CONTEXT_DAMAGE = 4
local CONTEXT_ROLES = "roles"
local CONTEXT_QUEUE = "queue"
local CONTEXT_JOIN = "join"
local CONTEXT_LEAVE = "leave"
local CONTEXT_IGNORE = "ignore"
local CONTEXT_SETTINGS = "settings"

--Settings
local SETTING_QA_TANK = "queueAsTank"
local SETTING_QA_HEALER = "queueAsHealer"
local SETTING_QA_DAMAGE = "queueAsDamage"
local SETTING_IGNORE = "ignore"
local SETTING_DUNGEON_NAME = "dungeon_name"
local SETTING_DUNGEON_TYPE = "dungeon_type"
local SETTING_HIDE_IN_PARTY = "hideInParty"
local SETTING_HIDE_ALWAYS = "hideAlways" --still shows in data brokers
local SETTING_ALERT = "alert"

local IncentiveProgramdefaultSettings = {
    queueAsTank = true,
    queueAsHealer = true,
    queueAsDamage = true,
    ignore = false,
    hideInParty = true,
    hideAlways = false,
    alert = true
}

---------------------------------------
-- Variables
---------------------------------------
local IncentiveProgramSavedLFGRoles = {
    isUpdated = false,
    Leader = false,
    Tank = false,
    Healer = false,
    Damage = false
}
  
---------------------------------------
-- Context Menu
---------------------------------------

--Context Menu Helper Functions
local function menuClick(menuButton, arg1, arg2)

    if arg1 == CONTEXT_ROLES then
        local leader, tank, healer, damage = GetLFGRoles()
        if arg2 == CONTEXT_TANK then
            SetLFGRoles(leader, menuButton.checked, healer, damage)
        elseif arg2 == CONTEXT_HEALER then
            SetLFGRoles(leader, tank, menuButton.checked, damage)
        elseif arg2 == CONTEXT_DAMAGE then
            SetLFGRoles(leader, tank, healer, menuButton.checked)
        end
    elseif arg1 == CONTEXT_QUEUE then
        local dungeonID = UIDROPDOWNMENU_MENU_VALUE
        if arg2 == CONTEXT_TANK then
            setDungeonSetting(dungeonID, SETTING_QA_TANK, menuButton.checked)
        elseif arg2 == CONTEXT_HEALER then
            setDungeonSetting(dungeonID, SETTING_QA_HEALER, menuButton.checked)
        elseif arg2 == CONTEXT_DAMAGE then
            setDungeonSetting(dungeonID, SETTING_QA_DAMAGE, menuButton.checked)
        elseif arg2 == CONTEXT_IGNORE then
            setDungeonSetting(dungeonID, SETTING_IGNORE, true)
            IncentiveProgramFrame.elapsed = TICK_RATE
        elseif arg2 == CONTEXT_JOIN then
            local dungeonType = getDungeonSetting(dungeonID, SETTING_DUNGEON_TYPE)
            local queuedAsLeader, queuedAsTank, queuedAsHealer, queuedAsDamage = GetLFGRoles();
            local settingTank = getDungeonSetting(dungeonID, SETTING_QA_TANK)
            local settingHealer = getDungeonSetting(dungeonID, SETTING_QA_HEALER)
            local settingDamage = getDungeonSetting(dungeonID, SETTING_QA_DAMAGE)
            local shortageTank, shortageHealer, shortageDamage = IncentiveProgram:GetShortageRoles(dungeonID)
            
            local tank = IncentiveProgram:CanQueueForRole(queuedAsTank, settingTank, shortageTank)
            local healer = IncentiveProgram:CanQueueForRole(queuedAsHealer, settingHealer, shortageHealer)
            local damage = IncentiveProgram:CanQueueForRole(queuedAsDamage, settingDamage, shortageDamage)
            
            --print("Q as Tank:", queuedAsTank, "Healer:", queuedAsHealer, "Damage:", queuedAsDamage)
            --print("S as Tank:", settingTank, "Healer:", settingHealer, "Damage:", settingDamage)
            --print("I as Tank:", shortageTank, "Healer:", shortageHealer, "Damage:", shortageDamage)
            --print("C as Tank:", tank, "Healer:", healer, "Damage:", damage)
            
            if dungeonType == LE_LFG_CATEGORY_RF and (tank or healer or damage) then
                SetLFGRoles(queuedAsLeader, tank, healer, damage)
                RaidFinderQueueFrame.raid = dungeonID
                RaidFinderQueueFrame_Join() --Blizzard function in RaidFinder.lua
                
                IncentiveProgramSavedLFGRoles.isUpdated = true
                IncentiveProgramSavedLFGRoles.Leader = queuedAsLeader
                IncentiveProgramSavedLFGRoles.Tank = queuedAsTank
                IncentiveProgramSavedLFGRoles.Healer = queuedAsHealer
                IncentiveProgramSavedLFGRoles.Damage = queuedAsDamage
                IncentiveProgramFrame.elapsed = TICK_RATE - QUEUE_RATE
            elseif dungeonType == LE_LFG_CATEGORY_LFD and (tank or healer or damage) then
                local queuedAsLeader, queuedAsTank, queuedAsHealer, queuedAsDamage = GetLFGRoles();  

                SetLFGRoles(queuedAsLeader, tank, healer, damage)
                
                LFDQueueFrame.type = dungeonID
                LFDQueueFrame_Join() --Blizzard Function in LFGFrame.lua
                
                IncentiveProgramSavedLFGRoles.isUpdated = true
                IncentiveProgramSavedLFGRoles.Leader = queuedAsLeader
                IncentiveProgramSavedLFGRoles.Tank = queuedAsTank
                IncentiveProgramSavedLFGRoles.Healer = queuedAsHealer
                IncentiveProgramSavedLFGRoles.Damage = queuedAsDamage
                IncentiveProgramFrame.elapsed = TICK_RATE - QUEUE_RATE
            end
                    
            ToggleDropDownMenu(1, nil, IncentiveProgramFrame.menu, IncentiveProgramFrame.anchorFrame or IncentiveProgramFrame, 0, 0) --Close context menu and lock until LFGRoles reset
        end
    elseif arg1 == CONTEXT_IGNORE then
        setDungeonSetting(arg2, SETTING_IGNORE, false)
        IncentiveProgramFrame.elapsed = TICK_RATE * 2 --double update to refresh properly.
    elseif arg1 == CONTEXT_SETTINGS then
        setSetting(arg2, menuButton.checked)
        if arg2 == SETTING_HIDE_IN_PARTY then
            if IsInGroup() and menuButton.checked then
                IncentiveProgramFrame:HideFrame()
            else
                IncentiveProgramFrame:ShowFrame()
            end
        elseif arg2 == SETTING_HIDE_ALWAYS then
            if menuButton.checked then
                IncentiveProgramFrame:HideFrame()
            else
                IncentiveProgramFrame:ShowFrame()
            end
        end
    end
end

-- Right Click Menu Table
local menuData = {
    [1] = {
        ["isTitle"] = true,
        ["text"] = "随机T和N奖励提醒",
        ["notCheckable"] = true
    },
    
    [2] = {
        ["text"] = "角色",
        ["notCheckable"] = true,
        ["hasArrow"] = true,
        ["value"] = { --submenu
            [1] = {
                ["text"] = "T",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_ROLES,
                ["arg2"] = CONTEXT_TANK,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            },
            [2] = {
                ["text"] = "N",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_ROLES,
                ["arg2"] = CONTEXT_HEALER,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            },
            [3] = {
                ["text"] = "DPS",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_ROLES,
                ["arg2"] = CONTEXT_DAMAGE,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            }
        }
    },
    
    [3] = {
        ["notCheckable"] = true,
        ["text"] = "忽略",
        ["hasArrow"] = true,
        ["value"] = CONTEXT_IGNORE
    },
    
    [4] = {
        ["iconOnly"] = true,
        ["notCheckable"] = true,
        ["keepShownOnClick"] = true,
        ["disabled"] = true,
        ["icon"] = IncentiveProgramIcons["CONTEXT_MENU_DIVIDER"],
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
    
    [5] = {
        ["text"] = "设置",
        ["notCheckable"] = true,
        ["hasArrow"] = true,
        ["value"] = {
            [1] = {
                ["text"] = "有队伍就不显示了",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_SETTINGS,
                ["arg2"] = SETTING_HIDE_IN_PARTY,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            },
            [2] = {
                ["text"] = "隐藏",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_SETTINGS,
                ["arg2"] = SETTING_HIDE_ALWAYS,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            },
            [3] = {
                ["text"] = "有新的奖励时候提醒我",
                ["isNotRadio"] = true,
                ["arg1"] = CONTEXT_SETTINGS,
                ["arg2"] = SETTING_ALERT,
                ["func"] = menuClick,
                ["keepShownOnClick"] = true
            }
        }
    }
}


-- Right and Left Click menu
local function menuOnLoad(self,level)
    if self.button == "LeftButton" then
        if level == 1 then
            local info = UIDropDownMenu_CreateInfo()
            
            --Add Title to Left Click Menu
            info.text = "随机T和N奖励提醒"
            info.isTitle = true
            info.notCheckable = true
            
            UIDropDownMenu_AddButton(info, level)
        
            --Add Dungeons to list
            IncentiveProgram:GetShortage() --refresh list
            
            for i=1, GetNumRFDungeons() do
                info = UIDropDownMenu_CreateInfo()
                
                if (IncentiveProgram:CreateMenuItemDungeon(i, LE_LFG_CATEGORY_RF, info)) then
                    UIDropDownMenu_AddButton(info, level)
                end
            end       
            
            for i=1, GetNumRandomDungeons() do
                info = UIDropDownMenu_CreateInfo()
                
                if (IncentiveProgram:CreateMenuItemDungeon(i, LE_LFG_CATEGORY_LFD, info)) then
                    UIDropDownMenu_AddButton(info, level)
                end
            end
            
        elseif level == 2 then
            local info
            local dungeonID = UIDROPDOWNMENU_MENU_VALUE
            local presentFlag = false
            
            --Add Ignore Button
            info = UIDropDownMenu_CreateInfo()
            info.text = "忽略"
            info.arg1 = CONTEXT_QUEUE
            info.arg2 = CONTEXT_IGNORE
            info.value = dungeonID
            info.func = menuClick
            info.notCheckable = true
            UIDropDownMenu_AddButton(info,level)
            
            for i=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
                local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(dungeonID, i);
                local queuedAsLeader, queuedAsTank, queuedAsHealer, queuedAsDamage = GetLFGRoles();
                eligible = eligible and ((forTank and queuedAsTank) or (forHealer and queuedAsHealer) or (forDamage and queuedAsDamage))
                
                if (eligible and(itemCount ~= 0 or money ~= 0 or xp ~= 0)) then
                
                    if (forTank and queuedAsTank) then
                        info = UIDropDownMenu_CreateInfo()
                        info.text = "T"
                        info.arg1 = CONTEXT_QUEUE
                        info.arg2 = CONTEXT_TANK
                        info.value = dungeonID
                        info.checked = getDungeonSetting(dungeonID, SETTING_QA_TANK)
                        info.isNotRadio = true
                        info.func = menuClick
                        info.keepShownOnClick = true
                        
                        presentFlag = info.checked
                        UIDropDownMenu_AddButton(info,level)
                    end
                    
                    if (forHealer and queuedAsHealer) then
                        info = UIDropDownMenu_CreateInfo()
                        info.text = "N"
                        info.arg1 = CONTEXT_QUEUE
                        info.arg2 = CONTEXT_HEALER
                        info.value = dungeonID
                        info.checked = getDungeonSetting(dungeonID, SETTING_QA_HEALER)
                        info.isNotRadio = true
                        info.func = menuClick
                        info.keepShownOnClick = true
                        
                        presentFlag = info.checked
                        UIDropDownMenu_AddButton(info,level)
                    end
                    
                    if (forDamage and queuedAsDamage) then
                        info = UIDropDownMenu_CreateInfo()
                        info.text = "DPS"
                        info.arg1 = CONTEXT_QUEUE
                        info.arg2 = CONTEXT_DAMAGE
                        info.value = dungeonID
                        info.checked = getDungeonSetting(dungeonID, SETTING_QA_DAMAGE)
                        info.isNotRadio = true
                        info.func = menuClick
                        info.keepShownOnClick = true
                        
                        presentFlag = info.checked
                        UIDropDownMenu_AddButton(info,level)
                    end
                end
            end
            
            
            --Add Join Queue Button
            info = UIDropDownMenu_CreateInfo()
            info.text = "加入随机队伍队列"
            info.arg1 = CONTEXT_QUEUE
            info.arg2 = CONTEXT_JOIN
            info.value = dungeonID
            info.func = menuClick
            info.notCheckable = true
            
            --If Queued, disabled
            if IncentiveProgram:IsQueued(dungeonID) then
                info.disabled = true
            end
            
            if not presentFlag then info.disabled = true end
            UIDropDownMenu_AddButton(info,level)
            
        end
    elseif self.button == "RightButton" then
        if level == 1 then
            for i=1, #menuData do
                local info = UIDropDownMenu_CreateInfo();
                for key,value in pairs(menuData[i]) do
                    info[key] = value
                end
                UIDropDownMenu_AddButton(info, level)
            end
        elseif level == 2 then
            local level2Table = UIDROPDOWNMENU_MENU_VALUE
            if level2Table == CONTEXT_IGNORE then
                local count = 0
                for key,value in pairs(IncentiveProgramDB.dungeonSettings) do
                    if getDungeonSetting(key, SETTING_IGNORE) then
                        local info = UIDropDownMenu_CreateInfo();
                        info.text = value[SETTING_DUNGEON_NAME];
                        info.notCheckable = true
                        info.func = menuClick
                        info.arg1 = CONTEXT_IGNORE
                        info.arg2 = key
                        
                        info.icon = IncentiveProgramIcons["CONTEXT_MENU_RED_X"]
                        info.padding = 8
                        
                        UIDropDownMenu_AddButton(info, level)
                        count = count + 1
                        if count >= 10 then break end
                    end
                end
                if count == 0 then
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = "沒有忽略的随机副本"
                    info.notCheckable = true
                    info.disabled = true
                    
                    UIDropDownMenu_AddButton(info, level)
                end
            else
                for i=1, #level2Table do
                    local info = UIDropDownMenu_CreateInfo();
                    for key,value in pairs(level2Table[i]) do
                        info[key] = value
                    end
                    if level2Table[i]["arg1"] == CONTEXT_ROLES then
                        info.checked = select(level2Table[i]["arg2"],GetLFGRoles())
                        info.disabled = not select((level2Table[i]["arg2"]-1), C_LFGList.GetAvailableRoles())
                    elseif level2Table[i]["arg1"] == CONTEXT_SETTINGS then
                        info.checked = getSetting(level2Table[i]["arg2"])
                    end
                    
                    UIDropDownMenu_AddButton(info, level)
                end
            end
        end
    end
end

-- gets a setting
function getSetting(key)
    if not IncentiveProgramDB then return end --called before variables loaded
    if IncentiveProgramDB.settings[key] == nil then
        IncentiveProgramDB.settings[key] = IncentiveProgramdefaultSettings[key] or false
    end
    
    return IncentiveProgramDB.settings[key]
end

-- sets a setting
function setSetting(key, value)
    if not IncentiveProgramDB then return end --called before variables loaded
    IncentiveProgramDB.settings[key] = value
end

-- gets a dungeon setting, remembers queue preferences and instance name
function getDungeonSetting(dungeon, key)
    if not IncentiveProgramDB then return end --called before variables loaded
    IncentiveProgramDB.dungeonSettings[dungeon] = IncentiveProgramDB.dungeonSettings[dungeon] or {}
    
    if IncentiveProgramDB.dungeonSettings[dungeon][key] == nil then
        IncentiveProgramDB.dungeonSettings[dungeon][key] = IncentiveProgramdefaultSettings[key] or false
    end
    
    return IncentiveProgramDB.dungeonSettings[dungeon][key]
end 

-- sets a dungeon setting
function setDungeonSetting(dungeon, key, value)
    if not IncentiveProgramDB then return end --called before variables loaded
    IncentiveProgramDB.dungeonSettings[dungeon] = IncentiveProgramDB.dungeonSettings[dungeon] or {}
    
    IncentiveProgramDB.dungeonSettings[dungeon][key] = value
end 

---------------------------------------
-- SetupFrame builds the frame
-- should only be called once
---------------------------------------
function IncentiveProgramFrame:SetupFrame()
	self:UnregisterEvent("ADDON_LOADED")
	--Frame
	self:SetWidth(18)
	self:SetHeight(18)
	self:SetPoint("topleft", Minimap, "topleft", 0, 1) --places in middle of screen.  WoW will save the location of
								 --frame for us, because we named it.  Turning off the addon
								 --resets its location.
	self:EnableMouse(true)
	self:SetMovable(true)
	self:RegisterForDrag("LeftButton")
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnDragStart", function(s) s:StartMoving() end)
	self:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
    
    --Set Texture
    self.tex = self:CreateTexture(nil, "BACKGROUND")
    self.tex:SetAllPoints(self)
    self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_NONE"]);
    
    --Set Text on the button, Gradiants make text easier to see
    self.leftGradiant = self:CreateTexture(nil, "BORDER")
    self.leftGradiant:SetWidth(18)
    self.leftGradiant:SetHeight(16)
    self.leftGradiant:SetPoint("LEFT", 0, 0)
    self.leftGradiant:SetTexture(1,0,0,1)
    self.leftGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 0.2, 0, 0, 0, 1)
    
    self.rightGradiant = self:CreateTexture(nil, "BORDER")
    self.rightGradiant:SetWidth(18)
    self.rightGradiant:SetHeight(16)
    self.rightGradiant:SetPoint("RIGHT", 0, 0)
    self.rightGradiant:SetTexture(1,0,0,1)
    self.rightGradiant:SetGradientAlpha("Horizontal", 0, 0, 0, 1, 0, 0, 0, 0.2)
    
    self.text = self:CreateFontString(nil, "ARTWORK", "GameFontWhite")
    self.text:SetJustifyH("CENTER")
    self.text:SetText("0")
    self.text:SetWidth(36)
    self.text:SetHeight(16)
    self.text:SetPoint("CENTER", 0, 0)
    self.text:SetNonSpaceWrap(false)
    
    self.menu = CreateFrame("Frame","IncentiveProgramFrameMenu", self, "UIDropDownMenuTemplate", 1)
    self.menuOnLoad = menuOnLoad
    UIDropDownMenu_Initialize(self.menu, self.menuOnLoad, "MENU")
    
    self:SetScript("OnClick", 
        function(s,button,down)
            s:OnClick(button,down)
        end)
       
    self:RegisterEvent("VARIABLES_LOADED");
    self:RegisterEvent("LFG_LOCK_INFO_RECEIVED");
	self:RegisterEvent("AJ_RAID_ACTION");
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("LFG_UPDATE_RANDOM_INFO");
    self:RegisterEvent("LFG_ROLE_UPDATE");
    self:RegisterEvent("LFG_UPDATE");
    
    self:SetScript("OnEvent", function(s,event,...)
        s:OnEvent(event,...)
    end)
    
    self.elapsed = TICK_RATE - QUEUE_RATE;
    self:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = self.elapsed + elapsed
        if self.elapsed > TICK_RATE then
            self.elapsed = self.elapsed - TICK_RATE
            self:OnTick()
        end
    end)
end

function IncentiveProgramFrame:OnEvent(event,...)
    if (event == "VARIABLES_LOADED") then
        IncentiveProgramDB = IncentiveProgramDB or {}
        IncentiveProgramDB.settings = IncentiveProgramDB.settings or {}
        IncentiveProgramDB.dungeonSettings = IncentiveProgramDB.dungeonSettings or {}
        
        if getSetting(SETTING_HIDE_ALWAYS) then self:HideFrame() end        
    elseif (event == "LFG_UPDATE_RANDOM_INFO") then
    
    elseif event == "LFG_LOCK_INFO_RECEIVED" then
    
    elseif event == "LFG_ROLE_UPDATE" then
        self.elapsed = TICK_RATE; --trigger the Tick
    elseif event == "GROUP_ROSTER_UPDATE" then
        if IsInGroup() and getSetting(SETTING_HIDE_IN_PARTY) then
            self:HideFrame()
        elseif not getSetting(SETTING_HIDE_ALWAYS) then
            self:ShowFrame()
        end
        self.elapsed = TICK_RATE; --trigger the Tick
    elseif event == "LFG_UPDATE" and IncentiveProgram.dungeonIDShortage then
        local count, shortageType = IncentiveProgram:GetShortageCount(), LFG_ROLE_SHORTAGE_RARE
        if count > 0 then
            self:ShowTextures(count, shortageType)
        else
            self:HideTextures()
        end
        
        self.elapsed = TICK_RATE; --trigger the Tick
    else
        --print("Event",event,...)
    end
end

function IncentiveProgramFrame:OnTick()
    if IncentiveProgramSavedLFGRoles.isUpdated then 
        SetLFGRoles(IncentiveProgramSavedLFGRoles.Leader, IncentiveProgramSavedLFGRoles.Tank, IncentiveProgramSavedLFGRoles.Healer, IncentiveProgramSavedLFGRoles.Damage)
        IncentiveProgramSavedLFGRoles.isUpdated = false
        --print("LfgRolesUpdated")
    end
    
    if IsInGroup() then -- If we are in a group, all incentives will be 0.  Don't waste time
                        -- looking for incentives, and don't trigger events to refresh the LFG interface.
        if getSetting(SETTING_HIDE_IN_PARTY) then
            self:HideFrame()
        end
        self:HideTextures() --set to 0
        return
    end
    
    IncentiveProgram:GetDungeonInfo()
    local shortageType, hasRemoved, hasAdded, hasDifference = IncentiveProgram:GetShortage()
    
    local count = IncentiveProgram:GetShortageCount()
    
    if count > 0 then
        self:ShowTextures(count, shortageType)
    else
        self:HideTextures()
    end
    
    if (getSetting(SETTING_ALERT) and hasAdded) then
        self.AlertCount = NUM_OF_ALERT_CYCLES
        self.elapsed = TICK_RATE - ALERT_RATE
    end
    
    if (self.AlertCount and self.AlertCount > 0) then
        if self.AlertCount % NUM_OF_ALERT_IMAGES == 0 then
            self:ShowTextures(count, LFG_ROLE_SHORTAGE_PLENTIFUL)
        elseif self.AlertCount % NUM_OF_ALERT_IMAGES == 1 then
            self:ShowTextures(count, LFG_ROLE_SHORTAGE_UNCOMMON)
        else
            self:ShowTextures(count, LFG_ROLE_SHORTAGE_RARE)
        end
        -- PlaySound("UI_GroupFinderReceiveApplication")
        self.AlertCount = self.AlertCount - 1
        self.elapsed = TICK_RATE - ALERT_RATE
    else 
        --don't want to over update the request while the animation is going.
        RequestLFDPlayerLockInfo() --trigger the LFG_UPDATE_RANDOM_INFO event.  This will pull in new updated shortage information without opening the frame
    end
end

----------------------------------------- OnClick Event---------------------------------------
function IncentiveProgramFrame:OnClick(button, down, anchorFrame)
    self.menu.button = button
    anchorFrame = anchorFrame or self
    self.anchorFrame = anchorFrame
    
    if button == "LeftButton" and not IncentiveProgramSavedLFGRoles.isUpdated then
        self.menu.point = "BOTTOMLEFT"
        self.menu.relativeTo = anchorFrame
        self.menu.relativePoint = "TOPRIGHT"
        ToggleDropDownMenu(1, nil, self.menu, anchorFrame, 0, 0)    
    elseif button == "RightButton" then
        self.menu.point = "BOTTOMLEFT"
        self.menu.relativeTo = anchorFrame
        self.menu.relativePoint = "TOPRIGHT"
        ToggleDropDownMenu(1, nil, self.menu, anchorFrame, 0, 0)
    end
end

function IncentiveProgramFrame:HideTextures()
    self.leftGradiant:Hide()
    self.rightGradiant:Hide()
    self.text:Hide()
    self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_NONE"])
end

function IncentiveProgramFrame:ShowTextures(count, shortageType)
    self.leftGradiant:Show()
    self.rightGradiant:Show()
    self.text:Show()
    
    self.text:SetText(count)
    
    if shortageType == LFG_ROLE_SHORTAGE_RARE then
        self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_RARE"])
    elseif shortageType == LFG_ROLE_SHORTAGE_UNCOMMON then
        self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_UNCOMMON"])
    elseif shortageType == LFG_ROLE_SHORTAGE_PLENTIFUL then
        self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_PLENTIFUL"])
    else
        self.tex:SetTexture(IncentiveProgramIcons["INCENTIVE_NONE"])
    end
end

function IncentiveProgramFrame:ShowFrame()
    self:SetAlpha(100)
    self:EnableMouse(true)
end

function IncentiveProgramFrame:HideFrame()
    self:SetAlpha(0)
    self:EnableMouse(false)
end


function IncentiveProgram:IsShortage(id)
    for i=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
        local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(id, i);
        local queuedAsLeader, queuedAsTank, queuedAsHealer, queuedAsDamage = GetLFGRoles();
        eligible = eligible and ((forTank and queuedAsTank) or (forHealer and queuedAsHealer) or (forDamage and queuedAsDamage))
        
        if (eligible and(itemCount ~= 0 or money ~= 0 or xp ~= 0)) then
            return true
        end
    end
    
    return false
end

function IncentiveProgram:IsQueued(id)
    for i=1, NUM_LE_LFG_CATEGORYS do
        for key, value in pairs(GetLFGQueuedList(i)) do
            if key == id then
                return true
            end
        end
    end 
    return false
end

function IncentiveProgram:CreateMenuItemDungeon(i, dungeonType, info)
    local id
    
    if dungeonType == LE_LFG_CATEGORY_RF then
        id = GetRFDungeonInfo(i)  
    elseif dungeonType == LE_LFG_CATEGORY_LFD then
        id = GetLFGRandomDungeonInfo(i)
    end
    
    if not getDungeonSetting(id, SETTING_IGNORE) then
        local isAvailable, isAvailableToPlayer, isUnmet = IsLFGDungeonJoinable(id)
        
        if not (isAvailable or isAvailableToPlayer or isUnmet) then
            info.disabled = true
        else
            info.hasArrow = true
        end
        
        if IncentiveProgram:IsQueued(id) then
            info.colorCode = "|cFF69CCF0"
        end
        
        if IncentiveProgram:IsShortage(id) then
            local flair = IncentiveProgramFlair[id] or ""
            info.text = flair..getDungeonSetting(id, SETTING_DUNGEON_NAME)
            info.value = id
            info.notCheckable = true
            
            return true
        end
    end
    
    return false
end

function IncentiveProgram:GetDungeonInfo()
    if self.isDungeonLoaded then return end
    
    self.dungeonIDs = {}
    self.dungeonNames = {}
    
    for i=1, GetNumRFDungeons() do
        local id, name = GetRFDungeonInfo(i)
        setDungeonSetting(id, SETTING_DUNGEON_NAME, name)
        setDungeonSetting(id, SETTING_DUNGEON_TYPE, LE_LFG_CATEGORY_RF)
        if IsLFGDungeonJoinable(id) then
            tinsert(self.dungeonIDs, id)
            tinsert(self.dungeonNames, name)
        end
    end
    
    for i=1, GetNumRandomDungeons() do
        local id,name = GetLFGRandomDungeonInfo(i)
        setDungeonSetting(id, SETTING_DUNGEON_NAME, name)
        setDungeonSetting(id, SETTING_DUNGEON_TYPE, LE_LFG_CATEGORY_LFD)
        if IsLFGDungeonJoinable(id) then
            tinsert(self.dungeonIDs, id)
            tinsert(self.dungeonNames, name)
        end
    end
    
    self.isDungeonLoaded = true
end

function IncentiveProgram:GetShortage()
    self.dungeonIDShortage = self.dungeonIDShortage or {}
    self.dungeonIDShortageTemp = self.dungeonIDShortageTemp or {}
    wipe(self.dungeonIDShortageTemp)
    
    local shortageType = 0
    
    for i=1, #self.dungeonIDs do
        for j=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
            local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(self.dungeonIDs[i], j);
            local queuedAsLeader, queuedAsTank, queuedAsHealer, queuedAsDamage = GetLFGRoles();
            eligible = eligible and ((forTank and queuedAsTank) or (forHealer and queuedAsHealer) or (forDamage and queuedAsDamage))
            if forTank then forTank = "|cFFFF0000T|r" else forTank = "t" end
            if forHealer then forHealer = "|cFF00FF00H|r" else forHealer = "h" end
            if forDamage then forDamage = "|cFF0000FFD|r" else forDamage = "d" end
            if (eligible and(itemCount ~= 0 or money ~= 0 or xp ~= 0)) then
                shortageType = j
                self.dungeonIDShortageTemp[self.dungeonIDs[i]] = j..forTank..forHealer..forDamage..itemCount..money..xp
            end
        end
    end
    
    local hasRemoved, hasAdded, hasDifference
    
    for key, value in pairs(self.dungeonIDShortage) do
        if not (self.dungeonIDShortageTemp[key]) then
            --Removed from the shortage list
            hasRemoved = true
        end
    end
    
    for key, value in pairs(self.dungeonIDShortageTemp) do
        if not (self.dungeonIDShortage[key]) then
            --Added to the shortage list
            hasAdded = true
        elseif not (value == self.dungeonIDShortage[key]) then
            --Difference in the roles eligible for shortage bonus
            hasDifference = true
        end
    end
    
    --if a difference is found, wipe the shortage list and resaveit.
    if (hasRemoved or hasAdded or hasDifference) then
        wipe(self.dungeonIDShortage)
        for key,value in pairs(self.dungeonIDShortageTemp) do
            tinsert(self.dungeonIDShortage, key, value)
        end
    end
    
    return shortageType, hasRemoved, hasAdded, hasDifference
end

function IncentiveProgram:GetShortageCount()
    self.queuedDungeons = self.queuedDungeons or {}
    wipe(self.queuedDungeons)
    
    local count = 0
    
    for i=1, NUM_LE_LFG_CATEGORYS do
        for key, value in pairs(GetLFGQueuedList(i)) do
            self.queuedDungeons[key] = value
        end
    end
    
    for key, value in pairs(self.dungeonIDShortage) do
        --if the dungeon is not ignored or already queued for don't count it.
        if not (getDungeonSetting(key, SETTING_IGNORE) or self.queuedDungeons[key]) then 
            count = count + 1
        end
    end
    
    return count
end

function IncentiveProgram:GetShortageRoles(dungeonID)
    local isTankShort, isHealerShort, isDamageShort
    
    for i=1, LFG_ROLE_NUM_SHORTAGE_TYPES do
        local eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(dungeonID, i);
        if (eligible and(itemCount ~= 0 or money ~= 0 or xp ~= 0)) then
            isTankShort = isTankShort or forTank --if eligble for one rotation, keep true through all rotations
            isHealerShort = isHealerShort or forHealer
            isDamageShort = isDamageShort or forDamage
        end
    end
    
    return isTankShort, isHealerShort, isDamageShort
end

function IncentiveProgram:CanQueueForRole(queuedState, settingState, shortageState)
    return queuedState and settingState and shortageState
end