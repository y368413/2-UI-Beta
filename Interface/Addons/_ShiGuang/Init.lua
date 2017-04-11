-- Initial
local _, ns = ...
ns[1] = {}			-- M, Basement
ns[2] = {}			-- R, Config
ns[3] = {}			-- U, LocaleDB
ns[4] = {}			-- I, DataBase
ns.modules = {}		-- Addon Modules
ns.initQueue = {}	-- Initialize Queue
MaoRUIDB = MaoRUIDB or {}
MaoRUISettingDB = MaoRUISettingDB or {}

function ns:RegisterModule(name, ...)
	if self.modules[name] then print("Module <"..name.."> has been registered.") return end
	local module = {}
	module.name = name
	module.func = ...

	self.modules[name] = module
	tinsert(ns.initQueue, module)
	return module
end

function ns:GetModule(name)
	if not self.modules[name] then print("Module <"..name.."> not found.") return end
	return self.modules[name]
end

function ns:EventFrame(event)
	local f = CreateFrame("Frame")
	if type(event) == "table" then
		for _, v in pairs(event) do
			f:RegisterEvent(v)
		end
	else
		f:RegisterEvent(event)
	end
	return f
end

ns:EventFrame("PLAYER_LOGIN"):SetScript("OnEvent", function()
	for _, module in pairs(ns.initQueue) do
		module:OnLogin()
	end
end)

MaoRUI = ns