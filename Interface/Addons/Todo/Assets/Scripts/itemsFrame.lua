-- Namespaces
local _, todoTable = ...;
todoTable.itemsFrame = {}; -- adds itemsFrame table to addon namespace

local config = todoTable.config;
local itemsFrame = todoTable.itemsFrame;

-- Variables declaration --
local L = config.L;
local LDD = config.LDD;
itemsFrame.todoButton = 0; -- so we can access it here, even though we create it in init.lua

local itemsFrameUI;
local AllTab, DailyTab, MidweekTab, WeeklyTab, CurrentTab;

-- reset variables
local clearing, undoing = false, { ["clear"] = false, ["clearnb"] = 0, ["single"] = false, ["singleok"] = true};
local movingItem, movingCategory = false, false
local dontReloadPls = false

local checkBtn = {};
local removeBtn = {};
local favoriteBtn = {};
local descBtn = {};
local descFrames = {};
local label = {};
local editBox = {};
local categoryLabelFavsRemaining = {};
local addACategoryClosed = true;
local tabActionsClosed = true;
local optionsClosed = true;
local autoResetedThisSession = false;

-- these are for code comfort (sort of)

-- tutorial
local tutorialFrames = {}
local tutorialFramesTarget = {}
local tuto_order = { "addNewCat", "addCat", "addItem", "accessOptions", "getMoreInfo", "ALTkey" }

-- other
local shownInTab = {}
local hyperlinkEditBoxes = {}
local addACategoryItems = {}
local tabActionsItems = {}
local frameOptionsItems = {}
local currentDBItemsList;
local categoryNameWidthMax = 480; --220;
local itemNameWidthMax = 480; -- 240;
local centerXOffset = 0;
local lineOffset = 120;
local padding = 10;
local descFrameLevelDiff = 20;
local tutoFrameRightDist = 40;
local cursorX, cursorY, cursorDist = 0, 0, 10; -- for my special drag

local ItemsFrame_Update;
local ItemsFrame_UpdateTime;
local Tab_OnClick;

local updateRate = 0.05;
local refreshRate = 1;

--------------------------------------
-- General functions
--------------------------------------

function itemsFrame:Toggle()
  -- changes the visibility of the Todo frame
  if (not itemsFrameUI:IsShown()) then -- We update the frame if we are about to show it
    ItemsFrame_UpdateTime()
    ItemsFrame_Update()
  end
  itemsFrameUI:SetShown(not itemsFrameUI:IsShown())
end

function itemsFrame:ReloadTab(tabGlobalWidgetName)
  Todo.db.profile.lastLoadedTab = tabGlobalWidgetName or Todo.db.profile.lastLoadedTab

  if (dontReloadPls) then
    dontReloadPls = false
    return;
  end

  -- // ************************************************************* // --

  if ((not undoing["clear"] and not undoing["single"]) and Todo.db.profile.deleteAllTabItems) then -- OPTION: delete checked 'All' tab items
    for catName, items in pairs(Todo.db.profile.itemsList) do -- for every item
      for itemName, data in pairs(items) do
        if (data.tabName == "All") then
          if (data.checked) then
            dontReloadPls = true
            itemsFrame:RemoveItem(removeBtn[catName][itemName])
          end
        end
      end
    end
  end

  Tab_OnClick(_G[Todo.db.profile.lastLoadedTab])
end

function Todo:EditBoxInsertLink(text)
  -- when we shift-click on things, we hook the link from the chat function,
  -- and add it to the one of my edit boxes who has the focus (if there is one)
  -- basically, it's what allow hyperlinks in my addon edit boxes
  for _, v in pairs(hyperlinkEditBoxes) do
		if v and v:IsVisible() and v:HasFocus() then
			v:Insert(text)
			return true
		end
	end
end

local function ItemIsInTab(itemTabName, tabName)
  return ((tabName == "All" and not Todo.db.profile.showOnlyAllTabItems) or itemTabName == tabName)
end

local function ItemIsHiddenInResetTab(catName, itemName)
  local checked = Todo.db.profile.itemsList[catName][itemName].checked
  local itemTabName = Todo.db.profile.itemsList[catName][itemName].tabName

  if (checked) then
    -- if it's a checked daily item and we have to hide these, same for weekly
    if ((Todo.db.profile.hideDailyTabItems and itemTabName == "Daily")
    or (Todo.db.profile.hideMidweekTabItems and itemTabName == "Midweek")
    or (Todo.db.profile.hideWeeklyTabItems and itemTabName == "Weekly")) then
      return true
    end
  end

  return false
end

function itemsFrame:GetCategoriesOrdered()
  -- returns a table containing the name of every category there is, ordered
  local categories = {}

  for category in pairs(Todo.db.profile.itemsList) do table.insert(categories, category) end
  table.sort(categories);

  return categories
end

-- actions
local function ScrollFrame_OnMouseWheel(self, delta)
  -- defines how fast we can scroll throught the tabs (here: 35)
  local newValue = self:GetVerticalScroll() - (delta * 35);

  if (newValue < 0) then
    newValue = 0;
  elseif (newValue > self:GetVerticalScrollRange()) then
    newValue = self:GetVerticalScrollRange();
  end

  self:SetVerticalScroll(newValue);
end

local function FrameAlphaSlider_OnValueChanged(_, value)
  -- itemsList frame part
  Todo.db.profile.frameAlpha = value;
  itemsFrameUI.frameAlphaSliderValue:SetText(value);
  itemsFrameUI:SetBackdropColor(0, 0, 0, value/100);
  itemsFrameUI:SetBackdropBorderColor(1, 1, 1, value/100);

  -- description frames part
  if (Todo.db.profile.affectDesc) then
    Todo.db.profile.descFrameAlpha = value;
  end

  value = Todo.db.profile.descFrameAlpha;

  for _, v in pairs(descFrames) do
    v:SetBackdropColor(0, 0, 0, value/100);
    v:SetBackdropBorderColor(1, 1, 1, value/100);
    for k, x in pairs(v.descriptionEditBox) do
      if (type(k) == "string") then
        if (string.sub(k, k:len()-2, k:len()) == "Tex") then
          x:SetAlpha(value/100)
        end
      end
    end
  end
end

local function FrameContentAlphaSlider_OnValueChanged(_, value)
  -- itemsList frame part
  Todo.db.profile.frameContentAlpha = value;
  itemsFrameUI.frameContentAlphaSliderValue:SetText(value);
  itemsFrameUI.ScrollFrame.ScrollBar:SetAlpha((value)/100);
  itemsFrameUI.closeButton:SetAlpha((value)/100);
  itemsFrameUI.resizeButton:SetAlpha((value)/100);
  -- for i = 1, 3 do
  --   _G["TodoUIFrameTab"..i.."Text"]:SetAlpha((value)/100);
  --   _G["TodoUIFrameTab"..i].content:SetAlpha((value)/100);
  -- end

  -- description frames part
  if (Todo.db.profile.affectDesc) then
    Todo.db.profile.descFrameContentAlpha = value;
  end

  value = Todo.db.profile.descFrameContentAlpha;

  for _, v in pairs(descFrames) do
    v.closeButton:SetAlpha(value/100);
    v.clearButton:SetAlpha(value/100);
    -- the title is already being cared for in the update of the desc frame
    v.descriptionEditBox.EditBox:SetAlpha(value/100);
    v.descriptionEditBox.ScrollBar:SetAlpha(value/100);
    v.resizeButton:SetAlpha(value/100);
  end
end

local function SetFocusEditBox(editBox) -- DRY
  editBox:SetFocus()
  if (Todo.db.profile.highlightOnFocus) then
    editBox:HighlightText()
  else
    editBox:HighlightText(0, 0)
  end
end

-- frame functions
function itemsFrame:ResetBtns(tabName, auto)
  -- this function's goal is to reset (uncheck) every item in the given tab
  -- "auto" is to differenciate the user pressing the uncheck button and the auto reset
  local uncheckedSomething = false;

  for catName, items in pairs(Todo.db.profile.itemsList) do -- for every check buttons
    for itemName, data in pairs(items) do
      if (ItemIsInTab(data.tabName, tabName)) then -- if it is in the selected tab
        if (checkBtn[catName][itemName]:GetChecked()) then
          uncheckedSomething = true;
        end

        checkBtn[catName][itemName]:SetChecked(false); -- we uncheck it
        checkBtn[catName][itemName]:GetScript("OnClick")(checkBtn[catName][itemName]); -- and call its click handler so that it can do its things and update correctly
      end
    end
  end

  if (uncheckedSomething) then -- so that we print this message only if there was checked items before the uncheck
    if (tabName == "All") then
      config:Print(L["Unchecked everything!"]);
    else
      config:Print(config:SafeStringFormat(L["Unchecked %s tab!"], L[tabName]));
    end
    itemsFrame:ReloadTab()
  elseif (not auto) then -- we print this message only if it was the user's action that triggered this function (not the auto reset)
    config:Print(L["Nothing to uncheck here!"]);
  end
end

function itemsFrame:CheckBtns(tabName)
  -- this function's goal is to check every item in the selected tab
  local checkedSomething = false;

  for catName, items in pairs(Todo.db.profile.itemsList) do -- for every item
    for itemName, data in pairs(items) do
      if (ItemIsInTab(data.tabName, tabName)) then -- if it is in the selected tab
        if (not checkBtn[catName][itemName]:GetChecked()) then
          checkedSomething = true;
        end

        checkBtn[catName][itemName]:SetChecked(true); -- we check it, and the OnValueChanged will update the frame
        checkBtn[catName][itemName]:GetScript("OnClick")(checkBtn[catName][itemName]); -- and call its click handler so that it can do its things and update correctly
    end
    end
  end

  if (checkedSomething) then -- so that we print this message only if there was checked items before the uncheck
    if (tabName == "All") then
      config:Print(L["Checked everything!"]);
    else
      config:Print(config:SafeStringFormat(L["Checked %s tab!"], L[tabName]));
    end
    itemsFrame:ReloadTab()
  else
    config:Print(L["Nothing to check here!"]);
  end
end

function itemsFrame:updateRemainingNumber()
  -- we get how many things there is left to do in every tab,
  -- it's the big important function that gives us every number, checked and unchecked, favs or not
  local tab = itemsFrameUI.remainingNumber:GetParent();

  local numberCheckedAll, numberCheckedDaily, numberCheckedMidweek, numberCheckedWeekly = 0, 0, 0, 0;
  local numberCheckedFavAll, numberCheckedFavDaily, numberCheckedFavMidweek, numberCheckedFavWeekly = 0, 0, 0, 0;
  local numberUncheckedAll, numberUncheckedDaily, numberUncheckedMidweek, numberUncheckedWeekly = 0, 0, 0, 0;
  local numberUncheckedFavAll, numberUncheckedFavDaily, numberUncheckedFavMidweek, numberUncheckedFavWeekly = 0, 0, 0, 0;
  for _, items in pairs(Todo.db.profile.itemsList) do -- for every item
    for _, data in pairs(items) do
      -- All tab
      if (ItemIsInTab(data.tabName, "All")) then
        if (data.checked) then
          numberCheckedAll = numberCheckedAll + 1 -- then it's one more done
          if (data.favorite) then -- and we check for the favorite state too
            numberCheckedFavAll = numberCheckedFavAll + 1
          end
        else
          numberUncheckedAll = numberUncheckedAll + 1
          if (data.favorite) then
            numberUncheckedFavAll = numberUncheckedFavAll + 1
          end
        end
      end
      -- Daily tab
      if (ItemIsInTab(data.tabName, "Daily")) then
        if (data.checked) then
          numberCheckedDaily = numberCheckedDaily + 1
          if (data.favorite) then
            numberCheckedFavDaily = numberCheckedFavDaily + 1
          end
        else
          numberUncheckedDaily = numberUncheckedDaily + 1
          if (data.favorite) then
            numberUncheckedFavDaily = numberUncheckedFavDaily + 1
          end
        end
      end
      -- Midweek tab
      if (ItemIsInTab(data.tabName, "Midweek")) then
        if (data.checked) then
          numberCheckedMidweek = numberCheckedMidweek + 1
          if (data.favorite) then
            numberCheckedFavMidweek = numberCheckedFavMidweek + 1
          end
        else
          numberUncheckedMidweek = numberUncheckedMidweek + 1
          if (data.favorite) then
            numberUncheckedFavMidweek = numberUncheckedFavMidweek + 1
          end
        end
      end
      -- Weekly tab
      if (ItemIsInTab(data.tabName, "Weekly")) then
        if (data.checked) then
          numberCheckedWeekly = numberCheckedWeekly + 1
          if (data.favorite) then
            numberCheckedFavWeekly = numberCheckedFavWeekly + 1
          end
        else
          numberUncheckedWeekly = numberUncheckedWeekly + 1
          if (data.favorite) then
            numberUncheckedFavWeekly = numberUncheckedFavWeekly + 1
          end
        end
      end
    end
  end

  -- we update the number of remaining things to do for the current tab
  local hex = config:RGBToHex({ Todo.db.profile.favoritesColor[1]*255, Todo.db.profile.favoritesColor[2]*255, Todo.db.profile.favoritesColor[3]*255} );
  if (tab == AllTab) then
    itemsFrameUI.remainingNumber:SetText(((numberUncheckedAll > 0) and "|cffffffff" or "|cff00ff00")..numberUncheckedAll.."|r "..((numberUncheckedFavAll > 0) and string.format("|cff%s%s|r", hex, "("..numberUncheckedFavAll..")") or ""));
  elseif (tab == DailyTab) then
    itemsFrameUI.remainingNumber:SetText(((numberUncheckedDaily > 0) and "|cffffffff" or "|cff00ff00")..numberUncheckedDaily.."|r "..((numberUncheckedFavDaily > 0) and string.format("|cff%s%s|r", hex, "("..numberUncheckedFavDaily..")") or ""));
  elseif (tab == MidweekTab) then
    itemsFrameUI.remainingNumber:SetText(((numberUncheckedMidweek > 0) and "|cffffffff" or "|cff00ff00")..numberUncheckedMidweek.."|r "..((numberUncheckedFavMidweek > 0) and string.format("|cff%s%s|r", hex, "("..numberUncheckedFavMidweek..")") or ""));
  elseif (tab == WeeklyTab) then
    itemsFrameUI.remainingNumber:SetText(((numberUncheckedWeekly > 0) and "|cffffffff" or "|cff00ff00")..numberUncheckedWeekly.."|r "..((numberUncheckedFavWeekly > 0) and string.format("|cff%s%s|r", hex, "("..numberUncheckedFavWeekly..")") or ""));
  end
  -- same for the category label ones
  for catName in pairs(label) do -- for every category labels
    local nbFavCat = 0
    for _, data in pairs(Todo.db.profile.itemsList[catName]) do -- and for every items in them
      if (ItemIsInTab(data.tabName, tab:GetName())) then -- if the current loop item is in the tab we're on
        if (data.favorite) then -- and it's a favorite
          if (not data.checked) then -- and it's not checked
            nbFavCat = nbFavCat + 1 -- then it's one more remaining favorite hidden in the closed category
          end
        end
      end
    end
    categoryLabelFavsRemaining[catName]:SetText((nbFavCat > 0) and "("..nbFavCat..")" or "")
    categoryLabelFavsRemaining[catName]:SetTextColor(unpack(Todo.db.profile.favoritesColor))
  end

  itemsFrame.todoButton:SetNormalFontObject("GameFontNormal"); -- by default, we reset the color of the Todo button to yellow
  if (Todo.db.profile.todoButton.red) then -- we check here if we need to color it red here
    local red = false
    -- we first check if there are daily remaining items
    if (numberUncheckedDaily > 0) then
      if ((Todo.db.profile.autoReset["Daily"] - time()) < 86400) then -- pretty much all the time
        red = true
      end
    end

    -- then we check if there are midweek remaining items
    if (numberUncheckedMidweek > 0) then
      if ((Todo.db.profile.autoReset["Midweek"] - time()) < 86400) then -- if there is less than one day left before the midweek reset
        red = true
      end
    end

    -- then we check if there are weekly remaining items
    if (numberUncheckedWeekly > 0) then
      if ((Todo.db.profile.autoReset["Weekly"] - time()) < 86400) then -- if there is less than one day left before the weekly reset
        red = true
      end
    end

    if (red) then
      local font = itemsFrame.todoButton:GetNormalFontObject()
      if (font) then
        font:SetTextColor(1, 0, 0, 1) -- red
        itemsFrame.todoButton:SetNormalFontObject(font)
      end
    end
  end

  local checked = {}
  checked.All = numberCheckedAll
  checked.Daily = numberCheckedDaily
  checked.Midweek = numberCheckedMidweek
  checked.Weekly = numberCheckedWeekly
  local checkedFavs = {}
  checkedFavs.All = numberCheckedFavAll
  checkedFavs.Daily = numberCheckedFavDaily
  checkedFavs.Midweek = numberCheckedFavMidweek
  checkedFavs.Weekly = numberCheckedFavWeekly
  local unchecked = {}
  unchecked.All = numberUncheckedAll
  unchecked.Daily = numberUncheckedDaily
  unchecked.Midweek = numberUncheckedMidweek
  unchecked.Weekly = numberUncheckedWeekly
  local uncheckedFavs = {}
  uncheckedFavs.All = numberUncheckedFavAll
  uncheckedFavs.Daily = numberUncheckedFavDaily
  uncheckedFavs.Midweek = numberUncheckedFavMidweek
  uncheckedFavs.Weekly = numberUncheckedFavWeekly
  return checked, checkedFavs, unchecked, uncheckedFavs; -- and we return them, so that we can access it eg. in the favorites warning function
