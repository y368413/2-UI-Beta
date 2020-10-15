local myname, ns = ...

if not ns.CONST       then ns.CONST       = {}; end;
if not ns.CONST.LINK  then ns.CONST.LINK  = {}; end;

local C         = ns.CONST;
local fmt       = string.format;
local meta      = GetAddOnMetadata;

local invite_base    = "https://worldofwarcraft.com/en-us/invite/%s?region=US&faction=Alliance";

C.LINK.WConquest_Prefix  = "https://gamerchic.org/warcraft-conquest/addon.html";
C.LINK.WConquest         = "";
C.LINK.WConquest_URL     = "https://gamerchic.org/warcraft-conquest/warcraft-conquest.html";
C.LINK.WConquest_Label   = "Warcraft Conquest Sites";
C.LINK.WConquest_Help    = fmt("SLASH [[link Website]] - %s - [%s%s]", C.LINK.WConquest_Label, C.LINK.WConquest_Prefix, C.LINK.WConquest);

C.LINK.Discord      = "/discord";
C.LINK.Discord_Code = "gsbdHE9";
C.LINK.Discord_URL  = "https://discord.gg/gsbdHE9/";
C.LINK.Discord_Label = "Warcraft Conquest Discord";
C.LINK.Discord_Help = fmt("SLASH [[invite discord]] - %s - [%s]", C.LINK.Discord_Label, C.LINK.Discord_Code);

C.LINK.Site      = "/addon";
C.LINK.Site_URL  = "https://wow.curseforge.com/projects/handynotes-warcraft-conquest";
C.LINK.Site_Label = "HandyNotes: Warcraft Conquest";
C.LINK.Site_Help = fmt("SLASH [[link Addon]] - %s - [%s%s]", C.LINK.Site_Label, C.LINK.WConquest_Prefix, C.LINK.Site);

C.LINK.GitHub      = "/github";
C.LINK.GitHub_URL  = "https://github.com/lorikrell/hn-wconquest";
C.LINK.GitHub_Label = "HN-WConquest GitHub";
C.LINK.GitHub_Help = fmt("SLASH [[link GitHub]] - %s - [%s%s]", C.LINK.GitHub_Label, C.LINK.WConquest_Prefix, C.LINK.GitHub);

C.LINK.Links = C.LINK.WConquest_Help    .. "\n" ..
               C.LINK.Site_Help .. "\n" .. 
               C.LINK.GitHub_Help;

C.LINK.Invites = C.LINK.Discord_Help; 

C.LINK.output_format =  [==[
[=Invite Codes=]
%s

[=Web Links=]
%s
]==];

C.LINK.Help = fmt(C.LINK.output_format, C.LINK.Invites, C.LINK.Links);

C.LINK.instruct_both = "\nCopy the code or URL field, then paste it into your web browser.";
C.LINK.instruct_code = "\nCopy the code, then paste it into the Join Community field.";
C.LINK.instruct_url  = "\nCopy the URL, then paste it into your web browser.";
