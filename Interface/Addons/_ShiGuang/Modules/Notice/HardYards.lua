-- Localisation Optimisation - Lua
----------------------------------
local gmatch = string.gmatch
local lower = string.lower
local match = string.match
local modf = math.modf
local sub = string.sub
local tonumber = tonumber
local tostring = tostring

-- Localisation Optimisation - API
----------------------------------
local CheckInteractDistance = CheckInteractDistance
local IsControlKeyDown = IsControlKeyDown
local IsItemInRange = IsItemInRange
local UnitCanAssist = UnitCanAssist
local UnitExists = UnitExists
local UnitIsUnit = UnitIsUnit

-- Preset Ranges
----------------
local hy_rangeItems = {

	35278,	-- 80:	Reinforced Net
	41265,	-- 70:	Eyesore Blaster
	32825,	-- 60:	Soul Cannon, 34111/34121 Trained Rock Falcon
	116139,	-- 50:	Haunting Memento
	23836,	-- 45:	Wrangling Rope
	44114,  -- 40:	Old Spices, 44228 Baby Spice, 90888 Foot Ball, 90883 The Pigskin, 28767 The Decapitator, 109167 Findle's Loot-A-Rang
	24501,	-- 35:	Gordawg's Boulder
	32960,	-- 30:	Elekk Dispersion Ray, 21713 Elune's Candle, 85231 Bag of Clams, 9328 Super Snapper FX, 7734 Six Demon Bag
	4,	-- 28:	Follow
	86567,	-- 25:	Yaungol Wind Chime, 13289 Egan's Blaster
	10645,	-- 20:	Gnomish Death Ray
	46722,	-- 15:	Grol'dom Net, 56184 Duarn's Net, 31129 Blackwhelp Net, 1251 Linen Bandage
	40551,	-- 10:	Gore Bladder, 34913 Highmesa's Cleansing Seeds, 21267 Toasting Goblet, 32321 Sparrowhawk Net
	33278,	-- 8:	Burning Torch, 2 Trading
	3,	-- 7:	Dueling
	63427,	-- 6:	Worgsaw
	37727,	-- 5:	Ruby Acorn, 36771 Sturdy Crates
}

local hy_rangeMax = { "80", "70", "60", "50", "45", "40", "35", "30", "28", "25", "20", "15", "10", "8", "7", "6", "5"}
local hy_rangeMin = { "70.1", "60.1", "50.1", "45.1", "40.1", "35.1", "30.1", "28.1", "25.1", "20.1", "15.1", "10.1", "8.1", "7.1", "6.1", "5.1", "0"}

local hy_rangeAlt = {
	["32825"] = 37887, 	-- 60: Seeds of Nature's Wrath
	["32698"] = 23836,	-- 45: Goblin Rocket Launcher
	["44114"] = 34471,	-- 40: Vial of the Sunwell
	["24501"] = 18904,	-- 35: Zorbin's Ultra-Shrinker
	["32960"] = 34191,	-- 30: Handful of Snowflakes
	["86567"] = 31463,	-- 25: Zezzak's Shard (F NPC/P)
	["10645"] = 21519,	-- 20: Mistletoe (F NPC/P)
	["46722"] = 33069,	-- 15: Sturdy Rope
	["40551"] = 42441,	-- 10: Bouldercrag's Bomb
	["33278"] = 34368,	-- 8:  Attuned Crystal Cores
}

-- Colour Scheme
----------------
local hy_colour_X11Chocolate		= "\124cFFD2691E"	-- HardYards chat line prefix
local hy_colour_X11SandyBrown		= "\124cFFF4A460"	-- Highlight and warning messages
local hy_colour_X11BurlyWood		= "\124cFFDEB887"	-- Plain text
local hy_colour_X11Brown		= "\124cFFA52A2A"	-- Error messages
local hy_colour_X11Peru			= "\124cFFCD853F"	-- Debug messages
local hy_colour_numbers			= hy_colour_X11SandyBrown
local hy_colour_arrows			= hy_colour_X11BurlyWood
local hy_colour_label			= hy_colour_X11Chocolate
-- Locals
---------
local hy_on = true
local hy_range = ""
--========================================================================================================================================--
local function round( num, places )		-- round to nearest integer, ties round away from zero
	local mult = 10 ^ ( places or 0 )
	return modf( num * mult + ( ( num < 0 and -1 ) or 1 ) * 0.5 ) / mult
end

