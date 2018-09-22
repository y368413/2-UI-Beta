local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("Chat")

-- add more chat font sizes
for i = 1, 23 do  CHAT_FONT_HEIGHTS[i] = i+7  end

--[[ 聊天标签
CHAT_FRAME_FADE_OUT_TIME = 0                  -- 聊天窗口褪色时间
CHAT_TAB_HIDE_DELAY = 0                       -- 聊天标签弹出延时
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 0.8   -- 鼠标停留时,标签透明度
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0       -- 鼠标离开时,标签透明度 (修改这里能一直显示)
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1   -- 鼠标停留时,选择标签时透明度
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0     -- 鼠标离开时,选择标签时透明度
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 0.6 -- 鼠标停留时,标签闪动时透明度
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0     -- 鼠标离开时,标签闪动时透明度
]]
---------------------------------- 好友上线 ------------------------------
--BNToastFrame:HookScript("OnShow", function(self) self:SetScale(0.9) self:ClearAllPoints() self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 121, 21) end)
ChatAlertFrame:ClearAllPoints()
ChatAlertFrame:SetPoint("BOTTOMLEFT", ChatFrame1Tab, "TOPLEFT", 230, 0)
--ChatAlertFrame:SetScale(0.85)
--------------------------------- 密语语音提示 ---------------------------
local WhisperSoundTip = CreateFrame("Frame")
function WhisperSoundTip:CHAT_MSG_WHISPER() PlaySoundFile("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\Whisper.ogg", "Master") end
WhisperSoundTip:SetScript("OnEvent",function(self, event, ...)
	if self[event] then self[event](self, ...) else self:UnregisterEvent(event) end
end)
WhisperSoundTip:RegisterEvent("CHAT_MSG_WHISPER")

--------------------------------- 隐藏聊天菜单按钮 ---------------------------
 ChatFrameMenuButton:SetScale(0.8)  --按钮缩放
 ChatFrameMenuButton:SetParent(ChatFrame1EditBoxLanguage)
 ChatFrameMenuButton:ClearAllPoints()
 ChatFrameMenuButton:SetPoint("RIGHT",ChatFrame1EditBoxLanguage,"LEFT",8,0) --位置  X15
 --ChatFrameMenuButton:SetAlpha(0.001)  --刚进游戏时按钮透明度(鼠标经过1次后显示鼠标离开时透明度)
 --ChatFrameMenuButton:SetScript('OnEnter', function(self) self:SetAlpha(1) end) --鼠标进入时透明度
 --ChatFrameMenuButton:SetScript('OnLeave', function(self) self:SetAlpha(0.001) end) --鼠标离开时透明度
 
----------------------------------- 社交按钮 ----------------------------------
QuickJoinToastButton.Show = M.Dummy
QuickJoinToastButton:Hide()
--QuickJoinToastButton:SetScale(0.8) --按钮缩放
--QuickJoinToastButton:ClearAllPoints()
--QuickJoinToastButton:SetPoint("BOTTOMLEFT",ChatFrame1,"BOTTOMLEFT",-11138,-32) --位置
--QuickJoinToastButton:SetAlpha(0.001) --刚进游戏时按钮透明度(鼠标经过1次后显示鼠标离开时透明度)
--QuickJoinToastButton:SetScript('OnEnter', function(self) self:SetAlpha(1) end) --鼠标进入时透明度
--QuickJoinToastButton:SetScript('OnLeave', function(self) self:SetAlpha(0.001) end) --鼠标离开时透明度

----------------------------------- 隐藏翻页按钮(不在最后一行右下角显示翻页至底按钮) ----------------------------------
--[[local updateBottomButton = function(frame)
	if frame:AtBottom() then frame.buttonFrame.bottomButton:Hide() else frame.buttonFrame.bottomButton:Show() end
end
local bottomButtonClick = function(button)
	button:GetParent():ScrollToBottom()
	updateBottomButton(button:GetParent())
end
for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame" .. i]
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
hooksecurefunc("FloatingChatFrame_OnMouseScroll", updateBottomButton)]]

