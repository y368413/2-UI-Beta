local addonName, addon = ...
local E, L = unpack(_G[addonName])
local Module = E:NewModule('EquipmentSet')

function Module:getOptionName()
    return L["dialog.title.equipmentset"]
end

function Module:makeOptions(specID, covenantID)
    local makedData = 
    {
        [-1] = L["dialog.default"],
    }

    local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()

    if equipmentSetIDs and #equipmentSetIDs > 0 then
        for _, equipmentSetID in ipairs(equipmentSetIDs) do
            local name = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
            if name then
                --此处用配装的ID做Key，可以防止很多额外错误
                makedData[equipmentSetID] = name
            end
        end
    end

    return makedData
end

function Module:recheck()
    --你尚未加入盟约，检查盟约状态
    local covenantID = C_Covenants.GetActiveCovenantID()
    if not covenantID or covenantID == Enum.CovenantType.None then
        return false, L["dialog.err.invaildcovenant"]
    end

    local specID = GetSpecialization()

    local path = {
        tostring(specID),
        tostring(covenantID),
        self:GetName()
    }

    local equipmentSetID = E.Config:GetValue(path) or E.INVAILD_OPTION_KEY

    --如果是默认值，直接返回
    if equipmentSetID == E.INVAILD_OPTION_KEY then
        --尝试获取当前激活中的套装名字
        local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()
        if equipmentSetIDs and #equipmentSetIDs > 0 then
            for _, equipmentSetID in ipairs(equipmentSetIDs) do
                local equipmentSetName, _, _, isEquipped = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
                if equipmentSetName and isEquipped then
                    return true, L["dialog.activate.equipment"] .. equipmentSetName
                end
            end
        end

        return true, L["dialog.activate.equipment"] .. L["dialog.default"]
    end

    --进行是否有效的检测
    --此处不做是否可以切换的检查了，有可能正处于切换状态，导致显示错误。
    --只检查配装方案是否存在把，用于显示配装的名字
    local equipmentSetName, _, _,isEquipped = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
    if not equipmentSetName then
        return false, L["dialog.err.invaildequipments"]
    end

    if not isEquipped then
        return false, L["dialog.err.changeequipmentsetfailed"]
    end
    
    return true, L["dialog.activate.equipment"] .. equipmentSetName
    --E:formatEquipmentSetStrings(equipmentSetID)
end


--执行切换逻辑，并返回结果以及错误信息
function Module:action()
    --你尚未加入盟约，检查盟约状态
    local covenantID = C_Covenants.GetActiveCovenantID()
    if not covenantID or covenantID == Enum.CovenantType.None then
        return false, L["dialog.err.invaildcovenant"]
    end

    local specID = GetSpecialization()

    local path = {
        tostring(specID),
        tostring(covenantID),
        self:GetName()
    }

    local equipmentSetID = E.Config:GetValue(path) or E.INVAILD_OPTION_KEY

    --如果是保持不变，则直接返回
    if equipmentSetID == E.INVAILD_OPTION_KEY then
        return true
    end

    --判断当前状态下，是否可以切换装备
    if not C_EquipmentSet.CanUseEquipmentSets() then
        return false, L["dialog.err.cantuseequipments"] --Can't Use EquipmentSets
    end

    --判断配装方案是否存在
    if not C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID) then
        return false, L["dialog.err.invaildequipments"]
    end

    --执行一次切换，判断是否成功
    local setWasEquipped = C_EquipmentSet.UseEquipmentSet(equipmentSetID)
    if not setWasEquipped then  --返回false代表失败
        return false, L["dialog.err.useequipmentset"]
    end

    return true
end

function Module:OnInitialize()
    --self:do_update()
end