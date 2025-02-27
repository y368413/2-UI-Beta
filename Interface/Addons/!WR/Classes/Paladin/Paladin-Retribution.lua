--惩戒骑运行库
function WR_PaladinRetribution()
	if GetSpecialization()~=3 then	--如果不是惩戒(3)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.CJQ_SFSD*0.05
		PlayerMove=WR_PlayerMove()	--获取单位是否移动或空中状态
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		GCD=WR_GetGCD("圣光闪现")	--获得公共CD
		MaxGCD=WR_GetMaxGCD(1.5)	--获得最大公共CD
		NextGCD=GCD+MaxGCD	--下一个技能GCD
		
		if WR_GetUnitDebuffTime("player","圣盾术")==0	--圣盾术不存在
		and WR_GetUnitDebuffTime("player","圣佑术")==0	--圣佑术不存在
		and WR_GetUnitDebuffTime("player","复仇之盾")==0	--复仇之盾不存在
		and	UnitAffectingCombat("player")	--玩家在战斗
		and
		(
			WR_ResistOutburstTime()<=2	--尖刺型伤害，施法时间剩余2秒
			or
			(
				WR_ResistSustained()	--持续型伤害存在
				and
				(
					WR_InBossCombat()	--BOSS战
					or
					PlayerHP<0.9	--玩家血量<90%
				)
			)
			or
			WR_Mustheal("player")	--自己必须受到治疗
			or
			PlayerHP<0.5	--单位血量
		)
		then
			ActivateDefense=true	--激活防御手段
		else
			ActivateDefense=false
		end
		
		Latency=WR_GetMaxLatency()	--获得网络延迟

		HolyPower=UnitPower("player",9)	--获得神圣能量的数量

		BuffTime_SSYZ = WR_GetUnitBuffTime("player","神圣意志")	--获得 神圣意志 Buff信息
		BuffTime_SJGM = WR_GetUnitBuffTime("player","圣洁共鸣")	--获得 圣洁共鸣 Buff信息
		BuffTime_CQZL = WR_GetUnitBuffTime("player","苍穹之力")	--获得 苍穹之力 Buff信息
		BuffTime_ZF , BuffCount_ZF = WR_GetUnitBuffInfo("player","征伐")	--获得 征伐 Buff信息

		TargetRange=WR_GetUnitRange("target")	--获得目标距离
		TargetCloseRange = C_Spell.IsSpellInRange("十字军打击","target") or C_Spell.IsSpellInRange("责难","target") or TargetRange<=4
		TargetInCombat=WR_TargetInCombat("target")	--目标在战斗

		HUCountRange5=WR_GetRangeHarmUnitCount(5,false)	--获得5码内单位数量
		HUCountRange10=WR_GetRangeHarmUnitCount(10,false) --获得10码内单位数量

		RaidOrParty=WR_GetInRaidOrParty()	--获得团队还是小队
		
		WR_PaladinRetribution_LastSpellTime()
		--记录最后一个技能的时间
		
		if WRSet.CJQ_SSFB~=4 then
			SSFB_Sum=WRSet.CJQ_SSFB --神圣风暴 单位数量
		else
			SSFB_Sum=999 --神圣风暴 单位数量
		end
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end

	if MSG==1 then
		print("----------")
	end
	
	--施法过程 优先检查
	if WR_PriorityCheck() then return true end
