

if GetLocale() ~= "zhCN" then return end
local L

--------------------------
-- Jin'rokh the Breaker --
--------------------------
L= DBM:GetModLocalization(827)

L:SetWarningLocalization({
	specWarnWaterMove	= "%s 即将到来 - 离开导电水池!"
})

L:SetOptionLocalization({
	specWarnWaterMove	= "Show special warning if you standing in $spell:138470<br/>(Warns at $spell:137313 pre-cast or $spell:138732 debuff fades shortly)",
	RangeFrame			= DBM_CORE_AUTO_RANGE_OPTION_TEXT_SHORT:format("8/4")
})

--------------
-- Horridon --
--------------
L= DBM:GetModLocalization(819)

L:SetWarningLocalization({
	warnAdds	= "%s",
	warnOrbofControl		= "控兽宝珠掉落",
	specWarnOrbofControl	= "控兽宝珠掉落!"
})

L:SetTimerLocalization({
	timerDoor		= "下一个部族大门",
	timerAdds		= "下一次%s"
})

L:SetOptionLocalization({
	warnAdds		= "警报：新的敌人加入战斗",
	warnOrbofControl		= "提示$journal:7092掉落",
	specWarnOrbofControl	= "为$journal:7092掉落显示特別警告",
	timerDoor		= "计时条：下一个部族大门阶段",
	timerAdds		= "计时条：下一次小怪",
SetIconOnAdds			= "为台上跳下的小怪设置团队标记",
	RangeFrame				= DBM_CORE_AUTO_RANGE_OPTION_TEXT:format(5, 136480),
	SetIconOnCharge			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(136769)
})

L:SetMiscLocalization({
	newForces		= "门蜂拥而出",--Farraki forces pour from the Farraki Tribal Door!
	chargeTarget	= "用力拍打尾巴!"--Horridon sets his eyes on Eraeshio and stamps his tail!
})

---------------------------
-- The Council of Elders --
---------------------------
L= DBM:GetModLocalization(816)

L:SetWarningLocalization({
	specWarnPossessed		= "%s 在 %s - 切换目标"
})

L:SetOptionLocalization({
	warnPossessed		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.target:format(136442),
	specWarnPossessed	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format(136442),
	PHealthFrame		= "Show remaining health frame for $spell:136442 fades<br/>(Requires boss health frame enabled)",
	RangeFrame			= DBM_CORE_AUTO_RANGE_OPTION_TEXT_SHORT:format(5),
	AnnounceCooldowns	= "Count out (up to 3) which $spell:137166 cast it is for raid cooldowns",
	SetIconOnBitingCold	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(136992),
	SetIconOnFrostBite	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(136922)
})

------------
-- Tortos --
------------
L= DBM:GetModLocalization(825)

L:SetWarningLocalization({
	warnKickShell			= "%s由>%s<使用（%d次剩余）",
	specWarnCrystalShell	= "快去获得%s"
})

L:SetOptionLocalization({
warnKickShell			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(134031),
	specWarnCrystalShell	= "特殊警报：当没有$spell:137633效果时",
	InfoFrame				= "信息框：没有$spell:137633效果的团员",
	ClearIconOnTurtles		= "Clear icons on $journal:7129 when affected by $spell:133971",
	AnnounceCooldowns		= "Count out which $spell:134920 cast it is for raid cooldowns"
})

L:SetMiscLocalization({
	WrongDebuff		= "没有%s"
})

-------------
-- Megaera --
-------------
L= DBM:GetModLocalization(821)

L:SetTimerLocalization({
	timerBreathsCD			= "下一次吐息"
})

L:SetOptionLocalization({
	timerBreaths			= "Show timer for next breath",
	SetIconOnCinders		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(139822),
	SetIconOnTorrentofIce	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(139889),
	AnnounceCooldowns		= "Count out which Rampage cast it is for raid cooldowns",
	Never					= "绝不",
	Every					= "每次 (连续)",
	EveryTwo				= "数到 2",
	EveryThree				= "数到 3",
	EveryTwoExcludeDiff		= "数到 2 (除了秘法散射)",
	EveryThreeExcludeDiff	= "数到 3 (除了秘法散射)"
})

L:SetMiscLocalization({
	rampageEnds	= "Megaera's 怒气平息了."
})

