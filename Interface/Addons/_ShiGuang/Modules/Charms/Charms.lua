local _, ns = ...
local M, R, U, I = unpack(ns)
-- ALT+RightClick to buy a stack
local old_MerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
local cache = {}
function MerchantItemButton_OnModifiedClick(self, ...)
	if IsAltKeyDown() then
		local id = self:GetID()
		local itemLink = GetMerchantItemLink(id)
		if not itemLink then return end
		local name, _, quality, _, _, _, _, maxStack, _, texture = GetItemInfo(itemLink)
			if maxStack and maxStack > 1 then
			if not cache[itemLink] then
				StaticPopupDialogs["BUY_STACK"] = {
					text = CHARMS_BUY_STACK,
					button1 = YES,
					button2 = NO,
					OnAccept = function()
						BuyMerchantItem(id, GetMerchantItemMaxStack(id))
						cache[itemLink] = true
					end,
					hideOnEscape = 1,
					hasItemFrame = 1,
				}
				local r, g, b = GetItemQualityColor(quality or 1)
				StaticPopup_Show("BUY_STACK", " ", " ", {["texture"] = texture, ["name"] = name, ["color"] = {r, g, b, 1}, ["link"] = itemLink, ["index"] = id, ["count"] = maxStack})
			else
				BuyMerchantItem(id, GetMerchantItemMaxStack(id))
			end
		end
	end
	old_MerchantItemButton_OnModifiedClick(self, ...)
end

--[[-----------------------------------------	     货币监视    -----------------------------------------
local CurrencyEasy=CreateFrame("Frame","CurrencyEasy",UIParent)
	CurrencyEasy:SetSize(280,21)  --UIParent:GetWidth()*0.19
	CurrencyEasy:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 2)
	--CurrencyEasy:Hide()
	CurrencyEasy:SetMovable(true)
	CurrencyEasy:EnableMouse(true)
	CurrencyEasy:RegisterForDrag("LeftButton")
	CurrencyEasy:SetScript("OnDragStart", CurrencyEasy.StartMoving)
	CurrencyEasy:SetScript("OnDragStop", CurrencyEasy.StopMovingOrSizing)
	
local CurrencyFrame, Currency = CreateFrame("Frame","CurrencyEasy",CurrencyEasy), {1273,1149,1268,1155,1220}
--392 = Honor Points荣誉 390 = Conquest Points征服  994 = Seal of Tempered Fate钢化命运印记  823 = Apexis Crystal埃匹希斯水晶
--824 = Garrison Resources要塞资源 515 = Darkmoon Prize Ticket暗月票 738 = Lesser Charm of Good Fortune 944 = Artifact Fragment神器碎片
--810 = Black Iron Fragment黑铁碎片 980 = Dingy Iron Coins肮脏的铁币 789 = Bloody Coin染血的铸币 241 = Champion's Seal冠军的印记
--402 = Ironpaw Token铁掌印记 416 = Mark of the World Tree世界之树的印记 777 = Timeless Coin永恒铸币
--391 = Tol Barad Commendation托尔巴拉德奖章 776 = Warforged Seal战火铸币 1129 = 既定命运印记 1191 = 勇气
--1268 = Timeworn Artifact 上古神器 1149 = sightless-eye 盲目之眼 1154 = shadowy-coins 阴暗硬币
--1273 = seal-of-broken-fate 破碎命运印记 1220 = order-resources 职业大厅资源
--1226 = nethershard 虚空碎片 1275 = curious-coin 古怪硬币 1155 = ancient-mana 远古魔力
   CurrencyFrame.icon = {} 
   for i = 1, 5 do 
      local icon = CreateFrame("Frame", "CurrencyEasy", CurrencyEasy) 
      --icon:SetPoint("BOTTOMRIGHT", _G["Minimap"], "BOTTOMLEFT", 3, 20*i+2*(i-1)-10) 
      icon:SetPoint("BOTTOMRIGHT", CurrencyEasy, "BOTTOMRIGHT", 12*i+50*(i-1)-260, 2) 
      icon:SetSize(16, 16) 
      icon.texture = icon:CreateTexture(nil, "ARTWORK") 
      icon.texture:SetAllPoints(icon) 
      icon.texture:SetTexCoord(.1, .9, .1, .9) 
      icon.text = icon:CreateFontString() 
      icon.text:SetPoint("RIGHT", icon, "LEFT", -1, 0) 
      icon.text:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE") 
      icon.text:SetShadowOffset(1, 1) 
      icon.text:SetShadowColor(0,0,0,.8) 
      CurrencyFrame.icon[i] = icon 
   end 

local GetCurrencyInfo, select, sub = GetCurrencyInfo, select, string.sub 
   for i = 1, #Currency do 
      local label, _, icon = GetCurrencyInfo(Currency[i]) 
      CurrencyFrame.icon[i].texture:SetTexture(icon) 
      CurrencyFrame.icon[i]:SetScript("OnEnter", function() 
         _G["GameTooltip"]:ClearLines() 
         _G["GameTooltip"]:SetOwner(CurrencyFrame.icon[i], "ANCHOR_LEFT") 
         _G["GameTooltip"]:AddLine(sub(label, 1, 24)) 
         _G["GameTooltip"]:Show() 
      end) 
      CurrencyFrame.icon[i]:SetScript("OnLeave", function() 
         _G["GameTooltip"]:Hide() 
      end) 
   end 

   CurrencyFrame:RegisterEvent("CURRENCY_DISPLAY_UPDATE") 
   CurrencyFrame:SetScript("OnEvent", function() 
      for i = 1, #Currency do 
         CurrencyFrame.icon[i].text:SetText(select(2, GetCurrencyInfo(Currency[i]))) 
      end 
   end) ]]
   
