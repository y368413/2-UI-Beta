--作者微信:WOW-Robot(转载请保留,感谢!)

--德鲁伊
function WR_Druid()
	WR_DruidSettings() --初始化储存值
	WR_DruidConfigFrame()	--创建的设置窗口
	WR_DruidSettingsSave() --设置写入
	WR_DruidFrameShowOrHide()	--对应专精显示或隐藏
	WR_DruidBalance() --鸟德运行库
	WR_DruidFeral()	--野德运行库
	WR_DruidGuardian()	--守护运行库
	WR_DruidRestoration()	--恢复运行库
end

--初始化储存值
function WR_DruidSettings()
	if WRSet==nil then
		local Settings = {
			PH_HS=2,	--化身
			PH_RGS=2,	--日光术
			PH_JCDS=2,	--解除定身
			PH_BXFY=2,	--变熊防御
			PH_SPS=5,	--树皮术
			PH_GL=4,	--甘霖
			PH_ZLS=3,	--治疗石
			PH_ZLYS=2,	--治疗药水
			PH_SP1=13,	--饰品1
			PH_SP2=13,	--饰品2
			
			YX_JCDS=2,	--解除定身
			YX_BXFY=2,	--变熊防御
			YX_SCBN=3,	--生存本能
			YX_YH=5,	--愈合
			YX_GL=4,	--甘霖
			YX_SPS=5,	--树皮术
			YX_ZLS=3,	--治疗石
			YX_ZLYS=2,	--治疗药水
			YX_SP1=13,	--饰品1
			YX_SP2=13,	--饰品2
			
			SH_ZNJD=9,	--智能焦点
			SH_DDMS=2,	--打断模式
			SH_TZ=9,	--铁鬃
			SH_SPS=8,	--树皮术
			SH_CSZZN=6,	--沉睡者之怒
			SH_KBHF=6,	--狂暴回复
			SH_SCBN=3,	--生存本能
			SH_GL=5,	--甘霖
			SH_ZLS=4,	--治疗石
			SH_ZLYS=3,	--治疗药水
			SH_SP1=13,	--饰品1
			SH_SP2=13,	--饰品2
			
			HF_SMZF=5,	--生命绽放
			HF_MSZF=5,	--蔓生绽放
			HF_JCDS=2,	--解除定身
			HF_BXFY=2,	--变熊防御
			HF_GL=4,	--甘霖
			HF_ZLS=3,	--治疗石
			HF_ZLYS=2,	--治疗药水
			HF_SP1=13,	--饰品1
			HF_SP2=13,	--饰品2
		}
		WRSet=Settings
	end
end

