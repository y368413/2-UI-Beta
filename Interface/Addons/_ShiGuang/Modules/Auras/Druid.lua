--FrenzyRegen  --DruidFrenzyRegenDB
if select(2, UnitClass("player")) == "DRUID" then
local damageTable = {}
local updateInterval = 0.1
local eventIndex = 0
local playerGUID
local timeElapsed = 0
local damageTP5S = 0
local idFR = 22842
local anouncedHealing = 0

local lowTransparency = 0.7
local mediumTransparency = 0.5
local highTransparency = 0.3

DruidFrenzyRegenDB = {}

local frenzyRegenFrame = CreateFrame("Frame", "frenzyRegenFrame", UIParent)
frenzyRegenFrame:SetSize(110, 21)
frenzyRegenFrame:ClearAllPoints()
frenzyRegenFrame:SetPoint("CENTER", UIParent)
frenzyRegenFrame:SetBackdrop({
    bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3, },
})
frenzyRegenFrame:SetBackdropColor(0, 0, 0, 0.4)
frenzyRegenFrame:SetBackdropBorderColor(0, 0, 0, 1)

frenzyRegenFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frenzyRegenFrame:RegisterEvent("ADDON_LOADED")
frenzyRegenFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frenzyRegenFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
frenzyRegenFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
frenzyRegenFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
frenzyRegenFrame:RegisterEvent("ARTIFACT_UPDATE")
frenzyRegenFrame:RegisterEvent("PET_BATTLE_CLOSE")
frenzyRegenFrame:RegisterEvent("PET_BATTLE_OPENING_START") 

frenzyRegenFrame:EnableMouse(true)
frenzyRegenFrame:SetMovable(true)
frenzyRegenFrame:RegisterForDrag("LeftButton")
frenzyRegenFrame:SetScript("OnDragStart", frenzyRegenFrame.StartMoving)
frenzyRegenFrame:SetScript("OnDragStop",function(self)
 self:StopMovingOrSizing()
 DruidFrenzyRegenDB.XPos = self:GetLeft()
 DruidFrenzyRegenDB.YPos = self:GetBottom()
end)

frenzyRegenFrame.damageTakenBar = CreateFrame("StatusBar", nil, frenzyRegenFrame)
frenzyRegenFrame.damageTakenBar:SetPoint("TOPLEFT", 3, -3)
frenzyRegenFrame.damageTakenBar:SetPoint("TOPRIGHT", -3, -3)
frenzyRegenFrame.damageTakenBar:SetHeight(18)
frenzyRegenFrame.damageTakenBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
frenzyRegenFrame.damageTakenBar:GetStatusBarTexture():SetHorizTile(false)
frenzyRegenFrame.damageTakenBar:GetStatusBarTexture():SetVertTile(false)
frenzyRegenFrame.damageTakenBar:SetMinMaxValues(0, 100)
frenzyRegenFrame.damageTakenBar:SetStatusBarColor(0, 0.65, 0)


frenzyRegenFrame.damageTakenBar.bg = frenzyRegenFrame.damageTakenBar:CreateTexture(nil, "BACKGROUND")
frenzyRegenFrame.damageTakenBar.bg:SetTexture("Interface\\TARGETINGFRAME\\UI-StatusBar")
frenzyRegenFrame.damageTakenBar.bg:SetAllPoints(true)
frenzyRegenFrame.damageTakenBar.bg:SetVertexColor(0, 0.35, 0)

frenzyRegenFrame.damageTakenBar.value = frenzyRegenFrame.damageTakenBar:CreateFontString(nil, "OVERLAY")
frenzyRegenFrame.damageTakenBar.value:SetPoint("CENTER", frenzyRegenFrame.damageTakenBar, "CENTER", 4, 0)
frenzyRegenFrame.damageTakenBar.value:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
frenzyRegenFrame.damageTakenBar.value:SetJustifyH("LEFT")
frenzyRegenFrame.damageTakenBar.value:SetShadowOffset(1, -1)
frenzyRegenFrame.damageTakenBar.value:SetTextColor(0, 1, 0)

function frenzyRegenFrame:getShortNumber(num)
  if DruidFrenzyRegenDB.shortNumFlag then    
    if not num then
      return 0
    elseif num >= 1e8 then
      return format("%.1fy", num / 1e8)
    elseif num >= 1e4 then
      return format("%.1fw", num / 1e4)
    else
      return format("%d", num)
    end  
  else
    return format("%d", num)  
  end
