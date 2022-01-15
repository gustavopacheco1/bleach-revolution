function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19898) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de pegar o certificado de Conclusao do Exame Chunin!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 6087, 1)
setPlayerStorageValue(cid, 19898, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o certificado!.")
end

return TRUE
end