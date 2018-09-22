local _, ns = ...
local M, R, U, I = unpack(ns)
--[[--------------------------------------头像渐隐---------------------------------------
hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if not MaoRUISettingDB["Settings"]["UFFade"] then return end
    local _, instanceType = IsInInstance()
    if (PlayerFrame.inCombat or PlayerFrame.onHateList or instanceType == "arena") then
        PlayerFrame:SetAlpha(1)
    else
        PlayerFrame:SetAlpha(0.43)
    end
end)]]

local Event = CreateFrame("Frame") 
Event:RegisterEvent("PLAYER_ENTERING_WORLD",Update) 
Event:RegisterEvent("PLAYER_REGEN_DISABLED",Update) 
Event:RegisterEvent("PLAYER_REGEN_ENABLED",Update) 
Event:RegisterEvent("UNIT_TARGET",Update) 
Event:RegisterEvent("UNIT_HEALTH",Update) 
--Event:RegisterEvent("UNIT_POWER",Update) 
Event:SetScript("OnEvent",function(self, event, ...) 
   if not MaoRUISettingDB["Settings"]["UFFade"] then return end
   local FrameFadeOut, FrameFadeIn = UIFrameFadeOut, UIFrameFadeIn 
   local InCombat, Target, IsDead = InCombatLockdown(), UnitExists("target"), UnitIsDeadOrGhost("player") 
   local PlayerMaxHp, PlayerMaxMp = UnitHealth("player") == UnitHealthMax("player"), UnitPower("player") == UnitPowerMax("player") 
   local PlayerNoMaxHp, PlayerNoMaxMp = UnitHealth("player") ~= UnitHealthMax("player"), {} 
      local _, powerTypeString = UnitPowerType("player") 
      if powerTypeString == "RAGE" or powerTypeString == "RUNIC_POWER" then 
         PlayerNoMaxMp = UnitPower("player") == UnitPowerMax("player") 
      else 
         PlayerNoMaxMp = UnitPower("player") ~= UnitPowerMax("player") 
      end 
   if event == "PLAYER_REGEN_ENABLED" or not Target or not IsDead and PlayerMaxHp or not IsDead and  PlayerMaxMp then 
      FrameFadeOut(PlayerFrame, 2.0, PlayerFrame:GetAlpha(), 0) 
   end 
   if event == "PLAYER_REGEN_DISABLED" or Target or not IsDead and PlayerNoMaxHp or not IsDead and  PlayerNoMaxMp then 
      FrameFadeIn(PlayerFrame, 0.1, PlayerFrame:GetAlpha(), 1) 
   end 
   if (InCombat and not Target) or (not InCombat and Target) then 
      FrameFadeIn(PlayerFrame, 0.1, PlayerFrame:GetAlpha(), 1) 
   end 
end)

------------------------------------------Class icon---------------------------------------
hooksecurefunc("UnitFramePortrait_Update",function(self) 
   if not MaoRUISettingDB["Settings"]["UFClassIcon"] then return end
        if self.portrait then 
                if UnitIsPlayer(self.unit) then                 
                        if CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))] then 
                                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles") 
                                self.portrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))])) 
                        end 
                else 
                        self.portrait:SetTexCoord(0,1,0,1) 
                end 
        end 
end)
-----------------------------------------	  满血时候不显示X/X   -----------------------------------------
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function(statusFrame, textString, value, valueMin, valueMax)
      if valueMax ~= 0 and GetCVar("statusTextDisplay")=="NUMERIC" then 
         --local percent = tostring(math.ceil((value / valueMax) * 100)) 
         if valueMax == value then textString:SetText(M.Numb(valueMax))
         else textString:SetText(M.Numb(value) .." / "..M.Numb(valueMax))  --textString:SetText(percent.."% "..valueMax.." ")   --百分比/血量 
         end 
      end 
