--作者微信:WOW-Robot(转载请保留,感谢!)

--圣骑士
function WR_Paladin()
	WR_PaladinSettings() --初始化储存值
	WR_PaladinConfigFrame()	--创建的设置窗口
	WR_PaladinSettingsSave() --设置写入
	WR_PaladinFrameShowOrHide()	--对应专精显示或隐藏
	WR_PaladinRetribution() --惩戒骑运行库
	WR_PaladinHoly() --奶骑运行库
	WR_PaladinProtection()	--防骑运行库
end

--初始化储存值
function WR_PaladinSettings()
	if WRSet==nil then
		local Settings = {
			CJQ_GH=1,	--光环
			CJQ_SSFB=1,	--神圣风暴
			CJQ_ZNMB=1,	--智能目标
			CJQ_ZNJD=9,	--智能焦点
			CJQ_ZN=1,	--责难
			CJQ_DDMS=1,	--打断模式
			CJQ_DD=1,	--代祷
			CJQ_QDS=1,	--清毒术
			CJQ_ZCZC=1,	--制裁之锤
			CJQ_MMZG=1,	--盲目之光
			CJQ_XSZF=2,	--牺牲祝福
			CJQ_ZYZF=1,	--自由祝福
			--CJQ_BFYS=2,	--爆发药水
			CJQ_FCZD=1,	--复仇之盾
			CJQ_SYS=1,	--圣佑术
			CJQ_SDS=2,	--圣盾术
			CJQ_SLS=2,	--圣疗术
			CJQ_RYSL=1,	--荣耀圣令
			CJQ_ZLS=3,	--治疗石
			CJQ_ZLYS=2,	--治疗药水
			CJQ_SP1=13,	--饰品1
			CJQ_SP2=13,	--饰品2
			
			
			NQ_ZNMB=1,	--智能目标
			NQ_ZN=1,	--责难
			NQ_DDMS=1,	--打断模式
			NQ_DD=1,	--代祷
			NQ_QJS=1,	--清洁术
			NQ_ZCZC=1,	--制裁之锤
			NQ_MMZG=1,	--盲目之光
			NQ_XSZF=2,	--牺牲祝福
			NQ_ZYZF=1,	--自由祝福
			NQ_SGDB=1,	--圣光道标
			NQ_XYDB=1,	--信仰道标
			NQ_SJZF=1,	--四季祝福
			NQ_FCZN=1,	--复仇之怒
			NQ_TEDZJ=1,	--提尔的拯救
			NQ_SXZS=1,	--神性之手
			NQ_GHZW=1,	--光环掌握
			NQ_SYS=1,	--圣佑术
			NQ_SDS=2,	--圣盾术
			NQ_SLS=2,	--圣疗术
			NQ_ZLS=3,	--治疗石
			NQ_ZLYS=2,	--治疗药水
			NQ_SFSD=2, 	--施法速度
			NQ_SP1=13,	--饰品1
			NQ_SP2=13,	--饰品2

			FQ_ZNJD=9,	--智能焦点
			FQ_XSZF=3,	--牺牲祝福
			FQ_PZZF=3,	--破咒祝福
			FQ_JW=10,	--戒卫
			FQ_CRFYZ=10,	--炽热防御者
			FQ_YGLWSW=10,	--远古列王守卫
			FQ_RYSL=5,	--荣耀圣令
			FQ_SDS=3,	--圣盾术
			FQ_SLS=2,	--圣疗术
			FQ_ZLS=3,	--治疗石
			FQ_ZLYS=2,	--治疗药水
			FQ_SP1=13,	--饰品1
			FQ_SP2=13,	--饰品2
		}
		WRSet=Settings
	end
end

