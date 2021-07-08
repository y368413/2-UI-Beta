local _, L = ...;
local locale = "enUS"; --Update this for the correct locale.

local function fillLocale()
print("Filling locale: enUS");
L.Completed_Lap = "You completed a lap of Oribos!";
L.Time = "Time:";
L.Account_Lap_Record = "You set a new account lap record for Oribos!";
L.Character_Lap_Record = "You set a new character lap record for Oribos!";

--Options
L.Announce_Lap = "Announce Lap";
L.Announce_Lap_Tooltip = "Prints a congratulatory message when a lap has been completed.";
L.Display_Lap_Time = "Display Lap Time";
L.Display_Lap_Time_Tooltip = "Appends the lap time to the lap completion announcement.";
L.Announce_Record_Lap = "Announce Record Lap";
L.Announce_Record_Lap_Tooltip = "Prints a congratulatory message when a new fastest lap has been completed.";
L.Display_Account_Stats = "Display Account Stats";
L.Display_Account_Stats_Tooltip = "When enabled, will print the line for account-wide stats.";
L.Display_Character_Stats = "Display Character Stats";
L.Display_Character_Stats_Tooltip = "When enabled, will print the line for character stats.";
L.Display_As_Percent = "Display Relative Stats as Percent";
L.Display_As_Percent_Tooltip = "When enabled, will print relative stats as a percent of total laps.";

--direction
L.Lap_Dir_Clockwise = "you have lapped Oribos clockwise %s times more often.";
L.Lap_Dir_Counter = "you have lapped Oribos counter-clockwise %s times more often.";
L.Lap_Dir_Clockwise_Percent = "you have lapped Oribos clockwise %s of the time.";
L.Lap_Dir_Counter_Percent = "you have lapped Oribos counter-clockwise %s of the time.";
L.Lap_Dir_Equal = "you have lapped Oribos both directions equally!";

--level, i.e. Ring of Fates/Ring of Transference
L.Lap_Level = "you have lapped the %s %s times more often.";
L.Lap_Level_Percent = "you have lapped the %s %s of the time.";
L.Lap_Level_Equal = "you have lapped both levels equally!";

--fastest lap
L.Fastest = "your fastest Oribos lap is %s.";

--total
L.Total_Laps = "you have lapped Oribos %s times.";

L.Account = "Across your account, ";
L.Character = "On this character, ";

--slash command options
L.dir = "dir";
L.level = "level";
L.fastest = "fastest";
L.alla = "alla";
L.allc = "allc";
end;

L[locale] = fillLocale;