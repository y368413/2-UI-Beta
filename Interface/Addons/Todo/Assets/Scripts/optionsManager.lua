-- Namespaces
local addonName, todoTable = ...;

local config = todoTable.config;
local itemsFrame = todoTable.itemsFrame;

-- Variables

local L = config.L;
local LDB = config.LDB;
local LDBIcon = config.LDBIcon;

-- we need to put all of this in a file that loads just before the init so they have acces to every function in every other file of the addon

--/*******************/ GENERAL FUNCTIONS /*************************/--

function Todo:ToggleFrame()
  -- Bindings.xml access
  itemsFrame:Toggle();
end

function Todo:ToggleOptions(fromFrame)
  InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
  InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function Todo:Warn()
  if (not itemsFrame:autoResetedThisSessionGET()) then -- we don't want to show this warning if it's the first log in of the day, only if it is the next ones
    if (Todo.db.profile.showWarnings) then
      local haveWarned = false
      local warn = "--------------| |cffff0000"..L["WARNING"].."|r |--------------"

      if (Todo.db.profile.favoritesWarning) then -- and the user allowed this functionnality
        local _, _, _, ucFavs = itemsFrame:updateRemainingNumber()
        local daily, midweek, weekly = ucFavs.Daily, ucFavs.Midweek, ucFavs.Weekly
        if ((daily + midweek + weekly) > 0) then -- and there is at least one daily, midweek, or weekly favorite left to do
          local str = ""

          -- we first check if there are daily ones
          if (daily > 0) then
            if ((Todo.db.profile.autoReset["Daily"] - time()) < 86400) then -- pretty much all the time
              str = str..daily.." ("..L["Daily"]..")"
            end
          end

          -- then we check if there are midweek ones
          if (midweek > 0) then
            if ((Todo.db.profile.autoReset["Midweek"] - time()) < 86400) then -- if there is less than one day left before the weekly reset
              if (str ~= "") then
                str = str.." + "
              end
              str = str..midweek.." ("..L["Midweek"]..")"
            end
          end

          -- then we check if there are weekly ones
          if (weekly > 0) then
            if ((Todo.db.profile.autoReset["Weekly"] - time()) < 86400) then -- if there is less than one day left before the weekly reset
              if (str ~= "") then
                str = str.." + "
              end
              str = str..weekly.." ("..L["Weekly"]..")"
            end
          end

          if (str ~= "") then
            local hex = config:RGBToHex({ Todo.db.profile.favoritesColor[1]*255, Todo.db.profile.favoritesColor[2]*255, Todo.db.profile.favoritesColor[3]*255} )
            str = string.format("|cff%s%s|r", hex, str)
            if (not haveWarned) then config:PrintForced(warn) haveWarned = true end
            config:PrintForced(config:SafeStringFormat(L["You still have %s favorite item(s) to do before the next reset, don't forget them!"], str))
          end
        end
      end

      if (Todo.db.profile.normalWarning) then
        local _, _, uc = itemsFrame:updateRemainingNumber()
        local daily, midweek, weekly = uc.Daily, uc.Midweek, uc.Weekly
        if ((daily + weekly) > 0) then -- and there is at least one daily or weekly item left to do (favorite or not)
          local total = 0

          -- we first check if there are daily ones
          if (daily > 0) then
            if ((Todo.db.profile.autoReset["Daily"] - time()) < 86400) then -- pretty much all the time
              total = total + daily
            end
          end

          -- then we check if there are midweekly ones
          if (midweek > 0) then
            if ((Todo.db.profile.autoReset["Midweek"] - time()) < 86400) then -- if there is less than one day left before the weekly reset
              total = total + midweek
            end
          end

          -- then we check if there are weekly ones
          if (weekly > 0) then
            if ((Todo.db.profile.autoReset["Weekly"] - time()) < 86400) then -- if there is less than one day left before the weekly reset
              total = total + weekly
            end
          end

          if (total ~= 0) then
            if (not haveWarned) then config:PrintForced(warn) haveWarned = true end
            config:PrintForced(L["Total number of items left to do before tomorrow:"]..' '..tostring(total))
          end
        end
      end

      if (haveWarned) then
        local timeUntil = config:GetTimeUntilReset()
        local str2 = config:SafeStringFormat(L["Time remaining: %i hours %i min"], timeUntil.hour, timeUntil.min + 1)
        config:PrintForced(str2)
      end
    end
  end
