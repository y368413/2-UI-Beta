local addonName, addon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "deDE")
if not L then return end

--L["dialog.introduction"] = "Funktionseinführung"
L["dialog.description"] = "Wenn du deinen Pakt oder die Spezialisierung wechselst, werden dein Seelenband und dein Ausrüstungsset automatisch entsprechend deiner untenstehenden Einstellungen angepasst." 

L["dialog.enable"] = "Aktivieren"
L["dialog.default"] = "Beibehalten"

L["dialog.title.preset"] = "Voreinstellung"
L["dialog.title.soulbind"] = "Seelenband"
L["dialog.title.equipmentset"] = "Ausrüstungsset" 

L["dialog.err.invaildconfig"] = "Ungültige Konfiguration." 

L["dialog.err.invaildcovenant"] = "Beim Wechsel des Seelenbands ist ein Fehler aufgetreten, die Pakt-Information kann nicht abgerufen werden."
L["dialog.err.invaildsoulbind"] = "Beim Wechsel des Seelenbands ist ein Fehler aufgetreten, die Seelenband-Information kann nicht abgerufen werden."
L["dialog.err.changesoulbindfailed"] = "Beim Wechsel des Seelenbands ist ein Fehler aufgetreten, Wechsel fehlgeschlagen!"
L["dialog.err.activatesoulbind"] = "Im aktuellen Zustand kann das Seelenband nicht gewechselt werden."
L["dialog.activate.soulbind"] = "Derzeit aktives Seelenband: " 

L["dialog.err.useequipmentset"] = "Beim Wechsel des Ausrüstungssets ist ein Fehler aufgetreten, bitte überprüfe die Systemmeldung."
L["dialog.err.invaildequipments"] = "Beim Wechsel des Ausrüstungssets ist ein Fehler aufgetreten, die Ausrüstungsset-Information kann nicht abgerufen werden."
L["dialog.err.changeequipmentsetfailed"] = "Beim Wechsel des Ausrüstungssets ist ein Fehler aufgetreten, Wechsel fehlgeschlagen!"
L["dialog.err.cantuseequipments"] = "Im aktuellen Zustand kann das Ausrüstungsset nicht gewechselt werden."
L["dialog.activate.equipment"] = "Derzeit aktive Ausrüstung: " 

L["dialog.tip.changeequipmentset"] = addonName .. "Es wurde festgestellt, dass du ein Ausrüstungsset gelöscht hast. Falls dies deine Standardkonfiguration ist, geh bitte zeitnah in die Benutzereinstellungen und aktualisiere die Konfiguration, um Fehlern vorzubeugen!" 

L["dialog.title.setting"] = "Einstellungen" 

L["dialog.title.font"] = "Texteinstellungen"
L["dialog.font.name"] = "Textart"
L["dialog.font.outline"] = "Texteffekt"
L["dialog.font.size"] = "Textgröße"
L["dialog.font.shadow"] = "Schatteneffekt" 

L["dialog.title.display"] = "Anzeigeeinstellungen"
L["dialog.display.time"] = "Anzeigedauer"
L["dialog.display.delay"] = "Verzögerungszeit" 

L["dialog.title.test"] = "Testtext anzeigen"
L["dialog.test.name"] = "Testname" 

L["dialog.postion.xoffset"] = "X-Achse"
L["dialog.postion.yoffset"] = "Y-Achse"
L["dialog.title.position"] = "Position"