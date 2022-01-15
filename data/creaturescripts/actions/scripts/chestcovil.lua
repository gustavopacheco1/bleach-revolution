function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19907) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de pegar um item!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 10140, 1)
setPlayerStorageValue(cid, 19907, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return TRUE
end