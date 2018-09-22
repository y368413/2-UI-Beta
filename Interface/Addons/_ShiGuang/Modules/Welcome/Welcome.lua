local _, ns = ...
local M, R, U, I = unpack(ns)
------------------------------------LogIn Welcome Pic----------------------------------------------
--Config
local BackDropFile = "Interface\\Addons\\_ShiGuang\\Media\\Modules\\Raid\\solid"
local Media = "Interface\\AddOns\\_ShiGuang\\Media\\Modules\\BlinkHealthText\\" 	
local Small1 = Media.."SmallPic.tga" 	
local Large1 = Media.."LargePic.tga" 
--local Pic = Media.."Pic.tga"
local ClassColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))] 
--Welcome--
local Welcome = CreateFrame("Frame", nil, UIParent) 
Welcome:SetPoint("TOPLEFT",0,0)
Welcome:SetPoint("BOTTOMRIGHT",0,0)
Welcome:SetFrameStrata("HIGH")
Welcome:SetFrameLevel(0)
Welcome:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = 0, 
   edgeFile = BackDropFile, 
   edgeSize = 1, 
})
Welcome:SetBackdropColor(0.2, 0.2, 0.2, 1) 
Welcome:SetBackdropBorderColor(0,0,0,0) 
--------------------------------------------------second----------------------------------------------------------
--TopBlack--
local TopBlack = CreateFrame("Frame", nil, Welcome) 
TopBlack:SetPoint("TOPLEFT",Welcome,0,0)
TopBlack:SetPoint("BOTTOMRIGHT",Welcome,"TOPRIGHT",0,-21)
TopBlack:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = 0, 
   edgeFile = BackDropFile, 
   edgeSize = 1, 
})
TopBlack:SetBackdropColor(0.08, 0.08, 0.08, 1) 
TopBlack:SetBackdropBorderColor(0,0,0,0) 

--BottomBlack--
local BottomBlack = CreateFrame("Frame", nil, Welcome) 
BottomBlack:SetPoint("TOPLEFT",Welcome,"BOTTOMLEFT",0,43)
BottomBlack:SetPoint("BOTTOMRIGHT",0,0)
BottomBlack:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = 0, 
   edgeFile = BackDropFile, 
   edgeSize = 1, 
})
BottomBlack:SetBackdropColor(0.06, 0.06, 0.06, 1) 
BottomBlack:SetBackdropBorderColor(0,0,0,0) 

----------WelcomeTitle----------
local WelcomeTitle1 = CreateFrame("Button", nil, Welcome) 
WelcomeTitle1:SetSize(60,60)
WelcomeTitle1:SetPoint("BOTTOM",Welcome,"CENTER",0,12)
WelcomeTitle1:SetFrameStrata("HIGH")
WelcomeTitle1:SetFrameLevel(1)
WelcomeTitle1.Text = WelcomeTitle1:CreateFontString(nil, "OVERLAY")
WelcomeTitle1.Text:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\RedCircl.TTF", 120, "OUTLINE") 
WelcomeTitle1.Text:SetText("|cFFFFFF00 2 |r")
WelcomeTitle1.Text:SetPoint("CENTER",WelcomeTitle1,0,3)
WelcomeTitle1.Text:SetTextColor(1,0,0,1)

