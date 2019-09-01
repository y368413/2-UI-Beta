local _, CDClient = ...
CDClient.Buttons = {}
local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))]
local faction = UnitFactionGroup("player")
local portalButtons, portalButtonNum, portalOffset = {}, 0, 7
local isPortalButtonsShown, isExtraButtonsShown, isEnter, isPortalsEnter = false, false, false, false

local cdManFullNames = {
    Alliance = {"萌闪闪-白银之手"},--LM CD君,添加新的CD君格式如:{"名字一-服务器", "名字二-服务器", "名字三-服务器"}
    Horde = {"小小软-苏拉玛", "把你撕成碎片-苏拉玛"}--BL CD君
}

local cdCommands = {
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

local portals = {
	Alliance = {
		"暴风城",
		"铁炉堡",
		"达纳苏斯",
		"埃索达",
		"塞拉摩",
		"沙塔斯",
		"达拉然 - 诺森德",
		"托尔巴拉德",
		"锦绣谷",
		"暴风之盾",
		"达拉然 - 破碎群岛",
		"伯拉勒斯"
		},
	Horde = {
		"奥格瑞玛", 
		"幽暗城", 
		"雷霆崖", 
		"银月城", 
		"斯通纳德", 
		"沙塔斯", 
		"达拉然 - 诺森德", 
		"托尔巴拉德", 
		"锦绣谷", 
		"战争之矛", 
		"达拉然 - 破碎群岛", 
		"达萨罗"
	}
}

local portalIcons = {
	["安其拉神殿"] = "1778351",
	["黑暗神殿"] = "126847",
	["奥杜尔"] = "1778350",
	["冰冠堡垒"] = "Interface/Icons/spell_arcane_portalexodar",
	["风神王座"] = "Interface/Icons/spell_arcane_portaltheramore",
	["黑翼血环"] = "Interface/Icons/spell_arcane_portalorgrimmar",
	["火焰之地"] = "Interface/Icons/spell_arcane_portalundercity",
	["巨龙之魂"] = "Interface/Icons/spell_arcane_portalthunderbluff",
	["魔古山宝库"] = "Interface/Icons/spell_arcane_portalsilvermoon",
	["永春台"] = "Interface/Icons/spell_arcane_portalstonard",
	["雷电王座"] = "Interface/Icons/spell_arcane_portalshattrath",
	["决战奥格瑞玛"] = "Interface/Icons/spell_arcane_portaldalaran",
	["悬坠堡"] = "Interface/Icons/spell_arcane_portaltolbarad",
	["黑石铸造厂"] = "Interface/Icons/spell_arcane_portal_valeofblossoms",
	["地狱火堡垒"] = "Interface/Icons/spell_arcane_portalstormshield",
	["翡翠梦魇"] = "Interface/Icons/spell_arcane_portalwarspear",
	["暗夜要塞"] = "Interface/Icons/spell_arcane_portaldalaranbrokenisles",
	["萨格拉斯之墓"] = "Interface/Icons/spell_arcane_teleportkultiras",
	["燃烧王座"] = "Interface/Icons/spell_arcane_teleportzandalar"
}--传送门图标

local portalTextsNames = {
	"安其拉神殿",
	"黑暗神殿",
	"奥杜尔",
	"冰冠堡垒",
	"风神王座",
	"黑翼血环",
	"火焰之地",
	"巨龙之魂",
	"魔古山宝库",
	"永春台",
	"雷电王座",
	"决战奥格瑞玛",
	"悬坠堡",
	"黑石铸造厂",
	"地狱火堡垒",
	"翡翠梦魇",
	"暗夜要塞",
	"萨格拉斯之墓",
	"燃烧王座"
}--副本名称

local portalTexts = {
	["安其拉神殿"] = "安其拉神殿",
	["黑暗神殿"] = "黑暗神殿",
	["奥杜尔"] = "奥杜尔",
	["冰冠堡垒"] = "冰冠堡垒",
	["风神王座"] = "风神王座",
	["黑翼血环"] = "黑翼血环",
	["火焰之地"] = "火焰之地",
	["巨龙之魂"] = "巨龙之魂",
	["魔古山宝库"] = "魔古山宝库",
	["永春台"] = "永春台",
	["雷电王座"] = "雷电王座",
	["决战奥格瑞玛"] = "决战奥格瑞玛",
	["悬坠堡"] = "悬坠堡",
	["黑石铸造厂"] = "黑石铸造厂",
	["地狱火堡垒"] = "地狱火堡垒",
	["翡翠梦魇"] = "翡翠梦魇",
	["暗夜要塞"] = "暗夜要塞",
	["萨格拉斯之墓"] = "萨格拉斯之墓",
	["燃烧王座"] = "燃烧王座"
}--副本名称

SLASH_CDCLIENT1 = "/CDC"
SlashCmdList["CDCLIENT"] = function(cmd, editbox)
	if not CDClientDB.Status then
		CDClientDB.Status = true
		CDClient:Switch(true)
		CDClient:SwitchExtraButtons(false)
	else
		CDClientDB.Status = false
		CDClient:Switch(false)
		CDClient:SwitchExtraButtons(false)
	end
end

local F = CreateFrame("Frame")
F:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
F:RegisterEvent("VARIABLES_LOADED")

function F:VARIABLES_LOADED()
	self:UnregisterEvent('VARIABLES_LOADED')
	CDClientDB = CDClientDB or {}
	if CDClientDB.Location and #CDClientDB.Location > 0 then
		ReqParty:ClearAllPoints()
		ReqParty:SetPoint(unpack(CDClientDB.Location))
	end
	if CDClientDB.Status == nil then
		CDClientDB.Status = true
		CDClient:Switch(CDClientDB.Status)
	end
	CDClient:SwitchExtraButtons(false)
	if not CDClientDB.Status then
		print(BATTLENET_FONT_COLOR_CODE.."CD君客户端: "..FONT_COLOR_CODE_CLOSE.."界面已隐藏, 输入/cdc重新显示。")
	end
end

function CDClient:Switch(status)
	if status then
		for _, button in pairs(CDClient.Buttons) do
			button:Show()
			isExtraButtonsShown = true
		end
		CDClient.Buttons.ReqParty.OnUpdate = function()
			CDClient:SwitchExtraButtons(isEnter) 
			ReqPortal:PortalButtonsSwitch(isPortalsEnter)
		end
	else
		for _, button in pairs(CDClient.Buttons) do
			button:Hide()
		end
		CDClient.Buttons.ReqParty.OnUpdate = nil
	end
end

function CDClient:SwitchExtraButtons(status)
	if not CDClientDB.Status then
		return
	end
	if status and not isExtraButtonsShown then
		for _, button in pairs(CDClient.Buttons) do
			button:Show()
		end
		isExtraButtonsShown = true
	elseif not status and isExtraButtonsShown then
		for _, button in pairs(CDClient.Buttons) do
			if button:GetName() ~= "ReqParty" then
				button:Hide()
			end
		end
		isExtraButtonsShown = false
	end
end

CDClient.Buttons.ReqParty = CreateFrame("BUTTON","ReqParty",UIParent)
    ReqParty:SetFrameStrata("HIGH")
    ReqParty:SetWidth(50)
    ReqParty:SetHeight(50)
    ReqParty:SetPoint("TOPLEFT",UIParent,"TOPLEFT",11,-50) 
    ReqParty:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqParty:SetBackdropColor(color.r, color.g, color.b)
    ReqParty:SetMovable(true)
    ReqParty:SetClampedToScreen(true)
    ReqParty:RegisterForDrag("LeftButton", "RightButton")
    ReqParty:SetScript("OnDragStart", function(self) self:StartMoving() end)
    ReqParty:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		local locationTbl = {self:GetPoint()} 
		CDClientDB.Location = {locationTbl[1],"UIParent",locationTbl[3],locationTbl[4],locationTbl[5]} 
	end)
    ReqParty:Show()
    ReqPartyText = ReqParty:CreateFontString("ReqPartyText", "OVERLAY")
    ReqPartyText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqPartyText:SetJustifyH("CENTER")
    ReqPartyText:SetJustifyV("CENTER")
    ReqPartyText:SetWidth(25)
    ReqPartyText:SetHeight(25)
    ReqPartyText:SetText("CD") 
    ReqPartyText:SetPoint("CENTER", ReqParty,1.5,1)
    ReqPartyText:SetTextColor(1,2,0)
    ReqParty:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqParty, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("左键进组, 右键隐藏, 隐藏后输入/cdc显示", 1, 1, 1)
        GameTooltip:Show()
		isEnter = true
    end)
        ReqParty:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
    end)
	ReqParty:SetScript("OnUpdate", function(self) self:OnUpdate() end)
    ReqParty:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    ReqParty:SetScript("OnClick", function(self, button, ...)
		if button == "LeftButton" then
			CDClient:SwitchExtraButtons(true)
			for _, name in pairs(cdManFullNames[faction]) do
				SendChatMessage(cdCommands[faction].Party, "WHISPER", nil, name)
			end
		elseif button == "RightButton" then
			CDClientDB.Status = false;
			CDClient:Switch(false)
		end
    end)
	
