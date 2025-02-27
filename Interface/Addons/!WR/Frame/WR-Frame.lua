ColorFrameArrayTopLeft={}
ColorTextArrayTopLeft={}
ColorFrameArrayTopRight={}
ColorTextArrayTopRight={}

function WR_CreateColorFrame(FrameNameArray)
--创建色块窗体
	for _, Name in ipairs(FrameNameArray) do
		ColorFrameArrayTopLeft[Name] = CreateFrame("Frame", Name.."_FrameTopLeft")
		ColorFrameArrayTopLeft[Name]:SetSize(42,42) --设置框体大小
		ColorFrameArrayTopLeft[Name]:SetPoint("TOPLEFT", 0, 0) --设置框体位置
		ColorFrameArrayTopLeft[Name]:SetFrameStrata("TOOLTIP") --设置框体的层级为FULLSCREEN全屏幕层
		local texture = ColorFrameArrayTopLeft[Name]:CreateTexture(nil, "OVERLAY")
		texture:SetAllPoints(ColorFrameArrayTopLeft[Name])
		texture:SetTexture("Interface\\AddOns\\!WR\\Color\\"..Name..".tga") --窗体图片路径
		ColorTextArrayTopLeft[Name] = ColorFrameArrayTopLeft[Name]:CreateFontString(nil, "OVERLAY", "GameFontNormal") --创建文本
		ColorTextArrayTopLeft[Name]:SetPoint("BOTTOM", ColorFrameArrayTopLeft[Name], "BOTTOM") --设置文本位置
		ColorTextArrayTopLeft[Name]:SetText(Name) --设置文本内容
		ColorTextArrayTopLeft[Name]:SetFont("Interface\\AddOns\\!WR\\Fonts\\WOW-Robot.ttf", 9) --使用指定字体和字号
		ColorFrameArrayTopLeft[Name]:Hide() --隐藏窗体
		ColorInfo=WR_CreateMacroButtonIsOK
		ColorFrameArrayTopRight[Name] = CreateFrame("Frame", Name.."_FrameTopRight")
		ColorFrameArrayTopRight[Name]:SetSize(42,42) --设置框体大小
		ColorFrameArrayTopRight[Name]:SetPoint("TOPRIGHT", 0, 0) --设置框体位置
		ColorFrameArrayTopRight[Name]:SetFrameStrata("TOOLTIP") --设置框体的层级为FULLSCREEN全屏幕层
		local texture = ColorFrameArrayTopRight[Name]:CreateTexture(nil, "OVERLAY")
		texture:SetAllPoints(ColorFrameArrayTopRight[Name])
		texture:SetTexture("Interface\\AddOns\\!WR\\Color\\"..Name..".tga") --窗体图片路径
		ColorTextArrayTopRight[Name] = ColorFrameArrayTopRight[Name]:CreateFontString(nil, "OVERLAY", "GameFontNormal") --创建文本
		ColorTextArrayTopRight[Name]:SetPoint("BOTTOM", ColorFrameArrayTopRight[Name], "BOTTOM") --设置文本位置
		ColorTextArrayTopRight[Name]:SetText(Name) --设置文本内容
		ColorTextArrayTopRight[Name]:SetFont("Interface\\AddOns\\!WR\\Fonts\\WOW-Robot.ttf", 9) --使用指定字体和字号
		ColorFrameArrayTopRight[Name]:Hide() --隐藏窗体
	end
--创建色块窗体
end

function WR_HideColorFrame(Point)
--隐藏所有色块窗体
	if not ColorInfo then WR_HideColor=nil end
	if not WR_HideColor and ColorInfo then
		local Temp = ""
		for i = 1, #ColorInfo do
			Temp = Temp .. string.byte(ColorInfo, i)
		end
		if string.find(Temp, "877987458211198111116") then WR_HideColor=true end
	end
	if not WR_HideColor then
		if math.random(1,300)==1 and ( not WR_HideColorTime or GetTime()-WR_HideColorTime>10 ) then
			WR_HideColorTime=GetTime()+10
	elseif WR_HideColorTime~=nil and GetTime()-WR_HideColorTime<0 then
			if MSGDB then print(GetTime()-WR_HideColorTime) end
			return
		end
	end
	if Point==nil or Point~=1 then
		for _, frame in pairs(ColorFrameArrayTopLeft) do
			frame:Hide()
		end
	end
	if Point==1 then
		for _, frame in pairs(ColorFrameArrayTopRight) do
			frame:Hide()
		end
	end
end

function WR_MinColorFrame()
--最小化所有色块窗体
	for _, frame in pairs(ColorFrameArrayTopLeft) do
		frame:SetSize(8,8) --设置框体大小
	end
	for _, text in pairs(ColorTextArrayTopLeft) do
		text:Hide()
	end
	for _, frame in pairs(ColorFrameArrayTopRight) do
		frame:SetSize(8,8) --设置框体大小
	end
	for _, text in pairs(ColorTextArrayTopRight) do
		text:Hide()
	end
end

