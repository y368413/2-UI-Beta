-- ==================================================================================================================== --
--															--
--	File			Skada.lua										--
--															--
--															--
--	Author			Zarnivoop	| Basis, thx |			| Version	   :	 10.0.2 |	--
--										| Curse-Project-ID :	 694380 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--				Baltha		| Revision |			| Version	   :	 11.1.0 |	--
--										| Curse-Project-ID :	1188318 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--	Path | Revision |	"..\World of Warcraft\_retail_\Interface\AddOns\Skada\Misc\Changelog\ChangeLog.txt"	--
--															--
-- ==================================================================================================================== --


local _, addon = ...


local Skada    = LibStub("AceAddon-3.0"):NewAddon(addon, "Skada", "AceTimer-3.0", "LibNotify-1.0")
_G.Skada       = Skada


local L        = LibStub("AceLocale-3.0"):GetLocale("Skada", false)
local acd      = LibStub("AceConfigDialog-3.0")
local icon     = LibStub("LibDBIcon-1.0", true)

local media    = LibStub("LibSharedMedia-3.0")
local boss     = LibStub("LibBossIDs-1.0")
local lds      = LibStub("LibDualSpec-1.0", true)


-- ================
-- | Minimap Icon |
-- ================
local dataobj  = LibStub("LibDataBroker-1.1"):NewDataObject("Skada",

	{

		label  = "Skada",
		type   = "data source",
		icon   = "Interface\\Icons\\Spell_Lightning_LightningBolt01",
		text   = "n/a"

	})


local popup, cleuFrame
local realmName	      = ""


local deathcounter    = 0
local startingmembers = 0

local tsort, tinsert, tremove	= table.sort, table.insert, table.remove
local next, pairs, ipairs, type = next, pairs, ipairs, type
local band			= bit.band

local PET_FLAGS  = bit.bor(COMBATLOG_OBJECT_TYPE_PET, COMBATLOG_OBJECT_TYPE_GUARDIAN)
local RAID_FLAGS = bit.bor(COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_AFFILIATION_RAID)


function Skada:GetGroupTypeAndCount()

	local type
	local count   = GetNumGroupMembers()

	if IsInRaid() then

		type  = "raid"
	elseif IsInGroup() then

		type  = "party"
		count = count - 1
	end

	return type, count
end


do

	popup = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
	popup:SetScript("OnEvent",

			function(frame, event, ...)

				Skada[event](Skada, ...)
			end

		       )


	popup:SetBackdrop({

				bgFile	 = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
				edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",

				tile	 = true, tileSize = 16, edgeSize = 16,
				insets	 = {left = 1, right = 1, top = 1, bottom = 1}

			  })


	popup:SetSize(250, 100)
	popup:SetPoint("CENTER", UIParent, "CENTER")
	popup:SetFrameStrata("DIALOG")
	popup:Hide()
	popup:EnableKeyboard(true)

	popup:SetScript("OnKeyDown",

			function(self,key)

				if GetBindingFromClick(key) == "TOGGLEGAMEMENU" then

					popup:SetPropagateKeyboardInput(false)
					popup:Hide()
				end
			end
		       )


	local text   = popup:CreateFontString(nil, "ARTWORK", "ChatFontNormal")

	text:SetPoint("TOP", popup, "TOP", 0, -15)
	text:SetText(L["Do you want to reset Skada?"])

	local accept = CreateFrame("Button", nil, popup)

	accept:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Check")
	accept:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight", "ADD")
	accept:SetSize(50, 50)
	accept:SetPoint("BOTTOM", popup, "BOTTOM", -50, 5)
	accept:SetScript("OnClick", function(f) Skada:Reset() f:GetParent():Hide() end)


	local close  = CreateFrame("Button", nil, popup)

	close:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	close:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
	close:SetSize(50, 50)
	close:SetPoint("BOTTOM", popup, "BOTTOM", 50, 5)
	close:SetScript("OnClick", function(f) f:GetParent():Hide() end)

	function Skada:ShowPopup()

		popup:SetPropagateKeyboardInput(true)
		popup:Show()
	end
end


BINDING_HEADER_Skada	      = "Skada"
BINDING_NAME_SKADA_TOGGLE     = L["Toggle window"]
BINDING_NAME_SKADA_RESET      = L["Reset"]
BINDING_NAME_SKADA_NEWSEGMENT = L["Start new segment"]
BINDING_NAME_SKADA_STOP       = L["Stop"]

Skada.current		      = nil
Skada.total		      = nil
Skada.last		      = nil

local modes		      = {}
local pets, players	      = {}, {}
local changed		      = true
local wasinparty	      = nil

Skada.classcolors	      = RAID_CLASS_COLORS

local selectedfeed	      = nil
local feeds		      = {}
local disabled		      = false
local windows		      = {}
Skada.displays		      = {}
local update_timer	      = nil
local tick_timer	      = nil


function Skada:GetWindows()

	return windows
end




local function find_mode(name)

	for i, mode in ipairs(modes) do

		if mode:GetName() == name then

			return mode
		end
	end
end


local Window = {}
local mt     = {__index = Window}


function Window:new()

	return setmetatable({

				selectedmode = nil,
				selectedset  = nil,

				restore_mode = nil,
				restore_set  = nil,

				usealt	     = true,
				dataset	     = {},

				metadata     = {},
				display	     = nil,

				history	     = {},
				changed = false,

			    }, mt)
end




function Window:AddOptions()

	local db      = self.db
	local options = {

				type = "group",
				name = function() return db.name end,

				args = {

					rename = {

							type	= "input",
							name	= L["Rename window"],
							desc	= L["Enter the name for the window."],
							get	= function()
								  	return db.name
								  end,
							set	= function(win, val)
								  	if val ~= db.name and val ~= "" then
								  		local oldname = db.name
									  	db.name	      = val

									  	Skada.options.args.windows.args[val]	 = Skada.options.args.windows.args[oldname]
									  	Skada.options.args.windows.args[oldname] = nil
								  	end
								  end,
							order	= 1,

						 },

					locked = {

							type	= "toggle",
							name	= L["Lock window"],
							desc	= L["Locks the bar window in place."],
							order	= 2,
							get	= function()
								 	 return db.barslocked
								  end,
							set 	= function()
								  	db.barslocked = not db.barslocked
								  	Skada:ApplySettings()
								  end,

						 },

					delete = {

							type    = "execute",
							name    = L["Delete window"],
							desc    = L["Deletes the chosen window."],
							order   = 20,
							width   = "full",
							confirm = function()
								  	return "Are you sure you want to delete this window?"
								  end,
							func    = function()
								  	Skada:DeleteWindow(db.name)
								  end,

						 },
				       }
			}


	options.args.switchoptions =
			{

				type = "group",
				name = L["Mode switching"],
				order = 4,

				args = {

				  modeincombat = {

							type	 = "select",
							name	 = L["Combat mode"],
							desc	 = L["Automatically switch to set 'Current' and this mode when entering combat."],
							values	 = function()
								  	local modes = {}
								  	modes[""]   = L["None"]

								  	for i, mode in ipairs(Skada:GetModes()) do
										modes[mode:GetName()] = mode:GetName()
									end

								   	return modes
								   end,
							get	 = function()
								   	return db.modeincombat
								   end,
							set	 = function(win, mode)
								   	db.modeincombat = mode
								   end,
							order	 = 21,

						 },

				      wipemode = {

							type	 = "select",
							name	 = L["Wipe mode"],
							desc	 = L["Automatically switch to set 'Current' and this mode after a wipe."],
							values	 = function()
								  	local modes = {}
									modes[""]   = L["None"]

								  	for i, mode in ipairs(Skada:GetModes()) do
								  		modes[mode:GetName()] = mode:GetName()
								  	end

								  	return modes
								   end,
							get	 = function()
								  	return db.wipemode
								   end,
							set	 = function(win, mode)
								  	db.wipemode = mode
								   end,
							order	 = 21,

						 },

			     returnaftercombat = {

							type	 = "toggle",
							name	 = L["Return after combat"],
							desc	 = L["Return to the previous set and mode after combat ends."],
							order	 = 23,
							get	 = function()
									  return db.returnaftercombat
								   end,
							set	 = function()
									  db.returnaftercombat = not db.returnaftercombat
								   end,
							disabled = function() return db.returnaftercombat == nil end,

						 },
				       }
			}

	self.display:AddDisplayOptions(self, options.args)
	Skada.options.args.windows.args[self.db.name] = options
end




function Window:SetChild(window)

	self.child = window
end




function Window:destroy()

	self.dataset = nil
	self.display:Destroy(self)

	local name   = self.db.name or Skada.windowdefaults.name

	Skada.options.args.windows.args[name] = nil
end




function Window:SetDisplay(name)

	if name ~= self.db.display or self.display == nil then

		if self.display then self.display:Destroy(self)	end

		self.db.display = name
		self.display	= Skada.displays[self.db.display]

		self:AddOptions()
	end
end




function Window:UpdateDisplay()

	if not self.metadata.maxvalue then

		self.metadata.maxvalue = 0

		for i, data in ipairs(self.dataset) do

			if data.id and data.value > self.metadata.maxvalue then	self.metadata.maxvalue = data.value end
		end
	end

	self.display:Update(self)
	self:set_mode_title()
end




function Window:UpdateInProgress()

	for i, data in ipairs(self.dataset) do

		if data.ignore then data.icon = nil end

		data.id		  = nil
		data.ignore	  = nil
	end
end




function Window:Show()

	self.display:Show(self)
end




function Window:Hide()

	self.display:Hide(self)
end




function Window:IsShown()

	return self.display:IsShown(self)
end




function Window:Reset()

	for i, data in ipairs(self.dataset) do

		wipe(data)
	end
end




