--狂暴战运行库
function WR_WarriorFury()
	if GetSpecialization()~=2 then	--如果不是狂怒(2)专精，则不执行该运行库
		return
	end
	

	ShiFaSuDu=0.05+WRSet.KBZ_SFSD*0.05
	
	PlayerHP = UnitHealth("player")/UnitHealthMax("player")
	
	Rage=UnitPower("player",1)	--获得当前怒气值
	
	GCD=WR_GetGCD("断筋")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--最大GCD
	NextGCD=GCD+MaxGCD	--下一个技能结束的GCD
	
	TargetCloseRange = C_Spell.IsSpellInRange(1464,"target") or C_Spell.IsSpellInRange(23881,"target")	--获得目标是否在近战范围内(猛击 或 嗜血)
	
	HUCountRange5=WR_GetSpellRangeHarmUnitCount(1464)	--获得近战范围内的敌人数量(猛击)
	
	RaidOrParty=WR_GetInRaidOrParty()	--判断实在团队还是小队

	--_,WQTXBuffCount,_=WR_GetUnitBuffInfo("player","无情突袭")	--获得 无情突袭 BUFF的堆叠层数
	--_,XXFKBuffCount,_=WR_GetUnitBuffInfo("player","血腥疯狂")	--获得 血腥疯狂 BUFF的堆叠层数
	--_,KNSXBuffCount,_=WR_GetUnitBuffInfo("player","狂怒嗜血")	--获得 狂怒嗜血 BUFF的堆叠层数
	--_,SYFZBuffCount,_=WR_GetUnitBuffInfo("player","肆意放纵")	--获得 肆意放纵 BUFF的堆叠层数
	
	JNBuffTime = WR_GetUnitBuffTime("player","激怒")	--获得 激怒 BUFF时间
	TSXFBuffTime = WR_GetUnitBuffTime("player","天神下凡")	--获得 天神下凡 BUFF时间
	LMBuffTime = WR_GetUnitBuffTime("player","鲁莽")	--获得 鲁莽 BUFF时间
	XFZBuffCount =WR_GetUnitBuffCount("player",85739)	--获得 旋风斩 BUFF的堆叠层数
	PlayerMove=WR_PlayerMove()	--玩家在移动
	
	--SXCrit=GetCritChance()/100+0.15*WQTXBuffCount+0.15*XXFKBuffCount	--嗜血暴击率
--[[	
	if LMBuffCount>=1 then
		SXCrit=SXCrit+0.2	--嗜血暴击率
	end
--]]

	--AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	
	--TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS

	
	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.KBZ_ZNJD) then return end	--智能焦点
	
	if WR_Warrior_KBZN() then return end	--狂暴之怒
	
	if WRSet.KBZ_SP1>=3 then
		if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.KBZ_SP2>=3 then
		if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Warrior_ZLS() then return end	--治疗石
	
	if WR_Warrior_ZLYS() then return end	--治疗药水
	
	if WR_Warrior_JJNH() then return end	--集结呐喊
	
	if WR_WarriorFury_KNHF() then return end	--狂怒回复
	
	if WR_Warrior_FSFS() then return end	--法术反射
	
	if WR_WarriorFury_ZT() then return end	--姿态
	
	if WR_Warrior_Function_QJ() then return end	--拳击
	
	if WR_Warrior_Function_FBZC() then return end	--风暴之锤
	
	if WR_Warrior_ZDB() then return end	--震荡波
	
	if WR_Warrior_PDNH() then return end	--破胆怒吼
	
	if WR_Warrior_ZDNH() then return end	--战斗怒吼
	
	if WR_WarriorFury_Combat_TLZ() then return end	--战斗 屠戮者
	
	if WR_WarriorFury_Combat_SQLZ() then return end	--战斗 山丘领主
	
	if WR_Function_ZNMB(2,WRSet.KBZ_ZNMB) then return true end	--智能目标

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	if MSG==1 then
	end
end

