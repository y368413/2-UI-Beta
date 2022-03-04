--[[To do:
Swap equip key
Drag equipped items to bank
Close all / expand all
Remove all categories
Data transfer to other players
Items with charges
Equip Slot indicator
Alternate color indicator for special slot counts
Find solution for "0" item buildup - have to set a lock?
Shift key for forced arrangement
]]

BaudManifestDebug = false;

-----------
-- DebugMsg: print a debugging message to the chat frame
-----------

local function DebugMsg(Msg)
  if BaudManifestDebug then DEFAULT_CHAT_FRAME:AddMessage(Msg); end
end

-----------
-- DebugPrintLink: print an item link in readable form
-----------

local function DebugPrintLink(Link)
   return gsub(Link, "\124", "\124\124");
end

--if extra backgrounds are added, they must be formatted to fit WoW's standards and the client must be restarted

local Backgrounds = {
  {File = false, Size = 8},
  {File = "Asphalt", Size = 128},
  {File = "Bricks", Size = 128},
  {File = "Bumpy", Size = 64},
  {File = "CrackedPaint", Size = 128},
  {File = "DiamondPlate", Size = 128},
  {File = "Grain", Size = 128},
  {File = "Hatch", Size = 128},
  {File = "Paper", Size = 128},
};

local ResizeCursors = {
  TOP = "Vertical",
  BOTTOM = "Vertical",
  LEFT = "Horizontal",
  RIGHT = "Horizontal",
  TOPLEFT = "Diagonal1",
  BOTTOMRIGHT = "Diagonal1",
  TOPRIGHT = "Diagonal2",
  BOTTOMLEFT = "Diagonal2",
};

local Displays = {};
local BankBags = {};
local QualityDrop = {};
local SpecialBags = {};
local PlayerHash = {};
local HookData = {};
local ClickBlocks = {};
local DragItem, DragPending, VirtualDrag, BankOpen, TradeOpen, VendorOpen;
local SplitHoldItem, SplitHoldExpire, SplitPending, SplitTimeout, IgnoreHooks, CursorItem;
local DisableCombine, DisableSpecial, UseSpecial;
local CursorHover, PlayerName, SelectedChar;
local RealmData, PlayerData, GlobalConfig, Config, AltConfig, AllCharData, AllCharHash, OtherCharMoney;
local NumSpecials, LocaleContainer, RenamePending;
local DisplayNames = {"Inventory", "Bank Box", "Reagent Bank"};
local AutoSellTable = {};

--List will refresh on first OnUpdate

local QueuedUpdate = {true, true};
local QueuedUpdateFrame = CreateFrame("Frame");
local ClearCursorFrame = CreateFrame("Frame");
local CursorHoverFrame = CreateFrame("Frame");
CursorHoverFrame:Hide();

local _; --Space filler variable.  Declared anyways to avoid writing to globals.
local MsgPrefix = "|cffffff00Baud Manifest:|r ";
local AllCharText = "All Characters";

local ClearFocus = CreateFrame("EditBox");
ClearFocus:SetAutoFocus(nil);
ClearFocus:SetScript("OnEditFocusGained", function(self) self:ClearFocus(); end);

local Tooltip = CreateFrame("GameTooltip", "BaudManifestTooltip");
Tooltip:AddFontStrings(Tooltip:CreateFontString("$parentTextLeft1"), Tooltip:CreateFontString("$parentTextRight1"));
local TooltipLines = {};
local TooltipMoney;
Tooltip:SetScript("OnTooltipAddMoney", function(self, Money) TooltipMoney = Money; end);

local FilterDelay = 0.3;
local FadeTime = 0.2;
local IndentSize = 10;

local UpdateDisplays = function()
  for Display = 1, 5 do
    BaudManifestScrollBar_Update(Displays[Display], true);
  end
end

local CheckButtons = {
  {Text="Character Specific Settings", SavedVar="CharSpecific", Default=false,
    TooltipText="When enabled, modifying the settings for this character will not affect other characters.",
    Func = function() BaudManifestRouteConfig(); end},

  {Text="Show Fading", SavedVar="Fading", Default=true,
    TooltipText="The manifest will fade in when opened, and fade out when closed."},

  {Text="Combine Stacks", SavedVar="Combine", Default=true,
    TooltipText="Automatically combines incomplete item stacks."},

  {Text="Fill Special Bags", SavedVar="FillSpecials", Default=true,
    TooltipText="Automatically moves items from normal bags into specialty ones (quiver, etc.).  This helps keep your all-purpose bag slots free for use."},

  {Text="Auto Show Inventory", SavedVar="AutoShowInv", Default=true,
    TooltipText="Automatically shows your inventory at the bank, mailbox, vendor, auction house, or while trading."},

  {Text="Stop Blizzard's Auto Show", SavedVar="HideBlizInv", Default=true,
    TooltipText="Stops Blizzard's backpack from automatically opening at the mail and vendor."},

  {Text="Auto Show Bank", SavedVar="ShowBank", Default=true,
    TooltipText="Shows your bank box when it is opened.  The bank box can also be opened with a hotkey, or from the inventory's menu.",
    Func = function() BaudManifestUpdateBlizBankBlock(); end},

  {Text="Hide Blizzard's Bank", SavedVar="HideBlizBank", Default=true, Depend="ShowBank",
    TooltipText="Prevents Blizzard's bank box from showing when you open your bank box.",
    Func = function() BaudManifestUpdateBlizBankBlock(); end},

  {Text="Replace Blizzard's Bags", SavedVar="ReplaceBlizBags", Default=true,
    TooltipText="Opening Blizzard's bags will open Baud Manifest instead.",
    Func = function() BaudManifestHookBlizBags(); end},

  {Text="Hide Equipped", SavedVar="HideEquipped", Default=true,
    TooltipText="Hides items in the manifest when they are equipped. Equipped items will always be shown when the list is filtered, sorted, or viewed from another character.",
    Func = function() BaudManifestUpdateDisplayList(Displays[1]); end},

  {Text="Item Name First", SavedVar="ItemNameFirst", Default=false,
    TooltipText="Displays the item's name before its quantity.",
    Func = UpdateDisplays},

  {Text="Show Arrows", SavedVar="ShowArrows", Default=true,
    TooltipText="Shows arrows at the top or bottom of the manifest if not all items can be displayed at once.",
    Func = UpdateDisplays},
};

--This list controls which variables in the item list get saved.  Extra data is discarded on log out to save memory.
local SaveItemVars = {
  ItemString = true,
  Category = true,
  Count = true,
  Slots = true,
  Equipped = true,
  Properties = true,
};

-- TODO: battle pet issues?
local Sorts = {
  {Name = "No Sorting"},
  {Name = "Alphabetical", Func = function(ListItem) return select(1, GetItemInfo(ListItem.ItemString)); end},
  {Name = "Rarity", Func = function(ListItem) return select(3, GetItemInfo(ListItem.ItemString)); end},
  {Name = "Item Type", Func = function(ListItem)
    local _, _, _, _, _, Type, SubType, _, EquipLoc = GetItemInfo(ListItem.ItemString);
    if (EquipLoc == "INVTYPE_ROBE") then EquipLoc = "INVTYPE_CHEST";
    elseif (EquipLoc == "INVTYPE_THROWN") then EquipLoc = "INVTYPE_RANGED";
    elseif (EquipLoc == "INVTYPE_HOLDABLE") or (EquipLoc == "INVTYPE_SHIELD") then EquipLoc = "INVTYPE_WEAPONOFFHAND2";
    end
    return Type .. EquipLoc .. SubType;
  end},
  {Name = "Slots Used", Func = function(ListItem) return not(not ListItem.Count and false or ListItem.Slots or true) and 1 or 0; end},
};

local Yellow = {NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b};
local Gray = {GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b};
local White = {1, 1, 1};

local InvBagsOffset = ContainerIDToInventoryID(1) - 1;
local BankBagsOffset = ContainerIDToInventoryID(5) - 1;

local bitand = bit.band;

StaticPopupDialogs.BAUDMANIFEST_DELETECATEGORY = {
  text = "Are you sure you want to delete this category?",
  button1 = YES,
  button2 = NO,
  OnAccept = function() BaudManifestDeleteDraggedCategory(); end,
  OnCancel = function() BaudManifestClearVirtualDrag(); end,
  timeout = false,
  exclusive = true,
  hideOnEscape = true,
};

StaticPopupDialogs.BAUDMANIFEST_CATEGORIZE = {
  text = "This action will put uncategorized items into categories based on their type.  Do you wish to proceed?",
  button1 = YES,
  button2 = NO,
  OnAccept = function(self, Display) BaudManifestCategorize(Display); end,
  timeout = false,
  exclusive = true,
  hideOnEscape = true,
};

StaticPopupDialogs.BAUDMANIFEST_REMOVECHAR = {
  text = "|cffff1919Warning:|r Are you sure you want to delete the item and category information for %s?",
  button1 = YES,
  button2 = NO,
  OnAccept = function(self, CharName)
    SelectedChar = nil;
    BaudManifestCharactersScrollBoxHighlight:Hide();
    RealmData[CharName] = nil;
    AllCharHash = nil;
    UpdateCharList();
    for Key = 4, 6 do
      Displays[Key]:Hide();
    end
  end,
  timeout = false,
  exclusive = true,
  hideOnEscape = true
};

------------------
-- GetItemString: get the item string from an item link
------------------

local function GetItemString(Link)
  if not Link then return; end

  if strmatch(Link, "battlepet:") then
    return strmatch(Link, "(battlepet:%d*:%d*:%d*:%d*:%d*:%d*:%d*:%d*)|");
  elseif strmatch(Link, "keystone:") then
    return strmatch(Link, "(keystone:%d*:%d*:%d*:%d*:%d*:%d*:%d*)|");
  else
    return strmatch(Link, "(item:%d*:%d*:%d*:%d*:%d*:%d*:%-?%d*:%-?%d*:%d*:%d*:[%d%a-:]+)|");
  end
end

------------------
-- CleanItemString: remove character's level and spec from the item string, since those can change
------------------

local function CleanItemString(ItemString)
  if not ItemString then return; end

  -- We might have a saved item string from pre-7.0 that still has zero-fields.
  local CleanItemString = gsub(ItemString, ":0", ":");

  if strmatch(CleanItemString, "battlepet:") or strmatch(CleanItemString, "keystone:") then
    return CleanItemString;
  end

  --((item:itemID:enchant:gem1:gem2:gem3:gem4):(suffixID):(uniqueID):)level:specializationID:(upgradeId:instDiffID:numBonusIDs:bID1:bID2...:upgradeValue)
  local Prefix, First, SuffixID, UniqueID, Rest = strmatch(CleanItemString, "((item:%d*:%d*:%d*:%d*:%d*:%d*):(%-?%d*):(%-?%d*):)%d*:%d*:([%d%a-:]+)");
  if Prefix then
     if (SuffixID ~= '' and tonumber(SuffixID) < 0) then
        -- Need to keep UniqueID, since it contains part of the item's identity.
        return Prefix..Rest
     else
        -- Need to clear the UniqueID, so that the item will stack in the manifest.
        return First..":"..SuffixID.."::"..Rest;
     end
  else
    -- pre-6.0 format
    return CleanItemString.."::::::";
  end
end

---------------------
-- ItemsAreEquivalent
---------------------

local function ItemsAreEquivalent(ItemString1, ItemString2)
  return CleanItemString(ItemString1) == CleanItemString(ItemString2);
end

---------------------
-- AutoSellTable
---------------------

local function SetAutoSellTable(itemString, value)
  if not itemString then return; end
  AutoSellTable[CleanItemString(itemString)] = value;
end

local function GetAutoSellTable(itemString)
  return AutoSellTable[CleanItemString(itemString)];
end

-----------------
-- UpdateCharList
-----------------

local CharEntries = {};
local function UpdateCharList()
  local CharList = {};
  for Name, Value in pairs(RealmData) do
    if (Name ~= PlayerName) and (Name ~= AllCharText) then
      tinsert(CharList, Name);
    end
  end
  table.sort(CharList, function(a, b) return(a < b); end);
  tinsert(CharList, 1, AllCharText);

  for Key = #CharList + 1, #CharEntries do
    CharEntries[Key]:Hide();
  end

  local Entry, Texture, Coords, Text;
  for Key, Value in ipairs(CharList) do
    if (Key > #CharEntries) then
      Entry = CreateFrame("Button", "BaudManifestCharacterEntry" .. Key, BaudManifestCharactersScrollBox, "BaudManifestCharacterEntryTemplate");
      Entry:SetPoint("TOP", 0, 6 - 16 * Key);
      CharEntries[Key] = Entry;
    else
      Entry = CharEntries[Key];
    end
    local Text = _G[Entry:GetName() .. "Text"];
    Text:SetText(Value);
    Entry.Name = Value;

    if (Key == 1) then
      Text:SetTextColor(1, 1, 1);
      Text:SetPoint("LEFT", 2, 0);
    else
      Texture = _G[Entry:GetName() .. "Texture"];
      Coords = CLASS_ICON_TCOORDS[strupper(RealmData[Value].Class or "")];
      if Coords then
        Texture:SetTexture("Interface\\WorldStateFrame\\Icons-Classes");
        Texture:SetTexCoord(unpack(Coords));
        Texture:Show();
      end
    end
  end
end

----------------------
-- IsDisplayAccessible: Returns true if we can actually interact with the display in question; false if the display is read-only.
----------------------

local function IsDisplayAccessable(Display)
  return (Display:GetID() == 1) or (BankOpen and (Display:GetID() == 2 or Display:GetID() == 3));
end

--------------
-- GetCharData
--------------

local function GetCharData(Name)
  local CharData = RealmData[Name];
  if (type(CharData) ~= "table") then
    CharData = {};
    RealmData[Name] = CharData;
  end

  for Index = 1, 3 do
    if (type(CharData[Index]) ~= "table") then
      CharData[Index] = {};
    end

    if (type(CharData[Index][1]) ~= "table") then
      CharData[Index][1] = {};
    end

    if (type(CharData[Index].BGColor) ~= "table") then
      CharData[Index].BGColor = {0.5, 0.5, 0.5, 0.7};
    end

    local Valid;
    for Key, Value in ipairs(Backgrounds) do
      if (Value.File == CharData[Index].BGTexture) then
        Valid = true;
        break;
      end
    end

    if not Valid then
      CharData[Index].BGTexture = "Bumpy";
    end
  end

  return CharData;
end

---------------------
-- Event ADDON_LOADED
---------------------

local EventFuncs;
EventFuncs = {
  ADDON_LOADED = function(self, event, arg1)
    if arg1 == "BaudManifest" then
      if (type(BaudManifestData) ~= "table") then
          BaudManifestData = {};
        end

        GlobalConfig = BaudManifestData.Global;
        if (type(GlobalConfig) ~= "table") then
          GlobalConfig = {};
          BaudManifestData.Global = GlobalConfig;
        end

        local RealmName = GetRealmName();
        RealmData = BaudManifestData[RealmName];
        if (type(RealmData) ~= "table") then
          RealmData = {};
          BaudManifestData[RealmName] = RealmData;
        end

        PlayerName = UnitName("player");
        --Copy from individual character saved variables for backwards compatibility
        if not RealmData[PlayerName] and BaudManifest_Cfg then
          RealmData[PlayerName] = BaudManifest_Cfg.Items;
        end

        PlayerData = GetCharData(PlayerName);
        BaudManifestRouteConfig();
        local Hash, Item, ItemIndex, Duplicates, Category;
        for Index = 1, 3 do
          local Display = Displays[Index];
          Display.Data = PlayerData[Index];
          BaudManifestUpdateBGTexture(Display);
          if (Index ~= 3) then
            Display.BagsButton:SetChecked(Display.Data.ShowBags);
            if not Display.Data.ShowBags then
              Display.BagsFrame:Hide();
            end
          end

          if Display.Data.LockSize then
            Display.Resize:Hide();
          end

          Hash = {};
          PlayerHash[Index] = Hash;
          Display.Hash = Hash;

          --Scan is done in reverse so that duplicate items in categories are preserved before ones out of categories.
          for CatIndex = #Display.Data, 1, -1 do
            Category = Display.Data[CatIndex];
            ItemIndex = 1;
            while true do
              Item = Category[ItemIndex];
              if not Item then
                break;
              end

              if Item.ItemString then
                local CleanedItemString = CleanItemString(Item.ItemString);
                if not CleanedItemString then
                  --DebugMsg("Couldn't clean item string "..Item.ItemString);
                else
                  if not Hash[CleanedItemString] then
                    Hash[CleanedItemString] = Item;
                  else
                    --Remove duplicate
                    tremove(Category, ItemIndex);
                    ItemIndex = ItemIndex - 1;
                    Duplicates = true;
                  end
                end
              end
              ItemIndex = ItemIndex + 1;
            end
          end
        end

        if Duplicates then
          DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix.."Duplicate item(s) removed.", 1, .1, .1);
        end

        BaudManifestUpdateBlizBankBlock();
        if PlayerData.ReplaceBlizBags then
          BaudManifestHookBlizBags();
        end

        if not PlayerData.BankBag then
          PlayerData.BankBag = {};
        end

        local Texture, BagSlot;
        for Bag = 1, NUM_BANKBAGSLOTS do
          --Bag name length is restricted
          BagSlot = BankBags[Bag];
          Texture = nil;
          if not PlayerData.BankBag[Bag] then
            PlayerData.BankBag[Bag] = {};
          elseif PlayerData.BankBag[Bag].Link then
            Texture = GetItemIcon(PlayerData.BankBag[Bag].Link);
            SetItemButtonCount(BagSlot, PlayerData.BankBag[Bag].Count or 0);
          else
            Texture = select(2, GetInventorySlotInfo("Bag"..Bag));
          end
          SetItemButtonTexture(BagSlot, Texture);
        end

        UpdateCharList();
        if (type(PlayerData.PutQuality) ~= "table") then
          PlayerData.PutQuality = {};
        end

        for Quality = 0, 4 do
          if not PlayerData.PutQuality[Quality] then
            PlayerData.PutQuality[Quality] = 1;
          end
        end

        if not PlayerData.AutoSell then
          PlayerData.AutoSell = 1;
        end

        -- fill out the autosell table from the file data
     	local AutoSell = PlayerData[1][PlayerData.AutoSell];
        for Key, Value in ipairs(AutoSell) do
     	  SetAutoSellTable(Value.ItemString, 1);
     	end
    end
  end,

---------------------
-- Event PLAYER_LOGIN
---------------------

  PLAYER_LOGIN = function()
    EventFuncs.PLAYER_LOGIN = nil;  --Free up memory
    PlayerData.Class = select(2, UnitClass("player"));
  end,

------------------------------
-- Event PLAYER_ENTERING_WORLD
------------------------------

  PLAYER_ENTERING_WORLD = function()
    PlayerData.Money = GetMoney();
    BaudManifestBankPurchaseUpdate();
  end,

----------------------
-- Event PLAYER_LOGOUT
----------------------

  PLAYER_LOGOUT = function()
    --Variable cleanup here
    for Display, Value in ipairs(PlayerData) do
      for Category, Value in ipairs(Value) do
        for ItemIndex, Value in ipairs(Value) do
          for Key, _ in pairs(Value) do
            if not SaveItemVars[Key] then
              Value[Key] = nil;
            end
          end
        end
      end
    end
  end,

---------------------
-- Event PLAYER_MONEY
---------------------

  PLAYER_MONEY = function()
    PlayerData.Money = GetMoney();
  end,

---------------------
-- Event UNIT_INVENTORY_CHANGED
---------------------

  UNIT_INVENTORY_CHANGED = function(self, event, ...)
    local arg1 = ...;
    if (arg1 ~= "player") then
      return;
    end
    QueuedUpdate[1] = true;
    QueuedUpdateFrame:Show();
  end,

---------------------
-- Event ITEM_LOCK_CHANGED
---------------------

  ITEM_LOCK_CHANGED = function(self, event, ...)
    local Bag, Slot = ...;

    if (Bag == BANK_CONTAINER) and (Slot > NUM_BANKGENERIC_SLOTS) then
      BankFrameItemButton_UpdateLocked(BankBags[Slot - NUM_BANKGENERIC_SLOTS]);
      return;
    end

    if IgnoreHooks then
      return;
    end

    --The list is updated to change the specific targeted items, but only if the list is open
    for Display = 1, 3 do
      if Displays[Display]:IsShown() then
        QueuedUpdate[Display] = true;
      end
    end
    QueuedUpdateFrame:Show();
  end,

---------------------
-- Event BAG_UPDATE_COOLDOWN
---------------------

  BAG_UPDATE_COOLDOWN = function()
    if not RenamePending then
      BaudManifestScrollBar_Update(Displays[1]);
    end
  end,

---------------------
-- Event PLAYERBANKBAGSLOTS_CHANGED
---------------------

  PLAYERBANKBAGSLOTS_CHANGED = function()
    BaudManifestBankPurchaseUpdate();
  end,

---------------------
-- Event BANKFRAME_OPENED
---------------------

  BANKFRAME_OPENED = function()
    BankOpen = true;
    BaudManifestUpdateList(Displays[2]);
    BaudManifestUpdateList(Displays[3]);
    BaudManifestAutoShow(false, true);
    BaudManifestBankSlotPurchaseButton:Enable();
    for Bag = 1, NUM_BANKBAGSLOTS do
      PlayerData.BankBag[Bag].Link = GetInventoryItemLink("player", Bag + BankBagsOffset);
      PlayerData.BankBag[Bag].Count = GetInventoryItemCount("player", Bag + BankBagsOffset);
      BankFrameItemButton_Update(BankBags[Bag]);
    end
    BaudManifestDepositAndWithdraw();
  end,

---------------------
-- Event BANKFRAME_CLOSED
---------------------

  BANKFRAME_CLOSED = function()
    BankOpen = false;
    BaudManifestAutoShow(true, true);
    BaudManifestBankSlotPurchaseButton:Disable();
  end,

---------------------
-- Event TRADE_SHOW
---------------------

  TRADE_SHOW = function()
    TradeOpen = true;
    if not CursorHasItem() then
      BaudManifestPickupDragRemain(BaudManifestTradeRemain);
    end
    BaudManifestAutoShow();
  end,

---------------------
-- Event TRADE_CLOSED
---------------------

  TRADE_CLOSED = function()
    TradeOpen = false;
    QueuedUpdate[1] = true;
    QueuedUpdateFrame:Show();
    BaudManifestAutoShow(true);
  end,

---------------------
-- Event TRADE_PLAYER_ITEM_CHANGED
---------------------

  --This is needed to detect if the item gets dropped on a player in the game world.  Problem is, it fires before the item is
  --removed from the cursor.
  TRADE_PLAYER_ITEM_CHANGED = function()
    if TradeOpen and CursorHasItem() and DragItem and not IgnoreHooks then
      DragItem.Trading = true;
    end
  end,

---------------------
-- Event MAIL_SHOW
---------------------

  MAIL_SHOW = function()
    BaudManifestAutoShow();
  end,

---------------------
-- Event MAIL_CLOSED
---------------------

  MAIL_CLOSED = function()
    BaudManifestAutoShow(true);
  end,

---------------------
-- Event MERCHANT_SHOW
---------------------

  MERCHANT_SHOW = function()
    VendorOpen = true;
    BaudManifestAutoSellItems();
    BaudManifestAutoBuyItems();
    BaudManifestAutoShow();
  end,

---------------------
-- Event MERCHANT_CLOSED
---------------------

  MERCHANT_CLOSED = function()
    VendorOpen = false;
    BaudManifestAutoShow(true);
  end,

---------------------
-- Event AUCTION_HOUSE_SHOW
---------------------

  AUCTION_HOUSE_SHOW = function()
    BaudManifestAutoShow();
  end,

---------------------
-- Event AUCTION_HOUSE_CLOSED
---------------------

  AUCTION_HOUSE_CLOSED = function()
    BaudManifestAutoShow(true);
  end,

---------------------
-- Event CURSOR_UPDATE
---------------------

  CURSOR_UPDATE = function(self, event, ...)
    local arg1 = ...;
    if (arg1 == "up") then
      ClearFocus:SetFocus();
    end

    if (CursorHasItem() ~= CursorItem) then
      CursorItem = CursorHasItem();
      if not CursorItem then
        ClearCursorFrame:Show();
        BaudManifestDragCount:Hide();
        if DragItem and DragItem.Trading then
          DragItem.Trading = nil;
          if not IgnoreHooks then
            BaudManifestPickupDragRemain(BaudManifestTradeRemain);
          end
        end
      elseif DragItem and not IgnoreHooks then
        DragItem = nil;
      end

      BaudManifestUpdateBlocked();
    end
  end,

---------------------
-- Event BAG_UPDATE
---------------------

  BAG_UPDATE = function(self, event, ...)
    local arg1 = ...;

    if (event == "PLAYERBANKSLOTS_CHANGED") then
      if (arg1 > NUM_BANKGENERIC_SLOTS) then
        BankFrameItemButton_Update(BankBags[arg1 - NUM_BANKGENERIC_SLOTS]);
        return;
      end
    end

    --Updating of items done even if the bag is closed to keep the ordering correct
    local Display;
    if (event == "PLAYERBANKSLOTS_CHANGED") or (arg1 == -1) or (arg1 > 4) then
      Display = 2;
    elseif (event == "PLAYERREAGENTBANKSLOTS_CHANGED") or (arg1 == -3) then
      Display = 3;
    else
      Display = 1;
    end

    QueuedUpdate[Display] = true;
    QueuedUpdateFrame:Show();

    if DragPending and (DragPending.Origin:GetID() == Display) then
      DragPending.Ready = true;
    end
  end,
};

