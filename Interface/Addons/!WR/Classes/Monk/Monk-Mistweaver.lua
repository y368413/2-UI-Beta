--织雾运行库
function WR_MonkMistweaver()
	if GetSpecialization()~=2 then	--如果不是织雾(2)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.ZW_SFSD*0.05
		GCD=WR_GetGCD("猛虎掌")	--获得当前公共CD

		CD_HMT=WR_GetGCD("幻灭踢")	--获得当前公共CD
		CD_XRDST=WR_GetGCD("旭日东升踢")	--获得旭日东升踢的CD
		CD_CYB=WR_GetGCD("禅意波")	--获得禅意波的CD
		CD_ZHXF=WR_GetGCD("朱鹤下凡")	--获得朱鹤下凡的CD
		CD_LHZC=WR_GetGCD("轮回之触")	--获得 轮回之触 的CD
		CD_YHJM=WR_GetGCD("移花接木")	--获得 移花接木 的CD
		CD_QCSX=WR_GetGCD("清创生血")	--获得 清创生血 的CD
		CD_XRMH=WR_GetGCD("迅如猛虎")	--获得 迅如猛虎 的CD
		CD_FJCG=WR_GetGCD("分筋错骨")	--获得 分筋错骨 的CD
		CD_STT=WR_GetGCD("扫堂腿")	--获得 扫堂腿 的CD
		CD_QHS=WR_GetGCD("切喉手")	--获得 切喉手 的CD
		CD_LGJSC=WR_GetGCD("雷光聚神茶")	--获得 雷光聚神茶 的CD
		
		CD_ZJFM=WR_GetGCD("作茧缚命")	--获得 作茧缚命 的CD

		FSZW_NextCharge=WR_GetSpellNextCharge("复苏之雾")	--获得复苏之雾剩余充能时间
		FSZW_Charges=WR_GetSpellCharges("复苏之雾")	--获得复苏之雾可使用的次数

		PlayerInCombat = UnitAffectingCombat("player")	--判断自己是否在战斗中
		
		MaxLatency=WR_GetMaxLatency()	--获得当前最大网络延时
		MaxLatency=MaxLatency+0.05	--为最大网络延时增加阈值
		if MaxLatency < 0.1 then
			Latency=0.1
		else
			Latency=MaxLatency
		end
		if MaxLatency > 0.25 then
			Latency=0.25
		else
			Latency=MaxLatency
		end

		PlayerHP=1
		if UnitHealthMax("player")~=0 then
			PlayerHP=UnitHealth("player")/UnitHealthMax("player")
		end
		
		FocusHP=1
		if UnitHealthMax("focus")~=0 then
			FocusHP=UnitHealth("focus")/UnitHealthMax("focus")
		end
		
		PartyLostHP=WR_PartyLostHP("活血术")	--获得小队平均损失血量
		
		PlayerMove=WR_PlayerMove()--获得自身是否在移动或者空中
		if LastStopMoveTime==nil or PlayerMove then
			LastStopMoveTime=GetTime()
			StopMoveTime=0
		elseif not PlayerMove then
			StopMoveTime=GetTime()-LastStopMoveTime
		end
		TargetRange=WR_GetUnitRange("target")	--获得目标的距离
		
		--TargetIsNearby=IsSpellInRange("幻灭踢","target")==1	--获得目标是否在近战技能范围内
		TargetIsNearby=WR_GetUnitRange("target")<=5	--获得目标是否在近战技能范围内
		
		TargetInCombat=WR_TargetInCombat("target")	--单位在与我们进行战斗
		PartyInCombat=WR_PartyInCombat()	--小队在战斗
		
		FocusIsHelp=false	--初始化焦点是否可以进行帮助
		--if UnitExists("focus") and not(UnitIsDead("focus")) and not(UnitCanAttack("player","focus")) and IsSpellInRange("活血术","focus")==1 then
		if UnitExists("focus") and not(UnitIsDead("focus")) and not(UnitCanAttack("player","focus")) and WR_GetUnitRange("focus")<=40 then
		--单位存在 并且 单位存活 并且 单位是友方 并且 单位在技能范围内
			FocusIsHelp=true
		end
		
		AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
		InTraining=WR_InTraining()	--获得是否在打木桩

		WR_GetPartyRange()	--获取队友距离,获得：TargetRange,FocusRange,PartyRange[i],RiadRange[i]
		WR_GetPartyLostHealth()	--获取队友真实的可恢复的血量，获得：PlayerLostHealth,TargetLostHealth,FocusLostHealth,PartyLostHealth[i],RiadLostHealth[i]
		
		
		--HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得幻灭踢技能范围内的敌人数量

		HUCountRange6=WR_GetRangeHarmUnitCount(6,false)

		HUCountRange8=WR_GetRangeHarmUnitCount(8,false)
		
		HUCountRange30=WR_GetRangeHarmUnitCount(30,not(InTraining))

		ShenHeYinXiangTiChannelTime=WR_GetTrueCastTime(1.5)	--获取神鹤引项踢的引导时间
		
		BuffTime_HLSX,BuffCount_HLSX,BuffSum_HLSX=WR_GetUnitBuffInfo("player","活力苏醒")	--获得活力苏醒BUFF信息
		BuffTime_ZHXF,BuffCount_ZHXF,BuffSum_ZHXF=WR_GetUnitBuffInfo("player","朱鹤下凡")	--获得朱鹤下凡BUFF信息
		BuffTime_LGJSC,BuffCount_LGJSC,BuffSum_LGJSC=WR_GetUnitBuffInfo("player","雷光聚神茶")	--获得雷光聚神茶BUFF信息
		BuffTime_CYJH,BuffCount_CYJH,BuffSum_CYJH=WR_GetUnitBuffInfo("player","禅院教诲")	--获得禅院教诲BUFF信息
		BuffTime_JXBH,BuffCount_JXBH,BuffSum_JXBH=WR_GetUnitBuffInfo("player","觉醒碧火")	--获得觉醒碧火BUFF信息
		BuffTime_CJZW,BuffCount_CJZW,BuffSum_CJZW=WR_GetUnitBuffInfo("player","赤精之舞")	--获得 赤精之舞 BUFF信息
		BuffTime_FSZW,BuffCount_FSZW,BuffSum_FSZW=WR_GetUnitBuffInfo("player","复苏之雾")	--获得复苏之雾BUFF信息
		BuffTime_ZQNH,BuffCount_ZQNH,BuffSum_ZQNH=WR_GetUnitBuffInfo("player","真气宁和")	--获得真气宁和BUFF信息
		BuffTime_NHT,BuffCount_NHT,BuffSum_NHT=WR_GetUnitBuffInfo("player","碧火踏")	--获得碧火踏BUFF信息
		BuffTime_FLC,BuffCount_FLC,BuffSum_FLC=WR_GetUnitBuffInfo("player",197908)	--获得 法力茶 BUFF信息
		if BuffCount_FLC==0 then
			BuffTime_FLC,BuffCount_FLC,BuffSum_FLC=WR_GetUnitBuffInfo("player",115294)	--获得 法力茶 BUFF信息
		end
		
		Focus_BuffTime_FWZW,Focus_BuffCount_FWZW,Focus_BuffSum_FWZW=WR_GetUnitBuffInfo("focus","抚慰之雾",true)	--获得焦点抚慰之雾BUFF信息
		Focus_BuffTime_FSZW,Focus_BuffCount_FSZW,Focus_BuffSum_FSZW=WR_GetUnitBuffInfo("focus","复苏之雾",true)	--获得焦点复苏之雾BUFF信息
		--Focus_BuffTime_ZQNH,Focus_BuffCount_ZQNH,Focus_BuffSum_ZQNH=WR_GetUnitBuffInfo("focus","真气宁和")	--获得焦点真气宁和BUFF信息

		InRiadOrParty=WR_GetInRaidOrParty()	--获得在个人、小队还是团队
		LifeParty30=WR_GetLifeParty(30)	--获得30码内存活的队友数量
		
		--计算幻灭踢刷新旭日的概率
		HMT_Chance=0.2*(1+BuffCount_CYJH)	--禅院教诲增加20%，乘以（1+禅院教诲层数）
		if BuffTime_JXBH>GCD then	--觉醒碧火 BUFF存在(幻灭踢AOE)
			if HUCountRange8>=3 then --如果8码范围敌人数量>=3
				HMT_Chance=HMT_Chance*3
			else --如果8码范围敌人数量<3
				HMT_Chance=HMT_Chance*HUCountRange8
			end
		end
		InBossCombat=WR_InBossCombat()	--获得是否BOSS战斗
		TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS
		
		--MaxHealthUnitInRange20=WR_GetMaxHealthUnit(20)	--获得20码内最大生命值的敌对单位
		
		WR_RecordPlayerInCombatTime()	--记录进入战斗的时间，全局变量为：PlayerInCombatTime
		if PlayerInCombatTime~=nil then
			PlayerCombatTime=GetTime()-PlayerInCombatTime
		else
			PlayerCombatTime=0
		end

		SpellCount_SLZC=C_Spell.GetSpellCastCount("神龙之赐")	--获得神龙之赐层数
		--神龙之赐初始化治疗量
		SLZC=WR_GetSpellValue("神龙之赐","恢复","点生命值")*1.3
		SLZC_Sum=0	--神龙之赐初始化治疗量
		SLZC=SLZC*SpellCount_SLZC	--神龙之赐治疗量*层数
		
		--范围治疗统计-------------------------------------------------------
		if PlayerLostHealth>=SLZC then	--神龙之赐统计加入，自己可以恢复的血量
			SLZC_Sum=SLZC_Sum+SLZC
		else
			SLZC_Sum=SLZC_Sum+PlayerLostHealth
		end
		
		if InRiadOrParty=="party" then	--统计加入，队友可以恢复的血量
			local i
			for i=1,4,1
			do
				local unit="party"..i
				if PartyRange[i]<=40 then
					if PartyLostHealth[i]>=SLZC then
						SLZC_Sum=SLZC_Sum+SLZC
					else
						SLZC_Sum=SLZC_Sum+PartyLostHealth[i]
					end
				end
			end
		end
		if InRiadOrParty=="raid" then	--统计加入，团队可以恢复的血量
			local i
			for i=1,20,1
			do
				local unit="raid"..i
				if RiadRange[i]<=30 then
					if RiadLostHealth[i]>=SLZC then
						SLZC_Sum=SLZC_Sum+SLZC
					else
						SLZC_Sum=SLZC_Sum+RiadLostHealth[i]
					end
				end
			end
		end
		
		ZHXF_Time=0	--朱鹤下凡剩余时间
		for i=1,40,1
		do
			local _, totemName, startTime, duration, _= GetTotemInfo(i)
			if totemName=="赤精" then
				ZHXF_Time=startTime+duration-GetTime()
				if ZHXF_Time<0 then ZHXF_Time=0 end
			end 
		end
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end

	if MSG==1 then
		print("FocusHP=",FocusHP)
	end
	
	if WR_PriorityCheck() then return true end	--优先检查
	if WR_FocusMaxWeightUnit() then return true end	--焦点最高权重单位
	if WR_Function_ZNMB(2,WRSet.ZW_ZNMB) then return true end	--智能目标
	if WR_MonkMistweaver_QBH() then return true end	--躯不坏
	if WR_MonkMistweaver_SP("保命") then return true end	--饰品 自保/协助
	if WR_MonkMistweaver_ZLS() then return true end	--治疗石
	if WR_MonkMistweaver_ZLYS() then return true end	--治疗药水
	if WR_MonkMistweaver_StopCasting() then return true end	--停止施法
	if WR_MonkMistweaver_ZJFM() then return true end	--作茧缚命
	if Focus_BuffCount_FWZW==0 then --焦点抚慰之雾BUFF不存在(也就是没有对焦点在拉毛线)
		if WR_MonkMistweaver_LGJSC() then return true end	--雷光聚神茶
		if WR_Monk_QHS_Function() then return true end	--切喉手
		if WR_MonkMistweaver_STT() then return true end	--扫堂腿
		if WR_MonkMistweaver_FJCG_Function() then return true end	--分筋错骨
		if WR_MonkMistweaver_XRMH_Function() then return true end	--迅如猛虎
		if WR_MonkMistweaver_QCSX_Function() then return true end	--清创生血
		if WR_MonkMistweaver_YHJM() then return true end	--移花接木
		if WR_MonkMistweaver_SEFS() then return true end	--死而复生
		if WR_MonkMistweaver_SP() then return true end	--饰品 常规/爆发
		if WR_MonkMistweaver_HXS("抢救") then return true end	--活血术 抢救
		if WR_MonkMistweaver_SLZC() then return true end	--神龙之赐
		if WR_MonkMistweaver_ZHXF() then return true end	--朱鹤下凡
		if WR_MonkMistweaver_XRDST("雷茶") then return true end	--旭日东升踢 雷茶
		if WR_MonkMistweaver_FWZW() then return true end	--抚慰之雾
	end
	if WR_MonkMistweaver_YYZW("瞬发") then return true end	--氤氲之雾 瞬发
	if WR_MonkMistweaver_HXS() then return true end	--活血术
	
	if WR_MonkMistweaver_LHZC() then return true end	--轮回之触
	if WR_MonkMistweaver_BHT() then return true end	--碧火踏
	if WR_MonkMistweaver_XRDST() then return true end	--旭日东升踢
	if WR_MonkMistweaver_HMT("朱鹤") then return true end	--幻灭踢 朱鹤下凡期间
	if WR_MonkMistweaver_MHZ("朱鹤") then return true end	--猛虎掌 朱鹤下凡期间
	
	if WR_MonkMistweaver_FLC() then return true end	--法力茶
	--if WR_MonkMistweaver_FSZW_Function("满层") then return true end	--复苏之雾 满层
	if WR_MonkMistweaver_SYSD() then return true end	--碎玉闪电
	if WR_MonkMistweaver_ZQBL() then return true end	--真气爆裂
	if WR_MonkMistweaver_HMT() then return true end	--幻灭踢
	if WR_MonkMistweaver_MHZ() then return true end	--猛虎掌
	
	if WR_MonkMistweaver_FSZW_Function() then return true end	--复苏之雾

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
		
	end

