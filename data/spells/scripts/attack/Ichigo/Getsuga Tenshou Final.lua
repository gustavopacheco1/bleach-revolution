local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getSingleShootFormula")

function onCastSpell(cid, var)
	if exhaustion.check(cid, 270) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 3,
		y = target_position.y,
		z = target_position.z
	}, 15)

	doCombat(cid, combat, var)

	exhaustion.set(cid, 270, 2)
	return true
end
