
local addon = TinyTooltip

addon.db = {
    version = 2,
    general = {
        scale             = 0.85,                   --縮放
        mask              = true,                   --頂部遮罩層
        bgfile            = "gradual",                 --背景 rock
        background        = {0, 0, 0, 0.8},         --背景顔色和透明度
        borderSize        = 1,                      --邊框大小（直角邊框才生效）
        borderCorner      = "angular",              --邊框類型 default|angular:直角邊框
        borderColor       = {0.6, 0.6, 0.6, 0.8},   --邊框顔色和透明度
        statusbarHeight   = 12,                     --HP高度
        statusbarPosition = "top",               --HP位置 default|bottom|top
        statusbarOffsetX  = 0,                      --HP X偏移 0:自動
        statusbarOffsetY  = 0,                      --HP Y偏移 0:自動
        statusbarFontSize = 10,                     --HP文字大小
        statusbarFontFlag = "OUTLINE",          --HP文字樣式
        statusbarText     = true,                   --HP文字
        statusbarColor    = "auto",                 --HP顔色 default|auto|smooth
        statusbarTexture  = "Blizzard", --HP材質
        anchor            = { position = "cursorRight", returnInCombat = false, returnOnUnitFrame = false, cp = "BOTTOM", p = "BOTTOMRIGHT", }, --鼠標位置 default|cursor|static|cursorRight
        alwaysShowIdInfo  = false,
        skinMoreFrames    = true,
        headerFont        = "default",
        headerFontSize    = "default",
        headerFontFlag    = "default",
        bodyFont          = "default",
        bodyFontSize      = "default",
        bodyFontFlag      = "default",
    },
    unit = {
        player = {
            coloredBorder = "class",                --玩家邊框顔色 default|class|level|reaction|itemQuality|selection|faction|HEX
            background = { colorfunc = "default", alpha = 0.9, },
            anchor = { position = "inherit", returnInCombat = true, returnOnUnitFrame = false, cp = "BOTTOM", p = "BOTTOMRIGHT", },
            showTarget = true,                      --顯示目標
            showTargetBy = true,                    --顯示被關注
            showModel = true,                       --顯示模型
            grayForDead = false,                    --灰色死亡目標
            elements = {
                raidIcon    = { enable = true, filter = "none" },
                roleIcon    = { enable = true, filter = "none" },
                pvpIcon     = { enable = true, filter = "none" },
                factionIcon = { enable = true, filter = "none" },
                classIcon   = { enable = false, filter = "none" },
                title       = { enable = false, color = "ccffff", wildcard = "%s",   filter = "none" },
                name        = { enable = true, color = "class",  wildcard = "%s",   filter = "none" },
                realm       = { enable = true, color = "00eeee", wildcard = "%s",   filter = "none" },
                statusAFK   = { enable = true, color = "ffd200", wildcard = "(%s)", filter = "none" },
                statusDND   = { enable = true, color = "ffd200", wildcard = "(%s)", filter = "none" },
                statusDC    = { enable = true, color = "999999", wildcard = "(%s)", filter = "none" },
                guildName   = { enable = true, color = "ff00ff", wildcard = "<%s>", filter = "none" },
                guildIndex  = { enable = true, color = "cc88ff", wildcard = "-%s-", filter = "none" },
                guildRank   = { enable = true, color = "cc88ff", wildcard = "%s",   filter = "none" },
                guildRealm  = { enable = false, color = "00cccc", wildcard = "%s",   filter = "none" },
                levelValue  = { enable = true, color = "level",   wildcard = "%s",  filter = "none" }, 
                factionName = { enable = false, color = "faction", wildcard = "%s",  filter = "none" }, 
                gender      = { enable = false, color = "999999",  wildcard = "%s",  filter = "none" }, 
                raceName    = { enable = false, color = "cccccc",  wildcard = "%s",  filter = "none" }, 
                className   = { enable = false, color = "ffffff",  wildcard = "%s",  filter = "none" }, 
                isPlayer    = { enable = false, color = "ffffff",  wildcard = "(%s)", filter = "none" }, 
                role        = { enable = false, color = "ffffff",  wildcard = "(%s)", filter = "none" }, 
                moveSpeed   = { enable = false, color = "e8e7a8",  wildcard = "%d%%", filter = "none" },
                zone        = { enable = true,  color = "ffffff",  wildcard = "%s", filter = "none" },
                { "classIcon", "levelValue", "title", "name", "realm", "statusAFK", "statusDND", "statusDC", "roleIcon", "pvpIcon","factionIcon", "raidIcon", },
                { "guildName", "guildIndex", "guildRank", "guildRealm", },
                { "factionName", "gender", "raceName", "className", "isPlayer", "role", "moveSpeed", },
                { "zone" },
            },
        },
        npc = {
            coloredBorder = "reaction",
            background = { colorfunc = "default", alpha = 0.9, },
            showTarget = true,
            showTargetBy = true,
            grayForDead = false,
            anchor = { position = "inherit", returnInCombat = true, returnOnUnitFrame = false, cp = "BOTTOM", p = "BOTTOMRIGHT", },
            elements = {
                raidIcon     = { enable = true,  filter = "none" },
                classIcon    = { enable = true, filter = "none" },
                questIcon    = { enable = true,  filter = "none" },
                name         = { enable = true, color = "default",       wildcard = "%s",    filter = "none" },
                npcTitle     = { enable = false, color = "99e8e8", wildcard = "<%s>",  filter = "none" },
                levelValue   = { enable = true, color = "level",  wildcard = "%s",    filter = "none" }, 
                classifBoss  = { enable = false, color = "ff0000", wildcard = "(%s)",  filter = "none" },
                classifElite = { enable = false, color = "ffff33", wildcard = "(%s)",  filter = "none" }, 
                classifRare  = { enable = true, color = "ffaaff", wildcard = "(%s)",  filter = "none" }, 
                creature     = { enable = true, color = "selection", wildcard = "%s", filter = "none" },
                reactionName = { enable = true, color = "33ffff", wildcard = "<%s>",  filter = "reaction6" },
                moveSpeed    = { enable = false, color = "e8e7a8",  wildcard = "%d%%", filter = "none" },
                { "raidIcon", "classIcon", "questIcon", "name", },
                { "levelValue", "classifBoss", "classifElite", "classifRare", "creature", "reactionName", "moveSpeed", },
            },
        },
    },
    item = {
        coloredItemBorder = true,  --邊框按品質染色
        showItemIcon = true,      --物品圖標
    },
    spell = {
        borderColor = {0.6, 0.6, 0.6, 0.8},
        background = {0, 0, 0, 0.8},
        showIcon = true,
    },
    quest = {
        coloredQuestBorder = true,  --任務按等差染色
    },
}
