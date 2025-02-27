--武器战运行库
function WR_WarriorArms()
	if GetSpecialization()~=1 then	--如果不是武器(1)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.3
	
	WR_LFGList()	--获得预组队多语言列表
	WR_AllUnitRange={}	--初始化所有单位距离
	WR_BuffInfo_All={}	--初始化所有单位BUFF
	
	PlayerHP=1
	if UnitHealthMax("player")~=0 then
		PlayerHP=UnitHealth("player")/UnitHealthMax("player")
	end
	
	Rage=UnitPower("player",1)	--获得当前怒气值
	
	GCD=WR_GetGCD("断筋")	--获得公共冷却剩余时间或者当前施法剩余时间
	GCD_Max=WR_GetMaxGCD(1.5)	--最大GCD
	
	HUCountRangeJZ=WR_GetRangeHarmUnitCount(5,false)	--获得近战的战斗中敌人数量
	
	DebuffTime_SL,_,_=WR_GetUnitDebuffInfo("target","撕裂",true)	--撕裂 DEBUFF信息
	DebuffTime_ZS,_,_=WR_GetUnitDebuffInfo("target","重伤",true)	--重伤 DEBUFF信息
	DebuffTime_JRDJ,_,_=WR_GetUnitDebuffInfo("target","巨人打击",true)	--巨人打击 DEBUFF信息
	_,DebuffCount_KZSDJZ,_=WR_GetUnitDebuffInfo("target","刽子手的精准",true)	--刽子手的精准 DEBUFF信息

	_,BuffCount_YZ,_=WR_GetUnitBuffInfo("player","压制")	--压制 BUFF信息
	BuffTime_JF,_,_=WR_GetUnitBuffInfo("player","飓风")	--飓风 BUFF信息
	BuffTime_HSGJ,_,_=WR_GetUnitBuffInfo("player","横扫攻击")	--横扫攻击 BUFF信息
	BuffTime_CS,_,_=WR_GetUnitBuffInfo("player","猝死")	--猝死 BUFF信息
	BuffTime_TSXF,_,_=WR_GetUnitBuffInfo("player","天神下凡")	--天神下凡 BUFF信息
	_,BuffCount_WJSW,_=WR_GetUnitBuffInfo("player","武技神威")	--武技神威 BUFF信息
	BuffTime_ZZ,_,_=WR_GetUnitBuffInfo("player","主宰")	--主宰 BUFF信息
	BuffTime_LLDKY,_,_=WR_GetUnitBuffInfo("player","力量的考验")	--力量的考验 BUFF信息
	_,BuffCount_ZDZT,_=WR_GetUnitBuffInfo("player","战斗姿态")	--战斗姿态 BUFF信息







