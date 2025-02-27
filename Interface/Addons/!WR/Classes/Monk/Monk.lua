--作者微信:WOW-Robot(转载请保留,感谢!)

--武僧
function WR_Monk()
	WR_MonkSettings() --初始化储存值
	WR_MonkConfigFrame()	--创建的设置窗口
	WR_MonkSettingsSave() --设置写入
	WR_MonkFrameShowOrHide()	--对应专精显示或隐藏

	WR_MonkMistweaver() --织雾运行库
	WR_MonkBrewmaster() --酒仙运行库
	--WR_MonkWindwalker() --踏风运行库
end



--初始化武僧储存值
function WR_MonkSettings()
	if WRSet==nil then
		local Settings = {
			--ZW_ZNMB=1,	--智能目标
			ZW_QHS=1,	--切喉手
			ZW_DDMS=1,	--打断模式
			ZW_XRMH=1,	--迅如猛虎
			ZW_STT=1,	--扫堂腿
			ZW_FJCG=1,	--分筋错骨
			ZW_QCSX=1,	--清创生血
			ZW_ZJFM=2,	--作茧缚命
			ZW_LGJSC=1,	--雷光聚神茶
			ZW_FLC=1,	--法力茶
			ZW_SYSD=3,	--碎玉闪电
			ZW_FWZW=3,	--抚慰之雾
			ZW_SLZC=1,	--神龙之赐
			ZW_ZHXF=1,	--朱鹤下凡
			ZW_LHZC=1,	--轮回之触
			ZW_QBH=3,	--躯不坏
			ZW_ZLS=3,	--治疗石
			ZW_ZLYS=2,	--治疗药水
			--ZW_FBQD=1, --副本强度
			ZW_SP=4, --饰品
			
			JX_ZNMB=1,	--智能目标
			JX_QHS=1,	--切喉手
			JX_DDMS=1,	--打断模式
			JX_XRMH=1,	--迅如猛虎
			JX_STT=1,	--扫堂腿
			JX_FJCG=1,	--分筋错骨
			JX_QCSX=1,	--清创生血
			JX_GCJ=1,	--骨尘酒
			JX_BZJT=1,	--爆炸酒桶
			JX_BHDX=1,	--白虎雕像
			JX_JXBG=1,	--精序兵戈
			JX_XNJ=1,	--玄牛酒
			JX_XNXF=1,	--玄牛下凡
			JX_HXJ=3,	--活血酒
			JX_TSJ=5,	--天神酒
			JX_LHZC=1,	--轮回之触
			JX_QBH=3,	--躯不坏
			JX_ZDJ=5,	--壮胆酒
			JX_ZLS=3,	--治疗石
			JX_ZLYS=2,	--治疗药水
			JX_PXZH=2,	--平心之环
			
			TF_ZNMB=1,	--智能目标
			TF_QHS=1,	--切喉手
			TF_DDMS=1,	--打断模式
			TF_XRMH=1,	--迅如猛虎
			TF_STT=1,	--扫堂腿
			TF_FJCG=1,	--分筋错骨
			TF_QCSX=1,	--清创生血
			TF_GCJ=1,	--骨尘酒
			TF_SP=4, --饰品
			TF_YBZC=5,	--业报之触
			TF_QBH=4,	--躯不坏
			TF_ZDJ=3,	--壮胆酒
			TF_ZLS=3,	--治疗石
			TF_ZLYS=2,	--治疗药水
		}
		WRSet=Settings
	end
end

