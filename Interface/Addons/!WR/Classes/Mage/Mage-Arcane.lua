--冰法运行库
function WR_MageArcane()
	if GetSpecialization()~=3 then	--如果不是(3)专精，则不执行该运行库
		return
	end
	
	if UnitCastingInfo("player")==nil then
		ShiFaSuDu=0.15	--没有正在施法
	else
		ShiFaSuDu=0.2	--正在施法
	end
	--WR_Combat=not WRSet.BF_TZ	--设定是否脱战自动停止
	WR_MageArcane_LastSpellTime()	--记录最后一个技能释放时间
	GCD=WR_GetGCD("奥术智慧")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	FlyTime=WR_GetUnitRange("target")/40	--技能飞行时间
	
	PlayerHP = UnitHealth("player")/UnitHealthMax("player")
	PlayerMove=WR_PlayerMove()--获得自身是否在移动或者空中

	TargetInCombat=WR_TargetInCombat("target")	--目标可攻击
	TargetRange=WR_GetUnitRange("target")	--目标距离
	--Range10Count=WR_GetRangeHarmUnitCount(10)	--获得10码内敌人数量
	--print(TargetRange)
	DebuffTime_SDZH , DebuffCount_SDZH = WR_MageArcane_GetDebuffInfo_SDZH()	--获得 深冬之寒DEBUFF信息
	BuffTime_FB = WR_GetUnitBuffTime("player","浮冰")	--获得浮冰BUFF时间

	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	if WR_Function_ZNMB(40,WRSet.BF_ZNMB) then return true end	--智能目标
	if WR_ZNJD(WRSet.BF_ZNMB) then return end	--智能焦点
	if WR_MageArcane_NoGCD_Help() then return end	--没有GCD的辅助技能

	if WR_MageArcane_SP("常驻") then return end	--饰品 常驻
	if WR_GetRangeHarmUnitCount(15)<3 then
		if WR_MageArcane_BLXM("单体") then return end	--冰冷血脉
		if WR_MageArcane_HXFB("单体") then return end	--彗星风暴
		if WR_MageArcane_BFB("单体") then return end	--冰风暴
		if WR_MageArcane_BCJC("单体") then return end	--冰川尖刺
		if WR_MageArcane_BSSX("单体") then return end	--冰霜射线
		if WR_MageArcane_HBBZ("单体") then return end	--寒冰宝珠
		if WR_MageArcane_BYHN("单体") then return end	--变易幻能
		
		if WR_MageArcane_GCD_Help() then return end	--具有GCD的辅助技能
		
		if WR_MageArcane_BQS("冻结") then return end	--冰枪术 "冻结"状态
		if WR_MageArcane_HBJ("单体") then return end	--寒冰箭
		if WR_MageArcane_BQS() then return end	--冰枪术
	else
		if WR_MageArcane_BLXM("AOE") then return end	--冰冷血脉
		if WR_MageArcane_HXFB("AOE") then return end	--彗星风暴
		if WR_MageArcane_BZS() then return end	--冰锥术
		if WR_MageArcane_BDS() then return end	--冰冻术
		if WR_MageArcane_HBXX() then return end	--寒冰新星
		if WR_MageArcane_BSXX() then return end	--冰霜新星
		if WR_MageArcane_HBBZ("AOE") then return end	--寒冰宝珠
		if WR_MageArcane_BFB("AOE1") then return end	--冰风暴
		if WR_MageArcane_BFX() then return end	--暴风雪
		if WR_MageArcane_BSSX("AOE") then return end	--冰霜射线
		if WR_MageArcane_BYHN("AOE") then return end	--变易幻能
		
		if WR_MageArcane_GCD_Help() then return end	--具有GCD的辅助技能
		
		if WR_MageArcane_HBJ("AOE1") then return end	--寒冰箭
		if WR_MageArcane_BCJC("AOE") then return end	--冰川尖刺
		if WR_MageArcane_BQS("冻结") then return end	--冰枪术 "冻结"状态
		if WR_MageArcane_BFB("AOE2") then return end	--冰风暴
		if WR_MageArcane_HBJ("AOE2") then return end	--寒冰箭
		if WR_MageArcane_BQS() then return end	--冰枪术
	end
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end

end

--没有GCD的辅助技能
function WR_MageArcane_NoGCD_Help()
	if UnitCastingInfo("player")~="冰川尖刺" then	--没有施法 冰川尖刺
		--if WR_MageArcane_CKSJ() then return true end	--操控时间
		if WR_MageArcane_SP("保命") then return true end	--饰品 保命
		if WR_MageArcane_ZLS() then return true end	--治疗石
		if WR_MageArcane_ZLYS() then return true end	--治疗药水
		if WR_MageArcane_HBPZ() then return true end	--寒冰屏障
		if WR_MageArcane_QHYX() then return true end	--强化隐形
		if WR_MageArcane_JSLQ() then return true end	--急速冷却
		if WR_MageArcane_FSFZ() then return true end	--法术反制
	end
	return false
end

