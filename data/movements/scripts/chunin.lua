function onStepIn(cid, item, position, fromPosition)
local storage = 89745
if item.actionid == 28531 and getPlayerStorageValue(cid, storage) > 1 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"você ja fez o exame chunin, não podes fazer novamente!")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
return true
end