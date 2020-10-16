-- ItemViewer.lua(Mainly for corruption)
-- @Author : ynyzyfy
-- @Date   : 2020-03-01
-- Todo:Leave Party RESET data
MEETING_STONE_TEMP_DB_CORRUPTION = {}
BuildEnv(...)

ItemViewer = Addon:NewModule('ItemViewer', 'AceEvent-3.0', 'AceTimer-3.0')

local inspectScantip = CreateFrame("GameTooltip", "MeetingStoneItemCorruptionScanToolTip", nil, "GameTooltipTemplate")
inspectScantip:SetOwner(UIParent, "ANCHOR_NONE")
local corruptionRegex = "%+(%d+) "..ITEM_MOD_CORRUPTION.."$"

local itemsSlotTable = {
	1,	--INVSLOT_HEAD
	2,	--INVSLOT_NECK
	3,	--INVSLOT_SHOULDER
	15,	--INVSLOT_BACK
	5,	--INVSLOT_CHEST
	9,	--INVSLOT_WRIST
	10,	--INVSLOT_HAND
	6,	--INVSLOT_WAIST
	7,	--INVSLOT_LEGS
	8,	--INVSLOT_FEET
	11,	--INVSLOT_FINGER1
	12,	--INVSLOT_FINGER2
	13,	--INVSLOT_TRINKET1
	14,	--INVSLOT_TRINKET2
	16,	--INVSLOT_MAINHAND
	17,	--INVSLOT_OFFHAND
}
local corruptionTable = {
    [6474] = "6%渠道急速",
    [6475] = "9%渠道急速",
    [6476] = "12%渠道急速",

    [6471] = "6%渠道精通",
    [6455] = "6%渠道精通",
    [6472] = "9%渠道精通",
    [6473] = "12%渠道精通",

    [6480] = "6%渠道爆击",
    [6481] = "9%渠道爆击",
    [6482] = "12%渠道爆击",

    [6477] = "6%渠道全能",
    [6478] = "9%渠道全能",
    [6479] = "12%渠道全能", --错误修正

    [6437] = "2%爆伤",
    [6438] = "3%爆伤",
    [6439] = "4%爆伤",

    [6555] = "1级触发急速",
    [6559] = "2级触发急速",
    [6560] = "3级触发急速",

    [6558] = "1级触发全能",
    [6565] = "2级触发全能",
    [6566] = "3级触发全能",

    [6557] = "1级触发精通",
    [6563] = "2级触发精通",
    [6564] = "3级触发精通",

    [6556] = "1级叠加爆击",
    [6561] = "2级叠加爆击",
    [6562] = "3级叠加爆击", --错误修正

    [6549] = "1级虚空回响",
    [6550] = "2级虚空回响",
    [6551] = "3级虚空回响",

    [6552] = "1级无尽之星",
    [6553] = "2级无尽之星",
    [6554] = "3级无尽之星",

    [6537] = "1级暮光炮",
    [6538] = "2级暮光炮",
    [6539] = "3级暮光炮",

    [6543] = "1级附肢",
    [6544] = "2级附肢",
    [6545] = "3级附肢",

    [6540] = "1级虚空仪式",
    [6541] = "2级虚空仪式",
    [6542] = "3级虚空仪式",

    [6547] = "1级冷却减30%",
    [6548] = "2级冷却减50%",

    [6573] = "龟裂创伤",
    [6546] = "须臾洞察",
	
	[6483] = "8%急速的闪避",
    [6484] = "12%急速的闪避",
    [6485] = "16%急速的闪避",

    [6493] = "3%吸血",
    [6494] = "5%吸血",
    [6495] = "8%吸血",

    [6571] = "灼热烈焰",
    [6572] = "黑曜石之肤", 
    [6567] = "吞噬活力",
    [6568] = "低语真相",
    [6570] = "灵光一闪",
    [6569] = "虚空鞭笞",
}

function DelUnitNameServer(unitName)
	unitName = strsplit("-",unitName)
	return unitName
end

