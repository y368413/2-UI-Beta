--惩戒骑运行库
function WR_PaladinRetribution()
	if GetSpecialization()~=3 then	--如果不是惩戒(3)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.1
		PlayerMove=WR_PlayerMove()	--获取单位是否移动或空中状态
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		GCD=WR_GetGCD("圣光闪现")	--获得公共CD
		
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
		MaxGCD=WR_GetMaxGCD(1.5)	--获得最大公共CD
		Latency=WR_GetMaxLatency()	--获得网络延迟

		HolyPower=UnitPower("player",9)	--获得神圣能量的数量

		BuffTime_SSYZ=WR_GetUnitDebuffTime("player","神圣意志")	--获得 神圣意志 Buff信息

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
					if SpellName=="圣殿骑士打击" then
					--释放成功的技能名称
						SDQSDJ_CastTime=GetTime()	--获取 圣殿骑士打击 施法成功时间
					elseif SpellName=="处决宣判" then
					--如果释放成功的是斜掠
						CJXP_CastTime=GetTime()
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

--施法过程 荣耀圣令
function WR_PaladinRetribution_Function_RYSL()
	--荣耀圣令
	if GCD<=ShiFaSuDu
	and WRSet.CJQ_RYSL~=6	--荣耀圣令 开启
	and WR_SpellUsable("荣耀圣令")	--技能可用
	and PlayerHP < WRSet.CJQ_RYSL/10	--单位血量
	then
		if WR_ColorFrame_Show("CF12","荣耀圣令") then return true end
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

