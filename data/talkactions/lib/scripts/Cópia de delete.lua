function onSay(cid, words, param, channel)

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
return TRUE
end

local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome " .. param .. " nao existe ou o jogador esta offline.")
return TRUE
end

if getPlayerAccess(pid) >= getPlayerAccess(cid) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao deletar alguem igual ou superior a voce!")
return TRUE
end

db.executeQuery("UPDATE players SET deleted = 1 WHERE id = "..getPlayerGUID(pid).."")
doBroadcastMessage("The Player "..(getCreatureName(pid)).." as been deleted from Server!", MESSAGE_INFO_DESCR)
doRemoveCreature(pid)
return TRUE
end