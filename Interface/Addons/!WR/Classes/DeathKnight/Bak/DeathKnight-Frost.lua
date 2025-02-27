--冰DK运行库
function WR_DeathKnightFrost()
	if GetSpecialization()~=2 then	--如果不是冰霜(2)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.2
		
		WR_Initialize()	--初始化
		
		GCD=WR_GetGCD("灵界打击")	--获得当前公共CD
		Runes=WR_GetRuneCount()	--可用符文数量
		RunicPower=UnitPower("player",6)	--符文能量
		
		TargetCloseRange = C_Spell.IsSpellInRange("冰霜打击","target") or C_Spell.IsSpellInRange("灵界打击","target")	--获得目标是否在近战范围内
		TargetRange = WR_GetUnitRange("target")	--获得目标距离
		TargetInCombat=WR_TargetInCombat("target")	--目标在战斗
		RaidOrParty=WR_GetInRaidOrParty()	--判断实在团队还是小队

		PlayerHP=WR_GetUnitHP("player")	--获得自身真实带护盾的血量比例

		HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得5码内的敌人数量
		--HUCountRange30=WR_GetRangeHarmUnitCount(30,true)	--获得30码内战斗中的敌人数量
		--AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间

		BuffTime_BSZZ = WR_GetUnitBuffTime("player","冰霜之柱")	--获得冰霜之柱buff剩余时间
		BuffTime_SLJQ = WR_GetUnitBuffTime("player","杀戮机器")	--获得杀戮机器buff剩余时间
		
		--TargetDebuffTime_BSYB=WR_GetUnitDebuffInfo("target","冰霜疫病",true)	--获得目标冰霜疫病的剩余时间
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.BS_ZNJD) then return end	--智能焦点

	if WR_DeathKnightFrost_Function_WYZQ() then return end	--施法过程 巫妖之躯

	if WR_DeathKnightFrost_Function_BFZR() then return end	--施法过程 冰封之韧
	
	if WR_DeathKnight_Function_ZLS() then return end	--施法过程 治疗石
	
	if WR_DeathKnight_Function_ZLYS() then return end	--施法过程 治疗药水
	
	if WRSet.BS_SP1>=3 then
		if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.BS_SP2>=3 then
		if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_DeathKnight_Function_FMFHZ() then return end	--施法过程 反魔法护罩

	if WR_DeathKnight_Function_ZN() then return end	--施法过程 心灵冰冻

	if WR_DeathKnight_Function_FHMY() then return end	--施法过程 复活盟友

	if WR_DeathKnight_Function_ZMBY() then return end	--施法过程 致盲冰雨
	
	if WR_DeathKnight_Function_ZX() then return end	--施法过程 窒息

	if WR_DeathKnight_Function_KZWL() then return end	--施法过程 控制亡灵
	
	if WR_DeathKnightFrost_Function_Combat() then return end	--施法过程 战斗
	
	if WR_DeathKnight_Function_ZNMB() then return end	--施法过程 智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--施法过程 战斗
