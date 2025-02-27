--生存运行库
function WR_HunterSurvival()
	if GetSpecialization()~=3 then	--如果不是生存(3)专精，则不执行该运行库
		return
	end
	

	ShiFaSuDu=0.2	--初始化施法速度
	WR_Initialize()	--初始化
	WR_Hunter_ErrorMessage() --战斗错误事件
	
	GCD=WR_GetGCD("鹰眼术")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	Latency=WR_GetMaxLatency()	--获得当前最大网络延时
	NextGCD=GCD+Latency
	
	PlayerHP=WR_GetUnitHP("player")	--获得自身真实带护盾的血量比例
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
	--BuffTime_TDS = WR_GetUnitBuffTime("player",459859)	--投弹手BUFF时间
	
	
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

	if HUCountRange5>=2 then
		if WR_HunterSurvival_Function_YHZD("满层") then return true end	--野火炸弹 满层
		
		if WR_HunterSurvival_Function_XTJG() then return true end	--协同进攻
		
		if WR_HunterSurvival_Function_SLML("0层") then return true end	--杀戮命令 0层利矛
		
		if WR_HunterSurvival_RMZF() then return true end	--锐矛之锋
		
		if WR_HunterSurvival_Function_XYZN() then return true end	--雄鹰之怒
		
		if WR_HunterSurvival_Function_CYDJ() then return true end	--侧翼打击
		
		if WR_HunterSurvival_Function_YHZD("将满") then return true end	--野火炸弹 即将满层
		
		if WR_HunterSurvival_Function_BZSJ("利矛") then return true end	--爆炸射击
		
		if WR_HunterSurvival_Function_YHZD("利矛") then return true end	--野火炸弹
		
		if WR_Hunter_Function_DMSJ("利矛") then return true end	--夺命射击
		
		if WR_HunterSurvival_Function_SLML("利矛") then return true end	--杀戮命令 刷新利矛
		
		if WR_HunterSurvival_Function_MYSY("重击") then return true end	--猫鼬撕咬 猛禽一击
		
		if WR_HunterSurvival_Function_TL() then return true end	--屠戮
		
		if WR_Hunter_Function_DMSJ() then return true end	--夺命射击
		
		if WR_HunterSurvival_Function_MYSY() then return true end	--猫鼬撕咬 猛禽一击
	else
		if WR_HunterSurvival_Function_YHZD("满层") then return true end	--野火炸弹 满层
		
		if WR_HunterSurvival_Function_XTJG() then return true end	--协同进攻
		
		if WR_HunterSurvival_Function_SLML("0层") then return true end	--杀戮命令 0层利矛
		
		if WR_HunterSurvival_RMZF() then return true end	--锐矛之锋
		
		if WR_HunterSurvival_Function_XYZN() then return true end	--雄鹰之怒
		
		if WR_HunterSurvival_Function_CYDJ() then return true end	--侧翼打击
		
		if WR_Hunter_Function_DMSJ("利矛") then return true end	--夺命射击
		
		if WR_HunterSurvival_Function_BZSJ("利矛") then return true end	--爆炸射击
		
		if WR_HunterSurvival_Function_YHZD("将满") then return true end	--野火炸弹 即将满层
		
		if WR_HunterSurvival_Function_YHZD("利矛") then return true end	--野火炸弹
		
		if WR_HunterSurvival_Function_SLML("利矛") then return true end	--杀戮命令 刷新利矛
		
		if WR_HunterSurvival_Function_MYSY() then return true end	--猫鼬撕咬 猛禽一击
	end
end


--锐矛之锋
function WR_HunterSurvival_RMZF()
	if GCD<=ShiFaSuDu
	and TargetRange<=40	--目标在40码内
	and zhandoumoshi==1
	and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
	and WR_SpellUsable("锐矛之锋") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CSF9","锐矛之锋") then return true end
	end
	return false
end

--施法过程 压制
function WR_HunterSurvival_YZ(Unit)
	if C_Spell.IsSpellInRange("压制",Unit)	--当前技能范围内
	and WR_GetCastInterruptible(Unit,InterruptTime)	--指定"单位"施法剩余时间小于设定
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
	
	if WRSet.SC_YZ==5 then	--禁用
		return false
	elseif WRSet.SC_YZ==1	--智能
	or
	(
		WRSet.SC_YZ==4	--焦点
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
	elseif WRSet.SC_YZ==2 then	--目标
		if WR_HunterSurvival_YZ("target") then return true end
	elseif WRSet.SC_YZ==3 then	--指向
		if WR_HunterSurvival_YZ("mouseover") then return true end
	elseif WRSet.SC_YZ==4 then	--焦点
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
	if WR_GetUnitDebuffTime(BeatUnit_BZSJ,"爆炸射击",true)>GCD then return false end	--单位身上有爆炸射击BUFF
	
	if WR_GetUnitRange(BeatUnit_BZSJ)<=40	--单位距离
	and WR_TargetInCombat(BeatUnit_BZSJ)	--单位战斗中
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
		Text=="利矛"
		and
		zhandoumoshi==1	--爆发 开启
		and
		(
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
			or
			WR_GetUnitBuffTime("player",459859)>NextGCD	--投弹手 BUFF存在 (协同进攻结束给的免费爆炸射击的BUFF)
		)
	)
	then
		if WR_HunterSurvival_BZSJ(Text) then return true end
	end

	return false