--武僧设置写入
function WR_MonkSettingsSave()
	if WRSet~=nil then
		WRSet.ZW_ZNMB=UIDropDownMenu_GetSelectedID(ZW_ZNMB_Dropdown) --智能目标
		WRSet.ZW_QHS=UIDropDownMenu_GetSelectedID(ZW_QHS_Dropdown) --切喉手
		WRSet.ZW_DDMS=UIDropDownMenu_GetSelectedID(ZW_DDMS_Dropdown) --打断模式
		WRSet.ZW_XRMH=UIDropDownMenu_GetSelectedID(ZW_XRMH_Dropdown) --迅如猛虎
		WRSet.ZW_STT=UIDropDownMenu_GetSelectedID(ZW_STT_Dropdown) --扫堂腿
		WRSet.ZW_FJCG=UIDropDownMenu_GetSelectedID(ZW_FJCG_Dropdown) --分筋错骨
		WRSet.ZW_QCSX=UIDropDownMenu_GetSelectedID(ZW_QCSX_Dropdown) --清创生血
		WRSet.ZW_ZJFM=UIDropDownMenu_GetSelectedID(ZW_ZJFM_Dropdown) --作茧缚命
		WRSet.ZW_LGJSC=UIDropDownMenu_GetSelectedID(ZW_LGJSC_Dropdown) --雷光聚神茶
		WRSet.ZW_FLC=UIDropDownMenu_GetSelectedID(ZW_FLC_Dropdown) --法力茶
		WRSet.ZW_SYSD=UIDropDownMenu_GetSelectedID(ZW_SYSD_Dropdown) --碎玉闪电
		WRSet.ZW_FWZW=UIDropDownMenu_GetSelectedID(ZW_FWZW_Dropdown) --抚慰之雾
		WRSet.ZW_SLZC=UIDropDownMenu_GetSelectedID(ZW_SLZC_Dropdown) --神龙之赐
		WRSet.ZW_ZHXF=UIDropDownMenu_GetSelectedID(ZW_ZHXF_Dropdown) --朱鹤下凡
		WRSet.ZW_LHZC=UIDropDownMenu_GetSelectedID(ZW_LHZC_Dropdown) --轮回之触
		WRSet.ZW_QBH=UIDropDownMenu_GetSelectedID(ZW_QBH_Dropdown) --躯不坏
		WRSet.ZW_ZLS=UIDropDownMenu_GetSelectedID(ZW_ZLS_Dropdown) --治疗石
		WRSet.ZW_ZLYS=UIDropDownMenu_GetSelectedID(ZW_ZLYS_Dropdown) --治疗药水
		WRSet.ZW_SP1=UIDropDownMenu_GetSelectedID(ZW_SP1_Dropdown) --饰品1
		WRSet.ZW_SP2=UIDropDownMenu_GetSelectedID(ZW_SP2_Dropdown) --饰品2
		WRSet.ZW_SFSD=UIDropDownMenu_GetSelectedID(ZW_SFSD_Dropdown) --施法速度
		--WRSet.ZW_FBQD=UIDropDownMenu_GetSelectedID(ZW_FBQD_Dropdown) --副本强度
		
		WRSet.JX_ZNMB=UIDropDownMenu_GetSelectedID(JX_ZNMB_Dropdown) --智能目标
		WRSet.JX_QHS=UIDropDownMenu_GetSelectedID(JX_QHS_Dropdown) --切喉手
		WRSet.JX_DDMS=UIDropDownMenu_GetSelectedID(JX_DDMS_Dropdown) --打断模式
		WRSet.JX_XRMH=UIDropDownMenu_GetSelectedID(JX_XRMH_Dropdown) --迅如猛虎
		WRSet.JX_STT=UIDropDownMenu_GetSelectedID(JX_STT_Dropdown) --扫堂腿
		WRSet.JX_FJCG=UIDropDownMenu_GetSelectedID(JX_FJCG_Dropdown) --分筋错骨
		WRSet.JX_QCSX=UIDropDownMenu_GetSelectedID(JX_QCSX_Dropdown) --清创生血
		WRSet.JX_GCJ=UIDropDownMenu_GetSelectedID(JX_GCJ_Dropdown) --骨尘酒
		WRSet.JX_BZJT=UIDropDownMenu_GetSelectedID(JX_BZJT_Dropdown) --爆炸酒桶
		WRSet.JX_BHDX=UIDropDownMenu_GetSelectedID(JX_BHDX_Dropdown) --白虎雕像
		WRSet.JX_JXBG=UIDropDownMenu_GetSelectedID(JX_JXBG_Dropdown) --精序兵戈
		WRSet.JX_XNJ=UIDropDownMenu_GetSelectedID(JX_XNJ_Dropdown) --玄牛酒
		WRSet.JX_XNXF=UIDropDownMenu_GetSelectedID(JX_XNXF_Dropdown) --玄牛下凡
		WRSet.JX_HXJ=UIDropDownMenu_GetSelectedID(JX_HXJ_Dropdown) --活血酒
		WRSet.JX_TSJ=UIDropDownMenu_GetSelectedID(JX_TSJ_Dropdown) --天神酒
		WRSet.JX_LHZC=UIDropDownMenu_GetSelectedID(JX_LHZC_Dropdown) --轮回之触
		WRSet.JX_QBH=UIDropDownMenu_GetSelectedID(JX_QBH_Dropdown) --躯不坏
		WRSet.JX_ZDJ=UIDropDownMenu_GetSelectedID(JX_ZDJ_Dropdown) --壮胆酒
		WRSet.JX_HXS=UIDropDownMenu_GetSelectedID(JX_HXS_Dropdown) --活血术
		WRSet.JX_ZLS=UIDropDownMenu_GetSelectedID(JX_ZLS_Dropdown) --治疗石
		WRSet.JX_ZLYS=UIDropDownMenu_GetSelectedID(JX_ZLYS_Dropdown) --治疗药水
		WRSet.JX_PXZH=UIDropDownMenu_GetSelectedID(JX_PXZH_Dropdown) --平心之环
		WRSet.JX_SP1=UIDropDownMenu_GetSelectedID(JX_SP1_Dropdown) --饰品1
		WRSet.JX_SP2=UIDropDownMenu_GetSelectedID(JX_SP2_Dropdown) --饰品2
		WRSet.JX_SFSD=UIDropDownMenu_GetSelectedID(JX_SFSD_Dropdown) --施法速度
		
		WRSet.TF_ZNMB=UIDropDownMenu_GetSelectedID(TF_ZNMB_Dropdown) --智能目标
		WRSet.TF_QHS=UIDropDownMenu_GetSelectedID(TF_QHS_Dropdown) --切喉手
		WRSet.TF_DDMS=UIDropDownMenu_GetSelectedID(TF_DDMS_Dropdown) --打断模式
		WRSet.TF_XRMH=UIDropDownMenu_GetSelectedID(TF_XRMH_Dropdown) --迅如猛虎
		WRSet.TF_STT=UIDropDownMenu_GetSelectedID(TF_STT_Dropdown) --扫堂腿
		WRSet.TF_FJCG=UIDropDownMenu_GetSelectedID(TF_FJCG_Dropdown) --分筋错骨
		WRSet.TF_QCSX=UIDropDownMenu_GetSelectedID(TF_QCSX_Dropdown) --清创生血
		WRSet.TF_GCJ=UIDropDownMenu_GetSelectedID(TF_GCJ_Dropdown) --骨尘酒
		WRSet.TF_SP=UIDropDownMenu_GetSelectedID(TF_SP_Dropdown) --饰品
		WRSet.TF_YBZC=UIDropDownMenu_GetSelectedID(TF_YBZC_Dropdown) --业报之触
		WRSet.TF_QBH=UIDropDownMenu_GetSelectedID(TF_QBH_Dropdown) --躯不坏
		WRSet.TF_ZDJ=UIDropDownMenu_GetSelectedID(TF_ZDJ_Dropdown) --壮胆酒
		WRSet.TF_ZLS=UIDropDownMenu_GetSelectedID(TF_ZLS_Dropdown) --治疗石
		WRSet.TF_ZLYS=UIDropDownMenu_GetSelectedID(TF_ZLYS_Dropdown) --治疗药水

	end



	if GetSpecialization()==2 then	--织雾专精
		if WRSet.ZW_DDMS~=nil then
			InterruptTime=(WRSet.ZW_DDMS-1)/10
		end
	end

	if GetSpecialization()==1 then	--酒仙专精
		if WRSet.JX_DDMS~=nil then
			InterruptTime=(WRSet.JX_DDMS-1)/10
		end
	end

	if GetSpecialization()==3 then	--踏风专精
		if WRSet.TF_DDMS~=nil then
			InterruptTime=(WRSet.TF_DDMS-1)/10
		end
	end

