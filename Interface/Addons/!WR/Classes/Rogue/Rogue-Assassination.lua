--奇袭运行库
function WR_RogueAssassination()
	if GetSpecialization()~=1 then return end	--如果不是(1)专精，则不执行该运行库

	ShiFaSuDu=0.05+WRSet.QX_SFSD*0.05
	GCD = WR_GetGCD("偷袭")	--获得公共冷却剩余时间或者当前施法剩余时间
	--GCD = WR_GetGCD("偷袭")	+ 0.1	--获得公共冷却剩余时间或者当前施法剩余时间
	
	BuffTime_QX  = WR_GetUnitBuffTime("player","潜行")	--获得 潜行 Buff信息
	BuffTime_XS  = WR_GetUnitBuffTime("player","消失")	--获得 消失 Buff信息
	BuffTime_LHTL  = WR_GetUnitBuffTime("player","连环屠戮")	--获得 连环屠戮 Buff信息
	BuffTime_JHC  = WR_GetUnitBuffTime("player","菊花茶")	--获得 菊花茶 Buff信息
	BuffTime_QG  = WR_GetUnitBuffTime("player","切割")	--获得 切割 Buff信息
	BuffTime_QHSH  = WR_GetUnitBuffTime("player","强化锁喉")	--获得 强化锁喉 Buff信息
	BuffTime_ZHZY  = WR_GetUnitBuffTime("player","至黑之夜")	--获得 至黑之夜 Buff信息
	BuffTime_DS  = WR_GetUnitBuffTime("player","毒伤")	--获得 毒伤 Buff信息
	BuffTime_GZ  = WR_GetUnitBuffTime("player","诡诈")	--获得 诡诈 Buff信息
	BuffTime_CKDS  = WR_GetUnitBuffTime("player","刺客大师")	--获得 刺客大师 Buff信息

	TargetDebuffTime_JWZZ  = WR_GetUnitDebuffTime("target","君王之灾",true)	--获得 君王之灾 Debuff信息
	TargetDebuffTime_XHFB  = WR_GetUnitDebuffTime("target","猩红风暴",true)	--获得 猩红风暴 Debuff信息
	TargetDebuffTime_GL  = WR_GetUnitDebuffTime("target","割裂",true)	--获得 割裂 Debuff信息
	TargetDebuffTime_FSFJ  = WR_GetUnitDebuffTime("target","腐蚀飞溅",true)	--获得 腐蚀飞溅 Debuff信息
	TargetDebuffTime_SH  = WR_GetUnitDebuffTime("target","锁喉",true)	--获得 锁喉 Debuff信息
	TargetDebuffTime_DR  = WR_GetUnitDebuffTime("target","毒刃",true)	--获得 毒刃 Debuff信息
	TargetDebuffTime_SWLSBJ  = WR_GetUnitDebuffTime("target",457129,true)	--获得 死亡猎手标记 Debuff信息
	TargetDebuffTime_DMYG  = WR_GetUnitDebuffTime("target","夺命药膏",true)	--获得 夺命药膏 Debuff信息

	HUCountRange10=WR_GetRangeHarmUnitCount(10)	--获得10码敌人数量
	if HUCountRange10>1 and WR_SingleUnit() then
		HUCountRange10=1
	end
	
	Energy = UnitPower("player",3)	--获得能量的数量
	EPS = GetPowerRegen()	--获得每秒恢复能量的数量
	ComboPoints = UnitPower("player",4)	--获得连击点的数量
	MaxCP = false	--判断是否满星
	MaxComboPoints=5	--最大连击点
	if IsPlayerSpell(193531) then MaxComboPoints=MaxComboPoints+1 end	--已学 深邃诡计
	if IsPlayerSpell(457512) then MaxComboPoints=MaxComboPoints+1 end	--已学 血色谋策
	if ComboPoints>=MaxComboPoints	--连击点>=最大连击点
	or
	(
		ComboPoints>=5	--连击点>=5
		and
		BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
	)
	then
		MaxCP = true	--满星
	end

	PlayerHP = UnitHealth("player")/UnitHealthMax("player")
	PlayerMove = WR_PlayerMove()	--获得自身是否在移动或者空中
	PlayerCombat = UnitAffectingCombat("player")	--获得自身在战斗
	
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	Training=WR_InTraining()	--获得是否在打木桩
	TargetRange=WR_GetUnitRange("target")	--获得目标距离
	TargetClose = C_Spell.IsSpellInRange("脚踢","target") or C_Spell.IsSpellInRange("毒刃","target")	--获得目标是否在近战范围内
	TargetInCombat=WR_TargetInCombat("target") --获得目标可攻击
	
	
	if WR_PriorityCheck() then return end	--优先检查
	if WR_RogueAssassination_CancelZHZY() then return end	--消除至黑之夜BUFF
	if WR_ZNJD(WRSet.QX_ZNJD) then return end	--智能焦点
	if WR_RogueAssassination_ZNMB() then return end	--智能目标
	if WR_RogueAssassination_ShiPin("自保/协助") then return end	--饰品 自保/协助
	if WR_RogueAssassination_XHZP() then return end	--猩红之瓶
	if WR_Rogue_ZLS() then return end	--治疗石
	if WR_Rogue_ZLYS() then return end	--治疗药水
	if WR_RogueAssassination_YG() then return end	--佯攻
	if WR_Rogue_JiaoTi_Function() then return end	--脚踢
	if WR_Rogue_ShenJi_Function() then return end	--肾击
	if WR_RogueAssassination_QianXing() then return end	--潜行
	if WR_RogueAssassination_DuYao() then return end	--毒药
	if WR_RogueAssassination_JHJQ_Function() then return end	--嫁祸诀窍
	if WR_RogueAssassination_ShiPin("常驻") then return end	--饰品 常驻
	if WR_RogueAssassination_XiaoShi() then return end	--消失
	if WR_RogueAssassination_JuHuaCha() then return end	--菊花茶
	if WR_RogueAssassination_DuRen() then return end	--毒刃
	if WR_RogueAssassination_JWZZ() then return end	--君王之灾
	
	if WR_RogueAssassination_FuJi("潜行") then return end	--伏击
	if WR_RogueAssassination_XHFB("斩杀") then return end	--猩红风暴 斩杀
	if WR_RogueAssassination_GeLie_Function() then return end	--割裂
	if WR_RogueAssassination_XHFB() then return end	--猩红风暴
	if WR_RogueAssassination_DuShang() then return end	--毒伤
	
	if WR_RogueAssassination_SuoHou_Function() then return end	--锁喉
	
	if HUCountRange10==1 then	--10码内只有1个目标 或者 是单体目标
		if WR_RogueAssassination_FuJi("侧袭") then return end	--伏击
		if WR_RogueAssassination_DaoShan("见者尽灭") then return end	--刀扇 见者尽灭 BUFF存在
		if WR_RogueAssassination_HuiShang() then return end	--毁伤 单位<=2
	elseif HUCountRange10>=2 then	--10码内>=2个目标 并且 不是单体目标
		if WR_RogueAssassination_HuiShang() then return end	--毁伤 AOE 上飞溅DEBUFF
		if WR_RogueAssassination_FuJi("侧袭") then return end	--伏击
		if WR_RogueAssassination_DaoShan("AOE") then return end	--刀扇 AOE
	end
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
	
	end