---------------------------------  Swith channels by Tab ---------------------------
local cycles = {
	{ chatType = "SAY", use = function() return 1 end },
    { chatType = "PARTY", use = function() return IsInGroup() end },
    { chatType = "RAID", use = function() return IsInRaid() end },
    { chatType = "INSTANCE_CHAT", use = function() return IsPartyLFG() end },
    { chatType = "GUILD", use = function() return IsInGuild() end },
	{ chatType = "CHANNEL", use = function(_, editbox)
	  if I.Client ~= "zhCN" then return false end
		local channels, inWorldChannel, number = {GetChannelList()}
		for i = 1, #channels do
			if channels[i] == "大脚世界频道" then
				inWorldChannel = true
				number = channels[i-1]
				break
			end
		end
		if inWorldChannel then
			editbox:SetAttribute("channelTarget", number)
			return true
		else
			return false
		end
	end },
    { chatType = "SAY", use = function() return 1 end },
}
hooksecurefunc("ChatEdit_CustomTabPressed", function(self)
	if strsub(tostring(self:GetText()), 1, 1) == "/" then return end
    for i, curr in ipairs(cycles) do
        if curr.chatType == self:GetAttribute("chatType") then
            local h, r, step = i+1, #cycles, 1
            if IsShiftKeyDown() then h, r, step = i-1, 1, -1 end
            for j = h, r, step do
                if cycles[j]:use(self, self:GetAttribute("chatType")) then
                    self:SetAttribute("chatType", cycles[j].chatType)
                    ChatEdit_UpdateHeader(self)
                    return
                end
            end
        end
    end
end)

-----------------Chatchannelbar----- 属性通报 ----------------------------------------
if GetLocale() == "zhCN" then
STAT_STRENGTH = "力量"; STAT_AGILITY = "敏捷"; STAT_INTELLECT = "智力"; STAT_VERSATILITY = "全能"; STAT_ARMOR = "护甲"; STAT_HASTE = "急速"; STAT_MASTERY = "精通"; STAT_CRIT = "爆击"; STAT_STAMINA = "耐力"; STAT_SPIRIT = "精神";
elseif GetLocale() == "zhTW" then
STAT_STRENGTH = "力量"; STAT_AGILITY = "敏捷"; STAT_INTELLECT = "智力"; STAT_VERSATILITY = "臨機應變"; STAT_ARMOR = "護甲"; STAT_HASTE = "加速"; STAT_MASTERY = "精通"; STAT_CRIT = "致命一擊"; STAT_STAMINA = "耐力"; STAT_SPIRIT = "精神";
else
STAT_STRENGTH = "Strength"; STAT_AGILITY = "Agility"; STAT_INTELLECT = "Intellect"; STAT_VERSATILITY = "Versatility"; STAT_ARMOR = "Armor"; STAT_HASTE = "Haste"; STAT_MASTERY = "Mastery"; STAT_CRIT = "Critical Strike"; STAT_STAMINA = "Stamina"; STAT_SPIRIT = "Spirit";	
end
-- 本地化专精
function Talent()
	local SpecName = GetSpecialization() and select(2, GetSpecializationInfo(GetSpecialization())) or "无" return SpecName
end
-- 格式化血量
function HealText()
	if UnitHealthMax("player") > 1e4 then return format('%.2f万',UnitHealthMax("player")/1e4) else return UnitHealthMax("player") end
end
-- 基础属性
function BaseInfo()
	local BaseStat = ""	
		BaseStat = BaseStat..("[%s] "):format(Talent())
		--BaseStat = BaseStat..("%s "):format(UnitClass("player"))
		BaseStat = BaseStat..("< %.1f/%.1f > "):format(GetAverageItemLevel())
		BaseStat = BaseStat..("血量:%s "):format(HealText())
		  if C_ArtifactUI.GetEquippedArtifactInfo() then 
 				local pointsSpent = select(6,C_ArtifactUI.GetEquippedArtifactInfo()); 
 				  if pointsSpent <= 51 then BaseStat = BaseStat..(ARCHAEOLOGY_CURRENT..":%s "):format(pointsSpent); 
 				  else BaseStat = BaseStat..(ARCHAEOLOGY_CURRENT..":%d(%d)"):format(pointsSpent,pointsSpent-51); 
 				  end 
 			end 
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
	local classCN,classEnName = UnitClass("player")
    DpsStat[1] = (STAT_STRENGTH..":%s "):format(UnitStat("player", 1))
    DpsStat[2] = (STAT_AGILITY..":%s "):format(UnitStat("player", 2))
    DpsStat[3] = (STAT_INTELLECT..":%s "):format(UnitStat("player", 4))
	return DpsStat[specAttr[classEnName][GetSpecialization()]]
