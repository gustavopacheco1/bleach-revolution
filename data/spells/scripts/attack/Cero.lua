local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getSingleShootFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local vocations = {
	[11] = {
		missile = 90,
	},
	[21] = {
		missile = 90,
	},
	[6] = {
		missile = 93
	},
}

function onCastSpell(cid, var)
	if exhaustion.check(cid, 270) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local vocation = vocations[getPlayerVocation(cid)]

	CustomSpell.randomShoot(
		cid,
		combat,
		1,
		300,
		vocation.missile,
		{ id = 748, x = 0, y = 0 }
	)

	exhaustion.set(cid, 270, 2)
	return true
end
