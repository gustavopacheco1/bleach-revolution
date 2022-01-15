function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19881) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir os Items Iniciais!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2665, 1)
doAddContainerItem(bag, 2417, 1)
doAddContainerItem(bag, 2427, 1)
doAddContainerItem(bag, 2379, 1)
doAddContainerItem(bag, 2545, 1)
doAddContainerItem(bag, 7387, 1)
doAddContainerItem(bag, 7436, 1)
doAddContainerItem(bag, 2666, 2)
setPlayerStorageValue(cid, 19881, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Items Iniciais.")
end

return TRUE
end