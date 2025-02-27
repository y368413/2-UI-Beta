--作者微信:WOW-Robot(转载请保留,感谢!)

--法师
function WR_Mage()
	WR_MageSettings() --初始化储存值
	WR_MageConfigFrame()	--创建的设置窗口
	WR_MageSettingsSave() --设置写入
	WR_MageFrameShowOrHide()	--对应专精显示或隐藏
	WR_MageFire() --火法运行库
	WR_MageArcane() --冰法运行库
end

--初始化储存值
function WR_MageSettings()
	if WRSet==nil then
		local Settings = {
			HF_ZNMB=1,	--智能目标
			HF_FSFZ=1,	--法术反制
			HF_DDMS=1,	--打断模式
			HF_BFYS=2,	--爆发药水
			HF_SP=4,	--饰品
			HF_LX=1,	--流星
			HF_JX=1,	--流星
			HF_LXS=1,	--龙息术
			HF_FSXQ=1,	--法术吸取
			HF_JCZZ=1,	--解除诅咒
			HF_LYHT=1,	--烈焰护体
			HF_ZLS=3,	--治疗石
			HF_ZLYS=2,	--治疗药水
			
			BF_ZNMB=1,	--智能目标
			BF_ZNJD=9,	--智能焦点
			BF_FSFZ=1,	--法术反制
			BF_DDMS=1,	--打断模式
			BF_JCZZ=1,	--解除诅咒
			BF_JX=4,	--镜像
			BF_QTPZ=5,	--群体屏障
			BF_HBPZ=3,	--寒冰屏障
			BF_QHYX=4,	--强化隐形
			BF_ZLS=2,	--治疗石
			BF_ZLYS=3,	--治疗药水
			BF_SP1=13,	--饰品1
			BF_SP2=13,	--饰品2
			BF_BFX=1,	--暴风雪
			BF_FSXQ=true,	--法术吸取
			BF_HBHT=true,	--寒冰护体
			BF_CJXX=true,	--超级新星
			BF_CJB=true,	--冲击波
			BF_BLXM=true,	--冰冷血脉
			BF_BYHN=true,	--变易幻能
			BF_JSLQ=true,	--急速冷却
			BF_FB=true,	--浮冰
			--BF_BXS=true,	--变形术
			--BF_BFYS=false,	--爆发药水
			--BF_CKSJ=false,	--操控时间
		}
		WRSet=Settings
	end
end

