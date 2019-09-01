if (GetLocale() ~= "zhCN") then return end
local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))]
local faction = UnitFactionGroup("player")
local CDCommands = {
	Alliance = {
		Party = "1",
		Difficulty = "YX10",
		Portal = "P",
		Query = "R",
		Quit = "0",
		Partyvip = "我是小软"
		},--LM CD君命令
    Horde = {
		Party = "1",
		Difficulty = "YX10",
		Portal = "P",
		Query = "R",
		Quit = "0",
		Partyvip = "我是小软"
		}--BL CD君命令
}
local CDManFullNames = {
    Alliance = {"萌闪闪-白银之手"},--LM CD君,添加新的CD君格式如:{"名字一-服务器", "名字二-服务器", "名字三-服务器"}
    Horde = {"小小软-苏拉玛", "把你撕成碎片-苏拉玛"}--BL CD君
}

-- Function --
local function CreatCDButton(id, parent, w, h, ap, frame, rp, x, y, alpha, r, g, b)
	local CDButton = CreateFrame("Button", id, parent, "SecureActionButtonTemplate")
		--CDButton:SetFrameStrata("HIGH")
		CDButton:SetWidth(w)
		CDButton:SetHeight(h)
		CDButton:SetPoint(ap, frame, rp, x, y)
		CDButton:SetAlpha(alpha)
		CDButton:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
		CDButton:SetBackdropColor(r, g, b)
		CDButton:RegisterForClicks("LeftButtonUp")
		CDButton:SetAttribute("type","macro")
		--CDButton:SetNormalTexture(Texture)
		return CDButton
	end
local function CreatCDText(f, font, fontsize, fontmod, w, h, text, rp, x, y, r, g, b)
		local CDText = f:CreateFontString(nil, "OVERLAY")
		CDText:SetFont(font, fontsize, fontmod)
		CDText:SetJustifyH("CENTER")
		CDText:SetWidth(w)
		CDText:SetHeight(h)
		CDText:SetText(text)
		CDText:SetPoint(rp, x, y)
		CDText:SetTextColor(r, g, b)
		return CDText
	end
-- Function end --

-- Whisper Details --
	
-- Whisper Details end --	

-- Slash Command --
SLASH_CDCLIENT1 = "/CDC"
SlashCmdList["CDCLIENT"] = function()
	if CDClientDB then
		CDClients:Show()
		CDClientDB = false
	else
		CDClients:Hide()
		CDClientDB = true
	end
end

local CDClient = CreateFrame("Frame")
CDClient:RegisterEvent("PLAYER_LOGIN")
CDClient:SetScript("OnEvent", function(self, event) 
 if event == "PLAYER_LOGIN" then 
	  if CDClientDB then
	      CDClients:Show()	      
      else
	      CDClients:Hide()
	      print(BATTLENET_FONT_COLOR_CODE.."CD君客户端: "..FONT_COLOR_CODE_CLOSE.."界面已隐藏, 输入/cdc重新显示。")
	  end
 end
end)
-- Slash Command end --

 
  CDClients = CreatCDButton("CDClients", UIParent, 65, 65, "BOTTOM", UIParent, "BOTTOM", 0, 120, 1, color.r, color.g, color.b)  --MMMM
  CDClients:SetMovable(true)
  CDClients:SetClampedToScreen(true)
  CDClients:RegisterForDrag("LeftButton", "RightButton")
  CDClients:SetScript("OnDragStart", function(self) self:StartMoving() end)
  CDClients:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
  --CDClients:Hide()
  CDClientsText = CreatCDText(CDClients, STANDARD_TEXT_FONT, 14, "OUTLINE", 25, 25, "Go", "CENTER", 2, 0, 1, 1, 0)
  CDClients:SetScript("OnEnter", function(self)
  	GameTooltip:SetOwner(CDClients, "ANCHOR_TOP")
  	GameTooltip:AddLine("左键进组, 右键隐藏, 隐藏后输入/cdc显示", 1, 1, 1)
  	GameTooltip:Show()
  	end)
  CDClients:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
  CDClients:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  CDClients:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then	
		CDClients_Main:Show()
		CDClientDB = true
	elseif button == "RightButton" then
		CDClients:Hide()
		CDClientDB = false
	end
		--CDClients_Main:Hide() 
  end)

