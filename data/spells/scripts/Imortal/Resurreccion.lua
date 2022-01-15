local combat = createCombatObject()


setCombatParam(combat, COMBAT_PARAM_EFFECT, 620)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, true)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local waittime1 = 10 -- Tempo de exhaustion
local storage1 = 15829

if exhaustion.check(cid, storage1) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage1) .. " segundos para usar a spell novamente.")
return false
end

doPlayerSetStorageValue(cid, 19332, 1)
doPlayerSendTextMessage(cid, 27, "Seu imortal tem 10 segundos de efeito.")
addEvent(doPlayerSetStorageValue, 10000, cid, 19332, 0)
addEvent(doPlayerSendTextMessage, 10000, cid, 27, "Seu imortal perdeu o efeito.")
exhaustion.set(cid, storage1, waittime1)
return true
end