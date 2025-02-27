--野德运行库
function WR_DruidFeral()
	if GetSpecialization()~=2 then	--如果不是野德(2)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	if DruidFeralVariable~=true then
		NPRange={}	--初始化单位距离
		NPGLDebuffTime={}	--初始化单位割裂剩余时间
		NPTJDebuffTime={}	--初始化单位痛击剩余时间
		NPXLDebuffTime={}	--初始化单位斜掠剩余时间
		XLTime=0	--初始化斜掠施法时间
		SSTime=0	--初始化撕碎施法时间
		YMHKTime=0	--初始化野蛮挥砍施法时间
		TJTime=0	--初始化痛击施法时间
		YXKLTime=0	--初始化野性狂乱施法时间
		HSTime=0	--初始化横扫施法时间
		YHSTime=0	--初始化月火术施法时间
		LastSpell=""
		DruidFeralVariable=true
	end
	
	if UnitAffectingCombat("player")==false then	--不在战斗中
		LastSpell=""
	end
	
	local T102={
    [1]=207252,
    [2]=207253,
    [3]=207254,
    [4]=207255,
    [5]=207257,
	}
	T102Count=WR_GetSuit(T102)	--获得10.2套装的数量
	
	gl_Time = WR_GetSpellValue("割裂","5点：在","秒")	--初始化割裂的持续时间
	
	XMSY_Energy=25
	if C_Spell.GetSpellPowerCost(22568)~=nil and C_Spell.GetSpellPowerCost(22568)[1]~=nil and C_Spell.GetSpellPowerCost(22568)[1].cost~=nil then	--获取技能最低能量。游戏内/dump GetSpellPowerCost(22568)可以看到该技能表格数据
		XMSY_Energy=C_Spell.GetSpellPowerCost(22568)[1].cost	--初始化凶猛撕咬需要的能量
	end
	
	PlayerHP = WR_GetUnitHP("player")	--获得自身真实带护盾的血量比例
	PlayerMove=WR_PlayerMove()	--获得自身是否在移动或者空中
	InTraining=WR_InTraining()	--木桩中
	--TargetInvincible=WR_Invincible("target")--获取目标是否无敌
	TargetIsNearby=IsSpellInRange("凶猛撕咬","target")	--目标正在附近
	
	GCD=WR_GetGCD("野性印记")	--获得公共冷却剩余时间或者当前施法剩余时间
	--CD_WLZZ=WR_GetGCD("万灵之召")	--获得万灵之召冷却剩余时间
	ComboPoints=UnitPower("player",4)	--获得连击点的数量
	if ComboPoints<5 and LastSpell=="野性狂乱" then
		ComboPoints=5
	end
	Energy=UnitPower("player",3)	--获得当前能量值
	--MaxEnergy=UnitPowerMax("player",3)	--获得最大能量值
	_ , PowerRegen = GetPowerRegen()	--获得每秒回能
	
	HaveGLDebuffInRange5=WR_GetHaveDebuffRangeUnitCount(5,"割裂",false)	--获得5码内有割裂DEBUFF的单位数量

	HUCountRange5=WR_GetSpellRangeHarmUnitCount("凶猛撕咬",false)

	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	TargetGLDebuffTime=WR_GetUnitDebuffTime("target","割裂",true)	--获得目标割裂DEBUFF剩余时间
	TargetXLDebuffTime=WR_GetUnitDebuffTime("target",155722,true)	--获得目标斜掠DEBUFF剩余时间
	TargetTJDebuffTime=WR_GetUnitDebuffTime("target","痛击",true)	--获得目标痛击DEBUFF剩余时间
	TargetKLGJDebuffTime=WR_GetUnitDebuffTime("target","狂乱攻击",true)	--获得目标狂乱攻击DEBUFF剩余时间
	TargetSLDebuffTime=WR_GetUnitDebuffTime("target","撕裂",true)	--获得目标撕裂DEBUFF剩余时间
	TargetYXKLDebuffTime=WR_GetUnitDebuffTime("target","野性狂乱",true)	--获得目标野性狂乱DEBUFF剩余时间
	TargetYHSDebuffTime=WR_GetUnitDebuffTime("target","月火术",true)	--获得目标月火术DEBUFF剩余时间
	
	KBBuffTime,KBBuffCount,_=WR_GetUnitBuffInfo("player","狂暴")	--获得狂暴BUFF的数量
	HSBuffTime,HSBuffCount,_=WR_GetUnitBuffInfo("player","化身：阿莎曼之灵")	--获得化身：阿莎曼之灵BUFF的数量
	_,QXBuffCount,_=WR_GetUnitBuffInfo("player","潜行")	--获得潜行BUFF的数量
	_,JNSFBuffCount,_=WR_GetUnitBuffInfo("player","节能施法")	--获得节能施法BUFF的数量
	_,XXZJBuffCount,_=WR_GetUnitBuffInfo("player","血腥爪击")	--获得血腥爪击BUFF的数量
	_,MHZNBuffCount,_=WR_GetUnitBuffInfo("player","猛虎之怒")	--获得猛虎之怒BUFF的数量
	_,ZRTXBuffCount,_=WR_GetUnitBuffInfo("player","骤然突袭")	--获得骤然突袭BUFF的数量
	_,YRKLBuffCount,_=WR_GetUnitBuffInfo("player","阴燃狂乱")	--获得阴燃狂乱BUFF的数量
	_,PBSLBuffCount,_=WR_GetUnitBuffInfo("player","磅礴神力")	--获得磅礴神力BUFF的数量
	
	_,DJBSZDKWBuffCount,_=WR_GetUnitBuffInfo("player","顶级捕食者的渴望")	--获得顶级捕食者的渴望BUFF的数量
	YMHKCD=WR_GetGCD("野蛮挥砍")	--获得野蛮挥砍的CD
	YXKLCD=WR_GetGCD("野性狂乱")	--获得野性狂乱的CD
	MHZNCD=WR_GetGCD("猛虎之怒")	--获得猛虎之怒的CD
	XuXueZhua=false	--初始化是否需要续血爪
	if IsPlayerSpell(319439) and XXZJBuffCount==0 then	--and HSBuffCount==0 
	--血腥爪击天赋学习了 并且 血腥爪击BUFF不存在 -- 并且 化身不存在
		--XuXueZhua=true
	end
	TabXLInRange7=false	--初始化是否切目标
	TargetClass=UnitClassification("target")--判断单位的分类
	if InTraining or TargetClass=="worldboss" or TargetClass=="rareelite" or TargetClass=="rare" or TargetClass=="elite" then
	--如果正在训练 或者 单位类型为：世界BOSS 稀有精英 稀有 精英
		TargetClass="精英"
	end
	for i=1,40,1
	do
		local UName,_ = UnitName("nameplate"..i)
		local InRange=IsSpellInRange("凶猛撕咬","nameplate"..i)==1
		--if maxRange~=nil and maxRange>0 and not(WR_Invincible("nameplate"..i)) and UnitCanAttack("player","nameplate"..i) then
		if InRange and not(WR_Invincible("nameplate"..i)) and UnitCanAttack("player","nameplate"..i) then
		--目标距离>0 并且 目标不是无敌的 并且可以被攻击
			NPRange[i]=7
		else
			NPRange[i]=999
		end
		NPGLDebuffTime[i]=WR_GetUnitDebuffInfo("nameplate"..i,"割裂",true)	--获得单位割裂DEBUFF剩余时间
		NPTJDebuffTime[i]=WR_GetUnitDebuffInfo("nameplate"..i,"痛击",true)	--获得单位痛击DEBUFF剩余时间
		NPXLDebuffTime[i]=WR_GetUnitDebuffInfo("nameplate"..i,"斜掠",true)	--获得单位斜掠DEBUFF剩余时间
		local NPClass=UnitClassification("nameplate"..i)--判断单位的分类
		if UName~="虚体生物" then
			if InTraining or NPClass=="worldboss" or NPClass=="rareelite" or NPClass=="rare" or NPClass=="elite" then
			--如果正在训练 或者 单位类型为：世界BOSS 稀有精英 稀有 精英
				if NPdeathtime[i]>=12 and NPXLDebuffTime[i]==0 and NPRange[i]<=7 then
				--如果单位死亡时间>12 并且 单位身上没有斜掠 并且 单位距离<=7
					TabXLInRange7=true
				end
			end
		end
	end
	
	
	
	XMSY=WR_DruidFeral_XMSY()
	GL=WR_DruidFeral_GL()
	YSZN=WR_DruidFeral_YSZN()
	XL=WR_DruidFeral_XL()
	SS=WR_DruidFeral_SS()
	HS=WR_DruidFeral_HS()
	YMHK=WR_DruidFeral_YMHK()
	TJ=WR_DruidFeral_TJ()
	YXKL=WR_DruidFeral_YXKL()
	YHS=WR_DruidFeral_YHS()
	WR_DruidFeral_LastSpellTime()	--记录上一次使用获得连击点的技能时间
	WR_DruidFeral_BestCPSpell()	--最佳获得连击点技能
	WR_DruidFeral_BestFinishSpell()	--获得最佳终结技
	
	
	
	
	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_DruidCreateMacroButton() --初始化宏
	end



	if MSG==1 then
		print("连击点:"..ComboPoints.."，能量:"..Energy.."/"..MaxEnergy)
		local Temp_Text
		Temp_Text="野性狂乱"..math.ceil(YXKL).."，斜掠"..math.ceil(XL).."，撕碎"..math.ceil(SS).."，痛击"..math.ceil(TJ)
		if IsPlayerSpell(155580) then
		--点了[月之灵]天赋
			Temp_Text=Temp_Text.."，月火术"..math.ceil(YHS)
		end
		if IsPlayerSpell(202028) then
		--点了[野蛮挥砍]天赋
			Temp_Text=Temp_Text.."，野蛮挥砍"..math.ceil(YMHK)
		else
			Temp_Text=Temp_Text.."，横扫"..math.ceil(HS)
		end
		print(Temp_Text)
		Temp_Text="凶猛撕咬"..math.ceil(XMSY).."，割裂"..math.ceil(GL)
		if IsPlayerSpell(285381) then
			Temp_Text=Temp_Text.."，原始之怒"..math.ceil(YSZN)
		end
		print(Temp_Text)
		Temp_Text="连续技时间："
		if IsPlayerSpell(274837) then
			if YXKLTime==0 then
				Temp_Text=Temp_Text.."野性狂乱"..0
			else
				Temp_Text=Temp_Text.."野性狂乱"..math.ceil(GetTime()-YXKLTime)
			end
		end
		if XLTime==0 then
			Temp_Text=Temp_Text.."，斜掠"..0
		else
			Temp_Text=Temp_Text.."，斜掠"..math.ceil(GetTime()-XLTime)
		end
		if SSTime==0 then
			Temp_Text=Temp_Text.."，撕碎"..0
		else
			Temp_Text=Temp_Text.."，撕碎"..math.ceil(GetTime()-SSTime)
		end
		if TJTime==0 then
			Temp_Text=Temp_Text.."，痛击"..0
		else
			Temp_Text=Temp_Text.."，痛击"..math.ceil(GetTime()-TJTime)
		end
		if IsPlayerSpell(155580) then
		--点了[月之灵]天赋
			if YHSTime==0 then
				Temp_Text=Temp_Text.."，月火术"..0
			else
				Temp_Text=Temp_Text.."，月火术"..math.ceil(GetTime()-YHSTime)
			end
		end
		if not(IsPlayerSpell(202028)) then
			if HSTime==0 then
				Temp_Text=Temp_Text.."，横扫"..0
			else
				Temp_Text=Temp_Text.."，横扫"..math.ceil(GetTime()-HSTime)
			end
		end
		if IsPlayerSpell(202028) then
			if YMHKTime==0 then
				Temp_Text=Temp_Text.."，野蛮挥砍"..0
			else
				Temp_Text=Temp_Text.."，野蛮挥砍"..math.ceil(GetTime()-YMHKTime)
			end
		end

		print(Temp_Text)
		print("最后一次技能："..LastSpell)
		print("最佳连击技：|c00ff6347"..BestCPSpell.."|cffffffff，最佳终结技：|c00ee82ee"..BestFinishSpell)
		print("是否切换目标：",TabXLInRange7)
		print("----------")
	end
	
	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------
	if IsFlying()
	--正在飞行
	or UnitIsDead("player")
	--玩家死亡
	or
	SpellIsTargeting()
	--进行范围选择
	or
	UnitChannelInfo("player")~=nil
	--单位引导施法 存在
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------

