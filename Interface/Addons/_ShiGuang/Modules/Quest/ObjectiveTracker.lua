local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Skins")
local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b

function module:QuestTracker()
  -- Questblock click enhant
	local function QuestHook(id)
		local questLogIndex = GetQuestLogIndexByID(id)
		if IsControlKeyDown() and CanAbandonQuest(id) then QuestMapQuestOptions_AbandonQuest(id)
		elseif IsAltKeyDown() and GetQuestLogPushable(questLogIndex) then QuestMapQuestOptions_ShareQuest(id)
		end
	end
	hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderClick", function(_, block) QuestHook(block.id) end)
	hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self) QuestHook(self.questID) end)

	-- Show quest color and level
	hooksecurefunc("QuestLogQuests_AddQuestButton", function(_, _, _, title, level, _, isHeader, _, isComplete, frequency, questID)
		if ENABLE_COLORBLIND_MODE == "1" then return end
		for button in pairs(QuestScrollFrame.titleFramePool.activeObjects) do
			if title and not isHeader and button.questID == questID then
				local title = "["..level.."] "..title
				if isComplete then title = "|cffff78ff"..title elseif frequency == LE_QUEST_FREQUENCY_DAILY then title = "|cff3399ff"..title end
				button.Text:SetText(title)
				button.Text:SetPoint("TOPLEFT", 24, -5)
				button.Text:SetWidth(205)
				button.Text:SetWordWrap(false)
				button.Check:SetPoint("LEFT", button.Text, button.Text:GetWrappedWidth(), 0)
			end end end)
	
	-- Hook objective tracker
	hooksecurefunc(QUEST_TRACKER_MODULE, "Update", function()
		for i = 1, GetNumQuestWatches() do
			local questID, title, questLogIndex, numObjectives, requiredMoney, isComplete, startEvent, isAutoComplete, failureTime, timeElapsed, questType, isTask, isStory, isOnMap, hasLocalPOI = GetQuestWatchInfo(i)
			if ( not questID ) then break end
			local oldBlock = QUEST_TRACKER_MODULE:GetExistingBlock(questID)
			if oldBlock then
				local oldBlockHeight = oldBlock.height
			  local oldHeight = QUEST_TRACKER_MODULE:SetStringText(oldBlock.HeaderText, title, nil, OBJECTIVE_TRACKER_COLOR["Header"])
			  local newTitle = "["..select(2, GetQuestLogTitle(questLogIndex)).."] "..title
			  local newHeight = QUEST_TRACKER_MODULE:SetStringText(oldBlock.HeaderText, newTitle, nil, OBJECTIVE_TRACKER_COLOR["Header"])
			  oldBlock:SetHeight(oldBlockHeight + newHeight - oldHeight);
			end end end)

-- Hook quest info
	hooksecurefunc("QuestInfo_Display", function(template, parentFrame, acceptButton, material, mapView)
		local elementsTable = template.elements
		for i = 1, #elementsTable, 3 do
			if elementsTable[i] == QuestInfo_ShowTitle then
				if QuestInfoFrame.questLog then
					local questLogIndex = GetQuestLogSelection()
					if questLogIndex > 0 then QuestInfoTitleHeader:SetText("["..select(2, GetQuestLogTitle(questLogIndex)).."] "..QuestInfoTitleHeader:GetText()) end
				end end end end)

  -- Move Headers 
  local function Moveit(header) 
    header:EnableMouse(true)	
	  header:RegisterForDrag("LeftButton")
    header:SetHitRectInsets(-15, -15, -5, -5)
 	  header:HookScript("OnDragStart", function(s) ObjectiveTrackerFrame:StartMoving() end) 
	  header:HookScript("OnDragStop", function(s)
	  ObjectiveTrackerFrame:StopMovingOrSizing()
	 end)
  end
  
	-- Reskin Headers
	local function reskinHeader(header)
		header.Text:SetTextColor(r, g, b)
		header.Background:Hide()
		local bg = header:CreateTexture(nil, "ARTWORK")
		bg:SetTexture("Interface\\LFGFrame\\UI-LFG-SEPARATOR")
		bg:SetTexCoord(0, .66, 0, .31)
		bg:SetVertexColor(r, g, b, .8)
		bg:SetPoint("BOTTOMLEFT", -30, -4)
		bg:SetSize(250, 30)
	end

	local headers = {
		ObjectiveTrackerBlocksFrame.QuestHeader,
		ObjectiveTrackerBlocksFrame.AchievementHeader,
		ObjectiveTrackerBlocksFrame.ScenarioHeader,
		BONUS_OBJECTIVE_TRACKER_MODULE.Header,
		WORLD_QUEST_TRACKER_MODULE.Header,
	}
	for _, header in pairs(headers) do Moveit(header) reskinHeader(header) end
