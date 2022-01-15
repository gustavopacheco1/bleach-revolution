local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 645)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
setConditionFormula(condition, 1.0, -24, 1.0, -24)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
