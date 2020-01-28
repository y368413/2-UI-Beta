local _, ns = ...
local M, R, U, I = unpack(ns)
------------------------------- Nameplate, by paopao001-- NDui MOD-----------------------------
-- FOR XML -- Thanks EKE
	local NPBarFont = CreateFont("NPBarFont")
	NPBarFont:CopyFontObject("GameFontHighlightSmall")
	NPBarFont:SetFont(STANDARD_TEXT_FONT, 10, "OUTLINE")
	
--[[ Auras ]]-- 
local function UpdateAuraIcon(button, unit, index, filter, customIcon)
	local _, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura(unit, index, filter)

	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	
	local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
	if MaoRUIPerDB["Nameplate"]["ColorBorder"] then
		button.overlay:SetVertexColor(color.r, color.g, color.b)
	else
		button.overlay:SetVertexColor(0, 0, 0)
	end

	if count and count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end
	
	button:SetScript("OnUpdate", function(self, elapsed)
		if not self.duration then return end
		
		self.elapsed = (self.elapsed or 0) + elapsed

		if self.elapsed < .2 then return end
		self.elapsed = 0

		local timeLeft = self.expirationTime - GetTime()
		if timeLeft <= 0 then
			self.text:SetText(nil)
		else
			self.text:SetText(M.FormatTime(timeLeft))
		end
	end)
	
	if customIcon then
		button.icon:SetTexture(R.CustomIcons[customIcon]) 
	else
		button.icon:SetTexture(icon)
	end	
	
	button:Show()
end

local function AuraFilter(caster, spellID, unit)
	if caster == "player" then
		--1:none, 2:all, 3:white, 4:black, 5:aurawatch
		if MaoRUIPerDB["Nameplate"]["AuraFilter"] == 1 then
			return false
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 2 then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 3 and R.WhiteList[spellID] then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 4 and not R.BlackList[spellID] then
			return true
		elseif MaoRUIPerDB["Nameplate"]["AuraFilter"] == 5 then
			local auraList = R.AuraWatchList[I.MyClass]
			if auraList then
				for _, value in pairs(auraList) do
					if value.Name == "Target Aura" then
						for _, v in pairs(value.List) do
							if v.AuraID == spellID then
								return true
							end
						end
					end
				end
			end
		end
	else
		--1:none, 2:white
		if MaoRUIPerDB["Nameplate"]["OtherFilter"] == 1 then
			return false
		elseif MaoRUIPerDB["Nameplate"]["OtherFilter"] == 2 and R.WhiteList[spellID] then
			return true
		end
	end
end

local function UpdateBuffs(unitFrame)
	if not unitFrame.icons or not unitFrame.displayedUnit then return end
	if UnitIsUnit(unitFrame.displayedUnit, "player") and not MaoRUIPerDB["Nameplate"]["PlayerAura"] then
		unitFrame.icons:Hide()
		return
	else
		unitFrame.icons:Show()
	end

	local i = 1
	for index = 1, 15 do
		if i <= MaoRUIPerDB["Nameplate"]["maxAuras"] then
			local name, _, _, _, _, _, caster, _, _, spellID = UnitAura(unitFrame.displayedUnit, index, "HELPFUL")
			local matchbuff, customIcon = AuraFilter(caster, spellID, unitFrame.displayedUnit)
			if name and matchbuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = unitFrame.Pools:Acquire("AuraIconTemplate")
					unitFrame.icons[i]:SetSize(MaoRUIPerDB["Nameplate"]["AuraSize"], MaoRUIPerDB["Nameplate"]["AuraSize"])
					unitFrame.icons[i].text:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Loli.ttf", MaoRUIPerDB["Nameplate"]["AuraSize"]-8, "OUTLINE")
					unitFrame.icons[i].count:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", MaoRUIPerDB["Nameplate"]["AuraSize"]-11, "OUTLINE")
				end
				UpdateAuraIcon(unitFrame.icons[i], unitFrame.displayedUnit, index, "HELPFUL", customIcon)
				if i ~= 1 then
					if i == 7 then
						unitFrame.icons[7]:SetPoint("BOTTOM", unitFrame.icons[1], "TOP", 0, 4)
					else
						unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
					end
				end
				i = i + 1
			end
		end
	end

	for index = 1, 20 do
		if i <= MaoRUIPerDB["Nameplate"]["maxAuras"] then
			local name, _, _, _, _, _, caster, _, _, spellID = UnitAura(unitFrame.displayedUnit, index, "HARMFUL")
			local matchdebuff, customIcon = AuraFilter(caster, spellID, unitFrame.displayedUnit)
			if name and matchdebuff then
				if not unitFrame.icons[i] then
					unitFrame.icons[i] = unitFrame.Pools:Acquire("AuraIconTemplate")
					unitFrame.icons[i]:SetSize(MaoRUIPerDB["Nameplate"]["AuraSize"], MaoRUIPerDB["Nameplate"]["AuraSize"])
					unitFrame.icons[i].text:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Loli.ttf", MaoRUIPerDB["Nameplate"]["AuraSize"]-8, "OUTLINE")
					unitFrame.icons[i].count:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", MaoRUIPerDB["Nameplate"]["AuraSize"]-11, "OUTLINE")
				end
				UpdateAuraIcon(unitFrame.icons[i], unitFrame.displayedUnit, index, "HARMFUL", customIcon)
				if i ~= 1 then
					if i == 7 then
						unitFrame.icons[7]:SetPoint("BOTTOM", unitFrame.icons[1], "TOP", 0, 4)
					else
						unitFrame.icons[i]:SetPoint("LEFT", unitFrame.icons[i-1], "RIGHT", 4, 0)
					end
				end
				i = i + 1
			end
		end
	end
	unitFrame.iconnumber = i - 1

	if i > 1 then
		unitFrame.icons[1]:SetPoint("LEFT", unitFrame.icons, "LEFT", 0, -3)
	end
	for index = i, #unitFrame.icons do unitFrame.icons[index]:Hide() end
end

