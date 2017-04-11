local M, R, U, I = unpack(select(2, ...))
if I.MyClass ~= "HUNTER" then return end

-- Marksman Master
local IconSize = R.Auras.IconSize + 3
local bu, bar = {}
local function MarksmanGo()
	if bar then bar:Show() return end

	bar = CreateFrame("StatusBar", "NDui_Marksman", UIParent)
	bar:SetSize(IconSize*5+20, 6)
	bar:SetFrameStrata("HIGH")
	M.CreateSB(bar, true)
	bar.Count = M.CreateFS(bar, 18, "", false, "CENTER", 0, -5)

	local spells = {187131, 194594, 204147, 185901, 214579}
	for i = 1, 5 do
		bu[i] = CreateFrame("Frame", nil, UIParent)
		bu[i]:SetSize(IconSize, IconSize)
		bu[i]:SetFrameStrata("HIGH")
		M.CreateIF(bu[i])
		bu[i].Icon:SetTexture(GetSpellTexture(spells[i]))
		bu[i].Count = M.CreateFS(bu[i], 16, "")
		bu[i].Count:SetPoint("TOP", 0, 15)
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", bar, "TOPLEFT", 0, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 5, 0)
		end
	end

	M.Mover(bar, "射击助手", "Marksman", R.Auras.MarksmanPos, bar:GetWidth(), 30)
end

