if GetLocale() ~= "esES" then return end

local o = mOnWardrobe
if o.strings == nil then o.strings = {} end
local s = o.strings

s["Refresh Instance"] = "Recargar Instancia"
s["Refresh Items"] = "Recargar Artículos"
s["Current Instance"] = "Instancia Actual"
s["Click Refresh Info"] = "Clic en %s para cargar todos los objetos de las Instancias"
s["Missing Items"] = "Objetos perdidos"
s["Hide List Option"] = "Ocultar la lista al abrir la Instancia"
s["Refresh Confirmation"] = "Esta acción congelará el juego durante varios segundos. ¿Quieres continuar?"
s["Open Options"] = "Abrir Opciones"
s["Debug"] = "Depurar"
s["Debug Info"] = "Estas opciones son experimentales y pueden dañar el juego. Has sido advertido."
s["Disable Progress"] = "Desactivar el progreso"
s["Disable Progress Info"] = "Debería acelerar el proceso de carga de artículos."
s["Refreshing"] = "Cargando"
s["Hide Minimap"] = "Ocultar botón del Minimapa"

s["Disable Confirmation"] = "Desactivar la confirmación de actualización"
s["You're beautiful"] = "¡Estas muy guapo hoy!"
s["Happy Sunday"] = "¡Feliz Domingo!"
s["Other Sources"] = "Otras fuentes"
s["Sources"] = "Fuentes"
s["Completionist Mode"] = "Modo Completar Todo"
s["Completionist Mode Info"] = "Los artículos no serán catalogados salvo que se hayan recogido específicamente."