--[[ Player Power ]]--
if GetCVar("nameplateShowSelf") == "1" then
	local PowerFrame = CreateFrame("Frame", "2uiNamePlatePowerFrame")
	
	PowerFrame.powerBar = CreateFrame("StatusBar", nil, PowerFrame)
	PowerFrame.powerBar:SetHeight(3)
	PowerFrame.powerBar:SetStatusBarTexture(I.normTex)
	PowerFrame.powerBar:SetMinMaxValues(0, 1)
	--M.CreateSD(PowerFrame.powerBar, 3, 3)
	
	PowerFrame.powerperc = PowerFrame:CreateFontString(nil, "OVERLAY")
	PowerFrame.powerperc:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Infinity.ttf", 14, "OUTLINE")
	PowerFrame.powerperc:SetShadowColor(0, 0, 0, 0.4)
	PowerFrame.powerperc:SetShadowOffset(1, -1)
	
	PowerFrame:SetScript("OnEvent", function(self, event, unit)
		if event == "PLAYER_ENTERING_WORLD" or (event == "UNIT_POWER_FREQUENT" and unit == "player") then
			local minPower, maxPower, powertype_index, powertype = UnitPower("player"), UnitPowerMax("player"), UnitPowerType("player")
			local perc
			
			if maxPower ~= 0 then
				perc = minPower/maxPower
			else
				perc = 0
			end
			local perc_text = string.format("%d", math.floor(perc*100))
			
			if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
				PowerFrame.powerBar:SetValue(perc)
			else
				if minPower ~= maxPower then
					if powertype_index == 0 then
						PowerFrame.powerperc:SetText(perc_text)
					else
						PowerFrame.powerperc:SetText(minPower)
					end
				else
					PowerFrame.powerperc:SetText("")
				end
			end
		
			if powertype == "MANA" then r, g, b = 0, 0.8, 1 end
			if powertype == "RAGE" then r, g, b = .9, .1, .1 end
			if powertype == "FUEL" then r, g, b = 0, 0.55, 0.5 end
			if powertype == "FOCUS" then r, g, b = .9, .5, .1 end
			if powertype == "ENERGY" then r, g, b = .9, .9, .1 end
			if powertype == "AMMOSLOT" then r, g, b = 0.8, 0.6, 0 end
			if powertype == "RUNIC_POWER" then r, g, b = .1, .9, .9 end
			if powertype == "POWER_TYPE_STEAM" then r, g, b = 0.55, 0.57, 0.61 end
			if powertype == "POWER_TYPE_PYRITE" then r, g, b = 0.60, 0.09, 0.17 end
			if powertype == "MEALSTORM" then r, g, b = 0.4, 0.7, 1 end

			if ( r ~= PowerFrame.r or g ~= PowerFrame.g or b ~= PowerFrame.b ) then
				if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
					PowerFrame.powerBar:SetStatusBarColor(r, g, b)
				else
					PowerFrame.powerperc:SetTextColor(r, g, b)
				end
				PowerFrame.r, PowerFrame.g, PowerFrame.b = r, g, b
			end
		elseif event == "NAME_PLATE_UNIT_ADDED" and UnitIsUnit(unit, "player") then
			local namePlatePlayer = C_NamePlate.GetNamePlateForUnit("player")
			if namePlatePlayer then
				PowerFrame:Show()
				PowerFrame:SetParent(namePlatePlayer)
				if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
					PowerFrame.powerBar:ClearAllPoints()
					PowerFrame.powerBar:SetPoint("TOPLEFT", namePlatePlayer.UnitFrame.healthBar, "BOTTOMLEFT", 0, -2)
					PowerFrame.powerBar:SetPoint("TOPRIGHT", namePlatePlayer.UnitFrame.healthBar, "BOTTOMRIGHT", 0, -2)
				else
					PowerFrame.powerperc:ClearAllPoints()
					PowerFrame.powerperc:SetPoint("TOP", namePlatePlayer.UnitFrame.healthperc, "BOTTOM", 0, 0)
					PowerFrame.powerperc:SetJustifyH("CENTER")
					PowerFrame.powerperc:SetJustifyV("TOP")
				end
			end
		elseif event == "NAME_PLATE_UNIT_REMOVED" and UnitIsUnit(unit, "player") then
			PowerFrame:Hide()
		end
	end)
	PowerFrame:RegisterEvent("UNIT_POWER_FREQUENT")
	PowerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	PowerFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
	PowerFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
end

