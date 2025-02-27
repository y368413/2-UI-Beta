--野德运行库
function WR_DruidFeral()
	if GetSpecialization()~=2 then	--如果不是野德(2)专精，则不执行该运行库
		return
	end
	
	ShiFaSuDu=0.05+WRSet.YX_SFSD*0.05
	
	if UnitAffectingCombat("player")==false then	--不在战斗中
		LastSpell=""
	end

	PlayerHP=UnitHealth("player")/UnitHealthMax("player")
	PlayerMove=WR_PlayerMove()	--获得自身是否在移动或者空中
	TargetIsNearby=IsSpellInRange("撕碎","target")	--目标正在附近
	TargetInCombat=WR_TargetInCombat("target")	--目标在战斗
	
	GCD=WR_GetGCD("野性印记")	--获得公共冷却剩余时间或者当前施法剩余时间
	MaxGCD=WR_GetMaxGCD(1.5)	--获得最大的公共冷却时间
	ResistOutburstTime=WR_ResistOutburstTime()	--防御尖刺型伤害剩余时间
	MustDefenseTime_Bear=ResistOutburstTime<=GCD+MaxGCD+0.5	--防御尖刺型伤害剩余时间<=当前GCD剩余时间+最大GCD时间+0.2秒,变熊
	ComboPoints=UnitPower("player",4)	--获得连击点的数量
	if ComboPoints<5 and LastSpell=="野性狂乱" then
		ComboPoints=5
	end
	Energy=UnitPower("player",3)	--获得当前能量值
	MaxEnergy=UnitPowerMax("player",3)	--获得当前能量值
	_ , PowerRegen = GetPowerRegen()	--获得每秒回能
	
	CatForm = WR_GetUnitBuffTime("player","猎豹形态")~=0	--猎豹形态
	BearForm = WR_GetUnitBuffTime("player","熊形态")~=0	--熊形态
	BuffTime_MHZN=WR_GetUnitBuffTime("player","猛虎之怒")	--获得猛虎之怒BUFF的剩余时间
	BuffCount_XXZJ = WR_GetUnitBuffCount("player","血腥爪击")	--获得血腥爪击BUFF的数量
	BuffTime_KB=math.max(WR_GetUnitBuffTime("player","狂暴"),WR_GetUnitBuffTime("player","化身：阿莎曼之灵"))	--获得狂暴BUFF的剩余时间
	
	TargetGLDebuffTime=WR_GetUnitDebuffTime("target","割裂",true)	--获得目标割裂DEBUFF剩余时间
	TargetDeathTime=WR_GetUnitDeathTime("target")	--获得目标死亡时间
	
	HUCountRange5=math.max(WR_GetSpellRangeHarmUnitCount("撕碎",false), WR_GetRangeHarmUnitCount(5,false))
	
	WR_DruidFeral_LastSpellTime()	--获取上一次的技能，利用战斗事件，所以仅运行一次

	TargetClass=UnitClassification("target")--判断单位的分类
	if WR_InTraining() or TargetClass=="worldboss" or TargetClass=="rareelite" or TargetClass=="rare" or TargetClass=="elite" then
	--如果正在训练 或者 单位类型为：世界BOSS 稀有精英 稀有 精英
		TargetClass="精英"
	end
	
	if not IsPlayerSpell(319439)	--未学习[血腥爪击]
	or BuffCount_XXZJ>0 --血腥爪击BUFF存在
	then
		Have_XXZJ = true
	else
		Have_XXZJ = false
	end

	if MSG==1 then
		print("----------")
	end
	
	if WR_PriorityCheck() then return end	--优先检查
	
	if WR_ZNJD(WRSet.YX_ZNJD) then return end	--智能焦点
	
	if WR_Druid_SPS() then return end	--树皮术
	
	if WR_Druid_SCBN() then return end	--生存本能
	
	if WR_Druid_GL() then return end	--甘霖
	
	if WRSet.YX_SP1>=3 then
		if WR_ShiPin(1,WRSet.YX_SP1) then return true end	--饰品 自保/协助
	end
	if WRSet.YX_SP2>=3 then
		if WR_ShiPin(2,WRSet.YX_SP2) then return true end	--饰品 自保/协助
	end
	
	if WR_Druid_ZLS() then return end	--治疗石
	
	if WR_Druid_ZLYS() then return end	--治疗药水
	
	if WR_DruidFeral_ZRDSH() then return end	--自然的守护
	
	if WR_DruidFeral_JCDS() then return end	--解除定身

	if WR_DruidFeral_KBHF() then return end	--施法过程 狂暴回复

	if WR_DruidFeral_BXFY() then return end	--施法过程 变熊防御
	
	if WR_Druid_Function_YTTJ() then return end	--施法过程 迎头痛击

	if WR_DruidFeral_BXZT() then return end	--施法过程 变熊暂停
	
	if WR_DruidFeral_YH() then return end	--愈合

	if WR_Druid_Function_FS() then return end	--施法过程 复生

	if WR_Druid_Function_DHPX() then return end	--施法过程 夺魂咆哮

	if WR_Druid_Function_AF() then return end	--施法过程 安抚

	if WR_Druid_Function_YXYJ() then return end	--施法过程 野性印记

	if WR_Druid_Function_XM() then return end	--施法过程 休眠

	if WR_Druid_Function_QCFS() then return end	--施法过程 清除腐蚀

	if WR_DruidFeral_QX() then return end	--潜行

	if WR_DruidFeral_LBXT() then return end	--猎豹形态

	if WR_DruidFeral_MHZN() then return end	--猛虎之怒

	if WR_DruidFeral_Function_XL("潜行") then return end	--斜掠
	
	if TargetIsNearby and TargetInCombat then	--目标在近战 并且 目标战斗中
		if WRSet.YX_SP1==1 then
			if WR_ShiPin(1,WRSet.YX_SP1) then return true end	--饰品 常驻
		end
		if WRSet.YX_SP2==1 then
			if WR_ShiPin(2,WRSet.YX_SP2) then return true end	--饰品 常驻
		end
	end
	
	if WR_DruidFeral_JBFQ() then return end	--激变蜂群
	
	if WR_DruidFeral_BaoFa() then return end	--爆发

	if WR_DruidFeral_XMSY("免费") then return end	--免费凶猛撕咬

	if WR_DruidFeral_Finish() then return end	--终结技

	if WR_DruidFeral_CP() then return end	--连击技

	if WR_Function_ZNMB(2,WRSet.YX_ZNMB) then return true end	--智能目标

	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	
	if MSG==1 then

	end
