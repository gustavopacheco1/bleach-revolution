local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 502)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(condition, -0.5, 0, -0.5, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if exhaustion.check(cid, "special") then
		doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
		return false
	end

	if (not doCombat(cid, combat, var)) then
		return false
	end

	doSendMagicEffect(getCreaturePosition(cid), 35)

	doMutePlayer(cid, 500, EXHAUST_SPELLGROUP_SUPPORT)
	exhaustion.set(cid, "special", 4)
	return true
end
