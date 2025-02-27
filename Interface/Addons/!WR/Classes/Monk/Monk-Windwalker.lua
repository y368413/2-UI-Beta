--踏风运行库
function WR_MonkWindwalker()
	
	if GetSpecialization()~=3 then	--如果不是踏风(3)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	WR_LFGList()	--获得预组队多语言列表
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	local T102={
    [1]=207243,
    [2]=207244,
    [3]=207245,
    [4]=207246,
    [5]=207248,
	}
	T102Count=WR_GetSuit(T102)	--获得10.2套装的数量
	
	WR_MonkWindwalker_LastSpell()	--记录上一次使用的技能

	
	PlayerHP = UnitHealth("player")/UnitHealthMax("player")

	PlayerMove = WR_PlayerMove()--获得自身是否在移动或者空中

	PowerRegen = 10*1.1*(1+GetHaste()/100)	--获得每秒实际回能，1.1是因为[真气升腾]天赋增加10%的加速
	Chi = UnitPower("player",12)	--获得真气的数量
	Energy = UnitPower("player",3)	--获得当前能量值
	MaxEnergy = UnitPowerMax("player",3)	--获得最大能量值

	HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--近战 技能范围内的敌人数量
	HUCountRange7=WR_GetRangeHarmUnitCount(7,false)	--神鹤引项踢 和 太极鞋的幻灭踢 技能范围内的敌人数量


	NuLeiPoTrueCooldownTime=WR_GetTrueCastTime(24)	--获得怒雷破实际最长冷却时间
	XuRiDongShengTiTrueCooldownTime=WR_GetTrueCastTime(10)	--获得旭日东升踢实际最长冷却时间
	
	GCD = WR_GetGCD("猛虎掌")	--获得当前公共CD
	CD_NLP = WR_GetGCD("怒雷破")	--获得 怒雷破 CD
	CD_XRDST=WR_GetGCD("旭日东升踢")	--获得 旭日东升踢 的CD
	CD_FLZZJ=WR_GetGCD("风领主之击")	--获得 风领主之击 的CD
	
	ChannelTime_NLP=WR_GetTrueCastTime(4)	--获取怒雷破的引导时间
	
	BuffTime_DXT , BuffCount_DXT , BuffSum_DXT = WR_GetUnitBuffInfo("player","点穴踢")	--点穴踢 BUFF信息
	BuffTime_CYJH , BuffCount_CYJH , BuffSum_CYJH = WR_GetUnitBuffInfo("player","禅院教诲")	--禅院教诲 BUFF信息
	BuffTime_ZQNL , BuffCount_ZQNL , BuffSum_ZQNL = WR_GetUnitBuffInfo("player","真气能量")	--真气能量 BUFF信息

	if WR_GetUnitBuffInfo("player","连击")==0 then
	--如果连击 BUFF不存在，则清空上一次使用的技能
		LastSpell=nil
	end
	WR_MonkWindwalker_BestChiSpell()	--获得最佳真气技能
	
