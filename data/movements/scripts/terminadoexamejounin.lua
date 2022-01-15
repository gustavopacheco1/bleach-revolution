function onStepIn(cid, item, position, fromPosition)
local storage = 49502 -- Storage
if getPlayerStorageValue(cid, storage) == 1 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce precisa vencer todos da arena primeiro, volte ao piso vermelho inicial.")
end
return true
end