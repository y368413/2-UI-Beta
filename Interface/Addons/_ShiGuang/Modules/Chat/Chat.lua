local M, R, U, I = unpack(select(2, ...))
----------------------------- -- 特别感谢 zork 的 rChat
------- CONFIG
local hide_chatframe_backgrounds = true   -- 隐藏聊天框背景 (true/false) (隐藏/显示)
local hide_chattab_backgrounds = true     -- 隐藏聊天标签背景 (true/false) (隐藏/显示)
local ShortChannel = true                 -- 精简公共频道 (true/false) (精简/不精简)

-- add more chat font sizes
  for i = 1, 23 do  CHAT_FONT_HEIGHTS[i] = i+7  end

-- 打开输入框回到上次对话 (1/0 = On/Off)
ChatTypeInfo["SAY"].sticky  = 1;          -- 说
ChatTypeInfo["PARTY"].sticky 	= 1;        -- 小队
ChatTypeInfo["INSTANCE_CHAT"].sticky 	= 1;-- 副本
ChatTypeInfo["RAID"].sticky 	= 1;        -- 团队
ChatTypeInfo["GUILD"].sticky 	= 1;        -- 公会
ChatTypeInfo["OFFICER"].sticky 	= 1;      -- 官员
ChatTypeInfo["WHISPER"].sticky 	= 1;      -- 密语
ChatTypeInfo["BN_WHISPER"].sticky   = 1;  -- 战网好友密语
ChatTypeInfo["CHANNEL"].sticky 	= 1;      -- 频道

-- 聊天标签
CHAT_FRAME_FADE_OUT_TIME = 0                  -- 聊天窗口褪色时间
CHAT_TAB_HIDE_DELAY = 0                       -- 聊天标签弹出延时
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 0.8   -- 鼠标停留时,标签透明度
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0       -- 鼠标离开时,标签透明度 (修改这里能一直显示)
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1   -- 鼠标停留时,选择标签时透明度
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0     -- 鼠标离开时,选择标签时透明度
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 0.6 -- 鼠标停留时,标签闪动时透明度
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0     -- 鼠标离开时,标签闪动时透明度

--------------------------------------- 支持上下箭頭選取历史-- Author:M-------------------------------------
local chatHistory = {}
local function AddHistoryLine(self, text)
    if (not text or text == "") then return end
    local type = self:GetAttribute("chatType")
    if (type == "WHISPER") then text = text:gsub("^/%w+%s*%S+%s*", "")
    elseif (string.find(text, "^/script")) then
    else text = text:gsub("^/%w+%s*", "") end
    if (text == "") then return end
    for i, v in ipairs(chatHistory[self]) do
        if (v == text) then
            table.remove(chatHistory[self], i)
            break
        end
    end
    table.insert(chatHistory[self], 1, text)
end
local function GetHistoryLine(self, keyPress)
    local increment
    if (keyPress == "UP") then increment = 1
    elseif (keyPress == "DOWN") then increment = -1
    else return end
    chatHistory[self].index = chatHistory[self].index + increment
    local text = chatHistory[self][chatHistory[self].index]
    if (text) then self:SetText(text)
		self:SetCursorPosition(strlen(text))
    else chatHistory[self].index = chatHistory[self].index - increment end
end
local function ResetHistoryIndex(self) chatHistory[self].index = 0 end

------- FUNCTIONS
  local function skinChat(self)
    if not self or (self and self.skinApplied) then return end

    self:SetClampRectInsets(0, 0, 0, 0)    --chat frame resizing
    self:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
    self:SetMinResize(80, 43)

    self:SetFading(true)    --chat fading      --set font, outline and shadow for chat text
    --self:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
    --self:SetShadowOffset(1,-1)
    --self:SetShadowColor(0,0,0,0.6)
 
    _G[self:GetName().."ButtonFrame"]:Hide()   --fix the buttonframe
    _G[self:GetName().."ButtonFrame"]:HookScript("OnShow", _G[self:GetName().."ButtonFrame"].Hide)
    _G[self:GetName().."EditBoxLeft"]:Hide()    --editbox skinning
    _G[self:GetName().."EditBoxMid"]:Hide()
    _G[self:GetName().."EditBoxRight"]:Hide()

    _G[self:GetName().."EditBox"]:SetAltArrowKeyMode(false)
    _G[self:GetName().."EditBox"]:ClearAllPoints()
    _G[self:GetName().."EditBox"]:SetPoint("BOTTOM",_G[self:GetName().."Tab"],"TOP",0,-21)
    _G[self:GetName().."EditBox"]:SetPoint("LEFT",self,-5,0)
    _G[self:GetName().."EditBox"]:SetPoint("RIGHT",self,10,0)
    
    local editboxmod = _G[self:GetName().."EditBox"]
    chatHistory[editboxmod] = { index = 0 }
    _G[self:GetName().."EditBox"]:HookScript("OnEditFocusLost", ResetHistoryIndex)
    _G[self:GetName().."EditBox"]:HookScript("OnArrowPressed", GetHistoryLine)
    hooksecurefunc(editboxmod, "AddHistoryLine", AddHistoryLine)
    ChatFrame1EditBoxLanguage:SetPoint('LEFT', ChatFrame1EditBox, 'RIGHT', -5, 0) --输入框语言按钮位置

    self.skinApplied = true
  end

------- CALL
local tabs = {"Left", "Middle", "Right", "SelectedLeft", "SelectedRight", "SelectedMiddle",}--, "Glow"
    
  --chat skinning
  for i = 1, NUM_CHAT_WINDOWS do
if hide_chattab_backgrounds then     -- 聊天标签背景
    for index, value in pairs(tabs) do _G['ChatFrame'..i..'Tab'..value]:SetTexture(nil) end
end
if hide_chatframe_backgrounds then    -- 聊天框背景
    for g = 1, #CHAT_FRAME_TEXTURES do _G["ChatFrame"..i..CHAT_FRAME_TEXTURES[g]]:SetTexture(nil) end
end
    skinChat(_G["ChatFrame"..i])
  end

  --skin temporary chats
  hooksecurefunc("FCF_OpenTemporaryWindow", function()
    for _, chatFrameName in pairs(CHAT_FRAMES) do if (_G[chatFrameName].isTemporary) then skinChat(_G[chatFrameName]) end end
  end)
  hooksecurefunc("FCF_SetTemporaryWindowType", function(chatFrame, chatType, chatTarget)
        skinChat(chatFrame)
        chatFrame:ScrollToTop()
        _G[chatFrame:GetName().."Tab"]:SetScript("OnDoubleClick", function(self)
          if (chatType == "WHISPER" or chatType == "BN_WHISPER") then
              local editBoxsed = ChatEdit_ChooseBoxForSend()
              editBoxsed:SetAttribute("chatType", chatType)
              editBoxsed:SetAttribute("tellTarget", chatTarget)
              ChatEdit_ActivateChat(editBoxsed)
              editBoxsed:SetText(editBoxsed:GetText())
          end
      end)
  end)
  --[[combat log custom hider
  local function fixStuffOnLogin()
    for i = 1, NUM_CHAT_WINDOWS do
      local name = "ChatFrame"..i
      local tab = _G[name.."Tab"]
    end
    CombatLogQuickButtonFrame_Custom:HookScript("OnShow", CombatLogQuickButtonFrame_Custom.Hide)
    CombatLogQuickButtonFrame_Custom:Hide()
    CombatLogQuickButtonFrame_Custom:SetHeight(0)
  end

  local a = CreateFrame("Frame")
  a:RegisterEvent("PLAYER_LOGIN")
  a:SetScript("OnEvent", fixStuffOnLogin)]]
  
  ----Shift至底部/顶部
FloatingChatFrame_OnMouseScroll = function(self, dir)
  if(dir > 0) then if(IsShiftKeyDown()) then self:ScrollToTop() else self:ScrollUp() end
  else if(IsShiftKeyDown()) then self:ScrollToBottom() else self:ScrollDown() end
  end
end