end

function Todo:CreateTodoButton()
  -- Creating the big button to easily toggle the frame
  itemsFrame.todoButton = config:CreateButton("todoButton", UIParent, config.toc.title);
  itemsFrame.todoButton:SetFrameLevel(100);
  itemsFrame.todoButton:SetMovable(true);
  itemsFrame.todoButton:EnableMouse(true);
  itemsFrame.todoButton:SetClampedToScreen(true);
  itemsFrame.todoButton:RegisterForDrag("LeftButton");
  itemsFrame.todoButton:SetScript("OnDragStart", itemsFrame.todoButton.StartMoving);
  itemsFrame.todoButton:SetScript("OnDragStop", function() -- we save its position
    itemsFrame.todoButton:StopMovingOrSizing()
    local points, _ = self.db.profile.todoButton.points, nil
    points.point, _, points.relativePoint, points.xOffset, points.yOffset = itemsFrame.todoButton:GetPoint()
  end);
  itemsFrame.todoButton:SetScript("OnClick", itemsFrame.Toggle); -- the function the button calls when pressed
  Todo:RefreshTodoButton();
end

function Todo:RefreshTodoButton()
  local points = self.db.profile.todoButton.points;
  itemsFrame.todoButton:ClearAllPoints();
  itemsFrame.todoButton:SetPoint(points.point, nil, points.relativePoint, points.xOffset, points.yOffset); -- relativeFrame = nil -> entire screen
  itemsFrame.todoButton:SetShown(self.db.profile.todoButton.show);
end

local function draw_tooltip(tooltip)
  if (not Todo.db.profile.minimap.tooltip) then
    tooltip:Hide();
    return;
  end

  if tooltip and tooltip.AddLine then
      -- we get the color theme
      local hex = config:RGBToHex(config.database.theme)

      -- then we create each line
      tooltip:ClearLines();
      tooltip:AddDoubleLine(config.toc.title, config.toc.version);
      tooltip:AddLine(string.format("|cff%s%s|r", hex, L["Click"])..' - '..string.format("|cff%s%s|r", "FFFFFF", L["toggle the list"]))
      tooltip:AddLine(string.format("|cff%s%s|r", hex, L["Shift-Click"])..' - '..string.format("|cff%s%s|r", "FFFFFF", L["toggle addon options"]))
      tooltip:AddLine(string.format("|cff%s%s|r", hex, L["Ctrl-Click"])..' - '..string.format("|cff%s%s|r", "FFFFFF", Todo.db.profile.minimap.lock and L["unlock minimap button"] or L["lock minimap button"]))
      tooltip:Show()
  end
end

