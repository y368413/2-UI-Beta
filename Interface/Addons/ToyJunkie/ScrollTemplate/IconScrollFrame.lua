local addonName, L = ...

local previousIcon = nil
local searchText = ""

IconScrollTemplateMixin = {}

local ItemListMixin = CreateFromMixins(CallbackRegistryMixin)
ItemListMixin:GenerateCallbackEvents(
    {
        "OnMouseDown"
    }
)

function ItemListMixin:OnLoad()
    CallbackRegistryMixin.OnLoad(self)
    
    self.icon1:SetScript("OnMouseDown", self.OnClick)
    self.icon2:SetScript("OnMouseDown", self.OnClick)
    self.icon3:SetScript("OnMouseDown", self.OnClick)
    self.icon4:SetScript("OnMouseDown", self.OnClick)
    self.icon5:SetScript("OnMouseDown", self.OnClick)
    self.icon6:SetScript("OnMouseDown", self.OnClick)
    self.icon7:SetScript("OnMouseDown", self.OnClick)
end

function ItemListMixin:OnClick(button)
    self:GetParent():TriggerEvent("OnMouseDown", self, button)
end

function ItemListMixin:Init(elementData)
    if(elementData[1] ~= -1) then
        self.icon1.texture:SetTexture(elementData[1])
        self.icon1:Show()
    else
        self.icon1:Hide()
    end
    if(elementData[2] ~= -1) then
        self.icon2.texture:SetTexture(elementData[2])
        self.icon2:Show()
    else
        self.icon2:Hide()
    end
    if(elementData[3] ~= -1) then
        self.icon3.texture:SetTexture(elementData[3])
        self.icon3:Show()
    else
        self.icon3:Hide()
    end
    if(elementData[4] ~= -1) then
        self.icon4.texture:SetTexture(elementData[4])
        self.icon4:Show()
    else
        self.icon4:Hide()
    end
    if(elementData[5] ~= -1) then
        self.icon5.texture:SetTexture(elementData[5])
        self.icon5:Show()
    else
        self.icon5:Hide()
    end
    if(elementData[6] ~= -1) then
        self.icon6.texture:SetTexture(elementData[6])
        self.icon6:Show()
    else
        self.icon6:Hide()
    end
    if(elementData[7] ~= -1) then
        self.icon7.texture:SetTexture(elementData[7])
        self.icon7:Show()
    else
        self.icon7:Hide()
    end
end

