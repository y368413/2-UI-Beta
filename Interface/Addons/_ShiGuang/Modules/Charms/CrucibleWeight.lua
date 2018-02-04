--## Author: Alea

local CrucibleWeight = {}
local cmd1 = '/cruwe'
local cmd2 = '/crucibleweight'

local localDB = {
	-- Shadow
	[128827] = 'cruweight^128827^194093^0.51 6:0.48 7:0.32^252191^1.06^194016^0^252207^0^252091^1.08^193645^0.02^253111^0^252906^2.35^194002^0.79^252875^2.28^ilvl^0.42^193642^0^252888^2.04^252922^1.51^253070^1.72^252088^1.23^253093^1.72^194007^0.77^193644^0.77^193643^0.59^193647^0^252799^1.24^238065^1.38 6:0.74 7:0.68^end',
	
	-- Destro
	[128941] = 'cruweight^128941^252191^1.13^196217^0.67^252207^0^252091^1.06^ilvl^0.37^196222^0.36^252088^1.04^252799^1.25^252906^1.41^252875^1.34^196211^0.32^196432^0.85^196227^0.47^252922^0.60^196258^0^253111^0^196301^0^253093^1.32^196305^0^253070^1.34^252888^1.18^238074^0.50^196236^0.31^end',

	-- Aff
	[128942] = 'cruweight^128942^199111^0.78^199212^0^199158^2.18^252207^0^252091^1.27^199120^0.51^199163^1.58^238072^1.41^253111^0^252875^1.86^199214^0^199152^1.46^199112^0.58^252922^0.83^ilvl^0.39^252088^1.31^199153^0^253093^1.77^252191^1.17^253070^1.75^252888^1.68^252799^1.21^252906^1.93^end',
	
	-- DEMO
	[128943] = 'cruweight^128943^211108^0.77^252191^1.08^252207^0^211105^0.26^252091^1.10^211144^0^252088^1.41^211106^0.40^ilvl^0.36^252875^1.21^211131^0^211126^0^211099^0.15^238073^0.57^252906^1.39^252922^0.56^211119^1.81^253093^1.14^211123^0.45^253070^1.17^252888^1.10^252799^1.03^253111^0^end',
	
	-- Fire
	[128820] = 'cruweight^128820^210182^2^194314^9^194318^1^252207^1^252091^4^194315^0^194234^5^252088^3^194312^8^252875^8^ilvl^3^252191^6^194224^6^194239^10^252922^2^238055^7^194313^4^253093^10^252906^11^253070^9^252888^7^252799^5^253111^0^end',
	
	-- Frost Mage
	[128862] = 'cruweight^128862^252191^5^195345^6^252207^1^252091^3^238056^8^195315^5^195323^3^253111^0^195317^7^252875^7^195354^1^195352^2^195351^10^252922^2^ilvl^4^195322^9^252088^4^253093^10^214626^0^253070^8^252888^6^252799^3^252906^11^end',
	
	-- Arcane
	[127857] = 'cruweight^127857^187304^3^252191^6^187258^5^252207^1^252091^3^187313^0^187321^8^252088^4^210716^1^252875^8^187301^2^187287^7^ilvl^4^187264^10^187276^6^252922^2^238054^9^253093^10^252906^11^253070^9^252888^7^252799^5^253111^0^end',

	-- Moonkin
	[128858] = 'cruweight^128858^238047^0.12^252191^1.09^202386^0.48^252207^0^252091^1.07^202433^1.5^202445^0.46^202426^0.62^ilvl^0.37^252906^1.21^203018^0^202384^0.7^202302^0^252922^0.38^253111^0^202464^0.46^202466^0.49^253093^1.11^252088^0.96^253070^1.14^252888^0.97^252799^1.04^252875^1.11^end',

	-- Feral
	[128860] = 'cruweight^128860^252191^1^210593^1^210570^1^252207^0^252091^0.7^210590^0^210571^0.7^210637^0.6^253111^0^252875^1.4^ilvl^0.2^238048^0.1^210575^0.3^252922^0.5^210579^0.4^252088^0.6^210557^0^253093^1.4^252906^1.5^253070^1.4^252888^1.3^252799^0.9^210631^0.8^end',

	-- Frost DK
	[128292] = 'cruweight^128292^252888^5.14^252922^1.9^253093^5.73^252088^5.66^253111^0^252091^4.87^252191^6.1^252207^0^253070^5.95^252875^5.73^252799^5.91^252906^6.03^189092^6.78^189147^1.46^189086^2.55^189080^3.84^189164^1.88^204875^0^189154^0^189144^3.78^189097^0.83^238043^2.43^ilvl^1.00^end',				

	-- Unholy
	[128403] = 'cruweight^128403^252888^11.07^252922^3.72^253093^8.28^252088^5.64^253111^0^252091^9.43^252191^8.26^252207^0^253070^8.72^252875^11.89^252799^8.63^252906^12.97^191419^5.6^191565^0^208598^0^238044^3.14^191485^6.55^191442^2.57^191592^2.48^191494^2.26^191488^6.62^191584^0^ilvl^1.00^end'														
}

local basicColor = { GetItemQualityColor(6) } 
local ILVL_TAG = 'ilvl'
local PATTERN_RELIC_ILVL


--物品等级 zhCN

if GetLocale() == 'zhCN' then
	PATTERN_RELIC_ILVL = "(%d+%,?%.?%d*)物品等级$"
else
	PATTERN_RELIC_ILVL = "(%d+%,?%.?%d*) "..RELIC_ITEM_LEVEL_INCREASE..'$'		
end
	
local initFrame = true
local toggled = false

local hidegametooltip = CreateFrame("Frame")
hidegametooltip:Hide()
local gametooltip = CreateFrame("GameTooltip", "CrucibleWeightParseGameToolTip", nil, "GameTooltipTemplate");
gametooltip:SetOwner( hidegametooltip,"ANCHOR_NONE");
gametooltip:SetScript('OnTooltipAddMoney', function()end)
gametooltip:SetScript('OnTooltipCleared', function()end)
gametooltip:SetScript('OnTooltipSetDefaultAnchor',function()end)

function CrucibleWeight.GetRelicInfo(relicID)
	gametooltip:ClearLines()
	
	local totalilvl = 0
	local powerBonus
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	if relicID == 4 then
		local relicItemLink = C_ArtifactRelicForgeUI.GetPreviewRelicItemLink();
		
		if relicItemLink then
			gametooltip:SetHyperlink(relicItemLink);
			
			totalilvl = totalilvl + 5
		else
			return totalilvl
		end
	else	
		gametooltip:SetSocketedRelic(relicID);
	end
	
	for i=1, gametooltip:NumLines() do        
		local left = _G[gametooltip:GetName().."TextLeft"..i]:GetText()
		
		if left then
		
			local ilvl = string.match(left, PATTERN_RELIC_ILVL)
			
			
			if ilvl then
				totalilvl = totalilvl + ( tonumber(ilvl) or 0 )
			end

			if not powerBonus and itemID and ShiGuangDB.CrucibleWeightArtifacts[itemID] then
				for powerID, spellID in pairs(ShiGuangDB.CrucibleWeightArtifacts[itemID]) do
					if string.match(left, (GetSpellInfo(spellID)):gsub('-', '.')) then
			--			print('Find spell in', left, 'by', (GetSpellInfo(spellID)):gsub('-', '.'))
						powerBonus = spellID
						break
					end
				end
			end				
		end
	end
	
	return totalilvl, powerBonus
end

local unknownIcon = "\124TInterface\\Icons\\Inv_misc_questionmark:16\124t "..UNKNOWN

local function SpellString(spellID)
	if not spellID then 
		return unknownIcon	
	end
	
	local name, _, icon = GetSpellInfo(spellID)
			
	if not name then
		return unknownIcon	
	end
	
	return "\124T"..icon..":16\124t "..name			
end

local RelicForgeSpells = {
	-- Void Traits
	[252091] = 'Master of Shadows',
	[252191] = 'Murderous Intent',
	[252875] = 'Shadowbind',
	[252888] = 'Chaotic Darkness',
	[252906] = 'Torment the Weak',
	[252922] = 'Dark Sorrows',
	
	-- Light Traits
	[252088] = 'Light Speed',
	[252207] = 'Refractive Shell',
	[252799] = 'Shocklight',
	[253070] = 'Secure in the Light',
	[253093] = 'Infusion of Light',
	[253111] = "Light's Embrace",
}

function CrucibleWeight:ScanRelics()	
	for i=1, 3 do
		local talents = C_ArtifactRelicForgeUI.GetSocketedRelicTalents(i);
		if ( talents ) then
			print('Relic slot', i)
			for k,v in pairs(talents) do
				print('  Index:', k, 'powerID:', v.powerID, 'tier:', v.tier, 'link:', C_ArtifactUI.GetPowerHyperlink(v.powerID), C_ArtifactUI.GetPowerInfo(v.powerID))
			end
		else
			print('No relic in slot', i)
		end
	end			
end

function CrucibleWeight:ScanPreviewRelic()
	local talents = C_ArtifactRelicForgeUI.GetPreviewRelicTalents();
	if ( talents ) then
		print('Relic slot', 4)
		for k,v in pairs(talents) do
			print('  Index:', k, 'powerID:', v.powerID, 'tier:', v.tier, 'link:', C_ArtifactUI.GetPowerHyperlink(v.powerID), C_ArtifactUI.GetPowerInfo(v.powerID))
		end
	else
		print('No relic in slot', 4)
	end
end

