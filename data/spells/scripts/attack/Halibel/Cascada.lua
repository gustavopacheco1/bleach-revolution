local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -86.0, 0, -86.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect(target_position, 319)

	doSendMagicEffect({
		x = target_position.x + 3,
		y = target_position.y + 1,
		z = target_position.z
	}, 382)

	exhaustion.set(cid, 250, 2,5)
	return doCombat(cid, combat, var)
end
