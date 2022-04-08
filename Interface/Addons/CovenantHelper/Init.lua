local addonName, addon = ...
local AceAddon, AceAddonMinor = LibStub('AceAddon-3.0')
local AceLocale, AceLocaleMinor = LibStub("AceLocale-3.0")
local AceDB, AceDBMinor = LibStub("AceDB-3.0")
local ActConfigHelper, ActConfigHelperMinor = LibStub('LibAceConfigHelper')
local E = AceAddon:NewAddon(addonName, 'AceEvent-3.0')
local L = AceLocale:GetLocale(addonName, false)

local defaults = { profile = { } }

E.Locale = GetLocale()

E.INVAILD_OPTION_KEY = -1  --无效的选项Key值
E.DEFAULT_DISPLAY_TIME = 8
E.DEFAULT_DISPLAY_DELAY_TIME = 2
E.DEFAULT_FONT_OUTLINE = "OUTLINE"
E.DEFAULT_FONT_SIZE = 40
E.DEFAULT_FONT_SHADOW = true

_G[addonName] = 
{
    E, 
    L, 
}

local covenantIconStrings = {
    "sanctumupgrades-kyrian-32x32", -- 1 Kyrian    
    "sanctumupgrades-venthyr-32x32", -- 2 Venthyr    
    "sanctumupgrades-nightfae-32x32", -- 3 NightFae    
    "sanctumupgrades-necrolord-32x32", -- 4 Necrolord   
}

local covenantColorStrings = {
    "FF3FC7EB",
    "FFC41E3B",
    "FF006FDC",
    "FF008467",
}

local subModule = {
    "Soulbind",
    "EquipmentSet",
}

function E:formatCovenantStrings(text, covenantID)
    local icon = covenantIconStrings[covenantID] or ""
    return "|A:" .. icon .. ":16:16|a " .. WrapTextInColorCode(text or "", covenantColorStrings[covenantID] or "FFFFFFFF")
end

function E:formatSpecStrings(classID, specID)
    local _, name, _, icon, _ = GetSpecializationInfoForClassID(classID, specID)
    return "|T" .. (icon or "") .. ":14|t  " .. (name or "")
end

function E:formatEquipmentSetStrings(equipmentSetID)
    local name, icon = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
    return "|T" .. (icon or "") .. ":14|t  " .. (name or "")
end

function E:RegisterSlashCommand()
    local slash = {
        "cth",
        "covenanthelper",
    }

    for k, v in ipairs(slash) do
        _G["SLASH_" .. string.upper(addonName) .. tostring(k)] = "/" .. string.upper(v)
    end

    _G.SlashCmdList[string.upper(addonName)] = function(msg, editbox)
        InterfaceOptionsFrame_OpenToCategory(addonName)
        InterfaceOptionsFrame_OpenToCategory(addonName)
    end
end

function E:showPresetInfo(result)
    if not result or #result == 0 then
        return
    end

    local str = ""

    local function appendMessage(message)
        str = str .. message .. "\n"
    end

    local function recheck(moduleName)
        local module = E:GetModule(moduleName)
        if module then
            return module:recheck()
        end

        return false, "Unknow Error"
    end

    for _, v in ipairs(result) do
        --如果第一次操作就失败了，则直接返回错误
        if not v.success then
            appendMessage(v.errmsg)
        else
            --第二次检查（其实更多的是为了输出信息）
            local success, message = recheck(v.module)
            if not success then
                appendMessage(message)
            else
                appendMessage(message)
            end
        end
    end

    E.Display:ShowMessage(str)
end

function E:isEnable()
    --未开启功能，则不触发
    local enable = E.Config:GetValue({"enable"}) or false
    if not enable then
        return false
    end

    --没有选择盟约，则不触发
    local covenantID = C_Covenants.GetActiveCovenantID()
    if covenantID == Enum.CovenantType.None then
        return false
    end

    return true
end

function E:EQUIPMENT_SETS_CHANGED(event)
    if not self:isEnable() then
        return
    end
end

function E:doAction()
    --遍历模块
    local result = {}

    for _, v in ipairs(subModule) do
        local module = E:GetModule(v)
        if module then
            local success, errmsg = module:action()
            table.insert(result, {
                module = v,
                success = success,
                errmsg = errmsg
            })
        end
    end

    local delay = E.Config:GetValue({ "delayTime" }) or E.DEFAULT_DISPLAY_DELAY_TIME

    --设置2秒后，显示变更信息
    C_Timer.NewTimer(delay, function()
        self:showPresetInfo(result)
    end)
end

function E:COVENANT_CHOSEN(event, covenantID)
    if not self:isEnable() then
        return
    end

    self:doAction()
end

function E:PLAYER_SPECIALIZATION_CHANGED(event, unitTarget)
    if not self:isEnable() then
        return
    end
    
    if (not(unitTarget == "player") or GetSpecialization() == self.currentSpec) then
        return 
    end

    self.currentSpec = GetSpecialization()

    self:doAction()
end

function E:OnInitialize()
    -- 构建默认的配置文件
    if not E.Config then
        error("Can't get config module")
    end

    if not E.Dialog then
        error("Can't get dialog module")
    end

    if not E.Display then
        error("Can't get display module")
    end

    local defaults = E.Config:GetDefaultConfiguration()
    E.DB = AceDB:New("CovenantHelperDB", defaults)
    
    --
    E.Dialog:CreateWindow()

    self.currentSpec = GetSpecialization()
    --配装方案发生变化
    self:RegisterEvent("EQUIPMENT_SETS_CHANGED")
    --切换盟约
    self:RegisterEvent("COVENANT_CHOSEN")
    --切换天赋
    self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    
    self:RegisterSlashCommand()
end
