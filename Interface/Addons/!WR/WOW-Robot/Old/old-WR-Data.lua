--作者微信:WOW-Robot(转载请保留,感谢!)

--[[




--必须打断的技能
BiXuDaDuanSpell={
    [1]="深暗回响",[2]="强效治疗术",[3]="熔火之心",[4]="驱逐",[5]="冰霜冲击",[6]="狰狞蔑笑",[7]="强效治疗湍流",[8]="豪雨",[9]="旋风",[10]="窒息藤蔓",
	[11]="治疗之水",[12]="治疗波",[13]="妖术",[14]="炎爆术",[15]="复苏",[16]="剧毒之花",[17]="侵蚀齐射",[18]="",[19]="",[20]="",
}















--必须法术反射的法术
Reflection={
	[1]="黑暗之爪",[2]="注能打击",[3]="巨龙打击",[4]="阵风冲击",[5]="传导打击",[6]="穿刺碎片",[7]="翔龙猛袭",[8]="冷冽飞弹",[9]="熔岩冲击",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}




--强制算进战斗的怪物
InCombatUnitName={
	[1]="饥饿的鞭笞者",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}



--特殊单位的名字，不切目标





--需要援护/保护的法术
AidSpell={
	[1]="血之气息",[2]="屠戮标记",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--需要给保护的Debuff
BaoHuDebuff={
	[1]="大地碎片",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}














--1击杀坦克的法术
MagicKillTank_1={
	[1]="光明之盾",[2]="青龙猛袭",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--2击杀坦克的法术
MagicKillTank_2={
	[1]="奥术顺劈",[2]="巨龙打击",[3]="奥术驱除",[4]="虚空冲击",[5]="阵风冲击",[6]="震耳尖啸",[7]="闪电吐息",[8]="绝对零度",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--3击杀坦克的法术
MagicKillTank_3={
	[1]="黑暗之爪",[2]="风暴斩击",[3]="穿刺碎片",[4]="虚空挥砍",[5]="传导打击",[6]="法术冰霜吐息",[7]="破冰者",[8]="翔龙猛袭",[9]="雷霆颚咬",[10]="风暴猛击",
	[11]="奥术重击",[12]="暗影鞭笞",[13]="灼热凝视",[14]="吸血之爪",[15]="暗影箭雨",[16]="注能打击",[17]="爆裂法印",[18]="冷冽飞弹",[19]="",[20]="",
	[21]="",[22]="",[23]="",[24]="",[25]="",[26]="",[27]="",[28]="",[29]="",[30]="",
}

--2击杀坦克的BUFF
MagicBuffKillTank_2={
	[1]="黯灭之刺",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--1击杀坦克的物理伤害
PhysicalKillTank_1={
	[1]="狂野啄击",[2]="钢铁弹幕",[3]="残杀",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--2击杀坦克的物理伤害
PhysicalKillTank_2={
	[1]="风暴猛击",[2]="灼热打击",[3]="裂树击",[4]="放血扫击",[5]="断体猛击",[6]="撕碎利爪",[7]=372730,[8]="沉重挥砍",[9]="充能之击",[10]="恶意啄击",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--3击杀坦克的物理伤害
PhysicalKillTank_3={
	[1]="强力一击",[2]="阔蹄践踏",[3]="啄击",[4]="雷霆颚咬",[5]="致死劈砍",[6]="急促射击",[7]="火焰之喉",[8]="勇气号角",[9]="水流长枪",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--副本最后一次战斗的BOSS名册
EndGameBossName={
	[1]="多拉苟萨的回响",[2]="腐朽主母怒眼",[3]="原始海啸",[4]="督军莎尔佳",[5]="基拉卡",[6]="厄克哈特·风脉",[7]="安布雷斯库",[8]="巴拉卡可汗",[9]="时空领主戴欧斯",[10]="哈兰·斯威提",
	[11]="不羁畸变怪",[12]="地底之王达古尔",[13]="西风君王阿萨德",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--集合型战斗目标名册
AssemblyName={
	[1]="不屈者卡金",[2]="梅莉杜莎·寒妆",[3]="炎缚火焰风暴",[4]="大引导者莱瓦迪",[5]="暴风引导者",[6]="茂林古树",[7]="古树树枝",[8]="撼地图腾",[9]="紫翼鹿角虫",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}







--范本
FB_Name={
	[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
	[21]="",[22]="",[23]="",[24]="",[25]="",[26]="",[27]="",[28]="",[29]="",[30]="",
	[31]="",[32]="",[33]="",[34]="",[35]="",[36]="",[37]="",[38]="",[39]="",[40]="",
	[41]="",[42]="",[43]="",[44]="",[45]="",[46]="",[47]="",[48]="",[49]="",[50]="",
	[51]="",[52]="",[53]="",[54]="",[55]="",[56]="",[57]="",[58]="",[59]="",[60]="",
	[61]="",[62]="",[63]="",[64]="",[65]="",[66]="",[67]="",[68]="",[69]="",[70]="",
	[71]="",[72]="",[73]="",[74]="",[75]="",[76]="",[77]="",[78]="",[79]="",[80]="",
	[81]="",[82]="",[83]="",[84]="",[85]="",[86]="",[87]="",[88]="",[89]="",[90]="",
	[91]="",[92]="",[93]="",[94]="",[95]="",[96]="",[97]="",[98]="",[99]="",[100]="",
}
]]--






--专精切换提醒
function WR_Warning()
	if WR_StartTime==nil then
		if WR_ConfigHeaderText~=nil then
			WR_ConfigHeaderText:SetText("|cffff5040请重载游戏")
		end
		local Warning_Text = UIParent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		Warning_Text:SetText("|cffff5040专精已切换，请输入/reload重载游戏。")
		Warning_Text:SetPoint("TOP", UIParent, "TOP", 0, -300)
		Warning_Text:SetFont("Interface\\AddOns\\WR\\Fonts\\Fonts.ttf", 30) --使用指定字体和字号
		WR_StartTime=GetTime()
	end
end





--[[
--获得单位指定BUFF的剩余时间及堆叠层数(BuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitBuffInfo(Unit,BuffName,ByMe)
	local BuffTime=0
	local BuffCount=0
	local BuffSum=0
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if (name == BuffName or spellId == BuffName) and (ByMe~=true or (ByMe==true and source=="player")) then
			BuffTime = expirationTime - GetTime()
			if count>0 then
				BuffCount = count
			else
				BuffCount = 1
			end
			BuffSum=BuffSum+1
		end
	end
	
	return BuffTime,BuffCount,BuffSum
end
--]]





--[[
--获得单位指定BUFF的剩余时间及堆叠层数(BuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitBuffInfo(Unit,BuffName,ByMe,BuffType)
	local BuffTime=0
	local BuffCount=0
	local BuffSum=0
	local HaveID=false	--初始化，表中是否已经有了当前单位ID
	
	if WR_BuffInfo_All==nil then
		WR_BuffInfo_All={}	--初始化BUFF列表
	else
		for _, TempBuffInfo in ipairs(WR_BuffInfo_All) do
			if UnitGUID(Unit)==TempBuffInfo.UnitID then
			--指定单位ID == 表中ID
				HaveID=true	--找到表中对应单位的ID
				if 
				(
					BuffName~=nil
					and
					(
						BuffName==TempBuffInfo.Name
						--BUFF名称成立
						or
						BuffName==TempBuffInfo.ID
						--BUFFID成立
					)
				or
					(
						BuffType~=nil
						and
						BuffType==TempBuffInfo.Type
						--BUFF类型成立
					)
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						TempBuffInfo.Source=="player"
					)
				)
				then
				--不考虑来自自己 或者 确定来自自己
					BuffTime=TempBuffInfo.Time
					if TempBuffInfo.Count>0 then
						BuffCount = TempBuffInfo.Count
					else
						BuffCount = 1
					end
					BuffSum=BuffSum+1
					--print(BuffType,TempBuffInfo.Type)
				end
			end
		end
	end
	
	if HaveID==false then
	--print(BuffName)
	--如果没找到表中单位ID
		for i=1,40,1
		do
			if UnitExists(Unit) then
			--单位存在
				local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
				if name == nil then
				--如果name不存在则立即退出循环
					if i==1 then
						local TempBuffInfo={
							UnitID=UnitGUID(Unit),
							Name=nil,
							ID=nil,
							Time=nil,
							Count=nil,
							Source=nil,
							Type=nil
						}
						table.insert(WR_BuffInfo_All, TempBuffInfo)
					end
					
					break
				end
				if
				(
					BuffName~=nil
					and
					(
						name==BuffName
						or
						spellId==BuffName
					)
					or
					(
						BuffType~=nil
						and
						dispelType==BuffType
					)
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						source=="player"
					)
				)
				then
					BuffTime = expirationTime - GetTime()
					if count>0 then
						BuffCount = count
					else
						BuffCount = 1
					end
					BuffSum=BuffSum+1
				end
				local TempBuffInfo={
					UnitID=UnitGUID(Unit),
					Name=name,
					ID=spellId,
					Time=expirationTime - GetTime(),
					Count=count,
					Source=source,
					Type=dispelType
				}
				table.insert(WR_BuffInfo_All, TempBuffInfo)
				--print(Unit)
			end
		end
	end
	return BuffTime,BuffCount,BuffSum
end
--]]

--[[
--获得单位指定Debuff的剩余时间及堆叠层数(BuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe)
	local DebuffTime=0
	local DebuffCount=0
	local DebuffSum=0
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if (name == DebuffName or spellId == DebuffName) and (ByMe~=true or (ByMe==true and source=="player")) then
			DebuffTime = expirationTime - GetTime()
			if count>0 then
				DebuffCount = count
			else
				DebuffCount = 1
			end
			DebuffSum=DebuffSum+1
		end
	end
	return DebuffTime,DebuffCount,DebuffSum
end
--]]



--[[
--获得单位指定Debuff的剩余时间及堆叠层数(DebuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe,DebuffType)
	local DebuffTime=0
	local DebuffCount=0
	local DebuffSum=0
	local HaveID=false	--初始化，表中是否已经有了当前单位ID
	
	if WR_DebuffInfo_All==nil then
		WR_DebuffInfo_All={}	--初始化BUFF列表
	else
		for _, TempDebuffInfo in ipairs(WR_DebuffInfo_All) do
			if UnitGUID(Unit)==TempDebuffInfo.UnitID then
			--指定单位ID == 表中ID
				--print("在列表中")
				HaveID=true	--找到表中对应单位的ID
				if
				(
					DebuffName~=nil
					and
					(
						DebuffName==TempDebuffInfo.Name
						--BUFF名称成立
						or
						DebuffName==TempDebuffInfo.ID
						--BUFFID成立
					)
					or
					(
						DebuffType~=nil
						and
						DebuffType==TempDebuffInfo.Type
						--BUFF类型成立
					)
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						TempDebuffInfo.Source=="player"
					)
				)
				then
				--不考虑来自自己 或者 确定来自自己
					DebuffTime=TempDebuffInfo.Time
					if TempDebuffInfo.Count>0 then
						DebuffCount = TempDebuffInfo.Count
					else
						DebuffCount = 1
					end
					DebuffSum=DebuffSum+1
				end
			end
		end
	end
	
	if HaveID==false then
	--print(DebuffName)
	--如果没找到表中单位ID
		for i=1,40,1
		do
			if UnitExists(Unit) then
			--单位存在
				local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
				if name == nil then
				--如果name不存在则立即退出循环
					if i==1 then
						local TempDebuffInfo={
						UnitID=UnitGUID(Unit),
						Name=nil,
						ID=nil,
						Time=nil,
						Count=nil,
						Source=nil,
						Type=nil
						}
						table.insert(WR_DebuffInfo_All, TempDebuffInfo)
					end
					
					break
				end
				
				if
				(
					DebuffName~=nil
					and
					(
						name==DebuffName
						or
						spellId==DebuffName
					)
					or
					(
						DebuffType~=nil
						and
						dispelType==DebuffType
					)
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						source=="player"
					)
				)
				then
					DebuffTime = expirationTime - GetTime()
					if count>0 then
						DebuffCount = count
					else
						DebuffCount = 1
					end
					DebuffSum=DebuffSum+1
				end
				
				local TempDebuffInfo={
					UnitID=UnitGUID(Unit),
					Name=name,
					ID=spellId,
					Time=expirationTime - GetTime(),
					Count=count,
					Source=source,
					Type=dispelType
				}
				table.insert(WR_DebuffInfo_All, TempDebuffInfo)
				--print(Unit)
			end
		end
	end
	return DebuffTime,DebuffCount,DebuffSum
end
--]]




--搜索Player的BUFF信息[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_SearchBuffInfo_Player(BuffName,ByMe)
	local BuffTime=0
	local BuffCount=0
	local BuffSum=0
	for _, TempBuffInfo in ipairs(WR_BuffInfo_Player) do
		if BuffName==TempBuffInfo.Name or BuffName==TempBuffInfo.BuffID  and (ByMe~=true or (ByMe==true and TempBuffInfo.Source=="player")) then
			BuffTime=TempBuffInfo.Time
			if TempBuffInfo.Count>0 then
				BuffCount = TempBuffInfo.Count
			else
				BuffCount = 1
			end
			BuffSum=BuffSum+1
		end
	end
	
	return BuffTime,BuffCount,BuffSum
end

--获得Player BUFF信息
function WR_GetBuffInfo_Player()
	WR_BuffInfo_Player={}
	local unit="player"
	for i=1,40,1
	do
		if UnitExists(unit) then
		--单位存在
			local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(unit,i)
			if name == nil then
			--如果name不存在则立即退出循环
				break
			end
			local TempBuffInfo={
				Unit=unit,
				Name=name,
				BuffID=spellId,
				Time=expirationTime - GetTime(),
				Count=count,
				Source=source
			}
			table.insert(WR_BuffInfo_Player, TempBuffInfo)
		end
	end
end




--[[
--获得单位是否有激怒效果
function WR_UnitEnragedBuff(Unit)
	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,"无穷饥渴")
	if BuffCount>6 then return true end
	
	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,_,_,"Enrage")	--如果类型是 激怒
	if BuffCount>0 then return true end
	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,_,_,"Enraged")	--如果类型是 激怒
	if BuffCount>0 then return true end
	
	for _, DebuffName in ipairs(EnragedBuffName) do
		local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,DebuffName)
		if BuffCount>0 then
			return true
		end
	end
	
	return false
end
--]]




--[[
--获得目标是否具有某种类型的BUFF,(Curse=诅咒, Disease=疾病, Magic=魔法, Poison=毒药, Enraged=激怒, Stunned=昏迷, Rooted=缠绕)
function WR_GetUnitBuffType(Unit,BuffType)
	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,"无穷饥渴")
	if BuffCount<6 then return false end
	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,"窃取时间")
	if BuffCount>0 then return false end

	local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo(Unit,_,_,BuffType)
	if BuffCount>0 then return true end
	
	return false
end
--]]





--[[
--获取单位距离
function WR_GetUnitRange(Unit)
	local UnitRange=select(2,LibStub("LibRangeCheck-3.0"):GetRange(Unit))
	if UnitRange~=nil then
		return UnitRange
	else
		return 999
	end
end
]]

--[[
--获得所有单位的距离
function WR_GetAllUnitRange()
	WR_AllUnitRange={}
	WR_InsertUnitRange("player")	--获得单位BUFF并记录
	WR_InsertUnitRange("focus")	--获得单位BUFF并记录
	WR_InsertUnitRange("mouseover")	--获得单位BUFF并记录
	WR_InsertUnitRange("target")	--获得单位BUFF并记录
	WR_InsertUnitRange("targettarget")	--获得单位BUFF并记录
	WR_InsertUnitRange("pet")	--获得单位BUFF并记录
	for i=1,4,1 do
		WR_InsertUnitRange("party"..i)	--获得单位BUFF并记录
		WR_InsertUnitRange("party" .. i .. "target")	--获得单位BUFF并记录
	end
	for i=1,40,1 do
		WR_InsertUnitRange("raid"..i)	--获得单位BUFF并记录
		WR_InsertUnitRange("raid" .. i .. "target")	--获得单位BUFF并记录
	end
	for i=1,40,1 do
		WR_InsertUnitRange("nameplate"..i)	--获得单位BUFF并记录
	end
end
]]

--[[
--获取指定单位距离并插入表格中
function WR_InsertUnitRange(unit)
	if UnitExists(unit) then
	--单位存在
		if WR_AllUnitRange~=nil then
			for _, TempUnitRange in ipairs(WR_AllUnitRange) do
				if TempUnitRange.Id==UnitGUID(unit) then
				--如果ID已经记录过了，则不再重复记录
					return
				end
			end
		end
		local UnitRange=select(2,LibStub("LibRangeCheck-3.0"):GetRange(unit))
		--local UnitRange=select(2,LibStub("LibRangeCheck-3.0"):GetRange(unit,_,not(UnitCanAttack("player",unit)),1))
		--获取单位最大距离
		if UnitRange==nil or UnitRange==0 then
		--如果单位距离为nil，赋值999
			UnitRange=999
		end
		--print(LibStub("LibRangeCheck-3.0"):GetRange(unit),_,not(UnitCanAttack("player",unit)))
		local TempUnitRange={
			Id=UnitGUID(unit),
			Help=not(UnitCanAttack("player",unit)),
			Invincible=WR_Invincible(unit),
			Combat=UnitAffectingCombat(unit),
			Type=UnitCreatureType(unit),
			Range=UnitRange
		}
		table.insert(WR_AllUnitRange, TempUnitRange)
	end
end
]]



--[[
--获取敌对数量(范围,是否战斗中)
function WR_GetRangeHarmUnitCount(Range,InCombat)
	local RangeHarm=0
	for i=1,40,1
	do
		local UName,_ = UnitName("nameplate"..i)
		local minRange, maxRange = LibStub("LibRangeCheck-3.0"):GetRange("nameplate"..i)
		local TargetCanAttack = UnitCanAttack("player","nameplate"..i)--判断单位是可被攻击的
		local NPNotInvincible = not(WR_Invincible("nameplate"..i))--判断单位不是无敌的
		local NPInCombat = UnitAffectingCombat("nameplate"..i)--判断单位是否在战斗中
		local creatureType = UnitCreatureType("nameplate"..i)--判断单位的类型
		if not(WR_UnitIsHuLueName("nameplate"..i)) then
		--print("1")
		--如果不是忽略的名单
			--print(minRange,maxRange,TargetCanAttack,NPNotInvincible,creatureType)
			if minRange~=nil and maxRange~=nil and maxRange<=Range and TargetCanAttack and NPNotInvincible and creatureType~="图腾" and creatureType~="气体云雾" then
			--print(i,minRange,maxRange)
				if (NPInCombat==true and InCombat==true) or InCombat~=true then
					RangeHarm=RangeHarm+1
				else
					local j=1
					while (InCombatUnitName[j]~=nil and InCombatUnitName[j]~="")
					do
						if UName==InCombatUnitName[j] then
							RangeHarm=RangeHarm+1
						end
						j=j+1
					end
				end
			end
		end
	end
	if MSG==1 then
		if InCombat==true then
			print("|cff00ff00",Range,"|cffffffff码内，进入战斗的敌人数量为:|cffffdf00",RangeHarm)
		else
			print("|cff00ff00",Range,"|cffffffff码内，所有的敌人数量为:|cffffdf00",RangeHarm)
		end
	end
	return RangeHarm
end
]]

--获取敌对数量(技能,是否战斗中)
function WR_GetSpellInRangeHarmUnitCount(HarmSpell,InCombat)
	local RangeHarm=0
	for i=1,40,1
	do
		local NPInRange = IsSpellInRange(HarmSpell, "nameplate"..i)--判断单位在指定技能范围内
		local NPCanAttack = UnitCanAttack("player","nameplate"..i)--判断单位是可被攻击的
		local NPNotInvincible = not(WR_Invincible("nameplate"..i))--判断单位不是无敌的
		local NPInCombat = UnitAffectingCombat("nameplate"..i)--判断单位是否在战斗中
		local NPcreatureType = UnitCreatureType("nameplate"..i)--判断单位的类型
		if not(WR_UnitIsHuLueName("nameplate"..i)) then
		--如果不是忽略的名单
			if NPInRange==1 and NPCanAttack and NPNotInvincible and NPcreatureType~="图腾" and NPcreatureType~="Totem" and NPcreatureType~="气体云雾" and NPcreatureType~="Gas Cloud" then
				if (NPInCombat==true and InCombat==true) or InCombat~=true then
					RangeHarm=RangeHarm+1
				end
			end
		end
	end
	if MSG==1 then
		if InCombat==true then
			print("|cff00ff00",HarmSpell,"|cffffffff范围内，战斗中的敌人数量为:|cffffdf00",RangeHarm)
		else
			print("|cff00ff00",HarmSpell,"|cffffffff范围内，敌人数量为:|cffffdf00",RangeHarm)
		end
	end
	return RangeHarm
end











--[[
function WR_Invincible(Unit)	--判断单位是否无敌
	if UnitName(Unit)=="虚体生物" then
		return true
	end

	for _, BuffName in ipairs(InvincibleBuffName) do
		if WR_GetUnitBuffInfo(Unit,BuffName)~=0
		or WR_GetUnitDebuffInfo(Unit,BuffName)~=0
		then
			return true
		end
	end
	
	return false
end
--]]




--[[
--获得是否打断单位施法(单位,InterruptibleTime为打断施法剩余的时间)[InterruptibleTime为0时秒断]
function WR_GetCastInterruptible(Unit,InterruptibleTime)
	local UnitCastTime,UnitCastLeftTime,UnitCastInterruptible=WR_GetUnitCastInfo(Unit)
	if UnitCastLeftTime~=nil and UnitCastInterruptible~=nil then
		if UnitCastTime>=0.5 and (InterruptibleTime==0 or UnitCastLeftTime<=InterruptibleTime) and UnitCastInterruptible==true then
			return true
		end
	end
	--单位施法剩余时间
	
	local UnitChannelTime,UnitChannelInterruptible=WR_GetUnitChannelInfo(Unit)
	if UnitChannelTime~=nil and UnitChannelInterruptible~=nil then
		if UnitChannelTime>=0.5 and (InterruptibleTime==0 or UnitChannelTime>=InterruptibleTime) and UnitChannelInterruptible==true then
			return true
		end
	end
	--单位引导开始时间
	return false
end
--]]








--[[
--获取当前指定技能范围内单位预计死亡时间(技能名称)
function WR_GetSpellRangeAvgDeathTime(SpellName)
	WR_GetNPDeathTime()
	local UnitIsSpellInRange,UnitInCombat,name,realm
	local sum=0
	local count=0
	local SpellRangeAugDeathTime=0
	for i=1,40,1
	do
		name, realm = UnitName("nameplate"..i)
		UnitIsSpellInRange=IsSpellInRange(SpellName,"nameplate"..i)
		--UTS=UnitThreatSituation("player","nameplate"..i)
		--监测单位威胁值
		UnitInCombat=UnitAffectingCombat("nameplate"..i)
		--检测单位是否在战斗
		if UnitIsSpellInRange~=nil and UnitInCombat==true and NPdeathtime[i]~=nil and name~=nil then
			if UnitIsSpellInRange==1 and NPdeathtime[i]>0 and NPdeathtime[i]<999 and name~="爆炸物" then
				sum=sum+NPdeathtime[i]
				count=count+1
			end
		end
	end
	if count~=0 then
		SpellRangeAugDeathTime=sum/count
	end
	if MSG==1 then
		print("预计战斗结束时间:|cffffdf00",math.ceil(SpellRangeAugDeathTime),"|cffffffff秒")
	end
	return SpellRangeAugDeathTime
end
--]]

--[[
--获得尖刺型AOE是否存在(施法剩余时间，Time为0或nil时，只要存在即返回true)
function WR_GetOutburstAoe(Time)
	local i
	for i=1,40,1
	do
		if UnitExists("nameplate"..i) then
		--单位存在
			local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)
			if endTimeMS~=nil then
			--施法存在
				local j=1
				while (OutburstAoe[j]~=nil and OutburstAoe[j]~="")
				do
					if OutburstAoe[j]==name then
					--判断是否尖刺型AOE
						if Time==nil or endTimeMS/1000-GetTime()<=Time or Time==0 then
						--施法剩余时间<=设定值 或者 Time==0
							return true
						end
					end
					j=j+1
				end
			end
		end
	end
	return false
end
--]]







--[[
--获得敌人是否有持续型AOEbuff存在（血量百分比低于HP）
function WR_GetSustainedBuff(HP)
	if HP==nil or (UnitHealthMax("player")~=0 and UnitHealth("player")/UnitHealthMax("player")<=HP) then
		local i
		for i=1,40,1
		do
			if UnitExists("nameplate"..i) then
				local j=1
				while (SustainedBuff[j]~=nil and SustainedBuff[j]~="")
				do
					local BuffTime,BuffCount,BuffSum=WR_GetUnitBuffInfo("nameplate"..i,SustainedBuff[j])
					if BuffCount>0 then --因为有一些BUFF无限持续时间，所以不能用BuffTime
						return true
					end
					j=j+1
				end
			end
		end
	end
	return false
end
--]]




--获取自身指定Debuff的持续时间(Debuff名字)[返回值:Buff剩余时间]
function WR_GetPlayerDebuffTime(DebuffName)
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff("player",i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if name == DebuffName or spellId == DebuffName then
			return expirationTime - GetTime()
		end
	end
	return 0
end


--[[
--获取自身指定Debuff的持续时间(Debuff名字)[返回值:Buff剩余时间]
function WR_GetPlayerDebuffTime(DebuffName)
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo("player",DebuffName)
	return DebuffTime
end
--]]

























--[[
--获得单位身上是否有指定的危险Debuff
function WR_GetDangerDebuff(Unit,time,DangerDebuffNameList)
	for _, DebuffName in ipairs(DangerDebuffNameList) do
		local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,DebuffName)
		if DebuffTime~=0 and (time==nil or DebuffTime<=time) then
			return true
		end
	end
	return false
end
--]]




--[[
--获得单位是否有需要协助的Debuff
function WR_UnitAssistDebuff(Unit,time)
	for _, DebuffName in ipairs(AssistDebuffName) do
		local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,DebuffName)
		if DebuffTime~=0 and (time==nil or DebuffTime<=time) then
			return true
		end
	end
	return false
end
	--]]






