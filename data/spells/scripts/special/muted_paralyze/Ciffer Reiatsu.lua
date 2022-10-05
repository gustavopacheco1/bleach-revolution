local spell = {
	cooldown = 2,
	duration = 2500, -- milisegundos
	effect = 230,
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

	if isPlayer(target) then
		doMutePlayer(target, spell.duration, EXHAUST_SPELLGROUP_HEALING)
		doMutePlayer(target, 800, EXHAUST_SPELLGROUP_SUPPORT)
	end

	doAddCondition(target, condition_paralyze)
	doSendMagicEffect(getCreaturePosition(target), spell.effect)

	doMutePlayer(cid, spell.duration, EXHAUST_SPELLGROUP_ATTACK)
	exhaustion.set(cid, "special", spell.cooldown)
	return true
end