--设置写入
function WR_MageSettingsSave()
	if WRSet~=nil then
		WRSet.HF_ZNMB=UIDropDownMenu_GetSelectedID(HF_ZNMB_Dropdown) --智能目标
		WRSet.HF_FSFZ=UIDropDownMenu_GetSelectedID(HF_FSFZ_Dropdown) --法术反制
		WRSet.HF_DDMS=UIDropDownMenu_GetSelectedID(HF_DDMS_Dropdown) --打断模式
		WRSet.HF_BFYS=UIDropDownMenu_GetSelectedID(HF_BFYS_Dropdown) --爆发药水
		WRSet.HF_SP=UIDropDownMenu_GetSelectedID(HF_SP_Dropdown) --饰品
		WRSet.HF_LX=UIDropDownMenu_GetSelectedID(HF_LX_Dropdown) --流星
		WRSet.HF_JX=UIDropDownMenu_GetSelectedID(HF_JX_Dropdown) --流星
		WRSet.HF_LXS=UIDropDownMenu_GetSelectedID(HF_LXS_Dropdown) --龙息术
		WRSet.HF_FSXQ=UIDropDownMenu_GetSelectedID(HF_FSXQ_Dropdown) --法术吸取
		WRSet.HF_JCZZ=UIDropDownMenu_GetSelectedID(HF_JCZZ_Dropdown) --解除诅咒
		WRSet.HF_LYHT=UIDropDownMenu_GetSelectedID(HF_LYHT_Dropdown) --烈焰护体
		WRSet.HF_ZLS=UIDropDownMenu_GetSelectedID(HF_ZLS_Dropdown) --治疗石
		WRSet.HF_ZLYS=UIDropDownMenu_GetSelectedID(HF_ZLYS_Dropdown) --治疗药水
		
		
		WRSet.BF_ZNMB=UIDropDownMenu_GetSelectedID(BF_ZNMB_Dropdown) --智能目标
		WRSet.BF_ZNJD=UIDropDownMenu_GetSelectedID(BF_ZNJD_Dropdown) --智能焦点
		WRSet.BF_FSFZ=UIDropDownMenu_GetSelectedID(BF_FSFZ_Dropdown) --法术反制
		WRSet.BF_DDMS=UIDropDownMenu_GetSelectedID(BF_DDMS_Dropdown) --打断模式
		WRSet.BF_JCZZ=UIDropDownMenu_GetSelectedID(BF_JCZZ_Dropdown) --解除诅咒
		WRSet.BF_JX=UIDropDownMenu_GetSelectedID(BF_JX_Dropdown) --镜像
		WRSet.BF_QTPZ=UIDropDownMenu_GetSelectedID(BF_QTPZ_Dropdown) --群体屏障
		WRSet.BF_HBPZ=UIDropDownMenu_GetSelectedID(BF_HBPZ_Dropdown) --寒冰屏障
		WRSet.BF_QHYX=UIDropDownMenu_GetSelectedID(BF_QHYX_Dropdown) --强化隐形
		WRSet.BF_ZLS=UIDropDownMenu_GetSelectedID(BF_ZLS_Dropdown) --治疗石
		WRSet.BF_ZLYS=UIDropDownMenu_GetSelectedID(BF_ZLYS_Dropdown) --治疗药水
		WRSet.BF_SP1=UIDropDownMenu_GetSelectedID(BF_SP1_Dropdown) --饰品1
		WRSet.BF_SP2=UIDropDownMenu_GetSelectedID(BF_SP2_Dropdown) --饰品2
		WRSet.BF_BFX=UIDropDownMenu_GetSelectedID(BF_BFX_Dropdown) --暴风雪
		
		WRSet.BF_FSXQ=BF_FSXQ_Checkbox:GetChecked()	--法术吸取
		WRSet.BF_HBHT=BF_HBHT_Checkbox:GetChecked()	--寒冰护体
		WRSet.BF_CJXX=BF_CJXX_Checkbox:GetChecked()	--超级新星
		WRSet.BF_CJB=BF_CJB_Checkbox:GetChecked()	--冲击波
		
		WRSet.BF_BLXM=BF_BLXM_Checkbox:GetChecked()	--冰冷血脉
		WRSet.BF_BYHN=BF_BYHN_Checkbox:GetChecked()	--变易幻能
		WRSet.BF_JSLQ=BF_JSLQ_Checkbox:GetChecked()	--急速冷却
		WRSet.BF_FB=BF_FB_Checkbox:GetChecked()	--浮冰
		
		
		--WRSet.BF_BXS=BF_BXS_Checkbox:GetChecked()	--变形术
		
		--WRSet.BF_BFYS=BF_BFYS_Checkbox:GetChecked()	--爆发药水
		--WRSet.BF_CKSJ=BF_CKSJ_Checkbox:GetChecked()	--操控时间
	end
	if GetSpecialization()==2 then	--火法 专精
		if WRSet.HF_DDMS~=nil then
			InterruptTime=(WRSet.HF_DDMS-1)/10
		end
	elseif GetSpecialization()==3 then	--冰法 专精
		if WRSet.BF_DDMS~=nil then
			InterruptTime=(WRSet.BF_DDMS-1)/10
		end
	end
end

--对应专精显示或隐藏
function WR_MageFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--1 专精
		HF_Frame:Hide()
		BF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100)
	end
	if GetSpecialization()==2 then	--2 专精
		HF_Frame:Show()
		BF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+13*35)
	end
	if GetSpecialization()==3 then	--3 专精
		HF_Frame:Hide()
		BF_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+15*35)
	end
end
