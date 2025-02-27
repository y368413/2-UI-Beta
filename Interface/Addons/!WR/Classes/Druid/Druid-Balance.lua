--鸟德运行库
function WR_DruidBalance()
	if GetSpecialization()~=1 then	--如果不是鸟德(1)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.05+WRSet.PH_SFSD*0.05

	WR_Initialize()	--初始化
	
	WR_GetLastSpellName()	--获取上一次的技能名称，返回值：WR_LastSpellName
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")
	PlayerMove=WR_PlayerMove()--获得自身是否在移动或者空中
	GCD=WR_GetGCD("野性印记")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	CD_HS=WR_GetGCD("超凡之盟")	--获得化身剩余时间
	CD_ALEZN=WR_GetGCD("艾露恩之怒")	--获得艾露恩之怒剩余时间
	
	PartyLostHP=WR_PartyLostHP("愈合")	--获得全队平均掉血百分比
	--CastingName = UnitCastingInfo("player")	--获得当前施法的名称
	CastingName, _, _, _, CastingendTimeMS, _, _, _, _ = UnitCastingInfo("player")	--获得当前施法的名称/施法时间
	CastingTime=0
	if CastingendTimeMS~=nil then
		CastingTime=CastingendTimeMS/1000-GetTime()
		--获得当前施法剩余时间
	end
	
	YueHuoShuDebuffTime=WR_GetUnitDebuffInfo("target","月火术",true)
	YangYanShuDebuffTime=WR_GetUnitDebuffInfo("target","阳炎术",true)

	ResistOutburstTime=WR_ResistOutburstTime()	--防御尖刺型伤害剩余时间
	MustDefenseTime_Bear=ResistOutburstTime<=GCD+MaxGCD+0.5	--防御尖刺型伤害剩余时间<=当前GCD剩余时间+最大GCD时间+0.2秒,变熊
		
	HUCountRange45=WR_GetRangeHarmUnitCount(45,not(WR_InTraining()))
	
	TargetInRange45=IsSpellInRange("愤怒","target")	--目标在45码内
	TargetInCombat=WR_TargetInCombat("target")	--目标在战斗
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	SingleUnit=WR_SingleUnit()	--是否强制单体
	
	
	Party1TargetDeathTime=WR_GetUnitDeathTime("party1target")	--获得队友1目标死亡时间
	Party2TargetDeathTime=WR_GetUnitDeathTime("party2target")	--获得队友2目标死亡时间
	Party3TargetDeathTime=WR_GetUnitDeathTime("party3target")	--获得队友3目标死亡时间
	Party4TargetDeathTime=WR_GetUnitDeathTime("party4target")	--获得队友4目标死亡时间
	AvgDeathTime=WR_GetRangeAvgDeathTime(45)    --获得预计战斗结束时间
	InBossCombat=WR_InBossCombat()	--获得是否BOSS战斗
	TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS+
	TargetInvincible=WR_Invincible("target")--获取目标是否无敌
	XingJiePower=UnitPower("player",8)	--获得当前星界能量
	HongMingXingChenBuffTime,HongMingXingChenBuffCount=WR_GetUnitBuffInfo("player","轰鸣星辰")	--获得轰鸣星辰BUFF剩余时间
	_,ALEDZS_BuffCount,_=WR_GetUnitBuffInfo("player","艾露恩的战士")	--艾露恩的战士BUFF堆叠层数
	_,MM_BuffCount,_=WR_GetUnitBuffInfo("player","迷梦")	--迷梦BUFF堆叠层数，10.2两件套
	XCLZ_BuffTime,XCLZ_BuffCount,_=WR_GetUnitBuffInfo("player","星辰领主")	--星辰领主BUFF堆叠层数
	_,XCZL_BuffCount,_=WR_GetUnitBuffInfo("player","星辰坠落")	--星辰坠落BUFF堆叠层数
	_,XSXT_BuffCount,_=WR_GetUnitBuffInfo("player","枭兽形态")	--枭兽形态 BUFF

	XSKN_BuffTime=WR_GetUnitBuffInfo("player","枭兽狂怒")	--获得枭兽狂怒BUFF剩余时间
	YueShiBuffTime=WR_GetUnitBuffInfo("player","月蚀")	--获得月蚀BUFF剩余时间
	RiShiBuffTime=WR_GetUnitBuffInfo("player","日蚀")	--获得日蚀BUFF剩余时间
	HuaShenBuffTime=0	--初始化化身BUFF剩余时间
	local HUASHEN=WR_GetUnitBuffInfo("player","化身：艾露恩之眷")	--获得化身：艾露恩之眷BUFF剩余时间
	local CHAOFAN=WR_GetUnitBuffInfo("player","超凡之盟")	--获得超凡之盟BUFF剩余时间
	if HUASHEN>0 then
		HuaShenBuffTime=HUASHEN	--获得化身：艾露恩之眷BUFF剩余时间
	elseif CHAOFAN>0 then
		HuaShenBuffTime=CHAOFAN	--获得超凡之盟BUFF剩余时间
	end
	FenNuCount=C_Spell.GetSpellCastCount("愤怒")	--获得愤怒还有多少次进入月蚀
	XingHuoShuCount=C_Spell.GetSpellCastCount("星火术")	--获得星火术还有多少次进入日蚀
	_,_,_,FenNuCastTime=GetSpellInfo("愤怒")
	if FenNuCastTime~=nil then
		FenNuCastTime=FenNuCastTime/1000	--获得愤怒施法所需时间
	else
		FenNuCastTime=0
	end
	_,_,_,XingHuoShuCastTime=GetSpellInfo("星火术")
	if XingHuoShuCastTime~=nil then
		XingHuoShuCastTime=XingHuoShuCastTime/1000	--获得星火术所需时间
	else
		XingHuoShuCastTime=0
	end
	_,_,_,XingChenYaoBanCastTime=GetSpellInfo("星辰耀斑")
	if XingChenYaoBanCastTime~=nil then
		XingChenYaoBanCastTime=XingChenYaoBanCastTime/1000	--获得星辰耀斑所需时间
	else
		XingChenYaoBanCastTime=0
	end
	if CastingName=="愤怒" then	--获得愤怒是否在施法中
		FenNuCasting=true
	else
		FenNuCasting=false
	end
	if CastingName=="星火术" then	--获得星火术是否在施法中
		XingHuoShuCasting=true
	else
		XingHuoShuCasting=false
	end
	-----新月-----
	_,_,_,MoonCastTime=GetSpellInfo("新月")	--获取当前新/半/满月的施法时间
	local NextMoonPower=0	--初始化下一次新月/半月/满月的回能
	NextMoonCastTime=0	--初始化下一次新月/半月/满月的施法时间
	if MoonCastTime~=nil and (WR_GetSpellCharges("新月")>=2 or (WR_GetSpellCharges("新月")==1 and CastingName~="满月" and CastingName~="半月" and CastingName~="新月")) then
	--检测新月/半月/满月可用次数，次数>=2，或者次数=1并且当前没有施放新月/半月/满月
		MoonCastTime=MoonCastTime/1000
		if CastingName=="新月" then NextMoonPower=12 end	--如果施法的是新月，当前回能初始化为10
		if CastingName=="半月" then NextMoonPower=24 end	--如果施法的是半月，当前回能初始化为20
		if CastingName=="满月" then NextMoonPower=50 end	--如果施法的是满月，当前回能初始化为40
		ManYue=WR_GetSpellCharges("满月") or 0	--检测满月次数
		BanYue=WR_GetSpellCharges("半月") or 0	--检测半月次数
		XinYue=(ManYue==0 and BanYue==0 and WR_GetSpellCharges("新月")) or 0	--检测新月次数
		if ManYue>0 and CastingName~="满月" then
		--如果当前是满月技能 并且 没有施放满月技能
			NextMoonPower=NextMoonPower+50
			NextMoonCastTime=MoonCastTime	--下一次是满月
		end
		if BanYue>0 and CastingName=="半月" then
			NextMoonPower=NextMoonPower+50
			NextMoonCastTime=MoonCastTime/2*3	--下一次是满月
		end
		if BanYue>0 and CastingName~="半月" then
			NextMoonPower=NextMoonPower+24
			NextMoonCastTime=MoonCastTime	--下一次是半月
		end
		if XinYue>0 and CastingName=="新月" then
			NextMoonPower=NextMoonPower+24
			NextMoonCastTime=MoonCastTime*2	--下一次是半月
		end
		if XinYue>0 and CastingName~="新月" then
			NextMoonPower=NextMoonPower+12
			NextMoonCastTime=MoonCastTime	--下一次是新月
		end
		if ManYue>0 and CastingName=="满月" then
			NextMoonPower=NextMoonPower+12
			NextMoonCastTime=MoonCastTime/3	--下一次是新月
		end
	end
	--NextMoonCastTime这个值，指的是下一次的新月/半月/满月的施法时间，作用是防止被打断施法
	--NextMoonPower这个值，指的是如果使用新月/半月/满月，最终会回能多少，这包含了当前正在施法的新月/半月/满月的回能，如果这个值为0，说明下一次新月/半月/满月技能不可用
	if NextMoonPower~=0 and XingJiePower+NextMoonPower<=90 then
	--下一次新/半/满月可用 并且 当前星界能量+下一次新/半/满月回能<=90（防止溢出）
		NewMoon=true	--NewMoon这个技能可用
	else
		NewMoon=false	--NewMoon这个技能不可用
	end
	-----新月-----
	-----下一个GCD的星界能量-----
	NextPower=XingJiePower	--初始化下一个GCD的星界能量=当前的星界能量
	if CastingName=="愤怒" then
	--施法的是愤怒
		if CastingTime<RiShiBuffTime then
		--施法时间在日蚀内
			NextPower=XingJiePower+12
		else
			NextPower=XingJiePower+8
		end
	end
	if CastingName=="星火术" then
	--施法的是星火术
		if CastingTime<YueShiBuffTime then
		--施法时间在月蚀内
			NextPower=XingJiePower+16
		else
			NextPower=XingJiePower+12
		end
	end
	if CastingName=="星辰耀斑" then
	--施法的是星辰耀斑
		NextPower=XingJiePower+12
	end
	if CastingName=="新月" then
		NextPower=XingJiePower+12
	end
	if CastingName=="半月" then
		NextPower=XingJiePower+24
	end
	if CastingName=="满月" then
		NextPower=XingJiePower+50
	end
	--NextPower这个值，指的是当前的星界能量+正在施法的技能可以增加的星界能量，等于下一个GCD的星界能量
	-----下一个GCD的星界能量-----

	
	if MSG==1 then
		print("GCD:"..GCD)
		print("下一个GCD星界能量：",NextPower)
		print("----------")
	end
	local AoNeng_Info=C_UnitAuras.GetPlayerAuraBySpellID(393961)--获得原始奥能脉冲星的BUFF信息
	if AoNeng_Info == nil then	--获得原始奥能脉冲星的奥能累计数量
		AoNengCount=0
	else
		AoNengCount=AoNeng_Info.points[1]
	end
	
	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_Druid_SPS() then return end	--树皮术
	
	if WR_Druid_GL() then return end	--甘霖
	
	if WRSet.PH_SP1>=3 then
		if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.PH_SP2>=3 then
		if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Druid_ZLS() then return end	--治疗石
	
	if WR_Druid_ZLYS() then return end	--治疗药水
	
	if WR_DruidBalance_ZRDSH() then return end	--自然的守护
	
	if WR_DruidBalance_JCDS() then return end	--解除定身
	
	if WR_DruidBalance_RGS() then return end	--日光术

	if WR_Druid_Function_FS() then return end	--复生
	
	if WR_DruidBalance_KBHF() then return end	--狂暴回复
	
	if WR_DruidBalance_BXFY() then return end	--变熊防御
	
	if WR_Druid_Function_DHPX() then return end	--施法过程 夺魂咆哮
	
	if WR_Druid_Function_AF() then return end	--施法过程 安抚
	
	if WR_Druid_Function_YXYJ() then return end	--施法过程 野性印记
	
	if WR_Druid_Function_QCFS() then return end	--施法过程 清除腐蚀
	
	if WR_Druid_SSXT() then return end	--枭兽形态
	
	if TargetInRange45 and TargetInCombat then	--目标在45码内 并且 目标战斗中
		if WRSet.PH_SP1==1 then
			if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 常驻
		end
		if WRSet.PH_SP2==1 then
			if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 常驻
		end
	end

	
	if WRSet.PH_XHLX==3	--循环类型 群体
	or
	(
		WRSet.PH_XHLX==1	--循环类型 智能
		and not SingleUnit	--不是单体目标
		and HUCountRange45>1
	)
	then
		
		if WR_DruidBalance_function_YHS("AOE") then return true end	--月火术
		
		if WR_DruidBalance_function_YYS("AOE") then return true end	--阳炎术
		
		--耀斑A1
		if IsPlayerSpell(202347) --已学 星辰耀斑
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and not PlayerMove --单位没有移动
		and UnitCastingInfo("player")~="星辰耀斑"	--当前没有施法 星辰耀斑
		and not WR_StopCast(XingChenYaoBanCastTime) --避免施法被沉默的情况
		and WR_GetUnitDebuffInfo("target","星辰耀斑",true)<=7.2+XingChenYaoBanCastTime	--可以刷新的时间
		and TargetDeathTime - WR_GetUnitDebuffInfo("target","星辰耀斑",true) > 8	--新的星辰耀斑可以维持8秒
		then
			if WR_ColorFrame_Show("CSJ","耀斑A1") then return true end
		end
		
		--自然A1
		if IsPlayerSpell(205636) --已学 自然之力
		and WR_GetGCD("自然之力")<=GCD --技能冷却
		and GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			YueShiBuffTime>=3	--月蚀持续时间>=3
			or
			RiShiBuffTime>=3	--日蚀持续时间>=3
		)
		then
			if WR_ColorFrame_Show("SF7","自然A1") then return true end
		end
		
		--艾怒A1
		if IsPlayerSpell(202770) --已学 艾露恩之怒
		and WR_GetGCD("艾露恩之怒")<=GCD --技能冷却
		and GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			YueShiBuffTime>GCD	--月蚀存在
			or
			RiShiBuffTime>GCD	--日蚀存在
		)
		then
			if WR_ColorFrame_Show("CF12","艾怒A1") then return true end
		end

		--超凡A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and WRSet.PH_HS==1	--化身开启
		and IsPlayerSpell(194223) --已学 超凡之盟
		and not IsPlayerSpell(102560) --没学 化身：艾露恩之眷
		and WR_GetGCD("超凡之盟")<=GCD --技能冷却
		and HuaShenBuffTime<=GCD	--化身不存在
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			not IsPlayerSpell(428731)	--没学 林中和谐
			or
			WR_GetGCD("自然之力")>25	--自然之力冷却时间>25秒
			or
			not IsPlayerSpell(205636)	--没学 自然之力
		)
		then
			if WRSet.PH_SP1==2 then
				if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 爆发
			end
			if WRSet.PH_SP2==2 then
				if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 爆发
			end
		
			if WR_ColorFrame_Show("SF3","超凡A1") then return true end
		end

		--化身A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and WRSet.PH_HS==1	--化身开启
		and IsPlayerSpell(194223) --已学 超凡之盟
		and IsPlayerSpell(102560) --已学 化身：艾露恩之眷
		and WR_GetGCD("化身：艾露恩之眷")<=GCD --技能冷却
		and HuaShenBuffTime<=GCD	--化身不存在
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			not IsPlayerSpell(428731)	--没学 林中和谐
			or
			WR_GetGCD("自然之力")>25	--自然之力冷却时间>25秒
			or
			not IsPlayerSpell(205636)	--没学 自然之力
		)
		then
			if WRSet.PH_SP1==2 then
				if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 爆发
			end
			if WRSet.PH_SP2==2 then
				if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 爆发
			end
		
			if WR_ColorFrame_Show("SF3","化身A1") then return true end
		end
		
		--艾战A1
		if IsPlayerSpell(202425) --已学 艾露恩的战士
		and WR_GetGCD("艾露恩的战士")<=GCD --技能冷却
		and GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and RiShiBuffTime<7	--日蚀 BUFF剩余时间<7秒
		then
			if WR_ColorFrame_Show("SF4","艾战A1") then return true end
		end
		
		--愤怒A1
		if IsPlayerSpell(190984) --已学技能 愤怒
		and GCD<=ShiFaSuDu
		and not PlayerMove --没有移动
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and not WR_StopCast(FenNuCastTime) --避免施法被沉默的情况
		and
		(
			(
				YueShiBuffTime>GCD	--月蚀 BUFF存在
				and
				YueShiBuffTime<GCD+FenNuCastTime	--月蚀 BUFF剩余时间<愤怒施法时间
			)
			or
			(
				YueShiBuffTime<=GCD	--不在月蚀
				and
				RiShiBuffTime<=GCD	--不在日蚀
			)
		)
		and
		(
			FenNuCount==0 --愤怒次数==0
			or
			FenNuCount==2 --愤怒次数==2
			or
			(
				FenNuCount==1 --愤怒次数==1
				and
				not FenNuCasting --没有施放愤怒
			)
		)
		then
			if WR_ColorFrame_Show("CSO","愤怒A1") then return true end
		end

		--星涌A1
		if IsPlayerSpell(78674) --已学 星涌术
		and not IsPlayerSpell(191034) --没学技能 星辰坠落
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and HUCountRange45<=2	--AOE范围单位数量<=2个
		and
		(
			NextPower>=36 --下一个GCD是能量>=36
			or
			(
				HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
				and
				IsPlayerSpell(393991) --已学 月神的守护
				and
				NextPower>=26 --下一个GCD是能量>=26
			)
		)
		then
			if WR_ColorFrame_Show("SF9","星涌A1") then return true end
		end

		--星落A1
		if IsPlayerSpell(191034) --已学技能 星辰坠落
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and NextPower>=45 --下一个GCD是能量>=45
		then
			if WR_ColorFrame_Show("SF5","星落A1") then return true end
		end

		--万灵A1
		if GCD<=ShiFaSuDu
		and WRSet.PH_WLZZ==1	--万灵之召开启
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and IsPlayerSpell(391528) --已学 万灵之召
		and WR_GetGCD("万灵之召")<=GCD --技能冷却
		and
		(
			WR_GetUnitBuffTime("player","迷梦")<=GCD	--迷梦 BUFF不存在
			and
			WR_GetUnitBuffTime("player","星影之拥")<=GCD	--星影之拥 BUFF不存在
			and
			HUCountRange45<7	--AOE数量<7
		)
		and
		(
			HuaShenBuffTime>GCD	--超凡之盟 BUFF存在
			or
			WR_GetGCD("超凡之盟")>40	--超凡之盟 冷却时间>40
		)
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			WR_GetGCD("自然之力")>15	--自然之力冷却时间>15秒
		)
		then
			if WR_ColorFrame_Show("CF6","万灵A1") then return true end
		end

		--星火A1
		if IsPlayerSpell(194153) --已学技能 星火术
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			(
				not PlayerMove --单位没有移动
				and
				not WR_StopCast(XingHuoShuCastTime) --避免施法被沉默的情况
			)
			or
			ALEDZS_BuffCount>=1 --艾露恩的战士BUFF存在，瞬发星火
			or
			XSKN_BuffTime>0 --枭兽狂怒BUFF存在，瞬发星火
		)
		and
		(
			YueShiBuffTime>GCD	--月蚀 BUFF存在
			or
			(
				FenNuCount==1 --愤怒次数==1
				and
				FenNuCasting --正在施放愤怒
			)
		)
		then
			if WR_ColorFrame_Show("CSK","星火A1") then return true end
		end
