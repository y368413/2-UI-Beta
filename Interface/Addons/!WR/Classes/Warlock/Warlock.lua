--作者微信:WOW-Robot(转载请保留,感谢!)

--术士
function WR_Warlock()
	WR_WarlockSettings() --初始化储存值
	WR_WarlockConfigFrame()	--创建的设置窗口
	WR_WarlockSettingsSave() --设置写入
	WR_WarlockFrameShowOrHide()	--对应专精显示或隐藏
	WR_WarlockDemonology() --恶魔术运行库
end

--初始化储存值
function WR_WarlockSettings()
	if WRSet==nil then
		local Settings = {
			EM_ZNMB=1,	--智能目标
			EM_NB=10,	--内爆
			EM_JFTZ=1,	--巨斧投掷
			EM_SWCR=1,	--死亡缠绕
			EM_DDMS=1,	--打断模式
			EM_BQCC=1,	--爆燃冲刺
			EM_BFYS=2,	--爆发药水
			EM_SP=4,	--饰品
			EM_HAQY=1,	--黑暗契约
			EM_BMJX=3,	--不灭决心
			EM_ZLS=3,	--治疗石
			EM_ZLYS=2,	--治疗药水
		}
		WRSet=Settings
	end
end

--设置写入
function WR_WarlockSettingsSave()
	if WRSet~=nil then
		WRSet.EM_ZNMB=UIDropDownMenu_GetSelectedID(EM_ZNMB_Dropdown) --智能目标
		WRSet.EM_NB=UIDropDownMenu_GetSelectedID(EM_NB_Dropdown) --内爆
		WRSet.EM_JFTZ=UIDropDownMenu_GetSelectedID(EM_JFTZ_Dropdown) --巨斧投掷
		WRSet.EM_SWCR=UIDropDownMenu_GetSelectedID(EM_SWCR_Dropdown) --死亡缠绕
		WRSet.EM_DDMS=UIDropDownMenu_GetSelectedID(EM_DDMS_Dropdown) --打断模式
		WRSet.EM_BQCC=UIDropDownMenu_GetSelectedID(EM_BQCC_Dropdown) --爆燃冲刺
		WRSet.EM_BFYS=UIDropDownMenu_GetSelectedID(EM_BFYS_Dropdown) --爆发药水
		WRSet.EM_SP=UIDropDownMenu_GetSelectedID(EM_SP_Dropdown) --饰品
		WRSet.EM_HAQY=UIDropDownMenu_GetSelectedID(EM_HAQY_Dropdown) --黑暗契约
		WRSet.EM_BMJX=UIDropDownMenu_GetSelectedID(EM_BMJX_Dropdown) --不灭决心
		WRSet.EM_ZLS=UIDropDownMenu_GetSelectedID(EM_ZLS_Dropdown) --治疗石
		WRSet.EM_ZLYS=UIDropDownMenu_GetSelectedID(EM_ZLYS_Dropdown) --治疗药水
	end
	if GetSpecialization()==2 then	--恶魔专精
		if WRSet.EM_DDMS~=nil then
			InterruptTime=(WRSet.EM_DDMS-1)/10
		end
	end
end

--对应专精显示或隐藏
function WR_WarlockFrameShowOrHide()
	if GetSpecialization()==1 then	--痛苦专精
		EM_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
	if GetSpecialization()==2 then	--恶魔专精
		EM_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+12*35)
	end
	if GetSpecialization()==3 then	--毁灭专精
		EM_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
end