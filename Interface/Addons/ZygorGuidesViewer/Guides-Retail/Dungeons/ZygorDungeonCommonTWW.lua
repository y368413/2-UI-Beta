local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if ZGV:DoMutex("DungeonsCTWW") then return end
ZygorGuidesViewer.GuideMenuTier = "SHA"
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\Ara-kara, City of Echoes",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nAvanoxx\n"..
"Anub'zekt\nKi'katal the Harvester",
keywords={"TWW","War","Within","Avanoxx","Anub'zekt","Ki'katal","Harvester"},
condition_suggested=function() return level >= 77 end,
achieveid={40370},
mapid=2357,
patch='110002',
},[[
step
kill Avanoxx##213179 |goto City of Echoes/1 67.48,28.05
_EVERYONE_ |grouprole EVERYONE
|tip 远离地上的蛛网，它会施加一个可叠加的减益效果，当叠加到10层时会将你缠住。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 小怪随机盯住玩家。集火并迅速击杀。如果靠近Boss会给她增加Buff。 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 首领施放了Alerting Shrill和Gossamer Onslaught，都会对团队造成持续伤害 |grouprole HEALER
|tip BOSS 会偶尔对坦克进行三次快速攻击，然后使其在10秒内受到更多伤害。使用大量治疗和冷却技能来保持坦克的存活。|grouprole HEALER
_TANK_ |grouprole TANK
|tip BOSS会偶尔对你进行三次快速攻击，使你在10秒后承受更多的伤害。使用防御冷却技能来生存。|grouprole TANK
|tip 小怪会锁定随机目标且无法被坦住，然而如果小怪接近BOSS，BOSS会暂时获得增益效果。请务必将BOSS远离小怪，并且如果BOSS吸收了小怪，请使用减伤技能 |grouprole TANK
confirm
step
kill Anub'zekt##215405 |goto City of Echoes/1 16.67,39.17
_EVERYONE_ |grouprole EVERYONE
|tip 远离在竞技场内移动的虫群，它们会对附近的玩家造成可叠加的dot |grouprole EVERYONE
|tip 躲避穿刺，一个从Boss正面锥形扩散出来的技能。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 远程输出会成为掘地冲锋的目标。保持在与首领的最大距离并准备闪避该攻击。|grouprole DPS
_HEALER_ |grouprole HEALER
|tip 随机玩家会被感染目标，造成持续伤害，需要治疗。之后生成的虫群会对附近玩家施加叠加的持续伤害。|grouprole HEALER
|tip 尽量不要成为离 Boss 最远的玩家，这样你就不会被 Burrowing Charge 盯上 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 把 Boss 背对团队，以避免团队被刺击技能击中，该技能是一个正面扇形攻击，会击退你。|grouprole TANK
confirm
step
kill Ki'katal the Harvester##215407 |goto City of Echoes/0 46.68,55.95
_EVERYONE_ |grouprole EVERYONE
|tip 当首领施放Cosmic Singularity时，会将所有玩家拉向其中心并最终爆炸，造成高额伤害。使用移动技能并远离它。|grouprole EVERYONE
|tip 不要踩到小怪掉落的黑血池。会把你定在原地。|grouprole EVERYONE
|tip 避开喷发的蛛网。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip DPS可以通过击杀血液抓取来解救被黑血池定身的玩家
_HEALER_ |grouprole HEALER
|tip 首领会对团队施加毒药。请驱散毒药并治疗被影响的玩家。 |grouprole HEALER
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\City of Threads",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nOrator Krix'vizk\n"..
"Fangs of the Queen\nThe Coaglamation\nIzo, the Grand Splicer",
keywords={"TWW","War","Within","Orator","Krix'vizk","Fangs","Queen","Nx","Vx","Kx","Coaglamation","Izo","Grand","Splicer"},
condition_suggested=function() return level >= 80 end,
achieveid={40376},
mapid=2343,
patch='110002',
},[[
step
kill Orator Krix'vizk##216619 |goto City of Threads/1 59.85,26.79
_EVERYONE_ |grouprole EVERYONE
|tip 始终保持在首领十码范围内以避免持续伤害。 |grouprole EVERYONE
|tip 当Boss施放声势浩大的灌输时，持续移动以避免地上的水池 |grouprole EVERYONE
|tip 分散站位在BOSS周围以更好地躲避他的正面锥形攻击 |grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 在响亮灌输期间，小队将受到大量伤害，尤其是如果人们受到池子的伤害 |grouprole HEALER
|tip 首领会在随机玩家身上施放一个魔法Dot。当它过期或被驱散时，会从玩家身上爆炸，对命中的任何人造成大量伤害并眩晕。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 奴役造成大量伤害并对你施加减速效果。这些伤害一半是魔法伤害，一半是物理伤害。|grouprole TANK
confirm
step
kill Nx##216648
kill Vx##216649
kill Kx##216582 |goto City of Threads/1 70.38,48.87
_EVERYONE_ |grouprole EVERYONE
|tip 在第一阶段，避开Nx的前方锥形攻击和Vx的冰匕首 |grouprole EVERYONE
|tip 两个Boss会随机冲向一个玩家。所有人应该避开两条路径。 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 头目的生命值是共享的。 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 在第一阶段，大多数伤害是可避免的。在第二阶段，Boss会偶尔对坦克和团队进行重击。Nx还会周期性地对一名随机玩家造成伤害。 |grouprole 治疗
_TANK_ |grouprole TANK
|tip 第一阶段，当Nx使用一个正面锥形攻击时，它会留下一个暗影，稍后将会回响该攻击。把Boss移开这个暗影。 |grouprole TANK
|tip 在第二阶段，与至少一个其他拥有Freezing Blood减益效果的玩家集合，以防止受到伤害和被冰冻。 |grouprole TANK
confirm
step
kill The Coaglamation##216320 |goto City of Threads/0 49.91,47.01
_EVERYONE_ |grouprole EVERYONE
|tip 玩家需要拦截朝首领移动的能量球，以防止它们为首领充能。它们会施加一个吸收治疗的Debuff，所以玩家在没有防御技能或大量治疗的情况下应避免抓取过多。|grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 当BOSS达到最大能量时，会对全团造成大量伤害。|grouprole HEALER
|tip 拾取宝珠的玩家需要被大量治疗以移除减益效果。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领有一个强力攻击，会在10秒内减少受到的治疗量。使用防御技能来减轻这个阶段。 |grouprole TANK
confirm
step
kill Izo, the Grand Splicer##216658 |goto City of Threads/0 49.91,78.60
_EVERYONE_ |grouprole EVERYONE
|tip 避开房间周围的光球，碰触时会造成大量伤害并击退。 |grouprole EVERYONE
|tip 在震颤猛击时远离Boss。这会生成需要击杀的小怪。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 当boss用网困住队伍时，DPS切换目标到网以解救队员
_HEALER_ |grouprole HEALER
|tip 首领将施放分裂，对整个队伍造成大量伤害。|grouprole HEALER
_TANK_ |grouprole TANK
|tip BOSS会对你施放一次强力攻击，会脉动三次并伤害你周围的敌人。远离团队并使用防御冷却技能来生存。|grouprole TANK
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\The Dawnbreaker",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nSpeaker Shadowcrown\n"..
"Anub'ikkaj\nRasha'nan",
keywords={"TWW","War","Within","Speaker","Shadowcrown","Anub'ikkaj","Rasha'nan"},
condition_suggested=function() return level >= 80 end,
achieveid={40599},
mapid=2359,
patch='110002',
},[[
step
kill Speaker Shadowcrown##211087 |goto The Dawnbreaker/0 44.29,23.67
_EVERYONE_ |grouprole EVERYONE
|tip 在空中拾取Orbs以延长保护你免受Enroaching Shadows伤害的Radiant Light Buff的持续时间。|grouprole EVERYONE
|tip 当 Boss 血量降到 50% 和 1% 时，她将免疫伤害并引导法术杀死晨曦号上的所有人 |grouprole EVERYONE
|tip 避免站在地上的坍缩黑暗区域。 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 尽可能频繁地打断暗影箭 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 一名玩家将受到魔法DOT，当被驱散时，会对其他人施加另一个减益。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 当boss施放Obsidian Blast时，准备承受大量伤害。|grouprole TANK
confirm
step
kill Anub'ikkaj##211089 |goto The Dawnbreaker/0 39.30,41.06
_EVERYONE_ |grouprole EVERYONE
|tip 在与BOSS战斗之前先击杀Nerubian副官以移除强化BOSS的增益效果。|grouprole EVERYONE
|tip 黑暗法球飞行距离越远，对队伍造成的伤害就越少。|grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 当首领施放暗影腐朽时，会对团队造成无法规避的巨额伤害 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领发动一个沉重攻击，对你造成伤害并将你击退，同时对你周围的任何人造成同样的效果。使用防御能力减轻伤害并远离队伍。 |grouprole TANK
confirm
step
kill Rasha'nan##224552 |goto The Dawnbreaker/0 39.69,46.51
_EVERYONE_ |grouprole EVERYONE
|tip 玩家需要在船上捡起炸弹并靠近boss使用额外动作按钮投掷 |grouprole EVERYONE
|tip 首领会飞走，玩家需要骑上坐骑追击首领并打断它的施法。沿途捡拾光球并保持靠近飞艇。 |grouprole EVERYONE
|tip 被酸浪锁定时，将其移动到区域的两侧。酸浪将从细的浅绿色线条向宽的深绿色区域移动。|grouprole EVERYONE
|tip 在最后阶段，如果被绑在网中的受害者身上，移动开来打破束缚。|grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 通过治疗解决Erosive Spray的群体伤害 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 如果没有人一直在近战范围内，首领将造成大量伤害。|grouprole TANK
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\Cinderbrew Meadery",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nBrew Master Aldryr\n"..
"I'pa\nBenk Buzzbee\nGoldie Baronbottom",
keywords={"TWW","War","Within","Brew","Master","Aldryr","I'pa","Benk","Buzzbee","Goldie","Baronbottom"},
condition_suggested=function() return level >= 80 end,
achieveid={40361},
mapid=2335,
patch='110002',
},[[
step
kill Brew Master Aldryr##210271 |goto Cinderbrew Meadery/0 44.38,52.12
_EVERYONE_ |grouprole EVERYONE
|tip 在欢乐时光期间，玩家需要从老板附近的桌子上拿起灰烬酒，送给房间里吵闹的顾客  |grouprole EVERYONE
|tip 注意地上的热蜜水池。|grouprole EVERYONE
|tip 避免正面扇形范围 |grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 玩家会随机受到一个掉落池子的DOT |grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领有一个重击攻击，会将你击退并在地上留下一个池子。 |grouprole TANK
confirm
step
kill I'pa##210267 |goto Cinderbrew Meadery/0 41.37,23.74
_DPS_ |grouprole DPS
|tip 击杀地上的酒液滴以将其变回水池，防止它们接触到Boss。	|grouprole DPS
_HEALER_ |grouprole HEALER
|tip 首领定期对随机玩家施加高额火焰伤害的DoT |grouprole HEALER
_TANK_ |grouprole TANK
|tip 把 Boss 移开啤酒滴和啤酒池，以防止它们接触到 Boss。|grouprole TANK
|tip BOSS有强力的上钩拳攻击，会把你击退。|grouprole TANK
confirm
step
kill Benk Buzzbee##218000 |goto Cinderbrew Meadery/0 52.55,76.23
_EVERYONE_ |grouprole EVERYONE
|tip 首领掉落的桶需要躲避。这些桶会生成蜜蜂小怪，当它们的生命值达到1时可以骑乘，然后将它们朝桶发射以摧毁桶。|团队任务 EVERYONE
_DPS_ |grouprole DPS
|tip DPS蜜蜂小怪并协助将它们发射到桶上。 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 该首领有一个吹风技能会将所有玩家击退并造成全团伤害。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领将对坦克进行一次重击攻击，施加一个会在附近玩家身上爆炸的减益效果，并在其效果结束时留下一个池。 |grouprole TANK
confirm
step
kill Goldie Baronbottom##218523 |goto Cinderbrew Meadery/0 54.67,52.85
_EVERYONE_ |grouprole EVERYONE
|tip 首领刷新了爆炸桶，桶爆炸时会对全团造成伤害。 |grouprole EVERYONE
|tip 当Boss的能量达到满值时，她会一次性引爆所有剩余的炸药桶。必须在战斗过程中通过站在炸药桶附近引爆一些来分散伤害，防止它们同时爆炸 |grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 在每次有桶爆炸时，小队将需要大量治疗。如果多个桶同时爆炸，伤害将会非常大。 |grouprole HEALER
_TANK_ |grouprole TANK
|tip boss有一个正面的锥形攻击，会造成大量伤害并引爆桶。|grouprole TANK
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\Darkflame Cleft",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nOl' Waxbeard\n"..
"Blazikon\nThe Candle King\nThe Darkness",
keywords={"TWW","War","Within","Ol'","Waxbeard","Blazikon","Candle","King","Darkness"},
condition_suggested=function() return level >= 80 end,
achieveid={40427},
mapid=2303,
patch='110002',
},[[
step
kill Ol' Waxbeard##210149 |goto Darkflame Cleft/0 22.57,20.36
_EVERYONE_ |grouprole EVERYONE
|tip 大部分蜡须的技能会杀死碰到的狗头人，避开矿车和炸药，并把狗头人引导到它们的路径上。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 小怪会盯上被引诱之烛焰标记的远程玩家，远离它们并将它们引诱到BOSS的技能范围内 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 优先治疗被引诱烛焰标记的目标。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 当boss使用岩石破碎者时使用一个防御技能。|grouprole TANK
confirm
step
kill Blazikon##208743 |goto Darkflame Cleft/0 41.40,41.14
_EVERYONE_ |grouprole EVERYONE
|tip 在Wicklighter Barrage期间通过靠近蜡烛保持其点燃，以便为Enkindling Inferno留出安全空间。|grouprole EVERYONE
|tip 当Boss施放Enkindling Inferno时，靠近一个点燃的蜡烛。|grouprole EVERYONE
_TANK_ |grouprole TANK
|tip 如果没有人处于近战范围，boss将发动致命攻击。|grouprole TANK
confirm
step
kill The Candle King##222096 |goto Darkflame Cleft/0 41.37,86.49
_EVERYONE_ |grouprole EVERYONE
|tip 如果被Darkflame Pickaxe或Throw Darkflame锁定，在蜡像后面躲避以摧毁它。不要靠近蜡像2码内，否则会被昏迷。 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 打断Paranoid Mind以防止小队被恐惧。|grouprole DPS
_HEALER_ |grouprole HEALER
|tip 每存活一个化身雕像，团队就会受到周期性伤害。|grouprole HEALER
confirm
step
kill The Darkness##210797 |goto Darkflame Cleft/0 81.62,74.76
_EVERYONE_ |grouprole EVERYONE
|tip 这场战斗的关键是在任何时候都要站在蜡烛附近，并尽可能长时间保持它的点燃。玩家靠近蜡烛时间越长，蜡烛的热量损失越快，并且可以移动。|grouprole EVERYONE
|tip 避免将首领的技能引诱到蜡烛上，因为这会导致它们失去热量。捡起蜡烛并将其移动以避免被击中。 |grouprole EVERYONE
|tip 使用死亡烛台持有者身上的蜡块为蜡烛增加热量。 |grouprole EVERYONE
|tip 避免让蜡烛的热量减少到0。可以用蜡重新点燃，但每次热量减少到0会造成全团伤害并增加受到的伤害和减少急速直到战斗结束。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 在黑暗孢子减弱烛火的热量之前将其击杀。|grouprole DPS
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\Priory of the Sacred Flame",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nCaptain Dailcry\n"..
"Baron Braunpyke\nPrioress Murrpray",
keywords={"TWW","War","Within","Captain","Dailcry","Baron","Braunpyke","Prioress","Murrpray"},
condition_suggested=function() return level >= 75 end,
achieveid={40590},
mapid=2308,
patch='110002',
},[[
step
kill Captain Dailcry##207946 |goto Priory of the Sacred Flame/0 36.75,54.59
_EVERYONE_ |grouprole EVERYONE
|tip BOSS的守卫每有一个临近的守卫就会造成更多的伤害。|grouprole EVERYONE
|tip 避免Boss的投掷长矛攻击。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 当 Boss 的坐骑碾压玩家时，可以通过对它造成足够的伤害来打断 |grouprole DPS
|tip 打断boss的战斗怒吼是至关重要的，否则战斗将变得越来越危险。 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 如果小怪没有被打断，就驱散燃烬爆破减益效果。 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领对坦克施加叠加的流血效果。需要在叠加层数过高之前尝试让其消失。 |grouprole TANK
|tip 圣骑士的神圣审判使你受到的伤害增加25%持续6秒，请准备减轻增加的伤害。 |grouprole TANK
confirm
step
kill Baron Braunpyke##207939 |goto Priory of the Sacred Flame/1 83.98,48.60
_EVERYONE_ |grouprole EVERYONE
|tip 当 Boss 达到满能量时，他会施放仇恨之怒并获得增加 25% 的伤害，他的法术会攻击更多玩家。|grouprole EVERYONE
|tip 如果他的盾牌攻击弹到你身上，请移出脚下随后的地面爆炸。|grouprole EVERYONE
|tip 避开纯净之锤。在首领使用报复之怒之后，还会有更多这样的锤子需要躲避。|grouprole EVERYONE
|tip 玩家需要在神圣祭火时间结束之前用它们来清除所有层数。这会造成叠加的神圣伤害，所以小心不要一次性承受太多层数。|grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 从圣火堆中获取层数的玩家需要额外治疗。|grouprole HEALER
confirm
step
kill Prioress Murrpray##207940 |goto Priory of the Sacred Flame/1 25.27,56.85
_EVERYONE_ |grouprole EVERYONE
|tip 当她施放Blinding Light时，将你的角色背对boss以防被致盲 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 尽可能频繁地打断boss的神圣惩击。 |grouprole DPS
|tip 当boss施放光之屏障时，迅速接近她并破坏她的护盾，并在护盾消失时打断她的施法 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 当Boss的血量降到50%并施放Inner Fire时，团队将承受大量伤害 |grouprole HEALER
|tip 净化圣焰以减少伤害 |grouprole HEALER
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\The Rookery",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nKyrioss\n"..
"Stormguard Gorren\nVoidstone Monstrosity",
keywords={"TWW","War","Within","Kyrioss","Stormguard","Gorren","Voidstone","Monstrosity"},
condition_suggested=function() return level >= 71 end,
achieveid={40621},
mapid=2315,
patch='110002',
},[[
step
kill Kyrioss##209230 |goto The Rookery/4 49.55,50.39
_EVERYONE_ |grouprole EVERYONE
|tip 如果你被不稳定充能选中，请与团队打断视线。你可以跳进房间中间的洞里来实现这一点。 |grouprole EVERYONE
|tip 躲避 闪电冲刺 和 闪电喷涌 技能。|grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip Boss施放了闪电链，如果团队没有分散开将会造成大量伤害。|grouprole HEALER
confirm
step
kill Stormguard Gorren##207205 |goto The Rookery/2 55.64,62.84
_EVERYONE_ |grouprole EVERYONE
|tip 当混乱腐化减益状态结束时，它会跳向最近的队员。如果其他玩家在效果结束时过于接近，则会引发爆炸。
|tip 当Boss试图把大家吸引过去时，跑开。 |grouprole EVERYONE
|tip 避免碾压现实和随后出现的虚空池以及从中射出的龙卷风。|grouprole EVERYONE
confirm
step
kill Voidstone Monstrosity##207207 |goto The Rookery/1 56.96,54.88
_EVERYONE_ |grouprole EVERYONE
|tip 被风暴骑士冲锋赋予力量的玩家可以通过站在渗透碎片附近来击碎它们。 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 在虚空碎块完成施放塑形之前将其摧毁 |grouprole DPS
_TANK_ |grouprole TANK
|tip BOSS对坦克进行了一次直线重击攻击，避免击中其他玩家。|grouprole TANK
|tip 如果没有人处于近战范围，Boss会对所有玩家造成大量伤害。|grouprole TANK
confirm
]])
ZygorGuidesViewer:RegisterGuide("Dungeon Guides\\The War Within Dungeons\\The Stonevault",{
author="support@zygorguides.com",
description="To complete this dungeon, you will need to kill the following bosses:\n\nE.D.N.A\n"..
"Skarmorak\nSpeaker Dorlita\nSpeaker Brokk\nVoid Speaker Eirich",
keywords={"TWW","War","Within","E.D.N.A","Skarmorak","Speaker","Dorlita","Brokk","Void","Eirich"},
condition_suggested=function() return level >= 73 end,
achieveid={40643},
mapid=2341,
patch='110002',
},[[
step
kill E.D.N.A##210108 |goto Darkflame Cleft/0 56.35,35.58
_EVERYONE_ |grouprole EVERYONE
|tip 受到折射射线的点名时，站在一个不稳定尖刺后面以摧毁它。 |grouprole EVERYONE
|tip 不稳定尖刺如果有任何人靠得太近也会爆炸，造成全团伤害。 |grouprole EVERYONE
_HEALER_ |grouprole HEALER
|tip 驱散坦克身上的 Seismic Reverberation 以移除 DoT 并给予他们一个临时的 Earth Shield ，减少 3 秒的进一步伤害。|grouprole HEALER
_TANK_ |grouprole TANK
|tip 首领的Seismic Smash会对坦克造成大量伤害，还会留下一个强力DoT。|grouprole TANK
confirm
step
kill Skarmorak##210156 |goto Darkflame Cleft/0 79.09,36.42
_EVERYONE_ |grouprole EVERYONE
|tip 水晶碎片落在房间周围时要躲开。|grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 摧毁水晶碎片以生成你需要拾取的虚空碎片。 |grouprole DPS
|tip 拾取虚空碎片对崩裂之壳造成额外伤害。该增益效果可以叠加，但每叠加一次会对你造成更多伤害。 |grouprole DPS
|tip 在伤害压垮团队之前摧毁破碎外壳。 |grouprole DPS
_HEALER_ |grouprole HEALER
|tip 首领会进行一次对全团的强力攻击，随着战斗进行会造成越来越多的伤害。 |grouprole HEALER
|tip 拾取虚空碎片来增加你的治疗效果。不要拿太多，因为DPS需要它们来快速击破护甲。 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 晶化打击对坦克造成大量伤害。|grouprole TANK
confirm
step
kill Speaker Dorlita##221586
kill Speaker Brokk##213217 |goto Darkflame Cleft/0 31.88,64.67
_EVERYONE_ |grouprole EVERYONE
|tip 剩下的首领会对团队造成大量伤害，并在另一个首领被击杀后造成75%额外伤害。|grouprole EVERYONE
|tip 当熔火喷口启动时，注意躲避。|grouprole EVERYONE
|tip 避免在废料方块的路径上 |grouprole EVERYONE
_DPS_ |grouprole DPS
|tip 尽量多地打断Molten Metal。|grouprole DPS
|tip 均衡击杀首领以防止剩余的首领获得增益。|grouprole DPS
_HEALER_ |grouprole HEALER
|tip 当废料立方体被引爆时，即使避开了碎片，小队仍会受到大量伤害 |grouprole HEALER
|tip 驱散熔岩金属以减轻即将来临的伤害。 |grouprole HEALER
_TANK_ |grouprole TANK
|tip 减轻炽热锤击的伤害，该攻击造成严重的火山伤害。|grouprole TANK
confirm
step
kill Void Speaker Eirich##219440 |goto Darkflame Cleft/0 56.41,66.01
_EVERYONE_ |grouprole EVERYONE
|tip 受到虚空腐蚀感染的玩家将会受到逐渐增加的持续伤害，直到他们靠近一个虚空裂隙 |grouprole EVERYONE
|tip 移动到虚空裂隙的中心会杀死玩家 |grouprole EVERYONE
|tip 当 Boss 施放 Entropic Reckoning 时，所有玩家需要移动到房间边缘，在不会妨碍的位置放置池子。 |grouprole EVERYONE
|tip 躲避boss的锥形攻击。|grouprole EVERYONE
confirm
]])