do
	local sortfunc = function(x,y)
		return x>y
	end
		
	function CrucibleWeight.GetNumberPosition(...)		
		local t = {}
		
		for i=1, select('#', ...) do
			local number = select(i, ...)
			local addit = true
			
			for a=1, #t do				
				if t[a] == number then		
					addit = true
				end
			end
			
			t[#t+1] = number
		end
		
		table.sort(t, sortfunc)
		
		local t1 = {}
		
		for k,v in pairs(t) do
			t1[v]=k
		end
		
		return t1
	end
	
	local colors = {
		[1] = { 0, 1, 0 },
		[2] = { 1, 1, 0 },
		[3] = { 1, 0, 0 },
	}
	function CrucibleWeight.GetColorPreset(index)		
		return colors[index] or { 0.5, 0.5, 0.5 }
	end
	
end

--[==[
		1
	2		3
4		5		6
]==]

local relicMap = {
	[2] = { 
		req = 1,
		artLvL = 0,
		[3] = false
	},
	[3] = {
		req = 1,
		artLvL = 0,
		[2] = false,
	},
	[4] = { 
		req = 4,
		artLvL = 9,
		[5] = false,
		[6] = false,		
		[2] = true,
		[3] = false,
	},
	[5] = { 
		req = 3,
		artLvL = 9,
		[4] = false,
		[6] = false,		
		[2] = true,
		[3] = true,
	},
	[6] = { 
		req = 4,
		artLvL = 9,
		[4] = false,
		[5] = false,
		[3] = true,
		[2] = false,
	},
}

function CrucibleWeight:IsReachable(data, index, slot)

	local t = relicMap[index]
	
	local status = 0
	
	local totalRanks = C_ArtifactUI.GetTotalPurchasedRanks()
	local offset = slot == 1 and 60 or slot == 2 and 63 or slot == 3 and 66
	
	if t then
		for k, v  in pairs(data) do
			if t[k] == v.isChosen then
				status = status + 1
			end
			
			if status == t.req and ( CrucibleWeight.checkReachable and offset+t.artLvL <= totalRanks or not CrucibleWeight.checkReachable ) then
			--		print('  ', offset+t.artLvL, offset+t.artLvL <= totalRanks, totalRanks-offset+t.artLvL )
					
				return true --'st1-true-'..status
			elseif status == t.req-1 and ( CrucibleWeight.checkReachable and offset+t.artLvL <= totalRanks or not CrucibleWeight.checkReachable ) then
			--		print('  ', offset+t.artLvL, offset+t.artLvL <= totalRanks, totalRanks-offset+t.artLvL )
				
				return true --'st2-true-'..status
			end
		end
	end
	
	return false --'st3-false-'..status
end

function CrucibleWeight:IsReachablePreview(index, slot)
	local totalRanks = C_ArtifactUI.GetTotalPurchasedRanks()
	local offset = slot == 1 and 60 or slot == 2 and 63 or slot == 3 and 66
	
	local m = {
	--	[1] = true,
		[2] = CrucibleWeight.checkReachable and offset+relicMap[2].artLvL <= totalRanks or not CrucibleWeight.checkReachable,
		[3] = CrucibleWeight.checkReachable and offset+relicMap[3].artLvL <= totalRanks or not CrucibleWeight.checkReachable,
		[4] = CrucibleWeight.checkReachable and offset+relicMap[4].artLvL <= totalRanks or not CrucibleWeight.checkReachable,
		[5] = CrucibleWeight.checkReachable and offset+relicMap[5].artLvL <= totalRanks or not CrucibleWeight.checkReachable,
		[6] = CrucibleWeight.checkReachable and offset+relicMap[6].artLvL <= totalRanks or not CrucibleWeight.checkReachable,
	}
	
	return m[index] --'st3-false-'..status
end

function CrucibleWeight:BuildTotalBaseRelicValue(index)
	CrucibleWeight.TotalRelicValue[index] = {}
	CrucibleWeight.ArtifactPercsOffsetPreLoad[index] = {}
	
	local totalitemlevel, spellID = CrucibleWeight.GetRelicInfo(index)
	local spellIDRank = 0
	local relicType = C_ArtifactUI.GetRelicSlotType(index);
	
--	print('Relic', index, totalitemlevel)
	
	if spellID then
		if CrucibleWeight.IsMultiValueSpellID(spellID) then
			CrucibleWeight.ArtifactPercsOffset[spellID] = ( CrucibleWeight.ArtifactPercsOffset[spellID] or 0 ) + 1		
			spellIDRank = CrucibleWeight.ArtifactPercsOffset[spellID]
			CrucibleWeight.ArtifactPercsOffsetPreLoad[index][spellID] = CrucibleWeight.ArtifactPercsOffset[spellID]
			
	--		print(index, 'Set base powerIndex for',spellID,'by',CrucibleWeight.ArtifactPercsOffset[spellID])
		end
	else	
--		print('Cant find spellID on relic slot', index)
	end
	
	local itemLevel = ( totalitemlevel and CrucibleWeight.GetValue(ILVL_TAG) ) and totalitemlevel*CrucibleWeight.GetValue(ILVL_TAG) or 0
	local powerLevel = ( spellID and CrucibleWeight.GetValue(spellID) ) and CrucibleWeight.UnpackValue(CrucibleWeight.GetValue(spellID), 4+spellIDRank ) or 0
	
	local totalPower = itemLevel + powerLevel
	
--	print('Relic',index,'value=', powerLevel, 'itemLevel=', itemLevel, 'spellID=', spellID, 'GetValue=', CrucibleWeight.GetValue(spellID))
	
	CrucibleWeight.TotalRelicValue[index][0]  = { 'default',  powerLevel, spellID }
	CrucibleWeight.TotalRelicValue[index][-1] = { 'ilvl',     itemLevel  }
	CrucibleWeight.TotalRelicValue[index][-2] = relicType
end

function CrucibleWeight:BuildTotalBonusRelicValue(index)	
	local talents = C_ArtifactRelicForgeUI.GetSocketedRelicTalents(index);
	

	if ( talents ) then
		for slot, data in pairs(talents) do
			if slot == 1 then

			else
				local spellID = C_ArtifactUI.GetPowerInfo(data.powerID).spellID
				local isReachable = CrucibleWeight:IsReachable(talents, slot, index)
				
				if spellID and data.isChosen and CrucibleWeight.IsMultiValueSpellID(spellID) then
					CrucibleWeight.ArtifactPercsOffset[spellID] = ( CrucibleWeight.ArtifactPercsOffset[spellID] or 0 ) + 1				
					CrucibleWeight.ArtifactPercsOffsetPreLoad[index][spellID] = CrucibleWeight.ArtifactPercsOffset[spellID]
					
	--				print(index, 'Set bonus powerIndex for',spellID, GetSpellLink(spellID), 'by',CrucibleWeight.ArtifactPercsOffset[spellID], 'if picked,', data.isChosen)
				end
	--			print('  Slot=', slot, 'required=', data.requiredArtifactLevel, 'canChoose=', data.canChoose, 'isChosen=', data.isChosen, 'isReachable=',isReachable, 'value=', CrucibleWeight.TotalRelicValue[index][slot][2] )
			end
		end
	end
	
	
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	for powerID, spellID in pairs(ShiGuangDB.CrucibleWeightArtifacts[itemID]) do
		if CrucibleWeight.IsMultiValueSpellID(spellID) and not CrucibleWeight.ArtifactPercsOffsetPreLoad[index][spellID] then
			local current = (CrucibleWeight.ArtifactPercsOffset[spellID] or 0)+1		
			CrucibleWeight.ArtifactPercsOffsetPreLoad[index][spellID] = current
			
	--		print(index, 'Fill bonus powerIndex for',spellID,'by',current)
		end
	end
end

function CrucibleWeight:BuildTotalRelicValue(index)
	local relicType = C_ArtifactUI.GetRelicSlotType(index);
	local talents = C_ArtifactRelicForgeUI.GetSocketedRelicTalents(index); -- index == 4 and C_ArtifactRelicForgeUI.GetPreviewRelicTalents() or 
	
--	print('BuildTotalRelicValue Relic index=', index)
	
	if ( talents ) then
		for slot, data in pairs(talents) do
			if slot == 1 then

			else
				local spellID = C_ArtifactUI.GetPowerInfo(data.powerID).spellID
				local isReachable = CrucibleWeight:IsReachable(talents, slot, index)
		
				if spellID and CrucibleWeight.GetValue(spellID) then				
					local spellIDOffset = CrucibleWeight.ArtifactPercsOffsetPreLoad[index] and CrucibleWeight.ArtifactPercsOffsetPreLoad[index][spellID] or 0
					
					CrucibleWeight.TotalRelicValue[index][slot] = { isReachable, CrucibleWeight.UnpackValue(CrucibleWeight.GetValue(spellID), 4+spellIDOffset) or 0, spellID }
				else
					CrucibleWeight.TotalRelicValue[index][slot] = { isReachable, 0, spellID }
				end
				
	--			print('  Slot=', slot, 'required=', data.requiredArtifactLevel, 'canChoose=', data.canChoose, 'isChosen=', data.isChosen, 'isReachable=',isReachable, 'value=', CrucibleWeight.TotalRelicValue[index][slot][2] )
			end
		end
	else
		CrucibleWeight.TotalRelicValue[index] = nil
		return
	end
end

function CrucibleWeight:GetPreviewRelicType()
	local itemID = C_ArtifactRelicForgeUI.GetPreviewRelicItemID()
	
	if not itemID then
		return false
	end
	
	local _, _, relicType = C_ArtifactUI.GetRelicInfoByItemID(itemID)
	
	return relicType
end

function CrucibleWeight:HaveDoubleRelicType()
	local previewType = CrucibleWeight:GetPreviewRelicType()
	local amount = 0
	
	for i=1, 3 do
		if CrucibleWeight.TotalRelicValue[i] and CrucibleWeight.TotalRelicValue[i][-2] == previewType then
			amount = amount + 1
		end
	end
	
	return ( amount == 2 )
end

function CrucibleWeight:GetSpellIDValueFromSlot(spellID, index, root)	
	if not RelicForgeSpells[spellID] then
		for slot, data in pairs( CrucibleWeight.TotalRelicValue[index] ) do
			if data[3] == spellID then
				return data[root]
			end
		end
	end
end

CrucibleWeight.previewSelection = nil

function CrucibleWeight.UpdatePreviewRelicValueBySelection()
	local selection
	
	for i=1, #CrucibleWeight.gui.checkBoxes do
		if CrucibleWeight.gui.checkBoxes[i].status then
			selection = i
		end
	end
	
--	print('Selection', selection)
	
	CrucibleWeight.previewSelection = selection
end

function CrucibleWeight:BuildPreviewRelicValue()
	CrucibleWeight.TotalRelicValue[4] = {}

	local relicType = CrucibleWeight:GetPreviewRelicType()
	local talents = C_ArtifactRelicForgeUI.GetPreviewRelicTalents()
	
	local totalitemlevel, spellID = CrucibleWeight.GetRelicInfo(4)
	local spellIDRank = 0
	
	if spellID then
	--	CrucibleWeight.ArtifactPercsOffset[spellID] = ( CrucibleWeight.ArtifactPercsOffset[spellID] or 0 ) + 1			
		spellIDRank = CrucibleWeight.previewSelection and CrucibleWeight.ArtifactPercsOffsetPreLoad[CrucibleWeight.previewSelection][spellID] or 0
	else	
--		print('Cant find spellID on relic slot', index)
	end
	
--	print('BuildTotalRelicValue Relic index=', 4, 'selected=',CrucibleWeight.previewSelection)
	
	if ( talents ) then
		for slot, data in pairs(talents) do
			if slot == 1 then

			else
				local spellID = C_ArtifactUI.GetPowerInfo(data.powerID).spellID
				local isReachable = CrucibleWeight.previewSelection and CrucibleWeight:IsReachablePreview(slot, CrucibleWeight.previewSelection) or not CrucibleWeight.previewSelection
				
				if spellID and CrucibleWeight.GetValue(spellID) then		 -- CrucibleWeight.previewSelection		
					local spellIDOffset = CrucibleWeight.previewSelection and CrucibleWeight.ArtifactPercsOffsetPreLoad[CrucibleWeight.previewSelection][spellID] or 0
					local value = CrucibleWeight.previewSelection and CrucibleWeight:GetSpellIDValueFromSlot(spellID, CrucibleWeight.previewSelection, 2) or CrucibleWeight.UnpackValue(CrucibleWeight.GetValue(spellID), 4+spellIDOffset) or 0						

					CrucibleWeight.TotalRelicValue[4][slot] = { isReachable, value, spellID }
				else
					CrucibleWeight.TotalRelicValue[4][slot] = { isReachable, 0, spellID }
				end
				
	--			print('  Slot=', slot, 'required=', data.requiredArtifactLevel, 'canChoose=', data.canChoose, 'isChosen=', data.isChosen, 'isReachable=',isReachable,'value=',CrucibleWeight.TotalRelicValue[4][slot][2] )
			end
		end
	else
		CrucibleWeight.TotalRelicValue[4] = nil
		return
	end
	
	local itemLevel = ( totalitemlevel and CrucibleWeight.GetValue(ILVL_TAG) ) and totalitemlevel*CrucibleWeight.GetValue(ILVL_TAG) or 0
	local powerLevel = 0
	
	if spellID and CrucibleWeight.GetValue(spellID) then
		-- Start looking

		powerLevel = CrucibleWeight.previewSelection and CrucibleWeight:GetSpellIDValueFromSlot(spellID, CrucibleWeight.previewSelection, 2) or CrucibleWeight.UnpackValue(CrucibleWeight.GetValue(spellID), 4+spellIDRank) or 0
	end
	
	local totalPower = itemLevel + powerLevel
	
--	print('Preview, value=', powerLevel, 'itemLevel=', itemLevel)
	
	CrucibleWeight.TotalRelicValue[4][0]  = { 'default',  powerLevel, spellID }
	CrucibleWeight.TotalRelicValue[4][-1] = { 'ilvl',     itemLevel  }
	CrucibleWeight.TotalRelicValue[4][-2] = relicType	
end

function CrucibleWeight:GetMaxForSlot( slot )
	local data = CrucibleWeight.TotalRelicValue[slot]
		
	if not data then
	
	--	print('GetMaxForSlot', 'no slot found', slot, 'CrucibleWeight.previewSelection=', CrucibleWeight.previewSelection)
		return 0
	else
	
		local a1 = ( data[2][1] and data[2][2] or 0 ) + ( data[4][1] and data[4][2] or 0 ) + data[0][2] + data[-1][2]
		local a2 = ( data[2][1] and data[2][2] or 0 ) + ( data[5][1] and data[5][2] or 0 ) + data[0][2] + data[-1][2]
		
		local a3 =  ( data[3][1] and data[3][2] or 0 ) +  ( data[5][1] and data[5][2] or 0 ) + data[0][2] + data[-1][2]
		local a4 =  ( data[3][1] and data[3][2] or 0 ) +  ( data[6][1] and data[6][2] or 0 ) + data[0][2] + data[-1][2]
		
		local currentMax = math.max(a1, a2, a3, a4)
		
		return currentMax
	end	
end

function CrucibleWeight:UpdateTotalRelicValue(index)
	local data = CrucibleWeight.TotalRelicValue[index]
	
--	print('Check preview', CrucibleWeight:GetPreviewRelicType())
	-- CrucibleWeight.previewSelection
	
	if data then	
		local currentMax = CrucibleWeight:GetMaxForSlot( index )
	
		--	local color = CrucibleWeight.GetNumberPosition(m1, m2, m3, m4)	
		--	local color = CrucibleWeight.GetColorPreset(0) --color[currentMax] or 0)
		CrucibleWeight.gui.RelicItemLevels[index].text:SetText( currentMax )

		if CrucibleWeight:GetPreviewRelicType() then
			if CrucibleWeight.previewSelection then
				if CrucibleWeight.previewSelection and ( index == CrucibleWeight.previewSelection or index == 4 ) then
					local compareMax = CrucibleWeight:GetMaxForSlot( index == CrucibleWeight.previewSelection and 4 or CrucibleWeight.previewSelection )
					
					local color = CrucibleWeight.GetNumberPosition(currentMax, compareMax)	
					color = CrucibleWeight.GetColorPreset(color[currentMax] or 0)
					
					CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(color[1], color[2], color[3],1)
					CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(color[1], color[2], color[3], 0.4)
				else				
					local color = CrucibleWeight.GetColorPreset(0)
					
					CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(color[1], color[2], color[3],1)
					CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(color[1], color[2], color[3], 0.4)
				end
			else
				if CrucibleWeight:GetPreviewRelicType() == data[-2] then				
					CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(basicColor[1], basicColor[2], basicColor[3],1)
					CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(basicColor[1], basicColor[2], basicColor[3], 0.4)
				else	
					local color = CrucibleWeight.GetColorPreset(0)
					
					CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(color[1], color[2], color[3],1)
					CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(color[1], color[2], color[3], 0.4)
				end
			end
		else
			CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(basicColor[1], basicColor[2], basicColor[3],1)
			CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(basicColor[1], basicColor[2], basicColor[3], 0.4)
		end
	else
		local color = CrucibleWeight.GetColorPreset(0)
		
		CrucibleWeight.gui.RelicItemLevels[index].text:SetText( 'X' )
		CrucibleWeight.gui.RelicItemLevels[index].text:SetTextColor(color[1], color[2], color[3],1)
		CrucibleWeight.gui.RelicItemLevels[index].texture:SetColorTexture(color[1], color[2], color[3], 0.4)
	end
end

CrucibleWeight.ArtifactPercsOffset = {}
CrucibleWeight.TotalRelicValue = {}
CrucibleWeight.PreviewRelicCompare = {}
CrucibleWeight.ArtifactPercsOffsetPreLoad = {}

function CrucibleWeight:CacheSocketedRelic(index)
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	local talents = C_ArtifactRelicForgeUI.GetSocketedRelicTalents(index);

	local str = '';
	
	if ( talents ) then
		for slot, data in pairs(talents) do
			if slot == 1 then

			else
				local spellID = C_ArtifactUI.GetPowerInfo(data.powerID).spellID
				str = str..spellID..':'..(data.isChosen and '1' or '0')..(slot == 6 and '' or '-')
			end
		end
		CrucibleWeight.profile.relicCache[itemID][index] = str
	end
end

function CrucibleWeight:BuildaRelicData()
	wipe(CrucibleWeight.ArtifactPercsOffset)
	wipe(CrucibleWeight.TotalRelicValue)
	wipe(CrucibleWeight.PreviewRelicCompare)
	wipe(CrucibleWeight.ArtifactPercsOffsetPreLoad)
	
	for i=1, 3 do
		CrucibleWeight:CacheSocketedRelic(i)
	end
	
	for i=1, 3 do
		CrucibleWeight:BuildTotalBaseRelicValue(i)
		CrucibleWeight:BuildTotalBonusRelicValue(i)
	end
	
	for i=1, 3 do
		CrucibleWeight:BuildTotalRelicValue(i)
	end		
	
--	print('T', CrucibleWeight:GetPreviewRelicType())
	
	if CrucibleWeight:GetPreviewRelicType() then
		CrucibleWeight:BuildPreviewRelicValue()
	end
	
	for i=1, 3 do
		CrucibleWeight:UpdateTotalRelicValue(i)
	end
	
	CrucibleWeight:UpdateTotalRelicValue(4)

	CrucibleWeight:BuildRelicValue(CrucibleWeight.lastSetRelicSlot or 1)
	
	-- Preview 4
