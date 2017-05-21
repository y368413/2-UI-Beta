local _, R, U, _ = unpack(select(2, ...))
--[[
	>>>自定义添加时，要注意格式，注意逗号，注意字母大小写<<<
	ALL下面是对全职业通用的设置，其他情况请在自己职业下添加。当你添加时，要注意是否重复。
	各组别分别代表的是：
		Player Aura，是自己头像上偏小的buff组，用来监视那些不那么重要的buff；
		Special Aura，是自己头像上偏大的buff组，用来监视稍微重要的buff；
		Target Aura，是目标头像上的buff组，用来监视你循环中需要的debuff；
		Focus Aura，是焦点的buff组，用来监视焦点目标的buff及debuff；
		Spell Cooldown，是冷却时间监控组，用来监视饰品、戒指、技能CD等；
		Enchant Aura，是各种种族技能、药水、饰品触发的buff分组；
		Raid Buff，是团队重要buff（如嗜血，光环等等）以及被控制时的监控（如被羊被肾击等等）；
		Raid Debuff，是团队战斗中出现的debuff组，用来监控战斗中出现的点名等等；
		Warning，是目标身上需要注意的buff及debuff，可以用来监视BOSS的易伤、PVP对方的大招等等。

	数字编号含义：
		AuraID，支持BUFF和DEBUFF，在游戏中触发时，请鼠标移过去看看ID，或者自己查询数据库；
		SpellID，只是用来监视技能的CD，直接鼠标到技能上就可以看到该ID，大部分情况下与其触发后的BUFF/DEBUFF ID不一样；
		ItemID，用来监视物品的CD，例如炉石等等；
		SlotID，装备栏各部位的冷却时间，常用的有11/12戒指，6腰带，15披风，13/14饰品栏（仅主动饰品）；
		TotemID，监视图腾的持续时间，武僧的玄牛算1号图腾，萨满1-4对应4个图腾；
		UnitID，是你想监视的目标，支持宠物pet，玩家自身player，目标target和焦点focus；

	各种过滤方式：
		Caster，是法术的释放者，如果你没有标明，则任何释放该法术的都会被监视，例如猎人印记，元素诅咒等；
		Stack，是部分法术的层数，未标明则全程监视，有标明则只在达到该层数后显示，例如DK鲜血充能仅在10层后才提示；
		Value，为true时启用，用于监视一些BUFF/DEBUFF的具体数值，如牧师的盾，DK的血盾等等；
		Timeless，具体例如萨满的闪电盾，因为持续1个小时，没有必要一直监视时间，启用Timeless则只监视层数；
		Combat，启用时将仅在战斗中监视该buff，例如猎人的狙击训练，萨满的闪电护盾；
		Text，启用时将在BUFF图标下用文字提醒，优先级低于Value。比如中了某个BUFF需要出人群时，你就可以使用这个文字提醒；

	内置CD使用说明：
		--塞弗斯的秘密
		{IntID = 208052, Duration = 30, ItemID = 132452},
		IntID，计时条触发时的BuffID；
		Duration，自定义计时条的冷却/持续时间；
		ItemID，在计时条上显示的名称，如果不填写，就会直接使用触发时的Buff名称。
		这个功能不局限于监视内置CD，可以开发出很多其他用法。
]]

local SpellPoint = {"RIGHT", UIParent, "CENTER", -360, -160}
local DotPoint = {"LEFT", UIParent, "CENTER", 240, -155}

R.InternalCD = {
	Name = "InternalCD",
	Direction = "UP",
	Interval = 5,
	IconSize = 18,
	BarWidth = 150,
	Pos = {"BOTTOMRIGHT", UIParent, "BOTTOM", -425, 125},
	List = {
		--塞弗斯的秘密
		{IntID = 208052, Duration = 30, ItemID = 132452},
	},
}