local WelcomeTitle2 = CreateFrame("Button", nil, Welcome) 
WelcomeTitle2:SetSize(43,43)
WelcomeTitle2:SetPoint("BOTTOMRIGHT",WelcomeTitle1,"BOTTOMRIGHT",21,-8)
WelcomeTitle2:SetFrameStrata("HIGH")
WelcomeTitle2:SetFrameLevel(1)
WelcomeTitle2.Text = WelcomeTitle2:CreateFontString(nil, "OVERLAY")
WelcomeTitle2.Text:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\RedCircl.TTF", 23, "OUTLINE") 
WelcomeTitle2.Text:SetText("|cFFFF0000 UI|r")
WelcomeTitle2.Text:SetPoint("CENTER",WelcomeTitle2,0,3)
WelcomeTitle2.Text:SetTextColor(1,1,0,1)
--------------------WelcomeAbstract--------------------
local WelcomeAbstract= CreateFrame("Button", nil, Welcome) 
WelcomeAbstract:SetPoint("TOPLEFT",Welcome,"BOTTOMLEFT",-1,43+43)
WelcomeAbstract:SetPoint("BOTTOMRIGHT",Welcome,"BOTTOMRIGHT",1,43)
WelcomeAbstract:SetFrameLevel(1)
WelcomeAbstract.Text = WelcomeAbstract:CreateFontString(nil, "OVERLAY")
WelcomeAbstract.Text:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
WelcomeAbstract.Text:SetText("-----  开袋即食零设置 上手即用懒人包  -----")
WelcomeAbstract.Text:SetPoint("BOTTOM",WelcomeAbstract,"TOP",0,-64)
WelcomeAbstract.Text:SetTextColor(0.97,0.75,0,1)  --0.8,0.2,0.6,0.8
--------------------MadeBy--------------------
local MadeBy = CreateFrame("Button", nil, Welcome) 
MadeBy:SetFrameStrata("HIGH")
MadeBy:SetFrameLevel(10)
MadeBy:SetWidth(210)
MadeBy:SetHeight(21)
MadeBy:SetPoint("BOTTOMRIGHT",BottomBlack,"BOTTOMRIGHT",-8,31)
--MadeBy.Text = MadeBy:CreateFontString(nil, "OVERLAY")
--MadeBy.Text:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\Pixel.TTF", 12, "THICKOUTLINE") 
--MadeBy.Text:SetText("- www.maorui.org -") --■ ■
--MadeBy.Text:SetPoint("CENTER",MadeBy,0,0)
--MadeBy.Text:SetTextColor(0.66,0.66,0.66,1)
MadeBy.Text1 = MadeBy:CreateFontString(nil, "OVERLAY")
MadeBy.Text1:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\Edo.TTF", 52, "THICKOUTLINE") 
MadeBy.Text1:SetText("ALLIANCE OR HORDE ?")
MadeBy.Text1:SetPoint("TOP",Welcome,"TOP",0,-43)
MadeBy.Text1:SetTextColor(1, 1, 1,1)
MadeBy.Text2 = MadeBy:CreateFontString(nil, "OVERLAY")
MadeBy.Text2:SetFont("Interface\\addons\\_ShiGuang\\Media\\Fonts\\Edo.TTF", 43, "THICKOUTLINE") 
MadeBy.Text2:SetText("MAKE DECISION !")
MadeBy.Text2:SetPoint("TOP",Welcome,"TOP",0,-120)
MadeBy.Text2:SetTextColor(1, 1, 1,1)

--------------------------------------------------Frame----------------------------------------------------------
--Small-
local Small = CreateFrame("Frame", nil, Welcome) 
Small:SetWidth(960)
Small:SetHeight(210)
Small:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = {left = 1,right = 1,top = 1,bottom = 1}, 
   edgeFile = BackDropFile, 
   edgeSize = 2, 
})
Small:SetBackdropColor(0.15,0.15,0.15,1)
Small:SetBackdropBorderColor(0, 0, 0, 1) 
Small:SetPoint("BOTTOMRIGHT",Welcome,"BOTTOM",1,43)
--配图按钮--
local SmallPic = CreateFrame("Button", nil, Welcome) 
SmallPic:SetWidth(512)
SmallPic:SetHeight(256)
SmallPic:SetFrameLevel(2)
SmallPic:SetPoint("RIGHT",Small,"RIGHT",30,-1)
Small.Icon = SmallPic:CreateTexture(nil,"ARTWORK")
Small.Icon:SetTexture(Small1)
Small.Icon:SetAllPoints(SmallPic)
local function Sc(alpha)  --按钮特效--
	SmallPic:SetAlpha(alpha) end
	SmallPic:EnableMouse(true)
	SmallPic:SetAlpha(1) 
	SmallPic:SetScript("OnEnter", function(self) Sc(0.8) end)
	SmallPic:SetScript("OnLeave", function(self) Sc(1) end)
	SmallPic:SetScript("OnMouseUp", function(self) Sc(1) end)
	SmallPic:SetScript("OnMouseDown", function(self) Sc(0.6) end)
	