end

--饰品
function WR_RogueAssassination_ShiPin(Text)
	if BuffTime_QX>0 or BuffTime_XS>0 then return false end	--如果在潜行或消失,则退出
	
	if Text=="常驻" then
		if TargetClose and TargetInCombat then	--目标在近战 并且 目标战斗中
			if WRSet.QX_SP1==1 then
				if WR_ShiPin(1,WRSet.QX_SP1) then return true end	--饰品 常驻
			end
			if WRSet.QX_SP2==1 then
				if WR_ShiPin(2,WRSet.QX_SP2) then return true end	--饰品 常驻
			end
		end
	elseif Text=="自保/协助" then
		if WRSet.QX_SP1>=3 then
			if WR_ShiPin(1,WRSet.QX_SP1) then return true end	--饰品 自保/协助
		end
		if WRSet.QX_SP2>=3 then
			if WR_ShiPin(2,WRSet.QX_SP2) then return true end	--饰品 自保/协助
		end
	end
	return false
end

--毒药
function WR_RogueAssassination_DuYao()
	if PlayerMove then return false end	--玩家在移动
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	local BuffTime_DMYG = WR_GetUnitBuffTime("player","夺命药膏")
	if WR_SpellUsable("夺命药膏")	--技能可用
	and UnitCastingInfo("player")~="夺命药膏"	--没有施法 夺命药膏
	and
	(
		BuffTime_DMYG==0	--夺命药膏 BUFF不存在
		or
		(
			BuffTime_DMYG<300	--夺命药膏 BUFF时间<5分钟
			and
			not PlayerCombat	--玩家没在战斗
		)
	)
	then
		if WR_ColorFrame_Show("CN0","夺命药膏") then return true end
	end
	
	local BuffTime_WSYG = WR_GetUnitBuffTime("player","萎缩药膏")
	if WR_SpellUsable("萎缩药膏")	--技能可用
	and UnitCastingInfo("player")~="萎缩药膏"	--没有施法 萎缩药膏
	and
	(
		BuffTime_WSYG==0	--萎缩药膏 BUFF不存在
		or
		(
			BuffTime_WSYG<300	--萎缩药膏 BUFF时间<5分钟
			and
			not PlayerCombat	--玩家没在战斗
		)
	)
	then
		if WR_ColorFrame_Show("CN7","萎缩药膏") then return true end
	end
	
	if not IsPlayerSpell(381801) then return false end	--没学[龙淬之锋]
	
	local BuffTime_ZXYG = WR_GetUnitBuffTime("player","增效药膏")
	if WR_SpellUsable("增效药膏")	--技能可用
	and UnitCastingInfo("player")~="增效药膏"	--没有施法 增效药膏
	and
	(
		BuffTime_ZXYG==0	--增效药膏 BUFF不存在
		or
		(
			BuffTime_ZXYG<300	--增效药膏 BUFF时间<5分钟
			and
			not PlayerCombat	--玩家没在战斗
		)
	)
	then
		if WR_ColorFrame_Show("CN9","增效药膏") then return true end
	end
--[[
	local BuffTime_JSYG = WR_GetUnitBuffTime("player","减速药膏")
	if WR_SpellUsable("减速药膏")	--技能可用
	and UnitCastingInfo("player")~="减速药膏"	--没有施法 减速药膏
	and
	(
		BuffTime_JSYG==0	--减速药膏 BUFF不存在
		or
		(
			BuffTime_JSYG<300	--减速药膏 BUFF时间<5分钟
			and
			not PlayerCombat	--玩家没在战斗
		)
	)
	then
		if WR_ColorFrame_Show("CN8","减速药膏") then return true end
	end
--]]
	return false
end

--强化割裂
function WR_RogueAssassination_QiangHuaGeLie()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and
	(
		ComboPoints>=5	--连击点>=5
		or
		MaxCP	--满星
	)
	and WR_SpellUsable("割裂")	--技能可用
	and BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
	and HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"割裂")	--10码敌人数量>割裂 的数量
	--and WR_RogueAssassination_EnergyControl(24)	--能量控制
	and WR_RogueAssassination_EnergyControl(35)	--能量控制
	and
	WR_GetHaveDebuffRangeUnitCount(40,"割裂")<=5	--5个割裂就够了
	then
		if WR_ColorFrame_Show("CF1","强化割裂") then return true end
	end
	return false
