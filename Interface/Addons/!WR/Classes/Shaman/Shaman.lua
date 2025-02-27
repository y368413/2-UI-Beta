--作者微信:WOW-Robot(转载请保留,感谢!)

--萨满
function WR_Shaman()
	WR_ShamanSettings() --初始化储存值
	WR_ShamanConfigFrame()	--创建的设置窗口
	WR_ShamanSettingsSave() --设置写入
	WR_ShamanFrameShowOrHide()	--对应专精显示或隐藏
	WR_ShamanEnhancement() --增强萨运行库
	WR_ShamanRestoration() --奶萨运行库
end

--初始化储存值
function WR_ShamanSettings()
	if WRSet==nil then
		local Settings = {
			ZQ_ZNJD=9,	--智能焦点
			ZQ_XJZY=2,	--星界转移
			ZQ_ZLZY=3,	--治疗之涌
			ZQ_ZLS=3,	--治疗石
			ZQ_ZLYS=2,	--治疗药水
			ZQ_SP1=13,	--饰品1
			ZQ_SP2=13,	--饰品2
			
			HF_ZNJD=9,	--智能焦点
			HF_XJZY=2,	--星界转移
			HF_ZLS=3,	--治疗石
			HF_ZLYS=2,	--治疗药水
			HF_SP1=13,	--饰品1
			HF_SP2=13,	--饰品2
		}
		WRSet=Settings
	end
end

