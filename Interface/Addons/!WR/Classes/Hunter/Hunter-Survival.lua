--生存运行库
function WR_HunterSurvival()
	if GetSpecialization()~=3 then	--如果不是生存(3)专精，则不执行该运行库
		return
	end
	

	ShiFaSuDu=0.05+WRSet.SC_SFSD*0.05
	WR_Initialize()	--初始化
	WR_Hunter_ErrorMessage() --战斗错误事件
	
	GCD=WR_GetGCD("鹰眼术")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	Latency=WR_GetMaxLatency()	--获得当前最大网络延时
	NextGCD=GCD+Latency
	
	PlayerHP = UnitHealth("player")/UnitHealthMax("player")
	FocusPower=UnitPower("player",2)	--获取当前集中值
	HunterFPS=10+GetHaste()/10	--获得每秒恢复集中值
	TargetRange=WR_GetUnitRange("target")	--获取目标距离
	
	
	if IsPlayerSpell(187707) then	--已学习 压制
		TargetCloseRange=C_Spell.IsSpellInRange("压制","target")
	elseif not IsPlayerSpell(5116) then	--没学习 震荡射击
		TargetCloseRange=C_Spell.IsSpellInRange("摔绊","target")
	else
		TargetCloseRange=TargetRange<=4
	end
	
	HUCountRange5=math.max(WR_GetRangeHarmUnitCount(5),WR_GetSpellRangeHarmUnitCount("压制"))

	
	TargetInCombat=WR_TargetInCombat("target")	--单位可攻击
	
	--HUCountRange6=WR_GetRangeHarmUnitCount(6,false)	--获得6码内的敌人数量

	
	BuffTime_LMZR , BuffCount_LMZR = WR_GetUnitBuffInfo("player","利矛之刃")
	BuffTime_TDS = WR_GetUnitBuffTime("player",459859)	--投弹手BUFF时间
	
	WR_HunterSurvival_GetTime_AURA_APPLIED()	--记录上一次法术施法时间
	
--[[
	MYSY_Damage=WR_GetSpellValue("猫鼬撕咬","造成","点")
	if WR_GetUnitBuffTime("player",459870)>NextGCD then
	--猫鼬撕咬可攻击3个单位的BUFF
		if HUCountRange5<=3 then
			MYSY_Damage=MYSY_Damage*HUCountRange5
		else
			MYSY_Damage=MYSY_Damage*3
		end
	end
	TL_Damage=WR_GetSpellValue("屠戮","造成","点")
	TL_Damage=WR_DamageMitigation(TL_Damage, HUCountRange5, 6)
--]]

	
	--优先检查
	if WR_PriorityCheck() then return end
	
	if WR_ZNJD(WRSet.SC_ZNJD) then return end	--智能焦点
	
	--施法过程 假死
	if WR_Hunter_Function_JS() then return end
	
	--施法过程 意气风发
	if WR_Hunter_Function_YQFF() then return end
	
	if WRSet.SC_SP1>=3 then
		if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.SC_SP2>=3 then
		if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 自保/协助
	end
	
	--施法过程 治疗石
	if WR_Hunter_Function_ZLS() then return end
	
	--施法过程 治疗药水
	if WR_Hunter_Function_ZLYS() then return end
	
	--施法过程 唤醒
	if WR_Hunter_Function_HX() then return end
	
	--施法过程 复活宠物
	if WR_Hunter_Function_FHCW() then return end
	
	--生命值过低 治疗宠物
	if WR_Hunter_Function_ZLCW("20%") then return end
	
	--施法过程 召唤宠物
	if WR_Hunter_Function_ZHCW() then return end
	
	--施法过程 误导
	if WR_Hunter_Function_WD() then return end
	
	--施法过程 猎人印记
	if WR_Hunter_Function_LRYJ() then return end
	
	--施法过程 压制
	if WR_HunterSurvival_Function_YZ() then return end
	
	--施法过程 宁神射击
	if WR_Hunter_Function_NSSJ() then return end
	
	--施法过程 胁迫
	if WR_Hunter_Function_XP() then return end

	--施法过程 战斗
	if WR_HunterSurvival_Function_Combat() then return end
	
	--治疗宠物
	if WR_Hunter_Function_ZLCW() then return end
	
	if WR_Function_ZNMB(4,WRSet.SC_ZNMB) then return end
	if WR_Function_ZNMB(30,WRSet.SC_ZNMB) then return end	--仅副本中
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
end

