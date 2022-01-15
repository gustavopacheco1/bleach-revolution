function onStepIn(cid, item, position, fromPosition)
local storage = 13502 -- Storage
if getPlayerStorageValue(cid, storage) == 0 then
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce precisa completar 3 missoes Rank A, Npc Kakashi Sensei tera as 3 missoes.")
end
return true
end