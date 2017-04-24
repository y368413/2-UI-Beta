local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:GetModule("Misc")
---------------------------------------------------------------------PlayerFrame
--[[--------------------------------------头像渐隐---------------------------------------
hooksecurefunc("PlayerFrame_UpdateStatus", function()
    local _, instanceType = IsInInstance()
    if (PlayerFrame.inCombat or PlayerFrame.onHateList or instanceType == "arena") then
        PlayerFrame:SetAlpha(1)
    else
        PlayerFrame:SetAlpha(0.43)
    end
end)]]
--[[----------------------------------------Class icon---------------------------------------
hooksecurefunc("UnitFramePortrait_Update",function(self) 
        if self.portrait then 
                if UnitIsPlayer(self.unit) then                 
                        local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))] 
                        if t then 
                                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles") 
                                self.portrait:SetTexCoord(unpack(t)) 
                        end 
                else 
                        self.portrait:SetTexCoord(0,1,0,1) 
                end 
        end 
end)]] 
-----------------------------------------	    BloodW--万位显示数值   -----------------------------------------
local function HealthBarText(statusFrame, textString, value, valueMin, valueMax)    --if string.find(textString:GetName(), "Health") or string.find then
      if valueMax ~= 0 then 
         local percent = tostring(math.ceil((value / valueMax) * 100)) 
         value = HealthBarText_CapDisplayOfNumericValue(value) 
         valueMax = HealthBarText_CapDisplayOfNumericValue(valueMax)
         if valueMax == value then 
         textString:SetText(valueMax)
         else
         textString:SetText(value.." / "..valueMax)  --textString:SetText(percent.."% "..valueMax.." ")   --百分比/血量 
         end 
      end 
end 
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", HealthBarText) 

function HealthBarText_CapDisplayOfNumericValue(value) 
  local strLen = strlen(value); 
  local retString = value; 
    if ( strLen > 11 ) then 
      retString = string.sub(value, 1, -12).."."..string.sub(value, -11, -11)..SECOND_NUMBER_CAP; 
    elseif ( strLen > 8 ) then 
      retString = string.sub(value, 1, -9).."."..string.sub(value, -8, -8).."亿"; 
    elseif ( strLen > 7 ) then 
      retString = string.sub(value, 1, -8).."."..string.sub(value, -7, -7).."千万"; 
    elseif ( strLen > 4 ) then 
      retString = string.sub(value, 1, -5).."."..string.sub(value, -4, -4).."万"; --FIRST_NUMBER_CAP
    end 
  return retString; 
end

-----------------------------------------	  血条按职业着色    -----------------------------------------
--Frame
local function textUpdate(bar)
	local value = bar:GetValue()
	local _, max = bar:GetMinMaxValues()
	if bar.pctText then
		bar.pctText:SetText(value==0 and "" or tostring(math.ceil((value / max) * 100)))
		--bar.pctText:SetText(value==0 and "" or tostring(math.ceil((value / max) * 100)) .. "%")
		if GetCVarBool("statusTextPercentage") and ( bar.unit == PlayerFrame.unit or bar.unit == "target" or bar.unit == "focus" ) then
			bar.pctText:Hide()
		elseif value == max then
		  bar.pctText:Hide()
		else
			bar.pctText:Show()
		end
	end
	if ValueandPct and bar.TextString and bar.TextString:IsShown() and GetCVarBool("statusTextPercentage") then
		bar.TextString:SetText(value==0 and "" or TextStatusBar_CapDisplayOfNumericValue(value).." ("..tostring(math.ceil((value / max) * 100)).."%)")
	end
end

local function colorHPBar(bar, unit)
	if bar and not bar.lockValues and unit == bar.unit then
		local r, g, b
		local min, max = bar:GetMinMaxValues()
		local value = bar:GetValue()
		if max > min then
			value = (value - min) / (max - min)
		else
			value = 0
		end
		if value > 0.5 then
			r, g, b = 2*(1-value), 1, 0
		else
			r, g, b = 1, 2*value, 0
		end
		if not bar.disconnected and not bar.lockColor then
			if UnitIsPlayer(unit) and UnitClass(unit) then  --血条按职业着色
				local color = RAID_CLASS_COLORS[select(2, UnitClass(unit))]
				bar:SetStatusBarColor(color.r, color.g, color.b)
			else
				bar:SetStatusBarColor(r, g, b)
			end
		end
		if bar.pctText then	bar.pctText:SetTextColor(r, g, b) end
	end
end

hooksecurefunc("TextStatusBar_UpdateTextString", textUpdate)
hooksecurefunc("UnitFrameHealthBar_Update", colorHPBar)
hooksecurefunc("HealthBar_OnValueChanged", function(self) colorHPBar(self, self.unit) end)