function Window:Wipe()

	self:Reset()
	self.display:Wipe(self)

	if self.child then self.child:Wipe() end
end




function Window:get_selected_set()

	return Skada:find_set(self.selectedset)
end




function Window:DisplayMode(mode)

	self:Wipe()

	self.selectedplayer = nil
	self.selectedspell  = nil
	self.selectedmode   = mode

	self.metadata	    = wipe(self.metadata or {})


	if mode.metadata then

		for key, value in pairs(mode.metadata) do

			self.metadata[key] = value
		end
	end


	self.changed = true
	self:set_mode_title()


	if self.child then self.child:DisplayMode(mode)	end


	Skada:UpdateDisplay(false)
end


local numsetfmts = 8


local function SetLabelFormat(name, starttime, endtime, fmt)

	fmt		= fmt or Skada.db.profile.setformat
	local namelabel = name


	if fmt < 1 or fmt > numsetfmts then fmt = 3 end


	local timelabel = ""


	if starttime and endtime and fmt > 1 then

		local duration	     = SecondsToTime(endtime-starttime, false, false, 2)
		Skada.getsetlabel_fs = Skada.getsetlabel_fs or UIParent:CreateFontString(nil, "ARTWORK", "ChatFontNormal")

		Skada.getsetlabel_fs:SetText(duration)
		duration	     = "(" .. Skada.getsetlabel_fs:GetText() .. ")"


		if     fmt == 2 then

			timelabel = duration
		elseif fmt == 3 then

			timelabel = date("%H:%M"   ,starttime) .. " "   .. duration
		elseif fmt == 4 then

			timelabel = date("%I:%M"   ,starttime) .. " "   .. duration
		elseif fmt == 5 then

			timelabel = date("%H:%M"   ,starttime) .. " - " .. date("%H:%M",endtime)
		elseif fmt == 6 then

			timelabel = date("%I:%M"   ,starttime) .. " - " .. date("%I:%M",endtime)
		elseif fmt == 7 then

			timelabel = date("%H:%M:%S",starttime) .. " - " .. date("%H:%M:%S",endtime)
		elseif fmt == 8 then

			timelabel = date("%H:%M"   ,starttime) .. " - " .. date("%H:%M",endtime).." "..duration
		end
	end


	local comb


	if #namelabel == 0 or #timelabel == 0 then

		comb = namelabel .. timelabel
	elseif timelabel:match("^%p") then

		comb = namelabel .. " " .. timelabel
	else

		comb = namelabel .. ": " .. timelabel
	end

	return comb, namelabel, timelabel
end




function Skada:SetLabelFormats()

	local ret      = {}
	local start    = 1000007900

	for i = 1, numsetfmts do ret[i] = SetLabelFormat("Hogger", start, start+380, i)	end

	return ret
end




function Skada:GetSetLabel(set)

	if not set then	return "" end

	return SetLabelFormat(set.name or "Unknown", set.starttime, set.endtime or time())
end




function Window:set_mode_title()

	if not self.selectedmode or not self.selectedset then return end


	local name	 = self.selectedmode.title or self.selectedmode:GetName()
	self.db.set	 = self.selectedset
	local savemode	 = name


	if self.history[1] then	savemode = self.history[1].title or self.history[1]:GetName() end


	self.db.mode	 = savemode


	if self.db.titleset then

		local setname


		if self.selectedset == "current" then

			setname		= L["Current"]
		elseif self.selectedset == "total" then

			setname		= L["Total"]
		else

			local set	= self:get_selected_set()

			if set then

				setname = Skada:GetSetLabel(set)
			end
		end


		if setname then name    = name .. ": " .. setname end
	end


	if disabled and (self.selectedset == "current" or self.selectedset == "total") then

		name 	    = name .. "  |cFFFF0000" .. L["DISABLED"] .. "|r"
	end


	self.metadata.title = name
	self.display:SetTitle(self, name)
end




local function sort_modes()

	tsort(modes,

	      function(a, b)

		      if Skada.db.profile.sortmodesbyusage and Skada.db.profile.modeclicks then

			      return (Skada.db.profile.modeclicks[a:GetName()] or 0) > (Skada.db.profile.modeclicks[b:GetName()] or 0)
		      else

			      return a:GetName() < b:GetName()
		      end
	     end
	    )
end




local function click_on_mode(win, id, label, button)

	if button == "LeftButton" then

		local mode = find_mode(id)


		if mode then

			if Skada.db.profile.sortmodesbyusage then

				if not Skada.db.profile.modeclicks then

					Skada.db.profile.modeclicks = {}
				end

				Skada.db.profile.modeclicks[id]	    = (Skada.db.profile.modeclicks[id] or 0) + 1
				sort_modes()
			end

			win:DisplayMode(mode)
		end
	elseif button == "RightButton" then

		win:RightClick()
	end
end




function Window:DisplayModes(settime)

	self.history		 = wipe(self.history or {})
	self:Wipe()

	self.selectedplayer	 = nil
	self.selectedmode	 = nil

	self.metadata		 = wipe(self.metadata or {})
	self.metadata.title	 = L["Skada: Modes"]


	if settime == "current" or settime == "total" then

		self.selectedset = settime
	else

		for i, set in ipairs(Skada.char.sets) do

			if tostring(set.starttime) == settime then

				if     set.name == L["Current"] then

					self.selectedset = "current"
				elseif set.name == L["Total"] then

					self.selectedset = "total"
				else

					self.selectedset = i
				end
			end
		end
	end

	self.metadata.click	 = click_on_mode
	self.metadata.maxvalue	 = 1
	self.metadata.sortfunc	 = function(a,b) return a.name < b.name end

	self.display:SetTitle(self, self.metadata.title)
	self.changed		 = true


	if self.child then self.child:DisplayModes(settime) end


	Skada:UpdateDisplay(false)
end




local function click_on_set(win, id, label, button)

	if     button == "LeftButton" then

		win:DisplayModes(id)
	elseif button == "RightButton" then

		win:RightClick()
	end
end




function Window:DisplaySets()

	self.history	       = wipe(self.history or {})
	self:Wipe()

	self.metadata = wipe(self.metadata or {})

	self.selectedplayer    = nil
	self.selectedmode      = nil
	self.selectedset       = nil

	self.metadata.title    = L["Skada: Fights"]
	self.display:SetTitle(self, self.metadata.title)

	self.metadata.click    = click_on_set
	self.metadata.maxvalue = 1
	self.changed = true

	if self.child then self.child:DisplaySets() end

	Skada:UpdateDisplay(false)
end




function Window:RightClick(group, button)

	if self.selectedmode then

		if #self.history > 0 then

			self:DisplayMode(tremove(self.history))
		else

			self:DisplayModes(self.selectedset)
		end
	elseif self.selectedset then

		self:DisplaySets()
	end
end




function Skada:tcopy(to, from, ...)

	for k, v in pairs(from) do

		local skip = false


		if ... then

			for i, j in ipairs(...) do

				if j == k then

					skip = true
					break
				end
			end
		end


		if not skip then

			if type(v) == "table" then

				to[k] = {}
				Skada:tcopy(to[k], v, ...)
			else

				to[k] = v
			end
		end
	end
end




function Skada:CreateWindow(name, db, display)

	local isnew   = false


	if not db then

		isnew = true
		db    = {}

		self:tcopy(db, Skada.windowdefaults)
		tinsert(self.db.profile.windows, db)
	end


	if display 	     then db.display    = display									       end
	if not db.barbgcolor then db.barbgcolor	= {r = 0.3, g = 0.3, b = 0.3, a = 0.6}						       end
	if not db.buttons    then db.buttons	= {menu = true, reset = true, report = true, mode = true, segment = true, stop = true} end
	if not db.scale	     then db.scale	= 1										       end

	if not db.version then

		db.version	= 1
		db.buttons.stop = true
	end


	local window   = Window:new()

	window.db      = db
	window.db.name = name


	if self.displays[window.db.display] then

		window:SetDisplay(window.db.display or "bar")
		window.display:Create(window, isnew)

		tinsert(windows, window)
		window:DisplaySets()


		if isnew and find_mode(L["Damage"]) then

			self:RestoreView(window, "current", L["Damage"])
		elseif window.db.set or window.db.mode then

			self:RestoreView(window, window.db.set, window.db.mode)
		end
	else

		self:Print("Window '" .. name.."' was not loaded because its display module, '" .. window.db.display .. "' was not found.")
	end

	self:ApplySettings()
	return window
end




function Skada:DeleteWindow(name)

	for i, win in ipairs(windows) do

		if win.db.name == name then

			win:destroy()
			wipe(tremove(windows, i))
		end
	end


	for i, win in ipairs(self.db.profile.windows) do

		if win.name == name then

			tremove(self.db.profile.windows, i)
		end
	end
end




function Skada:Print(msg)

	print("|cFF33FF99Skada|r: "..msg)
end




function Skada:Debug(...)

	if not Skada.db.profile.debug then return end


	local msg = ""


	for i = 1, select("#",...) do

		local v = tostring(select(i,...))

		if #msg > 0 then

			msg = msg .. ", "
		end

		msg = msg..v
	end

	print("|cFF33FF99Skada Debug|r: " .. msg)
end




