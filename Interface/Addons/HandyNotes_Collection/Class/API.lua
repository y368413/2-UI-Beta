---
--- @file
--- Bootstrap for Blizzard API functions.
---
--- We are going to bootstrap all Blizzard functions we are gonna need and use them
--- in our addon via this api. This way we can quickly fix our addon, if Blizzard
--- changes any game api.
---

local _, this = ...
local API = {}
local Icon = this.Icon

---
--- GameTooltip object.
---
--- @link https://wowpedia.fandom.com/wiki/Widget_API#GameTooltip
--- @link https://wowpedia.fandom.com/wiki/UIOBJECT_GameTooltip
---
API.GameTooltip = GameTooltip

---
--- Gets name of a quest.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_QuestLog.GetTitleForQuestID
---
--- @param id
---   Quest ID.
---
--- @return ?string
---   Name of the quest or nil.
---
function API:getQuestName(id)
  return C_QuestLog.GetTitleForQuestID(id)
end

---
--- Gets name of an achievement.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementInfo
---
--- @param id
---   Achievement ID.
---
--- @return string
---   Name of the achievement.
---
function API:getAchievementName(id)
  local _, name = GetAchievementInfo(id)

  return name
end

---
--- Gets link (formatted name) for achievement.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementLink
---
--- @param id
---   Achievement ID.
---
--- @return string
---   Formatted achievement link.
---
function API:getAchievementLink(id)
  return GetAchievementLink(id)
end

---
--- Gets criteria name of achievement by criteria id.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo
---
--- @param id
---   Achievement ID.
---
--- @param criteriaId
---   Achievement criteria ID.
---
--- @return string
---   Achievement criteria name.
---
function API:getAchievementCriteriaName(id, criteriaId)
  return GetAchievementCriteriaInfoByID(id, criteriaId)
end

---
--- Gets name for criteria and count of completed / required points.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo
---
--- @param id
---   Achievement ID.
---
--- @return string
---   Name of the criteria.
--- @return number
---   Number of completed points.
--- @return number
---   Number of required points.
---
function API:getAchievementCriteriaCount(id)
  local name, _, _, count, required = GetAchievementCriteriaInfo(id, 1)

  return name, count, required
end

---
--- Gets name of a spell.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetSpellInfo
---
--- @param id
---   Spell ID.
---
--- @return string
---   Name of the spell.
---
function API:getSpellName(id)
 local name = GetSpellInfo(id)

  return name
end

---
--- Gets name of an item.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_Item.GetItemName
---
--- @param id
---   Item ID.
---
--- @return ?string
---   Name of the item or nil.
---
function API:getItemName(id)
  return C_Item.GetItemNameByID(id)
end


---
--- Gets name of an NPC (Vendor, rare, etc.).
---
--- @link https://wowpedia.fandom.com/wiki/GUID
--- @link https://wowpedia.fandom.com/wiki/API_UIObject_GetName
--- @link https://wowpedia.fandom.com/wiki/API_GameTooltip_SetHyperlink
---
--- @param id
---   Item ID.
---
--- @return ?string
---   Name of the NPC or nil.
---
function API:getNpcName(id)
  local frame = CreateFrame('GameTooltip', 'unit:Creature-0-0-0-0-' .. id, nil, 'GameTooltipTemplate')
  frame:SetOwner(WorldFrame, 'ANCHOR_NONE');
  frame:SetHyperlink('unit:Creature-0-0-0-0-' .. id)

  local frameName = frame:GetName() .. 'TextLeft1'

  return _G[frameName]:GetText()
end


---
--- Gets distance from the left side of the screen to the center of a region.
---
--- @link https://wowpedia.fandom.com/wiki/API_Region_GetCenter
---
--- @return number
---   Distance between the region's center and the left edge of the screen.
---
function API:getUIParentCenter()
  return UIParent:GetCenter()
end

