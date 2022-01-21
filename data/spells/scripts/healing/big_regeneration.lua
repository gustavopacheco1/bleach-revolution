local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 150, 100, 490.0, 550.0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