end

--终结技
function WR_DruidFeral_Finish()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not CatForm then return false end --不在猎豹形态
	if ComboPoints<5 then return false end	--连击点<5
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetIsNearby then return false end	--目标不在近战范围内
	
	local YSZN = WR_DruidFeral_DPS_YSZN()	--获得原始之怒可造成的伤害
	local GL = WR_DruidFeral_DPS_GL()	--获得割裂可造成的伤害
	local XMSY = WR_DruidFeral_DPS_XMSY()	--获得凶猛撕咬可造成的伤害
	
	local BestFinishSpell="无"	--最佳终结技
	local BestFinishSpellValue=0	--最佳终结技伤害数值
	if XMSY>BestFinishSpellValue then
		BestFinishSpell="凶猛撕咬"
		BestFinishSpellValue=XMSY
	end
	if GL>BestFinishSpellValue then
		BestFinishSpell="割裂"
		BestFinishSpellValue=GL
	end
	if YSZN>BestFinishSpellValue then
		BestFinishSpell="原始之怒"
		BestFinishSpellValue=YSZN
	end
	
	if MSG==1 then
		print("原始之怒:"..YSZN)
		print("割裂:"..GL)
		print("凶猛撕咬:"..XMSY)
		print("最佳终结技:"..BestFinishSpell)
	end
	
	--凶猛撕咬
	if BestFinishSpell=="凶猛撕咬"	--最佳终结技
	--and WR_SpellUsable("凶猛撕咬") --技能可用
	then
		if WR_ColorFrame_Show("CSU","最佳凶猛") then return true end
	end

	--割裂
	if BestFinishSpell=="割裂"	--最佳终结技
	--and WR_SpellUsable("割裂") --技能可用
	then
		--if WR_DruidFeral_GL("终结") then return end	--终结割裂
		if WR_ColorFrame_Show("CSJ","最佳割裂") then return true end
	end

	--原始之怒
	if BestFinishSpell=="原始之怒"	--最佳终结技
	--and WR_SpellUsable("原始之怒") --技能可用
	then
		if WR_ColorFrame_Show("SF10","最佳原始") then return true end
	end
	return false
end

--连击技
function WR_DruidFeral_CP()
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not CatForm then return false end --不在猎豹形态
	if ComboPoints>=5 then return false end --连击点>=5
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetIsNearby then return false end	--目标不在近战范围内

	if WR_DruidFeral_YMHK("满层") then return true end	--野蛮挥砍 满层
	
	if WR_DruidFeral_BestCPSpell() then return true end	--最佳连击技
end