--[[
		--愤怒A2
		if IsPlayerSpell(190984) --已学技能 愤怒
		and GCD<=ShiFaSuDu
		and not PlayerMove --没有移动
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and not WR_StopCast(FenNuCastTime) --避免施法被沉默的情况
		then
			if WR_ColorFrame_Show("CSO","愤怒A2") then return true end
		end
--]]
	else
		
		if WR_DruidBalance_function_YHS("单体") then return true end	--月火术
	
		if WR_DruidBalance_function_YYS("单体") then return true end	--阳炎术
		
		--超凡S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and WRSet.PH_HS==1	--化身开启
		and IsPlayerSpell(194223) --已学 超凡之盟
		and not IsPlayerSpell(102560) --没学 化身：艾露恩之眷
		and WR_GetGCD("超凡之盟")<=GCD --技能冷却
		and HuaShenBuffTime<=GCD	--化身不存在
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			not IsPlayerSpell(428731)	--没学 林中和谐
			or
			WR_GetGCD("自然之力")>25	--自然之力冷却时间>25秒
			or
			not IsPlayerSpell(205636)	--没学 自然之力
		)
		then
			if WRSet.PH_SP1==2 then
				if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 爆发
			end
			if WRSet.PH_SP2==2 then
				if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 爆发
			end
		
			if WR_ColorFrame_Show("SF3","超凡S1") then return true end
		end
		
		--化身S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and WRSet.PH_HS==1	--化身开启
		and IsPlayerSpell(194223) --已学 超凡之盟
		and IsPlayerSpell(102560) --已学 化身：艾露恩之眷
		and WR_GetGCD("化身：艾露恩之眷")<=GCD --技能冷却
		and HuaShenBuffTime<=GCD	--化身不存在
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			not IsPlayerSpell(428731)	--没学 林中和谐
			or
			WR_GetGCD("自然之力")>25	--自然之力冷却时间>25秒
			or
			not IsPlayerSpell(205636)	--没学 自然之力
		)
		then
			if WRSet.PH_SP1==2 then
				if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 爆发
			end
			if WRSet.PH_SP2==2 then
				if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 爆发
			end
		
			if WR_ColorFrame_Show("SF3","化身S1") then return true end
		end
		
		--自然S1
		if IsPlayerSpell(205636) --已学 自然之力
		and WR_GetGCD("自然之力")<=GCD --技能冷却
		and GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			(
				WR_GetGCD("超凡之盟")<GCD+MaxGCD	--超凡之盟冷却时间<1个GCD
				and
				(
					(
						YueShiBuffTime<=GCD	--不在月蚀
						and
						RiShiBuffTime<=GCD	--不在日蚀
					)
					or
					(
						YueShiBuffTime>6	--月蚀持续时间>6
						or
						RiShiBuffTime>6	--日蚀持续时间>6
					)
				)
			)
			or
			(
				WR_GetGCD("超凡之盟")>25	--超凡之盟冷却时间>25秒
				and
				(
					YueShiBuffTime>=3	--月蚀持续时间>=3
					or
					RiShiBuffTime>=3	--日蚀持续时间>=3
				)
			)
		)
		then
			if WR_ColorFrame_Show("SF7","自然S1") then return true end
		end
		
		--进蚀 学了皎月呼唤,用愤怒进月蚀  没学皎月呼唤,用星火进日蚀
		if IsPlayerSpell(429523) then	--已学 皎月呼唤
			--愤怒S1
			if IsPlayerSpell(190984) --已学技能 愤怒
			and GCD<=ShiFaSuDu
			and not PlayerMove --没有移动
			and TargetInCombat	--单位战斗中
			and TargetInRange45	--目标在45码内
			and not WR_StopCast(FenNuCastTime) --避免施法被沉默的情况
			and
			(
				(
					YueShiBuffTime>GCD	--月蚀 BUFF存在
					and
					YueShiBuffTime<GCD+FenNuCastTime	--月蚀 BUFF剩余时间<愤怒施法时间
				)
				or
				(
					YueShiBuffTime<=GCD	--不在月蚀
					and
					RiShiBuffTime<=GCD	--不在日蚀
				)
			)
			and
			(
				FenNuCount==0 --愤怒次数==0
				or
				FenNuCount==2 --愤怒次数==2
				or
				(
					FenNuCount==1 --愤怒次数==1
					and
					not FenNuCasting --没有施放愤怒
				)
			)
			then
				if WR_ColorFrame_Show("CSO","愤怒S1") then return true end
			end
		else
			--星火S1
			if IsPlayerSpell(194153) --已学技能 星火术
			and GCD<=ShiFaSuDu
			and TargetInCombat	--单位战斗中
			and TargetInRange45	--目标在45码内
			and
			(
				(
					not PlayerMove --单位没有移动
					and
					not WR_StopCast(XingHuoShuCastTime) --避免施法被沉默的情况
				)
				or
				ALEDZS_BuffCount>=1 --艾露恩的战士BUFF存在，瞬发星火
				or
				XSKN_BuffTime>0 --枭兽狂怒BUFF存在，瞬发星火
			)
			and
			(
				(
					RiShiBuffTime>GCD	--日蚀 BUFF存在
					and
					RiShiBuffTime<GCD+XingHuoShuCastTime	--日蚀 BUFF剩余时间<星火术施法时间
				)
				or
				(
					RiShiBuffTime<=GCD	--不在月蚀
					and
					YueShiBuffTime<=GCD	--不在日蚀
				)
			)
			and
			(
				XingHuoShuCount==0 --星火术次数==0
				or
				XingHuoShuCount==2 --星火术次数==2
				or
				(
					XingHuoShuCount==1 --星火术次数==1
					and
					not XingHuoShuCasting --没有施放星火术
				)
			)
			then
				if WR_ColorFrame_Show("CSK","星火S1") then return true end
			end
		end
		
		--艾怒S1
		if IsPlayerSpell(202770) --已学 艾露恩之怒
		and WR_GetGCD("艾露恩之怒")<=GCD --技能冷却
		and GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and NextPower<90	--下一个GCD是能量<90
		then
			if WR_ColorFrame_Show("CF12","艾怒S1") then return true end
		end

		--星涌S1
		if IsPlayerSpell(78674) --已学 星涌术
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			NextPower>=36 --下一个GCD是能量>=36
			or
			(
				HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
				and
				IsPlayerSpell(393991) --已学 月神的守护
				and
				NextPower>=26 --下一个GCD是能量>=26
			)
		)
		and
		XCLZ_BuffCount<3	--星辰领主 BUFF层数<3
		then
			if WR_ColorFrame_Show("SF9","星涌S1") then return true end
		end
		
		if WR_DruidBalance_function_YYS("单刷") then return true end	--阳炎术
		
		if WR_DruidBalance_function_YHS("单刷") then return true end	--月火术
		
		--耀斑S1
		if IsPlayerSpell(202347) --已学 星辰耀斑
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and not PlayerMove --单位没有移动
		and UnitCastingInfo("player")~="星辰耀斑"	--当前没有施法 星辰耀斑
		and not WR_StopCast(XingChenYaoBanCastTime) --避免施法被沉默的情况
		and WR_GetUnitDebuffInfo("target","星辰耀斑",true)<=7.2+XingChenYaoBanCastTime	--可以刷新的时间
		and TargetDeathTime - WR_GetUnitDebuffInfo("target","星辰耀斑",true) > 8	--新的星辰耀斑可以维持8秒
		then
			if WR_ColorFrame_Show("CSJ","耀斑S1") then return true end
		end
		
		--星涌S2
		if IsPlayerSpell(78674) --已学 星涌术
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			NextPower>=36 --下一个GCD是能量>=36
			or
			(
				HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
				and
				IsPlayerSpell(393991) --已学 月神的守护
				and
				NextPower>=26 --下一个GCD是能量>=26
			)
		)
		and zhandoumoshi==1	--爆发开启
		and WR_GetGCD("万灵之召")<=GCD+MaxGCD*2 --万灵之召冷却时间<2个GCD
		and
		(
			(
				HuaShenBuffTime>GCD	--超凡之盟 BUFF存在
				or
				WR_GetGCD("超凡之盟")>40	--超凡之盟 冷却时间>40
			)
			and
			(
				WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
				or
				WR_GetGCD("自然之力")>15	--自然之力冷却时间>15秒
			)
		)
		then
			if WR_ColorFrame_Show("SF9","星涌S2") then return true end
		end
		
		--万灵S1
		if GCD<=ShiFaSuDu
		and WRSet.PH_WLZZ==1	--万灵之召开启
		and zhandoumoshi==1 --开爆发
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and IsPlayerSpell(391528) --已学 万灵之召
		and WR_GetGCD("万灵之召")<=GCD --技能冷却
		and
		(
			HuaShenBuffTime>GCD	--超凡之盟 BUFF存在
			or
			WR_GetGCD("超凡之盟")>40	--超凡之盟 冷却时间>40
		)
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")>GCD	--林中和谐 BUFF存在
			or
			WR_GetGCD("自然之力")>15	--自然之力冷却时间>15秒
		)
		then
			if WR_ColorFrame_Show("CF6","万灵S1") then return true end
		end

		--星涌S3
		if IsPlayerSpell(78674) --已学 星涌术
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			NextPower>=36 --下一个GCD是能量>=36
			or
			(
				HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
				and
				IsPlayerSpell(393991) --已学 月神的守护
				and
				NextPower>=26 --下一个GCD是能量>=26
			)
		)
		and XCLZ_BuffTime>4	--星辰领主 BUFF时间>4秒
		and WR_GetUnitBuffCount("player","394049") + WR_GetUnitBuffCount("player","394050") >= 3	--万物平衡BUFF层数总和 >= 3
		then
			if WR_ColorFrame_Show("SF9","星涌S3") then return true end
		end
		
		--星涌S4
		if IsPlayerSpell(78674) --已学 星涌术
		and GCD<=ShiFaSuDu
		and TargetInCombat	--单位战斗中
		and TargetInRange45	--目标在45码内
		and
		(
			NextPower>=36 --下一个GCD是能量>=36
			or
			(
				HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
				and
				IsPlayerSpell(393991) --已学 月神的守护
				and
				NextPower>=26 --下一个GCD是能量>=26
			)
		)
		and
		(
			NextPower>=90	--下一个GCD是能量>=90
			or
			(
				WR_InBossCombat()	--BOSS战斗
				and
				WR_GetRangeAvgDeathTime(45)<5	--战斗剩余时间<5
			)
		)
		then
			if WR_ColorFrame_Show("SF9","星涌S4") then return true end
		end
		
		--学了皎月呼唤,用星火打单体  没学皎月呼唤,用愤怒打单体
		if IsPlayerSpell(429523) then	--已学 皎月呼唤
			--星火S2
			if IsPlayerSpell(194153) --已学技能 星火术
			and GCD<=ShiFaSuDu
			and TargetInCombat	--单位战斗中
			and TargetInRange45	--目标在45码内
			and
			(
				(
					not PlayerMove --单位没有移动
					and
					not WR_StopCast(XingHuoShuCastTime) --避免施法被沉默的情况
				)
				or
				ALEDZS_BuffCount>=1 --艾露恩的战士BUFF存在，瞬发星火
				or
				XSKN_BuffTime>0 --枭兽狂怒BUFF存在，瞬发星火
			)
			and
			(
				YueShiBuffTime>GCD	--月蚀 BUFF存在
				or
				(
					FenNuCount==1 --愤怒次数==1
					and
					FenNuCasting --正在施放愤怒
				)
			)
			then
				if WR_ColorFrame_Show("CSK","星火S2") then return true end
			end
		else
			--愤怒S2
			if IsPlayerSpell(190984) --已学技能 愤怒
			and GCD<=ShiFaSuDu
			and not PlayerMove --没有移动
			and TargetInCombat	--单位战斗中
			and TargetInRange45	--目标在45码内
			and not WR_StopCast(FenNuCastTime) --避免施法被沉默的情况
			then
				if WR_ColorFrame_Show("CSO","愤怒S2") then return true end
			end
		end
	end
	
	if WR_DruidBalance_function_YHS("移动") then return true end	--月火术
	
	if WR_Function_ZNMB(45,WRSet.PH_ZNMB) then return true end	--智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--自然的守护
