--## Author: Vampyr78  ## Version: 1.2
local PortalMage = LibStub("AceAddon-3.0"):NewAddon("PortalMage")

portalMageSpells = {["stormwind"] = true,
					["orgrimmar"] = true,
					["ironforge"] = true,
					["undercity"] = true,
					["darnassus"] = true,
					["thunderbluff"] = true,
					["exodar"] = true,
					["silvermoon"] = true,
					["theramore"] = true,
					["stonard"] = true,
					["dalaran"] = true,
					["shattrath"] = true,
					["northrend"] = true,
					["tolbarad"] = true,
					["pandaria"] = true,
					["stormshield"] = true,
					["warspear"] = true,
					["brokenisles"] = true,
					["boralus"] = true,
					["dazaralor"] = true}

PortalMage.portals = {["stormwind"] = "Portal: Stormwind",
					  ["orgrimmar"] = "Portal: Orgrimmar",
					  ["ironforge"] = "Portal: Ironforge",
					  ["undercity"] = "Portal: Undercity",
					  ["darnassus"] = "Portal: Darnassus",
					  ["thunderbluff"] = "Portal: Thunder Bluff",
					  ["exodar"] = "Portal: Exodar",
					  ["silvermoon"] = "Portal: Silvermoon",
					  ["theramore"] = "Portal: Theramore",
					  ["stonard"] = "Portal: Stonard",
					  ["dalaran"] = "Ancient Portal: Dalaran",
					  ["shattrath"] = "Portal: Shattrath",
					  ["northrend"] = "Portal: Dalaran - Northrend",
					  ["tolbarad"] = "Portal: Tol Barad",
					  ["pandaria"] = "Portal: Vale of Eternal Blossoms",
					  ["stormshield"] = "Portal: Stormshield",
					  ["warspear"] = "Portal: Warspear",
					  ["brokenisles"] = "Portal: Dalaran - Broken Isles",
					  ["boralus"] = "Portal: Boralus",
					  ["dazaralor"] = "Portal: Dazar'alor"}

PortalMage.teleports = {["stormwind"] = "Teleport: Stormwind",
						["orgrimmar"] = "Teleport: Orgrimmar",
						["ironforge"] = "Teleport: Ironforge",
						["undercity"] = "Teleport: Undercity",
						["darnassus"] = "Teleport: Darnassus",
						["thunderbluff"] = "Teleport: Thunder Bluff",
						["exodar"] = "Teleport: Exodar",
						["silvermoon"] = "Teleport: Silvermoon",
						["theramore"] = "Teleport: Theramore",
						["stonard"] = "Teleport: Stonard",
						["dalaran"] = "Ancient Teleport: Dalaran",
						["shattrath"] = "Teleport: Shattrath",
						["northrend"] = "Teleport: Dalaran - Northrend",
						["tolbarad"] = "Teleport: Tol Barad",
						["pandaria"] = "Teleport: Vale of Eternal Blossoms",
						["stormshield"] = "Teleport: Stormshield",
						["warspear"] = "Teleport: Warspear",
						["brokenisles"] = "Teleport: Dalaran - Broken Isles",
					    ["boralus"] = "Teleport: Boralus",
					    ["dazaralor"] = "Teleport: Dazar'alor"}