end
-- 坦克属性
function TankInfo()
	local TankStat = ""
		TankStat = TankStat..(STAT_STAMINA..":%s "):format(UnitStat("player", 3))
		TankStat = TankStat..(STAT_ARMOR..":%s "):format(UnitArmor("player"))
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
		MoreStat = MoreStat..(STAT_HASTE..":%.2f%% "):format(GetHaste())
		MoreStat = MoreStat..(STAT_CRIT..":%.2f%% "):format(GetCritChance())
		MoreStat = MoreStat..(STAT_MASTERY..":%.2f%% "):format(GetMasteryEffect())
		--MoreStat = MoreStat..("溅射:%.2f%% "):format(GetMultistrike()) -- GetCombatRating(12)
		--MoreStat = MoreStat..(STAT_LIFESTEAL..":%.2f%% "):format(GetLifesteal())
		MoreStat = MoreStat..(STAT_VERSATILITY..":%.2f%% "):format(GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE) + GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE))  --GetVersatility()
	return MoreStat
end
-- 属性收集
function StatReport()
	if UnitLevel("player") < 10 then return BaseInfo() end
	local StatInfo = ""
	local Role = GetSpecializationRole(GetSpecialization())
	if Role == "HEALER" then StatInfo = StatInfo..BaseInfo()..DpsInfo()..HealInfo()..MoreInfo()
	elseif Role == "TANK" then StatInfo = StatInfo..BaseInfo()..DpsInfo()..TankInfo()..MoreInfo()
	else StatInfo = StatInfo..BaseInfo()..DpsInfo()..MoreInfo()
	end
	return StatInfo
end

-- Nevo_Chatbar主框体 --
--COLORSCHEME_BORDER = { 0.3,0.3,0.3,1 }

local chatbar = CreateFrame("Frame", "chatbar", UIParent)
chatbar:SetWidth(300) -- 主框体宽度
chatbar:SetHeight(21) -- 主框体高度
chatbar:SetPoint("TOPLEFT", _G["ChatFrame1"], "BOTTOMLEFT", 3, 12) -- 锚点,想移动位置的改这里
local function CreatChatButton(id, parent, w, h, ap, frame, rp, x, y, alpha)
		local ChatButton = CreateFrame("Button", id, parent, "SecureActionButtonTemplate")
		ChatButton:SetParent(chatbar)
		ChatButton:SetWidth(w)
		ChatButton:SetHeight(h)
		ChatButton:SetPoint(ap, frame, rp, x, y)
		ChatButton:SetAlpha(alpha)
		--ChatButton:SetNormalTexture(Texture)
		return ChatButton
end
local function CreatChatText(f, font, fontsize, fontmod, w, h, text, rp, x, y, r, g, b)
    local ChatText = f:CreateFontString(nil, "OVERLAY")
		ChatText:SetFont(font, fontsize, fontmod)
		ChatText:SetJustifyH("CENTER")
		ChatText:SetWidth(w)
		ChatText:SetHeight(h)
		ChatText:SetText(text)
		ChatText:SetPoint(rp, x, y)
		ChatText:SetTextColor(r, g, b)
		return ChatText
end

	-- Custom ChatMenu
	local Voice = CreateFrame("Button", "Voice", UIParent)
	Voice:SetSize(18, 18)
	Voice:SetParent(chatbar)
	Voice:EnableMouse(true)
	Voice:RegisterForClicks("LeftButtonUp","RightButtonUp")
	Voice:ClearAllPoints()
	Voice:SetPoint("LEFT", chatbar, "LEFT", -2, -10.5)
	Voice.Icon = Voice:CreateTexture(nil, "ARTWORK")
	Voice.Icon:SetAllPoints()
	Voice.Icon:SetTexture("Interface\\AddOns\\_ShiGuang\\media\\Emotes\\zhuan_push_frame")
	Voice:SetScript("OnClick",function(self) if VoiceFrame:IsShown() then VoiceFrame:Hide() else VoiceFrame:Show() end end)
	
	local VoiceFrame = CreateFrame("Frame", "VoiceFrame", UIParent)
	VoiceFrame:SetSize(25, 100)
	VoiceFrame:Hide()
	VoiceFrame:ClearAllPoints()
	VoiceFrame:SetPoint("TOPLEFT", ChatFrame1, "TOPRIGHT", -2, 16)
	
	ChatFrameChannelButton:ClearAllPoints()
	ChatFrameChannelButton:SetPoint("TOP", VoiceFrame)
	ChatFrameChannelButton:SetParent(VoiceFrame)
	ChatFrameToggleVoiceDeafenButton:SetParent(VoiceFrame)
	ChatFrameToggleVoiceMuteButton:SetParent(VoiceFrame)
	--QuickJoinToastButton:SetParent(VoiceFrame)

