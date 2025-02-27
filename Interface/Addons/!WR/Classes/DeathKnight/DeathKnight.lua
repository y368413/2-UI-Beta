--作者微信:WOW-Robot(转载请保留,感谢!)

--DK
function WR_DeathKnight()
	WR_DeathKnightSettings() --初始化储存值
	WR_DeathKnightConfigFrame()	--创建的设置窗口
	WR_DeathKnightSettingsSave() --设置写入
	WR_DeathKnightFrameShowOrHide()	--对应专精显示或隐藏
	WR_DeathKnightFrost() --冰DK运行库
	--WR_DeathKnightUnholy() --邪DK运行库
	WR_DeathKnightBlood() --血DK运行库
end

--初始化储存值
function WR_DeathKnightSettings()
	if WRSet==nil then
		local Settings = {
			BS_ZNJD=9,	--智能焦点
			BS_BSJL=2,	--冰霜巨龙
			BS_SP=4,	--饰品
			BS_WYZQ=5,	--巫妖之躯
			BS_BFZR=4,	--冰封之韧
			BS_LJDJ=5,	--灵界打击
			BS_ZLS=3,	--治疗石
			BS_ZLYS=2,	--治疗药水
			XX_SP1=13,	--饰品1
			XX_SP2=13,	--饰品2
			
			XE_BFYS=2,	--爆发药水
			XE_SP=4,	--饰品
			XE_WYZQ=5,	--巫妖之躯
			XE_BFZR=4,	--冰封之韧
			XE_LJDJ=5,	--灵界打击
			XE_ZLS=3,	--治疗石
			XE_ZLYS=2,	--治疗药水
			
			XX_ZNJD=9,	--智能焦点
			XX_SP=4,	--饰品
			XX_ZLS=3,	--治疗石
			XX_ZLYS=2,	--治疗药水
			XX_SP1=13,	--饰品1
			XX_SP2=13,	--饰品2
		}
		WRSet=Settings
	end
end

