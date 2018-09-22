local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("Misc")

function module:OnLogin()
	self:RareAlert()
	self:Expbar()
	self:Focuser()
	self:Mailbox()
	self:QuickJoin()
	self:QuestNotifier()
	self:SoloInfo()
	self:EXPTracker()
	self:WallpaperKit()
	self:FreeMountCD()
	-- Hide Bossbanner
	if MaoRUISettingDB["Misc"]["HideBanner"] then BossBanner:UnregisterAllEvents() end
	PlayerFrame:SetScale(MaoRUISettingDB["Settings"]["PlayerFrameScale"]) 
	TargetFrame:SetScale(MaoRUISettingDB["Settings"]["PlayerFrameScale"])
	----------------QuickQueue.lua----------------------
	if MaoRUISettingDB["Misc"]["QuickQueue"] then
	  local QuickQueue = CreateFrame("Frame")
	    QuickQueue:RegisterEvent("LFG_ROLE_CHECK_SHOW")
	    QuickQueue:SetScript("OnEvent", function(self, event, ...) CompleteLFGRoleCheck(true) end)
	  end
	-- Fix patch 27326
 	GuildControlUIRankSettingsFrameRosterLabel = CreateFrame("Frame", nil, M.HiddenFrame)
end
--MoreBuffs
hooksecurefunc("DefaultCompactUnitFrameSetup", function(frame)
    local name = frame:GetName().."Buff"
    for i = 4, 6 do
        local buff = _G[name..i] or CreateFrame("Button", name..i, frame, "CompactBuffTemplate")
        buff:ClearAllPoints()
        if i == 4 then
            buff:SetPoint("BOTTOMRIGHT", _G[name..i-3], "TOPRIGHT")
        else
            buff:SetPoint("BOTTOMRIGHT", _G[name..i-1], "BOTTOMLEFT")
        end
        local options = DefaultCompactUnitFrameSetupOptions
        local componentScale = min(options.height / 36, options.width / 72)
        local size = 11 * componentScale
        buff:SetSize(size, size)
    end
    CompactUnitFrame_SetMaxBuffs(frame, 6)
end)

----下方信息条
local line = CreateFrame("Frame", nil, UIParent) 
   line:SetFrameLevel(0) 
   line:SetFrameStrata("BACKGROUND")
   line:SetHeight(12)
   line:SetWidth(UIParent:GetWidth())
   line:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0) 
   line:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UI-StatusBar"}) 
   local ClassColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))] 
   line:SetBackdropColor(ClassColor.r, ClassColor.g, ClassColor.b, 0.5)
----上方信息条
local line = CreateFrame("Frame", nil, UIParent) 
   line:SetFrameLevel(0) 
   line:SetFrameStrata("BACKGROUND")
   line:SetHeight(16)
   line:SetWidth(UIParent:GetWidth())
   line:SetPoint("TOP", UIParent, "TOPLEFT", UIParent:GetWidth()/16, 0) 
   line:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\line"}) 
   --local ClassColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))] 
   --line:SetBackdropColor(ClassColor.r, ClassColor.g, ClassColor.b, 0.8)
   line:SetBackdropColor(0.2, 0.1, 0.2, 0.8)  
local line = CreateFrame("Frame", nil, UIParent) 
   line:SetFrameLevel(0) 
   line:SetFrameStrata("BACKGROUND")
   line:SetHeight(12)
   line:SetWidth(UIParent:GetWidth())
   line:SetPoint("TOP", UIParent, "TOPRIGHT", -UIParent:GetWidth()/16, 0) 
   line:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\line"}) 
   local ClassColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))] 
   line:SetBackdropColor(ClassColor.r, ClassColor.g, ClassColor.b, 0.3)

local ShiGuangLoadAdddon = CreateFrame("Frame")
ShiGuangLoadAdddon:RegisterEvent("ADDON_LOADED")
ShiGuangLoadAdddon:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_OrderHallUI" then
		OrderHallCommandBar:Hide()
		OrderHallCommandBar.Show = function() return end
		--GarrisonLandingPageTutorialBox:SetClampedToScreen(true)
		self:UnregisterEvent("ADDON_LOADED")
	end
end)

-----------------------------------------------------------------------------------AlertFrame ReStyle
local AlertFrameReStyle = CreateFrame('Frame', 'AlertFrameReStyle', UIParent)
AlertFrameReStyle:SetSize(66, 21)
AlertFrameReStyle:SetPoint('TOP', UIParent, 'TOP', 0, 0)