end

function CrucibleWeight:BuildRelicValue(index)

	if CrucibleWeight.TotalRelicValue[index] then
		for a=1, #CrucibleWeight.talentElement do
			local data = CrucibleWeight.TotalRelicValue[index]
			
			if data and data[CrucibleWeight.talentElement[a].id] then
				local isReachable, value = data[CrucibleWeight.talentElement[a].id][1], data[CrucibleWeight.talentElement[a].id][2]
				
				local color
				if CrucibleWeight.talentElement[a].id == 2 or CrucibleWeight.talentElement[a].id == 3 then
					color = CrucibleWeight.GetNumberPosition(data[2][2], data[3][2])	
				else
					color = CrucibleWeight.GetNumberPosition(data[4][2], data[5][2], data[6][2])	
				end
			
				color = CrucibleWeight.GetColorPreset(color[value] or 0)
				
				CrucibleWeight.talentElement[a].text:SetText(value or '??')
				CrucibleWeight.talentElement[a].text:SetTextColor(color[1],color[2],color[3],1)
				CrucibleWeight.talentElement[a].texture:SetColorTexture(color[1],color[2],color[3],0.4)
			else
				CrucibleWeight.talentElement[a].text:SetText('??')
				CrucibleWeight.talentElement[a].text:SetTextColor(CrucibleWeight.GetColorPreset(0)[1],CrucibleWeight.GetColorPreset(0)[2],CrucibleWeight.GetColorPreset(0)[3],1)
				CrucibleWeight.talentElement[a].texture:SetColorTexture(CrucibleWeight.GetColorPreset(0)[1],CrucibleWeight.GetColorPreset(0)[2],CrucibleWeight.GetColorPreset(0)[3],0.4 )
			end
		end
	else
		for a=1, #CrucibleWeight.talentElement do
			CrucibleWeight.talentElement[a].text:SetText('??')
			CrucibleWeight.talentElement[a].text:SetTextColor(CrucibleWeight.GetColorPreset(0)[1],CrucibleWeight.GetColorPreset(0)[2],CrucibleWeight.GetColorPreset(0)[3],1)
			CrucibleWeight.talentElement[a].texture:SetColorTexture(CrucibleWeight.GetColorPreset(0)[1],CrucibleWeight.GetColorPreset(0)[2],CrucibleWeight.GetColorPreset(0)[3],0.4 )
		end	
	end
end

function CrucibleWeight:UpdateTotalCompareColors()

end

local relicBagCache = {}
local relicParseList = {}
local ignorePreviewLookUp = false
local startload = true

