local config = { 
storage = 3482101,
effect1 = 17, --- efeito que sai ao dar reflect
effect2 = 29 -- efeito que aparece na pessoa que levou reflect
} 

function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if getPlayerStorageValue(cid,config.storage) == 1 and isCreature(attacker) then
doSendAnimatedText(getCreaturePosition(attacker),"-"..value, 215)
doCreatureAddHealth(attacker, -value, true)
doCreatureSay(cid,"Uchihagaeshi!", 19)
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
doSendMagicEffect(getCreaturePosition(attacker), config.effect2)
setPlayerStorageValue(cid,config.storage, 0)
return false
end
end
return true
end