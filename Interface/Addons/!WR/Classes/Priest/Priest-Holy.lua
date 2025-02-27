--神圣运行库
function WR_PriestHoly()
	if GetSpecialization()~=2 then	--如果不是神圣(2)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.SS_SFSD*0.05
		Resist=false --初始化防御机制
		ResistSustained=WR_ResistSustained()	--持续型伤害
		ResistOutburstTime=WR_ResistOutburstTime()	--尖刺型伤害，施法时间剩余小于5秒
		MustDefenseTime=WR_MustDefenseTime()	--必须开启防御
		
		if ResistSustained or ResistOutburstTime<=5 or MustDefenseTime<=5 then
		--持续型伤害 或 尖刺型伤害，施法时间剩余小于5秒 或 必须开启防御 
			Resist=true
		end
		WR_GetPartyLostHealth()	--获取队友真实的可恢复的血量，获得：PlayerLostHealth,TargetLostHealth,FocusLostHealth,PartyLostHealth[i],RiadLostHealth[i]
		
		GCD=WR_GetGCD("真言术：韧")	--获得公共冷却剩余时间或者当前施法剩余时间
		CD_NLGZ=WR_GetGCD("能量灌注")	--获得能量灌注冷却剩余时间
		CD_SHZH=WR_GetGCD("守护之魂")	--获得守护之魂剩余时间
		CD_JWDY=WR_GetGCD("绝望祷言")	--获得 守护之魂 剩余时间
		CD_JYS=WR_GetGCD("渐隐术")	--获得 渐隐术 剩余时间
		CD_SSZH=WR_GetGCD("神圣之火")	--获得 神圣之火 剩余时间
		
		--ZYSYCharges=WR_GetSpellCharges("真言术：耀")	--获得真言术：耀可使用的次数
		MaxLatency=WR_GetMaxLatency()	--获得当前最大网络延时
		MaxLatency=MaxLatency+0.05	--为最大网络延时增加阈值
		if MaxLatency < 0.1 then
			Latency=0.1
		else
			Latency=MaxLatency
		end
		if MaxLatency > 0.25 then
			Latency=0.25
		else
			Latency=MaxLatency
		end

		PlayerHP=1
		if UnitHealthMax("player")~=0 then
			PlayerHP=UnitHealth("player")/UnitHealthMax("player")
		end
		
		FocusHP=1
		if UnitHealthMax("focus")~=0 then
			FocusHP=UnitHealth("focus")/UnitHealthMax("focus")
		end
		
		TargetHP=1
		if UnitHealthMax("target")~=0 then
			TargetHP=UnitHealth("target")/UnitHealthMax("target")
		end
		
		FocusLostHealth=WR_GetUnitLostHealth("focus")
		if SYSJ_Health==nil then	--初始化
			SYSJ_Health=WR_GetSpellValue("圣言术：静","恢复","点生命值")
			ZLS_Health=WR_GetSpellValue("治疗术","恢复","点生命值")
			KSZL_Health=WR_GetSpellValue("快速治疗","恢复","点生命值")
			SYSL_Health=WR_GetSpellValue("圣言术：灵","恢复","点生命值")
			SSXX_Health=WR_GetSpellValue("神圣新星","恢复","点生命值")
		end
		if WR_GetSpellValue("圣言术：静","恢复","点生命值")~=0 then
			SYSJ_Health=WR_GetSpellValue("圣言术：静","恢复","点生命值")
		end
		if WR_GetSpellValue("治疗术","恢复","点生命值")~=0 then
			ZLS_Health=WR_GetSpellValue("治疗术","恢复","点生命值")
		end
		if WR_GetSpellValue("快速治疗","恢复","点生命值")~=0 then
			KSZL_Health=WR_GetSpellValue("快速治疗","恢复","点生命值")
		end
		if WR_GetSpellValue("圣言术：灵","恢复","点生命值")~=0 then
			SYSL_Health=WR_GetSpellValue("圣言术：灵","恢复","点生命值")
		end
		if WR_GetSpellValue("神圣新星","恢复","点生命值")~=0 then
			SSXX_Health=WR_GetSpellValue("神圣新星","恢复","点生命值")
		end
		PartyInCombat=WR_PartyInCombat() --队伍在战斗中
		
		
		PlayerInCombat=UnitAffectingCombat("player")	--玩家在战斗中
		
		TargetInCombat=WR_TargetInCombat("target")	--单位在与我们进行战斗
		
		--P1TInCombat=WR_TargetInCombat("party1target")	--单位在与我们进行战斗
		--P2TInCombat=WR_TargetInCombat("party2target")	--单位在与我们进行战斗
		--P3TInCombat=WR_TargetInCombat("party3target")	--单位在与我们进行战斗
		--P4TInCombat=WR_TargetInCombat("party4target")	--单位在与我们进行战斗
		WR_GetLastSpellName()	--获取上一次的技能名称，返回值：WR_LastSpellName
		
		if WR_GetUnitRange("target")<=46 and UnitCanAttack("player","target") then
		--单位距离
			TargetInSpellRange = true	--判断单位在指定技能范围内
		else
			TargetInSpellRange = false	--判断单位在指定技能范围内
		end
		
		RaidOrParty=WR_GetInRaidOrParty()
		
		PlayerMove=WR_PlayerMove()	--单位移动
		

		TargetRange=WR_GetUnitRange("target")	--获得目标距离
		--TargetMustheal=WR_Mustheal("target")--目标必须受到治疗
		FocusMustheal=WR_Mustheal("focus")--目标必须受到治疗
		
		
		if IsSpellInRange("快速治疗","focus") and UnitIsFriend("player","focus") then	--判断单位在指定施法范围内
			FocusInSpellRange = true	--判断单位在指定施法范围内
		else
			FocusInSpellRange = false	--判断单位在指定施法范围内
		end
		
		BuffTime_JSZH,BuffCount_JSZH,BuffSum_JSZH=WR_GetUnitBuffInfo("player","救赎之魂")	--获得救赎之魂Buff信息
		BuffTime_GMSY,BuffCount_GMSY,BuffSum_GMSY=WR_GetUnitBuffInfo("player","共鸣圣言")	--获得共鸣圣言Buff信息
		BuffTime_ZGZ,BuffCount_ZGZ,BuffSum_ZGZ=WR_GetUnitBuffInfo("player","织光者")	--获得织光者Buff信息
		BuffTime_SGYD,BuffCount_SGYD,BuffSum_SGYD=WR_GetUnitBuffInfo("player","圣光涌动")	--获得圣光涌动Buff信息
		BuffTime_ZYSD,BuffCount_ZYSD,BuffSum_ZYSD=WR_GetUnitBuffInfo("player","真言术：盾")	--获得真言术：盾Buff信息
		BuffTime_HS,BuffCount_HS,BuffSum_HS=WR_GetUnitBuffInfo("player","喝水")	--获得喝水Buff信息
		BuffTime_YY,BuffCount_YY,BuffSum_YY=WR_GetUnitBuffInfo("player","饮用")	--获得饮用Buff信息
		BuffTime_JSYS,BuffCount_JSYS,BuffSum_JSYS=WR_GetUnitBuffInfo("player","进食饮水")	--获得进食饮水Buff信息
		BuffTime_SHZH,BuffCount_SHZH,BuffSum_SHZH=WR_GetUnitBuffInfo("player","守护之魂")	--获得守护之魂Buff信息
		BuffTime_DYZH,BuffCount_DYZH,BuffSum_DYZH=WR_GetUnitBuffInfo("player","祷言之环")	--获得祷言之环Buff信息
		BuffTime_CQZY,BuffCount_CQZY,BuffSum_CQZY=WR_GetUnitBuffInfo("player","苍穹之焰")	--获得 苍穹之焰 Buff信息
		BuffTime_SSHS,BuffCount_SSHS,BuffSum_SSHS=WR_GetUnitBuffInfo("player","神圣化身")	--获得 神圣化身 Buff信息
		BuffTime_TTZY,BuffCount_TTZY,BuffSum_TTZY=WR_GetUnitBuffInfo("player","天堂之羽")	--获得 天堂之羽 Buff信息
		BuffTime_SXHY,BuffCount_SXHY,BuffSum_SXHY=WR_GetUnitBuffInfo("player","身心合一")	--获得 身心合一 Buff信息
		BuffTime_TSBL,BuffCount_TSBL,BuffSum_TSBL=WR_GetUnitBuffInfo("player","天使壁垒")	--获得 天使壁垒 Buff信息
		BuffTime_JWDY,BuffCount_JWDY,BuffSum_JWDY=WR_GetUnitBuffInfo("player","绝望祷言")	--获得 绝望祷言 Buff信息
		BuffTime_ZLHS,BuffCount_ZLHS,BuffSum_ZLHS=WR_GetUnitBuffInfo("player","治疗和声")	--获得 治疗和声 Buff信息
		BuffTime_KXQ,BuffCount_KXQ,BuffSum_KXQ=WR_GetUnitBuffInfo("player","狂想曲")	--获得 狂想曲 Buff信息
		BuffTime_SJQJ,BuffCount_SJQJ,BuffSum_SJQJ=WR_GetUnitBuffInfo("player","圣洁虔敬")	--获得 圣洁虔敬 Buff信息
		BuffTime_GMZQ,BuffCount_GMZQ,BuffSum_GMZQ=WR_GetUnitBuffInfo("player","光明之泉")	--获得 光明之泉 Buff信息
		
		DebuffTime_JT=WR_GetUnitDebuffTime("player","践踏") --获得单位指定Debuff的剩余时间
		
		FocusBuffTime_YHDY,FocusBuffCount_YHDY,FocusBuffSum_YHDY=WR_GetUnitBuffInfo("focus","愈合祷言",true)	--获得愈合祷言Buff信息
		FocusBuffTime_ZYSD,FocusBuffCount_ZYSD,FocusBuffSum_ZYSD=WR_GetUnitBuffInfo("focus","真言术：盾")	--获得真言术：盾Buff信息

		TargetInvincible=WR_Invincible("target")--获取目标是否无敌
		
		PartyLostHP=WR_PartyLostHP("纯净术")	--获得小队平均损失血量
		
		AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获取当前指定技能范围内单位预计死亡时间
		
		HUCountRange10=WR_GetRangeHarmUnitCount(10)	--获得技能范围内敌对单位数量
		HUCountRange40=WR_GetRangeHarmUnitCount(40)	--获得技能范围内敌对单位数量
		
		if UnitIsDead("player")==false then
		--自己存活
			if RaidOrParty=="raid" then
			--在团队中
				SSXXCount=WR_RangeCountPR(12,0.94)	--神圣新星
				GYCount=WR_RangeCountPR(46,0.90)	--光晕
				SYSLCount=WR_RangeCountPR(46,0.94)	--圣言术:灵
				ZLZHCount=WR_RangeCountPR(46,0.97)	--治疗之环
				ZLDYCount=WR_RangeCountPR(46,0.90)	--治疗祷言
			else
			--不在团队中
				SSXXCount=WR_RangeCountPR(12,0.94)	--神圣新星
				GYCount=WR_RangeCountPR(46,0.90)	--光晕
				SYSLCount=WR_RangeCountPR(46,0.91)	--圣言术:灵
				ZLZHCount=WR_RangeCountPR(46,0.95)	--治疗之环
				ZLDYCount=WR_RangeCountPR(46,0.80)	--治疗祷言
			end
		end
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
		
	if not UnitAffectingCombat("player") then	--不在战斗中
		for i=1,4,1 do 
			local TempUnit="party"..i
			if UnitExists(TempUnit)	--单位存在
			and UnitName(TempUnit)~=nil	--单位名称存在
			then
				if SS_NLGZ_menuItems[i].text~=WR_ClassesColor(TempUnit) then	--如果列表指定选项文本不等于当前单位名称
					SS_NLGZ_UpdateMenuItemText(i, WR_ClassesColor(TempUnit))	--给 能量灌注 下拉菜单更新文本
				end
			else
				if SS_NLGZ_menuItems[i].text~="" then	--如果列表指定选项文本不等于当前单位名称
					SS_NLGZ_UpdateMenuItemText(i, "")	--给 能量灌注 下拉菜单更新文本
				end
			end
		end
	end
	
	if MSG==1 then
