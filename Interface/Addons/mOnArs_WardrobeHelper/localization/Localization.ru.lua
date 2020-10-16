if GetLocale() ~= "ruRU" then return end

local o = mOnWardrobe
if o.strings == nil then o.strings = {} end
local s = o.strings

s["Refresh Instance"] = "Обновить"
s["Refresh Items"] = "Обновить вещи"
s["Current Instance"] = "Текущ. подземелье"
s["Click Refresh Info"] = "Нажмите кнопку %s для загрузки подземелий"
s["Missing Items"] = "Отсутствующие вещи"
s["Hide List Option"] = "Скрыть при открытии подземелья"
s["Refresh Confirmation"] = "Это действие заморозит игру на несколько секунд. Вы действительно хотите продолжить?"
s["Open Options"] = "Открыть настройки"
s["Debug"] = "Debug"
s["Debug Info"] = "Любые из этих настроек экспериментальные и могут мешать процессу игры. Вас предупредили."
s["Disable Progress"] = "Отключить прогресс"
s["Disable Progress Info"] = "Должен ускорить процесс обновления всех вещей."
