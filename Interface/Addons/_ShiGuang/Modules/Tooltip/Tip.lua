--GameTooltip:SetScale(0.85)
---------------IDtip--------------------
local hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, GetGlyphSocketInfo, tonumber, strfind =
      hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, GetGlyphSocketInfo, tonumber, strfind

local types = {
  spell       = "SpellID:",
  item        = "ItemID:",
  unit        = "NPC ID:",
  quest       = "QuestID:",
  talent      = "TalentID:",
  achievement = "AchievementID:",
  criteria = "CriteriaID:",
  ability     = "AbilityID:",
  currency    = "CurrencyID:",
  artifactpower = "ArtifactPowerID:"
}

local function addLine(tooltip, id, type)
    local found = false
    for i = 1,15 do
        local frame = _G[tooltip:GetName() .. "TextLeft" .. i]
        local text
        if frame then text = frame:GetText() end
        if text and text == type then found = true break end
    end
    if not found then
        tooltip:AddDoubleLine(type, "|cffffffff" .. id)
        tooltip:Show()
    end
end

-- All types, primarily for detached tooltips
local function onSetHyperlink(self, link)
    local type, id = string.match(link,"^(%a+):(%d+)")
    if not type or not id then return end
    if type == "spell" or type == "enchant" or type == "trade" then addLine(self, id, types.spell)
    elseif type == "talent" then addLine(self, id, types.talent)
    elseif type == "quest" then addLine(self, id, types.quest)
    elseif type == "achievement" then addLine(self, id, types.achievement)
    elseif type == "item" then addLine(self, id, types.item)
    elseif type == "currency" then addLine(self, id, types.currency)
    end
end

hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink)
hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink)

-- Spells
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...)
    local id = select(11, UnitBuff(...))
    if id and IsAltKeyDown() then addLine(self, id, types.spell) end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
    local id = select(11, UnitDebuff(...))
    if id and IsAltKeyDown() then addLine(self, id, types.spell) end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
    local id = select(11, UnitAura(...))
    if id and IsAltKeyDown() then addLine(self, id, types.spell) end
end)

hooksecurefunc("SetItemRef", function(link, ...)
    local id = tonumber(link:match("spell:(%d+)"))
    if id and IsAltKeyDown() then addLine(ItemRefTooltip, id, types.spell) end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
    local id = select(3, self:GetSpell())
    if id and IsAltKeyDown() then addLine(self, id, types.spell) end
end)
-- Artifact Powers
hooksecurefunc(GameTooltip, "SetArtifactPowerByID", function(self, powerID)
  local powerInfo = C_ArtifactUI.GetPowerInfo(powerID)
  local spellID = powerInfo.spellID
  if powerID and IsAltKeyDown() then addLine(self, powerID, types.artifactpower) end
  if spellID and IsAltKeyDown() then addLine(self, spellID, types.spell) end
end)

-- NPCs
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    if C_PetBattles.IsInBattle() then return end
    local unit = select(2, self:GetUnit())
    if unit then
        local guid = UnitGUID(unit) or ""
        local id = tonumber(guid:match("-(%d+)-%x+$"), 10)
        if id and IsAltKeyDown() and guid:match("%a+") ~= "Player" then addLine(GameTooltip, id, types.unit) end
    end
end)

-- Items
local function attachItemTooltip(self)
  local link = select(2, self:GetItem())
  if link then
    local id = string.match(link, "item:(%d*)")
    if (id == "" or id == "0") and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() and GetMouseFocus().reagentIndex then
      local selectedRecipe = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
      for i = 1, 8 do
        if GetMouseFocus().reagentIndex == i then
          id = C_TradeSkillUI.GetRecipeReagentItemLink(selectedRecipe, i):match("item:(%d+):") or nil
          break
        end
      end
    end
    if id and IsAltKeyDown() then
      addLine(self, id, types.item)
    end
  end
end

GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)

