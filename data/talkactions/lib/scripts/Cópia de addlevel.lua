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

if (not tonumber(t[2])) then
doPlayerSendTextMessage(cid, 27, "Coloque a quantidade de levels!")
return TRUE
end

doPlayerAddLevel(Name, t[2])
doCreatureAddHealth(Name, 1)
doCreatureAddMana(Name, 1)
doPlayerSendTextMessage(cid, 27, "Voce adicionou "..t[2].." levels para o jogador "..t[1].."!")
return TRUE
end