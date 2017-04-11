local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:GetModule("Misc")

--[[	一个简易的邮箱插件，修改自OpenAll]]
function module:Mailbox()
	if not MaoRUISettingDB["Misc"]["Mail"] then return end

	local deletedelay, t, mailIndex, mailItemIndex = .5, 0, 1, 0
	local button1, button2, button3, lastopened, imOrig_InboxFrame_OnClick, hasNewMail, takingOnlyCash, onlyCurrentMail, needsToWait, skipMail

	InboxNextPageButton:SetScript("OnClick", function()
		mailIndex = mailIndex + 1
		InboxNextPage()
	end)
	InboxPrevPageButton:SetScript("OnClick", function()
		mailIndex = mailIndex - 1
		InboxPrevPage()
	end)

	for i = 1, 7 do
		local mailBoxButton = _G["MailItem"..i.."Button"]
		mailBoxButton:SetScript("OnClick", function(self)
			mailItemIndex = 7 * (mailIndex - 1) + tonumber(string.sub(self:GetName(), 9, 9))
			local modifiedClick = IsModifiedClick("MAILAUTOLOOTTOGGLE")
			if modifiedClick then
				InboxFrame_OnModifiedClick(self, self.index)
			else
				InboxFrame_OnClick(self, self.index)
			end
		end)
	end

	local function OpenAll()
		if GetInboxNumItems() == 0 then return end
		button1:SetScript("OnClick", nil)
		button2:SetScript("OnClick", nil)
		button3:SetScript("OnClick", nil)
		imOrig_InboxFrame_OnClick = InboxFrame_OnClick
		InboxFrame_OnClick = M.Dummy
		if onlyCurrentMail then
			button3:RegisterEvent("UI_ERROR_MESSAGE")
			OpenMail(button3, mailItemIndex)
		else
			button1:RegisterEvent("UI_ERROR_MESSAGE")
			OpenMail(button1, GetInboxNumItems())
		end
	end

	local function WaitForMail(self, arg1)
		t = t + arg1
		if (not needsToWait) or (t > deletedelay) then
			t = 0
			needsToWait = false
			self:SetScript("OnUpdate", nil)

			local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(lastopened)
			if skipMail then
				OpenMail(self, lastopened - 1)
			elseif money > 0 or (not takingOnlyCash and numItems and numItems > 0 and COD <= 0) then
				OpenMail(self, lastopened)
			else
				OpenMail(self, lastopened - 1)
			end
		end
	end

	function OpenMail(button, index)
		if not InboxFrame:IsVisible() or index == 0 then
			return StopOpening()
		end
		local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(index)
		if not takingOnlyCash then
			if money > 0 or (numItems and numItems > 0) and COD <= 0 then
				AutoLootMailItem(index)
				needsToWait = true
			end
			if onlyCurrentMail then StopOpening() return end
		elseif money > 0 then
			TakeInboxMoney(index)
			needsToWait = true
		end

		local items = GetInboxNumItems()
		if (numItems and numItems > 0) or (items > 1 and index <= items) then
			lastopened = index
			button:SetScript("OnUpdate", WaitForMail)
		else
			StopOpening()
		end
	end

	function StopOpening()
		button1:SetScript("OnUpdate", nil)
		button1:SetScript("OnClick", function() onlyCurrentMail = false OpenAll() end)
		button2:SetScript("OnClick", function() takingOnlyCash = true OpenAll() end)
		button3:SetScript("OnUpdate", nil)
		button3:SetScript("OnClick", function() onlyCurrentMail = true OpenAll() end)
		if imOrig_InboxFrame_OnClick then
			InboxFrame_OnClick = imOrig_InboxFrame_OnClick
		end
		if onlyCurrentMail then
			button3:UnregisterEvent("UI_ERROR_MESSAGE")
		else
			button1:UnregisterEvent("UI_ERROR_MESSAGE")
		end
		takingOnlyCash = false
		onlyCurrentMail = false
		needsToWait = false
		skipMail = false
	end

	local function OpenAll_OnEvent(frame, event, arg1, arg2)
		if event == "UI_ERROR_MESSAGE" then
			if arg2 == ERR_INV_FULL then
				StopOpening()
			elseif arg2 == ERR_ITEM_MAX_COUNT then
				skipMail = true
			end
		elseif event == "MAIL_CLOSED" then
			if not hasNewMail then
				MiniMapMailFrame:Hide()
			end
			StopOpening()
		end
	end

	local function TotalCash_OnEnter(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		local total_cash = 0
		for index = 0, GetInboxNumItems() do
			total_cash = total_cash + select(5, GetInboxHeaderInfo(index))
		end
		if total_cash > 0 then SetTooltipMoney(GameTooltip, total_cash)	end
		GameTooltip:Show()
	end

	local function CreatButton(id, parent, text, w, h, ap, frame, rp, x, y)
		local button = CreateFrame("Button", id, parent, "UIPanelButtonTemplate")
		button:SetWidth(w)
		button:SetHeight(h)
		button:SetPoint(ap, frame, rp, x, y)
		button:SetText(text)
		return button
	end

	button1 = CreatButton("OpenAllButton1", InboxFrame, "收信", 60, 26, "TOPLEFT", "InboxFrame", "TOPLEFT", 60, -28)
	button1:RegisterEvent("MAIL_CLOSED")
	button1:SetScript("OnClick", OpenAll)
	button1:SetScript("OnEvent", OpenAll_OnEvent)

	button2 = CreatButton("OpenAllButton2", InboxFrame, "收G", 60, 26, "LEFT", button1, "RIGHT", 2, 0)
	button2:SetScript("OnClick", function() takingOnlyCash = true OpenAll() end)
	button2:SetScript("OnEnter", TotalCash_OnEnter)
	button2:SetScript("OnUpdate", function(self) if GameTooltip:IsOwned(self) then TotalCash_OnEnter(self) end end)
	button2:SetScript("OnLeave", GameTooltip_Hide)

	button3 = CreatButton("OpenAllButton3", OpenMailFrame, "收信", 60, 26, "RIGHT", "OpenMailReplyButton", "LEFT", 0, 0)
	button3:SetScript("OnClick", function() onlyCurrentMail = true OpenAll() end)
	button3:SetScript("OnEvent", OpenAll_OnEvent)

	button4 = CreatButton("OpenAllButton4", InboxFrame, REFRESH, 60, 26, "LEFT", button2, "RIGHT", 2, 0)
	button4:SetScript("OnClick", function() CheckInbox() end)
	
	-------DelMailbutton----------------
local DelMailbutton = CreateFrame("Button","DelMailButton",InboxFrame,"UIPanelButtonTemplate");
DelMailbutton:SetPoint("LEFT", button4, "RIGHT", 2, 0)
DelMailbutton:SetWidth(80)
DelMailbutton:SetHeight(26)
DelMailbutton:SetText("删空邮件")
DelMailbutton:SetScript("OnClick", function() DelMailbutton_OnClick() end)
function DelMailbutton_OnClick() sendCmd("/mbclean") end

	local function deleteClick(self, button, down)
		selectedID = self.id + (InboxFrame.pageNum-1)*7
		if InboxItemCanDelete(selectedID) then
			DeleteInboxItem(selectedID)
		else
			UIErrorsFrame:AddMessage(I.InfoColor..ERR_MAIL_DELETE_ITEM_ERROR)
		end
	end

	hooksecurefunc("InboxFrame_Update", function()
		hasNewMail = false
		if select(4, GetInboxHeaderInfo(1)) then
			for i = 1, GetInboxNumItems() do
				local wasRead = select(9, GetInboxHeaderInfo(i))
				if (not wasRead) then
					hasNewMail = true
					break
				end
			end
		end

		for i = 1, 7 do
			local b = _G["MailItem"..i.."ExpireTime"]
			if not b.delete then
				b.delete = CreateFrame("BUTTON", nil, b)
				b.delete:SetPoint("TOPRIGHT", b, "BOTTOMRIGHT", -5, -1)
				b.delete:SetWidth(16)
				b.delete:SetHeight(16)
				b.delete.texture = b.delete:CreateTexture(nil, "BACKGROUND")
				b.delete.texture:SetAllPoints()
				b.delete.texture:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
				b.delete.texture:SetTexCoord(1, 0, 0, 1)
				b.delete.id = i
				b.delete:SetScript("OnClick", deleteClick)
				M.CreateGT(b.delete, "ANCHOR_RIGHT", DELETE, "system")
			end
		end
	end)

	hooksecurefunc("InboxFrameItem_OnEnter", function(self)
		local tooltip = GameTooltip
		local items = {}
		wipe(items)
		local itemAttached = select(8, GetInboxHeaderInfo(self.index))
		if itemAttached then
			local itemName, itemTexture, itemCount, itemQuality, itemid, r, g, b
			for attachID = 1, 12 do
				itemName, _, _, itemCount = GetInboxItem(self.index, attachID)
				if itemCount and itemCount > 0 then
					_, itemid = strsplit(":", GetInboxItemLink(self.index, attachID))
					itemid = tonumber(itemid)
					items[itemid] = (items[itemid] or 0) + itemCount
				end
			end
			if itemAttached > 1 then
				tooltip:AddLine("附件清单:")
				for key, value in pairs(items) do
					itemName, _, itemQuality, _, _, _, _, _, _, itemTexture = GetItemInfo(key)
					r, g, b = GetItemQualityColor(itemQuality)
					tooltip:AddDoubleLine(" |T"..itemTexture..":12:12:0:0:50:50:4:46:4:46|t "..itemName, value, r, g, b)
				end
				tooltip:Show()
			end
		end
	end)

	-- Replace the alert frame
	if InboxTooMuchMail then
		InboxTooMuchMail:ClearAllPoints()
		InboxTooMuchMail:SetPoint("BOTTOM", MailFrame, "TOP", 0, 5)
	end

	-- Hide Blizz
	OpenAllMail:Hide()
	OpenAllMail:UnregisterAllEvents()
end

-------MailinputboxResizer---------------------------------------------------------------
	local editbox_width = 222		--EditBox width				--default: 224
	local moneyframe_pos = {"TOPLEFT","SendMailFrame","TOPLEFT",82,-70,}	--Money display position

local c = SendMailCostMoneyFrame
c:ClearAllPoints()
c:SetPoint(unpack(moneyframe_pos))
local f = "SendMailNameEditBox" 
_G[f]:SetSize(editbox_width or 224,20)
local r=_G[f.."Right"]
r:ClearAllPoints()
r:SetPoint("TOPRIGHT",0,0)
local m=_G[f.."Middle"]
m:SetSize(0,20)
m:ClearAllPoints()
m:SetPoint("LEFT",f.."Left","LEFT",8,0)
m:SetPoint("RIGHT",r,"RIGHT",-8,0)

-- Mailbox Cleaner-------- by Jadya - EU-Well of Eternity---------------------------------
local min, low = math.min, string.lower
local title = "|cffFFFFFF[邮件]|r删除空邮件"
local snd
local em_enabled = false
local i
local lastindex, timeout = 0,0
local timeout_range = 1 -- one second
local f = CreateFrame("Frame")

local options_desc = { ["read"] = "Delete unread mails" }

local function endloop()
 em_enabled = false
 f:Hide()
 print(title.." - 完成清理.")
end

local function update()
 if not em_enabled or not InboxFrame or not InboxFrame:IsVisible() then endloop() return end

 local num = GetInboxNumItems()

 if num < 1 or i < 1 then
  endloop()
  return
 end
 
 local t = time()
 
 if timeout > 0 then
  if i > num or (timeout < t) then
   i = min(i - 1, num)
   timeout = 0
  else
   return
  end
 end

 --canDelete = InboxItemCanDelete(i)
 --if canDelete then
 local packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, itemCount, wasRead, wasReturned, textCreated, canReply, isGM, itemQuantity = GetInboxHeaderInfo(i)
 if (ShiGuangSettingDB["read"] or wasRead) and not isGM and (not snd or (snd and (snd == low(sender)))) and
  (not itemCount or itemCount == 0) and (not money or money == 0) then
  DeleteInboxItem(i)
  timeout = t + 1
 else
  i = i - 1
 end   
 --end
 
 if i > num then 
  endloop()
 end
end

f:SetScript("OnUpdate", update)
f:Hide()

local function printOptionMsg(arg, help)
 if ShiGuangSettingDB[arg] == nil then return end

 print(title.." - "..(options_desc[arg] or "<unknown>").." = |cff69CCF0"..tostring(ShiGuangSettingDB[arg]).."|r"..
      (help and " (|cffCCCCCC/mbclean "..arg.."|r)" or ""))
end

local function start(arg)

 if arg == "read" then
  ShiGuangSettingDB["read"] = not ShiGuangSettingDB["read"]
  printOptionMsg(arg)
  return
 end

 if not InboxFrame or not InboxFrame:IsVisible() then
  print(title.." - 你得先打开收件箱啊~")
  return
 end
 if arg and arg ~= "" then
  snd = low(arg)
 else
  snd = nil
 end
 i = GetInboxNumItems()
 print(title.." - 正在删除空邮件"..(snd and " from "..snd or "").."...")
 em_enabled = true
 f:Show()
end

local eventframe = CreateFrame("Frame")
eventframe:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventhandler()
 printOptionMsg("读取", true)
 eventframe:SetScript("OnEvent", nil)
end
eventframe:SetScript("OnEvent", eventhandler)
-- slash command
SLASH_MAILBOXCLEANER1 = "/mbclean"
SLASH_MAILBOXCLEANER2 = "/mailboxcleaner"
SlashCmdList["MAILBOXCLEANER"] = start

------------------------------------ 輸入框名冊-- Author:M----------------------------------
--此表會被重載
TinyRosterDB = {
    SendMailNameEditBox = {},                                                   --發郵件
    --BankItemSearchBox = {},                                                     --銀行查找
    --BagItemSearchBox = {},                                                      --背包查找
    BrowseName = { depands = "Blizzard_AuctionUI" },                            --拍賣場
    MountJournalSearchBox = { depands = "Blizzard_Collections" },               --坐騎
    HeirloomsJournalSearchBox = { depands = "Blizzard_Collections" },           --傳家寶
    PetJournalSearchBox = { depands = "Blizzard_Collections" },                 --寵物
    GuildItemSearchBox = { depands = "Blizzard_GuildBankUI" },                  --公會銀行
    WardrobeCollectionFrameSearchBox = { depands = "Blizzard_Collections" },    --衣櫃
    ["TradeSkillFrame.SearchBox"] = { depands = "Blizzard_TradeSkillUI" },      --專業技能
    --["GlyphFrame.SearchBox"] = { depands = "Blizzard_GlyphUI" },                --雕紋
    ["ToyBox.searchBox"] = { depands = "Blizzard_Collections" },                --玩具
    ["LFGListFrame.SearchPanel.SearchBox"] = {},                                --找團
    ["AchievementFrame.searchBox"] = { depands="Blizzard_AchievementUI" },      --成就
    EncounterJournalSearchBox = { depands = "Blizzard_EncounterJournal" },      --指南
}

--按鈕數量和高度
local numButton, btnHeight = 12, 18

--加入/删除名冊
local function toggle(list, name, delete)
    local pos
    if (name == "") then return end
    for i, v in ipairs(list) do
        if (v == name) then pos = i end
    end
    if (not pos) then
        table.insert(list, 1, name)
    elseif (delete and pos) then
        table.remove(list, pos)
    end
    --table.sort(list, function(a, b) return string.byte(a) < string.byte(b) end)
end

--左鍵選擇,右鍵刪除
local function onclick(self, button)
    local editbox = self:GetParent().editbox
    if (not editbox) then return end
    if (IsControlKeyDown() and button == "RightButton") then
        for k in pairs(editbox.rosterList) do
            editbox.rosterList[k] = nil
        end
        return editbox.rosterFunc(editbox)
    elseif (button == "RightButton") then
        toggle(editbox.rosterList, self.text, true)
        return editbox.rosterFunc(editbox)
    end
    editbox:SetText(self.text)
    self:GetParent():Hide()
    editbox.rosterAddButton:Hide()
end

--创建按钮
local function createButton(parent, index)
    local button = CreateFrame("Button", "TinyRosterFrameButton"..index, parent, "LFGListSearchAutoCompleteButtonTemplate")
    button:SetAlpha(0.9)
    button:SetHeight(btnHeight)
    button.Label:SetJustifyH("CENTER")
    button.Label:SetFont(UNIT_NAME_FONT, 14, "NORMAL")
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetScript("OnClick", onclick)
    if (index == 1) then
        button:SetPoint("TOPLEFT", parent, "TOPLEFT")
        button:SetPoint("TOPRIGHT", parent, "TOPRIGHT")
    else
        button:SetPoint("TOPLEFT", _G["TinyRosterFrameButton"..(index-1)], "BOTTOMLEFT")
        button:SetPoint("TOPRIGHT", _G["TinyRosterFrameButton"..(index-1)], "BOTTOMRIGHT")
    end
end

--系統自動填充是異步行爲 空字符不觸發此函數
hooksecurefunc("AutoComplete_UpdateResults", function(self, results, context)
    if (self.CallbackToTinyRoster) then
        if (#results == 0) then
            self.CallbackToTinyRoster = false
        else
            TinyRosterFrame:ClearAllPoints()
            TinyRosterFrame:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 4, 0)
            TinyRosterFrame:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -3, 0)
        end
    end
end)

