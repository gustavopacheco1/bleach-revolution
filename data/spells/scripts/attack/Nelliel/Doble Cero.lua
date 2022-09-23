local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -70, 0, -85, 0)
setCombatArea(combat, createCombatArea(AREA_BIG_CANNON_6SQM, AREADIAGONAL_BIG_CANNON_6SQM))

function onCastSpell(cid, var)
	if exhaustion.check(cid, "Doble Cero") then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	doCannon(
		cid,
		combat,
		var,
		{ length = 6, height = 3 },
		{ east = 756, west = 756, north = 755, south = 755 }
	)

	exhaustion.set(cid, "Doble Cero", 3)
	return true
end
