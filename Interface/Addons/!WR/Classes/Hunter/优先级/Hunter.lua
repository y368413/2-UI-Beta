--作者微信:WOW-Robot(转载请保留,感谢!)

--猎人
function WR_Hunter()
	WR_HunterSettings() --初始化储存值
	WR_HunterConfigFrame()	--创建的设置窗口
	WR_HunterSettingsSave() --设置写入
	WR_HunterFrameShowOrHide()	--对应专精显示或隐藏
	WR_HunterBeastMastery() --兽王运行库
	WR_HunterSurvival() --生存运行库
end

--初始化猎人储存值
function WR_HunterSettings()
	if WRSet==nil then
		local Settings = {
			SW_ZNMB=1,	--智能目标
			SW_ZNJD=9,	--智能焦点
			SW_DuochongSJ=1,	--多重射击
			SW_HYDZH=1,	--荒野的召唤
			SW_FZSJ=1,		--反制射击
			SW_DDMS=1,	--打断模式
			SW_JS=1,			--假死
			SW_XP=1,			--胁迫
			SW_NSSJ=1,	--宁神射击
			SW_CW=1,	--宠物
			SW_YQFF=5,		--意气风发
			SW_ZLS=3,		--治疗石
			SW_ZLYS=2,	--治疗药水
			SW_SP1=13,	--饰品1
			SW_SP2=13,	--饰品2
			
			SC_ZNMB=1,	--智能目标
			SC_ZNJD=9,	--智能焦点
			SC_YZ=1,	--压制
			SC_DDMS=1,	--打断模式
			SC_JS=1,	--假死
			SC_XP=1,	--胁迫
			SC_NSSJ=1,	--宁神射击
			SC_CW=1,	--宠物
			SC_YQFF=5,	--意气风发
			SC_ZLS=3,	--治疗石
			SC_ZLYS=2,	--治疗药水
			SC_SP1=13,	--饰品1
			SC_SP2=13,	--饰品2
		}
		WRSet=Settings
	end
end


