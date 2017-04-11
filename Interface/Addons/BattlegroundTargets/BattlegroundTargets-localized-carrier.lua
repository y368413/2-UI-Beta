-- -------------------------------------------------------------------------- --
-- BattlegroundTargets - carrier strings                                      --
-- -------------------------------------------------------------------------- --

local FLG, _, prg = {}, ...
prg.FLG = FLG

local locale = GetLocale()

if locale == "zhCN" then

	-- Warsong Gulch:  --> zhCN: tested with Patch 6.0.3.19342 (LIVE)
	-- Twin Peaks:     --> zhCN: tested with Patch 6.0.3.19342 (LIVE)
	-- Deepwind Gorge: --> zhCN: tested with Patch 6.0.3.19342 (LIVE)
	FLG["WG_TP_DG_PATTERN_PICKED1"] = "旗帜被([^%s]+)拔起了！"
	FLG["WG_TP_DG_PATTERN_PICKED2"] = "旗帜被([^%s]+)拔起了！" -- ruRU special
	FLG["WG_TP_DG_MATCH_DROPPED"] = "丢掉了"
	FLG["WG_TP_DG_MATCH_CAPTURED"] = "夺取"

	-- Eye of the Storm: --> zhCN: tested with Patch 6.0.3.19342 (LIVE)
	FLG["EOTS_PATTERN_PICKED"] = "(.+)夺走了旗帜！"
	FLG["EOTS_STRING_DROPPED"] = "旗帜被扔掉了！"
	FLG["EOTS_PATTERN_CAPTURED"] = "(.+)夺得了旗帜！"

	-- Temple of Kotmogu: --> zhCN: tested with Patch 6.0.3.19342 (LIVE)
	FLG["TOK_PATTERN_TAKEN"] = "(.+)取走了(.+)的球！"
	FLG["TOK_PATTERN_RETURNED"] = "(.+)宝珠被放回了！"

elseif locale == "zhTW" then

	-- Warsong Gulch:  --> zhTW: tested with Patch 4.3.2.15211 (PTR)
	-- Twin Peaks:     --> zhTW: tested with Patch 4.3.2.15211 (PTR)
	-- Deepwind Gorge: --> zhTW: TODO needs check
	FLG["WG_TP_DG_PATTERN_PICKED1"] = "被(.+)拔掉了!"
	FLG["WG_TP_DG_PATTERN_PICKED2"] = "被(.+)拔掉了!" -- ruRU special
	FLG["WG_TP_DG_MATCH_DROPPED"] = "丟掉了"
	FLG["WG_TP_DG_MATCH_CAPTURED"] = "佔據了"

	-- Eye of the Storm: --> zhTW: TODO
	FLG["EOTS_PATTERN_PICKED"] =  "TODO" -- "(.+)已經奪走了旗幟!"
	FLG["EOTS_STRING_DROPPED"] =  "TODO" -- "旗幟已經掉落!"
	FLG["EOTS_PATTERN_CAPTURED"] = "TODO"

	-- Temple of Kotmogu: --> zhTW: tested with Patch 5.4.0.17093 (PTR)
	FLG["TOK_PATTERN_TAKEN"] = "(.+)奪走了(.+)異能球!"
	FLG["TOK_PATTERN_RETURNED"] = "(.+)異能球已回到初始位置!"

else--if locale == "enUS" then

	-- Warsong Gulch:  --> enUS: tested with Patch 6.0.3.19342 (LIVE)
	-- Twin Peaks:     --> enUS: tested with Patch 6.0.3.19342 (LIVE)
	-- Deepwind Gorge: --> enUS: tested with Patch 6.0.3.19342 (LIVE)
	FLG["WG_TP_DG_PATTERN_PICKED1"] = "was picked up by (.+)!"
	FLG["WG_TP_DG_PATTERN_PICKED2"] = "was picked up by (.+)!" -- ruRU special
	FLG["WG_TP_DG_MATCH_DROPPED"] = "was dropped"
	FLG["WG_TP_DG_MATCH_CAPTURED"] = "captured the"

	-- Eye of the Storm: --> enUS: tested with Patch 6.0.3.19342 (LIVE)
	FLG["EOTS_PATTERN_PICKED"] = "(.+) has taken the flag!"
	FLG["EOTS_STRING_DROPPED"] = "The flag has been dropped!"
	FLG["EOTS_PATTERN_CAPTURED"] = "(.+) has captured the flag!"

	-- Temple of Kotmogu: --> enUS: tested with Patch 6.0.3.19342 (LIVE)
	FLG["TOK_PATTERN_TAKEN"] = "(.+) has taken the (.+) orb!"
	FLG["TOK_PATTERN_RETURNED"] = "The (.+) orb has been returned!"

end