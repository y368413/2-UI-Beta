if select(2, UnitClass("player")) ~= "DEMONHUNTER" then return end

local DemonHunter = MaxDps:NewModule('DemonHunter');

function MaxDps:EnableRotationModule(mode)
	MaxDps:Print(MaxDps.Colors.Info .. 'DemonHunter [Havoc, Vengeance]');
	if mode == 1 then
		MaxDps.NextSpell = DemonHunter.Havoc;
	elseif mode == 2 then
		MaxDps.NextSpell = DemonHunter.Vengeance;
	end;
 return true;
end

-- Demon Hunter Havoc reworked by Ryzux
function DemonHunter.Havoc(_, timeShift, currentSpell, gcd, talents)

end

-- Demon Hunter Vengeance by Ryzux
function DemonHunter.Vengeance(_, timeShift, currentSpell, gcd, talents)

end
