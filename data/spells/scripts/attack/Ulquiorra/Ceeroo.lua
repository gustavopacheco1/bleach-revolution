local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60, 0, -75, 0)
setCombatArea(combat, createCombatArea(AREA_CANNON_6SQM, AREADIAGONAL_CANNON_6SQM))

function onCastSpell(cid, var)
	if exhaustion.check(cid, "Ceroo") then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	doCannon(
		cid,
		combat,
		var,
		{ length = 6, height = 3 },
		{ east = 749, west = 749, north = 750, south = 750 }
	)

	exhaustion.set(cid, "Ceroo", 2)
	return true
end