end

--割裂
function WR_RogueAssassination_GeLie_Unit(Unit,Text)
	if C_Spell.IsSpellInRange("割裂",Unit)	--单位在技能范围内
	and WR_GetUnitDebuffTime(Unit,"割裂",true) <= (ComboPoints*4+4)*0.3	--单位 割裂 可以续时
	and WR_TargetInCombat(Unit)	--单位战斗中
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF1","割裂"..Text.."T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF5","割裂"..Text.."M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF6","割裂"..Text.."F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSF1","割裂"..Text.."P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSF2","割裂"..Text.."P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF3","割裂"..Text.."P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF4","割裂"..Text.."P4T") then return true end
		end
	end
	return false
end

--割裂
function WR_RogueAssassination_GeLie(Text)
	if WR_RogueAssassination_GeLie_Unit("target",Text) then return true end
	if WR_RogueAssassination_GeLie_Unit("mouseover",Text) then return true end
	if WR_RogueAssassination_GeLie_Unit("focus",Text) then return true end
	for i = 1 , 4 do
		if WR_RogueAssassination_GeLie_Unit("party"..i.."target",Text) then return true end
	end
	return false
end

--割裂
function WR_RogueAssassination_GeLie_Function()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("割裂")	--技能可用
	and ComboPoints>=5	--连击点>=5
	and WR_RogueAssassination_EnergyControl(35)	--能量控制
	then
		if BuffTime_ZHZY<=GCD then	--至黑之夜 BUFF不存在
			--当前目标续割裂
			if TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and TargetDebuffTime_GL <= (ComboPoints*4+4)*0.3 then	--目标 割裂 可以续时
				if WR_ColorFrame_Show("CF1","割裂1") then return true end
			end
			
			--维持至少两个割裂
			if TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and IsPlayerSpell(457068)	--已学 [觅血寻踪] 2个割裂增伤
			and HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"割裂")	--10码敌人数量>割裂 的数量
			and WR_GetHaveDebuffRangeUnitCount(40,"割裂")<2	--割裂数量<2个
			then
				if TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) then	--猩红风暴DEBUFF存在 或者 没学猩红风暴
					if WR_RogueAssassination_GeLie("2") then return true end
				end
			end
			
			--多目标续割裂
			if TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
			and HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"割裂")	--10码敌人数量>割裂 的数量
			and WR_GetHaveDebuffRangeUnitCount(40,"割裂")<=5	--5个割裂就够了
			then
				if TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) then	--猩红风暴DEBUFF存在 或者 没学猩红风暴
					if WR_RogueAssassination_GeLie("3") then return true end
					if WR_ColorFrame_Show("CF1","割裂3") then return true end
				end
			end
			
			--连环屠戮即将消失的时候,把割裂打出
			if TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
			and BuffTime_LHTL<=8	--连环屠戮 BUFF剩余时间<=8
			and HUCountRange10>=4	--10码内单位>=4 因为3目标的话,有连环屠戮的时候是会同时挂3个的
			and TargetDebuffTime_GL<24	--目标割裂DEBUFF剩余时间<24秒
			and ( TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) )	--猩红风暴DEBUFF存在 或者 没学猩红风暴
			then
				if WR_RogueAssassination_GeLie("4") then return true end
				if WR_ColorFrame_Show("CF1","割裂4") then return true end
			end
		end
			
		--多目标续割裂 骤死
		if BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
		and IsPlayerSpell(381798)	--已学 [佐迪克配方] 斩杀增伤
		and IsPlayerSpell(457068)	--已学 [觅血寻踪] 猩红增伤
		and HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"割裂")	--10码敌人数量>割裂 的数量
		then
			if TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) then	--猩红风暴DEBUFF存在 或者 没学猩红风暴
				if WR_RogueAssassination_GeLie("5") then return true end
				if WR_ColorFrame_Show("CF1","割裂5") then return true end
			end
		end
	end
	return false
end

--伏击
function WR_RogueAssassination_FuJi(Text)
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("伏击")	--技能可用
	then
		if Text=="潜行"
		and BuffTime_QX>0 --潜行 BUFF存在
		and TargetDebuffTime_SWLSBJ<=GCD	--死亡猎手标记 DEBUFF不存在
		and
		(
			WR_RogueAssassination_EnergyControl(50)	--能量控制
			or
			WR_GetUnitBuffTime("player","侧袭")>GCD	--侧袭 Buff存在
		)
		then
			if WR_ColorFrame_Show("SF7","伏击1") then return true end
		end
		
		if Text=="侧袭"
		and not MaxCP	--没有满星
		and HUCountRange10<=2	--10码单位<=2
		and WR_GetUnitBuffTime("player","侧袭")>GCD	--侧袭 Buff存在
		then
			if WR_ColorFrame_Show("SF7","伏击2") then return true end
		end
	end
	return false
end

