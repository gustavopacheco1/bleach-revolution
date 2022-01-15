function onSay(cid, words, param, channel)

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
return TRUE
end

if not getPlayerGUIDByName(param) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome "..param.." nao existe.")
return TRUE
end

local check = db.getResult("SELECT name, group_id, deleted FROM players WHERE id = "..getPlayerGUIDByName(param).."")
if (tonumber(check:getDataString("group_id")) >= getPlayerGroupId(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao deletar alguem igual ou superior a voce!")
return TRUE
end

if tonumber(check:getDataString("deleted")) <= 0 then
local GUID = getPlayerGUIDByName(param)
doBroadcastMessage("Character \""..check:getDataString("name").."\" as been deleted!", MESSAGE_INFO_DESCR)
if isPlayer(getPlayerByNameWildcard(param)) then
doRemoveCreature(getPlayerByNameWildcard(param))
end
db.executeQuery("UPDATE players SET deleted = 1 WHERE id = "..GUID)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador "..check:getDataString("name").." ja esta deletado.")
end
return TRUE
end