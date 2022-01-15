function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19906) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de achar a armor que madara roubou de hashirama!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 8854, 1)
setPlayerStorageValue(cid, 19906, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return TRUE
end