local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_RED)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -65.8, 1)

function onCastSpell(cid, var)
	local waittime = 1.0 -- Tempo de exhaustion
	local storage = 115818
		if exhaustion.check(cid, storage) then
		return false
	end
	local effect = 25
	local PosTarget = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}	
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
	local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
	doCreatureSay(cid, "Beast Explosion Rasengan", TALKTYPE_MONSTER)
	doSendMagicEffect(PosTarget, effect)
	doSendMagicEffect(position1, 313)
	doSendMagicEffect(position2, 26)
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)

end
