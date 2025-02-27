--邪DK运行库
function WR_DeathKnightUnholy()
	if GetSpecialization()~=3 then	--如果不是邪恶(3)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	local T31={
    [1]=207198,
    [2]=207199,
    [3]=207200,
    [4]=207201,
    [5]=207203,
	}
	T31Count=WR_GetSuit(T31)	--获得T31套装的数量

	local T32={
    [1]=217221,
    [2]=217222,
    [3]=217223,
    [4]=217224,
    [5]=217225,
	}
	T32Count=WR_GetSuit(T32)	--获得T32套装的数量

	WR_Initialize()	--初始化
	
	GCD=WR_GetGCD("灵界打击")	--获得当前公共CD
	GCD_Max=WR_GetMaxGCD(1.5)	--最大GCD
	
	CD_KWDL=WR_GetGCD("枯萎凋零")	--获得 枯萎凋零 CD
	CD_ZHSSG=WR_GetGCD("召唤石像鬼")	--获得 召唤石像鬼 CD
	CD_TQ=WR_GetGCD("天启")	--获得 天启 CD
	CD_XECQ=WR_GetGCD("邪恶虫群")	--获得 邪恶虫群 CD
	CD_XETX=WR_GetGCD("邪恶突袭")	--获得 邪恶突袭 CD
	
	Runes=WR_GetRuneCount()	--可用符文数量
	RunicPower=UnitPower("player",6)	--符文能量
	
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得自身血量比例
	
	
	TargetRange=WR_GetUnitRange("target")	--获得目标距离
	HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得5码内的敌人数量
	HUCountRange8=WR_GetRangeHarmUnitCount(8,false)	--获得8码内的敌人数量
	HUCountRange30=WR_GetRangeHarmUnitCount(30,true)	--获得30码内战斗中的敌人数量
	
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得预计目标死亡时间

	SXG_Sum=0	--石像鬼数量
	SXG_Time=nil	--石像鬼持续时间
	for i=1,5,1 do
	   local _, totemName, startTime, duration, _= GetTotemInfo(i)
		if totemName=="黑锋石像鬼" then
			SXG_Sum=1	--石像鬼数量
			SXG_Time=startTime+duration-GetTime()	--石像鬼持续时间
			break	--退出循环
		end 
	end
	