local function slashHandler(param)

	local reportusage   = "/skada report [raid|party|instance|guild|officer|say] [current||total|set_num] [mode] [max_lines]"


	if param == "pets" then

		Skada:PetDebug()
	elseif param == "cpu" then

		local funcs = {}
		UpdateAddOnCPUUsage()

		for k, v in pairs(Skada) do

			if type(v) == "function" then

				local usage, calls = GetFunctionCPUUsage(v, true)
				tinsert(funcs, {["name"] = k, ["usage"] = usage, ["calls"] = calls})
			end
		end

		tsort(funcs, function(a, b) return a.usage > b.usage end)


		for i, func in ipairs(funcs) do

			print(func.name .. '\t' .. func.usage .. ' (' .. func.calls .. ')')

			if i > 10 then break end
		end
	elseif param == "test" then

		Skada:Notify("test")
	elseif param == "reset" then

		Skada:Reset()
	elseif param == "newsegment" then

		Skada:NewSegment()
	elseif param == "toggle" then

		Skada:ToggleWindow()
	elseif param == "debug" then

		Skada.db.profile.debug = not Skada.db.profile.debug
		Skada:Print("Debug mode " .. (Skada.db.profile.debug and ("|cFF00FF00" .. L["ENABLED"] .. "|r") or ("|cFFFF0000" .. L["DISABLED"] .. "|r")))
	elseif param == "config" then

		Skada:OpenOptions()
	elseif param:sub(1,6) == "report" then

		local chan	       = (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "instance") or (IsInRaid() and "raid") or (IsInGroup() and "party") or "say"
		local set	       = "current"
		local report_mode_name = L["Damage"]
		local w1, w2, w3, w4   = param:match("^%s*(%w*)%s*(%w*)%s*([^%d]-)%s*(%d*)%s*$",7)

		
		if w1 and #w1 > 0 then

			chan = string.lower(w1)
		end


		if w2 and #w2 > 0 then

			w2   = tonumber(w2) or w2:lower()

			if Skada:find_set(w2) then

				set		= w2
			end
		end


		if w3 and #w3 > 0 then

			w3   = strtrim(w3)
			w3   = strtrim(w3,"'\"[]()")

			if find_mode(w3) then

				report_mode_name = w3
			end
		end


		local max    = tonumber(w4) or 10


		if chan == "instance" then chan = "instance_chat" end

		if chan == "say" or chan == "guild" or chan == "raid" or chan == "party" or chan == "officer" or chan == "instance_chat" then

			Skada:Report(chan, "preset", report_mode_name, set, max)
		else

			Skada:Print("Usage:")
			Skada:Print(("%-20s"):format(reportusage))
		end
	else
		Skada:Print("Usage:")

		Skada:Print(("%-20s"):format(reportusage))
		Skada:Print(("%-20s"):format("/skada reset"))
		Skada:Print(("%-20s"):format("/skada toggle"))
		Skada:Print(("%-20s"):format("/skada debug"))
		Skada:Print(("%-20s"):format("/skada newsegment"))
		Skada:Print(("%-20s"):format("/skada config"))
	end
end




local function sendchat(msg, chan, chantype)

	if     chantype == "self" then

		Skada:Print(msg)
	elseif chantype == "channel" then

		SendChatMessage(msg, "CHANNEL", nil, chan)
	elseif chantype == "preset" then

		SendChatMessage(msg, string.upper(chan))
	elseif chantype == "whisper" then

		SendChatMessage(msg, "WHISPER", nil, chan)
	elseif chantype == "bnet" then

		BNSendWhisper(chan,msg)
	end
end




function Skada:Report(channel, chantype, report_mode_name, report_set_name, max, window)

	if chantype == "channel" then

		local list = {GetChannelList()}

		for i = 1, #list, 3 do

			if Skada.db.profile.report.channel == list[i+1] then

				channel = list[i]
				break
			end
		end
	end

	local report_table
	local report_set
	local report_mode

	if not window then

		report_mode  = find_mode(report_mode_name)
		report_set   = Skada:find_set(report_set_name)


		if report_set == nil then return end


		report_table = Window:new()
		report_mode:Update(report_table, report_set)
	else
		report_table = window
		report_set   = window:get_selected_set()
		report_mode  = window.selectedmode
	end


	if not report_set then

		Skada:Print(L["There is nothing to report."])

		return
	end


	if not report_table.metadata.ordersort then

		tsort(report_table.dataset, Skada.valueid_sort)
	end


	sendchat(string.format(L["Skada: %s for %s:"], report_mode.title or report_mode:GetName(), Skada:GetSetLabel(report_set)), channel, chantype)


	local nr = 1


	for i, data in ipairs(report_table.dataset) do

		if data.id then

			local label = data.reportlabel or data.spellid or data.label


			if report_mode.metadata and report_mode.metadata.showspots then

				sendchat(("%2u. %s   %s"):format(nr, label, data.valuetext), channel, chantype)
			else

				sendchat(("%s   %s"):format(label, data.valuetext), channel, chantype)
			end

			nr = nr + 1
		end

		if nr > max then break end
	end
end




function Skada:RefreshMMButton()

	if icon then

		icon:Refresh("Skada", self.db.profile.icon)


		if self.db.profile.icon.hide then

			icon:Hide("Skada")
		else

			icon:Show("Skada")
		end
	end
end




function Skada:PetDebug()

	self:CheckGroup()
	self:Print("pets:")

	for pet, owner in pairs(pets) do

		self:Print("pet " .. pet .. " belongs to " .. owner.id .. ", " .. owner.name)
	end
end




function Skada:SetActive(enable)

	if enable then

		for i, win in ipairs(windows) do

			win:Show()
		end
	else

		for i, win in ipairs(windows) do

			win:Hide()
		end
	end


	if not enable and self.db.profile.hidedisables then

		if not disabled then

			self:Debug(L["Data Collection"] .. " " .. "|cFFFF0000" .. L["DISABLED"] .. "|r")
		end

		disabled = true
		cleuFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	else

		if disabled then

			self:Debug(L["Data Collection"] .. " " .. "|cFF00FF00" .. L["ENABLED"] .. "|r")
		end

		disabled = false
		cleuFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end

	Skada:UpdateDisplay(true)
end




function Skada:CheckGroup()

	local type, count = self:GetGroupTypeAndCount()

	if count > 0 then

		for i = 1, count do

			local unit	 = ("%s%d"):format(type, i)
			local playerGUID = UnitGUID(unit)

			if playerGUID then

				players[playerGUID] = true

				local unitPet = unit.."pet"
				local petGUID = UnitGUID(unitPet)


				if petGUID and not pets[petGUID] then

					local name, server = UnitName(unit)


					if server and server ~= "" then name = name.."-"..server end


					pets[petGUID]	   = {id = playerGUID, name = name}
				end
			end
		end
	end

	local playerGUID = UnitGUID("player")

	if playerGUID then

		players[playerGUID]   = true
		local petGUID	      = UnitGUID("playerpet")


		if petGUID and not pets[petGUID] then

			local name = UnitName("player")
			pets[petGUID] = {id = playerGUID, name = name}
		end
	end
end




local function verify_set(mode, set)

	if mode.AddSetAttributes ~= nil then

		mode:AddSetAttributes(set)
	end


	for j, player in ipairs(set.players) do

		if mode.AddPlayerAttributes ~= nil then	mode:AddPlayerAttributes(player, set) end
	end
end


local wasininstance
local wasinpvp
local pvp_zones = {}


local function IsInPVP()

	local pvpType, isFFA  = GetZonePVPInfo()
	local _, instanceType = IsInInstance()

	return instanceType == "pvp" or instanceType == "arena" or pvpType == "arena" or pvpType == "combat" or isFFA
end




function Skada:ZoneCheck()

	local inInstance, instanceType = IsInInstance()

	local isininstance = inInstance and (instanceType == "party" or instanceType == "raid")
	local isinpvp	   = IsInPVP()


	if isininstance and wasininstance ~= nil and not wasininstance and self.db.profile.reset.instance ~= 1 and Skada:CanReset() then

		if self.db.profile.reset.instance == 3 then

			Skada:ShowPopup()
		else

			self:Reset()
		end
	end


	if self.db.profile.hidepvp then

		if IsInPVP() then

			Skada:SetActive(false)
		elseif wasinpvp then

			Skada:SetActive(true)
		end
	end


	if isininstance then

		wasininstance = true
	else

		wasininstance = false
	end


	if isinpvp then

		wasinpvp = true
	else

		wasinpvp = false
	end
end




function Skada:ZONE_CHANGED_NEW_AREA()

	Skada:ZoneCheck()
end




function Skada:PLAYER_ENTERING_WORLD()

	realmName = GetNormalizedRealmName()
	Skada:ZoneCheck()

	if wasinparty == nil then Skada:ScheduleTimer("GROUP_ROSTER_UPDATE",1) end
end




local function check_for_join_and_leave()

	if not IsInGroup() and wasinparty then

		if     Skada.db.profile.reset.leave == 3 and Skada:CanReset() then

			Skada:ShowPopup()
		elseif Skada.db.profile.reset.leave == 2 and Skada:CanReset() then

			Skada:Reset()
		end

		if Skada.db.profile.hidesolo then

			Skada:SetActive(false)
		end
	end


	if IsInGroup() and wasinparty == false then

		if     Skada.db.profile.reset.join == 3 and Skada:CanReset() then

			Skada:ShowPopup()
		elseif Skada.db.profile.reset.join == 2 and Skada:CanReset() then

			Skada:Reset()
		end


		if Skada.db.profile.hidesolo and not (Skada.db.profile.hidepvp and IsInPVP()) then

			Skada:SetActive(true)
		end
	end


	wasinparty = not not IsInGroup()
end




function Skada:GROUP_ROSTER_UPDATE()

	check_for_join_and_leave()
	self:CheckGroup()
end




function Skada:UNIT_PET()

	self:CheckGroup()
end




function Skada:PET_BATTLE_OPENING_START()

	for i, win in ipairs(windows) do

		if win:IsShown() then win:Hide() end
	end
end




function Skada:PET_BATTLE_CLOSE()

	if not Skada.db.profile.hidesolo or IsInGroup() then

		for i, win in ipairs(windows) do

			if not win.db.hidden and not win:IsShown() then	win:Show() end
		end
	end
end




function Skada:ToggleWindow()

	for i, win in ipairs(windows) do

		if win:IsShown() then

			win.db.hidden = true
			win:Hide()
		else

			win.db.hidden = false
			win:Show()
		end
	end