function WR_DruidBalance_ZRDSH()
	if WRSet.PH_ZRDSH==1 --自然的守护 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and WR_SpellUsable("自然的守护") --技能可用
	and WR_PartyLostHP("愈合")>0.40 --全队掉血比例
	then
		if WR_ColorFrame_Show("ASF6","自然守护") then return true end
	end
	return false
end

--解除定身
function WR_DruidBalance_JCDS()
	if WRSet.PH_JCDS==1 --解除定身开启
	and XSXT_BuffCount --枭兽形态
	and WR_Unbind("player") --单位有可以解除定身的状态
	then
		if WR_ColorFrame_Show("CF10","解除变形") then return true end
	end
	return false
end

--变熊防御
function WR_DruidBalance_BXFY()
	if WRSet.PH_BXFY==1 --变熊防御 开启
	and WR_SpellUsable("熊形态") --技能可用 资源可用
	and MustDefenseTime_Bear --必须变熊
	and WR_GetUnitBuffTime("player","熊形态")==0 --当前不是熊形态
	then
		if WR_ColorFrame_Show("CF7","变熊防御") then return true end
	end
	return false
end

--日光术
function WR_DruidBalance_RGS()
	if WRSet.PH_RGS==1 --日光术 开启
	and IsPlayerSpell(78675) --已学 日光术
	and IsSpellInRange("日光术","target")	--技能范围内
	and WR_GetGCD("日光术")<=GCD --技能冷却
	and WR_GetCastInterruptible("target",0,true) --指定"单位"施法剩余时间小于设定
	then
		if WR_ColorFrame_Show("CSF5","日光术T") then return true end
	end
	return false
