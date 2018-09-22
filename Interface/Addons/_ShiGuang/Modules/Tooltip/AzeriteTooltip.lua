--## Version: 1.61  ## Author: Kygo

function AzeriteTooltip_GetSpellID(powerID)
	local powerInfo = C_AzeriteEmpoweredItem.GetPowerInfo(powerID)
  	if (powerInfo) then
    	local azeriteSpellID = powerInfo["spellID"] return azeriteSpellID
  	end
end

function AzeriteTooltip_ScanSelectedTraits(powerName)
	for i = 10, GameTooltip:NumLines() do
		local text = _G[GameTooltip:GetName().."TextLeft"..i]:GetText()
        if text:find("- "..powerName) then return true end
    end
end

local currentLevel = 0

function AzeriteTooltip_BuildTooltip(itemLink, tooltip, name)	
	-- Current Azerite Level
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation) end
	local specID = GetSpecializationInfo(GetSpecialization())
	local allTierInfo = C_AzeriteEmpoweredItem.GetAllTierInfoByItemID(itemLink)
	if not allTierInfo[1]["azeritePowerIDs"][1] then return end
	if (IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown()) then  --Thanks EKE·s idea
		for j=1, 3 do
			local tierLevel = allTierInfo[j]["unlockLevel"]
			local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][1]
			if azeritePowerID == 13 then break end -- Ignore +5 item level tier
			if tierLevel <= currentLevel then
				tooltip:AddLine(tierLevel, 1, 0.8, 0)
			else
				tooltip:AddLine(tierLevel, 0.5, 0.5, 0.5)
			end
			for i, _ in pairs(allTierInfo[j]["azeritePowerIDs"]) do
				local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][i]
				local azeritePowerName, _, icon = GetSpellInfo(AzeriteTooltip_GetSpellID(azeritePowerID))
				local azeriteTooltipText = ' |T'..icon..':18:18:0:0:64:64:4:60:4:60|t'..azeritePowerName
				if tierLevel <= currentLevel then
					if AzeriteTooltip_ScanSelectedTraits(azeritePowerName) then
						tooltip:AddLine(azeriteTooltipText, 0, 1, 0)
					elseif C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
						tooltip:AddLine(azeriteTooltipText, 1, 1, 1)
					else   --if not AzeriteTooltipDB.OnlySpec then
						tooltip:AddLine(azeriteTooltipText,  0.5, 0.5, 0.5)
					end
				else
					tooltip:AddLine(azeriteTooltipText, 0.5, 0.5, 0.5)
				end
			end
		end
	else
		for j=1, 3 do
			local tierLevel = allTierInfo[j]["unlockLevel"]
			local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][1]
			if azeritePowerID == 13 then break end -- Ignore +5 item level tier
			local azeriteTooltipText = " "
			for i, _ in pairs(allTierInfo[j]["azeritePowerIDs"]) do
				local azeritePowerID = allTierInfo[j]["azeritePowerIDs"][i]
				local azeritePowerName, _, icon = GetSpellInfo(AzeriteTooltip_GetSpellID(azeritePowerID))		
				if tierLevel <= currentLevel then
					if AzeriteTooltip_ScanSelectedTraits(azeritePowerName) then
						azeriteTooltipText = azeriteTooltipText..' >|T'..icon..':25:25:0:0:64:64:4:60:4:60:255:255:255|t<'
					elseif C_AzeriteEmpoweredItem.IsPowerAvailableForSpec(azeritePowerID, specID) then
						azeriteTooltipText = azeriteTooltipText..' |T'..icon..':25:25:0:0:64:64:4:60:4:60:255:255:255|t'
					else     --if not AzeriteTooltipDB.OnlySpec then
						azeriteTooltipText = azeriteTooltipText..' |T'..icon..':25:25:0:0:64:64:4:60:4:60:150:150:150|t'
					end
				else
					azeriteTooltipText = azeriteTooltipText..' |T'..icon..':25:25:0:0:64:64:4:60:4:60:150:150:150|t'
				end
			end
			if tierLevel <= currentLevel then
				tooltip:AddLine(tierLevel..azeriteTooltipText, 1, 0.8, 0)
			else
				tooltip:AddLine(tierLevel..azeriteTooltipText, 0.5, 0.5, 0.5)
			end
		end
	end
end

GameTooltip:HookScript("OnTooltipSetItem", function(self)
	local name, link = self:GetItem()
  	if not name then return end
  	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(link) then AzeriteTooltip_BuildTooltip(link, self, name) end
end)
ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
	local name, link = self:GetItem()
  	if not name then return end
  	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(link) then AzeriteTooltip_BuildTooltip(link, self, name) end
end)
ShoppingTooltip1:HookScript("OnTooltipSetItem", function(self)
  	local name, link = self:GetItem()
  	if not name then return end
	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(link) then AzeriteTooltip_BuildTooltip(link, self, name) end
end)
WorldMapTooltip.ItemTooltip.Tooltip:HookScript('OnTooltipSetItem', function(self)
	local name, link = self:GetItem()
  	if not name then return end
  	if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(link) then AzeriteTooltip_BuildTooltip(link, self, name) end
end)