---------------------------------------	  血条百分比    -----------------------------------------
function CreateBarPctText(frame, ap, rp, x, y, font, manabar)
	local bar = ( manabar and frame.manabar ) or (not manabar and frame.healthbar )
	if bar then
		if bar.pctText then
			bar.pctText:ClearAllPoints()
			bar.pctText:SetPoint(ap, bar, rp, x, y)
		else
			font = font or "NumberFontNormal"
			bar.pctText = frame:CreateFontString(nil, "OVERLAY", font)
			bar.pctText:SetPoint(ap, bar, rp, x, y)
			bar.pctText:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\Pixel.TTF",60,"OUTLINE")
			bar.pctText:SetShadowColor(0, 0, 0)
      bar.pctText:SetShadowOffset(1, -1)
		end
	end
end			
local function getClassColor(unit)
	return UnitIsPlayer(unit) and RAID_CLASS_COLORS[select(2, UnitClass(unit))] or NORMAL_FONT_COLOR, UnitIsPlayer(unit)
end
function SetNameColor(frame)
	if frame:IsShown() and frame.name then
		local color = getClassColor(frame.unit)
		frame.name:SetTextColor(color.r, color.g, color.b)  --(1,1,0)
		if UnitIsEnemy("player", "target") then 
		   frame.name:SetTextColor(1,0,0) 
		--elseif UnitIsFriend("player", "target") then 
		   --frame.name:SetTextColor(0,1,0)  	 		
		end
	end
end
CreateBarPctText(PlayerFrame, "RIGHT", "LEFT", -92, -8, "NumberFontNormalLarge")
CreateBarPctText(TargetFrame, "LEFT", "RIGHT", 92, -6, "NumberFontNormalLarge")
CreateBarPctText(FocusFrame, "RIGHT", "LEFT", -3, -8, "NumberFontNormalLarge")
--CreateBarPctText(TargetFrameToT, "BOTTOMLEFT", "TOPRIGHT", 0, 5)
CreateBarPctText(FocusFrameToT, "BOTTOMLEFT", "TOP", 24, 10)
for i = 1, MAX_BOSS_FRAMES do
	local bossFrame = _G["Boss"..i.."TargetFrame"]
	--CreateBarPctText(bossFrame, "BOTTOMLEFT", "TOPRIGHT", 17, 19, "NumberFontNormalLarge")
	CreateBarPctText(bossFrame, "LEFT", "RIGHT", 8, 30, "NumberFontNormal")
end
TargetFrame:HookScript("OnUpdate", SetNameColor)
--TargetFrameToT:HookScript("OnUpdate", SetNameColor)
FocusFrameToT:HookScript("OnUpdate", SetNameColor)
--SetNameColor(PlayerFrame)


-----------------------------------------	     隐藏头像动态伤害      -----------------------------------------
local p=PlayerHitIndicator;p.Show=p.Hide;p:Hide() 
local p=PetHitIndicator;p.Show=p.Hide;p:Hide() 

-----------------------------------------	     显示BUFF是谁加的      -----------------------------------------
local cc = {}
local CUSTOM_CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
do
	for class, c in pairs(CUSTOM_CLASS_COLORS) do
		cc[class] = format("|cff%02x%02x%02x", c.r*255, c.g*255, c.b*255)
	end
end
local function SetCaster(self, unit, index, filter)
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, filter)
	if unitCaster then
		local uname, urealm = UnitName(unitCaster)
		local _, uclass = UnitClass(unitCaster)
		if urealm then uname = uname.."-"..urealm end
		self:AddLine("".. (cc[uclass] or "|cffffffff") .. uname .. "|r (" .. unitCaster .. ")")
		self:Show()
	end
end
hooksecurefunc(GameTooltip, 'SetUnitAura', SetCaster)

--[[hooksecurefunc(GameTooltip, "SetUnitAura", function(self, unit, index, filter)
	local _, _, _, _, _, _, _, caster = UnitAura(unit, index, filter)
	local name = caster and UnitName(caster)
	if name then
		GameTooltip:AddDoubleLine("Cast by:", name, nil, nil, nil, 1, 1, 1)
		GameTooltip:Show()
	end
end)]]

------------------------------------------------------------------------------------------------------------------	TargetFrame
--目标种族、职业和其它信息
	TargetFrame:CreateFontString("TargetFrameType", "OVERLAY", "GameFontNormalSmall")
	TargetFrameType:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -43, -8)
	TargetFrameType:SetTextColor(1, 0.75, 0)
	TargetFrame:CreateFontString("TargetFrameRace", "OVERLAY", "GameFontNormalSmall")
	TargetFrameRace:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", -43, 3)   --种族
	TargetFrameRace:SetTextColor(1, 0.75, 0)

