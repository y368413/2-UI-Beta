--敏锐运行库
function WR_RogueSubtlety()
	if GetSpecialization()~=3 then	--如果不是(3)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3

	local T31={
    [1]=207234,
    [2]=207235,
    [3]=207236,
    [4]=207237,
    [5]=207239,
	}
	T31Count=WR_GetSuit(T31)	--获得T31套装的数量
	
	local T32={
    [1]=217206,
    [2]=217207,
    [3]=217208,
    [4]=217209,
    [5]=217210,
	}
	T32Count=WR_GetSuit(T32)	--获得T32套装的数量

	WR_LFGList() --获得预组队多语言列表
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	Latency=WR_GetMaxLatency()	--获得当前网络延时
	GCD=WR_GetGCD("偷袭")	--获得公共冷却剩余时间或者当前施法剩余时间
	GCD_Next=GCD+Latency	--获得下一个技能时间

	BuffTime_QX,BuffCount_QX,BuffSum_QX=WR_GetUnitBuffInfo("player","潜行")	--获得潜行Buff信息
	BuffTime_XS,BuffCount_XS,BuffSum_XS=WR_GetUnitBuffInfo("player","消失")	--获得消失Buff信息
	BuffTime_AYZW,BuffCount_AYZW,BuffSum_AYZW=WR_GetUnitBuffInfo("player","暗影之舞")	--获得暗影之舞Buff信息
	BuffTime_GZ,BuffCount_GZ,BuffSum_GZ=WR_GetUnitBuffInfo("player","诡诈")	--获得诡诈Buff信息
	BuffTime_QG,BuffCount_QG,BuffSum_QG=WR_GetUnitBuffInfo("player","切割")	--获得切割Buff信息
	BuffTime_YG,BuffCount_YG,BuffSum_YG=WR_GetUnitBuffInfo("player","佯攻")	--获得 佯攻 Buff信息
	BuffTime_SXYG,BuffCount_SXYG,BuffSum_SXYG=WR_GetUnitBuffInfo("player","速效药膏")	--获得 速效药膏 Buff信息
	BuffTime_ZSYG,BuffCount_ZSYG,BuffSum_ZSYG=WR_GetUnitBuffInfo("player","致伤药膏")	--获得 致伤药膏 Buff信息
	BuffTime_YM,BuffCount_YM,BuffSum_YM=WR_GetUnitBuffInfo("player","预谋")	--获得 预谋 Buff信息
	BuffTime_ZJJ_GL,BuffCount_ZJJ_GL,BuffSum_ZJJ_GL=WR_GetUnitBuffInfo("player","终结技：割裂")	--获得 终结技：割裂 Buff信息
	BuffTime_DHZW,BuffCount_DHZW,BuffSum_DHZW=WR_GetUnitBuffInfo("player","断魂之舞")	--获得 断魂之舞 Buff信息
	BuffTime_SWFJ,BuffCount_SWFJ,BuffSum_SWFJ=WR_GetUnitBuffInfo("player","死亡符记")	--获得 死亡符记 Buff信息
	BuffTime_KRBC,BuffCount_KRBC,BuffSum_KRBC=WR_GetUnitBuffInfo("player","狂热鞭笞")	--获得 狂热鞭笞 Buff信息
	BuffTime_AYZR,BuffCount_AYZR,BuffSum_AYZR=WR_GetUnitBuffInfo("player","暗影之刃")	--获得 暗影之刃 Buff信息
	BuffTime_XJXF,BuffCount_XJXF,BuffSum_XJXF=WR_GetUnitBuffInfo("player","袖剑旋风")	--获得 袖剑旋风 Buff信息
	
	

	Energy=UnitPower("player",3)	--获得能量的数量
	ComboPoints=UnitPower("player",4)	--获得连击点的数量
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得自身血量比例
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	Training=WR_InTraining()	--获得是否在打木桩
	TargetRange=WR_GetUnitRange("target")	--获得目标距离
	TargetInCombat=WR_TargetInCombat("target") --获得目标可攻击
	HUCountRange10=WR_GetRangeHarmUnitCount(10)	--获得8码敌人数量
	if WR_SingleUnit() then
	--单体目标
		HUCountRange10=1
	end
	HUCountRange30=WR_GetRangeHarmUnitCount(30,not(Training))	--获得30码内的敌人数量（如果在打木桩，监测任意单位，如果不在打木桩，只监测战斗中的单位）
	SingleUnit=WR_SingleUnit()	--单体目标判断

	StealthEruption=false	--隐身爆发
	if BuffCount_QX>=1 or BuffTime_XS>=GCD_Next or BuffTime_AYZW>=GCD_Next or BuffTime_GZ>=GCD_Next then
    --潜行Buff存在 或 消失Buff时间>下一个技能时间 或 暗影之舞Buff时间>下一个技能时间 或 诡诈Buff时间>下一个技能时间
		StealthEruption=true	--隐身爆发
	end

	WR_RogueSubtlety_DanceSpell()	--获得可叠跳舞的技能

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

	--战斗检测色块窗体---------------------------------------------------------------------------------------
	if UnitAffectingCombat("player")
	--玩家在战斗
	or
	Training
	--在打木桩