--[[
	local currentCharges, maxCharges, cooldownStart, cooldownDuration, chargeModRate = GetSpellCharges("枯萎凋零")
	CD_KWDL=cooldownStart+cooldownDuration-GetTime()	--获得枯萎凋零充能时间
	if CD_KWDL>cooldownDuration then
		CD_KWDL=0
	end
]]--

	BuffTime_KLZL,BuffCount_KLZL,_=WR_GetUnitBuffInfo("player","溃烂之力")	--获得 冰霜之柱 BUFF信息
	BuffTime_KWDL,BuffCount_KWDL,_=WR_GetUnitBuffInfo("player","枯萎凋零")	--获得 枯萎凋零 BUFF信息
	BuffTime_FMFHZ,BuffCount_FMFHZ,_=WR_GetUnitBuffInfo("player","反魔法护罩")	--获得 反魔法护罩 BUFF信息
	BuffTime_XD,BuffCount_XD,_=WR_GetUnitBuffInfo("player","亵渎")	--获得 亵渎 BUFF信息
	BuffTime_WZZHG,BuffCount_WZZHG,_=WR_GetUnitBuffInfo("player","亡者指挥官")	--获得 亡者指挥官 BUFF信息
	BuffTime_WYSZ,BuffCount_WYSZ,_=WR_GetUnitBuffInfo("player","瘟疫使者")	--获得 瘟疫使者 BUFF信息
	BuffTime_MRTJ,BuffCount_MRTJ,_=WR_GetUnitBuffInfo("player","末日突降")	--获得 末日突降 BUFF信息
	
	BuffTime_HATB,BuffCount_HATB,_=WR_GetUnitBuffInfo("pet","黑暗突变")	--获得 黑暗突变 BUFF信息

	DebuffTime_KLZS,DebuffCount_KLZS,_=WR_GetUnitDebuffInfo("target","溃烂之伤",true)	--获得 溃烂之伤 DEBUFF信息
	DebuffTime_EXWY,DebuffCount_EXWY,_=WR_GetUnitDebuffInfo("target","恶性瘟疫",true)	--获得 恶性瘟疫 DEBUFF信息
	DebuffTime_SWXL,DebuffCount_SWXL,_=WR_GetUnitDebuffInfo("target","死亡朽烂",true)	--获得 死亡朽烂 DEBUFF信息

	WR_DeathKnightUnholy_LastSpellTime()	--获取上一次的技能，利用战斗事件，所以仅运行一次

	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_DeathKnightCreateMacroButton() --初始化宏
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

	--巫妖之躯--------------------------------------------------------------------------------------------
	if WRSet.XE_WYZQ~=6
	--巫妖之躯 开启
	and
	WR_SpellUsable("巫妖之躯")
	--技能可用 资源可用
	and
	PlayerHP<WRSet.XE_WYZQ/10
	--血量比例
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","巫妖之躯",zhandoumoshi) --显示指定色块窗体
		return
	end
	--巫妖之躯--------------------------------------------------------------------------------------------

	--冰封之韧--------------------------------------------------------------------------------------------
	if WRSet.XE_BFZR~=6
	--冰封之韧 开启
	and
	WR_SpellUsable("冰封之韧")
	--技能可用 资源可用
	and
	PlayerHP<WRSet.XE_BFZR/10
	--血量比例
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF2","冰封之韧",zhandoumoshi) --显示指定色块窗体
		return
	end
	--冰封之韧--------------------------------------------------------------------------------------------

	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.XE_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.XE_ZLS/10
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
	if WRSet.XE_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.XE_ZLYS/10
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
			--			物品数量>=1		且  	物品可以使用
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF10","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--反魔法护罩--------------------------------------------------------------------------------------------
	if WRSet.XE_FMFHZ==1
	--反魔法护罩 开启
	and
	WR_DeathKnightUnholy_FMFHZ()
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","反魔法护罩",zhandoumoshi) --显示指定色块窗体
		return
	end
	--反魔法护罩--------------------------------------------------------------------------------------------

	--心灵冰冻T--------------------------------------------------------------------------------------------
	if WRSet.XE_XLBD~=3
	--心灵冰冻 开启
	and
	WR_DeathKnightFrost_XLBD("target")
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","心灵冰冻T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--心灵冰冻T--------------------------------------------------------------------------------------------

	--心灵冰冻M--------------------------------------------------------------------------------------------
	if WRSet.XE_XLBD==1
	--心灵冰冻 智能
	and
	WR_DeathKnightFrost_XLBD("mouseover")
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","心灵冰冻M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--心灵冰冻M--------------------------------------------------------------------------------------------

	--复活盟友M--------------------------------------------------------------------------------------------
	if WR_DeathKnightFrost_FHMY("mouseover")
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF3","复活盟友M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--复活盟友M--------------------------------------------------------------------------------------------

	--控制亡灵--------------------------------------------------------------------------------------------
	if WR_DeathKnightFrost_KZWL()
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","控制亡灵",zhandoumoshi) --显示指定色块窗体
		return
	end
	--控制亡灵--------------------------------------------------------------------------------------------

	--致盲冰雨-------------------------------------------------------------------------------------------
	if WRSet.XE_ZMBY==1
	--致盲冰雨 开启
	and
	WR_DeathKnightFrost_ZMBY()
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF6","致盲冰雨",zhandoumoshi) --显示指定色块窗体
		return
	end
	--致盲冰雨-------------------------------------------------------------------------------------------

	--窒息T-------------------------------------------------------------------------------------------
	if WRSet.XE_ZX==1
	--窒息 开启
	and
	WR_DeathKnightFrost_ZX("target") then
	--技能条件通过
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF7","窒息T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--窒息T-------------------------------------------------------------------------------------------
	
	--窒息M-------------------------------------------------------------------------------------------
	if WRSet.XE_ZX==1
	--窒息 开启
	and
	WR_DeathKnightFrost_ZX("mouseover") then
	--技能条件通过
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF9","窒息M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--窒息M-------------------------------------------------------------------------------------------
	
	--智能目标--------------------------------------------------------------------------------------------
	if WRSet.XE_ZNMB==1
	--智能目标 开启
	and
	HUCountRange5>=1
	--5码内有敌人
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	(
		not WR_TargetInCombat("target")
		--不可与目标战斗
		or
		WR_GetUnitRange("target")>5
		--单位距离
	)
	then
		WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","智能目标",zhandoumoshi) --显示指定色块窗体
		return
	end
	--智能目标--------------------------------------------------------------------------------------------

	--亡者复生--------------------------------------------------------------------------------------------
	if WR_SpellUsable("亡者复生")
	--技能可用 资源可用
	and
	(
		not UnitExists("pet")
		--单位不存在
		or
		UnitIsDead("pet")
		--单位死亡
	)
	and
	not UnitExists("pet")
	--宠物不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","亡者复生",zhandoumoshi) --显示指定色块窗体
		return
	end

