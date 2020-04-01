local _, ns = ...
local M, R, U, I = unpack(ns)
local TT = M:GetModule("Tooltip")

local ITEM_MOD_CORRUPTION = ITEM_MOD_CORRUPTION
local IsCorruptedItem, GetSpellInfo = IsCorruptedItem, GetSpellInfo
local select, strmatch, gmatch, format = select, strmatch, gmatch, format

local corruptionData = {
	-- Credit: CorruptionNameTooltips
	["6455"] = {spellID = 315607, level = "I"},
	["6483"] = {spellID = 315607, level = "I [10/15/20]"},
	["6484"] = {spellID = 315608, level = "II [10/15/20]"},
	["6485"] = {spellID = 315609, level = "III [10/15/20]"},
	["6474"] = {spellID = 315544, level = "I [10/15/20]"},
	["6475"] = {spellID = 315545, level = "II [10/15/20]"},
	["6476"] = {spellID = 315546, level = "III [10/15/20]"},
	["6471"] = {spellID = 315529, level = "I [10/15/20]"},
	["6472"] = {spellID = 315530, level = "II [10/15/20]"},
	["6473"] = {spellID = 315531, level = "III [10/15/20]"},
	["6480"] = {spellID = 315554, level = "I [10/15/20]"},
	["6481"] = {spellID = 315557, level = "II [10/15/20]"},
	["6482"] = {spellID = 315558, level = "III [10/15/20]"},
	["6477"] = {spellID = 315549, level = "I [10/15/20]"},
	["6478"] = {spellID = 315552, level = "II [10/15/20]"},
	["6479"] = {spellID = 315553, level = "III [10/15/20]"},
	["6493"] = {spellID = 315590, level = "I [10/15/20]"},
	["6494"] = {spellID = 315591, level = "II [10/15/20]"},
	["6495"] = {spellID = 315592, level = "III [10/15/20]"},
	["6437"] = {spellID = 315277, level = "I [10/15/20]"},
	["6438"] = {spellID = 315281, level = "II [10/15/20]"},
	["6439"] = {spellID = 315282, level = "III [10/15/20]"},
	["6555"] = {spellID = 318266, level = "I [15/20/35]"},
	["6559"] = {spellID = 318492, level = "II [15/20/35]"},
	["6560"] = {spellID = 318496, level = "III [15/20/35]"},
	["6556"] = {spellID = 318268, level = "I [15/20/35]"},
	["6561"] = {spellID = 318493, level = "II [15/20/35]"},
	["6562"] = {spellID = 318497, level = "III [15/20/35]"},
	["6558"] = {spellID = 318270, level = "I [15/20/35]"},
	["6565"] = {spellID = 318495, level = "II [15/20/35]"},
	["6566"] = {spellID = 318499, level = "III [15/20/35]"},
	["6557"] = {spellID = 318269, level = "I [15/20/35]"},
	["6563"] = {spellID = 318494, level = "II [15/20/35]"},
	["6564"] = {spellID = 318498, level = "III [15/20/35]"},
	["6549"] = {spellID = 318280, level = "I [25/35/60]"},
	["6550"] = {spellID = 318485, level = "II [25/35/60]"},
	["6551"] = {spellID = 318486, level = "III [25/35/60]"},
	["6552"] = {spellID = 318274, level = "I [25/50/75]"},
	["6553"] = {spellID = 318487, level = "II [25/50/75]"},
	["6554"] = {spellID = 318488, level = "III [25/50/75]"},
	["6547"] = {spellID = 318303, level = "I [12/30]"},
	["6548"] = {spellID = 318484, level = "II [12/30]"},
	["6537"] = {spellID = 318276, level = "I [25/50/75]"},
	["6538"] = {spellID = 318477, level = "II [25/50/75]"},
	["6539"] = {spellID = 318478, level = "III [25/50/75]"},
	["6543"] = {spellID = 318481, level = "I [10/35/66]"},
	["6544"] = {spellID = 318482, level = "II [10/35/66]"},
	["6545"] = {spellID = 318483, level = "III [10/35/66]"},
	["6540"] = {spellID = 318286, level = "I [15/35/66]"},
	["6541"] = {spellID = 318479, level = "II [15/35/66]"},
	["6542"] = {spellID = 318480, level = "III [15/35/66]"},
	["6573"] = {spellID = 318272, level = ""},
	["6546"] = {spellID = 318239, level = ""},
	["6571"] = {spellID = 318293, level = ""},
	["6572"] = {spellID = 316651, level = ""},
	["6567"] = {spellID = 318294, level = ""},
	["6568"] = {spellID = 316780, level = ""},
	["6570"] = {spellID = 318299, level = ""},
	["6569"] = {spellID = 317290, level = ""},
}

