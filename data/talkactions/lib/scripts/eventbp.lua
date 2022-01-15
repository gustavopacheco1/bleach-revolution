local wall_pos = {x=2030,y=804,z=7}
local temple = {x=1026,y=910,z=7}
local arrumar = {x=2074,y=923,z=7}
local from,to = {x=2051, y=864, z=7},{x=2102, y=919, z=7}

function onSay(cid, words, param, channel) 
    if(param == "") then
	    return doPlayerSendTextMessage(cid, 27, "\n-open\n-close\n-arrumar")
		
    elseif(param == "open") then
        if getGlobalStorageValue(15201) > 0 then
            return doPlayerSendTextMessage(cid, 27, "O evento de backpacks ja esta aberto.")
        else
		    if getTileItemById(wall_pos,1028).uid > 0 then
                doRemoveItem(getTileItemById(wall_pos,1028).uid, 1)
			end
            setGlobalStorageValue(15201, 1)
            setGlobalStorageValue(15200, 1)
            doBroadcastMessage("O Evento de backpacks esta aberto!! diga  /evento  para participar!!", MESSAGE_EVENT_ADVANCE)
        end

    elseif (param == "arrumar") then
        return doTeleportThing(cid, arrumar)

    elseif (param == "close") then
        if getGlobalStorageValue(15201) < 0 then
            return doPlayerSendTextMessage(cid, 27, "O evento de backpacks ja esta fechado.")
        else
		    if getTileItemById(wall_pos,1028).uid < 1 then
                doCreateItem(1028, 1, wall_pos)
			end
            setGlobalStorageValue(15201, -1)
            setGlobalStorageValue(15200, -1)
            doBroadcastMessage("O Evento de backpacks foi fechado!!", MESSAGE_EVENT_ADVANCE)
            for x = from.x, to.x do
                for y = from.y, to.y do
                    local mob = getTopCreature({x=x, y=y, z=from.z}).uid
                    if isPlayer(mob) and getPlayerAccess(mob) < 2 then
                        doTeleportThing(mob, getClosestFreeTile(mob, temple))
                    end
                end
            end
        end
    end
    return true
end