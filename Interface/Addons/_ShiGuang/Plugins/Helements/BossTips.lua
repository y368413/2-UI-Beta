--## Notes: 副本提示插件  ## Author: nga_以德报德  ## Version: 1.2.1
-- 创建主框架
local frame = CreateFrame("Frame")

-- 定义副本数据结构
local BossData = {
    ["千丝之城"] = {
        -- BOSS部分
        ["演说者基克斯威兹克"] = {
            tips = "{rt8}演说者基克斯威兹克{rt8}||开打以BOSS为中心身边出个圈，所有人保持自己在boss圈内，并躲开头前||两个疑之影点名，让开先驱散一个||喧神教化AOE时所有人提前跑位到BOSS头前||||BOSS定期砸地板放黑水需要坦克拉开||圈只会跟BOSS走，坦克不拉走大家只好硬踩黑水了！",
        },
        ["女王之牙"] = {
            tips = "{rt8}女王之牙{rt8}||打正在攻击的BOSS||P1: 恩格斯攻击，躲各种地板，维克斯释放寒冰镰刀时，两两分散，不要站一条直线，并开减伤应对之后的DEBUFF||P2: 维克斯攻击，点T白圈集中踩，避免倒T；点名紫圈原来人群。",
        },
        ["凝结聚合体"] = {
            tips = "{rt8}凝结聚合体{rt8}||BOSS召唤黑球从场地边缘飞向BOSS||需要去接球别让BOSS吃球回血||吃到球的队友会染一个DEBUFF需要奶妈刷爆他。",
        },
        ["大捻接师艾佐"] = {
            tips = "{rt8}大捻接师艾佐{rt8}||BOSS会点名所有人几秒后脚下出软泥||在打死软泥之前无限定身||需要所有人在点名时集合方便速度AOE掉软泥||如果能自己解定身的职业可以无视||否则会一直定身影响后续需要跑位技能的躲避。",
        },
        -- 小怪部分
        ["苏雷吉缚丝者"] = {
            tips = "{rt8}苏雷吉缚丝者{rt8}||{rt1}流丝缠缚{rt1}必须打断",
        },
        ["皇家虫群卫士"] = {
            tips = "{rt8}皇家虫群卫士{rt8}||{rt1}贪婪之虫{rt1}需要全员减伤",
        },
        ["安苏雷克的传令官"] = {
            tips = "{rt8}安苏雷克的传令官{rt8}||{rt1}扭曲思绪{rt1}必须打断",
        },
        ["隐秘网士"] = {
            tips = "{rt8}隐秘网士{rt8}||主目标优先击杀。阴织冲击、愈合之网必须打断",
        },
        ["苏雷吉反自然者"] = {
            tips = "{rt8}苏雷吉反自然者{rt8}||{rt1}虚空之波{rt1}，尽量群控，尽量打断",
        },
        ["长者织影"] = {
            tips = "{rt8}长者织影{rt8}||{rt1}晦幽纺纱{rt1}需要集中站位，A掉限制移动的网",
        },
    },
    ["驭雷栖巢"] = {
        -- BOSS部分
        ["凯里欧斯"] = {
            tips = "{rt8}凯里欧斯{rt8}||没什么特别需要注意的机制||就是BOSS有个技能是飞到场地中间一道射线扫射半场||被扫到昏迷8秒，注意躲避！",
        },
        ["雷卫戈伦"] = {
            tips = "{rt8}雷卫戈伦{rt8}||BOSS大跳跃击||落地后产生四道往四面方向飞行的黑光柱，注意躲避。",
        },
        ["虚空石畸体"] = {
            tips = "{rt8}虚空石畸体{rt8}||别站坦克背后！BOSS召唤出来的水晶速度转火打掉！",
        },
        -- 小怪部分
    },
    ["破晨号"] = {
        -- BOSS部分
        ["代言人夏多克朗"] = {
            tips = "{rt8}代言人夏多克朗{rt8}||打断暗影箭，不要被光束碰到（P1三条P2四条），提前站位||治疗第一时间驱散燃烧之影DEBUFF，然后刷血刷爆吸收盾||中塌缩第一时间去场边放水（点名最远的2个人，看见读条就用位移技能跑）||BOSS放完黑水T注意打断并拉离黑水||BOSS 50% 1%上鸟远离飞船，1%那次可以直接飞往老2小怪",
        },
        ["阿努布伊卡斯"] = {
            tips = "{rt8}阿努布伊卡斯{rt8}||T卡墙，出现黑圈所有人躲开||对着空旷处放球，避开球正面，球飞得越远伤害越低,治疗注意被球撞的人||出现小怪群控AOE掉||BOSS AOE会越来越痛，规划好减伤和治疗。",
        },
        ["拉夏南"] = {
            tips = "{rt8}拉夏南{rt8}||P1：躲开地上白圈，绿色点名推波注意人群方向，治疗在AOE时注意抬血，不要猛捶BOSS，第一时间捡炸弹丢BOSS，捡炸弹时注意开减伤，治疗注意抬血||P2转场:直接飞到BOSS场地等，或者吃球跟着BOSS飞||P2:P2增加白圈点名技能，中白圈的跑场地边缘放圈再位移回来，全程BOSS点名非坦队友放绿线||被点名人自己改变站位让毒浪出现在边缘不影响其他队友||场地上出倒计时火药桶需要捡桶丢BOSS脸上炸它||否则桶会爆炸全团AOE||二阶段BOSS离开飞船的时候利用战斗中上鸟功能沿着NPC点亮的悬浮光球追击。",
        },
        -- 小怪部分
        ["夜幕祭师"] = {
            tips = "{rt8}夜幕祭师{rt8}||钢条{rt1}折磨光束{rt1}，尽量晕断。{rt1}钢条冥河之种{rt1}别驱散，躲开人群",
        },
        ["夜幕影法师"] = {
            tips = "{rt8}夜幕影法师{rt8}||{rt1}诱捕暗影{rt1}，必须打断",
        },
        ["夜幕司令官"] = {
            tips = "{rt8}夜幕司令官{rt8}||{rt1}深渊嚎叫{rt1}必须打断",
        },
        ["夜幕黑暗建筑师"] = {
            tips = "{rt8}夜幕黑暗建筑师{rt8}||{rt1}折磨喷发{rt1}，中圈离开人群开好减伤，招引增援迅速转火，小怪刚出开非常弱",
        },
    },
    ["圣焰隐修院"] = {
        -- BOSS部分
        ["戴尔克莱上尉"] = {
            tips = "{rt8}戴尔克莱上尉{rt8}||被点名离开人群，boss的长矛会对路径上的所有人造成伤害||打断boss读条，不然会全队AOE，并且给buff小怪||BOSS找队友贴贴会带套，要打破这个套！",
        },
        ["布朗派克男爵"] = {
            tips = "{rt8}布朗派克男爵{rt8}||远程不要站在近战区域||点名远程的转转锤自己看着躲。",
        },
        ["隐修院长穆普雷"] = {
            tips = "{rt8}隐修院长穆普雷{rt8}||Boss会点名，地上会有一只黄圈点谁追谁||并且黄圈还会放黑水，注意要远离人群，保持移动||BOSS半血会上楼，大伙跑楼梯追上去打掉BOSS护盾打断读条即可。",
        },
        -- 小怪部分
    },
    ["艾拉-卡拉，回响之城"] = {
        -- BOSS部分
        ["阿瓦诺克斯"] = {
            tips = "{rt8}阿瓦诺克斯{rt8}||躲开地板，偶尔可以踩一下||三连击时，T注意覆盖减伤||治疗注意留技能给群体AOE||群控减速，并转火小怪||定期召唤小蜘蛛无仇恨追人，需要控住清理。",
        },
        ["阿努布泽克特"] = {
            tips = "{rt8}阿努布泽克特{rt8}||躲开地上头前地板和会移动的虫群。Boss二阶段会放全场AOE虫群之眼||注意站到boss前面的圈圈里，躲好技能，出去就是死||点名一名队友几秒后会出现一圈小虫群AOE需要离开人群放圈||BOSS读条钻地冲击时，近战远离，躲开戳刺方向，躲开点名留下的蓝圈。",
        },
        ["收割者吉卡塔尔"] = {
            tips = "{rt8}收割者吉卡塔尔{rt8}||冲击波不友好对人群放||出啥躲啥，被网住就昏迷6秒，不能驱散的||场地边缘出现的小软泥打死会留下黑水||人踩上去会被定身并身下出现一只小软需要打掉才能解除||BOSS引导大招全场吸人时所有人需要主动去踩黑水定身避免被吸入。",
        },
        -- 小怪部分
        ["充血的爬行者"] = {
            tips = "{rt8}充血的爬行者{rt8}||充血的爬行者 残血之后控制，或者走开",
        },
        ["颤声侍从"] = {
            tips = "{rt8}颤声侍从{rt8}||{rt1}共振弹幕{rt1}必须打断",
        },
        ["伊可辛"] = {
            tips = "{rt8}伊可辛{rt8}||{rt1}惊惧尖鸣{rt1}必须打断",
        },
        ["沾血的网法师"] = {
            tips = "{rt8}沾血的网法师{rt8}||{rt1}恶臭齐射{rt1}必须打断",
        },
        ["哨兵鹿壳虫"] = {
            tips = "{rt8}哨兵鹿壳虫{rt8}||{rt1}预警尖鸣{rt1}必须打断，优先击杀",
        },

        ["鲜血监督者"] = {
            tips = "{rt8}鲜血监督者{rt8}||{rt1}毒液箭雨{rt1}必须打断",
        },
    },
    ["矶石宝库"] = {
        -- BOSS部分
        ["E.D.N.A"] = {
            tips = "{rt8}E.D.N.A{rt8}||躲开地刺，BOSS读红条时分散，不要中2根，每次打掉2根地刺||T开大减伤吃第一个震地猛击，治疗注意刷T，并在第二个震地猛击前2秒驱散T DEBUFF||BOSS点名三个人放射线,会有箭头指引方向||被点名的人自己调整利用射线把场地上的石头炸掉。",
        },
        ["斯卡莫拉克"] = {
            tips = "{rt8}斯卡莫拉克{rt8}||安排人逐步每波打1到2个小怪，所有DPS吃球||虚空魔像，场地上召唤的水晶需要打掉||否则BOSS会定期吃掉水晶给自己上很厚的吸收盾||BOSS上盾AOE时开爆发打破盾。",
        },
        ["机械大师"] = {
            tips = "{rt8}机械大师{rt8}||全场放火阶段有一个方向固定没有火，站在没有火的通风口||打断矮子BOSS所有的熔铁之水||躲开机器人BOSS头前大火球（ZS可以盾反）大火球可以清地上的水||离开中间铁轨，躲开中间的泥头车||在机器人释放解体时，躲冲击波并开技能抬血||其中一人死掉另一人会开始全场持续AOE||需要平衡血量尽量一起死。",
        },
        ["虚空代言人艾里克"] = {
            tips = "{rt8}虚空代言人艾里克{rt8}||BOSS身边的两个虚空黑门，碰到就秒杀||被BOSS点名持续时间DOT||需要跑去黑门附近就会消失但别碰到黑门||BOSS点名放黑水尽量放边缘免得后期没地方站。",
        },
        -- 小怪部分
        ["阴森的虚空之魂"] = {
            tips = "{rt8}阴森的虚空之魂{rt8}||{rt1}咆哮恐惧{rt1}必须打断",
        },
        ["炉铸愈疗者"] = {
            tips = "{rt8}炉铸愈疗者{rt8}||{rt1}愈合{rt1}和{rt1}合金箭矢{rt1}尽量断，没有优先级",
        },
        ["熔炉装货工"] = {
            tips = "{rt8}熔炉装货工{rt8}||需要躲开头前，被点名开减伤",
        },
        ["咒炉塑石者"] = {
            tips = "{rt8}咒炉塑石者{rt8}||{rt1}爆地图腾{rt1}需要第一时间转火打掉",
        },
    },
    ["燧酿酒庄"] = {
        -- BOSS部分
        ["酿造大师阿德里尔"] = {
            tips = "{rt8}酿造大师阿德里尔{rt8}||打到半血会去柜台进入无敌状态||需要有人去场地边缘给暴怒顾客送酒安抚解除无敌。",
        },
        ["艾帕"] = {
            tips = "{rt8}艾帕{rt8}||会召唤三只小软一直试图碰到BOSS||如果碰到会给BOSS一个非常厚的吸收盾||需要坦克拉着BOSS风筝小软||其他人尽快击杀掉小软。",
        },
        ["本克·鸣蜂"] = {
            tips = "{rt8}本克·鸣蜂{rt8}||蜜蜂骑手，没什么特别在意的||召唤小蜂蜜控住杀掉即可。",
        },
        ["戈尔迪·底爵"] = {
            tips = "{rt8}戈尔迪·底爵{rt8}||场地上很多爆炸酒桶||BOSS点名坦克的击飞和点名非坦克的红圈都会引爆酒桶||产生四个方向爆炸波||利用这两个技能处理掉酒桶||否则BOSS后续大招AOE||会把所有剩余酒桶引爆造成全场伤害和满地火浪。",
        },
        -- 小怪部分
    },
    ["暗焰裂口"] = {
        -- BOSS部分
        ["老蜡须"] = {
            tips = "{rt8}老蜡须{rt8}||场地上很多小狗头人无仇恨追人||引到轨道上用矿车撞死||发红的轨道马上会来矿车。",
        },
        ["布雷炙孔"] = {
            tips = "{rt8}布雷炙孔{rt8}||被点名放火的人去场地边缘点亮蜡烛||BOSS的大招AOE跑到之前点亮的蜡烛一侧就能躲掉！",
        },
        ["蜡烛之王"] = {
            tips = "{rt8}蜡烛之王{rt8}||被BOSS点名飞刀了跑去蜡像后面档飞刀||被BOSS点名放黑圈了跑去蜡像旁边用黑圈炸掉蜡像||每轮五个蜡像尽量全部在本轮内处理完毕。",
        },
        ["黑暗之主"] = {
            tips = "{rt8}黑暗之主{rt8}||需要有人去场地边缘捡油给灯添燃料||BOSS点名黑圈的人要跑远几步避免黑圈炸灯||BOSS读条吹灯需要一个人把灯捡起来拿开别被吹到||BOSS读条召唤小怪可打断需要秒断。",
        },
        -- 小怪部分
    },

    ["塞兹仙林的迷雾"] = {
        -- BOSS 部分
        ["英格拉·马洛克"] = {
            tips = "{rt8}英格拉·马洛克{rt8}||起手先打大个子不要开爆发||DPS 保留爆到大个子变绿||躲开地板技能||注意打断小个子技能。",
        },
        ["唤雾者"] = {
            tips = "{rt8}唤雾者{rt8}||BOSS 在 70%/40%/10%血量时召唤小怪头顶有类似迷宫的机制。必须找到与众不同的那个并击杀它||分身有AOE技能，没找到正确的分身不要打，打错死了全图爆炸 AOE||躲开闪避球，秒人的||T 注意打断拍拍手技能，只有 T 能断||鬼抓人目标使用位移技能远离狐狸，全队有控制技能减速技能的帮忙控制狐狸，不能羊。",
        },
        ["特雷德奥瓦"] = {
            tips = "{rt8}特雷德奥瓦{rt8}||70/40BOSS 有护盾，打破护盾并打断 BOSS||躲开旋涡，击杀小怪||如果被连线，彼此远离||酸蚀排放技能开始时不要大距离移动，防止最后满地图绿圈。||被点名向 T 跑，把小怪拉到 T 跟前接怪。",
        },
        -- 小怪部分
        ["纱雾防御者"] = {
            tips = "{rt8}纱雾防御者{rt8}||迷宫区域。每个区域有四个出口，只有一个出口是正确的，进入错误出口会被强制遣返初始地||每个出口会有一个迷雾覆盖的柱子，站人会显示图案||图案属性分为有圈叶子、无圈叶子、有圈实心花、无圈实心花、有圈空心花、无圈空心花||需要从这六种元素中找到那个与其他图案不相同的一个图案||比如三个都是没圈的，一个有圈的，那么带圈的那个就是正确路线||三个都是花，一个是叶子，那么叶子就是正确的路线。||不会走的跟着别人走，自己不要乱进门",
        },
        ["纱雾守护者"] = {
            tips = "{rt8}纱雾守护者{rt8}||{rt1}心能挥砍{rt1}，点 T 高伤。需要覆盖大减伤，拉出蓝圈，晕断飞踢",
        },
        ["纱雾钉刺蛾"] = {
            tips = "{rt8}纱雾钉刺蛾{rt8}||{rt1}心能注入{rt1}，需要做为主目标击杀，奶注意驱散，没驱散开减伤离开人群",
        },
        ["纱雾照看者"] = {
            tips = "{rt8}纱雾照看者{rt8}||{rt1}滋养森林{rt1}必须打断",
        },
        ["纱雾塑形者"] = {
            tips = "{rt8}纱雾塑形者{rt8}||{rt1}木棘外壳{rt1}必须打断",
        },
        ["锥喉酸咽者"] = {
            tips = "{rt8}锥喉酸咽者{rt8}||打断{rt1}模拟抗性{rt1}和{rt1}再生鼓舞{rt1}两个技能||躲玩家绿圈和地板绿圈||{rt1}酸性新星{rt1} AOE 技能注意开减伤。",
        },
        ["锥喉鹿角巨虫"] = {
            tips = "{rt8}锥喉鹿角巨虫{rt8}||打断{rt1}模拟抗性{rt1}和{rt1}再生鼓舞{rt1}两个技能||躲玩家绿圈和地板绿圈||{rt1}酸性新星{rt1} AOE 技能注意开减伤。",
        },
        ["德鲁斯特收割者"] = {
            tips = "{rt8}德鲁斯特收割者{rt8}||{rt1}收割精魂{rt1}必须打断。",
        },
        ["德鲁斯特暗爪者"] = {
            tips = "{rt8}德鲁斯特暗爪者{rt8}||死亡全队易伤，强韧高层需分拨处理。",
        },
        ["德鲁斯特碎枝者"] = {
            tips = "{rt8}德鲁斯特碎枝者{rt8}||躲开{rt1}荆棘爆发{rt1}50%全队 AOE，分开集火打死，不要平均修血",
        },
    },
    ["通灵战潮"] = {
        -- BOSS 部分
        ["凋骨"] = {
            tips = "{rt8}凋骨{rt8}||将呕吐物对准远离团队的方向||远离被点吐息的目标||杀小怪||躲开地板技能。",
        },
        ["阿玛厄斯"] = {
            tips = "{rt8}阿玛厄斯{rt8}||打断 BOSS||打断 FS 小怪，聚好小怪快速杀掉||躲避亡者领域||BOSS 定期会吐息冰旋转，DPS N 提前躲避到 BOSS 身后。",
        },
        ["外科医生缝肉"] = {
            tips = "{rt8}外科医生缝肉{rt8}||中肉钩点名的，站到小怪和 BOSS 中间，让箭头对准 BOSS，读条到 1 的时候闪开||BOSS 被拉下来开爆发||即时 BOSS 不在台上也要用肉钩对准 BOSS 来打断凝视||BOSS 快上台子时中肉钩可提前瞄准台子||上矛。嗜血打 BOSS。",
        },
        ["缚霜者纳尔佐"] = {
            tips = "{rt8}缚霜者纳尔佐{rt8}|| 躲避漩涡。||如果有人被冰冻，尽快离开他们的圆圈。在大圆圈为空之前不要驱散。圈内有人驱散会传染||如果被传送走，尽快跑下通道开位移技能躲避地图白圈并击杀怪物||完成后点 NPC 上来加 100%暴击 40 秒，50 秒后没上来直接秒杀||当你回来时，站在边缘放置冰块。",
        },
        -- 小怪部分
        ["尸体收割者"] = {
            tips = "{rt8}尸体收割者{rt8}||{rt1}排干液体{rt1}必须打断",
        },
        ["缝合先锋"] = {
            tips = "{rt8}缝合先锋{rt8}||攻击叠加攻速需要优先击杀。入口两边有盾，开安抚拿，第一波怪后面有矛，留着打 BOSS",
        },
        ["凋零之袋"] = {
            tips = "{rt8}凋零之袋{rt8}||{rt1}死亡爆炸{rt1}稍微躲开治疗抬血。",
        },
        ["佐尔拉姆斯通灵师"] = {
            tips = "{rt8}佐尔拉姆斯通灵师{rt8}||{rt1}严酷命运{rt1}随机点名，需要开减伤远离人群放绿水",
        },
        ["骷髅劫掠者"] = {
            tips = "{rt8}骷髅劫掠者{rt8}||{rt1}恐怖顺劈{rt1}躲开头前，刺耳尖啸是群控加 AOE 技能，必须打断",
        },
        ["佐尔拉姆斯愈骨者"] = {
            tips = "{rt8}佐尔拉姆斯愈骨者{rt8}||{rt1}最终交易{rt1}接骨{rt1}尽量打断控制||上桥之前左边盾右边球，安抚拿。重要的 3 根矛一定要顺路拿到。留者打老三用。",
        },
        ["忠诚的造物"] = {
            tips = "{rt8}忠诚的造物{rt8}||{rt1}脊锤重压{rt1}需躲开地板否则秒杀",
        },
    },
    ["格瑞姆巴托"] = {
        -- BOSS 部分
        ["乌比斯将军"] = {
            tips = "{rt8}乌比斯将军{rt8}||避开地面上的橙色圆圈。||当房间变成紫色时，寻找安全通道。总共 4 条通道。||放土圈注意不要封路，尽量放边上||三连斩 T 覆盖好减伤",
        },
        ["铸炉之主索朗格斯"] = {
            tips = "{rt8}铸炉之主索朗格斯{rt8}||拉着靠墙，其他人靠外，中点名注意移动放岩浆||boss 更换武器时，他会造成大量的范围伤害。||第 1 阶段是斧头，所有人把锥形地板火引在一起。||第 2 阶段是双持，坦克克星，对坦克进行大治疗||第 3 阶段是双手锤 - 风筝阶段。||重复。",
        },
        ["达加·燃影者"] = {
            tips = "{rt8}达加·燃影者{rt8}||第 1 阶段杀死小怪||第 2 阶段杀死小怪并避开旋风（这可能会变得很疯狂，帮助你的治疗，避开障碍物）||暗影烈焰箭尽量断，熵能诅咒能驱就驱||被点名的远离火人，其他人转火减速击杀||P1 平伤，P2 爆发，躲风||Boss 50%倒地",
        },
        ["埃鲁达克"] = {
            tips = "{rt8}埃鲁达克,地狱公爵{rt8}||避开触手||当房间开始缩小时收缩，但在我们拥有的狭小圆圈内尽可能保持分散。||被点名紫色圈的三个人不要吃二重圈||DK 绿罩，ZS 盾反踩触手，进风眼后被点名的贴边||等 BOSS AOE 结束后，A 掉小怪。",
        },
        -- 小怪部分
        ["暮光唤地者"] = {
            tips = "{rt8}暮光唤地者{rt8}||{rt1}剧烈震颤{rt1}必须打断",
        },
        ["暮光毁灭者"] = {
            tips = "{rt8}暮光毁灭者{rt8}||{rt1}晦暗之风{rt1}是钢条 AOE+击飞，注意卡墙",
        },
        ["受伤的红色幼龙"] = {
            tips = "{rt8}受伤的红色幼龙{rt8}||炸弹丢给巡逻加龙和 BOSS 前面双监督者波次",
        },
        ["暮光欺诈者"] = {
            tips = "{rt8}暮光欺诈者{rt8}||暮光欺诈者的灼烧心智必须打断",
        },
        ["暮光烈焰粉碎者"] = {
            tips = "{rt8}暮光烈焰粉碎者{rt8}||躲开头前，T 注意覆盖减伤",
        },
        ["暮光执行者"] = {
            tips = "{rt8}暮光执行者{rt8}||叠加攻速，叠几层以后晕怪清层数",
        },
        ["暮光熔岩操纵使"] = {
            tips = "{rt8}暮光熔岩操纵使{rt8}||躲地板，圈不互套，变身远离，治疗抬血||最好跳过这个怪。",
        },
        ["暮光术士"] = {
            tips = "{rt8}暮光术士{rt8}||{rt1}暗影烈焰笼罩{rt1}必须打断",
        },
        ["无面腐蚀者"] = {
            tips = "{rt8}无面腐蚀者{rt8}||{rt1}腐蚀{rt1}需要中点名的人开减伤",
        },
    },
    ["围攻伯拉勒斯"] = {
        ["“屠夫”血钩"] = {
            tips = "{rt8}“屠夫”血钩{rt8}||迅速解决自带的小怪后转火 BOSS||撞军火。||避开地板技能。",
        },
        ["恐怖船长洛克伍德"] = {
            tips = "{rt8}恐怖船长洛克伍德{rt8}||避开地面上的东西。||击杀小怪。||注意给 BOSS 上高额的减速 Dot||当大炮掉落时捡起来并向 boss 开火。",
        },
        ["哈达尔·黑渊"] = {
            tips = "{rt8}哈达尔·黑渊{rt8}||避开漩涡。||放[潮汐涌动]时，站在雕像的另一侧。坦克被点头前不要面对人群！继续第二波潮水，躲好||近战放水记得给远程留位置，贴雕像放水，躲连续两波海潮，循环到死。",
        },
        ["维克戈斯"] = {
            tips = "{rt8}维克戈斯{rt8}||先杀攫握恐魔，再杀攻城恐魔。||避开水圈，治疗驱散时要注意！圈里不能有别人。||当触手在平台上被杀死时，跳进大炮并射击 Boss。||在第二个平台上重复此操作。||在船平台上重复此操作。||狐人、地精、侏儒等使用变身玩具，否则桥上会游泳",
        },
        -- 小怪部分
        ["铁潮塑浪者"] = {
            tips = "{rt8}铁潮塑浪者{rt8}||防水甲壳必须打断",
        },
        ["水鼠帮劫掠者"] = {
            tips = "{rt8}水鼠帮劫掠者{rt8}||恶臭喷吐必须打断",
        },
        ["水鼠帮唤风者"] = {
            tips = "{rt8}水鼠帮唤风者{rt8}||窒息止水必须打断",
        },
        ["水鼠帮海盗"] = {
            tips = "{rt8}水鼠帮海盗{rt8}||钢条香蕉风暴尽可能晕断，注意躲避地上香蕉",
        },
        ["艾什凡指挥官"] = {
            tips = "{rt8}艾什凡指挥官{rt8}||强化怒吼必须打断||艾泽里特炸药，中白圈的出人群",
        },
    },
    ["尼鲁巴尔王宫"] = {
        ["噬灭者乌格拉克斯"] = {
            tips = "{rt8}噬灭者乌格拉克斯{rt8}||被大圈标记的玩家找人分摊伤害||吃了分摊的要逃离 boss，避免被拖到 boss 下方||躲避网状物，并用绿色酸液圆圈清除它们||当能量降到 0 时，BOSS 会跳到平台中央，将所有人击退并消失进 P2||躲避 boss 冲锋，打出现的小怪||boss 出现后送它吃小怪尸体回能量进 P1",
        },
        ["血缚恐魔"] = {
            tips = "{rt8}血缚恐魔{rt8}||单阶段战斗，分内外场||没事不要去血池游泳，会死||受到 Boss 吐息的可以进内场杀小怪||分两队轮流进内场||内场小怪注意打断||被 boss 点名放圈的要边跑边放||能量 100 了会大圈炸人全团跑开",
        },
        ["席克兰"] = {
            tips = "{rt8}席克兰{rt8}||单阶段纯单体战斗||BOSS 会穿过玩家留下幽灵，放幽灵尽量靠近，节约场地||BOSS 点名几个玩家射光，就用光消除场地上的幽灵||幽灵消除了会留个圈，别踩",
        },
        ["拉夏南"] = {
            tips = "{rt8}拉夏南{rt8}||单阶段，boss 会两边飞||BOSS 点名放绿线，看好方向躲避||绿线会变成波浪，被点名的放到边边上去||小怪拉一起打，近战位不能没人，没人会 AOE",
        },
    },
}

