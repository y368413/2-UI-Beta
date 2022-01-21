local Report = true;   --队伍里通报功能。 false：关     true：开  
 
--监控的关键字表: 
local lb = {
"一个巨大的吞噬者撕",
"一位强大的渊誓者打",
"现在还不是时候",
"裂隙闯入了刻希亚",
"一辆突袭补给车正",
"救兵就快到了",
"为了堕罪堡",
"搜遍每一条缝隙",
"在远处挑衅",
"托加斯特的大门开",
"它将以噬渊行者为食",
"这件事相当出乎意料",
"当堕落军马开始奔腾时",
"修复了通往智慧密室的",
"修复了通往学识密室的",
"耀武扬威地咆哮着",
"出价被人超过了",
"你赢得了对",
"谦逊暮钟已被敲响！",
"勇气暮钟已被敲响！",
"纯洁暮钟已被敲响！",
"忠诚暮钟已被敲响！",
"智慧暮钟已被敲响！",
"晋升者议会已经集结！",
}
local MapIDs = { 
[1961] = true,  --刻希亚
[1543] = true,  --噬渊
[1525] = true,  --雷文德斯 9.0黑市所在地
[1533] = true,  --晋升堡垒
}

local BD = {
bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
tile = true,
tileSize = 32,
insets = {left = -1, right = -1, top = -1, bottom = -1},
}
local timerBar = CreateFrame("StatusBar", nil, UIParent, "BackdropTemplate")
timerBar:SetPoint("TOP", 0, -100);
timerBar:SetSize(180, 14);
timerBar:SetStatusBarTexture("Interface\\AddOns\\zZ_ChatJK\\Media\\LiteStep", "BORDER");
timerBar:SetStatusBarColor(0.89, 0.62, 0.17);
timerBar:SetBackdrop(BD);
timerBar:Hide();
timerBar.Spark = timerBar:CreateTexture(nil, "OVERLAY")
timerBar.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark");
timerBar.Spark:SetSize(32, 51);
timerBar.Spark:SetBlendMode("ADD");
timerBar.Spark:SetPoint("LEFT", timerBar:GetStatusBarTexture(), "RIGHT", -15, 0);
timerBar.Text = timerBar:CreateFontString(nil, "OVERLAY");
timerBar.Text:SetFontObject(GameFontHighlight);
timerBar.Text:SetPoint("CENTER", timerBar, "CENTER", 0, 2);
timerBar.Text:SetJustifyH("CENTER");
local timeLeft = 0
local function barUpdate(self, elapsed)
	timeLeft = (timeLeft or 0) - elapsed
	if(timeLeft <= 0) then return self:Hide() end
	self:SetValue(timeLeft);
	local d = math.floor(timeLeft/86400)
	local h = math.fmod(math.floor(timeLeft/3600), 24)
    local m = math.fmod(math.floor(timeLeft/60), 60)
    local s = math.fmod(timeLeft, 60)
	if (timeLeft> 86400) then
		self.Text:SetFormattedText("倒计时：%dd.%dh.%02dm.%ds", d, h, m, s)
	elseif (timeLeft> 3600) then
		self.Text:SetFormattedText("倒计时：%dh.%02dm.%ds", h, m, s)
    elseif (timeLeft> 60) then
		self.Text:SetFormattedText("倒计时：%dm:%ds", m, s)
    elseif (timeLeft> 10) then
		self.Text:SetFormattedText("倒计时：%ds", s)
    elseif (timeLeft> 0) then
		self.Text:SetFormattedText("倒计时：%0.1fs", s)
	else
		text = ""
	end
end
timerBar:SetScript("OnUpdate", barUpdate)
local function showBar(self, event, ...)
	local BWL = _G["BigWigsLoader"]
	if(BWL) then return end
	timerBar:Show();
end

local ChannelSet = function(Warning)
	if Report == true then
		if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
			return "INSTANCE_CHAT"
		elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
			if Warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
				return "RAID_WARNING" 
			else
				return "RAID" 
			end
		elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
			return "PARTY"
		else
			return "SAY"
		end
	else
		return "SAY"
	end
end

local function ko(self, event, ...)
local text = select(1, ...)
local name = select(2, ...)
local players = select(5, ...)
local msgs = string.lower(text)
local mapID = C_Map.GetBestMapForUnit("player")
if not MapIDs[mapID] then return end
    for _, k in pairs(lb) do
		local gofind = string.find(msgs, k)
        if gofind then
		    msg = CreateFrame("MessageFrame", nil, UIParent)
		    msg:SetWidth(1000);
		    msg:SetHeight(512);
		    msg:SetPoint("TOP", 0, -200, "CENTER", 0, 200);
		    msg:SetHeight(44)
		    msg:SetInsertMode("TOP")
		    msg:SetFrameStrata("HIGH")
		    msg:SetTimeVisible(2)
		    msg:SetFadeDuration(2)
		    msg:SetScale(1.3)
			msg:SetFont(ChatFontNormal:GetFont(), 35, "OUTLINE");
			if k == "一个巨大的吞噬者撕" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\歼灭刷了.ogg", "Master")
				msg:AddMessage("▇▇▇▇歼灭刷了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■歼灭刷了■■■|r")
				else
					SendChatMessage("■■■歼灭，刷了■■■", ChannelSet(Warning))
				end
			elseif k == "一位强大的渊誓者打" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\高耸刷了.ogg", "Master")
				msg:AddMessage("▇▇▇▇高耸刷了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■高耸刷了■■■|r")
				else
					SendChatMessage("■■■高耸，刷了■■■", ChannelSet(Warning))
				end
			elseif k == "现在还不是时候" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\圣物破坏者.ogg", "Master")
				msg:AddMessage("▇▇▇▇圣物破坏者 左边▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■圣物破坏者 左边■■■|r".." |cffffff00|Hworldmap:1961:3100:4500|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:3100:4500|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■圣物破坏者刷了，左边■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "一辆突袭补给车正" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\货车粉碎者.ogg", "Master")
				msg:AddMessage("▇▇▇货车粉碎者，要开车了▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■货车粉碎者，要开车了■■■|r".." |cffffff00|Hworldmap:1961:5800:1700|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:5800:1700|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■货车粉碎者，要开车了■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "救兵就快到了" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\格里恩波波.ogg", "Master")
				msg:AddMessage("▇▇▇▇格里恩 波波▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■格里恩 波波■■■|r".." |cffffff00|Hworldmap:1961:4700:3500|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:4700:3500|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■格里恩，波波刷了■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "为了堕罪堡" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\温西尔冥河.ogg", "Master")
				msg:AddMessage("▇▇▇▇温西尔 冥河 岛上▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■温西尔 冥河 岛上■■■|r".." |cffffff00|Hworldmap:1961:4600:8000|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:4600:8000|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■温西尔，冥河刷了，岛上■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "搜遍每一条缝隙" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\通灵肉翼.ogg", "Master")
				msg:AddMessage("▇▇▇▇通灵 肉翼▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■通灵 肉翼■■■|r".." |cffffff00|Hworldmap:1961:6000:4300|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:6000:4300|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■通灵，肉翼刷了■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "在远处挑衅" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\法夜逃跑.ogg", "Master")
				msg:AddMessage("▇▇▇▇法夜 逃跑▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■法夜 逃跑■■■|r".." |cffffff00|Hworldmap:1961:3300:3900|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:3300:3900|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■法夜，逃跑刷了■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "它将以噬渊行者为食" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\吞噬变身开始了.ogg", "Master")
				msg:AddMessage("▇▇▇▇吞噬，变身开始了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■吞噬，变身开始了■■■|r".." |cffffff00|Hworldmap:1961:5100:4200|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:5100:4200|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■吞噬，变身开始了■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "当堕落军马开始奔腾时" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\军马刷了.ogg", "Master")
				msg:AddMessage("▇▇▇▇军马刷了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■军马刷了■■■|r")
				else
					SendChatMessage("■■■军马，军马，刷了■■■", ChannelSet(Warning))
				end
			elseif k == "修复了通往智慧密室的" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\上井盖智慧密室.ogg", "Master")
				msg:AddMessage("▇▇▇▇上井盖 智慧密室▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■上井盖 智慧密室■■■|r".." |cffffff00|Hworldmap:1961:4500:3500|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:4500:3500|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■上井盖 智慧密室■■■"..Marker, ChannelSet(Warning))
				end
			elseif k == "修复了通往学识密室的" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\下井盖学识密室.ogg", "Master")
				msg:AddMessage("▇▇▇▇下井盖 学识密室▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■下井盖 学识密室■■■|r".." |cffffff00|Hworldmap:1961:3900:5200|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1961:3900:5200|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■下井盖 学识密室■■■"..Marker, ChannelSet(Warning))
				end	
			elseif k == "托加斯特的大门开" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\折磨者事件开始了.ogg", "Master")
				msg:AddMessage("▇▇▇▇折磨者事件开始了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■折磨者事件开始了■■■|r")
				else
					SendChatMessage("■■■折磨者事件开始了■■■", ChannelSet(Warning))
				end
                timerBar:SetMinMaxValues(0, 300);
	            timeLeft = 300
				showBar()
			elseif k == "这件事相当出乎意料" then
	        	PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\掮灵出来了.ogg", "Master")
				msg:AddMessage("▇▇▇▇掮灵出来了▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■掮灵出来了■■■|r".." |cffffff00|Hworldmap:1543:3100:1300|h[位置]|h|r")
				else
				    local Marker = " |cffffff00|Hworldmap:1543:3100:1300|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("■■■掮灵，出来了■■■"..Marker, ChannelSet(Warning))
				end
	            timerBar:SetMinMaxValues(0, 36);
	            timeLeft = 36
				showBar()
			elseif k == "谦逊暮钟已被敲响！" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\1谦逊暮钟.ogg", "Master")
				msg:AddMessage("▇▇▇▇谦逊暮钟▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■|r|cffffff00|Hworldmap:1533:7190:3894|h[谦逊暮钟]|h|r|cffff80ff■■■|r".."→|cff00ccff["..players.."]|r|cff99ff00 敲钟。|r")
				else
					local Marker = "|cffffff00|Hworldmap:1533:7190:3894|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("谦逊暮钟"..Marker.."→["..players.."] 敲钟。", ChannelSet(Warning))
				end
			elseif k == "勇气暮钟已被敲响！" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\2勇气暮钟.ogg", "Master")
				msg:AddMessage("▇▇▇▇勇气暮钟▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■|r|cffffff00|Hworldmap:1533:3342:5964|h[勇气暮钟]|h|r|cffff80ff■■■|r".."→|cff00ccff["..players.."]|r|cff99ff00 敲钟。|r")
				else
					local Marker = "|cffffff00|Hworldmap:1533:3342:5964|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("勇气暮钟"..Marker.."→["..players.."] 敲钟。", ChannelSet(Warning))
				end
			elseif k == "纯洁暮钟已被敲响！" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\3纯洁暮钟.ogg", "Master")
				msg:AddMessage("▇▇▇▇纯洁暮钟▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■|r|cffffff00|Hworldmap:1533:6431:6997|h[纯洁暮钟]|h|r|cffff80ff■■■|r".."→|cff00ccff["..players.."]|r|cff99ff00 敲钟。|r")
				else
					local Marker = "|cffffff00|Hworldmap:1533:6431:6997|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("纯洁暮钟"..Marker.."→["..players.."] 敲钟。", ChannelSet(Warning))
				end
			elseif k == "智慧暮钟已被敲响！" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\4智慧暮钟.ogg", "Master")
				msg:AddMessage("▇▇▇▇智慧暮钟▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■|r|cffffff00|Hworldmap:1533:3915:2037|h[智慧暮钟]|h|r|cffff80ff■■■|r".."→|cff00ccff["..players.."]|r|cff99ff00 敲钟。|r")
				else
					local Marker = "|cffffff00|Hworldmap:1533:3915:2037|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("智慧暮钟"..Marker.."→["..players.."] 敲钟。", ChannelSet(Warning))
				end
			elseif k == "忠诚暮钟已被敲响！" then
				PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\5忠诚暮钟.ogg", "Master")
				msg:AddMessage("▇▇▇▇忠诚暮钟▇▇▇▇", 1, 0, 0)
				if ChannelSet(Warning) == "SAY" then
	        		print("|cffff80ff■■■|r|cffffff00|Hworldmap:1533:3216:1788|h[忠诚暮钟]|h|r|cffff80ff■■■|r".."→|cff00ccff["..players.."]|r|cff99ff00 敲钟。|r")
				else
					local Marker = "|cffffff00|Hworldmap:1533:3216:1788|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					SendChatMessage("忠诚暮钟"..Marker.."→["..players.."] 敲钟。", ChannelSet(Warning))
				end	
			elseif k == "晋升者议会已经集结！" then
				do
			    	function timer60()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\6战斗1分钟后开始.ogg", "Master")
						msg:AddMessage("敲钟BOSS，战斗1分钟后开始。", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→敲钟BOSS，战斗1分钟后开始。|r")
						else
							SendChatMessage("→敲钟BOSS，战斗1分钟后开始。", ChannelSet(Warning))
						end
					end
			    	function timer30()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\7战斗30秒后开始.ogg", "Master")
						msg:AddMessage("敲钟BOSS，战斗30秒后开始。", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→敲钟BOSS，战斗30秒后开始。|r")
						else
							SendChatMessage("→敲钟BOSS，战斗30秒后开始。", ChannelSet(Warning))
						end
					end
			    	function timer20()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\8战斗20秒后开始.ogg", "Master")
						msg:AddMessage("敲钟BOSS，战斗20秒后开始。", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→敲钟BOSS，战斗20秒后开始。|r")
						else
							SendChatMessage("→敲钟BOSS，战斗20秒后开始。", ChannelSet(Warning))
						end
					end
			    	function timer10()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\9战斗10秒后开始.ogg", "Master")
						msg:AddMessage("敲钟BOSS，战斗10秒后开始。", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→敲钟BOSS，战斗10秒后开始。|r")
						else
							SendChatMessage("→敲钟BOSS，战斗10秒后开始。", ChannelSet(Warning))
						end
					end
			    	function timer5()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\10战斗5.ogg", "Master")
						msg:AddMessage("5", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→5|r")
						else
							SendChatMessage("→5", ChannelSet(Warning))
						end
					end
			    	function timer4()
					    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\11战斗4.ogg", "Master")
						msg:AddMessage("4", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→4|r")
						else
							SendChatMessage("→4", ChannelSet(Warning))
						end
					end
			    	function timer3()
					    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\12战斗3.ogg", "Master")
						msg:AddMessage("3", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→3|r")
						else
							SendChatMessage("→3", ChannelSet(Warning))
						end
					end
			    	function timer2()
					    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\13战斗2.ogg", "Master")
						msg:AddMessage("2", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→2|r")
						else
							SendChatMessage("→2", ChannelSet(Warning))
						end
					end
			    	function timer1()
					    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\14战斗1.ogg", "Master")
						msg:AddMessage("1", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→1|r")
						else
							SendChatMessage("→1", ChannelSet(Warning))
						end
					end
			    	function timer0()
						PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\15战斗开始.ogg", "Master")
						msg:AddMessage("战斗开始！", 1, 0, 0)
						if ChannelSet(Warning) == "SAY" then
	        				print("|cffff80ff→战斗开始！|r")
						else
							SendChatMessage("→战斗开始！", ChannelSet(Warning))
						end
					end
			    	C_Timer.After(2, timer60)
					C_Timer.After(30,timer30)
					C_Timer.After(40,timer20)
					C_Timer.After(50,timer10)
					C_Timer.After(55,timer5)
					C_Timer.After(56,timer4)
					C_Timer.After(57,timer3)
					C_Timer.After(58,timer2)
					C_Timer.After(59,timer1)
					C_Timer.After(60,timer0)
				end
				
			elseif k == "裂隙闯入了刻希亚" then
			    if name == "尖叫影魔" then
				    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\尖叫影魔.ogg", "Master")
					msg:AddMessage("▇▇▇▇尖叫影魔 中间▇▇▇▇", 1, 0, 0)
				    if ChannelSet(Warning) == "SAY" then
	        		    print("|cffff80ff■■■尖叫影魔 中间■■■|r".." |cffffff00|Hworldmap:1961:4400:4200|h[位置]|h|r")
				    else
					    local Marker = " |cffffff00|Hworldmap:1961:4400:4200|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					    SendChatMessage("■■■尖叫影魔刷了，中间■■■"..Marker, ChannelSet(Warning))
				    end  
				end
			    if name == "沉默的猎魂者" then
				    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\猎魂者.ogg", "Master")
					msg:AddMessage("▇▇▇猎魂者眼睛稀有 岛上▇▇▇", 1, 0, 0)
				    if ChannelSet(Warning) == "SAY" then
	        		    print("|cffff80ff■■■猎魂者眼睛稀有 岛上■■■|r".." |cffffff00|Hworldmap:1961:5700:7000|h[位置]|h|r")
				    else
					    local Marker = " |cffffff00|Hworldmap:1961:5700:7000|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					    SendChatMessage("■■■猎魂者眼睛稀有刷了，岛上■■■"..Marker, ChannelSet(Warning))
				    end   
			    end
			    if name == "丧魂孵化者" then
				    PlaySoundFile("Interface\\AddOns\\zZ_ChatJK\\Sound\\丧魂孵化者.ogg", "Master")
					msg:AddMessage("▇▇▇▇丧魂孵化者 右边▇▇▇▇", 1, 0, 0)
				    if ChannelSet(Warning) == "SAY" then
	        		    print("|cffff80ff■■■丧魂孵化者 右边■■■|r".." |cffffff00|Hworldmap:1961:5900:5200|h[位置]|h|r")
				    else
					    local Marker = " |cffffff00|Hworldmap:1961:5900:5200|h[|A:Waypoint-MapPin-ChatIcon:13:13:0:0|a 地图标记位置]|h|r"
					    SendChatMessage("■■■丧魂孵化者刷了，右边■■■"..Marker, ChannelSet(Warning))
				    end  
				end
        	end
			if k == "谦逊暮钟已被敲响！" or k == "勇气暮钟已被敲响！" or k == "纯洁暮钟已被敲响！" or k == "智慧暮钟已被敲响！" or k == "忠诚暮钟已被敲响！" or k == "晋升者议会已经集结！" then 
			    local function ks()
					timerBar:SetMinMaxValues(0, 300);
					timeLeft = 300
    				showBar()
				end
			   if k == "晋升者议会已经集结！" then timeLeft = 0 end;
	           if timerBar:IsShown() then return end;
			   C_Timer.After(0, ks)
            end		
		end
    end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_SAY", ko)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_YELL", ko)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", ko)