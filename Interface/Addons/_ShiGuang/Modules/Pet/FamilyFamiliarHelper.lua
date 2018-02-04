-- key binding globals for Bindings.xml
BINDING_HEADER_FAMILYFAMILIARHELPER = "|cFFBF00FF[宠物]|rLEG成就"
BINDING_NAME_FAMILYFAMILIARHELPER_TOGGLE = "    查看"

FamilyFamiliarHelperSettings = {} -- savedvariable

local ffh = CreateFrame("Frame","FamilyFamiliarHelper",UIParent,"BasicFrameTemplateWithInset")
ffh:Hide()
ffh:SetMovable(true)
ffh:SetSize(460,368)
ffh:SetPoint("CENTER")
ffh:SetFrameStrata("HIGH")
ffh:SetFlattensRenderLayers(true) -- makes frame behave like toplevel without click-to-front bit

-- add achievement IDs to the end of this list to add new tabs (tabs are displayed in reverse order)
-- 1=Family Familiar, 2=Family Fighter, 3=Family Brawler
ffh.achievementFamilies = { 9696, 12100, 12290 }

-- sub-achievement IDs grouped under their achievement and in the order of PET_TYPE_SUFFIXes
-- 1=humanoid, 2=dragonkin, 3=flying, 4=undead, 5=critter, 6=magic, 7=elemental, 8=beast, 9=aquatic, 10=mechanical
-- add the 10 sub-achievements to this table when a new tab/family achievement is added
ffh.achievementIDs = {
      [1] = { 9692, 9689, 9691, 9695, 9688, 9693, 9690, 9687, 9686, 9694 }, -- Family Familiar
      [2] = { 12096, 12093, 12095, 12099, 12092, 12097, 12094, 12091, 12089, 12098 }, -- Family Fighter
      [3] = { 12289, 12287, 12286, 12285, 12284, 12283, 12282, 12281, 12280, 12279 }, -- Family Brawler
}

-- lookup table for the npcIDs involved in the achievements; value is the index to the above achievementID group
-- (ex 1=family familiar, 2=family fighter); key is a string since it's pulled out of a GUID string
ffh.notableNPCs = {
   -- Family Familiar npcIDs
   ["98270"]=1, ["99210"]=1, ["105674"]=1, ["97804"]=1, ["99182"]=1,
   ["104970"]=1, ["107489"]=1, ["104553"]=1, ["97709"]=1, ["99150"]=1,
   ["105250"]=1, ["99035"]=1, ["99077"]=1, ["106552"]=1, ["105455"]=1,
   -- Family Fighter npcIDs
   ["128007"]=2, ["128009"]=2, ["128011"]=2, ["128013"]=2, ["128014"]=2,
   ["128017"]=2, ["128019"]=2, ["128021"]=2, ["128023"]=2, ["128008"]=2,
   ["128010"]=2, ["128012"]=2, ["128015"]=2, ["128016"]=2, ["128018"]=2,
   ["128020"]=2, ["128022"]=2, ["128024"]=2,
   -- Family Brawler has no npcIDs; it's "Battle #1" through "Battle #10"
}

ffh.criterias = {} -- numerically indexed list of criteria (npc name) for display sort purposes
ffh.progress = {} -- indexed by criterea (npc name), sub-table of 10 types and whether completed
-- ie ffh.progress[1]["Tiffany Nelson"]={nil,nil,true,nil,true,nil,nil,nil,nil,true}

-- this adds a sub-table for each achievement family to .criterias and .progress, so for 7.3 ffh.criterias will
-- start as {{},{}}, a subgroup for each achievement family
for i=1,#ffh.achievementFamilies do
   tinsert(ffh.criterias,{})
   tinsert(ffh.progress,{})
end

ffh.firstRun = true -- becomes nil after the first setup

-- when the frame is shown, the UI is created if needed, and everything updated
function ffh:OnShow()
   ffh:SetupUI() -- set up the display if it hasn't been set up before
   ffh:UpdateUI() -- update the display's contents
