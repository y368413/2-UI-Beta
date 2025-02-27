--恢复运行库
function WR_DruidRestoration()
WR_DebugTime(0)
	--collectgarbage("collect")
	if GetSpecialization()~=4 then	--如果不是恢复(4)专精，则不执行该运行库
		return
	end

	if not WR_FastPass then	--如果不是快速通过,则执行下列数据初始化过程
		ShiFaSuDu=0.05+WRSet.HF_SFSD*0.05
		
		--WR_Initialize()	--初始化
		
		GCD=WR_GetGCD("野性印记")	--获得公共冷却剩余时间或者当前施法剩余时间
		MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
		PlayerInCombat = UnitAffectingCombat("player")	--玩家在战斗中
		PlayerHP = UnitHealth("player")/UnitHealthMax("player")
		FocusHP = WR_GetUnitHP("focus")	--获得目标真实带护盾的血量比例
		PlayerMove = WR_PlayerMove()	--获得自身是否在移动或者空中
		PlayerMP = WR_GetUnitMP("player")	--获得自身法力值
		PartyLostHP=WR_PartyLostHP()	--获得全队平均掉血百分比
		TargetCloseRange=C_Spell.IsSpellInRange("撕碎","target")
		TargetRange=WR_GetUnitRange("target")	--获得目标距离
		FocusRange=WR_GetUnitRange("focus")	--获得目标距离
		FocusMustheal=WR_Mustheal("focus")	--目标必须受到治疗
		FocusLostHealth=WR_GetUnitLostHealth("focus")	--目标损失的血量
		CatForm=WR_GetUnitBuffTime("player","猎豹形态")~=0	--猎豹形态
		MoonkinForm=WR_GetUnitBuffTime("player","枭兽形态")~=0	--枭兽形态
		BearForm=WR_GetUnitBuffTime("player","熊形态")~=0	--熊形态
		TreeForm=WR_GetUnitBuffTime("player","化身：生命之树")~=0	--树形态
		TargetInCombat=WR_TargetInCombat("target")	--目标可攻击
		--TargetDeathTime=WR_GetUnitDeathTime("target")	--目标死亡时间
		InBossCombat=WR_InBossCombat()	--正在与BOSS战斗
		InRaidOrParty=WR_GetInRaidOrParty() --获得自己是在小队还是在团队
		HUCountRangeClose=WR_GetSpellRangeHarmUnitCount("撕碎",false)	--获取近战敌人数量(范围,是否战斗中)
		HUCountRange45=WR_GetRangeHarmUnitCount(45,true)	--获取45码敌人数量(范围,是否战斗中)
		ResistOutburstTime=WR_ResistOutburstTime()	--防御尖刺型伤害剩余时间
		MustDefenseTime_Bear=ResistOutburstTime<=GCD+MaxGCD	--防御尖刺型伤害剩余时间<=当前GCD剩余时间+最大GCD时间,变熊
		--if ResistOutburstTime~=999 then print("防御时间:"..ResistOutburstTime) end
		--if MustDefenseTime_Bear then print("变熊防御") end
		Resist=false --初始化防御机制
		ResistSustained=WR_ResistSustained()	--持续型伤害
		MustDefenseTime=WR_MustDefenseTime()	--必须开启防御
		if ResistSustained or ResistOutburstTime<=5 or MustDefenseTime<=5 then
		--持续型伤害 或 尖刺型伤害，施法时间剩余小于5秒 或 必须开启防御 
			Resist=true
		end
		WR_DruidRestoration_SpecialCombat()	--特殊战斗判断
		PartySum=1	--队友数量
		HCS_BuffSum=0	--回春术BUFF数量
		SMZF_BuffSum=0	--生命绽放BUFF数量
		SMZF_BuffMinTime=15	--生命绽放BUFF最短时间
		if WR_GetUnitBuffTime("player","生命绽放",true)>0 then
		--生命绽放 BUFF存在
			SMZF_BuffSum=SMZF_BuffSum+1
			if WR_GetUnitBuffTime("player","生命绽放",true)<SMZF_BuffMinTime then
			--生命绽放时间<生命绽放最短时间
				SMZF_BuffMinTime=WR_GetUnitBuffTime("player","生命绽放",true)
			end
		end
		if WR_GetUnitBuffTime("player","回春术",true)>0 then
		--回春术 BUFF 存在
			HCS_BuffSum=HCS_BuffSum+1
		end
		
		if WR_DruidRefreshTime==nil then
			WR_DruidRefreshTime=GetTime()

			MasteryADD=WR_DruidRestoration_GetADD_Mastery("focus")	--获得目标精通加成比例
			
			XJZY_Health=WR_GetSpellValue("迅捷治愈","恢复","点生命值")+WR_GetSpellValue("迅捷治愈","回复"," 点生命值")
			XJZY_Health=XJZY_Health*MasteryADD	--迅捷治愈 治疗量
			
			YH_Health=WR_GetSpellValue("愈合","目标恢复","点生命值")+WR_GetSpellValue("愈合","额外恢复","点生命值")
			
			if WR_GetUnitBuffTime("player","丛林之魂")>GCD+WR_GetTrueCastTime("愈合")+0.2 then
				YH_Health=YH_Health*(1+1.5)	--如果有 丛林之魂 BUFF,效果提升150%
			end
			YH_Health=YH_Health*MasteryADD	--愈合 治疗量
			
			LMWS_Health=WR_GetSpellValue("林莽卫士","迅捷治愈，为其恢复","点生命值")
			LMWS_Health=LMWS_Health*MasteryADD	--林莽卫士 治疗量

			if PlayerInCombat then
				--单位战斗中
				if UnitGroupRolesAssigned(Unit)~="TANK" then
					XJZY_Health=XJZY_Health * 1.3	--迅捷治愈,这个可以刷树人
					
					if WR_GetUnitBuffCount("player","节能施法")==0 then	--愈合
					--节能施法 BUFF不存在
						YH_Health=YH_Health * 2.5
					elseif WR_GetUnitBuffCount("player","节能施法")>=1 then
					--节能施法 BUFF >=1层
						YH_Health=YH_Health * 1.3
					end
					
					LMWS_Health=LMWS_Health * 1.5	--林莽卫士
				else
				--如果是坦克,就翻3倍
					XJZY_Health=XJZY_Health * 3	--迅捷治愈
					YH_Health=YH_Health * 3	--愈合
					LMWS_Health=LMWS_Health * 3	--林莽卫士
				end
			end
			
			if not UnitAffectingCombat("player") then	--不在战斗中
				for i=1,4,1 do
					local TempUnit="party"..i
					if WR_GetUnitBuffTime(TempUnit,"生命绽放",true)>0 then
					--BUFF 存在
						SMZF_BuffSum=SMZF_BuffSum+1
						if WR_GetUnitBuffTime(TempUnit,"生命绽放",true)<SMZF_BuffMinTime then
							SMZF_BuffMinTime=WR_GetUnitBuffTime(TempUnit,"生命绽放",true)
						end
					end
					if WR_GetUnitBuffTime(TempUnit,"回春术",true)>0 then
					--BUFF 存在
						HCS_BuffSum=HCS_BuffSum+1
					end
					if not UnitIsDead(TempUnit) and not UnitCanAttack("player",TempUnit) and UnitGroupRolesAssigned(TempUnit)~="TANK" then
					--单位存活 并且 单位是友方 并且 单位不是坦克
						PartySum=PartySum+1
					end
				end

				for i=1,4,1 do 
					local TempUnit="party"..i
					if UnitExists(TempUnit)	--单位存在
					and UnitName(TempUnit)~=nil	--单位名称存在
					then
						if HF_SMZF_menuItems[i].text~=UnitName(TempUnit) then	--如果列表指定选项文本不等于当前单位名称
							HF_SMZF_UpdateMenuItemText(i, UnitName(TempUnit))	--给 生命绽放 下拉菜单更新文本
							HF_MSZF_UpdateMenuItemText(i, UnitName(TempUnit))	--给 蔓生绽放 下拉菜单更新文本
						end
					else
						if HF_SMZF_menuItems[i].text~="" then	--如果列表指定选项文本不等于当前单位名称
							HF_SMZF_UpdateMenuItemText(i, "")	--给 生命绽放 下拉菜单更新文本
							HF_MSZF_UpdateMenuItemText(i, "")	--给 蔓生绽放 下拉菜单更新文本
						end
					end
				end
		
				if HF_SMZF_menuItems[5].text~=UnitName("player") then	--如果列表指定选项文本不等于当前单位名称
					HF_SMZF_UpdateMenuItemText(5, UnitName("player"))	--给 生命绽放 下拉菜单更新文本
					HF_MSZF_UpdateMenuItemText(5, UnitName("player"))	--给 蔓生绽放 下拉菜单更新文本
				end
			end
		elseif GetTime()-WR_DruidRefreshTime>=1 then
			WR_DruidRefreshTime=nil
		end
	else
		WR_FastPass=false	--如果是快速通过了,那么下次就不要快速通过了
	end
	
	if MSG==1 then
		--print("----------")
	end