--================================公共频道和自定义频道精简================================--
local gsub = _G.string.gsub
local newAddMsg = {}
local chn, rplc
  if (GetLocale() == "zhCN") then  ---国服
	rplc = { "[%1综合]", "[%1交易]", "[%1防务]", "[%1组队]", "[%1世界]", "[%1招募]", "[%1大脚]", "[%1自定义]", } 
  elseif (GetLocale() == "zhTW") then  ---台服
	rplc = { "[%1綜合]", "[%1貿易]", "[%1防務]", "[%1組隊]", "[%1世界]", "[%1招募]", "[%1自定义]", } 
	else       
	rplc = { "[GEN]", "[TR]", "[WD]", "[LD]", "[LFG]", "[GR]", "[BFC]", "[CL]", }      -- 英文缩写
 end
        
	chn = { "%[%d+%. General.-%]", "%[%d+%. Trade.-%]", "%[%d+%. LocalDefense.-%]", "%[%d+%. LookingForGroup%]", "%[%d+%. WorldDefense%]", "%[%d+%. GuildRecruitment.-%]", "%[%d+%. CustomChannel.-%]", }

	if (GetLocale() == "zhCN") then
		chn[1] = "%[%d+%. 综合.-%]"
		chn[2] = "%[%d+%. 交易.-%]"
		chn[3] = "%[%d+%. 本地防务.-%]"
		chn[4] = "%[%d+%. 寻求组队%]"
    chn[5] = "%[%d+%. 世界防务%]"	
		chn[6] = "%[%d+%. 公会招募.-%]"
    chn[7] = "%[%d+%. 大脚世界频道.-%]"
    chn[8] = "%[%d+%. 自定义频道.-%]"
  elseif (GetLocale() == "zhTW") then
		chn[1] = "%[%d+%. 綜合.-%]"
		chn[2] = "%[%d+%. 貿易.-%]"
	  chn[3] = "%[%d+%. 本地防務.-%]"
		chn[4] = "%[%d+%. 尋求組隊%]"
    chn[5] = "%[%d+%. 世界防務%]"	
		chn[6] = "%[%d+%. 公會招募.-%]"
    chn[7] = "%[%d+%. 自定义频道.-%]"
	else
		chn[1] = "%[%d+%. General.-%]"
		chn[2] = "%[%d+%. Trade.-%]"
		chn[3] = "%[%d+%. LocalDefense.-%]"
		chn[4] = "%[%d+%. LookingForGroup%]"
		chn[5] = "%[%d+%. WorldDefense%]"
		chn[6] = "%[%d+%. GuildRecruitment.-%]"
    chn[7] = "%[%d+%. CustomChannel.-%]"
	end
	
local function AddMessage(frame, text, ...)
	for i = 1, 7 do text = gsub(text, chn[i], rplc[i]) end	 -- 对应上面几个频道
	text = gsub(text, "%[(%d0?)%. .-%]", "%1.") 
	return newAddMsg[frame:GetName()](frame, text, ...)
end

if ShortChannel then
	for i = 1, 5 do
		if i ~= 2 then newAddMsg[format("%s%d", "ChatFrame", i)] = _G[format("%s%d", "ChatFrame", i)].AddMessage
			_G[format("%s%d", "ChatFrame", i)].AddMessage = AddMessage
		end
	end
end

local origSetItemRef = SetItemRef
SetItemRef = function(link, text, button)
  if IsAltKeyDown() and string.sub(link, 1, 6) == "player" then InviteUnit(string.match(link, "player:([^:]+)")) return nil end
  return origSetItemRef(link,text,button)
end

--TabChangeChannel 按TAB切換頻道--
hooksecurefunc("ChatEdit_CustomTabPressed", function(self)
	if strsub(tostring(self:GetText()), 1, 1) == '/' then return end
	local chatType = self:GetAttribute('chatType')
	local inParty = GetNumSubgroupMembers() > 0
	local inInstance = IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance()
	local inRaid = GetNumGroupMembers() > 0 and IsInRaid()
	local inGuild = IsInGuild()
	local isOfficer = CanEditOfficerNote()
	local SetTabType
	if chatType == 'SAY' then
		SetTabType = inParty and 'PARTY' or inInstance and 'INSTANCE_CHAT' or inRaid and 'RAID' or inGuild and 'GUILD' or isOfficer and 'OFFICER'
	elseif chatType == 'PARTY' then
		SetTabType = inInstance and 'INSTANCE_CHAT' or inRaid and 'RAID' or inGuild and 'GUILD' or isOfficer and 'OFFICER' or 'SAY'
	elseif chatType == 'INSTANCE_CHAT' then
		SetTabType = inGuild and 'GUILD' or isOfficer and 'OFFICER' or 'SAY'
	elseif chatType == 'RAID' then
		SetTabType = inGuild and 'GUILD' or isOfficer and 'OFFICER' or 'SAY'
	elseif chatType == 'GUILD' then
		SetTabType = isOfficer and 'OFFICER' or 'SAY'
	elseif chatType == 'OFFICER' then
		SetTabType = 'SAY'
	elseif chatType == 'CHANNEL' then
		SetTabType = inParty and 'PARTY' or inInstance and 'INSTANCE_CHAT' or inRaid and 'RAID' or inGuild and 'GUILD' or isOfficer and 'OFFICER' or 'SAY'
	end
	if SetTabType then self:SetAttribute('chatType', SetTabType) ChatEdit_UpdateHeader(self) else return end
end)

--------------------------------------- 聊天信息複製-- Author:M-------------------------------------

--注意規則順序, button(LeftButton/RightButton)可以指定鼠標左右鍵使用不同的邏輯
local rules = {
    --!!这两条不要更改
    { pat = "|c%x+|HChatCopy|h.-|h|r",      repl = "" },   --去掉本插件定義的鏈接
    { pat = "|c%x%x%x%x%x%x%x%x(.-)|r",     repl = "%1" }, --替換所有顔色值
    --以下為左鍵特有
      { pat = CHAT_WHISPER_GET:gsub("%%s",".-"), repl = "", button = "LeftButton" }, --密語
      { pat = CHAT_WHISPER_INFORM_GET:gsub("%%s",".-"), repl = "", button = "LeftButton" }, --密語
    { pat = "|Hchannel:.-|h.-|h",           repl = "", button = "LeftButton" }, --(L)去掉頻道文字
    { pat = "|Hplayer:.-|h.-|h" .. ":",     repl = "", button = "LeftButton" }, --(L)去掉發言玩家名字
    { pat = "|Hplayer:.-|h.-|h" .. "：",    repl = "", button = "LeftButton" }, --(L)去掉發言玩家名字
    { pat = "|HBNplayer:.-|h.-|h" .. ":",   repl = "", button = "LeftButton" }, --(L)去掉戰網發言玩家名字
    { pat = "|HBNplayer:.-|h.-|h" .. "：",  repl = "", button = "LeftButton" }, --(L)去掉戰網發言玩家名字
    --以下為右鍵特有
    { pat = "|Hchannel:.-|h(.-)|h",         repl = "%1", button = "RightButton" }, --(R)留下頻道文字
    { pat = "|Hplayer:.-|h(.-)|h",          repl = "%1", button = "RightButton" }, --(R)留下發言玩家名字
    { pat = "|HBNplayer:.-|h(.-)|h",        repl = "%1", button = "RightButton" }, --(R)留下戰網發言玩家名字
    --!!这幾條不要更改
    { pat = "|H.-|h(.-)|h",                 repl = "%1" },  --替換所有超連接
    { pat = "|TInterface\\TargetingFrame\\UI%-RaidTargetingIcon_(%d):0|t", repl = "{rt%1}" },
    { pat = "|T.-|t",                       repl = "" },    --替換所有素材
    { pat = "%|[rcTtHhkK]",                 repl = "" },    --去掉單獨的|r|c|K
    { pat = "^%s+",                         repl = "" },    --去掉空格
}

--替換字符
local function clearMessage(msg, button)
    for _, rule in ipairs(rules) do
        if (not rule.button or rule.button == button) then
            msg = msg:gsub(rule.pat, rule.repl)
        end
    end
    return msg
end

--顯示信息
local function showMessage(msg, button)
    local editBox = ChatEdit_ChooseBoxForSend()
    msg = clearMessage(msg, button)
    ChatEdit_ActivateChat(editBox)
    editBox:SetText(editBox:GetText() .. msg)
    editBox:HighlightText()
end

--獲取複製的信息
local function getMessage(...)
    local object
    for i = 1, select("#", ...) do
        object = select(i, ...)
        if (object:IsObjectType("FontString") and MouseIsOver(object)) then
            return object:GetText()
        end
    end
    return ""
end

--HACK
local _SetItemRef = SetItemRef

