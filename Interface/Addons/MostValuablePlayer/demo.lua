
local f = CreateFrame("Frame",nil,UIParent)

f:SetFrameStrata("BACKGROUND")
f:SetWidth(128) -- Set these to whatever height/width is needed 
f:SetHeight(64) -- for your Texture

local t = f:CreateTexture(nil,"BACKGROUND")
t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
t:SetAllPoints(f)
f.texture = t

f:SetPoint("RIGHT",0,0)
f:Show()





local ag = f:CreateAnimationGroup()    


local a1 = ag:CreateAnimation("Translation") -- 移动
a1:SetOffset(0,GetScreenHeight() * (-2 / 4))    
a1:SetDuration(3)
a1:SetSmoothing("OUT_IN")
--[[
local a2 = ag:CreateAnimation("Scale") --放大
a2:SetScale(x, y)
a2:SetDuration(3)
a2:SetSmoothing("OUT")

local a3 = ag:CreateAnimation("Rotation") -- 旋转
a3:SetDegrees(360)
a3:SetDuration(3)
a3:SetSmoothing("OUT")

local a4 = ag:CreateAnimation("Alpha") -- 透明
a4:SetFromAlpha(0.8)
a4:SetDuration(3)
a4:SetSmoothing("OUT")
]]




ag:SetLooping('BOUNCE') --重复REPEAT, or 反弹BOUNCE
ag:Play()