WR_DebugTime(1)
	--优先检查
	if WR_PriorityCheck() then return end
WR_DebugTime(2)
	--施法过程 停止施法
	if WR_DruidRestoration_Function_StopCasting() then return end

	--施法过程 影遁
	if WR_DruidRestoration_Function_YD() then return end

	--施法过程 甘霖
	if WR_DruidRestoration_Function_GL() then return end
	
	if WRSet.HF_SP1>=3 then
		if WR_ShiPin(1,WRSet.HF_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.HF_SP2>=3 then
		if WR_ShiPin(2,WRSet.HF_SP2) then return true end	--饰品 自保/协助
	end

	--施法过程 治疗石
	if WR_DruidRestoration_Function_ZLS() then return end

	--施法过程 治疗药水
	if WR_DruidRestoration_Function_ZLYS() then return end

	--施法过程 自我减伤
	if WR_DruidRestoration_Function_ZWJS() then return end

	--施法过程 解除变形
	if WR_DruidRestoration_Function_CancelForm() then return end

	--施法过程 狂暴回复
	if WR_DruidRestoration_Function_KBHF() then return end

	--施法过程 复生
	if WR_Druid_Function_FS() then return end

	--施法过程 变熊防御
	if WR_DruidRestoration_Function_BXFY() then return end

	--施法过程 变形解定身
	if WR_DruidRestoration_Function_BXJCDS() then return end

	--施法过程 变熊暂停
	if WR_DruidRestoration_Function_BXZT() then return end

	--施法过程 安抚
	if WR_Druid_Function_AF() then return end

	--施法过程 夺魂咆哮
	if WR_Druid_Function_DHPX() then return end

	--施法过程 野性印记
	if WR_Druid_Function_YXYJ() then return end

	--施法过程 迎头痛击
	if WR_Druid_Function_YTTJ() then return end

	--施法过程 激活
	if WR_DruidRestoration_Function_JH() then return end

	--施法过程 自然之愈
	if WR_DruidRestoration_Function_ZRZY() then return end

	--施法过程 愈合暂停
	if WR_DruidRestoration_Function_YHZT() then return end

	--施法过程 新生
	if WR_DruidRestoration_Function_XS() then return end
	
	if WRSet.HF_SP1<=2 then
		if WR_ShiPin(1,WRSet.HF_SP1) then return true end	--饰品 常驻/爆发
	end
	if WRSet.HF_SP2<=2 then
		if WR_ShiPin(2,WRSet.HF_SP2) then return true end	--饰品 常驻/爆发
	end
	
WR_DebugTime(3)
	if WR_FocusMaxWeightUnit() then return end	--焦点最高权重单位
WR_DebugTime(4)

	--施法过程 队友减伤
	if WR_DruidRestoration_Function_DYJS() then return end

	--施法过程 林莽卫士
	if WR_DruidRestoration_Function_LMWS() then return end

	--施法过程 化身：生命之树
	if WR_DruidRestoration_Function_HSSMZS() then return end

	--施法过程 急救治疗
	if WR_DruidRestoration_Function_JJZL() then return end

	--施法过程 万灵之召
	if WR_DruidRestoration_Function_WLZZ() then return end

	--施法过程 繁盛
	if WR_DruidRestoration_Function_FanSheng() then return end

	--施法过程 野性成长
	if WR_DruidRestoration_Function_YXCZ() then return end

	--施法过程 优先治疗
	if WR_DruidRestoration_Function_YXZL() then return end

	--施法过程 百花齐放
	if WR_DruidRestoration_Function_BHQF() then return end

	--施法过程 迅捷治愈
	if WR_DruidRestoration_XJZY() then return true end	

	--施法过程 塞纳里奥结界
	if WR_DruidRestoration_Function_SNLAJJ() then return end

	--施法过程 节能愈合
	if WR_DruidRestoration_Function_JNYH() then return end

	--施法过程 回春术 协助队友
	if WR_DruidRestoration_Function_HCS_Assist() then return end

	--施法过程 生命绽放
	if WR_DruidRestoration_Function_SMZF() then return end

	--施法过程 愈合补HOT
	if WR_DruidRestoration_Function_YH_HOT() then return end

	--施法过程 回春术
	if WR_DruidRestoration_Function_HCS() then return end

	--施法过程 愈合填充
	if WR_DruidRestoration_Function_YHTC() then return end

	--过程 战斗
	if WR_DruidRestoration_Function_Fight() then return end
WR_DebugTime(5)
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体


end

--过程 战斗
function WR_DruidRestoration_Function_Fight()
	if GCD>0 then return false end
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end
	
	if WR_DruidRestoration_Function_XYS() then return true end	--星涌术
	
	if WR_GetUnitBuffTime("player",429474)>GCD then	--盛放注能存在
		if WR_DruidRestoration_Function_XHS() then return true end	--星火术
		if WR_DruidRestoration_Function_FN() then return true end	--愤怒
	end
	
	if not IsPlayerSpell(439528) then	--没学 兴荣生长
		if WR_DruidRestoration_Function_YYS() then return true end	--阳炎术
		
		if HUCountRange45<3 then --45码敌人<3
			if WR_DruidRestoration_Function_YHS() then return true end	--月火术<3
		end
	end
	
	if WR_GetUnitBuffTime("player","化身")==0	--化身不存在
	and
	(
		WRSet.HF_LBXT==2	--猎豹形态 常驻
		or
		(
			WRSet.HF_LBXT==1	--猎豹形态 平伤
			and
			zhandoumoshi~=1	--非爆发
		)
	)
	then
		if WR_SpellUsable("猎豹形态") --技能可用 资源可用
		and not CatForm --不是 猎豹形态
		and not TreeForm --不是 树形态
		and HUCountRangeClose>=1 --2码单位数量>=1
		and not ResistSustained --持续型伤害
		and ResistOutburstTime>5 --尖刺型伤害，施法时间剩余小于5秒
		and SMZF_BuffMinTime>2 --生命绽放最短时间
		then
			if WR_DruidRestoration_Function_XL() then return true end	--斜掠
			
			if WR_DruidRestoration_Function_SS() then return true end	--撕碎
			
			if not IsPlayerSpell(449193) then	--没学习[自如变形]天赋
				if WR_ColorFrame_Show("CF8","猎豹形态") then return true end	--猎豹形态
			end
		end
		
		if WR_DruidRestoration_YXZX() then return true end --野性之心
		
		if WR_DruidRestoration_Function_GeLie() then return true end	--割裂
		
		if WR_DruidRestoration_Function_XMSY() then return true end	--凶猛撕咬
		
		if WR_DruidRestoration_Function_XL() then return true end	--斜掠
		
		if WR_DruidRestoration_Function_TJ() then return true end	--痛击
		
		if WR_DruidRestoration_Function_SS() then return true end	--撕碎
		
		if WR_DruidRestoration_Function_HS() then return true end	--横扫
	end
	
	if WR_DruidRestoration_Function_YYS() then return true end	--阳炎术
	
	if WR_DruidRestoration_Function_YHS() then return true end	--月火术
	
	if WR_DruidRestoration_Function_XHS() then return true end	--星火术
	
	if WR_DruidRestoration_Function_FN() then return true end	--愤怒
	
	return false
end

--施法过程 停止施法
function WR_DruidRestoration_Function_StopCasting()
	if UnitCastingInfo("player")~=nil
	and
	(
		(
			UnitCastingInfo("player")=="新生"
			and
			not WR_PartyIsDeath()	--队伍没有人死亡
		)
		or
		(
			(
				UnitCastingInfo("player")=="星火术"
				--or
				--UnitCastingInfo("player")=="愤怒"
			)
			and
			(
				(
					WRSet.HF_BXFY==1 --变熊防御 开启
					and
					MustDefenseTime_Bear --必须变熊
					and
					not BearForm --不是 熊形态
				)
				or
				(
					FocusHP<0.60 --焦点血量<60%
					and
					Resist --AOE的时候
				)
			)
		)
	)
	then
		if WR_ColorFrame_Show("CSN","停止施法") then return true end
	end
	return false
end


--施法过程 影遁
function WR_DruidRestoration_Function_YD()
	if InRaidOrParty=="raid" then return false end	--在团队不生效
	
	if WR_Escape() --有规避的技能
	and WR_SpellUsable("影遁") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("ASF1","影遁") then return true end
	end
	return false
end


--施法过程 甘霖
function WR_DruidRestoration_Function_GL()
	if WRSet.HF_GL~=6 --甘霖选项不是关闭的
	and
	(
		PlayerHP<WRSet.HF_GL/10 --血量比例<甘霖设定值/10
		or
		(
			MustDefenseTime<=1 --必须开减伤最后1秒
			and
			PlayerHP<0.8 --血量比例<80%
		)
	)
	and PlayerInCombat --单位战斗中
	and WR_SpellUsable("甘霖") --技能可用 资源可用
	and (ZLS_EndTime==nil or GetTime()-ZLS_EndTime>0.5) --上一次 治疗石 施法不存在 或者 放出时间>0.5
	and (ZLYS_EndTime==nil or GetTime()-ZLYS_EndTime>0.5) --上一次 治疗药水 使用时间不存在 或者 放出时间>0.5
	then
		GL_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CF2","甘霖") then return true end
	end
	return false
end
	
--施法过程 治疗石
function WR_DruidRestoration_Function_ZLS()
	if WRSet.HF_ZLS~=5 --治疗石选项不是关闭的
	and
	(
		PlayerHP<WRSet.HF_ZLS/10 --血量比例<治疗石设定值/10
		or
		(
			MustDefenseTime<=1 --必须开减伤最后1秒
			and
			PlayerHP<0.8 --血量比例<80%
		)
	)
	and PlayerInCombat --单位战斗中
	and WR_Use_ZLS() --可以使用治疗石
	and (GL_EndTime==nil or GetTime()-GL_EndTime>0.5) --上一次 甘霖 施法不存在 或者 放出时间>0.5
	and (ZLYS_EndTime==nil or GetTime()-ZLYS_EndTime>0.5) --上一次 治疗药水 使用时间不存在 或者 放出时间>0.5
	then
		ZLS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--施法过程 治疗药水
function WR_DruidRestoration_Function_ZLYS()
	if WRSet.HF_ZLYS~=5 --治疗药水选项不是关闭的
	and
	(
		PlayerHP<WRSet.HF_ZLYS/10 --血量比例<治疗药水设定值/10
		or
		(
			MustDefenseTime<=1 --必须开减伤最后1秒
			and
			PlayerHP<0.8 --血量比例<80%
		)
	)
	and PlayerInCombat --单位战斗中
	and WR_Use_ZLYS() --可以使用治疗药水
	and (GL_EndTime==nil or GetTime()-GL_EndTime>0.5) --上一次 甘霖 施法不存在 或者 放出时间>0.5
	and (ZLS_EndTime==nil or GetTime()-ZLS_EndTime>0.5) --上一次 治疗石 施法不存在 或者 放出时间>0.5
	then
		ZLYS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end


--施法过程 自我减伤
function WR_DruidRestoration_Function_ZWJS()
	if WR_GetUnitBuffTime("player","树皮术")==0 --树皮术 Buff不存在
	and
	(
		MustDefenseTime<5 --必须开启防御
		or
		(
			InBossCombat --BOSS战斗
			and
			ResistSustained --持续AOE
			and
			PlayerHP<0.95 --自己的血量比例<0.95
		)
	)
	then
		--树皮术
		if WRSet.HF_SPS==1
		and UnitAffectingCombat("player") --战斗中
		and WR_SpellUsable("树皮术") --技能可用 资源可用
		and (TMSP_EndTime==nil or GetTime()-TMSP_EndTime>0.5) --上一次 铁木树皮 施法不存在 或者 放出时间>0.5
		then
			SPS_EndTime=GetTime()+GCD
			if WR_ColorFrame_Show("CF3","树皮术") then return true end
		end
	end
	return false
end

--施法过程 解除变形
function WR_DruidRestoration_Function_CancelForm()
	--解除变形
	if WRSet.HF_JCDS==1 --解除定身开启
	and WR_Unbind("player") --单位有可以解除定身的状态
	and
	(
		BearForm --熊形态
		or
		CatForm --猎豹形态
		or
		(TreeForm and IsPlayerSpell(33891) ) --树形态 并且 已学[化身：生命之树](这么判断是为了没学化身但是触发[森林再生]给的树形态)
	)
	then
		if WR_ColorFrame_Show("CF10","解除变形") then return true end
	end
	return false
end

--施法过程 狂暴回复
function WR_DruidRestoration_Function_KBHF()
	if BearForm --熊形态
	and IsPlayerSpell(22842)	--已学 狂暴回复
	and WR_SpellUsable("狂暴回复") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF5","狂暴回复") then return true end
	end
	return false
end

--施法过程 变熊防御
function WR_DruidRestoration_Function_BXFY()
	if WRSet.HF_BXFY==1 --变熊防御 开启
	and WR_SpellUsable("熊形态") --技能可用 资源可用
	and MustDefenseTime_Bear --必须变熊
	and not BearForm --不是 熊形态
	then
		if WR_ColorFrame_Show("CF7","变熊防御") then return true end
	end
	return false
end

--施法过程 变形解定身
function WR_DruidRestoration_Function_BXJCDS()
	if WRSet.HF_JCDS==1 --解除定身开启
	and not BearForm --不是 熊形态
	and not CatForm --不是 猎豹形态
	and not MoonkinForm --不是 枭兽形态
	and not TreeForm --不是 树形态
	and WR_Unbind("player") --单位有可以解除定身的状态
	then
		if WR_ColorFrame_Show("CF7","变熊解除") then return true end
	end
	return false
end

--施法过程 变熊暂停
function WR_DruidRestoration_Function_BXZT()
	if MustDefenseTime_Bear and BearForm and PlayerHP>0.5 then
	--必须开变熊	并且	当前是熊形态	并且	玩家血量>50%
		if WR_ColorFrame_Show("Stop","变熊暂停") then return true end
	end
	return false
end
	


--施法过程 激活
function WR_DruidRestoration_Function_JH()
	if not WR_SpellUsable("激活") then return false end	--技能不可用
	if not PlayerInCombat then return false end	--不在战斗
	if not TreeForm then return false end	--不在树形态
	
	local Temp
	if WR_GetUnitBuffTime("player","魔力之源")>0 then 
		Temp=0.05	--魔力之源 BUFF 存在
	else
		Temp=0	--魔力之源 BUFF 不存在
	end
	if WR_GetUnitBuffTime("player","化身")>8 --化身 BUFF>8秒
	and
	(
		PlayerMP<0.3 --蓝量低于30%
		or
		(
			PlayerMP<0.9-Temp --蓝量低于90%-魔力之源5%
			and
			(
				InBossCombat --BOSS战斗
				or
				WR_GetUnitBuffTime("player","化身")>10 --化身 BUFF>10秒
			)
		)
	)
	then
		if WR_ColorFrame_Show("SF1","激活") then return true end
	end
	return false
end

--自然之愈 条件
function WR_DruidRestoration_ZRZY(Unit)
	if not UnitCanAttack("player",Unit) --单位是友善的
	and WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and WR_CanRemoveUnitDebuff(Unit) --单位有可驱散Debuff
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF2","愈"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"愈") then return true end --焦点单位过程
	end
	return false
end

--施法过程 自然之愈
function WR_DruidRestoration_Function_ZRZY()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("自然之愈") then return false end --技能不可用

	if (WRSet.HF_ZRZY==1 or WRSet.HF_ZRZY==2) then	--自然之愈 智能 或 指向
		if WR_DruidRestoration_ZRZY("mouseover") then return true end
	end
	
	if (WRSet.HF_ZRZY==1 or WRSet.HF_ZRZY==3) then --自然之愈 智能 或 自己
		if WR_DruidRestoration_ZRZY("player") then return true end
	end

	if WRSet.HF_ZRZY==1 then --自然之愈 智能
		local TempSum
		if InRaidOrParty=="raid" then
			TempSum=25
		elseif InRaidOrParty=="party" then
			TempSum=4
		end
		
		if TempSum==nil then return false end --不在队伍或团队
		
		for i= 1,TempSum,1 do
			if WR_DruidRestoration_ZRZY(InRaidOrParty..i) then return true end
		end
	end
	return false
end

--施法过程 愈合暂停
function WR_DruidRestoration_Function_YHZT()
	------------------------------------------------------------------------------------------------------	
	WR_DruidRestoration_LastSpellTime()	--获取上一次的技能，利用战斗事件，所以仅运行一次
	------------------------------------------------------------------------------------------------------
	if (YH_CastTime~=nil and GetTime()-YH_CastTime<0.15) then
	--愈合成功施法间隔0.15秒,因为HOT有延迟
	--print(GetTime()-YH_CastTime)
		if WR_ColorFrame_Show("Stop","愈合暂停") then return true end
	end
	return false
end

--施法过程 新生
function WR_DruidRestoration_Function_XS()
	if GCD>ShiFaSuDu then return false end

	if not PlayerInCombat --单位 不在 战斗中
	and WR_ResurrectParty() --有可以复活的队友
	and not PlayerMove --没有移动
	then
		if WR_ColorFrame_Show("SF4","新生") then return true end
	end
	return false
end

--施法过程 队友减伤
function WR_DruidRestoration_Function_DYJS()
	if not UnitIsDead("focus") --单位存活
	and UnitAffectingCombat("focus") --单位战斗中
	and not UnitCanAttack("focus","player") --单位是友方
	and FocusRange<=45 --单位距离
	and WR_GetUnitBuffTime("focus","铁木树皮")==0 --铁木树皮 Buff不存在
	then
		--铁木树皮
		if WRSet.HF_TMSP==1 --铁木树皮 开启
		and WR_SpellUsable("铁木树皮") --技能可用 资源可用
		and not BearForm --不是 熊形态
		and FocusHP<0.35
		and UnitGroupRolesAssigned("focus")=="TANK" --单位是坦克
		and
		(
			ResistSustained --持续型伤害
			or
			ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
			or
			not InBossCombat --不是BOSS战斗
		)
		then
			TMSP_EndTime=GetTime()+GCD
			if WR_ColorFrame_Show("CF4","铁皮F") then return true end
		end
	end
	return false
end
	
--施法过程 林莽卫士
function WR_DruidRestoration_Function_LMWS()
	if GCD<MaxGCD-0.3	--防止某些情况打断引导施法
	and WR_SpellUsable("林莽卫士") --技能可用 资源可用
	and PlayerInCombat --单位战斗中
	and FocusRange<=45 --单位距离<=45
	and
	(
		FocusLostHealth>LMWS_Health --损失血量>林莽卫士 治疗量
		or
		FocusMustheal --目标单位必须治愈
	)
	and PartyLostHP>0.1+(3-WR_GetSpellCharges("林莽卫士"))*0.15 --队伍损失血量>10%(3次) 25%(2次) 40%(1次)
	then
		if WR_ColorFrame_Show("F8","林莽卫士") then return true end
	end
	return false
end

--施法过程 化身：生命之树
function WR_DruidRestoration_Function_HSSMZS()
	if GCD>ShiFaSuDu then return false end

	if IsPlayerSpell(33891) --已学技能 化身：生命之树
	and PlayerInCombat --单位战斗中
	and
	(
		(
			WR_GetUnitBuffTime("player","化身")~=0 --BUFF 存在
			and
			not TreeForm --不是树形态
		)
		or
		(
			WRSet.HF_HS==1 --化身 开启
			and
			zhandoumoshi==1 --爆发 开启
			and
			WR_GetUnitBuffTime("player","化身")==0 --BUFF 不存在
			and
			WR_SpellUsable("化身：生命之树") --技能可用 资源可用
		)
	)
	then
		if WR_ColorFrame_Show("SF3","生命之树") then return true end
	end
	return false
end
	
--迅捷治愈 条件
function WR_DruidRestoration_XJZY(Text)
	if GCD>ShiFaSuDu then return false end
	
	local TempText
	if Text==nil then
		TempText="迅捷治愈"
	else
		TempText=Text
	end
	
	if WR_GetGCD("迅捷治愈")<=0.2
	and not UnitCanAttack("focus","player") --单位是友善的
	and FocusRange<=45 --单位距离<=45
	and
	(
		FocusLostHealth>XJZY_Health --损失血量>迅捷治愈 治疗量
		or
		FocusMustheal --目标单位必须治愈
	)
	and
	(
		WR_GetUnitBuffTime("focus","愈合",true)~=0 --BUFF 存在
		or
		WR_GetUnitBuffTime("focus",48438,true)~=0	--野性成长 BUFF 存在
		or
		WR_GetUnitBuffTime("focus","回春术",true)~=0 --BUFF 存在
	)
	and
	(
		WR_GetUnitBuffCount("player","森林再生")<=1 --森林再生 BUFF层数<=1,非战斗的时候存一下2层[森林再生]
		or
		(
			PlayerInCombat --单位战斗中
			and
			UnitGroupRolesAssigned("focus")~="TANK" --单位不是坦克
			and
			(
				FocusHP<0.3 --目标血量<30%
				or
				PartyLostHP>0.3 --队伍损失血量>0.3
				or
				Resist --防御机制
				or
				WR_GetUnitBuffCount("player","节能施法")==0 --节能施法 BUFF不存在
				or
				zhandoumoshi==1 --爆发 开启
			)
		)
	)
	then
		if WR_ColorFrame_Show("SF5",TempText) then return true end
	end
	return false
end

--愈合 条件
function WR_DruidRestoration_YH()
	if UnitCastingInfo("player")=="愈合" then
		if GCD>0 then return false end
		--如果在读愈合 那么就等读完再考虑下一个愈合
	else
		if GCD>ShiFaSuDu then return false end
		--如果没读愈合 那么可以提前考虑愈合
	end
	
	if WR_SpellUsable("愈合")
	--技能可用 资源可用
	and
	not UnitCanAttack("player","focus")
	--单位是友善的
	and
	FocusRange<=45
	--单位距离<=45
	and
	(
		FocusLostHealth>YH_Health
		--损失血量>愈合 治疗量
		or
		FocusMustheal
		--目标单位必须治愈
		or
		FocusHP<0.75
		--目标血量<75%
	)
	and
	(
		TreeForm	--树形态
		or
		WR_GetUnitBuffTime("player","自然迅捷")~=0
		--自然迅捷 BUFF存在
		or
		WR_GetUnitBuffTime("player",429438)~=0
		--盛放注能 BUFF存在
		or
		(
			not PlayerMove
			--玩家没有移动
			and
			not WR_StopCast(WR_GetTrueCastTime("愈合"))
			--避免施法被沉默的情况
		)
	)
	then
		return true
	end
	return false
end

--施法过程 急救治疗
function WR_DruidRestoration_Function_JJZL()
	if GCD>ShiFaSuDu then return false end

	if FocusHP<0.40
	--目标血量<40%
	or
	(
		WR_GetRangeSpellTime(45,DangerOutburstAoe)<=1.5 --范围内高危险尖刺AOE施法剩余时间<=1.5秒
		and
		FocusHP<0.8 --血量比例<80%
	)
	then
		--迅捷治愈
		if WR_DruidRestoration_XJZY("急救迅愈") then return true end
		
		--自然迅捷+愈合
		if WR_SpellUsable("自然迅捷") --技能可用 资源可用
		and WR_DruidRestoration_YH() --愈合
		and PlayerInCombat --单位战斗中
		then
			if WR_ColorFrame_Show("CSG","迅捷愈合") then return true end
		end
		
		--化身愈合
		if WR_DruidRestoration_YH()
		and TreeForm	--树形态
		then
			if WR_ColorFrame_Show("SF6","化身愈合") then return true end
		end
	end
	return false
end
	
--施法过程 万灵之召
function WR_DruidRestoration_Function_WLZZ()
	if GCD>ShiFaSuDu then return false end

	if WRSet.HF_HS==1 --化身 开启
	and WR_SpellUsable("万灵之召") --技能可用 资源可用
	and zhandoumoshi==1 --爆发 开启
	and PlayerInCombat --单位战斗中
	and not WR_StopCast(3+0.2) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("CF6","万灵之召") then return true end
	end
	return false
end
	
--施法过程 繁盛
function WR_DruidRestoration_Function_FanSheng()
	if GCD>ShiFaSuDu then return false end

	if WR_SpellUsable("繁盛") --技能可用
	and PlayerInCombat --单位战斗中
	and HCS_BuffSum>=PartySum --回春术==(非坦克)队友数量
	and WR_GetGCD("野性成长")>GCD --野性成长 CD冷却中
	then
		if WR_ColorFrame_Show("SF7","繁盛") then return true end
	end
	return false
end
	
--节能 愈合 的先决条件
function WR_DruidRestoration_YH_JNYH()
	--节能愈合
	if WR_DruidRestoration_YH()
	and WR_GetUnitBuffCount("player","节能施法")~=0 --节能施法 BUFF存在
	and not CatForm --不是 猎豹形态
	and not MoonkinForm --不是 枭兽形态
	then
		return true
	end
	return false
end

--施法过程 优先治疗
function WR_DruidRestoration_Function_YXZL()
	if GCD>ShiFaSuDu then return false end

	if FocusHP<0.6 then	--目标血量<60%
		if WR_DruidRestoration_XJZY("60%迅愈") then return true end	--迅愈60
		
		if WR_DruidRestoration_YH_JNYH() then	--节能愈合60
			if WR_ColorFrame_Show("SF6","节能愈合60%") then return true end
		end
	end
	return false
end
	
--施法过程 野性成长
function WR_DruidRestoration_Function_YXCZ()
	if GCD>ShiFaSuDu then return false end

	if WR_SpellUsable("野性成长") --技能可用 资源可用
	and not PlayerMove --玩家没有移动
	and not WR_StopCast(WR_GetTrueCastTime("野性成长")) --避免施法被沉默的情况
	and
	(
		ResistSustained --持续型伤害
		or
		ResistOutburstTime<=3 --尖刺型伤害，施法时间剩余小于2.5秒
		or
		WR_RangeCountPR(45,0.90)>=4 --低于90%血量的人数>=4
		or
		WR_PreemptiveHealing("野性成长") --AOE尖刺伤害结束后瞬间放出 野性成长
	)
	then
		if WR_ColorFrame_Show("SF8","野性成长") then return true end
	end
	return false
end
	
--施法过程 百花齐放
function WR_DruidRestoration_Function_BHQF()
	if GCD>ShiFaSuDu then return false end

	if WRSet.HF_BHQF==1 --百花齐放 开启
	and WR_SpellUsable("百花齐放") --技能可用 资源可用
	and PlayerInCombat --单位战斗中
	and not PlayerMove --没有移动
	and SpecialCombat_CanHot --可以施放HOT
	and WR_GetUnitBuffTime("player","百花齐放")<=25 --BUFF 时间<=25秒
	and WR_GetUnitBuffTime("player","春暖花开")==0 --BUFF 时间==0秒
	and
	(
		(
			not CatForm --不是 猎豹形态
			and
			not MoonkinForm --不是 枭兽形态
		)
		or
		zhandoumoshi==1 --爆发 开启
		or
		HUCountRangeClose==0 --2码内没敌人
	)
	then
		if WR_ColorFrame_Show("CSY","百花齐放") then return true end
	end
	return false
end
	
--塞纳里奥结界 的先决条件
function WR_DruidRestoration_SNLAJJ(Unit)
	if WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and
	(
		(
			Unit=="player" --单位是 自己
			and
			(
				Resist --自身需要减伤
				or
				WR_UnitAssistDebuff("player") --自身需要协助
			)
		)
		or
		(
			not UnitCanAttack(Unit,"player") --单位是 友方
			and
			(
				(
					not CatForm --不是 猎豹形态
					and
					not MoonkinForm --不是 枭兽形态
					and
					not InBossCombat --不是BOSS战斗,就随便丢给一个目标
				)
				or
				WR_UnitAssistDebuff(Unit) --需要协助的Debuff存在
				or
				(
					UnitIsUnit("focus",Unit) --单位是当前目标
					and
					(
						ResistSustained --持续型伤害
						or
						ResistOutburstTime<=5 --尖刺型伤害，施法时间剩余小于5秒
						or
						UnitGroupRolesAssigned(Unit)=="TANK" --单位是坦克
					)
				)
			)
		)
	)
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF10","结界"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"结界") then return true end
	end
	return false
end

--施法过程 塞纳里奥结界
function WR_DruidRestoration_Function_SNLAJJ()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("塞纳里奥结界") then return false end --技能不可用

	if WR_DruidRestoration_SNLAJJ("focus") then return true end
	if WR_DruidRestoration_SNLAJJ("player") then return true end

	for i= 1,4,1 do
		if WR_DruidRestoration_SNLAJJ("party"..i) then return true end
	end

	return false
end

--施法过程 节能愈合
function WR_DruidRestoration_Function_JNYH()
	if GCD>ShiFaSuDu then return false end

	if WR_DruidRestoration_YH_JNYH() then
		if WR_ColorFrame_Show("SF6","节能愈合") then return true end
	end
	return false
end

--回春术 协助队友
function WR_DruidRestoration_HCS_Assist(Unit)
	if not UnitCanAttack("player",Unit)	--单位不可攻击
	and WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and
	WR_GetUnitBuffTime(Unit,"回春术",true)==0 --BUFF 不存在
	and
	(
		WR_UnitAssistDebuff(Unit) --需要协助的Debuff存在
		or
		(
			UnitIsUnit("focus", Unit) --当前目标是坦克
			and
			UnitGroupRolesAssigned(Unit)=="TANK" --单位是坦克
			and
			not ResistSustained --不是持续AOE的时候
		)
	)
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF11","回春协助"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"回春协助") then return true end --焦点单位过程
	end
	return false
end

--施法过程 回春术 协助队友
function WR_DruidRestoration_Function_HCS_Assist()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("回春术") then return false end
	
	if WR_DruidRestoration_HCS_Assist("focus") then return true end
	if WR_DruidRestoration_HCS_Assist("player") then return true end

	for i= 1,4,1 do
		if WR_DruidRestoration_HCS_Assist("party"..i) then return true end
	end
	return false
end
	
--生命绽放 的先决条件
function WR_DruidRestoration_SMZF(Unit)
	if not UnitCanAttack("player",Unit) --单位是友善的
	and not UnitIsDead(Unit) --单位存活
	and WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and
	(
		(
			WR_GetUnitBuffTime(Unit,"生命绽放",true)==0 --BUFF 时间==0
			and
			SMZF_BuffSum<2 --生命绽放BUFF数量
		)
		or
		(
			WR_GetUnitBuffTime(Unit,"生命绽放",true)>0 --BUFF 时间>0
			and
			WR_GetUnitBuffTime(Unit,"生命绽放",true)<=4.5 --BUFF 时间<4.5
			and
			(
				zhandoumoshi~=1 --爆发 关闭
				or
				WR_GetUnitBuffTime(Unit,"回春术",true)>0 --BUFF 时间>0
			)
			and
			(
				(
					not CatForm --不是 猎豹形态
					and
					not MoonkinForm --不是 枭兽形态
				)
				or
				not PlayerInCombat --单位战斗中
			)
		)
	)
	and
	(
		(
			not CatForm --不是 猎豹形态
			and
			not MoonkinForm --不是 枭兽形态
		)
		or
		zhandoumoshi==1 --爆发 开启
		or
		HUCountRangeClose==0 --2码内没敌人
	)
	and
	SpecialCombat_CanHot --可以施放HOT
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF12","绽放"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"绽放") then return true end --焦点单位过程
	end
	return false
end

--施法过程 生命绽放
function WR_DruidRestoration_Function_SMZF()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("生命绽放") then return false end

	--生命绽放
	if WRSet.HF_SMZF==5 then
		if WR_DruidRestoration_SMZF("player") then return true end
	end

	for i = 1,4,1 do
		if WRSet.HF_SMZF==i then
			if WR_DruidRestoration_SMZF("party"..i) then return true end
		end
	end
	
	--蔓生绽放
	if IsPlayerSpell(392301) then	--已学 [蔓生绽放]
		if WRSet.HF_MSZF==5 then
			if WR_DruidRestoration_SMZF("player") then return true end
		end

		for i = 1,4,1 do
			if WRSet.HF_MSZF==i then
				if WR_DruidRestoration_SMZF("party"..i) then return true end
			end
		end
	end
	return false
end
	
--施法过程 愈合补HOT
function WR_DruidRestoration_Function_YH_HOT()
	if GCD>ShiFaSuDu then return false end

	if WR_DruidRestoration_YH()
	and WR_GetUnitBuffTime("focus","愈合",true)==0 --愈合 BUFF 不存在
	then
		if WR_ColorFrame_Show("SF6","愈合补HOT") then return true end
	end
	return false
end

--回春术
function WR_DruidRestoration_HCS(Unit)
	if not UnitCanAttack("player",Unit) --单位是友善的
	and not UnitIsDead(Unit) --单位 存活
	and WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and WR_GetUnitBuffTime(Unit,"回春术",true)<=3.6 --回春术 BUFF时间<=3.6
	and
	(
		UnitGroupRolesAssigned(Unit)~="TANK" --单位不是坦克
		or
		not UnitAffectingCombat(Unit) --单位不在战斗中
	)
	and
	(
		UnitHealth(Unit)/UnitHealthMax(Unit)<=0.6 --单位血量比例<设定值
		or
		(
			(
				zhandoumoshi==1 --爆发 开启
				or
				SpecialCombat_HCS --特殊单位战斗
				or
				(
					InBossCombat --BOSS战斗
					and
					ResistSustained --持续AOE
					and
					WR_GetUnitHP(Unit)<0.9 --单位含护盾血量<0.9
				)
			)
			and
			(
				TreeForm	--树形态
				or
				WR_GetUnitBuffTime(Unit,"回春术",true)==0 --回春术 BUFF时间==0
			)
		)
	)
	then
		if UnitIsUnit("focus",Unit) then
			if WR_ColorFrame_Show("SF11","回春"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"回春") then return true end --焦点单位过程
	end
	return false
end

--施法过程 回春术
function WR_DruidRestoration_Function_HCS()
	if GCD>ShiFaSuDu then return false end
	--if WRSet.HF_HCS==11 then return false end --回春术 禁用
	if not WR_SpellUsable("回春术")  then return false end

	if WR_DruidRestoration_HCS("player") then return true end
	
	local TempSum
	if InRaidOrParty=="raid" then
		TempSum=25
	elseif InRaidOrParty=="party" then
		TempSum=4
	end
	
	if TempSum~=4 then return false end --不在队伍
	
	for i= 1,TempSum,1 do
		if WR_DruidRestoration_HCS(InRaidOrParty..i) then return true end
	end
	return false
end
	
--激变蜂群 条件
function WR_DruidRestoration_JBFQ(Unit,Count)
	if WRSet.HF_JBFQ~=1 then
	--激变蜂群 关闭
		return false
	end

	if WR_SpellUsable("激变蜂群")
	--技能可用 资源可用
	and
	not UnitCanAttack("player",Unit)
	--单位是友善的
	and
	WR_GetUnitRange(Unit)<=45
	--单位距离<=45
	and
	WR_GetUnitBuffCount(Unit,"激变蜂群",true)==Count
	--激变蜂群 层数等于设定值
	and
	ResistOutburstTime>5
	--AOE来临之前5秒不要放蜂群
	then
		return true
	end
	return false
end
--[[
--施法过程 激变蜂群
function WR_DruidRestoration_Function_JBFQ()
	if GCD>ShiFaSuDu then return false end

	for i = 2,1,-1 do
		--蜂群P
		if WR_DruidRestoration_JBFQ("player",i) then
			if UnitIsUnit("focus","player") then
				if WR_ColorFrame_Show("",i.."蜂群P") then return true end
			end
			if WR_FocusUnit("player","2蜂群") then return true end --焦点单位过程
		end
		
		for j = 1,4,1 do
			--蜂群party
			if WR_DruidRestoration_JBFQ("party"..j,i) then
				if UnitIsUnit("focus","party"..j) then
					if WR_ColorFrame_Show("",i.."蜂群P"..j) then return true end
				end
				if WR_FocusUnit("party"..j,i.."蜂群") then return true end --焦点单位过程
			end
		end
	end
	return false
end
--]]
--过程 愈合填充
function WR_DruidRestoration_Function_YHTC()
	if GCD>ShiFaSuDu then return false end

	if WR_DruidRestoration_YH()
	and
	(
		FocusHP<0.65 --目标血量<65%
		or
		ResistOutburst5 --尖刺型伤害，施法时间剩余小于5秒
		or
		WR_UnitAssistDebuff("focus") --目标有需要协助的Debuff存在
		or
		not PlayerInCombat --不在战斗中
		or
		zhandoumoshi==1 --爆发 开启
	)
	then
		if WR_ColorFrame_Show("SF6","愈合填充") then return true end
	end
	return false
end
--[[
--智能目标 找出最佳单位
function WR_DruidRestoration_BestUnit()
	local Range
	if CatForm then
	--猎豹形态
		Range=7
	else
		Range=45
	end
	
	if not WR_CanTab() then
	--如果不可切目标
		return "target"	--不要切目标
	end
	
	if TargetRange<=Range	--单位距离N码内
	and
	TargetInCombat	--单位可攻击
	and
	TargetDeathTime>12
	--单位死亡时间>12秒
	then
		if Range==45 then
			if WR_GetUnitDebuffInfo("target","阳炎术",true)<5.4 then
				--BestWeight=BestWeight+1
				return "target"
			end
			if WR_GetUnitDebuffInfo("target","月火术",true)<5.4 then
				--BestWeight=BestWeight+1
				return "target"
			end
		else
			if WR_GetUnitDebuffInfo("target","斜掠",true)<4.5 then
				--BestWeight=BestWeight+1
				return "target"
			end
		end
	end
	
	for i=1,4,1 do
		local TempUnit="party"..i.."target"
--		local UnitClass=UnitClassification(TempUnit)
		if WR_GetUnitRange(TempUnit)<=Range	--单位距离N码内
		and
		WR_TargetInCombat(TempUnit)	--单位可攻击
		and
		UnitHealth(TempUnit)/UnitHealthMax(TempUnit)<0.99
		--单位血量比例<100%
		and
		WR_GetUnitDeathTime(TempUnit)>6
		--单位死亡时间>6秒
		then
			if Range==45 then
				if WR_GetUnitDebuffInfo(TempUnit,"阳炎术",true)<5.4 then
					return TempUnit
				end
				if WR_GetUnitDebuffInfo(TempUnit,"月火术",true)<5.4 then
					return TempUnit
				end
			else
				if WR_GetUnitDebuffInfo(TempUnit,"斜掠",true)<4.5 then
					return TempUnit
				end
			end
		end
	end

	if not TargetInCombat then
	--单位不可攻击
		for i=1,4,1 do
			local TempUnit="party"..i.."target"
			if WR_GetUnitRange(TempUnit)<=Range	--单位距离N码内
			and
			WR_TargetInCombat(TempUnit)	--单位可攻击
			and
			UnitHealth(TempUnit)/UnitHealthMax(TempUnit)<0.99
			--单位血量比例<100%
			and
			UnitGroupRolesAssigned("party"..i)=="TANK"
			--单位是坦克
			then
				return TempUnit
			end
		end		
	end

	return "target"
end
--]]
--星涌术
function WR_DruidRestoration_XYS(Unit)
	if UnitHealth(Unit)/UnitHealthMax(Unit)<0.95 --单位血量比例<95%
	and WR_GetUnitRange(Unit)<=45	--单位距离<=45
	and WR_TargetInCombat(Unit)	--目标在战斗
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("SF9","星涌"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"星涌") then return true end --焦点单位过程
	end
	return false
end

--星涌术
function WR_DruidRestoration_Function_XYS()
	if not WR_SpellUsable("星涌术") then return false end	--技能不可用
	
	if WR_DruidRestoration_XYS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_XYS(TempUnit) then return true end
	end
	return false
end

--阳炎术
function WR_DruidRestoration_YYS(Unit)
	if UnitHealth(Unit)/UnitHealthMax(Unit)<1 --单位血量比例<100%
	and WR_CanDot(Unit) --可以上DOT的单位
	and WR_GetUnitRange(Unit)<=45	--单位距离<=45
	and WR_GetUnitDebuffInfo(Unit,"阳炎术",true)<=5.4 --阳炎术debuff剩余时间
	and WR_TargetInCombat(Unit)	--目标在战斗
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSP","阳炎"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"阳炎") then return true end --焦点单位过程
	end
	return false
end

--阳炎术
function WR_DruidRestoration_Function_YYS()
	if not WR_SpellUsable("阳炎术") then return false end	--技能不可用
	if CatForm and UnitPower("player",3)>=40 and TargetCloseRange then return false end	--猫德形态有能量并且在近距离
	
	if WR_DruidRestoration_YYS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_YYS(TempUnit) then return true end
	end
	return false
end

--月火术
function WR_DruidRestoration_YHS(Unit)
	if UnitHealth(Unit)/UnitHealthMax(Unit)<1 --单位血量比例<100%
	and WR_CanDot(Unit) --可以上DOT的单位
	and WR_GetUnitRange(Unit)<=45	--单位距离<=45
	and WR_GetUnitDebuffInfo(Unit,"月火术",true)<=5.4 --月火术debuff剩余时间
	and WR_TargetInCombat(Unit)	--目标在战斗
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSL","月火"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"月火") then return true end --焦点单位过程
	end
	return false
end

--月火术
function WR_DruidRestoration_Function_YHS()
	if not WR_SpellUsable("月火术") then return false end	--技能不可用
	if CatForm and UnitPower("player",3)>=40 and TargetCloseRange then return false end	--猫德形态有能量并且在近距离
	
	if WR_DruidRestoration_YHS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_YHS(TempUnit) then return true end
	end
	return false
end

--星火术
function WR_DruidRestoration_XHS(Unit)
	if WR_GetUnitRange(Unit)<=45	--单位距离<=45
	and WR_TargetInCombat(Unit)	--目标在战斗
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSK","星火"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"星火") then return true end --焦点单位过程
	end
	return false
end

--星火术
function WR_DruidRestoration_Function_XHS()
	if zhandoumoshi==1 then return false end	--开启爆发
	if not WR_SpellUsable("星火术") then return false end	--技能不可用
	if InBossCombat then return false end	--BOSS战斗
	if HUCountRange45<2 then return false end	--45码单位数量<2
	if WR_GetUnitBuffTime("player",429474)==0 and ( PlayerMove or WR_StopCast(WR_GetTrueCastTime("星火术")) ) then return false end	--盛放注能不存在 并且 (玩家移动 或者 施法会被打断) 
	
	if WR_DruidRestoration_XHS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_XHS(TempUnit) then return true end
	end
	return false
end

--愤怒
function WR_DruidRestoration_FN(Unit)
	if WR_GetUnitRange(Unit)<=45	--单位距离<=45
	and WR_TargetInCombat(Unit)	--目标在战斗
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSO","愤怒"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"愤怒") then return true end --焦点单位过程
	end
	return false
end

--愤怒
function WR_DruidRestoration_Function_FN()
	if not WR_SpellUsable("愤怒") then return false end	--技能不可用
	if not TreeForm and WR_GetUnitBuffTime("player",429474)==0 and ( PlayerMove or WR_StopCast(WR_GetTrueCastTime("愤怒")) ) then return false end	--没化身 没盛放注能 并且 (玩家移动 或者 会被打断)
	
	if WR_DruidRestoration_FN("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_FN(TempUnit) then return true end
	end
	return false
end	

--野性之心 施法条件
function WR_DruidRestoration_YXZX()
	if WR_SpellUsable("野性之心") --技能可用 资源可用
	and PlayerInCombat --单位战斗中
	and InBossCombat --BOSS战斗
	--and CatForm --猎豹形态
	then
		if WR_ColorFrame_Show("ASF2","野性之心") then return true end
	end
	return false
end



--获取精通加成比例
function WR_DruidRestoration_GetADD_Mastery(Unit)
	local TempSum=1
	local Mastery=GetMastery()/2/100

	if WR_GetUnitBuffTime(Unit,"生命绽放",true)~=0 then
		if IsPlayerSpell(392256) then
		--已学技能 祥和绽放
			TempSum=TempSum+Mastery*3
		else	
			TempSum=TempSum+Mastery
		end
	end
	if WR_GetUnitBuffTime(Unit,"愈合",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,"回春术",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,"林地护理",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,"激变蜂群",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,"栽培",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,"春暖花开",true)~=0 then TempSum=TempSum+Mastery end
	if WR_GetUnitBuffTime(Unit,48438,true)~=0 then TempSum=TempSum+Mastery end	--野性成长
	if WR_GetUnitBuffTime(Unit,102352,true)~=0 then TempSum=TempSum+Mastery end	--塞纳里奥结界

	return TempSum
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_DruidRestoration_LastSpellTime()
	if DruidRestorationLastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="愈合" then
					--释放成功的技能名称
						YH_CastTime=GetTime()	--获取 愈合 施法成功时间
					end
				end
			end
	end)
	DruidRestorationLastSpellIsOpen=true                       
end

--特殊战斗判断
function WR_DruidRestoration_SpecialCombat()
	SpecialCombat_HCS=false
	SpecialCombat_CanHot=true
	
	if WR_GetUnitBuffCount("boss1",389490)>=20 then
	----注能老1,虹吸能量BUFF层数>=20
		SpecialCombat_HCS=true
	end
	
	for i=1,40,1 do
		local SpecialName_HCS={[1]="不屈者卡金",[2]="符文保护者",[3]="绝顶焰翼鸦",[4]="注能者萨莉亚",[5]="大引导者莱瓦迪",[6]="亵渎者德拉加尔",[7]="暴风引导者",[8]="虚缚抢劫者",[9]="",[10]="",}
		local SpecialName_CanHot={[1]="守护者哨兵",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",}
		
		local j = 1
		while (SpecialName_HCS[j]~=nil)
		do
			if UnitName("nameplate"..i)==SpecialName_HCS[j] then
			--如果目标出现
				SpecialCombat_HCS=true
				break
			end
			j = j + 1
		end
		
		local k = 1
		while (SpecialName_CanHot[k]~=nil)
		do
			if UnitName("nameplate"..i)==SpecialName_CanHot[k] then
			--如果目标出现
				SpecialCombat_CanHot=false
				break
			end
			k = k + 1
		end
	end
end



--取消形态
function WR_DruidRestoration_QXXT()
	if CatForm
	--猎豹形态
	and
	UnitPower("player",3)<35
	--猎豹能量<35
	then
		return true
	end
	return false
end




--割裂
function WR_DruidRestoration_GeLie(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and WR_GetUnitDebuffInfo(Unit,"割裂",true)<=7.2 --割裂 debuff剩余时间
	and WR_GetUnitDeathTime(Unit) --单位死亡时间>6秒
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSJ","割裂"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"割裂") then return true end --焦点单位过程
	end
	return false
end

function WR_DruidRestoration_Function_GeLie()
	if not WR_SpellUsable("割裂") then return false end --技能不可用
	if not CatForm then return false end --不是猎豹形态
	if UnitPower("player",4)<5 then return false end --能量<5
	
	if WR_DruidRestoration_GeLie("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_GeLie(TempUnit) then return true end
	end
	return false
end

--凶猛撕咬
function WR_DruidRestoration_XMSY(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and ( WR_GetUnitDebuffInfo(Unit,"割裂",true)>7.2 or WR_GetUnitDeathTime(Unit)<6 ) --割裂 debuff剩余时间>7.2秒 或 单位死亡时间<6秒
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSU","凶猛"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"凶猛") then return true end --焦点单位过程
	end
	return false
end

function WR_DruidRestoration_Function_XMSY()
	if not WR_SpellUsable("凶猛撕咬") then return false end --技能不可用
	if not CatForm then return false end --不是猎豹形态
	if UnitPower("player",4)<5 then return false end --能量<5
	
	if WR_DruidRestoration_XMSY("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_XMSY(TempUnit) then return true end
	end
	return false
end

--痛击
function WR_DruidRestoration_TJ(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and WR_GetUnitDebuffInfo(Unit,"痛击",true)<=4.5 --痛击 debuff剩余时间
	then
		if WR_ColorFrame_Show("CSH","痛击") then return true end
	end
	return false
end

--痛击
function WR_DruidRestoration_Function_TJ()
	if not WR_SpellUsable("痛击") then return false end --技能不可用
	if not CatForm then return false end --不是猎豹形态
	if not IsPlayerSpell(106832) then return false end --没学痛击
	
	if WR_DruidRestoration_TJ("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_TJ(TempUnit) then return true end
	end
end

--斜掠
function WR_DruidRestoration_XL(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and WR_GetUnitDebuffTime(Unit,"斜掠",true)<=4.5 --斜掠 debuff剩余时间
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSM","斜掠"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"斜掠") then return true end --焦点单位过程
	end
	return false
end

--施法过程 斜掠
function WR_DruidRestoration_Function_XL()
	if not WR_SpellUsable("斜掠") then return false end	--技能不可用
	if not CatForm and not IsPlayerSpell(449193) then return false end --不在猎豹形态并且也没学习[自如变形]天赋
	if UnitPower("player",4)>=5 and CatForm then return false end --连击点>=5满了 并且 在猎豹形态

	if WR_DruidRestoration_XL("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_XL(TempUnit) then return true end
	end
	return false
end

--横扫
function WR_DruidRestoration_HS(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and HUCountRangeClose>=8	--2码单位数量>=8
	then
		if WR_ColorFrame_Show("CSB","横扫") then return true end
	end
	return false
end

--横扫
function WR_DruidRestoration_Function_HS()
	if not WR_SpellUsable("横扫") then return false end	--技能不可用
	if not CatForm then return false end --不是猎豹形态
	
	if WR_DruidRestoration_HS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_HS(TempUnit) then return true end
	end
	return false
end

--撕碎
function WR_DruidRestoration_SS(Unit)
	if C_Spell.IsSpellInRange("撕碎",Unit)	--单位在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and HUCountRangeClose<8	--2码内敌人数量
	then
		if UnitIsUnit("focus",Unit) then	--目标是指定单位
			if WR_ColorFrame_Show("CSI","撕碎"..Unit) then return true end
		end
		if WR_FocusUnit(Unit,"撕碎") then return true end --焦点单位过程
	end
	return false
end

--撕碎
function WR_DruidRestoration_Function_SS()
	if not WR_SpellUsable("撕碎") then return false end	--技能不可用
	if not CatForm and not IsPlayerSpell(449193) then return false end --不在猎豹形态并且也没学习[自如变形]天赋
	if UnitPower("player",4)>=5 and CatForm then return false end --连击点>=5满了 并且 在猎豹形态

	if WR_DruidRestoration_SS("target") then return true end
	
	for i = 1 , 4 do
	local TempUnit="party"..i.."target"
		if WR_DruidRestoration_SS(TempUnit) then return true end
	end
	return false
end

--[[
--枭兽形态
function WR_DruidRestoration_XSXT()
	if WR_SpellUsable("枭兽形态")
	--技能可用 资源可用
	and
	not MoonkinForm
	--不是 枭兽形态
	and
	not TreeForm --不是 树形态
	and
	TargetInCombat
	--单位可攻击
	and
	TargetRange>15
	--单位距离>15
	and
	PlayerInCombat
	--玩家战斗中
	and
	TargetRange<=45
	--单位距离<=45
	and
	not ResistSustained
	--持续型伤害
	and
	ResistOutburstTime>5
	--尖刺型伤害，施法时间剩余小于5秒
	then
		return true
	end
	return false
end
--]]
