hooksecurefunc("TargetFrame_Update", function(self)
  if not UnitExists(self.unit) then return end
		local typeText = ""
		local raceText = ""
		local color = RAID_CLASS_COLORS[UnitClass("target")] or NORMAL_FONT_COLOR
		local tcolor
	if UnitIsPlayer(unit) then
		if UnitFactionGroup(self.unit) == UnitFactionGroup("player") then	----如果目标是友方阵营
			tcolor = GREEN_FONT_COLOR		----血条绿色
		else
			tcolor = RED_FONT_COLOR			----中立的是黄色
		end
	else
		if UnitCanAttack(self.unit, "player") then	----如果目标为敌对阵营
			tcolor = UnitPlayerControlled(self.unit) and ORANGE_FONT_COLOR or YELLOW_FONT_COLOR
		else
			tcolor = HIGHLIGHT_FONT_COLOR
		end
	end
    self.nameBackground:SetAlpha(UnitIsPlayer(unit) and 0.2 or 1.0)
		if UnitIsPlayer("target") then
			raceText = UnitRace("target")
			TargetFrameRace:SetTextColor(color.r,color.g,color.b)
		else
			typeText = UnitCreatureType("target") or ""
			if typeText == "非战斗宠物" or typeText == "未指定" or typeText == "小动物" then
				typeText = ""
			elseif typeText ~= "" then
				typeText = string.sub(typeText, 1, 16)
			end
		end
		TargetFrameType:SetText(typeText)
		TargetFrameRace:SetText(raceText)
	end)

-----------------------------------------	  目标及焦点战斗状态指示   -----------------------------------------
local TargetCombat = CreateFrame("Frame", UIParent) 
TargetCombat:SetParent(TargetFrame)
TargetCombat.target = TargetCombat:CreateTexture() 
TargetCombat.target:SetTexture("Interface\\CHARACTERFRAME\\UI-StateIcon.blp") 
TargetCombat.target:SetTexCoord(0.5,1,0,0.49); 
TargetCombat.target:SetAllPoints() 
TargetCombat:SetSize(21,21)
TargetCombat:SetPoint("CENTER", TargetFrame, "LEFT", 6, -6)-----目标位置 
TargetCombat:Hide()
local function FrameOnUpdate(self) if UnitAffectingCombat("target") then self:Show() else self:Hide() end end 
local TargetCombatUpdate = CreateFrame("Frame") 
TargetCombatUpdate:SetScript("OnUpdate", function(self) FrameOnUpdate(TargetCombat) end) 
function module:Focuser()
	if not MaoRUISettingDB["Misc"]["Focuser"] then return end
local modifier = "shift" -- shift, alt or ctrl
local mouseButton = "1" -- 1 = left, 2 = right, 3 = middle, 4 and 5 = thumb buttons if there are any
local function SetFocusHotkey(frame)
	frame:SetAttribute(modifier.."-type"..mouseButton,"focus")
end
local function CreateFrame_Hook(type, name, parent, template)
	if template == "SecureUnitButtonTemplate" then SetFocusHotkey(_G[name]) end
end
hooksecurefunc("CreateFrame", CreateFrame_Hook)
-- Keybinding override so that models can be shift/alt/ctrl+clicked
local Keybindings = CreateFrame("CheckButton", "FocuserButton", UIParent, "SecureActionButtonTemplate")
Keybindings:SetAttribute("type1","macro")
Keybindings:SetAttribute("macrotext","/focus mouseover")
SetOverrideBindingClick(FocuserButton,true,modifier.."-BUTTON"..mouseButton,"FocuserButton")
-- Set the keybindings on the default unit frames since we won't get any CreateFrame notification about them
local duf = {
	PlayerFrame,
	PetFrame,
	PartyMemberFrame1,
	PartyMemberFrame2,
	PartyMemberFrame3,
	PartyMemberFrame4,
	PartyMemberFrame1PetFrame,
	PartyMemberFrame2PetFrame,
	PartyMemberFrame3PetFrame,
	PartyMemberFrame4PetFrame,
	TargetFrame,
	TargetofTargetFrame,
}
for i,frame in pairs(duf) do SetFocusHotkey(frame) end
end

