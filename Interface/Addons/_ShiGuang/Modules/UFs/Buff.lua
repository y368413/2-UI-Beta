local iMAX_PARTY_BUFFS = 16
local iMAX_PARTY_DEBUFFS = 9
local ColorizeBuff = true
local PLAYER_UNITS = { player = true, vehicle = true, pet = true, }
local PartyBuff, PartyDebuff

for i = 1, 4 do
	local str = "PartyMemberFrame"..i
	for j = 1, iMAX_PARTY_BUFFS do
		PartyBuff = CreateFrame("Button", str.."Buff"..j, _G[str], "PartyBuffFrameTemplate")
		PartyBuff:SetID(j)
		if j == 1 then
			PartyBuff:SetPoint("TOPLEFT", str, "TOPLEFT", 48, -32)
		else
			PartyBuff:SetPoint("LEFT", str.."Buff"..j-1, "RIGHT", 2, 0)
		end
	end
	local debuff1 = _G[str.."Debuff1"]
	debuff1:ClearAllPoints()
	debuff1:SetPoint("LEFT", str, "RIGHT", 9, 6)
	for j = 5, iMAX_PARTY_DEBUFFS do
		PartyDebuff = CreateFrame("Button", str.."Debuff"..j, _G[str], "PartyDebuffFrameTemplate")
		PartyDebuff:SetID(j)
		PartyDebuff:SetPoint("LEFT", str.."Debuff"..j-1, "RIGHT", 2, 0)
	end
end
PartyMemberBuffTooltip_Update = function(self) return end

hooksecurefunc("RefreshBuffs", function(frame, unit, numBuffs, suffix, checkCVar)
	numBuffs = numBuffs or MAX_PARTY_BUFFS
	suffix = suffix or "Buff"

	local buffName, buffCount, coolDown, count, duration, expirationTime, caster
	local canAssist = UnitCanAssist("player", unit)
	local needShowCD
	local filter
	if checkCVar and SHOW_CASTABLE_BUFFS == "1" and canAssist then
		filter = "RAID"
	end

	for i = 1, numBuffs do
		buffName = frame:GetName()..suffix..i
		buffCount = _G[buffName.."Count"]
		if not buffCount then
			buffCount = _G[buffName]:CreateFontString(buffName.."Count", "OVERLAY", "TextStatusBarText")
			buffCount:SetPoint("BOTTOMLEFT")
		end
		coolDown = _G[buffName.."Cooldown"]
		if not coolDown then
			needShowCD = true
			coolDown = CreateFrame("Cooldown", buffName.."Cooldown", _G[buffName], "CooldownFrameTemplate")
			coolDown:SetReverse(true)
			coolDown:SetPoint("CENTER", 0, -1)
			coolDown:Hide()
		else
			needShowCD = false
		end
		if _G[buffName]:IsShown() then
			_, _, _, count, _, duration, expirationTime, caster = UnitBuff(unit, i, filter)
			if count > 1 then
				buffCount:SetText(count)
				buffCount:Show()
			else
				buffCount:Hide()
			end
			if needShowCD then
				CooldownFrame_Set(coolDown, expirationTime - duration, duration, true)
			end
			if ColorizeBuff then
				if canAssist and not PLAYER_UNITS[caster] then
					_G[buffName.."Icon"]:SetDesaturated(true)
				else
					_G[buffName.."Icon"]:SetDesaturated(false)
				end
			end
		end
	end
end)

hooksecurefunc("RefreshDebuffs", function(frame, unit, numDebuffs, suffix, checkCVar)
	local numBuffs = nil
	if string.find(unit, "party") and string.len(unit) == 6 then
		numBuffs, numDebuffs = iMAX_PARTY_BUFFS, iMAX_PARTY_DEBUFFS
	else
		numDebuffs = numDebuffs or MAX_PARTY_DEBUFFS
	end
	suffix = suffix or "Debuff"

	if numBuffs then RefreshBuffs(frame, unit, numBuffs, nil, true) end

	local debuffName, debuffCount, coolDown, count, duration, expirationTime, caster
	local canAssist = UnitCanAssist("player", unit)
	local needShowCD
	local filter
	if checkCVar and SHOW_DISPELLABLE_DEBUFFS == "1" and canAssist then
		filter = "RAID"
	end

	for i = 1, numDebuffs do
		debuffName = frame:GetName()..suffix..i
		debuffCount = _G[debuffName.."Count"]
		if not debuffCount then
			debuffCount = _G[debuffName]:CreateFontString(debuffName.."Count", "OVERLAY", "TextStatusBarText")
			debuffCount:SetPoint("BOTTOMLEFT")
		end
		coolDown = _G[debuffName.."Cooldown"]
		if not coolDown then
			needShowCD = true
			coolDown = CreateFrame("Cooldown", debuffName.."Cooldown", _G[debuffName], "CooldownFrameTemplate")
			coolDown:SetReverse(true)
			coolDown:SetPoint("CENTER", 0, -1)
			coolDown:Hide()
		else
			needShowCD = false
		end
		if _G[debuffName]:IsShown() then
			_, _, _, count, _, duration, expirationTime, caster = UnitDebuff(unit, i, filter)
			if count > 1 then
				debuffCount:SetText(count)
				debuffCount:Show()
			else
				debuffCount:Hide()
			end
			if needShowCD then
				CooldownFrame_Set(coolDown, expirationTime - duration, duration, true)
			end
			if ColorizeBuff then
				if not canAssist and not PLAYER_UNITS[caster] then
					_G[debuffName.."Icon"]:SetDesaturated(true)
					_G[debuffName.."Border"]:Hide()
				else
					_G[debuffName.."Icon"]:SetDesaturated(false)
					_G[debuffName.."Border"]:Show()
				end
			end
		end
	end
end)

hooksecurefunc("TargetFrame_UpdateAuras", function(self)
	if not ColorizeBuff then return end

	local frameName, caster
	local canAssist = UnitCanAssist("player", self.unit)

	for i = 1, MAX_TARGET_BUFFS do
		frameName = self:GetName().."Buff"..(i)
		caster = select(8, UnitBuff(self.unit, i, nil))
		if _G[frameName] and _G[frameName]:IsShown() then
			if canAssist and not PLAYER_UNITS[caster] then
				_G[frameName.."Icon"]:SetDesaturated(true)
			else
				_G[frameName.."Icon"]:SetDesaturated(false)
			end
		end
	end

	for i = 1, MAX_TARGET_DEBUFFS do
		frameName = self:GetName().."Debuff"..i
		caster = select(8, UnitDebuff(self.unit, i, "INCLUDE_NAME_PLATE_ONLY"))
		if _G[frameName] and _G[frameName]:IsShown() then
			if not canAssist and not PLAYER_UNITS[caster] then
				_G[frameName.."Icon"]:SetDesaturated(true)
				_G[frameName.."Border"]:Hide()
			else
				_G[frameName.."Icon"]:SetDesaturated(false)
				_G[frameName.."Border"]:Show()
			end
		end
	end
end)

hooksecurefunc("FocusFrame_SetSmallSize", function()
	if not FocusFrame.showAuraCount then
		FocusFrame.showAuraCount = true
		TargetFrame_UpdateAuras(FocusFrame)
	end
end)

--圆形buff
--[[hooksecurefunc("BuffFrame_Update", function()
    local buff
    for i = 1, BUFF_ACTUAL_DISPLAY do
		buff = _G["BuffButton"..i]
        if (not buff.border) then
            buff.border = buff:CreateTexture(nil, "BORDER")
            buff.border:SetSize(buff:GetWidth()+8, buff:GetHeight()+8)
            buff.border:SetPoint("CENTER")
            buff.border:SetTexture("Interface\\Minimap\\UI-QuestBlob-MinimapRing")
            buff.border:SetVertexColor(0.1, 0.1, 0.2)
        end
        if (buff:IsShown()) then
            _G["BuffButton"..i.."Icon"]:SetMask("Interface\\Minimap\\UI-Minimap-Background")
        end
    end
end)]]

---------------------------------------------------------------------------------------------------- Local variables
local lWarned;
---------------------------------------------------------------------------------------------------- Internal functions
local function lSetTimeText(button, time)
	if( time <= 0 ) then
		button:SetText("");
	elseif( time < 60 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c00FF0000%.1f|r", s);
	elseif( time < 600 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c00FF9B00%d:%02d|r", m, s);
	elseif( time <= 3600 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c0000FF00%dm|r", m);
	else
		button:SetText("|c0000FF001 h+|r");
	end
end
---------------------------------------------------------------------------------------------------- OnFoo functions
function BuffTimers_OnLoad(self)
	-- Hook the functions we need to override
	hooksecurefunc("AuraButton_Update", BT_AuraButton_Update);
	hooksecurefunc("AuraButton_UpdateDuration", BT_AuraButton_UpdateDuration);
end

function BT_AuraButton_Update(buttonName, index, filter)
	local unit = PlayerFrame.unit;
	local name, rank, texture, count, debuffType, duration, expirationTime = UnitAura(unit, index, filter); 
	local buffName = buttonName..index;
	local buffDuration = getglobal(buffName.."Duration");
	if ( duration == 0 ) then
		buffDuration:SetText("|cff00ff00^-^|r");
		buffDuration:Show();
	end
end

function BT_AuraButton_UpdateDuration(buffButton, timeLeft)
	if( SHOW_BUFF_DURATIONS == "1" ) then
		local duration = getglobal(buffButton:GetName().."Duration");
		if( timeLeft ) then
			lSetTimeText(duration, timeLeft);
			duration:Show();
		else
			duration:Hide();
		end
	elseif( not lWarned ) then
		lWarned = true;
	end
end
BuffTimers_OnLoad(self);