--火法运行库
function WR_MageFire()
	if GetSpecialization()~=2 then	--如果不是(2)专精，则不执行该运行库
		return
	end

	ShiFaSuDu=0.3
	
	WR_Initialize()	--初始化
	
	--WR_GetLastSpellName()	--获取上一次的技能名称，返回值：WR_LastSpellName

	GCD=WR_GetGCD("奥术智慧")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	Latency=WR_GetMaxLatency()	--获得当前最大网络延时
	NextGCD=GCD+Latency	--获得下一个技能时间
	
	PlayerHP=WR_GetUnitHP("player")	--获得自身真实带护盾的血量比例
	PlayerMove=WR_PlayerMove()--获得自身是否在移动或者空中

	Training=WR_InTraining() --获得是否在打木桩
	
	TargetHP=1
	if UnitExists("target") then TargetHP=UnitHealth("target")/UnitHealthMax("target") end	--获得目标血量比例
	TargetInCombat=WR_TargetInCombat("target")	--目标可攻击
	TargetRange=WR_GetUnitRange("target")	--目标距离
	TargetSingle=WR_SingleUnit()	--目标是单体单位
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得40码内预计战斗结束时间
	
	FlyTime=WR_GetUnitRange("target")/40	--技能飞行时间
	
	HUCountRange40=WR_GetRangeHarmUnitCount(40,not(Training)) --40码内战斗单位数量

	BuffTime_RS = WR_GetUnitBuffTime("player","燃烧")	--获得 燃烧 BUFF信息
	BuffTime_TYWDNH = WR_GetUnitBuffTime("player","太阳王的怒火")	--获得 太阳王的怒火 BUFF信息
	BuffCount_TYZWDZF = WR_GetUnitBuffCount("player","太阳之王的祝福")	--获得 太阳之王的祝福 BUFF信息
	BuffTime_RLBF = WR_GetUnitBuffTime("player","热力迸发")	--获得 热力迸发 BUFF信息
	BuffTime_CRLJ = WR_GetUnitBuffTime("player","炽热连击！")	--获得 炽热连击！ BUFF信息
	BuffTime_FB = WR_GetUnitBuffTime("player","浮冰")	--获得 浮冰 BUFF信息
	BuffTime_LYHT = WR_GetUnitBuffTime("player","烈焰护体")	--获得 烈焰护体 BUFF信息
	BuffTime_LYCM = WR_GetUnitBuffTime("player","烈焰触媒")	--获得 烈焰触媒 BUFF信息
	BuffTime_SHZX = WR_GetUnitBuffTime("player","霜火增效")	--获得 霜火增效 BUFF剩余时间
	BuffTime_DRDHS = WR_GetUnitBuffTime("player","点燃导火索")	--获得 点燃导火索 BUFF剩余时间
	BuffTime_YLHS = WR_GetUnitBuffTime("player","溢流寒霜")	--获得 溢流寒霜 BUFF剩余时间
	BuffTime_YLFH = WR_GetUnitBuffTime("player","溢流飞火")	--获得 溢流飞火 BUFF剩余时间
	--BuffTime_JR,BuffCount_JR,_=WR_GetUnitBuffInfo("player","聚热")	--获得 聚热 BUFF信息(巨龙时代套装)
	--BuffTime_RYZN,BuffCount_RYZN,_=WR_GetUnitBuffInfo("player","燃焰之怒")	--获得 燃焰之怒 BUFF信息(巨龙时代套装)

	DebuffTime_FSYH,DebuffCount_FSYH,_=WR_GetUnitDebuffInfo("target","焚身余灰",true)	--获得 焚身余灰 DEBUFF信息
	
	MaxDebuff_DR_Unit=WR_MageFire_MaxDebuff_DR()	--获得最高点燃的单位
	
	
	WR_MageFire_LastSpellTime()	--获取上一次的技能，利用战斗事件，所以仅运行一次
	
	if BSNZY_FiyTime~=nil	--不死鸟之焰 飞行时间存在
	and GetTime()-BSNZY_FiyTime>=FlyTime+Latency	--不死鸟之焰 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		BSNZY_FiyTime=nil	--重置 不死鸟之焰 飞行时间
	end
	
	if BSNZY_DamageTime~=nil	--不死鸟之焰 击中时间存在
	and GetTime()-BSNZY_DamageTime>0.1	--不死鸟之焰 击中时间>0.1秒
	then
		BSNZY_FiyTime=nil	--重置 不死鸟之焰 飞行时间
		BSNZY_DamageTime=nil	--重置 爆击 不死鸟之焰 击中时间
	end
	
	if YBS_FiyTime~=nil	--炎爆术 飞行时间存在
	and GetTime()-YBS_FiyTime>=FlyTime+Latency	--炎爆术 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		YBS_FiyTime=nil	--重置 炎爆术 飞行时间
	end
	
	if YBS_DamageTime~=nil	--炎爆术 击中时间存在
	and GetTime()-YBS_DamageTime>0.1	--炎爆术 击中时间>0.1秒
	then
		YBS_FiyTime=nil	--重置 炎爆术 飞行时间
		YBS_DamageTime=nil	--重置 爆击 炎爆术 击中时间
	end
	
	if HQS_FiyTime~=nil	--火球术 飞行时间存在
	and GetTime()-HQS_FiyTime>=FlyTime+Latency	--火球术 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		HQS_FiyTime=nil	--重置 火球术 飞行时间
	end
	
	if HQS_DamageTime~=nil	--火球术 击中时间存在
	and GetTime()-HQS_DamageTime>0.1	--火球术 击中时间>0.1秒
	then
		HQS_FiyTime=nil	--重置 火球术 飞行时间
		HQS_DamageTime=nil	--重置 爆击 火球术 击中时间
	end
	
	if SHZJ_FiyTime~=nil	--霜火之箭 飞行时间存在
	and GetTime()-SHZJ_FiyTime>=FlyTime+Latency	--霜火之箭 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		SHZJ_FiyTime=nil	--重置 霜火之箭 飞行时间
	end
	
	if SHZJ_DamageTime~=nil	--霜火之箭 击中时间存在
	and GetTime()-SHZJ_DamageTime>0.15	--霜火之箭 击中时间>0.15秒
	then
		SHZJ_FiyTime=nil	--重置 霜火之箭 飞行时间
		SHZJ_DamageTime=nil	--重置 爆击 霜火之箭 击中时间
	end
	
	if YBS_FiyTime~=nil
	or
	BSNZY_FiyTime~=nil
	or
	HQS_FiyTime~=nil
	or
	SHZJ_FiyTime~=nil
	then
	--获得是否有技能在飞行中
		SpellFiying=true
	else
		SpellFiying=false
	end
	
	--火焰冲击成功施法超过0.2秒
	if HYCJ_FiyTime==nil or GetTime()-HYCJ_FiyTime>0.2 then
		LastSpell_Not_HYCJ=true
	else
		LastSpell_Not_HYCJ=false
	end
	
	
	
	
	
	