end

--狂暴回复
function WR_DruidBalance_KBHF()
	if WR_GetUnitBuffTime("player","熊形态")~=0 --当前是熊形态
	and PlayerHP<=0.8 --玩家血量
	and IsPlayerSpell(22842) --已学 狂暴回复
	and WR_GetGCD("狂暴回复")<=GCD --技能冷却
	then
		if WR_ColorFrame_Show("CF5","狂暴回复") then return true end
	end
	return false
end
	
--枭兽形态
function WR_Druid_SSXT()
	if IsPlayerSpell(24858) --已学 枭兽形态
	and XSXT_BuffCount==0 --枭兽形态 不存在
	then
		if WR_ColorFrame_Show("CF4","枭兽形态") then return true end
	end
	return false
end

--月火术
function WR_DruidBalance_YHS(Unit,Text)
	if not WR_CanDot(Unit) then return false end	--不可上DOT的单位
	if not IsSpellInRange("月火术",Unit) then return false end	--单位超出距离
	if not WR_TargetInCombat(Unit) then return false end	--单位没进战斗
	
	local HYWS=0
	if IsPlayerSpell(429520) then HYWS=2 end	--已学[辉月卫士]
	local UnitDebuffTime_YHS = WR_GetUnitDebuffTime(Unit,"月火术",true)
	
	if
	(
		Text=="AOE"
		and UnitDebuffTime_YHS<=6.6	--单位月火术DEBUFF时间<=6.6
		and WR_GetUnitDeathTime(Unit)-UnitDebuffTime_YHS>6	--目标存活时间-目标月火剩余时间>6
		and NextPower+6+HYWS<=90	--下一个GCD星界能量+6+辉月卫士天赋给的能量<=90
	)
	or
	(
		Text=="单体"
		and UnitDebuffTime_YHS<3	--单位月火术DEBUFF时间<3
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")<=GCD	--林中和谐 BUFF不存在
			and
			(
				zhandoumoshi~=1	--爆发 没开启
				or
				WR_GetGCD("自然之力")>3	--自然之力冷却时间>3秒
			)
		)
	)
	or
	(
		Text=="单刷"
		and UnitDebuffTime_YHS<=6.6	--单位月火术DEBUFF时间<=6.6
		and
		(
			WR_GetUnitBuffTime("player","林中和谐")<=GCD	--林中和谐 BUFF不存在
			and
			(
				zhandoumoshi~=1	--爆发 没开启
				or
				WR_GetGCD("自然之力")>3	--自然之力冷却时间>3秒
			)
		)
	)
	or
	(
		Text=="移动"
		and WRSet.PH_YDYH==1 --移动月火 开启
	)
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CSL",(Text or "") .. "月火T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF6",(Text or "") .. "月火M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF7",(Text or "") .. "月火F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSF1",(Text or "") .. "月火P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSF2",(Text or "") .. "月火P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF3",(Text or "") .. "月火P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF4",(Text or "") .. "月火P4T") then return true end
		end
	end

	return false