-- Roll --
Roll = CreatChatButton("rollMacro", UIParent, 21, 21, "LEFT", chatbar, "LEFT", 36, -12, 1)
Roll:SetAttribute("type", "macro")
Roll:SetAttribute("macrotext", "/roll")
RollText = CreatChatText(Roll, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_rollText, "CENTER", 0, 0, 210/255, 225/255, 30/255)
--Roll.t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")

-- StatReport --
StatReportOut = CreatChatButton("StatReportOutMacro", UIParent, 21, 21, "LEFT", Roll, "RIGHT", 0, 0, 1)
StatReportOut:SetAttribute("type", "macro")
StatReportOut:SetAttribute("macrotext", "/run ChatFrame_OpenChat(StatReport())")
StatReportOutText = CreatChatText(StatReportOut, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_StatReport, "CENTER", 0, 0, 30/255, 144/255, 255/255)
--StatReportOut.t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up")

-- "喊(/y)" --
ChannelYell = CreatChatButton("ChannelYell", UIParent, 21, 21, "LEFT", StatReportOut, "RIGHT", 0, 0, 1)
ChannelYell:RegisterForClicks("AnyUp")
ChannelYell:SetScript("OnClick", function() ChatFrame_OpenChat("/y ", SELECTED_DOCK_FRAME) end)
ChannelYellText = CreatChatText(ChannelYell, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelYell, "CENTER", 0, 0, 255/255, 64/255, 64/255)

-- "说(/s)" --
ChannelSay = CreatChatButton("ChannelSay", UIParent, 21, 21, "LEFT", ChannelYell, "RIGHT", 0, 0, 1)
ChannelSay:RegisterForClicks("AnyUp")
ChannelSay:SetScript("OnClick", function() ChatFrame_OpenChat("/s ", SELECTED_DOCK_FRAME) end)
ChannelSayText = CreatChatText(ChannelSay, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelSay, "CENTER", 0, 0, 1,1,1)

-- "队伍(/p)" --
ChannelParty = CreatChatButton("ChannelParty", UIParent, 21, 21, "LEFT", ChannelSay, "RIGHT", 0, 0, 1)
ChannelParty:RegisterForClicks("AnyUp")
ChannelParty:SetScript("OnClick", function() ChatFrame_OpenChat("/p ", SELECTED_DOCK_FRAME) end)
ChannelPartyText = CreatChatText(ChannelParty, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelParty, "CENTER", 0, 0, 170/255, 170/255, 255/255)

-- "团队通告(/rw)" --
ChannelRaidWarns = CreatChatButton("ChannelRaidWarns", UIParent, 21, 21, "LEFT", ChannelParty, "RIGHT", 0, 0, 1)
ChannelRaidWarns:RegisterForClicks("AnyUp")
ChannelRaidWarns:SetScript("OnClick", function() ChatFrame_OpenChat("/rw ", SELECTED_DOCK_FRAME) end)
ChannelRaidWarnsText = CreatChatText(ChannelRaidWarns, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelRaidWarns, "CENTER", 0, 0, 255/255, 69/255, 05)

-- "团队(/raid)" --
ChannelRaid = CreatChatButton("ChannelRaid", UIParent, 21, 21, "LEFT", ChannelRaidWarns, "RIGHT", 0, 0, 1)
ChannelRaid:RegisterForClicks("AnyUp")
ChannelRaid:SetScript("OnClick", function() ChatFrame_OpenChat("/raid ", SELECTED_DOCK_FRAME) end)
ChannelRaidWarnsText = CreatChatText(ChannelRaid, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelRaid, "CENTER", 0, 0, 255/255, 127/255, 0)

