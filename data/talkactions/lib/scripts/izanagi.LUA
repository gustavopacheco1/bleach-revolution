function onSay(cid, words, param, channel)
local storage,amount = 75457,2
if getPlayerStorageValue(cid, storage) ~= -1 then
doPlayerSendCancel(cid, "você já ativou sua proteção.") return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"você recebeu "..amount.." proteção.")
setPlayerStorageValue(cid, storage, amount)
return true
end
