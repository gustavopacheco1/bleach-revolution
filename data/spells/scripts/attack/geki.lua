local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_DARKPURPLE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 26)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.0, 0, -15.0, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