end)
-----------------------------------------	  血条按职业着色  -----------------------------------------
local function ClassColor(statusbar, unit)
		local _, class, c
		if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
				_, class = UnitClass(unit);
				c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class];
				statusbar:SetStatusBarColor(c.r, c.g, c.b);
		end
		if not UnitIsPlayer("target") then
			color = FACTION_BAR_COLORS[UnitReaction("target", "player")]
			if ( not UnitPlayerControlled("target") and UnitIsTapDenied("target") ) then
				TargetFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			else
				if color then
					TargetFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
					TargetFrameHealthBar.lockColor = true
				end
			end
		end
		if not UnitIsPlayer("focus") then
			color = FACTION_BAR_COLORS[UnitReaction("focus", "player")]
			if ( not UnitPlayerControlled("focus") and UnitIsTapDenied("focus") ) then
				FocusFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			else
				if color then
					FocusFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
					FocusFrameHealthBar.lockColor = true
				end
			end
		end
		if not UnitIsPlayer("targettarget") then
			color = FACTION_BAR_COLORS[UnitReaction("targettarget", "player")]
			if ( not UnitPlayerControlled("targettarget") and UnitIsTapDenied("targettarget") ) then
				TargetFrameToTHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			else
				if color then
					TargetFrameToTHealthBar:SetStatusBarColor(color.r, color.g, color.b)
					TargetFrameToTHealthBar.lockColor = true
				end
			end
		end
		if not UnitIsPlayer("focustarget") then
			color = FACTION_BAR_COLORS[UnitReaction("focustarget", "player")]
			if ( not UnitPlayerControlled("focustarget") and UnitIsTapDenied("focustarget") ) then
				FocusFrameToTHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			else
				if color then
					FocusFrameToTHealthBar:SetStatusBarColor(color.r, color.g, color.b)
					FocusFrameToTHealthBar.lockColor = true
				end
			end
		end
	end
hooksecurefunc("UnitFrameHealthBar_Update", ClassColor)
hooksecurefunc("HealthBar_OnValueChanged", function(self) ClassColor(self, self.unit) end)
--[[---------------------------------------	  头像在载具时的调整  -----------------------------------------
hooksecurefunc("PlayerFrame_ToVehicleArt", function(self, vehicleType)	
	PlayerFrame.state = "vehicle";

	UnitFrame_SetUnit(self, "vehicle", PlayerFrameHealthBar, PlayerFrameManaBar);
	UnitFrame_SetUnit(PetFrame, "player", PetFrameHealthBar, PetFrameManaBar);
	PetFrame_Update(PetFrame);
	PlayerFrame_Update();
	BuffFrame_Update();
	ComboFrame_Update(ComboFrame);

	PlayerFrameTexture:Hide();
	if ( vehicleType == "Natural" ) then
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetSize(103,12);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",116,-41);
		PlayerFrameManaBar:SetSize(103,12);
		PlayerFrameManaBar:SetPoint("TOPLEFT",116,-52);
	else
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetSize(100,12);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",119,-41);
		PlayerFrameManaBar:SetSize(100,12);
		PlayerFrameManaBar:SetPoint("TOPLEFT",119,-52);
	end
	PlayerFrame_ShowVehicleTexture();

	PlayerName:SetPoint("CENTER",50,23);
	PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
	PlayerMasterIcon:SetPoint("TOPLEFT",86,0);
	PlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 97, -13);

	PlayerFrameBackground:SetWidth(114);
	PlayerLevelText:Hide();
end)]]
---------------------------------------	  Player    -----------------------------------------
hooksecurefunc("PlayerFrame_ToPlayerArt", function(self)
		PlayerFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		PlayerStatusTexture:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UFs\\UI-Player-Status");
		PlayerName:Hide();
		--PlayerFrameGroupIndicatorText:ClearAllPoints();
		--PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame,"TOP",0,-20);
		--PlayerFrameGroupIndicatorLeft:Hide();
		--PlayerFrameGroupIndicatorMiddle:Hide();
		--PlayerFrameGroupIndicatorRight:Hide();
		PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-24);
		PlayerFrameHealthBar:SetHeight(28);
		PlayerFrameHealthBar.LeftText:ClearAllPoints();
		PlayerFrameHealthBar.LeftText:SetPoint("LEFT",PlayerFrameHealthBar,"LEFT",5,0);	
		PlayerFrameHealthBar.RightText:ClearAllPoints();
		PlayerFrameHealthBar.RightText:SetPoint("RIGHT",PlayerFrameHealthBar,"RIGHT",-5,0);
		PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0);
		PlayerFrameManaBar:SetPoint("TOPLEFT",106,-55);
		PlayerFrameManaBar:SetHeight(8);
		PlayerFrameManaBar.LeftText:ClearAllPoints();
		PlayerFrameManaBar.LeftText:SetPoint("LEFT",PlayerFrameManaBar,"LEFT",5,0)		;
		PlayerFrameManaBar.RightText:ClearAllPoints();
		PlayerFrameManaBar.RightText:SetPoint("RIGHT",PlayerFrameManaBar,"RIGHT",-5,0);
		PlayerFrameManaBarText:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0);
		PlayerFrameManaBar.FeedbackFrame:ClearAllPoints();
		PlayerFrameManaBar.FeedbackFrame:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0);
		PlayerFrameManaBar.FeedbackFrame:SetHeight(8);
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:ClearAllPoints();
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame, "RIGHT", -6, -3);
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetSize(30,29);
		PlayerFrameManaBar.FullPowerFrame.PulseFrame:ClearAllPoints();
		PlayerFrameManaBar.FullPowerFrame.PulseFrame:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame,"CENTER",-6,-2);
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:ClearAllPoints();
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetPoint("CENTER",PlayerFrameManaBar.FullPowerFrame,"RIGHT",5,-4);
		PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetSize(30,50);