--最佳连击技
function WR_DruidFeral_BestCPSpell()
	local XL_DPS_T = WR_DruidFeral_DPS_XL("target")	--获得斜掠伤害
	local XL_DPS_M = WR_DruidFeral_DPS_XL("mouseover")	--获得斜掠伤害
	local XL_DPS_P1T = WR_DruidFeral_DPS_XL("party1target")	--获得斜掠伤害
	local XL_DPS_P2T = WR_DruidFeral_DPS_XL("party2target")	--获得斜掠伤害
	local XL_DPS_P3T = WR_DruidFeral_DPS_XL("party3target")	--获得斜掠伤害
	local XL_DPS_P4T = WR_DruidFeral_DPS_XL("party4target")	--获得斜掠伤害
	local SS_DPS = WR_DruidFeral_DPS_SS()	--获得撕碎伤害
	local YMHK_DPS = WR_DruidFeral_DPS_YMHK()	--获得野蛮挥砍伤害
	local TJ_DPS = WR_DruidFeral_DPS_TJ()	--获得痛击伤害
	local YHS_DPS = WR_DruidFeral_DPS_YHS()	--获得月火术伤害
	local BestCPSpell=""
	local BestCPSpellValue=0
	
	if XL_DPS_T>BestCPSpellValue then
		BestCPSpell="斜掠T"
		BestCPSpellValue=XL_DPS_T
	end
	if XL_DPS_M>BestCPSpellValue then
		BestCPSpell="斜掠M"
		BestCPSpellValue=XL_DPS_M
	end
	if XL_DPS_P1T>BestCPSpellValue then
		BestCPSpell="斜掠P1T"
		BestCPSpellValue=XL_DPS_P1T
	end
	if XL_DPS_P2T>BestCPSpellValue then
		BestCPSpell="斜掠P2T"
		BestCPSpellValue=XL_DPS_P2T
	end
	if XL_DPS_P3T>BestCPSpellValue then
		BestCPSpell="斜掠P3T"
		BestCPSpellValue=XL_DPS_P3T
	end
	if XL_DPS_P4T>BestCPSpellValue then
		BestCPSpell="斜掠P4T"
		BestCPSpellValue=XL_DPS_P4T
	end
	if SS_DPS>BestCPSpellValue then
		BestCPSpell="撕碎"
		BestCPSpellValue=SS_DPS
	end
	if YMHK_DPS>BestCPSpellValue then
		BestCPSpell="野蛮挥砍"
		BestCPSpellValue=YMHK_DPS
	end
	if TJ_DPS>BestCPSpellValue then
		BestCPSpell="痛击"
		BestCPSpellValue=TJ_DPS
	end
	if YHS_DPS>BestCPSpellValue then
		BestCPSpell="月火术"
		BestCPSpellValue=YHS_DPS
	end
	
	if MSG==1 then
		print("斜掠T:"..XL_DPS_T)
		print("斜掠M:"..XL_DPS_M)
		print("撕碎:"..SS_DPS)
		print("野蛮挥砍:"..YMHK_DPS)
		print("痛击:"..TJ_DPS)
		print("月火术:"..YHS_DPS)
		print("最佳连击技:"..BestCPSpell)
	end
	
	if BestCPSpell=="斜掠T" then
		if WR_DruidFeral_Function_XL("T") then return true end
	elseif BestCPSpell=="斜掠M" then
		if WR_DruidFeral_Function_XL("M") then return true end
	elseif BestCPSpell=="斜掠P1T" then
		if WR_DruidFeral_Function_XL("P1T") then return true end
	elseif BestCPSpell=="斜掠P2T" then
		if WR_DruidFeral_Function_XL("P2T") then return true end
	elseif BestCPSpell=="斜掠P3T" then
		if WR_DruidFeral_Function_XL("P3T") then return true end
	elseif BestCPSpell=="斜掠P4T" then
		if WR_DruidFeral_Function_XL("P4T") then return true end
	elseif BestCPSpell=="撕碎" then
		if WR_ColorFrame_Show("CSI","撕碎") then return true end
	elseif BestCPSpell=="野蛮挥砍" then
		if WR_DruidFeral_YMHK("最佳") then return true end
	elseif BestCPSpell=="痛击" then
		if WR_ColorFrame_Show("CSH","痛击") then return true end
	elseif BestCPSpell=="月火术" then
		if WR_ColorFrame_Show("CSL","月火术") then return true end
	end
	return false
end

--迅捷愈合
function WR_DruidFeral_YH()
	if GCD<=ShiFaSuDu	--公共冷却时间<=施法速度
	and WRSet.YX_YH~=6	--愈合 选项不是关闭的
	and PlayerHP<WRSet.YX_YH/10 --血量比例<设定值/10
	and WR_SpellUsable("愈合")	--技能可用
	and WR_GetUnitBuffTime("player","掠食者的迅捷")>GCD --掠食者的迅捷 BUFF存在
	then
		if WR_ColorFrame_Show("SF6","迅捷愈合") then return true end
	end
	return false
end

--自然的守护
function WR_DruidFeral_ZRDSH()
	if WRSet.YX_ZRDSH==1 --自然的守护 开启
	and UnitAffectingCombat("player") --玩家在战斗
	and WR_SpellUsable("自然的守护") --技能可用
	and WR_PartyLostHP("愈合")>0.40 --全队掉血比例
	then
		if WR_ColorFrame_Show("ASF6","自然守护") then return true end
	end
	return false
end

--解除定身
function WR_DruidFeral_JCDS()
	if WRSet.YX_JCDS==1 --解除定身开启
	and CatForm --猎豹形态
	and WR_Unbind("player") --单位有可以解除定身的状态
	then
		if WR_ColorFrame_Show("CF10","解除变形") then return true end
	end
	return false
end

--施法过程 狂暴回复
function WR_DruidFeral_KBHF()
	if BearForm --熊形态
	and IsPlayerSpell(22842)	--已学 狂暴回复
	and WR_SpellUsable("狂暴回复") --技能可用 资源可用
	then
		if WR_ColorFrame_Show("CF5","狂暴回复") then return true end
	end
	return false
end

--施法过程 变熊防御
function WR_DruidFeral_BXFY()
	if WRSet.YX_BXFY==1 --变熊防御 开启
	and WR_SpellUsable("熊形态") --技能可用 资源可用
	and MustDefenseTime_Bear --必须变熊
	and not BearForm --不是 熊形态
	then
		if WR_ColorFrame_Show("CF7","变熊防御") then return true end
	end
	return false
end

--施法过程 变熊暂停
function WR_DruidFeral_BXZT()
	if MustDefenseTime_Bear and BearForm and PlayerHP>0.5 then
	--必须开变熊	并且	当前是熊形态	并且	玩家血量>50%
		if WR_ColorFrame_Show("Stop","变熊暂停") then return true end
	end
	return false