--------  TargetClassButton by 狂飙@cwdg(networm@qq.com) 20120119     DIY by y368413    ----
--左键查看目标装备、右键与目标交易、中键密语、鼠标按键4跟随、鼠标按键5比较成就、到可观察装备距离时职业图标由灰白变彩色。
local targeticon = CreateFrame("Button", "TargetClass", TargetFrame)
targeticon:Hide()
targeticon:SetWidth(28)
targeticon:SetHeight(28)
targeticon:SetPoint("TOP", TargetFrame, "TOPRIGHT", -100, -8)
targeticon:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
local bg = targeticon:CreateTexture("TargetClassBackground", "BACKGROUND")
bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
bg:SetWidth(28)
bg:SetHeight(28)
bg:SetPoint("CENTER")
bg:SetVertexColor(0, 0, 0, 0.7)
local icon = targeticon:CreateTexture("TargetClassIcon", "ARTWORK")
icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
icon:SetWidth(21)
icon:SetHeight(21)
icon:SetPoint("CENTER")
RaiseFrameLevel(targeticon)
targeticon:SetScript("OnUpdate", function(self)
	if (not UnitCanAttack("player","target") and UnitIsPlayer("target") and CheckInteractDistance("target",1)) then
		targeticon:Enable()
		SetDesaturation(TargetClassIcon, false) 	--	TargetClassIcon:SetDesaturated(false)
	else
		targeticon:Disable()
		SetDesaturation(TargetClassIcon, true)	--	TargetClassIcon:SetDesaturated(true)
	end
end)
targeticon:SetScript("OnMouseDown", function(self, button)
	if (not UnitCanAttack("player","target") and UnitIsPlayer("target")) then
		if button == "LeftButton" then
			if CheckInteractDistance("target",1) then InspectUnit("target") end
		elseif button == "RightButton" then
			if CheckInteractDistance("target",2) then InitiateTrade("target") end
		elseif button == "MiddleButton" then  --	StartDuel("target")
				local server = nil;
				local name, server = UnitName("target");
				local fullname = name;			
				if server then  --if ( server and (not "target" or not UnitIsSameServer("player", "target")) ) then
					fullname = name.."-"..server;
				end
				ChatFrame_SendTell(fullname)
		elseif button == "Button4" then
			if CheckInteractDistance("target",4) then FollowUnit(fullname, 1); end
		else
			if CheckInteractDistance("target",1) then InspectAchievements("target") end
		end
	end
end)
hooksecurefunc("TargetFrame_Update", function()
	if UnitIsPlayer("target") then
		local coord = CLASS_ICON_TCOORDS[select(2, UnitClass("target"))]
		TargetClassIcon:SetTexCoord(unpack(coord))
		targeticon:Show()
	else
		targeticon:Hide()
	end
end)

-----------------------------------------	     玩家/焦点/目标框体血条加粗      -----------------------------------------
local function UpdatePlayerFrame()
	if not UnitHasVehicleUI("player") then
		PlayerName:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", -100000, 12) 
 		--PlayerName:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE") 
		PlayerFrameHealthBar:ClearAllPoints()
		PlayerFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		PlayerStatusTexture:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UFs\\UI-Player-Status");
		PlayerFrameHealthBar:SetHeight(28)
		------百分比 数值都显示 的模式下--------------------
		PlayerFrameHealthBarTextLeft:ClearAllPoints()
		PlayerFrameHealthBarTextLeft:SetPoint("left", PlayerFrameHealthBar, "left", 6, -3)
		PlayerFrameHealthBarTextRight:ClearAllPoints()
		PlayerFrameHealthBarTextRight:SetPoint("Right", PlayerFrameHealthBar, "Right", -2, -3)
    -----------------------------------
		PlayerFrameHealthBar:SetPoint("CENTER", PlayerFrameManaBar, "CENTER", 0, 22) 
    PlayerFrameHealthBarText:ClearAllPoints()
    PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 1, -3)	
	end