--[[
		print("战斗结束时间:",MaxDeathTime)
		print("圣言术：灵 范围数量=",SYSLCount)
		print("神圣新星 范围数量=",SSXXCount)
		print("光晕 范围数量=",GYCount)
		print("治疗之环 范围数量=",ZLZHCount)
		print("治疗祷言 范围数量=",ZLDYCount)
--]]
		print("-----------------")

	end
	if WR_PriorityCheck() then return end	--优先检查
	if WR_FocusMaxWeightUnit() then return end	--焦点最高权重单位
	if WR_PriestHoly_StopCasting() then return end	--停止施法 群活的时候,没有队友阵亡
	if WR_PriestHoly_JYS() then return true end	--渐隐术 自我减伤
	
	if WRSet.SS_SP1>=3 then
		if WR_ShiPin(1,WRSet.SS_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.SS_SP2>=3 then
		if WR_ShiPin(2,WRSet.SS_SP2) then return true end	--饰品 自保/协助
	end
	
	
	if WR_PriestHoly_JianShang() then return true end	--减伤
	if WR_PriestHoly_ZLS() then return true end	--治疗石
	if WR_PriestHoly_ZLYS() then return true end	--治疗药水
	if WR_PriestHoly_NLGZ() then return true end	--能量灌注
	if WR_Function_ZNMB(40,WRSet.SS_ZNMB) then return true end	--智能目标
	if WR_PriestHoly_QTFH() then return true end	--群体复活
	if WR_PriestHoly_AYM() then return true end	--暗影魔
	if WR_PriestHoly_XLJX() then return true end	--心灵尖啸
	
	if WRSet.SS_SP1<=2 then
		if WR_ShiPin(1,WRSet.SS_SP1) then return true end	--饰品 常驻/爆发
	end
	if WRSet.SS_SP2<=2 then
		if WR_ShiPin(2,WRSet.SS_SP2) then return true end	--饰品 常驻/爆发
	end
	
----治疗手段----------------------------------------------------------------------------------------------
	if RaidOrParty~="raid" then
	--不在团队
		if WR_PriestHoly_YZ() then return true end	--预兆
		if WR_PriestHoly_ZYSM() then return true end	--真言术：命
		if WR_PriestHoly_SYSJ("35%") then return true end	--圣言术：静 35%血量
		if WR_PriestHoly_SHZH() then return true end	--守护之魂
		if WR_PriestHoly_QSMF_Function() then return true end	--驱散魔法
		if WR_PriestHoly_CJS_Function() then return true end	--纯净术
		if WR_PriestHoly_GMZQ() then return true end	--光明之泉
		if WR_PriestHoly_SSHS() then return true end	--神圣化身
		if WR_PriestHoly_SYSL() then return true end	--圣言术：灵
		if WR_PriestHoly_SYSJ("满层") then return true end	--圣言术：静 满层
		if WR_PriestHoly_SYSJ("暴击") then return true end	--圣言术：静 50%血量
		if WR_PriestHoly_GY(3) then return true end	--光晕
		if WR_PriestHoly_KSZL_FHSG() then return true end	--快速治疗 防护圣光(自我减伤)
		if WR_PriestHoly_ZhiLiaoShu("2层") then return true end	--治疗术 2层织光者
		if WR_PriestHoly_KSZL("涌动2层") then return true end	--快速治疗 圣光涌动2层(瞬发)
		if WR_PriestHoly_ZhiLiaoShu() then return true end	--治疗术 织光者
		if WR_PriestHoly_KSZL("涌动1层") then return true end	--快速治疗 圣光涌动1层(瞬发)
		if WR_PriestHoly_YHDY() then return true end	--愈合祷言
		if WR_PriestHoly_ZYSD("防护") then return true end	--真言术：盾 对自己增加防护
		if WR_PriestHoly_SSXX_Heal() then return true end	--神圣新星
		if WR_PriestHoly_ZLZH(4) then return true end	--治疗之环
		if WR_PriestHoly_KSZL() then return true end	--快速治疗
	else
	--在团队
		if WR_PriestHoly_GY(6) then return true end	--光晕
		if WR_PriestHoly_SYSJ("35%") then return true end	--圣言术：静 35%血量
		if WR_PriestHoly_SHZH() then return true end	--守护之魂
		if WR_PriestHoly_SSHS() then return true end	--神圣化身
		if WR_PriestHoly_SYSJ("满层") then return true end	--圣言术：静 满层
		if WR_PriestHoly_SYSJ("暴击") then return true end	--圣言术：静 50%血量
		if WR_PriestHoly_YHDY() then return true end	--愈合祷言
		if WR_PriestHoly_SSXX_Heal() then return true end	--神圣新星
		if WR_PriestHoly_KSZL_FHSG() then return true end	--快速治疗 防护圣光(自我减伤)
		if WR_PriestHoly_ZhiLiaoShu("2层") then return true end	--治疗术 2层织光者
		if WR_PriestHoly_KSZL("涌动2层") then return true end	--快速治疗 圣光涌动2层(瞬发)
		if WR_PriestHoly_ZhiLiaoShu() then return true end	--治疗术 织光者
		if WR_PriestHoly_KSZL("涌动1层") then return true end	--快速治疗 圣光涌动1层(瞬发)
		if WR_PriestHoly_ZYSD("防护") then return true end	--真言术：盾 对自己增加防护
		if WR_PriestHoly_KSZL() then return true end	--快速治疗
	end	
	
	if WR_PriestHoly_ZYSD("协助") then return true end	--协助盾
	if WR_PriestHoly_ZYSR() then return true end	--真言术：韧
	if WR_PriestHoly_ZYSD("加速") then return true end	--加速盾
	if WR_PriestHoly_ZhiLiaoShu("脱战") then return true end	--治疗术 脱战
	if WR_PriestHoly_HF() then return true end	--恢复
	
	if WR_PriestHoly_TTZY() then return true end	--天堂之羽
	if WR_PriestHoly_ZYSD("脱战") then return true end	--脱战盾
	if WR_PriestHoly_ZYSD("AOE") then return true end	--AOE盾

----伤害输出----------------------------------------------------------------------------------------------
	if TargetInCombat --目标在与我们进行战斗
	and TargetInSpellRange --目标在技能范围内
	and BuffTime_JSZH==0 --救赎之魂Buff不存在
	then
		if RaidOrParty~="raid" then
			if WR_PriestHoly_SYSF() then return true end	--圣言术：罚
			if WR_PriestHoly_SSZH() then return true end	--神圣之火
			if WR_PriestHoly_SSXX() then return true end	--神圣新星
			if WR_PriestHoly_AYST("target") then return true end	--暗言术：痛
			if WR_PriestHoly_KXS() then return true end	--控心术
			if WR_PriestHoly_AYSM("target") then return true end	--暗言术：灭
		end
	
		if WR_PriestHoly_SYSF() then return true end	--圣言术：罚
		if WR_PriestHoly_CJ() then return true end	--惩击
	end
----伤害输出----------------------------------------------------------------------------------------------





	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end



--战斗错误事件
function WR_PriestHoly_ErrorMessage()
	if WR_ErrorMessageInfo~=true then --只执行一次
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("UI_ERROR_MESSAGE")
		frame:SetScript("OnEvent", function(self, event, messageType, message)
			if string.find(message, "目标不在视野中") then
				ErrorMessageTime_OutOfSight=GetTime()
				return
			end
		end)
		WR_ErrorMessageInfo=true --只执行一次，记录已经执行
	end
end

--焦点治疗 施法条件
function WR_PriestHoly_FocusHealth(HealthValue)
	if FocusLostHealth >= HealthValue --焦点损失血量 >= 治疗量
	or FocusMustheal --目标必须受到治疗
	or ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
	or
	(
		WR_GetUnitBuffTime("player","虔诚预兆")>GCD	--虔诚预兆 存在
		and WR_RangeCountPR(46,1-HealthValue/UnitHealthMax("player")/5)>=3
	)
	then
		return true
	end
	
	return false
end

--治疗祷言 施法条件
function WR_PriestHoly_ZLDY()
	if WR_SpellUsable("治疗祷言")
	--技能可用 资源可用
	and
	not(PlayerMove)
	--自身不在移动或者空中
	and
	not(WR_StopCast(WR_GetTrueCastTime(1.8)))
	--避免施法被沉默的情况
	and
	(
		not IsPlayerSpell(321377)
		--没学 祷言之环
		or
		(
			IsPlayerSpell(321377)
			--已学 祷言之环
			and
			BuffTime_DYZH>0
			--祷言之环 Buff存在
		)
	)
	and
	(
		ZLDYCount>=5
		--治疗祷言范围内数量>=5
		or
		WR_PreemptiveHealing("治疗祷言")
		--AOE尖刺伤害结束后瞬间放出治疗祷言
	)
	then
		return true
	end
	return false
end


--暗影魔 施法条件
function WR_PriestHoly_AYM()
	if GCD<ShiFaSuDu
	and FocusHP>0.5	--焦点血量>50%
	and IsPlayerSpell(34433) --已学习
	and WR_GetGCD("暗影魔")<=GCD --技能冷却
	and WRSet.SS_AYM~=10 --暗影魔 开启
	and AvgDeathTime>15 and AvgDeathTime<999 --预计战斗时长
	and UnitPower("player",0)/UnitPowerMax("player",0)<WRSet.SS_AYM/10 --蓝量<暗影魔设定值
	then
		if WR_ColorFrame_Show("CSJ","暗影魔") then return true end
	end
	return false
end

--真言术：盾 施法条件
function WR_PriestHoly_ZYSD(Text)
	if GCD<ShiFaSuDu
	and IsPlayerSpell(17) --已学[真言术：盾]
	and WR_SpellUsable("真言术：盾") --技能可用
	then
	
		if Text=="防护"
		and PlayerInCombat --玩家在战斗中
		and IsInInstance() --在副本
		and BuffTime_JSZH==0 --救赎之魂Buff不存在
		and WR_GetUnitBuffTime("player","真言术：盾")==0 --单位没有 真言术：盾 BUFF
		then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("CF7","盾P") then return true end
			end
			if WR_FocusUnit("player","盾") then return true end --选择单位过程
		end
--[[
		if Text=="防护"
		and PlayerInCombat --玩家在战斗中
		and BuffTime_JSZH==0 --救赎之魂Buff不存在
		and WR_GetUnitBuffTime("player","真言术：盾")==0 --单位没有 真言术：盾 BUFF
		and
		(
			ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
			or
			MustDefenseTime<=5 --必须开启防御
			or
			WR_GetRangeSpellTime(45,nil,"player")<=3 --有敌人对我施法
			or
			WR_UnitAssistDebuff("player")	--玩家需要协助
			or
			(
				PlayerMove --玩家移动中
				and
				not WR_InBossCombat() --不在BOSS战中
			)
			or
			RaidOrParty=="raid"	--在团队
		)
		then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("CF7","盾P") then return true end
			end
			if WR_FocusUnit("player","盾") then return true end --选择单位过程
		end
--]]
		if Text=="加速"
		and PlayerInCombat --玩家在战斗中
		and BuffTime_JSZH==0 --救赎之魂Buff不存在
		and WR_GetUnitBuffTime("player","真言术：盾")==0 --单位没有 真言术：盾 BUFF
		then
			local currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed("player")
			if runSpeed/7<1.4 --单位移动速度<140%
			and BuffCount_TTZY==0 --天堂之羽BUFF不存在
			and BuffCount_SXHY==0 --身心合一BUFF不存在
			and WR_SpeedUp() --场景需要加速跑
			and IsPlayerSpell(64129) --已学[身心合一]天赋
			then
				if UnitIsUnit("focus","player") then
					if WR_ColorFrame_Show("CF7","盾速") then return true end
				end
				if WR_FocusUnit("player","盾速") then return true end --选择单位过程
			end
		end
	
		if Text=="脱战"
		and not UnitAffectingCombat("focus") --单位没有战斗
		and WR_GetUnitBuffTime("focus","真言术：盾")==0 --单位没有 真言术：盾 BUFF
		and IsSpellInRange("真言术：盾","focus")	--技能范围内
		then
			if WR_ColorFrame_Show("CF7","盾速") then return true end
		end

		if Text=="AOE"
		and ResistOutburstTime<=5 --防御AOE的时候
		and WR_GetUnitBuffTime("focus","真言术：盾")==0 --单位没有 真言术：盾 BUFF
		and IsSpellInRange("真言术：盾","focus")	--技能范围内
		then
			if WR_ColorFrame_Show("CF7","AOE盾") then return true end
		end
		
		if Text=="协助" then
			local Unit="player"
			if WR_GetUnitBuffTime(Unit,"真言术：盾")==0 --单位没有 真言术：盾 BUFF
			and WR_UnitAssistDebuff(Unit)	--单位需要协助
			then
				if UnitIsUnit("focus",Unit) then
					if WR_ColorFrame_Show("CF7","协盾"..Unit) then return true end
				end
				if WR_FocusUnit(Unit,"协盾") then return true end --选择单位过程
			end
			for i=1,4,1 do
				local Unit="party"..i
				if WR_GetUnitBuffTime(Unit,"真言术：盾")==0 --单位没有 真言术：盾 BUFF
				and IsSpellInRange("真言术：盾",Unit)	--技能范围内
				and WR_UnitAssistDebuff(Unit)	--单位需要协助
				then
					if UnitIsUnit("focus",Unit) then
						if WR_ColorFrame_Show("CF7","协盾"..Unit) then return true end
					end
					if WR_FocusUnit(Unit,"协盾") then return true end --选择单位过程
				end
			end
		end
	end
	return false
end

--纯净术
function WR_PriestHoly_CJS(Unit)
	if not UnitCanAttack("player",Unit)	--单位是友方
	and IsSpellInRange("纯净术",Unit)	--单位在技能范围内
	and WR_CanRemoveUnitDebuff(Unit)	--单位有可驱散Debuff
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("CF3","纯净"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"纯净") then return true end --选择单位过程
	end
	return false
end

--纯净术
function WR_PriestHoly_CJS_Function()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("纯净术") then return false end	--技能不可用
	
	if WRSet.SS_CJS==1 then	--智能
		if WR_PriestHoly_CJS("mouseover") then return true end
		if WR_PriestHoly_CJS("player") then return true end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)~="TANK" then
				if WR_PriestHoly_CJS("party"..i) then return true end
			end
		end
		for i=1,4,1 do
			if WR_PriestHoly_CJS("party"..i) then return true end
		end
	elseif WRSet.SS_CJS==2 then	--指向
		if WR_PriestHoly_CJS("mouseover") then return true end
	elseif WRSet.SS_CJS==3 then	--自己
		if WR_PriestHoly_CJS("player") then return true end
	end
	return false
