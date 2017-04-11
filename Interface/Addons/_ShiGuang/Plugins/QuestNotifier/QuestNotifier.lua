local QHisFirst = true
local RGBStr = {
	R = "|CFFFF0000",
	G = "|CFF00FF00",
	B = "|CFF0000FF",
	Y = "|CFFFFFF00",
	K = "|CFF00FFFF",
	D = "|C0000AAFF",
	P = "|CFFD74DE1"
}

local function UpdateChk()
	QNOchk_Switch:SetChecked(ShiGuangSettingDB.Switch)
	if ShiGuangSettingDB.Switch == true then
		QNOchk_Instance:Enable()
		QNOchk_Raid:Enable()
		QNOchk_Party:Enable()
		QNOchk_Solo:Enable()
		QNOchk_Sound:Enable()
		QNOchk_Debug:Enable()
		QNOchk_NoDetail:Enable()
		QNOchk_CompleteX:Enable()
	else
		QNOchk_Instance:Disable()
		QNOchk_Raid:Disable()
		QNOchk_Party:Disable()
		QNOchk_Solo:Disable()
		QNOchk_Sound:Disable()
		QNOchk_Debug:Disable()
		QNOchk_NoDetail:Disable()
		QNOchk_CompleteX:Disable()
	end
	QNOchk_Instance:SetChecked(ShiGuangSettingDB.Instance)
	QNOchk_Raid:SetChecked(ShiGuangSettingDB.Raid)
	QNOchk_Party:SetChecked(ShiGuangSettingDB.Party)
	QNOchk_Solo:SetChecked(ShiGuangSettingDB.Solo)
	QNOchk_Sound:SetChecked(ShiGuangSettingDB.Sound)
	QNOchk_Debug:SetChecked(ShiGuangSettingDB.Debug)
	QNOchk_NoDetail:SetChecked(ShiGuangSettingDB.NoDetail)
	QNOchk_CompleteX:SetChecked(ShiGuangSettingDB.CompleteX)
end

local function RScanQuests()
	local QuestList = {}
	local qIndex = 1
	local qLink
	while GetQuestLogTitle(qIndex) do
		local qTitle, qLevel, qGroup, qisHeader, qisCollapsed, qisComplete, qisDaily, qID = GetQuestLogTitle(qIndex)
		if not qisHeader then
			qLink = GetQuestLink(qID)
			QuestList[qID]={
				Title    	= qTitle,			-- String
				Level    	= qLevel,       	-- Integer
				Group    	= qGroup,       	-- Integer
				Header   	= qisHeader,    	-- boolean
				Collapsed	= qisCollapsed, 	-- boolean
				Complete 	= qisComplete,  	-- Integer
				Daily    	= qisDaily,     	-- Integer
				QuestID  	= qID,          	-- Integer
				Link     	= qLink
			}
			if qisComplete == 1 and (IsQuestWatched(qIndex)) and ShiGuangSettingDB.CompleteX == true then
				RemoveQuestWatch(qIndex)
			end
			for i = 1, GetNumQuestLeaderBoards(qIndex) do
				local description, itemType, isComplete = GetQuestLogLeaderBoard(i, qIndex)
				if description then
				local numstr, itemName = strsplit(" ", description)
				local numItems, numNeeded = strsplit("/", numstr)
				QuestList[qID][i]={
					NeedItem = itemName,			-- String
					NeedNum  = numNeeded,			-- Integer
					DoneNum  = numItems				-- Integer
				}
				end
			end
		end
		qIndex = qIndex + 1
	end
	return QuestList
end

local function PrtChatMsg(msg)
	if IsPartyLFG() then
		if ShiGuangSettingDB.Instance == true then
			SendChatMessage(msg, "instance_chat", nil)
		end
	elseif IsInRaid() then
		if ShiGuangSettingDB.Raid == true then
			SendChatMessage(msg, "raid", nil)
		end
	elseif IsInGroup() and not IsInRaid() then
		if ShiGuangSettingDB.Party == true then
			SendChatMessage(msg, "party", nil)
		end
	else
		if ShiGuangSettingDB.Solo == true then
			SendChatMessage(msg, "say", nil)
		end
	end
