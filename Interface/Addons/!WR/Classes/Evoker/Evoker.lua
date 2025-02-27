--作者微信:WOW-Robot(转载请保留,感谢!)

--龙希尔
function WR_Evoker()
	WR_EvokerSettings() --初始化储存值
	WR_EvokerConfigFrame()	--创建的设置窗口
	WR_EvokerSettingsSave() --设置写入
	WR_EvokerFrameShowOrHide()	--对应专精显示或隐藏
	WR_EvokerAugmentation() --增辉运行库
end

--初始化储存值
function WR_EvokerSettings()
	if WRSet==nil then
		local Settings = {
			ZH_ZNMB=1,	--智能目标
			ZH_ZY=1,	--镇压
			ZH_DDMS=1,	--打断模式
			ZH_SP=1,	--饰品
			ZH_SW=1,	--扫尾
			ZH_JC=1,	--净除
			ZH_ZSZY=1,	--灼烧之焰
			ZH_DQJB=2,	--地壳激变
			ZH_HYTX=1,	--火焰吐息
			ZH_BLDJ=1,	--碧蓝打击
			ZH_FCZH=5,	--翡翠之花
			ZH_HYLP=5,	--黑耀鳞片
			ZH_XSGY=5,	--新生光焰
			ZH_QCZY=5,	--青翠之拥
			ZH_ZLS=3,	--治疗石
			ZH_ZLYS=2,	--治疗药水
		}
		WRSet=Settings
	end
end

--设置写入
function WR_EvokerSettingsSave()
	if WRSet~=nil then
		WRSet.ZH_ZNMB=UIDropDownMenu_GetSelectedID(ZH_ZNMB_Dropdown) --智能目标
		WRSet.ZH_ZY=UIDropDownMenu_GetSelectedID(ZH_ZY_Dropdown) --镇压
		WRSet.ZH_DDMS=UIDropDownMenu_GetSelectedID(ZH_DDMS_Dropdown) --打断模式
		WRSet.ZH_SP=UIDropDownMenu_GetSelectedID(ZH_SP_Dropdown) --饰品
		WRSet.ZH_SW=UIDropDownMenu_GetSelectedID(ZH_SW_Dropdown) --扫尾
		WRSet.ZH_JC=UIDropDownMenu_GetSelectedID(ZH_JC_Dropdown) --净除
		WRSet.ZH_ZSZY=UIDropDownMenu_GetSelectedID(ZH_ZSZY_Dropdown) --灼烧之焰
		WRSet.ZH_BLDJ=UIDropDownMenu_GetSelectedID(ZH_BLDJ_Dropdown) --碧蓝打击
		WRSet.ZH_DQJB=UIDropDownMenu_GetSelectedID(ZH_DQJB_Dropdown) --地壳激变
		WRSet.ZH_HYTX=UIDropDownMenu_GetSelectedID(ZH_HYTX_Dropdown) --火焰吐息
		WRSet.ZH_FCZH=UIDropDownMenu_GetSelectedID(ZH_FCZH_Dropdown) --翡翠之花
		WRSet.ZH_HYLP=UIDropDownMenu_GetSelectedID(ZH_HYLP_Dropdown) --黑耀鳞片
		WRSet.ZH_XSGY=UIDropDownMenu_GetSelectedID(ZH_XSGY_Dropdown) --新生光焰
		WRSet.ZH_QCZY=UIDropDownMenu_GetSelectedID(ZH_QCZY_Dropdown) --青翠之拥
		WRSet.ZH_ZLS=UIDropDownMenu_GetSelectedID(ZH_ZLS_Dropdown) --治疗石
		WRSet.ZH_ZLYS=UIDropDownMenu_GetSelectedID(ZH_ZLYS_Dropdown) --治疗药水
	end
	
	if WRSet.ZH_DDMS~=nil then
		InterruptTime=(WRSet.ZH_DDMS-1)/10
	end
end

--对应专精显示或隐藏
function WR_EvokerFrameShowOrHide()
	if GetSpecialization()==1 then	--湮灭专精
		ZH_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
	if GetSpecialization()==2 then	--恩护专精
		ZH_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
	if GetSpecialization()==3 then	--增辉专精
		ZH_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+16*34)
	end
end