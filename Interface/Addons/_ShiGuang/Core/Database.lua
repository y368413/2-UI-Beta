local _, ns = ...
local M, R, U, I = unpack(ns)
I.Client = GetLocale()
I.ScreenWidth, I.ScreenHeight = GetPhysicalScreenSize()

-- Colors
I.MyClass = select(2, UnitClass("player"))
I.ClassColor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[I.MyClass]
I.MyColor = format("|cff%02x%02x%02x", I.ClassColor.r*255, I.ClassColor.g*255, I.ClassColor.b*255)
I.InfoColor = "|cff70c0f5"
I.GreyColor = "|cff808080"

-- Fonts
I.Font = {STANDARD_TEXT_FONT, 12, "OUTLINE"}
I.TipFont = {GameTooltipText:GetFont(), 14, "OUTLINE"}
I.LineString = I.GreyColor.."---------------"

-- Textures
local Media = "Interface\\Addons\\_ShiGuang\\Media\\"
I.bdTex = "Interface\\ChatFrame\\ChatFrameBackground"
I.glowTex = Media.."glowTex"
I.normTex = Media.."normTex"
I.bgTex = Media.."bgTex"
I.EnergyTex = Media.."Skullflower3"
I.arrowTex = Media.."Modules\\Raid\\textureArrowAbove"
I.mailTex = "Interface\\Minimap\\Tracking\\Mailbox"
I.gearTex = Media.."Modules\\Raid\\ArrowLarge"  --"Interface\\WorldMap\\Gear_64"
I.eyeTex = "Interface\\Minimap\\Raid_Icon"		-- blue: \\Dungeon_Icon
I.garrTex = "Interface\\HelpFrame\\HelpIcon-ReportLag"
I.copyTex = "Interface\\Buttons\\UI-GuildButton-PublicNote-Up"
I.binTex = "Interface\\HelpFrame\\ReportLagIcon-Loot"
I.questTex = "Interface\\BUTTONS\\AdventureGuideMicrobuttonAlert"
I.creditTex = "Interface\\HelpFrame\\HelpIcon-KnowledgeBase"
I.newItemFlash = "Interface\\Cooldown\\star4"
I.sparkTex = "Interface\\CastingBar\\UI-CastingBar-Spark"
I.TexCoord = {.08, .92, .08, .92}
I.textures = {
	normal		= Media.."ActionBars\\Gloss",
	flash		= Media.."ActionBars\\Flash",
	pushed		= Media.."ActionBars\\Pushed",
	checked		= Media.."ActionBars\\Checked",
	equipped	= Media.."ActionBars\\Gloss",
}
I.LeftButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:230:307|t "
I.RightButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:333:411|t "
I.ScrollButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:127:204|t "
I.AFKTex = "|T"..FRIENDS_TEXTURE_AFK..":14:14:0:0:16:16:1:15:1:15|t"
I.DNDTex = "|T"..FRIENDS_TEXTURE_DND..":14:14:0:0:16:16:1:15:1:15|t"

-- Flags
I.MyPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.PartyPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.RaidPetFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_RAID, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PET)
I.GuardianFlags = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_GUARDIAN)

-- RoleUpdater
local function CheckRole()
	local tree = GetSpecialization()
	if not tree then return end
	local _, _, _, _, role, stat = GetSpecializationInfo(tree)
	if role == "TANK" then
		I.Role = "Tank"
	elseif role == "HEALER" then
		I.Role = "Healer"
	elseif role == "DAMAGER" then
		if stat == 4 then	--1力量，2敏捷，4智力
			I.Role = "Caster"
		else
			I.Role = "Melee"
		end
	end
end
M:RegisterEvent("PLAYER_LOGIN", CheckRole)
M:RegisterEvent("PLAYER_TALENT_UPDATE", CheckRole)

-- Raidbuff Checklist
I.BuffList = {
	[1] = {		-- 合剂
		251836,	-- 敏捷
		251837,	-- 智力
		251838,	-- 耐力
		251839,	-- 力量
	},
	[2] = {     -- 进食充分
		104273, -- 250敏捷，BUFF名一致
	},
	[3] = {     -- 10%智力
		1459,
	},
	[4] = {     -- 10%耐力
		21562,
	},
	[5] = {     -- 10%攻强
		6673,
	},
	[6] = {     -- 符文
		224001,
		270058,
	},
}

-- Reminder Buffs Checklist
I.ReminderBuffs = {
	MAGE = {
		{	spells = {	-- 奥术魔宠
				[210126] = true,
			},
			depend = 205022,
			spec = 1,
			combat = true,
			instance = true,
			pvp = true,
		},
		{	spells = {	-- 奥术智慧
				[1459] = true,
			},
			depend = 1459,
			instance = true,
		},
	},
	PRIEST = {
		{	spells = {	-- 真言术耐
				[21562] = true,
			},
			depend = 21562,
			instance = true,
		},
	},
	WARRIOR = {
		{	spells = {	-- 战斗怒吼
				[6673] = true,
			},
			depend = 6673,
			instance = true,
		},
	},
	SHAMAN = {
		{	spells = {	-- 闪电之盾
				[192106] = true,
			},
			depend = 192106,
			combat = true,
			instance = true,
			pvp = true,
		},
	},
	ROGUE = {
		{	spells = {	-- 伤害类毒药
				[2823] = true,		-- 致命药膏
				[8679] = true,		-- 致伤药膏
			},
			spec = 1,
			combat = true,
			instance = true,
			pvp = true,
		},
		{	spells = {	-- 效果类毒药
				[3408] = true,		-- 减速药膏
			},
			spec = 1,
			pvp = true,
		},
	},
}
