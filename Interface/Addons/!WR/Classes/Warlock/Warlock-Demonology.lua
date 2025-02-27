--恶魔术运行库
function WR_WarlockDemonology()
	if GetSpecialization()~=2 then	--如果不是恶魔(2)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	WR_LFGList()	--预组队加入简体,繁体,英文
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	WR_WarlockDemonology_ErrorMessage() --宠物技能的错误事件
	
	
	GCD=WR_GetGCD("无尽呼吸")
	GCD_Max=WR_GetMaxGCD(1.5)	--最大GCD
	
	CD_ZHKJLQ=WR_GetGCD("召唤恐惧猎犬")	--获取召唤恐惧猎犬CD
	CD_MDEMWS=WR_GetGCD("魔典：恶魔卫士")	--获取[魔典：恶魔卫士]CD
	CD_ZHEMBJ=WR_GetGCD("召唤恶魔暴君")	--获取召唤召唤恶魔暴君CD
	
	CD_LHDJ=WR_GetGCD("灵魂打击")	--获取灵魂打击CD
	
	
	BuffTime_EMZH,BuffCount_EMZH,BuffSum_EMZH=WR_GetUnitBuffInfo("player","恶魔之核")	--获得恶魔之核Buff信息
	
	YSXG_Sum=GetSpellCount(196277)	--获得野生小鬼数量
	
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得自身血量比例

	TargetDeathTime=WR_GetUnitDeathTime("target")	--获取目标预计死亡时间
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获取当前指定技能范围内战斗持续时间
	PlayerMove=WR_GetPlayerMove()	--获取单位是否移动或空中状态
	
	RangeHarmUnitCount30=WR_GetRangeHarmUnitCount(30,true)	--获得30码内战斗中的敌人数量
	RangeHarmUnitCount40=WR_GetRangeHarmUnitCount(40,true)	--获得40码内战斗中的敌人数量
	
	InTraining=WR_InTraining()	--判断是否在打木桩
	
	CastingName=UnitCastingInfo("player")	--获得当前施法的法术名称
	ChannelName=UnitChannelInfo("player")	--获得当前引导的法术名称
	
	MyCastingTime=0
	if WR_GetUnitCastInfo("player")~=nil then
		MyCastingTime=WR_GetUnitCastInfo("player")	--获得当前施法时间
	end
	
	TargetInCombat=WR_TargetInCombat("target")	--获得目标是否在战斗中
	
	InBossCombat=WR_InBossCombat()	--获得是否在BOSS战斗
	
	SoulShards=UnitPower("player",7)	--获取灵魂碎片数量
	NextGCDSS=SoulShards	--获得下一个GCD的灵魂碎片数量
	if CastingName=="暗影箭" then
		NextGCDSS=SoulShards+1	--获得下一个GCD的灵魂碎片数量
	end
	if CastingName=="恶魔之箭" then
		NextGCDSS=SoulShards+1	--获得下一个GCD的灵魂碎片数量
	end
	if CastingName=="召唤恶魔暴君" then
		NextGCDSS=SoulShards+5	--获得下一个GCD的灵魂碎片数量
	end
	if CastingName=="召唤恐惧猎犬" then
		NextGCDSS=SoulShards-2	--获得下一个GCD的灵魂碎片数量
	end
	if CastingName=="古尔丹之手" then
		NextGCDSS=SoulShards-3	--获得下一个GCD的灵魂碎片数量
	end

	
	if NextGCDSS<0 then NextGCDSS=0 end	--获得下一个GCD的灵魂碎片数量

	TotemSum=0	--守护者数量

	for i=1,40,1
	do
	   local _, totemName, startTime, duration, _= GetTotemInfo(i)
		if (totemName=="恐惧猎犬" or totemName=="恶魔卫士") and startTime+duration-GetTime()>2  then
			TotemSum=TotemSum+1	--守护者数量
		else
			break
		end 
	end

	if TotemSum<2 and CD_ZHKJLQ>=11 and CD_MDEMWS>=106 then
		TotemSum=2
	end

	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_WarlockCreateMacroButton() --初始化宏
	end

	if MSG==1 then
		print("----------")
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

--战斗检测色块窗体---------------------------------------------------------------------------------------
	if not(UnitIsDead("player"))
	--玩家存活
	and
	(
		UnitAffectingCombat("player")
		--玩家在战斗
		or
		WR_InTraining()
		--打木桩
	)
	then
	--玩家在战斗中
		WR_CombatFrame:Show() --显示战斗色块窗体
	else
	--玩家不在战斗中
		WR_CombatFrame:Hide() --隐藏战斗色块窗体
	end	
