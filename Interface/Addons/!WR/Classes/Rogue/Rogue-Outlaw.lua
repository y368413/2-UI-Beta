--狂徒运行库
function WR_RogueOutlaw()
	if GetSpecialization()~=2 then	--如果不是(2)专精，则不执行该运行库
		return
	end
	
	WR_LFGList() --获得预组队多语言列表
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	WR_RogueOutlaw_ErrorMessage() --战斗错误事件
	WR_RogueOutlaw_LastSpellTime() --记录上一次使用获得连击点的技能时间
	
	local T102_S3={
    [1]=207234,
    [2]=207235,
    [3]=207236,
    [4]=207237,
    [5]=207239,
	}
	
	local T102_S4={
    [1]=217206,
    [2]=217207,
    [3]=217208,
    [4]=217209,
    [5]=217210,
	}
	
	T102_S3_Count=WR_GetSuit(T102_S3)	--获得10.2套装的数量
	T102_S4_Count=WR_GetSuit(T102_S4)	--获得10.2套装的数量
	if T102_S4_Count>=T102_S3_Count then
		T102Count=T102_S4_Count
	else
		T102Count=T102_S3_Count
	end

	
	GCD=WR_GetGCD("偷袭")	--获得公共冷却剩余时间或者当前施法剩余时间
	CD_DFCC=WR_GetGCD("刀锋冲刺")	--获得 刀锋冲刺 剩余时间
	CD_AYZW=WR_GetGCD("暗影之舞")	--获得暗影之舞剩余时间
	CD_CD=WR_GetGCD("冲动")	--获得冲动冷却剩余时间
	CD_XS=WR_GetGCD("消失")	--获得消失冷却剩余时间
	CD_ZZMX=WR_GetGCD("正中眉心")	--获得正中眉心剩余时间
	CD_GMGJ=WR_GetGCD("鬼魅攻击")	--获得 鬼魅攻击 剩余时间
	CD_MYGT=WR_GetGCD("命运骨骰")	--获得 命运骨骰 剩余时间
	CD_JP=WR_GetGCD("疾跑")	--获得 疾跑 剩余时间
	CD_JRLW=WR_GetGCD("剑刃乱舞")	--获得 剑刃乱舞 剩余时间
	CD_JT=WR_GetGCD("脚踢")	--获得 脚踢 剩余时间
	CD_XHZP=WR_GetGCD("猩红之瓶")	--获得 猩红之瓶 剩余时间
	CD_QX=WR_GetGCD("潜行")	--获得 潜行 剩余时间
	CD_SJ=WR_GetGCD("肾击")	--获得 肾击 剩余时间
	CD_JHJQ=WR_GetGCD("嫁祸诀窍")	--获得 嫁祸诀窍 剩余时间
	CD_ZM=WR_GetGCD("致盲")	--获得 致盲 剩余时间
	CD_YG=WR_GetGCD("佯攻")	--获得 佯攻 剩余时间
	CD_DR=WR_GetGCD("毒刃")	--获得 毒刃 剩余时间

	BuffTime_QX,BuffCount_QX,BuffSum_QX=WR_GetUnitBuffInfo("player","潜行")	--获得潜行Buff信息
	BuffTime_XS,BuffCount_XS,BuffSum_XS=WR_GetUnitBuffInfo("player","消失")	--获得消失Buff信息
	BuffTime_AYZW,BuffCount_AYZW,BuffSum_AYZW=WR_GetUnitBuffInfo("player","暗影之舞")	--获得暗影之舞Buff信息
	BuffTime_GZ,BuffCount_GZ,BuffSum_GZ=WR_GetUnitBuffInfo("player","诡诈")	--获得诡诈Buff信息
	BuffTime_DDWW,BuffCount_DDWW,BuffSum_DDWW=WR_GetUnitBuffInfo("player","胆大妄为")	--获得胆大妄为Buff信息
	BuffTime_LPCDLZ,BuffCount_LPCDLZ,BuffSum_LPCDLZ=WR_GetUnitBuffInfo("player","绿皮船长的柳枝")	--获得绿皮船长的柳枝Buff信息
	BuffTime_CRJZ,BuffCount_CRJZ,BuffSum_CRJZ=WR_GetUnitBuffInfo("player","残忍精准")	--获得残忍精准Buff信息
	BuffTime_QSLJ,BuffCount_QSLJ,BuffSum_QSLJ=WR_GetUnitBuffInfo("player","强势连击")	--获得强势连击Buff信息
	BuffTime_KLHF,BuffCount_KLHF,BuffSum_KLHF=WR_GetUnitBuffInfo("player","骷髅黑帆")	--获得骷髅黑帆Buff信息
	BuffTime_JZDW,BuffCount_JZDW,BuffSum_JZDW=WR_GetUnitBuffInfo("player","精准定位")	--获得精准定位Buff信息
	BuffTime_MCDBZ,BuffCount_MCDBZ,BuffSum_MCDBZ=WR_GetUnitBuffInfo("player","埋藏的宝藏")	--获得埋藏的宝藏Buff信息
	BuffTime_DLD,BuffCount_DLD,BuffSum_DLD=WR_GetUnitBuffInfo("player","大乱斗")	--获得大乱斗Buff信息
	BuffTime_GQTZ,BuffCount_GQTZ,BuffSum_GQTZ=WR_GetUnitBuffInfo("player","灌铅骰子")	--获得灌铅骰子Buff信息
	BuffTime_KCZJ,BuffCount_KCZJ,BuffSum_KCZJ=WR_GetUnitBuffInfo("player","可乘之机")	--获得可乘之机Buff信息
	BuffTime_QG,BuffCount_QG,BuffSum_QG=WR_GetUnitBuffInfo("player","切割")	--获得切割Buff信息
	BuffTime_CD,BuffCount_CD,BuffSum_CD=WR_GetUnitBuffInfo("player","冲动")	--获得冲动Buff信息
	BuffTime_JRLW,BuffCount_JRLW,BuffSum_JRLW=WR_GetUnitBuffInfo("player","剑刃乱舞")	--获得剑刃乱舞Buff信息
	BuffTime_ZZMX,BuffCount_ZZMX,BuffSum_ZZMX=WR_GetUnitBuffInfo("player","正中眉心")	--获得正中眉心Buff信息
	BuffTime_YG,BuffCount_YG,BuffSum_YG=WR_GetUnitBuffInfo("player","佯攻")	--获得 佯攻 Buff信息
	BuffTime_SXYG,BuffCount_SXYG,BuffSum_SXYG=WR_GetUnitBuffInfo("player","速效药膏")	--获得 速效药膏 Buff信息
	BuffTime_ZSYG,BuffCount_ZSYG,BuffSum_ZSYG=WR_GetUnitBuffInfo("player","致伤药膏")	--获得 致伤药膏 Buff信息
	
	BonesBuffCount=BuffCount_CRJZ+BuffCount_QSLJ+BuffCount_KLHF+BuffCount_JZDW+BuffCount_MCDBZ+BuffCount_DLD	--获得骰子BUFF数量

	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	TargetInCombat=WR_TargetInCombat("target")	--获得目标是否在战斗中
	TargetInvincible=WR_Invincible("target")--获取目标是否无敌
	
	PlayerHP=1	--获得自身血量比例
	if UnitHealthMax("player")~=0 then
		PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得自身血量比例
	end

	PlayerInCombat = UnitAffectingCombat("player")	--判断自己是否在战斗中
	if PlayerInCombat then
		OutCombatTime=nil
	elseif OutCombatTime==nil then
		OutCombatTime=GetTime() --获得离开战斗的时间
	end
	
	WR_RogueOutlaw_GetComboPoints()	--获取连击点ComboPoints
	Energy=UnitPower("player",3)	--获得能量的数量
	MaxEnergy=UnitPowerMax("player",3)	--获得最大能量值
	PowerRegen=10*(1+GetHaste()/100)	--获得每秒实际回能，基础回能11/s
	GMGJ_CP=0
	if IsPlayerSpell(196937) and CD_GMGJ==0 then
        --学习鬼魅攻击天赋 并且 鬼魅攻击CD==0	
		GMGJ_CP=1
	end
	
	if IsPlayerSpell(14983) then
		PowerRegen=PowerRegen*1.15
	end
	if IsPlayerSpell(13750) then
		PowerRegen=PowerRegen*1.25
	end
	if BuffTime_CD>0 then
		PowerRegen=PowerRegen*1.6
	end
	if BuffTime_MCDBZ>0 then
		PowerRegen=PowerRegen+5
	end
	
	MaxLatency=WR_GetMaxLatency()	--获得当前最大网络延时
	MaxLatency=MaxLatency*1.5	--为最大网络延时增加阈值
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
	
	if LastCastTime==nil then
		LastCastTime=0
	end
	
	AllowedSpell=false	--允许施法
	if GetTime()-LastCastTime>=0.3 then
		AllowedSpell=true	--允许施法
	end
	
	if FinishTime==nil then
		FinishTime=0
	end
	LastFinishTime=math.ceil((GetTime()-FinishTime)*100)/100
	
	--if IsSpellInRange("偷袭", "target")==1 then	--判断单位在近战范围内
	if WR_GetUnitRange("target")<=8 then	--判断单位在近战范围内
		TargetInCloseRange = true	--判断单位在近战范围内
	else
		TargetInCloseRange = false	--判断单位在近战范围内
	end

	Training=WR_InTraining()	--获得是否在打木桩
	HUCountRangeJZ=WR_GetRangeHarmUnitCount(7)	--获得近战的战斗中敌人数量
	HUCountRange8=WR_GetRangeHarmUnitCount(8)	--获得8码敌人数量
	HUCountRange30=WR_GetRangeHarmUnitCount(30,not(Training))	--获得30码内的敌人数量（如果在打木桩，监测任意单位，如果不在打木桩，只监测战斗中的单位）
	HUCountRange40=WR_GetRangeHarmUnitCount(40,not(Training))
	HUCountRange60=WR_GetRangeHarmUnitCount(60)




	SingleUnit=WR_SingleUnit()	--单体目标判断
	
	StealthEruption=false	--隐身爆发
	if BuffCount_QX>=1 or BuffTime_XS>GCD+Latency or BuffTime_AYZW>GCD+Latency or BuffTime_GZ>GCD+Latency then
    --潜行Buff存在 或 消失Buff时间>公共冷却+网络延时 或 暗影之舞Buff时间>公共冷却+网络延时 或 诡诈Buff时间>公共冷却+网络延时
	--以上条件为爆发期
		StealthEruption=true	--隐身爆发
	end
	
	WaitXS=false
	WaitAYZW=false
	if zhandoumoshi==1 and PlayerInCombat and not(StealthEruption) then
	--爆发 在战斗中 并非(隐身爆发)
	--这段判断的目的是，当前满豆但是消失或暗影之舞还有2秒冷却，并且2秒内不会溢出能量，就不要马上打终结技，可以等消失或者影舞CD好了打高能量的终结技，并且第一时间可以刷新眉心的CD
		if CD_XS>0 and CD_XS<=2+GCD+Latency and CD_XS<CD_AYZW and Energy+CD_XS*PowerRegen<MaxEnergy-PowerRegen*2 then
		--消失冷却<2秒 消失冷却时间<暗影之舞冷却时间 当前能量+消失冷却时间*每秒回能<能量最大值-每秒回能*2
			WaitXS=true
		end
		if CD_AYZW>0 and CD_AYZW<=2+GCD+Latency and CD_AYZW<CD_XS and Energy+CD_AYZW*PowerRegen<MaxEnergy-PowerRegen*2 then
		--暗影之舞冷却<2秒 暗影之舞冷却时间<消失冷却时间 当前能量+暗影之舞冷却时间*每秒回能<能量最大值-每秒回能*2
			WaitAYZW=true
		end
	end
	
	RollTheBones=WR_RogueOutlaw_RollTheBones()	--获取是否重新投骰子
	
	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_RogueOutlawCreateMacroButton() --初始化宏
	end

	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------
	if IsFlying()
	--正在飞行
	or UnitIsDead("player")
	--玩家死亡
	or
	SpellIsTargeting()
	--进行范围选择
	or
	UnitChannelInfo("player")~=nil
	--单位引导施法 存在
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------

	--战斗检测色块窗体
	if PlayerInCombat
	--单位在战斗中
	or
	Training
	--在打木桩
	or
	(
		TargetInCombat
		--目标在战斗
		and
		--IsSpellInRange("影袭","target")==1
		WR_GetUnitRange("target")<=8
		--目标在近战范围
	)
	or
	BuffCount_QX==0
	--潜行不存在,目的是脱战潜行
	or
	BuffCount_XS>0
	--消失存在
	then
	--玩家在战斗中
		WR_CombatFrame:Show() --显示战斗色块窗体
	else
	--玩家不在战斗中
		WR_CombatFrame:Hide() --隐藏战斗色块窗体
	end	
