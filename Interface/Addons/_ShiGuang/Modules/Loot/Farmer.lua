--## Version: 2.3  ## Author: syndenbock
if IsAddOnLoaded("lsToasts") then return end

local rarityList = { [0] = FARMER_Poor, FARMER_Common, FARMER_Uncommon, FARMER_Rare, FARMER_Epic, FARMER_Legendary, FARMER_Artifact, FARMER_Heirloom, FARMER_WoWToken }
local checkButtonList = {}
local sliderList = {}
local events = {}
local rarityColors = {}
for i = 0, 8 do rarityColors[i] = {GetItemQualityColor(i)} end

local farmerOptionsFrame = CreateFrame('Frame', 'farmerOptionsFrame', UIParent)
farmerOptionsFrame.name = FARMERTITLE
InterfaceOptions_AddCategory(farmerOptionsFrame)

local function setDefaultPosition ()
  farmerFrame:ClearAllPoints()
  farmerFrame:SetPoint('BOTTOM', UIParent, 'CENTER', 210, 0)
end

local function storePosition (frame)
  ShiGuangDB.Farmer_anchor = {frame:GetPoint()}
  frame:EnableMouse(false)
  frame:SetMovable(false)
  frame:SetFading(true)
  frame:Clear()
  frame:AddMessage(' |T' .. GetItemIcon(114978) .. iconOffset)
  frame:StopMovingOrSizing()
  frame:SetScript('OnDragStart', nil)
  frame:SetScript('OnReceiveDrag', nil)
end

local function moveFrame ()
  farmerFrame:RegisterForDrag('LeftButton')
  farmerFrame:SetFading(false)
  farmerFrame:Clear()
  farmerFrame:AddMessage(' |T' .. GetItemIcon(3334) .. iconOffset)
  farmerFrame:EnableMouse(true)
  farmerFrame:SetMovable(true)
  farmerFrame:SetScript('OnDragStart', function (self)
    if (self:IsMovable() == true) then self:StartMoving() end
  end)
  farmerFrame:SetScript('OnReceiveDrag', function (self) storePosition(self) end)
end

local function displayRarity (edit, rarity)
  edit:SetText('|c' .. rarityColors[rarity][4] .. rarityList[rarity])
  edit:SetCursorPosition(0)
end

local function setFontSize (size)
  CreateFont('farmerFont'):SetFont(STANDARD_TEXT_FONT, size, 'outline')
  CreateFont('farmerFont'):SetSpacing(size / 9)
  iconOffset = ':0:0:0:-' .. (size / 6)  .. '|t '
end

local function createCheckButton (name, anchorFrame, xOffset, yOffset, text, anchor, parentAnchor)
  local checkButton = CreateFrame('CheckButton', name .. 'CheckButton', farmerOptionsFrame, 'OptionsCheckButtonTemplate')

  anchor = anchor or 'TOPLEFT'
  parentAnchor = parentAnchor or 'BOTTOMLEFT'

  checkButton:SetPoint(anchor, anchorFrame, parentAnchor, xOffset, yOffset)
  _G[name .. 'CheckButtonText']:SetText(text)
  checkButtonList[name] = checkButton

  -- blizzard broke something in the bfa beta, so we have to fix it
  checkButton.SetValue = function () end

  return checkButton
end

local function createButton (name, anchorFrame, xOffset, yOffset, text, anchor, parentAnchor, onClick)
  local button = CreateFrame('Button', name .. 'Button', farmerOptionsFrame, 'OptionsButtonTemplate')

  anchor = anchor or 'TOPLEFT'
  parentAnchor = parentAnchor or 'BOTTOMLEFT'

  button:SetPoint(anchor, anchorFrame, parentAnchor, xOffset, yOffset)
  button:SetWidth(150)
  button:SetHeight(25)
  button:SetText(text)
  if (onClick ~= nil) then button:SetScript('OnClick', onClick) end
  return button
end

