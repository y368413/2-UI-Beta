if WeeklyDungeonsMapIcon == nil then WeeklyDungeonsMapIcon = {} end
local resolution = GetCurrentScaledResolution()
if resolution == 2560 then res = true end
local a = CreateFrame("Frame", "WeeklyDungeonsFrame", UIParent, "BasicFrameTemplate")
tinsert(UISpecialFrames, a:GetName())
if res then a:SetSize(650, 283) else a:SetSize(650 * 0.75 + 3, 283 * 0.75 + 6) end
local infoButton = CreateFrame("Frame", nil, a)
infoButton:SetPoint("RIGHT", a.CloseButton, "LEFT", 5.93, -0.089)
infoButton:SetSize(33 * 0.7079, 33 * 0.7079)
infoButton:SetFrameLevel(2)
infoButton.tex = infoButton:CreateTexture(nil, "ARTWORK")
infoButton.tex:SetAtlas("worldquest-questmarker-questionmark")
infoButton.tex:SetSize(13 * 0.8, 17 * 0.8)
infoButton.tex:SetPoint("CENTER")
infoButton.tex.highlight = infoButton:CreateTexture(nil, "OVERLAY")
infoButton.tex.highlight:SetAllPoints()
infoButton.tex.highlight:SetTexture("Interface/Buttons/UI-Common-MouseHilight")
infoButton.tex.highlight:SetBlendMode("ADD") 
infoButton.tex.highlight:Hide()
infoButton:SetScript('OnEnter', function(self)
      infoButton.tex.highlight:Show()
      GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
      GameTooltip:AddLine('Weekly Reward Colors:')
      GameTooltip:AddDoubleLine('\124cFFFF8000Orange:', '\124rItem Level 252')
      GameTooltip:AddDoubleLine('\124cFFA335EEPurple:', '\124rItem Level 249')
      GameTooltip:AddDoubleLine('\124cFF007ADDBlue:', '\124rItem Level 246')
      GameTooltip:AddDoubleLine('\124cFF1EFF00Green:', '\124rItem Level 242')
      GameTooltip:AddDoubleLine('\124cFFFFFFFFWhite:', '\124rItem Level 239')
      GameTooltip:AddDoubleLine('\124cFF9D9D9DGray:', '\124rItem Level =< 236')
      GameTooltip:Show()
end)
infoButton:SetScript('OnLeave', function()
      infoButton.tex.highlight:Hide()
      GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
end)
a.TopLeftButtonBorder = a:CreateTexture()
a.TopLeftButtonBorder:SetSize(33, 21)
a.TopLeftButtonBorder:SetAtlas("UI-Frame-TopCornerRight")
a.TopLeftButtonBorder:SetTexCoord(1, 0, 0, 0.68)
a.TopLeftButtonBorder:SetPoint("TOPLEFT", a, -2, 0)
a.TopLeftButtonBorder:SetDrawLayer("OVERLAY", 0)
a.TopLeftButton = CreateFrame("Button", nil, a, "BigRedRefreshButtonTemplate")
a.TopLeftButton:SetPoint("TOPLEFT", a, "TOPLEFT", 0, 0)
a.TopLeftButton:SetSize(23, 23)
a.TopLeftButton:SetScript("OnClick", function(self, button)
   C_MythicPlus.RequestMapInfo()
 end)