end

function frenzyRegenFrame:countHealing()
  maxHP = UnitHealthMax("player")

  versatilityBonus = GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)
  expectedHealing =  math.max(maxHP*0.05,damageTP5S*0.5)*(1+versatilityBonus/100)
  legendaryHealing = 0
  
  if IsEquippedItem(137025) and DruidFrenzyRegenDB.legendaryFlag then -- Skysec's Hold
    legendaryHealing = maxHP*0.12*(1+versatilityBonus/100)
  end
  
  if GetSpecialization() == 3 and DruidFrenzyRegenDB.masteryFlag then
    mastery, coefficient = GetMasteryEffect()
    expectedHealing = expectedHealing*(1+mastery/100)
    legendaryHealing = legendaryHealing*(1+mastery/100)
  end
   
  local t18set = {124246, 124255, 124261, 124267, 124272}
  local t18items = 0
  for i=1,5,1 do
    if IsEquippedItem(t18set[i]) then
        t18items = t18items + 1
    end    
  end
  isT18eq = t18items > 1  
  
  local idx = 1
  repeat
    local name, _, _, _, _, _, _, _, _, _, spellID = UnitAura("player", idx, nil, "PLAYER|HELPFUL|CANCELABLE")
    if spellID and spellID == 213680 then -- Guardian of Elune          
      expectedHealing = expectedHealing*1.2
    elseif isT18eq and spellID and spellID == 192081 then -- Ironfur id
      expectedHealing = expectedHealing*1.2
    elseif spellID and spellID == 47788 then -- Guardian Spirit
      expectedHealing = expectedHealing*1.4
    elseif spellID and spellID == 64844 then -- Divine Hymn
      expectedHealing = expectedHealing*1.1
    elseif spellID and spellID == 116849 then -- Life Cocoon
      expectedHealing = expectedHealing*1.5
    elseif spellID and spellID == 199368 then -- Legacy of the Ravencrest
      expectedHealing = expectedHealing*4
    end
    idx = idx + 1
  until name == nil
  
  if IsEquippedItem(128821) then
    expectedHealing = expectedHealing*(1+DruidFrenzyRegenDB.artifactBonus)
  end

  ratioHP = (expectedHealing+legendaryHealing)/maxHP*100
  anouncedHealing = format("Self healing %d%% over 3 sec", ratioHP)
  
  charges = GetSpellCharges(idFR)
  if DruidFrenzyRegenDB.statusTypeFlag == 1 then  
  frenzyRegenFrame.damageTakenBar:SetValue(charges*50)
  else
  frenzyRegenFrame.damageTakenBar:SetValue(ratioHP)
  end
  
  if DruidFrenzyRegenDB.displayFlag == 0 then
    frenzyRegenFrame.damageTakenBar.value:SetText(self:getShortNumber(expectedHealing+legendaryHealing))
    anouncedHealing = format("Self healing %s over 3 sec", self:getShortNumber(expectedHealing+legendaryHealing))
  elseif DruidFrenzyRegenDB.displayFlag == 1 then
    frenzyRegenFrame.damageTakenBar.value:SetText(self:getShortNumber(expectedHealing/6))
  else if DruidFrenzyRegenDB.displayFlag == 2 then  
    frenzyRegenFrame.damageTakenBar.value:SetText(format("%d%%", ratioHP))
  end
  end  

 
  if DruidFrenzyRegenDB.showValueOnlyFlag then
      transparency = 0
      frenzyRegenFrame:SetBackdropColor(0, 0, 0, 0)
      frenzyRegenFrame:SetBackdropBorderColor(0, 0, 0, 0)
  else
      transparency = DruidFrenzyRegenDB.transparencyFlag
      frenzyRegenFrame:SetBackdropColor(0, 0, 0, 0.4)
      frenzyRegenFrame:SetBackdropBorderColor(0, 0, 0, 1)
  end
  start = GetSpellCooldown(idFR)
  if start ~= 0 and DruidFrenzyRegenDB.greyOutFlag then
    frenzyRegenFrame.damageTakenBar:SetStatusBarColor(0.212,0.212,0.212,transparency)
    frenzyRegenFrame.damageTakenBar.bg:SetVertexColor(0.1,0.1,0.1,transparency)
    frenzyRegenFrame.damageTakenBar.value:SetTextColor(0.5, 0.5, 0.5,DruidFrenzyRegenDB.transparencyFlag)
  else
    frenzyRegenFrame.damageTakenBar:SetStatusBarColor(0, 0.65, 0,transparency/1.5)
    if charges == 1 and DruidFrenzyRegenDB.statusTypeFlag == 1 then
    frenzyRegenFrame.damageTakenBar:SetStatusBarColor(0.6, 0.65, 0,transparency/1.5)
    end
    frenzyRegenFrame.damageTakenBar.bg:SetVertexColor(0, 0.35, 0,transparency)
    frenzyRegenFrame.damageTakenBar.value:SetTextColor(0, 1, 0,DruidFrenzyRegenDB.transparencyFlag)
  end  
