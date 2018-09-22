EasyScrap.tooltipReader = CreateFrame('GameTooltip', "EasyScrapTooltipReader", nil, "GameTooltipTemplate")
EasyScrap.tooltipReader:SetOwner(UIParent, "ANCHOR_NONE")

local EasyScrap = EasyScrap

local parentFrame = CreateFrame('Frame', 'EasyScrapParentFrame', ScrappingMachineFrame)
parentFrame:SetPoint('TOP', ScrappingMachineFrame, 'BOTTOM', 0, 3)
parentFrame:SetSize(ScrappingMachineFrame:GetWidth()-16, 243)
parentFrame:EnableMouse(true)
parentFrame:SetFrameLevel(ScrappingMachineFrame:GetFrameLevel()-1)
parentFrame:RegisterEvent("PLAYER_LOGOUT")
parentFrame:RegisterEvent("ADDON_LOADED")
parentFrame:SetBackdrop({
      bgFile="Interface\\FrameGeneral\\UI-Background-Marble", 
      edgeFile='Interface/Tooltips/UI-Tooltip-Border', 
      tile = false, tileSize = 16, edgeSize = 16,
      insets = { left = 4, right = 4, top = 4, bottom = 4 }}
)

local mainFrame = CreateFrame('Frame', 'EasyScrapMainFrame', parentFrame)
mainFrame:SetAllPoints()

mainFrame.searchBox = CreateFrame('EditBox', nil, mainFrame, 'SearchBoxTemplate')
mainFrame.searchBox:SetPoint('TOPLEFT', 21, -8)
mainFrame.searchBox:SetSize(180, 21)
mainFrame.searchBox.Instructions:SetText('...')
mainFrame.searchBox.isEmpty = true
mainFrame.searchBox:SetScript('OnTextChanged', function(searchBox, value)
	if ( not searchBox:HasFocus() and searchBox:GetText() == "" ) then
		searchBox.searchIcon:SetVertexColor(0.6, 0.6, 0.6);
		searchBox.clearButton:Hide();
	else
		searchBox.searchIcon:SetVertexColor(1.0, 1.0, 1.0);
		searchBox.clearButton:Show();
	end
	InputBoxInstructions_OnTextChanged(searchBox);

    if value then
        local text = searchBox:GetText()
        if string.len(text) > 0 then
            searchBox.isEmpty = false
            EasyScrap:searchItem(text)
            EasyScrap:filterScrappableItems()
            EasyScrap.itemFrame:displayState()
        else
            --Clear results
            searchBox.isEmpty = true
            EasyScrap:searchItem()
            EasyScrap:filterScrappableItems()
            EasyScrap.itemFrame:displayState()
        end
    else
        --Clear results
        searchBox.isEmpty = true
        EasyScrap:searchItem()
        EasyScrap:filterScrappableItems()
        EasyScrap.itemFrame:displayState()
    end
end)

local queueAllButton = CreateFrame('Button', nil, mainFrame, 'GameMenuButtonTemplate')
queueAllButton:SetSize(100, 21)
queueAllButton:SetPoint('TOPRIGHT', -12, -12)
queueAllButton:SetText(SOCIAL_QUEUE_TOOLTIP_HEADER..ALL)
queueAllButton:SetScript('OnClick', function() EasyScrapItemFrame:queueAllItems() end)

mainFrame.queueAllButton = queueAllButton

mainFrame:SetScript('OnShow', function()
    EasyScrap:filterScrappableItems()
    EasyScrapItemFrame:updateContent()
end)
EasyScrap.mainFrame = mainFrame
EasyScrap.parentFrame = parentFrame


local itemFrame = CreateFrame('Frame', 'EasyScrapItemFrame', EasyScrapMainFrame)
itemFrame:SetPoint('TOPLEFT', 12, -36)
--itemFrame:SetPoint('BOTTOMRIGHT', -32, 42)
itemFrame:SetSize(273, 172)
itemFrame:SetBackdrop({
    -- bgFile="Interface\\FrameGeneral\\UI-Background-Marble", 
    edgeFile='Interface/Tooltips/UI-Tooltip-Border', 
    tile = false, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }})
itemFrame:SetBackdropBorderColor(.9, .9, .9, 1)
itemFrame.contentState = 2
itemFrame.maxTabWidth = 300
itemFrame.timeElapsed = 0
itemFrame:SetScript('OnUpdate', function(self, dt)
    self.timeElapsed = self.timeElapsed + dt
    if self.timeElapsed > 0.25 then
        self.timeElapsed = 0
        if EasyScrap.mouseInItem then  --and IsModifiedClick("COMPAREITEMS")
            GameTooltip_ShowCompareItem(GameTooltip)
        elseif EasyScrap.mouseInItem then  --and not IsModifiedClick("COMPAREITEMS")
            GameTooltip_HideShoppingTooltips(GameTooltip)
        end
    end
end)

