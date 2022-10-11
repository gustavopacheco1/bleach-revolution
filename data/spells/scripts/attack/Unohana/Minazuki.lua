local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PINK)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getFiveShootsFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
		CustomSpell.randomShoot(
			cid,
			combat,
			4,
			300,
			57,
			{ id = 746, x = 0, y = 0 }
		)
	end
	return true
end