--[[
--获得单位是否具有某个DeBUFF
function WR_GetUnitDebuff(Unit,DebuffName,DebuffCount)
	if type(DebuffName)=="table" then
	--如果DebuffName是个表，而不是单独的一个值
		for _, TempDebuff in ipairs(DebuffName) do
			local TempTime,TempCount,TempSum=WR_GetUnitDebuffInfo(Unit,TempDebuff)
			if TempTime~=0 and (DebuffCount==nil or TempCount>=DebuffCount) then
				return true
			end
		end
	else
		local TempTime,TempCount,TempSum=WR_GetUnitDebuffInfo(Unit,DebuffName)
		if TempTime~=0 and (DebuffCount==nil or TempCount>=DebuffCount) then
			return true
		end
	end

	return false
end
--]]





--[[
--获得目标是否具有某种类型的DEBUFF,(Curse=诅咒, Disease=疾病, Magic=魔法, Poison=毒药, Enraged=激怒, Stunned=昏迷, Rooted=缠绕)
function WR_UnitDebuffType(Unit,DebuffType)
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"灵魂毒液")
	if DebuffCount>0 and DebuffCount<7 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"爆裂")
	if DebuffCount>0 and DebuffCount<5 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"巨口蛙毒")
	if DebuffCount>0 and DebuffCount<5 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"腐蚀波")
	if DebuffCount>0 and DebuffCount<5 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"窃取时间")
	if DebuffCount>0 and DebuffCount<3 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"腐败之血")
	if DebuffCount>0 and DebuffCount<2 then return false end
	
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"古怪生长")
	if DebuffCount>0 and DebuffTime>4 then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"时光爆发")
	if DebuffCount>0 and (DebuffTime>4.5 or WR_GetUnitHP(Unit)<0.8) then return false end
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"提尔之火")
	if DebuffCount>0 and (DebuffTime>16 or WR_GetUnitHP(Unit)<0.8 or UnitCastingInfo("boss1")=="裂地打击") then return false end
	
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,_,_,DebuffType)
	if DebuffCount>0 then
		return true,DebuffCount
	end
	return false
