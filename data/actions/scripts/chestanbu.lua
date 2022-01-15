function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 132807) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de achar 50 G!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2160, 50)
setPlayerStorageValue(cid, 132807, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return TRUE
end