--作者微信:WOW-Robot(转载请保留,感谢!)

--战士
function WR_Warrior()
	WR_WarriorSettings() --初始化储存值
	WR_WarriorConfigFrame()	--创建的设置窗口
	WR_WarriorSettingsSave() --设置写入
	WR_WarriorFrameShowOrHide()	--对应专精显示或隐藏
	WR_WarriorFury() --狂暴战运行库
	WR_WarriorProtection()	--防战运行库
	--WR_WarriorArms()	--武器战运行库
end

--初始化储存值
function WR_WarriorSettings()
	if WRSet==nil then
		local Settings = {
			KBZ_ZNJD=9,	--智能焦点
			KBZ_QJ=1,	--拳击
			KBZ_DDMS=1,	--打断模式
			KBZ_FSFS=1,	--法术反射
			KBZ_ZDB=1,	--震荡波
			KBZ_PDNH=1,	--破胆怒吼
			KBZ_FBZC=1,	--风暴之锤
			KBZ_ZT=1,	--姿态
			KBZ_BFYS=2,	--爆发药水
			KBZ_SLZW=5,	--胜利在望
			KBZ_KNHF=4,	--狂怒回复
			KBZ_KTMY=2,	--苦痛免疫
			KBZ_JJNH=4,	--集结呐喊
			KBZ_ZLS=3,	--治疗石
			KBZ_ZLYS=2,	--治疗药水
			KBZ_SP1=13,	--饰品1
			KBZ_SP2=13,	--饰品2
			
			FZ_ZNJD=9,	--智能焦点
			FZ_DQ=5,	--盾墙
			FZ_PFCZ=3,	--破釜沉舟
			FZ_JJNH=2,	--集结呐喊
			FZ_ZLS=3,	--治疗石
			FZ_ZLYS=2,	--治疗药水
			FZ_SP1=13,	--饰品1
			FZ_SP2=13,	--饰品2
			
			WQZ_SP=4,	--饰品
			WQZ_BFYS=2,	--爆发药水
			WQZ_SLZW=5,	--胜利在望
			WQZ_JZRZ=3,	--剑在人在
			WQZ_KTMY=2,	--苦痛免疫
			WQZ_JJNH=4,	--集结呐喊
			WQZ_ZLS=3,	--治疗石
			WQZ_ZLYS=2,	--治疗药水
		}
		WRSet=Settings
	end
end