end)
---------------------------------------	  Target    -----------------------------------------
hooksecurefunc("TargetFrame_CheckClassification", function(self, forceNormalTexture)
	self.deadText:ClearAllPoints();
	self.deadText:SetFont(STANDARD_TEXT_FONT,21,"OUTLINE")
	self.deadText:SetPoint("TOPLEFT", self.healthbar, "TOPRIGHT", 12, -8) --("CENTER", self.healthbar, "CENTER",0,0);
	self.nameBackground:Hide();
	self.Background:SetSize(119,42);

	self.manabar.pauseUpdates = false;
	self.manabar:Show();
	TextStatusBar_UpdateTextString(self.manabar);
	self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");

	self.name:SetPoint("LEFT", self, 15, 36);
	self.healthbar:SetSize(119, 28);
	self.healthbar:ClearAllPoints();
	self.healthbar:SetPoint("TOPLEFT", 5, -24);
	
	self.healthbar.LeftText:ClearAllPoints();
	self.healthbar.LeftText:SetPoint("LEFT", self.healthbar, "LEFT", 5, 0);
	self.healthbar.RightText:ClearAllPoints();
	self.healthbar.RightText:SetPoint("RIGHT", self.healthbar, "RIGHT", -3, 0);
	self.healthbar.TextString:SetPoint("CENTER", self.healthbar, "CENTER", 0, 0);
		
	self.manabar:ClearAllPoints();
	self.manabar:SetPoint("TOPLEFT", 5, -55);
	self.manabar:SetSize(119, 8);
		
	self.manabar.LeftText:ClearAllPoints();
	self.manabar.LeftText:SetPoint("LEFT", self.manabar, "LEFT", 5, 0);	
	self.manabar.RightText:ClearAllPoints();
	self.manabar.RightText:SetPoint("RIGHT", self.manabar, "RIGHT", -5, 0);
	self.manabar.TextString:SetPoint("CENTER", self.manabar, "CENTER", 0, 0);

	if ( forceNormalTexture ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
	elseif ( UnitClassification(self.unit) == "minus" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
		self.nameBackground:Hide();
		self.manabar.pauseUpdates = true;
		self.manabar:Hide();
		self.manabar.TextString:Hide();
		self.manabar.LeftText:Hide();
		self.manabar.RightText:Hide();
		forceNormalTexture = true;
	elseif ( UnitClassification(self.unit) == "worldboss" or UnitClassification(self.unit) == "elite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Elite");
	elseif ( UnitClassification(self.unit) == "rareelite" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare-Elite");
	elseif ( UnitClassification(self.unit) == "rare" ) then
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare");
	else
		self.borderTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		forceNormalTexture = true;
	end
		
	if ( forceNormalTexture ) then
		self.haveElite = nil;
		if ( UnitClassification(self.unit) == "minus" ) then
			self.Background:SetSize(119,12);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
			--
			self.name:SetPoint("LEFT", self, 15, 16);
			self.healthbar:ClearAllPoints();
			self.healthbar:SetPoint("LEFT", 5, 3);
		else
			self.Background:SetSize(119,42);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
			
		end
		if ( self.threatIndicator ) then
			if ( UnitClassification(self.unit) == "minus" ) then
				self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
				self.threatIndicator:SetTexCoord(0, 1, 0, 1);
				self.threatIndicator:SetWidth(256);
				self.threatIndicator:SetHeight(128);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			else
				self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
				self.threatIndicator:SetWidth(242);
				self.threatIndicator:SetHeight(93);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
				self.threatNumericIndicator:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -66, -3); --"BOTTOM", PlayerFrame, "TOP", 75, -22
			end
		end	
	else
		self.haveElite = true;
		TargetFrameBackground:SetSize(119,42);
		self.Background:SetSize(119,42);
		self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
		if ( self.threatIndicator ) then
			self.threatIndicator:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625);
			self.threatIndicator:SetWidth(242);
			self.threatIndicator:SetHeight(112);
			self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -22, 9);
		end		
	end
	if (self.questIcon) then
		if (UnitIsQuestBoss(self.unit)) then
			self.questIcon:Show();
		else
			self.questIcon:Hide();
		end
	end
end)
		-----------------------------------------	  宠物    -----------------------------------------
  PetFrameHealthBarText:SetPoint("BOTTOMRIGHT", PetFrame, "LEFT", 3,-6)
  PetFrameManaBarText:SetPoint("TOPRIGHT", PetFrame, "LEFT", 3, -6)
  PetFrameManaBarText:SetTextColor(0, 1, 1)