end

--潜行
function WR_DruidFeral_QX()
	if WR_SpellUsable("潜行") --技能可用
	and WR_GetUnitBuffTime("player","潜行")==0 --潜行 不存在
	then
		if WR_ColorFrame_Show("ASF7","潜行") then return true end
	end
	return false
end
	
--猎豹形态
function WR_DruidFeral_LBXT()
	if not CatForm --猎豹形态 不存在
	and GCD<=ShiFaSuDu
	and WR_SpellUsable("猎豹形态") --技能可用
	then
		if WR_ColorFrame_Show("CF8","猎豹形态") then return true end
	end
	return false
end

--猛虎之怒
function WR_DruidFeral_MHZN()
	if zhandoumoshi==1	--爆发开启
	and TargetIsNearby	--目标在近战范围内
	and WR_SpellUsable("猛虎之怒") --技能可用
	and
	(
		Energy<105	--能量<105
		or
		ComboPoints==5	--连击点=5
		or
		(
			ComboPoints>=3	--连击点>=3
			and
			TargetGLDebuffTime<=5.7	--目标割裂DEBUFF时间<=5.7
			and
			BuffCount_XXZJ>=1	--血腥爪击 BUFF存在
		)
	)
	then
		if WR_ColorFrame_Show("SF5","猛虎之怒") then return true end
	end
	return false
end

--激变蜂群
function WR_DruidFeral_JBFQ()
	if GCD<=ShiFaSuDu
	and CatForm	--猎豹形态
	and TargetInCombat	--目标战斗中
	and TargetIsNearby	--目标在近战范围内
	and WR_SpellUsable("激变蜂群")	--技能可用
	and HUCountRange5<=1
	then
		if WR_ColorFrame_Show("SF12","激变蜂群") then return true end
	end
	return false
end

--斜掠
function WR_DruidFeral_XL(Unit,Text)
	local TempTime = 15 * 0.3
	if IsPlayerSpell(400320) then TempTime = TempTime * 0.8 end	--已学[生死循环]
	
	if C_Spell.IsSpellInRange("撕碎",Unit)	--目标在近战范围内
	and WR_TargetInCombat(Unit) --单位战斗中
	and WR_GetUnitDebuffTime(Unit,"斜掠",true)<=TempTime --斜掠 debuff剩余时间
	and WR_GetUnitDeathTime(Unit)>6	--单位存活时间>6
	then
		if Unit=="target" then
			if WR_ColorFrame_Show("AN9","斜掠T") then return true end
		elseif Unit=="mouseover" then
			if WR_ColorFrame_Show("AN0","斜掠M") then return true end
		elseif Unit=="party1target" then
			if WR_ColorFrame_Show("CN7","斜掠P1T") then return true end
		elseif Unit=="party2target" then
			if WR_ColorFrame_Show("CN8","斜掠P2T") then return true end
		elseif Unit=="party3target" then
			if WR_ColorFrame_Show("CN9","斜掠P3T") then return true end
		elseif Unit=="party4target" then
			if WR_ColorFrame_Show("CN0","斜掠P4T") then return true end
		end
	end
	return false
end

--施法过程 斜掠
function WR_DruidFeral_Function_XL(Text)
	if GCD>ShiFaSuDu then return false end	--公共冷却时间>施法速度
	if not WR_SpellUsable("斜掠") then return false end	--技能不可用
	if not CatForm and not IsPlayerSpell(449193) then return false end --不在猎豹形态并且也没学习[自如变形]天赋
	if ComboPoints>=5 then return false end --连击点>=5满了

	if Text=="潜行" and WR_GetUnitBuffTime("player","潜行")>0 then
		if WR_DruidFeral_XL("target",Text) then return true end
		if WR_DruidFeral_XL("mouseover",Text) then return true end
		for i = 1 , 4 do
		local TempUnit="party"..i.."target"
			if WR_DruidFeral_XL(TempUnit,Text) then return true end
		end
	elseif Text=="T" then
		if WR_DruidFeral_XL("target",Text) then return true end
	elseif Text=="M" then
		if WR_DruidFeral_XL("mouseover",Text) then return true end
	elseif Text=="P1T" then
		if WR_DruidFeral_XL("party1target",Text) then return true end
	elseif Text=="P2T" then
		if WR_DruidFeral_XL("party2target",Text) then return true end
	elseif Text=="P3T" then
		if WR_DruidFeral_XL("party3target",Text) then return true end
	elseif Text=="P4T" then
		if WR_DruidFeral_XL("party4target",Text) then return true end
	end
	return false
end

--凶猛撕咬
function WR_DruidFeral_XMSY(Text)
	if not CatForm then return false end --不在猎豹形态
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetIsNearby then return false end	--目标不在近战范围内
	if not WR_SpellUsable("凶猛撕咬") then return false end	--技能不可用
	
	if ( Text=="免费" and Have_XXZJ and WR_GetUnitBuffTime("player","顶级捕食者的渴望")>GCD )	--血腥爪击存在 触发顶级捕食者的渴望(免费)
	or
	(
		Text=="终结"
		and
		ComboPoints>=5	--连击点>=5
	)
	then
		if WR_ColorFrame_Show("CSU",Text.."凶猛") then return true end
	end
	return false