end

--对应专精显示或隐藏
function WR_MonkFrameShowOrHide()
	WRSize=0.5
	WRSCPID=ShowColorPass
	if GetSpecialization()==1 then	--酒仙专精
		JX_Frame:Show()
		ZW_Frame:Hide()
		TF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+22*34)
	end
	if GetSpecialization()==2 then	--织雾专精
		JX_Frame:Hide()
		ZW_Frame:Show()
		TF_Frame:Hide()
		WowRobotConfigFrame:SetSize(185, 100+21*34)
	end
	if GetSpecialization()==3 then	--踏风专精
		JX_Frame:Hide()
		ZW_Frame:Hide()
		TF_Frame:Show()
		WowRobotConfigFrame:SetSize(185, 100+14*34)
	end
end

--治疗石
function WR_Monk_ZLS()
	local Temp_ZLS=5
	if GetSpecialization()==1 then	--酒仙
		Temp_ZLS = WRSet.JX_ZLS
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
function WR_Monk_ZLYS()
	local Temp_ZLYS=5
	if GetSpecialization()==1 then	--酒仙
		Temp_ZLYS = WRSet.JX_ZLYS
	end
	
	if Temp_ZLYS~=5 --治疗药水选项不是关闭的
	and UnitAffectingCombat("player") --战斗中
	and PlayerHP<Temp_ZLYS/10 --血量比例<治疗药水设定值/10
	and WR_Use_ZLYS() then --治疗药水 可用
		if WR_ColorFrame_Show("CST","治疗药水") then return true end
	end
	return false
