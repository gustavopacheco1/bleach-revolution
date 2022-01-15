local config = {
pos = {x=1058, y=1022, z=14}, -- posição da izanagi dimension
tempo = 5, -- tempo pra voltar
effect1 = 108, -- efeito ao morrer
effect2 = 134, -- efeito ao retornar a vida
storage = 12345,
health = 80000,
mana = 80000
}




function onStatsChange(cid, attacker, type, combat, value)
if type == STATSCHANGE_HEALTHLOSS and value >= 1 then
if isPlayer(cid) and isPlayer(attacker) and getPlayerStorageValue(cid, config.storage) >= 1 then
doPlayerSetStorageValue(cid, config.storage, (getPlayerStorageValue(cid, config.storage)-1))
addEvent(doTeleportThing, 1000*config.tempo, attacker, getThingPos(attacker), true)
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(attacker), config.effect2)
doSendMagicEffect(getThingPos(attacker), config.effect1)
doTeleportThing(attacker, config.pos)
setPlayerStorageValue(cid,config.storage,-1)
doCreatureAddHealth(attacker, -config.health)
doCreatureAddMana(attacker, -config.mana)
for i = 1,config.tempo  do
end


return false
end
end
return true
end