function onUse(cid, item, fromPosition, item2, toPosition)
 
local teleport = {x=1465, y=130, z=5} -- Coordenadas para onde o player irá ser teleportado.
local item_id = 8978 -- ID do item que o player precisa para ser teleportado.
 
if getPlayerItemCount(cid,item_id) >= 1 then
doTeleportThing(cid, teleport)
doPlayerRemoveItem(cid, item_id, 1)
doSendMagicEffect(getPlayerPosition(cid), 10)
doPlayerSendTextMessage(cid, 22, "Parabens voce passou pela porta!")
else
doPlayerSendTextMessage(cid, 22, "Desculpe, para passar voce precisa da chave "..getItemNameById(item_id)..".")
end