local ListMixin = {}
function ListMixin:OnLoad()
    CallbackRegistryMixin.OnLoad(self)
    self.scrollView = CreateScrollBoxListLinearView()
    self.scrollView:SetElementInitializer("TJ_IconSelector", GenerateClosure(self.OnElementInitialize, self))
    self.scrollView:SetElementResetter(GenerateClosure(self.OnElementReset, self));

    self.scrollBox = CreateFrame("Frame", nil, self, "WowScrollBoxList")
    self.scrollBox:SetPoint("TOPLEFT", 10, -50)
    self.scrollBox:SetPoint("BOTTOMRIGHT", -24, 30)

    self.scrollBar = CreateFrame("EventFrame", nil, self, "MinimalScrollBar")
    self.scrollBar:SetPoint("TOPLEFT", self.scrollBox, "TOPRIGHT", 8, 0)
    self.scrollBar:SetPoint("BOTTOMLEFT", self.scrollBox, "BOTTOMRIGHT", 8, 0)

    -- search bar
    self.searchBar = CreateFrame("EditBox", "$parent_SearchBar", L.AttachedFrame.IconSelectionFrame, "InputBoxTemplate")
    self.searchBar:SetPoint("TOPLEFT", 15, -17)
    self.searchBar:SetSize(250,40)
    self.searchBar:SetAutoFocus(false)
    self.searchBar:SetScript("OnTextChanged", function(self)
        if(self:GetText() == "") then
            self.Placeholder:Show()
        else
            self.Placeholder:Hide()
        end
        searchText = self:GetText()
        L.AttachedFrame.IconSelectionFrame.listView:Refresh()
    end)
    self.searchBar.Placeholder = self.searchBar:CreateFontString("SearchPlaceholder", "OVERLAY", "GameFontDisable")
    self.searchBar.Placeholder:SetText("Search icons")
    self.searchBar.Placeholder:SetPoint("LEFT", 0, 0)
    self.searchBar.Placeholder:SetAlpha(.5)
    self.searchBar.ClearButton = CreateFrame("Button", "$parent_ClearButton", self.searchBar)
    self.searchBar.ClearButton:SetSize(14,14)
    self.searchBar.ClearButton:SetNormalAtlas("Radial_Wheel_Icon_Close")
    self.searchBar.ClearButton:SetPoint("RIGHT", -4, 0)
    self.searchBar.ClearButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Clear search bar")
        GameTooltip:Show()
    end)
    self.searchBar.ClearButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    self.searchBar.ClearButton:SetScript("OnClick", function(self, button)
        self:GetParent():SetText("")
    end)

    -- Okay and cancel buttons
    self.SaveButton = CreateFrame("Button", "$parent_SaveButton", L.AttachedFrame.IconSelectionFrame, "UIPanelButtonTemplate")
    self.SaveButton:SetText("Save")
    self.SaveButton:SetPoint("BOTTOMLEFT", 12, 5)
    self.SaveButton:SetWidth(100)
    self.SaveButton:SetScript("OnClick", function(self)
        L.AttachedFrame.IconSelectionFrame:Hide()
        self:GetParent().listView.searchBar:SetText("")
        L.ToyboxFrame:RefreshToyBoxes()
    end)

    self.CancelButton = CreateFrame("Button", "$parent_CancelButton", L.AttachedFrame.IconSelectionFrame, "UIPanelButtonTemplate")
    self.CancelButton:SetText("Cancel")
    self.CancelButton:SetPoint("BOTTOMRIGHT", -10, 5)
    self.CancelButton:SetWidth(100)
    self.CancelButton:SetScript("OnClick", function(self)
        L.AttachedFrame.ScrollFrame:UpdateIcon(previousIcon)
        L.AttachedFrame.IconSelectionFrame:Hide()
        self:GetParent().listView.searchBar:SetText("")
    end)
    

    ScrollUtil.InitScrollBoxListWithScrollBar(self.scrollBox, self.scrollBar, self.scrollView)
end

function ListMixin:OnElementInitialize(element, elementData)
    if(not element.OnLoad) then
        Mixin(element, ItemListMixin)
        element:OnLoad()
    end

    element:Init(elementData)
    element:RegisterCallback("OnMouseDown", self.OnElementClicked, self)
end

function ListMixin:OnElementReset(element)
    element:UnregisterCallback("OnMouseDown", self)
end

function ListMixin:OnElementClicked(element, button)
    L.AttachedFrame.ScrollFrame:UpdateIcon(element.texture:GetTexture())
end

function ListMixin:Refresh()
    local iconTable = {}
    local data = CreateDataProvider()
    if(searchText == "") then
        iconTable = L.Icons
    else
        for k,v in pairs(L.Icons) do
            if(L:strContains(v.file, searchText)) then
                table.insert(iconTable, v)
            end
        end
    end

    for i=1, math.ceil(#iconTable / 7) do
        local start = ((i - 1) * 7) + 1
        local icons = {}

        for j=start, start + 6 do
            if(iconTable[j] ~= nil) then
                table.insert(icons, iconTable[j].id)
            else
                table.insert(icons, -1)
            end
        end
        data:InsertTable({icons})
    end
    self.scrollView:SetDataProvider(data, ScrollBoxConstants.RetainScrollPosition)
end

function ListMixin:GetDataProvider()
    if(self ~= nil) then
        return self.scrollView:GetDataProvider()
    end
end

function ListMixin:SetDataProvider(dataProvider)
    self.scrollView:SetDataProvider(dataProvider)
end

function IconScrollTemplateMixin:Refresh()
    self.listView:Refresh()
end

function IconScrollTemplateMixin:OnLoad()
    self.dataProvider = CreateDataProvider()
    self.listView = Mixin(CreateFrame("Frame", nil, self), ListMixin)
    self.listView:OnLoad()
    self.listView:SetDataProvider(self.dataProvider)
    self.listView:SetPoint("TOPLEFT")
    self.listView:SetPoint("BOTTOMRIGHT")
end

function IconScrollTemplateMixin:OnShow()
    if(not self.firstOpen) then
        self.firstOpen = true
        self:Refresh()
    end
    previousIcon = L.AttachedFrame.ScrollFrame:GetIcon()
end

IconScrollTemplateMixin.firstOpen = false
