local myname, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(myname, true)

local function achievementComplete(id)
	local complete = select(13, GetAchievementInfo(id))
	return complete
end

local function nameAchievement(id)
	local name = select(2, GetAchievementInfo(id))
	local complete = select(13, GetAchievementInfo(id))
	if complete then
		return "|cFF00FF00"..id.." - "..name.."|r"	-- vert
	end
	return "|cFFFF0000"..id.." - "..name.."|r"	-- rouge
end

ns.defaults = {
    profile = {
        show_on_world = true,
        show_on_minimap = false,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
		show_hautsFaits = true,
		show_hautsFaits_complete = false,
        found = false,
        repeatable = true,
        icon_scale = 1.3,
        icon_alpha = 1.0,
        icon_item = false,
		icon_item_hf = false,
        tooltip_item = false,
        tooltip_questid = false,
		tooltip_npcid = false,
		hf_12482 = true,
		hf_13016 = true,
		hf_13018 = true,
		hf_13024 = true,
		hf_13028 = true,
		hf_13029 = true,
		hf_13036 = true,
		hf_13046 = true,
		hf_13051 = true,
		hf_13057 = true,
		hf_13061 = true,
		hf_13064 = true,
		hf_13082 = true,
		hf_13087 = true,
		hf_13094 = true,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

ns.options = {
    type = "group",
    name = myname:gsub("HandyNotes_", ""),
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
    end,
    args = {
        icon = {
            type = "group",
            name = L["Icon settings"],
            inline = true,
			order = 1,
            args = {
                desc = {
                    name = L["These settings control the look and feel of the icon."],
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = L["Icon Scale"],
                    desc = L["The scale of the icons"],
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = L["Icon Alpha"],
                    desc = L["The alpha transparency of the icons"],
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = L["World Map"],
                    desc = L["Show icons on world map"],
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = L["Minimap"],
                    desc = L["Show icons on the minimap"],
                    order = 50,
                },
            },
        },
        display = {
            type = "group",
            name = L["What to display"],
            inline = true,
			order = 2,
            args = {
                icon_item = {
                    type = "toggle",
                    name = L["Use item icons"],
                    desc = L["Show the icons for items, if known; otherwise, the achievement icon will be used"],
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = L["Use item tooltips"],
                    desc = L["Show the full tooltips for items"],
                    order = 10,
                },
                found = {
                    type = "toggle",
                    name = L["Show found"],
                    desc = L["Show waypoints for items you've already found?"],
                    order = 20,
                },
                show_npcs = {
                    type = "toggle",
                    name = L["Show NPCs"],
                    desc = L["Show rare NPCs to be killed, generally for items or achievements"],
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = L["Show treasure"],
                    desc = L["Show treasure that can be looted"],
                    order = 35,
                },
                show_junk = {
                    type = "toggle",
                    name = L["Junk"],
                    desc = L["Show items which don't count for any achievement"],
                    order = 40,
                },
				header1 = {
					type = "header",
					name = L["Debug"],
					order = 41,
				},
                tooltip_questid = {
                    type = "toggle",
                    name = L["Show quest ids"],
                    desc = L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."],
                    order = 42,
                },
				tooltip_npcid = {
                    type = "toggle",
                    name = L["Show NPCs ids"],
                    desc = L["Show the internal id of the NPC associated with this node. Handy if you want to report a problem with it."],
                    order = 45,
                },
                unhide = {
                    type = "execute",
                    name = L["Reset hidden nodes"],
                    desc = L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."],
                    width = "full",
					func = function()
                        for map,coords in pairs(ns.hidden) do
                            wipe(coords)
                        end
                        ns.HL:Refresh()
                    end,
                    order = 50,
                },
            },
        },
		achievement = {
            type = "group",
            name = L["What to display achievement"],
            inline = true,
			order = 3,
            args = {
				show_hautsFaits = {
                    type = "toggle",
                    name = L["Show Achievement"],
                    desc = L["Show Achievement that can be looted"],
                    order = 0,
                },
                icon_item_hf = {
                    type = "toggle",
                    name = L["Use item icons achievement"],
                    desc = L["Show the icons for items, if known; otherwise, the achievement icon will be used"],
                    disabled = function() return not ns.db.show_hautsFaits; end,
					order = 5,
                },
				show_hautsFaits_complete = {
                    type = "toggle",
                    name = L["Show Achievements completed"],
                    desc = L["Show Achievements completed"],
					width = "full",
					disabled = function() return not ns.db.show_hautsFaits; end,
                    order = 10,
                },
				header2 = {
					type = "header",
					name = L["Select achievement"],
					order = 20,
				},
				hf_12482 = {
					type = "toggle",
					name = function() return nameAchievement(12482); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(12482) and not ns.db.show_hautsFaits_complete); end,
					order = 12482,
				},
				hf_13016 = {
					type = "toggle",
					name = function() return nameAchievement(13016); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13016) and not ns.db.show_hautsFaits_complete); end,
					order = 13016,
				},
				hf_13018 = {
					type = "toggle",
					name = function() return nameAchievement(13018); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13018) and not ns.db.show_hautsFaits_complete); end,
					order = 13018,
				},
				hf_13024 = {
					type = "toggle",
					name = function() return nameAchievement(13024); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13024) and not ns.db.show_hautsFaits_complete); end,
					order = 13024,
				},
				hf_13028 = {
					type = "toggle",
					name = function() return nameAchievement(13028); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13028) and not ns.db.show_hautsFaits_complete); end,
					order = 13028,
				},
				hf_13029 = {
					type = "toggle",
					name = function() return nameAchievement(13029); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13029) and not ns.db.show_hautsFaits_complete); end,
					order = 13029,
				},
				hf_13036 = {
					type = "toggle",
					name = function() return nameAchievement(13036); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13036) and not ns.db.show_hautsFaits_complete); end,
					order = 13036,
				},
				hf_13046 = {
					type = "toggle",
					name = function() return nameAchievement(13046); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13046) and not ns.db.show_hautsFaits_complete); end,
					order = 13046,
				},
				hf_13051 = {
					type = "toggle",
					name = function() return nameAchievement(13051); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13051) and not ns.db.show_hautsFaits_complete); end,
					order = 13051,
				},
				hf_13057 = {
					type = "toggle",
					name = function() return nameAchievement(13057); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13057) and not ns.db.show_hautsFaits_complete); end,
					order = 13057,
				},
				hf_13061 = {
					type = "toggle",
					name = function() return nameAchievement(13061); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13061) and not ns.db.show_hautsFaits_complete); end,
					order = 13061,
				},
				hf_13064 = {
					type = "toggle",
					name = function() return nameAchievement(13064); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13064) and not ns.db.show_hautsFaits_complete); end,
					order = 13064,
				},
				hf_13082 = {
					type = "toggle",
					name = function() return nameAchievement(13082); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13082) and not ns.db.show_hautsFaits_complete); end,
					order = 13082,
				},
				hf_13087 = {
					type = "toggle",
					name = function() return nameAchievement(13087); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13087) and not ns.db.show_hautsFaits_complete); end,
					order = 13087,
				},
				hf_13094 = {
					type = "toggle",
					name = function() return nameAchievement(13094); end,
					desc = L["Show the icons Achievement"],
					width = "full",
					hidden = function() return not ns.db.show_hautsFaits or (achievementComplete(13094) and not ns.db.show_hautsFaits_complete); end,
					order = 13094,
				},
            },
        },
    },
}