--战斗检测色块窗体---------------------------------------------------------------------------------------
	if not(UnitIsDead("player"))
	--玩家存活
	and
	(
		UnitAffectingCombat("player")
		--玩家在战斗
		or
		WR_InTraining()
		--打木桩
	)
	then
	--玩家在战斗中
		WR_CombatFrame:Show() --显示战斗色块窗体
	else
	--玩家不在战斗中
		WR_CombatFrame:Hide() --隐藏战斗色块窗体
	end	
--战斗检测色块窗体---------------------------------------------------------------------------------------

--爆发或非爆发检测---------------------------------------------------------------------------------------
	if zhandoumoshi~=1 then
		WR_HideColorFrame(1) --隐藏右上色块窗体
		WR_ShowColorFrame("CSC","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("CSV","平伤",0) --显示指定色块窗体
	end
--爆发或非爆发检测---------------------------------------------------------------------------------------

	--潜行--------------------------------------------------------------------------------------------
	if WR_SpellUsable("潜行")
	--技能可用
	and
	not(UnitAffectingCombat("player"))
	--非战斗中
	and
	WR_GetUnitBuffInfo("player","猎豹形态")~=0
	--猎豹形态 存在
	and
	WR_GetUnitBuffInfo("player","潜行")==0
	--猎豹形态 存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSJ","潜行",zhandoumoshi) --显示指定色块窗体
		return
	end
	--潜行--------------------------------------------------------------------------------------------

	--树皮术------------------------------------------------------------------------------------
	if WRSet.YX_SPS==1
	--树皮术 开启
	and IsPlayerSpell(22812)
	--已学 树皮术
	and
	WR_GetGCD("树皮术")<=GCD
	--技能冷却
	and
	PlayerHP<0.7
	--血量比例
	and
	(
		WR_ResistOutburst(1.5)
		--尖刺型伤害，施法时间剩余2秒
		or
		PlayerHP<0.4
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF3","树皮术",zhandoumoshi) --显示指定色块窗体
		return
	end
	--树皮术------------------------------------------------------------------------------------
	
	--生存本能------------------------------------------------------------------------------------
	if WRSet.YX_SCBN~=4
	--生存本能 选项不是关闭的
	and WR_SpellUsable("生存本能")
	--技能可用
	and PlayerHP<WRSet.YX_SCBN/10
	--血量比例<生存本能设定值/10
	and GCD<=ShiFaSuDu
	--公共冷却时间<=施法速度
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF10","生存本能",zhandoumoshi) --显示指定色块窗体
		return
	end
	--生存本能------------------------------------------------------------------------------------

	--甘霖------------------------------------------------------------------------------------
	if WRSet.YX_GL~=6
	--甘霖选项不是关闭的
	and IsPlayerSpell(108238)
	--已学 甘霖
	and PlayerHP<WRSet.YX_GL/10
	--血量比例<甘霖设定值/10
	and WR_GetGCD("甘霖")<=GCD
	--技能冷却
	and GCD<=ShiFaSuDu
	--公共冷却时间<=施法速度
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN6","甘霖",zhandoumoshi) --显示指定色块窗体
		return
	end
	--甘霖------------------------------------------------------------------------------------

	--愈合------------------------------------------------------------------------------------
	if WRSet.YX_YH~=6
	--愈合 选项不是关闭的
	and IsPlayerSpell(8936)
	--已学 愈合
	and PlayerHP<WRSet.YX_YH/10
	--血量比例<设定值/10
	and WR_GetGCD("愈合")<=GCD
	--技能冷却
	and GCD<=ShiFaSuDu
	--公共冷却时间<=施法速度
	and
	WR_GetUnitBuffInfo("player","掠食者的迅捷")~=0
	--掠食者的迅捷 BUFF存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACSF1","迅捷愈合",zhandoumoshi) --显示指定色块窗体
		return
	end
	--迅捷愈合------------------------------------------------------------------------------------

	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.YX_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.YX_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF8","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.YX_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.YX_ZLYS/10
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
				WR_ShowColorFrame("ASF9","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--自然的守护--------------------------------------------------------------------------------------------
	if WRSet.YX_ZRDSH==1
	--自然的守护 开启
	and
	IsPlayerSpell(124974)
	--已学 自然的守护
	and
	WR_GetGCD("自然的守护")<=GCD
	--技能冷却
	and
	WR_PartyLostHP("愈合")>0.40
	--全队掉血比例
	and
	UnitAffectingCombat("player")
	--玩家在战斗
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSB","自然守护",zhandoumoshi) --显示指定色块窗体
		return
	end
	--自然的守护--------------------------------------------------------------------------------------------
	
	--解除定身------------------------------------------------------------------------------------
	if WRSet.YX_JCDS==1
	--解除定身开启
	and
	WR_Unbind("player")
	--单位有可以解除定身的状态
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSM","解除定身",zhandoumoshi) --显示指定色块窗体
		return
	end
	--解除定身------------------------------------------------------------------------------------

	--迎头痛击T--------------------------------------------------------------------------------------------
	if WRSet.YX_YTTJ==1
	--迎头痛击 开启
	and
	WR_DruidFeral_YTTJ("target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","迎头痛击T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--迎头痛击T--------------------------------------------------------------------------------------------

	--迎头痛击M--------------------------------------------------------------------------------------------
	if WRSet.YX_YTTJ==1
	--迎头痛击 开启
	and
	WR_DruidFeral_YTTJ("mouseover")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","迎头痛击M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--迎头痛击M--------------------------------------------------------------------------------------------

	--目标P1-------------------------------------------------------------------------------------
	if WR_DruidFeral_ZNMB("party1target") then
	--队友智能目标条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF1","目标P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P1-------------------------------------------------------------------------------------

	--目标P2-------------------------------------------------------------------------------------
	if WR_DruidFeral_ZNMB("party2target") then
	--队友智能目标条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACN5","目标P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P2-------------------------------------------------------------------------------------

	--目标P3-------------------------------------------------------------------------------------
	if WR_DruidFeral_ZNMB("party3target") then
	--队友智能目标条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF3","目标P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P3-------------------------------------------------------------------------------------

	--目标P4-------------------------------------------------------------------------------------
	if WR_DruidFeral_ZNMB("party4target") then
	--队友智能目标条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF4","目标P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	--目标P4-------------------------------------------------------------------------------------

	--智能目标--------------------------------------------------------------------------------------------
	if WRSet.YX_ZNMB==1
	--智能目标 开启
	and
	WR_GetRangeHarmUnitCount(8,false)>=1
	--近战有单位
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	(
		not(WR_TargetInCombat("target"))
		--不可与目标战斗
		or
		IsSpellInRange("凶猛撕咬","target")~=1
		--目标不在技能范围内
		or
		(
		    TargetXLDebuffTime>3.6
			--目标斜掠DEBUFF剩余时间>3.6秒
			and
			TabXLInRange7
			--7码内有没有斜掠的单位
			and
			WR_InTraining()
			--在打木桩
			and
			GCD>0.5
			and
			ComboPoints<5  
			--连击点<5
		)
	)
	then
		WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF9","智能目标",zhandoumoshi) --显示指定色块窗体
		return
	end
	--智能目标--------------------------------------------------------------------------------------------


----施法速度检测，如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if GCD>ShiFaSuDu
	--GCD>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----施法速度检测，如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------

	--复生M--------------------------------------------------------------------------------------------
	if WRSet.YX_FS==1
	--复生 开启
	and
	WR_DruidBalance_FS("mouseover") then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSN","复生M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--复生M--------------------------------------------------------------------------------------------

	--蛮力猛击--------------------------------------------------------------------------------------------
	if WRSet.YX_MLMJ==1
	--蛮力猛击 开启
	and
	IsPlayerSpell(5211)
	--已学 蛮力猛击
	and
	WR_GetGCD("蛮力猛击")<=GCD
	--技能冷却
	then
		--猛击T--------------------------------------------------------------------------------------------
		if IsSpellInRange("蛮力猛击", "target")==1
		and
		WR_StunSpell("target")
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSU","猛击T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--猛击T--------------------------------------------------------------------------------------------	
		--猛击M--------------------------------------------------------------------------------------------
		if IsSpellInRange("蛮力猛击", "mouseover")==1
		and
		WR_StunSpell("mouseover")
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF11","猛击M",zhandoumoshi) --显示指定色块窗体
			return
		end
		--猛击M--------------------------------------------------------------------------------------------
	end
	--蛮力猛击--------------------------------------------------------------------------------------------

	--夺魂咆哮----------------------------------------------------------------------------------------------
	if WRSet.YX_DHPX==1
	--夺魂咆哮 开启
	and
	IsPlayerSpell(99)
	--已学 夺魂咆哮
	and
	WR_GetGCD("夺魂咆哮")<=GCD
	--技能冷却
	and
	WR_StunUnit(15)
	--范围内有需要控制的单位
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSU","夺魂咆哮",zhandoumoshi) --显示指定色块窗体
		return
	end
	--夺魂咆哮----------------------------------------------------------------------------------------------

	--安抚----------------------------------------------------------------------------------------------
	if IsPlayerSpell(2908)
	--已学 安抚
	and
	WRSet.YX_AF==1
	--安抚开启
	and
	WR_GetGCD("安抚")<=GCD
	--技能冷却
	then
		--安抚T--------------------------------------------------------------------
		if IsSpellInRange("安抚","target")==1
		--单位在技能范围内
		and
		WR_UnitEnragedBuff("target")
		--单位身上有激怒效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN8","安抚T",zhandoumoshi) --显示指定色块窗体
			return
		end
		--安抚T--------------------------------------------------------------------
		
		--安抚M--------------------------------------------------------------------
		if IsSpellInRange("安抚","mouseover")==1
		--单位在技能范围内
		and
		WR_UnitEnragedBuff("mouseover")
		--单位身上有激怒效果
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF","安抚M",zhandoumoshi) --显示指定色块窗体
			return
		end
		--安抚M--------------------------------------------------------------------
	end
	--安抚----------------------------------------------------------------------------------------------
	
	--野性印记--------------------------------------------------------------------------------------------
	if IsPlayerSpell(1126)
	--已学 野性印记
	and
	WR_PartyNotBuff("野性印记")
	--如果队友没有 野性印记
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF6","野性印记",zhandoumoshi) --显示指定色块窗体
		return
	end
	--野性印记--------------------------------------------------------------------------------------------

	--休眠--------------------------------------------------------------------------------------------
	if IsPlayerSpell(2637)
	--已学 休眠
	and
	WR_GetGCD("休眠")<=GCD
	--技能冷却
	and
	IsSpellInRange("休眠","mouseover")==1
	--单位在技能范围内
	and
	UnitName("mouseover")=="虚体生物"
	--单位是虚体生物
	and
	UnitCastingInfo("mouseover")~=nil
	--单位在施法
	and
	not(PlayerMove)
	--单位没有移动
	and
	not(WR_StopCast(1.2))
	--避免施法被沉默的情况
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSZ","休眠",zhandoumoshi) --显示指定色块窗体
		return
	end
	--休眠--------------------------------------------------------------------------------------------

	--清除腐蚀--------------------------------------------------------------------------------------------
	--清除M--------------------------------------------------------------------------------------------
	if WRSet.YX_QCFS~=3
	--清除腐蚀 开启
	and
	WR_DruidFeral_QCFS("mouseover")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSY","清除M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--清除M--------------------------------------------------------------------------------------------
	if WRSet.YX_QCFS==1 then
	--清除腐蚀 开启
		--清除P--------------------------------------------------------------------------------------------
		if WR_DruidFeral_QCFS("player") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN7","清除P",zhandoumoshi) --显示指定色块窗体
			return
		end
		--清除P--------------------------------------------------------------------------------------------
		--清除P1--------------------------------------------------------------------------------------------
		if WR_DruidFeral_QCFS("party1") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSP","清除P1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--清除P1--------------------------------------------------------------------------------------------
		--清除P2--------------------------------------------------------------------------------------------
		if WR_DruidFeral_QCFS("party2") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSL","清除P2",zhandoumoshi) --显示指定色块窗体
			return
		end
		--清除P2--------------------------------------------------------------------------------------------
		--清除P3--------------------------------------------------------------------------------------------
		if WR_DruidFeral_QCFS("party3") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSO","清除P3",zhandoumoshi) --显示指定色块窗体
			return
		end
		--清除P3--------------------------------------------------------------------------------------------
		--清除P4--------------------------------------------------------------------------------------------
		if WR_DruidFeral_QCFS("party4") then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSK","清除P4",zhandoumoshi) --显示指定色块窗体
			return
		end
		--清除P4--------------------------------------------------------------------------------------------
	end
	--清除腐蚀--------------------------------------------------------------------------------------------
	
	--猎豹形态---------------------------------------------------------------------------------------
	if IsPlayerSpell(768)
	--已学 猎豹形态
	and
	WR_GetUnitBuffInfo("player","猎豹形态")==0
	--猎豹形态 不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF7","猎豹形态",zhandoumoshi) --显示指定色块窗体
		return
	end
	--猎豹形态---------------------------------------------------------------------------------------

----目标战斗检测，如果满足条件，则不再往下执行操作-------------------------------------------------------------
	if 
	not(
		TargetIsNearby
		--目标在附近
		and
		UnitCastingInfo("player")==nil
		--没有引导
		and
		UnitChannelInfo("player")==nil
		--没有施法
		and
		WR_TargetInCombat("target")
		--可与目标战斗
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----目标战斗检测，如果满足条件，则不再往下执行操作-------------------------------------------------------------
	--武器
	if WR_DruidFeral_WQ()
	--武器 条件通过
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSX","武器",zhandoumoshi) --显示指定色块窗体
		return
	end

	--猛虎之怒---------------------------------------------------------------------------------------------
	if WR_SpellUsable("猛虎之怒")
	--技能可用
	and
	(
		Energy<=30
		--当前能量<=30
		or
		MHZNBuffCount==0
		--猛虎之怒BUFF不存在
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF6","猛虎之怒",zhandoumoshi) --显示指定色块窗体
		return
	end
	--猛虎之怒---------------------------------------------------------------------------------------------

	--化身---------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("狂暴")
	--技能可用
	and
	MHZNBuffCount>=1
	--猛虎之怒BUFF存在
	and
	(
		YRKLBuffCount>=0
		--阴燃狂乱BUFF存在
		or
		WR_SpellUsable("野性狂乱")
		--技能可用
		or
		T102Count<2
		--10.2套装<2
	)
	then
		--饰品1--------------------------------------------------------------------------------------------	
		if (WRSet.YX_SP==1 or WRSet.YX_SP==3)
		--使用1号饰品 或 使用1-2号饰品
		and WR_GetEquipCD(13) then
		--1号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF1","饰品1",zhandoumoshi) --显示指定色块窗体
			return
		end
		--饰品1--------------------------------------------------------------------------------------------	
		--饰品2--------------------------------------------------------------------------------------------	
			if (WRSet.YX_SP==2 or WRSet.YX_SP==3)
			--使用2号饰品 或 使用1-2号饰品
			and WR_GetEquipCD(14) then
			--2号饰品可以使用
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACF2","饰品2",zhandoumoshi) --显示指定色块窗体
				return
			end
		--饰品2--------------------------------------------------------------------------------------------	
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSI","化身",zhandoumoshi) --显示指定色块窗体
		return
	end
	--化身---------------------------------------------------------------------------------------------

	--野性狂乱---------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("野性狂乱")
	--技能可用
	and
	(
		BestCPSpell=="野性狂乱"
		--最佳连续技
		or
		ComboPoints<=1
		--连击点
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","野性狂乱",zhandoumoshi) --显示指定色块窗体
		return
	end
	--野性狂乱---------------------------------------------------------------------------------------------

	--万灵之召---------------------------------------------------------------------------------------------
	if zhandoumoshi==1
	--开爆发
	and
	WR_SpellUsable("万灵之召")
	--技能可用
	and
	ComboPoints<=3
	--连击点
	and
	MHZNBuffCount>=1
	--猛虎之怒BUFF存在
	and
	(
		YRKLBuffCount>0
		--阴燃狂乱BUFF存在
		or
		T102Count<2
		--10.2套装<2
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","万灵之召",zhandoumoshi) --显示指定色块窗体
		return
	end
	--万灵之召---------------------------------------------------------------------------------------------

	--免费凶猛---------------------------------------------------------------------------------------------
	if WR_SpellUsable("凶猛撕咬")
	--技能可用
	and
	DJBSZDKWBuffCount>=1
	--顶级捕食者的渴望存在
	and
	not(XuXueZhua)
	--不需要续血爪
--[[
	and
	(
		not(IsPlayerSpell(319439))
		--未学习[血腥爪击]
		or
		XXZJBuffCount>0
		--血腥爪击BUFF存在
	)
]]--
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF5","免费凶猛",zhandoumoshi) --显示指定色块窗体
		return
	end
	--免费凶猛---------------------------------------------------------------------------------------------

	--单体---------------------------------------------------------------------------------------------
	if HUCountRange5<=1
	--10码单位
	and
	not(XuXueZhua)
	--不需要续血爪
	and
	(
		(
			(KBBuffTime<1 and HSBuffTime<1)
			--狂暴Buff时间<1 并且 化身Buff时间<1
			and
			ComboPoints>=5
			--连击点>=5
		)
		or
		(
			(KBBuffTime>1 or HSBuffTime>1)
			--(狂暴Buff时间>1 或者 化身Buff时间>1)
			and
			PBSLBuffCount>=2
			--磅礴神力BUFF层数>=2
		)
	)
	then
		--割裂---------------------------------------------------------------------------------------------
		if WR_SpellUsable("割裂")
		--技能可用
		and
		TargetGLDebuffTime<=gl_Time*0.3
		--目标割裂时间<=割裂满持续时间*30%
		and
		TargetDeathTime-TargetGLDebuffTime>gl_Time
		--目标死亡时间-目标割裂时间>割裂满持续时间
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF6","S割裂",zhandoumoshi) --显示指定色块窗体
			return
		end
		--割裂---------------------------------------------------------------------------------------------

		--凶猛撕咬---------------------------------------------------------------------------------------------
		if WR_SpellUsable("凶猛撕咬")
		--技能可用
		and
		Energy>=XMSY_Energy*2 and Energy>=44
		--当前能量>=凶猛撕咬需要能量*2
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF5","S凶猛撕咬",zhandoumoshi) --显示指定色块窗体
			return
		end
		--凶猛撕咬---------------------------------------------------------------------------------------------
	end
	--单体---------------------------------------------------------------------------------------------
	
	--凶猛撕咬---------------------------------------------------------------------------------------------
	if WR_SpellUsable("凶猛撕咬")
	--技能可用
	and
	BestFinishSpell=="凶猛撕咬"
	and
	(
		TargetDeathTime-TargetGLDebuffTime<=gl_Time
		--目标死亡时间-目标割裂时间>割裂满持续时间
		or
		HUCountRange5>1
		--10码单位>1
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF5","凶猛撕咬",zhandoumoshi) --显示指定色块窗体
		return
	end
	--凶猛撕咬---------------------------------------------------------------------------------------------

	--割裂---------------------------------------------------------------------------------------------
	if WR_SpellUsable("割裂")
	--技能可用
	and
	BestFinishSpell=="割裂"
	and
	(
		TargetDeathTime-TargetGLDebuffTime<=gl_Time
		--目标死亡时间-目标割裂时间>割裂满持续时间
		or
		HUCountRange5>1
		--10码单位>1
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF6","割裂",zhandoumoshi) --显示指定色块窗体
		return
	end
	--割裂---------------------------------------------------------------------------------------------

	--原始之怒---------------------------------------------------------------------------------------------
	if WR_SpellUsable("原始之怒")
	--技能可用
	and
	BestFinishSpell=="原始之怒"
	and
	(
		TargetDeathTime-TargetGLDebuffTime<=gl_Time
		--目标死亡时间-目标割裂时间>割裂满持续时间
		or
		HUCountRange5>1
		--10码单位>1
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF7","原始之怒",zhandoumoshi) --显示指定色块窗体
		return
	end
	--原始之怒---------------------------------------------------------------------------------------------

	--激变蜂群---------------------------------------------------------------------------------------------
	if WR_SpellUsable("激变蜂群")
	--技能可用
	and
	QXBuffCount==0
	--潜行不存在
	and
	TargetDeathTime>12
	--目标死亡时间>12
	and
	TargetGLDebuffTime>0
	--目标割裂时间>0
	and
	XXZJBuffCount>0
	--血腥爪击BUFF存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF6","激变蜂群",zhandoumoshi) --显示指定色块窗体
		return
	end
	--激变蜂群---------------------------------------------------------------------------------------------

	--潜行---------------------------------------------------------------------------------------------
	if WR_SpellUsable("潜行")
	--技能可用
	and
	IsSpellOverlayed(5215)
	--技能激活触发
	and
	TargetXLDebuffTime<=3.6
	--目标的斜掠时间<=3.6
	and
	UnitAffectingCombat("player")
	--自己在战斗
	and
	HSBuffCount>0
	--化身BUFF>0
	and
	WR_InBossCombat()
	--BOSS战
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSJ","潜行",zhandoumoshi) --显示指定色块窗体
		return
	end
	--潜行---------------------------------------------------------------------------------------------

	--斜掠---------------------------------------------------------------------------------------------
	if WR_SpellUsable("斜掠")
	--技能可用
	and
	BestCPSpell=="斜掠"
	--最佳连续技
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CST","斜掠",zhandoumoshi) --显示指定色块窗体
		return
	end
	--斜掠---------------------------------------------------------------------------------------------

	--撕碎---------------------------------------------------------------------------------------------
	if WR_SpellUsable("撕碎")
	--技能可用
	and
	BestCPSpell=="撕碎"
	--最佳连续技
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF3","撕碎",zhandoumoshi) --显示指定色块窗体
		return
	end
	--撕碎---------------------------------------------------------------------------------------------

	--痛击---------------------------------------------------------------------------------------------
	if WR_SpellUsable("痛击")
	--技能可用
	and
	BestCPSpell=="痛击"
	--最佳连续技
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF1","痛击",zhandoumoshi) --显示指定色块窗体
		return
	end
	--痛击---------------------------------------------------------------------------------------------

	--野蛮挥砍---------------------------------------------------------------------------------------------
	if WR_SpellUsable("野蛮挥砍")
	--技能可用
	and
	BestCPSpell=="野蛮挥砍"
	--最佳连续技
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","野蛮挥砍",zhandoumoshi) --显示指定色块窗体
		return
	end
	--野蛮挥砍---------------------------------------------------------------------------------------------

	--横扫---------------------------------------------------------------------------------------------
	if WR_SpellUsable("横扫")
	--技能可用
	and
	BestCPSpell=="横扫"
	--最佳连续技
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF7","横扫",zhandoumoshi) --显示指定色块窗体
		return
	end
	--横扫---------------------------------------------------------------------------------------------
	
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end


--计算凶猛撕咬的伤害
function WR_DruidFeral_XMSY()
	if ComboPoints<5 then
	--连击点<5
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end

	if TargetDeathTime-TargetGLDebuffTime>gl_Time and HUCountRange5<=1 then
	--目标死亡时间-目标割裂时间>割裂满持续时间 并且 10码单位<=1
	--打单体
		return 0
	end

	if XuXueZhua then
	--如果需要续血爪
		return 0
	end
	
	--初始化凶猛撕咬
	local xmsy=0
	local xmsy_Sum=0
	local xmsy_Text
	xmsy_Text=GetSpellDescription(22568)
	if xmsy_Text~=nil then xmsy_Text=xmsy_Text:match("5点：([%d,%.]+)点伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","22568") end
	if xmsy_Text~=nil then xmsy_Text=xmsy_Text:gsub(",", "") end
	if xmsy_Text~=nil then xmsy = tonumber(xmsy_Text) end	--凶猛撕咬面板伤害

	local TempEnergy
	if IsPlayerSpell(393771) then
	--如果[冷酷捕手]天赋存在
		TempEnergy=20
	else
		TempEnergy=25
	end
	--print(xmsy_Sum)
	
	local JCLH=0
	if IsPlayerSpell(421432) then
	--[剑齿利喉]提高额外凶猛撕咬伤害的80%
		JCLH=0.8
	end
	if Energy>=TempEnergy*2 then
	--如果能量>=TempEnergy*2
		xmsy_Sum=xmsy*(2+JCLH)	--能量>=TempEnergy，伤害增加100%
	elseif Energy>=TempEnergy then
		xmsy_Sum=xmsy+xmsy/TempEnergy*(Energy-TempEnergy)*(1+JCLH)	--能量>=凶猛撕咬能量,增加伤害/凶猛撕咬能量*（当前能量-凶猛撕咬能量）*(1+剑齿利喉)
	end
	--print(xmsy_Sum)
	if IsPlayerSpell(384665) then
	--已学习[血腥气息]
		if TargetGLDebuffTime>0 then	--割裂时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
		if TargetXLDebuffTime>0 then	--斜掠时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
		if TargetTJDebuffTime>0 then	--痛击时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
		if TargetKLGJDebuffTime>0 then	--狂乱攻击时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
		if TargetSLDebuffTime>0 then	--撕裂时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
		if TargetYXKLDebuffTime>0 then	--野性狂乱时间
			xmsy_Sum=xmsy_Sum*(1+0.05)	--[血腥气息]每个流血造成伤害增加5%
		end
	end
	--print(xmsy_Sum)
	if HaveGLDebuffInRange5>=1 and IsPlayerSpell(391709) then
	--7码内中割裂的单位>=1 并且 已学习[野性难驯]391709
		if HaveGLDebuffInRange5<=6 then	--7码内中割裂的单位<=6（当前目标不算）
			xmsy_Sum=xmsy_Sum+xmsy*0.715*(HaveGLDebuffInRange5-1)	--凶猛撕咬+凶猛撕咬*(7码内中割裂的单位-1)*0.30
		else
			--7码内中割裂的单位>5
			local i
			xmsy_Sum=xmsy_Sum+xmsy*0.715*5	--初始化凶猛撕咬+凶猛撕咬*(5)*0.30
			for i=7,HaveGLDebuffInRange5,1	--计算超过6个怪物时受到的伤害（当前目标不算）
			do
				xmsy_Sum=xmsy_Sum+xmsy*0.715*math.sqrt(5/(i-1))	--超过5个会递减，公式为：第i个怪物受到的伤害=初始伤害*平方根(5/i)
			end
		end
	end
	--print(xmsy_Sum)
	return xmsy_Sum
end

--计算割裂的伤害
function WR_DruidFeral_GL()

	if TargetClass~="精英" then	--如果不是精英，就不要上流血
		return 0
	end

	if ComboPoints<5 then
	--连击点<5
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end

	if TargetGLDebuffTime>gl_Time*0.3 then	--当目标割裂时间>持续时间*0.3（满继承），则不续割裂
		return 0
	end

	if TargetDeathTime-TargetGLDebuffTime>gl_Time and HUCountRange5<=1 then
	--目标死亡时间-目标割裂时间>割裂满持续时间 并且 10码单位<=1
	--打单体
		return 0
	end

	if XuXueZhua then
	--如果需要续血爪
		return 0
	end

	--初始化割裂
	local gl=0
	local Temp_Text
	Temp_Text=GetSpellDescription(1079)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("5点.*造成([%d,]+)点伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","1079") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then gl = tonumber(Temp_Text) end	--割裂面板伤害
	--print(gl)

	gl=gl/gl_Time	--获得割裂秒伤
	
	if IsPlayerSpell(391347) then
	--学习了[撕裂切割]391347
		gl=gl*(1+0.15)
	end
	
	if TargetDeathTime>=TargetGLDebuffTime+gl_Time then
	--目标死亡时间>=目标割裂剩余时间+割裂持续时间
		gl=gl*gl_Time	--割裂秒伤*割裂持续时间，本次割裂实际能打出的伤害
	else
		gl=gl*(TargetDeathTime-TargetGLDebuffTime)	--割裂秒伤*(目标死亡时间-目标割裂时间)，本次割裂实际能打出的伤害
	end
	
	if IsPlayerSpell(384665) and TargetDeathTime>20 then
	--已学习[血腥气息]并且目标死亡时间>20秒
		if TargetDeathTime<=24 then
			gl=gl+(TargetDeathTime/5)*XMSY*0.05	--割裂需要加上单位死亡时间内凶猛撕咬次数（约5秒1次）*每次凶猛撕咬的收益
		else
			gl=gl+(24/5)*XMSY*0.05	--割裂需要加上单位24秒内凶猛撕咬次数（约5秒1次）*每次凶猛撕咬的收益
		end
	end
	
	return gl
end

--计算原始之怒的伤害
function WR_DruidFeral_YSZN()
	if ComboPoints<5 then
	--连击点<5
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if not(IsPlayerSpell(285381)) then
	--没学习[原始之怒]285381
		return 0
	end

	if TargetDeathTime-TargetGLDebuffTime>gl_Time and HUCountRange5<=1 then
	--目标死亡时间-目标割裂时间>割裂满持续时间 并且 10码单位<=1
	--打单体
		return 0
	end


	--初始化原始之怒直接伤害
	local yszn=0
	local Temp_Text
	Temp_Text=GetSpellDescription(285381)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("5点：造成([%d,%.]+)点伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","285381") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then yszn = tonumber(Temp_Text) end	--原始之怒面板伤害
	--print(yszn)
	
	--初始化割裂的伤害
	local gl=0
	local Temp_Text
	Temp_Text=GetSpellDescription(1079)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("5点.*造成([%d,]+)点伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","1079") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then gl = tonumber(Temp_Text) end	--割裂面板伤害
	
	gl=gl/gl_Time	--获得原始之怒（割裂）的持续秒伤
	--print(gl)

	if IsPlayerSpell(391347) then
	--学习了[撕裂切割]391347
		gl=gl*(1+0.15)
	end
	
	--初始化原始之怒持续秒
	local yszn_Time=0
	local Temp_Text
	Temp_Text=GetSpellDescription(285381)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("5点.*持续([%d,%.]+)秒") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","285381") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then yszn_Time = tonumber(Temp_Text) end	--原始之怒面板伤害
	--print(yszn_Time)
	local yszn_Time_XuShi=yszn_Time*0.3
	
	--计算11码范围内每个单位受到的直接伤害+割裂持续伤害+【旧伤新痛】造成的伤害
	local i
	local ysznSum=0
	for i=1,40,1
	do
		local ysznTemp=0
		if NPRange[i]<=11 then
		--单位距离<=11
			if NPGLDebuffTime[i]==0 then
			--单位割裂DEBUFF时间==0
				if NPdeathtime[i]>=yszn_Time then
				--单位死亡时间>=yszn_Time
					ysznTemp=yszn+gl*yszn_Time	--原始之怒+割裂*yszn_Time秒
				else
				--单位死亡时间<yszn_Time
					ysznTemp=yszn+gl*NPdeathtime[i]	--原始之怒+割裂*单位死亡时间
				end
				elseif NPGLDebuffTime[i]<=4 then
			--单位割裂DEBUFF时间<=4
				if NPdeathtime[i]>=yszn_Time then
				--单位死亡时间>=yszn_Time
					ysznTemp=yszn+gl*yszn_Time	--原始之怒+割裂*yszn_Time秒
				else
				--单位死亡时间<yszn_Time
					ysznTemp=yszn+gl*NPdeathtime[i]	--原始之怒+割裂*单位死亡时间
				end
				if IsPlayerSpell(391785) then
				--学习了[旧伤新痛]391785
					ysznTemp=ysznTemp+gl*NPGLDebuffTime[i]*0.5	--+割裂*现有割裂时间*0.5[旧伤新痛]
				end
			elseif NPGLDebuffTime[i]>4 then
			--单位割裂DEBUFF时间>4
				local yszn_MaxTime	--初始化原始之怒最大持续DOT时间
				if NPGLDebuffTime[i]-4+yszn_Time >= yszn_Time*1.3 then
					yszn_MaxTime=yszn_Time*1.3
				else
					yszn_MaxTime=NPGLDebuffTime[i]-4+yszn_Time
				end
				ysznTemp=yszn+gl*(yszn_MaxTime - (NPGLDebuffTime[i] - 4))	--原始之怒+割裂*(最大持续DOT时间-(现有割裂时间-4)
				if IsPlayerSpell(391785) then
				--学习了[旧伤新痛]391785
					ysznTemp=ysznTemp+gl*4*0.5	--+割裂*4*0.5[旧伤新痛]
				end
			end
		end
		ysznSum=ysznSum+ysznTemp	--把每一个单位受到伤害累计
	end
	return ysznSum
end

--计算斜掠的伤害
function WR_DruidFeral_XL()
	if TargetClass~="精英" then	--如果不是精英，就不要上流血
		return 0
	end
	
	if TargetXLDebuffTime>3.6 then	--当目标斜掠时间>3.6，则不续斜掠
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
--[[	
	if ComboPoints==4 and Energy+PowerRegen-35<20 then
	--连击点=4 并且 当前能量+每秒回能-35<20（留能量给终结技）
		return 0
	end
--]]

	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	--初始化斜掠直接伤害
	local xl=0
	local Temp_Text
	Temp_Text=GetSpellDescription(1822)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("目标，造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","1822") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then xl = tonumber(Temp_Text) end	--斜掠面板伤害
	--print(xl)
	
	--初始化斜掠流血秒伤
	local xl_dps=0
	local Temp_Text
	Temp_Text=GetSpellDescription(1822)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("额外造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","1822") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then xl_dps = tonumber(Temp_Text) end	--斜掠流血面板伤害
	--print(xl_dps)
	xl_dps=xl_dps/12	--获得斜掠流血秒伤
	

	if TargetDeathTime>=TargetXLDebuffTime+12 then
	--目标死亡时间>=目标斜掠剩余时间+12
		xl=xl+xl_dps*12	--斜掠+斜掠秒伤*12，本次斜掠实际能打出的伤害
	else
		xl=xl+xl_dps*(TargetDeathTime-TargetXLDebuffTime)	--斜掠+斜掠秒伤*(目标死亡时间-目标斜掠时间)，本次斜掠实际能打出的伤害
	end
	--print(xl)
	if IsPlayerSpell(390772) and (QXBuffCount>=1 or ZRTXBuffCount>=1) then
	--已学[扑击]天赋 并且(潜行存在 或者 骤然突袭)
		xl=xl*(1+0.6)	--潜行增加60%伤害
	end
	
	if WR_GetNoDebuffRangeUnitCount(5,"斜掠",false)>=2 and IsPlayerSpell(391700) then
	--5码内没有斜掠的单位>=2 并且 [双爪斜掠]已学习
		xl=xl*2
	end
	return xl
end

--计算撕碎的伤害
function WR_DruidFeral_SS()
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
--[[	
	if ComboPoints==4 and Energy+PowerRegen-40<20 and JNSFBuffCount==0 then
	--连击点=4 并且 当前能量+每秒回能-40<20（留能量给终结技） 并且 节能施法不存在
		return 0
	end
--]]
	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	
	--初始化撕碎伤害
	local ss=0
	local Temp_Text
	Temp_Text=GetSpellDescription(5221)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","5221") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then ss = tonumber(Temp_Text) end	--撕碎面板伤害
	--print(ss)
	
	ss=ss*1.2--本身对流血目标增加20%

	if IsPlayerSpell(390772) and (QXBuffCount>=1 or ZRTXBuffCount>=1) then
	--已学[扑击]天赋 并且(潜行存在 或者 骤然突袭)
		ss=ss*(1+0.6)*(1+GetCritChance()/100)	--潜行增加60%伤害，并且 双倍的爆击
	end
	
	if IsPlayerSpell(231063) then
	--如果学习了[无情爪击]231063
		ss=ss*(1+0.2)	--[无情爪击]提高撕碎20%伤害
	end
	
	return ss
end

--计算横扫的伤害
function WR_DruidFeral_HS()
	if IsPlayerSpell(202028) then
	--如果学习野蛮挥砍天赋
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
--[[
	if ComboPoints==4 and Energy+PowerRegen-35<20 and JNSFBuffCount==0 then
	--连击点=4 并且 当前能量+每秒回能-35<20（留能量给终结技）并且 节能施法不存在
		return 0
	end

--]]	
	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	
	
	--初始化横扫伤害
	local hs=0
	local Temp_Text
	Temp_Text=GetSpellDescription(106785)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","106785") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then hs = tonumber(Temp_Text) end	--横扫面板伤害
	--print(hs)

	if IsPlayerSpell(231063) then
	--如果学习了[无情爪击]231063
		if HaveGLDebuffInRange5>HUCountRange5/2 then
		--7码内有割裂单位>10码单位/2 或 7码内没有斜掠单位<10码单位/2 
			hs=hs*(1+0.15)	--[无情爪击]提高横扫15%伤害
		end
	end

	if HUCountRange5<=5 then	--如果10码单位数量<=5
		hs=hs*HUCountRange5	--横扫*10码单位数量
	else
		--如果10码单位数量>5
		local i
		local HS_Temp=hs*5	--初始化横扫临时变量=横扫伤害*5
		for i=6,HUCountRange5,1	--计算超过5个怪物时受到的伤害
		do
			HS_Temp=HS_Temp+hs*math.sqrt(5/i)	--超过5个会递减，公式为：第i个怪物受到的伤害=初始伤害*平方根(5/i)
		end
		hs=HS_Temp	--横扫获得最终的计算结果
	end
	return hs
end

--计算野蛮挥砍的伤害
function WR_DruidFeral_YMHK()
	if not(IsPlayerSpell(202028)) then
	--如果没有学习野蛮挥砍天赋
		return 0
	end
	
	if YMHKCD>GCD then
	--野蛮挥砍CD>GCD
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
--[[	
	if ComboPoints==4 and Energy+PowerRegen-25<20 and JNSFBuffCount==0 then
	--连击点=4 并且 当前能量+每秒回能-25<20（留能量给终结技）并且 节能施法不存在
		return 0
	end
--]]
	
	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	
	
	--初始化野蛮挥砍直接伤害
	local ymhk=0
	local Temp_Text
	Temp_Text=GetSpellDescription(202028)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","202028") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then ymhk = tonumber(Temp_Text) end	--野蛮挥砍面板伤害
	--print(ymhk)

	if IsPlayerSpell(231063) then
	--如果学习了[无情爪击]231063
		if HaveGLDebuffInRange5>HUCountRange5/2 then
		--7码内有割裂单位>10码单位/2 或 7码内没有斜掠单位<10码单位/2 
			ymhk=ymhk*(1+0.15)	--[无情爪击]提高野蛮挥砍15%伤害
		end
	end
	--print(ymhk)
	if HUCountRange5<=5 then	--如果10码单位数量<=5
		ymhk=ymhk*HUCountRange5	--野蛮挥砍*10码单位数量
	else
		--如果10码单位数量>5
		local i
		local ymhk_Temp=ymhk*5	--初始化野蛮挥砍临时变量=野蛮挥砍伤害*5
		for i=6,HUCountRange5,1	--计算超过5个怪物时受到的伤害
		do
			ymhk_Temp=ymhk_Temp+ymhk*math.sqrt(5/i)	--超过5个会递减，公式为：第i个怪物受到的伤害=初始伤害*平方根(5/i)
		end
		ymhk=ymhk_Temp	--野蛮挥砍获得最终的计算结果
	end
	--print(ymhk)
	return ymhk
end

--计算痛击的伤害
function WR_DruidFeral_TJ()
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
--[[	
	if ComboPoints==4 and Energy+PowerRegen-40<20 and JNSFBuffCount==0 then
	--连击点=4 并且 当前能量+每秒回能-40<20（留能量给终结技）并且 节能施法不存在
		return 0
	end
--]]
	
	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	
	
	--初始化痛击直接伤害
	local tj=0
	local Temp_Text
	Temp_Text=GetSpellDescription(106830)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","106830") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then tj = tonumber(Temp_Text) end	--痛击面板伤害
	--print(tj)

	--初始化痛击持续秒伤
	local tj_Dps=0
	local Temp_Text
	Temp_Text=GetSpellDescription(106830)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("额外造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","106830") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then tj_Dps = tonumber(Temp_Text) end	--痛击持续面板伤害
	--print(tj_Dps)
	
	--初始化痛击持续时间
	local tj_Time=0
	local Temp_Text
	Temp_Text=GetSpellDescription(106830)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("随后的([%d,%.]+)秒") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","106830") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then tj_Time = tonumber(Temp_Text) end	--痛击持续时间
	--print(tj_Time)
	
	
	
	tj_Dps=tj_Dps/tj_Time	--获得痛击秒伤
	
	
	
	
	
	

	--计算每一个能够被痛击攻击到的单位，统计他们受到的伤害
	local i
	local tjSum=0
	for i=1,40,1
	do
		local tjTemp=0
		if NPRange[i]<=10 then
		--单位距离<=10
			if NPTJDebuffTime[i]==0 then
			--当前痛击DEBUFF时间=0
				if NPdeathtime[i]>=tj_Time then
				--如果单位死亡时间>=12秒，获得最大12秒的续时
					tjTemp=tj+tj_Dps*tj_Time
				else
				--如果单位死亡时间<12秒，获得死亡时间的续时
					tjTemp=tj+tj_Dps*NPdeathtime[i]	
				end
			elseif NPTJDebuffTime[i]<=tj_Time*0.3 then
			--当前痛击DEBUFF时间<3.6
				if NPdeathtime[i]>=tj_Time+NPTJDebuffTime[i] then
				--如果单位死亡时间>tj_Time+痛击DEBUFF时间，获得最大续时
					tjTemp=tj+tj_Dps*tj_Time	--获得最大续时
				else
				--如果单位死亡时间<tj_Time+痛击DEBUFF时间，获得单位死亡时间-当前痛击时间的续时
					if NPdeathtime[i]-NPTJDebuffTime[i]>=0 then
						tjTemp=tj+tj_Dps*(NPdeathtime[i]-NPTJDebuffTime[i])	--痛击直伤+痛击秒伤*(死亡时间-痛击剩余时间)
					else
						tjTemp=tj
					end
				end
			elseif NPTJDebuffTime[i]>tj_Time*0.3 then
			--当前痛击DEBUFF时间>3.6
				if NPdeathtime[i]>=tj_Time+tj_Time*0.3 then
				--如果单位死亡时间>tj_Time+3.6，获得最大续时
					if tj_Time+tj_Time*0.3-NPTJDebuffTime[i]>=0 then
						tjTemp=tj+tj_Dps*(tj_Time+tj_Time*0.3-NPTJDebuffTime[i])	--痛击直伤+痛击秒伤*(tj_Time+3.6-当前痛击DEBUFF时间)
					else
						tjTemp=tj
					end
				else
				--如果单位死亡时间<tj_Time+3.6，获得死亡前的续时
					if NPdeathtime[i]-NPTJDebuffTime[i]>=0 then
						tjTemp=tj+tj_Dps*(NPdeathtime[i]-NPTJDebuffTime[i])	--痛击直伤+痛击秒伤*(死亡时间-当前痛击DEBUFF时间)
					else
						tjTemp=tj
					end
				end
			end
		end
		tjSum=tjSum+tjTemp
	end
	return tjSum
end

--计算野性狂乱的伤害
function WR_DruidFeral_YXKL()
	if zhandoumoshi~=1 then
	--没开爆发
		return 0
	end
	
	if MHZNCD<=GCD+1 and MHZNBuffCount==0 then
	--猛虎之怒CD<=GCD+1 并且 猛虎之怒BUFF不存在
		return 0
	end
	
	if LastSpell~="凶猛撕咬" and LastSpell~="割裂" and LastSpell~="原始之怒" then
		return 0
	end
	if not(IsPlayerSpell(274837)) then
	--如果没有学习[野性狂乱]
		return 0
	end
	if YXKLCD>GCD then
	--野性狂乱CD>GCD
		return 0
		
	end
	
	if ComboPoints>=4 then
	--如果连击点>=4
		return 0
	end
	
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if IsPlayerSpell(319439) and XXZJBuffCount==0 then
    --已学习[血腥爪击] 并且 血腥爪击Buff==0
		return 0
	end
	
	--野性狂乱初始化伤害
	local YXKL=0
	local YXKL_LX=0
	local YXKL_Sum=0	--野性狂乱初始化伤害
	local YXKL_Text
	
	YXKL_Text=GetSpellDescription(274837)
	if YXKL_Text~=nil then YXKL_Text=YXKL_Text:match("([%d,%.]+)点物理伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","274837") end
	if YXKL_Text~=nil then YXKL_Text=YXKL_Text:gsub(",", "") end
	if YXKL_Text~=nil then YXKL = tonumber(YXKL_Text) end	--野性狂乱伤害
	
	YXKL_Text=GetSpellDescription(274837)
	if YXKL_Text~=nil then YXKL_Text=YXKL_Text:match("([%d,%.]+)点流血伤害") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","274837") end
	if YXKL_Text~=nil then YXKL_Text=YXKL_Text:gsub(",", "") end
	if YXKL_Text~=nil then YXKL_LX = tonumber(YXKL_Text) end	--野性狂乱伤害
	YXKL_LX=YXKL_LX/4.8	--获得野性狂乱DOT每秒伤害
	
	if TargetDeathTime>=4.8 then
	--目标死亡时间>=4.8秒
		YXKL_Sum=YXKL+YXKL_LX*4.8	--野性狂乱+野性狂乱流血秒伤*4.8秒
	else
		YXKL_Sum=YXKL+YXKL_LX*TargetDeathTime	--野性狂乱+野性狂乱流血秒伤*目标死亡时间
	end
	return YXKL_Sum
end

--计算月火术的伤害
function WR_DruidFeral_YHS()
	if not(IsPlayerSpell(155580)) then
	--如果没有学习[月之灵]
		return 0
	end
	if TargetYHSDebuffTime>4.8 then
	--如果目标月火术>4.8秒
		return 0
	end
	if not(UnitExists("target")) then	--单位不存在
		return 0
	end
	
	if KBBuffTime<1 and HSBuffTime<1 and ComboPoints>=5 and not(XuXueZhua) then
	--狂暴时间<1 并且 化身时间<1 并且 连击点>=5 并且 不需要续血爪
		return 0
	end
	
	if (KBBuffTime>1 or HSBuffTime>1) and PBSLBuffCount>=2 and not(XuXueZhua) then
	--(狂暴时间>1 或者 化身时间>1) 并且 磅礴神力>=2层 并且 不需要续血爪
		return 0
	end
	
	if LastSpell=="野性狂乱" and GetTime()-YXKLTime <1.5 then
		return 0
	end
	
	
	--月火术初始化伤害
	local YHS=0
	local YHS_Dot=0
	local YHS_Sum=0
	local Temp_Text
	
	Temp_Text=GetSpellDescription(155625)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("灼烧敌人，造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","155625") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then YHS = tonumber(Temp_Text) end	--月火术面板伤害
	--print(YHS)
	
	Temp_Text=GetSpellDescription(155625)
	if Temp_Text~=nil then Temp_Text=Temp_Text:match("额外造成([%d,%.]+)点") end
	--if Temp_Text==nil and GameStart==true then print("技能读取错误:","155625") end
	if Temp_Text~=nil then Temp_Text=Temp_Text:gsub(",", "") end
	if Temp_Text~=nil then YHS_Dot = tonumber(Temp_Text) end	--月火术面板伤害
	--print(YHS_Dot)
	YHS_Dot=YHS_Dot/16	--计算月火术秒伤
	
	if TargetDeathTime>=16+TargetYHSDebuffTime then
	--目标死亡时间>=16+目标月火术剩余时间
		YHS_Sum=YHS+YHS_Dot*16	--可以补满16秒
	else
	--目标死亡时间<16+目标月火术剩余时间
		YHS_Sum=YHS+YHS_Dot*(TargetDeathTime-TargetYHSDebuffTime)	--目标死亡时间-目标身上月火术剩余时间，等于可以补的月火术时间
	end
	return YHS_Sum
end

--最佳获得连击点技能
function WR_DruidFeral_BestCPSpell()
	BestCPSpell="无"
	BestCPSpellValue=0
--	if not(IsPlayerSpell(319439)) or (IsPlayerSpell(319439) and XXZJBuffCount>=1) then
	if not(IsPlayerSpell(319439)) or (IsPlayerSpell(319439) and XXZJBuffCount>=2) then
	--没有学习[血腥爪击] 或者 （已学习[血腥爪击] 并且 血腥爪击BUFF存在）
	--不需要考虑4秒内是否释放过的技能
		if XL>BestCPSpellValue then
			BestCPSpell="斜掠"
			BestCPSpellValue=XL
		end
		if SS>BestCPSpellValue then
			BestCPSpell="撕碎"
			BestCPSpellValue=SS
		end
		if HS>BestCPSpellValue then
			BestCPSpell="横扫"
			BestCPSpellValue=HS
		end
		if YMHK>BestCPSpellValue then
			BestCPSpell="野蛮挥砍"
			BestCPSpellValue=YMHK
		end
		if TJ>BestCPSpellValue then
			BestCPSpell="痛击"
			BestCPSpellValue=TJ
		end
		if YXKL>BestCPSpellValue then
			BestCPSpell="野性狂乱"
			BestCPSpellValue=YXKL
		end
		if YHS>BestCPSpellValue then
			BestCPSpell="月火术"
			BestCPSpellValue=YHS
		end
	end
--	if IsPlayerSpell(319439) and XXZJBuffCount==0 then
	if IsPlayerSpell(319439) and XXZJBuffCount<=1 then
	--已学习[血腥爪击] 并且 血腥爪击BUFF存在）
	--需要考虑4秒内是否释放过的技能
		if XL>BestCPSpellValue and GetTime()-XLTime>4 then
			BestCPSpell="斜掠"
			BestCPSpellValue=XL
		end
		if SS>BestCPSpellValue and GetTime()-SSTime>4 then
			BestCPSpell="撕碎"
			BestCPSpellValue=SS
		end
		if HS>BestCPSpellValue and GetTime()-HSTime>4 then
			BestCPSpell="横扫"
			BestCPSpellValue=HS
		end
		if YMHK>BestCPSpellValue and GetTime()-YMHKTime>4 then
			BestCPSpell="野蛮挥砍"
			BestCPSpellValue=YMHK
		end
		if TJ>BestCPSpellValue and GetTime()-TJTime>4 then
			BestCPSpell="痛击"
			BestCPSpellValue=TJ
		end
		if YXKL>BestCPSpellValue and GetTime()-YXKLTime>4 then
			BestCPSpell="野性狂乱"
			BestCPSpellValue=YXKL
		end
		if YHS>BestCPSpellValue and GetTime()-YHSTime>4 then
			BestCPSpell="月火术"
			BestCPSpellValue=YHS
		end
		
		local SpellSum_4S=0
		if GetTime()-XLTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-SSTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-HSTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-YMHKTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-TJTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-YXKLTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end
		if GetTime()-YHSTime<4 then
			SpellSum_4S=SpellSum_4S+1
		end

		local SpellSum_3S=0
		if GetTime()-XLTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-SSTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-HSTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-YMHKTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-TJTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-YXKLTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		if GetTime()-YHSTime<3 then
			SpellSum_3S=SpellSum_3S+1
		end
		
		local SpellSum_2S=0
		if GetTime()-XLTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-SSTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-HSTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-YMHKTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-TJTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-YXKLTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		if GetTime()-YHSTime<2 then
			SpellSum_2S=SpellSum_2S+1
		end
		
		local FreePower=0	--免费能量
		if JNSFBuffCount>=1 then	--节能施法BUFF
			FreePower=40	--免费能量
		end

		if SpellSum_4S>=2 then
		--4秒内连续技>=2
		elseif SpellSum_3S==1 and Energy>40+30-PowerRegen-FreePower then
		--3秒内连续技=1 并且 能量>40+30-每秒回能-免费能量
		--意思就是足够能量可以打两个技能续上
		elseif SpellSum_2S==0 and Energy>40+30-PowerRegen-FreePower then
		--2秒内连续技=0 并且 能量>40+30+40-每秒回能-免费能量
		--意思就是足够能量可以打三个技能续上
		else
		--如果上述都不成立
			BestCPSpell=""	--等待足够能量再打连续技续血爪
			if MSG==1 then
				print("|cffffdf00等待能量中.....")
			end
		end
		
		
	end
end

--获得最佳终结技
function WR_DruidFeral_BestFinishSpell()
	BestFinishSpell="无"
	BestFinishSpellValue=0
	if XMSY>BestFinishSpellValue then
		BestFinishSpell="凶猛撕咬"
		BestFinishSpellValue=XMSY
	end
	if GL>BestFinishSpellValue then
		BestFinishSpell="割裂"
		BestFinishSpellValue=GL
	end
	if YSZN>BestFinishSpellValue then
		BestFinishSpell="原始之怒"
		BestFinishSpellValue=YSZN
	end
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_DruidFeral_LastSpellTime()
	if LastSpellIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="斜掠" then
					--如果释放成功的是斜掠
						XLTime=GetTime()
						LastSpell="斜掠"
					elseif SpellName=="撕碎" then
					--如果释放成功的是撕碎
						SSTime=GetTime()
						LastSpell="撕碎"
					elseif SpellName=="野蛮挥砍" then
					--如果释放成功的是野蛮挥砍
						YMHKTime=GetTime()
						LastSpell="野蛮挥砍"
					elseif SpellName=="痛击" then
					--如果释放成功的是痛击
						TJTime=GetTime()
						LastSpell="痛击"
					elseif SpellName=="野性狂乱" then
					--如果释放成功的是野性狂乱
						YXKLTime=GetTime()
						LastSpell="野性狂乱"
					elseif SpellName=="横扫" then
					--如果释放成功的是野性狂乱
						HSTime=GetTime()
						LastSpell="横扫"
					elseif SpellName=="月火术" then
					--如果释放成功的是月火术
						YHSTime=GetTime()
						LastSpell="月火术"
					elseif SpellName=="凶猛撕咬" then
					--如果释放成功的是凶猛撕咬
						LastSpell="凶猛撕咬"
					elseif SpellName=="割裂" then
					--如果释放成功的是割裂
						LastSpell="割裂"
					elseif SpellName=="原始之怒" then
					--如果释放成功的是原始之怒
						LastSpell="原始之怒"
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end

--清除腐蚀 的先决条件
function WR_DruidFeral_QCFS(Unit)
	if IsPlayerSpell(2782)
	--已学 清除腐蚀
	and
	WR_GetGCD("清除腐蚀")<=GCD
	--技能冷却
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	IsSpellInRange("野性印记",Unit)==1
	--单位在技能范围内
	and
	WR_CanRemoveUnitDebuff(Unit)
	--单位有可驱散Debuff
	then
		return true
	end
	return false
end

--迎头痛击 施法条件
function WR_DruidFeral_YTTJ(Unit)
	if WR_SpellUsable("迎头痛击")
	--技能可用
	and
	IsSpellInRange("凶猛撕咬",Unit)==1
	--目标在技能范围
	and
	WR_GetCastInterruptible(Unit,InterruptTime)
	--指定"单位"施法剩余时间小于设定
	and
	WR_TargetInCombat(Unit)
	--但是可进行战斗
	then
		return true
	end
	return false
end

--智能目标 条件
function WR_DruidFeral_ZNMB(Unit)
	if WRSet.YX_ZNMB==1
	--智能目标 开启
	and
	IsSpellInRange("凶猛撕咬",Unit)==1
	--目标不在技能范围内
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	TargetXLDebuffTime>3.6
	--目标斜掠DEBUFF剩余时间>3.6秒
	and
	GCD>0.5
	--公共冷却时间
	and
	ComboPoints<5
	--连击点<5
	and
	not(WR_InBossCombat())
    --不在BOSS战斗中
	and
	WR_TargetInCombat(Unit)
	--单位可攻击
	and
	WR_GetUnitDebuffInfo(Unit,"斜掠",true)==0
	--单位没有我的 斜掠 DEBUFF
	then
		return true
	end
	return false
end

--智能目标 条件
function WR_DruidFeral_WQ()
	if zhandoumoshi==1
	--爆发 开启
	and
	QXBuffCount==0
	--潜行 BUFF不存在
	and
	WR_GetUnitRange("target")<=7
	--单位距离
	and
	GetInventoryItemID("player",16)==202569
	--已装备 [贾鲁翁，耄焰之柱]
	and
	WR_GetEquipCD(16)
	--物品CD冷却
	and
	WR_TargetInCombat("target")
	--单位可攻击
	then
		return true
	end
	return false
end