--[[
	if YBS_FiyTime~=nil
	--炎爆术 飞行时间存在
	and GetTime()-YBS_FiyTime>=FlyTime+Latency
	--炎爆术 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		YBS_FiyTime=nil
		--重置 炎爆术 飞行时间
	end
	if YBS_DamageTime~=nil
	--爆击 炎爆术 击中时间存在
	and
	GetTime()-YBS_DamageTime>0.1
	--爆击 炎爆术 击中时间>0.1秒
	then
		YBS_DamageTime=nil
		--重置 爆击 炎爆术 击中时间
	end
	
	if HQS_FiyTime~=nil
	--火球术 飞行时间存在
	and GetTime()-HQS_FiyTime>=FlyTime+Latency
	--火球术 飞行时间>=飞行时间+延迟	说明技能没打中
	then
		HQS_FiyTime=nil
		--重置 火球术 飞行时间
	end
	if HQS_DamageTime~=nil
	--爆击 火球术 击中时间存在
	and
	GetTime()-HQS_DamageTime>0.1
	--爆击 火球术 击中时间>0.1秒
	then
		HQS_DamageTime=nil
		--重置 爆击 火球术 击中时间
	end

	if 
	BuffTime_CRLJ<=GCD
	--炽热连击！ BUFF不存在，如果有炽热连击！，则不需要判断有没有法术正在飞行中，因为可以直接炎爆术
	and
	(
		YBS_FiyTime~=nil
		or
		YBS_DamageTime~=nil
		or
		BSNZY_FiyTime~=nil
		or
		BSNZY_DamageTime~=nil
		or
		HQS_FiyTime~=nil
		or
		HQS_DamageTime~=nil
	)
	then
	--获得是否有技能在飞行中
		SpellFiying=true
	else
		SpellFiying=false
	end

	
	if BuffTime_TYWDNH>NextGCD+FlyTime
	--太阳王的怒火 BUFF时间>下一个施法时间+飞行时间
	and
	UnitCastingInfo("player")=="炎爆术"
	--正在施法 炎爆术
	and
	GCD<=0.1
	--施法剩余时间<=0.1 施法阶段最后时刻
	then
		TYB_YBS_EndTime=GetTime()+GCD	--记录太阳王炎爆术的施法结束时间
	end
	
	if BuffTime_RS>NextGCD+FlyTime
	--燃烧 BUFF时间>下一个施法时间+飞行时间
	and
	UnitCastingInfo("player")=="火球术"
	--正在施法 火球术
	and
	GCD<=0.1
	--施法剩余时间<=0.1 施法阶段最后时刻
	then
		Critical_HQS_EndTime=GetTime()+GCD	--记录必爆火球术的施法结束时间
	end
--]]
--[[
	if HQS_FiyTime~=nil and GetTime()-HQS_FiyTime>=MaxGCD then HQS_FiyTime=nil end
	--如果 火球术 飞行时间>最大GCD的时间，那么重置 火球术 飞行时间
	if HQS_DamageTime~=nil and GetTime()-HQS_DamageTime>0.1 then HQS_DamageTime=nil end
	--如果 爆击 火球术 击中时间>0.1秒，那么重置 爆击 火球术 击中时间
	
	if BuffTime_CRLJ<=GCD
	--炽热连击！ BUFF不存在
	and
	(
		YBS_FiyTime~=nil or YBS_DamageTime~=nil
		or
		HQS_FiyTime~=nil or HQS_DamageTime~=nil
	)
	then
	--获得是否有技能在飞行中
		SpellFiying=true
	else
		SpellFiying=false
	end
--	if YBS_FiyTime~=nil then print(GetTime()-YBS_FiyTime) end
]]--

	if MSG==1 then
		print("GCD:",GCD)
		--if YBS_FiyTime~=nil then print("炎爆术 飞行时间：",GetTime()-YBS_FiyTime) end
		--if YBS_DamageTime~=nil then print("炎爆术 击中时间：",GetTime()-YBS_DamageTime) end
		--if BSNZY_FiyTime~=nil then print("不死鸟之焰 飞行时间：",GetTime()-BSNZY_FiyTime) end
		--if BSNZY_DamageTime~=nil then print("不死鸟之焰 击中时间：",GetTime()-BSNZY_DamageTime) end
		print("技能在飞行中:",SpellFiying)
		print("----------")
	end
	
	--优先检查
	if WR_PriorityCheck() then return end
	
	--奥术智慧
	if WR_PartyNotBuff("奥术智慧")
	--如果队友没有 奥术智慧
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF2","奥术智慧",zhandoumoshi) --显示指定色块窗体
		return
	end

	if WR_Function_ZNMB(40,WRSet.HF_ZNMB) then return true end	--智能目标

	if TargetInCombat	--目标可攻击
	and TargetRange<=40	--目标在 40 码范围内
	and not SpellFiying --没有技能飞行中
	and
	(
		UnitCastingInfo("player")~=nil	--正在施法
		or
		(
			UnitCastingInfo("player")==nil	--没有施法
			and
			GCD<=ShiFaSuDu	--下一个GCD<施法时间
		)
	)
	then
		--施法过程 炎爆术 顺发
		if WR_MageFire_Function_YBS_SF() then return end

		if LastSpell_Not_HYCJ	then	--最后一个技能不是 火焰冲击
			if WR_MageFire_NextGCD_RLBF()	--下个GCD必然触发 热力迸发
			and not WR_MageFire_Crit_ZS()	--当前没有施法必暴灼烧
			then
				--点燃导火索 BUFF期间 火焰冲击
				if BuffTime_DRDHS>NextGCD then
					if WR_MageFire_Function_HYCJ("导火索火冲") then return end	--施法过程 火焰冲击
				end

				--溢流寒霜 BUFF期间 不死鸟之焰
				if BuffTime_YLHS>NextGCD then	--溢流寒霜 BUFF存在
					if WR_MageFire_Function_BSNZY("寒霜火鸟") then return end	--施法过程 不死鸟之焰
				end
				
				--溢流飞火 BUFF期间 火焰冲击
				if BuffTime_YLFH>NextGCD then	--溢流飞火 BUFF存在
					if WR_MageFire_Function_HYCJ() then return end	--施法过程 火焰冲击
				end
				
				--霜火增效 BUFF期间 霜火之箭
				if BuffTime_SHZX>NextGCD then
					if WR_MageFire_Function_SHZJ("增效霜火箭") then return end	--施法过程 霜火之箭
				end
				
				--满层 火焰冲击
				if WR_GetSpellCharges("火焰冲击")>=3 then
					if WR_MageFire_Function_HYCJ("满层火冲") then return end	--施法过程 火焰冲击
				end
				
				--满层 不死鸟之焰
				if WR_GetSpellCharges("不死鸟之焰")>=3 then
					if WR_MageFire_Function_BSNZY("满层不死鸟") then return end	--施法过程 不死鸟之焰
				end
				
				--施法过程 火焰冲击
				if WR_MageFire_Function_HYCJ() then return end
				
				--施法过程 不死鸟之焰
				if WR_MageFire_Function_BSNZY() then return end
				
				--施法过程 灼烧
				if WR_MageFire_Function_ZS() then return end
			end
			
			--施法过程 变易幻能
			if WR_MageFire_Function_BYHN() then return true end --选择单位过程
			
			--施法过程 时间扭曲
			if WR_MageFire_Function_SJNQ() then return end
			
			--施法过程 燃烧
			if WR_MageFire_Function_RS() then return end
			
			--施法过程 太阳王炎爆
			if WR_MageFire_Function_TYW_YBS() then return end

			--消耗更多的不死鸟之焰
			if not WR_MageFire_NextGCD_RLBF() then	--下个GCD不会触发 热力迸发
				--火焰冲击 可用期间 不死鸟之焰
				if
				(
					WR_GetSpellCharges("不死鸟之焰")>=2	--不死鸟之焰>=2层
					or
					(
						WR_GetSpellCharges("不死鸟之焰")==1	--不死鸟之焰==1层
						and
						WR_GetSpellNextCharge("不死鸟之焰")<NextGCD+MaxGCD/2	--再下一个GCD之前能刷新出次数
					)
					or
					BuffTime_YLHS>NextGCD	--溢流寒霜 BUFF期间
				)
				and
				(
					WR_GetSpellCharges("火焰冲击")>0	--火焰冲击 有可用次数
					or
					WR_GetSpellNextCharge("火焰冲击")<NextGCD+MaxGCD/2	--再下一个GCD之前能刷新出次数
					or
					TargetHP<0.3	--单位血量<30%
				)
				then
					if WR_MageFire_Function_BSNZY("不死鸟") then return end	--施法过程 不死鸟之焰
				end
			end
			
			--施法过程 霜火之箭
			if WR_MageFire_Function_SHZJ() then return end
		end
	end

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体

	if MSG==1 then

	end


