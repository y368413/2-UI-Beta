---------------要塞按钮---------------------
--GarrisonLandingPageMinimapButton:ClearAllPoints()
--GarrisonLandingPageMinimapButton:SetPoint("CENTER",ObjectiveTrackerFrame,"TOPRIGHT",-43,0)
GarrisonLandingPageMinimapButton:SetScale(0.8)
--GarrisonLandingPageMinimapButton.SetPoint = function() end

------------------------------- Order Hall Resources Tooltip
local categoryInfo = {}
do
	local frame = CreateFrame("Frame")
	frame:SetScript("OnEvent", function(self, event)
		if C_Garrison.GetLandingPageGarrisonType() ~= LE_GARRISON_TYPE_7_0 then return end

		if event == "GARRISON_FOLLOWER_CATEGORIES_UPDATED" then
			categoryInfo = C_Garrison.GetClassSpecCategoryInfo(LE_FOLLOWER_TYPE_GARRISON_7_0)
		else
			C_Garrison.RequestClassSpecCategoryInfo(LE_FOLLOWER_TYPE_GARRISON_7_0)
		end
	end)
	frame:RegisterEvent("GARRISON_FOLLOWER_CATEGORIES_UPDATED")
	frame:RegisterEvent("GARRISON_FOLLOWER_ADDED")
	frame:RegisterEvent("GARRISON_FOLLOWER_REMOVED")
	frame:RegisterEvent("GARRISON_TALENT_COMPLETE")
	frame:RegisterEvent("GARRISON_TALENT_UPDATE")
	frame:RegisterEvent("GARRISON_SHOW_LANDING_PAGE")
end

-- from LibLDBIcon-1.0
local function getAnchors(frame)
	local x, y = frame:GetCenter()
	if not x or not y then return "CENTER" end
	local hhalf = (x > UIParent:GetWidth()*2/3) and "RIGHT" or (x < UIParent:GetWidth()/3) and "LEFT" or ""
	local vhalf = (y > UIParent:GetHeight()/2) and "TOP" or "BOTTOM"
	return vhalf..hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP")..hhalf
end

GarrisonLandingPageMinimapButton:HookScript("OnEnter", function(self)
	if C_Garrison.GetLandingPageGarrisonType() ~= LE_GARRISON_TYPE_7_0 then return end

	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:SetPoint(getAnchors(self))
	GameTooltip:SetText(self.title, 1, 1, 1)
	GameTooltip:AddLine(self.description, nil, nil, nil, true)
	GameTooltip:AddLine(" ")

	local currency, amount, icon = GetCurrencyInfo(C_Garrison.GetCurrencyTypes(LE_GARRISON_TYPE_7_0))
	GameTooltip:AddDoubleLine(currency, ("%s |T%s:0:0:0:2:64:64:4:60:4:60|t"):format(BreakUpLargeNumbers(amount), icon), 1, 1, 1, 1, 1, 1)

	if #categoryInfo > 0 then
		GameTooltip:AddLine(" ")
		for _, info in ipairs(categoryInfo) do
			GameTooltip:AddDoubleLine(info.name, ("%d/%d |T%d:0|t"):format(info.count, info.limit, info.icon), 1, 1, 1, 1, 1, 1)
		end
	end

	GameTooltip:Show()
end)
--------------------------------------------------- ArtifactFrame and Artifact Power
local function openArtifactFrame()
	local currentWeapon = GetInventoryItemID("player", GetInventorySlotInfo("MainHandSlot"))
	if currentWeapon == nil then return end
	local name, link, quality = GetItemInfo(currentWeapon)
	if name and quality == LE_ITEM_QUALITY_ARTIFACT then
		SocketInventoryItem(16)
	end
end
local function ArtifactFrame_Toggle()
	if ArtifactFrame and ArtifactFrame:IsShown() then C_ArtifactUI.Clear()
	else openArtifactFrame() end
end
GarrisonLandingPageMinimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
GarrisonLandingPageMinimapButton:SetScript("OnClick", function(self, button)
	if (IsAltKeyDown() or IsShiftKeyDown() or IsControlKeyDown()) then ArtifactFrame_Toggle()
	elseif button == "RightButton" then ShowGarrisonLandingPage(2) 
	elseif button == "LeftButton" then GarrisonLandingPage_Toggle()  --ShowGarrisonLandingPage(3)
	else ArtifactFrame_Toggle() end
end)

