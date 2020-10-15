local myname, ns = ...

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon(myname, "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(myname, true)
ns.HL = HL

local debugf = tekDebug and tekDebug:GetFrame(myname:gsub("HandyNotes_", ""))
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end
ns.Debug = Debug

local next = next
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes
local GetItemInfo = GetItemInfo
local GetAchievementInfo = GetAchievementInfo
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo
local GetAchievementCriteriaInfoByID = GetAchievementCriteriaInfoByID
local GetCurrencyInfo = GetCurrencyInfo

local gl = GetLocale()
NPC_Name_CacheDB = NPC_Name_CacheDB or {}
Item_Name_CacheDB = Item_Name_CacheDB or {}

local ARTIFACT_LABEL = '|cffff8000' .. ARTIFACT_POWER .. '|r'

local cache_tooltip = CreateFrame("GameTooltip", "HN_BFA_HF_TrackerTooltip")
cache_tooltip:AddFontStrings(
    cache_tooltip:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
    cache_tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
)

function ns.mob_name(id, npcLine)
	if npcLine == 2 then name = id.."_2"; elseif npcLine == 3 then name = id.."_3"; else name = id; end
	if NPC_Name_CacheDBtemp[gl] and NPC_Name_CacheDBtemp[gl][name] then
		return NPC_Name_CacheDBtemp[gl][name]
    elseif (not NPC_Name_CacheDBtemp[gl] or not NPC_Name_CacheDBtemp[gl][name]) and (not NPC_Name_CacheDB[gl] or not NPC_Name_CacheDB[gl][name]) then
        NPC_Name_CacheDB[gl] = NPC_Name_CacheDB[gl] or {}
		local TextLeft1, TextLeft2, TextLeft3
		cache_tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
        cache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
		if HN_BFA_HF_TrackerTooltipTextLeft1 then TextLeft1 = HN_BFA_HF_TrackerTooltipTextLeft1:GetText() end
		--local TextLeft1 = HN_BFA_HF_TrackerTooltipTextLeft1:GetText()
		if HN_BFA_HF_TrackerTooltipTextLeft2 then TextLeft2 = HN_BFA_HF_TrackerTooltipTextLeft2:GetText() end
		--local TextLeft2 = HN_BFA_HF_TrackerTooltipTextLeft2:GetText()
		if HN_BFA_HF_TrackerTooltipTextLeft3 then TextLeft3 = HN_BFA_HF_TrackerTooltipTextLeft3:GetText() end
		--local TextLeft3 = HN_BFA_HF_TrackerTooltipTextLeft3:GetText()
        if cache_tooltip:IsShown() then
			if npcLine == 3 and TextLeft2 and TextLeft3 then
				NPC_Name_CacheDB[gl][id.."_3"] = TextLeft1.."\n|cFFFFFFFF"..TextLeft2.."\n"..TextLeft3.."|r"
			elseif npcLine and npcLine >= 2 and TextLeft2 then
				NPC_Name_CacheDB[gl][id.."_2"] = TextLeft1.."\n|cFFFFFFFF"..TextLeft2.."|r"
			elseif TextLeft1 then
				NPC_Name_CacheDB[gl][name] = TextLeft1
			else
				return UNKNOWN
			end
        end
    end
    return NPC_Name_CacheDB[gl][name]
end
------------------ Function nameItemID --------------------
function ns.nameItemID(itemId, bag)
	local itemName, itemLink
	if Item_Name_CacheDBtemp[gl] and Item_Name_CacheDBtemp[gl][itemId] then
		itemName = Item_Name_CacheDBtemp[gl][itemId]["name"]
		itemLink = Item_Name_CacheDBtemp[gl][itemId]["link"]
	elseif Item_Name_CacheDB[gl] and Item_Name_CacheDB[gl][itemId] then
		itemName = Item_Name_CacheDB[gl][itemId]["name"]
		itemLink = Item_Name_CacheDB[gl][itemId]["link"]
	else
		itemName, itemLink = GetItemInfo(itemId)
		if itemName and itemLink then
			Item_Name_CacheDB[gl] = Item_Name_CacheDB[gl] or {}
			Item_Name_CacheDB[gl][itemId] = Item_Name_CacheDB[gl][itemId] or {}
			Item_Name_CacheDB[gl][itemId]["name"] = itemName
			Item_Name_CacheDB[gl][itemId]["link"] = itemLink
		end
	end
	if bag == "bag" and itemName then
		for bag = BACKPACK_CONTAINER,NUM_BAG_SLOTS,1 do
			for slot = 1,GetContainerNumSlots(bag),1 do
				local ID = GetContainerItemID(bag,slot)
				if ID == itemId then
					return "|cFF00FF00"..itemName.."|r" -- vert
				end
			end
		end
		return "|cFFFF0000"..itemName.."|r" -- rouge
	elseif bag == "link" and itemLink then
		return itemLink
	elseif itemName then
		return itemName
	else
		return UNKNOWN
	end
end
------------------ Function icons -------------------------
local default_texture, npc_texture, follower_texture, currency_texture, junk_texture
local icon_cache = {}
local trimmed_icon = function(texture)
    if not icon_cache[texture] then
        icon_cache[texture] = {
            icon = texture,
            tCoordLeft = 0.1,
            tCoordRight = 0.9,
            tCoordTop = 0.1,
            tCoordBottom = 0.9,
        }
    end
    return icon_cache[texture]
end
local atlas_texture = function(atlas, scale)
    local texture, _, _, left, right, top, bottom = GetAtlasInfo(atlas)
    return {
        icon = texture,
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
        scale = scale or 1,
    }
end
local atlas_perso = function(texture, scale)
    return {
        icon = texture,
        scale = scale or 1,
    }
end
------------------ Function Buy items -----------------------
local function tooltipBuy(buy)
	local buy_2
	local buyItems
	if type(buy) == 'table' then
		if not buy.item or not buy.npc then return end
		if buy.bag then bag = buy.bag; else bag = "bag"; end
		if buy.to and type(buy.to) == 'string' then to = buy.to; else to = ""; end
		if type(buy.item) == 'table' then
			if #buy.item == 2 then
				buyItems = "\n"..ns.nameItemID(buy.item[1], bag).."\n"..ns.nameItemID(buy.item[2], bag).."\n"
			elseif #buy.item == 3 then
				buyItems = "\n"..ns.nameItemID(buy.item[1], bag).."\n"..ns.nameItemID(buy.item[2], bag).."\n"..ns.nameItemID(buy.item[3], bag).."\n"
			elseif #buy.item == 4 then
				buyItems = "\n"..ns.nameItemID(buy.item[1], bag).."\n"..ns.nameItemID(buy.item[2], bag).."\n"..ns.nameItemID(buy.item[3], bag).."\n"..ns.nameItemID(buy.item[4], bag).."\n"
			elseif #buy.item == 5 then
				buyItems = "\n"..ns.nameItemID(buy.item[1], bag).."\n"..ns.nameItemID(buy.item[2], bag).."\n"..ns.nameItemID(buy.item[3], bag).."\n"..ns.nameItemID(buy.item[4], bag).."\n"..ns.nameItemID(buy.item[5], bag).."\n"
			elseif #buy.item == 6 then
				buyItems = "\n"..ns.nameItemID(buy.item[1], bag).."\n"..ns.nameItemID(buy.item[2], bag).."\n"..ns.nameItemID(buy.item[3], bag).."\n"..ns.nameItemID(buy.item[4], bag).."\n"..ns.nameItemID(buy.item[5], bag).."\n"..ns.nameItemID(buy.item[6], bag).."\n"
			end
		else
			buyItems = ns.nameItemID(buy.item, bag)
		end
		buy_2 = format(L["Buy %s from %s "], buyItems, ns.mob_name(buy.npc))..to;
		return buy_2
	end
	if buy == 13087 then
		buy_2 = format(L["Buy %s from %s "], "\n"..ns.nameItemID(155812, "bag").."\n"..ns.nameItemID(155811, "bag").."\n"..ns.nameItemID(155813, "bag").."\n"..ns.nameItemID(155814, "bag").."\n", ns.mob_name(128467)).."\n"..format(L["Use Cooking for %s"], "\n"..ns.nameItemID(163781, "bag"));
	elseif buy == 130872 then
		buy_2 = format(L["Buy %s from %s "], "\n"..ns.nameItemID(163110, "bag").."\n", ns.mob_name(136655)).."\n"..format(L["Use Cooking for %s"], "\n"..ns.nameItemID(163781, "bag"));
	elseif buy == 130873 then
		buy_2 = format(L["The recipe %s and loot on %s to Waycrest Manor"], "\n"..ns.nameItemID(163833, "link").."\n", ns.mob_name(131863));
	end
	return buy_2
end
-------------------------------------------------------------
local function tooltipNote2(note2)
	local note_2
	if type(note2) == 'table' then
		if not note2.text then return end
		note_2 = note2.text..ns.mob_name(note2.npc)
	else
		note_2 = note2
	end
	return note_2
end
-------------------------------------------------------------
local function work_out_label(point, npcLine)
    local fallback
	local force
    if point.label and type(point.label) == "string" then
        return point.label
	elseif point.label and type(point.label) == "number" then
		force = point.label
    end
	if (point.npc and not force) or (point.npc and force == 1) then
        local name = ns.mob_name(point.npc, npcLine)
        if name then
            return name
        end
        fallback = 'npc:'..point.npc
    end
    if (point.achievement and point.criteria and not force) or (point.achievement and point.criteria and force == 2) then
		if type(point.criteria) ~= 'table' then
			local criteria = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
			if criteria then
				return criteria
			end
			fallback = 'achievement:'..point.achievement..'.'..point.criteria
		end
    end
    if (point.follower and not force) or (point.follower and force == 3) then
        local follower = C_Garrison.GetFollowerInfo(point.follower)
        if follower then
            return follower.name
        end
        fallback = 'follower:'..point.follower
    end
    if (point.item and not force) or (point.item and force == 4) then
        local _, link, _, _, _, _, _, _, _, texture = GetItemInfo(point.item)
        if link then
            return link
        end
        fallback = 'item:'..point.item
    end
    if (point.currency and not force) or (point.currency and force == 5) then
        if point.currency == 'ARTIFACT' then
            return ARTIFACT_LABEL
        end
        local name, _, texture = GetCurrencyInfo(point.currency)
        if name then
            return name
        end
    end
    return fallback or UNKNOWN
end

local function work_out_texture(point)
	local default_texture
	if not point.scale then
		point.scale = 1
	end
    if point.atlas then
        if not icon_cache[point.atlas] then
            icon_cache[point.atlas] = atlas_texture(point.atlas, point.scale)
        end
        return icon_cache[point.atlas]
    end
	if point.atlasHf then
		local texture = point.atlasHf
		if texture then
			return atlas_perso(texture, point.scale)
		end
	end
    if ns.db.icon_item then
        if point.item then
            local texture = select(10, GetItemInfo(point.item))
            if texture then
                return trimmed_icon(texture)
            end
        end
        if point.currency then
            if point.currency == 'ARTIFACT' then
                local texture = select(10, GetAchievementInfo(11144))
                if texture then
                    return trimmed_icon(texture)
                end
            else
                local texture = select(3, GetCurrencyInfo(point.currency))
                if texture then
                    return trimmed_icon(texture)
                end
            end
        end
        if point.achievement then
            local texture = select(10, GetAchievementInfo(point.achievement))
            if texture then
                return trimmed_icon(texture)
            end
        end
    else
        if point.currency then
            if not currency_texture then
                currency_texture = atlas_texture("VignetteLoot", point.scale*1.5)
            end
            return currency_texture
        end
    end
	------------- Hauts Faits ------------
	if point.hf then
		if ns.db.icon_item_hf then
			if point.item then
				local texture = select(10, GetItemInfo(point.item))
				if texture then
					return trimmed_icon(texture)
				end
			elseif point.achievement then
				local texture = select(10, GetAchievementInfo(point.achievement))
				if texture then
					return trimmed_icon(texture)
				end
			end
		end
		local texture = "Interface\\Addons\\"..myname.."\\Icons\\Achievement"
		default_texture = atlas_perso(texture, point.scale)
	end
	--------------------------------------
    if point.follower then
        if not follower_texture then
            follower_texture = atlas_texture("GreenCross", point.scale*1.5)
        end
        return follower_texture
    end
    if point.npc then
        if not npc_texture then
            npc_texture = atlas_texture("DungeonSkull", point.scale)
        end
        return npc_texture
    end
    if point.junk then
        if not junk_texture then
            junk_texture = atlas_texture("VignetteLoot", point.scale*1.5)
        end
        return junk_texture
    end
    if not default_texture then
        default_texture = atlas_texture("Garr_TreasureIcon", point.scale*2)
    end
    return default_texture
end

local get_point_info = function(point)
    if point then
        local label = work_out_label(point)
        local icon = work_out_texture(point)
        local category = "treasure"
        if point.npc then
            category = "npc"
        elseif point.junk then
            category = "junk"
		elseif point.hf then
            category = "achievement"
        end
        return label, icon, category, point.quest, point.faction, point.scale, point.alpha or 1
    end
end

local get_point_info_by_coord = function(uiMapID, coord)
    return get_point_info(ns.points[uiMapID] and ns.points[uiMapID][coord])
end

local function handle_tooltip(tooltip, point)
    if point then
        -- major:
        tooltip:AddLine(work_out_label(point, point.npcLine or 2))
        if point.follower then
            local follower = C_Garrison.GetFollowerInfo(point.follower)
            if follower then
                local quality = BAG_ITEM_QUALITY_COLORS[follower.quality]
                tooltip:AddDoubleLine(REWARD_FOLLOWER, follower.name,
                    0, 1, 0,
                    quality.r, quality.g, quality.b
                )
                tooltip:AddDoubleLine(follower.className, UNIT_LEVEL_TEMPLATE:format(follower.level))
            end
        end
        if point.currency then
            local name
            if point.currency == 'ARTIFACT' then
                name = ARTIFACT_LABEL
            else
                name = GetCurrencyInfo(point.currency)
            end
            tooltip:AddDoubleLine(CURRENCY, name or point.currency)
        end
        if point.achievement then
            local _, name, _, complete = GetAchievementInfo(point.achievement)
            tooltip:AddDoubleLine(BATTLE_PET_SOURCE_6, name or point.achievement,
                nil, nil, nil,
                complete and 0 or 1, complete and 1 or 0, 0
            )
            if point.criteria then
				if type(point.criteria) == 'table' then
					for _, criterias in ipairs(point.criteria) do
						local criteria, _, complete = GetAchievementCriteriaInfoByID(point.achievement, criterias)
						tooltip:AddDoubleLine(" ", criteria,
							nil, nil, nil,
							complete and 0 or 1, complete and 1 or 0, 0
						)
					end
				else
					local criteria, _, complete = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
					tooltip:AddDoubleLine(" ", criteria,
						nil, nil, nil,
						complete and 0 or 1, complete and 1 or 0, 0
					)
				end
            end
        end
		if point.requireItem then
			local isBag = point.requireItem[1]
			for i=1, #point.requireItem do
				local id = point.requireItem[i]
				if type(id) == "number" then
					tooltip:AddLine(L["Require item : "]..ns.nameItemID(id, isBag), nil, nil, nil, false)
				end
			end
		end
		if point.note then
			tooltip:AddLine(point.note, nil, nil, nil, true)
        end
		if point.note2 then
			--tooltip:AddLine(point.note2, nil, nil, nil, true)
			tooltip:AddLine(tooltipNote2(point.note2), nil, nil, nil, true)
        end
		if point.buy then
			tooltip:AddLine(tooltipBuy(point.buy), nil, nil, nil, true)
        end
		if point.npc and ns.db.tooltip_npcid then
			tooltip:AddDoubleLine("NPC ID :", point.npc or UNKNOWN)
		end
        if point.quest and ns.db.tooltip_questid then
            local quest = point.quest
            if type(quest) == 'table' then
                quest = string.join(", ", unpack(quest))
            end
			tooltip:AddDoubleLine("QuestID :", quest or UNKNOWN)
        end

        if (ns.db.tooltip_item or IsShiftKeyDown()) and (point.item or point.npc) then
            local comparison = ShoppingTooltip1

            do
                local side
                local rightDist = 0
                local leftPos = tooltip:GetLeft() or 0
                local rightPos = tooltip:GetRight() or 0

                rightDist = GetScreenWidth() - rightPos

                if (leftPos and (rightDist < leftPos)) then
                    side = "left"
                else
                    side = "right"
                end

                -- see if we should slide the tooltip
                if tooltip:GetAnchorType() and tooltip:GetAnchorType() ~= "ANCHOR_PRESERVE" then
                    local totalWidth = 0
                    if ( primaryItemShown  ) then
                        totalWidth = totalWidth + comparison:GetWidth()
                    end

                    if ( (side == "left") and (totalWidth > leftPos) ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), (totalWidth - leftPos), 0)
                    elseif ( (side == "right") and (rightPos + totalWidth) >  GetScreenWidth() ) then
                        tooltip:SetAnchorType(tooltip:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0)
                    end
                end

                comparison:SetOwner(tooltip, "ANCHOR_NONE")
                comparison:ClearAllPoints()

                if ( side and side == "left" ) then
                    comparison:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", 0, -10)
                else
                    comparison:SetPoint("TOPLEFT", tooltip, "TOPRIGHT", 0, -10)
                end
            end

            if point.item then
                comparison:SetHyperlink(("item:%d"):format(point.item))
            elseif point.npc then
                comparison:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(point.npc))
            end
            comparison:Show()
        end
    else
        tooltip:SetText(UNKNOWN)
    end
    tooltip:Show()