function WR_DeathKnightFrost_Function_Combat()
	if not TargetInCombat then return false end --目标不在战斗中
	
	if TargetCloseRange and TargetInCombat then	--目标在近战 并且 目标战斗中
		if WRSet.BS_SP1==1 then
			if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 常驻
		end
		if WRSet.BS_SP2==1 then
			if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 常驻
		end
	end
	
	if WR_DeathKnightFrost_LJDJ() then return true end	--灵界打击
	
	if WR_DeathKnightFrost_BSJLZN() then return true end	--冰霜巨龙之怒
	
	if WR_DeathKnightFrost_WZFS() then return true end	--亡者复生
	
	if WR_DeathKnightFrost_ZEFZ() then return true end	--憎恶附肢
	
	if WR_DeathKnightFrost_KWDL() then return true end	--枯萎凋零
	
	if WR_DeathKnightFrost_LKYD() then return true end	--冷酷严冬
	
	if WR_DeathKnightFrost_HBLJ() then return true end	--寒冰联结
	
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if zhandoumoshi==1	--爆发 开启
	and GCD<=ShiFaSuDu
	and IsPlayerSpell(439843) --已学 死神印记
	and WR_GetGCD("死神印记")<=GCD then --死神印记 冷却完毕
		if WRSet.BS_SP1==2 then
			if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 爆发
		end
		if WRSet.BS_SP2==2 then
			if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("SF6","死神印记") then return true end
	end
	
	if WR_DeathKnightFrost_FWWQZX("冰霜之柱") then return true end	--符文武器增效 有冰霜之柱的时候
	
	if WR_DeathKnightFrost_BSZZ() then return true end	--冰霜之柱(包含 符文武器增效 饰品等)
	
	if HUCountRange5<=1 then
		if WR_DeathKnightFrost_LHSG() then return true end	--灵魂收割(单体)
	end
	
	if WR_GetUnitBuffCount("player","杀戮机器")>=2 then --BUFF 层数
		if WR_DeathKnightFrost_YM("2杀戮湮灭") then return true end	--杀戮湮灭 2层
	end
	
	if WR_DeathKnightFrost_BSDJ_FRZS5() then return true end	--冰霜打击 锋锐之霜5层
	
	if BuffTime_SLJQ>GCD then --杀戮机器 BUFF存在
		if WR_DeathKnightFrost_YM("杀戮湮灭") then return true end	--杀戮湮灭
	end
	
	if WR_GetUnitBuffTime("player","白霜")>GCD then
		if WR_DeathKnightFrost_LFCJ() then return true end	--凛风冲击 白霜
	end
	
	if WR_DeathKnightFrost_BSDJ("target") then return true end	--冰霜打击
	
	if Runes>3	--符文数量>3
	or WR_GetUnitBuffTime("player","破灭")>GCD	--破灭 BUFF存在
	or WR_GetUnitBuffTime("player","枯萎凋零")>GCD	--枯萎凋零 BUFF存在
	then
		if WR_DeathKnightFrost_YM() then return true end	--湮灭
	end
	
	if WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD then
		if WR_DeathKnightFrost_LFCJ() then return true end	--凛风冲击
	end
	
	if WR_DeathKnightFrost_HDHJ() then return true end	--寒冬号角
	
	return false
end

--心灵冰冻 的先决条件
function WR_DeathKnightFrost_XLBD(Unit)
	if WR_SpellUsable("心灵冰冻")
	--技能可用 资源可用
	and
	WR_GetUnitRange(Unit)<=15
	--单位距离<=15
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