local f = MaoRUI:EventFrame({"PLAYER_LOGIN", "PLAYER_TALENT_UPDATE"})
f:SetScript("OnEvent", function(self, event)
	if not MaoRUISettingDB["Auras"]["Marksman"] then
		self:UnregisterAllEvents()
		return
	end

	if event == "PLAYER_LOGIN" or event == "PLAYER_TALENT_UPDATE" then
		if GetSpecializationInfo(GetSpecialization()) == 254 and UnitLevel("player") > 99 then
			MarksmanGo()
			for i = 1, 5 do bu[i]:Show() end

			self:RegisterEvent("UNIT_AURA")
			self:RegisterEvent("PLAYER_TARGET_CHANGED")
			self:RegisterEvent("UNIT_POWER_FREQUENT")
			self:RegisterEvent("SPELL_UPDATE_COOLDOWN")
		else
			for i = 1, 5 do
				if bu[i] then bu[i]:Hide() end
			end
			if bar then bar:Hide() end

			self:UnregisterEvent("UNIT_AURA")
			self:UnregisterEvent("PLAYER_TARGET_CHANGED")
			self:UnregisterEvent("UNIT_POWER_FREQUENT")
			self:UnregisterEvent("SPELL_UPDATE_COOLDOWN")
		end
	elseif event == "UNIT_POWER_FREQUENT" then
		local cur, max = UnitPower("player"), UnitPowerMax("player")
		bar:SetMinMaxValues(0, max)
		bar:SetValue(cur)
		bar.Count:SetText(cur)
		bar:SetAlpha(1)
		if cur > 94 then
			bar.Count:SetTextColor(1, 0, 0)
		elseif cur > 64 then
			bar.Count:SetTextColor(1, 1, 0)
		else
			bar.Count:SetTextColor(1, 1, 1)
			if cur < 50 then bar:SetAlpha(.5) end
		end
	else
		-- Vulnerable
		do
			local name, _, _, _, _, duration, expire, caster = UnitDebuff("target", GetSpellInfo(187131))
			if name and caster == "player" then
				bu[1]:SetAlpha(1)
				bu[1].CD:SetCooldown(expire-duration, duration)
			else
				bu[1]:SetAlpha(.5)
				bu[1].CD:SetCooldown(0, 0)
			end
		end

		-- Tier 30: Black Arrow, True Aim, Lock & Load
		do
			if IsPlayerSpell(194599) then
				local start, duration = GetSpellCooldown(194599)
				if start and duration > 1.5 then
					bu[2]:SetAlpha(.5)
					bu[2].CD:SetCooldown(start, duration)
				else
					bu[2]:SetAlpha(1)
					bu[2].CD:SetCooldown(0, 0)
				end
				bu[2].Count:SetText("")
				bu[2].Icon:SetTexture(GetSpellTexture(194599))
			elseif IsPlayerSpell(199527) then
				local name, _, _, count, _, duration, expire = UnitDebuff("target", GetSpellInfo(199803))
				if name then
					bu[2]:SetAlpha(1)
					bu[2].CD:SetCooldown(expire-duration, duration)
					bu[2].Count:SetText(count)
				else
					bu[2]:SetAlpha(.5)
					bu[2].CD:SetCooldown(0, 0)
					bu[2].Count:SetText("")
				end
				bu[2].Icon:SetTexture(GetSpellTexture(199803))
			else
				local name, _, _, count, _, duration, expire = UnitBuff("player", GetSpellInfo(194594))
				if name then
					bu[2]:SetAlpha(1)
					bu[2].CD:SetCooldown(expire-duration, duration)
					bu[2].Count:SetText(count)
				else
					bu[2]:SetAlpha(.5)
					bu[2].CD:SetCooldown(0, 0)
					bu[2].Count:SetText("")
				end
				bu[2].Icon:SetTexture(GetSpellTexture(194594))
			end
		end

		-- Windburst, MM's Artifact
		do
			if IsPlayerSpell(204147) then
				local start, duration = GetSpellCooldown(204147)
				if start and duration > 1.5 then
					bu[3]:SetAlpha(.5)
					bu[3].CD:SetCooldown(start, duration)
				else
					bu[3]:SetAlpha(1)
					bu[3].CD:SetCooldown(0, 0)
				end
			else
				bu[3]:SetAlpha(.5)
				bu[3].CD:SetCooldown(0, 0)
			end
		end

		-- Marked Shot
		do
			local name, _, _, _, _, duration, expire, caster = UnitDebuff("target", GetSpellInfo(185365))
			if name and caster == "player" then
				bu[4]:SetAlpha(1)
				bu[4].CD:SetCooldown(expire-duration, duration)
			else
				bu[4]:SetAlpha(.5)
				bu[4].CD:SetCooldown(0, 0)
			end
		end

		-- Sidewinders, spec at tier 100
		do
			if IsPlayerSpell(214579) then
				local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(214579)
				local start, duration = GetSpellCooldown(214579)
				bu[5].Count:SetText(charges)
				if charges < maxCharges and charges > 0 then
					StartChargeCooldown(bu[5], chargeStart, chargeDuration)
					bu[5].CD:SetCooldown(0, 0)
				elseif start and duration > 1.5 then
					ClearChargeCooldown(bu[5])
					bu[5].CD:SetCooldown(start, duration)
				elseif charges == maxCharges then
					ClearChargeCooldown(bu[5])
					bu[5].CD:SetCooldown(0, 0)
				end

				local hasBuff1 = UnitBuff("player", GetSpellInfo(223138))	-- Marking Targets
				local hasBuff2 = UnitBuff("player", GetSpellInfo(193526))	-- Trueshot
				if charges == maxCharges or hasBuff1 or hasBuff2 then
					bu[5].Count:SetTextColor(1, 0, 0)
					bu[5]:SetAlpha(1)
				else
					bu[5].Count:SetTextColor(1, 1, 1)
					bu[5]:SetAlpha(.5)
				end
				bu[5].Icon:SetTexture(GetSpellTexture(214579))
			elseif IsPlayerSpell(198670) then
				local start, duration = GetSpellCooldown(198670)
				if start and duration > 1.5 then
					bu[5]:SetAlpha(.5)
					bu[5].CD:SetCooldown(start, duration)
				else
					bu[5]:SetAlpha(1)
					bu[5].CD:SetCooldown(0, 0)
				end
				bu[5].Count:SetText("")
				bu[5].Icon:SetTexture(GetSpellTexture(198670))
			else
				local name, _, _, count, _, duration, expire = UnitBuff("player", GetSpellInfo(223138))
				if name then
					bu[5]:SetAlpha(1)
					bu[5].CD:SetCooldown(expire-duration, duration)
				else
					bu[5]:SetAlpha(.5)
					bu[5].CD:SetCooldown(0, 0)
				end
				bu[5].Count:SetText("")
				bu[5].Icon:SetTexture(GetSpellTexture(223138))
			end
		end
	end

	if not InCombatLockdown() then
		if not bar then return end
		for i = 1, 5 do
			bu[i]:SetAlpha(.1)
		end
		bar:SetAlpha(.1)
		bar.Count:SetText("")
		bu[5].Count:SetText("")
	end
end)