end

--施法过程 月火术
function WR_DruidBalance_function_YHS(Text)
	if GCD>ShiFaSuDu then return false end
	if not IsPlayerSpell(8921) then return false end --没学技能 月火术
	if WR_GetUnitBuffTime("player","林中和谐")>GCD then return false end	--林中和谐BUFF存在的时候
	
	if WR_DruidBalance_YHS("target",Text) then return true end
	if WR_DruidBalance_YHS("focus",Text) then return true end
	if WR_DruidBalance_YHS("mouseover",Text) then return true end
	for i=1,4 do
		if WR_DruidBalance_YHS("party"..i.."target",Text) then return true end
	end
	return false
end

--阳炎术
function WR_DruidBalance_YYS(Unit,Text)
	if not WR_CanDot(Unit) then return false end	--不可上DOT的单位
	if not IsSpellInRange("阳炎术",Unit) then return false end	--单位超出距离
	if not WR_TargetInCombat(Unit) then return false end	--单位没进战斗

	local UnitDebuffTime_YYS = WR_GetUnitDebuffTime(Unit,"阳炎术",true)
	
	if
	(
		Text=="AOE"
		and UnitDebuffTime_YYS<=5.4	--单位阳炎术DEBUFF时间<=5.4
		and WR_GetUnitDeathTime(Unit)-UnitDebuffTime_YYS>6	--目标存活时间-目标阳炎术剩余时间>6
		and NextPower+6<=90	--下一个GCD星界能量+6<=90
	)
	or
	(
		Text=="单体"
		and UnitDebuffTime_YYS<3	--单位阳炎术DEBUFF时间<3
	)
	or
	(
		Text=="单刷"
		and UnitDebuffTime_YYS<=5.4	--单位阳炎术DEBUFF时间<=5.4
	)
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CSP",(Text or "") .. "阳炎T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF8",(Text or "") .. "阳炎M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF9",(Text or "") .. "阳炎F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN7",(Text or "") .. "阳炎P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN8",(Text or "") .. "阳炎P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN9",(Text or "") .. "阳炎P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN0",(Text or "") .. "阳炎P4T") then return true end
		end
	end

	return false