--兽王设置写入
function WR_HunterSettingsSave()
	if WRSet~=nil then
		WRSet.SW_ZNMB=UIDropDownMenu_GetSelectedID(SW_ZNMB_Dropdown) --智能目标
		WRSet.SW_ZNJD=UIDropDownMenu_GetSelectedID(SW_ZNJD_Dropdown) --智能焦点
		WRSet.SW_DuochongSJ=UIDropDownMenu_GetSelectedID(SW_DuochongSJ_Dropdown) --多重射击
		WRSet.SW_HYDZH=UIDropDownMenu_GetSelectedID(SW_HYDZH_Dropdown) --荒野的召唤
		WRSet.SW_FZSJ=UIDropDownMenu_GetSelectedID(SW_FZSJ_Dropdown) --反制射击
		WRSet.SW_DDMS=UIDropDownMenu_GetSelectedID(SW_DDMS_Dropdown) --打断模式
		WRSet.SW_DCSJ=UIDropDownMenu_GetSelectedID(SW_DCSJ_Dropdown) --倒刺射击
		WRSet.SW_JS=UIDropDownMenu_GetSelectedID(SW_JS_Dropdown) --假死
		WRSet.SW_XP=UIDropDownMenu_GetSelectedID(SW_XP_Dropdown) --胁迫
		WRSet.SW_NSSJ=UIDropDownMenu_GetSelectedID(SW_NSSJ_Dropdown) --宁神射击
		WRSet.SW_CW=UIDropDownMenu_GetSelectedID(SW_CW_Dropdown) --宠物
		WRSet.SW_YQFF=UIDropDownMenu_GetSelectedID(SW_YQFF_Dropdown) --意气风发
		WRSet.SW_ZLS=UIDropDownMenu_GetSelectedID(SW_ZLS_Dropdown) --治疗石
		WRSet.SW_ZLYS=UIDropDownMenu_GetSelectedID(SW_ZLYS_Dropdown) --治疗药水
		WRSet.SW_WD=UIDropDownMenu_GetSelectedID(SW_WD_Dropdown) --误导
		WRSet.SW_LRYJ=UIDropDownMenu_GetSelectedID(SW_LRYJ_Dropdown) --猎人印记
		WRSet.SW_SP1=UIDropDownMenu_GetSelectedID(SW_SP1_Dropdown) --饰品1
		WRSet.SW_SP2=UIDropDownMenu_GetSelectedID(SW_SP2_Dropdown) --饰品2
		
		WRSet.SC_ZNMB=UIDropDownMenu_GetSelectedID(SC_ZNMB_Dropdown) --智能目标
		WRSet.SC_ZNJD=UIDropDownMenu_GetSelectedID(SC_ZNJD_Dropdown) --智能焦点
		WRSet.SC_YZ=UIDropDownMenu_GetSelectedID(SC_YZ_Dropdown) --压制
		WRSet.SC_DDMS=UIDropDownMenu_GetSelectedID(SC_DDMS_Dropdown) --打断模式
		WRSet.SC_JS=UIDropDownMenu_GetSelectedID(SC_JS_Dropdown) --假死
		WRSet.SC_XP=UIDropDownMenu_GetSelectedID(SC_XP_Dropdown) --胁迫
		WRSet.SC_NSSJ=UIDropDownMenu_GetSelectedID(SC_NSSJ_Dropdown) --宁神射击
		WRSet.SC_CW=UIDropDownMenu_GetSelectedID(SC_CW_Dropdown) --宠物
		WRSet.SC_YQFF=UIDropDownMenu_GetSelectedID(SC_YQFF_Dropdown) --意气风发
		WRSet.SC_ZLS=UIDropDownMenu_GetSelectedID(SC_ZLS_Dropdown) --治疗石
		WRSet.SC_ZLYS=UIDropDownMenu_GetSelectedID(SC_ZLYS_Dropdown) --治疗药水
		WRSet.SC_WD=UIDropDownMenu_GetSelectedID(SC_WD_Dropdown) --误导
		WRSet.SC_LRYJ=UIDropDownMenu_GetSelectedID(SC_LRYJ_Dropdown) --猎人印记
		WRSet.SC_SP1=UIDropDownMenu_GetSelectedID(SC_SP1_Dropdown) --饰品1
		WRSet.SC_SP2=UIDropDownMenu_GetSelectedID(SC_SP2_Dropdown) --饰品2
	end
	if GetSpecialization()==1 then	--兽王专精
		if WRSet.SW_DDMS~=nil then
			InterruptTime=(WRSet.SW_DDMS-1)/10
		end
	end
	if GetSpecialization()==3 then	--生存专精
		if WRSet.SC_DDMS~=nil then
			InterruptTime=(WRSet.SC_DDMS-1)/10
		end
	end

end

--对应专精显示或隐藏
function WR_HunterFrameShowOrHide()
	if GetSpecialization()==1 then	--野兽 专精
		SW_Frame:Show()
		SC_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+17*35)
	end
	if GetSpecialization()==2 then	--射击 专精
		SW_Frame:Hide()
		SC_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+0*35)
	end
	if GetSpecialization()==3 then	--生存 专精
		SW_Frame:Hide()
		SC_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+14*35)
	end
end

