local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:GetModule("Skins")
local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b

function module:QuestTracker()
	-- Questblock click enhant
	local function QuestHook(id)
		local questLogIndex = GetQuestLogIndexByID(id)
		if IsControlKeyDown() and CanAbandonQuest(id) then QuestMapQuestOptions_AbandonQuest(id)
		elseif IsAltKeyDown() and GetQuestLogPushable(questLogIndex) then QuestMapQuestOptions_ShareQuest(id)
		end
	end
	hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderClick", function(self, block) QuestHook(block.id) end)
	hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self) QuestHook(self.questID) end)

	-- Show quest color and level
	local function Showlevel()
		if ENABLE_COLORBLIND_MODE == "1" then return end
		local numEntries = GetNumQuestLogEntries()
		local titleIndex = 1
		for i = 1, numEntries do
			local title, level, _, isHeader, _, isComplete, frequency, questID = GetQuestLogTitle(i)
			local titleButton = QuestLogQuests_GetTitleButton(titleIndex)
			if title and (not isHeader) and titleButton.questID == questID then
				titleButton.Check:SetPoint("LEFT", titleButton.Text, titleButton.Text:GetWrappedWidth() + 2, 0)
				titleIndex = titleIndex + 1
				local text = "["..level.."] "..title
				if isComplete then
					text = "|cffff78ff"..text
				elseif frequency == LE_QUEST_FREQUENCY_DAILY then
					text = "|cff3399ff"..text
				end
				titleButton.Text:SetText(text)
				titleButton.Text:SetPoint("TOPLEFT", 24, -5)
				titleButton.Text:SetWidth(216)
			end
		end
	end
	hooksecurefunc("QuestLogQuests_Update", Showlevel)

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
  -- Move Headers 
  local function Moveit(header) 
    header:EnableMouse(true)	
	  header:RegisterForDrag("LeftButton")
    header:SetHitRectInsets(-15, -15, -5, -5)
 	  header:HookScript("OnDragStart", function(s) 
       ObjectiveTrackerFrame:StartMoving() 
    end) 
	  header:HookScript("OnDragStop", function(s)
	  ObjectiveTrackerFrame:StopMovingOrSizing()
	 end)
  end
	local headers = {
		ObjectiveTrackerBlocksFrame.QuestHeader,
		ObjectiveTrackerBlocksFrame.AchievementHeader,
		ObjectiveTrackerBlocksFrame.ScenarioHeader,
		BONUS_OBJECTIVE_TRACKER_MODULE.Header,
		WORLD_QUEST_TRACKER_MODULE.Header,
	}
	for _, header in pairs(headers) do reskinHeader(header) Moveit(header) end
end

-- 任务名称职业着色 -------------------------------------------------------
function module:QuestTrackerSkinTitle()
 if not MaoRUISettingDB["Skins"]["QuestTrackerSkinTitle"] then return end
 hooksecurefunc(QUEST_TRACKER_MODULE, "Update", function(self)
        for i = 1, GetNumQuestWatches() do
		    local questID = GetQuestWatchInfo(i)
	        if not questID then break end
            local block = QUEST_TRACKER_MODULE:GetBlock(questID)
	          block.HeaderText:SetFont(STANDARD_TEXT_FONT, 12, 'nil')
            block.HeaderText:SetTextColor(r, g, b)
            block.HeaderText:SetJustifyH("LEFT")
        end
    end)
     local function hoverquest()
     for i = 1, GetNumQuestWatches() do
		    local id = GetQuestWatchInfo(i)
	        if not id then break end
	        QUEST_TRACKER_MODULE:GetBlock(id).HeaderText:SetTextColor(r, g, b)
        end
    end
    hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderEnter", hoverquest)  
    hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderLeave", hoverquest)
 end   
    
 -- numQuests -------------------------------------------------------
local InCombat,a,f,_,id,cns,ncns,l,n,q,o,w=false,...
local nQ=CreateFrame('frame',a)
function f.PLAYER_LOGIN()
	WorldMapTitleButton:HookScript('OnClick',function(_,b,d)
		if b=='LeftButton' and not d then
			local mainlist,tasks,other={},{},{}
			for i=1,1000 do
				_,_,_,_,_,_,_,id,_,_,_,_,_,cns,_,ncns=GetQuestLogTitle(i)
				l=GetQuestLink(id)
				if l then
					if ncns then tinsert(other,l)
					elseif cns then tinsert(tasks,l)
					else tinsert(mainlist,l) end
				end
			end
			--if #other>0 then print("== Active quests NOT counted:")
			--for k,v in next,other do print("-  "..v) end end
			--if #tasks>0 then print("== Active quests COUNTED but not in log:")
			--for k,v in next,tasks do print(k..". "..v) end end
			--print("== Active quests visible in log:")
			--for k,v in next,mainlist do print(k+#tasks..". "..v) end
		end
	end)
end
function f.PLAYER_REGEN_DISABLED() InCombat=true end
function f.PLAYER_REGEN_ENABLED() InCombat=false end
function f.QUEST_LOG_UPDATE()
	if not InCombat and not InCombatLockdown() then
		n=tostring(select(2,GetNumQuestLogEntries()))
		q=n.."/"..MAX_QUESTS.." "..TRACKER_HEADER_QUESTS
		o=n.."/"..MAX_QUESTS.." "..OBJECTIVES_TRACKER_LABEL
		--w=MAP_AND_QUEST_LOG.." ("..n.."/"..MAX_QUESTS..")"
		ObjectiveTrackerBlocksFrame.QuestHeader.Text:SetText(q)
		ObjectiveTrackerFrame.HeaderMenu.Title:SetText(o)
		WorldMapFrame.BorderFrame.TitleText:SetText(w)
	end
end
nQ:RegisterEvent('PLAYER_LOGIN')
nQ:RegisterEvent('PLAYER_REGEN_DISABLED')
nQ:RegisterEvent('PLAYER_REGEN_ENABLED')
nQ:RegisterEvent('QUEST_LOG_UPDATE')
nQ:SetScript('OnEvent',function(_,event,...)f[event](...)end)