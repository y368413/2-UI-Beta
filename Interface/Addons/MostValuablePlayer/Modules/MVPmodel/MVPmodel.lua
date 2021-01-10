local ScorePlayerModer = CreateFrame("Frame")
ScorePlayerModer:RegisterEvent("ADDON_LOADED")
ScorePlayerModer:SetScript("OnEvent", function(self, event_name, ...)
    if self[event_name] then
        return self[event_name](self, event_name, ...)
    end
end)
local cfg;


function ScorePlayerModer:ADDON_LOADED()
	cfg = MVP_Settings;


	if cfg.MVPPoint == nil or cfg.MVPPoint == 0 then cfg.MVPPoint={}; end


	if cfg.MVPPoint["Point"] == nil then cfg.MVPPoint["Point"] = "CENTER"; end
	if cfg.MVPPoint["Relay"] == nil then cfg.MVPPoint["Relay"] = "CENTER"; end
	if cfg.MVPPoint["X"] == nil then cfg.MVPPoint["X"] = -500; end
	if cfg.MVPPoint["Y"] == nil then cfg.MVPPoint["Y"] = 0; end
	if cfg.MVPPoint["Scale"] == nil then cfg.MVPPoint["Scale"] = 1; end
end
function ScorePlayerModer:CreateNewModerFrameByUnit(inMvp)
	local sunit
	for i = 1,GetNumGroupMembers() do
		if i == 1 then
			sunit = "player"
		else 
			sunit = format("party%i", i-1)
		end
		ScorePlayerModer.modelHolder.sunit = CreateFrame("Frame", nil, ScorePlayerModer.modelHolder, "BackdropTemplate")
		ScorePlayerModer.modelHolder.sunit.isShow = true
		ScorePlayerModer.modelHolder.sunit:SetSize(1024/5,512)
		ScorePlayerModer.modelHolder.sunit:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    	})
    	local funame = GetUnitName(sunit,true)
    	local name = strsplit("-",funame)

		if inMvp == name or inMvp == funame then
    		ScorePlayerModer.modelHolder.sunit.Fname = ScorePlayerModer.modelHolder.sunit:CreateFontString(nil, "ARTWORK")
		    ScorePlayerModer.modelHolder.sunit.Fname:SetFont(GameFontNormal:GetFont(), 30)
		    ScorePlayerModer.modelHolder.sunit.Fname:SetShadowOffset(0, 0)
		    ScorePlayerModer.modelHolder.sunit.Fname:SetPoint("TOP", ScorePlayerModer.modelHolder.sunit, "TOP", 0, 0)
		    ScorePlayerModer.modelHolder.sunit.Fname:SetText("M V P")
		end
    	local _,classMatch = UnitClass(sunit)
		if classMatch then
			local classColorTable = _G.CUSTOM_CLASS_COLORS and _G.CUSTOM_CLASS_COLORS[classMatch] or _G.RAID_CLASS_COLORS[classMatch];
    		ScorePlayerModer.modelHolder.sunit:SetBackdropColor(classColorTable.r, classColorTable.g, classColorTable.b, .8)
    	end
		ScorePlayerModer.modelHolder.sunit:EnableMouse(true)
	    ScorePlayerModer.modelHolder.sunit:SetMovable(true)
		ScorePlayerModer.modelHolder.sunit:SetPropagateKeyboardInput(true)
		ScorePlayerModer.modelHolder.sunit:SetPoint("CENTER",ScorePlayerModer.modelHolder,"CENTER",-204.8*3+i*204.8,-10)
		ScorePlayerModer.modelHolder.sunit:Show()
		ScorePlayerModer.modelHolder.sunit.time = 0	
		
		
		if not ScorePlayerModer.modelHolder.sunit.playerModel or not ScorePlayerModer.modelHolder.sunit.playerModel.isShow then
			ScorePlayerModer.modelHolder.sunit.playerModel = CreateFrame("PlayerModel", nil, ScorePlayerModer.modelHolder.sunit)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetPoint("CENTER", ScorePlayerModer.modelHolder.sunit, "CENTER")
			ScorePlayerModer.modelHolder.sunit.playerModel.isShow = true
			ScorePlayerModer.modelHolder.sunit.playerModel:SetSize(GetScreenWidth() * 2, GetScreenHeight() * 2)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetScale(cfg.MVPPoint["Scale"])	
			ScorePlayerModer.modelHolder.sunit.playerModel:ClearModel()

			ScorePlayerModer.modelHolder.sunit.playerModel:SetUnit(sunit)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetFacing(6.5)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetPortraitZoom(0.05)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetCamDistanceScale(4.8)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetAlpha(1)
			ScorePlayerModer.modelHolder.sunit.playerModel:SetAnimation(random(1,225))
			UIFrameFadeIn(ScorePlayerModer.modelHolder.sunit.playerModel, 1, ScorePlayerModer.modelHolder.sunit.playerModel:GetAlpha(), 1)
			ScorePlayerModer.modelHolder.sunit.playerModel:Show()
			ScorePlayerModer.modelHolder.sunit:SetScript("OnUpdate", function(self,elapsed)
				self.time = self.time + elapsed
				if self.time > 3 then
					self.playerModel:SetAnimation(random(1,225))
					self.time = 0
				end
			end)
		end


	end
