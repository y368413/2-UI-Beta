--## Author: Semlar ## Version: 8.0.0.1

function GetModifiers(linkType, ...)
	if type(linkType) ~= 'string' then return end
	local modifierOffset = 4
	local itemID, instanceID, mythicLevel, notDepleted, _ = ... -- "keystone" links
	if linkType:find('item') then -- only used for ItemRefTooltip currently
		_, _, _, _, _, _, _, _, _, _, _, _, _, instanceID, mythicLevel = ...
		if ... == '138019' then -- mythic keystone
			modifierOffset = 16
		else
			return
		end
	elseif not linkType:find('keystone') then
		return
	end

	local modifiers = {}
	for i = modifierOffset, select('#', ...) do
		local num = strmatch(select(i, ...) or '', '^(%d+)')
		if num then
			local modifierID = tonumber(num)
			--if not modifierID then break end
			tinsert(modifiers, modifierID)
		end
	end
	local numModifiers = #modifiers
	if modifiers[numModifiers] and modifiers[numModifiers] < 2 then
		tremove(modifiers, numModifiers)
	end
	return modifiers, instanceID, mythicLevel
end

local function DecorateTooltip(self, link, _)
	if not link then
		_, link = self:GetItem()
	end
	if type(link) == 'string' then
		local modifiers, instanceID, mythicLevel = GetModifiers(strsplit(':', link))
		if modifiers then
			for _, modifierID in ipairs(modifiers) do
				local modifierName, modifierDescription = C_ChallengeMode.GetAffixInfo(modifierID)
				if modifierName and
					modifierDescription then
					self:AddLine(format('|cff00ff00%s|r - %s', modifierName, modifierDescription), 0, 1, 0, true)
				end
			end
			self:Show()
		end
	end
end

-- hack to handle ItemRefTooltip:GetItem() not returning a proper keystone link
hooksecurefunc(ItemRefTooltip, 'SetHyperlink', DecorateTooltip) 
--ItemRefTooltip:HookScript('OnTooltipSetItem', DecorateTooltip)
GameTooltip:HookScript('OnTooltipSetItem', DecorateTooltip)

--------------------
do 
    local f = CreateFrame("Frame"); 
    f:RegisterEvent("ADDON_LOADED") 
    f:SetScript("OnEvent", function(self, event, addon) 
        if addon ~= "Blizzard_ChallengesUI" then return end 
        local levels = { nil, 410, 415, 420, 420, 425, 430, 430, 435, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440, 440 } 
    local titans = { nil, nil, nil, nil, nil, nil, nil, nil, nil, 17000, 17900, 18800, 19700, 20600, 21500, 22400, 23300, 24200, 25100, 26000, 26650,27300,27950,28500,29150}
        ChallengesFrame.WeeklyInfo.Child.WeeklyChest:HookScript("OnEnter", function(self) 
            if GameTooltip:IsVisible() then 
                GameTooltip:AddLine(" ") 
                GameTooltip:AddLine("钥石层数  奖励装等  奖励精华") 
                local start = 2 
                if self.level and self.level > 0 then 
                    start = self.level - 3 
                elseif self.ownedKeystoneLevel and self.ownedKeystoneLevel > 0 then 
                    start = self.ownedKeystoneLevel - 5 
                end 
                for i = start, start + 9 do 
                    if levels[i] or titans[i] then 
                        local line = "    %2d层 |T130758:10:35:0:0:32:32:10:22:10:22|t %s |T130758:10:25:0:0:32:32:10:22:10:22|t %s" 
                        local level = levels[i] and format("%d", levels[i]) or " ? " 
                        local titan = titans[i] and format("%4d", titans[i]) or "  ? " 
                    if i == self.level then line = "|cff00ff00"..line.."|r" end
                        GameTooltip:AddLine(format(line, i, level, titan)) 
                    else 
                        break 
                    end 
                end 

                GameTooltip:AddLine(" ") 
            GameTooltip:AddLine("415随机 需要1725  分解返365")
            GameTooltip:AddLine("430随机 需要9000  分解返2000")
            GameTooltip:AddLine("445随机 需要47500 分解返10000")
            GameTooltip:AddLine("445指定 需要20万")
            GameTooltip:AddLine("分解400返115 385返35 370返12")
            GameTooltip:AddLine("仅分解|cffff0000同甲|r特质装才返")
                GameTooltip:Show() 
            end 
        end) 
    end) 
end