--PetHealthWarning------------------
local _,PetHealthAlert=...
local Frame=CreateFrame("ScrollingMessageFrame","!PHA",UIParent)	
Frame.Threshold=35
Frame.Warned=false
-- Initialize
function PetHealthAlert:Initialize()	
	Frame:SetWidth(450)
	Frame:SetHeight(200)
	Frame:SetPoint("CENTER",UIParent,"CENTER",0,360)	
	Frame:SetFont("Interface\\addons\\Ace3\\ShiGuang\\Media\\Fonts\\RedCircl.TTF",36,"THICKOUTLINE")
	Frame:SetShadowColor(0.00,0.00,0.00,0.75)
	Frame:SetShadowOffset(3.00,-3.00)
	Frame:SetJustifyH("CENTER")		
	Frame:SetMaxLines(2)
	--Frame:SetInsertMode("BOTTOM")
	Frame:SetTimeVisible(2)
	Frame:SetFadeDuration(1)		
	--HealthWatch:Update()
end
-- Update health warning
function PetHealthAlert:Update()	
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)<=Frame.Threshold and Frame.Warned==false)then
		PlaySoundFile("Interface\\AddOns\\Ace3\\ShiGuang\\Media\\Sounds\\Beep.ogg")	
		Frame:AddMessage("- CRITICAL PET HEALTH -", 1, 0, 0, nil, 3)
		Frame.Warned=true
		return
	end
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)>Frame.Threshold)then
		Frame.Warned=false
		return
	end	
end
-- Handle events
function PetHealthAlert:OnEvent(Event,Arg1,...)
	if(Event=="PLAYER_LOGIN")then
		PetHealthAlert:Initialize()
		return
	end	
	if(Event=="UNIT_HEALTH" and Arg1=="pet")then
		PetHealthAlert:Update()
		return
	end	
end
Frame:SetScript("OnEvent",PetHealthAlert.OnEvent)
Frame:RegisterEvent("PLAYER_LOGIN")
Frame:RegisterEvent("UNIT_HEALTH")


--StableHelper------------------

local MAX_PETS = (NUM_PET_ACTIVE_SLOTS + NUM_PET_STABLE_PAGES * NUM_PET_STABLE_SLOTS)
local EventFrame = CreateFrame("Frame")
-- per-char saved vars
StableHelperPerChar = StableHelperPerChar or {}
-- stores known talent trees for pets to return through GetStablePetInfo
StableHelperPerChar.knownPetTalentTrees = StableHelperPerChar.knownPetTalentTrees or {}
-- code to fix old versions (run once SavedVariables have been loaded)
function EventFrame:ADDON_LOADED(event, arg1)
  
  if not StableHelperPerChar.fixedSavedTalentsToDualSpec then
    for i = 1, #StableHelperPerChar.knownPetTalentTrees do
      if StableHelperPerChar.knownPetTalentTrees[i] then
        if type(StableHelperPerChar.knownPetTalentTrees[i]) == "number" then
          local old = StableHelperPerChar.knownPetTalentTrees[i]
          StableHelperPerChar.knownPetTalentTrees[i] = {}
          StableHelperPerChar.knownPetTalentTrees[i][GetActiveSpecGroup()] = old
        end
      end
    end
    StableHelperPerChar.fixedSavedTalentsToDualSpec = true
  end
end

