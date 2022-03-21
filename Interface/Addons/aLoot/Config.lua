local _, L = ...
local mediaFolder = "Interface\\AddOns\\Nameplates\\media\\"
local LMB, RMB = CreateAtlasMarkup("NPE_LeftClick", 16, 16), CreateAtlasMarkup("NPE_RightClick", 16,16)

local LSM = LibStub('LibSharedMedia-3.0')

function L.Get(key)
	if L.config and L.config[key] ~= nil then
		return L.config[key]
	else
		return L.defaults[key]
	end
end

function L.Set(key, value)
	L.config = L.config or {}
	L.config[key] = value
end

function L.GetFromSavedVariabiles(table)
	local id = table[#table]
	return ( L.config and L.config[id] )
end

function L.GetFromDefaultOrSavedVariabiles(table)
	local id = table[#table]
	return ( L.config and L.config[id] ) or L.defaults[id]
end

setmetatable(L, {
	__call = function(self, input, newValue)
		return L.Get(input) or self[input]
	end,
})

local font_flags_table = {
	[""] = "None",
	["OUTLINE"] = "Outline",
	["THICKOUTLINE"] = "Thick outline",
	["MONOCHROME"] = "Monochrome",
	["OUTLINEMONOCHROME"] = "Outlined monochrome",
}

local anchor_position_table = {
	["TOP"]			= "TOP",
	["TOPLEFT"]		= "TOPLEFT",
	["TOPRIGHT"]	= "TOPRIGHT",
	["BOTTOM"]		= "BOTTOM",
	["BOTTOMLEFT"]	= "BOTTOMLEFT",
	["BOTTOMRIGHT"]	= "BOTTOMRIGHT",
	["LEFT"]		= "LEFT",
	["RIGHT"]		= "RIGHT",
	["CENTER"]		= "CENTER",
}
----------------------------------
-- Default config
----------------------------------
L.defaults = {
	unlock_lootFrame		= false,
	unlock_infoFrame		= false,
	unlock_flashFrame		= false,
	speedLoot				= false,
	speedLoot_text			= true,
	toolTip					= false,
	mouseover_color			= false,
	mouseover_color_value	= {225/255, 225/255,255/255, .8},
	mouseover_scale			= 1.4,
	iconSize				= 50,
	iconSpace				= 8,
	lootFrame_align			= "CENTER",
	name_show				= false,
	name_show_onlyMO		= true,
	name_short				= true,
	name_format  			=  0,
	name_short_lenght		= 14,
	name_font_point			= "BOTTOM",
	name_font_relativePoint	= "TOP",
	name_font_posun_X		= 0,
	name_font_posun_Y		= 2,
	name_font				= "Avant Garde",
	name_fontsize			= 12,
	name_font_flag			= 'OUTLINE',
	name_font_color			= {0/255, 255/255, 0/255, 1},
	name_texture_color		= true,
	name_texture_color_value = {0/255, 0/255, 0/255, 1},
	name_texture			= "np_om_texture",
	autoLoot				= { ["gold"] = true,	["currency"] = true, ["quest"] = true, ["poor"] = true, ["common"] = true, ["uncommon"] = true, ["rare"] = true, ["epic"] = true, ["legendary"] = true,},
	flash					= { ["quest"] = false, ["legendary"] = false, ["user"] = true, },
	flash_sound				= "Cat",
	info_frame_duration 		= 10,
	info_frame_maxcount		= 6,
	info_frame_alpha		= 0.7,
	info_frame_speed		= 0.5,
	info_font				= "Expressway",
	info_fontsize			= 14,
	info_font_flag			= "OUTLINE",
}
----------------------------------
-- Default config
----------------------------------
L.options = {
	type = "group",
	name = "ver : ".._G.GetAddOnMetadata("aLoot", "Version"),
	args = {
		basic_page = {
			type = 'group',
			name = "aLoot",
			--inline = false,
			order = 1,
			args = {
				unlock_lootFrame = {
					type = 'toggle',
					name = 'Unlock lootFrame',
					desc = 'Unlock lootFrame and change his position.',
					order = 1.1,
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.unlock_lootFrame = val
						if L.config.unlock_lootFrame then
							myLootFrameBase:EnableMouse(true)
							myLootFrameBase.value:Show()
							myLootFrameBase.border:Show()
							myLootFrameBase:Show()
						else
							myLootFrameBase:EnableMouse(false)
							myLootFrameBase.value:Hide()
							myLootFrameBase.border:Hide()
							myLootFrameBase:Hide()
						end								
					end,
				},
				unlock_infoFrame = {
					type = 'toggle',
					name = 'Unlock infoFrame',
					desc = 'Unlock infoFrame and change his position.',
					order = 1.2,
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.unlock_infoFrame = val
						if L.config.unlock_infoFrame then
							aLootInfoFrameBase:EnableMouse(true)
							aLootInfoFrameBase.value:Show()
							aLootInfoFrameBase.border:Show()
							aLootInfoFrameBase:Show()
						else
							aLootInfoFrameBase:EnableMouse(false)
							aLootInfoFrameBase.value:Hide()
							aLootInfoFrameBase.border:Hide()
							aLootInfoFrameBase:Hide()
						end								
					end,
				},
				unlock_flashFrame = {
					type = 'toggle',
					name = 'Unlock flashFrame',
					desc = 'Unlock flashFrame and change his position.',
					order = 1.3,
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.unlock_flashFrame = val
						if L.config.unlock_flashFrame then
							if aLootFlashFrameBase.Anime:IsPlaying() then
								aLootFlashFrameBase.Anime:Stop()
							end
							aLootFlashFrameBase:EnableMouse(true)
							aLootFlashFrameBase.value:SetText(LMB.."move "..RMB.."close")
							--aLootFlashFrameBase.value:Show()
							aLootFlashFrameBase:Show()
						else
							aLootFlashFrameBase:EnableMouse(false)
							--aLootFlashFrameBase.value:Hide()
							aLootFlashFrameBase:Hide()
						end								
					end,
				},
				speedLoot = {
					type = 'toggle',
					name = 'Speed loot',
					desc = 'Loot all items when blizzard call event LOOT_READY, dont create loot frames, dont wait on blizzard for textures, tooltip info, .....',
					order = 1.4,
					--width = "half",
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.speedLoot = val
					end,
				},
				speedLoot_text = {
					type = 'toggle',
					name = 'Info text',
					desc = 'Show text when speed loot is complete',
					order = 1.5,
					width = "half",
					disabled = function() return not L('speedLoot') end,
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.speedLoot_text = val
					end,
				},
				toolTip = {
					type = 'toggle',
					name = 'ToolTip',
					desc = 'Enable toolTip information for loot items.',
					order = 1.6,
					width = "half",
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.toolTip = val
					end,
				},
				name_show = {
					type = 'toggle',
					name = 'Name',
					desc = 'Show loot names.',
					order = 1.7,
					width = "half",
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.name_show = val
						lootFrameMixin:ConfigUpdate()
					end,
				},
				name_show_onlyMO = {
					type = 'toggle',
					name = 'Only mouseover',
					desc = 'Show name only on mouseover items',
					order = 1.8,
					disabled = function() return not L('name_show') end,
					get = L.GetFromSavedVariabiles,
					set = function(_, val)
						L.config.name_show_onlyMO = val
						lootFrameMixin:ConfigUpdate()
					end,
				},
				iconSize = {
					type = 'range',
					name = 'Icon size',
					desc = '',
					min = 20,
					max = 80,
					step = 1,
					order = 1.9,
					get = L.GetFromDefaultOrSavedVariabiles,
					set = function(_, val)
						L.config.iconSize = val
						lootFrameMixin:ConfigUpdate()
					end,
				},
				iconSpace = {
					type = 'range',
					name = 'Icon space',
					desc = '',
					min = 0,
					max = 15,
					step = 1,
					order = 2.0,
					get = L.GetFromDefaultOrSavedVariabiles,
					set = function(_, val)
						L.config.iconSpace = val
						lootFrameMixin:ConfigUpdate()
					end,
				},
				lootFrame_align = {
					type = 'select',
					name = 'Align',
					style = 'dropdown',
					order = 2.1,
					values = {
						["LEFT"]	= "RIGHT",
						["CENTER"]	= "CENTER",
						["RIGHT"]	= "LEFT",
						["TOP"]		= "DOWN",
						["BOTTOM"]	= "UP",
					},
					get = L.GetFromDefaultOrSavedVariabiles,
					set = function(_, val)
						L.config.lootFrame_align = val
						lootFrameMixin:ConfigUpdate()
					end,
				},
				auto_loot_setup = {
					type = 'group',
					name = 'Auto loot',
					inline = true,
					order = 4,
					args = {
						autoLootGold = {
							type = 'toggle',
							name = 'Golds',
							desc = 'Enable auto loot for golds.',
							order = 1.1,
							width = "half",
							get = function() return L.config.autoLoot["gold"] end,
							set = function(_, val)
								L.config.autoLoot["gold"] = val
							end,
						},
						autoLootCurrency = {
							type = 'toggle',
							name = 'Currency',
							desc = 'Enable auto loot other currency amount, such as  (Valor Points, Stygia, ....)',
							order = 1.2,
							width = "half",
							get = function() return L.config.autoLoot["currency"] end,
							set = function(_, val)
								L.config.autoLoot["currency"] = val
							end,
						},
						autoLootQuest = {
							type = 'toggle',
							name = 'Quest',
							desc = 'Enable auto loot for quest items.',
							order = 1.3,
							width = "half",
							get = function() return L.config.autoLoot["quest"] end,
							set = function(_, val)
								L.config.autoLoot["quest"] = val
							end,
						},
						autoLootPoor = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[0].hex.."Poor|r"
							end,
							desc = 'Enable auto loot for poor items.',
							order = 1.4,
							width = "half",
							get = function() return L.config.autoLoot["poor"] end,
							set = function(_, val)
								L.config.autoLoot["poor"] = val
							end,
						},
						autoLootCommon = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[1].hex.."Common|r"
							end,
							desc = 'Enable auto loot for common items.',
							order = 1.5,
							width = "half",
							get = function() return L.config.autoLoot["common"] end,
							set = function(_, val)
								L.config.autoLoot["common"] = val
							end,
						},
						autoLootUncommon = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[2].hex.."Uncommon|r"
							end,
							desc = 'Enable auto loot for uncommon items.',
							order = 1.6,
							--width = "half",
							get = function() return L.config.autoLoot["uncommon"] end,
							set = function(_, val)
								L.config.autoLoot["uncommon"] = val
							end,
						},
						autoLootRare = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[3].hex.."Rare|r"
							end,
							desc = 'Enable auto loot for rare items.',
							order = 1.7,
							width = "half",
							get = function() return L.config.autoLoot["rare"] end,
							set = function(_, val)
								L.config.autoLoot["rare"] = val
							end,
						},
						autoLootEpic = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[4].hex.."Epic|r"
							end,
							desc = 'Enable auto loot for epic items.',
							order = 1.8,
							width = "half",
							get = function() return L.config.autoLoot["epic"] end,
							set = function(_, val)
								L.config.autoLoot["epic"] = val
							end,
						},
						autoLootLegendary = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[5].hex.."Legendary|r"
							end,
							desc = 'Enable auto loot for legendary items.',
							order = 1.9,
							--width = "half",
							get = function() return L.config.autoLoot["legendary"] end,
							set = function(_, val)
								L.config.autoLoot["legendary"] = val
							end,
						},
					},
				},
				auto_loot_setup_flash = {
					type = 'group',
					name = 'Loot notification.',
					inline = true,
					order = 5,
					args = {
						flash1 = {
							type = 'toggle',
							name = 'Quest',
							desc = 'Show notification window if quest item has been looted by autoloot function. (except manualy or speed loot)',
							order = 1.1,
							width = "half",
							get = function() return L.config.flash["quest"] end,
							set = function(_, val)
								L.config.flash["quest"] = val
							end,
						},
						flash2 = {
							type = 'toggle',
							name = function()
								return ITEM_QUALITY_COLORS[5].hex.."Legendary|r"
							end,
							desc = 'Show notification window if legendary item has been looted by autoloot function. (except manualy or speed loot)',
							order = 1.2,
							get = function() return L.config.flash["legendary"] end,
							set = function(_, val)
								L.config.flash["legendary"] = val
							end,
						},
						flash3 = {
							type = 'toggle',
							name = 'Player specific',
							desc = 'Show notification window if player specific item has been looted by autoloot function. (except manualy or speed loot)',
							order = 1.3,
							get = function() return L.config.flash["user"] end,
							set = function(_, val)
								L.config.flash["user"] = val
							end,
						},
						spacer19 =  {
							type = "description", order = 1.9, name = "", fontSize = "small",
						},
						selectItem = {
							type = "select",
							name = "Select item",
							desc = 'Select item from Item list.',
							order = 2.1,
							disabled = function() return not L.config.flash["user"] end,
							get = function(_)
								if not selectedItem then
									if not L.ItemsTable then return end
									for filter in pairs(L.ItemsTable) do
										selectedItem = filter
									end
									return selectedItem
								else
									return selectedItem
								end
							end,
							set = function(_, value)
								selectedItem = value
								if L.ItemsTable[value] then
									L.showItem = L.ItemsTable[value].enable
								end
							end,
							values = function()
								local filters = {}
								if not L.ItemsTable then return end
								for filter in pairs(L.ItemsTable) do
									if L.ItemsTable[filter].enable then
										filters[filter] = format("|cFF00FF00%s|r", filter)
									else
										filters[filter] = format("|cFF808080%s|r", filter)
									end
								end
								if not next(filters) then filters[''] = NONE end
								return filters
							end,
						},
						addItem = {
							type = 'input',
							name = 'Add Item',
							desc = 'Add new item to player Item list.',
							order = 2.2,
							disabled = function() return not L.config.flash["user"] end,
							get = function(_) return "" end,
							set = function(_, val)
								if val then
									if tonumber(val) then
										val = GetItemInfo(val)
									end
									L.ItemsTable[val] = {}
									L.ItemsTable[val].enable = true
								end
							end,
						},
						removeItem = {
							type = 'execute',
							name = "|cffFF0000Delete|r",
							desc = "Remove selected Item from player Item list.",
							width = "half",
							order = 2.3,
							disabled = function() return not (selectedItem and selectedItem ~= "") or not L.config.flash["user"] end,
							func = function()
								if L.ItemsTable[selectedItem] then
									L.ItemsTable[selectedItem] = nil
									selectedItem = nil
								end
							end,
							
						},
						showItem = {
							type = 'toggle',
							name = 'Enable',
							desc = 'Enable showing this Item in notification window if is looted.',
							width = "half",
							order = 2.4,
							disabled = function() return not L.config.flash["user"] end,
							hidden = function() return not (selectedItem and selectedItem ~= "") end,
							get = function(_)
								if selectedItem then
									if L.ItemsTable[selectedItem] then
										return L.ItemsTable[selectedItem].enable
									else
										return false
									end
								else
									return false
								end
							end,
							set = function(_, val)
								L.ItemsTable[selectedItem].enable = val
							end,
						},
						flash_sound = {
							name = 'Select sound',
							type = "select",
							dialogControl = 'LSM30_Sound',
							order = 3.1,
							values = AceGUIWidgetLSMlists.sound,
							style = "dropdown",
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.flash_sound = val
							end,
						},
					},
				},
				mouseover_font_setup = {
					type = 'group',
					name = 'Mouseover setup',
					inline = true,
					order = 6,
					args = {
						mouseover_color = {
							type = 'toggle',
							name = 'Mouseover color',
							desc = 'Enable mouseover_color.',
							order = 1.1,
							get = L.GetFromSavedVariabiles,
							set = function(_, val)
								L.config.mouseover_color = val
							end,
						},
						mouseover_color_value = {
							type = "color",
							name = "Color",
							hasAlpha = true,
							order = 1.2,
							disabled = function() return not L('mouseover_color') end,
							get = function() return unpack(L.config.mouseover_color_value); end,
							set = function(_,...)
								L.config.mouseover_color_value = {...};
							end,
						},
						mouseover_scale = {
							type = 'range',
							name = 'Scale',
							desc = 'Mouseover scale. Set 100% to disable.',
							isPercent = true,
							min = 1,
							max = 2,
							step = .01,
							order = 1.4,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.mouseover_scale = val
							end,
						},
					},
				},
				name_abbreviation = {
					type = 'group',
					name = 'Name abbreviation',
					inline = true,
					order = 7,
					hidden = function() return not L('name_show') end,
					args = {
						name_short = {
							type = 'toggle',
							name = 'Change length name',
							desc = 'Change max name size.',
							order = 3.1,
							get = L.GetFromSavedVariabiles,
							set = function(_, val)
								L.config.name_short = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_format  = {
							type = 'select',
							name = 'Name format',
							desc = 'Select showed format for name.',
							style = 'dropdown',
							order = 3.2,
							disabled = function() return not L('name_short') end,
							values = {
								[0] = "R. T. Dummy",
								[1] = "R.T.Dummy",
								[2] = "Raider's T. D.",
								[3] = "Raider'sT.D.",
								[4] = "Raider's",
								[5] = "Dummy",
							},
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_format = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_short_lenght = {
							type = 'range',
							name = 'Max. lenght name',
							desc = 'Set number for max unit name size.',
							min = 5,
							max = 30,
							step = 1,
							order = 3.3,
							disabled = function() return not L('name_short') end,
							get = L.GetFromSavedVariabiles,
							set = function(_, val)
								L.config.name_short_lenght = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
					},
				},
				name_font_setup = {
					type = 'group',
					name = 'Name font setup',
					inline = true,
					order = 8,
					hidden = function() return not L('name_show') end,
					args = {
						name_font = {
							type = "select",
							name = 'Font name',
							dialogControl = 'LSM30_Font',
							order = 2.1,
							values = AceGUIWidgetLSMlists.font,
							style = "dropdown",
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_fontsize = {
							type = 'range',
							name = 'Font size',
							min = 4,
							max = 40,
							step = 1,
							order = 2.2,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_fontsize = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_font_flag  = {
							type = 'select',
							name = 'Font flag',
							style = 'dropdown',
							order = 2.3,
							values = font_flags_table,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font_flag = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_color = {
							type = 'toggle',
							name = 'Color',
							desc = 'Use this color for all items.',
							width = "half",
							order = 2.4,
							get = L.GetFromSavedVariabiles,
							set = function(_, val)
								L.config.name_color = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_font_color = {
							type = "color",
							name = "Color",
							hasAlpha = true,
							width = "half",
							order = 2.5,
							disabled = function() return not L('name_color') end,
							get = function() return unpack(L.config.name_font_color); end,
							set = function(_,...)
								L.config.name_font_color = {...}
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_texture_color = {
							type = 'toggle',
							name = 'Color',
							desc = 'Use this color for name background texture or set color by item type.',
							width = "half",
							order = 2.6,
							get = L.GetFromSavedVariabiles,
							set = function(_, val)
								L.config.name_texture_color = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_texture_color_value = {
							type = "color",
							order = 2.7,
							name = "Color",
							desc = 'Color for texture',
							width = 'half',
							hasAlpha = true,
							disabled = function() return not L('name_texture_color') end,
							get = function() return unpack(L.config.name_texture_color_value); end,
							set = function(_,...)
								L.config.name_texture_color_value = {...}
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_texture = {
							type = "select",
							name = 'Texture',
							dialogControl = 'LSM30_Statusbar',
							order = 2.8,
							values = AceGUIWidgetLSMlists.statusbar,
							style = "dropdown",
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_texture = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						spacer29 =  {
							type = "description", order = 2.9, name = " ", fontSize = "medium",
						},
						name_font_point = {
							type = 'select',
							name = 'Point',
							style = 'dropdown',
							order = 3.1,
							values = anchor_position_table,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font_point = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_font_relativePoint = {
							type = 'select',
							name = 'relativePoint',
							style = 'dropdown',
							order = 3.2,
							values = anchor_position_table,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font_relativePoint = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						spacer39 =  {
							type = "description", order = 3.9, name = " ", fontSize = "medium",
						},
						name_font_posun_X = {
							type = 'range',
							name = 'position X',
							desc = 'Setup X position for raidMarks.',
							min = -30,
							max = 30,
							step = 1,
							order = 4.1,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font_posun_X = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						name_font_posun_Y = {
							type = 'range',
							name = 'position Y',
							desc = 'Setup Y position for raidMarks.',
							min = -30,
							max = 30,
							step = 1,
							order = 4.2,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.name_font_posun_Y = val
								lootFrameMixin:ConfigUpdate()
							end,
						},
						spacer49 =  {
							type = "description", order = 4.9, name = " ", fontSize = "medium",
						},
					},
				},								
				info_frame_setup = {
					type = 'group',
					name = 'infoFrame setup',
					inline = true,
					order = 9,
					args = {
						info_frame_duration = {
							type = 'range',
							name = 'Duration',
							desc = 'Setup max time how one frame is showed.',
							min = 4,
							max = 15,
							step = 1,
							order = 1.1,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_frame_duration = val
							end,
						},
						info_frame_maxcount = {
							type = 'range',
							name = 'Count',
							desc = 'Setup max count frame showed in one time.',
							min = 2,
							max = 10,
							step = 1,
							order = 1.2,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_frame_maxcount = val
							end,
						},
						info_frame_alpha = {
							type = 'range',
							name = 'Alpha',
							desc = 'Alpha for infoFrames.',
							min = 0.1,
							max = 1,
							step = .05,
							order = 1.3,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_frame_alpha = val
							end,
						},
						info_frame_speed = {
							type = 'range',
							name = 'Animation speed',
							desc = 'Set animation speed.',
							min = 0.1,
							max = 1,
							step = .05,
							order = 1.5,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_frame_speed = val
							end,
						},
						spacer19 =  {
							type = "description", order = 1.9, name = "", fontSize = "small",
						},
						info_font = {
							type = "select",
							name = 'Font name',
							dialogControl = 'LSM30_Font',
							order = 2.1,
							values = AceGUIWidgetLSMlists.font,
							style = "dropdown",
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_font = val
							end,
						},
						info_fontsize = {
							type = 'range',
							name = 'Font size',
							min = 4,
							max = 40,
							step = 1,
							order = 2.2,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_fontsize = val
							end,
						},
						info_font_flag  = {
							type = 'select',
							name = 'Font flag',
							style = 'dropdown',
							order = 2.3,
							values = font_flags_table,
							get = L.GetFromDefaultOrSavedVariabiles,
							set = function(_, val)
								L.config.info_font_flag = val
							end,
						},
					},
				},
			},
		},
	},
}