function CrucibleWeight:LookUpRelics()	
	print('CrucibleWeight:LookUpRelics')
	for bagID = 0, 4 do
		for invID = 1, GetContainerNumSlots(bagID) do
			local itemID = GetContainerItemID(bagID, invID)
			
		--	print('LookUpRelics', bagID, invID, itemID, itemID and IsArtifactRelicItem(itemID))
			
			if itemID and IsArtifactRelicItem(itemID) then
				local index = 0
				
				local scan = true
				
				for i=1, #relicBagCache do 
					local d = relicBagCache[i]
					if d[1] == bagID and d[2] == invID then
						scan = false
					end
				end
				
				if scan then
					relicParseList[#relicParseList+1] = { bagID, invID }
					
				--	print('relicParseList', bagID, invID)
				--	C_ArtifactRelicForgeUI.ClearPreviewRelic();
					PickupContainerItem(bagID, invID)
					
					local canSet, bindWarning = C_ArtifactRelicForgeUI.CanSetPreviewRelicFromCursor();
					if ( canSet ) then
						if ( bindWarning ) then
							
						else
							C_ArtifactRelicForgeUI.SetPreviewRelicFromCursor();
							local isAttuned, canAttune = C_ArtifactRelicForgeUI.GetPreviewRelicAttuneInfo();
							if ( canAttune ) then
								C_ArtifactRelicForgeUI.AttunePreviewRelic();
							end
						end
					else
						ResetCursor()
					end
				end
			end
		end
	end
	
	startload = false
	ignorePreviewLookUp = true
	C_ArtifactRelicForgeUI.ClearPreviewRelic();
	ResetCursor()
	ignorePreviewLookUp = false
end

CrucibleWeight.relicSlotValue = {}

local init = true

function CrucibleWeight.Init()

	if not init then return end
	init = false
	
	CrucibleWeight.mainFrame:SetParent(_G.ArtifactRelicForgeFrame)
	CrucibleWeight.mainFrame.close:Hide()
	CrucibleWeight.mainFrame.toggle:Show()
	CrucibleWeight.mainFrame.import:Show()
	CrucibleWeight.mainFrame:SetSlide(false)
	
	CrucibleWeight.artifactName:SetParent(_G.ArtifactRelicForgeFrame)
	CrucibleWeight.artifactName:SetPoint('TOP', _G.ArtifactRelicForgeFrame, 'TOP', 0, -30)
	
		
	CrucibleWeight.talentElement[#CrucibleWeight.talentElement+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.Talent2,2)
	CrucibleWeight.talentElement[#CrucibleWeight.talentElement+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.Talent3,3)
	CrucibleWeight.talentElement[#CrucibleWeight.talentElement+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.Talent4,4)
	CrucibleWeight.talentElement[#CrucibleWeight.talentElement+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.Talent5,5)
	CrucibleWeight.talentElement[#CrucibleWeight.talentElement+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.Talent6,6)
	
	for i=1, 3 do
		local widget = ArtifactRelicForgeFrame.TitleContainer['RelicSlot'..i]
		
		CrucibleWeight.gui.RelicItemLevels[#CrucibleWeight.gui.RelicItemLevels+1] = CrucibleWeight.CreaetTalentElement(widget, i)
		CrucibleWeight.gui.RelicItemLevels[#CrucibleWeight.gui.RelicItemLevels]:SetPoint('TOP', widget, 'BOTTOM', 0, 5)
		
		CrucibleWeight.gui.checkBoxes[#CrucibleWeight.gui.checkBoxes+1] = CrucibleWeight.CreateCheckBox(widget, i)
		CrucibleWeight.gui.checkBoxes[#CrucibleWeight.gui.checkBoxes]:SetPoint('BOTTOM', widget, 'BOTTOM', -20, 5)
	end
	
	CrucibleWeight.gui.RelicItemLevels[#CrucibleWeight.gui.RelicItemLevels+1] = CrucibleWeight.CreaetTalentElement(ArtifactRelicForgeFrame.PreviewRelicFrame,4)
	
	hooksecurefunc(ArtifactRelicForgeFrame, 'SetRelicSlot', function(self, relicID)			
--		print('SetRelicSlot', relicID)
		
		CrucibleWeight.lastSetRelicSlot = relicID		
		CrucibleWeight:BuildRelicValue(CrucibleWeight.lastSetRelicSlot)		
	end)
	
	local onlyPickedCount = CreateFrame('CheckButton', nil, ArtifactRelicForgeFrame, "UICheckButtonTemplate") --"UICheckButtonTemplate"
		onlyPickedCount:SetFrameLevel(ArtifactRelicForgeFrame:GetFrameLevel() + 1)
		onlyPickedCount:SetSize(26, 26)
		onlyPickedCount:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		onlyPickedCount:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		onlyPickedCount:SetChecked(CrucibleWeight.profile.onlyPickedCount)
		onlyPickedCount.status = CrucibleWeight.profile.onlyPickedCount
		onlyPickedCount:Show()
		onlyPickedCount:SetPoint('TOPLEFT', ArtifactRelicForgeFrame, 'TOPLEFT', 40, -145)
		
		onlyPickedCount:SetScript("OnEnter", function(self)	
			
		end)
		onlyPickedCount:SetScript("OnLeave", function(self)
			
		end)

		onlyPickedCount:SetScript("OnClick", function(self)
			CrucibleWeight.profile.onlyPickedCount = not CrucibleWeight.profile.onlyPickedCount
			
			CrucibleWeight.checkReachable = CrucibleWeight.profile.onlyPickedCount
			
			CrucibleWeight:BuildaRelicData()
		end)
		
		onlyPickedCount.text = onlyPickedCount:CreateFontString()
		onlyPickedCount.text:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
		onlyPickedCount.text:SetPoint('LEFT', onlyPickedCount, 'RIGHT', 0, 2)
		onlyPickedCount.text:SetText('只考虑可获得的特质.') --Take into consideration only reachable traits
	
		if C_ArtifactUI.GetTotalPurchasedRanks() >= 75 then
			onlyPickedCount:Hide()
			
			CrucibleWeight.checkReachable = false
		else
			CrucibleWeight.checkReachable = CrucibleWeight.profile.onlyPickedCount
		end
		
	-- Artifact frame
	ArtifactFrame.PerksTab.TitleContainer.RelicSlot1:HookScript('OnClick', function(self, button)
		if IsLeftControlKeyDown() and button == 'LeftButton' then
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
			
			CrucibleWeight.InspectRelic(CrucibleWeight.profile.relicCache[itemID][1])
		end
	end)
	ArtifactFrame.PerksTab.TitleContainer.RelicSlot2:HookScript('OnClick', function(self, button)
		if IsLeftControlKeyDown() and button == 'LeftButton' then
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
			
			CrucibleWeight.InspectRelic(CrucibleWeight.profile.relicCache[itemID][2])
		end
	end)
	ArtifactFrame.PerksTab.TitleContainer.RelicSlot3:HookScript('OnClick', function(self, button)
		if IsLeftControlKeyDown() and button == 'LeftButton' then
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
			
			CrucibleWeight.InspectRelic(CrucibleWeight.profile.relicCache[itemID][3])
		end
	end)
end

function CrucibleWeight.PreparePresets()
	local itemID, altItemID, name, icon, xp, pointsSpent, quality = C_ArtifactUI.GetEquippedArtifactInfo()

	-- CrucibleWeight.BuildExportString()
	
	if not CrucibleWeight.profile.presets[itemID] then
		CrucibleWeight.profile.presets[itemID] = {}
	end
	if not CrucibleWeight.profile.relicCache[itemID] then
		CrucibleWeight.profile.relicCache[itemID] = {}
	end

	if #CrucibleWeight.profile.presets[itemID] == 0 then
		print('[CruWe]', 'Update profiles')
		print('  Create default preset based on your current profile')
	
		CrucibleWeight.profile.presets[itemID][#CrucibleWeight.profile.presets[itemID]+1] = {
			name = 'Default',
			code = CrucibleWeight.profile[itemID] or {},
			selected = true,
		}
		
			
		if not CrucibleWeight.profile[itemID] and localDB[itemID] then
			CrucibleWeight.GetImportString(localDB[itemID])
		end
	end
	
	CrucibleWeight.UpdatePresetSelection()
end

local loader = CreateFrame('Frame')
loader:RegisterEvent('ADDON_LOADED')
loader:RegisterEvent("ARTIFACT_RELIC_FORGE_UPDATE");
loader:RegisterEvent("ARTIFACT_RELIC_FORGE_CLOSE");
loader:RegisterEvent("ARTIFACT_RELIC_FORGE_PREVIEW_RELIC_CHANGED");
loader:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
loader:SetScript('OnEvent', function(self, event, name)
	
	if name == "_ShiGuang" then
		--print(' loaded. Commands, ', cmd1, 'or', cmd2)
			--print('  CTRL+Right click to inspect socketed relic.')
			--print('  ')
		
		local profileName = UnitName('player')..' - '..GetRealmName()
		
		ShiGuangDB = ShiGuangDB or {}
		ShiGuangDB.CrucibleWeightArtifacts = ShiGuangDB.CrucibleWeightArtifacts or {}
		ShiGuangDB.CrucibleWeightChars = ShiGuangDB.CrucibleWeightChars or {}
		
		if not ShiGuangDB.CrucibleWeightChars[profileName] then
			ShiGuangDB.CrucibleWeightChars[profileName] = {}
			ShiGuangDB.CrucibleWeightChars[profileName].artifactWeight = {}		
		end
		
		if not ShiGuangDB.CrucibleWeightChars[profileName].presets then
			ShiGuangDB.CrucibleWeightChars[profileName].presets = {}
		end
		if not ShiGuangDB.CrucibleWeightChars[profileName].relicCache then
			ShiGuangDB.CrucibleWeightChars[profileName].relicCache = {}
		end
		
		CrucibleWeight.profile = ShiGuangDB.CrucibleWeightChars[profileName]		
	elseif name == 'Blizzard_ArtifactUI' then
		
		CrucibleWeight.Init()

	elseif event == 'ARTIFACT_RELIC_FORGE_UPDATE' then		
		CrucibleWeight.Init()
		
		local itemID, altItemID, name, icon, xp, pointsSpent, quality = C_ArtifactUI.GetEquippedArtifactInfo()

		CrucibleWeight.PreparePresets()
		
		CrucibleWeight.UpdatePresetSelection()
		
		if localDB[itemID] then
			CrucibleWeight.mainFrame.reset:Show()
		else
			CrucibleWeight.mainFrame.reset:Hide()
		end
		
		CrucibleWeight.artifactName:SetParent(_G.ArtifactRelicForgeFrame)
		CrucibleWeight.artifactName:SetPoint('TOP', _G.ArtifactRelicForgeFrame, 'TOP', 0, -30)
		CrucibleWeight.artifactName:SetText(name)
		CrucibleWeight.artifactName:SetTextColor(GetItemQualityColor(quality))
		
	
		if CrucibleWeight.mainFrame.toggleByCommand then
			CrucibleWeight.mainFrame.toggleByCommand = false
			
			CrucibleWeight.mainFrame:SetSlide(true)
		else
			CrucibleWeight.mainFrame:SetSlide(toggled)			
		end
		
		CrucibleWeight.mainFrame:Show()
		CrucibleWeight.mainFrame:SetParent(_G.ArtifactRelicForgeFrame)
		CrucibleWeight.mainFrame.close:Hide()
		CrucibleWeight.mainFrame.toggle:Show()
		CrucibleWeight.mainFrame.import:Show()
		CrucibleWeight.mainFrame:SetMovable(false)
		
		CrucibleWeight.UpdateArtifactGUIElements()
		CrucibleWeight.UpdateValues()
	
		if not startload then return end
		startload = true
		
	--	CrucibleWeight:ScanRelics()	
	--	CrucibleWeight:LookUpRelics()	
	elseif event == 'ARTIFACT_RELIC_FORGE_CLOSE' then
	--	print(event)
		
		CrucibleWeight.mainFrame:Hide()
		CrucibleWeight.ToggleCheckBox(false)
		startload = true
		
	elseif event == 'ARTIFACT_RELIC_FORGE_PREVIEW_RELIC_CHANGED' then
		local relicType = CrucibleWeight:GetPreviewRelicType()
		local talents = C_ArtifactRelicForgeUI.GetPreviewRelicTalents()
		
		CrucibleWeight.ToggleCheckBox(false)
		
	--	print(event, relicType, talents)
	
		if relicType and not talents then
			C_Timer.After(2, function()
				CrucibleWeight.UpdateValues()	
				CrucibleWeight.ToggleCheckBox(CrucibleWeight:GetPreviewRelicType() and true or false)
			end)
		else		
			CrucibleWeight.UpdateValues()	
			CrucibleWeight.ToggleCheckBox(relicType and true or false)
		end
		
		if ignorePreviewLookUp then return end
		if not startload then return end
		
		
	--	CrucibleWeight:ScanPreviewRelic()
	elseif event == 'PLAYER_EQUIPMENT_CHANGED' then
		if CrucibleWeight.mainFrame:IsShown() then
			CrucibleWeight.PreparePresets()
			
	--		print('Update mainframe')
			CrucibleWeight.UpdateArtifactGUIElements()
			CrucibleWeight.UpdateValues()
			CrucibleWeight.UpdatePresetSelection()
		end
	end
end)

function CrucibleWeight.GetSelectedPreset()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()

	for i=1, #CrucibleWeight.profile.presets[itemID] do
		if CrucibleWeight.profile.presets[itemID][i].selected then						
			return i,  CrucibleWeight.profile.presets[itemID][i].code
		end
	end
end


function CrucibleWeight.ComfirmAndSave(editBox, spellID, value)
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	CrucibleWeight.profile[itemID] = CrucibleWeight.profile[itemID] or {}
	
	local index, code = CrucibleWeight.GetSelectedPreset()
	
	if value == '' then
		code[spellID] = nil
		editBox:SetText('')
	else	
		local isMultiValue = CrucibleWeight.ValidPack(value)
		
		if isMultiValue then
			code[spellID] = value
			editBox:SetText(value)
		elseif tonumber(value) then
			code[spellID] = tonumber(value)
			editBox:SetText(tonumber(value))
		else
			code[spellID] = nil
			editBox:SetText('')
		end
	end
	
	CrucibleWeight.UpdateValues()
end

local deadLine = {
	[201460] = { -- Unleashed Demons DH
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 0.75,
		[5] = 0.5,
		[6] = 0.5,
		[7] = 0.5,
		[8] = 0.5,
	},
	[190462] = { -- Quick Shot Hunter
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 0.75,
		[5] = 0.5,
		[6] = 0.5,
		[7] = 0.5,
		[8] = 0.5,	
	},
	[192349] = { -- Master Assassin Rogue
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 0.75,
		[5] = 0.5,
		[6] = 0.5,
		[7] = 0.5,
		[8] = 0.5,
	},
	[202507] = { -- Blade Dancer Rogue
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 1,
		[6] = 1,
		[7] = 0.75,
		[8] = 0,
	},
	[194093] = { -- Unleash the Shadows Shadow
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 1, 
		[6] = 1,
		[7] = 0.75,
		[8] = 0,
	},
}
-- 1.78 1:232

function CrucibleWeight.IsMultiValueSpellID(spellID)	
	local value = CrucibleWeight.GetValue(spellID)
	
	if value and type(value) == 'string' then
		local info = { strsplit(' ', value) } 
		local status = #info > 1
		
		wipe(info)

		return status
	elseif value and type(value) == 'number' then
		return false
	end
	
	return false
end

function CrucibleWeight.UnpackValue(value, place)
	if value and type(value) == 'string' then
		local info = { strsplit(' ', value) } 
		local preset = {}
		local prev = 1
		
		for i=1, #info do
			local rank, value = strsplit(':', info[i])
		
			if not value then
				value = rank
				rank = prev
			end
			
			rank = tonumber(rank)
			value = tonumber(value)
			prev = rank + 1
			
			preset[rank] = value
		end
		
		wipe(info)
		
		return place and preset[place] or preset[1]
	elseif value and type(value) == 'number' then
		return value
	end
	
	return false
end

function CrucibleWeight.PackValues(data, spellID)
	local prevValue = nil
	local str = ''
	
	for rank=1, 8 do
		local value = data[rank]
		
		if value then
			if str == '' and value then
				str = tostring(value)
			elseif prevValue ~= tostring(value) then
				str = str..' '..rank..':'..value
			end
			
			prevValue = tostring(value)
		end
	end

	return str
end

function CrucibleWeight.ValidPack(str)
	local info = { strsplit(' ', str) }
	local status = true
	
	for i=1, #info do
		local rank, value = strsplit(':', info[i])
		
		if not value then
			value = rank
			rank = i-1
		end
		
		if not tonumber(rank) or not tonumber(value) then
			status = false
		end
	end
	
	wipe(info)
	
	return status
end

function CrucibleWeight.GetValue(spellID)
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	local index, code = CrucibleWeight.GetSelectedPreset()
	
	if code and code[spellID] then		
		return code[spellID]
	end
	
	return false
end

function CrucibleWeight.UpdateValues()
	local updateGUI = _G.ArtifactRelicForgeFrame and _G.ArtifactRelicForgeFrame:IsShown() or false

	for k,v in pairs(CrucibleWeight.gui.Elements) do		
		for i, element in pairs(v) do
			element:SetText(CrucibleWeight.GetValue(element.spellID) or '')
		end
	end
	
	CrucibleWeight.gui.ItemLevel:SetText(CrucibleWeight.GetValue(ILVL_TAG) or '')
	
	if updateGUI then
		CrucibleWeight.UpdatePreviewRelicValueBySelection()
		CrucibleWeight:BuildaRelicData()
	end
end

CrucibleWeight.currentArtifactPercs = {}

-- Artifact parses
do
	-- Artifact Parser
	local function PrepareForScan()
		local ArtifactFrame = _G.ArtifactFrame
		
		if not ArtifactFrame or not ArtifactFrame:IsShown() then
	--		print('PrepareForScan', 'Success')
			
			_G.UIParent:UnregisterEvent("ARTIFACT_UPDATE")
			if ArtifactFrame then
				ArtifactFrame:UnregisterEvent("ARTIFACT_UPDATE")
			end
		end
	end

	local function RestoreStateAfterScan()
		local ArtifactFrame = _G.ArtifactFrame
			
		if not ArtifactFrame or not ArtifactFrame:IsShown() then
			C_ArtifactUI.Clear()
			
	--		print('RestoreStateAfterScan', 'Success')
			
			if ArtifactFrame then
				ArtifactFrame:RegisterEvent("ARTIFACT_UPDATE")
			end
			_G.UIParent:RegisterEvent("ARTIFACT_UPDATE")
		end
	end

	local lastUpdate = -1
	local init = true
	local initUpdate = true

	local function GetArtifactPercInfo()
		initUpdate = true
		
		if not HasArtifactEquipped() then		
			lastUpdate = -1			
			return false
		end
		
		if init or lastUpdate < GetTime() then
			lastUpdate = GetTime() + 2
			init = false

			PrepareForScan()
			SocketInventoryItem(INVSLOT_MAINHAND)
			
			local powers = C_ArtifactUI.GetPowers();
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo();
			wipe(CrucibleWeight.currentArtifactPercs)

			if powers then
				if itemID and 
					not ShiGuangDB.CrucibleWeightArtifacts[itemID] then
						ShiGuangDB.CrucibleWeightArtifacts[itemID] = {}
				end
				
				local total = 0
				
				for i, powerID in ipairs(powers) do
					local powerInfo = C_ArtifactUI.GetPowerInfo(powerID);
					
					local spellID, cost, currentRank, maxRank, bonusRanks
					
					if powerInfo and type(powerInfo) == 'table' then
						spellID = powerInfo.spellID;
						maxRank = powerInfo.maxRank;
					else
						spellID, cost, currentRank, maxRank, bonusRanks = C_ArtifactUI.GetPowerInfo(powerID);	
					end
					
					if maxRank and maxRank > 1 and maxRank < 10 then
						total = total + 1
						ShiGuangDB.CrucibleWeightArtifacts[itemID][powerID] = spellID
						
						CrucibleWeight.currentArtifactPercs[spellID] = maxRank
					--	print(total, maxRank, GetSpellLink(spellID))
					else
					--	print('Ignore', maxRank, GetSpellLink(spellID))
					end
				end
			end
			
			RestoreStateAfterScan()
		end
	end
	
	
	local eventframe = CreateFrame("Frame")
	eventframe:SetScript("OnEvent", function(self, event, unit)
		if event == 'ARTIFACT_UPDATE' then
			if not unit then
				if initUpdate then
					initUpdate = false
					C_Timer.After(0.5, GetArtifactPercInfo)
				end
			end
		else
			if initUpdate then
				initUpdate = false
				C_Timer.After(0.5, GetArtifactPercInfo)
			end
		end
	end)
	eventframe:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
	eventframe:RegisterEvent("PLAYER_TALENT_UPDATE")
	eventframe:RegisterEvent("PLAYER_LEVEL_UP")
	eventframe:RegisterEvent("PLAYER_LOGIN")
	eventframe:RegisterEvent("ARTIFACT_CLOSE")
	eventframe:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
end

if GetLocale() == 'enUS' or GetLocale() == 'enGB' then

else
	hooksecurefunc(GameTooltip, 'SetArtifactPowerByID', function(self, powerID)
		local powerData = C_ArtifactUI.GetPowerInfo(powerID)
		if powerData and RelicForgeSpells[powerData.spellID] then
	--		print(powerID, powerData.spellID, RelicForgeSpells[powerData.spellID])
			
			GameTooltip:AddLine('  ')
			GameTooltip:AddLine('Eng - '..RelicForgeSpells[powerData.spellID], GetItemQualityColor(6))
		end
	end)
end

-- GUI

local mainFrame = CreateFrame('Frame', nil, _G.UIParent)
mainFrame:SetClampedToScreen(true)
mainFrame:SetSize(300, 560)
mainFrame:Hide()
mainFrame:EnableMouse(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
	if self:IsMovable() then
		self:StartMoving()
	end
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing() 
end)
		
CrucibleWeight.artifactName = mainFrame:CreateFontString()
		CrucibleWeight.artifactName:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
		CrucibleWeight.artifactName:SetPoint('TOP', mainFrame, 'TOP', 0, -30)
		CrucibleWeight.artifactName:SetText('')
		
		
mainFrame.border = mainFrame:CreateTexture()
mainFrame.border:SetAllPoints()
mainFrame.border:SetColorTexture(0,0,0,1)
mainFrame.border:SetDrawLayer('BORDER')

mainFrame.background = mainFrame:CreateTexture()
mainFrame.background:SetPoint('TOPLEFT', mainFrame, 'TOPLEFT', 1, -1)
mainFrame.background:SetPoint('BOTTOMRIGHT', mainFrame, 'BOTTOMRIGHT', -1, 1)
mainFrame.background:SetColorTexture(0.1,0.1,0.1,1)
mainFrame.background:SetDrawLayer('ARTWORK')

mainFrame.export = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
	mainFrame.export:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.export:SetSize(60,20)
	mainFrame.export:SetPoint("BOTTOM", mainFrame, "BOTTOM", -32, 5)
	mainFrame.export:Show()

	mainFrame.export:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		CrucibleWeight:Popup('export')
	end)

	mainFrame.export.text = mainFrame.export:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.export.text:SetPoint("CENTER", mainFrame.export, "CENTER", 0 , 0)
	mainFrame.export.text:SetTextColor(1, 0.8, 0)
	mainFrame.export.text:SetText("Export")
	mainFrame.export.text:SetJustifyH("CENTER")
	mainFrame.export.text:SetWordWrap(false)
	

mainFrame.import = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
	mainFrame.import:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.import:SetSize(60,20)
	mainFrame.import:SetPoint("BOTTOM", mainFrame, "BOTTOM", 32, 5)
	mainFrame.import:Show()

	mainFrame.import:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		CrucibleWeight:Popup('import')
	end)

	mainFrame.import.text = mainFrame.import:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.import.text:SetPoint("CENTER", mainFrame.import, "CENTER", 0 , 0)
	mainFrame.import.text:SetTextColor(1, 0.8, 0)
	mainFrame.import.text:SetText("import")
	mainFrame.import.text:SetJustifyH("CENTER")
	mainFrame.import.text:SetWordWrap(false)

mainFrame.reset = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
	mainFrame.reset:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.reset:SetSize(60,20)
	mainFrame.reset:SetPoint("BOTTOM", mainFrame, "BOTTOM", -95, 5)
	mainFrame.reset:Show()

	mainFrame.reset:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		local itemID = C_ArtifactUI.GetEquippedArtifactInfo()

		CrucibleWeight.profile[itemID] = {}		
		CrucibleWeight.GetImportString(localDB[itemID])
	end)

	mainFrame.reset.text = mainFrame.reset:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.reset.text:SetPoint("CENTER", mainFrame.reset, "CENTER", 0 , 0)
	mainFrame.reset.text:SetTextColor(1, 0.8, 0)
	mainFrame.reset.text:SetText("reset")
	mainFrame.reset.text:SetJustifyH("CENTER")
	mainFrame.reset.text:SetWordWrap(false)

mainFrame.simc = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
	mainFrame.simc:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.simc:SetSize(60,20)
	mainFrame.simc:SetPoint("BOTTOM", mainFrame, "BOTTOM", 95, 5)
	mainFrame.simc:Hide()

	mainFrame.simc:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		CrucibleWeight:Popup('simc')
	end)

	mainFrame.simc.text = mainFrame.simc:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.simc.text:SetPoint("CENTER", mainFrame.simc, "CENTER", 0 , 0)
	mainFrame.simc.text:SetTextColor(1, 0.8, 0)
	mainFrame.simc.text:SetText("simc")
	mainFrame.simc.text:SetJustifyH("CENTER")
	mainFrame.simc.text:SetWordWrap(false)
		

mainFrame.addnew = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
	mainFrame.addnew:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.addnew:SetSize(60,20)
	mainFrame.addnew:SetPoint("BOTTOM", mainFrame, "BOTTOM", 95, 5)
	mainFrame.addnew:Show()

	mainFrame.addnew:SetScript("OnClick", function(self)
		CrucibleWeight.AddNewPreset()
	end)
	
	mainFrame.addnew.text = mainFrame.addnew:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.addnew.text:SetPoint("CENTER", mainFrame.addnew, "CENTER", 0 , 0)
	mainFrame.addnew.text:SetTextColor(1, 0.8, 0)
	mainFrame.addnew.text:SetText("Add new")
	mainFrame.addnew.text:SetJustifyH("CENTER")
	mainFrame.addnew.text:SetWordWrap(false)	
	
mainFrame.close = CreateFrame("Button", nil, mainFrame)
	mainFrame.close:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	mainFrame.close:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	mainFrame.close:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
	mainFrame.close:SetSize(32, 32)
	mainFrame.close:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", 0, 0)
	mainFrame.close:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		mainFrame:Hide()
		mainFrame.toggleStatus = nil
	end)

mainFrame.toggle = CreateFrame("Button", nil, mainFrame)
	mainFrame.toggle:SetFrameLevel(mainFrame:GetFrameLevel()+1)
	mainFrame.toggle:SetSize(20,80)
	mainFrame.toggle:SetPoint("RIGHT", mainFrame, "RIGHT", 0, 0)
	mainFrame.toggle:Show()

	mainFrame.toggle:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		
		CrucibleWeight.ToggleMainFrame()
	end)

	mainFrame.toggle.text = mainFrame.toggle:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	mainFrame.toggle.text:SetFont(STANDARD_TEXT_FONT, 14)
	mainFrame.toggle.text:SetPoint("RIGHT", mainFrame.toggle, "RIGHT", -5, 0)
	mainFrame.toggle.text:SetTextColor(1, 0.8, 0)
	mainFrame.toggle.text:SetText(">\n>\n>\n>\n>\n>")
	mainFrame.toggle.text:SetJustifyH("RIGHT")
	mainFrame.toggle.text:SetWordWrap(true)	
	
CrucibleWeight.mainFrame = mainFrame


local RelicForgeSpells = {
	-- Void Traits
	[252091] = 'Master of Shadows',
	[252191] = 'Murderous Intent',
	[252875] = 'Shadowbind',
	[252888] = 'Chaotic Darkness',
	[252906] = 'Torment the Weak',
	[252922] = 'Dark Sorrows',
	
	-- Light Traits
	[252088] = 'Light Speed',
	[252207] = 'Refractive Shell',
	[252799] = 'Shocklight',
	[253070] = 'Secure in the Light',
	[253093] = 'Infusion of Light',
	[253111] = "Light's Embrace",
}

local relicPercsPosition = {
	['VOID']  = {252091,252191,252875,252888,252906,252922},
	['LIGHT'] = {252088,252207,252799,253070,253093,253111},
}

function CrucibleWeight.CreateElement()
	
	local f = CreateFrame("EditBox", nil, mainFrame)
	f:SetFontObject('ChatFontNormal')
	f:SetFrameLevel(mainFrame:GetFrameLevel() + 1)
	f:SetAutoFocus(false)
	f:SetWidth(160)
	f:SetHeight(20)
	f:SetBackdrop({
			bgFile = [[Interface\Buttons\WHITE8x8]],
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 1,
			insets = {top = 0, left = 0, bottom = 0, right = 0},
				})
	f:SetBackdropColor(0, 0, 0, 0.2)
	f:SetBackdropBorderColor(0,0,0,1)
		
	f:SetScript("OnEscapePressed", function(self)
		self:ClearFocus()
		self.ok:Hide()
		self:SetText(CrucibleWeight.GetValue(self.spellID) or '')
	end)
	f:SetScript('OnEnterPressed', function(self)
		self:ClearFocus()
		self.ok:Hide()
		
		CrucibleWeight.ComfirmAndSave(self, self.spellID, self:GetText())
	end)
	
	local text = f:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	text:SetPoint("BOTTOMLEFT", f, "TOPLEFT", -15 , 0)
	text:SetJustifyH("LEFT")
	text:SetWordWrap(false)
	
	local okbttm = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
	okbttm:SetFrameLevel(f:GetFrameLevel()+1)
	okbttm:SetSize(30,20)
	okbttm:SetPoint("RIGHT", f, "RIGHT", 0, 0)
	okbttm:Hide()

	okbttm:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		self:GetParent():ClearFocus()
		self:Hide()
		CrucibleWeight.ComfirmAndSave( self:GetParent(), self:GetParent().spellID, self:GetParent():GetText())
	end)
	
	okbttm.text = okbttm:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	okbttm.text:SetPoint("CENTER", okbttm, "CENTER", 0 , 0)
	okbttm.text:SetTextColor(1, 0.8, 0)
	okbttm.text:SetText("OK")
	okbttm.text:SetJustifyH("CENTER")
	okbttm.text:SetWordWrap(false)
	
	f:SetScript("OnTextChanged", function(self, userInput)	
		if userInput then
			self.ok:Show()
		end
	end)
	
	
	f.mouseover = CreateFrame("Frame", nil, f)
	f.mouseover:SetFrameLevel(f:GetFrameLevel()+2)
	f.mouseover:SetSize(1,1)
	f.mouseover:SetPoint("TOPLEFT", text, "TOPLEFT", -3, 3)
	f.mouseover:SetPoint("BOTTOMRIGHT", text, "BOTTOMRIGHT", 3, -3)
	f.mouseover:SetScript("OnEnter", function(self)	
		if self:GetParent().spellID == ILVL_TAG then		
			return
		end
		
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
		GameTooltip:SetHyperlink('spell:'..self:GetParent().spellID)
		
		if GetLocale() == 'enUS' or GetLocale() == 'enGB' then

		else
			if self:GetParent().spellID and RelicForgeSpells[self:GetParent().spellID] then
				GameTooltip:AddLine('  ')
				GameTooltip:AddLine('Eng - '..RelicForgeSpells[self:GetParent().spellID], GetItemQualityColor(6))
			end
		end
		
		GameTooltip:Show()
		
		if _G.ArtifactRelicForgeFrame and _G.ArtifactRelicForgeFrame:IsShown() then 
			CrucibleWeight.HighLightBySpellID(self:GetParent().spellID)
		end
		
	--	print('T', 'spell:'..self:GetParent().spellID)
	end)
	f.mouseover:SetScript("OnLeave", function(self)		
		GameTooltip:Hide()
		CrucibleWeight.HighLightHide()
	end)
	
	f.ok = okbttm
	f.text = text
	
	return f
end

CrucibleWeight.gui = {}
CrucibleWeight.gui.Elements = {}

local VoidText = mainFrame:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	VoidText:SetPoint("CENTER", mainFrame, "TOP", -62 , -20)
	VoidText:SetJustifyH("CENTER")
	VoidText:SetSize(100, 20)
	VoidText:SetText('Void')

VoidText.background = mainFrame:CreateTexture()
	VoidText.background:SetSize(120, 240)
	VoidText.background:SetPoint('TOP', VoidText, 'BOTTOM', 0, -1)
	VoidText.background:SetColorTexture(80/255, 83/255, 150/255, 0.4)
	VoidText.background:SetDrawLayer('ARTWORK', 1)


local LightText = mainFrame:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	LightText:SetPoint("CENTER", mainFrame, "TOP", 62 , -20)
	LightText:SetJustifyH("CENTER")
	LightText:SetSize(100, 20)	
	LightText:SetText('Light')
	
LightText.background = mainFrame:CreateTexture()
	LightText.background:SetSize(120, 240)
	LightText.background:SetPoint('TOP', LightText, 'BOTTOM', 0, -1)
	LightText.background:SetColorTexture(1,0.7,0.5,0.4)
	LightText.background:SetDrawLayer('ARTWORK', 1)
	
for side in pairs(relicPercsPosition) do
	CrucibleWeight.gui.Elements[side] = {}
	
	for i=1, #relicPercsPosition[side] do
		local spellID = relicPercsPosition[side][i]
		
		CrucibleWeight.gui.Elements[side][i] = CrucibleWeight.CreateElement()
		CrucibleWeight.gui.Elements[side][i].id = i
		CrucibleWeight.gui.Elements[side][i].side = side
		CrucibleWeight.gui.Elements[side][i].text:SetWidth(110)
		if i ==  1 then
			CrucibleWeight.gui.Elements[side][i]:SetPoint('TOP', side == 'VOID' and VoidText or LightText, 'BOTTOM', 0, -20)
		else
			CrucibleWeight.gui.Elements[side][i]:SetPoint('TOP', CrucibleWeight.gui.Elements[side][i-1], 'BOTTOM', 0, -16)
		end
		
		CrucibleWeight.gui.Elements[side][i].spellID = spellID
		CrucibleWeight.gui.Elements[side][i].text:SetText(SpellString(spellID))
		CrucibleWeight.gui.Elements[side][i]:SetWidth(70)
		CrucibleWeight.gui.Elements[side][i]:Show()
		
		CrucibleWeight.gui.Elements[side][i]:SetScript('OnTabPressed', function(self)
		--	print('Tab pressed')
			
			local onClick = self:GetScript('OnEnterPressed')
			
			if onClick then
				onClick(self)
			end
			
			
			if CrucibleWeight.gui.Elements[side][ self.id+1 ] then 
				CrucibleWeight.gui.Elements[side][ self.id+1 ]:SetFocus()
			end
		end)
	
	end
end


local ArtifactText = mainFrame:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	ArtifactText:SetPoint("CENTER", mainFrame, "TOP", 0 , -280)
	ArtifactText:SetJustifyH("CENTER")
	ArtifactText:SetSize(100, 20)	
	ArtifactText:SetText('Artifact')
	
ArtifactText.background = mainFrame:CreateTexture()
	ArtifactText.background:SetSize(220, 220)
	ArtifactText.background:SetPoint('TOP', ArtifactText, 'BOTTOM', 0, -1)
	ArtifactText.background:SetColorTexture(basicColor[1],basicColor[2],basicColor[3],0.4)
	ArtifactText.background:SetDrawLayer('ARTWORK', 1)
	
CrucibleWeight.gui.Elements['ARTIFACT'] = {}

for i=1, 10 do
	
	CrucibleWeight.gui.Elements['ARTIFACT'][i] = CrucibleWeight.CreateElement()
	CrucibleWeight.gui.Elements['ARTIFACT'][i].id = i
	CrucibleWeight.gui.Elements['ARTIFACT'][i]:SetWidth(70)
	CrucibleWeight.gui.Elements['ARTIFACT'][i].text:SetWidth(105)
		
	CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore = CreateFrame("Button", nil, CrucibleWeight.gui.Elements['ARTIFACT'][i], "UIPanelButtonTemplate")
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:SetFrameLevel(CrucibleWeight.gui.Elements['ARTIFACT'][i]:GetFrameLevel()+1)
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:SetSize(16,16)
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:SetPoint("LEFT", CrucibleWeight.gui.Elements['ARTIFACT'][i], "RIGHT", 3, 0)
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:Show()

		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
	--		print(self:GetParent(), self:GetParent().spellID)
			
			CrucibleWeight.DetailedPercValue(self:GetParent(), self:GetParent().spellID)
		end)
		
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text = CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text:SetPoint("CENTER", CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore, "CENTER", 0 , 0)
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text:SetTextColor(1, 0.8, 0)
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text:SetText("+")
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text:SetJustifyH("CENTER")
		CrucibleWeight.gui.Elements['ARTIFACT'][i].addMore.text:SetWordWrap(false)
	
	CrucibleWeight.gui.Elements['ARTIFACT'][i]:SetScript('OnTabPressed', function(self)
	--	print('Tab pressed')
		
		local onClick = self:GetScript('OnEnterPressed')
		
		if onClick then
			onClick(self)
		end
		
		
		if CrucibleWeight.gui.Elements['ARTIFACT'][ self.id+1 ] then 
			CrucibleWeight.gui.Elements['ARTIFACT'][ self.id+1 ]:SetFocus()
		end
	end)
	
	
	if i==1 then
		CrucibleWeight.gui.Elements['ARTIFACT'][i]:SetPoint('TOP', ArtifactText, 'BOTTOM', -55, -20)
	elseif i == 6 then
		CrucibleWeight.gui.Elements['ARTIFACT'][i]:SetPoint('TOP', ArtifactText, 'BOTTOM', 55, -20)
	else
		CrucibleWeight.gui.Elements['ARTIFACT'][i]:SetPoint('TOP', CrucibleWeight.gui.Elements['ARTIFACT'][i-1], 'BOTTOM', 0, -15)
	end
end
	
CrucibleWeight.gui.ItemLevel = CrucibleWeight.CreateElement()
CrucibleWeight.gui.ItemLevel:SetWidth(70)
CrucibleWeight.gui.ItemLevel.spellID = ILVL_TAG
CrucibleWeight.gui.ItemLevel.text:SetText('+1 weapon iLvL')
CrucibleWeight.gui.ItemLevel.text:SetWidth(0)
CrucibleWeight.gui.ItemLevel.text:ClearAllPoints()
CrucibleWeight.gui.ItemLevel.text:SetPoint('BOTTOM', CrucibleWeight.gui.ItemLevel, 'TOP', 0, 2)
CrucibleWeight.gui.ItemLevel:SetPoint('TOP', ArtifactText, 'BOTTOM', 0, -195)
	
function CrucibleWeight.UpdateArtifactGUIElements()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo();
	
	local index = 1
	if ShiGuangDB.CrucibleWeightArtifacts[itemID] then
		for powerID, spellID in pairs( ShiGuangDB.CrucibleWeightArtifacts[itemID] ) do
			
			CrucibleWeight.gui.Elements['ARTIFACT'][index].text:SetText(SpellString(spellID))
			CrucibleWeight.gui.Elements['ARTIFACT'][index].spellID = spellID
			CrucibleWeight.gui.Elements['ARTIFACT'][index]:SetText(CrucibleWeight.GetValue(spellID) or '')
			
			index = index + 1
		end
	end
end

CrucibleWeight.talentElement = {}
function CrucibleWeight.CreaetTalentElement(parent, index)
	local f = CreateFrame('Frame', nil,  parent)
	f:SetSize(30, 20)
	f:SetPoint('TOP', parent, 'BOTTOM', 0, -10)
	f.id = index
	
	f.texture = f:CreateTexture()
	f.texture:SetAllPoints()
	f.texture:SetColorTexture(basicColor[1],basicColor[2],basicColor[3],0.4)
	f.texture:SetDrawLayer('OVERLAY', 1)
	
	f.text = f:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	f.text:SetPoint("CENTER", f, "CENTER", 0 , 0)
	f.text:SetJustifyH("CENTER")
	f.text:SetText('0')
	
	f.highlight = f:CreateTexture()
	f.highlight:SetSize(70,70)
	f.highlight:SetPoint('CENTER',parent,'CENTER')
	f.highlight:SetColorTexture(1,1,1,0.2)
	f.highlight:SetDrawLayer('OVERLAY', 1)
	f.highlight:Hide()
	
	return f
end


CrucibleWeight.gui.RelicItemLevels = {}

function CrucibleWeight.HighLightBySpellID(spellID2)
	CrucibleWeight.HighLightHide()
	
	for i=1, #CrucibleWeight.talentElement do
		local button = CrucibleWeight.talentElement[i]:GetParent()
		local spellID = C_ArtifactUI.GetPowerInfo(button.powerID).spellID
		
		if spellID == spellID2 then
			CrucibleWeight.talentElement[i].highlight:Show()
		end
	end	
end

function CrucibleWeight.HighLightHide()
	for i=1, #CrucibleWeight.talentElement do		
		CrucibleWeight.talentElement[i].highlight:Hide()
	end	
end

do
	
	
	
	function CrucibleWeight.ShowIconSelectFrame()

	
	end
	
	function CrucibleWeight.HideIconSelectFrame()
	
	end
end

do
	local width = 400
	
	local editBox
	local fsting
	local hide
	local frame = CreateFrame("Frame", nil, UIParent)

	frame:SetBackdrop({
			bgFile = [[Interface\Buttons\WHITE8x8]],
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 1,
			insets = {left = 0, right = 0, top = 0, bottom =0}
		})
	frame:SetBackdropColor(0 , 0 , 0 , 0.7) --цвет фона
	frame:SetBackdropBorderColor(0 , 0 , 0 , 1) --цвет фона
	
	frame:SetSize(width, 40)
	frame:SetPoint("CENTER", UIParent, "CENTER")
	frame:SetFrameStrata("DIALOG")
	frame:Hide()

	local import = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
		import:SetFrameLevel(frame:GetFrameLevel()+1)
		import:SetSize(60,20)
		import:Show()

		import:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
			CrucibleWeight.GetImportString(editBox:GetText())
			frame:Hide()
		end)

	import.text = import:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	import.text:SetPoint("CENTER", import, "CENTER", 0 , 0)
	import.text:SetTextColor(1, 0.8, 0)
	import.text:SetText("import")
	import.text:SetJustifyH("CENTER")
	import.text:SetWordWrap(false)
	
	local renamePreset = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
		renamePreset:SetFrameLevel(frame:GetFrameLevel()+1)
		renamePreset:SetSize(60,20)
		renamePreset:Show()

		renamePreset:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
	
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
			CrucibleWeight.profile.presets[itemID][self.id].name = editBox:GetText()

			frame:Hide()
		end)

	renamePreset.text = renamePreset:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	renamePreset.text:SetPoint("CENTER", renamePreset, "CENTER", 0 , 0)
	renamePreset.text:SetTextColor(1, 0.8, 0)
	renamePreset.text:SetText("rename")
	renamePreset.text:SetJustifyH("CENTER")
	renamePreset.text:SetWordWrap(false)
	
	local seticonPreset = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
		seticonPreset:SetFrameLevel(frame:GetFrameLevel()+1)
		seticonPreset:SetSize(70,20)
		seticonPreset:Show()

		seticonPreset:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
	
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
		--	Crucibleweight.profile.presets[itemID][self.id].name = editBox:GetText()
			
			if editBox:GetText() and editBox:GetText() ~= '' then
				if tonumber(editBox:GetText()) then
					Crucibleweight.profile.presets[itemID][self.id].icon = tonumber(editBox:GetText())
				else 
					Crucibleweight.profile.presets[itemID][self.id].icon = editBox:GetText():gsub('\\\\', '\\')
				end
			else
				Crucibleweight.profile.presets[itemID][self.id].icon = nil
			end
			
			
			frame:Hide()
			Crucibleweight.UpdatePresetSelection()
		end)

	seticonPreset.text = seticonPreset:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	seticonPreset.text:SetPoint("CENTER", seticonPreset, "CENTER", 0 , 0)
	seticonPreset.text:SetTextColor(1, 0.8, 0)
	seticonPreset.text:SetText("set icon")
	seticonPreset.text:SetJustifyH("CENTER")
	seticonPreset.text:SetWordWrap(false)
	
	
	editBox = CreateFrame("EditBox", nil, frame)
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetSize(width-120, 40)
	editBox:SetPoint("LEFT", frame, "LEFT", 10, 0)
	
	hide = function(f) f:GetParent():Hide() end
	
	editBox:SetScript("OnEscapePressed", hide)
	editBox:SetScript('OnTextChanged', function(self, userInput)
		if userInput then
			if self.lastText then				
				self:SetText(self.lastText)
			else
				local text = self:GetText()

				if text:find('cruweight') then
					import:Show()
				else
					import:Hide()
				end
			end
		end
		
		if self:GetText() and self:GetText():len()>0 then
			fsting:Hide()
		elseif fsting.placeholder then
			fsting:Show()
		end
	end)
	
	fsting = editBox:CreateFontString()
	fsting:SetFontObject(ChatFontNormal)
	fsting:SetFont(STANDARD_TEXT_FONT, 12, 'NONE')
	fsting:SetPoint("LEFT", editBox, "LEFT", 5, 0)
	fsting:SetTextColor(0.5,0.5,0.5)
	fsting:SetText('PLACEHOLDER TEXT')
	fsting.placeholder = nil
	fsting:SetJustifyH('LEFT')
	fsting:Hide()
	
	local close_ = CreateFrame("Button", nil, frame)
	close_:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	close_:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	close_:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
	close_:SetSize(32, 32)
	close_:SetPoint("RIGHT", frame, "RIGHT", -5, 0)
	close_:SetScript("OnClick", hide)
	
	import:SetPoint("RIGHT", close_, "LEFT", -5, 0)
	renamePreset:SetPoint("RIGHT", close_, "LEFT", -5, 0)
	seticonPreset:SetPoint("RIGHT", close_, "LEFT", -5, 0)
	--[[ End popup creation ]]--
	
	-- Avoiding StaticPopup taints by making our own popup, rather that adding to the StaticPopup list
	function CrucibleWeight:Popup(type, id)
	
		if type == 'export' then
			local text = CrucibleWeight.BuildExportString()
			if text then
				frame:SetSize(width, 40)
				editBox:SetSize(width-120, 40)
				editBox:SetMultiLine(false)
				
				editBox.lastText = text
				editBox:SetText(text)
				editBox:HighlightText(0)
				editBox:GetParent():Show()
				import:Hide()
				renamePreset:Hide()
				seticonPreset:Hide()
			end
			
			fsting.placeholder = nil
			fsting:Hide()
			
			CrucibleWeight.HideIconSelectFrame()
		elseif type == 'simc' then
			local text = ''
			
			--[==[
			
				copy=copy1,Base
				crucible=1739:3:1770:3:767:3
			]==]
			
			frame:SetSize(width, 120)
			editBox:SetSize(width-120, 120)
			editBox:SetMultiLine(true)
			
			editBox.lastText = [[
				test
				test
				test
				test
				test
			]]
			
			editBox:SetText([[
				test
				test
				test
				test
				test
			]])
			editBox:HighlightText(0)
			editBox:GetParent():Show()
			import:Hide()
			renamePreset:Hide()
			seticonPreset:Hide()
			
			fsting.placeholder = nil
			fsting:Hide()
			
			CrucibleWeight.HideIconSelectFrame()
		elseif type == 'rename' then
			frame:SetSize(width, 40)
			editBox:SetSize(width-120, 40)
			editBox:SetMultiLine(false)
			
			editBox.lastText = nil
			editBox:SetText('')
			import:Hide()
			renamePreset:Show()
			renamePreset.id = id
			editBox:GetParent():Show()
			seticonPreset:Hide()
			
			fsting.placeholder = nil
			fsting:Hide()
			
			CrucibleWeight.HideIconSelectFrame()
		elseif type == 'seticon' then
			frame:SetSize(width, 40)
			editBox:SetSize(width-120, 40)
			editBox:SetMultiLine(false)
			
			editBox.lastText = nil
			editBox:SetText('')
			import:Hide()
			renamePreset:Hide()
			editBox:GetParent():Show()
			seticonPreset:Show()
			seticonPreset.id = id
			
			fsting.placeholder = 'Put icon ID or path'
			fsting:SetText(fsting.placeholder)
			fsting:Show()
	
			CrucibleWeight.ShowIconSelectFrame()
		else
			frame:SetSize(width, 40)
			editBox:SetSize(width-120, 40)
			editBox:SetMultiLine(false)
			
			editBox.lastText = nil
			editBox:SetText('')
			import:Hide()
			renamePreset:Hide()
			seticonPreset:Hide()
			editBox:GetParent():Show()
			
			fsting.placeholder = nil
			fsting:Hide()
			
			CrucibleWeight.HideIconSelectFrame()
		end
	end