end


	
--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_MageFire_LastSpellTime()
	if MageFireLastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="炎爆术" then
					--释放成功的技能名称
						YBS_FiyTime=GetTime()	--获取 炎爆术 施法成功时间
					end
					if SpellName=="不死鸟之焰" then
					--释放成功的技能名称
						BSNZY_FiyTime=GetTime()	--获取 不死鸟之焰 施法成功时间
					end
					if SpellName=="火球术" then
					--释放成功的技能名称
						HQS_FiyTime=GetTime()	--获取 火球术 施法成功时间
					end
					if SpellName=="霜火之箭" then
					--释放成功的技能名称
						SHZJ_FiyTime=GetTime()	--获取 霜火之箭 施法成功时间
					end
					if SpellName=="灼烧" then
					--释放成功的技能名称
						ZS_FiyTime=GetTime()	--获取 灼烧 施法成功时间
					end
					if SpellName=="火焰冲击" then
					--释放成功的技能名称
						HYCJ_FiyTime=GetTime()	--获取 火焰冲击 施法成功时间
					end
				end
				
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_DAMAGE" then	--造成伤害
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					local Critical=select(21, CombatLogGetCurrentEventInfo())
					if SpellName=="炎爆术" then
					--造成伤害的技能名称
						if Critical then
							YBS_DamageTime=GetTime()	--获取 炎爆术 造成伤害成功时间
						else
							YBS_FiyTime=nil	--如果没有暴击 重置 炎爆术 飞行时间
						end
					end
					if SpellName=="不死鸟之焰" then
					--释放成功的技能名称
						if Critical then
							BSNZY_DamageTime=GetTime()	--获取 不死鸟之焰 造成伤害成功时间
						else
							BSNZY_FiyTime=nil	--如果没有暴击 重置 不死鸟之焰 飞行时间
						end
					end
					if SpellName=="火球术" then
					--释放成功的技能名称
						if Critical then
							HQS_DamageTime=GetTime()	--获取 火球术 造成伤害成功时间
						else
							HQS_FiyTime=nil	--如果没有暴击 重置 火球术 飞行时间
						end
					end
					if SpellName=="霜火之箭" then
					--释放成功的技能名称
						if Critical then
							SHZJ_DamageTime=GetTime()	--获取 霜火之箭 造成伤害成功时间
						else
							SHZJ_FiyTime=nil	--如果没有暴击 重置 霜火之箭 飞行时间
						end
					end
				end
			end
	end)
	MageFireLastSpellIsOpen=true                       
end

--施法过程 智能目标
function WR_MageFire_Function_ZNMB()
	if WRSet.HF_ZNMB==1
	--智能目标 开启
	and
	not TargetInCombat	--单位不可攻击
	then
		if WR_TargetUnit(MaxDebuff_DR_Unit,"智能") then return true end --选择单位过程
	end
	return false
end

