--防骑运行库
function WR_PaladinProtection()
	if GetSpecialization()~=2 then	--如果不是防护(2)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.FQ_SFSD*0.05

		WR_Initialize()	--初始化
		
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		
		Training=WR_InTraining()	--获得是否在打木桩
		
		HUCountRange8=WR_GetRangeHarmUnitCount(8,false)	--获得8码内的战斗中敌人数量
		HUCountRange30=WR_GetRangeHarmUnitCount(30,not(Training))	--获得30码内的敌人数量
		
		GCD=WR_GetGCD("圣光闪现")	--获得公共CD
		
		TargetRange=WR_GetUnitRange("target")
		TargetCanAttack=UnitCanAttack("player","target")
		TargetInCombat=WR_TargetInCombat("target")	--目标正在战斗

		BuffTime_ZYDJ,BuffCount_ZYDJ=WR_GetUnitBuffInfo("player","正义盾击")	--正义盾击 BUFF
		
		DebuffTime_ZL,DebuffCount_ZL,DebuffSum_ZL=WR_GetUnitDebuffInfo("player","自律")	--获得 自律 Debuff信息
		
		HolyPower=UnitPower("player",9)	--获得神圣能量的数量

		PlayerMove=WR_PlayerMove()	--获得自身是否在移动或者空中
		
		SmallMagicTime,BigMagicTime,SmallPhysicalTime,BigPhysicalTime=WR_TankResist()	--坦克减伤,返回值,小法术时间,大法术时间,小物理时间,大物理时间
		
		_,_,Paladin_SSJB = GetSpellInfo(432459)	--获得神圣军备是哪一种
		if Paladin_SSJB == 5927637 then	--圣洁武器
			Paladin_SSJB="圣洁武器"
		else
			Paladin_SSJB="神圣壁垒"
		end
		
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end

	if WR_PriorityCheck() then return true end	--施法过程 优先检查
	
	if WR_ZNJD(WRSet.FQ_ZNJD) then return end	--智能焦点
	
	if WR_Paladin_Function_QCGH() then return true end	--施法过程 虔诚光环
	
	if WR_Paladin_Function_SDS() then return true end	--施法过程 圣盾术
	
	if WRSet.FQ_SP1>=3 then
		if WR_ShiPin(1,WRSet.NQ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.FQ_SP2>=3 then
		if WR_ShiPin(2,WRSet.NQ_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Paladin_Function_SLS() then return true end	--施法过程 圣疗术
	
	if WR_Paladin_Function_ZLS() then return true end	--施法过程 治疗石

	if WR_Paladin_Function_ZLYS() then return true end	--施法过程 治疗药水

	if WR_PaladinProtection_QZJS() then return true end	--前置减伤

	if WR_PaladinProtection_Function_PZZF() then return true end	--施法过程 破咒祝福
	
	if WR_PaladinProtection_JW() then return true end	--戒卫

	if WR_PaladinProtection_CRFYZ() then return true end	--炽热防御者

	if WR_PaladinProtection_YGLWSW() then return true end	--远古列王守卫

	if WR_Paladin_Function_ZN() then return true end	--施法过程 责难

	if WR_PaladinProtection_Function_FCZZD("打断") then return true end	--复仇者之盾 打断
	
	if WR_Paladin_Function_DD() then return true end	--施法过程 代祷

	if WR_Paladin_Function_ZYZF() then return true end	--施法过程 自由祝福

	if WR_Paladin_Function_XSZF() then return true end	--施法过程 牺牲祝福
	
	if WR_Paladin_Function_ZCZC() then return true end	--施法过程 制裁之锤
	
	if WR_Paladin_Function_MMZG() then return true end	--施法过程 盲目之光
	
	if WR_Paladin_Function_QDS_QJS() then return true end	--施法过程 清毒术
	
	if WR_PaladinProtection_SYJL() then return true end	--施法过程 圣言祭礼
	
	if not WRSet.FQ_NotADD	--防ADD关闭
	or WR_TargetInCombat("target")	--目标战斗中
	then
		if TargetRange<=4 and TargetInCombat then	--目标在近战 并且 目标战斗中
			if WRSet.FQ_SP1==1 then
				if WR_ShiPin(1,WRSet.FQ_SP1) then return true end	--饰品 常驻
			end
			if WRSet.FQ_SP2==1 then
				if WR_ShiPin(2,WRSet.FQ_SP2) then return true end	--饰品 常驻
			end
		end
		
		if WR_PaladinProtection_GRSK() then return true end	--光荣时刻
		
		if WR_PaladinProtection_TEZY() then return true end	--提尔之眼

		if WR_PaladinProtection_RYSL("急救") then return true end	--荣耀圣令
		
		if WR_PaladinProtection_FX("增益") then return true end	--奉献 增益
		
		if WR_PaladinProtection_FCZN() then return true end	--复仇之怒
		
		if WR_PaladinProtection_SJMZ() then return true end	--圣洁鸣钟
		
		--神圣军备
		if zhandoumoshi==1	--爆发 开启
		and IsPlayerSpell(432459)	--已学神圣军备
		and WR_SpellUsable(432459)	--技能可用
		and TargetRange<=4	--单位距离
		then
			if Paladin_SSJB=="圣洁武器"
			and WR_GetUnitBuffTime("player","圣洁武器")<=6	--圣洁武器 BUFF时间<=6秒(20*30%)
			then
				if WR_ColorFrame_Show("CSL","圣洁武器") then return true end
			elseif Paladin_SSJB=="神圣壁垒" then
				if WR_ColorFrame_Show("CSL","神圣壁垒") then return true end
			end
		end
		
		--圣光壁垒
		if zhandoumoshi==1	--爆发 开启
		and IsPlayerSpell(378974)	--已学 圣光壁垒
		and WR_SpellUsable(378974)	--技能可用
		and TargetRange<=20	--单位距离
		then
			if WR_ColorFrame_Show("CSO","圣光壁垒") then return true end
		end
		
		if HUCountRange8>3 then	--如果3个目标以上
			if WR_PaladinProtection_Function_FCZZD("常驻") then return true end	--复仇者之盾 常驻
		
			if WR_PaladinProtection_ZYDJ() then return true end	--正义盾击
		end
		
		if WR_PaladinProtection_RYSL("免费") then return true end	--荣耀圣令
		
		if WR_PaladinProtection_SP("满层") then return true end	--审判 满层
		
		if WR_PaladinProtection_FNZC() then return true end	--愤怒之锤
		
		if WR_PaladinProtection_FX("强化") then return true end	--奉献 强化
		
		if WR_PaladinProtection_SP() then return true end	--审判
		
		if WR_PaladinProtection_Function_FCZZD("常驻") then return true end	--复仇者之盾 常驻
		
		if WR_PaladinProtection_ZYDJ() then return true end	--正义盾击
		
		if WR_PaladinProtection_ZYZC() then return true end	--正义之锤
		
	end
		
	if WR_PaladinProtection_ZFZC() then return true end	--祝福之锤
	
	if WR_PaladinProtection_FX("填充") then return true end	--奉献 填充
	
	if WR_Paladin_Function_ZNMB() then return end	--施法过程 智能目标

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
	end
end

--前置减伤
function WR_PaladinProtection_QZJS()
	if WR_GetRangeSpellTime(45,"三重撕咬","player")<999 then return false end	--防骑排除"三重撕咬"
	
	if WRSet.FQ_QZJS	--前置减伤 开启
	and UnitAffectingCombat("player") --单位战斗中
	and
	(
		BigMagicTime<=1.5 --大法术减伤时间
		or
		BigPhysicalTime<=1.5 --大物理减伤时间
	)
	and WR_GetUnitBuffTime("player","破咒祝福")==0	--单位没有 破咒祝福
	and WR_GetUnitBuffTime("player","圣盾术")==0	--单位没有 圣盾术
	and WR_GetUnitBuffTime("player","炽热防御者")==0	--单位没有 炽热防御者
	and WR_GetUnitBuffTime("player","远古列王守卫")==0	--单位没有 远古列王守卫
	then
	
		if WR_SpellUsable("破咒祝福")	--技能可用
		and
		(
			WRSet.FQ_PZZF==1	--智能
			or
			WRSet.FQ_PZZF==3	--自己
		)
		and BigMagicTime<=1.5 --大法术减伤时间
		then
			if WR_ColorFrame_Show("ASF6","前置破咒") then return true end
		end
	
		if WRSet.FQ_CRFYZ~=10 --炽热防御者 开启
		and WR_SpellUsable("炽热防御者")	--技能可用
		then
			if WR_ColorFrame_Show("SF9","前置炽热") then return true end
		end
	
		if WRSet.FQ_SDS~=4	--圣盾术 开启
		and WR_SpellUsable("圣盾术")	--技能可用 资源可用
		and UnitName("boss1")~="E.D.N.A."
		then
			if WR_ColorFrame_Show("CF11","前置圣盾") then return true end
		end
	
		if WRSet.FQ_YGLWSW~=10 --远古列王守卫 开启
		and WR_SpellUsable("远古列王守卫")	--技能可用
		then
			if WR_ColorFrame_Show("SF6","前置列王") then return true end
		end
	
		if WRSet.FQ_TEZY==1 --提尔之眼 开启
		and WR_SpellUsable("提尔之眼")	--技能可用
		and TargetRange<=5 --目标距离
		then
			if WR_ColorFrame_Show("CF7","前置提尔") then return true end
		end
		
	end
	
	return false
end

--戒卫
function WR_PaladinProtection_JW()
	if WRSet.FQ_JW~=10 --戒卫 开启
	and UnitAffectingCombat("player") --单位战斗中
	and PlayerHP<WRSet.FQ_JW/10 --血量比例 < 设定值/10
	and WR_SpellUsable("戒卫")	--技能可用
	and WR_GetUnitBuffTime("player","圣盾术")==0	--圣盾术不存在
	then
		if WR_ColorFrame_Show("SF12","戒卫") then return true end
	end
	return false
end

--炽热防御者
function WR_PaladinProtection_CRFYZ()
	if WRSet.FQ_CRFYZ~=10 --炽热防御者 开启
	and UnitAffectingCombat("player") --单位战斗中
	and WR_SpellUsable("炽热防御者")	--技能可用
	and WR_GetUnitBuffTime("player","圣盾术")==0	--圣盾术不存在
	and PlayerHP<WRSet.FQ_CRFYZ/10 --血量比例 < 设定值/10
	then
		if WR_ColorFrame_Show("SF9","炽热防御") then return true end
	end
	return false
end

--远古列王守卫
function WR_PaladinProtection_YGLWSW()
	if WRSet.FQ_YGLWSW~=10 --远古列王守卫 开启
	and UnitAffectingCombat("player") --单位战斗中
	and PlayerHP<WRSet.FQ_YGLWSW/10 --血量比例 < 设定值/10
	and WR_SpellUsable("远古列王守卫")	--技能可用
	and WR_GetUnitBuffTime("player","圣盾术")==0	--圣盾术不存在
	then
		if WR_ColorFrame_Show("SF6","远古列王") then return true end
	end
	return false
end

--光荣时刻
function WR_PaladinProtection_GRSK()
	if zhandoumoshi==1 --开爆发
	and WRSet.FQ_GRSK==1 --光荣时刻 开启
	and WR_SpellUsable("光荣时刻")	--技能可用
	and TargetRange<=2 --目标距离
	and WR_GetUnitBuffTime("player","圣盾术")==0	--圣盾术不存在
	then
		if WR_PaladinProtection_ShiPing() then return true end	--饰品
		if WR_ColorFrame_Show("CSJ","光荣时刻") then return true end
	end
	return false
end

--提尔之眼
function WR_PaladinProtection_TEZY()
	if GCD<=ShiFaSuDu
	and WRSet.FQ_TEZY==1 --提尔之眼 开启
	and TargetRange<=2 --目标距离
	and GetUnitSpeed("player")<5 --移动速度<5，通常是在倒退或者停止移动
	and WR_SpellUsable("提尔之眼")	--技能可用
	and WR_GetUnitBuffTime("player","圣盾术")==0	--圣盾术不存在
	and PlayerHP<0.35 --血量比例 < 35%
	then
		if WR_ColorFrame_Show("CF7","提尔之眼") then return true end
	end
	return false
end
	
--圣洁鸣钟
function WR_PaladinProtection_SJMZ()
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end	--宇宙奇点期间不要敲钟
	
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and WRSet.FQ_SJMZ==1 --圣洁鸣钟 开启
	and TargetRange<=2 --目标距离
	--and HUCountRange30>=1 --30码敌人
	and GetUnitSpeed("player")<5 --移动速度<5，通常是在倒退或者停止移动
	and UnitAffectingCombat("player") --玩家在战斗
	and HolyPower<=2 --神圣能量
	and WR_SpellUsable("圣洁鸣钟")	--技能可用
	then
		if WR_PaladinProtection_ShiPing() then return true end	--饰品
		if WR_ColorFrame_Show("CF3","圣洁鸣钟") then return true end
	end
	return false
end

--饰品
function WR_PaladinProtection_ShiPing()
	if WRSet.FQ_SP1==2 then
		if WR_ShiPin(1,WRSet.FQ_SP1) then return true end	--饰品 爆发
	end
	if WRSet.FQ_SP2==2 then
		if WR_ShiPin(2,WRSet.FQ_SP2) then return true end	--饰品 爆发
	end
	return false
end

--复仇之怒
function WR_PaladinProtection_FCZN()
	if zhandoumoshi==1	--爆发 开启
	and TargetRange<=2 --目标距离
	and TargetCanAttack --目标可攻击
	and WRSet.FQ_JW~=10	--戒卫选项不是禁用的
	and PlayerHP<WRSet.FQ_JW/10 --血量比例 < 设定值/10
	and WR_SpellUsable("复仇之怒")	--技能可用
	then
		if WR_ColorFrame_Show("SF11","复仇之怒") then return true end
	end
	return false
end

--奉献
function WR_PaladinProtection_FX(Text)
	local FengXian=false	--奉献
	for i=1,40,1
	do
	   local _, totemName, startTime, duration, _= GetTotemInfo(i)
		if totemName=="奉献" then
			FengXian=true
		end 
	end
	
	if GCD<=ShiFaSuDu
	and TargetRange<=2 --目标距离
	and TargetCanAttack --目标可攻击
	and GetUnitSpeed("player")<5 --移动速度<5，通常是在倒退或者停止移动
	and WR_SpellUsable("奉献")	--技能可用
	then
		if
		(
			Text=="增益"
			and
			(
				WR_GetUnitBuffTime("player","奉献")<=3 --奉献BUFF不存在
				or
				not FengXian	--没有奉献
			)
		)
		or
		Text=="填充"
		or
		(
			Text=="Debuff"
			and
			WR_GetUnitDebuffInfo("target","奉献",true)==0
		)
		or
		(
			Text=="强化"
			and
			WR_GetUnitBuffCount("player","神恩指引")>=5	--神恩指引 BUFF>=5层
		)
		then
			if WR_ColorFrame_Show("CSM",Text.."奉献") then return true end
		end
	end
	return false
end

--荣耀圣令 施法条件
function WR_PaladinProtection_RYSL(Text)
	if WR_SpellUsable("荣耀圣令") --技能可用
	and WR_GetInRaidOrParty()~="raid" --不在团队
	--and WR_GetUnitBuffTime("player","破咒祝福")==0	--单位没有 破咒祝福
	and WR_GetUnitBuffTime("player","圣盾术")<=1	--圣盾术 剩余时间<=1秒
	and
	(
		(
			Text=="免费"
			and WR_GetUnitBuffTime("player",327510)>GCD --闪耀之光 BUFF存在 免费圣令
			and WR_GetUnitBuffTime("player","信仰圣光")<=GCD --身上没有 信仰圣光 BUFF
			and
			(
				PlayerHP<=0.75 --血量比例
				or
				BigMagicTime<=2 --大法术减伤时间
				or
				BigPhysicalTime<=2 --大物理减伤时间
				or
				SmallMagicTime<=2 --小法术减伤时间
				or
				SmallPhysicalTime<=2 --小法术减伤时间
			)
		)
		or
		(
			Text=="急救"
			and
			WRSet.FQ_RYSL~=10 --荣耀圣令 开启
			and
			PlayerHP<=WRSet.FQ_RYSL/10 --血量比例<=荣耀圣令设定值
			and
			BuffTime_ZYDJ>4.5	--正义盾击持续时间>4.5秒
		)
	)
	then
		if WR_ColorFrame_Show("CF12",(Text or "").."圣令") then return true end
	end
	return false
end

--正义盾击
function WR_PaladinProtection_ZYDJ()
	if TargetRange<=4 --目标距离
	and TargetCanAttack --目标可攻击
	--and HolyPower>=3 --神圣能量
	and WR_SpellUsable("正义盾击") --技能可用
	and
	(
		GCD<=ShiFaSuDu
		or
		BuffTime_ZYDJ<4.5	--正义盾击BUFF时间<4.5
		or
		WR_GetUnitBuffTime("player","神圣意志")>0	--神圣意志存在 免费盾击
	)
	then
		if WR_ColorFrame_Show("CF6","正义盾击") then return true end
	end
	return false
end

--审判
function WR_PaladinProtection_SP(Text)
	if GCD<=ShiFaSuDu
	and TargetRange<=30 --目标在30码内
	and TargetCanAttack --目标可攻击
	and HolyPower<5	--神圣能量
	and WR_SpellUsable("审判")	--技能可用
	then
		if
		(
			Text=="Debuff"
			and
			WR_GetUnitDebuffInfo("target","审判",true)==0
		)
		or
		(
			Text=="满层"
			and
			WR_GetSpellCharges("审判")>=2	--审判可使用次数>=2
		)
		or
		Text==nil
		then
			if WR_ColorFrame_Show("CF4",(Text or "").."审判") then return true end
		end
	end
	return false
end

--愤怒之锤
function WR_PaladinProtection_FNZC()
	if GCD<=ShiFaSuDu
	and TargetRange<=30 --目标距离
	and TargetCanAttack --目标可攻击
	and HolyPower<5 --神圣能量
	and IsSpellOverlayed(24275) --技能激活触发
	and WR_SpellUsable("愤怒之锤")	--技能可用
	then
		if WR_ColorFrame_Show("CF8","愤怒之锤") then return true end
	end
	return false
end

--清毒术 的先决条件
function WR_PaladinProtection_QDS(Unit)
	if IsPlayerSpell(213644)
	--已学 清毒术
	and
	WR_GetGCD("清毒术")<=GCD
	--技能冷却
	and
	UnitChannelInfo("player")==nil
	--没有在引导施法
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	IsSpellInRange("清毒术",Unit)==1
	--单位在技能范围内
	and
	WR_CanRemoveUnitDebuff(Unit)
	--单位有可驱散Debuff
	then
		return true
	end
	return false
end


--破咒祝福 的先决条件
function WR_PaladinProtection_PZZF(Unit)
	if not UnitCanAttack("player",Unit) --单位是友方
	and not UnitIsDead(Unit) --单位没有死亡
	and UnitHealth(Unit)/UnitHealthMax(Unit)<0.3 --单位血量低于设定值
	and IsSpellInRange("破咒祝福",Unit) --单位在技能范围内
	and WR_GetUnitDebuffTime(Unit,"自律")==0 --单位没有自律debuff
	and WR_GetUnitBuffInfo(Unit,"牺牲祝福")==0 --单位没有 牺牲祝福
	and WR_GetUnitBuffTime(Unit,"破咒祝福")==0	--单位没有 破咒祝福
	and WR_GetUnitBuffTime(Unit,"圣盾术")==0	--单位没有 圣盾术
	then
		if Unit=="party1" then
			if WR_ColorFrame_Show("CF1","破咒P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("CF5","破咒P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("SF8","破咒P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("CSK","破咒P4") then return true end
		end
	end
	
	return false
end

--破咒祝福 的先决条件
function WR_PaladinProtection_Function_PZZF()
	if GCD>ShiFaSuDu then return false end
	if WRSet.FQ_PZZF==3 then return false end	--复仇者之盾 关闭
	if not WR_SpellUsable("破咒祝福") then return false end	--技能不可用
	
	for i=1,4,1 do
		if WRSet.FQ_PZZF==1	--智能
		or ( WRSet.FQ_PZZF==2 and UnitGroupRolesAssigned("party"..i)=="HEALER" )	--治疗
		then
			if WR_PaladinProtection_PZZF("party"..i) then return true end	--队友目标
		end
	end
	return false
end

--自由祝福 的先决条件
function WR_PaladinProtection_ZYZF(Unit)
	if IsPlayerSpell(1044)
	--已学 自由祝福
	and
	WR_GetGCD("自由祝福")<=GCD
	--技能冷却
	and
	IsSpellInRange("自由祝福",Unit)==1
	--单位在技能范围内
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	not(UnitIsDead(Unit))
	--单位没有死亡
	and
	WR_Unbind(Unit)
	--单位有自由祝福可以解除的状态
	then
		return true
	end
	return false
end

--代祷 的先决条件
function WR_PaladinProtection_DD(Unit)
	if IsPlayerSpell(391054)
	--已学 代祷
	and
	WR_GetGCD("代祷")<=GCD
	--技能冷却
	and
	HolyPower>=3
	--神圣能量
	and
	(
		IsSpellInRange("代祷",Unit)==1
		--单位在技能范围内
		or
		WR_GetUnitRange(Unit)<=40
		--单位距离<=40
	)
	and
	UnitIsDead(Unit)
	--单位死亡
	and
	not(UnitCanAttack("player",Unit))
	--单位是友善的
	and
	UnitIsPlayer(Unit)
	--单位是玩家
	then
		return true
	end
	return false
end

--责难 的先决条件
function WR_PaladinProtection_ZN(Unit)
	if IsPlayerSpell(96231)
	--已学 责难
	and
	WR_GetGCD("责难")<=GCD
	--技能冷却
	and
	IsSpellInRange("责难",Unit)==1
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

--复仇者之盾
function WR_PaladinProtection_FCZZD(Unit,Text)

	
	if UnitCanAttack("player",Unit) --单位是敌对
	and not UnitIsDead(Unit) --单位没有死亡
	and IsSpellInRange("复仇者之盾",Unit) --单位在技能范围内
	then
		local DaDuanName={
			--[千丝之城]
			[1]="苏雷吉缚丝者",[2]="安苏雷克的传令官",[3]="隐秘网士",[4]="苏雷吉反自然者",[5]="长者织影",[6]="谢非提克",[7]="",[8]="",[9]="",[10]="",
			--[回响之城]
			[11]="颤声侍从",[12]="伊克辛",[13]="纳克特",[14]="阿提克",[15]="沾血的网法师",[16]="鲜血监督者",[17]="",[18]="",[19]="",[20]="",
			--[围攻伯拉勒斯]
			[21]="铁潮塑浪者",[22]="艾什凡指挥官",[23]="水鼠帮劫掠者",[24]="水鼠帮唤风者",[25]="",[26]="",[27]="",[28]="",[29]="",[30]="",
			--[通灵战潮]
			[31]="尸体收割者",[32]="血肉工匠",[33]="佐尔拉姆斯守门人",[34]="佐尔拉姆斯巫师",[35]="佐尔拉姆斯通灵师",[36]="脆骨法师",[37]="佐尔拉姆斯愈骨者",[38]="骷髅劫掠者",[39]="纳祖达",[40]="阿玛厄斯",
			[41]="缝合助理",
			--[塞兹仙林的迷雾]
			[42]="英格拉·马洛克",[43]="纱雾塑形者",[44]="纱雾照看者",[45]="锥喉鹿角巨虫",[46]="德鲁斯特收割者",[47]="",[48]="",[49]="",[50]="",
			--[格瑞姆巴托]
			[51]="暮光唤地者",[52]="暮光欺诈者",[53]="暮光术士",[54]="达加·燃影者",[55]="",[56]="",[57]="",[58]="",[59]="",[60]="",
			--[矶石宝库]
			[61]="咒心入侵者",[62]="阴森的虚空之魂",[63]="炉铸愈疗者",[64]="被转化的代言人",[65]="虚缚嚎叫者",[66]="咒炉塑石者",[67]="",[68]="",[69]="",[70]="",
			--[破晨号]
			[71]="夜幕影法师",[72]="夜幕暗法师",[73]="苏雷吉网法师",[74]="夜幕司令官",[75]="夜幕黑暗建筑师",[76]="",[77]="",[78]="",[79]="",[80]="",
		}
		local DaDuan = false
		for i=1,40,1 do
			if UnitAffectingCombat("nameplate"..i) then	--单位在战斗中
				for _, TempName in ipairs(DaDuanName) do
					if UnitName("nameplate"..i) == TempName then
						DaDuan = true
						break
					end
				end
				if DaDuan then break end
			end
		end
	
		if
		(
			Text=="打断"
			and
			WR_GetCastInterruptible(Unit,0)	 --单位有需要打断的法术
		)
		or
		(
			Text=="常驻"
			and
			(
				WRSet.FQ_FCZZD==3	--常驻
				or
				(
					WRSet.FQ_FCZZD==1	--智能
					and
					not DaDuan	--非需要打断的情况,也就是范围内没有战斗的法系怪
				)
			)
		)
		then
			if Unit=="target" then
				if WR_ColorFrame_Show("SF10",Text.."飞盾T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSI",Text.."飞盾M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("ASF12",Text.."飞盾F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("ASF1",Text.."飞盾P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("ASF2",Text.."飞盾P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("ASF3",Text.."飞盾P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("ASF4",Text.."飞盾P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 复仇者之盾
function WR_PaladinProtection_Function_FCZZD(Text)
	if GCD>ShiFaSuDu then return false end
	if WRSet.FQ_FCZZD==4 then return false end	--复仇者之盾 禁用
	if not WR_SpellUsable("复仇者之盾") then return false end	--技能不可用
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end	--宇宙奇点期间不要飞盾
	
	if WR_PaladinProtection_FCZZD("target",Text) then return true end
	if WR_PaladinProtection_FCZZD("mouseover",Text) then return true end
	if WR_PaladinProtection_FCZZD("focus",Text) then return true end
	for i=1,4,1 do
		if WR_PaladinProtection_FCZZD("party"..i.."target",Text) then return true end	--队友目标
	end
	return false
end

--正义之锤
function WR_PaladinProtection_ZYZC(Text)
	if GCD<=ShiFaSuDu
	and HolyPower<5 --神圣能量
	and WR_SpellUsable("正义之锤")	--技能可用
	and IsSpellInRange("正义之锤","target")	--目标在技能范围内
	then
		if WR_ColorFrame_Show("CF9","正义之锤") then return true end
	end
	return false
end

--祝福之锤
function WR_PaladinProtection_ZFZC(Text)
	if GCD<=ShiFaSuDu
	and HolyPower<5 --神圣能量
	and WR_SpellUsable("祝福之锤")	--技能可用
	then
		if Text==nil
		or
		(
			Text=="满层"
			and
			WR_GetSpellCharges("祝福之锤")>=3	--祝福之锤可使用次数>=3
		)
		then
			if WR_ColorFrame_Show("CF9",(Text or "").."祝锤") then return true end
		end
	end
	return false
end

--圣言祭礼
function WR_PaladinProtection_SYJL()
	if GCD<=ShiFaSuDu
	and UnitCastingInfo("player")==nil
	and WR_GetUnitBuffTime("player","圣言祭礼")<=600	--圣言祭礼BUFF时间<10分钟
	and not UnitAffectingCombat("player")	--不在战斗中
	and WR_SpellUsable("圣言祭礼")	--技能可用
	then
		if WR_ColorFrame_Show("CSP","圣言祭礼") then return true end
	end
	return false
end

--圣疗术 的先决条件
function WR_PaladinProtection_SLS(Unit)
	if WRSet.FQ_SLS~=4
	--圣盾术 开启
	and
	IsPlayerSpell(633)
	--已学 圣疗术
	and
	WR_GetGCD("圣疗术")<=GCD
	--技能冷却
	and
	IsSpellInRange("圣疗术",Unit)==1
	--单位在技能范围内
	and
	not(UnitIsDead(Unit))
	--单位没有死亡
	and
	UnitHealth(Unit)/UnitHealthMax(Unit)<WRSet.FQ_SLS/10
	--单位血量比例<设定值
	and
	DebuffTime_ZL==0
	--单位没有自律debuff
	and
	UnitAffectingCombat("player")
	--玩家在战斗
	then
		return true
	end
	return false
end

