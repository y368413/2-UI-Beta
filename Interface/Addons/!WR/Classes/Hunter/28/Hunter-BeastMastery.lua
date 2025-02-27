--兽王运行库
function WR_HunterBeastMastery()
	if GetSpecialization()~=1 then	--如果不是兽王(1)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.1	--初始化施法速度
		WR_Initialize()	--初始化
		WR_Hunter_ErrorMessage() --战斗错误事件
		
		GCD=WR_GetGCD("鹰眼术")	--获得公共冷却剩余时间或者当前施法剩余时间
		MaxGCD=WR_GetMaxGCD(1.5)	--获得当前最大公共CD(基础GCD)
		MaxLatency=WR_GetMaxLatency()	--获得当前最大网络延时
		if MaxLatency > 0.25 then
			Latency=0.25
		else
			Latency=MaxLatency
		end
		
		BuffTime_KuangBao,BuffCount_KuangBao,BuffSum_KuangBao=WR_GetUnitBuffInfo("pet",272790)	--获得宠物的狂暴buff剩余时间
		BuffTime_YeShouShunPi,BuffCount_YeShouShunPi,BuffSum_YeShouShunPi=WR_GetUnitBuffInfo("pet",118455)	--获得宠物的野兽顺劈buff剩余时间
		BuffTime_ZS,BuffCount_ZS,BuffSum_ZS=WR_GetUnitBuffInfo("pet","装死")	--获得 装死 Buff信息
		
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		FocusPower=UnitPower("player",2)	--获取当前集中值
		HunterFPS=10+GetHaste()/10	--获得每秒恢复集中值
		
		Training=WR_InTraining() --获得是否在打木桩
		PartyInCombat=WR_PartyInCombat() --队友在战斗中

		TargetInRange40=IsSpellInRange("奥术射击","target") --当前目标是否在技能范围内
		TargetInCombat=WR_TargetInCombat("target")	--单位在与我们进行战斗
		TargetInvincible=WR_Invincible("target")--获取目标是否无敌
		SingleUnit=WR_SingleUnit()	--单体目标判断

		HUCountRange40=WR_GetRangeHarmUnitCount(40,not(Training)) --40码内战斗单位数量
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end

	---------------------------------

	--优先检查
	if WR_PriorityCheck() then return end
	
	if WR_ZNJD(WRSet.SW_ZNJD) then return end	--智能焦点
	
	--施法过程 假死
	if WR_Hunter_Function_JS() then return end
	
	--施法过程 意气风发
	if WR_Hunter_Function_YQFF() then return end
	
	if WRSet.SW_SP1>=3 then
		if WR_ShiPin(1,WRSet.SW_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.SW_SP2>=3 then
		if WR_ShiPin(2,WRSet.SW_SP2) then return true end	--饰品 自保/协助
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
	
	--施法过程 反制射击
	if WR_HunterBeastMastery_Function_FZSJ() then return end
	
	--施法过程 宁神射击
	if WR_Hunter_Function_NSSJ() then return end
	
	--施法过程 胁迫
	if WR_Hunter_Function_XP() then return end

	--施法过程 战斗
	if WR_HunterBeastMastery_Function_Combat() then return end
	
	--治疗宠物
	if WR_Hunter_Function_ZLCW() then return end
	
	if WR_Function_ZNMB(40,WRSet.SW_ZNMB) then return end	--智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then
		print("----------")
		print("野兽顺劈：",YeShouShunPiBuffTime)
		print("荒野的召唤",BuffTime_HYDZH)
	end
	
end

--施法过程 战斗
function WR_HunterBeastMastery_Function_Combat()
	if not TargetInCombat then return false end	--目标没有战斗
	
	if TargetInRange40 then
		if WRSet.SW_SP1==1 then
			if WR_ShiPin(1,WRSet.SW_SP1) then return true end	--饰品 常驻
		end
		if WRSet.SW_SP2==1 then
			if WR_ShiPin(2,WRSet.SW_SP2) then return true end	--饰品 常驻
		end
	end
	
	--if WR_HunterBeastMastery_KYNH("开战") then return true end	--狂野怒火
	
	if HUCountRange40>=2 --40码敌对单位数量>=2
	and not SingleUnit then --目标不是单体
		if WR_HunterBeastMastery_Function_DCSJ("3层") then return true end	--保持3层倒刺射击
		if WR_HunterBeastMastery_DuoChongSJ() then return true end	--多重射击
		if WR_HunterBeastMastery_HSJ("AOE") then return true end	--黑蚀箭
		if WR_HunterBeastMastery_HYDZH() then return true end	--荒野的召唤
		if WR_HunterBeastMastery_KYNH() then return true end	--狂野怒火
		if WR_HunterBeastMastery_XJSF() then return true end	--血溅十方
		if WR_HunterBeastMastery_SLML() then return true end	--杀戮命令
		if WR_HunterBeastMastery_Function_DCSJ("AOE") then return true end	--倒刺射击
		if WR_HunterBeastMastery_YJSSJ("杀戮眼镜蛇") then return true end	--杀戮眼镜蛇
		if WR_Hunter_Function_DMSJ() then return true end	--夺命射击
		if WR_HunterBeastMastery_BZSJ() then return true end	--爆炸射击
		if WR_HunterBeastMastery_XBYS() then return true end	--凶暴野兽
		if WR_HunterBeastMastery_YJSSJ("AOE") then return true end	--眼镜蛇射击
	else
--[[
		--凶兽S1
		if GCD<=ShiFaSuDu
		and TargetInRange40 --当前目标在40码
		and WR_SpellUsable("凶暴野兽")	--技能可用
		and BuffTime_KuangBao==0	--宠物 狂暴BUFF不存在
		then
			if WR_ColorFrame_Show("CF8","凶兽S1") then return true end
		end
--]]
		if WR_HunterBeastMastery_Function_DCSJ("3层") then return true end	--保持3层倒刺射击
		if WR_HunterBeastMastery_SLML("荒野") then return true end	--杀戮命令
		if WR_Hunter_Function_DMSJ("毒液") then return true end	--夺命射击
		if WR_HunterBeastMastery_HYDZH() then return true end	--荒野的召唤
		if WR_HunterBeastMastery_XJSF() then return true end	--血溅十方
		if WR_HunterBeastMastery_KYNH() then return true end	--狂野怒火
		if WR_HunterBeastMastery_SLML("满层") then return true end	--杀戮命令
		if WR_HunterBeastMastery_HSJ() then return true end	--黑蚀箭
		if WR_HunterBeastMastery_SLML() then return true end	--杀戮命令
		if WR_HunterBeastMastery_XBYS() then return true end	--凶暴野兽
		if WR_HunterBeastMastery_Function_DCSJ("单体") then return true end	--倒刺射击
		if WR_HunterBeastMastery_YJSSJ("杀戮眼镜蛇") then return true end	--杀戮眼镜蛇
		if WR_Hunter_Function_DMSJ() then return true end	--夺命射击
		if WR_HunterBeastMastery_YJSSJ() then return true end	--眼镜蛇射击
		
		--if WR_HunterBeastMastery_BZSJ("单体") then return true end	--爆炸射击		
	end
	return false
end

--施法过程 反制射击
function WR_HunterBeastMastery_FZSJ(Unit)
	if C_Spell.IsSpellInRange("反制射击",Unit)	--当前技能范围内
	and WR_GetCastInterruptible(Unit,InterruptTime)	--指定"单位"施法剩余时间小于设定
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF5","反制T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN0","反制M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF8","反制F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF8","反制P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF9","反制P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("SF10","反制P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("SF11","反制P4T") then return true end
		end
	end
end

--施法过程 反制射击
function WR_HunterBeastMastery_Function_FZSJ()
	if not WR_SpellUsable("反制射击") then return false end	--反制射击 不可使用
	
	if WRSet.SW_FZSJ==5 then	--禁用
		return false
	elseif WRSet.SW_FZSJ==1	--智能
	or
	(
		WRSet.SW_FZSJ==4	--焦点
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
		if WR_HunterBeastMastery_FZSJ("focus") then return true end	--焦点
		if WR_HunterBeastMastery_FZSJ("target") then return true end	--目标
		if WR_HunterBeastMastery_FZSJ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_HunterBeastMastery_FZSJ("party"..i.."target") then return true end
		end
	elseif WRSet.SW_FZSJ==2 then	--目标
		if WR_HunterBeastMastery_FZSJ("target") then return true end
	elseif WRSet.SW_FZSJ==3 then	--指向
		if WR_HunterBeastMastery_FZSJ("mouseover") then return true end
	elseif WRSet.SW_FZSJ==4 then	--焦点
		if WR_HunterBeastMastery_FZSJ("focus") then return true end
	end
	
	return false
end

--倒刺射击
function WR_HunterBeastMastery_DCSJ(Unit,Text,Dot)
	if C_Spell.IsSpellInRange("倒刺射击",Unit)	--技能范围内
	and WR_TargetInCombat(Unit)	--单位在战斗中
	then
		if Dot==nil or (Dot=="Dot" and WR_GetUnitDebuffTime(Unit,"倒刺射击",true)<=3) then	--单位没有我的DOT 倒刺射击
			if Unit=="target" then
				if WR_ColorFrame_Show("CF1",Text.."T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSF9",Text.."M") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("ACN0",Text.."P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("CSL",Text.."P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("CSO",Text.."P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("CSK",Text.."P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 倒刺射击
function WR_HunterBeastMastery_Function_DCSJ(Text)
	if GCD>ShiFaSuDu then return false end	--GCD>施法时间
	if WR_GetGCD("倒刺射击")>GCD+0.2 then return false end	--倒刺射击 不可使用
	
	if
	(
		Text=="AOE"
		and
		(
			WR_GetUnitBuffTime("player","荒野的召唤")>GCD	--荒野的召唤 BUFF存在
			or
			(
				IsPlayerSpell(185789)	--已学 荒野呼唤(自动射击暴击20%重置倒刺射击)
				and
				WR_GetSpellNextCharge("倒刺射击")<C_Spell.GetSpellCharges(217200).cooldownDuration*0.8	--倒刺射击 充能时间 < 最大充能时间*80% (充能时间已经过去20%)
			)
			or
			IsPlayerSpell(445699)	--已学 狂暴突袭 杀戮几率重置倒刺时间
			or
			(
				IsPlayerSpell(466932)	--已学 黑蚀箭
				and
				(
					IsPlayerSpell(469880)	--已学 尖刺鳞片 眼镜蛇射击减少倒刺2秒CD
					or
					IsPlayerSpell(424557)	--已学 野蛮(倒刺射击+2秒)
				)
			)
		)
	)
	or
	(
		Text=="单体"
		and
		(
			(
				IsPlayerSpell(185789)	--已学 荒野呼唤(自动射击暴击20%重置倒刺射击)
				and
				WR_GetSpellNextCharge("倒刺射击")<C_Spell.GetSpellCharges(217200).cooldownDuration*0.6	--倒刺射击 充能时间 < 最大充能时间*60% (充能时间已经过去40%)
			)
			or
			WR_GetUnitBuffTime("player","荒野的召唤")>GCD	--荒野的召唤 BUFF存在
			or
			(
				WR_GetSpellNextCharge("倒刺射击")<GCD+MaxGCD	--充能时间<下一个技能结束GCD
				and
				WR_GetGCD("狂野怒火")>GCD	--狂野怒火 不可用
			)
			or
			(
				IsPlayerSpell(193532)	--已学 血之气息
				and
				WR_GetGCD("狂野怒火")<GCD+MaxGCD+12	--狂野怒火 冷却时间<下一个技能结束GCD+12秒
			)
			or
			IsPlayerSpell(445699)	--已学 狂暴突袭 杀戮几率重置倒刺时间
			or
			(
				IsPlayerSpell(466932)	--已学 黑蚀箭
				and
				(
					IsPlayerSpell(469880)	--已学 尖刺鳞片 眼镜蛇射击减少倒刺2秒CD
					or
					IsPlayerSpell(424557)	--已学 野蛮(倒刺射击+2秒)
				)
			)
		)
	)
	or
	(
		Text=="3层"
		and
		(
			(
				BuffTime_KuangBao>GCD	--狂暴 BUFF存在
				and
				BuffTime_KuangBao<=GCD+MaxGCD+0.3	--狂暴 BUFF时间<=下一个技能结束后GCD+0.3秒
			)
			or
			(
				BuffCount_KuangBao<3	----狂暴 BUFF层数<3
				and
				(
					(
						zhandoumoshi==1	--爆发开启
						and
						WR_GetGCD("狂野怒火")<=GCD	--狂野怒火 技能冷却
						and
						(
							BuffTime_KuangBao<=GCD	--狂暴 BUFF不存在
							or
							IsPlayerSpell(193532)	--已学 血之气息
						)
					)
					or
					(
						zhandoumoshi==1	--爆发开启
						and
						IsPlayerSpell(359844)	--已学 荒野的召唤
						and
						WR_GetGCD("荒野的召唤")<=GCD	--荒野的召唤 技能冷却
					)
--[[
					or
					WR_GetSpellCharges("倒刺射击")>=2	--倒刺射击 可用次数>=2
					or
					WR_GetSpellNextCharge("倒刺射击")<=GCD+MaxGCD	--技能充能剩余时间<=下一个技能结束后GCD
--]]
				)
			)
		)
	)
	or
	Text==nil
	then
		if WRSet.SW_DCSJ==2 then	--倒刺射击 智能
			if WR_HunterBeastMastery_DCSJ("target",Text,"Dot") then return true end
			if WR_HunterBeastMastery_DCSJ("mouseover",Text,"Dot") then return true end
			for i=1,4,1 do
				local TempUnit="party"..i.."target"
				if WR_HunterBeastMastery_DCSJ("party"..i.."target",Text,"Dot") then return true end
			end
		end
		if WR_HunterBeastMastery_DCSJ("target",Text) then return true end
	end
	return false
end

--施法过程 饰品
function WR_HunterBeastMastery_SP()
	if WRSet.SW_SP1==2 then
		if WR_ShiPin(1,WRSet.SW_SP1) then return true end	--饰品 爆发
	end
	if WRSet.SW_SP2==2 then
		if WR_ShiPin(2,WRSet.SW_SP2) then return true end	--饰品 爆发
	end
	return false
end

--施法过程 荒野的召唤
function WR_HunterBeastMastery_HYDZH()
	if WRSet.SW_HYDZH==1 --荒野的召唤 开启
	and zhandoumoshi==1	--开爆发
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and TargetInRange40 --当前目标在40码
	and WR_SpellUsable("荒野的召唤")	--技能可用
	then
		if WR_HunterBeastMastery_SP() then return true end	--饰品
		if WR_ColorFrame_Show("CF9","荒野") then return true end
	end
	return false
end

--施法过程 多重射击
function WR_HunterBeastMastery_DuoChongSJ()
	if WRSet.SW_DuochongSJ==1 --多重射击 开启
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and TargetInRange40 --当前目标在40码
	and WR_SpellUsable("多重射击")	--技能可用
	and BuffTime_YeShouShunPi<GCD+MaxGCD+0.3 --宠物野兽顺劈BUFF时间<下一个技能结束时间+0.3秒
	and
	(
		not IsPlayerSpell(407412)	--没学 血腥狂乱(荒野召唤给顺劈)
		or
		WR_GetGCD("荒野的召唤")>GCD	--荒野的召唤 技能不可用
		or
		zhandoumoshi~=1	--爆发 关闭
		or
		WRSet.SW_HYDZH~=1 --荒野的召唤 关闭
	)
	then
		if WR_ColorFrame_Show("CF3","多重") then return true end
	end
	return false
end

--施法过程 狂野怒火
function WR_HunterBeastMastery_KYNH(Text)
	if TargetInRange40 --目标在40码范围内
	and zhandoumoshi==1	--开爆发
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and WR_SpellUsable("狂野怒火")	--技能可用
	then
		if Text==nil
		or
		(
			Text=="开战"
			and
			not UnitAffectingCombat("player")	--没有战斗
			and
			IsPlayerSpell(445404)	--已学 凶恶狩猎
		)
		then
			if not IsPlayerSpell(359844) then	--没学 荒野的召唤
				if WR_HunterBeastMastery_SP() then return true end	--饰品
			end
			if WR_ColorFrame_Show("CF6","狂野" .. (Text or "")) then return true end
		end
	end
	return false
end

--施法过程 杀戮命令
function WR_HunterBeastMastery_SLML(Text)
	if ( ErrorMessageTime_OutOfSight==nil or GetTime()-ErrorMessageTime_OutOfSight>0.5 or ErrorMessageTime_SLML==nil or GetTime()-ErrorMessageTime_SLML>0.5 or ErrorMessageTime_PetIsDead==nil or GetTime()-ErrorMessageTime_PetIsDead>0.5)
	--        目标不在视野错误不存在      或    目标不在视野错误出现时间超过0.5秒      或     杀戮命令错误不存在     或    杀戮命令错误出现时间超过0.5秒    或       宠物死亡错误不存在        或       宠物死亡错误超过0.5秒
	and IsSpellInRange("杀戮命令","target")	--当前目标是否在技能范围内
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and WR_SpellUsable("杀戮命令")	--技能可用
	then
		if Text==nil then
			if WR_ColorFrame_Show("CF7","杀戮命令") then return true end
		elseif Text=="荒野"
		and zhandoumoshi==1	--爆发开启
		and IsPlayerSpell(359844)	--已学 荒野的召唤
		and WRSet.SW_HYDZH==1 --荒野的召唤 开启
		and WR_GetGCD("荒野的召唤")<=GCD+MaxGCD+0.3	--荒野的召唤 技能冷却
		then
			if WR_ColorFrame_Show("CF7","荒野杀戮") then return true end
		elseif Text=="满层"
		and WR_GetSpellNextCharge("杀戮命令")<GCD+1.25*MaxGCD	--杀戮命令即将充满
		then
			if WR_ColorFrame_Show("CF7","满层杀戮") then return true end
		end
	end
	return false
end

--施法过程 爆炸射击
function WR_HunterBeastMastery_BZSJ(Text)
	if TargetInRange40 --当前目标在40码
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("爆炸射击")	--技能可用
	and WR_GetUnitDebuffTime("target","爆炸射击",true)<=GCD	--单位爆炸射击不存在
	then
		if Text==nil then
			if WR_ColorFrame_Show("CF2","爆炸射击") then return true end
		elseif Text=="单体"
		and
		(
			not IsPlayerSpell(199532)	--没学 杀戮眼镜蛇
			or
			WR_GetUnitBuffTime("player","狂野怒火")<=GCD	--狂野怒火 BUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF2","单体爆炸") then return true end
		end
	end
	return false
end

--施法过程 血溅十方
function WR_HunterBeastMastery_XJSF()
	if IsSpellInRange("血溅十方","target") --当前目标是否在技能范围内
	and GCD<=ShiFaSuDu --公共冷却时间<=施法速度
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("血溅十方")	--技能可用
	then
		if WR_ColorFrame_Show("CF4","血溅十方") then return true end
	end
	return false
end

--施法过程 凶暴野兽
function WR_HunterBeastMastery_XBYS()
	if GCD<=ShiFaSuDu
	and TargetInRange40 --当前目标在40码
	and WR_SpellUsable("凶暴野兽")	--技能可用
	then
		if WR_ColorFrame_Show("CF8","凶暴野兽") then return true end
	end
	return false
end

--施法过程 眼镜蛇射击
function WR_HunterBeastMastery_YJSSJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInRange40 --当前目标在40码
	and WR_SpellUsable("眼镜蛇射击")	--技能可用
	then
		if Text==nil then
			if WR_ColorFrame_Show("SF12","眼镜蛇") then return true end
		elseif Text=="AOE"
		and FocusPower>=100-HunterFPS*(GCD+MaxGCD*2)	--当前集中值>=100-每秒集中值*(当前GCD+最大GCD*2)	也就是两个GCD后会回满集中值
		then
			if WR_ColorFrame_Show("SF12","眼镜蛇A") then return true end
		elseif Text=="杀戮眼镜蛇"
		and WR_GetUnitBuffTime("player","狂野怒火")>GCD	--狂野怒火 BUFF存在
		and IsPlayerSpell(199532)	--已学 杀戮眼镜蛇
		then
			if WR_ColorFrame_Show("SF12","杀戮眼镜蛇") then return true end
		end
	end
	return false
end

--施法过程 黑蚀箭
function WR_HunterBeastMastery_HSJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInRange40 --当前目标在40码
	--and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("黑蚀箭")	--技能可用
	then
		if Text==nil
		or
		(
			Text=="AOE"
			and
			BuffTime_YeShouShunPi>GCD	--野兽顺劈 存在
		)
		then
			if WR_ColorFrame_Show("CSI",(Text or "").."黑箭") then return true end
		end
	end
	return false
end