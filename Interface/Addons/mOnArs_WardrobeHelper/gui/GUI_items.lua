local o = mOnWardrobe
local f = mOnWD_MainFrame

---------------------------------------------------------------
-- Initialization
---------------------------------------------------------------

local first = nil

---------------------------------------------------------------
--  Methods
---------------------------------------------------------------

local function createItemSlot(par, N)
	local but = CreateFrame("BUTTON", "$parentItem" .. N, par)
	but:SetWidth(37)
	but:SetHeight(37)
	but.id = N
	but.ItemID = nil
	but.SourceData = nil
	but.Link = nil
	but.Boss = nil
	but.Index = nil

	local t = but:CreateTexture(nil, "ARTWORK")
	t:SetAllPoints(but)
	t:SetTexture(1, 1, 1, 0.25)
	but.texture = t

	but:SetNormalTexture(t)
	but:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")

	but:SetScript(
		"OnEnter",
		function()
			GameTooltip_SetDefaultAnchor(GameTooltip, but)
			GameTooltip:ClearLines()
			if but.Link then
				GameTooltip:SetHyperlink(but.Link)
			else
				GameTooltip:SetItemByID(but.ItemID)
			end
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOMLEFT", but, "TOPLEFT")
			if (but.SourceData) then
				GameTooltip:AddLine(o.strings["Sources"] .. ":")
				for k = 1, #but.SourceData do
					GameTooltip:AddLine(but.SourceData[k])
				end
			end
			GameTooltip:Show()
		end
	)

	but:SetScript(
		"OnClick",
		function(self, button)
			local name, itemLink = GetItemInfo(self.ItemID)
			if (itemLink and button == "LeftButton" and IsModifiedClick("CHATLINK")) then
				ChatEdit_InsertLink(itemLink)
				return
			end

			if (itemLink and button == "LeftButton" and IsModifiedClick("DRESSUP") and DressUpFrame) then
				DressUpItemLink(itemLink)
				return
			end

			if (button == "LeftButton" and IsAltKeyDown()) then
				local found = false
				for i = 1, #mOnWDSave.blacklist do
					if mOnWDSave.blacklist[i] == self.ItemID then
						found = true
						break
					end
				end
				if found == false then
					table.insert(mOnWDSave.blacklist, self.ItemID)
				end
				o.refreshInstance(o.selection.itemList.instance)
				o.setDifficulty(o.selection.itemList.difficulty)
				o.GUIopenMiniList(nil, nil, nil, true)
				print(string.format(o.strings["Item added to blacklist"], itemLink .. "|cFFFF7D0A"))
			end
		end
	)

	but:SetScript(
		"OnLeave",
		function()
			GameTooltip:Hide()
		end
	)

	return but
end

