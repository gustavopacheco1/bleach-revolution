function onSay(cid, words, param)
         if param == "" then
            return  doPlayerPopupFYI(cid,"Está com problemas?\nAprenda os comandos!\n---------------\nAdicionar premium:\n/pa add days player\n/pa add 30 Wakon\n---------------\nRemover premium:\n/pa remove player\n/pa remove Wakon\n---------------\nVer Premium:\n/pa days player\n/pa days Wakon\n---------------")
         end
         if param:lower():find('add') == 1 and 3 then
            local _,_,id,name = param:lower():find('add (%d+) (.+)')
            name = name or ""
            id = tonumber(id or 1) or 1
            if tonumber(id) == nil or getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,25,"Adicionar premium:\n/pa add days player\n/pa add 30 Wakon\n [Player: "..name.."]")
            end  
            if isPlayer(getPlayerByName(name)) == TRUE then
            doPlayerAddPremiumDays(getPlayerByName(name), id)


            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Foram adicionados "..tonumber(id).." dias de premium ao jogador "..name..".")
            doPlayerSendTextMessage(getPlayerByName(name),25,"Você recebeu "..tonumber(id).." dias de premium, relogue para atualizar.")
         else
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"O jogador "..name.." não esta online ou não existe.")
         end
         elseif param:lower():find('remove') == 1 and 3 then
   local _,_,id2,name2 = param:lower():find('remove (%d+) (.+)')
name2 = name2 or ""
            id2 = tonumber(id2 or 1) or 1
            if tonumber(id2) == nil or getPlayerByName(name2) == false then
               return doPlayerSendTextMessage(cid,25,"Remover premium:\n/pa remove days player\n/pa remove 30 Wakon\n [Player: "..name2.."]")
            end 
            if isPlayer(getPlayerByName(name2)) == TRUE then
   doPlayerRemovePremiumDays(getPlayerByName(name2), id2)
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Foram retirados "..tonumber(id2).." dias de premium do jogador "..name2..".")         
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"O jogador "..name2.." não esta online ou não existe.")
end
if param:lower():find('days') == 1 and 3 then
   local _,_,name3 = param:lower():find('days (.+)')
name3 = name3 or ""
prem = getPlayerPremiumDays(getPlayerByName(name3))
if isPlayer(getPlayerByName(name3)) == false then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"O jogador "..name3.." não esta online ou não existe.")
end 
if prem >= 1 then
               return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O jogador "..name3.." tem "..prem.." dias de premium.")
  else
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"O jogador "..name3.." é free account.")
  end
end
return TRUE
end