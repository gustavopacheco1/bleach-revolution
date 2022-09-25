local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
onGetFormulaValues = getSingleShootFormula
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	if exhaustion.check(cid, 270) then
		doPlayerSendCancel(cid, "You are exhausted.")
		return false
	end

	local target_position = getCreaturePosition(getCreatureTarget(cid))
	doSendMagicEffect({
		x = target_position.x + 1,
		y = target_position.y + 1,
		z = target_position.z
	}, 730)

	doSendMagicEffect({
		x = target_position.x + 3,
		y = target_position.y,
		z = target_position.z
	}, 26)

	exhaustion.set(cid, 270, 2)
	return doCombat(cid, combat, var)
end
