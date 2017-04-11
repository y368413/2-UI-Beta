-- helper function to check if we are interacting with the blood trader npc
local function IsBloodTrader()
  local guid = UnitGUID("npc")
  if not guid then return end
  local _, _, _, _, _, npcid = strsplit("-", guid)
  if not npcid then return end
  if tonumber(npcid) ~= 115264 then return end
  return true
end
-- CURRENCY HOOKS
MerchantFrame_UpdateCurrencies = function()
  local currencies = { GetMerchantCurrencies() }
  if IsBloodTrader() then
    currencies = { -124124, 1220 }
  end
  if ( #currencies == 0 ) then  -- common case
    MerchantFrame:UnregisterEvent("CURRENCY_DISPLAY_UPDATE")
    MerchantFrame:UnregisterEvent("BAG_UPDATE")
    MerchantMoneyFrame:SetPoint("BOTTOMRIGHT", -4, 8)
    MerchantMoneyFrame:Show()
    MerchantExtraCurrencyInset:Hide()
    MerchantExtraCurrencyBg:Hide()
  else
    MerchantFrame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
    MerchantFrame:RegisterEvent("BAG_UPDATE")
    MerchantExtraCurrencyInset:Show()
    MerchantExtraCurrencyBg:Show()
    local numCurrencies = #currencies
    if ( numCurrencies > 3 ) then
      MerchantMoneyFrame:Hide()
    else
      MerchantMoneyFrame:SetPoint("BOTTOMRIGHT", -169, 8)
      MerchantMoneyFrame:Show()
    end
    for index = 1, numCurrencies do
      local tokenButton = _G["MerchantToken"..index]
      -- if this button doesn't exist yet, create it and anchor it
      if ( not tokenButton ) then
        tokenButton = CreateFrame("BUTTON", "MerchantToken"..index, MerchantFrame, "BackpackTokenTemplate")
        -- token display order is: 6 5 4 | 3 2 1
        if ( index == 1 ) then
          tokenButton:SetPoint("BOTTOMRIGHT", -16, 8)
        elseif ( index == 4 ) then
          tokenButton:SetPoint("BOTTOMLEFT", 89, 8)
        else
          tokenButton:SetPoint("RIGHT", _G["MerchantToken"..index - 1], "LEFT", 0, 0)
        end
        tokenButton:SetScript("OnEnter", MerchantFrame_ShowCurrencyTooltip)
      end

      tokenButton.itemID = nil
      tokenButton.currencyID = nil
      
      local name, count, icon
      if currencies[index] < 0 then
        currencies[index] = -currencies[index]
        name = GetItemInfo(currencies[index]) or RETRIEVING_ITEM_INFO
        count = GetItemCount(currencies[index], true)
        icon = GetItemIcon(currencies[index])
        tokenButton.itemID = currencies[index]
      else
        name, count, icon = GetCurrencyInfo(currencies[index])
        tokenButton.currencyID = currencies[index]
      end
      if ( name and name ~= "" ) then
        if ( count <= 99999 ) then
          tokenButton.count:SetText(count)
        else
          tokenButton.count:SetText("*")
        end
        tokenButton.icon:SetTexture(icon)
        tokenButton:Show()
      else
        tokenButton.currencyID = nil
        tokenButton.itemID = nil
        tokenButton:Hide()
      end
    end
  end
  
  for i = #currencies + 1, MAX_MERCHANT_CURRENCIES do
    local tokenButton = _G["MerchantToken"..i]
    if ( tokenButton ) then
      tokenButton.currencyID = nil
      tokenButton.itemID = nil
      tokenButton:Hide()
    else
      break
    end
  end
end

-- handle itemids when updating currency amounts in merchant windows
MerchantFrame_UpdateCurrencyAmounts = function()
  for i = 1, MAX_MERCHANT_CURRENCIES do
    local tokenButton = _G["MerchantToken"..i]
    if not tokenButton then return end
    
    local _, count
    if (tokenButton.itemID) then
      count = GetItemCount(tokenButton.itemID, true)
    elseif (tokenButton.currencyID) then
      _, count = GetCurrencyInfo(tokenButton.currencyID)
    end
    if not count then return end
    
    if ( count <= 99999 ) then
      tokenButton.count:SetText(count)
    else
      tokenButton.count:SetText("*")
    end
  end
end

-- handle itemids for merchant currency tooltips
--local oldMerchantFrame_ShowCurrencyTooltip = MerchantFrame_ShowCurrencyTooltip
MerchantFrame_ShowCurrencyTooltip = function(self)
  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  if self.itemID then
    GameTooltip:SetItemByID(self.itemID)
  elseif self.currencyID then
    GameTooltip:SetCurrencyByID(self.currencyID)
  end
end

-- have merchant window listen for BAG_UPDATE and forward it to CURRENCY_DISPLAY_UPDATE
MerchantFrame:HookScript("OnEvent", function(self,event,...)
  if event == "BAG_UPDATE" then
    MerchantFrame_OnEvent(self, "CURRENCY_DISPLAY_UPDATE")
  end
end)

--  ITEMBUTTON CLICK HOOKS
local oldMerchantItemButton_OnClick = MerchantItemButton_OnClick
MerchantItemButton_OnClick = function(self, button, ...)
  -- ignore if not blood trader or on buyback tab
  if not IsBloodTrader() or MerchantFrame.selectedTab ~= 1 then return oldMerchantItemButton_OnClick(self, button, ...) end

  MerchantFrame.extendedCost = nil
  MerchantFrame.highPrice = nil
  
  if ( button == "LeftButton" ) then
    if ( MerchantFrame.refundItem ) then
      if ( ContainerFrame_GetExtendedPriceString(MerchantFrame.refundItem, MerchantFrame.refundItemEquipped)) then
        -- a confirmation dialog has been shown
        return
      end
    end

    PickupMerchantItem(self:GetID())
  else
    BuyMerchantItem(self:GetID())
  end
end

-- allow shift-clicking to buy stacks of items
local oldMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick
MerchantItemButton_OnModifiedClick = function(self, button, ...)
  -- ignore if not blood trader or on buyback tab
  if not IsBloodTrader() or MerchantFrame.selectedTab ~= 1 then return oldMerchantItemButton_OnModifiedClick(self, button, ...) end

  if ( HandleModifiedItemClick(GetMerchantItemLink(self:GetID())) ) then
    return
  end
  if ( IsModifiedClick("SPLITSTACK")) then
    local maxStack = GetMerchantItemMaxStack(self:GetID())
    -- if buying resource caches, max out at free bag space
    if self:GetID() == 1 then maxStack = MainMenuBarBackpackButton.freeSlots end
    
    -- hook splitstack callback to round up stacks to next multiple of stacksize
    if not self.oldSplitStack then
      self.oldSplitStack = self.SplitStack
      self.SplitStack = function(button, split, ...)
        if not IsBloodTrader() then return button.oldSplitStack(button, split, ...) end

        local _, _, _, stackCount = GetMerchantItemInfo(button:GetID())
        local maxStack = GetMerchantItemMaxStack(button:GetID())
        if button:GetID() == 1 then maxStack = MainMenuBarBackpackButton.freeSlots end

        -- round up to multiple of stack size
        if split % stackCount ~= 0 then
          split = min(maxStack, split + stackCount) -- stop it from going above maxStack
          local overage = split % stackCount
          split = split - overage
        end

        return button.oldSplitStack(button, split, ...)
      end
    end
    
    OpenStackSplitFrame(maxStack, self, "BOTTOMLEFT", "TOPLEFT")
  end
end

-- allow stacks of caches by buying 1 at a time in a loop
-- this is easier if we hook BuyMerchantItem
local oldBuyMerchantItem = BuyMerchantItem
BuyMerchantItem = function(index, amount, ...)
  if not IsBloodTrader() or index ~= 1 or amount == 1 or not amount then return oldBuyMerchantItem(index, amount, ...) end
  
  amount = min(amount, MainMenuBarBackpackButton.freeSlots)
  while amount > 0 do
    oldBuyMerchantItem(index, 1)
    oldBuyMerchantItem(0, 0) -- slight delay to prevent "item is busy" errors
    oldBuyMerchantItem(0, 0)
    amount = amount - 1
  end
end

-------------------------------------------------------------------------------------------------------
local MerchantFrame = _G.MerchantFrame
local GetMerchantFilter = _G.GetMerchantFilter
local UnitFactionGroup = _G.UnitFactionGroup
local GameToolTip = _G.GameToolTip
local UnitClass = _G.UnitClass
local GetNumSpecializations = _G.GetNumSpecializations
local GetSpecializationInfo = _G.GetSpecializationInfo
local SetPushed,Buttons

local spacing = 36

local alltexture,allcoord
do
	if UnitFactionGroup("player") == "Neutral" and select(2,UnitClass("player")) == "MONK" then
		alltexture = "Interface\\Glues\\AccountUpgrade\\upgrade-panda"
		allcoord = {0,1,0,1}
	else
		alltexture = "Interface\\COMMON\\icon-"..strlower(UnitFactionGroup("player"))
		allcoord = {0.25,0.75,0.2,0.8}
	end
end

local function BuildButtons()
	Buttons = {
		["ALL"] = {
			text = ALL,
			texture = alltexture,
			coord = allcoord,
			filter = LE_LOOT_FILTER_ALL,
			x = -10
		},
		["BOE"] = {
			text = ITEM_BIND_ON_EQUIP,
			texture = "Interface\\Buttons\\UI-GroupLoot-Coin-Up",
			coord = {0.1,0.9,0.1,0.9},
			filter = LE_LOOT_FILTER_BOE,
			x = -(spacing) - 10,
			y = 2
		},
		["CLASS"] = {
			text = select(1,UnitClass("player")),
			texture = "Interface\\WorldStateFrame\\ICONS-CLASSES",
			coord = CLASS_ICON_TCOORDS[select(2,UnitClass("player"))],
			filter = LE_LOOT_FILTER_CLASS,
			x = -(spacing*2) - 10
		}
	}

	local numSpecs = GetNumSpecializations();
	for i = 1, numSpecs do
		local arg1, name, arg3, icon = GetSpecializationInfo(i);
		Buttons["SPEC"..i] = {}
		Buttons["SPEC"..i].text = name;
		Buttons["SPEC"..i].texture = icon;
		Buttons["SPEC"..i].filter = LE_LOOT_FILTER_SPEC1 + i - 1;
		Buttons["SPEC"..i].coord = {0.1,0.9,0.1,0.9};
		Buttons["SPEC"..i].x = (-(spacing)*(i+2))-10;
	end
	
	SetPushed = function(Filter)
		for k,v in pairs(Buttons) do
			local button = _G["MFB_"..k]
			if Filter == v.filter or Filter == LE_LOOT_FILTER_ALL then
				SetDesaturation(_G["MFB_"..k.."_Overlay"], nil)
			else
				SetDesaturation(_G["MFB_"..k.."_Overlay"], 1)			
			end
			if Filter == v.filter then
				button.Flash.flasher:Play()				
				button:SetButtonState("PUSHED", 1)
			else
				if button.Flash.flasher:IsPlaying() then
					button.Flash.flasher:Stop()
				end
				button:SetButtonState("NORMAL")
			end
		end	
	end
	
	for k,v in pairs(Buttons) do
		local button = CreateFrame("Button","MFB_"..k,MerchantFrame,"MainMenuBarMicroButton")
		button.text = v.text
		button:SetPoint("TOPLEFT",MerchantFrame,"TOPRIGHT",-4,v.x)
		button:SetScript("OnEnter",function()
			GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
			GameTooltip:AddLine("便捷分类按钮");
			GameTooltip:AddLine(v.text);
			GameTooltip:Show();
		end)
		button:SetScript("OnLeave",function()
			GameTooltip:Hide();
		end)
		button:SetNormalTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Up");
		button:SetPushedTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Down");
		button:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight");
		button.overlay = button:CreateTexture("MFB_"..k.."_Overlay","OVERLAY")
		button.overlay:SetSize(18,20)
		button.overlay:SetPoint("TOP",button,"TOP",0,(-30-(v.y or 0)))
		button.overlay:SetTexture(v.texture)
		button.overlay:SetTexCoord(unpack(v.coord))
		button.Flash.flasher = button.Flash:CreateAnimationGroup()
		local fade1 = button.Flash.flasher:CreateAnimation("Alpha")
		fade1:SetDuration(0.5)
		fade1:SetToAlpha(1)
		fade1:SetOrder(1)
		local fade2 = button.Flash.flasher:CreateAnimation("Alpha")
		fade2:SetDuration(0.5)
		fade2:SetFromAlpha(1)
		fade2:SetOrder(2)
		button.Flash:SetAlpha(0)
		button.Flash:Show()
		button:SetScript("OnClick",function(self,button)
			MerchantFrame_SetFilter(MerchantFrame,v.filter)
			ShiGuangPerDB.filter = GetMerchantFilter()
			PlaySound("SPELLBOOKCHANGEPAGE")
			SetPushed(GetMerchantFilter())			
		end)
	end
end

local f = CreateFrame("frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("MERCHANT_FILTER_ITEM_UPDATE")
f:SetScript("OnEvent", function(self,event,...)
	local arg1, arg2 = ...
	if event == "PLAYER_ENTERING_WORLD" then
		if not ShiGuangPerDB then
			ShiGuangPerDB = {}
			ShiGuangPerDB.filter = GetMerchantFilter()
		end
		MerchantFrame_SetFilter(MerchantFrame, ShiGuangPerDB.filter)
		self:UnregisterEvent(event)
		MerchantFrameLootFilter:Hide()
		BuildButtons()
	elseif event == "MERCHANT_FILTER_ITEM_UPDATE" then
		SetPushed(GetMerchantFilter())
	end
end)

MerchantFrame:HookScript("OnShow", function()
	MerchantFrame_SetFilter(MerchantFrame, ShiGuangPerDB.filter)
	SetPushed(GetMerchantFilter())	
end)