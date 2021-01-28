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
                print("|cFF"..fontColor.."You completed a lap of Oribos! Time: |r"..dtToPrintableTime(lapTime));
              else
                print("|cFF"..fontColor.."You completed a lap of Oribos!|r");
              end
            end
            
            if lapTime < OribosLap.fastest then
              OribosLap.fastest = lapTime;
              if OribosLap.announceRecordLap then
                print("|cFF"..fontColor.."You set a new account lap record for Oribos! Time: |r"..dtToPrintableTime(lapTime));
              end
            end
            if lapTime < OribosLap_char.fastest then
              OribosLap_char.fastest = lapTime;
              if OribosLap.announceRecordLap then
                print("|cFF"..fontColor.."You set a new character lap record for Oribos! Time: |r"..dtToPrintableTime(lapTime));
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
InterfaceOptions_AddCategory(frame);

local function OriLap_SetupOptionsMenu()
  ----Announce Lap
  local checkbox = CreateFrame("CheckButton", "OribosLap_AnnounceLap", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.announceLap = not OribosLap.announceLap; self:SetChecked(OribosLap.announceLap); end);
  checkbox:SetChecked(OribosLap.announceLap);

  OribosLap_AnnounceLapText:SetText("Announce Lap");

  checkbox.tooltipText = "Announce Lap"
  checkbox.tooltipRequirement = "Prints a congratulatory message when a lap has been completed."

  checkbox:SetPoint("TOPLEFT", 16, -16)
  
  ----Announce Lap Time
  local checkbox = CreateFrame("CheckButton", "OribosLap_DisplayLapTime", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayLapTime = not OribosLap.displayLapTime; self:SetChecked(OribosLap.displayLapTime); end);
  checkbox:SetChecked(OribosLap.displayLapTime);

  OribosLap_DisplayLapTimeText:SetText("Display Lap Time");

  checkbox.tooltipText = "Display Lap Time"
  checkbox.tooltipRequirement = "Appends the lap time to the lap completion announcement."

  checkbox:SetPoint("TOPLEFT", 40, -40)
  
  ----Announce Record Lap
  local checkbox = CreateFrame("CheckButton", "OribosLap_AnnounceRecordLap", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.announceRecordLap = not OribosLap.announceRecordLap; self:SetChecked(OribosLap.announceRecordLap); end);
  checkbox:SetChecked(OribosLap.announceRecordLap);

  OribosLap_AnnounceRecordLapText:SetText("Announce Record Lap");

  checkbox.tooltipText = "Announce Record Lap"
  checkbox.tooltipRequirement = "Prints a congratulatory message when a new fastest lap has been completed."

  checkbox:SetPoint("TOPLEFT", 16, -64)
  
  ----Display Acct Stats
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayAcct", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayAcct = not OribosLap.displayAcct; self:SetChecked(OribosLap.displayAcct); end);
  checkbox:SetChecked(OribosLap.displayAcct);

  OribosLap_DisplayAcctText:SetText("Display Account Stats");

  checkbox.tooltipText = "Display Account Stats"
  checkbox.tooltipRequirement = "When enabled, will print the line for account-wide stats."

  checkbox:SetPoint("TOPLEFT", 16, -88)
  
  ----Display Char Stats
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayChar", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayChar = not OribosLap.displayChar; self:SetChecked(OribosLap.displayChar); end);
  checkbox:SetChecked(OribosLap.displayChar);

  OribosLap_DisplayCharText:SetText("Display Character Stats");

  checkbox.tooltipText = "Display Character Stats"
  checkbox.tooltipRequirement = "When enabled, will print the line for character stats."

  checkbox:SetPoint("TOPLEFT", 16, -112)
  
  ----Display As Percent
  checkbox = CreateFrame("CheckButton", "OribosLap_DisplayPercent", frame, "InterfaceOptionsCheckButtonTemplate");
  checkbox:SetScript("OnClick", function(self) OribosLap.displayPercent = not OribosLap.displayPercent; self:SetChecked(OribosLap.displayPercent); end);
  checkbox:SetChecked(OribosLap.displayPercent);

  OribosLap_DisplayPercentText:SetText("Display Stats as Percent");

  checkbox.tooltipText = "Display Relative Stats as Percent"
  checkbox.tooltipRequirement = "When enabled, will print relative stats as a percent of total laps."

  checkbox:SetPoint("TOPLEFT", 16, -136)
end

frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
frame:SetScript("OnEvent", function(pSelf, pEvent, pUnit)
  if pEvent == "ADDON_LOADED" and pUnit == "OribosLap" then
    --OribosLap = nil;
    --OribosLap_char = nil;
    
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
        str = "clockwise |cFFFFFFFF"..OribosLap.clock - OribosLap.counter.."|r times more often.";
      else
        str = "clockwise |cFFFFFFFF"..string.format("%.1f",OribosLap.clock / (OribosLap.clock + OribosLap.counter) * 100).."%|r of the time.";
      end
	  elseif OribosLap.clock < OribosLap.counter then
      if not OribosLap.displayPercent then
        str = "counter-clockwise |cFFFFFFFF"..OribosLap.counter - OribosLap.clock.."|r times more often.";
      else
        str = "counter-clockwise |cFFFFFFFF"..string.format("%.1f",OribosLap.counter / (OribosLap.clock + OribosLap.counter) * 100).."%|r of the time.";
      end
	  else
      str = "both directions equally!";
	  end
	  print("|cFF"..fontColor.."Across your account, you have lapped Oribos "..str.."|r");
	end

	if char_ then
	  if OribosLap_char.clock > OribosLap_char.counter then
      if not OribosLap.displayPercent then
        str = "clockwise |cFFFFFFFF"..OribosLap_char.clock - OribosLap_char.counter.."|r times more often.";
      else
        str = "clockwise |cFFFFFFFF"..string.format("%.1f",OribosLap_char.clock / (OribosLap_char.clock + OribosLap_char.counter) * 100).."%|r of the time.";
      end
	  elseif OribosLap_char.clock < OribosLap_char.counter then
      if not OribosLap.displayPercent then
        str = "counter-clockwise |cFFFFFFFF"..OribosLap_char.counter - OribosLap_char.clock.."|r times more often.";
      else
        str = "counter-clockwise |cFFFFFFFF"..string.format("%.1f",OribosLap_char.counter / (OribosLap_char.clock + OribosLap_char.counter) * 100).."%|r of the time.";
      end
	  else
      str = "both directions equally!";
	  end
	  print("|cFF"..fontColor.."On this character, you have lapped Oribos "..str.."|r");
	end
end

----
-- Print Function for displaying Ring of Fates/Transference tendency.
----
local function DisplayLevel(char_, acct_)
  local str;
  if acct_ then 
    if OribosLap.top > OribosLap.bottom then
      if not OribosLap.displayPercent then
        str = "Ring of Transference |cFFFFFFFF"..OribosLap.top - OribosLap.bottom.."|r times more often.";
      else
        str = "Ring of Transference |cFFFFFFFF"..string.format("%.1f",OribosLap.top / (OribosLap.top + OribosLap.bottom) * 100).."%|r of the time.";
      end
    elseif OribosLap.top < OribosLap.bottom then
      if not OribosLap.displayPercent then
        str = "Ring of Fates |cFFFFFFFF"..OribosLap.bottom - OribosLap.top.."|r times more often.";
      else
        str = "Ring of Fates |cFFFFFFFF"..string.format("%.1f",OribosLap.bottom / (OribosLap.top + OribosLap.bottom) * 100).."%|r of the time.";
      end
    else
      str = "both levels equally!";
    end
    print("|cFF"..fontColor.."Across your account, you have lapped "..str.."|r");
  end
  
  if char_ then
    if OribosLap_char.top > OribosLap_char.bottom then
      if not OribosLap.displayPercent then
        str = "the Ring of Transference |cFFFFFFFF"..OribosLap_char.top - OribosLap_char.bottom.."|r times more often.";
      else
        str = "the Ring of Transference |cFFFFFFFF"..string.format("%.1f",OribosLap_char.top / (OribosLap_char.top + OribosLap_char.bottom) * 100).."%|r of the time.";
      end
    elseif OribosLap_char.top < OribosLap_char.bottom then
      if not OribosLap.displayPercent then
        str = "the Ring of Fates |cFFFFFFFF"..OribosLap_char.bottom - OribosLap_char.top.."|r times more often.";
      else
        str = "the Ring of Transference |cFFFFFFFF"..string.format("%.1f",OribosLap_char.bottom / (OribosLap_char.top + OribosLap_char.bottom) * 100).."%|r of the time.";
      end
    else
      str = "both levels equally!";
    end
    print("|cFF"..fontColor.."On this character, you have lapped "..str.."|r");
  end
end

----
-- Print Function for displaying fatest lap times.
----
local function DisplayFastest(char_, acct_)
  if acct_ then 
    print("|cFF"..fontColor.."Across your account, your fastest Oribos lap is |cFFFFFFFF"..dtToPrintableTime(OribosLap.fastest) or "nil".."|r.|r");
  end
  
  if char_ then
    print("|cFF"..fontColor.."On this character, your fastest Oribos lap is |cFFFFFFFF"..dtToPrintableTime(OribosLap_char.fastest) or "nil".."|r.|r");
  end
end

----
-- Print Function for displaying total laps.
----
local function DisplayLaps(char_, acct_)
  if acct_ then 
    print("|cFF"..fontColor.."Across your account, you have lapped Oribos |cFFFFFFFF"..(OribosLap.clock + OribosLap.counter).."|r times.|r");
  end
  
  if char_ then
    print("|cFF"..fontColor.."On this character, you have lapped Oribos |cFFFFFFFF"..(OribosLap_char.clock + OribosLap_char.counter).."|r times.|r");
  end
end

frameDummy:SetScript("OnUpdate", OriLapUpdate);

SLASH_ORIBOSLAP1 = '/orilap';
function SlashCmdList.ORIBOSLAP(msg, editbox)
  if msg == "dir" then
    DisplayDir(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == "level" then
    DisplayLevel(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == "fastest" then
    DisplayFastest(OribosLap.displayChar, OribosLap.displayAcct);
  elseif msg == "alla" then
    DisplayLaps(false, true);
    DisplayFastest(false, true);
    DisplayLevel(false, true);
    DisplayDir(false, true);
  elseif msg == "allc" then
    DisplayLaps(true, false);
    DisplayFastest(true, false);
    DisplayLevel(true, false);
    DisplayDir(true, false);
  else
    DisplayLaps(OribosLap.displayChar, OribosLap.displayAcct);
  end
end