PortalMage.icons = {["stormwind"] = "Interface/ICONS/Spell_Arcane_TeleportStormwind",
					["orgrimmar"] = "Interface/ICONS/Spell_Arcane_TeleportOrgrimmar",
					["ironforge"] = "Interface/ICONS/Spell_Arcane_TeleportIronforge",
					["undercity"] = "Interface/ICONS/Spell_Arcane_TeleportUndercity",
					["darnassus"] = "Interface/ICONS/Spell_Arcane_TeleportDarnassus",
					["thunderbluff"] = "Interface/ICONS/Spell_Arcane_TeleportThunderBluff",
					["exodar"] = "Interface/ICONS/Spell_Arcane_TeleportExodar",
					["silvermoon"] = "Interface/ICONS/Spell_Arcane_TeleportSilvermoon",
					["theramore"] = "Interface/ICONS/Spell_Arcane_TeleportTheramore",
					["stonard"] = "Interface/ICONS/Spell_Arcane_TeleportStonard",
					["dalaran"] = "Interface/ICONS/Spell_Arcane_TeleportDalaranCrater",
					["shattrath"] = "Interface/ICONS/Spell_Arcane_TeleportShattrath",
					["northrend"] = "Interface/ICONS/Spell_Arcane_TeleportDalaran",
					["tolbarad"] = "Interface/ICONS/Spell_Arcane_TeleportTolBarad",
					["pandaria"] = "Interface/ICONS/Spell_Arcane_ValeOfBlossoms",
					["stormshield"] = "Interface/ICONS/Spell_Arcane_TeleportStormshield",
					["warspear"] = "Interface/ICONS/Spell_Arcane_TeleportWarspear",
					["brokenisles"] = "Interface/ICONS/Spell_Arcane_TeleportDalaranBrokenIsles",
					["boralus"] = "Interface/ICONS/Spell_Arcane_PortalKulTiras",
					["dazaralor"] = "Interface/ICONS/Spell_Arcane_PortalZandalar"}

function PortalMage:OnInitialize()
	self.faction = UnitFactionGroup("player")
	if select(2, UnitClass("player")) == "MAGE" then
		self.frame = CreateFrame("FRAME", nil, UIParent)
		if not ShiGuangPerDB.portalMageFrameX then ShiGuangPerDB.portalMageFrameX = 960 end
		if not ShiGuangPerDB.portalMageFrameY then ShiGuangPerDB.portalMageFrameY = 120 end
		self:SetupFrame(self.frame)
		if self.faction == "Alliance" then
			local options = {
				name = PORTALMAGETITLE,
				handler = PortalMage,
				type = "group",
				args = {
					stormwind = {
						name = "Stormwind",
						type = "toggle",
						desc = "toggles portal and teleport to Stormwind",
						set = "Set",
						get = "Get"
					},
					ironforge = {
						name = "Ironforge",
						type = "toggle",
						desc = "toggles portal and teleport to Ironforge",
						set = "Set",
						get = "Get"
					},
					darnassus = {
						name = "Darnassus",
						type = "toggle",
						desc = "toggles portal and teleport to Darnassus",
						set = "Set",
						get = "Get"
					},
					exodar = {
						name = "Exodar",
						type = "toggle",
						desc = "toggles portal and teleport to Exodar",
						set = "Set",
						get = "Get"
					},
					theramore = {
						name = "Theramore",
						type = "toggle",
						desc = "toggles portal and teleport to Theramore",
						set = "Set",
						get = "Get"
					},
					dalaran = {
						name = "Dalaran Crater",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran Crater",
						set = "Set",
						get = "Get"
					},
					shattrath = {
						name = "Shattrath",
						type = "toggle",
						desc = "toggles portal and teleport to Shattrath",
						set = "Set",
						get = "Get"
					},
					northrend = {
						name = "Dalaran on Northrend",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran on Northrend",
						set = "Set",
						get = "Get"
					},
					tolbarad = {
						name = "Tol Barad",
						type = "toggle",
						desc = "toggles portal and teleport to Tol Barad",
						set = "Set",
						get = "Get"
					},
					pandaria = {
						name = "Vale of Eternal Blossoms",
						type = "toggle",
						desc = "toggles portal and teleport to Vale of Eternal Blossoms",
						set = "Set",
						get = "Get"
					},
					stormshield = {
						name = "Stormshield",
						type = "toggle",
						desc = "toggles portal and teleport to Stormshield",
						set = "Set",
						get = "Get"
					},
					brokenisles = {
						name = "Dalaran on Broken Isles",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran on Broken Isles",
						set = "Set",
						get = "Get"
					},
					boralus = {
						name = "Boralus",
						type = "toggle",
						desc = "toggles portal and teleport to Boralus",
						set = "Set",
						get = "Get"
					}
				}
			}
			LibStub("AceConfig-3.0"):RegisterOptionsTable("PortalMage", options, nil)
			LibStub("AceConfigDialog-3.0"):AddToBlizOptions("PortalMage", PORTALMAGETITLE)
		else
			local options = {
				name = PORTALMAGETITLE,
				handler = PortalMage,
				type = "group",
				args = {
					orgrimmar = {
						name = "Orgrimmar",
						type = "toggle",
						desc = "toggles portal and teleport to Orgrimmar",
						set = "Set",
						get = "Get"
					},
					undercity = {
						name = "Undercity",
						type = "toggle",
						desc = "toggles portal and teleport to Undercity",
						set = "Set",
						get = "Get"
					},
					thunderbluff = {
						name = "Thunder Bluff",
						type = "toggle",
						desc = "toggles portal and teleport to Thunder Bluff",
						set = "Set",
						get = "Get"
					},
					silvermoon = {
						name = "Silvermoon",
						type = "toggle",
						desc = "toggles portal and teleport to Silvermoon",
						set = "Set",
						get = "Get"
					},
					stonard = {
						name = "Stonard",
						type = "toggle",
						desc = "toggles portal and teleport to Stonard",
						set = "Set",
						get = "Get"
					},
					dalaran = {
						name = "Dalaran Crater",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran Crater",
						set = "Set",
						get = "Get"
					},
					shattrath = {
						name = "Shattrath",
						type = "toggle",
						desc = "toggles portal and teleport to Shattrath",
						set = "Set",
						get = "Get"
					},
					northrend = {
						name = "Dalaran on Northrend",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran on Northrend",
						set = "Set",
						get = "Get"
					},
					tolbarad = {
						name = "Tol Barad",
						type = "toggle",
						desc = "toggles portal and teleport to Tol Barad",
						set = "Set",
						get = "Get"
					},
					pandaria = {
						name = "Vale of Eternal Blossoms",
						type = "toggle",
						desc = "toggles portal and teleport to Vale of Eternal Blossoms",
						set = "Set",
						get = "Get"
					},
					warspear = {
						name = "Warspear",
						type = "toggle",
						desc = "toggles portal and teleport to Warspear",
						set = "Set",
						get = "Get"
					},
					brokenisles = {
						name = "Dalaran on Broken Isles",
						type = "toggle",
						desc = "toggles portal and teleport to Dalaran on Broken Isles",
						set = "Set",
						get = "Get"
					},
					dazaralor = {
						name = "Dazar'alor",
						type = "toggle",
						desc = "toggles portal and teleport to Dazar'alor",
						set = "Set",
						get = "Get"
					}
				}
			}
			LibStub("AceConfig-3.0"):RegisterOptionsTable("PortalMage", options, nil)
			LibStub("AceConfigDialog-3.0"):AddToBlizOptions("PortalMage", PORTALMAGETITLE)
		end
	end
