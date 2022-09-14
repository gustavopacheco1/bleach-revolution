local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 3)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 608)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -66.0, 0, -66.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	doCombatLoop(
		cid,
		combat,
		5,
		300
	)

	exhaustion.set(cid, 200, 2)
	return true
end
