--作者微信:WOW-Robot(转载请保留,感谢!)

--|cffffffff	(纯白)
--|cffffdf00	(金黄)
--|cff00ff00	(浅绿)
--|cff0cbd0c	(深绿)
--|cff00adf0	(浅蓝)
--|cff003fff	(深蓝)
--|cffff5040	(棕色)

local MAJOR_VERSION = "WOW-Robot"
local MINOR_VERSION = tonumber(("$Revision: 214 $"):match("%d+")) + 10000000


local lib, oldminor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

WR = LibStub("WOW-Robot")

local isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
local isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
local isTBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local CallbackHandler = LibStub("CallbackHandler-1.0")
local SpellRange = LibStub("SpellRange-1.0")





--获得对自己施法剩余时间(单位)
function lib:GetUnitCastToMe(UnitName)
	local shifashengyushijian=nil
	local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(UnitName)
	if endTimeMS~=nil then
		if UnitIsUnit(UnitName.."target", "player") then
			shifashengyushijian=endTimeMS/1000-GetTime()
		end
	end
	return shifashengyushijian
end

--获得所有小于设定时间且对自己的施法
function lib:GetAllUnitCastToMe(Time)
	local CastToMe
	for i=1,40,1
	do
		CastToMe=lib:GetUnitCastToMe(nameplate[i])
		if CastToMe~=nil and CastToMe<=Time then
			--print("有单位对我施法")
			return true
		end
	end
	return false
end













--获得单位是否具有某个BUFF
function lib:GetUnitBuff(Unit,BuffName)
	local i
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
		if name==BuffName then
			return true
		end
	end
end

--获得单位是否具有来自自身的BUFF
function lib:GetUnitBuffByPlayer(Unit,BuffName)
	local i
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
		if name==BuffName and source=="player" then
			return true
		end
	end
end
	
--获得团队有来自自己的BUFF的数量
function lib:GetRiadBuffCount(BuffName)
	local i,TempUnit
	local sum=0
	for i=1,40,1
	do
		TempUnit="raid"..i
		if lib:GetUnitBuffByPlayer(TempUnit,BuffName) then
			sum=sum+1
		end
	end
	if MSG==1 then
		if UnitExists("raid1")==true then
			print("团队中|cff00ff00",BuffName,"|cffffffff的数量:|cffffdf00",sum,"|cffffffff个")
		end
	end
	return sum
end
































function lib:PlayerCanCast()
	if lib:GetUnitBuffInfo("player",108839)>0 then	--如果身上有浮冰
		return true
	end
	if not(lib:GetPlayerMove()) then	--如果没有在移动
		return true
	end
	return false
end














--获取当前指定技能范围内单位最长死亡时间(技能名称)[失效]
function lib:GetSpellRangeMaxDeathTime(SpellName)
	lib:GetNPDeathTime()
	local UnitIsSpellInRange,UnitInCombat,name,realm
	local sum=0
	local count=0
	local SpellRangeMaxDeathTime=0
	for i=1,40,1
	do
		name, realm = UnitName(nameplate[i])
		UnitIsSpellInRange=IsSpellInRange(SpellName,nameplate[i])
		--UTS=UnitThreatSituation("player",nameplate[i])
		--监测单位威胁值
		UnitInCombat=UnitAffectingCombat(nameplate[i])
		--检测单位是否在战斗
		if UnitIsSpellInRange~=nil and UnitInCombat==true and NPdeathtime[i]~=nil and SpellRangeMaxDeathTime~=nil and name~=nil then
			if UnitIsSpellInRange==1 and NPdeathtime[i]>SpellRangeMaxDeathTime and name~="爆炸物" then
				SpellRangeMaxDeathTime=NPdeathtime[i]
			end
		end
	end
	if MSG==1 then
		print("预计战斗结束时间:|cffffdf00",math.ceil(SpellRangeMaxDeathTime),"|cffffffff秒")
	end
	return SpellRangeMaxDeathTime
end





--获得[来自自己的]单位DeBUFF的持续时间(DeBuff名字,单位)
function lib:GetTargetDebuffTime(DebuffName,Unit)
	local DebuffTime=0
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if (name==DebuffName or spellId==DebuffName) and source=="player" then
			DebuffTime = expirationTime - GetTime()
		end
	end
	return DebuffTime
end

--获得来自自己的DeBUFF的持续时间(DeBuff名字,单位)
function lib:GetUnitDebuffTimeByMe(DebuffName,Unit)
	local DebuffTime=0
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if (name==DebuffName or spellId==DebuffName) and source=="player" then
			DebuffTime = expirationTime - GetTime()
		end
	end
	return DebuffTime
end


--获得自身指定BUFF的信息(Buff名字)[返回值:Buff剩余时间,Buff堆叠数量]
function lib:GetPlayerBuffInfo(BuffName)
	local PlayerBuffTime=0
	local PlayerBuffCount=0
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff("player",i)
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if name == BuffName then
			PlayerBuffTime = expirationTime - GetTime()
			PlayerBuffCount = count
		end
	end
	return PlayerBuffTime,PlayerBuffCount
end





























--援护/保护队友
function lib:AidParty(Unit,Time)
	local j=1
	while (BaoHuDebuff[j]~=nil and BaoHuDebuff[j]~="")
	do
		if lib:GetUnitDebuff(Unit,BaoHuDebuff[j])==true then
		--如果有需要给保护祝福的DEBUFF
			return true
		end
		j=j+1
	end
	for i=1,40,1
	do
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(nameplate[i])
		if name~=nil then
		--施法存在
			if UnitIsUnit(nameplate[i].."target", Unit) then
			--施法对象是设置的单位
				local j=1
				while (AidSpell[j]~=nil and AidSpell[j]~="")
				do
					if AidSpell[j]==name then
					--判断是否需要援护的法术
						if endTimeMS/1000-GetTime()<=Time then
						--施法的时间<=设定值
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


--解除定身
function lib:JieChuDingShen()
	local j=1
	while (JieChuDingShenDebuff[j]~=nil and JieChuDingShenDebuff[j]~="")
	do
		if lib:GetUnitDebuff("player",JieChuDingShenDebuff[j])==true then
		--如果自身有需要解除定身的DEBUFF
			return true
		end
		j=j+1
	end
end


	




--获得范围内是否存在指定的施法的单位数量
function lib:GetRangeSpell(Range,SpellName)
	local UnitCount=0
	for i=1,40,1
	do
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(nameplate[i])
		if name==nil then
			name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(nameplate[i])
		end
		local minRange, maxRange = LRC:GetRange(nameplate[i])
		if maxRange~=nil and maxRange<=Range and name~=nil then
			local j=1
			while (SpellName[j]~=nil and SpellName[j]~="")
			do
				if SpellName[j]==name or SpellName[j]==spellId then
					UnitCount=UnitCount+1
				end
				j=j+1
			end
		end
	end
	return UnitCount
end

--获取指定类型敌对数量(范围,是否战斗中,类型(boss,elite,normal))
function lib:GetRangeHarmUnitClassCount(Range,InCombat,Class)
	local RangeHarm=0
	for i=1,40,1
	do
		local minRange, maxRange = LRC:GetRange(nameplate[i])
		local TargetCanAttack = UnitCanAttack("player",nameplate[i])--判断单位是可被攻击的
		local NPInCombat = UnitAffectingCombat(nameplate[i])--判断单位是否在战斗中
		local creatureType = UnitCreatureType(nameplate[i])--判断单位的类型
		local NPLevel=UnitLevel(nameplate[i])--判断单位的等级
		local NPClass=UnitClassification(nameplate[i])--判断单位的分类
		if minRange~=nil and maxRange~=nil and maxRange<=Range and TargetCanAttack==true and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
			if (NPInCombat==true and InCombat==true) or InCombat~=true then
				if (Class=="boss" and (NPLevel<0 or NPClass=="worldboss")) or (Class=="elite" and (NPClass=="rareelite" or NPClass=="rare" or NPClass=="elite")) or (Class=="normal" and (NPClass=="normal" or NPClass=="trivial" or NPClass=="minus")) then
					RangeHarm=RangeHarm+1
				end
			end
		end
	end
	return RangeHarm
end