function Todo:CreateMinimapButton()
  -- creating the data object to store the button infos

  local tooltipObject; -- we get the tooltip on the first draw_tooltip call from OnTooltipShow

  local LDB_o_minimap = LDB:NewDataObject(addonName, {
    type = "launcher",
    label = config.toc.title,
    icon = "Interface\\AddOns\\"..addonName.."\\Assets\\Art\\minimap_icon",
    OnClick = function()
      if (IsControlKeyDown()) then
        -- lock minimap button
        if (not Todo.db.profile.minimap.lock) then
          LDBIcon:Lock(addonName)
        else
          LDBIcon:Unlock(addonName)
        end
        draw_tooltip(tooltipObject) -- we redraw the tooltip to display the lock change
      elseif (IsShiftKeyDown()) then
        -- toggle addon options
        Todo:ToggleOptions()
      else
        -- toggle the list
        Todo:ToggleFrame()
      end
    end,
    OnTooltipShow = function(tooltip)
      tooltipObject = tooltip
      draw_tooltip(tooltip)
    end,
  })

  -- Registering the data broker and creating the button
  LDBIcon:Register(addonName, LDB_o_minimap, self.db.profile.minimap)

  -- and this is the secret to correctly update the button position, (since we can't update it in the init code)
  -- so that the first time that we click on it, it doesn't go somewhere else like so many do,
  -- we just delay its update :D (a number of times to be sure, considering some ppl take longer times to load the UI)
  self.iconTimerCount = 0;
  self.iconTimerCountMax = 7;
  local delay = 1.2; -- in seconds

  -- so here, we are, each delay for max self.iconTimerCountMax seconds calling this function
  self.iconTimer = self:ScheduleRepeatingTimer(function()
    -- we really do this to call this function
    LDBIcon:Refresh(addonName, self.db.profile.minimap)

    -- and here we check and stop the timer when we're done
    self.iconTimerCount = self.iconTimerCount + 1;
    if self.iconTimerCount == self.iconTimerCountMax then
      self:CancelTimer(self.iconTimer)
    end
  end, delay)
end

-- this func is called once in init, on the addon load
-- and also every time we switch profiles
function Todo:DBInit()
  -- checking for an addon update, globally
  if (self.db.global.latestVersion ~= config.toc.version) then
    self:GlobalNewVersion()
    self.db.global.latestVersion = config.toc.version
    self.db.global.addonUpdated = true
  end

  -- checking for an addon update, for the profile that was just loaded
  if (self.db.profile.latestVersion ~= config.toc.version) then
    self:ProfileNewVersion()
    self.db.profile.latestVersion = config.toc.version
  end

  -- initialization of elements that need access to other files functions or need to be updated correctly when the profile changes
  if (self.db.profile.autoReset == nil) then self.db.profile.autoReset = { ["Daily"] = config:GetSecondsToReset().daily, ["Midweek"] = config:GetSecondsToReset().midweek, ["Weekly"] = config:GetSecondsToReset().weekly } end
  -- Initialize midweek reset value if upgrading from 1.0.11 or earlier
  if (self.db.profile.autoReset["Midweek"] == nil) then self.db.profile.autoReset["Midweek"] = config:GetSecondsToReset().midweek end
  
    if (not self.db.profile.rememberUndo) then self.db.profile.undoTable = {} end
end

function Todo:ProfileChanged()
  Todo:DBInit() -- in case the selected profile is empty

  -- we update the changes for the list
  itemsFrame:ResetContent()
  itemsFrame:Init(true)

  -- we update the changes to the options (since I now use tabs and the options are not instantly getting a refresh when changing profiles)
  Todo:CallAllGETTERS()
end

-- these two functions are called only once, each time there is an addon update
function Todo:GlobalNewVersion() -- global
  -- updates the global saved variables once after an update

  if (Todo.db.global.tuto_progression > 0) then -- if we already completed the tutorial
    -- since i added in the update a new tutorial frame that i want ppl to see, i just go back step in the tuto progression
    Todo.db.global.tuto_progression = Todo.db.global.tuto_progression - 1;
  end
end

function Todo:ProfileNewVersion() -- profile
  -- if we're loading this profile for the first time after updating to 5.5+ from 5.4-
  if (self.db.profile.itemsDaily or self.db.profile.itemsMidweek or self.db.profile.itemsWeekly or self.db.profile.itemsFavorite or self.db.profile.itemsDesc or self.db.profile.checkedButtons) then
    -- we need to change the saved variables to the new format
    local oldItemsList = config:Deepcopy(self.db.profile.itemsList)
    self.db.profile.itemsList = {}

    for catName, itemNames in pairs(oldItemsList) do -- for every cat we had
      self.db.profile.itemsList[catName] = {}
      for _, itemName in pairs(itemNames) do -- and for every item we had
        -- first we get the previous data elements from the item
        -- / tabName
        local tabName = "All"
        if (config:HasItem(self.db.profile.itemsDaily, itemName)) then
          tabName = "Daily"
        elseif (config:HasItem(self.db.profile.itemsMidweek, itemName)) then
          tabName = "Midweek"
        elseif (config:HasItem(self.db.profile.itemsWeekly, itemName)) then
          tabName = "Weekly"
        end
        -- / checked
        local checked = config:HasItem(self.db.profile.checkedButtons, itemName)
        -- / favorite
        local favorite = nil
        if (config:HasItem(self.db.profile.itemsFavorite, itemName)) then
          favorite = true
        end
        -- / description
        local description = nil;
        if (config:HasKey(self.db.profile.itemsDesc, itemName)) then
          description = self.db.profile.itemsDesc[itemName]
        end

        -- then we replace it by the new var
        self.db.profile.itemsList[catName][itemName] = {
          ["tabName"] = tabName,
          ["checked"] = checked,
          ["favorite"] = favorite,
          ["description"] = description,
        }
      end
    end

    -- bye bye
    self.db.profile.itemsDaily = nil;
    self.db.profile.itemsMidweek = nil;
    self.db.profile.itemsWeekly = nil;
    self.db.profile.itemsFavorite = nil;
    self.db.profile.itemsDesc = nil;
    self.db.profile.checkedButtons = nil;
  end
end

--/*******************/ GETTERS/SETTERS /*************************/--

-- for each of the getters, we also call the setters to set the value to the current one,
-- just to update them (in case we switched profiles or something happened and only the getters are called,
-- the actual states of the buttons are not updated), this allows us to not call a special function to
-- reupdate everything right when we switch profiles: this is now done automatically.

function Todo:CallAllGETTERS()
  -- this simply calls every getters of every options in the options table
  -- (and so updates them, since i also call the setters like explained before)

  local function RecursiveGet(arg)
    if (arg.type == "group") then
      for _, subarg in pairs(arg.args) do
        RecursiveGet(subarg)
      end
    else
      if (arg.type ~= "description" and arg.type ~= "header") then
        if (type(arg.get) == "string") then
          Todo[arg.get]();
        elseif(type(arg.get) == "function") then
          arg:get();
        end
      end
    end
  end

  for _, arg in pairs(config.database.options.args.main.args) do -- for every option in the main section
    RecursiveGet(arg)
  end
end

function Todo:InitializeOptionsWidthRecursive(table, wDef)
  for _,v in pairs(table) do
    if (v.type == "group") then
      Todo:InitializeOptionsWidthRecursive(v.args, wDef)
    elseif (v.type ~= "description" and v.type ~= "header") then -- for every widget (except the descriptions and the headers), we keep their min normal width, we change it only if their name is bigger than the default width
      local w = config:CreateNoPointsLabel(UIParent, nil, v.name):GetWidth();
      -- print (v.name.."_"..w)
      w = tonumber(string.format("%.3f", w/wDef[v.type]));
      if (w > 1) then
        v.width = w;
      end
    end
  end
end

-- // 'General' tab // --

--favoritesColor
function Todo:favoritesColorGET(info)
  Todo:favoritesColorSET(info, unpack(Todo.db.profile.favoritesColor))
  return unpack(Todo.db.profile.favoritesColor);
end

function Todo:favoritesColorSET(info, ...)
  Todo.db.profile.favoritesColor = { select(1, ...), select(2, ...), select(3, ...), select(4, ...) };
  itemsFrame:updateCheckButtonsColor()
  itemsFrame:updateRemainingNumber()
end

-- todoButtonShow
function Todo:todoButtonShowGET(info)
  Todo:todoButtonShowSET(info, Todo.db.profile.todoButton.show)
  return Todo.db.profile.todoButton.show;
end

function Todo:todoButtonShowSET(info, newValue)
  Todo.db.profile.todoButton.show = newValue;
  Todo:RefreshTodoButton();
end

-- todoButtonRed
function Todo:todoButtonRedGET(info)
  Todo:todoButtonRedSET(info, Todo.db.profile.todoButton.red)
  return Todo.db.profile.todoButton.red;
end

function Todo:todoButtonRedSET(info, newValue)
  Todo.db.profile.todoButton.red = newValue;
  itemsFrame:updateRemainingNumber() -- we update the color depending on the new frame's data
end

-- minimapButtonHide
function Todo:minimapButtonHideGET(info)
  Todo:minimapButtonHideSET(info, Todo.db.profile.minimap.hide)
  return Todo.db.profile.minimap.hide;
end

function Todo:minimapButtonHideSET(info, newValue)
  Todo.db.profile.minimap.hide = newValue;
  LDBIcon:Refresh(addonName, Todo.db.profile.minimap)
end

-- minimapButtonTooltip
function Todo:minimapButtonTooltipGET(info)
  Todo:minimapButtonTooltipSET(info, Todo.db.profile.minimap.tooltip)
  return Todo.db.profile.minimap.tooltip;
end

function Todo:minimapButtonTooltipSET(info, newValue)
  Todo.db.profile.minimap.tooltip = newValue;
  LDBIcon:Refresh(addonName, Todo.db.profile.minimap)
end

-- rememberUndo
function Todo:rememberUndoGET(info)
  Todo:rememberUndoSET(info, Todo.db.profile.rememberUndo)
  return Todo.db.profile.rememberUndo;
end

function Todo:rememberUndoSET(info, newValue)
  Todo.db.profile.rememberUndo = newValue;
end

-- keepOpen
function Todo:keepOpenGET(info)
  Todo:keepOpenSET(info, Todo.db.profile.keepOpen)
  return Todo.db.profile.keepOpen;
end

function Todo:keepOpenSET(info, newValue)
  Todo.db.profile.keepOpen = newValue;
end

-- openByDefault
function Todo:openByDefaultGET(info)
  Todo:openByDefaultSET(info, Todo.db.profile.openByDefault)
  return Todo.db.profile.openByDefault;
end

function Todo:openByDefaultSET(info, newValue)
  Todo.db.profile.openByDefault = newValue;
end

-- highlightOnFocus
function Todo:highlightOnFocusGET(info)
  Todo:highlightOnFocusSET(info, Todo.db.profile.highlightOnFocus)
  return Todo.db.profile.highlightOnFocus;
end

function Todo:highlightOnFocusSET(info, newValue)
  Todo.db.profile.highlightOnFocus = newValue;
end

-- keyBind
function Todo:keyBindGET(info)
  -- here we don't need to call the SET since the key binding is independant of profiles
  return GetBindingKey("Todo");
end

function Todo:keyBindSET(info, newKey)
  -- we only want one key to be ever bound to this
  local key1, key2 = GetBindingKey("Todo") -- so first we get both keys associated to thsi addon (in case there are)
  -- then we delete their binding from this addon (we clear every binding from this addon)
  if key1 then SetBinding(key1) end
  if key2 then SetBinding(key2) end

  -- and finally we set the new binding key
  if (newKey ~= '') then -- considering we pressed one (not ESC)
    SetBinding(newKey, "Todo")
  end

  -- and save the changes

  --@retail@
  SaveBindings(GetCurrentBindingSet())
  --@end-retail@

  --[===[@non-retail@
  AttemptToSaveBindings(GetCurrentBindingSet())
  --@end-non-retail@]===]
end

-- // 'Tabs' tab // --

-- instantRefresh
function Todo:instantRefreshGET(info)
  Todo:instantRefreshSET(info, Todo.db.profile.instantRefresh)
  return Todo.db.profile.instantRefresh;
end

function Todo:instantRefreshSET(info, newValue)
  Todo.db.profile.instantRefresh = newValue;
  itemsFrame:ReloadTab()
end

-- deleteAllTabItems
function Todo:deleteAllTabItemsGET(info)
  Todo:deleteAllTabItemsSET(info, Todo.db.profile.deleteAllTabItems)
  return Todo.db.profile.deleteAllTabItems;
end

function Todo:deleteAllTabItemsSET(info, newValue)
  Todo.db.profile.deleteAllTabItems = newValue;
  itemsFrame:ReloadTab()
end

-- showOnlyAllTabItems
function Todo:showOnlyAllTabItemsGET(info)
  Todo:showOnlyAllTabItemsSET(info, Todo.db.profile.showOnlyAllTabItems)
  return Todo.db.profile.showOnlyAllTabItems;
end

function Todo:showOnlyAllTabItemsSET(info, newValue)
  Todo.db.profile.showOnlyAllTabItems = newValue;
  itemsFrame:ReloadTab()
end

-- hideDailyTabItems
function Todo:hideDailyTabItemsGET(info)
  Todo:hideDailyTabItemsSET(info, Todo.db.profile.hideDailyTabItems)
  return Todo.db.profile.hideDailyTabItems;
end

function Todo:hideDailyTabItemsSET(info, newValue)
  Todo.db.profile.hideDailyTabItems = newValue;
  itemsFrame:ReloadTab()
end

-- hideMidweekTabItems
function Todo:hideMidweekTabItemsGET(info)
  Todo:hideMidweekTabItemsSET(info, Todo.db.profile.hideMidweekTabItems)
  return Todo.db.profile.hideMidweekTabItems;
end

function Todo:hideMidweekTabItemsSET(info, newValue)
  Todo.db.profile.hideMidweekTabItems = newValue;
  itemsFrame:ReloadTab()
end

-- hideWeeklyTabItems
function Todo:hideWeeklyTabItemsGET(info)
  Todo:hideWeeklyTabItemsSET(info, Todo.db.profile.hideWeeklyTabItems)
  return Todo.db.profile.hideWeeklyTabItems;
end

function Todo:hideWeeklyTabItemsSET(info, newValue)
  Todo.db.profile.hideWeeklyTabItems = newValue;
  itemsFrame:ReloadTab()
end

-- // 'Chat Messages' tab // --

--showChatMessages
function Todo:showChatMessagesGET(info)
  Todo:showChatMessagesSET(info, Todo.db.profile.showChatMessages)
  return Todo.db.profile.showChatMessages;
end

function Todo:showChatMessagesSET(info, newValue)
  Todo.db.profile.showChatMessages = newValue;
end

--showWarnings
function Todo:showWarningsGET(info)
  Todo:showWarningsSET(info, Todo.db.profile.showWarnings)
  return Todo.db.profile.showWarnings;
end

function Todo:showWarningsSET(info, newValue)
  Todo.db.profile.showWarnings = newValue;
end

--favoritesWarning
function Todo:favoritesWarningGET(info)
  Todo:favoritesWarningSET(info, Todo.db.profile.favoritesWarning)
  return Todo.db.profile.favoritesWarning;
end

function Todo:favoritesWarningSET(info, newValue)
  Todo.db.profile.favoritesWarning = newValue;
end

--normalWarning
function Todo:normalWarningGET(info)
  Todo:normalWarningSET(info, Todo.db.profile.normalWarning)
  return Todo.db.profile.normalWarning;
end

function Todo:normalWarningSET(info, newValue)
  Todo.db.profile.normalWarning = newValue;
end

--hourlyReminder
function Todo:hourlyReminderGET(info)
  Todo:hourlyReminderSET(info, Todo.db.profile.hourlyReminder)
  return Todo.db.profile.hourlyReminder;
end

function Todo:hourlyReminderSET(info, newValue)
  Todo.db.profile.hourlyReminder = newValue;
end

-- // 'Auto Uncheck' tab // --

-- weeklyDay
function Todo:weeklyDayGET(info)
  Todo:weeklyDaySET(info, Todo.db.profile.weeklyDay)
  return Todo.db.profile.weeklyDay;
end

function Todo:weeklyDaySET(info, newValue)
  Todo.db.profile.weeklyDay = newValue;
  Todo.db.profile.autoReset["Weekly"] = config:GetSecondsToReset().weekly;
end

-- midweekDay
function Todo:midweekDayGET(info)
  Todo:midweekDaySET(info, Todo.db.profile.midweekDay)
  return Todo.db.profile.midweekDay;
end

function Todo:midweekDaySET(info, newValue)
  Todo.db.profile.midweekDay = newValue;
  Todo.db.profile.autoReset["Midweek"] = config:GetSecondsToReset().midweek;
end

-- midweekHour
function Todo:midweekHourGET(info)
  Todo:midweekHourSET(info, Todo.db.profile.midweekHour)
  return Todo.db.profile.midweekHour;
end

function Todo:midweekHourSET(info, newValue)
  Todo.db.profile.midweekHour = newValue;
  Todo.db.profile.autoReset["Midweek"] = config:GetSecondsToReset().midweek;
end

-- dailyHour
function Todo:dailyHourGET(info)
  Todo:dailyHourSET(info, Todo.db.profile.dailyHour)
  return Todo.db.profile.dailyHour;
end

function Todo:dailyHourSET(info, newValue)
  Todo.db.profile.dailyHour = newValue;
  Todo.db.profile.autoReset["Daily"] = config:GetSecondsToReset().daily
  Todo.db.profile.autoReset["Weekly"] = config:GetSecondsToReset().weekly
end