EventFuncs.BAG_CLOSED = EventFuncs.BAG_UPDATE;
EventFuncs.PLAYERBANKSLOTS_CHANGED = EventFuncs.BAG_UPDATE;
EventFuncs.PLAYERREAGENTBANKSLOTS_CHANGED = EventFuncs.BAG_UPDATE;

----------------------------
-- BaudManifestToggleDisplay
----------------------------

function BaudManifestToggleDisplay(Display)
  Display = Displays[Display];
  if Display:IsShown() then
    Display:Hide();
  else
    Display:Show();
  end
end

--------------------------
-- BaudManifestToggleChars
--------------------------

function BaudManifestToggleChars(self)
  if BaudManifestCharacters:IsShown() then
    BaudManifestCharacters:Hide()
  else
    BaudManifestCharacters:ClearAllPoints();
    BaudManifestCharacters:SetPoint("CENTER");
    BaudManifestCharacters:Show();
  end
end

----------------------
-- BaudManifest_OnLoad
----------------------

function BaudManifest_OnLoad(self)
  SlashCmdList["BaudManifest"] = function(Msg)
    if (strlower(Msg) == "options") then
      InterfaceOptionsFrame_OpenToCategory("Baud Manifest");
    else
      BaudManifestToggleDisplay(1);
    end
  end

  SLASH_BaudManifest1 = "/baudmanifest";
  SLASH_BaudManifest2 = "/baudman";
  SLASH_BaudManifest3 = "/bm";

  BINDING_HEADER_BaudManifest = "Baud Manifest";
  BINDING_NAME_BaudManifest = "Toggle Inventory";
  BINDING_NAME_BaudManifestToggleBank = "Toggle Bank";
  BINDING_NAME_BaudManifestToggleChars = "Toggle Characters";

  for Key, Value in pairs(EventFuncs) do
    self:RegisterEvent(Key);
  end

  self:SetScript("OnEvent", function(self, event, ...) EventFuncs[event](self, event, ...); end);
end

-----------------------
-- BaudManifestAutoShow
-----------------------

function BaudManifestAutoShow(Hide, Bank)
  local Display;
  for Index = 1, 2 do
    if (Index == 1) and Config.AutoShowInv or (Index == 2) and Bank and Config.ShowBank then
      Display = Displays[Index];
      if Hide then
        if Display:IsShown() then
          if Display.AutoShown then
            Display:Hide();
          else
            BaudManifestScrollBar_Update(Display);
          end
        end
      elseif not Display:IsShown() or Display.Closing then
        Display:Show();
        Display.Closing = false;
        Display.AutoShown = true;
      end
    end
  end
end

----------------------------------------------
-- BaudManifestCategoryEditBox_OnEditFocusLost
----------------------------------------------

function BaudManifestCategoryEditBox_OnEditFocusLost(self)
  if self:IsShown() then
    self.Category.Name = self:GetText();
  end
  self:Hide();
  BaudManifestScrollBar_Update(self.Display);
  RenamePending = false;
end

-------------------------------
-- BaudManifestClearVirtualDrag
-------------------------------

function BaudManifestClearVirtualDrag()
  if not VirtualDrag then
    return;
  end
  -- was "INTERFACESOUND_CURSORDROPOBJECT" -- not in SOUNDKIT
  PlaySound(689);
  VirtualDrag = nil;
  BaudManifestVirtualDrag:Hide();
  BaudManifestUpdateBlocked();
end

------------------------------------
-- BaudManifestDeleteDraggedCategory
------------------------------------

function BaudManifestDeleteDraggedCategory()
  if not VirtualDrag or not VirtualDrag.Category then
    return;
  end

  local Replaced, ListIndex;
  for Category, ParentCat in ipairs(VirtualDrag.Origin.Data) do
    ListIndex = 1;
    while ParentCat[ListIndex] do
      if ParentCat[ListIndex].Category then
        if (ParentCat[ListIndex].Category == VirtualDrag.Category) then
          tremove(ParentCat, ListIndex);
          ListIndex = ListIndex - 1;

          --Now replace the deleted category with its contents
          if not Replaced then
            Replaced = true;
            for Key, Value in ipairs(VirtualDrag.Origin.Data[VirtualDrag.Category]) do
              --Make sure the copied entries are skipped, or categories could be decremented twice
              ListIndex = ListIndex + 1;
              tinsert(ParentCat, ListIndex, Value);
            end
          end
        elseif (ParentCat[ListIndex].Category > VirtualDrag.Category) then
          ParentCat[ListIndex].Category = ParentCat[ListIndex].Category - 1;
        end
      end
      ListIndex = ListIndex + 1;
    end
  end

  if (VirtualDrag.Origin:GetID() == 1) then
    for Quality, Value in pairs(PlayerData.PutQuality) do
      if (Value == VirtualDrag.Category) then
        PlayerData.PutQuality[Quality] = 1;
      elseif (Value > VirtualDrag.Category) then
        PlayerData.PutQuality[Quality] = Value - 1;
      end
    end
    if (PlayerData.AutoSell == VirtualDrag.Category) then
      PlayerData.AutoSell = 1;
    elseif (PlayerData.AutoSell > VirtualDrag.Category) then
      PlayerData.AutoSell = PlayerData.AutoSell - 1;
    end
  end

  tremove(VirtualDrag.Origin.Data, VirtualDrag.Category);
  BaudManifestUpdateDisplayList(VirtualDrag.Origin);
  BaudManifestClearVirtualDrag();
end

---------------------------------
-- BaudManifestCategoriesDisabled
---------------------------------

function BaudManifestCategoriesDisabled(Display)
  return (Display.Sort ~= 1) or (Display.Filter ~= 1) or strfind(Display.CustomFilter or "", "%S");
end

-------------------------
-- BaudManifestCategorize
-------------------------

-- TODO: battle pet issues?
function BaudManifestCategorize(Display)
  local Type, SubType, Category, New;
  local Index = 1;
  while (Display.Data[1][Index]) do
    if Display.Data[1][Index].ItemString then
      _, _, _, _, _, Type, SubType = GetItemInfo(Display.Data[1][Index].ItemString);
      if not Type then
        Index = Index + 1;
      else
        Category, New = BaudManifestGetCategory(nil, Display, Type, 1);
        if New then
          Index = Index + 1;
        end
        tinsert(Display.Data[Category], tremove(Display.Data[1], Index));
      end
    else
      Index = Index + 1;
    end
  end
  BaudManifestUpdateDisplayList(Display);
end

--------------------------
-- BaudManifestGetCategory
--------------------------

