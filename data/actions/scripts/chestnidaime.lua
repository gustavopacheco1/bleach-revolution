function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19909) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de achar a armor de nidaime!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 7463, 1)
setPlayerStorageValue(cid, 19909, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return TRUE
end