--设置写入
function WR_PaladinSettingsSave()
	if WRSet~=nil then
		WRSet.CJQ_GH=UIDropDownMenu_GetSelectedID(CJQ_GH_Dropdown) --光环
		WRSet.CJQ_SSFB=UIDropDownMenu_GetSelectedID(CJQ_SSFB_Dropdown) --神圣风暴
		WRSet.CJQ_ZNMB=UIDropDownMenu_GetSelectedID(CJQ_ZNMB_Dropdown) --智能目标
		WRSet.CJQ_ZNJD=UIDropDownMenu_GetSelectedID(CJQ_ZNJD_Dropdown) --智能焦点
		WRSet.CJQ_ZN=UIDropDownMenu_GetSelectedID(CJQ_ZN_Dropdown) --责难
		WRSet.CJQ_DDMS=UIDropDownMenu_GetSelectedID(CJQ_DDMS_Dropdown) --打断模式
		WRSet.CJQ_DD=UIDropDownMenu_GetSelectedID(CJQ_DD_Dropdown) --代祷
		WRSet.CJQ_QDS=UIDropDownMenu_GetSelectedID(CJQ_QDS_Dropdown) --清毒术
		WRSet.CJQ_ZCZC=UIDropDownMenu_GetSelectedID(CJQ_ZCZC_Dropdown) --制裁之锤
		WRSet.CJQ_MMZG=UIDropDownMenu_GetSelectedID(CJQ_MMZG_Dropdown) --盲目之光
		WRSet.CJQ_XSZF=UIDropDownMenu_GetSelectedID(CJQ_XSZF_Dropdown) --牺牲祝福
		WRSet.CJQ_ZYZF=UIDropDownMenu_GetSelectedID(CJQ_ZYZF_Dropdown) --自由祝福
		--WRSet.CJQ_BFYS=UIDropDownMenu_GetSelectedID(CJQ_BFYS_Dropdown) --爆发药水
		WRSet.CJQ_FCZD=UIDropDownMenu_GetSelectedID(CJQ_FCZD_Dropdown) --复仇之盾
		WRSet.CJQ_SYS=UIDropDownMenu_GetSelectedID(CJQ_SYS_Dropdown) --圣佑术
		WRSet.CJQ_SDS=UIDropDownMenu_GetSelectedID(CJQ_SDS_Dropdown) --圣盾术
		WRSet.CJQ_SLS=UIDropDownMenu_GetSelectedID(CJQ_SLS_Dropdown) --圣疗术
		WRSet.CJQ_RYSL=UIDropDownMenu_GetSelectedID(CJQ_RYSL_Dropdown) --荣耀圣令
		WRSet.CJQ_ZLS=UIDropDownMenu_GetSelectedID(CJQ_ZLS_Dropdown) --治疗石
		WRSet.CJQ_ZLYS=UIDropDownMenu_GetSelectedID(CJQ_ZLYS_Dropdown) --治疗药水
		WRSet.CJQ_SP1=UIDropDownMenu_GetSelectedID(CJQ_SP1_Dropdown) --饰品1
		WRSet.CJQ_SP2=UIDropDownMenu_GetSelectedID(CJQ_SP2_Dropdown) --饰品2
		WRSet.CJQ_SFSD=UIDropDownMenu_GetSelectedID(CJQ_SFSD_Dropdown) --施法速度
		WRSet.CJQ_SJMZ=CJQ_SJMZ_Checkbox:GetChecked()	--圣洁鸣钟
		
		
		WRSet.NQ_ZNMB=UIDropDownMenu_GetSelectedID(NQ_ZNMB_Dropdown) --智能目标
		WRSet.NQ_ZN=UIDropDownMenu_GetSelectedID(NQ_ZN_Dropdown) --责难
		WRSet.NQ_DDMS=UIDropDownMenu_GetSelectedID(NQ_DDMS_Dropdown) --打断模式
		WRSet.NQ_DD=UIDropDownMenu_GetSelectedID(NQ_DD_Dropdown) --代祷
		WRSet.NQ_QJS=UIDropDownMenu_GetSelectedID(NQ_QJS_Dropdown) --清洁术
		WRSet.NQ_ZCZC=UIDropDownMenu_GetSelectedID(NQ_ZCZC_Dropdown) --制裁之锤
		WRSet.NQ_MMZG=UIDropDownMenu_GetSelectedID(NQ_MMZG_Dropdown) --盲目之光
		WRSet.NQ_XSZF=UIDropDownMenu_GetSelectedID(NQ_XSZF_Dropdown) --牺牲祝福
		WRSet.NQ_ZYZF=UIDropDownMenu_GetSelectedID(NQ_ZYZF_Dropdown) --自由祝福
		WRSet.NQ_SGDB=UIDropDownMenu_GetSelectedID(NQ_SGDB_Dropdown) --圣光道标
		WRSet.NQ_XYDB=UIDropDownMenu_GetSelectedID(NQ_XYDB_Dropdown) --信仰道标
		--WRSet.NQ_SJZF=UIDropDownMenu_GetSelectedID(NQ_SJZF_Dropdown) --四季祝福
		WRSet.NQ_FCZN=UIDropDownMenu_GetSelectedID(NQ_FCZN_Dropdown) --复仇之怒
		--WRSet.NQ_TEDZJ=UIDropDownMenu_GetSelectedID(NQ_TEDZJ_Dropdown) --提尔的拯救
		--WRSet.NQ_SXZS=UIDropDownMenu_GetSelectedID(NQ_SXZS_Dropdown) --神性之手
		WRSet.NQ_GHZW=UIDropDownMenu_GetSelectedID(NQ_GHZW_Dropdown) --光环掌握
		WRSet.NQ_SYS=UIDropDownMenu_GetSelectedID(NQ_SYS_Dropdown) --圣佑术
		WRSet.NQ_SDS=UIDropDownMenu_GetSelectedID(NQ_SDS_Dropdown) --圣盾术
		WRSet.NQ_SLS=UIDropDownMenu_GetSelectedID(NQ_SLS_Dropdown) --圣疗术
		WRSet.NQ_ZLS=UIDropDownMenu_GetSelectedID(NQ_ZLS_Dropdown) --治疗石
		WRSet.NQ_ZLYS=UIDropDownMenu_GetSelectedID(NQ_ZLYS_Dropdown) --治疗药水
		--WRSet.NQ_FBQD=UIDropDownMenu_GetSelectedID(NQ_FBQD_Dropdown) --副本强度
		WRSet.NQ_SP1=UIDropDownMenu_GetSelectedID(NQ_SP1_Dropdown) --饰品1
		WRSet.NQ_SP2=UIDropDownMenu_GetSelectedID(NQ_SP2_Dropdown) --饰品2
		WRSet.NQ_SFSD=UIDropDownMenu_GetSelectedID(NQ_SFSD_Dropdown) --施法速度
		
		
		WRSet.FQ_ZNMB=UIDropDownMenu_GetSelectedID(FQ_ZNMB_Dropdown) --智能目标
		WRSet.FQ_ZNJD=UIDropDownMenu_GetSelectedID(FQ_ZNJD_Dropdown) --智能焦点
		WRSet.FQ_ZN=UIDropDownMenu_GetSelectedID(FQ_ZN_Dropdown) --责难
		WRSet.FQ_DDMS=UIDropDownMenu_GetSelectedID(FQ_DDMS_Dropdown) --打断模式
		WRSet.FQ_DD=UIDropDownMenu_GetSelectedID(FQ_DD_Dropdown) --代祷
		WRSet.FQ_QDS=UIDropDownMenu_GetSelectedID(FQ_QDS_Dropdown) --清毒术
		WRSet.FQ_ZCZC=UIDropDownMenu_GetSelectedID(FQ_ZCZC_Dropdown) --制裁之锤
		WRSet.FQ_MMZG=UIDropDownMenu_GetSelectedID(FQ_MMZG_Dropdown) --盲目之光
		WRSet.FQ_XSZF=UIDropDownMenu_GetSelectedID(FQ_XSZF_Dropdown) --牺牲祝福
		WRSet.FQ_ZYZF=UIDropDownMenu_GetSelectedID(FQ_ZYZF_Dropdown) --自由祝福
		WRSet.FQ_PZZF=UIDropDownMenu_GetSelectedID(FQ_PZZF_Dropdown) --破咒祝福
		WRSet.FQ_FCZZD=UIDropDownMenu_GetSelectedID(FQ_FCZZD_Dropdown) --复仇者之盾
		WRSet.FQ_GRSK=UIDropDownMenu_GetSelectedID(FQ_GRSK_Dropdown) --光荣时刻
		WRSet.FQ_TEZY=UIDropDownMenu_GetSelectedID(FQ_TEZY_Dropdown) --提尔之眼
		WRSet.FQ_SJMZ=UIDropDownMenu_GetSelectedID(FQ_SJMZ_Dropdown) --圣洁鸣钟
		WRSet.FQ_JW=UIDropDownMenu_GetSelectedID(FQ_JW_Dropdown) --戒卫
		WRSet.FQ_CRFYZ=UIDropDownMenu_GetSelectedID(FQ_CRFYZ_Dropdown) --炽热防御者
		WRSet.FQ_YGLWSW=UIDropDownMenu_GetSelectedID(FQ_YGLWSW_Dropdown) --远古列王守卫
		WRSet.FQ_RYSL=UIDropDownMenu_GetSelectedID(FQ_RYSL_Dropdown) --荣耀圣令
		WRSet.FQ_SDS=UIDropDownMenu_GetSelectedID(FQ_SDS_Dropdown) --圣盾术
		WRSet.FQ_SLS=UIDropDownMenu_GetSelectedID(FQ_SLS_Dropdown) --圣疗术
		WRSet.FQ_ZLS=UIDropDownMenu_GetSelectedID(FQ_ZLS_Dropdown) --治疗石
		WRSet.FQ_ZLYS=UIDropDownMenu_GetSelectedID(FQ_ZLYS_Dropdown) --治疗药水
		WRSet.FQ_SP1=UIDropDownMenu_GetSelectedID(FQ_SP1_Dropdown) --饰品1
		WRSet.FQ_SP2=UIDropDownMenu_GetSelectedID(FQ_SP2_Dropdown) --饰品2
		WRSet.FQ_SFSD=UIDropDownMenu_GetSelectedID(FQ_SFSD_Dropdown) --施法速度
		WRSet.FQ_NotADD=FQ_NotADD_Checkbox:GetChecked()	--防ADD
		WRSet.FQ_QZJS=FQ_QZJS_Checkbox:GetChecked()	--前置减伤
	end
	if GetSpecialization()==3 then	--惩戒专精
		if WRSet.CJQ_DDMS~=nil then
			InterruptTime=(WRSet.CJQ_DDMS-1)/10
		end
	end
	if GetSpecialization()==1 then	--奶骑专精
		if WRSet.NQ_DDMS~=nil then
			InterruptTime=(WRSet.NQ_DDMS-1)/10
		end
		
		if WRSet.NQ_SGDB~=nil then
			if WRSet.NQ_SGDB==1 and NQ_SGDB_UnitName~=UnitName("Party1") then
				local Name,_=UnitName("Party1")
				if Name~=nil then
					print("|cffffdf00圣光道标：|cff00ff00"..Name)
				else
					print("|cffffdf00圣光道标：|cffff5040队友不存在！")
				end
				NQ_SGDB_UnitName=UnitName("Party1")
			elseif WRSet.NQ_SGDB==2 and NQ_SGDB_UnitName~=UnitName("Party2") then
				local Name,_=UnitName("Party2")
				if Name~=nil then
					print("|cffffdf00圣光道标：|cff00ff00"..Name)
				else
					print("|cffffdf00圣光道标：|cffff5040队友不存在！")
				end
				NQ_SGDB_UnitName=UnitName("Party2")
			elseif WRSet.NQ_SGDB==3 and NQ_SGDB_UnitName~=UnitName("Party3") then
				local Name,_=UnitName("Party3")
				if Name~=nil then
					print("|cffffdf00圣光道标：|cff00ff00"..Name)
				else
					print("|cffffdf00圣光道标：|cffff5040队友不存在！")
				end
				NQ_SGDB_UnitName=UnitName("Party3")
			elseif WRSet.NQ_SGDB==4 and NQ_SGDB_UnitName~=UnitName("Party4") then
				local Name,_=UnitName("Party4")
				if Name~=nil then
					print("|cffffdf00圣光道标：|cff00ff00"..Name)
				else
					print("|cffffdf00圣光道标：|cffff5040队友不存在！")
				end
				NQ_SGDB_UnitName=UnitName("Party4")
			elseif WRSet.NQ_SGDB==5 and NQ_SGDB_UnitName~=UnitName("player") then
				local Name,_=UnitName("player")
				if Name~=nil then
					print("|cffffdf00圣光道标：|cff00ff00"..Name)
				else
					print("|cffffdf00圣光道标：|cffff5040队友不存在！")
				end
				NQ_SGDB_UnitName=UnitName("player")
			end
		end
		if WRSet.NQ_XYDB~=nil then
			if WRSet.NQ_XYDB==1 and NQ_XYDB_UnitName~=UnitName("Party1") then
				local Name,_=UnitName("Party1")
				if Name~=nil then
					print("|cffffdf00信仰道标：|cff00ff00"..Name)
				else
					print("|cffffdf00信仰道标：|cffff5040队友不存在！")
				end
				NQ_XYDB_UnitName=UnitName("Party1")
			elseif WRSet.NQ_XYDB==2 and NQ_XYDB_UnitName~=UnitName("Party2") then
				local Name,_=UnitName("Party2")
				if Name~=nil then
					print("|cffffdf00信仰道标：|cff00ff00"..Name)
				else
					print("|cffffdf00信仰道标：|cffff5040队友不存在！")
				end
				NQ_XYDB_UnitName=UnitName("Party2")
			elseif WRSet.NQ_XYDB==3 and NQ_XYDB_UnitName~=UnitName("Party3") then
				local Name,_=UnitName("Party3")
				if Name~=nil then
					print("|cffffdf00信仰道标：|cff00ff00"..Name)
				else
					print("|cffffdf00信仰道标：|cffff5040队友不存在！")
				end
				NQ_XYDB_UnitName=UnitName("Party3")
			elseif WRSet.NQ_XYDB==4 and NQ_XYDB_UnitName~=UnitName("Party4") then
				local Name,_=UnitName("Party4")
				if Name~=nil then
					print("|cffffdf00信仰道标：|cff00ff00"..Name)
				else
					print("|cffffdf00信仰道标：|cffff5040队友不存在！")
				end
				NQ_XYDB_UnitName=UnitName("Party4")
			elseif WRSet.NQ_XYDB==5 and NQ_XYDB_UnitName~=UnitName("player") then
				local Name,_=UnitName("player")
				if Name~=nil then
					print("|cffffdf00信仰道标：|cff00ff00"..Name)
				else
					print("|cffffdf00信仰道标：|cffff5040队友不存在！")
				end
				NQ_XYDB_UnitName=UnitName("player")
			end
		end
		
	end
	
	if GetSpecialization()==2 then	--防骑专精
		if WRSet.FQ_DDMS~=nil then
			InterruptTime=(WRSet.FQ_DDMS-1)/10
		end
	end

