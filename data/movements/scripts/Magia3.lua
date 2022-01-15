function onStepIn(cid, item, position, fromPosition)
local storage = 520002 -- Storage
if (getPlayerStorageValue(cid,520002) > 1) then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"VOce liberou magia de lvl 350")
end
return true
end