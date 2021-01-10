local _, A = ...


function A:Print(...)
  DEFAULT_CHAT_FRAME:AddMessage(A.addonName .. "- " .. tostringall(...))
end

A.TT = CreateFrame("GameTooltip", "AutoMailerTT", nil, "GameTooltipTemplate")
A.TT:SetOwner(WorldFrame, "ANCHOR_NONE")

A.slashPrefix = "|cff8d63ff/automailer|r "
A.addonName = "|cff8d63ffAutoMailer|r "
A.sentMail = false
A.awaitConfirmSent = false
A.awaitInboxUpdate = false
A.awaitBagUpdate = false

--[[
    ---- EVENT FRAME ----
]]
local E = CreateFrame("Frame")
E:RegisterEvent("ADDON_LOADED")
E:RegisterEvent("MAIL_SHOW")
E:RegisterEvent("MAIL_CLOSED")
E:RegisterEvent("MAIL_INBOX_UPDATE")
E:RegisterEvent("MAIL_SUCCESS")
E:RegisterEvent("MAIL_FAILED")

--E:RegisterEvent("BAG_UPDATE_DELAYED")
E:RegisterEvent("PLAYER_ENTERING_WORLD")
E:SetScript("OnEvent", function(self, event, ...)
  return self[event] and self[event](self, ...)
end)


--[[
    -- ADDON LOADED --
]]
function E:ADDON_LOADED(name)
  if name ~= "AutoMailer" then return end
  AutoMailer = AutoMailer or {}
  AutoMailer.items = AutoMailer.items or ""
  AutoMailer.recipient = AutoMailer.recipient or ""
  AutoMailer.boeRecipient = AutoMailer.boeRecipient or ""
  AutoMailer.boeRarityLimit = AutoMailer.boeRarityLimit or 4

  if AutoMailer.loginMessage == nil then AutoMailer.loginMessage = true end

  
  A.itemsSent = {}
  A.itemsSent[AutoMailer.recipient] = {}
  A.itemsSent[AutoMailer.boeRecipient] = {}

  SLASH_AUTOMAILER1= "/automailer"
  SLASH_AUTOMAILER2= "/am"
  SlashCmdList.AUTOMAILER = function(msg)
    A:SlashCommand(msg)
  end
  
  A:CreateOptionsMenu()
  A.loaded = true
end



--[[
    -- PLAYER ENTERING WORLD --
]]
function E:PLAYER_ENTERING_WORLD(login, reloadUI)
  if (login or reloadUI) and AutoMailer.loginMessage and A.loaded then
    print(A.addonName .. "loaded")
  end
end



local function AutoMailerSendMail()
  if not A.sendingMail then return end
  local recipient = AutoMailer.recipient
  local boeRecipient = AutoMailer.boeRecipient

  A.sentBoes = false
  A.sentMail = false


  while true do
    local status = A:BulkSend(recipient, boeRecipient)

    if status == "Send" and not A.awaitInboxUpdate then
      SendMail(recipient, A:GetMailSubject())
      A.awaitConfirmSent = true
    end

    if status == "Error" then
    end

    if status == "Done" then
      break
    end
    coroutine.yield()
  end


  while true do
    local status = A:BulkSendBoes(boeRecipient)

    if status == "Send" and not A.awaitInboxUpdate then
      SendMail(boeRecipient, A:GetMailSubject())
      A.awaitConfirmSent = true
    end

    if status == "Error" then
    end

    if status == "Done" then
      break
    end
    coroutine.yield()
  end


  if A.sentMail then
    A:Print("Bulk mail sent to "..recipient)
    A.sentMail = false
  end
  if A.sentBoes then
    A:Print("BoE's sent to "..boeRecipient)
    A.sentBoes = false
  end

  A.sendingMail = false
end


local interval = 0.1
local lastUpdate = 0

local OnUpdate = CreateFrame("Frame")
OnUpdate:SetScript("OnUpdate", function(self, elapsed)

  -- Throttle
  lastUpdate = lastUpdate + elapsed
  if lastUpdate < interval then return end
  lastUpdate = 0


  if A.sendingMail and not A.awaitConfirmSent and not A.awaitInboxUpdate then
    local status = coroutine.status(A.coroutine)
    if status == "running" then return end

    local alive = coroutine.resume(A.coroutine)
    if alive == false then
      A.coroutine = coroutine.create(AutoMailerSendMail)
      coroutine.resume(A.coroutine)
    end

  end -- A.sendingMail

  if not A.sendingMail then
    CloseMail()
  end
end) -- OnUpdate

OnUpdate:Hide()








--[[
    -- MAILING EVENTS --
]]
function E:MAIL_SHOW()
  if IsShiftKeyDown() then
    A.awaitInboxUpdate = true
    A.awaitConfirmSent = false

    -- SHOW "SEND" TAB
    SetSendMailShowing(true)
    MailFrameTab2:Click()

    A.coroutine = coroutine.create(AutoMailerSendMail)
    A.sendingMail = true
    OnUpdate:Show()
  end
end

function E:MAIL_CLOSED()
  A.sendingMail = false
  A.awaitInboxUpdate = false
  OnUpdate:Hide()
end

function E:MAIL_INBOX_UPDATE()
  A.awaitInboxUpdate = false
end


function E:MAIL_SUCCESS()
  C_Timer.After(0.5, function()
    A.awaitConfirmSent = false
  end)
end
function E:MAIL_FAILED()
  C_Timer.After(0.5, function()
    A.awaitConfirmSent = false
  end)
end



function E:BAG_UPDATE_DELAYED()
  A.awaitBagUpdate = false
end