-------------------------------------------	  队友    -----------------------------------------
		 --[[for i = 1, 4 do
		  local PFrame = "PartyMemberFrame"..i
		  _G[PFrame.."ManaBarText"]:SetTextColor(0, 1, 1)
		  _G[PFrame.."ManaBarText"]:SetPoint("LEFT", PFrame.."ManaBar", "LEFT", 3, 0)
		  _G[PFrame.."HealthBarText"]:SetPoint("BOTTOMLEFT", PFrame.."ManaBarText", "TOPLEFT", 0, -2)
		 end]]
--[[-----------------------------------------	  焦点    -----------------------------------------
		FocusFrameNameBackground:SetTexture()
		FocusFrame.Background:SetPoint("TOPLEFT",7,-22);
		FocusFrameTextureFrameName:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 25)
		FocusFrameHealthBar:ClearAllPoints()
		FocusFrameHealthBar:SetHeight(28)
		FocusFrameHealthBar:SetPoint("CENTER", FocusFrameManaBar, "CENTER", 0, 22) 
		FocusFrameTextureFrameHealthBarText:ClearAllPoints()
		FocusFrameTextureFrameHealthBarText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, -3)]]
---------------------------------------	  血量百分比数字    -----------------------------------------
hooksecurefunc("TextStatusBar_UpdateTextString", function(bar)
	local value = bar:GetValue()
	local _, max = bar:GetMinMaxValues()
	if bar.pctText then
		bar.pctText:SetText(value==0 and "" or tostring(math.ceil((value / max) * 100)))  --(value==0 and "" or tostring(math.ceil((value / max) * 100)) .. "%")
		if not MaoRUISettingDB["Settings"]["UFPctText"] or value == max then bar.pctText:Hide()
		elseif GetCVarBool("statusTextPercentage") and ( bar.unit == PlayerFrame.unit or bar.unit == "target" or bar.unit == "focus" ) then bar.pctText:Hide()
		else bar.pctText:Show()
		end
	end
	--if ValueandPct and bar.TextString and bar.TextString:IsShown() and GetCVarBool("statusTextPercentage") then
		--bar.TextString:SetText(value==0 and "" or TextStatusBar_CapDisplayOfNumericValue(value).." ("..tostring(math.ceil((value / max) * 100)).."%)")
	--end
end)
local function colorHPBar(bar, unit)
	if bar and unit == bar.unit then
		local r, g, b
		local min, max = bar:GetMinMaxValues()
		local value = bar:GetValue()
		if max > min then value = (value - min) / (max - min) else value = 0 end
		if value > 0.5 then r, g, b = 2*(1-value), 1, 0 else r, g, b = 1, 2*value, 0 end
			--if UnitIsPlayer(unit) and UnitClass(unit) then  --按职业着色
				--local color = RAID_CLASS_COLORS[select(2, UnitClass(unit))]
				--bar:SetStatusBarColor(color.r, color.g, color.b)
			--else
				--bar:SetStatusBarColor(r, g, b)
			--end
		if bar.pctText then	bar.pctText:SetTextColor(r, g, b) end
	end