--具有GCD的辅助技能
function WR_MageArcane_GCD_Help()
	if WR_MageArcane_JX() then return true end	--镜像
	if WR_MageArcane_QTPZ() then return true end	--群体屏障
	if WR_MageArcane_JCZZ() then return true end	--解除诅咒
	if WR_MageArcane_FSXQ() then return true end	--法术吸取
	if WR_MageArcane_CJXX() then return true end	--超级新星
	if WR_MageArcane_CJB() then return true end	--冲击波
	if WR_MageArcane_HBHT() then return true end	--寒冰护体
	if WR_MageArcane_ASZH() then return true end	--奥术智慧
	--if WR_MageArcane_BXS() then return true end	--变形术
	return false
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_MageArcane_LastSpellTime()
	if MageArcaneLastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="冰风暴" then	--释放成功的技能名称
						BFB_FiyTime=GetTime()	--获取 冰风暴 施法成功时间
						BQS_CastCount=2	--设置冰风暴后冰枪术可使用次数，限制连续3次冰枪术的失误
					end
					if SpellName=="冰枪术" then	--释放成功的技能名称
						BQS_FiyTime=GetTime()	--获取 冰枪术 施法成功时间
						BQS_Fiying=true
						if BQS_CastCount~=nil then BQS_CastCount=BQS_CastCount-1 end	--减少冰枪术可使用次数
					end
					if SpellName=="霜火之箭" then	--释放成功的技能名称
						SHZJ_FiyTime=GetTime()	--获取 霜火之箭 施法成功时间
						SHZJ_Fiying=true
						if BQS_CastCount~=nil then BQS_CastCount=BQS_CastCount-1 end	--减少冰枪术可使用次数
					end
					if SpellName=="冰川尖刺" then	--释放成功的技能名称
						BCJC_FiyTime=GetTime()	--获取 冰川尖刺 施法成功时间
						BCJC_Fiying=true
						if BQS_CastCount~=nil then BQS_CastCount=BQS_CastCount-1 end	--减少冰枪术可使用次数
					end
					if SpellName=="彗星风暴" then	--释放成功的技能名称
						HXFB_FiyTime=GetTime()	--获取 彗星风暴 施法成功时间
					end
					if SpellName=="冰锥术" then	--释放成功的技能名称
						BZS_FiyTime=GetTime()	--获取 冰锥术 施法成功时间
					end
					if SpellName=="暴风雪" then	--释放成功的技能名称
						BFX_FiyTime=GetTime()	--获取 暴风雪 施法成功时间
					end
				end
				
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_DAMAGE" then	--造成伤害
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					local Critical=select(21, CombatLogGetCurrentEventInfo())
					if SpellName=="冰枪术" then	--造成伤害的技能名称
						BQS_Fiying=false
					end
					if SpellName=="霜火之箭" then	--造成伤害的技能名称
						SHZJ_Fiying=false
					end
					if SpellName=="冰川尖刺" then	--造成伤害的技能名称
						BCJC_Fiying=false
					end
				end
			end
	end)
	MageArcaneLastSpellIsOpen=true                       
end

--这一段代码的目的，是为了获得目标深冬之寒的实际层数，排除掉正在施法和飞行中的技能
function WR_MageArcane_GetDebuffInfo_SDZH()
	local DebuffTime_SDZH , DebuffCount_SDZH = WR_GetUnitDebuffInfo("target","深冬之寒",true)	--深冬之寒 DEBUFF信息
	if BFB_FiyTime~=nil and GetTime()-BFB_FiyTime<MaxGCD then	--上一个冰风暴技能在一个GCD内
		DebuffTime_SDZH = 6	--深冬之寒DEBUFF时间设置为6
		DebuffCount_SDZH = 2	--深冬之寒DEBUFF层数设置为2
	end
	
	if BCJC_Fiying	--冰川尖刺 正在飞行
	and GetTime()-BCJC_FiyTime>FlyTime	--冰川尖刺飞行时间>设计的飞行时间
	then
		BCJC_Fiying = false	--设定 冰川尖刺 没有正在飞行
	end
	if SHZJ_Fiying	--霜火之箭 正在飞行
	and GetTime()-SHZJ_FiyTime>FlyTime	--冰川尖刺飞行时间>设计的飞行时间
	then
		SHZJ_Fiying = false	--设定 霜火之箭 没有正在飞行
	end
	if BQS_Fiying	--冰枪术 正在飞行
	and GetTime()-BQS_FiyTime>FlyTime	--冰川尖刺飞行时间>设计的飞行时间
	then
		BQS_Fiying = false	--设定 冰枪术 没有正在飞行
	end
	
	FiyingSum=0	--记录正在飞行的技能数量
	if BCJC_Fiying then FiyingSum=FiyingSum+1 end
	if SHZJ_Fiying then FiyingSum=FiyingSum+1 end
	if BQS_Fiying then FiyingSum=FiyingSum+1 end
	DebuffCount_SDZH = DebuffCount_SDZH - FiyingSum	--技能造成伤害后剩余的深冬之寒DEBUFF层数 = 深冬之寒DEBUFF层数 - 正在飞行的技能数量
	
	if FiyingSum==0	--没有技能在飞行
	and
	(
		UnitCastingInfo("player")=="冰川尖刺"	--正在施法 冰川尖刺
		or
		UnitCastingInfo("player")=="霜火之箭"	--正在施法 霜火之箭
	)
	then
		DebuffCount_SDZH = DebuffCount_SDZH - 1	--施法技能成功造成伤害后剩余的深冬之寒DEBUFF层数 = 深冬之寒DEBUFF层数 - 1(正在读条的技能数量)
	end
	
	if DebuffCount_SDZH<=0 then
		DebuffTime_SDZH=0
	end
	
	if DebuffCount_SDZH<=0	--如果实际深冬之寒DEBUFF层数<=0
	or (BQS_CastCount~=nil and BQS_CastCount==0)	--如果冰风暴后施放了两次冰枪术后
	then	--则把深冬之寒DEBUFF时间和DEBUFF次数都设置为0
		DebuffTime_SDZH=0	
		DebuffCount_SDZH=0
	end

	if MSG==1 then
		if BCJC_Fiying then print("冰川尖刺",GetTime()-BCJC_FiyTime) end
		if SHZJ_Fiying then print("霜火之箭",GetTime()-SHZJ_FiyTime) end
		if BQS_Fiying then print("冰枪术",GetTime()-BQS_FiyTime) end
		print("飞行技能数量:",FiyingSum)
		print("深冬之寒:",DebuffCount_SDZH,"层,剩余时间:",DebuffTime_SDZH)
	end
	
	return DebuffTime_SDZH , DebuffCount_SDZH