end




local function createSet(setname)

	local set = {players = {}, name = setname, starttime = time(), ["time"] = 0, last_action = time()}

	for i, mode in ipairs(modes) do

		verify_set(mode, set)
	end

	return set
end




function Skada:CanReset()

	local totalplayers = self.total and self.total.players


	if totalplayers and next(totalplayers) then

		return true
	end


	for _,set in ipairs(self.char.sets) do

		if not set.keep then

			return true
		end
	end

	return false
end




function Skada:Reset()

	self:Wipe()

	pets, players = {}, {}
	self:CheckGroup()


	if self.current ~= nil then

		wipe(self.current)
		self.current = createSet(L["Current"])
	end


	if self.total ~= nil then

		wipe(self.total)

		self.total	= createSet(L["Total"])
		self.char.total = self.total
	end


	self.last		= nil


	for i = #self.char.sets, 1, -1 do

		if not self.char.sets[i].keep then

			wipe(tremove(self.char.sets, i))
		end
	end


	for _, win in ipairs(windows) do

		if win.selectedset ~= "total" then

			win.selectedset = "current"
			win.changed	= true
		end
	end


	dataobj.text			= "n/a"

	self:UpdateDisplay(true)
	self:Print(L["All data has been reset."])

	if not InCombatLockdown() then

		collectgarbage("collect")
	end
end




function Skada:DeleteSet(set)

	if not set then return end

	for i, s in ipairs(self.char.sets) do

		if s == set then

			wipe(tremove(self.char.sets, i))


			if set == self.last then self.last = nil end


			for _, win in ipairs(windows) do

				if win.selectedset == i or win:get_selected_set() == set then

					win.selectedset = "current"
					win.changed = true
				elseif (tonumber(win.selectedset) or 0) > i then

					win.selectedset = win.selectedset - 1
					win.changed = true
				end
			end

			break
		end
	end

	self:Wipe()
	self:UpdateDisplay(true)
end




function Skada:ReloadSettings()

	for i, win in ipairs(windows) do

		win:destroy()
	end


	windows	   = {}


	for i, win in ipairs(self.db.profile.windows) do
		self:CreateWindow(win.name, win)
	end


	self.total = self.char.total
	Skada:ClearAllIndexes()


	if icon and not icon:IsRegistered("Skada") then

		icon:Register("Skada", dataobj, self.db.profile.icon)
	end


	self:RefreshMMButton()
	self:ApplySettings()
end




function Skada:ApplySettings()

	for i, win in ipairs(windows) do

		win.display:ApplySettings(win)
	end


	if (self.db.profile.hidesolo and not IsInGroup()) or (self.db.profile.hidepvp and IsInPVP())then

		self:SetActive(false)
	else

		self:SetActive(true)

		for i, win in ipairs(windows) do

			if win.db.hidden and win:IsShown() then

				win:Hide()
			end
		end
	end

	self:UpdateDisplay(true)
end




function Skada:SetFeed(feed)

	selectedfeed = feed
	self:UpdateDisplay()
end




local function setPlayerActiveTimes(set)

	for i, player in ipairs(set.players) do

		if player.last then player.time = player.time + (player.last - player.first) end
	end
end




function Skada:NewSegment()

	if self.current then

		self:EndSegment()
		self:StartCombat()
	end
end




local function IsRaidInCombat()

	local type, count = Skada:GetGroupTypeAndCount()


	if count > 0 then

		for i = 1, count, 1 do

			if UnitExists(type..i) and UnitAffectingCombat(type..i) then return true end
		end
	elseif UnitAffectingCombat("player") then

		return true
	end
end




local function IsRaidDead()

	local type, count = Skada:GetGroupTypeAndCount()


	if count > 0 then

		for i = 1, count, 1 do

			if UnitExists(type..i) and not UnitIsDeadOrGhost(type..i) then return false end
		end
	elseif not UnitIsDeadOrGhost("player") then

		return false
	end

	return true
end




function Skada:Tick()

	if not disabled and self.current and not InCombatLockdown() and not IsRaidInCombat() then

		self:Debug("EndSegment: Tick")
		self:EndSegment()
	end
end




function Skada:StopSegment()

	if self.current then

		self.current.stopped = true
		self.current.endtime = time()
		self.current.time    = self.current.endtime - self.current.starttime
	end
end




function Skada:ResumeSegment()

	if self.current and self.current.stopped then

		self.current.stopped = nil
		self.current.endtime = nil
		self.current.time    = nil
	end
end




function Skada:EndSegment()

	if not self.current then return	end


	if not self.db.profile.onlykeepbosses or self.current.gotboss then

		if self.current.mobname ~= nil and time() - self.current.starttime > 5 then


			if not self.current.endtime then

				self.current.endtime = time()
			end


			self.current.time    = self.current.endtime - self.current.starttime
			setPlayerActiveTimes(self.current)
			self.current.stopped = nil

			local setname	     = self.current.mobname


			if self.db.profile.setnumber then

				local max = 0

				for _, set in ipairs(self.char.sets) do

					if set.name == setname and max == 0 then

						max  = 1
					else

						local n,c = set.name:match("^(.-)%s*%((%d+)%)$")

						if n == setname then

							max = math.max(max,tonumber(c) or 0)
						end
					end
				end


				if max > 0 then	setname = setname .. " (" .. (max+1) .. ")" end
			end


			self.current.name = setname


			for i, mode in ipairs(modes) do

				if mode.SetComplete ~= nil then	mode:SetComplete(self.current) end
			end


			tinsert(self.char.sets, 1, self.current)
		end
	end


	self.last	= self.current
	self.total.time = self.total.time + self.current.time

	setPlayerActiveTimes(self.total)


	for i, player in ipairs(self.total.players) do

		player.first = nil
		player.last  = nil
	end


	self.current  = nil
	local numsets = 0


	for i, set in ipairs(self.char.sets) do
		
		if not set.keep then numsets = numsets + 1 end
	end


	for i = #self.char.sets, 1, -1 do

		if numsets > self.db.profile.setstokeep and not self.char.sets[i].keep then

			tremove(self.char.sets, i)
			numsets = numsets - 1
		end
	end


	for i, win in ipairs(windows) do

		if win.db.wipemode ~= "" and IsRaidDead() then

			self:RestoreView(win, "current", win.db.wipemode)
		elseif win.db.returnaftercombat and win.restore_mode and win.restore_set then

			if win.restore_set ~= win.selectedset or win.restore_mode ~= win.selectedmode then

				self:RestoreView(win, win.restore_set, win.restore_mode)

				win.restore_mode = nil
				win.restore_set  = nil
			end
		end


		if not win.db.hidden and self.db.profile.hidecombat and (not self.db.profile.hidesolo or IsInGroup()) then win:Show() end
	end

	self:UpdateDisplay(true)


	if update_timer then self:CancelTimer(update_timer) end
	if tick_timer	then self:CancelTimer(tick_timer)   end

	update_timer, tick_timer = nil, nil
end




function Skada:PLAYER_REGEN_DISABLED()

	if not disabled and not self.current then

		self:Debug("StartCombat: PLAYER_REGEN_DISABLED")
		self:StartCombat()
	end
end


local tentative	      = nil
local tentativehandle = nil


function Skada:StartCombat()

	deathcounter = 0
	local _, members = self:GetGroupTypeAndCount()

	startingmembers = members


	if tentativehandle ~= nil then

		self:CancelTimer(tentativehandle)
		tentativehandle = nil
	end


	if update_timer then

		self:Debug("EndSegment: StartCombat")
		self:EndSegment()
	end


	self:Wipe()


	if not self.current then self.current = createSet(L["Current"])	end


	if self.encounterName and

		GetTime() < (self.encounterTime or 0) + 15 then
		self:Debug("StartCombat setting encounterName from ENCOUNTER_START",self.encounterName)

		self.current.mobname = self.encounterName
		self.current.gotboss = true

		self.encounterName   = nil
		self.encounterTime   = nil
	end


	if self.total == nil then

		self.total = createSet(L["Total"])
		self.char.total = self.total
	end


	for i, win in ipairs(windows) do

		if win.db.modeincombat ~= "" then

			local mymode = find_mode(win.db.modeincombat)

			if mymode ~= nil then

				if win.db.returnaftercombat then

					if win.selectedset  then win.restore_set  = win.selectedset	       end

					if win.selectedmode then win.restore_mode = win.selectedmode:GetName() end
				end

				win.selectedset = "current"
				win:DisplayMode(mymode)
			end
		end


		if not win.db.hidden and self.db.profile.hidecombat then win:Hide() end
	end

	self:UpdateDisplay(true)

	update_timer = self:ScheduleRepeatingTimer("UpdateDisplay", self.db.profile.updatefrequency or 0.25)
	tick_timer   = self:ScheduleRepeatingTimer("Tick", 1)
end




function Skada:Wipe()

	for i, win in ipairs(windows) do

		win:Wipe()
	end
end




function Skada:RestoreView(win, theset, themode)

	if     theset and type(theset) == "string" and (theset == "current" or theset == "total" or theset == "last") then

		win.selectedset = theset
	elseif theset and type(theset) == "number" and theset <= #self.char.sets then

		win.selectedset = theset
	else

		win.selectedset = "current"
	end


	changed = true


	if themode then

		local mymode = find_mode(themode)


		if mymode then

			win:DisplayMode(mymode)
		else

			win:DisplayModes(win.selectedset)
		end
	else

		win:DisplayModes(win.selectedset)
	end
end




function Skada:find_set(s)

	if s == "current" then

		if     Skada.current ~= nil then

			return Skada.current
		elseif Skada.last ~= nil then

			return Skada.last
		else

			return self.char.sets[1]
		end
	elseif s == "total" then

		return Skada.total
	else

		return self.char.sets[s]
	end
