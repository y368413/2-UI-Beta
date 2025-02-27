local addonName, L = ...

local searchText = ""

L.ToyboxSelectionTemplateMixin = {}

local ItemListMixin = CreateFromMixins(CallbackRegistryMixin)
ItemListMixin:GenerateCallbackEvents(
    {
        "OnMouseDown"
    }
)

function ItemListMixin:OnLoad()
    CallbackRegistryMixin.OnLoad(self)
    self:SetScript("OnMouseDown", self.OnClick)
end

function ItemListMixin:OnClick(button)
    self:TriggerEvent("OnMouseDown", self, button)
end

function ItemListMixin:Init(elementData)
    self.Text:SetText(elementData.name)
    self.Icon:SetTexture(elementData.icon)
    if(elementData.name == L.ToyJunkie.db.profile.selectedToybox) then
        self:SetAlpha(.5)
        self.disabled = true
    else
        self:SetAlpha(1)
        self.disabled = false
    end
end

local ListMixin = {}
function ListMixin:OnLoad()
    CallbackRegistryMixin.OnLoad(self)
    self.scrollView = CreateScrollBoxListLinearView()
    self.scrollView:SetElementInitializer("TJ_ToyboxSelectorTemplate", GenerateClosure(self.OnElementInitialize, self))
    self.scrollView:SetElementResetter(GenerateClosure(self.OnElementReset, self))

    self.scrollBox = CreateFrame("Frame", nil, self, "WowScrollBoxList")
    self.scrollBox:SetPoint("TOPLEFT", 2, -2)
    self.scrollBox:SetPoint("BOTTOMRIGHT", -2, 2)

    self.scrollBar = CreateFrame("EventFrame", nil, self, "MinimalScrollBar")
    self.scrollBar:SetPoint("TOPLEFT", self.scrollBox, "TOPRIGHT", 8, 0)
    self.scrollBar:SetPoint("BOTTOMLEFT", self.scrollBox, "BOTTOMRIGHT", 8, 0)

    self.searchBar = CreateFrame("EditBox", "$parent_SearchBar", self, "InputBoxTemplate")
    self.searchBar:SetPoint("TOPRIGHT", 0, 25)
    self.searchBar:SetSize(85,25)
    self.searchBar:SetAutoFocus(false)
    self.searchBar:SetFont("Fonts\\ARIALN.TTF", 12, "MONOCHROME")
    self.searchBar:SetScript("OnTextChanged", function(self)
        if(self:GetText() == "") then
            self.Placeholder:Show()
        else
            self.Placeholder:Hide()
        end
        searchText = self:GetText()
        self:GetParent():Refresh()
    end)

    self.searchBar.Placeholder = self.searchBar:CreateFontString("SearchPlaceholder", "OVERLAY", "GameFontDisable")
    self.searchBar.Placeholder:SetText("Search")
    self.searchBar.Placeholder:SetPoint("LEFT", 0, 0)
    self.searchBar.Placeholder:SetAlpha(.5)
    self.searchBar.ClearButton = CreateFrame("Button", "$parent_ClearButton", self.searchBar)
    self.searchBar.ClearButton:SetSize(14, 14)
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
    self.searchBar:SetScale(.85)
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
    local data = element:GetData()
    if(button == "LeftButton" and not element.disabled) then
        L.ToyJunkie.db.profile.selectedToybox = data.name
        L.ToyboxFrame:UpdateToyboxDisplay()
        L.ToyboxFrame:UpdateToyButtons()
        L.ToyboxFrame:SelectNewRandomToy()
    end
end

function ListMixin:Refresh()
    local data = CreateDataProvider()
    for id, toyBox in pairs(L.ToyJunkie.db.profile.boxes) do
        local excludeToybox = false
        if(searchText ~= "") then
            if(not L:strContains(toyBox.name, searchText)) then
                excludeToybox = true
            end
        end
        if(not excludeToybox) then
            data:InsertTable({
                {
                    name = toyBox.name,
                    icon = toyBox.icon
                }
            })
        end
    end
    self.scrollView:SetDataProvider(data)
end

function ListMixin:GetDataProvider()
    if (self ~= nil) then
        return self.scrollView:GetDataProvider()
    end
end

function ListMixin:SetDataProvider(dataProvider)
    self.scrollView:SetDataProvider(dataProvider)
end

function L.ToyboxSelectionTemplateMixin:OnLoad()
    self.dataProvider = CreateDataProvider()
    self.listView = Mixin(CreateFrame("Frame", nil, self), ListMixin)
    self.listView:OnLoad()
    self.listView:SetDataProvider(self.dataProvider)
    self.listView:SetPoint("TOPLEFT")
    self.listView:SetPoint("BOTTOMRIGHT")
end
