if not RDCD then return end
local RDCD = RDCD
local LGIST=LibStub:GetLibrary("LibGroupInSpecT-1.1")
local addon_name = "Garan-RaidCooldown"

local activebars = {}
local font = GameFontHighlight:GetFont()

function RDCD:OnUpdate(event, info)
    local baseclass = info.class							  	
    local name = info.name
    local spec_id = info.global_spec_id
    local talents = info.talents
    local guid = info.guid
	if not baseclass or not guid or not spec_id or not talents or not guid then return end	
	local  _,classFilename = GetPlayerInfoByGUID(guid)

	RDCD['raidRoster'][guid] = RDCD['raidRoster'][guid] or {}
	RDCD['raidRoster'][guid]['name'] = name
	RDCD['raidRoster'][guid]['class']= classFilename
	RDCD['raidRoster'][guid]['spec'] = spec_id
	RDCD['raidRoster'][guid]['talents'] = talents
end

function RDCD:OnRemove(guid)
	if(guid) then
	    local  _,classFilename = GetPlayerInfoByGUID(guid)
	    RDCD['raidRoster'][guid] = nil
	else
		RDCD['raidRoster'] = {}
	end
end


local function SendMsg(msg)
	local chatchannel
	if HasLFGRestrictions() then
		chatchannel = "INSTANCE_CHAT"
	elseif IsInRaid() then
		chatchannel = "RAID"
	else
		chatchannel = "SAY"
	end
	SendChatMessage(msg, chatchannel)
end

function RDCD:StartCD(bar)
	local player = select(6, GetPlayerInfoByGUID(bar.guid)) or ""
	
	if RDCDDB["boardcast"]["use"] then
		--print(format(RDCD.L["使用了"], player, GetSpellLink(bar.spell)))
		SendMsg(format(RDCD.L["使用了"], player, GetSpellLink(bar.spell)))
	end

	if RDCD.cooldownRoster[bar.spell][bar.guid]["stack"] then
		if bar.stack == bar.maxstack then
			bar.endTime = GetTime() + bar.cd
			if RDCD.cooldownReduction[bar.spell] then
				if RDCD['raidRoster'][bar.guid]['spec'] == RDCD.cooldownReduction[bar.spell]['spec'] then
					bar.endTime = GetTime() + RDCD.cooldownReduction[bar.spell]['CD']
				end
			end
		end
		
		bar.stack = bar.stack - 1
		bar.stacktext:SetText(bar.stack)
		
		bar:SetScript("OnUpdate", function(self, elapsed)
			self.timer = (self.timer and self.timer + elapsed) or 0
			if self.timer > 1 then
				local now = GetTime()
				if self.endTime - now < 0 then
				
					self.stack  = self.stack + 1
					self.stacktext:SetText(self.stack)
					
					if self.stack == self.maxstack then
						self:SetScript("OnUpdate", nil)
						self.status:SetAlpha(1)
						self.right:SetText(nil)
						if RDCDDB["boardcast"]["ready"] then
							--print(format(RDCD.L["已就绪"], player, GetSpellLink(bar.spell)))
							SendMsg(format(RDCD.L["已就绪"], player, GetSpellLink(bar.spell)))
						end
						return
					else
						self.status:SetAlpha(1)
						self.endTime = now + self.cd
						if RDCD.cooldownReduction[self.spell] then
							if RDCD['raidRoster'][self.guid]['spec'] == RDCD.cooldownReduction[self.spell]['spec'] then
								self.endTime = now + RDCD.cooldownReduction[self.spell]['CD']
							end
						end
						self.status:SetValue(self.cd-(self.endTime - now))
						self.right:SetText(RDCD.FormatTime(self.endTime - now))
					end
					
				end
				self.status:SetValue(self.cd-(self.endTime - now))
				self.right:SetText(RDCD.FormatTime(self.endTime - now))
			end
		end)		
	else
		bar.endTime = GetTime() + bar.cd
		if RDCD.cooldownReduction[bar.spell] then
			if RDCD['raidRoster'][bar.guid]['spec'] == RDCD.cooldownReduction[bar.spell]['spec'] then
				bar.endTime = GetTime() + RDCD.cooldownReduction[bar.spell]['CD']
			else
				local talent = RDCD.cooldownReduction[bar.spell]['talent']
				if RDCD['raidRoster'][bar.guid]['talents'][talent] then
					bar.endTime = GetTime() + RDCD.cooldownReduction[bar.spell]['CD']
				end
			end
		end
		bar:SetScript("OnUpdate", function(self, elapsed)
			self.timer = (self.timer and self.timer + elapsed) or 0
			if self.timer > 1 then
				local now = GetTime()
				if self.endTime - now < 0 then
					self:SetScript("OnUpdate", nil)
					self.status:SetAlpha(1)
					self.right:SetText(nil)
					if RDCDDB["boardcast"]["ready"] then
						--print(format(RDCD.L["已就绪"], player, GetSpellLink(bar.spell)))
						SendMsg(format(RDCD.L["已就绪"], player, GetSpellLink(bar.spell)))
					end
					return
				end
				self.status:SetValue(self.cd-(self.endTime - now))
				self.right:SetText(RDCD.FormatTime(self.endTime - now))
			end
		end)
	end
	
	if bar.stack and bar.stack > 0 then
		bar.status:SetAlpha(1)
	else
		bar.status:SetAlpha(.5)
	end	
	
	if bar.status2 then
		bar.status2:Show()
		bar.status2.endTime = GetTime() + bar.status2.cast
		bar.status2:SetScript("OnUpdate", function(self, elapsed)
			self.timer = (self.timer and self.timer + elapsed) or 0
			if self.timer > .5 then
				local now = GetTime()
				if self.endTime - now < 0 then
					self:Hide()
					self:SetScript("OnUpdate", nil)
					return
				end
				self:SetValue(self.cast-(self.endTime - now))
			end
		end)
	end