-- maps pet family icons to english pet family names (eliminates need for translations)
local petIconMap = {
  ["Interface\\Icons\\inv_pet_ basilisk"] = "蜥蜴",  --Basilisk
  ["Interface\\Icons\\Ability_Hunter_Pet_Bat"] = "蝙蝠",  --Bat
  ["Interface\\Icons\\Ability_Hunter_Pet_Bear"] = "熊",  --Bear
  ["Interface\\Icons\\inv_misc_ahnqirajtrinket_01"] = "甲虫",  --Beetle
  ["Interface\\Icons\\Ability_Hunter_Pet_Owl"] = "猛禽",  --Bird of Prey
  ["Interface\\Icons\\Ability_Hunter_Pet_Boar"] = "野猪",  --Boar
  ["Interface\\Icons\\Ability_Hunter_Pet_Vulture"] = "食腐鸟",  --Carrion Bird
  ["Interface\\Icons\\Ability_Hunter_Pet_Cat"] = "豹",  --Cat
  ["Interface\\Icons\\Ability_Hunter_Pet_Chimera"] = "奇美拉",  --Chimaera
  ["Interface\\Icons\\inv_clefthoofdraenormount_blue"] = "裂蹄牛",  --Clefthoof
  ["Interface\\Icons\\Ability_Hunter_Pet_CoreHound"] = "熔岩犬",  --Core Hound
  ["Interface\\Icons\\Ability_Hunter_Pet_Crab"] = "螃蟹",  --Crab
  ["Interface\\Icons\\inv_pet_crane"] = "鹤",  --Crane
  ["Interface\\Icons\\Ability_Hunter_Pet_Crocolisk"] = "鳄鱼",  --Crocolisk
  ["Interface\\Icons\\Ability_Hunter_Pet_Devilsaur"] = "魔暴龙",  --Devilsaur
  ["Interface\\Icons\\inv_pet_direhorn"] = "恐角龙",  --Direhorn
  ["Interface\\Icons\\inv_pet_mastiff"] = "狗",  --Dog
  ["Interface\\Icons\\Ability_Hunter_Pet_DragonHawk"] = "龙鹰",  --Dragonhawk
  ["Interface\\Icons\\ability_hunter_aspectofthefox"] = "狐狸",  --Fox
  ["Interface\\Icons\\inv_pet_ goat"] = "山羊",  --Goat
  ["Interface\\Icons\\Ability_Hunter_Pet_Gorilla"] = "大猩猩",  --Gorilla
  ["Interface\\Icons\\trade_archaeology_whitehydrafigurine"] = "九头蛇",  --Hydra
  ["Interface\\Icons\\Ability_Hunter_Pet_Hyena"] = "鬣狗",  --Hyena
  ["Interface\\Icons\\Ability_Mount_MechaStrider"] = "机械",  --Mechanical
  ["Interface\\Icons\\inv_pet_monkey"] = "猴子",  --Monkey
  ["Interface\\Icons\\Ability_Hunter_Pet_Moth"] = "蛾子",  --Moth
  ["Interface\\Icons\\Ability_Hunter_Pet_NetherRay"] = "虚空鳐",  --Nether Ray
  ["Interface\\Icons\\ability_mount_yakmount"] = "公牛",  --Oxen
  ["Interface\\Icons\\inv_pet_porcupine"] = "箭猪",  --Porcupine
  ["Interface\\Icons\\achievement_moguraid_01"] = "魁麟",  --Quilen
  ["Interface\\Icons\\Ability_Hunter_Pet_Raptor"] = "猛禽",  --Raptor
  ["Interface\\Icons\\Ability_Hunter_Pet_Ravager"] = "掠食者",  --Ravager
  ["Interface\\Icons\\inv_hippo_green"] = "淡水兽",  --Riverbeast
  ["Interface\\Icons\\ability_mount_ironchimera"] = "双头飞龙",  --Rylak
  ["Interface\\Icons\\inv_mushanbeastmount"] = "穆山兽",  --Scalehide
  ["Interface\\Icons\\Ability_Hunter_Pet_Scorpid"] = "蝎子",  --Scorpid
  ["Interface\\Icons\\Spell_Nature_GuardianWard"] = "蛇",  --Serpent
  ["Interface\\Icons\\inv_pet_ shalespider"] = "页岩蛛",  --Shale Spider
  ["Interface\\Icons\\Ability_Hunter_Pet_Silithid"] = "异种虫",  --Silithid
  ["Interface\\Icons\\Ability_Hunter_Pet_Spider"] = "蜘蛛",  --Spider
  ["Interface\\Icons\\Ability_Druid_PrimalPrecision"] = "灵魂兽",  --Spirit Beast
  ["Interface\\Icons\\Ability_Hunter_Pet_Sporebat"] = "孢子蝠",  --Sporebat
  ["Interface\\Icons\\inv_talbukdraenor_white"] = "雄鹿",  --Stag
  ["Interface\\Icons\\Ability_Hunter_Pet_TallStrider"] = "陆行鸟",  --Tallstrider
  ["Interface\\Icons\\Ability_Hunter_Pet_Turtle"] = "乌龟",  --Turtle
  ["Interface\\Icons\\Ability_Hunter_Pet_WarpStalker"] = "跃迁兽",  --Warp Stalker
  ["Interface\\Icons\\Ability_Hunter_Pet_Wasp"] = "巨蜂",   --Wasp
  ["Interface\\Icons\\inv_pet_waterstrider"] = "水黾",  --Water Strider
  ["Interface\\Icons\\Ability_Hunter_Pet_WindSerpent"] = "风蛇",  --Wind Serpent
  ["Interface\\Icons\\Ability_Hunter_Pet_Wolf"] = "狼",  --Wolf
  ["Interface\\Icons\\Ability_Hunter_Pet_Worm"] = "蠕虫",  --Worm
}
-- which classes are exotic-only
local exotics = {
  ["页岩蛛"] = true,  --Shale Spider
  ["异种虫"] = true,  --Silithid
  ["水黾"] = true,  --Water Strider
  ["魁麟"] = true,  --Quilen
  ["熔岩犬"] = true,  --Core Hound
  ["魔暴龙"] = true,  --Devilsaur
  ["灵魂兽"] = true,  --Spirit Beast
  ["奇美拉"] = true,  --Chimaera
  ["蠕虫"] = true,  --Worm
  ["双头飞龙"] = true,  --Rylak
  ["裂蹄牛"] = true,  --Clefthoof
}
-- what buffs/abilities each family has
local buffs = {
  ["蜥蜴"] = { nil, "50% 盾墙" },
  ["蝙蝠"] = { nil , nil },
  ["熊"] = { nil, nil  },
  ["甲虫"] = { nil, "50% 盾墙" },
  ["猛禽"] = { nil },
  ["野猪"] = { nil, nil },
  ["食腐鸟"] = {nil , "致死打击" },
  ["豹"] = { nil, "潜行" },
  ["奇美拉"] = { nil, "减速, AOE" },
  ["裂蹄牛"] = { nil, "低血量盾墙" },
  ["熔岩犬"] = { "嗜血", "熔火之皮" },
  ["螃蟹"] = { nil, "50% 盾墙" },
  ["鹤"] = { "战复", nil  },
  ["鳄鱼"] = { nil, "50% 减速" },
  ["魔暴龙"] = { nil, "致死打击, 盛宴" },
  ["恐角龙"] = { nil, "法术偏转" },
  ["狗"] = { nil, nil  },
  ["龙鹰"] = { nil, nil  },
  ["狐狸"] = { nil, "+30% 闪避" },
  ["山羊"] = { nil, nil  },
  ["大猩猩"] = { nil, nil },
  ["九头蛇"] = { nil, nil  },
  ["鬣狗"] = { nil, nil },
  ["机械"] = { nil, nil },
  ["猴子"] = { nil, "+30% 闪避" },
  ["蛾子"] = { "战复", nil  },
  ["虚空鳐"] = { "嗜血", nil  },
  ["公牛"] = { nil, nil },
  ["箭猪"] = { nil, nil },
  ["魁麟"] = { "战复", "低血盾墙" },
  ["猛禽"] = { nil, nil },
  ["掠食者"] = { nil, nil  },
  ["淡水兽"] = { nil, "致死打击" },
  ["双头飞龙"] = { nil, "缓落" },
  ["穆山兽"] = { nil, nil },
  ["蝎子"] = { nil, "致死打击" },
  ["蛇"] = { nil, nil },
  ["页岩蛛"] = { nil , "50% 盾墙" },
  ["异种虫"] = { nil, "50% 减速" },
  ["蜘蛛"] = { nil, "50% 减速" },
  ["灵魂兽"] = { nil, "治疗, 潜行" },
  ["孢子蝠"] = { nil, nil   },
  ["雄鹿"] = { nil , nil  },
  ["陆行鸟"] = { nil , nil  },
  ["乌龟"] = { nil, "50% 盾墙" },
  ["跃迁兽"] = { nil, "50% 减速" },
  ["巨蜂"] = { nil , nil  },
  ["水黾"] = { nil, "凌波微步" },
  ["风蛇"] = { nil , nil  },
  ["狼"] = { nil, nil   },
  ["蠕虫"] = { nil, "AOE" },
}

