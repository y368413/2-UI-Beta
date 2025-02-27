--防战运行库
function WR_WarriorProtection()
	if GetSpecialization()~=3 then	--如果不是防护(3)专精，则不执行该运行库
		return
	end
	
	
	ShiFaSuDu=0.05+WRSet.FZ_SFSD*0.05
	
	GCD=WR_GetGCD("断筋")	--获得公共冷却剩余时间或者当前施法剩余时间
	
	Rage=UnitPower("player",1)	--获得当前怒气值
	
	PlayerHP=UnitHealth("player")/UnitHealthMax("player")	--获得当前血量比例

	HUCountRange5=math.max(WR_GetRangeHarmUnitCount(5),WR_GetSpellRangeHarmUnitCount("猛击"))
	
	TargetIsBoss=WR_TargetIsBoss()	--获得目标是否BOSS
	TargetIsNearby=IsSpellInRange("猛击","target")	--目标在近战范围
	PlayerMove=WR_PlayerMove()	--玩家在移动

	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.FZ_ZNJD) then return end	--智能焦点
	
	if WR_Warrior_KBZN() then return end	--狂暴之怒
	
	if WR_WarriorProtection_PFCZ() then return end	--破釜沉舟

	if WR_WarriorProtection_JJNH() then return end	--集结呐喊

	if WR_WarriorProtection_DQ() then return end	--盾墙
	
	if WRSet.FZ_SP1>=3 then
		if WR_ShiPin(1,WRSet.FZ_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.FZ_SP2>=3 then
		if WR_ShiPin(2,WRSet.FZ_SP2) then return true end	--饰品 自保/协助
	end

	if WR_Warrior_ZLS() then return end	--治疗石
	
	if WR_Warrior_ZLYS() then return end	--治疗药水
	
	if WR_Warrior_FSFS() then return end	--法术反射
	
	if WR_WarriorProtection_WSKT() then return end	--无视苦痛
	
	if WR_WarriorProtection_FYZT() then return end	--防御姿态
	
	if WR_Warrior_Function_QJ() then return end	--拳击
	
	if WR_Warrior_Function_FBZC() then return end	--风暴之锤
	
	if WR_Warrior_ZDB() then return end	--震荡波
	
	if WR_Warrior_PDNH() then return end	--破胆怒吼
	
	if WR_Warrior_ZDNH() then return end	--战斗怒吼

	if TargetIsNearby then	--目标在近战
		if WRSet.FZ_SP1==1 then
			if WR_ShiPin(1,WRSet.FZ_SP1) then return true end	--饰品 常驻
		end
		if WRSet.FZ_SP2==1 then
			if WR_ShiPin(2,WRSet.FZ_SP2) then return true end	--饰品 常驻
		end
	end
	
	if not WRSet.FZ_NotADD	--防ADD未开启
	or WR_TargetInCombat("target")	--目标战斗中
	then
		if WR_WarriorProtection_TSXF() then return end	--天神下凡
		
		if WR_WarriorProtection_SLZW() then return end	--胜利在望
		
		if WR_WarriorProtection_PHZ() then return end	--破坏者
		
		if WR_WarriorProtection_YSZM() then return end	--勇士之矛
		
		if WR_WarriorProtection_LMZH() then return end	--雷鸣之吼
		
		if WR_WarriorProtection_DPCF() then return end	--盾牌冲锋
		
		if WR_WarriorProtection_DPGD() then return end	--盾牌格挡
		
		if WR_WarriorProtection_LTYJ("怒意迸发") then return end	--雷霆一击 怒意迸发
		
		if WR_WarriorProtection_DPMJ("怒意迸发") then return end	--盾牌猛击
		
		if WR_WarriorProtection_LTYJ("雷霆轰击") then return end	--雷霆一击 雷霆轰击两层
		
		if WR_WarriorProtection_CZNH() then return end	--挫志怒吼
		
		if WR_WarriorProtection_DPMJ("能量爆发") then return end	--能量爆发
		
		if WR_WarriorProtection_LTYJ() then return end	--雷霆一击
		
		if WR_WarriorProtection_DPMJ() then return end	--盾牌猛击
		
		if WR_WarriorProtection_ZS() then return end	--斩杀
		
		if WR_WarriorProtection_FC() then return end	--复仇

		if WR_Warrior_YYTZ() then return true end	--施法过程 英勇投掷
	end
	
	if WR_Function_ZNMB(2,WRSet.FZ_ZNMB) then return true end	--智能目标
	
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end


end
--[[
	--战斗姿态
	if WR_SpellUsable("战斗姿态")
	--技能可用
	and
	WR_GetUnitBuffInfo("player","战斗姿态")==0
	--战斗姿态 BUFF不存在
	and
	(
		WRSet.FZ_FYZT~=10	--防御姿态
		and
		PlayerHP>WRSet.FZ_FYZT/10	--玩家血量>防御姿态
	)
	then
		if WR_ColorFrame_Show("SF9","战斗姿态") then return true end
	end
	--战斗姿态
--]]

--勇士之矛
function WR_WarriorProtection_YSZM()
	if GCD<=ShiFaSuDu
	and zhandoumoshi==1 --开爆发
	and TargetIsNearby	--目标在近战范围内
	and WR_SpellUsable("勇士之矛") --技能可用 资源可用
	and not PlayerMove	--没有移动
	and
	(
		WR_GetRangeAvgDeathTime(30)>10	--范围存活时间>10秒
		or
		WR_InBossCombat()	--BOSS战
	)
	then
		if WR_ColorFrame_Show("CSP","勇士之矛") then return true end
	end
	return false
end
		
--破釜沉舟
function WR_WarriorProtection_PFCZ()
	if WRSet.FZ_PFCZ~=6 --破釜沉舟 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and PlayerHP<=WRSet.FZ_PFCZ/10 --血量<=设定值
	and WR_SpellUsable("破釜沉舟") --技能可用
	then
		if WR_ColorFrame_Show("CF5","破釜沉舟") then return true end
	end
	return false
end

--盾墙
function WR_WarriorProtection_DQ()
	if WRSet.FZ_DQ~=6 --盾墙 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and PlayerHP<=WRSet.FZ_DQ/10 --血量<=设定值
	and WR_SpellUsable("盾墙") --技能可用
	and WR_GetUnitBuffInfo("player","盾墙")==0 --盾墙 BUFF 不存在
	and WR_GetUnitBuffInfo("player","历战老兵")==0 --历战老兵 BUFF 不存在
	then
		if WR_ColorFrame_Show("CF7","盾墙") then return true end
	end
	return false
end
	
--盾牌格挡
function WR_WarriorProtection_DPGD()
	if WR_SpellUsable("盾牌格挡") --技能可用
	and WR_GetSpellCharges("盾牌格挡")>=1 --盾牌格挡 次数
	and TargetIsNearby --目标在近战
	and
	(
		WR_GetUnitBuffInfo("player","盾牌格挡")<=1 --盾牌格挡 BUFF<=1秒
		or
		WR_GetSpellCharges("盾牌格挡")==2 --盾牌格挡 次数
		or
		WR_GetSpellNextCharge("盾牌格挡")<=1 --盾牌格挡 充能时间<=1秒
	)
	then
		if WR_ColorFrame_Show("CF8","盾牌格挡") then return true end
	end
	return false
end
	
--无视苦痛
function WR_WarriorProtection_WSKT()
	if not UnitAffectingCombat("player") then return false end	--玩家不在战斗
	if not WR_SpellUsable("无视苦痛") then return false end	--技能不可用
	
	local WSKT_Info=C_UnitAuras.GetPlayerAuraBySpellID(190456)	--获得无视苦痛BUFF信息
	if WSKT_Info == nil --无视苦痛结束时间不存在
	or WSKT_Info.expirationTime-GetTime()<=2	--无视苦痛剩余时间<=2秒
	or WSKT_Info.points[1]==nil	--无视苦痛不存在
	or WSKT_Info.points[1]<=UnitHealthMax("Player")*0.2	--吸收量小于最大生命值的20%(最高可吸收30%,每次无视苦痛可以增加10%吸收量,所以低于20%就补)
	then
		if WR_ColorFrame_Show("CF9","无视苦痛") then return true end
	end
	return false
end

--防御姿态
function WR_WarriorProtection_FYZT()
	if WR_SpellUsable("防御姿态") --技能可用
	and WR_GetUnitBuffInfo("player","防御姿态")==0 --防御姿态 BUFF不存在
	then
		if WR_ColorFrame_Show("SF10","防御姿态") then return true end
	end
	return false
end

--胜利在望
function WR_WarriorProtection_SLZW()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and PlayerHP<=0.8 --血量比例
	and WR_SpellUsable("胜利在望") --技能可用
	then
		if WR_ColorFrame_Show("SF2","胜利在望") then return true end
	end
	return false
end

--天神下凡
function WR_WarriorProtection_TSXF()
	if zhandoumoshi==1 --开爆发
	and WRSet.FZ_TSXF==1	--天神下凡 开启
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("天神下凡") --技能可用
	and
	(
		WR_GetRangeAvgDeathTime(30)>10	--范围存活时间>10秒
		or
		WR_InBossCombat()	--BOSS战
	)
	then
		if WRSet.FZ_SP1==2 then
			if WR_ShiPin(1,WRSet.FZ_SP1) then return true end	--饰品 爆发
		end
		if WRSet.FZ_SP2==2 then
			if WR_ShiPin(2,WRSet.FZ_SP2) then return true end	--饰品 爆发
		end
		
		if WR_ColorFrame_Show("CSK","天神下凡") then return true end
	end
	return false
end

--挫志怒吼
function WR_WarriorProtection_CZNH()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and zhandoumoshi==1	--爆发开启
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("挫志怒吼") --技能可用
	and Rage<65 --怒气<65
	and not PlayerMove --没有移动
	and
	(
		WR_GetRangeAvgDeathTime(30)>8	--范围存活时间>8秒
		or
		WR_InBossCombat()	--BOSS战
	)
	then
		if WR_ColorFrame_Show("SF11","挫志怒吼") then return true end
	end
	return false
end

--破坏者
function WR_WarriorProtection_PHZ()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("破坏者") --技能可用
	and Rage<85 --怒气<85
	and not PlayerMove --没有移动
	and
	(
		WR_GetRangeAvgDeathTime(30)>10	--范围存活时间>10秒
		or
		WR_InBossCombat()	--BOSS战
	)
	then
		if WR_ColorFrame_Show("CF1","破坏者") then return true end
	end
	return false
end

--盾牌冲锋
function WR_WarriorProtection_DPCF()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("盾牌冲锋") --技能可用
	and Rage<55 --怒气<55
	and not PlayerMove --没有移动
	and
	(
		WRSet.FZ_DPCF==1	--盾牌冲锋 常驻
		or
		(
			WRSet.FZ_DPCF==2	--盾牌冲锋 爆发
			and
			zhandoumoshi==1	--爆发 开启
		)
	)
	then
		if WR_ColorFrame_Show("CF11","盾牌冲锋") then return true end
	end
	return false
end

--雷鸣之吼
function WR_WarriorProtection_LMZH()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and zhandoumoshi==1 --开爆发
	and WR_SpellUsable("雷鸣之吼") --技能可用
	and Rage<85 --怒气<85
	and not PlayerMove --没有移动
	then
		if WR_ColorFrame_Show("CF12","雷鸣之吼") then return true end
	end
	return false
end

--盾牌猛击
function WR_WarriorProtection_DPMJ(Text)
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("盾牌猛击") --技能可用
	and Rage<78 --怒气<78
	then
		if Text==nil then
			if WR_ColorFrame_Show("CSF8","盾牌猛击") then return true end
		elseif Text=="怒意迸发"
		and
		WR_GetUnitBuffTime("player","怒意迸发")>GCD	--怒意迸发 BUFF存在
		and
		HUCountRange5<6 --附近单位数量<6
		then
			if WR_ColorFrame_Show("CSF8","怒意盾猛") then return true end
		elseif Text=="能量爆发"
		and
		WR_GetUnitBuffTime("player","能量爆发")>GCD	--能量爆发 BUFF存在
		then
			if WR_ColorFrame_Show("CSF8","爆发盾猛") then return true end
		end
		
	end
	return false
end

--雷霆一击
function WR_WarriorProtection_LTYJ(Text)
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("雷霆一击") --技能可用
	and Rage<90 --怒气<90
	then
		if Text==nil then
			if WR_ColorFrame_Show("CSF9","雷霆一击") then return true end
		elseif Text=="怒意迸发"
		and
		WR_GetUnitBuffTime("player","怒意迸发")>GCD	--怒意迸发 BUFF存在
		and
		(
			(
				WR_GetUnitBuffTime("player","天神下凡")>GCD	--天神下凡 存在
				and
				HUCountRange5>=2 --附近单位数量>=2
			)
			or
			HUCountRange5>=6 --附近单位数量>=6
		)
		then
			if WR_ColorFrame_Show("CSF9","怒意雷霆") then return true end
		elseif Text=="雷霆轰击"
		and
		WR_GetUnitBuffCount("player","雷霆轰击")>=2	--雷霆轰击 BUFF层数>=2
		then
			if WR_ColorFrame_Show("CSF9","雷霆轰击") then return true end
		end
	end
	return false
end

--斩杀
function WR_WarriorProtection_ZS()
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable("斩杀") --技能可用
	and
	(
		(
			Rage>70 --怒气>70
			and
			HUCountRange5<=2 --5码单位数量<=2
			and
			UnitHealth("target")/UnitHealthMax("target")<0.2
		)
		or
		WR_GetUnitBuffTime("player","猝死")>GCD --BUFF存在
	)
	then
		if WR_ColorFrame_Show("CF6","斩杀") then return true end
	end
	return false
end

--复仇
function WR_WarriorProtection_FC()
	if hasMount_FC == nil then
		hasMount_FC = false
		local mountName = "复仇"
		local mountIDs = C_MountJournal.GetMountIDs()

		for _, mountID in ipairs(mountIDs) do
			local name, _, _, _, _, _, _, _, _, _, isCollected = C_MountJournal.GetMountInfoByID(mountID)
			if name == mountName and isCollected then
				hasMount_FC = true
				break
			end
		end
	end
	
	
	if GCD<=ShiFaSuDu	--GCD<=施法速度
	and TargetIsNearby	--目标在近战范围
	and WR_SpellUsable(6572) --技能可用
	and
	(
		Rage>70 --怒气>70
		or
		WR_GetUnitBuffInfo("player","复仇！")~=0 --免费复仇
	)
	then
		if hasMount_FC then	--有复仇坐骑
			if WR_ColorFrame_Show("F12","复仇") then return true end
		else
			if WR_ColorFrame_Show("CSL","复仇") then return true end
		end
	end
		
	return false
end


--集结呐喊
function WR_WarriorProtection_JJNH()
	if WRSet.FZ_JJNH~=4 --集结呐喊 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and WR_RangeCountPR(40,WRSet.FZ_JJNH/10)>=1	--40码队友血量<=设定值
	and WR_SpellUsable("集结呐喊") --技能可用
	then
		if WR_ColorFrame_Show("SF3","集结呐喊") then return true end
	end
	
	return false
end