-- 当前副本的 boss 集合
local currentInstanceBosses = {}

-- 跟踪当前显示的 BOSS 和手动隐藏状态
local currentBoss = nil
local manuallyHidden = false

-- 更新当前副本的 boss 集合
local function UpdateCurrentInstanceBosses()
    wipe(currentInstanceBosses)
    local instanceName = GetInstanceInfo()
    if BossData[instanceName] then
        for bossName, _ in pairs(BossData[instanceName]) do
            currentInstanceBosses[bossName] = true
        end
    end
end

-- 检查目标是否为已知的 boss
local function IsKnownBoss(target)
    return currentInstanceBosses[target] or false
end

-- 获取 boss 的攻略信息
local function GetBossTips(target)
    local instanceName = GetInstanceInfo()
    return BossData[instanceName] and BossData[instanceName][target] and BossData[instanceName][target].tips or nil
end

-- 创建攻略窗体
local tipsFrame = CreateFrame("Frame", "BossTipsFrame", EncounterJournal)
tipsFrame:SetSize(300, 200)
-- 设置窗体位置：在聊天框标签右上角，向右200像素，向上10像素
tipsFrame:SetPoint("TOPLEFT", EncounterJournal, "TOPRIGHT", 30, 0)
tipsFrame:SetFrameStrata("BACKGROUND")
tipsFrame:Hide()

