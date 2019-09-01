--------设置-----------

local config = {
	tt = 2,					--默认报告间隔
	MaxStaggerTaken = 80,	--醉拳承受率上限
	Maxdot = 400 * 1000,	--dot上限，当每跳dot伤害大于该值时视为dot伤害过高
	whitelist = {			--白名单，受到这些伤害时不会报告
		[209858] = true,	--死疽
		[124255] = true,	--醉拳
		[240448] = true,	--震荡
		[243237] = true,	--崩裂
	},

	--以下为各功能开关，true=开，false=关
	
	Enable = true,			--总开关
	w = false,				--密语开关，如果打开，将会抄送一份报告密语给目标
	isbapply = false,		--是否报告铁骨上身
	isbfade = true,			--是否报告铁骨消失
	pfblvl = true, 			--是否报告活血使用水平，如果醉拳承受超过醉拳承受率上限提示使用更多活血
	casts = true,			--是否报告技能使用情况
	hit = true, 			--是否报告断铁骨时被命中
	purify = true, 			--是否报告裸活血
}

--------变量声明-----------

local buff = {
	["isb"] = 215479,
}

local spell = {
	["isb"] = 115308,		--铁骨酒
	["pfb"] = 119582,		--活血酒
	["melee"] = 6603,		--平砍
	["ks"] = 121253,		--醉酿投
	["tp"] = 100780,		--猛虎掌
	["bob"] = 115399,		--玄牛酒
	["bof"] = 115181,		--火焰之息
	["bos"] = 205523,		--幻灭猛击
	["stagger"] = 115069,	--醉拳
	["dot"] =124255,		--醉拳dot
}

-- 通报频道
local channel = {
	["s"] = "SAY",
	["g"] = "GUILD",
	["w"] = "WHISPER",
	["r"] = "RAID",
}

-- 酒池数据
local data = {}

-- 时间间隔变量
local T, t, checkpool = 0, 0, 0

--------core-----------

-- 建档
local function CreateTable()
	t = {
	["dot"] = 0,			--醉拳承受
	["pool"] = 0,			--醉拳吸收
	["hits"] = 0,			--被命中次数
	["isb"] = 0,			--断铁骨命中次数	
	["purify"] = 0,			--裸活血次数
	["combatstart"] = 0,	--战斗开始
	["combatend"] = 0,		--战斗结束
	["casts"] ={			--施法统计
		[spell.isb] = 0,
		[spell.pfb] = 0,
		[spell.ks] = 0,
		[spell.tp] = 0,
		[spell.bob] = 0,
		[spell.bof] = 0,
		[spell.bos] = 0,
		},
	}
	return t
end

local function shortnum(x)
	if x >= 10^4 then
		return string.format("%.1f", x / 10^4) .. "w"
	end
	return string.format("%.1f", x)
end

local function PrintTable(name, tab)
	tab.combatend = GetTime()
	local p = 1 - tab.dot / tab.pool
		p = math.floor(p * 1000) / 10
	local q = 1 - tab.isb / tab.hits
		q = math.floor(q * 1000) / 10
	if  config.casts and p < 80 then
		print("玩家：" .. name .. "的本次战斗结束，战斗时长：" .. shortnum(tab.combatend - tab.combatstart) .. "秒")
		--print("醉拳承受：" .. shortnum(tab.dot), "醉拳吸收："..shortnum(tab.pool), "活血率：" .. p .. "%")
		print("活血率：" .. p .. "%，铁骨覆盖率：" .. q .. "%")
		--print("被命中次数：" .. tab.hits, "，断铁骨被命中次数：" .. tab.isb, "覆盖率：" .. q .. "%")
		if tab.purify > 0 then
			print("裸活血次数："..tab.purify)
		end
		print("施法统计：")
		for id, count in pairs(tab.casts) do		
			print(GetSpellLink(id), count)
		end
	end
	data[name] = nil
end

-- 判断指定buff/debuff是否存在
local function OnAura(name, id)
	local spname = GetSpellInfo(id)
	local AuraUtil = AuraUtil
	if AuraUtil.FindAuraByName(spname, name) then
		return true
	end
	return nil
end

-- 报告，参数含义分别为：报告内容，是否遵守间隔设置，密语目标
local function report(str, b, name)
	if b then
		t = GetTime()
		if (t - T) > config.tt
			then T = t
		else
			return
		end
	end 
	SendChatMessage(str, channel.s)
	if config.w and name then
		SendChatMessage(str, "WHISPER", nil, name)
	end
end