end

function CrucibleWeight.BuildExportString()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	local index, code = CrucibleWeight.GetSelectedPreset()
	
	local text = nil
	
	if itemID and code then		
		text = 'cruweight^'..itemID
		
		for arg, value in pairs(code) do
			
			text = text..'^'..arg..'^'..value
		end
		
		text = text..'^end'
	end
	
	return text
end

function CrucibleWeight.GetImportString(text)

	if text then
	
		local info = { strsplit('^', text) }
		
		local tag = info[1]
		local artifactID = info[2] and tonumber(info[2])
		
		local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
		
		if itemID ~= artifactID then
			print('[CruWe] You cant import this artifact string')
			return
		end
		
		CrucibleWeight.profile[artifactID] = {}
			
		local index, code = CrucibleWeight.GetSelectedPreset()
	
	
		for i=3, #info, 2 do
			if info[i] and info[i+1] then
				if info[i] == 'end' then
				
				elseif info[i] == ILVL_TAG then
					local arg = info[i]
					local value = tonumber(info[i+1]) 
					
					code[arg] = value
				else
					local arg = tonumber(info[i]) 
					local value = info[i+1]
					
					code[arg] = value
				end		
			end
		end
	end
	
	CrucibleWeight.UpdateValues()
end

local detailFrame = CreateFrame('Frame', nil, _G.UIParent)
detailFrame:SetSize(200, 130)
detailFrame:Show()
detailFrame:EnableMouse(true)
detailFrame:SetFrameStrata('TOOLTIP')
detailFrame.border = detailFrame:CreateTexture()
detailFrame.border:SetAllPoints()
detailFrame.border:SetColorTexture(0,0,0,1)
detailFrame.border:SetDrawLayer('BORDER')

