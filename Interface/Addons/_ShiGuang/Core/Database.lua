local _, _, U, I = unpack(select(2, ...))
I.Version = GetAddOnMetadata("_ShiGuang", "Version")
I.Client = GetLocale()

-- Colors
I.MyClass = select(2, UnitClass("player"))
I.ClassColor = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[I.MyClass]
I.MyColor = format("|cff%02x%02x%02x", I.ClassColor.r*255, I.ClassColor.g*255, I.ClassColor.b*255)
I.InfoColor = "|cff70C0F5"
I.GreyColor = "|cffB5B5B5"

-- Fonts
I.Font = {STANDARD_TEXT_FONT, 12, "OUTLINE"}
I.TipFont = {GameTooltipText:GetFont(), 14, "OUTLINE"}

-- Textures
local Media = "Interface\\Addons\\_ShiGuang\\Media\\"
I.bdTex = "Interface\\ChatFrame\\ChatFrameBackground"
I.glowTex = Media.."glowTex"
I.normTex = Media.."normTex"
I.bgTex = Media.."bgTex"
I.arrowTex = Media.."Modules\\Raid\\textureArrowAbove"
I.mailTex = "Interface\\Minimap\\Tracking\\Mailbox"
I.gearTex = Media.."Modules\\Raid\\ArrowLarge"  --"Interface\\WorldMap\\Gear_64"
I.eyeTex = "Interface\\Minimap\\Raid_Icon"		-- blue: \\Dungeon_Icon
I.garrTex = "Interface\\HelpFrame\\HelpIcon-ReportLag"
I.copyTex = "Interface\\Buttons\\UI-GuildButton-PublicNote-Up"
I.binTex = "Interface\\HelpFrame\\ReportLagIcon-Loot"
I.TexCoord = {.08, .92, .08, .92}
I.LeftButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:14:12:0:-1:512:512:12:66:230:307|t "
I.RightButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:14:12:0:-1:512:512:12:66:333:411|t "
I.ScrollButton = " |TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:14:12:0:-1:512:512:12:66:127:204|t "

-- Raidbuff Checklist
I.BuffList = {
	[1] = {		-- 合剂
		188031,	-- 1300智力
		188033,	-- 1300敏捷
		188034,	-- 1300力量
		188035,	-- 1950耐力
	},
	[2] = {     -- 进食充分
		104273, -- 250敏捷，BUFF名一致
	},
	[3] = {     -- 符文
		224001,
	},
}