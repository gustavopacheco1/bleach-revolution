local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80, 0, -100, 0)
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCannonFormula")

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
		{ east = 597, west = 597, north = 747, south = 747 }
	)

	exhaustion.set(cid, "cannon", 30)
	return true
end
