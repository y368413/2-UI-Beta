local TrainAllevent= CreateFrame("frame")
TrainAllevent:RegisterEvent("ADDON_LOADED")
local spot=0
local cani, found, Numskills, Cost, Bt_TrainAll
local done=false

local function pauseit()
	spot=0
	Bt_TrainAll()
end

function Bt_TrainAll()
	if done==true then
		spot=0
		return
	end
	Numskills=GetNumTrainerServices()
	found=false
	while found==false do
		spot=spot+1
		_,_,cani=GetTrainerServiceInfo(spot)
		if cani=="available" then
			BuyTrainerService(spot)
			C_Timer.After(0.3,pauseit)
			found=true
		end
		if spot>=Numskills then
			done=true
			break
		end
	end
end

local function createit()
	local Button = CreateFrame("Button", "TrainAllButton",ClassTrainerFrame, "MagicButtonTemplate")
	Button:SetText(TRAINALL_ALLLEARN)
	Button:SetPoint("BOTTOMRIGHT",-96,4)
	Button:SetScript("OnEnter", function()
	end)
	Button:SetScript("ONClick",function() if IsShiftKeyDown() then BuyTrainerService(0) else spot=0 done=false Bt_TrainAll()end end)
	hooksecurefunc("ClassTrainerFrame_Update",function()
	Cost=0
	local Enable=false
		for i=1, GetNumTrainerServices() do
			local _,_,cani=GetTrainerServiceInfo(i)
			if cani=="available" then
				Cost=Cost+GetTrainerServiceCost(i)
				TrainAllButton:Enable()
				Enable=true
			end
		end
		if Enable==false then
			TrainAllButton:Disable()
		end
	end)
end
local function woho(_,_,name)
	if name=="_ShiGuang" then
		if IsAddOnLoaded("Blizzard_TrainerUI") then
			createit()
			TrainAllevent:UnregisterEvent("ADDON_LOADED")
		end
	elseif name=="Blizzard_TrainerUI" then
		createit()
		TrainAllevent:UnregisterEvent("ADDON_LOADED")
	end
end
TrainAllevent:SetScript("OnEvent", woho)