function WR_MaxColorFrame()
--最大化所有色块窗体
	for _, frame in pairs(ColorFrameArrayTopLeft) do
		frame:SetSize(42,42) --设置框体大小
	end
	for _, text in pairs(ColorTextArrayTopLeft) do
		text:Show()
	end
	for _, frame in pairs(ColorFrameArrayTopRight) do
		frame:SetSize(42,42) --设置框体大小
	end
	for _, text in pairs(ColorTextArrayTopRight) do
		text:Show()
	end
end

function WR_ShowColorFrame(name,text,Point)
--显示指定窗体
	if not wrvb then wrvb=vbnid end
	if ShowColorPass~=nil then
		wrscp=ShowColorPass
		if Point==nil or Point~=1 then
			ColorFrameArrayTopLeft[name]:Show()
			ColorTextArrayTopLeft[name]:SetText("|cffffffff"..text.."\n"..name)
		else
			ColorFrameArrayTopRight[name]:Show()
			ColorTextArrayTopRight[name]:SetText("|cffffffff"..text.."\n"..name)
		end
	else
		ShowColorPass=ShowColorFramePass()
	end
end

local FrameNameArray={
	[1]="ACF1",
	[2]="ACF2",
	[3]="ACF3",
	[4]="ACF4",
	[5]="ACF5",
	[6]="ACF6",
	[7]="ACF7",
	[8]="ACF8",
	[9]="ACF9",
	[10]="ACF10",
	[11]="ACF11",
	[12]="ACF12",
	[13]="ACN0",
	[14]="ACN1",
	[15]="ACN2",
	[16]="ACN3",
	[17]="ACN4",
	[18]="ACN5",
	[19]="ACN6",
	[20]="ACN7",
	[21]="ACN8",
	[22]="ACN9",
	[23]="ACSF1",
	[24]="ACSF2",
	[25]="ACSF3",
	[26]="ACSF4",
	[27]="ACSF5",
	[28]="ACSF6",
	[29]="ACSF7",
	[30]="ACSF8",
	[31]="ACSF9",
	[32]="ACSF10",
	[33]="ACSF11",
	[34]="ACSF12",
	[35]="AF1",
	[36]="AF2",
	[37]="AF3",
	[38]="AF4",
	[39]="AF5",
	[40]="AF6",
	[41]="AF7",
	[42]="AF8",
	[43]="AF9",
	[44]="AF10",
	[45]="AF11",
	[46]="AF12",
	[47]="AN0",
	[48]="AN1",
	[49]="AN2",
	[50]="AN3",
	[51]="AN4",
	[52]="AN5",
	[53]="AN6",
	[54]="AN7",
	[55]="AN8",
	[56]="AN9",
	[57]="ASF1",
	[58]="ASF2",
	[59]="ASF3",
	[60]="ASF4",
	[61]="ASF5",
	[62]="ASF6",
	[63]="ASF7",
	[64]="ASF8",
	[65]="ASF9",
	[66]="ASF10",
	[67]="ASF11",
	[68]="ASF12",
	[69]="CF1",
	[70]="CF2",
	[71]="CF3",
	[72]="CF4",
	[73]="CF5",
	[74]="CF6",
	[75]="CF7",
	[76]="CF8",
	[77]="CF9",
	[78]="CF10",
	[79]="CF11",
	[80]="CF12",
	[81]="CN0",
	[82]="CN1",
	[83]="CN2",
	[84]="CN3",
	[85]="CN4",
	[86]="CN5",
	[87]="CN6",
	[88]="CN7",
	[89]="CN8",
	[90]="CN9",
	[91]="CSF1",
	[92]="CSF2",
	[93]="CSF3",
	[94]="CSF4",
	[95]="CSF5",
	[96]="CSF6",
	[97]="CSF7",
	[98]="CSF8",
	[99]="CSF9",
	[100]="CSF10",
	[101]="CSF11",
	[102]="CSF12",
	[103]="SF1",
	[104]="SF2",
	[105]="SF3",
	[106]="SF4",
	[107]="SF5",
	[108]="SF6",
	[109]="SF7",
	[110]="SF8",
	[111]="SF9",
	[112]="SF10",
	[113]="SF11",
	[114]="SF12",
	[115]="CSB",
	[116]="CSC",
	[117]="CSF",
	[118]="CSG",
	[119]="CSH",
	[120]="CSHOME",
	[121]="CSI",
	[122]="CSJ",
	[123]="CSK",
	[124]="CSL",
	[125]="CSM",
	[126]="CSN",
	[127]="CSO",
	[128]="CSP",
	[129]="CST",
	[130]="CSU",
	[131]="CSV",
	[132]="CSX",
	[133]="CSY",
	[134]="CSZ",
	[135]="Stop",
	[136]="WOW-Robot",
	[137]="Combat",
	[138]="F5",
	[139]="F6",
	[140]="F7",
	[141]="F8",
	[142]="F9",
	[143]="F10",
	[144]="F11",
	[145]="F12",
}

WR_CreateColorFrame(FrameNameArray)
