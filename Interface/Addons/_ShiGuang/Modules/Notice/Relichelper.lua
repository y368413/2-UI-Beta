LoadAddOn("Blizzard_ArtifactUI")
local OpenedRelicInfo         = C_ArtifactUI.GetRelicInfo
local GetILVLIncByRelic       = C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic
local GetRelicSlotType
local GetNumRelicSlots

-- Used for Encounter Journal scanning
local lastUpdate = 0
local dataArriveButNotProcessed = false

RelicHelper_SV = RelicHelper_SV or {}

local MAX_RELIC_NUM = 3 
local currChar = UnitName("player").."-"..GetRealmName()-- Unique name-realm identifier for database storage
local specToRelics = {
	[250] = {RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_IRON}, -- Blood DK
	[251] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FROST}, -- Frost DK
	[252] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD}, -- Unholy DK

	[577] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FEL}, -- Havoc DH
	[581] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FEL}, -- Vengeance DH

	[102] = {RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_ARCANE}, -- Balance Druid
	[103] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Feral Druid
	[104] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Guardian Druid
	[105] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE}, -- Restoration Druid

	[253] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_IRON}, -- Beast Mastery Hunter
	[254] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Marksmanship Hunter
	[255] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD}, -- Survival Hunter

	[62] = {RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_ARCANE}, -- Arcane Mage
	[63] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FIRE}, -- Fire Mage
	[64] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FROST}, -- Frost Mage

	[268] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON}, -- Brewmaster Monk
	[270] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_WIND}, -- Mistweaver Monk
	[269] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Windwalker Monk

	[65] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_HOLY}, -- Holy Paladin
	[66] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_ARCANE}, -- Protection Paladin
	[70] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_HOLY}, -- Retribution Paladin

	[256] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_HOLY}, -- Discipline Priest
	[257] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_HOLY}, -- Holy Priest
	[258] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Shadow Priest

	[259] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD}, -- Assassination Rogue
	[260] = {RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Outlaw Rogue
	[261] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FEL}, -- Subtlety Rogue

	[262] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_WIND}, -- Elemental Shaman
	[263] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Enhancement Shaman
	[264] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE}, -- Restoration Shaman

	[265] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Affliction Warlock
	[266] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_FEL}, -- Demonology Warlock
	[267] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_FEL}, -- Destruction Warlock

	[71] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Arms Warrior
	[72] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON}, -- Fury Warrior
	[73] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_FIRE}, -- Protection Warrior
}
local RELIC_TOOLTIP_TYPE_PATTERN = _G.RELIC_TOOLTIP_TYPE:gsub('%%s', '(.+)')


local RH = CreateFrame("Frame")

-- All keys of the table will be RegisterEvent'd at the end of the file
RH.Events = {}

RH:SetScript("OnEvent",function( self, event, ...)
  self.Events[event](self, ...)
end)


RH.Events["ADDON_LOADED"] = function( self )
  self:UnregisterEvent("ADDON_LOADED")
end

RH.Events["PLAYER_ENTERING_WORLD"] = function( self )
  self:ScanEJForRelics()
  self:ScanArtifact()
end

RH.Events["ARTIFACT_UPDATE"] = function( self )
  self:ScanArtifact()
  if dataArriveButNotProcessed then
    -- EJ recieved new data but we did not check it yet
    if UnitAffectingCombat("player ") or ( GetTime() - lastUpdate ) < 120 then
      -- Don't scan it in combat or when it  last scan was not that long ago.
      return
    end
    self:ScanEJForRelics()
  end
end

function RH:ScanArtifact()
  if not ArtifactFrame:IsShown() then return end

  local artifactName = select(2, C_ArtifactUI.GetArtifactArtInfo())
  if not artifactName then return end

  self:UpdateDB(artifactName)

  -- Change functions depending scannig equipped vs open artifact
  OpenedRelicInfo  = C_ArtifactUI.GetRelicInfo
  GetRelicSlotType = function (index)
                       return _G["RELIC_SLOT_TYPE_"..string.upper(C_ArtifactUI.GetRelicSlotType(index))]
                     end
  GetNumRelicSlots = C_ArtifactUI.GetNumRelicSlots
  if GetNumRelicSlots() > 0 then
    local relicData = RelicHelper_SV[currChar][artifactName]
    for i=1,MAX_RELIC_NUM do
      local _, relicName, relicItemID, relicItemLink = OpenedRelicInfo(i)
      local relicType = GetRelicSlotType(i)
      relicData[i]["ilvlBonus"] = (relicItemLink and GetILVLIncByRelic( relicItemLink ) or 0)
      relicData[i]["type"]      = relicType or relicData[i]["type"]
    end
  end
end
ArtifactFrame:HookScript("OnShow", function(...)
  RH:ScanArtifact()
end)


function RH:UpdateDB(artifactName)
  if not artifactName then
	artifactName = "Somethingwenthorriblywrong"
  end
  RelicHelper_SV[currChar] = RelicHelper_SV[currChar] or {}
  RelicHelper_SV[currChar][artifactName] = RelicHelper_SV[currChar][artifactName] or {}
  for i=1,MAX_RELIC_NUM do
    RelicHelper_SV[currChar][artifactName][i] = RelicHelper_SV[currChar][artifactName][i] or {}
  end
