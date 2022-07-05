local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25.0, 0, -25.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 300) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 3,
		y = target_position.y,
		z = target_position.z
	}, 15)

	exhaustion.set(cid, 300, 3)
	return doCombat(cid, combat, var)
end