-- maps call pet spellid to petslot index
local callPetSpells = {
  [883] = 1,
  [83242] = 2,
  [83243] = 3,
  [83244] = 4,
  [83245] = 5,
}

-- returns index of active called pet (1-5)
local function GetActivePet()
  for callpetspell, pet in pairs(callPetSpells) do
    if IsCurrentSpell(callpetspell) then return pet end
  end
end

-- returns index of active pet talent tree
local function GetActivePetTalentTree()
  local activeGroup = GetActiveSpecGroup()
  local talentTree = GetSpecialization(nil, true, activeGroup)
  return talentTree
end

-- returns name of pet talent tree or ""
local function GetPetTalentTreeName(tree)
  if not tree then return "" end
  return select(2, GetSpecializationInfo(tree, nil, true, nil, 1)) or ""
end

-- returns new tooltip information for a given pet stable slot
local function GetNewTooltip(petSlot)
  local icon, name, level, family, talent = GetStablePetInfo(petSlot)
  if not family or family == "" then return "" end
  
  local englishfamily = petIconMap[icon]
  if not englishfamily then englishfamily = "Unknown" end
  
  -- handle missing families
  if not buffs[englishfamily] then buffs[englishfamily] = {} end
  
  if not buffs[englishfamily][1] then
    buffs[englishfamily][1] = "|cFFFF0000 木有增益"
  end
  if not buffs[englishfamily][2] then
    buffs[englishfamily][2] = "|cFFFF0000 木有技能"
  end

  local newfamily = family
  -- add " (Exotic)" to pet family display
  if exotics[englishfamily] then
    newfamily = newfamily.." |cFFFFFF20(兽王)"
  end

  -- start off with default tooltip
  local tooltipstr = format(STABLE_PET_INFO_TOOLTIP_TEXT, level, newfamily, talent).."|n"

  -- get stored talent tree for the other spec (only if player has 2 specs)
  --[[ TODO
  if GetNumSpecGroups() > 1 then
    local stored = StableHelperPerChar.knownPetTalentTrees[petSlot] or {}
    local altSpecTree = stored[3 - GetActiveSpecGroup()]
    if altSpecTree then
      tooltipstr = tooltipstr.."|cFFFFFFFF可选天赋: |cFFFFFF20"..GetPetTalentTreeName(altSpecTree).."|n"
    end
  end
  --]]

  -- add buffs/abilities
  tooltipstr = tooltipstr.."|cFFFFFFFF增益效果: |cFF11FF44"..buffs[englishfamily][1].."|n"
  tooltipstr = tooltipstr.."|cFFFFFFFF特殊技能: |cFF2288FF"..buffs[englishfamily][2]

  return tooltipstr