end

function RH.manageTooltip(tooltip, ... )
  local name, link = tooltip:GetItem()
  if not link then return end
  local ilvlBonus = GetILVLIncByRelic(link) or 0
  if select(7, GetItemInfo(link)) == "Artifact Relic" then
    local relicType, t, i, j
    for i=1,tooltip:NumLines() do
      if relicType then break end
      t = _G[tooltip:GetName().."TextLeft"..i]:GetText()
      relicType = t:match(RELIC_TOOLTIP_TYPE_PATTERN)
    end
    
    if relicType then
      local data = RelicHelper_SV[currChar]
      for i=1,tooltip:NumLines() do
        local currLine = _G[tooltip:GetName().."TextLeft"..i]
        local currLineText = currLine:GetText()
        if data and data[currLineText] then
          for j=1,MAX_RELIC_NUM do
            if relicType == data[currLineText][j]["type"] then
              local relBonus = ilvlBonus - data[currLineText][j]["ilvlBonus"]
              currLine:SetText(currLine:GetText() .. ( relBonus > 0 and " (|cFF00FF00+" or  " (|cFFFF0000").. relBonus.."|r)")
            end
          end
        end
      end
    end
  end
  tooltip:Show()
end

-- overload the base function for ItemRefTooltip with a custom routine
ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  RH.manageTooltip(tooltip, ...)
end)
GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  RH.manageTooltip(tooltip, ...)
end)
WorldMapTooltip.ItemTooltip.Tooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
  RH.manageTooltip(tooltip, ...)
end)


-- Testing stuff
RH.relicsDropsByEncouter = {}
function RH:ScanEJForRelics()
  dataArriveButNotProcessed = false
  lastUpdate = GetTime()
  local foundRelics = 0
  self.relicsDropsByEncouter = {}
  -- Set Loot Filter: All Specs
  EJ_SetLootFilter(select(3, UnitClass("player")))
  -- Mythic, so all the dungeons show their loot
  EJ_SetDifficulty(23)
  -- Select Legion
  EJ_SelectTier(7)

  -- Loops within loops within loops yay

  local i, j, k, creatIndex = 1, 1, 1, 1

  -- What are we currently doing
  local instanceID, instanceName, encounterID, encounterName

  -- Iterate all the instances
  instanceID, instanceName = EJ_GetInstanceByIndex(i, false)
  while instanceID do
    foundRelics = foundRelics + self:ScanEncountersForRelics(instanceID)
    i = i +1
    instanceID, instanceName = EJ_GetInstanceByIndex(i, false)
  end

  -- Do the same for raids
  i, j, k, creatIndex = 1, 1, 1, 1

  instanceID, instanceName = EJ_GetInstanceByIndex(i, true)
  while instanceID do
    foundRelics = foundRelics + self:ScanEncountersForRelics(instanceID)
    i = i +1
    instanceID, instanceName = EJ_GetInstanceByIndex(i, true)
  end
end

function RH:ScanEncountersForRelics(instanceID)
  local relics = 0
  local k, j, encounterName, encounterID, creatIndex = 1, 1
  encounterName, _, encounterID = EJ_GetEncounterInfoByIndex(j, instanceID)
  EJ_SelectInstance(instanceID)
  -- Iterate all the encouters
  while encounterID do

    EJ_SelectEncounter(encounterID)
    -- Iterate all the loots
    for k = 1, EJ_GetNumLoot() do

      local _, _, _, _, slot, _, link = EJ_GetLootInfoByIndex(k)
      local relicType = slot and  slot:match(RELIC_TOOLTIP_TYPE_PATTERN)
      if relicType then
        relics = relics + 1

        for creatIndex = 1, 6 do
          local creatureName = select(2, EJ_GetCreatureInfo(creatIndex,encounterID))
          if creatureName then
            self.relicsDropsByEncouter[creatureName] = self.relicsDropsByEncouter[creatureName] or {}
            table.insert(self.relicsDropsByEncouter[creatureName], relicType)
          end
        end
      end

    end

    j = j +1
    encounterName, _, encounterID = EJ_GetEncounterInfoByIndex(j, instanceID)
  end
  return relics
end

RH.Events["GET_ITEM_INFO_RECEIVED"] = function(self)
  if UnitAffectingCombat("player ") or ( GetTime() - lastUpdate ) < 120 then
    -- Don't scan it in combat or when it  last scan was not that long ago.
    dataArriveButNotProcessed = true
    return
  end
  self:ScanEJForRelics()
end

GameTooltip:HookScript("OnTooltipSetUnit", function(tooltip, ...)
  local name = tooltip:GetUnit()
  local relicsString
  if RH.relicsDropsByEncouter[name] then
    relicsString = table.concat(RH.relicsDropsByEncouter[name], ", ")
  end
  if relicsString then
    tooltip:AddLine("RelicHelper: ".. relicsString)
  end
end)

for key,value in pairs(RH.Events) do
    RH:RegisterEvent(key)
end