--Easy Scrapper by Motig ## Author: Motig  ## Version: 10
--LoadAddOn("Blizzard_ScrappingMachineUI")
ScrappingMachineFrame.ScrapButton.SetEnabledBackup = ScrappingMachineFrame.ScrapButton.SetEnabled --To prevent button mashers from scrapping while adding items

EasyScrap = {}
EasyScrap.addonVersion = 10
EasyScrap.saveData = {}

EasyScrap.itemCache = {}
EasyScrap.scrappableItems = {}
EasyScrap.eligibleItems = {}
EasyScrap.ignoredItems = {}
EasyScrap.filteredItems = {}
EasyScrap.queueItems = {}
EasyScrap.itemsInScrapper = {}
EasyScrap.failedItems = {}
EasyScrap.queueItemsToAdd = 0
EasyScrap.scrapInProgress = false
EasyScrap.itemIgnoreList = {}
EasyScrap.mouseInItem = false

EasyScrap.defaultSettings = {}

function EasyScrap:initializeSaveData()
    self.saveData = {}
    self.saveData.addonSettings = EasyScrap.defaultSettings
end

function EasyScrap:updateAddonSettings()
    for k,v in pairs(EasyScrap.defaultSettings) do
        if self.saveData.addonSettings[k] == nil then self.saveData.addonSettings[k] = v end
    end
end

BINDING_HEADER_EASYSCRAPHEAD = "Easy Scrap"
_G["BINDING_NAME_CLICK EasyScrap_ScrapKeybindFrame:LeftButton"] = "Scrap Item"

local keybindFrame = CreateFrame('Button', 'EasyScrap_ScrapKeybindFrame', nil, 'SecureActionButtonTemplate')
keybindFrame:SetAttribute('type', 'click')
keybindFrame:SetAttribute('clickbutton', ScrappingMachineFrame.ScrapButton)

--Interface\HelpFrame\HelpIcon-ReportAbuse




--Get all items eligible for scrapping.
function EasyScrap:getScrappableItems()
    --We have to rebuild the queue after an item has been scrapped
    local queueItemBackup = {}
    if #self.queueItems > 0 then
        for k,v in pairs(self.queueItems) do
            table.insert(queueItemBackup, {bag = self.scrappableItems[v].bag, slot = self.scrappableItems[v].slot, itemLink = self.scrappableItems[v].itemLink})
        end
    end

   self.eligibleItems = {}
   self.ignoredItems = {}
   self.scrappableItems = {}
   self.failedItems = {}

   local itemRef = 1
   
   for bag = 0, 4 do
      for i = 1, GetContainerNumSlots(bag) do
         local itemID = GetContainerItemID(bag, i)

         if itemID and EasyScrap:itemScrappable(itemID) then
            local texture, itemCount, locked, quality, readable, lootable, itemLink, isFiltered = GetContainerItemInfo(bag, i)
            local itemName, _, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemLink)
            --table.insert(self.scrappableItems, {itemRef = itemRef, bag = bag, slot = i, itemLink = itemLink, itemTexture = texture, itemCount = itemCount, itemID = itemID, itemQuality = quality, itemName = string.match(itemLink, "%[(.+)%]")})
            table.insert(self.scrappableItems, {itemRef = itemRef, bag = bag, slot = i, itemLink = itemLink, itemClassID = itemClassID, itemSubClassID = itemSubClassID, bindType = bindType, itemTexture = texture, itemCount = itemCount, itemID = itemID, itemQuality = quality, itemName = itemName, itemLevel = itemLevel})
            itemRef = itemRef + 1
         end
      end
   end
   
   --Finish queue rebuild check if everything is still correct
    if #self.queueItems > 0 then
        self.queueItems = {}
        for i = 1, #queueItemBackup do
            for z = 1, #self.scrappableItems do
                if self.scrappableItems[z].bag == queueItemBackup[i].bag and self.scrappableItems[z].slot == queueItemBackup[i].slot and self.scrappableItems[z].itemLink == queueItemBackup[i].itemLink then
                    table.insert(self.queueItems, z)
                end
            end
        end
    end
end

--Determine if item can be scrapped by checking if text is in tooltip
function EasyScrap:itemScrappable(itemID)
   if self.itemCache[itemID] ~= nil then
      return self.itemCache[itemID]
   else     
      self.tooltipReader:ClearLines()      
      if GetItemInfo(itemID) then
         self.tooltipReader:SetItemByID(itemID)
         for i = self.tooltipReader:NumLines(), self.tooltipReader:NumLines()-3, -1 do
            if i >= 1 then
               local text = _G["EasyScrapTooltipReaderTextLeft"..i]:GetText()                  
               if text == ITEM_SCRAPABLE_NOT then
                  self.itemCache[itemID] = false
                  return false
               elseif text == ITEM_SCRAPABLE then
                  self.itemCache[itemID] = true
                  return true
               end
            end
         end
         return false
      else
         table.insert(self.failedItems, itemID)
         return false
      end
   end
