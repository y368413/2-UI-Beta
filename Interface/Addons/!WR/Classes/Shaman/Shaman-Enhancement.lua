--增强萨运行库
--默认必点天赋:[熔火突袭][暴怒漩涡][溢流漩涡][元素之灵][升腾][始源之潮][托里姆的祈咒]
--默认不点天赋:[碎裂元素][霜巫的传承]
function WR_ShamanEnhancement()
	if GetSpecialization()~=2 then	--如果不是增强(2)专精，则不执行该运行库
		return
	end

	WR_DebugTime(0)
	ShiFaSuDu=0.05+WRSet.ZQ_SFSD*0.05
	AoeRange=10	--初始化AOE范围
	GCD=WR_GetGCD("闪电之盾")	--获得当前公共CD剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)
	PlayerHP = UnitHealth("player")/UnitHealthMax("player")
	PlayerMove=WR_PlayerMove()	--获得自身是否在移动或者空中
	
	TargetInCombat=WR_TargetInCombat("target")	--目标正在战斗
	TargetRange=WR_GetUnitRange("target")	--目标距离
	TargetClose =  TargetRange<=2 or C_Spell.IsSpellInRange("熔岩猛击","target") or C_Spell.IsSpellInRange("霜刃打击","target")	--获得目标是否在近战范围内
	TargetInRange40 = C_Spell.IsSpellInRange("烈焰震击","target") or C_Spell.IsSpellInRange("闪电链","target")	--获得目标是否在远程范围内

	BuffCount_XWWQ = WR_GetUnitBuffCount("player","漩涡武器")	--每层增加法术伤害0.25倍伤害
	
	WR_ShamanEnhancement_LastSpellTime()	--获得上一次使用技能的时间

	WR_DebugTime(1)
	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.ZQ_ZNJD) then return end	--智能焦点
	
	if WRSet.ZQ_SP1>=3 then
		if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.ZQ_SP2>=3 then
		if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Shaman_ZLS() then return end	--治疗石
	
	if WR_Shaman_ZLYS() then return end	--治疗药水
	
	if WR_Shaman_XJZY() then return end	--星界转移
	
	if WR_ShamanEnhancement_XZZY() then return end	--先祖指引
	
	if WR_ShamanEnhancement_ZLZQTT() then return end	--治疗之泉图腾

	if WR_ShamanEnhancement_ZLZY() then return end	--治疗之涌

	if WR_ShamanEnhancement_YHB() then return end	--幽魂步

	if WR_Shaman_Function_FJ() then return end	--风剪
	WR_DebugTime(2)
	if WR_ShamanEnhancement_FNWQ() then return end	--风怒武器
	
	if WR_ShamanEnhancement_HSWQ() then return end	--火舌武器
	
	if WR_Shaman_TN() then return end	--天怒

	if WR_ShamanEnhancement_SDZD() then return end	--闪电之盾

	if WR_ShamanEnhancement_DDZD() then return end	--大地之盾

	if WR_ShamanEnhancement_LTFB() then return end	--雷霆风暴
	
	if WR_Shaman_Function_QDTT() then return end	--清毒图腾
	
	if WR_Shaman_Function_JHLH() then return end	--净化灵魂
	
	if WR_ShamanEnhancement_ZLTT() then return end	--战栗图腾
	
	if WR_Shaman_Function_JHS() then return end	--净化术

	--if WR_ShamanEnhancement_Function_FQ("祈咒") then return end	--风切 祈咒
	
	if WR_ShamanEnhancement_TYS() then return true end	--土元素

	TargetDebuffTime_LYZJ=WR_GetUnitDebuffTime("target","烈焰震击",true)	--目标烈焰震击时间
	SYZC_BuffTime = WR_GetUnitBuffTime("player","始源之潮")	--闪电箭会额外击中所有中烈焰震击的目标1.5倍的伤害
	YXLH_BuffTime,YXLH_BuffCount,_=WR_GetUnitBuffInfo("player","野性狼魂")	--野性狼魂 BUFF
	_,KFNH_BuffCount,_=WR_GetUnitBuffInfo("player","狂风怒号")	--狂风怒号 BUFF
	_,HBDF_BuffCount,HBDF_BuffSum=WR_GetUnitBuffInfo("player","寒冰刀锋")	--寒冰刀锋 BUFF
	_,RYWQ_BuffCount,RYWQ_BuffSum=WR_GetUnitBuffInfo("player","熔岩武器")	--熔岩武器 BUFF
	HMZF_BuffTime = WR_GetUnitBuffTime("player",466772)	--毁灭之风 BUFF时间
	
	BuffTime_ST=WR_GetUnitBuffTime("player","升腾")

	WolfSum = WR_GetUnitBuffSum("player",224125)+WR_GetUnitBuffSum("player",224126)+WR_GetUnitBuffSum("player",224127)	--获得狼魂数量
	
	HUCountRangeAOE=WR_GetRangeHarmUnitCount(AoeRange,not WR_InTraining())	--获得AOE范围内敌人数量
	LYZJCountRangeAOE=WR_GetHaveDebuffRangeUnitCount(AoeRange,"烈焰震击",false)	--获得AOE范围内内中了烈焰震击的敌人数量

	BeatUnit_YLZ = WR_ShamanEnhancement_GetBeatUnit_YLZ()	--获得引雷针最佳单位
	BeatUnit_LYZJ = WR_ShamanEnhancement_GetBeatUnit_LYZJ()	--获得烈焰震击最佳单位
	BeatUnit_RYMJ = WR_ShamanEnhancement_GetBeatUnit_RYMJ()	--获得熔岩猛击最佳单位

	if TargetClose and TargetInCombat then	--目标在近战 并且 目标战斗中
		if WRSet.ZQ_SP1==1 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.ZQ_SP2==1 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 常驻
		end
	end
	
	if TargetInCombat	--目标在战斗
	and GCD<=ShiFaSuDu
	then
		Totem_YD_Time=0	--涌动图腾剩余时间
		for i=1,40,1
		do
			local _, totemName, startTime, duration, _= GetTotemInfo(i)
			if totemName=="涌动图腾" then
				Totem_YD_Time=startTime+duration-GetTime()
				if Totem_YD_Time<0 then Totem_YD_Time=0 end
			end 
		end
		BuffCount_TTFT=WR_GetUnitBuffCount("player","图腾反弹")	--图腾反弹 BUFF层数
		BuffTime_SWDCC=WR_GetUnitBuffTime("player","霜巫的传承")
		BuffSum_DDWQ=WR_GetUnitBuffSum("player","大地武器")
		BuffTime_FXZT=WR_GetUnitBuffTime("player","飞旋之土")
		BuffTime_FXZQ=WR_GetUnitBuffTime("player","飞旋之气")
		BuffTime_SRDJ=WR_GetUnitBuffTime("player","霜刃打击")
		if IsPlayerSpell(444995) then --已学 [涌动图腾]
			if WR_ShamanEnhancement_Combat_Single_TTJS() then return end	--单体战斗 图腾祭司
			if WR_ShamanEnhancement_Combat_AOE_TTJS() then return end	--AOE战斗 图腾祭司
		else
			if WR_ShamanEnhancement_Combat_Single() then return end	--单体战斗
			if WR_ShamanEnhancement_Combat_AOE() then return end	--AOE战斗
		end
	end
	
	if WR_Function_ZNMB(2,WRSet.ZQ_ZNMB) then return true end	--智能目标
	
	if WR_Function_ZNMB(10,WRSet.ZQ_ZNMB) then return true end	--智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end

end

--单体战斗 图腾祭司
function WR_ShamanEnhancement_Combat_Single_TTJS()
	if HUCountRangeAOE>1 and not WR_SingleUnit() then return false end	--范围内单位数量>1 并且 不是单体
	
	--涌动S1
	if WRSet.ZQ_YDTT==1	--涌动图腾 开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("涌动图腾")	--技能 可用
	then
		if WR_ColorFrame_Show("CF6","涌动S1") then return true end
	end
	
	--升腾S1
	if zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=AoeRange --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and LastSpell~="闪电链"	--最后一次用的不是闪电链
	and Totem_YD_Time>4	--涌动图腾剩余时间>4秒
	and
	(
		BuffCount_TTFT>=3	--图腾反弹 BUFF>=3层
		or
		BuffCount_XWWQ>0	--漩涡武器 BUFF层数>0
	)
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾S1") then return true end
	end
	
	--毁风S1
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and not IsPlayerSpell(262624)	--没学 元素之灵
	and BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
	then
		if WR_ColorFrame_Show("CSO","毁风S1") then return true end
	end
	
	--裂地S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	and BuffTime_ST>GCD	--升腾 BUFF存在
	and Totem_YD_Time>GCD	--涌动图腾 存在
	and IsPlayerSpell(455590)	--已学 大地奔涌
	and BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
	and BuffCount_TTFT>=5	--图腾反弹 BUFF>=5层
	and BuffSum_DDWQ>=2	--大地武器 BUFF数量>=2
	then
		if WR_ColorFrame_Show("CSJ","裂地S1") then return true end
	end

	--风切S1
	if TargetRange<=30	--单位在30码内
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	and IsPlayerSpell(384444)	--已学 托里姆的祈咒
	and BuffCount_XWWQ>0	--漩涡武器.层数>0
	and LastSpell~="闪电链"	--最后一次用的不是闪电链
	and not IsPlayerSpell(262624)	--没学 元素之灵
	then
		if WR_ColorFrame_Show("CSF7","风切S1") then return true end
	end

	--裂地S2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	and BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
	and
	(
		WR_GetGCD("升腾")>=10	--升腾 技能冷却时间>=10秒
		or
		zhandoumoshi~=1	--爆发 关闭
	)
	and Totem_YD_Time>GCD	--涌动图腾 存在
	and BuffCount_TTFT>=3	--图腾反弹 BUFF>=3层
	and BuffTime_ST<=GCD	--升腾 BUFF不存在
	then
		if WR_ColorFrame_Show("CSJ","裂地S2") then return true end
	end
	
	--流电S1
	if TargetInRange40	--单位在40码内
	and WR_GetUnitBuffTime("player","流电炽焰")>GCD
	and WR_SpellUsable("流电炽焰")
	and BuffTime_FXZT>GCD	--飞旋之土 BUFF存在
	then
		if WR_ColorFrame_Show("CF2","流电S1") then return true end
	end
	
	--电箭S1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and IsPlayerSpell(114051)	--已学 升腾
	and
	(
		BuffCount_XWWQ>=10	--漩涡武器.层数>=10
		or
		(
			BuffCount_XWWQ>=5	--漩涡武器.层数>=5
			and
			BuffTime_FXZQ>GCD	--飞旋之气 BUFF存在
			and
			BuffTime_SWDCC<=GCD	--霜巫的传承 BUFF不存在
		)
	)
	then
		if WR_ColorFrame_Show("CF4","电箭S1") then return true end
	end
	
	--风打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("风暴打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSF7","风打S1") then return true end
	end
	
	--毁闪S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	and IsPlayerSpell(470490)	--已学 无情风暴
	then
		if WR_ColorFrame_Show("CF9","毁闪S1") then return true end
	end

	--电箭S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and BuffCount_XWWQ>=5	--漩涡武器.层数>=5
	and IsPlayerSpell(114051)	--已学 升腾
	then
		if WR_ColorFrame_Show("CF4","电箭S2") then return true end
	end
	
	--霜打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("霜刃打击")	--技能 可用
	and BuffTime_SRDJ<=GCD	--霜刃打击 BUFF不存在
	then
		if WR_ColorFrame_Show("CSL","霜打S1") then return true end
	end
	
	--火打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("熔岩猛击")	--技能可用
	then
		if WR_ColorFrame_Show("CF3","火打S1") then return true end
	end
	
	--冰震S1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("冰霜震击")	--技能可用
	then
		if WR_ColorFrame_Show("CSH","冰震S1") then return true end
	end
	
	--毁闪S2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	then
		if WR_ColorFrame_Show("CF9","毁闪S2") then return true end
	end
	
	if TargetInCombat	--单位战斗中
	and TargetRange<=30 --单位在技能范围内
	and WR_SpellUsable("土元素")	--技能可用
	and
	(
		(
			WRSet.ZQ_TYS==1 --土元素 首领
			and
			WR_InBossCombat() --BOSS战
		)
		or
		(
			WRSet.ZQ_TYS==2 --土元素 爆发
			and
			zhandoumoshi==1	--爆发 开启
		)
	)
	then
		if WR_ColorFrame_Show("ASF6","土元素S1") then return true end
	end
	
	return false
