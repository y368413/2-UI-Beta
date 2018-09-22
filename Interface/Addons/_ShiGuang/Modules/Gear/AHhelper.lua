--AH搜索上货
local  bag, slot
hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", function(self, button)
      bag, slot = self:GetParent():GetID(), self:GetID()
      local tLink = GetContainerItemLink(bag, slot)
      local tName = GetItemInfo(tLink) 
        if (button == 'LeftButton') and (IsAltKeyDown()) and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
            AuctionFrameTab3:Click()
             PickupContainerItem(bag, slot)
             ClickAuctionSellItemButton()
             ClearCursor()
        elseif (button == 'RightButton') and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
             AuctionFrameTab3:Click()
             PickupContainerItem(bag, slot)
             ClickAuctionSellItemButton()
             ClearCursor()
        elseif (button == 'LeftButton') and (IsShiftKeyDown()) and AuctionFrame and AuctionFrame:IsVisible() and not IsAddOnLoaded('AuctionLite') then
            if tLink then 
              AuctionFrameTab1:Click()
              BrowseName:SetText(tName)
              AuctionFrameBrowse_Search()   
            end
        end   
end)

local AHT = CreateFrame('Frame')
AHT:RegisterEvent('ADDON_LOADED')
AHT:SetScript('OnEvent', function(self, event, name)
    if(name == 'Blizzard_AuctionUI') and not IsAddOnLoaded('AuctionLite') then
        AHTEXT = CreateFrame('Button', 'SomeRandomButton123', AuctionFrame, 'UIPanelButtonTemplate')
        AHTEXT:SetPoint('TOPLEFT', AuctionFrame, 'TOPLEFT', 180, -26)
        AHTEXT:SetSize(1, 1)
        AHTEXT:SetText(GEAR_AHHELPER_AUTOSELL)
    end
end)

-- AH Gold Icon
local function formats(value)
	local str = ''
	if value > 9999 then
		str = str .. format('|c00ffd700%d●|r', floor(value / 10000))
	end
	if value > 99 and floor(value/100)%100 ~= 0 then
		str = str .. format('|c00c7c7cf%d●|r', (floor(value / 100) % 100))
	end
	if floor(value)%100 ~= 0 then
		str = str .. format('|c00eda55f%d●|r', (floor(value) % 100))
	end
	return str
end

-- AuctionPlus
hooksecurefunc("AuctionFrame_LoadUI", function()
	if AuctionFrameBrowse_Update then
		hooksecurefunc("AuctionFrameBrowse_Update", function()
			local numBatchAuctions = GetNumAuctionItems("list")
			local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
			for i=1, NUM_BROWSE_TO_DISPLAY do
				local index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page)
				if index <= numBatchAuctions + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page) then
					local name, _, count, _, _, _, _, _, _, buyoutPrice, bidAmount =  GetAuctionItemInfo("list", offset + i)
					local alpha = 0.5
					local color = "yellow"
					if name then
						local itemName = _G["BrowseButton"..i.."Name"]
						local moneyFrame = _G["BrowseButton"..i.."MoneyFrame"]
						local buyoutMoney = _G["BrowseButton"..i.."BuyoutFrameMoney"]
						if (buyoutPrice/10000) >= 9999 then color = "red" end
						if bidAmount > 0 then
							name = name .. " |cffffff00[￥]|r"
							alpha = 1.0
						end
						if (buyoutPrice > 0) and (count > 1) then
							name = name .. " |cffffff00("..formats(floor(buyoutPrice / count)).."|cffffff00)|r"
						end
						itemName:SetText(name)
						moneyFrame:SetAlpha(alpha)
						SetMoneyFrameColor(buyoutMoney:GetName(), color)
					end
				end
			end
		end)
	end
end)


-- daftAuction
local daftAuction =  CreateFrame("Frame");
daftAuction:RegisterEvent("AUCTION_HOUSE_SHOW");
daftAuction:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");

local selectedItem;
local selectedItemVendorPrice;
local selectedItemQuality;
local currentPage = 0;
local myBuyoutPrice, myStartPrice;
local myName = UnitName("player");