local function printHY( message )
	DEFAULT_CHAT_FRAME:AddMessage( "\124cFFD2691E [菜单]|r距离显示: \124cFFDEB887".. message.. "\124r" )
end

local function HardYards_SetSize()
	HardYards.rangeText:SetTextHeight( ShiGuangPerDB.size )
	HardYards.rangeText:ClearAllPoints()
	HardYards.rangeText:SetPoint( "CENTER", ShiGuangPerDB.size/30, -( ShiGuangPerDB.size/10 ) )
end

local function SetLocalsFromDB( databaseEntity )

	if ( databaseEntity == "arrows" ) then
		hy_colour_arrows = "\124c".. format( "FF%02x%02x%02x",  ShiGuangPerDB.arrows.r * 255, ShiGuangPerDB.arrows.g * 255,
						ShiGuangPerDB.arrows.b * 255 )
	elseif ( databaseEntity == "numbers" ) then
		hy_colour_numbers = "\124c".. format( "FF%02x%02x%02x",  ShiGuangPerDB.numbers.r * 255, ShiGuangPerDB.numbers.g * 255,
						ShiGuangPerDB.numbers.b * 255 )
	elseif ( databaseEntity == "label" ) then
		hy_colour_label = "\124c".. format( "FF%02x%02x%02x",  ShiGuangPerDB.label.r * 255, ShiGuangPerDB.label.g * 255,
						ShiGuangPerDB.label.b * 255 )
	end
end

local function ColourPicker( databaseEntity )

	ColorPickerFrame.originalColours = { ShiGuangPerDB[ databaseEntity ].r, ShiGuangPerDB[ databaseEntity ].g,
						ShiGuangPerDB[ databaseEntity ].b }

	ColorPickerFrame.func = function()
		local rNew, gNew, bNew = ColorPickerFrame:GetColorRGB()
		ShiGuangPerDB[ databaseEntity ].r, ShiGuangPerDB[ databaseEntity ].g, ShiGuangPerDB[ databaseEntity ].b = rNew, gNew, bNew
		ShiGuangPerDB[ databaseEntity ].r = round( ShiGuangPerDB[ databaseEntity ].r, 3)
		ShiGuangPerDB[ databaseEntity ].g = round( ShiGuangPerDB[ databaseEntity ].g, 3)
		ShiGuangPerDB[ databaseEntity ].b = round( ShiGuangPerDB[ databaseEntity ].b, 3)
		SetLocalsFromDB( databaseEntity )
	end

	if ( ShiGuangPerDB[ databaseEntity ].r == 0 ) and ( ShiGuangPerDB[ databaseEntity ].g == 0 ) and
			( ShiGuangPerDB[ databaseEntity ].b == 0 ) then
		ColorPickerFrame:SetColorRGB( 0.004, 0.004, 0.004 )
	else
		ColorPickerFrame:SetColorRGB( ShiGuangPerDB[ databaseEntity ].r, ShiGuangPerDB[ databaseEntity ].g,
						ShiGuangPerDB[ databaseEntity ].b )
	end

	ColorPickerFrame.cancelFunc = function()
		ShiGuangPerDB[ databaseEntity ].r, ShiGuangPerDB[ databaseEntity ].g, ShiGuangPerDB[ databaseEntity ].b
				= unpack( ColorPickerFrame.originalColours )
		SetLocalsFromDB( databaseEntity )
	end

	ColorPickerFrame:Show()
end

local between, missed, furthest = "", 0, 0

