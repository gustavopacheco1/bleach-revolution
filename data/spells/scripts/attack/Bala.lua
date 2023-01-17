local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getFiveShootsFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local vocations = {
	[21] = {
		missile = 93,
	},
	[24] = {
	    missile = 93,
	},
	[30] = {
	    missile = 93,
	},
	[38] = {
	    missile = 93,
	},

function onCastSpell(cid, var)
	CustomSpell.randomShoot(
		cid,
		combat,
		5,
		300,
		vocation.missile,
		{ id = 748, x = 0, y = 0 }
	)
	return true
end