local function createSlider (name, anchorFrame, xOffset, yOffset, text, min, max, lowText, highText, anchor, parentAnchor, onChange)
  local slider = CreateFrame('Slider', name .. 'Slider', farmerOptionsFrame, 'OptionsSliderTemplate')

  anchor = anchor or 'TOPLEFT'
  parentAnchor = parentAnchor or 'BOTTOMLEFT'

  slider:SetPoint(anchor, anchorFrame, parentAnchor, xOffset, yOffset)
  slider:SetOrientation('HORIZONTAL')
  slider:SetMinMaxValues(min, max)
  slider:SetValueStep(1)
  slider:SetObeyStepOnDrag(true)
  _G[name .. 'SliderText']:SetText(text)
  _G[name .. 'SliderLow']:SetText(lowText)
  _G[name .. 'SliderHigh']:SetText(highText)
  slider:SetScript('OnValueChanged', function (self, value)
    self.edit:SetText(value)
    self.edit:SetCursorPosition(0)
    if (onChange ~= nil) then onChange(self, value) end
  end)
  sliderList[name] = slider
  anchor = slider
  edit = CreateFrame('EditBox', name .. 'EditBox', farmerOptionsFrame)
  edit:SetAutoFocus(false)
  edit:Disable()
  edit:SetPoint('TOP', anchor, 'BOTTOM', 0, 0)
  edit:SetFontObject('ChatFontNormal')
  edit:SetHeight(20)
  edit:SetWidth(slider:GetWidth())
  edit:SetTextInsets(8, 8, 0, 0)
  edit:SetJustifyH('CENTER')
  edit:Show()
  -- edit:SetBackdrop(slider:GetBackdrop())
  -- edit:SetBackdropColor(0, 0, 0, 0.8)
  -- edit:SetBackdropBorderColor(1, 1, 1, 1)
  slider.edit = edit
  return slider, edit
end

local function initPanel ()
  local anchor = farmerOptionsFrame
  anchor = createCheckButton('Farmer_fastLoot', farmerOptionsFrame, 300, -15, FARMER_ENABLEFASTAUTOLOOT, 'TOPLEFT', 'TOPLEFT')
  anchor = createCheckButton('Farmer_itemNames', anchor, 0, -5, 'show names of all items')
  anchor = createCheckButton('Farmer_hideLootToasts', anchor, 0, -5, FARMER_HIDELOOTANDITEMROLLTOASTS)
  anchor = createCheckButton('Farmer_hideInArena', anchor, 0, -5, FARMER_DONTDISPLAYITEMSINARENA)
  anchor = createCheckButton('Farmer_showTotal', anchor, 0, -5, FARMER_SHOWTOTALCOUNTFORSTACKABLEITEMS)
  anchor = createCheckButton('Farmer_showBags', anchor, 0, -5, FARMER_SHOWBAGCOUNTFORSTACKABLEITEMS)
  anchor = createCheckButton('Farmer_rarity', farmerOptionsFrame, 15, -15, FARMER_SHOWITEMSBASEDONRARITY, 'TOPLEFT', 'TOPLEFT')
  _, anchor = createSlider('Farmer_minimumRarity', anchor, 20, -20, FARMER_MINIMUMRARITY, 0, 8, '', '', 'TOPLEFT', 'BOTTOMLEFT', function (self, value)
    displayRarity(self.edit, value)
  end)
  anchor = createCheckButton('Farmer_special', anchor, -20, -10, FARMER_ALWAYSSHOWFARMINGITEMS)
  anchor = createCheckButton('Farmer_reagents', anchor, 0, -5, FARMER_ALWAYSSHOWREAGENTS)
  anchor = createCheckButton('Farmer_questItems', anchor, 0, -5, 'always show quest items')
  anchor = createCheckButton('Farmer_currency', anchor, 0, -25, FARMER_SHOWCURRENCIES)
  anchor = createCheckButton('Farmer_money', anchor, 0, -5, FARMER_SHOWMONEY)
  anchor = createButton ('Farmer_move', farmerOptionsFrame, 10, 12, FARMER_MOVEFRAME, 'BOTTOMLEFT', 'BOTTOMLEFT', function (self) moveFrame() end)
  createButton ('Farmer_resetPosition', anchor, 20, 0, FARMER_RESETPOSITION, 'LEFT', 'RIGHT', function (self)
    setDefaultPosition()
    storePosition(farmerFrame)
  end)
  anchor = createSlider('Farmer_fontSize', anchor, 3, 40, FARMER_FONTSIZE, 8, 64, '8', '64', 'BOTTOMLEFT', 'TOPLEFT', function (self, value)
    setFontSize(value)
  end)
  createSlider('Farmer_displayTime', anchor,23, 0, FARMER_DISPLAYTIME, 1, 10, '1', '10', 'LEFT', 'RIGHT', function (self, value)
    farmerFrame:SetTimeVisible(value - farmerFrame:GetFadeDuration())
  end)