end

--施法过程 割裂
function WR_DruidFeral_GL(Text)
	if not CatForm then return false end --不在猎豹形态
	if ComboPoints<5 then return false end --连击点<5
	if not Have_XXZJ then return false end	--血腥爪击 不存在
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetIsNearby then return false end	--目标不在近战范围内
	if not WR_SpellUsable("割裂") then return false end	--技能不可用

	if Text=="终结"
	then
		if WR_ColorFrame_Show("CSJ",Text.."割裂") then return true end
	end
	return false
end

--计算原始之怒的伤害
function WR_DruidFeral_DPS_YSZN()
	if not(IsPlayerSpell(285381)) then return 0 end	--没学习[原始之怒]285381
	if HUCountRange5<=1 then return 0 end	--单体

	local yszn = WR_GetSpellValue("原始之怒","5点：造成","点")	--初始化原始之怒直接伤害
	local gl = WR_GetSpellValue("割裂","5点.*造成","点")	--初始化割裂的伤害
	if IsPlayerSpell(391347) then gl=gl*(1+0.15) end	--学习了[撕裂切割]391347
	local gl_Time = WR_GetSpellValue("割裂","5点：在","秒")	--初始化割裂的持续时间
	local gl_dps=gl/gl_Time	--获得原始之怒（割裂）的持续秒伤
	local yszn_Time=WR_GetSpellValue("原始之怒","5点.*持续","秒")	--初始化原始之怒持持续时间
	--计算5码范围内每个单位受到的直接伤害+割裂持续伤害+【旧伤新痛】造成的伤害
	local i
	local ysznSum=0	--初始化 原始之怒 总伤害
	for i=1,40,1
	do
		local ysznTemp=0	--初始化 原始之怒 单体伤害
		if ( C_Spell.IsSpellInRange("撕碎","nameplate"..i) or WR_GetUnitRange("nameplate"..i)<=5 ) and WR_TargetInCombat("nameplate"..i) then	--单位在近战范围内 并且 单位可战斗
			local Unit_GL_Time = WR_GetUnitDebuffTime("nameplate"..i,"割裂",true)	--获得单位割裂DEBUFF剩余时间
			if Unit_GL_Time<=yszn_Time*0.3 then --单位割裂DEBUFF时间<=原始之怒持续时间*0.3
				local NPdeathtime=WR_GetUnitDeathTime("nameplate"..i)	--获取单位死亡时间
				if NPdeathtime>=yszn_Time+Unit_GL_Time then	--单位死亡时间>=原始之怒持续时间+割裂剩余时间
					ysznTemp=yszn+gl_dps*yszn_Time	--原始之怒+割裂*原始之怒持续时间
				else	--单位死亡时间<原始之怒持续时间
					ysznTemp=yszn+gl_dps*math.max(NPdeathtime-Unit_GL_Time,0)	--原始之怒直伤+原始之怒秒伤*(可续时间或0)
				end
			end
		end
		ysznSum=ysznSum+ysznTemp	--把每一个单位受到伤害累计
	end
	return ysznSum
end

--计算割裂的伤害
function WR_DruidFeral_DPS_GL()
	if not UnitExists("target") then return 0 end	--单位不存在
	if TargetClass~="精英" then return 0 end	--如果不是精英，就不要上流血

	local gl_Time = WR_GetSpellValue("割裂","5点：在","秒")	--初始化割裂的持续时间
	if TargetGLDebuffTime>gl_Time*0.3 then return 0 end	--当目标割裂时间>持续时间*0.3（满继承），则不续割裂

	local gl_Sum = 0
	local gl = WR_GetSpellValue("割裂","5点.*造成","点")	--初始化割裂的伤害
	if IsPlayerSpell(391347) then gl=gl*(1+0.15) end	--学习了[撕裂切割]391347
	local gl_dps=gl/gl_Time	--获得割裂的持续秒伤
	if TargetDeathTime>=TargetGLDebuffTime+gl_Time then	--目标死亡时间>=目标割裂剩余时间+割裂持续时间
		gl_Sum = gl_dps * gl_Time	--割裂秒伤*割裂持续时间，本次割裂实际能打出的伤害
	else
		gl_Sum = gl_dps * ( TargetDeathTime - TargetGLDebuffTime )	--割裂秒伤*(目标死亡时间-目标割裂时间)，本次割裂实际能打出的伤害
	end
	--print(gl_Sum)
	return gl_Sum
end