end

-- this updates the ffh.progress table with each achievement's completed criteria
function ffh:UpdateProgress()
   for achievementFamily=1,#ffh.achievementFamilies do
      for petType,achievementID in ipairs(ffh.achievementIDs[achievementFamily]) do
         if achievementFamily==3 then -- for family brawler which doesn't have npc criteria
            local _,_,_,battlesWon = GetAchievementCriteriaInfo(achievementID,1)
            for criteria=1,10 do
               -- instead of npc names, using "Win # 1", "Win # 2", etc for names of criteria
               local name = format("%s #%2d", WIN, criteria)
               if not ffh.progress[achievementFamily][name] then
                  ffh.progress[achievementFamily][name] = {}
                  tinsert(ffh.criterias[achievementFamily],name)
               end
               ffh.progress[achievementFamily][name][petType] = battlesWon>=criteria
            end
         else
            for criteria=1,GetAchievementNumCriteria(achievementID) do
               local name,_,completed = GetAchievementCriteriaInfo(achievementID,criteria)
               if not ffh.progress[achievementFamily][name] then -- name not encountered before, set up its table and add to list
                  ffh.progress[achievementFamily][name] = {}
                  tinsert(ffh.criterias[achievementFamily],name)
               end
               ffh.progress[achievementFamily][name][petType] = completed
            end
         end
      end
   end
end

-- this updates the display depending on the active tab
function ffh:UpdateUI()

   if ffh:IsVisible() then

      local tab = FamilyFamiliarHelperSettings.ActiveTab

      ffh:UpdateProgress() -- update ffh.progress with how far along each achievement is
      ffh:UpdateOptions() -- update checkbutton options and ESCability

      local numCriterias = #ffh.criterias[tab]
      for i=1,numCriterias do
         local button = ffh.ListButtons[i]
         local name = ffh.criterias[tab][i]
         button.Name:SetText(name) -- sets the name label
         button.name = name -- and saves it for comparison to highlight
         for j=1,10 do -- light up pet types in the row that have been completed
            button[j]:SetAlpha(ffh.progress[tab][name][j] and 1 or 0.125)
         end
         button:Show()
      end
      -- hide any remaining rows not visible in this tab
      for i=numCriterias+1,#ffh.ListButtons do
         ffh.ListButtons[i]:Hide()
      end
      ffh:UpdateHighlight() -- update targeted highlight (orange border around row)
      ffh:SetHeight(68+20*numCriterias) -- adjust window height for number of criterias
      -- and total up pet types
      for i=1,10 do
         local total = 0
         for j=1,numCriterias do
            if ffh.progress[tab][ffh.criterias[tab][j]][i] then
               total = total + 1
            end
         end
         -- if achievement has been completed, display a green check instead of a number
         local _,_,_,completed = GetAchievementInfo(ffh.achievementIDs[tab][i])
         ffh.HeaderIcons[i].Total:SetText(completed and "\124TInterface\\RaidFrame\\ReadyCheck-Ready:18\124t" or total)
      end
   end
end

-- mouseover of header will show the achievement's tooltip
local function headerOnEnter(self)
   GameTooltip:SetOwner(self,"ANCHOR_LEFT")
   GameTooltip:SetHyperlink(GetAchievementLink(ffh.achievementIDs[FamilyFamiliarHelperSettings.ActiveTab][self:GetID()]))
   GameTooltip:Show()
   GameTooltip:ClearAllPoints()
   GameTooltip:SetPoint("BOTTOMRIGHT",ffh,"BOTTOMRIGHT",-6,32)
   GameTooltip:SetBackdrop(ffh.newTooltipBackdrop)
   GameTooltip:SetBackdropColor(0.05,0.05,0.05)
end

local function hideTooltip(self)
   GameTooltip:Hide()
   GameTooltip:SetBackdrop(ffh.oldTooltipBackdrop)
   GameTooltip:SetBackdropColor(0.09,0.09,0.2)