end

-- called whenever a pet is summoned/dismissed or talent tree is changed
-- store talent tree for pet slot
function EventFrame:PET_SPECIALIZATION_CHANGED(event, ...)
  local petSlot = GetActivePet()
  if not petSlot then return end    
  StableHelperPerChar.knownPetTalentTrees[petSlot] = StableHelperPerChar.knownPetTalentTrees[petSlot] or {}
  StableHelperPerChar.knownPetTalentTrees[petSlot][GetActiveSpecGroup()] = GetActivePetTalentTree()
end

-- add info to stabled pet tooltips
hooksecurefunc("PetStable_UpdateSlot", function (button, petSlot)
  -- is there actually a pet in this slot?
  local _, _, _, family = GetStablePetInfo(petSlot)
  if not family or family == "" then return end
  
  -- set button tooltip
  button.tooltipSubtext = GetNewTooltip(petSlot)
  
  if GameTooltip:IsOwned(button) then button:GetScript("OnEnter")(button) end
end)

-- add info to Call Pet # tooltips
GameTooltip:HookScript("OnTooltipSetSpell", function (tooltip)
  local spellName, spellRank, spellID = tooltip:GetSpell()
  if not spellName then return end
  
  -- is this a "call pet" spell?
  local petSlot = callPetSpells[spellID]
  if not petSlot then return end
  
  -- is there actually a pet in this slot?
  local _, _, _, family = GetStablePetInfo(petSlot)
  if not family or family == "" then return end

  -- add to spell tooltip
  tooltip:AddLine("|n|cFFFFFFFF"..GetNewTooltip(petSlot))
end)