end
--]]














--判断自己是否有定身DEBUFF
function WR_JieChuDingShen()
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff("player",i)
		if name==nil then
			break
		end
		if dispelType=="Rooted" or dispelType=="Root" then
		--如果类型是缠绕
			return true
		end
		for _, DebuffName in ipairs(ZiYouZhuFuDebuff) do
			if name==DebuffName then
				return true
			end
		end
	end
	return false
end

--[[
--判断自己是否有定身DEBUFF
function WR_JieChuDingShen()
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo("player",_,_,"Rooted")
	if DebuffCount>0 then return true end	--如果类型是缠绕
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo("player",_,_,"Root")
	if DebuffCount>0 then return true end	--如果类型是缠绕
	
	for _, DebuffName in ipairs(ZiYouZhuFuDebuff) do
		local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo("player",DebuffName)
		if DebuffCount>0 then
			return true
		end
	end
	
	return false
end
--]]




--[[
--自由祝福
function WR_ZiYouZhuFu(Unit)
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,_,_,"Rooted")
	if DebuffCount>0 then return true end	--如果类型是缠绕
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,_,_,"Root")
	if DebuffCount>0 then return true end	--如果类型是缠绕
	local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,"恐瓣花粉")
	if DebuffCount>=6 then return true end
	
	for _, DebuffName in ipairs(ZiYouZhuFuDebuff) do
		local DebuffTime,DebuffCount,DebuffSum=WR_GetUnitDebuffInfo(Unit,DebuffName)
		if DebuffCount>0 then
			return true
		end
	end
	
	return false