end
hooksecurefunc("PlayerFrame_UpdateArt", UpdatePlayerFrame)
PlayerFrame:HookScript("OnEvent", function(self, event)
   if event=="PLAYER_ENTERING_WORLD" then UpdatePlayerFrame() end
end)
do
		--宠物
		PetFrameManaBarText:SetTextColor(0, 1, 1)
		PetFrameHealthBarText:SetPoint("BOTTOMRIGHT", PetFrame, "LEFT", 3,-6)
		PetFrameManaBarText:SetPoint("TOPRIGHT", PetFrame, "LEFT", 3, -6)
		 for i = 1, 4 do
		  local PFrame = "PartyMemberFrame"..i
		  _G[PFrame.."ManaBarText"]:SetTextColor(0, 1, 1)
		  _G[PFrame.."ManaBarText"]:SetPoint("LEFT", PFrame.."ManaBar", "LEFT", 3, 0)
		  _G[PFrame.."HealthBarText"]:SetPoint("BOTTOMLEFT", PFrame.."ManaBarText", "TOPLEFT", 0, -2)
		 end
		--焦点
		FocusFrameNameBackground:SetTexture()
		FocusFrame.Background:SetPoint("TOPLEFT",7,-22);
		FocusFrameTextureFrameName:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 25)
		FocusFrameHealthBar:ClearAllPoints()
		FocusFrameHealthBar:SetHeight(28)
		FocusFrameHealthBar:SetPoint("CENTER", FocusFrameManaBar, "CENTER", 0, 22) 
		--FocusFrameTextureFrameHealthBarText:ClearAllPoints()
		--FocusFrameTextureFrameHealthBarText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, -3)
		--目标
		TargetFrame.Background:SetPoint("TOPLEFT",6,-22);
		TargetFrame.deadText:ClearAllPoints()
		TargetFrame.deadText:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -21, -12)		
		TargetFrame.threatNumericIndicator:ClearAllPoints()
		TargetFrame.threatNumericIndicator:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -66, -3)	
		TargetFrameHealthBar:ClearAllPoints()
		TargetFrameHealthBar:SetHeight(28)
		TargetFrameHealthBar:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 22) 		
		TargetFrameTextureFrameName:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 22)
		TargetFrameTextureFrameName:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")		
		TargetFrameTextureFrameHealthBarText:ClearAllPoints()
		TargetFrameTextureFrameHealthBarText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, -2)
		TargetFrameTextureFrameHealthBarTextLeft:SetPoint("left", TargetFrameHealthBar, "left", 2, -2) 
		TargetFrameTextureFrameHealthBarTextRight:SetPoint("Right", TargetFrameHealthBar, "Right", -4, -2)
    TargetFrameNameBackground:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex")
		TargetFrameNameBackground:ClearAllPoints()
		TargetFrameNameBackground:SetHeight(12)
		TargetFrameNameBackground:SetWidth(12)
		TargetFrameNameBackground:SetPoint("BOTTOMLEFT", TargetFrameHealthBar, "TOPLEFT", 2, 2)