-- Left FB --	 
    CDClients_Main = CreatCDButton("CDClients_Main", CDClients, 46, 46, "BOTTOM",CDClients,"TOP",-20,-16, 1, 255/255, 215/255, 1/255)
    CDClients_MainText = CreatCDText(CDClients_Main, STANDARD_TEXT_FONT, 14, "OUTLINE", 120, 25, "常规", "RIGHT", 0, 0, 1, 1, 0)
    --CDClients_Main:SetScript("OnEnter", function(self)
    	--GameTooltip:SetOwner(CDClients_Main, "ANCHOR_TOP")
    	--GameTooltip:AddLine(" xxxxxxxxxxxxxxxxxxx ", 0, 1,0)
    	--GameTooltip:Show()
    	--CDClients_Main:SetBackdropColor(0,0,0)
    	--end)
    CDClients_Main:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_Main:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_Main:SetAttribute("macrotext",	CDClients_GeneralMacro)
    CDClients_Main:Hide()
	CDClients_Main:SetScript("OnClick", function(self)
		CDClients_Main:Hide()
		for _, name in pairs(CDManFullNames[faction]) do SendChatMessage(CDCommands[faction].Party, "WHISPER", nil, name) end
	end)
	 
	CDClients_AQLSD = CreatCDButton("CDClients_AQLSD", CDClients_Main, 46, 46, "BOTTOM",CDClients_Main,"TOP",-20,-16, 1, 255/255, 215/255, 1/255)
    CDClients_AQLSDText = CreatCDText(CDClients_AQLSD, STANDARD_TEXT_FONT, 14, "OUTLINE", 160, 25, "安其拉神殿", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_AQLSD:SetScript("OnEnter", function(self) CDClients_AQLSD:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_AQLSD:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_AQLSD:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_AQLSD:SetAttribute("macrotext",	CDClients_GeneralMacro)
    CDClients_AQLSD:RegisterForClicks("LeftButtonUp")
	CDClients_AQLSD:SetScript("OnClick", function(self)
		CDClients_Main:Hide()
		for _, name in pairs(CDManFullNames[faction]) do SendChatMessage("安其拉神殿", "WHISPER", nil, name) end
	 end)
    
    CDClients_HASD = CreatCDButton("CDClients_HASD", CDClients_Main, 46, 46, "BOTTOM",CDClients_AQLSD,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_HASDText = CreatCDText(CDClients_HASD, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "黑暗神殿", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_HASD:SetScript("OnEnter", function(self) CDClients_HASD:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_HASD:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_HASD:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_HASD:SetAttribute("macrotext",	CDClients_GeneralMacro)
    
    CDClients_ADE = CreatCDButton("CDClients_ADE", CDClients_Main, 46, 46, "BOTTOM",CDClients_HASD,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_ADEText = CreatCDText(CDClients_ADE, STANDARD_TEXT_FONT, 14, "OUTLINE", 135, 25, "奥杜尔", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_ADE:SetScript("OnEnter", function(self) CDClients_ADE:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_ADE:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_ADE:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_ADE:SetAttribute("macrotext",	CDClients_GeneralMacro)
    
    CDClients_BGBL = CreatCDButton("CDClients_BGBL", CDClients_Main, 46, 46, "BOTTOM",CDClients_ADE,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_BGBLText = CreatCDText(CDClients_BGBL, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "冰冠堡垒", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_BGBL:SetScript("OnEnter", function(self) CDClients_BGBL:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_BGBL:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_BGBL:SetBackdropColor(255/255,215/255,1/255) end)		
    CDClients_BGBL:SetAttribute("macrotext",	CDClients_GeneralMacro)
    
    CDClients_FSWZ = CreatCDButton("CDClients_FSWZ", CDClients_Main, 46, 46, "BOTTOM",CDClients_BGBL,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_FSWZText = CreatCDText(CDClients_FSWZ, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "风神王座", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_FSWZ:SetScript("OnEnter", function(self) CDClients_FSWZ:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_FSWZ:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_FSWZ:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_FSWZ:SetAttribute("macrotext",	CDClients_GeneralMacro)
        
    CDClients_HYXH = CreatCDButton("CDClients_HYXH", CDClients_Main, 46, 46, "BOTTOM",CDClients_FSWZ,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_HYXHText = CreatCDText(CDClients_HYXH, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "黑翼血环", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_HYXH:SetScript("OnEnter", function(self) CDClients_HYXH:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_HYXH:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_HYXH:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_HYXH:SetAttribute("macrotext",	CDClients_GeneralMacro)
    
    CDClients_HYZD = CreatCDButton("CDClients_HYZD", CDClients_Main, 46, 46, "BOTTOM",CDClients_HYXH,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_HYZDText = CreatCDText(CDClients_HYZD, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "火焰之地", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_HYZD:SetScript("OnEnter", function(self) CDClients_HYZD:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_HYZD:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_HYZD:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_HYZD:SetAttribute("macrotext",	CDClients_GeneralMacro)
    
    CDClients_JLZH = CreatCDButton("CDClients_JLZH", CDClients_Main, 46, 46, "BOTTOM",CDClients_HYZD,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_JLZHText = CreatCDText(CDClients_JLZH, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "巨龙之魂", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_JLZH:SetScript("OnEnter", function(self) CDClients_JLZH:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_JLZH:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_JLZH:SetBackdropColor(255/255,215/255,1/255) end)
    CDClients_JLZH:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_MGSBK = CreatCDButton("CDClients_MGSBK", CDClients_Main, 46, 46, "BOTTOM",CDClients_JLZH,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_MGSBKText = CreatCDText(CDClients_MGSBK, STANDARD_TEXT_FONT, 14, "OUTLINE", 160, 25, "魔古山宝库", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_MGSBK:SetScript("OnEnter", function(self) CDClients_MGSBK:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_MGSBK:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_MGSBK:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_MGSBK:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_YCT = CreatCDButton("CDClients_YCT", CDClients_Main, 46, 46, "BOTTOM",CDClients_MGSBK,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_YCTText = CreatCDText(CDClients_YCT, STANDARD_TEXT_FONT, 14, "OUTLINE", 135, 25, "永春台", "RIGHT", 0, 0, 1, 1, 0)
    CDClients_YCT:SetScript("OnEnter", function(self) CDClients_YCT:SetBackdropColor(255/255,106/255,106/255) end)
    CDClients_YCT:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_YCT:SetBackdropColor(255/255,215/255,1/255) end)	
    CDClients_YCT:SetAttribute("macrotext",	CDClients_GeneralMacro)
-- Left FB end --
	
-- Right FB --	        
    CDClients_LDWZ = CreatCDButton("CDClients_LDWZ", CDClients_Main, 46, 46, "BOTTOM",CDClients_Main,"TOP",20,-16, 1, 255/255, 215/255, 1/255)
    CDClients_LDWZText = CreatCDText(CDClients_LDWZ, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "雷电王座", "LEFT", 0, 0, 1, 1, 0)
    CDClients_LDWZ:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_LDWZ:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_LDWZ:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_JZAGRM = CreatCDButton("CDClients_JZAGRM", CDClients_Main, 46, 46, "BOTTOM",CDClients_LDWZ,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_JZAGRMText = CreatCDText(CDClients_JZAGRM, STANDARD_TEXT_FONT, 14, "OUTLINE", 180, 25, "决战奥格瑞玛", "LEFT", 0, 0, 1, 1, 0)
    CDClients_JZAGRM:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_JZAGRM:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_JZAGRM:SetAttribute("macrotext",	CDClients_GeneralMacro)
        
    CDClients_XCB = CreatCDButton("CDClients_XCB", CDClients_Main, 46, 46, "BOTTOM",CDClients_JZAGRM,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_XCBText = CreatCDText(CDClients_XCB, STANDARD_TEXT_FONT, 14, "OUTLINE", 135, 25, "悬坠堡", "LEFT", 0, 0, 1, 1, 0)
    CDClients_XCB:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_XCB:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_XCB:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_HSZZC = CreatCDButton("CDClients_HSZZC", CDClients_Main, 46, 46, "BOTTOM",CDClients_XCB,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_HSZZCText = CreatCDText(CDClients_HSZZC, STANDARD_TEXT_FONT, 14, "OUTLINE", 165, 25, "黑石铸造厂", "LEFT", 0, 0, 1, 1, 0)
    CDClients_HSZZC:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_HSZZC:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_HSZZC:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_DYHBL = CreatCDButton("CDClients_DYHBL", CDClients_Main, 46, 46, "BOTTOM",CDClients_HSZZC,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_DYHBLText = CreatCDText(CDClients_DYHBL, STANDARD_TEXT_FONT, 14, "OUTLINE", 165, 25, "地狱火堡垒", "LEFT", 0, 0, 1, 1, 0)
    CDClients_DYHBL:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_DYHBL:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_DYHBL:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_FCMY = CreatCDButton("CDClients_FCMY", CDClients_Main, 46, 46, "BOTTOM",CDClients_DYHBL,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_FCMYText = CreatCDText(CDClients_FCMY, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "翡翠梦魇", "LEFT", 0, 0, 1, 1, 0)
    CDClients_FCMY:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_FCMY:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_FCMY:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_AYYS = CreatCDButton("CDClients_AYYS", CDClients_Main, 46, 46, "BOTTOM",CDClients_FCMY,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_AYYSText = CreatCDText(CDClients_AYYS, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "暗夜要塞", "LEFT", 0, 0, 1, 1, 0)
    CDClients_AYYS:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_AYYS:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_AYYS:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_SGLSZM = CreatCDButton("CDClients_SGLSZM", CDClients_Main, 46, 46, "BOTTOM",CDClients_AYYS,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_SGLSZMText = CreatCDText(CDClients_SGLSZM, STANDARD_TEXT_FONT, 14, "OUTLINE", 180, 25, "萨格拉斯之墓", "LEFT", 0, 0, 1, 1, 0)
    CDClients_SGLSZM:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_SGLSZM:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_SGLSZM:SetAttribute("macrotext",	CDClients_GeneralMacro)

    CDClients_RSWZ = CreatCDButton("CDClients_RSWZ", CDClients_Main, 46, 46, "BOTTOM",CDClients_SGLSZM,"TOP",0,-8, 1, 255/255, 215/255, 1/255)
    CDClients_RSWZText = CreatCDText(CDClients_RSWZ, STANDARD_TEXT_FONT, 14, "OUTLINE", 150, 25, "燃烧王座", "LEFT", 0, 0, 1, 1, 0)
    CDClients_RSWZ:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_RSWZ:SetBackdropColor(255/255,106/255,106/255) end)	
    CDClients_RSWZ:SetAttribute("macrotext",	CDClients_GeneralMacro)
-- Left FB end --
    
    CDClients_Exit = CreatCDButton("CDClients_Exit", CDClients_Main, 65, 65, "LEFT",CDClients,"RIGHT",0,0, 1, color.r, color.g, color.b)
    CDClients_ExitText = CreatCDText(CDClients_Exit, STANDARD_TEXT_FONT, 13, "OUTLINE", 25, 25, "释", "CENTER", 2, 0, 1, 1, 0)
    CDClients_Exit:SetScript("OnEnter", function(self)
    	GameTooltip:SetOwner(CDClients_Exit, "ANCHOR_TOP")
    	GameTooltip:AddLine("       >>>>>>>★【点击清除 多余队列】★<<<<<<<",  0, 1,0)
    	GameTooltip:Show()
    	CDClients_Exit:SetBackdropColor(0,0,0)
    	end)
    CDClients_Exit:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_Exit:SetBackdropColor(color.r, color.g, color.b) end)	
    CDClients_Exit:SetAttribute("macrotext", CDClients_ExitMacro)
    
    CDClients_TurnH = CreatCDButton("CDClients_TurnH", CDClients_Main, 56, 56, "LEFT",CDClients_General,"RIGHT",26,38, 1, 0,6,6)
    CDClients_TurnHText = CreatCDText(CDClients_TurnH, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "H", "CENTER", 0, 0, 1,1,0)
    CDClients_TurnH:SetScript("OnEnter", function(self)
    	GameTooltip:SetOwner(CDClients_TurnH, "ANCHOR_TOP")
    	GameTooltip:AddLine(">>>>>>>>>>>>★【点击切换 英雄 模式】★<<<<<<<<<<<<",0, 1,0)
    	GameTooltip:Show()
    	CDClients_TurnH:SetBackdropColor(0,0,0)
    	end)
    CDClients_TurnH:SetScript("OnLeave", function(self) GameTooltip:Hide() CDClients_TurnH:SetBackdropColor(0,6,6) end)
    CDClients_TurnH:SetAttribute("macrotext", '/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(15)' ..'\n'.. '/P YX10' ..'\n'.. '/E 切换副本难度为【英雄模式】！')
    
--  Sounds but not work now，	
CD1M = CreatCDButton("CD1M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD1M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\1.mp3")) end)
CD2M = CreatCDButton("CD2M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD2M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\2.mp3")) end)
CD3M = CreatCDButton("CD3M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD3M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\3.mp3")) end)
CD4M = CreatCDButton("CD4M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD4M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\4.mp3")) end)
CD5M = CreatCDButton("CD5M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD5M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\5.mp3")) end)
CD6M = CreatCDButton("CD6M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD6M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\6.mp3")) end)
CD7M = CreatCDButton("CD7M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD7M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\7.mp3")) end)
CD8M = CreatCDButton("CD8M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD8M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\8.mp3")) end)
CD9M = CreatCDButton("CD9M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD9M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\9.mp3")) end)
CD10M = CreatCDButton("CD10M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD10M:SetScript("OnClick", function() PlaySoundFile(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\10.mp3")) end)
CD11M = CreatCDButton("CD11M", UIParent, 0, 0, "LEFT",CDClients_Main,"RIGHT",0,0,0,0,6,6)
CD11M:SetScript("OnClick", function() StopMusic();PlayMusic(tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\CDClients\\11.mp3")); end)