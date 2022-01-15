function onSay(cid, words, param, channel)

local player = getPlayerGUIDByName(param)

if(param == "") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o nome do player.")
return TRUE
end

if(not player) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O nome " .. param .. " nao existe.")
return TRUE
end

local check = db.getResult("SELECT account_id, group_id FROM players WHERE id = "..getPlayerGUIDByName(param).."")
if (tonumber(check:getDataString("group_id")) >= getPlayerGroupId(cid) and player ~= getPlayerGUID(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode ver a conta de alguem igual ou superior a voce!")
return TRUE
end

local pass = db.getResult("SELECT name, password, key FROM accounts WHERE id = "..check:getDataInt("account_id").."")
if pass:getID() ~= LUA_ERROR then
doPlayerSendTextMessage(cid, 27, "------ Account Info -------")
doPlayerSendTextMessage(cid, 27, "Login: "..pass:getDataString("name").."")
doPlayerSendTextMessage(cid, 27, "Senha: "..pass:getDataString("password").."")
doPlayerSendTextMessage(cid, 27, "Recovery Key: "..pass:getDataString("key").."")
doPlayerSendTextMessage(cid, 27, "-----------------------")
pass:free()
end
return TRUE
end