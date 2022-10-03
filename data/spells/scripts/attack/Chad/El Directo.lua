local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getFiveShootsFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.0, 0, -65.0, 0)

function onCastSpell(cid, var)
	if hasCreatureCondition(cid, CONDITION_ATTRIBUTES) then
		CustomSpell.randomShoot(
			cid,
			combat,
			5,
			300,
			0,
			{ id = 0, x = 0, y = 0 }
		)
	else
		CustomSpell.randomShoot(
			cid,
			combat,
			5,
			300,
			44,
			{ id = 28, x = 0, y = 0 }
		)
	end
	return true
end