detailFrame.background = detailFrame:CreateTexture()
detailFrame.background:SetPoint('TOPLEFT', detailFrame, 'TOPLEFT', 1, -1)
detailFrame.background:SetPoint('BOTTOMRIGHT', detailFrame, 'BOTTOMRIGHT', -1, 1)
detailFrame.background:SetColorTexture(0.3,0.3,0.3,1)
detailFrame.background:SetDrawLayer('ARTWORK')

detailFrame.apply = CreateFrame("Button", nil, detailFrame, "UIPanelButtonTemplate")
	detailFrame.apply:SetFrameLevel(detailFrame:GetFrameLevel()+1)
	detailFrame.apply:SetSize(60,20)
	detailFrame.apply:SetPoint("BOTTOM", detailFrame, "BOTTOM", -40, 3)
	detailFrame.apply:Show()

	detailFrame.apply:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		detailFrame:Hide()
		
		CrucibleWeight.DetailedConfirmAndSave()
	end)
	
	detailFrame.apply.text = detailFrame.apply:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	detailFrame.apply.text:SetPoint("CENTER", detailFrame.apply, "CENTER", 0 , 0)
	detailFrame.apply.text:SetTextColor(1, 0.8, 0)
	detailFrame.apply.text:SetText("apply")
	detailFrame.apply.text:SetJustifyH("CENTER")
	detailFrame.apply.text:SetWordWrap(false)

detailFrame.cancel = CreateFrame("Button", nil, detailFrame, "UIPanelButtonTemplate")
	detailFrame.cancel:SetFrameLevel(detailFrame:GetFrameLevel()+1)
	detailFrame.cancel:SetSize(60,20)
	detailFrame.cancel:SetPoint("BOTTOM", detailFrame, "BOTTOM", 40, 3)
	detailFrame.cancel:Show()

	detailFrame.cancel:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		detailFrame:Hide()
		
		CrucibleWeight.DetailerResetValues()
	end)
	
	detailFrame.cancel.text = detailFrame.cancel:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	detailFrame.cancel.text:SetPoint("CENTER", detailFrame.cancel, "CENTER", 0 , 0)
	detailFrame.cancel.text:SetTextColor(1, 0.8, 0)
	detailFrame.cancel.text:SetText("cancel")
	detailFrame.cancel.text:SetJustifyH("CENTER")
	detailFrame.cancel.text:SetWordWrap(false)	
	
function CrucibleWeight.CreateDetailElement()
	local f = CreateFrame("EditBox", nil, detailFrame)
	f:SetFontObject('ChatFontNormal')
	f:SetFrameLevel(detailFrame:GetFrameLevel() + 1)
	f:SetAutoFocus(false)
	f:SetWidth(160)
	f:SetHeight(20)
	f:SetBackdrop({
			bgFile = [[Interface\Buttons\WHITE8x8]],
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 1,
			insets = {top = 0, left = 0, bottom = 0, right = 0},
				})
	f:SetBackdropColor(0, 0, 0, 0.2)
	f:SetBackdropBorderColor(0,0,0,1)
		
	f:SetScript("OnEscapePressed", function(self)
		self:ClearFocus()
		self.ok:Hide()
		self:SetText(self.defaultValue or '')
	end)
	f:SetScript('OnEnterPressed', function(self)
		self:ClearFocus()
		self.ok:Hide()
		
		local value = tonumber(self:GetText() or '')
		
		if value then			
			self:SetText(value)
			self.defaultValue = value
		else
			self:SetText(self.defaultValue or '')
		end
	end)
	
	local text = f:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	text:SetPoint("RIGHT", f, "LEFT", -3 , 0)
	text:SetJustifyH("LEFT")
	text:SetWordWrap(false)
	
	local okbttm = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
	okbttm:SetFrameLevel(f:GetFrameLevel()+1)
	okbttm:SetSize(30,20)
	okbttm:SetPoint("RIGHT", f, "RIGHT", 0, 0)
	okbttm:Hide()

	okbttm:SetScript("OnClick", function(self)
		PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or "igMainMenuOptionCheckBoxOn")
		self:GetParent():ClearFocus()
		self:Hide()
		
		local value = tonumber(self:GetParent():GetText() or '')
		
		if value then			
			self:GetParent():SetText(value)
			self:GetParent().defaultValue = value
		else
			self:GetParent():SetText(self:GetParent().defaultValue or '')
		end
	end)
	
	okbttm.text = okbttm:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
	okbttm.text:SetPoint("CENTER", okbttm, "CENTER", 0 , 0)
	okbttm.text:SetTextColor(1, 0.8, 0)
	okbttm.text:SetText("OK")
	okbttm.text:SetJustifyH("CENTER")
	okbttm.text:SetWordWrap(false)
	
	f:SetScript("OnTextChanged", function(self, userInput)	
		if userInput then
			self.ok:Show()
		end
	end)
	
	
	f.ok = okbttm
	f.text = text
	
	return f

