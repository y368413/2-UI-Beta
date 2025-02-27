--作者微信:WOW-Robot(转载请保留,感谢!)

--牧师
function WR_Priest()
	WR_PriestSettings() --初始化储存值
	WR_PriestConfigFrame()	--创建的设置窗口
	WR_PriestSettingsSave() --设置写入
	WR_PriestFrameShowOrHide()	--对应专精显示或隐藏
	WR_PriestDisCipline() --戒律 运行库
	WR_PriestHoly() --神圣 运行库
	--WR_PriestShadow() --暗影 运行库
end

--初始化牧师储存值
function WR_PriestSettings()
	if WRSet==nil then
		local Settings = {
			JL_ZNMB=1,	--智能目标
			JL_NLGZ=1,	--能量灌注
			JL_CJS=1,	--纯净术
			JL_QSMF=1,	--驱散魔法
			JL_XLJX=1,	--心灵尖啸
			JL_TKYZ=1,	--痛苦压制
			JL_JWDY=1,	--绝望祷言
			JL_ZLS=3,	--治疗石
			JL_ZLYS=2,	--治疗药水
			JL_QJYZ=5,	--抢救阈值
			
			
			SS_ZNMB=1,	--智能目标
			SS_NLGZ=1,	--能量灌注
			SS_CJS=1,	--纯净术
			SS_QSMF=1,	--驱散魔法
			SS_XLJX=1,	--心灵尖啸
			SS_AYM=3,	--暗影魔
			SS_SSHS=1,	--神圣化身
			SS_JYS=1,	--渐隐术
			SS_SHZH=1,	--守护之魂
			SS_JWDY=1,	--绝望祷言
			SS_ZLS=3,	--治疗石
			SS_ZLYS=2,	--治疗药水
			
			

			AY_ZNMB=1,	--智能目标
			AY_AYCZ=3,	--暗影冲撞
			AY_CM=1,	--沉默
			AY_DDMS=1,	--打断模式
			AY_JHJB=1,	--净化疾病
			AY_QSMF=1,	--驱散魔法
			AY_XLJX=1,	--心灵尖啸
			AY_NLGZ=1,	--能量灌注
			AY_AYM=1,	--暗影魔
			AY_XKBF=1,	--虚空爆发
			AY_XKHL=1,	--虚空洪流
			AY_SP=4,	--饰品
			AY_BFYS=2,	--爆发药水
			AY_ZYSD=1,	--真言术盾
			AY_FHSG=1,	--防护圣光
			AY_JWDY=4,	--绝望祷言
			AY_XS=3,	--消散
			AY_ZLS=3,	--治疗石
			AY_ZLYS=2,	--治疗药水
			
		}
		WRSet=Settings
	end
end


