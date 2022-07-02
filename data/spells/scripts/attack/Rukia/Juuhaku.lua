local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -16.0, 0, -16.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 115818) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 2,
		y = target_position.y,
		z = target_position.z
	}, 569)

	exhaustion.set(cid, 115818, 1)
	return doCombat(cid, combat, var)
end