end

--施法过程 阳炎术
function WR_DruidBalance_function_YYS(Text)
	if GCD>ShiFaSuDu then return false end
	if not IsPlayerSpell(93402) then return false end --没学技能 阳炎术
	
	if WR_DruidBalance_YYS("target",Text) then return true end
	if WR_DruidBalance_YYS("focus",Text) then return true end
	if WR_DruidBalance_YYS("mouseover",Text) then return true end
	for i=1,4 do
		if WR_DruidBalance_YYS("party"..i.."target",Text) then return true end
	end
	return false
end

--艾露恩之怒
function WR_DruidBalance_ALEZN()
	if IsPlayerSpell(202770) --已学 艾露恩之怒
	and WR_GetGCD("艾露恩之怒")<=GCD --技能冷却
	and GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	then
		if WR_ColorFrame_Show("CF12","艾露恩之怒") then return true end
	end
	return false
end

--超凡之盟
function WR_DruidBalance_CFHS()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and WRSet.PH_HS==1	--化身开启
	and
	(
		(
			IsPlayerSpell(194223) --已学 超凡之盟
			and
			not IsPlayerSpell(102560) --没学 化身：艾露恩之眷
			and
			WR_GetGCD("超凡之盟")<=GCD --技能冷却
		)
		or
		(
			IsPlayerSpell(102560) --已学 化身：艾露恩之眷
			and
			WR_GetGCD("化身：艾露恩之眷")<=GCD --技能冷却
		)
	)
	then
		if WRSet.PH_SP1==2 then
			if WR_ShiPin(1,WRSet.PH_SP1) then return true end	--饰品 爆发
		end
		if WRSet.PH_SP2==2 then
			if WR_ShiPin(2,WRSet.PH_SP2) then return true end	--饰品 爆发
		end
	
		if WR_ColorFrame_Show("SF3","超凡化身") then return true end
	end
	return false