local function MoveGroupLootContainerReStyle(self)
	local lastIdx = nil
	for i = 1, self.maxIndex do
		if self.rollFrames[i] then self.rollFrames[i]:ClearAllPoints()
			if prevFrame then
				self.rollFrames[i]:SetPoint('TOP', self.rollFrames[i-1] or self, 'BOTTOM', 0, -8)
			else
				self.rollFrames[i]:SetPoint('CENTER', self, 'BOTTOM', 0, self.reservedSize * (i-1 + 0.5))
			end
			lastIdx = i
		end
	end
	if lastIdx then
		self:SetHeight(self.reservedSize * lastIdx)
		self:Show()
	else
		self:Hide()
	end
end

local function MoveAlertReStyle()
	AlertFrame:ClearAllPoints()
	AlertFrame:SetScale(0.85)
	AlertFrame:SetAllPoints(AlertFrameReStyle)
	GroupLootContainer:ClearAllPoints()
	GroupLootContainer:SetPoint('TOP', AlertFrameReStyle, 'BOTTOM', 0, -8)
	if GroupLootContainer:IsShown() then MoveGroupLootContainerReStyle(GroupLootContainer) end
end

local function MoveAnchorsReStyle(self, relativeAlert)
	for alertFrame in self.alertFramePool:EnumerateActive() do
		alertFrame:SetScale(0.85)
		alertFrame:ClearAllPoints()
		alertFrame:SetPoint('TOP', relativeAlert, 'BOTTOM', 0, -8);
		relativeAlert = alertFrame
	end
end

UIPARENT_MANAGED_FRAME_POSITIONS['GroupLootContainer'] = nil
hooksecurefunc('GroupLootContainer_Update', MoveGroupLootContainerReStyle)

