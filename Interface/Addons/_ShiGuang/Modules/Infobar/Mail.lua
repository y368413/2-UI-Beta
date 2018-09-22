local M, R, U, I = unpack(ns)
if not R.Infobar.Mail then return end

local module = M:GetModule("Infobar")
local info = module:RegisterInfobar(R.Infobar.MailPos)

info.onUpdate = function(self, elapsed)
Text:SetText((HasNewMail() and "|cff00FF00"..U["New"]..U["Mail"].."|r" or U["No Mail"].."|r") or HasNewMail() and "|cff00FF00"..U["New"]..U["Mail"].."|r" or U["No Mail"])
end