end

CrucibleWeight.gui.detailFrameElements = {}
for i=1, 7 do
	CrucibleWeight.gui.detailFrameElements[i] = CrucibleWeight.CreateDetailElement()
	CrucibleWeight.gui.detailFrameElements[i].id = i
	CrucibleWeight.gui.detailFrameElements[i].text:SetText('R'..(i))
	CrucibleWeight.gui.detailFrameElements[i]:SetWidth(120)
	
	CrucibleWeight.gui.detailFrameElements[i]:SetScript('OnTabPressed', function(self)
	--	print('Tab pressed')
		
		local onClick = self:GetScript('OnEnterPressed')
		
		if onClick then
			onClick(self)
		end
		
		
		if CrucibleWeight.gui.detailFrameElements[ self.id+1 ] then 
			CrucibleWeight.gui.detailFrameElements[ self.id+1 ]:SetFocus()
		end
	end)
	
	
	if i == 1 then
		CrucibleWeight.gui.detailFrameElements[i]:SetPoint('TOP', detailFrame,'TOP', 0, -10)
	else
		CrucibleWeight.gui.detailFrameElements[i]:SetPoint('TOP', CrucibleWeight.gui.detailFrameElements[i-1],'BOTTOM', 0, -10)
	end
	
	detailFrame:SetSize(160, 30+(30*i))
end

function CrucibleWeight.DetailedPercValue(editBox, spellID)
	
	CrucibleWeight.UnfocusAllEditBox()
	CrucibleWeight.HideDropdowns()

	detailFrame:SetFrameLevel(detailFrame:GetFrameLevel()+5)
	detailFrame.editBox = editBox
	detailFrame.spellID = spellID
	detailFrame:SetPoint('BOTTOMLEFT', editBox, 'TOPRIGHT', 10, 5)
	detailFrame:Show()
	
	for i=1, #CrucibleWeight.gui.detailFrameElements do		
		CrucibleWeight.gui.detailFrameElements[i].spellID = spellID
		CrucibleWeight.gui.detailFrameElements[i].editBox = editBox
		
		CrucibleWeight.gui.detailFrameElements[i].defaultValue = CrucibleWeight.UnpackValue(CrucibleWeight.GetValue(spellID), i) or ''
		
		CrucibleWeight.gui.detailFrameElements[i]:SetText(CrucibleWeight.gui.detailFrameElements[i].defaultValue)
	end
end

function CrucibleWeight.DetailerResetValues()
	
	detailFrame.editBox = nil
	detailFrame.spellID = nil
	
	for i=1, #CrucibleWeight.gui.detailFrameElements do	
		CrucibleWeight.gui.detailFrameElements[i].spellID = nil
		CrucibleWeight.gui.detailFrameElements[i].editBox = nil
		CrucibleWeight.gui.detailFrameElements[i].defaultValue = nil	
	end
end

function CrucibleWeight.DetailedConfirmAndSave()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	local percs = {}
	for i=1, #CrucibleWeight.gui.detailFrameElements do	
		
		if CrucibleWeight.gui.detailFrameElements[i].defaultValue and
			CrucibleWeight.gui.detailFrameElements[i].defaultValue ~= '' then
			
			percs[i] = CrucibleWeight.gui.detailFrameElements[i].defaultValue
		end
	end
	
	local spellID = detailFrame.spellID
	
	local str = CrucibleWeight.PackValues(percs, spellID)
	
	local index, code = CrucibleWeight.GetSelectedPreset()
	
	code[spellID] = str
	
	detailFrame.editBox:SetText(str)
			
--	print('DetailedConfirmAndSave', str)
	CrucibleWeight.UpdateValues()
	CrucibleWeight.DetailerResetValues()
end

CrucibleWeight.gui.checkBoxes = {}

function CrucibleWeight.CreateCheckBox(parent, index)
	local button = CreateFrame('CheckButton', nil, parent, "UICheckButtonTemplate") --"UICheckButtonTemplate"
	button.id = index
	button:SetFrameLevel(parent:GetFrameLevel() + 1)
	button:SetSize(22, 22)
	button:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	button:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	button:SetChecked(false)
	button.status = false
	button:Hide()
	button:SetScript("OnEnter", function(self)	
		
	end)
	button:SetScript("OnLeave", function(self)
		
	end)

	button:SetScript("OnClick", function(self)
		self.status = not self.status
		
		CrucibleWeight.UpdateCheckBoxStatus( self.status and self.id or 0)
		CrucibleWeight.UpdatePreviewRelicValueBySelection()
		CrucibleWeight:BuildaRelicData()
	end)
	
	return button
end

function CrucibleWeight.UpdateCheckBoxStatus(checked)
	for i=1, #CrucibleWeight.gui.checkBoxes do
		if i == checked then
			CrucibleWeight.gui.checkBoxes[i]:SetChecked(true)
			CrucibleWeight.gui.checkBoxes[i].status = true
		else
			CrucibleWeight.gui.checkBoxes[i]:SetChecked(false)
			CrucibleWeight.gui.checkBoxes[i].status = false
		end
	end
end

local prevToggleCheckBox = nil
function CrucibleWeight.ToggleCheckBox(enable)
	if prevToggleCheckBox ~= enable then
		-- Reset checkboxes
		
		prevToggleCheckBox = enable
		CrucibleWeight.UpdateCheckBoxStatus(0)
	end

	for i=1, #CrucibleWeight.gui.checkBoxes do
		if enable then			
			if CrucibleWeight.TotalRelicValue[i] and CrucibleWeight.TotalRelicValue[4] and CrucibleWeight.TotalRelicValue[i][-2] == CrucibleWeight.TotalRelicValue[4][-2] then
				CrucibleWeight.gui.checkBoxes[i]:Show()
			else
				CrucibleWeight.gui.checkBoxes[i]:Hide()
				CrucibleWeight.gui.checkBoxes[i].status = false
			end
		else
			CrucibleWeight.gui.checkBoxes[i]:Hide()
			CrucibleWeight.gui.checkBoxes[i].status = false
		end
	end
	
	CrucibleWeight.UpdatePreviewRelicValueBySelection()
	CrucibleWeight:BuildaRelicData()
end

local simcExport = {}
function CrucibleWeight.GetSimcExport()
	
	for i=1, 4 do
	
		local talents = i == 4 and C_ArtifactRelicForgeUI.GetPreviewRelicTalents() or C_ArtifactRelicForgeUI.GetSocketedRelicTalents(i)
		
		if ( talents ) then
		
			--[==[
			2 + 4
			2 + 5
			3 + 5
			3 + 6
			]==]
			
			for slot, data in pairs(talents) do
				if slot == 1 then

				else
					-- data.powerID
				
				end
			end
		end
	end
end

function CrucibleWeight.ShowGUI()

	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	if not itemID then 
		return
	end
	
	CrucibleWeight.PreparePresets()
	
	-- /run CrucibleWeight.ShowGUI()
	if _G.ArtifactRelicForgeFrame and _G.ArtifactRelicForgeFrame:IsShown() then
	
		CrucibleWeight.mainFrame.toggleByCommand = false
		
		CrucibleWeight.mainFrame:SetParent(_G.ArtifactRelicForgeFrame)
		
		CrucibleWeight.mainFrame.close:Hide()
		CrucibleWeight.mainFrame.toggle:Show()
	--	CrucibleWeight.mainFrame.import:Show()
		
		CrucibleWeight.mainFrame:SetMovable(false)
		
		CrucibleWeight.mainFrame:SetSlide(false)
		
		CrucibleWeight.UpdateArtifactGUIElements()
		CrucibleWeight.UpdateValues()
	else
		toggled = false
		
		CrucibleWeight.mainFrame:SetMovable(true)
		
		CrucibleWeight.mainFrame.toggleByCommand = true
		
		CrucibleWeight.mainFrame:SetParent(UIParent)
		CrucibleWeight.mainFrame:SetFrameStrata('HIGH')
		CrucibleWeight.mainFrame:ClearAllPoints()
		CrucibleWeight.mainFrame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
		CrucibleWeight.mainFrame:Show()
		CrucibleWeight.mainFrame.close:Show()
		CrucibleWeight.mainFrame.toggle:Hide()
	--	CrucibleWeight.mainFrame.import:Hide()
		
		CrucibleWeight.UpdateArtifactGUIElements()
		CrucibleWeight.UpdateValues()
	end
	
	CrucibleWeight.UpdatePresetSelection()
end

SLASH_CRUCIBLEWEIGHT1 = cmd1
SLASH_CRUCIBLEWEIGHT2 = cmd2

SlashCmdList["CRUCIBLEWEIGHT"] = CrucibleWeight.ShowGUI
--[==[
hooksecurefunc('DressUpItemLink', function(link)
	print(link, link and link:gsub('|', '||'))
end)
]==]


-- initFrame

CrucibleWeight.mainFrame.SetSlide = function(self, status)
	if status then
		self:SetParent(_G.ArtifactRelicForgeFrame)
		self:SetFrameStrata('HIGH')
		self:ClearAllPoints()
		self:SetPoint('TOPLEFT', _G.ArtifactRelicForgeFrame, 'TOPRIGHT', 20, 0)			
		
		self.toggle.text:SetText("<\n<\n<\n<\n<\n<")
	else
		self:SetParent(_G.ArtifactRelicForgeFrame)
		self:SetFrameStrata('LOW')
		self:ClearAllPoints()
		self:SetPoint('TOPLEFT', _G.ArtifactRelicForgeFrame, 'TOPRIGHT', 20 - 300, 0)	
		
		self.toggle.text:SetText(">\n>\n>\n>\n>\n>")
	end

	toggled = status
end

function CrucibleWeight.ToggleMainFrame()

	CrucibleWeight.mainFrame:SetSlide(not toggled)
	
	
	CrucibleWeight.UnfocusAllEditBox()
	CrucibleWeight.HideDropdowns()
end

CrucibleWeight.gui.presetButtons = {}

function CrucibleWeight.CreatePresetButton()
	local f = CreateFrame('Button', nil, CrucibleWeight.mainFrame)
	f:SetSize(50, 50)
	f:SetPoint('TOPLEFT', CrucibleWeight.mainFrame, 'TOPRIGHT', 0, 0)
	f:RegisterForClicks('AnyUp')
	f:SetScript("OnClick", function(self, button)
		if button == 'LeftButton' then
			if self.type == 'selection' then
				CrucibleWeight.SetPresetSelected(self.id)
			
				CrucibleWeight.UnfocusAllEditBox()
				CrucibleWeight.HideDropdowns()
			elseif self.type == 'addnew' then
			--	print('Add new')
				CrucibleWeight.AddNewPreset()
				
				
				CrucibleWeight.UnfocusAllEditBox()
				CrucibleWeight.HideDropdowns()
			end
		elseif button == 'RightButton' then
			if self.type == 'selection' then
				CrucibleWeight.BuidDropDown(self)
			elseif self.type == 'addnew' then
				
			end
		end
	end)
	
	f:SetScript('OnEnter', function(self)
		local name = 'Default'
		
		if self.type == 'selection' then
			local itemID = C_ArtifactUI.GetEquippedArtifactInfo()		
			name = CrucibleWeight.profile.presets[itemID][self.id].name or name
		else
			name = 'Add new'
		end
		
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")			
		GameTooltip:ClearLines()	
		GameTooltip:SetText(name, 1, .82, 0, true)
		GameTooltip:Show()
	end)
	f:SetScript('OnLeave', function(self)
		GameTooltip:Hide()
	end)
	
	f.border = f:CreateTexture()
	f.border:SetAllPoints()
	f.border:SetColorTexture(0,0,0,1)
	f.border:SetDrawLayer('BORDER')

	f.background = f:CreateTexture()
	f.background:SetPoint('TOPLEFT', f, 'TOPLEFT', 1, -1)
	f.background:SetPoint('BOTTOMRIGHT', f, 'BOTTOMRIGHT', -1, 1)
	f.background:SetColorTexture(0.1,0.1,0.1,1)
	f.background:SetDrawLayer('ARTWORK')

	f.icon = f:CreateTexture()
	f.icon:SetPoint('TOPRIGHT', f, 'TOPRIGHT', -5, -5)
	f.icon:SetSize(40, 40)
	f.icon:SetDrawLayer('OVERLAY')
	f.icon:SetColorTexture(1, 0, 0, 1)
	f.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
	
	return f
end

for i=1, 9 do
	CrucibleWeight.gui.presetButtons[i] = CrucibleWeight.CreatePresetButton()
	CrucibleWeight.gui.presetButtons[i].id = i
	CrucibleWeight.gui.presetButtons[i]:SetPoint('TOPLEFT', CrucibleWeight.mainFrame, 'TOPRIGHT', 0, -10 -55*(i-1))
end

