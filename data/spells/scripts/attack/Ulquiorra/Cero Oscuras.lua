local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -70, 0, -85, 0)
setCombatArea(combat, createCombatArea(AREA_CANNON_6SQM, AREADIAGONAL_CANNON_6SQM))

function onCastSpell(cid, var)
	if exhaustion.check(cid, "Cero Oscuras") then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	doCannon(
		cid,
		combat,
		var,
		{ length = 6, height = 3 },
		{ east = 752, west = 752, north = 751, south = 751 }
	)

	exhaustion.set(cid, "Cero Oscuras", 30)
	return true
end
