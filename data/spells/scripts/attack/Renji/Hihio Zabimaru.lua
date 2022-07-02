local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -20.0, 0, -20.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 120) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 2,
		y = target_position.y,
		z = target_position.z
	}, 542)

	exhaustion.set(cid, 120, 1)
	return doCombat(cid, combat, var)
end