--设置写入
function WR_DeathKnightSettingsSave()
	if WRSet~=nil then
		WRSet.BS_ZNMB=UIDropDownMenu_GetSelectedID(BS_ZNMB_Dropdown) --智能目标
		WRSet.BS_ZNJD=UIDropDownMenu_GetSelectedID(BS_ZNJD_Dropdown) --智能焦点
		WRSet.BS_BSJL=UIDropDownMenu_GetSelectedID(BS_BSJL_Dropdown) --冰霜巨龙
		WRSet.BS_XLBD=UIDropDownMenu_GetSelectedID(BS_XLBD_Dropdown) --心灵冰冻
		WRSet.BS_DDMS=UIDropDownMenu_GetSelectedID(BS_DDMS_Dropdown) --打断模式
		WRSet.BS_ZMBY=UIDropDownMenu_GetSelectedID(BS_ZMBY_Dropdown) --致盲冰雨
		WRSet.BS_ZX=UIDropDownMenu_GetSelectedID(BS_ZX_Dropdown) --窒息
		--WRSet.BS_FWWQ=UIDropDownMenu_GetSelectedID(BS_FWWQ_Dropdown) --符文武器
		WRSet.BS_ZEFZ=UIDropDownMenu_GetSelectedID(BS_ZEFZ_Dropdown) --憎恶附肢
		WRSet.BS_KWDL=UIDropDownMenu_GetSelectedID(BS_KWDL_Dropdown) --枯萎凋零
		WRSet.BS_FMFHZ=UIDropDownMenu_GetSelectedID(BS_FMFHZ_Dropdown) --反魔法护罩
		WRSet.BS_FHMY=UIDropDownMenu_GetSelectedID(BS_FHMY_Dropdown) --复活盟友
		WRSet.BS_WYZQ=UIDropDownMenu_GetSelectedID(BS_WYZQ_Dropdown) --巫妖之躯
		WRSet.BS_BFZR=UIDropDownMenu_GetSelectedID(BS_BFZR_Dropdown) --冰封之韧
		WRSet.BS_LJDJ=UIDropDownMenu_GetSelectedID(BS_LJDJ_Dropdown) --灵界打击
		WRSet.BS_ZLS=UIDropDownMenu_GetSelectedID(BS_ZLS_Dropdown) --治疗石
		WRSet.BS_ZLYS=UIDropDownMenu_GetSelectedID(BS_ZLYS_Dropdown) --治疗药水
		WRSet.BS_SP1=UIDropDownMenu_GetSelectedID(BS_SP1_Dropdown) --饰品1
		WRSet.BS_SP2=UIDropDownMenu_GetSelectedID(BS_SP2_Dropdown) --饰品2
		WRSet.BS_SFSD=UIDropDownMenu_GetSelectedID(BS_SFSD_Dropdown) --施法速度
		WRSet.BS_FWWQ=BS_FWWQ_Checkbox:GetChecked()	--符文武器
		WRSet.BS_BLTX=BS_BLTX_Checkbox:GetChecked()	--冰龙吐息
		
		WRSet.XE_ZNMB=UIDropDownMenu_GetSelectedID(XE_ZNMB_Dropdown) --智能目标
		WRSet.XE_XLBD=UIDropDownMenu_GetSelectedID(XE_XLBD_Dropdown) --心灵冰冻
		WRSet.XE_DDMS=UIDropDownMenu_GetSelectedID(XE_DDMS_Dropdown) --打断模式
		WRSet.XE_ZMBY=UIDropDownMenu_GetSelectedID(XE_ZMBY_Dropdown) --致盲冰雨
		WRSet.XE_ZX=UIDropDownMenu_GetSelectedID(XE_ZX_Dropdown) --窒息
		WRSet.XE_WZDJ=UIDropDownMenu_GetSelectedID(XE_WZDJ_Dropdown) --亡者大军
		WRSet.XE_ZEFZ=UIDropDownMenu_GetSelectedID(XE_ZEFZ_Dropdown) --憎恶附肢
		WRSet.XE_FMFHZ=UIDropDownMenu_GetSelectedID(XE_FMFHZ_Dropdown) --反魔法护罩
		WRSet.XE_FHMY=UIDropDownMenu_GetSelectedID(XE_FHMY_Dropdown) --复活盟友
		WRSet.XE_WYZQ=UIDropDownMenu_GetSelectedID(XE_WYZQ_Dropdown) --巫妖之躯
		WRSet.XE_BFZR=UIDropDownMenu_GetSelectedID(XE_BFZR_Dropdown) --冰封之韧
		WRSet.XE_LJDJ=UIDropDownMenu_GetSelectedID(XE_LJDJ_Dropdown) --灵界打击
		WRSet.XE_ZLS=UIDropDownMenu_GetSelectedID(XE_ZLS_Dropdown) --治疗石
		WRSet.XE_ZLYS=UIDropDownMenu_GetSelectedID(XE_ZLYS_Dropdown) --治疗药水
		
		WRSet.XX_ZNMB=UIDropDownMenu_GetSelectedID(XX_ZNMB_Dropdown) --智能目标
		WRSet.XX_ZNJD=UIDropDownMenu_GetSelectedID(XX_ZNJD_Dropdown) --智能焦点
		WRSet.XX_XLBD=UIDropDownMenu_GetSelectedID(XX_XLBD_Dropdown) --心灵冰冻
		WRSet.XX_DDMS=UIDropDownMenu_GetSelectedID(XX_DDMS_Dropdown) --打断模式
		WRSet.XX_ZMBY=UIDropDownMenu_GetSelectedID(XX_ZMBY_Dropdown) --致盲冰雨
		WRSet.XX_ZX=UIDropDownMenu_GetSelectedID(XX_ZX_Dropdown) --窒息
		--WRSet.XX_ZEFZ=UIDropDownMenu_GetSelectedID(XX_ZEFZ_Dropdown) --憎恶附肢
		WRSet.XX_FMFHZ=UIDropDownMenu_GetSelectedID(XX_FMFHZ_Dropdown) --反魔法护罩
		WRSet.XX_FHMY=UIDropDownMenu_GetSelectedID(XX_FHMY_Dropdown) --复活盟友
		WRSet.XX_XXGZX=UIDropDownMenu_GetSelectedID(XX_XXGZX_Dropdown) --吸血鬼之血
		WRSet.XX_WYZQ=UIDropDownMenu_GetSelectedID(XX_WYZQ_Dropdown) --巫妖之躯
		WRSet.XX_BFZR=UIDropDownMenu_GetSelectedID(XX_BFZR_Dropdown) --冰封之韧
		WRSet.XX_ZLS=UIDropDownMenu_GetSelectedID(XX_ZLS_Dropdown) --治疗石
		WRSet.XX_ZLYS=UIDropDownMenu_GetSelectedID(XX_ZLYS_Dropdown) --治疗药水
		WRSet.XX_SP1=UIDropDownMenu_GetSelectedID(XX_SP1_Dropdown) --饰品1
		WRSet.XX_SP2=UIDropDownMenu_GetSelectedID(XX_SP2_Dropdown) --饰品2
		WRSet.XX_SFSD=UIDropDownMenu_GetSelectedID(XX_SFSD_Dropdown) --施法速度
		WRSet.XX_NotADD=XX_NotADD_Checkbox:GetChecked()	--防ADD
		WRSet.XX_QZJS=XX_QZJS_Checkbox:GetChecked()	--前置减伤
	end
	
	if GetSpecialization()==2 then	--冰专精
		if WRSet.BS_DDMS~=nil then
			InterruptTime=(WRSet.BS_DDMS-1)/10
		end
	end
	
	if GetSpecialization()==3 then	--邪专精
		if WRSet.XE_DDMS~=nil then
			InterruptTime=(WRSet.XE_DDMS-1)/10
		end
	end
	
	if GetSpecialization()==1 then	--鲜血专精
		if WRSet.XX_DDMS~=nil then
			InterruptTime=(WRSet.XX_DDMS-1)/10
		end
	end
	
