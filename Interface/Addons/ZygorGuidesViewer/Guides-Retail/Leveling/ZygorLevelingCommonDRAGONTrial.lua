local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("LevelingCDRAGON") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Startup Guide Wizard",{
author="support@zygorguides.com",
condition_visible=function() return false end,
noscoring = true,
orientation = true,
},[[
step
欢迎来到Zygor启动向导
为了让Zygor指南发挥最佳效果，我们需要收集一些角色数据
这个巫师将引导你完成几个简单的步骤来做到这一点。
confirm begin
step
使用Zygor指导客户端（桌面版）安装趋势数据。 |complete (ZGV.Gold.servertrends ~= nil)
|tip 这对金币指南是必需的。你可以在趋势数据中的设置里配置你的服务器。
reload
confirm skip
step
findcity Main City
|tip 接下来的步骤需要你在主城内。
step
talknpcs Auctioneer |autoscript ZGV.ATWereEnabled=ZGV.db.profile.auction_enable ZGV.db.profile.auction_enable=true
在右下角点击扫描按钮。
记录金币指南的拍卖价格数据 |complete ZGV.Gold:LastScan(15)
step
talknpcs Banker
记录你放在银行库存中的物品 |complete ZGV.Inventory:CharacterBankKnown()
step
talknpcs Flightmaster
记录你在旅行系统中拥有的飞行路线 | complete LibTaxi:IsContinentKnown()
step
openskill Alchemy
|only if hasprofunscanned("Alchemy")
记录你的专业资料以制作金币指南。 |complete hasprof("Alchemy",1)
step
openskill Blacksmithing
|only if hasprofunscanned("Blacksmithing")
记录你的专业资料以制作金币指南。 |complete hasprof("Blacksmithing",1)
step
openskill Cooking
|only if hasprofunscanned("Cooking")
记录你的专业资料以制作金币指南。 |complete hasprof("Cooking",1)
step
openskill Enchanting
|only if hasprofunscanned("Enchanting")
记录你的专业资料以制作金币指南。 |complete hasprof("Enchanting",1)
step
openskill Engineering
|only if hasprofunscanned("Engineering")
记录你的专业资料以制作金币指南。 |complete hasprof("Engineering",1)
step
openskill First Aid
|only if hasprofunscanned("First Aid")
记录你的专业资料以制作金币指南。 |complete hasprof("First Aid",1)
step
openskill Fishing
|only if hasprofunscanned("Fishing")
记录你的专业资料以制作金币指南。 |complete hasprof("Fishing",1)
step
openskill Herbalism
|only if hasprofunscanned("Herbalism")
记录你的专业资料以制作金币指南。 |complete hasprof("Herbalism",1)
step
openskill Inscription
|only if hasprofunscanned("Inscription")
记录你的专业资料以制作金币指南。 |complete hasprof("Inscription",1)
step
openskill Jewelcrafting
|only if hasprofunscanned("Jewelcrafting")
记录你的专业资料以制作金币指南。 |complete hasprof("Jewelcrafting",1)
step
openskill Leatherworking
|only if hasprofunscanned("Leatherworking")
记录你的专业资料以制作金币指南。 |complete hasprof("Leatherworking",1)
step
openskill Mining
|only if hasprofunscanned("Mining")
记录你的专业资料以制作金币指南。 |complete hasprof("Mining",1)
step
openskill Skinning
|only if hasprofunscanned("Skinning")
记录你的专业资料以制作金币指南。 |complete hasprof("Skinning",1)
step
openskill Tailoring
|only if hasprofunscanned("Tailoring")
记录你的专业资料以制作金币指南。 |complete hasprof("Tailoring",1)
step
万事俱备！
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Starter Guides\\Dracthyr Starter (10-15)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Thaldraszus (Story Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (All Zones)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragonriding World Tour")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragonflight Campaign")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Old Hatreds Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach Side Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (Zaralek Cavern)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Zaralek Cavern")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Snail Racing")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Blue Dragonflight's Legacy")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Tyr's Fall")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Rebel Resurgence")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Some Wicked Things (Warlock)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Augmentation Questline (Evoker)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Reforging the Tyr's Guard")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Bronze Reconciliation")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign + Side Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Wrathion's Questline")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Tyr's Return")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Seeing Red")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Reclaiming of Gilneas")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Sins of the Sister")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Champion of the Dragonflights")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Hunt for the Harbinger")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The War Within (70-80)\\Warbands")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The War Within (70-80)\\Visions of Azeroth")
