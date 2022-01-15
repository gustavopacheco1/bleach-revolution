function onStepIn(cid, item, frompos, topos)

pos = getCreaturePosition(cid)


if getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then

doRemoveCondition(cid, CONDITION_INFIGHT)

doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Seu battle foi removido.")

doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)

else

doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você nao esta em battle.")

doSendMagicEffect(pos, CONST_ME_POFF)

end


end