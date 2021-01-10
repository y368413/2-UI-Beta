----- 伤害统计 -----

local addonName, addon = ... 



local next, pairs, ipairs, type = next, pairs, ipairs, type
local band = bit.band

local PET_FLAGS = bit.bor(COMBATLOG_OBJECT_TYPE_PET, COMBATLOG_OBJECT_TYPE_GUARDIAN)
local RAID_FLAGS = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_RAID)

local pets, players = {}, {} -- 用来找到宠物的主人
local DamdgeData = {}--用来记录一次副本里的总伤害量


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

local Spells = {
  -- Affixes
  [209862] = 20,    -- Volcanic Plume (Environment)
  [226512] = 20,    -- Sanguine Ichor (Environment)
  [288694] = 20,    -- Shadow Smash (Season 2)
  [288858] = 20,    -- Expel Soul (Season 2)

  -- Freehold
  [272046] = 20,    --- Dive Bomb (Sharkbait)
  [257426] = 20,    --- Brutal Backhand (Irontide Enforcer)
  [258352] = 20,    --- Grapeshot (Captain Eudora)
  [256594] = 20,    --- Barrel Smash (Captain Raoul)
  [267523] = 20,    --- Cutting Surge (Captain Jolly)
  [272374] = 20,    --- Whirlpool of Blades (Captain Jolly)
  [272397] = 20,    --- Whirlpool of Blades (Captain Jolly)
  [256546] = 20,    --- Shark Tornado
  [257310] = 20,    --- Cannon Barrage
  [257757] = 20,    --- Goin' Bananas (Bilge Rat Buccaneer)
  [274389] = 20,    --- Rat Traps (Vermin Trapper)
  [257902] = 20,    --- Shell Bounce (Ludwig Von Tortollan)
  [258199] = 20,    --- Ground Shatter (Irontide Crusher)
  [276061] = 20,    --- Boulder Throw (Irontide Crusher)
  [258779] = 20,    --- Sea Spout (Irontide Oarsman)
  [274400] = 20,    --- Duelist Dash (Cutwater Duelist)
  [257274] = 20,    --- Vile Coating (Environment)

  -- Shrine of the Storm
  [264560] = 20,    --- Choking Brine (Aqualing)
  [267899] = 20,    --- Hindering Cleave (Brother Ironhull)
  [268280] = 20,    --- Tidal Pod (Tidesage Enforcer)
  [276286] = 20,    --- Slicing Hurricane (Environment)
  [276292] = 20,    --- Whirlign Slam (Ironhull Apprentice)
  [267385] = 20,    --- Tentacle Slam (Vol'zith the Whisperer)

  -- Siege of Boralus
  [256627] = 20,    --- Slobber Knocker (Scrimshaw Enforcer)
  [256663] = 20,    --- Burning Tar (Blacktar Bomber)
  [257431] = 20,    --- Meat Hook (Chopper Redhook)
  [275775] = 20,    --- Savage Tempest (Irontide Raider)
  [269029] = 20,    --- Clear the Deck (Dread Captain Lockwood)
  [272874] = 20,    --- Trample (Ashvane Commander)
  [272426] = 20,    --- Sighted Artillery
  [272140] = 20,    --- Iron Volley
  [257292] = 20,    --- Heavy Slash (Irontide Cleaver)
  [273681] = 20,    --- Heavy Hitter (Chopper Redhook)
  [257886] = 20,    --- Brine Pool (Hadal Darkfathom)

  -- Tol Dagor
  [257785] = 20,    --- Flashing Daggers
  [256976] = 20,    --- Ignition (Knight Captain Valyri)
  [256955] = 20,    --- Cinderflame (Knight Captain Valyri)
  [256083] = 20,    --- Cross Ignition (Overseer Korgus)
  [263345] = 20,    --- Massive Blast (Overseer Korgus)
  [258864] = 20,    --- Suppression Fire (Ashvane Marine/Spotter)
  [258364] = 20,    --- Fuselighter (Ashvane Flamecaster)
  [259711] = 20,    --- Lockdown (Ashvane Warden)

  -- Waycrest Manor
  [260569] = 20,    --- Wildfire (Soulbound Goliath)
  [265407] = 20,    --- Dinner Bell (Banquet Steward)
  [264923] = 20,    --- Tenderize (Raal the Gluttonous)
  [264150] = 20,    --- Shatter (Thornguard)
  [271174] = 20,    --- Retch (Pallid Gorger)
  [268387] = 20,    --- Contagious Remnants (Lord Waycrest)
  [268308] = 20,    --- Discordant Cadenza (Lady Waycrest

  -- Atal'Dazar
  [253666] = 20,    --- Fiery Bolt (Dazar'ai Juggernaught)
  [257692] = 20,    --- Tiki Blaze (Environment)
  [255620] = 20,    --- Festering Eruption (Reanimated Honor Guard)
  [256959] = 20,    --- Rotting Decay (Renaimated Honor Guard)
  [250259] = 20,    --- Toxic Leap
  [250022] = 20,    --- Echoes of Shadra (Echoes of Shadra)
  [250585] = 20,    --- Toxic Pool
  [250036] = 20,    --- Shadowy Remains

  -- King's Rest
  [265914] = 20,    --- Molten Gold (The Golden Serpent)
  [266191] = 20,    --- Whirling Axe (Council of Tribes)
  [270289] = 20,    --- Purification Beam
  [270503] = 20,    --- Hunting Leap (Honored Raptor)
  [271564] = 20,    --- Embalming Fluid (Embalming Fluid)
  [270485] = 20,    --- Blooded Leap (Spectral Berserker)
  [267639] = 20,    --- Burn Corruption (Mchimba the Embalmer)
  [270931] = 20,    --- Darkshot

  -- The MOTHERLODE!!
  [257371] = 20,    --- Gas Can (Mechanized Peace Keeper)
  [262287] = 20,    --- Concussion Charge (Mech Jockey / Venture Co. Skyscorcher)
  [268365] = 20,    --- Mining Charge (Wanton Sapper)
  [269313] = 20,    --- Final Blast (Wanton Sapper)
  [275907] = 20,    --- Tectonic Smash
  [259533] = 20,    --- Azerite Catalyst (Rixxa Fluxflame)
  [260103] = 20,    --- Propellant Blast
  [260279] = 20,    --- Gattling Gun (Mogul Razdunk)
  [276234] = 20,    --- Micro Missiles
  [270277] = 20,    --- Big Red Rocket (Mogul Razdunk)
  [271432] = 20,    --- Test Missile (Venture Co. War Machine)
  [262348] = 20,    --- Mine Blast
  [257337] = 20,    --- Shocking Claw
  [269092] = 20,    --- Artillery Barrage (Ordnance Specialist)

  -- Temple of Sethraliss
  [268851] = 20,    --- Lightning Shield (Adderis)
  [273225] = 20,    --- Volley (Sandswept Marksman)
  [264574] = 20,    --- Power Shot (Sandswept Marksman)
  [273995] = 20,    --- Pyrrhic Blast (Crazed Incubator)
  [264206] = 20,    --- Burrow (Merektha)
  [272657] = 20,    --- Noxious Breath
  [272658] = 20,    --- Electrified Scales
  [272821] = 20,    --- Call Lightning (Stormcaller)

  -- Underrot
  [264757] = 20,    --- Sanguine Feast (Elder Leaxa)
  [265542] = 20,    --- Rotten Bile (Fetid Maggot)
  [265019] = 20,    --- Savage Cleave (Chosen Blood Matron)
  [261498] = 20,    --- Creeping Rot (Elder Leaxa)
  [265665] = 20,    --- Foul Sludge (Living Rot)
  [265511] = 20,    --- Spirit Drain (Spirit Drain Totem)
  [272469] = 20,    --- Abyssal Slam (Abyssal Reach)
  [272609] = 20,    --- Maddening Gaze (Faceless Corruptor)
}
local SpellsNoTank = {
  -- Freehold

  -- Shrine of the Storm
  [267899] = 20,      --- Hindering Cleave

  -- Siege of Boralus

  -- Tol Dagor

  -- Waycrest Manor

  -- Atal'Dazar

  -- King's Rest

  -- The MOTHERLODE!!

  -- Temple of Sethraliss
  [255741] = 20,      --- Cleave (Scaled Krolusk Rider)

  -- Underrot
  [265019] = 20,      --- Savage Cleave (Chosen Blood Matron)
}
local Auras = {
  -- Freehold
  [274516] = true,    -- Slippery Suds
  [274389] = true,        -- Rat Traps (Vermin Trapper)

  -- Shrine of the Storm
  [268391] = true,    -- Mental Assault (Abyssal Cultist)
  [276268] = true,    -- Heaving Blow (Shrine Templar)

  -- Siege of Boralus
  [257292] = true,    -- Heavy Slash (Kul Tiran Vanguard)
  [272874] = true,    -- Trample (Ashvane Commander)

  -- Tol Dagor
  [257119] = true,    -- Sand Trap (The Sand Queen)
  [256474] = true,    -- Heartstopper Venom (Overseer Korgus)

  -- Waycrest Manor
  [265352] = true,    -- Toad Blight (Toad)

  -- Atal'Dazar

  -- King's Rest
  [270003] = true,    -- Suppression Slam (Animated Guardian)
  [270931] = true,    -- Darkshot
  [268796] = true,    -- (Kind Dazar)

  -- The MOTHERLODE!!

  -- Temple of Sethraliss
  [263914] = true,    -- Blinding Sand (Merektha)
  [269970] = true,    -- Blinding Sand (Merektha)

  -- Underrot
  [272609] = true,    -- Maddening Gaze (Faceless Corrupter)
}

local JCOMBATLOGEVENT = CreateFrame("Frame","JCOMBATLOGEVENT") 
JCOMBATLOGEVENT:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") 
JCOMBATLOGEVENT:RegisterEvent("PLAYER_REGEN_ENABLED")
JCOMBATLOGEVENT:RegisterEvent("PLAYER_REGEN_DISABLED")

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
function JCOMBATLOGEVENT:FixPets(action)
  if not action or not action.playername or not action.playerid then return end

  local owner = pets[action.playerid]

  -- 试着把宠物和守护者与它们的主人联系起来
  if not owner and action.playerflags and band(action.playerflags, PET_FLAGS) ~= 0 and band(action.playerflags, RAID_FLAGS) ~= 0 then
    
    if band(action.playerflags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= 0 then
      -- Skip tooltip scanning if it belongs to the player
      owner = { id = UnitGUID("player"), name = UnitName("player") }
      pets[action.playerid] = owner

    else
      
      local ownerName = GetPetOwner(action.playerid)

      if ownerName then
        local ownerGUID = UnitGUID(ownerName)
        if players[ownerGUID] then
          owner = { id = ownerGUID, name = ownerName }
          pets[action.playerid] = owner
        end
      end
    end
    if not owner then
      -- Couldn't resolve the owner. Modify guid so that there will only be 1 similar entry at least.
      action.playerid = action.playername
    end
  end

  if owner then
      if action.spellname then
        action.spellname = action.playername..": "..action.spellname
      end
      action.playername = owner.name
      action.playerid = owner.id
  end
end




local function GetDamdgeDataTab(inplayername)
    if DamdgeData[inplayername] == nil then
      DamdgeData[inplayername] = {
        damage = 0,
        firsttime = 0,
        lasttime = 0,
        combattime = 0,
        death = 0,
        interrupt = 0,
        dispel = 0,
        heal = 0,
        extraInjury = 0,
        score = 0,
    } 
    end
    return DamdgeData[inplayername]
end

-- Returns the group type (i.e., "party" or "raid") and the size of the group.
function JCOMBATLOGEVENT:GetGroupTypeAndCount()
  local type
  local count = GetNumGroupMembers()
  if IsInRaid() then
    type = "raid"
  elseif IsInGroup() then
    type = "party"
    -- To make the counts similar between 4.3 and 5.0, we need
    -- to subtract one because GetNumPartyMembers() does not
    -- include the player while GetNumGroupMembers() does.
    count = count - 1
  end

  return type, count
end

local function IsRaidInCombat()
  local type, count = JCOMBATLOGEVENT:GetGroupTypeAndCount()
  if count > 0 then
    for i = 1, count, 1 do
      if UnitExists(type..i) and UnitAffectingCombat(type..i) then
        return true
      end
    end
  elseif UnitAffectingCombat("player") then
    return true
  end
end

local function log_damage(set, dmg)
    if UnitIsPlayer(dmg.playername) then -- 过滤掉队友之外的人，在FixPets之后，所以包括了猎人的第二只宠物
      set.damage = set.damage + dmg.amount
    end
end

local dmg = {}
function JCOMBATLOGEVENT:SwingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, aAmount)--玩害普通攻击伤害统计
    if UnitIsPlayer(srcName) then
      -- pass
    elseif isPartyPet(srcGUID) then
      srcName = getPetOwnerName(srcGUID)
    else
      return
    end
    if srcGUID ~= dstGUID then
      dmg.timestamp = timestamp
      dmg.eventtype = eventtype
      dmg.playerid = srcGUID
      dmg.playerflags = srcFlags
      dmg.dstname = dstName
      dmg.playername = srcName
      dmg.spellid = spellId
      dmg.spellname = spellName
      dmg.amount = aAmount
      dmg.overkill = soverkill
      dmg.resisted = sresisted
      dmg.blocked = sblocked
      dmg.absorbed = sabsorbed
      dmg.critical = scritical
      dmg.glancing = sglancing
      dmg.crushing = scrushing
      dmg.offhand = soffhand
      dmg.missed = nil
      dmg.school = spellSchool
    end
    --JCOMBATLOGEVENT:FixPets(dmg)
    log_damage(GetDamdgeDataTab(dmg.playername),dmg)
end


function JCOMBATLOGEVENT:SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, aAmount)
    if (Spells[spellId] or (SpellsNoTank[spellId] and UnitGroupRolesAssigned(dstName) ~= "TANK")) and UnitIsPlayer(dstName) then --友军额外受伤统计
      local set = GetDamdgeDataTab(dstName)
      set.extraInjury = set.extraInjury + aAmount
    end
    --elseif UnitIsFriend("player",srcName) then --队友伤害 包括队友的宠物 
    --elseif UnitIsPlayer(srcName) then--队友伤害
    --elseif isPartyPet(srcGUID) then--宠物是否是在队伍里的----宠物伤害统计
    if UnitIsPlayer(srcName) then
      -- pass
    elseif isPartyPet(srcGUID) then
      srcName = getPetOwnerName(srcGUID)
    else
      return
    end
    if srcGUID ~= dstGUID then --所有的Unit最记录，最好只记录友方的，但是猎人的第二宠物UnitIsFriend和UnitIsPlayer为false,待优化，
      dmg.timestamp = timestamp
      dmg.eventtype = eventtype
      dmg.playerid = srcGUID
      dmg.playerflags = srcFlags
      dmg.dstname = dstName
      dmg.playername = srcName
      dmg.spellid = spellId
      dmg.spellname = spellName
      dmg.amount = aAmount
      dmg.overkill = soverkill
      dmg.resisted = sresisted
      dmg.blocked = sblocked
      dmg.absorbed = sabsorbed
      dmg.critical = scritical
      dmg.glancing = sglancing
      dmg.crushing = scrushing
      dmg.offhand = soffhand
      dmg.missed = nil
      dmg.school = spellSchool

      --JCOMBATLOGEVENT:FixPets(dmg)
      log_damage(GetDamdgeDataTab(dmg.playername),dmg)
    end 
end

function JCOMBATLOGEVENT:AddCombatDateToTab(inName,inevent,srcGUID,amount)
  if UnitIsPlayer(inName) then
    local set = GetDamdgeDataTab(inName)
    if inevent == "UNIT_DIED" then
      set.death = set.death + 1
    elseif inevent == "SPELL_INTERRUPT" then
      set.interrupt = set.interrupt + 1 
    elseif inevent == "SPELL_DISPEL" then
      set.dispel = set.dispel + 1
    elseif inevent == "SPELL_HEAL" or inevent == "SPELL_PERIODIC_HEAL" then
      set.heal = set.heal + amount
    end
  elseif srcGUID and isPartyPet(srcGUID) then
    local ownerName = getPetOwnerName(srcGUID)
    local set = GetDamdgeDataTab(ownerName)
    if inevent == "SPELL_DISPEL" then
      set.dispel = set.dispel + 1 
    end
  end
end

function JCOMBATLOGEVENT:AuraApply(srcName,dstName,spellId,spellName,auraAmount)
--[[ 
  if (Auras[spellId] or (AurasNoTank[spellId] and UnitGroupRolesAssigned(dstName) ~= "TANK")) and UnitIsPlayer(dstName)  then
    if auraAmount and MVPDB then
      J_maybeSendChatMessage("<友情提示> "..dstName.." 受到伤害 "..GetSpellLink(spellId)..". "..auraAmount.." Stacks.")
    elseif MVPDB then
      J_maybeSendChatMessage("<友情提示> "..dstName.." 受到伤害 "..GetSpellLink(spellId)..".")
    end
  end
  ]]
end

-----------      获取猎人第二只宠物主人的方法       -------------
local ownerPattern = UNITNAME_TITLE_PET:gsub("%%s", "(.-)")

local tooltip = CreateFrame("GameTooltip", "JanyTooltip", nil, "GameTooltipTemplate")
tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

local function GetPetOwner(guid)
  tooltip:SetHyperlink("unit:" .. guid)

  for i = 2, tooltip:NumLines() do
    local text = _G["JanyTooltipTextLeft"..i]:GetText() or ""
    
    local owner = text:match(ownerPattern)

    if owner then
      return owner
    end
  end
end
-----------      获取猎人第二只宠物主人的方法       -------------

function JCOMBATLOGEVENT:Batime(timestamp,srcName)
  if UnitIsPlayer(srcName) then
    local set = GetDamdgeDataTab(srcName)
    ----   战斗时间统计 以攻击间隔时长计算 -----
    if set.firsttime == 0 then 
      set.firsttime = dmg.timestamp 
    else
      set.lasttime = dmg.timestamp
    end
    if set.lasttime > 0 and set.lasttime - set.firsttime < 3.5 then
      set.combattime = set.combattime + set.lasttime - set.firsttime
      set.firsttime = 0;
      set.lasttime = 0;
    elseif set.lasttime > 0 and set.lasttime - set.firsttime > 3.5 then
      set.combattime = set.combattime + 3.5
      set.firsttime = 0;
      set.lasttime = 0;
    end
    ----   战斗时间统计 以进出战斗事件计算 -----
    --UnitAffectingCombat()
    --PLAYER_REGEN_ENABLED
    --PLAYER_REGEN_DISABLED
    ----   战斗时间统计 -----
  end
end

function JCOMBATLOGEVENT:CountPlayerMVPscores(srcName)--统计玩家分数
  if UnitIsPlayer(srcName) then
    local set = GetDamdgeDataTab(srcName)
    --(总伤害量 + 治疗 - 额外受伤 * 3) / 100000 + 打断 + 驱散 - 死亡 * 3
    set.score = round((set.damage + set.heal - set.extraInjury * 3) / 10000, 1) + set.interrupt + set.dispel - set.death * 3

  end
  
end

function JCOMBATLOGEVENT:CombatFilter(timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, ...)
  local src_is_interesting = nil
  local dst_is_interesting = nil

  if srcName and dstName and srcGUID ~= dstGUID and (eventtype == 'SPELL_DAMAGE' or eventtype == 'SPELL_BUILDING_DAMAGE' or eventtype == 'RANGE_DAMAGE' or eventtype == 'SWING_DAMAGE' or eventtype == 'SPELL_PERIODIC_DAMAGE') then
    src_is_interesting = band(srcFlags, RAID_FLAGS) ~= 0 or (band(srcFlags, PET_FLAGS) ~= 0 and pets[srcGUID]) or players[srcGUID]
    if eventtype ~= 'SPELL_PERIODIC_DAMAGE' then
      dst_is_interesting = band(dstFlags, RAID_FLAGS) ~= 0 or (band(dstFlags, PET_FLAGS) ~= 0 and pets[dstGUID]) or players[dstGUID]
    end


    if src_is_interesting or dst_is_interesting then
      local eventPrefix, eventSuffix = eventtype:match("^(.-)_?([^_]*)$");
      if (eventPrefix:match("^SPELL") or eventPrefix:match("^RANGE")) and eventSuffix == "DAMAGE" then
        local spellId, spellName, spellSchool, samount, soverkill, sschool, sresisted, sblocked, sabsorbed, scritical, sglancing, scrushing, soffhand = ...;
        JCOMBATLOGEVENT:SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, samount)
      elseif eventPrefix:match("^SWING") and eventSuffix == "DAMAGE" then
        local aAmount, aOverkill, aSchool, aResisted, aBlocked, aAbsorbed, aCritical, aGlancing, aCrushing, aOffhand = ...;
        JCOMBATLOGEVENT:SwingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, aAmount)
      elseif eventtype == "SPELL_AURA_APPLIED" then -- 受伤
        local spellId, spellName = ...;
        JCOMBATLOGEVENT:AuraApply(srcName,dstName,spellId,spellName) 
      elseif eventtype == "SPELL_AURA_APPLIED_DOSE" then -- 受伤 有参
        local spellId, spellName, spellSchool, auraType, auraAmount = ...;
        JCOMBATLOGEVENT:AuraApply(srcName,dstName,spellId,spellName,auraAmount)
      elseif eventtype == "UNIT_DIED" then --死亡事件JANY
        JCOMBATLOGEVENT:AddCombatDateToTab(dstName,eventtype)
      elseif eventtype == "SPELL_INTERRUPT" then--打断成功
        JCOMBATLOGEVENT:AddCombatDateToTab(srcName,eventtype)
      elseif eventtype == "SPELL_DISPEL" then--驱散
        JCOMBATLOGEVENT:AddCombatDateToTab(srcName,eventtype,srcGUID)
      elseif eventtype == "SPELL_HEAL" or eventtype == "SPELL_PERIODIC_HEAL" and eventtype ~= "SPELL_ABSORBED" then--治疗
        local _,_,_,a15,a16 = ...;
        local amount = a15 - a16
        if amount < 1 then return end
        JCOMBATLOGEVENT:AddCombatDateToTab(srcName,eventtype,_,amount)
      end

      -- return on invalid event, vehicle, friendly fire, hostile healing, evaded返回无效事件，车辆，友军火力，敌对治疗，躲避
      if not isValidEvent[eventtype] or strsplit("-", srcGUID) == "Vehicle" or (band(dstFlags, 16) > 0 and isDamage[eventtype])
      or (band(dstFlags, 16) == 0 and isHeal[eventtype]) or a15 == "EVADE" then
        return
      else
        JCOMBATLOGEVENT:Batime(timestamp,srcName)
        --JCOMBATLOGEVENT:CountPlayerMVPscores(srcName)
      end

    end
  end
