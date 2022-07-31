local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -101, 0, -101, 0)
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
		{ length = 6, height = 3 },
		{ east = 749, west = 749, north = 750, south = 750 }
	)

	exhaustion.set(cid, "cannon", 3)
	return true
end