--获得坦克防御权重
function lib:GetTankWeight()
	local InBoss=lib:InBossCombat() --判断是否在BOSS战
	local affixIDs = C_MythicPlus.GetCurrentAffixes() --获得当前词缀
	local TankLostHP=1-lib:GetUnitHP("player")
	--获得自身真实损失的血量百分比
	local i,j
	local MeleeWeightSum=0
	local MagicWeightSum=0
	local PhysicalWeightSum=0
	local ReflectionWeightSum=0
	local TankWeightSum=0
	local PercentageNew=1 --初始化增伤百分比
	
	if affixIDs~=nil then
		--词缀增伤--
		if InBoss==true and affixIDs[1].id~=nil and affixIDs[1].id==9 then
		--如果在Boss战斗中,9为残暴,首领增伤15%
			PercentageNew=1.15
		end
		if InBoss==false and affixIDs[1].id~=nil and affixIDs[1].id==10 then
		--如果不在Boss战斗中,10为强韧,小怪增伤30%
			PercentageNew=1.30
		end
		--词缀增伤--
		if MSG==1 then
			print("词缀增伤:",PercentageNew)
		end
	end
	
	for i=1,40,1
	do
		if UnitExists(nameplate[i])==true and UnitIsDead(nameplate[i])==false and UnitCanAttack("player",nameplate[i]) and UnitAffectingCombat(nameplate[i])==true then
		--如果 单位存在 并且 单位存活 并且 单位可被攻击 并且 单位在战斗中
			local _,maxRange = LRC:GetRange(nameplate[i])
			local Percentage=PercentageNew --初始化增伤百分比
			local MeleeWeight=0 --初始化近战权重
			local MagicWeight=0 --初始化魔法权重
			local PhysicalWeight=0 --初始化物理技能权重
			local ReflectionWeight=0 --初始化法术反射权重
			--BUFF增伤--
			local BuffSum=0
			_,_,BuffSum=lib:GetUnitBuffInfo(nameplate[i],228318)--激怒
			if BuffSum>=1 then
				Percentage=Percentage*(1.5)--怪物如果有激怒,增伤50%
			end
			BuffSum=0
			_,_,BuffSum=lib:GetUnitBuffInfo(nameplate[i],209859)--激励
			if BuffSum>=1 then
				Percentage=Percentage*(1.20^BuffSum)--怪物如果有激励,每个BUFF增伤20%
			end
			--BUFF增伤--
			
			--单位近战权重--
			local NPLevel=UnitLevel(nameplate[i])--判断单位的等级
			local NPClass=UnitClassification(nameplate[i])--判断单位的分类
			local name,_,_,_,endTimeMS,_,_,_,_ = UnitCastingInfo(nameplate[i]) --单位施法情况
			local CastingEndTime=0
			if endTimeMS~=nil then
				CastingEndTime=endTimeMS/1000-GetTime()
			end
			if name==nil then
				name,_,_,_,_,_,_,_ = UnitChannelInfo(nameplate[i]) --单位引导施法情况
				if name~=nil then
					CastingEndTime=1
				end
			end
			if maxRange~=nil and maxRange<=3 and name==nil then
			--如果单位距离3码内 并且 没有施法
				if NPLevel<0 or NPClass=="worldboss" or lib:UnitIsBoss(nameplate[i]) then
				--如果单位等级为骷髅 或者 单位类型为BOSS 
					MeleeWeight=MeleeWeight+10
				end
				if NPClass=="rareelite" or NPClass=="rare" or NPClass=="elite" then
				--如果单位类型为 稀有精英 稀有 精英
					MeleeWeight=MeleeWeight+5
				end
				if NPClass=="normal" or NPClass=="trivial" or NPClass=="minus" then
				--如果单位类型为 普通 或 召唤小怪
					MeleeWeight=MeleeWeight+1
				end
			end
			
			--单位施法或物理技能权重--
			if name~=nil and CastingEndTime>0 and CastingEndTime<=1.5 then
			--如果施法存在 并且施法时间剩余1.5s
				--施法权重--
				j=1
				while (MagicKillTank_1[j]~=nil and MagicKillTank_1[j]~="")
				do
					if MagicKillTank_1[j]==name or MagicKillTank_1[j]==spellId then
						MagicWeight=80
					end
					j=j+1
				end
				j=1
				while (MagicKillTank_2[j]~=nil and MagicKillTank_2[j]~="")
				do
					if MagicKillTank_2[j]==name or MagicKillTank_2[j]==spellId then
						MagicWeight=50
					end
					j=j+1
				end
				j=1
				while (MagicKillTank_3[j]~=nil and MagicKillTank_3[j]~="")
				do
					if MagicKillTank_3[j]==name or MagicKillTank_3[j]==spellId then
						MagicWeight=30
					end
					j=j+1
				end
				--施法权重--
				
				--物理技能权重--
				j=1
				while (PhysicalKillTank_1[j]~=nil and PhysicalKillTank_1[j]~="")
				do
					if PhysicalKillTank_1[j]==name or PhysicalKillTank_1[j]==spellId then
						PhysicalWeight=80
					end
					j=j+1
				end
				j=1
				while (PhysicalKillTank_2[j]~=nil and PhysicalKillTank_2[j]~="")
				do
					if PhysicalKillTank_2[j]==name or PhysicalKillTank_2[j]==spellId then
						PhysicalWeight=50
					end
					j=j+1
				end
				j=1
				while (PhysicalKillTank_3[j]~=nil and PhysicalKillTank_3[j]~="")
				do
					if PhysicalKillTank_3[j]==name or PhysicalKillTank_3[j]==spellId then
						PhysicalWeight=30
					end
					j=j+1
				end
				--物理技能权重--
				
				if MagicWeight==0 and PhysicalWeight==0 and UnitIsUnit(nameplate[i].."target", "player") then
				--如果施法权重为0 并且 物理技能权重为0 并且 单位的目标是我
				--这种情况说明有怪物对我施法，但是并不在高危技能范畴，通常这种都是法术施法，物理技能的概率比较小
					MagicWeight=10	--给予施法权重
				end

				--反射法术权重--
				j=1
				while (Reflection[j]~=nil and Reflection[j]~="")
				do
					if Reflection[j]==name or Reflection[j]==spellId then
						ReflectionWeight=100
					end
					j=j+1
				end
				if ReflectionWeight>0 and lib:GetUnitBuff("player","法术反射")==true then
					ReflectionWeight=0
					MagicWeight=0
				end
				--反射法术权重--

			end
			
			--单位BUFF危险权重--
			j=1
			while (MagicBuffKillTank_2[j]~=nil and MagicBuffKillTank_2[j]~="")
			do
				local _,_,BuffSum=lib:GetUnitBuffInfo(nameplate[i],MagicBuffKillTank_2[j])
				if BuffSum>0 then
					MagicWeight=40
				end
				j=j+1
			end
			
			--权重*掉血比例
			MeleeWeight=MeleeWeight*Percentage	--*(1+TankLostHP)	--单位近战权重--
			MagicWeight=MagicWeight*Percentage	--*(1+TankLostHP)
			PhysicalWeight=PhysicalWeight*Percentage	--*(1+TankLostHP)
			
			--单位施法或物理技能权重--
			MeleeWeightSum=MeleeWeightSum+MeleeWeight
			MagicWeightSum=MagicWeightSum+MagicWeight
			PhysicalWeightSum=PhysicalWeightSum+PhysicalWeight
			ReflectionWeightSum=ReflectionWeightSum+ReflectionWeight
			MeleeWeightSum=math.ceil(MeleeWeightSum*10)/10
			MagicWeightSum=math.ceil(MagicWeightSum*10)/10
			PhysicalWeightSum=math.ceil(PhysicalWeightSum*10)/10
			if MSG==1 then
				print(i,"号权重,近战:",MeleeWeight,",法术技能:",MagicWeight,",物理技能:",PhysicalWeight)
			end
		end
	end
	local MagicProtection=0
	local PhysicalProtection=0
	PhysicalWeightSum=PhysicalWeightSum+MeleeWeightSum
	if lib:GetUnitDebuff("target","提尔之眼")==true or lib:GetUnitDebuff("target","挫志怒吼")==true then
		MagicProtection=MagicProtection+0.25
		PhysicalProtection=PhysicalProtection+0.25
	end
	if lib:GetUnitBuff("player","炽热防御者")==true then
		MagicProtection=MagicProtection+0.50
		PhysicalProtection=PhysicalProtection+0.50
	end
	if lib:GetUnitBuff("player","盾牌格挡")==true then
		PhysicalProtection=PhysicalProtection+0.40
	end
	if lib:GetUnitBuff("player","法术格挡")==true then
		MagicProtection=MagicProtection+0.35
	end
	if lib:GetUnitBuff("player","法术反射")==true then
		MagicProtection=MagicProtection+0.20
	end
	local _,BuffCount,_=lib:GetUnitBuffInfo("player","戒卫")
	if BuffCount>0 then
		MagicProtection=MagicProtection+0.04*BuffCount
		PhysicalProtection=PhysicalProtection+0.04*BuffCount
	end
	if lib:GetUnitBuff("player","远古列王守卫")==true then
		MagicProtection=MagicProtection+0.50
		PhysicalProtection=PhysicalProtection+0.50
	end
	if lib:GetUnitBuff("player","盾墙")==true then
		MagicProtection=MagicProtection+0.40
		PhysicalProtection=PhysicalProtection+0.40
	end
	if lib:GetUnitBuff("player","正义盾击")==true then
		PhysicalProtection=PhysicalProtection+0.20
	end
	if lib:GetUnitBuff("player","防御姿态")==true then
		MagicProtection=MagicProtection+0.10
		PhysicalProtection=PhysicalProtection+0.10
	end
	if lib:GetUnitBuff("player","奉献")==true then
		MagicProtection=MagicProtection+0.15
		PhysicalProtection=PhysicalProtection+0.15
	end
	if lib:GetUnitBuff("player","痛苦压制")==true then
		MagicProtection=MagicProtection+0.40
		PhysicalProtection=PhysicalProtection+0.40
	end
	if lib:GetUnitBuff("player","铁木树皮")==true then
		MagicProtection=MagicProtection+0.20
		PhysicalProtection=PhysicalProtection+0.20
	end
	
	MagicWeightSum=MagicWeightSum*(1-MagicProtection)
	PhysicalWeightSum=PhysicalWeightSum*(1-PhysicalProtection)
	if MagicWeightSum<0 then MagicWeightSum=0 end
	if PhysicalWeightSum<0 then PhysicalWeightSum=0 end
	TankWeightSum=MagicWeightSum+PhysicalWeightSum
	if MSG==1 then
		print("权重，法反:",ReflectionWeightSum,",法术:",MagicWeightSum,",物理:",PhysicalWeightSum,"综合:",TankWeightSum)
	end
	return ReflectionWeightSum,MagicWeightSum,PhysicalWeightSum,TankWeightSum
	--返回法术反射权重,法术危险权重,物理危险权重,综合危险权重
