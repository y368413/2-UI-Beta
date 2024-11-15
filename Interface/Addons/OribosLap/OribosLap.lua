local _,L = ...;

local clockwiseRad = 0;
local counterRad = 0;

local lastPlayerMap = 0;
local lastPlayerPos = CreateVector2D(0,0);
local OriCenterBottom = CreateVector2D(0.52, 0.50);
local OriCenterTop = CreateVector2D(0.495, 0.515);
local OriCenter = CreateVector2D(0,0);
local mapID = 0;

local twoPi = 2 * math.pi;
local startLapDT = 0;

local frameCount = 0;
local updateInterval = 60;
local fontColor = "12C0FF";
local Fates,Transference;

for a,b in pairs(C_Map.GetMapGroupMembersInfo(C_Map.GetMapGroupID(1670))) do
  if b.mapID == 1670 then Fates = b.name; end
  if b.mapID == 1671 then Transference = b.name; end
end

local function dtToPrintableTime(dt)
  if type(dt) ~= "number" then return nil; end
  local Mili = dt % 1;
  local nonMili = dt - Mili;
  local seconds = nonMili % 60;
  local minutes = (nonMili - seconds) / 60;
  if minutes < 0 then minutes = 0; end
  return string.format("%d:%02.2f",minutes,seconds+Mili);
end

local playerOffset = CreateVector2D(0,0);
local lastPlayerOffset = CreateVector2D(0,0);

local function RGBtoHEX(r, g, b)
  return string.format("%02x%02x%02x", r*255, g*255, b*255);
end

local function BYTEtoHEX(b)
  if b > 57 then b = b - 55; else
      b = b - 48; end
  return b;
end

local function HEXtoRGB(hex)
  hex = string.upper(hex);
  local r = BYTEtoHEX(string.byte(hex,1)) * 16 + BYTEtoHEX(string.byte(hex,2));
  local g = BYTEtoHEX(string.byte(hex,3)) * 16 + BYTEtoHEX(string.byte(hex,4));
  local b = BYTEtoHEX(string.byte(hex,5)) * 16 + BYTEtoHEX(string.byte(hex,6));
  return r, g, b;
end

local function OriLapUpdate()
  frameCount = frameCount + 1;
  if frameCount >= updateInterval then
    frameCount = 0;
    
    mapID = C_Map.GetBestMapForUnit("player");
    -- 1670 is bottom, 1571 is flight path level
    if mapID == 1670 or mapID == 1671 then
      --if switched Oribos Level, reset the lap
      if mapID ~= lastPlayerMap then
        lastPlayerMap = mapID;
        clockwiseRad = 0;
        counterRad = 0;
      end
      
      --set the center for which level the player is on
      if mapID == 1670 then
        OriCenter:SetXY(OriCenterBottom.x, OriCenterBottom.y);
      else
        OriCenter:SetXY(OriCenterTop.x, OriCenterTop.y);
      end
      
      local playerPos = C_Map.GetPlayerMapPosition(mapID, "player");
      
      if not playerPos:IsEqualTo(lastPlayerPos) then
        if lastPlayerPos.x ~= 0 and lastPlayerPos.y ~= 0 then
          playerOffset:SetXY(playerPos.x - OriCenter.x, playerPos.y - OriCenter.y);
          playerOffset:Normalize();
          lastPlayerOffset:SetXY(lastPlayerPos.x - OriCenter.x, lastPlayerPos.y - OriCenter.y);
          lastPlayerOffset:Normalize();
          
          if counterRad == 0 and clockwiseRad == 0 then
            startLapDT = GetTime();
          end
        
          local movementRad = math.acos(lastPlayerOffset:Dot(playerOffset));
          
          if Vector2D_Cross(lastPlayerOffset.x, lastPlayerOffset.y, playerOffset.x, playerOffset.y) < 0 then
            counterRad = counterRad + movementRad;
            clockwiseRad = clockwiseRad - movementRad;
          else
            counterRad = counterRad - movementRad;
            clockwiseRad = clockwiseRad + movementRad;
          end
          
          
          if clockwiseRad >= twoPi or counterRad >= twoPi then
            if clockwiseRad >= twoPi then
              OribosLap.clock = OribosLap.clock + 1;
              OribosLap_char.clock = OribosLap_char.clock + 1;
            else
              OribosLap.counter = OribosLap.counter + 1;
              OribosLap_char.counter = OribosLap_char.counter + 1;
            end
          
            clockwiseRad = clockwiseRad - twoPi;
            counterRad = counterRad - twoPi;
            
            if mapID == 1670 then
              OribosLap.bottom = OribosLap.bottom + 1;
              OribosLap_char.bottom = OribosLap_char.bottom + 1;
            else
              OribosLap.top = OribosLap.top + 1;
              OribosLap_char.top = OribosLap_char.top + 1;
            end
            
            local lapTime = GetTime() - startLapDT;
            startLapDT = GetTime();
            
            if OribosLap.announceLap then
              if OribosLap.displayLapTime then
                print("|cFF"..fontColor..L.Completed_Lap.." "..L.Time.."|r"..dtToPrintableTime(lapTime));
              else
                print("|cFF"..fontColor..L.Completed_Lap.."|r");
              end
            end
            
            if lapTime < OribosLap.fastest then
              OribosLap.fastest = lapTime;
              if OribosLap.announceRecordLap then
                print("|cFF"..fontColor..L.Account_Lap_Record.." "..L.Time.."|r"..dtToPrintableTime(lapTime));
              end
            end
            if lapTime < OribosLap_char.fastest then
              OribosLap_char.fastest = lapTime;
              if OribosLap.announceRecordLap then
                print("|cFF"..fontColor..L.Character_Lap_Record.." "..L.Time.."|r"..dtToPrintableTime(lapTime));
              end
            end
          end
          if counterRad < 0 then counterRad = 0; end
          if clockwiseRad < 0 then clockwiseRad = 0; end
        end      
        
        lastPlayerPos = playerPos;
      end
    end
  end
