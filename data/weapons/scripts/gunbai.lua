local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 21)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -18.3, 1)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(critical, COMBAT_PARAM_DISTANCEEFFECT, 17)
setCombatFormula(critical, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -18.3, 1)

function onUseWeapon(cid, var)
local chance = 5 -- porcentagem de chance de dar critical

if isCreature(getCreatureTarget(cid)) and math.random(1,100) <= chance then
doCombat(cid, critical, var)
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
doSendMagicEffect(pos, 134)
doSendAnimatedText(getCreaturePosition(cid), "Gunbai!", math.random(1,255))
else
doCombat(cid, combat, var)
end
return true
end