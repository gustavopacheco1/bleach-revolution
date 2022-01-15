local storagee = 3529
local emGuerra = 1756

function onSay(cid, words, param, channel)
local tmp = getCreaturePosition(cid)
local pos = {x = 529, y = 1924, z = 6}

if getPlayerGuildId(cid) == nil or getPlayerGuildId(cid) <= 0 or getPlayerGuildId(cid) == false then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você precisa criar uma guild para se registrar.")

elseif getPlayerStorageValue(cid, storagee) == 1 then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você ja é registrado.")
else
    setPlayerStorageValue(cid, storagee, 1)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Agora você está registrado.")
end
	return true
end