end
local handle_tooltip_by_coord = function(tooltip, uiMapID, coord)
    return handle_tooltip(tooltip, ns.points[uiMapID] and ns.points[uiMapID][coord])
end

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HLHandler = {}
local info = {}

function HLHandler:OnEnter(uiMapID, coord)
    local tooltip = self:GetParent() == WorldMapFrame:GetCanvas() and WorldMapTooltip or GameTooltip
    if self:GetCenter() > UIParent:GetCenter() then -- compare X coordinate
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end
    handle_tooltip_by_coord(tooltip, uiMapID, coord)
end

local function createWaypoint(button, uiMapID, coord)
    if TomTom then
		local note = ns.points[uiMapID][coord]["note"]
		if note then 
			title = get_point_info_by_coord(uiMapID, coord).."\n"..note
		else
			title = get_point_info_by_coord(uiMapID, coord)
		end
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uiMapID, x, y, {
            title = title,
            persistent = nil,
            minimap = true,
            world = true
        })
    end
end

local function AddNPCScan(button, uiMapID, coord)
    if IsAddOnLoaded("NPCScan") then
		local npc = ns.points[uiMapID][coord]["NPCScan"]
		if npc then 
			DEFAULT_CHAT_FRAME.editBox:SetText(npc) ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0);
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFF7D00BFA_HF_Tracker :|r "..L["Information for NPCScan and not available."]);
		end
    end
