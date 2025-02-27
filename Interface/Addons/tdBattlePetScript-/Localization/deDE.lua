
local L = LibStub('AceLocale-3.0'):NewLocale('tdBattlePetScript', 'deDE')
if not L then return end

--[=[@debug@
--[[
--@end-debug@]=]
L["ADDON_NAME"] = "Battle Pet Script"
L["Auto"] = true
L["Beauty script"] = "Skript formatieren"
L["Create script"] = "Skript erstellen"
L["Debugging script"] = "Skript debuggen"
L["DIALOG_COPY_URL_HELP"] = "Drücke STRG+C, um es zu kopieren und im Browser zu öffnen"
L["Don't ask me"] = "Ignorieren"
L["Download"] = "Herunterladen"
L["Edit script"] = "Skript bearbeiten"
L["Export"] = "Exportieren"
L["Font face"] = "Schriftart"
L["Font size"] = "Schriftgröße"
L["Found error"] = "Fehler gefunden"
L["Import"] = "Importieren"
L["IMPORT_CHOOSE_KEY"] = "Wert auswählen..."
L["IMPORT_CHOOSE_PLUGIN"] = "Skript-Selektor auswählen..."
L["IMPORT_REINPUT_TEXT"] = "Erneut bearbeiten"
L["IMPORT_SCRIPT_EXISTS"] = "Skript bereits vorhanden"
L["IMPORT_SCRIPT_WARNING"] = "Es wird empfohlen, den Import mit einem gültigen Share-String anstelle eines manuell eingegebenen Skripts durchzuführen. Dennoch fortfahren?"
L["IMPORT_SCRIPT_WELCOME"] = "Füge Share-String oder Skript in das Eingabefeld ein."
L["IMPORT_SHARED_STRING_WARNING"] = "Die Daten des Share-Strings sind zwar unvollständig, aber können trotzdem importiert werden."
L["Installed"] = "Installiert"
L["New script"] = "Neues Skript"
L["No script"] = "Kein Skript"
L["Not Installed"] = "Nicht installiert"
L["OPTION_GENERAL_NOTES"] = "Hier findest du einige allgemeine Einstellungen."
L["OPTION_SCRIPTEDITOR_NOTES"] = "Hier findest du Einstellungen für den Skript-Editor."
L["OPTION_SCRIPTSELECTOR_NOTES"] = "Hier kannst du die Verfügbarkeit und Priorität der Skript-Selektoren einstellen."
L["OPTION_SETTINGS_AUTO_SELECT_SCRIPT_BY_ORDER"] = "Skripte automatisch auf Basis der Skript-Selektor-Prioritäten auswählen"
L["OPTION_SETTINGS_AUTO_SELECT_SCRIPT_ONLY_ONE"] = "Automatisch nur ein Skript auswählen"
L["OPTION_SETTINGS_AUTOBUTTON_HOTKEY"] = "Hotkey für die Auto-Schaltfläche"
L["OPTION_SETTINGS_HIDE_MINIMAP"] = "Minimap-Symbol verstecken"
L["OPTION_SETTINGS_HIDE_MINIMAP_TOOLTIP"] = "Um diese Einstellung zu ändern, muss die Benutzeroberfläche neu geladen werden. Willst du fortfahren?"
L["OPTION_SETTINGS_HIDE_SELECTOR_NO_SCRIPT"] = "Skript-Selektor nicht anzeigen, wenn keine Skripte verfügbar sind"
L["OPTION_SETTINGS_LOCK_SCRIPT_SELECTOR"] = "Skript-Selektor sperren (kann nicht verschoben werden)"
L["OPTION_SETTINGS_NO_WAIT_DELETE_SCRIPT"] = "Nicht auf das Löschen eines Skripts warten"
L["OPTION_SETTINGS_RESET_FRAMES"] = "Größe und Position von allen Fenstern zurücksetzen"
L["OPTION_SETTINGS_TEST_BREAK"] = "Debug: Action test break script"
L["Options"] = "Optionen"
L["PLUGINALLINONE_NOTES"] = "Dieses Skript kann in allen Haustierkämpfen verwendet werden."
L["PLUGINALLINONE_TITLE"] = "Alle in einem"
L["PLUGINBASE_NOTES"] = "Dieser Skript-Selektor gilt für Verbündeten und Feind."
L["PLUGINBASE_TEAM_ALLY"] = "Verbündeter"
L["PLUGINBASE_TEAM_ENEMY"] = "Feind"
L["PLUGINBASE_TITLE"] = "Basis"
L["PLUGINBASE_TOOLTIP_CREATE_SCRIPT"] = "Basis: Ein Skript für das aktuelle Match erstellen"
L["PLUGINFIRSTENEMY_NOTES"] = "Dieser Skript-Selektor gilt für den ersten Gegner des Kampfes."
L["PLUGINFIRSTENEMY_NOTIFY"] = "Es wurde festgestellt, dass du zuvor eine modifizierte Version von tdBattlePetScript verwendet hast und einige Skripte des modifizierten Basis-Selektors in den Erster Gegner-Selektor migriert hast."
L["PLUGINFIRSTENEMY_TITLE"] = "Erster Gegner"
L["Run"] = "Ausführen"
L["Save success"] = "Erfolgreich gespeichert"
L["Script"] = "Skript"
L["Script author"] = "Skript-Ersteller"
L["Script editor"] = "Skript-Editor"
L["Script manager"] = "Skript-Manager"
L["Script name"] = "Skriptname"
L["Script notes"] = "Anmerkungen zum Skript"
L["Script selector"] = "Skript-Selektor"
L["SCRIPT_EDITOR_DELETE_SCRIPT"] = "Bist du sicher, dass du das Skript |cffffd000[%s - %s]|r |cffff0000löschen|r willst?"
L["SCRIPT_EDITOR_LABEL_TOGGLE_EXTRA"] = "Plugin-Daten-Editor öffnen/schließen"
L["SCRIPT_IMPORT_LABEL_COVER"] = "Das Skript existiert bereits mit diesen Einstellungen. Wenn du mit der Importierung fortfährst, wird das aktuelle Skript überschrieben."
L["SCRIPT_IMPORT_LABEL_EXTRA"] = "Mit dem Importieren der Plugin-Daten fortfahren"
L["SCRIPT_IMPORT_LABEL_GOON"] = "Überschreiben und Importieren fortsetzen"
L["SCRIPT_SELECTOR_LOST_TOOLTIP"] = "Skript-Selektor-Entwickler definiert nicht die OnTooltipFormatting-Funktion"
L["SCRIPT_SELECTOR_NOT_MATCH"] = "Kein Skript-Selektor stimmt mit dem aktuellen Match überein"
L["SCRIPT_SELECTOR_NOTINSTALLED_HELP"] = "Linksklick zum Anschauen, Rechtsklick zum Schließen"
L["SCRIPT_SELECTOR_NOTINSTALLED_TEXT"] = "Kein geeigneter Skript-Selektor installiert!"
L["Select script"] = "Skript auswählen"
L["TOGGLE_SCRIPT_MANAGER"] = "Skript-Manager öffnen/schließen"
L["TOGGLE_SCRIPT_SELECTOR"] = "Skript-Selektor öffnen/schließen"
L["TOOLTIP_CREATE_OR_DEBUG_SCRIPT"] = "Ein Skript erstellen oder debuggen"
L["Update to version: "] = "Aktualisiert auf Version: "

--[=[@debug@
--]]
--@end-debug@]=]