local function DoTheHardYards( unitID )

	between, missed, furthest, result = hy_colour_arrows.. " - ".. hy_colour_numbers, 0, 0, false

	for i=1,#hy_rangeItems do
		result = false
		if hy_rangeItems[i] < 0 then
			if UnitCanAssist( "player", unitID ) then
				result = IsItemInRange( (-hy_rangeItems[i]), unitID )
			else
				result = nil
			end
		elseif hy_rangeItems[i] < 10 then
			result = CheckInteractDistance( unitID, hy_rangeItems[i] ) or 0
			if ( result == nil ) and ( hy_rangeItems[i] == 1 ) then
				result = CheckInteractDistance( unitID, 4 ) or 0
			end
		else
			result = IsItemInRange( hy_rangeItems[i], unitID )
			if result == nil then
				local v = tostring( hy_rangeItems[i] )
				if hy_rangeAlt[v] then
					result = IsItemInRange( hy_rangeAlt[v], unitID )
				end
			end
		end
		if result == true then
			furthest = i
			missed = 0
		elseif result == nil then
			missed = i
		else
			break
		end
	end
	
	if tonumber(hy_rangeMin[furthest]) then
		if tonumber(hy_rangeMin[furthest]) > 40 then
		hy_colour_numbers = "|cffff0000" 
		elseif tonumber(hy_rangeMin[furthest]) >30 and tonumber(hy_rangeMin[furthest]) <40 then
		hy_colour_numbers = "|c00ff6622"
		else
		hy_colour_numbers = "|c00ffff00"
		end
	end
	
	if furthest == #hy_rangeMax then
		hy_range = hy_colour_numbers.. ""
		hy_rangeClosest = tonumber(hy_rangeMin[furthest])
		hy_rangeFurthest = tonumber(hy_rangeMax[furthest])
	elseif furthest > 0 then
		if missed > 0 then
			hy_range = hy_colour_numbers.. hy_rangeMin[ missed ].. between.. hy_rangeMax[ furthest ]
			hy_rangeClosest = tonumber(hy_rangeMin[missed])
		else
			hy_range = hy_colour_numbers.. hy_rangeMin[ furthest ].. between.. hy_rangeMax[ furthest ]
			hy_rangeClosest = tonumber(hy_rangeMin[furthest])
		end
		hy_rangeFurthest = tonumber(hy_rangeMax[furthest])
	elseif missed > 0 then
		hy_range = hy_colour_numbers.. hy_rangeMin[ missed ].. between.. "80+"
		hy_rangeClosest = tonumber(hy_rangeMin[missed])
		hy_rangeFurthest = 100
	else
		hy_range = hy_colour_numbers.. "80+"
		hy_rangeClosest = 80.1
		hy_rangeFurthest = 100
	end
end

local function ShowTheHardYards()
	HardYards.rangeText:SetText( hy_range )
	HardYards.rangeText:SetTextColor( nil,nil,nil,1 )
	local width, height = HardYards.rangeText:GetWidth(), HardYards.rangeText:GetHeight()
	HardYards:SetSize( width*1.05, height*1.3 )
end

local function HardYards_OnUpdate()

	if not hy_on then return end

	if UnitExists( "target" ) then
		DoTheHardYards( "target" )
		ShowTheHardYards()
	else
		HardYards.rangeText:SetTextColor( nil,nil,nil,0 )
	end

end

local function PlayerLogin( self )

	hy_on = false

	if ( ShiGuangPerDB == nil )		then	ShiGuangPerDB 		=	{}	end
	if ( ShiGuangPerDB.show == nil )		then 	ShiGuangPerDB.show	=	true 	end
	if ( ShiGuangPerDB.arrows == nil )	then 	ShiGuangPerDB.arrows	=	{} 	end	-- X11BurlyWood DEB887
	if ( ShiGuangPerDB.arrows.r == nil )	then 	ShiGuangPerDB.arrows.r	=	0.87 	end
	if ( ShiGuangPerDB.arrows.g == nil )	then 	ShiGuangPerDB.arrows.g	=	0.72 	end
	if ( ShiGuangPerDB.arrows.b == nil )	then 	ShiGuangPerDB.arrows.b	=	0.53 	end
	if ( ShiGuangPerDB.numbers == nil )	then 	ShiGuangPerDB.numbers	=	{} 	end	-- X11SandyBrown F4A460
	if ( ShiGuangPerDB.numbers.r == nil )	then 	ShiGuangPerDB.numbers.r	=	0.96 	end
	if ( ShiGuangPerDB.numbers.g == nil )	then 	ShiGuangPerDB.numbers.g	=	0.64 	end
	if ( ShiGuangPerDB.numbers.b == nil )	then 	ShiGuangPerDB.numbers.b	=	0.38 	end
	if ( ShiGuangPerDB.label == nil )		then 	ShiGuangPerDB.label	=	{} 	end	-- X11Chocolate D2691E
	if ( ShiGuangPerDB.label.r == nil )	then 	ShiGuangPerDB.label.r	=	0.82 	end
	if ( ShiGuangPerDB.label.g == nil )	then 	ShiGuangPerDB.label.g	=	0.41 	end
	if ( ShiGuangPerDB.label.b == nil )	then 	ShiGuangPerDB.label.b	=	0.12 	end
	if ( ShiGuangPerDB.size == nil )		then 	ShiGuangPerDB.size	=	26 	end

	SetLocalsFromDB( "arrows" )
	SetLocalsFromDB( "numbers" )
	SetLocalsFromDB( "label" )

	HardYards:SetFrameStrata( "BACKGROUND" )
	HardYards:SetClampedToScreen( true )
	HardYards:EnableMouse( false )
	HardYards:SetMovable( true )
	HardYards:ClearAllPoints()
	if ShiGuangPerDB.x and ShiGuangPerDB.y then
		HardYards:SetPoint( "TOPLEFT", ShiGuangPerDB.x, -( UIParent:GetHeight() - ShiGuangPerDB.y ) )
	else
		HardYards:SetPoint( "CENTER", 0, -( UIParent:GetHeight() / 3 ) )
	end

	HardYards:SetScript( "OnMouseDown", function( self, button )
		if ( button == "LeftButton" ) and IsShiftKeyDown() then
			self:StartMoving()
		end
	end)
	HardYards:SetScript( "OnMouseUp", function( self )
		self:StopMovingOrSizing()
		ShiGuangPerDB.x = HardYards:GetLeft()
		ShiGuangPerDB.y = HardYards:GetTop()
	end)

	HardYards.rangeText = HardYards:CreateFontString( nil, "OVERLAY" )
	HardYards.rangeText:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 36, "THICKOUTLINE")  -- "Fonts\\FRIZQT__.TTF", 42, "THICKOUTLINE" 
	HardYards_SetSize()

	if ( ShiGuangPerDB.show == true ) then
		hy_on = true
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------

