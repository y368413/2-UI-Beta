-- Author      : MrExillion
-- Create Date : 3/19/2021 7:52:09 PM
--[[********************************************************************************************************************************************************
****															STABLESCOLLECTION Multi-TAB																****
**********************************************************************************************************************************************************]]

-- WHAT IF you could do classes like this?:
--[[

--PSEUDOPRAGMA
iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"] = {};
local this = iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"];
function Constructor(...)
local this = ...;
this["self"] = self;
this["Method"] = {};

iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"]["Deonstructor"] = function() Deconstructor(this) end;

end
iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"]["Constructor"] = function() Constructor(this) end;
function Deconstructor(...) iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"] = ... end

--PSEUDOPRAGMAEND








require(iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"]["Constructor"]);

this["Method"]["OnLoad"] = function(self) OnLoad(self)end
function OnLoad(...)
local this = ...;




end





require(iStableMasterDB["CLASS"]["StablesCollectionMulti-TAB"]["Deonstructor"]);

]]





__scanning_tooltip = nil;

function npc_name(id)
  local tooltip = __scanning_tooltip;
  if (tooltip == nil) then
    tooltip = CreateFrame( "GameTooltip", "MyScannerTT", UIParent, "GameTooltipTemplate" );
    local tooltipMethods = getmetatable(tooltip).__index;
     tooltip = setmetatable( tooltip, 
     { __index = function(self, id)
         local method = tooltipMethods[id] ; -- See if this key is a tooltip method
         if method then return method end -- If it is, return the method now
            
          -- Otherwise look up a unit
         self:SetOwner(UIParent, "ANCHOR_NONE");
         self:SetHyperlink(string.format("unit:0xF53%05X00000000", id));
         return _G[self:GetName().."TextLeft1"]:GetText();
        end
     } 
    );
    __scanning_tooltip = tooltip;
  end
  return tooltip[id];
end

--- REAL CODE STARTS HERE:



--iStableMasterDB["StablesCollectionMultiTab"] = {};



function StablesCollectionSetSubTab(self,tab)

	local tab = tab;
	PanelTemplates_SetTab(self,tab);
	if(tab == 1) then 
	StablesLeftFrame:Show();
	StablesRightFrame:Show();
	CardContainerFrame:Show();
	ButtonWrapper:Show();
	OpenPresetsButton:Show();
		if(StablesCollection.presetFrameIsOpen) then
			StablesCollectionPresetsFrame:Show();
		end
	else
	StablesLeftFrame:Hide();
	StablesRightFrame:Hide();
	CardContainerFrame:Hide();
	ButtonWrapper:Hide();
	OpenPresetsButton:Hide();
	StablesCollectionPresetsFrame:Hide();
	end


end


