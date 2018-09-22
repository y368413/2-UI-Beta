local MAJOR, MINOR = "LibDualSpec-1.0", 17
assert(LibStub, MAJOR.." requires LibStub")
local lib, minor = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

-- ----------------------------------------------------------------------------
-- Library data
-- ----------------------------------------------------------------------------

lib.eventFrame = lib.eventFrame or CreateFrame("Frame")

lib.registry = lib.registry or {}
lib.options = lib.options or {}
lib.mixin = lib.mixin or {}
lib.upgrades = lib.upgrades or {}
lib.currentSpec = lib.currentSpec or 0

if minor and minor < 15 then
	lib.talentsLoaded, lib.talentGroup = nil, nil
	lib.specLoaded, lib.specGroup = nil, nil
	lib.eventFrame:UnregisterAllEvents()
	wipe(lib.options)
end

-- ----------------------------------------------------------------------------
-- Locals
-- ----------------------------------------------------------------------------

local registry = lib.registry
local options = lib.options
local mixin = lib.mixin
local upgrades = lib.upgrades

-- "Externals"
local AceDB3 = LibStub('AceDB-3.0', true)
local AceDBOptions3 = LibStub('AceDBOptions-3.0', true)
local AceConfigRegistry3 = LibStub('AceConfigRegistry-3.0', true)

-- classId specialization functions don't require player data to be loaded
local _, _, classId = UnitClass("player")
local numSpecs = GetNumSpecializationsForClassID(classId)

-- ----------------------------------------------------------------------------
-- Localization
-- ----------------------------------------------------------------------------

local L_ENABLED = "Enable spec profiles"
local L_ENABLED_DESC = "When enabled, your profile will be set to the specified profile when you change specialization."
local L_CURRENT = "%s (Current)" -- maybe something like >> %s << and/or coloring to avoid localization?

do
	if GetLocale() == "zhCN" then
		L_ENABLED = "启用专精配置文件"
		L_ENABLED_DESC = "当启用后，当切换专精时配置文件将设置为专精配置文件。"
		L_CURRENT = "%s（当前）"
	elseif GetLocale() == "zhTW" then
		L_ENABLED = "啟用專精設定檔"
		L_ENABLED_DESC = "當啟用後，當你切換專精時設定檔會設定為專精設定檔。"
		L_CURRENT = "%s (目前) "
	end
end

-- ----------------------------------------------------------------------------
-- Mixin
-- ----------------------------------------------------------------------------

function mixin:IsDualSpecEnabled()
	return registry[self].db.char.enabled
end

function mixin:SetDualSpecEnabled(enabled)
	local db = registry[self].db.char
	db.enabled = not not enabled

	local currentProfile = self:GetCurrentProfile()
	for i = 1, numSpecs do
		-- nil out entries on disable, set nil entries to the current profile on enable
		db[i] = enabled and (db[i] or currentProfile) or nil
	end

	self:CheckDualSpecState()
end

function mixin:GetDualSpecProfile(spec)
	return registry[self].db.char[spec or lib.currentSpec] or self:GetCurrentProfile()
end

function mixin:SetDualSpecProfile(profileName, spec)
	spec = spec or lib.currentSpec
	if spec < 1 or spec > numSpecs then return end

	registry[self].db.char[spec] = profileName
	self:CheckDualSpecState()
end

function mixin:CheckDualSpecState()
	if not registry[self].db.char.enabled then return end
	if lib.currentSpec == 0 then return end

	local profileName = self:GetDualSpecProfile()
	if profileName ~= self:GetCurrentProfile() then
		self:SetProfile(profileName)
	end
end

-- ----------------------------------------------------------------------------
-- AceDB-3.0 support
-- ----------------------------------------------------------------------------

local function EmbedMixin(target)
	for k,v in next, mixin do
		rawset(target, k, v)
	end
end

local function UpgradeDatabase(target)
	if lib.currentSpec == 0 then
		upgrades[target] = true
		return
	end

	local db = target:GetNamespace(MAJOR, true)
	if db and db.char.profile then
		for i = 1, numSpecs do
			if i == lib.currentSpec then
				db.char[i] = target:GetCurrentProfile()
			else
				db.char[i] = db.char.profile
			end
		end
		db.char.profile = nil
		db.char.specGroup = nil
	end