--顯示名冊 1.處理異步情況 2.context在獲得焦點時值是true
local function ShowRosterList(editbox, context)
    TinyRosterFrame.editbox = editbox
    local text = editbox:GetText()
    if (not AutoCompleteBox.CallbackToTinyRoster or text == "") then
        TinyRosterFrame:Show()
        TinyRosterFrame:ClearAllPoints()
        TinyRosterFrame:SetPoint("TOPLEFT", editbox, "BOTTOMLEFT", -2, 0)
        TinyRosterFrame:SetPoint("TOPRIGHT", editbox, "BOTTOMRIGHT", -3, 0)
    end
    local AutoCompleteFrame = editbox:GetParent().AutoCompleteFrame
    if (AutoCompleteFrame and AutoCompleteFrame:IsShown()) then
        TinyRosterFrame:ClearAllPoints()
        TinyRosterFrame:SetPoint("TOPLEFT", AutoCompleteFrame, "BOTTOMLEFT", 7, 8)
        TinyRosterFrame:SetPoint("TOPRIGHT", AutoCompleteFrame, "BOTTOMRIGHT", -4, 8)
    end
    if (editbox.autoCompleteParams) then
        AutoCompleteBox.CallbackToTinyRoster = true
    else
        AutoCompleteBox.CallbackToTinyRoster = false
    end
    local button
    local index = 1
    local list = editbox.rosterList
    --當記錄大於按鈕總數,用戶變更輸入之後,自動開啓模糊查詢
    if (context == "userInput" and #list > numButton and strlen(text) > 0) then
        list = {}
        for _, v in ipairs(editbox.rosterList) do
            if (string.find(v,text)) then tinsert(list,v) end 
        end
    end
    while (list[index] and index <= numButton) do
        button = _G["TinyRosterFrameButton"..index]
        button.text = list[index]
        button:SetText(list[index])
        button:Show()
        index = index + 1
    end

    TinyRosterFrame:SetHeight(index*btnHeight)
    editbox.rosterAddButton:Show()
    editbox.rosterAddButton:ClearAllPoints()
    editbox.rosterAddButton:SetPoint("BOTTOMLEFT", TinyRosterFrame, "BOTTOMLEFT")
    editbox.rosterAddButton:SetPoint("BOTTOMRIGHT", TinyRosterFrame, "BOTTOMRIGHT")
    
    while (_G["TinyRosterFrameButton"..index]) do
        _G["TinyRosterFrameButton"..index]:Hide()
        index = index + 1
    end
end

--用戶輸入
local function OnTextChanged(self, userInput)
    if (userInput) then ShowRosterList(self, "userInput") end
end

--失去焦點
local function OnEditFocusLost(self)
    TinyRosterFrame:Hide()
    self.rosterAddButton:Hide()
    toggle(self.rosterList, self:GetText()) --自動保存
end

--獲取框架
local function getEditBox(name)
    local frame, subframe, thirdframe = strsplit(".", name)
    if (thirdframe) then
        return _G[frame][subframe][thirdframe]
    elseif (subframe) then
        return _G[frame][subframe]
    else
        return _G[frame]
    end
end

--讓輸入框有此功能
local function fn(editboxName, config)
    local editbox = getEditBox(editboxName)
    if (not editbox) then return end
    if (not config.list) then config.list = {} end
    editbox.rosterMark = true
    editbox.rosterList = config.list
    editbox.rosterFunc = ShowRosterList
    --editbox.autoCompleteParams = nil --去掉註釋表示關閉系統自動填充
    editbox:HookScript("OnTextChanged", OnTextChanged)
    editbox:HookScript("OnEditFocusGained", ShowRosterList)
    editbox:HookScript("OnEditFocusLost", OnEditFocusLost)
    editbox.rosterAddButton = CreateFrame("Button", nil, TinyRosterFrame, "LFGListSearchAutoCompleteButtonTemplate")
    editbox.rosterAddButton:Hide()
    editbox.rosterAddButton:SetHeight(btnHeight)
    editbox.rosterAddButton.Label:SetFont(UNIT_NAME_FONT, 14, "OUTLINE")
    editbox.rosterAddButton.Label:SetJustifyH("CENTER")
    editbox.rosterAddButton.Label:SetTextColor(1, 0.82, 0)
    editbox.rosterAddButton:SetText(SAVE..NAME)
    editbox.rosterAddButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    editbox.rosterAddButton:SetScript("OnClick", function(self, button)
        if (button == "LeftButton") then
            local text = editbox:GetText()
            if (text and text ~= "") then
                toggle(editbox.rosterList, text)
                editbox.rosterFunc(editbox)
            end
        else
            editbox:SetText("")
        end
    end)
end

--創建框架
do
    local function OnEvent(self, event, ...)
        local arg1 = ...
        if (event == "VARIABLES_LOADED") then
            self:UnregisterEvent("VARIABLES_LOADED")
            for editboxName, v in pairs(TinyRosterDB) do
                if (not v.depands or (v.depands and IsAddOnLoaded(v.depands))) then
                    fn(editboxName, v)
                end
            end
        end
        if (event == "ADDON_LOADED") then
            for editboxName, v in pairs(TinyRosterDB) do
                if (v.depands and v.depands == arg1 and not getEditBox(editboxName).rosterMark) then
                    fn(editboxName, v)
                end
            end
        end
    end
    local TinyRosterFrame = CreateFrame("Frame", "TinyRosterFrame", UIParent)
    TinyRosterFrame:Hide()
    TinyRosterFrame:SetClampedToScreen(true)
    TinyRosterFrame:SetFrameStrata("DIALOG")
    TinyRosterFrame:SetSize(136, numButton*btnHeight)
    TinyRosterFrame.BottomLeftBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "UI-Frame-BotCornerLeft")
    TinyRosterFrame.BottomLeftBorder:ClearAllPoints()
    TinyRosterFrame.BottomLeftBorder:SetPoint("BOTTOMLEFT", -7, -7)
    TinyRosterFrame.BottomRightBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "UI-Frame-BotCornerRight")
    TinyRosterFrame.BottomRightBorder:ClearAllPoints()
    TinyRosterFrame.BottomRightBorder:SetPoint("BOTTOMRIGHT", 4, -7)
    TinyRosterFrame.BottomBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "_UI-Frame-Bot")
    TinyRosterFrame.BottomBorder:ClearAllPoints()
    TinyRosterFrame.BottomBorder:SetPoint("BOTTOMLEFT", TinyRosterFrame.BottomLeftBorder, "BOTTOMRIGHT")
    TinyRosterFrame.BottomBorder:SetPoint("BOTTOMRIGHT", TinyRosterFrame.BottomRightBorder, "BOTTOMLEFT")
    TinyRosterFrame.LeftBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "!UI-Frame-LeftTile")
    TinyRosterFrame.LeftBorder:ClearAllPoints()
    TinyRosterFrame.LeftBorder:SetPoint("TOP", 0, 1)
    TinyRosterFrame.LeftBorder:SetPoint("BOTTOMLEFT", TinyRosterFrame.BottomLeftBorder, "TOPLEFT")
    TinyRosterFrame.RightBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "!UI-Frame-RightTile")
    TinyRosterFrame.RightBorder:ClearAllPoints()
    TinyRosterFrame.RightBorder:SetPoint("TOP", 0, 1)
    TinyRosterFrame.RightBorder:SetPoint("BOTTOMRIGHT", TinyRosterFrame.BottomRightBorder, "TOPRIGHT", 1, 0)
    TinyRosterFrame.TopBorder = TinyRosterFrame:CreateTexture(nil, "ARTWORK", "_UI-Frame-Bot")
    TinyRosterFrame.TopBorder:ClearAllPoints()
    TinyRosterFrame.TopBorder:SetPoint("TOPLEFT", TinyRosterFrame, "TOPLEFT", -2, 3)
    TinyRosterFrame.TopBorder:SetPoint("BOTTOMRIGHT", TinyRosterFrame, "TOPRIGHT", 2, -3)
    for i = 1, numButton do createButton(TinyRosterFrame, i) end
    TinyRosterFrame:SetScript("OnEvent", OnEvent)
    TinyRosterFrame:RegisterEvent("VARIABLES_LOADED")
    TinyRosterFrame:RegisterEvent("ADDON_LOADED")
