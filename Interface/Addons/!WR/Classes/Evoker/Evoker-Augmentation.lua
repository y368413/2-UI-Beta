--增辉运行库
function WR_EvokerAugmentation()
	if GetSpecialization()~=3 then	--如果不是增辉(3)专精，则不执行该运行库
		return
	end
	
	WR_LFGList()	--获得预组队多语言列表
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	ShiFaSuDu=0
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")
	
	PowerEssence=UnitPower("player", Enum.PowerType.Essence)	--获得精华点数
	
	PlayerMove=WR_GetPlayerMove()	--单位移动
	
	TargetRange=WR_GetUnitRange("target")	--单位距离
	
	GCD=WR_GetGCD("碧蓝打击")	--获得公共冷却剩余时间或者当前施法剩余时间
	
	CD_HTZL=WR_GetGCD("黑檀之力")
	_,_,_,PenFaCastTime=GetSpellInfo("喷发")
	PenFaCastTime=PenFaCastTime/1000
	
	HTZLBuffTime,_,_=WR_GetUnitBuffInfo("player",395296)	--获得黑檀之力buff剩余时间
	
	XKBuffTime,_,_=WR_GetUnitBuffInfo("player","悬空")	--获得悬空buff剩余时间
	KJBLBuffTime,_,_=WR_GetUnitBuffInfo("player","空间悖论")	--获得 空间悖论 buff剩余时间
	CanMoveCast = false	--初始化是否可以移动施法
	if XKBuffTime>0 or KJBLBuffTime>0 then
		CanMoveCast = true	--移动施法成立
	end
	BuffTime_JHBJ,BuffCount_JHBJ,BuffSum_JHBJ=WR_GetUnitBuffInfo("player","精华迸发")	--获得 精华迸发 buff信息
	
	PartyInCombat=WR_PartyInCombat()
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	InBossCombat=WR_InBossCombat()	--获得是否BOSS战斗
	InTraining=WR_InTraining()	--在打木桩
	TargetInCombat=WR_TargetInCombat("target")
	inInstance, _ = IsInInstance()	--在副本
	
	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_EvokerCreateMacroButton() --初始化宏
	end


	if MSG==1 then
		print()
	end
	
