local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 84)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -116.0, 0, -116.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 250) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 1,
		y = target_position.y,
		z = target_position.z
	}, 720)

	doCombat(cid, combat, var)

	exhaustion.set(cid, 250, 2)
	return true
end