end

function JCOMBATLOGEVENT:PLAYER_REGEN_ENABLED()

end
function JCOMBATLOGEVENT:PLAYER_REGEN_DISABLED()
 
end
function JCOMBATLOGEVENT:COMBAT_LOG_EVENT_UNFILTERED(event,...)
	return JCOMBATLOGEVENT:CombatFilter(CombatLogGetCurrentEventInfo())
end

JCOMBATLOGEVENT:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		return self[event](self, event, ...)
	end
end)



-------------------- API ---------------
function GetMVPDamdgeDataTable() --return Table
  --[[
    DamdgeData[inplayername] = {
      damage = 0,
      firsttime = 0,
      lasttime = 0,
      combattime = 0,
      death = 0,
      interrupt = 0,
      dispel = 0,
      heal = 0,
      extraInjury = 0,
      score = 0,
    }
  ]]

  return DamdgeData
end

local PlayerScoreData = {}
local maxscore = 0

local WhoIsMvp

function InitializationDamdgeDataTable()
  DamdgeData = {}
  maxscore = 0
  PlayerScoreData = {}
  WhoIsMvp=""
end






function GetPlayerScoreDataByUnitName(inUnit)
  if IsAddOnLoaded("Skada") then 
    if not SkadaPerCharDB or not SkadaPerCharDB.total or not SkadaPerCharDB.total.players then return end
    for k,v in pairs(SkadaPerCharDB.total.players) do
      if v.name == inUnit then
        PlayerScoreData[inUnit] = round((v.damage+v.healing-GetDamdgeDataTab(inUnit).extraInjury * 3) / 10000, 1)+GetDamdgeDataTab(inUnit).extraInjury+GetDamdgeDataTab(inUnit).dispel-GetDamdgeDataTab(inUnit).death*3;
      end
    end
  elseif IsAddOnLoaded("Details") then
    PlayerScoreData[inUnit] = round((Details.UnitDamage(inUnit,-1)+Details.UnitHealing(inUnit,-1)-GetDamdgeDataTab(inUnit).extraInjury * 3) / 10000, 1)+GetDamdgeDataTab(inUnit).extraInjury+GetDamdgeDataTab(inUnit).dispel-GetDamdgeDataTab(inUnit).death*3;
  else
    PlayerScoreData[inUnit] = round((GetDamdgeDataTab(inUnit).damage+GetDamdgeDataTab(inUnit).heal-GetDamdgeDataTab(inUnit).extraInjury * 3) / 10000, 1)+GetDamdgeDataTab(inUnit).extraInjury+GetDamdgeDataTab(inUnit).dispel-GetDamdgeDataTab(inUnit).death*3;
  end
  if not PlayerScoreData[inUnit] then return end
  if PlayerScoreData[inUnit]>maxscore then 
    maxscore=PlayerScoreData[inUnit]
    WhoIsMvp=inUnit
  end  
  --if inUnit == GetUnitName("player",true) then print(inUnit,PlayerScoreData[inUnit]) end
  return PlayerScoreData[inUnit],maxscore