--强化锁喉
function WR_RogueAssassination_QiangHuaSuoHou()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("锁喉")	--技能可用
	and WR_RogueAssassination_EnergyControl(45)	--能量控制
	and
	(
		ComboPoints<5	--连击点<5
		or
		(
			ComboPoints<7	--连击点<7
			and
			BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
		)
	)
	and BuffTime_QHSH>GCD	--强化锁喉 BUFF存在
	and
	(
		(--单目标君王的时候,尽快凑够豆打毒伤
			HUCountRange10==1	--单目标
			and TargetDebuffTime_JWZZ>GCD	--目标君王之灾DEBUFF存在
			and IsPlayerSpell(385478)	--已学 暗影窒息(强化锁喉3豆)
			and
			(
				(
					ComboPoints==2	--连击点==2
					and
					BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
				)
				or
				(
					ComboPoints==4	--连击点==4
					and
					BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
				)
			)
		)
		or
		(
			HUCountRange10>=2	--10码内单位数量>=2
			and TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
			and
			(
				WR_GetUnitDebuffTime("target","锁喉",true)<12	--锁喉 DEBUFF时间<12
				or
				HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"锁喉")	--10码敌人数量>锁喉 的数量
			)
			and
			WR_GetHaveDebuffRangeUnitCount(40,"锁喉")<=5	--5个锁喉就够了
		)
	)
	then
		if WR_ColorFrame_Show("CF2","强化锁喉") then return true end
	end
	return false
end

--锁喉
function WR_RogueAssassination_SuoHou(Unit)
	if C_Spell.IsSpellInRange("锁喉",Unit)	--单位在技能范围内
	and WR_GetUnitDebuffTime(Unit,"锁喉",true)<=5.4	--单位 锁喉 DEBUFF时间<=5.4秒
	and WR_TargetInCombat(Unit)	--单位战斗中
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF2","锁喉T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN5","锁喉M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CN6","锁喉F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN1","锁喉P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN2","锁喉P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN3","锁喉P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN4","锁喉P4T") then return true end
		end
	end
	return false
end

--锁喉
function WR_RogueAssassination_SuoHou_Function()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("锁喉")	--技能可用
	and not MaxCP	--没有满星
	and WR_RogueAssassination_EnergyControl(45)	--能量控制
	then
	
		if TargetDebuffTime_SH<=5.4 then	--目标锁喉DEBUFF剩余时间<=5.4秒(最大续时)
			if WR_ColorFrame_Show("CF2","锁喉1") then return true end
		end
		
		if HUCountRange10==1	--单目标
		and BuffTime_QHSH>GCD	--强化锁喉 BUFF存在
		and TargetDebuffTime_SH<18	--目标锁喉DEBUFF剩余时间<18秒
		then
			--君王的时候,尽快凑够豆打毒伤
			if TargetDebuffTime_JWZZ>GCD+1	--目标君王之灾DEBUFF剩余时间>下一个技能的GCD
			and IsPlayerSpell(385478)	--已学 暗影窒息(强化锁喉3豆)
			and
			(
				(
					ComboPoints==2	--连击点==2
					and
					BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
				)
				or
				(
					ComboPoints==4	--连击点==4
					and
					BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
				)
			)
			then
				if WR_ColorFrame_Show("CF2","锁喉2") then return true end
			end
			
			--强化锁喉即将消失的时候,把锁喉打出
			if TargetDebuffTime_SH<18	--目标锁喉DEBUFF剩余时间<18秒
			and
			(
				(
					ComboPoints<=1	--连击点<=1
					and
					BuffTime_QHSH<=GCD+1	--强化锁喉 BUFF剩余时间<1个技能GCD
				)
				or
				(
					ComboPoints>=2	--连击点>=2
					and
					BuffTime_QHSH<=GCD+2	--强化锁喉 BUFF剩余时间<2个技能GCD
				)
			)
			then
				if WR_ColorFrame_Show("CF2","锁喉3") then return true end
			end
		end
		
		if HUCountRange10>=2	--多目标
		and BuffTime_QHSH>GCD	--强化锁喉 BUFF存在
		and BuffTime_LHTL>GCD	--连环屠戮 BUFF存在
		and ( TargetDebuffTime_FSFJ>GCD or not IsPlayerSpell(421975) )	--腐蚀飞溅DEBUFF存在 或者 没学腐蚀飞溅
		then
			if TargetDebuffTime_JWZZ<=GCD	--目标君王之灾DEBUFF不存在
			and WR_GetHaveDebuffRangeUnitCount(40,"锁喉")<=5	--锁喉DEBUFF数量<=5个，5个锁喉就够了
			and HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"锁喉")	--10码敌人数量>锁喉 的数量
			then
				if WR_ColorFrame_Show("CF2","锁喉4") then return true end
			end
			
			if TargetDebuffTime_JWZZ>GCD	--目标君王之灾DEBUFF存在
			and ComboPoints>=4	--连击点>=4	用刀扇或者用锁喉都能满豆
			and TargetDebuffTime_SH<18	--目标锁喉DEBUFF剩余时间<18秒
			then
				if WR_ColorFrame_Show("CF2","锁喉5") then return true end
			end
		end
		
		if HUCountRange10==2	--双目标
		and ( TargetDebuffTime_FSFJ>GCD or not IsPlayerSpell(421975) )	--腐蚀飞溅DEBUFF存在 或者 没学腐蚀飞溅
		then
			if WR_RogueAssassination_SuoHou("mouseover") then return true end
			for i = 1 , 4 do
				if WR_RogueAssassination_SuoHou("party" .. i .. "target") then return true end
			end
		end

	end

	return false
end

--毁伤
function WR_RogueAssassination_HuiShang()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("毁伤")	--技能可用
	and not MaxCP	--没有满星
	and WR_RogueAssassination_EnergyControl(50)	--能量控制
	then
		if HUCountRange10==1	--单体
		and not MaxCP	--不是满星
		then
			if WR_ColorFrame_Show("CF3","毁伤1") then return true end
		end
	
		if HUCountRange10>=2	--AOE
		and IsPlayerSpell(421975)	--已学 腐蚀飞溅
		and TargetDebuffTime_GL>GCD	--割裂 DEBUFF存在
		and TargetDebuffTime_FSFJ<=GCD+1	--腐蚀飞溅 DEBUFF时间<1个技能公共冷却时间
		and TargetDebuffTime_DMYG>GCD	--夺命药膏 DEBUFF存在
		then
			if WR_ColorFrame_Show("CF3","毁伤2") then return true end
		end
	end
	return false