--战斗错误事件
function WR_Hunter_ErrorMessage()
	--杀戮命令的错误事件
	local SLML_ErrorMessage={
	[1]="你的宠物离目标距离太远了",
	[2]="在冻结状态下无法攻击",
	[3]="在逃跑状态下无法攻击",
	[4]="距离太远",
	[5]="无法在昏迷状态下攻击",
	[6]="在昏迷状态下无法攻击",
	[7]="无路径可供你的宠物使用",
	[8]="无法在昏迷时那样做",
	[9]="你还不能这么做",
	[10]="没有可以行进的路径",
	[11]="你无法移动",
	[12]="不能在昏迷状态实施该动作",
	}
	local PetIsDead_ErrorMessage={
	[1]="请使用复活宠物",
	[2]="你不能在死亡状态的时候攻击",
	[3]="你的宠物已经死亡",
	}
	
	if WR_ErrorMessageInfo~=true then --只执行一次
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("UI_ERROR_MESSAGE")
		frame:SetScript("OnEvent", function(self, event, messageType, message)
			if string.find(message, "你无法召唤宠物") then
				ErrorMessageTime_ZHCW=GetTime()
				return
			end
			if string.find(message, "目标不在视野中") then
				ErrorMessageTime_OutOfSight=GetTime()
				return
			end
			for _, ErrorMessage in ipairs(SLML_ErrorMessage) do
				if string.find(message, ErrorMessage) then
					ErrorMessageTime_SLML=GetTime()
					return
				end
			end
			for _, ErrorMessage in ipairs(PetIsDead_ErrorMessage) do
				if string.find(message, ErrorMessage) then
					ErrorMessageTime_PetIsDead=GetTime()
					return
				end
			end

		end)
		WR_ErrorMessageInfo=true --只执行一次，记录已经执行
	end
end
--[[
--查找坦克
function WR_Hunter_FindTank()
	if UnitAffectingCombat("player") then return end	--单位战斗中
	
	for i=1,4,1 do 
		local TempUnit="party"..i
		if UnitExists(TempUnit)	--单位存在
		and not UnitIsDead(TempUnit)	--单位存活
		and UnitGroupRolesAssigned(TempUnit)=="TANK"	--单位是坦克
		then
			return TempUnit
		end
	end

	if UnitExists("pet") and not UnitIsDead("pet") then	--单位存活
		return "pet"
	end

	return nil
end
--]]
--施法过程 假死
function WR_Hunter_Function_JS()
	local Temp_JS=2
	if GetSpecialization()==1 then
		Temp_JS=WRSet.SW_JS
	elseif GetSpecialization()==3 then
		Temp_JS=WRSet.SC_JS
	end
	
	if Temp_JS==1	--假死 开启
	and not WR_PlayerMove()	--没有移动
	and UnitAffectingCombat("player")	--玩家在战斗中
	and
	(
		WR_GetUnitDebuffTime("player",EscapeDebuffName)>0	--身上有需要假死的Debuff
		or
		WR_GetRangeSpellTime(45,EscapeSpellName,true)<1.5	--对我施法<=1.5秒
	)
	then
		if WR_ColorFrame_Show("CF10","假死") then return true end
	end
	return false
end

--施法过程 意气风发
function WR_Hunter_Function_YQFF(Text)
	local Temp_YQFF=8
	if GetSpecialization()==1 then
		Temp_YQFF=WRSet.SW_YQFF
	elseif GetSpecialization()==3 then
		Temp_YQFF=WRSet.SC_YQFF
	end
	
	if Temp_YQFF~=8	--意气风发选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_YQFF/10	--血量比例<意气风发设定值/10
	and WR_SpellUsable("意气风发")	--技能可用 资源可用
	and GCD<=ShiFaSuDu then	--公共冷却时间<=施法速度
		if WR_ColorFrame_Show("CF11","意气风发") then return true end
	end
	return false
end

--施法过程 治疗石
function WR_Hunter_Function_ZLS()
	local Temp_ZLS=5
	if GetSpecialization()==1 then
		Temp_ZLS=WRSet.SW_ZLS
	elseif GetSpecialization()==3 then
		Temp_ZLS=WRSet.SC_ZLS
	end
	
	if Temp_ZLS~=5	--治疗石选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLS/10	--血量比例<治疗石设定值/10
	and WR_Use_ZLS() then	--治疗石 可用
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--施法过程 治疗药水
function WR_Hunter_Function_ZLYS()
	local Temp_ZLYS=0
	if GetSpecialization()==1 then
		Temp_ZLYS=WRSet.SW_ZLYS
	elseif GetSpecialization()==3 then
		Temp_ZLYS=WRSet.SC_ZLYS
	end
	
	if Temp_ZLYS~=5	--治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10	--血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then	--治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--施法过程 唤醒
