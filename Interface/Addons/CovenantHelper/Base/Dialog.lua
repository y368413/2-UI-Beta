local addonName, addon = ...
local E, L = unpack(_G[addonName])
local Module = E:NewModule('Dialog')
--local AceGUI, AceGuiMinor = LibStub("AceGUI-3.0")
local AceConfig, AceConfigMinor = LibStub('AceConfig-3.0')
local AceConfigDialog, AceConfigDialogMinor = LibStub('AceConfigDialog-3.0')
local AceConfigRegistry, AceConfigRegistryMinor = LibStub('AceConfigRegistry-3.0')
local ActConfigHelper, ActConfigHelperMinor = LibStub('LibAceConfigHelper')
local AceDBOptions, AceDBOptionsMinor = LibStub("AceDBOptions-3.0")
E.Dialog = Module

--有构建或切换需求的模块
local subModule = {
    "Soulbind",    
    "EquipmentSet",
}

function Module:CreateSubSelects(specID, covenantID, parent, order)
    if not parent then
        return
    end

    order = order and order + 1 or 1

    --遍历模块
    for _, v in ipairs(subModule) do
        local module = E:GetModule(v)
        if module then
            --先随意获取一次，不在乎结果，只要随便有一条既可
            local data = module:makeOptions(specID, covenantID) or nil
            local name = module:getOptionName() or nil
            if name and data then
                --生成下拉选框
                parent.args[v] = ActConfigHelper:Select(
                    name,
                    nil,
                    order,
                    function(...)
                        --之后获取数据，会走这里。因此保证了每次数据都是最新的
                        return module:makeOptions(specID, covenantID)
                    end
                )
            end
        end
        order = order + 1
    end
end

function Module:GetProfileValue(specKey, covenantKey, info)
    local name = info[#info]
    if not E.Config then
        return E.INVAILD_OPTION_KEY
    end

    return E.Config:GetValue({specKey, covenantKey, name}) or E.INVAILD_OPTION_KEY
end

function Module:SetProfileValue(specKey, covenantKey, info, value)
    local name = info[#info]
    if not E.Config then
        return
    end

    E.Config:SetValue({specKey, covenantKey, name}, value)
end

function Module:CreateCovenantGroup(specID, parent, order)
    order = order or 0
    local covenantIDs = C_Covenants.GetCovenantIDs()

    for _, covenantID in ipairs(covenantIDs) do
        local covenantData = C_Covenants.GetCovenantData(covenantID)
        if not covenantData then
            error("Can't GetCovenantData with key: " .. covenantID)
        else
            local covenantKey = tostring(covenantID)
            local specKey = tostring(specID)
            local covenantOrder = order + (covenantID * 100)
            local covenantGroup = ActConfigHelper:Group(E:formatCovenantStrings(covenantData.name, covenantID), nil, covenantOrder, nil, nil)
            --是内部资源，处于上一个group内
            covenantGroup.inline = true
            covenantGroup.get = function(...) return self:GetProfileValue(specKey, covenantKey, ...) end
            covenantGroup.set = function(...) return self:SetProfileValue(specKey, covenantKey, ...) end

            self:CreateSubSelects(specID, covenantID, covenantGroup, covenantOrder)

            parent.args[covenantKey] = covenantGroup
        end
    end
end

function Module:CreateSpecializationsInfo(parent, order)
    order = order or 0
    --构建左侧的专精树
    local classID = select(3, UnitClass("player"))
    local numSpecs = GetNumSpecializationsForClassID(classID)
    
    for specID = 1, numSpecs do
        local specKey = tostring(specID)
        local specOrder = order + (specID * 1000)
        local specGroup = ActConfigHelper:Group(E:formatSpecStrings(classID, specID), nil, specOrder, nil, nil)

        --构建盟约列
        self:CreateCovenantGroup(specID, specGroup)
        parent.args[specKey] = specGroup
    end
end

function Module:CreateWindow()
    E.Options = ActConfigHelper:Group(addonName, nil, 0, "tab")
    E.Options.args.vers = ActConfigHelper:Description("|cffffd700".."Version:".."|r "..GetAddOnMetadata(addonName, "Version").."", 1, nil, nil, nil, nil, nil, "half")
    --E.Options.args.author = ActConfigHelper:Description("|cffffd700".."Author:".."|r "..GetAddOnMetadata(addonName, "Author").."", 4, nil, nil, nil, nil, nil, "half")
    E.Options.args.desc = ActConfigHelper:Description(L["dialog.description"], 2, "medium")
    E.Options.args.spacer1 = ActConfigHelper:Spacer(5)

    --E.Options.args.spacer2 = ActConfigHelper:Spacer(5)

    E.Options.args.enable = ActConfigHelper:Toggle(L["dialog.enable"], nil, 10, nil, nil, nil,
        function(info) 
            local name = info[#info]
            local value = E.Config:GetValue({ name }) 
            return value
        end,
        function(info, value)
            local name = info[#info]
            E.Config:SetValue({name}, value)
        end
    )

    self:Refresh()
    
    --local slashcmd = {"ch", "covenanthhelper", "cth"}
    AceConfig:RegisterOptionsTable(addonName, E.Options)
    AceConfigDialog:AddToBlizOptions(addonName, addonName)
end

function Module:Refresh()
    local preset = ActConfigHelper:Group(L["dialog.title.preset"], nil, 10)
    E.Options.args.preset = preset

    self:CreateSpecializationsInfo(E.Options.args.preset, 0)

    E.Options.args.profile = AceDBOptions:GetOptionsTable(E.DB)
    E.Options.args.profile.order = 100000
end

function Module:OnInitialize()
end