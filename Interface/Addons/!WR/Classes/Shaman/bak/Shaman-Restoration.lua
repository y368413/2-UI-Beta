--奶萨运行库
function WR_ShamanRestoration()
	if GetSpecialization()~=3 then	--如果不是恢复(3)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu = 0.1
		
		local T11_S1={
		[1]=212009,
		[2]=212010,
		[3]=212011,
		[4]=212012,
		[5]=212014,
		}
		T11_S1_Count=WR_GetSuit(T11_S1)	--获得11S1套装的数量
	
		GCD = WR_GetGCD("闪电之盾")	--获得当前公共CD剩余时间
		MaxGCD = WR_GetMaxGCD(1.5)
		PlayerMove = WR_PlayerMove() and WR_GetUnitBuffTime("player","灵魂行者的恩赐")==0 and WR_GetUnitBuffTime("player","自然迅捷")==0 and WR_GetUnitBuffTime("player","先祖迅捷")==0	--获得自身是否在移动或者空中
		
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		
		FocusHP = 1
		FocusLostHealth = 0
		if IsSpellInRange("激流","focus") then
			if WR_GetUnitDebuffTime("focus","虚空裂隙")~=0 then	--虚空裂隙 DEBUFF存在
				FocusHP = UnitHealth("focus")/UnitHealthMax("focus")
				FocusLostHealth = UnitHealthMax("focus")-UnitHealth("focus")
			else	--虚空裂隙 DEBUFF不存在
				FocusHP = WR_GetUnitHP("focus")	--获得目标真实带护盾的血量比例
				FocusLostHealth = WR_GetUnitLostHealth("focus")	--获得焦点损失的血量
			end
		end
		
		RaidOrParty = WR_GetInRaidOrParty() --获得自己是在小队还是在团队
		
		ZLZY_CastTime = WR_GetTrueCastTime("治疗之涌")	--治疗之涌 施法时间
		ZLB_CastTime = WR_GetTrueCastTime("治疗波")	--治疗波 施法时间
		
		CXBY_BuffTime , CXBY_BuffCount = WR_GetUnitBuffInfo("player","潮汐奔涌")
		XZXJ_BuffTime  = WR_GetUnitBuffTime("player","先祖迅捷")
		ST_BuffTime  = WR_GetUnitBuffTime("player","升腾")
		XZZY_BuffTime  = WR_GetUnitBuffTime("player","先祖指引")
		
		JL_Value = WR_GetSpellValue("激流","为其恢复","点")	--获得 激流 治疗量0
		SMSF_Value = WR_GetSpellValue("生命释放","恢复","点")	--获得 生命释放 治疗量
		ZLZY_Value = WR_GetSpellValue("治疗之涌","恢复","点") * 1.15	--获得 治疗之涌 治疗量	* 1.15(洪水天赋提供15%治疗效果)
		ZLB_Value = WR_GetSpellValue("治疗波","恢复","点") * 1.15	--获得 治疗之涌 治疗量	* 1.15(洪水天赋提供15%治疗效果)
		ZLL_Value = WR_GetSpellValue("治疗链","恢复","点") * 1.15	--获得 治疗链 治疗量	* 1.15(洪水天赋提供15%治疗效果)
		
		BestUnit_JL = WR_ShamanRestoration_BestUnit_JL()	--获得激流最佳单位
		--Range7Count = WR_GetRangeHarmUnitCount(7)	--获得7码内敌人数量
		Range15Count = WR_GetRangeHarmUnitCount(15)	--获得15码内敌人数量
		Range30Count = WR_GetRangeHarmUnitCount(30)	--获得30码内敌人数量
		TargetRange = WR_GetUnitRange("target")	--获得目标距离
		AvgDeathTime = WR_GetRangeAvgDeathTime(40)	--获得40所有单位平均存活时间
		
		--判定图腾是否存在
		Totem_YD=false	--涌动图腾
		Totem_ZLZQ=false	--治疗之泉图腾
		Totem_SB=false	--石壁图腾
		Totem_ZLZC=false	--治疗之潮图腾
		Totem_LHLJ=false	--灵魂链接图腾
		for i=1,40,1
		do
		   local _, totemName, startTime, duration, _= GetTotemInfo(i)
			if totemName=="涌动图腾" then
				Totem_YD=true
			elseif totemName=="治疗之泉图腾" then
				Totem_ZLZQ=true
			elseif totemName=="石壁图腾" then
				Totem_SB=true
			elseif totemName=="治疗之潮图腾" then
				Totem_ZLZC=true
			elseif totemName=="灵魂链接图腾" then
				Totem_LHLJ=true
			end 
		end
		
		BUFF_PLUS=0
		if ST_BuffTime>GCD then BUFF_PLUS=BUFF_PLUS+0.30 end	--升腾 增益+30%
		if XZZY_BuffTime>GCD then BUFF_PLUS=BUFF_PLUS+0.15 end	--先祖指引 增益+15%
		--if Totem_SB then BUFF_PLUS=BUFF_PLUS+0.15 end	--石壁图腾 增益+15%
		if Totem_ZLZC then BUFF_PLUS=BUFF_PLUS+0.30 end	--治疗之潮图腾 增益+15%
		if Totem_LHLJ then BUFF_PLUS=BUFF_PLUS+0.30 end	--灵魂链接图腾 增益+30%
		
		PartyLostHP = WR_PartyLostHP()	--获得全队损失血量比例
		
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if not UnitAffectingCombat("player") then	--不在战斗中
		for i=1,4,1 do 
			local TempUnit="party"..i
			if UnitExists(TempUnit)	--单位存在
			and UnitName(TempUnit)~=nil	--单位名称存在
			then
				if HF_DDZD_menuItems[i].text~=UnitName(TempUnit) then	--如果列表指定选项文本不等于当前单位名称
					HF_DDZD_UpdateMenuItemText(i, UnitName(TempUnit))	--给 能量灌注 下拉菜单更新文本
				end
			else
				if HF_DDZD_menuItems[i].text~="" then	--如果列表指定选项文本不等于当前单位名称
					HF_DDZD_UpdateMenuItemText(i, "")	--给 能量灌注 下拉菜单更新文本
				end
			end
		end
	end
		
	if MSG==1 then
		print("----------")
	end
	
	--中断伤害性法术施法
	if UnitCastingInfo("player")=="熔岩爆裂"
	or UnitCastingInfo("player")=="闪电箭"
	or UnitCastingInfo("player")=="闪电链"
	then
		if UnitExists("focus") and not UnitCanAttack("player","focus") and WR_GetUnitHP("focus")<=0.70 then	--焦点是友方 并且 焦点血量低于70%
			if WR_ColorFrame_Show("CSX","停止施法") then return true end
		else
			if WR_FocusMaxWeightUnit("友方") then return end	--焦点最高权重单位
		end
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	if UnitCastingInfo("player")~=nil then	--正在施法
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	
	if WR_ShamanRestoration_SP("自保/协助") then return end	--饰品 自保/协助
	if WR_Shaman_ZLS() then return end	--治疗石
	if WR_Shaman_ZLYS() then return end	--治疗药水
	if WR_Shaman_XJZY() then return end	--星界转移
	if WR_ShamanRestoration_SBTT() then return end	--石壁图腾
	if WR_Shaman_Function_FJ() then return end	--风剪
	if WR_ShamanRestoration_WQFM() then return end	--武器附魔
	if WR_Shaman_TN() then return end	--天怒
	if WR_Shaman_Function_JHLH() then return end	--净化灵魂
	if WR_ShamanRestoration_ZLTT() then return end	--战栗图腾
	if WR_Shaman_Function_JHS() then return end	--净化术
	if WR_ShamanRestoration_LTFB() then return end	--雷霆风暴
	
	if WR_FocusMaxWeightUnit() then return end	--焦点最高权重单位
	
	if WR_ShamanRestoration_SP("常驻/爆发") then return end	--饰品 常驻/爆发
	if WR_ShamanRestoration_ST() then return end	--升腾
	if WR_ShamanRestoration_XZZY() then return end	--先祖指引
	if WR_ShamanRestoration_ZLZCTT() then return end	--治疗之潮图腾
	if WR_ShamanRestoration_LHLJTT() then return end	--灵魂链接图腾
	
	if WR_ShamanRestoration_ZRXJ() then return end	--自然迅捷
	if WR_ShamanRestoration_ZLL("迅捷") then return end	--治疗链
	if WR_ShamanRestoration_ZLZY("35%") then return end	--治疗之涌 35%危险值
	
	if WR_ShamanRestoration_HSTT() then return end	--回收图腾
	if WR_ShamanRestoration_ZLZQTT() then return end	--治疗之泉图腾
	if WR_ShamanRestoration_YDTT() then return end	--涌动图腾
	if WR_ShamanRestoration_QPDY() then return end	--倾盆大雨
	
	if WR_ShamanRestoration_JL("潮汐奔涌") then return end	--激流 潮汐奔涌
	if WR_ShamanRestoration_SMSF() then return end	--生命释放
	if WR_ShamanRestoration_ZLL("团队") then return end	--治疗链
	if WR_ShamanRestoration_ZLZY("宗师") then return end	--治疗之涌 元素宗师2层
	if WR_ShamanRestoration_ZLZY("50%") then return end	--治疗之涌 50%
	
	if WR_ShamanRestoration_XZSJ() then return end	--先祖视界
	
	if WR_ShamanRestoration_ZLL("使者") then return end	--治疗链
	if WR_ShamanRestoration_ZLB() then return end	--治疗波
	
	
	
	if WR_ShamanRestoration_ZLL("预读") then return end	--治疗链
	
	if WR_ShamanRestoration_RYBL_Function("熔岩奔腾") then return end	--熔岩爆裂 熔岩奔腾
	if WR_ShamanRestoration_ZLZY() then return end	--治疗之涌
	--if WR_ShamanRestoration_JL("满层") then return end	--激流 满层
	if WR_ShamanRestoration_SZHD() then return end	--水之护盾
	if WR_ShamanRestoration_DDZD() then return end	--大地之盾
	
	if not WR_ResistSustained()	--持续型伤害不存在
	and WR_ResistOutburstTime()>3	--尖刺型伤害法术施法时间>3秒
	then
		if WR_ShamanRestoration_LYZJ() then return end	--烈焰震击
		if WR_ShamanRestoration_TYS() then return true end	--土元素
		if WRSet.HF_SHSC==1 then	--伤害输出 开启
			if WR_ShamanRestoration_RYBL_Function() then return end	--熔岩爆裂
			if WR_ShamanRestoration_SDL_Function() then return end	--闪电链
			if WR_ShamanRestoration_SDJ_Function() then return end	--闪电箭
		end
	end
	
	if WR_Function_ZNMB(6,WRSet.HF_ZNMB) then return true end	--智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
		
	end
