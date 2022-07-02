local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 19)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -17.0, 0, -17.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 115818) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	exhaustion.set(cid, 115818, 1)
	return doCombat(cid, combat, var)
end