--设置写入
function WR_WarriorSettingsSave()
	if WRSet~=nil then
		WRSet.KBZ_ZNMB=UIDropDownMenu_GetSelectedID(KBZ_ZNMB_Dropdown) --智能目标
		WRSet.KBZ_ZNJD=UIDropDownMenu_GetSelectedID(KBZ_ZNJD_Dropdown) --智能焦点
		WRSet.KBZ_QJ=UIDropDownMenu_GetSelectedID(KBZ_QJ_Dropdown) --拳击
		WRSet.KBZ_DDMS=UIDropDownMenu_GetSelectedID(KBZ_DDMS_Dropdown) --打断模式
		WRSet.KBZ_FSFS=UIDropDownMenu_GetSelectedID(KBZ_FSFS_Dropdown) --法术反射
		WRSet.KBZ_ZDB=UIDropDownMenu_GetSelectedID(KBZ_ZDB_Dropdown) --震荡波
		WRSet.KBZ_PDNH=UIDropDownMenu_GetSelectedID(KBZ_PDNH_Dropdown) --破胆怒吼
		WRSet.KBZ_FBZC=UIDropDownMenu_GetSelectedID(KBZ_FBZC_Dropdown) --风暴之锤
		WRSet.KBZ_ZT=UIDropDownMenu_GetSelectedID(KBZ_ZT_Dropdown) --姿态
		--WRSet.KBZ_BFYS=UIDropDownMenu_GetSelectedID(KBZ_BFYS_Dropdown) --爆发药水
		WRSet.KBZ_SLZW=UIDropDownMenu_GetSelectedID(KBZ_SLZW_Dropdown) --胜利在望
		WRSet.KBZ_KNHF=UIDropDownMenu_GetSelectedID(KBZ_KNHF_Dropdown) --狂怒回复
		--WRSet.KBZ_KTMY=UIDropDownMenu_GetSelectedID(KBZ_KTMY_Dropdown) --苦痛免疫
		WRSet.KBZ_JJNH=UIDropDownMenu_GetSelectedID(KBZ_JJNH_Dropdown) --集结呐喊
		WRSet.KBZ_ZLS=UIDropDownMenu_GetSelectedID(KBZ_ZLS_Dropdown) --治疗石
		WRSet.KBZ_ZLYS=UIDropDownMenu_GetSelectedID(KBZ_ZLYS_Dropdown) --治疗药水
		WRSet.KBZ_SP1=UIDropDownMenu_GetSelectedID(KBZ_SP1_Dropdown) --饰品1
		WRSet.KBZ_SP2=UIDropDownMenu_GetSelectedID(KBZ_SP2_Dropdown) --饰品2
		WRSet.KBZ_SFSD=UIDropDownMenu_GetSelectedID(KBZ_SFSD_Dropdown) --施法速度
		
		WRSet.FZ_ZNMB=UIDropDownMenu_GetSelectedID(FZ_ZNMB_Dropdown) --智能目标
		WRSet.FZ_ZNJD=UIDropDownMenu_GetSelectedID(FZ_ZNJD_Dropdown) --智能焦点
		WRSet.FZ_QJ=UIDropDownMenu_GetSelectedID(FZ_QJ_Dropdown) --拳击
		WRSet.FZ_DDMS=UIDropDownMenu_GetSelectedID(FZ_DDMS_Dropdown) --打断模式
		WRSet.FZ_FSFS=UIDropDownMenu_GetSelectedID(FZ_FSFS_Dropdown) --法术反射
		WRSet.FZ_ZDB=UIDropDownMenu_GetSelectedID(FZ_ZDB_Dropdown) --震荡波
		WRSet.FZ_PDNH=UIDropDownMenu_GetSelectedID(FZ_PDNH_Dropdown) --破胆怒吼
		WRSet.FZ_FBZC=UIDropDownMenu_GetSelectedID(FZ_FBZC_Dropdown) --风暴之锤
		WRSet.FZ_DPCF=UIDropDownMenu_GetSelectedID(FZ_DPCF_Dropdown) --盾牌冲锋
		WRSet.FZ_TSXF=UIDropDownMenu_GetSelectedID(FZ_TSXF_Dropdown) --天神下凡
		WRSet.FZ_DQ=UIDropDownMenu_GetSelectedID(FZ_DQ_Dropdown) --盾墙
		WRSet.FZ_PFCZ=UIDropDownMenu_GetSelectedID(FZ_PFCZ_Dropdown) --破釜沉舟
		WRSet.FZ_JJNH=UIDropDownMenu_GetSelectedID(FZ_JJNH_Dropdown) --集结呐喊
		WRSet.FZ_ZLS=UIDropDownMenu_GetSelectedID(FZ_ZLS_Dropdown) --治疗石
		WRSet.FZ_ZLYS=UIDropDownMenu_GetSelectedID(FZ_ZLYS_Dropdown) --治疗药水
		WRSet.FZ_SP1=UIDropDownMenu_GetSelectedID(FZ_SP1_Dropdown) --饰品1
		WRSet.FZ_SP2=UIDropDownMenu_GetSelectedID(FZ_SP2_Dropdown) --饰品2
		WRSet.FZ_SFSD=UIDropDownMenu_GetSelectedID(FZ_SFSD_Dropdown) --施法速度
		WRSet.FZ_NotADD=FZ_NotADD_Checkbox:GetChecked()	--防ADD
		
		WRSet.WQZ_ZNMB=UIDropDownMenu_GetSelectedID(WQZ_ZNMB_Dropdown) --智能目标
		WRSet.WQZ_QJ=UIDropDownMenu_GetSelectedID(WQZ_QJ_Dropdown) --拳击
		WRSet.WQZ_DDMS=UIDropDownMenu_GetSelectedID(WQZ_DDMS_Dropdown) --打断模式
		WRSet.WQZ_FSFS=UIDropDownMenu_GetSelectedID(WQZ_FSFS_Dropdown) --法术反射
		WRSet.WQZ_PDNH=UIDropDownMenu_GetSelectedID(WQZ_PDNH_Dropdown) --破胆怒吼
		WRSet.WQZ_FBZC=UIDropDownMenu_GetSelectedID(WQZ_FBZC_Dropdown) --风暴之锤
		WRSet.WQZ_FYZT=UIDropDownMenu_GetSelectedID(WQZ_FYZT_Dropdown) --防御姿态
		WRSet.WQZ_WSKT=UIDropDownMenu_GetSelectedID(WQZ_WSKT_Dropdown) --无视苦痛
		WRSet.WQZ_SP=UIDropDownMenu_GetSelectedID(WQZ_SP_Dropdown) --饰品
		WRSet.WQZ_BFYS=UIDropDownMenu_GetSelectedID(WQZ_BFYS_Dropdown) --爆发药水
		WRSet.WQZ_SLZW=UIDropDownMenu_GetSelectedID(WQZ_SLZW_Dropdown) --胜利在望
		WRSet.WQZ_JZRZ=UIDropDownMenu_GetSelectedID(WQZ_JZRZ_Dropdown) --剑在人在
		WRSet.WQZ_KTMY=UIDropDownMenu_GetSelectedID(WQZ_KTMY_Dropdown) --苦痛免疫
		WRSet.WQZ_JJNH=UIDropDownMenu_GetSelectedID(WQZ_JJNH_Dropdown) --集结呐喊
		WRSet.WQZ_ZLS=UIDropDownMenu_GetSelectedID(WQZ_ZLS_Dropdown) --治疗石
		WRSet.WQZ_ZLYS=UIDropDownMenu_GetSelectedID(WQZ_ZLYS_Dropdown) --治疗药水
	end
	if GetSpecialization()==2 then	--狂怒专精
		if WRSet.KBZ_DDMS~=nil then
			InterruptTime=(WRSet.KBZ_DDMS-1)/10
		end
	end
	if GetSpecialization()==3 then	--狂怒专精
		if WRSet.FZ_DDMS~=nil then
			InterruptTime=(WRSet.FZ_DDMS-1)/10
		end
	end
	if GetSpecialization()==1 then	--武器专精
		if WRSet.WQZ_DDMS~=nil then
			InterruptTime=(WRSet.WQZ_DDMS-1)/10
		end
	end
