local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 74)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -42.0, 0, -42.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	doCombatLoop(
		cid,
		combat,
		5,
		300,
		{ id = 460, x = 1, y = 1 }
	)

	exhaustion.set(cid, 200, 2)
	return true
end