-----------------------------------------	     幻化增强    -----------------------------------------
--local function Noop() end

local _backgroundList = {
	[1] = "Human",
	[2] = "Orc",  --兽人
	[3] = "Dwarf",  --矮人
	[4] = "NightElf",
	[5] = "Scourge",  --亡灵
	[6] = "Tauren",  --牛头人
	[7] = "Gnome",   --侏儒
	[8] = "Troll",  --巨魔
	[9] = "Goblin",  --地精
	[10] = "BloodElf",
	[11] = "Draenei",  --德莱尼
	[22] = "Worgen",  --狼人
	[24] = "Pandaren",  --熊猫
  [27] = "Nightborne",  --夜之子
  [28] = "HighmountainTauren",  --至高岭牛头人
  [29] = "VoidElf",   --虚空精灵
  [30] = "LightforgedDraenei"   --光铸德莱尼
};

local DRF_button1 = CreateFrame("Button","DRF_UndressButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button2 = CreateFrame("Button","DRF_TargetButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_button3 = CreateFrame("Button","DRF_RaceButton",DressUpFrame,"UIPanelButtonTemplate");
local DRF_menu1 = CreateFrame("FRAME","DRF_RaceMenu",DRF_button3,"UIDropDownMenuTemplate");


DRF_button1:SetPoint("BOTTOMLEFT",DressUpFrame,"BOTTOMLEFT",6,4);
DRF_button1:SetSize(70,22);
DRF_button1.text = _G["DRF_UndressButton"];
DRF_button1.text:SetText(CHARMS_NAKEDIZE);
DRF_button1:SetScript("OnClick",function(self,event,arg1)
	DressUpModel:Undress();
end);

DRF_button2:SetPoint("Center",DRF_UndressButton,"Center",62,0);
DRF_button2:SetSize(60,22);
DRF_button2.text = _G["DRF_TargetButton"];
DRF_button2.text:SetText(CHARMS_TARGET);
DRF_button2:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("target");

	if ( UnitIsPlayer("target") ) then
		DressUpModel:SetUnit("target");
		SetDressUpBackground(DressUpFrame, fileName);
	else
		race, fileName = UnitRace("player");
		DressUpModel:SetUnit("player");
		SetDressUpBackground(DressUpFrame, fileName);
	end
end);

DRF_button3:SetPoint("Center",DRF_TargetButton,"Center",42,0);
DRF_button3:SetSize(30,22);
DRF_button3.text = _G["DRF_RaceButton"];
DRF_button3.text:SetText("...");

local function DRF_SetArbitraryRace(id,gender)
	DressUpModel:SetCustomRace(id,gender);
	SetDressUpBackground(DressUpFrame, _backgroundList[id]);
	DressUpModel:TryOn(23323);
end

local function DRF_menu1_OnClick(self, arg1, arg2, checked)
	DRF_SetArbitraryRace(arg1,arg2);	
end