end

-- Reset a spec profile to the current one if its profile is deleted.
function lib:OnProfileDeleted(event, target, profileName)
	local db = registry[target].db.char
	if not db.enabled then return end

	for i = 1, numSpecs do
		if db[i] == profileName then
			db[i] = target:GetCurrentProfile()
		end
	end
end

function lib:_EnhanceDatabase(event, target)
	registry[target].db = target:GetNamespace(MAJOR, true) or target:RegisterNamespace(MAJOR)
	EmbedMixin(target)
	target:CheckDualSpecState()
end

function lib:EnhanceDatabase(target, name)
	AceDB3 = AceDB3 or LibStub('AceDB-3.0', true)
	if type(target) ~= "table" then
		error("Usage: LibDualSpec:EnhanceDatabase(target, name): target should be a table.", 2)
	elseif type(name) ~= "string" then
		error("Usage: LibDualSpec:EnhanceDatabase(target, name): name should be a string.", 2)
	elseif not AceDB3 or not AceDB3.db_registry[target] then
		error("Usage: LibDualSpec:EnhanceDatabase(target, name): target should be an AceDB-3.0 database.", 2)
	elseif target.parent then
		error("Usage: LibDualSpec:EnhanceDatabase(target, name): cannot enhance a namespace.", 2)
	elseif registry[target] then
		return
	end
	registry[target] = { name = name }
	UpgradeDatabase(target)
	lib:_EnhanceDatabase("EnhanceDatabase", target)
	target.RegisterCallback(lib, "OnDatabaseReset", "_EnhanceDatabase")
	target.RegisterCallback(lib, "OnProfileDeleted")
end

-- ----------------------------------------------------------------------------
-- AceDBOptions-3.0 support
-- ----------------------------------------------------------------------------

local function NoDualSpec()
	return UnitLevel("player") < 11
end

options.new = {
	name = "New",
	type = "input",
	order = 30,
	get = false,
	set = function(info, value)
		local db = info.handler.db
		if db:IsDualSpecEnabled() then
			db:SetDualSpecProfile(value, lib.currentSpec)
		else
			db:SetProfile(value)
		end
	end,
}

options.choose = {
	name = "Existing Profiles",
	type = "select",
	order = 40,
	get = "GetCurrentProfile",
	set = "SetProfile",
	values = "ListProfiles",
	arg = "common",
	disabled = function(info)
		return info.handler.db:IsDualSpecEnabled()
	end
}

options.enabled = {
	name = "|cffffd200"..L_ENABLED.."|r",
	desc = L_ENABLED_DESC,
	descStyle = "inline",
	type = "toggle",
	order = 41,
	width = "full",
	get = function(info) return info.handler.db:IsDualSpecEnabled() end,
	set = function(info, value) info.handler.db:SetDualSpecEnabled(value) end,
	hidden = NoDualSpec,
}

for i = 1, numSpecs do
	local _, specName = GetSpecializationInfoForClassID(classId, i)
	options["specProfile" .. i] = {
		type = "select",
		name = function() return lib.currentSpec == i and L_CURRENT:format(specName) or specName end,
		order = 42 + i,
		get = function(info) return info.handler.db:GetDualSpecProfile(i) end,
		set = function(info, value) info.handler.db:SetDualSpecProfile(value, i) end,
		values = "ListProfiles",
		arg = "common",
		disabled = function(info) return not info.handler.db:IsDualSpecEnabled() end,
		hidden = NoDualSpec,
	}
end

