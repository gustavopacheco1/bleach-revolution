function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19903) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de pegar o certificado do exame Jounin!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 6088, 1)
setPlayerStorageValue(cid, 19903, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o certificado!.")
end

return TRUE
end