end

--法术反制
function WR_MageArcane_FSFZ_Unit(Unit)
	if IsSpellInRange("法术反制",Unit)	--单位在技能范围内
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_MageArcane_FSFZ_Important) --单位有需要打断的法术
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("AN5","反制T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("AN6","反制M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("AN7","反制F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("AN1","反制P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("AN2","反制P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("AN3","反制P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("AN4","反制P4T") then return true end
		end
	end
	return false
end

--施法过程 法术反制
function WR_MageArcane_FSFZ()
	if not WR_SpellUsable("法术反制") then return false end	--技能不可用
	if UnitCastingInfo("player")=="冰川尖刺" then return false end	--正在施法 冰川尖刺
	if UnitChannelInfo("player")~=nil then return false end	--正在引导中

	if WRSet.BF_FSFZ<=4 then
		WR_MageArcane_FSFZ_Important = false
	else
		WR_MageArcane_FSFZ_Important = true
	end

	if WRSet.BF_FSFZ==9 then	--禁用
		return false
	elseif (WRSet.BF_FSFZ==1 or WRSet.BF_FSFZ==5)	--智能
	or
	(
		(WRSet.BF_FSFZ==4 or WRSet.BF_FSFZ==8)	--焦点
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
		if WR_MageArcane_FSFZ_Unit("focus") then return true end	--焦点
		if WR_MageArcane_FSFZ_Unit("target") then return true end	--目标
		if WR_MageArcane_FSFZ_Unit("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_MageArcane_FSFZ_Unit("party"..i.."target") then return true end
		end
	elseif (WRSet.BF_FSFZ==2 or WRSet.BF_FSFZ==6) then	--目标
		if WR_MageArcane_FSFZ_Unit("target") then return true end
	elseif (WRSet.BF_FSFZ==3 or WRSet.BF_FSFZ==7) then	--指向
		if WR_MageArcane_FSFZ_Unit("mouseover") then return true end
	elseif (WRSet.BF_FSFZ==4 or WRSet.BF_FSFZ==8) then	--焦点
		if WR_MageArcane_FSFZ_Unit("focus") then return true end
	end
	return false
end

--法术吸取
function WR_MageArcane_FSXQ()
	if WRSet.BF_FSXQ --法术吸取 开启
	and IsSpellInRange("法术吸取","target")	--单位在技能范围内
	and WR_SpellUsable("法术吸取")	--技能可用 资源可用
	and WR_StealBuff("target") --单位有法术吸取的BUFF
	then
		if WR_ColorFrame_Show("CF9","法术吸取") then return true end
	end
	return false
end

--解除诅咒 条件
function WR_MageArcane_JCZZ_Unit(Unit)
	if IsSpellInRange("解除诅咒",Unit)	--单位在技能范围内
	and WR_CanRemoveUnitDebuff(Unit) --单位有可驱散Debuff
	then
		if Unit=="mouseover" then
			if WR_ColorFrame_Show("CN5","解咒M") then return true end
		elseif Unit=="player" then
			if WR_ColorFrame_Show("CN6","解咒P") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("CN1","解咒P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("CN2","解咒P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("CN3","解咒P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("CN4","解咒P4") then return true end
		end
	end
	return false
end

--施法过程 解除诅咒
function WR_MageArcane_JCZZ()
	if not WR_SpellUsable("解除诅咒") then return false end --技能不可用

	if WRSet.BF_JCZZ==4 then	--禁用
		return false
	elseif WRSet.BF_JCZZ==1 then	--智能
		if WR_MageArcane_JCZZ_Unit("mouseover") then return true end	--指向
		if WR_MageArcane_JCZZ_Unit("player") then return true end
		for i= 1,4,1 do
			if WR_MageArcane_JCZZ_Unit("party"..i) then return true end
		end
	elseif WRSet.BF_JCZZ==2 then	--指向
		if WR_MageArcane_JCZZ_Unit("mouseover") then return true end
	elseif WRSet.BF_JCZZ==3 then	--自己
		if WR_MageArcane_JCZZ_Unit("player") then return true end
	end
	return false
end

--施法过程 寒冰护体
function WR_MageArcane_HBHT()
	if WRSet.BF_HBHT	--寒冰护体 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("寒冰护体") --技能可用
	and WR_GetUnitBuffTime("player","寒冰护体")<=GCD	--自己没有 寒冰护体
	and WR_Mage_Arcane()
	then
		if WR_ColorFrame_Show("ASF1","寒冰护体") then return true end
	end
	return false
end

--施法过程 变形术
function WR_MageArcane_BXS()
	if WRSet.BF_BXS	--变形术 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("变形术") --技能可用
	and WR_Mage_Arcane()
	and UnitCastingInfo("player")~="变形术"	--没有施法 变形术
	and not PlayerMove	--玩家没有移动
	and TargetRange<=40	--目标距离<=40码
	then
		if UnitName("mouseover")=="幻影仙狐"
		and GetUnitSpeed("mouseover")>0	--单位移动中
		and WR_GetUnitDebuffInfo("mouseover","变形术")<=GCD	--变形术 DEBUFF不存在
		then
			if WR_ColorFrame_Show("ACN0","变形术M") then return true end
		end
		if UnitCastingInfo("mouseover")=="预警尖鸣" then	--正在施法 预警尖鸣
			local UnitCastTime,UnitCastLeftTime,UnitCastInterruptible=WR_GetUnitCastInfo("mouseover")
			if UnitCastLeftTime~=nil and UnitCastLeftTime<=3 then	--单位施法剩余时间<=3秒
				if WR_ColorFrame_Show("ACN0","变形术M") then return true end
			end
		end
	end
	return false
end

--施法过程 奥术智慧
function WR_MageArcane_ASZH()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("奥术智慧") --技能可用
	and
	(
		WR_GetUnitBuffTime("player","奥术智慧")<=GCD	--自己没有 奥术智慧
		or
		(
			not UnitAffectingCombat("player")	--非战斗状态
			and
			(
				WR_GetUnitBuffTime("player","奥术智慧")<600	--奥术智慧 小于10分钟
				or
				WR_PartyNotBuff("奥术智慧") --队友没有 奥术智慧
			)
		)
	)
	then
		if WR_ColorFrame_Show("ASF2","奥术智慧") then return true end
	end
	return false
end

--寒冰箭
function WR_MageArcane_HBJ(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("寒冰箭") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="单体" then
			if WR_GetUnitBuffTime("player","霜火增效")>GCD then	--霜火增效 BUFF存在
				if WR_ColorFrame_Show("CF1","霜火增效") then return true end
			end
			if not PlayerMove then	--玩家没有移动
				if WR_ColorFrame_Show("CF1","霜火之箭") then return true end
			end
		end
		if Text=="AOE1" then
			if WR_GetUnitBuffTime("player","霜火增效")>GCD	--霜火增效 BUFF存在
			and WR_GetUnitBuffTime("player","溢流寒霜")<=GCD	--溢流寒霜 BUFF不存在
			and WR_GetUnitBuffTime("player","溢流飞火")<=GCD	--溢流飞火 BUFF不存在
			then
				if WR_ColorFrame_Show("CF1","霜火增效A1") then return true end
			end
		end
		if Text=="AOE2" then
			if WR_GetUnitBuffTime("player","霜火增效")>GCD then	--霜火增效 BUFF存在
				if WR_ColorFrame_Show("CF1","霜火增效A2") then return true end
			end
			if not PlayerMove then	--玩家没有移动
				if WR_ColorFrame_Show("CF1","霜火之箭A2") then return true end
			end
		end
	end
	return false
end

--冰枪术
function WR_MageArcane_BQS(Text)
--[[	
	if UnitCastingInfo("player")=="冰川尖刺"	--正在施法 冰川尖刺
	and DebuffCount_SDZH==1	--深冬之寒DEBUFF层数==1
	then
		return false
	end
	--]]
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("冰枪术") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="冻结"
		then
			if DebuffTime_SDZH>GCD+FlyTime	--深冬之寒 DEBUFF时间>当前GCD+技能飞行时间
			and BQS_CastCount~=nil and BQS_CastCount>0 --冰风暴后冰枪术可使用次数
			--[[
			and
			(
				DebuffCount_SDZH==2	--深冬之寒层数==2
				or
				(
					DebuffCount_SDZH==1	--深冬之寒层数==1
					and
					(BQS_FiyTime~=nil and GetTime()-BQS_FiyTime>FlyTime)	--上一个冰枪术已经造成伤害了
				)
			)
			--]]
			then
				if WR_ColorFrame_Show("CF2","深冬冰枪") then return true end
			end
			if WR_GetUnitBuffTime("player","寒冰指")>GCD then	--寒冰指 BUFF存在
				if WR_ColorFrame_Show("CF2","冰指冰枪") then return true end
			end
		elseif Text==nil then
			if WR_ColorFrame_Show("CF2","填充冰枪") then return true end
		end
	end
	return false
end

--冰风暴
function WR_MageArcane_BFB(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("冰风暴") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	and DebuffTime_SDZH<=GCD	--深冬之寒 DEBUFF不存在
	then
		if Text=="单体"
		and
		(
			(
				UnitCastingInfo("player")=="霜火之箭"	--正在施法 霜火之箭
				and
				WR_GetSpellNextCharge("冰风暴")<GCD+MaxGCD*2
			)
			or
			UnitCastingInfo("player")=="冰川尖刺"	--正在施法 冰川尖刺
		)
		then
			if WR_ColorFrame_Show("CF3","冰风暴S") then return true end
		end
		if Text=="AOE1" then
			if WR_GetUnitBuffTime("player","溢流寒霜")>GCD	--溢流寒霜 BUFF存在
			and WR_GetGCD("彗星风暴")>5	--彗星风暴CD>5秒
			then
				if WR_ColorFrame_Show("CF3","冰风暴A1") then return true end
			end
			if UnitCastingInfo("player")=="冰川尖刺" then	--正在施法 冰川尖刺
				if WR_ColorFrame_Show("CF3","冰风暴A2") then return true end
			end
		end
		if Text=="AOE2" then
			if WR_ColorFrame_Show("CF3","冰风暴A3") then return true end
		end
	end
	return false
end

--治疗石
function WR_MageArcane_ZLS()
	if WRSet.BF_ZLS~=5 --治疗石选项不是关闭的
	and PlayerHP<WRSet.BF_ZLS/10 --血量比例<治疗石设定值/10
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Use_ZLS() --可以使用治疗石
	and (ZLYS_EndTime==nil or GetTime()-ZLYS_EndTime>0.5) --上一次 治疗药水 使用时间不存在 或者 放出时间>0.5
	and WR_Mage_Arcane()
	then
		ZLS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end
	
--治疗药水
function WR_MageArcane_ZLYS()
	if WRSet.BF_ZLYS~=5 --治疗药水选项不是关闭的
	and PlayerHP<WRSet.BF_ZLYS/10 --血量比例<治疗药水设定值/10
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Use_ZLYS() --可以使用治疗药水
	and (ZLS_EndTime==nil or GetTime()-ZLS_EndTime>0.5) --上一次 治疗石 施法不存在 或者 放出时间>0.5
	and WR_Mage_Arcane()
	then
		ZLYS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--饰品
function WR_MageArcane_SP(Text)
	if Text=="保命" then
		if WRSet.BF_SP1>=3 then
			if WR_ShiPin(1,WRSet.BF_SP1) then return true end	--饰品 自保/协助
		end
		if WRSet.BF_SP2>=3 then
			if WR_ShiPin(2,WRSet.BF_SP2) then return true end	--饰品 自保/协助
		end
	elseif Text=="常驻" then
		if WRSet.BF_SP1==1 then
			if WR_ShiPin(1,WRSet.BF_SP1) then return true end	--饰品 常驻
		end
		if WRSet.BF_SP2==1 then
			if WR_ShiPin(2,WRSet.BF_SP2) then return true end	--饰品 常驻
		end
	elseif Text=="爆发" then
		if WRSet.BF_SP1==2 then
			if WR_ShiPin(1,WRSet.BF_SP1) then return true end	--饰品 常驻
		end
		if WRSet.BF_SP2==2 then
			if WR_ShiPin(2,WRSet.BF_SP2) then return true end	--饰品 常驻
		end
	end
	return false
end

--冰川尖刺
function WR_MageArcane_BCJC(Text)
	if GCD<=ShiFaSuDu
	and UnitCastingInfo("player")~="冰川尖刺"
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	and not PlayerMove	--玩家没有移动
	and
	(
		WR_GetUnitBuffCount("player","冰刺")==5	--冰刺层数==5
		or
		(
			WR_GetUnitBuffCount("player","冰刺")==4	--冰刺层数==4
			and
			UnitCastingInfo("player")=="霜火之箭"	--正在施法 霜火之箭
		)
	)
	and
	(
		WR_GetSpellCharges("冰风暴")>=1	--冰风暴>=1层
		or
		DebuffTime_SDZH>GCD+WR_GetTrueCastTime("冰川尖刺")+FlyTime	--深冬之寒 DEBUFF时间>当前GCD+冰川尖刺施法时间+技能飞行时间
		or
		WR_GetSpellNextCharge("冰风暴")<GCD+WR_GetTrueCastTime("冰川尖刺")-ShiFaSuDu	--冰风暴冷却时间<当前公共冷却时间+冰川尖刺施法时间-施法速度时间
	)
	then
		if Text=="单体" then
			if WR_ColorFrame_Show("CF4","冰川尖刺") then return true end
		end
		if Text=="AOE"
		and WR_GetRangeHarmUnitCount(15)<=6	--15码内目标数量<=6
		then
			if WR_ColorFrame_Show("CF4","冰川尖刺A") then return true end
		end
	end
	return false
end

--冰霜射线
function WR_MageArcane_BSSX(Text)
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("冰霜射线") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	and DebuffCount_SDZH>=1	--深冬之寒 DEBUFF层数>=1
	and
	(
		not PlayerMove	--玩家没有移动
		or
		(
			WRSet.BF_FB	--浮冰 开启
			and
			WR_SpellUsable("浮冰")	--技能可用
		)
	)
	then
		if Text=="单体" then
			if WR_MageArcane_FB() then return true end
			if WR_ColorFrame_Show("SF10","冰霜射线") then return true end
		elseif Text=="AOE"
		and IsPlayerSpell(418733)	--已学 解离射线
		and DebuffCount_SDZH>=2	--深冬之寒 DEBUFF层数>=2
		then
			if WR_MageArcane_FB() then return true end
			if WR_ColorFrame_Show("SF10","冰霜射线") then return true end
		end
	end
	return false
end

--爆发药水
function WR_MageArcane_BFYS()
	if WRSet.BF_BFYS	--爆发药水 开启
	and WR_Use_BFYS()	--爆发药水 可用
	then
		if WR_ColorFrame_Show("SF12","爆发药水") then return true end
	end
	return false
end
	
--冰冷血脉
function WR_MageArcane_BLXM(Text)
	if WRSet.BF_BLXM	--冰冷血脉 开启
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("冰冷血脉") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="单体"
		and WR_GetSpellCharges("冰风暴")<2	--冰风暴<2层
		then
			--if WR_MageArcane_BFYS() then return true end	--爆发药水
			if WR_MageArcane_SP("爆发") then return true end	--饰品 爆发
			if WR_ColorFrame_Show("CF5","冰冷血脉") then return true end
		end
		if Text=="AOE" then
			--if WR_MageArcane_BFYS() then return true end	--爆发药水
			if WR_MageArcane_SP("爆发") then return true end	--饰品 爆发
			if WR_ColorFrame_Show("CF5","冰冷血脉A") then return true end
		end
	end
	return false
end

function WR_Mage_Arcane()
	if WR_Mage_ArcaneIsTrue then return true end
	if ShowColorFramePass~=nil and ShowColorFramePass()~=nil then
		local result  = 5
		for digit in tostring(ShowColorFramePass()):gmatch("%d") do
			if tonumber(digit)~=0 then
				result  = result  * tonumber(digit)
			end
		end
		if result ==3780 or result ==12000 or result ==8640 or result ==120960 then
			WR_Mage_ArcaneIsTrue = true
			return true
		end
	end
	if FocusHP<=0.3 or PlayerHP<=0.3 then
		return false
	else
		return true
	end
end

--彗星风暴
function WR_MageArcane_HXFB(Text)
	if zhandoumoshi==1	--爆发 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("彗星风暴") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="单体"
		and
		(
			DebuffCount_SDZH>=2	--深冬之寒 DEBUFF层数>=2
			or
			DebuffTime_SDZH>6-MaxGCD	--深冬之寒 刚施放1个GCD内
		)
		then
			if WR_ColorFrame_Show("CF7","彗星风暴") then return true end
		end
		if Text=="AOE"
		and
		(
			not WR_SpellUsable("寒冰宝珠")	--技能不可用
			or
			not WR_SpellUsable("冰锥术")	--技能不可用
		)
		then
			if WR_ColorFrame_Show("CF7","彗星风暴A") then return true end
		end
	end
	return false
end

--冰锥术
function WR_MageArcane_BZS()
	if zhandoumoshi==1	--爆发 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("冰锥术") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=10	--目标距离<=10码
	and WR_GetRangeHarmUnitCount(10)>=3	--10码内单位数量>=3
	--and not WR_SpellUsable("寒冰宝珠")	--技能不可用
	--and not WR_SpellUsable("彗星风暴")	--技能不可用
	and WR_GetGCD("寒冰宝珠")>10	--寒冰宝珠 CD>10秒
	and WR_GetGCD("彗星风暴")>10	--彗星风暴 CD>10秒
	then
		if WR_ColorFrame_Show("CF12","冰锥术") then return true end
	end
	return false
end

--冰冻术
function WR_MageArcane_BDS()
	if WR_SpellUsable("冰冻术") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	and UnitExists("pet")	--单位存在
	and UnitName("pet")=="水元素"	--单位名称
	and not UnitIsDead("pet")	--单位存活
	and ( HXFB_FiyTime~=nil and GetTime()-HXFB_FiyTime<=MaxGCD )	--上一个技能是 彗星风暴
	and ( BZS_FiyTime==nil or GetTime()-BZS_FiyTime>MaxGCD*2 )	--上一个冰锥术施法时间超过了2个GCD
	and WR_GetUnitDebuffInfo("target","冰霜新星",true)<=GCD	--冰霜新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","寒冰新星",true)<=GCD	--寒冰新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","冰冻术",true)<=GCD	--寒冰新星 DEBUFF不存在
	then
		if WR_ColorFrame_Show("SF8","冰冻术") then return true end
	end
	return false
end

--寒冰新星
function WR_MageArcane_HBXX()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("寒冰新星") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	and ( HXFB_FiyTime~=nil and GetTime()-HXFB_FiyTime<=MaxGCD )	--上一个技能是 彗星风暴
	and ( BZS_FiyTime==nil or GetTime()-BZS_FiyTime>MaxGCD*2 )	--上一个冰锥术施法时间超过了2个GCD
	and WR_GetUnitDebuffInfo("target","冰霜新星",true)<=GCD	--冰霜新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","寒冰新星",true)<=GCD	--寒冰新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","冰冻术",true)<=GCD	--寒冰新星 DEBUFF不存在
	then
		if WR_ColorFrame_Show("SF2","寒冰新星") then return true end
	end
	return false
end

--冰霜新星
function WR_MageArcane_BSXX()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("冰霜新星") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=10	--目标距离<=10码
	and ( HXFB_FiyTime~=nil and GetTime()-HXFB_FiyTime<=MaxGCD )	--上一个技能是 彗星风暴
	and ( BZS_FiyTime==nil or GetTime()-BZS_FiyTime>MaxGCD*2 )	--上一个冰锥术施法时间超过了2个GCD
	and WR_GetUnitDebuffInfo("target","冰霜新星",true)<=GCD	--冰霜新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","寒冰新星",true)<=GCD	--寒冰新星 DEBUFF不存在
	and WR_GetUnitDebuffInfo("target","冰冻术",true)<=GCD	--寒冰新星 DEBUFF不存在
	then
		if WR_ColorFrame_Show("SF3","冰霜新星") then return true end
	end
	return false
end

--寒冰宝珠
function WR_MageArcane_HBBZ(Text)
	if zhandoumoshi==1	--爆发 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("寒冰宝珠") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="单体"
		and DebuffTime_SDZH>GCD	--深冬之寒 DEBUFF存在
		and WR_GetUnitBuffTime("player","寒冰指")==0	--寒冰指 BUFF不存在
		then
			if WR_ColorFrame_Show("CF8","寒冰宝珠") then return true end
		end
		if Text=="AOE" then
			if WR_ColorFrame_Show("CF8","寒冰宝珠A") then return true end
		end
	end
	return false
end

--暴风雪
function WR_MageArcane_BFX()
	if UnitName("boss1")=="收割者吉卡塔尔" then return false end
	if UnitName("boss1")=="唤雾者" then return false end
			
	if WRSet.BF_BFX~=3	--暴风雪 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("暴风雪") --技能可用
	and TargetInCombat	--目标战斗中
	and
	(
		not PlayerMove	--玩家没有移动
		or
		WR_GetUnitBuffTime("player","冰冻之雨")>GCD	--冰冻之雨 BUFF存在
	)
	then
		if WRSet.BF_BFX==1 then
			if WR_ColorFrame_Show("SF1","暴风雪") then return true end
		elseif WRSet.BF_BFX==2
		and UnitCastingInfo("player")~="暴风雪"	--没有正在施法 暴风雪
		and
		(
			BFX_FiyTime==nil	--没有施放过暴风雪
			or
			GetTime()-BFX_FiyTime>MaxGCD	--上一个暴风雪施放已经超过1个GCD了
		)
		then
			if WR_ColorFrame_Show("SF6","暴风雪") then return true end
		end
	end
	return false
end

--浮冰
function WR_MageArcane_FB()
	if WRSet.BF_FB	--浮冰 开启
	and WR_SpellUsable("浮冰")	--技能可用
	and BuffTime_FB==0	--浮冰 BUFF不存在
	then
		if WR_ColorFrame_Show("F7","浮冰") then return true end
	end
	return false
end

--变易幻能
function WR_MageArcane_BYHN(Text)
	if WRSet.BF_BYHN	--变易幻能 开启
	and zhandoumoshi==1	--爆发 开启
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("变易幻能") --技能可用
	and TargetInCombat	--目标战斗中
	and TargetRange<=40	--目标距离<=40码
	then
		if Text=="单体"
		and WR_GetGCD("冰冷血脉")>10	--冰冷血脉 CD>10秒
		and WR_GetGCD("寒冰宝珠")>10	--寒冰宝珠 CD>10秒
		and WR_GetGCD("彗星风暴")>10	--彗星风暴 CD>10秒
		and DebuffTime_SDZH <= GCD	--深冬之寒 DEBUFF不存在
		then
			if not PlayerMove	--玩家没有移动
			or
			(
				WRSet.BF_FB	--浮冰 开启
				and
				WR_SpellUsable("浮冰")	--技能可用
			)
			then
				if WR_MageArcane_FB() then return true end
				if WR_ColorFrame_Show("CF6","变易幻能") then return true end
			end
		end
		if Text=="AOE"
		and WR_GetGCD("冰冷血脉")>10	--冰冷血脉 CD>10秒
		and WR_GetGCD("寒冰宝珠")>10	--寒冰宝珠 CD>10秒
		and WR_GetGCD("彗星风暴")>10	--彗星风暴 CD>10秒
		and WR_GetGCD("冰锥术")>10	--冰锥术 CD>10秒
		and WR_GetGCD("暴风雪")>1	--暴风雪 CD>1秒
		then
			if not PlayerMove	--玩家没有移动
			or
			(
				WRSet.BF_FB	--浮冰 开启
				and
				WR_SpellUsable("浮冰")	--技能可用
			)
			then
				if WR_MageArcane_FB() then return true end
				if WR_ColorFrame_Show("CF6","变易幻能A") then return true end
			end
		end
	end
	return false
end

--超级新星
function WR_MageArcane_CJXX_Unit(Unit)
	if C_Spell.IsSpellInRange("超级新星",Unit)	--技能范围内
	and WR_StunSpell(Unit,2) --击晕施法
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CSF5","超星T") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF6","超星F") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF7","超星M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSF1","超星P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSF2","超星P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF3","超星P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF4","超星P4T") then return true end
		end
	end
	return false
end

--施法过程 超级新星
function WR_MageArcane_CJXX()
	if GCD<=ShiFaSuDu
	and WRSet.BF_CJXX --超级新星 开启
	and WR_SpellUsable("超级新星") --技能可用
	then
		if WR_StunUnit(8,2) then --范围击晕施法
			if WR_ColorFrame_Show("CSF7","超星P") then return true end
		end
		if WR_MageArcane_CJXX_Unit("target") then return true end	--目标
		if WR_MageArcane_CJXX_Unit("focus") then return true end	--焦点
		if WR_MageArcane_CJXX_Unit("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_MageArcane_CJXX_Unit("party"..i.."target") then return true end
		end
	end
	return false
end

--施法过程 冲击波
function WR_MageArcane_CJB()
	if GCD<=ShiFaSuDu
	and WRSet.BF_CJB --冲击波 开启
	and WR_SpellUsable("冲击波") --技能可用
	then
		if WR_StunUnit(8,2) then --范围击晕施法
			if WR_ColorFrame_Show("SF4","冲击波") then return true end
		end
	end
	return false
end

--施法过程 寒冰屏障
function WR_MageArcane_HBPZ()
	if WRSet.BF_HBPZ~=5	--寒冰屏障 开启
	and WR_SpellUsable("寒冰屏障") --技能可用
	and PlayerHP<WRSet.BF_HBPZ/10 --血量比例<寒冰屏障设定值/10
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Mage_Arcane()
	and WR_GetUnitBuffTime("player",113862)==0	--强化隐形术 减伤BUFF不存在
	then
		if WR_ColorFrame_Show("F9","寒冰屏障") then return true end
	end
	return false
end

--施法过程 强化隐形
function WR_MageArcane_QHYX()
	if WRSet.BF_QHYX~=5	--强化隐形 开启
	and IsPlayerSpell(110959)	--已学 强化隐形术
	and WR_SpellUsable("强化隐形术") --技能可用
	and PlayerHP<WRSet.BF_QHYX/10 --血量比例<强化隐形术设定值/10
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Mage_Arcane()
	and WR_GetUnitBuffTime("player","深寒凝冰")==0	--深寒凝冰 减伤BUFF不存在
	and WR_GetUnitBuffTime("player","寒冰屏障")==0	--寒冰屏障 减伤BUFF不存在
	then
		if WR_ColorFrame_Show("SF7","强化隐形") then return true end
	end
	return false
end

--施法过程 镜像
function WR_MageArcane_JX()
	if GCD<=ShiFaSuDu
	and WRSet.BF_JX~=6	--镜像 开启
	and WR_SpellUsable("镜像") --技能可用
	and PlayerHP<WRSet.BF_JX/10 --血量比例<寒冰屏障设定值/10
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Mage_Arcane()
	then
		if WR_ColorFrame_Show("CF11","镜像") then return true end
	end
	return false
end

--施法过程 群体屏障
function WR_MageArcane_QTPZ()
	if GCD<=ShiFaSuDu
	and WRSet.BF_QTPZ~=10	--群体屏障 开启
	and WR_SpellUsable("群体屏障") --技能可用
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_PartyLostHP()>WRSet.BF_QTPZ/10 --全队掉血比例
	and WR_Mage_Arcane()
	then
		if WR_ColorFrame_Show("SF5","群体屏障") then return true end
	end
	return false
end

--施法过程 急速冷却
function WR_MageArcane_JSLQ()
	if WRSet.BF_JSLQ	--急速冷却 开启
	and WR_SpellUsable("急速冷却") --技能可用
	and WR_GetGCD("寒冰屏障")>30	--寒冰屏障冷却时间>30秒
	and WR_GetUnitDebuffTime("player","低温")>0
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Mage_Arcane()
	then
		if WR_ColorFrame_Show("CF10","急速冷却") then return true end
	end
	return false
end

--施法过程 操控时间
 function WR_MageArcane_CKSJ()
	local BuffTime_CKSJ=WR_GetUnitBuffTime("player","操控时间")	--操控时间 BUFF时间
	if BuffTime_CKSJ==0 then	--操控时间 BUFF不存在
		WR_MageArcane_CKSJ_HP=nil	--清空记录
	end
	if WRSet.BF_CKSJ	--操控时间 开启
	and WR_SpellUsable("操控时间") --技能可用
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_Mage_Arcane()
	then
		local ResistSustained=WR_ResistSustained()	--持续型伤害
		local ResistOutburstTime=WR_ResistOutburstTime()	--尖刺型伤害
		if MSG==2 then
			print("操控时间:",BuffTime_CKSJ)
			print("持续型伤害:",ResistSustained)
			print("尖刺型伤害:",ResistOutburstTime)
			print("记录血量:",WR_MageArcane_CKSJ_HP)
		end
		if WR_MageArcane_CKSJ_HP==nil then	--操控时间记录不存在
			if BuffTime_CKSJ==0	--操控时间 BUFF不存在
			and
			(
				ResistSustained		--持续型伤害存在
				or
				ResistOutburstTime<=2	--尖刺型伤害来临时间<=2秒
			)
			then
				WR_MageArcane_CKSJ_HP=UnitHealth("player")	--记录使用操控时间的血量值
				if WR_ColorFrame_Show("F8","操控时间") then return true end
			end
		else	--操控时间记录存在
			if UnitHealth("player")<WR_MageArcane_CKSJ_HP	--当前血量值<使用操控时间的血量值
			and BuffTime_CKSJ>0	--操控时间 BUFF存在
			and
			(
				PlayerHP<=0.25	--血量<=25%
				or
				(
					not ResistSustained		--持续型伤害不存在
					and
					ResistOutburstTime>2	--尖刺型伤害来临时间>2秒
				)
			)
			then
				if WR_ColorFrame_Show("F8","时光回溯") then return true end
			end
			
			if UnitHealth("player")>=WR_MageArcane_CKSJ_HP	--当前血量值>=使用操控时间的血量值
			and BuffTime_CKSJ>0	--操控时间 BUFF存在
			and not ResistSustained		--持续型伤害不存在
			and ResistOutburstTime>2	--尖刺型伤害来临时间>2秒
			then
				if WR_ColorFrame_Show("SF11","取消操控") then return true end
			end
		end
	end
	return false
end