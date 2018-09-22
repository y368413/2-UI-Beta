local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:RegisterModule("Auras")

local groups = I.ReminderBuffs[I.MyClass]
local iconSize = R.Auras.IconSize + 4
local frames, parentFrame = {}

function module:OnLogin()
	-- Elements
	if I.MyClass == "DEATHKNIGHT" then
		self:BloodyHell()
	elseif I.MyClass == "HUNTER" then
		self:HunterTool()
	elseif I.MyClass == "MONK" then
		self:Stagger()
		self:MonkStatue()
	elseif I.MyClass == "SHAMAN" then
		self:Totems()
	end
	self:InitReminder()
	self:Energy()
	self:ClassRecoure()
end

local function UpdateReminder(cfg)
	local frame = cfg.frame
	local depend = cfg.depend
	local spec = cfg.spec
	local combat = cfg.combat
	local instance = cfg.instance
	local pvp = cfg.pvp
	local isPlayerSpell, isRightSpec, isInCombat, isInInst, isInPVP = true, true
	local inInst, instType = IsInInstance()

	if depend and not IsPlayerSpell(depend) then isPlayerSpell = false end
	if spec and spec ~= GetSpecialization() then isRightSpec = false end
	if combat and InCombatLockdown() then isInCombat = true end
	if instance and inInst and (instType == "scenario" or instType == "party" or instType == "raid") then isInInst = true end
	if pvp and (instType == "arena" or instType == "pvp" or GetZonePVPInfo() == "combat") then isInPVP = true end
	if not combat and not instance and not pvp then isInCombat, isInInst, isInPVP = true, true, true end

	frame:Hide()
	if isPlayerSpell and isRightSpec and (isInCombat or isInInst or isInPVP) and not UnitInVehicle("player") then
		for i = 1, 32 do
			local name, _, _, _, _, _, _, _, _, spellID = UnitBuff("player", i)
			if name and cfg.spells[spellID] then
				frame:Hide()
				return
			end
		end
		frame:Show()
	end
end

local function AddReminder(cfg)
	local frame = CreateFrame("Frame", nil, parentFrame)
	frame:SetSize(iconSize, iconSize)
	M.CreateIF(frame)
	for spell in pairs(cfg.spells) do
		frame.Icon:SetTexture(GetSpellTexture(spell))
		break
	end
	frame.text = M.CreateFS(frame, 14, ADDON_MISSING, false, "TOP", 1, 15)
	frame:Hide()
	cfg.frame = frame

	tinsert(frames, frame)
end

local function UpdateAnchor()
	local index = 0
	local offset = iconSize + 5
	for _, frame in next, frames do
		if frame:IsShown() then
			frame:SetPoint("LEFT", offset * index, 0)
			index = index + 1
		end
	end
	parentFrame:SetWidth(offset * index)
end

local function UpdateEvent()
	for _, cfg in pairs(groups) do
		if not cfg.frame then AddReminder(cfg) end
		UpdateReminder(cfg)
	end
	UpdateAnchor()
end

function module:InitReminder()
	if not groups then return end
	if not MaoRUISettingDB["Auras"]["Reminder"] then return end

	parentFrame = CreateFrame("Frame", nil, UIParent)
	parentFrame:SetPoint("CENTER", -220, 130)
	parentFrame:SetSize(iconSize, iconSize)

	M:RegisterEvent("UNIT_AURA", UpdateEvent, "player")
	M:RegisterEvent("PLAYER_ENTERING_WORLD", UpdateEvent)
	M:RegisterEvent("PLAYER_REGEN_ENABLED", UpdateEvent)
	M:RegisterEvent("PLAYER_REGEN_DISABLED", UpdateEvent)
	M:RegisterEvent("ZONE_CHANGED_NEW_AREA", UpdateEvent)
	M:RegisterEvent("UNIT_ENTERED_VEHICLE", UpdateEvent)
	M:RegisterEvent("UNIT_EXITED_VEHICLE", UpdateEvent)
end