itemFrame.scrollFrame = CreateFrame('ScrollFrame', nil, itemFrame, "UIPanelScrollFrameTemplate")
itemFrame.scrollFrame:SetPoint('TOPLEFT', 0, -4)
itemFrame.scrollFrame:SetPoint('BOTTOMRIGHT', 0, 4)
itemFrame.scrollFrame:SetClipsChildren(false)
itemFrame.scrollFrame:SetScript('OnScrollRangeChanged', ScrollFrame_OnScrollRangeChanged_EasyScrap)
itemFrame.scrollFrame.ScrollBar.scrollStep = 25

itemFrame.scrollFrame.ScrollBar.t = itemFrame.scrollFrame.ScrollBar:CreateTexture(nil, 'BACKGROUND')
itemFrame.scrollFrame.ScrollBar.t:SetAllPoints()
itemFrame.scrollFrame.ScrollBar.t:SetColorTexture(0, 0, 0, 0.6)

itemFrame.contentFrame = CreateFrame('Frame', 'EasyScrapItemFrameContent', itemFrame.scrollFrame)
itemFrame.contentFrame:SetFrameLevel(9)
itemFrame.contentFrame:SetWidth(itemFrame:GetWidth())
itemFrame.contentFrame:SetHeight(itemFrame:GetHeight())
--print(itemFrame:GetHeight())

itemFrame.contentFrame.bg = itemFrame.contentFrame:CreateTexture(nil, 'BACKGROUND')
--itemFrame.contentFrame.bg:SetPoint('TOPLEFT', 4, -4)
--itemFrame.contentFrame.bg:SetPoint('BOTTOMRIGHT', -4, 4)
itemFrame.contentFrame.bg:SetPoint('TOP')
itemFrame.contentFrame.bg:SetSize(itemFrame.contentFrame:GetWidth()-8, 1024)

itemFrame.contentFrame.bg:SetColorTexture(0, 0, 0, 1)

itemFrame.scrollFrame:SetScrollChild(itemFrame.contentFrame)


itemFrame.tabButtons = {}
local tabText = {SOCIAL_QUEUE_TOOLTIP_HEADER.." (%d)", OBLITERATE_BUTTON.." (%d)", IGNORE.." (%d)"}

for i = 1, 3 do
    local button = CreateFrame('Button', 'EasyScrapItemFrameTabButton'..i, itemFrame, 'EasyScrapFrameTabButtonTemplate')
    
    if i > 1 then
        button:SetPoint('LEFT', itemFrame.tabButtons[i-1], 'RIGHT', -18, 0)
    else
        button:SetPoint('BOTTOMLEFT', -1, -30) 
    end
    button:SetText(tabText[i])
    button.state = i
    PanelTemplates_DeselectTab(button)

    button:SetScript('OnClick', function()
        EasyScrapItemFrame.switchContentState(i)
    end)
    
    function button:SetCount(count)
        if self.state == 1 then
            if count > 0 then
                AutoCastShine_AutoCastStart(itemFrame.tabButtons[1].shineFrame)
            else
                AutoCastShine_AutoCastStop(itemFrame.tabButtons[1].shineFrame)
            end
        end
        self:SetText(string.format(tabText[i], count))
    end
    
    itemFrame.tabButtons[i] = button
end

ignoreItemFrame = CreateFrame('Frame', nil, itemFrame)
ignoreItemFrame:SetFrameLevel(itemFrame.contentFrame:GetFrameLevel()+1)
ignoreItemFrame:SetAllPoints()

ignoreItemFrame.bg = ignoreItemFrame:CreateTexture(nil, 'BACKGROUND')
ignoreItemFrame.bg:SetPoint('TOPLEFT', 4, -4)
ignoreItemFrame.bg:SetPoint('BOTTOMRIGHT', -4, 4)
ignoreItemFrame.bg:SetColorTexture(0, 0, 0, 1)

ignoreItemFrame.headerText = ignoreItemFrame:CreateFontString()
ignoreItemFrame.headerText:SetFontObject("GameFontNormalLarge")
--ignoreItemFrame.headerText:SetText(EASYSCRAP_IGNORED_ADDITEM)
ignoreItemFrame.headerText:SetPoint('TOP', 0, -14)

ignoreItemFrame.itemName = ignoreItemFrame:CreateFontString()
ignoreItemFrame.itemName:SetFontObject("GameFontNormal")
ignoreItemFrame.itemName:SetText('Test')
ignoreItemFrame.itemName:SetPoint('TOP', ignoreItemFrame.headerText, 'BOTTOM', 0, -8)