--[[ Class bar stuff ]]--
if GetCVar("nameplateShowSelf") == "1" then
	local function multicheck(check, ...)
		for i=1, select("#", ...) do
			if check == select(i, ...) then return true end
		end
		return false
	end

	local ClassPowerID, ClassPowerType, RequireSpec
	local classicon_colors = { --monk/paladin/preist
		{.6, 0, .1},
		{.9, .1, .2},
		{1, .2, .3},
		{1, .3, .4},
		{1, .4, .5},
		{1, .5, .6},
	}
	
	local cpoints_colors = {{1, 1, 0},{1, 0, 0},} -- combat points
	
	if(I.MyClass == "MONK") then
		ClassPowerID = Enum.PowerType.Chi or 12
		ClassPowerType = "CHI"
		RequireSpec = SPEC_MONK_WINDWALKER
	elseif(I.MyClass == "PALADIN") then
		ClassPowerID = Enum.PowerType.HolyPower or 9
		ClassPowerType = "HOLY_POWER"
		RequireSpec = SPEC_PALADIN_RETRIBUTION
	elseif(I.MyClass == "MAGE") then
		ClassPowerID = Enum.PowerType.ArcaneCharges or 16
		ClassPowerType = "ARCANE_CHARGES"
		RequireSpec = SPEC_MAGE_ARCANE
	elseif(I.MyClass == "WARLOCK") then
		ClassPowerID = Enum.PowerType.SoulShards or 7
		ClassPowerType = "SOUL_SHARDS"
	elseif(I.MyClass == "ROGUE" or I.MyClass == "DRUID") then
		ClassPowerID = Enum.PowerType.ComboPoints or 4
		ClassPowerType = "COMBO_POINTS"
	end

	local Resourcebar = CreateFrame("Frame", "2uiplateresource", UIParent)
	Resourcebar:SetWidth(100)--(10+3)*6 - 3
	Resourcebar:SetHeight(3)
	Resourcebar.maxbar = 6
		
	for i = 1, 6 do
		Resourcebar[i] = CreateFrame("Frame", "2uiplateresource"..i, Resourcebar)
		Resourcebar[i]:SetFrameLevel(1)
		Resourcebar[i]:SetSize(16, 3)
		--M.CreateSD(Resourcebar[i], 3, 3)

		Resourcebar[i].tex = Resourcebar[i]:CreateTexture(nil, "OVERLAY")
		Resourcebar[i].tex:SetAllPoints(Resourcebar[i])
		if I.MyClass == "DEATHKNIGHT" then
			Resourcebar[i].value = Resourcebar[i]:CreateFontString(nil, "OVERLAY")
			Resourcebar[i].value:SetFont(GameFontHighlight:GetFont(), 12, "OUTLINE")
			Resourcebar[i].value:SetJustifyH("CENTER")
			Resourcebar[i].value:SetPoint("CENTER")
			Resourcebar[i].tex:SetColorTexture(.7, .7, 1)
		end
		
		if i == 1 then
			Resourcebar[i]:SetPoint("BOTTOMLEFT", Resourcebar, "BOTTOMLEFT")
		else
			Resourcebar[i]:SetPoint("LEFT", Resourcebar[i-1], "RIGHT", 2, 0)
		end
	end

	Resourcebar:SetScript("OnEvent", function(self, event, unit, powerType)
		if not MaoRUIPerDB["Nameplate"]["Enable"] then
			self:UnregisterAllEvents()
			return
		end

		if event == "PLAYER_TALENT_UPDATE" then
			if multicheck(I.MyClass, "WARLOCK", "PALADIN", "MONK", "MAGE", "ROGUE", "DRUID", "DEATHKNIGHT") and not RequireSpec or RequireSpec == GetSpecialization() then -- 启用
				self:RegisterEvent("UNIT_POWER_FREQUENT")
				self:RegisterEvent("PLAYER_ENTERING_WORLD")
				self:RegisterEvent("NAME_PLATE_UNIT_ADDED")
				self:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
				self:RegisterEvent("PLAYER_TARGET_CHANGED")
				self:RegisterEvent("RUNE_POWER_UPDATE")
				self:Show()
			else
				self:UnregisterEvent("UNIT_POWER_FREQUENT")
				self:UnregisterEvent("PLAYER_ENTERING_WORLD")
				self:UnregisterEvent("NAME_PLATE_UNIT_ADDED")
				self:UnregisterEvent("NAME_PLATE_UNIT_REMOVED")
				self:UnregisterEvent("PLAYER_TARGET_CHANGED")
				self:UnregisterEvent("RUNE_POWER_UPDATE")
				self:Hide()
			end
		elseif event == "PLAYER_ENTERING_WORLD" or (event == "UNIT_POWER_FREQUENT" and unit == "player" and powerType == ClassPowerType) then
			if multicheck(I.MyClass, "WARLOCK", "PALADIN", "MONK", "MAGE", "ROGUE", "DRUID") then
				local cur, max, oldMax
				
				cur = UnitPower('player', ClassPowerID)
				max = UnitPowerMax('player', ClassPowerID)
				
				if multicheck(I.MyClass, "WARLOCK", "PALADIN", "MONK", "MAGE") then
					for i = 1, max do
						if i <= cur then
							self[i]:Show()
						else
							self[i]:Hide()
						end
						if cur == max then
							self[i].tex:SetColorTexture(unpack(classicon_colors[max]))
						else
							self[i].tex:SetColorTexture(unpack(classicon_colors[i]))
						end
					end
					
					oldMax = self.maxbar
					if max ~= oldMax then
						if max < oldMax then
							for i = max + 1, oldMax do
								self[i]:Hide()
							end
						end
						for i = 1, 6 do
							self[i]:SetWidth(102/max-2)
						end
						self.maxbar = max
					end
				else -- 连击点
					if max <= 6 then
						for i = 1, max do
							if i <= cur then
								self[i]:Show()
							else
								self[i]:Hide()
							end
							self[i].tex:SetColorTexture(unpack(cpoints_colors[1]))
						end
					else
						if cur <= 5 then
							for i = 1, 5 do
								if i <= cur then
									self[i]:Show()
								else
									self[i]:Hide()
								end
								self[i].tex:SetColorTexture(unpack(cpoints_colors[1]))
							end
						else
							for i = 1, 5 do
								self[i]:Show()
							end
							for i = 1, cur - 5 do
								self[i].tex:SetColorTexture(unpack(cpoints_colors[2]))
							end
							for i = cur - 4, 5 do
								self[i].tex:SetColorTexture(unpack(cpoints_colors[1]))
							end
						end
					end

					oldMax = self.maxbar
					if(max ~= oldMax) then
						if max == 5 or max == 10 then
							self[6]:Hide()
							for i = 1, 6 do
								self[i]:SetWidth(102/5-2)
							end
						else
							for i = 1, 6 do
								self[i]:SetWidth(102/max-2)
								if i > max then
									self[i]:Hide()
								end
							end
						end
						self.maxbar = max
					end
				end
			end
		elseif I.MyClass == "DEATHKNIGHT" and event == "RUNE_POWER_UPDATE" then
			local rid = unit
			local start, duration, runeReady = GetRuneCooldown(rid)
			if runeReady then
				self[rid]:SetAlpha(1)
				self[rid].tex:SetColorTexture(.7, .7, 1)
				self[rid]:SetScript("OnUpdate", nil)
				self[rid].value:SetText("")
			elseif start then
				self[rid]:SetAlpha(.7)
				self[rid].tex:SetColorTexture(.3, .3, .3)
				self[rid].max = duration
				self[rid].duration = GetTime() - start
				self[rid]:SetScript("OnUpdate", function(self, elapsed)
					self.duration = self.duration + elapsed
					if self.duration >= self.max or self.duration <= 0 then
						self.value:SetText("")
					else
						self.value:SetText(M.FormatTime(self.max - self.duration))
					end
				end)
			end
		elseif (GetCVar("nameplateResourceOnTarget") == "0") then
			if event == "NAME_PLATE_UNIT_ADDED" and UnitIsUnit(unit, "player") then
				local namePlatePlayer = C_NamePlate.GetNamePlateForUnit("player")
				if namePlatePlayer then
					self:SetParent(namePlatePlayer)
					self:ClearAllPoints()
					self:Show()
					if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
						self:SetPoint("TOP", namePlatePlayer.UnitFrame.name, "TOP", 0, 0) -- 玩家数字
					else
						self:SetPoint("BOTTOM", namePlatePlayer.UnitFrame.healthBar, "TOP", 0, 2) -- 玩家条
					end
				end
			elseif event == "NAME_PLATE_UNIT_REMOVED" and UnitIsUnit(unit, "player") then
				self:Hide()
			end
		elseif (GetCVar("nameplateResourceOnTarget") == "1") and (event == "PLAYER_TARGET_CHANGED" or event == "NAME_PLATE_UNIT_ADDED") then
			local namePlateTarget = C_NamePlate.GetNamePlateForUnit("target")
			if namePlateTarget then
			 if UnitCanAttack("player", namePlateTarget.UnitFrame.displayedUnit) then
				self:SetParent(namePlateTarget)
				self:ClearAllPoints()
				if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
					self:SetPoint("TOP", namePlateTarget.UnitFrame.name, "BOTTOM", 0, -2) -- 目标数字
				else
					self:SetPoint("TOP", namePlateTarget.UnitFrame.healthBar, "BOTTOM", 0, 0) -- 目标条
				end
				self:Show()
			else
			  return
			end
			else
				self:Hide()
			end
		end
	end)
	
	Resourcebar:RegisterEvent("PLAYER_TALENT_UPDATE")
