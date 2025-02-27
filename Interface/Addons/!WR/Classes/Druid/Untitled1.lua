	
----目标战斗检测，如果满足条件，则不再往下执行操作-------------------------------------------------------------
	if 
	not(
		UnitExists("target")
		--单位存在
		and
		not(UnitIsDead("target"))
		--单位存活
		and
		UnitCanAttack("player","target")
		--单位敌对
		and
		TargetInCombat
		--单位战斗
		and
		IsSpellInRange("月火术","target")==1
		--单位在技能范围内
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return
	end
----目标战斗检测，如果满足条件，则不再往下执行操作-------------------------------------------------------------

	--饰品1--------------------------------------------------------------------------------------------	
	if (WRSet.PH_SP==1 or WRSet.PH_SP==3)
	--使用1号饰品 或 使用1-2号饰品
	and HuaShenBuffTime>10
	--化身BUFF时间>10秒
	and WR_GetEquipCD(13) then
	--1号饰品可以使用
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("ACF1","饰品1",zhandoumoshi) --显示指定色块窗体
		return
	end
	--饰品1--------------------------------------------------------------------------------------------	
	--饰品2--------------------------------------------------------------------------------------------	
		if (WRSet.PH_SP==2 or WRSet.PH_SP==3)
		--使用2号饰品 或 使用1-2号饰品
		and HuaShenBuffTime>10
		--化身BUFF时间>10秒
		and WR_GetEquipCD(14) then
		--2号饰品可以使用
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACF2","饰品2",zhandoumoshi) --显示指定色块窗体
			return
		end
	--饰品2--------------------------------------------------------------------------------------------	

----单体循环--------------------------------------------------------------------------------------------------------------------------		
	if 
    (
        WRSet.PH_XHLX==1
        --循环类型 智能
        and
        (
            HUCountRange45<=1
            --45码数量<=1
            or
            SingleUnit
            --是单体目标
        )
    )
    or
    WRSet.PH_XHLX==2
    --循环类型 单体
	then
		--防溢星涌-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYong()
		--星涌术 施法条件
		and
		NextPower>=80
		--星界能量>=80
		and
		(
			RiShiBuffTime>GCD
			--日蚀时间>公共冷却时间
			or
			YueShiBuffTime>GCD
			--月蚀时间>公共冷却时间
			or
			(
				FenNuCount==1
				--愤怒次数==1
				and
				FenNuCasting
				--正在施放愤怒
			)
			or
			(
				XingHuoShuCount==1
				--星火术次数==1
				and
				XingHuoShuCasting
				--正在施放星火术
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN9","S消领主",zhandoumoshi) --显示指定色块窗体
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","S防溢星涌",zhandoumoshi) --显示指定色块窗体
			return
		end
		--防溢星涌-------------------------------------------------------------------------------------------------
	
		--月火术-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(8921)
		--已学技能 月火术
		and
		TargetDeathTime>=6
		--目标死亡时间>=6秒
		and
		WR_CanDot()
		--可以上DOT的单位
		and
		YueHuoShuDebuffTime<=6.6
		--月火术debuff剩余时间
		and
		(
			(YueShiBuffTime==0 and RiShiBuffTime==0)
			or
			YueShiBuffTime>2
			or
			RiShiBuffTime>2
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","S月火术",zhandoumoshi) --显示指定色块窗体
			return
		end
		--月火术-------------------------------------------------------------------------------------------------	

		--阳炎术-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(93402)
		--已学技能 阳炎术
		and
		TargetDeathTime>=6
		--目标死亡时间>=6秒
		and
		WR_CanDot()
		--可以上DOT的单位
		and
		YangYanShuDebuffTime<=5.4
		--阳炎术debuff剩余时间
		and
		(
			(YueShiBuffTime==0 and RiShiBuffTime==0)
			or
			YueShiBuffTime>2
			or
			RiShiBuffTime>2
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF9","S阳炎术",zhandoumoshi) --显示指定色块窗体
			return
		end
		--阳炎术-------------------------------------------------------------------------------------------------	
	
		--化身：艾露恩之眷-------------------------------------------------------------------------------------------------
		if WRSet.PH_HS==1
		--化身 开启
		and
		zhandoumoshi==1
		--开爆发
		and
		HuaShenBuffTime==0
		--化身不存在
		and
		IsPlayerSpell(102560)
		--已学技能 化身：艾露恩之眷
		and
		WR_GetSpellCD("化身：艾露恩之眷")<=GCD
		--技能冷却
		then
			--迷梦-------------------------------------------------------------------------------
			if 
			(
				MM_BuffCount==2
				--迷梦BUFF层数==2
				or
				(
					MM_BuffCount==1
					--迷梦BUFF层数==1
					and
					UnitCastingInfo("player")~="星火术"
					--当前施法不是星火术
					and
					UnitCastingInfo("player")~="愤怒"
					--当前施法不是愤怒
				)
			)
			then
				--迷梦星火-----------------------------------------------------------------------
				if WR_DruidBalance_XingHuoShu()
				--星火术 施法条件
				and
				XingHuoShuCastTime<YueShiBuffTime
				--星火术施法时间<月蚀BUFF剩余时间
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("SF2","S迷梦星火",zhandoumoshi) --显示指定色块窗体
					return
				end
				--迷梦星火-----------------------------------------------------------------------
				
				--迷梦愤怒-----------------------------------------------------------------------
				if WR_DruidBalance_FenNu()
				--愤怒 施法条件
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF11","S迷梦愤怒",zhandoumoshi) --显示指定色块窗体
					return
				end
				--迷梦愤怒-----------------------------------------------------------------------
			end
			--迷梦-------------------------------------------------------------------------------
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSI","S化身",zhandoumoshi) --显示指定色块窗体
			return
		end
		--化身：艾露恩之眷-------------------------------------------------------------------------------------------------	
	
		--星涌术-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		and
		AoNengCount>=560
		--原始奥能脉冲星>=560
		and
		WR_DruidBalance_XingYong()
		--星涌术 施法条件
		and
		(
			(
				IsPlayerSpell(202770)
				--已学艾露恩之怒
				and
				CD_ALEZN<=GCD
				--艾露恩之怒CD好了
			)
			or
			(
				IsPlayerSpell(274281)
				--已学新月
				and
				ManYue>=1
				--满月次数>=1
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN9","S消领主",zhandoumoshi) --显示指定色块窗体
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","S星涌奥能",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星涌术-------------------------------------------------------------------------------------------------
	
		--艾露恩的战士-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		--开爆发
		and
		IsPlayerSpell(202425)
		--已学[艾露恩的战士]
		and
		WR_GetSpellCD("艾露恩的战士")<=GCD
		--技能冷却
		and
		RiShiBuffTime<=7
		--日蚀BUFF时间<=7秒
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","S艾战",zhandoumoshi) --显示指定色块窗体
			return
		end
		--艾露恩的战士-------------------------------------------------------------------------------------------------

		--星火术-------------------------------------------------------------------------------------------------
		if 
		WR_DruidBalance_XingHuoShu_InEclipse()
		--星火术 进蚀 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","S星火蚀",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星火术-------------------------------------------------------------------------------------------------
	
		--艾露恩之怒-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_ALEZN()
		--艾露恩之怒 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","S艾怒",zhandoumoshi) --显示指定色块窗体
			return
		end
		--艾露恩之怒-------------------------------------------------------------------------------------------------
	
		--星涌术-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYong()
		--星涌术 施法条件 
		and
		(
			XCLZ_BuffCount<3
			--星辰领主BUFF层数<3
			or
			NextPower>=88
			--星界能量>=88
			or
			(
				XingJiePower>70
				--星界能量>70
				and
				(
					(YueShiBuffTime>0 and YueShiBuffTime<4)
					--月蚀<4秒
					or
					(RiShiBuffTime>0 and RiShiBuffTime<4)
					--日蚀<4秒
				)
				--目的是不让在非蚀期间能量溢出
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("ACN9","S消领主",zhandoumoshi) --显示指定色块窗体
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","S星涌",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星涌术-------------------------------------------------------------------------------------------------
	
		--新月 半月 满月-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYue()
		--新月 施法条件
		and
		(
			XinYue>=1
			--新月可用次数
			or
			BanYue>=1
			--半月可用次数
			or
			ManYue>=1
			--满月可用次数
		)
		and
		(
			NextMoonCastTime+GCD<YueShiBuffTime
			--下一个新月施法时间<月蚀剩余时间
			or
			NextMoonCastTime+GCD<RiShiBuffTime
			--下一个新月施法时间<日蚀剩余时间
		)
		and
		(
			NextMoonCastTime+GCD<HuaShenBuffTime
			--下一个新月施法时间<化身剩余时间
			or
			(
				GetSpellCharges("新月")==3
				and
				(
					AoNengCount<520
					--原始奥能脉冲星<520
					or
					CD_HS>10
					--化身CD>10秒
				)
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF7","S月",zhandoumoshi) --显示指定色块窗体
			return
		end
		--新月 半月 满月-------------------------------------------------------------------------------------------------
	
		--野性蘑菇-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(88747)
		--已学[野性蘑菇]
		and
		PlayerMove
		--单位移动
		and
		WR_GetUnitDebuffInfo("target","阑珊暮光",true)==0
		--目标Debuff 阑珊暮光 不存在
		and
		WR_GetUnitDebuffInfo("target","真菌蔓延",true)==0
		--目标Debuff 真菌蔓延 不存在
		and
		WR_LastSpellName~="野性蘑菇"
		--最后一个技能不是 野性蘑菇
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF10","S蘑菇",zhandoumoshi) --显示指定色块窗体
			return
		end
		--野性蘑菇-------------------------------------------------------------------------------------------------
	
		--愤怒-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_FenNu()
		--愤怒 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","S愤怒",zhandoumoshi) --显示指定色块窗体
			return
		end
		--愤怒-------------------------------------------------------------------------------------------------
	end	
----单体循环--------------------------------------------------------------------------------------------------------------------------			

----AOE循环--------------------------------------------------------------------------------------------------------------------------
	if 
	(
		WRSet.PH_XHLX==1
		--循环类型 智能
		and
		HUCountRange45>=2
		--45码数量>=2
		and
		not(SingleUnit)
		--不是单体目标
	)
	or
	WRSet.PH_XHLX==3
	--循环类型 AOE
	then
		--防溢星落-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingLuo()
		--星落 施法条件
		and
		NextPower>=80
		--星界能量>=80
		and
		(
			--这段是为了让星落打在蚀内
			RiShiBuffTime>GCD
			--日蚀时间>公共冷却时间
			or
			YueShiBuffTime>GCD
			--月蚀时间>公共冷却时间
			or
			(
				FenNuCount==1
				--愤怒次数==1
				and
				FenNuCasting
				--正在施放愤怒
			)
			or
			(
				XingHuoShuCount==1
				--星火术次数==1
				and
				XingHuoShuCasting
				--正在施放星火术
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF1","A防溢星落",zhandoumoshi) --显示指定色块窗体
			return
		end
		--防溢星落-------------------------------------------------------------------------------------------------
		
		--月火术-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(8921)
		--已学技能 月火术
		and
		TargetDeathTime>=6
		--目标死亡时间>=6秒
		and
		WR_CanDot()
		--可以上DOT的单位
		and
		YueHuoShuDebuffTime==0
		--目标Debuff 月火术 不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF8","A月火术",zhandoumoshi) --显示指定色块窗体
			return
		end
		--月火术-------------------------------------------------------------------------------------------------	

		--阳炎术-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(93402)
		--已学技能 阳炎术
		and
		TargetDeathTime>=6
		--目标死亡时间>=6秒
		and
		WR_CanDot()
		--可以上DOT的单位
		and
		YangYanShuDebuffTime==0
		--目标Debuff 阳炎术 不存在
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF9","A阳炎术",zhandoumoshi) --显示指定色块窗体
			return
		end
		--阳炎术-------------------------------------------------------------------------------------------------	

		--化身：艾露恩之眷-------------------------------------------------------------------------------------------------
		if WRSet.PH_HS==1
		--化身 开启
		and
		zhandoumoshi==1
		--开爆发
		and
		HuaShenBuffTime==0
		--化身不存在
		and
		IsPlayerSpell(102560)
		--已学技能 化身：艾露恩之眷
		and
		WR_GetSpellCD("化身：艾露恩之眷")<=GCD
		--技能冷却
		then
			--迷梦-------------------------------------------------------------------------------
			if 
			(
				MM_BuffCount==2
				--迷梦BUFF层数==2
				or
				(
					MM_BuffCount==1
					--迷梦BUFF层数==1
					and
					UnitCastingInfo("player")~="星火术"
					--当前施法不是星火术
					and
					UnitCastingInfo("player")~="愤怒"
					--当前施法不是愤怒
				)
			)
			then
				--迷梦星火-----------------------------------------------------------------------
				if WR_DruidBalance_XingHuoShu()
				--星火术 施法条件
				and
				XingHuoShuCastTime<YueShiBuffTime
				--星火术施法时间<月蚀BUFF剩余时间
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("SF2","A迷梦星火",zhandoumoshi) --显示指定色块窗体
					return
				end
				--迷梦星火-----------------------------------------------------------------------
				
				--迷梦愤怒-----------------------------------------------------------------------
				if WR_DruidBalance_FenNu()
				--愤怒 施法条件
				and
				FenNuCastTime<RiShiBuffTime
				--愤怒施法时间<日蚀BUFF剩余时间
				then
					WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
					WR_ShowColorFrame("CF11","A迷梦愤怒",zhandoumoshi) --显示指定色块窗体
					return
				end
				--迷梦愤怒-----------------------------------------------------------------------
			end
			--迷梦-------------------------------------------------------------------------------
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSI","A化身",zhandoumoshi) --显示指定色块窗体
			return
		end
		--化身：艾露恩之眷-------------------------------------------------------------------------------------------------	
	
		--艾露恩的战士-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		--开爆发
		and
		IsPlayerSpell(202425)
		--已学[艾露恩的战士]
		and
		WR_GetSpellCD("艾露恩的战士")<=GCD
		--技能冷却
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF6","A艾战",zhandoumoshi) --显示指定色块窗体
			return
		end
		--艾露恩的战士-------------------------------------------------------------------------------------------------

		--星火术-------------------------------------------------------------------------------------------------
		if HUCountRange45==2
		--==2目标进日蚀
		and
		WR_DruidBalance_XingHuoShu_InEclipse()
		--星火术 进蚀 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","A星火蚀",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星火术-------------------------------------------------------------------------------------------------
		
		--愤怒-------------------------------------------------------------------------------------------------
		if HUCountRange45>=3
		-->=3目标进月蚀
		and
		WR_DruidBalance_FenNu_InEclipse()
		--愤怒 进蚀 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","A愤怒蚀",zhandoumoshi) --显示指定色块窗体
			return
		end
		--愤怒-------------------------------------------------------------------------------------------------
		
		--野性蘑菇-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(88747)
		--已学[野性蘑菇]
		and
		WR_GetSpellCD("野性蘑菇")<=GCD
		--技能冷却
		and
		NextPower<80
		--星界能量<80
		and
		WR_GetUnitDebuffInfo("target","阑珊暮光",true)==0
		--目标Debuff 阑珊暮光 不存在
		and
		WR_GetUnitDebuffInfo("target","真菌蔓延",true)==0
		--目标Debuff 真菌蔓延 不存在
		and
		WR_LastSpellName~="野性蘑菇"
		--最后一个技能不是 野性蘑菇
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF10","A蘑菇",zhandoumoshi) --显示指定色块窗体
			return
		end
		--野性蘑菇-------------------------------------------------------------------------------------------------
		
		--艾露恩之怒-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_ALEZN()
		--艾露恩之怒 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF3","A艾怒",zhandoumoshi) --显示指定色块窗体
			return
		end
		--艾露恩之怒-------------------------------------------------------------------------------------------------
		
		--星辰坠落-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingLuo() then
		--星落 施法条件
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF1","A星落",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星辰坠落-------------------------------------------------------------------------------------------------
		
		--星涌术
		if not(IsPlayerSpell(191034))
		--没学习星辰坠落
		and
		WR_DruidBalance_XingYong()
		--星涌术 施法条件
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF7","A星涌",zhandoumoshi) --显示指定色块窗体
			return
		end
	
		--新月 半月 满月-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYue()
		--新月 施法条件
		then
			--满月-------------------------------------------------------------------------------------------------
			if ManYue>=1
			--满月可用次数
			and
			(
				NextMoonCastTime+GCD<YueShiBuffTime
				--下一个新月施法时间<月蚀剩余时间
				or
				NextMoonCastTime+GCD<RiShiBuffTime
				--下一个新月施法时间<日蚀剩余时间
			)
			and
			(
				NextMoonCastTime+GCD<HuaShenBuffTime
				--下一个新月施法时间<化身剩余时间
				or
				(
					GetSpellCharges("新月")==3
					and
					(
						AoNengCount<520
						--原始奥能脉冲星<520
						or
						CD_HS>10
						--化身CD>10秒
					)
				)
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF7","A满月",zhandoumoshi) --显示指定色块窗体
				return
			end
			--满月-------------------------------------------------------------------------------------------------
			
			--半月-------------------------------------------------------------------------------------------------
			if BanYue>=1
			--半月可用次数
			and
			(
				NextMoonCastTime+GCD<YueShiBuffTime
				--下一个新月施法时间<月蚀剩余时间
				or
				NextMoonCastTime+GCD<RiShiBuffTime
				--下一个新月施法时间<日蚀剩余时间
			)
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF7","A半月",zhandoumoshi) --显示指定色块窗体
				return
			end
			--半月-------------------------------------------------------------------------------------------------
			
			--新月-------------------------------------------------------------------------------------------------
			if XinYue>=1
			--新月可用次数
			then
				WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
				WR_ShowColorFrame("SF7","A新月",zhandoumoshi) --显示指定色块窗体
				return
			end
			--新月-------------------------------------------------------------------------------------------------
		end
		--新月 半月 满月-------------------------------------------------------------------------------------------------
		
		--星火术-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingHuoShu()
		--星火术 施法条件
		and
		(
			XingHuoShuCastTime<YueShiBuffTime
			--星火术施法时间<月蚀BUFF剩余时间
			or
			(
				XingHuoShuCastTime<HuaShenBuffTime
				--星火术施法时间<化身BUFF剩余时间
				and
				HUCountRange45>=4
				--目标>=4
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("SF2","A星火术",zhandoumoshi) --显示指定色块窗体
			return
		end
		--星火术-------------------------------------------------------------------------------------------------
		
		--愤怒-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_FenNu()
		--愤怒 施法条件
		and
		(
			FenNuCastTime<RiShiBuffTime
			--愤怒施法时间<日蚀BUFF剩余时间
			or
			(
				FenNuCastTime<HuaShenBuffTime
				--愤怒施法时间<化身BUFF剩余时间
				and
				HUCountRange45<=3
				--目标<=3
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CF11","A愤怒",zhandoumoshi) --显示指定色块窗体
			return
		end
		--愤怒-------------------------------------------------------------------------------------------------
	end
----AOE循环--------------------------------------------------------------------------------------------------------------------------

	--移动月火-------------------------------------------------------------------------------------------------
	if WRSet.PH_YDYH==1
	--移动月火 开启
	and
	IsPlayerSpell(8921)
	--已学技能 月火术
	and
	PlayerMove
	--单位移动
	then
		WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
		WR_ShowColorFrame("CF8","A移动月火",zhandoumoshi) --显示指定色块窗体
		return
	end
	--移动月火-------------------------------------------------------------------------------------------------




























































--是否切换目标
function WR_DruidBalance_TabUnit(Unit)
	if not(WR_TargetInCombat(Unit)) then
	--如果单位没进战斗
		return false
	end
	
	if UnitGUID("target")==UnitGUID(Unit) then
	--如果我当前单位==判断切换的单位
		return false
	end
	
	if UnitExists("target")~=true then
	--如果当前单位不存在
		return true
	end
	
	if UnitCanAttack("player","target")~=true then
	--如果当前单位不可攻击
		return true
	end
	
	if UnitIsDead("target")==true then
	--如果当前单位已经死亡
		return true
	end
	
	if IsSpellInRange("月火术","target")~=1 then
	--如果当前单位不在攻击范围内
		return true
	end
	
	if GCD==0 then
	--只在GCD的时候切目标
		return false
	end

	local NPClass=UnitClassification(Unit)--判断单位的分类
	if NPClass=="normal" or NPClass=="trivial" or NPClass=="minus" then
	--如果单位类型为 普通 或 召唤小怪
		if not(WR_InTraining()) then
		return false
		end
	end
	if HUCountRange45==nil or HUCountRange45<=1 then
	--如果45码内没有找到任何目标 或者45码内只有1个单位
		return false
	end
	if IsSpellInRange("月火术",Unit)~=1 then
	--如果单位不在攻击范围内
		return false
	end
	if WR_GetUnitDebuffInfo(Unit,"阑珊暮光",true)>0 then
	--如果切换单位有阑珊暮光
		return false
	end
	if WR_GetUnitDeathTime(Unit)<8+HUCountRange45 then
	--如果切换单位死亡时间<8+45内怪物数量
		return false
	end
	if WR_UnitIsHuLueName(Unit) then
	--如果单位是忽略的名字
		return false
	end
	
	if YueHuoShuDebuffTime>0 and WR_GetUnitDebuffInfo(Unit,"月火术",true)==0 then
	--如果当前目标有月火术 并且 切换单位没有月火术
		return true
	end
	if YangYanShuDebuffTime>0 and WR_GetUnitDebuffInfo(Unit,"阳炎术",true)==0 then
	--如果当前目标有阳炎术 并且 切换单位没有阳炎术
		return true
	end
	if IsPlayerSpell(202347) and WR_GetUnitDebuffInfo("target","阑珊暮光",true)>0 and WR_GetUnitDebuffInfo(Unit,"阑珊暮光",true)==0 then
	--学习了[星辰耀斑] 并且 当前目标有阑珊暮光 并且 切换目标没有阑珊暮光
		return true
	end
	--[[
	if WR_GetUnitDeathTime("target")<8+HUCountRange45 and WR_GetUnitDeathTime(Unit)>=8+HUCountRange45 then
	--如果当前目标死亡时间<8+45内怪物数量 并且 切换目标死亡时间>=8+45内怪物数量
		return true
	end
	]]--

	return false	--如果如果没有任何条件成立，返回false
end




--星火术 进蚀 施法条件
function WR_DruidBalance_XingHuoShu_InEclipse()
	if WR_DruidBalance_XingHuoShu()
	--星火术 施法条件
	and
	(
		XingHuoShuCount==2
		--星火术次数==2
		or
		(
			XingHuoShuCount==1
			--星火术次数==1
			and
			not(XingHuoShuCasting)
			--没有施放星火术
		)
		or
		(
			XingHuoShuCount==0
			--星火术次数==0
			and
			RiShiBuffTime<XingHuoShuCastTime-0.5
			--日蚀剩余时间<星火术施法时长，提前铺下一次进蚀
		)
	)
	then
		return true
	end
	return false
end


--新月 施法条件
function WR_DruidBalance_XingYue()
	if IsPlayerSpell(274281)
	--已学新月
	and
	NewMoon
	--不溢出能量
	and
	not(PlayerMove)
	--单位没有移动
	and
	not(WR_StopCast(NextMoonCastTime))
	--避免施法被沉默的情况
	then
		return true
	end
	return false
end







--清除腐蚀 的先决条件
function WR_DruidBalance_QCFS(Unit)
	if IsPlayerSpell(2782)
	--已学 清除腐蚀
	and
	WR_GetGCD("清除腐蚀")<=GCD
	--技能冷却
	and
	not(UnitCanAttack("player",Unit))
	--单位是友方
	and
	IsSpellInRange("野性印记",Unit)==1
	--单位在技能范围内
	and
	WR_CanRemoveUnitDebuff(Unit)
	--单位有可驱散Debuff
	then
		return true
	end
	return false
end

--复生 的先决条件
function WR_DruidBalance_FS(Unit)
	if IsPlayerSpell(20484)
	--已学 复生
	and
	WR_GetGCD("复生")<=GCD
	--技能冷却
	and
	(
		IsSpellInRange("复生",Unit)==1
		--单位在技能范围内
		or
		WR_GetUnitRange(Unit)<=40
		--单位距离<=40
	)
	and
	UnitIsDead(Unit)
	--单位死亡
	and
	not(PlayerMove)
	--没有移动
	and
	not(UnitCanAttack("player",Unit))
	--单位是友善的
	and
	UnitIsPlayer(Unit)
	--单位是玩家
	then
		return true
	end
	return false
end