--设置写入
function WR_ShamanSettingsSave()
	if WRSet~=nil then
		WRSet.ZQ_ZNMB=UIDropDownMenu_GetSelectedID(ZQ_ZNMB_Dropdown) --智能目标
		WRSet.ZQ_ZNJD=UIDropDownMenu_GetSelectedID(ZQ_ZNJD_Dropdown) --智能焦点
		WRSet.ZQ_FJ=UIDropDownMenu_GetSelectedID(ZQ_FJ_Dropdown) --风剪
		WRSet.ZQ_DDMS=UIDropDownMenu_GetSelectedID(ZQ_DDMS_Dropdown) --打断模式
		WRSet.ZQ_HD=UIDropDownMenu_GetSelectedID(ZQ_HD_Dropdown) --护盾
		WRSet.ZQ_JHS=UIDropDownMenu_GetSelectedID(ZQ_JHS_Dropdown) --净化术
		WRSet.ZQ_JHLH=UIDropDownMenu_GetSelectedID(ZQ_JHLH_Dropdown) --净化灵魂
		WRSet.ZQ_QDTT=UIDropDownMenu_GetSelectedID(ZQ_QDTT_Dropdown) --清毒图腾
		WRSet.ZQ_LTFB=UIDropDownMenu_GetSelectedID(ZQ_LTFB_Dropdown) --雷霆风暴
		WRSet.ZQ_TYS=UIDropDownMenu_GetSelectedID(ZQ_TYS_Dropdown) --土元素
		WRSet.ZQ_HMZF=UIDropDownMenu_GetSelectedID(ZQ_HMZF_Dropdown) --毁灭之风
		WRSet.ZQ_ST=UIDropDownMenu_GetSelectedID(ZQ_ST_Dropdown) --升腾
		WRSet.ZQ_KFNH=UIDropDownMenu_GetSelectedID(ZQ_KFNH_Dropdown) --狂风怒号
		WRSet.ZQ_YDTT=UIDropDownMenu_GetSelectedID(ZQ_YDTT_Dropdown) --涌动图腾
		WRSet.ZQ_YHB=UIDropDownMenu_GetSelectedID(ZQ_YHB_Dropdown) --幽魂步
		--WRSet.ZQ_YHZL=UIDropDownMenu_GetSelectedID(ZQ_YHZL_Dropdown) --幽魂之狼
		WRSet.ZQ_XZZY=UIDropDownMenu_GetSelectedID(ZQ_XZZY_Dropdown) --先祖指引
		WRSet.ZQ_XJZY=UIDropDownMenu_GetSelectedID(ZQ_XJZY_Dropdown) --星界转移
		WRSet.ZQ_ZLZY=UIDropDownMenu_GetSelectedID(ZQ_ZLZY_Dropdown) --治疗之涌
		WRSet.ZQ_ZLS=UIDropDownMenu_GetSelectedID(ZQ_ZLS_Dropdown) --治疗石
		WRSet.ZQ_ZLYS=UIDropDownMenu_GetSelectedID(ZQ_ZLYS_Dropdown) --治疗药水
		WRSet.ZQ_SP1=UIDropDownMenu_GetSelectedID(ZQ_SP1_Dropdown) --饰品1
		WRSet.ZQ_SP2=UIDropDownMenu_GetSelectedID(ZQ_SP2_Dropdown) --饰品2
		WRSet.ZQ_SFSD=UIDropDownMenu_GetSelectedID(ZQ_SFSD_Dropdown) --施法速度
		
		
		WRSet.HF_ZNMB=UIDropDownMenu_GetSelectedID(HF_ZNMB_Dropdown) --智能目标
		WRSet.HF_FJ=UIDropDownMenu_GetSelectedID(HF_FJ_Dropdown) --风剪
		WRSet.HF_DDMS=UIDropDownMenu_GetSelectedID(HF_DDMS_Dropdown) --打断模式
		WRSet.HF_DDZD=UIDropDownMenu_GetSelectedID(HF_DDZD_Dropdown) --大地之盾
		WRSet.HF_JHS=UIDropDownMenu_GetSelectedID(HF_JHS_Dropdown) --净化术
		WRSet.HF_JHLH=UIDropDownMenu_GetSelectedID(HF_JHLH_Dropdown) --净化灵魂
		WRSet.HF_QDTT=UIDropDownMenu_GetSelectedID(HF_QDTT_Dropdown) --清毒图腾
		WRSet.HF_LTFB=UIDropDownMenu_GetSelectedID(HF_LTFB_Dropdown) --雷霆风暴
		WRSet.HF_TYS=UIDropDownMenu_GetSelectedID(HF_TYS_Dropdown) --土元素
		WRSet.HF_YDTT=UIDropDownMenu_GetSelectedID(HF_YDTT_Dropdown) --涌动图腾
		WRSet.HF_XZZY=UIDropDownMenu_GetSelectedID(HF_XZZY_Dropdown) --先祖指引
		WRSet.HF_ST=UIDropDownMenu_GetSelectedID(HF_ST_Dropdown) --升腾
		WRSet.HF_ZLZC=UIDropDownMenu_GetSelectedID(HF_ZLZC_Dropdown) --治疗之触
		WRSet.HF_LHLJ=UIDropDownMenu_GetSelectedID(HF_LHLJ_Dropdown) --灵魂链接
		WRSet.HF_SHSC=UIDropDownMenu_GetSelectedID(HF_SHSC_Dropdown) --伤害输出
		WRSet.HF_XZSJ=UIDropDownMenu_GetSelectedID(HF_XZSJ_Dropdown) --先祖视界
		WRSet.HF_XJZY=UIDropDownMenu_GetSelectedID(HF_XJZY_Dropdown) --星界转移
		WRSet.HF_ZLS=UIDropDownMenu_GetSelectedID(HF_ZLS_Dropdown) --治疗石
		WRSet.HF_ZLYS=UIDropDownMenu_GetSelectedID(HF_ZLYS_Dropdown) --治疗药水
		WRSet.HF_SP1=UIDropDownMenu_GetSelectedID(HF_SP1_Dropdown) --饰品1
		WRSet.HF_SP2=UIDropDownMenu_GetSelectedID(HF_SP2_Dropdown) --饰品2
		WRSet.HF_SFSD=UIDropDownMenu_GetSelectedID(HF_SFSD_Dropdown) --施法速度
	end
	if GetSpecialization()==2 then	--增强专精
		if WRSet.ZQ_DDMS~=nil then
			InterruptTime=(WRSet.ZQ_DDMS-1)/10
		end
	elseif GetSpecialization()==3 then	--恢复专精
		if WRSet.HF_DDMS~=nil then
			InterruptTime=(WRSet.HF_DDMS-1)/10
		end
	end
	
end

--对应专精显示或隐藏
function WR_ShamanFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--元素专精
		ZQ_Frame:Hide()
		HF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
	if GetSpecialization()==2 then	--增强专精
		ZQ_Frame:Show()
		HF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+19*35)
		if IsPlayerSpell(444995) then --已学 [涌动图腾]
			ZQ_KFNH_Text:Hide()
			ZQ_KFNH_Dropdown:Hide()
			ZQ_YDTT_Text:Show()
			ZQ_YDTT_Dropdown:Show()
		else
			ZQ_KFNH_Text:Show()
			ZQ_KFNH_Dropdown:Show()
			ZQ_YDTT_Text:Hide()
			ZQ_YDTT_Dropdown:Hide()
		end
	end
	if GetSpecialization()==3 then	--恢复专精
		ZQ_Frame:Hide()
		HF_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+20*35)
	end