end
--]]






	
	















--获取范围内最大血量的敌对单位
function WR_GetMaxHealthUnit(Range)
	local MaxHealth=UnitHealth("target")
	local MaxHealthUnit="target"
	local i
	for i=1,4,1
	do
		--local _,maxRange = LibStub("LibRangeCheck-3.0"):GetRange("party" .. i .. "target")
		local maxRange = WR_GetUnitRange("party" .. i .. "target")
		if maxRange~=nil and maxRange<=Range and UnitCanAttack("player","party" .. i .. "target") then
		--指定单位距离<=设定的距离参数 and 指定单位是敌对单位
			if UnitHealth("party" .. i .. "target")>MaxHealth then
			--指定单位生命值>当前最大的生命值
				MaxHealth=UnitHealth("party" .. i .. "target")
				MaxHealthUnit="party" .. i .. "target"
			end
		end
	end
	return MaxHealthUnit
end










--获得法术需要的蓝量
function WR_GetSpellMana(SpellName)
	if GetSpellPowerCost(SpellName)~=nil and GetSpellPowerCost(SpellName)[1]~=nil and GetSpellPowerCost(SpellName)[1].cost~=nil then
		return GetSpellPowerCost(SpellName)[1].cost
	end
	return 0
end





--获得是否必须打断单位施法(单位]
function WR_BiXuDaDuan(UnitName)
	local name
	name, _, _, _, _, _, _, _, _ = UnitCastingInfo(UnitName)
	if name~=nil then
		local j=1
		while (BiXuDaDuanSpell[j]~=nil and BiXuDaDuanSpell[j]~="")
		do
			if BiXuDaDuanSpell[j]==name then
				return true
			end
			j=j+1
		end
	end
	name, _, _, _, _, _, _, _ = UnitChannelInfo(UnitName)
	if name~=nil then
		local j=1
		while (BiXuDaDuanSpell[j]~=nil and BiXuDaDuanSpell[j]~="")
		do
			if BiXuDaDuanSpell[j]==name then
				return true
			end
			j=j+1
		end
	end
	return false