--设置写入
function WR_DruidSettingsSave()
	if WRSet~=nil then
		WRSet.PH_XHLX=UIDropDownMenu_GetSelectedID(PH_XHLX_Dropdown) --循环类型
		WRSet.PH_ZNMB=UIDropDownMenu_GetSelectedID(PH_ZNMB_Dropdown) --智能目标
		WRSet.PH_YDYH=UIDropDownMenu_GetSelectedID(PH_YDYH_Dropdown) --移动月火
		WRSet.PH_HS=UIDropDownMenu_GetSelectedID(PH_HS_Dropdown) --化身
		WRSet.PH_WLZZ=UIDropDownMenu_GetSelectedID(PH_WLZZ_Dropdown) --万灵之召
		WRSet.PH_FS=UIDropDownMenu_GetSelectedID(PH_FS_Dropdown) --复生
		WRSet.PH_AF=UIDropDownMenu_GetSelectedID(PH_AF_Dropdown) --安抚
		WRSet.PH_RGS=UIDropDownMenu_GetSelectedID(PH_RGS_Dropdown) --日光术
		WRSet.PH_QCFS=UIDropDownMenu_GetSelectedID(PH_QCFS_Dropdown) --清除腐蚀
		WRSet.PH_DHPX=UIDropDownMenu_GetSelectedID(PH_DHPX_Dropdown) --夺魂咆哮
		--WRSet.PH_MLMJ=UIDropDownMenu_GetSelectedID(PH_MLMJ_Dropdown) --蛮力猛击
		WRSet.PH_JCDS=UIDropDownMenu_GetSelectedID(PH_JCDS_Dropdown) --解除定身
		WRSet.PH_BXFY=UIDropDownMenu_GetSelectedID(PH_BXFY_Dropdown) --变熊防御
		WRSet.PH_ZRDSH=UIDropDownMenu_GetSelectedID(PH_ZRDSH_Dropdown) --自然的守护
		WRSet.PH_SPS=UIDropDownMenu_GetSelectedID(PH_SPS_Dropdown) --树皮术
		WRSet.PH_GL=UIDropDownMenu_GetSelectedID(PH_GL_Dropdown) --甘霖
		WRSet.PH_ZLS=UIDropDownMenu_GetSelectedID(PH_ZLS_Dropdown) --治疗石
		WRSet.PH_ZLYS=UIDropDownMenu_GetSelectedID(PH_ZLYS_Dropdown) --治疗药水
		WRSet.PH_SP1=UIDropDownMenu_GetSelectedID(PH_SP1_Dropdown) --饰品1
		WRSet.PH_SP2=UIDropDownMenu_GetSelectedID(PH_SP2_Dropdown) --饰品2
		WRSet.PH_SFSD=UIDropDownMenu_GetSelectedID(PH_SFSD_Dropdown) --施法速度
		
		
		WRSet.YX_ZNMB=UIDropDownMenu_GetSelectedID(YX_ZNMB_Dropdown) --智能目标
		WRSet.YX_ZNJD=UIDropDownMenu_GetSelectedID(YX_ZNJD_Dropdown) --智能焦点
		WRSet.YX_YTTJ=UIDropDownMenu_GetSelectedID(YX_YTTJ_Dropdown) --迎头痛击
		WRSet.YX_DDMS=UIDropDownMenu_GetSelectedID(YX_DDMS_Dropdown) --打断模式
		WRSet.YX_FS=UIDropDownMenu_GetSelectedID(YX_FS_Dropdown) --复生
		WRSet.YX_AF=UIDropDownMenu_GetSelectedID(YX_AF_Dropdown) --安抚
		WRSet.YX_QCFS=UIDropDownMenu_GetSelectedID(YX_QCFS_Dropdown) --清除腐蚀
		WRSet.YX_DHPX=UIDropDownMenu_GetSelectedID(YX_DHPX_Dropdown) --夺魂咆哮
		--WRSet.YX_MLMJ=UIDropDownMenu_GetSelectedID(YX_MLMJ_Dropdown) --蛮力猛击
		WRSet.YX_JCDS=UIDropDownMenu_GetSelectedID(YX_JCDS_Dropdown) --解除定身
		WRSet.YX_BXFY=UIDropDownMenu_GetSelectedID(YX_BXFY_Dropdown) --变熊防御
		WRSet.YX_ZRDSH=UIDropDownMenu_GetSelectedID(YX_ZRDSH_Dropdown) --自然的守护
		WRSet.YX_SPS=UIDropDownMenu_GetSelectedID(YX_SPS_Dropdown) --树皮术
		WRSet.YX_SCBN=UIDropDownMenu_GetSelectedID(YX_SCBN_Dropdown) --生存本能
		WRSet.YX_YH=UIDropDownMenu_GetSelectedID(YX_YH_Dropdown) --愈合
		WRSet.YX_GL=UIDropDownMenu_GetSelectedID(YX_GL_Dropdown) --甘霖
		WRSet.YX_ZLS=UIDropDownMenu_GetSelectedID(YX_ZLS_Dropdown) --治疗石
		WRSet.YX_ZLYS=UIDropDownMenu_GetSelectedID(YX_ZLYS_Dropdown) --治疗药水
		WRSet.YX_SP1=UIDropDownMenu_GetSelectedID(YX_SP1_Dropdown) --饰品1
		WRSet.YX_SP2=UIDropDownMenu_GetSelectedID(YX_SP2_Dropdown) --饰品2
		WRSet.YX_SFSD=UIDropDownMenu_GetSelectedID(YX_SFSD_Dropdown) --施法速度
		
		
		WRSet.SH_ZNMB=UIDropDownMenu_GetSelectedID(SH_ZNMB_Dropdown) --智能目标
		WRSet.SH_ZNJD=UIDropDownMenu_GetSelectedID(SH_ZNJD_Dropdown) --智能焦点
		WRSet.SH_YTTJ=UIDropDownMenu_GetSelectedID(SH_YTTJ_Dropdown) --迎头痛击
		WRSet.SH_DDMS=UIDropDownMenu_GetSelectedID(SH_DDMS_Dropdown) --打断模式
		WRSet.SH_TZ=UIDropDownMenu_GetSelectedID(SH_TZ_Dropdown) --铁鬃
		WRSet.SH_FS=UIDropDownMenu_GetSelectedID(SH_FS_Dropdown) --复生
		WRSet.SH_AF=UIDropDownMenu_GetSelectedID(SH_AF_Dropdown) --安抚
		WRSet.SH_QCFS=UIDropDownMenu_GetSelectedID(SH_QCFS_Dropdown) --清除腐蚀
		WRSet.SH_DHPX=UIDropDownMenu_GetSelectedID(SH_DHPX_Dropdown) --夺魂咆哮
		--WRSet.SH_MLMJ=UIDropDownMenu_GetSelectedID(SH_MLMJ_Dropdown) --蛮力猛击
		WRSet.SH_SPS=UIDropDownMenu_GetSelectedID(SH_SPS_Dropdown) --树皮术
		WRSet.SH_CSZZN=UIDropDownMenu_GetSelectedID(SH_CSZZN_Dropdown) --沉睡者之怒
		WRSet.SH_KBHF=UIDropDownMenu_GetSelectedID(SH_KBHF_Dropdown) --狂暴回复
		WRSet.SH_SCBN=UIDropDownMenu_GetSelectedID(SH_SCBN_Dropdown) --生存本能
		WRSet.SH_GL=UIDropDownMenu_GetSelectedID(SH_GL_Dropdown) --甘霖
		WRSet.SH_ZLS=UIDropDownMenu_GetSelectedID(SH_ZLS_Dropdown) --治疗石
		WRSet.SH_ZLYS=UIDropDownMenu_GetSelectedID(SH_ZLYS_Dropdown) --治疗药水
		WRSet.SH_SP1=UIDropDownMenu_GetSelectedID(SH_SP1_Dropdown) --饰品1
		WRSet.SH_SP2=UIDropDownMenu_GetSelectedID(SH_SP2_Dropdown) --饰品2
		WRSet.SH_SFSD=UIDropDownMenu_GetSelectedID(SH_SFSD_Dropdown) --施法速度
		WRSet.SH_NotADD=SH_NotADD_Checkbox:GetChecked()	--防ADD
		WRSet.SH_QZJS=SH_QZJS_Checkbox:GetChecked()	--前置减伤
		
		--WRSet.HF_ZNMB=UIDropDownMenu_GetSelectedID(HF_ZNMB_Dropdown) --智能目标
		WRSet.HF_YTTJ=UIDropDownMenu_GetSelectedID(HF_YTTJ_Dropdown) --迎头痛击
		WRSet.HF_DDMS=UIDropDownMenu_GetSelectedID(HF_DDMS_Dropdown) --打断模式
		WRSet.HF_HS=UIDropDownMenu_GetSelectedID(HF_HS_Dropdown) --化身
		WRSet.HF_SMZF=UIDropDownMenu_GetSelectedID(HF_SMZF_Dropdown) --生命绽放
		WRSet.HF_MSZF=UIDropDownMenu_GetSelectedID(HF_MSZF_Dropdown) --蔓生绽放
		WRSet.HF_BHQF=UIDropDownMenu_GetSelectedID(HF_BHQF_Dropdown) --百花齐放
		--WRSet.HF_JBFQ=UIDropDownMenu_GetSelectedID(HF_JBFQ_Dropdown) --激变蜂群
		--WRSet.HF_HCS=UIDropDownMenu_GetSelectedID(HF_HCS_Dropdown) --回春术
		WRSet.HF_ZRZY=UIDropDownMenu_GetSelectedID(HF_ZRZY_Dropdown) --自然之愈
		WRSet.HF_AF=UIDropDownMenu_GetSelectedID(HF_AF_Dropdown) --安抚
		WRSet.HF_FS=UIDropDownMenu_GetSelectedID(HF_FS_Dropdown) --复生
		WRSet.HF_DHPX=UIDropDownMenu_GetSelectedID(HF_DHPX_Dropdown) --夺魂咆哮
		--WRSet.HF_MLMJ=UIDropDownMenu_GetSelectedID(HF_MLMJ_Dropdown) --蛮力猛击
		WRSet.HF_JCDS=UIDropDownMenu_GetSelectedID(HF_JCDS_Dropdown) --解除定身
		WRSet.HF_BXFY=UIDropDownMenu_GetSelectedID(HF_BXFY_Dropdown) --变熊防御
		WRSet.HF_LBXT=UIDropDownMenu_GetSelectedID(HF_LBXT_Dropdown) --猎豹形态
		--WRSet.HF_JGXT=UIDropDownMenu_GetSelectedID(HF_JGXT_Dropdown) --进攻形态
		WRSet.HF_SPS=UIDropDownMenu_GetSelectedID(HF_SPS_Dropdown) --树皮术
		WRSet.HF_TMSP=UIDropDownMenu_GetSelectedID(HF_TMSP_Dropdown) --铁木树皮
		WRSet.HF_GL=UIDropDownMenu_GetSelectedID(HF_GL_Dropdown) --甘霖
		WRSet.HF_ZLS=UIDropDownMenu_GetSelectedID(HF_ZLS_Dropdown) --治疗石
		WRSet.HF_ZLYS=UIDropDownMenu_GetSelectedID(HF_ZLYS_Dropdown) --治疗药水
		WRSet.HF_SP1=UIDropDownMenu_GetSelectedID(HF_SP1_Dropdown) --饰品1
		WRSet.HF_SP2=UIDropDownMenu_GetSelectedID(HF_SP2_Dropdown) --饰品2
		WRSet.HF_SFSD=UIDropDownMenu_GetSelectedID(HF_SFSD_Dropdown) --施法速度
	end
	
	if GetSpecialization()==1 then	--鸟德专精
	end
	
	if GetSpecialization()==2 then	--野性专精
		if WRSet.YX_DDMS~=nil then
			InterruptTime=(WRSet.YX_DDMS-1)/10
		end
	end
	
	if GetSpecialization()==3 then	--守护专精
		if WRSet.SH_DDMS~=nil then
			InterruptTime=(WRSet.SH_DDMS-1)/10
		end
	end
	
	if GetSpecialization()==4 then	--恢复专精
		if WRSet.HF_DDMS~=nil then
			InterruptTime=(WRSet.HF_DDMS-1)/10
		end
	
		if WRSet.HF_SMZF~=nil then
			if WRSet.HF_SMZF==1 and HF_SMZF_UnitName~=UnitName("Party1") then
				local Name,_=UnitName("Party1")
				if Name~=nil then
					print("|cffffdf00生命绽放：|cff00ff00"..Name)
				end
				HF_SMZF_UnitName=UnitName("Party1")
			elseif WRSet.HF_SMZF==2 and HF_SMZF_UnitName~=UnitName("Party2") then
				local Name,_=UnitName("Party2")
				if Name~=nil then
					print("|cffffdf00生命绽放：|cff00ff00"..Name)
				end
				HF_SMZF_UnitName=UnitName("Party2")
			elseif WRSet.HF_SMZF==3 and HF_SMZF_UnitName~=UnitName("Party3") then
				local Name,_=UnitName("Party3")
				if Name~=nil then
					print("|cffffdf00生命绽放：|cff00ff00"..Name)
				end
				HF_SMZF_UnitName=UnitName("Party3")
			elseif WRSet.HF_SMZF==4 and HF_SMZF_UnitName~=UnitName("Party4") then
				local Name,_=UnitName("Party4")
				if Name~=nil then
					print("|cffffdf00生命绽放：|cff00ff00"..Name)
				end
				HF_SMZF_UnitName=UnitName("Party4")
			elseif WRSet.HF_SMZF==5 and HF_SMZF_UnitName~=UnitName("player") then
				local Name,_=UnitName("player")
				if Name~=nil then
					print("|cffffdf00生命绽放：|cff00ff00"..Name)
				end
				HF_SMZF_UnitName=UnitName("player")
			end
		end
		if WRSet.HF_MSZF~=nil then
			if WRSet.HF_MSZF==1 and HF_MSZF_UnitName~=UnitName("Party1") then
				local Name,_=UnitName("Party1")
				if Name~=nil then
					print("|cffffdf00蔓生绽放：|cff00ff00"..Name)
				end
				HF_MSZF_UnitName=UnitName("Party1")
			elseif WRSet.HF_MSZF==2 and HF_MSZF_UnitName~=UnitName("Party2") then
				local Name,_=UnitName("Party2")
				if Name~=nil then
					print("|cffffdf00蔓生绽放：|cff00ff00"..Name)
				end
				HF_MSZF_UnitName=UnitName("Party2")
			elseif WRSet.HF_MSZF==3 and HF_MSZF_UnitName~=UnitName("Party3") then
				local Name,_=UnitName("Party3")
				if Name~=nil then
					print("|cffffdf00蔓生绽放：|cff00ff00"..Name)
				end
				HF_MSZF_UnitName=UnitName("Party3")
			elseif WRSet.HF_MSZF==4 and HF_MSZF_UnitName~=UnitName("Party4") then
				local Name,_=UnitName("Party4")
				if Name~=nil then
					print("|cffffdf00蔓生绽放：|cff00ff00"..Name)
				end
				HF_MSZF_UnitName=UnitName("Party4")
			elseif WRSet.HF_MSZF==5 and HF_MSZF_UnitName~=UnitName("player") then
				local Name,_=UnitName("player")
				if Name~=nil then
					print("|cffffdf00蔓生绽放：|cff00ff00"..Name)
				end
				HF_MSZF_UnitName=UnitName("player")
			end
		end
	end