function WR_Hunter_Function_HX()
	if WR_GetUnitBuffTime("pet","装死")>0 then	--宠物的装死BUFF存在
		if WR_ColorFrame_Show("CF12","唤醒") then return true end
	end
	return false
end

--施法过程 复活宠物
function WR_Hunter_Function_FHCW()
	if ( UnitIsDead("pet") or (ErrorMessageTime_PetIsDead~=nil and GetTime()-ErrorMessageTime_PetIsDead<2) )
	--		宠物死亡       或 (      宠物死亡错误出现           且        宠物死亡错误出现时间<2秒         )
	and UnitCastingInfo("player")~="复活宠物" --没有在施法复活宠物
	then
		if WR_ColorFrame_Show("SF6","复活宠物") then return true end
	end
	return false
end

--施法过程 治疗宠物
function WR_Hunter_Function_ZLCW(Text)
	if C_Spell.IsSpellInRange("治疗宠物","pet") --当前目标是否在技能范围内
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and not UnitIsDead("pet") --宠物没有死亡
	and UnitHealthMax("pet")~=0
	and UnitHealth("pet")/UnitHealthMax("pet")<0.80
	then
		if Text==nil then
			if WR_ColorFrame_Show("SF7","治疗宠物") then return true end
		elseif Text=="20%" and UnitHealth("pet")/UnitHealthMax("pet")<0.20 then
			if WR_ColorFrame_Show("SF7","20%治宠") then return true end
		end
	end
	return false
end
	
--施法过程 召唤宠物
function WR_Hunter_Function_ZHCW()
	local Temp_CW=0
	if GetSpecialization()==1 then
		Temp_CW=WRSet.SW_CW
	elseif GetSpecialization()==3 then
		Temp_CW=WRSet.SC_CW
	end
	
	if not UnitExists("pet") then	--单位不存在
		if ( Temp_CW==1 or ( ErrorMessageTime_ZHSC_CW~=nil and GetTime()-ErrorMessageTime_ZHSC_CW<1 ) ) then
		--   召唤宠物1   或 (     召唤宠物错误存在        且       召唤宠物错误时间<1秒        )
			if WR_ColorFrame_Show("SF1","召唤宠物1") then return true end
		elseif Temp_CW==2 then	--召唤宠物2
			if WR_ColorFrame_Show("SF2","召唤宠物2") then return true end
		elseif Temp_CW==3 then	--召唤宠物3
			if WR_ColorFrame_Show("SF3","召唤宠物3") then return true end
		elseif Temp_CW==4 then	--召唤宠物4
			if WR_ColorFrame_Show("SF4","召唤宠物4") then return true end
		elseif Temp_CW==5 then	--召唤宠物5
			if WR_ColorFrame_Show("SF5","召唤宠物5") then return true end
		end
	end
	return false
end