end

--潜行
function WR_RogueAssassination_QianXing()
	if BuffTime_QX==0	--潜行 不存在
	and BuffTime_XS==0	--消失 不存在
	and not PlayerCombat --玩家没有战斗中
	and WR_SpellUsable("潜行")	--技能可用
	then
		if WR_ColorFrame_Show("CF4","潜行") then return true end
	end
	return false
end

--刀扇
function WR_RogueAssassination_DaoShan(Text)
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and not MaxCP	--不是满星
	and WR_SpellUsable("刀扇")	--技能可用
	and WR_RogueAssassination_EnergyControl(35)	--能量控制
	then
		if Text=="见者尽灭"
		and WR_GetUnitBuffTime("player",457178)>GCD	--见者尽灭 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","刀扇1") then return true end
		end
		
		if Text=="AOE"
		and
		(
			TargetDebuffTime_FSFJ>GCD	--腐蚀飞溅DEBUFF存在
			or
			not IsPlayerSpell(421975)	--没学腐蚀飞溅,无法保持腐蚀飞溅DEBUFF
			or
			TargetDebuffTime_GL<=GCD	--割裂DEBUFF不存在,无法产生腐蚀飞溅DEBUFF
			or
			TargetDebuffTime_DMYG<=GCD	--夺命药膏DEBUFF不存在,无法产生腐蚀飞溅DEBUFF
		)
		then
			if WR_ColorFrame_Show("CF7","刀扇2") then return true end
		end
	end
	return false
end

--猩红风暴
function WR_RogueAssassination_XHFB_Unit(Unit)
	if (C_Spell.IsSpellInRange("脚踢",Unit) or C_Spell.IsSpellInRange("毒刃",Unit) or WR_GetUnitRange("target")<=2)	--获得目标是否在近战范围内
	and UnitHealth(Unit)/UnitHealthMax(Unit)<=0.35	--进入斩杀线
	and WR_GetUnitDebuffTime(Unit,"猩红风暴",true)<=12	--猩红风暴DEBUFF时间<=12秒
	and WR_TargetInCombat(Unit) --获得目标可攻击
	then
		return true
	end
	return false
end

--猩红风暴
function WR_RogueAssassination_XHFB_All()
	if WR_RogueAssassination_XHFB_Unit("target") then return true end
	if WR_RogueAssassination_XHFB_Unit("mouseover") then return true end
	for i = 1 , 4 do
		if WR_RogueAssassination_XHFB_Unit("party"..i.."target") then return true end
	end
	for i = 1 , 40 do
		if WR_RogueAssassination_XHFB_Unit("nameplate"..i) then return true end
	end
	return false
end

--猩红风暴
function WR_RogueAssassination_XHFB(Text)
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and
	(
		MaxCP	--满星
		or
		ComboPoints>=5	--连击点>=5
	)
	and HUCountRange10>=2	--10码内单位数量
	and WR_SpellUsable("猩红风暴")	--技能可用
	and WR_RogueAssassination_EnergyControl(42)	--能量控制
	then
		if Text==nil
		and BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
		and TargetDebuffTime_XHFB<=(4+ComboPoints*2)*0.3	--猩红风暴 DEBUFF时间可以最大程度续时
		and
		(
			HUCountRange10==2	--10码单位数量==2
			or
			TargetDebuffTime_JWZZ<=GCD	--君王之灾 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF8","猩红1") then return true end
		end

		if Text=="斩杀"
		and IsPlayerSpell(381798)	--已学 [佐迪克配方] 斩杀增伤
		and IsPlayerSpell(457068)	--已学 [觅血寻踪] 猩红增伤
		and
		(
			WR_RogueAssassination_XHFB_All()	--附近有斩杀线内的单位并且猩红风暴<=12秒
			or
			(
				TargetDebuffTime_GL>GCD	--目标割裂BUFF存在
				and
				HUCountRange10>WR_GetHaveDebuffRangeUnitCount(10,"猩红风暴",_,8)	--10码敌人数量>猩红风暴>8秒 的数量
				and
				(
					BuffTime_LHTL<=GCD	--连环屠戮 BUFF不存在
					or
					HUCountRange10==WR_GetHaveDebuffRangeUnitCount(10,"割裂")	--10码敌人数量==割裂 的数量
					or
					WR_GetHaveDebuffRangeUnitCount(10,"割裂")>5	--10码 割裂数量>5
					or
					WR_GetNoDebuffRangeUnitCount(10,"猩红风暴")>0	--10码内没有猩红风暴的单位数量>0
				)
			)
		)
		then
			if WR_ColorFrame_Show("CF8","猩红2") then return true end
		end
	end
	return false
end

--毒伤
function WR_RogueAssassination_DuShang()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("毒伤")	--技能可用
	and MaxCP	--满星
	and WR_RogueAssassination_EnergyControl(35)	--能量控制
	then
		if TargetDebuffTime_JWZZ>GCD then	--目标有君王之灾
			if WR_ColorFrame_Show("CF9","毒伤1") then return true end
		end
		
		if BuffTime_DS <= ComboPoints * 0.3 then	--毒伤BUFF 可以续时
			if WR_ColorFrame_Show("CF9","毒伤2") then return true end
		end
		
		if Energy>250 then	--能量>250
			if WR_ColorFrame_Show("CF9","毒伤3") then return true end
		end

		if HUCountRange10>=2	--AOE
		and ( TargetDebuffTime_FSFJ>GCD or not IsPlayerSpell(421975) )	--腐蚀飞溅DEBUFF存在 或者 没学腐蚀飞溅
		then
			if WR_ColorFrame_Show("CF9","毒伤5") then return true end
		end
	end
	return false
end

--死亡印记
function WR_RogueAssassination_SWYJ()
	if WRSet.QX_SWYJ	--死亡印记选项开启
	and GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and zhandoumoshi==1	--爆发 开启
	and TargetDebuffTime_GL>GCD	--割裂 DEBUFF存在
	and
	(
		(
			ComboPoints>=4	--连击点>=4
			and
			BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
		)
		or
		(
			ComboPoints>=6	--连击点>=6
			and
			BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
		)
	)
	and 
	(
		(
			HUCountRange10==1	--10码内单位数量==1
		)
		or
		(
			HUCountRange10>=2	--10码内单位数量>=2
			and HUCountRange10<=3	--10码内单位数量<=3
			and BuffTime_DS>GCD	--毒伤 BUFF存在
		)
		or
		(
			HUCountRange10>=4	--10码内单位数量>=4
			and ( TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) )	--猩红风暴DEBUFF存在 或者 没学猩红风暴
			and ( TargetDebuffTime_FSFJ>GCD or not IsPlayerSpell(421975) )	--腐蚀飞溅DEBUFF存在 或者 没学腐蚀飞溅
		)
	)
	and WR_SpellUsable("死亡印记")	--技能可用
	and WR_GetGCD("君王之灾")<=GCD+1	--君王之灾 冷却时间<=1个GCD
	then
		if WR_ColorFrame_Show("CF10","死亡印记") then return true end
	end
	return false