DRF_menu1:SetPoint("CENTER");
MSA_DropDownMenu_Initialize(DRF_menu1, function(self, level, menuList)
	local info = MSA_DropDownMenu_CreateInfo()
	if level == 1 then
		info.checked = false;
		info.text = CHARMS_MALE;
		info.menuList, info.hasArrow = 0, true;
		MSA_DropDownMenu_AddButton(info, level);
		info.text = CHARMS_FEMALE;
		info.menuList, info.hasArrow = 1, true;
		MSA_DropDownMenu_AddButton(info, level);
	else
		info.checked = false;
		info.func = DRF_menu1_OnClick;
		info.arg2 = menuList;
		info.text, info.arg1 = CHARMS_HUMAN, 1;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_ORC, 2;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_DWARF, 3;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_NIGHTELF, 4;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_SCOURGE, 5;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_TAUREN, 6;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_GNOME, 7;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_TROLL, 8;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_GOBLIN, 9;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_BLOODELF, 10;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_DRAENEI, 11;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_WORGEN, 22;
		MSA_DropDownMenu_AddButton(info, level);
		info.text, info.arg1 = CHARMS_PANDAREN, 24;
		MSA_DropDownMenu_AddButton(info, level);
    info.text, info.arg1 = CHARMS_NIGHTBORNE, 27; 
    MSA_DropDownMenu_AddButton(info, level); 
    info.text, info.arg1 = CHARMS_HIGHMOUNTAINTAUREN, 28; 
    MSA_DropDownMenu_AddButton(info, level); 
    info.text, info.arg1 = CHARMS_VOIDELF, 29; 
    MSA_DropDownMenu_AddButton(info, level); 
    info.text, info.arg1 = CHARMS_LIGHTFORGEDDRAENEI, 30; 
    MSA_DropDownMenu_AddButton(info, level); 
	end
end, "MENU");

DressUpFrameResetButton:SetScript("OnClick",function(self,event,arg1)
	local race, fileName = UnitRace("player");

	DressUpModel:SetUnit("player");
	DressUpModel:Dress();
	SetDressUpBackground(DressUpFrame, fileName);
	--PlaySound("gsTitleOptionOK");
end);

DRF_button3:SetScript("OnClick",function(self,event,arg1)
	MSA_ToggleDropDownMenu(1, nil, DRF_menu1, "cursor", 3, -3);
end);

