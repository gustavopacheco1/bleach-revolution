function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19897) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir a Sameheda!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2413, 1)
setPlayerStorageValue(cid, 19897, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou a Sameheda!.")
end

return TRUE
end