end

-- called during the OnShow: sets up the UI if it hasn't been setup already
function ffh:SetupUI()
   if ffh.firstRun then
      ffh.firstRun = nil
      ffh.TitleText:SetText("Family Familiar Helper \124cffa0a0a01.2.0")
      ffh.TitleText:SetPoint("TOP",-6,-5)
      ffh.InsetBg:SetPoint("BOTTOMRIGHT",-6,32)
      -- first go through and remove any achievements that don't exist (in case running on live client and new achievements added on PTR)
      for i=#ffh.achievementFamilies,1,-1 do
         if not GetAchievementInfo(ffh.achievementFamilies[i]) then
            tremove(ffh.achievementFamilies,i)
         end
      end
      -- set up rows
      ffh:UpdateProgress() -- need to gather criterias to know how many rows to make
      -- sort the criterias; also note max number of criterias for each list
      local maxCriterias = 0
      for i=1,#ffh.criterias do
         table.sort(ffh.criterias[i]) -- sort the name of the criteria
         maxCriterias = max(maxCriterias,#ffh.criterias[i])
      end
      ffh.ListButtons = {}
      -- now make each row
      for i=1,maxCriterias do
         ffh.ListButtons[i] = ffh:CreateListButton(i)
         ffh.ListButtons[i]:SetPoint("TOPLEFT",11,-36-i*20+26)
         for j=1,10 do -- 10 type buttons for each row
            ffh.ListButtons[i][j] = ffh.ListButtons[i]:CreateTexture(nil,"ARTWORK")
            ffh.ListButtons[i][j]:SetSize(22,22)
            ffh.ListButtons[i][j]:SetPoint("RIGHT",-(10-j)*28,0)
            ffh.ListButtons[i][j]:SetTexture("Interface\\Icons\\Pet_Type_"..PET_TYPE_SUFFIX[j])
            ffh.ListButtons[i][j]:SetAlpha(0.1)
         end
      end
      -- set up header icons
      ffh.HeaderIcons = {}
      for i=1,10 do -- for 10 pet types
         local button = CreateFrame("Button",nil,ffh)
         ffh.HeaderIcons[i] = button
         button:SetSize(28,28)
         local xoffset = ffh.ListButtons[1][i]:GetCenter() - ffh:GetLeft() -- align with columns but don't anchor to them
         button:SetPoint("BOTTOM",ffh,"BOTTOMLEFT",xoffset,3) -- anchor to bottom of window instead
         button:SetNormalTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[i])
         local normal = button:GetNormalTexture()
         normal:SetTexCoord(0.4921875,0.796875,0.50390625,0.65625)
         normal:SetVertexColor(0.5,0.5,0.5)
         button:SetHighlightTexture("Interface\\PetBattles\\PetBattleHUD")
         local highlight = button:GetHighlightTexture()
         highlight:SetTexCoord(0.884765625,0.943359375,0.681640625,0.798828125)
         button.Total = button:CreateFontString(nil,"OVERLAY","GameFontNormalLargeOutline")
         button.Total:SetPoint("CENTER",ffh.HeaderIcons[i],"CENTER",0,0)
         button.Total:SetTextColor(1,1,1)
         button:SetID(i)
         button:SetScript("OnEnter",headerOnEnter)
         button:SetScript("OnLeave",hideTooltip)
      end
      -- total label to left of headers
      local total = ffh:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
      total:SetText(TOTAL)
      total:SetPoint("RIGHT",ffh.HeaderIcons[1].Total,"LEFT",-14,0)
      -- option checkboxes
      local lock = ffh:CreateCheck("Locked","Lock Window","While checked, this window cannot be dismissed with the ESCape key, nor can it be dragged around the screen unless [Shift] is held.")
      lock:SetPoint("BOTTOMLEFT",8,4)
      local autoShow = ffh:CreateCheck("AutoShow","Auto Show","While checked, anytime you target one of the Family Familiar tamers, this window will show.\n\nIf this is unchecked you can still summon the window with the \124cffffffff/ffh\124r command or key binding.")
      autoShow:SetPoint("LEFT",lock,"RIGHT",-4,0)
      local justOnce = ffh:CreateCheck("JustOnce","Just Once","While checked, Auto Show will summon the window only the first time you target a Family Familiar tamer, until you've moved on to another tamer.")
      justOnce:SetPoint("LEFT",autoShow,"RIGHT",-4,0)
      -- tabs across bottom of window
      ffh.Tabs = {}
      ffh.maxTabWidth = 128 -- default max width is 88; 128 gives some room for localization
      ffh.numTabs = #ffh.achievementFamilies -- number of tabs is number of Family X achievements (two as of 7.3)
      -- create tabs from most recent family X achievement to oldest (reverse order of their index)
      for i=ffh.numTabs,1,-1 do
         local _,name = GetAchievementInfo(ffh.achievementFamilies[i]) -- used localized name of achievement for tab name
         if name then -- confirm achievement exists
            ffh.Tabs[i] = CreateFrame("Button","FamilyFamiliarHelperTab"..i,ffh,"CharacterFrameTabButtonTemplate")
            ffh.Tabs[i]:SetText(name)
            ffh.Tabs[i]:SetID(i)
            if i==ffh.numTabs then -- first tab (last in list of tabs) anchored to left
               ffh.Tabs[i]:SetPoint("TOPLEFT",ffh,"BOTTOMLEFT",0,1)
            else -- rest of tabs anchor to the previous tab created (+1 since going backwards)
               ffh.Tabs[i]:SetPoint("LEFT",ffh.Tabs[i+1],"RIGHT",-16,0)
            end
            ffh.Tabs[i]:SetScript("OnClick",ffh.PanelTabOnClick)
            ffh.Tabs[i]:GetScript("OnShow")(ffh.Tabs[i]) -- fake an OnShow to get the tab to resize to fit its text
         else -- achievement doesn't exist; we're likely on live and 7.3 hasn't launched yet (or future PTRs)
            ffh.numTabs = i-1 -- change number of tabs to the last valid achievement
            break -- and stop trying other achievements (if they exist)
         end
      end
      local settings = FamilyFamiliarHelperSettings
      PanelTemplates_SetTab(ffh,settings.ActiveTab) -- start at first tab (unless one saved in settings)
      if ffh.numTabs==1 then -- if a single tab exists (7.2.x client) hide the lone tab
         ffh.Tabs[1]:Hide()
      end
      -- position parent window
      if not settings.XPos then -- if coordinates not saved yet, get BOTTOMLEFT of default position
         settings.XPos = ffh:GetLeft()
         settings.YPos = ffh:GetBottom()
      end
      -- and anchor it to saved position
      ffh:ClearAllPoints()
      ffh:SetPoint("BOTTOMLEFT",settings.XPos,settings.YPos)
   end