end

-- 獲取NPC ID
local GetNPCID = function(guid)
	local id = tonumber(strmatch((guid or ""), "%-(%d-)%-%x-$"))
	return id
end	

--[[ Unit frame ]]--
local function UpdateName(unitFrame)
	local unit = unitFrame.displayedUnit
	local level = UnitLevel(unit)
	local name = GetUnitName(unit, false) or UNKNOWN
	local class = UnitClassification(unit)

	if level and level ~= UnitLevel("player") then
		if level == -1 then
			level = "|cffff0000+|r "
		else 
			level = M.HexRGB(GetCreatureDifficultyColor(level))..level.."|r "
		end
	else
		level = ""
	end
	if name then
		if UnitIsUnit(unit, "player") then
			unitFrame.name:SetText("")
		else
		    if R.CustomBommUnits[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
		       unitFrame.name:SetText("|cffff0000>>>|r "..level..name.."|cffff0000<<<|r ")
		    else
		       --if class and UnitClassification(unit) == "rare" then
		          --unitFrame.name:SetText("rare "..level..name)
		       --elseif class and UnitClassification(unit) == "elite" then
		          --unitFrame.name:SetText(ELITE ..level..name)
		       --elseif class and UnitClassification(unit) == "rareelite" then
		          --unitFrame.name:SetText("rareelite "..level..name)
		       --elseif class and UnitClassification(unit) == "worldboss" then
		          --unitFrame.name:SetText("worldboss "..level..name)
		       --else
			      unitFrame.name:SetText(level..name)
			   --end
			end
		end
	end
end

local function UpdateHealth(unitFrame)
	local minHealth, maxHealth = UnitHealth(unitFrame.displayedUnit), UnitHealthMax(unitFrame.displayedUnit)
	local perc
	if maxHealth == 0 then
		perc = 1
	else
		perc = minHealth/maxHealth
	end
	
	local perc_text = string.format("%d", math.floor(perc*100))
	
	if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
		unitFrame.healthBar:SetValue(perc)
		if MaoRUIPerDB["Nameplate"]["FullHealth"] then
		  unitFrame.healthBar.value:SetText(M.Numb(minHealth))  --.." | "..M.Numb(max)
		else
		  if minHealth ~= maxHealth then 
			  unitFrame.healthBar.value:SetText(perc_text)
		  else
			  unitFrame.healthBar.value:SetText("")
		  end
		end
		
		if perc < .25 then
			unitFrame.healthBar.value:SetTextColor(0.8, 0.05, 0)
		elseif perc < .3 then
			unitFrame.healthBar.value:SetTextColor(0.95, 0.7, 0.25)
		else
			unitFrame.healthBar.value:SetTextColor(1, 1, 1)
		end
	else
		if minHealth ~= maxHealth then
			unitFrame.healthperc:SetText(perc_text)
		else
			unitFrame.healthperc:SetText("")
		end
		
	if perc <= 0.5 and perc >= 0.35 then
			unitFrame.healthperc:SetTextColor(253/255, 238/255, 80/255)
	elseif perc < 0.35 and perc >= 0.2 then
			unitFrame.healthperc:SetTextColor(250/255, 130/255, 0/255)
		elseif perc < 0.2 then
			unitFrame.healthperc:SetTextColor(200/255, 20/255, 40/255)
		else
			unitFrame.healthperc:SetTextColor(1, 1, 1)
		end
	end
end

-- Power / 能量
local function UpdatePower(unitFrame)
	local unit = unitFrame.displayedUnit
	local cur, max = UnitPower(unit), UnitPowerMax(unit)
	local perc = cur / max
	local percT
	local r, g, b
	
	if cur and max and max > 0 then
		perc = cur / max
		percT = math.floor(perc * 100 + .5)
	else
		perc = 0
		percT = 0		
	end
	
	-- 能量百分比
	if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
		unitFrame.powerperc:SetText(percT)
	else
		unitFrame.powerBar:SetValue(perc)
		unitFrame.powerBar.value:SetText(percT)
	end
	
	-- 能量漸變色
  	if perc < .25 then
		r, g, b = .2, .2, 1
	elseif perc < .3 then
		r, g, b = .4, .4, 1
	else
		r, g, b = .8, .8, 1
	end
	
	if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
		unitFrame.powerBar:SetStatusBarColor(r, g, b)
		unitFrame.powerBar.bd:SetBackdropColor(r/3, g/3, b/3)
	else
		unitFrame.powerperc:SetTextColor(r, g, b)
	end	
end

local function IsTapDenied(unitFrame)
	return UnitIsTapDenied(unitFrame.unit) and not UnitPlayerControlled(unitFrame.unit)
end

local function UpdateHealthColor(unitFrame)
	local hp = unitFrame.healthBar
	local unit = unitFrame.displayedUnit or false
	local status = UnitThreatSituation("player", unit)
	local r, g, b

	if not UnitIsConnected(unit) then
		r, g, b = .7, .7, .7
	else
		local iscustomed = false
		
		-- 特定目標染色白名單
		if GetUnitName(unitFrame.displayedUnit, false) then
		    if R.CustomBommUnits[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
		        r, g, b = .7, .95, 1
		        iscustomed = true
		    elseif R.CustomUnits[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
				    r, g, b = .8, 1, .1
				    iscustomed = true
				end
		end
		
		--職業或陣營染色
		if not iscustomed then
		if UnitIsPlayer(unit) and UnitReaction(unit, "player") >= 5 then
			if MaoRUIPerDB["Nameplate"]["FriendlyCC"] then
				r, g, b = M.UnitColor(unit)
			else
				r, g, b = .3, .3, 1
			end
		elseif UnitIsPlayer(unit) and UnitReaction(unit, "player") <= 4 and MaoRUIPerDB["Nameplate"]["HostileCC"] then
			r, g, b = M.UnitColor(unit)
		elseif IsTapDenied(unitFrame) then
			r, g, b = .6, .6, .6
		else
			r, g, b = UnitSelectionColor(unit, true)
			if status and (MaoRUIPerDB["Nameplate"]["TankMode"] or I.Role == "Tank") then
				if status == 3 then
					r, g, b = 1, 0, 1
				elseif status == 2 or status == 1 then
					r, g, b = 1, .8, 0
				end
			end
		end
	end
	end
	if ( r ~= unitFrame.r or g ~= unitFrame.g or b ~= unitFrame.b ) then
		if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
			unitFrame.healthBar:SetStatusBarColor(r, g, b)
				if not MaoRUIPerDB["Nameplate"]["TankMode"] and I.Role ~= "Tank" then
					if status and status == 3 then
						hp.bd:SetBackdropBorderColor(1, 0, 0)
					elseif status and (status == 2 or status == 1) then
						hp.bd:SetBackdropBorderColor(1, 1, 0)
					else
						hp.bd:SetBackdropBorderColor(0, 0, 0)
					end
				else
					hp.bd:SetBackdropBorderColor(r/3, g/3, b/3) --0, 0, 0
				end
			--unitFrame.healthBar.bd:SetBackdropColor(r/3, g/3, b/3)
			if MaoRUIPerDB["Nameplate"]["nameonly"] then
				if UnitIsPlayer(unit) and UnitReaction(unit, "player") >= 5 then
					unitFrame.name:SetTextColor(r, g, b)
				else
					unitFrame.name:SetTextColor(1, 1, 1)
				end
			end
		else
			unitFrame.name:SetTextColor(r, g, b)
		end
		unitFrame.r, unitFrame.g, unitFrame.b = r, g, b
	end
end

local function UpdateCastBar(unitFrame)
	if not unitFrame.castbar_added then
		unitFrame.castBar.startCastColor = CreateColor(0.8, 0.6, 0.1)
		unitFrame.castBar.startChannelColor = CreateColor(0.1, 0.6, 0.8)
		unitFrame.castBar.finishedCastColor = CreateColor(0.2, 0.6, 0.8)
		unitFrame.castBar.failedCastColor = CreateColor(0.1, 0.6, 0.9)
		unitFrame.castBar.nonInterruptibleColor = CreateColor(1, 0, 0)
		CastingBarFrame_AddWidgetForFade(unitFrame.castBar, unitFrame.castBar.BorderShield)
		unitFrame.castbar_added = true
	end
	
	if MaoRUIPerDB["Nameplate"]["nameonly"] and UnitIsPlayer(unitFrame.unit) and UnitReaction(unitFrame.unit, "player") >= 5 then return end
	if not UnitIsUnit("player", unitFrame.displayedUnit) then  
		CastingBarFrame_SetUnit(unitFrame.castBar, unitFrame.unit, false, true)
	end
end

local function UpdateSelectionHighlight(unitFrame)
	if UnitIsUnit(unitFrame.displayedUnit, "target") and not UnitIsUnit(unitFrame.displayedUnit, "player") then
		unitFrame.redarrowleft:Show()
		unitFrame.redarrowright:Show()
	else
		unitFrame.redarrowleft:Hide()
		unitFrame.redarrowright:Hide()
	end

	-- 焦點高亮
	if UnitIsUnit(unitFrame.displayedUnit, "focus") and not UnitIsUnit(unitFrame.displayedUnit, "player") and MaoRUIPerDB["Nameplate"]["HighlightFocus"] then
		unitFrame.hlfocus:Show()
	else
		unitFrame.hlfocus:Hide()
	end
	
	if MaoRUIPerDB["Nameplate"]["Arrow"] then
	unitFrame.redarrowleft:ClearAllPoints()
	unitFrame.redarrowright:ClearAllPoints()

	if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then	
		--if unitFrame.iconnumber and unitFrame.iconnumber > 0 then
			--unitFrame.redarrowleft:SetPoint("LEFT", unitFrame.healthBar, "RIGHT", 0, MaoRUIPerDB["Nameplate"]["AuraSize"]+3)
		--else
		if MaoRUIPerDB["Nameplate"]["nameonly"] then
		  unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.name, "TOP", 0, 0)
		else
			unitFrame.redarrowleft:SetRotation(math.rad(90))
			unitFrame.redarrowleft:SetPoint("RIGHT", unitFrame.healthBar, "LEFT", 1, 0)
			unitFrame.redarrowright:SetRotation(math.rad(-90))
			unitFrame.redarrowright:SetPoint("LEFT", unitFrame.healthBar, "RIGHT", -1, 0)
		end
	else
		--[[if unitFrame.PvPClassificationIndicator:IsShown() then
			if unitFrame.iconnumber and unitFrame.iconnumber > 0 then -- 有图标
				unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, MaoRUIPerDB["Nameplate"]["AuraSize"]+20)
			else
				unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, 20)
			end
		elseif unitFrame.iconnumber and unitFrame.iconnumber > 0 then -- 有图标
			unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, MaoRUIPerDB["Nameplate"]["AuraSize"])
		elseif UnitHealth(unitFrame.displayedUnit) and UnitHealthMax(unitFrame.displayedUnit) and UnitHealth(unitFrame.displayedUnit) ~= UnitHealthMax(unitFrame.displayedUnit) then -- 非满血
			unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, 0)
		else -- 只有名字]]
			unitFrame.redarrowleft:SetPoint("BOTTOM", unitFrame.name, "TOP", 0, 0)
		--end
	end
	end
end

------------------------------------
-- mouseover highlight / 指向高亮 --
------------------------------------

-- Update mouseover move out because event only check move in / 檢測移出
local function MouseoverOnUpdate(self, elapsed)
	if not UnitIsUnit(self.unit, "mouseover") then
		self.hlmo:Hide()
	end
end

-- Update mouseover
local function UpdateMouseover(unitFrame)
	if not MaoRUIPerDB["Nameplate"]["HighlightTarget"] then return end
	local unit = unitFrame.unit
	if UnitIsUnit(unit, "mouseover") and not UnitIsUnit(unit, "player") then
		unitFrame.hlmo:Show()
	else
		unitFrame.hlmo:Hide()
	end
	unitFrame:SetScript("OnUpdate", MouseoverOnUpdate)
end

local function UpdateRaidTarget(unitFrame)
	if GetRaidTargetIndex(unitFrame.displayedUnit) then
		if not UnitIsUnit(unitFrame.displayedUnit, "player") then
			SetRaidTargetIconTexture(unitFrame.RaidTargetFrame.RaidTargetIcon, GetRaidTargetIndex(unitFrame.displayedUnit))
			unitFrame.RaidTargetFrame.RaidTargetIcon:Show()
		end
	else
		unitFrame.RaidTargetFrame.RaidTargetIcon:Hide()
	end
	unitFrame.RaidTargetFrame:SetPoint("RIGHT", unitFrame.name, "LEFT", -16, 0)
end

