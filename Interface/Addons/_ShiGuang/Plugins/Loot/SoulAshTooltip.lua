--## Version: 1.0 ## Author: joebaarim
GameTooltip:HookScript("OnTooltipSetItem", function(tooltip)
	-- probably a better way of getting these but this works
	local iName, iLink = tooltip:GetItem()
	local itemName, itemLink, itemQuality, itemLevel, itemMinLevel, itemType,
	itemSubType, itemStackCount, itemEquipLoc, itemTexture, sellPrice, classID,
	subclassID, bindType, expacID, setID, isCraftingReagent = GetItemInfo(iLink)
	
	-- make sure item is a Shadowlands Legendary armor piece and we are not on an inspection slot
	if expacID == 8 and
		itemQuality == 5 and
		classID == 4 and
		not string.find(tooltip:GetOwner():GetName(), "Inspect") then 
	
		local soulAshCurrencyInfo = C_CurrencyInfo.GetCurrencyInfo(1828)
		local currentSoulAsh = soulAshCurrencyInfo.quantity
		
		local soulAshTex = soulAshCurrencyInfo.iconFileID
		
		tooltip:AddLine(" ") -- create an empty line for spacing
		tooltip:AddLine("当前灰烬: "..tostring(currentSoulAsh))
		tooltip:AddTexture(soulAshTex)
		
		-- the totals for each rank if crafted individually
		local rank1 = 1250
		local rank2 = 2000
		local rank3 = 3200
		local rank4 = 5150
		
		local toRank2s = " 升到2级橙装： <210> "
		local toRank3s = " 升到3级橙装： <225> "
		local toRank4s = " 升到4级橙装： <235> "
		
		-- probably a much better way of doing all this but this works
		if itemLevel == 190 then
				tooltip:AddLine("当前橙装为1级,有点弟弟", 0, 1, 0)
			if currentSoulAsh >= rank2-rank1 then
				tooltip:AddLine(toRank2s.."需要"..tostring(rank2-rank1).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank2s.."需要"..tostring(rank2-rank1).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank2-rank1)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
			if currentSoulAsh >= rank3-rank1 then
				tooltip:AddLine(toRank3s.."需要"..tostring(rank3-rank1).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank3s.."需要"..tostring(rank3-rank1).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank3-rank1)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
			if currentSoulAsh >= rank4-rank1 then
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank1).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank1).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank4-rank1)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
		end
		
		if itemLevel == 210 then
				tooltip:AddLine("当前橙装为2级,还需进阶", 0, 1, 0)
			if currentSoulAsh >= rank3-rank2 then
				tooltip:AddLine(toRank3s.."需要"..tostring(rank3-rank2).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank3s.."需要"..tostring(rank3-rank2).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank3-rank2)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
			if currentSoulAsh >= rank4-rank2 then
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank2).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank2).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank4-rank2)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
		end
		
		if itemLevel == 225 then
				tooltip:AddLine("当前橙装为3级,就快成了！", 0, 1, 0)
			if currentSoulAsh >= rank4-rank3 then
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank3).."灰烬 ", 0, 1, 0)
			else
				tooltip:AddLine(toRank4s.."需要"..tostring(rank4-rank3).."灰烬 ", 1, 0, 0)
				tooltip:AddLine("    "..tostring("还差 "..(rank4-rank3)-currentSoulAsh).." 灰烬", 1, 0, 0)
			end
		end
		
		if itemLevel == 235 then
			tooltip:AddLine("已经满级，太对了哥", 0, 1, 0)
		end
	end

	tooltip:Show()
end)