end

--对应专精显示或隐藏
function WR_WarriorFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--武器专精
		KBZ_Frame:Hide()
		FZ_Frame:Hide()
		WQZ_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+16*35)
	end
	if GetSpecialization()==2 then	--狂怒专精
		KBZ_Frame:Show()
		FZ_Frame:Hide()
		WQZ_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+15*35)
	end
	if GetSpecialization()==3 then	--防护专精
		KBZ_Frame:Hide()
		FZ_Frame:Show()
		WQZ_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+17*35)
	end
end

--集结呐喊
function WR_Warrior_JJNH()
	local Temp_JJNH=4
	if GetSpecialization()==1 then	--武器战
		Temp_JJNH = WRSet.WQZ_JJNH
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_JJNH = WRSet.KBZ_JJNH
	elseif GetSpecialization()==3 then	--防战
		Temp_JJNH = WRSet.FZ_JJNH
	end
	
	if Temp_JJNH~=4 --集结呐喊 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and PlayerHP<=Temp_JJNH/10 --血量<=设定值
	and WR_SpellUsable("集结呐喊") --技能可用
	then
		if WR_ColorFrame_Show("SF3","集结呐喊") then return true end
	end
	
	return false
end

--治疗石
function WR_Warrior_ZLS()
	local Temp_ZLS=5
	if GetSpecialization()==1 then	--武器战
		Temp_ZLS = WRSet.WQZ_ZLS
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_ZLS = WRSet.KBZ_ZLS
	elseif GetSpecialization()==3 then	--防战
		Temp_ZLS = WRSet.FZ_ZLS
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
function WR_Warrior_ZLYS()
	local Temp_ZLYS=5
	if GetSpecialization()==1 then	--武器战
		Temp_ZLYS = WRSet.WQZ_ZLYS
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_ZLYS = WRSet.KBZ_ZLYS
	elseif GetSpecialization()==3 then	--防战
		Temp_ZLYS = WRSet.FZ_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then --治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end
		