--施法过程 战斗
function WR_HunterSurvival_Function_Combat()
	if GCD>ShiFaSuDu then return false end	--GCD>施法时间
	if not TargetInCombat then return false end	--目标不可战斗

	if TargetCloseRange then	--目标在近战
		if WRSet.SC_SP1==1 then
			if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 常驻
		end
		if WRSet.SC_SP2==1 then
			if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 常驻
		end
	end

	if HUCountRange5>=3 and IsPlayerSpell(445404) then	--已学[凶恶狩猎]
		--锐矛A1
		if TargetRange<=40	--目标在40码内
		and zhandoumoshi==1
		and WR_GetGCD("协同进攻")>GCD	--协同进攻 冷却中
		and WR_SpellUsable("锐矛之锋") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CSF9","锐矛A1") then return true end
		end
	
		--杀戮A1
		if WR_SpellUsable("杀戮命令")
		and IsPlayerSpell(459922)	--已学 无情原始狂野
		and WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and BuffCount_LMZR==0	--利矛之刃 层数==0
		then
			if WR_HunterSurvival_SLML("A1") then return true end
		end

		--炸弹A1
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and
		(
			(
				BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
				and
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.3	--野火炸弹 充能时间 < 最大充能时间*30% (充能时间已经过去70%)
			)
			or
			WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
			or
			(
				zhandoumoshi==1	--爆发 开启
				and
				WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
			)
			or
			(
				IsPlayerSpell(212436)	--已学 屠戮
				and
				WR_GetGCD("屠戮")<=GCD+MaxGCD	--屠戮冷却时间<下一个技能GCD
			)
		)
		then
			if WR_ColorFrame_Show("CF1","炸弹A1") then return true end
		end
	
		--侧翼A1
		if zhandoumoshi==1	--爆发开启
		and WR_SpellUsable("侧翼打击") --技能可用 资源可用
		and TargetCloseRange --目标在近战距离
		and BuffTime_LMZR>GCD --利矛之刃BUFF存在
		then
			if WR_ColorFrame_Show("CF8","侧翼A1") then return true end
		end
		
		--屠戮A1
		if WR_SpellUsable("屠戮")
		and TargetCloseRange --目标在近战距离
		then
			if WR_ColorFrame_Show("CF3","屠戮A1") then return true end
		end
		
		--爆炸A1
		if WR_SpellUsable("爆炸射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CF2","爆炸A1") then return true end
		end
		
		--协同A1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("协同进攻") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and
		(
			not IsPlayerSpell(389880)	--没学 投弹手
			or
			WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
		)
		then
			if WRSet.SC_SP1==2 then
				if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 爆发
			end
			if WRSet.SC_SP2==2 then
				if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 爆发
			end
			if WR_ColorFrame_Show("CF9","协同A1") then return true end
		end
		
		--雄鹰A1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF 存在
		then
			if WR_ColorFrame_Show("CF6","雄鹰A1") then return true end
		end
		
		--夺命A1
		if WR_SpellUsable("夺命射击")
		and TargetRange<=40 --目标距离
		and WR_GetUnitBuffTime("player","夺命打击")>GCD	--夺命打击 BUFF存在
		then
			if WR_ColorFrame_Show("CN8","夺命A1") then return true end
		end
		
		--杀戮A1
		if WR_SpellUsable("杀戮命令")	--技能可用
		and FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
		then
			if WR_HunterSurvival_SLML("A1") then return true end
		end
		
		--炸弹A2
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		then
			if WR_ColorFrame_Show("CF1","炸弹A2") then return true end
		end

		--夺命A2
		if WR_SpellUsable("夺命射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CN8","夺命A2") then return true end
		end

		--杀戮A2
		if WR_SpellUsable("杀戮命令") then	--技能可用
			if WR_HunterSurvival_SLML("A2") then return true end
		end

		--撕咬A1
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		then
			if WR_ColorFrame_Show("CF4","撕咬A1") then return true end
		end
	elseif HUCountRange5<=2 and IsPlayerSpell(445404) then	--已学[凶恶狩猎]
		--撕咬S1
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		and WR_GetUnitBuffTime("player","族群之嚎")>GCD	--族群之嚎 BUFF存在
		and WR_GetUnitBuffTime("pet","族群协同")>GCD	--族群协同 BUFF存在
		and WR_GetUnitBuffTime("player","族群之嚎")<=GCD+MaxGCD	--族群之嚎 BUFF时间<=下一个技能结束时间
		then
			if WR_ColorFrame_Show("CF4","撕咬S1") then return true end
		end
		
		--杀戮S1
		if WR_SpellUsable("杀戮命令")
		and IsPlayerSpell(459922)	--已学 无情原始狂野
		and WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and BuffCount_LMZR==0	--利矛之刃 层数==0
		then
			if WR_HunterSurvival_SLML("S1") then return true end
		end
		
		--屠戮S1
		if WR_SpellUsable("屠戮")
		and TargetCloseRange --目标在近战距离
		and WR_GetUnitBuffTime("player","四野遍狩")>GCD	--四野遍狩 BUFF存在
		and WR_GetUnitBuffTime("player","四野遍狩")<=GCD+MaxGCD	--四野遍狩 BUFF时间<=下一个技能结束时间
		then
			if WR_ColorFrame_Show("CF3","屠戮S1") then return true end
		end

		--锐矛S1
		if TargetRange<=40	--目标在40码内
		and zhandoumoshi==1
		and WR_GetGCD("协同进攻")>GCD	--协同进攻 冷却中
		and WR_SpellUsable("锐矛之锋") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CSF9","锐矛S1") then return true end
		end
		
		--撕咬S2
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		and WR_GetUnitDebuffTime("target","毒蛇钉刺",true)==0	--毒蛇钉刺 DEBUFF不存在
		and WR_GetUnitDeathTime("target")>12	--目标存活时间>12秒
		then
			if WR_ColorFrame_Show("CF4","撕咬S2") then return true end
		end
		
		--屠戮S2
		if WR_SpellUsable("屠戮")
		and TargetCloseRange --目标在近战距离
		then
			if WR_ColorFrame_Show("CF3","屠戮S2") then return true end
		end
		
		--侧翼S1
		if zhandoumoshi==1	--爆发开启
		and WR_SpellUsable("侧翼打击") --技能可用 资源可用
		and TargetCloseRange --目标在近战距离
		and BuffTime_LMZR>GCD --利矛之刃BUFF存在
		then
			if WR_ColorFrame_Show("CF8","侧翼S1") then return true end
		end
		
		--夺命S1
		if WR_SpellUsable("夺命射击")
		and TargetRange<=40 --目标距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		then
			if WR_ColorFrame_Show("CN8","夺命S1") then return true end
		end
		
		--炸弹S1
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and
		(
			(
				BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
				and
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.6	--野火炸弹 充能时间 < 最大充能时间*60% (充能时间已经过去40%)
			)
			or
			WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
			or
			(
				zhandoumoshi==1	--爆发 开启
				and
				WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
				and
				IsPlayerSpell(389880)	--已学 投弹手
			)
		)
		then
			if WR_ColorFrame_Show("CF1","炸弹S1") then return true end
		end
		
		--爆炸S1
		if WR_SpellUsable("爆炸射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CF2","爆炸S1") then return true end
		end
		
		--协同S1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("协同进攻") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and
		(
			not IsPlayerSpell(389880)	--没学 投弹手
			or
			WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
		)
		then
			if WRSet.SC_SP1==2 then
				if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 爆发
			end
			if WRSet.SC_SP2==2 then
				if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 爆发
			end
			if WR_ColorFrame_Show("CF9","协同S1") then return true end
		end
		
		--雄鹰S1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF 存在
		then
			if WR_ColorFrame_Show("CF6","雄鹰S1") then return true end
		end
		
		--撕咬S3
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		and WR_GetUnitBuffTime("player","狂暴突袭")>GCD	--狂暴突袭 BUFF存在
		then
			if WR_ColorFrame_Show("CF4","撕咬S3") then return true end
		end
		
		--杀戮S2
		if WR_SpellUsable("杀戮命令")
		and
		(
			FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
			and
			(
				(
					not IsPlayerSpell(459922)	--没学 无情原始狂野
					or
					WR_GetUnitBuffTime("player","协同进攻")<=GCD	--协同进攻 BUFF不存在
				)
				or
				(
					IsPlayerSpell(459922)	--已学 无情原始狂野
					and
					WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
					and
					BuffCount_LMZR==0	--利矛之刃 层数==0
				)
				or
				FocusPower<30	--当前集中值<30
			)
		)
		then
			if WR_HunterSurvival_SLML("S2") then return true end
		end
		
		--炸弹S2
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		then
			if WR_ColorFrame_Show("CF1","炸弹S2") then return true end
		end

		--撕咬S4
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		then
			if WR_ColorFrame_Show("CF4","撕咬S4") then return true end
		end
		
	elseif HUCountRange5>=3 then
		--杀戮A1
		if WR_SpellUsable("杀戮命令")
		and IsPlayerSpell(459922)	--已学 无情原始狂野
		and WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and BuffCount_LMZR==0	--利矛之刃 层数==0
		then
			if WR_HunterSurvival_SLML("A1") then return true end
		end
	
		--炸弹A1
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and
		(
			(
				BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
				and
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.3	--野火炸弹 充能时间 < 最大充能时间*30% (充能时间已经过去70%)
			)
			or
			WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
			or
			(
				zhandoumoshi==1	--爆发 开启
				and
				IsPlayerSpell(389880)	--已学 投弹手
				and
				WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
			)
			or
			(
				IsPlayerSpell(212436)	--已学 屠戮
				and
				WR_GetGCD("屠戮")<=GCD+MaxGCD	--屠戮冷却时间<下一个技能GCD
			)
		)
		then
			if WR_ColorFrame_Show("CF1","炸弹A1") then return true end
		end
	
		--屠戮A1
		if WR_SpellUsable("屠戮")
		and TargetCloseRange --目标在近战距离
		then
			if WR_ColorFrame_Show("CF3","屠戮A1") then return true end
		end
		
		--爆炸A1
		if WR_SpellUsable("爆炸射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CF2","爆炸A1") then return true end
		end
		
		--协同A1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("协同进攻") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and
		(
			not IsPlayerSpell(389880)	--没学 投弹手
			or
			WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
		)
		then
			if WRSet.SC_SP1==2 then
				if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 爆发
			end
			if WRSet.SC_SP2==2 then
				if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 爆发
			end
			if WR_ColorFrame_Show("CF9","协同A1") then return true end
		end
		
		--雄鹰A1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF 存在
		then
			if WR_ColorFrame_Show("CF6","雄鹰A1") then return true end
		end
		
		--侧翼A1
		if zhandoumoshi==1	--爆发开启
		and WR_SpellUsable("侧翼打击") --技能可用 资源可用
		and TargetCloseRange --目标在近战距离
		and BuffTime_LMZR>GCD --利矛之刃BUFF存在
		then
			if WR_ColorFrame_Show("CF8","侧翼A1") then return true end
		end
	
		--夺命A1
		if WR_SpellUsable("夺命射击")
		and TargetRange<=40 --目标距离
		and WR_GetUnitBuffTime("player","夺命打击")>GCD	--夺命打击 BUFF存在
		and IsPlayerSpell(459920)	--已学 干掉他们
		then
			if WR_ColorFrame_Show("CN8","夺命A1") then return true end
		end
	
		--杀戮A1
		if WR_SpellUsable("杀戮命令")	--技能可用
		and FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
		then
			if WR_HunterSurvival_SLML("A1") then return true end
		end
	
		--炸弹A2
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		then
			if WR_ColorFrame_Show("CF1","炸弹A2") then return true end
		end
	
		--杀戮A2
		if WR_SpellUsable("杀戮命令") then	--技能可用
			if WR_HunterSurvival_SLML("A2") then return true end
		end

		--撕咬A1
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		then
			if WR_ColorFrame_Show("CF4","撕咬A1") then return true end
		end
	elseif HUCountRange5<=2 then
		--杀戮S1
		if WR_SpellUsable("杀戮命令")
		and IsPlayerSpell(459922)	--已学 无情原始狂野
		and WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and BuffCount_LMZR==0	--利矛之刃 层数==0
		then
			if WR_HunterSurvival_SLML("S1") then return true end
		end
	
		--锐矛S1
		if TargetRange<=40	--目标在40码内
		and zhandoumoshi==1
		and WR_GetGCD("协同进攻")>GCD	--协同进攻 冷却中
		and WR_SpellUsable("锐矛之锋") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CSF9","锐矛S1") then return true end
		end
	
		--撕咬S1
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		and WR_GetUnitDebuffTime("target","毒蛇钉刺",true)==0	--毒蛇钉刺 DEBUFF不存在
		and WR_GetUnitDeathTime("target")>12	--目标存活时间>12秒
		then
			if WR_ColorFrame_Show("CF4","撕咬S1") then return true end
		end
	
		--侧翼S1
		if zhandoumoshi==1	--爆发开启
		and WR_SpellUsable("侧翼打击") --技能可用 资源可用
		and TargetCloseRange --目标在近战距离
		and BuffTime_LMZR>GCD --利矛之刃BUFF存在
		then
			if WR_ColorFrame_Show("CF8","侧翼S1") then return true end
		end
	
		--炸弹S1
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and
		(
			(
				BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
				and
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.3	--野火炸弹 充能时间 < 最大充能时间*30% (充能时间已经过去70%)
			)
			or
			WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
			or
			(
				zhandoumoshi==1	--爆发 开启
				and
				IsPlayerSpell(389880)	--已学 投弹手
				and
				WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
			)
		)
		then
			if WR_ColorFrame_Show("CF1","炸弹S1") then return true end
		end
	
		--屠戮S1
		if WR_SpellUsable("屠戮")
		and TargetCloseRange --目标在近战距离
		then
			if WR_ColorFrame_Show("CF3","屠戮S1") then return true end
		end
	
		--协同S1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("协同进攻") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and
		(
			not IsPlayerSpell(389880)	--没学 投弹手
			or
			WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
		)
		then
			if WRSet.SC_SP1==2 then
				if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 爆发
			end
			if WRSet.SC_SP2==2 then
				if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 爆发
			end
			if WR_ColorFrame_Show("CF9","协同S1") then return true end
		end
	
		--爆炸S1
		if WR_SpellUsable("爆炸射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CF2","爆炸S1") then return true end
		end
	
		--雄鹰S1
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
		and TargetCloseRange	--目标在近战距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF 存在
		then
			if WR_ColorFrame_Show("CF6","雄鹰S1") then return true end
		end
	
		--夺命S1
		if WR_SpellUsable("夺命射击")
		and TargetRange<=40 --目标距离
		then
			if WR_ColorFrame_Show("CN8","夺命S1") then return true end
		end
	
		--杀戮S2
		if WR_SpellUsable("杀戮命令")
		and BuffCount_LMZR==0	--利矛之刃 层数==0
		and IsPlayerSpell(269751)	--已学 侧翼打击
		and WR_GetGCD("侧翼打击")<GCD+MaxGCD	--侧翼打击<=下一个技能冷却时间
		then
			if WR_HunterSurvival_SLML("S2") then return true end
		end
	
		--杀戮S3
		if WR_SpellUsable("杀戮命令")
		and FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
		and
		(
			(
				not IsPlayerSpell(459922)	--没学 无情原始狂野
				or
				WR_GetUnitBuffTime("player","协同进攻")<=GCD	--协同进攻 BUFF不存在
			)
			or
			(
				IsPlayerSpell(459922)	--已学 无情原始狂野
				and
				WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
				and
				(
					BuffCount_LMZR<2	--利矛之刃 层数<2
					or
					FocusPower<30	--当前集中值<30
				)
			)
		)
		then
			if WR_HunterSurvival_SLML("S3") then return true end
		end

		--炸弹S2
		if WR_SpellUsable("野火炸弹") --技能可用 资源可用
		and TargetRange<=40 --目标距离
		and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		then
			if WR_ColorFrame_Show("CF1","炸弹S2") then return true end
		end
	
		--撕咬S2
		if 
		(
			WR_SpellUsable("猫鼬撕咬") --技能可用 资源可用
			or
			WR_SpellUsable("猛禽一击") --技能可用 资源可用
		)
		and
		(
			TargetCloseRange	--目标在近战距离
			or
			(
				TargetRange<=40	--目标在40码内
				and
				WR_GetUnitBuffTime("player","雄鹰守护")>GCD	--雄鹰守护 BUFF存在
			)
		)
		then
			if WR_ColorFrame_Show("CF4","撕咬S2") then return true end
		end
	end