end
	
--君王之灾
function WR_RogueAssassination_JWZZ()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and zhandoumoshi==1	--爆发 开启
	and TargetDebuffTime_GL>GCD	--割裂 DEBUFF存在
	and
	(
		WR_RogueAssassination_EnergyControl(35)	--能量控制
		or
		(
			WR_SpellUsable("菊花茶")	--菊花茶 可用
			and BuffTime_JHC==0	--菊花茶BUFF不存在
			and
			(
				WR_GetSpellNextCharge("菊花茶")<=6	--技能充能时间<=6秒
				or
				WR_GetSpellCharges("菊花茶")>=2	--菊花茶可用次数
			)
		)
	)
	and
	(
		(
			ComboPoints>=4	--连击点>=4
			and
			BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
		)
		or
		(
			ComboPoints>=6	--连击点>=6
			and
			BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
		)
	)
	and
	(
		HUCountRange10==1	--10码内单位数量==1
		or
		(
			HUCountRange10>=2	--10码内单位数量>=2
			and ( TargetDebuffTime_XHFB>GCD or not IsPlayerSpell(121411) )	--猩红风暴DEBUFF存在 或者 没学猩红风暴
			and ( TargetDebuffTime_FSFJ>GCD or not IsPlayerSpell(421975) )	--腐蚀飞溅DEBUFF存在 或者 没学腐蚀飞溅
			and
			(
				WR_GetHaveDebuffRangeUnitCount(10,"割裂")==HUCountRange10	--割裂的数量==10码敌人数量
				or
				WR_GetHaveDebuffRangeUnitCount(40,"割裂")>=5	--5个割裂就够了
				or
				BuffTime_LHTL<=GCD	--连环屠戮BUFF不存在
				or
				WRSet.QX_KSBF	--快速爆发,不考虑其他割裂的存在情况
			)
		)
	)
	then
		if WR_GetGCD("君王之灾")<=GCD+1 then
			if WRSet.QX_SWYJ	--死亡印记选项开启
			and WR_SpellUsable("死亡印记")	--技能可用
			then
				if WR_ColorFrame_Show("CF10","死亡印记") then return true end
			end
			if HUCountRange10<=2	--10码内单位数量<=2
			and TargetDebuffTime_DR==0	--目标 毒刃DEBUFF不存在
			and IsPlayerSpell(394983)	--已学 [轻巧毒刃]2层毒刃
			and WR_GetSpellCharges("毒刃")>=1	--毒刃可用次数
			and WR_RogueAssassination_EnergyControl(35)	--能量控制
			then
				if WR_ColorFrame_Show("SF6","毒刃") then return true end
			end
		end
		if WR_SpellUsable("君王之灾") then	--技能可用
			if WRSet.QX_SP1==2 then
				if WR_ShiPin(1,WRSet.QX_SP1) then return true end	--饰品 爆发
			end
			if WRSet.QX_SP2==2 then
				if WR_ShiPin(2,WRSet.QX_SP2) then return true end	--饰品 爆发
			end

			if WR_SpellUsable("菊花茶")	--菊花茶 可用
			and BuffTime_JHC==0	--菊花茶BUFF不存在
			and
			(
				WR_GetSpellNextCharge("菊花茶")<=6	--技能充能时间<=6秒
				or
				WR_GetSpellCharges("菊花茶")>=2	--菊花茶可用次数
			)
			then
				if WR_ColorFrame_Show("CF12","菊花茶") then return true end
			end
			
			if WR_ColorFrame_Show("CF11","君王之灾") then return true end
		end
	end
	
	--等待君王
	if HUCountRange10==1	--10码内单位数量==1
	and zhandoumoshi==1	--爆发 开启
	and TargetDebuffTime_GL>GCD+WR_GetGCD("君王之灾")	--割裂 DEBUFF剩余时间君王之灾冷却时间
	and WR_GetGCD("君王之灾")<=7	--君王之灾冷却时间<=7秒
	and Energy + WR_GetGCD("君王之灾") * EPS < 250	--当前能量 + 君王之灾剩余冷却时间 * 每秒恢复能量 < 250 (目的是等待下一个君王冷却的时候，能量不会溢出)
	and
	(
		(
			ComboPoints>=4	--连击点>=4
			and
			BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
		)
		or
		(
			ComboPoints>=6	--连击点>=6
			and
			BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
		)
	)
	then
		if WR_ColorFrame_Show("Stop","等待君王") then return true end
	end
	
	return false