end

function frenzyRegenFrame:updateVisibility()
  if IsPlayerSpell(idFR) then
    self:Show()  
  else
    self:Hide()
    return
  end
  if C_PetBattles.IsInBattle() then
    self:Hide()
    return
  else
    self:Show()    
  end  
  if DruidFrenzyRegenDB.hideOutOfBearFlag then
    if GetShapeshiftFormID() == 5 then
      self:Show()  
    else
      self:Hide()
      return
    end
  end  
  if DruidFrenzyRegenDB.hideOutOfCombatFlag then
    if UnitAffectingCombat("player") then
      self:Show()  
    else
      self:Hide()      
    end
  end
  if DruidFrenzyRegenDB.ignoreMouseFlag and UnitAffectingCombat("player") then
      frenzyRegenFrame:EnableMouse(false)  
  else
      frenzyRegenFrame:EnableMouse(true)       
  end
end

function frenzyRegenFrame:initFlags()
  if DruidFrenzyRegenDB.displayFlag == nil then
    DruidFrenzyRegenDB.displayFlag = 0;
  end
  if DruidFrenzyRegenDB.greyOutFlag == nil then
    DruidFrenzyRegenDB.greyOutFlag = true;
  end
  if DruidFrenzyRegenDB.movableFlag == nil then
    DruidFrenzyRegenDB.movableFlag = true;
  end
  if DruidFrenzyRegenDB.shortNumFlag == nil then
    DruidFrenzyRegenDB.shortNumFlag = true;
  end
  if DruidFrenzyRegenDB.masteryFlag == nil then
    DruidFrenzyRegenDB.masteryFlag = false;
  end
  if DruidFrenzyRegenDB.hideOutOfCombatFlag == nil then
    DruidFrenzyRegenDB.hideOutOfCombatFlag = false;
  end
  if DruidFrenzyRegenDB.hideOutOfBearFlag == nil then
    DruidFrenzyRegenDB.hideOutOfBearFlag = true;
  end
  if DruidFrenzyRegenDB.legendaryFlag == nil then
    DruidFrenzyRegenDB.legendaryFlag = false;
  end
  if DruidFrenzyRegenDB.artifactBonus == nil then
    DruidFrenzyRegenDB.artifactBonus = 0;
  end
  if DruidFrenzyRegenDB.transparencyFlag == nil then
    DruidFrenzyRegenDB.transparencyFlag = 1;
  end
  if DruidFrenzyRegenDB.ignoreMouseFlag == nil then
    DruidFrenzyRegenDB.ignoreMouseFlag = false;
  end
  if DruidFrenzyRegenDB.announceFlag == nil then
    DruidFrenzyRegenDB.announceFlag = false;
  end
  if DruidFrenzyRegenDB.announceChannel == nil then
    DruidFrenzyRegenDB.announceChannel = "SAY";
  end
  if DruidFrenzyRegenDB.statusTypeFlag == nil then
    DruidFrenzyRegenDB.statusTypeFlag = 0;
  end
  if DruidFrenzyRegenDB.showValueOnlyFlag == nil then
    DruidFrenzyRegenDB.showValueOnlyFlag = false;
  end
end

function frenzyRegenFrame:updateArtifactBonus() 
  if IsEquippedItem(128821) then
    local powers = C_ArtifactUI.GetPowers()
    if powers ~= nil then
      for i = 1, #powers do
        local id, _, rank = C_ArtifactUI.GetPowerInfo(powers[i])
        if id == 200400 then -- Wildflesh id
          DruidFrenzyRegenDB.artifactBonus = rank*0.05
        end
      end
    end
end
end

