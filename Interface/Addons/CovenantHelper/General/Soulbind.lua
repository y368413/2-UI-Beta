local addonName, addon = ...
local E, L = unpack(_G[addonName])
local Module = E:NewModule('Soulbind')

function Module:getOptionName()
    return L["dialog.title.soulbind"]
end

function Module:makeOptions(specID, covenantID)
    local makedData = 
    {
        [-1] = L["dialog.default"],
    }

    local covenantData = C_Covenants.GetCovenantData(covenantID)
    if covenantData then
        for _, v in ipairs(covenantData.soulbindIDs) do
            local soulData = C_Soulbinds.GetSoulbindData(v)
            if soulData then
                --rawset(makedData, v, soulData.name)
                makedData[v] = soulData.name
            end
        end
    end

    --dump(makedData)
    return makedData
end

function Module:recheck()
    --先检查盟约状态
    local covenantID = C_Covenants.GetActiveCovenantID()
    if not covenantID or covenantID == Enum.CovenantType.None then
        return false, L["dialog.err.invaildcovenant"]
    end

    local specID = GetSpecialization()

    --再检查激活中的灵魂羁绊
    local activeSoulbindID = C_Soulbinds.GetActiveSoulbindID()
    local soulData = C_Soulbinds.GetSoulbindData(activeSoulbindID)
    
    --如果灵魂羁绊不对
    if not soulData then
        return false, L["dialog.err.invaildsoulbind"]
    end
    
    --在检查配置中的盟约羁绊与实际的盟约羁绊
    local path = {
        tostring(specID),
        tostring(covenantID),
        self:GetName()
    }

    local soulbindID = E.Config:GetValue(path) or E.INVAILD_OPTION_KEY

    --如果当前激活的羁绊与实际要求的不一样，则需要做检查了！
    if soulbindID ~= E.INVAILD_OPTION_KEY and soulbindID ~= activeSoulbindID then
        return false, L["dialog.err.changesoulbindfailed"]
    end

    --如果对的上，则返回
    return true, L["dialog.activate.soulbind"] .. E:formatCovenantStrings(soulData.name, covenantID)
end

function Module:action()
    --你尚未加入盟约，检查盟约状态
    local covenantID = C_Covenants.GetActiveCovenantID()
    if not covenantID or covenantID == Enum.CovenantType.None then
        return false, L["dialog.err.invaildcovenant"]
    end
        
    local specID = GetSpecialization()

    --在检查配置中的盟约羁绊与实际的盟约羁绊
    local path = {
        tostring(specID),
        tostring(covenantID),
        self:GetName()
    }

    local soulbindID = E.Config:GetValue(path) or E.INVAILD_OPTION_KEY

    --如果是保持不变，则直接返回
    if soulbindID == E.INVAILD_OPTION_KEY then
        return true
    end

    --已经有了羁绊ID了，不需要再去盟约处取
    if not C_Soulbinds.CanActivateSoulbind(soulbindID) then
        return false, L["dialog.err.activatesoulbind"] --Can't Activate Soulbind
    end

    C_Soulbinds.ActivateSoulbind(soulbindID)

    return true
end