--计算凶猛撕咬的伤害
function WR_DruidFeral_DPS_XMSY()
	if not UnitExists("target") then return 0 end	--单位不存在
	
	--初始化凶猛撕咬
	local xmsy = WR_GetSpellValue("凶猛撕咬","5点：","点")	--初始化原始之怒直接伤害
	local xmsy_Sum=0
	local xmsy_Sum_Add=0
	
	local JCLH=0
	if IsPlayerSpell(421432) then
	--[剑齿利喉]提高额外凶猛撕咬伤害的80%
		JCLH=0.8
	end
	
	local Energy=25
	if Energy>=25*2 then	--如果能量>=25*2
		xmsy_Sum=xmsy*(2+JCLH)	--能量>=25*2,伤害增加100%
		xmsy_Sum_Add=xmsy+xmsy*(1+JCLH)*0.5	--能量>=凶猛撕咬能量,增加伤害/凶猛撕咬能量*（当前能量-凶猛撕咬能量）*(1+剑齿利喉)*0.5([野性难驯]额外能量获得伤害减半)
	elseif Energy>=25 then
		xmsy_Sum=xmsy+xmsy/25*(Energy-25)*(1+JCLH)	--能量>=凶猛撕咬能量,增加伤害/凶猛撕咬能量*（当前能量-凶猛撕咬能量）*(1+剑齿利喉)
		xmsy_Sum_Add=xmsy+xmsy/25*(Energy-25)*(1+JCLH)*0.5	--能量>=凶猛撕咬能量,增加伤害/凶猛撕咬能量*（当前能量-凶猛撕咬能量）*(1+剑齿利喉)*0.5([野性难驯]额外能量获得伤害减半)
	end
	
	local HaveGLDebuffInRange5=WR_GetHaveDebuffRangeUnitCount(5,"割裂",false)
	if HaveGLDebuffInRange5>=2 and IsPlayerSpell(391709) then
	--5码内中割裂的单位>=2 并且 已学习[野性难驯]391709
		return xmsy_Sum+WR_DamageMitigation(xmsy_Sum_Add,HaveGLDebuffInRange5-1,6)
	end
	
	return xmsy_Sum
end

--爆发
function WR_DruidFeral_BaoFa()
	if not CatForm then return false end --不在猎豹形态
	if not TargetInCombat then return false end	--单位不在战斗中
	if not TargetIsNearby then return false end	--目标不在近战范围内
	if zhandoumoshi~=1 then return false end	--没有开启爆发
	if TargetGLDebuffTime==0 then return false end	--目标没有割裂BUFF(先上割裂)

	--狂暴
	if 
	(
		IsPlayerSpell(102543)	--已学 化身：阿莎曼之灵
		and
		WR_SpellUsable("化身：阿莎曼之灵")
	)
	or
	(
		not IsPlayerSpell(102543)	--没学 化身：阿莎曼之灵
		and
		WR_SpellUsable("狂暴")
	)
	then
		if WRSet.YX_SP1==2 then
			if WR_ShiPin(1,WRSet.YX_SP1) then return true end	--饰品 爆发
		end
		if WRSet.YX_SP2==2 then
			if WR_ShiPin(2,WRSet.YX_SP2) then return true end	--饰品 爆发
		end
		
		if WR_ColorFrame_Show("SF3","狂暴化身") then return true end
	end
	
	--野性狂乱
	if GCD<=ShiFaSuDu	--公共冷却时间<=施法速度
	and WR_SpellUsable("野性狂乱")
	and
	(
		ComboPoints<=1	--连击点<=1
		or
		(
			BuffTime_KB>GCD	--狂暴 BUFF存在
			and
			ComboPoints<=2	--连击点<=2
		)
	)
	then
		if WR_ColorFrame_Show("SF7","野性狂乱") then return true end
	end
	
	--万灵之召
	if GCD<=ShiFaSuDu	--公共冷却时间<=施法速度
	and WR_SpellUsable("万灵之召")
	and
	(
		(
			BuffTime_MHZN>GCD	--猛虎之怒 BUFF存在
			and
			ComboPoints<=2	--连击点<=2
		)
		or
		(
			BuffTime_KB>GCD	--狂暴 BUFF存在
			and
			ComboPoints<=3	--连击点<=3
		)
	)
	then
		if WR_ColorFrame_Show("CF6","万灵之召") then return true end
	end
	
	return false
end

--获取上一次的技能，利用战斗事件，所以仅运行一次
function WR_DruidFeral_LastSpellTime()
	if LastSpellIsOpen then return end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
			if select(4, CombatLogGetCurrentEventInfo())==UnitGUID("player") then
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="斜掠" then
					--如果释放成功的是斜掠
						XLTime=GetTime()
						LastSpell="斜掠"
					elseif SpellName=="撕碎" then
					--如果释放成功的是撕碎
						SSTime=GetTime()
						LastSpell="撕碎"
					elseif SpellName=="野蛮挥砍" then
					--如果释放成功的是野蛮挥砍
						YMHKTime=GetTime()
						LastSpell="野蛮挥砍"
					elseif SpellName=="痛击" then
					--如果释放成功的是痛击
						TJTime=GetTime()
						LastSpell="痛击"
					elseif SpellName=="野性狂乱" then
					--如果释放成功的是野性狂乱
						YXKLTime=GetTime()
						LastSpell="野性狂乱"
					elseif SpellName=="横扫" then
					--如果释放成功的是野性狂乱
						HSTime=GetTime()
						LastSpell="横扫"
					elseif SpellName=="月火术" then
					--如果释放成功的是月火术
						YHSTime=GetTime()
						LastSpell="月火术"
					elseif SpellName=="凶猛撕咬" then
					--如果释放成功的是凶猛撕咬
						LastSpell="凶猛撕咬"
					elseif SpellName=="割裂" then
					--如果释放成功的是割裂
						LastSpell="割裂"
					elseif SpellName=="原始之怒" then
					--如果释放成功的是原始之怒
						LastSpell="原始之怒"
					end
				end
			end
	end)
	LastSpellIsOpen=true                       
