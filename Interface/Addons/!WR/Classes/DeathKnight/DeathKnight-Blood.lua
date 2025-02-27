--血DK运行库
function WR_DeathKnightBlood()
	if GetSpecialization()~=1 then	--如果不是鲜血(1)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		WR_DeathKnight_ErrorMessage()	--错误收集
		ShiFaSuDu=0.05+WRSet.XX_SFSD*0.05
		
		GCD=WR_GetGCD("灵界打击")	--获得当前公共CD
		GCD_Max=WR_GetMaxGCD(1.5)	--最大GCD
		GCD_Next=GCD+WR_GetMaxLatency()	--获得下一个技能时间
		
		Runes=WR_GetRuneCount()	--可用符文数量
		RunicPower=UnitPower("player",6)	--符文能量
		RaidOrParty=WR_GetInRaidOrParty()	--判断实在团队还是小队
		
		PlayerHP=UnitHealth("player")/UnitHealthMax("player")
		
		TargetCloseRange = C_Spell.IsSpellInRange("灵界打击","target") or C_Spell.IsSpellInRange("心脏打击","target")
		TargetRange=WR_GetUnitRange("target")	--获得目标距离
		HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得5码内的敌人数量
		HUCountRange8=WR_GetRangeHarmUnitCount(8,false)	--获得8码内的敌人数量
		BuffTime_BGZD,BuffCount_BGZD,_=WR_GetUnitBuffInfo("player","白骨之盾")	--获得 白骨之盾 BUFF信息
		SmallMagicTime,BigMagicTime,SmallPhysicalTime,BigPhysicalTime=WR_TankResist()	--坦克减伤,返回值,小法术时间,大法术时间,小物理时间,大物理时间
		WR_GetTime_AURA_APPLIED()	--获取光环触发时间 返回值WR_AURA_APPLIED_TIME_451568
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.XX_ZNJD) then return end	--智能焦点
	
	if WR_DeathKnightBlood_Function_JS() then return end	--施法过程 减伤
	
	if WRSet.XX_SP1>=3 then
		if WR_ShiPin(1,WRSet.XX_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.XX_SP2>=3 then
		if WR_ShiPin(2,WRSet.XX_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_DeathKnight_Function_ZLS() then return end	--施法过程 治疗石
	
	if WR_DeathKnight_Function_ZLYS() then return end	--施法过程 治疗药水
	
	if WR_DeathKnight_Function_FMFHZ() then return end	--施法过程 反魔法护罩

	if WR_DeathKnight_Function_ZN() then return end	--施法过程 心灵冰冻

	if WR_DeathKnight_Function_FHMY() then return end	--施法过程 复活盟友

	if WR_DeathKnightBlood_Function_SWJB() then return end	--施法过程 死亡脚步

	if WR_DeathKnight_Function_ZMBY() then return end	--施法过程 致盲冰雨
	
	if WR_DeathKnight_Function_ZX() then return end	--施法过程 窒息

	if WR_DeathKnight_Function_KZWL() then return end	--施法过程 控制亡灵
	
	if WR_DeathKnightBlood_Function_Combat() then return end	--施法过程 战斗
	
	if WR_DeathKnight_Function_ZNMB() then return end	--施法过程 智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
end


--施法过程 减伤
function WR_DeathKnightBlood_Function_JS()
	if UnitAffectingCombat("player") --单位战斗中
	and WR_GetUnitBuffTime("player","巫妖之躯")==0 --巫妖之躯 BUFF不存在
	and WR_GetUnitBuffTime("player","冰封之韧")==0 --冰封之韧 BUFF不存在
	and WR_GetUnitBuffTime("player","吸血鬼之血")==0 --吸血鬼之血 BUFF不存在
	and WR_GetUnitBuffTime("player","折转抵抗")==0 --折转抵抗 BUFF不存在
	and
	(
		PlayerHP<0.4 --血量比例
		or
		(
			WRSet.XX_QZJS	--前置减伤 开启
			and
			(
				(
					BigMagicTime<=1.5 --大法术减伤时间
					and
					WR_GetUnitBuffTime("player","反魔法护罩")==0 --反魔法护罩 BUFF不存在
				)
				or
				BigPhysicalTime<=1.5 --大物理减伤时间
			)
		)
	)
	then
		
		if WRSet.XX_XXGZX==1 --吸血鬼之血 开启
		and WR_SpellUsable("吸血鬼之血") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF3","吸血鬼之血") then return true end
		end
		
		if WRSet.XX_WYZQ==1 --巫妖之躯 开启
		and WR_SpellUsable("巫妖之躯") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF2","巫妖之躯") then return true end
		end
		
		if WRSet.XX_BFZR==1 --冰封之韧 开启
		and WR_SpellUsable("冰封之韧") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF1","冰封之韧") then return true end
		end
		
		if (GetInventoryItemID("player", 13)==219315 or GetInventoryItemID("player", 14)==219315) --已经装备 [折转侵攻模组]
		and WR_SpellUsable("黑暗命令") --技能可用 资源可用
		then
			if WR_AURA_APPLIED_TIME_451568==nil or GetTime()-WR_AURA_APPLIED_TIME_451568>60 then
			--折转抵抗 BUFF没触发过 或者 触发时间已经过去60秒
			if WR_ColorFrame_Show("SF11","黑暗命令") then return true end
			end
		end
	end
	
	if WR_SpellUsable("符文分流") --技能可用 资源可用
	and WR_GetUnitBuffTime("player","符文分流")==0 --符文分流 BUFF不存在
	and
	(
		(
			HUCountRange8>=1 --8码内有敌人
			and
			not WR_InTraining() --没打木桩
			and
			not WR_InBossCombat() --没有与BOSS战斗
			and
			WR_GetSpellCharges("符文分流")==2 --符文分流可使用次数=2
		)
		or
		SmallMagicTime<=1.5 --小法术减伤时间
		or
		BigMagicTime<=1.5 --大法术减伤时间
		or
		SmallPhysicalTime<=1.5 --小物理减伤时间
		or
		BigPhysicalTime<=1.5 --大物理减伤时间
	)
	then
		if WR_ColorFrame_Show("SF10","符文分流") then return true end
	end
	
	return false
end

--死亡脚步
function WR_DeathKnightBlood_Function_SWJB()
	local SWJB_SpellName={[1]="Null Upheaval",[2]="宇宙奇点",[3]="暗焰之锄",[4]="黏稠黑暗",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",}
	if WR_SpellUsable("死亡脚步") --技能可用 资源可用
	and WR_GetUnitBuffTime("player","死亡脚步")==0 --死亡脚步 BUFF不存在
	and WR_GetRangeSpellTime(45,SWJB_SpellName)<=5 --有击飞技能
	then
		if WR_ColorFrame_Show("SF9","死亡脚步") then return true end
	end
	return false
end



--施法过程 战斗
function WR_DeathKnightBlood_Function_Combat()
	if WRSet.XX_NotADD	--防ADD开启
	and not WR_TargetInCombat("target")	--目标没有战斗中
	then
		return false
	end
	
	if TargetCloseRange then
		if WRSet.XX_SP1<=2 then
			if WR_ShiPin(1,WRSet.XX_SP1) then return true end	--饰品 常驻/爆发
		end
		if WRSet.XX_SP2<=2 then
			if WR_ShiPin(2,WRSet.XX_SP2) then return true end	--饰品 常驻/爆发
		end
	end
	
	--亡者复生
	if zhandoumoshi==1 --爆发 开启
	and WR_SpellUsable("亡者复生") --技能可用 资源可用
	and TargetRange<=30 --单位距离
	and not UnitExists("pet") --宠物不存在
	then
		if WR_ColorFrame_Show("CF9","亡者复生") then return true end
	end
	
	if GCD<=ShiFaSuDu then
		
		--灵打回血
		if TargetCloseRange	--目标在近战范围内
		and PlayerHP<=0.6 --玩家血量<=设定值
		and WR_SpellUsable("灵界打击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF10","灵打回血") then return true end
		end
		
		--死神印记
		if zhandoumoshi==1 --爆发模式 开启
		and IsPlayerSpell(439843)	--已学 死神印记
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("死神印记") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("SF6","死神印记") then return true end
		end
		
		--死神的抚摩
		if WR_SpellUsable("死神的抚摩") --技能可用 资源可用
		and TargetRange<=30 --单位距离
		and
		(
			BuffTime_BGZD<=GCD_Next --白骨之盾 BUFF时间<=下一个技能的时间
			or
			(
				not UnitAffectingCombat("player") --玩家没有战斗
				and
				TargetRange>=8 --目标距离>=8
			)
		)
		then
			if WR_ColorFrame_Show("CF11","死神的抚摩") then return true end
		end
		
		--吸血鬼打击
		if TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("吸血鬼打击") --技能可用 资源可用
		and IsSpellOverlayed(433895)	--吸血鬼打击 技能激活
		and RunicPower<=100 --符文能量<=100
		then
			if WR_ColorFrame_Show("SF3","吸血鬼打击") then return true end
		end
		
		--枯萎凋零
		if WR_SpellUsable("枯萎凋零") --技能可用 资源可用
		and (ErrorMessageTime_CantHere==nil or GetTime()-ErrorMessageTime_CantHere>1)	--错误事件发生1秒后再尝试
		and TargetCloseRange	--目标在近战范围内
		and GetUnitSpeed("player")<5 --移动速度<5，通常是在倒退或者停止移动
		and WR_GetUnitBuffTime("player","枯萎凋零")<GCD_Next --枯萎凋零 BUFF剩余时间<=下一个技能时间
		and
		(
			WR_GetUnitBuffTime("player","赤色天灾")>=GCD_Next --赤色天灾 BUFF存在
			or
			zhandoumoshi==1 --爆发 开启
			or
			(
				WR_GetSpellCharges("枯萎凋零")==2 --技能可用次数
				and
				GetUnitSpeed("player")==0 --没有移动
			)
		)
		then
			if WR_ColorFrame_Show("SF12","枯萎凋零") then return true end
		end
		
		--灵界打击
		if TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("灵界打击") --技能可用 资源可用
		and
		(
			(
				WR_GetUnitBuffTime("player","凝血")>0 --凝血 BUFF存在
				and
				WR_GetUnitBuffTime("player","凝血")<=GCD_Next+GCD_Max --凝血 BUFF时间<=下一个技能时间+公共冷却最大值
			)
			or
			(
				WR_GetUnitBuffTime("player","冰冷之爪")>0 --冰冷之爪 BUFF存在
				and
				WR_GetUnitBuffTime("player","冰冷之爪")<=GCD_Next+GCD_Max --冰冷之爪 BUFF时间<=下一个技能时间+公共冷却最大值
			)
			or
			RunicPower>=80 --符文能量>=80
		)
		then
			if WR_ColorFrame_Show("CF10","灵界打击") then return true end
		end
		
		--符文刃舞
		if zhandoumoshi==1 --爆发模式 开启
		and WR_SpellUsable("符文刃舞") --技能可用 资源可用
		and TargetRange<=10 --目标距离
		then
			if WR_ColorFrame_Show("CF12","符文刃舞") then return true end
		end
		
		--符文刃舞期间
		if WR_GetUnitBuffTime("player","符文刃舞")>=GCD_Next then --符文刃舞 BUFF存在
			--刃舞墓石
			if TargetCloseRange	--目标在近战范围内
			and BuffCount_BGZD>=5 --白骨之盾 BUFF层数>=5
			and Runes>=2 --符文数量>=2
			and RunicPower<=95 --符文能量<=95
			and WR_SpellUsable("墓石") --技能可用 资源可用
			and WR_GetUnitBuffTime("player","枯萎凋零")>=GCD_Next --枯萎凋零 BUFF存在
			then
				if WR_ColorFrame_Show("SF1","刃舞墓石") then return true end
			end
			
			--精髓分裂
			if WR_SpellUsable("精髓分裂") --技能可用 资源可用
			and TargetCloseRange	--目标在近战范围内
			and
			(
				BuffTime_BGZD<=4 --白骨之盾 BUFF时间<=4
				or
				BuffCount_BGZD<4 --白骨之盾 BUFF层数<4
				or
				WR_GetUnitBuffTime("player","破灭")>GCD	--破灭 BUFF存在
			)
			and
			RunicPower<105 --符文能量<105
			then
				if WR_ColorFrame_Show("SF5","刃舞精髓") then return true end
			end
			
			--灵魂收割
			local TargetDeathTime=WR_GetUnitDeathTime("target") --目标死亡时间
			if WR_SpellUsable("灵魂收割")
			--技能可用 资源可用
			and TargetCloseRange	--目标在近战范围内
			and HUCountRange8==1 --8码敌人数量=1
			and TargetDeathTime>5+3 --目标死亡时间>5+3
			and
			(
				UnitHealth("target")/UnitHealthMax("target")<=0.40 --目标血量比例<40%
				or
				TargetDeathTime<15+3 --目标死亡时间<15+3
			)
			then
				if WR_ColorFrame_Show("SF4","刃舞收割") then return true end
			end
			
			--白骨风暴
			if zhandoumoshi==1 --爆发模式 开启
			and WR_SpellUsable("白骨风暴") --技能可用 资源可用
			and TargetCloseRange	--目标在近战范围内
			and BuffCount_BGZD>=5 --白骨之盾 BUFF层数>=5
			and WR_GetUnitBuffTime("player","枯萎凋零")>=GCD_Next --枯萎凋零 BUFF存在
			then
				if WR_ColorFrame_Show("SF8","刃舞风暴") then return true end
			end
		
			--血液沸腾
			if WR_SpellUsable("血液沸腾") --技能可用 资源可用
			and HUCountRange8>2 --8码敌人数量>2
			then
				if WR_ColorFrame_Show("SF2","刃舞沸腾") then return true end
			end

			--吞噬
			if zhandoumoshi==1 --爆发模式 开启
			and TargetCloseRange	--目标在近战范围内
			and WR_SpellUsable("吞噬") --技能可用 资源可用
			then
				if WR_ColorFrame_Show("SF7","刃舞吞噬") then return true end
			end

			--心脏打击
			if WR_SpellUsable("心脏打击") --技能可用 资源可用
			and TargetCloseRange	--目标在近战范围内
			and
			(
				Runes>=2 --符文数量>=2
				or
				RunicPower<=100 --符文能量<=100
			)
			then
				if WR_ColorFrame_Show("SF3","刃舞心打") then return true end
			end
		end
		
		--墓石
		if zhandoumoshi==1 --爆发模式 开启
		and TargetCloseRange	--目标在近战范围内
		and BuffCount_BGZD>=5 --白骨之盾 BUFF层数>=5
		and Runes>=2 --符文数量>=2
		and RunicPower<=95 --符文能量<=95
		and WR_SpellUsable("墓石") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","枯萎凋零")>=GCD_Next --枯萎凋零 BUFF存在
		and WR_GetGCD("符文刃舞")>=25 --符文刃舞CD>=25秒
		then
			if WR_ColorFrame_Show("SF1","墓石") then return true end
		end
		
		--精髓分裂
		if WR_SpellUsable("精髓分裂") --技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		and RunicPower<105 --符文能量<105
		and
		(
			(
				(
					BuffTime_BGZD<=4 --白骨之盾 BUFF时间<=4
					or
					BuffCount_BGZD<4 --白骨之盾 BUFF层数<4
				)
				and
				(
					zhandoumoshi~=1	--爆发关闭
					or
					WR_GetGCD("符文刃舞")>BuffTime_BGZD	--符文刃舞冷却时间>白骨之盾 BUFF时间
				)
			)
			or
			WR_GetUnitBuffTime("player","破灭")>GCD	--破灭 BUFF存在
		)
		then
			if WR_ColorFrame_Show("SF5","精髓分裂") then return true end
		end
		
		--吞噬
		if zhandoumoshi==1 --爆发模式 开启
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("吞噬") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("SF7","吞噬") then return true end
		end

		--灵魂收割
		local TargetDeathTime=WR_GetUnitDeathTime("target") --目标死亡时间
		if WR_SpellUsable("灵魂收割")
		--技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		and HUCountRange8==1 --8码敌人数量=1
		and TargetDeathTime>5+3 --目标死亡时间>5+3
		and
		(
			UnitHealth("target")/UnitHealthMax("target")<=0.40 --目标血量比例<40%
			or
			TargetDeathTime<15+3 --目标死亡时间<15+3
		)
		then
			if WR_ColorFrame_Show("SF4","灵魂收割") then return true end
		end

		--白骨风暴
		if zhandoumoshi==1 --爆发模式 开启
		and WR_SpellUsable("白骨风暴") --技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		and BuffCount_BGZD>=5 --白骨之盾 BUFF层数>=5
		and WR_GetUnitBuffTime("player","枯萎凋零")>=GCD_Next --枯萎凋零 BUFF存在
		then
			if WR_ColorFrame_Show("SF8","白骨风暴") then return true end
		end
		
		--血液沸腾
		if WR_SpellUsable("血液沸腾") --技能可用 资源可用
		and HUCountRange8>2 --8码敌人数量>2
		and
		(
			WR_GetSpellCharges("血液沸腾")==2 --技能可用次数
			or
			WR_GetSpellNextCharge("血液沸腾")<=GCD_Next+GCD_Max --血液沸腾 充能时间<=下一个技能时间+公共冷却最大值
		)
		then
			if WR_ColorFrame_Show("SF2","血液沸腾") then return true end
		end
		
		--心脏打击
		if WR_SpellUsable("心脏打击") --技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		and Runes>=4 --符文数量>=4
		then
			if WR_ColorFrame_Show("SF3","心脏打击") then return true end
		end
		
		--血液沸腾
		if WR_SpellUsable("血液沸腾") --技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		then
			if WR_ColorFrame_Show("SF2","血液沸腾") then return true end
		end
		
		--心脏打击
		if WR_SpellUsable("心脏打击") --技能可用 资源可用
		and TargetCloseRange	--目标在近战范围内
		and Runes>=2 --符文数量>=2
		and
		(
			Runes>=3 --符文数量>=3
			or
			BuffCount_BGZD>7 --白骨之盾 BUFF层数>7
		)
		then
			if WR_ColorFrame_Show("SF3","心脏打击") then return true end
		end
	end
	
	return false
end
