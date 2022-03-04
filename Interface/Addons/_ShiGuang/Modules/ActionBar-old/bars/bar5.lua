local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")

local _G = _G
local tinsert = tinsert
local cfg = R.Bars.bar5
local margin = R.Bars.margin

function Bar:CreateBar5()
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}

	local frame = CreateFrame("Frame", "UI_ActionBar5", UIParent, "SecureHandlerStateTemplate")
	frame.mover = M.Mover(frame, U["Actionbar"].."5", "Bar5", {"RIGHT", _G.UI_ActionBar4, "LEFT", margin, 0})
	Bar.movers[6] = frame.mover

	MultiBarLeft:SetParent(frame)
	MultiBarLeft:EnableMouse(false)
	MultiBarLeft.QuickKeybindGlow:SetTexture("")

	for i = 1, num do
		local button = _G["MultiBarLeftButton"..i]
		tinsert(buttonList, button)
		tinsert(Bar.buttons, button)
	end
	frame.buttons = buttonList

	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	if cfg.fader then
		frame.isDisable = not R.db["Actionbar"]["Bar5Fader"]
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end
end