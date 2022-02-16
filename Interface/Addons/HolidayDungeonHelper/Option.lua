local ADDON, ns = ...
local Addon = ns.Addon
local L = ns.L
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local Option = Addon:NewModule("Option", "AceConsole-3.0")

function Option:Get(key)
	return Addon.db.profile[key]
end

function Option:Set(key, value)
	Addon.db.profile[key] = value
end

function Option:ShowConfig()
	AceConfigDialog:SetDefaultSize(ADDON, 600, 420)
	AceConfigDialog:Open(ADDON)
end

ns.Options = {
	type = "group",
	name = "Holiday Dungeon Helper",
	get = function(info) return Option:Get(info[#info]) end,
	set = function(info, value) Option:Set(info[#info], value) end,
	args = {
		settings = {
			order = 1,
			name = L["LFD Settings"],
			type = "group",
			args = {
				autoQueue = {
					order = 1,
					name = L["Auto Queue"],
					type = "toggle",
				},
				allRoles = {
					order = 2,
					name = L["All LFD Roles"],
					type = "toggle",
				},
				autoLeave = {
					order = 3,
					name = L["Auto Leave Party"],
					type = "toggle",
				},
				autoLeaveDelay = {
					order = 4,
					name = L["Leave Party Delay"],
					type = "range",
					min = 0,
					max = 30,
					step = 1,
				}
			}
		},
		dungeons = {
			order = 2,
			name = L["Holiday Dungeons"],
			type = "group",
			args = {}
		}
	}
}

function Option:OnEnable()
	local index = 1
	for _, info in pairs(ns.HolidayDungeons) do
		ns.Options.args.dungeons.args[info.name] = {
			order = index,
			name = L[info.name],
			type = "toggle",
		}

		index = index + 1
	end

	AceConfigRegistry:RegisterOptionsTable(ADDON, ns.Options)
	self:RegisterChatCommand("hdh", "ShowConfig")
	self:RegisterChatCommand("holidaydungeonhelper", "ShowConfig")
end