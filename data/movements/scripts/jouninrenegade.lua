function onStepIn(cid, item, position, fromPosition)
local storage = 19899
if item.actionid == 28532 and getPlayerStorageValue(cid, storage) > 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"você ja venceu o jounin renegade e recuperou o dinheiro!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
return true
end