end

function RDCD:SetBarsSize()
	for i = 1, #activebars do
		activebars[i]:SetSize(RDCDDB["width"], RDCDDB["height"])
		activebars[i].groupind_button:SetSize(RDCDDB["height"], RDCDDB["height"])
		activebars[i].groupind_button.text:SetFont(font, RDCDDB["height"]-3, "OUTLINE")
		activebars[i].icon:SetSize(RDCDDB["height"], RDCDDB["height"])
		activebars[i].status:SetHeight(RDCDDB["height"])
		activebars[i].left:SetFont(font, RDCDDB["height"]-5, "OUTLINE")
		activebars[i].right:SetFont(font, RDCDDB["height"]-5, "OUTLINE")
	end
end

function RDCD:ArrangeBarsAnchors()
	sort(activebars, function(a, b) return (a.groupind < b.groupind) or (a.groupind == b.groupind and a.index < b.index) or (a.groupind == b.groupind and a.index == b.index and a.guid< b.guid) end)
	if a then		
		for i = 1, #activebars do
			activebars[i]:ClearAllPoints()
			if i == 1 then
				activebars[i]:SetPoint("TOPLEFT", RDCD.frame, "BOTTOMLEFT", 0, -5)
			elseif math.fmod(i,RDCDDB["maxline"]) == 1 then
				activebars[i]:SetPoint("TOPLEFT", activebars[i-RDCDDB["maxline"]], "TOPRIGHT", 8, 0)
			else
				activebars[i]:SetPoint("TOPLEFT", activebars[i-1], "BOTTOMLEFT", 0, -5)
			end
		end
	else
		local loc = 0
		for i = 1, #activebars do
			if activebars[i].groupind >= loc then
				activebars[i]:SetPoint("TOPLEFT", RDCD.frame, "BOTTOMLEFT", loc*(RDCDDB["width"] + RDCDDB["height"] + 6), -5)
				loc = loc + 1
			else
				activebars[i]:SetPoint("TOPLEFT", activebars[i-1], "BOTTOMLEFT", 0, -5)
			end
		end
	end
end