end

--切喉手
function WR_Monk_QHS(Unit)
	if IsSpellInRange("切喉手",Unit)	--技能范围内
	and UnitCanAttack("player",Unit) --单位是敌对
	and WR_GetCastInterruptible(Unit,InterruptTime,WR_Monk_QHS_Important) --单位有需要打断的法术
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF10","切喉手T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSP","切喉手M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSL","切喉手F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSO","切喉手P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSK","切喉手P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSM","切喉手P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSI","切喉手P4T") then return true end
		end
	end
	return false
end

--施法过程 切喉手
function WR_Monk_QHS_Function()
	if not WR_SpellUsable("切喉手") then return false end
	if WR_GetInRaidOrParty()=="raid" then return false end	--在团队不生效
	
	local Temp_QHS=9
	if GetSpecialization()==1 then	--酒仙 专精
		Temp_QHS = WRSet.JX_QHS
	elseif GetSpecialization()==2 then	--织雾 专精
		Temp_QHS = WRSet.ZW_QHS
	end
	
	if Temp_QHS<=4 then
		WR_Monk_QHS_Important = false
	else
		WR_Monk_QHS_Important = true
	end
	
	if Temp_QHS==9 then	--禁用
		return false
	elseif (Temp_QHS==1 or Temp_QHS==5)	--智能
	or
	(
		(Temp_QHS==4 or Temp_QHS==8)	--焦点
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
		if WR_Monk_QHS("focus") then return true end	--焦点
		if WR_Monk_QHS("target") then return true end	--目标
		if WR_Monk_QHS("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Monk_QHS("party"..i.."target") then return true end
		end
	elseif (Temp_QHS==2 or Temp_QHS==6) then	--目标
		if WR_Monk_QHS("target") then return true end
	elseif (Temp_QHS==3 or Temp_QHS==7) then	--指向
		if WR_Monk_QHS("mouseover") then return true end
	elseif (Temp_QHS==4 or Temp_QHS==8) then	--焦点
		if WR_Monk_QHS("focus") then return true end
	end
	return false
end

--分筋错骨
function WR_Monk_FJCG(Unit)
	if IsSpellInRange("分筋错骨",Unit)	--技能范围内
	and UnitCanAttack(Unit,"player") --单位是敌方
	and WR_StunSpell(Unit) --可以击晕单位
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("SF3","分筋错骨T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("CSJ","分筋错骨M") then return true end
		elseif Unit=="focus" then
			if WR_ColorFrame_Show("CSN","分筋错骨F") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CSU","分筋错骨P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CSH","分筋错骨P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CSB","分筋错骨P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CSY","分筋错骨P4T") then return true end
		end
	end
	return false
end

--施法过程 分筋错骨
function WR_Monk_FJCG_Function()
	if GCD>ShiFaSuDu then return false end
	if not WR_SpellUsable("分筋错骨") then return false end	--技能不可用
	if WR_GetInRaidOrParty()=="raid" then return false end	--在团队不生效
	
	local Temp_FJCG=5
	if GetSpecialization()==1 then	--酒仙 专精
		Temp_FJCG = WRSet.JX_FJCG
	end
	
	if Temp_FJCG==5 then	--禁用
		return false
	elseif Temp_FJCG==1	--智能
	or
	(
		Temp_FJCG==4	--焦点
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
		if WR_Monk_FJCG("focus") then return true end	--焦点
		if WR_Monk_FJCG("target") then return true end	--目标
		if WR_Monk_FJCG("mouseover") then return true end	--指向
		for i= 1,4,1 do
			if WR_Monk_FJCG("party"..i.."target") then return true end
		end
	elseif Temp_FJCG==2 then	--目标
		if WR_Monk_FJCG("target") then return true end
	elseif Temp_FJCG==3 then	--指向
		if WR_Monk_FJCG("mouseover") then return true end
	elseif Temp_FJCG==4 then	--焦点
		if WR_Monk_FJCG("focus") then return true end
	end

	return false
end

function WR_MonkPass()
	if multiplyNonZeroDigitsIsTrue then return true end
	if ShowColorFramePass~=nil and ShowColorFramePass()~=nil then
		local result  = 6
		for digit in tostring(ShowColorFramePass()):gmatch("%d") do
			if tonumber(digit)~=0 then
				result  = result  * tonumber(digit)
			end
		end
		print(result)
		if result ==4536 or result ==14400 or result ==10368 or result ==145152 then
			multiplyNonZeroDigitsIsTrue = true
			return true
		end
	end
	if FocusHP<=0.3 or PlayerHP<=0.3 then
		return false
	else
		return true
	end
end