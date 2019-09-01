local addon, ns = ...
local OmniCD = LibStub("AceAddon-3.0"):NewAddon(addon, "AceEvent-3.0")
ns.OmniCD = OmniCD
local L = LibStub("AceLocale-3.0"):GetLocale(addon)
OmniCD.L = L

local db
local eventList = {}
ns.eventList = eventList

OmniCD.defaults = { profile = { modules = {} }}

local DB_VERSION = 1

function OmniCD:OnInitialize()

    if not OmniCDDB then
        OmniCDDB = { version = DB_VERSION }
    elseif not OmniCDDB.version then
        for k, v in pairs(OmniCDDB.profiles) do
            if OmniCDDB.profiles[k].visibility then
                OmniCDDB.profiles[k].visibility.premade = nil
            end
            OmniCDDB.profiles[k].Party = self:DeepCopy(OmniCDDB.profiles[k])
            OmniCDDB.profiles[k].Party.spells = {}
            for s, p in pairs(v) do
                if s ~= "Party" then
                    OmniCDDB.profiles[k][s] = nil
                else
                    for key, value in pairs(p) do
                        if match(key, "^spell") and type(value) == "boolean" then
                            OmniCDDB.profiles[k].Party.spells[key] = value
                            OmniCDDB.profiles[k].Party[key] = nil
                        end
                    end
                end
            end
        end
        OmniCDDB.version = DB_VERSION
    end

    self.db = LibStub("AceDB-3.0"):New("OmniCDDB", self.defaults, true)
    db = self.db.profile

    self.callbacks = LibStub("CallbackHandler-1.0"):New(self)

    self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
    self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
    self.db.RegisterCallback(self, "OnProfileReset", "Refresh")

    for modname, module in OmniCD:IterateModules() do
        eventList[modname] = {}
    end

    OmniCDDB.cooldowns = OmniCDDB.cooldowns or {}
    self:AddCustomSpells(true)
    self:SetupOptions()
end

function OmniCD:OnEnable()
    C_ChatInfo.RegisterAddonMessagePrefix("OmniCD")

    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("CVAR_UPDATE")
    self:RegisterEvent("UI_SCALE_CHANGED")


    SLASH_OmniCD1 = "/oc"
    SLASH_OmniCD2 = "/omnicd"
    SlashCmdList.OmniCD = function(msg)
        local AceRegistry = LibStub("AceConfigRegistry-3.0")
        local command, value = msg:match("^(%S*)%s*(.-)$");
        if command == "help" or command == "?" then
            self.write("v"..GetAddOnMetadata(addon, "Version"))
            self.write("Usage: /oc <command> or /omnicd <command>")
            self.write("commands:")
            self.write("reload: reload addon")
            self.write("reset: reset timers")
            self.write("test: toggle test mode")
        elseif command == "reload" or command == "rl" then
            self:Refresh()
        elseif command == "reset" or command == "rt" then
            self:ResetAllIcons()
        elseif command == "reset profile" or command == "rp" then
            self.db:ResetProfile()
            AceRegistry:NotifyChange(addon)
        elseif command == "test" or command == "t" then
            self:Test()
        elseif command == "all" then
            self:CheckSpells(value)
            AceRegistry:NotifyChange(addon)
        else
            local AceDialog = LibStub("AceConfigDialog-3.0")
            AceDialog:SetDefaultSize(addon, 700, 500)
            AceDialog:Open(addon)
        end
    end

    ns.playerRaceID = select(3, UnitRace("player"))
    ns.playerClass = select(2, UnitClass("player"))
    ns.playerGUID = UnitGUID("player")
    ns.playerName = UnitName("player")

    if db.tooltipID then ns.TooltipID:HookAll() end

    if IsAddOnLoaded("OmniCC") then ns.omniCC = true end
    if IsAddOnLoaded("tullaCC") then ns.tullaCC = true end
end

function OmniCD.write(msg)
    print("|cfffe7b2cOmniCD:|r "..msg)
end

do
    function OmniCD:GetModuleEnabled(k)
        return db.modules[k]
    end

    function OmniCD:SetModuleEnabled(k, value)
        db.modules[k] = value
        if value then
            self:EnableModule(k)
        else
            self:DisableModule(k)
        end
    end
end

do
    function OmniCD_SavePosition(f)
        local x = f:GetLeft()
        local y = f:GetTop()
        local s = f:GetEffectiveScale()
        x = x * s
        y = y * s

        db[f.modname].position[f.key] = db[f.modname].position[f.key] or {}
        local db = db[f.modname].position[f.key]
        db.x = x
        db.y = y
    end

    function OmniCD.LoadPosition(f)
        db[f.modname].position[f.key] = db[f.modname].position[f.key] or {}
        local db = db[f.modname].position[f.key]
        local x = db.x
        local y = db.y

        f:ClearAllPoints()
        if not x then
            f:SetPoint("CENTER", UIParent)
            OmniCD_SavePosition(f)
        else
            local s = f:GetEffectiveScale()
            x = x / s
            y = y / s
            f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
        end
    end

    function OmniCD:UpdatePosition(f)
        self.LoadPosition(f)
        local parentWidth = UIParent:GetWidth()
        local clamp = f.settings.center and (1 - parentWidth)/2 or 0
        f:SetClampRectInsets(clamp, -clamp, 0, 0)
        clamp = f.settings.center and (f.anchor:GetWidth() - parentWidth)/2 or 0
        f.anchor:SetClampRectInsets(clamp, -clamp, 0, 0)
    end

    function OmniCD.SetAnchorSize(f, height)
        local width = f.anchor.text:GetWidth() + 28
        f.anchor:SetSize(width, height)
    end
