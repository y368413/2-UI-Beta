if select(2, UnitClass("player")) == "WARRIOR" then     --职业warrior 
local WARRIOR = CreateFrame("Frame", nil, UIParent) 
WARRIOR:SetSize(60,60) 
WARRIOR:SetPoint("CENTER",UIParent,"CENTER", 0, -135) 
WARRIOR.Text = WARRIOR:CreateFontString(nil,"OVERLAY") 
WARRIOR.Text:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 60, "OUTLINE")   
WARRIOR.Text:SetPoint("CENTER",WARRIOR,"CENTER", 0, 0) 
WARRIOR:RegisterEvent('UNIT_POWER_FREQUENT')       
WARRIOR:RegisterEvent("PLAYER_ENTERING_WORLD") 

WARRIOR:SetScript("OnEvent", function(self, event, ...)   
      if event == "UNIT_POWER_FREQUENT" then 
             WARRIOR.Text:SetText(UnitMana("player")) 
            --以下数值可调整颜色分段区间 
               if UnitMana("player")==0 then 
                  WARRIOR.Text:SetTextColor(0,0,0,0)     --无色透明        
               elseif UnitMana("player") > 0 and UnitMana("player") <= 40 then     --暗一点的橘黄色... 
                  WARRIOR.Text:SetTextColor(0.65,0.27,0,0.9)
               elseif UnitMana("player") > 40 and UnitMana("player") < 80 then      -- 橘黄色 
                  WARRIOR.Text:SetTextColor(1,0.27,0,0.9)
               else
                  WARRIOR.Text:SetTextColor(0.8,0,0,1)   -- 红色不透明   
               end      
         end 
end)
end 