--误导
function WR_Hunter_WD(Unit)
	if UnitExists(Unit)	--单位存在
	and not UnitIsDead(Unit)	--单位存活
	and C_Spell.IsSpellInRange("误导",Unit)	--技能距离范围内
	then
		if Unit=="focus" and not UnitIsUnit("focus","player") then
			if WR_ColorFrame_Show("AN5","误导F") then return true end
		end
		
		if UnitGroupRolesAssigned(Unit)=="TANK" then	--单位是坦克
			if Unit=="party1" then
				if WR_ColorFrame_Show("AN1","误导P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("AN2","误导P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("AN3","误导P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("AN4","误导P4") then return true end
			end
		end

		if Unit=="pet" then
			if WR_ColorFrame_Show("AN6","误导Pet") then return true end
		end
	end
	return false
end

--施法过程 误导
function WR_Hunter_Function_WD()
	local Temp_WD=0
	if GetSpecialization()==1 then
		Temp_WD=WRSet.SW_WD
	elseif GetSpecialization()==3 then
		Temp_WD=WRSet.SC_WD
	end
	
	if not WR_SpellUsable("误导") then
		WR_CanCast_WD=false
	end
	if not WR_PartyInCombat() and WR_SpellUsable("误导") then
		WR_CanCast_WD=true
	end
	
	if Temp_WD==1	--误导开启
	and WR_CanCast_WD	--每次战斗只误导一次
	and ( ErrorMessageTime_OutOfSight==nil or GetTime()-ErrorMessageTime_OutOfSight>2 )	--        目标不在视野错误不存在       或 目标不在视野错误出现时间超过2秒
	and WR_SpellUsable("误导")	--技能可用 资源可用
	and not WR_InTraining()	--不是打木桩
	and WR_PartyInCombat()	--队伍有人在战斗
	and ( WR_GetRangeAvgDeathTime(40)>30 or not UnitAffectingCombat("player") )	--战斗时间>30 或者 自己没有进入战斗
	then
		if WR_Hunter_WD("focus") then return true end
		for i=1,4,1 do 
			if WR_Hunter_WD("party"..i) then return true end
		end
		if WR_Hunter_WD("pet") then return true end
	end
	return false
end

--施法过程 猎人印记
function WR_Hunter_Function_LRYJ()
	local Temp_LRYJ=0
	if GetSpecialization()==1 then
		Temp_LRYJ=WRSet.SW_LRYJ
	elseif GetSpecialization()==3 then
		Temp_LRYJ=WRSet.SC_LRYJ
	end
	
	if Temp_LRYJ==1	--猎人印记 开启
	and WR_SpellUsable("猎人印记")	--技能可用
	and UnitHealth("target")/UnitHealthMax("target")>0.8	--血量>80%
	and IsSpellInRange("猎人印记","target")	--技能范围内
	and
	(
		not UnitAffectingCombat("player")	--没进战斗
		or
		WR_TargetIsBoss()	--目标是BOSS
	)
	and WR_GetUnitDebuffTime("target","猎人印记",true)==0	--目标没有我的 猎人印记
	then
		if WR_ColorFrame_Show("CSP","猎人印记") then return true end
	end
	return false
end

--宁神射击
function WR_Hunter_NSSJ(Unit)
	if GCD>ShiFaSuDu then return false end	--GCD>施法时间
	if C_Spell.IsSpellInRange("宁神射击",Unit)	--当前技能范围内
	and ( WR_UnitEnragedBuff(Unit) or WR_GetUnitBuffType(Unit,"Magic"))
	--              单位身上有激怒效果           或         单位身上有魔法效果
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CSF5","宁神T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF6","宁神M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF7","宁神F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSF1","宁神P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSF2","宁神P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF3","宁神P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF4","宁神P4T") then return true end
		end
	end
end

--施法过程 宁神射击
function WR_Hunter_Function_NSSJ()
	if GCD>ShiFaSuDu then return false end	--GCD>施法时间
	if not WR_SpellUsable("宁神射击") then return false end	--宁神射击 不可使用
	
	local Temp_NSSJ=5
	if GetSpecialization()==1 then
		Temp_NSSJ=WRSet.SW_NSSJ
	elseif GetSpecialization()==3 then
		Temp_NSSJ=WRSet.SC_NSSJ
	end
	
	if Temp_NSSJ==5 then	--禁用
		return false
	elseif Temp_NSSJ==1	--智能
	or
	(
		Temp_NSSJ==4	--焦点
		and
		(
			not UnitExists("focus")	--焦点不存在
			or
			UnitIsDead("focus")	--焦点死亡
			or
			not UnitCanAttack("player","focus")	--焦点不可攻击
		)
	)
	then
		if WR_Hunter_NSSJ("focus") then return true end	--焦点
		if WR_Hunter_NSSJ("target") then return true end	--目标
		if WR_Hunter_NSSJ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Hunter_NSSJ("party"..i.."target") then return true end
		end
	elseif Temp_NSSJ==2 then	--目标
		if WR_Hunter_NSSJ("target") then return true end
	elseif Temp_NSSJ==3 then	--指向
		if WR_Hunter_NSSJ("mouseover") then return true end
	elseif Temp_NSSJ==4 then	--焦点
		if WR_Hunter_NSSJ("focus") then return true end
	end
	
	return false
end

--胁迫
function WR_Hunter_XP(Unit)
	if C_Spell.IsSpellInRange("胁迫",Unit)	--当前技能范围内
	and WR_StunSpell(Unit)	--需要控制单位
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CN5","胁迫T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN6","胁迫M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CN7","胁迫F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN1","胁迫P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN2","胁迫P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN3","胁迫P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN4","胁迫P4T") then return true end
		end
	end
end

--施法过程 胁迫
function WR_Hunter_Function_XP()
	if GCD>ShiFaSuDu then return false end	--GCD>施法时间
	if not WR_SpellUsable("胁迫") then return false end	--胁迫 不可使用
	
	local Temp_XP=5
	if GetSpecialization()==1 then
		Temp_XP=WRSet.SW_XP
	elseif GetSpecialization()==3 then
		Temp_XP=WRSet.SC_XP
	end
	
	if Temp_XP==5 then	--禁用
		return false
	elseif Temp_XP==1	--智能
	or
	(
		Temp_XP==4	--焦点
		and
		(
			not UnitExists("focus")	--焦点不存在
			or
			UnitIsDead("focus")	--焦点死亡
			or
			not UnitCanAttack("player","focus")	--焦点不可攻击
		)
	)
	then
		if WR_Hunter_XP("focus") then return true end	--焦点
		if WR_Hunter_XP("target") then return true end	--目标
		if WR_Hunter_XP("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Hunter_XP("party"..i.."target") then return true end
		end
	elseif Temp_XP==2 then	--目标
		if WR_Hunter_XP("target") then return true end
	elseif Temp_XP==3 then	--指向
		if WR_Hunter_XP("mouseover") then return true end
	elseif Temp_XP==4 then	--焦点
		if WR_Hunter_XP("focus") then return true end
	end
	
	return false
end

--夺命射击
function WR_Hunter_DMSJ(Unit,Text)
	if WR_GetUnitRange(Unit)<=40 --目标距离
	and WR_TargetInCombat(Unit) --目标战斗中
	and
	(
		UnitHealth(Unit)/UnitHealthMax(Unit)<0.2 --单位血量<20%
		or
		WR_GetUnitBuffTime("player","干掉他们")>GCD
	)
	and
	(
		Text==nil
		or
		(
			Text=="利矛"
			and
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		)
		or
		(
			Text=="毒液"
			and
			IsPlayerSpell(459565)	--已学 毒液噬心
			and
			WR_GetUnitDebuffInfo(Unit,"毒蛇钉刺",true)<=5.4	--毒蛇钉刺 DEBUFF时间<=5.4秒
		)
		or
		(
			Text=="黑蚀"
			and
			IsPlayerSpell(430703)	--已学 黑蚀箭
			and
			IsPlayerSpell(459565)	--已学 毒液噬心
			and
			WR_GetUnitDebuffInfo(Unit,"毒蛇钉刺",true)<=5.4	--毒蛇钉刺 DEBUFF时间<=5.4秒
		)
	)
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CN8","夺命T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN9","夺命M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("AN7","夺命P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("AN8","夺命P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("AN9","夺命P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("AN0","夺命P4T") then return true end
		end
	end
	return false
end

--施法过程 夺命射击
function WR_Hunter_Function_DMSJ(Text)
	if GCD>ShiFaSuDu then return false end
	if WR_GetGCD("夺命射击")>GCD then return false end

	if WR_Hunter_DMSJ("target",Text) then return true end
	if WR_Hunter_DMSJ("mouseover",Text) then return true end
	for i=1,5,1 do
		local TempUnit="party"..i.."target"
		if WR_Hunter_DMSJ(TempUnit,Text) then return true end
	end
	return false
end