ignoreItemFrame.itemButton = CreateFrame('Button', 'EasyScrapIgnoreItemButton', ignoreItemFrame, "EasyScrapItemButtonTemplate")
--ignoreItemFrame.itemButton:SetPoint('TOP', ignoreItemFrame.itemName, 'BOTTOM', 0, -8)
ignoreItemFrame.itemButton:SetPoint('LEFT', 43, 6)
ignoreItemFrame.itemButton:SetScale(1.4, 1.4)


ignoreItemFrame.ignoreItemText = ignoreItemFrame:CreateFontString()
ignoreItemFrame.ignoreItemText:SetFontObject("GameFontNormalSmall")
ignoreItemFrame.ignoreItemText:SetText(IGNORE.." ?")
ignoreItemFrame.ignoreItemText:SetTextColor(1, 1, 1, 1)
ignoreItemFrame.ignoreItemText:SetWidth(80)
ignoreItemFrame.ignoreItemText:SetPoint('LEFT', ignoreItemFrame.itemButton, 'RIGHT', 8, 0)

ignoreItemFrame.okayButton = CreateFrame('Button', nil, ignoreItemFrame, 'GameMenuButtonTemplate')
ignoreItemFrame.okayButton:SetText('√')
ignoreItemFrame.okayButton:SetWidth(96)
ignoreItemFrame.okayButton:SetPoint('BOTTOMLEFT', 32, 26)
ignoreItemFrame.okayButton:SetScript('OnClick', function() EasyScrap:addItemToIgnoreList(EasyScrap.scrappableItems[ignoreItemFrame.itemRef].itemID, EasyScrap.scrappableItems[ignoreItemFrame.itemRef].itemLink) EasyScrap:filterScrappableItems() itemFrame:updateContent() end)

ignoreItemFrame.cancelButton = CreateFrame('Button', nil, ignoreItemFrame, 'GameMenuButtonTemplate')
ignoreItemFrame.cancelButton:SetText('X')
ignoreItemFrame.cancelButton:SetWidth(96)
ignoreItemFrame.cancelButton:SetPoint('BOTTOMRIGHT', -32, 26)
ignoreItemFrame.cancelButton:SetScript('OnClick', function() itemFrame:displayState() end)

ignoreItemFrame:Hide()