function RDCD:SetGroupIndex(bar)
	if bar.groupind == 0 then
		bar.groupind_button.text:SetText(" ")
	elseif bar.groupind == 1 then
		bar.groupind_button.text:SetText("|cFFFF00001|r")
	elseif bar.groupind == 2 then
		bar.groupind_button.text:SetText("|cFFFFFF002|r")
	elseif bar.groupind == 3 then
		bar.groupind_button.text:SetText("|cFF00FFFF3|r")
	elseif bar.groupind == 4 then
		bar.groupind_button.text:SetText("|cFF00FF004|r")
	elseif bar.groupind == 5 then
		bar.groupind_button.text:SetText("|cFFCD00CD5|r")
	elseif bar.groupind == 6 then
		bar.groupind_button.text:SetText("|cFFDC143C6|r")
	elseif bar.groupind == 7 then
		bar.groupind_button.text:SetText("|cFFBDB76B7|r")
	elseif bar.groupind == 8 then
		bar.groupind_button.text:SetText("|cFFEE00008|r")
	elseif bar.groupind == 9 then
		bar.groupind_button.text:SetText("|cFF00FA9A9|r")
	elseif bar.groupind == 10 then
		bar.groupind_button.text:SetText("|cFFFFFFFF10|r")
	end
end

function RDCD:GroupIndexButton_OnMouseWheel(bar, delta)
	if delta < 0 then
		if bar.groupind < RDCDDB["maxgroup"] then
			bar.groupind = bar.groupind + 1
		else
			bar.groupind = 0
		end
	elseif delta > 0 then
		if bar.groupind > 0 then
			bar.groupind = bar.groupind - 1
		else
			bar.groupind = RDCDDB["maxgroup"]
		end
	end
	RDCD:SetGroupIndex(bar)
	RDCD:ArrangeBarsAnchors()
end

local ancind
function RDCD:GroupIndexButton_OnClick(self, button)
	if RDCDDB["clickable"] then
		
		if button == "LeftButton" then
			local player = select(6, GetPlayerInfoByGUID(self.guid)) or ""
			if UnitInRaid(player) or UnitInParty(player) then
				if self.right:GetText() then
					--print(format(RDCD.L["技能冷却"], player, GetSpellLink(self.spell), self.right:GetText()))
					SendMsg(format(RDCD.L["技能冷却"], player, GetSpellLink(self.spell), self.right:GetText()))
				else
					--print(format(RDCD.L["已就绪"], player, GetSpellLink(self.spell)))
					SendMsg(format(RDCD.L["已就绪"], player, GetSpellLink(self.spell)))
				end
			else
				print(RDCD.L["|cffA6FFFFGaran-团队冷却|r："]..player..RDCD.L["不在队伍中"])
			end
		else
			ancind = 1
			for i = 1, #activebars do
				local player = select(6, GetPlayerInfoByGUID(activebars[i].guid)) or ""
				if UnitInRaid(player) or UnitInParty(player) then
					if activebars[i].groupind ~= 0 then
						if activebars[i].groupind >= ancind then
							--print("<<-------[ "..activebars[i].groupind..RDCD.L["减伤分组"].." ]------->>")
							--print(player..":"..GetSpellLink(activebars[i].spell))
							
							SendMsg("<<-------[ "..activebars[i].groupind..RDCD.L["减伤分组"].." ]------->>")
							SendMsg(player..":"..GetSpellLink(activebars[i].spell))
							ancind = activebars[i].groupind+1
						else
							--print(player..":"..GetSpellLink(activebars[i].spell))
							
							SendMsg(player..":"..GetSpellLink(activebars[i].spell))
						end
					end
				else
					print(RDCD.L["|cffA6FFFFGaran-团队冷却|r："]..player..RDCD.L["不在队伍中"])
				end
			end
		end
	end
end

