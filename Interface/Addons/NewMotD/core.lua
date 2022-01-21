local addonName, newmotd = ...
local addon = LibStub("AceAddon-3.0"):NewAddon(newmotd, addonName, "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceBucket-3.0", "AceComm-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ADBO = LibStub("AceDBOptions-3.0")
local LDBO = LibStub("LibDataBroker-1.1"):NewDataObject(addonName)
local LDI = LibStub("LibDBIcon-1.0")
local C = LibStub("LibCrayon-3.0")
local DF = LibStub("LibDeformat-3.0")
local T = LibStub("LibQTip-1.0")

newmotd._DEBUG = false
newmotd._classic = _G.WOW_PROJECT_ID and (_G.WOW_PROJECT_ID == _G.WOW_PROJECT_CLASSIC) or false
newmotd._bcc = _G.WOW_PROJECT_ID and (_G.WOW_PROJECT_ID == _G.WOW_PROJECT_BURNING_CRUSADE_CLASSIC) or false
newmotd._playerName = GetUnitName("player")
newmotd._playerFullName = newmotd._playerName

local special_frames = {}
local label = string.format("|cff33ff99%s|r",addonName)
local out_chat = string.format("%s: %%s",addonName)
local color_pl = ChatTypeInfo["PARTY_LEADER"]
local color_g = ChatTypeInfo["GUILD"]
local color_o = ChatTypeInfo["OFFICER"]

local GetGuildTabardFileNames = _G.GetGuildTabardFileNames or _G.GetGuildTabardFiles
local defaults = {
  profile = {
    lastmotd = "",
    history = {},
  },
  char = {
    delay = 3,
    timeout = 15,
    notincombat = true,
    alpha = 0.9,
    onlynew = true,
    minimap = {
      hide = true,
    },
  },
}
local admincmd, membercmd =
{type = "group", handler = newmotd, args = {
    show = {
      type = "execute",
      name = _G.SHOW,
      func = function()
        newmotd._guildLogo:Show()
      end,
      order = 1,
    },
    set = {
      type = "execute",
      name = _G.EDIT,
      func = function()
        StaticPopup_Show("SET_GUILDMOTD")
      end,
      order = 2,
    },
    options = {
      type = "execute",
      name = _G.OPTIONS,
      func = function()
        newmotd:showOptions()
      end,
      order = 3,
    },
  }
},
{type = "group", handler = newmotd, args = {
    show = {
      type = "execute",
      name = _G.SHOW,
      func = function()
        newmotd._guildLogo:Show()
      end,
      order = 1,
    },
    options = {
      type = "execute",
      name = _G.OPTIONS,
      func = function()
        newmotd:showOptions()
      end,
      order = 2,
    },
  }
}
newmotd.cmdtable = function()
  if (newmotd:admin()) then
    return admincmd
  else
    return membercmd
  end
end

function newmotd:options()
  if not (self._options) then
    self._options = 
    {
      type = "group",
      handler = newmotd,
      args = {
        general = {
          type = "group",
          name = _G.OPTIONS,
          childGroups = "tab",
          args = {
            help = {
              type = "group",
              name = _G.HELP_LABEL,
              order = 1,
              args = { },
            },
            settings = {
              type = "group",
              name = _G.SETTINGS,
              order = 2,
              args = { },
            }
          }
        }
      }
    }
    self._options.args.general.args.help.args["title"] = {
      type = "header",
      name = _G.DESCRIPTION,
      order = 5,
    }
    self._options.args.general.args.help.args["usage"] = {
      type = "description",
      name = L.USAGE,
      order = 10,
    }
    self._options.args.general.args.settings.args["onlynew"] = {
      type = "toggle",
      name = L["Only new GuildMOTD"],
      desc = L["Show GuildMOTD popup only if it has changed."],
      order = 20,
      get = function() return not not newmotd.db.char.onlynew end,
      set = function(info, val)
        newmotd.db.char.onlynew = not newmotd.db.char.onlynew
      end,
    }
    self._options.args.general.args.settings.args["notincombat"] = {
      type = "toggle",
      name = L["Not in-combat"],
      desc = L["Defer GuildMOTD popup to combat end."],
      order = 30,
      get = function() return not not newmotd.db.char.notincombat end,
      set = function(info, val)
        newmotd.db.char.notincombat = not newmotd.db.char.notincombat
      end,
    }
    self._options.args.general.args.settings.args["timeout"] = {
      type = "range",
      name = L["Auto-Hide"],
      desc = L["How long in seconds before the GuildMOTD popup auto-hides."],
      order = 40,
      get = function() return newmotd.db.char.timeout end,
      set = function(info, val)
        newmotd.db.char.timeout = val
      end,
      min = 5,
      max = 30,
      step = 5,
      bigStep = 5,
    }
    self._options.args.general.args.settings.args["delay"] = {
      type = "range",
      name = L["Set Delay"],
      desc = L["How long in seconds the GuildMOTD popup will delay."],
      order = 50,
      get = function() return newmotd.db.char.delay end,
      set = function(info, val)
        newmotd.db.char.delay = val
      end,
      min = 0,
      max = 30,
      step = 1,
      bigStep = 5,
    }
    self._options.args.general.args.settings.args["alpha"] = {
      type = "range",
      name = L["Set Transparency"],
      desc = L["Set GuildMOTD popup artwork transparency."],
      order = 55,
      get = function() return newmotd.db.char.alpha end,
      set = function(info, val)
        newmotd.db.char.alpha = val
        if newmotd._guildLogo then
          newmotd._guildLogo:SetAlpha(tonumber(newmotd.db.char.alpha))
        end
      end,
      min = 0.0,
      max = 1.0,
      step = 0.1,
      bigStep = 0.1,
    }
    self._options.args.general.args.settings.args["minimap"] = {
      type = "toggle",
      name = L["Hide from Minimap"],
      desc = L["Hide addon Minimap Button."],
      order = 60,
      get = function() return newmotd.db.char.minimap.hide end,
      set = function(info, val)
        newmotd.db.char.minimap.hide = val
        if newmotd.db.char.minimap.hide then
          LDI:Hide(addonName)
        else
          LDI:Show(addonName)
        end
      end
    }
  end
  return self._options
end

function newmotd.OnLDBClick(obj,button)
  if not IsInGuild() then return end
  if newmotd:admin() and button == "RightButton" then
    StaticPopup_Show("SET_GUILDMOTD")
  else
    if button == "MiddleButton" then
      newmotd:showOptions()
    else
      newmotd:Alert(nil, true)
    end
  end
end

function newmotd.OnLDBTooltipShow(tooltip)
  tooltip = tooltip or GameTooltip
  if not IsInGuild() then
    tooltip:SetText(_G.ERR_GUILD_PLAYER_NOT_IN_GUILD, color_g.r, color_g.g, color_g.b)
  else
    tooltip:SetText(newmotd._guildName, color_pl.r, color_pl.g, color_pl.b)
    tooltip:AddLine(CURRENT_GUILD_MOTD, color_g.r, color_g.g, color_g.b, true)
    tooltip:AddLine(" ")
    tooltip:AddLine(L["|cffff7f00Click|r to show GuildMOTD."])
    if newmotd:admin() then
      tooltip:AddLine(L["|cffff7f00Right Click|r to change GuildMOTD."])
    end
    tooltip:AddLine(L["|cffff7f00Middle Click|r to open Options."])
  end
end

function newmotd:OnInitialize() -- 1. ADDON_LOADED
  self._versionString = GetAddOnMetadata(addonName,"Version")
  self._websiteString = GetAddOnMetadata(addonName,"X-Website")
  self._labelfull = string.format("%s %s",label,self._versionString)
  self.db = LibStub("AceDB-3.0"):New("NewMotDDB", defaults)

  self:options()
  self._options.args.profile = ADBO:GetOptionsTable(self.db)
  self._options.args.profile.guiHidden = true
  self._options.args.profile.cmdHidden = true

  AC:RegisterOptionsTable(addonName.."_cmd", self.cmdtable, {"newmotd"})
  AC:RegisterOptionsTable(addonName, self._options)

  self.blizzoptions = ACD:AddToBlizOptions(addonName,nil,nil,"general")
  self.blizzoptions.profile = ACD:AddToBlizOptions(addonName, "Profiles", addonName, "profile")
  self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")

  self.db.RegisterCallback(self, "OnProfileCopied", "RefreshConfig")
  self.db.RegisterCallback(self, "OnProfileReset", "RefreshConfig")
  LDBO.type = "launcher"
  LDBO.text = label
  LDBO.label = label -- string.format("%s %s",addonName,self._versionString)
  LDBO.icon = "Interface\\Buttons\\UI-GuildButton-MOTD-Up" -- UI-GuildButton-MOTD-Disabled
  LDBO.OnClick = newmotd.OnLDBClick
  LDBO.OnTooltipShow = newmotd.OnLDBTooltipShow
  LDI:Register(addonName, LDBO, newmotd.db.char.minimap)
end

function newmotd:OnEnable() -- 2. PLAYER_LOGIN
  self._playerFullName = string.format("%s-%s", UnitFullName("player"))
  if IsInGuild() then
    local guildname = GetGuildInfo("player")
    if not guildname then
      GuildRoster()
    end
    self._bucketGuildRoster = self:RegisterBucketEvent("GUILD_ROSTER_UPDATE",3.0)
    LDBO.icon = "Interface\\Buttons\\UI-GuildButton-MOTD-Up"
  else
    newmotd:RegisterEvent("PLAYER_GUILD_UPDATE")
    -- TODO: Refactor parts that shouldn't be reliant on guild to initialize properly without a guild
    newmotd:ScheduleTimer("deferredInit",5)
    LDBO.icon = "Interface\\Buttons\\UI-GuildButton-MOTD-Disabled"
  end
end

function newmotd:OnDisable() -- ADHOC

end

function newmotd:RefreshConfig()

end

function newmotd:deferredInit(guildname)
  if self._initdone then return end
  local realmname = GetRealmName()
  if not realmname then return end
  local panelHeader = _G.OPTIONS
  if guildname then
    self._guildName = guildname
    local color = CreateColor(color_pl.r, color_pl.g, color_pl.b)
    local colored_guildname = "<"..color:WrapTextInColorCode(self._guildName)..">"
    self._guildmotdLabel = string.gsub(_G.GUILD_MOTD_LABEL2, _G.GUILD, colored_guildname)
    self:RegisterEvent("GUILD_MOTD")
    self:guildBranding()
    self:Alert()

    local profilekey = guildname.." - "..realmname
    self._options.name = self._labelfull
    self._options.args.general.name = panelHeader
    self.db:SetProfile(profilekey)
    -- version check
    self:parseVersion(newmotd._versionString)
    local major_ver = self._version.major
    self._initdone = true
  else
    local profilekey = realmname
    local profilekey = realmname
    self._options.name = self._labelfull
    self._options.args.general.name = panelHeader
    self.db:SetProfile(profilekey)
    self._initdone = true
  end
end

function newmotd:showOptions()
    InterfaceOptionsFrame_OpenToCategory(newmotd.blizzoptions)
    C_Timer.After(1,function()
      newmotd:ScrollToCategory(addonName,1)
      C_Timer.After(1,function()
        InterfaceOptionsFrame_OpenToCategory(newmotd.blizzoptions)
      end)
    end)
end

function newmotd:updateTabard(logo)
  local tabardBackgroundUpper, tabardBackgroundLower, tabardEmblemUpper, tabardEmblemLower, tabardBorderUpper, tabardBorderLower = GetGuildTabardFileNames()
  if ( not tabardEmblemUpper ) then
    tabardBackgroundUpper = 180159
    tabardBackgroundLower = 180158
  end
  logo.bgUL:SetTexture(tabardBackgroundUpper)
  logo.bgUR:SetTexture(tabardBackgroundUpper)
  logo.bgBL:SetTexture(tabardBackgroundLower)
  logo.bgBR:SetTexture(tabardBackgroundLower)

  logo.emUL:SetTexture(tabardEmblemUpper)
  logo.emUR:SetTexture(tabardEmblemUpper)
  logo.emBL:SetTexture(tabardEmblemLower)
  logo.emBR:SetTexture(tabardEmblemLower)

  logo.bdUL:SetTexture(tabardBorderUpper)
  logo.bdUR:SetTexture(tabardBorderUpper)
  logo.bdBL:SetTexture(tabardBorderLower)
  logo.bdBR:SetTexture(tabardBorderLower)
end

function newmotd:guildBranding()
  local f = CreateFrame("Frame", nil, UIParent)
  f:SetWidth(64)
  f:SetHeight(64)
  f:SetPoint("TOP",UIParent,"TOP",0,-75)

  f.border = f:CreateTexture(nil, "BORDER")
  f.border:SetWidth(105)
  f.border:SetHeight(64)
  f.border:SetPoint("CENTER",f,"CENTER",5,-2)
  f.border:SetTexture("Interface\\GUILDFRAME\\GuildExtra") --  Interface\\CHARACTERFRAME\\TotemBorder / Interface\\COMMON\\GoldRing
  f.border:SetTexCoord(0.58,0.8,0.03,0.58)

  f.info = f:CreateTexture(nil, "BACKGROUND")
  f.info:SetWidth(500)
  f.info:SetHeight(125)
  f.info:SetPoint("TOP",f,"BOTTOM",0,15)
  f.info:SetTexture("Interface\\GUILDFRAME\\GuildExtra")
  f.info:SetTexCoord(0,0.564,0,0.925)
  f.info.guildname = f:CreateFontString(nil,"ARTWORK","GameFontNormalLargeOutline")
  f.info.guildname:SetWidth(480)
  f.info.guildname:SetHeight(25)
  f.info.guildname:SetPoint("TOP",f,"TOP",0,-60)
  f.info.guildname:SetJustifyH("CENTER")
  f.info.guildname:SetTextColor(0.8, 0.8, 1.0)
  f.info.guildname:SetIgnoreParentAlpha(true)
  f.info.guildname:SetText(newmotd._guildmotdLabel)
  f.info.guildmotd = f:CreateFontString(nil,"ARTWORK","GameFontNormal")
  f.info.guildmotd:SetWidth(460)
  f.info.guildmotd:SetHeight(80)
  f.info.guildmotd:SetPoint("TOP",f.info.guildname,"BOTTOM",0,-2)
  f.info.guildmotd:SetJustifyH("CENTER")
  f.info.guildmotd:SetJustifyV("CENTER")
  f.info.guildmotd:SetWordWrap(true)
  f.info.guildmotd:SetMaxLines(4)
  f.info.guildmotd:SetSpacing(4)
  f.info.guildmotd:SetTextColor(color_g.r,color_g.g,color_g.b,1)
  f.info.guildmotd:SetShadowColor(color_o.r, color_o.g, color_o.b)
  f.info.guildmotd:SetShadowOffset(1,-1)
  f.info.guildmotd:SetIgnoreParentAlpha(true)
  f.info.guildmotd:SetText(CURRENT_GUILD_MOTD)

  f.bgUL = f:CreateTexture(nil, "BACKGROUND")
  f.bgUL:SetWidth(32)
  f.bgUL:SetHeight(32)
  f.bgUL:SetPoint("TOPLEFT",f,"TOPLEFT",0,0)
  f.bgUL:SetTexCoord(0.5,1,0,1)
  f.bgUR = f:CreateTexture(nil, "BACKGROUND")
  f.bgUR:SetWidth(32)
  f.bgUR:SetHeight(32)
  f.bgUR:SetPoint("LEFT", f.bgUL, "RIGHT", 0, 0)
  f.bgUR:SetTexCoord(1,0.5,0,1)
  f.bgBL = f:CreateTexture(nil, "BACKGROUND")
  f.bgBL:SetWidth(32)
  f.bgBL:SetHeight(32)
  f.bgBL:SetPoint("TOP", f.bgUL, "BOTTOM", 0, 0)
  f.bgBL:SetTexCoord(0.5,1,0,1)
  f.bgBR = f:CreateTexture(nil, "BACKGROUND")
  f.bgBR:SetWidth(32)
  f.bgBR:SetHeight(32)
  f.bgBR:SetPoint("LEFT", f.bgBL, "RIGHT", 0,0)
  f.bgBR:SetTexCoord(1,0.5,0,1)

  f.bdUL = f:CreateTexture(nil, "BORDER")
  f.bdUL:SetWidth(32)
  f.bdUL:SetHeight(32)
  f.bdUL:SetPoint("TOPLEFT", f.bgUL, "TOPLEFT", 0,0)
  f.bdUL:SetTexCoord(0.5,1,0,1)
  f.bdUR = f:CreateTexture(nil, "BORDER")
  f.bdUR:SetWidth(32)
  f.bdUR:SetHeight(32)
  f.bdUR:SetPoint("LEFT", f.bdUL, "RIGHT", 0,0)
  f.bdUR:SetTexCoord(1,0.5,0,1)
  f.bdBL = f:CreateTexture(nil, "BORDER")
  f.bdBL:SetWidth(32)
  f.bdBL:SetHeight(32)
  f.bdBL:SetPoint("TOP", f.bdUL, "BOTTOM", 0,0)
  f.bdBL:SetTexCoord(0.5,1,0,1)
  f.bdBR = f:CreateTexture(nil, "BORDER")
  f.bdBR:SetWidth(32)
  f.bdBR:SetHeight(32)
  f.bdBR:SetPoint("LEFT", f.bdBL, "RIGHT", 0,0)
  f.bdBR:SetTexCoord(1,0.5,0,1)

  f.emUL = f:CreateTexture(nil, "BORDER")
  f.emUL:SetWidth(32)
  f.emUL:SetHeight(32)
  f.emUL:SetPoint("TOPLEFT", f.bgUL, "TOPLEFT", 0,0)
  f.emUL:SetTexCoord(0.5,1,0,1)
  f.emUR = f:CreateTexture(nil, "BORDER")
  f.emUR:SetWidth(32)
  f.emUR:SetHeight(32)
  f.emUR:SetPoint("LEFT", f.bdUL, "RIGHT", 0,0)
  f.emUR:SetTexCoord(1,0.5,0,1)
  f.emBL = f:CreateTexture(nil, "BORDER")
  f.emBL:SetWidth(32)
  f.emBL:SetHeight(32)
  f.emBL:SetPoint("TOP", f.emUL, "BOTTOM", 0,0)
  f.emBL:SetTexCoord(0.5,1,0,1)
  f.emBR = f:CreateTexture(nil, "BORDER")
  f.emBR:SetWidth(32)
  f.emBR:SetHeight(32)
  f.emBR:SetPoint("LEFT", f.emBL, "RIGHT", 0,0)
  f.emBR:SetTexCoord(1,0.5,0,1)

  self:updateTabard(f)
  self:RegisterEvent("GUILDTABARD_UPDATE")

  f.mask = f:CreateMaskTexture()
  f.mask:SetTexture("Interface\\Masks\\CircleMaskScalable") -- Interface\\Masks\\CircleMaskScalable / Interface\\Minimap\\UI-Minimap-Background
  f.mask:SetSize(55,55)
  f.mask:SetPoint("CENTER", f, "CENTER", 0,0)
  f.bgUL:AddMaskTexture(f.mask)
  f.bgUR:AddMaskTexture(f.mask)
  f.bgBL:AddMaskTexture(f.mask)
  f.bgBR:AddMaskTexture(f.mask)
  f.bdUL:AddMaskTexture(f.mask)
  f.bdUR:AddMaskTexture(f.mask)
  f.bdBL:AddMaskTexture(f.mask)
  f.bdBR:AddMaskTexture(f.mask)
  f:Hide()
  f._elapsed = 0
  f._timeout = 0
  f:HookScript("OnUpdate",function(self,elapsed)
    self._elapsed = self._elapsed + elapsed
    self._timeout = self._timeout + elapsed
    if self._elapsed > TOOLTIP_UPDATE_TIME then
      if self:IsMouseOver() then
        self._timeout = 0
        self._elapsed = 0
        self:Hide()
      end
      if self._timeout >= newmotd.db.char.timeout then
        self._timeout = 0
        self._elapsed = 0
        self:Hide()
      end
    end
  end)

  self._guildLogo = f
end

function newmotd:debugPrint(msg,onlyWhenDebug)
  if onlyWhenDebug and not self._DEBUG then return end
  if not self._debugchat then
    for i=1,NUM_CHAT_WINDOWS do
      local tab = _G["ChatFrame"..i.."Tab"]
      local cf = _G["ChatFrame"..i]
      local tabName = tab:GetText()
      if tab ~= nil and (tabName:lower() == "debug") then
        self._debugchat = cf
        ChatFrame_RemoveAllMessageGroups(self._debugchat)
        ChatFrame_RemoveAllChannels(self._debugchat)
        self._debugchat:SetMaxLines(1024)
        break
      end
    end
  end
  if self._debugchat then
    self:Print(self._debugchat,msg)
  else
    self:Print(msg)
  end
end

function newmotd:parseVersion(version,otherVersion)
  if not newmotd._version then newmotd._version = {} end
  for major,minor,patch in string.gmatch(version,"(%d+)[^%d]?(%d*)[^%d]?(%d*)") do
    newmotd._version.major = tonumber(major)
    newmotd._version.minor = tonumber(minor)
    newmotd._version.patch = tonumber(patch)
  end
  if (otherVersion) then
    if not newmotd._otherversion then newmotd._otherversion = {} end
    for major,minor,patch in string.gmatch(otherVersion,"(%d+)[^%d]?(%d*)[^%d]?(%d*)") do
      newmotd._otherversion.major = tonumber(major)
      newmotd._otherversion.minor = tonumber(minor)
      newmotd._otherversion.patch = tonumber(patch)
    end
    if (newmotd._otherversion.major ~= nil and newmotd._version.major ~= nil) then
      if (newmotd._otherversion.major < newmotd._version.major) then -- we are newer
        return
      elseif (newmotd._otherversion.major > newmotd._version.major) then -- they are newer
        return true, "major"
      else -- tied on major, go minor
        if (newmotd._otherversion.minor ~= nil and newmotd._version.minor ~= nil) then
          if (newmotd._otherversion.minor < newmotd._version.minor) then -- we are newer
            return
          elseif (newmotd._otherversion.minor > newmotd._version.minor) then -- they are newer
            return true, "minor"
          else -- tied on minor, go patch
            if (newmotd._otherversion.patch ~= nil and newmotd._version.patch ~= nil) then
              if (newmotd._otherversion.patch < newmotd._version.patch) then -- we are newer
                return
              elseif (newmotd._otherversion.patch > newmotd._version.patch) then -- they are newwer
                return true, "patch"
              end
            elseif (newmotd._otherversion.patch ~= nil and newmotd._version.patch == nil) then -- they are newer
              return true, "patch"
            end
          end
        elseif (newmotd._otherversion.minor ~= nil and newmotd._version.minor == nil) then -- they are newer
          return true, "minor"
        end
      end
    end
  end
end

function newmotd:make_escable(object,operation)
  if type(object) == "string" then
    local found
    for i,f in ipairs(UISpecialFrames) do
      if f==object then
        found = i
      end
    end
    if not found and operation=="add" then
      table.insert(UISpecialFrames,object)
    elseif found and operation=="remove" then
      table.remove(UISpecialFrames,found)
    end
  elseif type(object) == "table" then
    if object.Hide then
      local key = tostring(object):gsub("table: ","")
      if operation == "add" then
        special_frames[key] = object
      else
        special_frames[key] = nil
      end
    end
  end
end

function newmotd:admin()
  return IsInGuild() and (CanEditMOTD())
end

function newmotd:addHistory(entry)
  local over = #(newmotd.db.profile.history)-105+1
  if over > 0 then
    for i=1,over do
      table.remove(newmotd.db.profile.history,1)
    end
  end
  table.insert(newmotd.db.profile.history,entry)
end

function newmotd:alertTimer(motd)
  self:Alert(motd,true)
end

function newmotd:Alert(motd, now)
  local not_incombat = self.db.char.notincombat
  if not_incombat and UnitAffectingCombat("player") then
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    return
  end
  if now then
    self._guildLogo:SetAlpha(tonumber(newmotd.db.char.alpha))
    self._guildLogo:Show()
    return
  end
  local only_new = self.db.char.onlynew
  local delay = self.db.char.delay
  local lastmotd = self.db.profile.lastmotd
  motd = motd or CURRENT_GUILD_MOTD
  if lastmotd ~= motd then
    local epoch, timestamp = self:getServerTime("%Y-%m-%d")
    self.db.profile.lastmotd = motd
    self:addHistory({timestamp, motd})
  end
  if only_new and lastmotd == motd then return end
  if delay > 0 then
    if self._alertTimer then
      self:CancelTimer(self._alertTimer)
    end
    self._alertTimer = self:ScheduleTimer("alertTimer", delay, motd)
    return
  else
    self:Alert(motd,true)
  end
end

function newmotd:PLAYER_REGEN_ENABLED()
  self:UnregisterEvent("PLAYER_REGEN_ENABLED")
  self:Alert(nil,true)
end

function newmotd:PLAYER_GUILD_UPDATE(event, ...)
  local unitid = ...
  if unitid and UnitIsUnit(unitid,"player") then
    if IsInGuild() then
      self._initdone = false
      self:OnEnable()
    end
  end
end

function newmotd:GUILD_MOTD(event, ...)
  local motd = ...
  self._guildLogo.info.guildmotd:SetText(motd)
  self:Alert(motd)
end

function newmotd:GUILD_ROSTER_UPDATE()
  if GuildFrame and GuildFrame:IsShown() or InCombatLockdown() then
    return
  end
  local guildname = GetGuildInfo("player")
  if guildname then
    self:deferredInit(guildname)
  end
end

function newmotd:GUILDTABARD_UPDATE()
  self:updateTabard(self._guildLogo)
end

-------------------------------------------
--// UTILITY
-------------------------------------------
function newmotd:num_round(i)
  return math.floor(i+0.5)
end

function newmotd:table_count(t)
  local count = 0
  if type(t) == "table" then
    for k,v in pairs(t) do
      count = count+1
    end
  end
  return count
end

function newmotd:Capitalize(word)
  return (string.gsub(word,"^[%c%s]*([^%c%s%p%d])([^%c%s%p%d]*)",function(head,tail)
    return string.format("%s%s",string.upper(head),string.lower(tail))
    end))
end

function newmotd:ScrollToCategory(panelName,offset)
    local idx = 0
    offset = offset or 0
    InterfaceOptionsFrameAddOnsListScrollBar:SetValue(0)
    for i,cat in ipairs(INTERFACEOPTIONS_ADDONCATEGORIES) do
        if not cat.hidden then
            idx = idx + 1
            if cat.name == panelName then
                break
            end
        end
    end
    local numbuttons = #(InterfaceOptionsFrameAddOns.buttons)
    if idx and numbuttons and idx > numbuttons then
        local btnHeight = InterfaceOptionsFrameAddOns.buttons[1]:GetHeight()
        InterfaceOptionsFrameAddOnsListScrollBar:SetValue((offset+idx-numbuttons)*btnHeight)
    end
end

function newmotd:getServerTime(date_fmt, time_fmt, epoch)
  local epoch = epoch or GetServerTime()
  local date_fmt = date_fmt or "%b-%d" -- Mon-dd, alt example: "%Y-%m-%d" > YYYY-MM-DD
  local time_fmt = time_fmt or "%H:%M:%S" -- HH:mm:SS
  local d = date(date_fmt,epoch)
  local t = date(time_fmt,epoch)
  local timestamp = string.format("%s %s",d,t)
  return tostring(epoch), timestamp
end

_G[addonName] = newmotd

