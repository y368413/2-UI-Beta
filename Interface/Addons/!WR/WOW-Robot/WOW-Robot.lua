--作者微信:WOW-Robot(转载请保留,感谢!)

--测试玩家名称
TestPlayerName={
	[1]="佳爷",
	[2]="佳爺",
	[3]="佳总",
	[4]="佳總",
	[5]="佳哥",
	[6]="義父",
	[7]="瑶妹",
	[8]="玩偶姐姐",
	[9]="佳佳不是熊貓",
	[10]="佳宝",
	[11]="佳大",
	[12]="这逼我装定了",
	[13]="Pla",
	[14]="Prc",
	[15]="Dkjiajia",
	[16]="Lrjiajia",
	[17]="Fsjiajia",
	[18]="Zsjiajia",
	[19]="艾莱梅克拉夫",
	[19]="佳佳骑士",
	[20]="佳佳不是熊猫",
	[21]="有钱终成眷属",
	[22]="艾莱梅克拉夫",
	[23]="Smjiajia",
	[24]="佳佳萨",
	[25]="佳佳牧",
	[26]="因为我是天才",
	[27]="佳法",
}

local frame = CreateFrame("Frame", "WOW-Robot")
--frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnUpdate", function(self, elapsed)
	if C_AddOns and C_AddOns.IsAddOnLoaded("Scorpio") and (WR_ScorpioTime==nil or GetTime()-WR_ScorpioTime>5) then
		print("|cfffcc419佳佳提醒您：|cffff5040Scorpio|r插件|cff00adf0冲突|r，请|cff00adf0禁用|r或|cff00adf0删除|r|cffff5040Scorpio|r插件。|r")
		WR_ScorpioTime = GetTime()
	end
	if WR_StopTime==nil or GetTime()-WR_StopTime>0.3 then
	
		WR_StopTime=nil
		if WR_LastTime==nil then WR_LastTime=GetTime() end

		if UnitClassBase("player")=="MAGE" and GetTime()-WR_LastTime>0.01 then
			WR_Mage()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="HUNTER" and GetTime()-WR_LastTime>0.1 then
			WR_Hunter()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="ROGUE" and GetTime()-WR_LastTime>0.1 then
			WR_Rogue()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="SHAMAN" and GetTime()-WR_LastTime>0.1 then
			WR_Shaman()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="WARRIOR" and GetTime()-WR_LastTime>0.1 then
			WR_Warrior()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="EVOKER" and GetTime()-WR_LastTime>0.1 then
			--WR_Evoker()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="WARLOCK" and GetTime()-WR_LastTime>0.1 then
			--WR_Warlock()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="DEATHKNIGHT" and GetTime()-WR_LastTime>0.1 then
			WR_DeathKnight()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="PRIEST" and GetTime()-WR_LastTime>0.2 then
			WR_Priest()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="MONK" and GetTime()-WR_LastTime>0.2 then
			WR_Monk()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="PALADIN"
		and
		(
			( WR_FastPass and GetTime()-WR_LastTime>0.1 )	--快速通过
			or
			( GetSpecialization()~=1 and GetTime()-WR_LastTime>0.1 )	--非奶骑
			or
			( GetSpecialization()==1 and GetTime()-WR_LastTime>0.25 and WR_GetInRaidOrParty()=="raid")	--奶骑 在团本
			or
			( GetSpecialization()==1 and GetTime()-WR_LastTime>0.15 and WR_GetInRaidOrParty()~="raid")	--奶骑 不在团本
		)
		then
			WR_Paladin()
			WR_LastTime=GetTime()
		elseif UnitClassBase("player")=="DRUID"
		and
		(
			( WR_FastPass and GetTime()-WR_LastTime>0.1 )	--快速通过
			or
			( GetSpecialization()~=4 and GetTime()-WR_LastTime>0.1 )	--非奶德
			or
			( GetSpecialization()==4 and GetTime()-WR_LastTime>0.25 and WR_GetInRaidOrParty()=="raid")	--奶德 在团本
			or
			( GetSpecialization()==4 and GetTime()-WR_LastTime>0.15 and WR_GetInRaidOrParty()~="raid")	--奶德 不在团本
		)
		then
			WR_Druid()
			WR_LastTime=GetTime()
		end
		
		if PlayerInfo and WR_TempInfo==nil then
			WR_TempInfo = ""
			for i = 1, #PlayerInfo do
				WR_TempInfo = WR_TempInfo .. string.byte(PlayerInfo, i)
			end
			WR_UnitInfo=string.find(WR_TempInfo, ZLSInfo)
		end
		
		for _, TempPlayerName in ipairs(TestPlayerName) do
			if UnitName("player")==TempPlayerName then
				WR_EventNotifications()	--各类事件通知
				if WR_TestCheckbox~=nil then
					WR_TestCheckbox:SetChecked("true")
				end
				break
			end
		end
		
		WR_HidePlayerNotFound()	--过滤玩家未找到的错误信息
		
		if WR_TestCheckbox~=nil and WR_TestCheckbox:GetChecked()==true then
			WR_MaxColorFrame() --最大化所有色块窗体
		else
			WR_MinColorFrame() --最小化所有色块窗体
		end
		
	end
end)

function WR_STOP()
	WR_StopTime=GetTime()
	WR_HideColorFrame(0) --隐藏左上色块窗体
	WR_HideColorFrame(1) --隐藏右上色块窗体
end