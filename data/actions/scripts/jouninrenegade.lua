function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19899) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de pegar o saco de dinheiro!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2690, 1)
setPlayerStorageValue(cid, 19899, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o saco de dinheiro.")
end

return TRUE
end