a:SetPoint("CENTER")
a:Hide()
local frame = CreateFrame("Frame", nil, UIParent)
a:SetMovable(true)
a.LeftBorder:SetDrawLayer("OVERLAY", 1)
a.RightBorder:SetDrawLayer("OVERLAY")
a.BotLeftCorner:SetDrawLayer("OVERLAY")
frame:EnableMouse(true)
frame:SetScript("OnMouseDown", function(self, button)
      if button == "LeftButton" and not self.isMoving then
         a:StartMoving();
         self.isMoving = true;
      end
end)
frame:SetScript("OnMouseUp", function(self, button)
      if button == "LeftButton" and self.isMoving then
         a:StopMovingOrSizing();
         self.isMoving = false;
      end
end)
frame:SetScript("OnHide", function(self)
      if ( self.isMoving ) then
         self:StopMovingOrSizing();
         self.isMoving = false;
      end
end)
frame:SetAllPoints(a.TitleBg)
local bg = CreateFrame("frame", nil, a)
bg:SetFrameLevel(1)
bg:SetAllPoints(a.Bg)
bg.HorizBord = CreateFrame("frame", nil, bg)
bg.HorizBord:CreateTexture(nil, "ARTWORK", "_Talent-Inner-TopTile")
bg.HorizBord:SetPoint("CENTER", bg, "CENTER", -1, -1)
if res then bg.HorizBord:SetSize(646, 14) else bg.HorizBord:SetSize(646 * 0.75, 14 * 0.75) end
bg.HorizBord:SetFrameLevel(1)
bg.VertBord1 = CreateFrame("frame", nil, bg)
bg.VertBord1:CreateTexture(nil, "ARTWORK", "!Talent-Inner-RightTile")
bg.VertBord1:SetPoint("LEFT", bg, "LEFT", res and 120 or 120 * 0.75, 0)
if res then bg.VertBord1:SetSize(14, 258) else bg.VertBord1:SetSize(14 * 0.75, 258 * 0.75) end --258
bg.VertBord1:SetFrameLevel(1)
bg.VertBord2 = CreateFrame("frame", nil, bg)
bg.VertBord2:CreateTexture(nil, "ARTWORK", "!Talent-Inner-RightTile")
bg.VertBord2:SetPoint("LEFT", bg, "LEFT", res and 249 or 249 * 0.75, 0)
if res then bg.VertBord2:SetSize(14, 258) else bg.VertBord2:SetSize(14 * 0.75, 258 * 0.75) end
bg.VertBord2:SetFrameLevel(1)
bg.VertBord3 = CreateFrame("frame", nil, bg)
bg.VertBord3:CreateTexture(nil, "ARTWORK", "!Talent-Inner-RightTile")
bg.VertBord3:SetPoint("LEFT", bg, "LEFT", res and 378 or 378 * 0.75, 0)
if res then bg.VertBord3:SetSize(14, 258) else bg.VertBord3:SetSize(14 * 0.75, 258 * 0.75) end
bg.VertBord3:SetFrameLevel(1)
bg.VertBord4 = CreateFrame("frame", nil, bg)
bg.VertBord4:CreateTexture(nil, "ARTWORK", "!Talent-Inner-RightTile")
bg.VertBord4:SetPoint("LEFT", bg, "LEFT", res and 507 or 507 * 0.75, 0)
if res then bg.VertBord4:SetSize(14, 258) else bg.VertBord4:SetSize(14 * 0.75, 258 * 0.75) end
bg.VertBord4:SetFrameLevel(1)
--Create Textures/Fonstrings
bg.tex = {}
bg.numfont = {}
bg.levelfont = {}
bg.Rewardframe = {}
for i = 1, 10 do
   bg.tex[i] = bg:CreateTexture("weeklyDungText" .. i, "BORDER")
   local relative
   local anchor
   if i == 1 then bg.tex[i]:SetPoint("TOPLEFT", bg, "TOPLEFT", 0, -1)
   elseif (i > 1 and i < 6) or (i > 6) then bg.tex[i]:SetPoint("TOPLEFT", bg.tex[i - 1], "TOPRIGHT", 1, 0)
   elseif i == 6 then bg.tex[i]:SetPoint("TOPLEFT", bg.tex[1], "BOTTOMLEFT", 0, -1)end
   if res then bg.tex[i]:SetSize(128, 128) else bg.tex[i]:SetSize(128 * 0.75, 128 * 0.75) end
   bg.numfont[i] = bg:CreateFontString()
   bg.numfont[i]:SetPoint("BOTTOMRIGHT", bg.tex[i], "BOTTOMRIGHT", -3, i < 6 and 3 or -1)
   bg.numfont[i]:SetFont("Fonts\\FRIZQT__.TTF", 20, "OUTLINE")
   bg.numfont[i]:SetTextColor(1, 0.82, 0)
   bg.levelfont[i] = bg:CreateFontString()
   bg.levelfont[i]:SetPoint("CENTER", bg.tex[i], "CENTER")
   bg.levelfont[i]:SetFont("Fonts\\FRIZQT__.TTF", 72, "OUTLINE")
   if i == 1 or i == 4 or i == 10 then
      bg.Rewardframe[i] = CreateFrame("frame", nil, bg)
      bg.Rewardframe[i]:SetSize(212 * 0.23, 119 * 0.23)
      
      bg.Rewardframe[i]:SetFrameLevel(1)
      bg.Rewardframe[i].tex = bg.Rewardframe[i]:CreateTexture("ARTWORK")
      bg.Rewardframe[i].tex:SetAllPoints()
      bg.Rewardframe[i].tex:SetAtlas("weeklyrewards-orb-unlocked")
      if i == 1 then
         bg.Rewardframe[i]:SetPoint("CENTER", bg.numfont[i], "CENTER", -4, 3)
      elseif i == 4 then
         bg.Rewardframe[i]:SetPoint("CENTER", bg.numfont[i], "CENTER", -7, 3)
      elseif i == 10 then
         bg.Rewardframe[i]:SetPoint("CENTER", bg.numfont[i], "CENTER", -10, 2)
      end
      bg.Rewardframe[i]:SetScript('OnLeave', function()
         GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
      end)
  end
