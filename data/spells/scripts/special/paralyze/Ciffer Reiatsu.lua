local spell = {
	cooldown = 60,
	duration = 2500, -- milisegundos
	effect = 20,
}

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

	doSendMagicEffect(getCreaturePosition(target), spell.effect)

	doMutePlayer(cid, spell.duration, EXHAUST_SPELLGROUP_HEALING)
	doMutePlayer(cid, 800, EXHAUST_SPELLGROUP_SUPPORT)
	doAddCondition(target, condition_paralyze)

	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