end

local function hideNode(button, uiMapID, coord)
    ns.hidden[uiMapID][coord] = true
    HL:Refresh()
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

do
    local currentZone, currentCoord
    local function generateMenu(button, level)
        if (not level) then return end
        wipe(info)
        if (level == 1) then
            -- Create the title of the menu
            info.isTitle      = 1
            info.text         = "HandyNotes - " .. myname:gsub("HandyNotes_", "")
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)
			
            if TomTom then
                -- Waypoint menu item
                info.text = L["Create waypoint"]
                info.notCheckable = 1
                info.func = createWaypoint
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
                wipe(info)
            end
			
			if IsAddOnLoaded("NPCScan") then
                -- NPCScan menu item
                info.text = L["ADD to NPCScan"]
                info.notCheckable = 1
                info.func = AddNPCScan
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
                wipe(info)
			end

            -- Hide menu item
            info.text         = L["Hide node"]
            info.notCheckable = 1
            info.func         = hideNode
            info.arg1         = currentZone
            info.arg2         = currentCoord
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            -- Close menu item
            info.text         = L["Close"]
            info.func         = closeAllDropdowns
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)
        end
    end
    local HL_Dropdown = CreateFrame("Frame", myname.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        -- given we're in a click handler, this really *should* exist, but just in case...
        local point = ns.points[currentZone] and ns.points[currentZone][currentCoord]
        if button == "RightButton" and not down then
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end

function HLHandler:OnLeave(uiMapID, coord)
    if self:GetParent() == WorldMapFrame:GetCanvas() then
        WorldMapTooltip:Hide()
    else
        GameTooltip:Hide()
    end
    ShoppingTooltip1:Hide()
end

do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local currentZone, isMinimap
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value and ns.should_show_point(state, value, currentZone, isMinimap) then
                local label, icon, _, _, _, scale, alpha = get_point_info(value)
                scale = (scale or 1) * (icon and icon.scale or 1) * ns.db.icon_scale
                return state, nil, icon, scale, ns.db.icon_alpha * alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    local function UnitHasBuff(unit, spellid)
        local buffname = GetSpellInfo(spellid)
        for i = 1, 40 do
            local name = UnitBuff(unit, i)
            if not name then
                -- reached the end, probably
                return
            end
            if buffname == name then
                return UnitBuff(unit, i)
            end
        end
    end
    function HLHandler:GetNodes2(uiMapID, minimap)
        Debug("GetNodes2", uiMapID, minimap)
        currentZone = uiMapID
        isMinimap = minimap
        if minimap and ns.map_spellids[uiMapID] then
            if ns.map_spellids[mapFile] == true then
                return iter
            end
            if UnitHasBuff("player", ns.map_spellids[mapFile]) then
                return iter
            end
        end
        return iter, ns.points[uiMapID], nil
    end
end

---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New(myname.."DB", ns.defaults)
    ns.db = self.db.profile
    ns.hidden = self.db.char.hidden
	NPC_Name_CacheDB = NPC_Name_CacheDB or {}
	Item_Name_CacheDB = Item_Name_CacheDB or {}
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB(myname:gsub("HandyNotes_", ""), HLHandler, ns.options)

    -- watch for LOOT_CLOSED
    self:RegisterEvent("LOOT_CLOSED", "Refresh")
    self:RegisterEvent("ZONE_CHANGED_INDOORS", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
end