end
hooksecurefunc("UnitFrameHealthBar_Update", colorHPBar)
hooksecurefunc("HealthBar_OnValueChanged", function(self) colorHPBar(self, self.unit) end)

function CreateBarPctText(frame, ap, rp, x, y, font, manabar)
	local bar = ( manabar and frame.manabar ) or (not manabar and frame.healthbar )
	if bar then
		if bar.pctText then
			bar.pctText:ClearAllPoints()
			bar.pctText:SetPoint(ap, bar, rp, x, y)
		else
			bar.pctText = frame:CreateFontString(nil, "OVERLAY", font)
			bar.pctText:SetPoint(ap, bar, rp, x, y)
			bar.pctText:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\Pixel.TTF",52,"OUTLINE")
			bar.pctText:SetShadowColor(0, 0, 0)
      bar.pctText:SetShadowOffset(1, -1)
		end
	end
end
CreateBarPctText(PlayerFrame, "RIGHT", "LEFT", -88, -8, "NumberFontNormalLarge")
CreateBarPctText(TargetFrame, "LEFT", "RIGHT", 88, -6, "NumberFontNormalLarge")
CreateBarPctText(FocusFrame, "RIGHT", "LEFT", -3, -8, "NumberFontNormalLarge")
CreateBarPctText(FocusFrameToT, "BOTTOMLEFT", "TOP", 24, 10)  --TargetFrameToT, "BOTTOMLEFT", "TOPRIGHT", 0, 5
--for i = 1, MAX_BOSS_FRAMES do
	--CreateBarPctText(_G["Boss"..i.."TargetFrame"], "LEFT", "RIGHT", 8, 30, "NumberFontNormal")  --"BOTTOMLEFT", "TOPRIGHT", 17, 19, "NumberFontNormalLarge"
--end			
---------------------------------------	  头像框名称职业染色    -----------------------------------------
function SetNameColor(frame)
	if frame:IsShown() and frame.name then
		local color = UnitIsPlayer(frame.unit) and RAID_CLASS_COLORS[select(2, UnitClass(frame.unit))] or NORMAL_FONT_COLOR, UnitIsPlayer(frame.unit)
		frame.name:SetTextColor(color.r, color.g, color.b)  --(1,1,0)
		if UnitIsEnemy("player", "target") then 
		   frame.name:SetTextColor(1,0,0) 
		--elseif UnitIsFriend("player", "target") then 
		   --frame.name:SetTextColor(0,1,0)  	 		
		end
	end
end
SetNameColor(PlayerFrame)
TargetFrame:HookScript("OnUpdate", SetNameColor)
TargetFrameToT:HookScript("OnUpdate", SetNameColor)
FocusFrameToT:HookScript("OnUpdate", SetNameColor)
-----------------------------------------	     隐藏头像动态伤害      -----------------------------------------
local p=PlayerHitIndicator;p.Show=p.Hide;p:Hide() 
local p=PetHitIndicator;p.Show=p.Hide;p:Hide() 
--[[---------------------------------------	     显示BUFF是谁加的      -----------------------------------------
hooksecurefunc(GameTooltip, 'SetUnitAura', function(self, unit, index, filter)
	local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, filter)
	if unitCaster and UnitName(unitCaster) then
		self:AddLine("".. (I.MyColor or "|cffffffff") .. UnitName(unitCaster) .. "|r (" .. unitCaster .. ")")
		self:Show()
	end
end)]]
-------------------------------	  目标种族、职业和其它信息   ----------------------------------------
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
    self.nameBackground:SetAlpha(UnitIsPlayer(unit) and 0.2 or 1.0)
		if UnitIsPlayer("target") then
			raceText = UnitRace("target")
			TargetFrameRace:SetTextColor(NORMAL_FONT_COLOR.r,NORMAL_FONT_COLOR.g,NORMAL_FONT_COLOR.b)
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
-----------------------------------------	     Buff时间      -----------------------------------------
function BT_AuraButton_Update(buttonName, index, filter)
	local unit = PlayerFrame.unit;
	local name, texture, count, debuffType, duration, expirationTime = UnitAura(unit, index, filter); 
	local buffName = buttonName..index;
	local buffDuration = getglobal(buffName.."Duration");
	if ( duration == 0 ) then
		buffDuration:SetText("|cff00ff00^-^|r");
		buffDuration:Show();
	end