SetItemRef = function(link, text, button, chatFrame)
    if (link:sub(1,8) == "ChatCopy") then
        local msg = getMessage(chatFrame.FontStringContainer:GetRegions())
        return showMessage(msg, button)
    end
    _SetItemRef(link, text, button, chatFrame)
end

--HACK
if (CHAT_TIMESTAMP_FORMAT) then
    if (not string.find(CHAT_TIMESTAMP_FORMAT, "ChatCopy")) then
        CHAT_TIMESTAMP_FORMAT = "|cff68ccef|HChatCopy|h"..CHAT_TIMESTAMP_FORMAT.."|h|r"
    end
end
local function AddMessage(self, text, ...)
    if (type(text) ~= "string") then
        text = tostring(text)
    end
    if (CHAT_TIMESTAMP_FORMAT) then
        if (not string.find(CHAT_TIMESTAMP_FORMAT, "ChatCopy")) then
            CHAT_TIMESTAMP_FORMAT = "|cff68ccef|HChatCopy|h"..CHAT_TIMESTAMP_FORMAT.."|h|r"
        end
        if (not string.find(text, "%|HChatCopy%|h")) then
            text = format("|cff68ccef|HChatCopy|h%s|h|r%s", BetterDate(CHAT_TIMESTAMP_FORMAT, time()), text)
        end
    else
        text = format("|cff68ccef|HChatCopy|h%s|h|r %s", "-", text)
    end
    self.OrigAddMessage(self, text, ...)
end

local chatFrame

for i = 1, NUM_CHAT_WINDOWS do
    chatFrame = _G["ChatFrame" .. i]
    if (chatFrame) then
        chatFrame.OrigAddMessage = chatFrame.AddMessage
        chatFrame.AddMessage = AddMessage
    end
end

---------------好友上线----------------------self:SetPoint("TOP",MinimapCluster,"BOTTOM",0,-21)
BNToastFrame:HookScript("OnShow", function(self)	self:SetScale(0.9) self:ClearAllPoints() self:SetPoint("BOTTOMLEFT", ChatFrame1Tab, "TOPLEFT", 0, 3)	end)
---------------------------------密语语音提示---------------------------
local WhisperSoundTip = CreateFrame("Frame")
function WhisperSoundTip:CHAT_MSG_WHISPER() PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Whisper.ogg", "Master") end
WhisperSoundTip:SetScript("OnEvent",function(self, event, ...)
	if self[event] then self[event](self, ...)
	else self:UnregisterEvent(event) end
end
)
WhisperSoundTip:RegisterEvent("CHAT_MSG_WHISPER")

-- 隐藏聊天菜单按钮(鼠标划过右上角显示)
--ChatFrameMenuButton:Hide()
--ChatFrameMenuButton:SetScript("OnShow", kill)
 ChatFrameMenuButton:SetScale(0.8)  --按钮缩放
 ChatFrameMenuButton:SetParent(ChatFrame1EditBoxLanguage)
 --ChatFrameMenuButton:SetAlpha(0.001)  --刚进游戏时按钮透明度(鼠标经过1次后显示鼠标离开时透明度)
 ChatFrameMenuButton:ClearAllPoints()
 ChatFrameMenuButton:SetPoint("RIGHT",ChatFrame1EditBoxLanguage,"LEFT",8,0) --位置  X15
 --ChatFrameMenuButton:SetScript('OnEnter', function(self) self:SetAlpha(1) end) --鼠标进入时透明度
 --ChatFrameMenuButton:SetScript('OnLeave', function(self) self:SetAlpha(0.001) end) --鼠标离开时透明度
 
-- 社交按钮(鼠标划过左上角显示)
QuickJoinToastButton:Hide()
QuickJoinToastButton:SetScript("OnShow", kill)
 --[[QuickJoinToastButton:SetScale(0.8) --按钮缩放
 QuickJoinToastButton:SetAlpha(0.001) --刚进游戏时按钮透明度(鼠标经过1次后显示鼠标离开时透明度)
 QuickJoinToastButton:ClearAllPoints()
 QuickJoinToastButton:SetPoint("BOTTOMLEFT",ChatFrame1,"BOTTOMLEFT",-11138,-32) --位置
 QuickJoinToastButton:SetScript('OnEnter', function(self) self:SetAlpha(1) end) --鼠标进入时透明度
 QuickJoinToastButton:SetScript('OnLeave', function(self) self:SetAlpha(0.001) end) --鼠标离开时透明度]]

-- 隐藏翻页按钮(不在最后一行右下角显示翻页至底按钮)
local updateBottomButton = function(frame)
	local button = frame.buttonFrame.bottomButton
	if frame:AtBottom() then button:Hide() else button:Show() end
end
local bottomButtonClick = function(button)
	local frame = button:GetParent()
	frame:ScrollToBottom()
	updateBottomButton(frame)
end
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G["ChatFrame" .. i]
		ChatFrame_RemoveMessageGroup(frame, "CHANNEL")  ----------关闭进出频道提示
		frame:HookScript("OnShow", updateBottomButton)
		frame.buttonFrame:Hide()
		frame.buttonFrame.bottomButton:SetParent(frame)
		frame.buttonFrame.bottomButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 5, 5)
		frame.buttonFrame.bottomButton:SetScript("OnClick", bottomButtonClick)
		frame.buttonFrame.bottomButton:SetAlpha(0.8)
    frame.buttonFrame.bottomButton:SetScale(0.7)
		updateBottomButton(frame)
    frame.buttonFrame.upButton.Show = frame.buttonFrame.upButton.Hide 
    frame.buttonFrame.upButton:Hide()
    frame.buttonFrame.downButton.Show = frame.buttonFrame.downButton.Hide 
    frame.buttonFrame.downButton:Hide()
    frame.buttonFrame.minimizeButton:SetScale(.7)   
    frame.buttonFrame.minimizeButton:ClearAllPoints()
    frame.buttonFrame.minimizeButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', 5, 5)
    frame.buttonFrame.minimizeButton:SetScript('OnEnter', function(self) self:SetAlpha(1) end)
    frame.buttonFrame.minimizeButton:SetScript('OnLeave', function(self) self:SetAlpha(0) end)
	end
	hooksecurefunc("FloatingChatFrame_OnMouseScroll", updateBottomButton)
	
	
-----------------Chatchannelbar----- 属性通报 ----------------------------------------
-- 本地化专精
function Talent()
	local SpecName = GetSpecialization() and select(2, GetSpecializationInfo(GetSpecialization())) or "无"
	return SpecName
end
-- 格式化血量
function HealText()
local HP = UnitHealthMax("player");
	if HP > 1e4 then return format('%.2f万',HP/1e4)
	else return HP end
end
-- 基础属性
function BaseInfo()
	local BaseStat = ""	
		BaseStat = BaseStat..("[%s] "):format(Talent())
		--BaseStat = BaseStat..("%s "):format(UnitClass("player"))
		BaseStat = BaseStat..("< %.1f/%.1f > "):format(GetAverageItemLevel())
		BaseStat = BaseStat..("血量:%s "):format(HealText())
	return BaseStat
end
-- 输出属性(9 = 暴击 12 = 溅射 17 = 吸血 18 = 急速 21 = 闪避 26 = 精通 29 = 装备+自身全能 31 = 装备全能)
-- by图图
function DpsInfo()
    local DpsStat={"", "", ""}
    local specAttr={
        --纯力敏智属性职业
        WARRIOR={1,1,1},
        DEATHKNIGHT={1,1,1},
        ROGUE={2,2,2},
        HUNTER={2,2,2},
        MAGE={3,3,3},
        WARLOCK={3,3,3},
        PRIEST={3,3,3},
        --混合力敏智属性职业
        SHAMAN={3,2,3},
        MONK={2,3,2},
        DRUID={3,2,2,3},
        PALADIN={3,1,1},
        DEMONHUNTER={2,1}
    }
	local specId = GetSpecialization()
	local classCN,classEnName = UnitClass("player")
    local classSpecArr = specAttr[classEnName]
    DpsStat[1] = (STRENGTH..":%s "):format(UnitStat("player", 1))
    DpsStat[2] = (AGILITY..":%s "):format(UnitStat("player", 2))
    DpsStat[3] = (INTELLECT..":%s "):format(UnitStat("player", 4))
	return DpsStat[classSpecArr[specId]]
