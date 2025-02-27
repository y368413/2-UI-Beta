--守护运行库
function WR_DruidGuardian()
	if GetSpecialization()~=3 then	--如果不是守护(3)专精，则不执行该运行库
		return
	end
	
	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.SH_SFSD*0.05
		
		if UnitAffectingCombat("player")==false then
		--不在战斗中
			LastSpell=""
		end
		
		PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得当前血量比例
		
		GCD=WR_GetGCD("野性印记")	--获得公共冷却剩余时间或者当前施法剩余时间
		PartyLostHP=WR_PartyLostHP("愈合")	--获得全队平均掉血百分比

		HUCountRange8=WR_GetRangeHarmUnitCount(8,false)
		TargetRange = WR_GetUnitRange("target")	--获得目标距离
		TargetInCombat=WR_TargetInCombat("target")	--目标在战斗
		TargetCloseRange = C_Spell.IsSpellInRange("重殴","target") or C_Spell.IsSpellInRange("裂伤","target")
		
		BuffTime_HS,BuffCount_HS,BuffSum_HS=WR_GetUnitBuffInfo("player","化身：乌索克的守护者")	--获得化身：乌索克的守护者Buff信息
		BuffTime_TZ,BuffCount_TZ,BuffSum_TZ=WR_GetUnitBuffInfo("player","铁鬃")	--获得铁鬃Buff信息
		BuffTime_JYYLZ,BuffCount_JYYLZ,BuffSum_JYYLZ=WR_GetUnitBuffInfo("player","尖牙与利爪")	--获得 尖牙与利爪 Buff信息
		BuffTime_372015,BuffCount_372015,BuffSum_372015=WR_GetUnitBuffInfo("player",372015)	--获得 恶性循环 Buff信息
		
		TargetDeBuffTime_TJ,TargetDeBuffCount_TJ,TargetDeBuffSum_TJ=WR_GetUnitDebuffInfo("target","痛击",true)	--获得痛击DeBuff信息
		
		SmallMagicTime,BigMagicTime,SmallPhysicalTime,BigPhysicalTime=WR_TankResist()	--坦克减伤,返回值,小法术时间,大法术时间,小物理时间,大物理时间
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.SH_ZNJD) then return end	--智能焦点
	
	if WR_DruidGuardian_JS() then return end	--熊 减伤
	
	if WR_Druid_SPS() then return end	--树皮术
	
	if WR_Druid_SCBN() then return end	--生存本能
	
	if WR_DruidGuardian_CSZZN() then return end	--沉睡者之怒
	
	if WR_Druid_GL() then return end	--甘霖
	
	if WRSet.SH_SP1>=3 then
		if WR_ShiPin(1,WRSet.SH_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.SH_SP2>=3 then
		if WR_ShiPin(2,WRSet.SH_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Druid_ZLS() then return end	--治疗石
	
	if WR_Druid_ZLYS() then return end	--治疗药水
	
	if WR_DruidGuardian_XXT() then return end	--施法过程 熊形态
	
	if WR_Druid_Function_YTTJ() then return end	--施法过程 迎头痛击
	
	if WR_Druid_Function_FS() then return end	--施法过程 复生

	if WR_Druid_Function_DHPX() then return end	--施法过程 夺魂咆哮

	if WR_Druid_Function_AF() then return end	--施法过程 安抚

	if WR_Druid_Function_YXYJ() then return end	--施法过程 野性印记

	if WR_Druid_Function_XM() then return end	--施法过程 休眠

	if WR_Druid_Function_QCFS() then return end	--施法过程 清除腐蚀

	if WR_DruidGuardian_KBHF() then return end	--施法过程 狂暴回复

	if WR_DruidGuardian_YH() then return end	--施法过程 愈合

	if WRSet.SH_SP1<=2 then
		if WR_ShiPin(1,WRSet.SH_SP1) then return true end	--饰品 常驻/爆发
	end
	if WRSet.SH_SP2<=2 then
		if WR_ShiPin(2,WRSet.SH_SP2) then return true end	--饰品 常驻/爆发
	end
	
	if not WRSet.SH_NotADD	--防ADD未开启
	or WR_TargetInCombat("target")	--目标战斗中
	then
		if WR_DruidGuardian_MYPZ() then return true end	--明月普照
		if WR_DruidGuardian_FS() then return true end	--粉碎
		if WR_DruidGuardian_ZO("毁灭") then return true end	--毁灭
		if WR_DruidGuardian_GL() then return true end	--割裂
		if WR_DruidGuardian_XL() then return true end	--斜掠
		if WR_DruidGuardian_TJ() then return true end	--痛击
		if WR_DruidGuardian_YHS("星河守护者") then return true end	--高亮 月火术
		if WR_DruidGuardian_LS() then return true end	--裂伤
		if WR_DruidGuardian_YHS("DOT") then return true end	--月火术
		
		if BuffCount_JYYLZ>=2	--尖牙与利爪 BUFF层数>=2
		or not IsPlayerSpell(441583)	--没学毁灭(无需留层数给毁灭)
		or BuffTime_JYYLZ<=GCD+6	--尖牙与利爪 BUFF时间<=6秒
		then
			if HUCountRange8==1 or not IsPlayerSpell(400254) then --单位数量==1 或者 没学 摧折
				if WR_DruidGuardian_ZO("免费") then return true end	--重殴
			elseif HUCountRange8>=2 then --单位数量>=2
				if WR_DruidGuardian_CZ("免费") then return true end	--摧折
			end
		end
		
		if WR_DruidGuardian_YHS("朔望") then return true end	--月火术 减明月普照CD
		if WR_DruidGuardian_HS() then return true end	--横扫
	end

	if WR_DruidFeral_TZ() then return true end	--铁鬃

	if WR_Function_ZNMB(2,WRSet.SH_ZNMB) then return true end	--智能目标

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
end


	
--沉睡者之怒
function WR_DruidGuardian_CSZZN()
	--沉睡者之怒
	if WRSet.SH_CSZZN~=10 --沉睡者之怒 开启
	and WR_SpellUsable("沉睡者之怒") --技能可用
	and PlayerHP<WRSet.SH_CSZZN/10 --血量比例
	and UnitAffectingCombat("player") --战斗中
	then
		if WR_ColorFrame_Show("CF4","沉睡者之怒") then return true end
	end
	return false
end

--熊形态
function WR_DruidGuardian_XXT()
	if IsPlayerSpell(5487)	--已学 熊形态
	and WR_GetUnitBuffTime("player","熊形态")==0 --熊形态 不存在
	and
	(
		WR_GetUnitBuffTime("player",441685)<=GCD+1 --兽形精通 BUFF时间<=最后1个GCD
		or
		UnitPower("player",4)<5 --5星割裂
	)
	then
		if WR_ColorFrame_Show("CF7","熊形态") then return true end
	end
	return false
end

--狂暴回复
function WR_DruidGuardian_KBHF()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	
	if WR_SpellUsable("狂暴回复") --技能可用
	and WRSet.SH_KBHF~=8 --狂暴回复 开启
	and PlayerHP<=WRSet.SH_KBHF/10 --血量<-狂暴回复设定值
	and WR_GetUnitBuffInfo("player","狂暴回复")==0 --狂暴回复 BUFF不存在
	then
		if WR_ColorFrame_Show("CF5","狂暴回复") then return true end
	end
	return false
end

--愈合
function WR_DruidGuardian_YH()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	
	if WR_SpellUsable("愈合") --技能可用
	and WR_GetUnitBuffInfo("player","塞纳留斯的梦境")~=0 --塞纳留斯的梦境 BUFF存在
	then
		if PlayerHP<=0.7 then --玩家血量<=70%
			if WR_ColorFrame_Show("SF6","愈合") then return true end
		elseif WR_GetUnitHP("party1")<=0.5 and not UnitIsDead("party1") and IsSpellInRange("愈合","party1") then
			if WR_ColorFrame_Show("CSF8","愈合P1") then return true end
		elseif WR_GetUnitHP("party2")<=0.5 and not UnitIsDead("party2") and IsSpellInRange("愈合","party2") then
			if WR_ColorFrame_Show("CSF9","愈合P2") then return true end
		elseif WR_GetUnitHP("party3")<=0.5 and not UnitIsDead("party3") and IsSpellInRange("愈合","party3") then
			if WR_ColorFrame_Show("ACN0","愈合P3") then return true end
		elseif WR_GetUnitHP("party4")<=0.5 and not UnitIsDead("party4") and IsSpellInRange("愈合","party4") then
			if WR_ColorFrame_Show("AN8","愈合P4") then return true end
		end
	end
	return false
end

--痛击
function WR_DruidGuardian_TJ(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable(77758) then return false end	--技能不可用
	if HUCountRange8==0 then return false end	--附近没敌人
	
	if Text=="DOT" and TargetCloseRange and UnitCanAttack("player","target") and ( TargetDeBuffCount_TJ<5 or TargetDeBuffTime_TJ<3.39 ) then --痛击层数<5层 或 痛击时间<3.39秒
		if WR_ColorFrame_Show("CSH","痛击DOT") then return true end
	else
		if WR_ColorFrame_Show("CSH","痛击") then return true end
	end

	return false
end
	
--裂伤
function WR_DruidGuardian_LS(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("裂伤")	--技能可用
	and TargetCloseRange	--目标在近战距离
	then
		if WR_ColorFrame_Show("CSY","裂伤") then return true end
	end
	return false
end
	
--摧折
function WR_DruidGuardian_CZ(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("摧折") then return false end	--技能不可用

	if
	Text==nil
	or
	(
		Text=="免费"
		and
		BuffTime_JYYLZ>GCD	--尖牙与利爪 BUFF存在
	)
	then
		if WR_ColorFrame_Show("SF7","摧折") then return true end
	end
	return false
end
	
--横扫
function WR_DruidGuardian_HS(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	
	if WR_SpellUsable("横扫") --技能可用
	and TargetCloseRange	--目标在近战范围内
	and BuffTime_HS==0 --化身不存在
	then
		if WR_ColorFrame_Show("CSB","横扫") then return true end
	end
	return false
end
	
--粉碎
function WR_DruidGuardian_FS(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	
	if zhandoumoshi==1	--开爆发
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("粉碎") --技能可用
	and WR_GetUnitDebuffCount("target","痛击",true)>=2	--目标身上有2层痛击
	then
		if WR_ColorFrame_Show("CF12","粉碎") then return true end
	end
	return false
end
	
--月火术
function WR_DruidGuardian_YHS(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if WR_GetUnitBuffTime("player","熊形态")==0 then return false end --熊形态 不存在
	
	if WR_SpellUsable("月火术") --技能可用
	and IsSpellInRange("月火术","target") --技能范围内
	and UnitCanAttack("player","target") --目标是敌对的
	and ( TargetRange<=20 or TargetInCombat )	--目标在20码内 或 目标在战斗中
	then
		if Text=="星河守护者" then
			if WR_GetUnitBuffTime("player","星河守护者")>GCD then
				if WR_ColorFrame_Show("CSL","星河月火") then return true end
			end
		elseif Text=="DOT" then
			if WR_GetUnitDebuffInfo("target","月火术",true)<4.1 then --目标 月火术 BUFF时间<4.1
				if WR_ColorFrame_Show("CSL","月火DOT") then return true end
			end
		elseif Text==nil then
			if WR_ColorFrame_Show("CSL","月火") then return true end
		elseif Text=="朔望"
		and IsPlayerSpell(429539)	--已学 朔望
		and IsPlayerSpell(204066)	--已学 明月普照
		then
			if WR_ColorFrame_Show("CSL","朔望月火") then return true end
		end
	end
	return false
end
	
--重殴
function WR_DruidGuardian_ZO(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("重殴") then return false end --技能不可用
	if not TargetCloseRange then return false end	--目标不在近战范围内
	
	if
	(
		Text==nil
		and
		(
			BuffCount_JYYLZ>=2 --尖牙与利爪 BUFF层数>=2
			or
			( BuffTime_JYYLZ>GCD and BuffTime_JYYLZ<2 )	--尖牙与利爪 BUFF时间剩下2秒
			or
			BuffCount_372015>=3 --恶性循环 BUFF层数>=3
			or
			UnitPower("player",1)>=50 --怒气 >= 50
		)
	)
	or
	(
		Text=="免费"
		and
		BuffTime_JYYLZ>GCD	--尖牙与利爪 BUFF存在
	)
	or
	(
		Text=="毁灭"
		and
		WR_GetUnitBuffInfo("player",441602)>GCD	--毁灭 BUFF存在
	)
	then
		if WR_ColorFrame_Show("ASF5","重殴" .. (Text or "")) then return true end
	end
	return false
end
	
--割裂
function WR_DruidGuardian_GL(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("割裂") then return false end --技能不可用
	
	if HUCountRange8==1 --8码单位数量==1
	and TargetCloseRange	--目标在近战范围内
	and UnitPower("player",4)>=5 --5星割裂
	and
	(
		IsPlayerSpell(449193)	--已学 自如变形
		or
		WR_GetUnitBuffTime("player","猎豹形态")>0	--猎豹形态
	)
	then
		if WR_ColorFrame_Show("CSJ","割裂") then return true end
	end
	return false
end
	
--斜掠
function WR_DruidGuardian_XL(Text)
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("斜掠") then return false end --技能不可用
	
	if HUCountRange8==1 --8码单位数量==1
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffCount("player","灵猫潜能")>=6	--灵猫潜能 BUFF层数>=6
	and
	(
		IsPlayerSpell(449193)	--已学 自如变形
		or
		WR_GetUnitBuffTime("player","猎豹形态")>0	--猎豹形态
	)
	then
		if WR_ColorFrame_Show("AN9","斜掠") then return true end
	end
	return false
end

--铁鬃 
function WR_DruidFeral_TZ()
	if WR_SpellUsable("铁鬃") --技能可用
	and HUCountRange8>=1 --单位数量>=1
	and
	(
		WR_GetUnitBuffInfo("player",441602)<=GCD	--毁灭 BUFF不存在
		or
		BuffCount_JYYLZ>=1 --尖牙与利爪 BUFF层数>=1
	)
	and
	(
		UnitPower("player",1)>=50 --怒气
		or
		(
			BuffTime_HS>0	--化身存在
			and
			IsPlayerSpell(50334)	--已学 狂暴：刚毅
			and
			UnitPower("player",1)>=30 --怒气
		)
		or
		(
			WR_GetUnitBuffTime("player","血污毛皮")>0	--血污毛皮 存在
			and
			UnitPower("player",1)>=40 --怒气
		)
		or
		(
			BuffTime_HS>0	--化身存在
			and
			IsPlayerSpell(50334)	--已学 狂暴：刚毅
			and
			WR_GetUnitBuffTime("player","血污毛皮")>0	--血污毛皮 存在
			and
			UnitPower("player",1)>=25 --怒气
		)
	)
	and
	(
		(
			WRSet.SH_TZ<=10 --设置层数<=10
			and
			BuffCount_TZ<WRSet.SH_TZ --铁鬃层数<设置层数
		)
		or
		(
			WRSet.SH_TZ==11 --设置层数==11
			and
			(
				(
					HUCountRange8<=8 --单位数量<=8
					and
					(
						BuffCount_TZ<(1-PlayerHP)*10 --铁鬃层数<损失血量百分比*10
						or
						BuffCount_TZ<HUCountRange8 --铁鬃层数<单位数量
					)
				)
				or
				(
					HUCountRange8>8 --单位数量>8
					and
					BuffCount_TZ<8 --铁鬃层数<8
				)
			)
		)
	)
	then
		if WR_ColorFrame_Show("SF10","铁鬃") then return true end
	end
	return false
end
	
--明月普照
function WR_DruidGuardian_MYPZ(Text)
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --爆发
	and TargetCloseRange	--目标在近战距离
	and WR_SpellUsable("明月普照")	--技能不可用
	and not WR_PlayerMove() --没有移动
	and
	(
		WR_GetRangeAvgDeathTime(30)>10	--范围存活时间>10秒
		or
		WR_InBossCombat()	--BOSS战
	)
	then
		if WR_ColorFrame_Show("SF8","明月普照") then return true end
	end
	return false
end

--施法过程 减伤
function WR_DruidGuardian_JS()
	if WRSet.SH_QZJS	--前置减伤 开启
	and UnitAffectingCombat("player") --单位战斗中
	and BuffTime_HS==0 --化身：乌索克的守护者 BUFF不存在
	and WR_GetUnitBuffTime("player","树皮术")==0 --树皮术 BUFF不存在
	and WR_GetUnitBuffTime("player","生存本能")==0 --生存本能 BUFF不存在
	and WR_GetUnitBuffTime("player","沉睡者之怒")==0 --沉睡者之怒 BUFF不存在
	and
	(
		BigMagicTime<=1.5 --大法术减伤时间
		or
		BigPhysicalTime<=1.5 --大物理减伤时间
	)
	then
		if WRSet.SH_SPS~=10	--树皮术 没有禁用
		and WR_SpellUsable("树皮术")	--技能可用
		then
			if WR_ColorFrame_Show("CF3","树皮术") then return true end
		end
		
		if WRSet.SH_SCBN~=6	--生存本能 没有禁用
		and WR_SpellUsable("生存本能")	--技能可用
		then
			if WR_ColorFrame_Show("SF4","生存本能") then return true end
		end
		
		if WRSet.SH_CSZZN~=10 --沉睡者之怒 开启
		and WR_SpellUsable("沉睡者之怒") --技能可用
		then
			if WR_ColorFrame_Show("CF4","沉睡者之怒") then return true end
		end
	end
	
	return false
end