end

-- 任务名称职业着色 -------------------------------------------------------
function module:QuestTrackerSkinTitle()
 if not MaoRUISettingDB["Skins"]["QuestTrackerSkinTitle"] then return end
    hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
        --for i = 1, GetNumQuestWatches() do
		    --local questID = GetQuestWatchInfo(i)
	        --if not questID then break end
            --local block = QUEST_TRACKER_MODULE:GetBlock(questID)
	          block.HeaderText:SetFont(STANDARD_TEXT_FONT, 12, 'nil')
	          block.HeaderText:SetShadowOffset(.7, -.7)
	          block.HeaderText:SetShadowColor(0, 0, 0, 1)
              block.HeaderText:SetTextColor(r, g, b)
              block.HeaderText:SetJustifyH("LEFT")
          --end
     end)
     local function hoverquest(_, block)
     --for i = 1, GetNumQuestWatches() do
		    --local id = GetQuestWatchInfo(i)
	        --if not id then break end
	        --QUEST_TRACKER_MODULE:GetBlock(id).HeaderText:SetTextColor(r, g, b)
	        block.HeaderText:SetTextColor(r, g, b)
        --end
     end
    hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderEnter", hoverquest)  
    hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderLeave", hoverquest)
 end   
    
 -- numQuests -------------------------------------------------------
local numQuests=CreateFrame('frame')
numQuests:RegisterEvent('PLAYER_LOGIN')
numQuests:RegisterEvent('QUEST_LOG_UPDATE')
numQuests:SetScript('OnEvent',function() 
  if not InCombatLockdown() then  --not InCombat and 
		ObjectiveTrackerBlocksFrame.QuestHeader.Text:SetText(tostring(select(2,GetNumQuestLogEntries())).."/"..MAX_QUESTS.." "..TRACKER_HEADER_QUESTS)
		ObjectiveTrackerFrame.HeaderMenu.Title:SetText(tostring(select(2,GetNumQuestLogEntries())).."/"..MAX_QUESTS.." "..OBJECTIVES_TRACKER_LABEL)
		--WorldMapFrame.BorderFrame.TitleText:SetText(MAP_AND_QUEST_LOG.." ("..tostring(select(2,GetNumQuestLogEntries())).."/"..MAX_QUESTS..")")
	end 
end)

 -- CompletedTip -----------------------------------------------------------Version: 1.0.0.70300    --Author: InvisiBill
local function onSetHyperlink(self, link)
    local type, id = string.match(link,"^(%a+):(%d+)")
    if not type or not id then return end
    if type == "quest" then
        if IsQuestFlaggedCompleted(id) then
            self:AddDoubleLine(AUCTION_CATEGORY_QUEST_ITEMS, GARRISON_MISSION_COMPLETE, 1, 0.82, 0, 0, 1, 0)
        else
            self:AddDoubleLine(AUCTION_CATEGORY_QUEST_ITEMS, INCOMPLETE , 1, 0.82, 0, 1, 0, 0)
        end
        self:Show()
    end
end
hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink)
hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink)