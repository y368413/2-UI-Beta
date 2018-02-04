-----------------------------------------------------------------------------------------
--------- Isle of Thunder Weekly Check---------------------------------------------------
-- by Fluffies
-- EU-Well of Eternity
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local ldbicon = ldb and LibStub("LibDBIcon-1.0", true)

local chest_icon = "|TInterface\\Icons\\Trade_Archaeology_ChestofTinyGlassAnimals:12|t "
local rare_icon = "|TInterface\\Icons\\Achievement_Boss_Archaedas:12|t "
local quest_icon = "|TInterface\\CURSOR\\QUEST:12|t "

local rare_name = EXAMPLE_TARGET_MONSTER.." ("..ITEM_QUALITY3_DESC..")"

-- string colors
local LIGHT_RED   = "|cffFF2020"
local LIGHT_GREEN = "|cff20FF20"
local LIGHT_BLUE  = "|cff00ddFF"
local ZONE_BLUE   = "|cff00aacc"
local GREY        = "|cff999999"
local COORD_GREY  = "|cffBBBBBB"
local GOLD        = "|cffffcc00"
local WHITE       = "|cffffffff"
local PINK        = "|cffFFaaaa"
local function AddColor(str,color) return color..(str or " ^-^ ").."|r" end

local function completedstring(arg)
 if IsQuestFlaggedCompleted(arg) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end

-------------------------------------------------------------
 		local bonus = {
			43892, 43893, 43894,	--Order Resources
			43895, 43896, 43897,	--Gold
			43510,					--Orderhall 
		}
		local count = 0
		for _, id in pairs(bonus) do
			if IsQuestFlaggedCompleted(id) then
				count = count + 1
			end
		end
local function CheckCurrency()
		if count < 3 then
		  return AddColor(count.." / 3",LIGHT_RED)
		elseif count >= 3 then
			return AddColor(count.." / 3",LIGHT_GREEN)
		end
end
local function TimeTravelFB()
 if IsQuestFlaggedCompleted(40168) or IsQuestFlaggedCompleted(40173) or IsQuestFlaggedCompleted(40786) or IsQuestFlaggedCompleted(45799) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end
local function GarrisonInvade()
 if IsQuestFlaggedCompleted(37638) or IsQuestFlaggedCompleted(37639) or IsQuestFlaggedCompleted(37640) or IsQuestFlaggedCompleted(38482) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end
local function LegionWolrdBoss()
 if IsQuestFlaggedCompleted(42270) or IsQuestFlaggedCompleted(42269) or IsQuestFlaggedCompleted(42779) or IsQuestFlaggedCompleted(43192) or IsQuestFlaggedCompleted(42819) or IsQuestFlaggedCompleted(43193) or IsQuestFlaggedCompleted(43513) or IsQuestFlaggedCompleted(43448) or IsQuestFlaggedCompleted(43512) or IsQuestFlaggedCompleted(43985) or IsQuestFlaggedCompleted(44287) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end
local function TombWolrdBoss()
 if IsQuestFlaggedCompleted(46947) or IsQuestFlaggedCompleted(46948) or IsQuestFlaggedCompleted(46945) or IsQuestFlaggedCompleted(47061) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end
local function ArgusWolrdBoss()
 if IsQuestFlaggedCompleted(38276) or IsQuestFlaggedCompleted(47461) or IsQuestFlaggedCompleted(47462) or IsQuestFlaggedCompleted(47463) then return AddColor(COMPLETE,LIGHT_GREEN)
 else return AddColor(INCOMPLETE,LIGHT_RED) end
end

 	-------------------------------------------------------------
local function DrawMainframe(frame, istooltip)
-- title  --select(8,GetAchievementInfo(xxx) or GetAchievementCriteriaInfo(8105,1) or 
 frame:ClearLines()
 frame:AddDoubleLine("查看下哪些还没完成呦~","|T".."Interface\\Addons\\_ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI"..":32|t")
 frame:AddLine(" ")
 frame:AddDoubleLine(quest_icon..AddColor("[|cffFFaaaa"..GetCurrencyInfo(1273).."|r] ",GOLD), CheckCurrency())
 frame:AddDoubleLine(quest_icon..AddColor(GetItemInfo(138019),LIGHT_BLUE), completedstring(44554))            --史诗钥石
 frame:AddDoubleLine(quest_icon..AddColor(GARRISON_LANDING_INVASION,LIGHT_BLUE), GarrisonInvade())
 frame:AddDoubleLine(quest_icon..AddColor(PLAYER_DIFFICULTY_TIMEWALKER,LIGHT_BLUE), TimeTravelFB())   --TBC--WLK--CTM 
 --frame:AddDoubleLine(quest_icon..AddColor(GetCurrencyInfo(1149),LIGHT_BLUE), completedstring(43478))  --盲目之眼
 frame:AddDoubleLine(quest_icon..AddColor(GetItemInfo(111821),LIGHT_BLUE), completedstring(34774))            --布林顿
 frame:AddLine(" ")
 frame:AddDoubleLine(rare_icon..AddColor("Legion  1/11 ",PINK), LegionWolrdBoss())
 frame:AddDoubleLine(rare_icon..AddColor("Tomb  1/4 ",PINK), TombWolrdBoss())
 frame:AddDoubleLine(rare_icon..AddColor("Argus  1/4 ",PINK), ArgusWolrdBoss())
 frame:AddDoubleLine(rare_icon..AddColor("WOD-暗影领主艾斯卡|cffffddFF(死爪)|r",ZONE_BLUE), completedstring(39287))
 frame:AddDoubleLine(rare_icon..AddColor("WOD-游侠将军|cffffddFF(泰罗菲斯特)|r",ZONE_BLUE), completedstring(39288))
 frame:AddDoubleLine(rare_icon..AddColor("WOD-攻城大师玛塔克|cffffddFF(末日之轮)|r",ZONE_BLUE), completedstring(39289))
 frame:AddDoubleLine(rare_icon..AddColor("WOD-暴君维哈里|cffffddFF(维金斯)|r",ZONE_BLUE), completedstring(39290)) 
 frame:AddDoubleLine(rare_icon..AddColor("WOD-鲁克玛",ZONE_BLUE), completedstring(37464)) 
 frame:AddDoubleLine(rare_icon..AddColor("MOP-怒之煞",ZONE_BLUE), completedstring(32099))
 frame:AddDoubleLine(rare_icon..AddColor("MOP-炮舰",ZONE_BLUE), completedstring(32098))
 frame:AddDoubleLine(rare_icon..AddColor("MOP-纳拉克",ZONE_BLUE), completedstring(32518))
 frame:AddDoubleLine(rare_icon..AddColor("MOP-乌达斯塔",ZONE_BLUE), completedstring(32519))
 frame:AddLine(" ")
 frame:AddLine(chest_icon..AddColor(BOSS_DEAD,GOLD))
for i = 1, GetNumSavedInstances() do
	local name, id, _, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, level, total, progress = GetSavedInstanceInfo(i)
	frame:AddDoubleLine(AddColor(name.."("..level..")",WHITE), locked and AddColor(progress.."/"..total, LIGHT_GREEN) or AddColor("已过期", LIGHT_RED))
end
 if not istooltip then frame:AddLine(" ") frame:AddLine(" ") end
end
-------------------------------------------------------------------------------------------------------------------------
local ldbset = false
local eventframe = CreateFrame("FRAME","WIEventFrame")
eventframe:RegisterEvent("VARIABLES_LOADED")
eventframe:RegisterEvent("GET_ITEM_INFO_RECEIVED")
eventframe:RegisterEvent("QUEST_LOG_UPDATE")
eventframe:RegisterEvent("UPDATE_INSTANCE_INFO")
--eventframe:RegisterEvent("CURRENCY_DISPLAY_UPDATE") 
local function eventhandler(self, event, ...)
 if event == "QUEST_LOG_UPDATE" then
  local i, s
  for i = 1, GetNumQuestLogEntries() do
   s = GetQuestLink(i)
   if s ~= nil then
    s = string.match(s, "Hquest:(%d+)");
   end
  end
 --elseif event == "CURRENCY_DISPLAY_UPDATE" then
   --_, bonusname = GetCurrencyInfo(1129)
 elseif event == "VARIABLES_LOADED" then
  if WeeklyItems_Options == nil then
   WeeklyItems_Options = {}
  end
  if WeeklyItems_Options["minimap_icon"] == nil then
    WeeklyItems_Options["minimap_icon"] = {
        hide = false,
        --minimapPos = 220,
    }
  end

  if ldb and not ldbset then
   local WeeklyCheck = ldb:NewDataObject("WeeklyCheck", {
	--type = "data source",
	icon = "Interface\\Addons\\_ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI",
	--label = "Weekly Check",
OnClick = function(self,button)
  --if button == "LeftButton" then 
  --PlaySound(PlaySoundKitID and "igSpellBookOpen");
  sendCmd("/mr");
  --elseif button == "RightButton" then
  --securecall(L_EasyMenu, SetMrMicromenu, SetMrMenuFrame, "cursor", 0, 0, 'MENU', 2)
  --end
  end,
	OnTooltipShow = function(tooltip)
		 DrawMainframe(tooltip,true)
	end,
   })
   if ldbicon then
    ldbicon:Register("WeeklyCheck", WeeklyCheck, WeeklyItems_Options["minimap_icon"])
   end
   ldbset = true
  end -- variables_loaded
 end
end
eventframe:SetScript("OnEvent", eventhandler);