--[[
--施法过程 超度邪恶
function WR_PaladinRetribution_Function_CDXE()
	if WR_SpellUsable("超度邪恶")
	--技能可用 资源可用
	and
	C_Spell.IsSpellInRange("超度邪恶","mouseover")
	--单位在技能范围内
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not PlayerMove
	--单位没有移动
	and
	not WR_StopCast(WR_GetTrueCastTime("超度邪恶"))
	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("","超度邪恶",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 忏悔
function WR_PaladinRetribution_Function_CH()
	if WR_SpellUsable("忏悔")
	--技能可用 资源可用
	and
	C_Spell.IsSpellInRange("忏悔","mouseover")
	--单位在技能范围内
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not PlayerMove
	--单位没有移动
	and
	not WR_StopCast(WR_GetTrueCastTime("忏悔"))
	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("","忏悔",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end
--]]

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
	
--施法过程 战斗
function WR_PaladinRetribution_Function_Combat()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法时间
	if not TargetInCombat then return false end	--目标不在战斗中
	

	if not IsPlayerSpell(458359) then	--没学 [光辉荣耀]	11.0前夕
		--灰烬觉醒
		if WR_SpellUsable("灰烬觉醒") --技能可用 资源可用
		and TargetCloseRange --目标在近战范围内
		and HolyPower<=2 --神圣能量<=2
		and
		(
			(
				zhandoumoshi==1 --开爆发
				and
				WR_GetUnitBuffTime("player","复仇之怒")>GCD+0.2 --复仇之怒BUFF
			)
			or
			WR_GetGCD("复仇之怒")>=20 --复仇之怒CD>=20
		)
		and
		(
			(
				IsPlayerSpell(343527) --已学 处决宣判
				and
				WR_GetGCD("处决宣判")>=20 --处决宣判CD>=20
			)
			or
			not IsPlayerSpell(343527) --没学 处决宣判
		)
		then
			if WR_ColorFrame_Show("CF1","灰烬觉醒") then return true end
		end
		
		--复仇之怒	
		if WR_SpellUsable("复仇之怒") --技能可用 资源可用
		and TargetCloseRange --目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_GetUnitBuffTime("player","复仇之怒")==0 --复仇之怒BUFF
		and
		(
			HolyPower>=4 --神圣能量
			or
			(
				not IsPlayerSpell(406545) --没学天赋[正义先锋]
				and
				HolyPower>=3 --神圣能量
			)
		)
		then
			if WR_PaladinRetribution_Use_SP() then return true end	--使用饰品
			if WR_ColorFrame_Show("SF11","复仇之怒") then return true end
		end		
		
		--圣洁鸣钟
		if TargetRange<=30	--目标在30码
		and zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("圣洁鸣钟")	--技能可用 资源可用
		and HolyPower<=3	--神圣能量<=3
		and
		(
			HolyPower<=2	--神圣能量<=2
			or
			WR_GetUnitDebuffTime("target","审判",true)==0	--目标没有审判debuff
		)
		and WR_GetUnitBuffTime("player","复仇之怒")>GCD+0.2 --复仇之怒BUFF
		then
			if WR_ColorFrame_Show("CF3","圣洁鸣钟") then return true end
		end
	
		--处决宣判
		if WR_SpellUsable("处决宣判") --技能可用 资源可用
		and TargetCloseRange --目标在近战范围内
		and
		(
			(
				zhandoumoshi==1 --开爆发
				and
				WR_GetUnitBuffTime("player","复仇之怒")>GCD+0.2 --复仇之怒BUFF
			)
			or
			WR_GetGCD("复仇之怒")>=20 --复仇之怒CD>=20
		)
		then
			if WR_ColorFrame_Show("SF12","处决宣判") then return true end
		end
		
		--最终清算
		if WR_SpellUsable("最终清算")	--技能可用 资源可用
		and TargetCloseRange --目标在近战范围内
		and zhandoumoshi==1 --开爆发
		and WR_GetUnitBuffTime("player","复仇之怒")>GCD+0.2 --复仇之怒BUFF
		and
		(
			HolyPower>=4 --神圣能量
			or
			(
				not(IsPlayerSpell(406545)) --没学天赋[正义先锋]
				and
				HolyPower>=3 --神圣能量
			)
		)
		then
			if WR_ColorFrame_Show("SF12","最终清算") then return true end
		end
	else	--学了 [光辉荣耀]
		--圣洁鸣钟
		if TargetRange<=30	--目标在30码
		and zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("圣洁鸣钟")	--技能可用 资源可用
		and HolyPower<=3	--神圣能量<=3
		and
		(
			HolyPower<=2	--神圣能量<=2
			or
			WR_GetUnitDebuffTime("target","审判",true)==0	--目标没有审判debuff
		)
		and WR_GetGCD("灰烬觉醒")<7	--灰烬觉醒冷却时间小于7秒,也就是圣洁鸣钟可以在灰烬后维持8秒以上(震击两次)
		and
		(
			(
				IsPlayerSpell(343527)	--已学 处决宣判
				and
				(
					( CJXP_CastTime~=nil and GetTime()-CJXP_CastTime<=3 )	--处决宣判刚放3秒内
					or
					WR_GetGCD("处决宣判")<3.5	--处决宣判CD还有不到3秒
				)
			)
			or
			(
				IsPlayerSpell(343721)	--已学 最终清算
				and
				WR_GetGCD("最终清算")<3.5	--最终清算CD<3
			)
		)
		then
			if WR_ColorFrame_Show("CF3","圣洁鸣钟") then return true end
		end
	
		--处决宣判 最终清算
		if TargetCloseRange --目标在近战范围内
		and zhandoumoshi==1 then	--爆发开启
			if
			(
				HolyPower<=4	--神圣能量<=4
				and
				WR_GetGCD("处决宣判")<GCD+MaxGCD --处决宣判CD<1个GCD
			)
			and
			(
				(
					IsPlayerSpell(406940)	--已学天赋[处决者的意志] 处决宣判12秒
					and
					WR_GetGCD("灰烬觉醒")<4	--灰烬给的征伐可以打在 处决宣判 持续时间内
				)
				or
				(
					not IsPlayerSpell(406940)	--没学天赋[处决者的意志] 处决宣判8秒
					and
					WR_GetGCD("灰烬觉醒")<=GCD	--灰烬给的征伐可以打在 处决宣判 持续时间内
				)
			)
			then
				if WR_ColorFrame_Show("SF12","处决宣判") then return true end
			end
			
			if WR_SpellUsable("最终清算") --技能可用 资源可用
			and
			(
				(
					IsPlayerSpell(406940)	--已学天赋[处决者的意志] 最终清算16秒
					and
					WR_GetGCD("灰烬觉醒")<6	--灰烬给的征伐可以打在 最终清算 持续时间内
				)
				or
				(
					not IsPlayerSpell(406940)	--没学天赋[处决者的意志] 最终清算12秒
					and
					WR_GetGCD("灰烬觉醒")<2	--灰烬给的征伐可以打在 最终清算 持续时间内
				)
			)
			then
				if WR_PaladinRetribution_ZJJ("清豆") then return true end	--终结技 清豆
				if WR_ColorFrame_Show("SF12","最终清算") then return true end
			end
		end

		--灰烬觉醒
		if TargetCloseRange --目标在近战范围内
		and zhandoumoshi==1	--开爆发
		and WR_GetGCD("灰烬觉醒")<=0.5 --灰烬觉醒CD<=0.5
		and HolyPower~=5	--神圣能量不是满的
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
--[[
				and
				WR_GetGCD("处决宣判")>GCD+MaxGCD	--天锤已经用了
				and
				(
					not IsPlayerSpell(406940)	--没学天赋[处决者的意志] 天锤8秒
					or
					(
						IsPlayerSpell(406940)	--已学天赋[处决者的意志]
						and
						(CJXP_CastTime~=nil and GetTime()-CJXP_CastTime>=4-GCD)	--天锤12秒,过去超过4秒,剩下不到8秒
					)
				)
--]]
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
			if WR_PaladinRetribution_Use_SP() then return true end	--使用饰品
			if WR_ColorFrame_Show("CF1","灰烬觉醒") then return true end
		end
	end

	if WR_PaladinRetribution_SGZC() then return true end	--圣光之锤
	if WR_PaladinRetribution_ZJJ("满豆") then return true end	--终结技 满豆
	if WR_PaladinRetribution_SDQSZJ("优先") then return true end	--圣殿骑士斩击 神圣能量未满,且圣殿骑士斩击二段时间即将结束
	if WR_PaladinRetribution_ZJJ("征伐") then return true end	--终结技 续征伐
	if WR_PaladinRetribution_GZZJ("异端") then return true end	--公正之剑 AOE
	if WR_PaladinRetribution_GZZJ("AOE") then return true end	--公正之剑 AOE
	if WR_PaladinRetribution_FNZC("单优") then return true end	--愤怒之锤 单体增益优先
	if WR_PaladinRetribution_SDQSDJ() then return true end	--圣殿骑士打击
	if WR_PaladinRetribution_ShenPan() then return true end	--审判
	if WR_PaladinRetribution_GZZJ() then return true end	--公正之剑
	if WR_PaladinRetribution_FNZC("单体") then return true end	--愤怒之锤 单体
	if WR_PaladinRetribution_SDQSZJ() then return true end	--圣殿骑士斩击
	--if WR_PaladinRetribution_ZJJ("BUFF") then return true end	--终结技 各种增益
	if WR_PaladinRetribution_ZJJ() then return true end	--终结技
	if WR_PaladinRetribution_FNZC() then return true end	--愤怒之锤
	if WR_PaladinRetribution_SZJDJ() then return true end	--十字军打击
	
	return false
end

--圣光之锤
function WR_PaladinRetribution_SGZC()
	if TargetRange<=12	--目标距离
	and IsSpellOverlayed(427453)	--圣光之锤 技能激活触发
	and C_Spell.IsSpellUsable(427453)	--技能资源足够
	then
		if WR_ColorFrame_Show("CF1","圣光之锤") then return true end
	end
	return false
end

--圣殿骑士斩击
function WR_PaladinRetribution_SDQSZJ(Text)
	if TargetCloseRange --目标在近战范围内
	and IsSpellOverlayed(406647) --圣殿骑士斩击 技能激活触发
	then
		if Text==""
		or
		(
			Text=="优先"
			and SDQSDJ_CastTime~=nil	--圣殿骑士打击 施法时间存在
			and GetTime()-SDQSDJ_CastTime>=5-GCD-MaxGCD-Latency	--圣殿骑士斩击最后一次可施法的时间
		)
		then
			if WR_ColorFrame_Show("CF9","斩击"..(Text or "")) then return true end
		end
	end
	return false
end

--圣殿骑士打击
function WR_PaladinRetribution_SDQSDJ()
	if TargetCloseRange --目标在近战范围内
	and WR_SpellUsable("圣殿骑士打击") --技能可用
	and not IsSpellOverlayed(406647) --没有激活 圣殿骑士斩击
	then
		if WR_ColorFrame_Show("CF9","圣殿骑士打击") then return true end
	end
	return false
end
	
--十字军打击
function WR_PaladinRetribution_SZJDJ()
	if TargetCloseRange --目标在近战范围内
	and WR_SpellUsable("十字军打击") --技能可用 资源可用
	and not IsPlayerSpell(404542) --没有学习 [远征打击]
	and not IsPlayerSpell(406646) --没有学习 [圣殿骑士之击]
	then
		if WR_ColorFrame_Show("CF9","十字军打击") then return true end
	end
	return false
end
	
--公正之剑
function WR_PaladinRetribution_GZZJ(Text)
	if TargetRange<=20 --目标在 20 码
	and WR_SpellUsable("公正之剑") --技能可用 资源可用
	and
	(
		HolyPower<=3	--神圣能量<=3
		or
		not IsPlayerSpell(383342)	--没学 神圣之刃
	)
	then
		if
		(
			Text=="AOE"
			and
			HUCountRange5>=2	--5码单位数量>=2
			and
			IsPlayerSpell(403826)	--已学 复仇之剑
		)
		or
		Text==nil
		or
		(
			Text=="异端"
			and
			WR_GetUnitDebuffInfo("target","异端逐除",true)<=GCD	--目标没有异端逐除DEBUFF
		)
		then
			if WR_ColorFrame_Show("CF7","公正"..(Text or "")) then return true end
		end
	end
	return false
end

--审判
function WR_PaladinRetribution_ShenPan(Text)
	if TargetRange<=30 --目标在 30 码
	and WR_SpellUsable("审判") --技能可用 资源可用
	and
	(
		HolyPower<=3	--神圣能量<=3
		or
		not IsPlayerSpell(405278)	--没学技能 [无尽审判]
	)
	then
		if WR_ColorFrame_Show("CF4","审判") then return true end
	end
	return false
end

--愤怒之锤
function WR_PaladinRetribution_FNZC(Text)
	if TargetRange<=30 --目标在 30 码
	and WR_SpellUsable("愤怒之锤") --技能可用 资源可用
	and IsSpellOverlayed(24275) --愤怒之锤 技能激活触发
	and
	(
		HolyPower<=3	--神圣能量<=3
		or
		UnitHealth("target")/UnitHealthMax("target")>20	--目标血量>20%	--血量大于20%,第一时间打掉,因为会继续刷新触发
		or
		not IsPlayerSpell(383314)	--没学 先锋之势(愤怒之锤没有层数,需要第一时间打掉,不然可能溢出)
	)
	then
		if
		(
			Text=="单优"
			and
			(
				HUCountRange5<2	--5码单位<2
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
				HUCountRange5<2	--5码单位<2
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
	if
	Text==nil
	or
	Text=="清豆"
	or
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
					WR_GetUnitBuffTime("player","圣洁共鸣")>GCD	--圣洁共鸣 BUFF存在
					or
					(
						zhandoumoshi==1	--爆发 开启
						and
						WR_GetGCD("灰烬觉醒")<=GCD+MaxGCD*2	--灰烬觉醒小于2个GCD就冷却完毕
					)
				)
			)
		)
	)
	or
	(
		Text=="征伐"
		and
		WR_GetUnitBuffTime("player","征伐")>GCD	--征伐存在
		and
		WR_GetUnitBuffCount("player","征伐")<10	--征伐未满
	)
	or
	(
		Text=="BUFF"
		and
		(
			UnitHealth("target")/UnitHealthMax("target")<=0.20	--目标血量<=20%
			or
			WR_GetUnitBuffTime("player","复仇之怒")>GCD	--复仇之怒存在
			or
			WR_GetUnitBuffTime("player","征伐")>GCD	--征伐存在
			or
			WR_GetUnitBuffTime("player","苍穹之力")>GCD	--苍穹之力存在 免费风暴
		)
	)
	then
		if WR_PaladinRetribution_SSFB(Text) then return true end	--神圣风暴
		if WR_PaladinRetribution_ZZSP(Text) then return true end	--最终审判
	end