end

--治疗石
function WR_Shaman_ZLS()
	local Temp_ZLS=5
	if GetSpecialization()==2 then	--增强
		Temp_ZLS = WRSet.ZQ_ZLS
	elseif GetSpecialization()==3 then	--恢复
		Temp_ZLS = WRSet.HF_ZLS
	end
	
	if Temp_ZLS~=5 --治疗石选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLS/10 --血量比例<治疗石设定值/10
	and WR_Use_ZLS() then --治疗石 可用
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--治疗药水
function WR_Shaman_ZLYS()
	local Temp_ZLYS=5
	if GetSpecialization()==2 then	--增强
		Temp_ZLYS = WRSet.ZQ_ZLYS
	elseif GetSpecialization()==3 then	--恢复
		Temp_ZLYS = WRSet.HF_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then --治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--星界转移
function WR_Shaman_XJZY()
	local Temp_XJZY=5
	if GetSpecialization()==2 then	--增强
		Temp_XJZY = WRSet.ZQ_XJZY
	elseif GetSpecialization()==3 then	--恢复
		Temp_XJZY = WRSet.HF_XJZY
	end
	
	if Temp_XJZY~=6 --星界转移 开启
	and WR_SpellUsable("星界转移")	--技能 可用
	and PlayerHP<Temp_XJZY/10 --血量比例
	then
		if WR_ColorFrame_Show("CSK","星界转移") then return true end
	end
	return false
end

