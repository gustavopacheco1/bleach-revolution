function onStepIn(cid, item, position, fromPosition)
local storage = 89745
if item.actionid == 28530 and getPlayerStorageValue(cid, storage) > 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"voce ja completou essa missão e não podes mais entrar na floresta proibida.")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
return true
end