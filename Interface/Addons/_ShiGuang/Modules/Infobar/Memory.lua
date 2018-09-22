local _, ns = ...
local M, R, U, I = unpack(ns)
if not R.Infobar.Memory then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar(R.Infobar.MemoryPos)

local function formatMemory(value, color)
	color = color and I.MyColor or " "
	if value > 1024 then
		return format("%.1f"..color.."mb", value / 1024)
	else
		return format("%.0f"..color.."kb", value)
	end
end

local memoryTable = {}
local function updateMemory()
	wipe(memoryTable)
	UpdateAddOnMemoryUsage()

	local total, count = 0, 0
	for i = 1, GetNumAddOns() do
		if IsAddOnLoaded(i) then
			count = count + 1
			local usage = GetAddOnMemoryUsage(i)
			memoryTable[count] = {select(2, GetAddOnInfo(i)), usage}
			total = total + usage
		end
	end

	sort(memoryTable, function(a, b)
		if a and b then
			return a[2] > b[2]
		end
	end)

	return total
end

info.onUpdate = function(self, elapsed)
	self.timer = (self.timer or 5) + elapsed
	if self.timer > 5 then
		UpdateAddOnMemoryUsage()

		local total = 0
		for i = 1, GetNumAddOns() do
			if IsAddOnLoaded(i) then
				local usage = GetAddOnMemoryUsage(i)
				total = total + usage
			end
		end
		self.text:SetText(formatMemory(total, true))

		self.timer = 0
	end
end

info.onMouseUp = function(self, btn)
		local before = gcinfo()
		collectgarbage()
		print(format("|cff66C6FF%s:|r %s", U["Garbage collected"], formatMemory(before - gcinfo())))
		updateMemory()
	self:GetScript("OnEnter")(self)
end

info.onEnter = function(self)
	local totalMemory = updateMemory()
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -21)
	GameTooltip:ClearLines()
	GameTooltip:AddDoubleLine(ADDONS, formatMemory(totalMemory), 0,.6,1, .6,.8,1)
	GameTooltip:AddLine(" ")

	local maxAddOns = IsShiftKeyDown() and #memoryTable or min(R.Infobar.MaxAddOns, #memoryTable)
	for i = 1, maxAddOns do
		local usage = memoryTable[i][2]
		local color = usage <= 204.8 and {0,1} -- 0 - 200k
		or usage <= 1024 and {.75,1} -- 100k - 1mb
		or usage <= 2560 and {1,1} -- 1mb - 2.5mb
		or usage <= 5120 and {1,.75} -- 2mb - 5mb
		or usage <= 10240 and {1,.5} -- 4mb - 10mb
		or {1,.1} -- 10mb +
		GameTooltip:AddDoubleLine(memoryTable[i][1], formatMemory(usage), 1, 1, 1, color[1], color[2], 0)
	end

	local hiddenMemory = 0
	if not IsShiftKeyDown() then
		for i = (R.Infobar.MaxAddOns + 1), #memoryTable do
			hiddenMemory = hiddenMemory + memoryTable[i][2]
		end
		if #memoryTable > R.Infobar.MaxAddOns then
			local numHidden = #memoryTable - R.Infobar.MaxAddOns
			GameTooltip:AddDoubleLine(format("%d %s (%s)", numHidden, U["Hidden"], U["Shift"]), formatMemory(hiddenMemory), .6,.8,1, .6,.8,1)
		end
	end

	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine(U["Default UI Memory Usage:"], formatMemory(gcinfo() - totalMemory), .6,.8,1, 1,1,1)
	GameTooltip:AddDoubleLine(U["Total Memory Usage:"], formatMemory(collectgarbage("count")), .6,.8,1, 1,1,1)
	--GameTooltip:AddDoubleLine(" ", "--------------", 1,1,1, .5,.5,.5)
		--GameTooltip:AddDoubleLine(" ", U["AutoCollect"]..": "..(MaoRUIDB["AutoCollect"] and "|cff55ff55"..VIDEO_OPTIONS_ENABLED or "|cffff5555"..VIDEO_OPTIONS_DISABLED).." ", 1,1,1, .6,.8,1)
	GameTooltip:Show()

	self:RegisterEvent("MODIFIER_STATE_CHANGED")
end

info.onLeave = function(self)
	GameTooltip:Hide()
	self:UnregisterEvent("MODIFIER_STATE_CHANGED")
end

info.eventList = {
	"PLAYER_ENTERING_WORLD"
}

info.onEvent = function(self, event, arg1)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if event == "MODIFIER_STATE_CHANGED" and arg1 == "LSHIFT" then
		self:GetScript("OnEnter")(self)
	end
end

local f = CreateFrame("Frame")
f:RegisterAllEvents()
f:SetScript("OnEvent", function(_, event)
	if InCombatLockdown() then return end
	f.events = (f.events or 0) + 1
	if f.events > 6000 or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_REGEN_ENABLED" then
		collectgarbage()
		f.events = 0
	end
end)