end

--对应专精显示或隐藏
function WR_PaladinFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--奶骑专精
		NQ_Frame:Show()
		CJQ_Frame:Hide()
		FQ_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+20*35)
	end
	if GetSpecialization()==2 then	--防骑专精
		NQ_Frame:Hide()
		CJQ_Frame:Hide()
		FQ_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+25*35)
	end
	if GetSpecialization()==3 then	--惩戒专精
		NQ_Frame:Hide()
		CJQ_Frame:Show()
		FQ_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+21*35)
	end
end


--圣疗术 的先决条件
function WR_Paladin_SLS(Unit,Temp_SLS)
	if not UnitCanAttack(Unit,"player")	--单位是友方
	and not UnitIsDead(Unit)	--单位没有死亡
	and not(UnitGroupRolesAssigned(Unit)=="TANK" and UnitClassBase(Unit)=="PALADIN" and Unit~="player")	--不是防骑
	and
	(
		( Temp_SLS<=3 and UnitHealth(Unit)/UnitHealthMax(Unit)<Temp_SLS/10 )	--圣疗术 为所有人 --单位血量比例<设定值
		or
		( Temp_SLS>=4 and UnitHealth(Unit)/UnitHealthMax(Unit)<(Temp_SLS-3)/10 )	--圣疗术 为自己 --单位血量比例<设定值
	)
	and WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_GetUnitDebuffInfo(Unit,"自律")==0	--单位没有自律debuff
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("CF10","圣疗"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"圣疗") then return true end --选择单位过程
		else
			if Unit=="player" then
				if WR_ColorFrame_Show("CF10","圣疗P") then return true end
			elseif Unit=="party1" then
				if WR_ColorFrame_Show("CN1","圣疗P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("CN2","圣疗P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("CN3","圣疗P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("CN4","圣疗P4") then return true end
			end
		end
	end
	return false
end

--施法过程 圣疗术
function WR_Paladin_Function_SLS()
	if not IsPlayerSpell(633) then return false end	--没学[圣疗术]
	if not UnitAffectingCombat("player") then return false end	--玩家不在战斗
	if WR_GetGCD("圣疗术")>0 then return false end	--圣疗术CD中
	
	local Temp_SLS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_SLS = WRSet.NQ_SLS
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_SLS = WRSet.FQ_SLS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_SLS = WRSet.CJQ_SLS
	end
	if Temp_SLS==7 then return false end	--圣疗术 关闭
	
	if WR_Paladin_SLS("player",Temp_SLS) then return true end --圣疗术P
	

	if Temp_SLS<=3 then	--所有人
		if GetSpecialization()==1 then	--奶骑
			local Sum
			if RaidOrParty == "raid" then
				Sum = 20
			elseif RaidOrParty == "party" then
				Sum = 4
			end
			if Sum~=nil then
				for i=1,Sum,1 do
					if WR_Paladin_SLS(RaidOrParty..i,Temp_SLS) then return true end --圣疗术
				end
			end
		else
			for i=1,4,1 do
				if WR_Paladin_SLS("party"..i,Temp_SLS) then return true end --圣疗术
			end
		end
	end

	return false
end

--施法过程 圣盾术
function WR_Paladin_Function_SDS()
	local Temp_SDS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_SDS = WRSet.NQ_SDS
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_SDS = WRSet.FQ_SDS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_SDS = WRSet.CJQ_SDS
	end
	
	if Temp_SDS~=4	--圣盾术 开启
	and UnitHealth("player")/UnitHealthMax("player")<Temp_SDS/10	--玩家血量<设定值
	and UnitAffectingCombat("player")	--玩家在战斗
	and WR_SpellUsable("圣盾术")	--技能可用 资源可用
	and WR_GetUnitDebuffTime("player","自律")==0	--自律Debuff不存在
	then
		if WR_ColorFrame_Show("CF11","圣盾术") then return true end
	end
	return false
end

--施法过程 圣佑术
function WR_Paladin_Function_SYS()
	local Temp_SYS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_SYS = WRSet.NQ_SYS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_SYS = WRSet.CJQ_SYS
	end
	
	if Temp_SYS==1	--圣佑术 开启
	and ActivateDefense	--激活防御
	and (FCZD_EndTime==nil or GetTime()-FCZD_EndTime>10)	--复仇之盾已施法过去10秒
	and WR_SpellUsable("圣佑术")	--技能可用 资源可用
	and WR_GetUnitDebuffTime("player","复仇之盾")==0	--复仇之盾 BUFF 不存在
	then
		SYS_EndTime=GetTime()+GCD
		if WR_ColorFrame_Show("SF10","圣佑术") then return true end
	end
	return false
end

--责难 的先决条件
function WR_Paladin_ZN(Unit)
	if UnitCanAttack(Unit,"player")	--单位是敌方
	and WR_GetUnitRange(Unit)<=2	--单位距离
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Paladin_ZN_Important)	--单位有需要打断的法术
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF1","责难"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"责难") then return true end --选择单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("SF1","责难T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSF5","责难M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("CSF6","责难F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("CSF1","责难P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("CSF2","责难P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("CSF3","责难P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("CSF4","责难P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 责难
function WR_Paladin_Function_ZN()
	if not WR_SpellUsable("责难") then return false end	--技能不可用
	if not UnitAffectingCombat("player") then return false end	--玩家不在战斗
	
	local Temp_ZN=5
	if GetSpecialization()==1 then	--奶骑专精
		Temp_ZN = WRSet.NQ_ZN
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_ZN = WRSet.FQ_ZN
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_ZN = WRSet.CJQ_ZN
	end

	if Temp_ZN<=4 then
		WR_Paladin_ZN_Important = false
	else
		WR_Paladin_ZN_Important = true
	end

	if Temp_ZN==9 then	--禁用
		return false
	elseif (Temp_ZN==1 or Temp_ZN==5)	--智能
	or
	(
		(Temp_ZN==4 or Temp_ZN==8)	--焦点
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
		if WR_Paladin_ZN("focus") then return true end	--焦点
		if WR_Paladin_ZN("target") then return true end	--目标
		if WR_Paladin_ZN("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Paladin_ZN("party"..i.."target") then return true end
		end
	elseif (Temp_ZN==2 or Temp_ZN==6) then	--目标
		if WR_Paladin_ZN("target") then return true end
	elseif (Temp_ZN==3 or Temp_ZN==7) then	--指向
		if WR_Paladin_ZN("mouseover") then return true end
	elseif (Temp_ZN==4 or Temp_ZN==8) then	--焦点
		if WR_Paladin_ZN("focus") then return true end
	end
	
	return false
end

--施法过程 治疗石
function WR_Paladin_Function_ZLS()
	local Temp_ZLS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_ZLS = WRSet.NQ_ZLS
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_ZLS = WRSet.FQ_ZLS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_ZLS = WRSet.CJQ_ZLS
	end
	
	if Temp_ZLS~=5
	--治疗石选项不是关闭的
	and PlayerHP < Temp_ZLS/10
	--血量比例<治疗石设定值/10
	and WR_Use_ZLS()	--治疗石 可用
	then
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end

--施法过程 治疗药水
function WR_Paladin_Function_ZLYS()
	local Temp_ZLYS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_ZLYS = WRSet.NQ_ZLYS
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_ZLYS = WRSet.FQ_ZLYS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_ZLYS = WRSet.CJQ_ZLYS
	end
	
	if Temp_ZLYS~=5
	--治疗药水选项不是关闭的
	and PlayerHP < Temp_ZLYS/10
	--血量比例<治疗药水设定值/10
	and WR_Use_ZLYS()	--治疗药水 可用
	then
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--代祷 的先决条件
function WR_Paladin_Function_DD()
	local Temp_DD
	if GetSpecialization()==1 then	--奶骑专精
		Temp_DD = WRSet.NQ_DD
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_DD = WRSet.FQ_DD
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_DD = WRSet.CJQ_DD
	end
	
	if Temp_DD==1	--代祷开启
	and WR_SpellUsable("代祷")	--技能可用 资源可用
	and not PlayerMove--没有移动
	and UnitAffectingCombat("player")	--单位战斗中
	and UnitCastingInfo("player")~="代祷"	--没有正在施法 代祷
	and UnitIsDead("mouseover")	--单位死亡
	and not UnitCanAttack("mouseover","player")	--单位是友善的
	and UnitIsPlayer("mouseover")	--单位是玩家
	and WR_GetUnitRange("mouseover")<=40	--单位距离
	and WR_GetUnitDebuffTime("mouseover","正在复活")==0	--单位没有 正在复活
	then
		if WR_ColorFrame_Show("SF7","代祷") then return true end
	end
	return false
end

--自由祝福 的先决条件
function WR_Paladin_ZYZF(Unit)
	if not UnitCanAttack(Unit,"player")	--单位是友方
	and WR_GetUnitRange(Unit)<=40	--单位距离
	and
	(
		WR_YuFangDingShen(Unit)	--预防定身
		or
		WR_Unbind(Unit)	--单位有自由祝福可以解除的状态
	)
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF3","自由"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"自由") then return true end --选择单位过程
		else
			if Unit=="player" then
				if WR_ColorFrame_Show("SF3","自由P") then return true end
			elseif Unit=="party1" then
				if WR_ColorFrame_Show("AN1","自由P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("AN2","自由P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("AN3","自由P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("AN4","自由P4") then return true end
			end
		end
	end
	return false
end

--施法过程 自由祝福
function WR_Paladin_Function_ZYZF()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("自由祝福") then return false end	--技能不可用
	
	local Temp_ZYZF
	if GetSpecialization()==1 then	--奶骑专精
		Temp_ZYZF = WRSet.NQ_ZYZF
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_ZYZF = WRSet.FQ_ZYZF
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_ZYZF = WRSet.CJQ_ZYZF
	end
	
	if Temp_ZYZF==1 or ( Temp_ZYZF==2 and IsPlayerSpell(305394) ) then
		--自由祝福 智能 或 ( 自己 并且 已学习 无拘自由(双自由) )
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)=="HEALER" then
				if WR_Paladin_ZYZF("party"..i) then return true end
			end
		end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)=="TANK" then
				if WR_Paladin_ZYZF("party"..i) then return true end
			end
		end
		for i=1,4,1 do
			if WR_Paladin_ZYZF("party"..i) then return true end
		end
	end
	if Temp_ZYZF~=3 then	--自由祝福 没禁用
		if WR_Paladin_ZYZF("player") then return true end	--有可解除定身的
	end
	return false
end

--牺牲祝福 的先决条件
function WR_Paladin_XSZF(Unit)
	local Temp_XSZF
	if GetSpecialization()==1 then	--奶骑专精
		Temp_XSZF = WRSet.NQ_XSZF
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_XSZF = WRSet.FQ_XSZF
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_XSZF = WRSet.CJQ_XSZF
	end
	
	if Temp_XSZF==4 then return false end	--牺牲祝福 关闭
	
	if WR_GetUnitRange(Unit)<=40	--单位距离
	and not UnitCanAttack(Unit,"player")	--单位是友方
	and not UnitIsDead(Unit)	--单位没有死亡
	and UnitHealth(Unit)/UnitHealthMax(Unit) < Temp_XSZF/10	--单位血量低于设定值
	and WR_GetUnitBuffTime(Unit,"破咒祝福")==0	--单位没有 破咒祝福
	and WR_GetUnitBuffTime(Unit,"牺牲祝福")==0	--单位没有 牺牲祝福
	and
	(
		WR_GetUnitDebuffTime("player","圣盾术")>0	--圣盾术BUFF存在
		or
		( PlayerHP > 0.8 and UnitGroupRolesAssigned(Unit)~="TANK" )	--自身血量>80% 并且 单位不是坦克
	)
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then --单位 是 焦点
				if WR_ColorFrame_Show("SF8","牺牲"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"牺牲") then return true end --选择单位过程
		else
			if Unit=="party1" then
				if WR_ColorFrame_Show("CN5","牺牲P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("CN6","牺牲P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("CN7","牺牲P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("CN8","牺牲P4") then return true end
			end
		end
	end
	return false
end

--施法过程 牺牲祝福
function WR_Paladin_Function_XSZF()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("牺牲祝福") then return false end	--技能不可用
	if not UnitAffectingCombat("player") then return false end	--不在战斗中
	
	for i=1,4,1 do
		if WR_Paladin_XSZF("party"..i) then return true end
	end
	return false
end

--制裁之锤
function WR_Paladin_ZCZC(Unit)
	if WR_GetUnitRange(Unit)<=10	--单位距离
	and UnitCanAttack(Unit,"player")	--单位是敌方
	and WR_StunSpell(Unit)	--可以击晕单位
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF4","制裁"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"制裁") then return true end --选择单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("SF4","制裁T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSF7","制裁M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("CSF8","制裁F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("AN5","制裁P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("AN6","制裁P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("AN7","制裁P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("AN8","制裁P4T") then return true end
			end
		end
	end
	return false
end

--施法过程 制裁之锤
function WR_Paladin_Function_ZCZC()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("制裁之锤") then return false end	--技能不可用
	
	local Temp_ZCZC=5
	if GetSpecialization()==1 then	--奶骑专精
		Temp_ZCZC = WRSet.NQ_ZCZC
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_ZCZC = WRSet.FQ_ZCZC
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_ZCZC = WRSet.CJQ_ZCZC
	end
	
	if Temp_ZCZC==5 then	--禁用
		return false
	elseif Temp_ZCZC==1	--智能
	or
	(
		Temp_ZCZC==4	--焦点
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
		if WR_Paladin_ZCZC("focus") then return true end	--焦点
		if WR_Paladin_ZCZC("target") then return true end	--目标
		if WR_Paladin_ZCZC("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Paladin_ZCZC("party"..i.."target") then return true end
		end
	elseif Temp_ZCZC==2 then	--目标
		if WR_Paladin_ZCZC("target") then return true end
	elseif Temp_ZCZC==3 then	--指向
		if WR_Paladin_ZCZC("mouseover") then return true end
	elseif Temp_ZCZC==4 then	--焦点
		if WR_Paladin_ZCZC("focus") then return true end
	end
	
	return false
end

--施法过程 盲目之光
function WR_Paladin_Function_MMZG()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	local Temp_MMZG
	if GetSpecialization()==1 then	--奶骑专精
		Temp_MMZG = WRSet.NQ_MMZG
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_MMZG = WRSet.FQ_MMZG
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_MMZG = WRSet.CJQ_MMZG
	end
	
	if Temp_MMZG==1	--盲目之光 开启
	and WR_SpellUsable("盲目之光")	--技能可用 资源可用
	and WR_StunUnit(8,2)	--范围内有需要控制的单位
	then
		if WR_ColorFrame_Show("SF5","盲光") then return true end
	end
	return false
end

--清毒术 的先决条件
function WR_PaladinRetribution_QDS_QJS(Unit)
	
	if not UnitCanAttack("player",Unit)	--单位是友方
	and WR_GetUnitRange(Unit)<=40	--单位距离
	and WR_CanRemoveUnitDebuff(Unit)	--单位有可驱散Debuff
	then
		if GetSpecialization()==1 then	--奶骑
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("SF2","驱散"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"驱散") then return true end --选择单位过程
		else
			if Unit=="player" then
				if WR_ColorFrame_Show("SF2","驱散P") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("ASF11","驱散M") then return true end
			elseif Unit=="party1" then
				if WR_ColorFrame_Show("AN9","驱散P1") then return true end
			elseif Unit=="party2" then
				if WR_ColorFrame_Show("AN0","驱散P2") then return true end
			elseif Unit=="party3" then
				if WR_ColorFrame_Show("CN9","驱散P3") then return true end
			elseif Unit=="party4" then
				if WR_ColorFrame_Show("CN0","驱散P4") then return true end
			end
		end
	end
	return false
end

--施法过程 清毒术 清洁术
function WR_Paladin_Function_QDS_QJS()
	--print("清毒术 清洁术")
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("清毒术") and not WR_SpellUsable("清洁术") then return false end	--技能不可用
	
	local Temp_QDS_QJS
	if GetSpecialization()==1 then	--奶骑专精
		Temp_QDS_QJS = WRSet.NQ_QJS
	elseif GetSpecialization()==2 then	--防骑专精
		Temp_QDS_QJS = WRSet.FQ_QDS
	elseif GetSpecialization()==3 then	--惩戒专精
		Temp_QDS_QJS = WRSet.CJQ_QDS
	end
	
	if Temp_QDS_QJS==1 then	--智能
		if WR_PaladinRetribution_QDS_QJS("mouseover") then return true end
		for i=1,4,1 do
			if UnitGroupRolesAssigned("party"..i)=="TANK" then
				if WR_PaladinRetribution_QDS_QJS("party"..i) then return true end
			end
		end
		if WR_PaladinRetribution_QDS_QJS("player") then return true end
		for i=1,4,1 do
			if WR_PaladinRetribution_QDS_QJS("party"..i) then return true end
		end
	elseif Temp_QDS_QJS==2 then	--指向
		if WR_PaladinRetribution_QDS_QJS("mouseover") then return true end
	elseif Temp_QDS_QJS==3 then	--自己
		if WR_PaladinRetribution_QDS_QJS("player") then return true end
	end
	
	return false
end

--虔诚光环
function WR_Paladin_Function_QCGH()
	if WR_SpellUsable("虔诚光环")	--已学 虔诚光环
	and WR_GetUnitBuffTime("player","虔诚光环")==0	--虔诚光环 BUFF不存在
	then
		if WR_ColorFrame_Show("ACN0","虔诚光环") then return true end
	end
	return false
end

--施法过程 智能目标
function WR_Paladin_Function_ZNMB()
	local Temp_ZNMB=3
	if GetSpecialization()==1 then	--神圣专精
		Temp_ZNMB = WRSet.NQ_ZNMB
	elseif GetSpecialization()==2 then	--防护专精
		Temp_ZNMB = WRSet.FQ_ZNMB
	elseif GetSpecialization()==3 then	--惩戒骑专精
		Temp_ZNMB = WRSet.CJQ_ZNMB
	end
	
	if WR_Function_ZNMB(2,Temp_ZNMB) then return true end	--智能目标
	return false
end