--[[-------------------------------------------------------------daftDressUp
local daftDressUp_Scale = 1.6;
local daftDressUp_Hide = true;
local daftDressUp_Center = true;
local daftDressUp = CreateFrame("Frame");
daftDressUp:RegisterEvent("PLAYER_ENTERING_WORLD");
--Helper Functions
function daftDressUp:HideFrameTextures(Frame)
	for _, Region in pairs({ Frame:GetRegions() }) do
		if Region:IsObjectType("Texture") then 
			Region:Hide();
		end;
	end;
end;
function daftDressUp:ShowFrameTextures(Frame)
	for _, Region in pairs({ Frame:GetRegions() }) do
		if Region:IsObjectType("Texture") then 
			Region:Show();
		end;
	end;
end;
--Feature functions
function daftDressUp:setPosition()
	if daftDressUp_Center then
		DressUpFrame:ClearAllPoints();
		DressUpFrame:SetPoint("TOPLEFT", WorldFrame, "TOPLEFT", 12, -27);
		-- Fix Character frame pushing
		UIPanelWindows["CharacterFrame"] =	{ area = "left", pushable = 0, whileDead = 1};
	end;
end;
function daftDressUp:setHidden()	
	DressUpFrame:HookScript("OnShow", function()
		daftDressUp:HideFrameTextures(DressUpFrame);
		DressUpFrameCloseButton:Hide();
		DressUpFrameTitleText:Hide();
		DressUpFrameCancelButton:Hide();
		DressUpFrameResetButton:Hide();
		DressUpFrameOutfitDropDown:Hide();
		MaximizeMinimizeFrame:Hide();
		DressUpFrameInset:Hide();
		DRF_button1:Hide();
		DRF_button2:Hide();
		DRF_button3:Hide();
		--DRF_menu1:Hide()
	end);
	DressUpModel:HookScript("OnEnter", function()
		daftDressUp:ShowFrameTextures(DressUpFrame);
		DressUpFrameCloseButton:Show();
		DressUpFrameCancelButton:Show();
		DressUpFrameResetButton:Show();
		DressUpFrameOutfitDropDown:Show();
		MaximizeMinimizeFrame:Show();
		DressUpFrameInset:Show();
		DRF_button1:Show();
		DRF_button2:Show();
		DRF_button3:Show();
		--DRF_menu1:Show()
	end);
	WorldFrame:HookScript("OnEnter", function()
		daftDressUp:HideFrameTextures(DressUpFrame);	
		DressUpFrameCloseButton:Hide();
		DressUpFrameTitleText:Hide();
		DressUpFrameCancelButton:Hide();
		DressUpFrameResetButton:Hide();
		DressUpFrameOutfitDropDown:Hide();
		MaximizeMinimizeFrame:Hide();
		DressUpFrameInset:Hide();
		DRF_button1:Hide();
		DRF_button2:Hide();
		DRF_button3:Hide();
		--DRF_menu1:Hide()
	end);
end;
--Events
daftDressUp:SetScript("OnEvent", function(self, event, ...) 
		if event == "PLAYER_ENTERING_WORLD" then
		if daftDressUp_Hide then daftDressUp:setHidden(); end;
		DressUpFrame:SetScale(daftDressUp_Scale);
	end;
end);
--Hooks
CharacterFrame:HookScript("OnShow", function() daftDressUp:setPosition(); end);
DressUpFrame:HookScript("OnShow", function() daftDressUp:setPosition(); end);
hooksecurefunc("UpdateUIPanelPositions", function() daftDressUp:setPosition(); end);
]]
-----------------------------------------	     随机队列倒计时    -----------------------------------------
local timerBar = CreateFrame("StatusBar", nil, LFGDungeonReadyPopup)
timerBar:SetPoint("TOP", LFGDungeonReadyPopup, "BOTTOM", 0, -5)
timerBar:SetSize(190, 9)
timerBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar", "BORDER")
timerBar:SetStatusBarColor(1,.1,0)
timerBar:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	tile = true,
	tileSize = 32,
	insets = {left = -1, right = -1, top = -1, bottom = -1},
})
timerBar:Hide()

timerBar.Spark = timerBar:CreateTexture(nil, "OVERLAY")
timerBar.Spark:SetTexture"Interface\\CastingBar\\UI-CastingBar-Spark"
timerBar.Spark:SetSize(32, 32)
timerBar.Spark:SetBlendMode"ADD"
timerBar.Spark:SetPoint("LEFT", timerBar:GetStatusBarTexture(), "RIGHT", -15, 0)

timerBar.Border = timerBar:CreateTexture(nil, "ARTWORK")
timerBar.Border:SetTexture"Interface\\CastingBar\\UI-CastingBar-Border"
timerBar.Border:SetSize(256, 64)
timerBar.Border:SetPoint("TOP", timerBar, 0, 28)

timerBar.Text = timerBar:CreateFontString(nil, "OVERLAY")
timerBar.Text:SetFontObject(GameFontHighlight)
timerBar.Text:SetPoint("CENTER", timerBar, "CENTER")

local timeLeft = 0
timerBar:SetScript("OnUpdate", function(self, elapsed)
	timeLeft = (timeLeft or 0) - elapsed
	if(timeLeft <= 0) then return self:Hide() end
	self:SetValue(timeLeft)
	self.Text:SetFormattedText("%.1f", timeLeft)
end)

local eventFrame = CreateFrame"Frame"
eventFrame:RegisterEvent("LFG_PROPOSAL_SHOW") 
eventFrame:SetScript("OnEvent", function(self, event, ...)
	if (_G["BigWigsLoader"]) then return end
	timerBar:SetMinMaxValues(0, 40)
	timeLeft = 40
	timerBar:Show()
end)

-- Hide TalkingFrame
do
	local function NoTalkingHeads()
		hooksecurefunc(TalkingHeadFrame, "Show", function(self)
			self:Hide()
		end)
		TalkingHeadFrame.ignoreFramePositionManager = true
	end