end




















--获得高危险持续型AOE是否存在（血量百分比低于HP）
function lib:GetDangerSustainedAoe(HP)
	if HP==nil or UnitHealth("player")/UnitHealthMax("player")<=HP then
		local i
		for i=1,40,1
		do
			if UnitExists(nameplate[i]) then
				local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(nameplate[i])
				if endTimeMS==nil then
				--如果没有施法，则判断引导法术
					name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(nameplate[i])
				end
				if endTimeMS~=nil then
				--施法存在
					local j=1
					while (DangerSustainedAoe[j]~=nil and DangerSustainedAoe[j]~="")
					do
						if DangerSustainedAoe[j]==name then
						--判断是否持续型AOE
							return true
						end
						j=j+1
					end
				end
			end
		end
	end
	return false
end















--当我的焦点标记不是我TMW计数器设定的,判断单位的标记是不是与TMW计数器设置的一样
function lib:FocusUnit(Unit,TMWCounters)
	if TMWCounters~=nil and UnitExists(Unit)==true and UnitCanAttack("player",Unit)==true then
	--计数器不是空 并且 单位存在 并且 单位是敌对
		if GetRaidTargetIndex("focus")~=TMWCounters then
		--如果焦点的标记不是TMW计数器设定的标记
			if GetRaidTargetIndex(Unit)==TMWCounters then
			--指定单位存在 并且 指定单位的标记==TMW设定的标记
				return true
			end
		end
	end
	return false
end

--这个是一个注册聊天窗口事情的过程,注册是怪物的说/喊/表情,以及说话的内容,可以找出是谁说的话,还有说话的内容是否出现某段文字
function lib:FindFrameMonsterMSG(Unit,TMWCounters)
	local frame = CreateFrame("FRAME")
	frame:RegisterEvent("CHAT_MSG_MONSTER_SAY")
	frame:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	frame:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	frame:SetScript("OnEvent", function(self, event, message, sender, _, _, _, _, _, _, _, _, guid)
		if event == "CHAT_MSG_MONSTER_SAY" or event == "CHAT_MSG_MONSTER_YELL" or event == "CHAT_MSG_MONSTER_EMOTE" then
			if sender == "萨尔" then
				print("萨尔 " .. event .. " 了: " .. message)
			end
			if string.find(message, "大地之怒") then
				print("有人说了'大地之怒'了: " .. message)
			end
		end
	end)
end
--"CHAT_MSG_CHANNEL"		--聊天频道
--"CHAT_MSG_EMOTE"			--表情
--"CHAT_MSG_GUILD"			--公会
--"CHAT_MSG_OFFICER"		--官员
--"CHAT_MSG_PARTY"			--小队
--"CHAT_MSG_RAID"			--团队
--"CHAT_MSG_SAY"			--说话
--"CHAT_MSG_SYSTEM"			--系统信息
--"CHAT_MSG_WHISPER"		--悄悄话
--"CHAT_MSG_YELL"			--大喊
--"CHAT_MSG_MONSTER_SAY"	--怪物说话
--"CHAT_MSG_MONSTER_YELL"	--怪物喊话
--"CHAT_MSG_MONSTER_EMOTE"	----怪物表情















--获取一个技能实际最长冷却所需时间
function lib:GetTrueCooldownTime(CooldownTime)
	return CooldownTime/(1+GetHaste()/100)	--通过急速获取法术的实际施法时间
end














--检测队友是否停止移动
function lib:PartyStop()
	local currentSpeed
	currentSpeed,_,_,_ = GetUnitSpeed("player")
	if currentSpeed==0 then
	--单位移动速度为0
		if UnitAffectingCombat("player") then
		--单位在战斗中
			return true
		end
	end
	for i = 1, 4 do
		local TempUnit="party"..i
		currentSpeed,_,_,_ = GetUnitSpeed(TempUnit)
		if currentSpeed==0 then
		--单位移动速度为0
			if UnitAffectingCombat(TempUnit) then
			--单位在战斗中
				return true
			end
		end
	end
	return false
end







--判断是否副本中最后一次战斗
function lib:EndGame()
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



function lib:LastHandTime()	--获得主副手攻击时间(战斗事件)
	local CLEUFrame = CreateFrame("Frame")
	CLEUFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	CLEUFrame:SetScript("OnEvent", function()
			local combatEvent=select(2, CombatLogGetCurrentEventInfo())
			local sourceGUID=select(4, CombatLogGetCurrentEventInfo())
			local isOffHand=select(24, CombatLogGetCurrentEventInfo())
			if sourceGUID==UnitGUID("player") and (combatEvent=="SWING_DAMAGE" or combatEvent=="SWING_MISSED") then
				if isOffHand then
					OffHandTime=GetTime()
				else
					MainHandTime=GetTime()
				end
			end
	end)
	
end

function lib:NextHandTime()	--获得下一次主副手攻击剩余时间
	local NextMainHandTime=0
	local NextOffHandTime=0
	if MainHandTime~=nil and mainSpeed~=nil then
		NextMainHandTime=MainHandTime+mainSpeed-GetTime()
	end
	if NextMainHandTime<0 then
		NextMainHandTime=0
	end
	if OffHandTime~=nil and offSpeed~=nil then
		NextOffHandTime=OffHandTime+offSpeed-GetTime()
	end
	if NextMainHandTime<0 then
		NextMainHandTime=0
	end
	return NextMainHandTime,NextOffHandTime
end














































--以下均为个性化职业的过程
--
--







function lib:bnn()
	local name, realm = UnitFullName("player")
	local namerealm=RCheck:getnamerealm(name, realm)
	local fid=RCheck:GetRange("target")
	return fid
end

function lib:KillTargetTime(temp)
	if UnitExists("player") then
		return temp
	end
end

function lib:getnamerealm(name,realm)
	local namerealm=RCheck:getnamerealm(name, realm)
	return namerealm
end

--获得变形的GCD
function lib:bianxingGCD()
	local bianxing=0
	local startTime, duration, isActive = GetShapeshiftFormCooldown(1)
	if startTime~=nil and duration~=nil then
		bianxing = startTime + duration - GetTime()
		if bianxing<0 then bianxing=0 end
	end
	return bianxing
end

--获取附近目标数量(这个已经被获取指定技能范围敌对目标数量所代替)
function lib:fanweidanwei()
	Range5=0
	Range8=0
	Range20=0
	Range30=0
	if maxR==nil then
		maxR=RCheck:GetRange("target")
	end
	for i=1,40,1
	do
		local minRange, maxRange = LRC:GetRange(nameplate[i])
		local TargetCanAttack = UnitCanAttack("player",nameplate[i])--判断单位是可被攻击的
		local creatureType = UnitCreatureType(nameplate[i])--判断单位的类型
		if minRange~=nil and maxRange~=nil and maxRange<=5 and TargetCanAttack==true and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
			Range5=Range5+1
		end
		if minRange~=nil and maxRange~=nil and maxRange<=8 and TargetCanAttack==true and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
			Range8=Range8+1
		end
		if minRange~=nil and maxRange~=nil and maxRange<=20 and TargetCanAttack==true and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
			Range20=Range20+1
		end
		if minRange~=nil and maxRange~=nil and maxRange<=30 and TargetCanAttack==true and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
			Range30=Range30+1
		end
	end
end

--计算目标死亡时间(这个已经被获取姓名版死亡时间所代替,已经用不上了)
function lib:deathtime()
	local targetlevel = UnitLevel("target")
	if targetlevel~=nil and targetlevel>0 then
		UnitHealthProportion=0.9
	elseif targetlevel~=nil and targetlevel<=0 then
		UnitHealthProportion=0.3
	end
	if UnitGUID("target")== nil then
		targetGUID=nil --如果没有目标,记录的目标ID设置为空值
		targetbegintime=nil --如果没有目标,记录的目标开始时间设置为空值
		targethealth=nil --如果没有目标,记录的目标血量设置为空值
		todeathtime=nil --如果没有目标,记录的死亡时间设置为空值
	end
	if targetGUID ~= UnitGUID("target") and UnitGUID("target")~= nil then 
		targetGUID=UnitGUID("target") --如果保存的ID不是当前目标ID,把保存的ID设置为当前目标ID
		targetbegintime=nil --如果保存的ID不是当前目标ID,记录的目标开始时间设置为空值
		targethealth=nil --如果保存的ID不是当前目标ID,记录的目标血量设置为空值
		todeathtime=nil --如果没有目标,记录的死亡时间设置为空值
	end 
	if targetGUID == UnitGUID("target") and UnitGUID("target")~= nil and UnitThreatSituation("player", "target")~=nil and UnitHealthMax("target")*UnitHealthProportion>UnitHealth("target") then
	--如果保存的目标是当前目标,目标不是空,目标有仇恨,目标血量低于设定值
		if targetbegintime==nil then
			targetbegintime=GetTime() --如果保存时间是空值,把当前目标时间保存
		end
		if targethealth==nil then
			targethealth=UnitHealth("target")  --如果保存血量是空值,把当前目标血量保存
		end
	end
	if UnitGUID("target")~=nil and targetGUID~=nil and targetbegintime~=nil and targethealth~=nil and targetGUID==UnitGUID("target") and targethealth>UnitHealth("target") and targetbegintime < GetTime() then 
		todeathtime = UnitHealth("target")/((targethealth-UnitHealth("target"))/(GetTime()-targetbegintime))
		--当前血量/((之前保存血量-当前血量)/(当前时间-之前保存的时间))=当前血量/(消耗的血量/消耗的时间)=当前血量/(每秒耗血)=死亡时间
	end 
	return todeathtime