end
--Set Textures/Fontstrings
local texNum
InsertKey = function(texture, level, timed)
   if texNum < 11 then
bg.tex[texNum]:SetTexture(texture)
      if texture == "Interface/LFGFrame/GroupFinder" then
         bg.tex[texNum]:SetTexCoord(0.0009765625, 0.3212890625, 0.0009765625, 0.3291015625)
      else
         bg.tex[texNum]:SetTexCoord(0,1,0,1)
      end
      if timed then 
         bg.tex[texNum]:SetDesaturated(false)
      else
         bg.tex[texNum]:SetDesaturated(true)
      end
      bg.numfont[texNum]:SetText(texNum)
      if level then
         bg.levelfont[texNum]:SetText(level)
         if level >= 15 then
            local color = ITEM_QUALITY_COLORS[5]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false)
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFFFF8000252')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 14 then
            local color = ITEM_QUALITY_COLORS[4]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFFA335EE249')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 12 then
            local color = ITEM_QUALITY_COLORS[3]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF007ADD246')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 11 then
            local color = ITEM_QUALITY_COLORS[2]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF1EFF00242')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 10 then
            local color = ITEM_QUALITY_COLORS[1]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF9D9D9D239')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 8 then
            local color = ITEM_QUALITY_COLORS[0]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF9D9D9D236')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 7 then
            local color = ITEM_QUALITY_COLORS[0]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF9D9D9D233')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 5 then
            local color = ITEM_QUALITY_COLORS[0]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF9D9D9D229')
                  GameTooltip:Show()
               end)
            end
         elseif level >= 2 then
            local color = ITEM_QUALITY_COLORS[0]
            bg.levelfont[texNum]:SetTextColor(color.r, color.g, color.b)
            if texNum == 1 or texNum == 4 or texNum == 10 then 
               bg.Rewardframe[texNum].tex:SetDesaturated(false) 
               bg.Rewardframe[texNum]:SetScript('OnEnter', function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                  GameTooltip:AddLine('Item Level: \124cFF9D9D9D226')
                  GameTooltip:Show()
               end)
            end
         end 
      else 
         bg.levelfont[texNum]:SetText("")
         if texNum == 1 or texNum == 4 or texNum == 10 then
            bg.Rewardframe[texNum].tex:SetDesaturated(true) 
            bg.Rewardframe[texNum]:SetScript('OnEnter', function(self) end)
         end
      end
      texNum = texNum + 1
  end
end
--Populate frames
local PopulateFrame = function()
   local runs = C_MythicPlus.GetRunHistory(false, true)
   local levelList = {}
   for key in pairs(runs)do
      if levelList[runs[key].level] == nil then levelList[runs[key].level] = {} end
      local name, id, timeLimit, dungTexture = C_ChallengeMode.GetMapUIInfo(runs[key].mapChallengeModeID)
      local payload = {dungTexture = dungTexture, level = runs[key].level, timed = runs[key].completed}
      table.insert(levelList[runs[key].level], payload)
   end
   local success = false
   repeat
      success = false
      for level in pairs(levelList) do
         if level - 1 > 0 and levelList[level - 1] == nil then
            levelList[level - 1] = levelList[level]
            levelList[level] = nil
            success = true
         end
      end
   until success == false
   success = false
   repeat
      success = false
      for level in pairs(levelList) do
         for key in pairs(levelList[level]) do
            if levelList[level][key].timed == false and levelList[level][key + 1] and levelList[level][key + 1].timed then
               local swap1 = levelList[level][key]
               local swap2 = levelList[level][key + 1]
               levelList[level][key] = swap2
               levelList[level][key + 1] = swap1
               success = true
            end
         end
      end
   until success == false
   local levelCount = 0
   for level in pairs(levelList) do
      levelCount = levelCount + 1
   end
   levelList.length = levelCount
   for i = levelList.length, 1, -1 do
      for key in pairs(levelList[i]) do
         InsertKey(levelList[i][key].dungTexture, levelList[i][key].level, levelList[i][key].timed)
      end
   end
   for i = 1, 10 do
      InsertKey("Interface/LFGFrame/GroupFinder")
   end
