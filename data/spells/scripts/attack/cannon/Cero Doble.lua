local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatArea(combat, createCombatArea(AREA_BIG_CANNON_6SQM, AREADIAGONAL_BIG_CANNON_6SQM))
onGetFormulaValues = getCannonFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	if exhaustion.check(cid, "special") then
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

	exhaustion.set(cid, "special", COOLDOWN_CANNON)
	return true
end