end

--施法过程 野火炸弹
function WR_HunterSurvival_Function_YHZD(Text)
	if GCD<=ShiFaSuDu
	and TargetRange<=40 --目标距离
	and TargetInCombat --目标战斗中
	and WR_SpellUsable("野火炸弹") --技能可用 资源可用
	then
		if Text==nil
		or
		(
			Text=="满层"
			and
			(
				WR_GetSpellNextCharge("野火炸弹")<GCD+MaxGCD	--野火炸弹充能时间<当前GCD+最大GCD
				or
				(
					zhandoumoshi==1	--爆发 开启
					and
					WR_GetGCD("协同进攻")<GCD+MaxGCD*2	--协同进攻 冷却时间<当前GCD+最大GCD*2
				)
			)
		)
		or
		(
			Text=="将满"
			and
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
			and
			WR_GetSpellNextCharge("野火炸弹")<GCD+MaxGCD*2	--野火炸弹充能时间<当前GCD+最大GCD*2
		)
		or
		(
			Text=="利矛"
			and
			BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
		)
		then
			if WR_ColorFrame_Show("CF1",(Text or "") .. "炸弹") then return true end
		end
	end
	return false
end

--施法过程 雄鹰之怒
function WR_HunterSurvival_Function_XYZN()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and TargetCloseRange	--目标在近战距离
	and TargetInCombat --目标战斗中
	and BuffTime_LMZR>GCD	--利矛之刃 BUFF存在
	and WR_SpellUsable("雄鹰之怒") --技能可用 资源可用
	and
	(
		WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		or
		WR_GetGCD("协同进攻")>GCD	--协同进攻冷却中
	)
	then
		if WR_ColorFrame_Show("CF6","雄鹰之怒") then return true end
	end
	return false
end

--施法过程 协同进攻
function WR_HunterSurvival_Function_XTJG()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and TargetInCombat --目标战斗中
	and TargetCloseRange	--目标在近战距离
	and WR_SpellUsable("协同进攻") --技能可用 资源可用
	and WR_GetSpellCharges("野火炸弹")==0	--野火炸弹 可用次数==0
	and
	(
		not IsPlayerSpell(459875)	--没学 共生激素
		or
		BuffTime_LMZR<=GCD	--利矛之刃 BUFF不存在
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
	and TargetCloseRange --目标在近战距离
	and TargetInCombat --目标战斗中
	and BuffTime_LMZR>GCD --利矛之刃 BUFF存在
	and BuffCount_LMZR<=2	--利矛之刃层数<=2
	and WR_SpellUsable("侧翼打击") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF8","侧翼打击") then return true end
	end
	return false
end

--施法过程 屠戮
function WR_HunterSurvival_Function_TL(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("屠戮") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF3","屠戮") then return true end
	end
	return false
end

--施法过程 猫鼬撕咬 猛禽一击
function WR_HunterSurvival_Function_MYSY(Text)
	if GCD<=ShiFaSuDu
	and ( WR_SpellUsable("猫鼬撕咬") or WR_SpellUsable("猛禽一击") ) --技能可用 资源可用
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
		then
			if WR_ColorFrame_Show("CF4",(Text or "") .. "猫鼬") then return true end
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
		Text=="0层"
		and
		IsPlayerSpell(459922)	--已学 无情原始狂野
		and
		WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
		and
		BuffCount_LMZR==0	--利矛之刃 层数==0
	)
	or
	(
		Text=="利矛"
		and
		FocusPower<70	--当前集中值<70
		and
		(
			(
				BuffCount_LMZR<=2	--利矛之刃 层数<=2
				and
				(
					not IsPlayerSpell(459922)	--没学 无情原始狂野
					or
					WR_GetUnitBuffTime("player","协同进攻")<=GCD	--协同进攻 BUFF不存在
				)
			)
			or
			(
				BuffCount_LMZR<=1	--利矛之刃 层数<=1
				and
				IsPlayerSpell(459922)	--已学 无情原始狂野
				and
				WR_GetUnitBuffTime("player","协同进攻")>GCD	--协同进攻 BUFF存在
			)
		)
	)
	then
		if WR_HunterSurvival_SLML(Text) then return true end
	end

	return false
end