end

--躯不坏
function WR_MonkMistweaver_QBH()
	if WRSet.ZW_QBH~=6 --躯不坏不是关闭的
	and PlayerHP<=WRSet.ZW_QBH/10 --血量低于设定值
	and WR_SpellUsable("躯不坏")	--技能可用
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF12","躯不坏") then return true end
	end
	return false
end

--治疗石
function WR_MonkMistweaver_ZLS()
	if WRSet.ZW_ZLS~=5 --治疗石选项不是关闭的
	and PlayerHP<WRSet.ZW_ZLS/10 --血量比例<治疗石设定值/10
	and PlayerInCombat --单位战斗中
	and WR_Use_ZLS() --可以使用治疗石
	and (ZLYS_EndTime==nil or GetTime()-ZLYS_EndTime>0.5) --上一次 治疗药水 使用时间不存在 或者 放出时间>0.5
	and WR_MonkPass()
	then
		ZLS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end
	
--治疗药水
function WR_MonkMistweaver_ZLYS()
	if WRSet.ZW_ZLYS~=5 --治疗药水选项不是关闭的
	and PlayerHP<WRSet.ZW_ZLYS/10 --血量比例<治疗药水设定值/10
	and PlayerInCombat --单位战斗中
	and WR_Use_ZLYS() --可以使用治疗药水
	and (ZLS_EndTime==nil or GetTime()-ZLS_EndTime>0.5) --上一次 治疗石 施法不存在 或者 放出时间>0.5
	and WR_MonkPass()
	then
		ZLYS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--停止施法
