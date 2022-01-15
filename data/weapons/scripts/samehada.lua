local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 29)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -22.3, 1)

local critical = createCombatObject()
setCombatParam(critical, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(critical, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatFormula(critical, COMBAT_FORMULA_LEVELMAGIC, -10, 10, -20, 20)

function onUseWeapon(cid, var)
	if isInArray( 23, getPlayerVocation(cid)) then
	doCombat(cid, critical, var)
	doCombat(cid, combat, var)
	local targetpos = getCreaturePosition(getCreatureTarget(cid))
	local pos = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
	else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Somente, as vocacoes Kisame, Killer Bee, podem utilizar a Samehada como uma forma de drenar Chakra.")
	doCombat(cid, combat, var)
end
return true
end