end
function BT_AuraButton_UpdateDuration(buffButton, timeLeft)
	if( SHOW_BUFF_DURATIONS == "1" ) then
		local duration = getglobal(buffButton:GetName().."Duration");
		if( timeLeft ) then
			M.FormatBuffTime(duration, timeLeft);
			duration:Show();
		else
			duration:Hide();
		end
	end
end
function BuffTimers_OnLoad(self)                              -- Hook the functions we need to override
	hooksecurefunc("AuraButton_Update", BT_AuraButton_Update);
	hooksecurefunc("AuraButton_UpdateDuration", BT_AuraButton_UpdateDuration);
end
BuffTimers_OnLoad(self);
--[[---------------------------------------	     玩家/焦点/目标框体血条加粗      -----------------------------------------
local function UpdatePlayerFrame()
	if not UnitHasVehicleUI("player") then
		PlayerName:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", -100000, 12); 
 		--PlayerName:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE"); 
		--PlayerFrameHealthBar:ClearAllPoints();
		PlayerFrameHealthBar:SetWidth(119);
		PlayerFrameHealthBar:SetHeight(28);
		--PlayerFrameHealthBar:SetPoint("CENTER", PlayerFrameManaBar, "CENTER", 0, 22); 
    --PlayerFrameHealthBarText:ClearAllPoints();
    --PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 1, -3);
    PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-22);
		PlayerFrameHealthBarText:SetPoint("CENTER",50,12);
    -----------------------------------	
		PlayerFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
		PlayerStatusTexture:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\UFs\\UI-Player-Status");
		------百分比 数值都显示 的模式下--------------------
		PlayerFrameHealthBarTextLeft:ClearAllPoints();
		PlayerFrameHealthBarTextLeft:SetPoint("left", PlayerFrameHealthBar, "left", 6, -3);
		PlayerFrameHealthBarTextRight:ClearAllPoints();
		PlayerFrameHealthBarTextRight:SetPoint("Right", PlayerFrameHealthBar, "Right", -2, -3);
	end
end
hooksecurefunc("PlayerFrame_UpdateArt", UpdatePlayerFrame)
PlayerFrame:HookScript("OnEvent", function(self, event)
   if event=="PLAYER_ENTERING_WORLD" then UpdatePlayerFrame() end
end)
do
		--目标
		if ( UnitClassification("target") == "minus" ) then
		TargetFrameHealthBar:SetHeight(12)
		TargetFrameHealthBar:SetPoint("TOPLEFT",7,-41) 
		TargetFrame.healthbar.TextString:SetPoint("CENTER",-50,4);
		TargetFrame.Background:SetPoint("TOPLEFT",7,-41);
		else
		TargetFrameHealthBar:SetHeight(28)
		TargetFrameHealthBar:SetPoint("TOPLEFT",7,-22) 
		TargetFrame.healthbar.TextString:SetPoint("CENTER",-50,6);
		TargetFrame.Background:SetPoint("TOPLEFT",7,-22);
		end
		--TargetFrame.Background:SetPoint("TOPLEFT",6,-22);
		TargetFrame.deadText:ClearAllPoints()
		TargetFrame.deadText:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -21, -12)		
		TargetFrame.threatNumericIndicator:ClearAllPoints()
		TargetFrame.threatNumericIndicator:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -66, -3)	
		--TargetFrameHealthBar:ClearAllPoints()
		--TargetFrameHealthBar:SetHeight(28)
		--TargetFrameHealthBar:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 22) 		
		TargetFrameTextureFrameName:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 22)
		TargetFrameTextureFrameName:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")		
		TargetFrameTextureFrameHealthBarText:ClearAllPoints()
		TargetFrameTextureFrameHealthBarText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, -2)
		TargetFrameTextureFrameHealthBarTextLeft:SetPoint("left", TargetFrameHealthBar, "left", 2, -2) 
		TargetFrameTextureFrameHealthBarTextRight:SetPoint("Right", TargetFrameHealthBar, "Right", -4, -2)
    TargetFrameNameBackground:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex")
		TargetFrameNameBackground:ClearAllPoints()
		TargetFrameNameBackground:SetHeight(16)
		TargetFrameNameBackground:SetWidth(16)
		TargetFrameNameBackground:SetPoint("BOTTOMLEFT", TargetFrameHealthBar, "TOPLEFT", -8, -2)
