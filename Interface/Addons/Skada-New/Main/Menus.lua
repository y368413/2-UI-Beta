-- ==================================================================================================================== --
--															--
--	File			Menus.lua										--
--															--
--															--
--	Author			Zarnivoop	| Basis, thx |			| Version	   :	 10.0.2 |	--
--										| Curse-Project-ID :	 694380 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--				Baltha		| Revision |			| Version	   :	 11.0.7 |	--
--										|			 11.1.0 |	--
--										| Curse-Project-ID :	1188318 |	--
--										| License	   :	  MIT/X |	--
--															--
--															--
--	Path | Revision |	"..\World of Warcraft\_retail_\Interface\AddOns\Skada\Changelog\ChangeLog.txt"		--
--															--
-- ==================================================================================================================== --


local _, Skada = ...


local L        = LibStub("AceLocale-3.0"):GetLocale("Skada", false)
local AceGUI   = LibStub("AceGUI-3.0")


local mChecked = {}


-- ==============
-- | typography |
-- ==============
local mSize    = 17

local aTexture = "Interface\\ChatFrame\\ChatFrameExpandArrow"
local dTexture = "ARTWORK"
local mTexture = "GameFontNormalSmall"


function Skada:OpenMenu(window)


	if not self.skadamenu then self.skadamenu = CreateFrame("Frame", "SkadaMenu") end


	-- ================================================
	-- | Implementation helper functions context menu |
	-- ================================================
	local function mTitle(getDescription, getText)

		local Title = getDescription:CreateTitle(getText)

		Title:AddInitializer(function(title, description, menu)

					     title.fontString:SetFontObject(mTexture)
					     title.fontString:SetHeight(mSize)

				     end
				    )

		return
	end




	local function mButton(getDescription, getText, getFunction)

		local Button = getDescription:CreateButton(getText, getFunction)

		Button:AddInitializer(function(button, description, menu)

					      button.fontString:SetFontObject(mTexture)
					      button.fontString:SetHeight(mSize)

				      end
				     )

		return
	end




	-- ==============================================================================================
	-- | context menu implementation: Blizzard_Menu (new framework), replacement for UIDropDownMenu	|
	-- |												|
	-- |				  generator function						|
	-- ==============================================================================================
	local function GeneratorFunction(owner, rootDescription)

		local leftSpacer1     =	string.rep(" ", 3)
		local leftSpacer2     =	string.rep(" ", 6)


		-- ====================================
		-- | top level 00: entries contextmenu |
		-- ====================================
		mTitle(rootDescription, L["Skada Menu"])


			-- ========================
			-- | sub level 01: general |
			-- ========================
			mTitle(rootDescription, leftSpacer1 .. L["General"])


				-- ======================================
				-- | sub level general 01-01: configure |
				-- ======================================
				mInfo		      = {}
				mInfo.func	      = function()
								Skada:OpenOptions(window)
							end
				mInfo.text	      = leftSpacer2 .. L["Configure"]

				mButton(rootDescription, mInfo.text, mInfo.func)


				-- =================================================
				-- | sub level general 01-02: close dropdown menus |
				-- =================================================
				mInfo		      = {}
				mInfo.func	      = function()
								CloseDropDownMenus()
							end
				mInfo.text	      = leftSpacer2 .. CLOSE

				mButton(rootDescription, mInfo.text, mInfo.func)


			-- ========================
			-- | sub level 02: report |
			-- ========================
			mTitle(rootDescription, leftSpacer1 .. L["Report"])


				-- =======================================
				-- | sub level report 02-01: open report |
				-- =======================================
				if not window or (window and window.selectedmode) then

				mInfo		      = {}
				mInfo.func	      = function()
								Skada:OpenReportWindow(window)
							end
				mInfo.text	      = leftSpacer2 .. L["Report"]

				mButton(rootDescription, mInfo.text, mInfo.func)
				end


			-- ===============================================
			-- [  sub level 03: show player button(s) for it |
			-- ===============================================
			mTitle(rootDescription, leftSpacer1 .. L["Window"])



-- | in progess...
			local selectedSort   = "Alphabetisch"
--			local selectedSort   = "Kategorisierend"
--			local currentSort    = {"Alphabetisch", "Kategorisierend"}


			for i, win in ipairs(Skada:GetWindows()) do

				local currentChecked = false

				mInfo		     = {}
				mInfo.text	     = leftSpacer2 .. win.db.name
				mInfo.value	     = win

				submenu	= rootDescription:CreateButton(mInfo.text)

				submenu:AddInitializer(function(button, description, menu)

							       button.fontString:SetFontObject(mTexture)
							       button.fontString:SetHeight(mSize)

							       button.arrow:SetSize(mSize, mSize)
							       button.arrow:SetTexture(aTexture)
							       button.arrow:SetDrawLayer(dTexture)
						       end
						      )

				local window	      = mInfo.value


-- ================================================================================================================
-- | mInfo.func - wert (selectedSort) wird in der funktion richtig ermittelt, nach verlassen ... und weg ist er^^ |
-- ================================================================================================================
--[[
				mTitle(submenu, "Sortierung")

				for j, currentValue in ipairs(currentSort) do
					mInfo	      = {}
					mInfo.text    = leftSpacer2 .. currentValue
					mInfo.func    = function()
								if "LeftButton" then
									selectedSort = currentValue
								else
									selectedSort = ""
								end
							end

					if selectedSort ~= "" then mInfo.text = "\124cFF00FF00" .. mInfo.text end

					mButton(submenu, mInfo.text, mInfo.func)
				end
]]
-- ================================================================================================================


				-- =============================================================
				-- | sub level player 03-10: mode button entries: alphabetical |
				-- =============================================================
				if selectedSort == "Alphabetisch" then

					for j, module in ipairs(Skada:GetModes()) do

						if j == 1 then mTitle(submenu, L["Mode"]) end

						mInfo	      = {}
						mInfo.text    = leftSpacer2 .. module:GetName()
						mInfo.func    = function()
									window:DisplayMode(module)
								end
						mInfo.checked = (window.selectedmode == module)

						if mInfo.checked then mInfo.text = "\124cFF00FF00" .. mInfo.text end

						mButton(submenu, mInfo.text, mInfo.func)
					end
				end


				-- ============================================================
				-- | sub level player 03-11: mode button entries: categorized |
				-- ============================================================				
				if selectedSort == "Kategorisierend" then

					local categorized = {}


					for j, module in ipairs(Skada:GetModes()) do table.insert(categorized, module) end


					table.sort(categorized,

							function(a, b)

								local a_score = 0
								local b_score = 0


								if a.category == L['Other'] then a_score = 1000 end
								if b.category == L['Other'] then b_score = 1000 end


								a_score = a_score + (string.byte(a.category, 1) * 10) + string.byte(a:GetName(), 1)
								b_score = b_score + (string.byte(b.category, 1) * 10) + string.byte(b:GetName(), 1)

								return a_score < b_score
							end

						  )


					local lastcat = nil


					for j, module in ipairs(categorized) do

						if j == 1 then mTitle(submenu, L["Mode"]) end


						if not lastcat or lastcat ~= module.category then

							mInfo	      = {}
							mInfo.text    = module.category

							mTitle(submenu, leftSpacer1 .. mInfo.text)

							lastcat	      = module.category
						end


						mInfo	      = {}
						mInfo.text    = leftSpacer2 .. module:GetName()
						mInfo.func    = function()
									window:DisplayMode(module)
								end
						mInfo.checked = (window.selectedmode == module)

						-- | Ue -> Ü, german vowel corrupts the sort^^
						if mInfo.text == "Ueberheilung" then mInfo.text = "Überheilung" end

						if mInfo.checked then mInfo.text = "\124cFF00FF00" .. mInfo.text end

						mButton(submenu, mInfo.text, mInfo.func)
					end
				end


				-- ==========================================
				-- | sub level player 03-20: window entries |
				-- ==========================================
				mTitle(submenu, L["Window"])


					-- ==============================================
					-- | sub level player 03-21: hide selected mode |
					-- ==============================================
					mInfo	      = {}
					mInfo.func    = function()
								if window:IsShown() then
									window.db.hidden = true
									window:Hide()
								else
									window.db.hidden = false
									window:Show()
								end
							end
					mInfo.text    = leftSpacer2 .. L["Hide window"]
					mInfo.checked = not window:IsShown()

					if mInfo.checked then mInfo.text = "\124cFFFF0000" .. mInfo.text end

					mButton(submenu, mInfo.text, mInfo.func)


					-- ==============================================
					-- | sub level player 03-21: lock selected mode |
					-- ==============================================
					mInfo	      = {}
					mInfo.text    = leftSpacer2 .. L["Lock window"]
					mInfo.func    = function()
								window.db.barslocked = not window.db.barslocked
								Skada:ApplySettings()
							end
					mInfo.checked = window.db.barslocked

					if mInfo.checked then

						mInfo.text = "\124cFF00FF00" .. mInfo.text
					else

						mInfo.text = "\124cFFFF0000" .. mInfo.text
					end

					mButton(submenu, mInfo.text, mInfo.func)


				-- ===========================================
				-- | sub level player 03-30: segment entries |
				-- ===========================================
				mTitle(submenu, L["Segment"])


					-- ======================================
					-- | sub level player 03-21: total mode |
					-- ======================================
					mInfo	      = {}
					mInfo.text    = leftSpacer2 .. L["Total"]
					mInfo.func    = function()
								window.selectedset = "total"
								Skada:Wipe()
								Skada:UpdateDisplay(true)
							end
					mInfo.checked = (window.selectedset == "total")

					if mInfo.checked then mInfo.text = "\124cFF00FF00" .. mInfo.text end

					mButton(submenu, mInfo.text, mInfo.func)


					-- ========================================
					-- | sub level player 03-21: current mode |
					-- ========================================
					mInfo	      = {}
					mInfo.text    = leftSpacer2 .. L["Current"]
					mInfo.func    = function()
								window.selectedset = "current"
								Skada:Wipe()
								Skada:UpdateDisplay(true)
							end
					mInfo.checked = (window.selectedset == "current")

					if mInfo.checked then mInfo.text = "\124cFF00FF00" .. mInfo.text end

					mButton(submenu, mInfo.text, mInfo.func)
			end


			-- ====================================================
			-- | sub level player window(s) 033: toggle window(s) |
			-- ====================================================
			mInfo		   = {}
			mInfo.func	   = function()
						     Skada:ToggleWindow()
					     end
			mInfo.text	   = leftSpacer2 .. L["Toggle window"]

			mButton(rootDescription, mInfo.text, mInfo.func)


			-- ===================================================
			-- | sub level player window(s) 034: reset window(s) |
			-- ===================================================
			mInfo		   = {}
			mInfo.func	   = function()
						     Skada:Reset()
					     end
			mInfo.text	   = leftSpacer2 .. L["Reset"]

			mButton(rootDescription, mInfo.text, mInfo.func)


			-- ========================
			-- | sub level segment 04 |
			-- ========================
			mTitle(rootDescription, leftSpacer1 .. L["Segment"])


				-- =================================
				-- | sub level segment 04-01: keep |
				-- =================================
				mInfo		   = {}
				mInfo.text	   = leftSpacer2 .. L["Keep segment"]

				submenu = rootDescription:CreateButton(mInfo.text)

				submenu:AddInitializer(function(button, description, menu)

							       button.fontString:SetFontObject(mTexture)
							       button.fontString:SetHeight(mSize)

							       button.arrow:SetSize(mSize, mSize)
							       button.arrow:SetTexture(aTexture)
							       button.arrow:SetDrawLayer(dTexture)
						       end
						      )

				for i, set in ipairs(Skada:GetSets()) do

					if i == 1 then mTitle(submenu, L["Keep segment"]) end

					mInfo.text    = Skada:GetSetLabel(set)
					mInfo.func    = function()
								set.keep = not set.keep
								Skada:Wipe()
								Skada:UpdateDisplay(true)
						        end
					mInfo.checked = set.keep

					mChecked[i] = mInfo.checked

					if mInfo.checked then mInfo.text = "\124cFF00FF00" .. mInfo.text end

					mButton(submenu, leftSpacer1 .. mInfo.text, mInfo.func)
				end


				-- ===================================
				-- | sub level segment 04-02: delete |
				-- ===================================
				mInfo		   = {}
				mInfo.text	   = leftSpacer2 .. L["Delete segment"]

				submenu = rootDescription:CreateButton(mInfo.text)

				submenu:AddInitializer(function(button, description, menu)

							       button.fontString:SetFontObject(mTexture)
							       button.fontString:SetHeight(mSize)

							       button.arrow:SetSize(mSize, mSize)
							       button.arrow:SetTexture(aTexture)
							       button.arrow:SetDrawLayer(dTexture)
						       end
						      )

				for i, set in ipairs(Skada:GetSets()) do

					if i == 1 then mTitle(submenu, L["Delete segment"]) end

					mInfo.text	   = Skada:GetSetLabel(set)
					mInfo.func	   = function()
							  	     Skada:DeleteSet(set)
							     end

					if mChecked[i] == true then	mInfo.text = "\124cCCAB82FF" .. mInfo.text end

					mButton(submenu, leftSpacer1 .. mInfo.text, mInfo.func)
				end


				-- ================================
				-- | sub level segment 04-03: new |
				-- ================================
				mInfo		   = {}
				mInfo.text	   = leftSpacer2 .. L["Start new segment"]
				mInfo.func	   = function()
							     Skada:NewSegment()
							     end
				mButton(rootDescription, mInfo.text, mInfo.func)
	end




	MenuUtil.CreateContextMenu(UIParent, GeneratorFunction)

		local skadamenu	      = self.skadamenu

		skadamenu.displayMode = "MENU"
		skadamenu.initialize  = function(self)

	end
end




function Skada:OpenReportWindow(window)

	if self.ReportWindow == nil then self:CreateReportWindow(window) end

	self.ReportWindow:Show()
end




local function destroywindow()

	if Skada.ReportWindow then

		local frame	     = Skada.ReportWindow
		frame.LayoutFinished = frame.orig_LayoutFinished

		frame.frame:SetScript("OnKeyDown", nil)
		frame.frame:EnableKeyboard(false)
		frame.frame:SetPropagateKeyboardInput(false)

		frame:ReleaseChildren()
		frame:Release()
	end

	Skada.ReportWindow = nil
end




function Skada:CreateReportWindow(window)

	self.ReportWindow = AceGUI:Create("Window")
	local frame	  = self.ReportWindow

	frame:EnableResize(false)
	frame:SetWidth(250)
	frame:SetLayout("List")

	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame.frame:SetClampedToScreen(true)

	frame.orig_LayoutFinished = frame.LayoutFinished
	frame.LayoutFinished	  = function(self, _, height) frame:SetHeight(height + 57) end

	frame.frame:EnableKeyboard(true)
	frame.frame:SetPropagateKeyboardInput(true)


	if window then

		frame:SetTitle(L["Report"] .. (" - %s"):format(window.db.name))
	else

		frame:SetTitle(L["Report"])
	end


	frame:SetCallback("OnClose", function(widget, callback) destroywindow() end)


	if window then

		Skada.db.profile.report.set = window.selectedset
		Skada.db.profile.report.mode = window.db.mode
	else
		local modebox = AceGUI:Create("Dropdown")

		modebox:SetLabel(L["Mode"])
		modebox:SetList({})


		for i, mode in ipairs(Skada:GetModes()) do

			modebox:AddItem(mode:GetName(), mode:GetName())
		end


		modebox:SetCallback("OnValueChanged", function(f, e, value) Skada.db.profile.report.mode = value end)
		modebox:SetValue(Skada.db.profile.report.mode or Skada:GetModes()[1])


		frame:AddChild(modebox)


		local setbox	      = AceGUI:Create("Dropdown")
		setbox:SetLabel(L["Segment"])
		setbox:SetList({total = L["Total"], current = L["Current"]})


		for i, set in ipairs(Skada:GetSets()) do

			setbox:AddItem(i, (Skada:GetSetLabel(set)))
		end


		setbox:SetCallback("OnValueChanged", function(f, e, value) Skada.db.profile.report.set = value end)
		setbox:SetValue(Skada.db.profile.report.set or Skada:GetSets()[1])

		frame:AddChild(setbox)
	end


	local channellist =

		{

			whisper	      = { L["Whisper"]		 , "whisper", true},
			target	      = { L["Whisper Target"]	 , "whisper"},
			say	      = { L["Say"]		 , "preset"},
			raid	      = { L["Raid"]		 , "preset"},
			party	      = { L["Party"]		 , "preset"},
			instance_chat = { L["Instance"]		 , "preset"},
			guild	      = { L["Guild"]		 , "preset"},
			officer	      = { L["Officer"]		 , "preset"},
			self	      = { L["Self"]		 , "self"},
			bnet	      = { BATTLENET_OPTIONS_LABEL, "bnet", true},

		}


	local list = {GetChannelList()}


	for i=1, #list, 3 do

		local chan = list[i+1]

		if chan ~= "Trade" and chan ~= "General" and chan ~= "LocalDefense" and chan ~= "LookingForGroup" then

			channellist[chan] = {("%s: %d/%s"):format(L["Channel"], list[i], chan), "channel"}
		end
	end


	local channelbox = AceGUI:Create("Dropdown")


	channelbox:SetLabel(L["Channel"])
	channelbox:SetList( {} )


	for chan, kind in pairs(channellist) do

		channelbox:AddItem(chan, kind[1])
	end


	local origchan = Skada.db.profile.report.channel or "say"


	if not channellist[origchan] then origchan = "say" end


	channelbox:SetValue(origchan)
	channelbox:SetCallback("OnValueChanged",

			       function(f, e, value)

				       Skada.db.profile.report.channel = value
				       Skada.db.profile.report.chantype = channellist[value][2]

				       if channellist[origchan][3] ~= channellist[value][3] then

					       local pos = { frame:GetPoint() }
					       destroywindow()

					       Skada:CreateReportWindow(window)
					       Skada.ReportWindow:SetPoint(unpack(pos))
				       end
			       end
			      )


	frame:AddChild(channelbox)


	local lines = AceGUI:Create("Slider")


	lines:SetLabel(L["Lines"])
	lines:SetValue(Skada.db.profile.report.number ~= nil and Skada.db.profile.report.number	 or 10)
	lines:SetSliderValues(1, 25, 1)

	lines:SetCallback("OnValueChanged", function(self, event, value) Skada.db.profile.report.number = value end)
	lines:SetFullWidth(true)


	frame:AddChild(lines)


	if channellist[origchan][3] then

		local whisperbox = AceGUI:Create("EditBox")


		whisperbox:SetLabel(L["Whisper Target"])
		whisperbox:SetText(Skada.db.profile.report.target or "")
		whisperbox:SetCallback("OnEnterPressed",

				       function(box, event, text)

					       if strlenutf8(text) == #text then

						       local ntext = text:gsub("%s","")

						       if ntext ~= text then

							       text = ntext
							       whisperbox:SetText(text)
						       end
					       end

					       Skada.db.profile.report.target = text
					       frame.button.frame:Click()
				       end
				      )


		whisperbox:SetCallback("OnTextChanged", function(box, event, text) Skada.db.profile.report.target = text end)
		whisperbox:SetFullWidth(true)

		frame:AddChild(whisperbox)
	end



	local report = AceGUI:Create("Button")
	frame.button = report

	report:SetText(L["Report"])
	report:SetCallback("OnClick",

			   function()

				   local mode, set, channel, chantype, number = Skada.db.profile.report.mode, Skada.db.profile.report.set,
					 Skada.db.profile.report.channel, Skada.db.profile.report.chantype, Skada.db.profile.report.number

				   if channel == "whisper" then

					   channel = Skada.db.profile.report.target

					   if channel and #strtrim(channel) == 0 then channel = nil end
				   elseif channel == "bnet" then

					   channel = BNet_GetBNetIDAccount(Skada.db.profile.report.target)
				   elseif channel == "target" then

					   if UnitExists("target") then

						   local toon, realm = UnitName("target")

						   if realm and #realm > 0 then
							   channel = toon .. "-" .. realm
						   else
							   channel = toon
						   end
					   else

						   channel = nil
					   end
				   end


				   if channel and chantype and mode and set and number then

					   Skada:Report(channel, chantype, mode, set, number, window)
					   frame:Hide()
				   else

					   Skada:Print("Error: Whisper target not found")
				   end
			   end
			  )


	report:SetFullWidth(true)
	frame:AddChild(report)
end