end

local function applyOptions ()
  if (ShiGuangDB.Farmer_hideLootToasts == true) then
    AlertFrame:UnregisterEvent('SHOW_LOOT_TOAST')
    AlertFrame:UnregisterEvent('LOOT_ITEM_ROLL_WON')
    AlertFrame:UnregisterEvent('SHOW_LOOT_TOAST_UPGRADE')
    AlertFrame:UnregisterEvent('BONUS_ROLL_RESULT')
  else
    AlertFrame:RegisterEvent('SHOW_LOOT_TOAST')
    AlertFrame:RegisterEvent('LOOT_ITEM_ROLL_WON')
    AlertFrame:RegisterEvent('SHOW_LOOT_TOAST_UPGRADE')
    AlertFrame:UnregisterEvent('BONUS_ROLL_RESULT')
  end
  if (ShiGuangDB.Farmer_money == true) then moneyStamp = GetMoney() end
  setFontSize(ShiGuangDB.Farmer_fontSize)
  farmerFrame:SetTimeVisible(ShiGuangDB.Farmer_displayTime - farmerFrame:GetFadeDuration())
end

local function loadOptions ()
  for k, v in pairs(checkButtonList) do v:SetChecked(ShiGuangDB[k]) end
  for k, v in pairs(sliderList) do v:SetValue(ShiGuangDB[k]) end
end

local function saveOptions ()
  for k, v in pairs(checkButtonList) do ShiGuangDB[k] = v:GetChecked() end
  for k, v in pairs(sliderList) do ShiGuangDB[k] = v:GetValue() end
  applyOptions()
end

farmerOptionsFrame.okay = saveOptions
farmerOptionsFrame.refresh = loadOptions
farmerOptionsFrame.cancel = applyOptions

function checkOption (name, default)
  if (ShiGuangDB[name] == nil) then ShiGuangDB[name] = default end
end

function events:ADDON_LOADED (addon)
  if (addon ~= '_ShiGuang') then return end
  initPanel()
  checkOption('Farmer_fastLoot', true)
  checkOption('Farmer_itemNames', true)
  checkOption('Farmer_hideLootToasts', true)
  checkOption('Farmer_hideInArena', true)
  checkOption('Farmer_showTotal', true)
  checkOption('Farmer_showBags', false)
  checkOption('Farmer_rarity', true)
  checkOption('Farmer_minimumRarity', 2)
  checkOption('Farmer_special', true)
  checkOption('Farmer_questItems', false)
  checkOption('Farmer_currency', true)
  checkOption('Farmer_reagents', true)
  checkOption('Farmer_money', false)
  checkOption('Farmer_fontSize', 16)
  checkOption('Farmer_displayTime', 8)
  checkOption('Farmer_fontSize', 24)
  checkOption('Farmer_displayTime', 4)
  if (ShiGuangDB.Farmer_anchor == nil) then setDefaultPosition() else farmerFrame:SetPoint(unpack(ShiGuangDB.Farmer_anchor)) end
  applyOptions()
end
function events:PLAYER_LOGIN () LootFrame:SetAlpha(0) end
farmerOptionsFrame:SetScript('OnEvent', function (self, event, ...) if IsAddOnLoaded("lsToasts") then return end events[event](self, ...) end)
for k, v in pairs(events) do farmerOptionsFrame:RegisterEvent(k) end

--[[
///#############################################################################
/// slash commands
///#############################################################################
--]]

local slashCommands = {}
slashCommands['move'] = moveFrame
function slashCommands:reset ()
  setDefaultPosition()
  storePosition(farmerFrame)
end
function slashCommands:default ()
  InterfaceOptionsFrame_Show()
  InterfaceOptionsFrame_OpenToCategory(farmerOptionsFrame)
end
local function slashHandler (input)
  local command, param = input.split(' ', input, 3)

  command = command == '' and 'default' or command
  command = string.lower(command or 'default')
  param = string.lower(param or '')

  if (slashCommands[command] ~= nil) then
    slashCommands[command](nil, param)
    return
  end
  print('Farmer: unknown command "' .. input .. '"')
end
SLASH_FARMER1 = '/farmer'
SlashCmdList.FARMER = slashHandler