end
	
--驱散魔法
function WR_PriestHoly_QSMF(Unit)
	if UnitCanAttack("player",Unit) --单位是敌方
	and IsSpellInRange("驱散魔法",Unit)	--单位在技能范围内
	and WR_GetUnitBuffType(Unit,"Magic") --单位身上有魔法效果
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("CSN","驱散"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"纯净") then return true end --选择单位过程
	end
	return false
end

--驱散魔法
function WR_PriestHoly_QSMF_Function()
	if GCD<ShiFaSuDu
	and FocusHP>0.5	--焦点血量>50%
	and WRSet.SS_QSMF==1 --驱散魔法开启
	and IsPlayerSpell(528) --已学天赋[驱散魔法]
	and PlayerInCombat --玩家在战斗
	then
		if WR_PriestHoly_QSMF("target") then return true end
		if WR_PriestHoly_QSMF("mouseover") then return true end
		for i=1,4,1 do
			if WR_PriestHoly_QSMF("party"..i.."target") then return true end
		end
	end
	return false
end

--群体复活
function WR_PriestHoly_QTFH()
	if GCD<ShiFaSuDu
	and not PlayerInCombat --玩家不在战斗中
	and FocusHP>=0.7 --目标血量比例
	and WR_ResurrectParty() --有可以复活的队友
	then
		if WR_ColorFrame_Show("CSI","群体复活") then return true end
	end
	return false
