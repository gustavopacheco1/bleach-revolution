local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 2)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13.3, 1, -25.3, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -5)
setCombatCondition(combat, condition)

function onUseWeapon(cid, var)
local uidpos = getThingPos(getCreatureTarget(cid))
local config = {
[1] = {91, {x=uidpos.x, y=uidpos.y, z=uidpos.z}}, -- agua
[2] = {94, {x=uidpos.x+1, y=uidpos.y, z=uidpos.z}}, -- vento
[3] = {74, {x=uidpos.x+1, y=uidpos.y, z=uidpos.z}}, -- fogo
[4] = {138, {x=uidpos.x+1, y=uidpos.y+1, z=uidpos.z}}, -- raio
[5] = {197, {x=uidpos.x+1, y=uidpos.y+1, z=uidpos.z}} -- terra
}

if getCreatureMana(cid) < 15000 then return true end
if isCreature(getCreatureTarget(cid)) then
doCombat(cid, combat, var)
local rand = math.random(#config)
doSendMagicEffect(config[rand][2], config[rand][1])
end
return true
end