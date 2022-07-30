local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -450, 0, -455, 0)
setCombatArea(combat, createCombatArea(AREA_CANNON6SQM, AREADIAGONAL_CANNON6SQM))

function onCastSpell(cid, var)
	if exhaustion.check(cid, "cannon") then
		doPlayerSendDefaulCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	doCannon(
		cid,
		combat,
		var,
		6,
		618,
		618,
		617,
		617
	)

	exhaustion.set(cid, "cannon", 3)
	return true
end