local function NoTalkingHead(event, addon)
	if not MaoRUISettingDB["Misc"]["HideTalking"] then
			M:UnregisterEvent(event, NoTalkingHead)
		return
	end
	if event == "PLAYER_ENTERING_WORLD" then
			M:UnregisterEvent(event, NoTalkingHead)
		if IsAddOnLoaded("Blizzard_TalkingHeadUI") then
				NoTalkingHeads()
				M:UnregisterEvent("ADDON_LOADED", NoTalkingHead)
		end
	elseif event == "ADDON_LOADED" and addon == "Blizzard_TalkingHeadUI" then
			NoTalkingHeads()
			M:UnregisterEvent(event, NoTalkingHead)
		end
	end

	M:RegisterEvent("PLAYER_ENTERING_WORLD", NoTalkingHead)
	M:RegisterEvent("ADDON_LOADED", NoTalkingHead)
end

-- Extend Instance
do
	local bu = CreateFrame("Button", nil, RaidInfoFrame)
	bu:SetPoint("TOPRIGHT", -35, -5)
	bu:SetSize(25, 25)
	M.CreateIF(bu, true)
	bu.Icon:SetTexture(GetSpellTexture(80353))
	M.AddTooltip(bu, "ANCHOR_RIGHT", CHARMS_EXTEND, "system")

	bu:SetScript("OnMouseUp", function(_, btn)
		for i = 1, GetNumSavedInstances() do
			local _, _, _, _, _, extended, _, isRaid = GetSavedInstanceInfo(i)
			if isRaid then
				if btn == "LeftButton" then
					if not extended then
						SetSavedInstanceExtend(i, true)		-- extend
					end
				else
					if extended then
						SetSavedInstanceExtend(i, false)	-- cancel
					end
				end
			end
		end
		RequestRaidInfo()
		RaidInfoFrame_Update()
	end)
end

-------------------------------------------------------------------------------  Auto Reagent Bank
local AutoReagentBank = CreateFrame("Frame")
AutoReagentBank:RegisterEvent("BANKFRAME_OPENED")
AutoReagentBank:SetScript("OnEvent", function(self, event, ...)
  if not MaoRUISettingDB["Misc"]["AutoReagentBank"] then self:UnregisterAllEvents() return end
	if not BankFrameItemButton_Update_OLD then
		BankFrameItemButton_Update_OLD = BankFrameItemButton_Update
		
		BankFrameItemButton_Update = function(button)
			if BankFrameItemButton_Update_PASS == false then
				BankFrameItemButton_Update_OLD(button)
			else
				BankFrameItemButton_Update_PASS = false
			end
		end
	end
	
	BankFrameItemButton_Update_PASS = true
	DepositReagentBank()
end)

------------------------------------------------------------------------------- Auto screenshot when achieved
local function TakeScreen(delay, func, ...)
	local waitTable = {}
	local waitFrame = _G["TakeScreenWaitFrame"] or CreateFrame("Frame", "TakeScreenWaitFrame", UIParent)
	waitFrame:SetScript("OnUpdate", function(self, elapse)
		local count = #waitTable
		local i = 1
		while (i <= count) do
			local waitRecord = tremove(waitTable, i)
			local d = tremove(waitRecord, 1)
			local f = tremove(waitRecord, 1)
			local p = tremove(waitRecord, 1)
			if (d > elapse) then
				tinsert(waitTable, i, {d-elapse, f, p})
				i = i + 1
			else
				count = count - 1
				f(unpack(p))
			end
		end
	end)
	tinsert(waitTable, {delay, func, {...}})
end
local AchScreen = CreateFrame("Frame") 
AchScreen:RegisterEvent("ACHIEVEMENT_EARNED") 
AchScreen:SetScript("OnEvent", function()
  if not MaoRUISettingDB["Misc"]["AchievementPrintScreen"] then AchScreen:UnregisterAllEvents() return end
    TakeScreen(1, Screenshot)
end)

--[[----------------------------------------------------------------------------- ItemQualityIcons
hooksecurefunc("SetItemButtonQuality", function(button, quality, itemIDOrLink)
	button.IconBorder:Hide()

	local qualityIcon = button.qualityIcon
	if not qualityIcon then
		qualityIcon = CreateFrame("Frame", nil, button)
		qualityIcon:SetAllPoints()
		button.qualityIcon = qualityIcon
	end

	local iconColor = button.iconColor
	if not iconColor then
		iconColor = qualityIcon:CreateTexture("iconColor", "OVERLAY")
		iconColor:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex")
		iconColor:ClearAllPoints()
		iconColor:SetPoint("TOPRIGHT", -5, -5)
		iconColor:SetSize(9, 9)
	end

	if quality then
		if BAG_ITEM_QUALITY_COLORS[quality] and quality ~= 1 then
			iconColor:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b)
		elseif quality == 1 then
			iconColor:SetVertexColor(1, 1, 1)
		elseif quality == 0 then
			iconColor:SetVertexColor(0.61568, 0.61568, 0.61568)
		end

		button.qualityIcon:Show()
	else
		button.qualityIcon:Hide()
	end
end)]]