end



function Skada:ClearIndexes(set)

	if set then set._playeridx = nil end
end




function Skada:ClearAllIndexes()

	Skada:ClearIndexes(self.current)
	Skada:ClearIndexes(self.char.total)

	for _,set in pairs(self.char.sets) do

		Skada:ClearIndexes(set)
	end
end




function Skada:find_player(set, playerid)

	if set then

		set._playeridx = set._playeridx or {}
		local player   = set._playeridx[playerid]


		if player then

			return player
		end


		for i, p in ipairs(set.players) do

			if p.id == playerid then

				set._playeridx[playerid] = p
				return p
			end
		end
	end
end




function Skada:get_player(set, playerid, playername)

	local player = Skada:find_player(set, playerid)

	if not player then

		if not playername then return end


		local player_name, realm = string.split("-", playername, 2)


		if realmName == realm then playername = player_name end

		
		local _, playerClass = UnitClass(playername)
		local playerRole     = UnitGroupRolesAssigned(playername)
		
		player		     = {id = playerid, class = playerClass, role = playerRole, name = playername, first = time(), ["time"] = 0}


		for i, mode in ipairs(modes) do

			if mode.AddPlayerAttributes ~= nil then

				mode:AddPlayerAttributes(player, set)
			end
		end


		player.name	     = player_name or playername

		tinsert(set.players, player)
	end


	if player.name == UNKNOWN and playername ~= UNKNOWN then

		local player_name, realm = string.split("-", playername, 2)

		player.name		 = player_name or playername

		local _, playerClass	 = UnitClass(playername)
		local playerRole	 = UnitGroupRolesAssigned(playername)

		player.class		 = playerClass
		player.role		 = playerRole
	end


	if not player.first then player.first = time() end


	player.last = time()
	changed	    = true

	return player
end


local combatlogevents = {}


function Skada:RegisterForCL(func, event, flags)

	if not combatlogevents[event] then combatlogevents[event] = {} end

	tinsert(combatlogevents[event], {["func"] = func, ["flags"] = flags})
end


cleuFrame	= CreateFrame("Frame")
Skada.cleuFrame = cleuFrame


-- ==================================================
-- | Handling of CLEU (COMBAT_LOG_EVENT_UNFILTERED) |
-- ==================================================
local function cleuHandler(timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, ...)

	local src_is_interesting = nil
	local dst_is_interesting = nil

	if not Skada.current and Skada.db.profile.tentativecombatstart and srcName and dstName and srcGUID ~= dstGUID and

		(eventtype == 'SPELL_DAMAGE' or eventtype == 'SPELL_BUILDING_DAMAGE' or eventtype == 'RANGE_DAMAGE' or eventtype == 'SWING_DAMAGE' or eventtype == 'SPELL_PERIODIC_DAMAGE') then
		src_is_interesting = band(srcFlags, RAID_FLAGS) ~= 0 or (band(srcFlags, PET_FLAGS) ~= 0 and pets[srcGUID]) or players[srcGUID]
	

		if eventtype ~= 'SPELL_PERIODIC_DAMAGE' then

			dst_is_interesting = band(dstFlags, RAID_FLAGS) ~= 0 or (band(dstFlags, PET_FLAGS) ~= 0 and pets[dstGUID]) or players[dstGUID]
		end
	

		if src_is_interesting or dst_is_interesting then
	
			Skada.current = createSet(L["Current"])


			if not Skada.total then	Skada.total = createSet(L["Total"]) end


			tentativehandle = Skada:ScheduleTimer(function()

				tentative       = nil
				tentativehandle = nil
				Skada.current   = nil

			end, 1)


			tentative = 0
		end
	end


	if Skada.current and Skada.db.profile.autostop then

		if Skada.current and eventtype == 'UNIT_DIED' and ((band(srcFlags, RAID_FLAGS) ~= 0 and band(srcFlags, PET_FLAGS) == 0) or players[srcGUID]) then

			deathcounter = deathcounter + 1


			if deathcounter > 0 and deathcounter / startingmembers >= 0.5 and not Skada.current.stopped then

				Skada:Print('Stopping for wipe.')
				Skada:StopSegment()
			end
		end


		if Skada.current and eventtype == 'SPELL_RESURRECT' and ((band(srcFlags, RAID_FLAGS) ~= 0 and band(srcFlags, PET_FLAGS) == 0) or players[srcGUID]) then

			deathcounter = deathcounter - 1
		end
	end

	if Skada.current and combatlogevents[eventtype] then

		if Skada.current.stopped then return end


		for i, mod in ipairs(combatlogevents[eventtype]) do

			local fail = false


			if mod.flags.src_is_interesting_nopets then

				local src_is_interesting_nopets = (band(srcFlags, RAID_FLAGS) ~= 0 and band(srcFlags, PET_FLAGS) == 0) or players[srcGUID]


				if src_is_interesting_nopets then

					src_is_interesting	= true
				else

					fail			= true
				end
			end


			if not fail and mod.flags.dst_is_interesting_nopets then

				local dst_is_interesting_nopets = (band(dstFlags, RAID_FLAGS) ~= 0 and band(dstFlags, PET_FLAGS) == 0) or players[dstGUID]


				if dst_is_interesting_nopets then

					dst_is_interesting	= true
				else

					fail			= true
				end
			end


			if not fail and mod.flags.src_is_interesting or mod.flags.src_is_not_interesting then


				if not src_is_interesting then

					src_is_interesting	= band(srcFlags, RAID_FLAGS) ~= 0 or (band(srcFlags, PET_FLAGS) ~= 0 and pets[srcGUID]) or players[srcGUID]
				end


				if mod.flags.src_is_interesting and not src_is_interesting then

					fail			= true
				end


				if mod.flags.src_is_not_interesting and src_is_interesting then

					fail			= true
				end
			end


			if not fail and mod.flags.dst_is_interesting or mod.flags.dst_is_not_interesting then

				if not dst_is_interesting then

					dst_is_interesting	= band(dstFlags, RAID_FLAGS) ~= 0 or (band(dstFlags, PET_FLAGS) ~= 0 and pets[dstGUID]) or players[dstGUID]
				end


				if mod.flags.dst_is_interesting and not dst_is_interesting then

					fail			= true
				end


				if mod.flags.dst_is_not_interesting and dst_is_interesting then

					fail			= true
				end
			end


			if not fail then

				mod.func(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)


				if tentative ~= nil then

					tentative = tentative + 1


					if tentative == 5 then

						Skada:CancelTimer(tentativehandle)
						tentativehandle = nil

						Skada:Debug("StartCombat: tentative combat")
						Skada:StartCombat()
					end
				end
			end

		end
	end


	if Skada.current and src_is_interesting and not Skada.current.gotboss then

		if band(dstFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) == 0 then

			if     not Skada.current.gotboss and boss.BossIDs[tonumber(dstGUID:sub(-16, -12))] then

				Skada.current.mobname = dstName
				Skada.current.gotboss = true
			elseif not Skada.current.mobname then

				Skada.current.mobname = dstName
			end
		end
	end


	if eventtype == 'SPELL_SUMMON' and ( (band(srcFlags, RAID_FLAGS) ~= 0) or ( (band(srcFlags, PET_FLAGS)) ~= 0 ) or ((band(dstFlags, PET_FLAGS) ~= 0) and pets[dstGUID])) then

		pets[dstGUID] = {id = srcGUID, name = srcName}


		if pets[srcGUID] then

			pets[dstGUID].id   = pets[srcGUID].id
			pets[dstGUID].name = pets[srcGUID].name

		end
	end
end


Skada.cleuHandler = cleuHandler


cleuFrame:SetScript("OnEvent",

		    function()

			    -- ==================================================
			    -- | Handling of CLEU (COMBAT_LOG_EVENT_UNFILTERED) |
			    -- ==================================================
			    cleuHandler(CombatLogGetCurrentEventInfo())

		    end
		   )




function Skada:AssignPet(ownerguid, ownername, petguid)

	pets[petguid] = {id = ownerguid, name = ownername}
end




function Skada:GetPetOwner(petguid)

	return pets[petguid]
end




function Skada:ENCOUNTER_START(encounterId, encounterName)

	self:Debug("ENCOUNTER_START", encounterId, encounterName)

	if not disabled then

		if self.current then

			self.current.mobname = encounterName
			self.current.gotboss = true
		else

			self.encounterName = encounterName
			self.encounterTime = GetTime()
		end
	end
end




function Skada:ENCOUNTER_END(encounterId, encounterName)

	self:Debug("ENCOUNTER_END", encounterId, encounterName)

	if not disabled and self.current then

		if not self.current.gotboss then

			self.current.mobname = encounterName
			self.current.gotboss = true
		end
	end
end




function dataobj:OnEnter()

	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
	GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
	GameTooltip:ClearLines()

	local set


	if Skada.current then

		set = Skada.current
	else

		set = Skada.char.sets[1]
	end

	if set then

		GameTooltip:AddLine(L["Skada summary"], 0, 1, 0)


		for i, mode in ipairs(modes) do

			if mode.AddToTooltip ~= nil then mode:AddToTooltip(set, GameTooltip) end
		end
	end

	GameTooltip:AddLine("|cff6495edSkada|r", 0, 1, 0)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L["Hint: Left-Click to toggle Skada window."], 0, 1, 0)
	GameTooltip:AddLine(L["Shift + Left-Click to reset."], 0, 1, 0)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(L["Right-click to open menu"], 0, 1, 0)
	GameTooltip:Show()
end




function dataobj:OnLeave()

	GameTooltip:Hide()
end




function dataobj:OnClick(button)

	if     button == "LeftButton" and IsShiftKeyDown() then

		Skada:Reset()
	elseif button == "LeftButton"  then

		Skada:ToggleWindow()
	elseif button == "RightButton" then

		Skada:OpenMenu()
	end