--文字说明-
local SmallText = CreateFrame("Frame", nil, Welcome) 
SmallText:SetWidth(430)
SmallText:SetHeight(186)
SmallText:SetPoint("RIGHT",SmallPic,"LEFT",88,0)
--SmallText.Icon = SmallText:CreateTexture(nil,"ARTWORK")
--SmallText.Icon:SetTexture(Pic)
--SmallText.Icon:SetWidth(430)
--SmallText.Icon:SetHeight(186)
--SmallText.Icon:SetAllPoints(SmallText)
SmallText.Text1 = SmallText:CreateFontString(nil, "OVERLAY")
SmallText.Text1:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
SmallText.Text1:SetText("[ 微美化界面 ]")
SmallText.Text1:SetPoint("RIGHT",SmallText,"CENTER",160,60)
SmallText.Text1:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b,1)
SmallText.Text2 = SmallText:CreateFontString(nil, "OVERLAY")
SmallText.Text2:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
SmallText.Text2:SetText("[ 全职业适用无障碍 ]")
SmallText.Text2:SetPoint("RIGHT",SmallText,"CENTER",160,20)
SmallText.Text2:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b,1)
SmallText.Text3 = SmallText:CreateFontString(nil, "OVERLAY")
SmallText.Text3:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
SmallText.Text3:SetText("[ 开袋即食 轻优化 无需设置 ]")
SmallText.Text3:SetPoint("RIGHT",SmallText,"CENTER",160,-20)
SmallText.Text3:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b,1)
SmallText.Text4 = SmallText:CreateFontString(nil, "OVERLAY")
SmallText.Text4:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
SmallText.Text4:SetText("[ 插件适配更新器 更加便捷及时和高效 ]")
SmallText.Text4:SetPoint("RIGHT",SmallText,"CENTER",160,-60)
SmallText.Text4:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b,1)

---------Large-------------------------------------------------------------------------
local Large = CreateFrame("Frame", nil, Welcome) 
Large:SetWidth(960)
Large:SetHeight(210)
Large:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = {left = 1,right = 1,top = 1,bottom = 1}, 
   edgeFile = BackDropFile, 
   edgeSize = 2, 
})
Large:SetBackdropColor(0.15,0.15,0.15,1)
Large:SetBackdropBorderColor(0, 0, 0, 1) 
Large:SetPoint("BOTTOMLEFT",Welcome,"BOTTOM",-1,43)
--配图按钮--
local LargePic = CreateFrame("Button", nil, Welcome) 
LargePic:SetWidth(512)
LargePic:SetHeight(256)
LargePic:SetFrameLevel(2)
LargePic:SetPoint("LEFT",Large,"LEFT",-30,-1)
Large.Icon = LargePic:CreateTexture(nil,"ARTWORK")
Large.Icon:SetTexture(Large1)
Large.Icon:SetAllPoints(LargePic)
local function Sc(alpha)  --按钮特效--
	LargePic:SetAlpha(alpha) end
	LargePic:EnableMouse(true)
	LargePic:SetAlpha(1)
	LargePic:SetScript("OnEnter", function(self) Sc(0.8) end)
	LargePic:SetScript("OnLeave", function(self) Sc(1) end)
	LargePic:SetScript("OnMouseUp", function(self) Sc(1) end)
	LargePic:SetScript("OnMouseDown", function(self) Sc(0.6) end)	
--文字说明-
local LargeText = CreateFrame("Frame", nil, Welcome) 
LargeText:SetWidth(430)
LargeText:SetHeight(186)
LargeText:SetPoint("LEFT",LargePic,"RIGHT",-80,0)
--LargeText.Icon = LargeText:CreateTexture(nil,"ARTWORK")
--LargeText.Icon:SetTexture(Pic)
--LargeText.Icon:SetWidth(430)
--LargeText.Icon:SetHeight(186)
--LargeText.Icon:SetAllPoints(LargeText)
LargeText.Text1 = LargeText:CreateFontString(nil, "OVERLAY")
LargeText.Text1:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
LargeText.Text1:SetText("[ v "..GetAddOnMetadata("_ShiGuang", "Version").." ]")
LargeText.Text1:SetPoint("LEFT",LargeText,"CENTER",-160,60)
LargeText.Text1:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b, 1)  --0.97,0.75,0,1
LargeText.Text2 = LargeText:CreateFontString(nil, "OVERLAY")
LargeText.Text2:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
LargeText.Text2:SetText("[ Hi BFA 8.0.1 ]")
LargeText.Text2:SetPoint("LEFT",LargeText,"CENTER",-160,30)
LargeText.Text2:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b, 1)  --0.97,0.75,0,1
LargeText.Text3 = LargeText:CreateFontString(nil, "OVERLAY")
LargeText.Text3:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
LargeText.Text3:SetText("[ 右键小地图便捷设置 ]")
LargeText.Text3:SetPoint("LEFT",LargeText,"CENTER",-160,-0)
LargeText.Text3:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b, 1)  --0.97,0.75,0,1
LargeText.Text4 = LargeText:CreateFontString(nil, "OVERLAY")
LargeText.Text4:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
LargeText.Text4:SetText("[ 系统自带功能，插件有针对性删减 ]")
LargeText.Text4:SetPoint("LEFT",LargeText,"CENTER",-160,-30)
LargeText.Text4:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b, 1)  --0.97,0.75,0,1
LargeText.Text5 = LargeText:CreateFontString(nil, "OVERLAY")
LargeText.Text5:SetFont(STANDARD_TEXT_FONT, 16, "THICKOUTLINE") 
LargeText.Text5:SetText("[ https://www.maorui.net ]")
LargeText.Text5:SetPoint("LEFT",LargeText,"CENTER",-160,-60)
LargeText.Text5:SetTextColor(ClassColor.r, ClassColor.g, ClassColor.b,1)