end
-- 坦克属性
function TankInfo()
	local TankStat = ""
		TankStat = TankStat..(STAMINA..":%s "):format(UnitStat("player", 3))
		TankStat = TankStat..(ARMOR..":%s "):format(UnitArmor("player"))
		TankStat = TankStat..("闪避:%.2f%% "):format(GetDodgeChance())
		TankStat = TankStat..("招架:%.2f%% "):format(GetParryChance())
		TankStat = TankStat..("格挡:%.2f%% "):format(GetBlockChance())
	return TankStat
end
-- 治疗属性
function HealInfo()
	local HealStat = ""
		--HealStat = HealStat..("精神:%s "):format(UnitStat("player", 5))
		HealStat = HealStat..("法力回复:%d "):format(GetManaRegen()*5)
	return HealStat
end
-- 增强属性
function MoreInfo()
	local MoreStat = ""
		MoreStat = MoreStat..(HASTE..":%.2f%% "):format(GetMeleeHaste())
		MoreStat = MoreStat..(CRIT..":%.2f%% "):format(GetCritChance())
		MoreStat = MoreStat..(MASTERY..":%.2f%% "):format(GetMasteryEffect())
		--MoreStat = MoreStat..("溅射:%.2f%% "):format(GetMultistrike())
		MoreStat = MoreStat..("吸血:%s "):format(GetCombatRating(17))
		--MoreStat = MoreStat..("溅射:%.2f%% "):format(GetCombatRating(12))
		--MoreStat = MoreStat..("全能:%.2f%% "):format(GetCombatRating(29))
	return MoreStat
end
-- 属性收集
function StatReport()
	if UnitLevel("player") < 10 then return BaseInfo() end
	local StatInfo = ""
	local Role = GetSpecializationRole(GetSpecialization())
	if Role == "HEALER" then
		StatInfo = StatInfo..BaseInfo()..DpsInfo()..HealInfo()..MoreInfo()
	elseif Role == "TANK" then
		StatInfo = StatInfo..BaseInfo()..DpsInfo()..TankInfo()..MoreInfo()
	else
		StatInfo = StatInfo..BaseInfo()..DpsInfo()..MoreInfo()
	end
	return StatInfo
end

-- 最小化聊天栏 --
local ChatMiniMizeFrame = CreateFrame("Button",nil,UIParent)
ChatMiniMizeFrame:SetSize(21,21)
ChatMiniMizeFrame.t = ChatMiniMizeFrame:CreateFontString("ChatMiniMizeFrame", "OVERLAY")
ChatMiniMizeFrame.t:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ChatMiniMizeFrame.t:SetJustifyH("CENTER")
ChatMiniMizeFrame.t:SetWidth(28)
ChatMiniMizeFrame.t:SetHeight(28)
ChatMiniMizeFrame.t:SetText("-")
ChatMiniMizeFrame.t:SetPoint("CENTER", 0, 0)
ChatMiniMizeFrame.t:SetTextColor(30/255, 144/255, 255/255)
--ChatMiniMizeFrame.t=ChatMiniMizeFrame:CreateTexture(nil,"BORDER")
--ChatMiniMizeFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
--ChatMiniMizeFrame.t:SetAllPoints(ChatMiniMizeFrame)
ChatMiniMizeFrame:SetPoint("TOPLEFT",_G["ChatFrame1"],"BOTTOMLEFT",-6,1)
ChatMiniMizeFrame:Show()

local ChatHide = false
ChatMiniMizeFrame:SetScript("onclick", function(self, button)
        if ChatHide == false then
                --GeneralDockManager:Hide()
			ChatFrame1:Hide()
			--ChatFrame1.FontStringContainer:Hide()
			--ChatFrame1EditBox:SetAlpha(0)
                for i=1, NUM_CHAT_WINDOWS do
                        _G["ChatFrame"..i..""]:SetAlpha(0)
                        _G["ChatFrame"..i.."ButtonFrame"]:Hide()
                        chatbar:Hide()
                end
                ChatHide = true
        elseif ChatHide == true then
                --GeneralDockManager:Show()
			ChatFrame1:Show()
			--ChatFrame1.FontStringContainer:Show()
                for i=1, NUM_CHAT_WINDOWS do
                        _G["ChatFrame"..i..""]:SetAlpha(1)
                        _G["ChatFrame"..i.."ButtonFrame"]:Show()
                        chatbar:Show()
                end
                ChatHide = false
        end
end)

-- Nevo_Chatbar主框体 --
local chatFrame = SELECTED_DOCK_FRAME
local editBox = chatFrame.editBox
COLORSCHEME_BORDER   = { 0.3,0.3,0.3,1 }

local chatbar = CreateFrame("Frame", "chatbar", UIParent)
chatbar:SetWidth(300) -- 主框体宽度
chatbar:SetHeight(21) -- 主框体高度
chatbar:SetPoint("TOPLEFT", _G["ChatFrame1"], "BOTTOMLEFT", 9, 12) -- 锚点,想移动位置的改这里

-- Roll --
local roll = CreateFrame("Button", "rollMacro", UIParent, "SecureActionButtonTemplate")
roll:SetParent(chatbar)
roll:SetAttribute("type", "macro")
roll:SetAttribute("macrotext", "/roll")
roll:SetWidth(21)
roll:SetHeight(21)
roll:SetPoint("LEFT",chatbar,"LEFT",23,-12)
rollText = roll:CreateFontString("roll", "OVERLAY")
rollText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
rollText:SetJustifyH("CENTER")
rollText:SetWidth(25)
rollText:SetHeight(25)
rollText:SetText(Chatbar_rollText)
rollText:SetPoint("CENTER", 0, 0)
rollText:SetTextColor(210/255, 225/255, 30/255)
--roll.t = roll:CreateTexture()
--roll.t:SetAllPoints()
--roll.t:SetWidth(25)
--roll.t:SetHeight(25)
--roll.t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")

-- StatReport --
local StatReportOut = CreateFrame("Button", "StatReportOutMacro", UIParent, "SecureActionButtonTemplate")
StatReportOut:SetParent(chatbar)
StatReportOut:SetAttribute("type", "macro")
StatReportOut:SetAttribute("macrotext", "/run ChatFrame_OpenChat(StatReport())")
StatReportOut:SetWidth(21)
StatReportOut:SetHeight(21)
StatReportOut:SetPoint("LEFT",roll,"LEFT",21,0)
StatReportOutText = StatReportOut:CreateFontString("StatReportOut", "OVERLAY")
StatReportOutText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
StatReportOutText:SetJustifyH("CENTER")
StatReportOutText:SetWidth(25)
StatReportOutText:SetHeight(25)
StatReportOutText:SetText(Chatbar_StatReport)
StatReportOutText:SetPoint("CENTER", 0, 0)
StatReportOutText:SetTextColor(30/255, 144/255, 255/255)
--StatReportOut.t = StatReportOut:CreateTexture()
--StatReportOut.t:SetAllPoints()
--StatReportOut.t:SetWidth(25)
--StatReportOut.t:SetHeight(25)
--StatReportOut.t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")

-- "喊(/y)" --
local ChannelYell = CreateFrame("Button", "ChannelYell", UIParent)
ChannelYell:SetParent(chatbar)
ChannelYell:SetWidth(21) 
ChannelYell:SetHeight(21) 
ChannelYell:SetPoint("LEFT",StatReportOut,"RIGHT",0,0) 
ChannelYell:RegisterForClicks("AnyUp")
ChannelYell:SetScript("OnClick", function() ChannelYell_OnClick() end)
ChannelYellText = ChannelYell:CreateFontString("ChannelYellText", "OVERLAY")
ChannelYellText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelYellText:SetJustifyH("CENTER")
ChannelYellText:SetWidth(25)
ChannelYellText:SetHeight(25)
ChannelYellText:SetText(Chatbar_ChannelYell)
ChannelYellText:SetPoint("CENTER", 0, 0)
ChannelYellText:SetTextColor(255/255, 64/255, 64/255)
function ChannelYell_OnClick() ChatFrame_OpenChat("/y ", chatFrame) end