--[[hooksecurefunc("MainMenuBar_ArtifactUpdateOverlayFrameText", function()
	if ArtifactWatchBar.OverlayFrame.Text:IsShown() then
		local _, xpForNextPoint = ArtifactWatchBar.StatusBar:GetMinMaxValues()
		if xpForNextPoint > 0 then
			local text = ArtifactWatchBar.OverlayFrame.Text:GetText()
			local _, _, _, _, totalXP, pointsSpent = C_ArtifactUI.GetEquippedArtifactInfo()
			for i = 0, pointsSpent - 1 do
				totalXP = totalXP + C_ArtifactUI.GetCostForPointAtRank(i)
			end
			text = text .. "    ( 全部神器能量：" .. totalXP.. " )"
			ArtifactWatchBar.OverlayFrame.Text:SetText(text)
		end
	end
end)]]


---------------------------------------------------------
local Enable_ToolTip = true -- Add progress to tooltip (true/false)
function RAHT_print()
	local _, _, _, wq, wqq = GetAchievementCriteriaInfo(11153,1)
    local _, _, _, hk, hkq = GetAchievementCriteriaInfo(11154,1)
    local dg = 0
	for i = 1,GetAchievementNumCriteria(11152) do
        local _, _, _, a = GetAchievementCriteriaInfo(11152,i)
		dg = dg + a
	end
    print("|cFFFF5151[神器进度]|r " .. '完成副本: ' .. dg .. "/100")  --完成地城：Dungeons
    print("|cFFFF5151[神器进度]|r " .. '世界任务: ' .. wq .. "/" .. wqq) --世界任務：World Quests
    print("|cFFFF5151[神器进度]|r " .. '玩家击杀: ' .. hk .. "/" .. hkq) --玩家擊殺：Player Killed
end
SLASH_RAHT1 = '/sq'
local function aphandler(msg)
	RAHT_print()
end
SlashCmdList['RAHT'] = aphandler
--[[if Enable_ToolTip then
    local Artifact_ID = {
        ["128402"] = true,
        ["128292"] = true,
        ["128293"] = true,
        ["128403"] = true,
        ["127829"] = true,
        ["127830"] = true,
        ["128831"] = true,
        ["128832"] = true,
        ["128858"] = true,
        ["128859"] = true,
        ["128860"] = true,
        ["128821"] = true,
        ["128822"] = true,
        ["128306"] = true,
        ["128861"] = true,
        ["128826"] = true,
        ["128808"] = true,
        ["127857"] = true,
        ["128820"] = true,
        ["133959"] = true,
        ["128862"] = true,
        ["128938"] = true,
        ["128937"] = true,
        ["128940"] = true,
        ["133948"] = true,
        ["128823"] = true,
        ["128866"] = true,
        ["128867"] = true,
        ["120978"] = true,
        ["128868"] = true,
        ["128825"] = true,
        ["128827"] = true,
        ["133958"] = true,
        ["128869"] = true,
        ["128870"] = true,
        ["128872"] = true,
        ["134552"] = true,
        ["128476"] = true,
        ["128479"] = true,
        ["128935"] = true,
        ["128936"] = true,
        ["128819"] = true,
        ["128873"] = true,
        ["128911"] = true,
        ["128934"] = true,
        ["128942"] = true,
        ["128943"] = true,
        ["137246"] = true,
        ["128941"] = true,
        ["128910"] = true,
        ["128908"] = true,
        ["134553"] = true,
        ["128289"] = true,
        ["128288"] = true
    }
    local function RAHT_GameTip(tooltip)
        local _, link = tooltip:GetItem()
        if not link then return end       
        local itemString = string.match(link, "item[%-?%d:]+")
        local _, itemId = strsplit(":", itemString)
        if itemId and Artifact_ID[itemId] then
            local _, _, _, wq, wqq = GetAchievementCriteriaInfo(11153,1)
            local _, _, _, hk, hkq = GetAchievementCriteriaInfo(11154,1)
            local dg = 0
            for i = 1,GetAchievementNumCriteria(11152) do
                local _, _, _, a = GetAchievementCriteriaInfo(11152,i)
                dg = dg + a
            end
            local tooltipstring = ""
            if dg ~= 0 and dg < 100 then
                tooltipstring = tooltipstring .. "|n" .. '完成副本：' .. dg .. "/100"
            end
            if wq ~= 0 and wq < wqq then
                tooltipstring = tooltipstring .. "|n" .. '世界任务： ' .. wq .. "/" .. wqq
            end
            if hk ~= 0 and hk < hkq then
                tooltipstring = tooltipstring .. "|n" .. '玩家击杀:  ' .. hk .. "/" .. hkq
            end
            tooltip:AddLine(tooltipstring ,1 ,1 ,1)
            tooltip:Show()
        end
    end
    GameTooltip:HookScript("OnTooltipSetItem", RAHT_GameTip)
end]]