end



local totalbarcolor = {r = 0.2, g = 0.2, b = 0.5, a = 1}
local bossicon	    = "Interface\\Icons\\inv_misc_food_19"
local nonbossicon   = "Interface\\Icons\\inv_misc_food_24"


function Skada:UpdateDisplay(force)

	if force then changed  = true end


	if selectedfeed ~= nil then

		local feedtext = selectedfeed()


		if feedtext then dataobj.text = feedtext end
	end

	for i, win in ipairs(windows) do


		if (changed or win.changed or self.current) then

			win.changed = false


			if win.selectedmode then

				local set = win:get_selected_set()


				if set then

					win:UpdateInProgress()


					if win.selectedmode.Update then

						win.selectedmode:Update(win, set)
					else

						self:Print("Mode " .. win.selectedmode:GetName() .. " does not have an Update function!")
					end


					if self.db.profile.showtotals and win.selectedmode.GetSetSummary then

						local total    = 0
						local existing = nil


						for i, data in ipairs(win.dataset) do

							if data.id then	total= total + data.value end
							if not existing and not data.id then existing = data end
						end

						total       = total + 1
						local d	    = existing or {}

						d.valuetext = win.selectedmode:GetSetSummary(set)
						d.value	    = total
						d.label	    = L["Total"]
						d.icon	    = dataobj.icon
						d.id	    = "total"
						d.ignore    = true


						if not existing then tinsert(win.dataset, 1, d)	end
					end

				end

				win:UpdateDisplay()
			elseif win.selectedset then

				local set = win:get_selected_set()


				for i, mode in ipairs(modes) do

					local d	       = win.dataset[i] or {}
					win.dataset[i] = d

					d.id	       = mode:GetName()
					d.label	       = mode:GetName()
					d.value	       = 1


					if set and mode.GetSetSummary ~= nil then

						d.valuetext = mode:GetSetSummary(set)
					end

					if mode.metadata and mode.metadata.icon then

						d.icon = mode.metadata.icon
					end
				end

				win.metadata.ordersort = true


				if set then win.metadata.is_modelist = true end


				win:UpdateDisplay()
			else

				local nr 	= 1
				local d 	= win.dataset[nr] or {}

				win.dataset[nr] = d

				d.id 		= "total"
				d.label 	= L["Total"]
				d.value 	= 1


				if self.total and self.total.gotboss then

					d.icon  = bossicon
				else

					d.icon  = nonbossicon
				end


				nr		= nr + 1
				d		= win.dataset[nr] or {}
				win.dataset[nr] = d

				d.id		= "current"
				d.label		= L["Current"]
				d.value		= 1


				if self.current and self.current.gotboss then

					d.icon = bossicon
				else

					d.icon = nonbossicon
				end


				for i, set in ipairs(self.char.sets) do

					nr		= nr + 1
					local d		= win.dataset[nr] or {}
					win.dataset[nr] = d

					d.id		     = tostring(set.starttime)
					d.label, d.valuetext = select(2,Skada:GetSetLabel(set))
					d.value		     = 1

					if set.keep then d.emphathize = true end

					if set.gotboss then

						d.icon = bossicon
					else

						d.icon = nonbossicon
					end
				end

				win.metadata.ordersort = true
				win:UpdateDisplay()
			end

		end
	end

	changed = false
end




function Skada:GetSets()

	return self.char.sets
end




function Skada:GetModes(sortfunc)

	return modes
end




function Skada:FormatNumber(number)

	if number then

		if self.db.profile.numberformat == 1 then

			if     number > 1000000000 then

				return ("%02.3fB"):format(number / 1000000000)
			elseif number > 1000000 then

				return ("%02.2fM"):format(number / 1000000)
			elseif number > 9999 then

				return ("%02.1fK"):format(number / 1000)
			end
		end

		return math.floor(number)
	end
end




local function scan_for_columns(mode)

	if not mode.scanned then

		mode.scanned = true


		if mode.metadata and mode.metadata.columns then	Skada:AddColumnOptions(mode) end


		if mode.metadata then

			if mode.metadata.click1 then scan_for_columns(mode.metadata.click1) end
			if mode.metadata.click2 then scan_for_columns(mode.metadata.click2) end
			if mode.metadata.click3 then scan_for_columns(mode.metadata.click3) end
		end
	end
end


local numorder = 5


function Skada:AddDisplaySystem(key, mod)

	self.displays[key] = mod

	if mod.description then

		Skada.options.args.windows.args[key.."desc"] =
			{

				type  = "description",
				name  = mod.description,
				order = numorder

			}

		numorder = numorder + 1
	end
end




function Skada:AddMode(mode, category)

	if self.total   then verify_set(mode, self.total)   end
	if self.current then verify_set(mode, self.current) end


	for i, set in ipairs(self.char.sets) do

		verify_set(mode, set)
	end


	mode.category = category or L['Other']
	tinsert(modes, mode)


	for i, win in ipairs(windows) do

		if mode:GetName() == win.db.mode then self:RestoreView(win, win.db.set, mode:GetName())	end
	end


	if selectedfeed == nil and self.db.profile.feed ~= "" then

		for name, feed in pairs(feeds) do

			if name == self.db.profile.feed then self:SetFeed(feed)	end
		end
	end


	if mode.metadata then scan_for_columns(mode) end


	sort_modes()


	for i, win in ipairs(windows) do

		win:Wipe()
	end

	changed = true
end




function Skada:RemoveMode(mode)

	tremove(modes, mode)
end




function Skada:GetFeeds()

	return feeds
end




function Skada:AddFeed(name, func)

	feeds[name] = func
end




function Skada:RemoveFeed(name, func)

	for i, feed in ipairs(feeds) do

		if feed.name == name then tremove(feeds, i) end
	end
end




function Skada:GetSetTime(set)

	if set.time then

		return set.time
	else

		return (time() - set.starttime)
	end
end




function Skada:PlayerActiveTime(set, player)

	local maxtime = 0


	if player.time > 0 				     then maxtime = player.time				 end
	if (not set.endtime or set.stopped) and player.first then maxtime = maxtime + player.last - player.first end

	return maxtime
end


do
	local tooltip = CreateFrame("GameTooltip", "SkadaTooltip", nil, "GameTooltipTemplate")
	tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")


	local function GetRussianOwnerID(owner)

		if not _G.LOCALE_ruRU or not Skada.current then	return end


		for _, p in Skada.current.players do
		
			local sex = UnitSex(p.name)


			for set = 1, GetNumDeclensionSets(p.name, sex) do

				local name = DeclineName(p.name, sex, set)


				if owner == name then return p.id end
			end
		end
	end


	local ownerPatterns = {}


	for i = 1, 44 do

		local title = _G["UNITNAME_SUMMON_TITLE"..i]

		if title and title ~= "%s" and title:find("%s", nil, true) then

			local pattern = title:gsub("%%s", "(.-)")
			tinsert(ownerPatterns, pattern)
		end
	end




	local function GetPetOwner(guid)

		tooltip:SetHyperlink("unit:" .. guid)

		for i = 2, tooltip:NumLines() do

			local text = _G["SkadaTooltipTextLeft" .. i]:GetText()


			if text then

				for _, pattern in next, ownerPatterns do

					local owner = text:match(pattern)


					if owner then return owner end
				end
			end
		end
	end




	function Skada:FixPets(action)

		if not action or not action.playername or not action.playerid then return end


		local owner = pets[action.playerid]


		if not owner and action.playerflags and band(action.playerflags, PET_FLAGS) ~= 0 and band(action.playerflags, RAID_FLAGS) ~= 0 then

			if band(action.playerflags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= 0 then

				owner				      = { id = UnitGUID("player"), name = UnitName("player") }
				pets[action.playerid]		      = owner
			else
				local ownerName			      = GetPetOwner(action.playerid)

				if ownerName then

					local id		      = UnitGUID(ownerName) or GetRussianOwnerID(ownerName)


					if players[id] then

						owner		      = { id = id, name = ownerName }
						pets[action.playerid] = owner
					end
				end
			end


			if not owner then action.playerid = action.playername end
		end


		if owner then

			if self.db.profile.mergepets then

				if action.spellname then action.spellname = action.playername .. ": " .. action.spellname end


				action.playername		 = owner.name
				action.playerid			 = owner.id
			else
				action.playername		 = owner.name .. ": " .. action.playername
				local _, _, _, _, _, id, spawnId = ("-"):split(action.playerid)
				action.playerid			 = owner.id .. id
			end
		end
	end
end




function Skada:SetTooltipPosition(tooltip, frame)

	local p = self.db.profile.tooltippos


	if     p == "default" then

		tooltip:SetOwner(UIParent, "ANCHOR_NONE")
		tooltip:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -40, 40);
	elseif p == "topleft" then

		tooltip:SetOwner(frame, "ANCHOR_NONE")
		tooltip:SetPoint("TOPRIGHT", frame, "TOPLEFT")
	elseif p == "topright" then

		tooltip:SetOwner(frame, "ANCHOR_NONE")
		tooltip:SetPoint("TOPLEFT", frame, "TOPRIGHT")
	elseif p == "smart" and frame then

		if frame:GetLeft() < (GetScreenWidth() / 2) then

			tooltip:SetOwner(frame, "ANCHOR_NONE")
			tooltip:SetPoint("TOPLEFT", frame, "TOPRIGHT", 10, 0)
		else

			tooltip:SetOwner(frame, "ANCHOR_NONE")
			tooltip:SetPoint("TOPRIGHT", frame, "TOPLEFT", -10, 0)
		end
	end
end




function Skada:FixMyPets(playerGUID, playerName)

	local pet = pets[playerGUID]


	if pet then return pet.id, pet.name end


	return playerGUID, playerName