end

--AOE战斗 图腾祭司
function WR_ShamanEnhancement_Combat_AOE_TTJS()
	if HUCountRangeAOE<=1 or WR_SingleUnit() then return false end	--范围内单位数量<=1	或 单体
	
	--涌动A1
	if WRSet.ZQ_YDTT==1	--涌动图腾 开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("涌动图腾")	--技能 可用
	then
		if WR_ColorFrame_Show("CF6","涌动A1") then return true end
	end
	
	--升腾A1
	if zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=AoeRange --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and LastSpell=="闪电链"	--最后一次用的是闪电链
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾A1") then return true end
	end
	
	--裂地A1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	and BuffTime_ST>GCD	--升腾 BUFF存在
	and Totem_YD_Time>GCD	--涌动图腾 存在
	and IsPlayerSpell(455590)	--已学 大地奔涌
	and
	(
		BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
		or
		not IsPlayerSpell(384450)	--没学 霜巫的传承
	)
	then
		if WR_ColorFrame_Show("CSJ","裂地A1") then return true end
	end

	--毁风A1
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and not IsPlayerSpell(262624)	--没学 元素之灵
	and
	(
		BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
		or
		not IsPlayerSpell(384450)	--没学 霜巫的传承
	)
	then
		if WR_ColorFrame_Show("CSO","毁风A1") then return true end
	end

	--电链A1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and BuffCount_XWWQ>=10	--漩涡武器.层数>=10
	then
		if WR_ColorFrame_Show("CF11","电链A1") then return true end
	end

	--毁闪A1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	and
	(
		HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
		or
		WR_GetUnitBuffTime("player",187878)<=GCD	--毁灭闪电(顺劈) BUFF不存在
	)
	then
		if WR_ColorFrame_Show("CF9","毁闪A1") then return true end
	end

	--裂地A2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	and
	(
		HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
		or
		(
			IsPlayerSpell(455590)	--已学 大地奔涌
			and
			(
				BuffTime_SWDCC>GCD	--霜巫的传承 BUFF存在
				or
				not IsPlayerSpell(384450)	--没学 霜巫的传承
			)
			and Totem_YD_Time>GCD	--涌动图腾 存在
		)
	)
	then
		if WR_ColorFrame_Show("CSJ","裂地A2") then return true end
	end
	
	--流电A1
	if TargetInRange40	--单位在40码内
	and WR_GetUnitBuffTime("player","流电炽焰")>GCD
	and WR_SpellUsable("流电炽焰")
	then
		if WR_ColorFrame_Show("CF2","流电A1") then return true end
	end
	
	--毁闪A2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	and IsPlayerSpell(334308)	--已学 毁灭风暴
	and WR_GetUnitBuffTime("player",333964)>GCD	--毁灭闪电(增强毁灭闪电伤害) BUFF存在
	and HUCountRangeAOE>=4	--附近敌人数量>=4
	then
		if WR_ColorFrame_Show("CF9","毁闪A2") then return true end
	end

	--风切A1
	if TargetRange<=30	--单位在30码内
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	then
		if WR_ColorFrame_Show("CSF7","风切A1") then return true end
	end
	
	--风打A1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("风暴打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSF7","风打A1") then return true end
	end
	
	--霜打A1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("霜刃打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSL","霜打A1") then return true end
	end
	
	--电链A2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and BuffCount_XWWQ>=5	--漩涡武器.层数>=5
	then
		if WR_ColorFrame_Show("CF11","电链A2") then return true end
	end

	--火震A1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")
	and TargetDebuffTime_LYZJ<=GCD	--目标烈焰震击DEBUFF不存在
	then
		if WR_ColorFrame_Show("CF2","火震A1") then return true end
	end
	return false
end


function WR_ShamanEnhancement_Combat_Single()
	if HUCountRangeAOE>1 and not WR_SingleUnit() then return false end	--范围内单位数量>1 并且 不是单体
--[[
	--始源S0
	if TargetInRange40	--单位在40码内
	and TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
	then
		if zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("始源之潮")	--技能 可用
		then
			if WR_ColorFrame_Show("CF5","始源S0") then return true end
		end
		
		--火震S0
		if WR_SpellUsable("烈焰震击") then	--技能 可用
			if WR_ColorFrame_Show("CF2","火震S0") then return true end
		end
	end
--]]
	--狼魂S1
	if zhandoumoshi==1 --开爆发
	and TargetRange<=25 --技能距离
	and not IsPlayerSpell(469314)	--没学天赋 奔流之魂(被动狼)
	and WR_SpellUsable("野性狼魂")	--技能 可用
	then
		if WR_ColorFrame_Show("CF1","狼魂S1") then return true end
	end
	
	--始源S1
	if TargetInRange40	--单位在40码内
	and TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
	and zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("始源之潮")	--技能 可用
	then
		if WR_ColorFrame_Show("CF5","始源S1") then return true end
	end
	
	--火打S0
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("熔岩猛击")
	and IsPlayerSpell(334046)	--已学 鞭笞烈焰
	and WR_GetUnitDebuffInfo("target","鞭笞烈焰",true)<=GCD	--目标 烈焰鞭笞DEBUFF不存在
	then
		if WR_ColorFrame_Show("CF3","火打S0") then return true end
	end
	
	--风打S0
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("风暴打击")	--技能 可用
	and BuffCount_XWWQ<2	--漩涡武器 BUFF层数<2
	and zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and WR_SpellUsable("升腾")	--技能 可用
	then
		if WR_ColorFrame_Show("CSF7","风打S0") then return true end
	end
