local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100, 0, -120, 0)
setCombatArea(combat, createCombatArea(AREA_BIG_CANNON_6SQM, AREADIAGONAL_BIG_CANNON_6SQM))

function onCastSpell(cid, var)
	if exhaustion.check(cid, "cannon") then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end

	doCannon(
		cid,
		combat,
		var,
		{ length = 6, height = 3 },
		{ east = 758, west = 758, north = 757, south = 757 }
	)

	exhaustion.set(cid, "cannon", 30)
	return true
end
