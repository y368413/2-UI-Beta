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
-----------------------------------------	     幻化增强    -----------------------------------------
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
--local DRF_menu1 = CreateFrame("FRAME","DRF_RaceMenu",DRF_button3,"UIDropDownMenuTemplate");
local DRF_menu1 = MSA_DropDownMenu_Create("DRF_RaceMenu", DRF_button3)

DRF_button1:SetPoint("BOTTOMLEFT",DressUpFrame,"BOTTOMLEFT",6,4);
DRF_button1:SetSize(70,22);
DRF_button1.text = _G["DRF_UndressButton"];
DRF_button1.text:SetText(CHARMS_NAKEDIZE);
DRF_button1:SetScript("OnClick",function(self,event,arg1) DressUpModel:Undress(); end);

DRF_button2:SetPoint("Center",DRF_UndressButton,"Center",62,0);
DRF_button2:SetSize(60,22);
DRF_button2.text = _G["DRF_TargetButton"];
DRF_button2.text:SetText(CHARMS_TARGET);
DRF_button2:SetScript("OnClick",function(self,event,arg1)
	if ( UnitIsPlayer("target") ) then
		local race, fileName = UnitRace("target");
		DressUpModel:SetUnit("target");
		SetDressUpBackground(DressUpFrame, fileName);
	else
		local race, fileName = UnitRace("player");
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

---------------------------------------------------------------daftDressUp
local daftDressUp_Scale = 1.21;
local daftDressUp_Hide = true;
local daftDressUp_Center = true;
local daftDressUp = CreateFrame("Frame");
daftDressUp:RegisterEvent("ADDON_LOADED");
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
--function daftDressUp:setPosition()
	--if daftDressUp_Center then
		--DressUpFrame:ClearAllPoints();
		--DressUpFrame:SetPoint("TOPLEFT", WorldFrame, "TOPLEFT", 12, -27);
		-- Fix Character frame pushing
		--UIPanelWindows["CharacterFrame"] =	{ area = "left", pushable = 0, whileDead = 1};
	--end;
--end;
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
	--[[DressUpModel:HookScript("OnEnter", function()
		daftDressUp:ShowFrameTextures(DressUpFrame);
		DressUpFrame.NineSlice:Show();
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
	end);]]
	WorldFrame:HookScript("OnEnter", function()
		daftDressUp:HideFrameTextures(DressUpFrame);	
		DressUpFrame.NineSlice:Hide();
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
		if event == "ADDON_LOADED" then
		if daftDressUp_Hide then daftDressUp:setHidden(); end;
		DressUpFrame:SetScale(daftDressUp_Scale);
	end;
end);
--Hooks
--CharacterFrame:HookScript("OnShow", function() daftDressUp:setPosition(); end);
--DressUpFrame:HookScript("OnShow", function() daftDressUp:setPosition(); end);
--hooksecurefunc("UpdateUIPanelPositions", function() daftDressUp:setPosition(); end);

-----------------------------------------	     随机队列倒计时    -----------------------------------------
local timerBar = CreateFrame("StatusBar", nil, LFGDungeonReadyPopup)
timerBar:SetPoint("BOTTOM", LFGDungeonReadyPopup, "TOP", 0, 0)
timerBar:SetSize(210, 12)
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
timerBar.Border:SetSize(266, 64)
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
ExtTransmogUI:RegisterEvent("ADDON_LOADED")
ExtTransmogUI:SetScript("OnEvent",function(self,event,addon)
    if addon=="Blizzard_Collections" then
		ExtTransmog_RebuildFrame()
		ExtTransmogUI:UnregisterEvent("ADDON_LOADED")
	end
end)

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