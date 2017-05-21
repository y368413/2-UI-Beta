-- Thanks Lombra for his inputs:
-- http://www.wowinterface.com/forums/showthread.php?t=55021

local ADDON = ...

local fontName, fontHeight, fontFlags = GameFontNormal:GetFont()

local BUTTON_HEIGHT = fontHeight + 4
local BUTTON_SPACING = 0
local MENU_BUFFER = 10
local MENU_SPACING = 1
local MENU_WIDTH_EMPTY = 210
local MENU_WIDTH = 430

local GMLM_REPORT = {}
local GMLM_CFG = {
		maxloots = 20,    -- max num of recent loots to mantain
		myself = false,   -- if false don't show my own loot
		minquality = 4,   -- see legenda below 
		equiponly = true, -- only show armour, gem (relics) and weapons
}

local header_desc_string = "设置: "
if GMLM_CFG["maxloots"] then header_desc_string = header_desc_string .. "最大拾取数="..GMLM_CFG["maxloots"] end
if GMLM_CFG["myself"] == true then header_desc_string = header_desc_string .. " 包括自己" else header_desc_string = header_desc_string .." 不包括自己" end
if GMLM_CFG["minquality"] then header_desc_string = header_desc_string .. " 品质="..GMLM_CFG["minquality"] end
if GMLM_CFG["equiponly"] == true then header_desc_string = header_desc_string .." 仅装备" else header_desc_string = header_desc_string .." 全部" end

--
-- minquality values from: 	http://wowprogramming.com/docs/api_types#itemQuality
--
-- 0. Poor (gray): Broken I.W.I.N. Button
-- 1. Common (white): Archmage Vargoth's Staff
-- 2. Uncommon (green): X-52 Rocket Helmet
-- 3. Rare / Superior (blue): Onyxia Scale Cloak
-- 4. Epic (purple): Talisman of Ephemeral Power
-- 5. Legendary (orange): Fragment of Val'anyr
-- 6. Artifact (golden yellow): The Twin Blades of Azzinoth
-- 7. Heirloom (light yellow): Bloodied Arcanite Reaper
	
	
-- upvalues to be used perhaps in the future.
local string_format = string.format
local string_find = string.find
local string_sub = string.sub

local function color(String)
	if not UnitExists(String) then return string.format("\124cffff0000%s\124r", String) end
	local _, class = UnitClass(String)
	local color = _G["RAID_CLASS_COLORS"][class]
	return string.format("\124cff%02x%02x%02x%s\124r", color.r*255, color.g*255, color.b*255, String)
end