function lib:EnhanceOptions(optionTable, target)
	AceDBOptions3 = AceDBOptions3 or LibStub('AceDBOptions-3.0', true)
	AceConfigRegistry3 = AceConfigRegistry3 or LibStub('AceConfigRegistry-3.0', true)
	if type(optionTable) ~= "table" then
		error("Usage: LibDualSpec:EnhanceOptions(optionTable, target): optionTable should be a table.", 2)
	elseif type(target) ~= "table" then
		error("Usage: LibDualSpec:EnhanceOptions(optionTable, target): target should be a table.", 2)
	elseif not AceDBOptions3 or not AceDBOptions3.optionTables[target] then
		error("Usage: LibDualSpec:EnhanceOptions(optionTable, target): optionTable is not an AceDBOptions-3.0 table.", 2)
	elseif optionTable.handler.db ~= target then
		error("Usage: LibDualSpec:EnhanceOptions(optionTable, target): optionTable must be the option table of target.", 2)
	elseif not registry[target] then
		error("Usage: LibDualSpec:EnhanceOptions(optionTable, target): EnhanceDatabase should be called before EnhanceOptions(optionTable, target).", 2)
	end

	-- localize our replacements
	options.new.name = optionTable.args.new.name
	options.new.desc = optionTable.args.new.desc
	options.choose.name = optionTable.args.choose.name
	options.choose.desc = optionTable.args.choose.desc

	-- add our new options
	if not optionTable.plugins then
		optionTable.plugins = {}
	end
	optionTable.plugins[MAJOR] = options
end

-- ----------------------------------------------------------------------------
-- Upgrade existing
-- ----------------------------------------------------------------------------

for target in next, registry do
	UpgradeDatabase(target)
	EmbedMixin(target)
	target:CheckDualSpecState()
	local optionTable = AceDBOptions3 and AceDBOptions3.optionTables[target]
	if optionTable then
		lib:EnhanceOptions(optionTable, target)
	end
end

-- ----------------------------------------------------------------------------
-- Inspection
-- ----------------------------------------------------------------------------

local function iterator(registry, key)
	local data
	key, data = next(registry, key)
	if key then
		return key, data.name
	end
end

function lib:IterateDatabases()
	return iterator, lib.registry
end

-- ----------------------------------------------------------------------------
-- Switching logic
-- ----------------------------------------------------------------------------

local function eventHandler(self, event)
	lib.currentSpec = GetSpecialization() or 0

	if event == "PLAYER_LOGIN" then
		self:UnregisterEvent(event)
		self:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	end

	if lib.currentSpec > 0 and next(upgrades) then
		for target in next, upgrades do
			UpgradeDatabase(target)
		end
		wipe(upgrades)
	end

	for target in next, registry do
		target:CheckDualSpecState()
	end

	if AceConfigRegistry3 and next(registry) then
		for appName in AceConfigRegistry3:IterateOptionsTables() do
			AceConfigRegistry3:NotifyChange(appName)
		end
	end
end

lib.eventFrame:SetScript("OnEvent", eventHandler)
if IsLoggedIn() then
	eventHandler(lib.eventFrame, "PLAYER_LOGIN")
else
	lib.eventFrame:RegisterEvent("PLAYER_LOGIN")
end

--[[@do-not-package@
if not lib.testdb then
	local AC = LibStub("AceConfig-3.0", true)
	local ACD = LibStub("AceConfigDialog-3.0", true)
	local ADO = LibStub("AceDBOptions-3.0", true)
	if AC and ACD and ADO then
		local key = format("%s-%d test", MAJOR, MINOR)
		local testdb = LibStub('AceDB-3.0'):New(key)
		lib.testdb = testdb
		testdb:RegisterCallback("OnNewProfile", print)
		testdb:RegisterCallback("OnProfileChanged", print)
		testdb:RegisterCallback("OnProfileShutdown", print)
		testdb:RegisterCallback("OnProfileCopied", print)
		testdb:RegisterCallback("OnProfileDeleted", print)
		testdb:RegisterCallback("OnProfileReset", print)
		testdb:RegisterCallback("OnDatabaseReset", print)
		testdb:RegisterCallback("OnDatabaseShutdown", print)
		lib:EnhanceDatabase(testdb, key)
		local options = ADO:GetOptionsTable(testdb)
		lib:EnhanceOptions(options, testdb)
		AC:RegisterOptionsTable(key, options)
		SlashCmdList["SPECPROFILES"] = function() ACD:Open(key) end
		SLASH_SPECPROFILES1 = "/testdb"
	end
end
--@end-do-not-package@]]