---------ArtifactPowerUser
local itemLink, bag, slot 
local Cache = {} 
local tooltipName = "APUscanner" 
local tooltipScanner = CreateFrame("GameTooltip", tooltipName, nil, "GameTooltipTemplate") 
local ARTIFACT_POWER = ARTIFACT_POWER 

local APU = CreateFrame("Button", "ArtifactPowerUserButton", UIParent, "ActionButtonTemplate, SecureActionButtonTemplate") 
APU:SetPoint("TOPRIGHT",UIParent,"TOPRIGHT",0,-210)
APU:SetSize(43, 43) 
APU:SetClampedToScreen(true) 
APU:EnableMouse(true) 
APU:SetMovable(true) 
APU:SetUserPlaced(true) 
APU:SetScript("OnMouseDown", function(self, btn) 
   if (btn == 'LeftButton') and (IsShiftKeyDown()) then
      self:StartMoving() 
   end 
end) 
APU:SetScript("OnMouseUp", function(self) 
   self:StopMovingOrSizing() 
end) 

APU.icon = APU:CreateTexture(nil, "ARTWORK") 
APU.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9) 
APU.icon:SetAllPoints() 
APU.icon:SetPoint("TOPLEFT", APU, "TOPLEFT", 2, -2) 
APU.icon:SetPoint("BOTTOMRIGHT", APU, "BOTTOMRIGHT", -2, 2) 

APU:SetScript("OnHide", function(self) 
   self:SetAttribute("type", nil) 
   self:SetAttribute("item", nil) 
end) 
APU:SetScript("OnEnter", function(self) 
   _G["GameTooltip"]:SetOwner(self, "ANCHOR_RIGHT") 
   _G["GameTooltip"]:SetHyperlink(itemLink) 
end) 
APU:SetScript("OnLeave", function(self) 
   GameTooltip_Hide() 
end) 
   
local function ScanBags() 
   for bag = 0, NUM_BAG_SLOTS do 
      for slot = 1, GetContainerNumSlots(bag) do 
         local itemLink = GetContainerItemLink(bag, slot) 
         if itemLink and itemLink:match("item:%d") then 
            if Cache[itemLink] then 
               return itemLink, bag, slot 
            else 
               tooltipScanner:SetOwner(UIParent, "ANCHOR_NONE") 
               tooltipScanner:SetHyperlink(itemLink) 
               local tooltipText = _G[tooltipName.."TextLeft2"]:GetText() 
               if tooltipText and tooltipText:match(ARTIFACT_POWER) then 
                  Cache[itemLink] = true 
                  return itemLink, bag, slot 
               end 
            end 
         end 
      end 
   end 
   return nil 
end 

local function UpdateItem(self) 
   if not InCombatLockdown() then 
      itemLink, bag, slot = ScanBags() 
      if itemLink then 
         self:SetAttribute("type", "item") 
         self:SetAttribute("item", bag.." "..slot) 
         local itemTexture = GetItemIcon(itemLink) 
         self.icon:SetTexture(itemTexture) 
         local start, duration, enable = GetContainerItemCooldown(bag, slot) 
         if duration > 0 then 
            self.cooldown:SetCooldown(start, duration) 
         end 
         self:Show() 
         if self:IsMouseOver() then   --update tooltip 
            _G["GameTooltip"]:SetHyperlink(itemLink) 
         end 
         _G["GameTooltip"]:Show() 
      else 
         self:Hide() 
         _G["GameTooltip"]:Hide() 
      end 
   end 
end 

local ArtifactPowerUserFrame = CreateFrame("Frame") 
ArtifactPowerUserFrame:RegisterEvent("ADDON_LOADED") 
ArtifactPowerUserFrame:RegisterEvent("PLAYER_ENTERING_WORLD") 
ArtifactPowerUserFrame:RegisterEvent("BAG_UPDATE_DELAYED") 
ArtifactPowerUserFrame:RegisterEvent("PLAYER_REGEN_DISABLED") 
ArtifactPowerUserFrame:RegisterEvent("PLAYER_REGEN_ENABLED")  
ArtifactPowerUserFrame:SetScript("OnEvent", function(self, event, ...) 
   self:UnregisterEvent("ADDON_LOADED") 
   if  event == "BAG_UPDATE_DELAYED" then 
      UpdateItem(APU) 
   elseif event == "PLAYER_REGEN_DISABLED" then 
      self:UnregisterEvent("BAG_UPDATE_DELAYED") 
      APU:Hide() 
      _G["GameTooltip"]:Hide() 
   elseif event == "PLAYER_REGEN_ENABLED" then 
      UpdateItem(APU) 
      self:RegisterEvent("BAG_UPDATE_DELAYED")  
   end 
end)