--[[
	--毁风S0
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and
	(
		LastSpell~="闪电链"	--最后一次用的不是闪电链
		or
		WR_GetGCD("升腾")>GCD+MaxGCD	--升腾冷却时间>下一个技能GCD
	)
	then
		if WR_ColorFrame_Show("CSO","毁风S0") then return true end
	end
--]]

	--升腾S1
	if zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=AoeRange --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and TargetDebuffTime_LYZJ>GCD	 --烈焰震击剩余时间>GCD
	and LastSpell~="闪电链"	--最后一次用的不是闪电链
	and BuffCount_XWWQ>=2	--漩涡武器 BUFF层数>=2
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾S1") then return true end
	end

	--怒号S1
	if TargetInRange40	--单位在40码内
	and KFNH_BuffCount>GCD	--狂风怒号BUFF存在
	and WR_SpellUsable("狂风怒号")	--技能可用
	and
	(
		BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
		or
		(
			KFNH_BuffCount>=2	--狂风怒号 BUFF层数>=2
			and
			WR_GetUnitBuffCount("player","觉醒风暴")>=2	--觉醒风暴 BUFF层数>=2
			and
			BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
		)
	)
	then
		if WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","怒号S1") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击NS1") then return true end
			elseif IsPlayerSpell(51505)	--已学 熔岩爆裂
			and WR_SpellUsable("熔岩爆裂")	--技能 可用
			then
				if WR_ColorFrame_Show("ACSF1","爆裂NS1") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链NS1") then return true end
			end
		end
	end

	--冲击S1	
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("元素冲击")	--技能 可用
	and BuffCount_XWWQ>=10	--漩涡武器 层数>=10
	and IsPlayerSpell(262624)	--已学 元素之灵
	and WolfSum>=6	--野性狼魂 数量>=6
	and
	(
		WR_GetSpellNextCharge("元素冲击")<2.4	--充能剩余时间<2.4秒
		or
		WR_GetUnitBuffTime("player","升腾")>GCD	--升腾存在
	)
	then
		if WR_ColorFrame_Show("CSP","冲击S1") then return true end
	end

	--风切S0
	if TargetRange<=30	--单位在30码内
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	and BuffCount_XWWQ>0	--漩涡武器.层数>0
	and LastSpell~="闪电链"	--最后一次用的不是闪电链
	and WR_GetSpellCharges("风切")>=2	--风切可用次数>=2
	then
		if WR_ColorFrame_Show("CSF7","风切S0") then return true end
	end
	
	--毁风S0
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and IsPlayerSpell(262624)	--已学 元素之灵
	and IsPlayerSpell(114051)	--已学 升腾
	and BuffCount_XWWQ>=2	--漩涡武器 层数>=2
	then
		if WR_ColorFrame_Show("CSO","毁风S0") then return true end
	end

	--风切S1
	if TargetRange<=30	--单位在30码内
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	and BuffCount_XWWQ>0	--漩涡武器.层数>0
	and LastSpell~="闪电链"	--最后一次用的不是闪电链
	then
		if WR_ColorFrame_Show("CSF7","风切S1") then return true end
	end
	
	--火震S1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")	--技能可用
	and TargetDebuffTime_LYZJ<=GCD --烈焰震击 DEBUFF不存在
	and IsPlayerSpell(390370)	--已学 灰烬触媒
	then
		if WR_ColorFrame_Show("CF2","火震S1") then return true end
	end
	
	--电箭S0
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and KFNH_BuffCount==0	--狂风怒号BUFF不存在
	and BuffCount_XWWQ>=10	--漩涡武器层数>=10
	and SYZC_BuffTime>GCD	--始源之潮 BUFF存在
	then
		if KFNH_BuffCount==0	--狂风怒号BUFF不存在
		or WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","电箭S0") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击JS0") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链JS0") then return true end
			end
		end
	end

	--怒号S2
	if TargetInRange40	--单位在40码内
	and KFNH_BuffCount>GCD	--狂风怒号BUFF存在
	and WR_SpellUsable("狂风怒号")	--技能可用
	and BuffCount_XWWQ>=8	--漩涡武器 层数>=8
	then
		if WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","怒号S2") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击NS2") then return true end
			elseif IsPlayerSpell(51505)	--已学 熔岩爆裂
			and WR_SpellUsable("熔岩爆裂")	--技能 可用
			then
				if WR_ColorFrame_Show("ACSF1","爆裂NS2") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链NS2") then return true end
			end
		end
	end

	--始源S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("始源之潮")	--技能 可用
	and zhandoumoshi==1	--爆发 开启
	then
		if WR_ColorFrame_Show("CF5","始源S2") then return true end
	end

	--冲击S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("元素冲击")	--技能 可用
	and BuffCount_XWWQ>=8	--漩涡武器层数>=8
	and WolfSum>=4	--野性狼魂 数量>=4
	and
	(
		WR_GetUnitBuffTime("player","升腾")<=GCD	--升腾不存在
		or
		WR_GetSpellNextCharge("元素冲击")<2.4	--充能剩余时间<2.4秒
	)
	then
		if WR_ColorFrame_Show("CSP","冲击S2") then return true end
	end

	--电箭S1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and KFNH_BuffCount==0	--狂风怒号BUFF不存在
	and BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
	then
		if KFNH_BuffCount==0	--狂风怒号BUFF不存在
		or WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","电箭S1") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击JS1") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链JS1") then return true end
			end
		end
	end

	--风打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("风暴打击")	--技能 可用
	and
	(
		HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
		or
		(
			IsPlayerSpell(319930)	--已学 风暴轰击
			and
			WR_GetUnitBuffTime("player",201846)>GCD	--风暴喷涌 BUFF存在	精通触发增加25%风暴打击伤害
			and
			WR_GetSpellCharges("风暴打击")>=2	--风暴打击可用次数>=2
		)
	)
	then
		if WR_ColorFrame_Show("CSF7","风打S1") then return true end
	end
	
	--流电S1
	if TargetInRange40	--单位在40码内
	and WR_GetUnitBuffTime("player","流电炽焰")>GCD
	and WR_SpellUsable("流电炽焰")
	and HMZF_BuffTime<=GCD	--毁灭之风 BUFF不存在
	then
		if WR_ColorFrame_Show("CF2","流电S1") then return true end
	end
	
	--霜打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("霜刃打击")	--技能 可用
	and IsPlayerSpell(210853)	--已学 元素突袭
	and IsPlayerSpell(384359)	--已学 湍急漩涡
	and IsPlayerSpell(384447)	--已学 巫医血统
	then
		if WR_ColorFrame_Show("CSL","霜打S1") then return true end
	end
	
	--风打S2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("风暴打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSF7","风打S2") then return true end
	end

	--电箭S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
	and KFNH_BuffCount==0	--狂风怒号BUFF不存在
	then
		if KFNH_BuffCount==0	--狂风怒号BUFF不存在
		or WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","电箭S2") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击JS2") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链JS2") then return true end
			end
		end
	end

	--流电S2
	if TargetInRange40	--单位在40码内
	and WR_GetUnitBuffTime("player","流电炽焰")>GCD
	and WR_SpellUsable("流电炽焰")
	then
		if WR_ColorFrame_Show("CF2","流电S2") then return true end
	end

	--冰震S1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("冰霜震击")	--技能可用
	and WR_GetUnitBuffTime("player","冰雹")>GCD	--冰雹 BUFF存在
	and WR_GetUnitBuffTime("player","霜刃打击")>GCD	--霜刃打击 BUFF存在
	and IsPlayerSpell(384359)	--已学 湍急漩涡
	and IsPlayerSpell(114051)	--已学 升腾
	then
		if WR_ColorFrame_Show("CSH","冰震S1") then return true end
	end

	--毁风S1
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	then
		if WR_ColorFrame_Show("CSO","毁风S0") then return true end
	end

	--电箭S3
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("闪电箭")	--技能 可用
	and KFNH_BuffCount==0	--狂风怒号BUFF不存在
	--and BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
	and WR_GetUnitBuffTime("player","弧形放电")>GCD	--弧形放电 BUFF存在
	then
		if KFNH_BuffCount==0	--狂风怒号BUFF不存在
		or WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ColorFrame_Show("CF4","电箭S3") then return true end
		else
			if IsPlayerSpell(117014)	--已学 元素冲击
			and WR_SpellUsable("元素冲击")	--技能 可用
			then
				if WR_ColorFrame_Show("CSP","冲击JS3") then return true end
			else
				if WR_ColorFrame_Show("CF11","电链JS3") then return true end
			end
		end
	end
	
	--火打S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("熔岩猛击")	--技能可用
	and IsPlayerSpell(210853)	--已学 元素突袭
	and IsPlayerSpell(454009)	--已学 狂风怒号
	and IsPlayerSpell(334033)	--已学 熔火突袭
	and TargetDebuffTime_LYZJ>GCD	--烈焰震击 DEBUFF存在
	then
		if WR_ColorFrame_Show("CF3","火打S1") then return true end
	end
	
	--火震S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")	--技能可用
	and TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
	then
		if WR_ColorFrame_Show("CF2","火震S2") then return true end
	end
	
	--冰震S2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("冰霜震击")	--技能可用
	and WR_GetUnitBuffTime("player","冰雹")>GCD	--冰雹 BUFF存在
	then
		if WR_ColorFrame_Show("CSH","冰震S2") then return true end
	end
	
	--火打S2
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("熔岩猛击")	--技能可用
	then
		if WR_ColorFrame_Show("CF3","火打S2") then return true end
	end
	
	--风切S2
	if TargetRange<=30	--单位在30码内
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	then
		if WR_ColorFrame_Show("CSF7","风切S2") then return true end
	end
	
	--裂地S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	then
		if WR_ColorFrame_Show("CSJ","裂地S1") then return true end
	end
	
	--冰震S3
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("冰霜震击")	--技能可用
	then
		if WR_ColorFrame_Show("CSH","冰震S3") then return true end
	end
	
	--毁闪S1
	if TargetClose	--目标在近战范围
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	then
		if WR_ColorFrame_Show("CF9","毁闪S1") then return true end
	end
	
	if WR_ShamanEnhancement_TYS() then return true end	--土元素
	
	--火震S3
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")	--技能可用
	then
		if WR_ColorFrame_Show("CF2","火震S3") then return true end
	end
	
	return false
end

function WR_ShamanEnhancement_Combat_AOE()
	if HUCountRangeAOE<=1 or WR_SingleUnit() then return false end	--范围内单位数量<=1	或 单体

	if WR_GetUnitBuffTime("player","升腾")<=GCD then	--升腾 BUFF不存在
		--始源A0
		if TargetInRange40	--单位在40码内
		and zhandoumoshi==1	--爆发 开启
		and WR_SpellUsable("始源之潮")	--技能 可用
		and
		(
			TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
			or
			KFNH_BuffCount>GCD	--狂风怒号BUFF存在
		)
		then
			if WR_ColorFrame_Show("CF5","始源A0") then return true end
		end
		
		--火震A0
		if TargetInRange40	--单位在40码内
		and WR_SpellUsable("烈焰震击")	--技能 可用
		and TargetDebuffTime_LYZJ<=GCD then	--烈焰震击剩余时间<=GCD
			if WR_ColorFrame_Show("CF2","火震A0") then return true end
		end
		
		--毁闪A0
		if TargetClose	--目标在近战范围
		and WR_SpellUsable("毁灭闪电")	--技能 可用
		and WR_GetUnitBuffTime("player",187878)<=GCD	--毁灭闪电(单体顺劈) BUFF不存在
		and BuffCount_XWWQ<10	--漩涡武器 BUFF层数<10
		then
			if WR_ColorFrame_Show("CF9","毁闪A0") then return true end
		end

		--火打A0
		if WR_SpellUsable("熔岩猛击")
		and WR_GetUnitDebuffTime(BeatUnit_RYMJ,"烈焰震击",true)>GCD	--烈焰震击 DEBUFF存在
		and LYZJCountRangeAOE<HUCountRangeAOE	--烈焰震击 DEBUFF数量<AOE范围敌人数量
		and LYZJCountRangeAOE<6	--烈焰震击 DEBUFF数量<6
		and
		(
			BuffCount_XWWQ<10	--漩涡武器 BUFF层数<10
			or
			SYZC_BuffTime>GCD	--始源之潮BUFF存在
		)
		then
			if WR_ShamanEnhancement_RYMJ(BeatUnit_RYMJ,"A0") then return true end
		end
	end
	
	--狼魂A1
	if zhandoumoshi==1 --开爆发
	and TargetRange<=25 --技能距离
	and not IsPlayerSpell(469314)	--没学天赋 奔流之魂(被动狼)
	and WR_SpellUsable("野性狼魂")	--技能 可用
	then
		if WR_ColorFrame_Show("CF1","狼魂A1") then return true end
	end
	
	--毁风A0
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and BuffTime_ST>GCD	--升腾 BUFF存在
	then
		if WR_ColorFrame_Show("CSO","毁风A0") then return true end
	end
