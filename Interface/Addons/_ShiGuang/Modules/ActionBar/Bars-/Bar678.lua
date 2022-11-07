local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")

local _G = _G
local tinsert = tinsert
local cfg = R.Bars.bar5
local margin = R.Bars.margin

local function createBar(index, offset)
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}

	local frame = CreateFrame("Frame", "UI_ActionBar"..index, UIParent, "SecureHandlerStateTemplate")
	frame.mover = M.Mover(frame, U["Actionbar"]..index, "Bar"..index, {"CENTER", UIParent, "CENTER", 0, offset})
	Bar.movers[index+1] = frame.mover

	_G["MultiBar"..(index-1)]:SetParent(frame)
	_G["MultiBar"..(index-1)]:EnableMouse(false)

	for i = 1, num do
		local button = _G["MultiBar"..(index-1).."Button"..i]
		tinsert(buttonList, button)
		tinsert(Bar.buttons, button)
	end
	frame.buttons = buttonList

	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--if cfg.fader then
	--	frame.isDisable = not R.db["Actionbar"]["Bar5Fader"]
	--	Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	--end
end

function Bar:CreateBar678()
	createBar(6, 0)
	createBar(7, 40)
	createBar(8, 80)
end