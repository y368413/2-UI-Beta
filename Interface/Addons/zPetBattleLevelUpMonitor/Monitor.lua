local frame
local startTime, usedTime
local npcTimer, teamTimer = {}, {}
local npcId, teamKey, lastXp
local thisXp, leftTime, leftCount, xpIncr = 0, 0, 0, 0
local isShow, isForfeit, neadCalc, skipUpdate, heirloaded = false, false, false, false, false
local lines = {}
local tooltip = CreateFrame("GameTooltip")
local keepShow = false
tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

SLASH_PBLMM1 = "/pblm"
SlashCmdList["PBLMM"] = function(cmd, editbox)
  if cmd == "keep" then
    keepShow = not keepShow
    if keepShow and not isShow then
      isShow = true
      frame:Show()
    end
    if not keepShow and isShow and not C_PetBattles.IsInBattle() then
      isShow = false
      frame:Hide()
    end
  end
end

local function CanLevelUP()
  local level = UnitLevel("player")
  if level == 120 or IsXPUserDisabled() then
    return false
  else
    return true
  end
end

function PetBattleLevelUpMonitor_OnLoad(self)
  startTime = time()
  if not PBLMData then
    PBLMData = {}
  end

  for i = 1, 40 do
    lines[i] = tooltip:CreateFontString()
    tooltip:AddFontStrings(lines[i], tooltip:CreateFontString())
  end

  frame = PetBattleLevelUpMonitorFrame
  frame:RegisterEvent("PLAYER_XP_UPDATE")
  frame:RegisterEvent("PLAYER_LEVEL_UP")
  frame:RegisterEvent("PET_BATTLE_OPENING_START")
  frame:RegisterEvent("PET_BATTLE_CLOSE")
  frame:RegisterEvent("PLAYER_TARGET_CHANGED")
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
end

local function calcTeam()
  if not neadCalc then
    return
  end
  usedTime = time() - startTime
  if not isForfeit and teamKey then
    if not teamTimer[teamKey] then
      teamTimer[teamKey] = {0, 0}
    end
    teamTimer[teamKey][1] = teamTimer[teamKey][1] + usedTime
    teamTimer[teamKey][2] = teamTimer[teamKey][2] + 1
  end
  if not isForfeit and npcId then
    if not npcTimer[npcId] then
      npcTimer[npcId] = {0, 0}
    end
    npcTimer[npcId][1] = npcTimer[npcId][1] + usedTime
    npcTimer[npcId][2] = npcTimer[npcId][2] + 1
  end
  neadCalc = false
end

local function calcXp()
  if CanLevelUP() then
    calcTeam()
  end
  local currentXP = UnitXP("player")
  local totalXP = UnitXPMax("player")

  if not lastXp then
    lastXp = currentXP
    thisXp = 0
  else
    if currentXP > lastXp then
      thisXp = currentXP - lastXp
    end
    lastXp = currentXP
  end
  if thisXp > 0 then
    local toLevelXP = totalXP - currentXP
    leftCount = math.ceil(toLevelXP / thisXp)
    if npcTimer[npcId] and npcTimer[npcId][2] > 0 then
      local timePerOne = math.ceil(npcTimer[npcId][1] / npcTimer[npcId][2]) + 3
      leftTime = timePerOne * leftCount
    end
  end
end

local function calcHeirloom()
  if not CanLevelUP()  then
    return
  end
 
  xpIncr = 0
  local hasHeir = false
  local level = UnitLevel("player")
  for i = 1, 17 do
    local itemLink = GetInventoryItemLink("player", i)
    if itemLink then
      local itemID = tonumber(itemLink:match("item:(%d+)"))
      if itemID and C_Heirloom.IsItemHeirloom(itemID) then
        local _, _, _, _, _, _, _, _, minLevel, maxLevel = C_Heirloom.GetHeirloomInfo(itemID)
        if not maxLevel then
          C_Timer.After(
            1,
            function()
              calcHeirloom()
            end
          )
          return
        end
 
        if level and maxLevel and level < maxLevel then
          hasHeir = true
          tooltip:ClearLines()
          tooltip:SetHyperlink(itemLink)
          for i = 1, tooltip:NumLines() do
            local text = lines[i]:GetText()
            if text then
              if (text:match("经验值提高")) then
                local percent = text:match("(%d+)")
                if percent then
                  xpIncr = xpIncr + percent
                end
                break
              end
            end
          end
        end
      end
    end
  end
  if hasHeir and xpIncr==0 then
    C_Timer.After(
      1,
      function()
        calcHeirloom()
      end
    )
  end