function WR_MonkMistweaver_StopCasting()
	if
	(
		UnitChannelInfo("player")=="抚慰之雾" --正在引导抚慰之雾
		and
		(
			Focus_BuffCount_FWZW==0 --焦点抚慰之雾BUFF不存在(换焦点了)
			or
			FocusHP>0.90 --焦点血量比例
			or
			(
				not UnitIsPlayer("focus") --焦点不是玩家
				and
				FocusHP>0.55 --焦点血量比例
			)
		)
		and not WR_Mustheal("focus") --焦点必须治愈
	)
	or
	(
		UnitCastingInfo("player")=="死而复生"
		and
		not WR_PartyIsDeath() --队伍没有人死亡 
	)
	then
		if WR_MonkPass() then
			if WR_ColorFrame_Show("ACN0","停止施法") then return true end
		end
	end
	return false
end

--作茧缚命
function WR_MonkMistweaver_ZJFM()
	if WRSet.ZW_ZJFM~=4 --作茧缚命不是关闭的
	and WR_SpellUsable("作茧缚命")	--技能可用
	and FocusIsHelp --焦点满足可以治疗的条件(如距离等)
	and FocusHP<=WRSet.ZW_ZJFM/10 --焦点血量低于设定值
	and PlayerInCombat --玩家在战斗中
	and UnitIsPlayer("focus") --焦点是玩家
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("CF6","作茧缚命") then return true end
	end
	return false
