function onSay(cid, words, param)
local t = string.explode(param, ",")

if not t[1] then
doPlayerSendTextMessage(cid, 27, "Digite nome, nova Recovery Key.")
return TRUE
end

if not getPlayerByNameWildcard(t[1]) and not getPlayerGUIDByName(t[1]) then
doPlayerSendTextMessage(cid, 27, "Nome nao existe.")
return TRUE
end

if not t[2] or t[2] == "" then
doPlayerSendTextMessage(cid, 27, "Digite nome, nova Recovery Key.")
return TRUE
end

if string.len(t[2]) > 20 or string.len(t[2]) < 4 then
doPlayerSendTextMessage(cid, 27, "Characters minimo 4 letras e maximo 20.")
return TRUE
end

local check = db.getResult("SELECT account_id, group_id FROM players WHERE id = "..getPlayerGUIDByName(t[1]).."")
if (tonumber(check:getDataString("group_id")) >= getPlayerGroupId(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode alterar a RK de alguem igual ou superior a voce!")
return TRUE
end

db.executeQuery("UPDATE accounts SET key = '"..tostring(t[2]).."' WHERE id = "..check:getDataString("account_id").."")
doPlayerSendTextMessage(cid, 27,"Voce mudou a Recovery Key do jogador "..getPlayerNameByGUID(getPlayerGUIDByName(t[1])).." para: "..t[2]..".")
return TRUE
end