end


--关闭指定的追踪
function lib:guanbizhuizong(text)
	local texture
	for i=1,5,1
	do
		local name, texture, active, category, nested = GetTrackingInfo(i)
		if texture~=nil and texture==text then
			SetTracking(i,false)
		end
	end
end

--获取附魔及珠宝信息
function lib:fumozhubao(ItemLink)
	local gloveLink = GetInventoryItemLink("player", ItemLink)
	if gloveLink then
		local itemId, enchantId, gem1, gem2, gem3 = gloveLink:match("item:(%d*):(%d*):(%d*):(%d*):(%d*)")
		return itemId, enchantId, gem1, gem2, gem3
	end
end

--获取主副手下一次攻击时间
function lib:NextHandTime()
	local NextMainHandTime,NextOffHandTime,isOffHand
	local mainSpeed, offSpeed = UnitAttackSpeed("player")
	local TempFrame = CreateFrame("Frame")
	TempFrame:SetScript("OnEvent", function()
			local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
			if sourceGUID==UnitGUID("player") then
				if subevent=="SWING_DAMAGE" then
					isOffHand= select(21, CombatLogGetCurrentEventInfo())
				end
				if subevent=="SWING_MISSED" then
					isOffHand= select(13, CombatLogGetCurrentEventInfo())
				end
				if isOffHand==true then
					OffHandTime=GetTime()
				elseif isOffHand==false then
					MainHandTime=GetTime()
				end
			end
	end)
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	
	----------
	NextMainHandTime=0
	NextOffHandTime=0
	if MainHandTime~=nil and mainSpeed~=nil then
		NextMainHandTime=MainHandTime+mainSpeed-GetTime()
	end
	if NextMainHandTime<0 then
		NextMainHandTime=0
	end
	if OffHandTime~=nil and offSpeed~=nil then
		NextOffHandTime=OffHandTime+offSpeed-GetTime()
	end
	if NextOffHandTime<0 then
		NextOffHandTime=0
	end
	subevent=nil
	sourceGUID=nil
	isOffHand=nil
	return NextMainHandTime,NextOffHandTime
end



--其他API