end

--获取光环触发时间
function WR_HunterSurvival_GetTime_AURA_APPLIED()
	if WR_HunterSurvival_GetTime_AURA_APPLIED_Open~=true then
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		frame:SetScript("OnEvent", function(self, event)
			local _, subEvent, _, _, sourceName, _, _, _, destName, _, _, spellId = CombatLogGetCurrentEventInfo()
			if subEvent == "SPELL_AURA_APPLIED" and sourceName == UnitName("player") then
				if spellId == 450884 then
					WR_AURA_APPLIED_TIME_450884=GetTime()
				end
			end
		end)
	end
	WR_HunterSurvival_GetTime_AURA_APPLIED_Open=true
end

--锐矛之锋
function WR_HunterSurvival_RMZF()
	if GCD<=ShiFaSuDu
	and TargetRange<=40	--目标在40码内
	and zhandoumoshi==1
	and WR_GetGCD("协同进攻")>GCD	--协同进攻 冷却中
	and WR_SpellUsable("锐矛之锋") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CSF9","锐矛之锋") then return true end
	end
	return false
end

--施法过程 压制
function WR_HunterSurvival_YZ(Unit)
	if C_Spell.IsSpellInRange("压制",Unit)	--当前技能范围内
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_HunterSurvival_YZ_Important)	--指定"单位"施法剩余时间小于设定
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF5","压制T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN0","压制M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF8","压制F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF8","压制P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF9","压制P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("SF10","压制P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("SF11","压制P4T") then return true end
		end
	end
end

--施法过程 压制
function WR_HunterSurvival_Function_YZ()
	if not WR_SpellUsable("压制") then return false end	--压制 不可使用
	
	if WRSet.SC_YZ<=4 then
		WR_HunterSurvival_YZ_Important = false
	else
		WR_HunterSurvival_YZ_Important = true
	end
	
	if WRSet.SC_YZ==9 then	--禁用
		return false
	elseif (WRSet.SC_YZ==1 or WRSet.SC_YZ==5)	--智能
	or
	(
		(WRSet.SC_YZ==4 or WRSet.SC_YZ==8)	--焦点
		and
		(
			not UnitExists("focus")	--焦点不存在
			or
			UnitIsDead("focus")	--焦点死亡
			or
			not UnitCanAttack("player","focus")	--焦点不可攻击
		)
	)
	then
		if WR_HunterSurvival_YZ("focus") then return true end	--焦点
		if WR_HunterSurvival_YZ("target") then return true end	--目标
		if WR_HunterSurvival_YZ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_HunterSurvival_YZ("party"..i.."target") then return true end
		end
	elseif (WRSet.SC_YZ==2 or WRSet.SC_YZ==6) then	--目标
		if WR_HunterSurvival_YZ("target") then return true end
	elseif (WRSet.SC_YZ==3 or WRSet.SC_YZ==7) then	--指向
		if WR_HunterSurvival_YZ("mouseover") then return true end
	elseif (WRSet.SC_YZ==4 or WRSet.SC_YZ==8) then	--焦点
		if WR_HunterSurvival_YZ("focus") then return true end
	end
	
	return false
end


--获得最佳单位 爆炸射击
function WR_HunterSurvival_GetBeatUnit_BZSJ()
	local BestS=0
	local BeatUnit=""
	
	if WR_GetUnitRange("target")<=5	--AOE范围内
	and WR_TargetInCombat("target")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("target","爆炸射击",true)
		if TempS==8 then
			return "target"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if WR_GetUnitRange("mouseover")<=5	--AOE范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("mouseover","爆炸射击",true)
		if TempS==8 then
			return "mouseover"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if WR_GetUnitRange(TempUnit)<=5	--AOE范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		then
			local TempS = 8 - WR_GetUnitDebuffTime(TempUnit,"爆炸射击",true)
			if TempS==8 then
				return TempUnit
			elseif TempS > BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	if BeatUnit=="" then return "target" end
	return BeatUnit
end

--施法过程 爆炸射击
function WR_HunterSurvival_BZSJ(Text)
	local BeatUnit_BZSJ = WR_HunterSurvival_GetBeatUnit_BZSJ()	--获得最佳爆炸射击单位
	
	if WR_GetUnitRange(BeatUnit_BZSJ)<=40	--单位距离
	and WR_TargetInCombat(BeatUnit_BZSJ)	--单位战斗中
	and WR_GetUnitDebuffTime("BeatUnit_BZSJ","爆炸射击",true)<=GCD	--单位爆炸射击不存在
	then
		if BeatUnit_BZSJ=="target" then
			if WR_ColorFrame_Show("CF2",(Text or "") .. "爆炸T") then return true end
		elseif BeatUnit_BZSJ=="mouseover" then
			if WR_ColorFrame_Show("ASF7",(Text or "") .. "爆炸M") then return true end
		elseif BeatUnit_BZSJ=="party1target" then
			if WR_ColorFrame_Show("ASF8",(Text or "") .. "爆炸P1T") then return true end
		elseif BeatUnit_BZSJ=="party2target" then
			if WR_ColorFrame_Show("ASF9",(Text or "") .. "爆炸P2T") then return true end
		elseif BeatUnit_BZSJ=="party3target" then
			if WR_ColorFrame_Show("ASF11",(Text or "") .. "爆炸P3T") then return true end
		elseif BeatUnit_BZSJ=="party4target" then
			if WR_ColorFrame_Show("ASF12",(Text or "") .. "爆炸P4T") then return true end
		end
	end
	return false
end


--施法过程 爆炸射击
function WR_HunterSurvival_Function_BZSJ(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("爆炸射击") then return false end	--技能不可用

	if
	Text==nil
	or
	(
		Text=="投弹手"
		and
		BuffTime_TDS>NextGCD	--投弹手 BUFF存在 (协同进攻结束给的免费爆炸射击的BUFF)
	)
	or
	(
		Text=="AOE"
		and
		zhandoumoshi==1	--爆发 开启
		and
		(
			(
				(
					BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
					or
					BuffTime_TDS>NextGCD	--投弹手 BUFF存在 (协同进攻结束给的免费爆炸射击的BUFF)
				)
				and
				(
					(
						WR_GetGCD("协同进攻")>20	--协同进攻 冷却时间>20
						and
						(
							WR_GetGCD("协同进攻")<80	--协同进攻 冷却时间<80
							or
							WR_GetUnitBuffTime("player","协同进攻")>NextGCD	--协同进攻 BUFF存在
						)
					)
					or
					(
						WR_GetGCD("协同进攻")>12	--协同进攻 冷却时间>12
						and
						WR_GetGCD("协同进攻")<20	--协同进攻 冷却时间<20
					)
				)
			)
			or
			WR_GetGCD("协同进攻")<2	--协同进攻 冷却时间<2
		)
	)
	or
	(
		Text=="单体"
		and
		zhandoumoshi==1	--爆发 开启
		and
		(
			(
				IsPlayerSpell(360966)	--已学 锐矛之锋
				and
				(
					(
						not IsPlayerSpell(459875)	--没学 共生激素
						and
						(
							BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
							or
							BuffTime_TDS>NextGCD	--投弹手 BUFF存在 (协同进攻结束给的免费爆炸射击的BUFF)
						)
						and
						WR_GetGCD("锐矛之锋")>20	--协同进攻 冷却时间>20
					)
					or
					WR_GetGCD("锐矛之锋")<2	--协同进攻 冷却时间<2
				)
			)
			or
			(
				(
					(
						IsPlayerSpell(459875)	--已学 共生激素
						or
						not IsPlayerSpell(360966)	--没学 锐矛之锋
					)
					and
					(
						BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
						or
						BuffTime_TDS>NextGCD	--投弹手 BUFF存在 (协同进攻结束给的免费爆炸射击的BUFF)
					)
					and
					WR_GetGCD("协同进攻")>20	--协同进攻 冷却时间>20
				)
				or
				WR_GetGCD("协同进攻")<2	--协同进攻 冷却时间<2
			)
		)
	)
	then
		if WR_HunterSurvival_BZSJ(Text) then return true end
	end

	return false
end

--施法过程 野火炸弹
function WR_HunterSurvival_Function_YHZD(Text)
	if GCD>ShiFaSuDu then return false end

	if WR_SpellUsable("野火炸弹") --技能可用 资源可用
	and TargetRange<=40 --目标距离
	and TargetInCombat --目标战斗中
	then
		if Text==nil
		or
		(
			Text=="满层"
			and
			(
				(
					BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
					and
					WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.3	--野火炸弹 充能时间 < 最大充能时间*30% (充能时间已经过去70%)
				)
				or
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
				or
				(
					zhandoumoshi==1	--爆发 开启
					and
					WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
				)
			)
		)
		or
		(
			Text=="AOE"
			and
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		)
		or
		(
			Text=="单满"
			and
			(
				(
					BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
					and
					WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.3	--野火炸弹 充能时间 < 最大充能时间*30% (充能时间已经过去70%)
				)
				or
				WR_GetSpellNextCharge("野火炸弹")<C_Spell.GetSpellCharges(259495).cooldownDuration*0.1	--野火炸弹 充能时间 < 最大充能时间*10% (充能时间已经过去90%)
				or
				(
					zhandoumoshi==1	--爆发 开启
					and
					WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--技能冷却.协同进攻.剩余时间<2*gcd
				)
				or
				(
					IsPlayerSpell(450385)	--已学 皎月风暴
					and
					(
						WR_AURA_APPLIED_TIME_450884==nil	--皎月风暴 没有触发过
						or
						GetTime()-WR_AURA_APPLIED_TIME_450884>15	--皎月风暴 触发时间过去15秒 可以再次触发
					)
				)
			)
		)
		or
		(
			Text=="单体"
			and
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
			and
			WR_AURA_APPLIED_TIME_450884~=nil
			and
			GetTime()-WR_AURA_APPLIED_TIME_450884>13.5
			--皎月风暴 冷却时间>13.5秒
		)
		then
			if WR_ColorFrame_Show("CF1",(Text or "") .. "炸弹") then return true end
		end
	end
	return false
end

--施法过程 雄鹰之怒
function WR_HunterSurvival_Function_XYZN()
	if GCD>ShiFaSuDu then return false end
	if zhandoumoshi~=1 then return false end
	
	if WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
	and TargetCloseRange	--目标在近战距离
	and TargetInCombat --目标战斗中
	and BuffTime_LMZR>GCD	--利矛之刃 BUFF 存在
	then
		if WR_ColorFrame_Show("CF6","雄鹰之怒") then return true end
	end
	return false
end

--施法过程 协同进攻
function WR_HunterSurvival_Function_XTJG()
	if GCD>ShiFaSuDu then return false end
	if zhandoumoshi~=1 then return false end

	if WR_SpellUsable("协同进攻") --技能可用 资源可用
	and TargetInCombat --目标战斗中
	and TargetCloseRange	--目标在近战距离
	and
	(
		not IsPlayerSpell(389880)	--没学 投弹手
		or
		WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
	)
	then
		if WRSet.SC_SP1==2 then
			if WR_ShiPin(1,WRSet.SC_SP1) then return true end	--饰品 爆发
		end
		if WRSet.SC_SP2==2 then
			if WR_ShiPin(2,WRSet.SC_SP2) then return true end	--饰品 爆发
		end
		
		if WR_ColorFrame_Show("CF9","协同进攻") then return true end
	end
	return false
end

--施法过程 侧翼打击
function WR_HunterSurvival_Function_CYDJ()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1	--爆发开启
	and WR_SpellUsable("侧翼打击") --技能可用 资源可用
	and TargetCloseRange --目标在近战距离
	and TargetInCombat --目标战斗中
	and BuffTime_LMZR>GCD --利矛之刃BUFF存在
	then
		if WR_ColorFrame_Show("CF8","侧翼打击") then return true end
	end
	return false
end

--施法过程 屠戮
function WR_HunterSurvival_Function_TL(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("屠戮") then return false end	--技能不可用
	
	if Text==nil
	or
	(
		Text=="2敌"
		and
		HUCountRange5==2	--5码内敌人数量
		and
		WR_GetUnitBuffTime("player",459870)<=GCD	--无情重击 BUFF不存在
	)
	then
	
		if WR_ColorFrame_Show("CF3",(Text or "") .. "屠戮") then return true end
	end
	return false
end

--施法过程 猫鼬撕咬 猛禽一击
function WR_HunterSurvival_Function_MYSY(Text)
	if GCD>ShiFaSuDu then return false end

	if ( WR_SpellUsable("猫鼬撕咬") or WR_SpellUsable("猛禽一击") ) --技能可用 资源可用
	and TargetInCombat --目标战斗中
	and TargetCloseRange or (TargetRange<=40 and WR_GetUnitBuffTime("player","雄鹰守护")>GCD)
	then
		if
		Text==nil
		or
		(
			Text=="重击"
			and
			WR_GetUnitBuffTime("player",459870)>GCD	--无情重击 BUFF存在 猫鼬撕咬可攻击3个单位的BUFF
		)
		or
		(
			Text=="钉刺"
			and
			WR_GetUnitDebuffTime("target","毒蛇钉刺",true)==0	--毒蛇钉刺 DEBUFF不存在
			and
			WR_GetUnitDeathTime("target")>12+WR_GetUnitDebuffTime("target","毒蛇钉刺",true)	--目标存活时间>12+当前DEBUFF剩余时间
		)
		or
		Text=="单体"
		then
			if WR_ColorFrame_Show("CF4",(Text or "") .. "撕咬") then return true end
		end
	end
	return false
end

--获得最佳单位 杀戮命令
function WR_HunterSurvival_GetBeatUnit_SLML()
	if not IsPlayerSpell(260248) then return "target" end	--没有学习 觅血者
	
	local BestS=0
	local BeatUnit=""
	
	if WR_GetUnitRange("target")<=5	--AOE范围内
	and WR_TargetInCombat("target")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("target","杀戮命令")
		if TempS==8 then
			return "target"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if WR_GetUnitRange("mouseover")<=5	--AOE范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("mouseover","杀戮命令")
		if TempS==8 then
			return "mouseover"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if WR_GetUnitRange(TempUnit)<=5	--AOE范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		then
			local TempS = 8 - WR_GetUnitDebuffTime(TempUnit,"杀戮命令")
			if TempS==8 then
				return TempUnit
			elseif TempS > BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	if BeatUnit=="" then return "target" end
	return BeatUnit
end

--施法过程 杀戮命令
function WR_HunterSurvival_SLML(Text)
	local BeatUnit_SLML = WR_HunterSurvival_GetBeatUnit_SLML()	--获得最佳杀戮命令单位
	
	if WR_GetUnitRange(BeatUnit_SLML)<=50	--单位距离
	and WR_TargetInCombat(BeatUnit_SLML)	--单位战斗中
	then
		if BeatUnit_SLML=="target" then
			if WR_ColorFrame_Show("CF7",(Text or "") .. "杀戮T") then return true end
		elseif BeatUnit_SLML=="mouseover" then
			if WR_ColorFrame_Show("ASF6",(Text or "") .. "杀戮M") then return true end
		elseif BeatUnit_SLML=="party1target" then
			if WR_ColorFrame_Show("ASF1",(Text or "") .. "杀戮P1T") then return true end
		elseif BeatUnit_SLML=="party2target" then
			if WR_ColorFrame_Show("ASF2",(Text or "") .. "杀戮P2T") then return true end
		elseif BeatUnit_SLML=="party3target" then
			if WR_ColorFrame_Show("ASF3",(Text or "") .. "杀戮P3T") then return true end
		elseif BeatUnit_SLML=="party4target" then
			if WR_ColorFrame_Show("ASF5",(Text or "") .. "杀戮P4T") then return true end
		end
	end
	return false
end

--施法过程 杀戮命令
function WR_HunterSurvival_Function_SLML(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("杀戮命令") then return false end --技能不可用

	if
	Text==nil
	or
	(
		Text=="无情"
		and
		IsPlayerSpell(459922)	--已学 无情原始狂野
		and
		WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and
		BuffCount_LMZR==0	--利矛之刃 层数==0
	)
	or
	(
		Text=="AOE"
		and
		FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
	)
	or
	(
		Text=="单体"
		and
		FocusPower+HunterFPS*(GCD+MaxGCD)<100	--当前集中值+每秒回能*一个技能GCD的时间<100
		and
		(
			not IsPlayerSpell(459922)	--没学 无情原始狂野
			or
			WR_GetUnitBuffTime("player","协同进攻")<=GCD	--协同进攻 BUFF不存在
			or
			(
				IsPlayerSpell(459922)	--已学 无情原始狂野
				and
				WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
				and
				BuffCount_LMZR<=1	--利矛之刃 层数<=1
			)
		)
	)
	then
		if WR_HunterSurvival_SLML(Text) then return true end
	end

	return false
end