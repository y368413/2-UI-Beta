	
----Ŀ��ս����⣬���������������������ִ�в���-------------------------------------------------------------
	if 
	not(
		UnitExists("target")
		--��λ����
		and
		not(UnitIsDead("target"))
		--��λ���
		and
		UnitCanAttack("player","target")
		--��λ�ж�
		and
		TargetInCombat
		--��λս��
		and
		IsSpellInRange("�»���","target")==1
		--��λ�ڼ��ܷ�Χ��
	)
	then
		WR_HideColorFrame(0) --��������ɫ�鴰��
		WR_HideColorFrame(1) --��������ɫ�鴰��
		return
	end
----Ŀ��ս����⣬���������������������ִ�в���-------------------------------------------------------------

	--��Ʒ1--------------------------------------------------------------------------------------------	
	if (WRSet.PH_SP==1 or WRSet.PH_SP==3)
	--ʹ��1����Ʒ �� ʹ��1-2����Ʒ
	and HuaShenBuffTime>10
	--����BUFFʱ��>10��
	and WR_GetEquipCD(13) then
	--1����Ʒ����ʹ��
		WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
		WR_ShowColorFrame("ACF1","��Ʒ1",zhandoumoshi) --��ʾָ��ɫ�鴰��
		return
	end
	--��Ʒ1--------------------------------------------------------------------------------------------	
	--��Ʒ2--------------------------------------------------------------------------------------------	
		if (WRSet.PH_SP==2 or WRSet.PH_SP==3)
		--ʹ��2����Ʒ �� ʹ��1-2����Ʒ
		and HuaShenBuffTime>10
		--����BUFFʱ��>10��
		and WR_GetEquipCD(14) then
		--2����Ʒ����ʹ��
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("ACF2","��Ʒ2",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
	--��Ʒ2--------------------------------------------------------------------------------------------	

----����ѭ��--------------------------------------------------------------------------------------------------------------------------		
	if 
    (
        WRSet.PH_XHLX==1
        --ѭ������ ����
        and
        (
            HUCountRange45<=1
            --45������<=1
            or
            SingleUnit
            --�ǵ���Ŀ��
        )
    )
    or
    WRSet.PH_XHLX==2
    --ѭ������ ����
	then
		--������ӿ-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYong()
		--��ӿ�� ʩ������
		and
		NextPower>=80
		--�ǽ�����>=80
		and
		(
			RiShiBuffTime>GCD
			--��ʴʱ��>������ȴʱ��
			or
			YueShiBuffTime>GCD
			--��ʴʱ��>������ȴʱ��
			or
			(
				FenNuCount==1
				--��ŭ����==1
				and
				FenNuCasting
				--����ʩ�ŷ�ŭ
			)
			or
			(
				XingHuoShuCount==1
				--�ǻ�������==1
				and
				XingHuoShuCasting
				--����ʩ���ǻ���
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("ACN9","S������",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF7","S������ӿ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--������ӿ-------------------------------------------------------------------------------------------------
	
		--�»���-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(8921)
		--��ѧ���� �»���
		and
		TargetDeathTime>=6
		--Ŀ������ʱ��>=6��
		and
		WR_CanDot()
		--������DOT�ĵ�λ
		and
		YueHuoShuDebuffTime<=6.6
		--�»���debuffʣ��ʱ��
		and
		(
			(YueShiBuffTime==0 and RiShiBuffTime==0)
			or
			YueShiBuffTime>2
			or
			RiShiBuffTime>2
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF8","S�»���",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�»���-------------------------------------------------------------------------------------------------	

		--������-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(93402)
		--��ѧ���� ������
		and
		TargetDeathTime>=6
		--Ŀ������ʱ��>=6��
		and
		WR_CanDot()
		--������DOT�ĵ�λ
		and
		YangYanShuDebuffTime<=5.4
		--������debuffʣ��ʱ��
		and
		(
			(YueShiBuffTime==0 and RiShiBuffTime==0)
			or
			YueShiBuffTime>2
			or
			RiShiBuffTime>2
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF9","S������",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--������-------------------------------------------------------------------------------------------------	
	
		--������¶��֮��-------------------------------------------------------------------------------------------------
		if WRSet.PH_HS==1
		--���� ����
		and
		zhandoumoshi==1
		--������
		and
		HuaShenBuffTime==0
		--��������
		and
		IsPlayerSpell(102560)
		--��ѧ���� ������¶��֮��
		and
		WR_GetSpellCD("������¶��֮��")<=GCD
		--������ȴ
		then
			--����-------------------------------------------------------------------------------
			if 
			(
				MM_BuffCount==2
				--����BUFF����==2
				or
				(
					MM_BuffCount==1
					--����BUFF����==1
					and
					UnitCastingInfo("player")~="�ǻ���"
					--��ǰʩ�������ǻ���
					and
					UnitCastingInfo("player")~="��ŭ"
					--��ǰʩ�����Ƿ�ŭ
				)
			)
			then
				--�����ǻ�-----------------------------------------------------------------------
				if WR_DruidBalance_XingHuoShu()
				--�ǻ��� ʩ������
				and
				XingHuoShuCastTime<YueShiBuffTime
				--�ǻ���ʩ��ʱ��<��ʴBUFFʣ��ʱ��
				then
					WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
					WR_ShowColorFrame("SF2","S�����ǻ�",zhandoumoshi) --��ʾָ��ɫ�鴰��
					return
				end
				--�����ǻ�-----------------------------------------------------------------------
				
				--���η�ŭ-----------------------------------------------------------------------
				if WR_DruidBalance_FenNu()
				--��ŭ ʩ������
				then
					WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
					WR_ShowColorFrame("CF11","S���η�ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
					return
				end
				--���η�ŭ-----------------------------------------------------------------------
			end
			--����-------------------------------------------------------------------------------
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CSI","S����",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--������¶��֮��-------------------------------------------------------------------------------------------------	
	
		--��ӿ��-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		and
		AoNengCount>=560
		--ԭʼ����������>=560
		and
		WR_DruidBalance_XingYong()
		--��ӿ�� ʩ������
		and
		(
			(
				IsPlayerSpell(202770)
				--��ѧ��¶��֮ŭ
				and
				CD_ALEZN<=GCD
				--��¶��֮ŭCD����
			)
			or
			(
				IsPlayerSpell(274281)
				--��ѧ����
				and
				ManYue>=1
				--���´���>=1
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("ACN9","S������",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF7","S��ӿ����",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��ӿ��-------------------------------------------------------------------------------------------------
	
		--��¶����սʿ-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		--������
		and
		IsPlayerSpell(202425)
		--��ѧ[��¶����սʿ]
		and
		WR_GetSpellCD("��¶����սʿ")<=GCD
		--������ȴ
		and
		RiShiBuffTime<=7
		--��ʴBUFFʱ��<=7��
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF6","S��ս",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��¶����սʿ-------------------------------------------------------------------------------------------------

		--�ǻ���-------------------------------------------------------------------------------------------------
		if 
		WR_DruidBalance_XingHuoShu_InEclipse()
		--�ǻ��� ��ʴ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF2","S�ǻ�ʴ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�ǻ���-------------------------------------------------------------------------------------------------
	
		--��¶��֮ŭ-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_ALEZN()
		--��¶��֮ŭ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF3","S��ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��¶��֮ŭ-------------------------------------------------------------------------------------------------
	
		--��ӿ��-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYong()
		--��ӿ�� ʩ������ 
		and
		(
			XCLZ_BuffCount<3
			--�ǳ�����BUFF����<3
			or
			NextPower>=88
			--�ǽ�����>=88
			or
			(
				XingJiePower>70
				--�ǽ�����>70
				and
				(
					(YueShiBuffTime>0 and YueShiBuffTime<4)
					--��ʴ<4��
					or
					(RiShiBuffTime>0 and RiShiBuffTime<4)
					--��ʴ<4��
				)
				--Ŀ���ǲ����ڷ�ʴ�ڼ��������
			)
		)
		then
			--[[
			if XCLZ_BuffTime>0 and XCLZ_BuffTime<2 then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("ACN9","S������",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			]]--
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF7","S��ӿ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��ӿ��-------------------------------------------------------------------------------------------------
	
		--���� ���� ����-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYue()
		--���� ʩ������
		and
		(
			XinYue>=1
			--���¿��ô���
			or
			BanYue>=1
			--���¿��ô���
			or
			ManYue>=1
			--���¿��ô���
		)
		and
		(
			NextMoonCastTime+GCD<YueShiBuffTime
			--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
			or
			NextMoonCastTime+GCD<RiShiBuffTime
			--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
		)
		and
		(
			NextMoonCastTime+GCD<HuaShenBuffTime
			--��һ������ʩ��ʱ��<����ʣ��ʱ��
			or
			(
				GetSpellCharges("����")==3
				and
				(
					AoNengCount<520
					--ԭʼ����������<520
					or
					CD_HS>10
					--����CD>10��
				)
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF7","S��",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--���� ���� ����-------------------------------------------------------------------------------------------------
	
		--Ұ��Ģ��-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(88747)
		--��ѧ[Ұ��Ģ��]
		and
		PlayerMove
		--��λ�ƶ�
		and
		WR_GetUnitDebuffInfo("target","��ɺĺ��",true)==0
		--Ŀ��Debuff ��ɺĺ�� ������
		and
		WR_GetUnitDebuffInfo("target","�������",true)==0
		--Ŀ��Debuff ������� ������
		and
		WR_LastSpellName~="Ұ��Ģ��"
		--���һ�����ܲ��� Ұ��Ģ��
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF10","SĢ��",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--Ұ��Ģ��-------------------------------------------------------------------------------------------------
	
		--��ŭ-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_FenNu()
		--��ŭ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF11","S��ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��ŭ-------------------------------------------------------------------------------------------------
	end	
----����ѭ��--------------------------------------------------------------------------------------------------------------------------			

----AOEѭ��--------------------------------------------------------------------------------------------------------------------------
	if 
	(
		WRSet.PH_XHLX==1
		--ѭ������ ����
		and
		HUCountRange45>=2
		--45������>=2
		and
		not(SingleUnit)
		--���ǵ���Ŀ��
	)
	or
	WRSet.PH_XHLX==3
	--ѭ������ AOE
	then
		--��������-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingLuo()
		--���� ʩ������
		and
		NextPower>=80
		--�ǽ�����>=80
		and
		(
			--�����Ϊ�����������ʴ��
			RiShiBuffTime>GCD
			--��ʴʱ��>������ȴʱ��
			or
			YueShiBuffTime>GCD
			--��ʴʱ��>������ȴʱ��
			or
			(
				FenNuCount==1
				--��ŭ����==1
				and
				FenNuCasting
				--����ʩ�ŷ�ŭ
			)
			or
			(
				XingHuoShuCount==1
				--�ǻ�������==1
				and
				XingHuoShuCasting
				--����ʩ���ǻ���
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF1","A��������",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��������-------------------------------------------------------------------------------------------------
		
		--�»���-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(8921)
		--��ѧ���� �»���
		and
		TargetDeathTime>=6
		--Ŀ������ʱ��>=6��
		and
		WR_CanDot()
		--������DOT�ĵ�λ
		and
		YueHuoShuDebuffTime==0
		--Ŀ��Debuff �»��� ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF8","A�»���",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�»���-------------------------------------------------------------------------------------------------	

		--������-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(93402)
		--��ѧ���� ������
		and
		TargetDeathTime>=6
		--Ŀ������ʱ��>=6��
		and
		WR_CanDot()
		--������DOT�ĵ�λ
		and
		YangYanShuDebuffTime==0
		--Ŀ��Debuff ������ ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF9","A������",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--������-------------------------------------------------------------------------------------------------	

		--������¶��֮��-------------------------------------------------------------------------------------------------
		if WRSet.PH_HS==1
		--���� ����
		and
		zhandoumoshi==1
		--������
		and
		HuaShenBuffTime==0
		--��������
		and
		IsPlayerSpell(102560)
		--��ѧ���� ������¶��֮��
		and
		WR_GetSpellCD("������¶��֮��")<=GCD
		--������ȴ
		then
			--����-------------------------------------------------------------------------------
			if 
			(
				MM_BuffCount==2
				--����BUFF����==2
				or
				(
					MM_BuffCount==1
					--����BUFF����==1
					and
					UnitCastingInfo("player")~="�ǻ���"
					--��ǰʩ�������ǻ���
					and
					UnitCastingInfo("player")~="��ŭ"
					--��ǰʩ�����Ƿ�ŭ
				)
			)
			then
				--�����ǻ�-----------------------------------------------------------------------
				if WR_DruidBalance_XingHuoShu()
				--�ǻ��� ʩ������
				and
				XingHuoShuCastTime<YueShiBuffTime
				--�ǻ���ʩ��ʱ��<��ʴBUFFʣ��ʱ��
				then
					WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
					WR_ShowColorFrame("SF2","A�����ǻ�",zhandoumoshi) --��ʾָ��ɫ�鴰��
					return
				end
				--�����ǻ�-----------------------------------------------------------------------
				
				--���η�ŭ-----------------------------------------------------------------------
				if WR_DruidBalance_FenNu()
				--��ŭ ʩ������
				and
				FenNuCastTime<RiShiBuffTime
				--��ŭʩ��ʱ��<��ʴBUFFʣ��ʱ��
				then
					WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
					WR_ShowColorFrame("CF11","A���η�ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
					return
				end
				--���η�ŭ-----------------------------------------------------------------------
			end
			--����-------------------------------------------------------------------------------
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CSI","A����",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--������¶��֮��-------------------------------------------------------------------------------------------------	
	
		--��¶����սʿ-------------------------------------------------------------------------------------------------
		if zhandoumoshi==1
		--������
		and
		IsPlayerSpell(202425)
		--��ѧ[��¶����սʿ]
		and
		WR_GetSpellCD("��¶����սʿ")<=GCD
		--������ȴ
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF6","A��ս",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��¶����սʿ-------------------------------------------------------------------------------------------------

		--�ǻ���-------------------------------------------------------------------------------------------------
		if HUCountRange45==2
		--==2Ŀ�����ʴ
		and
		WR_DruidBalance_XingHuoShu_InEclipse()
		--�ǻ��� ��ʴ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF2","A�ǻ�ʴ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�ǻ���-------------------------------------------------------------------------------------------------
		
		--��ŭ-------------------------------------------------------------------------------------------------
		if HUCountRange45>=3
		-->=3Ŀ�����ʴ
		and
		WR_DruidBalance_FenNu_InEclipse()
		--��ŭ ��ʴ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF11","A��ŭʴ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��ŭ-------------------------------------------------------------------------------------------------
		
		--Ұ��Ģ��-------------------------------------------------------------------------------------------------
		if IsPlayerSpell(88747)
		--��ѧ[Ұ��Ģ��]
		and
		WR_GetSpellCD("Ұ��Ģ��")<=GCD
		--������ȴ
		and
		NextPower<80
		--�ǽ�����<80
		and
		WR_GetUnitDebuffInfo("target","��ɺĺ��",true)==0
		--Ŀ��Debuff ��ɺĺ�� ������
		and
		WR_GetUnitDebuffInfo("target","�������",true)==0
		--Ŀ��Debuff ������� ������
		and
		WR_LastSpellName~="Ұ��Ģ��"
		--���һ�����ܲ��� Ұ��Ģ��
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF10","AĢ��",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--Ұ��Ģ��-------------------------------------------------------------------------------------------------
		
		--��¶��֮ŭ-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_ALEZN()
		--��¶��֮ŭ ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF3","A��ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��¶��֮ŭ-------------------------------------------------------------------------------------------------
		
		--�ǳ�׹��-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingLuo() then
		--���� ʩ������
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF1","A����",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�ǳ�׹��-------------------------------------------------------------------------------------------------
		
		--��ӿ��
		if not(IsPlayerSpell(191034))
		--ûѧϰ�ǳ�׹��
		and
		WR_DruidBalance_XingYong()
		--��ӿ�� ʩ������
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF7","A��ӿ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
	
		--���� ���� ����-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingYue()
		--���� ʩ������
		then
			--����-------------------------------------------------------------------------------------------------
			if ManYue>=1
			--���¿��ô���
			and
			(
				NextMoonCastTime+GCD<YueShiBuffTime
				--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
				or
				NextMoonCastTime+GCD<RiShiBuffTime
				--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
			)
			and
			(
				NextMoonCastTime+GCD<HuaShenBuffTime
				--��һ������ʩ��ʱ��<����ʣ��ʱ��
				or
				(
					GetSpellCharges("����")==3
					and
					(
						AoNengCount<520
						--ԭʼ����������<520
						or
						CD_HS>10
						--����CD>10��
					)
				)
			)
			then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("SF7","A����",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			--����-------------------------------------------------------------------------------------------------
			
			--����-------------------------------------------------------------------------------------------------
			if BanYue>=1
			--���¿��ô���
			and
			(
				NextMoonCastTime+GCD<YueShiBuffTime
				--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
				or
				NextMoonCastTime+GCD<RiShiBuffTime
				--��һ������ʩ��ʱ��<��ʴʣ��ʱ��
			)
			then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("SF7","A����",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			--����-------------------------------------------------------------------------------------------------
			
			--����-------------------------------------------------------------------------------------------------
			if XinYue>=1
			--���¿��ô���
			then
				WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
				WR_ShowColorFrame("SF7","A����",zhandoumoshi) --��ʾָ��ɫ�鴰��
				return
			end
			--����-------------------------------------------------------------------------------------------------
		end
		--���� ���� ����-------------------------------------------------------------------------------------------------
		
		--�ǻ���-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_XingHuoShu()
		--�ǻ��� ʩ������
		and
		(
			XingHuoShuCastTime<YueShiBuffTime
			--�ǻ���ʩ��ʱ��<��ʴBUFFʣ��ʱ��
			or
			(
				XingHuoShuCastTime<HuaShenBuffTime
				--�ǻ���ʩ��ʱ��<����BUFFʣ��ʱ��
				and
				HUCountRange45>=4
				--Ŀ��>=4
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("SF2","A�ǻ���",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--�ǻ���-------------------------------------------------------------------------------------------------
		
		--��ŭ-------------------------------------------------------------------------------------------------
		if WR_DruidBalance_FenNu()
		--��ŭ ʩ������
		and
		(
			FenNuCastTime<RiShiBuffTime
			--��ŭʩ��ʱ��<��ʴBUFFʣ��ʱ��
			or
			(
				FenNuCastTime<HuaShenBuffTime
				--��ŭʩ��ʱ��<����BUFFʣ��ʱ��
				and
				HUCountRange45<=3
				--Ŀ��<=3
			)
		)
		then
			WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
			WR_ShowColorFrame("CF11","A��ŭ",zhandoumoshi) --��ʾָ��ɫ�鴰��
			return
		end
		--��ŭ-------------------------------------------------------------------------------------------------
	end
----AOEѭ��--------------------------------------------------------------------------------------------------------------------------

	--�ƶ��»�-------------------------------------------------------------------------------------------------
	if WRSet.PH_YDYH==1
	--�ƶ��»� ����
	and
	IsPlayerSpell(8921)
	--��ѧ���� �»���
	and
	PlayerMove
	--��λ�ƶ�
	then
		WR_HideColorFrame(zhandoumoshi) --����ָ��ɫ�鴰��
		WR_ShowColorFrame("CF8","A�ƶ��»�",zhandoumoshi) --��ʾָ��ɫ�鴰��
		return
	end
	--�ƶ��»�-------------------------------------------------------------------------------------------------




























































--�Ƿ��л�Ŀ��
function WR_DruidBalance_TabUnit(Unit)
	if not(WR_TargetInCombat(Unit)) then
	--�����λû��ս��
		return false
	end
	
	if UnitGUID("target")==UnitGUID(Unit) then
	--����ҵ�ǰ��λ==�ж��л��ĵ�λ
		return false
	end
	
	if UnitExists("target")~=true then
	--�����ǰ��λ������
		return true
	end
	
	if UnitCanAttack("player","target")~=true then
	--�����ǰ��λ���ɹ���
		return true
	end
	
	if UnitIsDead("target")==true then
	--�����ǰ��λ�Ѿ�����
		return true
	end
	
	if IsSpellInRange("�»���","target")~=1 then
	--�����ǰ��λ���ڹ�����Χ��
		return true
	end
	
	if GCD==0 then
	--ֻ��GCD��ʱ����Ŀ��
		return false
	end

	local NPClass=UnitClassification(Unit)--�жϵ�λ�ķ���
	if NPClass=="normal" or NPClass=="trivial" or NPClass=="minus" then
	--�����λ����Ϊ ��ͨ �� �ٻ�С��
		if not(WR_InTraining()) then
		return false
		end
	end
	if HUCountRange45==nil or HUCountRange45<=1 then
	--���45����û���ҵ��κ�Ŀ�� ����45����ֻ��1����λ
		return false
	end
	if IsSpellInRange("�»���",Unit)~=1 then
	--�����λ���ڹ�����Χ��
		return false
	end
	if WR_GetUnitDebuffInfo(Unit,"��ɺĺ��",true)>0 then
	--����л���λ����ɺĺ��
		return false
	end
	if WR_GetUnitDeathTime(Unit)<8+HUCountRange45 then
	--����л���λ����ʱ��<8+45�ڹ�������
		return false
	end
	if WR_UnitIsHuLueName(Unit) then
	--�����λ�Ǻ��Ե�����
		return false
	end
	
	if YueHuoShuDebuffTime>0 and WR_GetUnitDebuffInfo(Unit,"�»���",true)==0 then
	--�����ǰĿ�����»��� ���� �л���λû���»���
		return true
	end
	if YangYanShuDebuffTime>0 and WR_GetUnitDebuffInfo(Unit,"������",true)==0 then
	--�����ǰĿ���������� ���� �л���λû��������
		return true
	end
	if IsPlayerSpell(202347) and WR_GetUnitDebuffInfo("target","��ɺĺ��",true)>0 and WR_GetUnitDebuffInfo(Unit,"��ɺĺ��",true)==0 then
	--ѧϰ��[�ǳ�ҫ��] ���� ��ǰĿ������ɺĺ�� ���� �л�Ŀ��û����ɺĺ��
		return true
	end
	--[[
	if WR_GetUnitDeathTime("target")<8+HUCountRange45 and WR_GetUnitDeathTime(Unit)>=8+HUCountRange45 then
	--�����ǰĿ������ʱ��<8+45�ڹ������� ���� �л�Ŀ������ʱ��>=8+45�ڹ�������
		return true
	end
	]]--

	return false	--������û���κ���������������false
end




--�ǻ��� ��ʴ ʩ������
function WR_DruidBalance_XingHuoShu_InEclipse()
	if WR_DruidBalance_XingHuoShu()
	--�ǻ��� ʩ������
	and
	(
		XingHuoShuCount==2
		--�ǻ�������==2
		or
		(
			XingHuoShuCount==1
			--�ǻ�������==1
			and
			not(XingHuoShuCasting)
			--û��ʩ���ǻ���
		)
		or
		(
			XingHuoShuCount==0
			--�ǻ�������==0
			and
			RiShiBuffTime<XingHuoShuCastTime-0.5
			--��ʴʣ��ʱ��<�ǻ���ʩ��ʱ������ǰ����һ�ν�ʴ
		)
	)
	then
		return true
	end
	return false
end


--���� ʩ������
function WR_DruidBalance_XingYue()
	if IsPlayerSpell(274281)
	--��ѧ����
	and
	NewMoon
	--���������
	and
	not(PlayerMove)
	--��λû���ƶ�
	and
	not(WR_StopCast(NextMoonCastTime))
	--����ʩ������Ĭ�����
	then
		return true
	end
	return false
end







--�����ʴ ���Ⱦ�����
function WR_DruidBalance_QCFS(Unit)
	if IsPlayerSpell(2782)
	--��ѧ �����ʴ
	and
	WR_GetGCD("�����ʴ")<=GCD
	--������ȴ
	and
	not(UnitCanAttack("player",Unit))
	--��λ���ѷ�
	and
	IsSpellInRange("Ұ��ӡ��",Unit)==1
	--��λ�ڼ��ܷ�Χ��
	and
	WR_CanRemoveUnitDebuff(Unit)
	--��λ�п���ɢDebuff
	then
		return true
	end
	return false
end

--���� ���Ⱦ�����
function WR_DruidBalance_FS(Unit)
	if IsPlayerSpell(20484)
	--��ѧ ����
	and
	WR_GetGCD("����")<=GCD
	--������ȴ
	and
	(
		IsSpellInRange("����",Unit)==1
		--��λ�ڼ��ܷ�Χ��
		or
		WR_GetUnitRange(Unit)<=40
		--��λ����<=40
	)
	and
	UnitIsDead(Unit)
	--��λ����
	and
	not(PlayerMove)
	--û���ƶ�
	and
	not(UnitCanAttack("player",Unit))
	--��λ�����Ƶ�
	and
	UnitIsPlayer(Unit)
	--��λ�����
	then
		return true
	end
	return false
end