-------------------模 型---------------------------

local LeftRed = CreateFrame("Frame", nil, Welcome) 
LeftRed:SetPoint("TOPLEFT",TopBlack,"BOTTOMLEFT",0,0)
LeftRed:SetPoint("BOTTOMRIGHT",Small,"TOPRIGHT",0,0)
LeftRed:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = 0, 
   edgeFile = BackDropFile, 
   edgeSize = 1, 
})
LeftRed:SetBackdropColor(0, 0, 1, 0.3) 
LeftRed:SetBackdropBorderColor(0,0,0,0) 

local RightBlue = CreateFrame("Frame", nil, Welcome) 
RightBlue:SetPoint("TOPRIGHT",TopBlack,"BOTTOMRIGHT",0,0)
RightBlue:SetPoint("BOTTOMLEFT",Large,"TOPLEFT",0,0)
RightBlue:SetBackdrop({ 
   bgFile = BackDropFile, 
   insets = 0, 
   edgeFile = BackDropFile, 
   edgeSize = 1, 
})
RightBlue:SetBackdropColor(1, 0, 0, 0.3) 
RightBlue:SetBackdropBorderColor(0,0,0,0) 
--NPCMode2--------------------
local NPCMode2 = CreateFrame("PlayerModel", "NPCMode2", Welcome)
NPCMode2:SetSize(UIParent:GetWidth(), UIParent:GetHeight()*0.8)
NPCMode2:SetPoint("BOTTOM",Large,"TOPRIGHT",0,0) --"CENTER",0,210
NPCMode2:SetDisplayInfo(28213)  --ShiGuangDB.DisplayInfo
NPCMode2:SetParent(Welcome) 
NPCMode2:SetCamDistanceScale(0.6)
NPCMode2:SetPosition(0,-0.21,-0.43)
NPCMode2:SetRotation(-0.26)
NPCMode2.rotation = 0.22
local function RotateModel(self, button)
    local rotationIncrement = 0.2
    if button == "LeftButton" then
		self.rotation = self.rotation - rotationIncrement
    else
		self.rotation = self.rotation + rotationIncrement
    end
    self.rotation = floor((self.rotation)*10)/10
    self:SetRotation(self.rotation)
end
NPCMode2:SetScript("OnMouseDown", function(self, button) RotateModel(self, button) end)
--NPCModel--------------------
local NPCModel = CreateFrame("PlayerModel", "NPCModel", Welcome)
NPCModel:SetSize(UIParent:GetWidth(), UIParent:GetHeight()*0.8)
NPCModel:SetPoint("BOTTOM",Small,"TOPRIGHT",-210,0) --"CENTER",0,210
NPCModel:SetDisplayInfo(82047)  --54860  --74504   --71057 	--68323   --35908   --65636 
NPCModel:SetParent(Welcome) 
NPCModel:SetCamDistanceScale(0.8)
NPCModel:SetPosition(0,-0.21,-0.43)
NPCModel:SetRotation(0.66)
NPCModel.rotation = 0.12
local function RotateModel(self, button)
    local rotationIncrement = 0.2
    if button == "LeftButton" then
		self.rotation = self.rotation - rotationIncrement
    else
		self.rotation = self.rotation + rotationIncrement
    end
    self.rotation = floor((self.rotation)*10)/10
    self:SetRotation(self.rotation)