end
function UpdateTargetFrameTexture()
	--TargetFrame.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
	if ( UnitClassification("target") == "minus" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Minus");
	elseif ( UnitClassification("target") == "worldboss" or UnitClassification("target") == "elite" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Elite");
	elseif ( UnitClassification("target") == "rareelite" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare-Elite");
	elseif ( UnitClassification("target") == "rare" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare");
	else
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
	end
end
hooksecurefunc("TargetFrame_CheckClassification", UpdateTargetFrameTexture)

-------------------------------------------------------------------------------------------------------------------------------------	PartyFrame
--------------------------------------- 隊友框架: 隱藏HP/MP  Hide Party HP/MP -------------------------------------
hooksecurefunc("TextStatusBar_UpdateTextString", function(textStatusBar)
	local name = textStatusBar:GetName()
    if (name == "PartyMemberFrame1HealthBar"
        or name == "PartyMemberFrame2HealthBar"
        or name == "PartyMemberFrame3HealthBar"
        or name == "PartyMemberFrame4HealthBar"
        or name == "PartyMemberFrame1ManaBar"
        or name == "PartyMemberFrame2ManaBar"
        or name == "PartyMemberFrame3ManaBar"
        or name == "PartyMemberFrame4ManaBar"
        or name == "ArenaEnemyFrame1HealthBar"
        or name == "ArenaEnemyFrame2HealthBar"
        or name == "ArenaEnemyFrame3HealthBar"
        or name == "ArenaEnemyFrame4HealthBar"
        or name == "ArenaEnemyFrame1ManaBar"
        or name == "ArenaEnemyFrame2ManaBar"
        or name == "ArenaEnemyFrame3ManaBar"
        or name == "ArenaEnemyFrame4ManaBar") then
        textStatusBar.TextString:Hide()
        if (textStatusBar.LeftText) then textStatusBar.LeftText:Hide() end
        if (textStatusBar.RightText) then textStatusBar.RightText:Hide() end
    end
end)
-------------------------------------- 隊友施法條-- Party casting bar-------------------------------------
--顯示位置
local function PartyCastingBar_OnShow(self)
    local parentFrame = self:GetParent()
    local petFrame = _G[parentFrame:GetName() .. "PetFrame"]
    if (self.PartyId and petFrame:IsShown()) then self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, -36)
	else self:SetPoint("BOTTOM", parentFrame, "BOTTOM", 0, -12) end
end

--事件監聽
local function PartyCastingBar_OnEvent(self, event, ...)
    local arg1 = ...
    if (event == "CVAR_UPDATE") then
		if (self.casting or self.channeling) then
			self:Show() else self:Hide() end
		return
	elseif (event == "PARTY_MEMBERS_CHANGED"
        or event == "PARTY_MEMBER_ENABLE"
        or event == "PARTY_MEMBER_DISABLE"
        or event == "PARTY_LEADER_CHANGED") then
		local nameChannel  = UnitChannelInfo(self.unit)
		local nameSpell  = UnitCastingInfo(self.unit)
		if (nameChannel) then
			event = "UNIT_SPELLCAST_CHANNEL_START"
			arg1 = self.unit
		elseif (nameSpell) then
			event = "UNIT_SPELLCAST_START"
			arg1 = self.unit
		else
			self.casting = nil
			self.channeling = nil
			self:SetMinMaxValues(0, 0)
			self:SetValue(0)
			self:Hide()
			return
		end
		PartyCastingBar_OnShow(self)
	end
    CastingBarFrame_OnEvent(self, event, arg1, select(2, ...))
end
-- 創建施法條
local partycastframe
for i = 1, MAX_PARTY_MEMBERS do
	partycastframe = CreateFrame("STATUSBAR", "PartyCastingBar"..i, _G["PartyMemberFrame"..i], "SmallCastingBarFrameTemplate")
    partycastframe.PartyId = i
    partycastframe.Icon:Hide()
    partycastframe:SetScale(0.75)
    partycastframe:SetScript("OnShow", PartyCastingBar_OnShow)
    partycastframe:SetScript("OnEvent", PartyCastingBar_OnEvent)
    partycastframe:RegisterEvent("PARTY_MEMBERS_CHANGED")
	partycastframe:RegisterEvent("PARTY_MEMBER_ENABLE")
	partycastframe:RegisterEvent("PARTY_MEMBER_DISABLE")
	partycastframe:RegisterEvent("PARTY_LEADER_CHANGED")
    partycastframe:RegisterEvent("CVAR_UPDATE")
    CastingBarFrame_OnLoad(partycastframe, "party"..i, false, false)
    CastingBarFrame_SetNonInterruptibleCastColor(partycastframe, 1.0, 0.7, 0)
    local prev = "PartyMemberFrame"..(i-1) .. "PetFrame"
    if (_G[prev]) then _G["PartyMemberFrame"..i]:SetPoint("TOPLEFT", _G[prev], "BOTTOMLEFT", -21, -30) end
end

------------------------------------- -- 隊友目標框架 -------------------------------------
local function PartyTarget_UpdateName(self, unit)
    local name = UnitName(unit)
    local color = RAID_CLASS_COLORS[select(2,UnitClass(unit))] or NORMAL_FONT_COLOR
    local fontFile = self.Name:GetFont()
    self.Name:SetFont(fontFile, 9, "OUTLINE")
    self.Name:SetText(name)
    self.Name:SetTextColor(color.r, color.g, color.b)
end

--更新HP
local function PartyTarget_UpdateHealth(self, unit)
    if (UnitIsGhost(unit)) then
        self.HealthBar:SetValue(0)
        self.HealthBar.Text:SetText("|cffeed200 *** |r")
        return 
    end
    if (UnitIsDead(unit)) then
        self.HealthBar:SetValue(0)
        self.HealthBar.Text:SetText("|cffeed200  X  |r")
        return 
    end
    local hp = UnitHealth(unit)
    local perc = floor(hp / max((UnitHealthMax(unit) or 1),1) * 100)
    self.HealthBar:SetValue(perc)
    self.HealthBar.Text:SetText(perc .. "%")
end

--更新颜色
local function PartyTarget_UpdateColor(self, unit)
    if UnitIsEnemy("player", unit) then
        self.Border:SetVertexColor(1, 0.2, 0.2, 0.6)
        self.HealthBar:SetStatusBarColor(0.9, 0.55, 0.72)
    elseif UnitIsFriend("player", unit) then
        self.Border:SetVertexColor(0, 1, 0, 0.6)
        self.HealthBar:SetStatusBarColor(0, 0.9, 0)
    else
        self.Border:SetVertexColor(0.9, 0.82, 0, 0.6)
        self.HealthBar:SetStatusBarColor(0.65, 0.9, 0.85)
    end
end

--更新透明度
local function PartyTarget_UpdateAlpha(self, unit)
    if (UnitInRange(unit)) then self:SetAlpha(1) else self:SetAlpha(0.8) end
end

--隊友目標框架更新
local function PartyTarget_OnUpdate(self, elapsed)
	self.timer = (self.timer or 0) + elapsed
	if (self.timer >= 0.2) then
        self.timer = 0
        local unit = "party" .. self:GetID() .."target"
        local frame = _G["PartyTargetFrame"..self:GetID()]
		if UnitExists(unit) then
            PartyTarget_UpdateName(frame, unit)
            PartyTarget_UpdateHealth(frame, unit)
            PartyTarget_UpdateColor(frame, unit)
            PartyTarget_UpdateAlpha(frame, unit)
		else
			frame:SetAlpha(0)
		end
	end
end

--創建隊友目標框架
local function PartyTarget_CreateButton(index)
    local parent = _G["PartyMemberFrame"..index]
    local button = CreateFrame("Button", "PartyTargetFrame"..index, parent, "SecureUnitButtonTemplate")
    button.unit = "party"..index.."target"
    button:SetID(index)
    button:SetFrameStrata("LOW")
    button:SetWidth(43)
    button:SetHeight(21)
    button:SetHitRectInsets(0, 0, -8, -6)
	  button:SetAttribute("unit", "party"..index.."target")
	  button:SetAttribute("type1", "target")
    button:SetPoint("TOPRIGHT", parent, "TOPLEFT", -8, -8)
    
  button.Name = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	button.Name:SetPoint("TOPRIGHT", button, "TOPRIGHT", 8, 3)
	button.Name:SetTextColor(1, 0.82, 0)

	button.Border = button:CreateTexture(nil, "BORDER")
	button.Border:SetTexture("Interface\\Tooltips\\UI-StatusBar-Border")
	button.Border:SetWidth(46)
	button.Border:SetHeight(24)
	button.Border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, -6)

	button.HealthBar = CreateFrame("STATUSBAR", nil, button)
	button.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	button.HealthBar:SetFrameStrata("HIGH")
	button.HealthBar:SetMinMaxValues(0, 100)
	button.HealthBar:SetValue(100)
	button.HealthBar:SetWidth(43)
	button.HealthBar:SetHeight(18)
	button.HealthBar:SetPoint("TOP", button, "TOP", 1, -9)

	button.HealthBar.Text = button.HealthBar:CreateFontString(nil, "ARTWORK", "SystemFont_Outline_Small")
	button.HealthBar.Text:SetPoint("CENTER", button.HealthBar, "CENTER", 3, 1)
	button.HealthBar.Text:SetTextColor(1, 1, 1)
  button.HealthBar.Text:SetFont(SystemFont_Outline_Small:GetFont(), 11, "OUTLINE")
  button:SetAlpha(0)
    
    return button
end

for i = 1, MAX_PARTY_MEMBERS do PartyTarget_CreateButton(i) end
hooksecurefunc("PartyMemberFrame_OnUpdate", PartyTarget_OnUpdate)

local function PartyLevelText_Update(self)
	local level = ""
	if self.unit and UnitLevel(self.unit) and UnitLevel(self.unit) >= 1 then
		level = UnitLevel(self.unit)
	end
	if not self.levelText then
		self.levelText = _G[self:GetName()]:CreateFontString(nil, "OVERLAY", "NumberFontNormalLargeYellow")
		self.levelText:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 12, -8)
	end
	self.levelText:SetText(level)
end
local iFrame = CreateFrame("Frame")
iFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
iFrame:RegisterEvent("UNIT_LEVEL")
iFrame:SetScript("OnEvent", function(self, event, arg1)
  if event == "UNIT_LEVEL" then
		for i = 1, 4 do
			if arg1 == "party"..i then
				PartyLevelText_Update(_G["PartyMemberFrame"..i])
			end
		end
	end
end)
hooksecurefunc("PartyMemberFrame_UpdateMember", function(self)
	if UnitExists("party"..self:GetID()) then
		PartyLevelText_Update(self)
		SetNameColor(self)
	end
end)

-----------------------------------------------------------------castbar
------------------施法条位置&增强----感谢泡泡帮忙修复-------------------------------------
--[[ 玩家施法条 ]]
CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint("BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -3, -5) --0, 100
CastingBarFrame.SetPoint = function() end
CastingBarFrame:SetSize(333, 12)
CastingBarFrame:SetToplevel(false)
CastingBarFrame:SetFrameStrata("LOW")
CastingBarFrame:SetParent(PlayerFrame)
CastingBarFrame.Border:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
CastingBarFrame.Flash:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
CastingBarFrame.Text = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.Text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
CastingBarFrame.Text:SetPoint("TOPLEFT", CastingBarFrame, "BOTTOMLEFT", 0, -2)
CastingBarFrame.Icon:Show()
CastingBarFrame.Icon:SetSize(PlayerPortrait:GetSize())
    -- Hacky way to set spellicon
    local function setSpell(frame, event)
        if event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" then
            SetPortraitToTexture(CastingBarFrame.Icon, CastingBarFrame.Icon:GetTexture())
        end
    end
    CastingBarFrame:HookScript("OnEvent", setSpell)
CastingBarFrame.Icon:ClearAllPoints()
CastingBarFrame.Icon:SetPoint("CENTER", PlayerPortrait, "CENTER", 0, 0)  --_G[cbf.."Text"]
--[[ 目标施法条 ]]
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("BOTTOMLEFT", TargetFrame, "TOPLEFT", 3, -5) --0, 100
TargetFrameSpellBar.SetPoint = function() end
TargetFrameSpellBar:SetSize(310, 12)
TargetFrameSpellBar:SetToplevel(false)
TargetFrameSpellBar:SetFrameStrata("LOW")
TargetFrameSpellBar:SetParent(TargetFrame)
TargetFrameSpellBar.Border:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
TargetFrameSpellBar.Flash:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
TargetFrameSpellBar.Text = TargetFrameSpellBar:CreateFontString(nil)
TargetFrameSpellBar.Text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
TargetFrameSpellBar.Text:SetPoint("TOPRIGHT", TargetFrameSpellBar, "BOTTOMRIGHT", 0, -2)
TargetFrameSpellBar.Icon:Show()
TargetFrameSpellBar.Icon:SetSize(PlayerPortrait:GetSize())
    local function setSpell(frame, event)
        if event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" then
            SetPortraitToTexture(TargetFrameSpellBar.Icon, TargetFrameSpellBar.Icon:GetTexture())
        end
    end
TargetFrameSpellBar:HookScript("OnEvent", setSpell)
TargetFrameSpellBar.Icon:ClearAllPoints()
TargetFrameSpellBar.Icon:SetPoint("CENTER", TargetFramePortrait, "CENTER", 0, 0)  --_G[cbf.."Text"]

--[[施法计时]]
CastingBarFrame.Time = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
CastingBarFrame.Time:SetPoint("RIGHT", CastingBarFrame, "RIGHT", -6, 0)
CastingBarFrame.update = .1

TargetFrameSpellBar.Time = TargetFrameSpellBar:CreateFontString(nil)
TargetFrameSpellBar.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
TargetFrameSpellBar.Time:SetPoint("LEFT", TargetFrameSpellBar, "LEFT", 6, 0)
TargetFrameSpellBar.update = .1

FocusFrameSpellBar.Time = FocusFrameSpellBar:CreateFontString(nil)
FocusFrameSpellBar.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
FocusFrameSpellBar.Time:SetPoint("RIGHT", FocusFrameSpellBar, "RIGHT", 24, 0)
FocusFrameSpellBar.update = .1

CastingBarFrame:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue, 0)).." / "..format("%.1f", max(self.maxValue - self.value, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
TargetFrameSpellBar:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue - self.value, 0)).." / "..format("%.1f", max(self.maxValue, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
FocusFrameSpellBar:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue, 0)).." / "..format("%.1f", max(self.maxValue - self.value, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
--[[施法延时显示]]
local  playertimer, targettimer, lagmeter
lagmeter = CastingBarFrame:CreateTexture(nil, "BACKGROUND");
lagmeter:SetHeight(CastingBarFrame:GetHeight());
lagmeter:SetWidth(0);
lagmeter:SetPoint("RIGHT", CastingBarFrame, "RIGHT", 0, 0);
lagmeter:SetColorTexture(1, 0, 0, 1); -- red color
hooksecurefunc(CastingBarFrame, "Show", function()
	down, up, lag = GetNetStats();
	local castingmin, castingmax = CastingBarFrame:GetMinMaxValues();
	local lagvalue = ( lag / 1000 ) / ( castingmax - castingmin );
	
	if ( lagvalue < 0 ) then
		lagvalue = 0; 
	elseif ( lagvalue > 1 ) then 
		lagvalue = 1; 
	end;
	
	lagmeter:SetWidth(CastingBarFrame:GetWidth() * lagvalue);
end);
--[[焦点施法条]]
hooksecurefunc(FocusFrameSpellBar, "Show", function()
    FocusFrameSpellBar:SetScale("1.1")
end)
FocusFrameSpellBar:SetStatusBarColor(0,0.45,0.9); FocusFrameSpellBar.SetStatusBarColor = function() end


---------------------------------------------------------------------------------------------------------------------------------------------
MaoRUI:EventFrame("ADDON_LOADED"):SetScript('OnEvent', function(self, event, name)
  if(name ~= "_ShiGuang") then return end
	self:UnregisterEvent('ADDON_LOADED')        

local Me = CreateFrame("Frame") 
Me:RegisterEvent("PLAYER_LOGIN") 
Me:RegisterEvent("ADDON_LOADED") 
Me:RegisterEvent("PLAYER_ENTERING_WORLD") 
Me:SetScript("OnEvent", function(self,event)
 if event == "PLAYER_LOGIN" then 
	  if (MaoRUISettingDB.Small or false) then
	      sendCmd("/bht on")
	      sendCmd("/bht caston")
	      PlayerFrame:SetAlpha(0)
	      TargetFrame:SetAlpha(0)  	      
    end         
	  if (MaoRUISettingDB.Large or false) then
	      sendCmd("/bht off")
	      sendCmd("/bht castoff")
	      PlayerFrame:SetAlpha(1)
        TargetFrame:SetAlpha(1)
	  end
 end
end)
end)