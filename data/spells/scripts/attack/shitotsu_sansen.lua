local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_DARKPURPLE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 22)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15.0, 0, -20.0, 0)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
