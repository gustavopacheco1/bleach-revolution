local outfit = {lookType = 458}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 53)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -22.3, 1)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(critical, COMBAT_PARAM_DISTANCEEFFECT, 53)
setCombatFormula(critical, COMBAT_FORMULA_LEVELMAGIC, -15.3, 1, -25.3, 1)

function onUseWeapon(cid, var)
local chance = 0 -- porcentagem de chance de dar critical

if isInArray( 1, getPlayerVocation(cid)) then
	doCombat(cid, critical, var)
	doSetCreatureOutfit(cid, outfit)
	doSendAnimatedText(getPlayerPosition(cid),"- SAMEHADA -", math.random(1,69))
local targetpos = getCreaturePosition(getCreatureTarget(cid))
local pos = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
doSendAnimatedText(getCreaturePosition(cid), "CRITICAL!", math.random(1,255))
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Somente, as vocacoes Kisame, Killer Bee, podem utilizar a Samehada como uma forma de drenar Chakra.")
doCombat(cid, combat, var)
end
return true
end