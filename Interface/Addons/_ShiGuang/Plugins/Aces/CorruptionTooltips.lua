--## Version: 1.0  ## Author: Anayanka (Defias Brotherhood - EU)
R = {
    ["6455"] = {"Avoidant", "I", 463284},
    ["6483"] = {"Avoidant", "I", 463284},
    ["6460"] = {"Avoidant", "II", 463284},
    ["6484"] = {"Avoidant", "II", 463284},
    ["6465"] = {"Avoidant", "III", 463284},
    ["6485"] = {"Avoidant", "III", 463284},
    ["6455"] = {"Expedient", "I", 236222},
    ["6474"] = {"Expedient", "I", 236222},
    ["6460"] = {"Expedient", "II", 236222},
    ["6475"] = {"Expedient", "II", 236222},
    ["6465"] = {"Expedient", "III", 236222},
    ["6476"] = {"Expedient", "III", 236222},
    ["6455"] = {"Masterful", "I", 132305},
    ["6471"] = {"Masterful", "I", 132305},
    ["6460"] = {"Masterful", "II", 132305},
    ["6472"] = {"Masterful", "II", 132305},
    ["6465"] = {"Masterful", "III", 132305},
    ["6473"] = {"Masterful", "III", 132305},
    ["6455"] = {"Severe", "I", 458229},
    ["6480"] = {"Severe", "I", 458229},
    ["6460"] = {"Severe", "II", 458229},
    ["6481"] = {"Severe", "II", 458229},
    ["6465"] = {"Severe", "III", 458229},
    ["6482"] = {"Severe", "III", 458229},
    ["6455"] = {"Versatile", "I", 429382},
    ["6477"] = {"Versatile", "I", 429382},
    ["6460"] = {"Versatile", "II", 429382},
    ["6478"] = {"Versatile", "II", 429382},
    ["6465"] = {"Versatile", "III", 429382},
    ["6479"] = {"Versatile", "III", 429382},
    ["6455"] = {"Siphoner", "I", 3154546},
    ["6493"] = {"Siphoner", "I", 3154546},
    ["6460"] = {"Siphoner", "II", 3154546},
    ["6494"] = {"Siphoner", "II", 3154546},
    ["6465"] = {"Siphoner", "III", 3154546},
    ["6495"] = {"Siphoner", "III", 3154546},
    ["6455"] = {"Strikethrough", "I", 236572},
    ["6437"] = {"Strikethrough", "I", 236572},
    ["6460"] = {"Strikethrough", "II", 236572},
    ["6438"] = {"Strikethrough", "II", 236572},
    ["6465"] = {"Strikethrough", "III", 236572},
    ["6439"] = {"Strikethrough", "III", 236572},
    ["6555"] = {"Racing Pulse", "I", 132334},
    ["6559"] = {"Racing Pulse", "II", 132334},
    ["6560"] = {"Racing Pulse", "III", 132334},
    ["6556"] = {"Deadly Momentum", "I", 1376046},
    ["6561"] = {"Deadly Momentum", "II", 1376046},
    ["6562"] = {"Deadly Momentum", "III", 1376046},
    ["6558"] = {"Surging Vitality", "I", 461117},
    ["6565"] = {"Surging Vitality", "II", 461117},
    ["6566"] = {"Surging Vitality", "III", 461117},
    ["6557"] = {"Honed Mind", "I", 136035},
    ["6563"] = {"Honed Mind", "II", 136035},
    ["6564"] = {"Honed Mind", "III", 136035},
    ["6549"] = {"Echoing Void", "I", 1022950},
    ["6550"] = {"Echoing Void", "II", 1022950},
    ["6551"] = {"Echoing Void", "III", 1022950},
    ["6552"] = {"Infinite Stars", "I", 236168},
    ["6553"] = {"Infinite Stars", "II", 236168},
    ["6554"] = {"Infinite Stars", "III", 236168},
    ["6547"] = {"Ineffable Truth", "I", 2991168},
    ["6548"] = {"Ineffable Truth", "II", 2991168},
    ["6537"] = {"Twilight Devastation", "I", 1386551},
    ["6538"] = {"Twilight Devastation", "II", 1386551},
    ["6539"] = {"Twilight Devastation", "III", 1386551},
    ["6543"] = {"Twisted Appendage", "I", 254105},
    ["6544"] = {"Twisted Appendage", "II", 254105},
    ["6545"] = {"Twisted Appendage", "III", 254105},
    ["6540"] = {"Void Ritual", "I", 136194},
    ["6541"] = {"Void Ritual", "II", 136194},
    ["6542"] = {"Void Ritual", "III", 136194},
    ["6573"] = {"Gushing Wound", "", 1035041},
    ["6546"] = {"Glimpse of Clarity", "", 460857},
    ["6571"] = {"Searing Flames", "", 1354169},
    ["6572"] = {"Obsidian Skin", "", 132154},
    ["6567"] = {"Devour Vitality", "", 571321},
    ["6568"] = {"Whispered Truths", "", 132178},
    ["6570"] = {"Flash of Insight", "", 136224},
    ["6569"] = {"Lash of the Void", "", 537022},
}


CorruptionTooltips = LibStub("AceAddon-3.0"):NewAddon("Corruption Tooltips", "AceEvent-3.0", "AceHook-3.0")

function CorruptionTooltips:OnEnable()
    self:SecureHookScript(GameTooltip, 'OnTooltipSetItem', 'TooltipHook')
    self:SecureHookScript(ItemRefTooltip, 'OnTooltipSetItem', 'TooltipHook')
    self:SecureHookScript(ShoppingTooltip1, 'OnTooltipSetItem', 'TooltipHook')
    self:SecureHookScript(EmbeddedItemTooltip, 'OnTooltipSetItem', 'TooltipHook')
end

local function GetItemSplit(itemLink)
  local itemString = string.match(itemLink, "item:([%-?%d:]+)")
  local itemSplit = {}

  -- Split data into a table
  for _, v in ipairs({strsplit(":", itemString)}) do
    if v == "" then
      itemSplit[#itemSplit + 1] = 0
    else
      itemSplit[#itemSplit + 1] = tonumber(v)
    end
  end

  return itemSplit
end

function CorruptionTooltips:CreateTooltip(self)
	local name, item = self:GetItem()
  	if not name then return end

  	if IsCorruptedItem(item) then

        local itemSplit = GetItemSplit(item)
        local bonuses = {}

        for index=1, itemSplit[13] do
            bonuses[#bonuses + 1] = itemSplit[13 + index]
        end

		local corruption = CorruptionTooltips:GetCorruption(bonuses)

		if corruption then
			local name = corruption[1]
			local icon = corruption[2]
			local line = '|T'..icon..':12:12:0:0|t '.."|cff956dd1"..name.."|r"
			self:AddLine(" ")
			self:AddLine(line)
		end
	end
end

function CorruptionTooltips:GetCorruption(bonuses)
    if #bonuses > 0 then
        for i, bonus_id in pairs(bonuses) do
            bonus_id = tostring(bonus_id)
            if R[bonus_id] ~= nil then
                return {
                    R[bonus_id][1].." "..R[bonus_id][2],  --L[R[bonus_id][1]].." "..R[bonus_id][2],
                    R[bonus_id][3],
                }
            end
        end
    end
end

function CorruptionTooltips:TooltipHook(frame)
	self:CreateTooltip(frame)
end
