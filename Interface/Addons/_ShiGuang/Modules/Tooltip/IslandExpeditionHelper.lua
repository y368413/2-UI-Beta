--## Version: 0.3  ## Author: Ignifazius


local eventResponseFrame = CreateFrame("Frame", "Helper")
eventResponseFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
eventResponseFrame:RegisterEvent("CURSOR_UPDATE");


local function eventHandler(self, event)
    if (event == "UPDATE_MOUSEOVER_UNIT") then
        function__wait(0.1, IslandExpeditionHelper_addValueToTooltip)
    elseif (event == "CURSOR_UPDATE") then
        function__wait(0.1, IslandExpeditionHelper_addShrineTooltip)
        function__wait(0.1, IslandExpeditionHelper_addValueToTooltip)
    end
end
eventResponseFrame:SetScript("OnEvent", eventHandler);

local shrines = { -- [""] = {["positiv"] = "", ["negativ"] = ""},
    ["Altar of the Sea"] = {["positiv"] = "30Haste", ["negativ"] = "Periodic Frost Damage"}, -- 272644
    ["Cursed Offering"] = {["positiv"] = "30mastery", ["negativ"] = "50health"}, -- 277523
    ["Death Ward"] = {["positiv"] = "30shadowDone", ["negativ"] = "50holyTaken"}, -- 281844
    ["Deepwoods Totem"] = {["positiv"] = "30natureDone", ["negativ"] = "50arcanTaken"}, -- 281838
    ["Moon-Touched Ruins"] = {["positiv"] = "30crit", ["negativ"] = "50magicTaken"}, -- 277562
    ["Overgrown Relic"] = {["positiv"] = "30holyDone", ["negativ"] = "50shadowTaken"}, -- 281836
    ["Pillar of the Watchers"] = {["positiv"] = "30healDoneAndTaken", ["negativ"] = "nodef"}, -- 272643
    ["Primal Shrine"] = {["positiv"] = "30physicalDone", ["negativ"] = "50armor"}, -- 270021
    ["Rune-Etched Stone"] = {["positiv"] = "30arcanDone", ["negativ"] = "50natureTaken"}, -- 281839
    ["Slithering Shrine"] = {["positiv"] = "30move", ["negativ"] = "buffAndPurgeDoes80pDmg"}, -- 277522
    ["Spirit Font"] = {["positiv"] = "Retaliation Damage Procs", ["negativ"] = "none"}, -- 281834
    ["Wanderer's Respite"] = {["positiv"] = "30versa", ["negativ"] = "60healTaken"}, -- 277525
    ["Fireheart Idol"] = {["positiv"] = "30firedone", ["negativ"] = "50frosttaken"} -- 281843
}