end

function ffh:OnHide()
   ffh:UpdateESCability(true)
end

local function listOnEnter(self) self.Back:Show() end
local function listOnLeave(self) self.Back:Hide() end

-- formerly a template
function ffh:CreateListButton(index)
   local button = CreateFrame("Button",nil,ffh)
   button:SetSize(436,20)
   button.Name = button:CreateFontString(nil,"ARTWORK","GameFontHighlight")
   button.Name:SetSize(162,20)
   button.Name:SetPoint("LEFT",2,0)
   button.Name:SetJustifyH("LEFT")
   button.Back = button:CreateTexture(nil,"BACKGROUND")
   button.Back:SetAllPoints(true)
   button.Back:SetColorTexture(0.25,0.75,1.0,0.15)
   button.Back:Hide()
   -- highlight is a frame with a 1px gold border
   button.Highlight = CreateFrame("Frame",nil,button)
   button.Highlight:SetBackdrop({edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=1})
   button.Highlight:SetBackdropBorderColor(1,0.82,0,0.75)
   button.Highlight:SetPoint("TOPLEFT",-2,2)
   button.Highlight:SetPoint("BOTTOMRIGHT",2,-2)
   button:SetScript("OnEnter",listOnEnter)
   button:SetScript("OnLeave",listOnLeave)
   return button