end

--对应专精显示或隐藏
function WR_DruidFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--鸟德专精
		PH_Frame:Show()
		YX_Frame:Hide()
		SH_Frame:Hide()
		HF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+19*35)
	end
	if GetSpecialization()==2 then	--猫德专精
		PH_Frame:Hide()
		YX_Frame:Show()
		SH_Frame:Hide()
		HF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+19*35)
	end
	if GetSpecialization()==3 then	--熊德专精
		PH_Frame:Hide()
		YX_Frame:Hide()
		SH_Frame:Show()
		HF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+18*35)
	end
	if GetSpecialization()==4 then	--奶德专精
		PH_Frame:Hide()
		YX_Frame:Hide()
		SH_Frame:Hide()
		HF_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+19*35)
	end
--[[
	if IsPlayerSpell(99) then
	--夺魂咆哮
		PH_DHPX_Text:Show()
		PH_DHPX_Dropdown:Show()
		PH_MLMJ_Text:Hide()
		PH_MLMJ_Dropdown:Hide()
		
		YX_DHPX_Text:Show()
		YX_DHPX_Dropdown:Show()
		YX_MLMJ_Text:Hide()
		YX_MLMJ_Dropdown:Hide()
		
		SH_DHPX_Text:Show()
		SH_DHPX_Dropdown:Show()
		SH_MLMJ_Text:Hide()
		SH_MLMJ_Dropdown:Hide()
		
		HF_DHPX_Text:Show()
		HF_DHPX_Dropdown:Show()
		HF_MLMJ_Text:Hide()
		HF_MLMJ_Dropdown:Hide()
	else
	--蛮力猛击
		PH_DHPX_Text:Hide()
		PH_DHPX_Dropdown:Hide()
		PH_MLMJ_Text:Show()
		PH_MLMJ_Dropdown:Show()
		
		YX_DHPX_Text:Hide()
		YX_DHPX_Dropdown:Hide()
		YX_MLMJ_Text:Show()
		YX_MLMJ_Dropdown:Show()
		
		SH_DHPX_Text:Hide()
		SH_DHPX_Dropdown:Hide()
		SH_MLMJ_Text:Show()
		SH_MLMJ_Dropdown:Show()
		
		HF_DHPX_Text:Hide()
		HF_DHPX_Dropdown:Hide()
		HF_MLMJ_Text:Show()
		HF_MLMJ_Dropdown:Show()
	end
--]]
end