local function HardYards_OnEvent( self, event, parm1 )
	if not hy_on then return end
	if ( event == "PLAYER_LOGIN" ) then
		PlayerLogin( self )
	end
end
local HardYards = CreateFrame( "Frame", "HardYards", UIParent )
HardYards:RegisterEvent( "PLAYER_LOGIN" )
HardYards:SetScript( "OnEvent", HardYards_OnEvent )
HardYards:SetScript( "OnUpdate", HardYards_OnUpdate )

--------------------------------------------------------------------------------------------------------------------------------------------
SLASH_HardYards1, SLASH_HardYards2, SLASH_HardYards3, SLASH_HardYards4 = "/hardyards", "/hard", "/yards", "/hy"
--------------------------------------------------------------------------------------------------------------------------------------------
local function Slash( options )

	local firstParm, firstParm3, secondParm, secondParm3, thirdParm, thirdParm3, fourthParm, fourthParm3

	for v in gmatch( options, "%S+" ) do
		v = lower( v )
		if not firstParm3 then
			firstParm = v
			firstParm3 = sub( v,1,3 )
		elseif not secondParm3 then
			secondParm = v
			secondParm3 = sub( v,1,3 )
		elseif not thirdParm3 then
			thirdParm = v
			thirdParm3 = sub( v,1,3 )
		else
			fourthParm = v
			fourthParm3 = sub( v,1,3 )
			break
		end
	end

	if ( firstParm3 == "?" ) or ( firstParm3 == nil ) then
		print("|cffCCCC88[菜单]|r距离显示 设置命令行:\n"..
		  hy_colour_X11SandyBrown.. "/hy arr\124r = 设置“ <-> ”的颜色\n"..
			hy_colour_X11SandyBrown.. "size n\124r = 设置大小(0-100). 栗子: '/hy siz 43'\n"..
			hy_colour_X11SandyBrown.."show / hide\124r  = 开关距离显示\n")
	elseif ( firstParm3 == "arr" ) then
		if ( secondParm3 == "def" ) then
			ShiGuangPerDB.arrows.r, ShiGuangPerDB.arrows.g, ShiGuangPerDB.arrows.b = 0.87, 0.72, 0.53
			SetLocalsFromDB( "arrows" )
		else
			ColourPicker( "arrows" )
		end
	elseif ( firstParm3 == "siz" ) then
		local size = tonumber( secondParm3 ) or 0
		if ( size >= 5 ) and ( size <= 100 ) then
			ShiGuangPerDB.size = size
			HardYards_SetSize()
		else
			printHY( hy_colour_X11SandyBrown.. "<错误>: ".. hy_colour_X11BurlyWood.. "设置数值必须是0-100之间任意数值" )
		end
	elseif ( firstParm3 == "hid" ) then
		hy_on = false
		ShiGuangPerDB.show = false
		HardYards:Hide()
		HardYards:SetScript('OnUpdate', nil)
	elseif ( firstParm3 == "sho" ) then
		hy_on = true
		ShiGuangPerDB.show = true
		HardYards:Show()
	end
end
SlashCmdList[ "HardYards" ] = function( options ) Slash( options ) end