end
function ScorePlayerModer:HideScoreModerFrame()
	cfg.MVPPoint["Point"],_,cfg.MVPPoint["Relay"],cfg.MVPPoint["X"],cfg.MVPPoint["Y"]=ScorePlayerModer.modelHolder:GetPoint()
	ScorePlayerModer.modelHolder:EnableMouse(false)
    ScorePlayerModer.modelHolder:SetMovable(false)
	ScorePlayerModer.playerModel:SetUnit("none")
	ScorePlayerModer.modelHolder:SetBackdropColor(0, 0, 0, 0)
	ScorePlayerModer.playerModel:EnableMouseWheel(false);
    ScorePlayerModer.modelHolder:SetPropagateKeyboardInput(false)
    ScorePlayerModer.modelHolder:Hide()
    ScorePlayerModer.playerModel.isShow = false
    ScorePlayerModer.modelHolder.isShow = false
    ScorePlayerModer:ClearAllPoints()

end

function ShowMVP(theunit)
	local theunit = theunit
	
	if not cfg.MVPSettings["3d模型显示"] then return end
	if not ScorePlayerModer.modelHolder or not ScorePlayerModer.modelHolder.isShow then
		ScorePlayerModer.modelHolder = CreateFrame("Frame", nil,UIParent, "BackdropTemplate")
		ScorePlayerModer.modelHolder.isShow = true
		ScorePlayerModer.modelHolder:SetSize(1024,532)
		

		ScorePlayerModer.modelHolder:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    	})
		ScorePlayerModer.modelHolder:SetBackdropColor(0, 0, 0, 0)
		ScorePlayerModer.modelHolder:EnableMouse(true)
	    ScorePlayerModer.modelHolder:SetMovable(true)
		ScorePlayerModer.modelHolder:SetPropagateKeyboardInput(true)
		ScorePlayerModer.modelHolder:SetPoint(cfg.MVPPoint["Point"],UIParent,cfg.MVPPoint["Relay"],cfg.MVPPoint["X"], cfg.MVPPoint["Y"])
		ScorePlayerModer.modelHolder:Show()

	end	

	ScorePlayerModer:CreateNewModerFrameByUnit(theunit)

	if not ScorePlayerModer.playerModel or not ScorePlayerModer.playerModel.isShow then
		ScorePlayerModer.playerModel = CreateFrame("PlayerModel", nil, ScorePlayerModer.modelHolder)
		ScorePlayerModer.playerModel:SetPoint("CENTER", ScorePlayerModer.modelHolder, "CENTER")
		ScorePlayerModer.playerModel.isShow = true
		ScorePlayerModer.playerModel:SetSize(GetScreenWidth() * 2, GetScreenHeight() * 2)
		ScorePlayerModer.playerModel:SetScale(cfg.MVPPoint["Scale"])	
		ScorePlayerModer.playerModel:ClearModel()
		ScorePlayerModer.playerModel:SetUnit("none")
		ScorePlayerModer.playerModel:SetFacing(6.5)
		ScorePlayerModer.playerModel:SetPortraitZoom(0.05)
		ScorePlayerModer.playerModel:SetCamDistanceScale(4.8)
		ScorePlayerModer.playerModel:SetAlpha(1)
		ScorePlayerModer.playerModel:SetAnimation(random(1,225))
		UIFrameFadeIn(ScorePlayerModer.playerModel, 1, ScorePlayerModer.playerModel:GetAlpha(), 1)
		ScorePlayerModer.playerModel:Hide()
	
		tickers = C_Timer.NewTicker(3, function(tickers) 	
        	ScorePlayerModer.playerModel:SetAnimation(random(1,225))
        	--[[  找不到判断playerModel2是否显示的API,暂时不这么写
        	if modelHolder2是Hide then
        		tickers:Cancel()
        	end
        	--]]   
    	end)
	end
    --------------关闭按钮-------------------
    if not ScorePlayerModer.modelHolder.close then
		ScorePlayerModer.modelHolder.close = CreateFrame("Button", nil, ScorePlayerModer.modelHolder, "UIPanelCloseButton")
		ScorePlayerModer.modelHolder.close:SetPoint("TOPRIGHT", 2, 1)
		ScorePlayerModer.modelHolder.close:SetScript("OnClick", function(self, ...)
			ScorePlayerModer:HideScoreModerFrame()
	        tickers:Cancel() 
		end)
	end
	--------------关闭按钮-------------------

	
	ScorePlayerModer.modelHolder:SetScript("OnMouseDown", ScorePlayerModer.modelHolder.StartMoving)
	ScorePlayerModer.modelHolder:SetScript("OnMouseUp", ScorePlayerModer.modelHolder.StopMovingOrSizing)
	ScorePlayerModer.modelHolder:SetScript("OnKeyDown", function(self,key)
      if key == "ESCAPE" then
        ScorePlayerModer:HideScoreModerFrame()
       	tickers:Cancel()
      end
    end);
    ScorePlayerModer.playerModel:SetScript("OnMouseWheel", function(self, direction)
	    if(direction > 0) then

	        cfg.MVPPoint["Scale"]=cfg.MVPPoint["Scale"]+0.05
	        ScorePlayerModer.playerModel:SetScale(cfg.MVPPoint["Scale"])
	    else
	        cfg.MVPPoint["Scale"]=cfg.MVPPoint["Scale"]-0.05
	        ScorePlayerModer.playerModel:SetScale(cfg.MVPPoint["Scale"])
	    end
	end);

end

function ShowJany() --测试
	ShowMVP("洛坎图克")
end