end

function EasyScrap:addQueueItems()
    if ScrappingMachineFrame:IsVisible() and not EasyScrap.scrapInProgress then
        ScrappingMachineFrame.ScrapButton:SetEnabled(false)
        ScrappingMachineFrame.ScrapButton.SetEnabled = function() end
        if #self.itemsInScrapper < 9 and #self.queueItems > 0 then
        --if self.queueItemsToAdd > 0 then
            --self.queueItemsToAdd = self.queueItemsToAdd - 1
            local key, nextItemRef = next(self.queueItems)
            table.remove(self.queueItems, key)
            UseContainerItem(self.scrappableItems[nextItemRef].bag, self.scrappableItems[nextItemRef].slot)

            if #self.itemsInScrapper == 9 or #self.queueItems == 0 then
            --if self.queueItemsToAdd == 0 then
                ScrappingMachineFrame.ScrapButton.SetEnabled = ScrappingMachineFrame.ScrapButton.SetEnabledBackup
                ScrappingMachineFrame.ScrapButton:SetEnabled(true) 
                EasyScrap.addingItems = false
            end
        else
            ScrappingMachineFrame.ScrapButton.SetEnabled = ScrappingMachineFrame.ScrapButton.SetEnabledBackup
            ScrappingMachineFrame.ScrapButton:SetEnabled(true)
            EasyScrap.addingItems = false
        end
    else
        EasyScrap.addingItems = false
    end
end

function EasyScrap:searchItem(text)
    for i = 1, #self.scrappableItems do
        if text and string.find(string.lower(self.scrappableItems[i].itemName), string.lower(text)) then
            self.scrappableItems[i].searchMatch = true
        else
            self.scrappableItems[i].searchMatch = false
        end
    end
end

function EasyScrap:itemInWardrobeSet(itemID, bag, slot)
    for i = 0, MAX_EQUIPMENT_SETS_PER_PLAYER-1 do
        local items = C_EquipmentSet.GetItemIDs(i)
        if items then
            for z = 1, 19 do --would be nicer to get the slot id beforehand so we don't have to loop over all the items in a set
                if items[z] then
                    if itemID == items[z] then
                        local equipmentSetInfo = C_EquipmentSet.GetItemLocations(i)
                        local onPlayer, inBank, inBags, inVoidStorage, slotNumber, bagNumber = EquipmentManager_UnpackLocation(equipmentSetInfo[z])
                        if bag == bagNumber and slot == slotNumber then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

function EasyScrap:itemMatchesFilter(i)
    --In next version we will be able to change the filters 
    if self:itemInWardrobeSet(self.scrappableItems[i].itemID, self.scrappableItems[i].bag, self.scrappableItems[i].slot) then
        self.scrappableItems[i].filterReason = NEWBIE_TOOLTIP_EQUIPMENT_MANAGER_IGNORE_SLOT 
        return true
    else
        return false
    end
end


function EasyScrap:filterScrappableItems()
    --Filter items
    local ignoredItems = {}
    local eligibleItems = {}
    local filteredItems = {}
    

    for i = 1, #self.scrappableItems do        
        if EasyScrap:itemInIgnoreList(self.scrappableItems[i].itemID, self.scrappableItems[i].itemName) then
            table.insert(ignoredItems, i)     
        elseif EasyScrap:itemMatchesFilter(i) then
            table.insert(filteredItems, i)            
        else
            table.insert(eligibleItems, i)     
        end
    end

    self.eligibleItems = eligibleItems
    self.ignoredItems = ignoredItems
    self.filteredItems = filteredItems
    
    EasyScrap:sortItems()
end

function EasyScrap:sortItems()
    local function sortFunction(a, b)
        local qualityA = self.scrappableItems[a].itemQuality
        local qualityB = self.scrappableItems[b].itemQuality
        --local searchMatchA = self.scrappableItems[a].searchMatch
        --local searchMatchB = self.scrappableItems[b].searchMatch
        
        if qualityA == qualityB then
            if self.scrappableItems[a].itemLevel == self.scrappableItems[b].itemLevel then
                return self.scrappableItems[a].itemName < self.scrappableItems[b].itemName
            else
                return self.scrappableItems[a].itemLevel > self.scrappableItems[b].itemLevel
            end
        else
            return qualityA > qualityB 
        end

    end

    table.sort(self.eligibleItems, sortFunction)   
    table.sort(self.ignoredItems, sortFunction) 
    table.sort(self.filteredItems, sortFunction) 