local chipId = 129100
local specialList = {
  [116158] = true, -- Lunarfall Carp
  [112633] = true, -- Frostdeep Minnow
  [127141] = true, -- Bloated Thresher
  [32620] = true, -- time-lost scroll
  [86547] = true, -- skyshard
  [25433] = true, -- obsidian warbeads
  [141975] = true, -- mark of aquaos
  [138777] = true, -- drowned mana
  [87779] = true, -- Ancient Guo-Lai Cache Key
  [153190] = true, -- fel-spotted egg
  [143924] = true, -- burning key
  [23247] = true, -- Burning Blossom
  [124670] = true, -- Sealed Darkmoon Crate
  [163852] = true, -- tortollan pilgrimage scroll
}

local _, chipName = GetItemInfoInstant(chipId)
local messagePatterns = {
  CHAT_MSG_LOOT = {
    {LOOT_ITEM_SELF_MULTIPLE, {{'%%s','(.+)'}, {'(%%d)','(%%d+)'}}},
    {LOOT_ITEM_SELF, {{'%%s','(.+)',}}},
    {LOOT_ITEM_PUSHED_SELF_MULTIPLE,{{'%%s','(.+)'},{'(%%d)','(%%d+)'}}},
    {LOOT_ITEM_PUSHED_SELF, {{'%%s','(.+)',}}},
    {LOOT_ITEM_BONUS_ROLL_SELF_MULTIPLE, {{'%%s','(.+)'}, {'(%%d)','(%%d+)'}}},
    {LOOT_ITEM_BONUS_ROLL_SELF, {{'%%s','(.+)',}}},
  },
  CHAT_MSG_CURRENCY = {
    {CURRENCY_GAINED_MULTIPLE, {{'%%s', '(.+)'}, {'(%%d)','(%%d+)'}}},
    {CURRENCY_GAINED, {{'%%s','(.+)',}}}
  }
}

local farmerFrame
local events = {}
local itemList = {}
local awaitingList = {}
local mapShown
local hadChip = false
local lootStack = nil
local lootTimeStamp = 0

for msg, replacements in pairs(messagePatterns) do
  local new = {}
  for i = 1, #replacements do
    local content = replacements[i]
    local message = content[1]
    local patterns = content[2]
    for k = 1, #patterns do
      local pattern = patterns[k]
      message = gsub(message, pattern[1], pattern[2])
    end
    message = '^' .. message .. '$'
    new[i] = message
  end
  messagePatterns[msg] = new
end



local tDelay = 0
local function performAutoLoot()
	if not MaoRUISettingDB["Misc"]["FasterLoot"] then return end
	if GetTime() - tDelay >= .3 then
		tDelay = GetTime()
		if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
			for i = GetNumLootItems(), 1, -1 do
				LootSlot(i)
			end
			tDelay = GetTime()
		end
	end
end

local function printItem (texture, text, colors)
  farmerFrame:AddMessage(' |T' .. texture .. iconOffset .. text, unpack(colors))
end

local function printItemCount (texture, name, text, count, colors)
  if (count > 1) then
    text = 'x' .. count .. ' ' .. text
  end

  if (ShiGuangDB.Farmer_itemNames == true or
      text == '') then
    text = name .. ' ' .. text
  end

  printItem(texture, text, colors)
end

local function printStackableItemTotal (id, texture, name, count, totalCount, colors)
  local text
  totalCount = totalCount + GetItemCount(id, true)
  if (totalCount < count) then totalCount = count end

  text = 'x' .. count .. ' (' .. totalCount .. ')'

  if (ShiGuangDB.Farmer_itemNames == true) then
    text = name .. ' ' .. text
  end

  printItem(texture, text, colors)
end

local function printStackableItemTotalAndBags (id, texture, name, count, totalCount, colors)
  local text
  local bagCount = totalCount + GetItemCount(id, false)
  totalCount = totalCount + GetItemCount(id, true)

  if (totalCount < count) then
    totalCount = count
    bagCount = count
  end
  text = 'x' .. count .. ' (' .. bagCount .. '/' .. totalCount .. ')'

  if (ShiGuangDB.Farmer_itemNames == true) then
    text = name .. ' ' .. text
  end

  printItem(texture, text, colors)
end

