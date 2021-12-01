local cfg;
--API

local CreateFrame = CreateFrame
local GetScreenWidth, GetScreenHeight = GetScreenWidth, GetScreenHeight




local Users = {}
local Timers = {}
local TimerData = {}
local CombinedFails = {} -- 额外受伤
local DeathData = {}--JANY用来记录一次副本里的死亡次数
local DamdgeData = {}--JANY用来记录一次副本里的总伤害量
local InterruptData = {}--打断次数
local DispelData = {}--驱散
local score = {}--评分
local jscore = {}--即时评分
local Battletime= {}--战斗时长
local HealData = {} -- 治疗
local deftime = {}
local activeUser = nil
local playerUser = GetUnitName("player",true).."-"..GetRealmName():gsub(" ", "")
local hardMinPct = 20

local select,UnitGUID,tonumber
    = select, UnitGUID, tonumber--鼠标提示相关
local challengeMapID

local tonumber, band = tonumber, bit.band
local isValidEvent = {
  SWING_DAMAGE = true,
  SWING_MISSED = true,
  RANGE_DAMAGE = true,
  RANGE_MISSED = true,
  SPELL_ABSORBED = true,
  SPELL_DAMAGE = true,
  SPELL_HEAL = true,
  SPELL_MISSED = true,
  SPELL_SUMMON = true,
  SPELL_PERIODIC_DAMAGE = true,
  SPELL_PERIODIC_HEAL = true,
  SPELL_PERIODIC_MISSED = true,
  SPELL_EXTRA_ATTACKS = true,
  DAMAGE_SHIELD = true,
  DAMAGE_SHIELD_MISSED = true,
  DAMAGE_SPLIT = true,
}
local isHeal = {
  SPELL_ABSORBED = true,
  SPELL_HEAL = true,
  SPELL_PERIODIC_HEAL = true,
}
local isDamage = {
  SWING_DAMAGE = true,
  RANGE_DAMAGE = true,
  SPELL_DAMAGE = true,
  SPELL_PERIODIC_DAMAGE = true,
  DAMAGE_SHIELD = true,
  DAMAGE_SPLIT = true,
}
--Data from ElitismHelper
local Spells = {
	-- Debug
	--[] = 20,      --  ()
	--[252144] = 1,
	--[190984] = 1,       -- DEBUG Druid Wrath
	--[285452] = 1,       -- DEBUG Shaman Lava Burst
	--[188389] = 1,       -- DEBUG Shaman Flame Shock
	
	-- Affixes
	[209862] = 20,		-- Volcanic Plume (Environment)
	[226512] = 20,		-- Sanguine Ichor (Environment)
	[240448] = 20,      -- Quaking (Environment)
	[343520] = 20,      -- Storming (Environment)
	[342494] = 20, 		-- Belligerent Boast(Season 1 Pridefull)
	[350163] = 20, 		-- Melee (Spiteful Shade)
	
	-- Mists of Tirna Scythe
	[321968] = 20, 		-- Bewildering Pollen (tirnenn Villager)
	[323137] = 20, 		-- Bewildering Pollen (tirnenn Villager)
	[323250] = 20,      -- Anima Puddle (Droman Oulfarran)
	[325027] = 20,      -- Bramble Burst (Drust Boughbreaker)
	[326022] = 20,      -- Acid Globule (Spinemaw Gorger)
	[340300] = 20,		-- Tongue Lashing (Mistveil Gorgegullet)
	[340304] = 20,		-- Poisonous Secretions (Mistveil Gorgegullet)
	[331743] = 20,		-- Bucking Rampage (Mistveil Guardian)
	--id ? [340160] = 20,		-- Radiant Breath (Mistveil Matriarch)
	
	--id ? [323177] = 20,		-- Tears of the Forest(Ingra Maloch)
	[321834] = 20,      -- Dodge Ball (Mistcaller)
	[336759] = 20,      -- Dodge Ball (Mistcaller)
	[322655] = 20,		-- Acid Expulsion (Tred'Ova)
	--id ? [322450] = 20,		-- Consumption (Tred'Ova)
	
	-- De Other Side
	[334051] = 20,		-- Erupting Darkness (Death Speaker)
	[328729] = 20,		-- Dark Lotus (Risen Cultist)
	[333250] = 20,		-- Reaver (Risen Warlord)
	[342869] = 20,		-- Enraged Mask (Enraged Spirit)
	[333790] = 20,		-- Enraged Mask (Enraged Spirit)
	[332672] = 20,      -- Bladestorm (Atal'ai Deathwalker)
	[323118] = 20,      -- Blood Barrage (Hakkar the Soulflayer)
	[331933] = 20,		-- Haywire (Defunct Dental Drill)
	[332157] = 20,      -- Spinning Up (Headless Client)
	[323569] = 20,   	-- Spilled Essence (Environement)
	[320830] = 20,		-- Mechanical Bomb Squirrel
	[323136] = 20,      -- Anima Starstorm (Runestag Elderhorn)
	[323992] = 20,      -- Echo Finger Laser X-treme (Millificent Manastorm)
			
	[320723] = 20,		-- Displaced Blastwave (Dealer Xy'exa)
	[320232] = 20,      -- Explosive Contrivance (Dealer Xy'exa)
	[334913] = 20,		-- Master of Death (Mueh'zala)
	[327427] = 20,		-- Shattered Dominion (Mueh'zala)
	[325691] = 20,      -- Cosmic Collapse (Mueh'zala)
	[335000] = 20,		-- Stellar cloud (Mueh'zala)
	
	
	-- Spires of Ascension
	[331251] = 20,      -- Deep Connection (Azules / Kin-Tara)
	[317626] = 20,      -- Maw-Touched Venom (Azules)
	[323786] = 20,      -- Swift Slice (Kyrian Dark-Praetor)
	[324662] = 20,      -- Ionized Plasma (Multiple) Can this be avoided?
	[317943] = 20,      -- Sweeping Blow (Frostsworn Vanguard)
	[324608] = 20,      -- Charged Stomp (Oryphrion)
	[323740] = 20,		-- Impact (Forsworn Squad-Leader)
	[336447] = 20,		-- Crashing Strike (Forsworn Squad-Leader)
	[336444] = 20,		-- Crescendo (Forsworn Helion)
	[328466] = 20,		-- Charged Spear (Lakesis / Klotos)
	[336420] = 20,		-- Diminuendo (Klotos / Lakesis)
	
	[321034] = 20,      -- Charged Spear (Kin-Tara)
	[324370] = 20,		-- Attenuated Barrage (Kin-Tara)
	[324141] = 20,      -- Dark Bolt (Ventunax)
	[323943] = 20,      -- Run Through (Devos)
	-- [] = 20,		-- Seed of the Abyss (Devos) ???
	
	
	-- The Necrotic Wakes
	[324391] = 20,		-- Frigid Spikes (Skeletal Monstrosity)
	-- id ?[324372] = 20,		-- Reaping Winds (Skeletal Monstrosity)
	-- id ?[320574] = 20,		-- Shadow Well (Zolramus Sorcerer)
	[333477] = 20,		-- Gut Slice (Goregrind)
	
	-- id ?[320637] = 20, 		-- Fetid Gas (Blightbone)
	[333489] = 20,		-- Necrotic Breath (Amarth)
	[333492] = 20,		-- Necrotic Ichor (Amarth apply by Necrotic Breath)
	[320365] = 20,		-- Embalming Ichor (Surgeon Stitchflesh)
	[320366] = 20,		-- Embalming Ichor (Surgeon Stitchflesh)
	[327952] = 20,		-- Meat Hook (Stitchflesh)
	[327100] = 20,      -- Noxious Fog (Stitchflesh)
	[328212] = 20,      -- Razorshard Ice (Nalthor the Rimebender)
	[320784] = 20,		-- Comet Storm (Nalthor the Rimebinder)
	
	-- Plaguefall
	[320072] = 20, 		-- Toxic Pool (Decaying Flesh Giant)
	-- id ?[335882] = 20, 		-- Clinging Infestation (Fen Hatchling)
	[330404] = 20,		-- Wing Buffet (Plagueroc)
	-- id ?[320040] = 20,		-- Plagued Carrion (Decaying Flesh Giant)
	[320072] = 20,		-- Toxic pool (Decaying Flesh Giant)
	[318949] = 20,      -- Festering Belch (Blighted Spinebreaker)
	-- id ?[320576] = 20,      -- Obliterating Ooze (Virulax Blightweaver)
	[319120] = 20, 		-- Putrid Bile (Gushing Slime)
	[327233] = 20, 		-- Belch Plague (Plagebelcher)
	[320519] = 20, 		-- Jagged Spines (Blighted Spinebreaker)
	[328501] = 20,		-- Plagued Bomb (Environement)
	[324667] = 20,		-- Slime Wave (Globgrog)
	[626242] = 20,		-- Slime Wave (Globgrog)
	[333808] = 20,		-- Oozing Outbreak (Doctor Ickus)
	[329217] = 20,		-- Slime Lunge (Doctor Ickus)
	[322475] = 20,		-- Plague Crash (Environement Margrave Stradama)
	
	-- Theater of Pain
	[337037] = 20,		-- Whirling Blade (Nekthara the Mangler)
	[332708] = 20,		-- Ground Smash (Heavin the breaker)
	[333297] = 20, 		-- Death Winds (Nefarious Darkspeaker)
	[331243] = 20,		-- Bone Spikes (Soulforged Bonereaver)
	[331224] = 20,		-- Bonestorm (Soulforged Bonereaver)
	[330608] = 20,		-- Vile Eruption (Rancind Gasbag)
	
	[317231] = 20, 		-- Crushing Slam (Xav the Unfallen)
	[339415] = 20,		-- Deafening Crash (Xav the Unfallen)
	[320729] = 20,		-- Massive Cleave (Xav the Unfallen)
	[318406] = 20,		-- Tenderizing Smash (Gorechop)
	-- id ?[323542] = 20,		-- Oozing (Gorechop)
	[323681] = 20,		-- Dark Devastation (Mordretha) 
	[339573] = 20,		-- Echos of Carnage (Mordretha)
	[339759] = 20,		-- Echos of Carnage (Mordretha)
	
	-- Sanguine Depths
	[334563] = 20,		-- Volatile Trap (Dreadful Huntmaster)
	[320991] = 20,		-- Echoing Thrust (Regal Mistdancer)
	[320999] = 20,		-- Echoing Thrust (Regal Mistdancer Mirror)
	-- id ?[321019] = 20,		-- Sanctified Mists (Regal Mistcaller)
	[334921] = 20,		-- Umbral Crash (Insatiable Brute)
	[322418] = 20,		-- Craggy Fracture (Chamber Sentinel)
	[334378] = 20,      -- Explosive Vellum (Research Scribe)
	[323573] = 20,      -- Residue (Fleeting Manifestation)
	[325885] = 20,      -- Anguished Cries (Z'rali)
	[334615] = 20,		-- Sweeping Slash (Head Custodian Javlin)
	[322212] = 20,		-- Growing Mistrust (Vestige of Doubt)
	[328494] = 20, 		-- Sintouched Anima (Environement)
	[323810] = 20,		-- Piercing Blur (General Kaal)
	
	-- Hall of Atonement 
	[325523] = 20,		-- Deadly Thrust (Depraved Darkblade)
	[325799] = 20,		-- Rapid Fire (Depraved Houndmaster)
	[326440] = 20,		-- Sin Quake (Shard of Halkias)
	
	[322945] = 20,		-- Heave Debris (Halkias)
	[324044] = 20,		-- Refracted Sinlight (Halkias)
	[319702] = 20,		-- Blood Torrent (Echelon)
	[323126] = 20, 		-- Telekinetic Collision (Lord Chamberlain)
    [329113] = 20,		-- Telekinteic Onslaught (Lord Chamberlain)
	[327885] = 20,		-- Erupting Torment (Lord Chamberlain)
}

local SpellsNoTank = {
    -- Mists of Tirna Scythe
	[331721] = 20,      --- Spear Flurry (Mistveil Defender)
	
	-- De Other Side
	
	-- Spires of Ascension
	[320966] = 20,      -- Overhead Slash (Kin-Tara)
	[336444] = 20,      -- Crescendo (Forsworn Helion)
	
	-- The Necrotic Wakes
	[324323] = 20,		-- Gruesome Cleave (Skeletal Marauder)
	-- Plaguefall
	
	-- Theater of Pain
	
	-- Sanguine Depths
	[322429] = 20,		-- Severing Slice (Chamber Sentinel)
	
	-- Hall of Atonement 
	-- id ? [118459] = 20,		-- Beast Cleave (Loyal Stoneborn)
	[346866] = 20, 		-- Stone Breathe (Loyal Stoneborn)
	[326997] = 20,		-- Powerful Swipe (Stoneborn Slasher)
}

local Auras = {
    -- Mists of Tirna Scythe
    [323137] = true,      --- Bewildering Pollen (Drohman Oulfarran)
	[321893] = true,      --- Freezing Burst (Illusionary Vulpin)
	
	-- De Other Side
	[331381] = 20,		-- Slipped (Lubricator)
	
	-- Spires of Ascension
	
	-- The Necrotic Wakes
	
	-- Plaguefall
	
	-- Theater of Pain
	
	-- Sanguine Depths
	
	-- Hall of Atonement 
}

local AurasNoTank = {
}

function round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end






local MVPvsFrame = CreateFrame("Frame", "MVPvsFrame")
MVPvsFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

local MSG_PREFIX = "MVPvs"
local success = C_ChatInfo.RegisterAddonMessagePrefix(MSG_PREFIX)
print(success)
MVPvsFrame:RegisterEvent("CHAT_MSG_ADDON")
MVPvsFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
MVPvsFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
MVPvsFrame:RegisterEvent("CHALLENGE_MODE_START")
MVPvsFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
MVPvsFrame:RegisterEvent("ADDON_LOADED")

MVPvsFrame:ClearAllPoints()
MVPvsFrame:SetHeight(100)
MVPvsFrame:SetWidth(100)
MVPvsFrame.text = MVPvsFrame:CreateFontString(nil, "BACKGROUND", "PVPInfoTextFont")
MVPvsFrame.text:SetAllPoints()
MVPvsFrame.text:SetTextHeight(13)
MVPvsFrame:SetAlpha(1)
local tickers






function table.pack(...)
  return { n = select("#", ...), ... }
end
MVPvsFrame:SetScript("OnEvent", function(self, event_name, ...)
	if self[event_name] then
		return self[event_name](self, event_name, ...)
	end
end)




function generateMaybeOutput(user)
	local func = function()
			local msg = "<走位提醒> "..user.." 被 "
			local amount = 0
			local minPct = math.huge
			for k,v in pairs(TimerData[user]) do

				msg = msg..GetSpellLink(k).." "
				local spellMinPct = nil
				if Spells[k] then
					spellMinPct = Spells[k]
				elseif SpellsNoTank[k] then
					spellMinPct = SpellsNoTank[k]
				end
				if spellMinPct ~= nil and spellMinPct < minPct then
					minPct = spellMinPct
				end
				amount = amount + v
			end
			if minPct == math.huge then
				local spellNames = " "
				for k,v in pairs(TimerData[user]) do
					spellNames = spellNames..GetSpellLink(k).." "
				end
				print("<友情提示> Error: Could not find spells"..spellNames.."in Spells or SpellsNoTank but got Timer for them. wtf")
			end
			TimerData[user] = nil
			Timers[user] = nil
			local userMaxHealth = UnitHealthMax(user)
			local msgAmount = round(amount/10000 ,1)
			local pct = Round(amount / userMaxHealth * 100)
			if pct >= hardMinPct and pct >= minPct and MVPDB then--这个判断
				msg = msg.."损失血量为 "..msgAmount.."万 (-"..pct.."%)."
				J_maybeSendChatMessage(msg)
			end
		end
	return func
end
--[[
local function UnitFullName2(unit)
    if not unit then return UNKNOWNOBJECT end
    local name, realm = UnitName(unit)
    if not realm or realm=="" then
        if not PLAYER_REALM or PLAYER_REALM=="" then
            PLAYER_REALM = GetRealmName()
        end
        realm = PLAYER_REALM
    end
    return name.."-"..realm
end
]]
----------------------鼠标提示相关------------------
local function addLine(tooltip, id, kind,guname)

	if cfg.MVPSettings["鼠标提示MVP"] and false then
		ShowMVP("player")
	end

	if not id or id == "" then return end
	if type(id) == "table" and #id == 1 then id = id[1] end

-- 检查我们是否已添加到此工具提示中。发生在人才框架上
	local frame, text
	for i = 1,15 do
		frame = _G[tooltip:GetName() .. "TextLeft" .. i]
		if frame then text = frame:GetText() end
		if text and string.find(text, kind .. ":") then return end
	end

	if cfg.MVPSettings["鼠标提示MVP"] == true then
	if MVPLilst[guname] then tooltip:AddDoubleLine(MVPLilst[guname]) end
	if cfg.MVPvschallenge[guname] then tooltip:AddDoubleLine("大秘境|cFF00FF00"..cfg.MVPvschallenge[guname]["大秘境"]) end
		tooltip:Show()
	end
end
-- NPCs
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
  if C_PetBattles.IsInBattle() then return end
  local unit = select(2, self:GetUnit())
  if unit then
    local guid = UnitGUID(unit) or ""
    local guna = UnitName(unit) or ""
    local guplayerUser = GetUnitName(unit,true)

    local id = tonumber(guid:match("-(%d+)-%x+$"), 10)
    if id and guid:match("%a+") ~= "abc" then 
      addLine(GameTooltip, id, "ID",guplayerUser)
    end
  end
end)



----------------------鼠标提示相关------------------

function maybeSendAddonMessage(prefix, message)
	if IsInGroup() and not IsInGroup(2) and not IsInRaid() then
		C_ChatInfo.SendAddonMessage(prefix,message,"PARTY")
	elseif IsInGroup() and not IsInGroup(2) and IsInRaid() then
		C_ChatInfo.SendAddonMessage(prefix,message,"RAID")
	end
end
function MVPprint(messages)
	if activeUser ~= playerUser then
		return
	end
	if cfg.MVPSettings["通报MVP"] == true then
		SendChatMessage(messages,"PARTY")
	else
		print(messages)
	end
end
function J_maybeSendChatMessage(message)
	if activeUser ~= playerUser and cfg.MVPSettings["毒瘤通报开关"] == true then
		return
	end
	if cfg.MVPSettings["毒瘤通报-自己/队伍"] == false then
		print(message)
	elseif cfg.MVPSettings["毒瘤通报-自己/队伍"] == true and IsInGroup() and not IsInGroup(2) then
		SendChatMessage(message,"PARTY")
	elseif cfg.MVPSettings["毒瘤通报-自己/队伍"] == true and IsInGroup() and not IsInGroup(2) and IsInRaid() then
		SendChatMessage(message,"RAID")
	elseif cfg.MVPSettings["毒瘤通报-自己/队伍"] == true then
		if IsInGroup() and not IsInGroup(2) and not IsInRaid() then
			SendChatMessage(message,"PARTY")
		elseif IsInGroup() and not IsInGroup(2) and IsInRaid() then
			SendChatMessage(message,"RAID")
		end
	end
end

function MVPvsFrame:RebuildTable()--权重
	Users = {}
	activeUser = nil
	
	if IsInGroup() then
		maybeSendAddonMessage(MSG_PREFIX,"VREQ")
	else
		name = GetUnitName("player",true)
		activeUser = name.."-"..GetRealmName()

	end

end

function MVPvsFrame:ADDON_LOADED(event,addon)

	if addon == "MostValuablePlayer" then
		MVPvsFrame:RebuildTable()
	end

	if not MVPDB then
		MVPDB = true
	end
	if not MVPLilst then MVPLilst = {} end
	cfg = MVP_Settings;
	
	if cfg.MVPvsnoti == nil then cfg.MVPvsnoti = true; end

	if cfg.MVPPoint == nil or cfg.MVPPoint == 0 then cfg.MVPPoint={}; end


	if cfg.MVPPoint["Point"] == nil then cfg.MVPPoint["Point"] = "CENTER"; end
	if cfg.MVPPoint["Relay"] == nil then cfg.MVPPoint["Relay"] = "CENTER"; end
	if cfg.MVPPoint["X"] == nil then cfg.MVPPoint["X"] = -500; end
	if cfg.MVPPoint["Y"] == nil then cfg.MVPPoint["Y"] = 0; end
	if cfg.MVPPoint["Scale"] == nil then cfg.MVPPoint["Scale"] = 1; end


	if cfg.MVPvsShowMVP == nil then cfg.MVPvsShowMVP = true; end--3d模型显示
	if cfg.MVPvsSimplify == nil then cfg.MVPvsSimplify = false; end--简化通报

	if cfg.MVPSettings == nil then cfg.MVPSettings = {}; end
	if cfg.MVPSettings["通报MVP"] == nil then cfg.MVPSettings["通报MVP"] = true; end
	if cfg.MVPSettings["鼠标提示MVP"] == nil then cfg.MVPSettings["鼠标提示MVP"] = true; end
	if cfg.MVPSettings["3d模型显示"] == nil then cfg.MVPSettings["3d模型显示"] = true; end
	if cfg.MVPSettings["简化通报"] == nil then cfg.MVPSettings["简化通报"] = false; end
	if cfg.MVPSettings["毒瘤通报开关"] == nil then cfg.MVPSettings["毒瘤通报开关"] = true; end
	if cfg.MVPSettings["毒瘤通报-自己/队伍"] == nil then cfg.MVPSettings["毒瘤通报-自己/队伍"] = false; end
	if cfg.MVPSettings["显示分数条"] == nil then cfg.MVPSettings["显示分数条"] = true; end
end

function MVPvsFrame:GROUP_ROSTER_UPDATE(event,...)
	MVPvsFrame:RebuildTable()
	--SendData()--共享数据暂时关闭
end

function MVPvsFrame:ZONE_CHANGED_NEW_AREA(event,...)
	MVPvsFrame:RebuildTable()
	--SendData()--共享数据暂时关闭
end

function SendData2()
	for k, v in pairs(MVPLilst) do	
		maybeSendAddonMessage(MSG_PREFIX,k..","..v)
	end	
end


function compareDamage(a,b)
	return a["value"] < b["value"]
end
function compareMVP(a,b)
	return a["value"] > b["value"]
end
local function timeFormatMS(timeAmount)
	local seconds = floor(timeAmount / 1000)
	local ms = timeAmount - seconds * 1000
	local hours = floor(seconds / 3600)
	local minutes = floor((seconds / 60) - (hours * 60))
	seconds = seconds - hours * 3600 - minutes * 60

	if hours == 0 then
		return format("%d:%.2d.%.3d", minutes, seconds, ms)--分 秒
	else
		return format("%d:%.2d:%.2d.%.3d", hours, minutes, seconds, ms)
	end
end
local function timeFormats(timeAmount)
	local seconds = floor(timeAmount / 1000)
	local hours = floor(seconds / 3600)
	local minutes = floor((seconds / 60) - (hours * 60))
	seconds = seconds - hours * 3600 - minutes * 60

	if hours == 0 then
		return minutes
	else
		return hours * 60 + minutes
	end
end
local function GetKeyStoneData()
	local TIME_FOR_3 = 0.6
    local TIME_FOR_2 = 0.8

    if not challengeMapID then print("challengeMapID") end
    
    local mapID, level, time, onTime, keystoneUpgradeLevels = C_ChallengeMode.GetCompletionInfo()
    local name, _, timeLimit = C_ChallengeMode.GetMapUIInfo(challengeMapID)
    
    timeLimit = timeLimit * 1000
    local timeLimit2 = timeLimit * TIME_FOR_2
    local timeLimit3 = timeLimit * TIME_FOR_3
    local RemainingTime
    --print("CHALLENGE_MODE_COMPLETED", mapID, level, time, onTime, keystoneUpgradeLevels, name, timeLimit, timeLimit2, timeLimit3)
    if time <= timeLimit3 then
        print(format("|cff33ff99<%s>|r |cffffd700%s|r", "MVP", format("恭喜你在规定时间内获得了 %s 的3箱奖励！共耗时 %s，3箱奖励剩余时间 %s。", name, timeFormatMS(time), timeFormatMS(timeLimit3 - time))))
        RemainingTime = timeFormats(timeLimit3 - time)
    elseif time <= timeLimit2 then
        print(format("|cff33ff99<%s>|r |cffc7c7cf%s|r", "MVP", format("恭喜你在规定时间内获得了 %s 的2箱奖励！共耗时 %s，2箱奖励剩余时间 %s，3箱奖励超时 %s。", name, timeFormatMS(time), timeFormatMS(timeLimit2 - time), timeFormatMS(time - timeLimit3))))
        RemainingTime = timeFormats(timeLimit2 - time)
    elseif onTime then
        print(format("|cff33ff99<%s>|r |cffeda55f%s|r", "MVP", format("恭喜你在规定时间内完成了 %s 的战斗！共耗时 %s，剩余时间 %s，2箱奖励超时 %s。", name, timeFormatMS(time), timeFormatMS(timeLimit - time), timeFormatMS(time - timeLimit2))))
        RemainingTime = timeFormats(timeLimit - time)
    else
        print(format("|cff33ff99<%s>|r |cffff2020%s|r", "MVP", format("很遗憾你超时完成了 %s 的战斗。共耗时 %s，超出规定时间 %s。", name, timeFormatMS(time), timeFormatMS(time - timeLimit))))
        RemainingTime = timeFormats(time - timeLimit) * -1
    end
    if cfg.MVPSettings["简化通报"] then 
    	MVPprint(name .. level .. "层       评分")
    else
    	MVPprint(name .. level .. "层    玩家         伤害           额外受伤        治疗     打断   驱散   阵亡      评分")
	end
    return name,level,RemainingTime,keystoneUpgradeLevels
end


local ssc = {}
function GetScoreData()
	local maxscore = 0
    for k, v in pairs(DamdgeData) do
        if not v then v = 0 end
        if not CombinedFails[k] then CombinedFails[k] = 0 end
        if not InterruptData[k] then InterruptData[k] = 0 end
        if not DispelData[k] then DispelData[k] = 0 end
        if not DeathData[k] then DeathData[k] = 0 end
        if not HealData[k] then HealData[k] = 0 end
        if not score[k] then score[k] = 0 end
        pcall(function() DamdgeData[k] = Details.UnitDamage(k,-1);Battletime[k] = Details.SegmentElapsedTime(-1);HealData[k] = Details.UnitHealing(k,-1) end)
        pcall(function()
        	for j,l in pairs(SkadaPerCharDB.total.players) do
        		if l.name == k then
        			DamdgeData[k] = l.damage;
		        	Battletime[k] = l.time;
		        	HealData[k] = l.healing;
        		end
        	end
        end)
        score[k] = round((DamdgeData[k] + HealData[k] - CombinedFails[k] * 3) / 10000, 1) + InterruptData[k] + DispelData[k] - DeathData[k] * 3
        if score[k]>maxscore then
        	maxscore = score[k]
    	end
    end
    --[[
    ssc = {}
    for k, v in pairs(score) do table.insert(ssc, {key = k, value = v}) end
   	table.sort(ssc, compareMVP)
    ]]
    return score,maxscore
end
local function GetMVPData(name,level,RemainingTime,keystoneUpgradeLevels)
    local allscore = 0
    for k, v in pairs(DamdgeData) do
        if not v then v = 0 end
        if not CombinedFails[k] then CombinedFails[k] = 0 end
        if not InterruptData[k] then InterruptData[k] = 0 end
        if not DispelData[k] then DispelData[k] = 0 end
        if not DeathData[k] then DeathData[k] = 0 end
        if not HealData[k] then HealData[k] = 0 end
        if not score[k] then score[k] = 0 end
        pcall(function() DamdgeData[k] = Details.UnitDamage(k,-1);Battletime[k] = Details.SegmentElapsedTime(-1);HealData[k] = Details.UnitHealing(k,-1) end)
        pcall(function()
        	for j,l in pairs(SkadaPerCharDB.total.players) do
        		if l.name == strsplit("-",k) then
        			DamdgeData[k] = l.damage;
		        	Battletime[k] = l.time;
		        	HealData[k] = l.healing;
        		end
        	end
        end)
        score[k] = round((DamdgeData[k] + HealData[k] - CombinedFails[k] * 3) / 10000, 1) + InterruptData[k] + DispelData[k] - DeathData[k] * 3 + (level + keystoneUpgradeLevels) * 10 + RemainingTime
        allscore = allscore + score[k]
    end
    
    for k, v in pairs(DamdgeData) do
    	if cfg.MVPSettings["简化通报"] then 
   			MVPLilst[k] = name .. level .. "层" .. "【+" .. keystoneUpgradeLevels .. "】" .. allscore .. "团队分 " .. score[k] .. "个人分 " .. (allscore / 5) .. "平均分\n|r " .. round((v/Battletime[k])/10000,2).."秒伤 "  .. round(v / 10000, 1) .. "伤害 " .. round(CombinedFails[k] / 10000, 1) .. "受伤 " .. round(HealData[k] / 10000, 1) .. "疗 " .. InterruptData[k] .. "断 " .. DispelData[k] .. "驱 " .. DeathData[k] .. "亡 "
        	MVPprint(k .." ".. score[k] .. "分")--总伤害量 额外受伤 死亡次数  打断次数
    	else
    		MVPLilst[k] = name .. level .. "层" .. "【+" .. keystoneUpgradeLevels .. "】" .. allscore .. "团队分 " .. score[k] .. "个人分 " .. (allscore / 5) .. "平均分\n|r " .. round((v/Battletime[k])/10000,2).."秒伤 "  .. round(v / 10000, 1) .. "伤害 " .. round(CombinedFails[k] / 10000, 1) .. "受伤 " .. round(HealData[k] / 10000, 1) .. "疗 " .. InterruptData[k] .. "断 " .. DispelData[k] .. "驱 " .. DeathData[k] .. "亡 "
        	MVPprint(k .." ".. round(v / 10000, 1) .. "伤害 " .. round(CombinedFails[k] / 10000, 1) .. "受伤 " .. round(HealData[k] / 10000, 1) .. "疗 " .. InterruptData[k] .. "断 " .. DispelData[k] .. "驱 " .. DeathData[k] .. "亡 " .. score[k] .. "分")--总伤害量 额外受伤 死亡次数  打断次数   		
    	end  
    end
    local fs = {}
    for k, v in pairs(score) do table.insert(fs, {key = k, value = v}) end
    table.sort(fs, compareMVP)
    for k, v in pairs(fs) do
    	ShowMVP(v["key"])
        MVPprint("恭喜 " .. v["key"] .. " " .. v["value"] .. " 分   【MVP】" .. "团队得分 " .. allscore)
        break
    end

end

local function DataInitializations()
    CombinedFails = {}-- 不躲技能受到的伤害
    DeathData = {}--挑战模式完成时 重置死亡次数为nil  ----jany
    DamdgeData = {}--挑战模式完成时 重置总伤害为nil---jany
    InterruptData = {}--打断次数
    DispelData = {}--驱散次数
    HealData = {}--治疗
    deftime = {}
    score = {}--评分
    jscore = {}
    Battletime = {}--战斗时长
end
function MVPvsFrame:CHALLENGE_MODE_COMPLETED(event, ...)--挑战模式完成时

	local name,level,RemainingTime,keystoneUpgradeLevels = GetKeyStoneData()
    
    if IsAddOnLoaded("details") then
	    local ticker = C_Timer.NewTicker(3, function(ticker)
	        if not InCombatLockdown() then
	        	GetMVPData(name,level,RemainingTime,keystoneUpgradeLevels)
	        	DataInitializations()
	        	ticker:Cancel()   
	        end  
	    end)
	else     
		GetMVPData(name,level,RemainingTime,keystoneUpgradeLevels)
		DataInitializations()
	end

	
end



function MVPvsFrame:CHALLENGE_MODE_START(event,...)--挑战模式启动 时重置伤害为nil,死亡次数为nil
	DataInitializations()
	challengeMapID = C_ChallengeMode.GetActiveChallengeMapID()
	print("欢迎使用MVP通报 "..activeUser)
end



function MVPvsFrame:CHAT_MSG_ADDON(event,...)
	local prefix, message, channel, sender = select(1,...)

	local list5 = splitDC(message, ",")
	if not MVPLilst[list5[1]] and sender ~= GetUnitName("player",true) then
		MVPLilst[list5[1]]=list5[2]
	end
	
	
	
	
	if prefix ~= MSG_PREFIX then
		return

	end
	if message == "VREQ" then
		maybeSendAddonMessage(MSG_PREFIX,"VANS;1.1")
	elseif message:match("^VANS") then
		if tonumber(message:match("(%d+.%d+)")) > 1.1 then 
			print('MVP有新版本,你可以在NGA下载到最新的版本.')
		end
		Users[sender] = message
		for k,v in pairs(Users) do
			if activeUser == nil then
				activeUser = k
			end
			if k < activeUser then
				activeUser = k
			end
		end
	else

	end
end

function splitDC(str,reps)
	local resultStrList = {}
	string.gsub(str,'[^'..reps..']+',function ( w )
	 	table.insert(resultStrList,w)
	 	end)
	return resultStrList
end


local function getPetOwnerName(petGUID) --返回宠物的主人名字
  local n, s
  if petGUID == UnitGUID("pet") then
    n, s = UnitName("player")
    if s then
      return n.."-"..s
    else
      return n
    end
  else
    for i = 1, GetNumGroupMembers() do
      if IsInRaid() then
        if petGUID == UnitGUID(format("raidpet%i", i)) then
          n, s = UnitName(format("raid%i", i))
          if s then
            return n.."-"..s
          else
            return n
          end
        end
      else
        if petGUID == UnitGUID(format("partypet%i", i)) then
          n, s = UnitName(format("party%i", i))
          if s then
            return n.."-"..s
          else
            return n
          end
        end
      end
    end
  end
end

local function getPetOwnerGUID(petGUID)--返回宠物的主人的GUID
  if petGUID == UnitGUID("pet") then
    return UnitGUID("player")
  else
    for i = 1, GetNumGroupMembers() do
      if IsInRaid() then
        if petGUID == UnitGUID(format("raidpet%i", i)) then
          return UnitGUID(format("raid%i", i))
        end
      else
        if petGUID == UnitGUID(format("partypet%i", i)) then
          return UnitGUID(format("party%i", i))
        end
      end
    end
  end
end

local function isPartyPet(petGUID)--判断是否是队伍里
  if petGUID == UnitGUID("pet") then
    return true
  else
    for i = 1, GetNumGroupMembers() do
      if IsInRaid() then
        if petGUID == UnitGUID(format("raidpet%i", i)) then
          return true
        end
      else
        if petGUID == UnitGUID(format("partypet%i", i)) then
          return true
        end
      end
    end
  end
end

function MVPvsFrame:SpellDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, aAmount)
	--print("发生了攻击事件Spells[spellId]"..timestamp, eventType,srcName,aAmount)
	if (Spells[spellId] or (SpellsNoTank[spellId] and UnitGroupRolesAssigned(dstName) ~= "TANK")) and UnitIsPlayer(dstName) then
		-- Initialize TimerData and CombinedFails for Timer shot 为计时器快照初始化,
		if TimerData[dstName] == nil then
			TimerData[dstName] = {}
		end
		if CombinedFails[dstName] == nil then
			CombinedFails[dstName] = 0
		end
		CombinedFails[dstName] = CombinedFails[dstName] + aAmount


		if TimerData[dstName][spellId] == nil then
			TimerData[dstName][spellId] = aAmount
		else
			TimerData[dstName][spellId] = TimerData[dstName][spellId] + aAmount
		end


		
		-- 如果还没有计时器，请使用此事件启动计时器。在2秒内受到的伤害，防刷屏，可以改成别的时间，比如10秒
		if Timers[dstName] == nil then
			Timers[dstName] = true
			C_Timer.After(2,generateMaybeOutput(dstName))
		end--玩害受到伤害统计
	end

	if UnitIsPlayer(srcName) then--玩家技能伤害统计
		if DamdgeData[srcName] == nil then
			DamdgeData[srcName] = 0
		end
		DamdgeData[srcName] = DamdgeData[srcName] + aAmount	
		--print(srcName,DamdgeData[srcName])


	
  	elseif isPartyPet(srcGUID) then--宠物是否是在队伍里的----宠物伤害统计
    -- get owner
    	local ownerGUID, ownerName = getPetOwnerGUID(srcGUID), getPetOwnerName(srcGUID)
    	if DamdgeData[ownerName] == nil then
			DamdgeData[ownerName] = 0
		end
		DamdgeData[ownerName] = DamdgeData[ownerName] + aAmount	
    end

    

end

--死亡事件JANY
function MVPvsFrame:DeathDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool,destName)
	if UnitIsPlayer(dstName) then--如果死亡的是队友和我   srcName是甲方    dstName是乙方     这是 怪物 击败了 玩家

		if DeathData[dstName] == nil then
			DeathData[dstName] = 0
		end
		
		if destName and UnitHealth(dstName)==0 then--/run SendChatMessage((UnitHealth("卢瑟希"),"PARTY"))
		DeathData[dstName] = DeathData[dstName] + 1--/run print(DeathData["卢瑟希"])
		print(destName .. " 失去 " .. DeathData[dstName] .. " 血！")
		else
		--print("发生了死亡事件")	
		end
	end
end
--打断事件JANY
function MVPvsFrame:InterruptDamage(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2,a12,a15)
	local inInstance = IsInGroup(LE_PARTY_CATEGORY_INSTANCE)
	local inParty = IsInGroup()--是否在小队
	local inRaid = IsInRaid()
	if UnitIsPlayer(srcName) and inParty then--如果打断的人是队友和我  srcName是甲方    dstName是乙方     这是 玩家 打断了 怪物
		if InterruptData[srcName] == nil then
			InterruptData[srcName] = 0
		end
		InterruptData[srcName] = InterruptData[srcName] + 1
		if srcName then
		--print(srcName .. " 打断 " .. InterruptData[srcName] .. " 次！人品+1")
		else
		print("发生了打断事件")	
		end
	end
end
--驱散事件
function MVPvsFrame:DISPELDamage(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2)
	local inParty = IsInGroup()--是否在小队
	if UnitIsPlayer(srcName) and inParty then
		if DispelData[srcName] == nil then
			DispelData[srcName] = 0
		end
		DispelData[srcName] = DispelData[srcName] + 1
		if srcName then
		--print(srcName .. " 驱散 " .. DispelData[srcName] .. " 次！人品+1")
		else
		print("发生了驱散事件")	
		end
	elseif isPartyPet(srcGUID) then--宠物是否是在队伍里的----宠物驱散
    	local ownerGUID, ownerName = getPetOwnerGUID(srcGUID), getPetOwnerName(srcGUID)
    	if DispelData[ownerName] == nil then
			DispelData[ownerName] = 0
		end
		--print(ownerName.."宠物驱散+1  测试")
		DispelData[ownerName] = DispelData[ownerName] + 1
	end
end
--发生治疗事件
function MVPvsFrame:SpellHeal(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2,amount)
	if UnitIsPlayer(srcName) then
		if HealData[srcName] == nil then
			HealData[srcName] = 0
		end
		HealData[srcName] = HealData[srcName] + amount
	end	
end




local amounts = 0
function MVPvsFrame:Batime(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2)
	
    local inParty = IsInGroup()--是否在小队
    if UnitIsPlayer(srcName) and inParty then
	  -- add combat time增加战斗时间
	  
		if Battletime[srcName] == nil then

			Battletime[srcName] = 0
      
		end
		if deftime[srcName] == nil then

			deftime[srcName] = 0
      
		end		
		
		amounts = timestamp - deftime[srcName]
	  if amounts < 3.5 then

	    Battletime[srcName] = Battletime[srcName] + amounts

	  else

	  	Battletime[srcName] = Battletime[srcName] + 3.5
	  end

  	  deftime[srcName] = timestamp

    end





end

function MVPvsFrame:SwingDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, aAmount)--玩害普通攻击伤害统计

	--print(timestamp, eventType, srcGUID, srcName,aAmount)


	
	if UnitIsPlayer(srcName) then--玩家普通攻击伤害统计
		if DamdgeData[srcName] == nil then
			DamdgeData[srcName] = 0
		end

		DamdgeData[srcName] = DamdgeData[srcName] + aAmount

	elseif isPartyPet(srcGUID) then--宠物是否是在队伍里的   --宠物伤害统计
    -- get owner
    	local ownerGUID, ownerName = getPetOwnerGUID(srcGUID), getPetOwnerName(srcGUID)
    	if DamdgeData[ownerName] == nil then
			DamdgeData[ownerName] = 0
		end
		DamdgeData[ownerName] = DamdgeData[ownerName] + aAmount			
	end

	
end

function MVPvsFrame:AuraApply(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, auraAmount)
	if (Auras[spellId] or (AurasNoTank[spellId] and UnitGroupRolesAssigned(dstName) ~= "TANK")) and UnitIsPlayer(dstName)  then
		if auraAmount and MVPDB then
			J_maybeSendChatMessage("<友情提示> "..dstName.." 受到伤害 "..GetSpellLink(spellId)..". "..auraAmount.." Stacks.")
		elseif MVPDB then
			J_maybeSendChatMessage("<友情提示> "..dstName.." 受到伤害 "..GetSpellLink(spellId)..".")
		end
	end
end

function MVPvsFrame:COMBAT_LOG_EVENT_UNFILTERED(event,...)
	local timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2,a12,a13,a14,a15,a16,a17,a18,a19,a20 = CombatLogGetCurrentEventInfo(); -- Those arguments appear for all combat event variants.
	local eventPrefix, eventSuffix = eventType:match("^(.-)_?([^_]*)$");

	

	if (eventPrefix:match("^SPELL") or eventPrefix:match("^RANGE")) and eventSuffix == "DAMAGE" then
		local spellId, spellName, spellSchool, sAmount, aOverkill, sSchool, sResisted, sBlocked, sAbsorbed, sCritical, sGlancing, sCrushing, sOffhand, _ = select(12,CombatLogGetCurrentEventInfo())
		MVPvsFrame:SpellDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, sAmount)
	elseif eventPrefix:match("^SWING") and eventSuffix == "DAMAGE" then
		local aAmount, aOverkill, aSchool, aResisted, aBlocked, aAbsorbed, aCritical, aGlancing, aCrushing, aOffhand, _ = select(12,CombatLogGetCurrentEventInfo())
		MVPvsFrame:SwingDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, aAmount)
	elseif eventPrefix:match("^SPELL") and eventSuffix == "MISSED" then
		local spellId, spellName, spellSchool, missType, isOffHand, mAmount  = select(12,CombatLogGetCurrentEventInfo())
		if mAmount then
			MVPvsFrame:SpellDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, mAmount)
		end
	elseif eventType == "SPELL_AURA_APPLIED" then
		local spellId, spellName, spellSchool, auraType = select(12,CombatLogGetCurrentEventInfo())
		MVPvsFrame:AuraApply(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType)
	elseif eventType == "SPELL_AURA_APPLIED_DOSE" then
		local spellId, spellName, spellSchool, auraType, auraAmount = select(12,CombatLogGetCurrentEventInfo())
		MVPvsFrame:AuraApply(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, auraType, auraAmount)
	elseif eventType == "UNIT_DIED" then --死亡事件JANY
		local destName = select(9,CombatLogGetCurrentEventInfo())
		MVPvsFrame:DeathDamage(timestamp, eventType, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool,destName)
	elseif eventType == "SPELL_INTERRUPT" then--打断成功
		local a12 = select(12,CombatLogGetCurrentEventInfo())
		local a15 = select(15,CombatLogGetCurrentEventInfo())
		MVPvsFrame:InterruptDamage(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2,a12,a15)
	elseif eventType == "SPELL_DISPEL" then--驱散
		MVPvsFrame:DISPELDamage(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2)
	elseif eventType == "SPELL_HEAL" or eventType == "SPELL_PERIODIC_HEAL" and eventType ~= "SPELL_ABSORBED" then--治疗
		local amount = select(15,CombatLogGetCurrentEventInfo()) - select(16,CombatLogGetCurrentEventInfo())
		amount = floor(amount + .5)
		if amount < 1 then
		    -- stop on complete overheal or out of combat; heals will never start a new fight
		    return
		end
		MVPvsFrame:SpellHeal(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags, dstFlags2,amount)

	end
		
	  -- return on invalid event, vehicle, friendly fire, hostile healing, evaded返回无效事件，车辆，友军火力，敌对治疗，躲避
	  if not isValidEvent[eventType] or strsplit("-", srcGUID) == "Vehicle" or (band(dstFlags, 16) > 0 and isDamage[eventType])
	  or (band(dstFlags, 16) == 0 and isHeal[eventType]) or a15 == "EVADE" then
	    return
	  else

  	  MVPvsFrame:Batime(timestamp, eventType, hideCaster, srcGUID, srcName, srcFlags, srcFlags2, dstGUID, dstName, dstFlags)
  	  end
end



SLASH_MostValuablePlayer1, SLASH_MostValuablePlayer1 = "/mvp", "/MostValuablePlayer";
SlashCmdList["MostValuablePlayer"] = function(msgs)
	if cfg.MVPSettings["通报MVP"]==true then
		print("MVP关")
		cfg.MVPSettings["通报MVP"] = false
	else
		print("MVP开")
		cfg.MVPSettings["通报MVP"] = true
	end
end



local MVP_OptionsFrame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
MVP_OptionsFrame:Hide()
MVP_OptionsFrame.name = "MostValuablePlayer(MVP)"
MVP_OptionsFrame:SetScript("OnShow", function(self)
	if self.show then return end
	local J_addname = MVP_OptionsFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
    J_addname:SetTextColor(1,1,1)
    J_addname:SetPoint("TOP")
    J_addname:SetFont(GameFontNormal:GetFont(), 30)
    J_addname:SetText("MVP最佳玩家")
    local guangao = MVP_OptionsFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
    guangao:SetTextColor(1,1,1)
    guangao:SetPoint("BOTTOM")
    guangao:SetText("按ESC键可关闭通关后的3D模型显示\n作者：Jany")




	local count,countx=0,0
	for key,value in pairs(cfg.MVPSettings) do
		count=count+1
		if count>15 then countx,count=countx+1,0 end
		local button = CreateFrame("CheckButton", "MVP_Options_"..key, MVP_OptionsFrame, "InterfaceOptionsCheckButtonTemplate")
		button:SetPoint("TOPLEFT", 32+200*countx, -32-32*count)
		getglobal(button:GetName().."Text"):SetText(key)
		if value == true then button:SetChecked(true) else button:SetChecked(false) end
	end	
	self.show = true
	MVP_OptionsFrame:SetScript("OnHide", function(self)
		for key,value in pairs(cfg.MVPSettings) do
			if _G["MVP_Options_"..key]:GetChecked() then
				if cfg.MVPSettings[(key)] ~= true then
					cfg.MVPSettings[(key)] = true
					print(key,"开启")
				end
			else
				if cfg.MVPSettings[(key)] ~= false then
					cfg.MVPSettings[(key)] = false
					print(key,"关闭")
				end
			end
		end 
		if cfg.MVPSettings["显示分数条"] then fShowScoreBar(true) else fShowScoreBar(false) end
	end)
end)
InterfaceOptions_AddCategory(MVP_OptionsFrame)