------------
-- Ji-Kun --
------------
L= DBM:GetModLocalization(828)

L:SetWarningLocalization({
	warnFlock			= "%s %s %s",
	specWarnFlock		= "%s %s %s",
	specWarnBigBird		= "巢穴守卫: %s",
	specWarnBigBirdSoon	= "下一波巢穴守卫: %s"
})

L:SetTimerLocalization({
	timerFlockCD	= "Nest (%d): %s"
})

L:SetOptionLocalization({
	warnFlock			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.count:format("ej7348"),
	specWarnFlock		= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format("ej7348"),
	specWarnBigBird		= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format("ej7827"),
	specWarnBigBirdSoon	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.soon:format("ej7827"),
	timerFlockCD		= DBM_CORE_AUTO_TIMER_OPTIONS.nextcount:format("ej7348"),
	RangeFrame			= DBM_CORE_AUTO_RANGE_OPTION_TEXT:format(10, 138923),
	ShowNestArrows		= "Show DBM arrow for nest activations",
	Never				= "从不",
	Northeast			= "蓝 - 上层 & 下层 东北",
	Southeast			= "绿 - 上层 & 下层 东南",
	Southwest			= "紫/红 - 下层 西南 & 上层 西南(25) 或 上层 中间(10)",
	West				= "红 - 下层 西 & 上层 中间 (只有25)",
	Northwest			= "黄 - 下层 & 上层 西北 (只有25)",
	Guardians			= "巢穴守卫"
})

L:SetMiscLocalization({
	eggsHatch		= "某个鸟巢中的蛋开始孵化了",
	Upper			= "上层",
	Lower			= "下层",
	UpperAndLower	= "上下都有",
	TrippleD		= "三个巢 (2x下层)",
	TrippleU		= "三个巢 (2x上层)",
	NorthEast		= "|cff0000ff东北|r",--Blue
	SouthEast		= "|cFF088A08东南|r",--Green
	SouthWest		= "|cFF9932CD西南|r",--Purple
	West			= "|cffff0000西|r",--Red
	NorthWest		= "|cffffff00西北|r",--Yellow
	Middle10		= "|cFF9932CD中|r",--Purple (Middle is upper southwest on 10 man/LFR)
	Middle25		= "|cffff0000中|r",--Red (Middle is upper west on 25 man)
	ArrowUpper		= " |TInterface\\Icons\\misc_arrowlup:12:12|t ",
	ArrowLower		= " |TInterface\\Icons\\misc_arrowdown:12:12|t "
})

--------------------------
-- Durumu the Forgotten --
--------------------------
L= DBM:GetModLocalization(818)

L:SetWarningLocalization({
	warnBeamNormal				= "Beam - |cffff0000红|r : >%s<, |cff0000ff蓝|r : >%s<",
	warnBeamHeroic				= "Beam - |cffff0000红|r : >%s<, |cff0000ff蓝|r : >%s<, |cffffff00黄|r : >%s<",
	warnAddsLeft				= "Fogs remaining: %d",
	specWarnBlueBeam			= "你中了蓝光摄像 - 别动",
	specWarnFogRevealed			= "照出 %s !",
	specWarnDisintegrationBeam	= "%s (%s)"
})

L:SetOptionLocalization({
	warnBeam					= "提示射线目标",
	warnAddsLeft				= "提示剩余的雾行兽数量",
	specWarnFogRevealed			= "为照出的雾行兽显示特别警告",
	specWarnBlueBeam			= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.spell:format(139202),
	specWarnDisintegrationBeam	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.spell:format("ej6882"),
	ArrowOnBeam					= "Show DBM Arrow during $journal:6882 to indicate which direction to move",
	SetIconRays					= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format("ej6891"),
	SetIconLifeDrain			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(133795),
	SetIconOnParasite			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(133597),
	InfoFrame					= "Show info frame for $spell:133795 stacks",
	SetParticle					= "Automatically set particle density to low on pull<br/>(Restores previous setting on combat end)"
})

L:SetMiscLocalization({
	LifeYell		= "%s 中了生命吸取 (%d层)"
})

----------------
-- Primordius --
----------------
L= DBM:GetModLocalization(820)