end

--对应专精显示或隐藏
function WR_DeathKnightFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--鲜血专精
		BS_Frame:Hide()
		XE_Frame:Hide()
		XX_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+16*35)
	end
	if GetSpecialization()==2 then	--冰霜专精
		BS_Frame:Show()
		XE_Frame:Hide()
		XX_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+18*35)
	end
	if GetSpecialization()==3 then	--邪恶专精
		BS_Frame:Hide()
		XE_Frame:Show()
		XX_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+16*35)
	end
end

--施法过程 治疗石
function WR_DeathKnight_Function_ZLS()
	local Temp_ZLS
	if GetSpecialization()==1 then	--鲜血专精
		Temp_ZLS = WRSet.XX_ZLS
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_ZLS = WRSet.BS_ZLS
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_ZLS = WRSet.XE_ZLS
	end
	
	if Temp_ZLS~=5 --治疗石选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLS/10 --血量比例<治疗石设定值/10
	and WR_Use_ZLS() then --治疗石 可用
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--施法过程 治疗药水
function WR_DeathKnight_Function_ZLYS()
	local Temp_ZLYS
	if GetSpecialization()==1 then	--鲜血专精
		Temp_ZLYS = WRSet.XX_ZLYS
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_ZLYS = WRSet.BS_ZLYS
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_ZLYS = WRSet.XE_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then --治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--施法过程 反魔法护罩
function WR_DeathKnight_Function_FMFHZ()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	local Temp_FMFHZ
	if GetSpecialization()==1 then	--鲜血专精
		Temp_FMFHZ = WRSet.XX_FMFHZ
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_FMFHZ = WRSet.BS_FMFHZ
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_FMFHZ = WRSet.XE_FMFHZ
	end
	
	if Temp_FMFHZ==1 --反魔法护罩 开启
	and WR_SpellUsable("反魔法护罩") --技能可用 资源可用
	and IsPlayerSpell(48707) --已学天赋[反魔法护罩]
	and WR_SpellReflection(0.6) --对我的施法<=0.6秒
	then
		if WR_ColorFrame_Show("CF4","反魔法护罩") then return true end
	end
	return false
end

--心灵冰冻
function WR_DeathKnight_XLBD(Unit)
	if WR_GetUnitRange(Unit)<=15 --单位距离<=15
	and UnitCanAttack("player",Unit) --单位是敌对
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_DeathKnight_XLBD_Important) --单位有需要打断的法术
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF5","心冻T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSF5","心冻M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSF6","心冻F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN1","心冻P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN2","心冻P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN3","心冻P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN4","心冻P4T") then return true end
		end
	end
	return false
end