local function trigger(self, event)
	-- get CLEU
	local _, eventtype, _, _, srcName, _, _, _, dstName, _, _, spellID, _, _, arg15, EspellID, _, _, arg19, _, _, arg22 = CombatLogGetCurrentEventInfo()
	-- arg 15 for periodic damage (dot)
	-- arg 19 for melee absorb value / range absorb speiid
	-- arg 22 for range absorb value
	
	-- 野外和pvp停用
	local Type = select(2, IsInInstance())
	if Type == "none" or Type == "arena" or Tyep == "pvp" then return end
	
	-- 戰爭前線停用
	local difficulty = select(3, GetInstanceInfo())
	if difficulty == 147 then return end
	
	-- 排隨機停用
	if IsInLFGDungeon() then return end
	
	-- 总开关
	if not config.Enable then return end
	
	-- 铁骨消失
	if eventtype == "SPELL_AURA_REMOVED" and spellID == buff.isb then
		if config.isbfade and InCombatLockdown() then
			report(dstName.."已经失去".. GetSpellLink(spell.isb) .. "，治疗注意！", false)
		end
	end
	
	--铁骨上身
	if eventtype == "SPELL_AURA_APPLIED" and spellID == buff.isb  then
		if config.isbapply then
			report(dstName .. "已经获得".. GetSpellLink(spell.isb) .. "，稳如POI！", false)
		end
	end
	
	-- 施法次数统计
	if eventtype == "SPELL_CAST_SUCCESS" and data[srcName] and data[srcName].casts[spellID] then
		-- 建档
		if not data[srcName] then
			data[srcName] = CreateTable()
			data[srcName].combatstart = GetTime()
		end
		
		data[srcName].casts[spellID] = data[srcName].casts[spellID] + 1
		
		-- 裸活血次数
		if spellID == spell.pfb then
			if not OnAura(srcName, buff.isb) then
				data[srcName].purify = data[srcName].purify + 1
				
				if config.purify then
					report(srcName .."在断铁骨時使用了" .. GetSpellLink(spell.pfb) .. "，请覆盖" .. GetSpellLink(spell.isb) .. "再使用", false, srcName)
				end
			end
		end
	end
	
	-- 醉拳池更新
	if eventtype == "SPELL_ABSORBED" then
		-- 平砍命中
		if EspellID == spell.stagger then
			-- 建档
			if not data[dstName] then
				data[dstName] = CreateTable()
				data[dstName].combatstart = GetTime()
			end
			
			data[dstName].pool = data[dstName].pool + arg19
			data[dstName].hits = data[dstName].hits + 1
			
			-- 断铁骨平砍命中
			if not OnAura(dstName, buff.isb) then
				data[dstName].isb = data[dstName].isb + 1
				if config.hit then
					report(dstName .. "断铁骨，被" .. MELEE .. "命中，请覆盖" .. GetSpellLink(spell.isb), true, dstName)
				end
			end
		end
		
		-- 技能命中
		if arg19 == spell.stagger then
			-- 建档
			if not data[dstName] then
				data[dstName] = CreateTable()
				data[dstName].combatstart = GetTime()
			end
			
			data[dstName].pool = data[dstName].pool + arg22
			data[dstName].hits = data[dstName].hits + 1
			
			if (not OnAura(dstName, buff.isb)) and (not config.whitelist[spellID]) then
				-- 断铁骨技能命中
				data[dstName].isb = data[dstName].isb + 1 
				
				if config.hit then 
					report(dstName .. "断铁骨，被" .. GetSpellLink(spellID) .. "命中，请覆盖" .. GetSpellLink(spell.isb), true, dstName)
				end
			end
		end
		
		-- 醉拳dot被吸收
		if spellID == spell.dot then
			data[dstName].dot = data[dstName].dot + arg22
			--print(data[dstName].dot, data[dstName].pool)		
		end
	end
	
	-- 醉拳打脸
	if eventtype == "SPELL_PERIODIC_DAMAGE" and spellID == spell.dot then
		local p = 0
		
		data[dstName].dot = data[dstName].dot + arg15
		
		if data[dstName].pool > 0 then
			p = data[dstName].dot / data[dstName].pool
			
			-- 醉拳承受过高
			if p > (config.MaxStaggerTaken / 100) and arg15 > config.Maxdot then
				p = math.floor(p * 1000) / 10
				
				if config.pfblvl then
					report(dstName .. " 的醉拳dot承受：" .. p .. "%，请更多地使用" .. GetSpellLink(spell.pfb), true, dstName)
				end
			end
		end
	end
	
	-- 每3秒检查是否脱战
	if GetTime() > (checkpool + 3) and not InCombatLockdown() then
		checkpool = GetTime()
		
		-- 遍历表，查看酒仙酒池是否归零
		for name, tab in pairs(data) do
			-- 如果目标酒池归零，视为脱战
			if UnitStagger(name) == 0 and tab.pool > 0 then
				-- 开始计算战斗时长，铁骨覆盖率，活血率，技能使用情况
				PrintTable(name, tab)
			end
		end
	end
end

KeepIronskin = CreateFrame("frame")
KeepIronskin:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
KeepIronskin:SetScript("OnEvent", trigger)

SLASH_KeepIronskin1 = "/kpis"
SlashCmdList["KeepIronskin"] = function ()
	if config.Enable then
		config.Enable = false
		print("KeepIronskin已关闭")
	else
		config.Enable = true
		print("KeepIronskin已开启")
	end
end