-- "说(/s)" --
local ChannelSay = CreateFrame("Button", "ChannelSay", UIParent)
ChannelSay:SetParent(chatbar)
ChannelSay:SetWidth(21)  -- 按钮宽度
ChannelSay:SetHeight(21)  -- 按钮高度
ChannelSay:SetPoint("LEFT",ChannelYell,"RIGHT",0,0)   -- 锚点
ChannelSay:RegisterForClicks("AnyUp")
ChannelSay:SetScript("OnClick", function() ChannelSay_OnClick() end)
ChannelSayText = ChannelSay:CreateFontString("ChannelSayText", "OVERLAY")
ChannelSayText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE") -- 字体设置
ChannelSayText:SetJustifyH("CENTER")
ChannelSayText:SetWidth(25)
ChannelSayText:SetHeight(25)
ChannelSayText:SetText(Chatbar_ChannelSay) -- 显示的文字
ChannelSayText:SetPoint("CENTER", 0, 0)
ChannelSayText:SetTextColor(1,1,1) -- 颜色
function ChannelSay_OnClick() ChatFrame_OpenChat("/s ", chatFrame) end

-- "队伍(/p)" --
local ChannelParty = CreateFrame("Button", "ChannelParty", UIParent)
ChannelParty:SetParent(chatbar)
ChannelParty:SetWidth(21) 
ChannelParty:SetHeight(21) 
ChannelParty:SetPoint("LEFT",ChannelSay,"RIGHT",0,0) 
ChannelParty:RegisterForClicks("AnyUp")
ChannelParty:SetScript("OnClick", function() ChannelParty_OnClick() end)
ChannelPartyText = ChannelParty:CreateFontString("ChannelPartyText", "OVERLAY")
ChannelPartyText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelPartyText:SetJustifyH("CENTER")
ChannelPartyText:SetWidth(25)
ChannelPartyText:SetHeight(25)
ChannelPartyText:SetText(Chatbar_ChannelParty)
ChannelPartyText:SetPoint("CENTER", 0, 0)
ChannelPartyText:SetTextColor(170/255, 170/255, 255/255)
function ChannelParty_OnClick() ChatFrame_OpenChat("/p ", chatFrame) end

-- "团队通告(/rw)" --
local ChannelRaidWarns = CreateFrame("Button", "ChannelRaidWarns", UIParent)
ChannelRaidWarns:SetParent(chatbar)
ChannelRaidWarns:SetWidth(21) 
ChannelRaidWarns:SetHeight(21) 
ChannelRaidWarns:SetPoint("LEFT",ChannelParty,"RIGHT",0,0) 
ChannelRaidWarns:RegisterForClicks("AnyUp")
ChannelRaidWarns:SetScript("OnClick", function() ChannelRaidWarns_OnClick() end)
ChannelRaidWarnsText = ChannelRaidWarns:CreateFontString("ChannelRaidWarnsText", "OVERLAY")
ChannelRaidWarnsText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelRaidWarnsText:SetJustifyH("CENTER")
ChannelRaidWarnsText:SetWidth(25)
ChannelRaidWarnsText:SetHeight(25)
ChannelRaidWarnsText:SetText(Chatbar_ChannelRaidWarns)
ChannelRaidWarnsText:SetPoint("CENTER", 0, 0)
ChannelRaidWarnsText:SetTextColor(255/255, 69/255, 0) 
function ChannelRaidWarns_OnClick() ChatFrame_OpenChat("/rw ", chatFrame) end

-- "团队(/raid)" --
local ChannelRaid = CreateFrame("Button", "ChannelRaid", UIParent)
ChannelRaid:SetParent(chatbar)
ChannelRaid:SetWidth(21) 
ChannelRaid:SetHeight(21) 
ChannelRaid:SetPoint("LEFT",ChannelRaidWarns,"RIGHT",0,0) 
ChannelRaid:RegisterForClicks("AnyUp")
ChannelRaid:SetScript("OnClick", function() ChannelRaid_OnClick() end)
ChannelRaidText = ChannelRaid:CreateFontString("ChannelRaidText", "OVERLAY")
ChannelRaidText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelRaidText:SetJustifyH("CENTER")
ChannelRaidText:SetWidth(25)
ChannelRaidText:SetHeight(25)
ChannelRaidText:SetText(Chatbar_ChannelRaid)
ChannelRaidText:SetPoint("CENTER", 0, 0)
ChannelRaidText:SetTextColor(255/255, 127/255, 0)
function ChannelRaid_OnClick() ChatFrame_OpenChat("/raid ", chatFrame) end

-- "副本(/i)" --
local ChannelBattleGround = CreateFrame("Button", "ChannelBattleGround", UIParent)
ChannelBattleGround:SetParent(chatbar)
ChannelBattleGround:SetWidth(21) 
ChannelBattleGround:SetHeight(21) 
ChannelBattleGround:SetPoint("LEFT",ChannelRaid,"RIGHT",0,0) 
ChannelBattleGround:RegisterForClicks("AnyUp")
ChannelBattleGround:SetScript("OnClick", function() ChannelBattleGround_OnClick() end)
ChannelBattleGroundText = ChannelBattleGround:CreateFontString("ChannelBattleGroundText", "OVERLAY")
ChannelBattleGroundText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelBattleGroundText:SetJustifyH("CENTER")
ChannelBattleGroundText:SetWidth(25)
ChannelBattleGroundText:SetHeight(25)
ChannelBattleGroundText:SetText(Chatbar_ChannelBattleGround)
ChannelBattleGroundText:SetPoint("CENTER", 0, 0)
ChannelBattleGroundText:SetTextColor(255/255, 127/255, 0)
function ChannelBattleGround_OnClick() ChatFrame_OpenChat("/i ", chatFrame) end

-- "公会(/g)" --
local ChannelGuild = CreateFrame("Button", "ChannelGuild", UIParent)
ChannelGuild:SetParent(chatbar)
ChannelGuild:SetWidth(21) 
ChannelGuild:SetHeight(21) 
ChannelGuild:SetPoint("LEFT",ChannelBattleGround,"RIGHT",0,0) 
ChannelGuild:RegisterForClicks("AnyUp")
ChannelGuild:SetScript("OnClick", function() ChannelGuild_OnClick() end)
ChannelGuildText = ChannelGuild:CreateFontString("ChannelGuildText", "OVERLAY")
ChannelGuildText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
ChannelGuildText:SetJustifyH("CENTER")
ChannelGuildText:SetWidth(25)
ChannelGuildText:SetHeight(25)
ChannelGuildText:SetText(Chatbar_ChannelGuild)
ChannelGuildText:SetPoint("CENTER", 0, 0)
ChannelGuildText:SetTextColor(64/255, 255/255, 64/255)
function ChannelGuild_OnClick() ChatFrame_OpenChat("/g ", chatFrame) end

-- 加入/离开大脚世界频道
if GetLocale() == "zhCN" then
local BF = CreateFrame("Button", "BF", UIParent)
BF:SetParent(chatbar)
BF:SetWidth(21) 
BF:SetHeight(21) 
BF:SetPoint("LEFT",ChannelGuild,"RIGHT",0,0)
BF:RegisterForClicks("AnyUp")
BF:RegisterEvent("PLAYER_LOGIN")
BF:RegisterEvent("CHANNEL_UI_UPDATE") 
BF:SetScript("OnEvent", function()
	local channels, BFname, inWorldChannel, order = {GetChannelList()}, "大脚世界频道"
	for i = 1, #channels do
		if channels[i] == BFname then
			inWorldChannel = true
			order = channels[i-1]
		end
	end
	BF:SetScript("OnMouseUp", function(self, button)
		if inWorldChannel then
			if button == "RightButton" then
				LeaveChannelByName(BFname)
				print("<<<|cffFF7F50"..QUIT.."世界頻道|r")
				inWorldChannel = false
			else
				ChatFrame_OpenChat("/"..order, chatFrame)
			end
		else
			JoinPermanentChannel(BFname,nil,1)
			ChatFrame_AddChannel(ChatFrame1,BFname)
			print(">>>|cff00C957"..JOIN.."世界頻道|r")
			inWorldChannel = true
		end
	end)
end)

BFText = BF:CreateFontString("BFText", "OVERLAY")
BFText:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
BFText:SetJustifyH("CENTER")
BFText:SetWidth(25)
BFText:SetHeight(25)
BFText:SetText("世")
BFText:SetPoint("CENTER", 0, 0)
BFText:SetTextColor(255/255, 200/255, 150/255)
end

------------------------------------------------------     ChatEmote     -----------------------------------------------------
local math,table,string,pairs,type,select,tonumber,floor,unpack=math,table,string,pairs,type,select,tonumber,floor,unpack
local _