--目标战斗检测，如果不在战斗，则不再往下执行操作-------------------------------------------------------------
	if not(WR_TargetInCombat("target"))
	--目标不在战斗
	or GCD>ShiFaSuDu
	--GCD>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
--目标战斗检测，如果不在战斗，则不再往下执行操作-------------------------------------------------------------

--[[
	--反魔法护罩--------------------------------------------------------------------------------------------
	local TotemSum=0	--守护者数量
	for i=1,5,1
	do
	   local _, totemName, _, _, _= GetTotemInfo(i)
		if totemName=="黑锋石像鬼" then
			TotemSum=TotemSum+1	--守护者数量
		end 
	end
	if WR_SpellUsable("反魔法护罩")
	--技能可用 资源可用
	and
	RunicPower<=60
	--符文能量<=60
	and
	(
		TotemSum>=1
		--石像鬼 存在
		or
		not IsPlayerSpell(49206)
		--没学天赋 [召唤石像鬼]
		or
		(
			IsPlayerSpell(49206)
			--已学天赋 [召唤石像鬼]
			and
			CD_ZHSSG>BuffTime_FMFHZ
			--召唤石像鬼CD>反魔法护罩BUFF时间
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","反魔法护罩",zhandoumoshi) --显示指定色块窗体
		return
	end
]]

	
	--灵界打击--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_LJDJ()
	--技能条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF7","灵界打击",zhandoumoshi) --显示指定色块窗体
		return
	end

	--亡者大军--------------------------------------------------------------------------------------------
	if WRSet.XE_WZDJ==1
	--亡者大军 开启
	and
	zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("亡者大军")
	--技能可用 资源可用
	and
	TargetRange<=30
	--单位距离
	and
	(
		(
			IsPlayerSpell(49206)
			--已学天赋 [召唤石像鬼]
			and
			CD_ZHSSG<GCD+3*GCD_Max
			--召唤石像鬼 CD<3个GCD
		)
		or
		not IsPlayerSpell(49206)
		--没学天赋 [召唤石像鬼]
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF1","亡者大军",zhandoumoshi) --显示指定色块窗体
		return
	end
	
--[[
	--反魔法护罩--------------------------------------------------------------------------------------------
	if WR_SpellUsable("反魔法护罩")
	--技能可用 资源可用
	and
	TargetRange<=5
	--单位距离
	and
	RunicPower<=60
	--符文能量<=60
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF11","反魔法护罩",zhandoumoshi) --显示指定色块窗体
		return
	end
]]--
	
	--枯萎凋零--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_KWDL()
	--枯萎凋零 施法条件
	and
	BuffTime_XD<=GCD+GCD_Max+1
	--亵渎 BUFF剩余时间<=下一个GCD+1秒延迟
	and
	HUCountRange8>=2
	--8码单位>=2
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","枯萎凋零",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--天灾加速--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_TZDJ()
	--天灾打击 技能条件通过
	and
	IsPlayerSpell(390175)
	--已学天赋 [瘟疫使者]
	and
	BuffTime_WYSZ<GCD+GCD_Max
	--瘟疫使者 BUFF时间<下一个GCD
	and
	(
		CD_XETX<=GCD
		--邪恶突袭 技能CD好了
		or
		HUCountRange8>=3
		--敌人数量>=3
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","天灾加速",zhandoumoshi) --显示指定色块窗体
		return
	end
	
--[[
	--邪恶虫群--------------------------------------------------------------------------------------------
	if WR_SpellUsable("邪恶虫群")
	--技能可用 资源可用
	and
	(
		not IsPlayerSpell(377592)
		--没学天赋 [病变]
		or
		(
			IsPlayerSpell(377592)
			--已学天赋 [病变]
			and
			(
				CD_TQ>GCD
				--天启 CD冷却中
				or
				not IsPlayerSpell(49206)
				--没学天赋 [召唤石像鬼]
			)
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","邪恶虫群",zhandoumoshi) --显示指定色块窗体
		return
	end
]]--

	--邪恶虫群--------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("邪恶虫群")
	--技能可用 资源可用
	and
	TargetRange<=5
	--单位距离
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","邪恶虫群",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--爆发--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_BF("target")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF4","爆发t",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_DeathKnightUnholy_BF("mouseover")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","爆发m",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_DeathKnightUnholy_BF("party1target")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF8","爆发P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_DeathKnightUnholy_BF("party2target")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF9","爆发P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_DeathKnightUnholy_BF("party3target")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF10","爆发P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if WR_DeathKnightUnholy_BF("party4target")
	--爆发 施法条件
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF1","爆发P4",zhandoumoshi) --显示指定色块窗体
		return
	end

	--灵魂收割-----------------------------------------------------------------
	if WR_SpellUsable("灵魂收割")
	--技能可用 资源可用
	and
	TargetRange<=5
	--目标距离<=5
	and
	HUCountRange8==1
	--8码敌人数量=1
	and
	UnitHealth("target")/UnitHealthMax("target")<=0.36
	--目标血量比例<36%
	and
	TargetDeathTime>5+3
	--目标死亡时间>5+3
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF6","灵魂收割",zhandoumoshi) --显示指定色块窗体
		return
	end

	--黑暗突变-----------------------------------------------------------------
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("黑暗突变")
	--技能可用 资源可用
	and
	CD_KWDL<10
	--枯萎凋零CD<10秒
	then
		if IsPlayerSpell(390259)
		--已学天赋 [亡者指挥官]
		and
		CD_TQ<=GCD+GCD_Max*2
		--天启CD<=2个GCD
		and
		TargetRange<=5
		--单位距离
		and
		Runes>=2
		--符文>=2
		and
		DebuffCount_KLZS<=3
		--脓疮打击 DEBUFF层数<=3
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","脓疮补溃",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		if not IsPlayerSpell(390259)
		--已学天赋 [亡者指挥官]
		or
		DebuffCount_KLZS>=4
		--脓疮打击 DEBUFF层数>=4
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","黑暗突变",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	
	if IsPlayerSpell(390259)
	--已学天赋 [亡者指挥官]
	then
	
		--天启-----------------------------------------------------------------
		if zhandoumoshi==1
		--爆发模式 开启
		and
		WR_SpellUsable("天启")
		--技能可用 资源可用
		and
		BuffTime_WZZHG>GCD
		--亡者指挥官 BUFF存在
		then
			if DebuffCount_KLZS>=4
			--溃烂之伤 DEBUFF层数>=4
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF3","满天启",zhandoumoshi) --显示指定色块窗体
				return
			end
		end

		--召唤石像鬼-----------------------------------------------------------------
		if zhandoumoshi==1
		--爆发模式 开启
		and
		WR_SpellUsable("召唤石像鬼")
		--技能可用 资源可用
		and
		BuffTime_WZZHG>GCD
		--亡者指挥官 BUFF存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACSF5","召唤石像鬼",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	
	--符文武器增效-----------------------------------------------------------------
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("符文武器增效")
	--技能可用 资源可用
	and
	BuffTime_HATB>GCD
	--黑暗突变 BUFF存在
	then
		
		--爆发药水
		if WRSet.XE_BFYS==1 then
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
					WR_ShowColorFrame("ACSF3","爆发药水",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
		end
		
		--饰品1
		if (WRSet.XE_SP==1 or WRSet.XE_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13)
		--1号饰品可以使用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF5","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--饰品2
		if (WRSet.XE_SP==2 or WRSet.XE_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14)
		--2号饰品可以使用
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF6","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF2","符文武器增效",zhandoumoshi) --显示指定色块窗体
		return
	end

	--邪恶突袭-----------------------------------------------------------------
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("邪恶突袭")
	--技能可用 资源可用
	and
	BuffTime_HATB>GCD
	--黑暗突变 BUFF存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","邪恶突袭",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	if not IsPlayerSpell(390259)
	--没学天赋 [亡者指挥官]
	then
		if zhandoumoshi==1
		--爆发模式 开启
		and
		CD_TQ<=GCD+GCD_Max*2
		--天启CD<=2个GCD
		and
		TargetRange<=5
		--单位距离
		and
		Runes>=2
		--符文>=2
		and
		(
		DebuffCount_KLZS==0
		--脓疮打击 DEBUFF层数==0
		or
			(
				DebuffCount_KLZS<=3
				--脓疮打击 DEBUFF层数<=3
				and
				T31Count<2
				--套装31 2件套
				and
				T32Count<2
				--套装32 2件套
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","脓疮补溃",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--天启-----------------------------------------------------------------
		if zhandoumoshi==1
		--爆发模式 开启
		and
		WR_SpellUsable("天启")
		--技能可用 资源可用
		and
		DebuffCount_KLZS>=1
		--溃烂之伤 DEBUFF层数>=1
		and
		(
			DebuffCount_KLZS>=4
			--溃烂之伤 DEBUFF层数>=4
			or
			T31Count>=2
			--套装31 2件套
			or
			T32Count>=2
			--套装32 2件套
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF3","天启",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	
	--憎恶附肢-----------------------------------------------------------------
	if WRSet.XE_ZEFZ==1
	--憎恶附肢 开启
	and
	zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("憎恶附肢")
	--技能可用 资源可用
	and
	(
		Runes<2
		--符文数量<2
		or
		BuffCount_KLZL>10
		--溃烂之力 BUFF层数>10
		or
		not IsPlayerSpell(377590)
		--没学天赋 溃烂之力
		or
		(
			BuffTime_KLZL>GCD
			--溃烂之力 BUFF存在
			and
			BuffTime_KLZL<12
			--溃烂之力 BUFF时间<12
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","憎恶附肢",zhandoumoshi) --显示指定色块窗体
		return
	end

	--满传染-----------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染 施法条件通过
	and
	RunicPower>=85
	--符文能量>=85
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","满传染",zhandoumoshi) --显示指定色块窗体
		return
	end

	--满缠绕-----------------------------------------------------------------
	if WR_DeathKnightUnholy_DLCR()
	--凋零缠绕 施法条件通过
	and
	RunicPower>=85
	--符文能量>=85
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF2","满缠绕",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--单体凋零--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_KWDL()
	--枯萎凋零 施法条件
	and
	BuffTime_XD<=GCD+GCD_Max+1
	--亵渎 BUFF剩余时间<=下一个GCD+1秒延迟
	and
	HUCountRange8==1
	--8码单位==1
	and
	(
		BuffTime_HATB>8
		--黑暗突变 BUFF时间>8
		or
		(
			TQ_Time~=nil
			and
			25-(GetTime()-TQ_Time)>8
		)
		--石像鬼 存在时间>8
		or
		(
			TQ_Time~=nil
			and
			20-(GetTime()-TQ_Time)>8
		)
		--天启 亡者大军 存在时间>8
		or
		(
			WZDJ_Time~=nil
			and
			30-(GetTime()-WZDJ_Time)>8
		)
		--亡者大军 存在时间>8
		or
		(
			IsPlayerSpell(152280)
			--已学天赋 [亵渎]
			and
			(
				SXG_Sum>=1
				--石像鬼 存在
				or
				(
					TQ_Time~=nil
					and
					GetTime()-TQ_Time<20
				)
				--天启 亡者大军 存在
				or
				(
					WZDJ_Time~=nil
					and
					GetTime()-WZDJ_Time<30
				)
				--亡者大军 存在
				or
				BuffTime_HATB>GCD
				--黑暗突变 BUFF存在
			)
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","单体凋零",zhandoumoshi) --显示指定色块窗体
		return
	end

	--满天灾-----------------------------------------------------------------
	if WR_DeathKnightUnholy_TZDJ()
	--天灾打击 技能条件通过
	and
	BuffCount_KLZL<20
	--溃烂之力 BUFF层数<20
	and
	(
		BuffTime_KWDL>GCD+0.2
		--枯萎凋零存在+0.2延迟
		or
		HUCountRange8==1
		--8码单位==1
	)
	and
	Runes==6
	--符文数量==6
	then
		--满脓疮-----------------------------------------------------------------
		if WR_DeathKnightUnholy_NCDJ()
		--脓疮打击 技能条件通过
		and
		HUCountRange8==1
		--8码单位==1
		and
		DebuffCount_KLZS==0
		--脓疮打击 DEBUFF层数==0
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","满脓疮",zhandoumoshi) --显示指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","满天灾",zhandoumoshi) --显示指定色块窗体
		return
	end

	--免费传染-----------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染施法条件通过
	and
	BuffTime_MRTJ>GCD
	--末日突降 BUFF存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","免费传染",zhandoumoshi) --显示指定色块窗体
		return
	end

	--免费缠绕-----------------------------------------------------------------
	if WR_DeathKnightUnholy_DLCR()
	--凋零缠绕 施法条件通过
	and
	BuffTime_MRTJ>GCD
	--末日突降 BUFF存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF2","免费缠绕",zhandoumoshi) --显示指定色块窗体
		return
	end

	--高能传染-----------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染施法条件通过
	and
	RunicPower>=70
	--符文能量>=70
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","高能传染",zhandoumoshi) --显示指定色块窗体
		return
	end

	--高能缠绕-----------------------------------------------------------------
	if WR_DeathKnightUnholy_DLCR()
	--凋零缠绕 施法条件通过
	and
	RunicPower>=70
	--符文能量>=70
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF2","高能缠绕",zhandoumoshi) --显示指定色块窗体
		return
	end

	--续时传染-----------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染施法条件通过
	and
	BuffTime_HATB>GCD
	--黑暗突变 BUFF存在
	and
	BuffTime_HATB<GCD+GCD_Max*3
	--黑暗突变 BUFF时间<3个GCD
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","续时传染",zhandoumoshi) --显示指定色块窗体
		return
	end

	--续时缠绕-----------------------------------------------------------------
	if WR_DeathKnightUnholy_DLCR()
	--凋零缠绕 施法条件通过
	and
	BuffTime_HATB>GCD
	--黑暗突变 BUFF存在
	and
	BuffTime_HATB<GCD+GCD_Max*3
	--黑暗突变 BUFF时间<3个GCD
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF2","续时缠绕",zhandoumoshi) --显示指定色块窗体
		return
	end

	--溃烂天灾-----------------------------------------------------------------
	if WR_DeathKnightUnholy_TZDJ()
	--天灾打击 技能条件通过
	and
	BuffCount_KLZL<20
	--溃烂之力 BUFF层数<20
	and
	Runes>=2
	--符文数量
	and
	(
		BuffTime_KWDL>GCD+0.2
		--枯萎凋零存在+0.2延迟
		or
		HUCountRange8==1
		--8码单位==1
	)
	then
		--溃烂脓疮-----------------------------------------------------------------
		if WR_DeathKnightUnholy_NCDJ()
		--脓疮打击 技能条件通过
		and
		HUCountRange8==1
		--8码单位==1
		and
		DebuffCount_KLZS==0
		--脓疮打击 DEBUFF层数==0
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","溃烂脓疮",zhandoumoshi) --显示指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","溃烂天灾",zhandoumoshi) --显示指定色块窗体
		return
	end

	--传染-----------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染施法条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","传染",zhandoumoshi) --显示指定色块窗体
		return
	end

	--凋零缠绕-----------------------------------------------------------------
	if WR_DeathKnightUnholy_DLCR()
	--凋零缠绕 施法条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF2","凋零缠绕",zhandoumoshi) --显示指定色块窗体
		return
	end

	--天灾打击-----------------------------------------------------------------
	if WR_DeathKnightUnholy_TZDJ()
	--天灾打击 技能条件通过
	and
	Runes>=2
	--符文数量
	and
	(
		BuffTime_KWDL>GCD+0.2
		--枯萎凋零存在+0.2延迟
		or
		HUCountRange8==1
		--8码单位==1
	)
	then
		--脓疮打击-----------------------------------------------------------------
		if WR_DeathKnightUnholy_NCDJ()
		--脓疮打击 技能条件通过
		and
		HUCountRange8==1
		--8码单位==1
		and
		DebuffCount_KLZS==0
		--脓疮打击 DEBUFF层数==0
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","脓疮打击",zhandoumoshi) --显示指定色块窗体
			return
		end
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","天灾打击",zhandoumoshi) --显示指定色块窗体
		return
	end

	--补凋零--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_KWDL()
	--枯萎凋零 施法条件
	and
	HUCountRange8>=2
	--8码单位>=2
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF9","补凋零",zhandoumoshi) --显示指定色块窗体
		return
	end

	--无凋零时的填充技能-----------------------------------------------------------------
	if 
	(
		zhandoumoshi~=1
		--爆发模式 关闭
		or
		(
			BuffTime_KWDL<=GCD
			--枯萎凋零 BUFF不存在
			and
			GetSpellCharges("枯萎凋零")==0
			--枯萎凋零不可用
		)
		or
		HUCountRange8==1
		--8码单位==1
	)
	and
	(
		CD_KWDL>5
		--枯萎凋零CD>5
		or
		Runes>=5
		--符文数量>=5
	)
	then
		--脓疮填充-----------------------------------------------------------------
		if WR_DeathKnightUnholy_NCDJ()
		--脓疮打击 技能条件通过
		and
		(
			HUCountRange8>=2
			--8码单位>=2
			or
			DebuffCount_KLZS==0
			--脓疮打击 DEBUFF层数==0
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","脓疮填充",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--天灾填充-----------------------------------------------------------------
		if WR_DeathKnightUnholy_TZDJ()
		--天灾打击 技能条件通过
		and
		Runes>=2
		--符文数量
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF5","天灾填充",zhandoumoshi) --显示指定色块窗体
			return
		end
		
	end
	--无凋零时的填充技能-----------------------------------------------------------------

	














--[[

	--传染--------------------------------------------------------------------------------------------
	if WR_DeathKnightUnholy_CR()
	--传染施法条件通过
	and
	HUCountRange8>=4
	--敌人数量>=4
	and
	(
		(
			IsPlayerSpell(390259)
			--已学天赋 [亡者指挥官]
			and
			BuffTime_WZZHG>GCD
			--亡者指挥官 BUFF存在
			and
			CD_TQ<5
			--天启 CD<5
		)
		or
		(
			DebuffTime_SWXL>GCD
			--死亡朽烂 DEBUFF存在
			and
			DebuffTime_SWXL<GCD+GCD_Max
			--死亡朽烂 DEBUFF时间<下一个GCD
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","传染",zhandoumoshi) --显示指定色块窗体
		return
	end


	
	--AOE-----------------------------------------------------------------
	if HUCountRange8>=4 then


		

		

		
		--枯萎凋零不存在 且 枯萎凋零CD即将好了的时候-----------------------------------------------------------------
		if CD_KWDL<10
		--枯萎凋零CD<10秒
		and
		BuffTime_KWDL<=GCD
		--枯萎凋零 BUFF不存在
		then
			--传染-----------------------------------------------------------------
			if WR_DeathKnightUnholy_CR()
			--传染施法条件通过
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACF3","传染",zhandoumoshi) --显示指定色块窗体
				return
			end
		
			--脓疮打击-----------------------------------------------------------------
			if WR_SpellUsable("脓疮打击")
			--技能可用 资源可用
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF8","脓疮打击",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
		--枯萎凋零不存在 且 枯萎凋零CD即将好了的时候-----------------------------------------------------------------

		--枯萎凋零存在-----------------------------------------------------------------
		if BuffTime_KWDL>GCD then
		--枯萎凋零存在
		
			--传染-----------------------------------------------------------------
			if WR_DeathKnightUnholy_CR()
			--传染施法条件通过
			and
			(
				HUCountRange8
				--敌人数量>=6
				or
				RunicPower>70
				--符文能量>70
				or
				BuffCount_KLZL==20
				--溃烂之力 BUFF层数==20
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACF3","传染",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--天灾打击-----------------------------------------------------------------
			if WR_SpellUsable("天灾打击")
			--技能可用 资源可用
			and
			DebuffCount_KLZS>=1
			--溃烂之伤 DEBUFF层数>=1
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF5","天灾打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--传染-----------------------------------------------------------------
			if WR_DeathKnightUnholy_CR()
			--传染施法条件通过
			and
			AvgDeathTime<10
			--预计战斗时间<10秒
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACF3","传染",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--天灾打击-----------------------------------------------------------------
			if WR_SpellUsable("天灾打击")
			--技能可用 资源可用
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF5","天灾打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			
		end
		--枯萎凋零存在-----------------------------------------------------------------

		--枯萎凋零不存在 且 枯萎凋零CD>10秒-----------------------------------------------------------------
		if CD_KWDL>10
		--枯萎凋零CD>10秒
		and
		BuffTime_KWDL<=GCD
		--枯萎凋零 BUFF不存在
		then
		
		end
		--枯萎凋零不存在 且 枯萎凋零CD>10秒-----------------------------------------------------------------

	end
	--AOE-----------------------------------------------------------------
]]


	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
		
	end


end

--传染 施法条件
function WR_DeathKnightUnholy_CR()
	if WR_SpellUsable("传染")
	--技能可用 资源可用
	and
	DebuffTime_EXWY>GCD
	--恶性瘟疫 DEBUFF存在 
	and
	TargetRange<=30
	--单位距离
	and
	HUCountRange8>=2
	--8码单位>=2
	then
		return true
	end
	return false
end

--凋零缠绕 施法条件
function WR_DeathKnightUnholy_DLCR()
	if WR_SpellUsable("凋零缠绕")
	--技能可用 资源可用
	and
	TargetRange<=30
	--单位距离
	and
	(
		HUCountRange8==1
		--8码单位==1
		or
		not IsPlayerSpell(207317)
		--没有学习 传染
	)
	then
		return true
	end
	return false
end

--天灾打击 暗影之爪 施法条件
function WR_DeathKnightUnholy_TZDJ()
	if
	(
		not IsPlayerSpell(207311)
		--没学天赋 暗影之爪
		and
		WR_SpellUsable("天灾打击")
		--技能可用 资源可用
		and
		TargetRange<=5
		--单位距离
	)
	or
	(
		IsPlayerSpell(207311)
		--已学天赋 暗影之爪
		and
		WR_SpellUsable("暗影之爪")
		--技能可用 资源可用
		and
		TargetRange<=30
		--单位距离
	)
	then
		return true
	end
	return false
end

--脓疮打击 施法条件
function WR_DeathKnightUnholy_NCDJ()
	if WR_SpellUsable("脓疮打击")
	--技能可用 资源可用
	and
	TargetRange<=5
	--单位距离
	and
	DebuffCount_KLZS<=3
	--脓疮打击 DEBUFF层数<=3
	then
		return true
	end
	return false
end

--爆发 施法条件
function WR_DeathKnightUnholy_BF(Unit)
	if WR_SpellUsable("爆发")
	--技能可用 资源可用
	and
	WR_GetUnitRange(Unit)<=30
	--单位距离<=30
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	WR_GetUnitDeathTime(Unit)>WR_GetUnitDebuffInfo(Unit,"恶性瘟疫",true)
	--单位死亡时间>单位恶性瘟疫 DEBUFF时间
	and
	(
		(
			not IsPlayerSpell(390175)
			--没学天赋 [瘟疫使者]
			and
			WR_GetUnitDebuffInfo(Unit,"恶性瘟疫",true)<=27*0.3
			--恶性瘟疫 DEBUFF剩余时间<最大续时
		)
		or
		WR_GetUnitDebuffInfo(Unit,"恶性瘟疫",true)<=27*0.3/2
		--恶性瘟疫 DEBUFF剩余时间<最大续时
	)
	and
	(
		zhandoumoshi~=1
		--爆发模式 关闭
		or
		not IsPlayerSpell(115989)
		--没学天赋 [邪恶虫群]
		or
		CD_XECQ>GCD+GCD_Max*2
		--邪恶虫群 CD>两个GCD
	)
	then
		return true
	end
	return false
end

--枯萎凋零 施法条件
function WR_DeathKnightUnholy_KWDL()
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("枯萎凋零")
	--技能可用 资源可用
	and
	TargetRange<=5
	--单位距离<=5
	and
	BuffTime_KWDL<=GCD+0.2
	--枯萎凋零 BUFF不存在+0.2延迟
--[[
	and
	IsPlayerSpell(152280)
	--已学天赋 [亵渎]
]]--
	then
		return true
	end
	return false
end

--灵界打击 技能条件
function WR_DeathKnightUnholy_LJDJ()
	if WRSet.XE_LJDJ~=6
	--灵界打击 开启
	and
	WR_SpellUsable("灵界打击")
	--技能可用 资源可用
	and
	TargetRange<=5
	--单位距离<=5
	and
	PlayerHP<=WRSet.XE_LJDJ/10
	--玩家血量<=设定值
	then
		return true
	end
	return false
end

--反魔法护罩 的先决条件
function WR_DeathKnightUnholy_FMFHZ()
	if WR_SpellUsable("反魔法护罩")
	--技能可用 资源可用
	and
	IsPlayerSpell(48707)
	--已学天赋[反魔法护罩]
	and
	WR_SpellReflection(1)
	--对我的施法<=1秒
	then
		return true
	end
	return false
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_DeathKnightUnholy_LastSpellTime()
	if LastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="亡者大军" then
					--释放成功的技能名称
						WZDJ_Time=GetTime()
					end
					if SpellName=="天启" then
					--释放成功的技能名称
						TQ_Time=GetTime()
					end
					if SpellName=="召唤石像鬼" then
					--释放成功的技能名称
						ZHSXG_Time=GetTime()
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end


--[[







枯萎凋零
BuffTime_KWDL>GCD
枯萎凋零 BUFF存在
and
DebuffCount_KLZS>1
--溃烂之伤 DEBUFF层数>1











符文武器增效,if=
宠物.石像鬼.存在
and
宠物.石像鬼.剩余时间<=23




邪恶突袭,if=
宠物.石像鬼.存在
and
宠物.石像鬼.剩余时间<=23



脓疮打击,if=
debuff.溃烂之伤.层数=0
or
符文能量<40
and
!宠物.石像鬼.存在


黑暗突变
天启
石像鬼

符文武器
邪恶突袭
]]--




	--黑暗突变-----------------------------------------------------------------
	if zhandoumoshi==1
	--爆发模式 开启
	and
	WR_SpellUsable("黑暗突变")
	--技能可用 资源可用
	and
	CD_KWDL<10
	--枯萎凋零CD<10秒
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7","黑暗突变",zhandoumoshi) --显示指定色块窗体
		return
	end
