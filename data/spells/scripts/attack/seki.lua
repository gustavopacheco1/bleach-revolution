local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_DARKPURPLE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 65)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.0, 0, -10.0, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