--[[
	--圣光之锤BUG处理
	if IsSpellOverlayed(427453)	--圣光之锤 技能激活触发
	and WR_GetGCD(255937)<=GCD	--灰烬觉醒CD好了
	then
		if WR_ColorFrame_Show("CSU","取消圣锤") then return true end
	end
--]]
	if WR_ZNJD(WRSet.CJQ_ZNJD) then return end	--智能焦点
	
	--施法过程 圣盾术
	if WR_Paladin_Function_SDS() then return true end

	--施法过程 圣疗术
	if WR_Paladin_Function_SLS() then return true end

	--施法过程 圣佑术
	if WR_Paladin_Function_SYS() then return true end

	--施法过程 复仇之盾
	if WR_PaladinRetribution_Function_FCZD() then return true end

	--施法过程 责难
	if WR_Paladin_Function_ZN() then return true end
	
	if WRSet.CJQ_SP1>=3 then
		if WR_ShiPin(1,WRSet.CJQ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.CJQ_SP2>=3 then
		if WR_ShiPin(2,WRSet.CJQ_SP2) then return true end	--饰品 自保/协助
	end

	--施法过程 治疗石
	if WR_Paladin_Function_ZLS() then return true end

	--施法过程 治疗药水
	if WR_Paladin_Function_ZLYS() then return true end

	--施法过程 荣耀圣令
	if WR_PaladinRetribution_Function_RYSL() then return true end

	--施法过程 代祷
	if WR_Paladin_Function_DD() then return true end

	--施法过程 自由祝福
	if WR_Paladin_Function_ZYZF() then return true end

	--施法过程 牺牲祝福
	if WR_Paladin_Function_XSZF() then return true end

	--施法过程 制裁之锤
	if WR_Paladin_Function_ZCZC() then return true end

	--施法过程 盲目之光
	if WR_Paladin_Function_MMZG() then return true end

	--施法过程 清毒术
	if WR_Paladin_Function_QDS_QJS() then return true end

	--施法过程 光环
	if WR_PaladinRetribution_Function_GH() then return true end
	
	if TargetCloseRange and TargetInCombat then	--目标在近战 并且 目标战斗中
		if WRSet.CJQ_SP1==1 then
			if WR_ShiPin(1,WRSet.CJQ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.CJQ_SP2==1 then
			if WR_ShiPin(2,WRSet.CJQ_SP2) then return true end	--饰品 常驻
		end
	end
	
	--施法过程 战斗
	if WR_PaladinRetribution_Function_Combat() then return true end

	if WR_Paladin_Function_ZNMB() then return end	--施法过程 智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
end




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_PaladinRetribution_LastSpellTime()
	if PaladinRetributionLastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="圣殿骑士打击" then	--释放成功的技能名称
						SDQSDJ_CastTime=GetTime()	--获取 圣殿骑士打击 施法成功时间
					elseif SpellName=="处决宣判" then	--释放成功的技能名称
						CJXP_CastTime=GetTime()
					elseif SpellName=="神圣之锤" then	--释放成功的技能名称
						SSZC_CastTime=GetTime()
						--print("神圣之锤 施法成功")
					end
				elseif select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_FAILED" then	--施法失败
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="神圣之锤" then	--释放失败的技能名称
						SSZC_CastTime=nil
						--print("神圣之锤 施法结束")
					end
				end
			end
	end)
	PaladinRetributionLastSpellIsOpen=true                       
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--施法过程 复仇之盾
function WR_PaladinRetribution_Function_FCZD()
	if GCD<=ShiFaSuDu
	and WRSet.CJQ_FCZD==1	--复仇之盾 开启
	and WR_SpellUsable("复仇之盾")	--技能可用 资源可用
	and WR_GetUnitDebuffTime("player","圣佑术")==0	--圣佑术 BUFF 不存在
	and ActivateDefense	--激活防御
	and (SYS_EndTime==nil or GetTime()-SYS_EndTime>8)	--圣佑术已施法过去8秒
	then
		FCZD_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("SF9","复仇之盾") then return true end
	end
	return false
end

--荣耀圣令
function WR_PaladinRetribution_RYSL(Unit,RYSL_HP)
	if not UnitCanAttack(Unit,"player")	--单位是友方
	and IsSpellInRange("荣耀圣令",Unit)	--在技能范围内
	and not UnitIsDead(Unit)	--单位没有死亡
	and UnitHealth(Unit)/UnitHealthMax(Unit) < RYSL_HP	--玩家血量比例<荣耀圣令治疗阈值
	then
		return true
	end
	return false
end


--施法过程 荣耀圣令
function WR_PaladinRetribution_Function_RYSL()
	--荣耀圣令
	if GCD<=ShiFaSuDu
	and WRSet.CJQ_RYSL~=11	--荣耀圣令 开启
	and WR_SpellUsable("荣耀圣令")	--技能可用
	then
		local RYSL_HP=WRSet.CJQ_RYSL/10	--初始化荣耀圣令治疗阈值
		if WRSet.CJQ_RYSL>=6 then
			RYSL_HP=(WRSet.CJQ_RYSL-5)/10
		end
		
		if PlayerHP < RYSL_HP then	--玩家血量比例<荣耀圣令治疗阈值
			if WR_ColorFrame_Show("CF12","荣耀圣令") then return true end
		end
	
		if WRSet.CJQ_RYSL<=5	--治疗玩家和队友
		and UnitAffectingCombat("player")	--玩家战斗中
		then
			if WR_PaladinRetribution_RYSL("party1",RYSL_HP) then
				if WR_ColorFrame_Show("ASF1","荣耀P1") then return true end
			end
			if WR_PaladinRetribution_RYSL("party2",RYSL_HP) then
				if WR_ColorFrame_Show("ASF2","荣耀P2") then return true end
			end
			if WR_PaladinRetribution_RYSL("party3",RYSL_HP) then
				if WR_ColorFrame_Show("ASF3","荣耀P3") then return true end
			end
			if WR_PaladinRetribution_RYSL("party4",RYSL_HP) then
				if WR_ColorFrame_Show("ASF5","荣耀P4") then return true end
			end
		end
	end
	return false
end

--施法过程 光环
function WR_PaladinRetribution_Function_GH()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度

	--专注光环
	if WRSet.CJQ_GH==1	--专注 专注
	and IsPlayerSpell(317920)	--已学 专注光环
	and WR_GetUnitBuffTime("player","专注光环")==0	--惩戒光环BUFF不存在
	then
		if WR_ColorFrame_Show("CSF9","专注光环") then return true end
	end
	
	--虔诚光环
	if WRSet.CJQ_GH==2	--光环 惩戒
	and IsPlayerSpell(465)	--已学 虔诚光环
	and WR_GetUnitBuffTime("player","虔诚光环")==0	--惩戒光环BUFF不存在
	then
		if WR_ColorFrame_Show("ACN0","虔诚光环") then return true end
	end

	return false
end

--施法过程 使用饰品
function WR_PaladinRetribution_Use_SP()
	if WRSet.CJQ_SP1==2 then
		if WR_ShiPin(1,WRSet.CJQ_SP1) then return true end	--饰品 爆发
	end
	if WRSet.CJQ_SP2==2 then
		if WR_ShiPin(2,WRSet.CJQ_SP2) then return true end	--饰品 爆发
	end
	return false
end
	
--施法过程 等待爆发
function WR_PaladinRetribution_Wait()
	if zhandoumoshi==1	--爆发 开启
	and TargetRange<=12	--目标距离
	and HolyPower >= 2	--神圣能量>=2
	and
	(
		(
			IsPlayerSpell(343527) --已学 处决宣判
			and
			WR_GetGCD("处决宣判") < GCD + MaxGCD	--处决宣判 冷却时间<下一个GCD
		)
		or
		(
			IsPlayerSpell(343721)	--已学 最终清算
			and
			WR_GetGCD("最终清算") < GCD + MaxGCD	--最终清算 冷却时间<下一个GCD
		)
	)
	then
		return true
	end
	return false
end
	
--施法过程 战斗
function WR_PaladinRetribution_Function_Combat()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法时间
	if not TargetInCombat then return false end	--目标不在战斗中
	
	if WR_PaladinRetribution_CJXP("2豆") then return true end	--处决宣判
	
	if WR_PaladinRetribution_ZZQS("2豆") then return true end	--最终清算

	if WR_PaladinRetribution_ZJJ("满豆") then return true end	--终结技 满豆
	
	if WR_PaladinRetribution_HJJX("2豆") then return true end	--灰烬觉醒
	
	if WR_PaladinRetribution_SDQSZJ("优先") then return true end	--圣殿骑士斩击 神圣能量未满,且圣殿骑士斩击二段时间即将结束

	if WR_PaladinRetribution_GZZJ("异端") then return true end	--公正之剑 异端(如果点了[神圣烈焰],则最高优先级)
	
	if WR_PaladinRetribution_SJMZ() then return true end	--圣洁鸣钟
	
	if WR_PaladinRetribution_ZJJ("征伐") then return true end	--终结技 续征伐
	
	if WR_PaladinRetribution_ShenPan("增益") then return true end	--审判 增益 目标没有审判Debuff

	if WR_PaladinRetribution_GZZJ("AOE") then return true end	--公正之剑 AOE
	
	if WR_PaladinRetribution_FNZC("单优") then return true end	--愤怒之锤 单体增益优先
	
	if WR_PaladinRetribution_SDQSDJ() then return true end	--圣殿骑士打击
	
	if WR_PaladinRetribution_ShenPan() then return true end	--审判
	
	if WR_PaladinRetribution_GZZJ() then return true end	--公正之剑
	
	if WR_PaladinRetribution_FNZC("单体") then return true end	--愤怒之锤 单体
	
	if WR_PaladinRetribution_SDQSZJ() then return true end	--圣殿骑士斩击
	
	if WR_PaladinRetribution_ZJJ("增益") then return true end	--终结技 各种增益触发
	
	if WR_PaladinRetribution_ZJJ() then return true end	--终结技
	
	if WR_PaladinRetribution_FNZC() then return true end	--愤怒之锤
	
	if WR_PaladinRetribution_SZJDJ() then return true end	--十字军打击
	
	if WR_PaladinRetribution_CJXP("1豆") then return true end	--处决宣判
	
	if WR_PaladinRetribution_ZZQS("1豆") then return true end	--最终清算
	
	if WR_PaladinRetribution_HJJX("1豆") then return true end	--灰烬觉醒
	
	return false
end

--圣殿骑士斩击
function WR_PaladinRetribution_SDQSZJ(Text)
	if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下	
	
	if TargetCloseRange --目标在近战范围内
	and IsSpellOverlayed(406647) --圣殿骑士斩击 技能激活触发
	then
		if Text==""
		or
		(
			Text=="优先"
			and SDQSDJ_CastTime~=nil	--圣殿骑士打击 施法时间存在
			and GetTime()-SDQSDJ_CastTime>=5-GCD-MaxGCD*2-Latency	--圣殿骑士斩击最后两次可施法的时间(两个GCD就会结束斩击)
		)
		then
			if WR_ColorFrame_Show("CF9","斩击"..(Text or "")) then return true end
		end
	end
	return false
end

--圣殿骑士打击
function WR_PaladinRetribution_SDQSDJ()
	if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下	
	
	if TargetCloseRange --目标在近战范围内
	and WR_SpellUsable("圣殿骑士打击") --技能可用
	and not IsSpellOverlayed(406647) --没有激活 圣殿骑士斩击
	then
		if WR_ColorFrame_Show("CF9","圣殿打击") then return true end
	end
	return false
end
	
--十字军打击
function WR_PaladinRetribution_SZJDJ()
	if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下	
	
	if TargetCloseRange --目标在近战范围内
	and WR_SpellUsable("十字军打击") --技能可用 资源可用
	and not IsPlayerSpell(404542) --没有学习 [远征打击]
	and not IsPlayerSpell(406646) --没有学习 [圣殿骑士之击]
	then
		if WR_ColorFrame_Show("CF9","十字军") then return true end
	end
	return false
end
	
--公正之剑
function WR_PaladinRetribution_GZZJ(Text)
	if WR_GetSpellCharges("公正之剑")==1 then	--如果 公正之剑只有一次使用次数
		if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下
	end
	
	if TargetRange<=20 --目标在 20 码
	and WR_SpellUsable("公正之剑") --技能可用 资源可用
	then
		if
		(
			Text=="异端"
			and WR_GetUnitDebuffInfo("target","异端逐除",true)<=GCD	--目标没有异端逐除DEBUFF
			and IsPlayerSpell(406545) --已学 神圣烈焰
		)
		or
		(
			Text=="AOE"
			and
			(
				HolyPower<=3	--神圣能量<=3
				or
				not IsPlayerSpell(383342)	--没学 神圣之刃 公正2豆
			)
			and HUCountRange5>=2	--5码单位数量>=2
			and IsPlayerSpell(403826)	--已学 复仇之剑
		)
		or
		(
			Text==nil
			and
			(
				HolyPower<=3	--神圣能量<=3
				or
				not IsPlayerSpell(383342)	--没学 神圣之刃 公正2豆
			)
		)
		then
			if WR_ColorFrame_Show("CF7","公正"..(Text or "")) then return true end
		end
	end
	return false
end

--审判
function WR_PaladinRetribution_ShenPan(Text)
	if WR_GetSpellCharges("审判")==1 then	--如果 审判只有一次使用次数
		if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下
	end
	
	if TargetRange<=30 --目标在 30 码
	and WR_SpellUsable("审判") --技能可用 资源可用
	and
	(
		HolyPower<=3	--神圣能量<=3
		or
		not IsPlayerSpell(405278)	--没学技能 [无尽审判] 审判2豆
	)
	and
	(
		Text==nil
		or
		(
			Text=="增益"
			and
			WR_GetUnitDebuffInfo("target","审判",true)<=GCD	--审判 DEBUFF不存在
			and
			(
				HolyPower>=3	--神圣能量>=3
				or
				WR_GetUnitDebuffInfo("target","异端逐除",true)>GCD	--异端逐除 DEBUFF存在
			)
		)
	)
	then
		if WR_ColorFrame_Show("CF4","审判"..(Text or "")) then return true end
	end
	return false
end

--愤怒之锤
function WR_PaladinRetribution_FNZC(Text)
	if WR_GetSpellCharges("愤怒之锤")==1 then	--如果 愤怒之锤只有一次使用次数
		if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下
	end
	
	if TargetRange<=30 --目标在 30 码
	and WR_SpellUsable("愤怒之锤") --技能可用 资源可用
	and IsSpellOverlayed(24275) --愤怒之锤 技能激活触发
	and
	(
		HolyPower<=3	--神圣能量<=3
		or
		UnitHealth("target")/UnitHealthMax("target")>20	--目标血量>20%	--血量大于20%,第一时间打掉,因为会继续刷新触发
		or
		not IsPlayerSpell(383314)	--没学 先锋之势(愤怒之锤没有层数,触发后需要第一时间打掉,不然可能溢出)
	)
	then
		if
		(
			Text=="单优"
			and
			(
				HUCountRange5<=1	--5码单位<=1
				or
				not IsPlayerSpell(403010)	--没学 受祝福的勇士(十字军和审判只能单体,愤怒之锤优先级就更高)
			)
			and
			(
				(
					UnitHealth("target")/UnitHealthMax("target")<0.35	--目标血量<35%
					and
					IsPlayerSpell(406835)	--已学 [愤怒复仇](斩杀增加50%伤害)
				)
				or
				WR_GetUnitBuffTime("player","安瑟的祝福")>GCD	--安瑟的祝福 BUFF存在(愤怒之锤伤害提高200%)
			)
		)
		or
		(
			Text=="单体"
			and
			(
				HUCountRange5<=1	--5码单位<=1
				or
				not IsPlayerSpell(403010)	--没学 受祝福的勇士(十字军和审判只能单体,愤怒之锤优先级就更高)
			)
		)
		or
		Text==nil
		then
			if WR_ColorFrame_Show("CF8","怒锤"..(Text or "")) then return true end
		end
	end
	return false
end

--终结技
function WR_PaladinRetribution_ZJJ(Text)
	if WR_PaladinRetribution_SGZC() then return true end	--圣光之锤
	
	if
	(
		Text=="满豆"
		and
		(
			HolyPower==5	--神圣能量
			or
			(
				HolyPower==4	--神圣能量
				and
				(
					BuffTime_SJGM>GCD	--圣洁共鸣 BUFF存在
					or
					BuffTime_SSYZ>GCD	--神圣意志 BUFF存在
				)
			)
		)
	)
	or
	(
		Text=="征伐"
		and
		HolyPower>=3	--神圣能量
		and
		BuffTime_ZF>GCD	--征伐存在
		and
		BuffCount_ZF<10	--征伐未满
	)
	or
	(
		Text=="增益"
		and
		(
			UnitHealth("target")/UnitHealthMax("target")<=0.20	--目标血量<=20%
			or
			WR_GetUnitBuffTime("player","复仇之怒")>GCD	--复仇之怒存在
			or
			BuffTime_ZF>GCD	--征伐存在
			or
			BuffTime_CQZL>GCD	--苍穹之力存在 免费风暴
		)
	)
	or
	Text==nil
	then
		if WR_PaladinRetribution_SSZC(Text) then return true end	--神圣之锤
		if WR_PaladinRetribution_SSFB(Text) then return true end	--神圣风暴
		if WR_PaladinRetribution_ZZSP(Text) then return true end	--最终审判
	end
end

--圣光之锤
function WR_PaladinRetribution_SGZC(Text)
	if TargetRange<=12	--目标距离
	and IsSpellOverlayed(427453)	--圣光之锤 技能激活触发
	and C_Spell.IsSpellUsable(427453)	--技能资源足够
	then
		if WR_ColorFrame_Show("CF1","圣锤"..(Text or "")) then return true end
	end
	return false
end

--神圣之锤
function WR_PaladinRetribution_SSZC(Text)
	if TargetCloseRange --目标在近战范围内
	and IsPlayerSpell(198034)	--已学 [神圣之锤]
	and WR_SpellUsable("神圣之锤") --技能可用
	and HolyPower>=5	--神圣能量>=5
	then
		if WR_ColorFrame_Show("CSO","神圣之锤") then return true end
	end
	return false
end

--神圣风暴
function WR_PaladinRetribution_SSFB(Text)
	if TargetRange<=5	--目标在5码内
	and SSZC_CastTime==nil	--神圣之锤未激活
	and not IsSpellOverlayed(427453)	--圣光之锤 技能没有激活触发
	and WR_SpellUsable("神圣风暴")	--技能可用 资源可用
	and
	(
		(
			HUCountRange5>=SSFB_Sum	--5码单位数量>=神圣风暴设定单位数量
			and not WR_SingleUnit()	--不是单体目标(强制单体的目标只打裁决)
			and WR_GetUnitBuffTime("player",387178)<=GCD	--苍穹之遗 buff不存在 裁决会触发神圣风暴
			and WR_GetUnitBuffCount("player","神圣仲裁者")<25	--神圣仲裁者buff<25层	25层后裁决会触发AOE
			and WR_GetUnitBuffTime("player",453433)==0	--判罚处刑人 buff不存在
		)
		or
		BuffTime_CQZL>GCD	--苍穹之力存在 免费风暴
	)
	then
		if WR_ColorFrame_Show("CF5","风暴"..(Text or "")) then return true end
	end
	return false
end
	
--最终审判
function WR_PaladinRetribution_ZZSP(Text)
	if TargetRange<=30 --目标在 30 码
	and SSZC_CastTime==nil	--神圣之锤未激活
	and not IsSpellOverlayed(427453) --圣光之锤 技能没有激活触发
	and
	(
		WR_SpellUsable(85256) --技能可用 [圣殿骑士的裁决]
		or
		WR_SpellUsable("最终审判") --技能可用
	)
	then
		if WR_ColorFrame_Show("SF6","裁决"..(Text or "")) then return true end
	end
	return false
end
	
--圣洁鸣钟
function WR_PaladinRetribution_SJMZ()
	if WR_PaladinRetribution_Wait() then return false end	--如果等待爆发,则停一下	
	
	if WRSet.CJQ_SJMZ	--圣洁鸣钟 开启
	and TargetRange<=30	--目标在30码
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("圣洁鸣钟")	--技能可用 资源可用
	and HolyPower<=2	--神圣能量<=2
	and
	(
		WR_GetUnitDebuffTime("target","真理觉醒",true)>GCD	--目标有真理觉醒DEBUFF
		or
		WR_GetGCD("灰烬觉醒")>=21	--灰烬觉醒 施法9秒内
		or
		WR_GetGCD("灰烬觉醒") < GCD + MaxGCD	--灰烬觉醒 冷却时间<下一个GCD
	)
	then
		if WR_ColorFrame_Show("CF3","圣洁鸣钟") then return true end
	end
	return false
end

--处决宣判
function WR_PaladinRetribution_CJXP(Text)
	if zhandoumoshi==1	--爆发开启
	and TargetCloseRange --目标在近战范围内
	and IsPlayerSpell(343527) --已学 处决宣判
	and WR_GetGCD("处决宣判") <= GCD	--技能冷却
	and WR_GetGCD("灰烬觉醒") < GCD + MaxGCD/2	--灰烬觉醒 冷却时间<下一个GCD的一半
	then
		if
		(
			Text=="2豆"
			and
			HolyPower >= 2	--神圣能量>=2
		)
		or
		(
			Text=="1豆"
			and
			HolyPower >= 1	--神圣能量>=1
			and
			IsPlayerSpell(404542) --已学 远征打击 自动攻击给豆
		)
		then
			if WR_ColorFrame_Show("SF12","宣判"..(Text or "")) then return true end
		end
	end
	return false
end
	
--最终清算
function WR_PaladinRetribution_ZZQS(Text)
	if zhandoumoshi==1	--爆发开启
	and TargetRange<=12	--目标距离
	and IsPlayerSpell(343721)	--已学 最终清算
	and WR_GetGCD("最终清算") <= GCD	--技能冷却
	and WR_GetGCD("灰烬觉醒") < GCD + MaxGCD/2	--灰烬觉醒 冷却时间<下一个GCD的一半
	then
		if
		(
			Text=="2豆"
			and
			HolyPower >= 2	--神圣能量>=2
		)
		or
		(
			Text=="1豆"
			and
			HolyPower >= 1	--神圣能量>=1
			and
			IsPlayerSpell(404542) --已学 远征打击 自动攻击给豆
		)
		then
			if WR_ColorFrame_Show("SF12","清算"..(Text or "")) then return true end
		end
	end
	return false
end

--灰烬觉醒
function WR_PaladinRetribution_HJJX(Text)
	if zhandoumoshi==1	--开爆发
	and TargetRange<=12	--目标距离
	and WR_GetGCD(255937)<=GCD
	--and not IsSpellOverlayed(427453)	--圣光之锤 技能没有激活触发,此时技能为灰烬觉醒,而非
	and
	(
		(
			IsPlayerSpell(343527)	--已学 处决宣判
			and
			(
				WR_GetUnitDebuffTime("target","处决宣判",true)>GCD	--目标有处决宣判DEBUFF
				or
				WR_GetGCD("处决宣判")>GCD+MaxGCD	--处决宣判已经用了
			)
		)
		or
		(
			IsPlayerSpell(343721)	--已学 最终清算
			and
			(
				WR_GetUnitDebuffTime("target","最终清算",true)>GCD	--目标有最终清算DEBUFF
				or
				WR_GetGCD("最终清算")>GCD+MaxGCD	--最终清算已经用了
			)
		)
	)
	then
		if
		(
			Text=="2豆"
			and
			HolyPower >= 2	--神圣能量>=2
		)
		or
		(
			Text=="1豆"
			and
			HolyPower >= 1	--神圣能量>=1
			and
			IsPlayerSpell(404542) --已学 远征打击 自动攻击给豆
		)
		then
			if WR_PaladinRetribution_Use_SP() then return true end	--使用饰品
			if WR_ColorFrame_Show("CF1","灰烬"..(Text or "")) then return true end
		end
	end
	return false
end