end

function PortalMage:Set(info, val)
	portalMageSpells[info[#info]] = val
	self:SetupButtons(self.frame)
end

function PortalMage:Get(info)
	return portalMageSpells[info[#info]]
end

function PortalMage.frameOnEvent(self, event, spell)
  if not MaoRUISettingDB["Auras"]["PortalMage"] then return end
	if event == "PLAYER_LOGIN" then
		self:SetHeight(30)
		PortalMage:SetupButtons(self)
	elseif event == "LEARNED_SPELL_IN_TAB" and PortalMage:NewSpell(spell) then
		self:SetHeight(30)
		PortalMage:SetupButtons(self)
	end
end

function PortalMage.frameOnDragStart(self)
	if IsShiftKeyDown() then
		self:StartMoving()
	end
end

function PortalMage.frameOnDragStop(self)
	self:StopMovingOrSizing()
	ShiGuangPerDB.portalMageFrameX = self:GetLeft()
	ShiGuangPerDB.portalMageFrameY = self:GetBottom()
end

function PortalMage:NewSpell(id)
	if self:SpellOnList(id) then
		for i = 91,96,1 do
			_, spell = GetActionInfo(i)
			if spell == id then
				return false
			end
		end
		for i = 115,120,1 do
			_, spell = GetActionInfo(i)
			if spell == id then
				return false
			end
		end
		return true
	end
	return false
end

function PortalMage:SpellOnList(id)
	local name = GetSpellInfo(id)
	for k, v in pairs(self.portals) do
		if name == v then 
			return true
		end
	end
	return false
end

function PortalMage:SetupFrame(frame)
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)
	frame:SetPoint("BOTTOMLEFT", ShiGuangPerDB.portalMageFrameX, ShiGuangPerDB.portalMageFrameY)
	frame:SetFrameStrata("LOW")
	frame:RegisterForDrag("LeftButton")
	frame:RegisterEvent("PLAYER_LOGIN")
	frame:RegisterEvent("LEARNED_SPELL_IN_TAB")
	frame:SetScript("OnEvent", PortalMage.frameOnEvent)
	frame:SetScript("OnDragStart", PortalMage.frameOnDragStart)
	frame:SetScript("OnDragStop", PortalMage.frameOnDragStop)
end

function PortalMage:SetupButtons(frame)
	self:ClearButtons()
	local length = 10
	if self.faction == "Alliance" then
		if portalMageSpells["stormwind"] then
			self.button1, length = self:SetupButton("PortalMageButton1", self.button1, length, "stormwind", 108, frame)
		end
		if portalMageSpells["ironforge"] then
			self.button2, length = self:SetupButton("PortalMageButton2", self.button2, length, "ironforge", 109, frame)
		end
		if portalMageSpells["darnassus"] then
			self.button3, length = self:SetupButton("PortalMageButton3", self.button3, length, "darnassus", 110, frame)
		end
		if portalMageSpells["exodar"] then
			self.button4, length = self:SetupButton("PortalMageButton4", self.button4, length, "exodar", 111, frame)
		end
		if portalMageSpells["theramore"] then
			self.button5, length = self:SetupButton("PortalMageButton5", self.button5, length, "theramore", 112, frame)
		end
		if portalMageSpells["dalaran"] then
			self.button6, length = self:SetupButton("PortalMageButton6", self.button6, length, "dalaran", 113, frame)
		end
		if portalMageSpells["shattrath"] then
			self.button7, length = self:SetupButton("PortalMageButton7", self.button7, length, "shattrath", 114, frame)
		end
		if portalMageSpells["northrend"] then
			self.button8, length = self:SetupButton("PortalMageButton8", self.button8, length, "northrend", 115, frame)
		end
		if portalMageSpells["tolbarad"] then
			self.button9, length = self:SetupButton("PortalMageButton9", self.button9, length, "tolbarad", 116, frame)
		end
		if portalMageSpells["pandaria"] then
			self.button10, length = self:SetupButton("PortalMageButton10", self.button10, length, "pandaria", 117, frame)
		end
		if portalMageSpells["stormshield"] then
			self.button11, length = self:SetupButton("PortalMageButton11", self.button11, length, "stormshield", 118, frame)
		end
		if portalMageSpells["brokenisles"] then
			self.button12, length = self:SetupButton("PortalMageButton12", self.button12, length, "brokenisles", 119, frame)
		end
		if portalMageSpells["boralus"] then
			self.button13, length = self:SetupButton("PortalMageButton13", self.button13, length, "boralus", 120, frame)
		end
	else
		if portalMageSpells["orgrimmar"] then
			self.button1, length = self:SetupButton("PortalMageButton1", self.button1, length, "orgrimmar", 108, frame)
		end
		if portalMageSpells["undercity"] then
			self.button2, length = self:SetupButton("PortalMageButton2", self.button2, length, "undercity", 109, frame)
		end
		if portalMageSpells["thunderbluff"] then
			self.button3, length = self:SetupButton("PortalMageButton3", self.button3, length, "thunderbluff", 110, frame)
		end
		if portalMageSpells["silvermoon"] then
			self.button4, length = self:SetupButton("PortalMageButton4", self.button4, length, "silvermoon", 111, frame)
		end
		if portalMageSpells["stonard"] then
			self.button5, length = self:SetupButton("PortalMageButton5", self.button5, length, "stonard", 112, frame)
		end
		if portalMageSpells["dalaran"] then
			self.button6, length = self:SetupButton("PortalMageButton6", self.button6, length, "dalaran", 113, frame)
		end
		if portalMageSpells["shattrath"] then
			self.button7, length = self:SetupButton("PortalMageButton7", self.button7, length, "shattrath", 114, frame)
		end
		if portalMageSpells["northrend"] then
			self.button8, length = self:SetupButton("PortalMageButton8", self.button8, length, "northrend", 115, frame)
		end
		if portalMageSpells["tolbarad"] then
			self.button9, length = self:SetupButton("PortalMageButton9", self.button9, length, "tolbarad", 116, frame)
		end
		if portalMageSpells["pandaria"] then
			self.button10, length = self:SetupButton("PortalMageButton10", self.button10, length, "pandaria", 117, frame)
		end
		if portalMageSpells["warspear"] then
			self.button11, length = self:SetupButton("PortalMageButton11", self.button11, length, "warspear", 118, frame)
		end
		if portalMageSpells["brokenisles"] then
			self.button12, length = self:SetupButton("PortalMageButton12", self.button12, length, "brokenisles", 119, frame)
		end
		if portalMageSpells["dazaralor"] then
			self.button13, length = self:SetupButton("PortalMageButton13", self.button13, length, "dazaralor", 120, frame)
		end
	end
	frame:SetWidth(length + 10)
	collectgarbage("collect")
end

function PortalMage.buttonOnUpdate(self)
	if self == PortalMage.button1 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["stormwind"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["orgrimmar"])
		end
	end
	if self == PortalMage.button2 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["ironforge"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["undercity"])
		end
	end
	if self == PortalMage.button3 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["darnassus"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["thunderbluff"])
		end
	end
	if self == PortalMage.button4 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["exodar"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["silvermoon"])
		end
	end
	if self == PortalMage.button5 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["theramore"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["stonard"])
		end
	end
	if self == PortalMage.button6 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["dalaran"])
	end
	if self == PortalMage.button7 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["shattrath"])
	end
	if self == PortalMage.button8 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["northrend"])
	end
	if self == PortalMage.button9 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["tolbarad"])
	end
	if self == PortalMage.button10 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["pandaria"])
	end
	if self == PortalMage.button11 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["stormshield"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["warspear"])
		end
	end
	if self == PortalMage.button12 then
		_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["brokenisles"])
	end
	if self == PortalMage.button13 then
		if PortalMage.faction == "Alliance" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["boralus"])
		elseif PortalMage.faction == "Horde" then
			_G[self:GetName().."Icon"]:SetTexture(PortalMage.icons["dazaralor"])
		end
	end
	_G[self:GetName().."Icon"]:Show()