--施法过程 时间扭曲
function WR_MageFire_Function_SJNQ()
	if zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("时间扭曲")	--技能可用
	and Training	--在打木桩
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF3","时间扭曲",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 燃烧
function WR_MageFire_Function_RS()
	if zhandoumoshi==1
	--爆发 开启
	and
	WR_SpellUsable("燃烧")
	--技能可用 资源可用
	and
	AvgDeathTime>=15
	--预计战斗结束时间>=15秒
	and
	BuffTime_RS<=3.6
	--燃烧BUFF时间<=3.6
	and
	(
		BuffTime_RS>NextGCD	--燃烧BUFF 存在
		or
		(
			BuffTime_TYWDNH==0	--太阳王的怒火 BUFF不存在
			and
			BuffCount_TYZWDZF<=7	--太阳王的祝福 BUFF层数<=7
		)
		or
		(
			BuffTime_TYWDNH>NextGCD+FlyTime	--太阳王的怒火 BUFF时间>下一个施法时间+飞行时间
			and
			UnitCastingInfo("player")=="炎爆术"	--正在施法 炎爆术
			and
			WR_GetUnitCastInfo("player")>=WR_GetTrueCastTime("炎爆术")/2	--炎爆术已经施法的时间过半
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","燃烧",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 太阳王炎爆
function WR_MageFire_Function_TYW_YBS()
	if zhandoumoshi==1	--爆发 开启
	and not PlayerMove	--玩家没有移动
	and UnitCastingInfo("player")~="炎爆术"	--正在施法 不是 炎爆术
	and BuffTime_TYWDNH>NextGCD+WR_GetTrueCastTime("炎爆术")	--太阳王的怒火 BUFF时间>下一个技能时间+炎爆术施法时间
	and TargetDeathTime>NextGCD+WR_GetTrueCastTime("炎爆术")+FlyTime	--目标死亡时间>下一个技能时间+炎爆术施法时间+飞行时间
	and WR_SpellUsable("炎爆术")	--技能可用
	and not WR_StopCast(WR_GetTrueCastTime("炎爆术"))	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF2","太阳王炎爆",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end
	
--当前施法必暴灼烧
function WR_MageFire_Crit_ZS()
	if UnitCastingInfo("player")=="灼烧"	--正在施法 灼烧
	and
	(
		TargetHP<0.3	--单位血量<30%
		or
		BuffTime_RS>NextGCD	--燃烧 BUFF>施法结束时间+延迟
	)
	then
		return true
	end
	return false
end

--当前施法必暴法术
function WR_MageFire_Crit_Spell()
	if UnitCastingInfo("player")~=nil	--当前施法存在
	and
	(
		BuffTime_RS>GCD+FlyTime	--燃烧 BUFF>施法剩余时间+飞行时间	(当前施法可以在燃烧期间打到目标)
		or
		WR_MageFire_Crit_ZS()	--当前施法必暴灼烧
		or
		(
			BuffTime_TYWDNH>GCD	--太阳王的怒火 BUFF存在
			and
			UnitCastingInfo("player")=="炎爆术"	--正在施法 炎爆术
		)
	)
	then
		return true
	end
	return false
end

--下个GCD必然触发 热力迸发
function WR_MageFire_NextGCD_RLBF()
	if BuffTime_CRLJ==0	--炽热连击！ BUFF不存在
	and
	(
		(
			BuffTime_RLBF>NextGCD	--热力迸发 BUFF存在
			and
			not WR_MageFire_Crit_Spell()	--当前 没有 施法必暴法术
		)
		or
		(
			BuffTime_RLBF==0	--热力迸发 BUFF不存在
			and
			WR_MageFire_Crit_Spell()	--当前 正在 施法必暴法术
		)
	)
	then
		return true
	end
	return false
end

--施法过程 瞬发炎爆术
function WR_MageFire_Function_YBS_SF(Text)
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="瞬发炎爆"
	end
	if WR_SpellUsable("炎爆术")	--技能可用
	and
	(
		BuffTime_CRLJ>NextGCD	--炽热连击！ BUFF存在
		or
		(
			BuffTime_RLBF>NextGCD	--热力迸发 BUFF存在
			and
			WR_MageFire_Crit_ZS()	--当前施法必暴灼烧
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF2",TempText,zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 火焰冲击
function WR_MageFire_Function_HYCJ(Text)
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="火焰冲击"
	end
	if WR_SpellUsable("火焰冲击")	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("F12",TempText,zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 不死鸟之焰
function WR_MageFire_Function_BSNZY(Text)
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="不死鸟之焰"
	end
	if WR_SpellUsable("不死鸟之焰")	--技能可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF7",TempText,zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--施法过程 霜火之箭
function WR_MageFire_Function_SHZJ(Text)
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="霜火之箭"
	end
	if WR_SpellUsable("霜火之箭")	--技能可用
	and
	(
		BuffTime_SHZX>NextGCD	--霜火增效 BUFF存在
		or
		BuffTime_FB>NextGCD	--浮冰 BUFF存在
		or
		(
			not PlayerMove	--玩家没有移动
			and
			not WR_StopCast(WR_GetTrueCastTime("霜火之箭"))	--避免施法被沉默的情况
		)
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1",TempText,zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--灼烧
function WR_MageFire_Function_ZS(Text)
	local TempText
	if Text~=nil then
		TempText=Text
	else
		TempText="灼烧"
	end
	if WR_SpellUsable("灼烧")	--技能可用
	and TargetHP<0.3	--单位血量<30%
	and not WR_StopCast(WR_GetTrueCastTime("灼烧"))	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3",TempText,zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--变易幻能
function WR_MageFire_Function_BYHN()
	if zhandoumoshi==1
	--开爆发
	and BuffTime_RS<=NextGCD	--燃烧 BUFF不存在
	and UnitCastingInfo("player")~="炎爆术"	--当前施法不是炎爆术
	and not PlayerMove	--玩家没有移动
	and not SpellFiying	--没有法术在飞行中
	and	WR_GetSpellCharges("火焰冲击")==0	--火焰冲击 可用次数=0
	and WR_GetGCD("火焰冲击")>NextGCD	--火焰冲击 恢复时间>下一个技能GCD
	and not WR_StopCast(WR_GetTrueCastTime("变易幻能"))	--避免施法被沉默的情况
	and WR_SpellUsable("变易幻能") --技能可用 资源可用
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF6","变易幻能",zhandoumoshi) --显示指定色块窗体
		return true
	end
	return false
end

--[[
--下个GCD必然触发 炽热连击！
function WR_MageFire_NextGCD_CRLJ()
	if BuffTime_CRLJ>NextGCD	--炽热连击！ BUFF存在
	or
	(
		BuffTime_RLBF>NextGCD	--热力迸发 BUFF存在
		and
		WR_MageFire_Crit_Spell()	--当前施法必暴法术
	)
	then
		return true
	end
	return false
end
--]]














































function WR_MageFire_LXS(Unit)
	if WR_SpellUsable("龙息术")
	--技能可用
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	WR_GetUnitRange(Unit)<=10
	--单位在 10 码范围内
	and
	BuffTime_CRLJ==0
	--炽热连击！ BUFF不存在
	then
		return true
	end
	return false
end





--读条炎爆术
function WR_MageFire_DT_YBS(Unit)
	if WR_SpellUsable("炎爆术")
	--技能可用
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	WR_GetUnitRange(Unit)<=40
	--单位在 40 码范围内
	and
	(
		not(WR_GetPlayerMove())
		--玩家没有移动
		or
		WR_SpellUsable("浮冰")
		--技能可用 资源可用
	)
	and
	not(WR_StopCast(WR_GetTrueCastTime("炎爆术")+NextGCD))
	--避免施法被沉默的情况
	and
	UnitCastingInfo("player")~="炎爆术"
	--正在施法 不是 炎爆术
	then
		return true
	end
	return false
end












--浮冰
function WR_MageFire_FB()
	if WR_SpellUsable("浮冰")
	--技能可用 资源可用
	and
	BuffTime_FB==0
	--浮冰 BUFF不存在
	then
		return true
	end
	return false
end


--解除诅咒
function WR_MageFire_JCZZ(Unit)
	if WR_SpellUsable("解除诅咒")
	--技能可用 资源可用
	and
	WR_GetUnitRange(Unit)<=40
	--单位在 40 码范围内
	and
	WR_CanRemoveUnitDebuff(Unit)
	--单位有可驱散Debuff
	and
	not UnitCanAttack("player",Unit)
	--单位是友善的
	then
		return true
	end
	return false
end



--流星
function WR_MageFire_LX()
	if WR_SpellUsable("流星")
	--技能可用
	and
	HUCountRange40>=5
	--40码敌对单位数量>=5
	and
	not TargetSingle
	--目标不是单体
	and
	UnitCastingInfo("player")==nil
	--没有正在施法
	then
		return true
	end
	return false
end

--活动炸弹
function WR_MageFire_HTZD()
	if WR_SpellUsable("活动炸弹")
	--技能可用 资源可用
	and
	HUCountRange40>=5
	--40码敌对单位数量>=5
	and
	not TargetSingle
	--目标不是单体
	and
	UnitCastingInfo("player")==nil
	--没有正在施法
	and
	BuffTime_RS==0
	--燃烧 BUFF完全不存在
	then
		return true
	end
	return false
end

--不死鸟之焰 已经打出一段时间
function WR_MageFire_LongTime_BSNZY()
	if BSNZY_EndTime==nil
	--上一次 不死鸟之焰 放出时间不存在
	or
	(
		GetTime()-BSNZY_EndTime>Latency
		--距离上一次 不死鸟之焰 放出时间>延迟
		and
		GetTime()-BSNZY_EndTime>=0.2
		--距离上一次 不死鸟之焰 放出时间>延迟
	)
	then
		return true
	end
	return false
end

--火焰冲击 已经打出一段时间
function WR_MageFire_LongTime_HYCJ()
	if HYCJ_EndTime==nil
	--上一次火焰冲击放出时间不存在
	or
	(
		GetTime()-HYCJ_EndTime>Latency
		--距离上一次火焰冲击放出时间>延迟
		and
		GetTime()-HYCJ_EndTime>0.2
		--距离上一次火焰冲击放出时间>延迟
	)
	then
		return true
	end
	return false
end
	
--龙息术 已经打出一段时间
function WR_MageFire_LongTime_LXS()
	if LXS_EndTime==nil
	--上一次龙息术放出时间不存在
	or
	(
		GetTime()-LXS_EndTime>Latency
		--距离上一次龙息术放出时间>延迟
		and
		GetTime()-LXS_EndTime>0.2
		--距离上一次龙息术放出时间>延迟
	)
	then
		return true
	end
	return false
end
	
--龙息术 施法条件
function WR_MageFire_LXS_Control()
	if WR_SpellUsable("龙息术")
	--技能可用
	and
	WR_StunUnit(10)
	--范围击晕施法
	then
		return true
	end
	return false
end

--获得单位点燃BUFF伤害值
function WR_MageFire_DR_Value(Unit)
	for i=1,40,1 do
		local Debuffdata=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HARMFUL")
		if Debuffdata~=nil and Debuffdata.name=="点燃" and Debuffdata.sourceUnit=="player" then
			return Debuffdata.points[1]
		end
	end
	return 0
end

--找到最高的点燃伤害的单位
function WR_MageFire_MaxDebuff_DR()
	local Max_Unit="target"
	local Max_DR=WR_MageFire_DR_Value("target")
	
	Temp_DR=WR_MageFire_DR_Value("mouseover")
	if Temp_DR>=Max_DR and WR_GetUnitRange("mouseover")<=40 and WR_TargetInCombat("mouseover") then
		Max_Unit="mouseover"
		Max_DR=Temp_DR
	end

	for i=1,4,1 do
		Temp_DR=WR_MageFire_DR_Value("party"..i.."target")
		if Temp_DR>=Max_DR and WR_GetUnitRange("party"..i.."target")<=40 and WR_TargetInCombat("party"..i.."target") then
			Max_Unit="party"..i.."target"
			Max_DR=Temp_DR
		end
	end
	return Max_Unit
end

--法术吸取
function WR_MageFire_FSXQ(Unit)
	if WRSet.HF_FSXQ==1
	--法术吸取 开启
	and
	WR_SpellUsable("法术吸取")
	--技能可用 资源可用
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	WR_GetUnitRange(Unit)<=40
	--单位距离
	and
	WR_StealBuff(Unit)
	--单位有法术吸取的BUFF
	then
		return true
	end
	return false
end

--[[
	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.HF_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.HF_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSL","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.HF_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.HF_ZLYS/10
	--血量比例<治疗药水设定值/10
	then
		local ZLYS={
		[1]="振奋治疗药水",
		[2]="梦行者治疗药水",
		[3]="凋零梦境药水",
		}
		for _, ZLYS_name in ipairs(ZLYS) do
			local count=GetItemCount(ZLYS_name)
			--获取物品数量
			local start, duration, enable = GetItemCooldown(ZLYS_name)
			--获取物品是否可以使用
			if count~=nil and count>=1 and start+duration-GetTime()<=0 then
			--             物品数量>=1  且  物品可以使用
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSO","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--龙息控断-------------------------------------------------------------------------------------------
	if WRSet.HF_LXS==1
	--龙息术 控制
	and
	WR_MageFire_LXS_Control()
	--龙息术 控制
	then
		LXS_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSJ","龙息控断",zhandoumoshi) --显示指定色块窗体
		return
	end
	--龙息控断-------------------------------------------------------------------------------------------

	--法术反制-------------------------------------------------------------------------------------------------------
	if WR_SpellUsable("法术反制") then
	--技能可用 资源可用
		--法术反制T
		if WRSet.HF_FSFZ~=3
		--法术反制 开启
		and WR_GetUnitRange("target")<=40
		--单位距离
		and WR_TargetInCombat("target")
		--单位可攻击
		and WR_GetCastInterruptible("target",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","法术反制T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--法术反制M
		if WRSet.HF_FSFZ==1
		--智能打断
		and WR_GetUnitRange("mouseover")<=40
		--单位距离
		and WR_TargetInCombat("mouseover")
		--单位可攻击
		and WR_GetCastInterruptible("mouseover",InterruptTime)
		--指定"单位"施法剩余时间小于设定
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF1","法术反制M",zhandoumoshi) --显示指定色块窗体
			return
		end
	end

	--控制虚体 变形术--------------------------------------------------------------------------------------------
	if UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not(PlayerMove)
	--自身不在移动或者空中
	and
	WR_SpellUsable("变形术")
	--技能可用 资源可用
	and
	IsSpellInRange("变形术","mouseover")==1
	--单位在技能范围内
	and
	not WR_StopCast(WR_GetTrueCastTime("变形术"))
	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSY","变形术",zhandoumoshi) --显示指定色块窗体
		return
	end

	--解咒P
	if (WRSet.HF_JCZZ==1 or WRSet.HF_JCZZ==3)
	--智能 或 自己
	and
	WR_MageFire_JCZZ("player")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","解咒P",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--解咒M
	if (WRSet.HF_JCZZ==1 or WRSet.HF_JCZZ==2 or UnitName("mouseover")=="受难之魂")
	--智能 或 指向 或 指向是受难之魂
	and
	WR_MageFire_JCZZ("mouseover")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","解咒M",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--解咒P1
	if WRSet.HF_JCZZ==1
	--智能
	and
	WR_MageFire_JCZZ("party1")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF4","解咒P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--解咒P2
	if WRSet.HF_JCZZ==1
	--智能
	and
	WR_MageFire_JCZZ("party2")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","解咒P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--解咒P3
	if WRSet.HF_JCZZ==1
	--智能
	and
	WR_MageFire_JCZZ("party3")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF6","解咒P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--解咒P4
	if WRSet.HF_JCZZ==1
	--智能
	and
	WR_MageFire_JCZZ("party4")
	--解除诅咒 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","解咒P4",zhandoumoshi) --显示指定色块窗体
		return
	end

	--法术吸取
	if WR_MageFire_FSXQ("target")
	--法术吸取 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSH","法术吸取T",zhandoumoshi) --显示指定色块窗体
		return
	end

	--法术吸取
	if WR_MageFire_FSXQ("mouseover")
	--法术吸取 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSB","法术吸取M",zhandoumoshi) --显示指定色块窗体
		return
	end

	--烈焰护体--------------------------------------------------------------------------------------------
	if WRSet.HF_LYHT==1
	--烈焰护体 开启
	and
	WR_SpellUsable("烈焰护体")
	--技能可用 资源可用
	and
	BuffTime_LYHT==0
	--烈焰护体 BUFF不存在
	and
	BuffTime_RS==0
	--燃烧 BUFF不存在
	and
	UnitCastingInfo("player")~=nil
	--当前没有施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","烈焰护体",zhandoumoshi) --显示指定色块窗体
		return
	end




	
	--不在读条施法期间的不死鸟或火冲-------------------------------------------------------------------------------------------
	if UnitCastingInfo("player")==nil
	--不在读条施法中
	and
	LastSpell_Not_HYCJ
	--最后一个技能不是 火焰冲击
	and
	BuffTime_TYWDNH==0
	--太阳王的怒火 BUFF不存在
	and
	(
		GCD==0
		--公共冷却时间完全冷却
		or
		GCD<MaxGCD-Latency
		--当前冷却时间 <最大公共冷却时间-网络延迟
		--目的释放法术后有一定时间缓冲，免得误触
	)
	then
		--燃烧期间------------------------------------------------------------------------------------------------------------
		if BuffTime_RS>NextGCD+MaxGCD+FlyTime
		--燃烧 BUFF存在>下一个技能时间+(炎爆术)公共冷却时间+飞行时间
		and
		(
			(
				BuffTime_RLBF>GCD
				--热力迸发 BUFF存在
				and
				not SpellFiying
				--没有法术在飞行中
				--没有法术在飞行中，有热力迸发，那么打一个火鸟或者火冲进连击
			)
			or
			(
				BuffTime_RLBF<=GCD
				--热力迸发 BUFF不存在
				and
				(
					(YBS_FiyTime~=nil and HQS_FiyTime==nil)
					--炎爆术在飞行 且 火球术 不在飞行中
					or
					(YBS_FiyTime==nil and HQS_FiyTime~=nil)
					--炎爆术不在飞行 且 火球术在飞行中
					--单炎爆或者单火球飞行，且身上没有热力迸发，那么打一个火鸟或者火冲进连击
				)
			)
		)
		and
		(
			Critical_HQS_EndTime==nil
			--上一次 必爆火球术 放出时间不存在
			or
			GetTime()-Critical_HQS_EndTime>=Latency
			--距离上一次 必爆火球术 放出时间>=延迟
			--因为读条的 火球术 放出后，未能马上检测出有没有在飞行，所以增加延迟
		)
		and
		(
			TYB_YBS_EndTime==nil
			--上一次 读条炎爆术 放出时间不存在
			or
			GetTime()-TYB_YBS_EndTime>=Latency
			--距离上一次 必爆太阳王炎爆术 放出时间>=延迟
			--因为读条的 炎爆术 放出后，未能马上检测出有没有在飞行，所以增加延迟
		)
		then
			--燃满火冲-------------------------------------------------------------------------------------------
			if WR_MageFire_HYCJ_Max(MaxDebuff_DR_Unit)
			--火焰冲击
			and
			WR_MageFire_LongTime_BSNZY()
			--不死鸟之焰 已经打出一段时间
			and
			WR_MageFire_LongTime_LXS()
			--龙息术 已经打出一段时间
			then
				if MaxDebuff_DR_Unit=="target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","燃满火冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","燃满火冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","燃满火冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","燃满火冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","燃满火冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","燃满火冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
			
			--燃媒火球-------------------------------------------------------------------------------------------
			if WR_MageFire_HQS("target")
			--火球术
			and
			BuffTime_RS>NextGCD+WR_GetTrueCastTime("火球术")+FlyTime+MaxGCD*2
			--燃烧 BUFF时间>下一个技能时间+火球术 施法时间+飞行时间+公共冷却时间(瞬发炎爆术)*2
			and
			BuffCount_TYZWDZF<7
			--太阳之王的祝福 BUFF层数<7
			and
			BuffTime_LYCM>NextGCD
			--烈焰触媒 BUFF存在
			and
			(
				Critical_HQS_EndTime==nil
				--上一次 必爆火球术 放出时间不存在
				or
				GetTime()-Critical_HQS_EndTime>=Latency
				--距离上一次 必爆火球术 放出时间>=延迟
				--目的是刚刚读完火球术但是由于延迟导致火球术飞行未能识别,为避免连读两次火球术的措施
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF1","燃媒火球",zhandoumoshi) --显示指定色块窗体
				return
			end
			--燃媒火球-------------------------------------------------------------------------------------------
			
			--燃烧满鸟-------------------------------------------------------------------------------------------
			if WR_MageFire_BSNZY_Max("target")
			--不死鸟之焰 条件通过
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","燃烧满鸟",zhandoumoshi) --显示指定色块窗体
				return
			end

			--燃烧流星
			if WR_MageFire_LX()
			--技能 条件通过
			and
			BuffTime_RS>NextGCD+3+Latency
			--燃烧BUFF时间>下一个技能时间+3秒+延迟
			then
				if WRSet.HF_LX==1
				--流星 提示
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ASF8","燃烧流星",zhandoumoshi) --显示指定色块窗体
					return
				end
				if WRSet.HF_LX==2 then
				--流星 指向
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ASF9","燃烧流星",zhandoumoshi) --显示指定色块窗体
					return
				end
			end

			--燃烧火球-------------------------------------------------------------------------------------------
			if GetHaste()/100>=1.00
			--急速超过100%
			and
			WR_MageFire_HQS("target")
			--火球术
			and
			BuffTime_RS>NextGCD+WR_GetTrueCastTime("火球术")+FlyTime+MaxGCD*2
			--燃烧 BUFF时间>下一个技能时间+火球术 施法时间+飞行时间+公共冷却时间(瞬发炎爆术)*2
			and
			BuffCount_TYZWDZF<7
			--太阳之王的祝福 BUFF层数<7
			and
			BuffTime_RYZN<=NextGCD
			--燃焰之怒 BUFF不存在
			and
			(
				(
					WR_GetSpellCharges("火焰冲击")==1
					--技能可用次数
					and
					WR_GetSpellNextCharge("火焰冲击")>NextGCD+MaxGCD+WR_GetTrueCastTime("火球术")/2
					----技能充能剩余时间>下一个技能时间+公共冷却时间(瞬发炎爆)+火球术 施法时间/2
				)
				or
				(
					WR_GetSpellCharges("火焰冲击")==0
					--技能可用次数
					and
					(
						WR_GetSpellNextCharge("火焰冲击")<NextGCD+WR_GetTrueCastTime("火球术")/2
						--技能充能剩余时间<下一个技能时间+火球术 施法时间/2
						or
						(
							WR_GetSpellNextCharge("火焰冲击")<NextGCD+WR_GetTrueCastTime("火球术")/2+1
							--技能充能剩余时间<下一个技能时间+火球术 施法时间/2+1秒恢复
							and
							(
								HQS_FiyTime~=nil
								--火球术 飞行中
								or
								YBS_FiyTime~=nil
								--炎爆术 飞行中
							)
						)
					)
				)
			)
			and
			(
				Critical_HQS_EndTime==nil
				--上一次 必爆火球术 放出时间不存在
				or
				GetTime()-Critical_HQS_EndTime>=Latency
				--距离上一次 必爆火球术 放出时间>=延迟
				--目的是刚刚读完火球术但是由于延迟导致火球术飞行未能识别,为避免连读两次火球术的措施
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF1","燃烧火球",zhandoumoshi) --显示指定色块窗体
				return
			end
			--燃烧火球-------------------------------------------------------------------------------------------

			--燃烧灼烧-------------------------------------------------------------------------------------------
			if GetHaste()/100<1.00
			--急速低于100%
			and
			WR_MageFire_ZS("target")
			--灼烧
			and
			BuffTime_RS>NextGCD+WR_GetTrueCastTime("灼烧")+MaxGCD*2
			--燃烧 BUFF时间>下一个技能时间+灼烧 施法时间+公共冷却时间(瞬发炎爆术)*2
			and
			BuffCount_TYZWDZF<7
			--太阳之王的祝福 BUFF层数<7
			and
			BuffTime_RYZN<=NextGCD
			--燃焰之怒 BUFF不存在
			and
			(
				(
					WR_GetSpellCharges("火焰冲击")==1
					--技能可用次数
					and
					WR_GetSpellNextCharge("火焰冲击")>NextGCD+MaxGCD+WR_GetTrueCastTime("灼烧")/2
					----技能充能剩余时间>下一个技能时间+公共冷却时间(瞬发炎爆)+灼烧 施法时间/2
				)
				or
				(
					WR_GetSpellCharges("火焰冲击")==0
					--技能可用次数
					and
					(
						WR_GetSpellNextCharge("火焰冲击")<NextGCD+WR_GetTrueCastTime("灼烧")/2
						--技能充能剩余时间<下一个技能时间+灼烧 施法时间/2
						or
						(
							WR_GetSpellNextCharge("火焰冲击")<NextGCD+WR_GetTrueCastTime("灼烧")/2+1
							--技能充能剩余时间<下一个技能时间+灼烧 施法时间/2+1秒恢复
							and
							(
								HQS_FiyTime~=nil
								--火球术 飞行中
								or
								YBS_FiyTime~=nil
								--炎爆术 飞行中
							)
						)
					)
				)
			)
			and
			(
				Critical_HQS_EndTime==nil
				--上一次 必爆火球术 放出时间不存在
				or
				GetTime()-Critical_HQS_EndTime>=Latency
				--距离上一次 必爆火球术 放出时间>=延迟
				--目的是刚刚读完火球术但是由于延迟导致火球术飞行未能识别,为避免连读两次火球术的措施
			)
			then
				
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF5","燃烧灼烧",zhandoumoshi) --显示指定色块窗体
				return
			end
			--燃烧灼烧-------------------------------------------------------------------------------------------

			if WR_MageFire_HYCJ(MaxDebuff_DR_Unit)
			--火焰冲击
			and
			WR_MageFire_LongTime_BSNZY()
			--不死鸟之焰 已经打出一段时间
			and
			WR_MageFire_LongTime_LXS()
			--龙息术 已经打出一段时间
			then
				if MaxDebuff_DR_Unit=="target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","燃烧火冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","燃烧火冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","燃烧火冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","燃烧火冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","燃烧火冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","燃烧火冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
			end

			--燃烧鸟-------------------------------------------------------------------------------------------
			if WR_MageFire_BSNZY("target")
			--不死鸟之焰 条件通过
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","燃烧鸟",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--燃烧龙息
			if WRSet.HF_LXS==2
			--龙息术 加入循环
			and
			WR_MageFire_LXS("target")
			--龙息术 条件通过
			and
			WR_GetSpellCharges("不死鸟之焰")<=1
			--技能可用次数
			and
			BuffTime_RYZN<=NextGCD
			--燃焰之怒 BUFF不存在
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				LXS_EndTime=GetTime()+GCD	--记录龙息术放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSJ","燃烧龙息",zhandoumoshi) --显示指定色块窗体
				return
			end
			
		end
		--燃烧期间------------------------------------------------------------------------------------------------------------
		
		--非燃烧期间------------------------------------------------------------------------------------------------------------
		if BuffTime_RS<=NextGCD+MaxGCD+FlyTime
		--燃烧 BUFF时间<=下一个技能时间+飞行时间
		and
		BuffTime_RLBF>NextNextGCD
		--热力迸发 BUFF时间>下一个施法时间+延迟
		and
		not SpellFiying
		--没有法术在飞行中
		and
		(
			Critical_HQS_EndTime==nil
			--上一次 必爆火球术 放出时间不存在
			or
			GetTime()-Critical_HQS_EndTime>=Latency
			--距离上一次 必爆火球术 放出时间>=延迟
			--目的是不要让不死鸟和火冲 与 必爆的火球术同时放出
		)
		then
			--非燃满火冲-------------------------------------------------------------------------------------------
			if WR_MageFire_HYCJ_Max(MaxDebuff_DR_Unit)
			--火焰冲击
			and
			WR_MageFire_LongTime_BSNZY()
			--不死鸟之焰 已经打出一段时间
			and
			WR_MageFire_LongTime_LXS()
			--龙息术 已经打出一段时间
			then
				if MaxDebuff_DR_Unit=="target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","非燃满冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","非燃满冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","非燃满冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","非燃满冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","非燃满冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","非燃满冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
			end

			--非燃满鸟-------------------------------------------------------------------------------------------
			if WR_MageFire_BSNZY_Max("target")
			--不死鸟之焰 条件通过
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","非燃满鸟",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--非燃充火冲-------------------------------------------------------------------------------------------
			if WR_MageFire_HYCJ(MaxDebuff_DR_Unit)
			--火焰冲击
			and
			WR_GetGCD("变易幻能")<NextGCD+MaxGCD
			--变易幻能<下一个技能时间+公共冷却时间(瞬发炎爆)
			and
			WR_MageFire_LongTime_BSNZY()
			--不死鸟之焰 已经打出一段时间
			and
			WR_MageFire_LongTime_LXS()
			--龙息术 已经打出一段时间
			then
				if MaxDebuff_DR_Unit=="target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","非燃充冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","非燃充冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","非燃充冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","非燃充冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","非燃充冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","非燃充冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
			end

			--变易幻能-------------------------------------------------------------------------------------------
			if WR_MageFire_BYHN() then
			--变易幻能 施法条件通过
				if WR_MageFire_FB()
				--浮冰条件通过
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F11","幻能浮冰",zhandoumoshi) --显示指定色块窗体
					return
				end

				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF6","变易幻能",zhandoumoshi) --显示指定色块窗体
				return
			end

			--燃烧免费鸟-------------------------------------------------------------------------------------------
			if WR_MageFire_BSNZY_Free("target")
			--不死鸟之焰 条件通过
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","燃烧免费鸟",zhandoumoshi) --显示指定色块窗体
				return
			end

			--非燃龙息
			if WRSet.HF_LXS==2
			--龙息术 加入循环
			and
			WR_MageFire_LXS("target")
			--龙息术 条件通过
			and
			WR_GetSpellCharges("不死鸟之焰")<=1
			--技能可用次数
			and
			BuffTime_RYZN<=NextGCD
			--燃焰之怒 BUFF不存在
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				LXS_EndTime=GetTime()+GCD	--记录龙息术放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSJ","非燃龙息",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--非燃鸟-------------------------------------------------------------------------------------------
			if WR_MageFire_BSNZY("target")
			--不死鸟之焰 条件通过
			and
			WR_MageFire_LongTime_HYCJ()
			--火焰冲击 已经打出一段时间
			then
				BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","非燃鸟",zhandoumoshi) --显示指定色块窗体
				return
			end
			
			--非燃火冲-------------------------------------------------------------------------------------------
			if WR_MageFire_HYCJ(MaxDebuff_DR_Unit)
			--火焰冲击
			and
			WR_MageFire_LongTime_BSNZY()
			--不死鸟之焰 已经打出一段时间
			and
			WR_MageFire_LongTime_LXS()
			--龙息术 已经打出一段时间
			then
				if MaxDebuff_DR_Unit=="target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","非燃火冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","非燃火冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","非燃火冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","非燃火冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","非燃火冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					HYCJ_EndTime=GetTime()	--记录火焰冲击放出的时间
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","非燃火冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
			
		end
		--非燃烧期间------------------------------------------------------------------------------------------------------------

	end
	--不在读条施法期间的不死鸟或火冲-------------------------------------------------------------------------------------------

	
	--时间扭曲-------------------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--爆发 开启
	and
	WR_SpellUsable("时间扭曲")
	--技能可用
	and
	(
		DebuffTime_FSYH>NextGCD
		--焚身余灰 DEBUFF时间>下一个技能时间
		or
		WR_LastSpellName=="不死鸟之焰"
		--最后一个技能是 不死鸟之焰
		or
		BSNZY_FiyTime~=nil
		--不死鸟之焰 飞行中
	)
	and
	Training
	--在打木桩
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","时间扭曲",zhandoumoshi) --显示指定色块窗体
		return
	end

	--镜像-------------------------------------------------------------------------------------------------------
	if WRSet.HF_JX==1
	--镜像 开启
	and
	zhandoumoshi==1
	--爆发 开启	
	and
	WR_SpellUsable("镜像")
	--技能可用 资源可用
	and
	WR_GetUnitRange("target")<=40
	--单位距离
	and
	WR_TargetInCombat("target")
	--单位可攻击
	and
	BuffTime_RS<=GCD
	--燃烧 BUFF 不存在
	and
	not
	(
		BuffTime_TYWDNH>NextGCD+WR_GetTrueCastTime("炎爆术")
		--太阳王的怒火 BUFF时间>下一个技能时间+炎爆术施法时间
		and
		UnitCastingInfo("player")=="炎爆术"
		--当前施法 炎爆术
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","镜像",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--燃烧-------------------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--爆发 开启
	and
	WR_SpellUsable("燃烧")
	--技能可用 资源可用
	and
	AvgDeathTime>=20
	--预计战斗结束时间>=20秒
	and
	BuffTime_RS<=3.6
	--燃烧BUFF时间<=3.6
	and
	(
		BuffTime_RS>GCD
		--燃烧BUFF 存在
		or
		(
			BuffTime_TYWDNH==0
			--太阳王的怒火 BUFF不存在
			and
			BuffCount_TYZWDZF<4
			--太阳王的祝福 BUFF层数<4
		)
		or
		(
			BuffTime_TYWDNH>NextGCD+FlyTime
			--太阳王的怒火 BUFF时间>下一个施法时间+飞行时间
			and
			UnitCastingInfo("player")=="炎爆术"
			--正在施法 炎爆术
			and
			WR_GetUnitCastInfo("player")>=WR_GetTrueCastTime("炎爆术")/2
			--炎爆术已经施法的时间过半
		)
	)
	then
		--燃烧前流星
		if WR_MageFire_LX() then
		--技能 条件通过
			if WRSet.HF_LX==1
			--流星 提示
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF8","燃烧前流星",zhandoumoshi) --显示指定色块窗体
				return
			end
			if WRSet.HF_LX==2 then
			--流星 指向
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF9","燃烧前流星",zhandoumoshi) --显示指定色块窗体
				return
			end
		end

		--燃烧前炸弹
		if WR_MageFire_HTZD() then
		--技能 条件通过
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSI","燃烧前炸弹",zhandoumoshi) --显示指定色块窗体
			return
		end

		--爆发药水
		if WRSet.HF_BFYS==1 then
			local BFYS={
			[1]="飞逝元素究极强能药水",
			[2]="元素究极强能药水",
			[3]="元素强能药水",
			}
			local BFYS_ID
			for _, BFYS_name in ipairs(BFYS) do
				local count=GetItemCount(BFYS_name)
				--获取物品数量
				local start, duration, enable = GetItemCooldown(BFYS_name)
				--获取物品是否可以使用
				if count~=nil and count>=1 and start+duration-GetTime()<=0 then
				--             物品数量>=1  且  物品可以使用
				
					--饰品1--------------------------------------------------------------------------------------------	
					if (WRSet.HF_SP==1 or WRSet.HF_SP==3)
					--使用1号饰品 或 使用1-2号饰品
					and WR_GetEquipCD(13) then
					--1号饰品可以使用
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CSN","爆药饰品1",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--饰品2--------------------------------------------------------------------------------------------	
					if (WRSet.HF_SP==2 or WRSet.HF_SP==3)
					--使用2号饰品 或 使用1-2号饰品
					and WR_GetEquipCD(14) then
					--2号饰品可以使用
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CSU","爆药饰品2",zhandoumoshi) --显示指定色块窗体
						return
					end
				
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF9","爆发药水",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
		end
		
		--饰品1--------------------------------------------------------------------------------------------	
		if (WRSet.HF_SP==1 or WRSet.HF_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSK","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		--饰品2--------------------------------------------------------------------------------------------	
		if (WRSet.HF_SP==2 or WRSet.HF_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSM","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF8","燃烧",zhandoumoshi) --显示指定色块窗体
		return
	end
	
	--瞬发炎爆术-------------------------------------------------------------------------------------------
	if WR_MageFire_SF_YBS("target")
	--炎爆术
	and
	GCD<=ShiFaSuDu
	--GCD<=施法速度
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","瞬发炎爆术",zhandoumoshi) --显示指定色块窗体
		return
	end	
	
	
	
	
	--施法速度检测，如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if GCD>ShiFaSuDu
	--GCD>施法速度
	or
	(
		SpellFiying
		--技能飞行中
		--and
		--BuffTime_RLBF>=GCD
		--热力迸发 BUFF存在
	)
	or
	(
		UnitCastingInfo("player")=="炎爆术"
		--正在施法 炎爆术
		and
		BuffTime_TYWDNH>GCD
		--太阳王的怒火 BUFF时间>当前施法剩余时间
		--如果正在施放进入太阳王燃烧的炎爆术，则停止操作下面的动作。
	)
	or
	(
		UnitCastingInfo("player")=="火球术"
		--正在施法 火球术
		and
		BuffTime_RS>GCD
		--燃烧 BUFF存在
		--如果燃烧期间施法火球术，则不要做任何动作
	)
	or
	(
		YBS_FiyTime==nil
		--炎爆术 飞行时间为空
		and
		TYB_YBS_EndTime~=nil
		and
		GetTime()-TYB_YBS_EndTime<=Latency
		--太阳王炎爆术结束时间<=延迟
		--刚刚放了炎爆术要缓一缓等炎爆术打出
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	--施法速度检测，如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------



	--如果单位不可攻击，则不再往下执行操作-------------------------------------------------------------
	if not WR_TargetInCombat("target")
	--单位不可攻击
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	--如果单位不可攻击，则不再往下执行操作-------------------------------------------------------------
	
	--变易幻能-------------------------------------------------------------------------------------------
	if WR_MageFire_BYHN() then
	--变易幻能 施法条件通过
		if WR_MageFire_FB()
		--浮冰条件通过
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("F11","幻能浮冰",zhandoumoshi) --显示指定色块窗体
			return
		end

		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF6","变易幻能",zhandoumoshi) --显示指定色块窗体
		return
	end

	--太阳王炎爆-------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--爆发 开启
	and
	WR_MageFire_DT_YBS("target")
	--读条炎爆术 条件通过
	and
	BuffTime_TYWDNH>NextGCD+WR_GetTrueCastTime("炎爆术")
	--太阳王的怒火 BUFF时间>下一个技能时间+炎爆术施法时间
	and
	TargetDeathTime>NextGCD+WR_GetTrueCastTime("炎爆术")+FlyTime
	--目标死亡时间>下一个技能时间+炎爆术施法时间+飞行时间
	and
	(
		TYB_YBS_EndTime==nil
		--没有记录的太阳王炎爆术施法结束时间
		or
		GetTime()-TYB_YBS_EndTime>1
		--距离上一次太阳王炎爆术施法结束时间>1秒
		--这段是为了防止：上一次读条施法太阳王炎爆术后，由于延迟的问题，太阳王BUFF还在身上，结果读第二次炎爆术
	)
	then
		if  WR_MageFire_FB()
		--浮冰条件通过
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("F11","太阳王浮冰",zhandoumoshi) --显示指定色块窗体
			return
		end
		
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","太阳王炎爆",zhandoumoshi) --显示指定色块窗体
		return
	end

	--流星--
	if WR_MageFire_LX()
	--技能 条件通过
	and
	BuffTime_RS>NextGCD+3+Latency
	--燃烧BUFF时间>下一个技能时间+3秒+延迟
	then
		if WRSet.HF_LX==1
		--流星 提示
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","流星",zhandoumoshi) --显示指定色块窗体
			return
		end
		if WRSet.HF_LX==2 then
		--流星 指向
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF9","流星",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
			
	--活动炸弹
	if WR_MageFire_HTZD() then
	--技能 条件通过
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSI","活动炸弹",zhandoumoshi) --显示指定色块窗体
		return
	end

	if BuffTime_CRLJ==0
	--炽热连击！ BUFF不存在
	and
	BuffTime_TYWDNH<NextGCD+WR_GetTrueCastTime("炎爆术")
	--太阳王的怒火 BUFF时间<下一个技能时间+炎爆术施法时间
	and
	(
		(
			WR_MageFire_Crit_Spell()
			--当前施法必爆法术
			and
			BuffTime_RLBF<=GCD
			--热力迸发 BUFF不存在
		)
		or
		not WR_MageFire_Crit_Spell()
		--当前 没有 施法必爆法术
	)
	and
	(
		HYCJ_EndTime==nil
		--上一次火焰冲击放出时间不存在
		or
		GetTime()-HYCJ_EndTime>=Latency
		--距离上一次火焰冲击放出时间>=延迟
		--目的是不要让不死鸟和火冲同时放出
	)
	then
			
		--不死鸟-------------------------------------------------------------------------------------------
		if WR_MageFire_BSNZY("target")
		--不死鸟之焰 条件通过
		and
		BuffTime_RS<=NextGCD+FlyTime
		--燃烧 BUFF存在<=下一个技能时间+飞行时间
		then
			BSNZY_EndTime=GetTime()+GCD	--记录不死鸟之焰放出的时间
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","不死鸟",zhandoumoshi) --显示指定色块窗体
			return
		end

		--龙息术
		if WRSet.HF_LXS==2
		--龙息术 加入循环
		and
		WR_MageFire_LXS("target")
		--龙息术 条件通过
		and
		BuffTime_RS<=NextGCD
		--燃烧BUFF时间<=下一个施法时间
		then
			LXS_EndTime=GetTime()+GCD	--记录龙息术放出的时间
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSJ","龙息术",zhandoumoshi) --显示指定色块窗体
			return
		end
	end

	--媒火球-------------------------------------------------------------------------------------------
	if WR_MageFire_HQS("target")
	--火球术
	and
	BuffTime_LYCM>NextGCD
	--烈焰触媒 BUFF存在
	and
	(
		Critical_HQS_EndTime==nil
		--上一次 必爆火球术 放出时间不存在
		or
		GetTime()-Critical_HQS_EndTime>=Latency
		--距离上一次 必爆火球术 放出时间>=延迟
		--目的是刚刚读完火球术但是由于延迟导致火球术飞行未能识别,为避免连读两次火球术的措施
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","媒火球",zhandoumoshi) --显示指定色块窗体
		return
	end
	--燃媒火球-------------------------------------------------------------------------------------------

	--灼烧T-------------------------------------------------------------------------------------------
	if WR_MageFire_ZS("target")
	--灼烧T
	and
	(
		Critical_HQS_EndTime==nil
		--上一次 必爆火球术 放出时间不存在
		or
		GetTime()-Critical_HQS_EndTime>=Latency
		--距离上一次 必爆火球术 放出时间>=延迟
		--目的是不要让不死鸟和火冲同时放出
	)
	then
		--灼烧火冲-------------------------------------------------------------------------------------------
		if WR_MageFire_HYCJ(MaxDebuff_DR_Unit)
		--火焰冲击
		and
		UnitCastingInfo("player")==nil
		--当前没有施法
		and
		BuffTime_RLBF>GCD
		--热力迸发 BUFF存在
		then
				if MaxDebuff_DR_Unit=="target" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F12","灼烧火冲T",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="mouseover" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F10","灼烧火冲M",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party1target" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F6","灼烧火冲P1",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party2target" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F7","灼烧火冲P2",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party3target" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F8","灼烧火冲P3",zhandoumoshi) --显示指定色块窗体
					return
				end
				if MaxDebuff_DR_Unit=="party4target" then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("F9","灼烧火冲P4",zhandoumoshi) --显示指定色块窗体
					return
				end
		end
	
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF5","灼烧T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--灼烧T-------------------------------------------------------------------------------------------


--]]