end

--菊花茶
function WR_RogueAssassination_JuHuaCha()
	if TargetDebuffTime_JWZZ>GCD	--君王之灾 DEBUFF存在
	and BuffTime_JHC==0	--菊花茶BUFF不存在
	and WR_GetSpellCharges("菊花茶")>=1	--技能可用次数
	and TargetDebuffTime_JWZZ<=6	--君王之灾 DEBUFF时间<=6秒
	then
		if WR_ColorFrame_Show("CF12","菊花茶") then return true end
	end
	return false
end

--毒刃
function WR_RogueAssassination_DuRen()
	if GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--单位战斗中
	and TargetDebuffTime_DR<=GCD	--目标 毒刃DEBUFF不存在
	and WR_GetSpellCharges("毒刃")>=1	--技能可用次数
	and WR_RogueAssassination_EnergyControl(35)	--能量控制
	and
	(
		HUCountRange10<=2	--10码内单位数量<=2
		or
		IsPlayerSpell(400783)	--已学 [动脉精准]	毒刃可AOE
	)
	then
		if TargetDebuffTime_JWZZ>GCD then	--君王之灾 DEBUFF存在
			if IsPlayerSpell(394983)	--已学 [轻巧毒刃]2层毒刃
			and WR_GetSpellNextCharge("毒刃")<TargetDebuffTime_JWZZ	--下一个毒刃冷却在君王之灾DEFBUFF时间内
			then
				if WR_ColorFrame_Show("SF6","毒刃1") then return true end
			end
		
			if TargetDebuffTime_JWZZ<=GCD+8	--君王之灾 DEBUFF时间<=8秒
			and
			(
				(
					ComboPoints>=4	--连击点>=4
					and
					BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
				)
				or
				(
					ComboPoints>=6	--连击点>=6
					and
					BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
				)
			)
			then
				if WR_ColorFrame_Show("SF6","毒刃2") then return true end
			end
		end
		
		if TargetDebuffTime_JWZZ<=GCD	--君王之灾 DEBUFF不存在
		and WR_GetGCD("君王之灾")>=20	--君王之灾冷却时间>=20秒
		then
			if WR_ColorFrame_Show("SF6","毒刃3") then return true end
		end
		
		if not IsPlayerSpell(385627)	--没学 [君王之灾]
		and UnitHealth("target")/UnitHealthMax("target")<=0.35	--目标血量低于35%
		then
			if WR_ColorFrame_Show("SF6","毒刃4") then return true end
		end
	end
	
	--等待毒刃
	if HUCountRange10==1	--单体
	and WR_GetSpellCharges("毒刃")==0	--技能可用次数=0
	and WR_GetGCD("毒刃")<=7	--毒刃冷却时间<=7秒
	and Energy + WR_GetGCD("毒刃") * EPS < 250	--当前能量 + 毒刃剩余冷却时间 * 每秒恢复能量 < 250 (目的是等待下一个毒刃冷却的时候，能量不会溢出)
	and TargetDebuffTime_JWZZ<=GCD	--君王之灾 DEBUFF不存在
	and WR_GetGCD("君王之灾")>=20	--君王之灾冷却时间>=20秒
	and
	(
		(
			ComboPoints>=4	--连击点>=4
			and
			BuffTime_ZHZY<=GCD	--至黑之夜 BUFF不存在
		)
		or
		(
			ComboPoints>=6	--连击点>=6
			and
			BuffTime_ZHZY>GCD	--至黑之夜 BUFF存在
		)
	)
	then
		if WR_ColorFrame_Show("Stop","等待毒刃") then return true end
	end
	
	return false
end

