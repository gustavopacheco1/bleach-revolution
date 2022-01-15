local config = {
pos = {x=1474, y=1292, z=7}, -- posição da aegis dimension
tempo = 3, -- tempo pra voltar
effect1 = 620, -- efeito ao morrer
effect2 = 649, -- efeito ao retornar a vida
storage = 19332
}




function onStatsChange(cid, attacker, type, combat, value)
if type == STATSCHANGE_HEALTHLOSS and value >= getCreatureHealth(cid) then
if getPlayerStorageValue(cid, config.storage) > 0 then
doPlayerSetStorageValue(cid, config.storage, (getPlayerStorageValue(cid, config.storage)-1))
addEvent(doTeleportThing, 1000*config.tempo, cid, getThingPos(cid), true)
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(cid), config.effect2)
doSendMagicEffect(getThingPos(cid), config.effect1)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
doTeleportThing(cid, config.pos)
if isCreature(attacker) then
doPlayerSendTextMessage(cid, 27, "You were killed by ".. getCreatureName(attacker) .."!!!")
end
if isPlayer(attacker) and isCreature(cid) then
doPlayerSendTextMessage(attacker, 27, "You killed ".. getCreatureName(cid) .."!")
end
for i = 1,config.tempo  do
addEvent(function()
if isCreature(cid) then

end
end, 1000*i)
end


return false
end
end
return true
end