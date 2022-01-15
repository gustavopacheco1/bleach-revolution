local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function getCombatFormulas(cid, level, magicLevel)

local min = (level * 70)
local max = (level * 140)

return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)

if exhaustion.check(cid, 13301) == TRUE then
if exhaustion.get(cid, 13301) >= 120 then
doPlayerSendCancel(cid, "Mystical Palm cooldown " ..math.floor(exhaustion.get(cid, 13301)/60).." minutos.")
return false
end
if exhaustion.get(cid, 13301) > 60 then
doPlayerSendCancel(cid, "Mystical Palm cooldown 1 minuto and " ..(exhaustion.get(cid, 13301)-60).." segundos.")
return false
end
doPlayerSendCancel(cid, "Mystical Palm cooldown " ..exhaustion.get(cid, 13301).." segundos.")
return false
end

doCombat(cid, combat, var)

exhaustion.set(cid, 13301, 4.0)

return true
end