o.refreshItemContent = function() 

	local selectedInstance = o.instances[o.selection.itemList.instance]

	if selectedInstance == nil then
		return
	end

	local scrollbar = mOnWD_MainFrame.ItemFrame.scrollbar
	local iframe = mOnWD_MainFrame.ItemFrame.contentFrame
	local bosses = o.instances[o.selection.itemList.instance]["difficulties"][o.selection.itemList.difficulty]["bosses"]

	local itemIconSize = 40
	local leftBuffer_item = 25
	local leftBuffer_bossName = 10

	for i = 1, #iframe.Bosses do
		if iframe.Bosses[i] then
			iframe.Bosses[i]:Hide()
			iframe.Bosses[i]:SetText("")
		end
	end

	for i = 1, #iframe.Items do
		if iframe.Items[i] then
			iframe.Items[i]:Hide()
			iframe.Items[i]:SetText("")
		end
	end

	local i = 1
	local top = 0

	local ordered_keys = {}

	if bosses == nil then
		return
	end

	local longestName = ""

	for k in pairs(bosses) do
		table.insert(ordered_keys, k)
		if string.len( k ) > string.len( longestName ) then
			longestName = k
		end
	end
	table.sort(ordered_keys)

	local textWidthTester = iframe:CreateFontString("sizeTestingStringFrame", "OVERLAY", "GameFontNormalLarge")
	textWidthTester:SetText(longestName)

	if(textWidthTester:GetStringWidth()	+ (leftBuffer_bossName * 2) > mOnWD_MainFrame.ItemFrame:GetWidth()) then
		mOnWD_MainFrame.ItemFrame:SetWidth(textWidthTester:GetStringWidth() + (leftBuffer_bossName * 2))
	end

	local maxItemsPerRow = math.floor((mOnWD_MainFrame.ItemFrame:GetWidth() - (leftBuffer_item*2)) / itemIconSize) 

	local item = 1
	local bossIndex = 0
	for i = 1, #ordered_keys do
		if #bosses[ordered_keys[i]]["items"] > 0 then
			bossIndex = bossIndex + 1
			if iframe.Bosses[bossIndex] == nil then
				iframe.Bosses[bossIndex] =
					iframe:CreateFontString("mOnWD_ItemFrame_Boss" .. bossIndex, "OVERLAY", "GameFontNormalLarge")
				iframe.Bosses[bossIndex]:SetWidth(400)
				iframe.Bosses[bossIndex]:SetHeight(0)
				iframe.Bosses[bossIndex]:SetJustifyH("LEFT")
			end
			iframe.Bosses[bossIndex]:SetText(ordered_keys[i])
			iframe.Bosses[bossIndex]:Show()
			iframe.Bosses[bossIndex]:SetPoint("TOPLEFT", iframe, "TOPLEFT", leftBuffer_bossName, top)
			top = top - iframe.Bosses[bossIndex]:GetHeight() - 10

			local currentItem = 0
			for j = 1, #bosses[ordered_keys[i]]["items"] do
				if currentItem >= maxItemsPerRow then
					currentItem = 0
					top = top - itemIconSize
				end
				local v = bosses[ordered_keys[i]]["items"][j]
				if iframe.Items[item] == nil then
					iframe.Items[item] = createItemSlot(iframe, item)
				end
				iframe.Items[item]:SetPoint("TOPLEFT", iframe, "TOPLEFT", leftBuffer_item + (currentItem * itemIconSize), top)
				GetItemInfo(v.id)
				iframe.Items[item].texture:SetTexture(GetItemIcon(v.id))
				iframe.Items[item].ItemID = v.id
				iframe.Items[item].SourceData = v.sourceData
				iframe.Items[item].Link = v.link
				iframe.Items[item].Boss = ordered_keys[i]
				iframe.Items[item].Index = j
				iframe.Items[item]:Show()
				currentItem = currentItem + 1
				item = item + 1
			end
			top = top - itemIconSize - 10
		end
	end

	scrollbar:SetMinMaxValues(1, math.max((-top + itemIconSize*2) - (mOnWD_MainFrame.ItemFrame:GetHeight()), 2))
	scrollbar:SetValue(0)

end

o.setDifficulty = function(difficulty)
	if o.instances[o.selection.itemList.instance] == nil then
		return
	end

	o.selection.itemList.difficulty = difficulty
	o.refreshItemContent()
end

local function clickDropdown(self)
	UIDropDownMenu_SetSelectedID(mOnWD_ItemFrame_DropDown, self:GetID())
	o.setDifficulty(self.value)
end

local function initDropdown(self, level)
	local i = 1
	for k, v in orderedPairs(o.instances[o.selection.itemList.instance]["difficulties"]) do
		if first == nil then
			first = k
		end
		local info = UIDropDownMenu_CreateInfo()
		info.text = k
		info.value = k
		info.func = clickDropdown
		mOnWD_MainFrame.ItemFrame.difficultyID[k] = i
		UIDropDownMenu_AddButton(info, level)
		i = i + 1
	end
end

o.GUIshowItems = function(instance)
	if mOnWDSave.hideList then
		mOnWD_MainFrame.ItemFrame:SetParent(UIParent)
		mOnWD_MainFrame:Hide()
	else
		mOnWD_MainFrame.ItemFrame:SetParent(mOnWD_MainFrame)
		mOnWD_MainFrame.ItemFrame:ClearAllPoints()
		mOnWD_MainFrame.ItemFrame:SetPoint("LEFT", mOnWD_MainFrame, "RIGHT", 5, 0)
	end

	first = nil
	mOnWD_MainFrame.ItemFrame:Show()
	mOnWD_MainFrame.ItemFrame.title:SetText(instance)
	o.selection.itemList.instance = instance
	mOnWD_MainFrame.ItemFrame.difficultyID = {}
	UIDropDownMenu_Initialize(mOnWD_ItemFrame_DropDown, initDropdown)
	UIDropDownMenu_SetSelectedID(mOnWD_ItemFrame_DropDown, 1)
	UIDropDownMenu_JustifyText(mOnWD_ItemFrame_DropDown, "LEFT")
	o.setDifficulty(first)