--迎头痛击 施法条件
function WR_Druid_YTTJ(Unit)
	if WR_SpellUsable("迎头痛击") --技能可用
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Druid_YTTJ_Important) --指定"单位"施法剩余时间小于设定
	and WR_TargetInCombat(Unit) --单位可攻击
	and
	(
		( Unit=="focus" and IsSpellInRange("迎头痛击",Unit) )
		or
		WR_GetUnitRange(Unit)<=4 --单位距离<=4
	)
	then
		if GetSpecialization()==4 then	--恢复专精
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("CF12","打断"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"打断") then return true end --焦点单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("CSF5","打断T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("CSF6","打断M") then return true end
			elseif Unit=="focus" then
				if WR_ColorFrame_Show("CSF7","打断F") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("ASF9","打断P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("ASF10","打断P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("ASF11","打断P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("ASF12","打断P4T") then return true end
			end
		end
	end
	return false
end

--迎头痛击 施法条件
function WR_Druid_Function_YTTJ()
	if InRaidOrParty=="raid" or WR_GetInRaidOrParty()=="raid" then return false end	--在团队不打断
	if not WR_SpellUsable("迎头痛击") then return false end --迎头痛击 不可用
	
	local Temp_YTTJ = 9
	if GetSpecialization()==1 then	--平衡 专精
		Temp_YTTJ = 9
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_YTTJ = WRSet.YX_YTTJ
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_YTTJ = WRSet.SH_YTTJ
	elseif GetSpecialization()==4 then	--恢复 专精
		Temp_YTTJ = WRSet.HF_YTTJ
	end

	if Temp_YTTJ<=4 then
		WR_Druid_YTTJ_Important = false
	else
		WR_Druid_YTTJ_Important = true
	end
	
	if Temp_YTTJ==9 then	--禁用
		return false
	elseif (Temp_YTTJ==1 or Temp_YTTJ==5)	--智能
	or
	(
		(Temp_YTTJ==4 or Temp_YTTJ==8)	--焦点
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
		if WR_Druid_YTTJ("focus") then return true end	--焦点
		if WR_Druid_YTTJ("target") then return true end	--目标
		if WR_Druid_YTTJ("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Druid_YTTJ("party"..i.."target") then return true end
		end
	elseif (Temp_YTTJ==2 or Temp_YTTJ==6) then	--目标
		if WR_Druid_YTTJ("target") then return true end
	elseif (Temp_YTTJ==3 or Temp_YTTJ==7) then	--指向
		if WR_Druid_YTTJ("mouseover") then return true end
	elseif (Temp_YTTJ==4 or Temp_YTTJ==8) then	--焦点
		if WR_Druid_YTTJ("focus") then return true end
	end
	
	return false
end

--施法过程 复生
function WR_Druid_Function_FS()
	local Temp_FS
	if GetSpecialization()==1 then	--平衡 专精
		Temp_FS = WRSet.PH_FS
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_FS = WRSet.YX_FS
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_FS = WRSet.SH_FS
	elseif GetSpecialization()==4 then	--恢复 专精
		Temp_FS = WRSet.HF_FS
	end
	if Temp_FS==1	--复生 开启
	--and GCD<=ShiFaSuDu
	and UnitIsDead("mouseover") --单位死亡
	and not UnitCanAttack("mouseover","player") --单位是友善的
	and UnitIsPlayer("mouseover") --单位是玩家
	and UnitAffectingCombat("player") --玩家战斗中
	and WR_SpellUsable("复生") --技能可用 资源可用
	and WR_GetUnitDebuffInfo("mouseover","正在复活")==0
	and WR_GetUnitRange("mouseover")<=45 --单位距离<=45
	then
		if WR_ColorFrame_Show("CSG","复生") then return true end
	end
	return false
end

--施法过程 夺魂咆哮
function WR_Druid_Function_DHPX()
	local Temp_DHPX
	if GetSpecialization()==1 then	--平衡 专精
		Temp_DHPX = WRSet.PH_DHPX
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_DHPX = WRSet.YX_DHPX
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_DHPX = WRSet.SH_DHPX
	elseif GetSpecialization()==4 then	--恢复 专精
		Temp_DHPX = WRSet.HF_DHPX
	end
	
	if GCD<=ShiFaSuDu
	and Temp_DHPX==1 --夺魂咆哮 开启
	and WR_SpellUsable("夺魂咆哮") --技能可用 资源可用
	and WR_StunUnit(8,2) --范围内有需要控制的单位
	then
		if WR_ColorFrame_Show("CF11","夺魂咆哮") then return true end
	end
	return false
end

--施法过程 野性印记
function WR_Druid_Function_YXYJ()
	if GCD<=ShiFaSuDu
	and WR_SpellUsable("野性印记") --技能可用 资源可用
	and
	(
		WR_GetUnitBuffTime("player","野性印记")==0	--自己没有野性印记
		or
		(
			not UnitAffectingCombat("player")	--非战斗状态
			and
			(
				WR_GetUnitBuffTime("player","野性印记")<600	--野性印记小于10分钟
				or
				WR_PartyNotBuff("野性印记") --队友没有 野性印记
			)
		)
	)
	then
		if WR_ColorFrame_Show("CF1","野性印记") then return true end
	end
	return false
end

--施法过程 休眠
function WR_Druid_Function_XM()
	if GCD<=ShiFaSuDu
	and UnitName("mouseover")=="虚体生物" --单位是虚体生物
	and UnitCastingInfo("mouseover")~=nil --单位在施法
	and WR_SpellUsable("休眠")	--技能可用 资源可用
	and IsSpellInRange("休眠","mouseover") --单位在技能范围内
	and not WR_PlayerMove() --单位没有移动
	and not WR_StopCast(WR_GetTrueCastTime("休眠")) --避免施法被沉默的情况
	then
		if WR_ColorFrame_Show("ASF3","休眠") then return true end
	end
	return false
end

--树皮术
function WR_Druid_SPS()
	if not UnitAffectingCombat("player") then return false end	--非战斗中不使用
	if not WR_SpellUsable("树皮术") then return false end	--技能不可用
	
	local Temp_SPS=10
	if GetSpecialization()==1 then	--平衡 专精
		Temp_SPS = WRSet.PH_SPS
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_SPS = WRSet.YX_SPS
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_SPS = WRSet.SH_SPS
	end
	
	if Temp_SPS~=10 --树皮术 开启
	and PlayerHP<Temp_SPS/10 --血量比例
	then
		if WR_ColorFrame_Show("CF3","树皮术") then return true end
	end
	return false
end

--生存本能
function WR_Druid_SCBN()
	if not UnitAffectingCombat("player") then return false end	--非战斗中不使用
	if not WR_SpellUsable("生存本能") then return false end	--技能不可用
	
	local Temp_SCBN=6
	if GetSpecialization()==2 then	--野性 专精
		Temp_SCBN = WRSet.YX_SCBN
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_SCBN = WRSet.SH_SCBN
	end
	
	if Temp_SCBN~=6 --生存本能 开启
	and PlayerHP<Temp_SCBN/10 --血量比例<生存本能设定值/10
	and WR_GetUnitBuffTime("player","生存本能")==0	--生存本能 BUFF不存在
	then
		if WR_ColorFrame_Show("SF4","生存本能") then return true end
	end
	return false
end

--甘霖
function WR_Druid_GL()
	if not WR_SpellUsable("甘霖") then return false end	--技能不可用
	
	local Temp_GL=6
	if GetSpecialization()==1 then	--平衡 专精
		Temp_GL = WRSet.PH_GL
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_GL = WRSet.YX_GL
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_GL = WRSet.SH_GL
	end
	
	if Temp_GL~=6 --甘霖选项不是关闭的
	and PlayerHP<Temp_GL/10 --血量比例<甘霖设定值/10
	then
		if WR_ColorFrame_Show("CF2","甘霖") then return true end
	end
	return false
end
	
--治疗石
function WR_Druid_ZLS()
	if not UnitAffectingCombat("player") then return false end	--非战斗中不使用
	if not WR_Use_ZLS() then return false end	--治疗石 不可用
	
	local Temp_ZLS=5
	if GetSpecialization()==2 then	--野性 专精
		Temp_ZLS = WRSet.YX_ZLS
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_ZLS = WRSet.SH_ZLS
	end
	
	if Temp_ZLS~=5 --治疗石选项不是关闭的
	and PlayerHP<Temp_ZLS/10 --血量比例<治疗石设定值/10
	then
		if WR_ColorFrame_Show("CSF","治疗石") then return true end
	end
	return false
end
	
--治疗药水
function WR_Druid_ZLYS()
	if not UnitAffectingCombat("player") then return false end	--非战斗中不使用
	if not WR_Use_ZLYS() then return false end	--治疗药水 不可用
	
	local Temp_ZLYS=5
	if GetSpecialization()==2 then	--野性 专精
		Temp_ZLYS = WRSet.YX_ZLYS
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_ZLYS = WRSet.SH_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	then
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--安抚 条件
function WR_Druid_AF(Unit)
	if UnitCanAttack(Unit,"player") --单位是敌方
	and WR_GetUnitRange(Unit)<=45 --单位距离<=45
	and WR_UnitEnragedBuff(Unit) --单位身上有激怒效果
	then
		if GetSpecialization()==4 then	--恢复专精
			if UnitIsUnit("focus",Unit) then
				if WR_ColorFrame_Show("CF9","安抚"..Unit) then return true end
			end
			if WR_FocusUnit(Unit,"安抚") then return true end --焦点单位过程
		else
			if Unit=="target" then
				if WR_ColorFrame_Show("AN5","安抚T") then return true end
			elseif Unit=="mouseover" then
				if WR_ColorFrame_Show("AN6","安抚M") then return true end
			elseif Unit=="party1target" then
				if WR_ColorFrame_Show("AN1","安抚P1T") then return true end
			elseif Unit=="party2target" then
				if WR_ColorFrame_Show("AN2","安抚P2T") then return true end
			elseif Unit=="party3target" then
				if WR_ColorFrame_Show("AN3","安抚P3T") then return true end
			elseif Unit=="party4target" then
				if WR_ColorFrame_Show("AN4","安抚P4T") then return true end
			end
		end
	end
	return false
end
	
--施法过程 安抚
function WR_Druid_Function_AF()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("安抚") then return false end --安抚 不可用
	
	local Temp_AF=4
	if GetSpecialization()==1 then	--平衡 专精
		Temp_AF = WRSet.PH_AF
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_AF = WRSet.YX_AF
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_AF = WRSet.SH_AF
	elseif GetSpecialization()==4 then	--恢复 专精
		Temp_AF = WRSet.HF_AF
	end
	
	if Temp_AF==4 then return false end --安抚 关闭
	
	if Temp_AF==1 or Temp_AF==2 then
		if WR_Druid_AF("target") then return true end --安抚T
	end
	if Temp_AF==1 or Temp_AF==3 then
		if WR_Druid_AF("mouseover") then return true end --安抚M
	end
	if Temp_AF==1 then
		for i= 1,4,1 do
			if WR_Druid_AF("party"..i.."target") then return true end --安抚 
		end
	end
	return false
end

--清除腐蚀
function WR_Druid_QCFS(Unit)
	if not UnitCanAttack("player",Unit) --单位是友方
	and IsSpellInRange("清除腐蚀",Unit) --单位在技能范围内
	and WR_CanRemoveUnitDebuff(Unit) --单位有可驱散Debuff
	then
		if Unit=="player" then
			if WR_ColorFrame_Show("CN6","清除P") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CN5","清除M") then return true end
		elseif Unit=="party1" then
			if WR_ColorFrame_Show("CN1","清除P1") then return true end
		elseif Unit=="party2" then
			if WR_ColorFrame_Show("CN2","清除P2") then return true end
		elseif Unit=="party3" then
			if WR_ColorFrame_Show("CN3","清除P3") then return true end
		elseif Unit=="party4" then
			if WR_ColorFrame_Show("CN4","清除P4") then return true end
		end
	end
	return false
end

--施法过程 清除腐蚀
function WR_Druid_Function_QCFS()
	if GCD>ShiFaSuDu then return false end --GCD>施法速度
	if not WR_SpellUsable("清除腐蚀") then return false end	--技能不可用

	local Temp_QCFS=2
	if GetSpecialization()==1 then	--平衡 专精
		Temp_QCFS = WRSet.PH_QCFS
	elseif GetSpecialization()==2 then	--野性 专精
		Temp_QCFS = WRSet.YX_QCFS
	elseif GetSpecialization()==3 then	--守护 专精
		Temp_QCFS = WRSet.SH_QCFS
	end

	if Temp_QCFS==3 then return false end	--清除腐蚀 关闭

	if WR_Druid_QCFS("mouseover") then return true end
	
	if Temp_QCFS==1 then
		if WR_Druid_QCFS("player") then return true end
		for i= 1,4,1 do
			if WR_Druid_QCFS("party"..i) then return true end --清除腐蚀 
		end
	end
	return false
end

