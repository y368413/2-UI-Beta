--奶骑运行库
function WR_PaladinHoly()
	if GetSpecialization()~=1 then	--如果不是奶骑(1)专精，则不执行该运行库
		return
	end

	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		WRSet.NQ_FBQD=3
		ShiFaSuDu=0.05+WRSet.NQ_SFSD*0.05
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
		--WR_Initialize()	--初始化
		FocusHP=1
		if UnitExists("focus") then
			FocusHP=UnitHealth("focus")/UnitHealthMax("focus")	--获得焦点血量比例
		end
		
		HolyPower=UnitPower("player",9)	--获得神圣能量的数量

		PlayerInCombat=UnitAffectingCombat("player") --玩家在战斗中
		
		FocusRange=WR_GetUnitRange("focus")	--焦点距离
		
		FocusMustheal=WR_Mustheal("focus")	--获得焦点是否必须治愈
		
		TargetCloseRange = C_Spell.IsSpellInRange("十字军打击","target") or C_Spell.IsSpellInRange("责难","target")
		TargetInCombat=WR_TargetInCombat("target")	--获得目标可以攻击
		TargetRange=WR_GetUnitRange("target")	--获得目标距离
		
		RaidOrParty=WR_GetInRaidOrParty() --获得自己是在小队还是在团队
		
		if WR_GetUnitBuffInfo("player","璀璨旭日")>0 then --璀璨旭日 BUFF存在
			SSZJ_Multiplier=3	--获得神圣震击的乘数
		else
			SSZJ_Multiplier=1	--获得神圣震击的乘数
		end
		
		ResistOutburst2S=WR_ResistOutburstTime()<=2	--尖刺型伤害，施法时间剩余2秒
		ResistSustained=WR_ResistSustained()	--持续型伤害存在，血量百分比低于0.9
		
		for i=1,4,1 do 
			local TempUnit="party"..i
			if UnitExists(TempUnit)	--单位存在
			and UnitName(TempUnit)~=nil	--单位名称存在
			then
				if NQ_SGDB_menuItems[i].text~=UnitName(TempUnit) then	--如果列表指定选项文本不等于当前单位名称
					NQ_SGDB_UpdateMenuItemText(i, UnitName(TempUnit))	--给 圣光道标 下拉菜单更新文本
					NQ_XYDB_UpdateMenuItemText(i, UnitName(TempUnit))	--给 圣光道标 下拉菜单更新文本
				end
			else
				if NQ_SGDB_menuItems[i].text~="" then	--如果列表指定选项文本不等于当前单位名称
					NQ_SGDB_UpdateMenuItemText(i, "")	--给 圣光道标 下拉菜单更新文本
					NQ_XYDB_UpdateMenuItemText(i, "")	--给 圣光道标 下拉菜单更新文本
				end
			end
		end
		if NQ_SGDB_menuItems[5].text~=UnitName("player") then	--如果列表指定选项文本不等于当前单位名称
			NQ_SGDB_UpdateMenuItemText(5, UnitName("player"))	--给 圣光道标 下拉菜单更新文本
			NQ_XYDB_UpdateMenuItemText(5, UnitName("player"))	--给 圣光道标 下拉菜单更新文本
		end
		
		_,_,Paladin_SSJB = GetSpellInfo(432459)	--获得神圣军备是哪一种
		if Paladin_SSJB == 5927637 then	--圣洁武器
			Paladin_SSJB="圣洁武器"
		else
			Paladin_SSJB="神圣壁垒"
		end
		
		WR_PaladinHolyHeal() --获得治疗效果
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if MSG==1 then
		print("----------")
	end
	
	--施法过程 优先检查
	if WR_PriorityCheck() then return true end

	--施法过程 虔诚光环
	if WR_Paladin_Function_QCGH() then return true end

	--施法过程 圣盾术
	if WR_Paladin_Function_SDS() then return true end
	
	--施法过程 圣疗术
	if WR_Paladin_Function_SLS() then return true end
	
	--施法过程 圣佑术
	if WR_Paladin_Function_SYS() then return true end
	
	--施法过程 责难
	if WR_Paladin_Function_ZN() then return true end
	
	if WRSet.NQ_SP1>=3 then
		if WR_ShiPin(1,WRSet.NQ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.NQ_SP2>=3 then
		if WR_ShiPin(2,WRSet.NQ_SP2) then return true end	--饰品 自保/协助
	end
	
	--施法过程 治疗石
	if WR_Paladin_Function_ZLS() then return true end
	
	--施法过程 治疗药水
	if WR_Paladin_Function_ZLYS() then return true end
	
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
	
	--施法过程 清洁术
	if WR_Paladin_Function_QDS_QJS() then return true end
	
	--施法过程 道标
	if WR_PaladinHoly_Function_DB() then return true end
	
	--施法过程 宽恕
	if WR_PaladinHoly_Function_KS() then return true end
	
	if WR_PaladinHoly_SYJL() then return true end	--施法过程 圣言祭礼
	
	if TargetCloseRange and TargetInCombat then	--目标在近战 并且 目标战斗中
		if WRSet.NQ_SP1==1 then
			if WR_ShiPin(1,WRSet.NQ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.NQ_SP2==1 then
			if WR_ShiPin(2,WRSet.NQ_SP2) then return true end	--饰品 常驻
		end
	end
	
	if WR_PaladinHoly_Function_MDDB() then return true end	--美德道标
	if WR_PaladinHoly_Function_BaoFa() then return true end	--爆发
	
	--神圣军备
	if zhandoumoshi==1	--爆发 开启
	and IsPlayerSpell(432459)	--已学神圣军备
	and WR_SpellUsable(432459)	--技能可用
	and TargetRange<=4	--单位距离
	then
		if Paladin_SSJB=="圣洁武器"
		and WR_GetUnitBuffTime("player","圣洁武器")<=6	--圣洁武器 BUFF时间<=6秒(20*30%)
		then
			if WR_ColorFrame_Show("CSL","圣洁武器") then return true end
		elseif Paladin_SSJB=="神圣壁垒" then
			if WR_ColorFrame_Show("CSL","神圣壁垒") then return true end
		end
	end
	
	if WR_PaladinHoly_Function_SJZF() then return true end	--四季祝福
	if WR_PaladinHoly_Function_SSLJ() then return true end	--神圣棱镜
	if WR_PaladinHoly_Function_SJMZ() then return true end	--圣洁鸣钟
	if WR_FocusMaxWeightUnit() then return end	--焦点最高权重单位
	if WR_PaladinHoly_Function_LMZG() then return true end	--黎明之光
	if WR_PaladinHoly_Function_RYSL() then return true end	--荣耀圣令
	
	if WR_PaladinHoly_Function_SZJDJ("复仇十字军") then return true end	--十字军打击
	if WR_PaladinHoly_Function_SP("复仇十字军") then return true end	--审判
	
	if WR_PaladinHoly_Function_XYPZ() then return true end	--信仰屏障
	if WR_PaladinHoly_Function_SP("槌砧战术") then return true end	--审判
	if WR_PaladinHoly_Function_SSZJ_Focus() then return true end	--神圣震击F
	
	if WR_PaladinHoly_Function_SZJDJ("十字军之力") then return true end	--十字军打击 十字军之力
	if WR_PaladinHoly_Function_FNZC() then return true end	--愤怒之锤
	if WR_PaladinHoly_Function_SZJDJ() then return true end	--十字军打击
	if WR_PaladinHoly_Function_SP() then return true end	--审判
	if WR_PaladinHoly_Function_ZYDJ() then return true end	--正义盾击
	if WR_PaladinHoly_Function_SSZJ_Damage() then return true end	--震击T
	if WR_PaladinHoly_Function_FX() then return true end	--奉献
	if WR_Paladin_Function_ZNMB() then return end	--智能目标
	
	if WR_PaladinHoly_Function_SGSX() then return true end	--圣光闪现
	

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--道标
function WR_PaladinHoly_DB(Unit)
	if not(UnitIsDead(Unit))	--单位没有死亡
	and WR_GetUnitRange(Unit)<=60	--技能距离
	and WR_GetUnitBuffInfo(Unit,"圣光道标")==0	--单位没有 圣光道标 BUFF
	and WR_GetUnitBuffInfo(Unit,"信仰道标")==0	--单位没有 信仰道标 BUFF
	then
		return true
	end
	return false
end

--施法过程 道标
function WR_PaladinHoly_Function_DB()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if not IsPlayerSpell(200025) then
	--没有学 美德道标
		if WRSet.NQ_SGDB==1 and WR_PaladinHoly_DB("party1") then
			if WR_ColorFrame_Show("ASF1","圣标P1") then return true end
		end
		if WRSet.NQ_SGDB==2 and WR_PaladinHoly_DB("party2") then
			if WR_ColorFrame_Show("ASF2","圣标P2") then return true end
		end
		if WRSet.NQ_SGDB==3 and WR_PaladinHoly_DB("party3") then
			if WR_ColorFrame_Show("ASF3","圣标P3") then return true end
		end
		if WRSet.NQ_SGDB==4 and WR_PaladinHoly_DB("party4") then
			if WR_ColorFrame_Show("ASF5","圣标P4") then return true end
		end
		if WRSet.NQ_SGDB==5 and WR_PaladinHoly_DB("player") then
			if WR_ColorFrame_Show("ASF11","圣标P") then return true end
		end
	end
	
	if IsPlayerSpell(156910) then
	--信仰道标 已学
		if WRSet.NQ_XYDB==1 and WR_PaladinHoly_DB("party1") then
			if WR_ColorFrame_Show("ASF6","信标P1") then return true end
		end
		if WRSet.NQ_XYDB==2 and WR_PaladinHoly_DB("party2") then
			if WR_ColorFrame_Show("ASF7","信标P2") then return true end
		end
		if WRSet.NQ_XYDB==3 and WR_PaladinHoly_DB("party3") then
			if WR_ColorFrame_Show("ASF8","信标P3") then return true end
		end
		if WRSet.NQ_XYDB==4 and WR_PaladinHoly_DB("party4") then
			if WR_ColorFrame_Show("ASF9","信标P4") then return true end
		end
		if WRSet.NQ_XYDB==5 and WR_PaladinHoly_DB("player") then
			if WR_ColorFrame_Show("ASF12","信标P") then return true end
		end
	end
	
	return false
end

--施法过程 宽恕
function WR_PaladinHoly_Function_KS()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if not(PlayerInCombat)	--玩家不在战斗中
	and FocusHP>=0.7	--目标血量比例
	and WR_ResurrectParty()	--有可以复活的队友
	and not WR_StopCast(WR_GetTrueCastTime("宽恕"))	--避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("CSJ","宽恕") then return true end
	end
	return false
end

--施法过程 爆发
function WR_PaladinHoly_Function_BaoFa()
	if zhandoumoshi==1	--开爆发
	and UnitCastingInfo("player")~="提尔的拯救"	--没在施法 提尔的拯救
	and WR_GetUnitBuffTime("player","复仇之怒")==0	--复仇之怒 BUFF不存在
	and WR_GetUnitBuffInfo("player","提尔的拯救")==0	--提尔的拯救 BUFF不存在
	and WR_GetUnitBuffInfo("player","光环掌握")==0	--光环掌握 BUFF不存在
	and WR_GetUnitBuffInfo("player","复仇十字军")==0	--复仇十字军 BUFF不存在
	then
		if WRSet.NQ_SP1==2 then
			if WR_ShiPin(1,WRSet.NQ_SP1) then return true end	--饰品 爆发
		end
		if WRSet.NQ_SP2==2 then
			if WR_ShiPin(2,WRSet.NQ_SP2) then return true end	--饰品 爆发
		end
	
		--复仇之怒
		if WRSet.NQ_FCZN==1	--复仇之怒 开启
		and not IsPlayerSpell(216331) --没学 复仇十字军
		and WR_SpellUsable("复仇之怒")	--技能可用
		then
			if WR_ColorFrame_Show("SF11","复仇之怒") then return true end
		end
	
		--复仇十字军
		if WRSet.NQ_FCZN==1	--复仇之怒 开启
		and IsPlayerSpell(216331) --复仇十字军
		and WR_SpellUsable("复仇十字军")	--技能可用
		then
			if WR_ColorFrame_Show("SF11","复仇十字军") then return true end
		end

		--光环掌握
		if WRSet.NQ_GHZW==1	--光环掌握 开启
		and WR_SpellUsable("光环掌握")	--技能可用 资源可用
		then
			if WR_ColorFrame_Show("SF12","光环掌握") then return true end
		end

		--提尔的拯救
		if GCD<=ShiFaSuDu
		and WRSet.NQ_TEDZJ==1	--提尔的拯救 开启
		and WR_SpellUsable("提尔的拯救")	--技能可用 资源可用
		and not PlayerMove	--没移动
		then
			if WR_ColorFrame_Show("CF5","提尔的拯救") then return true end
		end
	end
	return false
end

--施法过程 美德道标
function WR_PaladinHoly_Function_MDDB()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if RaidOrParty=="single" then return false end	--个人的时候不用
	
	if WR_SpellUsable("美德道标")	--技能可用
	and
	(
		(
			RaidOrParty=="raid"	--在团队
			and
			WR_RangeCountPR(40,0.85)>=5 --低于85%血量的队友数量
		)
		or
		(
			RaidOrParty~="raid"	--不在团队
			and
			WR_RangeCountPR(40,0.85)>=3 --低于85%血量的队友数量
		)
		or
		ResistOutburst2S --尖刺型伤害，施法时间剩余2秒
		or
		ResistSustained	--持续伤害
		or
		zhandoumoshi==1
	)
	then
		if WR_ColorFrame_Show("SF9","美德道标") then return true end
	end
	return false
end

--施法过程 四季祝福
function WR_PaladinHoly_Function_SJZF()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if WR_SpellUsable("仲夏祝福")	--技能可用
	and
	(
		WR_GetRangeAvgDeathTime(40)>=10	--预计战斗结束时间
		or
		InTraining	--在打木桩
	)
	then
		if WR_ColorFrame_Show("CSK","四季祝福") then return true end
	end
	return false
end


--施法过程 圣洁鸣钟
function WR_PaladinHoly_Function_SJMZ()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if WR_SpellUsable("圣洁鸣钟")	--技能可用 资源可用
	and HolyPower<=2	--神圣能量
	and
	(
		(
			RaidOrParty~="raid"	--不在团队
			and
			(
				SJMZ_Sum>=SJMZ*3.5	--圣洁鸣钟治疗量可以获得效果 副本强度：低4倍，中3.5倍，高3倍
				or
				FocusHP<=0.4	--焦点血量
				or
				PlayerHP<=0.4	--玩家血量
			)
		)
		or
		(
			RaidOrParty=="raid"	--在团队
			and
			SJMZ_Sum>=SJMZ*5	--圣洁鸣钟治疗量可以获得效果
		)
	)
	then
		if WR_SpellUsable("美德道标")	--技能可用 资源可用
		then
			if WR_ColorFrame_Show("SF9","美德道标") then return true end
		end
		if WR_ColorFrame_Show("CF3","圣洁鸣钟") then return true end
	end
	return false
end

--施法过程 奉献
function WR_PaladinHoly_Function_FX()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if TargetInCombat	--目标可攻击
	and WR_SpellUsable("奉献")	--技能可用 资源可用
	and TargetCloseRange	--目标在近战范围内
	and WR_GetUnitBuffInfo("player","奉献")==0	--奉献 BUFF不存在
	and not PlayerMove	--没移动
	and
	(
		FocusHP>0.3	--焦点血量
		or
		InTraining	--在打木桩
	)
	then
		if WR_ColorFrame_Show("CSM","奉献") then return true end
	end
	return false
end

--施法过程 黎明之光
function WR_PaladinHoly_Function_LMZG()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if WR_SpellUsable("黎明之光")	--技能可用 资源可用
	and RaidOrParty=="raid"	--在团队
	and
	(
		HolyPower>=3 --神圣能量>=3
		or
		WR_GetUnitBuffTime("player","神圣意志")>0	--神圣意志 BUFF存在
		or
		WR_GetUnitBuffTime("player","闪耀正义")>0	--闪耀正义 BUFF存在
	)
	and WR_RangeCountPR(40,0.98)>=5 --范围数量>=5
	and WR_GetUnitBuffTime("player","苍穹之遗")<=GCD	--苍穹之遗 BUFF不存在	(荣耀圣令送黎明之光)
	and WR_GetUnitBuffCount("player","永恒圣光")<9	--永恒圣光 BUFF<9层	(荣耀圣令得到强化,9层后则不用黎明之光)
	and WR_GetUnitBuffTime("player","美德道标")<=GCD	--美德道标 BUFF不存在
	then
		if WR_ColorFrame_Show("CF7","黎明之光") then return true end
	end
	return false
end

--施法过程 荣耀圣令
function WR_PaladinHoly_Function_RYSL()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if WR_SpellUsable("荣耀圣令")	--技能可用 资源可用
	and FocusRange<=40	--焦点在技能范围内
	and not UnitCanAttack("focus","player")	--单位是友方
	and not UnitIsDead("focus")	--单位没有死亡
	and
	(
		HolyPower>=3	--神圣能量>=3
		or
		WR_GetUnitBuffTime("player","神圣意志")>0	--神圣意志 BUFF存在
		or
		WR_GetUnitBuffTime("player","闪耀正义")>0	--闪耀正义 BUFF存在
	)
	and
	(
		FocusLostHealth>=RYSL	--焦点损失血量>=荣耀圣令治疗量
		or
		FocusMustheal	--单位必须治愈
	)
	then
		if WR_ColorFrame_Show("CF12","荣耀圣令") then return true end
	end
	return false
end

--施法过程 信仰屏障
function WR_PaladinHoly_XYPZ(Unit)
	if WR_GetUnitRange(Unit)<=40 --单位距离
	and
	(
		WR_GetUnitHP(Unit)<0.5 --单位血量
		or ResistSustained --持续AOE
		or ResistOutburst2S --尖刺型AOE
		or WR_UnitAssistDebuff(Unit) --单位需要协助
		or zhandoumoshi==1 --爆发开启
	)
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF6","屏障"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"屏障") then return true end --选择单位过程
	end
	return false
end

--施法过程 信仰屏障
function WR_PaladinHoly_Function_XYPZ()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if not WR_SpellUsable("信仰屏障") then return false end	--技能不可用
	if not UnitAffectingCombat("player") then return false end	--玩家不在战斗

	if WR_PaladinHoly_XYPZ("focus") then return true end
	if WR_PaladinHoly_XYPZ("player") then return true end
	
	local Sum
	if RaidOrParty == "raid" then
		Sum = 20
	elseif RaidOrParty == "party" then
		Sum = 4
	end
	if Sum~=nil then
		for i=1,Sum,1 do
			if WR_PaladinHoly_XYPZ(RaidOrParty..i) then return true end --圣疗术
		end
	end
	return false
end


--施法过程 神圣震击F
function WR_PaladinHoly_Function_SSZJ_Focus()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	
	if WR_SpellUsable("神圣震击")
	and FocusRange<=40 --焦点在技能范围内
	and HolyPower<=5-SSZJ_Multiplier --神圣能量<=5-神圣震击倍数
	and
	(
		FocusLostHealth>=SSZJ*SSZJ_Multiplier --焦点损失血量>=神圣震击*倍数
		or
		(
			WR_GetSpellCharges("神圣震击")>=2 --技能可用次数
			and
			not UnitAffectingCombat("player") --单位没有战斗
		)
	)
	then
		if WR_ColorFrame_Show("CF1","神圣震击F") then return true end
	end
	return false
end

--审判
function WR_PaladinHoly_SP(Unit)
	if WR_TargetInCombat(Unit)	--单位可攻击
	and WR_GetUnitRange(Unit)<=30 --目标距离
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CF4","审判"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"审判") then return true end --焦点单位过程
	end
	return false
end

--施法过程 审判
function WR_PaladinHoly_Function_SP(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("审判")	--技能可用
	and HolyPower<5	--神圣能量<5
	and
	(
		WR_GetUnitBuffInfo("player",414193)<5	--觉醒触发剩下时间<5秒 或者 觉醒不存在
		or
		WR_GetUnitBuffInfo("player","复仇之怒")>GCD	--复仇之怒 BUFF存在
		or
		WR_GetUnitBuffInfo("player","复仇十字军")>GCD	--复仇十字军 BUFF存在
		or
		WR_GetUnitBuffInfo("player","美德道标")>GCD	--美德道标 BUFF存在
	)
	then
		if Text==nil
		or
		(
			Text=="复仇十字军"
			and
			WR_GetUnitBuffInfo("player","复仇十字军")>GCD
		)
		or
		(
			Text=="槌砧战术"
			and
			IsPlayerSpell(433718)	--已学 槌砧战术
		)
		then
			if WR_PaladinHoly_SP("target") then return true end
			for i = 1 , 4 do
			local TempUnit="party"..i.."target"
				if WR_PaladinHoly_SP(TempUnit) then return true end
			end
		end
	end
	return false
end
	
--十字军打击
function WR_PaladinHoly_SZJDJ(Unit)
	if WR_TargetInCombat(Unit)	--单位可攻击
	and C_Spell.IsSpellInRange("十字军打击",Unit)	--单位在技能范围内
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CF9","十字军"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"十字军") then return true end --焦点单位过程
	end
	return false
end
	
--施法过程 十字军打击
function WR_PaladinHoly_Function_SZJDJ(Text)
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("十字军打击")	--技能可用
	and HolyPower<5	--神圣能量<5
	then
		if Text==nil
		or
		(
			Text=="十字军之力"
			and
			IsPlayerSpell(196926)	--已学 十字军之力
		)
		or
		(
			Text=="复仇十字军"
			and
			WR_GetUnitBuffInfo("player","复仇十字军")>GCD
		)
		then
			if WR_PaladinHoly_SZJDJ("target") then return true end
			for i = 1 , 4 do
			local TempUnit="party"..i.."target"
				if WR_PaladinHoly_SZJDJ(TempUnit) then return true end
			end
		end
	end
	return false
end
	
--愤怒之锤
function WR_PaladinHoly_FNZC(Unit)
	if WR_TargetInCombat(Unit)	--单位可攻击
	and WR_GetUnitRange(Unit)<=30 --目标距离
	and 
	(
		WR_GetUnitBuffTime("player","崇圣")>GCD	--崇圣 BUFF存在
		or
		UnitHealth(Unit)/UnitHealthMax(Unit)<0.2 --血量低于20%
	)
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CF8","锤"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"锤") then return true end --焦点单位过程
	end
	return false
end
	
--施法过程 愤怒之锤
function WR_PaladinHoly_Function_FNZC()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("愤怒之锤")	--技能可用
	and HolyPower<5	--神圣能量<5
	then
		if WR_PaladinHoly_FNZC("target") then return true end
		for i = 1 , 4 do
		local TempUnit="party"..i.."target"
			if WR_PaladinHoly_FNZC(TempUnit) then return true end
		end
	end
	return false
end
	
--震击T
function WR_PaladinHoly_SSZJ_Damage(Unit)
	if WR_TargetInCombat(Unit)	--单位可攻击
	and WR_GetUnitRange(Unit)<=40 --目标距离
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CF1","震击"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"震击") then return true end --焦点单位过程
	end
	return false
end
	
--施法过程 震击T
function WR_PaladinHoly_Function_SSZJ_Damage()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("神圣震击")	--技能可用
	and HolyPower<=5-SSZJ_Multiplier	--神圣能量<=5-神圣震击倍数
	and RaidOrParty~="raid"	--不在团队
	and WR_GetSpellCharges("神圣震击")>=2	--可用次数
	then
		if WR_PaladinHoly_SSZJ_Damage("target") then return true end
		for i = 1 , 4 do
		local TempUnit="party"..i.."target"
			if WR_PaladinHoly_SSZJ_Damage(TempUnit) then return true end
		end
	end
	return false
end

--施法过程 正义盾击
function WR_PaladinHoly_Function_ZYDJ()
	if GCD<=ShiFaSuDu
	and TargetInCombat	--目标可攻击
	and WR_SpellUsable("正义盾击")
	and TargetCloseRange	--目标在近战范围内
	and RaidOrParty~="raid"	--不在团队
	and
	(
		HolyPower>=5 --神圣能量>=5
		or
		(
			HolyPower>=3 --神圣能量>=3
			and
			WR_GetUnitBuffInfo("player","圣洁共鸣")>0 --圣洁共鸣BUFF存在
		)
	)
	then
		if WR_ColorFrame_Show("CF6","正义盾击") then return true end
	end
	return false
end

--施法过程 神圣棱镜
function WR_PaladinHoly_Function_SSLJ()
	--神圣棱镜T
	if TargetInCombat --目标可攻击
	and WR_SpellUsable("神圣棱镜")	--技能可用
	and TargetRange<=30 --目标距离
	and
	(
		(
			RaidOrParty~="raid" --不在团队
			and
			SSLJ_Sum>=SSLJ*3.5 --神圣棱镜 治疗量可以获得效果 --副本强度：低4倍，中3.5倍，高3倍
		)
		or
		(
			RaidOrParty=="raid" --在团队
			and
			SSLJ_Sum>=SSLJ*5 --神圣棱镜治疗量可以获得效果
		)
	)
	then
		if UnitIsUnit("focus","target") then	--目标是指定单位
			if WR_ColorFrame_Show("CSI","棱镜T") then return true end
		end
		if WR_FocusUnit("target","棱镜") then return true end --焦点单位过程
	end
	return false
end

--施法过程 圣光闪现
function WR_PaladinHoly_Function_SGSX()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("圣光闪现")
	and not PlayerMove
	and not UnitCanAttack("player","focus")	--焦点是友善单位
	and FocusRange<=40 --焦点在技能范围内
	and FocusLostHealth>=SGSX --焦点损失血量>=圣光闪现治疗量
	and
	(
		--not UnitAffectingCombat("player")	--没进战斗
		--or
		WR_GetUnitBuffTime("player","圣光灌注")>GCD	--圣光灌注 BUFF存在
		or
		WR_GetUnitBuffTime("player","神恩术")>GCD	--神恩术 BUFF存在
		or
		(
			IsPlayerSpell(231642)	--已学 道标照耀
			and
			HolyPower<5	--神圣能量<5
		)
	)
	then
		if WR_ColorFrame_Show("CSN","圣光闪现") then return true end
	end
	return false
end


--获得治疗效果
function WR_PaladinHolyHeal()
	if IsPlayerSpell(156322) then	--已学技能 永恒之火
		RYSL=WR_GetSpellValue("永恒之火","复","点生命值")
	else
		RYSL=WR_GetSpellValue("荣耀圣令","复","点生命值")
	end
	
	SGS=WR_GetSpellValue("圣光术","复","点生命值")
	SGSX=WR_GetSpellValue("圣光闪现","复","点生命值")
--[[
	SXZS=SGS*1.4	--神性之手
	if UnitCastingInfo("player")=="神性之手" then
		SGS=SGS*1.4	--神性之手
	end
--]]
	SSLJ=WR_GetSpellValue("神圣棱镜","复","点生命值")
	LMZG=WR_GetSpellValue("黎明之光","复","点生命值")
	SSZJ=WR_GetSpellValue("神圣震击","复","点生命值")
	SJMZ=SSZJ	--圣洁鸣钟 可以获得神圣震击的治疗量
	
	--根据副本强度调整最低限度的治疗量
	RYSL=RYSL*1.5	--荣耀圣令
	SGS=SGS*2	--圣光术
	SGSX=SGSX*2	--圣光闪现
	SSLJ=SSLJ*2	--神圣棱镜
	LMZG=LMZG*2	--黎明之光
	SSZJ=SSZJ*2	--神圣震击
	SJMZ=SJMZ*2	--圣洁鸣钟
	
	
	LMZG_Sum=0	--黎明之光 初始化治疗效果
	SJMZ_Sum=0 --圣洁鸣钟 初始化治疗效果
	SSLJ_Sum=0 	--神圣棱镜 初始化治疗效果
	
	WR_GetPartyRange()	--获取队友距离,获得：TargetRange,FocusRange,PartyRange[i],RiadRange[i]
	WR_GetPartyLostHealth()	--获取队友真实的可恢复的血量，获得：PlayerLostHealth,TargetLostHealth,FocusLostHealth,PartyLostHealth[i],RiadLostHealth[i]

	if PlayerLostHealth>=LMZG then	--黎明之光
		LMZG_Sum=LMZG_Sum+LMZG
	else
		LMZG_Sum=LMZG_Sum+PlayerLostHealth
	end
	if RaidOrParty=="party" then	--统计加入，队友可以恢复的血量
		local i
		for i=1,4,1
		do
			local unit="party"..i
			if PartyRange[i]<=40 then
				if PartyLostHealth[i]>=SSLJ then	--神圣棱镜
					SSLJ_Sum=SSLJ_Sum+SSLJ
				else
					SSLJ_Sum=SSLJ_Sum+PartyLostHealth[i]
				end
				if PartyLostHealth[i]>=LMZG_Sum then	--黎明之光
					LMZG_Sum=LMZG_Sum+LMZG
				else
					LMZG_Sum=LMZG_Sum+PartyLostHealth[i]
				end

				if PartyLostHealth[i]>=SSZJ then	--圣洁鸣钟  损失血量>=[神圣震击]治疗量
					SJMZ_Sum=SJMZ_Sum+SSZJ
				else
					SJMZ_Sum=SJMZ_Sum+PartyLostHealth[i]
				end
			end
		end
	end
	if RaidOrParty=="raid" then	--统计加入，团队可以恢复的血量
		local i
		for i=1,40,1
		do
			local unit="raid"..i
			if RiadRange[i]<=40 then
				if RiadLostHealth[i]>=SSLJ then	--神圣棱镜
					SSLJ_Sum=SSLJ_Sum+SSLJ
				end
				if RiadLostHealth[i]>=LMZG_Sum then	--黎明之光
					LMZG_Sum=LMZG_Sum+LMZG
				end
				if RiadLostHealth[i]>=SSZJ then	--圣洁鸣钟 损失血量>=[神圣震击]治疗量
					SJMZ_Sum=SJMZ_Sum+SSZJ
				else
					SJMZ_Sum=SJMZ_Sum+RiadLostHealth[i]
				end
			end
		end
	end
end

--圣言祭礼
function WR_PaladinHoly_SYJL()
	if GCD<=ShiFaSuDu
	and UnitCastingInfo("player")==nil
	and WR_GetUnitBuffTime("player","圣言祭礼")<=600	--圣言祭礼BUFF时间<10分钟
	and not UnitAffectingCombat("player")	--不在战斗中
	and WR_SpellUsable("圣言祭礼")	--技能可用
	then
		if WR_ColorFrame_Show("CSP","圣言祭礼") then return true end
	end
	return false
end