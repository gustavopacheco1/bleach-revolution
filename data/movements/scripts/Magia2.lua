function onStepIn(cid, item, position, fromPosition)
local storage = 520001 -- Storage
if (getPlayerStorageValue(cid,520001) > 1) then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce liberou magia de lvl 250")
end
return true
end