end

--计算野蛮挥砍的伤害
function WR_DruidFeral_DPS_YMHK()
	if not IsPlayerSpell(202028) then return 0 end --如果没有学习野蛮挥砍天赋
	if not WR_SpellUsable("野蛮挥砍") then return 0 end	--技能不可使用

	local YMHK_Sum=0
	if YMHKTime==nil	--第一次施法
	or GetTime()-YMHKTime>4	--距离上次施法已过去4秒
	or BuffCount_XXZJ>=2	--血腥爪击层数>=2(可以不考虑续血爪)
	or not IsPlayerSpell(319439)	--没有学习 血腥爪击
	then
		local ymhk = WR_GetSpellValue("野蛮挥砍","造成","点")	--初始化 野蛮挥砍 伤害

		if IsPlayerSpell(231063) then	--如果学习了[无情爪击]231063
			ymhk=ymhk*(1+0.15)	--[无情爪击]提高野蛮挥砍15%伤害
		end
		
		YMHK_Sum=WR_DamageMitigation(ymhk,HUCountRange5,6)
	end
	return YMHK_Sum
end

--计算痛击的伤害
function WR_DruidFeral_DPS_TJ()
	if IsPlayerSpell(405300) then return 0 end --如果学习[痛击之爪]天赋(自动痛击)
	--if not WR_SpellUsable("痛击") then return 0 end	--技能不可使用

	local tj=WR_GetSpellValue(106830,"造成","点")	--初始化 痛击 直接伤害
	local tj_Dot=WR_GetSpellValue(106830,"额外造成","点")	--初始化 痛击 DOT伤害
	local tj_Time=WR_GetSpellValue(106830,"随后的","秒")	--初始化 痛击 持续时间
	local tj_Dps=tj_Dot/tj_Time	--获得痛击秒伤

	--计算每一个能够被痛击攻击到的单位，统计他们受到的伤害
	local TJ_Sum=0	--初始化痛击总伤害
	if TJTime==nil	--第一次施法
	or GetTime()-TJTime>4	--距离上次施法已过去4秒
	or BuffCount_XXZJ>=2	--血腥爪击层数>=2(可以不考虑续血爪)
	or not IsPlayerSpell(319439)	--没有学习 血腥爪击
	then
		for i=1,40,1
		do
			local tjTemp=0	--初始化痛击单体伤害
			if ( C_Spell.IsSpellInRange("撕碎","nameplate"..i) or WR_GetUnitRange("nameplate"..i)<=5 ) and WR_TargetInCombat("nameplate"..i) then	--单位在近战范围内 并且 单位可战斗
				local Unit_TJ_Time = WR_GetUnitDebuffTime("nameplate"..i,"痛击",true)	--获得单位割裂DEBUFF剩余时间
				if Unit_TJ_Time<=tj_Time*0.3 then	--当前痛击DEBUFF时间<=可续时间
					local NPdeathtime=WR_GetUnitDeathTime("nameplate"..i)	--获取单位死亡时间
					if NPdeathtime>=tj_Time+Unit_TJ_Time then	--如果单位死亡时间>痛击最大DEBUFF+痛击DEBUFF剩余时间，获得最大续时
						tjTemp=tj+tj_Dps*tj_Time	--获得最大续时
					else	--如果单位死亡时间<tj_Time+痛击DEBUFF时间，获得单位死亡时间-当前痛击时间的续时
						tjTemp=tj+tj_Dps*math.max(NPdeathtime-Unit_TJ_Time,0)	--痛击直伤+痛击秒伤*(可续时间或0)
					end
				end
			end
			TJ_Sum=TJ_Sum+tjTemp
		end
	end
	return TJ_Sum
end

--计算斜掠的伤害
function WR_DruidFeral_DPS_XL(Unit)
	if not IsSpellInRange("撕碎",Unit) then return 0 end	--单位不在近战范围内
	
	local UnitClass=UnitClassification(Unit)--判断单位的分类
	if WR_InTraining() or UnitClass=="worldboss" or UnitClass=="rareelite" or UnitClass=="rare" or UnitClass=="elite" then
	--如果正在训练 或者 单位类型为：世界BOSS 稀有精英 稀有 精英
		UnitClass="精英"
	end
	--if UnitClass~="精英" then return 0 end	--如果不是精英，就不要上流血
	
	local xl_Time = WR_GetSpellValue("斜掠","在","秒")	--初始化斜掠的最大持续时间
	local UnitDebuffTime_XL=WR_GetUnitDebuffTime(Unit,155722,true)	--获得目标斜掠DEBUFF剩余时间
	if UnitDebuffTime_XL>xl_Time*0.3 then return 0 end	--当目标斜掠时间>斜掠最大时间*30%，则不续斜掠
	
	local xl = WR_GetSpellValue("斜掠","造成","点")	--初始化斜掠的伤害
	local xl_Dot = WR_GetSpellValue("斜掠","额外造成","点")	--初始化斜掠的伤害
	local xl_dps=xl_Dot/xl_Time	--获得斜掠的持续秒伤
	
	local XL_Sum=0
	if XLTime==nil	--第一次施法
	or GetTime()-XLTime>4	--距离上次施法已过去4秒
	or BuffCount_XXZJ>=2	--血腥爪击层数>=2(可以不考虑续血爪)
	or not IsPlayerSpell(319439)	--没有学习 血腥爪击
	then
		local Unitdeathtime=WR_GetUnitDeathTime(Unit)	--获取单位死亡时间
		if Unitdeathtime>=UnitDebuffTime_XL+xl_Time then	--目标死亡时间>=目标斜掠剩余时间+斜掠的最大持续时间
			XL_Sum=xl+xl_dps*xl_Time	--斜掠+斜掠秒伤*斜掠最大时间，本次斜掠实际能打出的伤害
		else
			XL_Sum=xl+xl_dps*math.max(Unitdeathtime-UnitDebuffTime_XL,0)	--斜掠+斜掠秒伤*(目标死亡时间-目标斜掠时间)，本次斜掠实际能打出的伤害
		end
		
		if WR_GetNoDebuffRangeUnitCount(5,"斜掠",false)>=2 and IsPlayerSpell(391700) then	--5码内没有斜掠的单位>=2 并且 [双爪斜掠]已学习
			XL_Sum=XL_Sum*2
		end
		return XL_Sum
	end
	return XL_Sum
