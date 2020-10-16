local myname, ns = ...

-- -------------------------------------------------------------------------------------------------------------------
local C             = ns.CONST;
local utils         = ns.utils;
local split         = utils.text.split;
local es            = utils.text.es;
local fmt           = string.format;
local CAT           = ns.cat.data;
local category_info = ns.utils.cat.info;
local via_category  = ns.utils.search.cat;
local via_search    = ns.utils.search.text;
local via_range     = ns.utils.search.range;
local hilite        = ns.utils.text.hilite_and_replace;
local links         = ns.utils.text.links_list;
local invite        = ns.utils.frame.invite;
local login_message = ns.utils.text.login_message;

-- -------------------------------------------------------------------------------------------------------------------
-- Processing commands for the custom filter
-- -------------------------------------------------------------------------------------------------------------------
local function filter_cmd(cmd, params)

  -- /wconquest show -- current filter ------------------------------------------------------------------------------------
  if cmd == "show" and ns.db.custom_filter
     then   print(fmt("%s Current custom filter: [%s] (%s match%s)", 
                      C.WCONQUEST, ns.db.custom_filter.rule, 
                      ns.db.custom_filter.count, es(ns.db.custom_filter.count))); 
            return;
     elseif cmd == "show" then print(fmt("%s No filter set.", C.WCONQUEST)); 
            return; 
     end;

  -- /wconquest set -- new filter -----------------------------------------------------------------------------------------
  if cmd == "set" 
     then local newfilter = via_search(params, true); 
          if newfilter -- get a new filter
             then print(fmt("%s Setting custom filter to: [%s] (%s match%s)", C.WCONQUEST, 
                        newfilter.rule, newfilter.count, es(newfilter.count)));
                  ns.db.custom_filter = newfilter;
                  -- if we don't have the filter turned on, the turn it on
                  if not ns.db.show_custom then ns.db.show_custom = true end; 
                  -- tell HandyNotes it's time to update
                  ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
                  return;
             else print(fmt("%s Custom filter not set.", C.WCONQUEST)); return;
             end;
     end;

  -- /wconquest clear -- clear the filter ---------------------------------------------------------------------------------
  if cmd == "clear" 
     then print(fmt("%s Filter cleared.", C.WCONQUEST));
          ns.db.custom_filter = nil;
          ns.last_filter      = nil;
          -- tell HandyNotes it's time to update
          ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
          return;
     end;

  -- /wconquest showlast -- show us the last search -----------------------------------------------------------------------
  if cmd == "showlast" and ns.last_filter
     then   print(fmt("%s Last search: [%s] (%s match%s)", 
                      C.WCONQUEST, ns.last_filter.rule, 
                      ns.last_filter.count, es(ns.last_filter.count))); return;
     elseif cmd == "showlast" 
     then   print(fmt("%s %sYou don't have a search to save.", C.WCONQUEST, C.COLOR.GRAY));       return;
     end;

  -- /wconquest setlast -- set the filter to the last search --------------------------------------------------------------
  if cmd == "setlast" and ns.last_filter 
     then print(fmt("%s %sSetting custom filter to:|r [%s] (%s match%s)",
                     C.WCONQUEST, C.COLOR.GRAY, ns.last_filter.rule,
                     ns.last_filter.count, es(ns.last_filter.count)));
          ns.db.custom_filter = ns.last_filter;
          -- if we don't have the filter turned on, the turn it on
          if not ns.db.show_custom then ns.db.show_custom = true end; 
          -- tell HandyNotes it's time to update
          ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
          return;
     elseif cmd == "setlast" then print(fmt("%s %sYou don't have a previous search to save.", C.WCONQUEST, C.COLOR.GRAY)); return
     end; -- if 

  -- /wconquest toggle -- turn the custom filter on or off ----------------------------------------------------------------
  if cmd == "toggle" then
     print(fmt("%s %sctivating|r %sthe custom filter.", C.WCONQUEST, ns.db.show_custom and "Dea" or "A", C.COLOR.GRAY));
     -- switch the setting
     ns.db.show_custom = not ns.db.show_custom;
     -- tell HandyNotes it's time to update
     ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", "")); return;
     end; -- if
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- There were older /wconquest[whatever] commands that are now obsolete
-- -------------------------------------------------------------------------------------------------------------------
local function obsolete(param)
    print(fmt("%s %sThe |r%s%s%s%s command is being phased out.",
               C.WCONQUEST, C.COLOR.GRAY, C.COLOR.APP, C.SLASH_WCONQUEST, param or "", C.COLOR.GRAY), 
          fmt("Please use |r%s%s %s|r%s from now on, thanks!",
               C.COLOR.YELLOW, C.SLASH_WCONQUEST, param or "", C.COLOR.GRAY));
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- The main /wconquest processor
-- -------------------------------------------------------------------------------------------------------------------
local function slashWconquest(a)
  local params = split(a, " "); -- split on words
  local cmd = params[1] or nil;
  local arg = params[2] or nil;

  if cmd then cmd = string.lower(cmd) end;
  if arg then arg = string.lower(arg) end;

  -- /wconquest help -- or just /wconquest -----------------------------------------------------------------------------------
  if not cmd or cmd == "help" then print(fmt("%s %s", C.WCONQUEST, hilite(C.HELP))) return end;

  -- preprocessing to add "s" as an option, e.g /wconquest bars ---------------------------------------------------------
  local cmds = cmd .. "s"; local cmdsflag = string.gsub(cmd, ":", "s:");

  -- /wconquest config -- open the HandyNotes configuration screen ------------------------------------------------------
  if cmd == "config" then LibStub("AceConfigDialog-3.0"):Open("HandyNotes", nil, "plugins") return; end;

  -- /wconquest version -- show use the login message -------------------------------------------------------------------
  if cmd == "version" then print(login_message()) return end;

  -- /wconquest inv[vite[s]] or /wconquest link[s] ---------------------------------------------------------------------------
  if cmd == "inv"  or cmd == "invite" or cmd == "invites" or 
     cmd == "link" or cmd == "links"
     then if arg == "wconquest"  or arg == "site"  then invite("WConquest");
      elseif arg == "discord"                    then invite("Discord");
      elseif arg == "github"                    then invite("GitHub");
      elseif arg == "addon"                      then invite("Site");
      else print(fmt("%s %s", C.WCONQUEST, hilite(links())))
      end;
      return;
     end;

  -- /wconquest cat[[egorie]s]] -- /wconquest list -- list the predef categories----------------------------------------------
  if cmd == "cat" or cmd == "cats" or cmd == "categories" or cmd == "list"
     then category_info(arg) return end;
       
  -- /wconquest nearby [range] -- spots within range --------------------------------------------------------------------
  if        cmd == "nearby" and arg then via_range(arg) return;
     elseif cmd == "nearby"         then via_range()    return;
     elseif cmd == "range"          then via_range()    return;
     elseif cmd == "range"  and arg then via_range(arg) return;
     end;

  -- /wconquest find -- /wconquest search -- just an alias for searching normally --------------------------------------------
  if cmd == "find" or cmd == "search" then table.remove(params, 1); via_search(params) return end;

  -- /wconquest coords -- our current location and zone -----------------------------------------------------------------
  if cmd == "coords" 
     then print(fmt("%s %sYou are currently at [|r%s%s|r%s] in zone [%s%s|r]", 
                    C.WCONQUEST, C.COLOR.GRAY, C.COLOR.YELLOW, utils.coords.get(), 
                    C.COLOR.GRAY, C.COLOR.YELLOW, utils.coords.zone())); return 
     end; -- if

  -- /wconquest [filter commands] -- show, set, setlast, clear, toggle, -------------------------------------------------
  if        cmd == "show"            then filter_cmd("show")  return
     elseif cmd == "set" and not arg then print(fmt("%s %sYou need to enter at least one criterion.", C.WCONQUEST, C.COLOR.GRAY)); return
     elseif cmd == "set"             then table.remove(params, 1); filter_cmd("set", params);                 return
     elseif cmd == "setlast"         then filter_cmd("setlast")                                               return
     elseif cmd == "save"            then filter_cmd("setlast")                                               return 
     elseif cmd == "savelast"        then filter_cmd("setlast")                                               return 
     elseif cmd == "last"            then filter_cmd("showlast")                                              return
     elseif cmd == "clear"           then filter_cmd("clear")                                                 return
     elseif cmd == "toggle" or cmd == "togg" or cmd == "tog" then filter_cmd("toggle")                        return
     end;

  -- /wconquest [category] -- check if there is a category search already -----------------------------------------------
  if        CAT[cmd]      and not arg then via_category(cmd)      return
     elseif CAT[cmds]     and not arg then via_category(cmds)     return
     elseif CAT[cmdsflag] and not arg then via_category(cmdsflag) return
     end; -- if

  -- /wconquest [number] -- assume it's a range -------------------------------------------------------------------------
  if        arg == C.RANGE.UNITS and tonumber(cmd) then via_range(tonumber(cmd)) return 
     elseif                          tonumber(cmd) then via_range(tonumber(cmd)) return
     end;

  -- /wconquest [text] -- if nothing matches then use the text search
  via_search(params);

end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- Register slash commands
-- -------------------------------------------------------------------------------------------------------------------
SLASH_WCONQUEST1        = C.SLASH_WCONQUEST;              SlashCmdList["WCONQUEST"]        = function(a) slashWconquest(a);       end;
-- -------------------------------------------------------------------------------------------------------------------