--[[
	--升腾A1
	if zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=4 --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and LastSpell=="闪电链"	--最后一次用的是闪电链
	and
	(
		WR_GetUnitBuffTime("player","毁灭之风")>GCD	--毁灭之风BUFF存在
		or
		WR_GetGCD("毁灭之风")>GCD+MaxGCD	--毁灭之风冷却时间>下一个技能GCD
	)
	and
	(
		LYZJCountRangeAOE==HUCountRangeAOE	--烈焰震击 DEBUFF数量==AOE范围敌人数量
		or
		LYZJCountRangeAOE>=6	--烈焰震击 DEBUFF数量>=6
		or
		not IsPlayerSpell(334033)	--没学天赋[熔火突袭],没办法火打传染
		or
		not WR_SpellUsable("熔岩猛击")	--熔岩猛击不可用,没办法火打传染
		or
		WR_GetUnitBuffTime("player","毁灭之风")>=6	--毁灭之风BUFF时间>=6秒,刚刚使用毁灭之风,马上使用升腾
	)
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾A1") then return true end
	end
--]]
	--升腾A1
	if zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=AoeRange --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and TargetDebuffTime_LYZJ>GCD --烈焰震击剩余时间>GCD
	and LastSpell=="闪电链"	--最后一次用的是闪电链
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾A1") then return true end
	end

	--怒号A1
	if WR_SpellUsable("狂风怒号")
	and KFNH_BuffCount>GCD	--狂风怒号BUFF存在
	and BuffCount_XWWQ>=5	--漩涡武器 层数>=5
	and
	(
		(
			WR_GetUnitBuffTime("player","弧形放电")<=GCD	--弧形放电 BUFF不存在
			and
			BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
		)
		or WR_GetUnitBuffCount("player","觉醒风暴")==2	--觉醒风暴 BUFF层数==2
		or
		(
			KFNH_BuffCount>=2	--狂风怒号>=2层
			and
			SYZC_BuffTime>GCD	--始源之潮BUFF存在
			and
			BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
		)
	)
	then
		if WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ShamanEnhancement_KFNH(BeatUnit_YLZ,"A1") then return true end
		else
			if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"NA1") then return true end
		end
	end

	--风切A1
	if C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	and IsPlayerSpell(384444)	--已学 托里姆的祈咒
	and BuffCount_XWWQ>0	--漩涡武器.层数>0
	and LastSpell=="闪电链"	--最后一次用的是闪电链
	then
		if WR_ShamanEnhancement_FQ(BeatUnit_YLZ,"A1") then return true end
	end

	--电箭A1
	if WR_SpellUsable("闪电箭")
	and
	(
		KFNH_BuffCount>=1	--狂风怒号BUFF存在
		or
		SYZC_BuffTime<=5	--始源之潮BUFF剩余时间<=5秒
	)
--[[
	and
	(
		not IsPlayerSpell(454009)	--没学 狂风怒号
		or 
		WR_GetUnitBuffCount("player","觉醒风暴")<=1	--觉醒风暴 BUFF层数<=1
	)
--]]
	and
	(
		LYZJCountRangeAOE==HUCountRangeAOE	--烈焰震击 BUFF数量==附近敌人数量
		or
		LYZJCountRangeAOE==6	--烈焰震击 BUFF数量==6
	)
	and SYZC_BuffTime>GCD	--始源之潮 BUFF存在
	and BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
	then
		if KFNH_BuffCount==0	--狂风怒号BUFF不存在
		or WRSet.ZQ_KFNH==1	--狂风怒号 常驻
		or
		(
			WRSet.ZQ_KFNH==2	--狂风怒号 爆发
			and
			zhandoumoshi==1	--爆发开启
		)
		then
			if WR_ShamanEnhancement_SDJ(BeatUnit_YLZ,"A1") then return true end
		else
			if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"JA1") then return true end
		end
	end
	
	--流电A1
	if WR_GetUnitBuffTime("player","流电炽焰")>GCD
	and WR_SpellUsable("流电炽焰")
	and BuffCount_XWWQ<=8	--漩涡武器 BUFF层数<=8
	then
		if WR_ColorFrame_Show("CF2","流电A1") then return true end
	end

	--火打A1
	if WR_SpellUsable("熔岩猛击")
	and IsPlayerSpell(334033)	--已学天赋 熔火突袭
	and
	(
		IsPlayerSpell(375982)	--已学天赋 始源之潮
		or
		IsPlayerSpell(333974)	--已学天赋 火焰新星
	)
	and WR_GetUnitDebuffTime(BeatUnit_RYMJ,"烈焰震击",true)>GCD	--烈焰震击 DEBUFF存在
	and LYZJCountRangeAOE<HUCountRangeAOE	--烈焰震击 DEBUFF数量<AOE范围敌人数量
	and LYZJCountRangeAOE<6	--烈焰震击 DEBUFF数量<6
	then
		if WR_ShamanEnhancement_RYMJ(BeatUnit_RYMJ,"A1") then return true end
	end
	
	--始源A1
	if zhandoumoshi==1	--爆发 开启
	and WR_SpellUsable("始源之潮")
	then
		if WR_ShamanEnhancement_SYZC(BeatUnit_LYZJ,"A1") then return true end
	end