end

--计算撕碎的伤害
function WR_DruidFeral_DPS_SS()
	if not IsSpellInRange("撕碎","target") then return 0 end	--单位不在近战范围内
	
	local ss=0	--初始化撕碎伤害
	if SSTime==nil	--第一次施法
	or GetTime()-SSTime>4	--距离上次施法已过去4秒
	or BuffCount_XXZJ>=2	--血腥爪击层数>=2(可以不考虑续血爪)
	or not IsPlayerSpell(319439)	--没有学习 血腥爪击
	then
		ss = WR_GetSpellValue("撕碎","造成","点")	--初始化撕碎的伤害
		if IsPlayerSpell(231063) then ss=ss*(1+0.2) end	--[无情爪击]提高撕碎20%伤害
	end
	
	return ss
end

--计算月火术的伤害
function WR_DruidFeral_DPS_YHS()
	if not IsSpellInRange("月火术","target") then return 0 end	--单位不在近战范围内
	if not CatForm then return 0 end	--不在猎豹形态
	if not IsPlayerSpell(155580) then return 0 end	--没有学习 月之灵
	
	local YHS_Time = WR_GetSpellValue(155625,"在","秒")	--初始化月火术的最大持续时间
	local UnitDebuffTime_YHS=WR_GetUnitDebuffTime("target","月火术",true)	--获得目标月火术DEBUFF剩余时间
	if UnitDebuffTime_YHS>YHS_Time*0.3 then return 0 end	--当目标月火术时间>月火术最大时间*30%，则不续月火术
	
	local YHS = WR_GetSpellValue(155625,"造成","点")	--初始化月火术的伤害
	local YHS_Dot = WR_GetSpellValue(155625,"额外造成","点")	--初始化月火术的伤害
	local YHS_dps=YHS_Dot/YHS_Time	--获得月火术的持续秒伤
	
	local YHS_Sum=0
	if YHSTime==nil	--第一次施法
	or GetTime()-YHSTime>4	--距离上次施法已过去4秒
	or BuffCount_XXZJ>=2	--血腥爪击层数>=2(可以不考虑续血爪)
	or not IsPlayerSpell(319439)	--没有学习 血腥爪击
	then
		local Unitdeathtime=WR_GetUnitDeathTime("target")	--获取单位死亡时间
		if Unitdeathtime>=UnitDebuffTime_YHS+YHS_Time then	--目标死亡时间>=目标月火术剩余时间+月火术的最大持续时间
			YHS_Sum=YHS+YHS_dps*YHS_Time	--月火术+月火术秒伤*月火术最大时间，本次月火术实际能打出的伤害
		else
			YHS_Sum=YHS+YHS_dps*math.max(Unitdeathtime-UnitDebuffTime_YHS,0)	--月火术+月火术秒伤*(目标死亡时间-目标月火术时间)，本次月火术实际能打出的伤害
		end

		return YHS_Sum
	end
	return YHS_Sum
end

--野蛮挥砍
function WR_DruidFeral_YMHK(Text)
	if not WR_SpellUsable("野蛮挥砍") then return false end	--技能不可用
	
	if
	(
		Text=="满层"
		and
		(
			YMHKTime==nil	--第一次施法
			or
			GetTime()-YMHKTime>4	--距离上次施法已过去4秒
			or
			BuffCount_XXZJ>=2	--血腥爪击层数>=2
			or
			not IsPlayerSpell(319439)	--没有学习 血腥爪击
		)
		and
		(
			WR_GetSpellCharges("野蛮挥砍")==3	--野蛮挥砍 层数=3
			or
			(
				WR_GetSpellCharges("野蛮挥砍")==2	--野蛮挥砍 层数=2
				and
				WR_GetSpellNextCharge("野蛮挥砍")<4	--野蛮挥砍 恢复次数剩余时间<4秒
			)
		)
		and
		(
			HUCountRange5>=2	--近战距离敌人数量>=2
			or
			WR_GetUnitDebuffTime("target","斜掠",true)>GCD	--目标已有斜掠BUFF
		)
	)
	or Text=="最佳"
	then
		if WR_ColorFrame_Show("SF8",Text.."挥砍") then return true end
	end
	return false
end






