--[[
	or
	(
		TargetInCombat
		--目标可攻击
		and
		TargetRange<=8
		--目标在近战范围
	)
--]]
	or
	BuffCount_QX==0
	--潜行不存在,目的是脱战潜行
	or
	BuffCount_XS>0
	--消失存在，防止消失认为脱战
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
		WR_ShowColorFrame("ASF3","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("ASF2","平伤",0) --显示指定色块窗体
	end
	--爆发或非爆发检测---------------------------------------------------------------------------------------

	--治疗石
	if WRSet.MR_ZLS~=5
	--治疗石选项不是关闭的
	and
	PlayerHP<WRSet.MR_ZLS/10
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

	--治疗药水
	if WRSet.MR_ZLYS~=5
	--治疗药水选项不是关闭的
	and
	PlayerHP<WRSet.MR_ZLYS/10
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

	--猩红之瓶
	if WRSet.MR_XHZP~=8	
	--猩红之瓶选项不是关闭的
	and
	WR_SpellUsable("猩红之瓶")
	--技能可用 资源可用
	and
	PlayerHP<WRSet.MR_XHZP/10
	--血量比例<猩红之瓶设定值/10
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","猩红之瓶",zhandoumoshi) --显示指定色块窗体
		return
	end

	--脱战潜行
	if not UnitAffectingCombat("player")
	--玩家不在战斗
	and
	BuffCount_XS==0
	--消失Buff不存在
	and WR_SpellUsable("潜行")
	--技能可用 资源可用
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

	--智能目标
	if WRSet.MR_ZNMB==1
	--智能目标开启
	and
	UnitAffectingCombat("player")
	--玩家在战斗
	and
	HUCountRange10>=1
	--附近单位>=1
	and
	(
		not(TargetInCombat)
		--目标不可被攻击
		or
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
		--WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","目标",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--脚踢
	if WR_SpellUsable("脚踢")
	--技能可用 资源可用
	and
	BuffCount_QX==0
	--潜行不存在
	then
		--脚踢T
		if (WRSet.MR_JT==1 or WRSet.MR_JT==2)
		--智能 或 目标
		and
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
		if WRSet.MR_JT==1
		--智能脚踢
		and
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
		if WRSet.MR_JT==1
		--智能脚踢
		and
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
		if WRSet.MR_JT==1
		--智能脚踢
		and
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
		if WRSet.MR_JT==1
		--智能脚踢
		and
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
		if WRSet.MR_JT==1
		--智能脚踢
		and
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
	
	--嫁祸
	if WR_SpellUsable("嫁祸诀窍")
	--技能可用 资源可用
	and
	BuffCount_QX>0
	--潜行BUFF存在
	and
	not(UnitAffectingCombat("player"))
	--玩家不在战斗中
	and ( ErrorMessageTime_OutOfSight==nil or GetTime()-ErrorMessageTime_OutOfSight>2 )
	--        目标不在视野错误不存在       或     目标不在视野错误出现时间超过2秒
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
	
	--致盲
	if WR_SpellUsable("致盲")
	--技能可用 资源可用
	and
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
	
	--佯攻----------------------------------------------------------------------------------------------
	if WRSet.MR_YG==1
	--佯攻开启
	and
	WR_SpellUsable("佯攻")
	--技能可用 资源可用
	and
	not(StealthEruption)
	--非隐身爆发期间
	and
	BuffCount_YG==0
	--佯攻BUFF不存在
	and
	(
		WR_ResistOutburst(3)
		--尖刺型伤害，施法时间剩余小于3秒
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSV","佯攻",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--毒刃----------------------------------------------------------------------------------------------
	if WRSet.MR_DR==1
	--毒刃开启
	and
	WR_SpellUsable("毒刃")
	--技能可用 资源可用
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
	
	--肾击----------------------------------------------------------------------------------------------
	if WRSet.MR_SJ==1
	--肾击开启
	and
	WR_SpellUsable("肾击")
	--技能可用 资源可用
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
	
	--致盲
	if WRSet.MR_ZM==1
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
	
	--速效药膏----------------------------------------------------------------------------------------------
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
	
	
	
	
	
	
	
	
	
	if WR_RogueSubtlety_AYZR()
	--暗影之刃
	then
		--血性狂怒 狂暴
		if (IsPlayerSpell(20572) and WR_GetGCD("血性狂怒")<=GCD) or (IsPlayerSpell(26297) and WR_GetGCD("狂暴")<=GCD) then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF5","种族天赋",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1
		if (WRSet.MR_SP==1 or WRSet.MR_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--饰品2
		if (WRSet.MR_SP==2 or WRSet.MR_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF12","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--爆发药水
		if WRSet.MR_BFYS==1 then
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
		
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","暗影之刃",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_SWFJ()
	--死亡符记
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF10","死亡符记",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_AYZW()
	--暗影之舞
	and
	GetSpellCharges("暗影之舞")==2
	--技能可用次数
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","暗舞2层",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_XS()
	--消失
	and
	GetSpellCharges("消失")==2
	--技能可用次数
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","消失2",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_AYZW()
	--暗影之舞
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","暗影之舞",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_XS()
	--消失
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","消失",zhandoumoshi) --显示指定色块窗体
		return
	end
	
----GCD检测----------------------------------------------------------------------------------------------
	if GCD>ShiFaSuDu then
	--当前GCD剩余时间>施法速度
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----GCD检测----------------------------------------------------------------------------------------------




	if WR_RogueSubtlety_KRBC()
	--狂热鞭笞
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","狂热鞭笞",zhandoumoshi) --显示指定色块窗体
		return
	end









	if WR_RogueSubtlety_GL_0("target")
	--割裂0T
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","割裂0T",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL_0("mouseover")
	--割裂0M
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSM","割裂0M",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL_0("party1target")
	--割裂0P1
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSP","割裂0P1",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL_0("party2target")
	--割裂0P2
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSL","割裂0P2",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL_0("party3target")
	--割裂0P3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSO","割裂0P3",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL_0("party4target")
	--割裂0P4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSK","割裂0P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_RogueSubtlety_Wait_QG()
	--切割
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("Stop","等待切割",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_QG()
	--切割
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF9","切割",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_XJXF()
	--袖剑旋风
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF6","袖剑旋风",zhandoumoshi) --显示指定色块窗体
		return
	end













	if WR_RogueSubtlety_YFS()
	--影分身
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","影分身",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_RogueSubtlety_GL("target")
	--割裂T
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","割裂T",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL("mouseover")
	--割裂M
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSM","割裂0M",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL("party1target")
	--割裂P1
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSP","割裂0P1",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL("party2target")
	--割裂P2
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSL","割裂0P2",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL("party3target")
	--割裂P3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSO","割裂0P3",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_RogueSubtlety_GL("party4target")
	--割裂P4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSK","割裂0P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_RogueSubtlety_HHY()
	--黑火药
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","黑火药",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_RogueSubtlety_CG()
	--刺骨
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF1","刺骨",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if StealthEruption then
	--隐身爆发中
		if WR_RogueSubtlety_AYDJ()
		--暗影打击
		and
		BuffCount_QX>=1
		--潜行存在
		and
		HUCountRange10<4
		--10码敌人数量<4
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","潜行暗打",zhandoumoshi) --显示指定色块窗体
			return
		end
	
		if WR_RogueSubtlety_BC()
		--背刺
		and
		BuffCount_YM==0
		--预谋BUFF不存在
		and
		BuffTime_AYZW>=GCD_Next+3
		--暗影之舞BUFF时间>=下一个技能时间+3
		and
		BuffTime_AYZR>=GCD_Next
		--暗影之刃BUFF存在
		and
		DanceSpell_BC==true
		--可叠跳舞 背刺
		and
		HUCountRange10<=3
		--10码敌人数量<=3
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","隐身跳舞背刺",zhandoumoshi) --显示指定色块窗体
			return
		end

		if WR_RogueSubtlety_AYDJ()
		--暗影打击
		and
		BuffTime_AYZR>=GCD_Next
		--暗影之刃BUFF存在
		and
		DanceSpell_AYDJ==true
		--可叠跳舞 暗影打击
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","隐身跳舞暗打",zhandoumoshi) --显示指定色块窗体
			return
		end

		if WR_RogueSubtlety_XJFB()
		--袖剑风暴
		and
		BuffCount_YM==0
		--预谋BUFF不存在
		and
		HUCountRange10>=4
		--10码敌人数量>=4
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","隐身风暴",zhandoumoshi) --显示指定色块窗体
			return
		end

		if WR_RogueSubtlety_AYDJ()
		--暗影打击
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","隐身暗打",zhandoumoshi) --显示指定色块窗体
			return
		end
	end

	--能量过多时候
	if Energy>60
	--能量
	and
	(
		Energy>70
		--能量>70
		or
		WR_GetGCD("死亡符记")<=GCD_Next+2
		--死亡符记CD<=2秒
	)
	then
		if WR_RogueSubtlety_XJFB()
		--袖剑风暴
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","袖剑风暴",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		if WR_RogueSubtlety_BC()
		--背刺
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","背刺",zhandoumoshi) --显示指定色块窗体
			return
		end
	end

	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
	
	end


end

--袖剑风暴
function WR_RogueSubtlety_XJFB()
	if WR_SpellUsable("袖剑风暴")
	--技能可用 资源可用
	and
	HUCountRange10>=2
	--10码敌人数量>=2
	and
	not WR_RogueSubtlety_WaitComboPoints()
	--不用等待连击点
	then
		return true
	end
	return false
end

--背刺
function WR_RogueSubtlety_BC()
	if WR_SpellUsable("背刺")
	--技能可用 资源可用
	and
	Energy>=45
	--能量
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	not WR_RogueSubtlety_WaitComboPoints()
	--不用等待连击点
	then
		return true
	end
	return false
end

--割裂
function WR_RogueSubtlety_GL(Unit)
	local DebuffTime_GL,DebuffCount_GL,DebuffSum_GL=WR_GetUnitDebuffInfo(Unit,"割裂",true)
	if WR_SpellUsable("割裂")
	--技能可用 资源可用
	and
	WR_GetUnitRange(Unit)<=8
	--单位距离
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	ComboPoints>=5
	--连击点>=5
	and
	DebuffTime_GL<=(1+ComboPoints)*4*0.3
	--单位割裂DEBUFF时间<=最长续时
	and
	WR_GetUnitDeathTime(Unit)>DebuffTime_GL+(1+ComboPoints)*4
	--单位死亡时间>单位 割裂DEBUFF时间+叠加的割裂时间
	and
	(
		BuffTime_AYZW<GCD_Next
		--暗影之舞BUFF时间<下一个技能时间
		or
		BuffCount_ZJJ_GL>=1
		--终结技：割裂 BUFF存在
	)
	then
		return true
	end
	return false
end

--割裂为0
function WR_RogueSubtlety_GL_0(Unit)
	if WR_RogueSubtlety_GL(Unit)
	--割裂
	and
	WR_GetUnitDebuffInfo(Unit,"割裂",true)<GCD_Next+1
	--单位割裂DEBUFF时间<下一个技能时间+1秒
	then
		return true
	end
	return false
end

--切割
function WR_RogueSubtlety_QG()
	if not StealthEruption
	--非隐身爆发期间
	and
	ComboPoints>=5
	--连击点>=5
	and
	BuffTime_YM==0
	--预谋BUFF不存在
	and
	BuffTime_AYZW<GCD_Next
	--暗影之舞BUFF时间<下一个技能时间
	and
	BuffTime_QG<AvgDeathTime
	--切割BUFF剩余时间<战斗剩余时间
	and
	BuffTime_QG+(1+ComboPoints)*6<AvgDeathTime
	--切割BUFF剩余时间+叠加的切割时间<战斗剩余时间
	and
	BuffTime_QG<=(1+ComboPoints)*6*0.3
	--切割BUFF时间<=最长续时
	then
		return true
	end
	return false
end

--等待 切割
function WR_RogueSubtlety_Wait_QG()
	if not StealthEruption
	--非隐身爆发期间
	and
	ComboPoints<5
	--连击点<5
	and
	WR_RogueSubtlety_WaitComboPoints()
	--等待连击点
	and
	BuffTime_YM==0
	--预谋BUFF不存在
	and
	BuffTime_AYZW<GCD_Next
	--暗影之舞BUFF时间<下一个技能时间
	and
	BuffTime_QG<AvgDeathTime
	--切割BUFF剩余时间<战斗剩余时间
	and
	(
		(
			HUCountRange10+ComboPoints>7
			and
			BuffTime_QG<=(1+7)*6*0.3
			--切割BUFF时间<=最长续时
		)
		or
		(
			HUCountRange10+ComboPoints<=7
			and
			BuffTime_QG<=(1+HUCountRange10+ComboPoints)*6*0.3
			--切割BUFF时间<=最长续时
		)
	)
	then
		return true
	end
	return false
end

--影分身
function WR_RogueSubtlety_YFS()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("影分身")
	--技能可用 资源可用
	and
	(
		WR_SpellUsable("冷血")
		--技能可用 资源可用
		or
		WR_GetGCD("冷血")>BuffTime_AYZW-(GCD_Next+1)
		--冷血CD>暗影之舞BUFF时间-(下一个技能时间+1秒),如果冷血CD较长,就不等冷血了
	)
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	ComboPoints>=3
	--连击点
	and
	(
		ComboPoints>=5
		--连击点
		or
		(AvgDeathTime>0 and AvgDeathTime<GCD_Next+1)
		--战斗结束前的最后一个技能
	)
	and
	BuffCount_DHZW>=2
	--断魂之舞 BUFF层数
	and
	BuffTime_AYZW>GCD_Next+1
	--暗影之舞BUFF时间>下一个技能时间+1秒
	then
		return true
	end
	return false
end

--黑火药
function WR_RogueSubtlety_HHY()
	if WR_SpellUsable("黑火药")
	--技能可用 资源可用
	and
	HUCountRange10>=3
	--10码敌人数量>=3
	and
	ComboPoints>=3
	--连击点
	and
	(
		ComboPoints>=5
		--连击点
		or
		(AvgDeathTime>0 and AvgDeathTime<GCD_Next+1)
		--战斗结束前的最后一个技能
	)
	then
		return true
	end
	return false
end

--刺骨
function WR_RogueSubtlety_CG()
	if WR_SpellUsable("刺骨")
	--技能可用 资源可用
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	ComboPoints>=3
	--连击点
	and
	(
		ComboPoints>=5
		--连击点
		or
		(AvgDeathTime>0 and AvgDeathTime<GCD_Next+1)
		--战斗结束前的最后一个技能
	)
	then
		return true
	end
	return false
end

--狂热鞭笞
function WR_RogueSubtlety_KRBC()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("狂热鞭笞")
	--技能可用 资源可用
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	ComboPoints>=5
	--连击点>=5
	and
	WR_GetGCD("暗影之刃")<=GCD_Next
	--暗影之刃CD好了
	then
		return true
	end
	return false
end

--死亡符记
function WR_RogueSubtlety_SWFJ()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("死亡符记")
	--技能可用 资源可用
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	BuffTime_SWFJ<=3
	--死亡符记 BUFF时间<=3
	and
	WR_GetGCD("暗影之刃")>20
	--暗影之刃CD
	and
	Energy<60
	--能量<60
	then
		return true
	end
	return false
end

--暗影之刃
function WR_RogueSubtlety_AYZR()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("暗影之刃")
	--技能可用 资源可用
	and
	TargetRange<=8
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	BuffTime_KRBC>=GCD_Next
	--狂热鞭笞BUFF时间>下一个技能时间
	and
	(
		ComboPoints<=1
		--连击点<=1
		or
		T31Count>=4
		--T31 4件套
		or
		T32Count>=4
		--T32 4件套
	)
	then
		return true
	end
	return false
end

--袖剑旋风
function WR_RogueSubtlety_XJXF()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("袖剑旋风")
	--技能可用 资源可用
	and
	HUCountRange10>=3
	--10码敌人数量>=3
	and
	BuffTime_SWFJ>=GCD_Next
	--死亡符记 BUFF时间>下一个技能时间
	and
	ComboPoints<=2
	--连击点<=2
	and
	BuffTime_YM<GCD_Next
	--预谋BUFF不存在
	and
	WR_GetGCD("狂热鞭笞")>20
	--狂热鞭笞CD>20
	then
		return true
	end
	return false
end

--暗影之舞
function WR_RogueSubtlety_AYZW()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("暗影之舞")
	--技能可用 资源可用
	and
	not StealthEruption
	--非隐身爆发期间
	and
	TargetRange<=8
	--目标距离
	and
	(
		(
			ComboPoints<5
			--连击点<5
			and
			WR_GetGCD("影分身")<GCD_Next+5
			--影分身CD可以保证在暗影之舞
		)
		or
		(
			ComboPoints>=5
			--连击点<5
			and
			WR_GetGCD("影分身")<GCD_Next+ComboPoints+5
			--影分身CD可以保证在暗影之舞
		)
	)
	and
	(
		WR_GetGCD("冷血")<GCD_Next+4
		--冷血CD<4秒
		or
		WR_GetGCD("冷血")>GCD_Next+10
		--冷血CD>10秒
	)
	then
		return true
	end
	return false
end

--消失
function WR_RogueSubtlety_XS()
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("消失")
	--技能可用 资源可用
	and
	Energy>=45
	--能量
	and
	TargetRange<=30
	--目标距离
	and
	TargetInCombat
	--目标可攻击
	and
	not StealthEruption
	--非隐身爆发期间
	and
	ComboPoints<5
	--连击点<5
	and
	not WR_RogueSubtlety_WaitComboPoints()
	--不用等待连击点
	and
	(
		not IsPlayerSpell(382523)
		--没学技能 [提神影尘]
		or
		(
			IsPlayerSpell(382523)
			--已学技能 [提神影尘]
			and
			WR_GetGCD("暗影之刃")
			--暗影之刃CD>30
			and
			(
				WR_GetGCD("暗影之舞")
				--暗影之舞CD>30
				or
				GetSpellCharges("暗影之舞")==0
				--暗影之舞 可用次数
			)
			and
			WR_GetGCD("死亡符记")
			--死亡符记CD>10
			and
			WR_GetGCD("冷血")
			--冷血CD>30
		)
	)
	then
		return true
	end
	return false
end

--暗影打击
function WR_RogueSubtlety_AYDJ()
	if Energy>=45
	--能量
	and
	TargetRange<=30
	--目标距离
	and
	(
		BuffCount_QX>=1
		--潜行存在
		or
		BuffCount_XS
		--消失存在
		or
		TargetRange<=8
		--目标距离
	)
	and
	TargetInCombat
	--目标可攻击
	and
	StealthEruption
	--潜行爆发中
	and
	not WR_RogueSubtlety_WaitComboPoints()
	--不用等待连击点
	then
		return true
	end
	return false
end

--利用战斗事件，获得断魂之舞期间可以叠跳舞的技能，仅运行一次
function WR_RogueSubtlety_DanceSpell()
	if RogueSubtlety_DanceSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="暗影之舞" then
					--释放成功的技能名称
						DanceSpell_BC=true	--开启 背刺 跳舞
						DanceSpell_AYDJ=true	--开启 暗影打击 跳舞
						DanceSpell_XJFB=true	--开启 袖剑风暴 跳舞
						DanceSpell_GL=true	--开启 割裂 跳舞
						DanceSpell_CG=true	--开启 刺骨 跳舞
						DanceSpell_HHY=true	--开启 黑火药 跳舞
					end
					if BuffCount_AYZW>0 then
					--暗影之舞存在
						if SpellName=="背刺"
						--释放成功的技能名称
						then
							DanceSpell_BC=false	--关闭 背刺 跳舞
						end
						if SpellName=="暗影打击"
						--释放成功的技能名称
						then
							DanceSpell_AYDJ=false	--关闭 暗影打击 跳舞
						end
						if SpellName=="袖剑风暴"
						--释放成功的技能名称
						then
							DanceSpell_XJFB=false	--关闭 袖剑风暴 跳舞
						end
						if SpellName=="割裂"
						--释放成功的技能名称
						then
							DanceSpell_GL=false	--关闭 割裂 跳舞
						end
						if SpellName=="刺骨"
						--释放成功的技能名称
						then
							DanceSpell_CG=false	--关闭 刺骨 跳舞
						end
						if SpellName=="黑火药"
						--释放成功的技能名称
						then
							DanceSpell_HHY=false	--关闭 黑火药 跳舞
						end
					end
				end
			end
	end)
	RogueSubtlety_DanceSpellIsOpen=true                       
end

--等待连击点
function WR_RogueSubtlety_WaitComboPoints()
	if BuffCount_XJXF>=1
	--袖剑旋风 BUFF存在
	and
	HUCountRange10+ComboPoints>=5
	--10码单位数量+身上连击点>=5
	then
		return true
	end
	return false
end