local GameTooltip=GameTooltip
local GetCurrentResolution=GetCurrentResolution
local GetScreenResolutions=GetScreenResolutions
local ChatEdit_ChooseBoxForSend=ChatEdit_ChooseBoxForSend

local Emote_Panel_STRING_1="表情面板"
local Emote_Panel_STRING_2="<按住Ctrl拖动>"
local Locale={
    ["Angel"]="天使",
    ["Angry"]="生气",
    ["Biglaugh"]="大笑",
    ["Clap"]="鼓掌",
    ["Cool"]="酷",
    ["Cry"]="哭",
    ["Cute"]="可爱",
    ["Despise"]="鄙视",
    ["Dreamsmile"]="美梦",
    ["Embarras"]="尴尬",
    ["Evil"]="邪恶",
    ["Excited"]="兴奋",
    ["Faint"]="晕",
    ["Fight"]="打架",
    ["Flu"]="流感",
    ["Freeze"]="呆",
    ["Frown"]="皱眉",
    ["Greet"]="致敬",
    ["Grimace"]="鬼脸",
    ["Growl"]="龇牙",
    ["Happy"]="开心",
    ["Heart"]="心",
    ["Horror"]="恐惧",
    ["Ill"]="生病",
    ["Innocent"]="无辜",
    ["Kongfu"]="功夫",
    ["Love"]="花痴",
    ["Mail"]="邮件",
    ["Makeup"]="化妆",
    ["Mario"]="马里奥",
    ["Meditate"]="沉思",
    ["Miserable"]="可怜",
    ["Okay"]="好",
    ["Pretty"]="漂亮",
    ["Puke"]="吐",
    ["Shake"]="握手",
    ["Shout"]="喊",
    ["Silent"]="闭嘴",
    ["Shy"]="害羞",
    ["Sleep"]="睡觉",
    ["Smile"]="微笑",
    ["Suprise"]="吃惊",
    ["Surrender"]="失败",
    ["Sweat"]="流汗",
    ["Tear"]="流泪",
    ["Tears"]="悲剧",
    ["Think"]="想",
    ["Titter"]="偷笑",
    ["Ugly"]="猥琐",
    ["Victory"]="胜利",
    ["Volunteer"]="雷锋",
    ["Wronged"]="委屈",
	 ["rt1"]="星星", 
	 ["rt2"]="大饼", 
	 ["rt3"]="菱形", 
	 ["rt4"]="三角", 
	 ["rt5"]="月亮", 
	 ["rt6"]="方块", 
	 ["rt7"]="叉叉", 
	 ["rt8"]="骷髅", 
}
------------------------------------------------------------------------------------------------
local Emote_CallButton
local Emote_Index2Path={}
local Emote_IconTable={}
Emote_IconSize=0.9
local Emote_IconTable={
		{Locale["rt1"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {Locale["rt2"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {Locale["rt3"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {Locale["rt4"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {Locale["rt5"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {Locale["rt6"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {Locale["rt7"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {Locale["rt8"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {Locale["Angel"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\angel.blp"},
        {Locale["Angry"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\angry.blp"},
        {Locale["Biglaugh"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\biglaugh.blp"},
        {Locale["Clap"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\clap.blp"},
        {Locale["Cool"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\cool.blp"},
        {Locale["Cry"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\cry.blp"},
        {Locale["Cute"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\cutie.blp"},
        {Locale["Despise"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\despise.blp"},
        {Locale["Dreamsmile"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\dreamsmile.blp"},
        {Locale["Embarras"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\embarrass.blp"},
        {Locale["Evil"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\evil.blp"},
        {Locale["Excited"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\excited.blp"},
        {Locale["Faint"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\faint.blp"},
        {Locale["Fight"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\fight.blp"},
        {Locale["Flu"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\flu.blp"},
        {Locale["Freeze"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\freeze.blp"},
        {Locale["Frown"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\frown.blp"},
        {Locale["Greet"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\greet.blp"},
        {Locale["Grimace"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\grimace.blp"},
        {Locale["Growl"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\growl.blp"},
        {Locale["Happy"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\happy.blp"},
        {Locale["Heart"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\heart.blp"},
        {Locale["Horror"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\horror.blp"},
        {Locale["Ill"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\ill.blp"},
        {Locale["Innocent"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\innocent.blp"},
        {Locale["Kongfu"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\kongfu.blp"},
        {Locale["Love"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\love.blp"},
        {Locale["Mail"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\mail.blp"},
        {Locale["Makeup"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\makeup.blp"},
        {Locale["Mario"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\mario.blp"},
        {Locale["Meditate"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\meditate.blp"},
        {Locale["Miserable"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\miserable.blp"},
        {Locale["Okay"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\okay.blp"},
        {Locale["Pretty"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\pretty.blp"},
        {Locale["Puke"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\puke.blp"},
        {Locale["Shake"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\shake.blp"},
        {Locale["Shout"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\shout.blp"},
        {Locale["Silent"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\shuuuu.blp"},
        {Locale["Shy"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\shy.blp"},
        {Locale["Sleep"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\sleep.blp"},
        {Locale["Smile"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\smile.blp"},
        {Locale["Suprise"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\suprise.blp"},
        {Locale["Surrender"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\surrender.blp"},
        {Locale["Sweat"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\sweat.blp"},
        {Locale["Tear"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\tear.blp"},
        {Locale["Tears"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\tears.blp"},
        {Locale["Think"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\think.blp"},
        {Locale["Titter"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\titter.blp"},
        {Locale["Ugly"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\ugly.blp"},
        {Locale["Victory"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\victory.blp"},
        {Locale["Volunteer"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\volunteer.blp"},
        {Locale["Wronged"],"Interface\\AddOns\\_ShiGuang\\media\\Emotes\\wronged.blp"},
    }

local Emote_ICON_TAG_LIST={
        {strlower(ICON_TAG_RAID_TARGET_STAR1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(ICON_TAG_RAID_TARGET_STAR2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(ICON_TAG_RAID_TARGET_CIRCLE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(ICON_TAG_RAID_TARGET_CIRCLE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(ICON_TAG_RAID_TARGET_DIAMOND1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(ICON_TAG_RAID_TARGET_DIAMOND2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(ICON_TAG_RAID_TARGET_TRIANGLE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(ICON_TAG_RAID_TARGET_TRIANGLE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(ICON_TAG_RAID_TARGET_MOON1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(ICON_TAG_RAID_TARGET_MOON2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(ICON_TAG_RAID_TARGET_SQUARE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(ICON_TAG_RAID_TARGET_SQUARE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(ICON_TAG_RAID_TARGET_CROSS1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(ICON_TAG_RAID_TARGET_CROSS2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(ICON_TAG_RAID_TARGET_SKULL1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {strlower(ICON_TAG_RAID_TARGET_SKULL2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {strlower(RAID_TARGET_1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(RAID_TARGET_2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(RAID_TARGET_3),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(RAID_TARGET_4),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(RAID_TARGET_5),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(RAID_TARGET_6),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(RAID_TARGET_7),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(RAID_TARGET_8),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
    }
	for k,v in pairs(Emote_ICON_TAG_LIST) do
		Emote_Index2Path["{"..v[1].."}"]=v[2]
 	end

	for k,v in pairs(Emote_IconTable) do
  	    Emote_Index2Path["{"..v[1].."}"]=v[2]
 	end
------------------------------------------------------------------------------------------------
local function IconSize(f)
 	local _,font=f:GetFont()
  local h = GetScreenHeight();
 	font=Emote_IconSize*font*h/500
 	font=floor(font)
 	return font
end
------------------------------------------------------------------------------------------------
local function Emote_SendChatMessage_Filter(text)
	for s in string.gmatch(text,"\124T([^:]+):%d+\124t") do
  		local index
		for k,v in pairs(Emote_Index2Path) do
		    if v==s then
			    index=k
			end
		end
		if index then
   			text=string.gsub(text,"(\124T[^:]+:%d+\124t)",index,1)
  		end
 	end
 	return text
end

local function Emote_AddMessage_Filter(self,text)
	for s in string.gmatch(text,"({[^}]+})") do
  		if (Emote_Index2Path[s]) then text=string.gsub(text,s,"\124T"..Emote_Index2Path[s] ..":"..IconSize(self).."\124t",1) end
 	end return text
end

local _xSendChatMessage=SendChatMessage
local _xBNSendWhisper=BNSendWhisper
local _xBNSendConversationMessage=BNSendConversationMessage
	for i=1,NUM_CHAT_WINDOWS do
		if i~=2 then
			local f=getglobal("ChatFrame"..i)
			f._xAddMessage=f.AddMessage
			f.AddMessage=function(self,text,...)
			        text=Emote_AddMessage_Filter(self,text) self:_xAddMessage(text,...)
			    end
		end
	end
	_xSendChatMessage=SendChatMessage
	_G["SendChatMessage"]=function(text,...) text=Emote_SendChatMessage_Filter(text) _xSendChatMessage(text,...) end
	_xBNSendWhisper=BNSendWhisper
	_G["BNSendWhisper"]=function(presenceID,text) text=Emote_SendChatMessage_Filter(text) _xBNSendWhisper(presenceID,text) end
	_xBNSendConversationMessage=BNSendConversationMessage
	_G["BNSendConversationMessage"]=function(target,text) text=Emote_SendChatMessage_Filter(text) _xBNSendConversationMessage(target,text) end

 	Emote_CallButton=CreateFrame("Button","Emote_CallButton",UIParent)
 	Emote_CallButton:SetWidth(21)
 	Emote_CallButton:SetHeight(21)
 	--图标
 	Emote_CallButton:SetNormalTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\suprise")
 	Emote_CallButton:SetPushedTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\suprise")
 	Emote_CallButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight")
 	Emote_CallButton:GetHighlightTexture():SetBlendMode("ADD")
 	--[[文字
 	Emote_CallButton.text = Emote_CallButton:CreateFontString(nil, 'OVERLAY')
	Emote_CallButton.text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
	Emote_CallButton.text:SetPoint("CENTER", 0, 0)
	Emote_CallButton.text:SetText(Chatbar_EmoteCallButtonText)
	Emote_CallButton.text:SetTextColor(255/255, 0/255, 255/255)		]]
	Emote_CallButton:SetParent(chatbar)
	Emote_CallButton:SetAlpha(0.75)
	Emote_CallButton:SetFrameLevel(32)
	Emote_CallButton:SetMovable(true)
	Emote_CallButton:EnableMouse(true)
	Emote_CallButton:RegisterForClicks("LeftButtonUp","RightButtonUp")
 	Emote_CallButton:RegisterForDrag("LeftButton","RightButton")
	Emote_CallButton:ClearAllPoints()
 	Emote_CallButton:SetPoint("LEFT",chatbar,"LEFT",0,-9)
 	Emote_CallButton:SetScript("OnClick",function(self) if Emote_IconPanel:IsShown() then Emote_IconPanel:Hide() else Emote_IconPanel:Show() end if GameTooltip:GetOwner()==self then GameTooltip:Hide() end end)
 	Emote_CallButton:SetScript("OnDragStart",function(self) if self:IsMovable() and IsControlKeyDown() then self:StartMoving() end end)
 	Emote_CallButton:SetScript("OnDragStop",function(self) if self:IsMovable() then self:StopMovingOrSizing()  end  end)
 	Emote_CallButton:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self,"ANCHOR_TOPRIGHT")  GameTooltip:AddLine(Emote_Panel_STRING_1)  GameTooltip:AddLine(Emote_Panel_STRING_2) GameTooltip:AddLine(Emote_Panel_STRING_3) GameTooltip:Show() Emote_IconPanel.isCounting=nil end)
 	Emote_CallButton:SetScript("OnLeave",function(self) if GameTooltip:GetOwner()==self then GameTooltip:Hide() end Emote_IconPanel.showTimer=1.0 Emote_IconPanel.isCounting=1 end)
	Emote_CallButton:Show()

	Emote_IconPanel=CreateFrame("Frame","Emote_IconPanel",UIParent)
  Emote_IconPanel:SetWidth(310)
 	Emote_IconPanel:SetHeight(136)
 	Emote_IconPanel:SetFrameLevel(32)
 	Emote_IconPanel:SetMovable(true)
 	Emote_IconPanel:EnableMouse(true)
 	Emote_IconPanel:Hide()
 	Emote_IconPanel:ClearAllPoints()
 	Emote_IconPanel:SetPoint("BOTTOMLEFT",Emote_CallButton,"TOPRIGHT",0,0)
 	Emote_IconPanel:SetBackdrop({bgFile="Interface\\Tooltips\\UI-Tooltip-Background",edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",tile=true,tileSize=12,edgeSize=7,insets={left=4,right=4,top=4,bottom=4}})
 	Emote_IconPanel:SetBackdropColor(0,0,0)
 	Emote_IconPanel.showTimer=0
 	Emote_IconPanel:SetScript("OnUpdate",function(self,elapsed)
									if (not self.isCounting) then return
                  elseif (self.showTimer<=0) then
                                     self:Hide()
                                     self.showTimer=nil
                                     self.isCounting=nil
                   else self.showTimer=self.showTimer-elapsed end
								   end)
 	Emote_IconPanel:SetScript("OnEnter",function(self) self.isCounting=nil end)
 	Emote_IconPanel:SetScript("OnLeave",function(self) self.showTimer=1.0 self.isCounting=1 end)
	Emote_IconPanel.IconList={}
	Emote_IconPanel:SetScript("OnShow",function(self) for k,v in pairs(self.IconList) do v:Show() end end)
	Emote_IconPanel:SetScript("OnHide",function(self) for k,v in pairs(self.IconList) do v:Hide() end end)

 	local px=1
 	local py=1
 	for k,v in pairs(Emote_IconTable) do
		local b=CreateFrame("Button","Emote_Icon"..k,Emote_IconPanel)
    	b:Hide()
     	b:Show()
 	    b:EnableMouse(true)
 	    b:SetWidth(23)
 	    b:SetHeight(23)
 	    b.text=v[1]
 	    b.texture=v[2]
 	    b:SetNormalTexture(v[2])
 	    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
 	    b:GetHighlightTexture():SetBlendMode("ADD")
 	    b:SetFrameLevel(35)
 	    b:ClearAllPoints()
		  b.parent=Emote_IconPanel
 	    b:SetPoint("TOPLEFT",Emote_IconPanel,"TOPLEFT",(px-1)*25+5,(1-py)*25-5)
 	    b:SetScript("OnClick",function(self)
                                    local editBox=ChatEdit_ChooseBoxForSend()
                                    editBox:Show()
                                    editBox:SetFocus()
                                    editBox:Insert("\124T"..self.texture..":"..IconSize(SELECTED_CHAT_FRAME).."\124t")
                                    self.parent:Hide()
                                  end)
 	    b:SetScript("OnEnter",function(self)
                                    GameTooltip:SetOwner(self.parent,"ANCHOR_TOPLEFT")
                                    GameTooltip:SetText(self.text)
                                    GameTooltip:Show()
									self.parent.isCounting=nil
                                 end)
 	    b:SetScript("OnLeave",function(self)
                                    if GameTooltip:GetOwner()==self.parent then GameTooltip:Hide() end
                                    self.parent.showTimer=1.0
                                    self.parent.isCounting=1
								end)

  	    Emote_IconPanel.IconList[k]=b
  	    px=px+1
  	    if px>=13 then
   	    	px=1
   		    py=py+1
  	    end
 	end

	Locale=nil
	Emote_IconTable=nil
	Emote_ICON_TAG_LIST=nil


--[[--------------------------------------------------------------------
	ChatLinkTooltips	Written by Junxx EU-Khaz'goroth <addons@colordesigns.de>
----------------------------------------------------------------------]]
local supportedType = { item = true, achievement = true, spell = true, quest = true, enchant = true, glyph = true, unit = true, talent = true, }
local CompareShowing

local ChatLinkTooltips = CreateFrame("Frame")
ChatLinkTooltips:RegisterEvent("MODIFIER_STATE_CHANGED")
ChatLinkTooltips:SetScript("OnEvent", function(self, event, key, state)
	if CompareShowing and (key == "LSHIFT" or key == "RSHIFT") and not GameTooltip:IsEquippedItem() then
		if state == 1 then
			GameTooltip_ShowCompareItem(GameTooltip)
		else
			ShoppingTooltip1:Hide()
			ShoppingTooltip2:Hide()
		end
	end
end)
local function OnHyperlinkEnter(self, linkData, link)
	local linkType = strmatch(linkData, "^([^:]+)")
	if linkType and supportedType[linkType] then
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
		GameTooltip:SetHyperlink(linkData)
		CompareShowing = true
	end
end
local function OnHyperlinkLeave(self, linkData, link)
	GameTooltip:Hide()
	CompareShowing = nil
end
for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame"..i]
	frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)
	frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
end


--[[--------------------------------------------------------------------
align
----------------------------------------------------------------------]]
SLASH_EA1 = "/align"
local AlignFrame
SlashCmdList["EA"] = function()
	if AlignFrame then
		AlignFrame:Hide()
		AlignFrame = nil		
	else
		AlignFrame = CreateFrame('Frame', nil, UIParent) 
		AlignFrame:SetAllPoints(UIParent)
		local AlignWide = GetScreenWidth() / 64
		local AlignHeight = GetScreenHeight() / 36
		for i = 0, 64 do
			local AlignTFrame = AlignFrame:CreateTexture(nil, 'BACKGROUND')
			if i == 32 then AlignTFrame:SetColorTexture(1, 0, 0, 0.5) else AlignTFrame:SetColorTexture(0, 0, 0, 0.5) end
			AlignTFrame:SetPoint('TOPLEFT', AlignFrame, 'TOPLEFT', i * AlignWide - 1, 0)
			AlignTFrame:SetPoint('BOTTOMRIGHT', AlignFrame, 'BOTTOMLEFT', i * AlignWide + 1, 0)
		end
		for i = 0, 36 do
			local AlignTFrame = AlignFrame:CreateTexture(nil, 'BACKGROUND')
			if i == 18 then AlignTFrame:SetColorTexture(1, 0, 0, 0.5)
			else AlignTFrame:SetColorTexture(0, 0, 0, 0.5) end
			AlignTFrame:SetPoint('TOPLEFT', AlignFrame, 'TOPLEFT', 0, -i * AlignHeight + 1)
			AlignTFrame:SetPoint('BOTTOMRIGHT', AlignFrame, 'TOPRIGHT', 0, -i * AlignHeight - 1)
		end	
	end
end

--[[--------------------------------------------------------------------
SlashIn
----------------------------------------------------------------------]]
local addonName, SlashIn = ...
LibStub("AceTimer-3.0"):Embed(SlashIn)

local print = print
local tonumber = tonumber
local MacroEditBox = MacroEditBox
local MacroEditBox_OnEvent = MacroEditBox:GetScript("OnEvent")

local function OnCallback(command) MacroEditBox_OnEvent(MacroEditBox, "EXECUTE_CHAT_LINE", command) end

SLASH_SLASHIN_IN1 = "/in"
SLASH_SLASHIN_IN2 = "/slashin"

function SlashCmdList.SLASHIN_IN(msg)
	local secs, command = msg:match("^([^%s]+)%s+(.*)$")
	secs = tonumber(secs)
	if (not secs) or (#command == 0) then
		print("usage:\n /in <seconds> <command>")
		print("example:\n /in 1.5 /say hi")
	else
		SlashIn:ScheduleTimer(OnCallback, secs, command)
	end
end
---------Autoinvite by whisper----------------------------------------------------------------------
local Autoinvite = MaoRUI:EventFrame({"CHAT_MSG_WHISPER", "CHAT_MSG_BN_WHISPER"})
Autoinvite:SetScript("OnEvent", function(self, event, ...)
	if not MaoRUISettingDB["Chat"]["Invite"] then return end
	local arg1, arg2, _, _, _, _, _, _, _, _, _, _, arg3 = ...
	local list = {string.split(" ", MaoRUISettingDB["Chat"]["Keyword"])}
	for _, word in pairs(list) do
		if (not IsInGroup() or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and strlower(arg1) == strlower(word) then
			if event == "CHAT_MSG_BN_WHISPER" then
				local gameID = select(6, BNGetFriendInfoByID(arg3))
				local _, charName, _, realmName = BNGetGameAccountInfo(gameID)
				if CanCooperateWithGameAccount(gameID) and (not MaoRUISettingDB["Chat"]["GuildInvite"] or B.UnitInGuild(charName.."-"..realmName)) then
					BNInviteFriend(gameID)
				end
			else
				if not MaoRUISettingDB["Chat"]["GuildInvite"] or B.UnitInGuild(arg2) then
					InviteUnit(arg2)
				end
			end
		end
	end
end)
--[[---------ChatLootIcons----------------------------------------------------------------------
local function AddLootIcons(self, event, message, ...)
	local function Icon(link)
		local texture = GetItemIcon(link)
		return "\124T" .. texture .. ":" .. 12 .. "\124t" .. link
	end
	message = message:gsub("(\124c%x+\124Hitem:.-\124h\124r)", Icon)
	return false, message, ...
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", AddLootIcons)]]
--------------------------------------- 聊天超鏈接增加ICON-- @Author:M
--生成新的ICON超链接
local function GetHyperlink(Hyperlink, texture)
    if not texture then
        return Hyperlink
    else
        return "|HChatLinkIcon|h|T"..texture..":0|t|h" .. Hyperlink
    end
end
--等级图标显示
local function SetChatLinkIcon(Hyperlink)
    local schema, id = string.match(Hyperlink, "|H(%w+):(%d+):")
    local texture
    if (schema == "item") then
        texture = select(10, GetItemInfo(tonumber(id)))
    elseif (schema == "spell") then
        texture = select(3, GetSpellInfo(tonumber(id)))
    elseif (schema == "achievement") then
        texture = select(10, GetAchievementInfo(tonumber(id)))
    end
    return GetHyperlink(Hyperlink, texture)
end

------------------------------------------------ 聊天超鏈接增加物品等級 (支持大祕境鑰匙等級)-- @Author:M
local tooltip = CreateFrame("GameTooltip", "ChatLinkLevelTooltip", UIParent, "GameTooltipTemplate")
local ItemLevelPattern = gsub(ITEM_LEVEL, "%%d", "(%%d+)")
local ARMOR = ARMOR or "Armor"
local WEAPON = WEAPON or "Weapon"
local RELICSLOT = RELICSLOT or "Relic"

--获取物品实际等级
local function GetItemLevelAndTexture(ItemLink)
    local _, _, _, _, _, class, subclass, _, equipSlot, texture = GetItemInfo(ItemLink)
    if (not texture) then return end
    local text, level, slotText
    tooltip:SetOwner(UIParent, "ANCHOR_NONE")
    tooltip:ClearLines()
    tooltip:SetHyperlink(ItemLink)
    for i = 2, 4 do
        text = _G[tooltip:GetName().."TextLeft"..i]:GetText() or ""
        level = string.match(text, ItemLevelPattern)
        if (level) then break end
    end
    if (equipSlot and string.find(equipSlot, "INVTYPE_")) then
        slotText = _G[equipSlot]
    elseif (class == ARMOR) then
        slotText = class
    elseif (subclass and string.find(subclass, RELICSLOT)) then
        slotText = RELICSLOT
    end
    if (level and slotText) then
        level = slotText .. " <" .. level .. "> " 
    end
    return level, texture
end

--等级图标显示
local function SetChatLinkLevel(Hyperlink)
    local link = string.match(Hyperlink, "|H(.-)|h")
    local level, texture = GetItemLevelAndTexture(link)
    if (level) then
        Hyperlink = Hyperlink:gsub("|h%[(.-)%]|h", "|h["..level.."%1]|h")
    end
    return Hyperlink
end

--鑰匙等級
local function SetChatLinkKeystoneLevel(Hyperlink)
    local map, level, name = string.match(Hyperlink, "|Hkeystone:(%d+):(%d+):.-|h(.-)|h")
    if (map and level and not string.find(name, level)) then
        local name = C_ChallengeMode.GetMapInfo(map)
        Hyperlink = Hyperlink:gsub("|h%[(.-)%]|h", "|h["..level..":"..name.."]|h")
    end
    return Hyperlink
end

--过滤器
local function filter(self, event, msg, ...)
    msg = msg:gsub("(|H%w+:%d+:.-|h.-|h)", SetChatLinkIcon)
    msg = msg:gsub("(|Hitem:%d+:.-|h.-|h)", SetChatLinkLevel)
    return false, msg, ...
end

    ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", filter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", filter);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", filter)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter);