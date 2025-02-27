--暗影运行库
function WR_PriestShadow()
	if GetSpecialization()~=3 then	--如果不是暗影(3)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	WR_LFGList()	--预组队加入简体,繁体,英文
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF

	local T101={
    [1]=202540,
    [2]=202541,
    [3]=202542,
    [4]=202543,
    [5]=202545,
	
    [6]=217201,
    [7]=217202,
    [8]=217203,
    [9]=217204,
    [10]=217205,
	}
	T101Count=WR_GetSuit(T101)	--获得10.1套装的数量
	
	
	PlayerInCombat=UnitAffectingCombat("player")	--玩家在战斗中


	ResistOutburst=WR_ResistOutburst(5)	--尖刺型伤害
	MustDefenseSpell=WR_MustDefenseSpell()	--必须开启防御

	Resist=false --初始化防御机制
	if WR_ResistSustained() or ResistOutburst or MustDefenseSpell then
	--持续型伤害 或 尖刺型伤害，施法时间剩余小于5秒 或 必须开启防御 
		Resist=true
	end
	--print(Resist)
	InsanityPower=UnitPower("player",13)--狂乱值
	
	GCD=WR_GetGCD("真言术：韧")
	GCD_Max=WR_GetMaxGCD(1.5)	--最大GCD
	
	CastTime_JSBC=WR_GetMaxGCD(4.5)	--精神鞭笞施法时间
	CastTime_XLZB=WR_GetMaxGCD(1.5)	--心灵震爆施法时间
	
	
	CD_XKBF=WR_GetSpellCD(228260)	--虚空爆发CD
	if CD_XKBF<=GCD then CD_XKBF=0 end	--虚空爆发CD
	CD_XKJ=WR_GetSpellCD(205448)	--虚空箭CD
	if CD_XKJ<=GCD then CD_XKJ=0 end	--虚空箭CD
	CD_AYCZ=WR_GetSpellCD("暗影冲撞")	--暗影冲撞CD
	if CD_AYCZ<=GCD then CD_AYCZ=0 end	--暗影冲撞CD
	
	local _,_,start,duration,_=GetSpellCharges("心灵震爆")
	CD_XLZB=start+duration-GetTime()	--暗影冲撞CD
	if CD_XLZB>duration then
		CD_XLZB=0	--暗影冲撞CD
	end
	
	DebuffTime_SLYB=WR_GetUnitDebuffInfo("target","噬灵疫病",true)	--当前目标噬灵疫病Debuff剩余时间
	DebuffTime_XXGZC=WR_GetUnitDebuffInfo("target","吸血鬼之触",true)	--当前目标吸血鬼之触Debuff剩余时间
	BuffTime_HS,BuffCount_HS,BuffSum_HS=WR_GetUnitBuffInfo("player","喝水")	--获得喝水Buff信息
	BuffTime_YY,BuffCount_YY,BuffSum_YY=WR_GetUnitBuffInfo("player","饮用")	--获得饮用Buff信息
	BuffTime_JSYS,BuffCount_JSYS,BuffSum_JSYS=WR_GetUnitBuffInfo("player","进食饮水")	--获得进食饮水Buff信息
	BuffTime_XKXT,BuffCount_XKXT,BuffSum_XKXT=WR_GetUnitBuffInfo("player","虚空形态")	--获得虚空形态buff剩余时间
	BuffTime_JSBCK,BuffCount_JSBCK,BuffSum_JSBCK=WR_GetUnitBuffInfo("player","精神鞭笞：狂")	--获得精神鞭笞：狂buff剩余时间
	BuffTime_AYZB,BuffCount_AYZB,BuffSum_AYZB=WR_GetUnitBuffInfo("player","暗焰遮蔽")	--获得暗焰遮蔽buff剩余时间
	BuffTime_AYDC,BuffCount_AYDC,BuffSum_AYDC=WR_GetUnitBuffInfo("player","暗影洞察")	--获得暗影洞察buff剩余时间
	BuffTime_AYYJ,BuffCount_AYYJ,BuffSum_AYYJ=WR_GetUnitBuffInfo("player","暗焰余烬")	--获得暗焰余烬buff剩余时间
	
	
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")
	PartyLostHP=WR_PartyLostHP("快速治疗")	--获得小队平均损失血量
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获取目标预计死亡时间
	AvgDeathTime=WR_GetSpellRangeAvgDeathTime("心灵震爆")	--获取当前指定技能范围内战斗持续时间
	PlayerMove=WR_GetPlayerMove()	--获取单位是否移动或空中状态
	
	InTraining=WR_InTraining() --获得是否在打木桩
	RangeHarmUnitCount30=WR_GetRangeHarmUnitCount(30,not(InTraining)) --30码内战斗单位数量
	RangeHarmUnitCount40=WR_GetRangeHarmUnitCount(40,not(InTraining)) --40码内战斗单位数量
	EndGame=WR_EndGame()	--判断是否副本最终战斗
	CastingName=UnitCastingInfo("player")	--获得当前施法的法术名称
	ChannelName=UnitChannelInfo("player")	--获得当前引导的法术名称
	TargetInCombat=WR_TargetInCombat("target")	--获得目标是否在战斗中
	
	PartyInCombat=WR_PartyInCombat() --队伍在战斗中

	
	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_PriestCreateMacroButton() --初始化宏
	end

