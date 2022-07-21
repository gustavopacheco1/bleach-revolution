local spell = {
	cooldown = 60,
	duration = 2500, -- milisegundos
	effect = 20,
}

local condition_muted = createConditionObject(CONDITION_MUTED)
setConditionParam(condition_muted, CONDITION_PARAM_TICKS, spell.duration)

local condition_paralyze = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition_paralyze, CONDITION_PARAM_TICKS, spell.duration)
setConditionFormula(condition_paralyze, -0.5, 0, -0.5, 0)

function onCastSpell(cid, var)
	if exhaustion.check(cid, "special") then
		doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
		return false
	end

	local target = getCreatureTarget(cid)

	if not (isPlayer(target)) then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"You may only use this technique in players.",
			"Você só pode utilizar esta técnica em players."
		)
		return false
	end

	doAddCondition(target, condition_muted)
	doAddCondition(target, condition_paralyze)
	doSendMagicEffect(getCreaturePosition(target), spell.effect)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
