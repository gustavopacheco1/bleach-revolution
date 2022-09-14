local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 19)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -70.0, 0, -85.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 300) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	exhaustion.set(cid, 300, 3)
	return doCombat(cid, combat, var)
end