--法术反射
function WR_Warrior_FSFS()
	if RaidOrParty=="raid" then return false end	--在团队不生效

	local Temp_FSFS=5
	if GetSpecialization()==1 then	--武器战
		Temp_FSFS = WRSet.WQZ_FSFS
		Temp_Time = 0.5
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_FSFS = WRSet.KBZ_FSFS
		Temp_Time = 0.5
	elseif GetSpecialization()==3 then	--防战
		Temp_FSFS = WRSet.FZ_FSFS
		Temp_Time = 1
	end
	
	if Temp_FSFS==1 --法术反射 开启
	and WR_SpellUsable("法术反射")	--技能可用
	and WR_SpellReflection(Temp_Time) --对我的施法<=0.5秒
	then
		if WR_ColorFrame_Show("SF12","法术反射") then return true end
	end
	return false
end

--拳击
function WR_Warrior_QJ(Unit)
	if UnitCanAttack("player",Unit) --单位是敌对
	and C_Spell.IsSpellInRange("拳击",Unit)	--技能范围内
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Warrior_QJ_Important) --单位有需要打断的法术
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF8","拳击T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN5","拳击M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CN6","拳击F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN1","拳击P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN2","拳击P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN3","拳击P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN4","拳击P4T") then return true end
		end
	end
	return false
end

