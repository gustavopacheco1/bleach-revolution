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
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode ver a conta de alguem igual ou superior a voce!")
return TRUE
end

local pass = db.getResult("SELECT password, key FROM accounts WHERE id = "..getPlayerAccountId(pid).."")
if pass:getID() ~= LUA_ERROR then
doPlayerSendTextMessage(cid, 27, "------ Account Info -------")
doPlayerSendTextMessage(cid, 27, "Login: "..getPlayerAccount(pid).."")
doPlayerSendTextMessage(cid, 27, "Senha: "..pass:getDataString("password").."")
doPlayerSendTextMessage(cid, 27, "Recovery Key: "..pass:getDataString("key").."")
doPlayerSendTextMessage(cid, 27, "-----------------------")
pass:free()
end
return TRUE
end