--战斗检测色块窗体---------------------------------------------------------------------------------------

--爆发或非爆发检测---------------------------------------------------------------------------------------
	if zhandoumoshi~=1 then
		WR_HideColorFrame(1) --隐藏右上色块窗体
		WR_ShowColorFrame("SF10","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("SF12","平伤",0) --显示指定色块窗体
	end
--爆发或非爆发检测---------------------------------------------------------------------------------------

	--取消冲刺---------------------------------------------------------------------
	if WR_GetUnitBuffInfo("player","爆燃冲刺")~=0
	--爆燃冲刺 BUFF存在
	and
	not(PlayerMove)
	--没有移动
	and
	(
		CastingName~=nil
		--当前施法存在
		or
		ChannelName~=nil
		--当前引导存在
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF2","取消冲刺",zhandoumoshi) --显示指定色块窗体
		return
	end
	--取消冲刺---------------------------------------------------------------------

	--取消施法---------------------------------------------------------------------
	if
	(
		CastingName=="召唤恶魔卫士"
		--当前施法存在
		and
		UnitExists("pet")
		--单位存在
		and
		not(UnitIsDead("pet"))
		--单位存活
	)
	or
	(
		CastingName=="暗影箭"
		--当前施法存在
		and
		SoulShards>=5
		--灵魂碎片>=5
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF1","取消施法",zhandoumoshi) --显示指定色块窗体
		return
	end
	--暗影箭---------------------------------------------------------------------

	--不灭决心---------------------------------------------------------------------
	if WRSet.EM_BMJX~=6
	--不灭决心 开启
	and
	WR_SpellIsCD(104773)
	--技能可用
	and
	PlayerHP<=WRSet.EM_BMJX/10
	--玩家血量<=设定值
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","不灭决心",zhandoumoshi) --显示指定色块窗体
		return
	end
	--不灭决心---------------------------------------------------------------------

	--黑暗契约---------------------------------------------------------------------
	if WRSet.EM_HAQY==1
	--黑暗契约 开启
	and
	WR_SpellIsCD(108416)
	--技能可用
	and
	(
		WR_GetUnitHP("player")<0.6
		--生命比例<60%
		or
		WR_ResistOutburst()
		--尖刺型AOE
		or
		WR_ResistSustained(0.9)
		--持续性AOE，并且生命比例<=0.8
		or
		WR_Mustheal("player")
		--玩家必须获得治疗
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","黑暗契约",zhandoumoshi) --显示指定色块窗体
		return
	end
	--黑暗契约---------------------------------------------------------------------

	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.EM_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.EM_ZLS/10
	--血量比例<治疗石设定值/10
	and
	UnitAffectingCombat("player")
	--玩家在战斗
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.EM_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.EM_ZLYS/10
	--血量比例<治疗药水设定值/10
	and
	UnitAffectingCombat("player")
	--玩家在战斗
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
				WR_ShowColorFrame("SF6","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--放逐术--------------------------------------------------------------------------------------------
	if WR_SpellUsable("放逐术")
	--技能可用
	and
	IsSpellInRange("放逐术","mouseover")==1
	--单位在技能范围内
	and
	not(WR_StopCast(WR_GetTrueCastTime(1.5)))
	--避免施法被沉默的情况
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not(PlayerMove)
	--单位没有移动
	and
	UnitCastingInfo("player")~="放逐术"
	--没有施法 放逐术
	and
	UnitCastingInfo("player")~="恐惧"
	--没有施法 恐惧
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","放逐术",zhandoumoshi) --显示指定色块窗体
		return
	end
	--放逐术--------------------------------------------------------------------------------------------

	--恐惧--------------------------------------------------------------------------------------------
	if WR_SpellUsable("恐惧")
	--技能可用
	and
	IsSpellInRange("恐惧","mouseover")==1
	--单位在技能范围内
	and
	not(WR_StopCast(WR_GetTrueCastTime(1.7)))
	--避免施法被沉默的情况
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not(PlayerMove)
	--单位没有移动
	and
	UnitCastingInfo("player")~="放逐术"
	--没有施法 放逐术
	and
	UnitCastingInfo("player")~="恐惧"
	--没有施法 恐惧
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF2","恐惧",zhandoumoshi) --显示指定色块窗体
		return
	end
	--恐惧--------------------------------------------------------------------------------------------

	--灵魂石--------------------------------------------------------------------------------------------
	if WR_SpellUsable("灵魂石")
	--技能可用
	and
	(
		IsSpellInRange("灵魂石","target")==1
		--单位在技能范围内
		or
		WR_GetUnitRange("target")<=40
		--单位距离<=40
	)
	and
	UnitIsDead("target")
	--单位死亡
	and
	not(PlayerMove)
	--没有移动
	and
	not(UnitCanAttack("player","target"))
	--单位是友善的
	and
	UnitIsPlayer("target")
	--单位是玩家
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","灵魂石T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--灵魂石--------------------------------------------------------------------------------------------

	--智能目标----------------------------------------------------------------------------------------------
	if WRSet.EM_ZNMB==1 then
		--目标M----------------------------------------------------------------------------------------------
		if WR_WarlockDemonology_ZNMB("mouseover") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF3","目标M",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--目标M----------------------------------------------------------------------------------------------
		--目标P1----------------------------------------------------------------------------------------------
		if WR_WarlockDemonology_ZNMB("party1target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF5","目标P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P1----------------------------------------------------------------------------------------------
		--目标P2----------------------------------------------------------------------------------------------
		if WR_WarlockDemonology_ZNMB("party2target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF6","目标P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P2----------------------------------------------------------------------------------------------
		--目标P3----------------------------------------------------------------------------------------------
		if WR_WarlockDemonology_ZNMB("party3target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF7","目标P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P3----------------------------------------------------------------------------------------------
		--目标P4----------------------------------------------------------------------------------------------
		if WR_WarlockDemonology_ZNMB("party41target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","目标P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P4----------------------------------------------------------------------------------------------
	end
	--智能目标----------------------------------------------------------------------------------------------
	
----施法速度检测，如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if GCD>ShiFaSuDu
	--GCD>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----施法速度检测，如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------

	--召唤恶魔卫士---------------------------------------------------------------------
	if WR_SpellIsCD(30146)
	--技能可用
	and
	NextGCDSS>=1
	--下一个GCD的灵魂碎片
	and
	not(WR_GetPlayerMove())
	--没有移动
	and
	UnitCastingInfo("player")~="召唤恶魔卫士"
	--没有施法 召唤恶魔卫士
	and
	(
		not(UnitExists("pet"))
		--宠物不存在
		or
		UnitIsDead("pet")
		--宠物死亡
	)
	then
		--邪能统御---------------------------------------------------------------------
		if WR_SpellIsCD(333889)
		--技能可用
		and
		UnitExists("pet")
		--宠物存在
		and
		UnitIsDead("pet")
		--宠物死亡
		and
		AvgDeathTime>3
		--战斗时长>3秒
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","邪能统御",zhandoumoshi) --显示指定色块窗体
			return
		end
		--邪能统御---------------------------------------------------------------------
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","召唤恶魔卫士",zhandoumoshi) --显示指定色块窗体
		return
	end
	--召唤恶魔卫士---------------------------------------------------------------------

----目标战斗检测，如果不在战斗，则不再往下执行操作-------------------------------------------------------------
	if not(TargetInCombat)
	--目标不在战斗
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----目标战斗检测，如果不在战斗，则不再往下执行操作-------------------------------------------------------------
	
	if
	(
		WR_GetCastInterruptible("target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		or
		WR_StunSpell("target")
		--击晕施法
	)
	then
		--巨斧投掷---------------------------------------------------------------------
		if WRSet.EM_JFTZ==1
		--巨斧投掷 开启
		and
		UnitCreatureFamily("pet")=="恶魔卫士"
		--当前宠物是 恶魔卫士
		and
		not(UnitIsDead("pet"))
		--宠物存活
		and
		WR_GetGCD(89766)<=GCD
		--技能冷却
		and
		WR_GetUnitRange("target")<=30
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF4","巨斧投掷",zhandoumoshi) --显示指定色块窗体
			return
		end
		--巨斧投掷---------------------------------------------------------------------
		--死亡缠绕---------------------------------------------------------------------
		if WRSet.EM_SWCR==1
		--死亡缠绕 开启
		and
		WR_SpellIsCD(6789)
		--技能可用
		and
		WR_GetUnitRange("target")<=20
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","死亡缠绕",zhandoumoshi) --显示指定色块窗体
			return
		end
		--死亡缠绕---------------------------------------------------------------------
	end
	
	--能量虹吸---------------------------------------------------------------------
	if WR_SpellIsCD(264130)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	BuffCount_EMZH<=2
	--恶魔之核Buff<=2层
	and
	YSXG_Sum>=2
	--野生小鬼数量>=2
	and
	UnitAffectingCombat("player")
	--战斗中
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","能量虹吸",zhandoumoshi) --显示指定色块窗体
		return
	end
	--能量虹吸---------------------------------------------------------------------
	
	--召唤恶魔暴君---------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellIsCD(265187)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	not(PlayerMove)
	--没有移动
	and
	not(WR_StopCast(WR_GetMaxGCD(2)))
	--避免施法被沉默的情况
	and
	(
		TotemSum>=2
		--守护者数量>=2
		or
		(
			TotemSum>=1
			--守护者数量>=1
			and
			UnitCastingInfo("player")=="召唤恐惧猎犬"
			--正在施法 召唤恐惧猎犬
		)
	)
	then
	
		--爆发药水
		if WRSet.EM_BFYS==1 then
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
					WR_ShowColorFrame("ACF6","爆发药水",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
		end
	
		--饰品1
		if (WRSet.EM_SP==1 or WRSet.EM_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13)
		--1号饰品可以使用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF10","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		------------------------------------------------------------------------------------------
		--饰品2
		if (WRSet.EM_SP==2 or WRSet.EM_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14)
		--2号饰品可以使用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","召唤恶魔暴君",zhandoumoshi) --显示指定色块窗体
		return
	end
	--召唤恶魔暴君---------------------------------------------------------------------
	
	--魔典：恶魔卫士---------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellIsCD(111898)
	--技能可用
	and
	NextGCDSS>=1
	--下一个GCD的灵魂碎片
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	(
		CD_ZHEMBJ<=14
		--召唤恶魔暴君CD<=14秒
		and
		(
			CD_ZHKJLQ<=CD_ZHEMBJ
			--恐惧猎犬CD<=召唤恶魔暴君CD
			or
			(
				CD_ZHKJLQ>=11
				--恐惧猎犬CD>=11秒
				and
				CD_ZHEMBJ<=GCD
				--召唤恶魔暴君CD好了
			)
		)    
	)
	then
		--武器------------------------------------------------------------------------------------
		if WR_Use_SP(16,208616)
		--[缚梦者，至高轮回织机]
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF5","武器",zhandoumoshi) --显示指定色块窗体
			return
		end
		--武器------------------------------------------------------------------------------------
	
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF8","魔典：恶魔卫士",zhandoumoshi) --显示指定色块窗体
		return
	end
	--魔典：恶魔卫士---------------------------------------------------------------------
	
	--恶魔力量---------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellIsCD(267171)
	--技能可用
	and
	UnitExists("pettarget")
	--单位存在
	and
	not(UnitIsDead("pettarget"))
	--单位存活
	and
	WR_GetGCD("魔刃风暴")>0
	--魔刃风暴 CD>0
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7","恶魔力量",zhandoumoshi) --显示指定色块窗体
		return
	end
	--恶魔力量---------------------------------------------------------------------
	
	--召唤恐惧猎犬---------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellIsCD(104316)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	(
		WR_GetUnitBuffInfo("player","魔性征召")~=0
		--魔性征召 BUFF存在，免费瞬发
		or
		(
			not(WR_GetPlayerMove())
			--没有移动
			and
			not(WR_StopCast(WR_GetMaxGCD(2)))
			--避免施法被沉默的情况
			and
			NextGCDSS>=2
			--下一个GCD碎片>=2
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF6","召唤恐惧猎犬",zhandoumoshi) --显示指定色块窗体
		return
	end
	--召唤恐惧猎犬---------------------------------------------------------------------
	
	--古尔丹之手---------------------------------------------------------------------
	if WR_WarlockDemonology_GEDZS()
	and
	NextGCDSS>=4
	--下一个GCD碎片>=4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","古尔丹之手",zhandoumoshi) --显示指定色块窗体
		return
	end
	--古尔丹之手---------------------------------------------------------------------
	
	--内爆---------------------------------------------------------------------
	if WRSet.EM_NB~=13
	--内爆是开启的
	and
	WR_SpellIsCD(196277)
	--技能可用
	and
	YSXG_Sum>=WRSet.EM_NB
	--野生小鬼数量>=内爆设定值
	and
	not(WR_SingleUnit())
	--不是单体目标
	and
	WR_GetRangeHarmUnitCount(40,not(WR_InTraining()))>=2
	--40码敌人数量>=2
	and
	WR_GetUnitDebuffInfo("target","驯犬大师的方略",true)~=0
	--目标有 驯犬大师的方略 增伤
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","内爆",zhandoumoshi) --显示指定色块窗体
		return
	end
	--内爆---------------------------------------------------------------------
	
	--恶魔之箭---------------------------------------------------------------------
	if WR_SpellIsCD(264178)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	BuffCount_EMZH>=1
	--恶魔之核Buff>=1层
	and
	NextGCDSS<=3
	--下一个GCD碎片<=3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","恶魔之箭",zhandoumoshi) --显示指定色块窗体
		return
	end
	--恶魔之箭---------------------------------------------------------------------
	
	--古尔丹之手---------------------------------------------------------------------
	if WR_WarlockDemonology_GEDZS()
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","古尔丹之手",zhandoumoshi) --显示指定色块窗体
		return
	end
	--古尔丹之手---------------------------------------------------------------------
	
	--暗影箭---------------------------------------------------------------------
	if WR_SpellIsCD(686)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	not(PlayerMove)
	--没有移动
	and
	not(WR_StopCast(WR_GetMaxGCD(2)+0.2))
	--避免施法被沉默的情况
	and
	NextGCDSS<=4
	--下一个GCD碎片<=4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","暗影箭",zhandoumoshi) --显示指定色块窗体
		return
	end
	--暗影箭---------------------------------------------------------------------
	
	--爆燃冲刺--------------------------------------------------------------------------------------------
	local currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed("player")
	if PlayerHP>0.05
	and
	runSpeed/7<1.4
	--单位移动速度<140%
	and
	PlayerMove
	--玩家正在移动
	and
	WR_GetUnitBuffInfo("player","爆燃冲刺")==0
	--爆燃冲刺 BUFF不存在
	and
	(
		(
			WRSet.EM_BQCC==1
			--爆燃冲刺 智能
			and
			WR_SpeedUp()
			--场景需要加速跑
		)
		or
		WRSet.EM_BQCC==2
		--爆燃冲刺 保持
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF9","爆燃冲刺",zhandoumoshi) --显示指定色块窗体
		return
	end
	--爆燃冲刺--------------------------------------------------------------------------------------------
	

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--战斗错误事件
function WR_WarlockDemonology_ErrorMessage()
	--宠物技能的错误事件
	local CW_ErrorMessage={
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
	[13]="目标不在视野中",
	[14]="你不能在死亡状态的时候攻击",
	[15]="你的宠物已经死亡",
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
			for _, ErrorMessage in ipairs(CW_ErrorMessage) do
				if string.find(message, ErrorMessage) then
					ErrorMessageTime_CW=GetTime()
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

--古尔丹之手 技能条件
function WR_WarlockDemonology_GEDZS()
	if WR_SpellIsCD(105174)
	--技能可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	not(PlayerMove)
	--没有移动
	and
	not(WR_StopCast(WR_GetMaxGCD(1.5)))
	--避免施法被沉默的情况
	and
	NextGCDSS>=3
	--下一个GCD碎片>=3
	then
		return true
	end
	return false
end

--智能目标 条件
function WR_WarlockDemonology_ZNMB(Unit)
	if UnitGUID("target")~=UnitGUID(Unit)
	--目标 不是 对比的单位
	and
	IsSpellInRange("暗影箭",Unit)==1
	--技能范围内
	and
	(
		(
			(
				TargetDeathTime<MyCastingTime+1
				--目标死亡时间<我的施法时间+1
				or
				not(WR_TargetInCombat("target"))
				--单位不可攻击
				or
				not(IsSpellInRange("暗影箭","target")==1)
				--单位不在技能范围内
			)
			and
			WR_GetMaxHPUnit(1,"暗影箭")==Unit
			--获得最高血量的敌对单位
		)
		or
		(
			WR_GetUnitDebuffInfo("target","诛灭烙印",true)>0
			--目标有我的 诛灭烙印 DEBUFF
			and
			WR_GetUnitDebuffInfo(Unit,"诛灭烙印",true)==0
			--单位没有我的 诛灭烙印 DEBUFF
			and
			WR_TargetInCombat(Unit)
			--单位可攻击
			and
			(UnitClassification(Unit)~="normal" and UnitClassification(Unit)~="trivial" and UnitClassification(Unit)~="minus")
			--单位不是 普通、低等级、仆从
		)
	)
	then
		return true
	end
	return false
end