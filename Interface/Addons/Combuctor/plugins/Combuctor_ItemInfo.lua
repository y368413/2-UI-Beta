--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lars Norberg

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

--]]
local _, Private =  ...

Private.cache = {}

Private.updates = COMBUCTOR_ITEMINFO_UPDATES or {}
Private.updatesByModule = COMBUCTOR_ITEMINFO_UPDATES_BY_MODULE or {}
Private.tooltip = COMBUCTOR_ITEMINFO_SCANNERTOOLTIP or CreateFrame("GameTooltip", "COMBUCTOR_ITEMINFO_SCANNERTOOLTIP", WorldFrame, "GameTooltipTemplate")
Private.tooltipName = Private.tooltip:GetName()

Private.ClientMajor = tonumber((string.split(".", (GetBuildInfo()))))
Private.IsRetail = (WOW_PROJECT_ID == WOW_PROJECT_MAINLINE)
Private.IsClassic = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC)
Private.IsTBC = (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC)
Private.IsWrath = (WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC)
Private.IsShadowlands = Private.ClientMajor == 9
Private.IsDragonflight = Private.ClientMajor == 10

-- Speed!
local next, table_insert = next, table.insert
local tooltip, updates = Private.tooltip, Private.updates

-- Add a module update to the global cache
Private.AddUpdater = function(module, func)
	table_insert(Private.updates, func)
	Private.updatesByModule[module] = func
end

-- Forcefully update all module buttons.
Private.Forceupdate = function(module)
	for module,cache in next,Private.cache do
		local func = Private.updatesByModule[module]
		for item in next,cache do
			func(item)
		end
	end

end

-- Call all updates from all my plugins, then reset the tooltip.
-- The idea is to minimize scanner tooltip changes for performance.
Private.Dispatcher = COMBUCTOR_ITEMINFO_DISPATCHER or function(item)
	for _,update in next,Private.updates do
		update(item)
	end
	tooltip.owner, tooltip.bag, tooltip.slot = nil, nil, nil
end

-- Hook the updater
if (not COMBUCTOR_ITEMINFO_DISPATCHER) then
	hooksecurefunc(Combuctor.ItemSlot or Combuctor.Item, "Update", Private.Dispatcher)
end

-- (Re)assign globals
COMBUCTOR_ITEMINFO_DISPATCHER = Private.Dispatcher
COMBUCTOR_ITEMINFO_UPDATES = Private.updates
COMBUCTOR_ITEMINFO_UPDATES_BY_MODULE = Private.updatesByModule
COMBUCTOR_ITEMINFO_SCANNERTOOLTIP = Private.tooltip


--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lars Norberg

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

--]]
local Addon, Private =  ...
if (Private.Incompatible) then
	return
end

CombuctorItemInfo_DB = {
	enableItemLevel = true,
	enableItemBind = false,
	enableGarbage = true,
	enableUncollected = true,
	enableRarityColoring = false
}

SLASH_COMBUCTOR_ITEMLEVEL1 = "/cif"
SlashCmdList["COMBUCTOR_ITEMLEVEL"] = function(msg)
	if (not msg) then
		return
	end

	msg = string.gsub(msg, "^%s+", "")
	msg = string.gsub(msg, "%s+$", "")
	msg = string.gsub(msg, "%s+", " ")

	local action, element = string.split(" ", msg)
	local db = CombuctorItemInfo_DB

	if (action == "enable") then
		if (element == "itemlevel" or element == "ilvl") then
			db.enableItemLevel = true
		elseif (element == "boe" or element == "bind") then
			db.enableItemBind = true
		elseif (element == "junk" or element == "trash" or element == "garbage") then
			db.enableGarbage = true
		elseif (element == "eye" or element == "transmog" or element == "uncollected") then
			db.enableUncollected = true
		elseif (element == "color") then
			db.enableRarityColoring = true
		end

	elseif (action == "disable") then
		if (element == "itemlevel" or element == "ilvl") then
			db.enableItemLevel = false
		elseif (element == "boe" or element == "bind") then
			db.enableItemBind = false
		elseif (element == "junk" or element == "trash" or element == "garbage") then
			db.enableGarbage = false
		elseif (element == "eye" or element == "transmog" or element == "uncollected") then
			db.enableUncollected = false
		elseif (element == "color") then
			db.enableRarityColoring = false
		end
	end

	if (Private.Forceupdate) then
		Private.Forceupdate()
	end

end
--[[

	The MIT License (MIT)

	Copyright (c) 2022 Lars Norberg

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

--]]
local Addon, Private =  ...
if (Private.Incompatible) then
	print("|cffff1111"..Addon.." was auto-disabled.")
	return
end

local Module = Combuctor:NewModule(Addon, Private, "WildAddon-1.0")
