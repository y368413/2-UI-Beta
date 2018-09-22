if select(2, UnitClass("player")) ~= "ROGUE" then return end

local Rogue = MaxDps:NewModule('Rogue');

function MaxDps:EnableRotationModule(mode)
	MaxDps:Print(MaxDps.Colors.Info .. 'Rogue [Assassination, Outlaw, Subtlety]');
	if mode == 1 then
		MaxDps.NextSpell = Rogue.Assassination;
	elseif mode == 2 then
		MaxDps.NextSpell = Rogue.Outlaw;
	elseif mode == 3 then
		MaxDps.NextSpell = Rogue.Subtlety;
	end;
 return true;
end

function Rogue.Assassination(_, timeShift, currentSpell, gcd, talents)
end

function Rogue.Outlaw(_, timeShift, currentSpell, gcd, talents)
end

function Rogue.Subtlety(_, timeShift, currentSpell, gcd, talents)
end