function RDCD:CreatCooldownBar(guid, spellID, cooldown)
	local bar = CreateFrame("Frame", nil, RDCD.frame)
	
	bar.cd = cooldown.CD
	bar.index = cooldown.index
	bar.groupind = 0
	bar.spell = spellID
	bar.guid = guid
	
	if cooldown.stack then
		bar.stack = cooldown.stack
		bar.maxstack = cooldown.stack
	end
	
	bar:SetSize(RDCDDB["width"], RDCDDB["height"])
	
	bar.groupind_button = CreateFrame("Button", nil, bar)
	bar.groupind_button:SetSize(RDCDDB["height"], RDCDDB["height"])
	bar.groupind_button:SetPoint("BOTTOMLEFT", 0, 0)
	
	bar.groupind_button.texture = bar.groupind_button:CreateTexture(nil, "BORDER")
	bar.groupind_button.texture:SetAllPoints(bar.groupind_button)
	bar.groupind_button.texture:SetTexture("Interface\\Buttons\\WHITE8x8")
	bar.groupind_button.texture:SetVertexColor(1, 1, 1, .8)
	bar.groupind_button.texture:Hide()
	
	bar.groupind_button.text = RDCD.createtext(bar.groupind_button, "OVERLAY", RDCDDB["height"]-3, "OUTLINE", "RIGHT")
	bar.groupind_button.text:SetPoint('RIGHT', bar.groupind_button, 'RIGHT')
	RDCD:SetGroupIndex(bar)
	
	bar.icon = CreateFrame("Button", nil, bar)
	bar.icon:SetSize(RDCDDB["height"], RDCDDB["height"])
	bar.icon:SetPoint("BOTTOMLEFT", bar.groupind_button, "BOTTOMRIGHT", 5, 0)
	bar.icon:SetNormalTexture(select(3, GetSpellInfo(spellID)))
	bar.icon:GetNormalTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)
	RDCD.createborder(bar.icon)
	
	bar.stacktext = RDCD.createtext(bar.icon, "OVERLAY", RDCDDB["height"]-5, "OUTLINE", "CENTER")
	bar.stacktext:SetPoint('CENTER', bar.icon, 0, 0)

	if RDCD.cooldownRoster[bar.spell][bar.guid]["stack"] then
		bar.stacktext:SetText(bar.stack)
	end
	
	bar.status = CreateFrame("Statusbar", nil, bar)
	bar.status:SetPoint("BOTTOMLEFT", bar.icon, "BOTTOMRIGHT", 5, 0)
	bar.status:SetPoint("BOTTOMRIGHT", 0, 0)
	bar.status:SetHeight(RDCDDB["height"])
	bar.status:SetStatusBarTexture("Interface\\AddOns\\Garan-RaidCooldown\\media\\statusbar")
	bar.status:SetStatusBarColor(RAID_CLASS_COLORS[cooldown["class"]].r, RAID_CLASS_COLORS[cooldown["class"]].g , RAID_CLASS_COLORS[cooldown["class"]].b)
	bar.status:SetMinMaxValues(0, bar.cd)
	RDCD.createborder(bar.status)
	
	if cooldown.cast then
		bar.status2 = CreateFrame("Statusbar", nil, bar)
		bar.status2.cast = cooldown.cast
		bar.status2:SetAllPoints(bar.status)
		bar.status2:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
		bar.status2:SetStatusBarColor(0, 1, 0)
		bar.status2:SetMinMaxValues(0, bar.status2.cast)
		bar.status2:Hide()
	end
	
	local playername = select(6, GetPlayerInfoByGUID(guid))
	
	bar.left = RDCD.createtext(bar.status, "OVERLAY", RDCDDB["height"]-5, "OUTLINE", "LEFT")
	bar.left:SetPoint('LEFT', bar.status, 2, 1)
	if UnitIsDeadOrGhost(playername) then
		bar.left:SetText(playername.." |cFFFF0000DEAD|r")
	else
		bar.left:SetText(playername)
	end
	
	bar.right = RDCD.createtext(bar.status, "OVERLAY", RDCDDB["height"]-5, "OUTLINE", "RIGHT")
	bar.right:SetPoint('RIGHT', bar.status, -2, 1)
	
	bar:SetScript('OnMouseWheel', function(self, delta)
		RDCD:GroupIndexButton_OnMouseWheel(bar, delta)
	end)
	bar:SetScript("OnMouseDown", function(self, button)
		RDCD:GroupIndexButton_OnClick(self, button)
	end)
	bar:SetScript("OnEnter", function(self) self.groupind_button.texture:Show() end)
	bar:SetScript("OnLeave", function(self) self.groupind_button.texture:Hide() end)
	
	bar:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	bar:RegisterEvent("UNIT_HEALTH")
	bar:SetScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local timestamp, type , _,  sourceGUID, soureName, _, _, destGUID, destName, _, _, spell, spellName = ...
			if type == cooldown.succ and sourceGUID == guid and spell == spellID then
				RDCD:StartCD(self)
			end
		elseif event == "UNIT_HEALTH" then
			if UnitIsDeadOrGhost(playername) then
				self.left:SetText(playername.." |cFFFF0000DEAD|r")
			else
				self.left:SetText(playername)
			end
		end
	end)

	tinsert(activebars, bar)
	return bar