-- hook GetStablePetInfo to return actual talent info if known
local old_GetStablePetInfo = GetStablePetInfo
GetStablePetInfo = function (petSlot)
  if not petSlot then return end
  
  local icon, name, level, family, talent = old_GetStablePetInfo(petSlot)
  if not family or family == "" then return icon, name, level, family, talent end
  
  -- if blizzard is still returning blank strings for talents, insert our stored value for this spec
  if talent == "" then
    local stored = StableHelperPerChar.knownPetTalentTrees[petSlot] or {}
    local talentTree = stored[GetActiveSpecGroup()]
    talent = GetPetTalentTreeName(talentTree) or ""
  end
  
  return icon, name, level, family, talent
end

-- opposite of PetStable_GetPetSlot from Blizzard's PetStable.lua
-- gets button object from petslot
local function GetButtonFromPetSlot(petSlot)
  if not petSlot then return end  
  -- out of bounds
  if petSlot < 1 or petSlot > MAX_PETS then return end  
  -- active pet slot
  if petSlot >= 1 and petSlot <= NUM_PET_ACTIVE_SLOTS then return _G["PetStableActivePet"..petSlot] end
  -- stable slot
  local buttonId = (petSlot - NUM_PET_ACTIVE_SLOTS) % NUM_PET_STABLE_SLOTS
  return _G["PetStableStabledPet"..buttonId]
end

-- hook pet stable cursor functions to keep track of talent trees when moving around pets
hooksecurefunc("SetPetSlot", function(srcSlot, destSlot)
  local oldDestTalents = StableHelperPerChar.knownPetTalentTrees[destSlot]
  StableHelperPerChar.knownPetTalentTrees[destSlot] = StableHelperPerChar.knownPetTalentTrees[srcSlot]
  StableHelperPerChar.knownPetTalentTrees[srcSlot] = oldDestTalents
  
  -- update tooltip of destination button (so it has proper spec displayed)
  local button = GetButtonFromPetSlot(destSlot)
  if button and GameTooltip:IsOwned(button) then button:GetScript("OnEnter")(button) end  
end)

-- register events
EventFrame:HookScript("OnEvent", function(self, event, ...)
  EventFrame[event](self, event, ...)
end)
for k, _ in pairs(EventFrame) do
  EventFrame:RegisterEvent(k)
end

--ImprovedStableFrame------------------

local clientVersion = select(4, GetBuildInfo())

local maxSlots = NUM_PET_STABLE_PAGES * NUM_PET_STABLE_SLOTS

local NUM_PER_ROW, heightChange
	NUM_PER_ROW = 10
	heightChange = 36

for i = NUM_PET_STABLE_SLOTS + 1, maxSlots do 
	if not _G["PetStableStabledPet"..i] then
		CreateFrame("Button", "PetStableStabledPet"..i, PetStableFrame, "PetStableSlotTemplate", i)
	end
end

for i = 1, maxSlots do
	local frame = _G["PetStableStabledPet"..i]
	if i > 1 then
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", _G["PetStableStabledPet"..i-1], "RIGHT", 7.3, 0)
	end
	frame:SetFrameLevel(PetStableFrame:GetFrameLevel() + 1)
	frame:SetScale(7/NUM_PER_ROW)
end

PetStableStabledPet1:ClearAllPoints()
PetStableStabledPet1:SetPoint("TOPLEFT", PetStableBottomInset, 9, -9)

for i = NUM_PER_ROW+1, maxSlots, NUM_PER_ROW do
	_G["PetStableStabledPet"..i]:ClearAllPoints()
	_G["PetStableStabledPet"..i]:SetPoint("TOPLEFT", _G["PetStableStabledPet"..i-NUM_PER_ROW], "BOTTOMLEFT", 0, -5)
end

PetStableNextPageButton:Hide()
PetStablePrevPageButton:Hide()


PetStableFrameModelBg:SetHeight(281 - heightChange)
PetStableFrameModelBg:SetTexCoord(0.16406250, 0.77734375, 0.00195313, 0.55078125 - heightChange/512)

PetStableFrameInset:SetPoint("BOTTOMRIGHT", PetStableFrame, "BOTTOMRIGHT", -6, 126 + heightChange)
PetStableFrameStableBg:SetHeight(116 + heightChange)


NUM_PET_STABLE_SLOTS = maxSlots
NUM_PET_STABLE_PAGES = 1
PetStableFrame.page = 1