local spell = {
    cooldown = 50,
    duration = 3,
    effect = 20,
}

local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, spell.duration * 1000)

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
    doAddCondition(target, condition)
	exhaustion.set(cid, "special" , spell.cooldown)
	return true
end
