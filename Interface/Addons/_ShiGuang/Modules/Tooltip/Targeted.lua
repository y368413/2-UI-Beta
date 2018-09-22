local _, ns = ...
local M, R, U, I = unpack(ns)

local targetTable = {}
local function ScanTargets(unit)
	if not IsInGroup() then return end

	wipe(targetTable)
	for i = 1, GetNumGroupMembers() do
		local member = (IsInRaid() and "raid"..i or "party"..i)
		if UnitIsUnit(unit, member.."target") and not UnitIsUnit("player", member) and not UnitIsDeadOrGhost(member) then
			local color = M.HexRGB(M.UnitColor(member))
			local name = color..UnitName(member).."|r"
			tinsert(targetTable, name)
		end
	end

	if #targetTable > 0 then
		GameTooltip:AddLine("Targeted By"..I.InfoColor.."("..#targetTable..")|r "..table.concat(targetTable, ", "), nil, nil, nil, 1)
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", function()
	if not MaoRUISettingDB["Tooltip"]["TargetBy"] then return end
	local _, unit = GameTooltip:GetUnit()
	if UnitExists(unit) then ScanTargets(unit) end
end)