----首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------
	if IsFlying()
	--正在飞行
	or UnitIsDead("player")
	--玩家死亡
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------

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
		WR_ShowColorFrame("CSC","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("CSZ","平伤",0) --显示指定色块窗体
	end
--爆发或非爆发检测---------------------------------------------------------------------------------------
	
	--目标P1---------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZNMB("party1target") then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF4","目标P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P1---------------------------------------------------------------------------------------
	
	--目标P2---------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZNMB("party2target") then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","目标P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P2---------------------------------------------------------------------------------------
	
	--目标P3---------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZNMB("party3target") then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF6","目标P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P3---------------------------------------------------------------------------------------
	
	--目标P4---------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZNMB("party4target") then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","目标P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P4---------------------------------------------------------------------------------------

	--黑曜鳞片--------------------------------------------------------------------------------------------
	if WRSet.ZH_HYLP~=6
	--黑曜鳞片 开启
	and
	WR_SpellUsable("黑曜鳞片")
	--技能可用
	and
	PlayerHP<=WRSet.ZH_HYLP/10
	--血量 <= 黑曜鳞片 设定值
	and
	WR_GetUnitBuffInfo("player","黑曜鳞片")==0
	--黑曜鳞片 BUFF不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSP","黑曜鳞片",zhandoumoshi) --显示指定色块窗体
		return
	end
	--黑曜鳞片--------------------------------------------------------------------------------------------

	--新生光焰--------------------------------------------------------------------------------------------
	if WRSet.ZH_XSGY~=6
	--新生光焰 开启
	and
	WR_SpellUsable("新生光焰")
	--技能可用
	and
	PlayerHP<=WRSet.ZH_XSGY/10
	--血量 <= 新生光焰 设定值
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","新生光焰",zhandoumoshi) --显示指定色块窗体
		return
	end
	--新生光焰--------------------------------------------------------------------------------------------

	--青翠之拥--------------------------------------------------------------------------------------------
	if WRSet.ZH_QCZY~=8
	--青翠之拥 开启
	and
	WR_SpellUsable("青翠之拥")
	--技能可用
	and
	PlayerHP<=WRSet.ZH_XSGY/10
	--血量 <= 青翠之拥 设定值
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","青翠之拥",zhandoumoshi) --显示指定色块窗体
		return
	end
	--青翠之拥--------------------------------------------------------------------------------------------

	--翡翠之花--------------------------------------------------------------------------------------------
	if WRSet.ZH_FCZH==1
	--翡翠之花 开启
	and
	WR_SpellUsable("翡翠之花")
	--技能可用
	and
	(
		WR_ResistOutburst(1.5)
		--尖刺型伤害，施法时间剩余1.5秒
		or
		(WR_InBossCombat() and WR_ResistSustained())
		--BOSS战 并且 持续型伤害存在
		or
		WR_ResistSustained(0.9)
		--持续型伤害存在，血量百分比低于0.9
		or
		WR_Mustheal("player")	--自己必须受到治疗
		or
		PlayerHP<0.7
		--单位血量
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","翡翠之花",zhandoumoshi) --显示指定色块窗体
		return
	end
	--翡翠之花--------------------------------------------------------------------------------------------

	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.ZH_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.ZH_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF4","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.ZH_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.ZH_ZLYS/10
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
				WR_ShowColorFrame("CF5","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

----如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if
	not(
	GCD==0
	--公共冷却==0
	and
	not(SpellIsTargeting())
	--没有等待玩家选择目标
	and
	UnitChannelInfo("player")~="时间跳跃"
	--没有引导 时间跳跃
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------

	--扫尾--------------------------------------------------------------------------------------------
	if WRSet.ZH_SW==1
	--扫尾 开启
	and
	WR_SpellUsable("扫尾")
	--技能可用
	and
	WR_StunUnit(8)
	--范围击晕施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF6","扫尾",zhandoumoshi) --显示指定色块窗体
		return
	end
	--扫尾--------------------------------------------------------------------------------------------

	--镇压--------------------------------------------------------------------------------------------
	--镇压T--------------------------------------------------------------------------------------------
	if WRSet.ZH_ZY~=3
	--镇压 开启
	and
	WR_EvokerAugmentation_ZY("target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF3","镇压T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--镇压T--------------------------------------------------------------------------------------------

	if WRSet.ZH_ZY==1 then
	--镇压 开启
		--镇压P1--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_ZY("party1target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF1","镇压P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--镇压P1--------------------------------------------------------------------------------------------
		--镇压P2--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_ZY("party2target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF2","镇压P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--镇压P2--------------------------------------------------------------------------------------------
		--镇压P3--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_ZY("party3target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSK","镇压P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--镇压P3--------------------------------------------------------------------------------------------
		--镇压P4--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_ZY("party4target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSM","镇压P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--镇压P4--------------------------------------------------------------------------------------------
	end
	--镇压--------------------------------------------------------------------------------------------

	--黑龙协调--------------------------------------------------------------------------------------------
	if WR_SpellUsable("黑龙协调")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","黑龙协调")==0
	--黑龙协调 不存在
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","黑龙协调",zhandoumoshi) --显示指定色块窗体
		return
	end
	--黑龙协调--------------------------------------------------------------------------------------------

	--梦游--------------------------------------------------------------------------------------------
	if WR_SpellUsable("梦游")
	--技能可用
	and
	IsSpellInRange("梦游","mouseover")==1
	--单位在技能范围内
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
	not(WR_StopCast(WR_GetTrueCastTime(1.5)))
	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSF","梦游",zhandoumoshi) --显示指定色块窗体
		return
	end
	--梦游--------------------------------------------------------------------------------------------

	--净除--------------------------------------------------------------------------------------------
	--净除M--------------------------------------------------------------------------------------------
	if WRSet.ZH_JC~=3
	--净除 开启
	and
	WR_EvokerAugmentation_JC("mouseover")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CST","净除M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--净除M--------------------------------------------------------------------------------------------
	if WRSet.ZH_JC==1 then
	--净除 开启
		--净除P--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_JC("player") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF8","净除P",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净除P--------------------------------------------------------------------------------------------
		--净除P1--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_JC("party1") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSL","净除P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净除P1--------------------------------------------------------------------------------------------
		--净除P2--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_JC("party2") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF10","净除P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净除P2--------------------------------------------------------------------------------------------
		--净除P3--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_JC("party3") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSO","净除P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净除P3--------------------------------------------------------------------------------------------
		--净除P4--------------------------------------------------------------------------------------------
		if WR_EvokerAugmentation_JC("party4") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF12","净除P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净除P4--------------------------------------------------------------------------------------------
	end
	--净除--------------------------------------------------------------------------------------------

	--灼焰M--------------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZSZY("mouseover")
	--灼烧之焰 的先决条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF6","灼焰M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--灼焰M--------------------------------------------------------------------------------------------
	--灼焰F--------------------------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZSZY("focus")
	--灼烧之焰 的先决条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF7","灼焰F",zhandoumoshi) --显示指定色块窗体
		return
	end
	--灼焰F--------------------------------------------------------------------------------------------
	
	--黑檀之力----------------------------------------------------------------------------
	if zhandoumoshi==1
	and
	WR_SpellUsable("黑檀之力")
	--技能可用
	and
	HTZLBuffTime<=3.2+1
	--黑檀之力Buff时间<=3.2+1秒
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	(
		not(PlayerMove)
		--没有在移动
		or
		CanMoveCast
		--可以移动施法
	)
	then
		--饰品1--------------------------------------------------------------------------------------------	
		if (WRSet.ZH_SP==1 or WRSet.ZH_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1--------------------------------------------------------------------------------------------	
		--饰品2--------------------------------------------------------------------------------------------	
		if (WRSet.ZH_SP==2 or WRSet.ZH_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF9","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品2--------------------------------------------------------------------------------------------	
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7","黑檀之力",zhandoumoshi) --显示指定色块窗体
		return
	end
	--黑檀之力----------------------------------------------------------------------------
	
	--地壳激变----------------------------------------------------------------------------
	local ChannelTime_DQJB=0	--地壳激变 施法持续时间
	if UnitChannelInfo("player")=="地壳激变" then
	local _,_,_,startTimeMS =UnitChannelInfo("player")
		ChannelTime_DQJB=GetTime()-startTimeMS/1000
		--print(ChannelTime_DQJB)
	end
	if (
		zhandoumoshi==1
		and
		WR_SpellUsable("地壳激变")
		--技能可用
		and
		TargetRange<=25
		--目标距离
		and
		TargetInCombat
		--目标在战斗
		and
		not(PlayerMove)
		--没有在移动
		and
		HTZLBuffTime>1.5
		--黑檀之力 BUFF时间>1.5秒
		and
		UnitChannelInfo("player")~="火焰吐息"
		--没有引导 地壳激变
		and
		CD_HTZL>6
		--黑檀之力 CD>0
	)
	or
	ChannelTime_DQJB>0.65+0.45*(WRSet.ZH_DQJB-1)
	--地壳激变 引导时间 > 0.7+0.5*(分级-1)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF8","地壳激变",zhandoumoshi) --显示指定色块窗体
		return
	end
	--地壳激变----------------------------------------------------------------------------

	--火焰吐息----------------------------------------------------------------------------
	local ChannelTime_HYTX=0	--火焰吐息 施法持续时间
	if UnitChannelInfo("player")=="火焰吐息" then
	local _,_,_,startTimeMS =UnitChannelInfo("player")
		ChannelTime_HYTX=GetTime()-startTimeMS/1000
		--print(ChannelTime_HYTX)
	end
	if (
		zhandoumoshi==1
		and
		WR_SpellUsable("火焰吐息")
		--技能可用
		and
		TargetRange<=25
		--目标距离
		and
		TargetInCombat
		--目标在战斗
		and
		not(PlayerMove)
		--没有在移动
		and
		HTZLBuffTime>1.5
		--黑檀之力 BUFF时间>1.5秒
		and
		UnitChannelInfo("player")~="地壳激变"
		--没有引导 地壳激变
		and
		CD_HTZL>6
		--黑檀之力 CD>0
	)
	or
	ChannelTime_HYTX>0.65+0.45*(WRSet.ZH_HYTX-1)
	--火焰吐息 引导时间 > 0.7+0.5*(分级-1)
	then
		--扭转天平----------------------------------------------------------------------------
		if WR_SpellUsable("扭转天平")
		--技能可用
		and
		UnitCastingInfo("player")==nil
		--施法不存在
		and
		UnitChannelInfo("player")==nil
		--引导不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSH","扭转天平",zhandoumoshi) --显示指定色块窗体
			return
		end
		--扭转天平----------------------------------------------------------------------------
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","火焰吐息",zhandoumoshi) --显示指定色块窗体
		return
	end
	--火焰吐息----------------------------------------------------------------------------

	--喷发1----------------------------------------------------------------------------
	if WR_EvokerAugmentation_PF()
	--喷发 施法条件
	and
	(
		PowerEssence>=5
		--精华>=5
		or
		BuffCount_JHBJ>=1
		--精华迸发 存在
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","喷发1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--喷发1----------------------------------------------------------------------------

	--先知先觉----------------------------------------------------------------------------
	if WR_SpellUsable("先知先觉")
	--技能可用
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","先知先觉",zhandoumoshi) --显示指定色块窗体
		return
	end
	--先知先觉----------------------------------------------------------------------------

	--龙鳞TT----------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZHLL("targettarget")
	--炽火龙鳞 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF5","龙鳞TT",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙鳞TT----------------------------------------------------------------------------

	--龙鳞P1----------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZHLL("party1")
	--炽火龙鳞 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSB","龙鳞P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙鳞P1----------------------------------------------------------------------------

	--龙鳞P2----------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZHLL("party2")
	--炽火龙鳞 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSY","龙鳞P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙鳞P2----------------------------------------------------------------------------

	--龙鳞P3----------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZHLL("party3")
	--炽火龙鳞 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSG","龙鳞P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙鳞P3----------------------------------------------------------------------------

	--龙鳞P4----------------------------------------------------------------------------
	if WR_EvokerAugmentation_ZHLL("party4")
	--炽火龙鳞 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSV","龙鳞P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙鳞P4----------------------------------------------------------------------------

	--喷发2----------------------------------------------------------------------------
	if WR_EvokerAugmentation_PF()
	--喷发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","喷发2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--喷发2----------------------------------------------------------------------------

	--活化烈焰----------------------------------------------------------------------------
	if WR_SpellUsable("活化烈焰")
	--技能可用
	and
	IsSpellInRange("活化烈焰","target")==1
	--技能范围内
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	TargetInCombat
	--目标可战斗
	and
	(
		CanMoveCast
		--可以移动施法
		or
		not(PlayerMove)
		--没有在移动
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","活化烈焰",zhandoumoshi) --显示指定色块窗体
		return
	end
	--活化烈焰----------------------------------------------------------------------------

	--碧蓝打击----------------------------------------------------------------------------
	if WRSet.ZH_BLDJ==1
	--碧蓝打击 开启
	and
	WR_SpellUsable("碧蓝打击")
	--技能可用
	and
	IsSpellInRange("碧蓝打击","target")==1
	--技能范围内
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	TargetInCombat
	--目标可战斗
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","碧蓝打击",zhandoumoshi) --显示指定色块窗体
		return
	end
	--碧蓝打击----------------------------------------------------------------------------

	--魔源P1----------------------------------------------------------------------------
	if WR_EvokerAugmentation_MLZY("party1")
	--魔力之源 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSI","魔源P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--魔源P1----------------------------------------------------------------------------

	--魔源P2----------------------------------------------------------------------------
	if WR_EvokerAugmentation_MLZY("party2")
	--魔力之源 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSJ","魔源P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--魔源P2----------------------------------------------------------------------------

	--魔源P3----------------------------------------------------------------------------
	if WR_EvokerAugmentation_MLZY("party3")
	--魔力之源 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSN","魔源P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	--魔源P3----------------------------------------------------------------------------

	--魔源P4----------------------------------------------------------------------------
	if WR_EvokerAugmentation_MLZY("party4")
	--魔力之源 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSU","魔源P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	--魔源P4----------------------------------------------------------------------------

	--青铜龙的祝福----------------------------------------------------------------------------
	if WR_SpellUsable("青铜龙的祝福")
	--技能可用
	and
	WR_PartyNotBuff("青铜龙的祝福")
	--如果队友没有青铜龙的祝福
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","青铜祝福",zhandoumoshi) --显示指定色块窗体
		return
	end
	--青铜龙的祝福----------------------------------------------------------------------------
	
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--魔力之源 施法条件
function WR_EvokerAugmentation_MLZY(Unit)
	if WR_SpellUsable("青铜龙的祝福")
	--技能可用
	and
	IsSpellInRange("魔力之源",Unit)==1
	--技能范围内
	and
	UnitGroupRolesAssigned(Unit)=="HEALER"
	--单位是治疗
	and
	not(UnitCanAttack("player",Unit))
	--单位是友善
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	WR_GetUnitBuffInfo(Unit,"魔力之源")==0
	--单位 魔力之源 BUFF不存在
	then
		return true
	end
	return false
end


--炽火龙鳞 施法条件
function WR_EvokerAugmentation_ZHLL(Unit)
	if WR_SpellUsable("炽火龙鳞")
	--技能可用
	and
	IsSpellInRange("炽火龙鳞",Unit)==1
	--技能范围内
	and
	UnitGroupRolesAssigned(Unit)=="TANK"
	--单位是坦克
	and
	not(UnitCanAttack("player",Unit))
	--单位是友善
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	WR_GetUnitBuffInfo(Unit,"炽火龙鳞",true)==0
	--单位没有 炽火龙鳞 BUFF
	then
		return true
	end
	return false
end


--喷发 施法条件
function WR_EvokerAugmentation_PF()
	if WR_SpellUsable("喷发")
	--技能可用
	and
	TargetRange<=25
	--技能范围内
	and
	TargetInCombat
	--目标在战斗
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	HTZLBuffTime>0
	--黑檀之力 BUFF存在
	and
	PenFaCastTime+0.2<HTZLBuffTime
	--喷发施法时间+0.2<黑檀之力buff剩余时间
	and
	(
		CanMoveCast
		--可以移动施法
		or
		not(PlayerMove)
		--没有在移动
	)
	then
		return true
	end
	return false
end

--净除 的先决条件
function WR_EvokerAugmentation_JC(Unit)
	if WR_SpellUsable("净除")
	--技能可用
	and
	IsSpellInRange("净除",Unit)==1
	--单位在技能范围内
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	WR_CanRemoveUnitDebuff(Unit)
	--单位有可驱散Debuff
	then
		return true
	end
	return false
end

--灼烧之焰 的先决条件
function WR_EvokerAugmentation_ZSZY(Unit)
	if WRSet.ZH_ZSZY==1
	--灼烧之焰 开启
	and
	WR_SpellUsable("灼烧之焰")
	--技能可用
	and
	IsSpellInRange("灼烧之焰",Unit)==1
	--单位在技能范围内
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	UnitCastingInfo("player")==nil
	--施法不存在
	and
	UnitChannelInfo("player")==nil
	--引导不存在
	and
	(
		WR_GetUnitDebuffType(Unit,"Curse")==true
		--单位身上有 诅咒 Debuff类型
		or
		WR_GetUnitDebuffType(Unit,"Disease")==true
		--单位身上有 疾病 Debuff类型
		or
		WR_GetUnitDebuffType(Unit,"Poison")==true
		--单位身上有 中毒 Debuff类型
		or
		WR_GetUnitDebuffType(Unit,"Bleed")==true
		--单位身上有 流血 Debuff类型
		or
		WR_GetUnitDebuffType(Unit,"Bleeding")==true
		--单位身上有 流血 Debuff类型
	)
	then
		return true
	end
	return false
end

--镇压 的先决条件
function WR_EvokerAugmentation_ZY(Unit)
	if WR_SpellUsable("镇压")
	--技能可用
	and
	IsSpellInRange("镇压",Unit)==1
	--单位在技能范围内
	and
	UnitCanAttack("player",Unit)
	--单位是敌对
	and
	not(UnitIsDead(Unit))
	--单位没有死亡
	and
	WR_GetCastInterruptible(Unit,InterruptTime)
	--单位有需要打断的法术
	then
		return true
	end
	return false
end

--智能目标 条件
function WR_EvokerAugmentation_ZNMB(Unit)
	if WRSet.ZH_ZNMB==1
	--智能目标 开启
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	(
		not(TargetInCombat)
		--不可与目标战斗
		or
		IsSpellInRange("碧蓝打击","target")~=1
		--不在技能范围内
	)
	and
	IsSpellInRange("碧蓝打击",Unit)==1
	--技能范围内
	and
	WR_TargetInCombat(Unit)
	--可与目标战斗
	then
		return true
	end
	return false
end