hooksecurefunc(AlertFrame, 'UpdateAnchors', MoveAlertReStyle)
hooksecurefunc(AchievementAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 		
hooksecurefunc(CriteriaAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 			
hooksecurefunc(LootAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 				
hooksecurefunc(LootUpgradeAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 		
hooksecurefunc(MoneyWonAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 		
hooksecurefunc(HonorAwardedAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(NewRecipeLearnedAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)	

hooksecurefunc(GuildChallengeAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(DungeonCompletionAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(ScenarioAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle)	
hooksecurefunc(InvasionAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 				
hooksecurefunc(DigsiteCompleteAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(StorePurchaseAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(GarrisonBuildingAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle)
hooksecurefunc(GarrisonMissionAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle) 			
hooksecurefunc(GarrisonShipMissionAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(GarrisonRandomMissionAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(GarrisonFollowerAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle) 		
hooksecurefunc(GarrisonShipFollowerAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)	
hooksecurefunc(GarrisonTalentAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle) 	
hooksecurefunc(WorldQuestCompleteAlertSystem, 'AdjustAnchors', MoveAnchorsReStyle)
hooksecurefunc(LegendaryItemAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle) 	
hooksecurefunc(NewPetAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle)
hooksecurefunc(NewMountAlertSystem, 'AdjustAnchors',  MoveAnchorsReStyle)

--------------------------------------TalkingHeadFrame Scale------------------------
--[[ 將對話框錨點與alertframe分離
hooksecurefunc(AlertFrame, "AddAlertFrameSubSystem", function(self, alertFrameSubSystem)
	if alertFrameSubSystem.anchorFrame == TalkingHeadFrame then
		for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
			if alertFrameSubSystem == alertSubSystem then
				tremove(AlertFrame.alertFrameSubSystems, i)
				return 
			end
		end
	end
end)]]

--[[hooksecurefunc(AlertFrame,"UpdateAnchors", function()
AlertFrame:ClearAllPoints()
AlertFrame:SetPoint("TOP",UIParent,"TOP",0,-180)
AlertFrame:SetScale(0.8)
end)

local mode = 3
local HideTalkingHead = CreateFrame("Frame")
HideTalkingHead:RegisterEvent("ADDON_LOADED")
HideTalkingHead:RegisterEvent("MODIFIER_STATE_CHANGED")
HideTalkingHead:SetScript("OnEvent", function(event, addon)
	if addon == "Blizzard_TalkingHeadUI" then
		hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
			if mode == 1 then
				TalkingHeadFrame_CloseImmediately()	-- 隱藏框體與聲音
			elseif mode == 2 then
				TalkingHeadFrame:Hide()	-- 只隱藏框體
			elseif mode == 3 then
				TalkingHeadFrame:SetScale(0.65)	-- 縮放和位置
				TalkingHeadFrame:SetClampedToScreen(true)
				TalkingHeadFrame.ignoreFramePositionManager = true
				TalkingHeadFrame:ClearAllPoints()
				TalkingHeadFrame:SetPoint("TOP", UIParent, "TOP", 0, -80)
				--TalkingHeadFrame.TextFrame.Text:SetFont(GameFontNormal:GetFont(), 20, "THINOUTLINE")
				--TalkingHeadFrame.NameFrame.Name:SetFont(GameFontNormal:GetFont(), 20, "THINOUTLINE")
				-- 非隱藏時，將對話框錨點與alertframe分離
				if alertFrameSubSystem == alertSubSystem then
					tremove(AlertFrame.alertFrameSubSystems, i)
					return 
				end
			end
		end)
		self:UnregisterEvent(event)
	end
end)]]
---------------海岛冒险----------------------
UIWidgetTopCenterContainerFrame:ClearAllPoints()
UIWidgetTopCenterContainerFrame:SetPoint("TOP", 0, -21)
---------------团队---RaidFrameReSizer-------------------
CompactRaidFrameContainer:SetScale(0.85)
local n,w,h="CompactUnitFrameProfilesGeneralOptionsFrame" h,w= _G[n.."HeightSlider"], _G[n.."WidthSlider"] h:SetMinMaxValues(21,210) w:SetMinMaxValues(21,310)
---------------团队---Flat blizzard group frame-------------------
local function FBGFUpDate()
  local i,bar = 1
  repeat
    bar = _G["CompactRaidFrame"..i.."HealthBar"]
    if bar then bar:SetStatusBarTexture(0.75,0.75,0.75) end
    i=i+1
  until not bar
end
local FBGF = CreateFrame("Frame")
FBGF:SetScript("OnEvent",function(self,event,...)
  if CompactRaidFrameContainer_AddUnitFrame then
    self:UnregisterAllEvents()
    hooksecurefunc("CompactRaidFrameContainer_AddUnitFrame",FBGFUpDate)
    FBGFUpDate()
  end
end)
FBGF:RegisterEvent("PLAYER_LOGIN")
FBGF:RegisterEvent("ADDON_LOADED")
-------------ObjectiveTrackerFrame-------------
    ObjectiveTrackerFrame:SetClampedToScreen(true)
    ObjectiveTrackerFrame:SetMovable(true)
    ObjectiveTrackerFrame:SetUserPlaced(true)
    ObjectiveTrackerFrame:SetFrameStrata("BACKGROUND")
    ObjectiveTrackerFrame:ClearAllPoints()
    ObjectiveTrackerFrame.ClearAllPoints = function() end
    ObjectiveTrackerFrame:SetPoint("TOPLEFT","UIParent","TOPLEFT",26,-21)
    ObjectiveTrackerFrame.SetPoint = function() end
    ObjectiveTrackerFrame:SetHeight(666)
--[[ 缩放/移动设置 ]]
------------- 玩家框体固定 -------------
--local function ScrewYouPlayerFrame()
    PlayerFrame:ClearAllPoints() PlayerFrame:SetPoint("RIGHT",M.UIParent,"CENTER", -150, -250) PlayerFrame:SetUserPlaced(true)
-- end
--hooksecurefunc("PlayerFrame_AnimateOut", function() PlayerFrame:SetAlpha(0); ScrewYouPlayerFrame() end)
--hooksecurefunc("PlayerFrame_SequenceFinished", function() PlayerFrame:SetAlpha(1); ScrewYouPlayerFrame() end)
--hooksecurefunc("PlayerFrame_UpdateStatus", ScrewYouPlayerFrame)
------------- 目标框体固定 -------------
TargetFrame:ClearAllPoints()  TargetFrame:SetPoint("LEFT",M.UIParent,"CENTER", 150, -250) TargetFrame:SetUserPlaced(true)
------------- 目标的目标框体固定 -------------
TargetFrameToT:ClearAllPoints() TargetFrameToT:SetPoint("LEFT",TargetFrame,"BOTTOMRIGHT", -43, 21)
------------- 目标的目标框体的名字 -------------
TargetFrameToTTextureFrameName:ClearAllPoints()  TargetFrameToTTextureFrameName:SetPoint("LEFT",TargetFrameToT,"Top", -8, -43)
------------- 焦点框体 -------------
FocusFrame:SetScale(1.1)
------------- 焦点目标  -------------
--FocusFrameToT:SetPoint("BOTTOMRIGHT", -35, -13)  --焦点目标的框体位置
------------- 按shift移动焦点框体  -------------
FocusFrame:SetScript("OnMouseDown", function()	if(IsShiftKeyDown()) then	FocusFrame:ClearAllPoints()	FocusFrame:StartMoving()	end end)
FocusFrame:SetScript("OnMouseUp", function()	FocusFrame:StopMovingOrSizing() end)
-------------- BossFrames ---------------------------------------------------			
--for i = 1, MAX_BOSS_FRAMES do
 --local bossFrame = _G["Boss"..i.."TargetFrame"]
   --bossFrame:SetScale(0.8)
   --bossFrame.nameBackground:Hide()
 --local bossHealthBarFrame = _G["Boss"..i.."TargetFrameHealthBar"]
   --bossHealthBarFrame:ClearAllPoints() bossHealthBarFrame:SetHeight(29) bossHealthBarFrame:SetPoint("TOPLEFT", 5, -24)
--end
Boss1TargetFrame:ClearAllPoints()  Boss1TargetFrame:SetPoint("TOPRIGHT", Minimap,"BOTTOMRIGHT", 0, -20) Boss1TargetFrame.SetPoint=function()end
----------------------------------------------------- PARTYFRAMES ---------------------------------------------------
for i = 1, MAX_PARTY_MEMBERS do
    _G["PartyMemberFrame"..i]:SetScale(0.9)
end
PartyMemberFrame1:SetPoint("TOPLEFT", 310, -160)  --队伍的框体位置 ("TOPLEFT", 10, -192)
PartyMemberFrame1:SetUserPlaced(true)
PartyMemberFrame1:SetScript("OnMouseDown", function() --按shift移动小队
		if (IsShiftKeyDown()) then PartyMemberFrame1:ClearAllPoints() PartyMemberFrame1:StartMoving() end
end)
PartyMemberFrame1:SetScript("OnMouseUp", function()
		PartyMemberFrame1:StopMovingOrSizing()
end)
--[[--------------公会等级显示不全Fix------------------------by nj55top
local _VIEW
local function setView(view) _VIEW = view end

local function updateGuild()
	_VIEW = _VIEW or GetCVar("guildRosterView")
	local buttons = GuildRosterContainer.buttons
	for i, button in ipairs(buttons) do
			if _VIEW == "tradeskill" or _VIEW == "guildStatus" then
				button.string1:SetFont(STANDARD_TEXT_FONT, 15)
			else
				button.string1:SetFont(STANDARD_TEXT_FONT, 11)
			end
	end
end
local loaded = false
hooksecurefunc("GuildFrame_LoadUI", function()
	if loaded then
		return
	else
		loaded = true
		hooksecurefunc("GuildRoster_SetView", setView)
		hooksecurefunc("GuildRoster_Update", updateGuild)
		hooksecurefunc(GuildRosterContainer, "update", updateGuild)
	end
end)]]
----------------EasyDelete## Author: Lerith----------------------
hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"],"OnShow",function(EasyDelete) EasyDelete.editBox:SetText(DELETE_ITEM_CONFIRM_STRING) end)
----------------Item Selling## Author: Spencer Sohn----------------------
local ItemSelling = StaticPopupDialogs["CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"] 
ItemSelling.OnAccept=nil 
ItemSelling.OnShow=function() StaticPopup_Hide("CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"); SellCursorItem(); end
----------------ArenaLeaveConfirmer----------------------
hooksecurefunc(StaticPopupDialogs["CONFIRM_LEAVE_BATTLEFIELD"],"OnShow",function(self)
	if IsActiveBattlefieldArena() or GetBattlefieldWinner() then self.button1:Click() end
end)
----------------EventBossAutoSelect----------------------
LFDParentFrame:HookScript("OnShow",function()
  for i=1,GetNumRandomDungeons() do
   local id,name=GetLFGRandomDungeonInfo(i)
   if(select(15,GetLFGDungeonInfo(id)) and not GetLFGDungeonRewards(id)) then LFDQueueFrame_SetType(id) end
  end
 end)
--------------------------------------Hide the left/right end cap------------------------
MainMenuBarArtFrame.LeftEndCap:Hide()  MainMenuBarArtFrame.RightEndCap:Hide()


FACTION_BAR_COLORS = {
	[1] = { r= .54, g= 0,   b= 0   }, -- hated      {r = 0.63, g = 0, b = 0},
	[2] = { r= 1,   g= .10, b= .1  }, -- hostile    {r = 0.63, g = 0, b = 0},
	[3] = { r= 1,   g= .55, b= 0   }, -- unfriendly {r = 0.63, g = 0, b = 0},
	[4] = { r= .87, g= .87, b= .87 }, -- neutral    {r = 0.82, g = 0.67, b = 0},
	[5] = { r= 1,   g= 1,   b= 0   }, -- friendly   {r = 0.32, g = 0.67, b = 0},
	[6] = { r= .1,  g= .9,  b= .1  }, -- honored    {r = 0.32, g = 0.67, b = 0},
	[7] = { r= .25, g= .41, b= .88 }, -- revered    {r = 0.32, g = 0.67, b = 0},
	[8] = { r= .6,  g= .2,  b= .8  }, -- exalted    {r = 0, g = 0.75, b = 0.44},
	[9] = { r= .4,  g= 0,   b= .6  }, -- past exalted
};

GOLD_AMOUNT = "|c00ffd700%d●|r";--GOLD_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0\124t"
SILVER_AMOUNT = "|c00c7c7cf%d●|r";--SILVER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0\124t"
COPPER_AMOUNT = "|c00eda55f%d●|r";--COPPER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0\124t"
ENTERING_COMBAT = "";
LEAVING_COMBAT = "";

CHAT_WHISPER_INFORM_GET = "<<%s:";
CHAT_WHISPER_GET = ">>%s:";
CHAT_BN_WHISPER_INFORM_GET = "<<%s:";
CHAT_BN_WHISPER_GET = ">>%s:";
CHAT_SAY_GET = "%s:";
CHAT_YELL_GET = "%s:"  ;
CHAT_FLAG_AFK = "[AFK]";
CHAT_FLAG_DND = "[Busy]";
CHAT_FLAG_GM = "[GM]";
  
ITEM_CREATED_BY="|cFF00DDFF<Thanks For Using 2 UI>|r";
CHAT_YOU_CHANGED_NOTICE = "=|Hchannel:%d|h[%s]|h";
CHAT_YOU_CHANGED_NOTICE_BN = "=|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE = "+|Hchannel:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE_BN = "+|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE = "-|Hchannel:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE_BN = "-|Hchannel:CHANNEL:%d|h[%s]|h";

--[[Self
YOU_LOOT_MONEY = "["..SHIGUANG_Loot.."]: %s";

CURRENCY_GAINED = "["..BONUS_ROLL_REWARD_CURRENCY.."]: %s";
CURRENCY_GAINED_MULTIPLE = "["..BONUS_ROLL_REWARD_CURRENCY.."]: %s x%d";
CURRENCY_GAINED_MULTIPLE_BONUS = "["..BONUS_ROLL_REWARD_CURRENCY.."]: %s x%d ("..SCENARIO_BONUS_OBJECTIVES..")"; 
LOOT_ITEM_BONUS_ROLL_SELF = "["..BONUS_REWARDS.."]: %s  ("..SCENARIO_BONUS_OBJECTIVES..")";
LOOT_ITEM_BONUS_ROLL_SELF_MULTIPLE = "["..BONUS_REWARDS.."]: %sx%d ("..SCENARIO_BONUS_OBJECTIVES..")";
LOOT_ITEM_CREATED_SELF = "["..CREATE_PROFESSION.."]: %s";
LOOT_ITEM_CREATED_SELF_MULTIPLE = "["..CREATE_PROFESSION.."]: %sx%d";
LOOT_ITEM_PUSHED_SELF = "["..SHIGUANG_Loot.."]: %s";
LOOT_ITEM_PUSHED_SELF_MULTIPLE = "["..SHIGUANG_Loot.."]: %sx%d";
LOOT_ITEM_REFUND = "["..SHIGUANG_Refund.."]: %s";
LOOT_ITEM_REFUND_MULTIPLE = "["..SHIGUANG_Refund.."]: %sx%d";
LOOT_ITEM_SELF = "["..SHIGUANG_Loot.."]: %s";
LOOT_ITEM_SELF_MULTIPLE = "["..SHIGUANG_Loot.."]: %sx%d";

--Other players
LOOT_ITEM = "["..SHIGUANG_Gets.."]: %s %s";
LOOT_ITEM_BONUS_ROLL = "["..SHIGUANG_Gets.."]: %s %s ("..SCENARIO_BONUS_OBJECTIVES..")";
LOOT_ITEM_BONUS_ROLL_MULTIPLE = "["..SHIGUANG_Gets.."]: %s %sx%d";
LOOT_ITEM_MULTIPLE = "["..SHIGUANG_Gets.."]: %s %sx%d";
LOOT_ITEM_PUSHED = "["..SHIGUANG_Gets.."]: %s %s";
LOOT_ITEM_PUSHED_MULTIPLE = "["..SHIGUANG_Gets.."]: %s %sx%d";
LOOT_ITEM_WHILE_PLAYER_INELIGIBLE = "["..SHIGUANG_Gets.."]: %s |TInterface\\Common\\Icon-NoLoot:13:13:0:0|t%s";
]]