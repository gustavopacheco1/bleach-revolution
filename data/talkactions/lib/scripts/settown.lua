function onSay(cid, words, param, channel)

local t = string.explode(param, ",")
local Name = getPlayerByName(t[1])

if (not t[1]) then
doPlayerSendTextMessage(cid, 27, "Digite o nome do jogador.")
return TRUE
end

if (not Name or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, 27, "O jogador nao existe ou esta offline.")
return TRUE
end

if (not tonumber(t[2]) or t[2] == "") then
doPlayerSendTextMessage(cid, 27, "Coloque o ID da cidade.")
return TRUE
end

doPlayerSetTown(Name, t[2])
doTeleportThing(Name, getClosestFreeTile(Name, getTownTemplePosition(getPlayerTown(Name))))
doPlayerSendTextMessage(cid, 27, "Agora o jogador \""..t[1].."\" mora em "..getTownName(getPlayerTown(Name))..".")
return TRUE
end