-- 创建攻略文本
local tipsText = tipsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
tipsText:SetPoint("TOPLEFT", 10, -10)
tipsText:SetPoint("BOTTOMRIGHT", -10, 40)
tipsText:SetJustifyH("LEFT")
tipsText:SetJustifyV("TOP")

-- 创建半透明背景
local bg = tipsFrame:CreateTexture(nil, "BACKGROUND")
bg:SetAllPoints()
bg:SetColorTexture(0, 0, 0, 0.5)  -- 黑色背景，50%透明度


-- 修改 SendLongMessage 函数
local function SendLongMessage(message, chatType)
    -- 如果未传入聊天类型参数，则根据人数确定聊天类型
    if not chatType then
        chatType = determineChatType(message)
    end
    local parts = {strsplit("||", message)}
    -- 创建一个新的表，用于存储排序后的部分内容
    local sortedParts = {}
    for _, part in ipairs(parts) do
        local trimmedPart = strtrim(part)
        if trimmedPart ~= "" then
            table.insert(sortedParts, trimmedPart)
        end
    end
    -- 使用一个计数器来跟踪当前要发送的部分索引
    local index = 1
    local delay = 0.5
    local function sendNext()
        if index <= #sortedParts then
            SendChatMessage(sortedParts[index], chatType)
            index = index + 1
            C_Timer.After(delay, sendNext)
        end
    end
    sendNext()