frenzyRegenFrame:SetScript("OnEvent",
  function(self, event,  ...)
  if event == "ADDON_LOADED"  then
    playerGUID = UnitGUID("player")
    if DruidFrenzyRegenDB.XPos then
      frenzyRegenFrame:ClearAllPoints()
      frenzyRegenFrame:SetPoint("BOTTOMLEFT",DruidFrenzyRegenDB.XPos,DruidFrenzyRegenDB.YPos)
    end
     frenzyRegenFrame:initFlags()
    if not DruidFrenzyRegenDB.movableFlag then
    frenzyRegenFrame:SetMovable(false)
    end
    frenzyRegenFrame:updateVisibility()
  elseif self:IsShown() and event == "COMBAT_LOG_EVENT_UNFILTERED" then	

    local _, eventType, _, sourceGUID, _, _, _, destGUID = ...
    if DruidFrenzyRegenDB.announceFlag and sourceGUID == playerGUID and eventType == "SPELL_CAST_SUCCESS" then
    local spellId = select(12,...)
      if spellId == idFR then -- Frenzied Regeneration
        SendChatMessage(anouncedHealing, DruidFrenzyRegenDB.announceChannel, "Common")
      end
    end
    if destGUID == playerGUID then
      eventIndex = eventIndex + 1  
      if eventType == "SWING_DAMAGE" then
        local _, _, _, _, _, _, _, _, _, _, _, amount, _, _, _, _, absorbed = ...
        if absorbed == nil then
          absorbed = 0;
        end
        damageTable[eventIndex] = {time(), amount+absorbed}      
       elseif eventType == "SPELL_DAMAGE" or eventType == "SPELL_PERIODIC_DAMAGE" or eventType == "RANGE_DAMAGE" then
        local _, _, _, _, _, _, _, _, _, _, _, _, _, _, amount, _, _, _, _, absorbed = ...
        if absorbed == nil then
          absorbed = 0;
        end
        damageTable[eventIndex] = {time(), amount+absorbed}
       end
      end 
  elseif event == "ACTIVE_TALENT_GROUP_CHANGED" or event == "UPDATE_SHAPESHIFT_FORM" or event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" or  
         event == "PET_BATTLE_CLOSE" or event == "PET_BATTLE_OPENING_START" then
    frenzyRegenFrame:updateVisibility()
  elseif event == "ARTIFACT_UPDATE" then
    frenzyRegenFrame:updateArtifactBonus() 
  end
end)

frenzyRegenFrame:SetScript("OnUpdate", function(self, elapsed)
  timeElapsed = timeElapsed + elapsed
  if timeElapsed >= updateInterval then
		local t = time() - 5
		for k, v in pairs(damageTable) do
      if v[1] <= t then
        damageTable[k] = nil
      else
        damageTP5S = damageTP5S + v[2]
      end
		end		
    self:countHealing()			
		damageTP5S = 0
		timeElapsed = 0
  end
end)