R.AuraWatchList = {
   ["ALL"] = {
		{ Name = "提醒", Direction = "LEFT", Interval = 1, Mode = "ICON", IconSize = 60, Pos = {"CENTER", UIParent, "TOP", -26, -180},
			List = {
				     -- 冰霜之路
				    {AuraID = 3714, UnitID = "player"},
				    -- 爆燃冲刺
            {AuraID = 111400, UnitID = "player"},
            --漂浮
				    {AuraID = 111759, UnitID = "player"}, 
            -- XD急奔
            {AuraID = 1850, UnitID = "player"},
            -- 假死
            {AuraID = 5384, UnitID = "player"},
            -- 考古 就在脚下
            {AuraID = 210837, UnitID = "player"},
             -- 奉献-卡拉赞女人
            {AuraID =227848, UnitID = "player"},
            --血池
            {AuraID = 226510, UnitID = "target"},
            {AuraID = 226510, UnitID = "player"},
            -- 秘境死蛆
				    {AuraID = 209858, UnitID = "player"},
				    -- 艾萨拉 老一
				    {AuraID = 193698, UnitID = "player"},
				    -- DS老五脊背抓牢没
			    	{AuraID = 105563, UnitID = "player"},
			    	-- 嘲颅声望
			    	{AuraID = 173224, UnitID = "player"},
			    	{AuraID = 173226, UnitID = "player"},
            -- DZ潜行
            {AuraID = 1784, UnitID = "player"},
            --潜伏帷幕
				    {AuraID = 114018, UnitID = "player"},
            -- XD潜行
            {AuraID = 5215, UnitID = "player"},
            --狂奔怒吼
				    {AuraID =  77761, UnitID = "player"},
				    {AuraID =  77764, UnitID = "player"},
				    {AuraID = 106898, UnitID = "player"},
            -- 德拉诺 暴击 区域
            {AuraID = 178776, UnitID = "player"},
            -- 圣光之速
				    {AuraID = 85499, UnitID = "player"},
				    -- 禅意飞行
            {AuraID = 125883, UnitID = "player"},
				    --硫磺烈火
				    {AuraID = 108683, UnitID = "player"},
				    --伪装
				    {AuraID =  51755, UnitID = "player"},
				    --火箭靴
				    {AuraID =  54861, UnitID = "player"},   
				    -- 炼狱
            {AuraID = 116888, UnitID = "player"},
            -- 晕 乌特加德之巅boss
            {AuraID = 51750, UnitID = "player"},
			},
		},
		{ Name = "吸收", Direction = "RIGHT", Interval = 1, Mode = "TEXT", IconSize = 16, Pos = {"CENTER", UIParent, "CENTER",-145, -80},
			List = {
            -- 无视痛苦
			    	{AuraID = 190456, UnitID = "player", Value = true},
			    	--金钟罩
			    	{AuraID = 115295, UnitID = "player", Value = true},
			    	--盾牌屏障
			    	{AuraID = 112048, UnitID = "player", Value = true},
			    	--圣洁护盾
			    	{AuraID = 20925, UnitID = "player", Value = true},    	
			    	--鲜血护盾
			    	{AuraID = 77535, UnitID = "player", Value = true},
			    	--灵魂屏障
				    {AuraID = 227225, UnitID = "player", Value = true},
				    --秩序堡垒
				    {AuraID = 209388, UnitID = "player", Value = true},
				    --寒冰护体
				    {AuraID =  11426, UnitID = "player", Value = true},
				    --烈焰护体
				    {AuraID = 235313, UnitID = "player", Value = true},
				    --暴雨图腾
				    {AuraID = 157504, UnitID = "player", Value = true},
			},
		},	
		{ Name = "盾", Direction = "RIGHT", Interval = 1, Mode = "TEXT", IconSize = 21, Pos = {"CENTER", UIParent, "CENTER",45, -80},
			List = {
					  -- 玄牛雕像
			    	{AuraID = 115315, UnitID = "player", Value = true},
			    	-- 永恒之火
            {AuraID = 156322, UnitID = "player", Value = true},
				    -- 寒冰护体
				    {AuraID =  11426, UnitID = "player", Value = true, Combat = true},
				    -- 真言术:盾(MS)
            {AuraID = 17, UnitID = "player", Value = true},
            --反魔法护罩
				    {AuraID =  48707, UnitID = "player", Value = true},
				    --灵魂榨取
				    {AuraID =  108366, UnitID = "player", Value = true, Combat = true},
				    --醉拳
				    {AuraID =  124275, UnitID = "player", Value = true},
				    --溢出
            {AuraID = 221772, UnitID = "player", Value = true}, 
            --沙瓦迪卡
            {AuraID = 207472, UnitID = "player", Value = true},
			},
		},
		{ Name = "Drog", Direction = "RIGHT", Interval = 1, Mode = "ICON", IconSize = 26, Pos = {"CENTER", UIParent, "TOP", -380, -43},
			List = {
            --300%
			    	{AuraID =  189375, UnitID = "player"},
			    	{AuraID =  178119, UnitID = "player"},
			    	{AuraID =  188454, UnitID = "player"},
			    	{AuraID =  62574, UnitID = "player"},
			    	{AuraID =  229074, UnitID = "player"},
			},
		},	
		{ Name = "职业", Direction = "RIGHT", Interval = 5, Mode = "ICON", IconSize = 36, Pos = {"CENTER", UIParent, "CENTER", -103, -260},
			List = {
		    --强势连击
				{AuraID = 193356, UnitID = "player", Text = "连击"},
				--暗鲨涌动
				{AuraID = 193357, UnitID = "player", Text = "爆击"},
				--大乱斗
				{AuraID = 193358, UnitID = "player", Text = "攻速"},
				--双巧手
				{AuraID = 193359, UnitID = "player", Text = "冷却"},	
				--埋藏的宝藏
				{AuraID = 199600, UnitID = "player", Text = "能量"},
				--骷髅黑帆
				{AuraID = 199603, UnitID = "player", Text = "军刀"},
							  --恐惧之刃诅咒
				{AuraID = 202665, UnitID = "player"},
				{AuraID = 197496, UnitID = "player"},
				{AuraID = 197497, UnitID = "player"},
				{AuraID = 197498, UnitID = "player"},
								--死亡标记
				{AuraID = 212283, UnitID = "player"},
								--奉献
				{AuraID = 188370, UnitID = "player"},
				--金创药
				{AuraID = 134563, UnitID = "player"},
				--独来独往
				{AuraID = 164273, UnitID = "player"},
				--风火雷电
				{AuraID = 137639, UnitID = "player"},
				--陷阱发射器
				{AuraID =  77769, UnitID = "player"},
				--陷阱发射器
				{AuraID = 118694, UnitID = "player"},
				--乱射
				{AuraID = 194386, UnitID = "player"},
				--虚空形态
				{AuraID =  194249, UnitID = "player"},
				--丰饶
				{AuraID = 207640, UnitID = "player"},
				-- 魔典:恶魔牺牲
        {AuraID =108503, UnitID = "player"},
        --圣光道标
				{AuraID =  53563, UnitID = "player"},
        --信仰道标
				{AuraID = 156910, UnitID = "player"},
				--灵魂链接
				{AuraID = 108446, UnitID = "player"},
				 --冰霜之路
				{AuraID =   3714, UnitID = "player"},
				 --咒术洪流
				{AuraID = 116267, UnitID = "player"},
				--魔宠
				{AuraID = 210126, UnitID = "player"},
				 -- 莫罗斯的著名抹布
        {AuraID = 176438, UnitID = "player"},
        --圣盾术
				{AuraID =    642, UnitID = "player"},
				--闪电护盾
				{AuraID =    324, UnitID = "player", Timeless = true, Combat = true},
			  -- 枯法者
        {AuraID = 227261, UnitID = "player"},
        --被折磨的灵魂
				{AuraID = 216695, UnitID = "player"},
			},
		},		
		{ Name = "Hot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 21, BarWidth = 60, Pos = {"LEFT", UIParent, "CENTER", 360, -160},
			List = {
         -- 影之哀伤
            -- 灵魂碎片
            {AuraID = 71905, UnitID = "player"},
            -- 森罗万象
            {AuraID = 73422, UnitID = "player"},
         -- 战场
            -- 狂暴
            {AuraID = 23505, UnitID = "player"},
            {AuraID = 24378, UnitID = "player"},
            -- 狂暴（巨魔种族天赋）
            {AuraID = 26297, UnitID = "player"},
            -- 血性狂怒（兽人种族天赋）
				    {AuraID =  20572, UnitID = "player"},
				    {AuraID =  33697, UnitID = "player"},
            -- 加速
            {AuraID = 23451, UnitID = "player"},
            {AuraID = 23978, UnitID = "player"},
            -- 恢复
            {AuraID = 23493, UnitID = "player"},
            {AuraID = 24379, UnitID = "player"},
         -- 工程学
            -- 神经元弹簧
            {AuraID = 96228, UnitID = "player"},
            {AuraID = 96229, UnitID = "player"},
            {AuraID = 96230, UnitID = "player"},
            -- 地精滑翔器
            {AuraID =126389, UnitID = "player"},
            -- 滑水推进器
            {AuraID =131459, UnitID = "player"},
            -- 氮气推进器
            {AuraID = 54861, UnitID = "player"},
            -- 接地离子护盾
            {AuraID = 82627, UnitID = "player"},
            -- 粒子护盾
            {AuraID = 173260, UnitID = "player"},
            -- 相位指
            {AuraID =108788, UnitID = "player"},
            -- 隐形场
            {AuraID = 82820, UnitID = "player"},
            -- 装甲护网
            {AuraID = 82387, UnitID = "player"},
            -- 灵活偏转碟
            {AuraID = 82176, UnitID = "player"},
            -- 超级加速器
            {AuraID = 54758, UnitID = "player"},
            -- 降落伞
            {AuraID = 55001, UnitID = "player"},
            
            -- 艾维娜之羽
            {AuraID = 176286, UnitID = "player"},
         -- 职业
            -- 潜伏帷幕
            {AuraID =115834, UnitID = "player"},
            -- 护甲
            {AuraID =138852, UnitID = "player"},
            -- 寒冰结界
            {AuraID =111264, UnitID = "player"},
            -- 平心之环
            {AuraID =116844, UnitID = "player"},
            -- 神圣之火
            {AuraID =114163, UnitID = "player"},
            -- 氤氲之雾
            {AuraID =132120, UnitID = "player"},
            -- 邪恶狂热
            {AuraID = 49016, UnitID = "player"},
            -- 警戒
            {AuraID =114030, UnitID = "player"},
            -- 英勇
            {AuraID = 32182, UnitID = "player"},
            -- 嗜血
            {AuraID = 2825, UnitID = "player"},
            -- 时间扭曲
            {AuraID = 80353, UnitID = "player"},
            -- 熔岩犬：远古狂乱
            {AuraID = 90355, UnitID = "player"},
            -- 守护之魂
            {AuraID = 47788, UnitID = "player"},
            --痛苦压制
				    {AuraID =  33206, UnitID = "player"},
            -- 愈合祷言
            {AuraID = 41635, UnitID = "player"},
            -- 牺牲之手
            {AuraID = 6940, UnitID = "player"},
            -- 自由之手
            {AuraID = 1044, UnitID = "player"},
            -- 保护之手
            {AuraID = 1022, UnitID = "player"},
            -- 拯救之手
            {AuraID = 1038, UnitID = "player"},
            -- 永恒之火
            {AuraID = 156322, UnitID = "player"},
            -- 反魔法领域
            {AuraID = 50461, UnitID = "player"},
            -- 反魔法领域
            {AuraID = 51052, UnitID = "player"},
            -- 反魔法领域
            {AuraID = 145629, UnitID = "player"},
            -- 颅骨战旗
            {AuraID =114206, UnitID = "player"},
            -- 法力之潮
            {AuraID = 16191, UnitID = "player"},
            -- 治疗之潮
            {AuraID = 108280, UnitID = "player"},
            -- 虔诚光环
            {AuraID = 31821, UnitID = "player"},
            -- 金钟罩
            {AuraID =136707, UnitID = "player"},
            -- 嫁祸诀窍
            {AuraID = 57933, UnitID = "player"},
            -- 风暴之鞭图腾
            {AuraID =120676, UnitID = "player"},
            -- 激活
            {AuraID = 29166, UnitID = "player"},
            -- 宁静
            {AuraID = 740, UnitID = "player"},
            -- 天堂之羽
            {AuraID =121557, UnitID = "player"},
            -- 真言术:壁垒
            {AuraID = 62618, UnitID = "player"},
            -- 身心合一
            {AuraID = 65081, UnitID = "player"},
            -- 集结呐喊
            {AuraID = 97463, UnitID = "player"},
            -- 缓落术
            {AuraID = 130, UnitID = "player"},
            -- 牺牲咆哮
            {AuraID = 53480, UnitID = "player"},
            -- 群体反射
            {AuraID =114028, UnitID = "player"},
            -- 振奮咆哮
            {AuraID =97462, UnitID = "player"},
            -- 振奮咆哮
            {AuraID =97463, UnitID = "player"},
            -- 援护
            {AuraID = 3411, UnitID = "player"},
            -- 大地之盾
            {AuraID = 974, UnitID = "player"},
            -- 治疗之泉图腾
            {AuraID =119523, UnitID = "player"},
            -- 灵魂链接图腾
            {AuraID = 98007, UnitID = "player"},
            -- 灵魂链接图腾
            {AuraID = 98008, UnitID = "player"},
           	--风行图腾
				    {AuraID = 114896, UnitID = "player"},
            -- 血魔之握
            {AuraID = 108199, UnitID = "player"},
            -- 战栗图腾
            {AuraID = 8143, UnitID = "player"},
            -- 风行图腾
            {AuraID = 108273, UnitID = "player"},
            -- 无尽呼吸
            {AuraID = 5697, UnitID = "player"},
            {AuraID =104202, UnitID = "player"},
            -- 捍卫
            {AuraID =114029, UnitID = "player"},
            {AuraID = 46947, UnitID = "player"},
         -- PET   
            -- 治疗宠物
            {AuraID = 136, UnitID = "pet"},
            -- 急奔
            {AuraID = 61684, UnitID = "pet"},
            -- 控制亡灵
            {AuraID =111673, UnitID = "pet"},
            -- 蜷缩
            {AuraID = 91838, UnitID = "pet"},
            -- 腐臭壁垒
            {AuraID = 91837, UnitID = "pet"},
            -- 黑暗突变
            {AuraID = 63560, UnitID = "pet"},
            -- 追杀
            {AuraID = 30151, UnitID = "pet"},
            -- 生命通道
            {AuraID =104220, UnitID = "pet"},
            -- 愤怒风暴
            {AuraID =115831, UnitID = "pet"},
            -- 暗影壁垒
            {AuraID = 17767, UnitID = "pet"},
            -- 次级隐形术
            {AuraID = 7870, UnitID = "pet"},
            -- 奴役恶魔
            {AuraID = 1098, UnitID = "pet"},  
            -- 魔刃风暴
				    {AuraID =  89751, UnitID = "pet"},
				    -- 愤怒风暴
				    {AuraID = 115831, UnitID = "pet"},
				    --虚空鳐：虚空之风
				    {AuraID = 160452, UnitID = "player"},
				    --鼓
				    {AuraID = 178207, UnitID = "player"},
				    --神圣赞美诗
				    {AuraID =  64843, UnitID = "player"},
				    --真言术：障
				    {AuraID =  81782, UnitID = "player"},
				    --烟雾弹
				    {AuraID =  88611, UnitID = "player"},
				    --五气归元
				    {AuraID = 115310, UnitID = "player"},
				    --蟠龙之息
				    {AuraID = 157535, UnitID = "player"},
				    --作茧缚命
				    {AuraID = 116849, UnitID = "player"},
				    --纯净之手
				    {AuraID = 114039, UnitID = "player"},
				    --铁木树皮
				    {AuraID = 102342, UnitID = "player"},
				    -- 剑刃风暴
            {AuraID = 46924, UnitID = "player"},
			},
		},
    { Name = "Fuck", Direction = "UP", Interval = 2,  Mode = "BAR2", IconSize = 28, BarWidth = 80, Pos = {"RIGHT", UIParent, "CENTER", -240, -155},
      List = {
      --橙
			  {AuraID = 224706, UnitID = "player"},
			  {AuraID = 224149, UnitID = "player"},
			  {AuraID = 207635, UnitID = "player"},
			  {AuraID = 207589, UnitID = "player"},
			  {AuraID = 192925, UnitID = "player"},
			  {AuraID = 208693, UnitID = "player"},
			  {AuraID = 235027, UnitID = "player"},
			  --橙披风 扎克斯的灭绝令
			  {AuraID = 235027, UnitID = "player"},
			  --橙戒指 双生子的痛苦之触
			  {AuraID = 235027, UnitID = "player"},
			  --滑板鞋 
			  {AuraID = 236431, UnitID = "player"},
			  --套装
			  {AuraID = 224151, UnitID = "player"},
			    --FS 2
			  {AuraID = 211399, UnitID = "player"},
			    --FS 4
			  {AuraID = 157644, UnitID = "player"},
				--lr
				{AuraID = 208913, UnitID = "player"},
				{AuraID = 225726, UnitID = "player"},								--野性强化
				{AuraID = 225730, UnitID = "player"},								--奥术附魔
				{AuraID = 225729, UnitID = "player"},								--野性强化
				{AuraID = 235712, UnitID = "player"},
      	--坦克传家宝
			  {AuraID = 202052, UnitID = "player", Value = true},
			  {AuraID = 53365, UnitID = "player"},  --不洁之力
			    	--................
				{AuraID = 228142, UnitID = "player"},
								--
				{AuraID = 200656, UnitID = "player", Value = true},
				--
				{AuraID = 200657, UnitID = "player", Value = true},
				 --术士牺牲盾
				{AuraID =  108416, UnitID = "player", Value = true},
				--抗魔联军调和
				{AuraID = 242586, UnitID = "player"},
    ------>LEG药水附魔
				--致命优雅，远程
				{AuraID = 188027, UnitID = "player"},
				--上古战神，近战
				{AuraID = 188028, UnitID = "player"},
				--不屈药水，坦克
				{AuraID = 188029, UnitID = "player"},
				--延时药水
				{AuraID = 229206, UnitID = "player"},
				--利爪之印
				{AuraID = 190909, UnitID = "player"},
				--厚皮之印
				{AuraID = 228399, UnitID = "player"},
				--搏击伟哥
				{AuraID = 230039, UnitID = "player"},
		------>LEG饰品
		    --节拍器
				{AuraID = 225719, UnitID = "player"},
				--黑暗低语
				{AuraID = 225774, UnitID = "player"}, --邪罪契约
				{AuraID = 225776, UnitID = "player"}, --恶魔代价
				--地狱火之书
				{AuraID = 215816, UnitID = "player"},
				--罗宁护腕
				{AuraID = 208081, UnitID = "player"},
		    --就餐铃(随机属性5000)
				{AuraID = 230102, UnitID = "player", Text = "暴击"},
				{AuraID = 230103, UnitID = "player", Text = "急速"},
				{AuraID = 230104, UnitID = "player", Text = "精通"},
				{AuraID = 230105, UnitID = "player", Text = "全能"},
				--回归打击
				{AuraID = 225736, UnitID = "player"},
				--苏拉玛套装，爆击
				{AuraID = 224151, UnitID = "player"},
				--黑暗打击，+伤害
				{AuraID = 215658, UnitID = "player"},
				--黑暗打击，+护盾
				{AuraID = 215659, UnitID = "player"},
				--专注闪电，+精通
				{AuraID = 215632, UnitID = "player"},
				--混沌能量，+力量/敏捷
				{AuraID = 214831, UnitID = "player"},
				--瓦拉加尔之道，+主属性
				{AuraID = 215956, UnitID = "player"},
				--召云聚气
				{AuraID = 215294, UnitID = "player"},
				--飓风之瓶
				{AuraID = 215294, UnitID = "player"},
				--魔暴龙
				{AuraID = 226040, UnitID = "player"},
								--血性狂乱
				{AuraID = 221796, UnitID = "player"},
				--山峰形态，+护盾
				{AuraID = 214423, UnitID = "player", Value = true},
				--安格博达的挽歌
				{AuraID = 214807, UnitID = "player"},
				--席瓦尔的哀嚎
				{AuraID = 214803, UnitID = "player"},
				--因格瓦尔的嚎叫
				{AuraID = 214802, UnitID = "player"},
				--蛮荒诸神之怒，+生命护甲
				{AuraID = 221695, UnitID = "player"},
				--恐惧附肢
				{AuraID = 222166, UnitID = "player"},
				--增速
				{AuraID = 214128, UnitID = "player"},
				--暗夜井能量
				{AuraID = 214572, UnitID = "player"},
				{AuraID = 214577, UnitID = "player", Value = true}, 
				--艾塔乌斯的星图
				{AuraID = 225749, UnitID = "player"},
				{AuraID = 225752, UnitID = "player"},
				{AuraID = 225753, UnitID = "player"},
				--幻影回想(50%减伤)
				{AuraID = 222479, UnitID = "player"},
				--赛福斯的秘密(通用戒指)
				{AuraID = 208052, UnitID = "player"},
				--诺甘农的预见
				{AuraID = 236430, UnitID = "player"},
				--吸血传染
				{AuraID = 221805, UnitID = "player"},
				--暗影打击
				{AuraID = 238499, UnitID = "player"},
				--蜂拥之影
				{AuraID = 235801, UnitID = "player"},
				--暗影大师
				{AuraID = 235800, UnitID = "player"},
				--艾露恩之光，加主属性
				{AuraID = 215648, UnitID = "player"},
				--坍缩，戒指
				{AuraID = 234143, UnitID = "player"},
				--净化的远古祝福
				{AuraID = 222517, UnitID = "player"},
				{AuraID = 222518, UnitID = "player"},
				{AuraID = 222519, UnitID = "player"},
				--焦镜
				{AuraID = 225726, UnitID = "player"},
				{AuraID = 225729, UnitID = "player"},
				{AuraID = 225730, UnitID = "player"},
				--下冲气流
				{AuraID = 214342, UnitID = "player"},
				--美味蛋糕
				{AuraID = 225723, UnitID = "player"},
				--暗月不朽
				{AuraID = 191624, UnitID = "player"},
				{AuraID = 191625, UnitID = "player"},
				{AuraID = 191626, UnitID = "player"},
				{AuraID = 191627, UnitID = "player"},
				{AuraID = 191628, UnitID = "player"},
				{AuraID = 191629, UnitID = "player"},
				{AuraID = 191630, UnitID = "player"},
				{AuraID = 191631, UnitID = "player"},
				--PVP饰品，+敏捷
				{AuraID = 190026, UnitID = "player"},
				--PVP饰品，+全能
				{AuraID = 170397, UnitID = "player"},
				--海洋污染
				{AuraID = 215670, UnitID = "target", Caster = "player"},
				--野蛮强击，15%易伤
				{AuraID = 214169, UnitID = "target", Caster = "player"},
				--晦暗灵魂，目标伤害降低
				{AuraID = 222209, UnitID = "target", Caster = "player"}, 
				--烈焰花环
				{AuraID = 230259, UnitID = "target", Caster = "player"},
				--阳光坍缩
				{AuraID = 225746, UnitID = "target", Caster = "player"},

		------>WOD附魔
				--血环之印
				{AuraID = 173322, UnitID = "player"},
				--雷神之印
				{AuraID = 159234, UnitID = "player"},
				--战歌之印
				{AuraID = 159675, UnitID = "player"},
				--霜狼之印
				{AuraID = 159676, UnitID = "player"},
				--影月之印
				{AuraID = 159678, UnitID = "player"},
				--黑石之印
				{AuraID = 159679, UnitID = "player"},
				--瞄准镜
				{AuraID = 156055, UnitID = "player"},--溅射
				{AuraID = 156060, UnitID = "player"},--爆击
				{AuraID = 173288, UnitID = "player"},--精通
				--橙戒
				{AuraID = 177161, UnitID = "player"},--敏捷690
				{AuraID = 177172, UnitID = "player"},--敏捷710
				{AuraID = 177159, UnitID = "player"},--智力690
				{AuraID = 177176, UnitID = "player"},--智力710
				{AuraID = 177160, UnitID = "player"},--力量690
				{AuraID = 177175, UnitID = "player"},--力量710
				{AuraID = 187616, UnitID = "player"},--尼萨姆斯，智力
				{AuraID = 187617, UnitID = "player"},--萨克图斯，坦克
				{AuraID = 187618, UnitID = "player"},--伊瑟拉鲁斯，治疗
				{AuraID = 187619, UnitID = "player"},--索拉苏斯，力量
				{AuraID = 187620, UnitID = "player"},--玛鲁斯，敏捷
		------>WOD药水以及饰品
				--德拉诺敏捷
				{AuraID = 156423, UnitID = "player"},
				--德拉诺智力
				{AuraID = 156426, UnitID = "player"},
				--德拉诺力量
				{AuraID = 156428, UnitID = "player"},
				--德拉诺护甲
				{AuraID = 156430, UnitID = "player"},
				--炼金石
				{AuraID =  60233, UnitID = "player"},--敏捷
				{AuraID =  60229, UnitID = "player"},--力量
				{AuraID =  60234, UnitID = "player"},--智力
        ---->坦克
			    	--暴击20s  骑士徽章
			    	{AuraID = 162917, UnitID = "player"},
			    	--暴击10s  岩心雕像
			    	{AuraID = 176982, UnitID = "player"},
			    	--急速10s  
			    	{AuraID = 176937, UnitID = "player"},
			    	--使用，生命上限20s  齐步的愚忠
			    	{AuraID = 176460, UnitID = "player"},
			    	--使用，精通20s  普尔的盲目之眼
			    	{AuraID = 176876, UnitID = "player"},
			    	--精通10s  石化食肉孢子
			    	{AuraID = 165824, UnitID = "player"},
			    	--护甲10s  不眠奥术精魄
			    	{AuraID = 177053, UnitID = "player"},
			      -- 无懈合击石板
            {AuraID = 176873, UnitID = "player"},
		    		--精通10s  爆裂熔炉之门
				    {AuraID = 177056, UnitID = "player"},
			    	--递增急速10s 总击护符
			    	{AuraID = 177102, UnitID = "player"},
		   ---->力量dps
		    	  -- 战争之颅
            {AuraID = 162915, UnitID = "player"},
			    	--全能10s 活体之山微利
			    	{AuraID = 176974, UnitID = "player"},
			    	--使用，全能15s
			    	{AuraID = 170397, UnitID = "player"},
			    	--精通10s
			    	{AuraID = 176935, UnitID = "player"},
			    	--使用，力量10s  奇亚诺思的剑鞘
			    	{AuraID = 177189, UnitID = "player"},
			    	--暴击10s 泰克图斯的脉动之心
			    	{AuraID = 177040, UnitID = "player"},
			    	--使用，溅射15s 抽搐暗影之瓶
			    	{AuraID = 176874, UnitID = "player"},
			    	--精通10s 尖啸之魂号角
			    	{AuraID = 177042, UnitID = "player"},
			    	--递增暴击10s 熔炉主管的徽记
			    	{AuraID = 177096, UnitID = "player"},
		 ---->敏捷dps
				--暴击20s
				{AuraID = 162915, UnitID = "player"},
				--溅射10s 黑心执行者勋章
				    {AuraID = 176984, UnitID = "player"},
			    	--精通10s
				    {AuraID = 176939, UnitID = "player"},
				    --使用，敏捷20s  双面幸运金币
				    {AuraID = 177597, UnitID = "player"},
				    --溅射10s  毁灭的鳞
				    {AuraID = 177038, UnitID = "player"},
				    --急速10s  多肉龙脊奖章
				    {AuraID = 177035, UnitID = "player"},
				    --使用，溅射20s  跃动的山脉之心
				    {AuraID = 176878, UnitID = "player"},
		        --递增暴击10s 蜂鸣黑铁触发器
				    {AuraID = 177067, UnitID = "player", Value = true},
				--PVP饰品
				    {AuraID = 126707, UnitID = "player"},
				--使用，精通
				    {AuraID = 165485, UnitID = "player"},
			  ---->法系dps
				    --暴击20s  睡魔之袋
				    {AuraID = 162919, UnitID = "player"},
				    --急速10s  狂怒之心护符
				    {AuraID = 176980, UnitID = "player"},
				    --使用，急速20s  虚无碎片
				    {AuraID = 176875, UnitID = "player"},
				    --精通10s
				    {AuraID = 176941, UnitID = "player"},
				    --使用，法强20s  库普兰的清新
				    {AuraID = 177594, UnitID = "player"},
				    --暴击10s  蜥蜴人灵魂容器
				    {AuraID = 177046, UnitID = "player"},
				    --急速10s  达玛克的无常护符
				    {AuraID = 177051, UnitID = "player"},
				    --递增暴击10s  黑铁微型坩埚
				    {AuraID = 177081, UnitID = "player"},
			    ---->治疗
				    --精神10s 羽翼沙袋
				    {AuraID = 162913, UnitID = "player"},
				    --精通10s  咏然蜡烛
				    {AuraID = 176943, UnitID = "player"},
				    --使用，法力值20s
				    {AuraID = 177592, UnitID = "player"},
				    --暴击10s  完美的活性蘑菇
				    {AuraID = 176978, UnitID = "player"},
				    --使用，急速20s  腐蚀治疗徽章
				    {AuraID = 176879, UnitID = "player"},
				    --溅射10s  元素师的屏蔽护符
				    {AuraID = 177063, UnitID = "player"},
				    --精神10s  铁刺狗玩具
				    {AuraID = 177060, UnitID = "player"},
				    --递增急速10s  自动修复灭菌器
				    {AuraID = 177086, UnitID = "player"},
		------>6.2饰品
			---->敏捷
				--触发敏捷
				{AuraID = 183926, UnitID = "player"},
				--储能爆炸
				{AuraID = 184293, UnitID = "player"},
			---->力量
				--触发力量
				{AuraID = 183941, UnitID = "player"},
				--阿克狂暴战
				{AuraID = 185230, UnitID = "player"},
				--阿克惩戒骑
				{AuraID = 185102, UnitID = "player"},
			---->法系
				--阿克暗牧
				{AuraID = 184915, UnitID = "player"},
				--阿克毁灭
				{AuraID = 185229, UnitID = "player"},
				--触发智力
				{AuraID = 183924, UnitID = "player"},
				--AOE饰品
				{AuraID = 184073, UnitID = "player"},
			---->治疗
				--阿克奶骑
				{AuraID = 185100, UnitID = "player"},
				--阿克戒律牧
				{AuraID = 184912, UnitID = "player"},
				--使用加爆击
				{AuraID = 183929, UnitID = "player"},
				--吸血效果
				{AuraID = 184671, UnitID = "player"},
			---->坦克
				--触发精通
				{AuraID = 183931, UnitID = "player"},
				--触发耐力
				{AuraID = 184770, UnitID = "player"},
 			---->传家宝饰品
				--力量
				{AuraID = 201405, UnitID = "player"},
				--敏捷
				{AuraID = 201408, UnitID = "player"},
				--智力
				{AuraID = 201410, UnitID = "player"},
				
 			---->职业				
				--生存本能
				{AuraID = 61336, UnitID = "player"},
								--铁鬃
				{AuraID = 192081, UnitID = "player"},	
				--群兽奔腾
				--冰冷血脉
				{AuraID = 12472, UnitID = "player"},
				--征伐
				{AuraID = 231895, UnitID = "player"},
				            				--激怒
				{AuraID = 184362, UnitID = "player"},
            				--剑刃乱舞
				{AuraID =  13877, UnitID = "player"},

				-- DK套装效果
            -- 残酷之握
            {AuraID =131547, UnitID = "player"},
            -- 符文归还
            {AuraID = 61258, UnitID = "player"},
            -- DPS 2T16
            {AuraID = 144901, UnitID = "player"},
            -- T 2T16
            {AuraID = 144948, UnitID = "player"},
         -- 术士T16
            -- 炽燃之怒
            {AuraID = 145085, UnitID = "player"},
            -- 术士T16 - 毁灭浩劫
            {AuraID = 145075, UnitID = "player"},
            -- 术士T16 - 灰烬精通
            {AuraID = 145164, UnitID = "player"},
         -- 牧师T16   
            --宽仁之心，4T16
				    {AuraID = 145336, UnitID = "player"},
				    --虔诚信仰，2T16
				    {AuraID = 145327, UnitID = "player"},
				 -- 骑士
				    --十字军之怒（2T17）
				    {AuraID = 165442, UnitID = "player"},
				    --炽热蔑视（4T17）
				    {AuraID = 166831, UnitID = "player"},
				    --圣光防御者（4T17）
				    {AuraID = 167742, UnitID = "player"},
				    --元素专注（元素2T17）
				    {AuraID = 167205, UnitID = "player", Value = true},
				    --元素和谐（恢复4T17）
				    {AuraID = 167703, UnitID = "player", Value = true},
				    --闪电漩涡（元素4T18）
				    {AuraID = 189078, UnitID = "player"},
				    {AuraID = 189063, UnitID = "player", Value = true},
				 -- XD    
				    --灵龙之赐（鸟德2T18）
				   {AuraID = 188086, UnitID = "player"},
				 -- FS
				   --连锁反应
				   {AuraID = 195418, UnitID = "player"},
				--时间扭曲
				{AuraID =  80353, UnitID = "player"},
				--嗜血
				{AuraID =   2825, UnitID = "player"},
				--熔岩犬：远古狂乱
				{AuraID =  90355, UnitID = "player"},
				--虚空鳐：虚空之风
				{AuraID = 160452, UnitID = "player"},
				--鼓
				{AuraID = 178207, UnitID = "player"},
				--高山战鼓
				{AuraID = 230935, UnitID = "player"},
				--青铜龙的祝福
				{AuraID = 102364, UnitID = "player"},
				--火箭靴
				{AuraID =  54861, UnitID = "player"},
				--白骨之盾
				{AuraID = 195181, UnitID = "player"},
				--狂奔怒吼
				{AuraID =  77761, UnitID = "player"},
				{AuraID =  77764, UnitID = "player"},
				--虔诚光环
				{AuraID =  31821, UnitID = "player"},
				--命令怒吼
				{AuraID =  97463, UnitID = "player"},
				--捍卫
				{AuraID = 223658, UnitID = "player"},
				--神圣赞美诗
				{AuraID =  64843, UnitID = "player"},
				--希望象征
				{AuraID =  64901, UnitID = "player"},
				--真言术：障
				{AuraID =  81782, UnitID = "player"},
				--激活
				{AuraID =  29166, UnitID = "player"},
				--五气归元
				{AuraID = 115310, UnitID = "player"},
				--蟠龙之息
				{AuraID = 157535, UnitID = "player"},
				--作茧缚命
				{AuraID = 116849, UnitID = "player"},
				--保护祝福
				{AuraID =   1022, UnitID = "player"},
				--牺牲祝福
				{AuraID =   6940, UnitID = "player"},
				--自由祝福
				{AuraID =   1044, UnitID = "player"},
				--破咒祝福
				{AuraID = 204018, UnitID = "player"},
				--拯救祝福
				{AuraID =   1038, UnitID = "player"},
				--铁木树皮
				{AuraID = 102342, UnitID = "player"},
				--守护之魂
				{AuraID =  47788, UnitID = "player"},
				--痛苦压制
				{AuraID =  33206, UnitID = "player"},
				--圣光道标
				{AuraID =  53563, UnitID = "player"},
				--信仰道标
				{AuraID = 156910, UnitID = "player"},
				--灵魂连接图腾
				{AuraID =  98007, UnitID = "player"},
				--狂风图腾
				{AuraID = 192082, UnitID = "player"},
				--大地图腾
				{AuraID = 201633, UnitID = "player"},
				--圣光护盾
				{AuraID = 204150, UnitID = "player"},
				--加尼尔的精华
				{AuraID = 208253, UnitID = "player"},
         },
    },
    { Name = "警告", Direction = "RIGHT", Interval = 1, Mode = "ICON", IconSize = 50, Pos = {"CENTER", UIParent, "TOP", 26, -180},
			List = {		
				--MOP RaidDebuff
				    --煞能腐蚀，H1
				    {AuraID = 143579, UnitID = "player"},
				    --腐蚀冲击，H1
				    {AuraID = 143436, UnitID = "player"},
				    --泰坦之力，4
				    {AuraID = 144364, UnitID = "player"},
				    --动摇的决心，H4
				    {AuraID = 147207, UnitID = "player"},
				    --迦拉克隆之焰，5
				    {AuraID = 147029, UnitID = "player"},
				    --钢铁囚笼，H7
				    {AuraID = 144330, UnitID = "player"},
				    --猎人印记，H8
				    {AuraID = 143882, UnitID = "player"},
				    --炸弹，10
				    {AuraID = 145987, UnitID = "player"},
				    --冰冻之血，11
				    {AuraID = 143800, UnitID = "player"},
		-->悬槌堡
			--卡加斯·刃拳
				--迸裂创伤
				{AuraID = 159178, UnitID = "player"},
				--刺穿
				{AuraID = 159113, UnitID = "player"},
				--老虎盯人
				{AuraID = 162497, UnitID = "player"},
				--屠夫：捶肉槌
				{AuraID = 156151, UnitID = "player"},
				--龟裂创伤
				{AuraID = 156152, UnitID = "player"},
			--深渊行者布兰肯斯波
				--溃烂
				{AuraID = 163241, UnitID = "player"},
				--烧苔藓
				{AuraID = 165223, UnitID = "player"},
				--寄生孢子
				{AuraID = 163242, UnitID = "player"},
			--泰克图斯
				--石化
				{AuraID = 162892, UnitID = "player"},
			--独眼魔双子
				--双子小怪，奥能动荡
				{AuraID = 166200, UnitID = "player"},
				--弱化防御
				{AuraID = 159709, UnitID = "player"},
				--致衰咆哮
				{AuraID = 158026, UnitID = "player"},
				--奥术之伤
				{AuraID = 167200, UnitID = "player"},
				--扭曲奥能
				{AuraID = 163297, UnitID = "player"},
				--M5奥能动荡，分散
				{AuraID = 163372, UnitID = "player"},
			--克拉戈
				--废灵璧垒
				{AuraID = 163134, UnitID = "player", Value = true},
				--魔能散射邪能
				{AuraID = 172895, UnitID = "player"},
			--元首马尔高克
				--混沌标记（换坦）
				{AuraID = 158605, UnitID = "player"},	--P1
				{AuraID = 164176, UnitID = "player"},	--P2
				{AuraID = 164178, UnitID = "player"},	--P3
				{AuraID = 164191, UnitID = "player"},	--P4
				--拘禁
				{AuraID = 158619, UnitID = "player"},
				--烙印
				{AuraID = 156225, UnitID = "player"},	--P1
				{AuraID = 164004, UnitID = "player"},	--P2
				{AuraID = 164005, UnitID = "player"},	--P3
				{AuraID = 164006, UnitID = "player"},	--P4
				--锁定
				{AuraID = 157763, UnitID = "player"},
				--减速
				{AuraID = 157801, UnitID = "player"},
				--毁灭共鸣
				{AuraID = 159200, UnitID = "player"},
				{AuraID = 174106, UnitID = "player"},
		-->黑石铸造厂
			--格鲁尔
				--石化
				{AuraID = 155330, UnitID = "player"},
				{AuraID = 155506, UnitID = "player"},
				--炼狱切割
				{AuraID = 155080, UnitID = "player"},
				--M火耀石
				{AuraID = 165298, UnitID = "player"},
			--奥尔高格
				--酸液洪流，ST
				{AuraID = 156297, UnitID = "player"},
				--酸液巨口，MT
				{AuraID = 173471, UnitID = "player"},
				--翻滚之怒
				{AuraID = 155900, UnitID = "player"},
			--爆裂熔炉
				--高热，T
				{AuraID = 155242, UnitID = "player"},
				--熔化
				{AuraID = 155225, UnitID = "player"},
				--锁定
				{AuraID = 155196, UnitID = "player"},
				--不稳定的火焰
				{AuraID = 176121, UnitID = "player"},
				--炸弹
				{AuraID = 178279, UnitID = "player"},
				{AuraID = 155192, UnitID = "player"},
			--汉斯加尔与弗兰佐克 
				--折脊碎椎
				{AuraID = 157139, UnitID = "player"},
				--干扰怒吼
				{AuraID = 160838, UnitID = "player"},
				{AuraID = 160845, UnitID = "player"},
				{AuraID = 160847, UnitID = "player"},
				{AuraID = 160848, UnitID = "player"},
				--灼热燃烧
				{AuraID = 155818, UnitID = "player"},
			--缚火者卡格拉兹
				--锁定
				{AuraID = 154952, UnitID = "player"},
				--焦灼吐息，T
				{AuraID = 155074, UnitID = "player"},
				--升腾烈焰，T
				{AuraID = 163284, UnitID = "player"},
				--火焰链接
				{AuraID = 155049, UnitID = "player"},
				--熔岩激流
				{AuraID = 154932, UnitID = "player"},
				--炽热光辉
				{AuraID = 155277, UnitID = "player"},
			--克罗莫格
				--扭曲护甲，T
				{AuraID = 156766, UnitID = "player"},
				--纠缠之地符文
				{AuraID = 157059, UnitID = "player"},
				--破碎大地符文
				{AuraID = 161923, UnitID = "player"},
				{AuraID = 161839, UnitID = "player"},
			--兽王达玛克
				--狂乱撕扯，T
				{AuraID = 155061, UnitID = "player"},
				{AuraID = 162283, UnitID = "player"},
				--炽燃利齿，T
				{AuraID = 155030, UnitID = "player"},
				--碾碎护甲，T
				{AuraID = 155236, UnitID = "player"},
				--爆燃
				{AuraID = 154981, UnitID = "player"},
				--高热弹片
				{AuraID = 155499, UnitID = "player"},
				--M地动山摇
				{AuraID = 162276, UnitID = "player"},
				{AuraID = 155826, UnitID = "player"},
			--主管索戈尔
				--点燃，T
				{AuraID = 155921, UnitID = "player"},
				--定时炸弹
				{AuraID = 159481, UnitID = "player"},
				--实验型脉冲手雷
				{AuraID = 165195, UnitID = "player"},
				--M燃烧
				{AuraID = 164380, UnitID = "player"},
				--M热能冲击
				{AuraID = 164280, UnitID = "player"},
			--女武神
				--急速射击
				{AuraID = 156631, UnitID = "player"},
				--穿透射击
				{AuraID = 164271, UnitID = "player"},
				--震颤暗影
				{AuraID = 156214, UnitID = "player"},
				--鲜血仪式
				{AuraID = 159724, UnitID = "player"},
				--锁定
				{AuraID = 158702, UnitID = "player"},
				--致命投掷
				{AuraID = 158692, UnitID = "player"},
				--暗影猎杀
				{AuraID = 158315, UnitID = "player"},
			--黑手
				--坦克盯人
				{AuraID = 156653, UnitID = "player"},
				--死亡标记
				{AuraID = 156096, UnitID = "player"},
				--穿刺
				{AuraID = 156743, UnitID = "player"},
				{AuraID = 175020, UnitID = "player"},
				--断骨
				{AuraID = 157354, UnitID = "player"},
				--熔渣冲击
				{AuraID = 156047, UnitID = "player"},
				{AuraID = 157018, UnitID = "player"},
				{AuraID = 157322, UnitID = "player"},
				--巨力粉碎猛击
				{AuraID = 158054, UnitID = "player"},
				--熔火熔渣
				{AuraID = 156401, UnitID = "player"},
				--投掷熔渣炸弹
				{AuraID = 159179, UnitID = "player"},
				--投掷熔渣炸弹，T
				{AuraID = 157000, UnitID = "player"},
		--地狱火堡垒
			--奇袭地狱火
				--啸风战斧
				{AuraID = 184379, UnitID = "player"},
				--猛击
				{AuraID = 184243, UnitID = "player"},
				--钻孔
				{AuraID = 180022, UnitID = "player"},
				--灼烧
				{AuraID = 185157, UnitID = "player"},
			--钢铁掠夺者
				--炮击
				{AuraID = 182280, UnitID = "player"},
				--染料污渍
				{AuraID = 182003, UnitID = "player"},
				--献祭
				{AuraID = 182074, UnitID = "player"},
			--考莫克
				--攫取之手
				{AuraID = 181345, UnitID = "player"},
				--邪能之触
				{AuraID = 181321, UnitID = "player"},
				--爆裂冲击
				{AuraID = 181306, UnitID = "player"},
			--地狱火高阶议会
				--堕落狂怒
				{AuraID = 184360, UnitID = "player"},
				--酸性创伤
				{AuraID = 184847, UnitID = "player"},
				--血液沸腾M
				{AuraID = 184355, UnitID = "player"},
				--死灵印记
				{AuraID = 184449, UnitID = "player"},
				{AuraID = 184450, UnitID = "player"},
				{AuraID = 184676, UnitID = "player"},
				{AuraID = 185065, UnitID = "player"},
				{AuraID = 185066, UnitID = "player"},
			--基尔罗格
				--恶魔腐化
				{AuraID = 182159, UnitID = "player"},
				{AuraID = 184396, UnitID = "player"},
				--不朽决心
				{AuraID = 180718, UnitID = "player"},
				--撕碎护甲
				{AuraID = 180200, UnitID = "player"},
				--剖心飞刀（点名）
				{AuraID = 188929, UnitID = "player"},
			--血魔
				--死亡之影
				{AuraID = 179864, UnitID = "player"},
				--消化
				{AuraID = 181295, UnitID = "player"},
				--嗜命
				{AuraID = 180148, UnitID = "player"},
				--邪能烈焰
				{AuraID = 185189, UnitID = "player"},
				--生命渴望
				{AuraID = 180148, UnitID = "player"},
				--命运相连（能动）
				{AuraID = 179908, UnitID = "player"},
				--毁灭之触
				{AuraID = 179977, UnitID = "player"},
			--暗影领主伊斯卡
				--幻影之伤
				{AuraID = 182325, UnitID = "player"},
				--幻影腐蚀
				{AuraID = 181824, UnitID = "player"},
				--邪能炸弹
				{AuraID = 181753, UnitID = "player"},
				--邪能飞轮
				{AuraID = 182178, UnitID = "player"},
				--安苏之光
				{AuraID = 185239, UnitID = "player"},
				--邪能焚化
				{AuraID = 182600, UnitID = "player"},
			--永恒者索奎萨尔
				--粉碎防御
				{AuraID = 182038, UnitID = "player"},
				--易爆的邪能宝珠
				{AuraID = 189627, UnitID = "player"},
				--邪能牢笼
				{AuraID = 180415, UnitID = "player"},
				--堕落者之赐
				{AuraID = 184124, UnitID = "player"},
				--魅影重重
				{AuraID = 182769, UnitID = "player"},
				--暗言术：恶
				{AuraID = 184239, UnitID = "player"},
				--恶毒鬼魅
				{AuraID = 182900, UnitID = "player"},
				--永世饥渴
				{AuraID = 188666, UnitID = "player"},
			--女暴君维哈里
				--凋零契印
				{AuraID = 180000, UnitID = "player"},
				--腐蚀序列
				{AuraID = 180526, UnitID = "player"},
				--谴责法令
				{AuraID = 182459, UnitID = "player"},
			--恶魔领主扎昆
				--魂不附体
				{AuraID = 179407, UnitID = "player"},
				--轰鸣的裂隙
				{AuraID = 179428, UnitID = "player"},
				--玷污
				{AuraID = 189032, UnitID = "player"},
				{AuraID = 189031, UnitID = "player"},
				{AuraID = 189030, UnitID = "player"},
				--毁灭之种
				{AuraID = 181515, UnitID = "player"},
				--潜伏能量
				{AuraID = 182008, UnitID = "player"},
			--祖霍拉克
				--邪蚀
				{AuraID = 186134, UnitID = "player"},
				--灵媒
				{AuraID = 186135, UnitID = "player"},
				--邪影屠戮
				{AuraID = 185656, UnitID = "player"},
				--邪能锁链
				{AuraID = 186500, UnitID = "player"},
				--魔能喷涌
				{AuraID = 186407, UnitID = "player"},
				--灵能涌动
				{AuraID = 186333, UnitID = "player"},
			--玛诺洛斯
				--末日印记
				{AuraID = 181099, UnitID = "player"},
				--末日之刺
				{AuraID = 189717, UnitID = "player"},
				--玛诺洛斯凝视
				{AuraID = 181597, UnitID = "player"},
				--暗影之力
				{AuraID = 181841, UnitID = "player"},
				--强化玛诺洛斯凝视
				{AuraID = 182006, UnitID = "player"},
				--强化暗影之力
				{AuraID = 182088, UnitID = "player"},
			--阿克蒙德
				--暗影爆破
				{AuraID = 183864, UnitID = "player"},
				--锁定
				{AuraID = 182879, UnitID = "player"},
				--束缚折磨
				{AuraID = 184964, UnitID = "player"},		
				--纳鲁之光
				{AuraID = 183963, UnitID = "player"},						
		-->勇气试练
				--奥丁，弧光风暴
				{AuraID = 229256, UnitID = "target"},
				--高姆，吐沫狂怒
				{AuraID = 228174, UnitID = "target"},
				--海拉，酝酿风暴
				{AuraID = 228803, UnitID = "target"},
				--小怪，精力
				{AuraID = 203816, UnitID = "target"},
				--小怪，幽灵怒火
				{AuraID = 228611, UnitID = "target"},
		-->卡拉赞
				--国王易伤
				{AuraID = 229495, UnitID = "target"},
		-->大秘
				--血池回血
				{AuraID = 226510, UnitID = "target"},
				--英灵殿赫娅
				{AuraID = 192132, UnitID = "target"},
				{AuraID = 192133, UnitID = "target"},
				--地窟眼球易伤
				{AuraID = 194333, UnitID = "target"},
		-->卡拉赞
			--夜之魇
				--燃魂
				{AuraID = 228796, UnitID = "player"},
		--7.0翡翠梦魇
			--奈珊卓拉
			  --不稳定的腐烂，小怪
				{AuraID = 221028, UnitID = "player"},
				--寄生/感染
				{AuraID = 204504, UnitID = "player"},
				--感染之地/污染之地
				{AuraID = 203045, UnitID = "player"},
				--腐爛/溃烂
				{AuraID = 203096, UnitID = "player"},
				--烈性腐爛/爆裂溃烂
				{AuraID = 204463, UnitID = "player"},
				--腐化爆裂/腐蚀爆发
				{AuraID = 203646, UnitID = "player"},
				--感染之息/感染吐息
				{AuraID = 202978, UnitID = "player"},
				--心智寄生/感染意志
				{AuraID = 205043, UnitID = "player"},
			--腐化之心伊蓋諾斯
				--夢魘狂怒/梦魇之怒
				{AuraID = 215234, UnitID = "player"},
				--鎖定/锁定
				{AuraID = 210099, UnitID = "player"},
				--腐化之觸/腐蚀之触
				{AuraID = 209469, UnitID = "player"},
				--命運之眼/命运之眼
				{AuraID = 210984, UnitID = "player"},
				--精神鞭笞/精神鞭笞
				{AuraID = 208697, UnitID = "player"},
				--噴吐腐化/腐化吐息
				{AuraID = 208929, UnitID = "player"},
				--夢魘腐化/梦魇腐蚀
				{AuraID = 212886, UnitID = "player"},
				--詛咒之血/诅咒之血
				{AuraID = 215128, UnitID = "player"},
				--死亡綻放/死亡之花
				{AuraID = 215836, UnitID = "player"},
				--散化孢子/消散孢子
				{AuraID = 215845, UnitID = "player"},
				--夢魘爆炸/梦魇爆破
				{AuraID = 209471, UnitID = "player"},
			--艾樂瑞斯雷弗拉爾
				--滴毒尖牙/流毒獠牙
				{AuraID = 210228, UnitID = "player"},
				--痛苦蛛網/痛苦之网
				{AuraID = 215300, UnitID = "player"},
				{AuraID = 215307, UnitID = "player"},
				--毒液之池/剧毒之池
				{AuraID = 213124, UnitID = "player"},
				{AuraID = 215489, UnitID = "player"},
				--亡域毒液/死灵毒液
				{AuraID = 215460, UnitID = "player"},
				--掃擊之爪/邪掠之爪
				{AuraID = 215582, UnitID = "player"},
				--扭曲暗影/扭曲暗影
				{AuraID = 210850, UnitID = "player"},
				--黑暗風暴/腐溃之风
				{AuraID = 211137, UnitID = "player"},
				--聚集雲霧/召云聚气
				{AuraID = 212707, UnitID = "player"},
				--猛烈強風/暴虐之风
				{AuraID = 218124, UnitID = "player"},
				{AuraID = 218144, UnitID = "player"},
				--風之灼傷/狂风燃烧
				{AuraID = 218519, UnitID = "player"},
			--厄索克
				--全面壓制/压制
				{AuraID = 197943, UnitID = "player"},
				--撕裂血肉/撕裂肉体
				{AuraID = 204859, UnitID = "player"},
				--專注凝視/专注凝视
				{AuraID = 198006, UnitID = "player"},
				--衝力/势如破竹
				{AuraID = 198108, UnitID = "player"},
				--血之狂暴/血性狂乱
				{AuraID = 198388, UnitID = "player"},
				--不諧回音/回荡杂音
				{AuraID = 198392, UnitID = "player"},
				--瘴氣/毒瘴
				{AuraID = 205611, UnitID = "player"},
				--惡夢絕叫/梦魇喧嚣
				{AuraID = 197980, UnitID = "player"},
			--夢魘之龍
				--夢魘之花/梦魇花蕾
				{AuraID = 207681, UnitID = "player"},
				--恐懼破壞力/恐惧蔓延
				{AuraID = 204731, UnitID = "player"},
				--暗影衝擊/暗影爆裂
				{AuraID = 204044, UnitID = "player"},
				--迷霧蔓延/渗透之雾
				{AuraID = 205341, UnitID = "player"},
				--泰拉爾印記/泰拉尔标记
				{AuraID = 203121, UnitID = "player"},
				--雷索印記/莱索恩标记
				{AuraID = 203124, UnitID = "player"},
				--艾莫莉絲印記/艾莫莉斯标记
				{AuraID = 203125, UnitID = "player"},
				--伊索德雷印記/伊森德雷标记
				{AuraID = 203102, UnitID = "player"},
				--夢魘沉睡/嗜睡梦魇
				{AuraID = 203110, UnitID = "player"},
				--褻瀆藤蔓/被亵渎的藤曼
				{AuraID = 203770, UnitID = "player"},
				--快速傳染/快速传染
				{AuraID = 203787, UnitID = "player"},
				--低沉咆哮/低吼
				{AuraID = 204078, UnitID = "player"},
				--崩塌夢魘/坍缩梦魇
				{AuraID = 214543, UnitID = "player"},
			--塞納留斯
				--恐懼荊棘/恐惧荆棘光环
				{AuraID = 210346, UnitID = "player"},
				{AuraID = 210340, UnitID = "player"},
				--蔓延夢魘/蠕行梦魇
				{AuraID = 210279, UnitID = "player"},
				--夢魘刺藤/梦魇荆棘
				{AuraID = 210315, UnitID = "player"},
				--淨化地面/净化大地
				{AuraID = 212681, UnitID = "player"},
				--治癒樹根/恢复根须
				{AuraID = 211612, UnitID = "player"},
				--解縛之觸/狂暴之触
				{AuraID = 211989, UnitID = "player"},
				--不受拘束的精華/狂暴精华
				{AuraID = 211990, UnitID = "player"},
				--先祖夢境/上古之梦
				{AuraID = 216516, UnitID = "player"},
				--夢魘標槍/梦魇长枪
				{AuraID = 211507, UnitID = "player"},
				--鄙惡之觸/轻蔑之触
				{AuraID = 	211471, UnitID = "player"},
				--夢魘衝擊/梦魇冲击
				{AuraID = 213162, UnitID = "player"},
				--坠入疯狂
				{AuraID = 208431, UnitID = "player"},
			--薩維斯
				--夢境傀儡/梦境幻影
				{AuraID = 206005, UnitID = "player"},
				--從夢魘中甦醒/梦魇惊魂
				{AuraID = 206109, UnitID = "player"},
				--暗蝕靈魂/晦暗灵魂
				{AuraID = 206651, UnitID = "player"},
				--黑蝕靈魂/黑化灵魂
				{AuraID = 209158, UnitID = "player"},
				--恐懼束縛/恐惧连接
				{AuraID = 210451, UnitID = "player"},
				{AuraID = 209034, UnitID = "player"},
				--腐化：墜入瘋狂/腐蚀：坠入疯狂
				{AuraID = 208431, UnitID = "player"},
				--腐化：瘋狂/腐蚀：疯狂
				{AuraID = 207409, UnitID = "player"},
				--腐化滲液/污染倾泻
				{AuraID = 208385, UnitID = "player"},
				--夢魘之刃/梦魇之刃
				{AuraID = 211802, UnitID = "player"},
				--腐化隕石/腐蚀流星
				{AuraID = 224508, UnitID = "player"},
				--痛苦凝視/折磨锁定
				{AuraID = 205771, UnitID = "player"},
				--無限黑暗/永恒黑暗
				{AuraID = 211634, UnitID = "player"},
-->勇气试练
			--奥丁
				--雷铸之矛
				{AuraID = 228932, UnitID = "player"},
				--正义风暴
				{AuraID = 227807, UnitID = "player"},
			--高姆
				--影舌舔舐
				{AuraID = 228253, UnitID = "player", Value = true},
				--火舌舔舐
				{AuraID = 228228, UnitID = "player"},
				--冰舌舔舐
				{AuraID = 228248, UnitID = "player"},
			--海拉
				--毒水氧化
				{AuraID = 227982, UnitID = "player"},
				--海洋污染
				{AuraID = 228054, UnitID = "player"},
				--恶臭溃烂
				{AuraID = 193367, UnitID = "player"},
				--铁锚猛击
				{AuraID = 228519, UnitID = "player"},
				--黑暗仇恨
				{AuraID = 232488, UnitID = "player"},
				--腐化脊髓
				{AuraID = 232450, UnitID = "player", Value = true},
		-->暗夜要塞
			--斯可匹隆
				--奥术桎梏
				{AuraID = 204531, UnitID = "player"},
				{AuraID = 211659, UnitID = "player"},
				--聚焦冲击
				{AuraID = 204483, UnitID = "player"},
			--时空畸体
				--时光充能
				{AuraID = 212099, UnitID = "player"},
				--时间炸弹
				{AuraID = 206617, UnitID = "player"},
				--时间释放
				{AuraID = 219964, UnitID = "player"},
				{AuraID = 219965, UnitID = "player"},
				{AuraID = 219966, UnitID = "player"},
			--崔利艾克斯
				--奥术梦袭
				{AuraID = 206641, UnitID = "player"},
				--多汁盛宴
				{AuraID = 206838, UnitID = "player"},
				--饱餐一顿
				{AuraID = 214573, UnitID = "player"},
				--吸取活力
				{AuraID = 208499, UnitID = "player"},
				{AuraID = 211615, UnitID = "player"},
				--弧光连接
				{AuraID = 208910, UnitID = "player"},
				{AuraID = 208915, UnitID = "player"},
			--魔剑士奥鲁瑞尔
				--冰霜印记
				{AuraID = 212531, UnitID = "player"},
				{AuraID = 212587, UnitID = "player"},
				--灼热烙印
				{AuraID = 213148, UnitID = "player"},
				--奥术迷雾
				{AuraID = 213504, UnitID = "player"},
			--提克迪奥斯
				--腐肉瘟疫
				{AuraID = 206480, UnitID = "player"},
				--鲜血盛宴
				{AuraID = 208230, UnitID = "player"},
				--幻象之夜
				{AuraID = 206311, UnitID = "player"},
				--阿古斯的烙印
				{AuraID = 212794, UnitID = "player"},
				--腐肉梦魇
				{AuraID = 215988, UnitID = "player"},
				--夜之精华
				{AuraID = 206466, UnitID = "player"},
				--爆裂伤口
				{AuraID = 216024, UnitID = "player"},
				--燃烧的灵魂
				{AuraID = 216040, UnitID = "player"},
			--克洛苏斯
				--灼烧烙印
				{AuraID = 206677, UnitID = "player"},
				--毁灭之球
				{AuraID = 205344, UnitID = "player"},
			--高级植物学家特尔安
				--寄生凝视
				{AuraID = 218342, UnitID = "player"},
				--回归打击
				{AuraID = 218503, UnitID = "player"},
				--寄生镣铐
				{AuraID = 218304, UnitID = "player"},
				--黑夜的召唤
				{AuraID = 218809, UnitID = "player"},
			--占星师艾塔乌斯
				--日冕喷射
				{AuraID = 206464, UnitID = "player"},
				--邪能喷射
				{AuraID = 205649, UnitID = "player"},
				--邪能烈焰
				{AuraID = 206398, UnitID = "player"},
				--寒冰喷射
				{AuraID = 206936, UnitID = "player"},
				--见证虚空
				{AuraID = 207720, UnitID = "player"},
				--冰冻
				{AuraID = 206589, UnitID = "player"},
				--星象三角
				{AuraID = 207831, UnitID = "player"},
				--星座配对
				{AuraID = 205445, UnitID = "player"},
				{AuraID = 205429, UnitID = "player"},
				{AuraID = 216345, UnitID = "player"},
				{AuraID = 216344, UnitID = "player"},
			--大魔导师艾利桑德
				--时间加速
				{AuraID = 209166, UnitID = "player"},
				--减缓时间
				{AuraID = 209165, UnitID = "player"},
				--神秘射线
				{AuraID = 209244, UnitID = "player"},
				--聚合爆破
				{AuraID = 209598, UnitID = "player"},
				--消融
				{AuraID = 209615, UnitID = "player"},
				--消融爆破
				{AuraID = 209973, UnitID = "player"},
				--巨钩
				{AuraID = 211885, UnitID = "player"},
			--卡拉赞
				--贞洁圣女
				{AuraID = 227849, UnitID = "player"},	
				-->悬槌堡
				--M1老虎易伤
				{AuraID = 163130, UnitID = "target"},
				--M1BOSS易伤
				{AuraID = 159029, UnitID = "target"},
				--克拉戈废灵璧垒
				{AuraID = 156803, UnitID = "target", Value = true},
			-->黑石铸造厂
				--1震地暴怒
				{AuraID = 155539, UnitID = "target"},
				--2黑石弹幕
				{AuraID = 156834, UnitID = "target"},
				--2如饥似渴
				{AuraID = 155819, UnitID = "target"},
				--3减伤护盾
				{AuraID = 155176, UnitID = "target"},
				--3护盾消失
				{AuraID = 158345, UnitID = "target"},
				--3大地反馈护盾
				{AuraID = 155173, UnitID = "target"},
				--5过热
				{AuraID = 154950, UnitID = "target"},
				--5烈焰之怒
				{AuraID = 163273, UnitID = "target"},
				--6雷霆轰击
				{AuraID = 157054, UnitID = "target"},
				--6狂暴
				{AuraID = 156861, UnitID = "target"},
				--7野蛮怒吼
				{AuraID = 155208, UnitID = "target"},
				--7防御
				{AuraID = 160382, UnitID = "target"},
				--M7势不可挡
				{AuraID = 155321, UnitID = "target"},
				--8呵斥
				{AuraID = 156281, UnitID = "target"},
				--9钢铁意志
				{AuraID = 159336, UnitID = "target"},
				--9利刃沖刺
				{AuraID = 155794, UnitID = "target"},
				--9土之壁垒
				{AuraID = 158708, UnitID = "target"},
				--坦克过载
				{AuraID = 159199, UnitID = "target"},
				--坦克易伤
				{AuraID = 157322, UnitID = "target"},
				--坦克黑铁铠甲
				{AuraID = 156667, UnitID = "target"},
			-->地狱火堡垒
				--血魔，灵魂盛宴
				{AuraID = 181973, UnitID = "target"},
				--永恒者索奎萨尔，邪能壁垒
				{AuraID = 184053, UnitID = "target"},
				--永恒者索奎萨尔，染血追踪者
				{AuraID = 188767, UnitID = "target"},
				--女暴君维哈里，统御者壁垒
				{AuraID = 180040, UnitID = "target"},
				--祖霍拉克，混乱压制
				{AuraID = 187204, UnitID = "target"},
				--暴君前小怪
				{AuraID = 184552, UnitID = "target"},
				
			-->PLAYER VS PLAYER
				--痛苦压制
				{AuraID =  33206, UnitID = "target"},
				--盾墙
				{AuraID =    871, UnitID = "target"},
				--防御姿态
				{AuraID = 197690, UnitID = "target"},
				--援护
				{AuraID = 147833, UnitID = "target"},
				--冰封之韧
				{AuraID =  48792, UnitID = "target"},
				--反魔法护罩
				{AuraID =  48707, UnitID = "target"},
				--保护之手
				{AuraID =   1022, UnitID = "target"},
				--生存本能
				{AuraID =  61336, UnitID = "target"},
				--灵龟守护
				{AuraID = 186265, UnitID = "target"},
				--寒冰屏障
				{AuraID =  45438, UnitID = "target"},
				--强化隐形术
				{AuraID = 113862, UnitID = "target"},
				--剑在人在
				{AuraID = 118038, UnitID = "target"},
				--法术反射
				{AuraID =  23920, UnitID = "target"},
				--升腾
				{AuraID = 114050, UnitID = "target"},	--元素
				{AuraID = 114051, UnitID = "target"},	--增强
				{AuraID = 114052, UnitID = "target"},	--恢复
				--守护之魂
				{AuraID =  47788, UnitID = "target"},
				--圣佑术
				{AuraID =    498, UnitID = "target"},
				--圣盾术
				{AuraID =    642, UnitID = "target"},
				--自由祝福
				{AuraID =   1044, UnitID = "target"},
				--牺牲祝福
				{AuraID =   6940, UnitID = "target"},
				--破咒祝福
				{AuraID = 204018, UnitID = "target"},
				--保护祝福
				{AuraID =   1022, UnitID = "target"},
				--复仇之怒
				{AuraID =  31842, UnitID = "target"},	--神圣
				{AuraID =  31884, UnitID = "target"},	--惩戒
				--以眼还眼
				{AuraID = 205191, UnitID = "target"},	--惩戒
				--狂野怒火
				{AuraID =  19574, UnitID = "target"},
				--急速射击
				{AuraID =   3045, UnitID = "target"},
				--百发百中
				{AuraID = 193526, UnitID = "target"},
				--不灭决心
				{AuraID = 104773, UnitID = "target"},
				--黑暗交易
				{AuraID = 110913, UnitID = "target"},
				--闪避
				{AuraID =   5277, UnitID = "target"},
				--还击
				{AuraID = 199754, UnitID = "target"},
				--壮胆酒
				{AuraID = 120954, UnitID = "target"},
				--躯不坏
				{AuraID = 122278, UnitID = "target"},
				--散魔功
				{AuraID = 122783, UnitID = "target"},
				--刃舞
				{AuraID = 188499, UnitID = "target"},
				{AuraID = 210152, UnitID = "target"},
				--混乱之刃
				{AuraID = 211048, UnitID = "target"},
				--疾影
				{AuraID = 212800, UnitID = "target"},
				--恶魔变形
				{AuraID = 162264, UnitID = "target"},
				{AuraID = 187827, UnitID = "target"},
				--爱情光线
				{AuraID = 171607, UnitID = "target"},
			--控制
			  -- 奥术洪流
        {AuraID = 28730, UnitID = "target", Caster = "player"},  
			},
		},
  },
   -- 德鲁伊
   ["DRUID"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 60, Pos = SpellPoint,
         List = {
         {AuraID = 225774, UnitID = "player"},
         {AuraID = 225776, UnitID = "player"},
         {AuraID = 209406, UnitID = "player"},
         {AuraID = 209407, UnitID = "player"},
				--潜行
				{AuraID =   5215, UnitID = "player"},
				--急奔
				{AuraID =   1850, UnitID = "player"},
				--野性位移
				{AuraID = 137452, UnitID = "player"},
				--回春术
				{AuraID =    774, UnitID = "player"},
				--萌芽
				{AuraID = 155777, UnitID = "player"},
				--生命之种
				{AuraID = 48504, UnitID = "player"},
				--愈合
				{AuraID =   8936, UnitID = "player"},
				--生命绽放
				{AuraID =  33763, UnitID = "player"},
				--野性成长
				{AuraID =  48438, UnitID = "player"},
				--野性冲锋：泳速
				{AuraID = 102416, UnitID = "player"},
				--塞纳里奥结界
				{AuraID = 102351, UnitID = "player"},
								--节能施法
				{AuraID = 135700, UnitID = "player"},
				{AuraID =  16870, UnitID = "player"},
				--猛虎之怒
				{AuraID =   5217, UnitID = "player"},
				--掠食者的迅捷
				{AuraID =  69369, UnitID = "player"},
				--狂暴
				{AuraID = 106951, UnitID = "player"},
				--野性本能
				{AuraID = 210649, UnitID = "player"},
				--生存本能
				{AuraID =  61336, UnitID = "player"},
				--狂暴回复
				{AuraID =  22842, UnitID = "player"},
				--野蛮咆哮
				{AuraID =  52610, UnitID = "player"},
				--化身
				{AuraID = 102560, UnitID = "player"},
				{AuraID = 117679, UnitID = "player"},
				{AuraID = 102558, UnitID = "player"},
				{AuraID = 102543, UnitID = "player"},
				--血腥爪击
				{AuraID = 145152, UnitID = "player"},
				--星辰坠落
				{AuraID = 191034, UnitID = "player"},
				--树皮术
				{AuraID =  22812, UnitID = "player"},
				--超凡之盟
				{AuraID = 194223, UnitID = "player"},
				--沉睡者之怒
				{AuraID = 200851, UnitID = "player"},
				--乌索尔的印记
				{AuraID = 192083, UnitID = "player"},
				--血污毛皮
				{AuraID = 201671, UnitID = "player", Combat = true},
				--裂伤
				{AuraID =  93622, UnitID = "player"},
				--粉碎
				{AuraID = 158792, UnitID = "player"},
				--星河守护者
				{AuraID = 213708, UnitID = "player"},
				--大地守卫者
				{AuraID = 203975, UnitID = "player", Combat = true},
				--艾露恩的卫士
				{AuraID = 213680, UnitID = "player"},
				--鬃毛倒竖
				{AuraID = 155835, UnitID = "player"},
				--丛林之魂
				{AuraID = 114108, UnitID = "player"},
				--日光增效
				{AuraID = 164545, UnitID = "player"},
				--月光增效
				{AuraID = 164547, UnitID = "player"},
				--艾露恩的战士
				{AuraID = 202425, UnitID = "player"},
				--春暖花开
				{AuraID = 207386, UnitID = "player"},
				--星界和谐，奶德2T19
				{AuraID = 232378, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {   
				--低吼
				{AuraID =   6795, UnitID = "target", Caster = "player"},
				--斜掠
				{AuraID = 155722, UnitID = "target", Caster = "player"},
				--割碎
				{AuraID = 203123, UnitID = "target", Caster = "player"},
				--割裂
				{AuraID =   1079, UnitID = "target", Caster = "player"},
				--痛击
				{AuraID = 106830, UnitID = "target", Caster = "player"},
				{AuraID = 192090, UnitID = "target", Caster = "player"},
				--月火术
				{AuraID = 164812, UnitID = "target", Caster = "player"},
				{AuraID = 155625, UnitID = "target", Caster = "player"},
				--阳炎术
				{AuraID = 164815, UnitID = "target", Caster = "player"},
				--纠缠根须
				{AuraID =    339, UnitID = "target", Caster = "player"},
				--野性冲锋：晕眩
				{AuraID =  50259, UnitID = "target", Caster = "player"},
				--野性冲锋：定身
				{AuraID =  45334, UnitID = "target", Caster = "player"},
				--回春术
				{AuraID =    774, UnitID = "target", Caster = "player"},
				--愈合
				{AuraID =   8936, UnitID = "target", Caster = "player"},
				--生命之种
				{AuraID =  48504, UnitID = "target", Caster = "player"},
				--群体缠绕
				{AuraID = 102359, UnitID = "target", Caster = "player"},
				--蛮力猛击
				{AuraID =   5211, UnitID = "target", Caster = "player"},
				--台风
				{AuraID =  61391, UnitID = "target", Caster = "player"},
				--星界增效
				{AuraID = 197637, UnitID = "target", Caster = "player"},
				--日光术
				{AuraID =  81261, UnitID = "target", Caster = "player"},
				--星辰耀斑
				{AuraID = 202347, UnitID = "target", Caster = "player"},
				--夺魂咆哮
				{AuraID =     99, UnitID = "target", Caster = "player"},
				--乌索尔旋风
				{AuraID = 127797, UnitID = "target", Caster = "player"},
				--生命绽放
				{AuraID =  33763, UnitID = "target", Caster = "player"},
				--野性成长
				{AuraID =  48438, UnitID = "target", Caster = "player"},
				--萌芽
				{AuraID = 155777, UnitID = "target", Caster = "player"},
				--铁木树皮
				{AuraID = 102342, UnitID = "target", Caster = "player"},
				--塞纳里奥结界
				{AuraID = 102351, UnitID = "target", Caster = "player"},
				--栽培
				{AuraID = 200389, UnitID = "target", Caster = "player"},
         },
      },
   }, 
   -- 猎人
   ["HUNTER"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--误导
				{AuraID =  35079, UnitID = "player"},
				--伪装
				{AuraID = 199483, UnitID = "player"},
				--迅疾如风
				{AuraID = 118922, UnitID = "player"},
				--灵魂治愈
				{AuraID =  90361, UnitID = "player"},
				--生存专家
				{AuraID = 164857, UnitID = "player"},
				--猎豹守护
				{AuraID = 186257, UnitID = "player"},
				{AuraID = 186258, UnitID = "player"},
				--凶暴野兽
				{AuraID = 120694, UnitID = "player"},
				--守护屏障
				{AuraID = 203924, UnitID = "player"},
				--灵龟守护回血
				{AuraID = 197161, UnitID = "player"},
				--上升气流（双头龙）
				{AuraID = 160007, UnitID = "player"},
				--乱射
				{AuraID = 194386, UnitID = "player", Combat = true},
								--治疗宠物
				{AuraID =    136, UnitID = "pet"},
				--灵龟守护
				{AuraID = 186265, UnitID = "player"},
				--适者生存
				{AuraID = 190515, UnitID = "player"},
				--稳固集中
				{AuraID = 193534, UnitID = "player"},
				--荷枪实弹
				{AuraID = 194594, UnitID = "player"},
				--野兽瞬劈斩
				{AuraID = 118455, UnitID = "pet"},
				--泰坦之雷
				{AuraID = 207094, UnitID = "pet"},
				--凶猛狂暴
				{AuraID = 217200, UnitID = "pet"},
				--狂野怒火
				{AuraID =  19574, UnitID = "player"},
				--狂轰滥炸
				{AuraID =  82921, UnitID = "player"},
				--百发百中
				{AuraID = 193526, UnitID = "player"},
				--标记目标
				{AuraID = 223138, UnitID = "player"},
				--灵巧打击
				{AuraID = 227272, UnitID = "player"},
				--野性守护
				{AuraID = 193530, UnitID = "player"},
				--荒野呼唤
				{AuraID = 185791, UnitID = "player"},
				--猫鼬之怒
				{AuraID = 190931, UnitID = "player"},
				--雄鹰守护
				{AuraID = 186289, UnitID = "player"},
				--动物本能
				{AuraID = 204321, UnitID = "player"},
				{AuraID = 204324, UnitID = "player"},
				{AuraID = 204333, UnitID = "player"},
				--莫克纳萨战术
				{AuraID = 201081, UnitID = "player"},
				--喷毒眼镜蛇
				{AuraID = 194407, UnitID = "player"},
				--暗影猎手的回复，橙装头
				{AuraID = 208888, UnitID = "player"},
				--正中靶心
				{AuraID = 204090, UnitID = "player"},
				--回转稳定，橙手
				{AuraID = 235712, UnitID = "player", Combat = true},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--毒蛇钉刺
				{AuraID = 118253, UnitID = "target", Caster = "player"},
				--黑箭
				{AuraID = 194599, UnitID = "target", Caster = "player"},
				--震荡射击
				{AuraID =   5116, UnitID = "target", Caster = "player"},
				--夺命黑鸦
				{AuraID = 131894, UnitID = "target", Caster = "player"},
				{AuraID = 206505, UnitID = "target", Caster = "player"},
				--爆炸陷阱
				{AuraID =  13812, UnitID = "target", Caster = "player"},
				--束缚射击
				{AuraID = 117526, UnitID = "target"},
				--易伤
				{AuraID = 187131, UnitID = "target", Caster = "player"},
				--死亡之眼
				{AuraID = 213424, UnitID = "target", Caster = "player"},
				--精确瞄准
				{AuraID = 199803, UnitID = "target", Caster = "player"},
				--猎人印记
				{AuraID = 185365, UnitID = "target", Caster = "player"},
				--翼龙钉刺
				{AuraID =  19386, UnitID = "target", Caster = "player"},
				--胁迫
				{AuraID =  24394, UnitID = "target", Caster = "pet"},
				--野兽狡诈
				{AuraID = 191397, UnitID = "target", Caster = "pet"},
				--裂痕
				{AuraID = 185855, UnitID = "target", Caster = "player"},
				--摔绊
				{AuraID = 195645, UnitID = "target", Caster = "player"},
				--冰冻陷阱
				{AuraID =   3355, UnitID = "target", Caster = "player"},
				--铁蒺藜
				{AuraID = 194279, UnitID = "target", Caster = "player"},
				--精钢陷阱
				{AuraID = 162480, UnitID = "target", Caster = "player"},
				--龙焰手雷
				{AuraID = 194858, UnitID = "target", Caster = "player"},
				--粘性手雷
				{AuraID = 191241, UnitID = "target", Caster = "player"},
				--蝰蛇钉刺
				{AuraID = 202797, UnitID = "target", Caster = "player"},
				--游侠之网
				{AuraID = 200108, UnitID = "target", Caster = "player"},
				{AuraID = 206755, UnitID = "target", Caster = "player"},
				--爆裂射击
				{AuraID = 224729, UnitID = "target", Caster = "player"},
				--驱散射击
				{AuraID = 213691, UnitID = "target", Caster = "player"},
         },
      },
   },
   -- 法师
   ["MAGE"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--棱光屏障
				{AuraID = 235450, UnitID = "player"},
				--隐形术
				{AuraID =  32612, UnitID = "player"},
				--强化隐形术
				{AuraID = 110960, UnitID = "player"},
				--缓落
				{AuraID =    130, UnitID = "player"},
				--灸灼
				{AuraID =  87023, UnitID = "player"},
								--寒冰屏障
				{AuraID =  45438, UnitID = "player"},
				--隐没
				{AuraID = 157913, UnitID = "player"},
				--炽热疾速
				{AuraID = 108843, UnitID = "player"},
				--咒术洪流
				{AuraID = 116267, UnitID = "player"},
				--能量符文
				{AuraID = 116014, UnitID = "player"},
				--浮冰
				{AuraID = 108839, UnitID = "player"},
				--气定神闲
				{AuraID = 205025, UnitID = "player"},
				--奥术充能
				{AuraID =  36032, UnitID = "player"},
				--奥术飞弹!
				{AuraID =  79683, UnitID = "player"},
				--奥术强化
				{AuraID =  12042, UnitID = "player"},
				--冰冷血脉
				{AuraID =  12472, UnitID = "player"},
				--寒冰指
				{AuraID =  44544, UnitID = "player"},
				--冰冷智慧
				{AuraID =  57761, UnitID = "player"},
				--强化隐形术
				{AuraID = 113862, UnitID = "player"},
				--炽烈之咒
				{AuraID = 194329, UnitID = "player"},
				--炎爆术！
				{AuraID =  48108, UnitID = "player"},
				--热力迸发(火)
				{AuraID =  48107, UnitID = "player"},
				--燃烧
				{AuraID = 190319, UnitID = "player"},
				--置换
				{AuraID = 212799, UnitID = "player"},
				--加速
				{AuraID = 198924, UnitID = "player"},
				--冰刺
				{AuraID = 205473, UnitID = "player"},
				--隐形术
				{AuraID =     66, UnitID = "player"},
				--刺骨冰寒
				{AuraID = 205766, UnitID = "player"},
				--凯尔萨斯的绝招，抱歉护腕
				{AuraID = 209455, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {      
				--燃烧(火)
				{AuraID =  83853, UnitID = "target", Caster = "player"},
				--点燃(火)
				{AuraID =  12654, UnitID = "target", Caster = "player"},
				--炎爆术(火)
				{AuraID =  11366, UnitID = "target", Caster = "player"},
				--活动炸弹(火)
				{AuraID =  217694, UnitID = "target", Caster = "player"},
				--龙息术(火)
				{AuraID =  31661, UnitID = "target", Caster = "player"},
				--冲击波
				{AuraID = 157981, UnitID = "target", Caster = "player"},
				--变形术
				{AuraID =    118, UnitID = "target", Caster = "player"},
				--冰霜新星
				{AuraID =    122, UnitID = "target", Caster = "player"},
				--冰霜之环
				{AuraID =  82691, UnitID = "target", Caster = "player"},
				--减速
				{AuraID =  31589, UnitID = "target", Caster = "player"},
				--虚空风暴
				{AuraID = 114923, UnitID = "target", Caster = "player"},
				--寒冰炸弹
				{AuraID = 112948, UnitID = "target", Caster = "player"},
				--寒冰箭
				{AuraID = 205708, UnitID = "target", Caster = "player"},
				--冰锥术
				{AuraID = 212792, UnitID = "target", Caster = "player"},
				--寒冰新星
				{AuraID = 157997, UnitID = "target", Caster = "player"},
				--冻结
				{AuraID = 111340, UnitID = "target", Caster = "player"},
				--奥术侵蚀
				{AuraID = 210134, UnitID = "target", Caster = "player"},
				--冰川尖刺
				{AuraID = 199786, UnitID = "target", Caster = "player"},
				--冰冻术
				{AuraID =  33395, UnitID = "target", Caster = "pet"},
				--水流喷射
				{AuraID = 135029, UnitID = "target", Caster = "pet"},
         },
      },
   },  
   -- 战士
   ["WARRIOR"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--胜利
				{AuraID =  32216, UnitID = "player"},
				--最后通牒
				{AuraID = 122510, UnitID = "player"},
				--投入战斗
				{AuraID = 202602, UnitID = "player"},
				--战争疤痕
				{AuraID = 200954, UnitID = "player"},
								--战吼
				{AuraID =   1719, UnitID = "player"},

				--维库之力
				{AuraID = 188783, UnitID = "player"},
				--法术反射
				{AuraID =  23920, UnitID = "player"},
				--狂暴之怒
				{AuraID =  18499, UnitID = "player"},
				--盾墙
				{AuraID =    871, UnitID = "player"},
				--怒火聚焦
				{AuraID = 204488, UnitID = "player"},
				{AuraID = 207982, UnitID = "player"},
				--破釜沉舟
				{AuraID =  12975, UnitID = "player"},
				--盾牌格挡
				{AuraID = 132404, UnitID = "player"},
				--狂暴复兴
				{AuraID = 202289, UnitID = "player"},
				--天神下凡
				{AuraID = 107574, UnitID = "player"},
				--腾跃步伐
				{AuraID = 202164, UnitID = "player"},
				--维金斯
				{AuraID = 202573, UnitID = "player"},
				{AuraID = 202574, UnitID = "player"},
				--破坏者
				{AuraID = 152277, UnitID = "player"},
				--狂暴
				{AuraID = 200953, UnitID = "player"},
				--血肉顺劈
				{AuraID =  85739, UnitID = "player"},
				--狂暴回复
				{AuraID = 184364, UnitID = "player"},
				--奥丁的勇士
				{AuraID = 200986, UnitID = "player"},
				--血腥气息
				{AuraID = 206333, UnitID = "player"},
				--摧拉枯朽
				{AuraID = 215570, UnitID = "player"},
				--狂暴冲锋
				{AuraID = 202225, UnitID = "player"},
				--暴乱狂战士
				{AuraID = 215572, UnitID = "player"},
				--剑刃风暴
				{AuraID =  46924, UnitID = "player"},
				--绞肉机
				{AuraID = 213284, UnitID = "player"},
				--狂乱
				{AuraID = 202539, UnitID = "player"},
				--巨龙怒吼
				{AuraID = 118000, UnitID = "player"},
				--粉碎防御
				{AuraID = 209706, UnitID = "player"},
				--顺劈斩
				{AuraID = 188923, UnitID = "player"},
				--防御姿态
				{AuraID = 197690, UnitID = "player"},
				--压制
				{AuraID =  60503, UnitID = "player"},
				--剑在人在
				{AuraID = 108038, UnitID = "player"},
				--主宰
				{AuraID = 201009, UnitID = "player"},
				--石之心（橙戒）
				{AuraID = 225947, UnitID = "player"},
         },
      },   
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--嘲讽
				{AuraID =    355, UnitID = "target", Caster = "player"},
				--冲锋：定身
				{AuraID = 105771, UnitID = "target", Caster = "player"},
				--冲锋：昏迷
				{AuraID =   7922, UnitID = "target", Caster = "player"},
				--挫志怒吼
				{AuraID =   1160, UnitID = "target", Caster = "player"},
				--重伤
				{AuraID = 115767, UnitID = "target", Caster = "player"},
				--雷霆一击
				{AuraID =   6343, UnitID = "target", Caster = "player"},
				--风暴之锤
				{AuraID = 132169, UnitID = "target", Caster = "player"},
				--震荡波
				{AuraID = 132168, UnitID = "target", Caster = "player"},
				--刺耳怒吼
				{AuraID =  12323, UnitID = "target", Caster = "player"},
				--破胆
				{AuraID =   5246, UnitID = "target", Caster = "player"},
				--巨人打击
				{AuraID = 208086, UnitID = "target", Caster = "player"},
				--断筋
				{AuraID =   1715, UnitID = "target", Caster = "player"},
				--致死
				{AuraID = 115804, UnitID = "target", Caster = "player"},
				--撕裂
				{AuraID =    772, UnitID = "target", Caster = "player"},
				--弱肉强食
				{AuraID = 214229, UnitID = "target", Caster = "player"},
         },
      },   
   },
   -- 萨满
   ["SHAMAN"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--水上行走
				{AuraID =    546, UnitID = "player"},
				--风暴之鞭
				{AuraID = 195222, UnitID = "player"},
				--疾风
				{AuraID = 198293, UnitID = "player"},
				--空气之怒
				{AuraID = 197211, UnitID = "player"},
								--十万火急
				{AuraID = 208416, UnitID = "player"},
				--迷雾幽灵
				{AuraID = 207527, UnitID = "player"},
				--治疗之雨
				{AuraID =  73920, UnitID = "player"},
				--潮汐奔涌
				{AuraID =  53390, UnitID = "player"},
				--女王的祝福
				{AuraID = 207288, UnitID = "player"},
				--灵魂行者的恩赐
				{AuraID =  79206, UnitID = "player"},
				--生命释放
				{AuraID =  73685, UnitID = "player"},
				--波动
				{AuraID = 216251, UnitID = "player"},
				--先祖指引
				{AuraID = 108281, UnitID = "player"},
				--升腾
				{AuraID = 114050, UnitID = "player"},	--元素
				{AuraID = 114051, UnitID = "player"},	--增强
				{AuraID = 114052, UnitID = "player"},	--恢复
				--幽魂步
				{AuraID =  58875, UnitID = "player"},
				--星界转移
				{AuraID = 108271, UnitID = "player"},
				--毁灭之风
				{AuraID = 204945, UnitID = "player"},
				--集束风暴
				{AuraID = 198300, UnitID = "player"},
				--风暴使者
				{AuraID = 201846, UnitID = "player"},
				--火舌
				{AuraID = 194084, UnitID = "player"},
				--冰封
				{AuraID = 196834, UnitID = "player"},
				--毁灭释放
				{AuraID = 199055, UnitID = "player"},
				--风歌
				{AuraID = 201898, UnitID = "player"},
				--灼热之手
				{AuraID = 215785, UnitID = "player"},
				--石拳
				{AuraID = 218825, UnitID = "player"},
				--降雨
				{AuraID = 215864, UnitID = "player"},
				--元素集中
				{AuraID =  16246, UnitID = "player"},
				--熔岩奔腾
				{AuraID =  77762, UnitID = "player"},
				--漩涡之力
				{AuraID = 191877, UnitID = "player"},
				--风暴守护者
				{AuraID = 205495, UnitID = "player"},
				--元素冲击
				{AuraID = 118522, UnitID = "player"},	--爆击
				{AuraID = 173183, UnitID = "player"},	--急速
				{AuraID = 173184, UnitID = "player"},	--精通
				--冰怒
				{AuraID = 210714, UnitID = "player"},
				--冰怒
				{AuraID = 5394, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--蒺藜
				{AuraID = 207778, UnitID = "target", Caster = "player"},
				--先祖活力
				{AuraID = 207400, UnitID = "target", Caster = "player"},
				--妖术
				{AuraID =  51514, UnitID = "target", Caster = "player"},
				{AuraID = 196942, UnitID = "target", Caster = "player"},
				--激流
				{AuraID =  61295, UnitID = "target", Caster = "player"},
				--烈焰震击
				{AuraID = 188838, UnitID = "target", Caster = "player"},
				{AuraID = 188389, UnitID = "target", Caster = "player"},
				--闪电奔涌图腾
				{AuraID = 118905, UnitID = "target", Caster = "player"},
				--大地之刺
				{AuraID = 188089, UnitID = "target", Caster = "player"},
				--避雷针
				{AuraID = 197209, UnitID = "target", Caster = "player"},
				--冰霜震击
				{AuraID = 196840, UnitID = "target", Caster = "player"},
				--冰霜震击
				{AuraID = 147732, UnitID = "target", Caster = "player"},
         },
      },
   },
   -- 圣骑士
   ["PALADIN"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--光明圣印
				{AuraID = 202273, UnitID = "player"},
				--圣盾术
				{AuraID =    642, UnitID = "player"},
				--复仇之怒
				{AuraID =  31884, UnitID = "player"},
				{AuraID =  31842, UnitID = "player"},
				--神圣意志
				{AuraID = 223819, UnitID = "player"},
				{AuraID = 216413, UnitID = "player"},
				--复仇之盾
				{AuraID = 184662, UnitID = "player", Value = true},
				--正义之火
				{AuraID = 209785, UnitID = "player"},
				--狂热
				{AuraID = 217020, UnitID = "player"},
				--以眼还眼
				{AuraID = 205191, UnitID = "player"},
				--圣洁怒火
				{AuraID = 224668, UnitID = "player"},
				--神圣马驹
				{AuraID = 221885, UnitID = "player"},
				--光环掌握
				{AuraID =  31821, UnitID = "player"},
				--圣佑术
				{AuraID =    498, UnitID = "player"},
				--提尔的拯救
				{AuraID = 200652, UnitID = "player"},
				--律法之则
				{AuraID = 214202, UnitID = "player"},
				--圣光灌注
				{AuraID =  54149, UnitID = "player"},
				--神圣复仇者
				{AuraID = 105809, UnitID = "player"},
				--狂热殉道者
				{AuraID = 223316, UnitID = "player"},
				--美德道标
				{AuraID = 200025, UnitID = "player"},
				--正义盾击
				{AuraID = 132403, UnitID = "player"},
				--炽热防御者
				{AuraID =  31850, UnitID = "player"},
				--远古列王守卫
				{AuraID =  86659, UnitID = "player"},
				--炽天使
				{AuraID = 152262, UnitID = "player"},
				--神圣马驹
				{AuraID = 221883, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--圣光道标
				{AuraID =  53563, UnitID = "target", Caster = "player"},
				--信仰道标
				{AuraID = 156910, UnitID = "target", Caster = "player"},
				--制裁之锤
				{AuraID =    853, UnitID = "target", Caster = "player"},
				--妨害之手
				{AuraID = 183218, UnitID = "target", Caster = "player"},
				--审判
				{AuraID = 197277, UnitID = "target", Caster = "player"},
				{AuraID = 214222, UnitID = "target", Caster = "player"},
				--清算之手
				{AuraID =  62124, UnitID = "target", Caster = "player"},
				--灰烬觉醒
				{AuraID = 205273, UnitID = "target", Caster = "player"},
				--盲目之光
				{AuraID = 105421, UnitID = "target", Caster = "player"},
				--提尔的拯救
				{AuraID = 200654, UnitID = "target", Caster = "player"},
				--赋予信仰
				{AuraID = 223306, UnitID = "target", Caster = "player"},
				--圣光审判
				{AuraID = 196941, UnitID = "target", Caster = "player"},
				--提尔之眼
				{AuraID = 209202, UnitID = "target", Caster = "player"},
				--复仇者之盾
				{AuraID =  31935, UnitID = "target", Caster = "player"},
				--祝福之盾
				{AuraID = 204301, UnitID = "target", Caster = "player"},
				--决一死战
				{AuraID = 204079, UnitID = "target", Caster = "player"},
         },
      },
   },
   -- 牧师
   ["PRIEST"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--渐隐术
				{AuraID = 	 586, UnitID = "player"},
				--意志坚定
				{AuraID = 194022, UnitID = "player"},
				--真言术：盾
				{AuraID =     17, UnitID = "player"},
				--暗影洞察
				{AuraID = 124430, UnitID = "player"},
				--天堂之羽
				{AuraID = 121557, UnitID = "player"},
				--身心合一
				{AuraID = 214121, UnitID = "player"},
								--消散
				{AuraID =   47585, UnitID = "player"},
				--吸血鬼的拥抱
				{AuraID =   15286, UnitID = "player"},
				--延宕狂乱
				{AuraID =  197937, UnitID = "player"},
				--命运多舛
				{AuraID =  194249, UnitID = "player"},
				--虚空射线
				{AuraID =  205372, UnitID = "player"},
				--能量灌注
				{AuraID =   10060, UnitID = "player"},
				--疯入膏肓
				{AuraID =  193223, UnitID = "player"},
				--纳鲁之能
				{AuraID =  196490, UnitID = "player"},
				--圣光涌动
				{AuraID =  114255, UnitID = "player"},
				--图雷的祝福
				{AuraID =  196644, UnitID = "player"},
				--圣洁
				{AuraID =  197030, UnitID = "player"},
				--神圣化身
				{AuraID =  200183, UnitID = "player"},
				--全神贯注
				{AuraID =   47536, UnitID = "player"},
				--争分夺秒
				{AuraID =  197763, UnitID = "player"},
				--身心合一
				{AuraID =   65081, UnitID = "player"},
				--阴暗面之力
				{AuraID =  198069, UnitID = "player"},
				--命运多舛
				{AuraID =  123254, UnitID = "player"},
				--神牧神器
				{AuraID = 211440, UnitID = "player"},
				{AuraID = 211442, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--暗言术:痛
				{AuraID =    589, UnitID = "target", Caster = "player"},
				--吸血鬼之触
				{AuraID =  34914, UnitID = "target", Caster = "player"},
				--心灵尖啸
				{AuraID =   8122, UnitID = "target", Caster = "player"},
				--沉默
				{AuraID =  15487, UnitID = "target", Caster = "player"},
				--真言术：盾
				{AuraID =     17, UnitID = "target", Caster = "player", Value = true},
				--心灵炸弹
				{AuraID = 205369, UnitID = "target", Caster = "player"},
				--心灵尖刺
				{AuraID = 217673, UnitID = "target", Caster = "player"},
				--恢复
				{AuraID =    139, UnitID = "target", Caster = "player"},
				--图雷之光
				{AuraID = 208065, UnitID = "target", Caster = "player"},
				--圣言术：罚
				{AuraID = 200196, UnitID = "target", Caster = "player"},
				{AuraID = 200200, UnitID = "target", Caster = "player"},
				--愈合祷言
				{AuraID =  41635, UnitID = "target", Caster = "player"},
				--身心合一
				{AuraID = 214121, UnitID = "target", Caster = "player"},
				--天堂之羽
				{AuraID = 121557, UnitID = "target", Caster = "player"},
				--闪光力场
				{AuraID = 204263, UnitID = "target", Caster = "player"},
				--救赎
				{AuraID = 194384, UnitID = "target", Caster = "player"},
				--教派分歧
				{AuraID = 214621, UnitID = "target", Caster = "player"},
				--意志洞悉
				{AuraID = 152118, UnitID = "target", Caster = "player"},
				--净化邪恶
				{AuraID = 204213, UnitID = "target", Caster = "player"},
				--惩击
				{AuraID = 208772, UnitID = "target", Caster = "player", Value = true},
         },
      },
   },
   -- 术士
   ["WARLOCK"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--灵魂榨取
				{AuraID = 108366, UnitID = "player"},
				--恶魔法阵
				{AuraID =  48018, UnitID = "player"},
				--吞噬之怒
				{AuraID = 199646, UnitID = "player"},
				--灼烧主人
				{AuraID = 119899, UnitID = "player"},
				--不灭决心
				{AuraID = 104773, UnitID = "player"},
				--痛上加痛
				{AuraID = 199281, UnitID = "player"},
				--法力分流
				{AuraID = 196104, UnitID = "player"},
				--暗影启迪
				{AuraID = 196606, UnitID = "player"},
				--爆燃冲刺
				{AuraID = 111400, UnitID = "player"},
				--魔刃风暴
				{AuraID =  89751, UnitID = "pet"},
				--愤怒风暴
				{AuraID = 115831, UnitID = "pet"},
				--恶魔增效
				{AuraID = 193396, UnitID = "pet"},
				--爆燃
				{AuraID = 117828, UnitID = "player"},
				--灵魂收割
				{AuraID = 196098, UnitID = "player"},
				--魔性征兆
				{AuraID = 205146, UnitID = "player"},
				--逆风收割者
				{AuraID = 216708, UnitID = "player"},
				--军团之眼
				{AuraID = 230152, UnitID = "player"},
				--协同
				{AuraID = 171982, UnitID = "player"},
				--强化生命分流
				{AuraID = 235156, UnitID = "player"},
         },
      },   
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--腐蚀之种
				{AuraID =  27243, UnitID = "target", Caster = "player"},
				--腐蚀术
				{AuraID = 146739, UnitID = "target", Caster = "player"},
				--痛楚
				{AuraID =    980, UnitID = "target", Caster = "player"},
				--痛苦无常
				--{AuraID =  30108, UnitID = "target", Caster = "player"},
				{AuraID =  233490, UnitID = "target", Caster = "player"},
				{AuraID =  233496, UnitID = "target", Caster = "player"},
				{AuraID =  233497, UnitID = "target", Caster = "player"},
				{AuraID =  233498, UnitID = "target", Caster = "player"},
				{AuraID =  233499, UnitID = "target", Caster = "player"},
				--死亡缠绕
				{AuraID =   6789, UnitID = "target", Caster = "player"},
				--恐惧嚎叫
				{AuraID =   5484, UnitID = "target", Caster = "player"},
				--恐惧
				{AuraID = 118699, UnitID = "target", Caster = "player"},
				--放逐术
				{AuraID =    710, UnitID = "target", Caster = "player"},
				--鬼影缠身
				{AuraID =  48181, UnitID = "target", Caster = "player"},
				--生命虹吸
				{AuraID =  63106, UnitID = "target", Caster = "player"},
				--黑暗契约
				{AuraID = 108416, UnitID = "target", Caster = "player", Value = true},
				--暗影烈焰
				{AuraID = 205181, UnitID = "target", Caster = "player"},
				--暗影之怒
				{AuraID =  30283, UnitID = "target", Caster = "player"},
				--浩劫
				{AuraID =  80240, UnitID = "target", Caster = "player"},
				--末日灾祸
				{AuraID =    603, UnitID = "target", Caster = "player"},
				--魅惑
				{AuraID =   6358, UnitID = "target", Caster = "pet"},
				--献祭
				{AuraID = 157736, UnitID = "target", Caster = "player"},
				--暗影灼烧
				{AuraID =  17877, UnitID = "target", Caster = "player"},
				--根除
				{AuraID = 196414, UnitID = "target", Caster = "player"},
         },
      },
   },
   -- 盗贼
   ["ROGUE"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--潜行
				{AuraID =   1784, UnitID = "player"},
				--疾跑
				{AuraID =   2983, UnitID = "player"},
				--暗影步
				{AuraID =  36554, UnitID = "player"},
				--黑暗之拥
				{AuraID = 197603, UnitID = "player"},
				--可乘之机
				{AuraID = 195627, UnitID = "player"},
								--佯攻
				{AuraID =   1966, UnitID = "player"},
				--闪避
				{AuraID =   5277, UnitID = "player"},
				--暗影斗篷
				{AuraID =  31224, UnitID = "player"},
				--猩红之瓶
				{AuraID = 185311, UnitID = "player"},
				--毒伤
				{AuraID =  32645, UnitID = "player"},
				--消失
				{AuraID =  11327, UnitID = "player"},
				--深谋远虑
				{AuraID = 193641, UnitID = "player"},
				--诡诈
				{AuraID = 115192, UnitID = "player"},
				--敏锐
				{AuraID = 193538, UnitID = "player"},
				--暗影之刃
				{AuraID = 121471, UnitID = "player"},
				--影舞
				{AuraID = 185422, UnitID = "player"},
				--暗影笼罩
				{AuraID = 206237, UnitID = "player"},
				--隐秘刀刃
				{AuraID = 202754, UnitID = "player"},
				--冲动
				{AuraID =  13750, UnitID = "player"},
				--还击
				{AuraID = 199754, UnitID = "player"},
				--切割
				{AuraID =   5171, UnitID = "player"},
				--前膛火枪
				{AuraID = 202897, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2,  Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {            
				--偷袭
				{AuraID =   1833, UnitID = "target", Caster = "player"},
				--
				{AuraID =   2818, UnitID = "target", Caster = "player"},
				--闷棍
				{AuraID =   6770, UnitID = "target", Caster = "player"},
				--手枪射击
				{AuraID =   185763, UnitID = "target", Caster = "player"},
				--致盲
				{AuraID =   2094, UnitID = "target", Caster = "player"},
				--锁喉
				{AuraID =    703, UnitID = "target", Caster = "player"},
				{AuraID =   1330, UnitID = "target", Caster = "player"},
				--肾击
				{AuraID =    408, UnitID = "target", Caster = "player"},
				--凿击
				{AuraID =   1776, UnitID = "target", Caster = "player"},
				--割裂
				{AuraID =   1943, UnitID = "target", Caster = "player"},
				--君王之灾
				{AuraID = 192759, UnitID = "target", Caster = "player"},
				--宿敌
				{AuraID =  79140, UnitID = "target", Caster = "player"},
				--毒素冲动
				{AuraID = 192425, UnitID = "target", Caster = "player"},
				--出血
				{AuraID =  16511, UnitID = "target", Caster = "player"},
				--苦痛毒液
				{AuraID = 200803, UnitID = "target", Caster = "player"},
				--死亡标记
				{AuraID = 137619, UnitID = "target", Caster = "player"},
				--夜刃
				{AuraID = 195452, UnitID = "target", Caster = "player"},
				--赤喉之咬
				{AuraID = 209786, UnitID = "target", Caster = "player"},
				--暗影打击
				{AuraID = 196958, UnitID = "target", Caster = "player"},
				--鬼魅攻击
				{AuraID = 196937, UnitID = "target", Caster = "player"},
				--正中眉心
				{AuraID = 199804, UnitID = "target", Caster = "player"},  
				--遇刺者之血
				{AuraID = 192925, UnitID = "target", Caster = "player"}, 
         },
      },      
   },
   -- 死亡骑士
   ["DEATHKNIGHT"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--冰霜之路
				{AuraID =   3714, UnitID = "player"},
				--赤色天灾
				{AuraID =  81141, UnitID = "player"},
				--末日突降
				{AuraID =  81340, UnitID = "player"},
				--白霜
				{AuraID =  59052, UnitID = "player"}, 
				--埋骨之所
				{AuraID = 219788, UnitID = "player"},
							--吸血鬼之血
				{AuraID =  55233, UnitID = "player"},
				--反魔法护罩
				{AuraID =  48707, UnitID = "player"},
				--符文刃舞
				{AuraID =  81256, UnitID = "player"},
				--永恒脐带
				{AuraID = 193320, UnitID = "player", Value = true},
				--枯萎凋零
				{AuraID = 188290, UnitID = "player"},
				--灵魂吞噬
				{AuraID = 213003, UnitID = "player"},
				--墓石
				{AuraID = 219809, UnitID = "player", Value = true},
				--符文分流
				{AuraID = 194679, UnitID = "player"},
				--白骨风暴
				{AuraID = 194844, UnitID = "player"},
				--冰封之韧
				{AuraID =  48792, UnitID = "player"},
				--冰霜之柱
				{AuraID =  51271, UnitID = "player"},
				--杀戮机器
				{AuraID =  51124, UnitID = "player"},
				--饥饿符文刃
				{AuraID = 207127, UnitID = "player"},
				--湮灭
				{AuraID = 207256, UnitID = "player"},
				--符文腐蚀
				{AuraID =  51460, UnitID = "player"},
				--邪恶狂乱
				{AuraID = 207290, UnitID = "player"},
				--血肉之盾
				{AuraID = 207319, UnitID = "player"},
				--夺魂
				{AuraID = 215711, UnitID = "player"},
				--亵渎
				{AuraID = 218100, UnitID = "player"},
				--黑暗突变
				{AuraID =  63560, UnitID = "pet"},
				--冷库严冬
				{AuraID = 196770, UnitID = "player"},
				--冰冷之爪
				{AuraID = 194879, UnitID = "player"},
				--不洁之力
				{AuraID =  53365, UnitID = "player"},
				--风暴汇聚
				{AuraID = 211805, UnitID = "player"},
				--冰龙吐息
				{AuraID = 152279, UnitID = "player"},
         },
      },   
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--血之疫病
				{AuraID =  55078, UnitID = "target", Caster = "player"},
				--冰霜疫病
				{AuraID =  55095, UnitID = "target", Caster = "player"},
				--恶性瘟疫
				{AuraID = 191587, UnitID = "target", Caster = "player"},
				--心脏打击
				{AuraID = 206930, UnitID = "target", Caster = "player"},
				--黑暗命令
				{AuraID =  56222, UnitID = "target", Caster = "player"},
				--寒冰锁链
				{AuraID =  45524, UnitID = "target", Caster = "player"},
				--冷库严冬
				{AuraID = 211793, UnitID = "target", Caster = "player"},
				--窒息
				{AuraID = 221562, UnitID = "target", Caster = "player"},
				{AuraID = 108194, UnitID = "target", Caster = "player"},
				--鲜血印记
				{AuraID = 206940, UnitID = "target", Caster = "player"},
				--血之镜像
				{AuraID = 206977, UnitID = "target", Caster = "player"},
				--致盲冰雨
				{AuraID = 207167, UnitID = "target", Caster = "player"},
				--溃烂之伤
				{AuraID = 194310, UnitID = "target", Caster = "player"},
				--灵魂收割
				{AuraID = 130736, UnitID = "target", Caster = "player"},
				--亵渎
				{AuraID = 156004, UnitID = "target", Caster = "player"},
				--诸界之灾
				{AuraID = 191748, UnitID = "target", Caster = "player"},
         },
      },   
   },
   -- 武僧
   ["MONK"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {            
				--真气突
				{AuraID = 119085, UnitID = "player"},
				--魂体双分
				{AuraID = 101643, UnitID = "player"},
				--禅院教诲
				{AuraID = 202090, UnitID = "player"},
				--复苏之雾
				{AuraID = 119611, UnitID = "player"},
								--业报之触
				{AuraID = 125174, UnitID = "player"},
				--幻灭踢
				{AuraID = 116768, UnitID = "player"},
				--风火雷电
				{AuraID = 137639, UnitID = "player"},
				--躯不坏
				{AuraID = 122278, UnitID = "player"},
				--散魔功
				{AuraID = 122783, UnitID = "player"},
				--平心之环
				{AuraID = 116844, UnitID = "player"},
				--屏气凝神
				{AuraID = 152173, UnitID = "player"},
				--壮胆酒
				{AuraID = 120954, UnitID = "player"},
				--铁骨酒
				{AuraID = 215479, UnitID = "player"},
				--酒有余香
				{AuraID = 214373, UnitID = "player"},
				--神龙之雾
				{AuraID = 199888, UnitID = "player"},
				--升腾状态
				{AuraID = 197206, UnitID = "player"},
				--雷光茶
				{AuraID = 116680, UnitID = "player"},
				--法力茶
				{AuraID = 197908, UnitID = "player"},
				--连击
				{AuraID = 196741, UnitID = "player"},
				--幻灭连击
				{AuraID = 228563, UnitID = "player"},
				--生生不息
				{AuraID = 197916, UnitID = "player"},
				{AuraID = 197919, UnitID = "player"},
				--迅如猛虎
				{AuraID = 116841, UnitID = "player"},
				--转化力量
				{AuraID = 195321, UnitID = "player"},
         },
      },
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--分筋错骨
				{AuraID = 115078, UnitID = "target", Caster = "player"},
				--豪镇八方
				{AuraID = 116189, UnitID = "target", Caster = "player"},
				--致死之伤
				{AuraID = 115804, UnitID = "target", Caster = "player"},
				--轮回之触
				{AuraID = 115080, UnitID = "target", Caster = "player"},
				--翔龙在天
				{AuraID = 123586, UnitID = "target", Caster = "player"},
				--金刚震
				{AuraID = 116706, UnitID = "target", Caster = "player"},
				--风领主之击
				{AuraID = 205320, UnitID = "target", Caster = "player"},
				--迅如猛虎
				{AuraID = 116841, UnitID = "target", Caster = "player"},
				--扫堂腿
				{AuraID = 119381, UnitID = "target", Caster = "player"},
				--平心之环
				{AuraID = 116844, UnitID = "target", Caster = "player"},
				--醉酿投
				{AuraID = 121253, UnitID = "target", Caster = "player"},
				--爆炸酒桶
				{AuraID = 214326, UnitID = "target", Caster = "player"},
				--火焰之息
				{AuraID = 123725, UnitID = "target", Caster = "player"},
				--作茧缚命
				{AuraID = 116849, UnitID = "target", Caster = "player"},
				--复苏之雾
				{AuraID = 119611, UnitID = "target", Caster = "player"},
				--精华之泉
				{AuraID = 191840, UnitID = "target", Caster = "player"},
				--赤精之歌
				{AuraID = 198909, UnitID = "target", Caster = "player"},
         },
      },
   },
   -- 恶魔猎手
   ["DEMONHUNTER"] = {
      { Name = "Spell", Direction = "UP", Interval = 2, Mode = "BAR2", IconSize = 21, BarWidth = 80, Pos = SpellPoint,
         List = {
				--灵魂盛宴
				{AuraID = 207693, UnitID = "player"},
				--献祭光环
				{AuraID = 178740, UnitID = "player"},
				--涅墨西斯
				{AuraID = 208608, UnitID = "player"},
								--恶魔变形
				{AuraID = 162264, UnitID = "player"},
				{AuraID = 187827, UnitID = "player"},
				--幽灵视觉
				{AuraID = 188501, UnitID = "player"},
				--疾影
				{AuraID = 212800, UnitID = "player"},
				--准备就绪
				{AuraID = 203650, UnitID = "player"},
				--虚空行走
				{AuraID = 196555, UnitID = "player"},
				--势如破竹
				{AuraID = 208628, UnitID = "player"},
				--混乱之刃
				{AuraID = 211048, UnitID = "player"},
				--刃舞
				{AuraID = 188499, UnitID = "player"},
				{AuraID = 210152, UnitID = "player"},
				--幻影打击
				{AuraID = 209426, UnitID = "player"},
				--强化结界
				{AuraID = 218256, UnitID = "player"},
				--恶魔尖刺
				{AuraID = 203819, UnitID = "player"},
				--痛苦使者
				{AuraID = 212988, UnitID = "player"},    
         },
      },   
      { Name = "Dot", Direction = "UP", Interval = 2, Mode = "BAR", IconSize = 28, BarWidth = 80, Pos = DotPoint,
         List = {
				--复仇回避
				{AuraID = 198813, UnitID = "target", Caster = "player"},
				--混乱新星
				{AuraID = 179057, UnitID = "target", Caster = "player"},
				--血滴子
				{AuraID = 207690, UnitID = "target", Caster = "player"},
				--涅墨西斯
				{AuraID = 206491, UnitID = "target", Caster = "player"},
				--战刃大师
				{AuraID = 213405, UnitID = "target", Caster = "player"},
				--折磨
				{AuraID = 185245, UnitID = "target", Caster = "player"},
				--沉默咒符
				{AuraID = 204490, UnitID = "target", Caster = "player"},
				--烈焰咒符
				{AuraID = 204598, UnitID = "target", Caster = "player"},
				--锁链咒符
				{AuraID = 204843, UnitID = "target", Caster = "player"},
				--灵魂切削
				{AuraID = 207407, UnitID = "target", Caster = "player"},
				--烈火烙印
				{AuraID = 207744, UnitID = "target", Caster = "player"},
				--幽魂炸弹
				{AuraID = 224509, UnitID = "target", Caster = "player"},
				--锋锐之刺
				{AuraID = 210003, UnitID = "target", Caster = "player"},
				--狩猎烙印
				{AuraID = 218640, UnitID = "target", Caster = "player"},
				--悲苦咒符
				{AuraID = 207685, UnitID = "target", Caster = "player"},
         },
      },   
   },
} 