end




function Skada:FormatValueText(...)

	local value1, bool1, value2, bool2, value3, bool3 = ...


	if     bool1 and bool2 and bool3 then

		return value1 .. " (" .. value2 .. ", " .. value3 .. ")"
	elseif bool1 and bool2 then

		return value1 .. " (" .. value2 .. ")"
	elseif bool1 and bool3 then

		return value1 .. " (" .. value3 .. ")"
	elseif bool2 and bool3 then

		return value2 .. " (" .. value3 .. ")"
	elseif bool2 then

		return value2
	elseif bool1 then

		return value1
	elseif bool3 then

		return value3
	end
end




local function value_sort(a,b)

	if     not a or a.value == nil then

		return false
	elseif not b or b.value == nil then

		return true
	else

		return a.value > b.value
	end
end




function Skada.valueid_sort(a,b)

	if     not a or a.value == nil or a.id == nil then

		return false
	elseif not b or b.value == nil or b.id == nil then

		return true
	else

		return a.value > b.value
	end
end


local ttwin = Window:new()
local white = {r = 1, g = 1, b = 1}


function Skada:AddSubviewToTooltip(tooltip, win, mode, id, label)

	wipe(ttwin.dataset)


	if mode.Enter then mode:Enter(win, id, label) end


	mode:Update(ttwin, win:get_selected_set())


	if not mode.metadata or not mode.metadata.ordersort then tsort(ttwin.dataset, value_sort) end


	if #ttwin.dataset > 0 then

		tooltip:AddLine(mode.title or mode:GetName(), 1,1,1)

		local nr = 0

		for i, data in ipairs(ttwin.dataset) do

			if data.id and nr < Skada.db.profile.tooltiprows then

				nr		    = nr + 1
				local color	    = white


				if data.color then

					color	    = data.color
				elseif data.class then

					local color = Skada.classcolors[data.class]
				end

				local label	    = data.label

				if mode.metadata and mode.metadata.showspots then

					label	    = nr .. ". " .. label
				end


				tooltip:AddDoubleLine(label, data.valuetext, color.r, color.g, color.b)
			end
		end

		if mode.Enter then tooltip:AddLine(" ")	end
	end
end




function Skada:ShowTooltip(win, id, label)

	local t = GameTooltip

	if Skada.db.profile.tooltips then

		if win.metadata.is_modelist and Skada.db.profile.informativetooltips then

			t:ClearLines()
			Skada:AddSubviewToTooltip(t, win, find_mode(id), id, label)
			t:Show()
		elseif win.metadata.click1 or win.metadata.click2 or win.metadata.click3 or win.metadata.tooltip then

			t:ClearLines()
			local hasClick = win.metadata.click1 or win.metadata.click2 or win.metadata.click3


			if win.metadata.tooltip then

				local numLines = t:NumLines()

				win.metadata.tooltip(win, id, label, t)

				if t:NumLines() ~= numLines and hasClick then

					t:AddLine(" ")
				end
			end


			if Skada.db.profile.informativetooltips then

				if win.metadata.click1 then Skada:AddSubviewToTooltip(t, win, win.metadata.click1, id, label) end
				if win.metadata.click2 then Skada:AddSubviewToTooltip(t, win, win.metadata.click2, id, label) end
				if win.metadata.click3 then Skada:AddSubviewToTooltip(t, win, win.metadata.click3, id, label) end
			end


			if win.metadata.post_tooltip then

				local numLines = t:NumLines()

				win.metadata.post_tooltip(win, id, label, t)

				if t:NumLines() ~= numLines and hasClick then

					t:AddLine(" ")
				end
			end


			if win.metadata.click1 then t:AddLine(L["Click for"]	     .. " " .. win.metadata.click1:GetName() .. ".", 0.2, 1, 0.2) end
			if win.metadata.click2 then t:AddLine(L["Shift-Click for"]   .. " " .. win.metadata.click2:GetName() .. ".", 0.2, 1, 0.2) end
			if win.metadata.click3 then t:AddLine(L["Control-Click for"] .. " " .. win.metadata.click3:GetName() .. ".", 0.2, 1, 0.2) end


			t:Show()
		end

	end
end




function Skada:ApplyBorder(frame, texture, color, thickness, padtop, padbottom, padleft, padright)

	local borderbackdrop = {}


	if not frame.borderFrame then

		frame.borderFrame = CreateFrame("Frame", nil, frame, "BackdropTemplate")
		frame.borderFrame:SetFrameLevel(0)
	end


	frame.borderFrame:SetPoint("TOPLEFT"    , frame, -thickness - (padleft  or 0),  thickness + (padtop    or 0))
	frame.borderFrame:SetPoint("BOTTOMRIGHT", frame,  thickness + (padright or 0), -thickness - (padbottom or 0))


	if texture and thickness > 0 then

		borderbackdrop.edgeFile = media:Fetch("border", texture)
	else

		borderbackdrop.edgeFile = nil
	end


	borderbackdrop.edgeSize = thickness
	frame.borderFrame:SetBackdrop(borderbackdrop)


	if color then frame.borderFrame:SetBackdropBorderColor(color.r, color.g, color.b, color.a) end
end




function Skada:FrameSettings(db, include_dimensions)

	local obj = {

		type  = "group",
		name  = L["Window"],
		order = 2,

		args  = {

			bgheader = {

					type	      = "header",
					name	      = L["Background"],
					order	      = 1

				   },

			texture  = {

					type	      = 'select',
					dialogControl = 'LSM30_Background',
					name	      = L["Background texture"],
					desc	      = L["The texture used as the background."],
					values	      = AceGUIWidgetLSMlists.background,
					get	      = function()
								return db.background.texture
							end,
					set	      = function(win, key)
								db.background.texture = key
								Skada:ApplySettings()
							end,
					width	      = "double",
					order	      = 1.1

				   },

			tile     = {

					type	      = 'toggle',
					name	      = L["Tile"],
					desc	      = L["Tile the background texture."],
					get	      = function()
								return db.background.tile
							end,
					set	      = function(win, key)
								db.background.tile = key
								Skada:ApplySettings()
							end,
					order = 1.2

				   },

			tilesize = {

					type	      = "range",
					name	      = L["Tile size"],
					desc	      = L["The size of the texture pattern."],
					min	      = 0,
					max	      = math.floor(GetScreenWidth()),
					step	      = 1.0,
					get	      = function()
								return db.background.tilesize
							end,
					set	      = function(win, val)
								db.background.tilesize = val
								Skada:ApplySettings()
							end,
					order	      = 1.3

				   },

			color    = {

					type	      = "color",
					name	      = L["Background color"],
					desc	      = L["The color of the background."],
					hasAlpha      = true,
					get	      = function(i)
								local c = db.background.color
								return c.r, c.g, c.b, c.a
							end,
					set           = function(i, r, g, b, a)
								db.background.color = {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a}
								Skada:ApplySettings()
							end,
					order	      = 1.4

				   },

		    borderheader = {

					type	      = "header",
					name	      = L["Border"],
					order	      = 2

				   },

		   bordertexture = {

					type	      = "select",
					dialogControl = "LSM30_Border",
					name	      = L["Border texture"],
					desc	      = L["The texture used for the borders."],
					values	      = AceGUIWidgetLSMlists.border,
					get	      = function()
								return db.background.bordertexture
							end,
					set	      = function(win, key)
								db.background.bordertexture = key
								Skada:ApplySettings()
							end,
					width	      ="double",
					order	      = 2.1

				   },

		     bordercolor = {

					type	      = "color",
					name	      = L["Border color"],
					desc	      = L["The color used for the border."],
					hasAlpha      = true,
					get	      = function(i)
								local c = db.background.bordercolor or {r=0, g=0, b=0, a=1}
								return c.r, c.g, c.b, c.a
							end,
					set	      = function(i, r, g, b, a)
								db.background.bordercolor = {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a}
								Skada:ApplySettings()
							end,
					order	      = 2.2

				   },

		       thickness = {

					type	      = "range",
					name	      = L["Border thickness"],
					desc	      = L["The thickness of the borders."],
					min	      = 0,
					max	      = 50,
					step	      = 0.5,
					get	      = function()
								return db.background.borderthickness
							end,
					set	      = function(win, val)
								db.background.borderthickness = val
								Skada:ApplySettings()
							end,
					order	      = 2.3

				   },

		    optionheader = {

					type	      = "header",
					name	      = L["General"],
					order	      = 4

				   },

			scale    = {

					type	      = "range",
					name	      = L["Scale"],
					desc	      = L["Sets the scale of the window."],
					min	      = 0.1,
					max	      = 3,
					step	      = 0.01,
					get	      = function() return db.scale end,
					set	      = function(win, val)
								db.scale = val
								Skada:ApplySettings()
						        end,
					order	      = 4.1

				   },

			strata   = {

					type	      = "select",
					name	      = L["Strata"],
					desc	      = L["This determines what other frames will be in front of the frame."],
					values	      = {["BACKGROUND"]="BACKGROUND", ["LOW"]="LOW", ["MEDIUM"]="MEDIUM", ["HIGH"]="HIGH",
							 ["DIALOG"]="DIALOG", ["FULLSCREEN"]="FULLSCREEN", ["FULLSCREEN_DIALOG"]="FULLSCREEN_DIALOG"},
					get	      = function()
								return db.strata
							end,
					set	      = function(win, val)
								db.strata = val
								Skada:ApplySettings()
							end,
					order	      = 4.2

				   },
			}
		    }


	if include_dimensions then

		obj.args.width  = {

					type	 = "range",
					name	 = L["Width"],
					min	 = 100,
					max	 = GetScreenWidth(),
					step	 = 1.0,
					get	 = function()
						   	return db.width
						   end,
					set	 = function(win, key)
							db.width = key
						   	Skada:ApplySettings()
						   end,
					order	 = 4.3

				  }

		obj.args.height = {

					type	 = "range",
					name	 = L["Height"],
					min	 = 16,
					max	 = 400,
					step	 = 1.0,
					get	 = function()
						  	 return db.height
						   end,
					set	 = function(win, key)
						   	db.height = key
							Skada:ApplySettings()
						   end,
					order	 = 4.4

				  }
	end

	return obj
