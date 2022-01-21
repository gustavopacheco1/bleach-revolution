local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 52)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60.0, 0, -60.0, 0)

function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 120) then
doPlayerSendCancel(cid, "You are exhausted.")
return FALSE
end

exhaustion.set(cid, 120, 1)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
return doCombat(cid, combat, var)
end