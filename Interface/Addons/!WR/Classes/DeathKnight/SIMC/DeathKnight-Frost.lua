--冰DK运行库
function WR_DeathKnightFrost()
	if GetSpecialization()~=2 then	--如果不是冰霜(2)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.2
		
		WR_Initialize()	--初始化
		
		GCD=WR_GetGCD("灵界打击")	--获得当前公共CD
		MaxGCD=WR_GetMaxGCD(1.5)	--获得最大GCD
		Runes=WR_GetRuneCount()	--可用符文数量
		RunicPower=UnitPower("player",6)	--符文能量
		
		TargetCloseRange = C_Spell.IsSpellInRange("冰霜打击","target") or C_Spell.IsSpellInRange("灵界打击","target")	--获得目标是否在近战范围内
		TargetRange = WR_GetUnitRange("target")	--获得目标距离
		TargetInCombat=WR_TargetInCombat("target")	--目标在战斗
		RaidOrParty=WR_GetInRaidOrParty()	--判断实在团队还是小队

		PlayerHP=WR_GetUnitHP("player")	--获得自身真实带护盾的血量比例

		HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得5码内的敌人数量
		--HUCountRange30=WR_GetRangeHarmUnitCount(30,true)	--获得30码内战斗中的敌人数量
		AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间

		BuffTime_BSZZ = WR_GetUnitBuffTime("player","冰霜之柱")	--获得 冰霜之柱 buff剩余时间
		BuffTime_BLTX = WR_GetUnitBuffTime("player","冰龙吐息")	--获得 冰龙吐息 buff剩余时间
		BuffTime_DLZH = WR_GetUnitBuffTime("player",377103)	--获得377103 断裂之痕 buff剩余时间
		BuffTime_BJZL = WR_GetUnitBuffTime("player","不洁之力")	--获得不洁之力buff剩余时间
		BuffTime_SLJQ , BuffCount_SLJQ = WR_GetUnitBuffTime("player","杀戮机器")	--获得 杀戮机器 buff剩余时间
		BuffTime_BLZZ , BuffCount_BLZZ = WR_GetUnitBuffTime("player","冰冷之爪")	--获得 冰冷之爪 buff剩余时间 当前层数
		
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
	
	--凛风H1
	if GCD<=ShiFaSuDu
	and TargetRange<=30 --单位距离
	and WR_SpellUsable("凛风冲击") --技能可用 资源可用
	and WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
	and HUCountRange5>=2	--敌人数量>=2
	and
	(
		not IsPlayerSpell(49020)	--没学 湮灭
		or
		(
			IsPlayerSpell(49020)	--已学 湮灭
			and
			(
				WR_GetGCD("冰霜之柱")>GCD	--冰霜之柱 CD中
				or
				(
					BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
					and
					BuffTime_SLJQ<=GCD	--杀戮机器 BUFF不存在
				)
			)
		)
	)
	then
		if WR_ColorFrame_Show("CSJ","凛风H1") then return true end
	end

	--冰打H1
	if GCD<=ShiFaSuDu
	and HUCountRange5<=1	--敌人数量<=1
	and WR_DeathKnightFrost_RunicPowerBuff()	--符文能量增益BUFF
	and
	(
		(
			IsPlayerSpell(49020) --已学 湮灭
			and IsPlayerSpell(152279) --已学 冰龙吐息
			and BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
			and BuffTime_BLTX<=GCD	--冰龙吐息 BUFF不存在
			and WR_GetGCD("冰龙吐息")>10
		)
		or
		(
			IsPlayerSpell(152279) --已学 冰龙吐息
			and BuffTime_BLTX<=GCD	--冰龙吐息 BUFF不存在
			and WR_GetGCD("冰龙吐息")>10
		)
		or
		(
			not IsPlayerSpell(152279) --没学 冰龙吐息
			and IsPlayerSpell(49020) --已学 湮灭
			and BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
		)
	)
	then
		if WR_DeathKnightFrost_BSDJ_Function("H1") then return true end
	end
	
	--附肢C1
	if GCD<=ShiFaSuDu
	and TargetRange<=10 --单位距离
	and WRSet.BS_ZEFZ==1
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("憎恶附肢") --技能可用 资源可用
	and
	(
		(
			IsPlayerSpell(49020)	--已学 湮灭
			and
			BuffTime_BSZZ<=GCD	--冰霜之柱 不存在
		)
		or
		not IsPlayerSpell(49020)	--没学 湮灭
	)
	then
		if WR_ColorFrame_Show("CSL","附肢C1") then return true end
	end
	
	--严冬C1
	if GCD<=ShiFaSuDu
	and TargetRange<=7 --单位距离
	and WR_SpellUsable("冷酷严冬") --技能可用 资源可用
	and
	(
		(
			IsPlayerSpell(194912)	--已学 风暴汇聚
			or
			IsPlayerSpell(377056)	--已学 刺骨之寒
		)
		and
		(
			not IsPlayerSpell(456230)	--没学 极地突袭
			or
			BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
		)
	)
	then
		if WR_ColorFrame_Show("CSO","严冬C1") then return true end
	end

	--联结C1
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("寒冰联结") --技能可用 资源可用
	and
	(
		not IsPlayerSpell(456230)	--没学 极地突袭
		or
		BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
	)
	then
		if WR_ColorFrame_Show("SF1","联结C1") then return true end
	end

	--死神C1
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and IsPlayerSpell(439843) --已学 死神印记
	and WR_GetUnitDebuffInfo("target","死神印记",true)==0	--目标身上没有我的 死神印记 DEBUFF
	and WR_GetGCD("死神印记")<=GCD --死神印记 冷却完毕
	and
	(
		(
			not IsPlayerSpell(152279) --没学 冰龙吐息
			and
			(
				BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
				or
				WR_GetGCD("冰霜之柱")>10	--冰霜之柱 冷却时间>10秒
				or
				WR_GetGCD("冰霜之柱")<=GCD	--冰霜之柱 技能冷却(死神印记宏增加冰霜之柱同时开)
			)
		)
		or
		IsPlayerSpell(152279)	--已学 冰龙吐息
	)
	then
		if WRSet.BS_SP1==2 then
			if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 爆发
		end
		if WRSet.BS_SP2==2 then
			if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("SF6","死神C1") then return true end
	end

	--符武C1
	if zhandoumoshi==1 --开爆发
	and WRSet.BS_FWWQ==1	--符文武器 开启
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffTime("player","符文武器增效")==0 --BUFF 不存在
	and WR_SpellUsable("符文武器增效") --技能可用 资源可用
	and
	(
		(
			IsPlayerSpell(49020)	--已学 湮灭
			and
			not IsPlayerSpell(152279) --没学 冰龙吐息
			and
			BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
		)
		or
		(
			BuffTime_BLTX>GCD	--冰龙吐息 BUFF存在
			and
			Runes<=4	--符文数量<=4
			and
			RunicPower<=90	--符文能量<=90
		)
	)
	then
		if WR_ColorFrame_Show("CF3","符武H1") then return true end
	end

	--冰柱C1
	if zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("冰霜之柱") --技能可用 资源可用
	and
	(
		(
			IsPlayerSpell(49020)	--已学 湮灭
			and
			not IsPlayerSpell(152279)	--没学 冰龙吐息
		)
		or
		(
			IsPlayerSpell(152279)	--已学 冰龙吐息
			and
			WR_GetGCD("冰龙吐息")>GCD	--冰龙吐息 冷却中
			and
			WR_GetUnitBuffTime("player","狂乱释放")>GCD
		)
	)
	then
		if WRSet.BS_SP1==2 then
			if WR_ShiPin(1,WRSet.BS_SP1) then return true end	--饰品 爆发
		end
		if WRSet.BS_SP2==2 then
			if WR_ShiPin(2,WRSet.BS_SP2) then return true end	--饰品 爆发
		end
		
		if WR_ColorFrame_Show("SF7","冰柱C1") then return true end
	end

	--龙喷C1
	if zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("冰龙吐息") --技能可用 资源可用
	and BuffTime_BLTX<=GCD	--冰龙吐息 BUFF不存在
	and RunicPower>60	--符文能量>60
	and WR_GetGCD("冰霜之柱")<=GCD	--冰霜之柱 冷却好了
	then
		if WR_ColorFrame_Show("CSU","龙喷C1") then return true end
	end

	--冰龙C1
	if GCD<=ShiFaSuDu
	and TargetCloseRange --目标在近战范围内
	and WRSet.BS_BSJL~=4	--没有禁用
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("冰霜巨龙之怒") --技能可用 资源可用
	and
	(
		(
			IsPlayerSpell(444040)	--已学 天启现世
			and
			(
				(
					not IsPlayerSpell(152279)	--没学 冰龙吐息
					and
					BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
				)
				or
				BuffTime_BLTX>GCD	--冰龙吐息 BUFF存在

			)
		)
		or
		(
			not IsPlayerSpell(444040)	--没学 天启现世
			and
			HUCountRange5>=2 --5码敌人数量
			and
			(
				IsPlayerSpell(51271)	--已学 冰霜之柱
				and
				BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
			)
		)
		or
		(
			not IsPlayerSpell(444040)	--没学 天启现世
			and IsPlayerSpell(49020) --已学 湮灭
			and
			(
				(
					IsPlayerSpell(51271)	--已学 冰霜之柱
					and
					BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
					and
					WR_MainWeapon()=="单手武器"
				)
				or
				(
					BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
					and
					WR_MainWeapon()=="双手武器"
					and
					WR_GetGCD("冰霜之柱")>GCD	--冰霜之柱 技能冷却中
				)
				or
				not IsPlayerSpell(51271)	--没学 冰霜之柱
			)
			and
			(
				(
					BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
					and
					BuffTime_BSZZ<GCD+MaxGCD	--冰霜之柱 BUFF时间<一个技能GCD
				)
				or
				(
					BuffTime_BJZL>GCD	--不洁之力 BUFF存在
					and
					BuffTime_BJZL<GCD+MaxGCD	--不洁之力 BUFF时间<一个技能GCD
				)
				or
				(
					BuffTime_DLZH>GCD	--断裂之痕(377103) BUFF存在
					and
					BuffTime_DLZH<GCD+MaxGCD	--断裂之痕(377103) BUFF时间<一个技能GCD
				)
			)
			and
			(
				WR_GetUnitDebuffCount("target","锋锐之霜")==5	--锋锐之霜 DEBUFF层数==5
				or
				(
					not WR_DeathKnightFrost_FWRZ(3370) --符文熔铸 冰峰符文 不存在
					and
					not IsPlayerSpell(194913)	--没学 冰川突进
				)
				or
				IsPlayerSpell(207057)	--已学 破碎之刃
			)
		)
	)
	then
		if WR_ColorFrame_Show("CSK","冰龙C1") then return true end
	end

	--亡者C1
	if zhandoumoshi==1 --开爆发
	and WR_SpellUsable("亡者复生") --技能可用 资源可用
	and TargetRange<=30 --单位距离
	then
		if WR_ColorFrame_Show("CF9","亡者C1") then return true end
	end

	--收割C1
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("灵魂收割") --技能可用 资源可用
	and UnitHealth("target")/UnitHealthMax("target")<=0.35 --目标血量比例<35%
	and WR_GetUnitDeathTime("target")>5	--目标死亡时间>5
	and HUCountRange5<=1	--敌人数量<=1
	and
	(
		IsPlayerSpell(49020) --已学 湮灭
		and
		(
			(
				BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
				and
				BuffTime_SLJQ<=GCD	--杀戮机器 BUFF不存在
				and
				Runes>2 --符文数量>2
			)
			or
			BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
			or
			(
				BuffCount_SLJQ<2	--杀戮机器 BUFF层数<2
				and
				WR_GetUnitBuffTime("player","破灭")<=GCD	--破灭 BUFF不存在
				and
				BuffTime_BSZZ<GCD+MaxGCD	--冰霜之柱 BUFF时间<一个技能GCD
			)
		)
		or
		(
			IsPlayerSpell(152279)	--已学 冰龙吐息
			and
			(
				(
					WR_GetUnitBuffTime("player","冰龙吐息")>GCD	--冰龙吐息 BUFF存在
					and
					RunicPower>50	--符文能量>50
				)
				or
				WR_GetUnitBuffTime("player","冰龙吐息")<=GCD	--冰龙吐息 BUFF不存在
			)
		)
		or
		(
			not IsPlayerSpell(152279)	--没学 冰龙吐息
			and
			not IsPlayerSpell(49020)	--没学 湮灭
		)
	)
	then
		if WR_ColorFrame_Show("SF4","收割C1") then return true end
	end

	--凋零C1
	if GCD<=ShiFaSuDu
	and WRSet.BS_KWDL==1 --枯萎凋零 开启
	and TargetCloseRange	--目标在近战范围内
	and not WR_PlayerMove() --玩家 没有移动
	and WR_SpellUsable("枯萎凋零") --技能可用 资源可用
	and WR_GetUnitBuffTime("player","枯萎凋零")==0 --枯萎凋零 BUFF不存在
	and
	(
		(
			BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
			and
			BuffTime_SLJQ<=GCD	--杀戮机器 BUFF存在
			and
			(
				IsPlayerSpell(377190)--已学 历久弥坚
				or
				BuffTime_BSZZ>5	--冰霜之柱 BUFF时间>5
			)
		)
		or
		(
			BuffTime_BSZZ<=GCD	--冰霜之柱 BUFF不存在
			and
			(
				WR_GetSpellCharges("枯萎凋零")==2	--枯萎凋零 可用次数=2
				or
				WR_GetGCD("冰霜之柱")>WR_GetSpellNextCharge("枯萎凋零")	--冰霜之柱 冷却时间>枯萎凋零 冷却时间
				or
				(
					not IsPlayerSpell(456240)	--没学 漫漫严冬
					and
					WR_GetGCD("冰霜之柱")<GCD+MaxGCD*2	--冰霜之柱 冷却时间<两个公共冷却时间
				)
			)
		)
	)
	and
	(
		HUCountRange5>5	--敌人数量>5
		or
		(
			IsPlayerSpell(316916)	--已学 顺劈打击
			and
			HUCountRange5>=2	--敌人数量>=2
		)
	)
	then
		if WR_ColorFrame_Show("SF12","凋零C1") then return true end
	end

	if WR_GetUnitBuffTime("player","冰龙吐息")>GCD then	--冰龙吐息 BUFF存在
		--凛风B1
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and
		(
			(
				WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
				and
				WR_DeathKnightFrost_BaiShuangBuff()	--白霜增益BUFF
				and
				RunicPower>60	--符文能量>60
			)
			or
			WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CSJ","凛风B1") then return true end
		end

		--号角B1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_SpellUsable("寒冬号角") --技能可用 资源可用
		and Runes<2 --符文数量<2
		and RunicPower<70	--符文能量<70
		and
		(
			WR_GetUnitBuffTime("player","符文武器增效")==0 --BUFF 不存在
			or
			RunicPower<21	--符文能量<21
		)
		then
			if WR_ColorFrame_Show("CF12","号角B1") then return true end
		end

		--湮灭
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and
		(
			BuffTime_SLJQ>GCD	--杀戮机器 BUFF存在
			or
			RunicPower<80	--符文能量<80
		)
		then
			if WR_ColorFrame_Show("SF10","湮灭B1") then return true end
		end
		
		--凛风B2
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
		then
			if WR_ColorFrame_Show("CSJ","凛风B2") then return true end
		end
	end

	if IsPlayerSpell(49020) --已学 湮灭
	and BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
	and WR_GetUnitBuffTime("player","冰龙吐息")<=GCD	--冰龙吐息 BUFF不存在
	then
		--湮灭Y1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and WR_GetUnitDebuffInfo("target","死神印记",true)==0	--目标身上没有我的 死神印记 DEBUFF
		and BuffTime_SLJQ>GCD	--杀戮机器 BUFF存在
		and
		(
			WR_GetUnitBuffTime("player","破灭")>GCD	--破灭 BUFF存在
			or
			AvgDeathTime<GCD+MaxGCD*2	--战斗剩余时间<两个公共冷却时间
		)
		then
			if WR_ColorFrame_Show("SF10","湮灭Y1") then return true end
		end
	
		--凛风Y1
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and BuffCount_SLJQ<2	--杀戮机器 BUFF层数<2
		and
		(
			BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
			and
			BuffTime_BSZZ<GCD+MaxGCD	--冰霜之柱 BUFF时间<一个技能GCD
		)
		and
		WR_DeathKnightFrost_BaiShuangBuff()	--白霜增益BUFF
		then
			if WR_ColorFrame_Show("CSJ","凛风Y1") then return true end
		end
	
		--冰打Y1
		if GCD<=ShiFaSuDu
		and BuffCount_SLJQ<2	--杀戮机器 BUFF层数<2
		and
		(
			BuffTime_BSZZ>GCD	--冰霜之柱 BUFF存在
			and
			BuffTime_BSZZ<GCD+MaxGCD	--冰霜之柱 BUFF时间<一个技能GCD
		)
		and WR_GetUnitBuffTime("player","枯萎凋零")==0 --枯萎凋零 BUFF不存在
		then
			if WR_DeathKnightFrost_BSDJ_Function("Y1") then return true end
		end
		
		--湮灭Y2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and BuffTime_SLJQ>GCD --杀戮机器 BUFF存在
		then
			if WR_ColorFrame_Show("SF10","湮灭Y2") then return true end
		end
	
		--凛风Y2
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
		and BuffTime_SLJQ<=GCD	--杀戮机器 BUFF不存在
		then
			if WR_ColorFrame_Show("CSJ","凛风Y2") then return true end
		end
		
		--冰打Y2
		if GCD<=ShiFaSuDu
		and
		(
			Runes<2	--符文数量<2
			or
			WR_DeathKnightFrost_RunicPowerBuff()	--符文能量增益BUFF
			or
			(
				WR_GetUnitDebuffCount("target","锋锐之霜",true)==5	--锋锐之霜 BUFF层数==5
				and
				IsPlayerSpell(207057)	--已学 破碎之刃
			)
			or
			IsPlayerSpell(444005)	--已学 [冠军骑士]天启骑士
		)
		and
		not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		and
		(
			not IsPlayerSpell(194913)	--没学 冰川突进
			or
			HUCountRange5==1	--敌人数量=1
			or
			IsPlayerSpell(455993)	--已学 粉碎冰霜
		)
		then
			if WR_DeathKnightFrost_BSDJ_Function("Y2") then return true end
		end
		
		--凛风Y3
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
		then
			if WR_ColorFrame_Show("CSJ","凛风Y3") then return true end
		end
		
		--冰打Y3
		if GCD<=ShiFaSuDu
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		and
		(
			not IsPlayerSpell(194913)	--没学 冰川突进
			or
			HUCountRange5==1	--敌人数量=1
			or
			IsPlayerSpell(455993)	--已学 粉碎冰霜
		)
		then
			if WR_DeathKnightFrost_BSDJ_Function("Y3") then return true end
		end
	
		--号角Y1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_SpellUsable("寒冬号角") --技能可用 资源可用
		and Runes<3 --符文数量<3
		then
			if WR_ColorFrame_Show("CF12","号角Y1") then return true end
		end
	
		--凛风Y4
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and BuffTime_SLJQ<=GCD	--杀戮机器 BUFF不存在
		then
			if WR_ColorFrame_Show("CSJ","凛风Y4") then return true end
		end

	end


	if HUCountRange5>=2 then
		--湮灭A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and BuffTime_SLJQ>GCD	--杀戮机器 BUFF存在
		and	IsPlayerSpell(316916)	--已学 顺劈打击
		and	WR_GetUnitBuffTime("player","枯萎凋零")>GCD	--枯萎凋零 BUFF存在
		then
			if WR_ColorFrame_Show("SF10","湮灭A1") then return true end
		end

		--凛风A1
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
		then
			if WR_ColorFrame_Show("CSJ","凛风A1") then return true end
		end
		
		--冰打A1
		if GCD<=ShiFaSuDu
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		and IsPlayerSpell(207057)	--已学 破碎之刃
		and
		(
			IsPlayerSpell(455993)	--已学 粉碎冰霜
			or
			HUCountRange5<4	--敌人数量<4
		)
		then
			if WR_DeathKnightFrost_BSDJ_Function("A1") then return true end
		end
		
		--凛风A2
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
		then
			if WR_ColorFrame_Show("CSJ","凛风A2") then return true end
		end
		
		--湮灭A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("SF10","湮灭A1") then return true end
		end
		
		--冰打A2
		if GCD<=ShiFaSuDu
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		then
			if WR_DeathKnightFrost_BSDJ_Function("A2") then return true end
		end
		
		--号角A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_SpellUsable("寒冬号角") --技能可用 资源可用
		and Runes<2 --符文数量<2
		and RunicPower<75	--符文能量<75
		and
		(
			not IsPlayerSpell(152279)	--没学 冰龙吐息
			or
			math.max(WR_GetGCD("冰龙吐息"),WR_GetGCD("冰霜之柱"))>WR_GetGCD("寒冬号角")-15
		)
		then
			if WR_ColorFrame_Show("CF12","号角A1") then return true end
		end
	else
		--湮灭S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and
		(
			BuffCount_SLJQ>=2	--杀戮机器 BUFF层数>=2
			or
			WR_GetUnitBuffTime("player","破灭")>GCD	--破灭 BUFF存在
		)
		then
			if WR_ColorFrame_Show("SF10","湮灭S1") then return true end
		end

		--号角S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_SpellUsable("寒冬号角") --技能可用 资源可用
		and
		(
			not IsPlayerSpell(152279)	--没学 冰龙吐息
			or
			math.max(WR_GetGCD("冰龙吐息"),WR_GetGCD("冰霜之柱"))>WR_GetGCD("寒冬号角")-15
		)
		and
		WR_GetGCD("冰霜之柱")<10
		then
			if WR_ColorFrame_Show("CF12","号角S1") then return true end
		end

		--冰打S1
		if GCD<=ShiFaSuDu
		and
		(
			(
				WR_GetUnitDebuffCount("target","锋锐之霜",true)==5	--锋锐之霜 BUFF层数==5
				and
				IsPlayerSpell(207057)	--已学 破碎之刃
			)
			or
			(
				Runes<2 --符文数量<2
				and
				not IsPlayerSpell(392950)	--没学 破冰
			)
		)
		then
			if WR_DeathKnightFrost_BSDJ_Function("S1") then return true end
		end

		--凛风S1
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_DeathKnightFrost_BaiShuangBuff()	--白霜增益BUFF
		then
			if WR_ColorFrame_Show("CSJ","凛风S1") then return true end
		end
		
		--湮灭S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and BuffTime_SLJQ>GCD --杀戮机器 BUFF存在
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		then
			if WR_ColorFrame_Show("SF10","湮灭S2") then return true end
		end
		
		--冰打S2
		if GCD<=ShiFaSuDu
		and
		not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		and
		(
			WR_DeathKnightFrost_RunicPowerBuff()	--符文能量增益BUFF
			or
			(
				not IsPlayerSpell(207057)	--没学 破碎之刃
				and
				RunicPower>80	--符文能量>80
			)
		)
		then
			if WR_DeathKnightFrost_BSDJ_Function("S2") then return true end
		end
		
		--凛风S2
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
		then
			if WR_ColorFrame_Show("CSJ","凛风S2") then return true end
		end
		
		--冰打S3
		if GCD<=ShiFaSuDu
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		and WR_MainWeapon()=="单手武器"
		and not IsPlayerSpell(207057)	--没学 破碎之刃
		then
			if WR_DeathKnightFrost_BSDJ_Function("S3") then return true end
		end
		
		--湮灭S3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("湮灭") --技能可用 资源可用
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		then
			if WR_ColorFrame_Show("SF10","湮灭S3") then return true end
		end
		
		--冰打S4
		if GCD<=ShiFaSuDu
		and not WR_DeathKnightFrost_YM_YLNL()	--不需要预留能量
		then
			if WR_DeathKnightFrost_BSDJ_Function("S4") then return true end
		end
		
		--凛风S3
		if GCD<=ShiFaSuDu
		and TargetRange<=30 --单位距离
		and WR_SpellUsable("凛风冲击") --技能可用 资源可用
		and WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
		then
			if WR_ColorFrame_Show("CSJ","凛风S3") then return true end
		end
		
		--凋零S1
		if GCD<=ShiFaSuDu
		and WRSet.BS_KWDL==1 --枯萎凋零 开启
		and TargetCloseRange	--目标在近战范围内
		and not WR_PlayerMove() --玩家 没有移动
		and WR_SpellUsable("枯萎凋零") --技能可用 资源可用
		and IsPlayerSpell(152279)	--已学 冰龙吐息
		and BuffTime_BLTX<=GCD	--冰龙吐息 BUFF不存在
		and WR_GetGCD("冰龙吐息")<=GCD
		and WR_GetGCD("冰霜之柱")<=GCD
		and Runes<2 --符文数量<2
		and WR_GetUnitBuffTime("player","枯萎凋零")==0 --枯萎凋零 BUFF不存在
		then
			if WR_ColorFrame_Show("SF12","凋零S1") then return true end
		end
		
		--号角S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_SpellUsable("寒冬号角") --技能可用 资源可用
		and Runes<2 --符文数量<2
		and RunicPower<75	--符文能量<75
		and
		(
			not IsPlayerSpell(152279)	--没学 冰龙吐息
			or
			math.max(WR_GetGCD("冰龙吐息"),WR_GetGCD("冰霜之柱"))>WR_GetGCD("寒冬号角")-15
		)
		then
			if WR_ColorFrame_Show("CF12","号角S2") then return true end
		end
	end

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

--灵界打击 技能条件
function WR_DeathKnightFrost_LJDJ()
	if GCD<=ShiFaSuDu
	and WRSet.BS_LJDJ~=6 --灵界打击 开启
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

--冰霜打击
function WR_DeathKnightFrost_BSDJ(Unit,Text)
	if WR_SpellUsable("冰霜打击") --技能可用 资源可用
	and C_Spell.IsSpellInRange("冰霜打击",Unit)	--单位在技能范围内
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF11",(Text or "") .. "冰打T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("SF2",(Text or "") .. "冰打M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("SF3",(Text or "") .. "冰打F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF5",(Text or "") .. "冰打P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF8",(Text or "") .. "冰打P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF7",(Text or "") .. "冰打P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF8",(Text or "") .. "冰打P4T") then return true end
		end
	end
	return false
end

--冰霜打击
function WR_DeathKnightFrost_BSDJ_Function(Text)
	if GCD>ShiFaSuDu then return false end	--冷却时间>施法速度

	if WR_GetUnitDebuffCount("mouseover","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("mouseover",Text) then return true end
	end
	if WR_GetUnitDebuffCount("focus","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("focus",Text) then return true end
	end
	for i = 1 , 4 do
		if WR_GetUnitDebuffCount("party"..i.."targer","锋锐之霜",true)>=5 then
			if WR_DeathKnightFrost_BSDJ("party"..i.."targer",Text) then return true end
		end
	end
	if WR_GetUnitDebuffCount("target","锋锐之霜",true)>=5 then
		if WR_DeathKnightFrost_BSDJ("target",Text) then return true end
	end
	
	if Text~="A1" then
		if WR_DeathKnightFrost_BSDJ("target",Text) then return true end
	end
	return false
end

--符文熔铸 判断是否有某个符文熔铸
function WR_DeathKnightFrost_FWRZ(ID)
	if
	(
		GetInventoryItemLink("player", 16)~=nil
		and
		select(2, strsplit(":", GetInventoryItemLink("player", 16)))==ID
	)
	or
	(
		GetInventoryItemLink("player", 17)~=nil
		and
		select(2, strsplit(":", GetInventoryItemLink("player", 17)))==ID
	)
	then
		return true
	end
	return false
end

--符文能量增益BUFF
function WR_DeathKnightFrost_RunicPowerBuff()
	local ZXGS=0
	if IsPlayerSpell(435005) then ZXGS=1 end	--已学 窒息攻势
	local HAZZ=0
	if IsPlayerSpell(436687) then HAZZ=1 end	--已学 黑暗之爪
	
	if
	(
		IsPlayerSpell(376905) --已学 狂乱释放
		and
		(
			WR_GetUnitBuffTime("player","狂乱释放")<GCD+MaxGCD*3	--狂乱释放 BUFF时间<3个公共冷却时间
			or
			WR_GetUnitBuffCount("player","狂乱释放")<3	--狂乱释放 BUFF层数<3
		)
	)
	or
	(
		IsPlayerSpell(194878) --已学 冰冷之爪
		and
		(
			BuffTime_BLZZ<GCD+MaxGCD*3	--冰冷之爪 BUFF时间<3个公共冷却时间
			or
			BuffCount_BLZZ<(3+(2*ZXGS)+(2*HAZZ))	--冰冷之爪 层数
		)
	)
	then
		return true
	end
	
	return false
end

--白霜增益BUFF
function WR_DeathKnightFrost_BaiShuangBuff()
	if WR_GetUnitBuffTime("player","白霜")>GCD	--白霜 BUFF存在
	and
	(
		WR_GetUnitDebuffInfo("target","冰霜疫病",true)<GCD	--冰霜疫病 DEBUFF不存在
		or
		IsPlayerSpell(377076)	--已学 冰封勇士之怒
		or
		IsPlayerSpell(392950)	--已学 破冰
		or
		(
			IsPlayerSpell(207142)	--已学 雪崩
			and
			not IsPlayerSpell(456230)	--没学 极地突袭
			and
			WR_GetUnitDebuffCount("target","锋锐之霜")<5	--锋锐之霜 DEBUFF层数<5
		)
	)
	then
		return true
	end
	
	return false
end

--湮灭天赋预留能量
function WR_DeathKnightFrost_YM_YLNL()
	if zhandoumoshi==1	--爆发开启
	and IsPlayerSpell(49020)	--已学 湮灭
	and RunicPower<35	--符文能量
	and WR_GetGCD("冰霜之柱")<10	--冰霜之柱 冷却时间<10秒
	then
		return true
	end
	
	return false
end