end

function EasyScrap:printEligibleItems()
    for k,v in pairs(self.eligibleItems) do
        print(v.itemLink)
    end
end

function EasyScrap:getItemsInScrapper()
    self.itemsInScrapper = {}
    for i = 0, 8 do
        local item = C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex(i)
        if item then
            item.scrapperSlot = i
            table.insert(self.itemsInScrapper, item)
        end
    end
end

function EasyScrap:removeItemFromScrapper(bag, slot)      
    for i = 1, #self.itemsInScrapper do
        if self.itemsInScrapper[i].bagID == bag and self.itemsInScrapper[i].slotIndex == slot then
            C_ScrappingMachineUI.RemoveItemToScrap(self.itemsInScrapper[i].scrapperSlot)
            break
        end
    end
end

function EasyScrap:itemInScrapper(bag, slot)
    for i = 1, #self.itemsInScrapper do
        local b,s = self.itemsInScrapper[i]:GetBagAndSlot()
        if b == bag and s == slot then
            return true
        end
    end
end

function EasyScrap:addItemToIgnoreList(itemID, itemName)
    if not self.itemIgnoreList[itemID] then
        self.itemIgnoreList[itemID] = {}
    end
 
    local duplicate = false
    for k,v in pairs(self.itemIgnoreList[itemID]) do
        if v == itemName then
            duplicate = true
        end
    end
    
    if not duplicate then
        table.insert(self.itemIgnoreList[itemID], itemName)
    end
end

function EasyScrap:removeItemFromIgnoreList(itemID, itemName)
    if self.itemIgnoreList[itemID] then
        for k,v in pairs(self.itemIgnoreList[itemID]) do
            if v == itemName then
                table.remove(self.itemIgnoreList[itemID], k)
            end
        end
    end
    
    if #self.itemIgnoreList[itemID] == 0 then self.itemIgnoreList[itemID] = nil end
end

function EasyScrap:itemInIgnoreList(itemID, itemName)
    if self.itemIgnoreList[itemID] then
        for k,v in pairs(self.itemIgnoreList[itemID]) do
            
            if v == itemName then
                return true
            end
        end
    end
    return false
end

--Scroll frame acting up because it always gets a weird yrange value
function ScrollFrame_OnScrollRangeChanged_EasyScrap(self, xrange, yrange)
	local name = self:GetName();
	local scrollbar = self.ScrollBar or _G[name.."ScrollBar"];
    _,yrange = scrollbar:GetMinMaxValues()
    
	-- Accounting for very small ranges
	yrange = floor(yrange);

	local value = min(scrollbar:GetValue(), yrange);
	--scrollbar:SetMinMaxValues(0, yrange);
	--scrollbar:SetValue(value);

	local scrollDownButton = scrollbar.ScrollDownButton or _G[scrollbar:GetName().."ScrollDownButton"];
	local scrollUpButton = scrollbar.ScrollUpButton or _G[scrollbar:GetName().."ScrollUpButton"];
	local thumbTexture = scrollbar.ThumbTexture or _G[scrollbar:GetName().."ThumbTexture"];

	if ( yrange == 0 ) then
		if ( self.scrollBarHideable ) then
			scrollbar:Hide();
			scrollDownButton:Hide();
			scrollUpButton:Hide();
			thumbTexture:Hide();
		else
			scrollDownButton:Disable();
			scrollUpButton:Disable();
			scrollDownButton:Show();
			scrollUpButton:Show();
			if ( not self.noScrollThumb ) then
				thumbTexture:Show();
			end
		end
	else
		scrollDownButton:Show();
		scrollUpButton:Show();
		scrollbar:Show();
		if ( not self.noScrollThumb ) then
			thumbTexture:Show();
		end
		-- The 0.005 is to account for precision errors
		if ( yrange - value > 0.005 ) then
			scrollDownButton:Enable();
		else
			scrollDownButton:Disable();
		end
	end

	-- Hide/show scrollframe borders
	local top = self.Top or name and _G[name.."Top"];
	local bottom = self.Bottom or name and _G[name.."Bottom"];
	local middle = self.Middle or name and _G[name.."Middle"];
	if ( top and bottom and self.scrollBarHideable ) then
		if ( self:GetVerticalScrollRange() == 0 ) then
			top:Hide();
			bottom:Hide();
		else
			top:Show();
			bottom:Show();
		end
	end
	if ( middle and self.scrollBarHideable ) then
		if ( self:GetVerticalScrollRange() == 0 ) then
			middle:Hide();
		else
			middle:Show();
		end
	end
end