end

--艾露恩的战士
function WR_DruidBalance_ALEDZS()
	if IsPlayerSpell(202425) --已学 艾露恩的战士
	and WR_GetGCD("艾露恩的战士")<=GCD --技能冷却
	and GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and
	(
		(
			not IsPlayerSpell(429523)	--没学 皎月呼唤
			and
			RiShiBuffTime<7	--日蚀 BUFF剩余时间<7秒
		)
		or
		IsPlayerSpell(429523)	--已学 皎月呼唤
	)
	then
		if WR_ColorFrame_Show("SF4","艾露恩的战士") then return true end
	end
	return false
end

--愤怒 施法条件
function WR_DruidBalance_FenNu(Text)
	if IsPlayerSpell(190984) --已学技能 愤怒
	and GCD<=ShiFaSuDu
	and not PlayerMove --没有移动
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and not WR_StopCast(FenNuCastTime) --避免施法被沉默的情况
	then
		if Text=="月蚀"
		and
		(
			IsPlayerSpell(429523)	--已学 皎月呼唤
			or
			HUCountRange45>1	--45码单位数量>1
		)
		and
		(
			(
				YueShiBuffTime>GCD	--月蚀 BUFF存在
				and
				YueShiBuffTime<GCD+FenNuCastTime	--月蚀 BUFF剩余时间<愤怒施法时间
			)
			or
			(
				YueShiBuffTime<=GCD	--不在月蚀
				and
				RiShiBuffTime<=GCD	--不在日蚀
			)
		)
		and
		(
			FenNuCount==0 --愤怒次数==0
			or
			FenNuCount==2 --愤怒次数==2
			or
			(
				FenNuCount==1 --愤怒次数==1
				and
				not FenNuCasting --没有施放愤怒
			)
		)
		then
			if WR_ColorFrame_Show("CSO",(Text or "") .. "愤怒") then return true end
		end
	end
	return false
