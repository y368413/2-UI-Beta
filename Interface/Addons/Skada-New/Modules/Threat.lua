-- ==================================================================================================================== --
--															--
--	File			Threat.lua										--
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


local _, Skada = ...


-- ==========================
-- | outer function : start |
-- ==========================
Skada:AddLoadableModule("Threat", nil, function(Skada, L)


	if Skada.db.profile.modulesBlocked.Threat then return end


	local media = LibStub("LibSharedMedia-3.0")
	local mod   = Skada:NewModule(L["Threat"])


	local opts =
		{

		options =
			{

			type = "group",
			name = L["Threat"],

			args =
				{

				warnings =
					{

					type   = "group",
					name   = L["Threat warning"],
					inline = true,
					order  = 1,

					args   =
						{

						flash =
							{

							type  = "toggle",
							name  = L["Flash screen"],
							desc  = L["This will cause the screen to flash as a threat warning."],
							get   = function()
									return Skada.db.profile.modules.threatflash
								end,
							set   = function(self, val)
									Skada.db.profile.modules.threatflash = val
								end,
							order = 2,

							},

						shake =
							{

							type  = "toggle",
							name  = L["Shake screen"],
							desc  = L["This will cause the screen to shake as a threat warning."],
							get   = function()
									return Skada.db.profile.modules.threatshake
								end,
							set   = function(self, val)
									Skada.db.profile.modules.threatshake = not Skada.db.profile.modules.threatshake
								end,
							order = 3,

							},

					    playsound =
							{

							type  = "toggle",
							name  = L["Play sound"],
							desc  = L["This will play a sound as a threat warning."],
							get   = function()
									return Skada.db.profile.modules.threatsound
								end,
							set   = function(self, val)
									Skada.db.profile.modules.threatsound = not Skada.db.profile.modules.threatsound
								end,
							order = 4,

							},

						sound =
							{

					 		type  = 'select',
						dialogControl = 'LSM30_Sound',
							name  = L["Threat sound"],
							desc  = L["The sound that will be played when your threat percentage reaches a certain point."],
						       values = AceGUIWidgetLSMlists.sound,
							get   = function()
									return Skada.db.profile.modules.threatsoundname
								end,
							set   = function(self,val)
									Skada.db.profile.modules.threatsoundname = val
								end,
							order = 5,

							},

						sound =
							{

							type  = 'range',
							name  = L["Threat threshold"],
							desc  = L["When your threat reaches this level, relative to tank, warnings are shown."],
							min   = 0,
							max   = 130,
							step  = 1,
							get   = function()
									return Skada.db.profile.modules.threattreshold
								end,
							set   = function(self,val)
									Skada.db.profile.modules.threattreshold = val
								end,
							order = 6,

							},

				       notankwarnings =
							{

							type  = "toggle",
							name  = L["Do not warn while tanking"],
							get   = function()
									return Skada.db.profile.modules.notankwarnings
								end,
							set   = function()
									Skada.db.profile.modules.notankwarnings = not Skada.db.profile.modules.notankwarnings
								end,
							order = 2,

							},
						},
					},

			    rawthreat =
					{
		
					type  = "toggle",
					name  = L["Show raw threat"],
					desc  = L["Shows raw threat percentage relative to tank instead of modified for range."],
					get   = function() return Skada.db.profile.modules.threatraw end,
					set   = function() Skada.db.profile.modules.threatraw = not Skada.db.profile.modules.threatraw end,
					order = 2,

					},

		  	  focustarget =
					{

					type  = "toggle",
					name  = L["Use focus target"],
					desc  = L["Shows threat on focus target, or focus target's target, when available."],
					get   = function() return Skada.db.profile.modules.threatfocustarget end,
					set   = function() Skada.db.profile.modules.threatfocustarget = not Skada.db.profile.modules.threatfocustarget end,
					order = 2,

					},
				},
			}
		}




	function mod:OnInitialize()

		table.insert(Skada.options.plugins, opts)
	end




	function mod:OnEnable()

		mod.metadata = {showspots = 1, wipestale = 1, columns = {Threat = true, TPS = false, Percent = true}, icon = "Interface\\Icons\\Ability_warrior_challange"}

		Skada:AddFeed(L["Threat: Personal Threat"],

			      function()

				      if Skada.current and UnitExists("target") then

					      local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation("player", "target")

					      if threatpct then return ("%02.1f%%"):format(threatpct) end
				      end
			      end

			     )

		Skada:AddMode(self)
	end




	function mod:OnDisable()

		Skada:RemoveMode(self)
	end


	local maxthreat = 0
	local nr        = 1
	local max       = 0


	local function add_to_threattable(win, name, target)

		if name and UnitExists(name) then


			local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation(name, target)


			if Skada.db.profile.modules.threatraw then

				if threatvalue then

					local d         = win.dataset[nr] or {}
					win.dataset[nr] = d

					local _, class	= UnitClass(name)
					local role	= UnitGroupRolesAssigned(name)

					d.label		= name
					d.class		= class
					d.role		= role
					d.id		= name
					d.threat	= threatvalue
					d.isTanking	= isTanking

					if threatvalue < 0 then

						d.value  = threatvalue + 410065408
						d.threat = threatvalue + 410065408
					else

						d.value  = threatvalue
					end

					if threatvalue > maxthreat then	maxthreat = threatvalue	end
				end
			else

				if threatpct then

					local d         = win.dataset[nr] or {}
					win.dataset[nr] = d

					local _, class  = UnitClass(name)
					local role      = UnitGroupRolesAssigned(name)

					d.label		= name
					d.class		= class
					d.role		= role
					d.id		= name
					d.value		= threatpct
					d.isTanking	= isTanking
					d.threat	= threatvalue
				end
			end

			nr = nr + 1
		end
	end




	local function format_threatvalue(value)

		if value == nil then

			return "0"
		elseif value >= 100000 then

			return ("%2.1fk"):format(value / 100000)
		else

			return ("%d"):format(value / 100)
		end
	end




	-- =========================================================================================
	-- | TPS (Threat per second): measure of the threat generated by a person over one second. |
	-- =========================================================================================
	local function getTPS(threatvalue)

		if Skada.current then

			local totaltime = time() - Skada.current.starttime
			return format_threatvalue(threatvalue / math.max(1,totaltime))
		else

			return "0"
		end
	end


	local last_warn = time()


	function mod:Update(win, set)

		local target = nil


		if UnitExists("target") and not UnitIsFriend("player", "target") then

			target = "target"
		elseif Skada.db.profile.modules.threatfocustarget and UnitExists("focus") and not UnitIsFriend("player", "focus") then

			target = "focus"
		elseif Skada.db.profile.modules.threatfocustarget and UnitExists("focustarget") and not UnitIsFriend("player", "focustarget") then

			target = "focustarget"
		elseif UnitExists("target") and UnitIsFriend("player", "target") and UnitExists("targettarget") and not UnitIsFriend("player", "targettarget") then

			target = "targettarget"
		end


		if target then

			win.metadata.title = UnitName(target)
			nr                 = 1
			maxthreat          = 0


			local type, count  = Skada:GetGroupTypeAndCount()


			if count > 0 then

				for i = 1, count, 1 do

					local name = UnitName(("%s%d"):format(type, i))

					if name then

						add_to_threattable(win, name, target)
						local unit = ("%s%dpet"):format(type, i)

						if UnitExists(unit) then add_to_threattable(win, UnitName(unit), target) end
					end
				end
			end


			if type ~= "raid" then

				add_to_threattable(win, UnitName("player"), target)

				if UnitExists("pet") then add_to_threattable(win, UnitName("pet"), target) end
			end


			if not Skada.db.profile.modules.threatraw then maxthreat = 100 end


			win.metadata.maxvalue = maxthreat


			local we_should_warn  = false


			for i, data in ipairs(win.dataset) do

				if data.id then

					if data.threat and data.threat > 0 then

						local percent = data.value / math.max(0.000001, maxthreat) * 100

						if data.label == UnitName("player") then

							if Skada.db.profile.modules.threattreshold				    and
								Skada.db.profile.modules.threattreshold < percent		    and
								(not data.isTanking or not Skada.db.profile.modules.notankwarnings) then

								we_should_warn = true
							end
						end

						data.valuetext = Skada:FormatValueText(

							format_threatvalue(data.threat), self.metadata.columns.Threat,
							getTPS(data.threat), self.metadata.columns.TPS,
							string.format("%02.1f%%", percent), self.metadata.columns.Percent

										      )
					else

						data.id = nil
					end
				end
			end


			if we_should_warn and time() - last_warn > 2 then

				if Skada.db.profile.modules.threatflash then self:Flash() end
				if Skada.db.profile.modules.threatshake then self:Shake() end
				if Skada.db.profile.modules.threatsound then PlaySoundFile(media:Fetch("sound", Skada.db.profile.modules.threatsoundname)) end

				last_warn = time()
			end
		else

			win.metadata.title = self:GetName()
		end
	end




	function mod:Flash()

		if not self.FlashFrame then

			local flasher = CreateFrame("Frame", "SkadaThreatFlashFrame")

			flasher:SetToplevel(true)
			flasher:SetFrameStrata("FULLSCREEN_DIALOG")
			flasher:SetAllPoints(UIParent)

			flasher:EnableMouse(false)
			flasher:Hide()

			flasher.texture = flasher:CreateTexture(nil, "BACKGROUND")
			flasher.texture:SetTexture("Interface\\FullScreenTextures\\LowHealth")
			flasher.texture:SetAllPoints(UIParent)
			flasher.texture:SetBlendMode("ADD")

			flasher:SetScript("OnShow",

					  function(self)

						  self.elapsed = 0
						  self:SetAlpha(0)
					  end

					 )


			flasher:SetScript("OnUpdate",

					  function(self, elapsed)

						  elapsed = self.elapsed + elapsed

		 				  if elapsed < 2.6 then

							  local alpha = elapsed % 1.3

							  if alpha < 0.15 then

								  self:SetAlpha(alpha / 0.15)
							  elseif alpha < 0.9 then
		
								  self:SetAlpha(1 - (alpha - 0.15) / 0.6)
							  else
					
								  self:SetAlpha(0)
							  end
						  else

							  self:Hide()
						  end

						  self.elapsed = elapsed
					  end

					 )

			self.FlashFrame = flasher
		end

		self.FlashFrame:Show()
	end




	function mod:Shake()

		local shaker = self.ShakerFrame

		if not shaker then

			shaker = CreateFrame("Frame", "SkadaThreatShaker", UIParent)
			shaker:Hide()
			shaker:SetScript("OnUpdate",

					 function(self, elapsed)

						 elapsed    = self.elapsed + elapsed
						 local x, y = 0, 0


						 if elapsed >= 0.8 then

							 self:Hide()
						 else

					 		 x, y = random(-8, 8), random(-8, 8)
						 end


						 if WorldFrame:IsProtected() and InCombatLockdown() then


						 if not shaker.fail then shaker.fail = true end

							 self:Hide()
						 else

							 WorldFrame:ClearAllPoints()

							 for i = 1, #self.originalPoints do
				
								 local v = self.originalPoints[i]

								 WorldFrame:SetPoint(v[1], v[2], v[3], v[4] + x, v[5] + y)
						   	 end
						 end

						 self.elapsed = elapsed

					 end

					)


			shaker:SetScript("OnShow",

					 function(self)

						 if not self.originalPoints then self.originalPoints = {}

							 for i = 1, WorldFrame:GetNumPoints() do

								 tinsert(self.originalPoints, {WorldFrame:GetPoint(i)})
							 end
						 end

						 self.elapsed = 0
						 end

					)


			self.ShakerFrame = shaker
		end

		shaker:Show()
	end


end)
-- ========================
-- | outer function : end |
-- ========================