local function printStackableItem (id, texture, name, count, totalCount, colors)
  -- this should be the most common case, so we check this first
  if (ShiGuangDB.Farmer_showTotal == true and
      ShiGuangDB.Farmer_showBags == false) then
    printStackableItemTotal(id, texture, name, count, totalCount, colors)
  elseif (ShiGuangDB.Farmer_showTotal == true) then
    printStackableItemTotalAndBags(id, texture, name, count, totalCount, colors)
  else
    printItemCount(texture, name, '', count, colors)
  end
end

local function printEquip (texture, name, text, count, colors)
  if (ShiGuangDB.Farmer_itemNames == true) then
    text = '[' .. text .. ']'
  end
  printItemCount(texture, name, text, count, colors)
end

local function handleItem (itemLink, count, totalCount)
  local itemName, _itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, texture, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemLink)
  -- happens when caging a pet
  if (itemName == nil) then return end
  local itemId = GetItemInfoInstant(itemLink)
  if (ShiGuangDB.Farmer_reagents == true) then
    if (isCraftingReagent == true) then
      if (itemId == chipId and hadChip == true) then hadChip = false return end
      printStackableItem(itemLink, texture, itemName, count, totalCount, {0, 0.8, 0.8, 1})
      return
    end
    if (itemId ~= nil) then
      if ((itemId >= 130200 and itemId <= 130204) or itemId == 129099) then
        hadChip = true
        printStackableItem(chipId, texture, itemName, count, totalCount, {1, 1, 1, 1})
        return
      end
    end
  end

  if (ShiGuangDB.Farmer_questItems == true and
      itemClassID == 12) then
    printItemCount(texture, itemName, '', count, {1, 0.8, 0, 1})
    return
  end

  if ((ShiGuangDB.Farmer_rarity == true and
       itemRarity >= ShiGuangDB.Farmer_minimumRarity) or
      (ShiGuangDB.Farmer_special == true and
       itemId ~= nil and
       specialList[itemId] == true)) then
    local colors = rarityColors[itemRarity]

    if (itemStackCount > 1) then
      printStackableItem(itemLink, texture, itemName, count, totalCount, colors)
      return
    end

    if (itemClassID == 3 and
        itemSubClassID == 11) then -- gem / artifact relics
      local text
      itemLevel = GetDetailedItemLevelInfo(itemLink)
      text = itemSubType .. ' ' .. itemLevel
      printEquip(texture, itemName, text, count, colors)
      return
    end

    if (itemEquipLoc ~= '') then
      if (itemClassID == 1) then -- bags
        printEquip(texture, itemName, itemSubType, count, colors)
        return
      end

      if (itemClassID == 2) then -- weapons
        local text
        itemLevel = GetDetailedItemLevelInfo(itemLink)
        text = itemSubType .. ' ' .. itemLevel
        printEquip(texture, itemName, text, count, colors)
        return
      end

      if (itemClassID == 4) then -- armor
        local text = _G[itemEquipLoc]
        itemLevel = GetDetailedItemLevelInfo(itemLink)

        if (itemEquipLoc == 'INVTYPE_TABARD') then
          -- text is already fine
        elseif (itemEquipLoc ==  'INVTYPE_CLOAK') then
          text = text .. ' ' .. itemLevel
        elseif (itemSubClassID == 0) then
          text = text .. ' ' .. itemLevel -- fingers/trinkets
        elseif (itemSubClassID > 4) then -- we all know shields are offhand
          text = itemSubType .. ' ' .. itemLevel
        else
          text = itemSubType .. ' ' .. text .. ' ' .. itemLevel
        end

        printEquip(texture, itemName, text, count, colors)
        return
      end
    end

    printItemCount(texture, itemName, '', count, colors)
    return
  end
end

function handleCurrency (link, count)
  if (ShiGuangDB.Farmer_hideInArena == true and
      IsActiveBattlefieldArena() == true) then return end
  local name, amount, texture, earnedThisWeek, weeklyMax, totalMax, isDicovered,
        rarity = GetCurrencyInfo(link)
  local text = 'x' .. count .. ' (' .. amount .. ')'

  printItem(texture, text, {1, 0.9, 0, 1})
end

function displayLoot ()
  if (lootStack == nil) then
    return
  end

  if (ShiGuangDB.Farmer_hideInArena == true and
      IsActiveBattlefieldArena() == true) then
    lootStack = nil
    return
  end

  for key, value in pairs (lootStack) do
    if (value.count > 0) then
      handleItem(key, value.count, value.totalCount)
      value.count = 0
    end
  end