end

--星辰坠落
function WR_DruidBalance_XCYL()
	if IsPlayerSpell(191034) --已学技能 星辰坠落
	and GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and
	(
		NextPower>=45 --下一个GCD是能量>=45
		or
		(
			HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
			and
			IsPlayerSpell(393991) --已学月神的守护
			and
			NextPower>=33 --下一个GCD是能量>=33
		)
	)
	then
		if WR_ColorFrame_Show("SF5","星辰坠落") then return true end
	end
	return false
end

--星涌术
function WR_DruidBalance_XYS(Text)
	if IsPlayerSpell(78674) --已学 星涌术
	and GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and
	(
		NextPower>=36 --下一个GCD是能量>=36
		or
		(
			HuaShenBuffTime>GCD --化身持续时间>公共冷却时间
			and
			IsPlayerSpell(393991) --已学 月神的守护
			and
			NextPower>=26 --下一个GCD是能量>=26
		)
	)
	then
		if
		(
			Text=="领主"
			and
			(
				(
					XCLZ_BuffTime>GCD	--星辰领主 BUFF存在
					and
					XCLZ_BuffCount<3	--星辰领主 BUFF层数<3
				)
				or
				(
					zhandoumoshi==1
					and
					IsPlayerSpell(391528) --已学 万灵之召
					and
					WR_GetGCD("万灵之召")<=GCD --技能冷却
				)
			)
		)
		or
		(
			Text=="消耗"
			and
			NextPower>=90	--下一个GCD是能量>=90
			or
			(
				WR_InBossCombat()	--BOSS战斗
				and
				WR_GetRangeAvgDeathTime(45)<5	--战斗剩余时间<5
			)
		)
		then
			if WR_ColorFrame_Show("SF9",(Text or "") .. "星涌") then return true end
		end
	end
	return false
end

--星火术 施法条件
function WR_DruidBalance_XHS()
	if IsPlayerSpell(194153) --已学技能 星火术
	and GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and
	(
		(
			not PlayerMove --单位没有移动
			and
			not WR_StopCast(XingHuoShuCastTime) --避免施法被沉默的情况
		)
		or
		ALEDZS_BuffCount>=1 --艾露恩的战士BUFF存在，瞬发星火
		or
		XSKN_BuffTime>0 --枭兽狂怒BUFF存在，瞬发星火
	)
	and
	(
		IsPlayerSpell(429523)	--已学 皎月呼唤
		or
		(
			YueShiBuffTime>GCD	--月蚀 BUFF存在
			and
			HUCountRange45>1	--45码单位数量>1
		)
	)
	then
		if WR_ColorFrame_Show("CSK","星火术") then return true end
	end
	return false
end

--万灵之召 施法条件
function WR_DruidBalance_WLZZ()
	if GCD<=ShiFaSuDu
	and WRSet.PH_WLZZ==1	--万灵之召开启
	and zhandoumoshi==1 --开爆发
	and TargetInCombat	--单位战斗中
	and TargetInRange45	--目标在45码内
	and IsPlayerSpell(391528) --已学 万灵之召
	and WR_GetGCD("万灵之召")<=GCD --技能冷却
	and
	(
		(
			YueShiBuffTime>GCD	--月蚀存在
			and
			RiShiBuffTime>GCD	--日蚀存在
		)
		or
		WR_GetGCD("超凡之盟")>55	--超凡之盟CD>55秒
	)
	then
		if WR_ColorFrame_Show("CF6","万灵之召") then return true end
	end
	return false
end