end
--Events
local f = CreateFrame("Frame")
function f:CHALLENGE_MODE_COMPLETED()
   C_MythicPlus.RequestMapInfo()
end
function f:CHALLENGE_MODE_MAPS_UPDATE()
   texNum = 1
   PopulateFrame()
end
function f:OnEvent(event, ...)
   self[event](self, event, ...)
end
f:RegisterEvent("CHALLENGE_MODE_MAPS_UPDATE")
f:RegisterEvent("CHALLENGE_MODE_COMPLETED")
f:SetScript("OnEvent", f.OnEvent)
--Ace3 create addon object
local addon = LibStub("AceAddon-3.0"):NewAddon("WeeklyDungeons", "AceConsole-3.0")
--Minimap Button
local WeeklyDungeonsLDB = LibStub("LibDataBroker-1.1"):NewDataObject("WeeklyDungeons", {
   type = "data source",
   text = "WeeklyDungeons",
   icon = [[Interface\AddOns\WeeklyDungeons\Media\Icons\MiniMap-Icon.tga]],
   OnClick = function(self, button) 
      if button == "LeftButton" then
         if a:IsShown() then a:Hide()
         else 
            texNum = 1
            PopulateFrame()
            C_MythicPlus.RequestMapInfo()
            a:Show()
         end
      elseif button == "RightButton" then
         InterfaceOptionsFrame_Show()
         InterfaceOptionsFrame_OpenToCategory("WeeklyDungeons")
      end
   end,
   OnTooltipShow = function(tooltip)
      tooltip:SetText("Weekly Dungeons")
      tooltip:AddLine("\124cFFDE9B5A/wd:\124r Toggles window", 1, 1, 1)
      tooltip:AddLine("\124cFFDE9B5A/wd \124cFFFFFF00icon:\124cFFFFFFFF Toggles minimap icon", 1, 1, 1)
      tooltip:Show()
 end
})
local icon = LibStub("LibDBIcon-1.0")
function addon:WeeklyDungeonsSlashCommand(input)
   if input == "" then
      if a:IsShown() then a:Hide()
      else 
         texNum = 1
         PopulateFrame()
         C_MythicPlus.RequestMapInfo()
         a:Show()
      end
   elseif input == 'icon' then
      self.db.profile.minimap.hide = not self.db.profile.minimap.hide
      if self.db.profile.minimap.hide then
         icon:Hide("WeeklyDungeons")
      else
         icon:Show("WeeklyDungeons")
      end
   elseif input == 'help' then
      print('\124cFFDE9B5A/wd:\124r Shows/Hides window')
      print('\124cFFDE9B5A/wd \124cFFFFFF00icon:\124cFFFFFFFF Shows/Hides minimap icon')
   end
end
--Options panel
local options = {
   name =  "Weekly Dungeons",
   handler = addon,
   type = "group",
   args = {
      enable = {
         name = "Minimap Icon",
         desc = "Enables / disables the minimap icon",
         type = "toggle",
         set = function(info,val)
            addon.db.profile.minimap.hide = not val
            if addon.db.profile.minimap.hide then
               icon:Hide("WeeklyDungeons")
            else
               icon:Show("WeeklyDungeons")
            end
         end,
         get = function(info) return not addon.db.profile.minimap.hide end
      }
   }
}
--Ace3 OnInitialize, Called when the addon is loaded
function addon:OnInitialize()
   LibStub("AceConfig-3.0"):RegisterOptionsTable("WeeklyDungeons", options)
   self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("WeeklyDungeons", "WeeklyDungeons")
   self.db = LibStub("AceDB-3.0"):New("WeeklyDungeonsDB", { profile = { minimap = { hide = false, }, }, })
   icon:Register("WeeklyDungeons", WeeklyDungeonsLDB, self.db.profile.minimap) 
   self:RegisterChatCommand("wd", "WeeklyDungeonsSlashCommand")
end