-- "副本(/i)" --
ChannelBattleGround = CreatChatButton("ChannelBattleGround", UIParent, 21, 21, "LEFT", ChannelRaid, "RIGHT", 0, 0, 1)
ChannelBattleGround:RegisterForClicks("AnyUp")
ChannelBattleGround:SetScript("OnClick", function() ChatFrame_OpenChat("/i ", SELECTED_DOCK_FRAME) end)
ChannelBattleGroundText = CreatChatText(ChannelBattleGround, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelBattleGround, "CENTER", 0, 0, 255/255, 127/255, 0)

-- "公会(/g)" --
ChannelGuild = CreatChatButton("ChannelGuild", UIParent, 21, 21, "LEFT", ChannelBattleGround, "RIGHT", 0, 0, 1)
ChannelGuild:RegisterForClicks("AnyUp")
ChannelGuild:SetScript("OnClick", function() ChatFrame_OpenChat("/g ", SELECTED_DOCK_FRAME) end)
ChannelBattleGroundText = CreatChatText(ChannelGuild, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, Chatbar_ChannelGuild, "CENTER", 0, 0, 64/255, 255/255, 64/255)

-- 加入/离开大脚世界频道
if GetLocale() == "zhCN" then
BF = CreatChatButton("BF", UIParent, 21, 21, "LEFT", ChannelGuild, "RIGHT", 0, 0, 1)
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
				ChatFrame_OpenChat("/"..order, SELECTED_DOCK_FRAME)
			end
		else
			JoinPermanentChannel(BFname,nil,1)
			ChatFrame_AddChannel(ChatFrame1,BFname)
			print(">>>|cff00C957"..JOIN.."世界頻道|r")
			inWorldChannel = true
		end
	end)
end)
BFText = CreatChatText(BF, STANDARD_TEXT_FONT, 15, "OUTLINE", 25, 25, "世", "CENTER", 0, 0, 255/255, 200/255, 150/255)
end

------------------------------------------------------     ChatEmote     -----------------------------------------------------
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
	for k,v in pairs(Emote_ICON_TAG_LIST) do Emote_Index2Path["{"..v[1].."}"]=v[2] end
	for k,v in pairs(Emote_IconTable) do Emote_Index2Path["{"..v[1].."}"]=v[2] end
local function IconSize(f)
 	local _,font=f:GetFont()
    local h = GetScreenHeight();
 	font=Emote_IconSize*font*h/500
 	font=floor(font)
 	return font
end
local function Emote_SendChatMessage_Filter(text)
	for s in string.gmatch(text,"\124T([^:]+):%d+\124t") do
  		local index
		for k,v in pairs(Emote_Index2Path) do
		    if v==s then index=k end
		end
		if index then text=string.gsub(text,"(\124T[^:]+:%d+\124t)",index,1) end
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
 	Emote_CallButton:SetWidth(18)
 	Emote_CallButton:SetHeight(18)
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
 	Emote_CallButton:SetPoint("LEFT",chatbar,"LEFT",17,-10)
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
local showLinkType = {
    -- 1 Normal tooltip things:
    achievement = 1, enchant = 1, glyph = 1, item = 1, instancelock = 1, quest = 1, spell = 1, talent = 1, unit = 1, currency = 1, ptalent = 1,
    -- 2 Special tooltip things:
    battlepet = 2, battlePetAbil = 2, garrfollowerability = 2, garrfollower = 2, garrmission = 2,
}
local CompareShowing, currentLinkType, itemRefLink, itemRefText, itemRefFrame
local function OnHyperlinkEnter(frame, link, text)
    currentLinkType = showLinkType[link:match("(%a+):%d+")]
    if currentLinkType == 1 then
        GameTooltip:SetOwner(ChatFrame1Tab, "ANCHOR_TOPLEFT", 20, 20)
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
        CompareShowing = true
    elseif currentLinkType == 2 then
        -- Uses a special tooltip, just let the default function handle it.
        -- Postitione
        ItemRefTooltip:SetPoint("BOTTOMLEFT",ChatFrame1Tab,"TOPLEFT", 20, 20)
        FloatingGarrisonMissionTooltip:SetPoint("BOTTOMLEFT",ChatFrame1Tab,"TOPLEFT", 20, 20)
        FloatingGarrisonFollowerTooltip:SetPoint("BOTTOMLEFT",ChatFrame1Tab,"TOPLEFT", 20, 20)
        FloatingGarrisonFollowerAbilityTooltip:SetPoint("BOTTOMLEFT",ChatFrame1Tab,"TOPLEFT", 20, 20)
        SetItemRef(link, text, "LeftButton", frame)
        itemRefLink, itemRefText, itemRefFrame = link, text, frame
        CompareShowing = nil
    end
