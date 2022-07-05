local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -106.0, 0, -106.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 250) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 2,
		y = target_position.y + 2,
		z = target_position.z
	}, 731)

	doSendMagicEffect({
		x = target_position.x + 1,
		y = target_position.y + 1,
		z = target_position.z
	}, 467)

	exhaustion.set(cid, 250, 2,5)
	return doCombat(cid, combat, var)
end