-- fixed weapon bonuses for EJ
CorruptionDateW = {
    ["172199"] = "6571", -- Faralos, Empire's Dream
    ["172200"] = "6572", -- Sk'shuul Vaz
    ["172191"] = "6567", -- An'zig Vra
    ["172193"] = "6568", -- Whispering Eldritch Bow
    ["172198"] = "6570", -- Mar'kowa, the Mindpiercer
    ["172197"] = "6569", -- Unguent Caress
    ["172227"] = "6544", -- Shard of the Black Empire
    ["172196"] = "6541", -- Vorzz Yoq'al
    ["174106"] = "6550", -- Qwor N'lyeth
    ["172189"] = "6548", -- Eyestalk of Il'gynoth
    ["174108"] = "6553", -- Shgla'yos, Astral Malignity
    ["172187"] = "6539", -- Devastation's Hour
}

local linkCache = {}
function TT:Corruption_Search(link)
	local value = linkCache[link]
	if not value then
		local itemString = strmatch(link, "item:([%-?%d:]+)")
		for index in gmatch(itemString, "%d+") do
			if corruptionData[index] then
				value = corruptionData[index]
				linkCache[link] = value
				break
			end
		end
	end
	return value
end

local function getIconString(icon)
	return format("|T%s:14:14:0:0:64:64:5:59:5:59|t ", icon)
end

function TT:Corruption_Convert(name, icon, level)
	for i = 5, self:NumLines() do
		local line = _G[self:GetName().."TextLeft"..i]
		local text = line:GetText()
		if text and strmatch(text, ITEM_MOD_CORRUPTION) then
			line:SetText(text.." / "..getIconString(icon)..name.." "..level)
			return
		end
	end
end

function TT:Corruption_Update()
	local link = select(2, self:GetItem())
	if link and IsCorruptedItem(link) then
		local value = TT:Corruption_Search(link)
		if value then
			if not value.name or not value.icon then
				value.name, _, value.icon = GetSpellInfo(value.spellID)
			end
			TT.Corruption_Convert(self, value.name, value.icon, value.level)
		end
	end
end

------------------------------------------------------------------------------------------------------
local LOCALES = {
    UNKNOWN = "Special",

    passive_crit_dam = "CritDam",
    passive_mastery = "MasteryB",
    passive_haste = "HasteB",
    passive_versatility = "VersatB",
    passive_crit = "CritB",
    passive_avoidance = "Avoid",
    passive_leech = "Leech",

    proc_haste = "HasteA",
    proc_crit = "CritA",
    proc_mastery = "MasteryA",
    proc_versatility = "VersatA",

    twilight = "Twinlight",
    ritual = "Ritual",
    twisted = "Twisted",
    clarity = "Clarity",
    truth = "Truth",
    echo = "Echo",
    star = "Star",
    bleed = "Bleed",
}

if GetLocale():sub(1,2) == "zh" then
    LOCALES = {
        UNKNOWN = "其他或专有",

        passive_crit_dam = "爆伤",
        passive_mastery = "精通比",
        passive_haste = "急速比",
        passive_versatility = "全能比",
        passive_crit = "暴击比",
        passive_avoidance = "闪避",
        passive_leech = "吸血",

        proc_haste = "急速",
        proc_crit = "暴击",
        proc_mastery = "精通",
        proc_versatility = "全能",

        twilight = "暮光",
        ritual = "仪式",
        twisted = "触须",
        clarity = "洞察",
        truth = "真相",
        echo = "回响",
        star = "无尽",
        bleed = "龟裂",
    }
end