end

--雷光聚神茶
function WR_MonkMistweaver_LGJSC()
	if WRSet.ZW_LGJSC==1 --雷光聚神茶 开启
	and TargetIsNearby	--目标在近战
	and WR_SpellUsable("雷光聚神茶")	--技能可用
	and BuffTime_LGJSC<=GCD	--雷光聚神茶 BUFF不存在
	and
	(
		PartyLostHP>0.15 --队伍损失血量>15%
		or
		InTraining --在打木桩
		or
		WR_GetSpellCharges("雷光聚神茶")>=2	--可用次数>=2
		or
		WR_GetSpellNextCharge("雷光聚神茶")<1	--充能时间<1秒
	)
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("CF7","雷光茶") then return true end
	end
	return false
end

--扫堂腿
function WR_MonkMistweaver_STT()
	if GCD<=ShiFaSuDu
	and WRSet.ZW_STT==1 --扫堂腿开启
	and WR_SpellUsable("扫堂腿")
	and WR_StunUnit(6,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("SF4","扫堂腿") then return true end
	end
	return false
end

--分筋错骨
function WR_MonkMistweaver_FJCG(Unit)
	if IsSpellInRange("分筋错骨",Unit)	--技能范围内
	and UnitCanAttack(Unit,"player") --单位是敌方
	and WR_StunSpell(Unit) --可以击晕单位
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF3","分筋错骨T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSJ","分筋错骨M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSU","分筋错骨P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSH","分筋错骨P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSB","分筋错骨P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSY","分筋错骨P4T") then return true end
		end
	end
	return false
end

--施法过程 分筋错骨
function WR_MonkMistweaver_FJCG_Function()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("分筋错骨") then return false end	--技能不可用
	if WR_GetInRaidOrParty()=="raid" then return false end	--在团队不生效

	if WRSet.ZW_FJCG==1 then --开启
		if WR_MonkMistweaver_FJCG("target") then return true end	--目标
		if WR_MonkMistweaver_FJCG("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_MonkMistweaver_FJCG("party"..i.."target") then return true end
		end
	end

	return false
end

--迅如猛虎
function WR_MonkMistweaver_XRMH(Unit)
	if IsSpellInRange("迅如猛虎",Unit) --单位在技能范围内
	and not UnitCanAttack("player",Unit) --单位是友方
	and WR_Unbind(Unit)	--单位身上有定身BUFF
	then
		if Unit=="player" then
			if WR_ColorFrame_Show("CSG","迅虎P") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("ACSF9","迅虎P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("ACSF10","迅虎P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("ACSF11","迅虎P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("ACSF12","迅虎P4") then return true end
		end
	end
	return false
end

--迅如猛虎
function WR_MonkMistweaver_XRMH_Function()
	if GCD>ShiFaSuDu then return false end
	if not IsPlayerSpell(116841) then return false end	--没学天赋[迅如猛虎]
	if WR_GetGCD("迅如猛虎")>GCD then return false end	--技能冷却中
	if UnitChannelInfo("player")~=nil then return false end	--玩家在引导施法
	if WRSet.ZW_XRMH==3 then return false end	--迅如猛虎 关闭
	
	if WR_MonkMistweaver_XRMH("player") then return true end	--玩家
	if WRSet.ZW_XRMH==1 then
		for i=1,4,1 do
			if WR_MonkMistweaver_XRMH("party"..i) then return true end
		end
	end
	return false
end

--清创生血 的先决条件
function WR_MonkMistweaver_QCSX(Unit)
	if not UnitCanAttack("player",Unit)	--单位是友方
	and WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_CanRemoveUnitDebuff(Unit)	--单位有可驱散Debuff
	then
		if Unit=="player" then
			if WR_ColorFrame_Show("ASF1","驱散P") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("ASF3","驱散M") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("ASF5","驱散P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("ASF6","驱散P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("ASF7","驱散P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("ASF8","驱散P4") then return true end
		end
	end
	return false
end

--施法过程 清创生血
function WR_MonkMistweaver_QCSX_Function()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("清创生血") then return false end	--技能不可用
	
	if WRSet.ZW_QCSX==1 then	--智能
		if WR_MonkMistweaver_QCSX("mouseover") then return true end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)=="TANK" then
				if WR_MonkMistweaver_QCSX("party"..i) then return true end
			end
		end
		if WR_MonkMistweaver_QCSX("player") then return true end
		for i=1,4,1 do
			if WR_MonkMistweaver_QCSX("party"..i) then return true end
		end
	elseif WRSet.ZW_QCSX==2 then	--指向
		if WR_MonkMistweaver_QCSX("mouseover") then return true end
	elseif WRSet.ZW_QCSX==3 then	--自己
		if WR_MonkMistweaver_QCSX("player") then return true end
	end
	return false
end

--移花接木
function WR_MonkMistweaver_YHJM()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("技能名称") --技能冷却
	and PlayerHP<=0.4 --自身血量比例<=0.4
	then
		if WR_ColorFrame_Show("CF3","移花接木") then return true end
	end
	return false
end

--死而复生
function WR_MonkMistweaver_SEFS()
	if GCD<ShiFaSuDu
	and not PlayerInCombat --玩家不在战斗中
	and FocusHP>=0.7 --目标血量比例
	and WR_ResurrectParty() --有可以复活的队友
	then
		if WR_ColorFrame_Show("CF10","死而复生") then return true end
	end
	return false
end

--法力茶 的先决条件
function WR_MonkMistweaver_FLC()
	if WRSet.ZW_FLC==1	--法力茶 开启
	and GCD<ShiFaSuDu
	and ZHXF_Time==0	--朱鹤下凡不存在
	and C_Spell.GetSpellCastCount("法力茶")>=1 --法力茶层数
	and BuffCount_FLC==0 --身上没有法力茶BUFF
	and InRiadOrParty~="single" --在小队或者团队
	and PartyLostHP<0.15 --队伍损失血量<15%，也就是压力不大的时候才喝茶
	and FocusHP>0.90 --焦点血量>90%，也就是压力不大的时候才喝茶
	and not WR_ResistSustained() --持续性AOE不存在
	and PlayerCombatTime>0 --进入战斗时间>0
	--and 52500*C_Spell.GetSpellCastCount("法力茶")/2<UnitPowerMax("player",0)-UnitPower("player",0) --法力茶恢复法力<损失的法力
	and UnitPower("player",0)/UnitPowerMax("player",0)<0.85	--法力值低于85%
	and
	(
		PlayerCombatTime<2 --进入战斗时间<2
		or
		C_Spell.GetSpellCastCount("法力茶")>=20 --法力茶层数
	)
	then
		if WR_ColorFrame_Show("SF8","法力茶") then return true end
	end
	return false
end

--活血术
function WR_MonkMistweaver_HXS(Text)
	if GCD<ShiFaSuDu
	and FocusIsHelp --焦点满足可以治疗的前提（距离等）
	then
		if Text=="抢救"
		and FocusHP<0.3 --焦点血量比例
		and
		(
			(
				BuffCount_HLSX>=1 --活力苏醒BUFF存在
				and
				BuffCount_LGJSC==0 --雷光聚神茶BUFF不存在
			)
			or
			Focus_BuffCount_FWZW>=1 --焦点抚慰之雾BUFF存在
		)
		and WR_MonkPass()
		then
			if WR_ColorFrame_Show("CF11","活血抢救") then return true end
		end
	
		if Text==nil
		and
		(
			(
				ZHXF_Time==0	--朱鹤下凡不存在
				and BuffCount_HLSX>=1 --活力苏醒BUFF存在
				and BuffCount_LGJSC==0 --雷光聚神茶BUFF不存在
				and
				(
					FocusLostHealth>WR_GetSpellValue("活血术","为目标恢复","点生命值")*2.5
					or
					WR_Mustheal("focus") --焦点必须治愈
					or
					(
						not PlayerInCombat --没有在战斗中
						and
						FocusHP<0.7 --焦点血量<70%
					)
					or
					(
						not UnitIsPlayer("focus") --焦点不是玩家
						and
						FocusHP<0.9 --焦点血量<90%
					)
				)
			)
			or
			(
				Focus_BuffCount_FWZW>=1 --焦点抚慰之雾BUFF存在
				and
				(
					FocusHP<0.7 --焦点血量比例
					or
					WR_Mustheal("focus") --焦点必须治愈
				)
			)
		)
		then
			if WR_ColorFrame_Show("CF11","活血术") then return true end
		end
	end
	return false
end

--神龙之赐
function WR_MonkMistweaver_SLZC()
	if GCD<ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and WRSet.ZW_SLZC~=11 --神龙之赐 开启
	and not PlayerMove --自身不在移动或者空中
	and UnitCastingInfo("player")~="神龙之赐" --没有在施法神龙之赐
	and not WR_StopCast(WR_GetTrueCastTime("神龙之赐")) --避免施法被沉默的情况
	and SpellCount_SLZC>=WRSet.ZW_SLZC --神龙之赐层数>=设定层数
	and ZHXF_Time==0	--朱鹤下凡不存在
	and
	(
		WR_PreemptiveHealing("神龙之赐") --AOE尖刺伤害结束后瞬间放出神龙之赐
		or
		WR_RangeCountPR(40,0.80)>=4	--血量低于85%的单位数量>=4
		or
		WR_RangeCountPR(40,0.85)>=5	--血量低于85%的单位数量>=5
	)
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("CF12","神龙之赐") then return true end
	end
	return false
end

--朱鹤下凡
function WR_MonkMistweaver_ZHXF()
	if GCD<ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and WRSet.ZW_ZHXF==1 --朱鹤下凡 开启
	and CD_ZHXF<=GCD --技能冷却
	and UnitCastingInfo("player")~="神龙之赐" --没有在施法神龙之赐
	and AvgDeathTime>10 --剩余战斗时间>10
	and TargetIsNearby --目标在近战
	and SpellCount_SLZC<WRSet.ZW_SLZC --神龙之赐层数<设定层数
	and SpellCount_SLZC>1	--神龙之赐>1层
	and
	(
		WR_RangeCountPR(40,0.80)>=4	--血量低于85%的单位数量>=4
		or
		WR_RangeCountPR(40,0.85)>=5	--血量低于85%的单位数量>=5
		or
		(
			PartyLostHP>0.2 --队伍损失血量>20%
			and
			WR_ResistSustained() --持续性AOE存在
		)
	)
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF1","朱鹤下凡") then return true end
	end
	return false
end

--氤氲之雾
function WR_MonkMistweaver_YYZW(Text)
	if Text=="瞬发"
	and GCD<ShiFaSuDu
	and WR_GetUnitBuffInfo("focus","氤氲之雾",true)==0 --焦点氤氲之雾BUFF不存在
	and
	(
		FocusHP<0.7 --焦点血量比例
		or
		WR_Mustheal("focus") --必须治愈单位
		or
		(
			BuffCount_ZHXF>=3 --朱鹤下凡BUFF>=3层 瞬发氤氲
			and
			BuffTime_ZHXF<1.5 --朱鹤下凡BUFF时间<1.5秒
		)
	)
	and
	(
		BuffCount_ZHXF>=3 --朱鹤下凡BUFF>=3层 瞬发氤氲
		or
		BuffCount_LGJSC>=1 --雷光聚神茶BUFF>=1层 瞬发氤氲
		or
		Focus_BuffCount_FWZW>=1 --焦点抚慰之雾BUFF存在 瞬发氤氲
		or
		(
			not PlayerMove --没有移动
			and
			WR_GetUnitBuffTime("player",443112)>GCD	--玄牛之力BUFF存在 氤氲之雾的施放时间缩短50%
		)
	)
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF2","瞬发氤氲") then return true end
	end
	return false
end

--旭日东升踢
function WR_MonkMistweaver_XRDST(Text)
	if Text=="雷茶"
	and GCD<ShiFaSuDu
	and CD_XRDST<=GCD --技能冷却
	and TargetIsNearby --目标在近战
	and Focus_BuffCount_FSZW==0 --焦点复苏之雾BUFF不存在
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("CF2","旭日雷茶") then return true end
	end
	
	if Text==nil
	and GCD<ShiFaSuDu
	and CD_XRDST<=GCD --技能冷却
	and TargetIsNearby --目标在近战
	then
		if WR_ColorFrame_Show("CF2","旭日") then return true end
	end
	return false
end

--抚慰之雾
function WR_MonkMistweaver_FWZW()
	if GCD<ShiFaSuDu
	and WRSet.ZW_FWZW~=10 --抚慰之雾 开启
	and FocusIsHelp --焦点满足可以治疗的前提（距离等）
	and not PlayerMove --自身不在移动或者空中
	and ZHXF_Time==0	--朱鹤下凡不存在
	and FocusHP<WRSet.ZW_FWZW/10
	then
		if WR_ColorFrame_Show("SF6","抚慰之雾") then return true end
	end
	return false
end

--复苏之雾的先决条件
function WR_MonkMistweaver_FSZW(Unit)
	if FSZW_Charges>=1 --复苏之雾次数>=1
	and ZHXF_Time==0	--朱鹤下凡不存在
	and BuffCount_LGJSC==0 --雷光聚神茶BUFF不存在
	and UnitExists(Unit) --单位存在
	and not(UnitIsDead(Unit)) --单位存活
	and not(UnitCanAttack("player",Unit)) --单位是友方
	and WR_GetUnitRange(Unit)<=40 --单位在技能范围内
	and WR_GetUnitBuffInfo(Unit,"复苏之雾")<=6 --单位复苏之雾BUFF<=6秒
	and WR_GetUnitBuffInfo(Unit,"真气宁和")<=GCD --单位真气宁和BUFF不存在
	then
		return true
	end
	return false
end

--复苏之雾
function WR_MonkMistweaver_FSZW_Function(Text)
	if Text=="满层"
	and GCD<ShiFaSuDu
	and
	(
		FSZW_NextCharge<3 --复苏之雾剩余充能时间<3秒
		or
		FSZW_Charges==2 --复苏之雾可使用的次数==2
	)
	then
		--复苏F
		if WR_MonkMistweaver_FSZW("focus") then --复苏之雾条件通过
			if WR_ColorFrame_Show("SF9","复苏满F") then return true end
		end
		
		for i= 1,4,1 do
			if WR_MonkMistweaver_FSZW("party"..i) then --复苏之雾条件通过
				if UnitIsUnit("focus","party"..i) then
					if WR_ColorFrame_Show("SF9","复苏满".."P"..i) then return true end
				end
				if WR_FocusUnit("party"..i,"复苏满") then return true end --选择单位过程
			end
		end
	end
	
	if Text==nil
	and GCD<ShiFaSuDu
	then
		if WR_MonkMistweaver_FSZW("focus") then --复苏之雾条件通过
			if WR_ColorFrame_Show("SF9","复苏F") then return true end
		end
		
		for i= 1,4,1 do
			if WR_MonkMistweaver_FSZW("party"..i) then --复苏之雾条件通过
				if UnitIsUnit("focus","party"..i) then
					if WR_ColorFrame_Show("SF9","复苏".."P"..i) then return true end
				end
				if WR_FocusUnit("party"..i,"复苏") then return true end --选择单位过程
			end
		end
	end
	return false
end

--轮回之触
function WR_MonkMistweaver_LHZC()
	if GCD<ShiFaSuDu
	and WRSet.ZW_LHZC==1 --轮回之触 开启
	and CD_LHZC<=GCD --技能冷却
	and IsSpellOverlayed(322109) --技能激活触发
	and TargetIsNearby --目标在近战
	and
	(
		UnitClassification("target")=="worldboss" --世界BOSS
		or
		UnitClassification("target")=="rareelite" --稀有精英
		or
		UnitClassification("target")=="rare" --稀有
		or
		UnitClassification("target")=="elite" --精英
		or
		WR_UnitIsBoss("target") --目标是BOSS
	)
	then
		if WR_ColorFrame_Show("CF8","轮回之触") then return true end
	end
	return false
end

--碧火踏
function WR_MonkMistweaver_BHT()
	if GCD<ShiFaSuDu
	and TargetIsNearby --单位在近战范围内
	and WR_SpellUsable("碧火踏") --技能可用
	and WR_GetUnitBuffInfo("player","天神王朝")<=GCD	--天神王朝 BUFF不存在
	and
	(
		BuffTime_JXBH<=GCD	--觉醒碧火 BUFF不存在
		or
		(
			IsPlayerSpell(467293)	--已学 碧火之训
			and
			WR_GetUnitBuffInfo("player","碧火之训")<=GCD	--碧火之训 BUFF不存在
		)
	)
	and
	(
		zhandoumoshi==1 --开爆发
		or
		ZHXF_Time>0	--朱鹤下凡存在
	)
	then
		if WR_ColorFrame_Show("SF7","碧火踏") then return true end
	end
	
	return false
end

--碎玉闪电
function WR_MonkMistweaver_SYSD()
	WR_GetLastSpellName()	--记录最后一个技能
	if WR_LastSpellName=="碎玉闪电" then return false end	--如果最后一个技能是"碎玉闪电"则结束
	
	if GCD<ShiFaSuDu
	and WRSet.ZW_SYSD~=6 --碎玉闪电 开启
	and StopMoveTime>=1	--停止移动时间>=1秒
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("碎玉闪电")	--技能可用
	and IsSpellInRange("碎玉闪电","target")	--目标在技能距离内
	and UnitChannelInfo("player")~="碎玉闪电" --当前没有引导碎玉闪电
	and WR_GetUnitBuffInfo("player","青玉赋能")>GCD	--青玉赋能 BUFF存在
	and WR_GetRangeHarmUnitCount(10)>=WRSet.ZW_SYSD	--获得10码敌人数量
	and
	(
		not IsPlayerSpell(467293)	--没学 碧火之训
		or
		(
			IsPlayerSpell(467293)	--已学 碧火之训
			and
			WR_GetUnitBuffInfo("player","碧火之训")>GCD	--碧火之训 BUFF存在
		)
	)
	then
		
		if WR_ColorFrame_Show("ASF12","碎玉闪电") then return true end
	end
	return false
end

--幻灭踢
function WR_MonkMistweaver_HMT(Text)
	if GCD<ShiFaSuDu
	and WR_SpellUsable("幻灭踢")	--技能可用
	and TargetIsNearby --目标在近战
	and BuffCount_CYJH>=1 --禅院教诲BUFF>=1层
	and
	(
		ZHXF_Time>GCD	--朱鹤下凡 存在期间
		or
		BuffCount_CYJH>=3 --禅院教诲BUFF>=3层
		or
		HMT_Chance>=1 --幻灭踢刷新旭日的概率>=100%
	)
	then
		if Text=="朱鹤"
		and ZHXF_Time>GCD then
			if WR_ColorFrame_Show("CF4","朱鹤幻灭") then return true end
		end
		
		if Text==nil then
			if WR_ColorFrame_Show("CF4","幻灭踢") then return true end
		end
	end
	return false
end

--神鹤引项踢
function WR_MonkMistweaver_SHYXT()
	if GCD<ShiFaSuDu
	and TargetIsNearby --单位在近战范围内
	and BuffCount_JXBH>0 --觉醒碧火BUFF存在
	and WR_SpellUsable("神鹤引项踢") --技能可用
	and
	(
		HUCountRange6>=4 --6码范围单位数量>=4
		or
		BuffTime_CJZW>0 --赤精之舞 BUFF存在
	)
	then
		if WR_ColorFrame_Show("CF5","神鹤") then return true end
	end
	return false
end

--猛虎掌
function WR_MonkMistweaver_MHZ(Text)
	if GCD<ShiFaSuDu
	and TargetIsNearby --目标在近战
	and WR_SpellUsable("猛虎掌") --技能可用
	then
		if Text=="朱鹤"
		and ZHXF_Time>GCD then
			if WR_ColorFrame_Show("CF9","朱鹤猛虎") then return true end
		end
		
		if Text==nil then
			if WR_ColorFrame_Show("CF9","猛虎掌") then return true end
		end
	end
	return false
end

--真气爆裂
function WR_MonkMistweaver_ZQBL()
	if GCD<ShiFaSuDu
	and TargetIsNearby --目标在近战
	and StopMoveTime>0.5 --停止移动时间>0.5秒
	and WR_SpellUsable("真气爆裂") --技能可用
	then
		if WR_ColorFrame_Show("ACF9","真气爆裂") then return true end
	end
	return false
end

--饰品
function WR_MonkMistweaver_SP(Text)
	if Text=="保命" then
		if WRSet.ZW_SP1>=3 then
			if WR_ShiPin(1,WRSet.ZW_SP1) then return true end	--饰品 自保/协助
		end
		if WRSet.ZW_SP2>=3 then
			if WR_ShiPin(2,WRSet.ZW_SP2) then return true end	--饰品 自保/协助
		end
	end
	if Text==nil then
		if WRSet.ZW_SP1==1 or WRSet.ZW_SP1==2 then
			if WR_ShiPin(1,WRSet.ZW_SP1) then return true end	--饰品 常驻
		end
		if WRSet.ZW_SP2==1 or WRSet.ZW_SP2==2 then
			if WR_ShiPin(2,WRSet.ZW_SP2) then return true end	--饰品 常驻
		end
	end
	return false
end