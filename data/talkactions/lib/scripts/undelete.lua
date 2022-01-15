function onSay(cid, words, param, channel)

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
return TRUE
end

if not getPlayerGUIDByName(param) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome "..param.." nao existe.")
return TRUE
end

local check = db.getResult("SELECT name, deleted FROM players WHERE id = "..getPlayerGUIDByName(param))
if tonumber(check:getDataString("deleted")) >= 1 then
db.executeQuery("UPDATE players SET deleted = 0 WHERE id = "..getPlayerGUIDByName(param))
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Character "..check:getDataString("name").." as been undeleted!")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador "..check:getDataString("name").." nao esta deletado.")
end
return TRUE
end