end
NPCModel:SetScript("OnMouseDown", function(self, button) RotateModel(self, button) end)
--PlayerModel--------------------
local PlayerModel = CreateFrame("PlayerModel", "PlayerModel", Welcome)
PlayerModel:SetSize(256, 256)
PlayerModel:SetPoint("BOTTOM",Small,"TOPRIGHT",0,-60) --"BOTTOM",MadeBy,"TOP",0,120
PlayerModel:SetUnit("player")
PlayerModel:SetParent(Welcome)
PlayerModel:SetCamDistanceScale(1)
PlayerModel:SetPosition(-1.6,0,0)
PlayerModel:SetRotation(0)
PlayerModel.rotation = 0
--[[----------------GuiMenuBar-------------------------
local MainMenu = CreateFrame("Button", nil, UIParent) 
MainMenu:SetWidth(88)
MainMenu:SetHeight(21)
MainMenu:SetFrameStrata("LOW")
MainMenu:SetFrameLevel(0)

    MainMenu:CreateTexture("MainMenuBG")
    MainMenuBG:ClearAllPoints()
    MainMenuBG:SetSize(280, 36)--352
    MainMenuBG:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Menu")
    MainMenuBG:SetTexCoord(0,0.9,0,0.5)
    MainMenuBG:SetPoint("CENTER",0,12)
    
--MainMenu:SetBackdropColor(0, 0, 0, 0.8)
--MainMenu:SetBackdropBorderColor(0.25,0.25,0.25,1)  --(ClassColor.r, ClassColor.g, ClassColor.b, 0.66)
MainMenu:SetPoint("TOP",UIParent,"TOP",0,0)
MainMenu.Text = MainMenu:CreateFontString(nil, "OVERLAY")
MainMenu.Text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE") 
MainMenu.Text:SetText("---|cFFB22222 2 |r|cFF1E90FF UI |r---")
MainMenu.Text:SetPoint("CENTER",MainMenu,0,3)

MainMenu:SetScript("OnMouseDown", function(self, button)
	     	--Welcome:Show()
		    --UIParent:Hide()
	if button == "LeftButton" then
          sendCmd("/mr") 
	elseif button == "RightButton" then
	end
end)
	
local function Sc(alpha)
	MainMenu:SetAlpha(alpha)end
	MainMenu:EnableMouse(true)
	MainMenu:SetAlpha(0.8)
 	MainMenu:SetScript("OnEnter", function(self) Sc(1) end)
	MainMenu:SetScript("OnLeave", function(self) Sc(0.8) end)
	--MainMenu:SetScript("OnMouseUp", function(self) Sc(1) end)
	--MainMenu:SetScript("OnMouseDown", function(self) Sc(0.7) end)

local WelComeMainMenu = CreateFrame("Frame") 
		WelComeMainMenu:RegisterEvent("PLAYER_ENTERING_WORLD") 
		WelComeMainMenu:RegisterEvent("PLAYER_REGEN_DISABLED") 
		WelComeMainMenu:RegisterEvent("PLAYER_REGEN_ENABLED") 
		WelComeMainMenu:SetScript("OnEvent", function(self, event) 
    if event == "PLAYER_ENTERING_WORLD" then 
		MainMenu:Show()
	end 
    if event == "PLAYER_REGEN_DISABLED" then 
		MainMenu:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" then 
		MainMenu:Show()
    end 
end)]]

-- Menu Slash--  
local function WelcomeMenuSlash(event, addon)
  if addon ~= "_ShiGuang" then return end
	  M:UnregisterEvent(event, WelcomeMenuSlash)
	  SLASH_ShiGuang1 = '/loadmr'
	  SlashCmdList["ShiGuang"] = function() Welcome:Show()
  end
end
M:RegisterEvent("ADDON_LOADED", WelcomeMenuSlash)
Welcome:Hide()

local function MrOnLogin()
		MaoRUISettingDB.loaded = true
		ReloadUI()
		Welcome:Hide()
end

------------------按钮动作-------------------------
MadeBy:SetScript("OnClick", function(self,Button) Welcome:Hide() end)
SmallPic:SetScript("OnClick", function(self,Button)
		MaoRUISettingDB.BHT = true
		MrOnLogin()
end)
LargePic:SetScript("OnClick", function(self,Button)
		MaoRUISettingDB.BHT = false
		MrOnLogin()
end)

local function Welcomeload(self, event)
	M:UnregisterEvent(event, Welcomeload)
	if not MaoRUISettingDB.loaded then
		if event == "PLAYER_ENTERING_WORLD" then Welcome:Hide() end
	  Welcome:Show()
	end
	if (MaoRUISettingDB.BHT == true) then
	    sendCmd("/bht on")
	    PlayerFrame:SetAlpha(0)
	    TargetFrame:SetAlpha(0)               
	else
	    sendCmd("/bht off")
	    PlayerFrame:SetAlpha(1)
	    TargetFrame:SetAlpha(1)  
	end
	if (MaoRUISettingDB["BHTHit"] == true) then sendCmd("/bht hiton") else sendCmd("/bht hitoff") end
end
M:RegisterEvent("PLAYER_ENTERING_WORLD", Welcomeload)