daftAuction:SetScript("OnEvent", function(self, event)
	if event == "AUCTION_HOUSE_SHOW" and not IsAddOnLoaded("AuctionsMaster") then		
		AuctionsItemButton:HookScript("OnEvent", function(self, event)			
			if event=="NEW_AUCTION_UPDATE" then -- user placed an item into auction item box
				self:SetScript("OnUpdate", nil);
				myBuyoutPrice = nil;
				myStartPrice = nil;
				currentPage = 0;
				selectedItem = nil;
				selectedItem, texture, count, quality, canUse, price, _, stackCount, totalCount, selectedItemID = GetAuctionSellItemInfo();
				local canQuery = CanSendAuctionQuery();
				if canQuery and selectedItem then -- query auction house based on item name
					ResetCursor();
					QueryAuctionItems(selectedItem);
				end;
			end;
		end);

	elseif event == "AUCTION_ITEM_LIST_UPDATE" and not IsAddOnLoaded("AuctionLite") then -- the auction list was updated or sorted
		if (selectedItem ~= nil) then -- an item was placed in the auction item box
			local batch, totalAuctions = GetNumAuctionItems("list");
			if totalAuctions == 0 then -- No matches
				_, _, selectedItemQuality, selectedItemLevel, _, _, _, _, _, _, selectedItemVendorPrice = GetItemInfo(selectedItem);
							
				--if PRICE_BY == "QUALITY" then			
					if selectedItemQuality == 0 then myBuyoutPrice = 100000 end;
					if selectedItemQuality == 1 then myBuyoutPrice = 200000 end;
					if selectedItemQuality == 2 then myBuyoutPrice = 2000000 end;
					if selectedItemQuality == 3 then myBuyoutPrice = 5000000 end;
					if selectedItemQuality == 4 then myBuyoutPrice = 10000000 end;
				--elseif PRICE_BY == "VENDOR" then			
					--if selectedItemQuality == 0 then myBuyoutPrice = selectedItemVendorPrice * 20 end;
					--if selectedItemQuality == 1 then myBuyoutPrice = selectedItemVendorPrice * 30 end;
					--if selectedItemQuality == 2 then myBuyoutPrice = selectedItemVendorPrice * 40 end;
					--if selectedItemQuality == 3 then myBuyoutPrice = selectedItemVendorPrice * 50 end;
					--if selectedItemQuality == 4 then myBuyoutPrice = selectedItemVendorPrice * 60 end;
				--end;
				
				myStartPrice = myBuyoutPrice;
			end;
			
			local currentPageCount = floor(totalAuctions/50);
			
			for i=1, batch do -- SCAN CURRENT PAGE
				local postedItem, _, count, _, _, _, _, minBid, _, buyoutPrice, _, _, _, owner = GetAuctionItemInfo("list",i);
				
				if postedItem == selectedItem and owner ~= myName and buyoutPrice ~= nil then -- selected item matches the one found on auction list
					
					if myBuyoutPrice == nil and myStartPrice == nil then
						myBuyoutPrice = (buyoutPrice/count) * .97;
						myStartPrice = (minBid/count) * .97;
					
					elseif myBuyoutPrice > (buyoutPrice/count) then
						myBuyoutPrice = (buyoutPrice/count) * .97;
						myStartPrice = (minBid/count) * .97;
					end;
				end;
			end;
			
			if currentPage < currentPageCount then -- GO TO NEXT PAGES			
				self:SetScript("OnUpdate", function(self, elapsed)			
					if not self.timeSinceLastUpdate then 
						self.timeSinceLastUpdate = 0 ;
					end;
					self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed;
					
					if self.timeSinceLastUpdate > .1 then -- a cycle has passed, run this
						selectedItem = GetAuctionSellItemInfo();
						local canQuery = CanSendAuctionQuery();
						
						if canQuery then -- check the next page of auctions
							currentPage = currentPage + 1;
							QueryAuctionItems(selectedItem, nil, nil, currentPage);
							self:SetScript("OnUpdate", nil);
						end;
						self.timeSinceLastUpdate = 0;
					end;
				end);
			
			else -- ALL PAGES SCANNED
				self:SetScript("OnUpdate", nil);
				local stackSize = AuctionsStackSizeEntry:GetNumber();
				if myStartPrice ~= nil then				
					if stackSize > 1 then -- this is a stack of items				
						if MSA_DropDownMenu_GetSelectedValue(PriceDropDown) == 1 then -- input price per item
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice);
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice);
						else -- input price for entire stack
							MoneyInputFrame_SetCopper(StartPrice, myStartPrice*stackSize);
							MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice*stackSize);
						end;
						
					else -- this is not a stack
						MoneyInputFrame_SetCopper(StartPrice, myStartPrice);
						MoneyInputFrame_SetCopper(BuyoutPrice, myBuyoutPrice);
					end;
					if MSA_DropDownMenu_GetSelectedValue(DurationDropDown) ~= 3 then 
						MSA_DropDownMenu_SetSelectedValue(DurationDropDown, 3); -- set duration to 3 (48h)
						DurationDropDownText:SetText("48 H"); -- set duration text since it keeps bugging to "Custom"  48 Hours
					end;
				end;
					
				myBuyoutPrice = nil;
				myStartPrice = nil;
				currentPage = 0;
				selectedItem = nil;
				stackSize = nil;
			end;
		end;
	end;
end);

-------------------------------------------------------------Tipachu v1.2 by Tuller
--add icon to the tooltip
local function setTooltipIcon(self, icon)
	local title = icon and _G[self:GetName() .. 'TextLeft1']
	if title then
		title:SetFormattedText('|T%s:21|t %s', icon, title:GetText())
	end
end
--tooltip hooking generator
local function newTooltipHooker(method, func)
	return function(tooltip)
		local modified = false
		tooltip:HookScript('OnTooltipCleared', function(self, ...) modified = false end)
		tooltip:HookScript(method, function(self, ...)
			if not modified  then
				modified = true
				func(self, ...)
			end
		end)
	end
end
--local hookItem = newTooltipHooker('OnTooltipSetItem', function(self, ...)
	--local name, link = self:GetItem()
	--if link then
		--setTooltipIcon(self, GetItemIcon(link))
	--end
--end)
local hookSpell = newTooltipHooker('OnTooltipSetSpell', function(self, ...)
	local name, rank, id = self:GetSpell()
	if id then
		setTooltipIcon(self, GetSpellTexture(id))
	end
end)
--hook tooltips
for _, tooltip in pairs{GameTooltip, ItemRefTooltip} do
	--hookItem(tooltip)
	hookSpell(tooltip)
end