end

function PetBattleLevelUpMonitor_OnEvent(self, event, ...)
  if event == "PLAYER_XP_UPDATE" then
    C_Timer.After(
      0.1,
      function()
        calcXp()
      end
    )
  elseif event == "PLAYER_ENTERING_WORLD" then
    lastXp = UnitXP("player")
    calcHeirloom()
  elseif event == "PLAYER_EQUIPMENT_CHANGED" then
    calcHeirloom()
  elseif event == "PLAYER_LEVEL_UP" then
    calcHeirloom()
  elseif event == "PLAYER_TARGET_CHANGED" then
    if
      UnitExists("target") and not UnitIsPlayer("target") and not UnitIsEnemy("player", "target") and
        not (InCombatLockdown() or C_PetBattles.IsInBattle() or C_PetBattles.GetPVPMatchmakingInfo())
     then
      local GUID = UnitGUID("target")
      local unit_type, npcid = GUID:match("(%a+)-%d+-%d+-%d+-%d+-(%d+)-.+")
      if unit_type == "Creature" or unit_type == "BattlePet" then
        npcId = tonumber(npcid)
      end
    end
  elseif event == "PET_BATTLE_OPENING_START" then
    startTime = time()
    usedTime = 0
    teamKey = RematchSettings.loadedTeam
    isForfeit = false
    neadCalc = true
    isShow = true
    frame:Show()
  elseif event == "PET_BATTLE_CLOSE" then
    if not C_PetBattles.IsInBattle() then
      if CanLevelUP() then
        --在获取经验时计算
      else
        calcTeam()
      end
      if not keepShow then
        isShow = false
        frame:Hide()
      end
    else
      for pet = 1, C_PetBattles.GetNumPets(LE_BATTLE_PET_ENEMY) do
        if C_PetBattles.GetHealth(LE_BATTLE_PET_ENEMY, pet) > 1 then
          isForfeit = true
          break
        end
      end
    end
  end
end

function PetBattleLevelUpMonitor_OnDragStart(self, button)
  frame:StartMoving()
end

function PetBattleLevelUpMonitor_OnDragStop(self)
  frame:StopMovingOrSizing()
end