--First argument is the only one required
function BaudManifestGetCategory(self, Display, Name, ParentCategory)
  if BaudManifestCategoriesDisabled(Display) then
    UIErrorsFrame:AddMessage("Cannot create categories while the list is sorted or filtered.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  end

  if ParentCategory then
    for Key, Value in ipairs(Display.Data[ParentCategory]) do
      if Value.Category and (Display.Data[Value.Category].Name == Name) then
        return Value.Category;
      end
    end
  end

  if not Name then
    Name = "New Category";
  end

  tinsert(Display.Data, {Name=Name, Expanded=false});
  local Category = #Display.Data;
  tinsert(Display.Data[(ParentCategory or 1)], 1, {Category = Category});
  FauxScrollFrame_SetOffset(_G[Display:GetName() .. "ScrollBar"], 0);
  if not ParentCategory then
    BaudManifestUpdateDisplayList(Display);
  end
  return Category, true;
end

----------------------------
-- BaudManifestUpdateBlocked
----------------------------

function BaudManifestUpdateBlocked()
  --Enabling and disabling item entries to serve this purpose would prevent items from being dropped by releasing the cursor.
  local Enable = CursorItem or VirtualDrag;
  for Key, Value in ipairs(ClickBlocks) do
    if Enable then
      Value:Show();
    else
      Value:Hide();
    end
  end
end

---------------------------
-- PickupContainerItem hook
---------------------------

hooksecurefunc("PickupContainerItem", function(Bag,Slot)
  if IgnoreHooks or not CursorHasItem() then
    return;
  end

  DragItem = GetContainerItemLink(Bag, Slot);
  if (DragItem ~= select(3, GetCursorInfo())) then
    DragItem = nil;
    return;
  end

  if not DragItem then
    return;
  end

  DragItem = GetItemString(DragItem);

  --DebugMsg("Item pickup from " .. Bag .. ", " .. Slot .. ": " .. DragItem);

  DragItem = {
    String = DragItem,
    Stack = select(2, GetContainerItemInfo(Bag, Slot)),
    Origin = Displays[Bag == -3 and 3 or ((Bag == -1) or (Bag > 4)) and 2 or 1],
    Bag = Bag,
    Slot = Slot,
    IsBag = Bag and (Bag > 0) and CursorCanGoInSlot(InvBagsOffset + 1) and ContainerIDToInventoryID(Bag),
  };

  BaudManifestShowDragCount();
end);

--------------------
-- PutItemInBag hook
--------------------

--This hook is to correct the problem of not being able to equip a bag when it is inside the bag it is trying to replace.
--As a solution, BaudManifest will move the bag to another place in your inventory, and try to equip it again.
hooksecurefunc("PutItemInBag", function(InvID)
  if CursorHasItem() or not DragItem or not DragItem.IsBag or (InvID ~= DragItem.IsBag) then
    return;
  end

  if select(3, GetContainerItemInfo(DragItem.Bag, DragItem.Slot)) then
    return;
  end

  IgnoreHooks = true;
  PickupContainerItem(DragItem.Bag, DragItem.Slot);
  IgnoreHooks = nil;

  if not BaudManifestPutItem(DragItem.Origin, DragItem.Bag) then
    return;
  end

  --New location for bag should be updated by BaudManifestPutItem
  DragItem.EquipBag = true;
  DragPending = DragItem;
  DragItem = nil;
end);

-------------------------
-- PickupBagFromSlot hook
-------------------------

hooksecurefunc("PickupBagFromSlot", function(Slot)
  if IgnoreHooks or not CursorHasItem() then
    return;
  end

  local Bag;
  if (Slot > InvBagsOffset) and (Slot <= InvBagsOffset + 4) then
    Bag = Slot - InvBagsOffset;
  elseif (Slot > BankBagsOffset) and (Slot <= BankBagsOffset + NUM_BANKBAGSLOTS) then
    Bag = Slot - BankBagsOffset + 4;
  else
    return;
  end

  DragItem = GetInventoryItemLink("player", Slot);
  if (DragItem ~= select(3, GetCursorInfo())) then
    DragItem = nil;
    return;
  end
  
  if not DragItem then
    return;
  end

  DragItem = GetItemString(DragItem);

  DragItem = {String = DragItem, MoveBag = Bag, Origin = Displays[Bag == -3 and 3 or ((Bag == -1) or (Bag > 4)) and 2 or 1]};
  --DebugMsg("Bag pickup from "..Bag);
end);

------------------------
-- DeleteCursorItem hook
------------------------

--Used for deleting multiple items at once.  Use caution!
hooksecurefunc("DeleteCursorItem", function()
  if IgnoreHooks then
    return;
  end

  BaudManifestPickupDragRemain(function()
    --This check is used as a failsafe
    local Type, _, Link = GetCursorInfo();
    if (Type ~= "item") then
      return;
    end

    LinkString = GetItemString(Link);

    if (DragItem.String ~= LinkString) then
      DEFAULT_CHAT_FRAME:AddMessage("Baud Manifest: Item match failure.", 1, 0.1, 0.1);
      return;
    end

    IgnoreHooks = true;
    DeleteCursorItem();
    IgnoreHooks = false;
    return true;
  end, true);
end);

------------------------
-- PickupMerchantItem hook
------------------------

--This function is used when dragging items onto the vendor window.  The values passed to it don't matter in this case.
hooksecurefunc("PickupMerchantItem", function()
  if IgnoreHooks or not VendorOpen then
    return;
  end

  BaudManifestPickupDragRemain(function()
    if VendorOpen then
      IgnoreHooks = true;
      PickupMerchantItem();
      IgnoreHooks = false;
      return true;
    end
    return false;
  end, true);
end);

--------------------------
-- BaudManifestTradeRemain
--------------------------

function BaudManifestTradeRemain()
  if TradeOpen then
    IgnoreHooks = true;
    DropItemOnUnit("NPC");
    IgnoreHooks = false;
    return true;
  end
  return false;
end

------------------------
-- BaudManifestDragCount_OnUpdate
------------------------

function BaudManifestDragCount_OnUpdate(self)
  local X, Y = GetCursorPosition();
  self:ClearAllPoints();
  self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", X - 5, Y - 27);
end

-----------------------------------
-- BaudManifestVirtualDrag_OnUpdate
-----------------------------------

function BaudManifestVirtualDrag_OnUpdate(self)
  --Dragged categories will not be cleared for stuff that is dragged and immediately placed, but if anything is in the cursor
  --for an update, then the category is dropped.
  if GetCursorInfo() then
    BaudManifestClearVirtualDrag();
    return;
  end
  self:ClearAllPoints();
  self:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMLEFT", GetCursorPosition());
end

--------------------------------------------
-- BaudManifestVirtualDragClickBlock_OnClick
--------------------------------------------

function BaudManifestVirtualDragClickBlock_OnClick(Button)
  if (Button == "RightButton") or not VirtualDrag.Category then
    BaudManifestClearVirtualDrag();
  else
    StaticPopup_Show("BAUDMANIFEST_DELETECATEGORY");
  end
end

----------------------------
-- BaudManifestShowDragCount
----------------------------

-- TODO: Battle pet issues?
function BaudManifestShowDragCount()
  local Count = DragItem.Stack;
  if DragItem.Remain then
    Count = Count + DragItem.Remain;
  end

  if not CursorHasItem() or (Count == 1) and (select(8, GetItemInfo(DragItem.String)) == 1) then
    return;
  end

  BaudManifestDragCountText:SetText(Count);
  BaudManifestDragCount:Show();
end

----------------------------
-- QueuedUpdateFrame:OnUpdate
----------------------------

QueuedUpdateFrame:SetScript("OnUpdate", function(self)
  self:Hide();
  for Display = 1, 3 do
    if QueuedUpdate[Display] then
      if DragPending and (DragPending.Origin:GetID() == Display) and DragPending.Ready then
        if CursorHasItem() then
          DragPending = nil;
        else
          --DebugMsg("Pending status finished.");
          DragItem = DragPending;
          DragPending = nil;
          DragItem.Ready = nil;
          if DragItem.MoveBag then
            --There may still be locked items in the process of being moved out of the bag.  Emptying will be repeated until
            --the bag is empty.
            BaudManifestEmptyBag(DragItem.Origin, DragItem.MoveBag, true);
          elseif DragItem.EquipBag then
            --Used for equipping bags in place of the bag that contains them
            local DestString = GetItemString(GetContainerItemLink(DragItem.Bag, DragItem.Slot) or "");
            if (DestString == DragItem.String) then
              IgnoreHooks = true;
              PickupContainerItem(DragItem.Bag, DragItem.Slot);
              IgnoreHooks = nil;
              PutItemInBag(DragItem.IsBag);
            end
          else
            --if the split item is picked up immediately, the client will not register that it is locked
            BaudManifestPickupDragRemain();
          end
        end
      end
      QueuedUpdate[Display] = false;
      BaudManifestUpdateList(Displays[Display]);
    end
  end
end);

----------------------------
-- ClearCursorFrame:OnUpdate
----------------------------

ClearCursorFrame:SetScript("OnUpdate", function(self)
  self:Hide();
  if DragItem and not CursorItem then
    DragItem = nil;
    BaudManifestDropLine:Hide();
  end
end);

----------------------------
-- CursorHoverFrame:OnUpdate
----------------------------

CursorHoverFrame:SetScript("OnUpdate", function(self)
  if (DragItem and (CursorHover == DragItem.Origin) and not DragItem.MoveBag or VirtualDrag and (CursorHover == VirtualDrag.Origin)) then
    local Position, Indent, _, Index = BaudManifestGetCursorPos(CursorHover);
    local ScrollBar = _G[CursorHover:GetName() .. "ScrollBar"];
    BaudManifestDropLine:SetParent(CursorHover);
    BaudManifestDropLine:ClearAllPoints();
    local Y = 16 * (1 - Position);
    BaudManifestDropLine:SetPoint("TOP", ScrollBar, "TOP", 0, Y + 1);
    BaudManifestDropLine:SetPoint("LEFT", ScrollBar, "LEFT", Indent * IndentSize, 0);
    BaudManifestDropLine:SetPoint("RIGHT", ScrollBar);
    if not Index then
      BaudManifestDropLine:SetPoint("BOTTOM", ScrollBar, "TOP", 0, Y - 16);
    end
    BaudManifestDropLine:SetFrameLevel(ScrollBar:GetFrameLevel() + 3);
    BaudManifestDropLine:Show();
  end
end);

--------------------------
-- BaudManifestForEachSlot
--------------------------

function BaudManifestForEachSlot(Display, SlotFunc, BagFunc)
  local function RunBagFunc(Bag, Total)
    if (Total <= 0) or BagFunc and BagFunc(Bag) or not SlotFunc then
      return;
    end
    for Slot = 1, Total do
      if SlotFunc(Bag, Slot) then
        return true;
      end
    end
  end

  if (Display:GetID() == 1) then
    for Bag = 0, 4 do
      if RunBagFunc(Bag, GetContainerNumSlots(Bag)) then
        return true;
      end
    end

    --Equipped items
    if not BagFunc or not BagFunc(nil) then
      for Slot = 1, 19 do
        if SlotFunc(nil, Slot) then
          return true;
        end
      end

      for Slot = InvBagsOffset + 1, InvBagsOffset + 4 do
        if SlotFunc(nil, Slot) then
          return true;
        end
      end
    end
  elseif (Display:GetID() == 2) then
    if RunBagFunc(-1, NUM_BANKGENERIC_SLOTS) then
      return true;
    end

    for Bag = 5, 4 + NUM_BANKBAGSLOTS do
      if RunBagFunc(Bag, GetContainerNumSlots(Bag)) then
        return true;
      end
    end

    if not BagFunc or not BagFunc(nil) then
      for Slot = BankBagsOffset + 1, BankBagsOffset + NUM_BANKBAGSLOTS do
        if SlotFunc(nil, Slot) then
          return true;
        end
      end
    end
  else
    if RunBagFunc(-3, 98) then
      return true;
    end
  end
  return false;
end

-----------------
-- AnchorDropdown
-----------------

--Used to anchor Blizzard's drop down menus so they resize themselves.
local function AnchorDropdown(DropDown)
  _G[DropDown:GetName() .. "Middle"]:SetPoint("RIGHT", -25, 0);
  _G[DropDown:GetName() .. "Text"]:SetPoint("LEFT", DropDown:GetName() .. "Left", "RIGHT", 7, 0);
  DropDown.noResize = 1;
end

-----------------------------
-- BaudManifestDisplay_OnLoad
-----------------------------

function BaudManifestDisplay_OnLoad(self)
  local Name = self:GetName();
  local ID = self:GetID();
  Displays[ID] = self;
  self.RefreshFrame = CreateFrame("Frame", nil, self);
  self.RefreshFrame:SetScript("OnUpdate", BaudManifestRefreshUpdate);
  self.FadeFrame = CreateFrame("Frame", nil, self);
  self.FadeFrame:SetScript("OnUpdate", BaudManifestFadeUpdate);
  self.FadeFrame:Hide();
  self.FilterEdit = _G[Name .. "FilterEditBox"];
  self.List = {};
  self.CustomFilter = nil;
  self.MaxEntries = 0;
  self.Entry = {};
  self.ScrollBar = _G[Name .. "ScrollBar"];
  self.ScrollBar.Scroll = _G[Name .. "ScrollBarScrollBar"];
  self.Text = _G[Name .. "Text"];
  self.NoEntries = _G[Name .. "NoEntries"];
  self.NoEntries:SetPoint("CENTER", Name .. "ScrollBar");
  self.UpArrow = _G[Name .. "ScrollBarUpArrow"];
  self.DownArrow = _G[Name .. "ScrollBarDownArrow"];
  self.FilterDrop = _G[Name .. "FilterDropDown"];
  self.SortDrop = _G[Name .. "SortDropDown"];
  self.Reset = _G[Name .. "ResetButton"];
  self.Resize = _G[Name .. "Resize"];

  local DropDown = _G[Name .. "SortDropDown"];
  AnchorDropdown(DropDown);
  BaudManifestSortDropDown_Set(DropDown, 1);

  DropDown = _G[Name .. "FilterDropDown"];
  AnchorDropdown(DropDown);
  BaudManifestFilterDropDown_Set(DropDown, 1);

  BaudManifestResetButton_Update(self);

  local Frame = _G[Name .. "ClickBlock"];
  Frame:SetFrameLevel(self:GetFrameLevel() + 4);
  tinsert(ClickBlocks, Frame);

  --Can't be done in XML because the text must be made before the anchor frame is
  self.Text:SetPoint("RIGHT", Name .. "OptionsButton", "LEFT");

  local Divider = _G[Name .. "Divider"];
  Divider:SetTexCoord(0, 1, 0.125, 1, 0, 0, 0.125, 0);
  Divider:SetVertexColor(0.5, 0.5, 0.5);

  BaudManifestDisplay_OnSizeChanged(self);

  if (ID % 3 == 1) then
    --Remove the gap on displays with no money frame on the bottom
    self.FilterEdit:SetPoint("BOTTOM", 0, 26);
  end

  if (ID <= 3) then
    --UIChildWindows causes the window to close when opening mail, etc.
    tinsert(UISpecialFrames, Name);
    self:RegisterForDrag("LeftButton");
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
    self.ClearZero = CreateFrame("Frame", nil, self);
    self.ClearZero:SetScript("OnUpdate", BaudManifestClearZeroUpdate);
  else
    self.Text:SetPoint("TOPLEFT", 10, -10);
    _G[Name .. "CloseButton"]:Hide();
    _G[Name .. "OptionsButton"]:SetPoint("TOPRIGHT", -5, -5);
    return;
  end

  self.Text:SetPoint("TOPLEFT", 28, -10);

  local Button, Frame, Texture, BagSlot, Text, Inherit;
  local BagFrame;
  if (ID ~= 3) then
    self.BagsButton = CreateFrame("CheckButton", Name .. "BagsButton", self, "BaudManifestBagsButtonTemplate");
    self.BagsButton:SetPoint("TOPLEFT", 5, -5);

    BagFrame = CreateFrame("Button", Name .. "BagsFrame", self, "BackdropTemplate");
    self.BagsFrame = BagFrame;
    BagFrame:SetPoint("TOPRIGHT", self, "TOPLEFT");
  end

  local Edge = 10;
  if (ID == 1) then
    Button = CreateFrame("ItemButton", BagFrame:GetName() .. "BackpackButton", BagFrame);
    Button:SetPoint("TOP", 0, -Edge);
    Button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
    _G[Button:GetName() .. "IconTexture"]:SetTexture("Interface\\Buttons\\Button-Backpack-Up");
    Inherit = MainMenuBarBackpackButton;
    Button:SetScript("OnClick", Inherit:GetScript("OnClick"));
    Button:SetScript("OnReceiveDrag", Inherit:GetScript("OnReceiveDrag"));
    Button:SetScript("OnEnter", Inherit:GetScript("OnEnter"));
    Button:SetScript("OnLeave", Inherit:GetScript("OnLeave"));

    for Bag = 1, 4 do
      --Bag name length is restricted.  for this one, the ID is set automatically.
      BagSlot = CreateFrame("ItemButton", "BaudMInveBag" .. (Bag - 1) .. "Slot", BagFrame, "BagSlotButtonTemplate");
      BagSlot:SetPoint("TOP", 0, -Edge - 42 - (Bag - 1) * 32);
    end

    BagFrame:SetWidth(Edge * 2 - 3 + 39);
    BagFrame:SetHeight(Edge * 2 + 39 + 4 * 32);
  elseif (ID == 2) then
    for Bag = 1, NUM_BANKBAGSLOTS do
      --Bag name length is restricted
      BagSlot = CreateFrame("ItemButton", "BaudMBankBag" .. Bag, BagFrame, "BankItemButtonBagTemplate");
      BankBags[Bag] = BagSlot;
      BagSlot:SetID(Bag);
      BagSlot:SetPoint("TOPLEFT", Edge + ((Bag - 1) % 2) * 39, -Edge - floor((Bag - 1) / 2) * 39);
      Frame = "BankSlotsFrameBag" .. Bag .. "HighlightFrameTexture";
      HookData[Frame] = _G[BankBags[Bag]:GetName() .. "HighlightFrameTexture"];
      hooksecurefunc(_G["BankSlotsFrame"]["Bag"..Bag], "Show", function(self) HookData["BankSlotsFrame"..self:GetName()]:Show(); end);
      hooksecurefunc(_G["BankSlotsFrame"]["Bag"..Bag], "Hide", function(self) HookData["BankSlotsFrame"..self:GetName()]:Hide(); end);
    end

    local Button = CreateFrame("Button", "BaudManifestBankSlotPurchaseButton", BagFrame, "UIPanelButtonTemplate");
    Button:SetHeight(21);
    Button:SetPoint("BOTTOMLEFT", 7, 7);
    Button:SetPoint("RIGHT", -7, 0);
    Button:SetText(BANKSLOTPURCHASE);
    Button:SetScript("OnClick", function()
      PlaySound(SOUNDKIT.IG_MAINMENU_OPTION);
      StaticPopup_Show("CONFIRM_BUY_BANK_SLOT");
    end);
    Button:Disable();

    Text = Button:CreateFontString(Button:GetName() .. "CostText", "BACKGROUND", "GameFontHighlight");
    Text:SetText("Slot:");
    Text:SetPoint("BOTTOMLEFT", Button, "TOPLEFT", 10, 2);

    Frame = CreateFrame("Frame", Button:GetName() .. "MoneyFrame", Button, "SmallMoneyFrameTemplate");
    Frame:SetPoint("BOTTOMLEFT", Button, "TOPLEFT", 40, 3);
    MoneyFrame_SetType(Frame, "STATIC");
    Frame:Show();
    BagFrame:SetWidth(Edge * 2 - 3 + 2 * 39);
    --Height changes depending if there is a purchase button
    BagFrame.Height = Edge * 2 - 3 + ceil(NUM_BANKBAGSLOTS / 2) * 39;
  end
end

-----------------------------
-- BaudManifestOptionsDropDown_OnLoad
-----------------------------

function BaudManifestOptionsDropDown_OnLoad(self)
  UIDropDownMenu_Initialize(self, BaudManifestOptionsDropDown_Initialize, "MENU");
end

-----------------------------
-- BaudManifestFadeUpdate
-----------------------------

local Display, Alpha;
function BaudManifestFadeUpdate(self)
  Display = self:GetParent();
  Alpha = (GetTime() - Display.FadeStart) / FadeTime;
  if Display.Closing then
    Alpha = 1 - Alpha;
    if (Alpha < 0) then
      Display.FadeStart = nil;
      Display:Hide();
      Display.Closing = nil;
      self:Hide();
      return;
    end
  elseif (Alpha > 1) then
    Display:SetAlpha(1);
    Display.FadeStart = nil;
    self:Hide();
    return;
  end
  Display:SetAlpha(Alpha);
end

-----------------------------
-- BaudManifestRefreshUpdate
-----------------------------

function BaudManifestRefreshUpdate(self)
  if (self:GetParent().Refresh > GetTime()) then
    return;
  end

  self:Hide();
  local Display = self:GetParent();
  if Display.UpdateList then
    BaudManifestUpdateDisplayList(Display);
  else
    BaudManifestScrollBar_Update(Display);
  end
end

-----------------------------
-- BaudManifestClearZeroUpdate
-----------------------------

function BaudManifestClearZeroUpdate(self)
  local Display = self:GetParent();
  local Scale = Display:GetEffectiveScale();
  local X, Y = GetCursorPosition();
  X, Y = X / Scale, Y / Scale;
  if (X < Display:GetLeft()) or (X > Display:GetRight()) or (Y < Display:GetBottom() or (Y > Display:GetTop())) then
    BaudManifestClearZeros(Display);
    BaudManifestUpdateDisplayList(Display);
    self:Hide();
  end
end

-------------------------
-- BaudManifestClearZeros
-------------------------

-- TODO: battle pet issues?
function BaudManifestClearZeros(Display)
  if (Display:GetID() > 3) then
    return;
  end

  Display.ClearZero:Hide();
  local Index, Delete;
  for Category, Value in ipairs(Display.Data) do
    Index = 1;
    while (Value[Index]) do
      if Value[Index].ItemString and not Value[Index].Count and not Value[Index].Properties then
        if (Category == 1) or (Display:GetID() == 1) and (PlayerData.PutQuality[select(3, GetItemInfo(Value[Index].ItemString)) or -1] == Category) then
          Display.Hash[CleanItemString(tremove(Value, Index).ItemString)] = nil;
          Index = Index - 1;
        elseif Value[Index].Show then
          Value[Index].Show = nil;
        end
      end
      Index = Index + 1;
    end
  end
end

-----------------------------
-- BaudManifestDisplay_OnShow
-----------------------------

function BaudManifestDisplay_OnShow(self)
  if self.Shown then
    return;
  end

  self.Shown = true;

  if self.FadeStart then
    return;
  end

  if (Config.Fading ~= false) then
    self.FadeStart = GetTime();
    self.FadeFrame:Show();
  else
    self:SetAlpha(1);
  end

  self.Closing = false;
  PlaySound(SOUNDKIT.IG_BACKPACK_OPEN);
  local Level = self:GetFrameLevel() + 1;
  local Entry;
  for Index = 1, #self.Entry do
    Entry = self.Entry[Index];
    Entry:SetFrameLevel(Level);
    _G[Entry:GetName() .. "BlizItem"]:SetFrameLevel(Level + 1);
    _G[Entry:GetName() .. "BlizInv"]:SetFrameLevel(Level + 1);
  end

  BaudManifestClearZeros(self);
  BaudManifestUpdateDisplayList(self);
  BaudManifestDisplay_OnSizeChanged(self);

  if (self:GetID() <= 3) then
    local Point;
    local OX, OY = 0, 0;
    if (self:GetTop() * self:GetScale() > UIParent:GetTop()) then
      Point = "TOP";
    else
      Point = "BOTTOM";
      OY = max(self:GetBottom(), 0);
    end
    if (self:GetRight() * self:GetScale() > UIParent:GetRight()) then
      Point = Point .. "RIGHT";
    else
      Point = Point .. "LEFT";
      OX = max(self:GetLeft(), 0);
    end
    self:ClearAllPoints();
    self:SetPoint(Point, OX, OY);
  end
end

-----------------------------
-- BaudManifestDisplay_OnHide
-----------------------------

function BaudManifestDisplay_OnHide(self)
  if self:IsShown() then
    return;
  end

  self.Shown = nil;
  if self.Closing then
    if self.FadeStart then
      self:Show();
    end
    return;
  end

  if (Config.Fading ~= false) then
    self.FadeStart = GetTime();
    self.FadeFrame:Show();
    self.Closing = true;
    self:Show();
  end

  PlaySound(SOUNDKIT.IG_BACKPACK_CLOSE);
  if (self:GetID() == 2) and BankOpen and (Config.ShowBank ~= false) then
    BaudManifestDisplay3:Hide();
    CloseBankFrame();
  end
  self.AutoShown = nil;

end

------------------------------------
-- BaudManifestDisplay_OnSizeChanged
------------------------------------

function BaudManifestDisplay_OnSizeChanged(Display)
  local ScrollBar = Display.ScrollBar;
  local Entries = floor(ScrollBar:GetHeight() / 16);
  if (Entries == Display.Entries) then
    return;
  end

  Display.Entries = Entries;
  local Button, Name;
  if (#Display.Entry < Entries) then
    for Index = #Display.Entry + 1, Entries do
      Name = Display:GetName() .. "Entry" .. Index;
      Button = CreateFrame("Button", Name, Display, "BaudManifestItemEntryTemplate");
      Display.Entry[Index] = Button;
      Button:ClearAllPoints();
      Button:SetPoint("TOP", ScrollBar, "TOP", 0, 16 * (1 - Index));
      Button:SetPoint("LEFT", ScrollBar);
      Button:SetPoint("RIGHT", ScrollBar);
      Button.Display = Display;
      Button.Text = _G[Name .. "Text"];
      Button.Text:SetWordWrap(false);
      Button.BlizItem = _G[Name .. "BlizItem"];
      Button.BlizItem.NewItemTexture:Hide();
      Button.BlizItem.BattlepayItemTexture:Hide();
      Button.BlizInv = _G[Name .. "BlizInv"];
      Button.BlizInv.ignoreTexture:Hide();
      Button.BlizInv.AvailableTraitFrame:SetShown(false);
      Button.BlizInv.RankFrame:SetShown(false);
      Button.Icon = _G[Name .. "Texture"];
      --Showing the texture affects the text positioning for some reason, and cannot be done in OnLoad
      Button.Icon:Show();
      Button.Cooldown = _G[Name .. "Cooldown"];
    end
  else
    for Index = (Entries + 1), #Display.Entry do
      Display.Entry[Index]:Hide();
    end
  end
  Display.DownArrow:ClearAllPoints();
  Display.DownArrow:SetPoint("BOTTOM", Display.Entry[Display.Entries], "BOTTOM", 0, 1.6);
  BaudManifestScrollBar_Update(Display)
end

-----------------------------
-- BaudManifestDisplay_OnClick
-----------------------------

function BaudManifestDisplay_OnClick(Display, Button)
  ClearFocus:SetFocus();
  if (Button == "RightButton") then
    BaudManifestClearVirtualDrag();
  else
    BaudManifestDropItem(Display);
  end
end

-----------------------------
-- BaudManifestDisplay_OnDragStart
-----------------------------

function BaudManifestDisplay_OnDragStart(Display)
  if Display:IsMovable() then
    Display:StartMoving();
  else
    Display:GetParent():GetParent():StartMoving();
  end
end

-----------------------------
-- BaudManifestDisplay_OnDragStop
-----------------------------

function BaudManifestDisplay_OnDragStop(Display)
  if Display:IsMovable() then
    Display:StopMovingOrSizing();
  else
    Display:GetParent():GetParent():StopMovingOrSizing();
    Display:GetParent():GetParent():SetUserPlaced(false);
  end
end

-----------------------------
-- BaudManifestDisplay_OnEnter
-----------------------------

function BaudManifestDisplay_OnEnter(Display)
  CursorHover = Display;
  CursorHoverFrame:Show();
end

-----------------------------
-- BaudManifestDisplay_OnLeave
-----------------------------

function BaudManifestDisplay_OnLeave()
  BaudManifestDropLine:Hide();
  CursorHover = nil;
  CursorHoverFrame:Hide();
end

---------------
-- ResizeCursor
---------------

local ResizeCursor = CreateFrame("Frame", nil, UIParent);
ResizeCursor:Hide();
ResizeCursor:SetWidth(24);
ResizeCursor:SetHeight(24);
ResizeCursor:SetFrameStrata("TOOLTIP");
ResizeCursor.Texture = ResizeCursor:CreateTexture();
ResizeCursor.Texture:SetAllPoints();
local X, Y, Scale;
ResizeCursor:SetScript("OnUpdate", function(self)
  X, Y = GetCursorPosition();
  Scale = self:GetEffectiveScale();
  self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", X / Scale, Y / Scale);
end);

function BaudManifestResize_OnLoad(self)
  self.Name = strupper(strsub(self:GetName(), strlen(self:GetParent():GetName()) + 1));
  self.Cursor = "Interface\\AddOns\\BaudManifest\\Resize\\" .. ResizeCursors[self.Name] .. ".tga";
  self:SetScript("OnEnter", BaudManifestResize_OnEnter);
  self:SetScript("OnLeave", BaudManifestResize_OnLeave);
  self:SetScript("OnMouseDown", BaudManifestResize);
  self:SetScript("OnMouseUp", BaudManifestStopResize);
end

function BaudManifestResize_OnEnter(self)
  if not GetCursorInfo() and not VirtualDrag then
    ResizeCursor:Show();
    ResizeCursor.Texture:SetTexture(self.Cursor);
  end
end

function BaudManifestResize_OnLeave(self)
  ResizeCursor:Hide();
end

function BaudManifestResize(self)
  ClearFocus:SetFocus();
  self:GetParent():GetParent():StartSizing(self.Name);
end

function BaudManifestStopResize(self)
  self:GetParent():GetParent():StopMovingOrSizing();
end

-------------------------------
-- BaudManifestItemEntry_OnLoad
-------------------------------

function BaudManifestItemEntry_OnLoad(self)
  self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
  self:RegisterForDrag("LeftButton");
  self.UpdateTooltip = BaudManifestItemEntry_OnEnter;
end

---------------------------
-- OpenStackSplitFrame hook
---------------------------

--Used for replacing Blizzard's call for opening the split stack frame
hooksecurefunc(StackSplitFrame, "OpenStackSplitFrame", function(self, maxStack, parent, anchor, anchorTo, stackCount)
  if (strsub(parent:GetName(), 1, 12) == "BaudManifest") and (strsub(parent:GetName(), -8) == "BlizItem") then
    StackSplitFrame:Hide()
    BaudManifestItemEntry_OnDragStart(parent:GetParent());
  end
end);

--------------------------------
-- BaudManifestItemEntry_OnClick
--------------------------------

function BaudManifestItemEntry_OnClick(self, MouseButton, down)
  local Display = self:GetParent();
  local ItemInfo = self.ItemInfo;
  ClearFocus:SetFocus();
  if ItemInfo.Category then
    if (MouseButton == "RightButton") then
      BaudManifestCategoryEditBox:Hide();
      local Text = self.Text;
      Text:Hide();
      RenamePending = true;
      --Unless the parent is set, the edit box can fall behind the frame
      BaudManifestCategoryEditBox:SetParent(self);
      BaudManifestCategoryEditBox:SetFrameLevel(self:GetFrameLevel() + 1);
      BaudManifestCategoryEditBox:SetPoint("LEFT", Text);
      BaudManifestCategoryEditBox:SetPoint("RIGHT", Text);
      BaudManifestCategoryEditBox.Display = Display;
      BaudManifestCategoryEditBox.Category = Display.Data[ItemInfo.Category];
      BaudManifestCategoryEditBox:SetText(Display.Data[ItemInfo.Category].Name);
      BaudManifestCategoryEditBox:Show();
      BaudManifestCategoryEditBox:SetFocus();
      BaudManifestCategoryEditBox:HighlightText();
    else
      Display.Data[ItemInfo.Category].Expanded = not Display.Data[ItemInfo.Category].Expanded;
      BaudManifestUpdateDisplayList(Display);
    end
    return;
  end

  -- TODO: battle pet issues?
  if (MouseButton == "LeftButton") then
    if HandleModifiedItemClick(select(2, GetItemInfo(ItemInfo.ItemString))) then
      return;
    end
    if IsModifiedClick("SPLITSTACK") then
      BaudManifestItemEntry_OnDragStart(self);
    end
  end
end

--------------------------------
-- BaudManifestItemEntry_OnEnter
--------------------------------

local ItemTooltipAppend;
function BaudManifestItemEntry_OnEnter(self, NotUpdate)
  local Display = self:GetParent();
  local ItemInfo = self.ItemInfo;
  if NotUpdate then
    BaudManifestItemHighlight:SetParent(self);
    BaudManifestItemHighlight:SetFrameLevel(self:GetFrameLevel() + 1);
    BaudManifestItemHighlight:SetAllPoints();
    if ItemInfo.ItemString then
      BaudManifestItemPropsButtonIcon:SetVertexColor(unpack(ItemInfo.Properties and Yellow or White));
      BaudManifestItemPropsButton:Show();
    else
      BaudManifestItemPropsButton:Hide();
    end
    BaudManifestItemHighlight:Show();
  end

  if not ItemInfo.ItemString then
    self.updateTooltip = nil;
    return;
  end

  if NotUpdate then
    --if this is updated repeatedly, it causes flickering
    local itemId = select(2, strsplit(":", ItemInfo.ItemString));
    CooldownFrame_Set(BaudManifestTooltipIconCooldown, GetItemCooldown(itemId));
  end

  if (self:GetCenter() < UIParent:GetCenter()) then
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
  else
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
  end

  local SkipReset;
  local HasCooldown, RepairCost, speciesID, level, breedQuality, maxHealth, power, speed, name;
  if (Display:GetID() > 2) or (Display:GetID() == 2) and not BankOpen or not ItemInfo.Slot then
    GameTooltip:SetHyperlink(ItemInfo.ItemString);
  elseif not ItemInfo.Bag then
    _, HasCooldown, RepairCost, speciesID, level, breedQuality, maxHealth, power, speed, name = GameTooltip:SetInventoryItem("player", ItemInfo.Slot);
  elseif (ItemInfo.Bag == -1) then
    _, HasCooldown, RepairCost, speciesID, level, breedQuality, maxHealth, power, speed, name = GameTooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(ItemInfo.Slot));
  else
    HasCooldown, RepairCost, speciesID, level, breedQuality, maxHealth, power, speed, name = GameTooltip:SetBagItem(ItemInfo.Bag, ItemInfo.Slot);
  end

  if (speciesID and speciesID > 0) then
    BattlePetToolTip_Show(speciesID, level, breedQuality, maxHealth, power, speed, name);
    CursorUpdate(self);
    return;
  end

  if InRepairMode() and RepairCost and (RepairCost > 0) and IsDisplayAccessable(Display) then
    GameTooltip:AddLine(REPAIR_COST, "", 1, 1, 1);
    SetTooltipMoney(GameTooltip, RepairCost);
    GameTooltip:Show();
  elseif IsControlKeyDown()then
    ShowInspectCursor();
  elseif ItemInfo.Bag and ItemInfo.Slot and MerchantFrame:IsShown() and (MerchantFrame.selectedTab == 1) and IsDisplayAccessable(Display) then
    ShowContainerSellCursor(ItemInfo.Bag, ItemInfo.Slot);
  else
    ResetCursor();
  end

  if NotUpdate then
    ItemTooltipAppend = "";
    if ItemInfo.Equipped then
      ItemTooltipAppend = "Equipped\n";
    end

    if BaudManifestCategoriesDisabled(Display) and Display.Data[self.Category].Path then
      ItemTooltipAppend = ItemTooltipAppend .. "Category: " .. Display.Data[self.Category].Path .. "\n";
    end

    if (Display.Name == AllCharText) then
      local CharList = {};
      local Count;
      local Bank;
      for Char, Value in pairs(RealmData) do
        if (Char ~= Display.Name) then
          Count, Bank = 0, 0;
          for Display, Value in ipairs(Value) do
            for Category, Value in ipairs(Value) do
              for Index, Value in ipairs(Value) do
                if (Value.ItemString == ItemInfo.ItemString) and Value.Count then
                  Count = Count + Value.Count;
                  if (Display == 2) then
                    Bank = Bank + Value.Count;
                  end
                end
              end
            end
          end

          if (Count > 0) then
            tinsert(CharList, {Name=Char, Count=Count, Bank = Bank});
          end
        end
      end

      if (#CharList > 0) then
        table.sort(CharList, function(a,b) return(a.Count > b.Count); end);
        for Key, Value in ipairs(CharList) do
          ItemTooltipAppend = ItemTooltipAppend .. Value.Name .. ": " .. Value.Count;
          if (Value.Bank > 0) then
            if (Value.Bank == Value.Count) then
              ItemTooltipAppend = ItemTooltipAppend .. " (Bank)";
            else
              ItemTooltipAppend = ItemTooltipAppend .. " (" .. Value.Bank .. " Bank)";
            end
          end
          ItemTooltipAppend = ItemTooltipAppend .. "\n";
        end
      end
    end

    if (ItemTooltipAppend == "") then
      ItemTooltipAppend = nil;
    else
      ItemTooltipAppend = strsub(ItemTooltipAppend, 1, -2);
    end
  end

  if ItemTooltipAppend then
    GameTooltip:AddLine(ItemTooltipAppend);
    GameTooltip:Show();
  end
end

--------------------------------
-- BaudManifestItemEntry_OnLeave
--------------------------------

function BaudManifestItemEntry_OnLeave()
  GameTooltip:Hide();
  if (BattlePetToolTip) then BattlePetToolTip:Hide(); end
  ResetCursor();
  if (GetMouseFocus() == BaudManifestItemPropsButton) then
    return;
  end
  BaudManifestItemHighlight:Hide();
end

--------------------------------
-- BaudManifestProperties_OnEnter
--------------------------------

function BaudManifestProperties_OnEnter(self)
  if (self:GetCenter() < UIParent:GetCenter()) then
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
  else
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
  end
  GameTooltip:AddLine("Properties");
  GameTooltip:Show();
end

--------------------------------
-- BaudManifestDisplayMoney_OnEnter
--------------------------------

function BaudManifestDisplayMoney_OnEnter(self)
  local Display = self:GetParent();
  if (Display.Name ~= AllCharText) then
    return;
  end

  local CharList = {};
  for Char, Value in pairs(RealmData) do
    if (Char ~= Display.Name) then
      tinsert(CharList, {Name=Char, Gold=floor(Value.Money / 10000)})
    end
  end
  GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
  GameTooltip:AddLine("Breakdown:", 1, 1, 1);
  table.sort(CharList, function(a, b) return(a.Gold > b.Gold); end);
  for Key, Value in ipairs(CharList) do
    GameTooltip:AddLine(Value.Name .. ": " .. Value.Gold .. " gold");
  end
  GameTooltip:Show();
end

--------------------------------
-- BaudManifestDisplayMoney_OnLeave
--------------------------------

function BaudManifestDisplayMoney_OnLeave()
  GameTooltip:Hide();
end

--------------------------------
-- BaudManifestSplitStackHandler
--------------------------------

function BaudManifestSplitStackHandler(Button, Split)
  DragItem = {String = SplitItem, Origin = SplitOrigin, Remain = Split};
  BaudManifestPickupDragRemain();
end

-------------------------------
-- BaudManifestPickupDragRemain
-------------------------------

--Quick split stops the addon from placing the item into an empty slot before moving it.  Best for selling and deleting.
function BaudManifestPickupDragRemain(MoveMethod, QuickSplit)
  if not DragItem or not DragItem.Remain then
    return;
  end

  --DebugMsg("Requested "..DragItem.String..";remain="..DragItem.Remain);

  if MoveMethod then
    if DragItem.MoveMethod then
      DragItem = nil;
      ClearCursor();
      return;
    end
    DragItem.MoveMethod = MoveMethod;
    DragItem.QuickSplit = QuickSplit;
  end

  local BestBag, BestSlot, BestCount, BestPriority, SplitBag, SplitSlot, SplitCount;
  local Link, Count, Locked, Priority, Family;
  local ItemString = DragItem.String;
  local ItemID = strmatch(DragItem.String, "item:(%d+):");
  local ItemFamily = GetItemFamily(tonumber(ItemID)) or 0;
  local Moving;

  while true do
    if CursorHasItem() then
      DragItem = nil;
      ClearCursor();
      return Moving;
    end

    if (DragItem.MoveMethod == true) and not BankOpen and not VendorOpen then
      DragItem = nil;
      ClearCursor();
      return Moving;
    end

    BestSlot, SplitCount = nil, nil;

    BaudManifestForEachSlot(DragItem.Origin, function(Bag, Slot)
      if Bag then
        Link = GetContainerItemLink(Bag, Slot);
        _, Count, Locked = GetContainerItemInfo(Bag, Slot);
      else
        Link = GetInventoryItemLink("player", Slot);
        Count = 1;
        Locked = IsInventoryItemLocked(Slot);
      end

      if Link then
        --This chooses stacks of the most appropriate size
        if not Locked and ItemsAreEquivalent(ItemString, GetItemString(Link)) then
          if not BestSlot
             or (BestCount < DragItem.Remain) and (Count > BestCount)
             or (BestCount > DragItem.Remain) and (Count >= DragItem.Remain) and (Count < BestCount) then
            BestBag, BestSlot, BestCount = Bag, Slot, Count;
          end
          if (Count < DragItem.Remain) then
            SplitBag, SplitSlot, SplitCount = Bag, Slot, Count;
          end
        end
      elseif not SplitCount and Bag then
        SplitBag, SplitSlot, SplitCount = Bag, Slot, 0;
      end
    end,

    function(Bag)
      if not Bag then
        Priority = 0;
      else
        if (Bag == -2) then
          Family = 256;
        else
          _, Family = GetContainerNumFreeSlots(Bag);
        end

        if not Family or (Family == 0) then
          Priority = 1;
        elseif (ItemFamily > 0) and (bitand(Family, ItemFamily) > 0) then
          Priority = 2;
        else
          return true;
        end
      end
    end);

    if not BestSlot then
      DragItem = nil;
      --DebugMsg("Could not find item for drag - aborting.");
      return Moving;
    end

    --if the stack size isn't larger than what's requested, the whole thing is moved
    if (BestCount <= DragItem.Remain) then
      if not BestBag then
        IgnoreHooks = true;
        PickupInventoryItem(BestSlot);
        IgnoreHooks = false;
        if (DragItem.MoveMethod == true) then
          BaudManifestPutItem(Displays[DragItem.Origin:GetID() % 3 + 1]);
        end
      elseif (DragItem.MoveMethod == true) then
        -- TODO: try to replace this with a way of selecting the destination slot, or at least distinguishing regular bank from reagent bank
        UseContainerItem(BestBag, BestSlot);  --Transfer to bank
      else
        IgnoreHooks = true;
        PickupContainerItem(BestBag, BestSlot);
        IgnoreHooks = false;
      end

      if (not BestBag or (DragItem.MoveMethod ~= true)) and not CursorHasItem() then
        --DebugMsg("Item move failed - aborting [1].");
        DragItem = nil;
        return Moving;
      end

      Moving = true;
      DragItem.Stack = BestCount;
      DragItem.Remain = DragItem.Remain - BestCount;
      --DebugMsg("Picking up stack of " .. BestCount .. " from " .. (BestBag or "n/a") .. "," .. BestSlot .. " (" .. DragItem.Remain .. " remain)");
      if (DragItem.Remain <= 0) then
        DragItem.Remain = nil;
      end
    else
      if DragItem.QuickSplit then
        SplitCount = nil;
      end
      --DebugMsg("Splitting " .. DragItem.Remain .. " from stack at " .. BestBag .. "," .. BestSlot);
      IgnoreHooks = true;
      SplitContainerItem(BestBag, BestSlot, DragItem.Remain - (SplitCount or 0));
      IgnoreHooks = false;

      if not CursorHasItem() then
        --DebugMsg("Failure to split stack.");
        DragItem = nil;
        return Moving;
      end

      Moving = true;
      if SplitCount then
        --When a stack must be split, the moving procedure will continue after the move is finished
        --DebugMsg("Placing split item at " .. SplitBag .. "," .. SplitSlot);
        IgnoreHooks = true;
        PickupContainerItem(SplitBag, SplitSlot);
        IgnoreHooks = false;
        DragPending = DragItem;
        DragItem = nil;
        return Moving;
      else
        if not DragItem.QuickSplit then
          DragItem.QuickSplit = true;
          UIErrorsFrame:AddMessage("No room to split item.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
        end

        DragItem.Stack = DragItem.Remain;
        DragItem.Remain = nil;
        if (DragItem.MoveMethod == true) then
          BaudManifestPutItem(Displays[DragItem.Origin:GetID() % 3 + 1]);
        end
      end
    end

    --if MoveMethod is set to move between displays, no item will be in the cursor unless the item cannot be moved by using it
    if (not BestBag or (DragItem.MoveMethod ~= true)) and not CursorHasItem() then
      --DebugMsg("Item move failed - aborting [2].");
      DragItem = nil;
      return Moving;
    end

    if not DragItem.MoveMethod then
      BaudManifestShowDragCount();
      return Moving;
    else
      if (DragItem.MoveMethod == true) and CursorHasItem() or
        (DragItem.MoveMethod ~= true) and not DragItem.MoveMethod() or
        not DragItem or
        not DragItem.Remain then
        DragItem = nil;
        ClearCursor();
        return Moving;
      end
    end
  end
end

-------------------------------
-- BaudManifestItemEntry_OnDragStart
-------------------------------

function BaudManifestItemEntry_OnDragStart(Button)
  ClearFocus:SetFocus();

  local Display = Button:GetParent();
  if not BaudManifestDropItem(Display) then
    return;
  end

  local ItemInfo = Button.ItemInfo;
  if ItemInfo.Category then
    VirtualDrag = {Category = ItemInfo.Category, Origin = Display};
    BaudManifestVirtualDragIcon:SetTexture("Interface\\Icons\\INV_Scroll_03");
    BaudManifestVirtualDragIcon:SetAlpha(0.6);
    ClearCursor();  --Clear any spells and such in the cursor
    --PlaySound("INTERFACESOUND_CURSORGRABOBJECT");
    PlaySound(688);
    BaudManifestVirtualDrag:Show();
    BaudManifestUpdateBlocked();
    return;
  end

  if ItemInfo.Count and (Display:GetID() <= 3) and ((Display ~= BaudManifestDisplay2 and Display ~= BaudManifestDisplay3) or BankOpen) then
    if (ItemInfo.Count > 1) and (IsShiftKeyDown() or IsAltKeyDown()) then
      SplitItem = ItemInfo.ItemString;
      SplitOrigin = Display;
      if IsShiftKeyDown() and IsControlKeyDown() then
        BaudManifestSplitStackHandler(nil, ItemInfo.Count);
      elseif IsAltKeyDown() then
        BaudManifestSplitStackHandler(nil, 1);
      else
        Button.SplitStack = BaudManifestSplitStackHandler;
        StackSplitFrame:OpenStackSplitFrame(ItemInfo.Count, Button, "BOTTOMRIGHT", "TOPRIGHT");
      end
      return;
    end

    local ItemString = ItemInfo.ItemString;
    local Smallest = IsControlKeyDown();
    local BestBag, BestSlot, BestStack, Count, Locked, Link;
    BaudManifestForEachSlot(Display,
      function(Bag, Slot)
        if Bag then
          Link = GetItemString(GetContainerItemLink(Bag, Slot));
          _, Count, Locked = GetContainerItemInfo(Bag, Slot);
        else
          Link = GetInventoryItemLink("player", Slot);
          Count = 1;
          Locked = IsInventoryItemLocked(Slot);
        end
        if ItemsAreEquivalent(Link, ItemString) and not Locked and (Bag or not BestBag) and (not BestBag or Smallest and (Count < BestStack) or not Smallest and (Count > BestStack)) then
          BestBag, BestSlot, BestStack = Bag, Slot, Count;
        end
      end
    );

    if not BestStack then
      --DebugMsg("Failed to find dragged item.");
    else
      if BestBag then
        --Drag item will automatically be set up since ignore hooks is not set
        PickupContainerItem(BestBag, BestSlot);
      else
        --Equipped items that are dragged from within the list are marked with the origin as the list so that when they are dropped,
        --they will be moved instead of placed in your inventory.  if they are dragged from the paper doll and dropped, they will
        --be unequipped.
        PickupInventoryItem(BestSlot);
        DragItem = {String = ItemString, Stack = 1, Origin = Display};
      end

      if CursorHasItem() then
        return;
      end
    end
  end

  VirtualDrag = {ItemString = ItemInfo.ItemString, Origin = Display};
  BaudManifestVirtualDragIcon:SetTexture(GetItemIcon(ItemInfo.ItemString) or "Interface\\Icons\\INV_Misc_QuestionMark");
  BaudManifestVirtualDragIcon:SetAlpha(0.6);
  ClearCursor();  --Clear any spells and such in the cursor
  --PlaySound("INTERFACESOUND_CURSORGRABOBJECT");
  PlaySound(688);
  BaudManifestVirtualDrag:Show();
  BaudManifestUpdateBlocked();
end

--------------------------
-- SplitContainerItem hook
--------------------------

hooksecurefunc("SplitContainerItem", function(Bag, Slot, Amount)
  if IgnoreHooks then
    return;
  end

  SplitHoldItem = GetItemString(GetContainerItemLink(Bag, Slot) or "");  
  SplitHoldExpire = GetTime() + 120;
end);

---------------------------
-- BaudManifestGetCursorPos
---------------------------

--This function determines where dropped items will go, as well as where the drop line appears while dragging
function BaudManifestGetCursorPos(Display)
  local ScrollBar = Display.ScrollBar;
  local Position = (select(2, GetCursorPosition()) / (Display:GetEffectiveScale()) - ScrollBar:GetTop()) / -16 + 1;
  if (Position < Display.MinEntry) then
    Position = Display.MinEntry;
  end

  if (Position > Display.MaxEntry + 1) then
    Position = Display.MaxEntry + 1;
  end

  local DisplayIndex = floor(Position) + FauxScrollFrame_GetOffset(ScrollBar);
  if (DisplayIndex >= #Display.List + 1) then
    if (Position > #Display.List + 1) then
      Position = #Display.List + 1;
    end
    return Position, 0, 1, (#Display.Data[1] + 1);
  end
  local DisplayInfo = Display.List[DisplayIndex];
  local ItemIndex = DisplayInfo.Index;
  local ItemInfo = Display.Data[DisplayInfo.Category][ItemIndex];
  local Remain = Position % 1;

  if ItemInfo.Category and (Remain > 0.25) and ((Remain < 0.75) or Display.List[DisplayIndex + 1] and Display.List[DisplayIndex + 1].Category == ItemInfo.Category) then
    return floor(Position), DisplayInfo.Indent, ItemInfo.Category;
  elseif (Remain >= 0.5) then
    ItemIndex = ItemIndex + 1;
  end
  Position = floor(Position + 0.5);
  return Position, DisplayInfo.Indent, DisplayInfo.Category, ItemIndex;
end

---------------------------
-- BaudManifestMoveListItem
---------------------------

function BaudManifestMoveListItem(Display)
  if (Display.Sort ~= 1) then
    UIErrorsFrame:AddMessage("List items cannot be arranged while the list is sorted.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  end

  local _, _, NewCategory, NewIndex = BaudManifestGetCursorPos(Display);
  --DebugMsg("Moving item to category " .. NewCategory .. ", index " .. (NewIndex or "-1"));

  --Recursive function for seeing if a category drop location is within itself
  local function FindCategory(Source)
    if (Source == NewCategory) then
      return true;
    end

    for Key, Value in ipairs(Display.Data[Source]) do
      if Value.Category and FindCategory(Value.Category) then
        return true;
      end
    end
  end

  if VirtualDrag and VirtualDrag.Category and FindCategory(VirtualDrag.Category) then
    UIErrorsFrame:AddMessage("You cannot place a category within itself.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  end

  local OldItem;

  --Executed as a function so I can break out of both loops at once
  local function GetOldItem()
    for Category, Value in ipairs(Display.Data) do
      for ItemIndex, Value in ipairs(Value) do
        if Value.ItemString and (DragItem and ItemsAreEquivalent(DragItem.String, Value.ItemString) or VirtualDrag and ItemsAreEquivalent(VirtualDrag.ItemString, Value.ItemString)) or Value.Category and VirtualDrag and (VirtualDrag.Category == Value.Category) then
          OldItem = Value;
          tremove(Display.Data[Category], ItemIndex);
          if NewIndex and (NewCategory == Category) and (NewIndex > ItemIndex) then
            NewIndex = NewIndex - 1;
          end
          return;
        end
      end
    end
  end

  GetOldItem();

  if not OldItem then
    --DebugMsg("Failed to find move item");
    return;
  end

  if NewIndex then
    tinsert(Display.Data[NewCategory], NewIndex, OldItem);
  else
    tinsert(Display.Data[NewCategory], OldItem);
  end

  if not VirtualDrag or not VirtualDrag.Category then
    -- when moving an item, check to see if it needs to be added to or
    -- removed from the autosell table
    if (NewCategory == PlayerData.AutoSell) then
      --DebugMsg("Adding " .. OldItem.ItemString);
      SetAutoSellTable(OldItem.ItemString, 1);
    else
      --DebugMsg("Removing " .. CleanItemString(OldItem.ItemString));
      SetAutoSellTable(OldItem.ItemString, nil);
    end
  end

  BaudManifestUpdateDisplayList(Display);
end

----------------------
-- BaudManifestPutItem
----------------------

--Places the item in a free slot
function BaudManifestPutItem(Display, SkipBag)
  local Type, ItemID = GetCursorInfo();
  if (Type ~= "item") then
    --DebugMsg("Cursor is not carrying an item.");
    return;
  end
  local BestBag, BestPriority, Priority, Free, Family;
  local ItemFamily = GetItemFamily(ItemID) or 0;
  BaudManifestForEachSlot(Display, nil,
    function(Bag)
      if not Bag or DragItem and (Bag == DragItem.MoveBag) or (Bag == SkipBag) then
        return true;
      end

      Free, Family = GetContainerNumFreeSlots(Bag);
      if (Free <= 0) then
        return true;
      end

      if Family and (Family > 0) then
        if (bitand(ItemFamily, Family) > 0) then
          Priority = 2;
        else
          return true;
        end
      else
        Priority = 1;
      end

      if not BestPriority or (Priority > BestPriority) then
        BestBag, BestPriority = Bag, Priority;
      end
      return true;
    end
  );

  if not BestBag then
    --DebugMsg("Failed to find empty space. Dropping item into bag to likely give an error.");
    if (Display:GetID() == 1) then
      PutItemInBackpack();
    else
      if CursorCanGoInSlot(InvBagsOffset + 1) then
        ClearCursor();
      else
        PutItemInBag(ContainerIDToInventoryID(5));
      end
    end
    return;
  end

  --DebugMsg("Dropping item in bag " .. BestBag .. ", priority " .. BestPriority);

  --PutItemInBag() can be a problem if the item being dropped happens to be a bag.
  if (BestBag == 0) then
    PutItemInBackpack();
  else
    local InvID = (BestBag > 0) and ContainerIDToInventoryID(BestBag);
    if InvID and CursorCanGoInSlot(InvBagsOffset + 1) then
      for Slot = 1, GetContainerNumSlots(BestBag) do
        PickupContainerItem(BestBag, Slot);
        if DragItem then
          DragItem.Bag, DragItem.Slot = BestBag, Slot;
        end
        if not GetContainerItemLink(BestBag, Slot) then
          break;
        end
      end
    else
      PutItemInBag(InvID);
    end
  end
  --This is needed by the PutItemInBag hook
  return true;
end

-----------------------
-- BaudManifestDropItem
-----------------------

function BaudManifestDropItem(Display)
  if not VirtualDrag and not CursorHasItem() then
    return true;
  end

  if VirtualDrag and (VirtualDrag.Origin ~= Display) then
    UIErrorsFrame:AddMessage((VirtualDrag.Category and "Categories" or "That item") .. " cannot be moved between displays.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    BaudManifestClearVirtualDrag();
    return;
  end

  if VirtualDrag or DragItem and not DragItem.MoveBag and (DragItem.Origin == Display) then
    --Dragging an item around in its own container will only move the item in the list
    BaudManifestMoveListItem(Display);
    BaudManifestClearVirtualDrag();
    ClearCursor();
    return;
  end

  if (Display:GetID() > 3) then
    UIErrorsFrame:AddMessage("Cannot put items into other char's manifests.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  elseif (Display:GetID() == 2 or Display:GetID() == 3) and not BankOpen then
    UIErrorsFrame:AddMessage("Cannot put items in the bank while the bank is closed.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  end

  if DragItem and DragItem.Origin and not DragItem.QuickSplit then
    if DragItem.MoveBag then
      --Problem if player drops the unequipped bag in a different display
      BaudManifestEmptyBag(DragItem.Origin, DragItem.MoveBag, true);
      return;
    end

    ClearCursor();
    --Moving items between the bank and inventory is done by using them
    DragItem.Remain = (DragItem.Remain or 0) + DragItem.Stack;
    BaudManifestPickupDragRemain(true);
    return;
  end

  BaudManifestPutItem(Display);
end

---------------------------
-- BaudManifestReadSpecials
---------------------------

function BaudManifestReadSpecials(Display, Skip)
  NumSpecials = 0;
  local Free, Family, Table;
  BaudManifestForEachSlot(Display, nil, function(Bag)
    if not Bag or (Bag < 1) or (Bag == Skip) or DragPending and (DragPending.MoveBag == Bag) then
      return true;
    end

    Free, Family = GetContainerNumFreeSlots(Bag);
    if Family and (Family > 0) and (Free > 0) then
      NumSpecials = NumSpecials + 1;
      Table = SpecialBags[NumSpecials];
      if not Table then
        Table = {};
        SpecialBags[NumSpecials] = Table;
      end

      Table.Family = Family;
      Table.Index = Bag;
      Table.Free = Free;
      if not LocaleContainer and (Bag > 0) then
        LocaleContainer = select(6, GetItemInfo(GetInventoryItemLink("player", ContainerIDToInventoryID(Bag))));
      end
    end
    return true;
  end);
end

-----------------
-- UpdateSlotFunc
-----------------

local AddItems = {};
local DisplayData;
local PickupBag, PickupSlot, PlaceBag, PlaceSlot;
local ItemInfo, Link, ItemString, ItemID, Count, Quality, MaxCount, Locked, Family;
local Found, InvID, NormalBag;
local CursorBusy, NoSpecial;
local Hash;
local Override = {};
local function UpdateSlotFunc(Bag, Slot)
  if Bag then
    Link = GetContainerItemLink(Bag, Slot);
    _, Count, Locked = GetContainerItemInfo(Bag, Slot);
  else
    Link = GetInventoryItemLink("player", Slot);
    Count = 1;
    Locked = IsInventoryItemLocked(Slot);
  end

  if not Link then
    return;
  end

  ItemString = GetItemString(Link);
  if not ItemString then
    DEFAULT_CHAT_FRAME:AddMessage("Cannot get ItemID from: " .. DebugPrintLink(Link));
  end

  ItemID = strmatch(ItemString, "item:(%d+):");
  if not ItemID then
    if (strmatch(ItemString, "keystone:")) then
      Keystone = true;
      ItemID = "138019";
    else
      BattlePet = true;
      ItemID = "82800";
    end
  end

  ItemID = tonumber(ItemID);
  if UseSpecial and NormalBag and not Locked and not BattlePet and not Keystone then
    Family = GetItemFamily(ItemID);
    if Family and (Family > 0) then
      for Index = 1, NumSpecials do
        if (bitand(SpecialBags[Index].Family, Family) > 0) and (SpecialBags[Index].Free > 0) and not Override[ItemID] then
          if (select(6, GetItemInfo(ItemID)) == LocaleContainer) then
            --DebugMsg("Override added for specialty bag");
            Override[ItemID] = true;
          else
            --DebugMsg("Moving item into specialized bag.");
            IgnoreHooks = true;
            PickupContainerItem(Bag, Slot);
            InvID = ContainerIDToInventoryID(SpecialBags[Index].Index);
            if CursorCanGoInSlot(InvBagsOffset + 1) then
              --DebugMsg("Cannot put item in bag since item is a bag.");
              ClearCursor();
              Override[ItemID] = true;
            else
              SpecialBags[Index].Free = SpecialBags[Index].Free - 1;
              PutItemInBag(InvID);
              DisableSpecial = GetTime() + 1;
              Locked = true;
            end
            IgnoreHooks = false;
            break;
          end
        end
      end
    end
  end

  if BattlePet or Keystone then
    MaxCount = 1;
  else
    MaxCount = select(8, GetItemInfo(ItemString));
  end

  CleanedItemString = CleanItemString(ItemString);
  ItemInfo = Hash[CleanedItemString];
  if not ItemInfo then
    ItemInfo = {ItemString = ItemString};
    Hash[CleanedItemString] = ItemInfo;
    tinsert(AddItems, ItemInfo);
  end

  if ItemInfo.Slot then
    ItemInfo.Count = ItemInfo.Count + Count;
    if not Bag then
      ItemInfo.Equipped = (ItemInfo.Equipped or 0) + 1;
    elseif ItemInfo.Bag then
      ItemInfo.Slots = (ItemInfo.Slots or 1) + 1;
    end
  else
    ItemInfo.Count = Count;
    ItemInfo.Slots = nil;
    ItemInfo.ICount = nil;
    ItemInfo.Equipped = (not Bag) and 1 or nil;
  end

  if not ItemInfo.Slot or Bag and not ItemInfo.Bag or not Locked and ItemInfo.Locked or not Locked and (Count > ItemInfo.Stack) then
    ItemInfo.Bag = Bag;
    ItemInfo.Slot = Slot;
    ItemInfo.Stack = Count;
    ItemInfo.Locked = Locked;
  end

  --MaxCount can register nil here
  if not DisableCombine and Bag and not CursorBusy and (Config.Combine ~= false) and MaxCount and (Count < MaxCount) and not Locked and (SplitHoldItem ~= ItemString) and (not DragPending or (DragPending.String ~= ItemString)) then
    if not ItemInfo.ICount then
      ItemInfo.ICount = Count;
      ItemInfo.IBag = Bag;
      ItemInfo.ISlot = Slot;
    else
      PickupBag, PickupSlot = Bag, Slot;
      PlaceBag, PlaceSlot = ItemInfo.IBag, ItemInfo.ISlot;
      --Combine two incomplete stacks by moving the larger one onto the smaller
      if (Count < ItemInfo.ICount) then
        PickupBag, PickupSlot, PlaceBag, PlaceSlot = PlaceBag, PlaceSlot, PickupBag, PickupSlot;
      end

      ItemInfo.ICount = nil;
      ClearCursor();
      --DebugMsg("Combining incomplete stacks.");
      IgnoreHooks = true;
      PickupContainerItem(PickupBag, PickupSlot);
      if CursorHasItem() then
        PickupContainerItem(PlaceBag, PlaceSlot);
        ClearCursor();
      end
      IgnoreHooks = false;
    end
  end
end

----------------
-- UpdateBagFunc
----------------

local function UpdateBagFunc(Bag)
  if Bag then
    local Free, Family = GetContainerNumFreeSlots(Bag);
    NormalBag = (Family == 0);
    if NormalBag then
      DisplayData.SlotEmpty = DisplayData.SlotEmpty + Free;
      DisplayData.SlotTotal = DisplayData.SlotTotal + GetContainerNumSlots(Bag);
    elseif (Bag > 0) then
      DisplayData.SpecialEmpty = DisplayData.SpecialEmpty + Free;
      DisplayData.SpecialTotal = DisplayData.SpecialTotal + GetContainerNumSlots(Bag);
    end
  else
    NormalBag = nil;
  end
end

-------------------------
-- BaudManifestUpdateList
-------------------------

function BaudManifestUpdateList(Display)
  if not Display.Hash then
    return;
  end

  if (Display:GetID() > 3) then
    --This should never happen, so it's a red flag if it does
    error("Attempt to update manifest of another character.");
    return;
  end

  if QueuedUpdate[Display:GetID()] then
    return;
  end

  if (Display:GetID() == 2 or Display:GetID() == 3) and not BankOpen then
    return;
  end

  if SplitHoldItem and (GetTime() > SplitHoldExpire) then
    SplitHoldItem = nil;
  end

  if DisableCombine and (GetTime() > DisableCombine) then
    DisableCombine = nil;
  end

  if DisableSpecial and (GetTime() > DisableSpecial) then
    DisableSpecial = nil;
  end

  CursorBusy = GetCursorInfo();
  BaudManifestReadSpecials(Display);
  UseSpecial = not DisableSpecial and not CursorBusy and Config.FillSpecials and(NumSpecials > 0);
  Hash = Display.Hash;

  --if the count is cleared here, an error during the update process could cause the count to not increase, and the items could be erased.
  for Category, Value in pairs(Hash) do
    Value.Slot = nil;
  end

  wipe(AddItems);

  DisplayData = Display.Data;
  DisplayData.SlotEmpty = 0;
  DisplayData.SlotTotal = 0;
  DisplayData.SpecialEmpty = 0;
  DisplayData.SpecialTotal = 0;

  BaudManifestForEachSlot(Display, UpdateSlotFunc, UpdateBagFunc);

  --Set counts of items that were not found to 0.  Safest to be done after, in case of errors occuring, causing the scan process to end prematurely.
  for Key, Item in pairs(Hash) do
    if Item.Count and not Item.Slot then
      ItemID = strmatch(Item.ItemString, "item:(%d+):") or strmatch(Item.ItemString, "battlepet:") or strmatch(Item.ItemString, "keystone:") or true; --Just to make sure this is never nil
      for Key, NewItem in ipairs(AddItems) do
        if (ItemID == strmatch(NewItem.ItemString, "item:(%d+):")
            or
            ItemID == strmatch(NewItem.ItemString, "battlepet:")
            or
            ItemID == strmatch(NewItem.ItemString, "keystone:")) then
          --To avoid having to find the item in the list, just copy the info over.  The NewItem table is discarded after.
          --if there's a marker for this item in the other display (probably bank), then it should be updated too
          local Hash2 = PlayerHash[Display:GetID() % 2 + 1];
          local CleanedItemString = CleanItemString(Item.ItemString);
          local CleanedNewItemString = CleanItemString(NewItem.ItemString);
          local Item2 = Hash2[CleanedItemString];
          if Item2 and not Item2.Count then
            Item2.ItemString = NewItem.ItemString;
            Hash2[CleanedItemString] = nil;
            Hash2[CleanedNewItemString] = Item2;
          end
          Hash[CleanedItemString] = nil;
          Hash[CleanedNewItemString] = Item;  --This value was NewItem, but needs to be changed to point to the copy
          NewItem.Properties = Item.Properties;
          wipe(Item);

          for Key, Value in pairs(NewItem) do
            Item[Key] = Value;
          end

          tremove(AddItems, Key);
          ItemID = nil;
          break;
        end
      end

      if ItemID then
        Item.Count = nil;
        Item.Equipped = nil;
        Item.Slots = nil;
        Item.Show = true;
        Display.ClearZero:Show();
      end
    end
  end

  for Key, Value in ipairs(AddItems) do
    -- I think all keystones are Epic (purple).
    Quality = select(3, GetItemInfo(Value.ItemString)) or strmatch(Value.ItemString, "battlepet:%d+:%d*:(%d+)") or 4;
    tinsert(DisplayData[(Display:GetID() == 1) and Quality and PlayerData.PutQuality[Quality] or 1], Value);

    -- when looting an item, if it gets autosorted into the autosell category, put it in the autosell table
    if (PlayerData.PutQuality[Quality] == PlayerData.AutoSell) and not GetAutoSellTable(Value.ItemString) then
      SetAutoSellTable(Value.ItemString, 1);
    end

    AddItems[Key] = nil;
  end

  if (FauxScrollFrame_GetOffset(Display.ScrollBar) + Display.Entries >= #Display.List) then
    Display.Sticky = true;
  end

  BaudManifestUpdateDisplayList(Display);
end

-----------------
-- BaudManifestCountCategorySlots
-----------------

function BaudManifestCountCategorySlots(Display)
  for Key, Value in ipairs(Display.Data) do
    Value.SlotsUsed = nil;
  end

  local Duplicates;
  local function CountCategory(Category, Path)
    Category.SlotsUsed = 0;
    Category.Path = Path;
    local Index = 1;
    while Category[Index] do
      if Category[Index].ItemString and Category[Index].Count then
        Category.SlotsUsed = Category.SlotsUsed + (Category[Index].Slots or 1);
      elseif Category[Index].Category then
        if not Display.Data[Category[Index].Category].SlotsUsed then
          Category.SlotsUsed = Category.SlotsUsed + CountCategory(Display.Data[Category[Index].Category], (Path and Path .. "\\" or "") .. Display.Data[Category[Index].Category].Name);
        else
          tremove(Category,Index);
          Index = Index - 1;
          Duplicates = true;
        end
      end
      Index = Index + 1;
    end
    return Category.SlotsUsed;
  end

  CountCategory(Display.Data[1]);
  if Duplicates then
    DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix .. "Category duplicate(s) removed.", 1, .1, .1);
  end

  local Found;
  for Category, Value in ipairs(Display.Data) do
    if not Value.SlotsUsed then
      DEFAULT_CHAT_FRAME:AddMessage("BaudManifest: Found stray category - restoring.", 1, 1, 0);
      Found = true;
      tinsert(Display.Data[1], {Category = Category});
    end
  end

  if Found then
    return BaudManifestCountCategorySlots(Display);
  end
end

-----------------
-- BaudManifestCustomFilter
-----------------

local Lines;
function BaudManifestCustomFilter(ItemString, Filter)
  if Filter and strfind(Filter,"%S") and strmatch(ItemString, "item:") then
    Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE");
    Tooltip:SetHyperlink(ItemString);
    Lines = Tooltip:NumLines();
    for Index = #TooltipLines + 1, Lines do
      TooltipLines[Index] = {_G["BaudManifestTooltipTextLeft" .. Index], _G["BaudManifestTooltipTextRight" .. Index]};
    end

    for Index = 1, Lines do
      for Index2 = 1, 2 do
        if strfind(strlower(TooltipLines[Index][Index2]:GetText() or ""), Filter, 1, true) then
          return true;
        end
      end
    end

    return false;
  end

  return true;
end

-----------
-- AddEntry
-----------

local List, Index, Table, Sort;
local function AddEntry(Key, Category, Indent)
  Index = Index + 1;
  Table = List[Index];
  if not Table then
    Table = {};
    List[Index] = Table;
  end
  Table.Index = Key;
  Table.Category = Category;
  Table.Indent = Indent;
end

-----------------
-- BaudManifestUpdateDisplayList
-----------------

function BaudManifestUpdateDisplayList(Display)
  if not Display:IsShown() then
    return;
  end

  BaudManifestCountCategorySlots(Display);
  List = Display.List;
  Index = 0;
  Display.UpdateList = nil;

  local HideCategories = BaudManifestCategoriesDisabled(Display);

  local function AddCategory(Category, Indent)
    for Key, Value in ipairs(Display.Data[Category]) do
      if Value.Category then
        if not HideCategories then
          AddEntry(Key, Category, Indent);
          if Display.Data[Value.Category].Expanded then
            AddCategory(Value.Category, Indent + 1);
          end
        else
          AddCategory(Value.Category, 0);
        end
      elseif Value.ItemString and
             (Value.Count or Value.Show or Value.Properties) and
             ((Config.HideEquipped == false) or HideCategories or (Display:GetID() > 3) or not Value.Equipped or (Value.Count > Value.Equipped)) and
             (BaudManifestCustomFilter(Value.ItemString, Display.CustomFilter) and
             ((Display.Filter == 1) or (Display.Filter == select(6, GetItemInfo(Value.ItemString))))) then
        AddEntry(Key, Category, Indent);
        if (Display.Sort ~= 1) then
          --Items that enter your backpack which the client has never seen before will not have a lot of GetItemInfo stuff, so
          --unsortable entries will not be shown
          Table.Sort = Sorts[Display.Sort].Func(Value);
        end
      end
    end
  end

  AddCategory(1, 0);

  for Key = Index + 1, #List do
    List[Key] = nil;
  end

  if (Display.Sort ~= 1) then
    for Key, Value in ipairs(List)do
      List[Key].Key = Key;
    end
    table.sort(List, function(a, b) return (a.Sort == b.Sort) and (a.Key < b.Key) or (a.Sort < b.Sort); end);
  end

  BaudManifestScrollBar_Update(Display);
end

-------------------------------------
-- BaudManifestNestedScrollBar_Update
-------------------------------------

local function BaudManifestNestedScrollBar_Update(ScrollBar)
  BaudManifestScrollBar_Update(ScrollBar:GetParent());
end

-------------------------------------
-------------------------------------

local Feedback;
function BaudManifestScrollBar_OnVerticalScroll(self, offset)
  if Feedback then
    return;
  end
  Feedback = true;
  FauxScrollFrame_OnVerticalScroll(self, offset, 16, BaudManifestNestedScrollBar_Update);
  Feedback = nil;
end

-------------------------------------
-------------------------------------

local BlankFunc = function() end
function BaudManifestScrollBar_Update(Display)
  if not Display:IsShown() or not Display.List then
    return;
  end

  if not Display.UpdateList then
    Display.RefreshFrame:Hide();
  end

  if (BaudManifestCategoryEditBox.Display == Display) then
    BaudManifestCategoryEditBox:Hide();
  end

  local Index, Name, Quality, MaxCount, Texture, R, G, B, Text;
  local Button, BlizItem, BlizInv, Cooldown, ButtonText, Icon;
  Text = Display.Text;
  Name = DisplayNames[(Display:GetID() - 1) % 3 + 1];

  if Display.Data.SlotEmpty then
    Name = Name .. " (" .. Display.Data.SlotEmpty .. "/" .. Display.Data.SlotTotal;
    if ((Display.Data.SpecialTotal or 0) > 0) then
      Name = Name .. ", " .. Display.Data.SpecialEmpty .. "/" .. Display.Data.SpecialTotal;
    end
    Name = Name .. ")";
  end

  if (Display:GetID() == 1) or (Display:GetID() == 2 or Display:GetID() == 3) and BankOpen then
    Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
  else
    Name = Name .. " - Offline";
    Text:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
  end

  Text:SetText(Name);
  local FrameName = Display:GetName();
  local ScrollBar = Display.ScrollBar;
  local Total = #Display.List;
  local Offset;
  FauxScrollFrame_Update(ScrollBar, Total, Display.Entries, 16);
  Offset = FauxScrollFrame_GetOffset(ScrollBar);
  local Access = IsDisplayAccessable(Display);

  if (Total <= 0) then
    Display.NoEntries:Show();
  else
    Display.NoEntries:Hide();
  end

  if (Offset > 0) and (Config.ShowArrows ~= false) then
    Display.UpArrow:Show();
    Display.MinEntry = 2;
  else
    Display.UpArrow:Hide();
    Display.MinEntry = 1;
  end

  if (Offset + Display.Entries + 1 <= Total) and (Config.ShowArrows ~= false) then
    Display.DownArrow:Show();
    Display.MaxEntry = Display.Entries - 1;
  else
    Display.DownArrow:Hide();
    Display.MaxEntry = Display.Entries;
  end

  local ItemInfo, ListItem;
  for Line = 1, Display.Entries do
    Index = Line + Offset;
    Button = Display.Entry[Line];
    if (Index > Total) or (Line < Display.MinEntry) or (Line > Display.MaxEntry) then
      Button:Hide();
    else
      ListItem = Display.List[Index];
      Button.ItemIndex = ListItem.Index;
      Button.Category = ListItem.Category;
      ItemInfo = Display.Data[Button.Category][Button.ItemIndex];
      Button.ItemInfo = ItemInfo;
      Button.Text:Show();
      Button:SetPoint("LEFT", ScrollBar, "LEFT", ListItem.Indent * IndentSize, 0);
      if ItemInfo.ItemString then
        Button:SetNormalTexture("");
        Button:SetPushedTexture("");
        Button:SetHighlightTexture("");
        Name, _, Quality, _, _, _, _, MaxCount, _, Texture = GetItemInfo(ItemInfo.ItemString);
        local itemId = select(2, strsplit(":", ItemInfo.ItemString));
        if strmatch(ItemInfo.ItemString, "battlepet:") then
          SpeciesID, Quality = strmatch(ItemInfo.ItemString, "battlepet:(%d+):%d*:(%d+):");
          Name, Texture = C_PetJournal.GetPetInfoBySpeciesID(tonumber(SpeciesID));
          MaxCount = 1;
          itemId = "82800";
        elseif strmatch(ItemInfo.ItemString, "keystone:") then
          local dungeonID, plusLevel = strmatch(ItemInfo.ItemString, "keystone:%d+:(%d+):(%d+)");
          --DebugMsg("Trying to interpret " .. ItemInfo.ItemString .. " -- Found DungeonID" .. dungeonID .. " at level " .. plusLevel);
          Name = "Keystone: ";
          Name = Name .. C_ChallengeMode.GetMapUIInfo(dungeonID);
          Name = Name .. "+";
          Name = Name .. plusLevel;
          itemId = "138019";
          Texture = select(10, GetItemInfo(itemId));
          MaxCount = 1;
        end

        if not Name then
          Name, Quality, MaxCount, Texture = "Unknown", 0, 1, "Interface\\Icons\\INV_Misc_QuestionMark";
          Display.Refresh = GetTime() + 1;
          Display.RefreshFrame:Show();
        end

        CooldownFrame_Set(Button.Cooldown, GetItemCooldown(itemId));

        if not Access or not ItemInfo.Slot then
          Button.BlizItem:Hide();
          Button.BlizInv:Hide();
        elseif ItemInfo.Bag then
          Button.BlizInv:Hide();
          Button:SetID(ItemInfo.Bag);
          Button.BlizItem:SetID(ItemInfo.Slot);
          Button.BlizItem:Show();
        else
          Button.BlizItem:Hide();
          Button.BlizInv:SetID(ItemInfo.Slot);
          Button.BlizInv:Show();
        end

        if ItemInfo.Properties then
          Name = Name .. " |cffff8800*|r";
        end

        if (MaxCount > 1) or (ItemInfo.Count ~= 1) or ItemInfo.Equipped then
          if ItemInfo.Equipped then
            if (ItemInfo.Equipped > 1) then
              Text = "|cffffD100" .. ItemInfo.Equipped .. "E|r";
            else
              Text = "|cffffD100E|r";
            end

            if (ItemInfo.Equipped < ItemInfo.Count) then
              Text = Text .. "+" .. (ItemInfo.Count - ItemInfo.Equipped);
            end
          else
            Text = ItemInfo.Count or 0;
          end

          if ItemInfo.Slots then
            Text = Text .. "(" .. ItemInfo.Slots .. ")";
          end

          if Config.ItemNameFirst then
            Name = Name .. " " .. Text;
          else
            Name = Text .. " " .. Name;
          end
        end

        Button.Text:SetText(Name);
        if ItemInfo.Count then
          R, G, B = GetItemQualityColor(Quality or 1);
          Button.Text:SetTextColor(R, G, B, 1);
        else
          Button.Text:SetTextColor(0.2, 0.2, 0.2, 1);
        end

        if ItemInfo.Count and (not ItemInfo.Locked or (Display:GetID() > 2)) and ((Display:GetID() ~= 2) or BankOpen) then
          Button.Icon:SetVertexColor(1, 1, 1);
        else
          Button.Icon:SetVertexColor(0.5, 0.5, 0.5);
        end

        Button.Icon:SetTexture(Texture);
        Button.Icon:Show();
        if GameTooltip:IsOwned(Button) then
          BaudManifestItemEntry_OnEnter(Button, true);
        end
        Button:Show();
      else
        Button.BlizItem:Hide();
        Button.BlizInv:Hide();
        Button.Text:SetText(Display.Data[ItemInfo.Category].Name .. " (" .. Display.Data[ItemInfo.Category].SlotsUsed .. ")");
        Button.Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
        Button.Icon:Hide();
        Button.Cooldown:Hide();
        Text = Display.Data[ItemInfo.Category].Expanded and "Minus" or "Plus";
        Button:SetNormalTexture("Interface\\Buttons\\UI-" .. Text .. "Button-Up");
        Button:SetPushedTexture("Interface\\Buttons\\UI-" .. Text .. "Button-Down");
        Button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight");
        Button:Show();
      end
    end
  end
end

-------------------------------------
-------------------------------------

local LastWheelValue;
local LastWheelTime = 0;
function BaudManifestScrollBar_OnMouseWheel(self, delta)
  --This is to eliminate the problem some mice have with the wheel "bouncing" back one notch when scrolling.  My mouse does this.
  --Additionally, this function adjusts the scroll rate from what is standardly used.
  if (LastWheelValue ~= delta) then
    LastWheelValue = delta;
    if (LastWheelTime + 0.1 > GetTime()) then
      return;
    end
  end
  LastWheelTime = GetTime();
  self.Scroll:SetValue(self.Scroll:GetValue() - 16 * 2 * delta);
end

-------------------------------------
-------------------------------------

function BaudManifestOptionsButton_OnClick(self)
  if not ColorPickerFrame:IsShown() then
    ToggleDropDownMenu(1, self:GetParent(), BaudManifestOptionsDropDown, self:GetName(), 0, 0);
  end
end

-------------------------------------
-------------------------------------

local function CategorizeByType(self, Display)
  if Display.Name and BaudManifestCategoriesDisabled(Display) then
    UIErrorsFrame:AddMessage("Cannot create categories while the list is sorted or filtered.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    return;
  end
  local Dialog = StaticPopup_Show("BAUDMANIFEST_CATEGORIZE");
  if Dialog then
    Dialog.data = Display;
  end
end

-------------------------------------
-------------------------------------

local function RemoveCharacter(self, Display)
  local Dialog = StaticPopup_Show("BAUDMANIFEST_REMOVECHAR", Display.Name);
  if Dialog then
    Dialog.data = Display.Name;
  end
end

-------------------------------------
-------------------------------------

local ColorChangeDisplay;
function BaudManifestOptionsDropDown_Initialize()
  local Display = UIDROPDOWNMENU_MENU_VALUE;
  if not Display then
    return;
  end

  local info = UIDropDownMenu_CreateInfo(); --This function no longer causes taint problems
  info.arg1 = Display;

  if (UIDROPDOWNMENU_MENU_LEVEL == 2) then
    info.func = function(self, Display, Texture)
      Display.Data.BGTexture = Texture;
      BaudManifestUpdateBGTexture(Display);
      CloseDropDownMenus();
    end

    for Key, Value in ipairs(Backgrounds) do
      info.text = Value.File or "None";
      info.arg2 = Value.File;
      info.checked = (Display.Data.BGTexture == Value.File);
      UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL);
    end
    return;
  end

  info.notCheckable = true;
  if (Display:GetID() == 1) and not BaudManifestDisplay2:IsShown() then
    info.text = "Show Bank";
    info.func = function(self) BaudManifestDisplay2:Show(); end
    UIDropDownMenu_AddButton(info);
  end

  info.text = "Create Category";
  info.func = BaudManifestGetCategory;
  UIDropDownMenu_AddButton(info);

  info.text = "Categorize By Type";
  info.func = CategorizeByType;
  UIDropDownMenu_AddButton(info);

  if Display.Resize then
    info.text = (Display.Data.LockSize and "Unl" or "L") .. "ock Size";
    info.func = function(self, Display)
      Display.Data.LockSize = not Display.Data.LockSize;
      if Display.Data.LockSize then
        Display.Resize:Hide();
      else
        Display.Resize:Show();
      end
    end
    UIDropDownMenu_AddButton(info);
  end

  ColorChangeDisplay = Display;
  info.text = "Color";
  info.checked = nil;
  info.hasColorSwatch = 1;
  info.r, info.g, info.b, info.opacity = unpack(Display.Data.BGColor);
  info.opacity = 1 - info.opacity;
  info.swatchFunc = function()
    local BGColor = ColorChangeDisplay.Data.BGColor;
    BGColor[1], BGColor[2], BGColor[3] = ColorPickerFrame:GetColorRGB();
    BaudManifestUpdateBGColor(ColorChangeDisplay);
  end
  info.func = function(self) UIDropDownMenuButton_OpenColorPicker(self); end
  info.hasOpacity = 1;
  info.opacityFunc = function()
    ColorChangeDisplay.Data.BGColor[4] = 1 - OpacitySliderFrame:GetValue();
    BaudManifestUpdateBGColor(ColorChangeDisplay);
  end
  info.cancelFunc = function(previousValues)
    ColorChangeDisplay.Data.BGColor = {previousValues.r, previousValues.g, previousValues.b, 1 - previousValues.opacity};
    BaudManifestUpdateBGColor(ColorChangeDisplay);
  end
  UIDropDownMenu_AddButton(info);

  info = UIDropDownMenu_CreateInfo();
  info.notCheckable = true;
  info.text = "Background";
  info.hasArrow = true;
  info.value = Display;
  UIDropDownMenu_AddButton(info);

  info.hasArrow = nil;
  if (Display:GetID() <= 3) then
    info.text = "Other Characters...";
    info.func = BaudManifestToggleChars;
    UIDropDownMenu_AddButton(info);
  elseif (Display.Name ~= AllCharText) then
    info.text = "Remove Character";
    info.func = RemoveCharacter;
    info.arg1 = Display;
    UIDropDownMenu_AddButton(info);
  end

  info.text = "Options...";
  info.func = function(self) InterfaceOptionsFrame_OpenToCategory("Baud Manifest"); end
  UIDropDownMenu_AddButton(info);
  
  if (Display:GetID() == 2) then
    if (not IsReagentBankUnlocked()) then
      info.text = "Buy reagent bank";
      info.func = function(self) PlaySound(SOUNDKIT.IG_MAINMENU_OPTION); StaticPopup_Show("CONFIRM_BUY_REAGENTBANK_TAB"); end
      UIDropDownMenu_AddButton(info);
    else     
      info.text = "View reagent bank";
      info.func = function(self) BaudManifestDisplay3:Show(); end
      UIDropDownMenu_AddButton(info);
      
      info.text = "Deposit all reagents";
      info.func = function(self) PlaySound(SOUNDKIT.IG_MAINMENU_OPTION); DepositReagentBank(); end
      UIDropDownMenu_AddButton(info);
    end
  end
end

-------------------------------------
-------------------------------------
--
function BaudManifestUpdateBGColor(Display)
  Display:SetBackdropColor(unpack(Display.Data.BGColor));
  if Display.BagsFrame then
    Display.BagsFrame:SetBackdropColor(unpack(Display.Data.BGColor));
  end
end

-------------------------------------
-------------------------------------

function BaudManifestUpdateBGTexture(Display)
  local Backdrop = {
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = false, tileSize = 64, edgeSize = 16,
    insets = {left = 5, right = 5, top = 5, bottom = 5}
  };

  if Display.Data.BGTexture then
    Backdrop.bgFile = "Interface\\AddOns\\BaudManifest\\Backgrounds\\" .. Display.Data.BGTexture .. ".tga";
  else
    Backdrop.bgFile = "Interface\\Buttons\\WHITE8X8";
  end

  for Key, Value in ipairs(Backgrounds) do
    if (Value.File == Display.Data.BGTexture) then
      Backdrop.tileSize = Value.Size / 2;
      break;
    end
  end

  Display:SetBackdrop(Backdrop);
  if Display.BagsFrame then
    Display.BagsFrame:SetBackdrop(Backdrop);
  end
  BaudManifestUpdateBGColor(Display);
end

-------------------------------------
-------------------------------------

function BaudManifestSortDropDown_Initialize()
  --Note that when this function runs when the addon is loaded, it determines the text to be displayed on the drop down
  local Display = UIDROPDOWNMENU_INIT_MENU:GetParent();
  local info = UIDropDownMenu_CreateInfo();
  info.func = BaudManifestSortDropDown_OnClick;
  for Key, Value in ipairs(Sorts) do
    info.text = Value.Name;
    info.value = Key;
    info.checked = (info.value == Display.Sort) and 1 or nil;
    UIDropDownMenu_AddButton(info);
  end
end

-------------------------------------
-------------------------------------

function BaudManifestSortDropDown_OnClick(self)
  BaudManifestSortDropDown_Set(UIDROPDOWNMENU_INIT_MENU, self.value, true);
end

-------------------------------------
-------------------------------------

function BaudManifestSortDropDown_Set(DropDown, Value, Update)
  DropDown:GetParent().Sort = Value;
  if not Update then
    UIDropDownMenu_Initialize(DropDown, BaudManifestSortDropDown_Initialize);
  end

  UIDropDownMenu_SetSelectedValue(DropDown, Value);
  local Text = _G[DropDown:GetName() .. "Text"];
  if (Value == 1) then
    Text:SetTextColor(1, 1, 1);
  else
    Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
  end

  if Update then
    BaudManifestUpdateDisplayList(DropDown:GetParent());
    BaudManifestResetButton_Update(DropDown:GetParent());
  end
end

-------------------------------------
-------------------------------------

function BaudManifestFilterDropDown_Initialize()
  --Note that when this function runs when the addon is loaded, it determines the text to be displayed on the drop down
  local Display = UIDROPDOWNMENU_INIT_MENU:GetParent();
  local info = UIDropDownMenu_CreateInfo();
  info.func = BaudManifestFilterDropDown_OnClick;
  info.text = "No Filter";
  info.value = 1;
  info.checked = (info.value == Display.Filter) and 1 or nil;
  UIDropDownMenu_AddButton(info);

  if not Display.Data then
    return;
  end

  local Text = _G[UIDROPDOWNMENU_INIT_MENU:GetName() .. "Text"];
  if (Display.Filter ~= 1) then
    Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
  else
    Text:SetTextColor(1, 1, 1);
  end

  local ItemTypes = {};
  local Type;
  for Category, Value in ipairs(Display.Data) do
    for ItemIndex, Value in ipairs(Value) do
      if Value.ItemString then
        Type = select(6, GetItemInfo(Value.ItemString));
        for Key, Value in ipairs(ItemTypes) do
          if (Type == Value) then
            Type = nil;
            break;
          end
        end
        if Type then
          tinsert(ItemTypes, Type);
        end
      end
    end
  end

  table.sort(ItemTypes, function(a, b) return (a < b); end);

  for Key, Value in ipairs(ItemTypes) do
    info.text = Value;
    info.value = Value;
    info.checked = (info.value == Display.Filter) and 1 or nil;
    UIDropDownMenu_AddButton(info);
  end
end

-------------------------------------
-------------------------------------

function BaudManifestFilterDropDown_OnClick(self)
  BaudManifestFilterDropDown_Set(UIDROPDOWNMENU_INIT_MENU, self.value, true);
end

-------------------------------------
-------------------------------------

function BaudManifestFilterDropDown_Set(DropDown, Value, Update)
  DropDown:GetParent().Filter = Value
  if not Update then
    UIDropDownMenu_Initialize(DropDown, BaudManifestFilterDropDown_Initialize);
  end

  UIDropDownMenu_SetSelectedValue(DropDown, Value);
  local Text = _G[DropDown:GetName() .. "Text"];
  if (Value == 1) then
    Text:SetTextColor(1, 1, 1);
  else
    Text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
  end
  if Update then
    BaudManifestUpdateDisplayList(DropDown:GetParent());
    BaudManifestResetButton_Update(DropDown:GetParent());
  end
end

-------------------------------------
-------------------------------------

function BaudManifestFilterEditBox_OnTextChanged(self)
  local Display = self:GetParent();
  if ((Display.CustomFilter or "") == strlower(self:GetText())) then
    return;
  end

  Display.CustomFilter = strlower(self:GetText());
  Display.Refresh = GetTime() + FilterDelay;
  Display.RefreshFrame:Show();
  Display.UpdateList = true;
  BaudManifestResetButton_Update(Display);
end

-------------------------------------
-------------------------------------

function BaudManifestResetButton_OnClick(Display)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
  Display.FilterEdit:SetText("");
  BaudManifestFilterDropDown_Set(Display.FilterDrop, 1);
  BaudManifestSortDropDown_Set(Display.SortDrop, 1)
  ClearFocus:SetFocus();
  BaudManifestUpdateDisplayList(Display);
  BaudManifestResetButton_Update(Display);
end

-------------------------------------
-------------------------------------

function BaudManifestResetButton_Update(Display)
  if BaudManifestCategoriesDisabled(Display) then
    Display.Reset:Enable();
  else
    Display.Reset:Disable();
  end
end

-------------------------------------
-------------------------------------

function BaudManifestCharacters_OnLoad(self)
  self:RegisterForDrag("LeftButton");
  self:RegisterForClicks("RightButtonUp", "LeftButtonUp");
  tinsert(UIMenus, self:GetName());
end

-------------------------------------
-------------------------------------

function BaudManifestGenericClick(Button)
  if (Button == "RightButton") then
    BaudManifestClearVirtualDrag();
  end
  ClearFocus:SetFocus();
end

-------------------------------------
-------------------------------------

function BaudManifestCharacters_OnShow()
end

-------------------------------------
-------------------------------------

function BaudManifestCharacterEntry_OnClick(self)
  BaudManifestClearVirtualDrag();
  SelectedChar = self.Name;
  local Data = GetCharData(SelectedChar);
  if (SelectedChar == AllCharText) then
    if not AllCharData then
      AllCharData = Data;
    end
    BaudManifestUpdateAllChars();
  else
    --Backwards compatability
    for Key, Display in ipairs(Data) do
      for Key, Category in ipairs(Display) do
        for Key, Value in ipairs(Category) do
          if (Value.Equipped == true) then
            Value.Equipped = 1;
          end
        end
      end
    end
  end

  BaudManifestCharactersScrollBoxHighlight:SetPoint("TOP",self);
  BaudManifestCharactersScrollBoxHighlight:Show();
  local Display;
  for Index = 1, 2 do
    Display = Displays[Index + 3];
    if (Index ~= 1) and (SelectedChar == AllCharText) then
      Display:Hide();
      break;
    end
    Display.Name = SelectedChar;
    Display.Data = Data[Index];
    BaudManifestClearZeros(Display);
    BaudManifestUpdateBGTexture(Display);
    BaudManifestUpdateDisplayList(Display);
    if (Index==1) then
      SetMoneyFrameColor(Display:GetName() .. "MoneyFrame", 1.0, 1.0, 1.0);
      MoneyFrame_Update(Display:GetName() .. "MoneyFrame", (Data.Money or 0));
    end
    Display:Show();
  end
end

-------------------------------------
-------------------------------------

function BaudManifestUpdateAllChars()
  local ItemData, AllChars;
  if not AllCharHash then
    AllCharHash = {};
    OtherCharMoney = 0;

    for Category, Value in ipairs(AllCharData[1]) do
      for ItemIndex, Value in ipairs(Value) do
        if Value.ItemString then
          AllCharHash[Value.ItemString] = Value;
          Value.OtherChars = nil;
        end
      end
    end

    for Key, Value in pairs(RealmData) do
      if (Value ~= AllCharData) and (Value ~= PlayerData) then
        OtherCharMoney = OtherCharMoney + (Value.Money or 0);
        for Display, Value in ipairs(Value) do
          for Category, Value in ipairs(Value) do
            for Key, Value in ipairs(Value) do
              if Value.ItemString and Value.Count and (Value.Count > 0) then
                ItemData = AllCharHash[Value.ItemString];
                if ItemData then
                  ItemData.OtherChars = Value.Count + (ItemData.OtherChars or 0);
                else
                  ItemData = {ItemString = Value.ItemString, OtherChars = Value.Count};
                  tinsert(AllCharData[1][1], ItemData);
                  AllCharHash[Value.ItemString] = ItemData;
                end
              end
            end
          end
        end
      end
    end
  end

  for Key, Value in pairs(AllCharHash) do
    Value.Count = Value.OtherChars;
  end

  AllCharData.Money = OtherCharMoney + PlayerData.Money;

  for Display, Value in ipairs(PlayerData) do
    for Category, Value in ipairs(Value) do
      for Key, Value in ipairs(Value) do
        if Value.ItemString and Value.Count and (Value.Count > 0) then
          ItemData = AllCharHash[Value.ItemString];
          if ItemData then
            ItemData.Count = (ItemData.Count or 0) + Value.Count;
          else
            ItemData = {ItemString = Value.ItemString, Count = Value.Count};
            tinsert(AllCharData[1][1], ItemData);
            AllCharHash[Value.ItemString] = ItemData;
          end
        end
      end
    end
  end

  local Root = AllCharData[1][1];
  local Index = 0;
  while true do
    Index = Index + 1;
    if not Root[Index] then
      break;
    end
    if Root[Index].ItemString and not Root[Index].Count then
      AllCharHash[tremove(Root, Index).ItemString] = nil;
      Index = Index - 1;
    end
  end
end

-------------------------------------
-------------------------------------

function BaudManifestOptions_OnLoad(self)
  local Text = self:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Text:SetPoint("BOTTOMRIGHT", -13, 13);
  Text:SetText("Version " .. GetAddOnMetadata("BaudManifest", "Version"));

  self.name = "Baud Manifest";
  self.refresh = BaudManifestOptions_OnShow;
  InterfaceOptions_AddCategory(self);

  self:RegisterForDrag("LeftButton");
  self:RegisterForClicks("RightButtonUp", "LeftButtonUp");

  local Button;
  for Index, Value in ipairs(CheckButtons) do
    Button = CreateFrame("CheckButton", self:GetName() .. "CheckButton" .. Index, self, "OptionsCheckButtonTemplate");
    Value.Button = Button;
    Button.Data = Value;
    Button:SetPoint("TOPLEFT", self, 25 + (Value.Depend and 10 or 0), -25 * Index);
    Button.tooltipText = Value.TooltipText;
    _G[Button:GetName() .. "Text"]:SetText(Value.Text);
    Button:SetScript("OnClick", BaudManifestCheckButton_OnClick);
  end

  BaudManifestOptionsScaleSliderLow:SetText("50%");
  BaudManifestOptionsScaleSliderHigh:SetText("200%");
  BaudManifestOptionsScaleSlider.tooltipText = "Scale of the manifest.";

  local Text, DropDown;
  local QText = {[0] = "grey", [1] = "white", [2] = "green", [3] = "blue", [4] = "purple"}
  for Quality = 0, 4 do
    DropDown = CreateFrame("Frame", "BaudManifestQualityDropDown" .. Quality, self, "UIDropDownMenuTemplate");
    QualityDrop[Quality] = DropDown;
    DropDown:SetPoint("TOPRIGHT", -20, -50 - Quality * 45);
    DropDown:SetID(Quality);
    UIDropDownMenu_SetWidth(DropDown, 110);
    Text = DropDown:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
    Text:SetText("Put new |c" .. select(4, GetItemQualityColor(Quality)) .. QText[Quality] .. "|r items in");
    Text:SetPoint("BOTTOMLEFT", DropDown, "TOPLEFT", 10, 2);
  end

  DropDown = CreateFrame("Frame", "BaudManifestAutoSellDropDown", self, "UIDropDownMenuTemplate");
  DropDown:SetPoint("TOPRIGHT", -20, -275);
  UIDropDownMenu_SetWidth(DropDown, 110);
  Text = DropDown:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
  Text:SetText("Sell items in");
  Text:SetPoint("BOTTOMLEFT",DropDown,"TOPLEFT", 10, 2);
end

local BankBlocked = false;
function BaudManifestUpdateBlizBankBlock()
  local Block = Config.ShowBank and Config.HideBlizBank;
  if (BankBlocked == Block) then
    return;
  end

  BankBlocked = Block;
  if Block then
    BankFrame:UnregisterEvent("BANKFRAME_OPENED");
  else
    BankFrame:RegisterEvent("BANKFRAME_OPENED");
  end
end

-------------------------------------
-------------------------------------

function BaudManifestOptions_OnShow(self)
  local DropDown;
  for Quality = 0, 4 do
    DropDown = QualityDrop[Quality];
    UIDropDownMenu_Initialize(DropDown, BaudManifestQualityDropDown_Initialize);
    UIDropDownMenu_SetSelectedValue(DropDown, PlayerData.PutQuality[Quality]);
  end
  DropDown = BaudManifestAutoSellDropDown;
  UIDropDownMenu_Initialize(DropDown, BaudManifestAutoSellDropDown_Initialize);
  UIDropDownMenu_SetSelectedValue(DropDown, PlayerData.AutoSell);
end

-------------------------------------
-------------------------------------

function BaudManifestOptionsUpdateDepend()
  for Index, Value in ipairs(CheckButtons) do
    if Value.Depend then
      if Config[Value.Depend] then
        Value.Button:Enable();
      else
        Value.Button:Disable();
      end
    end
  end
end

-------------------------------------
-------------------------------------

local CategoryList = {};
function BaudManifestMakeCategoryDropDown(FirstItem, Selected, Func)
  wipe(CategoryList);

  local info = UIDropDownMenu_CreateInfo();
  info.func = Func;

  for Category, Value in ipairs(PlayerData[1]) do
    if (Category > 1) then
      tinsert(CategoryList, {Name = Value.Name, Category = Category});
    end
  end
  table.sort(CategoryList, function(a, b) return(a.Name < b.Name) end);
  tinsert(CategoryList, 1, FirstItem);

  for Index, Value in ipairs(CategoryList) do
    info.text = Value.Name;
    info.value = Value.Category;
    info.checked = (info.value == Selected) and 1 or nil;
    UIDropDownMenu_AddButton(info);
  end
end

-------------------------------------
-------------------------------------

function BaudManifestQualityDropDown_Initialize()
  local Quality = UIDROPDOWNMENU_INIT_MENU:GetID();
  BaudManifestMakeCategoryDropDown({Name = "<Inventory>", Category = 1}, PlayerData.PutQuality[Quality], BaudManifestQualityDropDown_OnClick);
end

-------------------------------------
-------------------------------------

function BaudManifestQualityDropDown_OnClick(self)
  local DropDown = UIDropDownMenu_GetCurrentDropDown();
  PlayerData.PutQuality[DropDown:GetID()] = self.value;
  UIDropDownMenu_SetSelectedValue(DropDown, self.value);
end

-------------------------------------
-------------------------------------

function BaudManifestAutoSellDropDown_Initialize()
  BaudManifestMakeCategoryDropDown({Name = "<Disabled>", Category=1}, PlayerData.AutoSell, BaudManifestAutoSellDropDown_OnClick);
end

-------------------------------------
-------------------------------------

function BaudManifestAutoSellDropDown_OnClick(self)
  PlayerData.AutoSell = self.value;
  UIDropDownMenu_SetSelectedValue(BaudManifestAutoSellDropDown, self.value);

  -- reset the autosell table when switching autosell categories
  for k in next, AutoSellTable do
    rawset(AutoSellTable, k, nil)
  end

  for Key, Value in ipairs(PlayerData[1][PlayerData.AutoSell]) do
    SetAutoSellTable(Value.ItemString, 1);
  end
end

-------------------------------------
-------------------------------------

function BaudManifestToMoney(Money)
  Money = floor(Money);
  local Text = "";
  if (Money % 100 > 0) and (Money < 10000) or (Money == 0) then
    Text = "|cffba795a" .. (Money % 100) .. "c|r";
  end

  Money = floor(Money / 100);
  if (Money % 100 > 0) and (Money < 100000) then
    Text = (Money % 100) .. "s" .. Text;
  end

  Money = floor(Money / 100);
  if (Money > 0) then
    Text = "|cfff0f020" .. Money .. "g|r" .. Text;
  end
  return Text;
end

-------------------------------------
-------------------------------------

function BaudManifestAutoSellItems()
  if (PlayerData.AutoSell <= 1) then
    return;
  end

  local Money = GetMoney();
  local Timer = 0;
  local Total = 0;
  local Profit = 0;
  local Item;
  BaudManifestForEachSlot(BaudManifestDisplay1,
    function(Bag, Slot)
      ItemLink = GetContainerItemLink(Bag, Slot);
      if not ItemLink then
        return;
      end

      Item = GetItemString(ItemLink);
      if not Item then
        return;
      end

      -- if the item is in the autosell table, it's good to sell
      if GetAutoSellTable(Item) then
        --DebugMsg("Found in AutoSell " .. Item);
        C_Timer.NewTimer(Timer, function() UseContainerItem(Bag, Slot); end)
        Timer = Timer + .1;
        Total = Total + 1;
      end
    end,
    function(Bag)
      return (not Bag);
    end
  );

  --otherwise check to see if it has a max quantity property
  for Key, Value in pairs(PlayerHash[1]) do
    if Value.Properties and Value.Properties.Sell then
      Count = GetItemCount(Key) - Value.Properties.Amount;
      if (Count > 0) then
        --DebugMsg("Found too many "..Value.ItemString.."; need to sell "..Count);
        DragItem = {String = Value.ItemString, Origin = Displays[1], Remain = Count};
        if BaudManifestPickupDragRemain(true, true) then
          Timer = Timer + .1;
          Total = Total + 1;
        end
      end
    end
  end

  if (Total > 0) then
    -- needs tweaking
    C_Timer.NewTimer(.9 + Total * .1, function()
                       Profit = GetMoney() - Money;
                       if (Profit > 0) then
                         DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix .. "Sold " .. Total .. " item" .. ((Total == 1) and "" or "s") .. " for " .. BaudManifestToMoney(Profit) .. ".");
                       else
                         DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix .. "Sold " .. Total .. " item" .. ((Total == 1) and "" or "s"));
                       end
                     end)
  end
end

-------------------------------------
-------------------------------------

function BaudManifestAutoBuyItems()
  local Count, ItemID, Price, Quantity, Available, MaxStack, Buying;
  local Paid = 0
  for Key, Value in pairs(PlayerHash[1]) do
    if Value.Properties and Value.Properties.Buy then
      Count = Value.Properties.Amount - GetItemCount(Key);
      if (Count > 0) then
        for Index = 1, GetMerchantNumItems() do
          if (Value.ItemString == GetItemString(GetMerchantItemLink(Index) or "")) then
            _, _, Price, _, Available = GetMerchantItemInfo(Index);
            MaxStack = GetMerchantItemMaxStack(Index);
            if (Available >= 0) and (Available < Count) then
              Count = Available;
            end
            while (Count > 0) do
              Buying = min(Count, MaxStack);
              BuyMerchantItem(Index, Buying);
              Count = Count - Buying;
              Paid = Paid + Price * Buying;
            end
            break;
          end
        end
      end
    end
  end

  if (Paid > 0) then
    DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix .. "Buying items for " .. BaudManifestToMoney(Paid) .. ".");
  end
end

-------------------------------------
-------------------------------------

function BaudManifestDepositAndWithdraw()
  local Properties, Count, From, MaxStack, Link, Find, Stack, Locked, BestBag, BestSlot, BestCount, PlaceBag, PlaceSlot;
  local Moved = {};
  for Key, Value in pairs(PlayerHash[1]) do
    if Value.Properties then
      Properties = Value.Properties;
      if Properties.Withdraw or Properties.Deposit then
        Count = Properties.Amount - GetItemCount(Key);
        if (Count < 0) and Properties.Deposit or (Count > 0) and Properties.Withdraw then
          if (Count > 0) then
            From = 2;
          else
            From = 1;
            Count = -Count;
          end
          ClearCursor();
          DragItem = {String = Value.ItemString, Origin = Displays[From], Remain = Count};
          if BaudManifestPickupDragRemain(true) then
            Moved[From] = true;
          end
        end
      end
    end
  end

  if Moved[1] or Moved[2] then
    DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix .. "Items " .. (Moved[1] and Moved[2] and "deposited and withdrawn" or Moved[1] and "deposited" or Moved[2] and "withdrawn") .. ".");
  end
end

-------------------------------------
-------------------------------------

function BaudManifestCheckButton_OnClick(self)
  if self:GetChecked() then
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
  else
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  end

  local SavedVar = self.Data.SavedVar;
  local SaveTo = (self:GetID() == 1) and PlayerData or Config;
  SaveTo[SavedVar] = self:GetChecked() and true or false;
  if self.Data.Func then
    self.Data.Func();
  end
  BaudManifestOptionsUpdateDepend();
end

-------------------------------------
-------------------------------------

function BaudManifestRouteConfig()
  if PlayerData.CharSpecific then
    Config = PlayerData;
    AltConfig = GlobalConfig;
  else
    Config = GlobalConfig;
    AltConfig = PlayerData;
  end

  local Saved;
  for Key, Value in ipairs(CheckButtons) do
    if (Key > 1) then
      Saved = Value.SavedVar;
      if (Config[Saved] == nil) then
        if (AltConfig[Saved] == nil) then
          Config[Saved] = Value.Default;
        else
          Config[Saved] = AltConfig[Saved];
        end
      end
      Value.Button:SetChecked(Config[Saved]);
    end
  end
  if (type(Config.Scale) ~= "number") then
    if (type(AltConfig.Scale) == "number") then
      Config.Scale = AltConfig.Scale;
    else
      Config.Scale = 100;
    end
  end

  IgnoreHooks = true;
  BaudManifestOptionsScaleSlider:SetValue(Config.Scale);
  IgnoreHooks = nil;

  BaudManifestUpdateScales();
  for Key, Value in ipairs(CheckButtons) do
    if (Key > 1) and Value.Func then
      Value.Func();
    end
  end
  BaudManifestOptionsUpdateDepend();
end

-------------------------------------
-------------------------------------

function BaudManifestUpdateScales()
  local Display, X, Y, Multiplier;
  for Index = 1, 5 do
    Display = Displays[Index];
    Multiplier = Display:GetScale() / (Config.Scale / 100);
    X, Y = Display:GetCenter();
    Display:SetScale(Config.Scale / 100);
    if (Index <= 2) then
      Display:ClearAllPoints();
      Display:SetPoint("CENTER", UIParent, "BOTTOMLEFT", X * Multiplier, Y * Multiplier);
    end
    BaudManifestDisplay_OnSizeChanged(Display);
  end
end

-------------------------------------
-------------------------------------

function BaudManifestScaleSlider_OnValueChanged(self)
  _G[self:GetName() .. "Text"]:SetText("Scale: " .. self:GetValue() .. "%");
  if IgnoreHooks then
    return;
  end
  Config.Scale = self:GetValue();
  BaudManifestUpdateScales();
end

-------------------------------------
-------------------------------------

function BaudManifestEmptyBag(Display, BagToEmpty, Unequip)
  --DebugMsg("Emptying bag "..BagToEmpty);
  BaudManifestReadSpecials(Display, BagToEmpty);

  local Link, BestBag, ItemID, ItemFamily, InvID, Free, Family;
  local MaxSlots = GetContainerNumSlots(BagToEmpty) + 1;
  local NextSlot = 1;
  local NotEmpty;
  if not BaudManifestForEachSlot(Display,
    function(Bag, Slot)
      Link = GetContainerItemLink(Bag, Slot);
      if Link then
        return;
      end
      for Slot2 = NextSlot, MaxSlots do
        if (Slot2 >= MaxSlots) then
          if not Unequip then
            return true;
          end
          Link = GetInventoryItemLink("player", ContainerIDToInventoryID(BagToEmpty));
        else
          Link = GetContainerItemLink(BagToEmpty, Slot2);
          if Link then
            NotEmpty = true;
            if select(3, GetContainerItemInfo(BagToEmpty, Slot2)) then
              Link = nil;
            end
          end
        end
        if Link then
          NextSlot = Slot2 + 1;
          ItemID = tonumber(strmatch(Link, "item:(%d+):") or 0);
          ItemFamily = GetItemFamily(ItemID) or 0;
          if (Slot2 < MaxSlots) then
            ClearCursor();
            IgnoreHooks = true;
            PickupContainerItem(BagToEmpty, Slot2);
            IgnoreHooks = false;
          elseif NotEmpty then
            DragPending = DragItem;
            DragItem = nil;
            return true;
          else
            if not CursorHasItem()then
              IgnoreHooks = true;
              PickupBagFromSlot(ContainerIDToInventoryID(BagToEmpty));
              IgnoreHooks = false;
            end
          end
          if CursorHasItem()then
            if (ItemFamily > 0) then
              for Index = 1, NumSpecials do
                if (bitand(SpecialBags[Index].Family, ItemFamily) > 0) and (SpecialBags[Index].Free > 0) then
                  InvID = ContainerIDToInventoryID(SpecialBags[Index].Index);
                  if not CursorCanGoInSlot(InvBagsOffset + 1) then
                    SpecialBags[Index].Free = SpecialBags[Index].Free - 1;
                    PutItemInBag(InvID);
                    ItemID = nil;
                  end
                  break;
                end
              end
            end
            if ItemID then
              if (Bag == 0) then
                PutItemInBackpack();
              else
                if (Bag < 1) or CursorCanGoInSlot(InvBagsOffset + 1) then
                  PickupContainerItem(Bag, Slot);
                else
                  PutItemInBag(ContainerIDToInventoryID(Bag));
                end
              end
              return;
            end
          end
        end
      end
      return true;
    end,
    function(Bag)
      if not Bag or (Bag < -1) or (Bag == BagToEmpty) then
        return true;
      end
      Free, Family = GetContainerNumFreeSlots(Bag);
      if (Family ~= 0) or (Free == 0) then
        return true;
      end
    end)
  then
    UIErrorsFrame:AddMessage("Not enough bag space to unequip that.", 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    ClearCursor();
    DragItem = nil;
  end
end

-------------------------------------
-------------------------------------

function BaudManifestBagsButton_OnClick(self)
  local Display = self:GetParent();
  if (Display:GetID() ~= 3) then
    Display.Data.ShowBags = self:GetChecked();
    if Display.Data.ShowBags then
      Display.BagsFrame:Show();
    else
      Display.BagsFrame:Hide();
    end
  end
end

-------------------------------------
-------------------------------------

function BaudManifestBankPurchaseUpdate()
  local Purchase = BaudManifestBankSlotPurchaseButton;
  local BagsFrame = Purchase:GetParent();
  local Slots, Full = GetNumBankSlots();

  local BagSlot;
  for Bag = 1, NUM_BANKBAGSLOTS do
    BagSlot = BankBags[Bag];
    if (Bag <= Slots) then
      SetItemButtonTextureVertexColor(BagSlot, 1.0, 1.0, 1.0);
      BagSlot.tooltipText = BANK_BAG;
    else
      SetItemButtonTextureVertexColor(BagSlot, 1.0, 0.1, 0.1);
      BagSlot.tooltipText = BANK_BAG_PURCHASE;
    end
  end

  if Full then
    Purchase:Hide();
    BagsFrame:SetHeight(BagsFrame.Height);
    return;
  end

  local Cost = GetBankSlotCost(Slots);

  --This line allows the confirmation box to show the cost
  BankFrame.nextSlotCost = Cost;
  local MoneyFrame = Purchase:GetName().."MoneyFrame";
  if (GetMoney() >= Cost) then
    SetMoneyFrameColor(MoneyFrame, 1.0, 1.0, 1.0);
  else
    SetMoneyFrameColor(MoneyFrame, 1.0, 0.1, 0.1);
  end
  MoneyFrame_Update(MoneyFrame, Cost);

  Purchase:Show();
  BagsFrame:SetHeight(BagsFrame.Height + 40);
end

-------------------------------------
-------------------------------------

local BlizBagsHooked, OpenAllBypass;
local pre_OpenAllBags, pre_CloseAllBags, pre_ToggleAllBags, pre_ToggleBackpack;
function BaudManifestHookBlizBags()
  if BlizBagsHooked or not Config.ReplaceBlizBags then
    return;
  end

  BlizBagsHooked = true;

  pre_OpenAllBags = OpenAllBags;
  OpenAllBags = function(...) BaudManifestToggleDisplay(1); end

  pre_CloseAllBags = CloseAllBags;
  CloseAllBags = function(...)
    -- Close the Manifest in addition to any Blizzard bags that might be open.
    if Displays[1]:IsShown()then
       BaudManifestToggleDisplay(1);
    end
    return pre_CloseAllBags(...);
  end

  pre_ToggleAllBags = ToggleAllBags;
  ToggleAllBags = function(...)
    pre_ToggleAllBags(...);
    return ToggleBag(0); -- TODO: double-check this
  end

  pre_ToggleBackpack = ToggleBackpack;
  ToggleBackpack = function(...)
    --DebugMsg("ToggleBackpack called.");
    if OpenAllBypass then
      --DebugMsg("Letting ToggleBackpack go through.");
      return pre_ToggleBackpack(...);
    else
       BaudManifestToggleDisplay(1);
    end
  end
end

-------------------------------------
-------------------------------------

hooksecurefunc("BankFrameItemButton_OnEnter", function(self)
  if not self.isBag or BankOpen or GameTooltip:GetItem()then
    return;
  end
  local Bag = PlayerData.BankBag[self:GetID()-4].Link;
  if not Bag then
    return;
  end
  Bag = strmatch(Bag, "(item[%d:%-]+)");
  if not Bag then
    return;
  end
  if(self:GetRight() >= (GetScreenWidth() / 2))then
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
  else
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
  end
  GameTooltip:SetHyperlink(Bag);
end);

-------------------------------------
-------------------------------------

function BaudManifestResetPositons()
  BaudManifestDisplay1:ClearAllPoints();
  BaudManifestDisplay1:SetPoint("LEFT", UIParent, "CENTER", 10, 0);
  BaudManifestDisplay2:ClearAllPoints();
  BaudManifestDisplay2:SetPoint("RIGHT", UIParent, "CENTER", -10, 0);
  DEFAULT_CHAT_FRAME:AddMessage(MsgPrefix.."Manifest positions reset.");
end

-------------------------------------
-------------------------------------

local CurProps, PropsItem, PropsStack;
local ItemChecks = {
  {Text="Persistant",SavedVar=nil,Default=false,
    TooltipText="Prevent this item from being removed or hidden, even if you don't have any of it."},
  {Text="Buy",SavedVar="Buy",Default=false,
    TooltipText="When at a vendor, automatically buy more of this item if you are carrying less than the specified amount."},
  {Text="Sell",SavedVar="Sell",Default=false,
    TooltipText="When at a vendor, automatically sell any excess of this item if you are carrying more than the specified amount."},
  {Text="Deposit",SavedVar="Deposit",Default=false,
    TooltipText="Automatically deposit this item into your bank if you are carrying more than the specified amount."},
  {Text="Withdraw",SavedVar="Withdraw",Default=false,
    TooltipText="Automatically withdraw this item from your bank if you are carrying less than the specified amount."},
};

local ItemEdits;
ItemEdits = {
  {Text="Stacks",
    Func = function(self)
      CurProps.Amount = self:GetNumber() * PropsStack;
      ItemEdits[2].Frame:SetNumber(CurProps.Amount);
    end},
  {Text="Amount",
    Func = function(self)
      CurProps.Amount = self:GetNumber();
      IgnoreHooks = true;
      ItemEdits[1].Frame:SetNumber(ceil(CurProps.Amount / PropsStack));
      IgnoreHooks = nil;
    end},
};

function BaudManifestProperties_OnLoad(self)
  self:RegisterForDrag("LeftButton");
  tinsert(UIMenus, self:GetName());

  local Restock = _G[self:GetName().."Restock"];
  Restock:SetBackdropBorderColor(0.4, 0.4, 0.4);
  local Button;
  for Key, Value in ipairs(ItemChecks)do
    Button = CreateFrame("CheckButton", "BaudManifestPropertiesCheck"..Key, self, "OptionsCheckButtonTemplate");
    Value.Button = Button;
    Button.SavedVar = Value.SavedVar;
    Button.Text = _G[Button:GetName().."Text"];
    Button.Text:SetText(Value.Text);
    Button.tooltipText = Value.TooltipText;
    Button:SetScript("OnClick", BaudManifestPropertiesCheck_OnClick);
    if (Key == 1) then
      Button:SetPoint("TOPLEFT", 25, -55 - 25 * Key);
    else
      Button:SetParent(Restock);
      Button:SetPoint("TOPLEFT", 5, -5 - 25 * (Key - 2));
    end
  end

  for Key, Value in ipairs(ItemEdits)do
    Button = CreateFrame("EditBox", "BaudManifestPropertiesEditBox"..Key, Restock, "InputBoxTemplate");
    Value.Frame = Button;
    Button.Text = Button:CreateFontString(nil, "BACKGROUND", "GameFontNormal");
    Button.Text:SetText(Value.Text);
    Button.Text:SetPoint("BOTTOMLEFT", Button, "TOPLEFT", 0, 3);
    Button:SetScript("OnChar", Value.Func);
    Button:SetAutoFocus(false);
    Button:SetNumeric(true);
    Button:SetMaxLetters(7);
    Button:SetHeight(16);
    Button:SetWidth(100);
    Button:SetPoint("TOPRIGHT", -15, -30 - 35 * (Key - 1));
  end
end

-------------------------------------
-------------------------------------

function BaudManifestProperties_OnClick(self)
  PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK);
  local Button = self:GetParent():GetParent();
  local ItemInfo = Button.ItemInfo;
  if not ItemInfo.ItemString or strmatch(ItemInfo.ItemString, "battlepet:") or strmatch(ItemInfo.ItemString, "keystone:") then
    return;
  end
  PropsItem = ItemInfo;
  CurProps = ItemInfo.Properties;
  PropsDisplay = Button.Display;
  local ID = PropsDisplay:GetID();
  local Name, Link, Quality, Level, MinLevel, Type, SubType, StackCount, EquipLoc, Texture = GetItemInfo(ItemInfo.ItemString);
  PropsStack = StackCount;
  ItemChecks[1].Button:SetChecked(CurProps ~= nil);
  BaudManifestPropertiesUpdateDepend(CurProps);

  if not CurProps then
    CurProps = {};
  end

  if not CurProps.Amount then
    CurProps.Amount = PropsStack;
  end

  if (PropsStack == 1) then
    ItemEdits[1].Frame:Hide();
  else
    ItemEdits[1].Frame:SetNumber(ceil(CurProps.Amount / PropsStack));
    ItemEdits[1].Frame:Show();
  end

  ItemEdits[2].Frame:SetNumber(CurProps.Amount);
  if (ID == 1) then
    for Key, Value in ipairs(ItemChecks) do
      if (Key > 1) then
        if (CurProps[Value.SavedVar] == nil) then
          CurProps[Value.SavedVar] = Value.Default;
        end
        Value.Button:SetChecked(CurProps[Value.SavedVar]);
      end
    end
    BaudManifestPropertiesRestock:Show();
  else
    BaudManifestPropertiesRestock:Hide();
  end

  BaudManifestPropertiesIcon:SetTexture(Texture);
  BaudManifestPropertiesName:SetText(Name);
  BaudManifestPropertiesName:SetText(Name);
  BaudManifestPropertiesItemID:SetText("Item #"..strmatch(ItemInfo.ItemString, "item:(%d+):"));
  local R, G, B = GetItemQualityColor(Quality or 1);
  BaudManifestPropertiesName:SetTextColor(R, G, B, 1);
  BaudManifestProperties:Show();
  BaudManifestProperties:Raise();
end

-------------------------------------
-------------------------------------

function BaudManifestPropertiesCheck_OnClick(self)
  if self:GetChecked()then
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
  else
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  end

  if self.SavedVar then
    CurProps[self.SavedVar] = self:GetChecked() and true or false;
  else
    PropsItem.Properties = self:GetChecked() and CurProps or nil;
    BaudManifestUpdateDisplayList(PropsDisplay);
    BaudManifestPropertiesUpdateDepend(self:GetChecked());
  end
end

-------------------------------------
-------------------------------------

function BaudManifestPropertiesUpdateDepend(State)
  for Key = 2, #ItemChecks do
    ItemChecks[Key].Button[State and "Enable" or "Disable"](ItemChecks[Key].Button);
    ItemChecks[Key].Button.Text:SetTextColor(unpack(State and Yellow or Gray));
  end

  for Key, Value in ipairs(ItemEdits)do
    Value.Frame.Text:SetTextColor(unpack(State and Yellow or Gray));
    Value.Frame:EnableMouse(State);
    Value.Frame:SetTextColor(unpack(State and White or Gray));
  end
end