--[[
	--电链A0
	local name, instanceType, difficultyID, difficultyName = GetInstanceInfo()
	if difficultyID == 8 then	--是大秘境
		if LastSpell~="闪电链"	--最后一次用的不是闪电链
		and WR_SpellUsable("闪电链")	--技能可用
		and BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
		and zhandoumoshi==1	--爆发开启
		and IsPlayerSpell(114051)	--已学 升腾
		and IsPlayerSpell(384444)	--已学 托里姆的祈咒
		and WR_GetGCD("升腾")<=GCD+MaxGCD	--升腾CD冷却时间<=下一个GCD
		then
			if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"A0") then return true end
		end
	end
--]]
	--电链A1
	if WR_SpellUsable("闪电链")
	and WR_GetUnitBuffTime("player","弧形放电")>GCD	--弧形放电 BUFF存在
	and BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
	--and AvgDeathTime>20	--预计战斗结束时间>20秒
	then
		if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"A1") then return true end
	end
	
	--冲击A1
	if TargetInCombat	--单位战斗中
	and IsSpellInRange("元素冲击","target") --单位在技能范围内
	and WR_SpellUsable("元素冲击")	--技能 可用
	and
	(
		WR_GetSpellCharges("元素冲击")>=2	--可用次数>=2
		or
		WR_GetSpellNextCharge("元素冲击")<=GCD+1	--下一个GCD+1秒充能满层
		or
		WolfSum>=2	--野性狼魂 数量>=2
	)
	and BuffCount_XWWQ>=10	--漩涡武器 层数>=10
	and
	(
		not IsPlayerSpell(334308)	--没学 毁灭风暴
		or
		HUCountRangeAOE<=3 --敌人数量<=3
	)
	then
		if WR_ColorFrame_Show("CSP","冲击A1") then return true end
	end

	--电链A2
	if WR_SpellUsable("闪电链")
	and BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
	then
		if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"A2") then return true end
	end
	
	--毁风A1
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭之风")	--技能 可用
	and zhandoumoshi==1 --开爆发
	and LastSpell=="闪电链"	--最后一次用的是闪电链
	then
		if WR_ColorFrame_Show("CSO","毁风A1") then return true end
	end

	--毁闪A1
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	and
	(
		(
			HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
			and
			HUCountRangeAOE>=4	--敌人数量>=4
		)
		or
		WR_GetUnitBuffTime("player",187878)<=GCD	--毁灭闪电(单体顺劈) BUFF不存在
	)
	then
		if WR_ColorFrame_Show("CF9","毁闪A1") then return true end
	end

	--裂地A1
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	and HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
	then
		if WR_ColorFrame_Show("CSJ","裂地A1") then return true end
	end

	--火星A1
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("火焰新星")	--技能 可用
	and
	(
		LYZJCountRangeAOE==6	--烈焰震击 BUFF数量==6
		or
		(
			LYZJCountRangeAOE>=4 --烈焰震击 BUFF数量>=4
			and
			LYZJCountRangeAOE==HUCountRangeAOE	--烈焰震击 BUFF数量==附近敌人数量
		)
	)
	then
		if WR_ColorFrame_Show("CF7","火星A1") then return true end
	end

	--风打A0
	if TargetClose	--目标在近战范围
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("风暴打击")	--技能 可用
	and IsPlayerSpell(319930)	--已学 风暴轰击
	and IsPlayerSpell(344357)	--已学 风暴之舞
	then
		if WR_ColorFrame_Show("CSF7","风打A0") then return true end
	end	

	--流电A2
	if WR_GetUnitBuffTime("player","流电炽焰")>GCD	--流电炽焰 BUFF存在
	and WR_SpellUsable("流电炽焰")
	then
		if WR_ColorFrame_Show("CF2","流电A2") then return true end
	end

	--火打A2
	if WR_SpellUsable("熔岩猛击")
	and WR_GetUnitDebuffTime(BeatUnit_RYMJ,"烈焰震击",true)>GCD	--烈焰震击 DEBUFF存在
	and
	(
		IsPlayerSpell(334046)	--已学 鞭笞烈焰
		or
		IsPlayerSpell(334033)	--已学 熔火突袭
	)
	then
		if WR_ShamanEnhancement_RYMJ(BeatUnit_RYMJ,"A2") then return true end
	end

	--霜打A1
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("霜刃打击")	--技能 可用
	and IsPlayerSpell(334195)	--已学 冰雹
	and WR_GetUnitBuffTime("player","霜刃打击")<=GCD	--霜刃打击 BUFF不存在
	then
		if WR_ColorFrame_Show("CSL","霜打A1") then return true end
	end

	--冰震A1
	if TargetInCombat	--单位战斗中
	and TargetRange<=40 --单位在技能范围内
	and WR_SpellUsable("冰霜震击")	--技能可用
	and IsPlayerSpell(334195)	--已学 冰雹
	and WR_GetUnitBuffTime("player","冰雹")>GCD	--冰雹 BUFF存在
	then
		if WR_ColorFrame_Show("CSH","冰震A1") then return true end
	end
	
	--裂地A2
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	then
		if WR_ColorFrame_Show("CSJ","裂地A2") then return true end
	end

	--火震A1
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")
	and IsPlayerSpell(334033)	--已学天赋 熔火突袭
	and TargetDebuffTime_LYZJ<=GCD	--目标烈焰震击DEBUFF不存在
	then
		if WR_ColorFrame_Show("CF2","火震A1") then return true end
	end

	--火震A2
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")
	and LYZJCountRangeAOE<HUCountRangeAOE	--烈焰震击 DEBUFF数量<AOE范围敌人数量
	and LYZJCountRangeAOE<6	--烈焰震击 DEBUFF数量<6
	then
		if WR_ShamanEnhancement_LYZJ(BeatUnit_LYZJ,"A2") then return true end
	end
	
	--火星A2
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("火焰新星")	--技能 可用
	and LYZJCountRangeAOE>=3 --烈焰震击 BUFF数量>=3
	then
		if WR_ColorFrame_Show("CF7","火星A2") then return true end
	end
	
	--风打A1
	if TargetClose	--目标在近战范围
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("风暴打击")	--技能 可用
	and WR_GetUnitBuffTime("player",187878)>GCD	--毁灭闪电 BUFF存在
	and
	(
		IsPlayerSpell(378270)	--已学 根深蒂固的元素
		or
		WR_GetUnitBuffCount("player","汇聚风暴")>=6	--汇聚风暴 BUFF层数>=6
	)
	then
		if WR_ColorFrame_Show("CSF7","风打A1") then return true end
	end	

	--毁闪A2
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	and IsPlayerSpell(334308)	--已学 毁灭风暴
	and WR_GetUnitBuffTime("player",333964)>GCD	--毁灭闪电(增强毁灭闪电伤害) BUFF存在
	and HUCountRangeAOE>=4 --敌人数量>=4
	then
		if WR_ColorFrame_Show("CF9","毁闪A2") then return true end
	end
	
	--风打A2
	if TargetClose	--目标在近战范围
	and TargetInCombat	--单位战斗中
	and WR_SpellUsable("风暴打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSF7","风打A2") then return true end
	end	

	--霜打A2
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("霜刃打击")	--技能 可用
	then
		if WR_ColorFrame_Show("CSL","霜打A2") then return true end
	end
	
	--火打A3
	if WR_SpellUsable("熔岩猛击") then
		if WR_ShamanEnhancement_RYMJ(BeatUnit_RYMJ,"A3") then return true end
	end

	--毁闪A3
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("毁灭闪电")	--技能 可用
	then
		if WR_ColorFrame_Show("CF9","毁闪A3") then return true end
	end

	--火星A3
	if TargetClose	--目标在近战范围
	and TargetInCombat	--目标战斗中
	and WR_SpellUsable("火焰新星")	--技能 可用
	and LYZJCountRangeAOE>=2 --烈焰震击 BUFF数量>=2
	then
		if WR_ColorFrame_Show("CF7","火星A3") then return true end
	end

	--冲击A2
	if TargetInCombat	--单位战斗中
	and IsSpellInRange("元素冲击","target") --单位在技能范围内
	and WR_SpellUsable("元素冲击")	--技能 可用
	and
	(
		WR_GetSpellCharges("元素冲击")>=2	--可用次数>=2
		or
		WR_GetSpellNextCharge("元素冲击")<=GCD+1	--下一个GCD+1秒充能满层
		or
		WolfSum>=2	--野性狼魂 数量>=2
	)
	and BuffCount_XWWQ>=5	--漩涡武器 层数>=5
	and
	(
		not IsPlayerSpell(334308)	--没学 毁灭风暴
		or
		HUCountRangeAOE<=3 --敌人数量<=3
	)
	then
		if WR_ColorFrame_Show("CSP","冲击A2") then return true end
	end
--[[
	--电链A3
	if WR_SpellUsable("闪电链")
	and BuffCount_XWWQ>=5	--漩涡武器 BUFF层数>=5
	then
		if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,"A2") then return true end
	end
--]]
	--火震A3
	if TargetInRange40	--单位在40码内
	and WR_SpellUsable("烈焰震击")
	and WR_GetUnitDebuffTime(BeatUnit_LYZJ,"烈焰震击",true)<=GCD	--烈焰震击 DEBUFF不存在
	then
		if WR_ShamanEnhancement_LYZJ(BeatUnit_LYZJ,"A3") then return true end
	end
	
	--冰震A2
	if TargetInCombat	--单位战斗中
	and TargetRange<=40 --单位在技能范围内
	and WR_SpellUsable("冰霜震击")	--技能可用
	and not IsPlayerSpell(334195)	--没学天赋 冰雹
	then
		if WR_ColorFrame_Show("CSH","冰震A2") then return true end
	end	
	
	return false
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_ShamanEnhancement_LastSpellTime()
	if LastSpellIsOpen then return end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="风暴打击" then
						CastTime_FBDJ=GetTime()
					elseif SpellName=="风切" then
						CastTime_FQ=GetTime()
					elseif SpellName=="闪电箭" then
						CastTime_SDJ=GetTime()
						LastSpell="闪电箭"
					elseif SpellName=="闪电链" then
						CastTime_SDL=GetTime()
						LastSpell="闪电链"
					elseif SpellName=="狂风怒号" then
						CastTime_KFNH=GetTime()
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end


--获得最佳单位 引雷针
function WR_ShamanEnhancement_GetBeatUnit_YLZ()
	if not IsPlayerSpell(455123) then return "target" end	--没有学习传导能量(引雷针)
	
	local BestS=0
	local BeatUnit=""
	
	if WR_GetUnitRange("target")<=AoeRange	--AOE范围内
	and WR_TargetInCombat("target")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("target","引雷针",true)
		if TempS==8 then
			return "target"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if WR_GetUnitRange("mouseover")<=AoeRange	--AOE范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	then
		local TempS = 8 - WR_GetUnitDebuffTime("mouseover","引雷针",true)
		if TempS==8 then
			return "mouseover"
		elseif TempS > BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if WR_GetUnitRange(TempUnit)<=AoeRange	--AOE范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		then
			local TempS = 8 - WR_GetUnitDebuffTime(TempUnit,"引雷针",true)
			if TempS==8 then
				return TempUnit
			elseif TempS > BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	if BeatUnit=="" then return "target" end
	return BeatUnit
end

--获得最佳单位 烈焰震击
function WR_ShamanEnhancement_GetBeatUnit_LYZJ()
	local BestS=999
	local BeatUnit=""
	
	if WR_GetUnitRange("target")<=AoeRange	--AOE范围内
	and WR_TargetInCombat("target")	--单位战斗
	then
		local TempS = WR_GetUnitDebuffTime("target","烈焰震击",true)
		if TempS==0 then
			return "target"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if WR_GetUnitRange("mouseover")<=AoeRange	--AOE范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	then
		local TempS = WR_GetUnitDebuffTime("mouseover","烈焰震击",true)
		if TempS==0 then
			return "mouseover"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if WR_GetUnitRange(TempUnit)<=AoeRange	--AOE范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		then
			local TempS = WR_GetUnitDebuffTime(TempUnit,"烈焰震击",true)
			if TempS==0 then
				return TempUnit
			elseif TempS < BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	if BeatUnit=="" then return "target" end
	return BeatUnit
end

--获得最佳单位 熔岩猛击
function WR_ShamanEnhancement_GetBeatUnit_RYMJ()
	local BestS=999
	local BeatUnit=""
	
	
	if C_Spell.IsSpellInRange("熔岩猛击","target")	--单位在技能范围内
	and WR_TargetInCombat("target")	--单位战斗
	and WR_GetUnitDebuffTime("target","烈焰震击",true)>GCD	--烈焰震击DEBUFF 存在
	then
		local TempS = WR_GetUnitDebuffTime("target","鞭笞烈焰",true)
		if TempS==0 then
			return "target"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "target"
		end
	end
	
	if C_Spell.IsSpellInRange("熔岩猛击","mouseover")	--单位在技能范围内
	and WR_TargetInCombat("mouseover")	--单位战斗
	and WR_GetUnitDebuffTime("mouseover","烈焰震击",true)>GCD	--烈焰震击DEBUFF 存在
	then
		local TempS = WR_GetUnitDebuffTime("mouseover","鞭笞烈焰",true)
		if TempS==0 then
			return "mouseover"
		elseif TempS < BestS then
			BestS = TempS
			BeatUnit = "mouseover"
		end
	end
	
	for i=1,4 do
	local TempUnit="party"..i.."target"
		if C_Spell.IsSpellInRange("熔岩猛击",TempUnit)	--单位在技能范围内
		and WR_TargetInCombat(TempUnit)	--单位战斗
		and WR_GetUnitDebuffTime(TempUnit,"烈焰震击",true)>GCD	--烈焰震击DEBUFF 存在
		then
			local TempS = WR_GetUnitDebuffTime(TempUnit,"鞭笞烈焰",true)
			if TempS==0 then
				return TempUnit
			elseif TempS < BestS then
				BestS = TempS
				BeatUnit = TempUnit
			end
		end
	end
	
	if BeatUnit=="" then return "target" end
	return BeatUnit