end

local frameDummy = CreateFrame("Frame", "OribosLapDummy", UIParent);
local frame = CreateFrame("Frame", "OribosLapOptionsFrame", UIParent);
frame.name = "Oribos Lap";
--InterfaceOptions_AddCategory(frame);

local cat = Settings.RegisterCanvasLayoutCategory(frame, "Oribos Lap");
cat.ID = "Oribos Lap";
Settings.RegisterAddOnCategory(cat);

local function OriLap_SetupOptionsMenu()
  ----Announce Lap
  local checkbox = CreateFrame("CheckButton", "OribosLap_AnnounceLap", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.announceLap = not OribosLap.announceLap; self:SetChecked(OribosLap.announceLap); end);
  checkbox:SetChecked(OribosLap.announceLap);

  OribosLap_AnnounceLapText:SetText(L.Announce_Lap);

  checkbox.tooltipText = L.Announce_Lap;
  checkbox.tooltipRequirement = L.Announce_Lap_Tooltip;

  checkbox:SetPoint("TOPLEFT", 16, -16)
  
  ----Announce Lap Time
  local checkbox = CreateFrame("CheckButton", "OribosLap_DisplayLapTime", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayLapTime = not OribosLap.displayLapTime; self:SetChecked(OribosLap.displayLapTime); end);
  checkbox:SetChecked(OribosLap.displayLapTime);

  OribosLap_DisplayLapTimeText:SetText(L.Display_Lap_Time);

  checkbox.tooltipText = L.Display_Lap_Time;
  checkbox.tooltipRequirement = L.Display_Lap_Time_Tooltip;

  checkbox:SetPoint("TOPLEFT", 40, -40)
  
  ----Announce Record Lap
  local checkbox = CreateFrame("CheckButton", "OribosLap_AnnounceRecordLap", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.announceRecordLap = not OribosLap.announceRecordLap; self:SetChecked(OribosLap.announceRecordLap); end);
  checkbox:SetChecked(OribosLap.announceRecordLap);

  OribosLap_AnnounceRecordLapText:SetText(L.Announce_Record_Lap);

  checkbox.tooltipText = L.Announce_Record_Lap;
  checkbox.tooltipRequirement = L.Announce_Record_Lap_Tooltip;

  checkbox:SetPoint("TOPLEFT", 16, -64)
  
  ----Display Acct Stats
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayAcct", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayAcct = not OribosLap.displayAcct; self:SetChecked(OribosLap.displayAcct); end);
  checkbox:SetChecked(OribosLap.displayAcct);

  OribosLap_DisplayAcctText:SetText(L.Display_Account_Stats);

  checkbox.tooltipText = L.Display_Account_Stats;
  checkbox.tooltipRequirement = L.Display_Account_Stats_Tooltip;

  checkbox:SetPoint("TOPLEFT", 16, -88)
  
  ----Display Char Stats
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayChar", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayChar = not OribosLap.displayChar; self:SetChecked(OribosLap.displayChar); end);
  checkbox:SetChecked(OribosLap.displayChar);

  OribosLap_DisplayCharText:SetText(L.Display_Character_Stats);

  checkbox.tooltipText = L.Display_Character_Stats;
  checkbox.tooltipRequirement = L.Display_Character_Stats_Tooltip;

  checkbox:SetPoint("TOPLEFT", 16, -112)
  
  ----Display As Percent
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayPercent", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayPercent = not OribosLap.displayPercent; self:SetChecked(OribosLap.displayPercent); end);
  checkbox:SetChecked(OribosLap.displayPercent);

  OribosLap_DisplayPercentText:SetText(L.Display_As_Percent);

  checkbox.tooltipText = L.Display_As_Percent
  checkbox.tooltipRequirement = L.Display_As_Percent_Tooltip

  checkbox:SetPoint("TOPLEFT", 16, -136)
