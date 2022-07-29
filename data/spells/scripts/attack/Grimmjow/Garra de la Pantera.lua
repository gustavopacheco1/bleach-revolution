local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 23)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -67.0, 0, -67.0, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, 200) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	CustomSpell.skyShoot(cid, combat, 3, 400, 23, { id = 23, x = 227, y = 227 })

	exhaustion.set(cid, 200, 2)
	return true
end