--[[
	local T101={
    [1]=202506,
    [2]=202504,
    [3]=202509,
    [4]=202507,
    [5]=202505,
	}
	T101Count=WR_GetSuit(T101)	--获得10.1套装的数量
	local minDmg, maxDmg = UnitDamage("player")	--获得当前的最低和最高伤害值
	if T101Count>=2 then	--如果身上10.1套装>=2件
		T101_2Value=(minDmg+maxDmg)/2*1.915	--获得10.1套装2件的伤害（约为平均伤害值的1.915倍）
	else
		T101_2Value=0	--没2件套就为0
	end
	ShiFaSuDu=0.15
	
	
	TargetRange=WR_GetUnitRange("target")	--获得目标的距离
	
	
	

	HUCountRange4=WR_GetSpellInRangeHarmUnitCount("幻灭踢",false)

	
	
	
	
	HUCountRange30=WR_GetSpellInRangeHarmUnitCount("嚎镇八方",not(WR_InTraining()))
	
	
	

	FengLingZhuZhiJiCD=WR_GetSpellCD("风领主之击")	--获得风领主之击的CD
	ShenHeYinXiangTiChannelTime=WR_GetTrueCastTime(1.5)	--获取神鹤引项踢的引导时间
	
	
	
	NoShenHeYinJiInRange4=WR_GetNoDebuffRangeUnitCount(4,"神鹤印记",false)	--获取4码内没有我的神鹤印记的目标数量
	NoTongTianZhangPiBeiInRange5=WR_GetNoDebuffRangeUnitCount(5,"通天掌疲惫",false)	--获取5码内没有我的通天掌疲惫的目标数量
	HaveAYLYYSInRange7=WR_GetHaveDebuffRangeUnitCount(7,"暗影烈焰易伤",false)	--获取7码内有我的暗影烈焰易伤的目标数量
	HaveShenHeYinJiInRange40=WR_GetHaveDebuffRangeUnitCount(40,"神鹤印记",false)	--获取40码内有我的神鹤印记的目标数量
	ShenHeYinXiangTiCount=GetSpellCount("神鹤引项踢")	--获得神鹤引项踢的叠加层数
	

	
	_,HuanMieTiFreeBuff,_=WR_GetUnitBuffInfo("player","幻灭踢！")	--获得幻灭踢免费BUFF的数量
	_,LiGuanQianJunBuff,_=WR_GetUnitBuffInfo("player","力贯千钧")	--获得力贯千钧的BUFF的数量
	_,ChiJingZhiWuBuff,_=WR_GetUnitBuffInfo("player","赤精之舞")	--获得赤精之舞的BUFF的数量
	
	
	
	_,DianXueTiBuff,_=WR_GetUnitBuffInfo("player","点穴踢")	--获得点穴踢的BUFF的数量
	_,ZhuanHuaLiLiangBuff,_=WR_GetUnitBuffInfo("player","转化力量")	--获得转化力量的BUFF的数量
	_,MiZongTuiFaBuff,_=WR_GetUnitBuffInfo("player","迷踪腿法")	--获得迷踪腿法的BUFF的数量
	_,BingQiNingShenBuff,_=WR_GetUnitBuffInfo("player","屏气凝神")	--获得屏气凝神的BUFF的数量
	
	LianJiBuffTime,_,_=WR_GetUnitBuffInfo("player","连击")	--获得连击的BUFF的时间
	InBossCombat=WR_InBossCombat()	--获得是否BOSS战斗
	TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	MaxHealthUnitInRange20=WR_GetMaxHealthUnit(20)	--获得20码内最大生命值的敌对单位
	
	
	WR_RecordPlayerInCombatTime()	--记录进入战斗的时间，全局变量为：PlayerInCombatTime
	if PlayerInCombatTime~=nil then
		PlayerCombatTime=GetTime()-PlayerInCombatTime
	else
		PlayerCombatTime=0
	end
]]	


	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_MonkCreateMacroButton() --初始化宏
	end


	if MSG==1 then
		print("最佳真气技能:|cffffdf00"..BestChiSpellName.."|cffffffff(|cffffdf00"..BestChiSpellValue.."|cffffffff)")
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
	----停怒雷破-----------------------------------------------------------------------------------------------
	if UnitChannelInfo("player")=="怒雷破"
	--正在施法 怒雷破
	and
	WR_GetUnitBuffInfo("player","屏气凝神")>GCD
	--屏气凝神 BUFF时间>公共冷却时间
	and
	CD_XRDST<=GCD
	--旭日东升踢
	and
	GCD<=0.4
	--公共冷却时间<=0.4
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN1","停怒雷破",zhandoumoshi) --显示指定色块窗体
		return
	end
	----停怒雷破-----------------------------------------------------------------------------------------------
	
	----业报之触-----------------------------------------------------------------------------------------------
	if WRSet.TF_YBZC~=6
	--业报之触不是关闭的
	and
	PlayerHP<=WRSet.TF_YBZC/10
	--血量低于设定值
	and
	IsPlayerSpell(122278)
	--已学习[业报之触]天赋
	and
	WR_GetSpellCD("业报之触")<=GCD
	--技能冷却
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF8","业报之触",zhandoumoshi) --显示指定色块窗体
		return
	end
	----业报之触-----------------------------------------------------------------------------------------------

	----躯不坏-----------------------------------------------------------------------------------------------
	if WRSet.TF_QBH~=6
	--躯不坏不是关闭的
	and
	PlayerHP<=WRSet.TF_QBH/10
	--血量低于设定值
	and
	IsPlayerSpell(122278)
	--已学习[躯不坏]天赋
	and
	WR_GetSpellCD("躯不坏")<=GCD
	--技能冷却
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSG","躯不坏",zhandoumoshi) --显示指定色块窗体
		return
	end
	----躯不坏-----------------------------------------------------------------------------------------------
	
	----壮胆酒-----------------------------------------------------------------------------------------------
	if WRSet.TF_ZDJ~=6
	--躯不坏不是关闭的
	and
	PlayerHP<=WRSet.TF_ZDJ/10
	--血量低于设定值
	and
	IsPlayerSpell(115203)
	--已学习[壮胆酒]天赋
	and
	WR_GetSpellCD("壮胆酒")<=GCD
	--技能冷却
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN2","壮胆酒",zhandoumoshi) --显示指定色块窗体
		return
	end
	----壮胆酒-----------------------------------------------------------------------------------------------
	
	----治疗石----------------------------------------------------------------------------------------------
	if WRSet.TF_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.TF_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF8","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	----治疗石----------------------------------------------------------------------------------------------
	
	----治疗药水----------------------------------------------------------------------------------------------
	if WRSet.TF_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.TF_ZLYS/10
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
				WR_ShowColorFrame("ACF9","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	----治疗药水----------------------------------------------------------------------------------------------

	----切喉手-----------------------------------------------------------------------------------------------
	--切喉手T-------------------------------------------------------------------------------------------
	if (WRSet.TF_QHS==1 or WRSet.TF_QHS==2)
	--切喉手=智能 或者 切喉手=目标
	and
	WR_MonkBrewmaster_QHS("target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","切喉手T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--切喉手T-------------------------------------------------------------------------------------------

	--切喉手M-------------------------------------------------------------------------------------------
	if WRSet.TF_QHS==1 then
	--切喉手=智能
		--切喉手M-------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QHS("mouseover") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","切喉手M",zhandoumoshi) --显示指定色块窗体
			return
		end
		--切喉手M-------------------------------------------------------------------------------------------

		--切喉手P1-------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QHS("party1target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF4","切喉手P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--切喉手P1-------------------------------------------------------------------------------------------

		--切喉手P3-------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QHS("party2target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","切喉手P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--切喉手P3-------------------------------------------------------------------------------------------
	
		--切喉手P3-------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QHS("party3target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","切喉手P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--切喉手P3-------------------------------------------------------------------------------------------
	
		--切喉手P4-------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QHS("party4target") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF7","切喉手P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--切喉手P4-------------------------------------------------------------------------------------------
	end
	----切喉手-----------------------------------------------------------------------------------------------

	----智能目标-----------------------------------------------------------------------------------------------
	if WRSet.TF_ZNMB==1
	--智能目标开启
	and
	not(UnitIsDead("player"))
	--玩家存活
	and
	UnitAffectingCombat("player")
	--玩家在战斗中
	and
	HUCountRange5>=1
	--近战范围敌人数量>=1
	and
	(
		not(WR_TargetInCombat("target"))
		--不可与目标战斗
		or
		not(IsSpellInRange("幻灭踢","target")==1)
		--目标不在技能范围内
		or
		(
			GCD>=0.2
			--公共冷却时间>=0.2秒
			and
			WR_GetUnitDebuffInfo("target","神鹤印记",true)~=0
			--目标 有 神鹤印记 Debuff
			and
			WR_GetUnitDebuffInfo("target","通天掌疲惫",true)~=0
			--目标 有 通天掌疲惫 Debuff
			and
			WR_GetUnitDebuffInfo("target","通天掌",true)==0
			--目标 没有 通天掌 Debuff
			and
			(
				WR_GetNoDebuffRangeUnitCount(4,"通天掌疲惫",false)>=1
				--4码内没有 通天掌疲惫 Debuff的单位数量
				or
				WR_GetNoDebuffRangeUnitCount(4,"神鹤印记",false)>=1
				--4码内没有 神鹤印记 Debuff的单位数量
			)
		)
	)
	then
		WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF12","智能目标",zhandoumoshi) --显示指定色块窗体
		return
	end
	----智能目标-----------------------------------------------------------------------------------------------

----施法速度检测，如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if GCD>ShiFaSuDu
	--GCD>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----施法速度检测，如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------

	----扫堂腿-----------------------------------------------------------------------------------------------
	if WRSet.TF_STT==1
	--扫堂腿 开启
	and
	WR_GetSpellCD("扫堂腿")<=GCD
	--技能冷却
	and
	WR_StunUnit(6)
	--范围击晕施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF10","扫堂腿",zhandoumoshi) --显示指定色块窗体
		return
	end
	----扫堂腿-----------------------------------------------------------------------------------------------
	
	--分筋虚体-----------------------------------------------------------------------------------------------
	if WR_GetSpellCD("分筋错骨")<=GCD
	--技能冷却
	and
	UnitChannelInfo("player")==nil
	--没有在引导施法
	and
	IsSpellInRange("分筋错骨", "mouseover")==1
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7","分筋虚体",zhandoumoshi) --显示指定色块窗体
		return
	end
	--分筋虚体-----------------------------------------------------------------------------------------------
	
	----分筋错骨-----------------------------------------------------------------------------------------------
	--分筋T-----------------------------------------------------------------------------------------------
	if WRSet.TF_FJCG==1
	--分筋错骨 开启
	and
	WR_MonkBrewmaster_FJCG("target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF8","分筋T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--分筋T-----------------------------------------------------------------------------------------------
	
	--分筋M-----------------------------------------------------------------------------------------------
	if WRSet.TF_FJCG==1
	--分筋错骨 开启
	and
	WR_MonkBrewmaster_FJCG("mouseover")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7","分筋M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--分筋M-----------------------------------------------------------------------------------------------
	----分筋错骨-----------------------------------------------------------------------------------------------

	----迅如猛虎-----------------------------------------------------------------------------------------------
	--迅虎P--------------------------------------------------------------------------------------------
	if WRSet.TF_XRMH==2
	--迅如猛虎=自己
	and
	WR_MonkBrewmaster_XRMH("player") then
	--玩家身上有定身BUFF
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","迅虎P",zhandoumoshi) --显示指定色块窗体
		return
	end
	--迅虎P--------------------------------------------------------------------------------------------
	
	if WRSet.TF_XRMH==1 then
	--迅如猛虎=智能
		--迅虎P1--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party1") and UnitGroupRolesAssigned("party1")=="TANK" then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF3","迅虎P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P1--------------------------------------------------------------------------------------------	

		--迅虎P2--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party2") and UnitGroupRolesAssigned("party2")=="TANK" then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF4","迅虎P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P2--------------------------------------------------------------------------------------------	

		--迅虎P3--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party3") and UnitGroupRolesAssigned("party3")=="TANK" then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF5","迅虎P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P3--------------------------------------------------------------------------------------------	

		--迅虎P4--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party4") and UnitGroupRolesAssigned("party4")=="TANK" then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF6","迅虎P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P4--------------------------------------------------------------------------------------------
		
		--迅虎P--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("player") then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF1","迅虎P",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P--------------------------------------------------------------------------------------------
		--迅虎P1--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party1") then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF3","迅虎P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P1--------------------------------------------------------------------------------------------	

		--迅虎P2--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party2") then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF4","迅虎P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P2--------------------------------------------------------------------------------------------	

		--迅虎P3--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party3") then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF5","迅虎P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P3--------------------------------------------------------------------------------------------	

		--迅虎P4--------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_XRMH("party4") then
		--玩家身上有定身BUFF
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF6","迅虎P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--迅虎P4--------------------------------------------------------------------------------------------
	end
	----迅如猛虎-----------------------------------------------------------------------------------------------

	----清创生血-----------------------------------------------------------------------------------------------
	--清创M--------------------------------------------------------------------------------------------
	if WRSet.TF_QCSX~=3 or UnitName("mouseover")=="受难之魂"
	--清创生血 开启 或 单位是受难之魂
	then
		if WR_MonkBrewmaster_QCSX("mouseover") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF9","清创M",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--清创M--------------------------------------------------------------------------------------------
	
	if WRSet.TF_QCSX==1
	--清创生血 智能
	then
		----清创P-----------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QCSX("player") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF9","清创P",zhandoumoshi) --显示指定色块窗体
			return
		end
		----清创P-----------------------------------------------------------------------------------------------

		----清创P1-----------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QCSX("party1") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF10","清创P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		----清创P1-----------------------------------------------------------------------------------------------

		----清创P2-----------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QCSX("party2") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","清创P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		----清创P2-----------------------------------------------------------------------------------------------

		----清创P3-----------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QCSX("party3") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF2","清创P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		----清创P3-----------------------------------------------------------------------------------------------
		
		----清创P4-----------------------------------------------------------------------------------------------
		if WR_MonkBrewmaster_QCSX("party4") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","清创P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		----清创P4-----------------------------------------------------------------------------------------------
	end
	----清创生血-----------------------------------------------------------------------------------------------

----目标近战检测，如果不符合条件，则不再往下执行操作-------------------------------------------------------------
	if
	not(
		IsSpellInRange("幻灭踢","target")==1
		--目标在近战范围
		and
		WR_TargetInCombat("target")
		--目标可攻击
		and
		UnitCastingInfo("player")==nil
		--没有施法
		and
		UnitChannelInfo("player")==nil
		--没有引导
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----目标近战检测，如果不符合条件，则不再往下执行操作-------------------------------------------------------------

	--召唤白虎雕像-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("召唤白虎雕像")
	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN9","白虎雕像",zhandoumoshi) --显示指定色块窗体
		return
	end
	--召唤白虎雕像-------------------------------------------------------------

	--碧火踏-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	LastSpell~="碧火踏"
	--排除是上一个技能
	and
	WR_SpellUsable("碧火踏")
	--技能可用
	and
	WR_GetUnitDebuffInfo("target","碧火烙",true)<0.3
	--目标 碧火烙 Debuff<0.3秒
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN8","碧火踏",zhandoumoshi) --显示指定色块窗体
		return
	end
	--碧火踏-------------------------------------------------------------

	--白虎下凡-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("白虎下凡")
	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF1","白虎下凡",zhandoumoshi) --显示指定色块窗体
		return
	end
	--白虎下凡-------------------------------------------------------------

	--轮回之触-------------------------------------------------------------
	if LastSpell~="轮回之触"
	--排除是上一个技能
	and
	WR_SpellUsable("轮回之触")
	--技能可用
--[[
	and
	zhandoumoshi==1
	--开爆发
]]--
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN7","轮回之触",zhandoumoshi) --显示指定色块窗体
		return
	end
	--轮回之触-------------------------------------------------------------

	--移花接木-------------------------------------------------------------
	if LastSpell~="移花接木"
	--排除是上一个技能
	and
	WR_SpellUsable("移花接木")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","屏气凝神")==0
	--屏气凝神 BUFF不存在
	and
	Chi<6
	--真气<6
	and
	(
		(
			CD_NLP<=0.5+GCD
			--怒雷破CD<=0.5+GCD
			and
			Energy+PowerRegen*(GCD+ChannelTime_NLP)>=MaxEnergy
			--当前能量+每秒回能*(公共冷却时间+怒雷破施法时间)>=最大能量
		)
		or
		(
			CD_NLP>0.5+GCD
			--怒雷破CD>0.5+GCD
			and
			Energy+PowerRegen*(GCD+0.5)>=MaxEnergy
			--当前能量+每秒回能*(公共冷却时间)>=最大能量
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSZ","移花接木",zhandoumoshi) --显示指定色块窗体
		return
	end
	--移花接木-------------------------------------------------------------

	--猛虎掌-------------------------------------------------------------
	if LastSpell~="猛虎掌"
	--排除是上一个技能
	and
	WR_SpellUsable("猛虎掌")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","屏气凝神")==0
	--屏气凝神 BUFF不存在
	and
	Chi<5
	--真气<5
	and
	(
		(
			CD_NLP<=1+GCD
			--怒雷破CD<=1+GCD
			and
			Energy+PowerRegen*(GCD+ChannelTime_NLP)>=MaxEnergy
			--当前能量+每秒回能*(公共冷却时间+怒雷破施法时间)>=最大能量
		)
		or
		(
			CD_NLP>1+GCD
			--怒雷破CD>1+GCD
			and
			Energy+PowerRegen*(GCD+1)>=MaxEnergy
			--当前能量+每秒回能*(公共冷却时间)>=最大能量
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN5","猛虎掌",zhandoumoshi) --显示指定色块窗体
		return
	end
	--猛虎掌-------------------------------------------------------------

	--风火雷电-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("风火雷电")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","风火雷电")==0
	--风火雷电 BUFF不存在
	then
		--饰品1-----------------------------------------------------------------------------------
		if (WRSet.TF_SP==1 or WRSet.TF_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF3","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1-----------------------------------------------------------------------------------
		--饰品2-----------------------------------------------------------------------------------
		if (WRSet.TF_SP==2 or WRSet.TF_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF5","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品2-----------------------------------------------------------------------------------
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF6","风火雷电",zhandoumoshi) --显示指定色块窗体
		return
	end
	--风火雷电-------------------------------------------------------------

	--屏气凝神-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("屏气凝神")
	--技能可用
	then
		--饰品1-----------------------------------------------------------------------------------
		if (WRSet.TF_SP==1 or WRSet.TF_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF3","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1-----------------------------------------------------------------------------------
		--饰品2-----------------------------------------------------------------------------------
		if (WRSet.TF_SP==2 or WRSet.TF_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF5","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品2-----------------------------------------------------------------------------------
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF6","屏气凝神",zhandoumoshi) --显示指定色块窗体
		return
	end
	--屏气凝神-------------------------------------------------------------

	--骨尘酒-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WRSet.TF_GCJ==1
	--骨尘酒 开启
	and
	LastSpell~="骨尘酒"
	--排除是上一个技能
	and
	WR_SpellUsable("骨尘酒")
	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF5","骨尘酒",zhandoumoshi) --显示指定色块窗体
		return
	end
	--骨尘酒-------------------------------------------------------------

	--风领主之击-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	LastSpell~="风领主之击"
	--排除是上一个技能
	and
	WR_SpellUsable("风领主之击")
	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF7","风领主之击",zhandoumoshi) --显示指定色块窗体
		return
	end
	--风领主之击-------------------------------------------------------------

	--怒雷破-------------------------------------------------------------
	if BestChiSpellName=="怒雷破" then
	--最佳真气技能
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF8","怒雷破",zhandoumoshi) --显示指定色块窗体
		return
	end
	--怒雷破-------------------------------------------------------------
	
	--旭日东升踢-------------------------------------------------------------
	if BestChiSpellName=="旭日东升踢" then
	--最佳真气技能
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN6","旭日踢",zhandoumoshi) --显示指定色块窗体
		return
	end
	--旭日东升踢-------------------------------------------------------------

	--神鹤引项踢-------------------------------------------------------------
	if BestChiSpellName=="神鹤引项踢" then
	--最佳真气技能
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN3","神鹤踢",zhandoumoshi) --显示指定色块窗体
		return
	end
	--神鹤引项踢-------------------------------------------------------------

	--幻灭踢-------------------------------------------------------------
	if BestChiSpellName=="幻灭踢" then
	--最佳真气技能
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN4","幻灭踢",zhandoumoshi) --显示指定色块窗体
		return
	end
	--幻灭踢-------------------------------------------------------------

	--真气爆裂-------------------------------------------------------------
	if LastSpell~="真气爆裂"
	--排除是上一个技能
	and
	WR_SpellUsable("真气爆裂")
	--技能可用
	and
	not(PlayerMove)
	--自身没有移动
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF7","真气爆裂",zhandoumoshi) --显示指定色块窗体
		return
	end
	--真气爆裂-------------------------------------------------------------

	--碧火踏2-------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	LastSpell~="碧火踏"
	--排除是上一个技能
	and
	WR_SpellUsable("碧火踏")
	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN8","碧火踏2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--碧火踏2-------------------------------------------------------------

	--移花2-------------------------------------------------------------
	if LastSpell~="移花接木"
	--排除是上一个技能
	and
	WR_SpellUsable("移花接木")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","屏气凝神")==0
	--屏气凝神 BUFF不存在
	and
	Chi<3
	--真气<3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSZ","移花2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--移花2-------------------------------------------------------------

	--猛虎2-------------------------------------------------------------
	if LastSpell~="猛虎掌"
	--排除是上一个技能
	and
	WR_SpellUsable("猛虎掌")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","屏气凝神")==0
	--屏气凝神 BUFF不存在
	and
	Chi<3
	--真气<3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN5","猛虎2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--猛虎2-------------------------------------------------------------


	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_MonkWindwalker_LastSpell()
	if LastSpellIsOpen==true then
		return
	end
	local ComboSpellName={
		[1]="翔龙在天",
		[2]="移花接木",
		[3]="碎玉闪电",
		[4]="轮回之触",
		[5]="怒雷破",
		[6]="旭日东升踢",
		[7]="神鹤引项踢",
		[8]="猛虎掌",
		[9]="幻灭踢",
		[10]="风领主之击",
		[11]="真气爆裂",
		[12]="真气波",
		[13]="骨尘酒",
		[14]="碧火踏",
		[15]="碧玉疾风",
		[16]="升龙霸",
		[17]="",
		[18]="",
		[19]="",
		[20]="",
	}
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local i = 1
					while (ComboSpellName[i]~=nil and ComboSpellName[i]~="")
					do
						local SpellName=select(13, CombatLogGetCurrentEventInfo())
						if SpellName==ComboSpellName[i] then
						--如果释放成功的法术是连击点的法术
							LastSpell=SpellName
						end
						i = i + 1
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end

--最佳真气技能
function WR_MonkWindwalker_BestChiSpell()
	BestChiSpellValue=0	--初始化最佳真气技能伤害
	BestChiSpellName="无"	--初始化最佳真气技能名称

	--怒雷破---------------------------------------------------------------------------------------------------------------------------
	local NuLeiPo = WR_GetSpellValue("怒雷破","主要目标造成","点")	--初始化怒雷破技能伤害
	local NuLeiPoCiYao = WR_GetSpellValue("怒雷破","所有敌人造成","点")	--初始化怒雷破次要目标伤害
	local NuLeiPo_Sum=0	--初始化怒雷破统计伤害
	--print("怒雷破:",NuLeiPo)
	--print("怒雷破次要目标:",NuLeiPoCiYao)
	if HUCountRange5>=1 and HUCountRange5<=5 then
	--如果5码单位数量<=5
		NuLeiPo_Sum=NuLeiPo+NuLeiPoCiYao*(HUCountRange5-1)	--怒雷破统计伤害=怒雷破+怒雷破次要伤害*(次要目标数量)
	elseif HUCountRange5>5 then
	--如果5码单位数量>5
		NuLeiPo_Sum=NuLeiPo+NuLeiPoCiYao*4	--怒雷破统计伤害=怒雷破+怒雷破次要伤害*(4个次要目标)
		NuLeiPo_Sum=NuLeiPo_Sum+WR_DamageMitigation(NuLeiPoCiYao,HUCountRange5,6)	--计算递减伤害（从基础伤害,范围数量,开始递减的个数）
	end
	
	--怒雷破 是否最佳技能判定
	--if LastSpell~="怒雷破" and WR_SpellUsable("怒雷破") and WR_GetUnitBuffInfo("player","屏气凝神")<1 then
	--最后一次技能不是 怒雷破 并且 怒雷破 可用 并且 屏气凝神 BUFF<1秒（可以卡屏气凝神最后1秒放怒雷破）
	if LastSpell~="怒雷破" and WR_SpellUsable("怒雷破") then
	--最后一次技能不是 怒雷破 并且 怒雷破 可用
		if NuLeiPo_Sum>BestChiSpellValue then
			BestChiSpellValue=NuLeiPo_Sum	--最佳真气技能伤害=怒雷破 最终计算伤害
			BestChiSpellName="怒雷破"	--最佳真气技能伤害="怒雷破"
		end
	end
	
	if MSG==1 then
		print("怒雷破统计伤害:",NuLeiPo_Sum)
	end
	--怒雷破--------------------------------------------------------------------------------------------------------------------------

	--旭日东升踢---------------------------------------------------------------------------------------------------------------------------
	local XuRiDongShengTi=WR_GetSpellValue("旭日东升踢","造成","点")	--初始化 旭日东升踢
	local XuRiDongShengTi_Sum=XuRiDongShengTi	--初始化 旭日东升踢 统计伤害
	--print("旭日东升踢，面板伤害：",XuRiDongShengTi)
	
	--旭日峥嵘 统计伤害
	local XuRiZhengRong=0
	if IsPlayerSpell(392958)==true then
	--[旭日峥嵘]天赋存在
		XuRiZhengRong=WR_GetSpellValue(392958, "造成", "点")
		XuRiZhengRong=XuRiZhengRong*0.25	--旭日峥嵘提供的额外伤害*几率
	end
	--print("旭日峥嵘:",XuRiZhengRong)
	XuRiDongShengTi_Sum=XuRiDongShengTi_Sum+XuRiZhengRong

	
	--东升之星统计伤害
	local DongShengZhiXing=0
	if IsPlayerSpell(388849)==true then
	--[东升之星]天赋存在
		DongShengZhiXing=XuRiDongShengTi*(GetCritChance()/100*0.16)--根据暴击率调整
	end
	--print("东升之星:",DongShengZhiXing)
	XuRiDongShengTi_Sum=XuRiDongShengTi_Sum+DongShengZhiXing

	--点穴踢统计伤害
	local DianXueTi=0
	if WR_GetUnitBuffInfo("player","点穴踢")~=0 then	--点穴踢BUFF存在，点穴踢是天赋[雪怒的战甲]怒雷破结束后的一个BUFF
		DianXueTi=XuRiDongShengTi*0.4	--点穴踢BUFF增加爆击40%，相当于增加40%的伤害
	end
	--print("点穴踢:",DianXueTi)
	XuRiDongShengTi_Sum=XuRiDongShengTi_Sum+DianXueTi
	
	--雪怒的战甲统计伤害（为怒雷破减CD获取的收益）
	local XueNuDeZhanJia=0
	if IsPlayerSpell(392993)==true then
	--[雪怒的战甲]392993天赋存在
		local DXTCrit=0
		if WR_GetUnitBuffInfo("player","点穴踢")~=0 then	
		--点穴踢BUFF存在，点穴踢BUFF增加旭日爆击40%
			DXTCrit=0.4
		end
		if CD_NLP>=5 then
		--如果怒雷破CD>5秒，获得满减收益
			--雪怒的战甲伤害=（4秒*（暴击率+点穴踢BUFF增加旭日爆击），获得约获得的减秒）*（怒雷破统计伤害/怒雷破冷却总长，获得每减1秒怒雷破的收益）
			XueNuDeZhanJia=(4*(GetCritChance()/100+DXTCrit))*(NuLeiPo_Sum/NuLeiPoTrueCooldownTime)
		elseif CD_NLP>1 and CD_NLP<5 then
		--如果怒雷破CD在1~5秒之间，获得减去秒数的收益
			--雪怒的战甲伤害=（减秒*（暴击率+点穴踢BUFF增加旭日爆击），获得约获得的减秒）*（怒雷破统计伤害/怒雷破冷却总长，获得每减1秒怒雷破的收益）
			XueNuDeZhanJia=((CD_NLP-1)*(GetCritChance()/100+DXTCrit))*(NuLeiPo_Sum/NuLeiPoTrueCooldownTime)
		end
		
	end
	--print("雪怒的战甲:",XueNuDeZhanJia)
	XuRiDongShengTi_Sum=XuRiDongShengTi_Sum+XueNuDeZhanJia

	--旭日东升踢 是否最佳技能判定
	if LastSpell~="旭日东升踢" and WR_SpellUsable("旭日东升踢") then
	--最后一次技能不是旭日东升踢 并且 旭日东升踢可用
		if XuRiDongShengTi_Sum>BestChiSpellValue then
			BestChiSpellValue=XuRiDongShengTi_Sum	--最佳真气技能伤害=旭日东升踢最终计算伤害
			BestChiSpellName="旭日东升踢"	--最佳真气技能伤害="旭日东升踢"
		end
	end
	
	if MSG==1 then
		print("旭日东升踢:",XuRiDongShengTi_Sum)
	end
	
	--旭日东升踢---------------------------------------------------------------------------------------------------------------------------


	--幻灭踢---------------------------------------------------------------------------------------------------------------------------
	local HuanMieTi=WR_GetSpellValue("幻灭踢","造成","点")	--初始化 幻灭踢
	--print("幻灭踢:",HuanMieTi)
	local HuanMieTi_Sum=HuanMieTi
	
	--禅院教诲
	if BuffCount_CYJH>=1 then	--禅院教诲BUFF存在
		HuanMieTi_Sum=HuanMieTi_Sum*(1+BuffCount_CYJH)	--幻灭踢伤害=幻灭踢伤害*（1+禅院教诲层数）
	end
	--print("禅院教诲-幻灭踢:",HuanMieTi_Sum)	
	
	
	if IsPlayerSpell(392982)==true then
		--太极鞋392982天赋存在
		if HUCountRange7<=3 then	--如果7码敌对单位<=3
			HuanMieTi_Sum=HuanMieTi_Sum*HUCountRange7	--幻灭踢*7码单位数量
		else	--如果7码敌对单位>3
			HuanMieTi_Sum=HuanMieTi_Sum*3	--幻灭踢*3（最大3个）
		end
	end
	--print("太极鞋-幻灭踢:",HuanMieTi_Sum)	
	
	local XRDST_Mitigation=1	--基础的可减的CD 旭日东升踢
	if WR_GetUnitBuffInfo("player","幻灭遒劲")~=0 then
	--有 10.2套装 幻灭遒劲 BUFF
		XRDST_Mitigation=XRDST_Mitigation+3
	end
	--幻灭踢减CD初始化伤害 旭日东升踢
	local HuanMieTi_XuRiDongShengTi=0
	if CD_XRDST>XRDST_Mitigation+1 then
	--旭日东升踢冷却时间>减CD+1秒 才有效
		HuanMieTi_XuRiDongShengTi=XuRiDongShengTi_Sum/XuRiDongShengTiTrueCooldownTime*XRDST_Mitigation	--旭日东升踢/实际最长冷却时间，获得减1秒的收益
	elseif CD_XRDST>1 and CD_XRDST<XRDST_Mitigation+1 then
	--旭日东升踢CD在1~减CD+1秒之间
		HuanMieTi_XuRiDongShengTi=XuRiDongShengTi_Sum/XuRiDongShengTiTrueCooldownTime*(CD_XRDST-1)	--旭日东升踢/实际最长冷却时间，获得减实际冷却时间的收益
	end
	--print("幻灭踢减旭日CD获得伤害:",HuanMieTi_XuRiDongShengTi)
	HuanMieTi_Sum=HuanMieTi_Sum+HuanMieTi_XuRiDongShengTi
	
	local NLP_Mitigation=1	--基础的可减的CD 怒雷破
	if WR_GetUnitBuffInfo("player","幻灭遒劲")~=0 then
	--有 10.2套装 幻灭遒劲 BUFF
		NLP_Mitigation=NLP_Mitigation+3
	end
	--幻灭踢减CD初始化伤害 怒雷破
	local HuanMieTi_nuleipo=0
	if CD_NLP>NLP_Mitigation+1 then
	--怒雷破 冷却时间>减CD+1秒 才有效
		HuanMieTi_nuleipo=NuLeiPo_Sum/NuLeiPoTrueCooldownTime*NLP_Mitigation	--怒雷破统计伤害/实际最长冷却时间，获得每减1秒的收益
	elseif CD_NLP>1 and CD_NLP<NLP_Mitigation+1 then
	--怒雷破 CD在1~减CD+1秒之间
		HuanMieTi_nuleipo=NuLeiPo_Sum/NuLeiPoTrueCooldownTime*(CD_NLP-1)	--怒雷破统计伤害/实际最长冷却时间，获得每减1秒的收益
	end
	--print("幻灭踢减怒雷破CD获得伤害:",HuanMieTi_nuleipo)
	HuanMieTi_Sum=HuanMieTi_Sum+HuanMieTi_nuleipo

	if WR_GetUnitBuffInfo("player","幻灭遒劲")~=0 then
	--有 10.2套装 幻灭遒劲 BUFF
		local FLZZJ=WR_GetSpellValue("风领主之击","造成","点")	--初始化 风领主之击 伤害
		local HuanMieTi_FLZZJ=0	--幻灭踢减CD初始化伤害 风领主之击
		if CD_FLZZJ>4 then
		--风领主之击 冷却时间>4 才有效
			HuanMieTi_FLZZJ=FLZZJ/40*3	--风领主之击 统计伤害/实际最长冷却时间，获得每减1秒的收益
		elseif CD_FLZZJ>1 and CD_FLZZJ<4 then
		--风领主之击 CD在1~4之间
			HuanMieTi_FLZZJ=FLZZJ/40*(CD_FLZZJ-1)	--风领主之击 统计伤害/实际最长冷却时间，获得每减1秒的收益
		end
		--print("幻灭踢减 风领主之击 CD获得伤害:",HuanMieTi_FLZZJ)
		HuanMieTi_Sum=HuanMieTi_Sum+HuanMieTi_FLZZJ
	end

	--幻灭踢
	if LastSpell~="幻灭踢" and WR_SpellUsable("幻灭踢") then
	--最后一次技能不是 幻灭踢 并且 幻灭踢 可用
		if HuanMieTi_Sum>BestChiSpellValue then
		--如果幻灭踢的伤害>之前最佳真气技能伤害
			BestChiSpellValue=HuanMieTi_Sum	--最佳真气技能伤害=幻灭踢最终计算伤害
			BestChiSpellName="幻灭踢"	--最佳真气技能伤害="幻灭踢"
		end
	end
	
	if MSG==1 then
		print("幻灭踢:",HuanMieTi_Sum)
	end
	--幻灭踢---------------------------------------------------------------------------------------------------------------------------	
	
	
	--神鹤引项踢---------------------------------------------------------------------------------------------------------------------------
	local ShenHeYinXiangTi=WR_GetSpellValue("神鹤引项踢","造成","点")	--初始化 幻灭踢
	local ShenHeYinXiangTi_Sum
	--print("神鹤引项踢:",ShenHeYinXiangTi)

	--赤精之舞
	if WR_GetUnitBuffInfo("player","赤精之舞")~=0 then
	--赤精之舞BUFF存在
		ShenHeYinXiangTi=ShenHeYinXiangTi*(1+3)	--赤精之舞BUFF增加神鹤引项踢300%伤害
		if T102Count>=2 and WR_GetUnitBuffInfo("player","幻灭遒劲")==0 then
		--10.2 两件套 BUFF存在 并且 身上没有 幻灭遒劲 BUFF
			ShenHeYinXiangTi=ShenHeYinXiangTi+HuanMieTi_Sum*2	--神鹤引项踢 的伤害 加上 幻灭踢伤害*2(幻灭遒劲 提高200%幻灭踢伤害)
		end
	end
	--print("神鹤引项踢-赤精之舞:",ShenHeYinXiangTi)
	
	--7码单位数量
	if HUCountRange7>=1 and HUCountRange7<=5 then
	--如果7码单位数量1~5个
		ShenHeYinXiangTi_Sum=ShenHeYinXiangTi*HUCountRange7	--神鹤引项踢*7码单位数量（文字描述是9码，但是API统计出是7码，按API的为准）
	else
	--如果7码单位数量>5个
		ShenHeYinXiangTi_Sum=ShenHeYinXiangTi*5	--神鹤引项踢*7码单位数量（文字描述是9码，但是API统计出是7码，按API的为准）
		ShenHeYinXiangTi_Sum=ShenHeYinXiangTi_Sum+WR_DamageMitigation(ShenHeYinXiangTi,HUCountRange7,6)	--计算递减伤害（从基础伤害,范围数量,开始递减的个数）
	end
	--print("神鹤引项踢-7码单位:",ShenHeYinXiangTi_Sum)
	
	--青玉破
	local QingYuPo=WR_GetSpellValue(392979,"造成","点")	--初始化 青玉破
	if BuffCount_ZQNL>=1 then
	--真气能量BUFF存在
		QingYuPo=QingYuPo*(1+BuffCount_ZQNL*0.05)	--青玉破*（1+青玉破层数*0.05）
		QingYuPo=QingYuPo*HUCountRange7	--青玉破*7码单位数量
		--print("神鹤引项踢-青玉破:",QingYuPo)
		ShenHeYinXiangTi_Sum=ShenHeYinXiangTi_Sum+QingYuPo
	end
	
	--神鹤引项踢
	if LastSpell~="神鹤引项踢" and WR_SpellUsable("神鹤引项踢") then
	--最后一次技能不是 神鹤引项踢 并且 神鹤引项踢 可用
		if ShenHeYinXiangTi_Sum>BestChiSpellValue then
		--如果神鹤引项踢的伤害>之前最佳真气技能伤害
			--[[
			if ShenHeYinXiangTi>HuanMieTi or (Energy>=MaxEnergy-PowerRegen*2 and BingQiNingShenBuff==0) or LianJiBuffTime<=1 or (LastSpell=="幻灭踢" and BingQiNingShenBuff>=1) then
			--神鹤引项踢伤害>幻灭踢 或 (当前能量>=最大能量-每秒回能*2 并且 屏气凝神BUFF不存在) 或 连击BUFF时间<=1秒 或 （上一个技能是幻灭踢 并且 屏气凝神BUFF存在）
			end
			]]--
			BestChiSpellValue=ShenHeYinXiangTi_Sum	--最佳真气技能伤害=神鹤引项踢最终计算伤害
			BestChiSpellName="神鹤引项踢"	--最佳真气技能伤害="神鹤引项踢"
		end
	end
	
	if MSG==1 then
		print("神鹤引项踢:",ShenHeYinXiangTi_Sum)
	end
	--神鹤引项踢---------------------------------------------------------------------------------------------------------------------------
end

--[[

	if HUCountRange5==1 then
	--近战技能范围单位数量==1个
		--旭日踢1-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","点穴踢")>GCD
		--点穴踢 BUFF 存在，[雪怒的战甲]给的BUFF
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢1-------------------------------------------------------------

		--怒雷破-------------------------------------------------------------
		if LastSpell~="怒雷破"
		--排除是上一个技能
		and
		WR_SpellUsable("怒雷破")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","怒雷破",zhandoumoshi) --显示指定色块窗体
			return
		end
		--怒雷破-------------------------------------------------------------

		--旭日踢2-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢2-------------------------------------------------------------

		--幻灭踢1-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","幻灭遒劲")~=0
		--10.2 两件套 BUFF存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢1-------------------------------------------------------------

		--免费神鹤-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","赤精之舞")~=0
		--赤精之舞 BUFF 存在，免费神鹤
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","免费神鹤",zhandoumoshi) --显示指定色块窗体
			return
		end
		--免费神鹤-------------------------------------------------------------

		--幻灭踢2-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢2-------------------------------------------------------------

		--神鹤2-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","神鹤2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--神鹤2-------------------------------------------------------------
	elseif (HUCountRange5>=2 and HUCountRange5<=4) then
	--近战技能范围单位数量2~4个
		--怒雷破-------------------------------------------------------------
		if LastSpell~="怒雷破"
		--排除是上一个技能
		and
		WR_SpellUsable("怒雷破")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","怒雷破",zhandoumoshi) --显示指定色块窗体
			return
		end
		--怒雷破-------------------------------------------------------------

		--幻灭踢1-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","幻灭遒劲")~=0
		--10.2 两件套 BUFF存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢1-------------------------------------------------------------

		--免费神鹤-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","赤精之舞")~=0
		--赤精之舞 BUFF 存在，免费神鹤
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","免费神鹤",zhandoumoshi) --显示指定色块窗体
			return
		end
		--免费神鹤-------------------------------------------------------------
	
		--旭日踢1-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","点穴踢")>GCD
		--点穴踢 BUFF 存在，[雪怒的战甲]给的BUFF
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢1-------------------------------------------------------------

		--幻灭踢2-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢2-------------------------------------------------------------

		--旭日踢2-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢2-------------------------------------------------------------

		--神鹤2-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","神鹤2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--神鹤2-------------------------------------------------------------
	elseif HUCountRange5>=5 then
	--近战技能范围单位数量>=5个
		--免费神鹤-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","赤精之舞")~=0
		--赤精之舞 BUFF 存在，免费神鹤
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","免费神鹤",zhandoumoshi) --显示指定色块窗体
			return
		end
		--免费神鹤-------------------------------------------------------------

		--怒雷破-------------------------------------------------------------
		if LastSpell~="怒雷破"
		--排除是上一个技能
		and
		WR_SpellUsable("怒雷破")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","怒雷破",zhandoumoshi) --显示指定色块窗体
			return
		end
		--怒雷破-------------------------------------------------------------

		--幻灭踢1-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","幻灭遒劲")~=0
		--10.2 两件套 BUFF存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢1-------------------------------------------------------------

		--神鹤2-------------------------------------------------------------
		if LastSpell~="神鹤引项踢"
		--排除是上一个技能
		and
		WR_SpellUsable("神鹤引项踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3","神鹤2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--神鹤2-------------------------------------------------------------
	
		--旭日踢1-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		and
		WR_GetUnitBuffInfo("player","点穴踢")>GCD
		--点穴踢 BUFF 存在，[雪怒的战甲]给的BUFF
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢1-------------------------------------------------------------

		--幻灭踢2-------------------------------------------------------------
		if LastSpell~="幻灭踢"
		--排除是上一个技能
		and
		WR_SpellUsable("幻灭踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4","幻灭踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--幻灭踢2-------------------------------------------------------------

		--旭日踢2-------------------------------------------------------------
		if LastSpell~="旭日东升踢"
		--排除是上一个技能
		and
		WR_SpellUsable("旭日东升踢")
		--技能可用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN6","旭日踢2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--旭日踢2-------------------------------------------------------------
	end
	
]]--