-- Achievement Frame Tooltips
local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, what)
  if what == "Blizzard_AchievementUI" and IsAltKeyDown() then
    for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
      button:HookScript("OnEnter", function()
        GameTooltip:SetOwner(button, "ANCHOR_NONE")
        GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
        addLine(GameTooltip, button.id, types.achievement)
        GameTooltip:Show()
      end)
      button:HookScript("OnLeave", function()
        GameTooltip:Hide()
      end)

      local hooked = {}
      hooksecurefunc("AchievementButton_GetCriteria", function(index, renderOffScreen)
        local frame = _G["AchievementFrameCriteria" .. (renderOffScreen and "OffScreen" or "") .. index]
        if frame and not hooked[frame] then
          frame:HookScript("OnEnter", function(self)
            local button = self:GetParent() and self:GetParent():GetParent()
            if not button or not button.id then return end
            local criteriaid = select(10, GetAchievementCriteriaInfo(button.id, index))
            if criteriaid then
              GameTooltip:SetOwner(button:GetParent(), "ANCHOR_NONE")
              GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
              addLine(GameTooltip, button.id, types.achievement)
              addLine(GameTooltip, criteriaid, types.criteria)
              GameTooltip:Show()
            end
          end)
          frame:HookScript("OnLeave", function()
            GameTooltip:Hide()
          end)
          hooked[frame] = true
        end
      end)
    end
  end
end)

-- Pet battle buttons
hooksecurefunc("PetBattleAbilityButton_OnEnter", function(self)
  local petIndex = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)
  if ( self:GetEffectiveAlpha() > 0 ) then
    local id = select(1, C_PetBattles.GetAbilityInfo(LE_BATTLE_PET_ALLY, petIndex, self:GetID()))
    if id and IsAltKeyDown() then
      local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
      PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. types.ability .. "|cffffffff " .. id .. "|r")
    end
  end
end)

-- Pet battle auras
hooksecurefunc("PetBattleAura_OnEnter", function(self)
  local parent = self:GetParent()
  local id = select(1, C_PetBattles.GetAuraInfo(parent.petOwner, parent.petIndex, self.auraIndex))
  if id and IsAltKeyDown() then
    local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
    PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. types.ability .. "|cffffffff " .. id .. "|r")
  end
end)

-- Currencies
hooksecurefunc(GameTooltip, "SetCurrencyToken", function(self, index)
	local id = tonumber(string.match(GetCurrencyListLink(index),"currency:(%d+)"))
	if id and IsAltKeyDown() then addLine(self, id, types.currency) end
end)

hooksecurefunc(GameTooltip, "SetCurrencyByID", function(self, id)
   if id and IsAltKeyDown() then addLine(self, id, types.currency) end
end)

hooksecurefunc(GameTooltip, "SetCurrencyTokenByID", function(self, id)
   if id and IsAltKeyDown() then addLine(self, id, types.currency) end
end)

-- Quests
do
  local function questhook(self)
    if self.questID then addLine(GameTooltip, self.questID, types.quest) end
  end
  local titlebuttonshooked = {}
  hooksecurefunc("QuestLogQuests_GetTitleButton", function(index)
    local titles = QuestMapFrame.QuestsFrame.Contents.Titles;
    if titles[index] and not titlebuttonshooked[index] then
      titles[index]:HookScript("OnEnter", questhook)
      titlebuttonshooked[index] = true
    end
  end)
end
hooksecurefunc("TaskPOI_OnEnter", function(self)
  if self and self.questID then addLine(WorldMapTooltip, self.questID, types.quest) end
end)

-------------------------------------------------------------Tipachu v1.2 by Tuller
local DEFAULT_ICON_SIZE = 24
--add icon to the tooltip
local function setTooltipIcon(self, icon)
	local title = icon and _G[self:GetName() .. 'TextLeft1']
	if title then
		title:SetFormattedText('|T%s:%d|t %s', icon, _G['TipachuSize'] or DEFAULT_ICON_SIZE, title:GetText())
	end
end

--tooltip hooking generator
local function newTooltipHooker(method, func)
	return function(tooltip)
		local modified = false

		tooltip:HookScript('OnTooltipCleared', function(self, ...)
			modified = false
		end)

		tooltip:HookScript(method, function(self, ...)
			if not modified  then
				modified = true
				func(self, ...)
			end
		end)
	end
end

local hookItem = newTooltipHooker('OnTooltipSetItem', function(self, ...)
	local name, link = self:GetItem()
	if link then
		setTooltipIcon(self, GetItemIcon(link))
	end
end)

local hookSpell = newTooltipHooker('OnTooltipSetSpell', function(self, ...)
	local name, rank, id = self:GetSpell()
	if id then
		setTooltipIcon(self, GetSpellTexture(id))
	end
end)