end
function UpdateTargetFrameTexture()
	--TargetFrame.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
	if ( UnitClassification("target") == "minus" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Minus");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Minus");
	elseif ( UnitClassification("target") == "worldboss" or UnitClassification("target") == "elite" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Elite");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Elite");
	elseif ( UnitClassification("target") == "rareelite" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare-Elite");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare-Elite");
	elseif ( UnitClassification("target") == "rare" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-Rare");
	elseif ( UnitClassification("target") == "org" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-org");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-org");
	elseif ( UnitClassification("target") == "PlusMob" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-PlusMob");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-PlusMob");
	elseif ( UnitClassification("target") == "RareMob" ) then
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-RareMob");
		FocusFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame-RareMob");
	else
		TargetFrameTextureFrameTexture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\UFs\\UI-TargetingFrame");
	end
end
hooksecurefunc("TargetFrame_CheckClassification", UpdateTargetFrameTexture)]]

---------------------------- 隊友框架: 隱藏HP/MP  Hide Party HP/MP -------------------------------------
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
		if (UnitChannelInfo(self.unit)) then
			event = "UNIT_SPELLCAST_CHANNEL_START"
			arg1 = self.unit
		elseif (UnitCastingInfo(self.unit)) then
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
    --partycastframe:RegisterEvent("PARTY_MEMBERS_CHANGED")
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
    local color = RAID_CLASS_COLORS[select(2,UnitClass(unit))] or NORMAL_FONT_COLOR
    self.Name:SetFont(self.Name:GetFont(), 9, "OUTLINE")
    self.Name:SetText(UnitName(unit))
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
    if (UnitInRange(unit)) then self:SetAlpha(1) else self:SetAlpha(0.6) end
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
    --button:SetScript("OnUpdate", PartyTargetDebuff_OnUpdate) --這裡是註冊隊友目標的debuff顯示
    
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

--[[local HideFrameTexture = CreateFrame("Frame",nil,UIParent) 
HideFrameTexture:RegisterEvent("PLAYER_ENTERING_WORLD") 
HideFrameTexture:SetScript("OnUpdate",function(self,event,...) 
PlayerFrameTexture:Hide() 
TargetFrameTextureFrameTexture:Hide() 
TargetFrameToTTextureFrameTexture:Hide() 
FocusFrameTextureFrameTexture:Hide() 
FocusFrameToTTextureFrameTexture:Hide() 
PetFrameTexture:Hide() 

PlayerPortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
TargetFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
TargetFrameToTPortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
TargetFrameToTPortrait:SetWidth(38) 
TargetFrameToTPortrait:SetHeight(38) 
FocusFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
FocusFrameToTPortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
FocusFrameToTPortrait:SetWidth(38) 
FocusFrameToTPortrait:SetHeight(38) 
PetPortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame1Portrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame1PetFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame2Portrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame2PetFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame3Portrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame3PetFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame4Portrait:SetTexCoord(0.14, 0.84, 0.14, 0.84) 
PartyMemberFrame4PetFramePortrait:SetTexCoord(0.14, 0.84, 0.14, 0.84)
end)]]