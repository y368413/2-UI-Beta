--戒律运行库
function WR_PriestDisCipline()
	if GetSpecialization()~=1 then	--如果不是戒律(1)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.JL_SFSD*0.05
		
		WR_PriestDisCipline_ErrorMessage() --战斗错误事件
		
		PlayerInCombat=UnitAffectingCombat("player") --玩家在战斗中
		PlayerMove=WR_PlayerMove()	--单位移动
		
		PlayerHP=1
		if UnitHealthMax("player")~=0 then
			PlayerHP=UnitHealth("player")/UnitHealthMax("player")
		end
		
		FocusHP=1
		if UnitHealthMax("focus")~=0 then
			FocusHP=UnitHealth("focus")/UnitHealthMax("focus")
		end
		
		GCD=WR_GetGCD("真言术：韧")	--获得公共冷却剩余时间或者当前施法剩余时间
		CD_NLGZ=WR_GetGCD("能量灌注")	--获得 能量灌注 冷却剩余时间
		CD_TKYZ=WR_GetGCD("痛苦压制")	--获得 痛苦压制 剩余时间
		CD_GY=WR_GetGCD("光晕")	--获得 光晕 剩余时间
		CD_KX=WR_GetGCD("苦修")	--获得 苦修 剩余时间
		CD_XKYL=WR_GetGCD("虚空幽灵")	--获得 虚空幽灵 剩余时间
		CD_ZYSD=WR_GetGCD("真言术：盾")	--获得 真言术：盾 剩余时间
		CD_AYSM=WR_GetGCD("暗言术：灭")	--获得 暗言术：灭 剩余时间
		CD_XLZB=WR_GetGCD("心灵震爆")	--获得 心灵震爆 剩余时间
		CD_XXGDYB=WR_GetGCD("吸血鬼的拥抱")	--获得 吸血鬼的拥抱 剩余时间
		CD_TTZY=WR_GetGCD("天堂之羽")	--获得 天堂之羽 剩余时间
		CD_CJS=WR_GetGCD("纯净术")	--获得 纯净术 剩余时间
		CD_JWDY=WR_GetGCD("绝望祷言")	--获得 绝望祷言 剩余时间
		CD_JYS=WR_GetGCD("渐隐术")	--获得 渐隐术 剩余时间
		CD_ZYSY=WR_GetGCD("真言术：耀")	--获得 真言术：耀 剩余时间
		BuffTime_HS,BuffCount_HS,BuffSum_HS=WR_GetUnitBuffInfo("player","喝水")	--获得喝水Buff信息
		BuffTime_JSYS,BuffCount_JSYS,BuffSum_JSYS=WR_GetUnitBuffInfo("player","进食饮水")	--获得进食饮水Buff信息
		AYMYBuffTime,AYMYBuff,_=WR_GetUnitBuffInfo("player","暗影盟约")	--获得暗影盟约BUFF的数量
		BuffTime_TTZY,BuffCount_TTZY,BuffSum_TTZY=WR_GetUnitBuffInfo("player","天堂之羽")	--获得 天堂之羽 Buff信息
		BuffTime_SXHY,BuffCount_SXHY,BuffSum_SXHY=WR_GetUnitBuffInfo("player","身心合一")	--获得 身心合一 Buff信息
		BuffTime_ZYSD,BuffCount_ZYSD,BuffSum_ZYSD=WR_GetUnitBuffInfo("player","真言术：盾")	--获得 真言术：盾 Buff信息
		BuffTime_FHSG,BuffCount_FHSG,BuffSum_FHSG=WR_GetUnitBuffInfo("player","防护圣光")	--获得 防护圣光 Buff信息
		BuffTime_QSGZ,BuffCount_QSGZ,BuffSum_QSGZ=WR_GetUnitBuffInfo("player","全神贯注")	--获得 全神贯注 Buff信息
		BuffTime_TKYZ,BuffCount_TKYZ,BuffSum_TKYZ=WR_GetUnitBuffInfo("player","痛苦压制")	--获得痛苦压制Buff信息
		BuffTime_SGYD,BuffCount_SGYD,BuffSum_SGYD=WR_GetUnitBuffInfo("player","圣光涌动")	--获得圣光涌动Buff信息
		--_,SYHG_Buff,_=WR_GetUnitBuffInfo("player","圣愿辉光")	--获得圣愿辉光BUFF的数量
		
		FocusBuffTime_TKYZ,_,_=WR_GetUnitBuffInfo("focus","痛苦压制")	--获得痛苦压制Buff信息
		FocusBuffTime_JS,_,_=WR_GetUnitBuffInfo("focus","救赎")	--获得救赎Buff信息
		FocusBuffTime_ZYSD,_,_=WR_GetUnitBuffInfo("focus","真言术：盾")	--获得真言术：盾Buff信息
		FocusBuffTime_HF,_,_=WR_GetUnitBuffInfo("focus","恢复")	--获得恢复Buff信息
		
		TargetDebuffTime_JHXE,TargetDebuffCount_JHXE,TargetDebuffSum_JHXE=WR_GetUnitDebuffInfo("target","净化邪恶",true)	--获得净化邪恶Debuff信息
		TargetDebuffTime_JPFQ,TargetDebuffCount_JPFQ,TargetDebuffSum_JPFQ=WR_GetUnitDebuffInfo("target","教派分歧",true)	--获得净化邪恶Debuff信息
		
		WR_GetPartyRange()	--获取队友距离,获得：TargetRange,FocusRange,PartyRange[i],RiadRange[i]
		WR_GetPartyLostHealth()	--获取队友真实的可恢复的血量，获得：PlayerLostHealth,TargetLostHealth,FocusLostHealth,PartyLostHealth[i],RiadLostHealth[i]
		
		TargetInCombat=WR_TargetInCombat("target")	--单位在与我们进行战斗
		
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
		
		TargetInSpellRange=IsSpellInRange("惩击", "target") --判断单位在指定技能范围内
		
		AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获取当前指定技能范围内单位预计死亡时间
		TDT=WR_GetUnitDeathTime("target")	--获取指定单位预计死亡时间
		
		Resist=false --初始化防御机制
		ResistSustained=WR_ResistSustained()	--持续型伤害
		ResistOutburstTime=WR_ResistOutburstTime()	--尖刺型伤害，施法时间剩余小于5秒
		MustDefenseTime=WR_MustDefenseTime()	--必须开启防御
		
		if ResistSustained or ResistOutburstTime<=5 or MustDefenseTime<=5 then
		--持续型伤害 或 尖刺型伤害，施法时间剩余小于5秒 或 必须开启防御 
			Resist=true
		end
		
		--BestHelpSpellName=WR_PriestDisCipline_BestHelpSpell()	--获得最佳治疗技能
		
		PlayerMustheal=WR_Mustheal("player")	--自己必须受到治疗
		FocusMustheal=WR_Mustheal("focus")--目标必须受到治疗
		
		InRaidOrParty=WR_GetInRaidOrParty()	--获取自身是在团队还是小队或者单人
		
		TargetInvincible=WR_Invincible("target")--获取目标是否无敌
		
		PartyInCombat=WR_PartyInCombat() --队伍在战斗中
		
		PartyLostHP=WR_PartyLostHP("纯净术")	--获得小队平均损失血量
		
		BuffCount_JS=WR_GetMyBuffCount("救赎")	--获取有救赎BUFF的队友的数量
		LifeParty46=WR_GetLifeParty(46) --获取40码范围内存活的队友数量
		NotJSPartyCount=LifeParty46-BuffCount_JS --获得没有救赎的队友数量
		
		ZYSYCharges=WR_GetSpellCharges("真言术：耀")	--获得真言术：耀可使用的次数
		KSZL_Health=WR_GetSpellValue("快速治疗","恢复","点生命值")
		--HMWUnit=WR_GetHealthMaxWeightUnit()	--获取最大权重值的队友单位
		QiangJiuYuZhi=WRSet.JL_QJYZ/10	--抢救阈值
		--HUCountRange40=WR_GetRangeHarmUnitCount(40)	--获得技能范围内敌对单位数量

	--[[
		BestHarmUnit=""
		if WRSet.JL_ZNMB==1 and TargetDebuffCount_JPFQ==0 and TDT<5 then
		--智能目标开启 并且 当前目标没有教派分歧 并且当前目标死亡时间<5
			BestHarmUnit=WR_PriestDisCipline_BestHarmUnit()	--获得最佳攻击单位
		end
	--]]
		KuXiuCastTime=WR_GetSpellValue("苦修","在","秒")
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if not UnitAffectingCombat("player") then	--不在战斗中
		for i=1,4,1 do 
			local TempUnit="party"..i
			if UnitExists(TempUnit)	--单位存在
			and UnitName(TempUnit)~=nil	--单位名称存在
			then
				if JL_NLGZ_menuItems[i].text~=UnitName(TempUnit) then	--如果列表指定选项文本不等于当前单位名称
					JL_NLGZ_UpdateMenuItemText(i, UnitName(TempUnit))	--给 能量灌注 下拉菜单更新文本
				end
			else
				if JL_NLGZ_menuItems[i].text~="" then	--如果列表指定选项文本不等于当前单位名称
					JL_NLGZ_UpdateMenuItemText(i, "")	--给 能量灌注 下拉菜单更新文本
				end
			end
		end
	end

	if WR_PriorityCheck() then return end	--优先检查
	if WR_FocusMaxWeightUnit() then return end	--焦点最高权重单位
	if WR_PriestDisCipline_StopCasting() then return end	--停止施法 群活的时候,没有队友阵亡
	if WR_PriestDisCipline_JYS() then return true end	--渐隐术
	
	if WRSet.JL_SP1>=3 then
		if WR_ShiPin(1,WRSet.JL_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.JL_SP2>=3 then
		if WR_ShiPin(2,WRSet.JL_SP2) then return true end	--饰品 自保/协助
	end

	if WR_PriestDisCipline_JianShang() then return true end	--自我减伤
	if WR_PriestDisCipline_ZLS() then return true end	--治疗石
	if WR_PriestDisCipline_ZLYS() then return true end	--治疗药水
	if WR_PriestDisCipline_NLGZ() then return true end	--能量灌注
	if WR_PriestDisCipline_QiangJiu() then return true end	--抢救
	if WR_PriestDisCipline_TKYZ() then return true end	--痛苦压制
	if WR_Function_ZNMB(40,WRSet.JL_ZNMB) then return true end	--智能目标

	if FocusHP>QiangJiuYuZhi then --单位血量比例>抢救阈值
		if WR_PriestDisCipline_CJS_Function() then return true end	--纯净术
		if WR_PriestDisCipline_QSMF_Function() then return true end	--驱散魔法
		if WR_PriestDisCipline_XLJX() then return true end	--心灵尖啸
	end

	if WRSet.JL_SP1<=2 then
		if WR_ShiPin(1,WRSet.JL_SP2) then return true end	--饰品 常驻/爆发
	end
	if WRSet.JL_SP2<=2 then
		if WR_ShiPin(2,WRSet.JL_SP2) then return true end	--饰品 常驻/爆发
	end
	
	if WR_PriestDisCipline_QSGZ() then return true end	--全神贯注
	if WR_PriestDisCipline_JiuShu() then return true end	--救赎
	if WR_PriestDisCipline_ZYSY("2层") then return true end	--真言术：耀 2层
	if WR_PriestDisCipline_KSZL_FHSG() then return true end	--快速治疗 防护圣光(自我减伤)
	if WR_PriestDisCipline_Run() then return true end	--加速跑

----伤害输出----------------------------------------------------------------------------------------------
	if GCD<ShiFaSuDu
	and TargetInCombat --目标在与我们进行战斗
	and TargetInSpellRange --目标在技能范围内
	then
		--净化邪恶
		if TargetDebuffTime_JHXE==0 --目标净化邪恶Debuff时间==0
		or
		(
			AYMYBuff==0 --暗影盟约不存在
			and
			TargetDebuffTime_JHXE<=6 --目标净化邪恶Debuff时间<=6
		)
		then
			if WR_ColorFrame_Show("SF6","净化邪恶") then return true end
		end
		
		--虚空幽灵
		if not PlayerMove --自身不在移动或者空中
		and zhandoumoshi==1	--开爆发
		and
		(
			CD_XKYL<=GCD+Latency --虚空幽灵CD冷却
			or
			(
				IsPlayerSpell(390770) --已学天赋[虚空召唤师]
				and
				(
					UnitCastingInfo("player")=="惩击" --施法惩击
					or
					UnitCastingInfo("player")=="心灵震爆" --施法心灵震爆
				)
				and
				CD_XKYL<=GCD+2+Latency --[虚空召唤师]惩击，心灵震爆减虚空幽灵2秒CD
				--虚空幽灵CD<=GCD+2+Latency
			)
		)
		then
			if WR_ColorFrame_Show("CSJ","虚空幽灵") then return true end
		end
		
		--心灵震爆
		if CD_XLZB<=GCD --技能冷却
		and not PlayerMove --自身不在移动或者空中
		and UnitCastingInfo("player")~="心灵震爆" --没有在施法
		and not WR_StopCast(WR_GetTrueCastTime("心灵震爆")) --避免施法被沉默的情况
		and
		(
			AYMYBuff>0 --暗影盟约存在
			or
			GCD+WR_GetTrueCastTime("心灵震爆")+24<CD_XKYL --心灵震爆可以在虚空幽灵的时候冷却
		)
		then
			if AYMYBuff>0 then --暗影盟约存在
				if WR_PriestDisCipline_ZYSY("爆发") then return true end	--真言术：耀 爆发
			end
			if WR_ColorFrame_Show("SF3","心灵震爆") then return true end
		end
		
		--苦修Target
		if not WR_StopCast(KuXiuCastTime) --避免施法被沉默的情况
		and
		(
			AYMYBuff>0 --暗影盟约存在
			or
			GCD+9<CD_XKYL --苦修可以在虚空幽灵的时候冷却
		)
		and
		(
			CD_KX<=GCD+Latency --苦修CD<=GCD+Latency
			or
			(
				IsPlayerSpell(390693) --已学天赋[训练有素]
				and
				(
					(
						UnitCastingInfo("player")=="惩击" --正在施法 惩击
						and
						CD_KX<=GCD+0.5+Latency --苦修CD<=GCD+0.5+Latency，[训练有素]惩击减0.5秒
					)
					or
					(
						UnitCastingInfo("player")=="快速治疗" --正在施法 快速治疗
						and
						CD_KX<=GCD+1+Latency --苦修CD<=GCD+1+Latency，[训练有素]快速治疗减1秒
					)
				)
			)
		)
		then
			if WR_ColorFrame_Show("SF7","苦修伤害") then return true end
		end
		
		--暗言术：灭
		if IsPlayerSpell(32379) --学习暗言术：灭天赋
		and CD_AYSM<=GCD --技能冷却
		and
		(
			AYMYBuff>0 --暗影盟约存在
			or
			(
				GCD+10<CD_XKYL --暗言术：灭可以在虚空幽灵的时候冷却
				and
				UnitHealth("target")/UnitHealthMax("target")<0.2	--目标血量<20%
			)
		)
		then
			if WR_ColorFrame_Show("SF4","灭") then return true end
		end
		
		--惩击
		if not PlayerMove --自身不在移动或者空中
		and not WR_StopCast(WR_GetTrueCastTime("惩击")) --避免施法被沉默的情况
		then
			if WR_ColorFrame_Show("SF8","惩击") then return true end
		end
		
	end
----伤害输出----------------------------------------------------------------------------------------------

	if PlayerMove	--自身在移动或者空中
	--and FocusBuffTime_JS<=GCD	--焦点没有救赎BUFF
	and UnitPower("player",0)/UnitPowerMax("player",0)>0.85	--法力值>85%
	then
		if WR_PriestDisCipline_ZYSD("focus") then return true end	--移动盾
		if WR_PriestDisCipline_HF() then return true end	--恢复
	end

	if not PlayerInCombat then --玩家不在战斗中
		if WR_PriestDisCipline_QTFH() then return true end	--群体复活
		if WR_PriestDisCipline_ZYSR() then return true end	--真言术：韧
		if WR_PriestDisCipline_KSZL("脱战") then return true end	--脱战快疗
		if WR_GetUnitHP("focus")<0.9 then	--焦点带护盾血量<90%
			if WR_PriestDisCipline_HF() then return true end	--恢复
		end
		if UnitGroupRolesAssigned("focus")=="TANK" then	--焦点是坦克
			if WR_PriestDisCipline_ZYSD("focus") then return true end	--脱战盾
		end
	end
------------------------------------------------------------------------------------------------

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end
end



--战斗错误事件
function WR_PriestDisCipline_ErrorMessage()
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

--停止施法
function WR_PriestDisCipline_StopCasting()
	if UnitCastingInfo("player")=="群体复活"
	and not WR_PartyIsDeath() --队伍没有人死亡
	then
		if WR_ColorFrame_Show("CSP","停止施法") then return true end
	end
	return false
end

--渐隐术
function WR_PriestDisCipline_JYS()
	if WRSet.JL_JYS==1 --渐隐术 开启
	and CD_JYS==0 --技能冷却
	and UnitAffectingCombat("player") --单位战斗中
	and
	(
		(
			IsPlayerSpell(373446) --已学天赋[通透影像] 渐隐术减伤10%
			and
			(
				Resist --防御机制
				or
				WR_Mustheal("player") --玩家必须获得治愈
				or
				WR_GetRangeSpellTime(45,nil,"player")<=1.5 --有敌人对我施法
			)
		)
		or
		(
			IsPlayerSpell(108942) --已学天赋[幻隐] 渐隐术解除诱捕
			and
			WR_Unbind("player")	--单位有可以解除的状态
		)
	)
	then
		if WR_ColorFrame_Show("CSL","渐隐术") then return true end
	end
	return false
end

--自我减伤
function WR_PriestDisCipline_JianShang()
	if not PlayerInCombat then return false end	--非战斗中
	
	if PlayerHP<0.35 then --玩家血量 < 35%
		--绝望祷言
		if WRSet.JL_JWDY==1 --绝望祷言开启
		and BuffCount_TKYZ==0 --痛苦压制Buff不存在
		and WR_SpellUsable("绝望祷言") --技能可用 资源可用
		then
			JWDY_EndTime=GetTime()+GCD
			if WR_ColorFrame_Show("CSK","绝望祷言") then return true end
		end
		
		--压制P
		if WRSet.JL_TKYZ==1 --痛苦压制开启
		and BuffCount_TKYZ==0 --痛苦压制Buff不存在
		and WR_GetUnitBuffInfo("player","绝望祷言")==0 --绝望祷言 BUFF不存在
		and WR_SpellUsable("痛苦压制") --技能可用 资源可用
		and
		(
			JWDY_EndTime==nil --上一次 绝望祷言 施法不存在
			or
			GetTime()-JWDY_EndTime>0.5 --距离上一次 绝望祷言 放出时间>0.5
		)
		then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("CSO","压制P") then return true end
			end
			if WR_FocusUnit("player","压制") then return true end --选择单位过程
		end
	end
	return false
end

--治疗石
function WR_PriestDisCipline_ZLS()
	if WRSet.JL_ZLS~=5 --治疗石选项不是关闭的
	and PlayerHP < WRSet.JL_ZLS/10 --血量比例<治疗石设定值/10
	and WR_Use_ZLS()	--治疗石 可用
	then
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--治疗药水
function WR_PriestDisCipline_ZLYS()
	if WRSet.JL_ZLYS~=5 --治疗药水选项不是关闭的
	and PlayerHP < WRSet.JL_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS()	--治疗药水 可用
	then
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--能量灌注
function WR_PriestDisCipline_NLGZ()
	if CD_NLGZ<=GCD --技能冷却
	and PartyInCombat --队伍在战斗中
	and AvgDeathTime>15 --预计结束战斗时间
	and WRSet.JL_NLGZ~=5 --能量灌注 没禁用
	then
		local TempUnit = "party" .. WRSet.JL_NLGZ
		if WR_GetUnitRange(TempUnit)<=46 --单位距离
		and WR_GetUnitCrazyBuff(TempUnit) --单位身上有爆发BUFF
		then
			if UnitIsUnit("focus",TempUnit) then
				if WR_ColorFrame_Show("CSM","灌注P"..WRSet.JL_NLGZ) then return true end
			end
			if WR_FocusUnit(TempUnit,"灌注") then return true end --选择单位过程
		end
	end
	return false
end

--痛苦压制
function WR_PriestDisCipline_TKYZ()
	if WRSet.JL_TKYZ~=5 --痛苦压制开启
	and CD_TKYZ==0 --技能冷却
	and AvgDeathTime>5 --战斗结束时间
	and UnitAffectingCombat("focus") --单位战斗中
	and IsSpellInRange("快速治疗","focus") --单位在技能范围内
	and not UnitIsDead("focus") --单位存活
	and FocusHP<WRSet.JL_TKYZ/10 --焦点单位血量比例<设定值
	and FocusBuffTime_TKYZ<=GCD --痛苦压制Buff不存在
	and UnitIsPlayer("focus") --焦点是玩家
	--and not WR_GetGCD(373481) --真言术：命 技能不可用
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
		if WR_ColorFrame_Show("CSO","压制F") then return true end
	end
	return false
end

--纯净术
function WR_PriestDisCipline_CJS(Unit)
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
function WR_PriestDisCipline_CJS_Function()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("纯净术") then return false end	--技能不可用
	
	if WRSet.JL_CJS==1 then	--智能
		if WR_PriestDisCipline_CJS("mouseover") then return true end
		if WR_PriestDisCipline_CJS("player") then return true end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)~="TANK" then
				if WR_PriestDisCipline_CJS("party"..i) then return true end
			end
		end
		for i=1,4,1 do
			if WR_PriestDisCipline_CJS("party"..i) then return true end
		end
	elseif WRSet.JL_CJS==2 then	--指向
		if WR_PriestDisCipline_CJS("mouseover") then return true end
	elseif WRSet.JL_CJS==3 then	--自己
		if WR_PriestDisCipline_CJS("player") then return true end
	end
	return false
