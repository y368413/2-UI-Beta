local myname, ns = ...

local inv = LibStub("AceAddon-3.0"):GetAddon("Inventorian")

local original_FrameCreate = inv.Frame.Create
inv.Frame.Create = function(self, ...)
	local frame = original_FrameCreate(self, ...)

	local presets = CreateFrame("Button", nil, frame) --, "UIPanelButtonTemplate")
	presets:SetSize(32, 32)
	presets:SetPoint("TOPLEFT", 64, -27)
	presets:RegisterForClicks("anyUp")

	presets.Icon = presets:CreateTexture(nil, "BACKGROUND")
	presets.Icon:SetAtlas('bags-icon-tradegoods')
	presets.Icon:SetSize(32, 32)
	presets.Icon:SetPoint("TOPLEFT", 0, 0)
	presets.Border = presets:CreateTexture(nil, "ARTWORK")
	presets.Border:SetTexture([[Interface\Minimap\MiniMap-TrackingBorder]])
	presets.Border:SetSize(54, 54)
	presets.Border:SetPoint("TOPLEFT")
	presets.Border:SetDesaturated(true)
	presets.Border:SetAlpha(0.8)
	presets:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]], "ADD")

	-- Base inventorian is: 75, -32
	frame.SearchBox:SetPoint("TOPLEFT", 75 + (32 + 2), -32)

	local doSearch = function(_, search)
		CloseDropDownMenus(1)
		frame.SearchBox:SetText(search)
	end

	local searchItem = function(text, search)
		return {
			text = text,
			func = doSearch,
			arg1 = search,
			notCheckable = true,
		}
	end

	local dropdown = CreateFrame("Frame", myname.."DropdownMenu", nil, "UIDropDownMenuTemplate")
	local divider = {text = "---------", disabled = true}
	local qualities = {}
	for i = 0, #ITEM_QUALITY_COLORS - 1 do
		qualities[i] = searchItem(ITEM_QUALITY_COLORS[i].hex .. _G['ITEM_QUALITY' .. i .. '_DESC'], 'quality:' .. _G['ITEM_QUALITY' .. i .. '_DESC']:lower())
	end
	local menu = {
		{
			isTitle = true,
			text = "Search Presets",
			notCheckable = true,
		},
		{
			text = "Quality",
			hasArrow = true,
			notCheckable = true,
			menuList = qualities,
		},
		{
			text = "Bound",
			hasArrow = true,
			notCheckable = true,
			menuList = {
				-- Can't search for "is currently soulbound", because it's scanning itemlinks, not the actual container-items
				-- searchItem(ITEM_SOULBOUND, ITEM_SOULBOUND),
				searchItem(ITEM_BIND_ON_PICKUP, "bind:bop"),
				searchItem(ITEM_BIND_ON_EQUIP, "bind:boe"),
				searchItem(ITEM_BIND_TO_BNETACCOUNT, "bind:boa"),
				searchItem(ITEM_BIND_ON_USE, "bind:bou"),
			},
		},
		{
			text = "Type",
			hasArrow = true,
			notCheckable = true,
			menuList = {
				searchItem(BAG_FILTER_EQUIPMENT, "type:" ..  GetItemClassInfo(LE_ITEM_CLASS_ARMOR):lower() .. '||' .. 'type:' .. GetItemClassInfo(LE_ITEM_CLASS_WEAPON):lower()),
				searchItem(GetItemClassInfo(LE_ITEM_CLASS_ARMOR), "type:" .. GetItemClassInfo(LE_ITEM_CLASS_ARMOR):lower()),
				searchItem(GetItemClassInfo(LE_ITEM_CLASS_WEAPON), "type:" .. GetItemClassInfo(LE_ITEM_CLASS_WEAPON):lower()),
				searchItem(GetItemClassInfo(LE_ITEM_CLASS_CONSUMABLE), "type:" .. GetItemClassInfo(LE_ITEM_CLASS_CONSUMABLE):lower()),
				divider,
				searchItem(PROFESSIONS_USED_IN_COOKING, PROFESSIONS_USED_IN_COOKING:lower()),
				searchItem(ITEM_BIND_QUEST, "bind:quest"),
				searchItem(ITEM_UNIQUE, "bind:unique"),
				searchItem(TOY, "desc:toy"),
				divider,
				searchItem(ARTIFACT_POWER, "desc:artifact power"),
				searchItem("Champion Equipment", "desc:champion equipment"),
			},
		},
		{
			text = "Required level",
			hasArrow = true,
			notCheckable = true,
			menuList = {
				{
					text = "Can use",
					func = function(self) doSearch(self, 'reqlvl:<=' .. UnitLevel('player')) end,
					notCheckable = true,
				},
				{
					text = "Can't use",
					func = function(self) doSearch(self, 'reqlvl:>' .. UnitLevel('player')) end,
					notCheckable = true,
				},
			},
		},
		searchItem("In Equipment Set", "set:*"),
	}
	
	presets:SetScript("OnClick", function(self, button)
		if button ~= "LeftButton" then
			return
		end
		EasyMenu(menu, dropdown, presets, 0, 0, "MENU")
	end)

	return frame
end
