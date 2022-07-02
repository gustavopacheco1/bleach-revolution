local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

function onUseWeapon(cid, var)
	doSendMagicEffect(getCreaturePosition(getCreatureTarget(cid)), 30)
	return doCombat(cid, combat, var)
end