--战斗 山丘领主
function WR_WarriorFury_Combat_SQLZ()
	if not IsPlayerSpell(434969) then return false end	--没学 [闪电打击]
	if not WR_TargetInCombat("target") then return false end	--目标不在战斗中
	if WR_GetUnitBuffTime("player","剑刃风暴")>0 then return false end	--剑刃风暴 BUFF存在
	
	
	if TargetCloseRange then	--目标在近战
		if WRSet.KBZ_SP1==1 then
			if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.KBZ_SP2==1 then
			if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 常驻
		end
	end
	
	if WR_WarriorFury_SLZW() then return true end	--施法过程 胜利在望
	
	if HUCountRange5>1 then	--敌人数量>1
		--鲁莽A1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("鲁莽") --技能可用 资源可用
		and
		(
			(
				not IsPlayerSpell(152278)	--没学 愤怒掌握
				and
				WR_GetGCD("天神下凡")<1	--天神下凡 冷却时间<1
				and
				IsPlayerSpell(390135)	--已学 泰坦的折磨
			)
			or
			IsPlayerSpell(152278)	--已学 愤怒掌握
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("SF1","鲁莽A1") then return true end
		end
		
		--雷霆A1
		if GCD<=ShiFaSuDu
		and WR_SpellUsable("雷霆一击") --技能可用
		and TargetCloseRange	--目标在近战范围内
		and JNBuffTime>GCD	--激怒 BUFF存在
		and WR_GetUnitBuffCount("player","雷霆轰击")>=1	--雷霆轰击 BUFF层数>=1
		then
			if WR_ColorFrame_Show("CSF9","雷霆A1") then return true end
		end
		
		--天神A1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("天神下凡") --技能可用 资源可用
		and
		(
			(
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				(
					JNBuffTime>GCD	--激怒 BUFF存在
					or
					IsPlayerSpell(394329)	--已学 泰坦之怒
				)
				and
				(
					(
						IsPlayerSpell(386284)	--已学 勇士伟力
						and
						WR_GetUnitDebuffTime("target","勇士之矛",true)>GCD	--勇士之矛 DEBUFF存在
					)
					or
					not IsPlayerSpell(386284)	--没学 勇士伟力
				)
			)
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("CSK","天神A1") then return true end
		end
		
		--雷霆A2
		if GCD<=ShiFaSuDu
		and WR_SpellUsable("雷霆一击") --技能可用
		and TargetCloseRange	--目标在近战范围内
		and XFZBuffCount==0	--旋风斩BUFF层数
		and IsPlayerSpell(280392)	--已学 血肉顺劈
		then
			if WR_ColorFrame_Show("CSF9","雷霆A2") then return true end
		end
		
		--雷鸣A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("雷鸣之吼") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF12","雷鸣A1") then return true end
		end
		
		--破坏A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("破坏者") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF1","破坏A1") then return true end
		end
		
		--勇矛A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("勇士之矛") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and not PlayerMove	--没有移动
		then
			if WR_ColorFrame_Show("CSP","勇矛A1") then return true end
		end

		--奥丁A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("奥丁之怒") --技能可用 资源可用
		and WR_GetUnitDebuffTime("target","奥丁之怒",true)<1	--奥丁之怒 DEBUFF时间<1秒
		and
		(
			JNBuffTime>GCD --激怒 BUFF存在
			or
			IsPlayerSpell(394329)	--已学 泰坦之怒
		)
		and
		WR_GetGCD("天神下凡")>GCD	--天神下凡 冷却中
		then
			if WR_ColorFrame_Show("CF8","奥丁A1") then return true end
		end
		
		--斩杀A0
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and IsPlayerSpell(392536)	--已学 灰烬主宰
		and WR_GetUnitBuffTime("player","灰烬主宰")>GCD	--灰烬主宰 BUFF存在
		and WR_GetUnitBuffTime("player","灰烬主宰")<=NextGCD	--灰烬主宰 BUFF时间<=下一个GCD
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF6","斩杀A0") then return true end
		end
		
		--暴怒A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and WR_GetGCD("剑刃风暴")<=NextGCD	--剑刃风暴 冷却时间<=下一个GCD
		and
		(
			not IsPlayerSpell(386284)	--没学 勇士伟力
			or
			WR_GetUnitDebuffTime("target","勇士之矛",true)<=GCD	--勇士之矛 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF9","暴怒A1") then return true end
		end
		
		--风暴A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("剑刃风暴") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF11","风暴A1") then return true end
		end
		
		--暴怒A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(152278)	--已学 愤怒掌握
		then
			if WR_ColorFrame_Show("CF9","暴怒A2") then return true end
		end
		
		--碎甲A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","碎甲猛击")>GCD	--碎甲猛击 BUFF存在
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF5","碎甲A1") then return true end
		end
		
		--浴血A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","浴血奋战")>GCD	--浴血奋战 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","浴血A1") then return true end
		end
		
		--暴怒A3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(396749)	--已学 肆意放纵
		then
			if WR_ColorFrame_Show("CF9","暴怒A3") then return true end
		end
		
		--嗜血A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF7","嗜血A1") then return true end
		end
		
		--雷霆A3
		if GCD<=ShiFaSuDu
		and WR_SpellUsable("雷霆一击") --技能可用
		and TargetCloseRange	--目标在近战范围内
		then
			if WR_ColorFrame_Show("CSF9","雷霆A3") then return true end
		end
		
		--斩杀A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		then
			if WR_ColorFrame_Show("CF6","斩杀A1") then return true end
		end
		
		--怒击A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF5","怒击A1") then return true end
		end
		
		--旋风A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("旋风斩") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF10","旋风A2") then return true end
		end
		
	else
		
		--鲁莽S1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("鲁莽") --技能可用 资源可用
		and
		(
			(
				not IsPlayerSpell(152278)	--没学 愤怒掌握
				and
				WR_GetGCD("天神下凡")<1	--天神下凡 冷却时间<1
				and
				IsPlayerSpell(390135)	--已学 泰坦的折磨
			)
			or
			IsPlayerSpell(152278)	--已学 愤怒掌握
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("SF1","鲁莽S1") then return true end
		end
		
		--雷霆S1
		if GCD<=ShiFaSuDu
		and WR_SpellUsable("雷霆一击") --技能可用
		and TargetCloseRange	--目标在近战范围内
		and JNBuffTime>GCD	--激怒 BUFF存在
		and WR_GetUnitBuffCount("player","雷霆轰击")>=1	--雷霆轰击 BUFF层数>=1
		then
			if WR_ColorFrame_Show("CSF9","雷霆S1") then return true end
		end
		
		--天神S1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("天神下凡") --技能可用 资源可用
		and
		(
			(
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				(
					JNBuffTime>GCD	--激怒 BUFF存在
					or
					IsPlayerSpell(394329)	--已学 泰坦之怒
				)
				and
				(
					(
						IsPlayerSpell(386284)	--已学 勇士伟力
						and
						WR_GetUnitDebuffTime("target","勇士之矛",true)>GCD	--勇士之矛 DEBUFF存在
					)
					or
					not IsPlayerSpell(386284)	--没学 勇士伟力
				)
			)
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("CSK","天神S1") then return true end
		end
		
		--破坏S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("破坏者") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF1","破坏S1") then return true end
		end
		
		--雷鸣S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("雷鸣之吼") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF12","雷鸣S1") then return true end
		end
		
		--勇矛S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("勇士之矛") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and not PlayerMove	--没有移动
		and
		(
			WR_GetGCD("天神下凡")<NextGCD	--天神下凡 冷却时间<下一个GCD
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WR_ColorFrame_Show("CSP","勇矛S1") then return true end
		end
		
		--奥丁S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("奥丁之怒") --技能可用 资源可用
		and WR_GetUnitDebuffTime("target","奥丁之怒",true)<1	--奥丁之怒 DEBUFF时间<1秒
		and
		(
			JNBuffTime>GCD --激怒 BUFF存在
			or
			IsPlayerSpell(394329)	--已学 泰坦之怒
		)
		and WR_GetGCD("天神下凡")>GCD	--天神下凡 冷却中
		then
			if WR_ColorFrame_Show("CF8","奥丁S1") then return true end
		end

		--斩杀S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and IsPlayerSpell(392536)	--已学 灰烬主宰
		and WR_GetUnitBuffTime("player","灰烬主宰")>GCD	--灰烬主宰 BUFF存在
		and WR_GetUnitBuffTime("player","灰烬主宰")<=NextGCD	--灰烬主宰 BUFF时间<=下一个GCD
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF6","斩杀S1") then return true end
		end
		
		--暴怒S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and WR_GetGCD("剑刃风暴")<=NextGCD	--剑刃风暴 冷却时间<=下一个GCD
		and
		(
			not IsPlayerSpell(386284)	--没学 勇士伟力
			or
			WR_GetUnitDebuffTime("target","勇士之矛",true)<=GCD	--勇士之矛 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF9","暴怒S1") then return true end
		end

		--风暴S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("剑刃风暴") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and IsPlayerSpell(386628)	--已学 [迷狂乱舞] 剑刃风暴期间 自动嗜血
		then
			if WR_ColorFrame_Show("CF11","风暴S1") then return true end
		end

		--暴怒S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(152278)	--已学 愤怒掌握
		then
			if WR_ColorFrame_Show("CF9","暴怒S2") then return true end
		end
		
		--碎甲S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","碎甲猛击")>GCD	--碎甲猛击 BUFF存在
		then
			if WR_ColorFrame_Show("CF5","碎甲S1") then return true end
		end
		
		--浴血S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","浴血奋战")>GCD	--浴血奋战 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","浴血S1") then return true end
		end
		
		--暴怒S3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(396749)	--已学 肆意放纵
		then
			if WR_ColorFrame_Show("CF9","暴怒S3") then return true end
		end
		
		--怒击S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF5","怒击S2") then return true end
		end
		
		--斩杀S3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		then
			if WR_ColorFrame_Show("CF6","斩杀S3") then return true end
		end

		--嗜血S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and
		(
			WR_GetUnitBuffTime("player","能量爆发")==0	--能量爆发 BUFF不存在
			or
			not IsPlayerSpell(396749)	--没学 肆意放纵
		)
		then
			if WR_ColorFrame_Show("CF7","嗜血S1") then return true end
		end
		
		--嗜血S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF7","嗜血S2") then return true end
		end
		
		--雷霆S2
		if GCD<=ShiFaSuDu
		and WR_SpellUsable("雷霆一击") --技能可用
		and TargetCloseRange	--目标在近战范围内
		then
			if WR_ColorFrame_Show("CSF9","雷霆S2") then return true end
		end
		
		--旋风S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("旋风斩") --技能可用 资源可用
		and IsPlayerSpell(280392)	--已学 血肉顺劈
		then
			if WR_ColorFrame_Show("CF10","旋风S1") then return true end
		end
		
		--猛击S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("猛击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF4","猛击S1") then return true end
		end
		
	end
	
	
end

--战斗 屠戮者
function WR_WarriorFury_Combat_TLZ()
	if IsPlayerSpell(434969) then return false end	--已学 [闪电打击]
	if not WR_TargetInCombat("target") then return false end	--目标不在战斗中
	if WR_GetUnitBuffTime("player","剑刃风暴")>0 then return false end	--剑刃风暴 BUFF存在
	
	
	if TargetCloseRange then	--目标在近战
		if WRSet.KBZ_SP1==1 then
			if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.KBZ_SP2==1 then
			if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 常驻
		end
	end
	
	if WR_WarriorFury_SLZW() then return true end	--施法过程 胜利在望
	
	if HUCountRange5>1 then	--敌人数量>1
		--鲁莽A1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("鲁莽") --技能可用 资源可用
		and
		(
			(
				not IsPlayerSpell(152278)	--没学 愤怒掌握
				and
				WR_GetGCD("天神下凡")<1	--天神下凡 冷却时间<1
				and
				IsPlayerSpell(390135)	--已学 泰坦的折磨
			)
			or
			IsPlayerSpell(152278)	--已学 愤怒掌握
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("SF1","鲁莽A1") then return true end
		end

		--天神A1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("天神下凡") --技能可用 资源可用
		and
		(
			(
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				(
					JNBuffTime>GCD	--激怒 BUFF存在
					or
					IsPlayerSpell(394329)	--已学 泰坦之怒
				)
				and
				(
					(
						IsPlayerSpell(386284)	--已学 勇士伟力
						and
						WR_GetUnitDebuffTime("target","勇士之矛",true)>GCD	--勇士之矛 DEBUFF存在
					)
					or
					not IsPlayerSpell(386284)	--没学 勇士伟力
				)
			)
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("CSK","天神A1") then return true end
		end

		--雷鸣A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("雷鸣之吼") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF12","雷鸣A1") then return true end
		end

		--勇矛A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("勇士之矛") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and
		(
			(
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				WR_GetGCD("天神下凡")<NextGCD	--天神下凡 冷却时间<下一个GCD
			)
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WR_ColorFrame_Show("CSP","勇矛A1") then return true end
		end

		--奥丁A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("奥丁之怒") --技能可用 资源可用
		and WR_GetUnitDebuffTime("target","奥丁之怒",true)<1	--奥丁之怒 DEBUFF时间<1秒
		and
		(
			JNBuffTime>GCD --激怒 BUFF存在
			or
			IsPlayerSpell(394329)	--已学 泰坦之怒
		)
		and
		WR_GetGCD("天神下凡")>GCD	--天神下凡 冷却中
		then
			if WR_ColorFrame_Show("CF8","奥丁A1") then return true end
		end

		--旋风A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("旋风斩") --技能可用 资源可用
		and XFZBuffCount==0	--旋风斩 BUFF层数=0
		and IsPlayerSpell(280392)	--已学 血肉顺劈
		then
			if WR_ColorFrame_Show("CF10","旋风A1") then return true end
		end
		
		--斩杀A0
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and IsPlayerSpell(392536)	--已学 灰烬主宰
		and WR_GetUnitBuffTime("player","灰烬主宰")>GCD	--灰烬主宰 BUFF存在
		and WR_GetUnitBuffTime("player","灰烬主宰")<=NextGCD	--灰烬主宰 BUFF时间<=下一个GCD
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF6","斩杀A0") then return true end
		end
		
		--暴怒A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and WR_GetGCD("剑刃风暴")<=NextGCD	--剑刃风暴 冷却时间<=下一个GCD
		and
		(
			not IsPlayerSpell(386284)	--没学 勇士伟力
			or
			WR_GetUnitDebuffTime("target","勇士之矛",true)<=GCD	--勇士之矛 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF9","暴怒A1") then return true end
		end
	
		--风暴A1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("剑刃风暴") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and WR_GetGCD("天神下凡")>=9	--天神下凡 冷却时间>=9
		then
			if WR_ColorFrame_Show("CF11","风暴A1") then return true end
		end
		
		--暴怒A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(152278)	--已学 愤怒掌握
		then
			if WR_ColorFrame_Show("CF9","暴怒A2") then return true end
		end
		
		--碎甲A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","碎甲猛击")>GCD	--碎甲猛击 BUFF存在
		then
			if WR_ColorFrame_Show("CF5","碎甲A1") then return true end
		end
		
		--浴血A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","浴血奋战")>GCD	--浴血奋战 BUFF存在
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","浴血A1") then return true end
		end
		
		--暴怒A3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(396749)	--已学 肆意放纵
		then
			if WR_ColorFrame_Show("CF9","暴怒A3") then return true end
		end

		--斩杀A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and WR_GetUnitDebuffTime("target","处刑之印",true)>0	--处刑之印 DEBUFF存在
		then
			if WR_ColorFrame_Show("CF6","斩杀A1") then return true end
		end

		--浴血A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","浴血奋战")>GCD	--浴血奋战 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","浴血A2") then return true end
		end

		--怒击A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and IsPlayerSpell(388004)	--已学 屠戮打击
		then
			if WR_ColorFrame_Show("CF5","怒击A1") then return true end
		end
		
		--斩杀A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		then
			if WR_ColorFrame_Show("CF6","斩杀A2") then return true end
		end

		--嗜血A1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF7","嗜血A1") then return true end
		end
	
		--旋风A2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("旋风斩") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF10","旋风A2") then return true end
		end
	else
		--鲁莽S1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("鲁莽") --技能可用 资源可用
		and
		(
			(
				not IsPlayerSpell(152278)	--没学 愤怒掌握
				and
				WR_GetGCD("天神下凡")<1	--天神下凡 冷却时间<1
				and
				IsPlayerSpell(390135)	--已学 泰坦的折磨
			)
			or
			IsPlayerSpell(152278)	--已学 愤怒掌握
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("SF1","鲁莽S1") then return true end
		end
		
		--天神S1
		if zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("天神下凡") --技能可用 资源可用
		and
		(
			(
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				(
					JNBuffTime>GCD	--激怒 BUFF存在
					or
					IsPlayerSpell(394329)	--已学 泰坦之怒
				)
				and
				(
					(
						IsPlayerSpell(386284)	--已学 勇士伟力
						and
						WR_GetUnitDebuffTime("target","勇士之矛",true)>GCD	--勇士之矛 DEBUFF存在
					)
					or
					not IsPlayerSpell(386284)	--没学 勇士伟力
				)
			)
			or
			not IsPlayerSpell(390135)	--没学 泰坦的折磨
		)
		then
			if WRSet.KBZ_SP1==2 then
				if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
			end
			if WRSet.KBZ_SP2==2 then
				if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
			end
			
			if WR_ColorFrame_Show("CSK","天神S1") then return true end
		end
		
		--雷鸣S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("雷鸣之吼") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF12","雷鸣S1") then return true end
		end
		
		--勇矛S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("勇士之矛") --技能可用 资源可用
		and
		(
			(
				JNBuffTime>GCD --激怒 BUFF存在
				and
				IsPlayerSpell(390135)	--已学 泰坦的折磨
				and
				WR_GetGCD("天神下凡")<NextGCD	--天神下凡 冷却时间<下一个GCD
			)
			or
			(
				JNBuffTime>GCD --激怒 BUFF存在
				and
				not IsPlayerSpell(390135)	--没学 泰坦的折磨
			)
		)
		then
			if WR_ColorFrame_Show("CSP","勇矛S1") then return true end
		end
		
		--奥丁S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("奥丁之怒") --技能可用 资源可用
		and WR_GetUnitDebuffTime("target","奥丁之怒",true)<1	--奥丁之怒 DEBUFF时间<1秒
		and
		(
			JNBuffTime>GCD --激怒 BUFF存在
			or
			IsPlayerSpell(394329)	--已学 泰坦之怒
		)
		and WR_GetGCD("天神下凡")>GCD	--天神下凡 冷却中
		then
			if WR_ColorFrame_Show("CF8","奥丁S1") then return true end
		end
		
		--斩杀S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and
		(
			WR_GetUnitDebuffCount("target","处刑之印",true)==3	--处刑之印 DEBUFF层数=3
			or
			(
				IsPlayerSpell(392536)	--已学 灰烬主宰
				and
				WR_GetUnitBuffTime("player","灰烬主宰")>GCD	--灰烬主宰 BUFF存在
				and
				WR_GetUnitBuffTime("player","灰烬主宰")<=NextGCD	--灰烬主宰 BUFF时间<=下一个GCD
				and
				JNBuffTime>GCD --激怒 BUFF存在
			)
		)
		then
			if WR_ColorFrame_Show("CF6","斩杀S1") then return true end
		end
		
		--暴怒S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and WR_GetGCD("剑刃风暴")<=NextGCD	--剑刃风暴 冷却时间<=下一个GCD
		and
		(
			not IsPlayerSpell(386284)	--没学 勇士伟力
			or
			WR_GetUnitDebuffTime("target","勇士之矛",true)<=GCD	--勇士之矛 DEBUFF不存在
		)
		then
			if WR_ColorFrame_Show("CF9","暴怒S1") then return true end
		end
		
		--风暴S1
		if GCD<=ShiFaSuDu
		and zhandoumoshi==1 --开爆发
		and IsPlayerSpell(227847)	--已学 剑刃风暴
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("剑刃风暴") --技能可用 资源可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and WR_GetGCD("天神下凡")>=9	--天神下凡 冷却时间>=9
		then
			if WR_ColorFrame_Show("CF11","风暴S1") then return true end
		end

		--暴怒S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(152278)	--已学 愤怒掌握
		then
			if WR_ColorFrame_Show("CF9","暴怒S2") then return true end
		end
		
		--碎甲S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","碎甲猛击")>GCD	--碎甲猛击 BUFF存在
		then
			if WR_ColorFrame_Show("CF5","碎甲S1") then return true end
		end

		--浴血S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and WR_GetUnitBuffTime("player","浴血奋战")>GCD	--浴血奋战 BUFF存在
		and
		(
			Rage<100 --怒气值<100
			or
			(
				UnitHealth("target")/UnitHealthMax("target")<0.35	--单位血量<35%
				and
				IsPlayerSpell(383885)	--已学 恶毒蔑视
			)
		)
		then
			if WR_ColorFrame_Show("CF7","浴血S1") then return true end
		end

		--怒击S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		and Rage<100 --怒气值<100
		and WR_GetUnitBuffTime("player","趁虚而入")>GCD	--趁虚而入 BUFF存在
		then
			if WR_ColorFrame_Show("CF5","怒击S1") then return true end
		end

		--暴怒S3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("暴怒")	--技能可用 资源可用
		and IsPlayerSpell(396749)	--已学 肆意放纵
		then
			if WR_ColorFrame_Show("CF9","暴怒S3") then return true end
		end

		--斩杀S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		and JNBuffTime>GCD --激怒 BUFF存在
		and WR_GetUnitDebuffTime("target","处刑之印",true)>0	--处刑之印 DEBUFF存在
		then
			if WR_ColorFrame_Show("CF6","斩杀S2") then return true end
		end

		--嗜血S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		and not IsPlayerSpell(396749)	--没学 肆意放纵
		and JNBuffTime>GCD --激怒 BUFF存在
		then
			if WR_ColorFrame_Show("CF7","嗜血S1") then return true end
		end

		--怒击S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("怒击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF5","怒击S2") then return true end
		end

		--斩杀S3
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_WarriorFury_ZhanSha_OK("target")	--单位可以斩杀
		and WR_SpellUsable("斩杀") --技能可用
		then
			if WR_ColorFrame_Show("CF6","斩杀S3") then return true end
		end

		--嗜血S2
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("嗜血") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF7","嗜血S2") then return true end
		end
	
		--旋风S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("旋风斩") --技能可用 资源可用
		and IsPlayerSpell(280392)	--已学 血肉顺劈
		then
			if WR_ColorFrame_Show("CF10","旋风S1") then return true end
		end
	
		--猛击S1
		if GCD<=ShiFaSuDu
		and TargetCloseRange	--目标在近战范围内
		and WR_SpellUsable("猛击") --技能可用 资源可用
		then
			if WR_ColorFrame_Show("CF4","猛击S1") then return true end
		end
	end
	
	return false
end

--狂怒回复
function WR_WarriorFury_KNHF()
	if WRSet.KBZ_KNHF~=8 --狂怒回复 开启
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_SpellUsable("狂怒回复")	--技能可用 资源可用
	and PlayerHP<WRSet.KBZ_KNHF/10 --血量比例
	then
		if WR_ColorFrame_Show("SF11","狂怒回复") then return true end
	end
	return false
end

--姿态
function WR_WarriorFury_ZT()
	if WRSet.KBZ_ZT==1 --姿态 狂暴
	and WR_SpellUsable("狂暴姿态")	--技能可用
	and WR_GetUnitBuffCount("player","狂暴姿态")==0 --狂暴姿态 BUFF不存在
	then
		if WR_ColorFrame_Show("SF9","狂暴姿态") then return true end
	elseif WRSet.KBZ_ZT==2 then --姿态 自动
		if not RaidOrParty=="raid"	--不在团队
		and
		(
			WR_ResistSustained(0.6) --持续型伤害
			or
			WR_ResistOutburstTime()<=1 --尖刺型伤害，施法时间剩余1秒
		)
		then
			if WR_SpellUsable("防御姿态")	--技能可用
			and WR_GetUnitBuffCount("player","防御姿态")==0 --防御姿态 BUFF不存在
			then
				if WR_ColorFrame_Show("SF10","防御姿态") then return true end
			end
		else
			if WR_SpellUsable("狂暴姿态")	--技能可用
			and WR_GetUnitBuffCount("player","狂暴姿态")==0 --狂暴姿态 BUFF不存在
			then
				if WR_ColorFrame_Show("SF9","狂暴姿态") then return true end
			end
		end
	end
	
	return false
end



--施法过程 胜利在望
function WR_WarriorFury_SLZW()
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WRSet.KBZ_SLZW~=8 --胜利在望 开启
	and WR_GetGCD("胜利在望")<=GCD --技能冷却
	and PlayerHP<=WRSet.KBZ_SLZW/10 --玩家血量<=胜利在望设定值
	then
		if WR_ColorFrame_Show("SF2","胜利在望") then return true end
	end
	return false
end

--施法过程 破坏者
function WR_WarriorFury_PHZ()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("破坏者") --技能可用 资源可用
	and ( WR_SpellUsable("鲁莽") or LMBuffTime>GCD )	--鲁莽可用 或者 鲁莽BUFF存在
	then
		if WR_ColorFrame_Show("CF1","破坏者") then return true end
	end
	return false
end

--施法过程 天神鲁莽
function WR_WarriorFury_LMTS()
	if zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and ( WR_SpellUsable("天神下凡") or WR_SpellUsable("鲁莽") ) --技能可用 资源可用
	then
		if WRSet.KBZ_SP1==2 then
			if WR_ShiPin(1,WRSet.KBZ_SP1) then return true end	--饰品 爆发
		end
		if WRSet.KBZ_SP2==2 then
			if WR_ShiPin(2,WRSet.KBZ_SP2) then return true end	--饰品 爆发
		end
		
		if WR_ColorFrame_Show("SF1","鲁莽天神") then return true end
	end
	return false
end

--施法过程 奥丁之怒
function WR_WarriorFury_ADZN(Text)
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and JNBuffTime>GCD --激怒 BUFF存在
	and WR_SpellUsable("奥丁之怒") --技能可用 资源可用
	then
		if Text=="AOE" then
			if IsPlayerSpell(394329) then --已学天赋[泰坦之怒]
				if WR_ColorFrame_Show("CF8","奥丁AOE") then return true end
			end
		else
			if HUCountRange5<=1 --近战单位数量
			or
			XFZBuffCount>0 --旋风斩层数>0
			or
			not IsPlayerSpell(394329) --没学天赋[泰坦之怒]
			or
			(
				HUCountRange5>=2 --近战单位数量
				and
				XFZBuffCount==0 --旋风斩层数==0
				and
				IsPlayerSpell(394329) --已学天赋[泰坦之怒]
			)
			then
				if WR_ColorFrame_Show("CF8","奥丁之怒") then return true end
			end
		end
	end
	return false
end

--施法过程 旋风斩
function WR_WarriorFury_XFZ(Text)
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("旋风斩") --技能可用 资源可用
	then
		if Text=="AOE"
		and HUCountRange5>=2 --近战单位数量
		and XFZBuffCount==0 --旋风斩层数==0
		and IsPlayerSpell(12950) --已学天赋[强化旋风斩]
		then
			if WR_ColorFrame_Show("CF10","旋风AOE") then return true end
		elseif Text==nil then
			if WR_ColorFrame_Show("CF10","旋风斩") then return true end
		end
	end
	return false
end

--施法过程 暴怒
function WR_WarriorFury_BN(Text)
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("暴怒")	--技能可用 资源可用
	and
	(
		HUCountRange5<=1	--近战单位数量<=1
		or
		(
			HUCountRange5>=2	--近战单位数量>=2
			and
			XFZBuffCount>=1	--旋风斩层数>=1
		)
	)
	then
		if HUCountRange5>=2 and XFZBuffCount==0 then	--近战单位数量>=2 且 旋风斩层数==0
			if WR_WarriorFury_ADZN("AOE") then return true end	--施法过程 奥丁之怒
			if WR_WarriorFury_XFZ("AOE") then return true end	--施法过程 旋风斩AOE
		end
		
		if Text=="激怒" and JNBuffTime<=GCD then --激怒 BUFF不存在
			if WR_ColorFrame_Show("CF9","暴怒(激怒)") then return true end
		elseif Text=="溢出" and Rage>=115 then --怒气>=115
			if WR_ColorFrame_Show("CF9","暴怒(溢出)") then return true end
		elseif Text==nil then
			if WR_ColorFrame_Show("CF9","暴怒") then return true end
		end
	end
	return false
end

--施法过程 剑刃风暴
function WR_WarriorFury_JRFB()
	if GCD<=ShiFaSuDu
	and IsPlayerSpell(227847)	--已学 剑刃风暴
	and zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and JNBuffTime>GCD --激怒 BUFF存在
	--and TSXFBuffTime>GCD --天神下凡 BUFF存在
	--and LMBuffTime>GCD --鲁莽 BUFF存在
	and IsPlayerSpell(227847)	--已学 剑刃风暴
	and WR_SpellUsable("剑刃风暴") --技能可用 资源可用
	then
		if HUCountRange5>=2	--近战单位数量>=2
		and IsPlayerSpell(386628)	--已学 [迷狂乱舞] 剑刃风暴期间 自动嗜血
		and XFZBuffCount==0	--身上没有旋风斩
		then
			if WR_WarriorFury_ADZN("AOE") then return true end	--施法过程 奥丁之怒
			if WR_WarriorFury_XFZ("AOE") then return true end	--施法过程 旋风斩AOE
		end
		if WR_ColorFrame_Show("CF11","剑刃风暴") then return true end
	end
	return false
end


--施法过程 勇士之矛
function WR_WarriorFury_YSZM()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and JNBuffTime>GCD --激怒 BUFF存在
	and WR_SpellUsable("勇士之矛") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CSP","勇士之矛") then return true end
	end
	return false
end

--施法过程 雷鸣之吼
function WR_WarriorFury_LMZH(MaxRage)
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetCloseRange	--目标在近战范围内
	and JNBuffTime>GCD --激怒 BUFF存在
	and WR_SpellUsable("雷鸣之吼") --技能可用 资源可用
	then
		if MaxRage~=nil and Rage<=MaxRage then	--当前怒气值<=最大指定怒气值
			if WR_ColorFrame_Show("CF12","雷鸣100") then return true end
		else
			if WR_ColorFrame_Show("CF12","雷鸣之吼") then return true end
		end
	end
	return false
end

--施法过程 嗜血
function WR_WarriorFury_SX()
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("嗜血") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF7","嗜血") then return true end
	end
	return false
end

--施法过程 斩杀
function WR_WarriorFury_ZS(Unit)
	if C_Spell.IsSpellInRange("猛击",Unit)	--技能范围内
	and WR_TargetInCombat(Unit) --单位在战斗中
	and
	(
		WR_GetUnitBuffTime("player","猝死")>GCD --BUFF存在
		or
		(
			not IsPlayerSpell(206315)	--没学[毁灭]
			and
			UnitHealth(Unit)/UnitHealthMax(Unit)<0.2	--单位血量<20%
		)
		or
		(
			IsPlayerSpell(206315)	--已学[毁灭]
			and
			UnitHealth(Unit)/UnitHealthMax(Unit)<0.35	--单位血量<35%
		)
	)
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF6","斩杀T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF7","斩杀M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN7","斩杀P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN8","斩杀P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN9","斩杀P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN0","斩杀P4T") then return true end
		end
	end
	return false
end

--施法过程 斩杀
function WR_WarriorFury_Function_ZS()
	if GCD>ShiFaSuDu then return false end
	if WR_GetGCD("斩杀")>GCD then return false end	--技能冷却中
	
	if WR_WarriorFury_ZS("target") then return true end
	
	if WR_WarriorFury_ZS("mouseover") then return true end
	for i= 1,4,1 do
		if WR_WarriorFury_ZS("party"..i.."target") then return true end
	end
	
	return false
end

--施法过程 怒击
function WR_WarriorFury_NJ(Text)
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("怒击") --技能可用 资源可用
	then
		if Text==nil then
			if WR_ColorFrame_Show("CF5","怒击") then return true end
		elseif Text=="碎甲猛击" and WR_GetUnitBuffTime("player","碎甲猛击")>GCD and JNBuffTime>GCD then	--碎甲猛击 以及 激怒 BUFF存在
			if WR_ColorFrame_Show("CF5","碎甲猛击") then return true end
		end
	end
	return false
end

--施法过程 强攻
function WR_WarriorFury_QG()
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("强攻") --技能可用 资源可用
	and
	(
		JNBuffTime>GCD	--激怒 BUFF存在
		or
		IsPlayerSpell(388933)	--已学天赋[暴捶]
	)
	then
		if WR_ColorFrame_Show("CSO","强攻") then return true end
	end
	return false
end

--施法过程 猛击
function WR_WarriorFury_MJ()
	if GCD<=ShiFaSuDu
	and TargetCloseRange	--目标在近战范围内
	and WR_SpellUsable("猛击") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF4","猛击") then return true end
	end
	return false
end

--破裂投掷
function WR_WarriorFury_PLTZ(Unit)
	if UnitGetTotalAbsorbs(Unit)>0	--目标身上有护盾
	and UnitCanAttack("player",Unit) --单位是敌对
	and C_Spell.IsSpellInRange(64382,Unit)	--技能范围内 破裂投掷
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF2","破裂T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("AN5","破裂M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("AN1","破裂P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("AN2","破裂P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("AN3","破裂P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("AN4","破裂P4T") then return true end
		end
	end
	return false
end

--施法过程 破裂投掷
function WR_WarriorFury_Function_PLTZ()
	if GCD>ShiFaSuDu then return false end
	if not IsPlayerSpell(384110) then return false end	--没有学习 破裂投掷
	if WR_GetGCD("破裂投掷")>GCD then return false end	--技能冷却中
	
	if WR_WarriorFury_PLTZ("target") then return true end
	if WR_WarriorFury_PLTZ("mouseover") then return true end
	for i= 1,4,1 do
		if WR_WarriorFury_PLTZ("party"..i.."target") then return true end
	end
end

--斩杀判定
function WR_WarriorFury_ZhanSha_OK(Unit)
	if WR_GetUnitBuffTime("player","猝死")>GCD --BUFF存在
	or
	(
		not IsPlayerSpell(206315)	--没学 毁灭
		and
		UnitHealth(Unit)/UnitHealthMax(Unit)<0.2	--单位血量<20%
	)
	or
	(
		IsPlayerSpell(206315)	--已学 毁灭
		and
		UnitHealth(Unit)/UnitHealthMax(Unit)<0.35	--单位血量<35%
	)
	then
		return true
	end
	return false
end


--[[
--苦痛免疫
function WR_WarriorFury_KTMY()
	if WRSet.KBZ_KTMY~=4 --苦痛免疫 开启
	and WR_SpellUsable("苦痛免疫") --技能可用 资源可用
	and PlayerHP<WRSet.KBZ_KTMY/10 --血量比例
	and UnitAffectingCombat("player") --玩家战斗中
	then
		if WR_ColorFrame_Show("","苦痛免疫") then return true end
	end
	return false
end
--]]