--hook tooltips
for _, tooltip in pairs{GameTooltip, ItemRefTooltip} do
	hookItem(tooltip)
	hookSpell(tooltip)
end

-------------------------Chippu + Rolecolor---------------------------------------------------
local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor

local OnTooltipSetItem = function(self, ...)
	local name, item = self:GetItem()
	if(item) then
		local _, _, quality = GetItemInfo(item)
		if(quality) then
			local r, g, b = GetItemQualityColor(quality)
			self:SetBackdropBorderColor(r, g, b)
			self:SetBackdropColor(0, 0, 0, 1)
		end
	end
end

--------------------------------------Thanks zork¡¤s rTooltip------------------------------------------
  local unpack, type = unpack, type
  local RAID_CLASS_COLORS = RAID_CLASS_COLORS
  local FACTION_BAR_COLORS = FACTION_BAR_COLORS
  local classColors, reactionColors = {}, {}
  local function GetHexColor(color) return ("%.2x%.2x%.2x"):format(color.r*255, color.g*255, color.b*255) end
  for class, color in pairs(RAID_CLASS_COLORS) do classColors[class] = GetHexColor(RAID_CLASS_COLORS[class]) end
  for i = 1, #FACTION_BAR_COLORS do reactionColors[i] = GetHexColor(FACTION_BAR_COLORS[i]) end
  local function TooltipOnShow(self,...)
   local unit = select(2, self:GetUnit()) or GetMouseFocus() or (UnitExists("mouseover") and "mouseover")  --and GetMouseFocus():GetAttribute("unit")
    if not unit or (unit and type(unit) ~= "string") then return end
    if not UnitGUID(unit) then return end
        if UnitIsPlayer(unit) then
      local _, unitClass = UnitClass(unit)
      --local color = RAID_CLASS_COLORS[unitClass]
      self:SetBackdropBorderColor(RAID_CLASS_COLORS[unitClass].r,RAID_CLASS_COLORS[unitClass].g,RAID_CLASS_COLORS[unitClass].b)
    else
      local reaction = UnitReaction(unit, "player")
      if reaction then
        local color = FACTION_BAR_COLORS[reaction]
        if color then
          self:SetBackdropBorderColor(color.r,color.g,color.b)
        end
      end
    end
    self:SetBackdropColor(0.3,0.3,0.33,1)
  end
------------------------------------------------------------------------------------------------------------------------------
  
for _, obj in next, {
	GameTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	ItemRefTooltip,
	WorldMapTooltip,
} do
	obj:HookScript("OnTooltipSetItem", OnTooltipSetItem)
	obj:HookScript("OnShow", TooltipOnShow)
end
--------------------------------------- Tooltip美化-------------------------------------
local function AeroTooltip(...)
    local AeroTooltipMaskFrame, AeroTooltipMask
    for i = 1, select("#", ...) do
        AeroTooltipMaskFrame = _G[select(i, ...)]
        if (AeroTooltipMaskFrame) then
            AeroTooltipMask = AeroTooltipMaskFrame:CreateTexture("AeroTooltipMask")
            AeroTooltipMask:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
            AeroTooltipMask:SetPoint("TOPLEFT", AeroTooltipMaskFrame, "TOPLEFT", 4, -4)
            AeroTooltipMask:SetPoint("BOTTOMRIGHT", AeroTooltipMaskFrame, "TOPRIGHT", -4, -30)
            AeroTooltipMask:SetBlendMode("ADD")
            AeroTooltipMask:SetGradientAlpha("VERTICAL", 0, 0, 0, 0, 1, 1, 1, 0.76)
        end
    end
end
AeroTooltip("GameTooltip")
--------------------------------------- ArtifactPowerTip-------------------------------------
GameTooltip:HookScript('OnTooltipSetItem', function(self)
	local _, link = self:GetItem()
	if type(link) == 'string' then
		if IsArtifactPowerItem(link) then
			local artifactID, _, artifactName = C_ArtifactUI.GetEquippedArtifactInfo()
			if artifactName then
				local spec = GetSpecialization()
				if spec then
					local _, _, _, specIcon = GetSpecializationInfo(spec)
					if specIcon then
						self:AddLine(format('|T%s:16|t [%s]', specIcon, artifactName), 230/255, 204/255, 128/255)
						self:Show()
					end
				end
			end
		end
	end
end)