end
local function OnHyperlinkLeave(frame, link, text)
    if currentLinkType == 1 then
        GameTooltip:Hide()
        CompareShowing = nil
    elseif currentLinkType == 2 then
        -- Uses a special tooltip, just let the default function handle it.
        SetItemRef(itemRefLink, itemRefText, "LeftButton", itemRefFrame)
        itemRefLink, itemRefText, itemRefFrame = nil,nil,nil
        CompareShowing = nil
    end
    currentLinkType = nil
end
local ChatLinkTooltips = CreateFrame("Frame")
ChatLinkTooltips:RegisterEvent("MODIFIER_STATE_CHANGED")
ChatLinkTooltips:SetScript("OnEvent", function(self, event, key, state)
	if CompareShowing and (key == "LSHIFT" or key == "RSHIFT") and not GameTooltip:IsEquippedItem() then
		if state == 1 then
				GameTooltip_ShowCompareItem(GameTooltip)
		else
			ShoppingTooltip1:Hide()
			ShoppingTooltip2:Hide()
			--ShoppingTooltip3:Hide()
		end
	end
end)
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
local _, SlashIn = ...
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
		print("|cff33ff99SlashIn:|r")
		print("|cff33ff99Usage:|r /in <seconds> <command>")
		print("|cff33ff99Example:|r /in 1.5 /say hi")
	else
		SlashIn:ScheduleTimer(OnCallback, secs, command)
	end
end