local classtex = {
	rare = {"Interface\\MINIMAP\\ObjectIcons", .391, .487, .644, .74},
	--elite = {"Interface\\MINIMAP\\Minimap_skull_elite", 0, 1, 0, 1},
	rareelite = {"Interface\\MINIMAP\\ObjectIcons", .754, .875, .624, .749},
	worldboss = {"Interface\\MINIMAP\\ObjectIcons", .879, 1, .754, .879},
}
local function UpdateNamePlateEvents(unitFrame)
	-- These are events affected if unit is in a vehicle
	local unit = unitFrame.unit
	local displayedUnit
	if unit ~= unitFrame.displayedUnit then
		displayedUnit = unitFrame.displayedUnit
	end
	unitFrame:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", unit, displayedUnit)
	unitFrame:RegisterUnitEvent("UNIT_AURA", unit, displayedUnit)
	unitFrame:RegisterUnitEvent("UNIT_THREAT_LIST_UPDATE", unit, displayedUnit)
	
		if R.ShowPowerList[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
			unitFrame:RegisterUnitEvent("UNIT_POWER_FREQUENT", unit, displayedUnit)
			-- 顯示能量條時微調名字位置
			if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
				unitFrame.powerBar:Show()
				unitFrame.powerBar.value:Show()
				unitFrame.name:SetPoint("BOTTOM", unitFrame.powerBar, "TOP", 0, 2)
			else
				unitFrame.powerperc:Show()
			end
		else
			unitFrame:UnregisterEvent("UNIT_POWER_FREQUENT")
			
			if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
				unitFrame.powerBar:Hide()
				unitFrame.powerBar.value:Hide()
				unitFrame.name:SetPoint("BOTTOM", unitFrame.healthBar, "TOP", 0, 2)
			else
				unitFrame.powerperc:Hide()
			end
		end
	if MaoRUIPerDB["Nameplate"]["BommIcon"] and R.CustomBommUnits[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
	  unitFrame.BoomIcon:Show()
		unitFrame.BoomIcon:SetTexCoord(0, 1, 0, 1)
	else
		unitFrame.BoomIcon:Hide()
		unitFrame.BoomIcon:SetTexture(nil)
	end
	if UnitClassification(unit) and classtex[UnitClassification(unit)] then
		local tex, a, b, c, d = unpack(classtex[UnitClassification(unit)])
		unitFrame.TypeIcon:Show()
		unitFrame.TypeIcon:SetTexture(tex)
		unitFrame.TypeIcon:SetTexCoord(a, b, c, d)
	else
		unitFrame.TypeIcon:Hide()
		unitFrame.TypeIcon:SetTexture(nil)
	end
end

local function UpdateInVehicle(unitFrame)
	if UnitHasVehicleUI(unitFrame.unit) then
		if not unitFrame.inVehicle then
			unitFrame.inVehicle = true
			local prefix, id, suffix = string.match(unitFrame.unit, "([^%d]+)([%d]*)(.*)")
			unitFrame.displayedUnit = prefix.."pet"..id..suffix
			UpdateNamePlateEvents(unitFrame)
		end
	else
		if unitFrame.inVehicle then
			unitFrame.inVehicle = false
			unitFrame.displayedUnit = unitFrame.unit
			UpdateNamePlateEvents(unitFrame)
		end
	end
end

-- Name-only mode / 名字模式
local function UpdateforNamemod(unitFrame)
	if not MaoRUIPerDB["Nameplate"]["nameonly"] then return end
	local unit = unitFrame.displayedUnit
	
	if UnitIsPlayer(unit) and UnitReaction(unit, "player") >= 5 and not UnitIsUnit(unit, "player") then
		if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
			unitFrame.healthperc:Hide()
		else
			unitFrame.healthBar:Hide()
		end
		unitFrame.castBar:UnregisterAllEvents()
	else
		if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
			unitFrame.healthperc:Show()
		else
			unitFrame.healthBar:Show()
		end
	end
end



local function UpdateAll(unitFrame)
	UpdateInVehicle(unitFrame)
	if ( UnitExists(unitFrame.displayedUnit) ) then
		UpdateCastBar(unitFrame)
		UpdateSelectionHighlight(unitFrame)
		UpdateName(unitFrame)
		UpdateHealthColor(unitFrame)
		UpdateHealth(unitFrame)
		UpdateBuffs(unitFrame)
		UpdateRaidTarget(unitFrame)
		UpdateforNamemod(unitFrame)
		if UnitIsUnit("player", unitFrame.displayedUnit) then
			unitFrame.castBar:UnregisterAllEvents()
			if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
				unitFrame.healthBar.value:Hide()
			end
		else
			if not MaoRUIPerDB["Nameplate"]["Numberstyle"] then
				unitFrame.healthBar.value:Show()
			end
		end
	end
	
		if R.ShowPowerList[GetNPCID(UnitGUID(unitFrame.displayedUnit))] then
			UpdatePower(unitFrame)
		end
end

local function NamePlate_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4 = ...
	if event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" then
		UpdateName(self)
		UpdateSelectionHighlight(self)
	elseif event == "UPDATE_MOUSEOVER_UNIT" then
		UpdateMouseover(self)
	elseif event == "PLAYER_ENTERING_WORLD" then
		UpdateAll(self)
	elseif arg1 == self.unit or arg1 == self.displayedUnit then
		if event == "UNIT_HEALTH_FREQUENT" then
			UpdateHealth(self)
			UpdateSelectionHighlight(self)
		elseif event == "UNIT_AURA" then
			UpdateBuffs(self)
			UpdateSelectionHighlight(self)
		elseif event == "UNIT_THREAT_LIST_UPDATE" then
			UpdateHealthColor(self)
		elseif event == "UNIT_NAME_UPDATE" then
			UpdateName(self)
		elseif event == "UNIT_ENTERED_VEHICLE" or event == "UNIT_EXITED_VEHICLE" or event == "UNIT_PET" then
			UpdateAll(self)
		elseif event == "UNIT_POWER_FREQUENT" then
			if R.ShowPowerList[GetNPCID(UnitGUID(self.displayedUnit))] then
				UpdatePower(self)
			end
		end
	end
end

local function RegisterNamePlateEvents(unitFrame)
	unitFrame:RegisterEvent("UNIT_NAME_UPDATE")
	unitFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	unitFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	unitFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
	unitFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	unitFrame:RegisterEvent("UNIT_PET")
	unitFrame:RegisterEvent("UNIT_ENTERED_VEHICLE")
	unitFrame:RegisterEvent("UNIT_EXITED_VEHICLE")
	UpdateNamePlateEvents(unitFrame)
	unitFrame:SetScript("OnEvent", NamePlate_OnEvent)
end

local function UnregisterNamePlateEvents(unitFrame)
	unitFrame:UnregisterAllEvents()
	unitFrame:SetScript("OnEvent", nil)
end

local function SetUnit(unitFrame, unit)
	unitFrame.unit = unit
	unitFrame.displayedUnit = unit	 -- For vehicles
	unitFrame.inVehicle = false
	if unit then
		RegisterNamePlateEvents(unitFrame)
	else
		UnregisterNamePlateEvents(unitFrame)
	end
end


--[[ Driver frame ]]--

local function HideBlizzard()
	--if not MaoRUIPerDB["Nameplate"]["blzplates"] then
		NamePlateDriverFrame:UnregisterAllEvents()
	--end
	NamePlateDriverFrame.SetupClassNameplateBars = M.Dummy
	ClassNameplateManaBarFrame:Hide() --SetAlpha(0)
	--SystemFont_NamePlate:SetFont(GameFontHighlight:GetFont(), 16, "OUTLINE")
	
	-- No more smallplates
	local checkBox = InterfaceOptionsNamesPanelUnitNameplatesMakeLarger
	function checkBox.setFunc(value)
		if value == "1" then
			SetCVar("NamePlateHorizontalScale", checkBox.largeHorizontalScale)
			SetCVar("NamePlateVerticalScale", checkBox.largeVerticalScale)
		else
			SetCVar("NamePlateHorizontalScale", checkBox.normalHorizontalScale)
			SetCVar("NamePlateVerticalScale", checkBox.normalVerticalScale)
		end
		NamePlates_UpdateNamePlateOptions()
	end
end

local function OnUnitFactionChanged(unit)
	-- This would make more sense as a unitFrame:RegisterUnitEvent
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	if (namePlate) then
		UpdateName(namePlate.UnitFrame)
		UpdateHealthColor(namePlate.UnitFrame)
		UpdateforNamemod(namePlate.UnitFrame)
	end
end

local function OnUnitClassficationChanged(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	local ICONS = {
	[Enum.PvpUnitClassification.FlagCarrierHorde or 0] = "nameplates-icon-flag-horde",
	[Enum.PvpUnitClassification.FlagCarrierAlliance or 1] = "nameplates-icon-flag-alliance",
	[Enum.PvpUnitClassification.FlagCarrierNeutral or 2] = "nameplates-icon-flag-neutral",
	[Enum.PvpUnitClassification.CartRunnerHorde or 3] = "nameplates-icon-cart-horde",
	[Enum.PvpUnitClassification.CartRunnerAlliance or 4] = "nameplates-icon-cart-alliance",
	[Enum.PvpUnitClassification.AssassinHorde or 5] = "nameplates-icon-bounty-horde",
	[Enum.PvpUnitClassification.AssassinAlliance or 6] = "nameplates-icon-bounty-alliance",
	[Enum.PvpUnitClassification.OrbCarrierBlue or 7] = "nameplates-icon-orb-blue",
	[Enum.PvpUnitClassification.OrbCarrierGreen or 8] = "nameplates-icon-orb-green",
	[Enum.PvpUnitClassification.OrbCarrierOrange or 9] = "nameplates-icon-orb-orange",
	[Enum.PvpUnitClassification.OrbCarrierPurple or 10] = "nameplates-icon-orb-purple",
  }
	if (namePlate) then
		local icon = ICONS[UnitPvpClassification(unit)]
		if(icon) then
			namePlate.UnitFrame.PvPClassificationIndicator:SetAtlas(icon)
			namePlate.UnitFrame.PvPClassificationIndicator:Show()
		else
			namePlate.UnitFrame.PvPClassificationIndicator:Hide()
		end

		if MaoRUIPerDB["Nameplate"]["Numberstyle"] then
			if unitFrame.iconnumber and unitFrame.iconnumber > 0 then -- 有图标
				namePlate.UnitFrame.PvPClassificationIndicator:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, MaoRUIPerDB["Nameplate"]["AuraSize"])
			else
				namePlate.UnitFrame.PvPClassificationIndicator:SetPoint("BOTTOM", unitFrame.healthperc, "TOP", 0, 0)
			end
		end
	end
end

local function OnRaidTargetUpdate()
	for _, namePlate in pairs(C_NamePlate.GetNamePlates()) do
		UpdateRaidTarget(namePlate.UnitFrame)
	end
end


-- Driver frame
local function NamePlates_UpdateNamePlateOptions()
	-- Called at VARIABLES_LOADED and by "Larger Nameplates" interface options checkbox
	local baseNamePlateWidth = MaoRUIPerDB["Nameplate"]["Width"]
	local horizontalScale = tonumber(GetCVar("NamePlateHorizontalScale"))
	C_NamePlate.SetNamePlateEnemySize(baseNamePlateWidth * horizontalScale, 43)
	C_NamePlate.SetNamePlateFriendlySize(baseNamePlateWidth * horizontalScale, 43)
	C_NamePlate.SetNamePlateSelfSize(baseNamePlateWidth * horizontalScale, 43)

	for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
		UpdateAll(namePlate.UnitFrame)
	end
end

local function OnNamePlateCreated(namePlate)
	namePlate.Pools = CreatePoolCollection() 
	
	if MaoRUIPerDB["Nameplate"]["Numberstyle"] then -- 数字样式
		namePlate.Pools:CreatePool("Button", namePlate, "NumberStyleNameplateTemplate")
		namePlate.UnitFrame = namePlate.Pools:Acquire("NumberStyleNameplateTemplate")
		namePlate.UnitFrame:SetAllPoints(namePlate)
		namePlate.UnitFrame:SetFrameLevel(namePlate:GetFrameLevel())
		namePlate.UnitFrame:Show()
		namePlate.UnitFrame.Pools = CreatePoolCollection() 
		namePlate.UnitFrame.Pools:CreatePool("Frame", namePlate, "AuraIconTemplate")
		
		if (GetCVar("nameplateResourceOnTarget") == "1") then
			namePlate.UnitFrame.castBar:SetPoint("TOP", namePlate.UnitFrame.name, "BOTTOM", 0, -3)
		else
			namePlate.UnitFrame.castBar:SetPoint("TOP", namePlate.UnitFrame.name, "BOTTOM", 0, -1)
		end		
	else -- 条形样式
		namePlate.Pools:CreatePool("Button", namePlate, "BarStyleNameplateTemplate")
		namePlate.UnitFrame = namePlate.Pools:Acquire("BarStyleNameplateTemplate")
		namePlate.UnitFrame:SetAllPoints(namePlate)
		namePlate.UnitFrame:SetFrameLevel(namePlate:GetFrameLevel())
		namePlate.UnitFrame:Show()
		namePlate.UnitFrame.Pools = CreatePoolCollection() 
		namePlate.UnitFrame.Pools:CreatePool("Frame", namePlate, "AuraIconTemplate")
		namePlate.UnitFrame.healthBar:SetHeight(MaoRUIPerDB["Nameplate"]["Height"])
		
		if (GetCVar("nameplateResourceOnTarget") == "1") then
			namePlate.UnitFrame.castBar:SetPoint("TOPLEFT", namePlate.UnitFrame.healthBar, "BOTTOMLEFT", 0, -6)
			namePlate.UnitFrame.castBar:SetPoint("TOPRIGHT", namePlate.UnitFrame.healthBar, "BOTTOMRIGHT", 0, -6)
			namePlate.UnitFrame.castBar.Icon:SetSize(18, 18)
		else
			namePlate.UnitFrame.castBar:SetPoint("TOPLEFT", namePlate.UnitFrame.healthBar, "BOTTOMLEFT", 0, -1)
			namePlate.UnitFrame.castBar:SetPoint("TOPRIGHT", namePlate.UnitFrame.healthBar, "BOTTOMRIGHT", 0, -1)
			namePlate.UnitFrame.castBar.Icon:SetSize(16, 16)
		end
	end
	
	namePlate.UnitFrame:EnableMouse(false)
end

local function OnNamePlateAdded(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	SetUnit(namePlate.UnitFrame, unit)
	UpdateAll(namePlate.UnitFrame)
end

local function OnNamePlateRemoved(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	SetUnit(namePlate.UnitFrame, nil)
end

	-- CVars (Default: .08, .1, 60, .8, 1.1, .5)
local function defaultcvar()
	if MaoRUIPerDB["Nameplate"]["InsideView"] then
		SetCVar("nameplateOtherTopInset", .05)
		SetCVar("nameplateOtherBottomInset", .08)
		SetCVar("nameplateLargeTopInset", .06) 
		SetCVar("nameplateLargeBottomInset", .09)
	else
		SetCVar("nameplateOtherTopInset", -1)
		SetCVar("nameplateOtherBottomInset", -1)
		SetCVar("nameplateLargeTopInset", -1) 
		SetCVar("nameplateLargeBottomInset", -1)
	end
	SetCVar("nameplateMaxDistance", MaoRUIPerDB["Nameplate"]["Distance"])
	--fix fps drop
	SetCVar("namePlateMinScale", 1)  --default is 0.8
	SetCVar("namePlateMaxScale", 1)
	--SetCVar("nameplateLargerScale", 1)					-- default is 1.2
	SetCVar("nameplateSelectedScale", 1.43)
	SetCVar("nameplateOverlapH",  0.6) --default is 0.8
	SetCVar("nameplateOverlapV",  0.8) --default is 1.1
	SetCVar("nameplateMinAlpha", MaoRUIPerDB["Nameplate"]["MinAlpha"])
	-- 障礙物後的名條透名度
	SetCVar("nameplateOccludedAlphaMult", 0.2)			-- default is 0.4
	C_NamePlate.SetNamePlateFriendlyClickThrough(false)
	C_NamePlate.SetNamePlateEnemyClickThrough(false)
	C_NamePlate.SetNamePlateSelfClickThrough(false)
	-- 個人資源顯示條件
	SetCVar("nameplateSelfAlpha", 1)
	SetCVar("nameplatePersonalShowAlways", 0)
	SetCVar("nameplatePersonalShowInCombat", 1)
	SetCVar("nameplatePersonalShowWithTarget", 1)
	SetCVar("nameplatePersonalHideDelaySeconds", 3)
	-- 敵方顯示條件
	SetCVar("nameplateShowEnemyGuardians", 1)			-- 守護者
	SetCVar("nameplateShowEnemyMinions", 1)				-- 僕從
	--SetCVar("nameplateShowEnemyPets", 0)				-- 寵物
	SetCVar("nameplateShowEnemyTotems", 1)				-- 圖騰
	--SetCVar("nameplateShowEnemyMinus", 1				-- 次要
	-- 友方顯示條件
	SetCVar("nameplateShowFriendlyGuardians", 0)		-- 守護者
	SetCVar("nameplateShowFriendlyMinions", 0)			-- 僕從
	SetCVar("nameplateShowFriendlyNPCs", 0)				-- npc
	SetCVar("nameplateShowFriendlyPets", 0)				-- 寵物
	SetCVar("nameplateShowFriendlyTotems", 0)			-- 圖騰
end 
	
local function NamePlates_OnEvent(self, event, ...) 
	if not MaoRUIPerDB["Nameplate"]["Enable"] then
		self:UnregisterAllEvents()
		return
	end

	if ( event == "VARIABLES_LOADED" ) then
		HideBlizzard()
		--if MaoRUIPerDB["Nameplate"]["blzplates"] and MaoRUIPerDB["Nameplate"]["blzplates_nameonly"] then
			--SetCVar("nameplateShowOnlyNames", 1)
		--else
			--SetCVar("nameplateShowOnlyNames", 0)
		--end
		NamePlates_UpdateNamePlateOptions()
	elseif event == "NAME_PLATE_CREATED" then
		local namePlate = ...
		OnNamePlateCreated(namePlate)
	elseif event == "NAME_PLATE_UNIT_ADDED" then
		local unit = ...
		OnNamePlateAdded(unit)
	elseif event == "NAME_PLATE_UNIT_REMOVED" then
		local unit = ...
		OnNamePlateRemoved(unit)
	elseif event == "RAID_TARGET_UPDATE" then
		OnRaidTargetUpdate()
	elseif event == "DISPLAY_SIZE_CHANGED" then
		NamePlates_UpdateNamePlateOptions()
	elseif event == "UNIT_FACTION" then
		OnUnitFactionChanged(...)
	elseif event == "PLAYER_ENTERING_WORLD" then
		defaultcvar()
	end
end

local NamePlatesFrame = CreateFrame("Frame", "NamePlatesFrame", UIParent)
	NamePlatesFrame:SetScript("OnEvent", NamePlates_OnEvent)
	NamePlatesFrame:RegisterEvent("VARIABLES_LOADED")
	NamePlatesFrame:RegisterEvent("NAME_PLATE_CREATED")
	NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
	NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
	NamePlatesFrame:RegisterEvent("CVAR_UPDATE")
	NamePlatesFrame:RegisterEvent("DISPLAY_SIZE_CHANGED")
	NamePlatesFrame:RegisterEvent("RAID_TARGET_UPDATE")
	NamePlatesFrame:RegisterEvent("UNIT_FACTION")
	NamePlatesFrame:RegisterEvent("UNIT_AURA")
	NamePlatesFrame:RegisterEvent("PLAYER_ENTERING_WORLD")