end

--驱散魔法
function WR_PriestDisCipline_QSMF(Unit)
	if GCD<ShiFaSuDu
	and UnitCanAttack("player",Unit) --单位是敌方
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
function WR_PriestDisCipline_QSMF_Function()
	if GCD<ShiFaSuDu
	and FocusHP>0.5	--焦点血量>50%
	and WRSet.JL_QSMF==1 --驱散魔法开启
	and IsPlayerSpell(528) --已学天赋[驱散魔法]
	and PlayerInCombat --玩家在战斗
	then
		if WR_PriestDisCipline_QSMF("target") then return true end
		if WR_PriestDisCipline_QSMF("mouseover") then return true end
		for i=1,4,1 do
			if WR_PriestDisCipline_QSMF("party"..i.."target") then return true end
		end
	end
	return false
end

--群体复活
function WR_PriestDisCipline_QTFH()
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
function WR_PriestDisCipline_XLJX()
	if GCD<ShiFaSuDu
	and FocusHP>0.5	--焦点血量>50%
	and WRSet.JL_XLJX==1 --心灵尖啸 开启
	and WR_SpellUsable("心灵尖啸") --技能可用
	and WR_StunUnit(8,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("CSU","心灵尖啸") then return true end
	end
	return false
end

--真言术：命
function WR_PriestDisCipline_ZYSM()
	if GCD<ShiFaSuDu
	and IsPlayerSpell(373481) --已学 [真言术：命]
	and IsSpellInRange("快速治疗","focus")	--单位在技能范围内
	and not UnitIsDead("focus")--单位存活
	and
	(
		(
			not IsPlayerSpell(440674) --没学 [奇迹复生]
			and WR_GetGCD(373481)<=GCD --技能冷却
			and UnitHealth("focus")/UnitHealthMax("focus")<0.35 --焦点血量
		)
		or
		(
			IsPlayerSpell(440674) --已学 [奇迹复生]
			and WR_GetGCD(440678)<=GCD --技能冷却
			and UnitHealth("focus")/UnitHealthMax("focus")<0.5 --焦点血量
		)
	)
	then
		if WR_ColorFrame_Show("CF1","命F") then return true end
	end
	return false
end

--苦修Focus
function WR_PriestDisCipline_KuXiu_Focus()
	if GCD<ShiFaSuDu
	and CD_KX<=GCD --技能冷却
	and IsSpellInRange("快速治疗","focus") --单位在技能范围内
	and not UnitIsDead("focus")--单位存活
	and not WR_StopCast(KuXiuCastTime) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("CF2","苦修F") then return true end
	end
	return false
end

--快速治疗
function WR_PriestDisCipline_KSZL(Text)
	if GCD<ShiFaSuDu
	and IsSpellInRange("快速治疗","focus") --单位在技能范围内
	and not UnitIsDead("focus")--单位存活
	then
		if Text=="抢救"
		and BuffCount_SGYD>=1 --圣光涌动>=1层(瞬发)
		then
			if WR_ColorFrame_Show("CF5","抢救快疗") then return true end
		end
		
		if Text=="救赎"
		and BuffCount_SGYD>=1 --圣光涌动>=1层(瞬发)
		then
			if WR_ColorFrame_Show("CF5","救赎快疗") then return true end
		end
		
		if Text=="脱战"
		and
		FocusHP<0.9	--焦点血量<90%
		and
		(
			BuffCount_SGYD>=1 --圣光涌动>=1层(瞬发)
			or
			(
				not PlayerMove --自身不在移动或者空中
				and
				not WR_StopCast(WR_GetTrueCastTime("快速治疗")) --避免施法被沉默的情况
			)
		)
		then
			if WR_ColorFrame_Show("CF5","脱战快疗") then return true end
		end
	end
	return false
end

--真言术盾
function WR_PriestDisCipline_ZYSD(Unit)
	if GCD<ShiFaSuDu
	and CD_ZYSD<=GCD --技能冷却
	and IsSpellInRange("快速治疗",Unit) --单位在技能范围内
	and not UnitIsDead(Unit)--单位存活
	and WR_GetUnitBuffInfo(Unit,"真言术：盾")<=GCD --目标身上没有真言术盾Buff
	then
		if WR_ColorFrame_Show("CF7","真言术盾") then return true end
	end
	return false
end

--全神贯注
function WR_PriestDisCipline_QSGZ()
	if BuffTime_QSGZ>GCD then
		if WR_PriestDisCipline_ZYSD("focus") then return true end	--真言术盾
		if WR_PriestDisCipline_ZYSD("player") then return true end	--真言术盾
		for i=1,4,1 do
			if WR_PriestDisCipline_ZYSD("party"..i) then return true end	--真言术盾
		end
	end
	return false
end

--恢复
function WR_PriestDisCipline_HF()
	if GCD<ShiFaSuDu
	and IsSpellInRange("快速治疗","focus") --单位在技能范围内
	and not UnitIsDead("focus")--单位存活
	and FocusBuffTime_HF<=GCD --目标身上没有恢复Buff
	then
		if WR_ColorFrame_Show("SF10","恢复") then return true end
	end
	return false
end

--真言术：耀
function WR_PriestDisCipline_ZYSY(Text)
	if GCD<ShiFaSuDu
	and UnitCastingInfo("player")~="真言术：耀" --没有在施法真言术：耀
	and CD_ZYSY<=GCD --技能冷却
	and IsSpellInRange("快速治疗","focus") --单位在技能范围内
	and not UnitIsDead("focus")--单位存活
	and
	(
		not WR_StopCast(WR_GetTrueCastTime("真言术：耀")) --避免施法被沉默的情况
		and
		not PlayerMove --自身不在移动或者空中
	)
	then
	
			if Text=="救赎"
			and
			(
				WR_RangeCountPR(46,0.95)>=4	--46码内血量低于95%的人数>=4个
				or
				WR_RangeCountPR(46,0.90)>=3 	--46码内血量低于90%的人数>=3个
				or
				WR_RangeCountPR(46,0.85)>=2 	--46码内血量低于85%的人数>=2个
			)
			and
			(
				(
					InRaidOrParty=="party"
					and
					NotJSPartyCount>=2 --没有救赎的队友数量>=2
				)
				or
				(
					InRaidOrParty=="raid"
					and
					BuffCount_JS<5 --队伍救赎数量<5
				)
			)
			then
				if WR_ColorFrame_Show("CF4","救赎耀") then return true end
			end
			
			if Text=="预铺"
			and NotJSPartyCount>=1 --没有救赎的队友数量>=1
			and WR_PreemptiveHealing("真言术：耀") then --AOE尖刺伤害结束后瞬间放出耀
				if WR_ColorFrame_Show("CF4","预铺耀") then return true end
			end
			
			if Text=="盟约"
			and AYMYBuff>0 --暗影盟约存在
			and WR_GetUnitBuffInfo("focus","救赎")<=GCD+KuXiuCastTime	--单位救赎时间<=苦修施法时间
			then
				if WR_ColorFrame_Show("CF4","爆发耀") then return true end
			end
			
			if Text=="爆发"
			and NotJSPartyCount>=1 --没有救赎的队友数量>=1
			then
				if WR_ColorFrame_Show("CF4","爆发耀") then return true end
			end
			
			if Text=="2层"
			and
			WR_GetSpellCharges("真言术：耀")==2	--耀有两次使用次数
			and
			(
				WR_RangeCountPR(46,0.85)>=4	--46码内血量低于85%的人数>=4个
				or
				WR_RangeCountPR(46,0.80)>=3 	--46码内血量低于80%的人数>=3个
				or
				WR_RangeCountPR(46,0.75)>=2 	--46码内血量低于75%的人数>=2个
				or
				WR_PreemptiveHealing("真言术：耀") --AOE尖刺伤害结束后瞬间放出耀
			)
			then
				if WR_ColorFrame_Show("CF4","2层耀") then return true end
			end
			
	end
	return false
end

--救赎
function WR_PriestDisCipline_JiuShu()
	if WR_PriestDisCipline_ZYSY("预铺") then return true end	--真言术：耀
	if WR_PriestDisCipline_ZYSY("盟约") then return true end	--真言术：耀 暗影盟约
	
	if WR_GetUnitBuffInfo("focus","救赎")<=GCD+KuXiuCastTime	--单位救赎时间<=苦修施法时间
	and UnitCastingInfo("player")~="真言术：耀"	--没有在施法真言术：耀
	--and FocusLostHealth>KSZL_Health*1.3	--目标损失血量>快速治疗*1.3
	and WR_GetUnitHP("focus")<=0.85
	then
		if WR_PriestDisCipline_ZYSM() then return true end	--真言术命
		if WR_PriestDisCipline_ZYSY("救赎") then return true end	--真言术：耀
		
		if WR_PriestDisCipline_ZYSD("focus") then return true end	--真言术盾
		if WR_PriestDisCipline_KSZL("救赎") then return true end	--快速治疗
		if WR_PriestDisCipline_HF() then return true end	--恢复
	end
	return false
end

--抢救
function WR_PriestDisCipline_QiangJiu()
	if WR_PriestDisCipline_ZYSM() then return true end	--真言术命
	
	if FocusHP<=QiangJiuYuZhi --焦点血量比例<=抢救阈值
	--and FocusBuffTime_TKYZ<=GCD	--焦点没有痛苦压制BUFF
	then
		--if WR_PriestDisCipline_KuXiu_Focus() then return true end	--苦修
		if WR_PriestDisCipline_KSZL("抢救") then return true end	--快速治疗
	end
	return false
end

--快速治疗 [防护圣光] 施法条件
function WR_PriestDisCipline_KSZL_FHSG()
	if GCD<ShiFaSuDu
	and WR_SpellUsable("快速治疗") --技能可用 资源可用
	and IsPlayerSpell(193063) --已学习 防护圣光
	and WR_GetUnitBuffInfo("player","防护圣光")==0 --BUFF 不存在
	and UnitCastingInfo("player")~="快速治疗"	--当前没有施放快速治疗
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

--加速跑
function WR_PriestDisCipline_Run()
	if GCD<ShiFaSuDu
	and PlayerInCombat --玩家在战斗中
	then
		local currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed("player")
		if runSpeed/7<1.4 --单位移动速度<140%
		and BuffTime_TTZY<=GCD --天堂之羽BUFF不存在
		and BuffTime_SXHY==0 --身心合一BUFF不存在
		and WR_SpeedUp() --场景需要加速跑
		then
			if IsPlayerSpell(64129) --已学[身心合一]天赋
			and WR_GetGCD("真言术：盾")<=GCD --技能冷却
			and WR_GetUnitBuffTime("player","真言术：盾")==0 --单位没有 真言术：盾 BUFF
			then
				if UnitIsUnit("focus","player") then
					if WR_ColorFrame_Show("CF7","盾速") then return true end
				end
				if WR_FocusUnit("player","盾速") then return true end --选择单位过程
			end
			
			if IsPlayerSpell(121536) --已学习 天堂之羽
			and WR_GetGCD("天堂之羽")<=GCD --技能冷却
			then
				if WR_ColorFrame_Show("SF9","天堂之羽") then return true end
			end
		end
	end
	return false
end

--真言术：韧
function WR_PriestDisCipline_ZYSR()
	if GCD<ShiFaSuDu
	and WR_PartyNotBuff("真言术：韧") --如果队友没有真言术：韧
	then
		if WR_ColorFrame_Show("SF11","韧") then return true end
	end
	return false
end