UIParent:CreateTexture("CtrlIndicatorBG");
--Author: 图图
--用途: 用于检测Ctrl是否卡住,Ctrl按下4.5秒之后就会提示
CtrlIndicatorBG:SetPoint("TOP", 18, -100);
CtrlIndicatorBG:SetAtlas("OBJFX-BarGlow", true)
UIParent:CreateFontString("CtrlIndicatorText", "OVERLAY");
CtrlIndicatorText:SetPoint("TOP", 15, -112);
CtrlIndicatorText:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorText:SetText("|cffffffff亲，你的Ctrl可能卡啦！检查下输入法。|r")
local ctrlCnt = 0;
C_Timer.NewTicker(0.1, function()
    if(IsControlKeyDown())then
        ctrlCnt=ctrlCnt+1
    else    
        ctrlCnt = 0
        CtrlIndicatorText:Hide();
    end
    if ctrlCnt==45 then
        print("|cffff0000亲，你的Ctrl可能卡啦！检查下输入法。|r")
        CtrlIndicatorText:Show();
    end
    if ctrlCnt > 45 then
        CtrlIndicatorBG:SetAlpha(0.69+math.sin((ctrlCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorBG:SetAlpha(0);
    end
end)