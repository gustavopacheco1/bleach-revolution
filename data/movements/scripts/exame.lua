function onStepIn(cid, item, position, fromPosition)
local storage = 89745 -- Storage
if getPlayerStorageValue(cid, storage) >= 1 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Complete a missao para ir para konoha, se começou agora puxe a alavanca")
end
return true
end