function InspectItems(name,inspectedName)
    -- Some code is modified from ExRT
    local link16 = nil
    local link17 = nil
    local totalCorruption = 0
    local totalResistance = 0
    local corruptionNames = {}
    local corruptionCounts = {}
    for i=1,#itemsSlotTable do
        local itemSlotID = itemsSlotTable[i]
        inspectScantip:SetInventoryItem(inspectedName, itemSlotID)
        local _,itemLink = inspectScantip:GetItem()
        if(itemSlotID == 16) then
            link16 = itemLink
        end
        if(itemSlotID == 17) then
            link17 = itemLink
        end
        if(link17 ~= nil and link16 == link17) then
            itemLink = nil
        end
        if(itemLink) then
            for j=2, inspectScantip:NumLines() do
                local tooltipLine = _G["MeetingStoneItemCorruptionScanToolTipTextLeft"..j]
                local text = tooltipLine:GetText()
                if text and text ~= "" then
                    if(itemSlotID == 2) then
                        -- HARDCODED .otherwise use itemid to detect
                        if(string.find(text,"无形虚空") ~= nil or string.find(text,"濒死之息") ~= nil or string.find(text,"灵感火花") ~= nil or string.find(text,"勇卫之力") ~= nil or string.find(text,"永生之触") ~= nil or string.find(text,"坚壁结界") ~= nil or string.find(text,"救世之魂") ~= nil) then
                            totalResistance = 10
                        end 
                    end
                    if(itemSlotID == 15) then
                        if(text:find(ITEM_MOD_CORRUPTION_RESISTANCE) ~= nil) then
                            local temp,_ = string.gsub(text,ITEM_MOD_CORRUPTION_RESISTANCE,"")
                            temp,_ = string.gsub(temp,"+","")
                            totalResistance = totalResistance + tonumber(temp)
                        end
                    end
                    local findText = text:gsub("[,]",""):gsub("(%d+)[ ]+(%d+)","%1%2")
                    local findData = findText:match(corruptionRegex)
                    if findData then
                        local cR,cG,cB = tooltipLine:GetTextColor()
                        cR = abs(cR - 0.5)
                        cG = abs(cG - 0.5)
                        cB = abs(cB - 0.5)
                        if cR < 0.01 and cG < 0.01 and cB < 0.01 then
                            findData = 0
                        end
                        totalCorruption = totalCorruption + tonumber(findData)
                        local corruptionName = GetCorruptionNameWithLevel(itemLink)
                        if(corruptionName ~= "") then
                            table.insert(corruptionNames,corruptionName)
                        end
                        -- check same corruptions
                        local found = false
                        for corrName,corrCount in pairs(corruptionCounts) do
                            if(corrName == corruptionName) then
                                corruptionCounts[corrName] = corruptionCounts[corrName] + 1
                                found = true
                            end
                        end
                        if( not found) then
                            corruptionCounts[corruptionName] = 1
                        end
                    end
                end
            end
        end
    end     
    local finalData = {};
    finalData["totalCorruption"] = totalCorruption - totalResistance
    finalData["corruptionNames"] = corruptionNames
    finalData["playerName"] = name
    finalData["corruptionCombined"] = corruptionCounts
    AddOrUpdateData(finalData)
end

function AddOrUpdateData(data)
    local playerName = data.playerName
    for name,corruptionData in pairs(MEETING_STONE_TEMP_DB_CORRUPTION) do
        if(playerName == name) then
            MEETING_STONE_TEMP_DB_CORRUPTION[playerName] = data
            return
        end
    end
    MEETING_STONE_TEMP_DB_CORRUPTION[playerName] = data
end
function GetCorruptionNameWithLevel(itemLink)
    for bonusId,corruptionName in pairs(corruptionTable) do
        local strToFind = ":"..bonusId..":"
        if(itemLink:find(strToFind)) then
            return corruptionName
        end
    end
    return ""
end

function ItemViewer:OnInitialize()
end

function ItemViewer:OnEnable()
    self:RegisterEvent('INSPECT_READY')    
end

function ItemViewer:INSPECT_READY(event,arg)
    local _,_,_,race,_,name,realm = GetPlayerInfoByGUID(arg)
    if name then
        if realm and realm ~= "" then name = name.."-"..realm end
        local inspectedName = name
        if UnitName("target") == DelUnitNameServer(name) then 
            inspectedName = "target"
        elseif not UnitName(name) then
            return
        end
        InspectItems(name, inspectedName)
    end
end 

ItemViewer:OnEnable()