end









--技能冷却可用 不含资源监测
function WR_SpellIsCD(Spell)
	if IsPlayerSpell(Spell)
	--已学技能
	and
	WR_GetGCD(Spell)<=GCD
	--技能冷却完毕
--[[
	and
	(
		GetSpellCharges(Spell)==nil
		--技能可用次数 为空值（无次数的技能显示空值）
		or
		GetSpellCharges(Spell)>=1
		--技能可用次数>=1
	)
--]]
	then
		return true
	end			
	return false
end




--获得指定技能范围内最高生命值的单位
function WR_GetMaxHPUnit(MinHP,SpellName)
	local MaxHP=0	--初始化记录最高血量
	local MaxHPUnit=""	--初始化最高血量目标
	if WR_TargetInCombat("target") and UnitHealth("target")>MaxHP and IsSpellInRange(SpellName,"target")==1 and UnitCanAttack("player","target")==true then
	--单位可攻击 并且 单位当前血量>记录最高血量 并且 目标在技能范围内 并且 单位是敌对的 并且 单位在战斗中
		if MinHP==nil or UnitHealth("target")/UnitHealthMax("target")<=MinHP then
		--最小HP==空 或者 单位血量比例HP<最小HP
			MaxHP=UnitHealth("target")
			MaxHPUnit="target"
		end
	end
	if WR_TargetInCombat("mouseover") and UnitHealth("mouseover")>MaxHP and IsSpellInRange(SpellName,"mouseover")==1 and UnitCanAttack("player","mouseover")==true and UnitGUID("target")~=UnitGUID("mouseover") then
	--单位可攻击 并且 单位当前血量>记录最高血量 并且 目标在技能范围内 并且 单位是敌对的 并且 我的目标~=对比的目标 并且 单位在战斗中
		if MinHP==nil or UnitHealth("mouseover")/UnitHealthMax("mouseover")<=MinHP then
		--最小HP==空 或者 单位血量比例HP<最小HP
			MaxHP=UnitHealth("mouseover")
			MaxHPUnit="mouseover"
		end
	end
	for i=1,4,1
	do
		if WR_TargetInCombat("party"..i.."target") and UnitHealth("party"..i.."target")>MaxHP and IsSpellInRange(SpellName,"party"..i.."target")==1 and UnitCanAttack("player","party"..i.."target")==true and UnitGUID("target")~=UnitGUID("party"..i.."target") then
		--单位可攻击 并且 单位当前血量>记录最高血量 并且 目标在技能范围内 并且 单位是敌对的 并且 我的目标~=对比的目标 并且 单位在战斗中
			if MinHP==nil or UnitHealth("party"..i.."target")/UnitHealthMax("party"..i.."target")<=MinHP then
			--最小HP==空 或者 单位血量比例HP<最小HP
				MaxHP=UnitHealth("party"..i.."target")
				MaxHPUnit="party"..i.."target"
			end
		end
	end
	return MaxHPUnit
end









--判断是否副本中最后一次战斗
function WR_EndGame()
	local UName,_ = UnitName("target")
	if UName==nil then
		return false
	end
	local j=1
	while (EndGameBossName[j]~=nil and EndGameBossName[j]~="")
	do
		if EndGameBossName[j]==UName then
			return true
		end
		j=j+1
	end
	return false
end



--判断是否集合型战斗
function WR_AssemblyCombat()
	local UName,_ = UnitName("target")
	if UName==nil then
		return false
	end
	local j=1
	while (AssemblyName[j]~=nil and AssemblyName[j]~="")
	do
		if AssemblyName[j]==UName then
			return true
		end
		j=j+1
	end
	return false
end



--使用 爆发药水
function WR_Use_BFYS()
	local BFYS={
	[1]="飞逝元素究极强能药水",
	[2]="元素究极强能药水",
	[3]="元素强能药水",
	}
	local BFYS_ID
	for _, BFYS_name in ipairs(BFYS) do
		local count=GetItemCount(BFYS_name)
		--获取物品数量
		local start, duration, enable = GetItemCooldown(BFYS_name)
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			return true
		end
	end
	return false
end