end

o.GUIcurrentInstance = function()
	local name, type, difficultyIndex, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, mapID = GetInstanceInfo()
	mOnWD_MainFrame.ItemFrame:Hide()
	local namesToTry = o.createInstanceNames(name)

	for i = 1, #namesToTry do
		local name = namesToTry[i]
		if o.instances[name] then
			if mOnWDSave.onlyMiniList then
				local diff = "#first"
				if o.instances[name]["difficulties"][difficultyName] then
					diff = difficultyName
				end
				o.GUIopenMiniList(1, name, diff)
			else
				o.GUIshowItems(name)
				if o.instances[name]["difficulties"][difficultyName] then
					o.setDifficulty(difficultyName)
					UIDropDownMenu_SetSelectedID(mOnWD_ItemFrame_DropDown, mOnWD_MainFrame.ItemFrame.difficultyID[difficultyName])
				end
			end
			return
		end
	end
end

---------------------------------------------------------------
--  Create UI
---------------------------------------------------------------

local ff = CreateFrame("Frame", nil, f, "BackdropTemplate")
f.ItemFrame = ff
ff:Hide()
ff:SetWidth(532)
ff:SetHeight(512)
ff:SetPoint("LEFT", f, "RIGHT", 5, 0)
local h = ff:CreateTexture(nil, "ARTWORK")
h:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
h:SetWidth(400)
h:SetHeight(68)
h:SetPoint("TOP", 0, 12)
ff:SetMovable(true)
ff:SetResizable(true)
ff:EnableMouse(true)
ff:SetResizeBounds(315, 165)
ff:SetClampedToScreen(true)
ff:RegisterForDrag("LeftButton")
ff:SetScript("OnDragStart", ff.StartMoving)
ff:SetScript("OnDragStop", ff.StopMovingOrSizing)

ff.HeaderTexture = h
ff.title = ff:CreateFontString(nil, "ARTWORK", "GameFontNormal")
ff.title:SetPoint("TOP", h, "TOP", 0, -15)
ff.title:SetText("")

ff:SetBackdrop(
	{
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		tile = true,
		tileSize = 32,
		edgeSize = 32,
		insets = {left = 11, right = 12, top = 12, bottom = 11}
	}
)
 
-- Set up the main frame here
 
local resizeButton = CreateFrame("Button", nil, ff)
resizeButton:SetSize(16, 16)
resizeButton:SetPoint("BOTTOMRIGHT")
resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
 
resizeButton:SetScript("OnMouseDown", function(self, button)
    ff:StartSizing("BOTTOMRIGHT")
    ff:SetUserPlaced(true)
end)
 
resizeButton:SetScript("OnMouseUp", function(self, button)
	ff:StopMovingOrSizing()
	o.refreshInstance(o.selection.itemList.instance)
	o.refreshItemContent()
end)


local b = CreateFrame("Button", nil, ff, "UIPanelCloseButton")
b:SetPoint("TOPRIGHT", ff, "TOPRIGHT", 8, 8)
b:SetScript(
	"OnClick",
	function()
		ff:Hide()
		f:Hide()
	end
)

local b = CreateFrame("BUTTON")
ff.bHide = b
b:SetParent(ff)
b:SetWidth(30)
b:SetHeight(30)
b:SetFrameStrata("DIALOG")
b:SetPoint("BOTTOMLEFT", ff, "BOTTOMLEFT", 10, 10)
b:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up.bpl")
b:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down.bpl")
b:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled.bpl")
b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight.bpl", "ADD")
b:SetScript(
	"OnClick",
	function()
		ff:Hide()
		mOnWD_MainFrame:Show()
	end
)

