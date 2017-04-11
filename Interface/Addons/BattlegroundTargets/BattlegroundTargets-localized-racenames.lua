-- -------------------------------------------------------------------------- --
-- BattlegroundTargets - bg race names                                        --
-- -------------------------------------------------------------------------- --

local RNA, _, prg = {}, ...
prg.RNA = RNA

local HORDE = 0
local ALLIANCE = 1
local locale = GetLocale()

if locale == "zhCN" then -- 12 | Patch 4.3.2.15201 (PTR)

	RNA["人类"] = ALLIANCE
	RNA["矮人"] = ALLIANCE
	RNA["暗夜精灵"] = ALLIANCE
	RNA["侏儒"] = ALLIANCE
	RNA["德莱尼"] = ALLIANCE
	RNA["狼人"] = ALLIANCE
	RNA["亡灵"] = HORDE
	RNA["兽人"] = HORDE
	RNA["牛头人"] = HORDE
	RNA["血精灵"] = HORDE
	RNA["地精"] = HORDE
	RNA["巨魔"] = HORDE

elseif locale == "zhTW" then -- 12 | Patch 4.3.2.15201 (PTR)

	RNA["德萊尼"] = ALLIANCE
	RNA["人類"] = ALLIANCE
	RNA["矮人"] = ALLIANCE
	RNA["地精"] = ALLIANCE
	RNA["夜精靈"] = ALLIANCE
	RNA["狼人"] = ALLIANCE
	RNA["哥布林"] = HORDE
	RNA["血精靈"] = HORDE
	RNA["不死族"] = HORDE
	RNA["獸人"] = HORDE
	RNA["食人妖"] = HORDE
	RNA["牛頭人"] = HORDE

else--if locale == "enUS" then -- 12 | Patch 4.3.0.15050 (LIVE)

	RNA["Night Elf"] = ALLIANCE
	RNA["Draenei"] = ALLIANCE
	RNA["Worgen"] = ALLIANCE
	RNA["Human"] = ALLIANCE
	RNA["Gnome"] = ALLIANCE
	RNA["Dwarf"] = ALLIANCE
	RNA["Blood Elf"] = HORDE
	RNA["Orc"] = HORDE
	RNA["Troll"] = HORDE
	RNA["Tauren"] = HORDE
	RNA["Undead"] = HORDE
	RNA["Goblin"] = HORDE

end