---------Autoinvite by whisper----------------------------------------------------------------------
function module:WhipserInvite()
	if not MaoRUISettingDB["Chat"]["Invite"] then return end
	local whisperList = {string.split(" ", MaoRUISettingDB["Chat"]["Keyword"])}
	local function onChatWhisper(event, ...)
		local arg1, arg2, _, _, _, _, _, _, _, _, _, _, arg3 = ...
		for _, word in pairs(whisperList) do
			if (not IsInGroup() or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and strlower(arg1) == strlower(word) then
				if event == "CHAT_MSG_BN_WHISPER" then
					local gameID = select(6, BNGetFriendInfoByID(arg3))
					if gameID then
						local _, charName, _, realmName = BNGetGameAccountInfo(gameID)
						if CanCooperateWithGameAccount(gameID) and (not MaoRUISettingDB["Chat"]["GuildInvite"] or M.UnitInGuild(charName.."-"..realmName)) then
							BNInviteFriend(gameID)
						end
					end
				else
					if not MaoRUISettingDB["Chat"]["GuildInvite"] or M.UnitInGuild(arg2) then
						InviteToGroup(arg2)
					end
				end
			end
		end
	end
	M:RegisterEvent("CHAT_MSG_WHISPER", onChatWhisper)
	M:RegisterEvent("CHAT_MSG_BN_WHISPER", onChatWhisper)
end

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
	
--------------------------------------- 支持上下箭頭選取历史-- Author:M-------------------------------------
local ChatHistory = {}
local function AddHistoryLine(self, text)
    if (not text or text == "") then return end
    local type = self:GetAttribute("chatType")
    if (type == "WHISPER") then text = text:gsub("^/%w+%s*%S+%s*", "")
    elseif (string.find(text, "^/script")) then
    else text = text:gsub("^/%w+%s*", "") end
    if (text == "") then return end
    for i, v in ipairs(ChatHistory[self]) do
        if (v == text) then
            table.remove(ChatHistory[self], i)
            break
        end
    end
    table.insert(ChatHistory[self], 1, text)
end
local function GetHistoryLine(self, keyPress)
    local increment
    if (keyPress == "UP") then increment = 1
    elseif (keyPress == "DOWN") then increment = -1
    else return end
    ChatHistory[self].index = ChatHistory[self].index + increment
    local text = ChatHistory[self][ChatHistory[self].index]
    if (text) then self:SetText(text)
		self:SetCursorPosition(strlen(text))
    else ChatHistory[self].index = ChatHistory[self].index - increment end
end
local function ResetHistoryIndex(self) ChatHistory[self].index = 0 end
local function simplify(self)
    if not self or self.hasSimplified then return end
    local name = self:GetName()
    self.hasSimplified = true
    self:SetClampRectInsets(0, 0, 0, 0)
    self:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
    self:SetMinResize(80, 43)
    self:SetClampedToScreen(false)
    --_G[name.."ButtonFrame"]:Hide()
    --_G[name.."ButtonFrame"]:HookScript("OnShow", _G[name.."ButtonFrame"].Hide)
    _G[name.."EditBoxLeft"]:Hide()
    _G[name.."EditBoxMid"]:Hide()
    _G[name.."EditBoxRight"]:Hide()
    local editbox = _G[name.."EditBox"]
    editbox:ClearAllPoints()
    editbox:SetPoint("BOTTOM",_G[self:GetName().."Tab"],"TOP",0,-21) --調整輸入框的位置
    editbox:SetPoint("LEFT", self, -5, 0)
    editbox:SetPoint("RIGHT", self, 10, 0)
    editbox:SetAltArrowKeyMode(false)
    ChatHistory[editbox] = { index = 0 }
    editbox:HookScript("OnEditFocusLost", ResetHistoryIndex)
    editbox:HookScript("OnArrowPressed", GetHistoryLine)
    hooksecurefunc(editbox, "AddHistoryLine", AddHistoryLine) 
    local tabFont = _G[name.."Tab"]:GetFontString()
    tabFont:SetFont(tabFont:GetFont(), 12, "NORMAL")
end
do for i = 1, NUM_CHAT_WINDOWS do simplify(_G["ChatFrame"..i]) end end

    --ChatFontNormal:SetShadowOffset(1, -1)
    --ChatFontNormal:SetShadowColor(0, 0, 0, 0.9)
    --所有聊天框簡化一下
    --for i = 1, NUM_CHAT_WINDOWS do simplify(_G["ChatFrame"..i]) end
    --动态创建的聊天框也要处理,並且讓密語窗口支持雙擊回復
    --hooksecurefunc("FCF_SetTemporaryWindowType", function(chatFrame, chatType, chatTarget)
        --simplify(chatFrame)
        --chatFrame:ScrollToBottom()
        --_G[chatFrame:GetName().."Tab"]:SetScript("OnDoubleClick", function(self)
            --if (chatType == "WHISPER" or chatType == "BN_WHISPER") then
                --local editBox = ChatEdit_ChooseBoxForSend()
                --editBox:SetAttribute("chatType", chatType)
                --editBox:SetAttribute("tellTarget", chatTarget)
                --ChatEdit_ActivateChat(editBox)
                --editBox:SetText(editBox:GetText())
            --end
        --end)
    --end)


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
local function ClearMessage(msg, button)
    for _, rule in ipairs(rules) do
        if (not rule.button or rule.button == button) then msg = msg:gsub(rule.pat, rule.repl) end
    end
    return msg
end
--顯示信息
local function ShowMessage(msg, button)
    local editBox = ChatEdit_ChooseBoxForSend()
    msg = ClearMessage(msg, button)
    ChatEdit_ActivateChat(editBox)
    editBox:SetText(editBox:GetText() .. msg)
    editBox:HighlightText()
end
--獲取複製的信息
local function GetMessage(...)
    local object
    for i = 1, select("#", ...) do
        object = select(i, ...)
        if (object:IsObjectType("FontString") and MouseIsOver(object)) then return object:GetText() end
    end
    return ""
end
--HACK
local _SetItemRef = SetItemRef
SetItemRef = function(link, text, button, chatFrame)
    if (chatFrame and link:sub(1,8) == "ChatCopy") then
        local msg = GetMessage(chatFrame.FontStringContainer:GetRegions())
        return ShowMessage(msg, button)
    end
    _SetItemRef(link, text, button, chatFrame)
end

local function AddMessage(self, text, ...)
    if (type(text) ~= "string") then
        text = tostring(text)
    end
    text = format("|cff68ccef|HChatCopy|h%s|h|r %s", " -", text)
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

--------------------------------------- 聊天超鏈接增加ICON-- @Author:M
--生成新的ICON超链接
local function GetHyperlink(Hyperlink, texture)
    if not texture then return Hyperlink else return "|HChatLinkIcon|h|T"..texture..":0|t|h" .. Hyperlink end
end
--等级图标显示
local function SetChatLinkIcon(Hyperlink)
    local schema, id = string.match(Hyperlink, "|H(%w+):(%d+):")
    local texture
    if (schema == "item") then texture = select(10, GetItemInfo(tonumber(id)))
    elseif (schema == "spell") then texture = select(3, GetSpellInfo(tonumber(id)))
    elseif (schema == "achievement") then texture = select(10, GetAchievementInfo(tonumber(id)))
    end
    return GetHyperlink(Hyperlink, texture)
end
------------------------------------------------ 聊天超鏈接增加物品等級 (支持大祕境鑰匙等級)-- @Author:M
--等级显示
local function ChatItemLevel(Hyperlink)
    local link = string.match(Hyperlink, "|H(.-)|h")
    local name, _, _, _, _, class, subclass, _, equipSlot = GetItemInfo(link)
    local level = GetDetailedItemLevelInfo(link)
    if (level) then
        if (equipSlot and string.find(equipSlot, "INVTYPE_")) then level = format("%s(%s)", level, _G[equipSlot] or equipSlot)
        elseif (class == ARMOR) then level = format("%s(%s)", level, class)
        elseif (subclass and string.find(subclass, RELICSLOT)) then level = format("%s(%s)", level, RELICSLOT)
        end
            --local gem = ""
            --local num, info = LibItemGem:GetItemGemInfo(link)
            --for i = 1, num do
                --gem = gem .. "|TInterface\\ItemSocketingFrame\\UI-EmptySocket-Prismatic:0|t"
            --end
            --if (gem ~= "") then gem = gem.." " end
            Hyperlink = Hyperlink:gsub("|h%[(.-)%]|h", "|h["..level..":"..name.."]|h") --..gem
        --Caches[Hyperlink] = Hyperlink
    end
    return Hyperlink
end

------------------------------------------------ ChatLinkIcon + ChatLinkLevel
--过滤器
local function filter(self, event, msg, ...)
    msg = msg:gsub("(|H%w+:%d+:.-|h.-|h)", SetChatLinkIcon)
    msg = msg:gsub("(|Hitem:%d+:.-|h.-|h)", ChatItemLevel)
    return false, msg, ...
end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", filter)
	
	
	
function module:OnLogin()
	-- Default
	SetCVar("chatStyle", "classic")
	M.HideOption(InterfaceOptionsSocialPanelChatStyle)
	CombatLogQuickButtonFrame_CustomTexture:SetTexture(nil)
	if not MaoRUISettingDB["Chat"]["Sticky"] then
		ChatTypeInfo["WHISPER"].sticky = 0    -- 密语
		ChatTypeInfo["BN_WHISPER"].sticky = 0  -- 战网好友密语
	end
	-- ChannelRename
	local gsub = _G.string.gsub
	for i = 1, NUM_CHAT_WINDOWS do
		if ( i ~= 2 ) then
			local f = _G["ChatFrame"..i]
			local am = f.AddMessage
			f.AddMessage = function(frame, text, ...)
					text = text:gsub("|h%[(%d+)%. 大脚世界频道%]|h", "|h%[%1%.世界%]|h")
					text = text:gsub("|h%[(%d+)%. 大腳世界頻道%]|h", "|h%[%1%.世界%]|h")
					return am(frame, text, ...)  --return am(frame, text:gsub("|h%[(%d+)%..-%]|h", "|h[%1]|h"), ...)
			end
		end
	end
  --chat skinning
  for i = 1, NUM_CHAT_WINDOWS do
   if not MaoRUISettingDB["Chat"]["Chatbg"] then     -- 聊天标签背景
    for index, value in pairs({"Left", "Middle", "Right", "Glow", "SelectedLeft", "SelectedRight", "SelectedMiddle",}) do _G['ChatFrame'..i..'Tab'..value]:SetTexture(nil) end
   end
   if not MaoRUISettingDB["Chat"]["Chattabbg"] then    -- 聊天框背景
    for g = 1, #CHAT_FRAME_TEXTURES do _G["ChatFrame"..i..CHAT_FRAME_TEXTURES[g]]:SetTexture(nil) end
   end
	self:WhipserInvite()
  end
end