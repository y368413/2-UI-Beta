--作者微信:WOW-Robot(转载请保留,感谢!)

--盗贼
function WR_Rogue()
	WR_RogueSettings() --初始化储存值
	WR_RogueConfigFrame()	--创建的设置窗口
	WR_RogueSettingsSave() --设置写入
	WR_RogueFrameShowOrHide()	--对应专精显示或隐藏
	--WR_RogueOutlaw() --狂徒运行库
	--WR_RogueSubtlety() --敏锐运行库
	WR_RogueAssassination()	--奇袭运行库
end

--初始化盗贼储存值
function WR_RogueSettings()
	if WRSet==nil then
		local Settings = {
			KT_ZNMB=1,	--智能目标
			KT_JT=1,	--脚踢
			KT_DDMS=1,	--打断模式
			KT_SJ=1,	--肾击
			KT_JH=1,	--嫁祸
			KT_YG=1,	--佯攻
			KT_DR=1,	--毒刃
			KT_SP=3,	--饰品
			KT_JP=2, --疾跑
			KT_SYJY=2,	--时运继延
			KT_BFYS=2, --爆发药水
			KT_ZLS=5,	--治疗石
			KT_ZLYS=2,	--治疗药水
			KT_XHZP=3,	--猩红之瓶
			KT_SFSD=1, --施法速度
			
			MR_ZNMB=1,	--智能目标
			MR_JT=1,	--脚踢
			MR_DDMS=1,	--打断模式
			MR_SJ=1,	--肾击
			MR_JH=1,	--嫁祸
			MR_YG=1,	--佯攻
			MR_DR=1,	--毒刃
			MR_SP=3,	--饰品
			MR_BFYS=2, --爆发药水
			MR_ZLS=5,	--治疗石
			MR_ZLYS=2,	--治疗药水
			MR_XHZP=3,	--猩红之瓶
		}
		WRSet=Settings
	end
end