local b = CreateFrame("BUTTON", "mOnWD_ItemFrame_bMiniList", ff, "UIPanelButtonTemplate")
ff.bMiniList = b
b:SetParent(ff)
b:SetHeight(25)
b:SetWidth(110)
b:SetPoint("BOTTOMLEFT", ff, "BOTTOMLEFT", 170, 14)
b:SetText(o.strings["Open MiniList"])
b:SetScript(
	"OnClick",
	function()
		o.GUIopenMiniList(1, o.selection.itemList.instance, o.selection.itemList.difficulty)
	end
)

local scrollframe = CreateFrame("ScrollFrame", nil, ff)
scrollframe:SetPoint("TOPLEFT", 10, -40)
scrollframe:SetPoint("BOTTOMRIGHT", -10, 40)
ff.scrollframe = scrollframe

local scrollbar = CreateFrame("Slider", nil, scrollframe, "UIPanelScrollBarTemplate")
scrollbar:SetPoint("TOPLEFT", ff, "TOPRIGHT", -30, -35)
scrollbar:SetPoint("BOTTOMLEFT", ff, "BOTTOMRIGHT", -30, 35)
scrollbar:SetMinMaxValues(1, 10000)
scrollbar:SetValueStep(1)
scrollbar.scrollStep = 1
scrollbar:SetValue(0)
scrollbar:SetWidth(15)
scrollbar:SetScript(
	"OnValueChanged",
	function(self, value)
		self:GetParent():SetVerticalScroll(value)
	end
)
ff.scrollbar = scrollbar

local content = CreateFrame("Frame", nil, scrollframe)
content:SetSize(128, 128)
scrollframe.content = content

ff.contentFrame = content

scrollframe:SetScrollChild(content)
ff.contentFrame.Bosses = {}
ff.contentFrame.Items = {}

ff:EnableMouseWheel(true)
ff:SetScript(
	"OnMouseWheel",
	function(self, delta)
		scrollbar:SetValue(scrollbar:GetValue() - delta * 20)
	end
)

local fd = CreateFrame("Button", "mOnWD_ItemFrame_DropDown", ff, "UIDropDownMenuTemplate")
fd:ClearAllPoints()
UIDropDownMenu_SetWidth(fd, 90)
fd:SetPoint("BOTTOMLEFT", ff, 20, 8)
fd:Show()

local b = CreateFrame("BUTTON", "mOnWD_ItemFrame_bRefresh", ff)
ff.bRefresh = b
b:SetParent(ff)
b:SetWidth(35)
b:SetHeight(35)
b:SetFrameStrata("DIALOG")
b:SetPoint("BOTTOMLEFT", ff, "BOTTOMLEFT", 140, 8)
b:SetNormalTexture("Interface\\BUTTONS\\UI-RotationRight-Button-Up")
b:SetPushedTexture("Interface\\BUTTONS\\UI-RotationRight-Button-Down")
b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight.bpl", "ADD")
b:SetScript(
	"OnClick",
	function()
		o.refreshInstance(o.selection.itemList.instance)
		o.refreshItemContent()
	end
)

local b = CreateFrame("Button", nil, ff)
ff.tutorial = b
b:SetPoint("TOPLEFT", ff, 10, 10)
b:SetWidth(40)
b:SetHeight(40)
b:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
local t = b:CreateTexture(nil, "BACKGROUND")
t.BG = t
t:SetTexture("Interface\\common\\help-i")
t:SetAllPoints(b)
b:SetScript(
	"OnEnter",
	function()
		GameTooltip_SetDefaultAnchor(GameTooltip, b)
		GameTooltip:ClearLines()
		GameTooltip:ClearAllPoints()
		GameTooltip:SetPoint("BOTTOMLEFT", b, "TOPLEFT")
		GameTooltip:AddLine(o.strings["Help"])
		GameTooltip:AddDoubleLine(
			o.strings["Shift"] .. " + " .. o.strings["Left Click"],
			o.strings["Item Shift LeftClick Help"]
		)
		GameTooltip:AddDoubleLine(
			o.strings["Ctrl"] .. " + " .. o.strings["Left Click"],
			o.strings["Item Ctrl LeftClick Help"]
		)
		GameTooltip:AddDoubleLine(o.strings["Alt"] .. " + " .. o.strings["Left Click"], o.strings["Item Alt LeftClick Help"])
		GameTooltip:Show()
	end
)
b:SetScript(
	"OnLeave",
	function()
		GameTooltip:Hide()
	end
)