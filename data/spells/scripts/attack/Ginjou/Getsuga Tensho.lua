local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 73)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -16.0, 0, -16.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 45670) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	doCombatLoop(cid, combat, { id = 695, x = 1, y = 1 }, 5, 275)

	exhaustion.set(cid, 45670, 1)
	return true
end
