local waittime = 6000000 -- Tempo de exhaustion

function onThink(cid, lastExecution, thinkInterval)
    if(getTilePzInfo(getCreaturePosition(cid))) == false and getPlayerStorageValue(cid, 23333) <= 0 then
       for b = 1,5 do
           if getPlayerBlessing(cid, b) == false then
	      setPlayerStorageValue(cid, 23333, 1)
		  exhaustion.set(cid, storage, waittime)
	      return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� esta saindo de uma �rea protegida!.")
           end
        end
    elseif (getTilePzInfo(getCreaturePosition(cid))) == true and getPlayerStorageValue(cid, 23333) == 1 then
	setPlayerStorageValue(cid, 23333, -1)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� esta entrando em uma �rea protegida!.")
	exhaustion.set(cid, storage, waittime)
    end
   return true
end