end

--神圣风暴
function WR_PaladinRetribution_SSFB(Text)
	if TargetCloseRange --目标在近战范围内
	and WR_SpellUsable("神圣风暴")	--技能可用 资源可用
	and not IsSpellOverlayed(427453)	--圣光之锤 技能没有激活触发
	and
	(
		(
			HUCountRange5==1	--5码单位数量==1
			and
			SSFB_Sum==1	--神圣风暴设定单位数量==1
		)
		or
		(
			HUCountRange5>=SSFB_Sum	--5码单位数量>=神圣风暴设定单位数量
			and
			not WR_SingleUnit()	--不是单体目标
		)
		or
		WR_GetUnitBuffTime("player","苍穹之力")>GCD	--苍穹之力存在 免费风暴
	)
	and
	(
		WR_GetUnitBuffTime("player",387178)==0	--苍穹之遗 buff不存在
		and
		WR_GetUnitBuffCount("player","神圣仲裁者")<25	--神圣仲裁者buff<25层
		and
		WR_GetUnitBuffTime("player",453433)==0	--判罚处刑人 buff不存在
	)
	then
		if WR_ColorFrame_Show("CF5","风暴"..(Text or "")) then return true end
	end
	return false
end
	
--最终审判
function WR_PaladinRetribution_ZZSP(Text)
	if TargetRange<=30 --目标在 30 码
	and
	(
		WR_SpellUsable(85256) --技能可用 [圣殿骑士的裁决]
		or
		WR_SpellUsable("最终审判") --技能可用
	)
	and not IsSpellOverlayed(427453) --圣光之锤 技能没有激活触发
	then
		if WR_ColorFrame_Show("SF6","裁决"..(Text or "")) then return true end
	end
	return false
