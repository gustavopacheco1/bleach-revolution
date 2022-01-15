local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_RED)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -65.8, 1)

function onCastSpell(cid, var)
	local waittime = 1.2 -- Tempo de exhaustion
	local storage = 115820
		if exhaustion.check(cid, storage) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
		return false
	end
	local effect = 42
	local PosTarget = {x=getThingPosition(getCreatureTarget(cid)).x-2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}	
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x-2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	local position2 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	local position3 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	local position4 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	local position5 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
	doSendMagicEffect(PosTarget, effect)
	doSendMagicEffect(position1, 165)
	doSendMagicEffect(position2, 166)
	doSendMagicEffect(position3, 167)
	doSendMagicEffect(position4, 406)
	doSendMagicEffect(position5, 85)
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