function A:GetMailSubject()
  local name, _, _, count = GetSendMailItem(1)
  return name.." ("..count..")"
end



function A:ItemInAutomailList(itemName)
  itemName = A:EscapePattern(itemName)
  return string.find(AutoMailer.items:lower(), itemName:lower())
end



function A:EscapePattern(string)
  return string:gsub("([^%w])", "%%%1")
end



function A:AutomailBoe(bindType)
  return AutoMailer.SendBOE and bindType == 2
end



function A:ItemIsCraftingReagent(itemLink)
  return select(17, GetItemInfo(itemLink))
end



function A:ItemIsSoulbound(bag, slot)
  local t = A.TT
  local isSoulbound = false
  t:ClearLines()
  t:SetBagItem(bag, slot)
  t:Show()


  for i = 1, 4 do
    local text = _G["AutoMailerTTTextLeft"..i]:GetText()

    if text == ITEM_SOULBOUND then
      isSoulbound = true
    end
  end
  return isSoulbound
end



function A:SlashCommand(args)
  local command = strsplit(" ", args, 1)
  command = command:lower()

  if command == "list" then
    local sentMessage = false
    for recipient, items in pairs(A.itemsSent) do
      local string = ""
      for itemName, count in pairs(items) do
        if #string > 0 then
          string = string .. ", "..itemName.."x"..count
        else
          string = itemName.."x"..count
        end
      end

      if #string > 0 then
        A:Print("Items sent to ".. recipient)
        print(string)
        sentMessage = true
      end
    end
    if not sentMessage then
      A:Print("Nothing sent this session.")
    end
  else
    InterfaceOptionsFrame_OpenToCategory(A.optionsPanel)
    InterfaceOptionsFrame_OpenToCategory(A.optionsPanel)
    OpenAllBags()
  end
end



function A:Count(T)
  local i = 0
  for _,_ in pairs(T) do
    i = i+1
  end
  return i
end



function A:BulkSend(recipient, boeRecipient)
  if #recipient ~= 0 then
    for bag = 0, NUM_BAG_SLOTS do
      for slot = 1, GetContainerNumSlots(bag) do
        local _, _, locked, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
        if itemLink and not locked then
          if not A:ItemIsSoulbound(bag, slot) then -- Item is not soulbound
            local itemName, _, rarity, _, itemMinLevel, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemLink)
            local sendItem = false
            local rarityCheck = false
            local levelCheck = false

            if A:ItemInAutomailList(itemName) then -- item is in text list
              sendItem = true

            elseif AutoMailer.SendReagents and A:ItemIsCraftingReagent(itemLink) then
              sendItem = true

            elseif A:AutomailBoe(bindType) and #boeRecipient == 0 then -- Mail BoEs and item is BoE

              if AutoMailer.LimitBoeLevel then -- Limit BoE required level to be below player level
                if itemMinLevel < UnitLevel("PLAYER") then -- Check required level
                  levelCheck = true
                end
              else -- Not limiting BoE levels so send all BoEs
                levelCheck = true
              end


              if AutoMailer.limitBoeRarity then
                if rarity < AutoMailer.boeRarityLimit then
                  rarityCheck = true
                end
              else
                rarityCheck = true
              end

              sendItem = rarityCheck and levelCheck
            end

            if sendItem then -- we should send this item
              UseContainerItem(bag, slot)
              tinsert(A.itemsSent[recipient], itemLink)
              if GetSendMailItem(12) then -- If there are max attached items then send the mail before proceeding
                return "Send"
              end -- 12 ITEMS IN MAIL
            end -- IF SENDITEM
          end -- NOT SOULBOUND
        end -- ITEMLINK
      end -- SLOTS
    end -- BAGS
    if GetSendMailItem(1) then
      return "Send"
    end
  else
    A.errorMessage = "No recipient or items in list."
    return "Error"
  end

  return "Done"
end


function A:BulkSendBoes(boeRecipient)
  -- BOES TO SEPARATE CHARACTER
  if #boeRecipient ~= 0 then

    for bag = 0, NUM_BAG_SLOTS do
      for slot = 1, GetContainerNumSlots(bag) do
        local locked = select(3, GetContainerItemInfo(bag, slot))
        local itemLink = select(7, GetContainerItemInfo(bag, slot))
        if itemLink and not locked then
          if not A:ItemIsSoulbound(bag, slot) then -- Item is not soulbound
            local _, _, rarity, _, itemMinLevel, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemLink)
            local sendItem = false
            local rarityCheck = false
            local levelCheck = false

            if A:AutomailBoe(bindType) then -- Mail BoEs and item is BoE
              if AutoMailer.limitBoeRarity then
                if rarity <= AutoMailer.boeRarityLimit then
                  rarityCheck = true
                end
              else
                rarityCheck = true
              end


              if AutoMailer.LimitBoeLevel then -- Limit BoE required level to be below player level
                if itemMinLevel < UnitLevel("PLAYER") then -- Check required level
                  levelCheck = true
                end
              else -- Not limiting BoE levels so send all BoEs
                levelCheck = true
              end

              sendItem = rarityCheck and levelCheck
            end

            if sendItem then -- we should send this item
              tinsert(A.itemsSent[boeRecipient], itemLink)
              UseContainerItem(bag, slot)

              -- if itemsInMail == 12  then
              if GetSendMailItem(12) then -- If there are max attached items then send the mail before proceeding
                return "Send"
              end -- 12 ITEMS IN MAIL
            end -- IF SENDITEM
          end -- NOT SOULBOUND
        end -- ITEMLINK
      end -- SLOTS
    end -- BAGS

    if GetSendMailItem(1) then
      return "Send"
    end
  end

  return "Done"
end