end


function events:UNIT_INVENTORY_CHANGED (arg)
  if (arg ~= 'player') then return end
end

function events:LOOT_READY (lootSwitch)
  mapShown = WorldMapFrame:IsShown()
  if (lootSwitch == true and ShiGuangDB.Farmer_fastLoot == true) then performAutoLoot()
    if (LootFrame:IsShown() == true) then LootFrame:SetAlpha(1) end else LootFrame:SetAlpha(1)
  end
end

function events:LOOT_CLOSED ()
  LootFrame:SetAlpha(0)
  if (mapShown == true) then WorldMapFrame:Show() mapShown = false end
end

function events:CHAT_MSG_LOOT (message, _, _, _, unit)
  -- prevents string parsing in groups/raids
  if (unit ~= UnitName('player')) then return end
  
  local list = messagePatterns.CHAT_MSG_LOOT
  if (lootStack == nil) then lootStack = {} end
  farmerFrame:SetScript('OnUpdate', function ()
    farmerFrame:SetScript('OnUpdate', nil)
    displayLoot()
  end)
  for k = 1, #list do
    local v = list[k]
    local link, amount = string.match(message, v)
    if link ~= nil then
      if (amount == nil) then amount = 1 else amount = tonumber(amount) end
      if (lootStack[link] == nil) then
        lootStack[link] = {
          ['count'] = amount,
          ['totalCount'] = amount
        }
      else
        lootStack[link].count = lootStack[link].count + amount
        lootStack[link].totalCount = lootStack[link].totalCount + amount
      end
      return
    end
  end
end

function events:BAG_UPDATE_DELAYED ()
  if (lootStack == nil) then return end
  if (ShiGuangDB.Farmer_hideInArena == true and IsActiveBattlefieldArena() == true) then lootStack = nil return end
  for key, value in pairs (lootStack) do if (value.count > 0) then handleItem(key, value.count, 0) end end
  lootStack = nil
end

function events:CHAT_MSG_CURRENCY (message)
  if (ShiGuangDB.Farmer_currency ~= true) then return end
  local list = messagePatterns.CHAT_MSG_CURRENCY
  for k = 1, #list do
    local v = list[k]
    local link, amount = string.match(message, v)
    if (link ~= nil) then
      if (amount == nil) then amount = 1 end
      handleCurrency(link, amount)
      break
    end
  end
end

function events:PLAYER_MONEY ()
  if (ShiGuangDB.Farmer_money == false) then return end
  local money = GetMoney()
  if (moneyStamp >= money) then moneyStamp = money return end
  local gold = math.floor((money - moneyStamp) / 10000)
  local silver = math.floor((money - moneyStamp) / 100) % 100
  local copper = (money - moneyStamp) % 100
  local text = ''
  moneyStamp = money
  if (gold ~= 0) then text = text .. ' ' .. GOLD_AMOUNT_TEXTURE:format(gold, 0, 0) end
  if (silver ~= 0) then text = text .. ' ' .. SILVER_AMOUNT_TEXTURE:format(silver, 0, 0) end
  if (copper ~= 0) then text = text .. ' ' .. COPPER_AMOUNT_TEXTURE:format(copper, 0, 0) end
  farmerFrame:AddMessage(string.sub(text, 2), 1, 1, 1, 1)
end

farmerFrame = CreateFrame('ScrollingMessageFrame', 'farmerFrame', UIParent)
farmerFrame:SetWidth(GetScreenWidth() / 2)
farmerFrame:SetHeight(GetScreenHeight() / 2)
farmerFrame:SetFrameStrata('DIALOG')
farmerFrame:SetFrameLevel(2)
farmerFrame:SetFading(true)
farmerFrame:SetFadeDuration(0.5)
farmerFrame:SetMaxLines(21)
farmerFrame:SetInsertMode('TOP')
farmerFrame:SetFontObject(CreateFont("farmerFont"))
farmerFrame:SetScale(1)
farmerFrame:SetScale(1 / farmerFrame:GetEffectiveScale())
farmerFrame:Show()
farmerFrame:SetScript('OnEvent', function (self, event, ...) if IsAddOnLoaded("lsToasts") then return end events[event](self, ...) end)
for k, v in pairs(events) do farmerFrame:RegisterEvent(k) end