local Menu = CreateFrame('Frame', nil, UIParent)
Menu:SetFrameStrata('TOOLTIP')
Menu:SetClampedToScreen(true)
Menu:SetBackdrop({
	bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	tile = true, tileSize = 32, edgeSize = 16,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
Menu:Hide()


local function initMenu()

		GMLM_REPORT = {}
		
		for index = 1, GMLM_CFG["maxloots"] do
			Menu[index]:SetText("")
			Menu[index]:Hide()
		end
		
		Menu:SetSize(MENU_WIDTH, (MENU_BUFFER * 5) + (fontHeight * 3) + MENU_SPACING + ((BUTTON_HEIGHT + BUTTON_SPACING) - BUTTON_SPACING))
end

local function Menu_OnLeave()
	local focus = GetMouseFocus() or WorldFrame
	if focus ~= Menu and focus:GetParent() ~= Menu then
		Menu:Hide()
	end
end
Menu:SetScript('OnLeave', Menu_OnLeave)

local header_desc = Menu:CreateFontString()
header_desc:SetPoint("TOPLEFT", Menu, "TOPLEFT", MENU_BUFFER, -MENU_BUFFER)
header_desc:SetFont(fontName, fontHeight)
header_desc:SetTextColor(1, 1, 1, 1)
header_desc:SetText(header_desc_string)

local mclick_desc = Menu:CreateFontString()
mclick_desc:SetPoint("BOTTOMLEFT", Menu, "BOTTOMLEFT", MENU_BUFFER, MENU_BUFFER)
mclick_desc:SetFont(fontName, fontHeight)
mclick_desc:SetTextColor(0, 1, 0, 1)
mclick_desc:SetText("中键点击:重置")

local rclick_desc = Menu:CreateFontString()
rclick_desc:SetPoint("TOPLEFT", mclick_desc, "TOPRIGHT", MENU_BUFFER, 0)
rclick_desc:SetFont(fontName, fontHeight)
rclick_desc:SetTextColor(0, 1, 0, 1)
rclick_desc:SetText("右键点击:密语")

local lclick_desc = Menu:CreateFontString()
lclick_desc:SetPoint("TOPLEFT", rclick_desc, "TOPRIGHT", MENU_BUFFER, 0)
lclick_desc:SetFont(fontName, fontHeight)
lclick_desc:SetTextColor(0, 1, 0, 1)
lclick_desc:SetText("左键点击:显示物品信息")


local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(ADDON, {
	type = "data source",
	icon = "Interface\\Addons\\_ShiGuang\\Media\\Emotes\\evil",
	text = ADDON,
	OnClick = function(self, button)
		if button == "LeftButton" then
			Menu:SetShown(not Menu:IsShown())
		elseif button == "RightButton" then
			return
		elseif button == "MiddleButton" then
			initMenu()
			return
		end
	end,
	OnEnter = function(self)
		if not Menu:IsShown() then
			local _, selfCenter = self:GetCenter()
			local _, uiCenter = UIParent:GetCenter()
			Menu:ClearAllPoints()
			if selfCenter >= uiCenter then
				Menu:SetPoint('TOP', self, 'BOTTOM')
			else
				Menu:SetPoint('BOTTOM', self, 'TOP')
			end
			Menu:Show()
		end
	end,
	OnLeave = Menu_OnLeave
})

local function Button_OnClick(self, button, down)

	if button == "RightButton" then

		SendChatMessage("你好，这件装备 " .. GMLM_REPORT[self.index]["loot"] .. " 有需求吗？如果你不需要，能否让给我呢?非常感谢！", "WHISPER", nil, GMLM_REPORT[self.index]["player"])

	elseif button == "LeftButton" then
	
		ShowUIPanel(ItemRefTooltip)
		
		if not ItemRefTooltip:IsShown() then
			
			ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")

		end
		
		ItemRefTooltip:SetHyperlink(GMLM_REPORT[self.index]["loot"])		
		return

	elseif button == "MiddleButton" then
	
		initMenu()
		return

	end

	Menu:Hide()
	
end

Menu:RegisterEvent('PLAYER_LOGIN')
Menu:RegisterEvent('CHAT_MSG_LOOT')
Menu:SetScript("OnEvent", function(self, event, ...)
	
	
	if event == "PLAYER_LOGIN" then	

		Menu:UnregisterEvent(event)
		
		for index = 1, GMLM_CFG["maxloots"] do
		
			local button = CreateFrame("Button", nil, Menu)
			if index ~= 1 then
				button:SetPoint("TOPLEFT", Menu[index - 1], "BOTTOMLEFT", 0, -BUTTON_SPACING)
			else
				button:SetPoint("TOPLEFT", header_desc, "BOTTOMLEFT", 0, -MENU_BUFFER)
			end
			
			button:SetPoint("RIGHT", -MENU_BUFFER, 0)
			button:SetHeight(BUTTON_HEIGHT)
			button:SetNormalFontObject("GameFontNormal")
			button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
			button.index = index
			button:RegisterForClicks("AnyDown")
			button:SetScript("OnClick", Button_OnClick)
			button:SetScript("OnLeave", Menu_OnLeave)

			local text = button:CreateFontString(ADDON .. "btn_font", nil, "GameFontNormal")
			text:SetAllPoints()
			text:SetJustifyH("LEFT")
			text:SetJustifyV("MIDDLE")
			text:SetTextColor(1, 1, 1, 1)
			
			button:SetFontString(text)
			Menu[index] = button
			
		end		
		
		initMenu()

	elseif event == "CHAT_MSG_LOOT" then
	
		local lootstring, _, _, _, player = ...
		
		local itemLink 		= string.match(lootstring,"|%x+|Hitem:.-|h.-|h|r")
		local itemString 	= string.match(itemLink, "item[%-?%d:]+")
		local _, _, quality, _, _, class, subclass, _, equipSlot, texture, _, ClassID, SubClassID = GetItemInfo(itemString)

		local Disabled = 0	
		if GMLM_CFG["myself"] == false and UnitName("player") == player then 
			Disabled = 1 
		end	
		
		if GMLM_CFG["minquality"] > quality then 
			Disabled = 1
		end
		
		if GMLM_CFG["equiponly"] == true and (ClassID <= 1 or ClassID > 4 ) then 
			Disabled = 1
		end		
		
		-- print("DEBUG: " .. itemLink .. " qlt:" .. quality .. " class:" .. class .. " subclass:" .. subclass .. " equislot:" .. equipSlot .. " classid:" .. ClassID .. " subclassid:" .. SubClassID .. " disabled:" .. Disabled)
				
		if player and Disabled == 0 then 
			
			if #GMLM_REPORT >= GMLM_CFG["maxloots"] then table.remove(GMLM_REPORT, 1) end
		
			GMLM_REPORT[#GMLM_REPORT+1] = {
				ilv				= GetDetailedItemLevelInfo(itemLink),
				player			= player,
				loot			= itemLink,
			}	
				
			local numButtons = #GMLM_REPORT
			for index = 1, numButtons do

				Menu[index]:SetText("")
				Menu[index]:SetText(GMLM_REPORT[index]["ilv"] .. " " .. color(GMLM_REPORT[index]["player"]) .. " " ..  GMLM_REPORT[index]["loot"])
				Menu[index]:Show()

				-- print("DEBUG:" .. Menu[index]:GetStringWidth())
				
			end 
			Menu:SetSize(MENU_WIDTH, (MENU_BUFFER * 5) + (fontHeight * 3) + MENU_SPACING + ((BUTTON_HEIGHT + BUTTON_SPACING) * numButtons - BUTTON_SPACING))
		end
		
	end
	
end)


SLASH_GMLM1 = "/gmlm"
SlashCmdList["GMLM"] = function(args) 
	local param=SecureCmdOptionParse(args)
	param=param:lower()
	
	if param=="" then
		print(ADDON .. ":")
		print("/gmlm  - This help")
		print("/gmlm show - Show")
		return
		
	elseif param == "show" then 
	
		if not Menu:IsShown() then
			Menu:ClearAllPoints()
			Menu:SetPoint('CENTER',0,0)
			Menu:Show()
		end	
	
	end

end