--设置写入
function WR_PriestSettingsSave()
	if WRSet~=nil then
		WRSet.JL_ZNMB=UIDropDownMenu_GetSelectedID(JL_ZNMB_Dropdown) --智能目标
		WRSet.JL_NLGZ=UIDropDownMenu_GetSelectedID(JL_NLGZ_Dropdown) --能量灌注
		WRSet.JL_CJS=UIDropDownMenu_GetSelectedID(JL_CJS_Dropdown) --纯净术
		WRSet.JL_QSMF=UIDropDownMenu_GetSelectedID(JL_QSMF_Dropdown) --驱散魔法
		WRSet.JL_XLJX=UIDropDownMenu_GetSelectedID(JL_XLJX_Dropdown) --心灵尖啸
		WRSet.JL_JYS=UIDropDownMenu_GetSelectedID(JL_JYS_Dropdown) --渐隐术
		WRSet.JL_TKYZ=UIDropDownMenu_GetSelectedID(JL_TKYZ_Dropdown) --痛苦压制
		WRSet.JL_JWDY=UIDropDownMenu_GetSelectedID(JL_JWDY_Dropdown) --绝望祷言
		WRSet.JL_ZLS=UIDropDownMenu_GetSelectedID(JL_ZLS_Dropdown) --治疗石
		WRSet.JL_ZLYS=UIDropDownMenu_GetSelectedID(JL_ZLYS_Dropdown) --治疗药水
		WRSet.JL_QJYZ=UIDropDownMenu_GetSelectedID(JL_QJYZ_Dropdown) --抢救阈值
		WRSet.JL_SP1=UIDropDownMenu_GetSelectedID(JL_SP1_Dropdown) --饰品1
		WRSet.JL_SP2=UIDropDownMenu_GetSelectedID(JL_SP2_Dropdown) --饰品2
		WRSet.JL_SFSD=UIDropDownMenu_GetSelectedID(JL_SFSD_Dropdown) --施法速度
		
		
		WRSet.SS_ZNMB=UIDropDownMenu_GetSelectedID(SS_ZNMB_Dropdown) --智能目标
		WRSet.SS_NLGZ=UIDropDownMenu_GetSelectedID(SS_NLGZ_Dropdown) --能量灌注
		WRSet.SS_CJS=UIDropDownMenu_GetSelectedID(SS_CJS_Dropdown) --纯净术
		WRSet.SS_QSMF=UIDropDownMenu_GetSelectedID(SS_QSMF_Dropdown) --驱散魔法
		WRSet.SS_XLJX=UIDropDownMenu_GetSelectedID(SS_XLJX_Dropdown) --心灵尖啸
		WRSet.SS_AYM=UIDropDownMenu_GetSelectedID(SS_AYM_Dropdown) --暗影魔
		WRSet.SS_SSHS=UIDropDownMenu_GetSelectedID(SS_SSHS_Dropdown) --神圣化身
		WRSet.SS_GY=UIDropDownMenu_GetSelectedID(SS_GY_Dropdown) --光晕
		WRSet.SS_JYS=UIDropDownMenu_GetSelectedID(SS_JYS_Dropdown) --渐隐术
		WRSet.SS_SHZH=UIDropDownMenu_GetSelectedID(SS_SHZH_Dropdown) --守护之魂
		WRSet.SS_JWDY=UIDropDownMenu_GetSelectedID(SS_JWDY_Dropdown) --绝望祷言
		WRSet.SS_ZLS=UIDropDownMenu_GetSelectedID(SS_ZLS_Dropdown) --治疗石
		WRSet.SS_ZLYS=UIDropDownMenu_GetSelectedID(SS_ZLYS_Dropdown) --治疗药水
		WRSet.SS_SP1=UIDropDownMenu_GetSelectedID(SS_SP1_Dropdown) --饰品1
		WRSet.SS_SP2=UIDropDownMenu_GetSelectedID(SS_SP2_Dropdown) --饰品2
		WRSet.SS_SFSD=UIDropDownMenu_GetSelectedID(SS_SFSD_Dropdown) --施法速度
		
		WRSet.AY_ZNMB=UIDropDownMenu_GetSelectedID(AY_ZNMB_Dropdown) --智能目标
		WRSet.AY_AYCZ=UIDropDownMenu_GetSelectedID(AY_AYCZ_Dropdown) --暗影冲撞
		WRSet.AY_CM=UIDropDownMenu_GetSelectedID(AY_CM_Dropdown) --沉默
		WRSet.AY_DDMS=UIDropDownMenu_GetSelectedID(AY_DDMS_Dropdown) --打断模式
		WRSet.AY_JHJB=UIDropDownMenu_GetSelectedID(AY_JHJB_Dropdown) --净化疾病
		WRSet.AY_QSMF=UIDropDownMenu_GetSelectedID(AY_QSMF_Dropdown) --驱散魔法
		WRSet.AY_XLJX=UIDropDownMenu_GetSelectedID(AY_XLJX_Dropdown) --心灵尖啸
		WRSet.AY_NLGZ=UIDropDownMenu_GetSelectedID(AY_NLGZ_Dropdown) --能量灌注
		WRSet.AY_AYM=UIDropDownMenu_GetSelectedID(AY_AYM_Dropdown) --暗影魔
		WRSet.AY_XKBF=UIDropDownMenu_GetSelectedID(AY_XKBF_Dropdown) --虚空爆发
		WRSet.AY_XKHL=UIDropDownMenu_GetSelectedID(AY_XKHL_Dropdown) --虚空洪流
		WRSet.AY_SP=UIDropDownMenu_GetSelectedID(AY_SP_Dropdown) --饰品
		WRSet.AY_BFYS=UIDropDownMenu_GetSelectedID(AY_BFYS_Dropdown) --爆发药水
		WRSet.AY_XXGDYB=UIDropDownMenu_GetSelectedID(AY_XXGDYB_Dropdown) --吸血鬼的拥抱
		WRSet.AY_JYS=UIDropDownMenu_GetSelectedID(AY_JYS_Dropdown) --渐隐术
		WRSet.AY_ZYSD=UIDropDownMenu_GetSelectedID(AY_ZYSD_Dropdown) --真言术盾
		WRSet.AY_FHSG=UIDropDownMenu_GetSelectedID(AY_FHSG_Dropdown) --防护圣光
		WRSet.AY_JWDY=UIDropDownMenu_GetSelectedID(AY_JWDY_Dropdown) --绝望祷言
		WRSet.AY_XS=UIDropDownMenu_GetSelectedID(AY_XS_Dropdown) --消散
		WRSet.AY_ZLS=UIDropDownMenu_GetSelectedID(AY_ZLS_Dropdown) --治疗石
		WRSet.AY_ZLYS=UIDropDownMenu_GetSelectedID(AY_ZLYS_Dropdown) --治疗药水
	end


	if GetSpecialization()==1 then	--戒律专精
		if WRSet.JL_NLGZ~=nil and WRSet.JL_NLGZ~=5 then
			local Name,_=UnitName("Party"..WRSet.JL_NLGZ)
			if Name~=nil then
				if NLGZ_UnitName~=Name then
					print("|cffffdf00能量灌注：|cff00ff00"..Name)
				end
				NLGZ_UnitName=UnitName("Party"..WRSet.JL_NLGZ)
			end
		end
	end
	
	if GetSpecialization()==2 then	--神圣专精
		if WRSet.SS_NLGZ~=nil and WRSet.SS_NLGZ~=5 then
			local Name,_=UnitName("Party"..WRSet.SS_NLGZ)
			if Name~=nil then
				if NLGZ_UnitName~=Name then
					print("|cffffdf00能量灌注：|cff00ff00"..Name)
				end
				NLGZ_UnitName=UnitName("Party"..WRSet.SS_NLGZ)
			end
		end
	end
	
	if GetSpecialization()==3 then	--暗影专精
		if WRSet.AY_NLGZ~=nil and WRSet.AY_NLGZ~=5 then
			local Name,_=UnitName("Party"..WRSet.AY_NLGZ)
			if Name~=nil then
				if NLGZ_UnitName~=Name then
					print("|cffffdf00能量灌注：|cff00ff00"..Name)
				end
				NLGZ_UnitName=UnitName("Party"..WRSet.AY_NLGZ)
			end
		end
		if WRSet.AY_DDMS~=nil then
			InterruptTime=(WRSet.AY_DDMS-1)/10
		end
	end
end

--对应专精显示或隐藏
function WR_PriestFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--戒律专精
		JL_Frame:Show()
		SS_Frame:Hide()
		AY_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+12*35)
	end
	if GetSpecialization()==2 then	--神圣专精
		JL_Frame:Hide()
		SS_Frame:Show()
		AY_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+14*35)
	end
	if GetSpecialization()==3 then	--暗影专精
		JL_Frame:Hide()
		SS_Frame:Hide()
		AY_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+19*35)
	end
end