--嫁祸诀窍
function WR_RogueAssassination_JHJQ(Unit)
	if UnitGroupRolesAssigned(Unit)=="TANK"	--单位是坦克
	and not UnitIsDead(Unit) --单位存活
	and IsSpellInRange("嫁祸诀窍",Unit)	--单位在技能范围内
	and UnitAffectingCombat(Unit)	--单位在战斗中
	then
		if Unit=="focus" then
			if WR_ColorFrame_Show("SF5","嫁祸F") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("SF1","嫁祸P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("SF2","嫁祸P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("SF3","嫁祸P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("SF4","嫁祸P4") then return true end
		end
	end
	return false
end

--嫁祸诀窍
function WR_RogueAssassination_JHJQ_Function()
	if WRSet.QX_JH==1	--嫁祸 开启
	and WR_SpellUsable("嫁祸诀窍")	--技能可用
	and
	(
		BuffTime_QX>0 --潜行 BUFF存在
		or
		BuffTime_LHTL>0 --连环屠戮 BUFF存在
	)
	--and not PlayerCombat	--没有战斗
	--and WR_GetRangeHarmUnitCount(50,true)>1	--50码战斗敌人数量
	then
		if WR_RogueAssassination_JHJQ("focus") then return true end
		for i = 1 , 4 do
			if WR_RogueAssassination_JHJQ("party"..i) then return true end
		end
	end
	return false
end

--智能目标
function WR_RogueAssassination_ZNMB()
	if WRSet.QX_ZNMB==2	then return false end	--智能目标 禁用
	
	if not UnitExists("target")	--单位不存在
	or UnitIsDead("target")	--单位死亡
	--or not UnitCanAttack("player","target")	--单位不可攻击
	or not WR_TargetInCombat("target")	--目标不可战斗
	then
		local BestHP={}
		for i=1,4,1 do
			BestHP[i]=0	--初始化最高HP
			local TempUnit="party"..i.."target"
			if not UnitIsDead(TempUnit)	--单位存活
			--and UnitCanAttack("player",TempUnit)	--单位是敌方
			and WR_TargetInCombat(TempUnit)	--单位可攻击
			and IsSpellInRange("脚踢",TempUnit)	--单位在技能范围内
			then
				if WR_GetUnitDebuffTime(TempUnit,"腐蚀飞溅",true)>GCD then	--获得 腐蚀飞溅 Debuff信息
					BestHP[i]=BestHP[i]+100000000000
				end
				if WR_GetUnitDebuffTime(TempUnit,"割裂",true)>GCD then	--获得 割裂 Debuff信息
					BestHP[i]=BestHP[i]+10000000000
				end
				if WR_GetUnitDebuffTime(TempUnit,"夺命药膏",true)>GCD then	--获得 夺命药膏 Debuff信息
					BestHP[i]=BestHP[i]+10000000000
				end
				BestHP[i]=BestHP[i]+UnitHealth(TempUnit)
			end
		end
		local maxHP = math.max(BestHP[1], BestHP[2], BestHP[3], BestHP[4])
		if maxHP~=0 then
			if maxHP==BestHP[1] then
				if WR_ColorFrame_Show("ACN5","目标1") then return true end
			elseif maxHP==BestHP[2] then
				if WR_ColorFrame_Show("ACN6","目标2") then return true end
			elseif maxHP==BestHP[3] then
				if WR_ColorFrame_Show("ACN7","目标3") then return true end
			elseif maxHP==BestHP[4] then
				if WR_ColorFrame_Show("ACN8","目标4") then return true end
			end
		end
	end
	return false
end

--消失
function WR_RogueAssassination_XiaoShi()
	if zhandoumoshi==1	--爆发开启
	and GCD<=ShiFaSuDu	--公共冷却时间<施法速度
	and PlayerCombat	--战斗中
	and TargetClose	--目标在近战范围内
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("消失")	--技能可用
	and WRSet.QX_XS~=4	--消失没有禁用
	and
	(
		WRSet.QX_XS==1	--消失 智能
		or
		(
			WRSet.QX_XS==2	--消失 AOE
			and
			HUCountRange10>=2	--AOE
		)
		or
		(
			WRSet.QX_XS==3	--消失 首领
			and
			WR_InBossCombat()	--BOSS战
		)
		or
		WR_InTraining()	--木桩
	)
	then
		--让君王之灾的伤害受到刺客大师BUFF加成
		if IsPlayerSpell(255989)	--已学 刺客大师
		and TargetDebuffTime_JWZZ>GCD	--君王之灾 DEBUFF存在
		and BuffTime_CKDS<=GCD	--刺客大师 BUFF不存在
		then
			if HUCountRange10==1	--10码内单位数量==1
			and TargetDebuffTime_JWZZ<=12	--君王之灾 DEBUFF剩余时间<=12秒
			then
				if WR_ColorFrame_Show("SF10","消失1") then return true end
			end
			if TargetDebuffTime_JWZZ<=6 then	--君王之灾 DEBUFF剩余时间<=6秒
				if WR_ColorFrame_Show("SF10","消失2") then return true end
			end
		end
		
	end
	return false
end

--猩红之瓶
function WR_RogueAssassination_XHZP()
	if WRSet.QX_XHZP~=8 --猩红之瓶选项不是关闭的
	and WR_SpellUsable("猩红之瓶")
	and GCD<=ShiFaSuDu --公共冷却<施法速度设置
	and PlayerHP<WRSet.QX_XHZP/10 --血量比例<猩红之瓶设定值/10
	and WR_RogueAssassination_EnergyControl(10)	--能量控制
	then
		if WR_ColorFrame_Show("SF11","猩红之瓶") then return true end
	end
	return false
end

--佯攻
function WR_RogueAssassination_YG()
	if GCD<=ShiFaSuDu --公共冷却<施法速度设置
	and WRSet.QX_YG==1 --佯攻开启
	and BuffTime_QX==0	--潜行不存在
	and BuffTime_XS==0	--消失不存在
	and WR_SpellUsable("佯攻")
	and WR_GetUnitBuffTime("player","佯攻")<=GCD --佯攻BUFF不存在
	and
	(
		WR_ResistSustained()	--持续型AOE伤害存在
		or
		WR_ResistOutburstTime()<=3	--尖刺型AOE伤害来临时间
	)
	and WR_RogueAssassination_EnergyControl(25)	--能量控制
	then
		if WR_ColorFrame_Show("SF12","佯攻") then return true end
	end
	return false
end

--能量控制
function WR_RogueAssassination_EnergyControl(SpellEnergy)
	if Energy>=SpellEnergy+30	--能量控制
	or not IsPlayerSpell(381623)	--没学 菊花茶
	then
		return true
	end
	return false
end
		
--消除至黑之夜BUFF
function WR_RogueAssassination_CancelZHZY()
	--至黑BUG解决方案
	if TargetDebuffTime_SWLSBJ>GCD	--死亡猎手标记 DEBUFF存在
	and BuffTime_ZHZY>GCD	--至黑之夜 DEBUFF存在
	then
		if WR_ColorFrame_Show("ACN0","消至黑1") then return true end
	end
	
	--单目标伏击起手,取消至黑
	if HUCountRange10==1	--单目标
	and BuffTime_QX>GCD	--潜行存在
	and BuffTime_ZHZY>GCD	--至黑之夜 DEBUFF存在
	and TargetClose	--目标在近战范围
	and TargetInCombat --目标在战斗
	then
		if WR_ColorFrame_Show("ACN0","消至黑2") then return true end
	end
	
	return false
end