local player_faction = UnitFactionGroup("player")
local player_name = UnitName("player")

local allQuestsComplete = function(quests)
    if type(quests) == 'table' then
        -- if it's a table, only count as complete if all quests are complete
        for _, quest in ipairs(quests) do
            if not IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    elseif IsQuestFlaggedCompleted(quests) then
        return true
    end
end
local allCriteriaComplete = function(achievement, criterias)
    if type(criterias) == 'table' then
        -- if it's a table, only count as complete if all criterias are complete
        for _, criteria in ipairs(criterias) do
			local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(achievement, criteria)
			if not completed and not completedBy then
				return false
			end
        end
        return true
    else
		local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(achievement, criterias)
		if completed and completedBy == player_name then
			return true
		end
    end
end

ns.should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not ns.db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not ns.db.show_on_world then
        return false
    end
    if point.level and point.level ~= currentLevel then
        return false
    end
    if ns.hidden[currentZone] and ns.hidden[currentZone][coord] then
        return false
    end
    if ns.outdoors_only and IsIndoors() then
        return false
    end
    if point.junk and not ns.db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not ns.db.found) then
        if point.quest then
            if allQuestsComplete(point.quest) then
                return false
            end
        elseif point.achievement then
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if completedByMe then
                return false
            end
            if point.criteria then
				--[[
                local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                if completed and completedBy == player_name then
                    return false
                end
				]]--
				if allCriteriaComplete(point.achievement, point.criteria) then
					return false
				end
			end
        end
        if point.follower and C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        if point.toy and point.item and PlayerHasToy(point.item) then
            return false
        end
    end
    if not point.follower then
        if point.npc then
            if not ns.db.show_npcs then
                return false
            end
		elseif point.hf then
            if not ns.db.show_hautsFaits then
                return false
            end
			if not ns.db.hf_12482 and point.achievement == 12482 then
                return false
            end
			if not ns.db.hf_13016 and point.achievement == 13016 then
                return false
            end
			if not ns.db.hf_13018 and point.achievement == 13018 then
                return false
            end
			if not ns.db.hf_13024 and point.achievement == 13024 then
                return false
            end
			if not ns.db.hf_13028 and point.achievement == 13028 then
                return false
            end
			if not ns.db.hf_13029 and point.achievement == 13029 then
                return false
            end
			if not ns.db.hf_13036 and point.achievement == 13036 then
                return false
            end
			if not ns.db.hf_13046 and point.achievement == 13046 then
                return false
            end
			if not ns.db.hf_13051 and point.achievement == 13051 then
                return false
            end
			if not ns.db.hf_13057 and point.achievement == 13057 then
                return false
            end
			if not ns.db.hf_13061 and point.achievement == 13061 then
                return false
            end
			if not ns.db.hf_13064 and point.achievement == 13064 then
                return false
            end
			if not ns.db.hf_13082 and point.achievement == 13082 then
                return false
            end
			if not ns.db.hf_13087 and point.achievement == 13087 then
                return false
            end
			if not ns.db.hf_13094 and point.achievement == 13094 then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not ns.db.show_treasure then
                return false
            end
        end
    end
    if point.hide_before and not ns.db.upcoming and not allQuestsComplete(point.hide_before) then
        return false
    end
    return true
end
