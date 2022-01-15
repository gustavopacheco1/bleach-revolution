function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19896) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Pergaminho Secreto!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2155, 1)
setPlayerStorageValue(cid, 19896, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o Pergaminho Secreto!.")
end

return TRUE
end