end

--[[ Handler stuff ]]

-- used by Bindings.xml and LDB button in addition to slash command
function ffh:Toggle()
   ffh:SetShown(not ffh:IsVisible())
end

-- slash handler (/ffh to toggle window)
SlashCmdList["FFH"] = ffh.Toggle
SLASH_FFH1 = "/ffh"

-- event/script handlers
ffh:SetScript("OnShow",ffh.OnShow)
ffh:SetScript("OnHide",ffh.OnHide)
ffh:SetScript("OnMouseDown",function(self)
   if not FamilyFamiliarHelperSettings.Locked or IsShiftKeyDown() then
      self:StartMoving()
   end
end)
ffh:SetScript("OnMouseUp",function(self)
   self:StopMovingOrSizing()
   -- save anchor positions (with frame changing height, want to keep bottom of frame stationary)
   local settings = FamilyFamiliarHelperSettings
   settings.XPos = ffh:GetLeft()
   settings.YPos = ffh:GetBottom()
   ffh:ClearAllPoints()
   ffh:SetPoint("BOTTOMLEFT",settings.XPos,settings.YPos) -- re-anchor from potential "CENTER" imposed by StartMoving()
end)

ffh:SetScript("OnEvent",function(self,event,...)
   ffh[event](self,...)
end)

function ffh:PLAYER_LOGIN()
   -- set up defaults
   for var,default in pairs({AutoShow=true,JustOnce=true,ActiveTab=1}) do
      if FamilyFamiliarHelperSettings[var]==nil then
         FamilyFamiliarHelperSettings[var] = default
      end
   end
   ffh:UpdateOptions()
   ffh.oldTooltipBackdrop = GameTooltip:GetBackdrop()
   ffh.newTooltipBackdrop = CopyTable(ffh.oldTooltipBackdrop)
   ffh.newTooltipBackdrop.bgFile = "Interface\\ChatFrame\\ChatFrameBackground"

   -- add launcher button for LDB if it exists
	local ldb = LibStub and LibStub:GetLibrary("LibDataBroker-1.1",true)
   if ldb then
	  ldb:NewDataObject("FamilyFamiliarHelper",{ type="launcher", icon="Interface\\Icons\\Icon_PetFamily_Beast", iconCoords={0.075,0.925,0.075,0.925}, tooltiptext="Family Familiar Helper", OnClick=ffh.Toggle })
	end

end
ffh:RegisterEvent("PLAYER_LOGIN")

-- registered if AutoShow enabled; if one of the notableNPCs is targeted then summons window
-- unless it's already been summoned or JustOnce is unchecked.
function ffh:PLAYER_TARGET_CHANGED()
   local npcID
   if UnitExists("target") then
      local guid = UnitGUID("target")
      if guid then
         local settings = FamilyFamiliarHelperSettings
         npcID = guid:match(".-%-%d+%-%d+%-%d+%-%d+%-(%d+)")
         local npcTab = ffh.notableNPCs[npcID]
         if npcTab and (not settings.JustOnce or npcID~=ffh.lastInteracted) then
            ffh.lastInteracted = npcID
            ffh:Show()
         end
         -- if frame is on screen and we're on the wrong tab for the target, switch to the right tab
         if ffh:IsVisible() and npcTab and settings.ActiveTab~=npcTab then -- this npcID is in a different tab than the one we're presently in
            settings.ActiveTab = npcTab -- switch tab to this npc's tab
            PanelTemplates_SetTab(ffh,npcTab)
            ffh:UpdateUI() -- and update now that we're on right tab
         end
      end
   end
   -- if window is up, highlight current target
   if ffh:IsVisible() then
      ffh:UpdateHighlight()
   end