function CDClient.Buttons.ReqParty:OnUpdate()
	CDClient:SwitchExtraButtons(isEnter) 
	ReqPortal:PortalButtonsSwitch(isPortalsEnter)
end
    
CDClient.Buttons.ReqPortal = CreateFrame("BUTTON", "ReqPortal", ReqParty)
    ReqPortal:SetFrameStrata("HIGH")
    ReqPortal:SetWidth(50)
    ReqPortal:SetHeight(50)
    ReqPortal:SetPoint("Right",ReqParty,"Right",36, 0) 
    ReqPortal:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqPortal:SetBackdropColor(color.r, color.g, color.b)
    ReqPortal:Hide()
    ReqPortalText = ReqPortal:CreateFontString("ReqPortalText", "OVERLAY")
    ReqPortalText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqPortalText:SetJustifyH("CENTER")
    ReqPortalText:SetJustifyV("CENTER")
    ReqPortalText:SetWidth(25)
    ReqPortalText:SetHeight(25)
    ReqPortalText:SetText("门") 
    ReqPortalText:SetPoint("CENTER", ReqPortal,1.5,1)
    ReqPortalText:SetTextColor(1,2,0)
    ReqPortal:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqPortal, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("传送门菜单", 1, 1, 1)
        GameTooltip:Show()
		isPortalsEnter = true
		isEnter = true
    end)
        ReqPortal:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
		isPortalsEnter = false
    end)
    ReqPortal:RegisterForClicks("LeftButtonUp")
	ReqPortal:SetScript("OnClick", function(self)
		for _, name in pairs(cdManFullNames[faction]) do
			SendChatMessage(cdCommands[faction].Portal, "WHISPER", nil, name)
		end
    end)
	