end

--先祖指引
function WR_ShamanEnhancement_XZZY()
	if WRSet.ZQ_XZZY==1 --先祖指引 开启
	and WR_SpellUsable("先祖指引")	--技能 可用
	and
	(
		WR_PartyLostHP("治疗之涌")>0.50 --全队掉血比例
		or
		UnitChannelInfo("boss1")=="喑星之夜"
	)
	then
		if WR_ColorFrame_Show("CSY","先祖指引") then return true end
	end
	return false
end

--治疗之泉图腾
function WR_ShamanEnhancement_ZLZQTT()
	if WR_SpellUsable("治疗之泉图腾")	--技能 可用
	and
	(
		WR_PartyLostHP("治疗之涌")>0.50 --全队掉血比例
		or
		UnitChannelInfo("boss1")=="喑星之夜"
	)
	then
		if WR_ColorFrame_Show("CF8","治疗之泉") then return true end
	end
	return false
end

--治疗之涌
function WR_ShamanEnhancement_ZLZY()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WRSet.ZQ_ZLZY~=8 --治疗之涌 选项不是关闭的
	and PlayerHP<WRSet.ZQ_ZLZY/10 --血量比例<治疗之涌 设定值/10
	and BuffCount_XWWQ>=5 --漩涡武器>=5层
	then
		if WR_ColorFrame_Show("ACN0","治疗之涌") then return true end
	end
	return false
end

--幽魂步
function WR_ShamanEnhancement_YHB()
	
	if WRSet.ZQ_YHB==1 --幽魂步 开启
	and WR_SpellUsable("幽魂步")	--技能可用
	and
	(
		WR_Unbind("player")	--单位有可以解除的状态
		or
		WR_SpeedUp()	--需要加速跑
	)
	then
		if WR_ColorFrame_Show("CSB","幽魂步") then return true end
	end

	return false
end

--风怒武器
function WR_ShamanEnhancement_FNWQ()
	local _, _, _, mainHandEnchantID, _, _, _, offHandEnchantID = GetWeaponEnchantInfo()	--获取主手和副手的临时附魔ID
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(33757)
	--已学 风怒武器
	and
	mainHandEnchantID~=5401
	--主手不是风怒
	then
		if WR_ColorFrame_Show("ASF1","风怒武器") then return true end
	end
	return false
end

--火舌武器
function WR_ShamanEnhancement_HSWQ()
	local _, _, _, mainHandEnchantID, _, _, _, offHandEnchantID = GetWeaponEnchantInfo()	--获取主手和副手的临时附魔ID
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(318038) --已学 火舌武器
	and offHandEnchantID~=5400 --副手不是火舌
	then
		if WR_ColorFrame_Show("ASF2","火舌武器") then return true end
	end
	return false
end

--闪电之盾
function WR_ShamanEnhancement_SDZD()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and
	(
		WRSet.ZQ_HD==1 --闪电之盾 开启
		or
		(
			WRSet.ZQ_HD~=3 --护盾没禁用
			and
			IsPlayerSpell(383010)	--已学 [元素环绕]
		)
	)
	and WR_SpellUsable("闪电之盾")	--技能可用
	and WR_GetUnitBuffTime("player","闪电之盾")==0 --闪电之盾 BUFF不存在
	then
		if WR_ColorFrame_Show("ASF3","闪电之盾") then return true end
	end
	return false
end
	
--大地之盾
function WR_ShamanEnhancement_DDZD()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and
	(
		WRSet.ZQ_HD==2 --大地之盾 开启
		or
		(
			WRSet.ZQ_HD~=3 --护盾没禁用
			and
			IsPlayerSpell(383010)	--已学 [元素环绕]
		)
	)
	and WR_SpellUsable("大地之盾")	--技能可用
	and WR_GetUnitBuffTime("player","大地之盾")==0 --大地之盾 BUFF不存在
	and not UnitAffectingCombat("player")	--玩家不在战斗中
	then
		if WR_ColorFrame_Show("ASF5","大地之盾") then return true end
	end
	return false
end
	
--雷霆风暴
function WR_ShamanEnhancement_LTFB()
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WRSet.ZQ_LTFB==1 --雷霆风暴 开启
	and WR_SpellUsable("雷霆风暴")	--技能可用
	and WR_GetInRaidOrParty()~="raid"	--不在团队
	and WR_StunUnit(8,2)	--范围内有需要控制的单位
	then
		if WR_ColorFrame_Show("SF12","雷霆风暴") then return true end
	end
	return false
end

--风切
function WR_ShamanEnhancement_FQ(Unit,Text)
	if WR_GetUnitRange(Unit)<=30	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CSF7",Text.."风切T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF8",Text.."风切M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN7",Text.."风切P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN8",Text.."风切P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN9",Text.."风切P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN0",Text.."风切P4T") then return true end
		end
	end
	return false
end

--施法过程 风切
function WR_ShamanEnhancement_Function_FQ(Text)
	if GCD<=ShiFaSuDu
	--and WR_SpellUsable("风切")	--技能 可用
	and C_Spell.IsSpellUsable("风切") --技能资源足够
	and WR_GetGCD("风切")<=GCD+0.3 --技能冷却
	and WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+0.2	--升腾BUFF时间>风切冷却时间+0.2缓冲延迟
	then
		if
		(
			Text=="祈咒"
			and
			IsPlayerSpell(384444)	--已学 托里姆的祈咒
			and
			BuffCount_XWWQ>0	--漩涡武器.层数>0
			and
			(
				(
					HUCountRangeAOE<=1	--AOE范围敌人数量<=1
					and
					LastSpell~="闪电链"	--最后一次用的不是闪电链
				)
				or
				(
					HUCountRangeAOE>1	--AOE范围敌人数量>1
					and
					LastSpell=="闪电链"	--最后一次用的是闪电链
				)
			)
		)
		or
		Text=="单体"
		then
			if WR_ShamanEnhancement_FQ(BeatUnit_YLZ,Text) then return true end
		end
	end
	return false
end