end

function itemsFrame:updateCheckButtonsColor()
  for catName, items in pairs(Todo.db.profile.itemsList) do -- for every check buttons
    for itemName, data in pairs(items) do
      -- we color them in a color corresponding to their checked state
      if (checkBtn[catName][itemName]:GetChecked()) then
        checkBtn[catName][itemName].InteractiveLabel.Text:SetTextColor(0, 1, 0);
      else
        if (data.favorite) then
          checkBtn[catName][itemName].InteractiveLabel.Text:SetTextColor(unpack(Todo.db.profile.favoritesColor));
        else
          checkBtn[catName][itemName].InteractiveLabel.Text:SetTextColor(unpack(config:ThemeDownTo01(config.database.theme_yellow)));
        end
      end
    end
  end
end

-- Saved variable functions

function itemsFrame:autoReset()
  if time() > Todo.db.profile.autoReset["Weekly"] then
    Todo.db.profile.autoReset["Daily"] = config:GetSecondsToReset().daily;
    Todo.db.profile.autoReset["Midweek"] = config:GetSecondsToReset().midweek;
    Todo.db.profile.autoReset["Weekly"] = config:GetSecondsToReset().weekly;
    itemsFrame:ResetBtns("Daily", true);
    itemsFrame:ResetBtns("Midweek", true);
    itemsFrame:ResetBtns("Weekly", true);
    autoResetedThisSession = true;

  elseif time() > Todo.db.profile.autoReset["Midweek"] then
    Todo.db.profile.autoReset["Midweek"] = config:GetSecondsToReset().midweek;
    itemsFrame:ResetBtns("Midweek", true);
    autoResetedThisSession = true;

  elseif time() > Todo.db.profile.autoReset["Daily"] then
    Todo.db.profile.autoReset["Daily"] = config:GetSecondsToReset().daily;
    itemsFrame:ResetBtns("Daily", true);
    autoResetedThisSession = true;
  end
end

function itemsFrame:autoResetedThisSessionGET()
  return autoResetedThisSession;
end

-- Items modifications

local function refreshTab(catName, itemName, action, modif)
  -- if the last tab we were on is getting an update
  -- because of an add or remove of an item, we re-update it

  if (modif) then
    -- Removing case
    if (action == "Remove") then
      removeBtn[catName][itemName] = nil;
      favoriteBtn[catName][itemName] = nil;
      descBtn[catName][itemName] = nil;
      checkBtn[catName][itemName]:Hide(); -- get out of my view mate
      checkBtn[catName][itemName] = nil;
    end

    -- Adding case
    if (action == "Add") then
      -- we create the corresponding label (if it is a new one)
      if (label[catName] == nil) then
        itemsFrame:CreateMovableLabelElems(catName)
      end
      -- we create the new check button
      itemsFrame:CreateMovableCheckBtnElems(catName, itemName)
    end

    itemsFrame:ReloadTab() -- we reload the tab to instantly display the changes
  end
end

local function addCategory()
  -- the big function to add categories

  local db = {}
  db.catName = itemsFrameUI.categoryEditBox:GetText();



  if (db.catName == "") then
    config:PrintForced(L["Please enter a category name!"])
    SetFocusEditBox(itemsFrameUI.categoryEditBox)
    return;
  end

  local l = config:CreateNoPointsLabel(itemsFrameUI, nil, db.catName);
  if (l:GetWidth() > categoryNameWidthMax) then
    config:PrintForced(L["This categoty name is too big!"])
    SetFocusEditBox(itemsFrameUI.categoryEditBox)
    return;
  end

  db.itemName = itemsFrameUI.nameEditBox:GetText();
  if (db.itemName == "") then
    config:PrintForced(L["Please enter the name of the item!"])
    SetFocusEditBox(itemsFrameUI.nameEditBox)
    return;
  end

  local l = config:CreateNoPointsLabel(itemsFrameUI, nil, db.itemName);
  if (l:GetWidth() > itemNameWidthMax and config:HasHyperlink(db.itemName)) then l:SetFontObject("GameFontNormal") end -- if it has an hyperlink in it and it's too big, we allow it to be a liitle longer, considering hyperlinks take more place
  if (l:GetWidth() > itemNameWidthMax) then -- then we recheck to see if the item is not too long for good
    config:PrintForced(L["This item name is too big!"])
    SetFocusEditBox(itemsFrameUI.nameEditBox)
    return;
  end

  db.tabName = itemsFrameUI.categoryButton:GetParent():GetName();
  db.checked = false;

  -- this one is for clearing the text of both edit boxes IF the adding is a success
  db.form = true;

  itemsFrame:AddItem(nil, db);

  -- after the adding, we give back the focus to the edit box that needs it, depending on if it was a success or not
  if (itemsFrameUI.categoryEditBox:GetText() == "") then-- if the adding was a success, it should have cleared both edit boxes
    SetFocusEditBox(itemsFrameUI.categoryEditBox) -- so we go back to the category edit box
  else -- but if it wasn't cleared, it means the adding failed
    SetFocusEditBox(itemsFrameUI.nameEditBox) -- and that can only mean one thing: the item name is the problem, so we go back to it
  end
end

function itemsFrame:RenameCategory(oldCatName, newCatName)
  -- so first, we check if the category was closed in some tabs or not,
  -- and save this closed data to put it to the new category after the rename
  local closedData = nil
  if (config:HasKey(Todo.db.profile.closedCategories, oldCatName) and Todo.db.profile.closedCategories[oldCatName] ~= nil) then
    closedData = config:Deepcopy(Todo.db.profile.closedCategories[oldCatName]) -- we need to deepcopy it since it's a table
  end

  -- then we can start renaming the category
  -- basically, it's the same process from the MoveItem func, just through a for loop so we do every item in the category
  movingCategory = true
  for itemName, data in pairs(Todo.db.profile.itemsList[oldCatName]) do -- for every item in the category
    itemsFrame:MoveItem(oldCatName, newCatName, itemName, itemName, data.tabName) -- we move it to the new cat
  end
  movingCategory = false

  -- and finally, we put back the closed category data
  Todo.db.profile.closedCategories[newCatName] = closedData

  itemsFrame:ReloadTab() -- we reload the tab to instantly display the changes
end

function itemsFrame:AddItem(self, db)
  -- the big big function to add items

  local addResult = {"", false}; -- message to be displayed in result of the function and wether there was an adding or not
  local willCreateNewCat = false;
  local itemName, tabName, catName, checked;
  local defaultNewItemsTable = {
    ["tabName"] = "All",
    ["checked"] = false,
  }

  if (type(db) ~= "table") then
    -- if we're here, it means that we added a new item from the edit box next to the category names
    -- and self is the edit box itself
    catName = self:GetName(); -- we get the category we're adding the item in (it's the name of the edit box)
    itemName = self:GetText(); -- we get the item name the player entered (the text inside the edit box)
    tabName = self:GetParent():GetName(); -- we get the tab we're on (the name of the edit box's parent)
    checked = false;

    -- there we check if the item name is not too big
    local l = config:CreateNoPointsLabel(itemsFrameUI, nil, itemName);
    if (l:GetWidth() > itemNameWidthMax and config:HasHyperlink(itemName)) then l:SetFontObject("GameFontNormal") end -- if it has an hyperlink in it and it's too big, we allow it to be a liitle longer, considering hyperlinks take more place
    if (l:GetWidth() > itemNameWidthMax) then -- then we recheck to see if the item is not too long for good
      config:PrintForced(L["This item name is too big!"])
      return;
    end
  else
    -- undoing / adding from category form
    catName = db.catName;
    itemName = db.itemName;
    tabName = db.tabName;
    checked = db.checked;

    if (catName == nil or itemName == nil or tabName == nil or checked == nil) then -- I prefer to do 'X == nil' than 'not X' bc checked is a boolean, this if is here to check that we do have a value in each of the variables, and those are the basic needed ones
      -- this is the safe code, we can get here after the 5.5 update if we had some old undos in stock and decided to undo them
      -- so we take their old data names
      catName = db.cat;
      itemName = db.name;
      tabName = db.case;
      checked = db.checked;
    end
  end

  if (itemName == "") then
    addResult = {L["Please enter the name of the item!"], false};
  else -- if we typed something
    local catAlreadyExists = config:HasKey(Todo.db.profile.itemsList, catName);
    if (not catAlreadyExists) then -- that means we'll be adding something to a new category, so we create the table to hold all theses shiny new items
      Todo.db.profile.itemsList[catName] = {};
      willCreateNewCat = true;
    end

    local isPresentInCurrentTab = false;
    if (config:HasKey(Todo.db.profile.itemsList[catName], itemName)) then -- if it's present somewhere in the category
        -- and if we're trying to add in the All tab, it's basically obliged to be already there
        -- but if we're adding somewhere else, it depends if the reset tab is the same or not
        -- it's done in a special (and maybe weird) way, but isPresentInCurrentTab needs to return if the item that's already here is in the same tab we are in or not
        isPresentInCurrentTab = tabName == "All" or Todo.db.profile.itemsList[catName][itemName].tabName == tabName;
    end

    if (isPresentInCurrentTab) then
      addResult = {L["This item is already here in this category!"], false};
    else -- if it's not in the current category in the current tab
      if (tabName == "All") then -- then we are creating a new item for the current cat in the All tab --CASE1 (add in 'All' tab)
        Todo.db.profile.itemsList[catName][itemName] = defaultNewItemsTable;
        addResult = {config:SafeStringFormat(L["\"%s\" added to %s! ('All' tab item)"], itemName, catName), true};
      else -- then we'll try to add the item as daily/weekly for the current cat in the current tab
        if (config:HasKey(Todo.db.profile.itemsList[catName], itemName)) then -- if it exists in the category, we search where
          -- checking...
          local data = Todo.db.profile.itemsList[catName][itemName];
          if (data.tabName ~= "All" and data.tabName ~= tabName) then -- if the item already exists in this category but in an other reset tab
            addResult = {L["No item can be daily, midweek, and weekly!"], false};
          else -- if it isn't in the other reset tab, it means that the item is in the All tab -- CASE2 (add in reset tab, already in All)
            checked = data.checked -- in that case, we update the checked state to match the one the item had in the All tab
            data.tabName = tabName; -- and we transform that item into a 'tabName' item for this category
            addResult = {config:SafeStringFormat(L["\"%s\" added to %s! (%s item)"], itemName, catName, L[tabName]), true};
          end
        else -- if that new reset item doesn't exists at all in that category, we create it -- CASE3 (add in 'All' tab and add in reset tab)
          Todo.db.profile.itemsList[catName][itemName] = defaultNewItemsTable;
          Todo.db.profile.itemsList[catName][itemName].tabName = tabName;
          addResult = {config:SafeStringFormat(L["\"%s\" added to %s! (%s item)"], itemName, catName, L[tabName]), true};
        end
      end
    end
  end

  if (willCreateNewCat and not addResult[2]) then -- if we didn't add anything and it was supposed to create a new category, we cancel our move and nil this false new empty category
    Todo.db.profile.itemsList[catName] = nil;
  end

  -- okay so we print only if we're not in a clear undo process / single undo process but failed
  if (undoing["single"]) then undoing["singleok"] = addResult[2]; end
  if (not undoing["clear"] and not (undoing["single"] and not undoing["singleok"])) and not movingItem then
    if (addResult[2]) then
      config:Print(addResult[1]);
    else
      config:PrintForced(addResult[1]);
    end
  elseif (addResult[2]) then undoing["clearnb"] = undoing["clearnb"] + 1; end

  if (addResult[2]) then -- if the adding was succesfull
    -- then we don't forget to set the checked state of the new item
    Todo.db.profile.itemsList[catName][itemName].checked = checked;

    -- and we clear some visuals
    if (type(db) ~= "table") then -- if we come from the edit box to add an item next to the category name label
      self:SetText(""); -- but we clear it since our query was succesful
    elseif (type(db) == "table" and db.form) then -- if we come from the Add a category form
      itemsFrameUI.categoryEditBox:SetText("");
      itemsFrameUI.nameEditBox:SetText("");

      -- tutorial
      itemsFrame:ValidateTutorial("addCat");
    end
  end

  refreshTab(catName, itemName, "Add", addResult[2]);
end

function itemsFrame:RemoveItem(self)
  -- the really important function to delete items
  -- if we're here, we're forced to delete an item so the result will be true in any case

  local catName, itemName = self:GetParent().catName, self:GetParent().itemName;
  local data = Todo.db.profile.itemsList[catName][itemName];

  -- since the item will get removed, we check if his description frame was opened (can happen if there was no description on the item)
  -- and if so, we hide and destroy it
  itemsFrame:descriptionFrameHide("Todo_DescFrame_"..catName.."_"..itemName)

  -- undo part
  if (not movingItem) then
    local db = {
      ["catName"] = catName,
      ["itemName"] = itemName,
      ["tabName"] = data.tabName,
      ["checked"] = data.checked,
    }
    table.insert(Todo.db.profile.undoTable, db);
  end

  -- remove part
  Todo.db.profile.itemsList[catName][itemName] = nil;

  if (not clearing and not movingItem) then
    config:Print(config:SafeStringFormat(L["\"%s\" removed!"], itemName));
  end

  refreshTab(catName, itemName, "Remove", true);
end

