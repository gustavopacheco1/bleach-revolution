
function doMarkPos(cid, posx, posy, posz)


setPlayerStorageValue(cid, 19000, posx)

setPlayerStorageValue(cid, 19001, posy)

setPlayerStorageValue(cid, 19002, posz)

end


function getMarkPos(cid)


return {x=getPlayerStorageValue(cid, 19000), y=getPlayerStorageValue(cid, 19001), z=getPlayerStorageValue(cid, 19002)}

end


function onSay(cid, words, param)

local pos = getCreaturePosition(cid)


if words == "!salvar" then

		if getMarkPos(cid).x < 1 then

		  doSendMagicEffect(pos,15)

   doMarkPos(cid, pos.x, pos.y, pos.z)

		  doPlayerSendTextMessage(cid, 4, "Você salvou posicao no mapa.")

else

		 doPlayerSendCancel(cid, "Você já gravou posição.")

end

   elseif words == "!voltar" then

if getMarkPos(cid).x > 0 then

doTeleportThing(cid, getMarkPos(cid))

doMarkPos(cid, 0, 0, 0)

doPlayerSendTextMessage(cid, 21,"Você foi teleportado para o waypoint")

doSendMagicEffect(pos,11)

else

doPlayerSendCancel(cid, "Você não gravou uma posição.")

end

end

return TRUE

end