end

-- 创建发送按钮
local sendButton = CreateFrame("Button", nil, tipsFrame, "UIPanelButtonTemplate")
sendButton:SetSize(80, 25)
sendButton:SetPoint("BOTTOMRIGHT", -30, 10)
sendButton:SetText("发送")
-- 修改发送按钮的点击脚本
sendButton:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        local target = UnitName("target")
        local tips = GetBossTips(target)
        if tips then
            SendLongMessage(tips)
        end
    elseif button == "RightButton" then
        local target = UnitName("target")
        local tips = GetBossTips(target)
        if tips then
            SendLongMessage(tips, "YELL")
        end
    end
end)

-- 确定聊天类型的函数，根据当前队伍人数判断
function determineChatType(message)
    local groupSize = GetNumGroupMembers()
    if groupSize > 0 and groupSize <= 5 then
        return "PARTY"
    elseif groupSize > 5 then
        return "RAID"
    else
        return "SAY"
    end
end


-- 创建收起/展开按钮
local toggleButton = CreateFrame("Button", nil, EncounterJournal, "UIPanelButtonTemplate")
toggleButton:SetSize(80, 40)
toggleButton:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", 200, 10)
toggleButton:SetText("收起")

toggleButton:SetScript("OnClick", function()
    if tipsFrame:IsShown() then
        tipsFrame:Hide()
        toggleButton:SetText("展开")
        toggleButton:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", 200, 10)
        manuallyHidden = true
    else
        tipsFrame:Show()
        toggleButton:SetText("收起")
        toggleButton:SetPoint("BOTTOMRIGHT", tipsFrame, "BOTTOMRIGHT",20, 10)
        manuallyHidden = false
    end
end)



