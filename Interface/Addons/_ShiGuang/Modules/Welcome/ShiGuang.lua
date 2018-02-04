local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Misc")

function module:OnLogin()
	self:SoloInfo()
	self:RareAlert()
	self:Focuser()
	self:Mailbox()
	self:WallpaperKit()
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

--------------------------------------TalkingHeadFrame Scale------------------------
local HideTalkingHead = CreateFrame("Frame")
function HideTalkingHead:OnEvent(event, addon)
	if addon == "Blizzard_TalkingHeadUI" then
		hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
			--TalkingHeadFrame:Hide()
			TalkingHeadFrame:ClearAllPoints()
			TalkingHeadFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, -210)
			TalkingHeadFrame:SetScale(0.65)
		end)
		self:UnregisterEvent(event)
	end
end
-- 將對話框錨點與alertframe分離
hooksecurefunc(AlertFrame, "AddAlertFrameSubSystem", function(self, alertFrameSubSystem)
	if alertFrameSubSystem.anchorFrame == TalkingHeadFrame then
		for i, alertSubSystem in pairs(AlertFrame.alertFrameSubSystems) do
			if alertFrameSubSystem == alertSubSystem then
				tremove(AlertFrame.alertFrameSubSystems, i)
				return 
			end
		end
	end
end)
HideTalkingHead:RegisterEvent("ADDON_LOADED")
HideTalkingHead:RegisterEvent("MODIFIER_STATE_CHANGED")
HideTalkingHead:SetScript("OnEvent", HideTalkingHead.OnEvent)
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
-------------ZoneAbilityFrame-------------
ZoneAbilityFrame:SetScale(0.6) 
--ZoneAbilityFrame:ClearAllPoints()
--ZoneAbilityFrame:SetPoint("RIGHT",PlayerFrame,"LEFT",-100,0)
--[[ 缩放/移动设置 ]]
------------- 玩家框体固定 -------------
--local function ScrewYouPlayerFrame()
    PlayerFrame:ClearAllPoints() PlayerFrame:SetPoint("RIGHT",M.UIParent,"CENTER", -180, -250) PlayerFrame:SetUserPlaced(true)
-- end
--hooksecurefunc("PlayerFrame_AnimateOut", function() PlayerFrame:SetAlpha(0); ScrewYouPlayerFrame() end)
--hooksecurefunc("PlayerFrame_SequenceFinished", function() PlayerFrame:SetAlpha(1); ScrewYouPlayerFrame() end)
--hooksecurefunc("PlayerFrame_UpdateStatus", ScrewYouPlayerFrame)
------------- 目标框体固定 -------------
TargetFrame:ClearAllPoints()  TargetFrame:SetPoint("LEFT",M.UIParent,"CENTER", 180, -250) TargetFrame:SetUserPlaced(true)
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
for i = 1, MAX_BOSS_FRAMES do
 local bossFrame = _G["Boss"..i.."TargetFrame"]
   bossFrame:SetScale(0.8)
   bossFrame.nameBackground:Hide()
 local bossHealthBarFrame = _G["Boss"..i.."TargetFrameHealthBar"]
   bossHealthBarFrame:ClearAllPoints() bossHealthBarFrame:SetHeight(29) bossHealthBarFrame:SetPoint("TOPLEFT", 5, -24)
end
Boss1TargetFrame:ClearAllPoints()  Boss1TargetFrame:SetPoint("TOPRIGHT", Minimap,"BOTTOMRIGHT", -21, -80) Boss1TargetFrame.SetPoint=function()end
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
----------------公会等级显示不全Fix------------------------by nj55top
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
end)
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
   local isHoliday=select(15,GetLFGDungeonInfo(id))
   if(isHoliday and not GetLFGDungeonRewards(id)) then LFDQueueFrame_SetType(id) end
  end
 end)
--------------------------------------Hide the left/right end cap------------------------
MainMenuBarLeftEndCap:Hide()  MainMenuBarRightEndCap:Hide()
--------------------------Class recoure Place ---by y368413 ----
local function yInvertTexture(Texture)
	local Left, Top, _, Bottom, Right = Texture:GetTexCoord()
	Texture:SetTexCoord(Left, Right, Bottom, Top) -- Swapping parameters 3 & 4 (top & bottom)
end
local function yInvertAllTextures(Frame)
	for _, Region in pairs({ Frame:GetRegions() }) do
		if Region:IsObjectType("Texture") then yInvertTexture(Region) end
	end
end
local function ClassRecourePlace()
if select(2, UnitClass('player')) == "DRUID" or select(2, UnitClass('player')) == "ROGUE" then
ComboPointPlayerFrame:SetAlpha(1)
ComboPointPlayerFrame.Background:Hide()
ComboPointPlayerFrame:ClearAllPoints() 
ComboPointPlayerFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 8, -143) 
ComboPointPlayerFrame.SetPoint = function() end
ComboPointPlayerFrame:SetScale(1.5)
elseif select(2, UnitClass('player')) == "WARLOCK" then
--yInvertAllTextures(WarlockPowerFrame)
WarlockPowerFrame:SetAlpha(1)
WarlockPowerFrame:ClearAllPoints()
WarlockPowerFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -180)
WarlockPowerFrame.SetPoint = function() end
WarlockPowerFrame:SetScale(1.2)
--WarlockPowerFrame:SetAlpha(1)
elseif select(2, UnitClass('player')) == "PALADIN" then
PaladinPowerBarFrame:SetAlpha(1)
PaladinPowerBarFrameBG:Hide()
PaladinPowerBarFrameGlowBG:Hide()
PaladinPowerBarFrame:ClearAllPoints()
PaladinPowerBarFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -143) 
PaladinPowerBarFrame.SetPoint = function() end
PaladinPowerBarFrame:SetScale(1.5)
elseif select(2, UnitClass('player')) == "DEATHKNIGHT"  and GetSpecialization() ~= 1 then
RuneFrame:SetAlpha(1)
RuneFrame:ClearAllPoints()
RuneFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -143) 
RuneFrame.SetPoint = function() end
RuneFrame:SetScale(1.5)
elseif select(2, UnitClass('player')) == "MONK" then
MonkHarmonyBarFrame:SetAlpha(1)
yInvertAllTextures(MonkHarmonyBarFrame)
MonkHarmonyBarFrame:ClearAllPoints()
MonkHarmonyBarFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -195) 
MonkHarmonyBarFrame.SetPoint = function() end
MonkHarmonyBarFrame:SetScale(1.2)
MonkStaggerBar:SetAlpha(1)
MonkStaggerBar:ClearAllPoints()
MonkStaggerBar:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -143) 
MonkStaggerBar.SetPoint = function() end
MonkStaggerBar:SetScale(1.5)
elseif select(2, UnitClass('player')) == "MAGE" then
MageArcaneChargesFrame:SetAlpha(1)
MageArcaneChargesFrame.Background:Hide()
MageArcaneChargesFrame:ClearAllPoints()
MageArcaneChargesFrame:SetPoint('BOTTOM', M.UIParent, "CENTER", 0, -160)
MageArcaneChargesFrame.SetPoint = function() end 
MageArcaneChargesFrame:SetScale(1.5)
end
end

MaoRUI:EventFrame("PLAYER_ENTERING_WORLD"):SetScript("OnEvent", function()
if MaoRUISettingDB["Misc"]["ClassRecourePlace"] then ClassRecourePlace() end
end)