--狂徒设置写入
function WR_RogueSettingsSave()
	if WRSet~=nil then
		WRSet.KT_ZNMB=UIDropDownMenu_GetSelectedID(KT_ZNMB_Dropdown) --智能目标
		WRSet.KT_JT=UIDropDownMenu_GetSelectedID(KT_JT_Dropdown) --脚踢
		WRSet.KT_DDMS=UIDropDownMenu_GetSelectedID(KT_DDMS_Dropdown) --打断模式
		WRSet.KT_SJ=UIDropDownMenu_GetSelectedID(KT_SJ_Dropdown) --肾击
		WRSet.KT_JH=UIDropDownMenu_GetSelectedID(KT_JH_Dropdown) --嫁祸
		WRSet.KT_YG=UIDropDownMenu_GetSelectedID(KT_YG_Dropdown) --佯攻
		WRSet.KT_DR=UIDropDownMenu_GetSelectedID(KT_DR_Dropdown) --毒刃
		WRSet.KT_SP=UIDropDownMenu_GetSelectedID(KT_SP_Dropdown) --饰品
		WRSet.KT_ZLS=UIDropDownMenu_GetSelectedID(KT_ZLS_Dropdown) --治疗石
		WRSet.KT_ZLYS=UIDropDownMenu_GetSelectedID(KT_ZLYS_Dropdown) --治疗药水
		WRSet.KT_XHZP=UIDropDownMenu_GetSelectedID(KT_XHZP_Dropdown) --猩红之瓶
		WRSet.KT_SFSD=UIDropDownMenu_GetSelectedID(KT_SFSD_Dropdown) --施法速度
		WRSet.KT_SYJY=UIDropDownMenu_GetSelectedID(KT_SYJY_Dropdown) --时运继延
		WRSet.KT_BFYS=UIDropDownMenu_GetSelectedID(KT_BFYS_Dropdown) --爆发药水
		WRSet.KT_JP=UIDropDownMenu_GetSelectedID(KT_JP_Dropdown) --疾跑
		
		WRSet.MR_ZNMB=UIDropDownMenu_GetSelectedID(MR_ZNMB_Dropdown) --智能目标
		WRSet.MR_JT=UIDropDownMenu_GetSelectedID(MR_JT_Dropdown) --脚踢
		WRSet.MR_DDMS=UIDropDownMenu_GetSelectedID(MR_DDMS_Dropdown) --打断模式
		WRSet.MR_SJ=UIDropDownMenu_GetSelectedID(MR_SJ_Dropdown) --肾击
		WRSet.MR_JH=UIDropDownMenu_GetSelectedID(MR_JH_Dropdown) --嫁祸
		WRSet.MR_YG=UIDropDownMenu_GetSelectedID(MR_YG_Dropdown) --佯攻
		WRSet.MR_DR=UIDropDownMenu_GetSelectedID(MR_DR_Dropdown) --毒刃
		WRSet.MR_SP=UIDropDownMenu_GetSelectedID(MR_SP_Dropdown) --饰品
		WRSet.MR_BFYS=UIDropDownMenu_GetSelectedID(MR_BFYS_Dropdown) --爆发药水
		WRSet.MR_ZLS=UIDropDownMenu_GetSelectedID(MR_ZLS_Dropdown) --治疗石
		WRSet.MR_ZLYS=UIDropDownMenu_GetSelectedID(MR_ZLYS_Dropdown) --治疗药水
		WRSet.MR_XHZP=UIDropDownMenu_GetSelectedID(MR_XHZP_Dropdown) --猩红之瓶
		
		WRSet.QX_ZNMB=UIDropDownMenu_GetSelectedID(QX_ZNMB_Dropdown) --智能目标
		WRSet.QX_ZNJD=UIDropDownMenu_GetSelectedID(QX_ZNJD_Dropdown) --智能焦点
		WRSet.QX_JT=UIDropDownMenu_GetSelectedID(QX_JT_Dropdown) --脚踢
		WRSet.QX_DDMS=UIDropDownMenu_GetSelectedID(QX_DDMS_Dropdown) --打断模式
		WRSet.QX_SJ=UIDropDownMenu_GetSelectedID(QX_SJ_Dropdown) --肾击
		WRSet.QX_JH=UIDropDownMenu_GetSelectedID(QX_JH_Dropdown) --嫁祸
		WRSet.QX_XS=UIDropDownMenu_GetSelectedID(QX_XS_Dropdown) --消失
		WRSet.QX_YG=UIDropDownMenu_GetSelectedID(QX_YG_Dropdown) --佯攻
		WRSet.QX_ZLS=UIDropDownMenu_GetSelectedID(QX_ZLS_Dropdown) --治疗石
		WRSet.QX_ZLYS=UIDropDownMenu_GetSelectedID(QX_ZLYS_Dropdown) --治疗药水
		WRSet.QX_XHZP=UIDropDownMenu_GetSelectedID(QX_XHZP_Dropdown) --猩红之瓶
		WRSet.QX_SP1=UIDropDownMenu_GetSelectedID(QX_SP1_Dropdown) --饰品1
		WRSet.QX_SP2=UIDropDownMenu_GetSelectedID(QX_SP2_Dropdown) --饰品2
		WRSet.QX_SFSD=UIDropDownMenu_GetSelectedID(QX_SFSD_Dropdown) --施法速度
		WRSet.QX_SWYJ=QX_SWYJ_Checkbox:GetChecked()	--死亡印记
		WRSet.QX_KSBF=QX_KSBF_Checkbox:GetChecked()	--快速爆发
	end
	if GetSpecialization()==2 then
		if WRSet.KT_DDMS~=nil then
			InterruptTime=(WRSet.KT_DDMS-1)/10
		end
		if WRSet.KT_SFSD~=nil then
			if WRSet.KT_SFSD==1 then
				ShiFaSuDu=0.15
			else
				ShiFaSuDu=WRSet.KT_SFSD/10
			end
		end
	end
	if GetSpecialization()==3 then
		if WRSet.MR_DDMS~=nil then
			InterruptTime=(WRSet.MR_DDMS-1)/10
		end
	end
	if GetSpecialization()==1 then
		if WRSet.QX_DDMS~=nil then
			InterruptTime=(WRSet.QX_DDMS-1)/10
		end
	end
end

--对应专精显示或隐藏
function WR_RogueFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--1 专精
		KT_Frame:Hide()
		MR_Frame:Hide()
		QX_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+15*35)
	end
	if GetSpecialization()==2 then	--2 专精
		KT_Frame:Show()
		MR_Frame:Hide()
		QX_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+15*35)
	end
	if GetSpecialization()==3 then	--3 专精
		KT_Frame:Hide()
		MR_Frame:Show()
		QX_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+12*35)
	end
end