-- 更新框体可见性
local function UpdateFrameVisibility()
    local target = UnitName("target")
    if IsKnownBoss(target) then
        if target ~= currentBoss then
            manuallyHidden = true  -- 默认设置为收起状态
            currentBoss = target
        end

        local tips = GetBossTips(target)
        if tips then
            -- 去除大括号内容
            tips = string.gsub(tips, "{[^}]*}", "")
            -- 将"||"替换为换行
            tips = string.gsub(tips, "||", "\n")
            local formattedTips = string.format("|cFFFFFF00%s|r\n\n%s", target, tips)
            tipsText:SetText(formattedTips)
        end

        toggleButton:Enable()
        toggleButton:SetText("隐藏")

        -- 注册右键点击事件处理函数,右键点击显示、展开、收起按钮使用大喊直接发送
        toggleButton:SetScript("OnMouseDown", function(self, button)
            if button == "RightButton" then
                local target = UnitName("target")
                local tips = GetBossTips(target)
                if tips then
                    SendLongMessage(tips, "YELL")
                end
            end
        end)

        if not manuallyHidden then
            tipsFrame:Show()
            toggleButton:SetPoint("BOTTOMRIGHT", tipsFrame, "BOTTOMRIGHT", 10, 10)
        else
            tipsFrame:Hide()
            toggleButton:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", 300, 10)
            toggleButton:SetText("展开")
        end
    else
        tipsFrame:Hide()
        currentBoss = nil
        toggleButton:SetText("无攻略")
        toggleButton:Disable()
        toggleButton:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", 200, 10)
    end

    toggleButton:Show() -- 始终显示按钮
end

-- 主事件处理函数
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        UpdateCurrentInstanceBosses()
        manuallyHidden = false
        currentBoss = nil
        UpdateFrameVisibility()
    elseif event == "PLAYER_TARGET_CHANGED" then
        UpdateFrameVisibility()
    end
end)

-- 注册事件
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