end

function GetMvpUnit()
  return WhoIsMvp
end

function GetAllScore()
  local AllScore=0
  for k,v in pairs(PlayerScoreData) do
    AllScore = AllScore + v
  end
  return AllScore
end
--IsAddOnLoaded("Skada")
--IsAddOnLoaded("details")
-- Details.UnitDamage(inUnit,-1) Details.SegmentElapsedTime(-1) Details.UnitHealing(inUnit,-1)
--(总伤害量 + 治疗 - 额外受伤 * 3) / 100000 + 打断 + 驱散 - 死亡 * 3

function GetCombotData(inUnit)
  if IsAddOnLoaded("Skada") then 
    for k,v in pairs(SkadaPerCharDB.total.players) do
      if v.name == inUnit then
        return v.damage,v.damage/v.time,v.healing,GetDamdgeDataTab(inUnit).extraInjury,GetDamdgeDataTab(inUnit).interrupt,GetDamdgeDataTab(inUnit).dispel,GetDamdgeDataTab(inUnit).death
      end
    end
  elseif IsAddOnLoaded("Details") then
    return Details.UnitDamage(inUnit,-1),Details.UnitDamage(inUnit,-1)/Details.SegmentElapsedTime(-1),Details.UnitHealing(inUnit,-1),GetDamdgeDataTab(inUnit).extraInjury,GetDamdgeDataTab(inUnit).interrupt,GetDamdgeDataTab(inUnit).dispel,GetDamdgeDataTab(inUnit).death
  else
    return GetDamdgeDataTab(inUnit).damage,GetDamdgeDataTab(inUnit).damage/GetDamdgeDataTab(inUnit).combattime,GetDamdgeDataTab(inUnit).heal,GetDamdgeDataTab(inUnit).extraInjury,GetDamdgeDataTab(inUnit).interrupt,GetDamdgeDataTab(inUnit).dispel,GetDamdgeDataTab(inUnit).death
  end
  return false
end