--脚踢
function WR_Rogue_JiaoTi(Unit)
	if IsSpellInRange("脚踢",Unit)	--技能范围内
	and UnitCanAttack("player",Unit) --单位是敌对
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Rogue_JiaoTi_Important) --单位有需要打断的法术
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF8","脚踢T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF7","脚踢M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF8","脚踢F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSP","脚踢P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSL","脚踢P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSO","脚踢P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSK","脚踢P4T") then return true end
		end
	end
	return false
end

--施法过程 脚踢
function WR_Rogue_JiaoTi_Function()
	if not WR_SpellUsable("脚踢") then return false end
	if WR_GetInRaidOrParty()=="raid" then return false end	--在团队不生效
	if WR_GetUnitBuffTime("player","潜行")>0 then return false end--潜行
	
	local Temp_JiaoTi=5
	if GetSpecialization()==1 then	--奇袭 专精
		Temp_JiaoTi = WRSet.QX_JT
	end

	if Temp_JiaoTi<=4 then
		WR_Rogue_JiaoTi_Important = false
	else
		WR_Rogue_JiaoTi_Important = true
	end
	
	if Temp_JiaoTi==9 then	--禁用
		return false
	elseif (Temp_JiaoTi==1 or Temp_JiaoTi==5)	--智能
	or
	(
		(Temp_JiaoTi==4 or Temp_JiaoTi==8)	--焦点
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
		if WR_Rogue_JiaoTi("focus") then return true end	--焦点
		if WR_Rogue_JiaoTi("target") then return true end	--目标
		if WR_Rogue_JiaoTi("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Rogue_JiaoTi("party"..i.."target") then return true end
		end
	elseif (Temp_JiaoTi==2 or Temp_JiaoTi==6) then	--目标
		if WR_Rogue_JiaoTi("target") then return true end
	elseif (Temp_JiaoTi==3 or Temp_JiaoTi==7) then	--指向
		if WR_Rogue_JiaoTi("mouseover") then return true end
	elseif (Temp_JiaoTi==4 or Temp_JiaoTi==8) then	--焦点
		if WR_Rogue_JiaoTi("focus") then return true end
	end
	return false
end

--肾击
function WR_Rogue_ShenJi(Unit)
	if IsSpellInRange("肾击",Unit)	--技能范围内
	and UnitCanAttack(Unit,"player") --单位是敌方
	and WR_StunSpell(Unit) --可以击晕单位
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF9","肾击T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSM","肾击M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSI","肾击F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSJ","肾击P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSN","肾击P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSU","肾击P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSH","肾击P4T") then return true end
		end
	end
	return false
end

--施法过程 肾击
function WR_Rogue_ShenJi_Function()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("肾击") then return false end	--技能不可用
	if WR_GetInRaidOrParty()=="raid" then return false end	--在团队不生效
	if WR_GetUnitBuffTime("player","潜行")>0 then return false end--潜行
	
	if Energy<19+30	--能量控制
	and IsPlayerSpell(381623)	--已学 菊花茶
	then
		return false
	end
	
	local Temp_ShenJi=5
	if GetSpecialization()==1 then	--奇袭 专精
		Temp_ShenJi = WRSet.QX_SJ
	end
	
	if Temp_ShenJi==5 then	--禁用
		return false
	elseif Temp_ShenJi==1	--智能
	or
	(
		Temp_ShenJi==4	--焦点
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
		if WR_Rogue_ShenJi("focus") then return true end	--焦点
		if WR_Rogue_ShenJi("target") then return true end	--目标
		if WR_Rogue_ShenJi("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Rogue_ShenJi("party"..i.."target") then return true end
		end
	elseif Temp_ShenJi==2 then	--目标
		if WR_Rogue_ShenJi("target") then return true end
	elseif Temp_ShenJi==3 then	--指向
		if WR_Rogue_ShenJi("mouseover") then return true end
	elseif Temp_ShenJi==4 then	--焦点
		if WR_Rogue_ShenJi("focus") then return true end
	end

	return false
end

--治疗石
function WR_Rogue_ZLS()
	local Temp_ZLS=5
	if GetSpecialization()==1 then	--奇袭
		Temp_ZLS = WRSet.QX_ZLS
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
function WR_Rogue_ZLYS()
	local Temp_ZLYS=5
	if GetSpecialization()==1 then	--奇袭
		Temp_ZLYS = WRSet.QX_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then --治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end