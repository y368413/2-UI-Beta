local addonName, ns = ...
ns[1] = {}			-- M, Basement
ns[2] = {}			-- R, Config
ns[3] = {}			-- U, Locales
ns[4] = {}			-- I, Database
MaoRUISettingDB, MaoRUIDB = {}, {}
ShiGuangDB = ShiGuangDB or {}
ShiGuangPerDB = ShiGuangPerDB or {}

local M, R, U, I = unpack(ns)
local pairs, next, tinsert = pairs, next, table.insert

-- Events
local events = {}

local host = CreateFrame("Frame")
host:SetScript("OnEvent", function(_, event, ...)
	for func in pairs(events[event]) do
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			func(event, CombatLogGetCurrentEventInfo())
		else
			func(event, ...)
		end
	end
end)

function M:RegisterEvent(event, func, unit1, unit2)
	if not events[event] then
		events[event] = {}
		if unit1 then
			host:RegisterUnitEvent(event, unit1, unit2)
		else
			host:RegisterEvent(event)
		end
	end

	events[event][func] = true
end

function M:UnregisterEvent(event, func)
	local funcs = events[event]
	if funcs and funcs[func] then
		funcs[func] = nil

		if not next(funcs) then
			events[event] = nil
			host:UnregisterEvent(event)
		end
	end
end

-- Modules
local modules, initQueue = {}, {}

function M:RegisterModule(name)
	if modules[name] then print("Module <"..name.."> has been registered.") return end
	local module = {}
	module.name = name
	modules[name] = module

	tinsert(initQueue, module)
	return module
end

function M:GetModule(name)
	if not modules[name] then print("Module <"..name.."> does not exist.") return end

	return modules[name]
end

-- Init
M:RegisterEvent("PLAYER_LOGIN", function()
	for _, module in next, initQueue do
		if module.OnLogin then
			module:OnLogin()
		else
			print("Module <"..module.name.."> does not loaded.")
		end
	end

	M.Modules = modules
end)

_G[addonName] = ns