end
	
--[[
--最佳的连击技能
function WR_PaladinRetribution_BestComboSpell(Count)
	local HolyPowerSpell_Sum=0	--终结技伤害
	local GZZJ_Sum=0	--公正之剑
	
	local UnitCount	--附近单位数量
	if Count~=nil then
		UnitCount=Count
	else
		UnitCount=HUCountRange5
	end
	
	if UnitCount<=1 then
		HolyPowerSpell_Sum=WR_GetSpellValue(383328,"造成","点")	--最终审判
	else
		HolyPowerSpell_Sum=WR_GetSpellValue(53385,"造成","点")*UnitCount	--神圣风暴
		if IsPlayerSpell(383396) then
		--已学 [光明使者的风暴]
			HolyPowerSpell_Sum=HolyPowerSpell_Sum*1.2
		end
	end
	
	
	if TargetRange<=30 then
		GZZJ_Sum=GZZJ_Sum+WR_GetSpellValue(184575,"对目标造成","点")
		if IsPlayerSpell(403826) then
		--已学 [复仇之剑]
			if UnitCount<=6 then
				GZZJ_Sum=GZZJ_Sum+WR_GetSpellValue(403826,"造成","点")*(UnitCount-1)
			else
				GZZJ_Sum=GZZJ_Sum+WR_GetSpellValue(403826,"造成","点")*(6-1)
				GZZJ_Sum=GZZJ_Sum+WR_DamageMitigation(WR_GetSpellValue(403826,"造成","点"),UnitCount-1,6)
			end
		end
		if IsPlayerSpell(383342) then
		--已学 [神圣之刃]
			
		end
	end

	print(GZZJ_Sum)
	return
end
--]]