end

-- called when window shown and target changes while window up; to highlight the targeted tamer
function ffh:UpdateHighlight()
   local target = UnitName("target")
   for _,button in ipairs(ffh.ListButtons) do
      button.Highlight:SetShown(button.name==target)
   end
end

-- click of any of the tabs across the bottom. As of 7.3, either Family Familiar or Family Fighter
function ffh:PanelTabOnClick()
   FamilyFamiliarHelperSettings.ActiveTab = self:GetID() -- remember this tab so we return to it in future sessions
   PanelTemplates_SetTab(ffh,self:GetID())
   ffh:UpdateUI()
end

--[[ Options ]]

-- run at PLAYER_LOGIN, OnShow and checkOnClick to update whether PLAYER_TARGET_CHANGED
-- is registered, the on-screen checkbuttons and the ESCability of the window.
-- run at PLAYER_LOGIN and checkOnClick: registers/unregisters for the targeting event based on AutoShow
-- and whether the frame is in UISpecialFrames
function ffh:UpdateOptions()
   local settings = FamilyFamiliarHelperSettings
   local registered = ffh:IsEventRegistered("PLAYER_TARGET_CHANGED")
   if settings.AutoShow and not registered then
      ffh:RegisterEvent("PLAYER_TARGET_CHANGED")
   elseif not settings.AutoShow and registered then
      ffh:UnregisterEvent("PLAYER_TARGET_CHANGED")
   end
   if ffh:IsVisible() then
      ffh.Locked:SetChecked(settings.Locked)
      ffh.AutoShow:SetChecked(settings.AutoShow)
      ffh.JustOnce:SetChecked(settings.JustOnce)
      ffh.JustOnce:SetShown(settings.AutoShow)
      ffh:UpdateESCability()
      ffh:UpdateHighlight()
   end
end

-- OnEnter of one of the checkbuttons shows its tooltip to explain what it does
local function checkOnEnter(self)
   GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
   GameTooltip:AddLine(self.tooltipTitle,1,1,1)
   GameTooltip:AddLine(self.tooltipBody,nil,nil,nil,true)
   GameTooltip:Show()
   GameTooltip:ClearAllPoints()
   GameTooltip:SetPoint("BOTTOMLEFT",ffh,"BOTTOMLEFT",6,32)
   GameTooltip:SetBackdrop(ffh.newTooltipBackdrop)
   GameTooltip:SetBackdropColor(0.05,0.05,0.05)
end

-- OnClick will toggle the settings and update
local function checkOnClick(self)
   FamilyFamiliarHelperSettings[self.var] = self:GetChecked() and true -- make sure it's true/false
   ffh:UpdateOptions()
end

function ffh:CreateCheck(name,title,body)
   ffh[name] = CreateFrame("CheckButton",nil,ffh,"UICheckButtonTemplate")
   ffh[name]:SetSize(26,26)
   ffh[name]:SetScript("OnEnter",checkOnEnter)
   ffh[name]:SetScript("OnLeave",hideTooltip)
   ffh[name]:SetScript("OnClick",checkOnClick)
   ffh[name].tooltipTitle = title
   ffh[name].tooltipBody = body
   ffh[name].var = name
   return ffh[name]
end

-- while Locked is unchecked, the frame only exists in UISpecialFrames while it's on screen
function ffh:UpdateESCability(hide)
   if FamilyFamiliarHelperSettings.Locked or not ffh:IsVisible() or hide then
      for i=#UISpecialFrames,1,-1 do
         if UISpecialFrames[i]=="FamilyFamiliarHelper" then
            tremove(UISpecialFrames,i)
         end
      end
   elseif not tContains(UISpecialFrames,"FamilyFamiliarHelper") then
      tinsert(UISpecialFrames,"FamilyFamiliarHelper")
   end
end