function itemsFrame:MoveItem(oldCatName, newCatName, oldItemName, newItemName, newTabName)
  -- so first, we prep the database to send to the AddItem func
  local data = {
    ["catName"] = newCatName,
    ["itemName"] = newItemName,
    ["tabName"] = newTabName,
    ["checked"] = Todo.db.profile.itemsList[oldCatName][oldItemName].checked,
    -- while saving the old item's data while we're at it
    ["favorite"] = Todo.db.profile.itemsList[oldCatName][oldItemName].favorite,
    ["description"] = Todo.db.profile.itemsList[oldCatName][oldItemName].description
  }

  -- then we can start renaming
  movingItem = true
  itemsFrame:RemoveItem(removeBtn[oldCatName][oldItemName])
  itemsFrame:AddItem(nil, data)
  movingItem = false

  -- and finally, we put back the original item data
  Todo.db.profile.itemsList[newCatName][newItemName].favorite = data.favorite
  Todo.db.profile.itemsList[newCatName][newItemName].description = data.description

  itemsFrame:ReloadTab() -- we reload the tab to instantly display the changes
end

function itemsFrame:FavoriteClick(self)
  -- the function to favorite items

  local catName, itemName = self:GetParent().catName, self:GetParent().itemName;

  if (Todo.db.profile.itemsList[catName][itemName].favorite) then -- we set the new favorite state of the item
    Todo.db.profile.itemsList[catName][itemName].favorite = nil;
  else
    Todo.db.profile.itemsList[catName][itemName].favorite = true;
  end

  itemsFrame:ReloadTab() -- we reload the tab to instantly display the changes
end

function itemsFrame:descriptionFrameHide(name)
  -- here, if the name matches one of the opened description frames, we hide that frame, delete it from memory and reupdate the levels of every other active ones
  for pos, v in pairs(descFrames) do
    if (v:GetName() == name) then
      v:Hide()
      table.remove(hyperlinkEditBoxes, select(2, config:HasItem(hyperlinkEditBoxes, v.descriptionEditBox.EditBox))) -- removing the ref of the hyperlink edit box
      table.remove(descFrames, pos)
      for pos2, v2 in pairs(descFrames) do -- we reupdate the frame levels
        v2:SetFrameLevel(300 + (pos2-1)*descFrameLevelDiff)
      end
      return true;
    end
  end
  return false;
end

function itemsFrame:DescriptionClick(self)
  -- the big function to create the description frame for each items

  local catName, itemName = self:GetParent().catName, self:GetParent().itemName;

  if (itemsFrame:descriptionFrameHide("Todo_DescFrame_"..catName.."_"..itemName)) then return; end

  -- we create the mini frame holding the name of the item and his description in an edit box
  local descFrame = CreateFrame("Frame", "Todo_DescFrame_"..catName.."_"..itemName, UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil); -- importing the backdrop in the desc frames, as of wow 9.0
  local w = config:CreateNoPointsLabel(UIParent, nil, itemName):GetWidth();
  descFrame:SetSize((w < 180) and 180+75 or w+75, 110); -- 75 is large enough to place the closebutton, clearbutton, and a little bit of space at the right of the name

  -- background
  descFrame:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = false, tileSize = 1, edgeSize = 10, insets = { left = 1, right = 1, top = 1, bottom = 1 }});
  descFrame:SetBackdropColor(0, 0, 0, 1);

  -- properties
  descFrame:SetResizable(true);
  --descFrame:SetMinResize(descFrame:GetWidth(), descFrame:GetHeight());
  descFrame:SetFrameLevel(300 + #descFrames*descFrameLevelDiff);
  descFrame:SetMovable(true);
  descFrame:SetClampedToScreen(true);
  descFrame:EnableMouse(true);
  descFrame.timeSinceLastUpdate = 0; -- for the updating of the title's color and alpha
  descFrame.opening = 0; -- for the scrolling up on opening

  -- to move the frame
  descFrame:SetScript("OnMouseDown", function(self, button)
      if (button == "LeftButton") then
          self:StartMoving()
      end
  end)
  descFrame:SetScript("OnMouseUp", descFrame.StopMovingOrSizing)

  -- other scripts
  descFrame:SetScript("OnUpdate", function(self, elapsed)
    self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed;

    while (self.timeSinceLastUpdate > updateRate) do -- every 0.05 sec (instead of every frame which is every 1/144 (0.007) sec for a 144hz display... optimization :D)
      -- we update non-stop the color of the title
      local currentAlpha = Todo.db.profile.descFrameContentAlpha/100;
      if (checkBtn[catName][itemName]:GetChecked()) then
        self.title:SetTextColor(0, 1, 0, currentAlpha);
      else
        if (Todo.db.profile.itemsList[catName][itemName].favorite) then
          local r, g, b = unpack(Todo.db.profile.favoritesColor);
          self.title:SetTextColor(r, g, b, currentAlpha);
        else
          local r, g, b = unpack(config:ThemeDownTo01(config.database.theme_yellow));
          self.title:SetTextColor(r, g, b, currentAlpha);
        end
      end

      self.timeSinceLastUpdate = self.timeSinceLastUpdate - updateRate;
    end

    -- and we also update non-stop the width of the description edit box to match that of the frame if we resize it, and when the scrollbar kicks in. (this is the secret to make it work)
    self.descriptionEditBox.EditBox:SetWidth(self.descriptionEditBox:GetWidth() - (self.descriptionEditBox.ScrollBar:IsShown() and 15 or 0))

    if (self.opening < 5) then -- doing this only on the 5 first updates after creating the frame, i won't go into the details but updating the vertical scroll of this template is a real fucker :D
      self.descriptionEditBox:SetVerticalScroll(0)
      self.opening = self.opening + 1
    end
  end)

  -- position
  descFrame:ClearAllPoints();
  descFrame:SetParent(UIParent);
  descFrame:SetPoint("BOTTOMRIGHT", self, "TOPLEFT", 0, 0);
  descFrame:StartMoving(); -- to unlink it from the itemsframe
  descFrame:StopMovingOrSizing();

  -- / content of the frame / --

  -- resize button
  descFrame.resizeButton = CreateFrame("Button", nil, descFrame, "Todo_ResizeButton")
  descFrame.resizeButton:SetPoint("BOTTOMRIGHT")
  descFrame.resizeButton:SetScript("OnMouseDown", function(self, button)
    if (button == "LeftButton") then
      descFrame:StartSizing("BOTTOMRIGHT")
      self:GetHighlightTexture():Hide() -- more noticeable
    end
  end)
  descFrame.resizeButton:SetScript("OnMouseUp", function(self)
    descFrame:StopMovingOrSizing()
    self:GetHighlightTexture():Show()
  end)

  -- close button
  descFrame.closeButton = CreateFrame("Button", "closeButton", descFrame, "Todo_CloseButton");
  descFrame.closeButton:SetPoint("TOPRIGHT", descFrame, "TOPRIGHT", -2, -2);
  descFrame.closeButton:SetScript("OnClick", function(self)
      itemsFrame:descriptionFrameHide(self:GetParent():GetName())
  end);

  -- clear button
  descFrame.clearButton = CreateFrame("Button", "clearButton", descFrame, "Todo_ClearButton");
  descFrame.clearButton.tooltip = L["Clear"].."\n("..L["Right-click"]..')'
  descFrame.clearButton:SetPoint("TOPRIGHT", descFrame, "TOPRIGHT", -24, -2);
  descFrame.clearButton:RegisterForClicks("RightButtonUp")
  descFrame.clearButton:SetScript("OnClick", function(self)
      local eb = self:GetParent().descriptionEditBox.EditBox
      eb:SetText("")
      eb:GetScript("OnKeyUp")(eb)
  end);

  -- item label
  descFrame.title = descFrame:CreateFontString(itemName.."_descFrameTitle")
  descFrame.title:SetFontObject("GameFontNormal")
  descFrame.title:SetPoint("TOPLEFT", descFrame, "TOPLEFT", 6, -5)
  descFrame.title:SetText(itemName)
  descFrame:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
  descFrame:SetScript("OnHyperlinkClick", function(_, linkData, link, button)
    ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
  end);

  -- description edit box
  descFrame.descriptionEditBox = CreateFrame("ScrollFrame", itemName.."_descFrameEditBox", descFrame, "InputScrollFrameTemplate");
  descFrame.descriptionEditBox.EditBox:SetFontObject("ChatFontNormal")
  descFrame.descriptionEditBox.EditBox:SetAutoFocus(false)
  descFrame.descriptionEditBox.EditBox:SetMaxLetters(0)
  descFrame.descriptionEditBox.CharCount:Hide()
  descFrame.descriptionEditBox.EditBox.Instructions:SetFontObject("GameFontNormal")
  descFrame.descriptionEditBox.EditBox.Instructions:SetText(L["Add a description..."].."\n"..L["(automatically saved)"])
  descFrame.descriptionEditBox:SetPoint("TOPLEFT", descFrame, "TOPLEFT", 10, -30);
  descFrame.descriptionEditBox:SetPoint("BOTTOMRIGHT", descFrame, "BOTTOMRIGHT", -10, 10);
  if (Todo.db.profile.itemsList[catName][itemName].description) then -- if there is already a description for this item, we write it on frame creation
    descFrame.descriptionEditBox.EditBox:SetText(Todo.db.profile.itemsList[catName][itemName].description)
  end
  descFrame.descriptionEditBox.EditBox:SetScript("OnKeyUp", function(self)
    -- and here we save the description everytime we lift a finger (best auto-save possible I think)
    Todo.db.profile.itemsList[catName][itemName].description = (self:GetText() ~= "") and self:GetText() or nil;
    if (IsControlKeyDown()) then -- just in case we are ctrling-v, to color the icon
      descBtn[catName][itemName]:GetScript("OnShow")(descBtn[catName][itemName])
    end
  end)
  descFrame.descriptionEditBox.EditBox:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
  descFrame.descriptionEditBox.EditBox:SetScript("OnHyperlinkClick", function(_, linkData, link, button)
    ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
  end);
  table.insert(hyperlinkEditBoxes, descFrame.descriptionEditBox.EditBox)

  table.insert(descFrames, descFrame) -- we save it for level, hide, and alpha purposes

  -- we update the alpha if it needs to be
  FrameAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameAlpha);
  FrameContentAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameContentAlpha);

  itemsFrame:ReloadTab() -- we reload the tab to instantly display the changes
end

