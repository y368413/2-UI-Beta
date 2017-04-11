DuelCountdown = {_G = _G}
setfenv(1, DuelCountdown)

local DuelCountdown = _G.DuelCountdown
local string, math, table = _G.string, _G.math, _G.table
local pairs, ipairs = _G.pairs, _G.ipairs
local assert, select, print = _G.assert, _G.select, _G.print

local MAGIC_NUMBER = 3

local handlerFrame = _G.CreateFrame("Frame")

-- Value of GetTime() at the start of the countdown timer animation.
local startTime

function startTimer()
  assert(_G.TimerTracker)
  _G.TimerTracker_OnEvent(_G.TimerTracker, "PLAYER_ENTERING_WORLD")
  _G.GetPlayerFactionGroup = function()
    return "Neutral"
  end
  _G.TimerTracker_OnEvent(_G.TimerTracker, "START_TIMER", _G.TIMER_TYPE_PVP, 3, 3)
  _G.GetPlayerFactionGroup = DuelCountdown.GetPlayerFactionGroup
  startTime = _G.GetTime()
end

function stopTimer()
  assert(_G.TimerTracker)
  _G.TimerTracker_OnEvent(_G.TimerTracker, "PLAYER_ENTERING_WORLD")
end

function handlerFrame:ADDON_LOADED(name)
  self:UnregisterEvent("ADDON_LOADED")

  assert(_G.GetPlayerFactionGroup)
  GetPlayerFactionGroup = _G.GetPlayerFactionGroup

  handlerFrame:RegisterEvent("DUEL_REQUESTED")
  handlerFrame:RegisterEvent("DUEL_INBOUNDS")
  --handlerFrame:RegisterEvent("DUEL_OUTOFBOUNDS")
  handlerFrame:RegisterEvent("DUEL_FINISHED")
  handlerFrame:RegisterEvent("CHAT_MSG_SYSTEM")

  self.ADDON_LOADED = nil
end

function handlerFrame:DUEL_FINISHED()
  --print("DuelCountdown: handlerFrame:DUEL_FINISHED called")
  if startTime and _G.GetTime() - startTime < MAGIC_NUMBER then
    DuelCountdown.stopTimer()
    startTime = nil
  end
end

function handlerFrame:CHAT_MSG_SYSTEM(message, _, _, _, _, _, _, channelNumber)
  if string.find(message, _G.DUEL_COUNTDOWN) then
    if string.find(message, '3') then
      DuelCountdown.startTimer()
    end
  end
end

handlerFrame:SetScript("OnEvent", function(self, event, ...)
  return self[event] and self[event](self, ...)
end)

handlerFrame:RegisterEvent("ADDON_LOADED")