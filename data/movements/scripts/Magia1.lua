function onStepIn(cid, item, position, fromPosition)
local storage = 520000 -- Storage
if (getPlayerStorageValue(cid,520000) > 1) then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce liberou a magia de lvl 200")
end
return true
end