local data = {
  affixes = {
    [6437] = { key = "passive_crit_dam", level = 1, },
    [6438] = { key = "passive_crit_dam", level = 2, },
    [6439] = { key = "passive_crit_dam", level = 3, },
    [6471] = { key = "passive_mastery", level = 1, },
    [6472] = { key = "passive_mastery", level = 2, },
    [6473] = { key = "passive_mastery", level = 3, },
    [6474] = { key = "passive_haste", level = 1, },
    [6475] = { key = "passive_haste", level = 2, },
    [6476] = { key = "passive_haste", level = 3, },
    [6477] = { key = "passive_versatility", level = 1, },
    [6478] = { key = "passive_versatility", level = 2, },
    [6479] = { key = "passive_versatility", level = 3, },
    [6480] = { key = "passive_crit", level = 1, },
    [6481] = { key = "passive_crit", level = 2, },
    [6482] = { key = "passive_crit", level = 3, },
    [6483] = { key = "passive_avoidance", level = 1, },
    [6484] = { key = "passive_avoidance", level = 2, },
    [6485] = { key = "passive_avoidance", level = 3, },
    [6493] = { key = "passive_leech", level = 1, },
    [6494] = { key = "passive_leech", level = 2, },
    [6495] = { key = "passive_leech", level = 3, },
    [6537] = { key = "twilight", level = 1, },
    [6538] = { key = "twilight", level = 2, },
    [6539] = { key = "twilight", level = 3, },
    [6540] = { key = "ritual", level = 1, },
    [6541] = { key = "ritual", level = 2, },
    [6542] = { key = "ritual", level = 3, },
    [6543] = { key = "twisted", level = 1, },
    [6544] = { key = "twisted", level = 2, },
    [6545] = { key = "twisted", level = 3, },
    [6546] = { key = "clarity", level = 1, },
    [6547] = { key = "truth", level = 1, },
    [6548] = { key = "truth", level = 2, },
    [6549] = { key = "echo", level = 1, },
    [6550] = { key = "echo", level = 2, },
    [6551] = { key = "echo", level = 3, },
    [6552] = { key = "star", level = 1, },
    [6553] = { key = "star", level = 2, },
    [6554] = { key = "star", level = 3, },
    [6555] = { key = "proc_haste", level = 1, },
    [6556] = { key = "proc_crit", level = 1, },
    [6557] = { key = "proc_mastery", level = 1, },
    [6558] = { key = "proc_versatility", level = 1, },
    [6559] = { key = "proc_haste", level = 2, },
    [6560] = { key = "proc_haste", level = 3, },
    [6561] = { key = "proc_crit", level = 2, },
    [6562] = { key = "proc_crit", level = 3, },
    [6563] = { key = "proc_mastery", level = 2, },
    [6564] = { key = "proc_mastery", level = 3, },
    [6565] = { key = "proc_versatility", level = 2, },
    [6566] = { key = "proc_versatility", level = 3, },
    [6573] = { key = "bleed", level = 1, },
  },
  corrupts = {
    bleed = { 15, },
    clarity = { 15, },
    echo = { 25, 35, 60, },
    passive_avoidance = { 10, 15, 20, },
    passive_crit = { 10, 15, 20, },
    passive_crit_dam = { 10, 15, 20, },
    passive_haste = { 10, 15, 20, },
    passive_leech = { 10, 15, 20, },
    passive_mastery = { 10, 15, 20, },
    passive_versatility = { 10, 15, 20, },
    proc_crit = { 15, 20, 35, },
    proc_haste = { 15, 20, 35, },
    proc_mastery = { 15, 20, 35, },
    proc_versatility = { 15, 20, 35, },
    ritual = { 15, 35, 66, },
    star = { 20, 50, 75, },
    truth = { 12, 30, },
    twilight = { 25, 50, 75, },
    twisted = { 10, 35, 66, },
  },
}

-- 修正闪避
data.corrupts.passive_avoidance = { 8, 12, 16 } --8% 12% 16%
data.corrupts.passive_leech = { 17, 28, 45 } --3% 5% 8%
for _,v in pairs(data.affixes) do v.corrupt = data.corrupts[v.key][v.level] end

function U1GetCorruptionInfo(itemString)
  if type(itemString)~="string" then return end
  if not IsCorruptedItem(itemString) then return end
  local itemString = itemString:match("item[%-?%d:]+") or ""-- Standardize itemlink to itemstring
  local num, affixes = select(14, strsplit(":", itemString, 15))
  num = tonumber(num) or 0
  if num == 0 then return end
  affixes = { strsplit(":", affixes, num + 1) }
  for i=1, num do
    local info = data.affixes[tonumber(affixes[i])]
    if info then return LOCALES[info.key], info.corrupt, info.level, data.corrupts[info.key] end
  end
  return LOCALES.UNKNOWN, GetItemStats(itemString).ITEM_MOD_CORRUPTION
end

local hookTooltipSetItem = function(self, link)
    link = select(2, self:GetItem())
    local name, corrupt, level, levels = U1GetCorruptionInfo(link)
    local tooltipName = self:GetName()
    if name then
        for i = 5, 20 do
            local left = _G[tooltipName .. "TextLeft" .. i]:GetText()
            if left:match("^"..ITEM_CORRUPTION_BONUS_STAT:gsub("%+%%d", "%%+[0-9]+").."$") then  --"+%d 腐蚀"
                local right = _G[tooltipName .. "TextRight" .. i]
                local text = ""
                if not level then
                    text = name
                else
                    text = name .. " -" .. level .. " ["
                    for j = 1, #levels do
                        if j > 1 then text = text .. "/" end
                        if j == level then text = text .. "|cff00ff00" .. levels[j] .. "|r" else text = text .. levels[j] end
                    end
                    text = text .. "]"
                end
                right:SetText(text)
                right:SetTextColor(0.5843, 0.42745, 0.8196)
                right:Show()
                break
            end
        end
    end
end

function TT:CorruptionRank()
	if not MaoRUIPerDB["Tooltip"]["CorruptionRank"] then return end
	if IsAddOnLoaded("CorruptionTooltips") then return end
	if IsAddOnLoaded("CorruptionNameTooltips") then return end

	GameTooltip:HookScript("OnTooltipSetItem", TT.Corruption_Update)
	ItemRefTooltip:HookScript("OnTooltipSetItem", TT.Corruption_Update)
	ShoppingTooltip1:HookScript("OnTooltipSetItem", TT.Corruption_Update)
	ShoppingTooltip2:HookScript("OnTooltipSetItem", TT.Corruption_Update)
	EmbeddedItemTooltip:HookScript("OnTooltipSetItem", TT.Corruption_Update)
	--GameTooltip:HookScript("OnTooltipSetItem", hookTooltipSetItem)
	--ItemRefTooltip:HookScript("OnTooltipSetItem", hookTooltipSetItem)
end