end

frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
frame:SetScript("OnEvent", function(pSelf, pEvent, pUnit)
  if pEvent == "ADDON_LOADED" and pUnit == "OribosLap" then
    if (OribosLap == nil) then
      OribosLap = {};
      OribosLap.bottom = 0;
      OribosLap.top = 0;
      OribosLap.clock = 0;
      OribosLap.counter = 0;
      OribosLap.announceLap = true;
      OribosLap.displayAcct = true;
      OribosLap.displayChar = true;
      OribosLap.fastest = math.huge;
      OribosLap.displayLapTime = false;
      OribosLap.announceRecordLap = true;
    end
    if (OribosLap.displayPercent == nil) then
      OribosLap.displayPercent = false;
    end
    if (OribosLap_char == nil) then
      OribosLap_char = {};
      OribosLap_char.bottom = 0;
      OribosLap_char.top = 0;
      OribosLap_char.clock = 0;
      OribosLap_char.counter = 0;
      OribosLap_char.fastest = math.huge;
    end
    if OribosLap.fastest == nil then OribosLap.fastest = math.huge; end
    if OribosLap_char.fastest == nil then OribosLap_char.fastest = math.huge; end
    
    local Locale = GetLocale();
    if L[Locale] ~= nil then
      L[Locale]();
    else
      L["enUS"]();
    end
    
    OriLap_SetupOptionsMenu();
  elseif pEvent == "ZONE_CHANGED_NEW_AREA" then
    lastPlayerMap = 0;
    lastPlayerPos:SetXY(0,0);
  end
end)

----
-- Print Function for displaying clockwise/counter-clockwise tendency.
----
local function DisplayDir(char_, acct_)
	local str;
	if acct_ then 
	  if OribosLap.clock > OribosLap.counter then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Dir_Clockwise, "|cFFFFFFFF"..OribosLap.clock - OribosLap.counter.."|r");
      else
        str = string.format(L.Lap_Dir_Clockwise_Percent, "|cFFFFFFFF"..string.format("%.1f",OribosLap.clock / (OribosLap.clock + OribosLap.counter) * 100).."%|r");
      end
	  elseif OribosLap.clock < OribosLap.counter then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Dir_Counter, "|cFFFFFFFF"..OribosLap.counter - OribosLap.clock.."|r");
      else
        str = string.format(L.Lap_Dir_Counter_Percent, "|cFFFFFFFF"..string.format("%.1f",OribosLap.counter / (OribosLap.clock + OribosLap.counter) * 100).."%|r");
      end
	  else
      str = L.Lap_Dir_Equal;
	  end
    print("|cFF"..fontColor..L.Account..str.."|r");
	end

	if char_ then
	  if OribosLap_char.clock > OribosLap_char.counter then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Dir_Clockwise, "|cFFFFFFFF"..OribosLap_char.clock - OribosLap_char.counter.."|r");
      else
        str = string.format(L.Lap_Dir_Clockwise_Percent, "|cFFFFFFFF"..string.format("%.1f",OribosLap_char.clock / (OribosLap_char.clock + OribosLap_char.counter) * 100).."%|r");
      end
	  elseif OribosLap_char.clock < OribosLap_char.counter then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Dir_Counter, "|cFFFFFFFF"..OribosLap_char.counter - OribosLap_char.clock.."|r");
      else
        str = string.format(L.Lap_Dir_Counter_Percent, "|cFFFFFFFF"..string.format("%.1f",OribosLap_char.counter / (OribosLap_char.clock + OribosLap_char.counter) * 100).."%|r");
      end
	  else
      str = L.Lap_Dir_Equal;
	  end
	  print("|cFF"..fontColor..L.Character..str.."|r");
	end