ignoreItemFrame:SetScript('OnShow', function(self)
    if self.itemRef and self.itemRef > 0 and EasyScrap.scrappableItems[self.itemRef] then
        local itemToIgnore = EasyScrap.scrappableItems[self.itemRef]
        
        self.itemName:SetText('['..itemToIgnore.itemName..']')
        self.itemName:SetTextColor(ITEM_QUALITY_COLORS[itemToIgnore.itemQuality].r, ITEM_QUALITY_COLORS[itemToIgnore.itemQuality].g, ITEM_QUALITY_COLORS[itemToIgnore.itemQuality].b)
        
        SetItemButtonTexture(self.itemButton, itemToIgnore.itemTexture)
        SetItemButtonCount(self.itemButton, itemToIgnore.itemCount);
        SetItemButtonQuality(self.itemButton, itemToIgnore.itemQuality, itemToIgnore.itemLink)  
        
        self.itemButton:SetScript('OnEnter', function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT") GameTooltip:SetHyperlink(itemToIgnore.itemLink) GameTooltip:Show() end)
        self.itemButton:SetScript('OnLeave', function(self) GameTooltip_Hide() end)
        
        if not EasyScrap:itemInIgnoreList(itemToIgnore.itemID, itemToIgnore.itemName) then
	    --ignoreItemFrame.headerText:SetText(EASYSCRAP_IGNORED_ADDITEM)
	    ignoreItemFrame.ignoreItemText:SetText(IGNORE.." ?")
            ignoreItemFrame.okayButton:SetScript('OnClick', function() EasyScrap:addItemToIgnoreList(itemToIgnore.itemID, itemToIgnore.itemName) EasyScrap:filterScrappableItems() itemFrame:updateContent() end)
        else
	    --ignoreItemFrame.headerText:SetText(EASYSCRAP_IGNORED_CANCEL)
	    ignoreItemFrame.ignoreItemText:SetText(CANCEL..IGNORE.." ?")
            ignoreItemFrame.okayButton:SetScript('OnClick', function() EasyScrap:removeItemFromIgnoreList(itemToIgnore.itemID, itemToIgnore.itemName) EasyScrap:filterScrappableItems() itemFrame:updateContent() end)
        end
    end
end)

ignoreItemFrame:SetScript('OnHide', function(self)
    self.itemRef = nil
end)

itemFrame.ignoreItemFrame = ignoreItemFrame

local ignoreHeader = CreateFrame('Frame', nil, itemFrame.contentFrame)
ignoreHeader:SetSize(itemFrame.contentFrame:GetWidth(), 24)
ignoreHeader:SetPoint('TOP', 0, -4)

ignoreHeader.text = ignoreHeader:CreateFontString()
ignoreHeader.text:SetFontObject("GameFontNormalLarge")
ignoreHeader.text:SetText(IGNORE)
ignoreHeader.text:SetWidth(180)
ignoreHeader.text:SetPoint('CENTER')

local r,g,b = ignoreHeader.text:GetTextColor()
ignoreHeader.l = ignoreHeader:CreateTexture(nil, 'BACKGROUND')
ignoreHeader.l:SetColorTexture(r,g,b, 0.8)
ignoreHeader.l:SetSize(85, 2)
ignoreHeader.l:SetPoint('LEFT', 12, 0)

ignoreHeader.r = ignoreHeader:CreateTexture(nil, 'BACKGROUND')
ignoreHeader.r:SetColorTexture(r,g,b, 0.8)
ignoreHeader.r:SetSize(85, 2)
ignoreHeader.r:SetPoint('RIGHT', -12, -0)




local filterHeader = CreateFrame('Frame', nil, itemFrame.contentFrame)
filterHeader:SetSize(itemFrame.contentFrame:GetWidth(), 24)
filterHeader:SetPoint('TOP', 0, -66)

filterHeader.text = filterHeader:CreateFontString()
filterHeader.text:SetFontObject("GameFontNormalLarge")
filterHeader.text:SetText(CALENDAR_FILTERS)
filterHeader.text:SetWidth(180)
filterHeader.text:SetPoint('CENTER')

filterHeader.l = filterHeader:CreateTexture(nil, 'BACKGROUND')
filterHeader.l:SetColorTexture(r,g,b, 0.8)
filterHeader.l:SetSize(85, 2)
filterHeader.l:SetPoint('LEFT', 12, 0)

filterHeader.r = filterHeader:CreateTexture(nil, 'BACKGROUND')
filterHeader.r:SetColorTexture(r,g,b, 0.8)
filterHeader.r:SetSize(85, 2)
filterHeader.r:SetPoint('RIGHT', -12, -0)

itemFrame.contentFrame.ignoreHeader = ignoreHeader
itemFrame.contentFrame.filterHeader = filterHeader

EasyScrap.itemFrame = itemFrame

local itemFrame = EasyScrapItemFrame
local contentFrame = itemFrame.contentFrame
local EasyScrap = EasyScrap
local itemButtonsVisible = 0

contentFrame.itemButtons = {}

local function updateQueueTab()
    itemFrame.tabButtons[1]:SetCount(#EasyScrap.queueItems)
end

local function itemInQueue(itemRef)
    for k,v in pairs(EasyScrap.queueItems) do
        if v == itemRef then return true end
    end
    return false
end

local function addItemToQueue(itemButton)
    table.insert(EasyScrap.queueItems, itemButton.itemRef)
    
    SetItemButtonDesaturated(itemButton, true)
    itemButton.IconBorder:Hide()
    AutoCastShine_AutoCastStart(itemButton.shineFrame)

    updateQueueTab()
end

local function removeItemFromQueue(itemButton)
    for k,v in pairs(EasyScrap.queueItems) do
        if v == itemButton.itemRef then table.remove(EasyScrap.queueItems, k) break end
    end
    SetItemButtonDesaturated(itemButton, false)
    itemButton.IconBorder:Show()
    AutoCastShine_AutoCastStop(itemButton.shineFrame)       

    if itemFrame.contentState == 1 then
        itemFrame:updateContent()
    else
        updateQueueTab()
    end
end

local function selectItemForScrapping(self)
    local scrappableItems = EasyScrap.scrappableItems
    --CHECK IF BUTTON IS STILL THE SAME ITEM?
    local itemInScrapper = EasyScrap:itemInScrapper(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
    local itemInQueue = itemInQueue(self.itemRef)
    
    if not itemInScrapper and not itemInQueue and #EasyScrap.itemsInScrapper < 9 and not EasyScrap.scrapInProgress then
        UseContainerItem(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
    elseif itemInScrapper and not itemInQueue then
        EasyScrap:removeItemFromScrapper(scrappableItems[self.itemRef].bag, scrappableItems[self.itemRef].slot)
        if #EasyScrap.itemsInScrapper == 0 and #EasyScrap.queueItems > 0 then
            EasyScrap.queueItems = {}
            EasyScrapItemFrame:updateContent()
        end
    elseif itemInQueue and not itemInScrapper then
        removeItemFromQueue(self)
    else
        addItemToQueue(self)
    end  
end

local function selectItemToIgnore(self)
    local itemRef = self.itemRef
    local itemInScrapper = EasyScrap:itemInScrapper(EasyScrap.scrappableItems[itemRef].bag, EasyScrap.scrappableItems[itemRef].slot)
    local itemInQueue = itemInQueue(itemRef)
    if itemInScrapper then EasyScrap:removeItemFromScrapper(EasyScrap.scrappableItems[itemRef].bag, EasyScrap.scrappableItems[itemRef].slot) end
    if itemInQueue then removeItemFromQueue(self) end

    if itemRef > 0 then
        itemFrame.ignoreItemFrame.itemRef = itemRef
        
        itemFrame.ignoreItemFrame:Show()
        itemFrame.contentFrame:Hide()

    end
end

local function itemButtonOnClick(self, button)
    if button == 'LeftButton' then
        selectItemForScrapping(self)
    elseif button == 'RightButton' then
        --Ignore item options
        if not EasyScrap.scrapInProgress then
            selectItemToIgnore(self)
        end
    end
end

local function createItemButton(i)
    --local frame = CreateFrame('Button', 'EasyScrapItemButton'..i, contentFrame, "ItemButtonTemplate")
    local frame = CreateFrame('Button', 'EasyScrapItemButton'..i, contentFrame, "EasyScrapItemButtonTemplate")
    frame:SetScale(0.95, 0.95)
    frame:RegisterForClicks('LeftButtonUp', 'RightButtonUp')
    frame:SetScript('OnClick', itemButtonOnClick)
    frame:SetScript('OnEnter', function(self)
        if self.itemRef > 0 then 
            GameTooltip:SetOwner(self, "ANCHOR_NONE")
            --GameTooltip:SetHyperlink(EasyScrap.scrappableItems[self.itemRef].itemLink)
            GameTooltip:SetBagItem(EasyScrap.scrappableItems[self.itemRef].bag, EasyScrap.scrappableItems[self.itemRef].slot)
            if EasyScrap.scrappableItems[self.itemRef].filterReason then GameTooltip:AddLine('|cFFFF0000'..EasyScrap.scrappableItems[self.itemRef].filterReason..'|r') end
            GameTooltip:SetPoint("BOTTOMLEFT", frame, "TOPRIGHT");
            GameTooltip:Show()
            if GetCVarBool("alwaysCompareItems") then  --(IsModifiedClick("COMPAREITEMS") or 
                GameTooltip_ShowCompareItem(GameTooltip);
            end
        end
        EasyScrap.mouseInItem = true
    end)
    frame:SetScript('OnLeave', function(self) GameTooltip_Hide() EasyScrap.mouseInItem = false end)
    
    frame.shineFrame = CreateFrame('Frame', 'EasyScrapItemButton'..i..'Shine', frame, 'AutoCastShineTemplate')
    frame.shineFrame:SetPoint('TOPLEFT', 1, -1)
    frame.shineFrame:SetPoint('BOTTOMRIGHT', -1, 1)

    local spacing = 1.05*((contentFrame:GetWidth()-(7*frame:GetWidth()))/7)
    local perRow = 7
    local x = 8 + (spacing/2) + (i-1)%perRow*(frame:GetWidth()+spacing)
    local y = -4 - math.floor((i-1)/7)*42
    
    frame.defaultX = x
    frame.defaultY = y

    frame:SetPoint('TOPLEFT', x, y)   
    
    frame.bg = frame:CreateTexture(nil, 'BACKGROUND')
    frame.bg:SetTexture("Interface\\Buttons\\UI-EmptySlot-Disabled")
    frame.bg:SetSize(54, 54)
    frame.bg:SetPoint('CENTER')
    frame.itemRef = 0
    frame:Hide()
    
    return frame    
end

local function displayIgnoredItemButtons()
    itemButtonsVisible = 0
    
    contentFrame.ignoreHeader:Show()
    contentFrame.filterHeader:Show()
    
    local itemTable = EasyScrap.ignoredItems
    for i = 1, #itemTable do
        if not contentFrame.itemButtons[i] then contentFrame.itemButtons[i] = createItemButton(i) end
        local itemButton = contentFrame.itemButtons[i]
        
        local scrappableItem = EasyScrap.scrappableItems[itemTable[i]]
        
        SetItemButtonTexture(itemButton, scrappableItem.itemTexture)
        SetItemButtonCount(itemButton, scrappableItem.itemCount);
        SetItemButtonQuality(itemButton, scrappableItem.itemQuality, scrappableItem.itemLink)
        
        if EasyScrap.mainFrame.searchBox.isEmpty then
            itemButton.searchOverlay:Hide()
        else
            if EasyScrap.scrappableItems[itemTable[i]].searchMatch then              
                itemButton.searchOverlay:Hide()
            else
                itemButton.searchOverlay:Show()
            end       
        end
            
        itemButton.itemRef = itemTable[i]
        
        itemButton:ClearAllPoints()
        itemButton:SetPoint('TOPLEFT', contentFrame.ignoreHeader, 'BOTTOMLEFT', itemButton.defaultX, itemButton.defaultY)       

        itemButton:Show()
        itemButtonsVisible = itemButtonsVisible + 1
    end
    
    contentFrame.filterHeader:ClearAllPoints()
    if itemButtonsVisible > 0 then
        local _,_,_,x,y = contentFrame.itemButtons[itemButtonsVisible]:GetPoint()
        contentFrame.filterHeader:SetPoint('TOP', contentFrame.ignoreHeader, 0, y-contentFrame.itemButtons[itemButtonsVisible]:GetHeight()-24)
    else
        contentFrame.filterHeader:SetPoint('TOP', contentFrame.ignoreHeader, 0, -48)
    end
    
    local filteredButtonsVisible = 0
    local index = itemButtonsVisible
    
    local itemTable = EasyScrap.filteredItems
    for i = 1, #itemTable do
        if not contentFrame.itemButtons[i+index] then contentFrame.itemButtons[i+index] = createItemButton(i+index) end
        local itemButton = contentFrame.itemButtons[i+index]
        
        local scrappableItem = EasyScrap.scrappableItems[itemTable[i]]
        
        SetItemButtonTexture(itemButton, scrappableItem.itemTexture)
        SetItemButtonCount(itemButton, scrappableItem.itemCount);
        SetItemButtonQuality(itemButton, scrappableItem.itemQuality, scrappableItem.itemLink)
        
        if EasyScrap.mainFrame.searchBox.isEmpty then
            itemButton.searchOverlay:Hide()
        else
            if EasyScrap.scrappableItems[itemTable[i]].searchMatch then              
                itemButton.searchOverlay:Hide()
            else
                itemButton.searchOverlay:Show()
            end       
        end
            
        itemButton.itemRef = itemTable[i]
        
        itemButton:ClearAllPoints()
        itemButton:SetPoint('TOPLEFT', contentFrame.filterHeader, 'BOTTOMLEFT', contentFrame.itemButtons[filteredButtonsVisible+1].defaultX, contentFrame.itemButtons[filteredButtonsVisible+1].defaultY)       

        itemButton:Show()
        itemButtonsVisible = itemButtonsVisible + 1
        filteredButtonsVisible = filteredButtonsVisible + 1
    end   
end

local function displayItemButtons()
    contentFrame.ignoreHeader:Hide()
    contentFrame.filterHeader:Hide()

    local itemTable = EasyScrap.eligibleItems
    if itemFrame.contentState == 1 then
        itemTable = EasyScrap.queueItems
    end
    itemButtonsVisible = 0
      
    for i = 1, #itemTable do
        if not contentFrame.itemButtons[i] then contentFrame.itemButtons[i] = createItemButton(i) end
        local itemButton = contentFrame.itemButtons[i]
        
        local scrappableItem = EasyScrap.scrappableItems[itemTable[i]]
        
        SetItemButtonTexture(itemButton, scrappableItem.itemTexture)
        SetItemButtonCount(itemButton, scrappableItem.itemCount);
        SetItemButtonQuality(itemButton, scrappableItem.itemQuality, scrappableItem.itemLink)
        
        if EasyScrap.mainFrame.searchBox.isEmpty then
            itemButton.searchOverlay:Hide()
        else
            if EasyScrap.scrappableItems[itemTable[i]].searchMatch then              
                itemButton.searchOverlay:Hide()
            else
                itemButton.searchOverlay:Show()
            end       
        end
            
        itemButton.itemRef = itemTable[i]
        
        itemButton:ClearAllPoints()
        itemButton:SetPoint('TOPLEFT', itemButton.defaultX, itemButton.defaultY)
        itemButton:Show()
        
        itemButtonsVisible = itemButtonsVisible + 1
    end
end

local function hideItemButtons()
    for i = 1, #contentFrame.itemButtons do
        contentFrame.itemButtons[i]:Hide()
        SetItemButtonDesaturated(contentFrame.itemButtons[i], false)
        contentFrame.itemButtons[i].NewActionTexture:Hide()
        contentFrame.itemButtons[i].IconBorder:Show()
        AutoCastShine_AutoCastStop(contentFrame.itemButtons[i].shineFrame)
    end
end

function EasyScrapItemFrame:displayState()
    hideItemButtons()
    itemFrame.ignoreItemFrame:Hide()
    itemFrame.contentFrame:Show()
    self:moveQueueTabSparks()
    EasyScrap.mainFrame.queueAllButton:SetEnabled(false)  
    if self.contentState == 2 then
        if #EasyScrap.eligibleItems > 0 then
            EasyScrap.mainFrame.queueAllButton:SetEnabled(true)
        end
    elseif self.contentState == 3 then
    end
    
    if self.contentState == 3 then
        displayIgnoredItemButtons()
    else
        displayItemButtons()
    end
    self:highlightItemsForScrapping()
end

EasyScrapItemFrame.switchContentState = function(newState)
    PanelTemplates_DeselectTab(itemFrame.tabButtons[itemFrame.contentState])
    itemFrame.contentState = newState
    PanelTemplates_SelectTab(itemFrame.tabButtons[itemFrame.contentState])
    
    EasyScrapItemFrame:updateContent()
end

local function updateSlider()
    local maxScroll = 0
    if itemFrame.contentState == 1 then
        maxScroll = (math.ceil(#EasyScrap.queueItems / 7)*40)
    elseif itemFrame.contentState == 2 then
        maxScroll = (math.ceil(#EasyScrap.eligibleItems / 7)*40)
    elseif itemFrame.contentState == 3 then
        maxScroll = 48
        maxScroll = maxScroll + (math.ceil(#EasyScrap.ignoredItems / 7)*40)
        maxScroll = maxScroll + (math.ceil(#EasyScrap.filteredItems / 7)*40)
    end
    
    maxScroll = maxScroll - itemFrame.scrollFrame:GetHeight() + 16
    if maxScroll < 0 then maxScroll = 0 end
    
    if itemFrame.scrollFrame.ScrollBar:GetValue() > maxScroll then itemFrame.scrollFrame.ScrollBar:SetValue(maxScroll) end
    itemFrame.scrollFrame.ScrollBar:SetMinMaxValues(0, maxScroll)   
end

function EasyScrapItemFrame:updateContent()
    itemButtonsVisible = 0
    self:displayState()
    updateSlider()
    
    self.tabButtons[1]:SetCount(#EasyScrap.queueItems)
    self.tabButtons[2]:SetCount(#EasyScrap.eligibleItems)
    self.tabButtons[3]:SetCount(#EasyScrap.ignoredItems+#EasyScrap.filteredItems)
end

function EasyScrapItemFrame:moveQueueTabSparks()
    if self.contentState == 1 then
        itemFrame.tabButtons[1].shineFrame:ClearAllPoints()
        itemFrame.tabButtons[1].shineFrame:SetPoint('CENTER', 1, 24)   
    else
        itemFrame.tabButtons[1].shineFrame:ClearAllPoints()
        itemFrame.tabButtons[1].shineFrame:SetPoint('CENTER', 1, 28)   
    end
end

function EasyScrapItemFrame:highlightItemsForScrapping()
    local itemTable = {}
    if itemFrame.contentState == 1 then
        itemTable = EasyScrap.queueItems
    elseif itemFrame.contentState == 2 then
        itemTable = EasyScrap.eligibleItems
    elseif itemFrame.contentState == 3 then
        itemTable = EasyScrap.ignoredItems
    end

    for i = 1, #itemTable do
        if EasyScrap:itemInScrapper(EasyScrap.scrappableItems[itemTable[i]].bag, EasyScrap.scrappableItems[itemTable[i]].slot) then
            SetItemButtonDesaturated(contentFrame.itemButtons[i], true)
            contentFrame.itemButtons[i].IconBorder:Hide()
            contentFrame.itemButtons[i].NewActionTexture:Show()
        elseif itemInQueue(itemTable[i]) then
            SetItemButtonDesaturated(contentFrame.itemButtons[i], true)
            contentFrame.itemButtons[i].IconBorder:Hide()
            AutoCastShine_AutoCastStart(contentFrame.itemButtons[i].shineFrame)       
        else
            SetItemButtonDesaturated(contentFrame.itemButtons[i], false)
            contentFrame.itemButtons[i].NewActionTexture:Hide()
            contentFrame.itemButtons[i].IconBorder:Show()
        end
    end
    
    if itemFrame.contentState == 3 and #EasyScrap.filteredItems > 0 then
        itemTable = EasyScrap.filteredItems
        local index = #EasyScrap.ignoredItems
         for i = 1, #itemTable do
            if EasyScrap:itemInScrapper(EasyScrap.scrappableItems[itemTable[i]].bag, EasyScrap.scrappableItems[itemTable[i]].slot) then
                SetItemButtonDesaturated(contentFrame.itemButtons[i+index], true)
                contentFrame.itemButtons[i+index].IconBorder:Hide()
                contentFrame.itemButtons[i+index].NewActionTexture:Show()
            elseif itemInQueue(itemTable[i]) then
                SetItemButtonDesaturated(contentFrame.itemButtons[i+index], true)
                contentFrame.itemButtons[i+index].IconBorder:Hide()
                AutoCastShine_AutoCastStart(contentFrame.itemButtons[i+index].shineFrame)       
            else
                SetItemButtonDesaturated(contentFrame.itemButtons[i+index], false)
                contentFrame.itemButtons[i+index].NewActionTexture:Hide()
                contentFrame.itemButtons[i+index].IconBorder:Show()
            end
        end   
    end
end

function EasyScrapItemFrame:queueAllItems()
    if not EasyScrap.scrapInProgress then
        for i = 1, itemButtonsVisible do
            if contentFrame.itemButtons[i].IconBorder:IsVisible() then
                addItemToQueue(contentFrame.itemButtons[i])
            end
        end
        EasyScrap.addingItems = true
        EasyScrap:addQueueItems()
    end
end

local checkNeedToQueue = false
local EasyScrap = EasyScrap

EasyScrap.parentFrame:SetScript('OnShow', function()
    EasyScrap.parentFrame:RegisterEvent('BAG_UPDATE_DELAYED')
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_CLOSE")
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED")
	EasyScrap.parentFrame:RegisterEvent("SCRAPPING_MACHINE_SCRAPPING_FINISHED")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrap.parentFrame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
 
    EasyScrap.queueItems = {}
    EasyScrap:getScrappableItems()
    EasyScrap:filterScrappableItems()
    --EasyScrap:resetQueue()

    EasyScrapItemFrame.switchContentState(2)
    checkNeedToQueue = false
    EasyScrap.addingItems = false
    EasyScrap.scrapCastLineID = nil
    EasyScrap.scrapInProgress = false
    EasyScrap.mainFrame:Show()
end)

EasyScrap.parentFrame:SetScript('OnHide', function()
    EasyScrap.scrapCastLineID = nil
    EasyScrap.parentFrame:UnregisterEvent('BAG_UPDATE_DELAYED')
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_START", "player")
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED", "player")
	EasyScrap.parentFrame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
end)
--[[
--At some point on beta SCRAPPING_MACHINE_SCRAPPING_FINISHED stopped firing reliably for one speficic highmountain tauren character.
--Could never reproduce it on any other character but keeping the ugly workaround of using ITEM_CHANGED for now.
--]]
EasyScrap.parentFrame:SetScript('OnEvent', function(self, event, ...)
    --print('Easy Scrap Event: '..event)
    if event == 'BAG_UPDATE_DELAYED' then
        EasyScrap:getScrappableItems()
        if not EasyScrap.mainFrame.searchBox.isEmpty then EasyScrap:searchItem(EasyScrap.mainFrame.searchBox:GetText()) end
        EasyScrap:filterScrappableItems()
        EasyScrapItemFrame:updateContent()
    elseif event == 'SCRAPPING_MACHINE_SCRAPPING_FINISHED_BROKEN' then 
        if #EasyScrap.queueItems > 0 then
            if #EasyScrap.queueItems > 9 then
                --EasyScrap.queueItemsToAdd = 9
            else
                --EasyScrap.queueItemsToAdd = #EasyScrap.queueItems
            end
            C_Timer.After(0, function() EasyScrap:addQueueItems() end)
        end
    elseif event == 'SCRAPPING_MACHINE_PENDING_ITEM_CHANGED' then
        EasyScrap:getItemsInScrapper()
        EasyScrapItemFrame:updateContent()
        
        if checkNeedToQueue and #EasyScrap.itemsInScrapper == 0 and #EasyScrap.queueItems > 0 then
            checkNeedToQueue = false
            EasyScrap.addingItems = true
        else
            checkNeedToQueue = false
        end
        
        if EasyScrap.addingItems then
            C_Timer.After(0, function() EasyScrap:addQueueItems() end)
        end    
	elseif (event == "UNIT_SPELLCAST_START") then
		local unitTag, lineID, spellID = ...;
		if spellID == C_ScrappingMachineUI.GetScrapSpellID() then
			self.scrapCastLineID = lineID;
            EasyScrap.scrapInProgress = true
		end
	elseif (event == "UNIT_SPELLCAST_INTERRUPTED") then
		local unitTag, lineID, spellID = ...;
		if self.scrapCastLineID and self.scrapCastLineID == lineID then
			self.scrapCastLineID = nil;
            EasyScrap.scrapInProgress = false
		end
	elseif (event == "UNIT_SPELLCAST_SUCCEEDED") then
		local unitTag, lineID, spellID = ...;
		if self.scrapCastLineID and self.scrapCastLineID == lineID then
			checkNeedToQueue = true
            EasyScrap.scrapInProgress = false
		end
    elseif event == 'ADDON_LOADED' then
            if EasyScrap_IgnoreList then
                EasyScrap.itemIgnoreList = EasyScrap_IgnoreList
            end       
            if EasyScrap_SaveData then
                EasyScrap.saveData = EasyScrap_SaveData

                if EasyScrap.saveData.addonVersion < EasyScrap.addonVersion then
                    EasyScrap:updateAddonSettings()
                end     
            else
                EasyScrap:initializeSaveData()        
            end
        
            EasyScrap.parentFrame:UnregisterEvent('ADDON_LOADED')
    elseif event == 'PLAYER_LOGOUT' then
        EasyScrap.saveData.addonVersion = EasyScrap.addonVersion
        EasyScrap_SaveData = EasyScrap.saveData
        EasyScrap_IgnoreList = EasyScrap.itemIgnoreList
    end
end)