---
--- Loads icon from game files.
---
--- Good way to search for graphics is using WoW.tools or TextureAtlasViewer addon.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_Texture.GetAtlasInfo
--- @link https://wow.tools/
--- @link https://www.curseforge.com/wow/addons/textureatlasviewer
---
--- @param data
---   Name of icon we want to load.
---
--- @return table
---   Returns AtlasInfo object.
---
function API:GetAtlasInfo(data)
  local name = Icon.list[data]

  -- Fallback if we don't have any icon specified.
  if (data == nil) then
    name = Icon.list['default']
  end

  local graphics = C_Texture.GetAtlasInfo(name)
  local icon = {
  icon = graphics.file,
  tCoordLeft = graphics.leftTexCoord,
  tCoordRight = graphics.rightTexCoord,
  tCoordTop = graphics.topTexCoord,
  tCoordBottom = graphics.bottomTexCoord,
  }

  return icon
end

---
--- Check, whether quest is completed or not.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_QuestLog.IsQuestFlaggedCompleted
---
--- @param id
---   Quest ID.
---
--- @return boolean
---   True if it was completed, false if not or id is wrong
---
function API:isQuestCompleted(id)
  if not id then
    return false
  end

  return C_QuestLog.IsQuestFlaggedCompleted((id))
end

---
--- Checks, whether achievement is valid or not.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_AchievementInfo.IsValidAchievement
---
--- @param id
---   Achievement ID.
---
--- @return boolean
---   True, if achievement is valid, false otherwise.
---
function API:isAchievementValid(id)
  return C_AchievementInfo.IsValidAchievement(id)
end

---
--- Checks, whether achievement is completed.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementInfo
---
--- @param id
---   Achievement ID.
---
--- @return boolean
---   True, if achievement is completed, false otherwise.
---
function API:isAchievementCompleted(id)
  local _, _, _, completed = GetAchievementInfo(id)

  return completed
end

---
--- Checks, whether achievement criteria is completed.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo
---
--- @param id
---   Achievement ID.
---
--- @param criteriaId
---   Achievement criteria ID.
---
--- @return boolean
---   True, if achievement is completed, false otherwise.
---
function API:isAchievementCriteriaCompleted(id, criteriaId)
  local _, _, completed = GetAchievementCriteriaInfoByID(id, criteriaId)

  return completed
end

---
--- Checks, whether achievement has all count type criteria is completed.
---
--- @link https://wowpedia.fandom.com/wiki/API_GetAchievementCriteriaInfo
---
--- @param id
---   Achievement ID.
---
--- @return boolean
---   True, if achievement is completed, false otherwise.
---
function API:isAchievementCountCompleted(id)
  local _, _, completed = GetAchievementCriteriaInfo(id, 1)

  return completed
end

---
--- Gets map name from uiMapID.
---
--- @link https://wowpedia.fandom.com/wiki/API_C_Map.GetMapInfo
--- @link https://wowpedia.fandom.com/wiki/API_C_Map.GetMapGroupID
--- @link https://wowpedia.fandom.com/wiki/API_C_Map.GetMapGroupMembersInfo
---
--- @param id
---   Map id (uiMapID).
---
--- @return string
---   Map name.
---
function API:getMapName(id)
  groupId = C_Map.GetMapGroupID(id)

  -- Map is part of dungeon / raid. Loop all subzones from group and return name of ours.
  if (groupId) then
    for _, data in pairs(C_Map.GetMapGroupMembersInfo(groupId)) do
      if (data['mapID'] == id) then
        return data['name']
      end
    end
  end

  return C_Map.GetMapInfo(id).name
end

---
--- If map is open, we change it to another one (usable for portals to another map, ie. dungeons or raids).
---
--- @link https://wowpedia.fandom.com/wiki/UiMapID
---
--- @param id
---   Map id (uiMapID).
---
function API:changeMap(id)
  if WorldMapFrame:IsShown() then
    WorldMapFrame:SetMapID(id)
  end
end

this.API = API