end

----
-- Print Function for displaying Ring of Fates/Transference tendency.
----
local function DisplayLevel(char_, acct_)
  local str;
  if acct_ then 
    if OribosLap.top > OribosLap.bottom then --Ring of Transference
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Level, Transference, "|cFFFFFFFF"..OribosLap.top - OribosLap.bottom.."|r");
      else
        str = string.format(L.Lap_Level_Percent, Transference, "|cFFFFFFFF"..string.format("%.1f",OribosLap.top / (OribosLap.top + OribosLap.bottom) * 100).."%|r");
      end
    elseif OribosLap.top < OribosLap.bottom then --Ring of Fates
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Level, Fates, "|cFFFFFFFF"..OribosLap.bottom - OribosLap.top.."|r");
      else
        str = string.format(L.Lap_Level_Percent, Fates, "|cFFFFFFFF"..string.format("%.1f",OribosLap.bottom / (OribosLap.top + OribosLap.bottom) * 100).."%|r");
      end
    else
      str = L.Lap_Level_Equal;
    end
    print("|cFF"..fontColor..L.Account..str.."|r");
  end
  
  if char_ then
    if OribosLap_char.top > OribosLap_char.bottom then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Level, Transference, "|cFFFFFFFF"..OribosLap_char.top - OribosLap_char.bottom.."|r");
      else
        str = string.format(L.Lap_Level_Percent, Transference, "|cFFFFFFFF"..string.format("%.1f",OribosLap_char.top / (OribosLap_char.top + OribosLap.bottom) * 100).."%|r");
      end
    elseif OribosLap_char.top < OribosLap_char.bottom then
      if not OribosLap.displayPercent then
        str = string.format(L.Lap_Level, Fates, "|cFFFFFFFF"..OribosLap_char.bottom - OribosLap_char.top.."|r");
      else
        str = string.format(L.Lap_Level_Percent, Fates, "|cFFFFFFFF"..string.format("%.1f",OribosLap_char.bottom / (OribosLap_char.top + OribosLap.bottom) * 100).."%|r");
      end
    else
      str = L.Lap_Level_Equal;
    end
    print("|cFF"..fontColor..L.Character..str.."|r");
  end
end

----
-- Print Function for displaying fatest lap times.
----
local function DisplayFastest(char_, acct_)
  if acct_ then 
    print("|cFF"..fontColor..L.Account..string.format(L.Fastest, "|cFFFFFFFF"..dtToPrintableTime(OribosLap.fastest) or "nil".."|r"));
  end
  
  if char_ then
    print("|cFF"..fontColor..L.Character..string.format(L.Fastest, "|cFFFFFFFF"..dtToPrintableTime(OribosLap_char.fastest) or "nil".."|r"));
  end
end

----
-- Print Function for displaying total laps.
----
local function DisplayLaps(char_, acct_)
  if acct_ then 
    print("|cFF"..fontColor..L.Account..string.format(L.Total_Laps, "|cFFFFFFFF"..(OribosLap.clock + OribosLap.counter).."|r"));
  end
  
  if char_ then
    print("|cFF"..fontColor..L.Character..string.format(L.Total_Laps, "|cFFFFFFFF"..(OribosLap_char.clock + OribosLap_char.counter).."|r"));
  end
end

frameDummy:SetScript("OnUpdate", OriLapUpdate);

SLASH_ORIBOSLAP1 = '/orilap';
function SlashCmdList.ORIBOSLAP(msg, editbox)
  if msg == L.dir or msg == "dir" then
    DisplayDir(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == L.level or msg == "level" then
    DisplayLevel(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == L.fastest or msg == "fastest" then
    DisplayFastest(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == L.alla or msg == "alla" then
    DisplayLaps(false, true);
    DisplayFastest(false, true);
    DisplayLevel(false, true);
    DisplayDir(false, true);
  elseif msg == L.allc or msg == "allc" then
    DisplayLaps(true, false);
    DisplayFastest(true, false);
    DisplayLevel(true, false);
    DisplayDir(true, false);
  else
    DisplayLaps(OribosLap.displayChar, OribosLap.displayAcct);
  end
end