end

--饰品
function WR_ShamanRestoration_SP(Text)
	if Text=="自保/协助" then
		if WRSet.HF_SP1>=3 then
			if WR_ShiPin(1,WRSet.HF_SP1) then return true end	--饰品 自保/协助
		end
		if WRSet.HF_SP2>=3 then
			if WR_ShiPin(2,WRSet.HF_SP2) then return true end	--饰品 自保/协助
		end
	elseif Text=="常驻/爆发" then
		if WRSet.HF_SP1==1 then
			if WR_ShiPin(1,WRSet.HF_SP1) then return true end	--饰品 常驻
		end
		if WRSet.HF_SP2==1 then
			if WR_ShiPin(2,WRSet.HF_SP2) then return true end	--饰品 常驻
		end
		
		if zhandoumoshi==1 and WRSet.HF_SP1==2 then
			if WR_ShiPin(1,WRSet.HF_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.HF_SP2==2 then
			if WR_ShiPin(2,WRSet.HF_SP2) then return true end	--饰品 爆发
		end
	end
	return false
end

--激流 最佳单位
function WR_ShamanRestoration_BestUnit_JL()
	local BestUnit="player"
	local BestTime=999
	
	local TempUnit="focus"
	local TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
	if TempBuffTime<BestTime
	and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
	and WR_GetUnitLostHealth(TempUnit)>=JL_Value	--单位损失血量>=激流恢复生命值
	then
		BestUnit=TempUnit
		BestTime=TempBuffTime
		if BestTime<=5.4 then return BestUnit end
	end
	
	local TempUnit="player"
	local TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
	if TempBuffTime<BestTime
	and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
	and WR_GetUnitLostHealth(TempUnit)>=JL_Value	--单位损失血量>=激流恢复生命值
	then
		BestUnit=TempUnit
		BestTime=TempBuffTime
		if BestTime<=5.4 then return BestUnit end
	end
	
	local Sum=4
	if RaidOrParty=="raid" then Sum=25 end
	for i=1,Sum do
		TempUnit=RaidOrParty .. i
		TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
		if TempBuffTime<BestTime
		and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
		and WR_GetUnitLostHealth(TempUnit)>=JL_Value	--单位损失血量>=激流恢复生命值
		then
			BestUnit=TempUnit
			BestTime=TempBuffTime
			if BestTime<=5.4 then return BestUnit end
		end
	end
	
	local TempUnit="focus"
	local TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
	if TempBuffTime<BestTime
	and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
	then
		BestUnit=TempUnit
		BestTime=TempBuffTime
		if BestTime<=5.4 then return BestUnit end
	end
	
	local TempUnit="player"
	local TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
	if TempBuffTime<BestTime
	and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
	then
		BestUnit=TempUnit
		BestTime=TempBuffTime
		if BestTime<=5.4 then return BestUnit end
	end
	
	local Sum=4
	if RaidOrParty=="raid" then Sum=25 end
	for i=1,Sum do
		TempUnit=RaidOrParty .. i
		TempBuffTime=WR_GetUnitBuffTime(TempUnit,"激流",true)
		if TempBuffTime<BestTime
		and IsSpellInRange("激流",TempUnit)	--单位在技能范围内
		then
			BestUnit=TempUnit
			BestTime=TempBuffTime
			if BestTime<=5.4 then return BestUnit end
		end
	end
	
	return BestUnit
end

--激流
function WR_ShamanRestoration_JL(Text)
	if GCD>ShiFaSuDu then return false end
	
	if Text=="潮汐奔涌"
	and CXBY_BuffTime <= GCD + MaxGCD + 0.3	--潮汐奔涌 BUFF时间 < 当前公共冷却时间 + 最大GCD冷却时间 + 0.3秒(延迟)
	then
		if UnitIsUnit("focus",BestUnit_JL) then
			if WR_ColorFrame_Show("CF2","奔涌"..BestUnit_JL) then return true end
		end
		if WR_FocusUnit(BestUnit_JL,"奔涌") then return true end --焦点单位过程
	elseif Text=="满层"
	and	WR_GetSpellNextCharge("激流")==0	--激流充能所需时间==0
	then
		if UnitIsUnit("focus",BestUnit_JL) then
			if WR_ColorFrame_Show("CF2","满流"..BestUnit_JL) then return true end
		end
		if WR_FocusUnit(BestUnit_JL,"满流") then return true end --焦点单位过程
	end
	
	return false
end

--始源之潮
function WR_ShamanRestoration_SYZC(Text)
	if GCD>ShiFaSuDu then return false end
	
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("始源之潮")	--技能可用
	and CXBY_BuffCount<=2	--潮汐奔涌 BUFF层数<=2
	and WR_GetSpellCharges("激流")<=3	--激流可用次数<=3
	and UnitAffectingCombat("player")	--单位战斗中
	then
		if UnitIsUnit("focus",BestUnit_JL) then
			if WR_ColorFrame_Show("CF5","始源"..BestUnit_JL) then return true end
		end
		if WR_FocusUnit(BestUnit_JL,"始源") then return true end --焦点单位过程
	end
	
	return false
end

--治疗之涌
function WR_ShamanRestoration_ZLZY(Text)
	if GCD>ShiFaSuDu then return false end
	if not IsSpellInRange("治疗之涌","focus") then return false end	--焦点不在技能范围内
	if FocusLostHealth < ZLZY_Value then return false end	--焦点损失血量 < 治疗之涌 治疗量
	if PlayerMove and XZXJ_BuffTime==0 then return false end	--玩家在移动 并且 先祖迅捷BUFF不存在
	if WR_StopCast(WR_GetTrueCastTime("治疗之涌")) then return false end	--会被沉默的情况
			
	
	if Text=="35%"
	and FocusHP<=0.35	--焦点血量<=35%
	and not WR_InTraining()	--不是打木桩
	then
		if WR_ColorFrame_Show("SF7","30%涌") then return true end
	elseif Text=="50%"
	and not RaidOrParty=="raid"	--不在团队
	and	CXBY_BuffTime > GCD + ZLZY_CastTime + 0.3	--潮汐奔涌 BUFF时间 > 当前公共冷却时间 + 治疗之涌 施法时间 + 0.3秒(延迟)
	and FocusHP <= 0.5	--焦点血量<=50%
	then
		if WR_ColorFrame_Show("SF7","60%涌") then return true end
	elseif Text=="宗师"
	and	CXBY_BuffTime > GCD + ZLZY_CastTime + 0.3	--潮汐奔涌 BUFF时间 > 当前公共冷却时间 + 治疗之涌 施法时间 + 0.3秒(延迟)
	and FocusLostHealth >= ZLZY_Value * 2	--焦点损失血量 >= 治疗之涌 治疗量 * 2
	and WR_GetUnitBuffCount("player","元素宗师")>=2	--元素宗师 BUFF层数>=2
	then
		if WR_ColorFrame_Show("SF7","爆击涌") then return true end
	elseif Text==nil
	and not RaidOrParty=="raid"	--不在团队
	and	CXBY_BuffTime > GCD + ZLZY_CastTime + 0.3	--潮汐奔涌 BUFF时间 > 当前公共冷却时间 + 治疗之涌 施法时间 + 0.3秒(延迟)
	and
	(
		FocusLostHealth >= ZLZY_Value * 2	--焦点损失血量 >= 治疗之涌 治疗量 * 2
		or
		WR_UnitAssistDebuff("focus")	--焦点需要协助
	)
	then
		if WR_ColorFrame_Show("SF7","治疗之涌") then return true end
	end
	
	return false
end

--治疗波
function WR_ShamanRestoration_ZLB()
	--print("治疗波0")
	if GCD>ShiFaSuDu then return false end
	if not IsSpellInRange("治疗波","focus") then return false end	--焦点不在技能范围内
	if FocusLostHealth < ZLB_Value then return false end	--焦点损失血量 < 治疗波 治疗量
	if PlayerMove and XZXJ_BuffTime==0 then return false end	--玩家在移动 并且 先祖迅捷BUFF不存在
	if WR_StopCast(WR_GetTrueCastTime("治疗波")) then return false end	--会被沉默的情况
	--print("治疗波1")
	if CXBY_BuffTime > GCD + ZLB_CastTime + 0.3	--潮汐奔涌 BUFF时间 > 当前公共冷却时间 + 治疗波 施法时间 + 0.3秒(延迟)
	and
	(
		WR_GetUnitBuffTime("player","始源之潮") > GCD + ZLB_CastTime + 0.3	--始源之潮 BUFF时间 > 当前公共冷却时间 + 治疗之涌 施法时间 + 0.3秒(延迟)
		or
		T11_S1_Count<4	--11.0 S1套装件数<4件
	)
	and WR_GetUnitBuffCount("player","元素宗师")<2	--元素宗师 BUFF层数<2
	and FocusLostHealth > ZLB_Value * 2	--焦点损失血量 >= 治疗波 治疗量 * 2
	then
		if WR_ColorFrame_Show("CF3","治疗波") then return true end
	end
	
	return false
end

--武器附魔
function WR_ShamanRestoration_WQFM()
	if GCD>ShiFaSuDu then return false end
	local _, _, _, mainHandEnchantID, _, _, _, offHandEnchantID = GetWeaponEnchantInfo()	--获取主手和副手的临时附魔ID
	
	if IsPlayerSpell(382021) --已学 大地生命武器
	and mainHandEnchantID~=6498 --主手不是大地生命武器
	then
		if WR_ColorFrame_Show("ASF1","大地生命武器") then return true end
	end
	
	if IsPlayerSpell(457481) --已学 唤潮者的护卫
	and select(7, GetItemInfo(GetInventoryItemID("player", 17) or 221090))=="盾牌"
	and offHandEnchantID~=7528 --副手不是唤潮者的护卫
	then
		if WR_ColorFrame_Show("SF9","唤潮者的护卫") then return true end
	end
	
	
	
	return false
end

--水之护盾
function WR_ShamanRestoration_SZHD()
	local SZHD_BuffTime , SZHD_BuffCount  = WR_GetUnitBuffTime("player","水之护盾")
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("水之护盾")	--技能可用
	and
	(
		SZHD_BuffTime==0 --水之护盾 BUFF不存在
		or
		(
			not UnitAffectingCombat("player")	--单位没有战斗中
			and
			(
				SZHD_BuffTime<=300	--水之护盾 BUFF时间<5分钟
				or
				SZHD_BuffCount<=5 --水之护盾 BUFF层数
			)
		)
	)
	then
		if WR_ColorFrame_Show("ASF3","水之护盾") then return true end
	end
	return false
end

--大地之盾
function WR_ShamanRestoration_DDZD()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("大地之盾")	--技能可用
	then
		local DDZD_BuffTime , DDZD_BuffCount  = WR_GetUnitBuffTime("player","大地之盾")
		if DDZD_BuffTime==0 --大地之盾 BUFF不存在
		or
		(
			not UnitAffectingCombat("player")	--单位没有战斗中
			and
			(
				DDZD_BuffTime<=300	--大地之盾 BUFF时间<5分钟
				or
				DDZD_BuffCount<=5 --大地之盾 BUFF层数
			)
		)
		then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("ASF5","地盾") then return true end
			end
			if WR_FocusUnit("player","地盾") then return true end --焦点单位过程
		end
		
		if WRSet.HF_DDZD~=nil and WRSet.HF_DDZD~=5 and IsPlayerSpell(383010) then	--已学 [元素环绕]
			local DDZD_Unit = "party" .. WRSet.HF_DDZD
			local DDZD_BuffTime , DDZD_BuffCount  = WR_GetUnitBuffTime(DDZD_Unit,"大地之盾")
			if IsSpellInRange("大地之盾",DDZD_Unit)	--技能范围内
			and
			(
				DDZD_BuffTime==0 --大地之盾 BUFF不存在
				or
				(
					not UnitAffectingCombat("player")	--单位没有战斗中
					and
					(
						DDZD_BuffTime<=300	--大地之盾 BUFF时间<5分钟
						or
						DDZD_BuffCount<=5 --大地之盾 BUFF层数
					)
				)
			)
			then
				if UnitIsUnit("focus",DDZD_Unit) then
					if WR_ColorFrame_Show("ASF5","地盾") then return true end
				end
				if WR_FocusUnit(DDZD_Unit,"地盾") then return true end --焦点单位过程
			end
		end
	end
	return false
end

--先祖迅捷
function WR_ShamanRestoration_XZXJ()
	if WR_SpellUsable("先祖迅捷")	--技能可用
	and
	(
		FocusHP<=0.6	--焦点血量
		or
		WR_RangeCountPR(40,0.75)>=2	--40码内血量低于70%的队友数量>=2
	)
	and UnitAffectingCombat("player")	--玩家战斗中
	and not PlayerMove	--玩家没有移动
	then
		if WR_ColorFrame_Show("CF7","先祖迅捷") then return true end
	end
	return false
end

--自然迅捷
function WR_ShamanRestoration_ZRXJ()
	if WR_SpellUsable("自然迅捷")	--技能可用
	and FocusHP<0.35	--焦点血量
	and UnitAffectingCombat("player")	--玩家战斗中
	then
		if WR_ColorFrame_Show("CF7","自然迅捷") then return true end
	end
	return false
end

--治疗之雨
function WR_ShamanRestoration_ZLZYu()
	if GCD>ShiFaSuDu then return false end
	if PlayerMove then return false end	--玩家在移动
	if WR_StopCast(WR_GetTrueCastTime("治疗之雨")) then return false end	--会被沉默的情况
	if not WR_SpellUsable("治疗之雨") then return false end	--技能不可用
	if AvgDeathTime<10 then return false end	--预计战斗结束时间<10秒
	
	if TargetRange<=8 then	--目标距离<=8码
		if WR_ColorFrame_Show("CF6","治疗之雨") then return true end
	end
	return false
end

--涌动图腾
function WR_ShamanRestoration_YDTT()
	if WRSet.HF_YDTT~=1 then return false end	--涌动图腾 关闭
	if GCD>ShiFaSuDu then return false end
	if PlayerMove then return false end	--玩家在移动
	if not WR_SpellUsable("涌动图腾") then return false end	--技能不可用
	
	if Range30Count>=1 then	--30码内敌人数量>=1
		if WR_ColorFrame_Show("CF6","涌动图腾") then return true end
	end
	return false
end

--倾盆大雨
function WR_ShamanRestoration_QPDY()
	local QPDY_BuffTime = WR_GetUnitBuffTime("player",462488)	--获得 倾盆大雨 BUFF时间
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("倾盆大雨")	--技能可用
	and QPDY_BuffTime > GCD	--倾盆大雨 BUFF存在
	and QPDY_BuffTime <= GCD + MaxGCD --倾盆大雨 BUFF时间<=当前公共冷却时间 + 最大公共冷却时间
	then
		if WR_ColorFrame_Show("CF6","倾盆大雨") then return true end
	end
	return false
end

--暴雨图腾
function WR_ShamanRestoration_BYTT(Text)
	if GCD>ShiFaSuDu then return false end
	if PlayerMove then return false end	--玩家在移动
	if not WR_SpellUsable("暴雨图腾") then return false end	--技能不可用
	if AvgDeathTime<18 then return false end	--预计战斗结束时间<18秒
	
	if Text=="满层"
	and Range15Count>=1	--15码内敌人数量>=1
	and	WR_GetSpellCharges("暴雨图腾")>=2	--暴雨图腾可用次数>=2
	then
		if WR_ColorFrame_Show("CF8","暴雨图腾") then return true end
	end
	return false
end

--生命释放
function WR_ShamanRestoration_SMSF()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("生命释放")	--技能可用
	and UnitAffectingCombat("player")	--玩家战斗中
	and FocusLostHealth > SMSF_Value	--焦点损失血量 > 生命释放治疗量
	and
	(
		FocusHP<=0.6	--焦点血量
		or
		WR_RangeCountPR(40,0.75)>=2	--40码内血量低于70%的队友数量>=2
	)
	then
		if WR_ColorFrame_Show("SF4","生命释放") then return true end
	end
	return false
end

--熔岩爆裂
function WR_ShamanRestoration_RYBL(Unit)
	if IsSpellInRange("熔岩爆裂",Unit)	--单位在法术范围内
	and WR_TargetInCombat(Unit)	--单位在战斗中
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("CF9","爆裂"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"爆裂") then return true end --焦点单位过程
	end
	return false
end

--熔岩爆裂
function WR_ShamanRestoration_RYBL_Function(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("熔岩爆裂") then return false end	--技能不可用
	
	local YSZS_BuffTime , YSZS_BuffCount = WR_GetUnitBuffInfo("player","元素宗师")
	if
	(
		YSZS_BuffCount < 2	--元素宗师BUFF层数 < 2
		or
		WR_GetSpellNextCharge("熔岩爆裂")==2	--满层
	)
	then
		if
		(
			Text == "熔岩奔腾"
			and
			WR_GetUnitBuffCount("player","熔岩奔腾")>GCD	--熔岩奔腾 BUFF存在
		)
		or
		(
			Text == nil
			and
			(
				not PlayerMove	--没有移动
				or
				WR_GetUnitBuffCount("player","熔岩奔腾")>GCD	--熔岩奔腾 BUFF存在
				or
				XZXJ_BuffTime>GCD	--先祖迅捷 BUFF存在
			)
		)
		then
			if WR_ShamanRestoration_RYBL("target") then return true end
			if WR_ShamanRestoration_RYBL("mouseover") then return true end
			for i = 1 , 4 do
				if WR_ShamanRestoration_RYBL("party" .. i .. "target") then return true end
			end
		end
	end 
	return false
end

--获得最佳单位 烈焰震击
function WR_ShamanRestoration_BeatUnit_LYZJ()
	local BestS=999
	local BeatUnit=""
	
	if WR_GetUnitRange("target")<=40	--AOE范围内
	and WR_TargetInCombat("target")	--单位战斗
	and WR_CanDot("target")	--单位可以上DOT
	then
		local TempS = WR_GetUnitDebuffTime("target","烈焰震击",true)
		if TempS==0 then
			return "target"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if WR_GetUnitRange("mouseover")<=40	--AOE范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	and WR_CanDot("mouseover")	--单位可以上DOT
	then
		local TempS = WR_GetUnitDebuffTime("mouseover","烈焰震击",true)
		if TempS==0 then
			return "mouseover"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if WR_GetUnitRange(TempUnit)<=40	--AOE范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		and WR_CanDot(TempUnit)	--单位可以上DOT
		then
			local TempS = WR_GetUnitDebuffTime(TempUnit,"烈焰震击",true)
			if TempS==0 then
				return TempUnit
			elseif TempS < BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	return BeatUnit
end

--烈焰震击
function WR_ShamanRestoration_LYZJ()
	local BeatUnit_LYZJ = WR_ShamanRestoration_BeatUnit_LYZJ()	--获得烈焰震击最佳单位
	if BeatUnit_LYZJ=="" then return false end	--烈焰震击目标不存在
	
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("烈焰震击")	--技能可用
	then
		if UnitIsUnit("focus",BeatUnit_LYZJ) then
			if WR_ColorFrame_Show("SF3","震击"..BeatUnit_LYZJ) then return true end
		end
		if WR_FocusUnit(BeatUnit_LYZJ,"震击") then return true end --焦点单位过程
	end

	return false
end

--闪电链
function WR_ShamanRestoration_SDL(Unit)
	if IsSpellInRange("闪电链",Unit)	--单位在法术范围内
	and WR_TargetInCombat(Unit)	--单位在战斗中
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("CF11","电链"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"电链") then return true end --焦点单位过程
	end
	return false
end

--闪电链
function WR_ShamanRestoration_SDL_Function(Text)
	if GCD>ShiFaSuDu then return false end
	if PlayerMove then return false end	--玩家在移动
	if Range30Count<2 then return false end	--15码内单位数量<2
	
	if WR_ShamanRestoration_SDL("target") then return true end
	if WR_ShamanRestoration_SDL("mouseover") then return true end
	for i = 1 , 4 do
		if WR_ShamanRestoration_SDL("party" .. i .. "target") then return true end
	end
	return false
end

--闪电箭
function WR_ShamanRestoration_SDJ(Unit)
	if IsSpellInRange("闪电箭",Unit)	--单位在法术范围内
	and WR_TargetInCombat(Unit)	--单位在战斗中
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("CF4","电箭"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"电箭") then return true end --焦点单位过程
	end
	return false
end

--闪电箭
function WR_ShamanRestoration_SDJ_Function(Text)
	if GCD>ShiFaSuDu then return false end
	if PlayerMove then return false end	--玩家在移动
	
	if WR_ShamanRestoration_SDJ("target") then return true end
	if WR_ShamanRestoration_SDJ("mouseover") then return true end
	for i = 1 , 4 do
		if WR_ShamanRestoration_SDJ("party" .. i .. "target") then return true end
	end
	return false
end

--升腾
function WR_ShamanRestoration_ST()
	if WRSet.HF_ST==1	--升腾 开启
	and PartyLostHP>0.30	--全队损失血量比例>0.30
	and PartyLostHP-BUFF_PLUS>0.30	--全队损失血量比例-BUFF增益比例>0.30
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("升腾")	--技能可用
	and zhandoumoshi==1
	and UnitAffectingCombat("player")	--玩家战斗中
	then
		if WR_ColorFrame_Show("CF10","升腾") then return true end
	end
	return false
end

--先祖指引
function WR_ShamanRestoration_XZZY()
	if WRSet.HF_XZZY==1	--先祖之魂 开启
	and PartyLostHP>0.30	--全队损失血量比例>0.30
	and PartyLostHP-BUFF_PLUS>0.15	--全队损失血量比例-BUFF增益比例>0.15
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("先祖指引")	--技能可用
	and zhandoumoshi==1
	and UnitAffectingCombat("player")	--玩家战斗中
	then
		if WR_ColorFrame_Show("CSY","先祖指引") then return true end
	end
	return false
end

--治疗之潮图腾
function WR_ShamanRestoration_ZLZCTT()
	if WRSet.HF_ZLZC==1	--治疗之潮图腾 开启
	and PartyLostHP>0.30	--全队损失血量比例>0.30
	and PartyLostHP-BUFF_PLUS>0.30	--全队损失血量比例-BUFF增益比例>0.30
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("治疗之潮图腾")	--技能可用
	and zhandoumoshi==1
	and UnitAffectingCombat("player")	--玩家战斗中
	then
		if WR_ColorFrame_Show("CF1","治疗之潮") then return true end
	end
	return false
end

--灵魂链接图腾
function WR_ShamanRestoration_LHLJTT()
	if WRSet.HF_LHLJ==1	--灵魂链接图腾 开启
	and PartyLostHP>0.50	--全队损失血量比例>0.30
	and PartyLostHP-BUFF_PLUS>0.50	--全队损失血量比例-BUFF增益比例>0.30
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and zhandoumoshi==1
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_SpellUsable("图腾投射")	--技能可用
	and WR_SpellUsable("灵魂链接图腾")	--技能可用
	then
		if WR_ColorFrame_Show("SF11","灵魂链接图腾") then return true end
	end
	return false
end

--石壁图腾
function WR_ShamanRestoration_SBTT()
	if WRSet.HF_XJZY~=6 --星界转移 开启
	and PlayerHP<=WRSet.HF_XJZY/10
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("石壁图腾")	--技能可用
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_GetUnitBuffTime("player","星界转移")<=GCD	--星界转移 不存在
	then
		if WR_ColorFrame_Show("SF6","石壁图腾") then return true end
	end
	return false
end

--查找坦克
function WR_ShamanRestoration_FindTank()
	for i=1,4,1 do 
		local TempUnit="party"..i
		if UnitExists(TempUnit)	--单位存在
		and not UnitIsDead(TempUnit)	--单位存活
		and UnitGroupRolesAssigned(TempUnit)=="TANK"	--单位是坦克
		then
			return TempUnit
		end
	end
	
	return nil
end

--施法过程 先祖视界
function WR_ShamanRestoration_XZSJ()
	if WRSet.HF_XZSJ==1	--先祖视界 开启
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and not UnitAffectingCombat("player") --单位 不在 战斗中
	and not PlayerMove --没有移动
	and WR_ResurrectParty() --有可以复活的队友
	then
		if WR_ColorFrame_Show("SF5","先祖视界") then return true end
	end
	return false
end

--土元素
function WR_ShamanRestoration_TYS()
	if GCD<=ShiFaSuDu
	and WR_TargetInCombat("target")	--单位在战斗中
	and TargetRange<=20 --单位在技能范围内
	and WR_SpellUsable("土元素")	--技能可用
	and
	(
		(
			WRSet.HF_TYS==1 --土元素 首领
			and
			WR_InBossCombat() --BOSS战
		)
		or
		(
			WRSet.HF_TYS==2 --土元素 爆发
			and
			zhandoumoshi==1	--爆发 开启
		)
	)
	then
		if WR_ColorFrame_Show("ASF6","土元素") then return true end
	end
	return false
end

--治疗之泉图腾
function WR_ShamanRestoration_ZLZQTT()
	if GCD<=ShiFaSuDu
	and not IsPlayerSpell(157153) --没学 暴雨图腾
	and WR_SpellUsable("治疗之泉图腾")	--技能可用
	and WR_GetSpellCharges("治疗之泉图腾")>=1	--可用次数>=1
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_RangeCountPR(40,0.90)>=4	--40码内血量低于90%血量的队友数量>=4
	and
	(
		not Totem_ZLZQ	--治疗之泉图腾 不存在
		or
		WR_RangeCountPR(40,0.60)>=4	--40码内血量低于60%血量的队友数量>=4
		or
		PartyLostHP>=0.5	--团队损失血量>=50%
	)
	then
		if WR_ColorFrame_Show("CF8","治疗之泉") then return true end
	end
	return false
end

--回收图腾
function WR_ShamanRestoration_HSTT()
	if GCD<=ShiFaSuDu
	and not IsPlayerSpell(157153) --没学 暴雨图腾
	and WR_SpellUsable("收回图腾")	--技能可用
	and WR_GetSpellCharges("治疗之泉图腾")==0	--可用次数==0
	and UnitAffectingCombat("player")	--玩家战斗中
	and
	(
		WR_RangeCountPR(40,0.60)>=4	--40码内血量低于60%血量的队友数量>=4
		or
		PartyLostHP>=0.4	--团队损失血量>=40%
	)
	then
		if WR_ColorFrame_Show("CSP","收回图腾") then return true end
	end
	return false
end

--治疗链
function WR_ShamanRestoration_ZLL(Text)
	if GCD<=ShiFaSuDu
	and IsSpellInRange("治疗链","focus")	--技能范围内
	and WR_SpellUsable("治疗链")	--技能可用
	and UnitAffectingCombat("player")	--玩家战斗中
	and not WR_StopCast(WR_GetTrueCastTime("治疗链"))	--不会被沉默
	then
		if
		(
			Text=="团队"
			and RaidOrParty=="raid"	--在团队
			and WR_GetSpellCharges("治疗之泉图腾")<2	--可用次数<2
			and not PlayerMove --玩家没有移动
			and WR_RangeCountPR(40,0.90)>=4	--40码内血量低于90%血量的队友数量>=4
			and FocusLostHealth > ZLL_Value	--焦点损失血量 > 治疗链 治疗量
		)
		or
		(
			Text=="使者"
			and WR_GetSpellCharges("治疗之泉图腾")<2	--可用次数<2
			and not PlayerMove --玩家没有移动
			and WR_RangeCountPR(40,0.85)>=4	--40码内血量低于90%血量的队友数量>=4
			and WR_GetUnitBuffTime("player","浪潮汹涌")>GCD	--浪潮汹涌存在
			and FocusLostHealth > ZLL_Value	--焦点损失血量 > 治疗链 治疗量
			and
			(
				not IsPlayerSpell(236501)	--没学 潮汐使者
				or
				WR_GetUnitBuffCount("player","潮汐使者")>=1	--潮汐使者 BUFF层数>=1
			)
		)
		or
		(
			Text=="迅捷"
			and WR_GetSpellCharges("治疗之泉图腾")<2	--可用次数<2
			and WR_GetUnitBuffTime("player","自然迅捷")>GCD	--自然迅捷 BUFF存在
			and WR_RangeCountPR(40,0.80)>=4	--40码内血量低于80%血量的队友数量>=4
			and WR_GetUnitBuffTime("player","浪潮汹涌")>GCD	--浪潮汹涌存在
			and FocusLostHealth > ZLL_Value	--焦点损失血量 > 治疗链 治疗量
		)
		or
		(
			Text=="预读"
			and WR_PreemptiveHealing("治疗链") --AOE尖刺伤害结束后瞬间放出治疗链
		)
		then
			if WR_ColorFrame_Show("SF10","链"..(Text or "")) then return true end
		end
	end
	return false
end

--雷霆风暴
function WR_ShamanRestoration_LTFB()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WRSet.HF_LTFB==1 --雷霆风暴 开启
	and WR_SpellUsable("雷霆风暴")	--技能可用
	and WR_StunUnit(8,2)	--范围内有需要控制的单位
	then
		if WR_ColorFrame_Show("SF12","雷霆风暴") then return true end
	end
	return false
end

--战栗图腾
function WR_ShamanRestoration_ZLTT()
	if IsPlayerSpell(8143)	--已学 战栗图腾
	and WR_SpellUsable("战栗图腾")	--技能可用
	and
	(
		UnitCastingInfo("boss1")=="憎恨之容"
		or
		UnitCastingInfo("boss2")=="憎恨之容"
	)
	then
		if WR_ColorFrame_Show("CSU","战栗图腾") then return true end
	end
	return false
end