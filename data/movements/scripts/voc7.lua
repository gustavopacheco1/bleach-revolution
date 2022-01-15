function onStepIn(cid, item, position, fromPosition)
if getPlayerLevel(cid) > 0 then
doPlayerSetVocation(cid, 70)
doPlayerSetTown(cid, 1)
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Hihihi,nilo,hihhihi.")
end
return true
end