--风剪 的先决条件
function WR_Shaman_FJ(Unit)
	if UnitCanAttack(Unit,"player")	--单位是敌方
	and WR_GetUnitRange(Unit)<=30	--单位距离
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Shaman_FJ_Important)	--单位有需要打断的法术
	then
		if GetSpecialization()==3 then	--奶萨
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF1","风剪"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"风剪") then return true end --选择单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("CSF6","风剪T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSF5","风剪M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("SF1","风剪F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("CSF1","风剪P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("CSF2","风剪P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("CSF3","风剪P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("CSF4","风剪P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 风剪
function WR_Shaman_Function_FJ()
	if not WR_SpellUsable("风剪") then return false end	--技能不可用
	if not UnitAffectingCombat("player") then return false end	--玩家不在战斗
	
	local Temp_FJ=9
	if GetSpecialization()==2 then	--增强专精
		Temp_FJ = WRSet.ZQ_FJ
	elseif GetSpecialization()==3 then	--恢复专精
		Temp_FJ = WRSet.HF_FJ
	end
	
	if Temp_FJ<=4 then
		WR_Shaman_FJ_Important = false
	else
		WR_Shaman_FJ_Important = true
	end
	
	if Temp_FJ==9 then	--禁用
		return false
	elseif (Temp_FJ==1 or Temp_FJ==5)	--智能
	or
	(
		(Temp_FJ==4 or Temp_FJ==8)	--焦点
		and
		(
			not UnitExists("focus")	--焦点不存在
			or
			UnitIsDead("focus")	--焦点死亡
			or
			not UnitCanAttack("player","focus")	--焦点不可攻击
		)
	)
	then
		if WR_Shaman_FJ("focus") then return true end	--焦点
		if WR_Shaman_FJ("target") then return true end	--目标
		if WR_Shaman_FJ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Shaman_FJ("party"..i.."target") then return true end
		end
	elseif (Temp_FJ==2 or Temp_FJ==6) then	--目标
		if WR_Shaman_FJ("target") then return true end
	elseif (Temp_FJ==3 or Temp_FJ==7) then	--指向
		if WR_Shaman_FJ("mouseover") then return true end
	elseif (Temp_FJ==4 or Temp_FJ==8) then	--焦点
		if WR_Shaman_FJ("focus") then return true end
	end
	
	return false
end

--净化灵魂
function WR_Shaman_JHLH(Unit)
	if WR_GetUnitDebuffTime(Unit,"虚空裂隙")~=0 then	--虚空裂隙DEBUFF存在
		for i=1,40,1
		do
		   local _, totemName, startTime, duration, _= GetTotemInfo(i)
			if totemName=="清毒图腾" then
				return false	--已经插了清毒图腾就不驱散了
			end 
		end
	end
	
	if not UnitCanAttack("player",Unit) --单位是友方
	and IsSpellInRange("净化灵魂",Unit) --单位在技能范围内
	and WR_CanRemoveUnitDebuff(Unit) --单位有可驱散Debuff
	then
		if GetSpecialization()==3 then	--奶萨
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF8","净灵"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"净灵") then return true end --选择单位过程
		else
			if Unit=="player" then
				if WR_ColorFrame_Show("CN6","净灵P") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CN5","净灵M") then return true end
			elseif Unit=="party1" then
				if WR_ColorFrame_Show("CN1","净灵P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("CN2","净灵P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("CN3","净灵P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("CN4","净灵P4") then return true end
			end
		end
	end
	return false
end

--施法过程 净化灵魂
function WR_Shaman_Function_JHLH()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
		
	if GetSpecialization()==2 then	--增强 专精
		if not WR_SpellUsable(51886) then return false end	--技能不可用
	elseif GetSpecialization()==3 then	--恢复 专精
		if not WR_SpellUsable(77130) then return false end	--技能不可用
	end
	
	local Temp_JHLH=2
	if GetSpecialization()==2 then	--增强 专精
		Temp_JHLH = WRSet.ZQ_JHLH
	elseif GetSpecialization()==3 then	--恢复 专精
		Temp_JHLH = WRSet.HF_JHLH
	end

	if Temp_JHLH==3 then return false end	--净化灵魂 关闭

	if WR_Shaman_JHLH("mouseover") then return true end
	
	if Temp_JHLH==1 then
		if WR_Shaman_JHLH("player") then return true end
		for i= 1,4,1 do
			if WR_Shaman_JHLH("party"..i) then return true end --净化灵魂 
		end
	end
	return false
end

--净化术
function WR_Shaman_JHS(Unit)
	if WR_GetUnitRange(Unit)<=30	--单位距离
	and WR_TargetInCombat(Unit) --单位在战斗
	and WR_GetUnitBuffType(Unit,"Magic") --单位有可驱散的魔法
	then
		if GetSpecialization()==3 then	--奶萨
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF2","净化"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"净化") then return true end --选择单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("AN5","净化T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("AN6","净化M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("SF2","净化F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("AN1","净化P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("AN2","净化P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("AN3","净化P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("AN4","净化P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 净化术
function WR_Shaman_Function_JHS()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("净化术") then return false end	--技能不可用
	if not IsPlayerSpell(370) then return false end	--没学 净化术
	
	local Temp_JHS=5
	if GetSpecialization()==2 then	--增强专精
		Temp_JHS = WRSet.ZQ_JHS
	elseif GetSpecialization()==3 then	--恢复专精
		Temp_JHS = WRSet.HF_JHS
	end
	
	if Temp_JHS==5 then	--禁用
		return false
	elseif Temp_JHS==1	--智能
	or
	(
		Temp_JHS==4	--焦点
		and
		(
			not UnitExists("focus")	--焦点不存在
			or
			UnitIsDead("focus")	--焦点死亡
			or
			not UnitCanAttack("player","focus")	--焦点不可攻击
		)
	)
	then
		if WR_Shaman_JHS("focus") then return true end	--焦点
		if WR_Shaman_JHS("target") then return true end	--目标
		if WR_Shaman_JHS("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Shaman_JHS("party"..i.."target") then return true end
		end
	elseif Temp_JHS==2 then	--目标
		if WR_Shaman_JHS("target") then return true end
	elseif Temp_JHS==3 then	--指向
		if WR_Shaman_JHS("mouseover") then return true end
	elseif Temp_JHS==4 then	--焦点
		if WR_Shaman_JHS("focus") then return true end
	end
	
	return false
end

--施法过程 天怒
function WR_Shaman_TN()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("天怒") --技能可用
	and
	(
		WR_GetUnitBuffTime("player","天怒")==0	--自己没有战斗怒吼
		or
		(
			not UnitAffectingCombat("player")	--非战斗状态
			and
			(
				WR_GetUnitBuffTime("player","天怒")<600	--战斗怒吼小于10分钟
				or
				WR_PartyNotBuff("天怒") --队友没有 天怒
			)
		)
	)
	then
		if WR_ColorFrame_Show("ASF7","天怒") then return true end
	end
	return false
end

--清毒图腾
function WR_Shaman_QDTT(Unit)
	if WR_GetUnitDebuffTime(Unit,"虚空裂隙")~=0 then	--虚空裂隙DEBUFF存在
		if WR_ColorFrame_Show("CSI","清毒图腾") then return true end
	end
	return false
end
	
--施法过程 清毒图腾
function WR_Shaman_Function_QDTT()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not IsPlayerSpell(383013) then return false end	--没学 [清毒图腾]
	if not WR_SpellUsable("清毒图腾") then return false end	--技能不可用
	
	for i=1,40,1
	do
	   local _, totemName, startTime, duration, _= GetTotemInfo(i)
		if totemName=="清毒图腾" then
			return false	--已经插了清毒图腾就不驱散了
		end 
	end
		
	local Temp_QDTT=2
	if GetSpecialization()==2 then	--增强 专精
		Temp_QDTT = WRSet.ZQ_QDTT
	elseif GetSpecialization()==3 then	--恢复 专精
		Temp_QDTT = WRSet.HF_QDTT
	end

	if Temp_QDTT==2 then return false end	--清毒图腾 关闭

	if WR_Shaman_QDTT("player") then return true end
	for i= 1,4,1 do
		if WR_Shaman_QDTT("party"..i) then return true end --清毒图腾 
	end
	
	return false
end
--[[
----目标战斗检测-------------------------------------------------------------
	if UnitExists("target")
	--单位存在
	and
	not(UnitIsDead("target"))
	--单位存活
	and
	UnitCanAttack("player","target")
	--单位敌对
	and
	TargetInCombat
	--单位战斗
	and
	WR_GetUnitRange("target")<=40
	--单位在技能范围内
	then
		--烈焰震击---------------------------------------------------------------------------------------------------------------
		if IsPlayerSpell(188389)
		--烈焰震击 已学习
		and
		WR_GetUnitRange("target")<=40
		--单位在技能范围内
		and
		WR_GetSpellCD("烈焰震击")<=GCD
		--技能冷却
		and
		TargetDebuffTime_LYZJ==0
		--目标没有烈焰震击Debuff
		and
		not(UnitAffectingCombat("player"))
		--玩家没在战斗中
		and
		WR_GetUnitRange("target")>20
		--目标距离>20
		and
		HUCountRange30>=2
		--30码内单位>=2
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF5","烈焰震击",zhandoumoshi) --显示指定色块窗体
			return
		end
		--烈焰震击---------------------------------------------------------------------------------------------------------------

	----单体循环----------------------------------------------------------------------------------------------------------------------------
		if HUCountRange7<=1 then
		--7码内单位<=1
			--始源T---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN6","始源T",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源T---------------------------------------------------------------------------------------------------------------
	
			--始源P1---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party1target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party1target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF6","始源P1",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P1---------------------------------------------------------------------------------------------------------------
	
			--始源P2---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party2target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party2target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF7","始源P2",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P2---------------------------------------------------------------------------------------------------------------
	
			--始源P3---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party3target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party3target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF11","始源P3",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P3---------------------------------------------------------------------------------------------------------------
	
			--始源P4---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party4target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party4target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF12","始源P4",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P4---------------------------------------------------------------------------------------------------------------
	
			--始源之潮---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("target")
			--始源之潮 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN6","始源之潮",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源之潮---------------------------------------------------------------------------------------------------------------
	

	
			--烈焰震击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188389)
			--烈焰震击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			WR_GetSpellCD("烈焰震击")<=GCD
			--技能冷却
			and
			TargetDebuffTime_LYZJ==0
			--目标没有烈焰震击Debuff
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF5","烈焰震击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--烈焰震击---------------------------------------------------------------------------------------------------------------
	

			
			--风怒图腾---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(8512)
			--风怒图腾 已学习
			and
			WR_GetSpellCD("风怒图腾")<=GCD
			--技能冷却
			and
			FNTT_BuffCount==0
			--风怒图腾 BUFF不存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF7","风怒图腾",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风怒图腾---------------------------------------------------------------------------------------------------------------
	
			--元素2层---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(117014)
			--元素冲击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=5
			--漩涡武器层数>=5
			and
			GetSpellCharges("元素冲击")>=2
			--技能次数
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF4","元素2层",zhandoumoshi) --显示指定色块窗体
				return
			end
			--元素2层---------------------------------------------------------------------------------------------------------------
	
			--潮闪电箭---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188196)
			--闪电箭 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=8
			--漩涡武器层数>=8
			and
			SYZC_BuffTime>0
			--始源之潮Buff存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","潮闪电箭",zhandoumoshi) --显示指定色块窗体
				return
			end
			--潮闪电箭---------------------------------------------------------------------------------------------------------------
	
			--狼元素---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(117014)
			--元素冲击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=8
			--漩涡武器层数>=8
			and
			GetSpellCharges("元素冲击")>=1
			--技能次数
			and
			YXLH_BuffCount>=1
			--野性狼魂 BUFF存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF4","狼元素",zhandoumoshi) --显示指定色块窗体
				return
			end
			--狼元素---------------------------------------------------------------------------------------------------------------
	
			--闪电箭---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188196)
			--闪电箭 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=10
			--漩涡武器层数>=10
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","闪电箭",zhandoumoshi) --显示指定色块窗体
				return
			end
			--闪电箭---------------------------------------------------------------------------------------------------------------
	
			--霜刃打击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(342240)
			--霜刃打击 已学习
			and
			WR_GetSpellCD("霜刃打击")<=GCD
			--技能冷却
			and
			IsSpellInRange("霜刃打击","target")==1
			--单位在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF4","霜刃打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--霜刃打击---------------------------------------------------------------------------------------------------------------
	
			--冰霜震击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(196840)
			--冰霜震击 已学习
			and
			WR_GetSpellCD("冰霜震击")<=GCD
			--技能冷却
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BB_BuffCount>=5
			--冰雹BUFF>=5
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF11","冰霜震击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--冰霜震击---------------------------------------------------------------------------------------------------------------
	
			--熔岩猛击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(60103)
			--熔岩猛击 已学习
			and
			IsPlayerSpell(334033)
			--熔火突袭 已学习
			and
			IsSpellInRange("熔岩猛击","target")==1
			--单位在技能范围内
			and
			WR_GetSpellCD("熔岩猛击")<=GCD
			--技能冷却
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF6","熔岩猛击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--熔岩猛击---------------------------------------------------------------------------------------------------------------
	
			--风暴打击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(17364)
			--风暴打击 已学习
			and
			WR_GetSpellCD("风暴打击")<=GCD
			--技能冷却
			and
			IsSpellInRange("根源打击","target")==1
			--单位在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF8","风暴打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风暴打击---------------------------------------------------------------------------------------------------------------
	
			--闪电箭5---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188196)
			--闪电箭 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=5
			--漩涡武器层数>=5
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","闪电箭5",zhandoumoshi) --显示指定色块窗体
				return
			end
			--闪电箭5---------------------------------------------------------------------------------------------------------------
	
			--毁灭闪电---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(187874)
			--毁灭闪电 已学习
			and
			WR_GetSpellCD("毁灭闪电")<=GCD
			--技能冷却
			and
			IsSpellInRange("熔岩猛击","target")==1
			--目标在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSI","毁灭闪电",zhandoumoshi) --显示指定色块窗体
				return
			end
			--毁灭闪电---------------------------------------------------------------------------------------------------------------
			
			--火震填充---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188389)
			--烈焰震击 已学习
			and
			GCD==0
			--公共冷却==0
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			WR_GetSpellCD("烈焰震击")<=GCD
			--技能冷却
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF5","火震填充",zhandoumoshi) --显示指定色块窗体
				return
			end
			--火震填充---------------------------------------------------------------------------------------------------------------
			
			--风怒填充---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(8512)
			--风怒图腾 已学习
			and
			GCD==0
			--公共冷却==0
			and
			WR_GetSpellCD("风怒图腾")<=GCD
			--技能冷却
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF7","风怒填充",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风怒填充---------------------------------------------------------------------------------------------------------------
		end
	----单体循环----------------------------------------------------------------------------------------------------------------------------
	
	
	----AOE循环----------------------------------------------------------------------------------------------------------------------------
		if HUCountRange7>1 then
		--7码内单位>1
			--熔岩猛击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(60103)
			--熔岩猛击 已学习
			and
			IsPlayerSpell(334033)
			--熔火突袭 已学习
			and
			IsSpellInRange("熔岩猛击","target")==1
			--单位在技能范围内
			and
			WR_GetSpellCD("熔岩猛击")<=GCD
			--技能冷却
			and
			TargetDebuffTime_LYZJ>0
			--目标有烈焰震击Debuff
			and
			NoLYZJCountRange7>=1
			--7码内没有中烈焰震击的敌人数量>=1
			and
			LYZJCountRange7<6
			--并且中烈焰震击的单位数量<6
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF6","熔岩猛击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--熔岩猛击---------------------------------------------------------------------------------------------------------------
			
			--始源T---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN6","始源T",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源T---------------------------------------------------------------------------------------------------------------
	
			--始源P1---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party1target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party1target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF6","始源P1",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P1---------------------------------------------------------------------------------------------------------------
	
			--始源P2---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party2target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party2target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF7","始源P2",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P2---------------------------------------------------------------------------------------------------------------
	
			--始源P3---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party3target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party3target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF11","始源P3",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P3---------------------------------------------------------------------------------------------------------------
	
			--始源P4---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("party4target")
			--始源之潮 施法条件
			and
			WR_GetUnitBuffInfo("party4target","烈焰震击",true)==0
			--单位没有 烈焰震击 DEBUFF
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSF12","始源P4",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源P4---------------------------------------------------------------------------------------------------------------
	
			--始源之潮---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_SYZC("target")
			--始源之潮 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN6","始源之潮",zhandoumoshi) --显示指定色块窗体
				return
			end
			--始源之潮---------------------------------------------------------------------------------------------------------------
	
			--野性狼魂---------------------------------------------------------------------------------------------------------------
			if zhandoumoshi==1
			--开爆发
			and
			IsPlayerSpell(51533)
			--已学技能 野性狼魂
			and
			WR_GetSpellCD("野性狼魂")<=GCD
			--技能冷却
			and
			WR_GetUnitRange("target")<=40
			--技能距离
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF3","野性狼魂",zhandoumoshi) --显示指定色块窗体
				return
			end
			--野性狼魂---------------------------------------------------------------------------------------------------------------
	
			--烈焰震击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188389)
			--烈焰震击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			WR_GetSpellCD("烈焰震击")<=GCD
			--技能冷却
			and
			TargetDebuffTime_LYZJ==0
			--目标没有烈焰震击Debuff
			and
			LYZJCountRange7<6
			--并且中烈焰震击的单位数量<6
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF5","烈焰震击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--烈焰震击---------------------------------------------------------------------------------------------------------------
	
			--闪电箭---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188196)
			--闪电箭 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=5
			--漩涡武器层数>=5
			and
			SYZC_BuffTime>0
			--始源之潮Buff存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF7","闪电箭",zhandoumoshi) --显示指定色块窗体
				return
			end
			--闪电箭---------------------------------------------------------------------------------------------------------------
	
			--元素冲击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(117014)
			--元素冲击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=10
			--漩涡武器层数>=10
			and
			GetSpellCharges("元素冲击")>=2
			--技能次数
			and
			HUCountRange7<=3
			--7码内敌人数量
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF4","元素冲击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--元素冲击---------------------------------------------------------------------------------------------------------------
	
			--闪电链---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188443)
			--闪电链 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=10
			--漩涡武器层数>=10
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF9","闪电链",zhandoumoshi) --显示指定色块窗体
				return
			end
			--闪电链---------------------------------------------------------------------------------------------------------------
	
			--风怒图腾---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(8512)
			--风怒图腾 已学习
			and
			WR_GetSpellCD("风怒图腾")<=GCD
			--技能冷却
			and
			FNTT_BuffCount==0
			--风怒图腾 BUFF不存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF7","风怒图腾",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风怒图腾---------------------------------------------------------------------------------------------------------------
	
			--毁灭闪电---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(187874)
			--毁灭闪电 已学习
			and
			WR_GetSpellCD("毁灭闪电")<=GCD
			--技能冷却
			and
			IsSpellInRange("熔岩猛击","target")==1
			--目标在技能范围内
			and
			HMSD187878_BuffTime==0
			--毁灭闪电187878BUFF 不存在
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSI","毁灭闪电",zhandoumoshi) --显示指定色块窗体
				return
			end
			--毁灭闪电---------------------------------------------------------------------------------------------------------------
	
			--鞭笞T---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("target")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF6","鞭笞T",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞T---------------------------------------------------------------------------------------------------------------
	
			--鞭笞M---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("mouseover")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN4","鞭笞M",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞M---------------------------------------------------------------------------------------------------------------
	
			--鞭笞P1---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("party1target")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACSF9","鞭笞P1",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞P1---------------------------------------------------------------------------------------------------------------
	
			--鞭笞P2---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("party2target")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACSF10","鞭笞P2",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞P2---------------------------------------------------------------------------------------------------------------
	
			--鞭笞P3---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("party3target")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACSF12","鞭笞P3",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞P3---------------------------------------------------------------------------------------------------------------
	
			--鞭笞P4---------------------------------------------------------------------------------------------------------------
			if WR_ShamanEnhancement_BCLY("party4target")
			--鞭笞烈焰 施法条件
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN1","鞭笞P4",zhandoumoshi) --显示指定色块窗体
				return
			end
			--鞭笞P4---------------------------------------------------------------------------------------------------------------
	
			--霜刃打击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(342240)
			--霜刃打击 已学习
			and
			WR_GetSpellCD("霜刃打击")<=GCD
			--技能冷却
			and
			IsSpellInRange("霜刃打击","target")==1
			--单位在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF4","霜刃打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--霜刃打击---------------------------------------------------------------------------------------------------------------
	
			--冰霜震击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(196840)
			--冰霜震击 已学习
			and
			WR_GetSpellCD("冰霜震击")<=GCD
			--技能冷却
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BB_BuffCount>=5
			--冰雹BUFF>=5
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF11","冰霜震击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--冰霜震击---------------------------------------------------------------------------------------------------------------
	
			--风暴打击---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(17364)
			--风暴打击 已学习
			and
			WR_GetSpellCD("风暴打击")<=GCD
			--技能冷却
			and
			IsSpellInRange("根源打击","target")==1
			--单位在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF8","风暴打击",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风暴打击---------------------------------------------------------------------------------------------------------------
	
			--毁灭闪电2---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(187874)
			--毁灭闪电 已学习
			and
			WR_GetSpellCD("毁灭闪电")<=GCD
			--技能冷却
			and
			IsSpellInRange("熔岩猛击","target")==1
			--目标在技能范围内
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CSI","毁灭闪电2",zhandoumoshi) --显示指定色块窗体
				return
			end
			--毁灭闪电2---------------------------------------------------------------------------------------------------------------
			
			--元素冲击5---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(117014)
			--元素冲击 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=5
			--漩涡武器层数>=5
			and
			GetSpellCharges("元素冲击")>=1
			--技能次数
			and
			HUCountRange7<=3
			--30码内敌人数量
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF4","元素冲击5",zhandoumoshi) --显示指定色块窗体
				return
			end
			--元素冲击5---------------------------------------------------------------------------------------------------------------
	
			--闪电链5---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188443)
			--闪电链 已学习
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			BuffCount_XWWQ>=5
			--漩涡武器层数>=5
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF9","闪电链5",zhandoumoshi) --显示指定色块窗体
				return
			end
			--闪电链5---------------------------------------------------------------------------------------------------------------
	
			--火震填充---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(188389)
			--烈焰震击 已学习
			and
			GCD==0
			--公共冷却==0
			and
			WR_GetUnitRange("target")<=40
			--单位在技能范围内
			and
			WR_GetSpellCD("烈焰震击")<=GCD
			--技能冷却
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("CF5","火震填充",zhandoumoshi) --显示指定色块窗体
				return
			end
			--火震填充---------------------------------------------------------------------------------------------------------------
	
			--风怒填充---------------------------------------------------------------------------------------------------------------
			if IsPlayerSpell(8512)
			--风怒图腾 已学习
			and
			GCD==0
			--公共冷却==0
			and
			WR_GetSpellCD("风怒图腾")<=GCD
			--技能冷却
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ASF7","风怒填充",zhandoumoshi) --显示指定色块窗体
				return
			end
			--风怒填充---------------------------------------------------------------------------------------------------------------
		end
	----AOE循环----------------------------------------------------------------------------------------------------------------------------
	end
----目标战斗检测-------------------------------------------------------------
	
	--幽魂之狼---------------------------------------------------------------------------------------------------------------
	if WRSet.ZQ_YHZL==1
	--幽魂之狼 开启
	and
	IsPlayerSpell(2645)
	--幽魂之狼 已学习
	and
	WR_GetUnitRange("target")>30
	--目标超过30码
	and
	HUCountRange30==0
	--30码内没有敌人
	and
	WR_GetUnitBuffInfo("player","幽魂之狼")==0
	--幽魂之狼 BUFF不存在
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF2","幽魂之狼",zhandoumoshi) --显示指定色块窗体
		return
	end
	--幽魂之狼---------------------------------------------------------------------------------------------------------------
--]]