end

local function DebugMsg(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

function QN_OnEvent(event)
	if event ==  "VARIABLES_LOADED" then
		QuestNotifierOptionFrame:RegisterEvent("QUEST_LOG_UPDATE")
		UpdateChk()
	end
	if ShiGuangSettingDB.Switch == false then return end
	if event == "QUEST_LOG_UPDATE" then
		local QN_Progress = QN_Progress
		local QN_ItemMsg, QN_ItemColorMsg = " ", " "
		if QHisFirst then
			QuestListDB = RScanQuests()
			QHisFirst = false
		end
		local currList = RScanQuests()
		for i,v in pairs(currList) do
			if QuestListDB[i] then
				if not QuestListDB[i].Complete then
					if (#currList[i] > 0) and (#QuestListDB[i] > 0) then
						for j=1, #currList[i] do
							if (currList[i][j] and currList[i][j].DoneNum) and (QuestListDB[i][j] and QuestListDB[i][j].DoneNum) and currList[i][j].NeedNum then
								if currList[i][j].DoneNum > QuestListDB[i][j].DoneNum then
									QN_ItemMsg = currList[i].Link..QN_Progress..": "..currList[i][j].NeedItem..": "..currList[i][j].DoneNum.."/"..currList[i][j].NeedNum
									QN_ItemColorMsg = ""..RGBStr.G..QN_Quest.."|r"..RGBStr.P.."["..currList[i].Level.."]|r "..currList[i].Link..RGBStr.G..QN_Progress..":|r"..RGBStr.K..currList[i][j].NeedItem..":|r"..RGBStr.Y..currList[i][j].DoneNum.."/"..currList[i][j].NeedNum.."|r"
									if ShiGuangSettingDB.NoDetail == false then
										PrtChatMsg(QN_ItemMsg)
									end
									if not IsInGroup() then
										if ShiGuangSettingDB.Debug == true then
											DebugMsg(QN_ItemColorMsg)
										end
									end
								end
							end
						end
					end
				end
				if (#currList[i] > 0) and (#QuestListDB[i] > 0) and (currList[i].Complete == 1) then
					if not QuestListDB[i].Complete then
						QN_ItemMsg = QN_Quest..": ["..currList[i].Level.."]"..currList[i].Link.." "..QN_Complete
						QN_ItemColorMsg = ""..RGBStr.G..QN_Quest.."|r"..RGBStr.P.."["..currList[i].Level.."]|r "..currList[i].Link..RGBStr.K..QN_Complete.."|r"
						PrtChatMsg(QN_ItemMsg)
						if not IsInGroup() then
							if ShiGuangSettingDB.Debug == true then
								DebugMsg(QN_ItemColorMsg)
							end
						end
						if ShiGuangSettingDB.Sound == true then
							PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\QuestNotifier.ogg", "Master")
						end
						UIErrorsFrame:AddMessage(QN_ItemColorMsg)
					end
				end
			end
			if not QuestListDB[i] then  -- last List have not the Quest, New Quest Accepted
				if currList[i].Daily == LE_QUEST_FREQUENCY_DAILY then
					QN_ItemMsg = QN_Accept..": ["..currList[i].Level.."]".."[" .. DAILY .. "]"..currList[i].Link
				else
					QN_ItemMsg = QN_Accept..": ["..currList[i].Level.."]"..currList[i].Link
				end
				QN_ItemColorMsg = ""..RGBStr.K .. QN_Accept..": |r" .. RGBStr.P .."["..currList[i].Level.."]|r"..currList[i].Link
				PrtChatMsg(QN_ItemMsg)
				if not IsInGroup() then
					if ShiGuangSettingDB.Debug == true then
						DebugMsg(QN_ItemColorMsg)
					end
				end
			end
		end
		QuestListDB = currList
	end
end

function QN_OPtionPrePanel(self)
	self:RegisterEvent("VARIABLES_LOADED")
	self.name = "|cff0080ff[任务]|r任务通报"
	InterfaceOptions_AddCategory(self)
end