function ReqPortal:CreatePortalButtons(portalName)
	portalButtonNum = portalButtonNum + 1;
	local portalButton = CreateFrame("Button", "portalButton", ReqPortal)
		portalButton:SetFrameLevel(8)
		portalButton:SetSize(36,36)
		portalButton:SetNormalTexture(portalIcons[portalName])
		portalButton:SetPushedTexture(portalIcons[portalName])
		portalButton:SetHighlightTexture(portalIcons[portalName])
		portalButton:ClearAllPoints();
		portalButton:SetPoint("BOTTOM", ReqPortal, "BOTTOM", 0, portalButtonNum * 32 + portalOffset)
		--portalButton:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    --portalButton:SetBackdropColor(color.r, color.g, color.b)
		portalButton:Hide()
		portalButton:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(portalButton, "ANCHOR_RIGHT")
			GameTooltip:AddLine(portalName, 1, 1, 1)
			GameTooltip:Show()
			isEnter = true
			isPortalsEnter = true
		end)
        portalButton:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
			--isEnter = false
		end)
		portalButton:RegisterForClicks("LeftButtonUp")
		portalButton:SetScript("OnClick", function(self)
			for _, name in pairs(cdManFullNames[faction]) do
				SendChatMessage(portalName, "WHISPER", nil, name)
			end
		end)
	portalButtons[portalName] = portalButton
	  portalButtonText = portalButton:CreateFontString("portalButtonText", "OVERLAY")
    portalButtonText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    portalButtonText:SetJustifyH("CENTER")
    portalButtonText:SetJustifyV("CENTER")	
		portalButtonText:SetWidth(300)
    portalButtonText:SetHeight(43)
    portalButtonText:SetText(portalTexts[portalName])
    portalButtonText:SetPoint("CENTER", portalButton,61.5,1)
    portalButtonText:SetTextColor(1,2,0)
end

function ReqPortal:PortalButtonsSwitch(state)
	if state and not isPortalButtonsShown then
		for k, button in pairs(portalButtons) do
			button:Show()
		end
		isPortalButtonsShown = true
	elseif not state and isPortalButtonsShown then
		for k, button in pairs(portalButtons) do
			button:Hide()
		end
		isPortalButtonsShown = false
	end
end

do
	for k, portalName in pairs(portalTextsNames) do
		ReqPortal:CreatePortalButtons(portalName)
	end
	local bgFrame = CreateFrame("Frame","bgFrame", ReqPortal)
		bgFrame:SetWidth(60)
		bgFrame:SetHeight(35 * portalButtonNum)
		bgFrame:SetPoint("TOP",ReqPortal,"TOP",0 , -30) 
		bgFrame:Hide()
		bgFrame:SetScript("OnEnter",function() isEnter = true isPortalsEnter = true end)
		bgFrame:SetScript("OnLeave",function() isEnter = false isPortalsEnter = false end)
	portalButtons.backGroundFrame = bgFrame
end

CDClient.Buttons.ReqDifficulty = CreateFrame("BUTTON", "ReqDifficulty", ReqParty)
    ReqDifficulty:SetFrameStrata("HIGH")
    ReqDifficulty:SetWidth(50)
    ReqDifficulty:SetHeight(50)
    ReqDifficulty:SetPoint("Right",ReqParty,"Right",70, 0) 
    ReqDifficulty:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqDifficulty:SetBackdropColor(color.r, color.g, color.b)
    ReqDifficulty:Hide()
    ReqDifficultyText = ReqDifficulty:CreateFontString("ReqDifficultyText", "OVERLAY")
    ReqDifficultyText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqDifficultyText:SetJustifyH("CENTER")
    ReqDifficultyText:SetJustifyV("CENTER")
    ReqDifficultyText:SetWidth(25)
    ReqDifficultyText:SetHeight(25)
    ReqDifficultyText:SetText("H") 
    ReqDifficultyText:SetPoint("CENTER", ReqDifficulty,1.5,1)
    ReqDifficultyText:SetTextColor(1,2,0)
    ReqDifficulty:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqDifficulty, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("点击切换H", 1, 1, 1)
		GameTooltip:AddLine("在队伍中点击将发送切换H命令", 1, 1, 1)
		GameTooltip:AddLine("不在队伍中点击将切换自身难度为H", 1, 1, 1)
        GameTooltip:Show()
		isEnter = true
    end)
        ReqDifficulty:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
    end)
    ReqDifficulty:RegisterForClicks("LeftButtonUp")
    ReqDifficulty:SetScript("OnClick", function(self)
		--for _, name in pairs(cdManFullNames[faction]) do
			--SendChatMessage(cdCommands[faction].Portal, "WHISPER", nil, name)
		--end
		if IsInGroup() then
			SendChatMessage(cdCommands[faction].Difficulty, "PARTY", nil, nil)
			else
		if GetRaidDifficultyID() ~= 15 then  --切换H模式
			SetRaidDifficultyID(15)
			--if GetLegacyRaidDifficultyID() ~= 4 then  切换25人
            --SetLegacyRaidDifficultyID(4)
			else
			print(BATTLENET_FONT_COLOR_CODE.."团队副本已经是英雄模式了亲")
			
	      
         end
         end
    end)
    