end




function Skada:OnInitialize()

	media:Register("font"	   , "Adventure"	    , [[Interface\Addons\Skada\Media\Fonts\Adventure.ttf]])
	media:Register("font"	   , "ABF"		    , [[Interface\Addons\Skada\Media\FontsABF.ttf]])
	media:Register("font"	   , "Vera Serif"	    , [[Interface\Addons\Skada\Media\FontsVeraSe.ttf]])
	media:Register("font"	   , "Diablo"		    , [[Interface\Addons\Skada\Media\FontsAvqest.ttf]])
	media:Register("font"	   , "Accidental Presidency", [[Interface\Addons\Skada\Media\FontsAccidental Presidency.ttf]])

	media:Register("statusbar" , "Aluminium"	    , [[Interface\Addons\Skada\Media\Statusbar\Aluminium]])
	media:Register("statusbar" , "Armory"               , [[Interface\Addons\Skada\Media\Statusbar\Armory]])
	media:Register("statusbar" , "BantoBar"             , [[Interface\Addons\Skada\Media\Statusbar\BantoBar]])
	media:Register("statusbar" , "Glaze2"               , [[Interface\Addons\Skada\Media\Statusbar\Glaze2]])
	media:Register("statusbar" , "Gloss"                , [[Interface\Addons\Skada\Media\Statusbar\Gloss]])
	media:Register("statusbar" , "Graphite"             , [[Interface\Addons\Skada\Media\Statusbar\Graphite]])
	media:Register("statusbar" , "Grid"                 , [[Interface\Addons\Skada\Media\Statusbar\Grid]])
	media:Register("statusbar" , "Healbot"              , [[Interface\Addons\Skada\Media\Statusbar\Healbot]])
	media:Register("statusbar" , "LiteStep"             , [[Interface\Addons\Skada\Media\Statusbar\LiteStep]])
	media:Register("statusbar" , "Minimalist"           , [[Interface\Addons\Skada\Media\Statusbar\Minimalist]])
	media:Register("statusbar" , "Otravi"               , [[Interface\Addons\Skada\Media\Statusbar\Otravi]])
	media:Register("statusbar" , "Outline"              , [[Interface\Addons\Skada\Media\Statusbar\Outline]])
	media:Register("statusbar" , "Perl"                 , [[Interface\Addons\Skada\Media\Statusbar\Perl]])
	media:Register("statusbar" , "Smooth"               , [[Interface\Addons\Skada\Media\Statusbar\Smooth]])
	media:Register("statusbar" , "Round"                , [[Interface\Addons\Skada\Media\Statusbar\Round]])
	media:Register("statusbar" , "TukTex"               , [[Interface\Addons\Skada\Media\Statusbar\normTex]])

	media:Register("border"	   , "Glow"                 , [[Interface\Addons\Skada\Media\Border\glowTex]])
	media:Register("border"	   , "Roth"                 , [[Interface\Addons\Skada\Media\Border\roth]])

	media:Register("background", "Copper"               , [[Interface\Addons\Skada\Media\Background\copper]])

	media:Register("sound"	   , "Rubber Ducky" , 566121)	 --	[[Sound\Doodad\Goblin_Lottery_Open01.ogg]]
	media:Register("sound"	   , "Cartoon FX"   , 566543)	 --	[[Sound\Doodad\Goblin_Lottery_Open03.ogg]]
	media:Register("sound"	   , "Explosion"    , 566982)	 --	[[Sound\Doodad\Hellfire_Raid_FX_Explosion05.ogg]]
	media:Register("sound"	   , "Shing!"       , 566240)	 --	[[Sound\Doodad\PortcullisActive_Closed.ogg]]
	media:Register("sound"	   , "Wham!"        , 566946)	 --	[[Sound\Doodad\PVP_Lordaeron_Door_Open.ogg]]
	media:Register("sound"	   , "Simon Chime"  , 566076)	 --	[[Sound\Doodad\SimonGame_LargeBlueTree.ogg]]
	media:Register("sound"	   , "War Drums"    , 567275)	 --	[[Sound\Event Sounds\Event_wardrum_ogre.ogg]]
	media:Register("sound"	   , "Cheer"        , 567283)	 --	[[Sound\Event Sounds\OgreEventCheerUnique.ogg]]
	media:Register("sound"	   , "Humm"         , 569518)	 --	[[Sound\Spells\SimonGame_Visual_GameStart.ogg]]
	media:Register("sound"	   , "Short Circuit", 568975)	 --	[[Sound\Spells\SimonGame_Visual_BadPress.ogg]]
	media:Register("sound"	   , "Fel Portal"   , 569215)	 --	[[Sound\Spells\Sunwell_Fel_PortalStand.ogg]]
	media:Register("sound"	   , "Fel Nova"     , 568582)	 --	[[Sound\Spells\SeepingGaseous_Fel_Nova.ogg]]
	media:Register("sound"	   , "You Will Die!", 546633)	 --	[[Sound\Creature\CThun\CThunYouWillDie.ogg]]

	self.db			    = LibStub("AceDB-3.0"):New("SkadaDB", self.defaults, "Default")

	
	if type(SkadaPerCharDB) ~= "table" then	SkadaPerCharDB = {} end

	
	self.char		    = SkadaPerCharDB
	self.char.sets		    = self.char.sets or {}
	
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("Skada", self.options, true)
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("Skada-Profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db), true)

	local profiles		    = LibStub('AceDBOptions-3.0'):GetOptionsTable(self.db)

	profiles.order		    = 600
	profiles.disabled	    = false
	
	Skada.options.args.profiles = profiles


	if lds then

		lds:EnhanceDatabase(self.db, "SkadaDB")
		lds:EnhanceOptions(LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db), self.db)
	end


	local panel		    = CreateFrame("Frame", "SkadaBlizzOptions")
	panel.name		    = "Skada"

	panel.GetCategory	    = function() return nil end
    	panel.GetParentCategory	    = function() return nil end

	local skadaCategory	    = Settings.RegisterCanvasLayoutCategory(panel, "Skada")

	Settings.RegisterAddOnCategory(skadaCategory)
	
	local fs		    = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	
	fs:SetPoint("TOPLEFT", 10, -15)
	fs:SetPoint("BOTTOMRIGHT", panel, "TOPRIGHT", 10, -45)
	fs:SetJustifyH("LEFT")
	fs:SetJustifyV("TOP")
	fs:SetText("Skada")

	local button		    = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")

	button:SetText(L["Configure"])
	button:SetWidth(128)
	button:SetPoint("TOPLEFT", 10, -48)

	button:SetScript('OnClick',

			 function()

				 while CloseWindows() do end
				 return Skada:OpenOptions()
			 end
			)


	SLASH_SKADA1	   = "/skada"
	SlashCmdList.SKADA = slashHandler

	self.db.RegisterCallback(self, "OnProfileChanged"  , "ReloadSettings")
	self.db.RegisterCallback(self, "OnProfileCopied"   , "ReloadSettings")
	self.db.RegisterCallback(self, "OnProfileReset"    , "ReloadSettings")

	self.db.RegisterCallback(self, "OnDatabaseShutdown", "ClearAllIndexes")


	if self.db.profile.barmax then

		self:Print("Migrating old settings somewhat gracefully. This should only happen once.")

		self.db.profile.barmax		  = nil
		self.db.profile.background.height = 200
	end


	if self.db.profile.total then

		self.db.profile.current	= nil
		self.db.profile.total	= nil
		self.db.profile.sets	= nil
	end


	self:SetNotifyIcon("Interface\\Icons\\Spell_Lightning_LightningBolt01")
end




function Skada:OpenOptions(window)

	acd:SetDefaultSize("Skada", 800, 600)

	if window then

		acd:Open("Skada")
		acd:SelectGroup("Skada", "windows", window.db.name)
	elseif not acd:Close("Skada") then

		acd:Open("Skada")
	end
end




function Skada:OnEnable()

	self:ReloadSettings()

	cleuFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	popup:RegisterEvent("PLAYER_ENTERING_WORLD")
	popup:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	popup:RegisterEvent("GROUP_ROSTER_UPDATE")
	popup:RegisterEvent("UNIT_PET")
	popup:RegisterEvent("PLAYER_REGEN_DISABLED")
	popup:RegisterEvent("PET_BATTLE_OPENING_START")
	popup:RegisterEvent("PET_BATTLE_CLOSE")
	popup:RegisterEvent("ENCOUNTER_START")
	popup:RegisterEvent("ENCOUNTER_END")


	if type(CUSTOM_CLASS_COLORS) == "table" then Skada.classcolors = CUSTOM_CLASS_COLORS end


	if self.moduleList then

		for i = 1, #self.moduleList do self.moduleList[i](self, L) end

		self.moduleList   = nil
	end

	self:ScheduleTimer("ApplySettings", 2)
	self:ScheduleTimer("MemoryCheck", 3)
end




function Skada:MemoryCheck()

	UpdateAddOnMemoryUsage()
	local mem = GetAddOnMemoryUsage("Skada")


	if mem > 30000 then self:Print(L["Memory usage is high. You may want to reset Skada, and enable one of the automatic reset options."]) end
end




function Skada:AddLoadableModule(name, description, func)

	if not self.moduleList then self.moduleList = {} end


	self.moduleList[#self.moduleList+1] = func
	self:AddLoadableModuleCheckbox(name, L[name], description and L[description])
end