function itemsFrame:ClearTab(tabName)
  -- first we get how many items are favorites and how many have descriptions in this tab (they are protected, we won't clear them)
  local nbItems = 0;
  local nbProtected = 0;
  for _, items in pairs(Todo.db.profile.itemsList) do -- for every item
    for _, data in pairs(items) do
      if (ItemIsInTab(data.tabName, tabName)) then -- if it is one in the selected tab
        nbItems = nbItems + 1;
        if (data.favorite or data.description) then -- if it is a favorite or has a description
          nbProtected = nbProtected + 1;
        end
      end
    end
  end

  if (nbItems > nbProtected) then -- if there is at least one item that can be cleared in this tab
    -- we start the clear
    clearing = true;

    local nb = nbItems - nbProtected; -- but before (if we want to undo it) we keep in mind how many items there were to be cleared

    for catName, items in pairs(removeBtn) do -- for every remove button
      for itemName, btn in pairs(items) do
        if (ItemIsInTab(Todo.db.profile.itemsList[catName][itemName].tabName, tabName)) then -- if the item is in the tab we want to clear
          if (not Todo.db.profile.itemsList[catName][itemName].favorite and not Todo.db.profile.itemsList[catName][itemName].description) then -- if it's not a favorite nor it has a description
            itemsFrame:RemoveItem(btn); -- then we remove it
          end
        end
      end
    end

    table.insert(Todo.db.profile.undoTable, nb); -- and then we save how many items were actually removed

    clearing = false;
    config:Print(config:SafeStringFormat(L["Clear succesful! (%s tab, %i items)"], L[tabName], nb));
    itemsFrame:ReloadTab()
  else
    config:Print(L["Nothing can be cleared here!"]);
  end
end

function itemsFrame:UndoRemove()
  -- function to undo the last removes we did
  if (next(Todo.db.profile.undoTable)) then -- if there's something to undo
    if (type(Todo.db.profile.undoTable[#Todo.db.profile.undoTable]) ~= "table") then -- if it was a clear command
      -- we start undoing it
      undoing["clear"] = true;
      local nb = Todo.db.profile.undoTable[#Todo.db.profile.undoTable];
      table.remove(Todo.db.profile.undoTable, #Todo.db.profile.undoTable);
      for i = 1, nb do
        itemsFrame:AddItem(nil, Todo.db.profile.undoTable[#Todo.db.profile.undoTable]);
        table.remove(Todo.db.profile.undoTable, #Todo.db.profile.undoTable);
      end
      config:Print(config:SafeStringFormat(L["Clear undo succesful! (%i items added back)"], undoing["clearnb"]));
      undoing["clearnb"] = 0;
      undoing["clear"] = false;
    else -- if it was a simple remove
      undoing["single"] = true;
      itemsFrame:AddItem(nil, Todo.db.profile.undoTable[#Todo.db.profile.undoTable]);
      table.remove(Todo.db.profile.undoTable, #Todo.db.profile.undoTable);
      local pass = undoing["singleok"];
      undoing["singleok"] = true;
      undoing["single"] = false;
      if (not pass) then itemsFrame:UndoRemove() end -- if the single undo failed (because of the user AAAAH :D) we just do it one more time
    end
  else
    config:Print(L["No remove/clear to undo!"]);
  end
end

-- Frame update: --
ItemsFrame_Update = function()
  -- updates everything about the frame everytime we call this function
  itemsFrame:updateRemainingNumber();
  itemsFrame:updateCheckButtonsColor();
end

ItemsFrame_UpdateTime = function()
  -- updates things about time
  itemsFrame:autoReset();
end

local function ItemsFrame_OnVisibilityUpdate()
  -- things to do when we hide/show the list
  addACategoryClosed = true;
  tabActionsClosed = true;
  optionsClosed = true;
  itemsFrame:ReloadTab()
  Todo.db.profile.lastListVisibility = itemsFrameUI:IsShown()
end

local function ItemsFrame_Scale()
  local scale = 1; --240/340;
  --itemsFrameUI.ScrollFrame.ScrollBar:SetScale(scale)
  --itemsFrameUI.closeButton:SetScale(scale)
  --itemsFrameUI.resizeButton:SetScale(scale)
  for i = 1, 3 do
    _G["TodoUIFrameTab"..i].content:SetScale(scale)
    --_G["TodoUIFrameTab"..i]:SetScale(scale)
  end
  for _, v in pairs(tutorialFrames) do
    v:SetScale(scale)
  end
end

local timeElapsed = 0
local function ItemsFrame_OnUpdate(self, elapsed)
  -- called every frame
  self.timeSinceLastUpdate = self.timeSinceLastUpdate + elapsed;
  self.timeSinceLastRefresh = self.timeSinceLastRefresh + elapsed;

  timeElapsed = timeElapsed + elapsed
  if timeElapsed < .165 then
    return
  end
  timeElapsed = 0

  if (self.isMouseDown and not self.hasMoved) then
    local x, y = GetCursorPosition()
    if ((x > cursorX + cursorDist) or (x < cursorX - cursorDist) or (y > cursorY + cursorDist) or (y < cursorY - cursorDist)) then  -- we start dragging the frame
      self:StartMoving()
      self.hasMoved = true
    end
  end



  -- testing and showing the right button next to each items
  if (IsShiftKeyDown() and MouseIsOver(itemsFrameUI)) then
    for catName, items in pairs(Todo.db.profile.itemsList) do
      for itemName in pairs(items) do
        -- we show every star icons
        removeBtn[catName][itemName]:Hide()
        descBtn[catName][itemName]:Hide();
        favoriteBtn[catName][itemName]:Show();
      end
    end
  elseif (IsControlKeyDown() and MouseIsOver(itemsFrameUI)) then
    for catName, items in pairs(Todo.db.profile.itemsList) do
      for itemName in pairs(items) do
        -- we show every paper icons
        removeBtn[catName][itemName]:Hide()
        favoriteBtn[catName][itemName]:Hide();
        descBtn[catName][itemName]:Show();
      end
    end
  else
    for catName, items in pairs(Todo.db.profile.itemsList) do
      for itemName, data in pairs(items) do
        if (data.description) then
          -- if current item has a description, the paper icon takes the lead
          favoriteBtn[catName][itemName]:Hide();
          removeBtn[catName][itemName]:Hide()
          descBtn[catName][itemName]:Show();
        elseif (data.favorite) then
          -- or else if current item is a favorite
          descBtn[catName][itemName]:Hide();
          removeBtn[catName][itemName]:Hide()
          favoriteBtn[catName][itemName]:Show();
        else
          -- default
          favoriteBtn[catName][itemName]:Hide();
          descBtn[catName][itemName]:Hide();
          removeBtn[catName][itemName]:Show()
        end
      end
    end
  end

  if (IsAltKeyDown() and MouseIsOver(itemsFrameUI)) then
    itemsFrame:ValidateTutorial("ALTkey"); -- tutorial
    -- we switch the category and frame options buttons for the undo and frame action ones and vice versa
    itemsFrameUI.categoryButton:Hide()
    itemsFrameUI.undoButton:Show()
    itemsFrameUI.frameOptionsButton:Hide()
    itemsFrameUI.tabActionsButton:Show()
    -- resize button
    itemsFrameUI.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", itemsFrameUI.ScrollFrame, "BOTTOMRIGHT", - 7, 32);
    itemsFrameUI.resizeButton:Show()
  else
    itemsFrameUI.undoButton:Hide()
    itemsFrameUI.categoryButton:Show()
    itemsFrameUI.tabActionsButton:Hide()
    itemsFrameUI.frameOptionsButton:Show()
    -- resize button
    itemsFrameUI.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", itemsFrameUI.ScrollFrame, "BOTTOMRIGHT", - 7, 17);
    itemsFrameUI.resizeButton:Hide()
  end

  -- we also update their color, if one of the button menus is opened
  itemsFrameUI.categoryButton.Icon:SetDesaturated(nil) itemsFrameUI.categoryButton.Icon:SetVertexColor(0.85, 1, 1) -- here we change the vertex color because the original icon is a bit reddish
  itemsFrameUI.frameOptionsButton.Icon:SetDesaturated(nil)
  itemsFrameUI.tabActionsButton.Icon:SetDesaturated(nil)
  if (not addACategoryClosed) then
  itemsFrameUI.categoryButton.Icon:SetDesaturated(1) itemsFrameUI.categoryButton.Icon:SetVertexColor(1, 1, 1)
  elseif (not optionsClosed) then
    itemsFrameUI.frameOptionsButton.Icon:SetDesaturated(1)
  elseif (not tabActionsClosed) then
    itemsFrameUI.tabActionsButton.Icon:SetDesaturated(1)
  end

  -- here we manage the visibility of the tutorial frames, showing them if their corresponding buttons is shown, their tuto has not been completed (false) and the previous one is true.
  if (Todo.db.global.tuto_progression < #tuto_order) then
    for i, v in pairs(tuto_order) do
      local r = false;
      if (Todo.db.global.tuto_progression < i) then -- if the current loop tutorial has not already been done
        if (Todo.db.global.tuto_progression == i-1) then -- and the previous one has been done
          if (tutorialFramesTarget[v] ~= nil and tutorialFramesTarget[v]:IsShown()) then -- and his corresponding target frame is currently shown
            r = true; -- then we can show the tutorial frame
          end
        end
      end
      tutorialFrames[v]:SetShown(r);
    end
  elseif (Todo.db.global.tuto_progression == #tuto_order) then -- we completed the last tutorial
    tutorialFrames[tuto_order[#tuto_order]]:SetShown(false); -- we don't need to do the big loop above, we just need to hide the last tutorial frame (it's just optimization)
    Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; -- and we also add a step of progression, just so that we never enter this 'if' again. (optimization too :D)
    ItemsFrame_OnVisibilityUpdate() -- and finally, we reset the menu openings of the list at the end of the tutorial, for more visibility
  end

  while (self.timeSinceLastRefresh > refreshRate) do -- every one second
    ItemsFrame_UpdateTime();
    self.timeSinceLastRefresh = self.timeSinceLastRefresh - refreshRate;
  end
end

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

--------------------------------------
-- frame creation and functions
--------------------------------------

function itemsFrame:CreateMovableCheckBtnElems(catName, itemName)
  local data = Todo.db.profile.itemsList[catName][itemName];

  if (not config:HasKey(checkBtn, catName)) then checkBtn[catName] = {} end
  checkBtn[catName][itemName] = CreateFrame("CheckButton", "Todo_CheckBtn_"..catName.."_"..itemName, itemsFrameUI, "UICheckButtonTemplate");
  checkBtn[catName][itemName]:SetHitRectInsets(4,4,4,4)
  checkBtn[catName][itemName].InteractiveLabel = config:CreateNoPointsInteractiveLabel(checkBtn[catName][itemName]:GetName().."_InteractiveLabel", checkBtn[catName][itemName], itemName, "GameFontNormal");
  checkBtn[catName][itemName].InteractiveLabel:SetPoint("LEFT", checkBtn[catName][itemName], "RIGHT")
  checkBtn[catName][itemName].InteractiveLabel.Text:SetPoint("LEFT", checkBtn[catName][itemName], "RIGHT", 10, 0)
  checkBtn[catName][itemName].catName = catName -- easy access to the catName this button is in
  checkBtn[catName][itemName].itemName = itemName -- easy access to the itemName of this button, this also allows the shown text to be different
  if (config:HasHyperlink(itemName)) then -- this is for making more space for items that have hyperlinks in them
    if (checkBtn[catName][itemName].InteractiveLabel.Text:GetWidth() > itemNameWidthMax) then
      checkBtn[catName][itemName].InteractiveLabel.Text:SetFontObject("GameFontNormal");
    end

    -- and also to deactivate the InteractiveLabel's Button, so that we can actually click on the links
    -- unless we are holding Alt, and to detect this, we actually put on them an OnUpdate script
    checkBtn[catName][itemName].InteractiveLabel:SetScript("OnUpdate", function(self)
      if (IsAltKeyDown()) then
        self.Button:Show()
      else
        self.Button:Hide()
      end
    end)
  end
  checkBtn[catName][itemName]:SetChecked(data.checked)
  checkBtn[catName][itemName]:SetScript("OnClick", function(self)
    data.checked = self:GetChecked()
    if (Todo.db.profile.instantRefresh) then
      itemsFrame:ReloadTab()
    else
      ItemsFrame_Update()
    end
  end);
  checkBtn[catName][itemName].InteractiveLabel:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
  checkBtn[catName][itemName].InteractiveLabel:SetScript("OnHyperlinkClick", function(self, linkData, link, button)
    if (button == "RightButton") then
      self.Button:GetScript("OnDoubleClick")(self.Button)
    else
      ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
    end
  end);
  checkBtn[catName][itemName].InteractiveLabel.Button:SetScript("OnDoubleClick", function(self)
    -- first, we hide the label
    local checkBtn = self:GetParent():GetParent()
    checkBtn.InteractiveLabel:Hide()

    -- then, we can create the new edit box to rename the item, where the label was
    local catName, itemName = checkBtn.catName, checkBtn.itemName
    local renameEditBox = config:CreateNoPointsRenameEditBox(checkBtn, itemName, itemNameWidthMax, self:GetHeight())
    renameEditBox:SetPoint("LEFT", checkBtn, "RIGHT", 5, 0)
    -- renameEditBox:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
    -- renameEditBox:SetScript("OnHyperlinkClick", function(_, linkData, link, button)
    --   ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
    -- end);
    table.insert(hyperlinkEditBoxes, renameEditBox) -- so that we can add hyperlinks in it

    -- let's go!
    renameEditBox:SetScript("OnEnterPressed", function(self)
      local newItemName = self:GetText()
      -- first, we do some tests
      if (newItemName == "") then -- if the new item name is empty
        self:GetScript("OnEscapePressed")(self) -- we cancel the action
        return;
      elseif (newItemName == itemName) then -- if the new is the same as the old
        self:GetScript("OnEscapePressed")(self) -- we cancel the action
        return;
      elseif (config:HasKey(Todo.db.profile.itemsList[catName], newItemName)) then -- if the new item name already exists somewhere in the category
        config:PrintForced(L["This item name already exists in the category"]..". "..L["Please choose a different name to avoid overriding data"])
        return;
      else
        local l = config:CreateNoPointsLabel(itemsFrameUI, nil, newItemName);
        if (l:GetWidth() > itemNameWidthMax and config:HasHyperlink(newItemName)) then l:SetFontObject("GameFontNormal") end -- if it has an hyperlink in it and it's too big, we allow it to be a little longer, considering hyperlinks take more place
        if (l:GetWidth() > itemNameWidthMax) then -- then we recheck to see if the item is not too long for good
          config:PrintForced(L["This item name is too big!"])
          return;
        end
      end

      -- and if everything is good, we can rename the item (a.k.a, delete the current one and creating a new one)
      -- while keeping the same cat, and same tab
      itemsFrame:MoveItem(catName, catName, itemName, newItemName, Todo.db.profile.itemsList[catName][itemName].tabName)
    end)

    -- cancelling
    renameEditBox:SetScript("OnEscapePressed", function(self)
      self:Hide()
      checkBtn.InteractiveLabel:Show()
      table.remove(hyperlinkEditBoxes, select(2, config:HasItem(hyperlinkEditBoxes, self))) -- removing the ref of the hyperlink edit box
    end)
    renameEditBox:HookScript("OnEditFocusLost", function(self)
      self:GetScript("OnEscapePressed")(self)
    end)
  end);

  if (not config:HasKey(removeBtn, catName)) then removeBtn[catName] = {} end
  removeBtn[catName][itemName] = config:CreateRemoveButton(checkBtn[catName][itemName]);
  removeBtn[catName][itemName]:SetScript("OnClick", function(self) itemsFrame:RemoveItem(self) end);

  if (not config:HasKey(favoriteBtn, catName)) then favoriteBtn[catName] = {} end
  favoriteBtn[catName][itemName] = config:CreateFavoriteButton(checkBtn[catName][itemName], catName, itemName);
  favoriteBtn[catName][itemName]:SetScript("OnClick", function(self) itemsFrame:FavoriteClick(self) end);
  favoriteBtn[catName][itemName]:Hide();

  if (not config:HasKey(descBtn, catName)) then descBtn[catName] = {} end
  descBtn[catName][itemName] = config:CreateDescButton(checkBtn[catName][itemName], catName, itemName);
  descBtn[catName][itemName]:SetScript("OnClick", function(self) itemsFrame:DescriptionClick(self) end);
  descBtn[catName][itemName]:Hide();
end

function itemsFrame:CreateMovableLabelElems(catName)
  -- category label
  label[catName] = config:CreateNoPointsInteractiveLabel("Todo_CatLabel_"..catName, itemsFrameUI, catName, "GameFontHighlight");
  label[catName].catName = catName -- easy access to the catName of the label, this also allows the shown text to be different
  label[catName].Button:SetScript("OnEnter", function(self)
    local r, g, b = unpack(config:ThemeDownTo01(config.database.theme))
    self:GetParent().Text:SetTextColor(r, g, b, 1) -- when we hover it, we color the label
  end)
  label[catName].Button:SetScript("OnLeave", function(self)
    self:GetParent().Text:SetTextColor(1, 1, 1, 1) -- back to the default color
  end)
  label[catName].Button:SetScript("OnClick", function(self, button)
    if (IsAltKeyDown()) then return; end -- we don't do any of the OnClick code if we have the Alt key down, bc it means that we want to rename the category by double clicking
    local catName = self:GetParent().catName
    if (button == "LeftButton") then -- we open/close the category
      if (config:HasKey(Todo.db.profile.closedCategories, catName) and Todo.db.profile.closedCategories[catName] ~= nil) then -- if this is a category that is closed in certain tabs
        local isPresent, pos = config:HasItem(Todo.db.profile.closedCategories[catName], CurrentTab:GetName()); -- we get if it is closed in the current tab
        if (isPresent) then -- if it is
          table.remove(Todo.db.profile.closedCategories[catName], pos); -- then we remove it from the saved variable
          if (#Todo.db.profile.closedCategories[catName] == 0) then -- and btw check if it was the only tab remaining where it was closed
            Todo.db.profile.closedCategories[catName] = nil; -- in which case we nil the table variable for that category
          end
        else  -- if it is opened in the current tab
          table.insert(Todo.db.profile.closedCategories[catName], CurrentTab:GetName()); -- then we close it by adding it to the saved variable
        end
      else -- if this category was closed nowhere
        Todo.db.profile.closedCategories[catName] = {CurrentTab:GetName()}; -- then we create its table variable and initialize it with the current tab (we close the category in the current tab)
      end

      -- and finally, we reload the frame to display the changes
      itemsFrame:ReloadTab()
    elseif (button == "RightButton") then -- we try to toggle the edit box to add new items
      -- if the label we right clicked on is NOT a closed category
      if (not (select(1, config:HasKey(Todo.db.profile.closedCategories, catName))) or not (select(1, config:HasItem(Todo.db.profile.closedCategories[catName], CurrentTab:GetName())))) then
        -- we toggle its edit box
        editBox[catName]:SetShown(not editBox[catName]:IsShown());

        if (editBox[catName]:IsShown()) then
          -- tutorial
          itemsFrame:ValidateTutorial("addItem");

          -- we also give that edit box the focus if we are showing it
          SetFocusEditBox(editBox[catName])
        end
      end
    end
  end)
  label[catName].Button:SetScript("OnDoubleClick", function(self)
    if (not IsAltKeyDown()) then return; end -- we don't do any of the OnDoubleClick code if we don't have the Alt key down

    -- first, we hide the label
    local label = self:GetParent()
    label.Text:Hide()
    label.Button:Hide()

    -- then, we can create the new edit box to rename the category, where the label was
    local catName = label.catName
    local renameEditBox = config:CreateNoPointsRenameEditBox(label, catName, categoryNameWidthMax, self:GetHeight())
    renameEditBox:SetPoint("LEFT", label, "LEFT", 5, 0)

    -- we move the favs remaining label to the right of the edit box while it's shown
    if (config:HasKey(categoryLabelFavsRemaining, catName)) then
      categoryLabelFavsRemaining[catName]:ClearAllPoints();
      categoryLabelFavsRemaining[catName]:SetPoint("LEFT", renameEditBox, "RIGHT", 6, 0);
    end

    -- let's go!
    renameEditBox:SetScript("OnEnterPressed", function(self)
      local newCatName = self:GetText()
      -- first, we do some tests
      if (newCatName == "") then -- if the new cat name is empty
        self:GetScript("OnEscapePressed")(self) -- we cancel the action
        return;
      elseif (newCatName == catName) then -- if the new is the same as the old
        self:GetScript("OnEscapePressed")(self) -- we cancel the action
        return;
      elseif (config:HasKey(Todo.db.profile.itemsList, newCatName)) then -- if the new cat name already exists
        config:PrintForced(L["This category name already exists"]..". "..L["Please choose a different name to avoid overriding data"])
        return;
      else
        local l = config:CreateNoPointsLabel(itemsFrameUI, nil, newCatName);
        if (l:GetWidth() > categoryNameWidthMax) then -- if the new cat name is too big
          config:PrintForced(L["This categoty name is too big!"])
          return;
        end
      end

      -- and if everything is good, we can rename the category
      itemsFrame:RenameCategory(catName, newCatName)
    end)

    -- cancelling
    renameEditBox:SetScript("OnEscapePressed", function(self)
      self:Hide()
      label.Text:Show()
      label.Button:Show()
      -- when hiding the edit box, we reset the pos of the favs remaining label
      if (config:HasKey(categoryLabelFavsRemaining, catName)) then
        categoryLabelFavsRemaining[catName]:ClearAllPoints();
        categoryLabelFavsRemaining[catName]:SetPoint("LEFT", label, "RIGHT", 6, 0);
      end
    end)
    renameEditBox:HookScript("OnEditFocusLost", function(self)
      self:GetScript("OnEscapePressed")(self)
    end)
  end)

  -- associated favs remaining label
  categoryLabelFavsRemaining[catName] = config:CreateNoPointsLabel(label[catName], label[catName]:GetName().."_FavsRemaining", "");

  -- associated edit box and add button
  editBox[catName] = config:CreateNoPointsLabelEditBox(catName);
  editBox[catName]:SetScript("OnEnterPressed", function(self)
    itemsFrame:AddItem(self)
    self:Show() -- we keep it shown to add more items
    SetFocusEditBox(self)
  end);
  -- cancelling
  editBox[catName]:SetScript("OnEscapePressed", function(self)
    self:Hide()
  end)
  editBox[catName]:HookScript("OnEditFocusLost", function(self)
    self:GetScript("OnEscapePressed")(self)
  end)
  table.insert(hyperlinkEditBoxes, editBox[catName]);
end

local function loadMovable()
  for catName, items in pairs(Todo.db.profile.itemsList) do
    itemsFrame:CreateMovableLabelElems(catName) -- Category labels
    for itemName in pairs(items) do
      itemsFrame:CreateMovableCheckBtnElems(catName, itemName) -- All items transformed as checkboxes
    end
  end
end

-- boom
local function loadCategories(tab, categoryLabel, catName, itemNames, lastData)
  -- here we generate and load each categories and their items one by one

  if (next(itemNames) ~= nil) then -- if for the current category there is at least one item to show in the current tab
    local lastLabel, newLabelHeightDelta, adjustHeight;

    -- category label
    if (lastData == nil) then
      lastLabel = itemsFrameUI.dummyLabel;
      newLabelHeightDelta = 0; -- no delta, this is the start point

      -- tutorial
      tutorialFramesTarget.addItem = categoryLabel;
      tutorialFrames.addItem:SetPoint("RIGHT", tutorialFramesTarget.addItem, "LEFT", -23, 0);
    else
      lastLabel = lastData["categoryLabel"];
      if (config:HasKey(Todo.db.profile.closedCategories, lastData["catName"]) and config:HasItem(Todo.db.profile.closedCategories[lastData["catName"]], tab:GetName())) then -- if the last category loaded was a closed one in this tab
        newLabelHeightDelta = 1; -- we only have a delta of one
      else
        newLabelHeightDelta = #lastData["itemNames"] + 1; -- or else, we have a delta of the number of items loaded in the last category + the last category's label
      end
    end

    -- category label placement
    if (newLabelHeightDelta == 0) then adjustHeight = 0; else adjustHeight = 5; end -- just for a proper clean height
    categoryLabel:SetParent(tab);
    categoryLabel:SetPoint("TOPLEFT", lastLabel, "TOPLEFT", 0, -newLabelHeightDelta * 21 - adjustHeight); -- here
    categoryLabel:Show();

    -- category label favs remaining placement
    -- we determine if it is shown or not later
    categoryLabelFavsRemaining[catName]:SetParent(categoryLabel)
    categoryLabelFavsRemaining[catName]:SetPoint("LEFT", categoryLabel, "RIGHT", 6, 0)

    -- edit box
    editBox[catName]:SetParent(tab);
    editBox[catName]:SetSize(tab:GetParent():GetWidth() - categoryLabel:GetWidth() - 50, 30);
    editBox[catName]:SetPoint("LEFT", categoryLabel, "RIGHT", padding, 0);
    editBox[catName]:Hide(); -- we hide every edit box by default when we reload the tab

    -- if the category is opened in this tab, we display all of its items
    if (not config:HasKey(Todo.db.profile.closedCategories, catName) or not config:HasItem(Todo.db.profile.closedCategories[catName], tab:GetName())) then
      -- checkboxes
      local buttonsLength = 0;
      for _, itemName in pairs(itemNames) do -- for every item to load
          buttonsLength = buttonsLength + 1;

          checkBtn[catName][itemName]:SetParent(tab);
          checkBtn[catName][itemName]:SetPoint("TOPLEFT", categoryLabel, "TOPLEFT", 20, - 21 * buttonsLength +8);
          checkBtn[catName][itemName]:Show();
      end
      categoryLabelFavsRemaining[catName]:Hide(); -- the only thing is that we hide it if the category is opened
    else
      -- if not, we still need to put them at their right place, anchors and parents (but we keep them hidden)
      -- especially for when we load the All tab, for the clearing
      for _, itemName in pairs(itemNames) do -- for every item to load but hidden
        checkBtn[catName][itemName]:SetParent(tab);
        checkBtn[catName][itemName]:SetPoint("TOPLEFT", categoryLabel, "TOPLEFT");
      end
      categoryLabelFavsRemaining[catName]:Show(); -- bc we only see him when the cat is closed
    end
  else
    -- if the current label has no reason to be visible in this tab, we hide it (and for the checkboxes, they have already been hidden before the first call to this func).
    -- so first we hide them to be sure they are gone from our view, and then it's a bit more complicated:
    -- we reset their parent to be the current tab, so that we're sure that they are all on the same tab, and then
    -- ClearAllPoints is pretty magical here since a hidden label CAN be clicked on and still manages to fire OnEnter and everything else, so :Hide() is not enough,
    -- so with this API we clear their points so that they have nowhere to go and they don't fire events anymore.
    label[catName]:Hide();
    label[catName]:SetParent(tab);
    label[catName]:ClearAllPoints();
    categoryLabelFavsRemaining[catName]:Hide();
    categoryLabelFavsRemaining[catName]:SetParent(tab);
    categoryLabelFavsRemaining[catName]:ClearAllPoints();
    editBox[catName]:Hide();
    editBox[catName]:SetParent(tab);
    editBox[catName]:ClearAllPoints();

    -- then, since there isn't anything to show in the current category for the current tab,
    -- we check if it was a closed category, in which case, we remove it from the saved variable
    if (tab:GetName() ~= "All") then -- unless we're in the All tab, since we can decide to hide items, so i want to keep the closed state if we want to show the items back
      if (config:HasKey(Todo.db.profile.closedCategories, catName) and Todo.db.profile.closedCategories[catName] ~= nil) then
        local isPresent, pos = config:HasItem(Todo.db.profile.closedCategories[catName], tab:GetName()); -- we get if it is closed in the current tab
        if (isPresent) then -- if it is
          table.remove(Todo.db.profile.closedCategories[catName], pos); -- then we remove it from the saved variable
          if (#Todo.db.profile.closedCategories[catName] == 0) then -- and btw check if it was the only tab remaining where it was closed
            Todo.db.profile.closedCategories[catName] = nil; -- in which case we nil the table variable for that category
          end
        end
      end
    end

    -- and btw, we check if there is no more item at all in that category
    -- and if it's empty, we delete all of the corresponding elements, this is the place where we properly delete a category.
    if (not next(Todo.db.profile.itemsList[catName])) then
      -- we destroy them
      table.remove(hyperlinkEditBoxes, select(2, config:HasItem(hyperlinkEditBoxes, editBox[catName])))
      editBox[catName] = nil;
      label[catName] = nil;
      categoryLabelFavsRemaining[catName] = nil;

      -- and we nil them in the saved variables
      Todo.db.profile.itemsList[catName] = nil;
      Todo.db.profile.closedCategories[catName] = nil;
    end

    return lastData; -- if we are here, lastData shall not be changed or there will be consequences! (so we end the function prematurely)
  end

  lastData = {
    ["tab"] = tab,
    ["categoryLabel"] = categoryLabel,
    ["catName"] = catName,
    ["itemNames"] = itemNames,
  }
  return lastData;
end

-------------------------------------------------------------------------------------------
-- Contenting:<3 --------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- generating the list items
local function generateTab(tab)
  -- We sort all of the categories in alphabetical order
  local tempTable = itemsFrame:GetCategoriesOrdered()

  -- doing that only one time
  -- before we reload the entire tab and items, we hide every checkboxes
  for catName, items in pairs(Todo.db.profile.itemsList) do -- for every item
    for itemName in pairs(items) do
      checkBtn[catName][itemName]:Hide()
      checkBtn[catName][itemName]:SetParent(tab)
      checkBtn[catName][itemName]:ClearAllPoints()
    end
  end

  -- then we load everything
  local lastData = nil
  shownInTab[tab:GetName()] = 0
  for _, catName in pairs(tempTable) do -- for each categories, alphabetically
    -- we sort alphabetically all the items inside, with the favorites in first
    local itemNames = {}
    local fav = {}
    local others = {}

    -- first we get every favs and other items for the current cat and place them in their respective tables
    for itemName, data in pairs(Todo.db.profile.itemsList[catName]) do
      if (ItemIsInTab(data.tabName, tab:GetName())) then
        if (not ItemIsHiddenInResetTab(catName, itemName)) then
          if (data.favorite) then
            table.insert(fav, itemName)
          else
            table.insert(others, itemName)
          end
        end
      end
    end

    -- sorting
    table.sort(fav)
    table.sort(others)
    for _, itemName in pairs(fav) do
      table.insert(itemNames, itemName)
    end
    for _, itemName in pairs(others) do
      table.insert(itemNames, itemName)
    end

    shownInTab[tab:GetName()] = shownInTab[tab:GetName()] + #itemNames

    lastData = loadCategories(tab, label[catName], catName, itemNames, lastData); -- and finally, we load them on the tab in the defined order
  end
end

----------------------------

local function loadAddACategory(tab)
  itemsFrameUI.categoryButton:SetParent(tab);
  itemsFrameUI.categoryButton:SetPoint("RIGHT", itemsFrameUI.frameOptionsButton, "LEFT", 2, 0);

  itemsFrameUI.categoryTitle:SetParent(tab);
  itemsFrameUI.categoryTitle:SetPoint("TOPLEFT", itemsFrameUI.title, "TOPLEFT", 0, - 30);

  itemsFrameUI.labelCategoryName:SetParent(tab);
  itemsFrameUI.labelCategoryName:SetPoint("TOPLEFT", itemsFrameUI.categoryTitle, "TOPLEFT", 0, - 25);
  itemsFrameUI.categoryEditBox:SetParent(tab);
  itemsFrameUI.categoryEditBox:SetPoint("LEFT", itemsFrameUI.labelCategoryName, "RIGHT", 10, 0);

  itemsFrameUI.labelFirstItemName:SetParent(tab);
  itemsFrameUI.labelFirstItemName:SetPoint("TOPLEFT", itemsFrameUI.labelCategoryName, "TOPLEFT", 0, - 25);
  itemsFrameUI.nameEditBox:SetParent(tab);
  itemsFrameUI.nameEditBox:SetPoint("LEFT", itemsFrameUI.labelFirstItemName, "RIGHT", 10, 0);

  itemsFrameUI.addBtn:SetParent(tab);
  itemsFrameUI.addBtn:SetPoint("LEFT", itemsFrameUI.labelFirstItemName, "BOTTOMLEFT", 0, - 20);
end

local function loadTabActions(tab)
  itemsFrameUI.tabActionsButton:SetParent(tab);
  itemsFrameUI.tabActionsButton:SetPoint("RIGHT", itemsFrameUI.undoButton, "LEFT", 2, 0);

  --/************************************************/--

  itemsFrameUI.tabActionsTitle:SetParent(tab);
  itemsFrameUI.tabActionsTitle:SetPoint("TOPLEFT", itemsFrameUI.title, "TOPLEFT", 0, - 25);
  itemsFrameUI.tabActionsTitle:SetText(string.format("|cff%s%s|r", config:RGBToHex(config.database.theme), L["Tab actions"].." ("..L[tab:GetName()]..")"));

  --/************************************************/--

  local w = itemsFrameUI.btnCheck:GetWidth() + itemsFrameUI.btnUncheck:GetWidth() + 10; -- this is to better center the buttons
  itemsFrameUI.btnCheck:SetParent(tab);
  itemsFrameUI.btnCheck:SetPoint("TOPLEFT", itemsFrameUI.tabActionsTitle, "TOPLEFT", 0, - 25);

  itemsFrameUI.btnUncheck:SetParent(tab);
  itemsFrameUI.btnUncheck:SetPoint("TOPLEFT", itemsFrameUI.btnCheck, "TOPRIGHT", 10, 0);

  --/************************************************/--

  itemsFrameUI.btnClear:SetParent(tab);
  itemsFrameUI.btnClear:SetPoint("TOPLEFT", itemsFrameUI.btnCheck, "TOPLEFT", 0, -25);
end

local function loadOptions(tab)
  itemsFrameUI.frameOptionsButton:SetParent(tab);
  itemsFrameUI.frameOptionsButton:SetPoint("RIGHT", itemsFrameUI.helpButton, "LEFT", 2, 0);

  --/************************************************/--

  itemsFrameUI.optionsTitle:SetParent(tab);
  itemsFrameUI.optionsTitle:SetPoint("TOPLEFT", itemsFrameUI.title, "TOPLEFT", 0, -30);

  --/************************************************/--

  itemsFrameUI.resizeTitle:SetParent(tab);
  itemsFrameUI.resizeTitle:SetPoint("TOPLEFT", itemsFrameUI.optionsTitle, "TOPLEFT", 0, -20);
  local h = itemsFrameUI.resizeTitle:GetHeight() -- if the locale text is too long, we adapt the points of the next element to match the height of this string

  --/************************************************/--

  itemsFrameUI.frameAlphaSlider:SetParent(tab);
  itemsFrameUI.frameAlphaSlider:SetPoint("TOPLEFT", itemsFrameUI.resizeTitle, "TOPLEFT", 0, -25 - h); -- here

  itemsFrameUI.frameAlphaSliderValue:SetParent(tab);
  itemsFrameUI.frameAlphaSliderValue:SetPoint("TOP", itemsFrameUI.frameAlphaSlider, "BOTTOM", 0, 0);

  --/************************************************/--

  itemsFrameUI.frameContentAlphaSlider:SetParent(tab);
  itemsFrameUI.frameContentAlphaSlider:SetPoint("TOPLEFT", itemsFrameUI.frameAlphaSlider, "TOPLEFT", 0, -50);

  itemsFrameUI.frameContentAlphaSliderValue:SetParent(tab);
  itemsFrameUI.frameContentAlphaSliderValue:SetPoint("TOP", itemsFrameUI.frameContentAlphaSlider, "BOTTOM", 0, 0);

  --/************************************************/--

  itemsFrameUI.affectDesc:SetParent(tab);
  itemsFrameUI.affectDesc:SetPoint("TOPLEFT", itemsFrameUI.frameContentAlphaSlider, "TOPLEFT", 0, -30);

  --/************************************************/--

  itemsFrameUI.btnAddonOptions:SetParent(tab);
  itemsFrameUI.btnAddonOptions:SetPoint("TOPLEFT", itemsFrameUI.affectDesc, "TOPLEFT", 0, - 30);
end

-- loading the content (top to bottom)
local function loadTab(tab)
  itemsFrameUI.title:SetParent(tab);
  itemsFrameUI.title:SetPoint("TOPLEFT", tab, "TOPLEFT", 10, - 10);

  itemsFrameUI.remainingNumber:SetParent(tab);
  itemsFrameUI.remainingNumber:SetPoint("LEFT", itemsFrameUI.title, "RIGHT", 5, 0);
  
  itemsFrameUI.helpButton:SetParent(tab);
  itemsFrameUI.helpButton:SetPoint("TOPRIGHT", itemsFrameUI, "TOPRIGHT", -25, -8);

  itemsFrameUI.undoButton:SetParent(tab);
  itemsFrameUI.undoButton:SetPoint("RIGHT", itemsFrameUI.helpButton, "LEFT", 2, 0);

  -- loading the "add a category" menu
  loadAddACategory(tab);

  -- loading the "tab actions" menu
  loadTabActions(tab);

  -- loading the "frame options" menu
  loadOptions(tab);

  -- loading the bottom line at the correct place (a bit special)
  itemsFrameUI.lineBottom:SetParent(tab);

  -- and the menu title lines (a bit complicated too)
  itemsFrameUI.menuTitleLineLeft:SetParent(tab)
  itemsFrameUI.menuTitleLineRight:SetParent(tab)
  if (addACategoryClosed and tabActionsClosed and optionsClosed) then
    itemsFrameUI.menuTitleLineLeft:Hide()
    itemsFrameUI.menuTitleLineRight:Hide()
  else
    if (not addACategoryClosed) then
      l = itemsFrameUI.categoryTitle:GetWidth()
    elseif (not tabActionsClosed) then
      l = itemsFrameUI.tabActionsTitle:GetWidth()
    elseif (not optionsClosed) then
      l = itemsFrameUI.optionsTitle:GetWidth()
    end
    if ((l/2 + 15) <= lineOffset) then
      --itemsFrameUI.menuTitleLineLeft:SetStartPoint("TOPLEFT", centerXOffset-lineOffset, -78)
      --itemsFrameUI.menuTitleLineLeft:SetEndPoint("TOPLEFT", centerXOffset-l/2 - 10, -78)
      --itemsFrameUI.menuTitleLineRight:SetStartPoint("TOPLEFT", centerXOffset+l/2 + 10, -78)
      --itemsFrameUI.menuTitleLineRight:SetEndPoint("TOPLEFT", centerXOffset+lineOffset, -78)
      --itemsFrameUI.menuTitleLineLeft:Show()
      --itemsFrameUI.menuTitleLineRight:Show()
    else
      --itemsFrameUI.menuTitleLineLeft:Hide()
      --itemsFrameUI.menuTitleLineRight:Hide()
    end
  end

  -- first we check which one of the buttons is pressed (if there is one) for pre-processing something
  if (addACategoryClosed) then -- if the creation of new categories is closed
    -- we hide every component of the "add a category"
    for _, v in pairs(addACategoryItems) do
      v:Hide();
    end
  end

  if (tabActionsClosed) then -- if the tab actions menu is closed
    -- then we hide every component of the "tab actions"
    for _, v in pairs(tabActionsItems) do
      v:Hide();
    end
  end

  if (optionsClosed) then -- if the options menu is closed
    -- then we hide every component of the "options"
    for _, v in pairs(frameOptionsItems) do
      v:Hide();
    end
  end

  -- then we decide where to place the bottom line
  if (addACategoryClosed) then -- if the creation of new categories is closed
    if (tabActionsClosed) then -- if the options menu is closed
      if (optionsClosed) then -- and if the tab actions menu is closed too
        -- we place the line just below the buttons
        itemsFrameUI.lineBottom:SetStartPoint("TOPLEFT", 0, -40)
        itemsFrameUI.lineBottom:SetEndPoint("TOPLEFT", 0, -40)
      else
        -- or else we show and adapt the height of every component of the "options"
        local height = 0;
        for _, v in pairs(frameOptionsItems) do
          v:Show();
          height = height + (select(5, v:GetPoint()));
        end

        -- and show the line below them
        itemsFrameUI.lineBottom:SetStartPoint("TOPLEFT", 0, height -50)
        itemsFrameUI.lineBottom:SetEndPoint("TOPLEFT", 0, height - 50)
      end
    else
      -- or else we show and adapt the height of every component of the "tab actions"
      local height = 0;
      for _, v in pairs(tabActionsItems) do
        v:Show();

        height = height + (select(5, v:GetPoint()));
      end

      -- and show the line below them
      itemsFrameUI.lineBottom:SetStartPoint("TOPLEFT", 0, height - 50)
      itemsFrameUI.lineBottom:SetEndPoint("TOPLEFT", 0, height - 50)
    end
  else
    -- or else we show and adapt the height of every component of the "add a category"
    local height = 0;
    for _, v in pairs(addACategoryItems) do
      v:Show();
      height = height + (select(5, v:GetPoint()));
    end

    -- Include header size for offset
    height = height - 50;

    -- and show the line below the elements of the "add a category"
    itemsFrameUI.lineBottom:SetStartPoint("TOPLEFT", 0, height)
    itemsFrameUI.lineBottom:SetEndPoint("TOPLEFT", 0, height)
  end

  itemsFrameUI.dummyLabel:SetParent(tab)
  itemsFrameUI.dummyLabel:SetPoint("TOPLEFT", itemsFrameUI.lineBottom, "TOPLEFT", padding, 0)

  -- generating all of the content (items, checkboxes, editboxes, category labels...)
  generateTab(tab)

  -- Nothing label
  -- first, we get how many items there are shown in the tab
  local checked, _, unchecked = itemsFrame:updateRemainingNumber()

  -- then we show/hide the nothing label depending on the result and shownInTab
  itemsFrameUI.nothingLabel:SetParent(tab)
  itemsFrameUI.nothingLabel:SetPoint("TOPLEFT", itemsFrameUI.lineBottom, "TOPLEFT", padding, 0) -- to correctly center this text on diffent screen sizes
  itemsFrameUI.nothingLabel:Hide()
  if (checked[tab:GetName()] + unchecked[tab:GetName()] == 0) then -- if there is nothing to show in the tab we're in
    itemsFrameUI.nothingLabel:SetText(L["There are no items!"])
    itemsFrameUI.nothingLabel:Show()
  else -- if there are items in the tab
    if (unchecked[tab:GetName()] == 0) then -- and if they are checked ones
      -- we check if they are hidden or not, and if they are, we show the nothing label with a different text
      if (shownInTab[tab:GetName()] == 0) then
        itemsFrameUI.nothingLabel:SetText(config:SafeStringFormat(L["(%i hidden item(s))"], checked[tab:GetName()]))
        itemsFrameUI.nothingLabel:Show()
      end
    end
  end
end

----------------------------

local function generateAddACategory()
  itemsFrameUI.categoryButton = CreateFrame("Button", "categoryButton", itemsFrameUI, "Todo_CategoryButton");
  itemsFrameUI.categoryButton.tooltip = L["Add a category"];
  itemsFrameUI.categoryButton:SetScript("OnClick", function()
    tabActionsClosed = true;
    optionsClosed = true;
    addACategoryClosed = not addACategoryClosed;

    itemsFrame:ValidateTutorial("addNewCat"); -- tutorial

    itemsFrame:ReloadTab() -- we reload the frame to display the changes
    if (not addACategoryClosed) then
      SetFocusEditBox(itemsFrameUI.categoryEditBox)
    end -- then we give the focus to the category edit box if we opened the menu
  end);

  --/************************************************/--

  itemsFrameUI.categoryTitle = config:CreateNoPointsLabel(itemsFrameUI, nil, string.format("|cff%s%s|r", config:RGBToHex(config.database.theme), L["Add a category"]));
  table.insert(addACategoryItems, itemsFrameUI.categoryTitle);

  --/************************************************/--

  itemsFrameUI.labelCategoryName = itemsFrameUI:CreateFontString(nil); -- info label 2
  itemsFrameUI.labelCategoryName:SetFontObject("GameFontHighlight");
  itemsFrameUI.labelCategoryName:SetText(L["Category:"]);
  table.insert(addACategoryItems, itemsFrameUI.labelCategoryName);

  itemsFrameUI.categoryEditBox = CreateFrame("EditBox", nil, itemsFrameUI, "InputBoxTemplate"); -- edit box to put the new category name
  local l = config:CreateNoPointsLabel(itemsFrameUI, nil, itemsFrameUI.labelCategoryName:GetText());
  itemsFrameUI.categoryEditBox:SetSize(150, 30);
  itemsFrameUI.categoryEditBox:SetAutoFocus(false);
  itemsFrameUI.categoryEditBox:SetScript("OnKeyDown", function(_, key) if (key == "TAB") then SetFocusEditBox(itemsFrameUI.nameEditBox) end end) -- to switch easily between the two edit boxes
  itemsFrameUI.categoryEditBox:SetScript("OnEnterPressed", addCategory); -- if we press enter, it's like we clicked on the add button
  itemsFrameUI.categoryEditBox:HookScript("OnEditFocusGained", function(self)
    if (Todo.db.profile.highlightOnFocus) then
      self:HighlightText()
    else
      self:HighlightText(self:GetCursorPosition(), self:GetCursorPosition())
    end
  end)
  table.insert(addACategoryItems, itemsFrameUI.categoryEditBox);

  --/************************************************/--

  --  // LibUIDropDownMenu version // --

  itemsFrameUI.categoriesDropdown = LDD:Create_UIDropDownMenu("Todo_Frame_CategoriesDropdown", nil)

  itemsFrameUI.categoriesDropdown.HideMenu = function()
  	if L_UIDROPDOWNMENU_OPEN_MENU == itemsFrameUI.categoriesDropdown then
  		LDD:CloseDropDownMenus()
  	end
  end

  -- Implement the function to change the weekly reset day, then refresh
  itemsFrameUI.categoriesDropdown.SetValue = function(self, newValue)
    -- we update the category edit box
    if (itemsFrameUI.categoryEditBox:GetText() == newValue) then
      itemsFrameUI.categoryEditBox:SetText("")
      SetFocusEditBox(itemsFrameUI.categoryEditBox)
    elseif (newValue ~= nil) then
      itemsFrameUI.categoryEditBox:SetText(newValue)
      SetFocusEditBox(itemsFrameUI.nameEditBox)
    end
  end

  -- Create and bind the initialization function to the dropdown menu
  LDD:UIDropDownMenu_Initialize(itemsFrameUI.categoriesDropdown, function(self, level)
    if not level then return end
    local info = LDD:UIDropDownMenu_CreateInfo()
    wipe(info)

    if level == 1 then
      -- the title
      info.isTitle = true
      info.notCheckable = true
      info.text = L["Use an existing category"]
      LDD:UIDropDownMenu_AddButton(info, level)

      -- the categories
      wipe(info)
      info.func = self.SetValue
      local categories = itemsFrame:GetCategoriesOrdered()
      for _, v in pairs(categories) do
        info.arg1 = v
        info.text = v
        info.checked = itemsFrameUI.categoryEditBox:GetText() == v
        LDD:UIDropDownMenu_AddButton(info, level)
      end

      -- the close button
      wipe(info)
  		info.notCheckable = true
  		info.text = CLOSE
  		info.func = self.HideMenu
  		LDD:UIDropDownMenu_AddButton(info, level)
    end
  end, "MENU")

  itemsFrameUI.categoriesDropdownButton = CreateFrame("Button", "Todo_Button_CategoriesDropdown", itemsFrameUI.categoryEditBox, "Todo_DropdownButton")
  itemsFrameUI.categoriesDropdownButton:SetPoint("LEFT", itemsFrameUI.categoryEditBox, "RIGHT", 0, -1)
  itemsFrameUI.categoriesDropdownButton:SetScript("OnClick", function(self)
    LDD:ToggleDropDownMenu(1, nil, itemsFrameUI.categoriesDropdown, self:GetName(), 0, 0)
  end)
  itemsFrameUI.categoriesDropdownButton:SetScript("OnHide", itemsFrameUI.categoriesDropdown.HideMenu)

  itemsFrameUI.labelFirstItemName = itemsFrameUI:CreateFontString(nil); -- info label 3
  itemsFrameUI.labelFirstItemName:SetFontObject("GameFontHighlight");
  itemsFrameUI.labelFirstItemName:SetText(L["First item:"]);
  table.insert(addACategoryItems, itemsFrameUI.labelFirstItemName);

  itemsFrameUI.nameEditBox = CreateFrame("EditBox", nil, itemsFrameUI, "InputBoxTemplate"); -- edit box tp put the name of the first item
  l = config:CreateNoPointsLabel(itemsFrameUI, nil, itemsFrameUI.labelFirstItemName:GetText());
  itemsFrameUI.nameEditBox:SetSize(255 - l:GetWidth() - 20, 30);
  itemsFrameUI.nameEditBox:SetAutoFocus(false);
  itemsFrameUI.nameEditBox:SetScript("OnKeyDown", function(_, key) if (key == "TAB") then SetFocusEditBox(itemsFrameUI.categoryEditBox) end end)
  itemsFrameUI.nameEditBox:SetScript("OnEnterPressed", addCategory); -- if we press enter, it's like we clicked on the add button
  itemsFrameUI.nameEditBox:HookScript("OnEditFocusGained", function(self)
    if (Todo.db.profile.highlightOnFocus) then
      self:HighlightText()
    else
      self:HighlightText(self:GetCursorPosition(), self:GetCursorPosition())
    end
  end)
  table.insert(addACategoryItems, itemsFrameUI.nameEditBox);
  table.insert(hyperlinkEditBoxes, itemsFrameUI.nameEditBox);

  itemsFrameUI.addBtn = config:CreateButton("addButton", itemsFrameUI, L["Add category"]);
  itemsFrameUI.addBtn:SetScript("onClick", addCategory);
  table.insert(addACategoryItems, itemsFrameUI.addBtn);
end

local function generateTabActions()
  itemsFrameUI.tabActionsButton = CreateFrame("Button", "categoryButton", itemsFrameUI, "Todo_TabActionsButton");
  itemsFrameUI.tabActionsButton.tooltip = L["Tab actions"];
  itemsFrameUI.tabActionsButton:SetScript("OnClick", function()
    addACategoryClosed = true;
    optionsClosed = true;
    tabActionsClosed = not tabActionsClosed;
    itemsFrame:ReloadTab() -- we reload the frame to display the changes
  end);
  itemsFrameUI.tabActionsButton:Hide();

  --/************************************************/--

  itemsFrameUI.tabActionsTitle = config:CreateNoPointsLabel(itemsFrameUI, nil, string.format("|cff%s%s|r", config:RGBToHex(config.database.theme), L["Tab actions"]));
  table.insert(tabActionsItems, itemsFrameUI.tabActionsTitle);

  --/************************************************/--

  itemsFrameUI.btnCheck = config:CreateButton("btnCheck_itemsFrameUI", itemsFrameUI, L["Check"], "Interface\\BUTTONS\\UI-CheckBox-Check");
  itemsFrameUI.btnCheck:SetScript("OnClick", function(self)
    local tabName = self:GetParent():GetName();
    itemsFrame:CheckBtns(tabName);
  end);
  table.insert(tabActionsItems, itemsFrameUI.btnCheck);

  itemsFrameUI.btnUncheck = config:CreateButton("btnUncheck_itemsFrameUI", itemsFrameUI, L["Uncheck"], "Interface\\BUTTONS\\UI-CheckBox-Check-Disabled");
  itemsFrameUI.btnUncheck:SetScript("OnClick", function(self)
    local tabName = self:GetParent():GetName();
    itemsFrame:ResetBtns(tabName);
  end);
  table.insert(tabActionsItems, itemsFrameUI.btnUncheck);

  --/************************************************/--

  itemsFrameUI.btnClear = config:CreateButton("clearButton", itemsFrameUI, L["Clear"], "Interface\\GLUES\\LOGIN\\Glues-CheckBox-Check");
  itemsFrameUI.btnClear:SetScript("onClick", function(self)
    local tabName = self:GetParent():GetName();
    itemsFrame:ClearTab(tabName);
  end);
  table.insert(tabActionsItems, itemsFrameUI.btnClear);
end

local function generateOptions()
  itemsFrameUI.frameOptionsButton = CreateFrame("Button", "frameOptionsButton_itemsFrameUI", itemsFrameUI, "Todo_FrameOptionsButton");
  itemsFrameUI.frameOptionsButton.tooltip = L["Frame options"];
  itemsFrameUI.frameOptionsButton:SetScript("OnClick", function()
    addACategoryClosed = true;
    tabActionsClosed = true;
    optionsClosed = not optionsClosed;

    itemsFrame:ValidateTutorial("accessOptions"); -- tutorial

    itemsFrame:ReloadTab() -- we reload the frame to display the changes
  end);

  --/************************************************/--

  itemsFrameUI.optionsTitle = config:CreateNoPointsLabel(itemsFrameUI, nil, string.format("|cff%s%s|r", config:RGBToHex(config.database.theme), L["Frame options"]));
  table.insert(frameOptionsItems, itemsFrameUI.optionsTitle);

  --/************************************************/--

  itemsFrameUI.resizeTitle = config:CreateNoPointsLabel(itemsFrameUI, nil, string.format("|cffffffff%s|r", L["Hold ALT to see the resize button"]));
  itemsFrameUI.resizeTitle:SetFontObject("GameFontHighlight");
  --itemsFrameUI.resizeTitle:SetWidth(230)
  table.insert(frameOptionsItems, itemsFrameUI.resizeTitle);

  --/************************************************/--

  itemsFrameUI.frameAlphaSlider = CreateFrame("Slider", "frameAlphaSlider", itemsFrameUI, "OptionsSliderTemplate");
  itemsFrameUI.frameAlphaSlider:SetWidth(200);
  -- itemsFrameUI.frameAlphaSlider:SetHeight(17);
  -- itemsFrameUI.frameAlphaSlider:SetOrientation('HORIZONTAL');

  itemsFrameUI.frameAlphaSlider:SetMinMaxValues(0, 100);
  itemsFrameUI.frameAlphaSlider:SetValue(Todo.db.profile.frameAlpha);
  itemsFrameUI.frameAlphaSlider:SetValueStep(1);
  itemsFrameUI.frameAlphaSlider:SetObeyStepOnDrag(true);

  itemsFrameUI.frameAlphaSlider.tooltipText = L["Change the background opacity"]; --Creates a tooltip on mouseover.
  _G[itemsFrameUI.frameAlphaSlider:GetName() .. 'Low']:SetText((select(1,itemsFrameUI.frameAlphaSlider:GetMinMaxValues()))..'%'); --Sets the left-side slider text (default is "Low").
  _G[itemsFrameUI.frameAlphaSlider:GetName() .. 'High']:SetText((select(2,itemsFrameUI.frameAlphaSlider:GetMinMaxValues()))..'%'); --Sets the right-side slider text (default is "High").
  _G[itemsFrameUI.frameAlphaSlider:GetName() .. 'Text']:SetText(L["Frame opacity"]); --Sets the "title" text (top-centre of slider).
  itemsFrameUI.frameAlphaSlider:SetScript("OnValueChanged", FrameAlphaSlider_OnValueChanged);
  table.insert(frameOptionsItems, itemsFrameUI.frameAlphaSlider);

  itemsFrameUI.frameAlphaSliderValue = itemsFrameUI.frameAlphaSlider:CreateFontString("frameAlphaSliderValue"); -- the font string to see the current value
  itemsFrameUI.frameAlphaSliderValue:SetFontObject("GameFontNormalSmall");
  itemsFrameUI.frameAlphaSliderValue:SetText(itemsFrameUI.frameAlphaSlider:GetValue());
  table.insert(frameOptionsItems, itemsFrameUI.frameAlphaSliderValue);

  --/************************************************/--

  itemsFrameUI.frameContentAlphaSlider = CreateFrame("Slider", "frameContentAlphaSlider", itemsFrameUI, "OptionsSliderTemplate");
  itemsFrameUI.frameContentAlphaSlider:SetWidth(200);
  -- itemsFrameUI.frameContentAlphaSlider:SetHeight(17);
  -- itemsFrameUI.frameContentAlphaSlider:SetOrientation('HORIZONTAL');

  itemsFrameUI.frameContentAlphaSlider:SetMinMaxValues(60, 100);
  itemsFrameUI.frameContentAlphaSlider:SetValue(Todo.db.profile.frameContentAlpha);
  itemsFrameUI.frameContentAlphaSlider:SetValueStep(1);
  itemsFrameUI.frameContentAlphaSlider:SetObeyStepOnDrag(true);

  itemsFrameUI.frameContentAlphaSlider.tooltipText = L["Change the opacity for texts, buttons and other elements"]; --Creates a tooltip on mouseover.
  _G[itemsFrameUI.frameContentAlphaSlider:GetName() .. 'Low']:SetText((select(1,itemsFrameUI.frameContentAlphaSlider:GetMinMaxValues()))..'%'); --Sets the left-side slider text (default is "Low").
  _G[itemsFrameUI.frameContentAlphaSlider:GetName() .. 'High']:SetText((select(2,itemsFrameUI.frameContentAlphaSlider:GetMinMaxValues()))..'%'); --Sets the right-side slider text (default is "High").
  _G[itemsFrameUI.frameContentAlphaSlider:GetName() .. 'Text']:SetText(L["Frame content opacity"]); --Sets the "title" text (top-centre of slider).
  itemsFrameUI.frameContentAlphaSlider:SetScript("OnValueChanged", FrameContentAlphaSlider_OnValueChanged);
  table.insert(frameOptionsItems, itemsFrameUI.frameContentAlphaSlider);

  itemsFrameUI.frameContentAlphaSliderValue = itemsFrameUI.frameContentAlphaSlider:CreateFontString("frameContentAlphaSliderValue"); -- the font string to see the current value
  itemsFrameUI.frameContentAlphaSliderValue:SetFontObject("GameFontNormalSmall");
  itemsFrameUI.frameContentAlphaSliderValue:SetText(itemsFrameUI.frameContentAlphaSlider:GetValue());
  table.insert(frameOptionsItems, itemsFrameUI.frameContentAlphaSliderValue);

  --/************************************************/--

  itemsFrameUI.affectDesc = CreateFrame("CheckButton", "Todo_affectDesc", itemsFrameUI, "ChatConfigCheckButtonTemplate");
  itemsFrameUI.affectDesc.tooltip = L["Share the opacity options of this frame onto the description frames (only when checked)"]
  itemsFrameUI.affectDesc.Text:SetText(L["Affect description frames"]);
  itemsFrameUI.affectDesc.Text:SetFontObject("GameFontHighlight");
  --itemsFrameUI.affectDesc.Text:ClearAllPoints()
  --itemsFrameUI.affectDesc.Text:SetPoint("LEFT", itemsFrameUI.affectDesc, "RIGHT");
  itemsFrameUI.affectDesc:SetHitRectInsets(0, 0, 0, 0);
  itemsFrameUI.affectDesc:SetScript("OnClick", function(self)
    Todo.db.profile.affectDesc = self:GetChecked()
    FrameAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameAlpha);
    FrameContentAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameContentAlpha);
  end);
  itemsFrameUI.affectDesc:SetChecked(Todo.db.profile.affectDesc);
  table.insert(frameOptionsItems, itemsFrameUI.affectDesc);

  --/************************************************/--

  itemsFrameUI.btnAddonOptions = config:CreateButton("addonOptionsButton", itemsFrameUI, L["Open addon options"], "Interface\\Buttons\\UI-OptionsButton");
  itemsFrameUI.btnAddonOptions:SetScript("OnClick", function() Todo:ToggleOptions(true) end);
  table.insert(frameOptionsItems, itemsFrameUI.btnAddonOptions);
end

-- generating the content (top to bottom)
local function generateFrameContent()
  -- title
  itemsFrameUI.title = config:CreateNoPointsLabel(itemsFrameUI, nil, config.toc.title);
  itemsFrameUI.title:SetFontObject("GameFontNormalMed2");

  -- remaining label
  itemsFrameUI.remainingNumber = config:CreateNoPointsLabel(itemsFrameUI, nil, "...");
  itemsFrameUI.remainingNumber:SetFontObject("GameFontNormalMed2");
  itemsFrameUI.remainingNumber:SetJustifyH("LEFT");

  -- help button
  itemsFrameUI.helpButton = config:CreateHelpButton(itemsFrameUI);
  itemsFrameUI.helpButton:SetScript("OnClick", function()
    SlashCmdList["Todo"](L["info"])
    itemsFrame:ValidateTutorial("getMoreInfo"); -- tutorial
  end);

  -- undo button
  itemsFrameUI.undoButton = CreateFrame("Button", "undoButton_itemsFrameUI", itemsFrameUI, "Todo_UndoButton");
  itemsFrameUI.undoButton.tooltip = L["Undo last remove/clear"];
  itemsFrameUI.undoButton:SetScript("OnClick", itemsFrame.UndoRemove);
  itemsFrameUI.undoButton:Hide();

  -- add a category button
  generateAddACategory();

  -- tab actions button
  generateTabActions();

  -- options button
  generateOptions();

  itemsFrameUI.titleLineLeft = config:CreateNoPointsLine(itemsFrameUI, 2, unpack(config:ThemeDownTo01(config:DimTheme(config.database.theme_yellow, 0.8))))
  itemsFrameUI.titleLineRight = config:CreateNoPointsLine(itemsFrameUI, 2, unpack(config:ThemeDownTo01(config:DimTheme(config.database.theme_yellow, 0.8))))
  itemsFrameUI.menuTitleLineLeft = config:CreateNoPointsLine(itemsFrameUI, 2, unpack(config:ThemeDownTo01(config:DimTheme(config.database.theme, 0.7))))
  itemsFrameUI.menuTitleLineRight = config:CreateNoPointsLine(itemsFrameUI, 2, unpack(config:ThemeDownTo01(config:DimTheme(config.database.theme, 0.7))))
  itemsFrameUI.lineBottom = config:CreateNoPointsLine(itemsFrameUI, 2, unpack(config:ThemeDownTo01(config:DimTheme(config.database.theme, 0.7))))

  itemsFrameUI.nothingLabel = config:CreateNothingLabel(itemsFrameUI);

  itemsFrameUI.dummyLabel = config:CreateDummy(itemsFrameUI, itemsFrameUI.lineBottom, 0, 0);
end

-- tutorial
local function generateTutorialFrames()
  -- TUTO : How to add categories ("addNewCat")
    -- frame
    local TF_addNewCat = CreateFrame("Frame", "Todo_TF_addNewCat", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_addNewCat:SetSize(190, 50)
    TF_addNewCat.ArrowDOWN:Show()
    TF_addNewCat.Text:SetWidth(TF_addNewCat:GetWidth() - tutoFrameRightDist)
    TF_addNewCat.Text:SetText(L["Start by adding a new category!"]);
    TF_addNewCat.closeButton = CreateFrame("Button", "closeButton", TF_addNewCat, "UIPanelCloseButton");
    TF_addNewCat.closeButton:SetPoint("TOPRIGHT", TF_addNewCat, "TOPRIGHT", 6, 6);
    TF_addNewCat.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.addNewCat = TF_addNewCat;
    TF_addNewCat:Hide() -- we hide them by default, we show them only when we need to

    -- targeted frame
    -- tutorialFramesTarget.addNewCat = itemsFrameUI.categoryButton;
    -- TF_addNewCat:SetPoint("LEFT", tutorialFramesTarget.addNewCat, "RIGHT", 18, 0);
    tutorialFramesTarget.addNewCat = itemsFrameUI.categoryButton;
    TF_addNewCat:SetPoint("TOP", tutorialFramesTarget.addNewCat, "BOTTOM", 0, -18);

  -- TUTO : Adding the categories ("addCat")
    -- frame
    local TF_addCat = CreateFrame("Frame", "Todo_TF_addCat", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_addCat:SetSize(240, 50)
    TF_addCat.ArrowDOWN:Show()
    TF_addCat.Text:SetWidth(TF_addCat:GetWidth() - tutoFrameRightDist)
    TF_addCat.Text:SetText(L["This will add your category and item to the current tab"]);
    TF_addCat.closeButton = CreateFrame("Button", "closeButton", TF_addCat, "UIPanelCloseButton");
    TF_addCat.closeButton:SetPoint("TOPRIGHT", TF_addCat, "TOPRIGHT", 6, 6);
    TF_addCat.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.addCat = TF_addCat;
    TF_addCat:Hide()

    -- targeted frame
    tutorialFramesTarget.addCat = itemsFrameUI.addBtn;
    TF_addCat:SetPoint("TOP", tutorialFramesTarget.addCat, "BOTTOM", 0, -22);

  -- TUTO : adding an item to a category ("addItem")
    -- frame
    local TF_addItem = CreateFrame("Frame", "Todo_TF_addItem", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_addItem:SetSize(220, 50)
    TF_addItem.ArrowLEFT:Show()
    TF_addItem.Text:SetWidth(TF_addItem:GetWidth() - tutoFrameRightDist)
    TF_addItem.Text:SetText(L["To add new items to existing categories, just right-click the category names!"]);
    TF_addItem.closeButton = CreateFrame("Button", "closeButton", TF_addItem, "UIPanelCloseButton");
    TF_addItem.closeButton:SetPoint("TOPRIGHT", TF_addItem, "TOPRIGHT", 6, 6);
    TF_addItem.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.addItem = TF_addItem;
    TF_addItem:Hide()

    -- targeted frame
    -- THIS IS A SPECIAL TARGET THAT GETS UPDATED IN THE LOADCATEGORIES FUNCTION

  -- TUTO : getting more information ("getMoreInfo")
    -- frame
    local TF_getMoreInfo = CreateFrame("Frame", "Todo_TF_getMoreInfo", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_getMoreInfo:SetSize(275, 50)
    TF_getMoreInfo.ArrowRIGHT:Show()
    TF_getMoreInfo.Text:SetWidth(TF_getMoreInfo:GetWidth() - tutoFrameRightDist)
    TF_getMoreInfo.Text:SetText(L["If you're having any problems, or you want more information on systems like favorites or descriptions, you can always click here to print help in the chat!"]);
    TF_getMoreInfo.closeButton = CreateFrame("Button", "closeButton", TF_getMoreInfo, "UIPanelCloseButton");
    TF_getMoreInfo.closeButton:SetPoint("TOPRIGHT", TF_getMoreInfo, "TOPRIGHT", 6, 6);
    TF_getMoreInfo.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.getMoreInfo = TF_getMoreInfo;
    TF_getMoreInfo:Hide()

    -- targeted frame
    tutorialFramesTarget.getMoreInfo = itemsFrameUI.helpButton;
    TF_getMoreInfo:SetPoint("LEFT", tutorialFramesTarget.getMoreInfo, "RIGHT", 18, 0);

  -- TUTO : accessing the options ("accessOptions")
    -- frame
    local TF_accessOptions = CreateFrame("Frame", "Todo_TF_accessOptions", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_accessOptions:SetSize(220, 50)
    TF_accessOptions.ArrowUP:Show()
    TF_accessOptions.Text:SetWidth(TF_accessOptions:GetWidth() - tutoFrameRightDist)
    TF_accessOptions.Text:SetText(L["You can access the options from here"]);
    TF_accessOptions.closeButton = CreateFrame("Button", "closeButton", TF_accessOptions, "UIPanelCloseButton");
    TF_accessOptions.closeButton:SetPoint("TOPRIGHT", TF_accessOptions, "TOPRIGHT", 6, 6);
    TF_accessOptions.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.accessOptions = TF_accessOptions;
    TF_accessOptions:Hide()

    -- targeted frame
    tutorialFramesTarget.accessOptions = itemsFrameUI.frameOptionsButton;
    TF_accessOptions:SetPoint("BOTTOM", tutorialFramesTarget.accessOptions, "TOP", 0, 18);

  -- TUTO : what does holding ALT do? ("ALTkey")
    -- frame
    local TF_ALTkey = CreateFrame("Frame", "Todo_TF_ALTkey", itemsFrameUI, "Todo_HelpPlateTooltip")
    TF_ALTkey:SetSize(220, 50)
    TF_ALTkey.ArrowUP:Show()
    TF_ALTkey.Text:SetWidth(TF_ALTkey:GetWidth() - tutoFrameRightDist)
    TF_ALTkey.Text:SetText(L["One more thing: if you hold ALT while the list is opened, some interesting buttons will appear!"]);
    TF_ALTkey.closeButton = CreateFrame("Button", "closeButton", TF_ALTkey, "UIPanelCloseButton");
    TF_ALTkey.closeButton:SetPoint("TOPRIGHT", TF_ALTkey, "TOPRIGHT", 6, 6);
    TF_ALTkey.closeButton:SetScript("onClick", function() Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; end);
    tutorialFrames.ALTkey = TF_ALTkey;
    TF_ALTkey:Hide()

    -- targeted frame
    tutorialFramesTarget.ALTkey = itemsFrameUI;
    TF_ALTkey:SetPoint("BOTTOM", tutorialFramesTarget.ALTkey, "TOP", 0, 18);
end

function itemsFrame:ValidateTutorial(tuto_name)
  -- completes the "tuto_name" tutorial, only if it was active
  local i = config:GetKeyFromValue(tuto_order, tuto_name);
  if (Todo.db.global.tuto_progression < i) then
    if (Todo.db.global.tuto_progression == i-1) then
      Todo.db.global.tuto_progression = Todo.db.global.tuto_progression + 1; -- we validate the tutorial
    end
  end
end

function itemsFrame:RedoTutorial()
  Todo.db.global.tuto_progression = 0;
  ItemsFrame_OnVisibilityUpdate()
  itemsFrameUI.ScrollFrame:SetVerticalScroll(0);
end

----------------------------------
-- Creating the frame and tabs
----------------------------------

--Selecting the tab
Tab_OnClick = function(self)
  PanelTemplates_SetTab(self:GetParent(), self:GetID());

  local scrollChild = itemsFrameUI.ScrollFrame:GetScrollChild();
  if (scrollChild) then
    scrollChild:Hide();
  end

  itemsFrameUI.ScrollFrame:SetScrollChild(self.content);

  -- we update the frame before loading the tab if there are changes pending
  ItemsFrame_Update();

  CurrentTab = self.content; -- for an easier access to the currently selected tab, in any function

  -- Loading the good tab
  if (self:GetName() == "TodoUIFrameTab1") then loadTab(AllTab) end
  if (self:GetName() == "TodoUIFrameTab2") then loadTab(DailyTab) end
  if (self:GetName() == "TodoUIFrameTab3") then loadTab(MidweekTab) end
  if (self:GetName() == "TodoUIFrameTab4") then loadTab(WeeklyTab) end

  -- we update the frame after loading the tab to refresh the display
  ItemsFrame_Update();

  self.content:Show();
end

--Creating the tabs
local function SetTabs(frame, numTabs, ...)
  frame.numTabs = numTabs;

  local contents = {};
  local frameName = frame:GetName();

  for i = 1, numTabs do
    local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "PanelTabButtonTemplate");

    tab:SetID(i);
    tab:SetText(select(i, ...));
    tab:SetScript("OnClick", function(self)
      itemsFrame:ReloadTab(self:GetName())
    end);

    local name = ""
    if (tab:GetName() == "TodoUIFrameTab1") then name = "All"
    elseif (tab:GetName() == "TodoUIFrameTab2") then name = "Daily"
    elseif (tab:GetName() == "TodoUIFrameTab3") then name = "Midweek"
    elseif (tab:GetName() == "TodoUIFrameTab4") then name = "Weekly" end
    tab.content = CreateFrame("Frame", name, itemsFrameUI.ScrollFrame);
    tab.content:SetSize(308, 1); -- y is determined by number of elements inside of it
    tab.content:Hide();

    table.insert(contents, tab.content);

    if (i == 1) then -- position
      tab:SetPoint("TOPLEFT", itemsFrameUI, "BOTTOMLEFT", 5, 1);
    else
      tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", 0, 0);
    end
  end

  return unpack(contents);
end

function itemsFrame:ResetContent()
  -- considering I don't want to reload the UI when we change the current profile,
  -- we have to reset all the frame ourserves, so that means:

  -- 1 - having to hide everything in it (since elements don't dissapear even
  -- when we nil them, that's how wow and lua works)
  for catName, items in pairs(currentDBItemsList) do
    for itemName in pairs(items) do
      checkBtn[catName][itemName]:Hide()
    end
  end

  for k, _ in pairs(currentDBItemsList) do
    label[k]:Hide()
    categoryLabelFavsRemaining[k]:Hide()
    editBox[k]:Hide()
    table.remove(hyperlinkEditBoxes, select(2, config:HasItem(hyperlinkEditBoxes, editBox[k])))
  end

  for _, v in pairs(descFrames) do
    v:Hide()
    table.remove(hyperlinkEditBoxes, select(2, config:HasItem(hyperlinkEditBoxes, v.descriptionEditBox.EditBox)))
  end

  -- 2 - reset every content variable to their default value
  clearing, undoing = false, { ["clear"] = false, ["clearnb"] = 0, ["single"] = false, ["singleok"] = true};
  movingItem, movingCategory = false, false

  checkBtn = {};
  removeBtn = {};
  favoriteBtn = {};
  descBtn = {};
  descFrames = {};
  label = {};
  editBox = {};
  categoryLabelFavsRemaining = {};
  addACategoryClosed = true;
  tabActionsClosed = true;
  optionsClosed = true;
  autoResetedThisSession = false;
end

--Frame init
function itemsFrame:Init(profileChanged)
  -- this one is for keeping track of the old itemsList when we reset,
  -- so that we can hide everything when we change profiles
  currentDBItemsList = Todo.db.profile.itemsList;

  -- we resize and scale the frame to match the saved variable
  itemsFrameUI:SetSize(Todo.db.profile.frameSize.width, Todo.db.profile.frameSize.height);
  -- we reposition the frame to match the saved variable
  local points = Todo.db.profile.framePos;
  itemsFrameUI:ClearAllPoints();
  itemsFrameUI:SetPoint(points.point, nil, points.relativePoint, points.xOffset, points.yOffset); -- relativeFrame = nil -> entire screen
  -- and update its elements opacity to match the saved variable
  FrameAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameAlpha);
  FrameContentAlphaSlider_OnValueChanged(nil, Todo.db.profile.frameContentAlpha);

  -- Generating the core --
  loadMovable();

  -- IMPORTANT: this code is to activate hyperlink clicks in edit boxes such as the ones for adding new items in categories,
  -- I disabled this for practical reasons: it's easier to write new item names in them if we can click on the links without triggering the hyperlink (and it's not very useful anyways :D).
  -- -- and after generating every one of the fixed elements, we go throught every edit box marked as hyperlink, and add them the handlers here:
  -- for _, v in pairs(hyperlinkEditBoxes) do
  --   if (not v:GetHyperlinksEnabled()) then -- just to be sure they are new ones (eg: not redo this for the first item name edit box of the add a category menu)
  --     v:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
  --     v:SetScript("OnHyperlinkClick", function(self, linkData, link, button)
  --       ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
  --     end);
  --   end
  -- end

  -- then we update everything
  ItemsFrame_UpdateTime(); -- for the auto reset check (we could wait 1 sec, but nah we don't have the time man)
  itemsFrame:ReloadTab() -- We load the good tab

  -- and we reload the saved variables needing an update
  itemsFrameUI.frameAlphaSlider:SetValue(Todo.db.profile.frameAlpha);
  itemsFrameUI.frameContentAlphaSlider:SetValue(Todo.db.profile.frameContentAlpha);
  itemsFrameUI.affectDesc:SetChecked(Todo.db.profile.affectDesc);

  -- when we're here, the list already exists, we just switched profiles and we need to update the new visibility
  if (profileChanged) then
    ItemsFrame_OnVisibilityUpdate()
  end
end

---Creating the main window---
function itemsFrame:CreateItemsFrame()
  -- local btn = CreateFrame("Frame", nil, UIParent, "LargeUIDropDownMenuTemplate")
  -- btn:SetPoint("CENTER")
  -- UIDropDownMenu_SetWidth(btn, 200)
  -- if (true) then return; end
  -- as of wow 9.0, we need to import the backdrop template into our frames if we want to use it in them, it is not set by default, so that's what we are doing here:
  itemsFrameUI = CreateFrame("Frame", "TodoUIFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate" or nil);

  -- background
  itemsFrameUI:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = false, tileSize = 1, edgeSize = 10, insets = { left = 1, right = 1, top = 1, bottom = 1 }});

  -- properties
  itemsFrameUI:SetResizable(true);
  --itemsFrameUI:SetMinResize(240, 284);
  --itemsFrameUI:SetMaxResize(600, 1000);
  itemsFrameUI:SetFrameLevel(200);
  itemsFrameUI:SetMovable(true);
  itemsFrameUI:SetClampedToScreen(true);
  itemsFrameUI:EnableMouse(true);
  -- itemsFrameUI:SetHyperlinksEnabled(true); -- to enable OnHyperlinkClick
  -- itemsFrameUI:SetScript("OnHyperlinkClick", function(_, linkData, link, button)
  --   ChatFrame_OnHyperlinkShow(ChatFrame1, linkData, link, button)
  -- end);

  itemsFrameUI:HookScript("OnUpdate", ItemsFrame_OnUpdate);
  itemsFrameUI:HookScript("OnShow", ItemsFrame_OnVisibilityUpdate);
  itemsFrameUI:HookScript("OnHide", ItemsFrame_OnVisibilityUpdate);
  itemsFrameUI:HookScript("OnSizeChanged", function(self)
    Todo.db.profile.frameSize.width = self:GetWidth()
    Todo.db.profile.frameSize.height = self:GetHeight()
    ItemsFrame_Scale()
  end);

  -- to move the frame AND NOT HAVE THE PRB WITH THE RESIZE so it's custom moving
  itemsFrameUI.isMouseDown = false
  itemsFrameUI.hasMoved = false
  local function StopMoving(self)
    self.isMouseDown = false
    if (self.hasMoved == true) then
      self:StopMovingOrSizing()
      self.hasMoved = false
      local points, _ = Todo.db.profile.framePos, nil
      points.point, _, points.relativePoint, points.xOffset, points.yOffset = self:GetPoint()
    end
  end
  itemsFrameUI:HookScript("OnMouseDown", function(self, button)
    if (button == "LeftButton") then
      self.isMouseDown = true
      cursorX, cursorY = GetCursorPosition()
    end
  end)
  itemsFrameUI:HookScript("OnMouseUp", StopMoving)
  itemsFrameUI:HookScript("OnHide", StopMoving)

  -- // CONTENT OF THE FRAME // --

  -- random variables
  itemsFrameUI.timeSinceLastUpdate = 0;
  itemsFrameUI.timeSinceLastRefresh = 0;

  -- generating the fixed content shared between the 3 tabs
  generateFrameContent();

  -- generating the non tab-specific content of the frame
  generateTutorialFrames();

  -- scroll frame
  itemsFrameUI.ScrollFrame = CreateFrame("ScrollFrame", nil, itemsFrameUI, "UIPanelScrollFrameTemplate");
  itemsFrameUI.ScrollFrame:SetPoint("TOPLEFT", itemsFrameUI, "TOPLEFT", 4, - 4);
  itemsFrameUI.ScrollFrame:SetPoint("BOTTOMRIGHT", itemsFrameUI, "BOTTOMRIGHT", - 4, 4);
  itemsFrameUI.ScrollFrame:SetClipsChildren(true);

  itemsFrameUI.ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel);

  itemsFrameUI.ScrollFrame.ScrollBar:ClearAllPoints();
  itemsFrameUI.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", itemsFrameUI.ScrollFrame, "TOPRIGHT", - 12, - 38); -- the bottomright is updated in the OnUpdate (to manage the resize button)

  -- close button
  itemsFrameUI.closeButton = CreateFrame("Button", "closeButton", itemsFrameUI, "Todo_CloseButton");
  itemsFrameUI.closeButton:SetPoint("TOPRIGHT", itemsFrameUI, "TOPRIGHT", -1, -1);
  itemsFrameUI.closeButton:SetScript("onClick", function(self) self:GetParent():Hide(); end);

  -- resize button
  itemsFrameUI.resizeButton = CreateFrame("Button", nil, itemsFrameUI, "Todo_TooltipResizeButton")
  itemsFrameUI.resizeButton.tooltip = L["Left click - resize"].."\n"..L["Right click - reset"];
  itemsFrameUI.resizeButton:SetPoint("BOTTOMRIGHT", -3, 3)
  itemsFrameUI.resizeButton:SetScript("OnMouseDown", function(self, button)
    if (button == "LeftButton") then
      itemsFrameUI:StartSizing("BOTTOMRIGHT")
      self:GetHighlightTexture():Hide() -- more noticeable
      self.MiniTooltip:Hide()
    end
  end)
  itemsFrameUI.resizeButton:SetScript("OnMouseUp", function(self, button)
    if (button == "LeftButton") then
      itemsFrameUI:StopMovingOrSizing()
      self:GetHighlightTexture():Show()
      self.MiniTooltip:Show()
    end
  end)
  itemsFrameUI.resizeButton:SetScript("OnHide", function(self)  -- same as on mouse up, just security
    itemsFrameUI:StopMovingOrSizing()
    self:GetHighlightTexture():Show()
  end)
  itemsFrameUI.resizeButton:RegisterForClicks("RightButtonUp")
  itemsFrameUI.resizeButton:HookScript("OnClick", function() -- reset size
    itemsFrameUI:SetSize(300, 350)
  end)

  -- Generating the tabs --
  AllTab, DailyTab, MidweekTab, WeeklyTab = SetTabs(itemsFrameUI, 4, L["All"], L["Daily"], L["Midweek"], L["Weekly"])

  -- Initializing the frame with the current data
  itemsFrame:Init(false)

  -- when we're here, the list was just created, so it is opened by default already,
  -- then we decide what we want to do with that
  if (Todo.db.profile.openByDefault) then
    ItemsFrame_OnVisibilityUpdate()
  elseif (Todo.db.profile.keepOpen) then
    itemsFrameUI:SetShown(Todo.db.profile.lastListVisibility)
  else
    itemsFrameUI:Hide()
  end
end