--[[
	_,XXKLBuffCount,_=WR_GetUnitBuffInfo("player","血腥疯狂")	--获得 血腥疯狂 BUFF的堆叠层数
	LMBuffTime,LMBuffCount,_=WR_GetUnitBuffInfo("player","鲁莽")	--获得 鲁莽 BUFF的堆叠层数
	_,KNSXBuffCount,_=WR_GetUnitBuffInfo("player","狂怒嗜血")	--获得 狂怒嗜血 BUFF的堆叠层数
	_,SYFZBuffCount,_=WR_GetUnitBuffInfo("player","肆意放纵")	--获得 肆意放纵 BUFF的堆叠层数
	JNBuffTime,JNBuffCount,_=WR_GetUnitBuffInfo("player","激怒")	--获得 激怒 BUFF的堆叠层数
	TSXFBuffTime,TSXFBuffCount,_=WR_GetUnitBuffInfo("player","天神下凡")	--获得 天神下凡 BUFF的堆叠层数
	_,KBZTBuffCount,_=WR_GetUnitBuffInfo("player","狂暴姿态")	--获得 狂暴姿态 BUFF的堆叠层数
	_,FYZTBuffCount,_=WR_GetUnitBuffInfo("player","防御姿态")	--获得 防御姿态 BUFF的堆叠层数
	_,XFZBuffCount,_=WR_GetUnitBuffInfo("player",85739)	--获得 旋风斩 BUFF的堆叠层数
	
	SXCrit=GetCritChance()/100+0.12*WQTXBuffCount+0.15*XXKLBuffCount	--嗜血暴击率
	
	if LMBuffCount>=1 then
		SXCrit=SXCrit+0.2	--嗜血暴击率
	end
	
	

	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	
	TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS
]]


	if WR_CreateMacroButtonInfo~=true and not(UnitAffectingCombat("player")) and WR_CreateMacroButtonPass()~=nil then
	--不在战斗中
		WR_CreateMacroButtonInfo=true
		WR_WarriorCreateMacroButton() --初始化宏
	end

	if MSG==1 then
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
		WR_ShowColorFrame("CSF12","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("CSF11","平伤",0) --显示指定色块窗体
	end
--爆发或非爆发检测---------------------------------------------------------------------------------------

	--剑在人在--------------------------------------------------------------------------------------------
	if WRSet.WQZ_JZRZ~=4
	--剑在人在 开启
	and
	IsPlayerSpell(118038)
	--已学 剑在人在
	and
	WR_GetSpellCD("剑在人在")<=GCD
	--技能冷却
	and
	PlayerHP<WRSet.WQZ_JZRZ/10
	--血量比例
	and
	UnitAffectingCombat("player")
	--玩家战斗中
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF2","剑在人在",zhandoumoshi) --显示指定色块窗体
		return
	end
	--剑在人在--------------------------------------------------------------------------------------------

	--苦痛免疫--------------------------------------------------------------------------------------------
	if WRSet.WQZ_KTMY~=4
	--苦痛免疫 开启
	and
	WR_SpellUsable("苦痛免疫")
	--技能可用 资源可用
	and
	PlayerHP<WRSet.WQZ_KTMY/10
	--血量比例
	and
	UnitAffectingCombat("player")
	--玩家战斗中
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF3","苦痛免疫",zhandoumoshi) --显示指定色块窗体
		return
	end
	--苦痛免疫--------------------------------------------------------------------------------------------
	
	--治疗石----------------------------------------------------------------------------------------------
	if WRSet.WQZ_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP<WRSet.WQZ_ZLS/10
	--血量比例<治疗石设定值/10
	then
		local count=GetItemCount("治疗石")
		--获取物品数量
		local start, duration, enable = GetItemCooldown("治疗石")
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","治疗石",zhandoumoshi) --显示指定色块窗体
			return
		end
	end
	--治疗石----------------------------------------------------------------------------------------------
	
	--治疗药水----------------------------------------------------------------------------------------------
	if WRSet.WQZ_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP<WRSet.WQZ_ZLYS/10
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
				WR_ShowColorFrame("SF4","治疗药水",zhandoumoshi) --显示指定色块窗体
				return
			end
		end
	end
	--治疗药水----------------------------------------------------------------------------------------------

	--法术反射--------------------------------------------------------------------------------------------
	if WRSet.WQZ_FSFS==1
	--法术反射 开启
	and
	IsPlayerSpell(23920)
	--已学天赋[法术反射]
	and
	WR_GetGCD("法术反射")<=GCD
	--技能冷却
	and
	WR_SpellReflection(0.35)
	--对我的施法<=0.35秒
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF1","法术反射",zhandoumoshi) --显示指定色块窗体
		return
	end
	--法术反射--------------------------------------------------------------------------------------------

	--无视苦痛--------------------------------------------------------------------------------------------
	if WRSet.WQZ_WSKT==1
	--无视苦痛 开启
	and
	WR_SpellUsable("无视苦痛")
	--技能可用 资源可用
	and
	(
		WR_WarriorArms_FYZT()
		--防御姿态 条件通过
		or
		PlayerHP<0.35
		--生命值低于35%
	)
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF7","无视苦痛",zhandoumoshi) --显示指定色块窗体
		return
	end
	--无视苦痛--------------------------------------------------------------------------------------------

	if WR_WarriorArms_FYZT()
	--防御姿态 条件通过
	then
		--防御姿态--------------------------------------------------------------------------------------------
		if WRSet.WQZ_FYZT==1
		--防御姿态 开启
		and
		IsPlayerSpell(386208)
		--已学天赋[防御姿态]
		and
		WR_GetGCD("防御姿态")<=GCD
		--技能冷却
		and
		FYZTBuffCount==0
		--防御姿态 BUFF不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF1","防御姿态",zhandoumoshi) --显示指定色块窗体
			return
		end
		--防御姿态--------------------------------------------------------------------------------------------
	else
		--战斗姿态--------------------------------------------------------------------------------------------
		if IsPlayerSpell(386164)
		--已学天赋[战斗姿态]
		and
		WR_GetGCD("战斗姿态")<=GCD
		--技能冷却
		and
		BuffCount_ZDZT==0
		--战斗姿态 BUFF不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSM","战斗姿态",zhandoumoshi) --显示指定色块窗体
			return
		end
		--战斗姿态--------------------------------------------------------------------------------------------
	end

	--智能目标--------------------------------------------------------------------------------------------
	if WRSet.WQZ_ZNMB==1
	--智能目标 开启
	and
	HUCountRangeJZ>=1
	and
	UnitAffectingCombat("player")
	--单位战斗中
	and
	(
		not(WR_TargetInCombat("target"))
		--不可与目标战斗
		or
		IsSpellInRange("猛击","target")~=1
		--目标不在技能范围内
	)
	then
		WR_ZNMB=true
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF10","智能目标",zhandoumoshi) --显示指定色块窗体
		return
	end
	--智能目标--------------------------------------------------------------------------------------------

	--拳击T--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ~=3
	--拳击 没有关闭
	and
	WR_WarriorArms_QJ("target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSI","拳击T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击T--------------------------------------------------------------------------------------------

	--拳击M--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ==1
	--拳击 智能
	and
	WR_WarriorArms_QJ("mouseover")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSF6","拳击M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击M--------------------------------------------------------------------------------------------
	
	--拳击P1--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ==1
	--拳击 智能
	and
	WR_WarriorArms_QJ("party1target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSF7","拳击P1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击P1--------------------------------------------------------------------------------------------
	
	--拳击P2--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ==1
	--拳击 智能
	and
	WR_WarriorArms_QJ("party2target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSF8","拳击P2",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击P2--------------------------------------------------------------------------------------------
	
	--拳击P3--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ==1
	--拳击 智能
	and
	WR_WarriorArms_QJ("party3target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF6","拳击P3",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击P3--------------------------------------------------------------------------------------------
	
	--拳击P4--------------------------------------------------------------------------------------------
	if WRSet.WQZ_QJ==1
	--拳击 智能
	and
	WR_WarriorArms_QJ("party4target")
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF7","拳击P4",zhandoumoshi) --显示指定色块窗体
		return
	end
	--拳击P4--------------------------------------------------------------------------------------------

----施法速度检测，如果满足以下任意条件，则不再往下执行操作-------------------------------------------------------------
	if GCD>ShiFaSuDu
	--GCD>施法速度
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----施法速度检测，如果满足以上任意条件，则不再往下执行操作-------------------------------------------------------------
	--破胆怒吼-------------------------------------------------------------------------------------------
	if WRSet.WQZ_PDNH==1
	--破胆怒吼 开启
	and
	IsPlayerSpell(5246)
	--已学天赋[破胆怒吼]
	and
	WR_GetGCD("破胆怒吼")<=GCD
	--技能冷却
	and
	IsSpellInRange("破胆怒吼","target")==1
	--目标在技能范围
	and
	WR_StunUnit(8)
	--范围击晕施法
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ASF12","破胆怒吼",zhandoumoshi) --显示指定色块窗体
		return
	end
	--破胆怒吼-------------------------------------------------------------------------------------------

	--风暴之锤T-------------------------------------------------------------------------------------------
	if WR_WarriorArms_FBZC("target") then
	--风暴之锤 技能条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSJ","风暴之锤T",zhandoumoshi) --显示指定色块窗体
		return
	end
	--风暴之锤T-------------------------------------------------------------------------------------------

	--风暴之锤M-------------------------------------------------------------------------------------------
	if WR_WarriorArms_FBZC("mouseover") then
	--风暴之锤 技能条件
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CSU","风暴之锤M",zhandoumoshi) --显示指定色块窗体
		return
	end
	--风暴之锤M-------------------------------------------------------------------------------------------

	--战斗怒吼-------------------------------------------------------------------------------------------
	if IsPlayerSpell(6673)
	--已学 战斗怒吼
	and
	WR_GetSpellCD("战斗怒吼")<=GCD
	--技能冷却
	and
	WR_PartyNotBuff("战斗怒吼")
	--如果队友没有 战斗怒吼
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF8","战斗怒吼",zhandoumoshi) --显示指定色块窗体
		return
	end
	--战斗怒吼-------------------------------------------------------------------------------------------
	
	--集结呐喊-------------------------------------------------------------------------------------------
	if WRSet.WQZ_JJNH~=4
	--集结呐喊 开启
	and
	IsPlayerSpell(97462)
	--已学习 集结呐喊
	and
	WR_GetGCD("集结呐喊")<=GCD
	--技能冷却
	and
	PlayerHP<=WRSet.WQZ_JJNH/10
	--玩家血量 <= 集结呐喊 设定值
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("SF5","集结呐喊",zhandoumoshi) --显示指定色块窗体
		return
	end
	--集结呐喊-------------------------------------------------------------------------------------------
	
	if UnitCastingInfo("player")==nil
	--玩家没有在施法
	and
	UnitChannelInfo("player")==nil
	--玩家没有在引导施法
	and
	UnitExists("target")
	--单位存在
	and
	not(UnitIsDead("target"))
	--单位存活
	and
	UnitCanAttack("player","target")
	--单位可攻击
	and
	WR_TargetInCombat("target")
	--目标在战斗
	then
		--近战技能循环--------------------------------------------------------------------------------------------------------
		if IsSpellInRange("猛击","target")==1 then
		--目标在近战技能范围
		
			--胜利在望
			if WRSet.WQZ_SLZW~=8
			--胜利在望 开启
			and
			IsPlayerSpell(202168)
			--已学习 胜利在望
			and
			WR_GetGCD("胜利在望")<=GCD
			--技能冷却
			and
			PlayerHP<=WRSet.WQZ_SLZW/10
			--玩家血量<=胜利在望设定值
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF6","胜利在望",zhandoumoshi) --显示指定色块窗体
				return
			end
		
			--AOE循环
			if HUCountRangeJZ>=3 then
			--近战目标>=3
				--斩杀 续
				if WR_WarriorArms_ZS()
				--施法条件通过
				and
				BuffTime_ZZ>GCD
				--主宰 BUFF存在
				and
				BuffTime_ZZ<GCD_Max+GCD
				--主宰 BUFF<下一个GCD
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF5","斩杀 续",zhandoumoshi) --显示指定色块窗体
					return
				end
			
				--雷霆一击
				if WR_SpellUsable("雷霆一击")
				--技能可用
				and
				DebuffTime_SL<=21*0.3+GCD
				--目标撕裂DEBUFF时间<=21*0.3+GCD
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSZ","雷霆一击",zhandoumoshi) --显示指定色块窗体
					return
				end

				--横扫攻击
				if WR_SpellIsCD(260708)
				--技能可用
				and
				(
					(
						not IsPlayerSpell(383155)
						--没学 [强化横扫攻击]
						and
						WR_GetGCD("剑刃风暴")>15
						--剑刃风暴CD>15秒
					)
					or
					(
						IsPlayerSpell(383155)
						--已学 [强化横扫攻击]
						and
						WR_GetGCD("剑刃风暴")>21
						--剑刃风暴CD>21秒
					)
					or
					not IsPlayerSpell(227847)
					--没学 [剑刃风暴]
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF4","横扫攻击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--天神下凡
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(107574)
				--技能可用
				then
					--爆发药水
					if WRSet.WQZ_BFYS==1 then
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
								WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
								WR_ShowColorFrame("ACSF2","爆发药水",zhandoumoshi) --显示指定色块窗体
								return
							end
						end
					end
					--饰品1--------------------------------------------------------------------------------------------	
					if (WRSet.WQZ_SP==1 or WRSet.WQZ_SP==3)
					--使用1号饰品 或 使用1-2号饰品
					and WR_GetEquipCD(13) then
					--1号饰品可以使用
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("ASF3","饰品1",zhandoumoshi) --显示指定色块窗体
						return
					end
					--饰品1--------------------------------------------------------------------------------------------	
					--饰品2--------------------------------------------------------------------------------------------	
						if (WRSet.WQZ_SP==2 or WRSet.WQZ_SP==3)
						--使用2号饰品 或 使用1-2号饰品
						and WR_GetEquipCD(14) then
						--2号饰品可以使用
							WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
							WR_ShowColorFrame("CST","饰品2",zhandoumoshi) --显示指定色块窗体
							return
						end
					--饰品2--------------------------------------------------------------------------------------------	
					
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF11","天神下凡",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--灭战者
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(262161)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF6","灭战者",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--巨人打击
				if zhandoumoshi==1
				--开爆发
				and
				not IsPlayerSpell(262161)
				--没学 [灭战者]
				and
				WR_SpellIsCD(167105)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF6","巨人打击",zhandoumoshi) --显示指定色块窗体
					return
				end
					
				--顺劈斩
				if WR_SpellUsable("顺劈斩")
				--技能可用
				and
				BuffCount_YZ==2
				--压制层数==2
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF7","顺劈斩",zhandoumoshi) --显示指定色块窗体
					return
				end
	
				--致死打击
				if WR_SpellUsable("致死打击")
				--技能可用 资源可用
				and
				BuffTime_HSGJ>GCD
				--横扫攻击 BUFF存在
				and
				BuffCount_YZ==2
				--压制 BUFF层数==2
				and
				HUCountRangeJZ<=8
				--近战敌人数量<=8
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACSF3","致死打击",zhandoumoshi) --显示指定色块窗体
					return
				end
	
				--雷鸣之吼
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(384318)
				--技能可用
				and
				(
					BuffTime_LLDKY>GCD
					--力量的考验 BUFF存在
					or
					DebuffTime_JRDJ>GCD
					--巨人打击 DEBUFF存在
					or
					DebuffTime_ZS>GCD
					--重伤 DEBUFF存在
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSF","雷鸣之吼",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--剑刃风暴
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellUsable("剑刃风暴")
				--技能可用 资源可用
				and
				(
					BuffTime_JF<3+GCD+0.2
					--飓风BUFF时间<3秒
					or
					not IsPlayerSpell(390563)
					--没学天赋 飓风
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF9","剑刃风暴",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--旋风斩
				if WR_SpellUsable("旋风斩")
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF3","旋风斩",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--顺劈 次
				if WR_SpellUsable("顺劈斩")
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF7","顺劈 次",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--压制
				if WR_SpellIsCD(7384)
				--技能可用
				and
				BuffTime_HSGJ>GCD
				--横扫攻击 BUFF存在
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF8","压制",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--致死打击
				if WR_SpellUsable("致死打击")
				--技能可用 资源可用
				and
				(
					DebuffCount_KZSDJZ==2
					--刽子手的精准 DEBUFF层数==2
					or
					DebuffTime_ZS<=GCD+GCD_Max
					--重伤 DEBUFF<=下一个GCD
					or
					HUCountRangeJZ<3
					--近战敌人数量<3
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACSF3","致死打击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--斩杀
				if WR_WarriorArms_ZS()
				--施法条件通过
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF5","斩杀",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--压制 次
				if WR_SpellIsCD(7384)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF8","压制 次",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--雷霆 次
				if WR_SpellUsable("雷霆一击")
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSZ","雷霆 次",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--致死打击
				if WR_SpellUsable("致死打击")
				--技能可用 资源可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACSF3","致死打击",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
			--AOE循环
			
			--单体循环
			if HUCountRangeJZ<=2 then
			--近战目标>=2
				--横扫攻击
				if WR_SpellIsCD(260708)
				--技能可用
				and
				HUCountRangeJZ>1
				--近战目标>1
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF4","横扫攻击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--斩杀循环
				if UnitHealth("target")/UnitHealthMax("target")<0.2
				--目标血量<20%
				or
				(
					IsPlayerSpell(281001)
					--已学天赋 屠杀
					and
					UnitHealth("target")/UnitHealthMax("target")<0.35
					--目标血量<35%
				)
				then
				--血量触发斩杀线
					--致死打击 撕裂
					if WR_SpellUsable("致死打击")
					--技能可用 资源可用
					and
					DebuffTime_SL<=GCD_Max+GCD
					--目标撕裂 DEBUFF剩余时间<=下一个GCD
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("ACSF3","致死 撕裂",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--天神下凡
					if zhandoumoshi==1
					--开爆发
					and
					WR_SpellIsCD(107574)
					--技能可用
					and
					(
						WR_GetGCD("巨人打击")<=GCD
						--巨人打击 CD冷却
						or
						DebuffTime_JRDJ>GCD
						--巨人打击 DEBUFF存在
					)
					then
					
						--爆发药水
						if WRSet.WQZ_BFYS==1 then
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
									WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
									WR_ShowColorFrame("ACSF2","爆发药水",zhandoumoshi) --显示指定色块窗体
									return
								end
							end
						end
						
						--饰品1--------------------------------------------------------------------------------------------	
						if (WRSet.WQZ_SP==1 or WRSet.WQZ_SP==3)
						--使用1号饰品 或 使用1-2号饰品
						and WR_GetEquipCD(13) then
						--1号饰品可以使用
							WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
							WR_ShowColorFrame("ASF3","饰品1",zhandoumoshi) --显示指定色块窗体
							return
						end
						--饰品1--------------------------------------------------------------------------------------------	
						
						--饰品2--------------------------------------------------------------------------------------------	
							if (WRSet.WQZ_SP==2 or WRSet.WQZ_SP==3)
							--使用2号饰品 或 使用1-2号饰品
							and WR_GetEquipCD(14) then
							--2号饰品可以使用
								WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
								WR_ShowColorFrame("CST","饰品2",zhandoumoshi) --显示指定色块窗体
								return
							end
						--饰品2--------------------------------------------------------------------------------------------	
						
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF11","天神下凡",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--灭战者
					if zhandoumoshi==1
					--开爆发
					and
					WR_SpellIsCD(262161)
					--技能可用
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF6","灭战者",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--巨人打击
					if zhandoumoshi==1
					--开爆发
					and
					not IsPlayerSpell(262161)
					--没学 [灭战者]
					and
					WR_SpellIsCD(167105)
					--技能可用
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF6","巨人打击",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--斩杀
					if WR_WarriorArms_ZS()
					--施法条件通过
					and
					BuffTime_CS>GCD
					--猝死 BUFF存在
					and
					DebuffTime_ZS>GCD
					--重伤 DEBUFF存在
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF5","斩杀",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--雷鸣之吼
					if zhandoumoshi==1
					--开爆发
					and
					WR_SpellIsCD(384318)
					--技能可用
					and
					(
						(
							IsPlayerSpell(385008)
							--已学天赋 力量的考验
							and
							Rage<40
							--怒气<40
						)
						or
						(
							not IsPlayerSpell(385008)
							--没学技能 力量的考验
							and
							Rage<70
							--怒气<70
							and
							(
								BuffTime_TSXF>GCD
								--天神下凡 BUFF存在
								or
								DebuffTime_JRDJ>GCD
								--巨人打击 DEBUFF存在
							)
						)
					)
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CSF","雷鸣之吼",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--剑刃风暴
					if zhandoumoshi==1
					--开爆发
					and
					WR_SpellUsable("剑刃风暴")
					--技能可用 资源可用
					and
					(
						IsPlayerSpell(390563)
						--已学天赋 飓风
						and
						Rage<40
						--怒气<40
					)
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF9","剑刃风暴",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--致死打击
					if WR_SpellUsable("致死打击")
					--技能可用 资源可用
					and
					DebuffCount_KZSDJZ==2
					--刽子手的精准 DEBUFF层数==2
					and
					DebuffTime_JRDJ>GCD
					--巨人打击 DEBUFF存在
					and
					DebuffTime_JRDJ<GCD_Max+GCD
					--巨人打击 DEBUFF时间<下一个GCD
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("ACSF3","致死打击",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--压制
					if WR_SpellIsCD(7384)
					--技能可用
					and
					Rage<40
					--怒气<40
					and
					BuffCount_YZ<2
					--压制 BUFF层数<2
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF8","压制",zhandoumoshi) --显示指定色块窗体
						return
					end
					
					--致死打击 次
					if WR_SpellUsable("致死打击")
					--技能可用 资源可用
					and
					(
						BuffCount_YZ+DebuffCount_KZSDJZ>=3
						--压制层数+刽子手的精准>=3
						or
							(
								not IsPlayerSpell(386634)
								--没学天赋 刽子手的精准
								and
								BuffCount_YZ==2
								--压制 BUFF层数==2
							)
					)
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("ACSF3","致死 次",zhandoumoshi) --显示指定色块窗体
						return
					end

					--刽子斩
					if WR_WarriorArms_ZS()
					--施法条件通过
					and
					(
						DebuffCount_KZSDJZ<2
						--刽子手的精准 DEBUFF层数<2
						or
						not IsPlayerSpell(386634)
						--没学天赋 刽子手的精准
					)
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF5","刽子斩",zhandoumoshi) --显示指定色块窗体
						return
					end

					--压制BUFF
					if WR_SpellIsCD(7384)
					--技能可用
					and
					BuffCount_YZ<2
					--压制 BUFF层数<2
					and
					Rage<85
					--怒气<85
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF8","压制BUFF",zhandoumoshi) --显示指定色块窗体
						return
					end

					--斩杀 次
					if WR_WarriorArms_ZS()
					--施法条件通过
					and
					Rage>=40
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF5","斩杀 次",zhandoumoshi) --显示指定色块窗体
						return
					end
				
					--压制 次
					if WR_SpellIsCD(7384)
					--技能可用
					then
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("CF8","压制 次",zhandoumoshi) --显示指定色块窗体
						return
					end
				--斩杀循环
				end
				
				--斩杀 续
				if WR_WarriorArms_ZS()
				--施法条件通过
				and
				BuffTime_ZZ>GCD
				--主宰 BUFF存在
				and
				BuffTime_ZZ<GCD_Max+GCD
				--主宰 BUFF<下一个GCD
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF5","斩杀 续",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--雷霆一击
				if WR_SpellUsable("雷霆一击")
				--技能可用
				and
				DebuffTime_SL<GCD_Max+GCD
				--撕裂 DEBUFF<下一个GCD
				and
				IsPlayerSpell(384277)
				--已学天赋 鲜血与雷鸣
				and
				IsPlayerSpell(390138)
				--已学天赋 剑圣的折磨
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSZ","雷霆一击",zhandoumoshi) --显示指定色块窗体
					return
				end
					
				--雷鸣之吼
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(384318)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSF","雷鸣之吼",zhandoumoshi) --显示指定色块窗体
					return
				end
					
				--天神下凡
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(107574)
				--技能可用
				then
				
					--爆发药水
					if WRSet.WQZ_BFYS==1 then
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
								WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
								WR_ShowColorFrame("ACSF2","爆发药水",zhandoumoshi) --显示指定色块窗体
								return
							end
						end
					end
					
					--饰品1--------------------------------------------------------------------------------------------	
					if (WRSet.WQZ_SP==1 or WRSet.WQZ_SP==3)
					--使用1号饰品 或 使用1-2号饰品
					and WR_GetEquipCD(13) then
					--1号饰品可以使用
						WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
						WR_ShowColorFrame("ASF3","饰品1",zhandoumoshi) --显示指定色块窗体
						return
					end
					--饰品1--------------------------------------------------------------------------------------------	
					
					--饰品2--------------------------------------------------------------------------------------------	
						if (WRSet.WQZ_SP==2 or WRSet.WQZ_SP==3)
						--使用2号饰品 或 使用1-2号饰品
						and WR_GetEquipCD(14) then
						--2号饰品可以使用
							WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
							WR_ShowColorFrame("CST","饰品2",zhandoumoshi) --显示指定色块窗体
							return
						end
					--饰品2--------------------------------------------------------------------------------------------	
				
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF11","天神下凡",zhandoumoshi) --显示指定色块窗体
					return
				end
					
				--巨人打击
				if zhandoumoshi==1
				--开爆发
				and
				not IsPlayerSpell(262161)
				--没学 [灭战者]
				and
				WR_SpellIsCD(167105)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF6","巨人打击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--灭战者
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellIsCD(262161)
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF6","灭战者",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--致死打击
				if WR_SpellUsable("致死打击")
				--技能可用 资源可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("ACSF3","致死打击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--雷霆一击
				if WR_SpellUsable("雷霆一击")
				--技能可用
				and
				DebuffTime_SL<GCD_Max+GCD
				--撕裂 DEBUFF<下一个GCD
				and
				IsPlayerSpell(384277)
				--已学天赋 鲜血与雷鸣
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSZ","雷霆一击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--旋风斩
				if WR_SpellUsable("旋风斩")
				--技能可用
				and
				IsPlayerSpell(385512)
				--已学天赋 刀剑风暴
				and
				DebuffTime_JRDJ>GCD
				--巨人打击 DEBUFF存在
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF3","旋风斩",zhandoumoshi) --显示指定色块窗体
					return
				end
					
				--剑刃风暴
				if zhandoumoshi==1
				--开爆发
				and
				WR_SpellUsable("剑刃风暴")
				--技能可用 资源可用
				and
				IsPlayerSpell(390563)
				--已学天赋 飓风
				and
				BuffTime_JF<2
				--飓风 BUFF时间<2秒
				and
				(
					BuffTime_LLDKY>GCD
					--力量的考验 BUFF存在
					or
					(
						not IsPlayerSpell(385008)
						--没学天赋 力量的考验
						and
						DebuffTime_JRDJ>GCD
						--巨人打击 DEBUFF存在
					)
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF9","剑刃风暴",zhandoumoshi) --显示指定色块窗体
					return
				end

				--斩杀
				if WR_WarriorArms_ZS()
				--施法条件通过
				and
				BuffTime_CS>GCD
				--猝死 BUFF存在
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF5","斩杀",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--旋风斩
				if WR_SpellUsable("旋风斩")
				--技能可用
				and
				IsPlayerSpell(385512)
				--已学天赋 刀剑风暴
				and
				IsPlayerSpell(385008)
				--已学天赋 力量的考验
				and
				WR_GetGCD("巨人打击")>GCD+GCD_Max*7
				--巨人打击冷却时间>7个GCD
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF3","旋风斩",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--压制
				if WR_SpellIsCD(7384)
				--技能可用
				and
				(
					IsPlayerSpell(385512)
					--已学天赋 战争领主
					or
					(
						not IsPlayerSpell(385512)
						--没学技能 战争领主
						and
						GetSpellCharges("压制")==2
					)
				)
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF8","压制",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--旋风斩
				if WR_SpellUsable("旋风斩")
				--技能可用
				and
				IsPlayerSpell(385512)
				--已学天赋 刀剑风暴
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF3","旋风斩",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--雷霆一击
				if WR_SpellUsable("雷霆一击")
				--技能可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSZ","雷霆一击",zhandoumoshi) --显示指定色块窗体
					return
				end
				
				--猛击
				if WR_SpellUsable("猛击")
				--技能可用 资源可用
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CSY","猛击",zhandoumoshi) --显示指定色块窗体
					return
				end
			end
			--单体循环
		end
		--近战技能循环--------------------------------------------------------------------------------------------------------
		
		--英勇投掷
		if WR_SpellUsable("英勇投掷")
		--技能可用 资源可用
		and
		IsSpellInRange("英勇投掷","target")==1 then
		--目标在技能范围
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ASF2","英勇投掷",zhandoumoshi) --显示指定色块窗体
			return
		end
		--英勇投掷
	end


	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--斩杀 施法条件
function WR_WarriorArms_ZS()
	if WR_SpellUsable("斩杀")
	--技能可用
	and
	(
		BuffTime_CS~=0
		--猝死 BUFF存在
		or
		UnitHealth("target")/UnitHealthMax("target")<0.2
		--目标血量低于20%
		or
		(
			IsPlayerSpell(281001)
			--已学技能 屠杀
			and
			UnitHealth("target")/UnitHealthMax("target")<0.35
			--目标血量低于35%
		)
		or
		IsSpellOverlayed(163201)
		or
		IsSpellOverlayed(281000)
	)
	then
		return true
	end
	return false
end
