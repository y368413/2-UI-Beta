--酒仙运行库
function WR_MonkBrewmaster()
	if GetSpecialization()~=1 then	--如果不是酒仙(1)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.05+WRSet.JX_SFSD*0.05
	GCD=WR_GetGCD("猛虎掌")	--获得当前公共CD
	
	Energy=UnitPower("player",3)	--获得当前能量值
	HUCountRangeMHZ=WR_GetRangeHarmUnitCount(5,false)	--获得猛虎掌技能范围内的敌人数量

	PlayerHP=0
	PlayerSP=0
	if UnitHealthMax("player")~=nil and UnitHealthMax("player")~=0 then
		PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得自身生命百分比
		if UnitStagger("player")>0 then
			PlayerSP=UnitStagger("player")/UnitHealthMax("player")	--获得自身醉拳百分比
		end
	end
	
	PlayerMove=WR_PlayerMove()--获得自身是否在移动或者空中
	TargetRange=WR_GetUnitRange("target")	--获得目标的距离
	InBossCombat=WR_InBossCombat()	--获得是否BOSS战斗
	TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS
	TargetIsNearby=TargetRange<=5	--获得目标是否在近战技能范围内
	TargetInCombat=WR_TargetInCombat("target")	--单位在与我们进行战斗
	AvgDeathTime=WR_GetRangeAvgDeathTime(40)	--获得预计战斗结束时间
	JHZQ_BuffTime,_,_=WR_GetUnitBuffInfo("player","净化真气")	--净化真气BUFF时间
	HXJ_Charges=WR_GetSpellCharges("活血酒")

	if MSG==1 then
		print("FocusHP=",FocusHP)
	end
	
	if WR_PriorityCheck() then return end	--优先检查

	--躯不坏
	if WRSet.JX_QBH~=6 --躯不坏不是关闭的
	and PlayerHP<=WRSet.JX_QBH/10 --血量低于设定值
	and IsPlayerSpell(122278) --已学习[躯不坏]天赋
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_GetGCD("躯不坏")<=GCD --技能冷却
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF12","躯不坏") then return true end
	end
	
	--壮胆酒
	if WRSet.JX_ZDJ~=6 --躯不坏不是关闭的
	and PlayerHP<=WRSet.JX_ZDJ/10 --血量低于设定值
	and IsPlayerSpell(115203) --已学习[壮胆酒]天赋
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_GetGCD("壮胆酒")<=GCD --技能冷却
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF11","壮胆酒") then return true end
	end
	
	if WRSet.JX_SP1>=3 then
		if WR_ShiPin(1,WRSet.JX_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.JX_SP2>=3 then
		if WR_ShiPin(2,WRSet.JX_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Monk_ZLS() then return end	--治疗石
	if WR_Monk_ZLYS() then return end	--治疗药水
	if WR_Monk_QHS_Function() then return end	--切喉手
	if WR_Function_ZNMB(2,WRSet.JX_ZNMB) then return true end	--智能目标

	--玄牛酒
	if WRSet.JX_XNJ==1 --玄牛酒 开启
	and IsPlayerSpell(115399) --已学技能
	and WR_GetGCD("玄牛酒")<=GCD --技能冷却
	and UnitAffectingCombat("player") --玩家在战斗
	and WR_GetSpellCharges("活血酒")==0 --活血酒 次数==0
	and WR_GetGCD("天神酒")>GCD --天神酒 技能冷却中
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF9","玄牛酒") then return true end
	end

	--天神酒
	if WRSet.JX_TSJ~=10 --天神酒 开启
	and IsPlayerSpell(322507) --已学技能
	and WR_GetGCD("天神酒")<=GCD --技能冷却
	and UnitAffectingCombat("player") --玩家在战斗
	and PlayerHP<=WRSet.JX_TSJ/10 --血量<=天神酒设定值
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF8","天神酒") then return true end
	end

	--活血酒
	if WRSet.JX_HXJ~=10 --活血酒 开启
	and IsPlayerSpell(119582) --已学技能
	and WR_GetGCD("活血酒")<=GCD --技能冷却
	and PlayerSP>0 --酒池>0
	and
	(
		PlayerSP>=WRSet.JX_HXJ/10 --酒池>=活血酒 设定值
		or
		(
			JHZQ_BuffTime>0 --净化真气BUFF时间>0
			and
			JHZQ_BuffTime<=1.5 --净化真气BUFF时间
		)
		or
		(
			UnitAffectingCombat("player") --单位在战斗中
			and
			JHZQ_BuffTime==0 --净化真气BUFF时间==0
			and
			WR_GetSpellCharges("活血酒")==2 --活血酒 次数
		)
	)
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF7","活血酒") then return true end
	end

	--玄牛下凡
	if WRSet.JX_XNXF==1 --玄牛下凡 开启
	and IsPlayerSpell(132578) --已学技能
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_GetGCD("玄牛下凡")<=GCD --技能冷却
	and PlayerSP>=WRSet.JX_HXJ/10 --酒池>=活血酒设定值
	and WR_GetGCD("天神酒")>GCD --天神酒 技能冷却中
	and WR_GetGCD("玄牛酒")>GCD --玄牛酒 技能冷却中
	and WR_GetSpellCharges("活血酒")==0 --活血酒次数
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF6","玄牛下凡") then return true end
	end

	--平心之环
	if WRSet.JX_PXZH~=4 --平心之环 开启
	and IsPlayerSpell(116844) --已学技能
	and UnitAffectingCombat("player")	--玩家战斗中
	and WR_GetGCD("平心之环")<=GCD --技能冷却
	and PlayerHP<=WRSet.JX_PXZH/10 --玩家血量 <= 平心之环设定值
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("SF5","平心之环") then return true end
	end
	--平心之环

	--扫堂腿
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and WRSet.JX_STT==1 --扫堂腿 开启
	and WR_GetGCD("扫堂腿")<=GCD --技能冷却
	and WR_StunUnit(6,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("SF4","扫堂腿") then return true end
	end
	
	if WR_Monk_FJCG_Function() then return true end	--分筋错骨

	if WR_MonkBrewmaster_XRMH_Function() then return true end	--迅如猛虎

	if WR_MonkBrewmaster_Function_QCSX() then return true end	--清创生血

	--活血术
	if WRSet.JX_HXS~=10	--活血术 开启
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and WR_SpellUsable("活血术")	--技能可用
	and WR_GetUnitBuffTime("player","活力苏醒")>GCD	--活力苏醒 BUFF存在
	and PlayerHP<=WRSet.JX_HXS/10	--自身血量<=设定值
	and WR_MonkPass()
	then
		if WR_ColorFrame_Show("ASF9","活血术") then return true end
	end
	
	--碧玉疾风
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(116847) --已学技能
	and WR_GetGCD("碧玉疾风")<=GCD --技能冷却
	and not UnitAffectingCombat("player") --玩家没在战斗中
	then
		if WR_ColorFrame_Show("SF2","碧玉疾风") then return true end
	end

--目标不可攻击，则不再往下执行操作
	if not WR_TargetInCombat("target") then --目标不可攻击
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
--目标不可攻击，则不再往下执行操作

	if TargetIsNearby then	--目标在近战
		if WRSet.JX_SP1==1 then
			if WR_ShiPin(1,WRSet.JX_SP1) then return true end	--饰品 常驻
		end
		if WRSet.JX_SP2==1 then
			if WR_ShiPin(2,WRSet.JX_SP2) then return true end	--饰品 常驻
		end
	end
	
--爆发循环
	if zhandoumoshi==1 --开爆发
	then
		if TargetIsNearby then	--目标在近战
			if WRSet.JX_SP1==2 then
				if WR_ShiPin(1,WRSet.JX_SP1) then return true end	--饰品 爆发
			end
			if WRSet.JX_SP2==2 then
				if WR_ShiPin(2,WRSet.JX_SP2) then return true end	--饰品 爆发
			end
		end
		
		--骨尘酒
		if GCD<=ShiFaSuDu --GCD<=施法速度
		and WRSet.JX_GCJ==1 --骨尘酒 开启
		and IsPlayerSpell(386276) --已学技能
		and WR_GetGCD("骨尘酒")<=GCD --技能冷却
		and TargetRange<=2 --技能范围内
		then
			if WR_ColorFrame_Show("SF1","骨尘酒") then return true end
		end

		--爆炸酒桶
		if GCD<=ShiFaSuDu --GCD<=施法速度
		and WRSet.JX_BZJT==1 --爆炸酒桶 开启
		and IsPlayerSpell(325153) --已学技能
		and WR_GetGCD("爆炸酒桶")<=GCD --技能冷却
		and TargetRange<=2 --技能范围内
		then
			if WR_ColorFrame_Show("CF12","爆炸酒桶") then return true end
		end

		--醉酿投
		if GCD<=ShiFaSuDu --GCD<=施法速度
		and IsPlayerSpell(121253) --已学技能
		and WR_GetGCD("醉酿投")<=GCD --技能冷却
		and IsSpellInRange("醉酿投","target") --技能范围内
		then
			if WR_ColorFrame_Show("CF11","醉酿投") then return true end
		end

		--精序兵戈
		if GCD<=ShiFaSuDu --GCD<=施法速度
		and WRSet.JX_JXBG==1 --精序兵戈 开启
		and IsPlayerSpell(387184) --已学技能
		and WR_GetGCD("精序兵戈")<=GCD --技能冷却
		and TargetRange<=20 --技能范围内
		and WR_GetSpellCharges("醉酿投")==0 --技能次数
		then
			if WR_ColorFrame_Show("CF10","精序兵戈") then return true end
		end

		--白虎雕像
		if GCD<=ShiFaSuDu --GCD<=施法速度
		and WRSet.JX_BHDX==1 --白虎雕像 开启
		and IsPlayerSpell(388686) --已学技能
		and WR_GetGCD("召唤白虎雕像")<=GCD --技能冷却
		and TargetRange<=2 --技能范围内
		then
			if WR_ColorFrame_Show("ASF11","白虎雕像") then return true end
		end
	end
--爆发循环

--伤害循环

	--轮回之触
	if WRSet.JX_LHZC==1	--轮回之触 开启
	and GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(322109) --已学技能
	and WR_GetGCD("轮回之触")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and IsSpellOverlayed(322109) --技能触发
	then
		if WR_ColorFrame_Show("CF8","轮回之触") then return true end
	end

	--醉酿投
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(121253) --已学技能
	and WR_GetGCD("醉酿投")<=GCD --技能冷却
	and IsSpellInRange("醉酿投","target") --技能范围内
	and
	(
		WR_GetUnitDebuffInfo("target","醉酿投",true)==0 --醉酿投 Debuff不存在
		or
		WR_GetUnitBuffInfo("player","酒醒入定")<1 --酒醒入定 BUFF<1秒
		or
		WR_GetSpellCharges("醉酿投")==2 --技能次数
		or
		(
			WR_GetSpellCharges("醉酿投")==1 --技能次数
			and
			WR_GetSpellNextCharge("醉酿投")<=2.5 --技能 充能时间
		)
	)
	then
		if WR_ColorFrame_Show("CF7","醉酿投") then return true end
	end

	--火焰之息
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(115181) --已学技能
	and WR_GetGCD("火焰之息")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	then
		if WR_ColorFrame_Show("CF6","火焰之息") then return true end
	end

	--猛虎1
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(100780) --已学技能
	and WR_GetGCD("猛虎掌")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and not IsPlayerSpell(418359)	--没学 顺水推舟
	and WR_GetUnitBuffTime("player","幻灭连击")>GCD --BUFF存在
	then
		if WR_ColorFrame_Show("CF9","猛虎1") then return true end
	end

	--神鹤1
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(322729) --已学技能
	and WR_GetGCD("神鹤引项踢")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and HUCountRangeMHZ>3 --近战单位>3
	and WR_GetUnitBuffTime("player","灼焰炙气")>GCD --BUFF存在
	and WR_GetUnitBuffTime("player","灼焰炙气")<3 --BUFF时间<3
	and WR_GetUnitDebuffInfo("target","火焰之息",true)>GCD	--DEBUFF 存在
	and WR_GetUnitDebuffInfo("target","火焰之息",true)<9 --DEBUFF时间<9
	and WR_GetUnitBuffTime("player","精序兵戈")<GCD --精序兵戈BUFF不存在
	then
		if WR_ColorFrame_Show("CF5","神鹤1") then return true end
	end

	--幻灭踢
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(205523) --已学技能
	and WR_GetGCD("幻灭踢")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	then
		if WR_ColorFrame_Show("CF4","幻灭踢") then return true end
	end

	--碧玉疾风
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(116847) --已学技能
	and WR_GetGCD("碧玉疾风")<=GCD --技能冷却
	then
		if WR_ColorFrame_Show("SF2","碧玉疾风") then return true end
	end

	--移花接木
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(322101) --已学技能
	and WR_GetGCD("移花接木")<=GCD --技能冷却
	and TargetRange<=20 --技能范围内
	and PlayerHP<=0.7 --生命值
	then
		if WR_ColorFrame_Show("CF3","移花接木") then return true end
	end

	--旭日东升踢
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(107428) --已学技能
	and WR_GetGCD("旭日东升踢")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and HUCountRangeMHZ<=3 --近战单位<=3
	then
		if WR_ColorFrame_Show("CF2","旭日东升踢") then return true end
	end

	--猛虎2
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(100780) --已学技能
	and not IsPlayerSpell(418359)	--没学 顺水推舟
	and WR_GetGCD("猛虎掌")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and Energy>=55 --能量>=55
	and HUCountRangeMHZ<=3 --近战单位<=3
	then
		if WR_ColorFrame_Show("CF9","猛虎2") then return true end
	end
	
	--神鹤2
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(322729) --已学技能
	and WR_GetGCD("神鹤引项踢")<=GCD --技能冷却
	and TargetRange<=2 --技能范围内
	and Energy>=55 --能量>=55
	and WR_GetUnitBuffTime("player","精序兵戈")<GCD --精序兵戈BUFF不存在
	then
		if WR_ColorFrame_Show("CF5","神鹤2") then return true end
	end

	--真气波
	if GCD<=ShiFaSuDu --GCD<=施法速度
	and IsPlayerSpell(115098) --已学技能
	and WR_GetGCD("真气波")<=GCD --技能冷却
	and IsSpellInRange("真气波","target") --技能范围内
	then
		if WR_ColorFrame_Show("CF1","真气波") then return true end
	end

--伤害循环

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end

--清创生血 的先决条件
function WR_MonkBrewmaster_QCSX(Unit)
	if not UnitCanAttack("player",Unit)	--单位是友方
	and WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_CanRemoveUnitDebuff(Unit)	--单位有可驱散Debuff
	then
		if Unit=="player" then
			if WR_ColorFrame_Show("ASF1","驱散P") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("ASF3","驱散M") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("ASF5","驱散P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("ASF6","驱散P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("ASF7","驱散P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("ASF8","驱散P4") then return true end
		end
	end
	return false
end

--施法过程 清创生血
function WR_MonkBrewmaster_Function_QCSX()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("清创生血") then return false end	--技能不可用

	if WRSet.JX_QCSX==1 then	--智能
		if WR_MonkBrewmaster_QCSX("mouseover") then return true end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)=="TANK" then
				if WR_MonkBrewmaster_QCSX("party"..i) then return true end
			end
		end
		if WR_MonkBrewmaster_QCSX("player") then return true end
		for i=1,4,1 do
			if WR_MonkBrewmaster_QCSX("party"..i) then return true end
		end
	elseif WRSet.JX_QCSX==2 then	--指向
		if WR_MonkBrewmaster_QCSX("mouseover") then return true end
	elseif WRSet.JX_QCSX==3 then	--自己
		if WR_MonkBrewmaster_QCSX("player") then return true end
	end
	
	return false
end


--迅如猛虎
function WR_MonkBrewmaster_XRMH(Unit)
	if IsSpellInRange("迅如猛虎",Unit) --单位在技能范围内
	and not UnitCanAttack("player",Unit) --单位是友方
	and WR_Unbind(Unit)	--单位身上有定身BUFF
	then
		if Unit=="player" then
			if WR_ColorFrame_Show("CSG","迅虎P") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("ACSF9","迅虎P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("ACSF10","迅虎P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("ACSF11","迅虎P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("ACSF12","迅虎P4") then return true end
		end
	end
	return false
end

--迅如猛虎
function WR_MonkBrewmaster_XRMH_Function()
	if not IsPlayerSpell(116841) then return false end	--没学天赋[迅如猛虎]
	if WR_GetGCD("迅如猛虎")>GCD then return false end	--技能冷却中
	if UnitChannelInfo("player")~=nil then return false end	--玩家在引导施法
	if WRSet.JX_XRMH==3 then return false end	--迅如猛虎 关闭
	
	if WR_MonkBrewmaster_XRMH("player") then return true end	--玩家
	if WRSet.JX_XRMH==1 then
		for i=1,4,1 do
			if WR_MonkBrewmaster_XRMH("party"..i) then return true end
		end
	end
	return false
end

--分筋错骨 先决条件
function WR_MonkBrewmaster_FJCG(Unit)
	if IsPlayerSpell(115078)
	--已学天赋[分筋错骨]
	and
	WR_GetGCD("分筋错骨")<=GCD
	--技能冷却
	and
	IsSpellInRange("分筋错骨", Unit)
	--单位在技能范围内
	and
	UnitChannelInfo("player")==nil
	--没有在引导施法
	and
	WR_StunSpell(Unit)
	--单位需要控制
	then
		return true
	end
	return false
end

--切喉手 先决条件
function WR_MonkBrewmaster_QHS(Unit)
	if IsPlayerSpell(116705)
	--已学天赋[切喉手]
	and
	WR_GetGCD("切喉手")<=GCD
	--技能冷却
	and
	IsSpellInRange("切喉手", Unit)
	--技能范围内
	and
	UnitChannelInfo("player")==nil
	--没有在引导施法
	and
	WR_GetCastInterruptible(Unit,InterruptTime)
	--指定"单位"施法剩余时间小于设定
	then
		return true
	end
	return false
end