local azerite = {
    ["Acidic Worm"] = 6,
    ["Aerin Skyhammer"] = 400,
    ["Ancient Forest-Walker"] = 150,
    ["Arwan Beastheart"] = 400,
    ["Azerite Chunk"] = 125,
    ["Azerite Crystal"] = 175,
    ["Azerite Shard"] = 75,
    ["Bag of Azerite"] = 100,
    ["Battle-Mender Ka'vaz"] = 200,
    ["Breakbeak Bonepicker"] = 150,
    ["Breakbeak Hatchling"] = 2,
    ["Breakbeak Scavenger"] = 10,
    ["Breakbeak Vulture"] = 6,
    ["Brightscale Coilfang"] = 150,
    ["Brightscale Hatchling"] = 2,
    ["Brightscale Screecher"] = 10,
    ["Brightscale Wind Serpent"] = 6,
    ["Brimstone Lavamaw"] = 150,
    ["Brimstone Pup"] = 2,
    ["Brimstone Tracker"] = 10,
    ["Brineshell Crusher"] = 150,
    ["Bristlemane Bramble-Weaver"] = 150,
    ["Bristlemane Defender"] = 10,
    ["Bristlemane Pathfinder"] = 6,
    ["Bristlemane Quilboar"] = 6,
    ["Bristlemane Squealer"] = 2,
    ["Bristlemane Thorncaller"] = 10,
    ["Bristlethorn Battleguard"] = 150,
    ["Broken Azerite Shard"] = 25,
    ["Congealed Azerite"] = 15,
    ["Coralback Crab"] = 6,
    ["Coralback Surfcrawler"] = 10,
    ["Crag Rager"] = 10,
    ["Cragburster"] = 200,
    ["Craghoof Leaper"] = 10,
    ["Craghoof Rockhorn"] = 150,
    ["Daggertooth"] = 200,
    ["Deathsting Broodwatcher"] = 150,
    ["Deathsting Hatchling"] = 2,
    ["Deathsting Lasher"] = 10,
    ["Deathsting Scorpid"] = 6,
    ["Deepstone Crusher"] = 150,
    ["Dreadfang Slitherer"] = 2,
    ["Dreadfang Viper"] = 10,
    ["Driftstalker"] = 200,
    ["Dryad Grove-Tender"] = 150,
    ["Duskstalker Kuli"] = 200,
    ["Earth Elemental"] = 6,
    ["Earth Spirit"] = 6,
    ["Encrusted Coralback"] = 150,
    ["Eso the Fathom-Hunter"] = 300,
    ["Evergrove Keeper"] = 150,
    ["Frolicsome Soilkin"] = 2,
    ["Frostbore Burster"] = 10,
    ["Frostbore Worm"] = 6,
    ["Garnetback Striker"] = 10,
    ["Garnetback Worm"] = 6,
    ["Gashasz"] = 200,
    ["Gemshard Colossus"] = 300,
    ["Giant Dreadfang"] = 150,
    ["Gnashing Horror"] = 200,
    ["Great Mota"] = 300,
    ["Greatfangs"] = 200,
    ["Gritplate Basilisk"] = 6,
    ["Gritplate Gazer"] = 10,
    ["Grizzlefur Bear"] = 6,
    ["Grizzlefur Patriarch"] = 150,
    ["Grrl"] = 200,
    ["Guuru the Mountain-Breaker"] = 300,
    ["Icecracker"] = 300,
    ["Ironweb Spider"] = 6,
    ["Ironweb Weaver"] = 150,
    ["Island Ettin"] = 300,
    ["Jadescale Gnasher"] = 10,
    ["Jadescale Worm"] = 6,
    ["Kindleweb Clutchkeeper"] = 150,
    ["Kindleweb Creeper"] = 10,
    ["Kindleweb Skitterer"] = 2,
    ["Knucklebump Gorilla"] = 6,
    ["Laughing Blaze"] = 2,
    ["Longpaws"] = 400,
    ["Magma Giant"] = 300,
    ["Malachite"] = 200,
    ["Mechanical Guardhound"] = 6,
    ["Meeting Stone"] = 666,
    ["Mirelurk Assassin"] = 10,
    ["Mirelurk Bogtender"] = 6,
    ["Mirelurk Guardian"] = 10,
    ["Mirelurk Rivercaller"] = 10,
    ["Mischievous Flood"] = 10,
    ["Mrogan"] = 300,
    ["Muckfin Murloc"] = 6,
    ["Muckfin Oracle"] = 10,
    ["Muckfin Puddlejumper"] = 2,
    ["Muckfin Tidehunter"] = 6,
    ["Mudwhisker Candlekeeper"] = 150,
    ["Mudwhisker Earthtosser"] = 6,
    ["Mudwhisker Kobold"] = 6,
    ["Mudwhisker Runt"] = 2,
    ["Mudwhisker Taskmaster"] = 150,
    ["Muskflank Bull"] = 150,
    ["Muskflank Calf"] = 2,
    ["Muskflank Charger"] = 10,
    ["Muskflank Yak"] = 6,
    ["Nasira Morningfrost"] = 300,
    ["Nassa the Cold-Blooded"] = 200,
    ["Nettlevine Sprite"] = 6,
    ["Nettlevine Trickster"] = 10,
    ["Old Chest"] = 100,
    ["Old Li"] = 400,
    ["Overseer Steelsnout"] = 300,
    ["Pinegraze Courser"] = 10,
    ["Pinegraze Greatstag"] = 150,
    ["Pouch of Azerite"] = 50,
    ["Profit-O-Matic"] = 10,
    ["Razorfin Aqualyte"] = 10,
    ["Razorfin Impaler"] = 10,
    ["Razorfin Javelineer"] = 6,
    ["Razorfin Jinyu"] = 6,
    ["Razorfin Watershaper"] = 150,
    ["Razorfin Waveguard"] = 150,
    ["Recently Petrified Foe"] = 2,
    ["Reinforced Chest"] = 150,
    ["Rotting Wooden Chest"] = 150,
    ["Rumbling Earth"] = 2,
    ["Rustpelt Alpha"] = 150,
    ["Rustpelt Pup"] = 2,
    ["Rustpelt Snarler"] = 10,
    ["Rustpelt Wolf"] = 6,
    ["Sack of Azerite"] = 150,
    ["Safety Inspection Bot"] = 2,
    ["Saltfin"] = 200,
    ["Sandscalp Axe Thrower"] = 6,
    ["Sandscalp Berserker"] = 150,
    ["Sandscalp Soothsayer"] = 150,
    ["Sandscalp Villager"] = 2,
    ["Sandscalp Warrior"] = 6,
    ["Sarashas the Pillager"] = 200,
    ["Scalper Bazuulu"] = 200,
    ["Scartalon"] = 200,
    ["Senior Producer Gixi"] = 300,
    ["Slitherblade Gladiator"] = 6,
    ["Slitherblade Ironscale"] = 10,
    ["Slitherblade Oracle"] = 10,
    ["Slitherblade Wavecaller"] = 6,
    ["Slow Olo"] = 200,
    ["Snowfur Alpha"] = 150,
    ["Snowfur Wolf"] = 6,
    ["Sparkleshell Clacker"] = 10,
    ["Sparkleshell Crab"] = 6,
    ["Sparkleshell Deathclaw"] = 150,
    ["Steelscale Volshasis"] = 200,
    ["Steelshred"] = 200,
    ["Swipeclaw"] = 200,
    ["Thistlebrush Sprite"] = 6,
    ["Thistlebrush Trickster"] = 10,
    ["Tidal Surger"] = 10,
    ["Tidestriker Ocho"] = 200,
    ["Trickle"] = 200,
    ["Unbound Azerite"] = 400,
    ["Unleashed Azerite"] = 40,
    ["Unstable Typhoon"] = 150,
    ["Venomfang Recluse"] = 150,
    ["Venomfang Spider"] = 6,
    ["Venomfang Spiderling"] = 2,
    ["Venture Goon"] = 6,
    ["Venture Inspector"] = 6,
    ["Venture Oaf"] = 10,
    ["Venture Surveyor"] = 10,
    ["Verdant Dryad"] = 10,
    ["Verdant Flytrap"] = 6,
    ["Verdant Keeper"] = 10,
    ["Verdant Lasher"] = 2,
    ["Verdant Spitter"] = 6,
    ["Verdant Tender"] = 10,
    ["Verdant Treant"] = 10,
    ["Vicejaw Chomper"] = 10,
    ["Vicejaw Crocolisk"] = 6,
    ["Vicejaw Sawtooth"] = 150,
    ["Vicious Vicejaw"] = 200,
    ["Visz the Silent Blade"] = 200,
    ["Water Elemental"] = 6,
    ["Water Spirit"] = 6,
    ["Witherbranch Axe Thrower"] = 6,
    ["Witherbranch Berserker"] = 150,
    ["Witherbranch Headhunter"] = 10,
    ["Witherbranch Venom Priest"] = 150,
    ["Witherbranch Villager"] = 2,
    ["Witherbranch Warrior"] = 6,
    ["Witherbranch Witch Doctor"] = 10,
    ["Wooden Strongbox"] = 50,
    ["Zara'thik Drone"] = 2,
    ["Zgordo the Brutalizer"] = 300
}