end

function PortalMage:SetupButton(name, button, x, index, id, frame)
	if button == nil then
		button = CreateFrame("CHECKBUTTON", name, frame, "SecureActionButtonTemplate, ActionBarButtonTemplate")
	end
	button:Show()
	button:SetWidth(30)
	button:SetHeight(30)
	button:SetPoint("BOTTOMLEFT", x, 0)
	button:SetFrameStrata("MEDIUM")
	button:SetAttribute("showgrid", 0)
	button:SetAttribute("action", id)
	button:SetAttribute("type", "spell")
	PickupSpellBookItem(self.portals[index])
	PlaceAction(id)
	ClearCursor()
	button:SetAttribute("spell1", self.portals[index])
	button:SetAttribute("spell2", self.teleports[index])
	button:SetScript("OnUpdate", self.buttonOnUpdate)
	return button, x + 32
end

function PortalMage:ClearButtons()
	self:ClearButton(self.button1, 108)
	self:ClearButton(self.button2, 109)
	self:ClearButton(self.button3, 110)
	self:ClearButton(self.button4, 111)
	self:ClearButton(self.button5, 112)
	self:ClearButton(self.button6, 113)
	self:ClearButton(self.button7, 114)
	self:ClearButton(self.button8, 115)
	self:ClearButton(self.button9, 116)
	self:ClearButton(self.button10, 117)
	self:ClearButton(self.button11, 118)
	self:ClearButton(self.button12, 119)
	self:ClearButton(self.button13, 120)
end

function PortalMage:ClearButton(button, id)
	if button ~= nil then
		button:Hide()
		button:SetAttribute("showgrid", 0)
		button:SetAttribute("action", id)
		button:SetAttribute("type", "spell")
		PickupAction(id)
		ClearCursor()
	end
end