------------------------------------------------------------------------------- NiceDamage
--Local NiceDamage = CreateFrame("Frame", "NiceDamage");
--function NiceDamage:ApplySystemDamageFonts() DAMAGE_TEXT_FONT = "Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\RedCircl.ttf"; end
--NiceDamage:SetScript("OnEvent", function() if (event == "ADDON_LOADED") then NiceDamage:ApplySystemDamageFonts() end end);
--NiceDamage:RegisterEvent("ADDON_LOADED");
--NiceDamage:ApplySystemDamageFonts()


--## Title: Extended Transmog UI  ## Author: Germbread ## Version: 1.1.0
function ExtTransmog_RebuildFrame()
    WardrobeFrame:SetWidth(1200);
    --WardrobeFrame:SetScale(0.82);
    WardrobeTransmogFrame:SetWidth(535);
    WardrobeTransmogFrame.Model:ClearAllPoints();
    WardrobeTransmogFrame.Model:SetPoint("TOP", WardrobeTransmogFrame, "TOP", 0, -4);
    WardrobeTransmogFrame.Model:SetWidth(420);
    WardrobeTransmogFrame.Model:SetHeight(420);
    WardrobeTransmogFrame.Inset.BG:SetWidth(529);

    WardrobeTransmogFrame.Model.HeadButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.HeadButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", -238, -41);
    WardrobeTransmogFrame.Model.HandsButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.HandsButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "TOP", 235, -118);

    WardrobeTransmogFrame.Model.MainHandButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.MainHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", -26, -5);
    WardrobeTransmogFrame.Model.SecondaryHandButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.SecondaryHandButton:SetPoint("TOP", WardrobeTransmogFrame.Model, "BOTTOM", 27, -5);
    WardrobeTransmogFrame.Model.MainHandEnchantButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.MainHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.MainHandButton, "BOTTOM", 0, -20);
    WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:ClearAllPoints();
    WardrobeTransmogFrame.Model.SecondaryHandEnchantButton:SetPoint("BOTTOM", WardrobeTransmogFrame.Model.SecondaryHandButton, "BOTTOM", 0, -20);    
end
local ExtTransmogUI = CreateFrame("Frame")
ExtTransmogUI:SetScript("OnEvent",function(self,event,addon)
    if addon=="Blizzard_Collections" then
		ExtTransmog_RebuildFrame()
		ExtTransmogUI:UnregisterEvent("ADDON_LOADED")
	end
end)
ExtTransmogUI:RegisterEvent("ADDON_LOADED")

------------------------------ ## Notes: Automatically destroys items in the pre-defined list    ## Author: Tim @ WoW Interface    ## Version: 1.0
local itemList = {
	[2287] = true,		-- haunch of meat (tested in RFC)  肉排
	[1179] = true,		-- ice cold milk (tested in RFC)   冰镇牛奶
}
local DESTROY = CreateFrame("Frame", "AutoItemDestroyer")
DESTROY:RegisterEvent("BAG_UPDATE")
DESTROY:RegisterEvent("BAG_UPDATE_DELAYED")
DESTROY:RegisterEvent("CHAT_MSG_LOOT")
DESTROY:SetScript("OnEvent", function(_, event, ...)
   for bags = 0, 4 do
      for slots = 1, GetContainerNumSlots(bags) do
         local itemLink, linkID = GetContainerItemLink(bags, slots), GetContainerItemID(bags, slots)
         if (itemLink and linkID) then
            if (select(11, GetItemInfo(itemLink)) ~= nil and select(2, GetContainerItemInfo(bags, slots)) ~= nil) then
               local itemName, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ = GetItemInfo(linkID) 
               if itemList[linkID] then
                  PickupContainerItem(bags, slots)
                  DeleteCursorItem()
                  --print("Searched bags... FOUND & DESTROYED: |cff6699dd", itemName.." [ID: "..linkID.."]")
               end
            end
         end
      end
   end
end)