end

function RDCD:UpdateBars()
	for spellID, players in pairs(RDCD.cooldownRoster) do
		for guid, v in pairs(players) do
			if not players[guid]["created"] then
				local cooldown = RDCD.cooldowns[spellID]
				RDCD:CreatCooldownBar(guid, spellID, cooldown)
				players[guid]["created"] = true
			end
		end
	end
end

function RDCD:RemoveGroupIndex(index)
	for i = 1, #activebars do
		if activebars[i].groupind > index then
			activebars[i].groupind = 0
			RDCD:SetGroupIndex(activebars[i])
		end
	end
	RDCD:ArrangeBarsAnchors()
end

function RDCD:ApplySavedGroup(savedgroup) -- 整个人都不好了...
	RDCD:RemoveGroupIndex(0)
	for a = 1,9 do
		local Spells = {}
		local str = savedgroup["group"..a]
		local spells = {string.split(",", str)}
		for n = 1, #spells do -- 剔除""
			if spells[n] ~= "" then
				table.insert(Spells, spells[n])
			end
		end
		if #Spells > 0 then
			for s = 1, #Spells do
				for i = 1, #activebars do
					if activebars[i].groupind == 0 and activebars[i].spell == RDCD.CDSpells[Spells[s]] then
						activebars[i].groupind = a
						RDCD:SetGroupIndex(activebars[i])
						break
					end	
				end
			end
		end
	end
	RDCD:ArrangeBarsAnchors()
end

function RDCD:GetCurrentGroupingSettings()
	if #activebars == 0 then return end
	for i = 1, 9 do
		RDCDDB["editbox"]["group"..i] = ""
	end
	for i = 1, #activebars do
		if activebars[i].groupind > 0 then
			local ind = activebars[i].groupind
			local spell = activebars[i].spell
			RDCDDB["editbox"]["group"..ind] = RDCDDB["editbox"]["group"..ind]..GetSpellInfo(spell)..","
		end
	end
end

function RDCD:RemoveInvalidBar()
	for i = 1, #activebars do
		if not activebars[i] then return end
		if not RDCD.cooldownRoster[activebars[i].spell][activebars[i].guid] then
			activebars[i]:Hide()
			activebars[i]:SetScript("OnEvent", nil)
			activebars[i]:SetScript("OnUpdate", nil)
			tremove(activebars, i)
		elseif RDCD.cooldownRoster[activebars[i].spell][activebars[i].guid]["stack"] then
			activebars[i].stacktext:SetText(activebars[i].stack)
		else
			activebars[i].stacktext:SetText("")
		end
	end
end

function RDCD:IsActive(i)
	local player = select(6, GetPlayerInfoByGUID(i))
	if IsInRaid() and UnitInRaid(player) then -- 我在团队
		if RDCDDB["onlyactive"] and select(3, GetRaidRosterInfo(UnitInRaid(player)))>4 then
			return false
		else
			return true
		end
	elseif not IsInRaid() and UnitInParty(player) then -- 我在小队
		return true
	end
end