--施法过程 拳击
function WR_Warrior_Function_QJ()
	if not WR_SpellUsable("拳击") then return false end
	
	local Temp_QJ=9
	if GetSpecialization()==1 then	--武器战
		Temp_QJ = WRSet.WQZ_QJ
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_QJ = WRSet.KBZ_QJ
	elseif GetSpecialization()==3 then	--防战
		Temp_QJ = WRSet.FZ_QJ
	end

	if Temp_QJ<=4 then
		WR_Warrior_QJ_Important = false
	else
		WR_Warrior_QJ_Important = true
	end

	if Temp_QJ==9 then	--禁用
		return false
	elseif (Temp_QJ==1 or Temp_QJ==5)	--智能
	or
	(
		(Temp_QJ==4 or Temp_QJ==8)	--焦点
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
		if WR_Warrior_QJ("focus") then return true end	--焦点
		if WR_Warrior_QJ("target") then return true end	--目标
		if WR_Warrior_QJ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Warrior_QJ("party"..i.."target") then return true end
		end
	elseif (Temp_QJ==2 or Temp_QJ==6) then	--目标
		if WR_Warrior_QJ("target") then return true end
	elseif (Temp_QJ==3 or Temp_QJ==7) then	--指向
		if WR_Warrior_QJ("mouseover") then return true end
	elseif (Temp_QJ==4 or Temp_QJ==8) then	--焦点
		if WR_Warrior_QJ("focus") then return true end
	end
	
	return false
end

--施法过程 震荡波
function WR_Warrior_ZDB()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	local Temp_ZDB=2
	if GetSpecialization()==1 then	--武器战
		Temp_ZDB = WRSet.WQZ_ZDB
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_ZDB = WRSet.KBZ_ZDB
	elseif GetSpecialization()==3 then	--防战
		Temp_ZDB = WRSet.FZ_ZDB
	end
	
	if GCD<=ShiFaSuDu
	and Temp_ZDB==1 --震荡波 开启
	and WR_SpellUsable("震荡波") --技能可用
	and WR_StunUnit(8,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("SF7","震荡波") then return true end
	end
	return false
end

--施法过程 破胆怒吼
function WR_Warrior_PDNH()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	local Temp_PDNH=2
	if GetSpecialization()==1 then	--武器战
		Temp_PDNH = WRSet.WQZ_PDNH
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_PDNH = WRSet.KBZ_PDNH
	elseif GetSpecialization()==3 then	--防战
		Temp_PDNH = WRSet.FZ_PDNH
	end
	
	if GCD<=ShiFaSuDu
	and Temp_PDNH==1 --破胆怒吼 开启
	and WR_SpellUsable("破胆怒吼") --技能可用
	and C_Spell.IsSpellInRange("破胆怒吼","target")==1 --目标在技能范围
	and WR_StunUnit(8,2) --范围击晕施法
	then
		if WR_ColorFrame_Show("SF6","破胆怒吼") then return true end
	end
	return false
end

--施法过程 战斗怒吼
function WR_Warrior_ZDNH()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("战斗怒吼") --技能可用
	and
	(
		WR_GetUnitBuffTime("player","战斗怒吼")==0	--自己没有战斗怒吼
		or
		(
			(
				not UnitAffectingCombat("player")	--非战斗状态
				or
				GetSpecialization()==3	--当前是防战
			)
			and
			(
				WR_GetUnitBuffTime("player","战斗怒吼")<600	--战斗怒吼小于10分钟
				or
				WR_PartyNotBuff("战斗怒吼",3411) --队友没有 战斗怒吼
			)
		)
	)
	then
		if WR_ColorFrame_Show("SF5","战斗怒吼") then return true end
	end
	return false
end

--风暴之锤
function WR_Warrior_FBZC(Unit)
	if UnitCanAttack("player",Unit) --单位是敌对
	and C_Spell.IsSpellInRange("风暴之锤",Unit)	--技能范围内
	and WR_StunSpell(Unit) --击晕施法
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF4","风锤T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF5","风锤M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF6","风锤F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSF1","风锤P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSF2","风锤P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSF3","风锤P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSF4","风锤P4T") then return true end
		end
	end
	return false
end

--施法过程 风暴之锤
function WR_Warrior_Function_FBZC()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	if not WR_SpellUsable("风暴之锤") then return false end	--技能不可用
	
	local Temp_FBZC=5
	if GetSpecialization()==1 then	--武器战
		Temp_FBZC = WRSet.WQZ_FBZC
	elseif GetSpecialization()==2 then	--狂暴战
		Temp_FBZC = WRSet.KBZ_FBZC
	elseif GetSpecialization()==3 then	--防战
		Temp_FBZC = WRSet.FZ_FBZC
	end
	
	if Temp_FBZC==5 then	--禁用
		return false
	elseif Temp_FBZC==1	--智能
	or
	(
		Temp_FBZC==4	--焦点
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
		if WR_Warrior_FBZC("focus") then return true end	--焦点
		if WR_Warrior_FBZC("target") then return true end	--目标
		if WR_Warrior_FBZC("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Warrior_FBZC("party"..i.."target") then return true end
		end
	elseif Temp_FBZC==2 then	--目标
		if WR_Warrior_FBZC("target") then return true end
	elseif Temp_FBZC==3 then	--指向
		if WR_Warrior_FBZC("mouseover") then return true end
	elseif Temp_FBZC==4 then	--焦点
		if WR_Warrior_FBZC("focus") then return true end
	end
	
	return false
end

--施法过程 英勇投掷
function WR_Warrior_YYTZ()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("英勇投掷") --技能可用 资源可用
	and C_Spell.IsSpellInRange("英勇投掷","target") --目标在技能范围
	then
		if WR_ColorFrame_Show("CF3","英勇投掷") then return true end
	end
	return false
end

--施法过程 狂暴之怒
function WR_Warrior_KBZN()
	if WR_SpellUsable("狂暴之怒") --技能可用 资源可用
	and WR_GetUnitDebuffTime("player",KongJuDebuffName)>0
	then
		if WR_ColorFrame_Show("CSI","狂暴之怒") then return true end
	end
	return false
end
	