--获取当前副本类型
--local inInstance, instanceType = IsInInstance()
--inInstance返回值为true为副本,false为非副本
--instanceType返回值为:
--"none" 野外
--"pvp" 战场
--"arena" 竞技场
--"party" 5人副本
--"raid" 团本
--"scenario" 场景
TangShi300={
    [1]="兰叶春葳蕤，桂华秋皎洁。",
	[2]="欣欣此生意，自尔为佳节。",
	[3]="谁知林栖者，闻风坐相悦。",
	[4]="草木有本心，何求美人折！",
	[5]="江南有丹橘，经冬犹绿林。",
	[6]="岂伊地气暖？自有岁寒心。",
	[7]="可以荐嘉客，奈何阻重深。",
	[8]="运命惟所遇，循环不可寻。",
	[9]="徒言树桃李，此木岂无阴？",
	[10]="暮从碧山下，山月随人归。",
	[11]="却顾所来径，苍苍横翠微。",
	[12]="相携及田家，童稚开荆扉。",
	[13]="绿竹入幽径，青萝拂行衣。",
	[14]="欢言得所憩，美酒聊共挥。",
	[15]="长歌吟松风，曲尽河星稀。",
	[16]="我醉君复乐，陶然共忘机。",
	[17]="花间一壶酒，独酌无相亲。",
	[18]="举杯邀明月，对影成三人。",
	[19]="月既不解饮，影徒随我身。",
	[20]="暂伴月将影，行乐须及春。",
	[21]="我歌月徘徊，我舞影零乱。",
	[22]="醒时同交欢，醉后各分散。",
	[23]="永结无情游，相期邈云汉。",
	[24]="燕草如碧丝，秦桑低绿枝。",
	[25]="当君怀归日，是妾断肠时。?",
	[26]="春风不相识，何事入罗帏。",
	[27]="岱宗夫如何？齐鲁青未了。",
	[28]="造化钟神秀，阴阳割昏晓。",
	[29]="荡胸生曾云，决眦入归鸟。",
	[30]="会当凌绝顶，一览众山小。",
	[31]="人生不相见，动如参与商。",
	[32]="今夕复何夕，共此灯烛光！",
	[33]="少壮能几时？鬓发各已苍！",
	[34]="访旧半为鬼，惊呼热中肠。",
	[35]="焉知二十载，重上君子堂。",
	[36]="昔别君未婚，儿女忽成行。",
	[37]="怡然敬父执，问我来何方？",
	[38]="问答未及已，儿女罗酒浆。",
	[39]="夜雨剪春韭，新炊间黄粱。",
	[40]="主称会面难，一举累十觞。",
	[41]="十觞亦不醉，感子故意长。",
	[42]="明日隔山岳，世事两茫茫。",
	[43]="绝代有佳人，幽居在空谷。",
	[44]="自云良家子，零落依草木。",
	[45]="关中昔丧乱，兄弟遭杀戮。",
	[46]="官高何足论，不得收骨肉。",
	[47]="世情恶衰歇，万事随转烛。",
	[48]="夫婿轻薄儿，新人美如玉。",
	[49]="合昏尚知时，鸳鸯不独宿。",
	[50]="但见新人笑，那闻旧人哭。",
	[51]="在山泉水清，出山泉水浊。",
	[52]="侍婢卖珠回，牵萝补茅屋。",
	[53]="摘花不插发，采柏动盈掬。",
	[54]="天寒翠袖薄，日暮倚修竹。",
	[55]="死别已吞声，生别常恻恻。",
	[56]="江南瘴疠地，逐客无消息。",
	[57]="故人入我梦，明我长相忆。",
	[58]="恐非平生魂，路远不可测。",
	[59]="魂来枫林青，魂返关塞黑。",
	[60]="君今在罗网，何以有羽翼。",
	[61]="落月满屋梁，犹疑照颜色。",
	[62]="水深波浪阔，无使蛟龙得。",
	[63]="浮云终日行，游子久不至。",
	[64]="三夜频梦君，情亲见君意。",
	[65]="告归常局促，苦道来不易。",
	[66]="江湖多风波，舟楫恐失坠。",
	[67]="出门搔白首，若负平生志。",
	[68]="冠盖满京华，斯人独憔悴。",
	[69]="孰云网恢恢，将老身反累。",
	[70]="千秋万岁名，寂寞身后事。",
	[71]="圣代无隐者，英灵尽来归。",
	[72]="遂令东山客，不得顾采薇。",
	[73]="既至金门远，孰云吾道非。",
	[74]="江淮度寒食，京洛缝春衣。",
	[75]="置酒长安道，同心与我违。",
	[76]="行当浮桂棹，未几拂荆扉。",
	[77]="远树带行客，孤城当落晖。",
	[78]="吾谋适不用，勿谓知音稀。",
	[79]="下马饮君酒，问君何所之？",
	[80]="君言不得意，归卧南山陲。",
	[81]="但去莫复问，白云无尽时。",
	[82]="言入黄花川，每逐清溪水。",
	[83]="随山将万转，趣途无百里。",
	[84]="声喧乱石中，色静深松里。",
	[85]="漾漾泛菱荇，澄澄映葭苇。",
	[86]="我心素已闲，清川澹如此。",
	[87]="请留磐石上，垂钓将已矣。",
	[88]="斜阳照墟落，穷巷牛羊归。",
	[89]="野老念牧童，倚杖候荆扉。",
	[90]="雉雊麦苗秀，蚕眠桑叶稀。",
	[91]="田夫荷锄至，相见语依依。",
	[92]="即此羡闲逸，怅然吟式微。",
	[93]="艳色天下重，西施宁久微。",
	[94]="朝为越溪女，暮作吴宫妃。",
	[95]="贱日岂殊众，贵来方悟稀。",
	[96]="邀人傅香粉，不自著罗衣。",
	[97]="君宠益娇态，君怜无是非。",
	[98]="当时浣纱伴，莫得同车归。",
	[99]="持谢邻家子，效颦安可希。",
	[100]="北山白云里，隐者自怡悦。",
	[101]="相望试登高，心随雁飞灭。",
	[102]="愁因薄暮起，兴是清秋发。",
	[103]="时见归村人，沙行渡头歇。",
	[104]="天边树若荠，江畔洲如月。",
	[105]="何当载酒来，共醉重阳节。",
	[106]="山光忽西落，池月渐东上。",
	[107]="散发乘夕凉，开轩卧闲敞。",
	[108]="荷风送香气，竹露滴清响。",
	[109]="欲取鸣琴弹，恨无知音赏。",
	[110]="感此怀故人，中宵劳梦想。",
	[111]="夕阳度西岭，群壑倏已暝。",
	[112]="松月生夜凉，风泉满清听。",
	[113]="樵人归欲尽，烟鸟栖初定。",
	[114]="之子期宿来，孤琴候萝径。",
	[115]="高卧南斋时，开帷月初吐。",
	[116]="清辉澹水木，演漾在窗户。",
	[117]="冉冉几盈虚，澄澄变今古。",
	[118]="美人清江畔，是夜越吟苦。",
	[119]="千里共如何，微风吹兰杜。",
	[120]="绝顶一茅茨，直上三十里。",
	[121]="扣关无僮仆，窥室唯案几。",
	[122]="若非巾柴车，应是钓秋水。",
	[123]="差池不相见，黾勉空仰止。",
	[124]="草色新雨中，松声晚窗里。",
	[125]="及兹契幽绝，自足荡心耳。",
	[126]="虽无宾主意，颇得清净理。",
	[127]="兴尽方下山，何必待之子。",
	[128]="幽意无断绝，此去随所偶。",
	[129]="晚风吹行舟，花路入溪口。",
	[130]="际夜转西壑，隔山望南斗。",
	[131]="潭烟飞溶溶，林月低向后。",
	[132]="生事且弥漫，愿为持竿叟。",
	[133]="清溪深不测，隐处唯孤云。",
	[134]="松际露微月，清光犹为君。",
	[135]="茅亭宿花影，药院滋苔纹。",
	[136]="余亦谢时去，西山鸾鹤群。",
	[137]="塔势如涌出，孤高耸天宫。",
	[138]="登临出世界，磴道盘虚空。",
	[139]="突兀压神州，峥嵘如鬼工。",
	[140]="四角碍白日，七层摩苍穹。",
	[141]="下窥指高鸟，俯听闻惊风。",
	[142]="连山若波涛，奔凑似朝东。",
	[143]="青槐夹驰道，宫馆何玲珑。",
	[144]="秋色从西来，苍然满关中。",
	[145]="五陵北原上，万古青濛濛。",
	[146]="净理了可悟，胜因夙所宗。",
	[147]="誓将挂冠去，觉道资无穷。",
	[148]="昔岁逢太平，山林二十年。",
	[149]="泉源在庭户，洞壑当门前。",
	[150]="井税有常期，日晏犹得眠。",
	[151]="忽然遭世变，数岁亲戎旃。",
	[152]="今来典斯郡，山夷又纷然。",
	[153]="城小贼不屠，人贫伤可怜。",
	[154]="是以陷邻境，此州独见全。",
	[155]="使臣将王命，岂不如贼焉？",
	[156]="今彼征敛者，迫之如火煎。",
	[157]="谁能绝人命，以作时世贤！",
	[158]="思欲委符节，引竿自刺船。",
	[159]="将家就鱼麦，归老江湖边。",
	[160]="兵卫森画戟，宴寝凝清香。",
	[161]="海上风雨至，逍遥池阁凉。",
	[162]="烦疴近消散，嘉宾复满堂。",
	[163]="自惭居处崇，未睹斯民康。",
	[164]="理会是非遣，性达形迹忘。",
	[165]="鲜肥属时禁，蔬果幸见尝。",
	[166]="俯饮一杯酒，仰聆金玉章。",
	[167]="神欢体自轻，意欲凌风翔。",
	[168]="吴中盛文史，群彦今汪洋。",
	[169]="方知大藩地，岂曰财赋强。",
	[170]="凄凄去亲爱，泛泛入烟雾。",
	[171]="归棹洛阳人，残钟广陵树。",
	[172]="今朝此为别，何处还相遇。",
	[173]="世事波上舟，沿洄安得住。",
	[174]="今朝郡斋冷，忽念山中客。",
	[175]="涧底束荆薪，归来煮白石。",
	[176]="欲持一瓢酒，远慰风雨夕。",
	[177]="落叶满空山，何处寻行迹。",
	[178]="客从东方来，衣上灞陵雨。",
	[179]="问客何为来，采山因买斧。?",
	[180]="冥冥花正开，飏飏燕新乳。",
	[181]="昨别今已春，鬓丝生几缕。",
	[182]="落帆逗淮镇，停舫临孤驿。",
	[183]="浩浩风起波，冥冥日沉夕。",
	[184]="人归山郭暗，雁下芦洲白。",
	[185]="独夜忆秦关，听钟未眠客。",
	[186]="吏舍跼终年，出郊旷清曙。",
	[187]="杨柳散和风，青山澹吾虑。",
	[188]="依丛适自憩，缘涧还复去。",
	[189]="微雨霭芳原，春鸠鸣何处。",
	[190]="乐幽心屡止，遵事迹犹遽。",
	[191]="终罢斯结庐，慕陶直可庶。",
	[192]="永日方戚戚，出行复悠悠。",
	[193]="女子今有行，大江溯轻舟。",
	[194]="尔辈苦无恃，抚念益慈柔。",
	[195]="幼为长所育，两别泣不休。",
	[196]="对此结中肠，义往难复留。",
	[197]="自小阙内训，事姑贻我忧。",
	[198]="赖兹托令门，任恤庶无尤。",
	[199]="贫俭诚所尚，资从岂待周。",
	[200]="孝恭遵妇道，容止顺其猷。",
	[201]="别离在今晨，见尔当何秋。",
	[202]="居闲始自遣，临感忽难收。",
	[203]="归来视幼女，零泪缘缨流。",
	[204]="汲井漱寒齿，清心拂尘服。",
	[205]="闲持贝叶书，步出东斋读。",
	[206]="真源了无取，妄迹世所逐。",
	[207]="遗言冀可冥，缮性何由熟。",
	[208]="道人庭宇静，苔色连深竹。",
	[209]="日出雾露余，青松如膏沐。",
	[210]="澹然离言说，悟悦心自足。",
	[211]="久为簪组束，幸此南夷谪。",
	[212]="闲依农圃邻，偶似山林客。",
	[213]="晓耕翻露草，夜傍响溪石。",
	[214]="来往不逢人，长歌楚天碧。",
	[215]="蝉鸣空桑林，八月萧关道。",
	[216]="出塞入塞寒，处处黄芦草。",
	[217]="从来幽并客，皆共尘沙老。",
	[218]="莫学游侠儿，矜夸紫骝好。",
	[219]="饮马渡秋水，水寒风似刀。",
	[220]="平沙日未没，黯黯见临洮。",
	[221]="昔日长城战，咸言意气高。",
	[222]="黄尘足今古，白骨乱蓬蒿。",
	[223]="明月出天山，苍茫云海间。",
	[224]="长风几万里，吹度玉门关。",
	[225]="汉下白登道，胡窥青海湾。",
	[226]="由来征战地，不见有人还。",
	[227]="戍客望边邑，思归多苦颜。",
	[228]="高楼当此夜，叹息未应闲。",
	[229]="长安一片月，万户捣衣声。",
	[230]="秋风吹不尽，总是玉关情。",
	[231]="何日平胡虏，良人罢远征。",
	[232]="妾发初覆额，折花门前剧。",
	[233]="郎骑竹马来，绕床弄青梅。",
	[234]="同居长干里，两小无嫌猜，",
	[235]="十四为君妇，羞颜未尝开。",
	[236]="低头向暗壁，千唤不一回。",
	[237]="十五始展眉，愿同尘与灰。",
	[238]="常存抱柱信，岂上望夫台。",
	[239]="十六君远行，瞿塘滟滪堆。",
	[240]="五月不可触，猿声天上哀。",
	[241]="门前迟行迹，一一生绿苔。",
	[242]="苔深不能扫，落叶秋风早。",
	[243]="八月蝴蝶来，双飞西园草。",
	[244]="感此伤妾心，坐愁红颜老。",
	[245]="早晚下三巴，预将书报家。",
	[246]="相迎不道远，直至长风沙。",
	[247]="梧桐相待老，鸳鸯会双死。",
	[248]="贞女贵殉夫，舍生亦如此。",
	[249]="波澜誓不起，妾心古井水。",
	[250]="慈母手中线，游子身上衣。",
	[251]="临行密密缝，意恐迟迟归。",
	[252]="谁言寸草心，报得三春晖。",
	[253]="元和天子神武姿，彼何人哉轩与羲。",
	[254]="誓将上雪列圣耻，坐法宫中朝四夷。",
	[255]="淮西有贼五十载，封狼生貙貙生罴。",
	[256]="不据山河据平地，长戈利矛日可麾。",
	[257]="帝得圣相相曰度，贼斫不死神扶持。",
	[258]="腰悬相印作都统，阴风惨澹天王旗。",
	[259]="愬武古通作牙爪，仪曹外郎载笔随。?",
	[260]="行军司马智且勇，十四万众犹虎貔。",
	[261]="入蔡缚贼献太庙，功无与让恩不訾。",
	[262]="帝曰汝度功第一，汝从事愈宜为辞。",
	[263]="愈拜稽首蹈且舞，金石刻画臣能为。",
	[264]="古者世称大手笔，此事不系于职司。",
	[265]="当仁自古有不让，言讫屡颔天子颐。",
	[266]="公退斋戒坐小阁，濡染大笔何淋漓。",
	[267]="文成破体书在纸，清晨再拜铺丹墀。",
	[268]="表曰臣愈昧死上，咏神圣功书之碑。",
	[269]="碑高三丈字如斗，负以灵鳌蟠以螭。",
	[270]="句奇语重喻者少，谗之天子言其私。",
	[271]="长绳百尺拽碑倒，粗砂大石相磨治。",
	[272]="公之斯文若元气，先时已入人肝脾。",
	[273]="汤盘孔鼎有述作，今无其器存其辞。",
	[274]="呜呼圣王及圣相，相与烜赫流淳熙。",
	[275]="公之斯文不示后，曷与三五相攀追。",
	[276]="愿书万本诵万遍，口角流沫右手胝。",
	[277]="传之七十有二代，以为封禅玉检明堂基。",
	[278]="浔阳江头夜送客，枫叶荻花秋瑟瑟。",
	[279]="主人下马客在船，举酒欲饮无管弦。",
	[280]="醉不成欢惨将别，别时茫茫江浸月。",
	[281]="忽闻水上琵琶声，主人忘归客不发。",
	[282]="寻声暗问弹者谁？琵琶声停欲语迟。",
	[283]="移船相近邀相见，添酒回灯重开宴。",
	[284]="千呼万唤始出来，犹抱琵琶半遮面。",
	[285]="转轴拨弦三两声，未成曲调先有情。",
	[286]="弦弦掩抑声声思，似诉平生不得志。",
	[287]="低眉信手续续弹，说尽心中无限事。",
	[288]="大弦嘈嘈如急雨，小弦切切如私语。",
	[289]="嘈嘈切切错杂弹，大珠小珠落玉盘。",
	[290]="间关莺语花底滑，幽咽泉流冰下难。",
	[291]="冰泉冷涩弦凝绝，凝绝不通声暂歇。",
	[292]="别有幽愁暗恨生，此时无声胜有声。",
	[293]="银瓶乍破水浆迸，铁骑突出刀枪鸣。",
	[294]="曲终收拨当心画，四弦一声如裂帛。",
	[295]="东船西舫悄无言，唯见江心秋月白。",
	[296]="沉吟放拨插弦中，整顿衣裳起敛容。",
	[297]="自言本是京城女，家在虾蟆陵下住。",
	[298]="十三学得琵琶成，名属教坊第一部。",
	[299]="曲罢曾教善才服，妆成每被秋娘妒。",
	[300]="五陵年少争缠头，一曲红绡不知数。",
	[301]="钿头银篦击节碎，血色罗裙翻酒污。",
	[302]="今年欢笑复明年，秋月春风等闲度。",
	[303]="弟走从军阿姨死，暮去朝来颜色故。",
	[304]="门前冷落鞍马稀，老大嫁作商人妇。",
	[305]="商人重利轻别离，前月浮梁买茶去。",
	[306]="去来江口守空船，绕船月明江水寒。",
	[307]="夜深忽梦少年事，梦啼妆泪红阑干。",
	[308]="我闻琵琶已叹息，又闻此语重唧唧。",
	[309]="同是天涯沦落人，相逢何必曾相识！",
	[310]="我从去年辞帝京，谪居卧病浔阳城。",
	[311]="浔阳地僻无音乐，终岁不闻丝竹声。",
	[312]="住近湓江地低湿，黄芦苦竹绕宅生。",
	[313]="其间旦暮闻何物？杜鹃啼血猿哀鸣。",
	[314]="春江花朝秋月夜，往往取酒还独倾。",
	[315]="岂无山歌与村笛，呕哑嘲哳难为听。",
	[316]="今夜闻君琵琶语，如听仙乐耳暂明。",
	[317]="感我此言良久立，却坐促弦弦转急。",
	[318]="凄凄不似向前声，满座重闻皆掩泣。",
	[319]="座中泣下谁最多？江州司马青衫湿。",
	[320]="汉皇重色思倾国，御宇多年求不得。",
	[321]="杨家有女初长成，养在深闺人未识。",
	[322]="天生丽质难自弃，一朝选在君王侧。",
	[323]="回眸一笑百媚生，六宫粉黛无颜色。",
	[324]="春寒赐浴华清池，温泉水滑洗凝脂。",
	[325]="侍儿扶起娇无力，始是新承恩泽时。",
	[326]="云鬓花颜金步摇，芙蓉帐暖度春宵。",
	[327]="春宵苦短日高起，从此君王不早朝。",
	[328]="承欢侍宴无闲暇，春从春游夜专夜。",
	[329]="后宫佳丽三千人，三千宠爱在一身。",
	[330]="金屋妆成娇侍夜，玉楼宴罢醉和春。",
	[331]="姊妹弟兄皆列土，可怜光彩生门户。",
	[332]="遂令天下父母心，不重生男重生女。",
	[333]="骊宫高处入青云，仙乐风飘处处闻。",
	[334]="缓歌慢舞凝丝竹，尽日君王看不足。",
	[335]="渔阳鼙鼓动地来，惊破霓裳羽衣曲。",
	[336]="九重城阙烟尘生，千乘万骑西南行。",
	[337]="翠华摇摇行复止，西出都门百余里。",
	[338]="六军不发无奈何，宛转蛾眉马前死。",
	[339]="花钿委地无人收，翠翘金雀玉搔头。",
	[340]="君王掩面救不得，回看血泪相和流。",
	[341]="黄埃散漫风萧索，云栈萦纡登剑阁。",
	[342]="峨嵋山下少人行，旌旗无光日色薄。",
	[343]="蜀江水碧蜀山青，圣主朝朝暮暮情。",
	[344]="行宫见月伤心色，夜雨闻铃肠断声。",
	[345]="天旋地转回龙驭，到此踌躇不能去。",
	[346]="马嵬坡下泥土中，不见玉颜空死处。",
	[347]="君臣相顾尽沾衣，东望都门信马归。",
	[348]="归来池苑皆依旧，太液芙蓉未央柳。",
	[349]="芙蓉如面柳如眉，对此如何不泪垂。",
	[350]="春风桃李花开日，秋雨梧桐叶落时。",
	[351]="西宫南内多秋草，落叶满阶红不扫。",
	[352]="梨园弟子白发新，椒房阿监青娥老。",
	[353]="夕殿萤飞思悄然，孤灯挑尽未成眠。",
	[354]="迟迟钟鼓初长夜，耿耿星河欲曙天。",
	[355]="鸳鸯瓦冷霜华重，翡翠衾寒谁与共。",
	[356]="悠悠生死别经年，魂魄不曾来入梦。",
	[357]="临邛道士鸿都客，能以精诚致魂魄。",
	[358]="为感君王辗转思，遂教方士殷勤觅。",
	[359]="排空驭气奔如电，升天入地求之遍。",
	[360]="上穷碧落下黄泉，两处茫茫皆不见。",
	[361]="忽闻海上有仙山，山在虚无缥渺间。",
	[362]="楼阁玲珑五云起，其中绰约多仙子。",
	[363]="中有一人字太真，雪肤花貌参差是。",
	[364]="金阙西厢叩玉扃，转教小玉报双成。",
	[365]="闻道汉家天子使，九华帐里梦魂惊。",
	[366]="揽衣推枕起徘徊，珠箔银屏迤逦开。",
	[367]="云鬓半偏新睡觉，花冠不整下堂来。",
	[368]="风吹仙袂飘飘举，犹似霓裳羽衣舞。",
	[369]="玉容寂寞泪阑干，梨花一枝春带雨。",
	[370]="含情凝睇谢君王，一别音容两渺茫。",
	[371]="昭阳殿里恩爱绝，蓬莱宫中日月长。",
	[372]="回头下望人寰处，不见长安见尘雾。",
	[373]="惟将旧物表深情，钿合金钗寄将去。",
	[374]="钗留一股合一扇，钗擘黄金合分钿。",
	[375]="但教心似金钿坚，天上人间会相见。",
	[376]="临别殷勤重寄词，词中有誓两心知。",
	[377]="七月七日长生殿，夜半无人私语时。",
	[378]="在天愿作比翼鸟，在地愿为连理枝。",
	[379]="天长地久有时尽，此恨绵绵无绝期。",
	[380]="渔翁夜傍西岩宿，晓汲清湘燃楚竹。",
	[381]="烟销日出不见人，欸乃一声山水绿。",
	[382]="回看天际下中流，岩上无心云相逐。",
	[383]="张生手持石鼓文，劝我试作石鼓歌。",
	[384]="少陵无人谪仙死，才薄将奈石鼓何。",
	[385]="周纲凌迟四海沸，宣王愤起挥天戈。",
	[386]="大开明堂受朝贺，诸侯剑佩鸣相磨。",
	[387]="蒐于岐阳骋雄俊，万里禽兽皆遮罗。",
	[388]="镌功勒成告万世，凿石作鼓隳嵯峨。",
	[389]="从臣才艺咸第一，拣选撰刻留山阿。",
	[390]="雨淋日灸野火燎，鬼物守护烦撝呵。",
	[391]="公从何处得纸本，毫发尽备无差讹。",
	[392]="辞严义密读难晓，字体不类隶与蝌。",
	[393]="年深岂免有缺画，快剑斫断生蛟鼍。",
	[394]="鸾翔凤翥众仙下，珊瑚碧树交枝柯。",
	[395]="金绳铁索锁钮壮，古鼎跃水龙腾梭。",
	[396]="陋儒编诗不收入，二雅褊迫无委蛇。",
	[397]="孔子西行不到秦，掎摭星宿遗羲娥。",
	[398]="嗟余好古生苦晚，对此涕泪双滂沱。",
	[399]="忆昔初蒙博士征，其年始改称元和。",
	[400]="故人从军在右辅，为我度量掘臼科。",
	[401]="濯冠沐浴告祭酒，如此至宝存岂多。",
	[402]="毡包席裹可立致，十鼓只载数骆驼。",
	[403]="荐诸太庙比郜鼎，光价岂止百倍过。",
	[404]="圣恩若许留太学，诸生讲解得切磋。",
	[405]="观经鸿都尚填咽，坐见举国来奔波。",
	[406]="剜苔剔藓露节角，安置妥帖平不颇。",
	[407]="大厦深檐与盖覆，经历久远期无佗。",
	[408]="中朝大官老于事，讵肯感激徒媕婀。",
	[409]="牧童敲火牛砺角，谁复著手为摩挲。",
	[410]="日销月铄就埋没，六年西顾空吟哦。",
	[411]="羲之俗书趁姿媚，数纸尚可博白鹅。",
	[412]="继周八代争战罢，无人收拾理则那。",
	[413]="方今太平日无事，柄任儒术崇丘轲。",
	[414]="安能以此尚论列，愿借辩口如悬河。",
	[415]="石鼓之歌止于此，呜呼吾意其蹉跎。",
	[416]="五岳祭秩皆三公，四方环镇嵩当中。",
	[417]="火维地荒足妖怪，天假神柄专其雄。",
	[418]="喷云泄雾藏半腹，虽有绝顶谁能穷？",
	[419]="我来正逢秋雨节，阴气晦昧无清风。",
	[420]="潜心默祷若有应，岂非正直能感通！",
	[421]="须臾静扫众峰出，仰见突兀撑青空。",
	[422]="紫盖连延接天柱，石廪腾掷堆祝融。",
	[423]="森然魄动下马拜，松柏一径趋灵宫。",
	[424]="粉墙丹柱动光彩，鬼物图画填青红。",
	[425]="升阶伛偻荐脯酒，欲以菲薄明其衷。",
	[426]="庙令老人识神意，睢盱侦伺能鞠躬。",
	[427]="手持杯珓导我掷，云此最吉余难同。",
	[428]="窜逐蛮荒幸不死，衣食才足甘长终。",
	[429]="侯王将相望久绝，神纵欲福难为功。",
	[430]="夜投佛寺上高阁，星月掩映云曈昽。",
	[431]="猿鸣钟动不知曙，杲杲寒日生于东。",
	[432]="纤云四卷天无河，清风吹空月舒波。",
	[433]="沙平水息声影绝，一杯相属君当歌。",
	[434]="君歌声酸辞且苦，不能听终泪如雨。",
	[435]="洞庭连天九疑高，蛟龙出没猩鼯号。",
	[436]="十生九死到官所，幽居默默如藏逃。",
	[437]="下床畏蛇食畏药，海气湿蛰熏腥臊。",
	[438]="昨者州前捶大鼓，嗣皇继圣登夔皋。",
	[439]="赦书一日行万里，罪从大辟皆除死。",
	[440]="迁者追回流者还，涤瑕荡垢清朝班。",
	[441]="州家申名使家抑，坎轲只得移荆蛮。",
	[442]="判司卑官不堪说，未免捶楚尘埃间。",
	[443]="同时辈流多上道，天路幽险难追攀。",
	[444]="君歌且休听我歌，我歌今与君殊科。",
	[445]="一年明月今宵多，人生由命非由他。",
	[446]="有酒不饮奈明何。",
	[447]="山石荦确行径微，黄昏到寺蝙蝠飞。",
	[448]="升堂坐阶新雨足，芭蕉叶大栀子肥。",
	[449]="僧言古壁佛画好，以火来照所见稀。",
	[450]="铺床拂席置羹饭，疏粝亦足饱我饥。",
	[451]="夜深静卧百虫绝，清月出岭光入扉。",
	[452]="天明独去无道路，出入高下穷烟霏。",
	[453]="山红涧碧纷烂漫，时见松枥皆十围。",
	[454]="当流赤足踏涧石，水声激激风吹衣。",
	[455]="人生如此自可乐，岂必局束为人鞿？",
	[456]="嗟哉吾党二三子，安得至老不更归。",
	[457]="石鱼湖，似洞庭，夏水欲满君山青。",
	[458]="山为樽，水为沼，酒徒历历坐洲岛。",
	[459]="长风连日作大浪，不能废人运酒舫。",
	[460]="我持长瓢坐巴丘，酌饮四坐以散愁。",
	[461]="昔有佳人公孙氏，一舞剑器动四方。",
	[462]="观者如山色沮丧，天地为之久低昂。",
	[463]="如羿射九日落，矫如群帝骖龙翔。",
	[464]="来如雷霆收震怒，罢如江海凝清光。",
	[465]="绛唇珠袖两寂寞，晚有弟子传芬芳。",
	[466]="临颍美人在白帝，妙舞此曲神扬扬。",
	[467]="与余问答既有以，感时抚事增惋伤。",
	[468]="先帝侍女八千人，公孙剑器初第一。",
	[469]="五十年间似反掌，风尘澒洞昏王室。",
	[470]="梨园子弟散如烟，女乐余姿映寒日。",
	[471]="金粟堆前木已拱，瞿塘石城草萧瑟。",
	[472]="玳弦急管曲复终，乐极哀来月东出。",
	[473]="老夫不知其所往，足茧荒山转愁疾。",
	[474]="孔明庙前有老柏，柯如青铜根如石。",
	[475]="霜皮溜雨四十围，黛色参天二千尺。",
	[476]="君臣已与时际会，树木犹为人爱惜。",
	[477]="云来气接巫峡长，月出寒通雪山白。",
	[478]="忆昨路绕锦亭东，先主武侯同閟宫。",
	[479]="崔嵬枝干郊原古，窈窕丹青户牖空。",
	[480]="落落盘踞虽得地，冥冥孤高多烈风。",
	[481]="扶持自是神明力，正直原因造化工。",
	[482]="大厦如倾要梁栋，万牛回首丘山重。",
	[483]="不露文章世已惊，未辞翦伐谁能送？",
	[484]="苦心岂免容蝼蚁，香叶终经宿鸾凤。",
	[485]="志士幽人莫怨嗟：古来材大难为用。",
	[486]="今我不乐思岳阳，身欲奋飞病在床。",
	[487]="美人娟娟隔秋水，濯足洞庭望八荒。",
	[488]="鸿飞冥冥日月白，青枫叶赤天雨霜。",
	[489]="玉京群帝集北斗，或骑麒麟翳凤凰。",
	[490]="芙蓉旌旗烟雾落，影动倒景摇潇湘。",
	[491]="星宫之君醉琼浆，羽人稀少不在旁。",
	[492]="似闻昨者赤松子，恐是汉代韩张良。",
	[493]="昔随刘氏定长安，帷幄未改神惨伤。",
	[494]="国家成败吾岂敢，色难腥腐餐枫香。",
	[495]="周南留滞古所惜，南极老人应寿昌。",
	[496]="美人胡为隔秋水，焉得置之贡玉堂。",
	[497]="将军魏武之子孙，于今为庶为清门。",
	[498]="英雄割据虽已矣，文采风流今尚存。",
	[499]="学书初学卫夫人，但恨无过王右军。",
	[500]="丹青不知老将至，富贵于我如浮云。",
	[501]="开元之中常引见，承恩数上南薰殿。",
	[502]="凌烟功臣少颜色，将军下笔开生面。",
	[503]="良相头上进贤冠，猛将腰间大羽箭。",
	[504]="褒公鄂公毛发动，英姿飒爽来酣战。",
	[505]="先帝天马玉花骢，画工如山貌不同。",
	[506]="是日牵来赤墀下，迥立阊阖生长风。",
	[507]="诏谓将军拂绢素，意匠惨澹经营中。",
	[508]="斯须九重真龙出，一洗万古凡马空。",
	[509]="玉花却在御榻上，榻上庭前屹相向。",
	[510]="至尊含笑催赐金，圉人太仆皆惆怅。",
	[511]="弟子韩幹早入室，亦能画马穷殊相。",
	[512]="幹惟画肉不画骨，忍使骅骝气凋丧。",
	[513]="将军画善盖有神，必逢佳士亦写真。",
	[514]="即今漂泊干戈际，屡貌寻常行路人。",
	[515]="途穷反遭俗眼白，世上未有如公贫。",
	[516]="但看古来盛名下，终日坎壈缠其身。",
	[517]="国初已来画鞍马，神妙独数江都王。",
	[518]="将军得名三十载，人间又见真乘黄。",
	[519]="曾貌先帝照夜白，龙池十日飞霹雳。",
	[520]="内府殷红玛瑙盘，婕妤传诏才人索。",
	[521]="盘赐将军拜舞归，轻纨细绮相追飞。",
	[522]="贵戚权门得笔迹，始觉屏障生光辉。",
	[523]="昔日太宗拳毛騧，近时郭家狮子花。",
	[524]="今之新图有二马，复令识者久叹嗟。",
	[525]="此皆骑战一敌万，缟素漠漠开风沙。",
	[526]="其余七匹亦殊绝，迥若寒空动烟雪。",
	[527]="霜蹄蹴踏长楸间，马官厮养森成列。",
	[528]="可怜九马争神骏，顾视清高气深稳。",
	[529]="借问苦心爱者谁，后有韦讽前支遁。",
	[530]="忆昔巡幸新丰宫，翠华拂天来向东。",
	[531]="腾骧磊落三万匹，皆与此图筋骨同。",
	[532]="自从献宝朝河宗，无复射蛟江水中。",
	[533]="君不见金粟堆前松柏里，龙媒去尽鸟呼风。",
	[534]="北风卷地白草折，胡天八月即飞雪。",
	[535]="忽如一夜春风来，千树万树梨花开。",
	[536]="散入珠帘湿罗幕，狐裘不暖锦衾薄。",
	[537]="将军角弓不得控，都护铁衣冷难着。",
	[538]="瀚海阑干百丈冰，愁云惨淡万里凝。",
	[539]="中军置酒饮归客，胡琴琵琶与羌笛。",
	[540]="纷纷暮雪下辕门，风掣红旗冻不翻。",
	[541]="轮台东门送君去，去时雪满天山路。",
	[542]="山回路转不见君，雪上空留马行处。",
	[543]="轮台城头夜吹角，轮台城北旄头落。",
	[544]="羽书昨夜过渠黎，单于已在金山西。",
	[545]="戍楼西望烟尘黑，汉军屯在轮台北。",
	[546]="上将拥旄西出征，平明吹笛大军行。",
	[547]="四边伐鼓雪海涌，三军大呼阴山动。",
	[548]="虏塞兵气连云屯，战场白骨缠草根。",
	[549]="剑河风急云片阔，沙口石冻马蹄脱。",
	[550]="亚相勤王甘苦辛，誓将报主静边尘。",
	[551]="古来青史谁不见，今见功名胜古人。",
	[552]="弃我去者，昨日之日不可留；",
	[553]="乱我心者，今日之日多烦忧。",
	[554]="长风万里送秋雁，对此可以酣高楼。",
	[555]="蓬莱文章建安骨，中间小谢又清发。",
	[556]="俱怀逸兴壮思飞，欲上青天揽明月。",
	[557]="抽刀断水水更流，举杯消愁愁更愁。",
	[558]="人生在世不称意，明朝散发弄扁舟。",
	[559]="风吹柳花满店香，吴姬压酒唤客尝。",
	[560]="金陵子弟来相送，欲行不行各尽觞。",
	[561]="请君试问东流水，别意与之谁短长。",
	[562]="海客谈瀛洲，烟涛微茫信难求；",
	[563]="越人语天姥，云霞明灭或可睹。",
	[564]="天姥连天向天横，势拔五岳掩赤城。",
	[565]="天台四万八千丈，对此欲倒东南倾。",
	[566]="我欲因之梦吴越，一夜飞度镜湖月。",
	[567]="湖月照我影，送我至剡溪。",
	[568]="谢公宿处今尚在，渌水荡漾清猿啼。",
	[569]="脚著谢公屐，身登青云梯。",
	[570]="半壁见海日，空中闻天鸡。",
	[571]="千岩万转路不定，迷花倚石忽已暝。",
	[572]="熊咆龙吟殷岩泉，栗深林兮惊层巅。",
	[573]="云青青兮欲雨，水澹澹兮生烟。",
	[574]="列缺霹雳，丘峦崩摧。",
	[575]="洞天石扉，訇然中开。",
	[576]="青冥浩荡不见底，日月照耀金银台。?",
	[577]="霓为衣兮风为马，云之君兮纷纷而来下。",
	[578]="虎鼓瑟兮鸾回车，仙之人兮列如麻。",
	[579]="忽魂悸以魄动，恍惊起而长嗟。",
	[580]="惟觉时之枕席，失向来之烟霞。",
	[581]="世间行乐亦如此，古来万事东流水。",
	[582]="别君去兮何时还？且放白鹿青崖间。须行即骑访名山。",
	[583]="安能摧眉折腰事权贵，使我不得开心颜!",
	[584]="我本楚狂人，凤歌笑孔丘。手持绿玉杖，朝别黄鹤楼。",
	[585]="五岳寻仙不辞远，一生好入名山游。",
	[586]="庐山秀出南斗傍，屏风九叠云锦张。",
	[587]="影落明湖青黛光，金阙前开二峰长，银河倒挂三石梁。",
	[588]="香炉瀑布遥相望，迥崖沓嶂凌苍苍。",
	[589]="翠影红霞映朝日，鸟飞不到吴天长。",
	[590]="登高壮观天地间，大江茫茫去不还。",
	[591]="黄云万里动风色，白波九道流雪山。",
	[592]="好为庐山谣，兴因庐山发。",
	[593]="闲窥石镜清我心，谢公行处苍苔没。",
	[594]="早服还丹无世情，琴心三叠道初成。",
	[595]="遥见仙人彩云里，手把芙蓉朝玉京。",
	[596]="先期汗漫九垓上，愿接卢敖游太清。",
	[597]="山寺钟鸣昼已昏，渔梁渡头争渡喧。",
	[598]="人随沙岸向江村，余亦乘舟归鹿门。",
	[599]="鹿门月照开烟树，忽到庞公栖隐处。",
	[600]="岩扉松径长寂寥，惟有幽人自来去。",
	[601]="南山截竹为觱篥，此乐本自龟兹出。",
	[602]="流传汉地曲转奇，凉州胡人为我吹。",
	[603]="傍邻闻者多叹息，远客思乡皆泪垂。",
	[604]="世人解听不解赏，长飙风中自来往。",
	[605]="枯桑老柏寒飕飗，九雏鸣凤乱啾啾。",
	[606]="龙吟虎啸一时发，万籁百泉相与秋。",
	[607]="忽然更作渔阳掺，黄云萧条白日暗。",
	[608]="变调如闻杨柳春，上林繁花照眼新。",
	[609]="岁夜高堂列明烛，美酒一杯声一曲。",
	[610]="蔡女昔造胡笳声，一弹一十有八拍。",
	[611]="胡人落泪沾边草，汉使断肠对归客。",
	[612]="古戍苍苍烽火寒，大荒沉沉飞雪白。",
	[613]="先拂商弦后角羽，四郊秋叶惊摵摵。",
	[614]="董夫子，通神明，深山窃听来妖精。",
	[615]="言迟更速皆应手，将往复旋如有情。",
	[616]="空山百鸟散还合，万里浮云阴且晴。",
	[617]="嘶酸雏雁失群夜，断绝胡儿恋母声。",
	[618]="川为静其波，鸟亦罢其鸣。",
	[619]="乌孙部落家乡远，逻娑沙尘哀怨生。",
	[620]="幽音变调忽飘洒，长风吹林雨堕瓦。",
	[621]="迸泉飒飒飞木末，野鹿呦呦走堂下。",
	[622]="长安城连东掖垣，凤凰池对青琐门。",
	[623]="高才脱略名与利，日夕望君抱琴至。",
	[624]="四月南风大麦黄，枣花未落桐叶长。",
	[625]="青山朝别暮还见，嘶马出门思旧乡。",
	[626]="陈侯立身何坦荡，虬须虎眉仍大颡。",
	[627]="腹中贮书一万卷，不肯低头在草莽。",
	[628]="东门酤酒饮我曹，心轻万事如鸿毛。",
	[629]="醉卧不知白日暮，有时空望孤云高。",
	[630]="长河浪头连天黑，津吏停舟渡不得。",
	[631]="郑国游人未及家，洛阳行子空叹息。",
	[632]="闻道故林相识多，罢官昨日今如何。",
	[633]="男儿事长征，少小幽燕客。",
	[634]="赌胜马蹄下，由来轻七尺。",
	[635]="杀人莫敢前，须如猬毛磔。",
	[636]="黄云陇底白云飞，未得报恩不能归。",
	[637]="辽东小妇年十五，惯弹琵琶解歌舞。",
	[638]="今为羌笛出塞声，使我三军泪如雨。",
	[639]="主人有酒欢今夕，请奏鸣琴广陵客。",
	[640]="月照城头乌半飞，霜凄万木风入衣。",
	[641]="铜炉华烛烛增辉，初弹渌水后楚妃。",
	[642]="一声已动物皆静，四座无言星欲稀。",
	[643]="清淮奉使千馀里，敢告云山从此始。",
	[644]="前不见古人，后不见来者。",
	[645]="念天地之悠悠，独怆然而涕下。",
}