----首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------
	if IsFlying()
	--正在飞行
	or UnitIsDead("player")
	--玩家死亡
	or BuffTime_HS>0
	--在喝水
	or BuffTime_YY>0
	--饮用
	or BuffTime_JSYS>0
	--有进食饮水
	or SpellIsTargeting()
	--范围选择中
	or ChannelName=="虚空洪流"
	--引导虚空洪流的时候
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
		PlayerInCombat
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
		WR_ShowColorFrame("ACSF1","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("ACF10","平伤",0) --显示指定色块窗体
	end
--爆发或非爆发检测---------------------------------------------------------------------------------------

	--智能目标----------------------------------------------------------------------------------------------
	if WRSet.AY_ZNMB==1
	--智能目标开启
	and
	PartyInCombat
	--队伍在战斗中
	and
	RangeHarmUnitCount40>=1
	--40码内敌对单位>=1
	and
	not(TargetInCombat)
	--目标不可战斗
	then
		--目标P1----------------------------------------------------------------------------------------------
		if
		(
			UnitGroupRolesAssigned("party1")=="TANK"
			--单位是坦克
			and
			WR_TargetInCombat("party1target")
			--目标可战斗
			and
			WR_GetUnitRange("party1target")<=40
			--单位距离
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF2","目标P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P1----------------------------------------------------------------------------------------------

		--目标P2----------------------------------------------------------------------------------------------
		if
		(
			UnitGroupRolesAssigned("party2")=="TANK"
			--单位是坦克
			and
			WR_TargetInCombat("party2target")
			--目标可战斗
			and
			WR_GetUnitRange("party2target")<=40
			--单位距离
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF3","目标P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P2----------------------------------------------------------------------------------------------
		
		--目标P3----------------------------------------------------------------------------------------------
		if
		(
			UnitGroupRolesAssigned("party3")=="TANK"
			--单位是坦克
			and
			WR_TargetInCombat("party3target")
			--目标可战斗
			and
			WR_GetUnitRange("party3target")<=40
			--单位距离
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF5","目标P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P3----------------------------------------------------------------------------------------------
		
		--目标P4----------------------------------------------------------------------------------------------
		if
		(
			UnitGroupRolesAssigned("party4")=="TANK"
			--单位是坦克
			and
			WR_TargetInCombat("party4target")
			--目标可战斗
			and
			WR_GetUnitRange("party4target")<=40
			--单位距离
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF6","目标P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--目标P4----------------------------------------------------------------------------------------------
	end
	--智能目标----------------------------------------------------------------------------------------------

	--绝望祷言----------------------------------------------------------------------------------------------
	if WRSet.AY_JWDY~=5
	and
	WR_SpellUsable("绝望祷言")
	--技能可用 资源可用
	and
	PlayerHP<=WRSet.AY_JWDY/10
	--玩家血量
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","绝望祷言",zhandoumoshi) --显示指定色块窗体
		return
	end
	--绝望祷言----------------------------------------------------------------------------------------------

	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.AY_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.AY_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF6","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.AY_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.AY_ZLYS/10
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
				WR_ShowColorFrame("CF7","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--渐隐术----------------------------------------------------------------------------------------------
	if WRSet.AY_JYS==1
	--渐隐术 开启
	and
	WR_SpellUsable("渐隐术")
	--技能可用 资源可用
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	(
		(
			IsPlayerSpell(373446)
			--已学天赋[通透影像] 渐隐术减伤10%
			and
			(
				PlayerHP<=0.3
				--玩家血量
				or
				Resist
				--防御机制
			)
		)
		or
		(
			IsPlayerSpell(108942)
			--已学天赋[幻隐] 渐隐术解除诱捕
			and
			WR_ZiYouZhuFu("player")
			--玩家身上有定身BUFF
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","渐隐术",zhandoumoshi) --显示指定色块窗体
		return
	end
	--渐隐术----------------------------------------------------------------------------------------------

	--消散----------------------------------------------------------------------------------------------
	if WRSet.AY_XS~=5
	--消散开启
	and
	WR_SpellUsable("消散")
	--技能可用 资源可用
	and
	PlayerHP<=WRSet.AY_XS/10
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","消散",zhandoumoshi) --显示指定色块窗体
		return
	end
	--消散----------------------------------------------------------------------------------------------

	
	if WR_SpellUsable("沉默") then
	--技能可用 资源可用
		--沉默T
		if WRSet.AY_CM~=3
		--沉默 开启
		and WR_GetUnitRange("target")<=40
		--单位距离
		and WR_TargetInCombat("target")
		--单位可攻击
		and WR_GetCastInterruptible("target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN5","沉默T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--沉默M
		if WRSet.AY_CM==1
		--智能打断
		and WR_GetUnitRange("mouseover")<=40
		--单位距离
		and WR_TargetInCombat("mouseover")
		--单位可攻击
		and WR_GetCastInterruptible("mouseover",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN8","沉默M",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	------------------------------------------------------------------------------------------

--施法速度判定---------------------------------------------------------------------------------------
	if GCD>ShiFaSuDu
	--公共冷却>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
--施法速度判定---------------------------------------------------------------------------------------
	--[[
		--
		if 
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("","",zhandoumoshi) --显示指定色块窗体
			return
		end
	]]--
	
	--净化受难--------------------------------------------------------------------------------------------
	if WR_SpellUsable("净化疾病")
	--技能可用 资源可用
	and
	WR_GetUnitRange("mouseover")<=40
	--单位距离
	and
	UnitName("mouseover")=="受难之魂"
	--单位是受难之魂
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSG","净化受难",zhandoumoshi) --显示指定色块窗体
		return
	end
	--净化受难--------------------------------------------------------------------------------------------

	--净化疾病--------------------------------------------------------------------------------------------
	if WRSet.AY_JHJB==1
	--净化疾病 智能
	and
	WR_SpellUsable("净化疾病")
	--技能可用 资源可用
	then
		--净化P--------------------------------------------------------------------------------------------
		if WR_CanRemoveUnitDebuff("player")
		--单位有可驱散Debuff
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF1","净化P",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净化P--------------------------------------------------------------------------------------------
		
		
		--净化P1--------------------------------------------------------------------------------------------
		if not(UnitCanAttack("player","party1"))
		--单位是友善的
		and
		WR_CanRemoveUnitDebuff("party1")
		--单位有可驱散Debuff
		and
		WR_GetUnitRange("party1")<=40
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","净化P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净化P1--------------------------------------------------------------------------------------------
		
		--净化P2--------------------------------------------------------------------------------------------
		if not(UnitCanAttack("player","party2"))
		--单位是友善的
		and
		WR_CanRemoveUnitDebuff("party2")
		--单位有可驱散Debuff
		and
		WR_GetUnitRange("party2")<=40
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","净化P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净化P2--------------------------------------------------------------------------------------------
		
		--净化P3--------------------------------------------------------------------------------------------
		if not(UnitCanAttack("player","party3"))
		--单位是友善的
		and
		WR_CanRemoveUnitDebuff("party3")
		--单位有可驱散Debuff
		and
		WR_GetUnitRange("party3")<=40
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF4","净化P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净化P3--------------------------------------------------------------------------------------------
		
		--净化P4--------------------------------------------------------------------------------------------
		if not(UnitCanAttack("player","party4"))
		--单位是友善的
		and
		WR_CanRemoveUnitDebuff("party4")
		--单位有可驱散Debuff
		and
		WR_GetUnitRange("party4")<=40
		--单位距离
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","净化P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--净化P4--------------------------------------------------------------------------------------------
	end
	--净化疾病--------------------------------------------------------------------------------------------

	--控制虚体--------------------------------------------------------------------------------------------
	if UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not(PlayerMove)
	--自身不在移动或者空中
	then
		--统御意志--------------------------------------------------------------------------------------------
		if IsPlayerSpell(205364)
		--已学天赋[统御意志]
		and
		IsSpellInRange("统御意志","mouseover")==1
		--单位在技能范围内
		and
		not(WR_StopCast(WR_GetTrueCastTime(1.8)))
		--避免施法被沉默的情况
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF9","统御意志",zhandoumoshi) --显示指定色块窗体
			return
		end
		--统御意志--------------------------------------------------------------------------------------------

		--束缚亡灵--------------------------------------------------------------------------------------------
		if IsPlayerSpell(9484)
		--已学天赋[束缚亡灵]
		and
		IsSpellInRange("束缚亡灵","mouseover")==1
		--单位在技能范围内
		and
		not(WR_StopCast(WR_GetTrueCastTime(1.5)))
		--避免施法被沉默的情况
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","束缚亡灵",zhandoumoshi) --显示指定色块窗体
			return
		end
		--束缚亡灵--------------------------------------------------------------------------------------------
	end
	--控制虚体--------------------------------------------------------------------------------------------

	--驱散魔法--------------------------------------------------------------------------------------------
	if WRSet.AY_QSMF==1
	--驱散魔法开启
	and
	IsPlayerSpell(528)
	--已学天赋[驱散魔法]
	and
	PlayerInCombat
	--玩家在战斗
	then
		--驱散T--------------------------------------------------------------------------------------------
		if WR_GetUnitRange("target")<=30
		--单位距离
		and
		UnitCanAttack("player","target")
		--单位是敌方
		and
		WR_GetUnitBuffType("target","Magic")
		--单位身上有魔法效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF11","驱散T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--驱散T--------------------------------------------------------------------------------------------
		
		--驱散P1--------------------------------------------------------------------------------------------
		if WR_GetUnitRange("party1target")<=30
		--单位距离
		and
		UnitCanAttack("player","party1target")
		--单位是敌方
		and
		WR_GetUnitBuffType("party1target","Magic")
		--单位身上有魔法效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF3","驱散P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--驱散P1--------------------------------------------------------------------------------------------
		
		--驱散P2--------------------------------------------------------------------------------------------
		if WR_GetUnitRange("party2target")<=30
		--单位距离
		and
		UnitCanAttack("player","party2target")
		--单位是敌方
		and
		WR_GetUnitBuffType("party2target","Magic")
		--单位身上有魔法效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF5","驱散P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--驱散P2--------------------------------------------------------------------------------------------
		
		--驱散P3--------------------------------------------------------------------------------------------
		if WR_GetUnitRange("party3target")<=30
		--单位距离
		and
		UnitCanAttack("player","party3target")
		--单位是敌方
		and
		WR_GetUnitBuffType("party3target","Magic")
		--单位身上有魔法效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF6","驱散P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--驱散P3--------------------------------------------------------------------------------------------
		
		--驱散P4--------------------------------------------------------------------------------------------
		if WR_GetUnitRange("party4target")<=30
		--单位距离
		and
		UnitCanAttack("player","party4target")
		--单位是敌方
		and
		WR_GetUnitBuffType("party4target","Magic")
		--单位身上有魔法效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF7","驱散P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--驱散P4--------------------------------------------------------------------------------------------
	end
	--驱散魔法--------------------------------------------------------------------------------------------

	--暗影形态
	if WR_SpellUsable("暗影形态")
	--技能可用 资源可用
	and
	WR_GetUnitBuffInfo("player","暗影形态")==0
	and
	WR_GetUnitBuffInfo("player","虚空形态")==0
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","暗影形态",zhandoumoshi) --显示指定色块窗体
		return
	end

	--真言术：韧--------------------------------------------------------------------------------------------
	if WR_PartyNotBuff("真言术：韧")
	--如果队友没有真言术：韧
	and
	BuffTime_XKXT==0
	--虚空形态BUFF不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSO","真言术韧",zhandoumoshi) --显示指定色块窗体
		return
	end
	--真言术：韧--------------------------------------------------------------------------------------------

	--真言术：盾
	if WR_PriestShadow_ZYSD_Me()
	--施法条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF9","盾",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--防护快疗--------------------------------------------------------------------------------------------
	if WR_PriestShadow_KSZL_FHSG()
	--快速治疗 防护圣光 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF8","防护快疗",zhandoumoshi) --显示指定色块窗体
		return
	end
	--防护快疗--------------------------------------------------------------------------------------------
	
--战斗循环-------------------------------------------------------------
	if not TargetInCombat
	--当前目标不在战斗中，则不继续往下运行
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	
	--暗影冲撞
	if WR_SpellUsable("暗影冲撞")
	--技能可用 资源可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	TargetInCombat
	--当前目标在战斗中
	and
	(
		AvgDeathTime>8
		--战斗持续时间>8秒
		or
		InTraining
		--打木桩
	)
	and
	(
		RangeHarmUnitCount40>=2
		--40码内战斗单位>=2
		or
		InTraining
		--打木桩
	)
	and
	(
		(
			DebuffTime_XXGZC<=6.3
			--吸血鬼之触<=6.3秒
			and
			BuffTime_XKXT==0
			--虚空形态不存在
			and
			ChannelName==nil
			--引导施法不存在
		)
		or
		DebuffTime_XXGZC<=1
		--吸血鬼之触<=1秒
	)
	then
		if WRSet.AY_AYCZ==1 then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSP","提示冲撞",zhandoumoshi) --显示指定色块窗体
			return
		end
		if WRSet.AY_AYCZ==2 then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSU","指向冲撞",zhandoumoshi) --显示指定色块窗体
			return
		end
	end

	--吸血鬼之触
	if WR_SpellUsable("吸血鬼之触")
	--技能可用 资源可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	not(PlayerMove)
	--没有移动
	and
	not(WR_StopCast(WR_GetMaxGCD(1.5)+0.2))
	--避免施法被沉默的情况
	and
	CastingName~="吸血鬼之触"
	--当前施法不是吸血鬼之触
	and
	DebuffTime_XXGZC<=6.3
	--吸血鬼之触Debuff<=6.3秒
	and
	TargetInCombat
	--当前目标在战斗中
	and
	(
		(
			CD_AYCZ>5
			--暗影冲撞CD>5
			and
			CD_AYCZ<18
			--暗影冲撞CD<18
		)
		or
		(
			WRSet.AY_AYCZ==3
			--关闭暗影冲撞
			and
			CD_AYCZ<=GCD
			--暗影冲撞<=GCD
			and
			DebuffTime_XXGZC==0
			--吸血鬼之触Debuff不存在
		)
		or
		(
			not InTraining
			--不是打木桩
			and
			(
				RangeHarmUnitCount40<=1
				--40码内战斗单位<=1
				or
				AvgDeathTime<=8
				--战斗持续时间<8=秒
			)
		)
		or
		not IsPlayerSpell(205385)
		--没学技能 [暗影冲撞]
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","触",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--吸血鬼的拥抱--------------------------------------------------------------------------------------------
	if WRSet.AY_XXGDYB==1
	--吸血鬼的拥抱 开启
	and
	WR_SpellUsable("吸血鬼的拥抱")
	--技能可用 资源可用
	and
	WR_GetUnitBuffInfo("player","虚空形态")>12
	--虚空形态 BUFF时间>12秒
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSB","吸血鬼",zhandoumoshi) --显示指定色块窗体
		return
	end
	--吸血鬼的拥抱--------------------------------------------------------------------------------------------
		
	if 
	CD_AYCZ>0
	--暗影冲撞CD>0
	or
	DebuffTime_XXGZC>0
	--吸血鬼之触Debuff存在
	or
	CastingName=="吸血鬼之触"
	--当前施法是 吸血鬼之触
	then
		--暗影魔1
		if zhandoumoshi==1
		--开爆发
		and
		WRSet.AY_AYM==1
		--暗影魔开启
		and
		WR_SpellUsable("暗影魔")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		BuffTime_XKXT==0
		--虚空形态BUFF不存在
		and
		BuffTime_AYZB==0
		--10.1四件套暗焰遮蔽效果不存在
		and
		ChannelName==nil
		--引导施法不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSZ","暗影魔1",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--虚空爆发--------------------------------------------------------------------------------------------
		if WRSet.AY_XKBF==1
		--虚空爆发 开启
		and
		zhandoumoshi==1
		--开爆发
		and
		WR_SpellUsable("虚空爆发")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		not(PlayerMove)
		--没有移动
		and
		not(WR_StopCast(WR_GetMaxGCD(1.5)+0.2))
		--避免施法被沉默的情况
		and
		CastingName~="虚空爆发"
--[[
		and
		(
			GetSpellCharges("心灵震爆")==0
			--心灵震爆次数=0次
			or
			(
				GetSpellCharges("心灵震爆")==1
				--心灵震爆次数=1次
				and
				CastingName=="心灵震爆"
				--当前施法是心灵震爆
			)
		)
--]]
		then
		

			--爆发药水
			if WRSet.AY_BFYS==1 then
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
						WR_ShowColorFrame("CSF9","爆发药水",zhandoumoshi) --显示指定色块窗体
						return
					end
				end
			end
		
			--饰品--------------------------------------------------------------------------------------------
			if zhandoumoshi==1 then
			--开爆发
				--饰品1
				if (WRSet.AY_SP==1 or WRSet.AY_SP==3)
				--使用1号饰品 或 使用1-2号饰品
				and WR_GetEquipCD(13)
				--1号饰品可以使用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF2","饰品1",zhandoumoshi) --显示指定色块窗体
					return
				end
				------------------------------------------------------------------------------------------
				--饰品2
				if (WRSet.AY_SP==2 or WRSet.AY_SP==3)
				--使用2号饰品 或 使用1-2号饰品
				and WR_GetEquipCD(14)
				--2号饰品可以使用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF3","饰品2",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
			--饰品--------------------------------------------------------------------------------------------
			--能量灌注--------------------------------------------------------------------------------------------
			if zhandoumoshi==1
			--开爆发
			and
			WR_SpellUsable("能量灌注")
			--技能可用 资源可用
			then
				if WRSet.AY_NLGZ==1
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF5","能量灌注1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if WRSet.AY_NLGZ==2
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF6","能量灌注2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if WRSet.AY_NLGZ==3
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF7","能量灌注3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if WRSet.AY_NLGZ==4
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACF9","能量灌注4",zhandoumoshi) --显示指定色块窗体
					return
				end
			--能量灌注--------------------------------------------------------------------------------------------
			end
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","虚空爆发",zhandoumoshi) --显示指定色块窗体
			return
		end
		--虚空爆发--------------------------------------------------------------------------------------------
		
		--暗焰遮蔽--------------------------------------------------------------------------------------------
		if 
		BuffTime_AYZB>GCD
		--10.1四件套暗焰遮蔽效果时间>GCD
		then
			--暗焰满震
			if BuffTime_AYZB>WR_GetMaxGCD(1.5)
			--10.1四件套暗焰遮蔽效果时间>心灵震爆施法时间
			and
			WR_PriestShadow_XLZB_MAX()
			--心灵震爆 满层条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSN","暗焰满震",zhandoumoshi) --显示指定色块窗体
				return
			end
			--暗焰满震

			--暗焰虚箭
			if WR_PriestShadow_XKJ()
			--虚空箭 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF6","暗焰虚箭",zhandoumoshi) --显示指定色块窗体
				return
			end
			--暗焰虚箭
			
			--暗焰震爆
			if BuffTime_AYZB>WR_GetMaxGCD(1.5)
			--10.1四件套暗焰遮蔽效果时间>心灵震爆施法时间
			and
			WR_PriestShadow_XLZB()
			--心灵震爆 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSN","暗焰震爆",zhandoumoshi) --显示指定色块窗体
				return
			end
			--暗焰震爆
			
			--暗焰噬病
			if WR_SpellUsable("噬灵疫病")
			--技能可用 资源可用
			and
			WR_GetUnitRange("target")<=40
			--单位距离
			and
			(
				BuffCount_AYYJ<3
				--暗焰余烬层数<3层
				or
				zhandoumoshi==1
				--开爆发
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF10","暗焰噬病",zhandoumoshi) --显示指定色块窗体
				return
			end
			--暗焰噬病
		end
		--暗焰遮蔽--------------------------------------------------------------------------------------------
		
		--虚空箭
		if WR_PriestShadow_XKJ()
		--虚空箭 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","虚空箭",zhandoumoshi) --显示指定色块窗体
			return
		end
		--虚空箭

		--噬灵疫病
		if WR_SpellUsable("噬灵疫病")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		(
			BuffCount_AYYJ<3
			--暗焰余烬层数<3层
			or
			zhandoumoshi==1
			--开爆发
		)
		and
		(
			BuffTime_XKXT>GCD
			--虚空形态BUFF存在的情况可以倾泻能量续虚空形态的时间
			or
			(
				BuffTime_XKXT==0
				--虚空形态BUFF不存在
				and
				DebuffTime_SLYB<1.8
				--目标噬灵疫病Debuff剩余时间<1.8秒
				and
				(
					CD_XKBF>DebuffTime_SLYB
					--虚空爆发CD>噬灵疫病Debuff剩余时间
					or
					WRSet.AY_XKBF==2
					--虚空爆发 关闭
				)
				--这段条件的目的是：在非虚空形态下，保持疫病确保精通加成
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF10","噬灵疫病",zhandoumoshi) --显示指定色块窗体
			return
		end
		--噬灵疫病
		
--[[
		--噬灵精通
		if WR_SpellUsable("噬灵疫病")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		(
			BuffCount_AYYJ<3
			--暗焰余烬层数<3层
			or
			AvgDeathTime>12
			--战斗持续时间>12秒
			or
			InTraining
			--打木桩
		)
		and
		BuffTime_XKXT==0
		--虚空形态BUFF不存在
		and
		DebuffTime_SLYB<1.8
		--目标噬灵疫病Debuff剩余时间<1.8秒
		and
		(
			CD_XKBF>DebuffTime_SLYB
			--虚空爆发CD>噬灵疫病Debuff剩余时间
			or
			zhandoumoshi==0
		)
		--这段条件的目的是：在非虚空形态下，10.1四件套暗焰遮蔽存在的时候，保持疫病确保精通加成
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF10","噬灵精通",zhandoumoshi) --显示指定色块窗体
			return
		end
		--噬灵精通
]]--

		--满震
		if WR_PriestShadow_XLZB_MAX()
		--心灵震爆 满层条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSN","满震",zhandoumoshi) --显示指定色块窗体
			return
		end
		--满震
		
		--震爆后剑
		if WR_PriestShadow_XLZB()
		--心灵震爆 施法条件
		and
		WR_SpellUsable("虚空洪流")
		--虚空洪流可用
		and
		BuffTime_XKXT>CD_XKJ+GCD
		--虚空形态 BUFF时间>虚空箭CD+GCD
		and
		BuffTime_XKXT>CastTime_XLZB+GCD+0.2
		--虚空形态 BUFF时间>心灵震爆施法时间+GCD+0.2
		and
		CD_XKJ<CastTime_XLZB+GCD
		--虚空箭CD<心灵震爆施法时间+GCD
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSN","震爆后剑",zhandoumoshi) --显示指定色块窗体
			return
		end
		--这段的目的是，当虚空洪流可以用的时候，但是震爆后可以打一个虚空箭，那么优先打完震爆+虚空箭再打洪流，目的是不要让虚空箭空等
		
		--虚空洪流
		if WR_SpellUsable("虚空洪流")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		WRSet.AY_XKHL==1
		--虚空洪流开启
		and
		not(PlayerMove)
		--没有移动
		and
		not(WR_StopCast(3+0.2))
		--避免施法被沉默的情况
		and
		ChannelName==nil
		--引导施法不存在
		and
		(
			zhandoumoshi==1
			--开爆发
			or
			InsanityPower<70
			--狂乱值<70
		)
		and
		(
			DebuffTime_SLYB>2.5
			--噬灵疫病Debuff剩余时间>3
			or
			(
				BuffTime_XKXT>2.5
				--虚空形态存在
				and
				CD_XKJ>2.5
				--虚空箭CD>2.5
			)
		)
--[[
		and
		(
			(
				BuffTime_XKXT>0
				--虚空形态存在
				and
				CD_XKJ<BuffTime_XKXT
				--虚空箭CD<虚空形态BUFF时间
				and
				CD_XKJ>2.5
				--虚空箭CD>2.5
			)
			or
			BuffTime_XKXT==0
			--虚空形态不存在
		)
]]--
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","虚空洪流",zhandoumoshi) --显示指定色块窗体
			return
		end

		--控心术
		if WR_SpellUsable("控心术")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		CastingName~="控心术"
		and
		not(PlayerMove)
		--没有移动
		and
		not(WR_StopCast(WR_GetMaxGCD(1.5)+0.2))
		--避免施法被沉默的情况
		and
		ChannelName==nil
		--引导施法不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN7","控心术",zhandoumoshi) --显示指定色块窗体
			return
		end

		--暗影魔2
		if zhandoumoshi==1
		--开爆发
		and
		WRSet.AY_AYM==1
		--暗影魔开启
		and
		WR_SpellUsable("暗影魔")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		ChannelName==nil
		--引导施法不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSZ","暗影魔2",zhandoumoshi) --显示指定色块窗体
			return
		end

		--心灵震爆
		if WR_PriestShadow_XLZB()
		--心灵震爆 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSN","心灵震爆",zhandoumoshi) --显示指定色块窗体
			return
		end
		--心灵震爆

		--光晕
		if WR_SpellUsable("光晕")
		--技能可用 资源可用
		and
		BuffTime_AYZB==0
		--10.1四件套暗焰遮蔽效果不存在
		and
		not(PlayerMove)
		--没有移动
		and
		not(WR_StopCast(WR_GetMaxGCD(1.5)+0.2))
		--避免施法被沉默的情况
		and
		ChannelName==nil
		--引导施法不存在
		and
		(
			InTraining
			--打木桩
			or
			(
				RangeHarmUnitCount30>=2
				--30码敌人数量>=2
				and
				AvgDeathTime>20
				--战斗持续时间>20秒
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF8","光晕",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--精神鞭笞：狂
		if WR_SpellUsable("精神鞭笞")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		not(PlayerMove)
		--没有移动
		and
		ChannelName==nil
		--引导施法不存在
		and
		not(WR_StopCast(WR_GetMaxGCD(3)+0.2))
		--避免施法被沉默的情况
		and
		BuffTime_JSBCK>0
		--精神鞭笞：狂BUFF存在
		and
		(
			BuffTime_XKXT==0
			--虚空形态不存在
			or
			(
				BuffTime_XKXT>0
				--虚空形态存在
				and
				CD_XKJ<BuffTime_XKXT
				--虚空箭CD<虚空形态BUFF时间
				and
				(
					(
						BuffCount_JSBCK>=2
						--精神鞭笞：狂buff>=2层
						and
						CD_XKJ>WR_GetMaxGCD(1.5)
						--虚空箭CD>最大GCD
					)
					or
					(
						BuffCount_JSBCK==1
						--精神鞭笞：狂buff=1层
						and
						CD_XKJ>WR_GetMaxGCD(3)
						--虚空箭CD>精神鞭笞：狂引导时间
					)
				)
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSH","狂鞭",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--暗言术：灭
		if WR_SpellUsable("暗言术：灭")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		UnitHealth("target")/UnitHealthMax("target")<0.2
		--目标生命比例
		and
		ChannelName==nil
		--引导施法不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSJ","灭",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--精神鞭笞
		if WR_SpellUsable("精神鞭笞")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		not(PlayerMove)
		--没有移动
		and
		ChannelName==nil
		--引导施法不存在
		and
		not(WR_StopCast(WR_GetMaxGCD(4.5)+0.2))
		--避免施法被沉默的情况
		and
		BuffTime_XKXT==0
		--虚空形态不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSH","精神鞭笞",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
--战斗循环-------------------------------------------------------------





	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--心灵震爆 施法条件
function WR_PriestShadow_XLZB()
	if 
	(
		GetSpellCharges("心灵震爆")>=1
		--技能次数>=1
		or
		CastingName=="虚空爆发"
		--正在施法 虚空爆发 可以充满次数
	)
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	(
		(
			not(PlayerMove)
			--没有移动
			and
			not(WR_StopCast(WR_GetMaxGCD(1.5)+0.2))
			--避免施法被沉默的情况
		)
		or
		BuffTime_AYDC>0
		--暗影洞察BUFF存在，瞬发
	)
	then
		return true
	end
	return false
end

--心灵震爆 满层条件
function WR_PriestShadow_XLZB_MAX()
	if 
		WR_PriestShadow_XLZB()
		--技能条件通过
		and
		(
			(
				CastingName~="心灵震爆"
				and
				(
					GetSpellCharges("心灵震爆")==2
					--心灵震爆次数=2次
					or
					CD_XLZB<GCD_Max
					--心灵震爆冷却时间<最大GCD
				)
			)
			or
			(
				zhandoumoshi==1
				--开爆发
				and
				CD_XKBF<WR_GetMaxGCD(1.5)
				--虚空爆发CD<心灵震爆施法时间
				--虚空爆发会充满心灵震爆使用次数
			)
		)
	then
		return true
	end
	return false
end

--虚空箭 施法条件
function WR_PriestShadow_XKJ()
	if 
		WR_SpellUsable("虚空箭")
		--技能可用 资源可用
		and
		WR_GetUnitRange("target")<=40
		--单位距离
		and
		(
			BuffTime_XKXT>0
			--虚空形态存在
			or
			CD_XKBF>=119.7
			--虚空爆发CD>119.7秒
			or
			CastingName=="虚空爆发"
			--当前施法 虚空爆发
		)
	then
		return true
	end
	return false
end

--真言术：盾 对自己施法条件
function WR_PriestShadow_ZYSD_Me()
	if WRSet.AY_ZYSD==1
	--真言术：盾 开启
	and
	WR_SpellUsable("真言术：盾")
	--技能可用 资源可用
	and
	WR_GetUnitBuffInfo("player","真言术：盾")==0
	--单位没有 真言术：盾 BUFF
    and
    PlayerInCombat
    --玩家在战斗中
    and
    (
		ResistOutburst
		--尖刺型施法
		or
		MustDefenseSpell
		--必须开减伤
        or
        PlayerHP<0.3
        --玩家血量比例<0.3
        or
        WR_Mustheal("player")
        --玩家必须获得治愈
    )
	then
		return true
	end
	return false
end

--快速治疗 [防护圣光] 施法条件
function WR_PriestShadow_KSZL_FHSG()
	if WRSet.AY_FHSG==1
	--防护圣光 开启
	and
	WR_SpellUsable("快速治疗")
	--技能可用 资源可用
	and
	IsPlayerSpell(193063)
	--已学习 防护圣光
	and
	WR_GetUnitBuffInfo("player","防护圣光")==0
	--BUFF 不存在
	and
	UnitCastingInfo("player")~="快速治疗"
	--当前没有施法 快速治疗
	and
	(
		ResistOutburst
		--尖刺型施法
		or
		MustDefenseSpell
		--必须开减伤
	)
	and
	(
		WR_GetInRiadOrParty()~="raid"
		--不在团队
		and
		not(PlayerMove)
		--自身不在移动或者空中
		and
		not(WR_StopCast(WR_GetTrueCastTime(1.4)))
		--避免施法被沉默的情况
	)
	then
		return true
	end
	return false
end