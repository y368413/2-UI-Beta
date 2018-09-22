local _, ns = ... 

local L = ns.Locale 

--群体复活； 
local GroupResurrectionSpells = { 
	[212036] = true,	--群体复活
	[212056] = true,	--宽恕
} 

--单体复活； 
local SingleResurrectionSpells = { 
	[7328] = true,		--救赎
	[2008] = true,		--先祖之魂
	[50769] = true, 	--起死回生
	[2048] = true,		--复生
	[2006] = true,		--复活术
	[61999] = true,		--复活盟友
	[115178] = true,	--轮回转世
	[20707] = true,		--灵魂石复活
	[267922] = true,	--永恒守护者
} 

local function NoticeOthers(Text) 
  if IsInRaid(LE_PARTY_CATEGORY_HOME) then
    SendChatMessage(Text, "RAID", nil, nil) 
  elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
    SendChatMessage(Text, "PARTY", nil, nil) 
  elseif IsInRaid(LE_PARTY_CATEGORY_INSTANCE) or IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then 
    SendChatMessage(Text, "INSTANCE_CHAT", nil, nil) 
  else 
    SendChatMessage(Text, "SAY", nil, nil) 
  end 
end 

local Resurrection = function(self, event, unit, target, castID, spellID)
  if not ns.db.Resurrection then return end
  if unit ~= "player" then return end
  --群活
  if GroupResurrectionSpells[spellID] then 
    local Text = L.grouprevive; 
    NoticeOthers(Text); 
  end 
  --单活
  if SingleResurrectionSpells[spellID] then 
    local Text; 
    if target then 
      if UnitIsDeadOrGhost(target) then 
         Text = L.revive.."["..target.."]......"; 
      else 
         Text = string.format(L.bindstone, target); 
      end 
    else 
      local name = GetSpellInfo(spellID); 
         Text = L.castrevive.."["..name.."]......"; 
    end 
       NoticeOthers(Text); 
   end 
end 

local OnResFrame = CreateFrame("Frame"); 
OnResFrame:RegisterEvent("UNIT_SPELLCAST_SENT"); 
OnResFrame:SetScript("OnEvent", Resurrection);