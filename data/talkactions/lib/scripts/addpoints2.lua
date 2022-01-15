function onSay(cid, words, param)
local t = string.explode(param, ",")

local present = doCreateItemEx(1989)

if not t[1] then
doPlayerSendTextMessage(cid, 27, "Digite nome, quantidade.")
return TRUE
end

if not getPlayerGUIDByName(t[1]) then
doPlayerSendTextMessage(cid, 27, "Nome nao existe.")
return TRUE
end

if not tonumber(t[2]) or t[2] == "" then
doPlayerSendTextMessage(cid, 27, "Digite nome, quantidade.")
return TRUE
end

doAddContainerItem(present, 9970, t[2])
doPlayerSendMailByName(getPlayerNameByGUID(getPlayerGUIDByName(t[1])), present, 1)
doPlayerSendTextMessage(cid, 27,"Voce adicionou "..t[2].." points ao jogador "..getPlayerNameByGUID(getPlayerGUIDByName(t[1]))..".")
return TRUE
end