end

--心灵尖啸
function WR_PriestHoly_XLJX()
	if GCD<ShiFaSuDu
	and FocusHP>0.5	--焦点血量>50%
	and WRSet.SS_XLJX==1 --心灵尖啸 开启
	and WR_SpellUsable("心灵尖啸") --技能可用
	and WR_StunUnit(8,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("CSU","心灵尖啸") then return true end
	end
	return false
end

--能量灌注
function WR_PriestHoly_NLGZ()
	if CD_NLGZ<=GCD --技能冷却
	and PartyInCombat --队伍在战斗中
	and AvgDeathTime>15 --预计结束战斗时间
	and WRSet.SS_NLGZ~=5 --能量灌注 没禁用
	then
		local TempUnit = "party" .. WRSet.SS_NLGZ
		if WR_GetUnitRange(TempUnit)<=46 --单位距离
		and
		(
			PartyLostHP>0.7 --全队掉血比例
			or
			WR_GetUnitCrazyBuff(TempUnit) --单位身上有爆发BUFF
		)
		then
			if UnitIsUnit("focus",TempUnit) then
				if WR_ColorFrame_Show("CSM","灌注P"..WRSet.SS_NLGZ) then return true end
			end
			if WR_FocusUnit(TempUnit,"灌注") then return true end --选择单位过程
		end
	end
	return false
end

--治疗石
function WR_PriestHoly_ZLS()
	if WRSet.SS_ZLS~=5 --治疗石选项不是关闭的
	and PlayerHP < WRSet.SS_ZLS/10 --血量比例<治疗石设定值/10
	and WR_Use_ZLS()	--治疗石 可用
	and BuffCount_JSZH==0 --没有救赎之魂 BUFF
	and BuffCount_SHZH==0 --守护之魂Buff不存在
	then
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end
	
--治疗药水
function WR_PriestHoly_ZLYS()
	if WRSet.SS_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP < WRSet.SS_ZLYS/10
	--血量比例<治疗药水设定值/10
	and WR_Use_ZLYS()	--治疗药水 可用
	and BuffCount_JSZH==0 --没有救赎之魂 BUFF
	and BuffCount_SHZH==0 --守护之魂Buff不存在
	then
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--自我减伤
function WR_PriestHoly_JianShang()
	if BuffCount_JSZH==0 --没有救赎之魂 BUFF
	and UnitAffectingCombat("player")	--战斗中
	then
		--绝望祷言
		if WRSet.SS_JWDY~=5	--绝望祷言 没禁用
		and	BuffCount_SHZH==0 --守护之魂Buff不存在
		and 
		(
			MustDefenseTime<=5 --必须开启防御
			or
			PlayerHP<WRSet.SS_JWDY/10 --玩家血量比例<设定
		)
		and WR_SpellUsable("绝望祷言") --技能可用 资源可用
		and
		(
			SHZH_EndTime==nil --上一次 守护之魂 施法不存在
			or
			GetTime()-SHZH_EndTime>0.5 --距离上一次 守护之魂 放出时间>0.5
		)
		then
			JWDY_EndTime=GetTime()+GCD
			if WR_ColorFrame_Show("CSK","绝望祷言") then return true end
		end
		
		if WR_PriestHoly_ZYSM("P") then return true end	--真言术：命 自己
		if WR_PriestHoly_SYSJ("P") then return true end	--圣言术：静 自己
	
		--守护P
		if WRSet.SS_SHZH~=5	--守护之魂 没禁用
		and	BuffTime_JWDY==0 --绝望祷言 BUFF不存在
		and 
		(
			MustDefenseTime<=5 --必须开启防御
			or
			PlayerHP<WRSet.SS_SHZH/10 --焦点单位血量比例<设定
		)
		and WR_SpellUsable("守护之魂") --技能可用 资源可用
		and
		(
			JWDY_EndTime==nil --上一次 绝望祷言 施法不存在
			or
			GetTime()-JWDY_EndTime>0.5 --距离上一次 绝望祷言 放出时间>0.5
		)
		then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("CSO","守护P") then return true end
			end
			if WR_FocusUnit("player","守护") then return true end --选择单位过程
		end
	end
	return false
end

--停止施法
function WR_PriestHoly_StopCasting()
	if UnitCastingInfo("player")=="群体复活"
	and not WR_PartyIsDeath() --队伍没有人死亡
	then
		if WR_ColorFrame_Show("CSP","停止施法") then return true end
	end
	return false
end

--渐隐术
function WR_PriestHoly_JYS()
	if CD_JYS==0 --技能冷却
	and BuffCount_JSZH==0 --没有救赎之魂 BUFF
	and UnitAffectingCombat("player") --单位战斗中
	then
		if (WRSet.SS_JYS==1 or WRSet.SS_JYS==2) --渐隐术 智能 或 减伤
		and IsPlayerSpell(373446) --已学天赋[通透影像] 渐隐术减伤10%
		and
		(
			Resist --防御机制
			or
			WR_Mustheal("player") --玩家必须获得治愈
			or
			WR_GetRangeSpellTime(45,nil,"player")<=1.5 --有敌人对我施法
		)
		then
			if WR_ColorFrame_Show("CSL","渐隐减伤") then return true end
		end
		
		if (WRSet.SS_JYS==1 or WRSet.SS_JYS==3) --渐隐术 智能 或 脱困
		and IsPlayerSpell(108942) --已学天赋[幻隐] 渐隐术解除诱捕
		and WR_Unbind("player")	--单位有可以解除的状态
		then
			if WR_ColorFrame_Show("CSL","渐隐脱困") then return true end
		end
	end
	return false
end

--真言术：命
function WR_PriestHoly_ZYSM(Text)
	if GCD<ShiFaSuDu
	and IsPlayerSpell(373481) --已学 [真言术：命]
	and FocusInSpellRange --目标在法术范围内
	and BuffTime_JSZH==0 --救赎之魂Buff不存在
	and
	(
		(
			not IsPlayerSpell(440674) --没学 [奇迹复生]
			and
			WR_GetGCD(373481)<=GCD --技能冷却
			and
			FocusHP<0.35 --焦点血量
		)
		or
		(
			IsPlayerSpell(440674) --已学 [奇迹复生]
			and
			WR_GetGCD(440678)<=GCD --技能冷却
			and
			FocusHP<0.5 --焦点血量
		)
	)
	then
		if Text==nil
		or
		(
			Text=="P"
			and UnitGUID("focus")==UnitGUID("player") --焦点是自己
		)
		then
			if WR_ColorFrame_Show("CF1","命" .. (Text or "")) then return true end
		end
	end
	return false
end

--预兆
function WR_PriestHoly_YZ()
	if IsPlayerSpell(428924) --已学 [预兆]
	and zhandoumoshi==1	--爆发开启
	and WR_GetGCD(428924)<=GCD --技能冷却
	and FocusInSpellRange --目标在法术范围内
	and BuffTime_JSZH==0 --救赎之魂Buff不存在
	and WR_GetUnitBuffTime("player","洞察预兆")==0	--洞察预兆 不存在
	and WR_GetUnitBuffTime("player","虔诚预兆")==0	--虔诚预兆 不存在
	and WR_GetUnitBuffTime("player","慰藉预兆")==0	--慰藉预兆 不存在
	then
		if WR_ColorFrame_Show("CF10","预兆") then return true end
	end
	return false
end

--守护之魂 施法条件
function WR_PriestHoly_SHZH()
	if WRSet.SS_SHZH~=5	--守护之魂 没禁用
	and CD_SHZH==0 --技能冷却
	and AvgDeathTime>5 --战斗结束时间
	and UnitAffectingCombat("focus") --单位战斗中
	and UnitIsFriend("player","focus") --单位是友方
	and not UnitIsDead("focus") --单位存活
	and IsSpellInRange("守护之魂","focus") --单位在技能范围内
	and FocusHP<WRSet.SS_SHZH/10 --焦点单位血量比例<设定
	and UnitIsPlayer("focus") --焦点是玩家
	and not WR_SpellUsable(373481) --真言术：命 不可用
	and
	(
		GetInspectSpecialization("focus")~=250 --非血DK
		or
		(
			GetInspectSpecialization("focus")==250 --血DK
			and
			UnitPower("focus",6)<40 --符文能量<40
		)
	)
	then
		if WR_ColorFrame_Show("CSH","守护之魂") then return true end
	end
	return false
end

--圣言术：灵 施法条件
function WR_PriestHoly_SYSL()
	local SYSL_Sum=0
	if PlayerLostHealth>SYSL_Health then
		SYSL_Sum=SYSL_Sum+SYSL_Health
	else
		SYSL_Sum=SYSL_Sum+PlayerLostHealth
	end
	for i=1,4,1 do
		if PartyLostHealth[i]>SYSL_Sum then
			SYSL_Sum=SYSL_Sum+SYSL_Health
		else
			SYSL_Sum=SYSL_Sum+PartyLostHealth[i]
		end
	end
	
	if GCD<ShiFaSuDu
	and WR_SpellUsable("圣言术：灵") --技能可用
	and PlayerInCombat --玩家在战斗中
	and BuffTime_GMSY<=GCD --共鸣圣言 BUFF不存在(圣言术后给的治疗效果增益)
	and SYSL_Sum>SYSL_Health*4 --圣言术：灵可以恢复最大血量>圣言术：灵*4
	and Resist --防御机制
	and WR_TargetInCombat("target") --单位可攻击
	and WR_GetUnitRange("target")<=10 --目标在法术范围内
	and
	(
		WR_GetSpellCharges("圣言术：静")==2 --圣言术：静 可用2次
--[[
		or
		(
			WR_AssemblyCombat() --集合型战斗
			and
			(
				WR_GetSpellNextCharge("圣言术：灵")<4 --技能充能剩余时间<4秒
				and
				WR_GetUnitBuffInfo("player","圣洁虔敬")>=1 --免费圣言术 存在
			)
		)
--]]
	)
	then
		if WR_ColorFrame_Show("CF4","灵") then return true end
	end
	return false
end

--快速治疗 施法条件
function WR_PriestHoly_KSZL()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("快速治疗") --技能可用 资源可用
	and FocusInSpellRange --目标在法术范围内
	and BuffCount_ZGZ<2 --织光者Buff层数<2，织光者会加强治疗术(+30%施法速度,+15%治疗量)，应该优先治疗术而不是快速治疗
	and
	(
		(
			RaidOrParty=="raid"
			and
			WR_PriestHoly_FocusHealth(KSZL_Health*0.8) --焦点治疗 施法条件
		)
		or
		(
			RaidOrParty~="raid"
			and
			WR_PriestHoly_FocusHealth(KSZL_Health*1.3) --焦点治疗 施法条件
		)
	)
	and
	(
		WR_GetSpellCharges("圣言术：静")<=1 --圣言术：静 次数<=1
		or
		not PlayerInCombat --没有进战斗
	)
	then
		if
		(
			Text=="涌动2层"
			and BuffCount_SGYD>=2 --圣光涌动 BUFF层数>=2(瞬发快速治疗)
		)
		or
		(
			Text=="涌动1层"
			and BuffTime_SGYD>0 --圣光涌动 BUFF存在(瞬发快速治疗)
		)
		or
		(
			Text==nil
			--and RaidOrParty~="raid" --不在团队
			and not PlayerMove --自身不在移动或者空中
			and not WR_StopCast(WR_GetTrueCastTime("快速治疗")) --避免施法被沉默的情况
		)
		then
			if WR_ColorFrame_Show("CF5",(Text or "快速治疗")) then return true end
		end
	end
	return false
end

--圣言术：静
function WR_PriestHoly_SYSJ(Text)
	if GCD<ShiFaSuDu
	and WR_SpellUsable("圣言术：静") --技能可用 资源可用
	and FocusInSpellRange --目标在法术范围内
	and UnitAffectingCombat("player") --单位战斗中
	and WR_PriestHoly_FocusHealth(SYSJ_Health) --焦点治疗 施法条件
	then
		if
		(
			Text=="P"
			and UnitGUID("focus")==UnitGUID("player") --焦点是自己
			and FocusHP<0.35 --焦点血量 < 35%
		)
		or
		(
			Text=="35%"
			and FocusHP<0.35 --焦点血量 < 35%
		)
		or
		(
			Text=="暴击"
			and FocusLostHealth > SYSJ_Health * 2
			and
			(
				WR_GetSpellNextCharge("圣言术：静")<=30	--圣言术：静 恢复次数时间<=30秒
				or
				FocusHP<0.50 --焦点血量 < 50%
				or
				WR_RangeCountPR(46,0.80)>=4	--技能范围内血量低于80%的友方数量>=4
				or
				WR_RangeCountPR(46,0.70)>=3	--技能范围内血量低于70%的友方数量>=3
				or
				WR_RangeCountPR(46,0.60)>=2	--技能范围内血量低于60%的友方数量>=2
				--or
				--PlayerMove --自身在移动
			)
		)
		or
		(
			Text=="满层"
			and WR_GetSpellNextCharge("圣言术：静")<=10	--圣言术：静 恢复次数时间<=10秒
		)
		then
			if WR_ColorFrame_Show("CF2","静" .. (Text or "F")) then return true end
		end
	end
	return false
end

--快速治疗 [防护圣光] 施法条件
function WR_PriestHoly_KSZL_FHSG()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("快速治疗") --技能可用 资源可用
	and IsPlayerSpell(193063) --已学习 防护圣光
	and WR_GetUnitBuffInfo("player","防护圣光")==0 --BUFF 不存在
	and BuffCount_JSZH==0 --没有救赎之魂 BUFF
	and
	(
		ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
		or
		MustDefenseTime<=5 --必须开启防御
	)
	and
	(
		BuffTime_SGYD>0 --圣光涌动(瞬发快速治疗)
		or
		(
			RaidOrParty~="raid" --不在团队
			and
			not PlayerMove --自身不在移动或者空中
			and
			not WR_StopCast(WR_GetTrueCastTime("快速治疗")) --避免施法被沉默的情况
		)
	)
	then
		if UnitIsUnit("focus","player") then
			if WR_ColorFrame_Show("CF5","防护快疗") then return true end
		end
		if WR_FocusUnit("player","防护") then return true end --选择单位过程
	end
	return false
end

--治疗术 施法条件
function WR_PriestHoly_ZhiLiaoShu(Text)
	if GCD<ShiFaSuDu
	and IsPlayerSpell(2060) --已学习
	and WR_GetGCD("治疗术")<=GCD --技能冷却
	and FocusInSpellRange --目标在法术范围内
	and BuffCount_ZGZ>0 --织光者Buff存在(+30%施法速度,+15%治疗量)，只有织光者Buff存在的时候才用治疗术
	and
	(
		(
			RaidOrParty=="raid"
			and
			WR_PriestHoly_FocusHealth(ZLS_Health*0.75) --焦点治疗 施法条件
		)
		or
		(
			RaidOrParty~="raid"
			and
			WR_PriestHoly_FocusHealth(ZLS_Health*1.3) --焦点治疗 施法条件
		)
	)
	and
	(
		WR_GetSpellCharges("圣言术：静")<=1 --圣言术：静 次数<=1
		or
		not PlayerInCombat --没有进战斗
	)
	and not PlayerMove --自身不在移动或者空中
	and not WR_StopCast(WR_GetTrueCastTime("治疗术")) --避免施法被沉默的情况
	then
		if
		Text==nil
		or
		(
			Text=="2层"
			and BuffCount_ZGZ==2 --织光者Buff 2层
		)
		then
			if WR_ColorFrame_Show("CF6","治疗术"..(Text or "")) then return true end
		end
	end
	
	if GCD<ShiFaSuDu
	and IsPlayerSpell(2060) --已学习
	and WR_GetGCD("治疗术")<=GCD --技能冷却
	and FocusInSpellRange --目标在法术范围内
	and Text=="脱战"
	then
		
	end
	return false
end

--神圣化身
function WR_PriestHoly_SSHS()
	if IsPlayerSpell(200183) --已学习
	and WR_GetGCD("神圣化身")<=GCD --技能冷却
	and BuffTime_SSHS==0 --神圣化身 BUFF不存在
	and PlayerInCombat --玩家在战斗中
	and WR_GetSpellCharges("圣言术：静")==0 --圣言术：静 没有次数
	and WR_PriestHoly_FocusHealth(SYSJ_Health*1.3) --焦点治疗 施法条件 圣言术：静
	and
	(
		(
			WRSet.SS_SSHS~=3 --神圣化身 没禁用
			and
			zhandoumoshi==1 --开爆发
		)
		or
		(
			WRSet.SS_SSHS==1 --神圣化身 智能
			and
			(
				PlayerHP<0.4 --玩家血量比例<0.4
				or
				FocusHP<0.4 --焦点血量比例<0.4
				or
				PartyLostHP>0.6 --全队掉血比例
				or
				(
					ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
					and
					FocusLostHealth >= SYSJ_Health * 2 --焦点损失血量 >= 静治疗量*2
				)
			)
		)
	)
	then
		if WR_ColorFrame_Show("CSB","神圣化身") then return true end
	end
	return false
end

--光明之泉
function WR_PriestHoly_GMZQ()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("光明之泉") --技能可用 资源可用
	and zhandoumoshi==1 --爆发 开启
	and UnitAffectingCombat("player") --单位战斗中
	then
		if WR_ColorFrame_Show("CSG","光明之泉") then return true end
	end
	return false
end

--神圣新星 治疗 施法条件
function WR_PriestHoly_SSXX_Heal()
	local SSXX_Sum=0
	if PlayerLostHealth>SSXX_Health then
		SSXX_Sum=SSXX_Sum+SSXX_Health
	else
		SSXX_Sum=SSXX_Sum+PlayerLostHealth
	end
	for i=1,4,1 do
		if PartyLostHealth[i]>SSXX_Sum then
			SSXX_Sum=SSXX_Sum+SSXX_Health
		else
			SSXX_Sum=SSXX_Sum+PartyLostHealth[i]
		end
	end
	if GCD<ShiFaSuDu
	and WR_SpellUsable("神圣新星") --技能可用
	and BuffCount_KXQ==20 --狂想曲 层数==20
	and PlayerInCombat --玩家在战斗中
	and WR_TargetInCombat("target") --单位可攻击
	and WR_GetUnitRange("target")<=12 --目标在法术范围内
	and SSXX_Sum>SSXX_Health*4 --神圣新星可以恢复最大血量>神圣新星*4
	and Resist --防御机制
	then
		if WR_ColorFrame_Show("CSY","神圣新星") then return true end
	end
	return false
end

--治疗之环 施法条件
function WR_PriestHoly_ZLZH(Sum)
	if GCD<ShiFaSuDu
	and WR_SpellUsable("治疗之环") --技能可用 资源可用
	and BuffTime_JSZH==0 --救赎之魂Buff不存在
	and ZLZHCount>=Sum --治疗之环数量>=Sum
	and WR_GetSpellCharges("圣言术：灵")<=1 --技能次数
	and IsSpellInRange("治疗之环","focus") --焦点在技能范围内
	then
		if WR_ColorFrame_Show("CF8","治疗之环") then return true end
	end
	return false
end

--光晕 施法条件
function WR_PriestHoly_GY(Sum)
	if GCD<ShiFaSuDu
	and
	(
		WRSet.SS_GY==1	--光晕 智能
		or
		(
			WRSet.SS_GY==2	--光晕 爆发
			and
			zhandoumoshi==1	--爆发
		)
	)
	and IsPlayerSpell(120517) --已学习
	and WR_GetGCD("光晕")<=GCD --技能冷却
	and PlayerInCombat --玩家在战斗中
	and not PlayerMove --自身不在移动或者空中
	and not WR_StopCast(WR_GetTrueCastTime("光晕")) --避免施法被沉默的情况
	and
	(
		GYCount>=Sum --光晕数量>=Sum
		or
		WR_PreemptiveHealing("光晕") --AOE尖刺伤害结束后瞬间放出光晕
		or
		(
			UnitName("boss1")=="虫巢扭曲者欧维纳克斯"
			and
			UnitHealth("boss1")/UnitHealthMax("boss1")<0.85
		)
		or
		UnitCastingInfo("boss1")=="奇袭"
	)
	then
		if WR_ColorFrame_Show("SF12","光晕") then return true end
	end
	return false
end

--愈合祷言 施法条件
function WR_PriestHoly_YHDY()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(33076) --已学习
	and WR_GetGCD("愈合祷言")<=GCD --技能冷却
	and IsInInstance() --在副本
	then
		
		local Sum=4
		local ROP="party"
		if RaidOrParty=="raid" then
			Sum=20
			ROP="raid"
		end
		
		for i=1,Sum,1 do
			local TempUnit=ROP..i
			if UnitGroupRolesAssigned(TempUnit)=="TANK"	--队友是坦克
			and IsSpellInRange("愈合祷言",TempUnit)	--单位在技能范围内
			and WR_GetUnitBuffTime(TempUnit,"愈合祷言",true)<=3	--单位愈合祷言Buff剩余时间<=3秒
			then
				if UnitIsUnit("focus",TempUnit) then
					if WR_ColorFrame_Show("CF9","愈合祷言") then return true end
				end
				if WR_FocusUnit(TempUnit,"愈祷") then return true end --选择单位过程
			end
		end
		
		if FocusInSpellRange --焦点在法术范围内
		and FocusBuffTime_YHDY<=3 then --焦点愈合祷言Buff剩余时间<=3秒
			if WR_ColorFrame_Show("CF9","愈合祷言") then return true end
		end
		
		if WR_GetUnitBuffTime("player","愈合祷言",true)<=3 then	--单位愈合祷言Buff剩余时间<=3秒
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("CF9","愈合祷言") then return true end
			end
			if WR_FocusUnit("player","愈祷") then return true end --选择单位过程
		end
		for i=1,Sum,1 do
			local TempUnit=ROP..i
			if IsSpellInRange("愈合祷言",TempUnit)	--单位在技能范围内
			and WR_GetUnitBuffTime(TempUnit,"愈合祷言",true)<=3	--单位愈合祷言Buff剩余时间<=3秒
			then
				if UnitIsUnit("focus",TempUnit) then
					if WR_ColorFrame_Show("CF9","愈合祷言") then return true end
				end
				if WR_FocusUnit(TempUnit,"愈祷") then return true end --选择单位过程
			end
		end
	end
	return false
end

--真言术：韧
function WR_PriestHoly_ZYSR()
	if GCD<ShiFaSuDu
	and BuffCount_JSZH==0 --救赎之魂 BUFF 不存在
	and WR_PartyNotBuff("真言术：韧") --如果队友没有真言术：韧
	then
		if WR_ColorFrame_Show("SF11","韧") then return true end
	end
	return false
end

--恢复 施法条件
function WR_PriestHoly_HF()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(139) --已学习
	and WR_GetGCD("恢复")<=GCD --技能冷却
	and WR_GetUnitRange("focus")<=46 --单位距离
	and UnitIsFriend("player","focus") --单位是友方
	and WR_GetUnitBuffInfo("focus","恢复",true)==0 --焦点 恢复 BUFF不存在
	and RaidOrParty~="raid" --不在团队
	and FocusHP<=0.95 --焦点真实血量比例
	and
	(
		FocusMustheal --焦点必须受到治疗
		or
		WR_UnitAssistDebuff("focus")	--焦点需要协助
		or
		not PlayerInCombat --玩家不在战斗中
		or
		PlayerMove --自身移动中
	)
	then
		if WR_ColorFrame_Show("SF10","恢复") then return true end
	end
	
	local Unit="player"
	if WR_GetUnitBuffTime(Unit,"恢复")==0 --单位没有 恢复 BUFF
	and WR_UnitAssistDebuff(Unit)	--单位需要协助
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF10","协复"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"协复") then return true end --选择单位过程
	end
	for i=1,4,1 do
		local Unit="party"..i
		if WR_GetUnitBuffTime(Unit,"恢复")==0 --单位没有 恢复 BUFF
		and IsSpellInRange("恢复",Unit)	--技能范围内
		and WR_UnitAssistDebuff(Unit)	--单位需要协助
		then
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF10","协复"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"协复") then return true end --选择单位过程
		end
	end
	return false
end

--天堂之羽 施法条件
function WR_PriestHoly_TTZY()
	local currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed("player")
	if GCD<ShiFaSuDu
	and runSpeed/7<1.4 --单位移动速度<140%
	and BuffCount_TTZY==0 --天堂之羽BUFF不存在
	and BuffCount_SXHY==0 --身心合一BUFF不存在
	and IsPlayerSpell(121536) --已学习 天堂之羽
	and WR_GetGCD("天堂之羽")<=GCD --技能冷却
	and WR_SpeedUp() --场景需要加速跑
	then
		if WR_ColorFrame_Show("SF9","天堂之羽") then return true end
	end
	return false
end

--惩击 施法条件
function WR_PriestHoly_CJ()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(585) --已学习
	and WR_GetGCD("惩击")<=GCD --技能冷却
	and not PlayerMove --自身不在移动或者空中
	and not WR_StopCast(WR_GetTrueCastTime("惩击")) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("SF8","惩击") then return true end
	end
	return false
end

--神圣之火 施法条件
function WR_PriestHoly_SSZH()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(14914) --已学习
	and WR_GetGCD("神圣之火")<=GCD --技能冷却
	and IsSpellInRange("神圣之火","target") --技能范围之内
	and TargetInCombat --单位战斗中
	and
	(
		BuffTime_CQZY~=0 --苍穹之焰存在，瞬发神圣之火
		or
		(
			not PlayerMove --自身不在移动或者空中
			and
			not WR_StopCast(WR_GetTrueCastTime("神圣之火")) --避免施法被沉默的情况
		)
	)
	then
		if WR_ColorFrame_Show("SF7","神圣之火") then return true end
	end
	return false
end

--圣言术：罚 施法条件
function WR_PriestHoly_SYSF()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(88625) --已学习
	and WR_GetGCD("圣言术：罚")<=GCD+0.3 --技能冷却
	then
		if WR_ColorFrame_Show("SF3","圣言术：罚") then return true end
	end
	return false
end

--神圣新星 施法条件
function WR_PriestHoly_SSXX()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("神圣新星") --技能可用 资源可用
	and HUCountRange10>=4 --10码单位>=4
	then
		if WR_ColorFrame_Show("CSY","神圣新星") then return true end
	end
	return false
end

--暗言术：痛 施法条件
function WR_PriestHoly_AYST(Unit)
	if GCD<ShiFaSuDu
	and IsPlayerSpell(589) --已学习
	and WR_GetGCD("暗言术：痛")<=GCD --技能冷却
	and WR_GetUnitRange(Unit)<=46 --单位距离
	and WR_GetUnitDebuffInfo(Unit,"暗言术：痛",true)<=4.8 --单位没有暗言术：痛Debuff
	and WR_TargetInCombat(Unit) --单位可战斗
	and UnitHealth(Unit)/UnitHealthMax(Unit)<1 --单位血量不是100%
	then
		if WR_ColorFrame_Show("SF6","痛") then return true end
	end
	return false
end

--控心术 施法条件
function WR_PriestHoly_KXS()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(375901) --已学习
	and WR_GetGCD("控心术")<=GCD --技能冷却
	and not PlayerMove --自身不在移动或者空中
	and not WR_StopCast(WR_GetTrueCastTime("控心术")) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("SF5","痛") then return true end
	end
	return false
end

--暗言术：灭 施法条件
function WR_PriestHoly_AYSM(Unit)
	if GCD<ShiFaSuDu
	and IsPlayerSpell(32379) --已学习
	and WR_GetGCD("暗言术：灭")<=GCD --技能冷却
	and WR_GetUnitRange(Unit)<=46 --单位距离
	and UnitCanAttack("player",Unit) --单位是敌方
	and
	(
		UnitHealth(Unit)/UnitHealthMax(Unit)<0.2 --单位血量<20%
		or
		PlayerMove --玩家在移动
	)
	then
		if WR_ColorFrame_Show("SF4","灭") then return true end
	end
	return false
end