end

do
    function OmniCD:UpdateEnabledIDs(module)
        wipe(module.enabledIDs)
        for _, v in pairs(ns.spellList) do
            local n = #v
            for i = 1, n do
                local spell = v[i]
                if module.IsSpellEnabled(spell) then
                    module.enabledIDs[spell.spellID] = true
                end
            end
        end
    end

    function OmniCD.IsTableExact(a, b)
        if #a ~= #b then return false end
        for i = 1, #a do
            if a[i] ~= b[i] then return false end
        end
        return true
    end

    function OmniCD:DeepCopy(source)
        local copy = {}
        if type(source) == "table" then
            for k, v in pairs(source) do
                copy[k] = self:DeepCopy(v)
            end
        else
            copy = source
        end
        return copy
    end

    function OmniCD.GetClassIndexBySpellID(id)
        for class, v in pairs(ns.spellList) do
            for i = 1, #v do
                local spell = v[i]
                if spell.spellID == id then return class, i end
            end
        end
    end

    OmniCD.BackupCooldowns = {}

    function OmniCD:AddCustomSpells(init)
        local spellList = ns.spellList

        for k, v in pairs(self.BackupCooldowns) do
            local class, i = self.GetClassIndexBySpellID(k)
            spellList[class][i] = self:DeepCopy(v)
        end

        for k, v in pairs(OmniCDDB.cooldowns) do
            local class, i = self.GetClassIndexBySpellID(k)
            if class and i then
                if not spellList[class][i].custom then
                    if not self.BackupCooldowns[k] then
                        self.BackupCooldowns[k] = self:DeepCopy(spellList[class][i])
                    end
                    spellList[v.class][i] = v
                else
                    if class ~= v.class then
                        tremove(spellList[class], i)
                        spellList[v.class][#spellList[v.class] + 1] = v
                    else
                        spellList[v.class][i] = v
                    end
                end
            else
                spellList[v.class][#spellList[v.class] + 1] = v
            end
        end

        if not init then
            for k, v in pairs(self.modules) do
                if v.enabledIDs then
                    self:AddSpellsToOptions(k)
                    v:Refresh()
                end
            end
        end
    end
end

do
    function OmniCD:Refresh()
        db = self.db.profile

        for k, v in self:IterateModules() do
            if self:GetModuleEnabled(k) then
                if not v:IsEnabled() then self:EnableModule(k) end
            else
                if v:IsEnabled() then self:DisableModule(k) end
            end
            if v.options then
                self.options.args[k].args.enable.name = self:GetModuleEnabled(k) and DISABLE or ENABLE
                if v:IsEnabled() then v:Refresh(true) end
            end
        end

        if db.tooltipID then
            ns.TooltipID:HookAll()
        else
            ns.TooltipID:UnHookAll()
        end
    end

    function OmniCD:ResetAllIcons()
        for _, v in self:IterateModules() do
            if v.ResetAllIcons and v:IsEnabled() then
                v:ResetAllIcons()
            end
        end
    end

    function OmniCD:Test()
        for _, v in self:IterateModules() do
            if v.Test and v:IsEnabled() then
                v:Test(true)
            end
        end
    end

    function OmniCD:CheckSpells(value)
        for k, v in self:IterateModules() do
            if v.enabledIDs and (value == "" or strlower(value) == strlower(k)) then
                for _, t in pairs(ns.spellList) do
                    for i = 1, #t do
                        local spell = t[i]
                        local spellID = spell.spellID
                        db[k].spells["spell"..spellID] = true
                    end
                end
                self:UpdateEnabledIDs(v)
                if v:IsEnabled() then v:Refresh() end
            end
        end
    end
end

function OmniCD.EnlistEvent(module, event)
    local k = module:GetName()
    if not eventList[k][event] then
        eventList[k][event] = true
        module:RegisterEvent(event)
    end
end

function OmniCD.DelistEvent(module, event)
    local k = module:GetName()
    if eventList[k][event] then
        eventList[k][event] = nil
        module:UnregisterEvent(event)
    end
end

function OmniCD:PLAYER_ENTERING_WORLD()
    local _, instanceType = IsInInstance()
    self.zone = instanceType
    self.isArena = instanceType == "arena"
    self.callbacks:Fire("OnEnteringWorld")
end

function OmniCD:CVAR_UPDATE(_, cvar, value)
    if cvar == "USE_RAID_STYLE_PARTY_FRAMES" then
        self.callbacks:Fire(cvar, value)
    end
end

function OmniCD:UI_SCALE_CHANGED()
    self.callbacks:Fire("OnUIScaleChange")
end