--复活盟友 的先决条件
function WR_DeathKnightFrost_FHMY(Unit)
	if WR_SpellUsable("复活盟友")
	--技能可用 资源可用
	and
	(
		IsSpellInRange("复活盟友",Unit)==1
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

--致盲冰雨 施法条件
function WR_DeathKnightFrost_ZMBY()
	if WR_SpellUsable("致盲冰雨")
	--技能可用 资源可用
	and
	WR_StunUnit(10)
	--范围击晕施法
	then
		return true
	end
	return false
end
	
--窒息 施法条件
function WR_DeathKnightFrost_ZX(Unit)
	if WR_SpellUsable("窒息")
	--技能可用 资源可用
	and
	WR_GetUnitRange(Unit)<=20
	--单位距离
	and
	WR_StunSpell(Unit)
	--击晕施法
	then
		return true
	end
	return false
end

--冰霜巨龙之怒 施法条件
function WR_DeathKnightFrost_BSJLZN()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	local BuffTime_CGYH = WR_GetUnitBuffTime("player",377103)	--获得377103挫骨扬灰buff剩余时间
	local BuffTime_BJZL = WR_GetUnitBuffTime("player","不洁之力")	--获得不洁之力buff剩余时间
	
	if WRSet.BS_BSJL~=4	--没有禁用
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("冰霜巨龙之怒") --技能可用 资源可用
	and TargetCloseRange --目标在近战范围内
	and BuffTime_BSZZ>GCD	--冰霜之柱 BUFF
	and
	(
		BuffTime_BSZZ<2	--冰霜之柱 BUFF(冰霜之柱即将快结束)
		or
		WRSet.BS_BSJL==1	--冰霜巨龙之怒 快速
		or
		(
			WRSet.BS_BSJL==2
			--冰霜巨龙之怒 正常
			and
			(BuffTime_CGYH>0 or BuffTime_BJZL>0)
			--挫骨扬灰存在 或者 不洁之力存在
		)
		or
		(
			WRSet.BS_BSJL==3
			--冰霜巨龙之怒 叠层
			and
			(
				(BuffTime_CGYH>0 and BuffTime_CGYH<2)
				--挫骨扬灰<2秒
				or
				(BuffTime_BJZL>0 and BuffTime_BJZL<2)
				--不洁之力<2秒
				or
				(BuffTime_CGYH>0 and BuffTime_BJZL>0)
				--挫骨扬灰存在 并且 不洁之力存在
			)
		)
	)
	then
		if WR_ColorFrame_Show("CSK","冰霜巨龙") then return true end
	end
	return false
end

--冰川突进 技能条件
function WR_DeathKnightFrost_BCTJ()
	if WR_SpellUsable("冰川突进")
	--技能可用 资源可用
	and TargetCloseRange --目标在近战范围内
	and IsPlayerSpell(194913) --已学天赋 冰川突进
	and HUCountRange5>=2 --5码敌人数量
	then
		return true
	end
	return false
end

--施法过程 巫妖之躯
function WR_DeathKnightFrost_Function_WYZQ()
	if WRSet.BS_WYZQ~=6 --巫妖之躯 开启
	and WR_SpellUsable("巫妖之躯") --技能可用 资源可用
	and PlayerHP<WRSet.BS_WYZQ/10 --血量比例
	and UnitAffectingCombat("player") --战斗中
	then
		if WR_ColorFrame_Show("CF2","巫妖之躯") then return true end
	end
	return false
end

--施法过程 冰封之韧
function WR_DeathKnightFrost_Function_BFZR()
	if WRSet.BS_BFZR~=6 --冰封之韧 开启
	and WR_SpellUsable("冰封之韧") --技能可用 资源可用
	and PlayerHP<WRSet.BS_BFZR/10 --血量比例
	and UnitAffectingCombat("player") --战斗中
	then
		if WR_ColorFrame_Show("CF1","冰封之韧") then return true end
	end
	return false
end

--憎恶附肢
function WR_DeathKnightFrost_ZEFZ()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WRSet.BS_ZEFZ==1
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("憎恶附肢") --技能可用 资源可用
	and TargetRange<=10 --单位距离
	and WR_GetGCD("冰霜之柱")<=1 --技能冷却时间
	and UnitName("target")~="原始海啸" --单位名称
	and UnitName("target")~="哈兰·斯威提" --单位名称
	then
		if WR_ColorFrame_Show("CSL","憎恶附肢") then return true end
	end
	return false
end

--冷酷严冬
function WR_DeathKnightFrost_LKYD()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WR_SpellUsable("冷酷严冬") --技能可用 资源可用
	and TargetRange<=7 --单位距离
	and
	(
		WR_GetGCD("冰霜之柱")>20	--冰柱冷却时间>20秒，就不用留给冰柱了
		or
		(
			zhandoumoshi==1	--爆发 开启
			and
			WR_SpellUsable("冰霜之柱") --技能可用 资源可用
		)
	)
	then
		if WR_ColorFrame_Show("CSO","冷酷严冬") then return true end
	end
	return false
end

--寒冰联结
function WR_DeathKnightFrost_HBLJ()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WR_SpellUsable("寒冰联结") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffTime("player","冰霜之柱")==0 --BUFF 不存在
	then
		if WR_ColorFrame_Show("SF1","寒冰联结") then return true end
	end
	return false
end
--枯萎凋零 技能条件
function WR_DeathKnightFrost_KWDL()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WRSet.BS_KWDL==1 --枯萎凋零 开启
	and WR_SpellUsable("枯萎凋零") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffTime("player","枯萎凋零")==0 --BUFF 不存在
	and HUCountRange5>=2 --5码敌人数量
	and not WR_PlayerMove() --玩家 没有移动
	and WR_GetSpellNextCharge("枯萎凋零")<=WR_GetGCD("冰霜之柱") --枯萎凋零充能时间<=冰霜之柱冷却时间，让下一次冰柱前能刷新出枯萎凋零
	and
	(
		WR_GetRangeAvgDeathTime(40)>10
		--预计战斗时间
		or
		WR_InTraining()
		--打木桩
	)
	then
		if WR_ColorFrame_Show("SF12","枯萎凋零") then return true end
	end
	return false
end
		
--亡者复生
function WR_DeathKnightFrost_WZFS()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if zhandoumoshi==1 --开爆发
	and WR_SpellUsable("亡者复生") --技能可用 资源可用
	and TargetRange<=30 --单位距离
	then
		if WR_ColorFrame_Show("CF9","亡者复生") then return true end
	end
	return false
end

--符文武器增效
function WR_DeathKnightFrost_FWWQZX(Text)
	if zhandoumoshi==1 --开爆发
	and WRSet.BS_FWWQ==1	--符文武器 开启
	and WR_SpellUsable("符文武器增效") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffTime("player","符文武器增效")==0 --BUFF 不存在
	then
		if Text==nil then
			if WR_ColorFrame_Show("CF3","符文武器") then return true end
		elseif Text=="冰霜之柱" and WR_GetUnitBuffTime("player","冰霜之柱")>7 then
			if WR_ColorFrame_Show("CF3","冰柱符文") then return true end
		end
	end
	return false
end

--冰霜之柱 技能条件
function WR_DeathKnightFrost_BSZZ()
	if zhandoumoshi==1 --开爆发
	and WR_SpellUsable("冰霜之柱") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	then
		if ( IsPlayerSpell(439843) and WR_GetGCD("死神印记")>40 )	--已学 死神印记 并且 死神印记CD
		or not IsPlayerSpell(439843) then	--没学 死神印记
			if WR_DeathKnightFrost_FWWQZX() then return true end	--符文武器增效
		
			if WRSet.BS_SP1==2 then
				if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 爆发
			end
			if WRSet.BS_SP2==2 then
				if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("SF7","冰霜之柱") then return true end
		end
	end
	return false
end

--灵界打击 技能条件
function WR_DeathKnightFrost_LJDJ()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WRSet.BS_LJDJ~=6 --灵界打击 开启
	and WR_SpellUsable("灵界打击") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	then
		if PlayerHP<=WRSet.BS_LJDJ/10 then	--玩家血量<=设定值
			if WR_ColorFrame_Show("CF10","灵界打击") then return true end
		elseif PlayerHP<=0.7 and WR_GetUnitBuffTime("player","黑暗援助")>GCD then
			if WR_ColorFrame_Show("CF10","黑暗援助") then return true end
		end
	end
	return false
end

--湮灭 技能条件
function WR_DeathKnightFrost_YM(Text)
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="湮灭"
	end
	
	if WR_SpellUsable("湮灭") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and
	(
		zhandoumoshi==1	--开爆发
		or
		Runes>=4	--符文数量>=4
		or
		WR_GetGCD("冰霜之柱")>10	--冰霜之柱CD>10秒
	)
	then
		if WR_ColorFrame_Show("SF10",TempText) then return true end
	end
	return false
end

--凛风冲击 技能条件
function WR_DeathKnightFrost_LFCJ()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WR_SpellUsable("凛风冲击") --技能可用 资源可用
	and TargetRange<=30 --单位距离
	then
		if WR_ColorFrame_Show("CSJ","凛风冲击") then return true end
	end
	return false
end

--冰霜打击 技能条件
function WR_DeathKnightFrost_BSDJ(Unit,Text)
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="冰霜打击"
	end
	
	if WR_SpellUsable("冰霜打击") --技能可用 资源可用
	--and WR_GetUnitRange(Unit)<=4 --单位距离
	and C_Spell.IsSpellInRange("冰霜打击",Unit)	--单位在技能范围内
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF11",TempText.."T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("SF2",TempText.."M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("SF3",TempText.."F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF5",TempText.."P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF8",TempText.."P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF7",TempText.."P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF8",TempText.."P4T") then return true end
		end
	end
	return false
end

--冰霜打击 锋锐之霜5层
function WR_DeathKnightFrost_BSDJ_FRZS5()
	if WR_GetUnitDebuffCount("target","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("target","锋霜") then return true end
	end
	if WR_GetUnitDebuffCount("mouseover","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("mouseover","锋霜") then return true end
	end
	if WR_GetUnitDebuffCount("focus","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("focus","锋霜") then return true end
	end
	for i = 1 , 4 do
		if WR_GetUnitDebuffCount("party"..i.."targer","锋锐之霜",true)>=5 then
			if WR_DeathKnightFrost_BSDJ("party"..i.."targer","锋霜") then return true end
		end
	end
	return false
end

--灵魂收割 技能条件
function WR_DeathKnightFrost_LHSG()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if WR_SpellUsable("灵魂收割") --技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and UnitHealth("target")/UnitHealthMax("target")<=0.35 --目标血量比例<35%
	and WR_GetUnitDeathTime("target")>7	--目标死亡时间>7
	and
	(
		BuffTime_BSZZ<=GCD	--冰霜之柱 不BUFF存在
		or
		(
			BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
			and
			BuffTime_SLJQ<=GCD	--杀戮机器 BUFF不存在
			and
			Runes>2 --符文数量>2
		)
	)
	then
		if WR_ColorFrame_Show("SF4","灵魂收割") then return true end
	end
	return false
end

--寒冬号角 技能条件
function WR_DeathKnightFrost_HDHJ()
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度
	
	if Runes<2	--符文数量
	and RunicPower<75	--符文能量
	and WR_SpellUsable("寒冬号角") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF12","寒冬号角") then return true end
	end
	return false
end