--野性狼魂
function WR_ShamanEnhancement_YXLH(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat --目标战斗中
	and zhandoumoshi==1 --开爆发
	and TargetRange<=25 --技能距离
	and WR_SpellUsable("野性狼魂")	--技能 可用
	and not IsPlayerSpell(469314)	--没学天赋 奔流之魂
	then
		if Text==nil then
			if WR_ColorFrame_Show("CF1","野性狼魂") then return true end
		elseif
		(
			Text=="元素之灵"
			and
			(
				IsPlayerSpell(262624)	--已学 元素之灵
				or
				(
					IsPlayerSpell(198434)	--已学 头狼
					and
					HUCountRangeAOE>1	--AOE范围敌人数量>1
				)
			)
		)
		then
			if WR_ColorFrame_Show("CF1","元素狼魂") then return true end
		end
	end
	return false
end

--升腾
function WR_ShamanEnhancement_ST()
	if GCD<=ShiFaSuDu
	and TargetInCombat --目标战斗中
	and zhandoumoshi==1 --开爆发
	and WRSet.ZQ_ST==1	--升腾 爆发
	and TargetRange<=AoeRange --技能距离
	and WR_SpellUsable("升腾")	--技能 可用
	and TargetDebuffTime_LYZJ>GCD	 --烈焰震击剩余时间>GCD
	and
	(
		(
			LastSpell~="闪电链"	--最后一次用的不是闪电链
			and
			HUCountRangeAOE<=1	--AOE范围敌人数量<=1
		)
		or
		(
			LastSpell=="闪电链"	--最后一次用的是闪电链
			and
			HUCountRangeAOE>1	--AOE范围敌人数量>1
		)
	)
	then
		if zhandoumoshi==1 and WRSet.ZQ_SP1==2 then
			if WR_ShiPin(1,WRSet.ZQ_SP1) then return true end	--饰品 爆发
		end
		if zhandoumoshi==1 and WRSet.ZQ_SP2==2 then
			if WR_ShiPin(2,WRSet.ZQ_SP2) then return true end	--饰品 爆发
		end
		if WR_ColorFrame_Show("CF10","升腾") then return true end
	end
	return false
end

--毁灭之风
function WR_ShamanEnhancement_HMZF()
	if WRSet.ZQ_HMZF==1	--毁灭之风开启
	and GCD<=ShiFaSuDu
	and TargetInCombat --目标战斗中
	and zhandoumoshi==1 --开爆发
	and TargetClose	--目标在近战
	and WR_SpellUsable("毁灭之风")	--技能 可用
	then
		if WR_ColorFrame_Show("CSO","毁灭之风") then return true end
	end
	return false
end

--熔岩猛击
function WR_ShamanEnhancement_RYMJ(Unit,Text)
	if C_Spell.IsSpellInRange("熔岩猛击",Unit)	--单位在技能范围内
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF3",Text.."火打T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("ASF8",Text.."火打M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("AN7",Text.."火打P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("AN8",Text.."火打P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("AN9",Text.."火打P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("AN0",Text.."火打P4T") then return true end
		end
	end
	return false
end

--施法过程 熔岩猛击
function WR_ShamanEnhancement_Function_RYMJ(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("熔岩猛击") then return false end	--技能不可用
	
	if 
	(
		Text=="单灼"
		and
		WR_GetUnitBuffTime("player","灼热之手")>GCD --灼热之手 BUFF存在
	)
	or
	(
		Text=="单鞭"
		and
		IsPlayerSpell(334046)	--已学 鞭笞烈焰
	)
	or
	(
		Text=="传染"
		and
		IsPlayerSpell(334033)	--已学天赋 熔火突袭
		and
		(
			IsPlayerSpell(375982)	--已学天赋 始源之潮
			or
			IsPlayerSpell(333974)	--已学天赋 火焰新星
		)
		and
		LYZJCountRangeAOE<HUCountRangeAOE	--烈焰震击 DEBUFF数量<AOE范围敌人数量
		and
		LYZJCountRangeAOE<6	--烈焰震击 DEBUFF数量<6
		and
		WR_GetUnitDebuffTime(BeatUnit_RYMJ,"烈焰震击",true)>GCD	--烈焰震击 DEBUFF存在
	)
	or
	(
		Text=="AOE"
		and
		IsPlayerSpell(334046)	--已学 鞭笞烈焰
		and
		WR_GetUnitDebuffTime(BeatUnit_RYMJ,"烈焰震击",true)>GCD	--烈焰震击 DEBUFF存在
	)
	then
		if WR_ShamanEnhancement_RYMJ(BeatUnit_RYMJ,Text) then return true end
	end
	
	return false
end

--烈焰震击
function WR_ShamanEnhancement_LYZJ(Unit,Text)
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF2",Text.."火震T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("SF3",Text.."火震M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF4",Text.."火震P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF5",Text.."火震P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("SF6",Text.."火震P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("SF7",Text.."火震P4T") then return true end
		end
	end
	return false
end

--施法过程 烈焰震击
function WR_ShamanEnhancement_Function_LYZJ(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("烈焰震击") then return false end	--技能不可用
	
	if 
	(
		Text=="单DOT"
		and
		TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
		and
		IsPlayerSpell(334046)	--已学 鞭笞烈焰
	)
	or
	(
		Text=="单体"
		and
		TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
	)
	or
	Text=="单填"
	or
	(
		Text=="DOT"
		and
		(
			IsPlayerSpell(375982)	--已学天赋 始源之潮
			or
			IsPlayerSpell(333974)	--已学天赋 火焰新星
		)
		and
		LYZJCountRangeAOE<HUCountRangeAOE	--烈焰震击 DEBUFF数量<AOE范围敌人数量
		and
		LYZJCountRangeAOE<6	--烈焰震击 DEBUFF数量<6
		and
		TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
	)
	or
	(
		Text=="A填"
		and
		WR_GetUnitDebuffTime(BeatUnit_LYZJ,"烈焰震击",true)<=GCD	--烈焰震击 DEBUFF不存在
	)
	then
		if WR_ShamanEnhancement_LYZJ(BeatUnit_LYZJ,Text) then return true end
	end
	
	return false
end
	
--始源之潮
function WR_ShamanEnhancement_SYZC(Unit,Text)
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF5",Text.."始源T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CF5",Text.."始源T") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("ACSF9",Text.."始源P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("ACSF10",Text.."始源P1T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("ACSF11",Text.."始源P1T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("ACSF12",Text.."始源P1T") then return true end
		end
	end
	return false
end

--施法过程 始源之潮
function WR_ShamanEnhancement_Function_SYZC(Text)
	if GCD>ShiFaSuDu then return false end
	if zhandoumoshi~=1 then return false end	--不是爆发
	if not WR_SpellUsable("始源之潮") then return false end	--技能不可用
	
	if Text=="单体"
	or Text=="AOE"
	or
	(
		Text=="单DOT"
		and
		TargetDebuffTime_LYZJ<=GCD --烈焰震击剩余时间<=GCD
		and
		IsPlayerSpell(334046)	--已学 鞭笞烈焰
	)
	then
		if WR_ShamanEnhancement_SYZC(BeatUnit_LYZJ,Text) then return true end
	end
	
	return false
end

--土元素
function WR_ShamanEnhancement_TYS()
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetRange<=20 --单位在技能范围内
	and WR_SpellUsable("土元素")	--技能可用
	and
	(
		(
			WRSet.ZQ_TYS==1 --土元素 首领
			and
			WR_InBossCombat() --BOSS战
		)
		or
		(
			WRSet.ZQ_TYS==2 --土元素 爆发
			and
			zhandoumoshi==1	--爆发 开启
		)
	)
	then
		if WR_ColorFrame_Show("ASF6","土元素") then return true end
	end
	return false
end

--火焰新星
function WR_ShamanEnhancement_HYXX(Text)
	if GCD>ShiFaSuDu then return false end
	if not TargetInCombat then return false end	--单位不在战斗中
	if TargetRange>8 then return false end	--单位距离>8码
	if not WR_SpellUsable("火焰新星") then return false end	--技能不可用
	
	if
	(
		Text=="单体"
		and
		IsPlayerSpell(384359)	--已学 湍急漩涡
		and
		TargetDebuffTime_LYZJ>GCD --烈焰震击剩余时间>GCD
		and
		BuffCount_XWWQ<10	--漩涡武器 层数<10
	)
	or
	(
		Text=="单填"
		and
		TargetDebuffTime_LYZJ>GCD --烈焰震击剩余时间>GCD
	)
	or
	(
		Text=="4层"
		and
		LYZJCountRangeAOE>=4 --烈焰震击 BUFF数量>=4
		and
		(
			LYZJCountRangeAOE==6	--烈焰震击 BUFF数量==6
			or
			LYZJCountRangeAOE==HUCountRangeAOE	--烈焰震击 BUFF数量==附近敌人数量
		)
	)
	or
	(
		Text=="3层"
		and
		LYZJCountRangeAOE>=3 --烈焰震击 BUFF数量>=3
	)
	or
	(
		Text=="2层"
		and
		LYZJCountRangeAOE>=2 --烈焰震击 BUFF数量>=2
	)
	then
		if WR_ColorFrame_Show("CF7",Text.."火星") then return true end
	end
	return false
end

--毁灭闪电
function WR_ShamanEnhancement_HMSD(Text)
	if GCD>ShiFaSuDu then return false end
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetClose then return false end	--目标不在近战范围内
	if not WR_SpellUsable("毁灭闪电") then return false end	--技能不可用
	
	if
	Text=="单体"
	or
	Text=="AOE"
	or
	(
		Text=="BUFF"
		and
		(
			HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
			or
			WR_GetUnitBuffTime("player",187878)<=GCD	--毁灭闪电(单体顺劈) BUFF不存在
		)
	)
	or
	(
		Text=="汇聚"
		and
		IsPlayerSpell(384363)	--已学 汇聚风暴
	)
	or
	(
		Text=="强化"
		and
		IsPlayerSpell(334308)	--已学 毁灭风暴
		and
		WR_GetUnitBuffTime("player",333964)>GCD	--毁灭闪电(增强毁灭闪电伤害) BUFF不存在
		and
		HUCountRangeAOE>=4 --敌人数量>=4
	)
	then
		if WR_ColorFrame_Show("CF9",Text.."毁闪") then return true end
	end
	return false
end

--冰霜震击
function WR_ShamanEnhancement_BSZJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetRange<=40 --单位在技能范围内
	and WR_SpellUsable("冰霜震击")	--技能可用
	then
		if Text=="单体"
		or
		(
			Text=="冰雹"
			and
			WR_GetUnitBuffTime("player","冰雹")>GCD	--冰雹 BUFF存在
		)
		or
		(
			Text=="AOE"
			and
			not IsPlayerSpell(334195)	--没学天赋 冰雹
		)
		then
			if WR_ColorFrame_Show("CSH",Text.."冰震") then return true end
		end
	end
	return false
end

--裂地术
function WR_ShamanEnhancement_LDS(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and TargetClose	--目标在近战
	and WR_SpellUsable("裂地术")	--技能 可用
	--and zhandoumoshi==1	--爆发 开启
	then
		if Text=="单体"
		or Text=="AOE"
		or
		(
			Text=="毁灭"
			and
			(
				HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
				or
				IsPlayerSpell(455590)	--已学 大地奔涌
			)
		)
		then
			if WR_ColorFrame_Show("CSJ",Text.."裂地") then return true end
		end
	end
	return false
end

--风暴打击
function WR_ShamanEnhancement_FBDJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and IsSpellInRange("风暴打击","target") --单位在技能范围内
	and WR_SpellUsable("风暴打击")	--技能 可用
	then
		if 
		(
			Text=="觉醒"
			and IsPlayerSpell(455129)	--已学 觉醒风暴
			and CastTime_FBDJ~=nil
			and GetTime()-CastTime_FBDJ>=3.5	--上一个 风暴打击 时间已经过去3.5秒
			and CastTime_FQ~=nil
			and GetTime()-CastTime_FQ>=3.5	--上一个 风切 时间已经过去3.5秒
			and CastTime_SDJ~=nil
			and GetTime()-CastTime_SDJ>=3.5	--上一个 闪电箭 时间已经过去3.5秒
			and CastTime_SDL~=nil
			and GetTime()-CastTime_SDL>=3.5	--上一个 闪电链 时间已经过去3.5秒
			and CastTime_KFNH~=nil
			and GetTime()-CastTime_KFNH>=3.5	--上一个 狂风怒号 时间已经过去3.5秒
		)
		or
		Text=="单体"
		or
		(
			Text=="单优"
			and
			not IsPlayerSpell(262624)	--没学 元素之灵
			and
			(
				HMZF_BuffTime>GCD	--毁灭之风 BUFF存在
				or
				IsPlayerSpell(378270)	--已学 根深蒂固的元素
				or
				(
					IsPlayerSpell(319930)	--已学 风暴轰击
					and
					WR_GetUnitBuffTime("player","风暴使者")>GCD	--风暴使者 BUFF存在
				)
			)
		)
		or
		Text=="AOE"
		or
		(
			Text=="A优"
			and
			WR_GetUnitBuffTime("player",187878)>GCD	--毁灭闪电 BUFF存在
			and
			(
				IsPlayerSpell(378270)	--已学 根深蒂固的元素
				or
				WR_GetUnitBuffCount("player","汇聚风暴")>=6	--汇聚风暴 BUFF层数>=6
			)
		)
		then
			if WR_ColorFrame_Show("CSF7",Text.."风打") then return true end
		end
	end
	return false
end

--霜刃打击
function WR_ShamanEnhancement_SRDJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and IsSpellInRange("霜刃打击","target") --单位在技能范围内
	and WR_SpellUsable("霜刃打击")	--技能 可用
	and WR_GetUnitBuffTime("player","霜刃打击")<=GCD	--霜刃打击 BUFF不存在
	then
		if Text=="单体"
		or
		Text=="AOE"
		or
		(
			Text=="冰雹"
			and
			IsPlayerSpell(334195)	--已学 冰雹
		)
		or
		(
			Text=="单优"
			and
			IsPlayerSpell(210853)	--已学 元素突袭
			and
			IsPlayerSpell(384359)	--已学 湍急漩涡
		)
		then
			if WR_ColorFrame_Show("CSL",Text.."霜打") then return true end
		end
	end
	return false
end

--元素冲击
function WR_ShamanEnhancement_YSCJ(Text)
	if GCD<=ShiFaSuDu
	and TargetInCombat	--单位战斗中
	and IsSpellInRange("元素冲击","target") --单位在技能范围内
	and WR_SpellUsable("元素冲击")	--技能 可用
	and BuffCount_XWWQ>=5	--漩涡武器层数>=5
	then
		if
		(
			--本段的目的：在元素之狼最后两个GCD的时候，不溢出狂风怒号的前提下，优先打出元素冲击。
			Text=="单优"
			and
			KFNH_BuffCount<2	--狂风怒号 BUFF层数<2
			and
			IsPlayerSpell(262624)	--已学 元素之灵
			and
			WolfSum>=2	--野性狼魂 数量>=2
			and
			YXLH_BuffTime<=GCD+MaxGCD*2	--野性狼魂 BUFF时间<=当前GCD+最大GCD*2
		)
		or
		
		(
			Text=="单满"
			and
			(
				WR_GetSpellCharges("元素冲击")>=2	--可用次数>=2
				or
				WR_GetSpellNextCharge("元素冲击")<=GCD+1	--下一个GCD+1秒充能满层
			)
		)
		or
		(
			Text=="8狼"
			and
			BuffCount_XWWQ>=10	--漩涡武器层数>=10
			and
			IsPlayerSpell(262624)	--已学 元素之灵
			and
			WolfSum>=8	--野性狼魂 数量>=8
			and
			WR_GetSpellNextCharge("元素冲击")<2.4	--充能剩余时间<2.4秒
		)
		or
		(
			Text=="7狼"
			and
			BuffCount_XWWQ>=8	--漩涡武器层数>=8
			and
			(
				HBDF_BuffSum>=1	--寒冰刀锋 BUFF数量>=1
				or
				RYWQ_BuffSum>=1	--熔岩武器 BUFF数量>=1
			)
			and
			(
				WolfSum>=7	--野性狼魂 数量>=7
				or
				WR_GetSpellNextCharge("元素冲击")<2.4	--充能剩余时间<2.4秒
			)
			and
			YXLH_BuffTime>=3	--野性狼魂 BUFF时间>=3秒
		)
		or
		(
			Text=="4狼"
			and
			IsPlayerSpell(262624)	--已学 元素之灵
			and
			WolfSum>=4	--野性狼魂 数量>=4
		)
		or
		(
			Text=="单体"
			and
			(
				BuffCount_XWWQ>=8	--漩涡武器 层数>=8
				and
				(
					WolfSum>=2	--野性狼魂 数量>=2
					or
					not IsPlayerSpell(262624)	--没学 元素之灵
				)
			)
		)
		or
		(
			(
				Text=="A填"
				or
				(
					Text=="A满"
					and
					BuffCount_XWWQ>=10	--漩涡武器 层数>=10
				)
			)
			and
			(
				not IsPlayerSpell(262624)	--没学 元素之灵
				or
				(
					IsPlayerSpell(262624)	--已学 元素之灵
					and
					(
						WR_GetSpellCharges("元素冲击")>=2	--可用次数>=2
						or
						WR_GetSpellNextCharge("元素冲击")<=GCD+1	--下一个GCD+1秒充能满层
						or
						WolfSum>=2	--野性狼魂 数量>=2
					)
				)
			)
			and
			(
				not IsPlayerSpell(334308)	--没学 毁灭风暴
				or
				HUCountRangeAOE<=3 --敌人数量<=3
			)
		)
		then
			if WR_ColorFrame_Show("CSP",Text.."冲击") then return true end
		end
	end
	return false
end

--闪电箭
function WR_ShamanEnhancement_SDJ(Unit,Text)
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF4",Text.."电箭T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CF12",Text.."电箭M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF8",Text.."电箭P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF9",Text.."电箭P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("SF10",Text.."电箭P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("SF11",Text.."电箭P4T") then return true end
		end
	end
	return false
end

--施法过程 闪电箭
function WR_ShamanEnhancement_Function_SDJ(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("闪电箭") then return false end	--技能不可用
	if BuffCount_XWWQ<5 then return false end	--漩涡武器层数<5(无法顺发)
	
	if
	(
		Text=="单1"
		and
		BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
	)
	or
	(
		Text=="单始"
		and
		SYZC_BuffTime>GCD	--始源之潮 BUFF存在
		and
		BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
		and
		WR_GetUnitBuffTime("player","碎裂元素")<=GCD	--碎裂元素 BUFF不存在
	)
	or
	(
		Text=="单体"
		and
		SYZC_BuffTime<=GCD	--始源之潮 BUFF不存在
		and
		(
			BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
			or
			IsPlayerSpell(384411)	--已学 静电积聚
		)
	)
	or
	(
		Text=="单填"
		and
		IsPlayerSpell(334195)	--已学 冰雹
		and
		SYZC_BuffTime<=GCD	--始源之潮 BUFF不存在
	)
	or
	(
		Text=="超荷"
		and
		IsPlayerSpell(455110)	--已学 超荷充能
		and
		BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
	)
	or
	(
		Text=="单改"
		and
		LastSpell=="闪电链"	--上一个技能是闪电链
		and
		WR_GetUnitBuffTime("player","升腾")>WR_GetGCD("风切")+GCD+MaxGCD+0.2	--升腾BUFF时间>风切冷却时间+当前GCD+最大GCD+0.2缓冲延迟
	)
	or
	(
		Text=="始源"
		and
		(
			LYZJCountRangeAOE==HUCountRangeAOE	--烈焰震击 BUFF数量==附近敌人数量
			or
			LYZJCountRangeAOE==6	--烈焰震击 BUFF数量==6
		)
		and
		SYZC_BuffTime>GCD	--始源之潮 BUFF存在
		and
		BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
		and
		WR_GetUnitBuffTime("player","碎裂元素")<=GCD	--碎裂元素 BUFF不存在
	)
	then
		if WR_ShamanEnhancement_SDJ(BeatUnit_YLZ,Text) then return true end
	end

	return false
end

--狂风怒号
function WR_ShamanEnhancement_KFNH(Unit,Text)
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF4",Text.."怒号T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CF12",Text.."怒号M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("SF8",Text.."怒号P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("SF9",Text.."怒号P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("SF10",Text.."怒号P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("SF11",Text.."怒号P4T") then return true end
		end
	end
	return false
end

--施法过程 狂风怒号
function WR_ShamanEnhancement_Function_KFNH(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("狂风怒号") then return false end	--技能不可用
	if BuffCount_XWWQ<5 then return false end	--漩涡武器层数<5(无法顺发)
	
	if
	(
		Text=="满层"
		and
		(
			BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
			or
			(
				KFNH_BuffCount>=2	--狂风怒号 BUFF层数>=2
				and
				WR_GetUnitBuffCount("player","觉醒风暴")>=2	--觉醒风暴 BUFF层数>=2
			)
		)
	)
	or
	(
		Text=="单体"
		and
		(
			(
				BuffCount_XWWQ>=6	--漩涡武器 BUFF层数
				and
				IsPlayerSpell(262624)	--已学 元素之灵
				and
				IsPlayerSpell(117014)	--已学 元素冲击
			)
			or
			(
				BuffCount_XWWQ>=7	--漩涡武器 BUFF层数
				and
				(
					IsPlayerSpell(262624)	--已学 元素之灵
					or
					IsPlayerSpell(117014)	--已学 元素冲击
				)
			)
			or
			(
				BuffCount_XWWQ>=8	--漩涡武器 BUFF层数
				and
				not IsPlayerSpell(262624)	--没学 元素之灵
				and
				not IsPlayerSpell(117014)	--没学 元素冲击
			)
		)
	)
	or
	(
		Text=="8层"
		and
		BuffCount_XWWQ>=8	--漩涡武器 BUFF层数>=8
	)
	or
	Text=="5层"
	then
		if WR_ShamanEnhancement_KFNH(BeatUnit_YLZ,Text) then return true end
	end

	return false
end

--闪电链
function WR_ShamanEnhancement_SDL(Unit,Text)
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF11",Text.."电链T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("ASF9",Text.."电链M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("ASF11",Text.."电链P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("ASF12",Text.."电链P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("ACF9",Text.."电链P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("ACF10",Text.."电链P4T") then return true end
		end
	end
	return false
end

--施法过程 闪电链
function WR_ShamanEnhancement_Function_SDL(Text)
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("闪电链") then return false end	--技能不可用
	if BuffCount_XWWQ<5 then return false end	--漩涡武器层数<5(无法顺发)
	if WR_GetUnitBuffTime("player","狂风怒号")>GCD then return false end	--狂风怒号 BUFF存在
	
	if Text=="5层"
	or
	(
		Text=="满层"
		and
		BuffCount_XWWQ>=10	--漩涡武器 BUFF层数>=10
	)
	or
	(
		Text=="弧形"
		and
		WR_GetUnitBuffTime("player","弧形放电")>GCD	--弧形放电 BUFF存在
	)
	then
		if WR_ShamanEnhancement_SDL(BeatUnit_YLZ,Text) then return true end
	end
	return false
end

--战栗图腾
function WR_ShamanEnhancement_ZLTT()
	if IsPlayerSpell(8143)	--已学 战栗图腾
	and WR_SpellUsable("战栗图腾")	--技能可用
	and
	(
		UnitCastingInfo("boss1")=="憎恨之容"
		or
		UnitCastingInfo("boss2")=="憎恨之容"
	)
	then
		if WR_ColorFrame_Show("CSU","战栗图腾") then return true end
	end
	return false
end