end

--## Author: @hjg719-NGA 
local SendList = {  
   ["烂柯人"] = {"奢华兽毛","真铁矿石","黑石矿石","时光水晶","碎裂的时光水晶","天然兽皮"}, 
   ["电闪电离电"] = {"炼金催化剂","烁星花","塔拉多幽兰","寒霜草","炎火草","戈尔隆德捕蝇草","纳格兰箭叶花"}, 
} 

function InList(i, v, bag, slot) 
   local item = GetContainerItemLink(bag, slot) 
   if item then 
      if GetItemInfo(item):find(SendList[i][v]) then return 1 end 
   end 
end 

local function AutoSend() 
   local count 
   for i, j in pairs(SendList) do 
      for v = 1,  #SendList[i] do 
         if i ~= UnitName("player") and i ~= nil and #SendList[i] > 0 then 
            count = 0 
            for bag = 0, 4 do 
               for slot = 1, GetContainerNumSlots(bag) do 
                  if InList(i, v, bag, slot) then 
                     UseContainerItem(bag, slot) 
                     count = count + 1 
                  end 
                  if count == 12 then 
                     SendMail(i, "AutoSend") 
                     count = 0 
                  end 
               end 
            end 
            if count > 0 then 
               SendMail(i, "AutoSend") 
            end 
         end 
      end 
   end 
end 

SLASH_AutoSend1 = "/autosend" 
SlashCmdList["AutoSend"] = function () AutoSend() end 

--[[local SendButton = CreateFrame("BUTTON", "SendMailButton", MailFrame, "SecureActionButtonTemplate") 
SendButton:SetWidth(26) 
SendButton:SetHeight(26) 
SendButton:SetPoint("TOPLEFT", MailFrame, "BOTTOMRIGHT", -36, 3)
--SendButton:SetText("自动邮寄") 
SendButton.icon = SendButton:CreateTexture(nil, "ARTWORK") 
SendButton.icon:SetAllPoints() 
SendButton.icon:SetTexture("Interface\\Icons\\SOR-mail") 
SendButton:SetAttribute("*type*", "macro") 
SendButton:SetAttribute("macrotext", 
   "/click MailFrameTab2\n".. 
   "/autosend\n".. 
   "/click MailFrameTab1" 
)]]