--------------------------------------------------------------------------------------------------
	--爆发或非爆发检测
	if zhandoumoshi~=1 then
		WR_HideColorFrame(1) --隐藏右上色块窗体
		WR_ShowColorFrame("ASF3","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("ASF2","平伤",0) --显示指定色块窗体
	end

--------------------------------------------------------------------------------------------------
	--治疗石
	if WRSet.KT_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.KT_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSJ","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
--------------------------------------------------------------------------------------------------
	--治疗药水
	if WRSet.KT_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.KT_ZLYS/10
	--血量比例<治疗药水设定值/10
	then
		local ZLYS={
		[1]="振奋治疗药水",
		[2]="梦行者治疗药水",
		[3]="凋零梦境药水",
		}
		for _, ZLYS_name in ipairs(ZLYS) do
			local count=GetItemCount(ZLYS_name)
			--获取物品数量
			local start, duration, enable = GetItemCooldown(ZLYS_name)
			--获取物品是否可以使用
			if count~=nil and count>=1 and start+duration-GetTime()<=0 then
			--             物品数量>=1  且  物品可以使用
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSN","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
--------------------------------------------------------------------------------------------------
	--猩红之瓶
	if WRSet.KT_XHZP~=8	
	--猩红之瓶选项不是关闭的
	and
	CD_XHZP<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and PlayerHP<WRSet.KT_XHZP/10
	--血量比例<猩红之瓶设定值/10
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","猩红之瓶",zhandoumoshi) --显示指定色块窗体
		return
	end
--------------------------------------------------------------------------------------------------
	--非战斗准备
	if not(PlayerInCombat) and BuffCount_XS==0 then
	--    玩家不在战斗     且  消失Buff不存在
		--------------------------------------------------------------------------------------
		--脱战切割
		if GCD==0
		--公共冷却==0
		and
		AllowedSpell
		--允许施法
		and
		BuffTime_JRLW>GCD+Latency
		--剑刃剩余时间>公共冷却+网络延时
		and
		ComboPoints>=5
		--连击点>=5
		and
		BuffTime_QG<=(ComboPoints+1)*6*0.3
		--切割剩余时间<=最高可续时
		and
		(
			BuffTime_ZZMX>GCD+Latency
			--正中眉心Buff时间>公共冷却+网络延时
			or
			CD_CD<GCD+Latency
			--冲动CD<公共冷却+网络延时
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF9","脱战切割",zhandoumoshi) --显示指定色块窗体
			return
		end
		--------------------------------------------------------------------------------------
		--脱战乱舞
		if CD_JRLW<=GCD
		--技能冷却
		--and
		--GCD<=ShiFaSuDu
		--公共冷却<施法速度设置
		--and
		and
		not IsPlayerSpell("381878")
		--没学 天赋 [矫捷灵动]
		and
		(
			(
				BuffTime_CD>GCD+Latency
				--冲动Buff持续时间>公共冷却+网络延迟
				and
				GetTime()-OutCombatTime<=1.2
				--离开战斗的时间<=1.2秒
			)
			or
			(
				zhandoumoshi==1
				--爆发
				and
				BuffCount_JRLW==0
				--剑刃乱舞不存在
				and
				(
					CD_CD<=GCD+Latency
					--冲动冷却时间<公共冷却+网络延迟
					or
					BuffTime_CD>GCD+Latency
					--冲动Buff持续时间>公共冷却+网络延迟
				)
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF10","脱战乱舞",zhandoumoshi) --显示指定色块窗体
			return
		end
		--------------------------------------------------------------------------------------
		--脱战冲动
		if CD_CD<=GCD
		--技能冷却
		and
		zhandoumoshi==1
		--爆发
		and
		BuffCount_CD==0
		--冲动Buff不存在
		and
		GCD<=0.5+Latency
		--公共冷却<=0.5+网络延时
		and
		ComboPoints<5
		--连击点<5
		and
		BuffCount_GQTZ==0
		--灌铅骰子不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF3","脱战冲动",zhandoumoshi) --显示指定色块窗体
			return
		end
		--------------------------------------------------------------------------------------
		--脱战潜行
		if CD_QX<=GCD
		--技能冷却
		and
		BuffCount_QX==0
		--潜行Buff不存在
		and
		BuffCount_XS==0
		--消失Buff不存在
		and
		BuffCount_AYZW==0
		--暗影之舞Buff不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF1","脱战潜行",zhandoumoshi) --显示指定色块窗体
			return
		end
		--------------------------------------------------------------------------------------
	end
--------------------------------------------------------------------------------------------------
	--智能目标
	if WRSet.KT_ZNMB==1
	--智能目标开启
	and
	PlayerInCombat
	--玩家在战斗
	and
	HUCountRangeJZ>=1
	--附近单位>=1
	and
	(
		not(TargetInCombat)
		--目标不可被攻击
		or
		--IsSpellInRange("脚踢","target")~=1
		WR_GetUnitRange("target")>8
		--单位在技能范围外
	)
	then
		--目标P1-------------------------------------------------------------------
		if WR_TargetInCombat("party1target")
		--单位可被攻击
		and
		--IsSpellInRange("脚踢","party1target")==1
		WR_GetUnitRange("party1target")<=8
		--单位在技能范围
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF6","目标P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P2-------------------------------------------------------------------
		if WR_TargetInCombat("party2target")
		--单位可被攻击
		and
		--IsSpellInRange("脚踢","party2target")==1
		WR_GetUnitRange("party2target")<=8
		--单位在技能范围
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF7","目标P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P3-------------------------------------------------------------------
		if WR_TargetInCombat("party3target")
		--单位可被攻击
		and
		--IsSpellInRange("脚踢","party3target")==1
		WR_GetUnitRange("party3target")<=8
		--单位在技能范围
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","目标P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P4-------------------------------------------------------------------
		if WR_TargetInCombat("party4target")
		--单位可被攻击
		and
		--IsSpellInRange("脚踢","party4target")==1
		WR_GetUnitRange("party4target")<=8
		--单位在技能范围
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF9","目标P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标-------------------------------------------------------------------
		WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","目标",zhandoumoshi) --显示指定色块窗体
		return
	end
----脚踢----------------------------------------------------------------------------------------------
	if CD_JT<=GCD
	--技能冷却
	and
	BuffCount_QX==0
	--潜行不存在
	then
		--脚踢T
		if (WRSet.KT_JT==1 or WRSet.KT_JT==2)
		--智能 或 目标
		and
		--IsSpellInRange("脚踢","target")==1
		WR_GetUnitRange("target")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSH","脚踢T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--脚踢M
		if WRSet.KT_JT==1
		--智能脚踢
		and
		--IsSpellInRange("脚踢","mouseover")==1
		WR_GetUnitRange("mouseover")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("mouseover",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSY","脚踢M",zhandoumoshi) --显示指定色块窗体
			return
		end
		--脚踢P1
		if WRSet.KT_JT==1
		--智能脚踢
		and
		--IsSpellInRange("脚踢","party1target")==1
		WR_GetUnitRange("party1target")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("party1target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSG","脚踢P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--脚踢P2
		if WRSet.KT_JT==1
		--智能脚踢
		and
		--IsSpellInRange("脚踢","party2target")==1
		WR_GetUnitRange("party2target")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("party2target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF1","脚踢P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--脚踢P3
		if WRSet.KT_JT==1
		--智能脚踢
		and
		--IsSpellInRange("脚踢","party3target")==1
		WR_GetUnitRange("party3target")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("party3target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CST","脚踢P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--脚踢P4
		if WRSet.KT_JT==1
		--智能脚踢
		and
		--IsSpellInRange("脚踢","party4target")==1
		WR_GetUnitRange("party4target")<=8
		--单位在技能范围内
		and
		WR_GetCastInterruptible("party4target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF","脚踢P4",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
----嫁祸----------------------------------------------------------------------------------------------
	if WRSet.KT_JH==1
	--嫁祸开启
	and
	CD_JHJQ<=GCD
	--技能冷却
	and
	BuffCount_QX>0
	--潜行BUFF存在
	and
	not(UnitAffectingCombat("player"))
	--玩家不在战斗中
	and ( ErrorMessageTime_OutOfSight==nil or GetTime()-ErrorMessageTime_OutOfSight>2 )
	--        目标不在视野错误不存在       或     目标不在视野错误出现时间超过2秒
	and
	HUCountRange60>=1
	--60码内有敌人
	then
		--嫁祸焦点
		if UnitGroupRolesAssigned("focus")=="TANK"
		--单位是坦克
		and
		not(UnitIsDead("focus"))
		--单位存活
		and
		--IsSpellInRange("嫁祸诀窍","focus")==1
		WR_GetUnitRange("focus")<=100
		--单位在技能范围内
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF4","嫁祸焦点",zhandoumoshi) --显示指定色块窗体
			return
		end
		--嫁祸P1
		if UnitGroupRolesAssigned("party1")=="TANK"
		--单位是坦克
		and
		not(UnitIsDead("party1"))
		--单位存活
		and
		--IsSpellInRange("嫁祸诀窍","party1")==1
		WR_GetUnitRange("party1")<=100
		--单位在技能范围内
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF6","嫁祸P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--嫁祸P2
		if UnitGroupRolesAssigned("party2")=="TANK"
		--单位是坦克
		and
		not(UnitIsDead("party2"))
		--单位存活
		and
		--IsSpellInRange("嫁祸诀窍","party2")==1
		WR_GetUnitRange("party2")<=100
		--单位在技能范围内
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","嫁祸P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--嫁祸P3
		if UnitGroupRolesAssigned("party3")=="TANK"
		--单位是坦克
		and
		not(UnitIsDead("party3"))
		--单位存活
		and
		--IsSpellInRange("嫁祸诀窍","party3")==1
		WR_GetUnitRange("party3")<=100
		--单位在技能范围内
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","嫁祸P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--嫁祸P4
		if UnitGroupRolesAssigned("party4")=="TANK"
		--单位是坦克
		and
		not(UnitIsDead("party4"))
		--单位存活
		and
		--IsSpellInRange("嫁祸诀窍","party4")==1
		WR_GetUnitRange("party4")<=100
		--单位在技能范围内
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF9","嫁祸P4",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
----致盲----------------------------------------------------------------------------------------------
	if CD_ZM<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	--IsSpellInRange("致盲","mouseover")==1
	WR_GetUnitRange("mouseover")<=20
	--单位在技能范围内
	and
	UnitName("mouseover")=="虚体生物"
	--单位名称是虚体生物
	and
	UnitCastingInfo("mouseover")
	--单位正在施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSU","致盲",zhandoumoshi) --显示指定色块窗体
		return
	end
----佯攻----------------------------------------------------------------------------------------------
	if WRSet.KT_YG==1
	--佯攻开启
	and
	CD_YG<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	BuffCount_YG==0
	--佯攻BUFF不存在
	and
	(
		WR_ResistSustained()	--持续型AOE伤害存在
		or
		WR_ResistOutburstTime()<=3	--尖刺型AOE伤害来临时间
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSV","佯攻",zhandoumoshi) --显示指定色块窗体
		return
	end
----毒刃----------------------------------------------------------------------------------------------
	if WRSet.KT_DR==1
	--毒刃开启
	and
	WR_SpellUsable("毒刃")
	--技能可用 资源可用
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	--IsSpellInRange("毒刃","target")==1
	WR_GetUnitRange("target")<=8
	--单位在技能范围内
	and
	WR_UnitEnragedBuff("target")
	--单位身上有激怒效果
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSZ","毒刃",zhandoumoshi) --显示指定色块窗体
		return
	end
----速效药膏----------------------------------------------------------------------------------------------
	if BuffCount_SXYG==0
	--速效药膏BUFF不存在
	and
	BuffCount_ZSYG==0
	--致伤药膏BUFF不存在
	and
	UnitCastingInfo("player")==nil
	--没有正在施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSI","速效药膏",zhandoumoshi) --显示指定色块窗体
		return
	end
----肾击----------------------------------------------------------------------------------------------
	if WRSet.KT_SJ==1
	--肾击开启
	and
	CD_SJ<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	ComboPoints>=5
	--连击点>=5
	then
		--肾击T
		--if IsSpellInRange("肾击","target")==1 and WR_StunSpell("target") then
		if WR_GetUnitRange("target")<=8 and WR_StunSpell("target") then
		--         单位在技能范围内           且       需要击晕单位
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF7","肾击T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--肾击M
		--if IsSpellInRange("肾击","mouseover")==1 and WR_StunSpell("mouseover") then
		if WR_GetUnitRange("mouseover")<=8 and WR_StunSpell("mouseover") then
		--         单位在技能范围内              且       需要击晕单位
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AF12","肾击M",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--致盲-------------------------------------------------------------------------------------------
	if WRSet.KT_ZM==1
	--致盲 开启
	and
	IsPlayerSpell(2094)
	--已学天赋[致盲]
	and
	WR_GetGCD("致盲")<=GCD
	--技能冷却
	and
	(
		(
			--IsSpellInRange("致盲","target")==1
			WR_GetUnitRange("target")<=20
			--目标在技能范围
			and
			WR_StunSpell("target")
			--击晕施法
		)
		or
		(
			WR_GetUnitRange("target")<10
			--目标距离
			and
			IsPlayerSpell(200733)
			--已学习 [刺激弥散]
			and
			WR_StunUnit(10)
			--范围击晕施法
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSU","致盲",zhandoumoshi) --显示指定色块窗体
		return
	end
	--致盲-------------------------------------------------------------------------------------------
	
----目标无敌检测，如果目标无敌，就不要输出了----------------------------------------------------------------------------------------------
	if TargetInvincible then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----以下为输出技能----------------------------------------------------------------------------------------------

----爆发技能及手段----------------------------------------------------------------------------------------------

	if WR_RogueOutlaw_SYJY()
	--时运继延 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF1","时运",zhandoumoshi) --显示指定色块窗体
		return
	end

	if zhandoumoshi==1
	--爆发
	and
	TargetInCloseRange
	--目标在近战范围内
	and
	PlayerInCombat
	--在战斗中
	and
	ComboPoints>=5
	--连击点>=5
	and
	CD_ZZMX<=GCD+Latency
	--正中眉心CD<=公共冷却+网络延时
	and
	BuffTime_CD>GCD+Latency
	--冲动Buff时间>公共冷却+网络延时
	and
	(
		CD_XS<GCD+Latency
		--消失冷却<公共冷却+网络延时
		or
		CD_AYZW<GCD+Latency
		--暗影之舞冷却<公共冷却+网络延时
	)
	then
		--血性狂怒 狂暴
		if (IsPlayerSpell(20572) and WR_GetGCD("血性狂怒")<=GCD) or (IsPlayerSpell(26297) and WR_GetGCD("狂暴")<=GCD) then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF5","种族天赋",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1
		if (WRSet.KT_SP==1 or WRSet.KT_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		------------------------------------------------------------------------------------------
		--饰品2
		if (WRSet.KT_SP==2 or WRSet.KT_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF12","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		------------------------------------------------------------------------------------------
		--爆发药水
		if WRSet.KT_BFYS==1 then
			local BFYS={
			[1]="飞逝元素究极强能药水",
			[2]="元素究极强能药水",
			[3]="元素强能药水",
			}
			local BFYS_ID
			for _, BFYS_name in ipairs(BFYS) do
				local count=GetItemCount(BFYS_name)
				--获取物品数量
				local start, duration, enable = GetItemCooldown(BFYS_name)
				--获取物品是否可以使用
				if count~=nil and count>=1 and start+duration-GetTime()<=0 then
				--             物品数量>=1  且  物品可以使用
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ASF12","爆发药水",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
		end
	end
	
	------------------------------------------------------------------------------------------
	--饰品1
	if zhandoumoshi==1
	--爆发
	and (WRSet.KT_SP==1 or WRSet.KT_SP==3)
	--使用1号饰品 或 使用1-2号饰品
	and BuffCount_QX==0
	--不在潜行
	and GetInventoryItemID("player", 13)==158319
	--1号饰品是点金石
	and WR_GetEquipCD(13)
	--1号饰品可以使用
	and GCD>0.3
	--公共冷却时间>0.3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","饰品1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--饰品2
	if zhandoumoshi==1
	--爆发
	and (WRSet.KT_SP==2 or WRSet.KT_SP==3)
	--使用2号饰品 或 使用1-2号饰品
	and BuffCount_QX==0
	--不在潜行
	and GetInventoryItemID("player", 14)==158319
	--1号饰品是点金石
	and WR_GetEquipCD(14)
	--1号饰品可以使用
	and GCD>0.3
	--公共冷却时间>0.3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF12","饰品2",zhandoumoshi) --显示指定色块窗体
		return
	end
--[[
	--鬼魅攻击
	if IsPlayerSpell(196937)
	--学习鬼魅攻击天赋 
	and
	CD_GMGJ<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	zhandoumoshi==1
	and
	TargetInCloseRange
	--目标在近战范围内
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF10","鬼魅攻击",zhandoumoshi) --显示指定色块窗体
		return
	end
]]
	------------------------------------------------------------------------------------------
	--消失
	if CD_XS<=GCD
	--技能冷却
	and
	zhandoumoshi==1
	--爆发
	and
	PlayerInCombat
	--在战斗中
	and
	TargetInCloseRange
	--目标在近战范围内
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	BuffTime_QG>=1
	--切割Buff时间>=1
	and
	BuffTime_CD>Latency
	--冲动Buff时间>网络延时
	and
	BuffTime_CD<GCD+Latency
	--冲动Buff时间>公共冷却+网络延时
	and
	CD_CD>ComboPoints+GCD+Latency+1
	--冲动CD>当前豆子+公共冷却+网络延时+1
	--------------------
	--这个图标的目的是在冲动结束之前，而下一个冲动冷却超过一定时间，用来续冲动的
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","消失",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--冲动
	if CD_CD<=GCD
	--技能冷却
	and
	zhandoumoshi==1
	--爆发
	and
	(
		GCD<=ShiFaSuDu
		--公共冷却<施法速度设置
		or
		GetTime()-FinishTime<0.5
		--终结技施法0.5s内
	)
	and
	(
		BuffTime_CD<GCD+Latency
		--冲动Buff持续时间<公共冷却+网络延时
		or
		CD_XS<GCD+Latency
		--消失冷却时间<公共冷却+网络延时
		or
		CD_AYZW<GCD+Latency
		--暗影之舞冷却时间<公共冷却+网络延时
		or
		BuffCount_QX>=1
		--潜行Buff存在
		or
		BuffTime_XS>GCD+Latency
		--消失Buff时间>公共冷却+网络延时
		or
		BuffTime_AYZW>GCD+Latency
		--暗影之舞Buff时间>公共冷却+网络延时
	)
	and
	ComboPoints<5
	--连击点<5
	and
	--IsSpellInRange("正中眉心", "target")==1
	WR_GetUnitRange("target")<=40
	--目标在40码内
	and
	BuffCount_GQTZ==0
	--灌铅骰子不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","冲动",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--疾跑
	if CD_JP<=GCD
	--技能冷却
	and
	WRSet.KT_JP~=3
	--疾跑开关=关闭
	and
	(
		(
			--not(IsSpellInRange("致盲", "target")==1)
			WR_GetUnitRange("target")>20
			--目标在20码外
			and
			--IsSpellInRange("正中眉心", "target")==1
			WR_GetUnitRange("target")<=30
			--目标在30码内
		)
		or
		(
			WRSet.KT_JP==2
			--疾跑开关=常驻
			and
			PlayerInCombat
			--玩家在战斗
			and
			GCD>0.4
			--公共冷却时间>0.4
		)
	)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSC","疾跑",zhandoumoshi) --显示指定色块窗体
			return
		end
	------------------------------------------------------------------------------------------
	--命运骨骰
	if CD_MYGT<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	RollTheBones
	--重新投骰子
	and
	(
		--IsSpellInRange("正中眉心", "target")==1
		WR_GetUnitRange("target")<=30
		--目标在30码内
		or
		HUCountRange30>=1
		--30码内单位数量>=1
		or
		PlayerInCombat
		--自己在战斗
		or
		WR_PartyInCombat()
		--队伍在战斗
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","命运骨骰",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	if not(TargetInCombat)
	--目标不在战斗，不要做任何事情
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--剑刃乱舞
	if CD_JRLW<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	(
		(
			--IsSpellInRange("正中眉心", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
			and
			(
				TargetInCombat
				--目标在战斗中
				or
				BuffCount_QX==0
				--潜行Buff不存在
			)
		)
		or
		--not(IsSpellInRange("正中眉心", "target")==1)
		WR_GetUnitRange("target")>30
		--目标距离>30码
	)
	and
	BuffTime_JRLW<GCD+Latency
	--剑刃乱舞Buff持续时间<公共冷却+网络延迟
	and
	(
		HUCountRangeJZ>=2
		--近战单位>=2
		or
		(
			BuffTime_CD>GCD+Latency
			--冲动Buff持续时间>公共冷却+网络延迟
			and
			not(StealthEruption)
			--非隐身爆发期间
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","剑刃乱舞",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--消失眉心
	if CD_ZZMX<=GCD
	--技能冷却
	and
	CD_XS<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	zhandoumoshi==1
	--爆发
	and
	PlayerInCombat
	--在战斗中
	and
	ComboPoints>=5-GMGJ_CP
	--连击点>=5-鬼魅攻击连击点
	and
	(
		(
			HUCountRange40==1
			--40码战斗中的敌人数量==1
			and
			--IsSpellInRange("正中眉心", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
		)
		or
		TargetInCloseRange
		--目标在近战范围内
	)
	and
	CD_ZZMX<=GCD+Latency
	--正中眉心CD<=公共冷却+网络延时
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	(
		BuffTime_CD>GCD+Latency
		--冲动Buff时间>公共冷却+网络延时
		or
		CD_AYZW<(CD_CD-ComboPoints)/4+18
		--暗影之舞冷却时间<(冲动冷却时间-连击点)/4+18秒
	)
	then
		if Energy<80 then
		--如果能量<80，等能量再进爆发
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","消失眉心",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--影舞眉心
	if CD_ZZMX<=GCD
	--技能冷却
	and
	CD_AYZW<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	zhandoumoshi==1
	--爆发
	and
	PlayerInCombat
	--在战斗中
	and
	ComboPoints>=5-GMGJ_CP
	--连击点>=5-鬼魅攻击连击点
	and
	(
		(
			HUCountRange40==1
			--40码战斗中的敌人数量==1
			and
			--IsSpellInRange("正中眉心", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
		)
		or
		TargetInCloseRange
		--目标在近战范围内
	)
	and
	CD_ZZMX<=GCD+Latency
	--正中眉心CD<=公共冷却+网络延时
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	CD_XS>0 and CD_XS<114
	--消失CD>0 并且 消失CD<114
	and
	(
		BuffTime_CD>GCD+Latency
		--冲动Buff时间>公共冷却+网络延时
		or
		CD_XS<=CD_CD
		--消失的CD<=冲动的CD
		or
		(CD_CD>30 and CD_XS-CD_CD<7)
		--冲动的CD>30秒 并且 消失CD-冲动CD<7秒 
	)
	and
	CD_XS>ComboPoints+GCD+Latency+2
	--消失冷却时间>连击点+GCD+网络延迟+2
	then
		if Energy<80 then
		--如果能量<80，等能量再进爆发
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","影舞眉心",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--正中眉心
	if CD_ZZMX<=GCD
	--技能冷却
	and
	not(WaitXS)
	--不需要等待消失冷却
	and
	not(WaitAYZW)
	--不需要等待暗影之舞冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints>=5
	--连击点>=5
	and
	(
		(
			HUCountRange40==1
			--40码战斗中的敌人数量==1
			and
			--IsSpellInRange("正中眉心", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
		)
		or
		TargetInCloseRange
		--目标在近战范围内
	)
	and
	(
		StealthEruption
		--隐身爆发期间
		or
		(
			zhandoumoshi==1
			--爆发
			and
			CD_XS>45+GCD+Latency
			--消失冷却时间>45+公共冷却+网络延时
			and
			CD_AYZW>15
			--暗影之舞冷却时间>15
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","正中眉心",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--切割
	if not(WaitXS)
	--不需要等待消失冷却
	and
	not(WaitAYZW)
	--不需要等待暗影之舞冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	--IsSpellInRange("正中眉心", "target")==1
	WR_GetUnitRange("target")<=30
	--目标距离<=30码
	and
	ComboPoints>=5
	--连击点>=5
	and
	BuffTime_QG<=(ComboPoints+1)*6*0.3
	--切割剩余时间<=最高可续时
	and
	(
		(
			not(PlayerInCombat)
			--没有战斗
			and
			BuffTime_ZZMX>GCD+Latency
			--有正中眉心Buff
		)
		or
		(
			not(StealthEruption)
			--非隐身爆发期间
			and
			(
				zhandoumoshi==0
				--爆发
				or
				(
					zhandoumoshi==1
					--爆发
					and
					CD_XS>GCD+Latency
					--消失不可用
					and
					CD_AYZW>GCD+Latency
					--暗影之舞不可用
				)
			)
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF9","切割",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--斩击
	if not(WaitXS)
	--不需要等待消失冷却
	and
	not(WaitAYZW)
	--不需要等待暗影之舞冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	TargetInCloseRange
	--目标在近战范围内
	and
	ComboPoints>=5
	--连击点>=5
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","斩击",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--必打手枪
	if GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	and
	(
		(
			HUCountRange40==1
			--20码战斗中的敌人数量==1
			and
			--IsSpellInRange("手枪射击", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
		)
		or
		TargetInCloseRange
		--目标在近战范围内
	)
	and
	BuffCount_KCZJ>=3
	--可乘之机数量>=3
	and
	(
		BuffTime_KCZJ<=2+GCD+Latency
		--可乘之机时间<=2+公共冷却+网络延时
		or
		BuffCount_KCZJ>=6
		--可乘之机层数>=6
		or
		BuffTime_LPCDLZ>GCD+Latency
		--绿皮船长BUFF>公共冷却+网络延时
		or
		(
			AvgDeathTime<3
			--整场战斗结束时间<3秒
			and
			not(Training)
			--不在打木桩
		)
		--以上条件必须打出手枪射击
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","必打手枪",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--申斥回响
	if WR_SpellIsCD("385616")
	--技能可用
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF10","申斥回响",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	--乱舞满豆
	if IsPlayerSpell("381878")
	--已学 天赋 [矫捷灵动]
	and
	CD_JRLW<=GCD
	--技能冷却
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	BuffCount_QX==0
	--潜行Buff不存在
	and
	ComboPoints<=2
	--连击点<=2
	and
	ComboPoints+HUCountRange8>=5
	--当前连击点+8码敌人数量>=5
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","乱舞满豆",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--伏击满豆
	if IsPlayerSpell("383281")
	--已学 天赋 [藏锋寻时]
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	and
	TargetInCloseRange
	--目标在近战范围内
	and
	(
		StealthEruption
		--隐身爆发期间
		or
		BuffTime_DDWW>GCD+Latency
		--胆大妄为Buff时间>公共冷却+网络延时
	)
	and
	(
		(
			ComboPoints>=1
			--连击点>=1
			and
			BuffTime_QSLJ>GCD+Latency
			--强势连击Buff时间>公共冷却+网络延时
		)
		or
		ComboPoints>=2
		--以上条件必然5星+
	)
	and
	(
		not(StealthEruption)
		--非隐身爆发期间
		or
		(
			StealthEruption
			--隐身爆发期间
			and
			Energy>50+25-PowerRegen*0.8
			--能量>50+25-每秒回能*0.8
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","伏击满豆",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--影袭满豆
	if GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	and
	TargetInCloseRange
	--目标在近战范围内
	and
	(
		not(
			StealthEruption
			--隐身爆发期间
			and
			IsPlayerSpell("383281")
			--已学 天赋 [藏锋寻时]
		)
		and
		BuffTime_DDWW<GCD+Latency
		--胆大妄为Buff时间<公共冷却+网络延时
	)
	and
	(
		(
			ComboPoints>=3
			--连击点>=3
			and
			BuffTime_QSLJ>GCD+Latency
			--强势连击Buff时间>公共冷却+网络延时
		)
		or
		ComboPoints>=4
		--以上条件必然5星+
	)
	and
	(
		not(StealthEruption)
		--非隐身爆发期间
		or
		(
			StealthEruption
			--隐身爆发期间
			and
			Energy>50+25-PowerRegen*0.8
			--能量>50+25-每秒回能*0.8
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF6","影袭满豆",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--手枪射击
	if GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	and
	(
		(
			HUCountRange40==1
			--20码战斗中的敌人数量==1
			and
			--IsSpellInRange("手枪射击", "target")==1
			WR_GetUnitRange("target")<=30
			--目标距离<=30码
		)
		or
		TargetInCloseRange
		--目标在近战范围内
	)
	and
	BuffCount_KCZJ>=3
	--可乘之机数量>=3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","手枪射击",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--伏击
	if IsPlayerSpell("383281")
	--已学 天赋 [藏锋寻时]
	and
	TargetInCloseRange
	--单位在近战范围内
	and
	GCD<=ShiFaSuDu
	--公共冷却<施法速度设置
	and
	AllowedSpell
	--允许施法
	and
	ComboPoints<=4
	--连击点<=4
	and
	(
		StealthEruption
		--隐身爆发期间
		or
		BuffTime_DDWW>GCD+Latency
		--胆大妄为Buff时间>公共冷却+网络延时
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","伏击",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--消失伏击
	if IsPlayerSpell("383281")
	--已学 天赋 [藏锋寻时]
	and
	TargetInCloseRange
	--单位在近战范围内
	and CD_XS<=GCD
	--技能冷却
	and GCD==0
	--公共冷却==0秒
	and AllowedSpell
	--允许施法
	and ComboPoints<=4
	--连击点<=4
	and not(StealthEruption)
	--非隐身爆发期间
	and BuffTime_DDWW<GCD+Latency
	--胆大妄为Buff时间<公共冷却+网络延时
	and Energy>=50
	--能量>=50
	and zhandoumoshi==1
	--爆发
	and PlayerInCombat
	--在战斗中
	and
	(
		ComboPoints==2
		--连击点==2
		or
		(
			ComboPoints==3
			--连击点==3
			and
			BuffTime_QSLJ<GCD+Latency
			--强势连击Buff时间<公共冷却+网络延时
			and
			BuffTime_KLHF<GCD+Latency
			--骷髅黑帆Buff时间<公共冷却+网络延时
		)
		--以上情况均无法通过一次影袭满豆，但通过一次伏击可以
	)
	and
	(
		BuffTime_CD>GCD+Latency
		--冲动Buff时间>公共冷却+网络延时
		or
		(
			CD_CD>ComboPoints+GCD+Latency+1
			--冲动CD>当前豆子+公共冷却+网络延时+1
			and
			CD_AYZW<(CD_CD-ComboPoints)/4+18
			--暗影之舞冷却时间<(冲动冷却时间-连击点)/4+18秒
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","消失伏击",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--影舞伏击
	if IsPlayerSpell("383281")
	--已学 天赋 [藏锋寻时]
	and
	TargetInCloseRange
	--单位在近战范围内
	and CD_AYZW<=GCD
	--技能冷却
	and GCD==0
	--公共冷却==0秒
	and AllowedSpell
	--允许施法
	and ComboPoints<=4
	--连击点<=4
	and not(StealthEruption)
	--非隐身爆发期间
	and BuffTime_DDWW<GCD+Latency
	--胆大妄为Buff时间<公共冷却+网络延时
	and Energy>=50
	--能量>=50
	and zhandoumoshi==1
	--爆发
	and PlayerInCombat
	--在战斗中
	and
	(
		ComboPoints==2
		--连击点==2
		or
		(
			ComboPoints==3
			--连击点==3
			and
			BuffTime_QSLJ<GCD+Latency
			--强势连击Buff时间<公共冷却+网络延时
			and
			BuffTime_KLHF<GCD+Latency
			--骷髅黑帆Buff时间<公共冷却+网络延时
		)
		--以上情况均无法通过一次影袭满豆，但通过一次伏击可以
	)
	and CD_XS>0 and CD_XS<114
	--消失CD>0 并且 消失CD<114
	and
	(
		BuffTime_CD>GCD+Latency
		--冲动Buff时间>公共冷却+网络延时
		or
		(
			CD_CD>ComboPoints+GCD+Latency+1
			--冲动CD>当前豆子+公共冷却+网络延时+1
			and
			(
				CD_XS<=CD_CD
				--消失的CD<=冲动的CD
				or
				(CD_CD>30 and CD_XS-CD_CD<7)
				--冲动的CD>30秒 并且 消失CD-冲动CD<7秒 
			)
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF2","影舞伏击",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------
	--影袭
	if TargetInCloseRange
	--单位在近战范围内
	and
	(
		(
			IsPlayerSpell(383281)
			--已学 藏锋寻时
			and
			GCD==0
			--公共冷却时间==0
		)
		or
		(
			not IsPlayerSpell(383281)
			--没学 藏锋寻时
			and
			GCD<=ShiFaSuDu
			--公共冷却<施法速度设置
		)
	)
	and AllowedSpell
	--允许施法
	and ComboPoints<=4
	--连击点<=4
	and
	not(
		StealthEruption
		--隐身爆发期间
		and
		IsPlayerSpell("383281")
		--已学 天赋 [藏锋寻时]
	)
	and BuffTime_DDWW<GCD+Latency
	--胆大妄为Buff时间<公共冷却+网络延时
	and Energy>=50
	--能量>=50
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF6","影袭",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------	------------------------------------------------------------------------------------------
	--刀锋冲刺
	if IsPlayerSpell(271877)
	--已学 刀锋冲刺 天赋
	and CD_DFCC<=GCD
	--技能冷却
	and TargetInCloseRange
	--单位在近战范围内
	and GCD==0
	--公共冷却时间==0
	and AllowedSpell
	--允许施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF6","刀锋冲刺",zhandoumoshi) --显示指定色块窗体
		return
	end
	------------------------------------------------------------------------------------------

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
		if SystemTime~=nil then
			--SystemTime=GetTime()
		end
		print("刷新骨骰:",RollTheBones,"，连击点:",ComboPoints)
		print("隐身爆发:",StealthEruption,"，等待消失:",WaitXS,"，等待暗影之舞:",WaitAYZW)
		print("公共冷却时间:",math.ceil(GCD*100)/100,"，系统刷新时间：",math.ceil((GetTime()-SystemTime)*10000)/10000)
		print("----------")
	end


end

--战斗错误事件
function WR_RogueOutlaw_ErrorMessage()
	if WR_ErrorMessageInfo~=true then --只执行一次
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("UI_ERROR_MESSAGE")
		frame:SetScript("OnEvent", function(self, event, messageType, message)
			if string.find(message, "目标不在视野中") then
				ErrorMessageTime_OutOfSight=GetTime()
				return
			end
		end)
		WR_ErrorMessageInfo=true --只执行一次，记录已经执行
	end
end

function WR_RogueOutlaw_GetComboPoints()
	ComboPoints=UnitPower("player",4)	--获得连击点的数量

	if ComboPoints<5 then
		if (CD_Time~=nil and GetTime()-CD_Time<0.6+Latency)
		--刚刚 施放 冲动
		or (SQSJ_Time~=nil and GetTime()-SQSJ_Time<0.6+Latency )
		--刚刚 施放 手枪射击
		or ComboPoints==3 and WR_GetUnitBuffInfo("player",323559)~=0
		--连击点==3 并且 申斥回响3点BUFF存在
		or ComboPoints==4 and WR_GetUnitBuffInfo("player",323560)~=0
		--连击点==4 并且 申斥回响4点BUFF存在
		then
			ComboPoints=5
			--print("公共冷却：",GCD)
		end
	end
end

function WR_RogueOutlaw_RollTheBones()
	local MaxBonesCount=BuffCount_CRJZ+BuffCount_JZDW+BuffCount_QSLJ+BuffCount_MCDBZ+BuffCount_KLHF+BuffCount_DLD
	local BestBonesCount
	local MaxBonesName=""
	local MaxBonesTime=0

	local BestBonesName=""
	local BestBonesTime=0
	local MinBestBonesName=""
	local MinBestBonesTime=0
	
	if HUCountRangeJZ<=1 or SingleUnit then
		BestBonesCount=BuffCount_QSLJ+BuffCount_KLHF+BuffCount_CRJZ+BuffCount_JZDW
	else
		BestBonesCount=BuffCount_QSLJ+BuffCount_KLHF+BuffCount_CRJZ+BuffCount_JZDW+BuffCount_DLD
	end	
	
	if BuffTime_QSLJ>MaxBonesTime then
		MaxBonesName="强势连击"
		MaxBonesTime=BuffTime_QSLJ
		BestBonesName="强势连击"
		BestBonesTime=BuffTime_QSLJ
	end
	
	if BuffTime_CRJZ>MaxBonesTime then
		MaxBonesName="残忍精准"
		MaxBonesTime=BuffTime_CRJZ
		BestBonesName="残忍精准"
		BestBonesTime=BuffTime_CRJZ
	end

	if BuffTime_KLHF>MaxBonesTime then
		MaxBonesName="骷髅黑帆"
		MaxBonesTime=BuffTime_KLHF
		BestBonesName="骷髅黑帆"
		BestBonesTime=BuffTime_KLHF
	end

	if BuffTime_DLD>MaxBonesTime then
		MaxBonesName="大乱斗"
		MaxBonesTime=BuffTime_DLD
		if HUCountRangeJZ>1 and not(SingleUnit) then
			BestBonesName="大乱斗"
			BestBonesTime=BuffTime_DLD
		end
	end
	
	if BuffTime_JZDW>MaxBonesTime then
		MaxBonesName="精准定位"
		MaxBonesTime=BuffTime_JZDW
		BestBonesName="精准定位"
		BestBonesTime=BuffTime_JZDW
	end
	
	if BuffTime_MCDBZ>MaxBonesTime then
		MaxBonesName="埋藏的宝藏"
		MaxBonesTime=BuffTime_MCDBZ
	end
	
	-----------------------------------------------------
	MinBestBonesTime=BestBonesTime
	
	if BuffTime_QSLJ>0 and BuffTime_QSLJ<MinBestBonesTime then
		MinBestBonesName="强势连击"
		MinBestBonesTime=BuffTime_QSLJ
	end

	if BuffTime_CRJZ>0 and BuffTime_CRJZ<MinBestBonesTime then
		MinBestBonesName="残忍精准"
		MinBestBonesTime=BuffTime_CRJZ
	end
	
	if BuffTime_KLHF>0 and BuffTime_KLHF<MinBestBonesTime then
		MinBestBonesName="骷髅黑帆"
		MinBestBonesTime=BuffTime_KLHF
	end

	if BuffTime_DLD>0 and BuffTime_DLD<MinBestBonesTime then
		if HUCountRangeJZ>1 and not(SingleUnit) then
			MinBestBonesName="大乱斗"
			MinBestBonesTime=BuffTime_DLD
		end
	end
	
	--print("全部BUFF数量:",MaxBonesCount)
	--print("最佳BUFF数量:",BestBonesCount)
	--print("最大BUFF时间:",MaxBonesTime)
	--print("最佳BUFF时间:",BestBonesTime)
	--print("最小的优质BUFF时间:",MinBestBonesTime)
	
    if BuffTime_XS>GCD+Latency or BuffTime_AYZW>GCD+Latency or BuffTime_GZ>GCD+Latency then
    --消失Buff时间>公共冷却+网络延时 并且 暗影之舞Buff时间>公共冷却+网络延时 并且 诡诈Buff时间>公共冷却+网络延时
	--爆发期间不补BUFF
		return false
	end
	
	if MaxBonesCount==0 then
	--BUFF数量==0的时候
		if MSG==1 then print("骰子方案0") end
		return true
	end
	
	if MaxBonesCount<=1 and (BestBonesCount==0 or T102Count>=4 or (MaxBonesTime<=9 and BuffCount_GQTZ>=1)) then
	--BUFF数量<=1的时候 并且 (最佳BUFF数量=0 或者 10.2四件套 或者 (最大BUFF时间<=9 并且 灌铅骰子存在))
		if MSG==1 then print("骰子方案1") end
		return true
	end
	
	if MaxBonesCount<=1 and T102Count>=4 then
	--BUFF数量<=1的时候
		if MSG==1 then print("骰子方案1") end
		return true
	end
	
	if MaxBonesTime<=1+GCD+Latency*2 and T102Count>=4 then
	--BUFF最大持续时间<=1秒
		if MSG==1 then print("骰子方案2") end
		return true
	end
	

--[[	
	if MaxBonesCount==2 and BestBonesCount==0 then
	--BUFF数量==2 并且 最佳骰子数量=0
		return true
	end
	--]]
	
	if MaxBonesCount==2 and T102Count>=4 then
	--BUFF数量==2
		if BuffCount_GQTZ>=1 then
		--灌铅骰子存在
			if MSG==1 then print("骰子方案3") end
			return true
		end
		if MaxBonesTime<=10+GCD+Latency then
		--最大BUFF时间<=10秒
			if BestBonesCount<=1 then
			--最好的BUFF数量<=1
				if MSG==1 then print("骰子方案4") end
				return true
			end
			if BestBonesTime<=1+GCD+Latency*2 then
			--最好的BUFF最大持续时间<=1秒
				if MSG==1 then print("骰子方案5") end
				return true
			end
		end
	end

	if MaxBonesCount==3 and T102Count>=4 then
	--BUFF数量==3
		if MaxBonesTime<=10+GCD+Latency then
		--最大BUFF时间<=10秒
			if BuffCount_GQTZ>=1 then
			--灌铅骰子存在
				if BestBonesCount<=1 then
				--最好的BUFF数量<=1
					if MSG==1 then print("骰子方案6") end
					return true
				end
				if BestBonesTime<=1+GCD+Latency*2 then
				--最好的BUFF最大持续时间<=1秒
					if MSG==1 then print("骰子方案7") end
					return true
				end
				if BestBonesCount<=2 and MinBestBonesTime<=1+GCD+Latency*2 then
				--优质BUFF<=2 and 最小优质BUFF时间<=1秒 (这种情况就是3BUFF，1~2个优质，但是其中或唯一的那个优质BUFF时间快结束了，可以保证下一个ROLL出2/3的优质)
					if MSG==1 then print("骰子方案8") end
					return true
				end
			end
			if MaxBonesTime>BestBonesTime then
			--最大BUFF时间>最佳BUFF时间，说明3个BUFF但是优质BUFF更快结束
				if MSG==1 then print("骰子方案9") end
				return true
			end
		end
	end
	
	if MaxBonesCount==4 and T102Count>=4 then
	--BUFF数量==4
		if MaxBonesTime<=9+GCD+Latency then
		--最大BUFF时间<=9秒
			if BuffCount_GQTZ>=1 then
			--灌铅骰子存在
				if MaxBonesTime>BestBonesTime then
				--最大BUFF时间>最佳BUFF时间，说明3个BUFF但是优质BUFF更快结束
					if MSG==1 then print("骰子方案10") end
					return true
				end
				if BestBonesTime<=1+GCD+Latency*2 then
				--最好的BUFF最大持续时间<=1秒
					if MSG==1 then print("骰子方案11") end
					return true
				end
			end
		end
	end

	if zhandoumoshi==1 then
	--开爆发
		if MaxBonesTime<=9+GCD+Latency then
		--最大BUFF时间<=9秒
				if CD_XS<2 and MaxBonesTime-CD_XS<=8+GCD+Latency*2 and (MaxBonesCount==1 or T102Count>=4) then
				--消失2秒内冷却 并且 最大BUFF时间-消失时间<=8秒 并且 (最大骰子数量==1 或者 10.2四件套>=4)
					if MSG==1 then print("骰子方案12") end
					return true
				end
				if CD_AYZW<2 and MaxBonesTime-CD_AYZW<=8+GCD+Latency*2 and (MaxBonesCount==1 or T102Count>=4) then
				--暗影之舞2秒内冷却 并且 最大BUFF时间-消失时间<=8秒 并且 (最大骰子数量==1 或者 10.2四件套>=4)
					if MSG==1 then print("骰子方案13") end
					return true
				end
		end
	end
	
	if SYJY_Time~=nil and GetTime()-SYJY_Time<30
	--最后一次使用时运的时间在30秒之内
	and
	BuffTime_GQTZ>GCD
	--灌铅骰子 BUFF存在
	and
	BonesBuffCount<6
	--骰子BUFF小于6个
	and
	BuffTime_CRJZ<39
	--残忍精准 BUFF时间<39秒
	and
	BuffTime_QSLJ<39
	--强势连击 BUFF时间<39秒
	and
	BuffTime_KLHF<39
	--骷髅黑帆 BUFF时间<39秒
	and
	BuffTime_JZDW<39
	--精准定位 BUFF时间<39秒
	and
	BuffTime_MCDBZ<39
	--埋藏的宝藏 BUFF时间<39秒
	and
	BuffTime_DLD<39
	--大乱斗 BUFF时间<39秒
	then
		if MSG==1 then print("骰子方案14") end
		return true
	end
	return false
end


--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_RogueOutlaw_LastSpellTime()
	if LastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			WR_RogueOutlaw_GetComboPoints()	--获取连击点
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="冲动" then
					--释放成功的技能名称
						CD_Time=GetTime()
					end
					if SpellName=="手枪射击" then
					--释放成功的技能名称
						if SQSJ_Sum==nil then
						--初始化手枪射击的射击次数
							SQSJ_Sum=0
						end
						SQSJ_Sum=SQSJ_Sum+1
						if SQSJ_Sum==1 then
						--如果是手枪射击的第一次攻击，记录时间
							SQSJ_Time=GetTime()
							LastCastTime=GetTime()	--记录最后一次施法时间
						end
					end
					if SpellName=="正中眉心" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						CD_Time=nil
						FinishTime=GetTime()	--记录终结技时间
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="切割" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						CD_Time=nil
						FinishTime=GetTime()	--记录终结技时间
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="斩击" and (LastCastTime==nil or GetTime()-LastCastTime>0.5) then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						CD_Time=nil
						FinishTime=GetTime()	--记录终结技时间
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="偷袭" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="肾击" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="切割" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="剑刃乱舞" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="命运骨骰" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
						MYGT_CastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="佯攻" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="毒刃" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="影袭" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="伏击" then
					--释放成功的技能名称
						SQSJ_Sum=0
						SQSJ_Time=nil
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="刀锋冲刺" then
					--释放成功的技能名称
						LastCastTime=GetTime()	--记录最后一次施法时间
					end
					if SpellName=="时运继延" then
					--释放成功的技能名称
						SYJY_Time=GetTime()	--记录最后一次施法时间
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end

--时运使用时机
function WR_RogueOutlaw_SYJY()
	if zhandoumoshi==1
	--开爆发
	and
	MYGT_CastTime~=nil and GetTime()-MYGT_CastTime>0.5
	--时运要在命运骨骰最后一次释放时间0.5秒后使用
	and
	WRSet.KT_SYJY==1
	--时运继延 开启
	and
	WR_SpellIsCD(381989)
	--技能可用
	and
	PlayerInCombat
	--在战斗中
	and
	(
		BonesBuffCount>=5
		--BUFF数量>=5
		or
		(
			BonesBuffCount==4
			--BUFF数量==4
			and
			(
				BuffTime_JZDW>GCD
				--精准定位 存在
				or
				BuffTime_MCDBZ==0
				--埋藏的宝藏 不存在
			)
		)
	)
	then
		local MinBonesBuffTime=10
		if BuffTime_CRJZ>0 and (BuffTime_CRJZ<3 or BuffTime_CRJZ>10) and BuffTime_CRJZ<MinBonesBuffTime then MinBonesBuffTime=BuffTime_CRJZ end
		if BuffTime_QSLJ>0 and (BuffTime_QSLJ<3 or BuffTime_QSLJ>10) and BuffTime_QSLJ<MinBonesBuffTime then MinBonesBuffTime=BuffTime_QSLJ end
		if BuffTime_KLHF>0 and (BuffTime_KLHF<3 or BuffTime_KLHF>10) and BuffTime_KLHF<MinBonesBuffTime then MinBonesBuffTime=BuffTime_KLHF end
		if BuffTime_JZDW>0 and (BuffTime_JZDW<3 or BuffTime_JZDW>10) and BuffTime_JZDW<MinBonesBuffTime then MinBonesBuffTime=BuffTime_JZDW end
		if BuffTime_MCDBZ>0 and (BuffTime_MCDBZ<3 or BuffTime_MCDBZ>10) and BuffTime_MCDBZ<MinBonesBuffTime then MinBonesBuffTime=BuffTime_MCDBZ end
		if BuffTime_DLD>0 and (BuffTime_DLD<3 or BuffTime_DLD>10) and BuffTime_DLD<MinBonesBuffTime then MinBonesBuffTime=BuffTime_DLD end
		if MinBonesBuffTime<3 or BonesBuffCount==6 then
		--如果最小BUFF时间<3 或者 BUFF数量==6
			return true
		end
	end
	return false
end