local DruiddropDownFrame = CreateFrame("Frame", "FRContextMenu", frenzyRegenFrame, "UIDropDownMenuTemplate")
MSA_DropDownMenu_Initialize(DruiddropDownFrame, function(self, level, menuList)
 local info = MSA_DropDownMenu_CreateInfo()
 if (level or 1) == 1 then
  info.text = " 设置"
  info.notCheckable = true
  info.hasArrow = true
  info.value = "position_submenu"
  MSA_DropDownMenu_AddButton(info)
  info.text = " 透明度"
  info.value = "position_submenu2"
  MSA_DropDownMenu_AddButton(info)
  info.text = " 状态栏显示..."
  info.value = "position_submenu3"
  MSA_DropDownMenu_AddButton(info)
  info.text = " 通报回复量..."
  info.value = "position_submenu4"
  MSA_DropDownMenu_AddButton(info)
  info.hasArrow = false  
  info.isTitle = true  
  info.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
  info.tSizeX = 0
  info.tSizeY = 8
  info.text = ""
  info.iconOnly = true
  info.iconInfo = {tFitDropDownSizeX = true}
  MSA_DropDownMenu_AddButton(info)
  info = MSA_DropDownMenu_CreateInfo()
  info.notCheckable = false
  info.hasArrow = false
  info.text = "显示总的回复量"   
  info.func = function() DruidFrenzyRegenDB.displayFlag = 0 end
  info.checked = function() return DruidFrenzyRegenDB.displayFlag == 0 end
  MSA_DropDownMenu_AddButton(info)
  info.text = "显示每秒的回复量"
  info.func = function() DruidFrenzyRegenDB.displayFlag = 1 end
  info.checked = function() return DruidFrenzyRegenDB.displayFlag == 1 end
  MSA_DropDownMenu_AddButton(info)
  info.text = "显示占总血量百分比 "  
  info.func = function() DruidFrenzyRegenDB.displayFlag = 2 end     
  info.checked = function() return DruidFrenzyRegenDB.displayFlag == 2 end
  MSA_DropDownMenu_AddButton(info)
 elseif level == 2 then
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.text = "框位置"
    info.func = function() frenzyRegenFrame:SetMovable(not frenzyRegenFrame:IsMovable()) DruidFrenzyRegenDB.movableFlag=frenzyRegenFrame:IsMovable() end
    info.checked = function() return not frenzyRegenFrame:IsMovable() end
    info.isNotRadio = true
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.text = "战斗中锁定"
    info.func = function() DruidFrenzyRegenDB.ignoreMouseFlag = not DruidFrenzyRegenDB.ignoreMouseFlag frenzyRegenFrame:updateVisibility() end
    info.checked = function() return DruidFrenzyRegenDB.ignoreMouseFlag end    
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.hasArrow = false  
    info.isTitle = true
    info.notCheckable = true
    info.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
    info.tSizeX = 0
    info.tSizeY = 8
    info.text = ""
    info.iconOnly = true
    info.iconInfo = {tFitDropDownSizeX = true}
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info = MSA_DropDownMenu_CreateInfo()
    info.notCheckable = false
    info.isNotRadio = true
    info.text = "Grey-out if FR's on cd"
    info.func = function() DruidFrenzyRegenDB.greyOutFlag = not DruidFrenzyRegenDB.greyOutFlag end
    info.checked = function() return DruidFrenzyRegenDB.greyOutFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.text = "数字略缩格式"
    info.func = function() DruidFrenzyRegenDB.shortNumFlag = not DruidFrenzyRegenDB.shortNumFlag end
    info.checked = function() return DruidFrenzyRegenDB.shortNumFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.hasArrow = false  
    info.isTitle = true
    info.notCheckable = true
    info.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
    info.tSizeX = 0
    info.tSizeY = 8
    info.text = ""
    info.iconOnly = true
    info.iconInfo = {tFitDropDownSizeX = true}
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info = MSA_DropDownMenu_CreateInfo()
    info.notCheckable = false
    info.isNotRadio = true
    info.text = "包含精通的加成"
    info.func = function() DruidFrenzyRegenDB.masteryFlag = not DruidFrenzyRegenDB.masteryFlag end
    info.checked = function() return DruidFrenzyRegenDB.masteryFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.text = "包含橙戒特效"
    info.func = function() DruidFrenzyRegenDB.legendaryFlag = not DruidFrenzyRegenDB.legendaryFlag end
    info.checked = function() return DruidFrenzyRegenDB.legendaryFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end  
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.hasArrow = false  
    info.isTitle = true
    info.notCheckable = true
    info.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
    info.tSizeX = 0
    info.tSizeY = 8
    info.text = ""
    info.iconOnly = true
    info.iconInfo = {tFitDropDownSizeX = true}
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info = MSA_DropDownMenu_CreateInfo()
    info.notCheckable = false
    info.text = "不在熊形态时隐藏"
    info.func = function() DruidFrenzyRegenDB.hideOutOfBearFlag = not DruidFrenzyRegenDB.hideOutOfBearFlag frenzyRegenFrame:updateVisibility() print("To turn off this setting type '/frshow bear'") end
    info.checked = function() return DruidFrenzyRegenDB.hideOutOfBearFlag end
    info.isNotRadio = true
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu" then
    info.text = "脱战隐藏"
    info.func = function() DruidFrenzyRegenDB.hideOutOfCombatFlag = not DruidFrenzyRegenDB.hideOutOfCombatFlag frenzyRegenFrame:updateVisibility() print("To turn off this setting type '/frshow combat'") end
    info.checked = function() return DruidFrenzyRegenDB.hideOutOfCombatFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info.text = "仅显示数值"
    info.func = function() DruidFrenzyRegenDB.showValueOnlyFlag = not DruidFrenzyRegenDB.showValueOnlyFlag end
    info.checked = function() return DruidFrenzyRegenDB.showValueOnlyFlag end
    info.isNotRadio = true
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info.hasArrow = false  
    info.isTitle = true
    info.notCheckable = true
    info.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
    info.tSizeX = 0
    info.tSizeY = 8
    info.text = ""
    info.iconOnly = true
    info.iconInfo = {tFitDropDownSizeX = true}
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info = MSA_DropDownMenu_CreateInfo()
    info.text = "OFF"
    info.notCheckable = false
    info.func = function() DruidFrenzyRegenDB.transparencyFlag = 1 end
    info.checked = function() return DruidFrenzyRegenDB.transparencyFlag == 1 end
    info.isNotRadio = false
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info.text = "低"
    info.func = function() DruidFrenzyRegenDB.transparencyFlag = lowTransparency end
    info.checked = function() return DruidFrenzyRegenDB.transparencyFlag == lowTransparency end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info.text = "中"
    info.func = function() DruidFrenzyRegenDB.transparencyFlag = mediumTransparency end
    info.checked = function() return DruidFrenzyRegenDB.transparencyFlag == mediumTransparency  end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu2" then
    info.text = "高"
    info.func = function() DruidFrenzyRegenDB.transparencyFlag = highTransparency end
    info.checked = function() return DruidFrenzyRegenDB.transparencyFlag == highTransparency end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu3" then
    info.text = "%总血量"
    info.func = function() DruidFrenzyRegenDB.statusTypeFlag = 0 end
    info.checked = function() return DruidFrenzyRegenDB.statusTypeFlag == 0 end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu3" then
    info.text = "充能数值"
    info.func = function() DruidFrenzyRegenDB.statusTypeFlag = 1 end
    info.checked = function() return DruidFrenzyRegenDB.statusTypeFlag == 1  end
    MSA_DropDownMenu_AddButton(info, level)
  end
    if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu4" then
    info.text = "关"
    info.func = function() DruidFrenzyRegenDB.announceFlag = false end
    info.checked = function() return not DruidFrenzyRegenDB.announceFlag end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu4" then
    info.text = "说话"
    info.func = function() DruidFrenzyRegenDB.announceChannel = "SAY" DruidFrenzyRegenDB.announceFlag = true end
    info.checked = function() return DruidFrenzyRegenDB.announceFlag and DruidFrenzyRegenDB.announceChannel == "SAY" end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu4" then
    info.text = "喊话"
    info.func = function() DruidFrenzyRegenDB.announceChannel = "YELL" DruidFrenzyRegenDB.announceFlag = true end
    info.checked = function() return DruidFrenzyRegenDB.announceFlag and DruidFrenzyRegenDB.announceChannel == "YELL" end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu4" then
    info.text = "队伍"
    info.func = function() DruidFrenzyRegenDB.announceChannel = "PARTY" DruidFrenzyRegenDB.announceFlag = true end
    info.checked = function() return DruidFrenzyRegenDB.announceFlag and DruidFrenzyRegenDB.announceChannel == "PARTY" end
    MSA_DropDownMenu_AddButton(info, level)
  end
  if MSA_DROPDOWNMENU_MENU_VALUE == "position_submenu4" then
    info.text = "团队"
    info.func = function() DruidFrenzyRegenDB.announceChannel = "RAID" DruidFrenzyRegenDB.announceFlag = true end
    info.checked = function() return DruidFrenzyRegenDB.announceFlag and DruidFrenzyRegenDB.announceChannel == "RAID" end
    MSA_DropDownMenu_AddButton(info, level)
  end
 end
end)

frenzyRegenFrame:SetScript("OnMouseDown", function(self, button)
	if button == "RightButton" then
		MSA_ToggleDropDownMenu(1, nil, DruiddropDownFrame, "cursor", 3, -3)
	end
end)

SLASH_FRENZYREGEN1 = "/frshow";
function SlashCmdList.FRENZYREGEN(msg, editbox)
  if msg == "bear" then
    DruidFrenzyRegenDB.hideOutOfBearFlag = not DruidFrenzyRegenDB.hideOutOfBearFlag
  elseif msg == "combat" then
    DruidFrenzyRegenDB.hideOutOfCombatFlag = not DruidFrenzyRegenDB.hideOutOfCombatFlag
  end
  frenzyRegenFrame:updateVisibility()
end
end