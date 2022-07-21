local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 565)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(condition, -0.5, 0, -0.5, 0)
setCombatCondition(combat, condition)

local support_exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(support_exhaust, CONDITION_PARAM_SUBID, EXHAUST_SPELLGROUP_SUPPORT)
setConditionParam(support_exhaust, CONDITION_PARAM_TICKS, 800)
setCombatCondition(combat, support_exhaust)

function onCastSpell(cid, var)
	if exhaustion.check(cid, "special") then
		doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") "s")
		return false
	end

	if (not doCombat(cid, combat, var)) then
		return false
	end

	doSendMagicEffect(getThingPosition(cid), 35)
	exhaustion.set(cid, "special", 30)
	return true
end