local function Update()
  skipUpdate = false

  if not isShow then
    return
  end
  local start, duration, enabled = GetSpellCooldown(125439)
  frame.Heal.Cooldown:SetCooldown(start, duration, enabled)
  if duration > 0 then
    frame.Heal.Icon:SetVertexColor(0.8, 0.8, 0.8)
  else
    frame.Heal.Icon:SetVertexColor(1, 1, 1)
  end

  local count = GetItemCount(86143)
  frame.Bandage.Count:SetText(count)
  if count == 0 then
    frame.Bandage.Icon:SetVertexColor(0.8, 0.8, 0.8)
  else
    frame.Bandage.Icon:SetVertexColor(1, 1, 1)
  end

  if C_PetBattles.IsInBattle() then
    local t1 = time() - startTime
    frame.Timer:SetText(t1)
  end

  if not CanLevelUP() then
    frame.LabLevel:Hide()
    frame.Level:Hide()
    frame.LabXpLast:Hide()
    frame.XpLast:Hide()
    frame.LabLeftCount:Hide()
    frame.LeftCount:Hide()
    frame.LabEquip:Hide()
    frame.Equip:Hide()
    frame.LabTeamName:SetPoint("TOPLEFT", frame.PVP, "BOTTOMLEFT", -130, -100)
  else
    local level = UnitLevel("player")
    local currentXP = UnitXP("player")
    local totalXP = UnitXPMax("player")
    local gainXPPercent = currentXP / totalXP * 100
    frame.Level:SetText(
      BATTLENET_FONT_COLOR_CODE .. string.format("%d (%.1f%%)", level, gainXPPercent) .. FONT_COLOR_CODE_CLOSE
    )

    frame.XpLast:SetText(GREEN_FONT_COLOR_CODE .. thisXp .. FONT_COLOR_CODE_CLOSE)
    if leftCount > 0 then
      frame.LeftCount:SetText(
        ORANGE_FONT_COLOR_CODE ..
          leftCount .. " 场 (" .. string.format("%.1f", leftTime / 60) .. " 分钟)" .. FONT_COLOR_CODE_CLOSE
      )
    else
      frame.LeftCount:SetText(ORANGE_FONT_COLOR_CODE .. "待统计" .. FONT_COLOR_CODE_CLOSE)
    end
    if xpIncr == 0 then
      frame.Equip:SetText(RED_FONT_COLOR_CODE .. "无" .. FONT_COLOR_CODE_CLOSE)
    elseif xpIncr < 50 then
      frame.Equip:SetText(RED_FONT_COLOR_CODE .. xpIncr .. " %" .. FONT_COLOR_CODE_CLOSE)
    else
      frame.Equip:SetText(GREEN_FONT_COLOR_CODE .. xpIncr .. " %" .. FONT_COLOR_CODE_CLOSE)
    end
  end
  local tk = RematchSettings.loadedTeam
  if tk then
    frame.TeamName:SetText(NORMAL_FONT_COLOR_CODE .. Rematch:GetTeamTitle(tk, false) .. FONT_COLOR_CODE_CLOSE)
  else
    frame.TeamName:SetText("未知")
  end
  local teamAvg = "待统计"
  if tk and teamTimer[tk] and teamTimer[tk][2] > 0 then
    local avg = math.ceil(teamTimer[tk][1] / teamTimer[tk][2])
    PBLMData[tk] = avg
    teamAvg = avg .. " 秒"
  elseif ALPTRematch and ALPTRematch.GetCurrentTeamAvg then
    local avg = ALPTRematch:GetCurrentTeamAvg()
    if avg then
      teamAvg = avg  .. " 秒"
    end  
  elseif tk and PBLMData[tk] then
    teamAvg = PBLMData[tk] .. " 秒"
  end
  frame.TeamInfo:SetText(teamAvg)
  if RematchSettings.LevelingQueue then
    frame.Queue:SetText(#RematchSettings.LevelingQueue .. "")
  else
    frame.Queue:SetText(RED_FONT_COLOR_CODE .. "0" .. FONT_COLOR_CODE_CLOSE)
  end
  local safariBuff = GetItemSpell(92738)
  if safariBuff and Rematch:UnitBuff(safariBuff) then
    frame.Hat:SetText(GREEN_FONT_COLOR_CODE .. "狩猎帽" .. FONT_COLOR_CODE_CLOSE)
  else
    frame.Hat:SetText(GRAY_FONT_COLOR_CODE .. "狩猎帽" .. FONT_COLOR_CODE_CLOSE)
  end

  local pvpBuff = GetSpellInfo(282559)
  if pvpBuff and Rematch:UnitBuff(pvpBuff) then
    frame.PVP:SetText(GREEN_FONT_COLOR_CODE .. "战争模式" .. FONT_COLOR_CODE_CLOSE)
  else
    frame.PVP:SetText(GRAY_FONT_COLOR_CODE .. "战争模式" .. FONT_COLOR_CODE_CLOSE)
  end
end
function PetBattleLevelUpMonitor_OnUpdate(self)
  if skipUpdate then
    return
  end
  skipUpdate = true
  C_Timer.After(
    0.010,
    function()
      Update()
    end
  )
end