L:SetWarningLocalization({
	warnDebuffCount				= "突变 : %d/5 有益 & %d 有害"
})

L:SetOptionLocalization({
	warnDebuffCount				= "Show debuff count warnings when you absorb pools",
	RangeFrame					= DBM_CORE_AUTO_RANGE_OPTION_TEXT_SHORT:format("5/3"),
	SetIconOnBigOoze			= "Set icon on $journal:6969"
})

-----------------
-- Dark Animus --
-----------------
L= DBM:GetModLocalization(824)

L:SetWarningLocalization({
	warnMatterSwapped	= "%s：>%s<、>%s<交换"
})

L:SetOptionLocalization({
	warnMatterSwapped	= "警报：$spell:138618交换的目标",
	SetIconOnFont           = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(138707)
})

L:SetMiscLocalization({
	Pull		= "血球爆炸!"
})

--------------
-- Iron Qon --
--------------
L= DBM:GetModLocalization(817)

L:SetWarningLocalization({
	warnDeadZone	= "%s：%s、%s被保护"
})

L:SetOptionLocalization({
	warnDeadZone			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(137229),
	SetIconOnLightningStorm	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(136192),
	RangeFrame				= "Show dynamic range frame (10)<br/>(距离监视（动态，当存在多名团员过近时显示）)",
	InfoFrame				= "Show info frame for players with $spell:136193"
})

-------------------
-- Twin Consorts --
-------------------
L= DBM:GetModLocalization(829)

L:SetWarningLocalization({
	warnNight		= "Night phase",
	warnDay			= "Day phase",
	warnDusk		= "Dusk phase"
})

L:SetTimerLocalization({
	timerDayCD		= "Next day phase",
	timerDuskCD		= "Next dusk phase"
})

L:SetOptionLocalization({
	warnNight		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format("ej7641"),
	warnDay			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format("ej7645"),
	warnDusk		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format("ej7633"),
	timerDayCD		= DBM_CORE_AUTO_TIMER_OPTIONS.next:format("ej7645"),
	timerDuskCD		= DBM_CORE_AUTO_TIMER_OPTIONS.next:format("ej7633"),
	RangeFrame		= DBM_CORE_AUTO_RANGE_OPTION_TEXT_SHORT:format(5)
})

L:SetMiscLocalization({
	DuskPhase		= "Lu'lin! Lend me your strength!"--Not in use, but a backup just in case, so translate in case it's switched to on moments notice on live or next PTR test
})

--------------
-- Lei Shen --
--------------
L= DBM:GetModLocalization(832)

L:SetWarningLocalization({
	specWarnIntermissionSoon	= "Intermission soon",
	warnDiffusionChainSpread	= "%s spread on >%s<"
})

L:SetTimerLocalization({
	timerConduitCD				= "First Conduit CD"
})

L:SetOptionLocalization({
	specWarnIntermissionSoon	= "Show pre-special warning before Intermission",
	warnDiffusionChainSpread	= "Announce $spell:135991 spread targets",
	timerConduitCD				= "Show timer for first conduit ability cooldown",
	RangeFrame					= DBM_CORE_AUTO_RANGE_OPTION_TEXT_SHORT:format("8/6"),--For two different spells
	StaticShockArrow			= "Show DBM Arrow when someone is affected by $spell:135695",
	OverchargeArrow				= "Show DBM Arrow when someone is affected by $spell:136295",
	SetIconOnOvercharge			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(136295),
	SetIconOnStaticShock		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(135695)
})

L:SetMiscLocalization({
	StaticYell		= "%s中了静电震击(%d)"
})

------------
-- Ra-den --
------------
L= DBM:GetModLocalization(831)

L:SetWarningLocalization({
	specWarnUnstablVitaJump		= "Unstable Vita jumped to you!"
})

L:SetOptionLocalization({
	specWarnUnstablVitaJump		= "Show special warning when $spell:138297 jumps to you",
	SetIconsOnVita				= "Set icons on $spell:138297 debuffed player and furthest player from them"
})

L:SetMiscLocalization({
	Defeat						= "慢着!"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("ToTTrash")

L:SetGeneralLocalization({
	name =	"雷电王座小怪"
})

L:SetOptionLocalization({
	RangeFrame		= "距离监视（10码）"--For 3 different spells
})