local food = {
    ["Cabbage"] = 15000
}

local misc = {
    ["Starfish"] = "stun + 10%dmg"
}

function IslandExpeditionHelper_addShrineTooltip()
    local key = GameTooltipTextLeft1:GetText()
    if key ~= nil and shrines[key] ~= nil and checkTooltipForDuplicates() then
        local infoTextP = shrines[key]["positiv"]
        local infoTextN = shrines[key]["negativ"]
        if infoTextP ~= nil and infoTextN ~= nil then
            GameTooltip:AddLine(infoTextP, 0, 1, 0, 1, 0)
            GameTooltip:AddLine(infoTextN, 1, 0, 0, 1, 0)
            GameTooltip:Show()
        end
    end
end

function IslandExpeditionHelper_addValueToTooltip()
    local key = GameTooltipTextLeft1:GetText()
    if key ~= nil and azerite[key] ~= nil then
        local infoText = azerite[key]
        if infoText ~= nil and checkTooltipForDuplicates() then
            GameTooltip:AddLine(adjustToDifficulty(infoText), 0.9, 0.8, 0.5, 1, 0)
            GameTooltip:Show()
        end
    end
end

function checkTooltipForDuplicates()
    for i=1,GameTooltip:NumLines() do
        local tooltip=_G["GameTooltipTextLeft"..i]
        local tt = tooltip:GetText()
        --if string.find(tt, "IEH:") ~= nil then
            --return false
        --end
    end
    return true
end


local waitTable = {};
local waitFrame = nil;

function function__wait(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
    waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end


function adjustToDifficulty(value)
    _,_,_, diff = GetInstanceInfo()
    if diff == "Normal" then
        return value
    elseif diff == "Heroic" then
        return value*1.5
    elseif diff == "Mythic" then
        return value*2
    elseif diff == "PvP" then --TODO find real value
        return value*2
    end
    
    return value;
end




