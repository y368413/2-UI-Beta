local _, API = ...;

local GetItemInfo = C_Item.GetItemInfo or GetItemInfo;
local GetItemInfoInstant = C_Item.GetItemInfoInstant or GetItemInfoInstant;

local OWNED_FORMAT = "(Owned: %d)";
local NA = "N/A";

------------

VI_CurrencyItemEntryMixin = {};

function VI_CurrencyItemEntryMixin:OnLoad()
    self.Text:EnableMouse(true);
    self.Text:SetScript("OnEnter", function() self:OnFontStringEnter(); end);
    self.Text:SetScript("OnLeave", function() self:OnFontStringLeave(); end);

    self.OwnedText:SetTextScale(0.85);

    self.Button:SetScript("OnEnter", function() self:OnButtonEnter(); end);
    self.Button:SetScript("OnLeave", function() self:OnButtonLeave(); end);

    self:RegisterEvent("BAG_UPDATE");
end

function VI_CurrencyItemEntryMixin:Init(data)
    self.ItemLink = data.ItemLink;
    self.ItemID = GetItemInfoInstant(self.ItemLink);

    self.Text:SetText(NA);
    self.OwnedText:SetText(NA);
    self.Button:Reset();

    self.OwnedQuantity = 0;

    self.LinkedItem = Item:CreateFromItemLink(self.ItemLink);
    self.LinkedItem:ContinueOnItemLoad(function()
        self:OnItemLoaded();
    end);
end

function VI_CurrencyItemEntryMixin:OnEvent(event, ...)
    if self[event] then
        self[event](self, ...);
    end
end

function VI_CurrencyItemEntryMixin:BAG_UPDATE()
    if not self:IsShown() then
        return;
    end

    self:UpdateOwned();
end

function VI_CurrencyItemEntryMixin:OnFontStringEnter()
    if self.Text:IsTruncated() then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        local r, g, b, a = self.Text:GetTextColor();
        local textWrap = true;
        GameTooltip:SetText(self.Text:GetText(), r, g, b, a, textWrap);
        GameTooltip:Show();
    end
end

function VI_CurrencyItemEntryMixin:OnFontStringLeave()
    GameTooltip:Hide();
end

function VI_CurrencyItemEntryMixin:OnButtonEnter()
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    GameTooltip:SetHyperlink(self.ItemLink);
    GameTooltip:Show();
end

function VI_CurrencyItemEntryMixin:OnButtonLeave()
    GameTooltip:Hide();
end

function VI_CurrencyItemEntryMixin:OnItemLoaded()
    local itemName = GetItemInfo(self.ItemID);

    self.Text:SetText(itemName);
    self.Button:SetItem(self.ItemLink);

    self:UpdateOwned();
end

function VI_CurrencyItemEntryMixin:UpdateOwned()
    local owned = C_Item.GetItemCount(self.ItemID, true, false, true);
    if owned == 0 then
        SetItemButtonDesaturated(self.Button, true);
        self.OwnedText:SetTextColor(GRAY_FONT_COLOR:GetRGBA());
    else
        SetItemButtonDesaturated(self.Button, false);
        self.OwnedText:SetTextColor(WHITE_FONT_COLOR:GetRGBA());
    end

    self.OwnedText:SetText(format(OWNED_FORMAT, owned));
end

------------

VI_ItemCurrencyListFrameMixin = {};

function VI_ItemCurrencyListFrameMixin:OnLoad()
    ButtonFrameTemplate_HidePortrait(self);
    self:SetTitle("Item Currencies");

    self.DataProvider = CreateDataProvider();

    local tPad, bPad, lPad, rPad, spacing = 8, 5, 8, 5, 10;
    self.ScrollView = CreateScrollBoxListLinearView(tPad, bPad, lPad, rPad, spacing);
    self.ScrollView:SetDataProvider(self.DataProvider);

    local DEFAULT_EXTENT = 24;
    self.ScrollView:SetPanExtent(DEFAULT_EXTENT);
    self.ScrollView:SetElementExtent(DEFAULT_EXTENT);

    local function Initializer(frame, data)
        frame:Init(data);
    end

    self.Template = self.Template or "VI_CurrencyItemEntryTemplate";
    self.ScrollView:SetElementInitializer(self.Template, Initializer);

    ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);

    local anchorsWithScrollBar = {
        CreateAnchor("TOPLEFT", 4, -24);
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, -14, 0),
    };

    local anchorsWithoutScrollBar = {
        anchorsWithScrollBar[1],
        CreateAnchor("BOTTOMRIGHT", -4, 0);
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithScrollBar, anchorsWithoutScrollBar);
end

function VI_ItemCurrencyListFrameMixin:OnShow()
    local currencies = API.MerchantData:GetAllCurrencies();
    if not currencies then
        self:Hide();
        return;
    end

    for _, currency in pairs(currencies.item) do
        self:AddItem(currency.link);
    end
end

function VI_ItemCurrencyListFrameMixin:OnHide()
    if MerchantFrame:IsShown() then
        VI_FrameToggleButton:SetMaximizeTextures();
    end

    self.ScrollView:Flush();
    self.DataProvider = CreateDataProvider();
    self.ScrollView:SetDataProvider(self.DataProvider);
end

function VI_ItemCurrencyListFrameMixin:AddItem(itemLink)
    local data = {
        ItemLink = itemLink,
    };
    self.DataProvider:Insert(data);
end

function VI_ItemCurrencyListFrameMixin:SortItems()
    self.DataProvider:SetSortComparator(function(a, b)
        return a.OwnedQuantity > b.OwnedQuantity;
    end);
end

------------

VI_FrameToggleButtonMixin = {};

function VI_FrameToggleButtonMixin:OnLoad()
end

function VI_FrameToggleButtonMixin:OnShow()
    if VI_ItemCurrencyListFrame:IsShown() then
        self:SetMinimizeTextures();
    else
        self:SetMaximizeTextures();
    end
end

function VI_FrameToggleButtonMixin:OnClick()
    local shown = VI_ItemCurrencyListFrame:IsShown();
    if shown then
        self:SetMaximizeTextures();
        VI_ItemCurrencyListFrame:Hide();
    else
        self:SetMinimizeTextures();
        VI_ItemCurrencyListFrame:Show();
    end
end

function VI_FrameToggleButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    GameTooltip:SetText("Toggle Item Currencies Display");
    GameTooltip:Show();
end

function VI_FrameToggleButtonMixin:OnLeave()
    GameTooltip:Hide();
end

function VI_FrameToggleButtonMixin:SetMaximizeTextures()
    self:SetNormalAtlas("RedButton-Expand");
    self:SetPushedAtlas("RedButton-Expand-Pressed");
    self:SetDisabledAtlas("RedButton-Expand-Disabled");
end

function VI_FrameToggleButtonMixin:SetMinimizeTextures()
    self:SetNormalAtlas("RedButton-Condense");
    self:SetPushedAtlas("RedButton-Condense-Pressed");
    self:SetDisabledAtlas("RedButton-Condense-Disabled");
end

------------