CDClient.Buttons.ReqQuery = CreateFrame("BUTTON", "ReqQuery", ReqParty)
    ReqQuery:SetFrameStrata("HIGH")
    ReqQuery:SetWidth(50)
    ReqQuery:SetHeight(50)
    ReqQuery:SetPoint("Right",ReqParty,"Right",105, 0) 
    ReqQuery:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqQuery:SetBackdropColor(color.r, color.g, color.b)
    ReqQuery:Hide()
    ReqQueryText = ReqQuery:CreateFontString("ReqQueryText", "OVERLAY")
    ReqQueryText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqQueryText:SetJustifyH("CENTER")
    ReqQueryText:SetJustifyV("CENTER")
    ReqQueryText:SetWidth(25)
    ReqQueryText:SetHeight(25)
    ReqQueryText:SetText("查") 
    ReqQueryText:SetPoint("CENTER", ReqQuery,1.5,1)
    ReqQueryText:SetTextColor(1,2,0)
    ReqQuery:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqQuery, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("查询队列", 1, 1, 1)
        GameTooltip:Show()
		isEnter = true
    end)
        ReqQuery:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
    end)
    ReqQuery:RegisterForClicks("LeftButtonUp")
    ReqQuery:SetScript("OnClick", function(self, button, ...)
		for _, name in pairs(cdManFullNames[faction]) do
			SendChatMessage(cdCommands[faction].Query, "WHISPER", nil, name)
		end
    end)	

CDClient.Buttons.ReqQuit = CreateFrame("BUTTON", "ReqQuit", ReqParty)
    ReqQuit:SetFrameStrata("HIGH")
    ReqQuit:SetWidth(50)
    ReqQuit:SetHeight(50)
    ReqQuit:SetPoint("Right",ReqParty,"Right",140, 0) 
    ReqQuit:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqQuit:SetBackdropColor(color.r, color.g, color.b)
    ReqQuit:Hide()
    ReqQuitText = ReqQuit:CreateFontString("ReqQuitText", "OVERLAY")
    ReqQuitText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqQuitText:SetJustifyH("CENTER")
    ReqQuitText:SetJustifyV("CENTER")
    ReqQuitText:SetWidth(25)
    ReqQuitText:SetHeight(25)
    ReqQuitText:SetText("退") 
    ReqQuitText:SetPoint("CENTER", ReqQuit,1.5,1)
    ReqQuitText:SetTextColor(1,2,0)
    ReqQuit:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqQuit, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("放弃排队", 1, 1, 1)
        GameTooltip:Show()
		isEnter = true
    end)
        ReqQuit:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
    end)
    ReqQuit:RegisterForClicks("LeftButtonUp")
    ReqQuit:SetScript("OnClick", function(self, button, ...)
		for _, name in pairs(cdManFullNames[faction]) do
			SendChatMessage(cdCommands[faction].Quit, "WHISPER", nil, name)
		end
    end)
	
	CDClient.Buttons.ReqPartyvip = CreateFrame("BUTTON", "ReqPartyvip", ReqParty)
    ReqPartyvip:SetFrameStrata("HIGH")
    ReqPartyvip:SetWidth(50)
    ReqPartyvip:SetHeight(50)
    ReqPartyvip:SetPoint("Right",ReqParty,"Right",-35, 0) 
    ReqPartyvip:SetBackdrop({bgFile = "Interface\\AddOns\\CDClient\\Hexagon"})
    ReqPartyvip:SetBackdropColor(color.r, color.g, color.b)
    ReqPartyvip:Hide()
    ReqPartyvipText = ReqPartyvip:CreateFontString("ReqPartyvipText", "OVERLAY")
    ReqPartyvipText:SetFont("Fonts\\ARHei.ttf", 12, "OUTLINE")
    ReqPartyvipText:SetJustifyH("CENTER")
    ReqPartyvipText:SetJustifyV("CENTER")
    ReqPartyvipText:SetWidth(25)
    ReqPartyvipText:SetHeight(25)
    ReqPartyvipText:SetText("插") 
    ReqPartyvipText:SetPoint("CENTER", ReqPartyvip,1.5,1)
    ReqPartyvipText:SetTextColor(1,2,0)
    ReqPartyvip:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(ReqPartyvip, "ANCHOR_TOPLEFT")
        GameTooltip:AddLine("插到队列第一个", 1, 1, 1)
        GameTooltip:Show()
		isEnter = true
    end)
        ReqPartyvip:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
		isEnter = false
    end)
    ReqPartyvip:RegisterForClicks("LeftButtonUp")
    ReqPartyvip:SetScript("OnClick", function(self, button, ...)
		for _, name in pairs(cdManFullNames[faction]) do
			SendChatMessage(cdCommands[faction].Partyvip, "WHISPER", nil, name)
		end
    end)