function RDCD:GetRaidCooldown(spellID, cooldown)
	if IsInGroup() then
		if RDCD.cooldownRoster[spellID] then
			for i, v in pairs(RDCD.cooldownRoster[spellID]) do
				if not RDCD:IsActive(i) then
					RDCD.cooldownRoster[spellID][i] = nil
				end
			end
		else
			print(spellID.."bug")
		end
		for i, char in pairs(RDCD['raidRoster']) do
			if RDCD:IsActive(i) then
				if(string.lower(char["class"]:gsub(" ", ""))==string.lower(cooldown["class"]):gsub(" ", "")) then
					local pass_spec, pass_talent = true, true
					if cooldown["spec"] and char["spec"] then
						if char["spec"] == cooldown["spec"] then 
							pass_spec = true
						else
							pass_spec = false
						end
					elseif cooldown["nospec"] and char["spec"] then
						if char["spec"] ~= cooldown["nospec"] then 
							pass_spec = true
						else
							pass_spec = false
						end
					end
					
					if cooldown["talent"] and char["talents"] then
						local talent = cooldown["talent"]
						if char["talents"][talent] then
							pass_talent = true
						else
							pass_talent = false
						end
					end
					
					if pass_spec and pass_talent then
						if not RDCD.cooldownRoster[spellID][i] then
							RDCD.cooldownRoster[spellID][i] = {}
							RDCD.cooldownRoster[spellID][i]["created"] = false
						end
					else
						if RDCD.cooldownRoster[spellID][i] then
							RDCD.cooldownRoster[spellID][i] = nil
						end
					end
					
					if cooldown["special_talent_id"] and cooldown["stack"] and char["talents"] then
						local sp_id = cooldown["special_talent_id"]
						if RDCD.cooldownRoster[spellID][i] then
							if char["talents"][sp_id] then -- 有充能天赋
								RDCD.cooldownRoster[spellID][i]["stack"] = true
							else
								RDCD.cooldownRoster[spellID][i]["stack"] = false
							end
						end
					end
				end
			else
				if RDCD.cooldownRoster[spellID] then
					if RDCD.cooldownRoster[spellID][i] then
						RDCD.cooldownRoster[spellID][i] = nil
					end
				else
					print(spellID.."bug")
				end
			end
		end
	else
		RDCD.cooldownRoster[spellID] = {}
		RDCD:ArrangeBarsAnchors()
	end
end

function RDCD:OnInitialize()
	if GetGuildInfo("player") == "黎明曙光" or GetGuildInfo("player") == "炼 狱" then
		print("|cffA6FFFFGaran-团队冷却|r: 既然都看不起我那么就不要用我写的插件了。再见！")
		return
	elseif GetGuildInfo("player") == "浮云" then
		print("|cffA6FFFFGaran-团队冷却|r: 弄插件嘛，找痒痒，做插件厉害的。别用我的，很低端。")
		return
	else
		print(RDCD.L["|cffA6FFFFGaran-团队冷却|r："]..GetAddOnMetadata("Garan-RaidCooldown", "Version").."|r /rdcd")
	end
	
	if RDCDDB == nil then
		RDCD.ResetVariables()
	end
	RDCD.LoadVariables()
	
	RDCD.heightslider:HookScript("OnValueChanged", function() RDCD:SetBarsSize() end)
	RDCD.widthslider:HookScript("OnValueChanged", function() RDCD:SetBarsSize() end)
	RDCD.maxgroupslider:HookScript("OnValueChanged", function(self, getvalue) RDCD:RemoveGroupIndex(getvalue) end)
	RDCD.maxlineslider:HookScript("OnValueChanged", function() RDCD:ArrangeBarsAnchors() end)

	RDCD.raidRoster = {}
	RDCD.cooldownRoster = {}
	
	for k, v in pairs(RDCDDB["savedgrouping"]) do
		RDCD:CreateSavedButton(k)
	end
	
	LGIST.RegisterCallback (RDCD, "GroupInSpecT_Update", function(event, ...)
		RDCD.OnUpdate(...)
		for spellID, cooldown in pairs(RDCD.cooldowns) do
			if RDCDDB["spells"][spellID] then
				RDCD:GetRaidCooldown(spellID, cooldown)
			end
		end
		RDCD:UpdateBars()
		RDCD:RemoveInvalidBar()
		RDCD:ArrangeBarsAnchors()
	end)
	LGIST.RegisterCallback (RDCD, "GroupInSpecT_Remove", function(...)
		RDCD.OnRemove(...)
		for spellID, cooldown in pairs(RDCD.cooldowns) do
			if RDCDDB["spells"][spellID] then
				RDCD:GetRaidCooldown(spellID, cooldown)
			end
		end
		RDCD:RemoveInvalidBar()
		RDCD:RemoveInvalidBar() -- 因为有时候移出不干净
		RDCD:ArrangeBarsAnchors()
	end)
	
	for spellID, cooldown in pairs(RDCD.cooldowns) do
		if RDCDDB["spells"][spellID] then
			RDCD.cooldownRoster[spellID] = {}
		end
    end
	
	if RDCDDB["locked"] then
		RDCD:LockFrame()
	else
		RDCD:UnlockFrame()
	end
end