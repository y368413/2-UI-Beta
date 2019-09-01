if select(2, UnitClass("player")) ~= "DRUID" then return end

local _, MaxDps_DruidTable = ...;

--- @type MaxDps
if not MaxDps then return end

local Druid = MaxDps_DruidTable.Druid;

local GR = {
	Mangle               = 33917,
	MangleProc           = 93622,
	ThrashGuard          = 77758,
	Ironfur              = 192081,
	FrenziedRegeneration = 22842,
	MarkOfUrsol          = 192083,
	RageOfTheSleeper     = 200851,
	GalacticGuardian     = 203964,
	GalacticGuardianBuff = 213708,
};


function Druid:Guardian()
	return nil;
end