--施法过程 心灵冰冻
function WR_DeathKnight_Function_ZN()
	if not WR_SpellUsable("心灵冰冻") then return false end
	
	local Temp_XLBD=9
	if GetSpecialization()==1 then	--鲜血专精
		Temp_XLBD = WRSet.XX_XLBD
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_XLBD = WRSet.BS_XLBD
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_XLBD = WRSet.XE_XLBD
	end

	if Temp_XLBD<=4 then
		WR_DeathKnight_XLBD_Important = false
	else
		WR_DeathKnight_XLBD_Important = true
	end

	if Temp_XLBD==9 then	--禁用
		return false
	elseif (Temp_XLBD==1 or Temp_XLBD==5)	--智能
	or
	(
		(Temp_XLBD==4 or Temp_XLBD==8)	--焦点
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
		if WR_DeathKnight_XLBD("focus") then return true end	--焦点
		if WR_DeathKnight_XLBD("target") then return true end	--目标
		if WR_DeathKnight_XLBD("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_DeathKnight_XLBD("party"..i.."target") then return true end
		end
	elseif (Temp_XLBD==2 or Temp_XLBD==6) then	--目标
		if WR_DeathKnight_XLBD("target") then return true end
	elseif (Temp_XLBD==3 or Temp_XLBD==7) then	--指向
		if WR_DeathKnight_XLBD("mouseover") then return true end
	elseif (Temp_XLBD==4 or Temp_XLBD==8) then	--焦点
		if WR_DeathKnight_XLBD("focus") then return true end
	end
	return false
end

--施法过程 复活盟友
function WR_DeathKnight_Function_FHMY()
	local Temp_FHMY
	if GetSpecialization()==1 then	--鲜血专精
		Temp_FHMY = WRSet.XX_FHMY
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_FHMY = WRSet.BS_FHMY
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_FHMY = WRSet.XE_FHMY
	end
	
	if Temp_FHMY==1	--复活盟友 开启
	and WR_SpellUsable("复活盟友") --技能可用 资源可用
	and TargetRange<=40 --目标距离
	and UnitIsDead("mouseover") --单位死亡
	and UnitIsFriend("mouseover","player") --单位是友善的
	and UnitIsPlayer("mouseover") --单位是玩家
	then
		if WR_ColorFrame_Show("CF6","复活盟友M") then return true end
	end
	return false
end

--施法过程 致盲冰雨
function WR_DeathKnight_Function_ZMBY()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	local Temp_ZMBY
	if GetSpecialization()==1 then	--鲜血专精
		Temp_ZMBY = WRSet.XX_ZMBY
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_ZMBY = WRSet.BS_ZMBY
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_ZMBY = WRSet.XE_ZMBY
	end
	
	if GCD<=ShiFaSuDu
	and Temp_ZMBY==1 --致盲冰雨 开启
	and IsPlayerSpell(207167)	--已学 致盲冰雨
	and WR_SpellUsable("致盲冰雨") --技能可用 资源可用
	and WR_StunUnit(8,2) --范围内有需要控制的单位
	then
		if WR_ColorFrame_Show("CF7","致盲冰雨") then return true end
	end
	return false
end

--窒息
function WR_DeathKnight_ZX(Unit)
	if WR_GetUnitRange(Unit)<=20 --目标距离
	and UnitCanAttack(Unit,"player") --单位是敌方
	and WR_StunSpell(Unit) --可以击晕单位
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("CF8","窒息T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN9","窒息M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CN0","窒息F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN5","窒息P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN6","窒息P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN7","窒息P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN8","窒息P4T") then return true end
		end
	end
	
end

--施法过程 窒息
function WR_DeathKnight_Function_ZX()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("窒息") then return false end	--技能不可用
	
	local Temp_ZX=5
	if GetSpecialization()==1 then	--鲜血专精
		Temp_ZX = WRSet.XX_ZX
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_ZX = WRSet.BS_ZX
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_ZX = WRSet.XE_ZX
	end
	
	if Temp_ZX==5 then	--禁用
		return false
	elseif Temp_ZX==1	--智能
	or
	(
		Temp_ZX==4	--焦点
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
		if WR_DeathKnight_ZX("focus") then return true end	--焦点
		if WR_DeathKnight_ZX("target") then return true end	--目标
		if WR_DeathKnight_ZX("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_DeathKnight_ZX("party"..i.."target") then return true end
		end
	elseif Temp_ZX==2 then	--目标
		if WR_DeathKnight_ZX("target") then return true end
	elseif Temp_ZX==3 then	--指向
		if WR_DeathKnight_ZX("mouseover") then return true end
	elseif Temp_ZX==4 then	--焦点
		if WR_DeathKnight_ZX("focus") then return true end
	end

	return false
end

--施法过程 控制亡灵
function WR_DeathKnight_Function_KZWL()
	if RaidOrParty=="raid" then return false end	--在团队不生效
	
	if WR_SpellUsable("控制亡灵") --技能可用 资源可用
	and WR_GetUnitRange("mouseover")<=30 --单位距离
	and UnitName("mouseover")=="虚体生物" --单位是虚体生物
	and UnitCastingInfo("mouseover")~=nil --单位在施法
	and not WR_GetPlayerMove() --单位没有移动
	and not WR_StopCast(WR_GetTrueCastTime(1.4)) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("CSP","控制亡灵M") then return true end
	end
	return false
end

--施法过程 智能目标
function WR_DeathKnight_Function_ZNMB()
	local Temp_ZNMB=3
	if GetSpecialization()==1 then	--鲜血专精
		Temp_ZNMB = WRSet.XX_ZNMB
	elseif GetSpecialization()==2 then	--冰霜专精
		Temp_ZNMB = WRSet.BS_ZNMB
	elseif GetSpecialization()==3 then	--邪恶专精
		Temp_ZNMB = WRSet.XE_ZNMB
	end
	
	if WR_Function_ZNMB(2,Temp_ZNMB) then return true end	--智能目标
	return false
end

--战斗错误事件
function WR_DeathKnight_ErrorMessage()
	if WR_ErrorMessageInfo~=true then --只执行一次
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("UI_ERROR_MESSAGE")
		frame:SetScript("OnEvent", function(self, event, messageType, message)
			if string.find(message, "不能在这里使用。") then
				ErrorMessageTime_CantHere=GetTime()
				return
			end
		end)
		WR_ErrorMessageInfo=true --只执行一次，记录已经执行
	end
end