function CrucibleWeight.UpdatePresetSelection()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	
	for i=1, #CrucibleWeight.gui.presetButtons do
		CrucibleWeight.gui.presetButtons[i]:Hide()
	end
	
	
	local showAddNew = #CrucibleWeight.profile.presets[itemID] <#CrucibleWeight.gui.presetButtons
	
	for i=1, #CrucibleWeight.profile.presets[itemID] do
		if CrucibleWeight.profile.presets[itemID][i].selected then
			CrucibleWeight.gui.presetButtons[i]:SetSize(60, 50)
			CrucibleWeight.gui.presetButtons[i].background:SetColorTexture(0.1, 0.3, 0.1, 1)
			CrucibleWeight.gui.presetButtons[i].icon:SetDesaturated(false)
		else
			CrucibleWeight.gui.presetButtons[i]:SetSize(50, 50)
			CrucibleWeight.gui.presetButtons[i].background:SetColorTexture(0.1, 0.1, 0.1, 1)
			CrucibleWeight.gui.presetButtons[i].icon:SetDesaturated(true)
		end
		
		CrucibleWeight.gui.presetButtons[i].type = 'selection'
		CrucibleWeight.gui.presetButtons[i]:Show()
		CrucibleWeight.gui.presetButtons[i].icon:SetTexture(CrucibleWeight.profile.presets[itemID][i].icon or 'Interface\\Icons\\Inv_misc_questionmark')
	end
	
	if showAddNew then
		--[==[
		local index = #CrucibleWeight.profile.presets[itemID]+1
		
		CrucibleWeight.gui.presetButtons[index].type = 'addnew'
		CrucibleWeight.gui.presetButtons[index]:SetSize(50, 50)
		CrucibleWeight.gui.presetButtons[index]:Show()
		CrucibleWeight.gui.presetButtons[index].icon:SetTexture(135769)
		CrucibleWeight.gui.presetButtons[index].background:SetColorTexture(0.5, 0.5, 0.1, 1)
		]==]
		
		CrucibleWeight.mainFrame.addnew:Show()
	else
		CrucibleWeight.mainFrame.addnew:Hide()
	end
end

function CrucibleWeight.SetPresetSelected(id)
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	
	for i=1, #CrucibleWeight.profile.presets[itemID] do
		if i==id then
			CrucibleWeight.profile.presets[itemID][i].selected = true
			
			CrucibleWeight.profile[itemID] = {}
		else
			CrucibleWeight.profile.presets[itemID][i].selected = false
		end
	end
	
	CrucibleWeight.UpdateValues()
	
	CrucibleWeight.UpdatePresetSelection()
end

function CrucibleWeight.AddNewPreset()
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()
	
	local index = #CrucibleWeight.profile.presets[itemID]+1
	
	CrucibleWeight.profile.presets[itemID][index] = {
		name = 'Preset #'..index,
		code = {},
		selected = false,
	}
	
	CrucibleWeight.SetPresetSelected(index)
	
	if localDB[itemID] then
		CrucibleWeight.GetImportString(localDB[itemID])
	end
	
	CrucibleWeight.UpdatePresetSelection()
end

function CrucibleWeight.RemovePreset(id)
	local itemID = C_ArtifactUI.GetEquippedArtifactInfo()

	if #CrucibleWeight.profile.presets[itemID] > 1 then		
		local removed = table.remove(CrucibleWeight.profile.presets[itemID], id)
		
		if removed.selected then
			CrucibleWeight.SetPresetSelected(1)
		end
	end
	
	CrucibleWeight.UpdateValues()
	
	CrucibleWeight.UpdatePresetSelection()
end

do
	local menu = {
		{ 
			"Rename",
			function(self)
				local owner = self:GetParent().owner
				
				CrucibleWeight:Popup('rename', owner.id)
			end,
		},
		{ "Set icon",
			function(self)
				local owner = self:GetParent().owner
				
				CrucibleWeight:Popup('seticon', owner.id)
			end, },
		{ 
			"|cFFFF0000Delete|r", 
			function(self)
				local owner = self:GetParent().owner
				
				CrucibleWeight.RemovePreset(owner.id)
			end
		},
	}
	
	local frame = CreateFrame('Frame', nil, UIParent)
	frame:SetFrameStrata('TOOLTIP')
	frame:SetSize(200, 20)
	frame:SetBackdrop({
			bgFile = [[Interface\Buttons\WHITE8x8]],
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 1,
			insets = {left = 0, right = 0, top = 0, bottom =0}
		})
	frame:SetBackdropColor(0 , 0 , 0 , 0.8) --цвет фона
	frame:SetBackdropBorderColor(0 , 0 , 0 , 1) --цвет фона
	frame.buttons = {}
	
	frame.cancel = CreateFrame('Button', nil, frame)
	frame.cancel:SetSize(20,20)
	frame.cancel:EnableMouse(true)
	frame.cancel:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', -2,3)
	frame.cancel:SetPoint('BOTTOMLEFT', frame, 'BOTTOMLEFT', 2,3)
	frame.cancel:SetScript('OnClick', function(self)	
		frame:Hide()
	end)
	frame.cancel.text = frame.cancel:CreateFontString()
	frame.cancel.text:SetFont(STANDARD_TEXT_FONT, 12)
	frame.cancel.text:SetPoint('LEFT', frame.cancel, 'LEFT', 2, 0)
	frame.cancel.text:SetText('Cancel')
	frame.cancel.bg = frame.cancel:CreateTexture()
	frame.cancel.bg:SetPoint('TOPLEFT', frame.cancel, 'TOPLEFT', 0, 0)
	frame.cancel.bg:SetPoint('BOTTOMRIGHT', frame.cancel, 'BOTTOMRIGHT', 0, 0)
	frame.cancel.bg:SetColorTexture(1,1,1,0.3)
	frame.cancel.bg:Hide()
	frame.cancel:SetScript('OnEnter', function(self)
		self.bg:Show()
	end)
	frame.cancel:SetScript('OnLeave', function(self)
		self.bg:Hide()
	end)

	function CrucibleWeight.BuidDropDown(owner)
		local size = 3
		
		
		CrucibleWeight.UnfocusAllEditBox()
		CrucibleWeight.HideDropdowns()

		frame.owner = owner
		frame:ClearAllPoints()
		frame:SetPoint('TOPLEFT', owner, 'BOTTOMRIGHT', 0, 0)
		
		for i=1,  #frame.buttons do
			frame.buttons[i]:Hide()
		end
		
		for i=1,  #menu do
			if not frame.buttons[i] then
				local button = CreateFrame('Button', nil, frame)
				button:SetSize(20,20)
				button:EnableMouse(true)
				button:SetScript('OnClick', function(self)
					
					if self.func then
						self:func()
					end
					
					frame:Hide()
				end)
					
				button.text = button:CreateFontString()
				button.text:SetFont(STANDARD_TEXT_FONT, 12)
				button.text:SetPoint('LEFT', button, 'LEFT', 2, 0)
				button.text:SetText(menu[i][1])
				
			
				button.bg = button:CreateTexture()
				button.bg:SetPoint('TOPLEFT', button, 'TOPLEFT', 0, 0)
				button.bg:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 0, 0)
				button.bg:SetColorTexture(1,1,1,0.3)
				button.bg:Hide()
				
				button:SetScript('OnEnter', function(self)
					self.bg:Show()
				end)
				button:SetScript('OnLeave', function(self)
					self.bg:Hide()
				end)
				frame.buttons[i] = button
			end
			
			
			local button = frame.buttons[i]
			button.index = i
			button.func = menu[i][2]
			
			if i == 3 then
				button:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -10 - (20*(i-1)))
				button:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -2, -10 - (20*(i-1)))
				
				size = size + 6
			else
				button:SetPoint('TOPLEFT', frame, 'TOPLEFT', 2, -3 - (20*(i-1)))
				button:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -2, -3 - (20*(i-1)))
			end
			
			button:Show()
			
			size = size + 20
		end
	
		if true then
			size = size + 30
			frame.cancel:Show()
		else
			size = size + 5
			frame.cancel:Hide()
		end
		
		frame:SetSize(200, size)	
		frame:Show()
	end
	
	CrucibleWeight.dropDownMenu = frame
end

function CrucibleWeight.HideDropdowns()
	detailFrame:Hide()
	CrucibleWeight.DetailerResetValues()
	CrucibleWeight.dropDownMenu:Hide()
end

function CrucibleWeight.UnfocusAllEditBox()
	for side in pairs(relicPercsPosition) do
		for i=1, #relicPercsPosition[side] do
			CrucibleWeight.gui.Elements[side][i]:ClearFocus()
		end
	end
	
	for i=1, 10 do	
		CrucibleWeight.gui.Elements['ARTIFACT'][i]:ClearFocus()
	end
	
	for i=1, 7 do
		CrucibleWeight.gui.detailFrameElements[i]:ClearFocus()
	end
	
	CrucibleWeight.gui.ItemLevel:ClearFocus()
end


do
	local frames = {}
	
	
	function CrucibleWeight.CreateRelicInpectFrame()
		local f = CreateFrame('Frame', nil, _G.UIParent)
		f:SetClampedToScreen(true)
		f:SetSize(200, 160)
		f:SetPoint('CENTER', _G.UIParent, 'CENTER', 0 + 20*#frames,  0 + -20*#frames)
		f:Hide()
		f:EnableMouse(true)
		f:SetFrameStrata('HIGH')
		f:SetMovable(true)
		f:SetToplevel(true)
		
		f.border = f:CreateTexture()
		f.border:SetAllPoints()
		f.border:SetColorTexture(0,0,0,1)
		f.border:SetDrawLayer('BORDER')

		f.background = f:CreateTexture()
		f.background:SetPoint('TOPLEFT', f, 'TOPLEFT', 1, -1)
		f.background:SetPoint('BOTTOMRIGHT', f, 'BOTTOMRIGHT', -1, 1)
		f.background:SetColorTexture(0.1,0.1,0.1,1)
		f.background:SetDrawLayer('ARTWORK')
		
		f:RegisterForDrag("LeftButton")
		f:SetScript("OnDragStart", function(self)
			self:StartMoving() end)
		f:SetScript("OnDragStop", function(self)
			self:StopMovingOrSizing() 
		end)
		
		local close_ = CreateFrame("Button", nil, f)
		close_:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		close_:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		close_:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
		close_:SetSize(32, 32)
		close_:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 0)
		close_:SetScript("OnClick", function(self)
			self:GetParent():Hide()
			self:GetParent().free = true
		end)
		
		f.close = close_
	
		local VoidText = f:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
			VoidText:SetPoint("CENTER", f, "TOP", -45 , -20)
			VoidText:SetJustifyH("CENTER")
			VoidText:SetSize(100, 20)
			VoidText:SetText('')

		VoidText.background = f:CreateTexture()
			VoidText.background:SetSize(90, 120)
			VoidText.background:SetPoint('TOP', VoidText, 'BOTTOM', 0, -1)
			VoidText.background:SetColorTexture(80/255, 83/255, 150/255, 0.4)
			VoidText.background:SetDrawLayer('ARTWORK', 1)


		local LightText = f:CreateFontString(nil, 'OVERLAY', "GameFontNormalSmall")
			LightText:SetPoint("CENTER", f, "TOP", 45 , -20)
			LightText:SetJustifyH("CENTER")
			LightText:SetSize(100, 20)	
			LightText:SetText('')
			
		LightText.background = f:CreateTexture()
			LightText.background:SetSize(90, 120)
			LightText.background:SetPoint('TOP', LightText, 'BOTTOM', 0, -1)
			LightText.background:SetColorTexture(1,0.7,0.5,0.4)
			LightText.background:SetDrawLayer('ARTWORK', 1)
	
		f.slots = {}
		
		
		for i=1, 5 do
			
			local slot = CreateFrame('Button', nil, f)
				slot:SetSize(38, 38)
				
				slot:SetScript('OnEnter', function(self)
					GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")			
					GameTooltip:ClearLines()	
					GameTooltip:SetSpellByID(self.spellID)
					GameTooltip:Show()
				end)
				slot:SetScript('OnLeave', function(self)
					GameTooltip:Hide()
				end)
				
				slot.border = slot:CreateTexture()
				slot.border:SetAllPoints()
				slot.border:SetColorTexture(0,0,0,1)
				slot.border:SetDrawLayer('BORDER')

				slot.background = slot:CreateTexture()
				slot.background:SetPoint('TOPLEFT', slot, 'TOPLEFT', 1, -1)
				slot.background:SetPoint('BOTTOMRIGHT', slot, 'BOTTOMRIGHT', -1, 1)
				slot.background:SetColorTexture(0.1,0.1,0.1,1)
				slot.background:SetDrawLayer('ARTWORK')

				slot.icon = slot:CreateTexture()
				slot.icon:SetPoint('TOPRIGHT', slot, 'TOPRIGHT', -1, -1)
				slot.icon:SetPoint('BOTTOMLEFT', slot, 'BOTTOMLEFT', 1, 1)
				slot.icon:SetSize(26, 26)
				slot.icon:SetDrawLayer('OVERLAY')
				slot.icon:SetColorTexture(1, 0, 0, 1)
				slot.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
			
			f.slots[i] = slot
		end
		
		f.slots[1]:SetPoint('TOP', f, 'TOP', -30, -40)
		f.slots[2]:SetPoint('TOP', f, 'TOP', 30, -40)
		f.slots[3]:SetPoint('TOP', f, 'TOP', -50, -100)
		f.slots[4]:SetPoint('TOP', f, 'TOP', 0, -100)
		f.slots[5]:SetPoint('TOP', f, 'TOP', 50, -100)
		
		return f
	end
	
	function CrucibleWeight.GetInspectFrame()
		local frame
		
		for i=1, #frames do
			if frames[i].free then
				frame = frames[i]
				break
			end
		end
		
		if not frame then
			frame = CrucibleWeight.CreateRelicInpectFrame()
			
			frames[#frames+1] = frame
		end
		
		frame.free = false
		
		frame:Show()
		frame:Raise()
		
		return frame
	end
	
	function CrucibleWeight.InspectRelic(code)
		if not code then
			return
		end
		
	--	print('InspectRelic', code)

		local info = { strsplit('-', code) }
		
		local frame = CrucibleWeight.GetInspectFrame()
	
		local desaturate = {}
		
		for i=1, #info do
			local spellID, picked = strsplit(':', info[i])
			
			spellID = tonumber(spellID)
			picked = tonumber(picked)
			--[==[
				1 2
				3 4 5			
			]==]
			
			
			if i==1 and picked == 1 then
				desaturate[i] = false
				desaturate[2] = true
				desaturate[5] = true
			elseif i==2 and picked == 1 then
				desaturate[i] = false
				desaturate[1] = true
				desaturate[3] = true
			elseif i==3 and picked == 1 then
				desaturate[i] = false
				desaturate[4] = true
				desaturate[5] = true
			elseif i==4 and picked == 1 then
				desaturate[i] = false
				desaturate[3] = true
				desaturate[5] = true
			elseif i==5 and picked == 1 then
				desaturate[i] = false
				desaturate[4] = true
				desaturate[3] = true
			end
			
			frame.slots[i].spellID =  spellID
			frame.slots[i].icon:SetTexture(GetSpellTexture(spellID))
			
		--	print('  ', i, spellID, picked)
		end
		
		for i=1, 5 do
			frame.slots[i].icon:SetDesaturated(desaturate[i])
		end	
	end
end